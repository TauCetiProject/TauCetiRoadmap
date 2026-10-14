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
Scholze's Proposition 6.4(iv) from pseudocoherent modules and standard étale presentations. Layer A4
builds the tower of finite étale torsors of an analytic adic space over `Spa ℤ_p`, proves its
uniform completion perfectoid (Scholze's Lemma 15.3) and assembles the perfectoid torsor
presentation from which DiamondsAndVStacks layer D6 builds the diamond and identifies the étale
sites (Scholze's Proposition 15.4, Definition 15.5, Lemma 15.6).

Scholze's *Étale cohomology of diamonds* builds diamonds out of perfectoid spaces and then compares
the étale site of an analytic adic space with that of its diamond. Before that comparison can be
stated, the adic side needs its own étale geometry in a generality beyond Huber's noetherian
setting: finite étale algebras over arbitrary complete Tate rings, étale morphisms defined by a
local description, the étale, finite étale and pro-étale sites with their points, the presentation
of non-sheafy spaces, the nonnoetherian approximation statement of Scholze's Proposition 6.4(iv), and the
tower of finite étale torsors whose uniform completion is perfectoid (Scholze's Lemma 15.3).
These are the targets of this roadmap. It begins after the Foundations of adic spaces roadmap
(`TauCetiRoadmap/AdicSpaces/README.md`, called AdicSpaces below) and the analytic and formal geometry roadmap
AdicSpacesPartII; it ends with the analytic input that DiamondsAndVStacks layer D6 consumes: the
perfectoid torsor presentation of an analytic adic space over `Spa ℤ_p`, from which the
diamondification functor and the identification of the étale sites (Scholze's Proposition 15.4,
Definition 15.5 and Lemma 15.6) are built there.

The ordinary morphism theory (completed tensor products, fibre products, separated, proper,
finite, smooth and étale morphisms in Huber's sense, analytification and formal models) is
AdicSpacesPartII's; layers A0 and A2 are the comparison interfaces that identify it on the same
carriers.

| Layer | Title | What it builds |
|---|---|---|
| A0 | Completed tensor products and the fibre products actually used | the contract with AdicSpacesPartII layer R0: completed tensors, uniformisation, analytic pullbacks, analytic loci of non-Tate spaces |
| A1 | Finite étale and étale geometry | finite étale algebras and morphisms, étale morphisms by local description, the étale, finite étale and pro-étale sites, geometric points, strict localisations, Yoneda-adic presentations |
| A2 | Separatedness, smooth charts, and classical analytic geometry | the contract with AdicSpacesPartII layers R0–R1 and AdicSpacesPartIII layers F0/R2; relative polydiscs and tori, smooth morphisms by ball charts, dimension of adic spaces |
| A3 | The nonnoetherian affinoid étale approximation input | pseudocoherent modules, the closed embedding into a relative ball, perturbation lemmas, Scholze's Proposition 6.4(iv) |
| A4 | Analytic adic presentations for diamondification | uniform completion and étale invariance, the finite étale torsor tower, perfectoidness, the perfectoid cover presentation |

```text
AdicSpacesPartII R0–R1, AdicSpacesPartIII F0/R2 → A0
A0, AdicSpacesPartII R0, AdicSpacesPartIII R3, DiamondsAndVStacks D0 → A1
A1, AdicSpacesPartII R0–R1, AdicSpacesPartIII F0/R2 → A2   (A2.7 alone also compares with AdicSpacesPartIV R4's analytification/étale-site statements)
A1, AdicSpacesPartII R0, AdicSpacesPartIII R3, AdicSpacesPartIV R5.6–R5.8 (generic stable bases), PerfectoidSpaces P1–P3, P5 (finite-stage inputs) → A3
A4.2 (finite étale torsor algebra, canonical Galois map) → PerfectoidTowers P9.10's algebraic subtarget *finite-galois-descent-of-modules* only → A4.5 (effective descent along the completed tower)
A1, A3, A4.2, AdicSpacesPartII R0, PerfectoidSpaces P1–P3, P5–P6 → A4 (completed tower, self-product, perfectoid presentation) → PerfectoidTowers P9.4–P9.5 (applications to prescribed towers and their Čech nerves)
A4.8–A4.9 (analytic presentation interfaces) → DiamondsAndVStacks D6
```

The arrows are subsection-level and acyclic: AdicSpacesPartIV R4 and R5.1–R5.5 *consume* A1's
sites and re-export them, so they are not suppliers of A0 or A1; A3's affinoid-étale
approximation and assembly interface is consumed by PerfectoidSpaces P6 and by A4; A4's analytic
torsor presentation precedes DiamondsAndVStacks D6. PerfectoidTowers P9.4–P9.5 are *consumers* of A4's
*finite-etale-torsor-tower*, *completed-tower-pair*, *perfectoid-cover-presentation* and
self-product comparison, not suppliers; the only P9 input of A4 is the algebraic finite-group
module-descent subtarget of P9.10, which uses A4.2 and nothing later, and its character-sheaf and
coefficient applications in the same subsection are not prerequisites. A whole-folder import in
the opposite direction never stands in for one of these atomic edges.

## Scope and ownership

The roadmap owns, layer by layer:

- A0: the comparison interface between AdicSpacesPartII's completed tensor product of complete
  Huber pairs and the pushout and fibre-product shapes that the étale geometry uses — the pushout
  square of complete Huber pairs, uniformisation supplied separately, the tracking of rings of
  definition, pseudouniformisers and plus rings, the restatement as contract clauses of R0's
  pullbacks along rational open immersions and along finite étale maps and of its chart
  independence, associativity, symmetry and unit, the universal property of maps into affinoids,
  and the analytic locus of a non-Tate space with the restriction of morphisms to it. A0 defines
  no new completed tensor product.
- A1: strongly sheafy Huber pairs; the Huber pair of a finite étale algebra over a complete Tate
  ring; finite étale and étale morphisms of analytic adic spaces by Kedlaya–Liu's local description,
  with the comparison to Huber's definitions on locally noetherian spaces and the stability
  properties; the étale and finite étale sites; geometric points (with the completed residue field
  of a point), enough points and strict localisations; the finite étale fundamental group;
  Kedlaya–Liu's site of an arbitrary analytic adic space; pro-étale morphisms and the pro-étale
  site with Scholze's corrected covering condition; profinite `G`-sets and the pro-finite-étale
  site; coherence and change of base field; points, with Deligne's theorem on points of coherent
  topoi stated as the input it rests on; and generalized adic presentations (Yoneda-adic spaces)
  of non-sheafy Huber pairs.
- A2: the comparison interface with AdicSpacesPartII's separated, proper and partially proper
  morphisms, and the few objects that roadmap leaves to this one — relative closed polydiscs,
  relative tori, smooth morphisms by ball charts with the comparison to Huber's smooth morphisms,
  compatible toric charts, the dimension of adic spaces and its estimates, analytification and its
  compatibility with the étale site of A1, and the formal schemes and generic fibres in the scope of
  the specialisation theory of the étale-cohomology roadmaps.
- A3: pseudocoherent modules and sheaves over Tate rings, standard étale presentations and the
  implicit function theorem, the Fargues–Scholze specialisations by analytic algebra, the closed
  embedding of an affinoid étale object into a relative ball, finite-stage approximation and
  Scholze's Proposition 6.4(iv).
- A4: rings without nonsplit finite étale covers, finite étale torsors and the finite étale torsor
  tower, invariance of spectra and finite étale algebras under uniformisation, the completed tower
  with its finite étale data, perfectoidness of the completed tower, adic spectra of the tower, the
  perfectoid torsor presentation, and the comparison interfaces with diamonds.

AdicSpaces (layers 0–5, with 6.1 for `A_inf`) and AdicSpacesPartII (layers R0–R1) are the owners of Huber pairs,
adic spaces, the completed tensor product, uniformisation, fibre products and Huber's morphism
theory. AdicSpacesPartIII owns formal schemes, generic fibres and relative differential sheaves;
AdicSpacesPartIV owns the R4 site applications and R5 sousperfectoid theory. A0 and A2 add only comparisons and the objects named above (relative polydiscs and tori,
smooth morphisms by ball charts, dimension). PerfectoidSpaces layers P1–P5 own perfectoid Tate
rings, rational localisation, almost purity and cofiltered limits with the finite-stage descent of
Scholze's Proposition 6.4(o)–(iii), which A3 imports; its layer P2 owns the perfectoid pullback theorem.
DiamondsAndVStacks layer D0 owns the pro-categories, cofiltered limits of spectral spaces and the
qcqs vocabulary of algebraic topoi (D0.17) that A1 uses, and its layer D6 owns `Spd`, the representability
of diamonds and the identification of the étale sites of Scholze's Proposition 15.4, Definition 15.5
and Lemma 15.6. A1 owns Deligne's theorem on points of coherent topoi, with its SGA 4 locator.
Derived étale cohomology of the sites belongs to the étale-cohomology roadmaps that
import this one: the sites built here are geometric sites, not definitions of derived cohomology;
the affinoid perfectoid basis of the pro-étale site belongs to the `A_inf`-cohomology roadmap.
AdicSpacesPartIV layer R4 re-exports the sites of A1 on its carriers — the étale slice site, the
pro-étale slice site and the functoriality of the étale site are stated here and re-exported there
(*etale-slice-site*, *proetale-slice-open-subspace*, *etale-site-functoriality*) — and layer R5
consumes them and re-exports A1's reduction of étale coverings on an arbitrary stable basis
(*stable-basis-covering-reduction*). PerfectoidSpaces cites rather than restates three results of
this roadmap: finite étale algebras over a filtered colimit of rings
(*finite-etale-algebras-filtered-colimit*), the finite étale Galois torsors with
`|Spa B|/G ≅ |Spa A|` and their completed towers (*torsor-spa-orbits*, *spa-of-completed-tower*),
of which PerfectoidTowers layer P8's quotient theorems are the non-free generalisation, and the compatibility
clause of the assembled Proposition 6.4 (*etale-descent-to-finite-stage-6-4*), which its layer P6
(*affinoid-etale-finite-stage-assembly*) records from its side. PerfectoidSpaces layers P0–P7 and PerfectoidTowers layers P8–P9,
DiamondsAndVStacks layers D2–D6 and the `p`-adic Hodge theory, adic-coefficient and relative
Fargues–Fontaine roadmaps import the layers named in their own documents.

Already stated or built elsewhere, and cited in this roadmap rather than restated:

- the set-level preimage of a rational subset along an adic morphism of complete Huber pairs —
  AdicSpacesPartII layer R0 (*completed-tensor-rational-localisation*); the open subspace `g⁻¹(U)` as the fibre product
  `Y ×_X U` — AdicSpaces layer 5; the open disc over a non-adic base — R0
  (*fibre-product-along-finite-type*);
- the base change of a finite algebra over a complete Tate ring without completion, its plus ring
  and its rational preimages — R0 (*finite-algebra-tensor-complete*), with `Spa` of the result as
  a fibre product — R0 (*affinoid-fibre-product*);
- the affinoid charts of the glued fibre product and their restriction to rational subsets — R0
  (*fibre-products-existence*, *affinoid-fibre-product*, *completed-tensor-rational-localisation*);
- finite étale algebras over a completed direct limit of complete Tate rings come from a finite
  stage — PerfectoidSpaces layer P3 (*finite-etale-completed-direct-limit*);
- Huber's smooth morphisms are locally étale over relative polydiscs, with the rank of `Ω` and the
  closure-of-the-point refinement over a field — R0 (*smooth-local-structure*,
  *smooth-differentials-locally-free*, *smooth-toric-chart*);
- the relative affine space as the increasing union of polydiscs, with the torus inside it —
  AdicSpacesPartII layer R1 (*affine-chart-analytification*, *analytic-affine-space*);
- tilting commutes with cofiltered limits of affinoid perfectoid spaces and with the affinoid
  étale categories — PerfectoidSpaces layers P1 (*completed-colimit-of-perfectoid-tate-rings*),
  P5 (*completed-colimit-is-perfectoid*) and P3 (*etale-site-tilting-equivalence*);
- the point-set and Krull-dimension clauses of the analytic locus and of the dimension theory, and
  the ring-level clauses of A3's natural topology, Laurent-series and flatness statements, which
  are Tau Ceti lemmas named in their targets and in the supplier contracts below.

Where a clause of a target of this roadmap is a statement of a sibling roadmap in a special case
(the locally noetherian, strongly noetherian, sousperfectoid or perfectoid case), the target says
so by label and states in one clause what remains its own.

## Conventions

1. Huber pairs, completeness (which includes Hausdorff) and adic spaces are AdicSpaces's; morphism
   classes in Huber's sense are AdicSpacesPartII's.
2. Finite étale and étale morphisms of analytic adic spaces are defined by the local description
   (Kedlaya–Liu, Definition 8.2.16): locally an open immersion, a finite étale morphism and an open
   immersion. On locally noetherian analytic spaces they agree with Huber's (A1).
3. Base change, composition and the sites are stated for strongly sheafy spaces (Hansen–Kedlaya):
   sheafiness alone is not known to survive finite étale extension. Non-sheafy spaces are handled as
   Yoneda-adic spaces (sheaves on complete Huber pairs glued from sheafified spectra).
4. Pro-étale coverings follow Scholze's erratum: a covering map is a transfinite tower of pullbacks
   of finite étale surjections followed by an étale map; the deleted Corollary 3.8 (called Proposition 3.8 in the erratum), the
   conservativity claim and the deleted last sentence of Proposition 3.13 of the 2013 paper are
   never used; its point morphisms `i_x` are A1's *proetale-fibre-morphism-of-topoi*.
5. Geometric points are morphisms `Spa(C, C⁺) → X` with `C` complete algebraically closed and `C⁺`
   of any rank; nothing is tested only on rank-one points.
6. The dimension of an adic space is the topological Krull dimension of its underlying space
   (Mathlib `topologicalKrullDim`).
7. Names: ring-level declarations in `Huber`, geometry in `AdicSpace`, Yoneda-adic spaces in
   `YonedaAdicSpace` (the site in `CAff`), all under Tau Ceti's root namespace; the names below omit that prefix. The
   declarations of `Suggested.lean` carry the same names inside `TauCetiRoadmap.AdicEtaleGeometry`.
   A backticked name attached to a target of this roadmap is the name proposed for that piece of API.
   It is a declaration of `Suggested.lean` exactly when the target's `Lean:` note lists it. A target
   that ends with the note "README only (no Lean declaration)", and every clause that a `Lean:`
   note leaves out, is specified in this README only.
8. Each target below is written with its hypotheses in the sentence, its source locator in
   parentheses (short keys are resolved in the References), its API as named lemmas and its unit
   tests as `Checks`. A Check is named by an italic tag; when its target is formalised, the Check
   becomes an `example` carrying that tag in its docstring. A target's label `(*slug*)` is the name
   by which later targets, sibling roadmaps and the Lean file refer to it.
9. Check fixtures. Several Checks share named test objects, proposed as namespaces of `example`s
   and specified in this README only: `SplitChecks`, the split `n`-sheeted cover
   `Spa(ℚ₂ⁿ, ℤ₂ⁿ) → Spa(ℚ₂, ℤ₂)` with its sheets (points, components) numbered `0, …, n − 1` and the
   three-cycle `f ↦ (i ↦ f(i + 1))` of `ℚ₂³` with its `Spa` map (which moves sheet `i` to sheet
   `i + 1`); `DiscChecks` and `DoubleDiscChecks`, the closed and open unit discs over `ℚ₂` and two
   closed discs glued along the open disc; `CantorChecks`, `CompletionChecks` and
   `ValuationSwapChecks`, described where they are used. Phrases such as "sheet 0", "the split
   two-sheeted cover" and "the three-cycle" in the Checks refer to these fixtures.

The `IsLimit`/`IsTerminal` witnesses `ProEtale.ProEt.space_isLimit`, `ProEtale.ProEt.final_isTerminal`, `FieldBaseChangeSystem.spaceCone_isLimit` and `FieldBaseChangeSystem.proObjectCone_isLimit`, and the unique terminal map `ProEtale.ProEt.toFinal`, are exempt from three discriminating Checks because their types are subsingletons; the cone maps and terminal objects carry the computational content.

**Checks.** These checks fix the sign, order and transport conventions used throughout.

- *cech_two_pieces* — The first differential of the augmented Čech complex of
  *pseudocoherent-tate-acyclicity*, on two copies of the unit rational chart, sends (1,0) to −1 on
  their ordered overlap.
- *koszul_two_equations* — For Q[X₀,X₁]/(X₀,X₁), the two Koszul differentials of
  *koszul-regular-sequence-fpd* satisfy d₂(1) = (−X₁,X₀),
  d₁(1,0) = X₀, d₁(0,1) = X₁ and d₁(d₂(1)) = 0. The conormal basis of that target
  sends the classes of X₀ and X₁ to their
  respective basis vectors.
- *inverse_action_three* — For the ring action of ℤ/3 on Q₂³ whose generator is the cyclic
  shift `f ↦ (i ↦ f(i + 1))`, transport of valuations by the inverse generator sends the point of
  `Spa(ℚ₂³, ℤ₂³)` at coordinate 0 to the point at coordinate 2. It agrees with the square of the
  `Spa` map of the shift (which moves coordinate `i` to coordinate `i + 1`) on that point and
  differs from the forward geometric map.
- *galoisTensorMap_inverse_support*: on the regular ℤ/3 torsor, 1 ⊗ δ₂
  evaluates under `Algebra.galoisTensorMap` to 1 at group coordinate 2 and the identity point,
  and to 0 at group coordinate 1. With `G` acting on points of spectra by transport of structure,
  `(g·v)(b) = v(g⁻¹·b)`, the ring map `b ↦ (g ↦ g·b)` therefore induces `(g,x) ↦ g⁻¹·x` on
  spectra; on an actual Galois map this is A4's *galois_convention_three*.

## Exact supplier contracts

`Suggested.lean` imports Mathlib, the Tau Ceti modules whose declarations it uses,
`TauCetiRoadmap.AdicSpacesPartIII.Suggested` (which brings part II's R0 chart and morphism
interfaces and part III's interfaces) and `TauCetiRoadmap.PerfectoidSpaces.Suggested`.
The perfectoid Tate-ring predicate is the one PerfectoidSpaces owns and every roadmap shares,
`Perfectoid.IsPerfectoidTateRing` (the Frobenius condition of PerfectoidSpaces P1.1); the
conclusion of Lemma 15.3 in A4 (*perfectoid-uniform-completion*) is stated with it.
`Huber.PerfectoidFrame` and `Huber.IsSousperfectoid` are local statement interfaces of this
README: a perfectoid frame of `R` is a perfectoid Tate ring `R̃` (in the sense of that predicate)
with a continuous ring map `ι : R → R̃` and a continuous `R`-linear retraction of `ι`, which is the
continuous linear retraction condition of AdicSpacesPartIV R5, and `R` is sousperfectoid if it is
a Tate ring admitting a perfectoid frame. R5 owns the sousperfectoid API; these local hypotheses let A1 supply the
sites used by part IV without a Lean import of part IV.

### From Mathlib

Étale, smooth and unramified algebras (`Algebra.Etale`, `Algebra.Smooth.flat`,
`Algebra.Etale.baseChange`, `Algebra.FormallyUnramified`), finite and finitely presented modules
(`Module.Finite`, `Module.FinitePresentation`, `Module.Flat.projective_of_finitePresentation`),
faithful flatness (`Module.FaithfullyFlat`), the module topology (`IsModuleTopology`), split
algebras and semiring actions (`Algebra.IsFiniteSplit`, `MulSemiringAction`), integral closure,
pushouts and pullbacks (`CategoryTheory.IsPushout`, `IsPullback`, `Limits.pullbackAssoc`,
`pullbackSymmetry`, `IsPushout.paste_horiz`), Grothendieck topologies, sheaves, points and
`HasEnoughPoints`, continuous actions of profinite groups (`ContAction Profinite G`), sheaf
cohomology (`Sheaf.H`), multivariate power series with derivations (`MvPowerSeries.pderiv`), the
topological Krull dimension (`topologicalKrullDim`, `Topology.IsInducing.topologicalKrullDim_le`,
`IsHomeomorph.topologicalKrullDim_eq`), nonarchimedean normed fields
(`NontriviallyNormedField`, `IsUltrametricDist`, `CompleteSpace`), direct limits of rings
(`Ring.DirectLimit`), henselian rings (`HenselianRing`, `IsAdicComplete.henselianRing`),
continuity of linear maps for the module topology (`IsModuleTopology.continuous_of_linearMap`)
and the projective dimension of quotients by regular sequences in noetherian local rings
(`projectiveDimension_quotient_eq_length`,
`projectiveDimension_quotient_eq_add_length_of_isWeaklyRegular`). The site of A1.16 uses
`CategoryTheory.Coverage`, `Coverage.toGrothendieck`, `Presieve.isSheaf_coverage`,
`presheafToSheaf` (left exact), `sheafificationAdjunction`, `uliftYonedaEquiv`,
`CostructuredArrow` and `DiscreteUniformity` directly; A4 uses `PadicComplex.isAlgClosed`,
`HenselianLocalRing`, `IsSepClosed.of_isAlgClosed`, `PadicInt.isUnit_iff`, `LocallyConstant`,
`ProfiniteGrp`, `DirectLimit` and `DualNumber`.

| Declaration | File | A1 use |
|---|---|---|
| `CategoryTheory.PreGaloisCategory.functorToContAction`, its `IsEquivalence` instance | `Mathlib/CategoryTheory/Galois/Equivalence.lean` | The finite-set equivalence, using `smallFiniteEtale.isFiberFunctor`; the action is evaluation of natural automorphisms. |
| `CategoryTheory.PreGaloisCategory.autEmbedding_isClosedEmbedding`, together with the `CompactSpace (Aut F)` and `TotallyDisconnectedSpace (Aut F)` instances | `Mathlib/CategoryTheory/Galois/Topology.lean` | The topology of `fundamentalGroup` directly inherits compactness and total disconnectedness. |
| `CategoryTheory.Limits.PullbackCone.IsLimit.lift_fst`, `CategoryTheory.Limits.PullbackCone.IsLimit.lift_snd` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/PullbackCone.lean` | Projection equations for `FibreProduct.lift`, directly from its `isLimit` field. |
| `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso`, `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_hom_comp` | `Mathlib/CategoryTheory/Limits/IsLimit.lean` | Unique comparison of two `FibreProduct` cones, fixing both projections. |
| `CategoryTheory.IsPullback`, `CategoryTheory.IsPullback.isLimit`, `CategoryTheory.Limits.LimitCone`, `CategoryTheory.Limits.cospan` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean`, `Mathlib/CategoryTheory/Limits/HasLimits.lean`, `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Cospan.lean` | `FibreProduct f g` is a `Limits.LimitCone (cospan f g)` with named projections; `⟨P.fst, P.snd, f, g⟩` satisfies Mathlib's `IsPullback`, and `IsPullback.isLimit` recovers `isLimit`. |
| `CategoryTheory.GrothendieckTopology.Point.isCofiltered`, `Point.initiallySmall`, `Point.presheafFiber`, `Point.isColimitPresheafFiberCocone`, `Point.sheafFiber` | `Mathlib/CategoryTheory/Sites/Point/Basic.lean` | Cofiltered neighbourhoods, existence and value of their stalk colimit, and its restriction to sheaves, applied to `GeometricPoint.point`. |
| `CategoryTheory.Ind.yoneda.fullyFaithful` | `Mathlib/CategoryTheory/Limits/Indization/Category.lean` | Fullness and faithfulness of `ProEt.const` follow from this embedding, opposites and composition. |
| `IsModuleTopology.isTopologicalRing` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` | Ring topology on the finite algebra synonym; no new theorem. |
| `eq_moduleTopology` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` | Identification of the canonical module topology. |
| `QuotientGroup.subsingleton_quotient_top` | `Mathlib/GroupTheory/QuotientGroup/Basic.lean` | The Check that `G/G` has one point. |
| `topologicalKrullDim`, `topologicalKrullDim_subspace_le`, `IsHomeomorph.topologicalKrullDim_eq` | `Mathlib/Topology/KrullDimension.lean` | A2 uses dimension and its subspace/homeomorphism API directly. |
| `irreducibleSetEquivPoints` | `Mathlib/Topology/Sober.lean` | A2 specialization chains on quasi-sober T0 spaces. |
| `Order.krullDim_eq_of_orderIso`, `Order.krullDim_eq_iSup_coheight` | `Mathlib/Order/KrullDimension.lean` | A2 chain-length formula; no additional wrapper theorem. |
| `RingTheory.Sequence.IsWeaklyRegular.of_flat` | `Mathlib/RingTheory/Regular/Flat.lean` | A3 weak regularity under flat base change; used directly. |
| `CategoryTheory.HasProjectiveDimensionLE` | `Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean` | A3 agreement Check for `Module.IsFPD` (check *test_projectiveDimension*); a different notion (arbitrary projectives). |
| `ContinuousLinearMap.isClosed_ker` | `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean` | A3 closed kernels after `IsModuleTopology.continuous_of_linearMap`; surjectivity is unnecessary. |
| `StandardEtalePresentation` (root namespace), `Algebra.SubmersivePresentation`, `Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero` | `Mathlib/RingTheory/Etale/StandardEtale.lean`, `Mathlib/RingTheory/Extension/Presentation/Submersive.lean`, `Mathlib/RingTheory/Smooth/StandardSmoothOfFree.lean` | One-variable `R[X]_g/(f)` presentations and algebraic relative-dimension-zero presentations; A3's `Huber.StandardEtalePresentation` has `N` variables, restricted series, closed kernel, quotient topology, integral-closure plus ring and the bound `k`, and uses the submersive presentation only to construct presentations of finite étale algebras. |

### From Tau Ceti

Huber rings and pairs (`Huber.IsHuberRing`, `IsTateRing`, `IsPseudoUniformizer`, `Pair`,
`Pair.Hom`, `PairOfDefinition`, `PairOfDefinition.completionLocalization`,
`PairOfDefinition.locUniformSpace`, `IsStronglyNoetherian`, `restrictedMvPowerSeriesCompletion`,
`IsTopologicallyFiniteType`), the adic spectrum (`ValuationSpectrum.spa`, `rationalSubset`,
`spa_antitone`, `spa_integralClosure`, `Pair.Hom.spaComap`,
`TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset`,
`existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`, `spaLocalizationHomeomorph`),
the analytic locus (`ValuationSpectrum.IsAnalyticPoint`, `spaAnalytic`,
`isOpen_val_preimage_spaAnalytic`, `isCompact_val_preimage_spaAnalytic`,
`spaAnalytic_eq_biUnion_rationalSubset`, `isTateRing_completion_locTopology_of_mem_generators`,
`spaAnalytic_eq_spa_of_isTateRing`, `spaAnalytic_eq_empty_iff_discrete_separationQuotient`),
polydiscs and Gauss points, and the `p`-adic Huber instances (`TauCeti.RingTheory.Huber.Padic`).
Also consumed, each at the target whose clause it supplies: the transport of pseudouniformisers
(`Huber.IsPseudoUniformizer.map`); the module topology of finite modules over Tate rings
(`completeSpace_moduleTopology`, `firstCountableTopology_moduleTopology`,
`IsTateRing.t2Space_moduleTopology`, `IsTateRing.isModuleTopology`, `IsTateRing.isOpenMap`,
`isQuotientMap`, `isStrictMap_of_isClosed_range`, `isClosed_of_module_finite_topologicalClosure`,
`isClosed_of_isNoetherian`, `IsTateRing.exists_presentation_isStrictMap_isOpenMap`); restricted
and Laurent series (`restrictedMvPowerSeriesBaseChangeEquiv`, `id_sub_smul_mulX_injective`,
`smul_id_sub_mulX_injective`, `flat_quotient_algebraMap_sub_restrictedX`,
`flat_quotient_one_sub_algebraMap_mul_restrictedX`); flatness of rational localisation
(`flat_toCompletionLoc`, `flat_restrictionRingHom`, `faithfullyFlat_pi_toCompletionLoc`); rings of
definition (`isPowerBounded_iff_exists_mem_ringOfDefinition`); the valued residue field of a point
(`ValuationSpectrum.residueFieldValuation`, whose completion `k(x)^` is defined in A1); the sheaf
criterion on the rational basis (`TauCeti.ValuationSpectrum.isSheaf_iff_isSheafFor_rationalCover`);
continuous sections of profinite groups (`exists_continuous_section`,
`exists_continuous_section_of_le`, `exists_continuous_rightCosetFactorization`); and dimension
(`topologicalKrullDim_eq_iSup_coheight`, `topologicalKrullDim_eq_iSup_of_isOpenEmbedding`,
`IsPureDimensional`, `isPureDimensional_iff_forall_of_isOpenEmbedding`).

| Declaration | File | A1 use |
|---|---|---|
| Unit-Jacobian Newton | `TauCeti.IsAdicComplete.existsUnique_eq_zero_of_isUnit_det`, `TauCeti/RingTheory/AdicCompletion/Newton.lean` | Supplies the restricted-series Newton case `k = 0` after Taylor linearisation on the ring of definition; the quantitative bounds and functoriality belong to A3. |
| `TauCeti.Huber.IsSheafyRing`, `IsStablySheafyRing` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/SheafyRing.lean` | Sheafiness predicates used by the strong-sheafiness targets. |
| `TauCeti.Huber.isSheafyRing_of_isStronglyNoetherian` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/StronglyNoetherian.lean` | Strongly noetherian sheafiness; combined with the existing restricted-series instance. |
| `TauCeti.AdicSpace`, `PreAdicSpace.IsOpenImmersion`, `PreAdicSpace.isAffinoid`, `ValuationSpectrum.presentationLimitPreAdicSpace`, `TauCeti.ValuationSpectrum.isAdic_presentationLimitPreAdicSpace` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/{Adic,OpenImmersion,Affinoid,PresentationLimit}.lean` | Existing geometric carrier for the named geometric targets of A0.8, A1.3–A1.15, A1.16 (`YonedaAdicSpace.ofAdicSpace`) and A2. |
| `TauCeti.Huber.Pair.Hom.comp_id`, `TauCeti.Huber.Pair.Hom.id_comp`, `TauCeti.Huber.Pair.Hom.comp_assoc`, `TauCeti.Huber.Pair.Hom.continuous_spaComap`, `TauCeti.Huber.Pair.Hom.spaComap_id`, `TauCeti.Huber.Pair.Hom.spaComap_comp` | `TauCeti/RingTheory/Huber/Pair.lean`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/HuberPair.lean` | Category laws of `CAff` and the functor `CAff.spa`, used directly. |
| `TauCeti.Huber.Pair.Hom.isSpectralMap_spaComap_of_isTateRing` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/MorphismSpectral.lean` | Every morphism out of a Tate pair has spectral `Spa`; A4's presentations need no separate spectrality axiom. |
| `TauCeti.Huber.Pair.Hom.isSpectralMap_spaComap` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/MorphismSpectral.lean` | Spectrality when the image of every open ideal is open. |
| `TauCeti.Huber.existsUnique_continuous_ringHom_completion_weightedRestrictedSubring` | `TauCeti/RingTheory/Huber/WeightedEval/Completion.lean` | Continuous evaluation of the completed weighted series ring under `IsWeightBounded`. |
| `TauCeti.Huber.isOpen_powerBoundedSubring` | `TauCeti/RingTheory/Huber/Basic.lean` | The power-bounded subring of a Huber ring is open. |
| `TauCeti.Huber.mem_of_isTopologicallyNilpotent_of_isIntegrallyClosedIn` | `TauCeti/RingTheory/Huber/Pair.lean` | An open integrally closed subring contains the topologically nilpotent elements. |
| `TauCeti.ValuationSpectrum.spa_eq_empty_iff_subsingleton` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Emptiness.lean` | The zero-pair Checks of A1.16. |
| `TauCeti.ValuationSpectrum.isAdic_presentationLimitPreAdicSpace` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean` | Directly constructs `CAff.adicSpa` from `IsSheafyForEveryPresentation.isSheaf`; no additional adicity theorem. |
| `TauCeti.Huber.IsSheafyForEveryPresentation` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/SheafForEveryPresentation.lean` | Pair-level sheafiness in `CAff.isSheafAt_O_iff_isSheafyPair` and *adic-spaces-in-yoneda-adic-spaces*. |
| `TauCeti.Huber.IsTateRing.completion` | `TauCeti/RingTheory/Huber/Completion.lean` | A4: the completion of the colimit of the tower is Tate. |
| `TauCeti.Huber.isPowerBounded_of_isIntegral` | `TauCeti/RingTheory/Huber/PowerBounded.lean` | A4 Check that nilpotents are power-bounded. |
| `TauCeti.topologicalKrullDim_eq_iSup_coheight`, `TauCeti.topologicalKrullDim_eq_iSup_of_isOpenEmbedding` | `TauCeti/Topology/KrullDimension.lean` | A2 specialization dimension and dimension of an open cover. |
| `TauCeti.IsPureDimensional`, `TauCeti.isPureDimensional_iff_forall_of_isOpenEmbedding` | `TauCeti/Topology/PureDimension.lean` | Component dimension; locality requires the explicit `hdim` hypothesis. |
| `TauCeti.Huber.weightedX` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean` | A2 coordinates before completion. |
| `TauCeti.ValuationSpectrum.gaussPoint`, `TauCeti.ValuationSpectrum.closedPolydisc` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/{GaussPoint,Basic}.lean` | A2 Gauss point Check and the field polydisc comparison. |
| `TauCeti.ValuationSpectrum.isOpen_val_preimage_rationalSubset` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basic.lean` | A2: the torus is open in the polydisc chart. |
| `TauCeti.Huber.PairOfDefinition.isHuberRing_completion_locTopology`, `TauCeti.Huber.PairOfDefinition.isTateRing_completion_locTopology_of_isTateRing` | `TauCeti/RingTheory/Huber/LocalizationTopology/Completion.lean` | A3 instances `IsHuberRing`, `IsTateRing` of `Huber.ratLoc`; used directly. |
| `TauCeti.Huber.PairOfDefinition.isRingOfIntegralElements_completedPlusSubring` | `TauCeti/RingTheory/Huber/LocalizationTopology/Plus.lean` | A3 plus ring of `Huber.ratLocPair`; used directly. |
| `TauCeti.Huber.restrictedMvPowerSeriesCompletionEquiv` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Complete.lean:285` | A3 coefficients `Huber.restrictedCoeff` of `A⟨T⟩` for the map of Kedlaya–Liu II Cor. 2.4.9, and the identification of `tateSeries N A` with the Tate algebra over a complete Hausdorff base. |
| `TauCeti.Huber.weightedEval` | `TauCeti/RingTheory/Huber/WeightedEval/Map.lean` | A3 value `F(t)` of a restricted series at a point in the Newton statements (`weightedEval (RingHom.id C₀) t F`). |
| `TauCeti.Huber.PairOfDefinition.weighted`, `PairOfDefinition.weightedRingOfDefinition`, `PairOfDefinition.weightedRingOfDefinitionC`, `TauCeti.Huber.continuous_weightedC` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/PairOfDefinition.lean`, `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean` | A3 ring of definition `A₀⟨X⟩` of the Tate algebra (perturbations of coordinates, Newton with parameters). |
| `TauCeti.completeSpace_moduleTopology` | `TauCeti/Topology/Algebra/Module/Finite.lean:82` | A1: supplies completeness for the right uniformity of the module topology on any finite module over a complete first-countable ring, hence on `FiniteEtale A B`; a Huber base is first countable. Neither étaleness nor Hausdorffness is needed for completeness. A3: natural completeness of a finite module is its Hausdorff property (check *test_iff_t2*). |
| `TauCeti.Huber.PairOfDefinition.restrictionRingHomOfSubset` | `TauCeti/RingTheory/Huber/LocalizationTopology/Restriction.lean:441` | A3 numerator-enlargement restrictions; `ratLocRestriction_of_subset` identifies them with the restrictions used for Čech differentials and descent. |
| `TauCeti.Huber.LaurentSeries.isTateRing` | `TauCeti/RingTheory/Huber/LaurentSeries.lean:224` | The formal Laurent field `𝔽_p((t))` with its `t`-adic topology, used as the coefficient field of the characteristic-`p` annulus Check. |
| `TauCeti.Huber.weightedMapCompletion`, `continuous_weightedMapCompletion` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Completion.lean:164`, `:181` | A1 coefficient inclusion on completed Tate algebras, descended through `TV-1` for the integral Kummer annulus. |
| `TauCeti.Huber.laurentIdeal`, `mk_weightedX_zero_mul_mk_weightedX_one` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Laurent/Basic.lean:90, :106` | The quotient `weightedRestrictedSubring _ _ ⧸ laurentIdeal A` presents the Laurent ring with inverse coordinates; `Huber.restrictedLaurentSeries A` instead takes the quotient of the completed series ring. The generators `1 − TS` and `TS − 1` differ by the unit `−1`. |
| `TauCeti.Huber.twoSidedRestrictedSubmodule`, `twoSidedRestrictedSubmodule.instCommRing` | `TauCeti/RingTheory/Huber/Restricted/TwoSidedSeries/Basic.lean:109`, `TauCeti/RingTheory/Huber/Restricted/TwoSidedSeries/Ring.lean:183` | The Laurent coefficient carrier is definitionally Mathlib `Filter.zeroAtFilterSubmodule A (Filter.cofinite : Filter ℤ)`, with convolution multiplication over a complete Hausdorff base; `restrictedLaurentSeries` uses quotient coordinates instead. A3's `restrictedLaurentSeriesTensorToNull` uses this coefficient carrier directly. |
| `TauCeti.Huber.restrictedMvPowerSeriesCompletionFinZeroEquiv`, `TauCeti.Huber.continuous_restrictedMvPowerSeriesCompletionFinZeroEquiv`, `TauCeti.Huber.continuous_restrictedMvPowerSeriesCompletionFinZeroEquiv_symm` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Completion.lean` | A2 zero-variable topological ring equivalence; the new target tracks plus rings. |
| `TauCetiRoadmap.AdicSpacesPartII.Huber.IsAdicHom.of_isTateRing` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | A continuous map out of a Tate ring is adic; A1 does not restate it. |
| `Algebra.IsFiniteSplit`, `Algebra.IsFiniteSplit.exists_tensorProduct_of_etale` | `Mathlib/RingTheory/TotallySplit.lean` | A4 retains variable-rank total splitting and strengthens a splitting cover to a finite-group torsor. |
| `TauCeti.Huber.isPowerBounded_iff_exists_mem_ringOfDefinition` | `TauCeti/RingTheory/Huber/RingOfDefinition.lean` | A4 cites the directed-union description of power-bounded elements. |
| `IsAdic.isAdicComplete_iff` | `Mathlib/RingTheory/AdicCompletion/Topology.lean` | A4 passes from completeness and the adic subspace topology to adic completeness. |

The proposed `CAff.IsTopologicallyFiniteType` (README only) uses [H94] 3.5(ii), pp. 534–535: the underlying
ring map is topologically of finite type, and there is an open subring `C ⊆ B⁺`
containing the image of `A⁺`, with `A⁺ → C` topologically of finite type and `B⁺`
integral over `C`. This is the pair condition in [H96] 1.2.1(iii), p. 46, used by
`AdicSpace.LocallyOfFiniteType` and the finite-presentation clause of `AdicSpace.Etale`.
Adicness plus `+`-weak finite type does not replace this condition.

### Within AdicEtaleGeometry

| Declaration | File | Use |
|---|---|---|
| `Huber.Pair.polydiscVar`, `Huber.Pair.polydiscPlus`, `Huber.Pair.polydisc` | `Suggested.lean` | A3 uses A2's completed coordinates. A3's coefficient-series ring `Huber.tateSeries` with its plus ring `Huber.tateSeriesPlus` (`Suggested.lean`) has the same plus ring as the polydisc under `restrictedMvPowerSeriesCompletionEquiv`; that comparison is a clause of *standard-etale-presentation* (README only). |
| strict pseudocoherence (*natural-topology-strict-exactness*, *stably-pseudocoherent-module*; README only), `Huber.IsNaturallyComplete` (`Suggested.lean`) | this README | Natural completeness is the second conjunct of strict pseudocoherence, so a stably pseudocoherent module over a complete Tate ring is naturally complete. |
| the effective descent of finite étale algebras along the completed tower (*finite-etale-effective-descent-along-tower*; README only) | this README | A4 applies this theorem to the completed tower underlying the perfectoid torsor presentation of a tower (*perfectoid-cover-presentation*); the presentation needs no separate descent theorem. |

### From AdicSpaces and AdicSpacesPartII–IV

AdicSpaces layers 0–5: Huber pairs, `Spa`, rational subsets, the structure presheaf, sheafiness,
adic spaces, open and closed immersions, morphisms locally of finite type and gluing.
AdicSpacesPartII layer R0: the completed tensor product with its universal property and
uniformisation, affinoid and global fibre products, adic morphisms, the finite-type classes,
separated, proper and partially proper morphisms, finite and quasi-finite morphisms, continuous
differentials, smooth and étale morphisms in Huber's sense; layer R1: analytification. AdicSpacesPartIII layers F0/R2 own
formal schemes and generic fibres, and layer R3 owns finite projective modules, trace forms and
relative differential sheaves. AdicSpacesPartIV layer R5 owns sousperfectoid rings (sheafy bases for the statements of A3 whose
sources need one). The targets of those layers that this roadmap cites by label are: R0
*completed-tensor-product*, *completed-tensor-product-universal-property*,
*completed-tensor-rational-localisation*, *completed-tensor-restricted-power-series*,
*uniformization*, *uniform-completed-tensor-product*, *adic-hom-choice-independence*,
*adic-iff-analytic-locus*, *spa-comap-analytic-locus*, *affinoid-fibre-product*,
*fibre-product-along-finite-type*, *fibre-products-existence*, *fibre-product-points*,
*finite-algebra-over-affinoid*, *finite-algebra-tensor-complete*,
*finite-etale-algebra-comparison*, *open-embedding-etale*, *etale-smooth-composition*,
*etale-smooth-cancellation*, *etale-smooth-locality*, *smooth-etale-base-change*,
*infinitesimal-criteria*, *diagonal-locally-closed*, *smooth-morphism-open*,
*etale-local-open-finite-etale-factorisation*, *etale-local-structure*,
*etale-presentation-perturbation*, *smooth-local-structure*, *smooth-differentials-locally-free*,
*smooth-toric-chart*, *restricted-power-series-smooth*, *conormal-sequence*,
*proper-iff-partially-proper-quasi-compact*, *separated-morphism*,
*separated-diagonal-closed-embedding*, *adic-valuation-rings-and-centres*,
*valuative-criterion-separated*, *separated-proper-partially-proper*, *closed-embedding-proper*,
*finite-morphisms*, *proper-comp*, *proper-base-change*, *strict-complex-completion-exact*,
*noetherian-rod-module-topology-strict*; R1 *affine-chart-analytification*,
*analytic-affine-space*, *affinoid-domain-equidimensional*; R2 *generic-fibre-functor-d*, *noetherian-formal-scheme-as-adic-space*,
*specialisation-map*; R3 *rational-covering-reduction*, *sheafy-cech-acyclicity*,
*finite-projective-module-acyclicity*, *sheafy-tate-acyclicity-and-kiehl-gluing*,
*tate-kiehl-affinoid*, *surjection-small-perturbation*; R4 *etale-site-functoriality*,
*etale-slice-site*, *proetale-slice-open-subspace*, *analytification-etale-site*; R5
*sousperfectoid-etale-stability*, *sousperfectoid-stably-adic*, *sousperfectoid-annulus*,
*stable-basis-covering-reduction*, *stable-basis-etale-vector-bundles*.

| A2 entry point | Supplier | Contract |
|---|---|---|
| Formal generic fibre and analytic-locus comparison (*formal-generic-fibre-analytic-locus*) | `TauCetiRoadmap.AdicSpacesPartIII.FormalScheme.genericFibre`, `FormalScheme.genericFibre.lift`, `FormalScheme.genericFibre.lift_unique`, `FormalScheme.genericFibre_isAnalytic`, `FormalScheme.specialisation`, named in AdicSpacesPartIII's README (*generic-fibre-functor-d*); [Part III R2.3](../AdicSpacesPartIII/README.md#r23-generic-fibres) | R2 owns the functors `t` and `d`, their universal properties and gluing, including `d(𝔛) ≅ t(𝔛)_a` for locally noetherian formal schemes, respecting specialisation, open formal subschemes and adic morphisms. |
| Power-series and restricted-power-series generic fibres | `TauCetiRoadmap.AdicSpacesPartIII.FormalScheme.ofSpf`, `FormalScheme.genericFibre`, `FormalScheme.genericFibre.lift`, `FormalScheme.genericFibre.lift_unique`, named in AdicSpacesPartIII's README; [Part III R2.3](../AdicSpacesPartIII/README.md#r23-generic-fibres) | A2.9 uses the `(p,T)`-adic topology on `ℤ_p⟦T⟧` and the `p`-adic topology on `ℤ_p⟨T⟩`. The open-disc and closed-disc comparisons are Part III's generic-fibre targets. |

The completed-tensor universal mapping property, compatibility of the two base maps and
density of elementary tensors are AdicSpacesPartII R0's (*completed-tensor-product*,
*completed-tensor-product-universal-property*: the lift, `inl_comp` and `denseRange_tmul` of
R0's `Huber.Pair.completedTensor`, named in R0's README); in this roadmap's `Suggested.lean` they
enter as `Huber.IsCompletedPushout` and `Huber.exists_isCompletedPushout`. Boundedness of the
uniform completed tensor and its universal property (lift, compatibility with `inl`, uniqueness)
are R0's *uniform-completed-tensor-product*.
These contracts are used directly. The rational-localization equivalence of A0.4 identifies
the completed tensor with the localized carrier; the finite-étale equivalence of A0.5 restates
R0's bijectivity of the completed tensor map for a finite algebra (*finite-algebra-tensor-complete*)
for a finite étale algebra with its module topology (no plus rings, `B` on the left) and adds the
inverse and the comparison of topologies (R0's comparison of the module and tensor topologies
treats the uncompleted tensor). R0's plus-ring formula takes the integral closure in
`B ⊗_A C`; A0's clause (ii) of *supplier-contract-fibre-products* takes it in the completion. R0's
tests *completedTensor_test_not_adic* and *completedTensor_test_polydisc*, the non-adic
`ℤ_p → ℤ_p⟦X⟧` of *adic-ring-homomorphism*, the non-finite identity `(A, A⁺) → (A, A'⁺)` of
*finite-huber-pair-hom*, and the polydisc, `ℂ_p` and Galois cases of
*uniform-completed-tensor-product* are cited by A0's Checks and not restated. A4 applies R0's
plus ring and boundedness of the
uniformisation (*uniformization*) and AdicSpacesPartII's `IsAdicHom.of_isTateRing` to the colimit
pair of its tower; A2's base change of polydiscs is R0's restricted-power-series case of the
completed tensor product (*completed-tensor-restricted-power-series*) at weights `1` with the
factors exchanged, for an adic structure map (`IsAdicHom`). The affinoid case of the surjectivity on
points of Yoneda-adic fibre products is R0's *fibre-product-points*, whose global form is
AdicSpacesPartII's `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.exists_pullback_point`.

Pseudouniformisers are carried forward by `TauCeti.Huber.IsPseudoUniformizer.map` in
`TauCeti/RingTheory/Huber/Basic.lean`. Rational preimages are
`TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset` in
`TauCeti/AlgebraicGeometry/AdicSpace/Spa/HuberPair.lean`; this applies also to finite étale maps
and to the torsor-presentation map. Dimension along an open covering is
`TauCeti.topologicalKrullDim_eq_iSup_of_isOpenEmbedding` in
`TauCeti/Topology/KrullDimension.lean`.

| Interface | Supplier | Carrier used here |
|---|---|---|
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Chart`, `AdicSpace.Affinoid`, `AdicSpace.HomChart` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Complete sheafy affinoids, their open embeddings `Chart.ι`, and commuting morphism charts. Coefficients and plus rings are fields of `Chart.affinoid`. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsAdic`, `AdicSpace.IsFinite`, `AdicSpace.LocallyOfFiniteType` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Adic ring maps, finite whole affinoid inverse images, and local finite type with the integral plus ring. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Etale`, `AdicSpace.Smooth` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Finite presentation and infinitesimal lifting on `HomChart`. The analytic and locally noetherian hypotheses in A1/A2 are separate assumptions of the comparisons `AdicSpace.IsEtaleLocalDescription.iff_etale` and `AdicSpace.IsLocallyEtaleOverPolydisc.iff_smooth`. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsClosedImmersion`, `AdicSpace.IsSeparated`, `AdicSpace.IsPartiallyProper`, `AdicSpace.IsProper` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Quotient charts, closed diagonals, universal specialization and properness, with their stated finite-type and stable-sheafiness conditions. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsAnalytic`, `AdicSpace.HasStablySheafyCharts` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Analyticity means Tate affinoid neighbourhoods; stable sheafiness means stably sheafy affinoid neighbourhoods. |
| `TauCetiRoadmap.AdicSpacesPartIII.AdicSpace.relativeDifferentials`, `AdicSpace.relativeDifferentials.d`, `AdicSpace.relativeDifferentials.affinoidIso` | AdicSpacesPartIII's README (R3.6, *sheaf-of-continuous-differentials*) | The relative continuous differential sheaf on locally noetherian analytic spaces. This roadmap's proposed `AdicSpace.relativeDifferentials.continuousIso` (A2, README only) uniquely identifies the local module and derivation with this representing sheaf; the affinoid comparison uses Part II continuous differentials. |

### From TauCetiRoadmap.PerfectoidSpaces and DiamondsAndVStacks

PerfectoidSpaces layer P1: perfectoid Tate rings and tilting
(*completed-colimit-of-perfectoid-tate-rings*,
*perfectoid-condition-independent-of-pseudouniformizer*,
*frobenius-surjectivity-criterion*, *integral-elements-adically-complete*); layer P2: perfectoid
rational localisation, fibre products and the uniform completed tensor product of perfectoid rings
over any Tate base (*uniform-completed-tensor-of-perfectoid-over-any-base*); layer P3: almost
purity, the henselian finite étale comparison and its corollaries
(*henselian-pairs-colimits-and-completions*, *finite-etale-completed-direct-limit*,
*henselian-finite-etale-approximation*, *approximate-solutions-over-complete-rings*,
*finite-etale-over-uniform-is-uniform*, *etale-site-tilting-equivalence*,
*etale-almost-acyclicity*);
layer P5: cofiltered limits and the finite-stage descent of Scholze's Proposition 6.4(o)–(iii)
(*cofiltered-limits-of-affinoid-perfectoid-spaces*, *completed-colimit-is-perfectoid*,
*spa-of-filtered-colimit-of-tate-pairs*, *descent-of-quasicompact-opens*,
*limit-restriction-to-rational-subsets*); layer P6: the product of an affinoid perfectoid space with
a profinite set (*product-with-profinite-set*).
PerfectoidTowers layer P9: the finite-group form of faithfully flat module descent and Galois
towers with perfectoid limit (*finite-galois-descent-of-modules*, *profinite-galois-tower*,
*cech-descent-datum*, *etale-sheaf-sections-over-galois-tower*).
DiamondsAndVStacks layer D0: pro-categories (*pro-category-of-finite-t0-spaces*), cofiltered limits
of spectral spaces (*cofiltered-limits-of-spectral-spaces*) and the qcqs vocabulary of algebraic
topoi (D0.17, *quasicompact-objects-in-a-topos*); layer D6 is the consumer of A4 and is cited only as
such. A3 owns `Huber.IsPseudoCoherentOver`, including its `m = ∞` case, as a finite-free
resolution condition; its degree-zero and degree-one identifications use Mathlib’s
`Module.Finite` and `Module.FinitePresentation`.

The items *finite-etale-approximation* and *analytification-relative-polydisc-comparison* are
supplier citations in full, retained as named entry points. Their suppliers are respectively
PerfectoidSpaces P3 and AdicSpacesPartII R1 and AdicSpacesPartIV R4, in those folders’ `README.md` files. Tilting of
affinoid étale categories and of cofiltered limits is cited directly from PerfectoidSpaces P3
(*etale-site-tilting-equivalence*) and P5 (*completed-colimit-is-perfectoid*). Henselianity under filtered
colimits is owned here: PerfectoidSpaces P3 cites *henselian-pairs-filtered-colimit* from this
folder, whose proposed name is `Ring.DirectLimit.henselianRing` (README only).

The rational plus subring is `Huber.PairOfDefinition.completedPlusSubring` in
`TauCeti/RingTheory/Huber/LocalizationTopology/Plus.lean`: the closure of the image of the
integral closure in the uncompleted localisation. A0.4 uses this supplied subring for the plus
ring of the rational pullback (*rational-pullback-comparison*), and A3's `Huber.ratLocPair` takes
it as its plus ring.

### A0 point-set contracts

| Object | Exact supplied declaration and file |
| --- | --- |
| Shrinking the spectrum when the plus ring grows | `TauCeti.ValuationSpectrum.spa_antitone`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean` |
| Integral closure and topological closure leave the bounded valuation set unchanged | `TauCeti.ValuationSpectrum.spa_integralClosure`, `TauCeti.ValuationSpectrum.spa_topologicalClosure`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean` |
| Analytic locus as an intersection and as rational charts | `TauCeti.ValuationSpectrum.spaAnalytic_def`, `TauCeti.ValuationSpectrum.spaAnalytic_eq_biUnion_rationalSubset`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean` |
| Empty analytic locus of a discrete ring | `TauCeti.ValuationSpectrum.IsAnalyticPoint`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean`; every ideal is open in a discrete topology |
| Every point of the spectrum of a Tate ring is analytic | `TauCeti.ValuationSpectrum.spaAnalytic_eq_spa_of_isTateRing`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean` |
| Trivial-valuation points | `TauCeti.ValuationSpectrum.trivialSection`, `trivialSection_vle_iff`, `TauCeti/AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean`; `isContinuous_trivialSection_iff`, `TauCeti/AlgebraicGeometry/AdicSpace/Cont/Basic.lean` |
| `p` is a pseudouniformiser of `ℚ_p` | `TauCeti.Huber.Padic.isPseudoUniformizer_p`, `TauCeti/RingTheory/Huber/Padic/Field.lean` |
| Adic-space carriers of A0.8 | `TauCeti.AdicSpace`, `PreAdicSpace.isAdic_restrict`, `TauCeti.ValuationSpectrum.isAdic_presentationLimitPreAdicSpace` (`PreAdicSpace/Adic.lean`); `PreAdicSpace.restrict`, `PreAdicSpace.ofRestrict` (`PreAdicSpace/Restrict.lean`); `PreAdicSpace.IsOpenImmersion`, `IsOpenImmersion.lift` (`PreAdicSpace/OpenImmersion.lean`); `ValuationSpectrum.presentationLimitPreAdicSpace` (`PreAdicSpace/PresentationLimit.lean`), all under `TauCeti/AlgebraicGeometry/AdicSpace/` |


**`AdicSpace.IsFinite`.** Part II's finite morphism predicate has finite affinoid whole preimages, including the plus-ring condition. The comparison `IsFinite.iff_affinoidPullbacks` identifies these with the categorical pullback squares used here ([H96] §1.4, (1.4.4), p. 61). The predicate is AdicSpacesPartII's; the comparison and the Checks below are README only (no Lean declaration).

**Checks.**

- *AdicSpace_IsFinite_positive* (computation) — The split two-sheeted Q₂ projection is finite.
- *AdicSpace_IsFinite_degenerate* (degenerate) — The empty finite cover of Spa(Q₂,Z₂) is finite.
- *AdicSpace_IsFinite_negative* (non-example) — The open unit disc into the closed unit disc is not finite; being an open immersion is insufficient.

**`AdicSpace.LocallyOfFiniteType`.** Local finite type includes the adic condition on the chart maps (Huber 1996, Definition 1.2.1, p. 46). The predicate is AdicSpacesPartII's; the Checks below are README only (no Lean declaration).

**Checks.**

- *AdicSpace_LocallyOfFiniteType_positive* (computation) — The split two-sheeted cover of Spa(Q₂,Z₂) is locally of finite type.
- *AdicSpace_LocallyOfFiniteType_degenerate* (degenerate) — The empty split cover is locally of finite type.
- *AdicSpace_LocallyOfFiniteType_negative* (non-example) — Spa(Q₂,Z₂) → Spa(Z,Z) is not locally of finite type: its map is not adic. Omitting adicness from topological finite type would admit it.

## How to read the build

A0 fixes the contract with AdicSpacesPartII's completed tensor products on the carriers this
roadmap uses and adds the analytic locus of non-Tate spaces. A1 is the heart: finite étale algebras
over complete Tate rings and their Huber pairs, étale morphisms by local description, the sites
(étale, finite étale, pro-étale with corrected coverings, pro-finite-étale), their points and
strict localisations, and the Yoneda-adic presentation of non-sheafy spaces. A2 adds the classical
analytic geometry (separatedness and properness as a contract, polydiscs, tori, smooth charts,
dimension, analytification) and identifies it with A1's sites. A3 proves the nonnoetherian
affinoid étale approximation of Scholze's Proposition 6.4(iv) from pseudocoherent modules and standard
étale presentations, over perfectoid and sousperfectoid bases. A4 builds the finite étale torsor
tower of an analytic adic space over `Spa ℤ_p`, proves its uniform completion perfectoid and hands
the perfectoid torsor presentation to DiamondsAndVStacks layer D6. Each layer's subsections are in
reading order, and a few targets rest on later subsections of their own layer (the Kedlaya–Liu
site of A1.9 on the Yoneda-adic spaces of A1.16, for instance); a target's `*Needs:*` clause
names the targets, the layers of other roadmaps and the library declarations it rests on.

`Suggested.lean` states the parts of this roadmap that are a few lines over the pinned carriers:
the completed pushout and the analytic locus (A0); strongly sheafy rings, finite étale Huber pairs,
finite étale and étale morphisms with their stability and comparison theorems, geometric points
(A1); polydiscs and tori over a Huber pair, dimension, smooth morphisms by ball charts (A2);
pseudocoherence, Kedlaya–Liu's acyclicity in its sheafy form and standard étale presentations (A3);
split rings, finite étale torsors, the torsor tower, the ring core of Lemma 15.3 and the orbit
description of `Spa` of a torsor (A4). The sites, Yoneda-adic spaces, the completed tower and the
perfectoid torsor presentation are README targets. A target with Lean declarations ends with a
`Lean:` note naming them, and the clauses that note leaves out are README only; every other
target ends with the note "README only (no Lean declaration)".

### Geometric signatures and Checks

The geometric declarations, those of `Suggested.lean` and those proposed below, use
`TauCeti.AdicSpace`, its actual presheaf of complete topological rings, stalk valuations, and open
immersions. Names below are relative to `TauCetiRoadmap.AdicEtaleGeometry`; geometric names
without another prefix are in `AdicSpace`, except `Chart`, `Affinoid`, `HomChart`, `IsAdic`,
`IsFinite`, `LocallyOfFiniteType`, `Etale` and `Smooth`, which name the Part II declarations.
The proposed site names `smallEtale`, `smallFiniteEtale`, `huberSmallEtale`, `ProEtaleSite`
and their topology and comparison interfaces use those carriers. For an object `R` of the
proposed site `CAff` of complete Huber pairs, `R.Sheafy` means
`Huber.IsSheafyForEveryPresentation R.P.plus`, and its affinoid object is
`CAff.adicSpa R hR`, whose underlying pre-adic space is
`ValuationSpectrum.presentationLimitPreAdicSpace`; the choice of presentation is compared
with every compatible presentation by `CAff.preSpa_presentation`. In `Suggested.lean` an
affinoid is AdicSpacesPartII's `AdicSpace.Affinoid`, a complete sheafy pair with its spectrum
`Affinoid.spa`.

The three geometric interfaces used throughout are the contravariant map `CAff.spaHom`,
the subring and sheaf `AdicSpace.Oplus`/`OplusSheaf`, and `AdicSpace.FibreProduct` (the last is
in `Suggested.lean`; the first two are README only, and there a map of affinoids induced by a
morphism of pairs is recorded by AdicSpacesPartII's `AdicSpace.Affinoid.IsInducedBy`).
The first is characterised on valuations and global sections; the second consists of
sections bounded by one at every stalk valuation; the third contains an actual limiting
pullback cone. Fibre-product existence is a separate theorem with hypotheses. These are
respectively [H96] §1.1, pp. 37–39 and Proposition 1.2.2, pp. 47–49.
No blanket finite-limit instance on `TauCeti.AdicSpace` is asserted.

The following table connects the targets to their signatures and defining equations.
A name in the second column is a declaration of `Suggested.lean` when the target's `Lean:` note
lists it and a proposed name otherwise.
The final column names Check suites listed immediately below; each suite has at least
three Checks. The full hypotheses, including universes and topology
instances, belong in the signatures, and those of `Suggested.lean` carry them. In the table, **strong** means locally strongly sheafy
analytic, **noetherian** means locally noetherian analytic, and **stable** means locally
stably sheafy. The source locators in the corresponding target paragraphs apply to these
forms as well.

| Target | Declarations | Hypotheses and characterisation | Checks |
| --- | --- | --- | --- |
| maps-into-affinoids | `CAff.preSpa`, `CAff.adicSpa`, `CAff.sectionsEquiv`, `CAff.spaHom`, `homSpaEquiv` | Complete Hausdorff pairs; spectra require sheafiness. `sectionsEquiv_eq` is the canonical rational-localisation section; `spaHom_base`, `spaHom_sections`, `homSpaEquiv_apply` fix the maps. | Spa, Integral |
| completed-tensor-pullback | `FibreProduct`, `spaHom_isPullback`, `FibreProduct.ofPairPushout` | A pushout of complete pairs with all four pairs sheafy gives the pullback of spectra. `condition`, `isLimit`, Mathlib `PullbackCone.IsLimit.lift_fst`/`lift_snd`, Mathlib `IsLimit.conePointUniqueUpToIso_hom_comp` fix its universal property. | Pullback |
| analytic-locus | `analyticPoints`, `analyticPoints_isOpen`, `analyticOpen`, `analyticLocus`, `analyticLocus.ι`, Part II's `IsAnalytic` | All adic spaces. `mem_analyticLocus_iff`, `isAnalytic_iff_analyticPoints`; affinoid analytic points are exactly the supplied `spaAnalytic` (`analyticPoints_spa`). | Analytic |
| analytic-locus-restriction | `IsAdic`, `isAdic_iff_mapsTo_analyticPoints`, `analyticPoints_restrict`, `IsAdic.analyticLocusMap`, `analyticLocus.lift`, `analyticLocus_pullback` | The map is adic; for pullback, the second base map is adic. `analyticLocusMap_spec`, `lift_unique` and the preimage equation characterise restriction. | Analytic, Pullback |
| strongly-sheafy-huber-pair | `Huber.IsStronglySheafy`, defined by the characterisation in the next column | Complete Hausdorff Tate ring; every finite-dimensional restricted power-series algebra is sheafy, including dimension zero. | Strong |
| finite-etale-strongly-sheafy | `Huber.IsStronglySheafy.finiteEtale` | Finite étale algebra with its finite-module topology; strong sheafiness of the base. | Strong, Finite |
| locally-strongly-sheafy | `IsLocallyStronglySheafy`, `IsLocallyNoetherianAnalytic` | Every point lies in an open Tate chart with the stated ring property, including the empty space. | Local |
| finite-etale-morphism | `Huber.Pair.Hom.IsFiniteEtale`, `IsFiniteEtale`, `IsFiniteEtale.spa` | Analytic spaces; the full inverse image of each base chart is a sheafy finite étale spectrum. The plus ring is exactly the integral closure. Both sheafiness hypotheses appear in the proposed `IsFiniteEtale.spa`; in `IsFiniteEtale` they are part of Part II's affinoid charts. | Finite |
| finite-etale-local-to-global | `IsFiniteEtale.affinoid`, `smallFiniteEtale.affinoidEquiv`, `smallFiniteEtale.affinoidEquiv_inverse` | Strongly sheafy complete Tate base; inverse equivalence is the spectrum of `Pair.finiteEtale`, with its specified structure morphism and one natural family of comparisons on algebra homomorphisms. | Finite |
| etale-morphism | `IsEtaleLocalDescription` | Analytic source and target; `u ≫ f = j ≫ g ≫ i`, with three open immersions and finite étale `g`. | Finite |
| etale-morphisms-local-description-and-comparison | `Etale`, `IsFinite`, `IsEtaleLocalDescription.iff_etale`, `IsFiniteEtale.iff_isFinite_and_etale` | Noetherian analytic base, analytic source. Huber finite-type plus-ring condition and square-zero lifting property on charts; [H96] Definitions 1.2.1(v), 1.6.5, pp. 46, 78. | Huber |
| etale-local-open-finite-etale-factorisation | `IsEtaleLocalDescription.iff_etale` | Same hypotheses; the local factorisation is the defining equation of `IsEtaleLocalDescription`. | Huber |
| etale-composition | `IsEtaleLocalDescription.comp`, `IsFiniteEtale.comp`, `IsEtaleLocalDescription.isLocallyStronglySheafy` | Strong base; both constituent morphisms have the stated property. | Finite |
| etale-diagonal | the diagonal of an étale map is an open immersion and that of a finite étale map is closed (README only) | Strong base and a limiting self-pullback; diagonal is `P.lift (𝟙 _) (𝟙 _)`. | Pullback |
| etale-base-change | `IsEtaleLocalDescription.exists_fibreProduct`, `IsEtaleLocalDescription.baseChange`, `IsFiniteEtale.baseChange`; surjectivity on points is README only | Strong base and new base; pullback universal property, stability and surjectivity onto the point-set fibre product. | Pullback |
| etale-cancellation | `IsEtaleLocalDescription.of_comp`, `IsFiniteEtale.of_comp` | Strong base; the second map and composite have the same indicated property. | Finite |
| etale-open-map | `IsEtaleLocalDescription.isOpenMap` | Strong base, étale local description. | Finite |
| etale-site | `smallEtale`, `smallEtaleTopology`, `smallEtalePretopology` | Strong base. Objects are actual arrows with local description; `ofArrows_mem_smallEtaleTopology_iff` says jointly surjective on all points. | EtaleCover |
| etale-site-functoriality | `smallEtale.map`, `smallEtale.mapProjection`, `smallEtale.mapProjection_isPullback`, `smallEtale.mapComp`, `smallEtale.mapComp_projection`, `etaleSheafPushforward`, `etaleSheafPullback`, `etaleSheafAdjunction` | Both bases strong. Natural projection squares are pullbacks, composition preserves their projections, and inverse image is left adjoint to restriction along this functor. | Pullback, EtaleCover |
| finite-etale-site | `smallFiniteEtale`, `smallFiniteEtaleTopology`, `smallFiniteEtale.map`, `smallFiniteEtale.toSmallEtale` | Strong base; objects are actual finite étale arrows, coverings are jointly surjective. `map_toSmallEtale` pins the base-change functor. The inclusion `toSmallEtale` is Mathlib `MorphismProperty.Over.changeProp` in `Mathlib/CategoryTheory/MorphismProperty/Comma.lean`, specialised to the implication from finite étale to étale. | FiniteCover |
| etale-structure-sheaf | `structurePresheafEtale`, `structureSheafEtale`, `structurePresheafPlusEtale`, `structureSheafPlusEtale` | Strong base. Values are actual global sections and integral sections; restrictions are `f.hom.c.app`; `onOpens` recovers the original sheaves, and `structurePresheafEtale_onOpens_inv` and `structurePresheafPlusEtale_onOpens_inv` identify their components with the original sections on each restricted space. | IntegralSheaf, Integral |
| basis-comparison | `IsRationalChartMap`, `IsBasic`, `smallEtaleBasis`, `smallEtaleBasisTopology`, `smallEtaleBasis_openCover`, `smallEtaleBasis_dense` | Strong base. Inductive finite strings of rational localisations and finite étale maps above an open affinoid; rational maps use `CAff.IsRationalLocalization`. | Basis |
| etale-covering-reduction | `smallEtaleBasisTopology_le_iff`, `isSheaf_iff_open_finiteEtale` | Strong base. Rational covers and singleton surjective finite étale covers generate the basis topology; open descent plus finite étale descent detects sheaves. | Basis, IntegralSheaf |
| slice-site | `smallEtale.sliceEquiv`, `smallEtale.sliceEquiv_obj`, `smallEtale.sliceEquiv_topology`, `smallFiniteEtale.sliceEquiv` | Strong base and an étale object, or finite étale object for the finite site. The equation fixes the arrow to the slicing object itself. | EtaleCover, FiniteCover |
| geometric-point-etale-split | the section of an étale map through a lifted closed point (README only) | Complete algebraically closed Tate field with valuation plus ring of any rank; an étale map and a lift of its closed point. Section fixes that lift. | GeometricFiber |
| etale-site-and-geometric-points | `GeometricPoint`, `GeometricPoint.fiber`, `GeometricPoint.point`, `exists_geometricPoint` | Strong base for the site point. The fibre is the set of actual lifts of the geometric morphism, with action by composition. | GeometricFiber |
| etale-enough-points | `isConservativeFamilyOfPoints_geometricPoint`, `hasEnoughPoints_smallEtaleTopology`, `isIso_iff_geometricFibers` | Strong base; choose one geometric point over every underlying point, without restricting rank. | GeometricFiber |
| strict-localisation | `GeometricPoint.Neighbourhood`, `strictLocalization`, `strictLocalization.eval`, Mathlib `Point.presheafFiber`, `Point.isColimitPresheafFiberCocone` | Strong base. The category of elements of the lift functor is cofiltered; evaluation is the colimit over its opposite and agrees with the sheaf fibre. | StrictFiber |
| finite-etale-galois-category | `smallFiniteEtale.fiberFunctor`, `smallFiniteEtale.galoisCategory`, `fundamentalGroup`; Mathlib `PreGaloisCategory.functorToContAction` | Connected strong base and geometric point. `fiberFunctor_underlying` is the finite set of lifts; group is its automorphism group. | GeometricFiber, FiniteCover |
| etale-site-generalized | `YonedaAdicSpace.IsFiniteEtale`, `YonedaAdicSpace.IsEtaleLocalDescription`, `YonedaAdicSpace.smallEtaleTopology`, `YonedaAdicSpace.smallFiniteEtaleTopology`, `YonedaAdicSpace.finiteEtaleEquiv` | Analytic Yoneda-adic space, including non-sheafy Tate affinoids. Full-chart pullback and open–finite étale local equations; strong classical bases give equivalences of sites. The `_over` comparisons identify the inverse functors with `ofAdicSpace` over the base; `finiteEtaleEquiv_obj` is natural in algebra homomorphisms. | Yoneda, YonedaEtale |
| pro-etale-morphism | `ProEtale.ProEt`, `ProEtale.ProEt.Presentation`, `ProEtale.IsEtale`, `ProEtale.IsFiniteEtale`, `ProEtale.ProEtalePresentation`, `ProEtale.IsProEtale` | Noetherian base for the geometric API. Pro-category of `smallEtale`; étale maps are pullbacks of constant arrows, pro-étale maps are cofiltered limits with finite étale surjective transitions. | ProMap |
| pro-etale-underlying-space | `ProEtale.ProEt.space`, `ProEtale.ProEt.space_const`, `ProEtale.ProEt.space_isLimit`, `ProEtale.ProEt.hom_const_equiv` | Underlying spaces preserve the presentation limit; maps to a constant object are the filtered colimit of stage maps, pinned by `hom_const_equiv_stage`. | ProMap |
| pro-etale-base-change | `ProEtale.hasPullbacks`, `ProEtale.baseChange`, `ProEtale.baseChange_points`, `ProEtale.baseChange_compact_fiber` | Noetherian base; limiting square and pro-étale map. Point-set fibre map is surjective with compact fibres. | Pullback, ProMap |
| pro-etale-etale-composition | `ProEtale.etale_comp` | Noetherian base; both morphisms étale or both finite étale. | ProMap |
| pro-etale-quasicompact-opens | `ProEtale.exists_quasicompactOpen` | Noetherian base; pro-étale object and quasi-compact open of its underlying space. | QC |
| pro-etale-maps-open | `ProEtale.IsProEtale.isOpenMap` | Noetherian base and pro-étale morphism. | ProMap |
| pro-etale-surjective-etale-descent | `ProEtale.surjective_etale_descent`, `ProEtale.surjective_finiteEtale_descent` | Noetherian base, pro-étale target and surjective étale or finite étale map; descending square is a pullback. | ProMap, Tower |
| pro-etale-composition | `ProEtale.proEtale_comp` | Noetherian base; both arrows and the target over the final object are pro-étale. | ProMap |
| pro-etale-finite-limits | `ProEtaleSite.hasFiniteLimits`, `ProEtaleSite.forget_preservesPullback_of_isProEtale` | Noetherian base; finite limits exist in the site. The forgetful functor to the pro-category preserves the final object and pullbacks along pro-étale arrows, not equalizers; an equalizer is the subobject on the locus where the two maps agree. | Pullback, ProCover |
| etale-locally-finitely-many-components | `etale_locallyConnected`, `etale_finite_components` | Noetherian base; quasi-compact source for finite components. | QC |
| finite-etale-tower | `ProEtale.finiteSurjPullbacks`, `ProEtale.IsFetTower`, `ProEtale.FetTower`, `ProEtale.isFetTower_iff_nonempty` | Opposite transfinite compositions of pullbacks of finite étale surjections from `X_ét`; continuous at limit stages. | Tower |
| finite-etale-tower-is-pro-etale | `ProEtale.IsFetTower.isProEtale`, `ProEtale.tower_finiteStagePresentation` | Noetherian base; tower has finite étale surjective stages over its target. | Tower |
| transfinite-tower-splitting | `ProEtale.tower_splits_geometricPoint`, `Profinite.exists_section_of_transfiniteTower` | Algebraically closed affinoid field point of arbitrary rank; inverse tower has a section. | Tower, profinite_tower_identity, profinite_tower_finite_surjection, profinite_tower_empty |
| etale-over-tower-swap | `ProEtale.etale_over_tower_swap` | Noetherian base; equation `e ≫ t = t′ ≫ e′`, with tower first in the resulting factorisation. | Tower, ProMap |
| corrected-covers-pretopology | `ProEtaleSite.pretopology`, `ProEtaleSite.mem_topology_iff` | Noetherian base; jointly surjective family, each arrow factors as tower then étale. | ProCover |
| pro-etale-site-corrected | `ProEtaleSite`, `ProEtaleSite.topology`, `ProEtaleSite.printedTopology`, `ProEtaleSite.topology_le_printed` | Objects are pro-étale over the terminal object; topology is generated by the specified pretopology, distinct from the printed topology. | ProCover, Tower |
| proetale-projection-nu | `ProEtaleSite.const`, `ProEtaleSite.nuPush`, `ProEtaleSite.nuPull`, `ProEtaleSite.nuAdjunction` | Noetherian base; direct image is restriction along constants; inverse image is its finite-limit-preserving left adjoint and is fully faithful. | ProMap, ProCover |
| nu-pullback-sections-qcqs | `ProEtaleSite.nuPull_sections`, `ProEtaleSite.nuPull_sections_stage` | Noetherian base, qcqs pro-object, cofiltered presentation with qcqs stages; sections are the filtered colimit of stage sections. | QC, StrictFiber |
| proetale-slice | `ProEtaleSite.sliceEquiv`, `ProEtaleSite.sliceEquiv_const`, `ProEtaleSite.sliceEquiv_continuous` | Noetherian base and an étale object; on constants the natural comparison fixes composition and the arrow to that object, and both directions identify corrected topologies. | ProCover, ProMap |
| proetale-slice-open-subspace | `ProEtaleSite.sliceEquiv_open` | The étale structure map is an open immersion; factorisation is equivalent to image containment in the open. | ProMap |
| profinite-set-objects | `ProEtaleSite.profiniteObj`, `ProEtaleSite.profiniteObj.proj`, `ProEtaleSite.profiniteObj.space`, `ProEtaleSite.profiniteObj.homEquiv` | Noetherian base; all profinite sets. Point map is first projection; Hom formula requires quasi-compact test object. Nonempty gives a split covering; the tower assertion also requires metrizability. | ProfiniteProduct |
| profinite-galois-cover-is-covering | `ProEtaleSite.GaloisPresentation`, `ProEtaleSite.galoisCover_isFetTower`, `ProEtaleSite.galoisCover_torsorIso`, `ProEtaleSite.galoisCover_descent` | Profinite group, compatible finite quotient torsors, inverse-limit object. `limitAction_stage` and both `torsorIso_fst` and `torsorIso_snd` fix the torsor; section restriction fixes descent. | GaloisCover |
| pro-finite-etale-site-corrected | `ProFiniteEtaleSite`, `ProFiniteEtaleSite.pretopology`, `ProFiniteEtaleSite.topology`, `ProFiniteEtaleSite.isProEtale_of_finite_components` | Noetherian base. Pro-category of `smallFiniteEtale`, same tower-then-étale covering equation; its objects are pro-étale over the base when the base has finitely many connected components. | FiniteCover, ProCover |
| profinite-etale-galois-sets | `ProFiniteEtaleSite.galoisEquiv`, `ProFiniteEtaleSite.galoisEquiv_continuous`, `ProFiniteEtaleSite.galoisEquiv_const`, `ProFiniteEtaleSite.galoisEquiv_const_action`, `ProFiniteEtaleSite.galoisEquiv_const_naturality` | Connected noetherian base, geometric point, small topological group continuously isomorphic to the fibre-functor automorphism group. | GeometricFiber, ProfiniteProduct |
| proetale-profinite-etale-morphism-of-sites | `ProFiniteEtaleSite.toProEtale`, `ProFiniteEtaleSite.toProEtale_const`, `ProFiniteEtaleSite.toProEtale_continuous` | Noetherian base with finitely many connected components (`Finite (ConnectedComponents X.obj)`, for instance quasi-compact or connected); inclusion agrees naturally with constants, preserves their cofiltered limits (`toProEtale_isLimit`), fibre products and corrected coverings. | ProMap, FiniteCover |
| proetale-coherence | `ProEtaleSite.IsCoherentBasisObject`, `ProEtaleSite.coherentBasis_generating`, `ProEtaleSite.coherentBasis_pullback`, `ProEtaleSite.coherentBasis_isQuasiSeparated` | Noetherian base; affinoid pro-presentations factoring through an affinoid open. Pullbacks are over another basis object. | QC |
| proetale-quasicompactness-detection | `ProEtaleSite.IsQuasiCompact`, `ProEtaleSite.IsQuasiSeparated`, `ProEtaleSite.IsQuasiCompactMap`, `ProEtaleSite.IsQuasiSeparatedMap`, `ProEtaleSite.qc_isDenseSubsite` | Noetherian base; sieve-finite-cover and diagonal equations. `isQuasiCompact_iff`, `isQuasiSeparated_iff`, `isQuasiCompactMap_iff`; dense subsite requires quasi-separated base. | QC |
| etale-descent-along-algebraic-extension | `FieldBaseChangeSystem`, `FieldBaseChangeSystem.spaceCone_isLimit`, `FieldBaseChangeSystem.homDiagram_map`, `FieldBaseChangeSystem.homEquiv`, `FieldBaseChangeSystem.homEquiv_stage`, `FieldBaseChangeSystem.etale_descends` | Complete field pairs (`Fact (IsField R.A)` uses the pair’s existing ring), finite separable stages with dense union and completed integral closure, space locally of finite type over the base; qcqs objects for descent. Stage maps satisfy `stageMap_spec`; transition morphisms and colimit generators agree with pullback through both prescribed projections. | FieldCompletion |
| proetale-field-extension-slice | `FieldBaseChangeSystem.proObject`, `FieldBaseChangeSystem.proObjectCone_isLimit`, `FieldBaseChangeSystem.fieldExtensionSlice`, `FieldBaseChangeSystem.fieldExtensionSlice_stage`, `FieldBaseChangeSystem.fieldExtensionSlice_sheafEquiv` | The same field data and finite-type hypothesis, without global qcqs; object is the limit of finite base-change stages. The comparison is an equivalence between the full subcategories of objects with qcqs stages, identifying induced topologies, and is naturally a pullback over each specified stage projection; both subcategories are dense, giving the equivalence of sheaf topoi. No equivalence of the whole categories and no sheaf property of raw Hom presheaves is asserted. | FieldCompletion, ProCover |
| proetale-fibre-morphism-of-topoi | `GeometricPoint.decompositionGroup`, `ProEtaleSite.fiberProfinite`, `ProEtaleSite.decompositionAction`, `ProEtaleSite.pointToposPull`, `ProEtaleSite.pointToposAdjunction`, `ProEtaleSite.globalPointToposPush`, `ProEtaleSite.globalPointToposAdjunction` | Noetherian base (affinoid for the qc site construction), geometric field point and dense compatible algebraic-closure embedding. `mem_decompositionGroup`, `fiberProfinite_apply`, `fiberProfinite_map`, `fiberProfinite_action`, `decompositionAction_scalars` pin the valuation stabiliser, limit of discrete lift spaces with its subspace topology, and inverse precomposition; `globalPointToposPush_sections`, naturality in the object and `globalPointToposPush_sections_map` specify the global construction on qc objects. | Decomposition, GeometricFiber |
| coherent-topos-enough-points | `CoherentSitePresentation`, `coherentTopology_hasEnoughPoints`, `coherentTopos_hasEnoughPoints` | Site small in universe `w`, finite limits and finite covering refinements, or an equivalent sheaf category with that presentation. Points and set-valued sheaves use the same universe. | Deligne |
| proetale-topos-enough-points | `ProEtaleSite.hasEnoughPoints` | Arbitrary noetherian analytic base; abstract enough points in universe 1, without identification with geometric fibres. | Deligne |
| adic-spaces-in-yoneda-adic-spaces | `YonedaAdicSpace.ofAdicSpace`, `YonedaAdicSpace.ofAdicSpace_spa`, `YonedaAdicSpace.ofAdicSpace_space`, `CAff.isSheafAt_O_iff_isSheafyPair` | All classical adic spaces; naturality on spectra and underlying spaces, open-immersion reflection. Rational sheaf criterion is for complete Tate pairs. | Yoneda |
| maps-from-adic-spaces-to-yoneda-affinoids | `YonedaAdicSpace.mapsFromAdicSpaceEquiv`, `YonedaAdicSpace.mapsFromAdicSpaceEquiv_sheafy`, `YonedaAdicSpace.mapsFromAdicSpaceEquiv_apply` | Classical source, arbitrary complete target pair; continuous maps carrying plus elements to integral sections. Agrees with `homSpaEquiv` for sheafy target. `ofAdicSpace_globalFunctions_affinoid` sends evaluation at a coefficient to its specified `sectionsEquiv` image. | Spa, Yoneda |
| relative-closed-polydisc | ring level: `Huber.Pair.polydisc`, `Huber.Pair.polydisc.proj`, `Huber.Pair.polydisc.existsUnique_hom`; geometric: `IsLocallyStablySheafy`, `Polydisc`, `relativePolydisc`, `relativePolydisc.sheafy_affinoid` | Stable sheafy base for the geometric form. Represents integral `n`-tuples via `Polydisc.evaluate`; `affinoidChart` sends each global coordinate to the corresponding Tate variable; `zeroIso_hom` and `baseChange` fix projections and coordinates. | Polydisc |
| simple-laurent-strict-multiplication | strictness of the multiplication maps (README only) | Complete Hausdorff Tate ring with explicit `IsSheafyRing A`; the four multiplication maps are closed embeddings. | SheafySeries |
| simple-laurent-pseudoflat | pseudoflatness of the simple Laurent quotients (README only) | Same sheafy hypothesis; the two quotient rings and their intersection are 2-pseudoflat over the base. | SheafySeries |
| rational-localisation-pseudoflat | `Huber.isPseudoFlat_ratLoc` | Sheafy complete Tate base, pair of definition and rational localisation. | SheafySeries |
| pseudocoherent-cech-injectivity | `Huber.cech_injective_of_isStablyPseudoCoherent` | Sheafy complete Tate base, stably pseudocoherent module and finite rational covering; injective augmentation. | SheafySeries |
| finite-projective-dimension-local | `Huber.IsStablyPseudoCoherent.isFPD_of_cover` | Same sheafy base and rational cover, stably pseudocoherent module whose restrictions have finite projective dimension. | SheafySeries |
| pseudocoherent-rational-exactness | `Huber.exact_tensor_ratLoc` | Sheafy complete Tate base, exact sequence with stably pseudocoherent terms, rational localisation. | SheafySeries |

**Checks.** Each named item below is a suite of Checks, to be formalised as `example`s in a
`GeometricChecks` namespace (pro-category Checks in `GeometricChecks.Pro`). Identity and empty cases
fix the units and vacuous coverings; the other cases distinguish the geometric definitions
from surjectivity, arbitrary continuous ring maps, or arbitrary abstract equivalences.

- **Spa** — *spa_identity*, *spa_integral_sections*, *spa_plus_obstruction*, *spa_empty*.
- **Integral** — *Oplus_zero_one*, *Oplus_empty*, *Oplus_padic_inverse*.
- **Pullback** — *pullback_identity*, *pullback_open*, *pullback_disjoint*.
- **Analytic** — *AdicSpace.analytic_tate*, *AdicSpace.analytic_discrete*, *analytic_empty*, *analytic_open*.
- **Strong** — *strongSheafy_field*, *strongSheafy_disc*, *strongSheafy_nonSheafy*, *strongSheafy_zero*.
- **Local** — *locallyStrongSheafy_empty*, *locallyStrongSheafy_open*, *locallyStrongSheafy_disc*.
- **Finite** — *AdicSpace.finiteEtale_identity*, *finiteEtale_open_proper*, *finiteEtale_disc_double*, *finiteEtale_disc_square*, *finiteEtale_empty*.
- **Huber** — *huber_identity*, *huber_open*, *huber_ramified*.
- **EtaleCover** — *etaleCover_identity*, *etaleCover_empty*, *etaleCover_missing_point*.
- **FiniteCover** — *finiteCover_identity*, *finiteCover_empty*, *finiteCover_missing_component*.
- **IntegralSheaf** — *integralSheaf_identity*, *integralSheaf_empty*, *integralSheaf_nonintegral*.
- **Basis** — *basis_identity*, *basis_finite_cover*, *basis_noncompact*.
- **GeometricFiber** — *geometricFiber_identity*, *geometricFiber_open*, *geometricFiber_empty*.
- **StrictFiber** — *strictFiber_terminal*, *strictFiber_empty*, *strictFiber_two*.
- **Yoneda** — *yoneda_sheafy*, *yoneda_nonSheafy*, *yoneda_open*.
- **YonedaEtale** — *yoneda_identity_etale*, *yoneda_finite_nonSheafy*, *yoneda_empty_cover*.
- **ProMap** — *pro_identity*, *pro_open_const*, *pro_finite_const*.
- **Tower** — *tower_identity*, *tower_not_open_proper*, *tower_finite_surjection*.
- **ProCover** — *proCover_identity*, *proCover_empty*, *proCover_open_family*.
- **ProfiniteProduct** — *profiniteProduct_unit*, *profiniteProduct_empty*, *profiniteProduct_two*.
- **QC** — *qc_empty*, *qc_affinoid*, *qc_noncompact*.
- **Decomposition** — *decomposition_identity*, *decomposition_swaps_valuation*,
  *decomposition_unique_extension*: for a dense compatible algebraic closure with plus ring
  equal to the power-bounded ring, the decomposition group is the whole Galois group;
  a higher-rank valuation need not be invariant.
- **SheafySeries** — *sheafy_series_zero*, *sheafy_series_unit*, *sheafy_series_unbounded*: multiplication by the coordinate is a closed embedding; `1 − pT` and `T − p⁻¹` are units over `ℚ_p`.
- **FieldCompletion** — *fieldCompletion_identity*, *fieldCompletion_empty*, *fieldCompletion_proper*: trivial extension and empty base give the expected pullbacks; a proper completed field extension does not give an isomorphism over a field point.
- **GaloisCover** — *galoisCover_trivial*, *galoisCover_nontrivial*, *galoisCover_empty*: trivial group gives an isomorphism, nontrivial group over a nonempty source gives a non-monomorphism, empty target gives an isomorphism.
- **Deligne** — *deligne_empty*, *deligne_nonempty*, *deligne_constant_not_point*: empty base has no points, nonempty base has an abstract point in universe 1, and the constant singleton functor is not a point because it fails the empty covering.
- **Polydisc** — *polydisc_zero*, *polydisc_sections*, *polydisc_empty*.

The following Checks distinguish the additional field and functor conventions.

- *field_existing_ring*, *field_padic_instance*, *field_zero_excluded*: the field structure
  extends the bundled ring; `ℚ_p` supplies an instance; the zero ring is excluded.
- *pairFiniteType_identity*, *pairFiniteType_disc*, *pairFiniteType_zero_target*: identity,
  the closed disc over `ℚ_p`, and the empty spectrum satisfy the pair finite-type condition
  of [H94] 3.5(ii), pp. 534–535.
- *frobenius_imperfect_field*, *frobenius_laurent_parameter*, *frobenius_perfect_field*,
  *frobenius_mixed_characteristic*: in characteristic `p`, Frobenius of an imperfect
  field is inseparable; the parameter of `𝔽₂((t))` has no square root. On a perfect
  field Frobenius is an isomorphism, including characteristic-`p` perfectoid fields.
  In mixed characteristic the power map is not even additive: over `ℚ₂`,
  `(1 + 1)² = 4` whereas `1² + 1² = 2`. Thus Frobenius is not a uniform
  non-example of étaleness. See [H96] 1.6.6(ii), p. 78, for the finite étale comparison.
- *pullback_baseChange_identity*, *pullback_baseChange_empty*,
  *pullback_baseChange_naturality*: base change along the identity gives isomorphic
  projections, empty sources stay empty, and base change of arrows commutes with the
  specified projections ([H96] 1.2.2, pp. 47–49).
- *basis_nonseparated_intermediate*: over the closed disc, take two copies of that disc
  glued along its non-quasi-compact open unit disc, as an étale object `W`. The two
  chart objects have non-quasi-compact pullback over `W`, although the base is
  quasi-separated. The finite-cover assertion therefore assumes `W` quasi-separated.
- *galois_action_identity*, *galois_action_trivial_rejected*, *galois_action_inverse*:
  the induced limit action fixes the identity, is faithful over a nonempty torsor,
  and sends inversion to inverse automorphisms ([PH] §5, proof of 5.6, p. 31).

The finite-cover computation uses the diagonal map from the disc algebra to its product
with itself; it yields two sheets with the integral-closure plus ring. The square-map check
fixes scalars and sends the disc coordinate to its square: at the origin it is ramified.
The proper nonempty open of a connected analytic space is étale but not finite étale.
The non-sheafy checks exclude a pair from `CAff.adicSpa` and strong sheafiness while retaining
its Yoneda-adic spectrum. The integral-section check excludes `p⁻¹` over `ℚ_p`.
For decomposition groups, an automorphism moving an integral algebraic element outside the
chosen valuation subring is excluded; uniqueness of the extension of the valuation gives
the full group. These equations retain the higher-rank distinction in A1.15.

- **Polydisc coordinates** — *polydisc_two_coordinates* evaluates the two universal
  coordinates at the section `(0, 1)`. *polydisc_coordinates_not_equal* excludes identical
  coordinates on a nonempty base; *polydisc_zero* gives the zero-variable case.
- **Coherent presentations** — *coherent_presentation_point* uses the one-object site with
  only maximal covering sieves; *coherent_presentation_empty* permits the empty cover on that
  site. *coherent_presentation_infinite_discrete* excludes the topos of the infinite discrete
  space `ℕ`: its terminal sheaf is not quasi-compact, whereas a coherent presentation has a
  quasi-compact terminal object ([SGA 4 VI] §2 and Appendix, Proposition 9.0, p. 336).

## Layer A0: completed tensor products and the fibre products actually used

This layer is the comparison interface of the roadmap with AdicSpacesPartII layer R0. It
identifies, on the same carriers, R0's completed tensor product `B ⊗̂_A C` of complete Huber pairs
with its topology, its plus ring and its universal property, R0's uniformisation and R0's affinoid
fibre products with the objects that the diamond and perfectoid layers use; it records, as clauses
of that contract, R0's pullbacks along rational and finite étale maps and its chart independence,
and it proves the comparisons that R0 does not state: associativity, symmetry and unit, the
tracking of definition data and plus rings through the completed tensor product, and the universal
property of maps into affinoids. It constructs one new object, the analytic locus of an adic
space with its restriction interface, which is how R0's constructions are applied to analytic adic
spaces over `Spa(ℤ_p, ℤ_p)` with non-Tate charts. It keeps explicit the boundary with
PerfectoidSpaces layer P2, which proves that the relevant products of perfectoid spaces are
perfectoid. The layer builds on AdicSpacesPartII layer R0 (completed tensor products, fibre
products, adic morphisms, finite morphisms, uniformisation) and on the Foundations of adic spaces
roadmap (AdicSpaces), layers 0 (completion of Huber pairs), 2 (analytic points of `Spa`), 3
(rational localisation, the category `𝒱`) and 5 (adic spaces, open subspaces, gluing), imported as
the interfaces of those layers; nothing below depends on a later layer — PerfectoidSpaces layer P2,
AdicSpacesPartIV layers R4–R5 and AdicEtaleGeometry layer A1 consume this layer and appear only in
examples and boundaries. Its consumers are AdicEtaleGeometry layer A1, PerfectoidSpaces layer P2
(fibre products of perfectoid spaces), PerfectoidTowers layers P8/P9 (quotients and
scalar extension), and the Fargues–Fontaine roadmaps.

The standing conventions are these. Huber pairs are Tau Ceti `Huber.Pair` on complete Hausdorff
Huber rings and their morphisms are Tau Ceti `Huber.Pair.Hom` (continuous, preserving plus
rings). A completed tensor product `B ⊗̂_A C` is formed only along adic ring maps (AdicSpacesPartII
layer R0, adic ring homomorphisms); over a Tate ring `A` every continuous map is adic, while over a
non-Tate base such as `ℤ_p` or `ℤ_p⟦T⟧` adicness is a condition, and fibre products along non-adic
maps are computed by R0's ascending unions of affinoids, not by a tensor formula. The completed
tensor product is R0's `Huber.Pair.completedTensor`: the Hausdorff completion of `B ⊗_A C` for the
`{Iⁿ·F}`-topology, with plus ring the closure of the integral closure of the image of
`B⁺ ⊗_{A⁺} C⁺`; it is never uniformised implicitly, and its sheafiness is never inferred from the
formula — it is a hypothesis wherever an adic space is formed. A point is analytic if its support
in an affinoid neighbourhood is not open, and an adic space is analytic if all its points are;
every morphism into an analytic adic space is adic. Existence of fibre products is Huber's
Proposition 1.2.2 as R0 states it (one leg locally of finite type, or locally of weakly finite type
with the other leg adic, and a stably sheafy cover of the second factor); nothing is asserted
outside these hypotheses, since fibre products of adic spaces do not exist in general.

### A0.1 the comparison interface: the pushout of complete Huber pairs

**The completed tensor product is the pushout of complete Huber pairs.**
(*supplier-contract-fibre-products*) Let `f : (A, A⁺) → (B, B⁺)` and `g : (A, A⁺) → (C, C⁺)` be
morphisms of complete Hausdorff Huber pairs (Tau Ceti `Huber.Pair.Hom`) whose ring homomorphisms
are adic (AdicSpacesPartII layer R0; automatic when `A` is a Tate ring), and let
`D = (D, D⁺) = B ⊗̂_A C`, with `inl : (B, B⁺) → D`, `inl(b) = b ⊗ 1`, and `inr : (C, C⁺) → D`,
`inr(c) = 1 ⊗ c`, be the completed tensor product of AdicSpacesPartII layer R0 (for
`K⟨T⟩ ⊗̂_K K⟨S⟩ = K⟨T, S⟩`: `inl(T) = T`, `inr(S) = S`, and `inl(T)·inr(S) = TS` is the image of
`T ⊗ S`). R0's universal property (*completed-tensor-product-universal-property*) gives that the
square `(f, g, inl, inr)` is a pushout (Mathlib `CategoryTheory.IsPushout`) in the category of complete
Hausdorff Huber pairs with Tau Ceti's morphisms of Huber pairs ([H94] §3, proof of Prop. 3.7,
p. 536). This single statement is the layer's contract with R0, on R0's carrier, and it says four
things. (i) Topology: `D` is the Hausdorff completion of `B ⊗_A C` for the group topology with
fundamental system of neighbourhoods `{Iⁿ·F : n ≥ 0}`, where `F` is the image of `B₀ ⊗_{A₀} C₀`
for rings of definition `A₀ ⊆ A⁺`, `B₀ ⊆ B⁺`, `C₀ ⊆ C⁺` with `f(A₀) ⊆ B₀`, `g(A₀) ⊆ C₀`, and `I`
is an ideal of definition of `A₀` generating ideals of definition of `B₀` and `C₀`; `(F, I·F)` is
a pair of definition, `inl` and `inr` are adic, and the topology does not depend on these choices
([H94] §3, proof of Lem. 3.9(i), p. 537; [Morel] §II.3.2, Prop. II.3.2.1, pp. 76–77). (ii) Plus ring: `D⁺`
is the closure in `D` of the integral closure, in `B ⊗_A C`, of the image of `B⁺ ⊗_{A⁺} C⁺`; since
`D⁺` is integrally closed in `D` and closed, it is also the closure of the integral closure in `D`
of that image, which is Kedlaya–Liu's plus ring of the coproduct of adic Banach rings ([KL I]
§2.4, Def. 2.4.1, p. 38) and the plus ring `D⁺` of Scholze's affinoid fibre
product ([PS] §6, proof of Prop. 6.18, p. 38; the perfectoid statement of that proposition belongs
to PerfectoidSpaces layer P2). (iii) Universal property: for every complete Hausdorff Huber pair
`(R, R⁺)` and morphisms `φ : (B, B⁺) → (R, R⁺)`, `ψ : (C, C⁺) → (R, R⁺)` with `φ ∘ f = ψ ∘ g`
there is exactly one morphism `χ : D → (R, R⁺)` with `χ ∘ inl = φ` and `χ ∘ inr = ψ`, and `φ`, `ψ`
need not be adic. (iv) Geometry: if `(A, A⁺)`, `(B, B⁺)`, `(C, C⁺)` and `D` are all sheafy, then
`Spa D` with `Spa(inl)`, `Spa(inr)` is the fibre product `Spa B ×_{Spa A} Spa C` in the category
of adic spaces (AdicSpacesPartII layer R0, affinoid fibre product), globalised to adic spaces under
Huber's hypotheses by AdicSpacesPartII layer R0's existence of fibre products ([H96] §1.2,
Prop. 1.2.2 and proof, pp. 47–49). R0’s `existsUnique_lift` supplies the elementwise form of (iii):
for every complete Hausdorff Huber pair `(R, R⁺)` and every `φ`, `ψ` with `φ ∘ f = ψ ∘ g`, exactly
one `χ`. Clause (i) is R0’s `inl_comp` and `denseRange_tmul`; (ii) is R0's
`Pair.completedTensor.plus_eq` (integral closure taken in `B ⊗_A C`) together with
`Huber.Pair.completedTensor.plus_eq_closure_integralClosure` (integral closure taken in `D`, the
form used by [KL I] and [PS]). Clause (iv) is the geometric fibre-product target. `D` is not
uniformised; the uniform variant is *uniformization-contract*. Sheafiness of `D` is a
hypothesis of (iv) and is never inferred from the formula; it is supplied when `B` is of
noetherian type and `g` is topologically of finite type (AdicSpacesPartII layer R0, noetherian
stability of completed tensor products). For perfectoid `(A, B, C)` over a perfectoid field,
perfectoidness and sheafiness of `D`, and hence the existence
of perfectoid fibre products, are PerfectoidSpaces layer P2's theorem on fibre products of
perfectoid spaces, which applies this target and is not part of it; no fibre product of arbitrary
adic spaces is asserted. *Needs:* AdicSpacesPartII layer R0; Mathlib `CategoryTheory.IsPushout`,
`integralClosure`; Tau Ceti `Huber.Pair`, `Huber.Pair.Hom`.

Lean: `Huber.IsCompletedPushout` (the square, its four arrows being the two algebra maps and the
two coprojections, as a pushout for maps into complete pairs), `Huber.exists_isCompletedPushout`
(existence along adic maps, with adic coprojections and dense image of `B ⊗_A C`) and
`AdicSpace.FibreProduct` (the fibre product of (iv) as a limiting pullback cone); the rest is README
only, including the form of the square in the proposed site `CAff`
(`Huber.Pair.completedTensor.isPushout`).

**Checks.**

- *tate_algebra_scalar_extension* — for a complete extension `L/K` of nonarchimedean fields,
  `(K⟨T⟩, K°⟨T⟩) ⊗̂_{(K, K°)} (L, L°) ≅ (L⟨T⟩, L°⟨T⟩)` through AdicSpacesPartII layer R0's
  completed tensor product of restricted power series, and
  `Spa(L⟨T⟩, L°⟨T⟩) = Spa(K⟨T⟩, K°⟨T⟩) ×_{Spa(K, K°)} Spa(L, L°)` is the closed unit disc over `L`.
- *polydisc* — `(K⟨T⟩, K°⟨T⟩) ⊗̂_{(K, K°)} (K⟨S⟩, K°⟨S⟩) ≅ (K⟨T, S⟩, K°⟨T, S⟩)`, and its `Spa` is
  the product of two closed discs ([Hüb] §9, Ex. 9.3, p. 42); the ring isomorphism for `K = ℚ_p`
  is AdicSpacesPartII's test *completedTensor_test_polydisc*.
- *plus_ring_ne_image* — for `L = ℚ_p(√p)`, any `p` including `p = 2`,
  `(L, O_L) ⊗̂_{ℚ_p} (L, O_L) ≅ (L × L, O_L × O_L)` via `x ⊗ y ↦ (xy, xσ(y))`, `σ(√p) = −√p`: the
  tensor product is finite-dimensional, hence complete, and `O_L × O_L` is the integral closure of
  the image of `O_L ⊗_{ℤ_p} O_L`, which is `{(a + b√p, a − b√p) : a, b ∈ O_L}`. The idempotent
  `(1, 0) = (1 ⊗ 1 + p⁻¹(√p ⊗ √p))/2` lies in the plus ring but not in that image (it would need
  `a = 1/2`, `b = 1/(2√p)`); the image has index `p` in `O_L × O_L` for `p` odd and index `8` for
  `p = 2` (the determinant of `(a, b) ↦ (a + b√p, a − b√p)` is `−2√p`, of valuation `1/2`,
  resp. `3/2`, in `p`-adic units). So a plus ring defined as the image alone is wrong.
- *plus_ring_two_coordinates* (convention) — under `x ⊗ y ↦ (xy,xσ(y))`, with
  `σ(r) = −r` and `r ≠ 0` in a characteristic-zero field, the two terms of
  `(1 ⊗ 1 + (r²)⁻¹(r ⊗ r))/2` evaluate to `(1,0)`. This fixes the order of the
  identity and conjugate coordinates, including for residue characteristic two.
- *disjoint_fibres_zero_ring* (degenerate) — `ℤ_p → ℚ_p` and `ℤ_p → 𝔽_p` are both adic (the
  ideal of definition `(p)` generates `ℚ_p` and `0`), and `(ℚ_p, ℤ_p) ⊗̂_{ℤ_p} (𝔽_p, 𝔽_p)` is the
  zero pair, since `ℚ_p ⊗_{ℤ_p} 𝔽_p = 0`: the generic and special fibres of `Spa ℤ_p` have empty
  fibre product, and the zero pair is the pushout.
- *perfectoid_scalar_extension* — for a perfectoid field `K`, the perfectoid affinoid `K`-algebra
  `K⟨T^{1/p^∞}⟩` and a perfectoid complete extension `L/K`, PerfectoidSpaces layer P2's fibre
  products of perfectoid spaces identify `Spa K⟨T^{1/p^∞}⟩ ×_{Spa K} Spa L` with `Spa` of this
  target's pair `K⟨T^{1/p^∞}⟩ ⊗̂_K L = L⟨T^{1/p^∞}⟩`; the perfectoidness and sheafiness used there
  are P2's and are not consequences of this target.
- *power_series_not_adic* (non-example) — for `ℤ_p → ℤ_p⟦X⟧` (`(p, X)`-adic, not adic) and
  `ℤ_p → ℚ_p` there is no Huber topology on `ℤ_p⟦X⟧ ⊗_{ℤ_p} ℚ_p` making both maps continuous with
  `ℤ_p⟦X⟧` open ([Morel] §II.3.2, Ex. II.3.2.2, p. 77); the fibre product
  `Spa ℤ_p⟦X⟧ ×_{Spa ℤ_p} Spa(ℚ_p, ℤ_p)` is the open unit disc over `ℚ_p`, which is not affinoid
  (AdicSpacesPartII layer R0, fibre product along a map of finite type). Non-adicness is the
  non-example of AdicSpacesPartII's *adic-ring-homomorphism* and the absence of such a topology
  is its test *completedTensor_test_not_adic*; the non-quasi-compactness of the preimage is A0.4's
  *nonadic_preimage_not_quasicompact*.

**`Huber.IsCompletedPushout`.** The commuting square of Huber pairs with the pushout property
for morphisms into complete pairs; its existence along adic maps is
`Huber.exists_isCompletedPushout`. Each Check below is a Lean example.

**Checks.**

- *isCompletedPushout_identity* (computation) — for complete `(C, C⁺)`, pushing
  `g : (A, A⁺) → (C, C⁺)` out along the identity of `(A, A⁺)` returns `(C, C⁺)`, with
  coprojections `g` and the identity (Lean example).
- *isCompletedPushout_zero_factor* (degenerate) — if `(C, C⁺)` is the zero pair, the square
  `(f, g, i, id)` is a completed pushout for every `i : (B, B⁺) → (C, C⁺)`, since a morphism out of
  the zero ring has zero target; compare *disjoint_fibres_zero_ring*, where the pushout is zero
  although neither factor is (Lean example).
- *isCompletedPushout_fold* (non-example) — for the diagonal
  `φ : (ℚ_p, ℤ_p) → (ℚ_p × ℚ_p, ℤ_p × ℤ_p)` the fold square `(φ, φ, id, id)` is not a completed
  pushout: the identity and the swap of `ℚ_p × ℚ_p` agree on `ℚ_p` and differ, whereas the pushout
  property would make them equal. The Lean example states this for any two distinct morphisms
  agreeing on `(A, A⁺)` (Lean example, proved).

**Morphisms into affinoids.** (*maps-into-affinoids*) Let `X` be an adic space (AdicSpaces
layer 5: an object of Huber's `𝒱` covered by affinoids `Spa(B, B⁺)` of sheafy complete pairs) and
`(A, A⁺)` a sheafy complete Hausdorff Huber pair. Prove `AdicSpace.homSpaEquiv`: morphisms
`X → Spa(A, A⁺)` of adic spaces (Tau Ceti's `TauCeti.AdicSpace`, with `Spa(A, A⁺)` the pre-adic
space `ValuationSpectrum.presentationLimitPreAdicSpace`, adic by
`TauCeti.ValuationSpectrum.isAdic_presentationLimitPreAdicSpace` when its presheaf is a sheaf) correspond
bijectively, naturally in `X` and `(A, A⁺)`, to continuous ring homomorphisms `A → O_X(X)`
carrying `A⁺` into `O_X⁺(X)`, by `h ↦ h^♯` on global sections; for affinoid
`X = Spa(B, B⁺)` this says that every morphism `Spa(B, B⁺) → Spa(A, A⁺)` in Huber's `𝒱` is
`Spa` of a unique morphism of pairs, which the universal property of rational localisation
(AdicSpaces layer 3) reduces to the compatibility of the valuations at points, and the general
case glues along an affinoid cover ([H94] §2, Prop. 2.1(ii), p. 522; [KL I] §8.2, Lem. 8.2.9,
p. 160). The statement for non-sheafy `(A, A⁺)`, with `Spa^Y` in place of `Spa`, is layer A1's
*maps-from-adic-spaces-to-yoneda-affinoids*, which uses this one. *Needs:* AdicSpaces layers 3
and 5; Tau Ceti `Huber.Pair`, `Huber.Pair.Hom`, `ValuationSpectrum.spa`, `TauCeti.AdicSpace`,
`ValuationSpectrum.presentationLimitPreAdicSpace`. README only (no Lean declaration).

**Checks.**

- *homSpa_point* (computation) — for `X = Spa(L, O_L)`, `L` a finite extension of `ℚ_p`, and
  `(A, A⁺) = (ℚ_p⟨T⟩, ℤ_p⟨T⟩)`: morphisms `X → Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` over `ℚ_p` are the elements
  of `O_L` (`T ↦ t` with `|t| ≤ 1`); `T ↦ 1/p` is not a morphism, since `1/p ∉ O_L`.
- *homSpa_open_disc* (non-affinoid source) — for `X` the open unit disc over `ℚ_p`, morphisms
  `X → Spa(ℤ[T], ℤ)` (discrete target ring) correspond to all functions in `O_X(X)`: the
  image of `T` is unrestricted. No Huber-ring structure on global sections of a general
  non-affinoid source is assumed.
- *homSpa_discrete_target* (degenerate) — for `(A, A⁺) = (ℤ, ℤ)` with the discrete topology every
  adic space has exactly one morphism to `Spa(ℤ, ℤ)`; for `(A, A⁺) = (0, 0)` only the empty space
  has one.

When formalised, the three Checks use `AdicSpace.homSpaEquiv` and the sections equivalence
`CAff.sectionsEquiv`. The point Check fixes evaluation at the coordinate and the coefficient
map over `ℚ_p`, identifies integral elements by `‖t‖ ≤ 1`, and excludes `1/p`. The open-disc
Check uses the open unit disc over `ℚ_2`, includes its noncompactness, and identifies each
morphism with the image of the polynomial coordinate. Discrete targets are specified by ring
isomorphisms and their plus subrings; the zero-target clause also asserts uniqueness for an empty
source.


**`AdicSpace.FibreProduct.lift`.** The universal map records the two projections in order, including when the projections have the same type. README only (no Lean declaration).

**Checks.**

- *AdicSpace_FibreProduct_lift_positive* (computation) — The lift of the ordered pair of sections (1,2) projects to section 1 on the first factor.
- *AdicSpace_FibreProduct_lift_degenerate* (degenerate) — For the pullback of two identity maps, lifting the identity pair recovers the identity after projection.
- *AdicSpace_FibreProduct_lift_negative* (non-example) — The second projection of the lift is section 2, not section 1; swapping or duplicating the first projection fails.

**`AdicSpace.FibreProduct.ofPairPushout`.** The two geometric projections are contravariant Spa maps of the ordered algebra pushout arrows. README only (no Lean declaration).

**Checks.**

- *AdicSpace_FibreProduct_ofPairPushout_cycle_first_projection* (computation) — For the pushout of identity along the algebraic three-cycle, the first geometric projection takes sheet 0 to sheet 1.
- *AdicSpace_FibreProduct_ofPairPushout_empty_pushout* (degenerate) — The identity pushout of the zero pair has empty spectrum.
- *AdicSpace_FibreProduct_ofPairPushout_projections_differ* (non-example) — The two projections differ at sheet 0; exchanging them fails.

### A0.2 uniformization, supplied separately

**The uniform completed tensor product is the pushout among uniform Tate pairs.**
(*uniformization-contract*) Let `(A, A⁺)`, `(B, B⁺)`, `(C, C⁺)` be complete Hausdorff Huber pairs
with `A` a Tate ring and `f : (A, A⁺) → (B, B⁺)`, `g : (A, A⁺) → (C, C⁺)` morphisms of Huber pairs
(so `f`, `g` are adic and `B`, `C` are Tate). Let `B ⊗̂ᵘ_A C = (B ⊗̂_A C)^u`, with `inlᵘ = ι ∘ inl`
and `inrᵘ = ι ∘ inr`, be the uniform completed tensor product of AdicSpacesPartII layer R0, where
`ι : B ⊗̂_A C → (B ⊗̂_A C)^u` is R0's uniformisation morphism. R0’s
`Huber.Pair.uniformCompletedTensor.lift`, `lift_comp_inl` and `hom_ext` express that the square `(f, g, inlᵘ, inrᵘ)` is a pushout
(Mathlib `CategoryTheory.IsPushout`) in the full subcategory of complete Hausdorff Huber pairs
`(R, R⁺)` with `R` a uniform Tate ring (`R°` bounded), not among all complete Huber pairs ([KL I]
§2.8, Def. 2.8.13, p. 63). Moreover `ι` is the unit of the uniformisation adjunction at
`B ⊗̂_A C`, `Spa(ι)` is a homeomorphism identifying rational subsets ([KL I] §2.8, Def. 2.8.13,
p. 63), and `ι` is an isomorphism exactly when `B ⊗̂_A C` is uniform — these three clauses are
R0's (the adjunction of *uniformization*, and `spaHomeomorph` and
`fromCompletedTensor_isIso_iff` of *uniform-completed-tensor-product*), restated as part of the
contract. A separated completion need
not be uniform: `ℂ_p ⊗̂_{ℚ_p} ℂ_p` is a complete separated tensor product that is not uniform
([KL I] §2.8, Rem. 2.8.5, p. 60). Witness: for `K_n = ℚ_p(ζ_{p^n})` the idempotent
`e_n ∈ K_n ⊗_{ℚ_p} K_n = ∏_{Gal(K_n/ℚ_p)} K_n` supported at the identity has spectral seminorm `1`,
while for any representation `e_n = Σ a_i ⊗ b_i` summing over the Galois group gives
`1 = Σ a_i Tr(b_i)`, and `Tr(O_{K_n}) = p^{n−1}ℤ_p`, so `max |a_i||b_i| ≥ p^{n−2}`; the tensor
norm of `e_n` in `ℂ_p ⊗̂_{ℚ_p} ℂ_p` is its tensor norm in `K_n ⊗_{ℚ_p} K_n` (apply a norm-one
`ℚ_p`-linear projection `ℂ_p → K_n`, which exists since `ℚ_p` is spherically complete), so the
power-bounded subring is unbounded; the uniform completion is `C(Gal(ℚ̄_p/ℚ_p), ℂ_p)`. The same
computation shows that `K ⊗̂_{ℚ_p} K` is not uniform for `K` the completion of `ℚ_p(ζ_{p^∞})`. The
fibre products of this layer use `B ⊗̂_A C` itself, which is
not uniformised; uniformisation enters only where a consumer works among uniform pairs, and no
sheafiness of `B ⊗̂ᵘ_A C` and no fibre-product property of its adic spectrum is asserted.
*Needs:* AdicSpacesPartII layer R0; *supplier-contract-fibre-products*; Mathlib
`CategoryTheory.IsPushout`; Tau Ceti `Huber.Pair`, `Huber.IsTateRing`. README only (no Lean declaration).

**Checks.**

- *uniform_polydisc* — `K⟨T⟩ ⊗̂ᵘ_K K⟨S⟩ ≅ K⟨T, S⟩` and `ι` is an isomorphism, the completed tensor
  product being already uniform (the computation Check of AdicSpacesPartII's
  *uniform-completed-tensor-product*).
- *cp_tensor_cp_not_uniform* (non-example) — `ℂ_p ⊗̂_{ℚ_p} ℂ_p → ℂ_p ⊗̂ᵘ_{ℚ_p} ℂ_p` is not an
  isomorphism: the separated completion is not uniform (the non-example of AdicSpacesPartII's
  *uniform-completed-tensor-product*). The trace computation of the witness above is typed here:
  `Tr(O_{K_n}) = p^{n−1}ℤ_p` for `n ≥ 1`, which is all of `ℤ_p` at `n = 1` (including `p = 2`,
  where `K_1 = ℚ_2`) and `pℤ_p` at `n = 2`.
- *galois_tensor_prod* — for a finite Galois extension `L/K` of complete nonarchimedean fields,
  `L ⊗̂ᵘ_K L ≅ ∏_{σ ∈ Gal(L/K)} L` via `x ⊗ y ↦ (x·σ(y))_σ`, so `inlᵘ(x) = (x)_σ` is the diagonal
  and `inrᵘ(y) = (σ(y))_σ`; `L ⊗_K L` is already complete and uniform (its power-bounded subring
  is `∏ O_L`), so `ι` is an isomorphism (the existence of the isomorphism is the Galois
  characterisation of AdicSpacesPartII's *uniform-completed-tensor-product*). For
  `L = ℚ_p(√p)`: `inrᵘ(√p) = (√p, −√p)`; for `L = K`
  (trivial group) it is the unit `K ⊗̂ᵘ_K K = K`.
- *dual_numbers_unit_not_uniform* (non-example) — for `B = ℚ_p[ε]/(ε²)` with `B⁺ = ℤ_p + ℚ_p ε`
  (a Tate ring for the product topology, `B° = B⁺` unbounded) and `C = A = ℚ_p`:
  `B ⊗̂_{ℚ_p} ℚ_p = B` is complete and `ι : B → B ⊗̂ᵘ_{ℚ_p} ℚ_p = (ℚ_p, ℤ_p)` is `a + bε ↦ a`
  (the spectral seminorm is `|a + bε|_sp = |a|`, AdicSpacesPartII layer R0's
  *uniformization_dualNumbers*); `ι` is not injective, so "complete" does not give "uniform" even
  when one factor is the base, and the pushout among uniform pairs of `B ← ℚ_p → ℚ_p` is `ℚ_p`,
  not `B`.
- *split_injection_lost_by_uniformisation* (non-example) — a topologically split injection stays
  split after completed base change but may lose the splitting after uniform completion ([HK] §7,
  Rem. 7.2, p. 25), which AdicSpacesPartIV layer R5 uses for sousperfectoid base change; this is
  why the fibre products of this layer are formed on `B ⊗̂_A C` and not on its uniformisation.

### A0.3 tracking rings of definition, pseudouniformisers and plus rings

**Definition data and plus rings through the completed tensor product.**
(*definition-data-and-plus-ring-tracking*) Let `f : (A, A⁺) → (B, B⁺)`, `g : (A, A⁺) → (C, C⁺)`
be morphisms of complete Hausdorff Huber pairs with adic ring homomorphisms and
`D = (D, D⁺) = B ⊗̂_A C` (AdicSpacesPartII layer R0). (a) Rings and ideals of definition: the
topological ring `D` and the maps `inl`, `inr` depend only on the topological rings `A`, `B`, `C`
and the ring maps `f`, `g`, not on the rings of definition, the ideal of definition or the plus
rings used to build the topology; and if `ϖ` is a pseudouniformiser of `A`, `B` or `C` (Tau Ceti
`Huber.IsPseudoUniformizer`), its image in `D` is a pseudouniformiser of `D` ([Hüb] §9, proof of
Thm. 9.2, p. 41; `TauCeti.Huber.IsPseudoUniformizer.map` for the left coprojection, the image being a
unit and topologically nilpotent under any continuous ring homomorphism, also when `D = 0`).
(b) Independence of `A⁺` (`Huber.Pair.completedTensor.plus_eq_of_basePair`): `D⁺` is the closure in
`D` of the integral closure of
the subring generated by `inl(B⁺) ∪ inr(C⁺)`, so `D⁺` depends only on `(B⁺, C⁺)` and does not
change when `A⁺` is replaced by another ring of integral elements `A'⁺` with `f(A'⁺) ⊆ B⁺` and
`g(A'⁺) ⊆ C⁺` ([Hüb] §9, proof of Thm. 9.2, p. 41; [H94] §3, proof of Lem. 3.9(i), p. 537, where
the completed tensor product is the completion of the affinoid ring `(E, E⁺)` and its plus ring is
carried through the completion). (c) Change of plus rings: let `B'⁺ ⊇ B⁺` and `C'⁺ ⊇ C⁺` be rings
of integral elements of `B` and `C` and `D'⁺` the plus ring of `D` for `(B'⁺, C'⁺)`. Prove
`Huber.Pair.completedTensor.plus_mono` and `Huber.Pair.completedTensor.spa_plus_eq_inter_preimage`:
`D⁺ ⊆ D'⁺`, the identity of `D` is a morphism of Huber pairs `(D, D⁺) → (D, D'⁺)`, and
`Spa(D, D'⁺) = Spa(inl)⁻¹(Spa(B, B'⁺)) ∩ Spa(inr)⁻¹(Spa(C, C'⁺))` as subsets of `Spa(D, D⁺)`, by
the membership criterion that a point lies in `Spa(D, D'⁺)` iff it is bounded by `1` on `D'⁺`
([KL I] §2.4, Def. 2.4.3 and (2.4.3.1), pp. 38–39): for a continuous valuation `v` the set `{v ≤ 1}` is closed and
integrally closed, so `v ≤ 1` on `D'⁺` iff `v ≤ 1` on `inl(B'⁺)` and on `inr(C'⁺)`. When the pairs and their completed tensors are sheafy, this identifies the underlying
subset of `Spa(B, B'⁺) ×_{Spa(A, A⁺)} Spa(C, C'⁺)` inside
`Spa(B, B⁺) ×_{Spa(A, A⁺)} Spa(C, C⁺)`. Enlarging a plus ring does not in general give an open
immersion; openness requires an additional rational-localisation hypothesis. Of (a)–(c)
the base-plus equality in (b) also holds for noncomplete Huber rings with adic structure maps,
since the completed pair depends definitionally only on the two factor plus rings.
Only (c) is new to this roadmap: the independence of choices in (a) is AdicSpacesPartII layer R0
(*adic-hom-choice-independence* with the construction *completed-tensor-product*), the
pseudouniformiser clause is Tau Ceti `Huber.IsPseudoUniformizer.map` (any continuous
monoid-with-zero homomorphism carries pseudouniformisers to pseudouniformisers) with R0's
`Pair.completedTensor.isTateRing`, (b) reads off R0's `Pair.completedTensor.plus_eq`, and (c) is
a two-line consequence of Tau Ceti `spa_antitone` and `spa_integralClosure`. *Needs:*
AdicSpacesPartII layer R0 (*completed-tensor-product*, *adic-hom-choice-independence*);
*supplier-contract-fibre-products*; Tau Ceti
`TauCeti.ValuationSpectrum.spa_antitone`, `TauCeti.ValuationSpectrum.spa_integralClosure`,
`Huber.Pair.Hom.spaComap`, `Huber.IsPseudoUniformizer`, `Huber.IsPseudoUniformizer.map`; Mathlib
`integralClosure`. README only (no Lean declaration).

**Checks.**

- *plus_ring_independent_of_base_plus* — let `K` be a complete rank-one field whose residue field
  carries a nontrivial valuation ring (for instance the completion of `ℚ_p(t)` for the Gauss norm,
  with residue field `𝔽_p(t)`) and `K⁺ ⊊ K°` the preimage of `𝔽_p[t]_(t)`; then
  `(K⟨T⟩, K°⟨T⟩) ⊗̂_{(K, K⁺)} (K⟨S⟩, K°⟨S⟩)` and the same product over `(K, K°)` are both
  `(K⟨T, S⟩, K°⟨T, S⟩)`. When formalised, the check works for every complete
  nonarchimedean Tate field with a proper smaller plus ring: the two tensor plus subrings are
  equal, and a homeomorphic ring equivalence takes them to `Huber.Pair.polydiscPlus` in two variables,
  fixing coefficients and sending the ordered tensor coordinates to coordinates zero and one.
- *rank_three_plus* (computation) — a valuation subring of rank three properly contained
  in the rank-one power-bounded subring gives a three-point spectrum; enlarging the plus ring
  to `K°` gives a one-point spectrum. The two-point count in *spa_change_of_plus_ring* uses rank two.
- *spa_change_of_plus_ring* (computation) — with the same `K` (`K⁺` is a valuation ring of rank two, open since
  it contains `pK°`, hence a ring of integral elements), `(K, K⁺) ⊗̂_{(K, K⁺)} (K, K⁺)` is
  `(K, K⁺)`. The continuous valuations of `K` are the valuation rings `R ⊆ K°` (`pK° ⊆ 𝔪_R`
  forces `R ⊆ K°`, and `v(p)` is then cofinal), one for each valuation ring of the residue field
  `𝔽_p(t)`, so `Cont(K)` is infinite; `Spa(K, K⁺)` is the set of those containing `K⁺`, and the
  overrings of a valuation ring are totally ordered, so `Spa(K, K⁺) = {K⁺, K°}` has two points
  (the rank-one point and the rank-two point). Replacing the second factor by `(K, K°)` gives
  `(K, K°)`, whose plus ring is the closure of the integral closure of the ring generated by `K⁺`
  and `K°`, and `Spa(K, K°) = {K°}` is the single rank-one point, which is
  `Spa(inl)⁻¹(Spa(K, K⁺)) ∩ Spa(inr)⁻¹(Spa(K, K°)) = {K⁺, K°} ∩ {K°}`.
  When formalised, the check applies clause (c) of *definition-data-and-plus-ring-tracking*
  (proposed `Huber.Pair.completedTensor.spa_plus_eq_inter_preimage`) with
  `A = B = C = K`, `S⁺ = T⁺ = U⁺ = T'⁺ = K⁺` and `U'⁺ = K°`: it retains the two field-spectrum
  counts, states the intersection equality for `D' = Pair.completedTensor S S S'`, and concludes
  `(spa D'.plus).ncard = 1` through that equality.
- *pseudouniformiser_tensor* — `p` is a pseudouniformiser of
  `ℚ_p⟨T⟩ ⊗̂_{ℚ_p} ℚ_p⟨S⟩ = ℚ_p⟨T, S⟩`.

### A0.4 pullback along rational open immersions

**Pullback along a rational open immersion is restriction.** (*rational-pullback-comparison*)
The set-level preimage is supplied by AdicSpacesPartII R0 and Tau Ceti. The ring isomorphism
`Huber.Pair.completedTensor.rationalLocalizationIso`, its coefficient equation
`rationalLocalizationIso_tmul_coeff`, its homeomorphism theorem
`isHomeomorph_rationalLocalizationIso` and its plus-ring theorem `rationalLocalizationIso_plus`
are targets of this roadmap on R0’s completed-tensor carrier. For a morphism `φ : (A, A⁺) → (B, B⁺)` of complete Hausdorff Huber pairs
with adic ring homomorphism (automatic if `A` is Tate), `T ⊆ A` finite with `T·A` open and
`s ∈ A`, the preimage `Spa(φ)⁻¹(R(T/s))` is the rational subset `R(φ(T)/φ(s))` of `Spa(B, B⁺)`
(Tau Ceti `Huber.Pair.Hom.spaComap_preimage_rationalSubset`), the morphism
`B ⊗̂_A A⟨T/s⟩ → B⟨φ(T)/φ(s)⟩` induced by the pushout of *supplier-contract-fibre-products* is an
isomorphism of complete Huber pairs over `(B, B⁺)` (both sides represent the maps out of `B`
sending `Spa` into the preimage of `R(T/s)`: [KL I] §2.4, Def. 2.4.12 and the paragraph after it,
p. 41) — the declarations
`Huber.Pair.completedTensor.rationalLocalizationIso` and `isHomeomorph_rationalLocalizationIso`
name the isomorphism on R0's completed-tensor carrier. Its coefficient law is
`rationalLocalizationIso_tmul_coeff`: `b ⊗ a ↦ b·φ(a)`; together with continuity and
invertibility of the denominator this determines the map. `rationalLocalizationIso_plus` states the exact transport of the plus subring: take
the integral closure of `B⁺[φ(T)/φ(s)]` in the uncompleted localisation and then the closure
of its image in the completion, as in `PairOfDefinition.completedPlusSubring` — and when `(A, A⁺)` and `(B, B⁺)` are sheafy
`Spa(B ⊗̂_A A⟨T/s⟩) = Spa(B, B⁺) ×_{Spa(A, A⁺)} R(T/s) = R(φ(T)/φ(s))`, sheafy as an open subspace
of `Spa(B, B⁺)`. For an arbitrary morphism `g : Y → X` of adic spaces and an open `U ⊆ X` the
open subspace `g⁻¹(U)` is the fibre product `Y ×_X U` with no hypothesis on `g` (AdicSpaces
layer 5, open immersions are monomorphisms), and without adicness the tensor formula fails: the
preimage of `R(p/p) = Spa(ℚ_p, ℤ_p)` under `Spa ℤ_p⟦X⟧ → Spa ℤ_p` (`(p, X)`-adic, not adic) is
the open unit disc over `ℚ_p`, not quasi-compact, hence not rational, R0's fibre product along a
non-adic map (*fibre-product-along-finite-type*; [Wedhorn] §7.5, Lem. 7.46(3), p. 68). *Needs:*
AdicSpacesPartII layer R0 (*completed-tensor-rational-localisation*,
*fibre-product-along-finite-type*); *supplier-contract-fibre-products*; AdicSpaces layers 3 and
5; Tau Ceti `Huber.Pair.Hom.spaComap_preimage_rationalSubset`,
`Huber.PairOfDefinition.completionLocalization`. README only (no Lean declaration).

**Checks.**

- *rational_comparison_unit* (degenerate denominator) — for `s = 1` and an open numerator
  ideal, the comparison takes `b ⊗ 1` to the image of `b` in `B⟨φ(T)/1⟩`.
- *rational_comparison_zero* (zero constant coefficient) — on the square-map chart
  `R((S², p)/p)`, the comparison sends `S ⊗ T` to `S³`, and the latter is nonzero in
  the completed rational localisation. This distinguishes the coordinate computation even
  when the input has no constant term.
- *rational_comparison_zero_empty_chart* (empty chart) — for `s = 0`, both localisations are
  zero rings, and the comparison sends every element to zero.
- *rational_comparison_two_terms* (convention) — for coefficients `a,a' ∈ A`, `b,b' ∈ B`,
  `b ⊗ a + b' ⊗ a'` maps to `bφ(a) + b'φ(a')`. In the square-map example `T ↦ S²`,
  the two terms `S ⊗ T + 1 ⊗ 1` give `S³ + 1`, fixing which factor supplies each coefficient.
- *rational_pullback_square* — for `Y = Spa(ℚ_p⟨S⟩, ℤ_p⟨S⟩) → X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, `T ↦ S²`,
  and `U = {|T| ≤ |p|} = R((T, p)/p)` (the set `{T, p}` generates the unit ideal; `{T}` alone
  generates `(T)`, which is not open in the Tate ring `ℚ_p⟨T⟩`, so `R(T/p)` is not a rational
  subset in Huber's sense although it is the same set): `g⁻¹(U) = R((S², p)/p) = {|S²| ≤ |p|}` and
  `ℚ_p⟨S⟩ ⊗̂_{ℚ_p⟨T⟩} ℚ_p⟨T⟩⟨(T, p)/p⟩ ≅ ℚ_p⟨S⟩⟨(S², p)/p⟩`, that is
  `ℚ_p⟨S⟩ ⊗̂_{ℚ_p⟨T⟩} ℚ_p⟨T/p⟩ ≅ ℚ_p⟨S, S²/p⟩`. When formalised, the check
  constructs the square map with its coefficient equations, states the preimage equality, and
  identifies the actual `Pair.completedTensor` coprojection as the rational localisation at
  `{S²,p}/p`. It also evaluates `Pair.completedTensor.rationalLocalizationIso` itself on
  `S ⊗ T + 1 ⊗ 1`, giving the image of `S³ + 1` under `PairOfDefinition.toCompletionLoc`.
  The source uses the numerator set `{T,p}` and denominator `p`; the target uses their
  images under the square map, namely `{S²,p}` and `p`. The open-ideal and denominator-power
  witnesses are asserted to exist. Its pushout square and the equation equating the two
  images of `T` fix the comparison.
- *nonadic_preimage_not_quasicompact* (non-example) — for the continuous, non-adic
  `ℤ_p → ℤ_p⟦X⟧` (`(p, X)`-adic) the preimage of `R(p/p) = Spa(ℚ_p, ℤ_p)` in
  `Spa(ℤ_p⟦X⟧, ℤ_p⟦X⟧)` is `{v : v(p) ≠ 0}`, the increasing union of the charts `R((Xⁿ, p)/p)`
  below, and is not quasi-compact: the classical point `X ↦ p^{1/(n+1)}` lies in it and not in
  `R((Xⁿ, p)/p)`. As a set it equals `R(φ(p)/φ(p))` (Tau Ceti's
  `TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset` needs no adicness), but `{p}` generates the non-open
  ideal `(p)` of `ℤ_p⟦X⟧`, so it is not a rational subset; adicness is the hypothesis that
  restores the rational form.
- *open_disc_zero_exponent* (degenerate) — `X⁰ = 1`, so `(X⁰)` is the open unit ideal.
  The non-openness assertion for `(Xⁿ)` in `ℤ_p⟦X⟧` assumes `n > 0`, including at `p = 2`.
- *open_disc_nonadic_base* (non-example) —
  `Spa ℤ_p⟦X⟧ ×_{Spa ℤ_p} Spa(ℚ_p, ℤ_p) = ⋃_n R((Xⁿ, p)/p) = {v : v(p) ≠ 0}` is the open unit
  disc over `ℚ_p` (the union is over `n ≥ 1`), the fibre product over a non-adic base
  described above, with no tensor formula ([Hüb]
  §9, Ex. 9.4, p. 43; [Berkeley] Lecture 4, examples of adic spaces, p. 28): a continuous `v`
  with `v(p) ≠ 0` has `v(Xⁿ) < v(p)` for large `n`, since `{v < v(p)}` is open and contains a
  power of `(p, X)`. The chart must be written with `T = {Xⁿ, p}`: `{Xⁿ}·ℤ_p⟦X⟧ = (Xⁿ)` is not
  open for the `(p, X)`-adic topology, so "`R(Xⁿ/p)`" is not a rational subset, while
  `(Xⁿ, p) ⊇ (p, X)ⁿ` is open. The `n`-th chart has coordinate ring `ℚ_p⟨X, Xⁿ/p⟩`, and the
  union is not quasi-compact.


**`AdicSpace.IsRationalChartMap`.** A rational chart map is one rational localization, with its affinoid identifications. README only (no Lean declaration).

**Checks.**

- *AdicSpace_IsRationalChartMap_positive* (computation) — The closed rational subdisc |T| ≤ |2| embeds as a rational chart.
- *AdicSpace_IsRationalChartMap_degenerate* (degenerate) — The identity on the empty affinoid is a rational chart map.
- *AdicSpace_IsRationalChartMap_negative* (non-example) — The two-sheeted fold is not a rational chart map; finite étale maps cannot replace rational embeddings.

### A0.5 pullback along finite étale maps

**Pullback along a finite étale map is the uncompleted tensor product.**
(*finite-etale-pullback-comparison*) This clause of the contract is AdicSpacesPartII layer R0
(*finite-algebra-tensor-complete*), used here for finite étale algebras: for a finite morphism
`φ : (A, A⁺) → (B, B⁺)` of complete Hausdorff Tate Huber pairs whose ring homomorphism is étale
(Mathlib `Algebra.Etale A B`, so `B` is a finite projective `A`-module, Mathlib
`Algebra.Smooth.flat`, `Module.Flat.projective_of_finitePresentation`) and a morphism
`(A, A⁺) → (C, C⁺)` to a complete Hausdorff Tate pair, the algebraic tensor product `B ⊗_A C`
with its natural `C`-module topology is complete and Hausdorff (a direct summand of a finite free
`C`-module, [KL I] §2.2, Lem. 2.2.12(a), p. 32) and the canonical map
`B ⊗_A C → B ⊗̂_A C` is an isomorphism of topological rings, `C → B ⊗_A C` is finite étale
(Mathlib `Algebra.Etale.baseChange`, `Module.Finite.base_change`), and, when `B⁺` is the integral
closure of the image of `A⁺` in `B`, the plus ring of `B ⊗̂_A C` is the integral closure of the
image of `C⁺` with no closure needed and `(C, C⁺) → (B ⊗_A C, (B ⊗_A C)⁺)` is a finite morphism of
complete Tate pairs, and for
`f₁, …, f_n, g ∈ A` generating the unit ideal `Spa(φ)⁻¹(R(f/g)) = R(φ(f)/φ(g))` with coordinate
ring `B ⊗_A A⟨f/g⟩` — the proposed declarations `Huber.Pair.completedTensor.finiteEtaleEquivTensor`,
`isHomeomorph_finiteEtaleEquivTensor`, `plus_eq_integralClosure_of_finiteEtale` and
`inr_isFinite_of_finiteEtale` use the integral-closure plus ring, and rational preimages
are Tau Ceti’s `TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset`. R0 states the bijectivity of
`B ⊗_A C → B ⊗̂_A C` (for a finite morphism of Huber pairs, with `C` as left factor) and the
identification of the tensor topology with the module topology (*finite-algebra-tensor-complete*);
`finiteEtaleEquivTensor` restates the bijectivity for a finite étale algebra with its module
topology, needing no plus rings, and packages the inverse, and
`isHomeomorph_finiteEtaleEquivTensor` compares the module topology with that of the completion.
If `(B ⊗_A C, (B ⊗_A C)⁺)` is sheafy, for instance for `C` strongly
noetherian, `Spa(B ⊗_A C) = Spa(B, B⁺) ×_{Spa(A, A⁺)} Spa(C, C⁺)` in adic spaces
(*affinoid-fibre-product*). On sheafy pieces this is Kedlaya–Liu's stability of finite étale
morphisms of preadic spaces under base extension ([KL I] §8.2, Def. 8.2.16, p. 162). Sheafiness
of `B ⊗_A C` is not asserted for a general sheafy `C` ([KL I] §8.2, Rem. 8.2.18, p. 162); the
sousperfectoid and perfectoid cases are theorems of AdicSpacesPartIV layer R5 and PerfectoidSpaces
layer P3, and the non-sheafy case is handled by the generalized adic presentations of
AdicEtaleGeometry layer A1. *Needs:* AdicSpacesPartII layer R0 (*finite-algebra-tensor-complete*,
*affinoid-fibre-product*); *supplier-contract-fibre-products*; *rational-pullback-comparison*;
Mathlib `Algebra.Etale`, `Algebra.Smooth.flat`, `Module.Flat.projective_of_finitePresentation`,
`Algebra.Etale.baseChange`, `Module.Finite.base_change`.

The finite étale rational comparison is the composite of `finiteEtaleEquivTensor` with
`rationalLocalizationIso`; its coefficient formula is the same `b ⊗ a ↦ b·φ(a)`.
The ring equivalence and its homeomorphism only require `B` to have its natural module topology
and be finite étale; the two assertions about plus rings additionally require
`B⁺ = integralClosure(A⁺ → B)`.

For `B = A`, `Pair.completedTensor.finiteEtaleEquivTensor_self_tmul` states that
`finiteEtaleEquivTensor (a ⊗ₜ c) = tmul (a ⊗ₜ c)`.
`Pair.completedTensor.finiteEtaleUnitEquiv : CompletedTensor A A C ≃+* C` is the inverse
finite comparison followed by Mathlib's `Algebra.TensorProduct.lid A C`
(`Mathlib/RingTheory/TensorProduct/Maps.lean`). Its coefficient theorem
`finiteEtaleUnitEquiv_tmul` sends `tmul (a ⊗ₜ c)` to `algebraMap A C a * c`;
`isHomeomorph_finiteEtaleUnitEquiv` identifies the completed tensor topology with that of `C`.
Thus the finite comparison followed by this unit equivalence computes scalar multiplication. README only (no Lean declaration).

**Checks.**

- *finiteEtaleUnitEquiv_scalars* (computation) — the composite sends `a ⊗ 1` to
  `algebraMap A C a`.
- *finiteEtaleUnitEquiv_twoTerms* (computation) — the composite sends
  `a₁ ⊗ c₁ + a₂ ⊗ c₂` to `algebraMap A C a₁ * c₁ + algebraMap A C a₂ * c₂`.
- *finiteEtaleUnitEquiv_inverse* (computation) — the inverse unit equivalence sends every
  `c : C` to `tmul (1 ⊗ c)`.
- *finite_tensor_coefficients* (unfolding: additivity of the canonical map) — the equivalence sends
  `b₁ ⊗ c₁ + b₂ ⊗ c₂` to `tmul(b₁ ⊗ c₁) + tmul(b₂ ⊗ c₂)`: its forward map is the canonical one,
  not a composite with an automorphism of `B ⊗̂_A C`.
- *finite_tensor_split* (computation) — for the split rank-two algebra `B = A × A`,
  `(A × A) ⊗̂_A C ≅ C × C` with no completion, `(1, 0) ⊗ c₁ + (0, 1) ⊗ c₂ ↦ (c₁, c₂)`: the two
  idempotents give the two coordinates.
- *finite_tensor_rank_zero* (unfolding: subsingleton source) — for the zero finite étale algebra `B`,
  the tensor and its completion are zero; the inverse equivalence sends every element to zero.
- *finite_tensor_inverse* (unfolding: inverse of the canonical map) — the inverse sends `tmul(b ⊗ c)` to `b ⊗ c`.
  For the rank-one algebra `B = A`, composing the forward comparison with
  `finiteEtaleUnitEquiv` gives scalar multiplication `a ⊗ c ↦ ac`.
- *finite_tensor_infinite_rank* (non-example) — for two one-variable Tate algebras over
  `ℚ_p`, the algebraic tensor does not exhaust its completion: `Σₙ pⁿTⁿSⁿ` has an infinite-rank
  diagonal coefficient matrix, whereas a finite sum of separated products has finite rank.
  Thus the finite-module hypothesis cannot be dropped, including when `p = 2`.
- *finite_pair_identity_plus* (non-example) — `inr_isFinite_of_finiteEtale` needs
  `B⁺ = integralClosure(A⁺ → B)`. For `A = B = C = K` a complete Tate field with `C⁺ ⊊ B⁺` (for
  instance `A⁺ = C⁺ = K⁺ ⊊ K° = B⁺`), every other hypothesis holds,
  `K ⊗̂_K K = K` has plus ring `B⁺`, and `inr` is the identity `(K, C⁺) → (K, B⁺)`, which is
  finite as a ring map but not as a morphism of Huber pairs: `B⁺` is not integral over the
  integrally closed `C⁺`. For the bare identity this is the non-example of AdicSpacesPartII's
  *finite-huber-pair-hom*.
- *square_root_over_unit_circle* — for `A = ℚ_p⟨T^{±1}⟩` (the unit circle `|T| = 1`) and
  `B = A[S]/(S² − T)`, which is finite étale for every `p` because `2S` is a unit of `B` (`2` is
  a unit of `ℚ_p` and `S² = T` is a unit of `A`); for `p` odd, over the rational subset
  `U = {|T − 1| ≤ |p|} = R((T − 1, p)/p)` the element `T` has a square root (the binomial series
  for `(1 + (T − 1))^{1/2}` has coefficients in `ℤ[1/2] ⊆ ℤ_p` and converges for `|T − 1| < 1`),
  so `B ⊗_A A⟨(T − 1)/p⟩ ≅ A⟨(T − 1)/p⟩ × A⟨(T − 1)/p⟩` without completion, and
  `Spa(B) ×_{Spa A} U` is two disjoint copies of `U`.
- *square_root_p_two* (negative control, `p = 2`) — for `p = 2` and the same `U = {|T − 1| ≤ |2|}`
  the pullback does not split: at the classical point `T = 3 ∈ U` the fibre is
  `ℚ_2[S]/(S² − 3) = ℚ_2(√3)`, a field, since `3 ≢ 1 (mod 8)` is not a square in `ℚ_2`. Over
  `U' = {|T − 1| ≤ |8|}` it splits (`1 + 8y` is a square in `ℤ_2` for every `y ∈ ℤ_2`, and the
  binomial series converges for `|T − 1| ≤ |8|`): the radius of splitting depends on `p` through
  `|2|`. When formalised, the check uses the completed tensor product over the two actual
  rational localisations: it excludes a ring equivalence with the product over the
  radius-`|2|` disc and supplies one over the radius-`|8|` disc, sending every base element to
  its diagonal. The scalar facts at `3` and
  `17` accompany these assertions about the completed pullbacks.

### A0.6 chart independence

**Every affinoid chart of the glued fibre product is the completed tensor product of the charts
below it.** (*fibre-product-affinoid-chart-comparison*) This clause of the contract is
AdicSpacesPartII layer R0: for morphisms `f : X → S`, `g : Y → S` of adic spaces satisfying R0's
existence hypotheses with both `f` and `g` adic, `Z = X ×_S Y` the glued fibre product with projections `p`,
`q` (*fibre-products-existence*), and open affinoids `W = Spa(A, A⁺) ⊆ S`,
`U = Spa(C, C⁺) ⊆ f⁻¹(W)`, `V = Spa(B, B⁺) ⊆ g⁻¹(W)` with complete Hausdorff pairs such that
`C ⊗̂_A B` is sheafy, the open subspace `p⁻¹(U) ∩ q⁻¹(V)` of `Z` is `U ×_W V` (open immersions are
monomorphisms, AdicSpaces layer 5) and hence canonically `Spa(C ⊗̂_A B)` with `Spa(inl)`,
`Spa(inr)` of *supplier-contract-fibre-products* (*affinoid-fibre-product*); no choice of cover
enters, so the identification is independent of the affinoid cover used to glue `Z`, and for
rational `U' ⊆ U`, `V' ⊆ V`, `W' ⊆ W` with `f(U') ⊆ W' ⊇ g(V')` it restricts to
`O(U') ⊗̂_{O(W')} O(V') ≅ O(p⁻¹(U') ∩ q⁻¹(V'))` (*completed-tensor-rational-localisation*). In
particular any two gluings of `Z` from affinoid charts are canonically isomorphic, compatibly
with all charts. *Needs:* AdicSpacesPartII layer R0 (*fibre-products-existence*,
*affinoid-fibre-product*, *completed-tensor-rational-localisation*);
*supplier-contract-fibre-products*; Mathlib `CategoryTheory.IsPullback`.

**Checks.**

- *chart_restricts_to_rational* — for `X = Y = Spa ℚ_p⟨T⟩` (the second copy with coordinate
  `S`) over `S = Spa ℚ_p`, `U = X`, `V = Y`, `W = S`, and the rational subsets
  `U' = {|T| ≤ |p|} = R((T, p)/p)`, `V' = {|S| = 1} = R(1/S)`, `W' = W`: the chart isomorphism
  `Spa(ℚ_p⟨T⟩ ⊗̂_{ℚ_p} ℚ_p⟨S⟩) ≅ Spa ℚ_p⟨T, S⟩` with `T ↦ T ⊗ 1`, `S ↦ 1 ⊗ S` restricts to
  `ℚ_p⟨T/p⟩ ⊗̂_{ℚ_p} ℚ_p⟨S, S⁻¹⟩ ≅ ℚ_p⟨T, S⟩⟨(T, p)/p, 1/S⟩`, the ring of
  `p⁻¹(U') ∩ q⁻¹(V') = {|T| ≤ |p|, |S| = 1}` (AdicSpacesPartII layer R0's worked instance). The
  identification with the factors exchanged, `T ↦ 1 ⊗ S`, does not restrict: it would send the
  ring of `{|T| ≤ |p|, |S| = 1}` to the ring of `{|S| ≤ |p|, |T| = 1}`, and the point
  `(T, S) = (0, 1)` lies in the first subset and not in the second.
- *gluings_canonically_isomorphic* — for `X = Y = Spa ℚ_p⟨T⟩` over `S = Spa ℚ_p`, the gluing
  `Z₁ = Spa ℚ_p⟨T, S⟩` from the trivial cover of `X` and the gluing `Z₂` of
  `Spa ℚ_p⟨T/p, S⟩` and `Spa ℚ_p⟨T, p/T, S⟩` along `Spa ℚ_p⟨T/p, p/T, S⟩` from the cover
  `X = {|T| ≤ |p|} ∪ {|p| ≤ |T|}` are isomorphic by the unique isomorphism over `X` and `Y`,
  which on the two charts of `Z₂` is the rational cover `{|T| ≤ |p|} ∪ {|p| ≤ |T|}` of the
  closed bidisc. Compatibility with the projections is what makes it unique: the automorphism
  `T ↔ S` of `Z₁` composed with it is another isomorphism `Z₂ ≅ Z₁`, which does not commute with
  `p : Z → X`.


The proposed complete-pair site `CAff` uses `AdicSpace.Affinoid.toCAff` to forget the chosen
sheafy presentation of a Part II affinoid. `Affinoid.toCAffIso` identifies its spectrum with
`CAff.adicSpa`, fixing valuations and the coefficient map (Huber 1996, §1.1, pp. 38–39).
Chart restrictions use this comparison and the supplied open embedding `Chart.ι`. This comparison
and its Checks are README only (no Lean declaration).

**Checks.**

- *Affinoid_toCAff_coefficients* — The coefficient ring is unchanged.
- *Affinoid_toCAff_integralElements* — The plus ring is unchanged.
- *Affinoid_toCAff_zero* — A zero coefficient ring has empty spectrum.
- *Affinoid_toCAffIso_points* — Each valuation is fixed by the spectrum comparison.
- *Affinoid_toCAffIso_coefficients* — Pullback sends each coefficient section to `Affinoid.coeff` of that coefficient.
- *Affinoid_toCAffIso_empty* — The comparison includes the empty affinoid.

**`TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Chart`.** A chart includes an open immersion of a sheafy affinoid, rather than an arbitrary affinoid map. The structure is AdicSpacesPartII's; the Checks below are README only (no Lean declaration).

**Checks.**

- *AdicSpace_Chart_positive* (computation) — The split two-point affinoid admits its identity chart with coefficient ring Q₂ × Q₂.
- *AdicSpace_Chart_degenerate* (degenerate) — The empty affinoid admits its identity chart with zero coefficient ring.
- *AdicSpace_Chart_negative* (non-example) — The two-sheeted fold onto Spa(Q₂,Z₂) cannot be a chart map, even after an isomorphism of its source.

### A0.7 associativity, symmetry and unit

**Associativity, symmetry and unit isomorphisms, and their affinoid formulas.**
(*fibre-product-associativity-and-unit*) Let `S` be an adic space and `X → S`, `Y → S`, `Z → S`
morphisms locally of finite type, with `S`, `X`, `Y`, `Z` covered by open affinoids whose rings
are complete and stably sheafy (for instance all locally noetherian). Then all iterated fibre
products of `X`, `Y`, `Z` over `S` exist (AdicSpacesPartII layer R0, existence of fibre products;
local finite type and stable sheafiness pass to base changes and composites by R0's base-change
stability, and the projections stay locally of finite type, [H94] §3, Prop. 3.7, p. 535), and
the canonical isomorphisms `(X ×_S Y) ×_S Z ≅ X ×_S (Y ×_S Z)` (Mathlib
`CategoryTheory.Limits.pullbackAssoc`), `X ×_S Y ≅ Y ×_S X` (Mathlib
`CategoryTheory.Limits.pullbackSymmetry`) and `X ×_S S ≅ X` (Mathlib
`CategoryTheory.IsPullback.of_id_snd`) are the unique isomorphisms compatible with the
projections, so they satisfy every coherence identity between composites of them (the pentagon
and hexagon type identities) by uniqueness of morphisms into a limit.
`AdicSpace.FibreProduct.associator`, `.symmetry` and `.unit` state the unique isomorphisms
for chosen fibre products, while `.hom_ext` gives the projection criterion for coherence.
Their chart identifications are `.associator_affinoid`, `.symmetry_affinoid` and `.unit_affinoid`;
the first has ring map `assoc.symm`, the second interchanges tensor factors, and the third has
inverse ring map `b ⊗ a ↦ b·a`. Prove
`Huber.Pair.completedTensor.assoc`: on affinoid charts `S ⊇ Spa(A, A⁺)`, with `Spa(C, C⁺)`,
`Spa(B, B⁺)`, `Spa(E, E⁺)` above it and all structure maps adic (automatic here, since
morphisms locally of finite type are adic, AdicSpacesPartII layer R0; also automatic over an
analytic base), the ring associator is the isomorphism
`(C ⊗̂_A B) ⊗̂_A E ≅ C ⊗̂_A (B ⊗̂_A E)`, `(c ⊗ b) ⊗ e ↦ c ⊗ (b ⊗ e)`, compatible with the three
coprojections. Because `Spa` is contravariant, the geometric associator in the displayed
forward direction is `Spa(assoc.symm)`. The ring associator is obtained by pasting the pushout squares of *supplier-contract-fibre-products*
(Mathlib `CategoryTheory.IsPushout.paste_horiz`; [Morel] §II.3.2, Prop. II.3.2.1, pp. 76–77): both sides
are the colimit of the diagram `C ← A → B`, `A → E` among complete Huber pairs, the outer
structure map `A → C ⊗̂_A B` being adic as the composite `inl ∘ (A → C)`. At the ring level, `assoc`, `isHomeomorph_assoc` and `assoc_tmul` apply to arbitrary
Huber rings `A`, `B`, `C`, `E` with adic structure maps from `A`; completeness of the inputs
is unnecessary because both sides are completed. The theorem `assoc_plus` transports the
plus ring of the left iterated pair tensor onto that of the right. Its inputs are the four
Huber pairs and the plus-preservation conditions on the original and intermediate structure
maps; the latter follow by composing the coprojections. The geometric statements retain the
sheafiness and existence hypotheses above. The symmetry is `Spa`
of R0's `Huber.Pair.completedTensor.comm`, and the unit is `Spa` of `B ⊗̂_A (A, A⁺) ≅ (B, B⁺)` for
complete `B` (AdicSpacesPartII layer R0). On rings nothing here is new: `comm` and
`cancelBaseChange` are R0's (*completed-tensor-product*), their uniform counterparts
`uniformCompletedTensor.comm` and `unitIso` are R0's (*uniform-completed-tensor-product*), and
`assoc` and the unit isomorphism are formal consequences of the pushout of
*supplier-contract-fibre-products* and of R0's universal property
(*completed-tensor-product-universal-property*); the content of this item is the passage from
charts to the glued fibre products and the coherence of the three isomorphisms there. The
existence hypotheses are kept because fibre
products of adic spaces do not exist in general ([Berkeley] Lecture 4, examples of adic spaces,
p. 28). *Needs:* AdicSpacesPartII layer R0; *supplier-contract-fibre-products*;
*fibre-product-affinoid-chart-comparison*; Mathlib `CategoryTheory.Limits.pullbackAssoc`,
`CategoryTheory.Limits.pullbackSymmetry`, `CategoryTheory.IsPullback.of_id_snd`,
`CategoryTheory.IsPushout.paste_horiz`. README only (no Lean declaration).

**Checks.**

- *associator_two_terms* (convention) — the sum `(c₁ ⊗ b₁) ⊗ e₁ + (c₂ ⊗ b₂) ⊗ e₂`
  goes to `c₁ ⊗ (b₁ ⊗ e₁) + c₂ ⊗ (b₂ ⊗ e₂)`. The factor order is `C,B,E` on both sides.
- *associator_inverse_two_terms* (contravariance) — the inverse takes
  `c₁ ⊗ (b₁ ⊗ e₁) + c₂ ⊗ (b₂ ⊗ e₂)` to `(c₁ ⊗ b₁) ⊗ e₁ + (c₂ ⊗ b₂) ⊗ e₂`;
  this is the pullback on functions of the forward geometric associator.
- *associator_zero_factor* (degenerate) — when `B = 0`, both completed tensors are zero
  and the associator is the unique map between zero rings.
- *associator_coprojections* (agreement) — `(c ⊗ 1) ⊗ e` maps to `c ⊗ (1 ⊗ e)`,
  preserving the outer two coprojections independently.
- *three_discs_associator* — for `S = Spa K` and three closed discs, both iterated fibre products
  are `Spa K⟨T, S, R⟩`, and the associator is the identity of `K⟨T, S, R⟩` under the evident
  identifications. When formalised, the check takes `K = ℚ_p`, uses
  `restrictedMvPowerSeriesCompletion 1 ℚ_[p]` for each disc and
  `restrictedMvPowerSeriesCompletion 3 ℚ_[p]` for the common target, and asserts the existence
  of both homeomorphic ring identifications. It pins coefficients and the three coordinates
  separately in each identification, in the order `T, S, R`, and states
  `(eL.symm.trans assoc).trans eR = RingEquiv.refl _` on the entire completed Tate algebra.
  *three_discs_associator_field* gives the coordinate-pinned comparison over every complete
  nonarchimedean field, with `Huber.Pair.polydiscVar` as the three coordinates.
- *base_change_transitivity* — for the closed unit disc `D` over `ℚ_p` and an embedding
  `ℚ_p(√p) ⊆ ℂ_p`,
  `(D ×_{Spa ℚ_p} Spa ℚ_p(√p)) ×_{Spa ℚ_p(√p)} Spa ℂ_p ≅ D ×_{Spa ℚ_p} Spa ℂ_p = Spa(ℂ_p⟨T⟩, O_{ℂ_p}⟨T⟩)`,
  the pasting of two pullback squares; on rings this is R0's `completedTensor.cancelBaseChange`.
- *symmetry_and_unit_on_charts* — on an affinoid chart the symmetry isomorphism is `Spa` of
  `completedTensor.comm` and the unit isomorphism is `Spa` of `B ⊗̂_A A ≅ B`. For
  `X = Y = Spa K⟨T⟩` over `Spa K` the symmetry `X ×_S X → X ×_S X` is `Spa` of the automorphism
  `T ↔ S` of `K⟨T, S⟩` (`comm(T ⊗ 1) = 1 ⊗ T`), an involution that is not the identity (it moves
  the point `(T, S) = (0, 1)` to `(1, 0)`); `comm ∘ comm` is the identity. For `X = Spa K⟨T⟩`,
  `Y = Spa K⟨S⟩` it is the identity `K⟨T, S⟩ = K⟨S, T⟩` only under the identification that
  relabels the factors. The unit `K⟨T⟩ ⊗̂_K K ≅ K⟨T⟩` is `T ⊗ 1 ↦ T`, with inverse `inl`, and the
  associator of three discs is the identity of `K⟨T, S, R⟩` under `(T ⊗ S) ⊗ R ↦ T ⊗ (S ⊗ R)`.
- *symmetry_and_unit_on_charts_spa* — over `ℚ₂`, the pair automorphism is the completed
  tensor symmetry, and its `Spa` map is an isomorphism exchanging the two geometric
  projections. It is an involution carrying the point cut out by `T = 0, S = 1` to the
  distinct point cut out by `T = 1, S = 0`, and back.
- *symmetry_and_unit_on_charts_unit* — over `ℚ₂`, the continuous algebra equivalence
  `D ⊗̂_{ℚ₂} ℚ₂ ≅ D`, for `D = ℚ₂⟨T⟩`, sends `b ⊗ a` to `b·a` and has inverse `inl`.
  Both maps preserve the plus rings. Their `Spa` maps are inverse, `Spa(inl)` is an
  isomorphism of adic spaces, and the coordinate formula is `T ⊗ 1 ↦ T`.

### A0.8 the analytic locus and restriction of morphisms

**The analytic locus of an adic space.** (*analytic-locus-restriction*) Let `X` be an adic space
(AdicSpaces layer 5). A point `x ∈ X` is analytic if it has an open neighbourhood `U` such that
`O_X(U)` contains a topologically nilpotent unit, equivalently if its support in some (every)
open affinoid neighbourhood `Spa(A, A⁺)` is not an open ideal (AdicSpacesPartII layer R0,
analytic points; Tau Ceti `ValuationSpectrum.IsAnalyticPoint`; [H94] §3, definition of analytic
points, p. 532; [Wedhorn] §8.3, Prop. and Def. 8.36, p. 85). The set `X_a` of analytic points is
open ([Hüb] §6, Lem. 6.10, p. 30; [Wedhorn] §8.3, Rem. 8.37(1), p. 86). Define
`AdicSpace.analyticLocus X` as the open adic subspace `X_a` of `X` on its analytic points, with
its open immersion `AdicSpace.analyticLocus.ι : X_a → X`; the class of analytic adic spaces,
those with `X_a = X`, is AdicSpacesPartII's `AdicSpace.IsAnalytic X` (Tate affinoid
neighbourhoods), and the equality is `AdicSpace.isAnalytic_iff_analyticPoints`. The carrier is Tau Ceti's
`TauCeti.AdicSpace` (the full subcategory of `TauCeti.PreAdicSpace` on `PreAdicSpace.isAdic`):
`X_a` is the restriction `PreAdicSpace.restrict` of `X` to the open set of analytic points, an
adic space by `PreAdicSpace.isAdic_restrict`, and `ι` is `PreAdicSpace.ofRestrict`, an open
immersion in the sense of `PreAdicSpace.IsOpenImmersion`.
Prove the membership criterion (`x ∈ X_a` iff some open neighbourhood `U` of `x` has a
topologically nilpotent unit in `O_X(U)`, iff the support of `x` in an open affinoid
neighbourhood is not open), `AdicSpace.IsAnalytic.isIso_ι` (`X` is analytic iff `ι_X` is an
isomorphism) and that `X_a` is analytic (an instance). Then:

- (a) For an open subspace `U ⊆ X`, `U_a = X_a ∩ U` ([Wedhorn] §8.3, Rem. 8.37(2), p. 86).
- (b) For `X = Spa(A, A⁺)` with `A` complete, `|X_a|` is Tau Ceti's `spaAnalytic A⁺`.
  It is quasi-compact (Tau Ceti
  `isCompact_val_preimage_spaAnalytic`), and for a pair of definition `(A₀, I)` and generators
  `G = {g₁, …, g_r} ⊆ A₀` of `I` (so `G·A ⊇ I·A` is open) it is the union of the rational
  subsets `R(G/gᵢ)`, whose coordinate
  rings `A⟨G/gᵢ⟩` are Tate rings — the Tate charts —, which on points is Tau Ceti's
  `spaAnalytic_eq_biUnion_rationalSubset` and `isTateRing_completion_locTopology_of_mem_generators`
  transported to the open subspace `X_a`. If `A` is Tate then `X_a = X` (a simp lemma; Tau Ceti
  `spaAnalytic_eq_spa_of_isTateRing` on points); and `X_a = ∅` iff `A` is discrete (Tau Ceti
  `spaAnalytic_eq_empty_iff_discrete_separationQuotient` on points, stated for a Huber ring that
  need not be Hausdorff, where it reads "the Hausdorff quotient of `A` is discrete"; `A` is
  complete, hence Hausdorff, here). These four lemmas restate Tau
  Ceti's point-set statements for the open subspace `X_a` and introduce no new point-set content.
  The Tate charts are how R0's constructions (completed tensor products, fibre products) are
  applied to non-Tate inputs such as `W(k)`, `ℤ_p⟦T⟧` and `A_inf`: on their analytic loci, through
  the Tate charts, on which every morphism is adic ([Hüb] §6, after Lem. 6.8, p. 29).
- (c) `X_a` is analytic, and every morphism from an adic space to an analytic adic space is adic
  (AdicSpacesPartII layer R0, *spa-comap-analytic-locus*).
- (d) Restriction: a morphism `f : Y → X` is adic iff `f(Y_a) ⊆ X_a`, a re-export of
  AdicSpacesPartII layer R0
  (*adic-iff-analytic-locus*); and then there is a unique `f_a : Y_a → X_a` with
  `ι_X ∘ f_a = f ∘ ι_Y`, functorial in `f`: `AdicSpace.IsAdic.analyticLocusMap`, with
  `analyticLocusMap_id` and `analyticLocusMap_comp` ([Wedhorn] §8.4, Prop. 8.39, p. 86).
- (e) Universal property: for an analytic adic space `T`, a morphism `g : T → X` factors through
  `ι_X` iff it is adic, and then uniquely: `AdicSpace.analyticLocus.lift`, the unique lift
  `T → X_a` with `ι_X ∘ lift = g` (Tau Ceti's `PreAdicSpace.IsOpenImmersion.lift` once the image
  of `g` is known to lie in `X_a`).
- (f) Base change: if `Y ×_X Z` exists (AdicSpacesPartII layer R0, existence of fibre products)
  and `g : Z → X` is adic, then `(Y ×_X Z)_a = p⁻¹(Y_a) ≅ Y_a ×_X Z` for the projection `p`.
  The inclusion `p⁻¹(Y_a) ⊆ (Y ×_X Z)_a` holds for every
  morphism (a point over an analytic point is analytic: supports pull back to supports); the
  reverse inclusion uses that `p`, the base change of `g`, is adic, and fails without it
  (check *analyticLocus_test_pullback_nonAdic*).

For an adic space over `Spa(ℤ_p, ℤ_p)` with adic structure morphism, `X_a` is the preimage of
`Spa(ℚ_p, ℤ_p)` ([Hüb] §6, after Lem. 6.8, p. 29); in general, for `Spa ℤ_p⟦T⟧` or `Spa A_inf`,
it is larger and contains analytic points of characteristic `p`. The analytic adic spaces over
`ℤ_p` are the consumers' category ([ECD] Introduction, p. 2). *Needs:* AdicSpacesPartII layer R0;
*rational-pullback-comparison*; AdicSpaces layer 5; Tau Ceti `ValuationSpectrum.IsAnalyticPoint`,
`ValuationSpectrum.spaAnalytic`, `TauCeti.ValuationSpectrum.isOpen_val_preimage_spaAnalytic`,
`TauCeti.ValuationSpectrum.isCompact_val_preimage_spaAnalytic`,
`TauCeti.ValuationSpectrum.spaAnalytic_eq_biUnion_rationalSubset`,
`TauCeti.ValuationSpectrum.isTateRing_completion_locTopology_of_mem_generators`,
`TauCeti.ValuationSpectrum.spaAnalytic_eq_spa_of_isTateRing`,
`TauCeti.ValuationSpectrum.spaAnalytic_eq_empty_iff_discrete_separationQuotient`, `TauCeti.AdicSpace`,
`PreAdicSpace.restrict`, `PreAdicSpace.ofRestrict`, `PreAdicSpace.isAdic_restrict`,
`PreAdicSpace.IsOpenImmersion`, `PreAdicSpace.IsOpenImmersion.lift`.

Lean: `AdicSpace.analyticPoints` (the analytic points, defined by the neighbourhood condition),
`AdicSpace.analyticPoints_isOpen`, `AdicSpace.restrict` and `AdicSpace.ofRestrict` (the open
subspace and its inclusion), `AdicSpace.isAnalytic_iff_analyticPoints`,
`AdicSpace.analyticPoints_restrict` (clause (a)), `AdicSpace.analyticPoints_spa` (the point-set
part of (b)) and `AdicSpace.isAdic_iff_mapsTo_analyticPoints` (the first part of (d)); the rest is
README only.

**Checks.**

- *analyticLocus_test_powerSeries_locus* (computation) — for `X = Spa(ℤ_p⟦T⟧, ℤ_p⟦T⟧)` with the
  `(p, T)`-adic topology, `X_a = R((p, T)/p) ∪ R((p, T)/T) = {v(p) ≠ 0} ∪ {v(T) ≠ 0}`, each
  chart has Tate coordinate ring (`ℤ_p⟦T⟧⟨T/p⟩[1/p]` and `ℤ_p⟦T⟧⟨p/T⟩[1/T]`; [Hüb] §6, Ex. 6.12,
  p. 30). The Check *analyticLocus_test_powerSeries_complement* gives
  `X ∖ X_a` as the single point with support `(p, T)`, the trivial valuation of `𝔽_p`.
  The locus Check also asserts that `X_a` contains the point given by the `T`-adic valuation of `𝔽_p((T))` (support `(p)`,
  not open since `Tⁿ ∉ (p)`), which lies in `R((p, T)/T)` and over the closed (non-analytic)
  point of `Spa(ℤ_p, ℤ_p)`.
- *analyticLocus_test_witt* (computation) — for a perfect field `k` and `W(k)` with the `p`-adic
  topology, `Spa(W(k), W(k))_a = R(p/p) = Spa(W(k)[1/p], W(k))`, a single point.
- *analyticLocus_test_padicInt* (computation) — for `ℤ_p` with the `p`-adic topology,
  `Spa(ℤ_p, ℤ_p)` has two points: the `p`-adic valuation, which is the whole analytic locus, and
  the closed point, the trivial valuation of `𝔽_p` with support `(p)`, which is not analytic.
  Defining "analytic" as "support not maximal" would agree here but fail at the classical points
  of `ℚ_p⟨T⟩` (maximal support, analytic); defining it as "nontrivial valuation" would agree here
  but fail at the `ℓ`-adic points of the discrete ring `ℤ` (nontrivial, not analytic).
- *analyticLocus_test_discrete* (degenerate) — for a ring `R` with the discrete topology,
  `Spa(R, R)_a = ∅` (every ideal is open, so no support is non-open); for the zero ring both are
  empty.
- *analyticLocus_test_discrete_integers* (degenerate) — for `ℤ` with the discrete topology,
  `Spa(ℤ, ℤ)` is not empty (it contains the trivial valuation and the `ℓ`-adic valuations) while
  its analytic locus is: an empty analytic locus does not come from an empty spectrum.
- *analyticLocus_test_tate* (agreement) — for a Tate ring, here `ℚ_p` with any ring of integral
  elements, `Spa(A, A⁺)_a = Spa(A, A⁺)` (Tau Ceti `spaAnalytic_eq_spa_of_isTateRing`), so `ι` is
  an isomorphism.
- *analyticLocus_test_pullback_nonAdic* (negative control for (f)) — for `X = Spa ℤ_p`,
  `Y = Spa ℤ_p⟨S⟩` (`f` topologically of finite type, adic) and `Z = Spa ℤ_p⟦T⟧` with the
  `(p, T)`-adic topology (`g` not adic), the fibre product exists (AdicSpacesPartII layer R0,
  case (a)) and is `Spa(ℤ_p⟦T⟧⟨S⟩)` with the `(p, T)`-adic topology. The Gauss point `w` of
  `𝔽_p((T))[S]` over the `T`-adic valuation (`w(Σ aᵢSⁱ) = max |aᵢ|_T`) is a point of it with
  support `(p)`, hence analytic, but `p(w)` is the trivial valuation of `𝔽_p[S]`, with open
  support `(p)` in `ℤ_p⟨S⟩`: `(Y ×_X Z)_a ⊄ p⁻¹(Y_a)`, so (f) needs `g` adic.
- *analyticLocus_test_nonAdic* (non-example) — the morphism `Spa(ℤ_p⟦T⟧) → Spa(ℤ_p)` sends the
  analytic `T`-adic point of `𝔽_p((T))` to the non-analytic closed point, so it does not restrict
  to analytic loci; a definition restricting every morphism to `X_a` fails, and (d) requires
  adicness.
- *analyticLocus_test_spaAnalytic* (compatibility) — for `X = Spa(A, A⁺)` with `A` complete, the
  underlying set of `analyticLocus X` is Tau Ceti's `spaAnalytic A⁺` as a subset of `Spv A`.
- *analyticLocus_test_ainf* (characterisation) — for `A_inf = W(O_F)` with the `(p, [ϖ])`-adic
  topology, `Spa(A_inf)_a = R((p, [ϖ])/p) ∪ R((p, [ϖ])/[ϖ]) = D(p) ∪ D([ϖ])`, strictly larger than
  `𝒴 = D(p) ∩ D([ϖ])` (AdicSpaces layer 6.1), where `D(f) = {v ∈ Spa : f ∉ supp(v)}`.
  This intersection is not the overlap of the two rational charts, which additionally forces
  `v(p) = v([ϖ])`. More generally the same union formula and strict inequality hold for a
  perfect domain `O` of characteristic a prime `p` and a nonzero nonunit `ϖ ∈ O`, with
  `W(O)` given the `(p,[ϖ])`-adic topology; the affinoid point-set assertion does not require
  `W(O)` to be complete for that topology. The cases `ϖ = 0` and `ϖ ∈ Oˣ` are excluded from
  the strict-inequality assertion.
- *analyticLocus_test_analyticMorphism_isAdic* (compatibility) — every morphism of analytic adic
  spaces is adic ([Hüb] §6, Lem. 6.8, p. 29), so the analytic adic spaces over `Spa ℤ_p` of
  [ECD] §15 form a full subcategory on which the adicness hypothesis of (d) is vacuous and every
  morphism restricts.


**`AdicSpace.restrict`.** The open subspace of `X` on an open `U`, with the structure of Tau
Ceti's `PreAdicSpace.restrict`. The first two Checks are Lean examples.

**Checks.**

- *restrict_inter* (computation) — restricting `restrict X U` to the preimage of an open `V` gives
  `restrict X (U ⊓ V)`, up to isomorphism (Lean example).
- *restrict_bot* (degenerate) — `restrict X ⊥` has no points (Lean example, proved).
- *restrict_open_disc* (non-example) — the open unit disc of `DiscChecks`, the restriction of the
  closed unit disc over `ℚ₂` to `⋃_{n ∈ ℕ} DiscChecks.radiusRegion n`, is not quasi-compact, so
  the restriction of an affinoid to an open need not be affinoid. README only: the disc fixture
  is not a carrier of `Suggested.lean`.

**`AdicSpace.ofRestrict`.** The inclusion `restrict X U → X`, Tau Ceti's
`PreAdicSpace.ofRestrict`. Each Check below is a Lean example.

**Checks.**

- *ofRestrict_range* (computation) — the image of `ofRestrict X U` on points is `U` (Lean example).
- *ofRestrict_top* (degenerate) — `ofRestrict X ⊤` is an isomorphism (Lean example).
- *ofRestrict_ne_top* (non-example) — for `U ≠ ⊤` the inclusion is not an isomorphism, its image
  missing a point (Lean example).

**`AdicSpace.IsAdic`.** Adic morphisms preserve analytic points; mere continuity of a Huber-pair map does not suffice. The predicate is AdicSpacesPartII's, and `AdicSpace.isAdic_iff_mapsTo_analyticPoints` is the Lean form of the first statement; the Checks below are README only (no Lean declaration).

**Checks.**

- *AdicSpace_IsAdic_positive* (computation) — The three-cycle of the split Q₂ space is adic.
- *AdicSpace_IsAdic_degenerate* (degenerate) — The identity of the discrete integer spectrum is adic, although the space is not analytic.
- *AdicSpace_IsAdic_negative* (non-example) — The map from Spa(Q₂,Z₂) to the discrete integer spectrum is continuous but not adic: it sends an analytic point to a nonanalytic point.

**`AdicSpace.IsAdic.analyticLocusMap`.** Restricting both source and target to their analytic loci sends each labelled component along the original adic morphism. README only (no Lean declaration).

**Checks.**

- *AdicSpace_IsAdic_analyticLocusMap_positive* (computation) — The analytic restriction of the three-cycle takes sheet 0 to sheet 1.
- *AdicSpace_IsAdic_analyticLocusMap_degenerate* (degenerate) — The identity on the three-sheeted space restricts to the identity.
- *AdicSpace_IsAdic_analyticLocusMap_negative* (non-example) — The image of sheet 0 is not sheet 2, excluding the inverse three-cycle.

**`AdicSpace.analyticLocus.lift`.** A map from an analytic source factors through the target analytic locus with the same labelled point images. README only (no Lean declaration).

**Checks.**

- *AdicSpace_analyticLocus_lift_positive* (computation) — The analytic restriction of the three-cycle takes sheet 0 to sheet 1.
- *AdicSpace_analyticLocus_lift_degenerate* (degenerate) — The identity on the three-sheeted space restricts to the identity.
- *AdicSpace_analyticLocus_lift_negative* (non-example) — The image of sheet 0 is not sheet 2, excluding the inverse three-cycle.

### Examples

The acceptance tests of the layer are four of the checks above together with one caveat. The
rational pullback `ℚ_p⟨S⟩ ⊗̂_{ℚ_p⟨T⟩} ℚ_p⟨T⟩⟨T/p⟩ ≅ ℚ_p⟨S⟩⟨S²/p⟩` for `T ↦ S²`, with the open unit
disc as the pullback along the non-adic base `Spa ℤ_p` (*rational-pullback-comparison*); the
finite étale algebra given by the square root of `T` over the unit circle, split over
`{|T − 1| ≤ |p|}` for odd `p`, without completion (*finite-etale-pullback-comparison*); the scalar extension
of a Tate algebra `K⟨T⟩ ⊗̂_K L ≅ L⟨T⟩` with the closed unit disc over `L` as a fibre product
(*supplier-contract-fibre-products*); and the perfectoid scalar extension
`Spa K⟨T^{1/p^∞}⟩ ×_{Spa K} Spa L = Spa L⟨T^{1/p^∞}⟩`, whose carrier is that of
*supplier-contract-fibre-products* and whose perfectoidness comes from PerfectoidSpaces layer P2
(fibre products of perfectoid spaces). No pullback of arbitrary adic spaces is inferred from
these cases. Alongside them sit the non-examples that fix the hypotheses: `ℂ_p ⊗̂_{ℚ_p} ℂ_p` is
not uniform, the idempotent `(1, 0)` of `ℚ_p(√p) ⊗̂_{ℚ_p} ℚ_p(√p)` lies in the plus ring but not in
the image of `O_L ⊗ O_L`, and the analytic loci `Spa ℤ_p⟦T⟧_a = R((p, T)/p) ∪ R((p, T)/T)` and
`Spa(A_inf)_a = D(p) ∪ D([ϖ])` with their Tate charts.

### Dependencies

AdicSpacesPartII layer R0 (completed tensor products with their topology, plus ring, rational
localisation and noetherian stability; uniformisation; adic ring homomorphisms and analytic
points; finite morphisms; affinoid fibre products, their existence and base-change stability).
The Foundations of adic spaces roadmap (AdicSpaces), layers 0, 2, 3 and 5: completion of Huber
pairs, analytic points of `Spa`, rational localisation as a complete pair and Huber's category
`𝒱`, and the category of adic spaces with open subspaces and gluing (maps into affinoids are
*maps-into-affinoids* above) — the
adic spaces with their structure presheaf and the category `𝒱` that PerfectoidSpaces layer P0
and PerfectoidTowers layer P8 use are AdicSpaces's; its layer 6.1 supplies the comparison with `𝒴` for `A_inf`.
Completed tensor products of Banach modules and Banach spaces over a nonarchimedean field (which
PerfectoidTowers layers P8/P9 use) belong to AdicSpacesPartII layer R0's completed tensors, as its
completed tensor product of Banach modules. Mathlib and Tau Ceti as listed in the supplier
contracts and in the `*Needs:*` clauses above (pushouts and pullbacks, étale and finite
projective algebras, integral closure; Huber pairs, the adic spectrum and the analytic-locus
lemmas). Sheafiness of finite étale algebras over a general sheafy Tate pair is an open problem
and is kept as a hypothesis throughout; PerfectoidSpaces layers P2 and P3 and AdicSpacesPartIV
layer R5 supply it in the perfectoid and sousperfectoid cases, and AdicEtaleGeometry layer A1
handles the non-sheafy case.

## Layer A1: finite étale and étale geometry

This layer owns the étale and finite étale sites of analytic adic spaces. It defines finite
étale and étale morphisms of possibly non-noetherian analytic adic spaces by the local algebraic
description of Kedlaya–Liu and Scholze, proves the properties a site needs (base change,
composition, diagonals, cancellation, openness), compares with Huber's notions where both are
defined, and builds the sites, their geometric points, their strict localisations and the finite
étale fundamental group, ending with Kedlaya–Liu's site on an arbitrary analytic adic space. The
ordinary finite and étale morphism theory of locally noetherian adic spaces (Huber's infinitesimal
definitions, finiteness, standard étale presentations, flatness, openness) is AdicSpacesPartII
layer R0's and is imported, never redone. These are geometric sites: no derived category or
cohomology is defined here. The layer builds on AdicEtaleGeometry layer A0 (pullbacks along
rational open immersions and finite étale maps, *rational-pullback-comparison* and
*finite-etale-pullback-comparison*), on AdicSpacesPartII layer R0 (Huber's finite and étale
morphisms, finite algebras over noetherian affinoids, completed tensor products and affinoid fibre
products, valuation amalgamation, the local structure of étale maps including the import of
Huber's Lemma 2.2.8), on AdicSpacesPartIII layer R3 (Čech acyclicity of sheafy affinoids,
Kiehl's theorem), on the Foundations of adic spaces roadmap (AdicSpaces), layers 2–5 (rational-subset calculus, structure
presheaf and sheafiness predicates, sheafiness of strongly noetherian Tate rings, the category of
adic spaces), and — for the site of an arbitrary analytic adic space only — on the Yoneda-adic
spaces of this layer's second half (*generalized-adic-presentation* and its lemmas). Its consumers
are AdicSpacesPartIV layer R4 (re-export of the sites on the R0/R1 carriers, geometric points,
slices) and layer R5 (finite étale and étale maps over sousperfectoid spaces), PerfectoidSpaces
layers P3–P4 (the étale site of an adic space with its finite étale and étale morphisms),
the `p`-adic Hodge theory roadmaps (`λ : X_ét → X_an`, `O_{X_ét}`, `X_fét` and `π₁`), the
étale-cohomology roadmaps (the analytic site, strict-localisation stalks, higher-rank field
pairs), the pro-objects of `X_ét` in the second half of this layer, AdicEtaleGeometry
layers A2 and A4, DiamondsAndVStacks layer D6 (the right-hand sides `Y_ét`, `Y_fét` of [ECD]
Lem. 15.6) and the `A_inf`-cohomology roadmap.

The standing conventions are these. Adic spaces are those of the Foundations of adic spaces
roadmap (AdicSpaces), layer 5; *analytic* means every point is analytic, so affinoid charts can be
taken of the form `Spa(A, A⁺)` with `A` a complete Hausdorff Tate ring, and every morphism into an
analytic adic space is adic. For a complete Tate ring `A`, `FÉt(A)` is Mathlib's
`CommAlgCat.FiniteEtale A` (`Algebra.Etale A B` and `Module.Finite A B`); such a `B` is finite
projective, carries the natural `A`-module topology, and its plus ring over `(A, A⁺)` is the
integral closure of the image of `A⁺` — never `B°` (already for `B = A` they differ when
`A⁺ ≠ A°`); the definitions retain this integral-closure plus ring
throughout. A complete Tate ring `A` is *strongly sheafy*
if every `A⟨T₁, …, Tₙ⟩` is sheafy ([HK] §4, Def. 4.1, p. 11); sheafiness of `A` alone is not
known to pass to finite étale extensions ([KL I] §8.2, Rem. 8.2.18, p. 162), strong sheafiness
is, and the finite étale sheafiness theorem below uses local monogenicity over Tate rings in the
strong-sheafiness argument rather than any assertion about merely sheafy rings. All results that
need fibre products of étale maps inside adic spaces are stated for *locally strongly sheafy*
spaces; this covers locally noetherian analytic spaces (rigid spaces, analytifications) and — by
facts proved where those rings are constructed — perfectoid and sousperfectoid spaces. *Étale*
means `AdicSpace.IsEtaleLocalDescription f`: locally on the source an open immersion, a finite
étale morphism and an open immersion; Huber's infinitesimal notion is AdicSpacesPartII layer R0's
`AdicSpace.Etale`, the two agree on locally noetherian analytic spaces (A1.4), and Huber's notion
is used nowhere else. A family of étale maps is a *covering* when it is jointly surjective on
*all* points of the adic spaces, including points of higher rank; surjectivity on rank-one
(Berkovich) points is not enough. *Geometric points* are `Spa(C, C⁺) → X` with `C` algebraically
closed, complete, nontrivially valued and `C⁺ ⊆ C` an open and bounded valuation subring of any
rank; rank one is a special case, not the definition.

### A1.1 strongly sheafy rings

**Strongly sheafy Tate rings and locally strongly sheafy analytic adic spaces.**
(*strongly-sheafy-huber-pair*) Let `A` be a complete Hausdorff Tate ring (Tau Ceti
`Huber.IsTateRing A`) and write `A⟨T₁, …, Tₙ⟩` for Tau Ceti's completed restricted power-series
ring `Huber.restrictedMvPowerSeriesCompletion n A`, again a complete Tate ring. Define
`Huber.IsStronglySheafy A`: every `A⟨T₁, …, Tₙ⟩`, `n ≥ 0`, is a sheafy ring, sheafy meaning
Tau Ceti’s `Huber.IsSheafyRing` (the structure presheaf of `Spa(A, A⁺)` is a sheaf for every
ring of integral elements `A⁺`) ([HK] §4, Def. 4.1, p. 11); a Huber pair `(A, A⁺)` is strongly
sheafy when `A` is. Define `AdicSpace.IsLocallyStronglySheafy X` for an analytic adic space `X`:
every `x ∈ X` has an open affinoid neighbourhood `Spa(A, A⁺) ⊆ X` with `A` strongly sheafy.
Prove the stability package, from [HK] §4, Thm. 4.2, Lem. 4.3 and Cor. 4.5 and the Čech
acyclicity of sheafy affinoids (AdicSpacesPartIII layer R3): `Huber.IsStronglySheafy.isSheafyRing`
(`A` strongly sheafy implies `A` sheafy, the case `n = 0`),
`Huber.IsStronglySheafy.restrictedMvPowerSeries` (`A⟨S₁, …, S_m⟩` is strongly sheafy),
`Huber.IsStronglySheafy.rationalLocalization` (every rational localisation of a strongly sheafy
ring is strongly sheafy; [HK] §4, Lem. 4.3(b), p. 11, stability under Laurent, hence all rational,
localisations), rational descent (if `A` is sheafy and `Spa(A, A⁺)` has
a finite rational covering by `Spa(B_i, B_i⁺)` with every `B_i` strongly sheafy, then `A` is
strongly sheafy; this is [HK] §4, Cor. 4.5, p. 12, whose hypotheses (i) `A ≅ H⁰(Spa(A, A⁺), O)`
and (iii) vanishing of the higher Čech cohomology of the covering both follow from sheafiness of
`A`: (i) is the sheaf property, and (iii) follows from the vanishing of higher sheaf cohomology on
every rational subspace of a sheafy pair, [HK] §3, Prop. 3.10, p. 8, by Leray's comparison. The
sheafiness of `A` is not dropped: for `A` not assumed sheafy, [HK] §4, Rem. 4.6, p. 13, records that
the corresponding statement [KL I] Thm. 1.2.22(b) has no complete proof),
`Huber.IsStronglySheafy.of_isStronglyNoetherian` (complete strongly
noetherian Tate rings, in particular affinoid algebras over a complete nonarchimedean field, are
strongly sheafy) and `Huber.IsStronglySheafy.of_isStablySheafyRing` (complete Tate rings that are
stably sheafy in Tau Ceti’s sense, `Huber.IsStablySheafyRing`, each `A⟨T₁, …, Tₙ⟩` being
topologically of finite type over `A`, are strongly sheafy); complete Tate rings with a
noetherian ring of definition are strongly sheafy too. On spaces prove that every open affinoid
`Spa(A, A⁺) ⊆ X` of a locally strongly sheafy `X` has `A` strongly sheafy,
`AdicSpace.IsLocallyStronglySheafy.restrict` (open subspaces are locally strongly sheafy) and
`AdicSpace.IsLocallyNoetherianAnalytic.isLocallyStronglySheafy` (locally noetherian analytic adic
spaces are locally strongly sheafy). Finite étale algebras over strongly sheafy rings are strongly
sheafy (*finite-etale-strongly-sheafy*); perfectoid and sousperfectoid Tate rings belong to the
class as well (their Tate algebras are sousperfectoid, hence stably uniform and sheafy), and that
membership is proved where those rings are constructed, in PerfectoidSpaces and AdicSpacesPartIV
layer R5, which consume this definition. Non-example: a uniform Tate ring that is not sheafy
(Buzzard–Verberkmoes, Mihara) is not strongly sheafy ([HK] §1, p. 2). Sheafiness of `A` alone is
not known to give sheafiness of finite étale extensions ([KL I] §8.2, Rem. 8.2.18, p. 162); this
is why the class is introduced. *Needs:* Tau Ceti `Huber.IsTateRing`,
`Huber.restrictedMvPowerSeriesCompletion`, `Huber.IsStronglyNoetherian`,
`ValuationSpectrum.rationalSubset`; AdicSpacesPartII layer R0; AdicSpacesPartIII layer R3; Mathlib
`CategoryTheory.Sheaf.H`.

Lean: `Huber.IsStronglySheafy`, `Huber.IsStronglySheafy.isSheafyRing`,
`Huber.IsStronglySheafy.restrictedMvPowerSeries`, `Huber.IsStronglySheafy.of_isStronglyNoetherian`,
`Huber.IsStronglySheafy.of_isStablySheafyRing`, `AdicSpace.IsLocallyStronglySheafy` (stated with
strongly sheafy Tate affinoid charts of AdicSpacesPartII), `AdicSpace.IsLocallyNoetherianAnalytic`,
`AdicSpace.IsLocallyNoetherianAnalytic.isLocallyStronglySheafy`, and the bridge to Part II's
predicates `AdicSpace.isLocallyNoetherianAnalytic_iff` (`IsLocallyNoetherianAnalytic X ↔
IsLocallyNoetherian X ∧ IsAnalytic X`, with the projections
`IsLocallyNoetherianAnalytic.isLocallyNoetherian`, `.isAnalytic` and the constructor
`.of_isLocallyNoetherian_of_isAnalytic`), so that a consumer holding Part II's two hypotheses
invokes the A1 comparisons (*etale-morphisms-local-description-and-comparison*,
*finite-etale-morphism*, the smooth ball-chart comparison and the relative-dimension bound of A2)
without supplying chart data; the rest is README only. The forward direction is chart by chart (a
strongly noetherian Tate chart is Tate and of noetherian type); the backward direction refines a
noetherian-type chart and a Tate chart at each point to a common rational subdomain, which is
Tate and of noetherian type (both properties pass to rational localisations: Huber 1994 §3,
Cor. 3.4(ii), as recorded in AdicSpacesPartII *noetherian-type-huber-ring*), and then uses Part II's ring-level
`IsNoetherianType.isStronglyNoetherian` for Tate rings — recorded as the dependency rather than
reproved here. Part II's general `IsLocallyNoetherian`, which also covers non-analytic spaces, is
not replaced.

**Checks.**

- *locallyNoetherianAnalytic_padic* (computation) — `Spa(ℚ_p, ℤ_p)` is locally noetherian
  analytic by its identity chart (a strongly noetherian Tate ring), and the bridge returns Part
  II's two predicates for it.
- *locallyNoetherianAnalytic_restrict* (compatibility) — an open subspace of a locally noetherian
  analytic space is locally noetherian analytic, on both sides of the bridge.
- *locallyNoetherianAnalytic_empty* (degenerate) — the empty space satisfies the predicate (a Lean
  `example`, proved) and both Part II predicates.
- *locallyNoetherianAnalytic_padicInt* (non-example) — `Spa(ℤ_p, ℤ_p)` is locally noetherian
  (noetherian ring of definition `ℤ_p`) but not analytic (its closed point has no Tate
  neighbourhood), so it is not locally noetherian analytic: the bridge does not make a locally
  noetherian space analytic.

- *test_tateAlgebra* — for `K` a complete nonarchimedean field and `m ≥ 0`,
  `Huber.IsStronglySheafy (K⟨T₁, …, T_m⟩)` (strongly noetherian).
- *test_field* (degenerate) — a complete nonarchimedean field `K`, as a Tate ring, is strongly
  sheafy, and `Spa(K, K⁺)` is locally strongly sheafy for every open and bounded valuation
  subring `K⁺` (`K°° ⊆ K⁺ ⊆ K°`).
- *Huber.test_field_plus_unbounded_negative* (non-example) — `K⁺ = K` is an open valuation subring of `K` but
  not bounded: `(K, K)` is not a Huber pair, and no continuous valuation is `≤ 1` on all of `K`
  (it would have `v(ϖ) = v(ϖ⁻¹) = 1`), so the "adic spectrum" `Spa(K, K)` is empty; boundedness
  (`K⁺ ⊆ K°`) is part of every ring of integral elements in this layer.
  The Lean non-example tests `IsStronglySheafy ℚ_[p]` together with the failure of
  `IsRingOfIntegralElements (⊤ : Subring ℚ_[p])`.
  Its positive companion, the check *Huber.test_field_plus_unbounded_positive*, tests both
  `IsStronglySheafy ℚ_[p]` and `IsStronglySheafy (restrictedMvPowerSeriesCompletion 1 ℚ_[p])`,
  together with nonemptiness of `Spa(ℚ_p, S.plus)` for every Huber pair `S` on `ℚ_p`.
- *test_not_of_uniform* (non-example) — there is a complete uniform Tate ring `A`
  (Buzzard–Verberkmoes) with `¬ Huber.IsStronglySheafy A`; so "uniform" cannot replace "strongly
  sheafy".
- *test_of_isStablySheafyRing* (compatibility) — for a complete Tate ring `A`,
  `Huber.IsStablySheafyRing A → Huber.IsStronglySheafy A`, AdicSpaces' notion.
- *test_rationalLocalization* — a rational localisation of a strongly sheafy ring is strongly
  sheafy, and every open affinoid of a locally strongly sheafy space has a strongly sheafy
  coordinate ring.

**Non-sheafy controls.** The witnesses for *strongSheafy_nonSheafy*,
*yoneda_nonSheafy*, and *yoneda_finite_nonSheafy* are cited, not constructed.
For a complete non-sheafy Tate pair use the completion of the example in
[Buzzard–Verberkmoes, *Stably uniform affinoids are sheafy*, arXiv:1404.7020v1,
§4.1, Proposition 12, pp. 7–8](https://math.stanford.edu/~conrad/Perfseminar/refs/buzzardsheaf.pdf#page=7):
the nonzero global section represented by `Z` restricts to zero on both rational
members `|T| ≤ 1` and `|T| ≥ 1`. For a **uniform** non-sheafy example use their
§4.6, pp. 10–11. When formalised, the three controls retain a non-sheafiness hypothesis;
the finite-étale control applies, for example, to the identity of the cited pair.


**Rational localization and rational descent of strong sheafiness.**
`Huber.IsStronglySheafy.rationalLocalization` takes a morphism `φ : R ⟶ S` of complete
Tate Huber pairs and its rational-localization universal property for `(T,s)`; strong
sheafiness of `R.A` implies strong sheafiness of `S.A`.
The rational descent takes a finite rational covering, those actual
localization morphisms, strong sheafiness of each target, and sheafiness of the base pair.
The base sheafiness hypothesis is retained. The locators are [HK] Lemma 4.3(b), p. 11, and
Corollary 4.5, p. 12, with the limitation in Remark 4.6, p. 13. Both statements are README only
(no Lean declaration).

### A1.2 the Huber pair of a finite étale algebra

**The complete Huber pair of a finite étale algebra.** (*finite-etale-affinoid-algebra*) Let
`(A, A⁺)` be a complete Hausdorff Tate Huber pair (Tau Ceti `Huber.Pair` on a complete
`Huber.IsTateRing A`; no sheafiness or noetherian hypothesis) and `B` a finite étale `A`-algebra
(Mathlib `Algebra.Etale A B` and `Module.Finite A B`, an object of `CommAlgCat.FiniteEtale A`;
finite, flat, finitely presented, unramified). Define `Huber.Pair.finiteEtale A⁺ B` as the complete
Tate pair `(B, B⁺)` and `Huber.Pair.finiteEtale.hom` as `ι : (A, A⁺) → (B, B⁺)` ([KL I] §2.4,
Rem. 2.4.2, p. 38; [PS] §7, Def. 7.1(i), p. 39):

```text
topology on B  = natural A-module topology  (subspace = quotient topology of B ⊕ Q ≅ Aⁿ)
ring of def.   = A₀[ϖᴺb₁, …, ϖᴺb_m]         (b_j A-module generators, N ≫ 0)
B⁺             = integral closure of ι(A⁺) in B
```

(i) Topology: `B` is a finite projective `A`-module and carries the natural `A`-module topology
(Mathlib `moduleTopology A B`); for any presentation `B ⊕ Q ≅ Aⁿ` it is both the subspace and the
quotient topology from `Aⁿ` ([KL I] §2.2, Lem. 2.2.12(a), p. 32). With it `B` is a complete
Hausdorff topological ring ([HK] §2, Rem. 2.4, p. 4). Completeness of the right uniformity follows
for every finite module from `TauCeti.completeSpace_moduleTopology`
(`TauCeti/Topology/Algebra/Module/Finite.lean:82`); first countability of the Huber base follows
from `IsHuberRing.isCountablyGenerated_nhds_zero`
(`TauCeti/RingTheory/Huber/Basic.lean:642`) and
`SeparatelyContinuousAdd.toFirstCountableTopology`
(`TauCeti/Topology/Algebra/Group/FirstCountable.lean:61`). First countability of the module
topology is `TauCeti.firstCountableTopology_moduleTopology`. Separation uses projectivity: the
Hausdorff clause of `Huber.isTateRing_moduleTopology` applies over a Hausdorff base without a
noetherian hypothesis;
for noetherian Tate `A`, Tau Ceti also supplies `IsTateRing.t2Space_moduleTopology`. The map `ι` is
continuous, every `A`-linear map from `B` to a topological `A`-module is continuous,
and `B` is Tate: if `b₁, …, b_m` generate `B` as an `A`-module, `ϖ ∈ A⁺` is a pseudouniformiser and
`A₀ ⊆ A⁺` a ring of definition containing `ϖ`, then for `N ≫ 0` the `ϖᴺ b_j` are integral over `A₀`,
`B₀ := A₀[ϖᴺb₁, …, ϖᴺb_m]` is a ring of definition with ideal of definition `ϖB₀`, and `ι(ϖ)` is a
pseudouniformiser of `B` (in Lean, `Huber.isTateRing_moduleTopology`). The topology is
Mathlib’s `moduleTopology`; its finite-algebra ring structure is
`IsModuleTopology.isTopologicalRing`. (ii) Plus ring:
`Huber.Pair.finiteEtale_plus` — `B⁺` is the integral closure of `ι(A⁺)` in `B`, a ring of integral
elements, never `B°` (in Lean, the last clause of `Huber.Pair.Hom.IsFiniteEtale`). (iii) `ι` is a
finite morphism of complete Huber pairs (AdicSpacesPartII layer R0's `Huber.Pair.Hom.IsFinite`; in
Lean, `Huber.Pair.Hom.IsFiniteEtale.isFinite`); it induces the
continuous map `Spa(ι) : Spa(B, B⁺) → Spa(A, A⁺)` (Tau Ceti `ValuationSpectrum.spaComap`), whose
fibre over `x` has at most `rank_x(B)` points:
`Huber.Pair.Hom.IsFiniteEtale.finite_fibre` states both finiteness of the fibre and
`Nat.card fibre ≤ Module.rankAtStalk B (ValuationSpectrum.suppFun x)` at the support prime, and
`Spa(ι)` is surjective when `B` is faithfully flat over `A` (the forward direction of
`Huber.Pair.Hom.IsFiniteEtale.surjective_spaComap_iff`). (iv) Universal property,
`Huber.Pair.finiteEtale.homEquiv`: for every complete Huber pair `(D, D⁺)` under `(A, A⁺)`, the
morphisms `(B, B⁺) → (D, D⁺)` under `(A, A⁺)` are exactly the `A`-algebra homomorphisms `B → D`
(in Lean, `Huber.Pair.Hom.IsFiniteEtale.exists_hom`: every such algebra map is a morphism of
pairs), and the equivalence is fixed on elements;
`Huber.Pair.finiteEtaleFunctor_map` fixes the element map of
`Huber.Pair.finiteEtaleFunctor`, `B ↦ (B, B⁺)`, a fully faithful functor
`CommAlgCat.FiniteEtale A ⥤` complete Huber pairs under `(A, A⁺)`. (v) Base change needs no
completion, `Huber.Pair.finiteEtale.baseChangeIso`: for every morphism `(A, A⁺) → (C, C⁺)` of
complete Tate pairs, `C ⊗_A B` is finite étale over `C`, its natural `C`-module topology is the
tensor-product topology, the canonical map `C ⊗_A B → C ⊗̂_A B` to AdicSpacesPartII layer R0's
completed tensor product is a topological isomorphism, and `Huber.Pair.finiteEtale C⁺ (C ⊗_A B)`
is the completed tensor product of pairs, with plus ring the integral closure of the image of
`C⁺ ⊗ B⁺` ([PS] §7, proof of Lem. 7.3(ii), p. 40) — these base-change clauses are AdicSpacesPartII
layer R0's *finite-algebra-tensor-complete* for finite projective `B`, the contract clause
*finite-etale-pullback-comparison* of layer A0; for a rational subset `U = R(f/g)` of
`Spa(A, A⁺)`, `TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset` — `Spa(ι)⁻¹(U)` is the
rational subset `R(ι f/ι g)` — and the composite `finiteEtaleEquivTensor ≪≫ rationalLocalizationIso` —
`O(U) ⊗_A B ≅ B⟨ι f/ι g⟩` as topological rings, compatibly with plus rings. (vi) Comparison:
if `A` is of noetherian type (a noetherian ring of definition, or strongly noetherian Tate;
AdicSpacesPartII layer R0's *noetherian-type-huber-ring*), `(B, B⁺)` is R0's `Huber.Pair.finiteAlgebra`
(*finite-algebra-over-affinoid*, whose `homEquiv` and `map` are then (iv)), `B` is again of
noetherian type, so both spectra are adic spaces, and
`Spa(B, B⁺) → Spa(A, A⁺)` is finite and étale in Huber's sense ([H96] §1.6, Example 1.6.6(ii);
R0's *finite-etale-algebra-comparison*).
Construct `Huber.Pair.finiteEtale.baseChangeIso` with `RingEquiv.ofBijective` from
`Pair.completedTensor.tmul A C (FiniteEtale A B)`. This is the canonical tensor map with the
finite algebra on the right, using the same construction as A0's
`Pair.completedTensor.finiteEtaleEquivTensor`. The isomorphism is stated for `B` finite étale
over `A`, `C` a complete Hausdorff Tate ring and adic structure maps `A → C` and `A → B`. A
companion theorem records the homeomorphism, the formula on pure
tensors (by reflexivity), and the image of the integral-closure plus ring.
Sheafiness of `(B, B⁺)` is a separate theorem (*finite-etale-strongly-sheafy*) and is not known
for `A` merely sheafy ([KL I] §8.2, Rem. 8.2.18, p. 162); the comparison `FÉt(A) ≃ FÉt(A^u)` with
the uniformisation belongs to AdicEtaleGeometry layer A4. *Needs:* AdicSpacesPartII layer R0;
*finite-etale-pullback-comparison*; Mathlib `Algebra.Etale`, `Module.Finite`,
`Module.Projective`, `moduleTopology`, `IsModuleTopology`,
`IsModuleTopology.continuous_of_linearMap`, `integralClosure`, `CommAlgCat.FiniteEtale`,
`Algebra.Etale.baseChange`; Tau Ceti `Huber.Pair`, `Huber.Pair.Hom`, `Huber.IsTateRing`,
`Huber.IsTateRing.isModuleTopology`, `completeSpace_moduleTopology`,
`Huber.Pair.isRingOfIntegralElements_integralClosure`, `ValuationSpectrum.spa`,
`ValuationSpectrum.spaComap`, `TauCeti.ValuationSpectrum.continuous_spaComap`,
`TauCeti.ValuationSpectrum.spaComap_preimage_rationalSubset`.

Lean: `Huber.isTateRing_moduleTopology` ((i): Tate, and Hausdorff over a Hausdorff base),
`Huber.Pair.Hom.IsFiniteEtale` (the finite étale morphism of pairs with module topology and
integral-closure plus ring), `Huber.Pair.exists_isFiniteEtale` (the pair exists),
`Huber.Pair.Hom.IsFiniteEtale.isFinite`, `Huber.Pair.Hom.IsFiniteEtale.finite_fibre` and
`Huber.Pair.Hom.IsFiniteEtale.surjective_spaComap_iff` ((iii), over a complete Tate base),
`Huber.Pair.Hom.IsFiniteEtale.exists_hom` ((iv)); the rest is README only.

**Checks.**

- *finiteEtaleFunctor_cycle_coordinate* — on the split algebra `ℚ₂³`, the cyclic permutation
  sends `(0,2,3)` to a tuple whose coordinate 0 is `2` under the functor to Huber pairs.
- *finiteEtaleFunctor_composite_coordinate* — its square sends the same tuple to one whose
  coordinate 0 is `3`.
- *finiteEtaleFunctor_cycle_not_inverse* — the first cyclic permutation does not give `3`
  in coordinate 0, distinguishing it from its inverse.
- **Check *baseChangeIso_identity* (computation):** for `B = A` (with `A → B` adic), applying
  the inverse comparison to `tmul (c ⊗ a)` and then Mathlib's right unit equivalence gives
  `algebraMap A C a * c`.
- **Check *baseChangeIso_split* (computation):** for `B = A × A` (with `A → B` adic), the
  inverse comparison followed by the tensor-product splitting and the two right unit
  equivalences sends `tmul (c₁ ⊗ (1,0) + c₂ ⊗ (0,1))` to `(c₁,c₂)`, fixing the order of the
  components.
- **Check *baseChangeIso_proper_plus* (non-example):** for `C = B = A` and `A⁺ ⊊ A°`,
  the comparison carries the finite étale plus ring onto the completed pair's plus ring,
  and some `a ∈ A° ∖ A⁺` has `baseChangeIso (a ⊗ 1)` outside that plus ring.
- *finiteEtale_test_split* (degenerate) — for `B = A × A`, `finiteEtale A⁺ B` has plus ring
  `A⁺ × A⁺` and its `Spa` is the disjoint union of two copies of `Spa(A, A⁺)` (via the two
  idempotents). The homeomorphism's inverse on each summand pulls valuations back along
  the corresponding coordinate projection, and the structure map folds both summands onto
  `Spa(A, A⁺)`. The Check *finiteEtale_test_split_pi* gives `(Aⁿ, (A⁺)ⁿ)` and `n` copies:
  its inverse on `(i,x)` is pullback of `x` along evaluation at `i`, including the empty
  spectrum when `n = 0`.
- *finiteEtale_test_plus_not_powerBounded* (non-example) — for `(K, K⁺)` a complete
  nonarchimedean field with `K⁺ ⊊ O_K` of rank 2 and `B = K × K`, the plus ring is `K⁺ × K⁺`, not
  `B° = O_K × O_K`; with `B°` the map `Spa(B, B°) → Spa(K, K⁺)` would miss the closed point.
- *finiteEtale_test_kummer_annulus* (computation) — for `A = K⟨T, T⁻¹⟩` with `2 ∈ K^×` and
  `B = A[S]/(S² − T)`, `B` is finite étale over `A` (the discriminant `4T` is a unit of `A`; this
  needs only `char K ≠ 2`, so `K ⊇ ℚ_2` is allowed) and an integral domain, `B ≅ K⟨S, S⁻¹⟩`; for
  `K ⊇ ℚ_p` with `p` odd, `B ⊗_A A⟨(T − 1)/p⟩ ≅ A⟨(T − 1)/p⟩ × A⟨(T − 1)/p⟩`, since
  `√T = √(1 + (T − 1)) = ∑ₙ binom(1/2, n) (T − 1)ⁿ` has coefficients in `ℤ_p` and converges on
  `{|T − 1| ≤ |p|}`.
- *finiteEtale_test_kummer_annulus_two_negative* (non-example, `p = 2`) — for `K = ℚ_2`, the same `B` is
  finite étale, but `B ⊗_A A⟨(T − 1)/2⟩` is not split: `v₂(binom(1/2, n)) = s₂(n) − 2n` (`s₂` the
  binary digit sum), so the series for `√(1 + x)` converges for `|x| < |4|` (on `ℚ_2`-valued
  points, equivalently `|x| ≤ |8|`), and at the point
  `T = 3 ∈ {|T − 1| ≤ |2|}` the fibre is `ℚ_2[S]/(S² − 3)`, a field (`3` is not a square in `ℚ_2`,
  `3 ≢ 1 mod 8`). The cover splits over `{|T − 1| ≤ |8|} = {|T − 1| ≤ |p|³}`; "`p` odd" is needed
  for the disc `{|T − 1| ≤ |p|}` in every Kummer check below, not for étaleness.
- *finiteEtale_test_kummer_char_p* (non-example, `p ∣ degree`) — for `K = 𝔽_p((t))` the map
  `A = K⟨T, T⁻¹⟩ → A[S]/(Sᵖ − T)` is finite and radicial but not étale: `d(Sᵖ − T) = −dT`, the
  discriminant is `0`, and the fibre over `T = 1` is `K[S]/((S − 1)ᵖ)`, not reduced; the
  Artin–Schreier algebra `A[S]/(Sᵖ − S − T)` is finite étale of degree `p` (the derivative
  `pSᵖ⁻¹ − 1 = −1` is a unit).

The p-adic specialisation of these Checks uses `A = Huber.restrictedLaurentSeries ℚ_[p]`,
the quotient `ℚ_p⟨T,V⟩/(TV-1)` with its quotient topology, and
`S = Pair.powerBounded A`. Its additive uniformity is
Mathlib's `IsTopologicalAddGroup.rightUniformSpace` for that topology, compatible with
addition, and this concrete quotient is a complete Hausdorff Tate ring; completeness and
Hausdorffness use closedness of `(TV-1)` in the noetherian Tate algebra. These instances, and the
objects of the next three paragraphs, are README only (no Lean declaration).
**Checks:** *padicAnnulus_uniformSpace_quotient_topology* identifies the topology literally
with the quotient topology; *padicAnnulus_uniformSpace_coordinate_sequence* checks
`pⁿT → 0`; *padicAnnulus_uniformSpace_nondiscrete* excludes the discrete topology.

Define `Huber.padicLaurentIntegralMap : ℤ_p⟨T,V⟩/(TV-1) →+* A` by the coefficient inclusion.
Use Tau Ceti's `weightedMapCompletion` at trivial weights and descend through the relation
`TV-1`. Its characterising theorem states continuity, injectivity,
the images of both coordinates and all constants, and equality of its range with `S.plus`.
Thus the notation `ℤ_p⟨T^{±1}⟩` means the integral coefficient ring inside the same annulus.
**Checks:** *padicLaurentIntegralMap_inverse_coordinate* preserves `V` and checks `TV = 1`;
*padicLaurentIntegralMap_constant* sends the integral constant `p` to `p`;
*padicLaurentIntegralMap_nonintegral* excludes the constant `p⁻¹` from its range.

For `B = AdjoinRoot (X² - C T)`, prove that `B` is finite and étale over `A`, including
`p = 2`, and that `IsDomain B` holds with a topological ring equivalence
`e : Huber.FiniteEtale A B ≃+* A`, where the coordinate on the right is named `S`:
`e(root) = S`, `e(T) = S²`, and `e(V) = S⁻²`. It computes
`(Pair.finiteEtale (Pair.powerBounded A) B).plus.map e.toRingHom` as the range of
`padicLaurentIntegralMap p`, namely `ℤ_p⟨S^{±1}⟩`. This is the pair-level content of
*finiteEtale_test_kummer_annulus*, in addition to the discriminant computation.

For a pair of definition `P` and an integer `n ≥ 0`, use
`C = Huber.ratLoc P {T-1,pⁿ} pⁿ hden` and
`U = Huber.ratLocPair P {T-1,pⁿ} pⁿ hden S`.
A lemma supplies `hden` for every `P` and `n`:
the numerator set contains the unit `pⁿ` and generates an open ideal.
The splitting theorem gives a ring equivalence
`Huber.FiniteEtale C (C ⊗[A] B) ≃+* C × C` for odd `p` and `n ≥ 1`, or for `p = 2`
and `n ≥ 3`. It is a homeomorphism, sends `c ⊗ 1` to `(c,c)` and `1 ⊗ root` to `(r,-r)`,
where `r² = T` and `r-1` is topologically nilpotent, and identifies the plus ring of
`Pair.finiteEtale U (C ⊗[A] B)` with `U.plus × U.plus`.
A companion theorem gives the corresponding splitting of the completed
pullback, using `Pair.finiteEtale.baseChangeIso` to compare with the finite algebra, and a third
excludes a ring equivalence with the product for both
ordinary and completed pullbacks when `p = 2, n = 1`.
The Check *finiteEtale_test_kummer_annulus_two_positive* tests the odd-prime
splitting with its plus ring. The Check *finiteEtale_test_kummer_annulus_two_negative*
tests that the two-adic pair is finite étale with the computed integral plus ring
but does not split on the larger disc.

The supporting Checks *finiteEtale_test_kummer_annulus_discriminant*,
*finiteEtale_test_kummer_annulus_two_fibre*, *finiteEtale_test_kummer_annulus_two_scalar*
and *finiteEtale_test_kummer_char_p_derivative* retain the discriminant, two-adic fibre,
odd-prime scalar root and derivative computations. The concrete
*finiteEtale_test_kummer_char_p* uses `K = LaurentSeries (ZMod p)` with its
`NonarchimedeanRing` mixin (supplied by the formal Laurent field’s Tate structure), and
`A = restrictedLaurentSeries K`: the degree-`p` Kummer algebra is finite but fails the
étaleness prerequisite of `Pair.finiteEtale`, its fibre at `T = 1` is not reduced, and
the Artin–Schreier algebra is finite étale.

- *finiteEtale_test_eq_finiteAlgebra* (compatibility) — if `A` is of noetherian type (a noetherian
  ring of definition, or strongly noetherian Tate), `finiteEtale A⁺ B` is
  AdicSpacesPartII layer R0's `Huber.Pair.finiteAlgebra` on the same topological ring: the two
  plus rings are the integral closure of the image of `A⁺` (this is clause (vi) itself, to be
  proved from R0's description of its plus ring).
- *finiteEtale_test_topology_self* (degenerate) — for `B = A` the natural topology is the
  topology of `A`, and the pair is `(A, A⁺)` (check *Huber.Pair.finiteEtale_identity*): a construction that
  replaced `A⁺` by `A°` fails this when `A⁺ ≠ A°`.
- *finiteEtale_test_hom_diagonal* (computation) — for `B = A × A` the structure map is the
  diagonal `a ↦ (a, a)`; a coordinate inclusion `a ↦ (a, 0)` is not a ring map.
- *finiteEtale_test_topology_split* (computation) — for `B = A × A` the natural topology is the
  product topology.
- *finiteEtale_test_homEquiv_id* (degenerate) — under `homEquiv` with `(D, D⁺) = (B, B⁺)`, the
  identity morphism of pairs corresponds to the identity `A`-algebra map of `B`.
- *finiteEtale_test_quotient_not_projective* (non-example) — for a complete Tate `A` and a
  non-closed ideal `J` (possible when `A` is not noetherian), the finite `A`-algebra `A/J` is not
  étale and its natural topology is not Hausdorff: projectivity is what makes the construction
  work.
- *finiteEtale_test_separable_extension* — for a finite separable extension `L/K` of a complete
  nonarchimedean field with open valuation subring `K⁺`, the pair is `(L, L⁺)` with `L⁺` the
  integral closure of `K⁺` in `L`; for `K⁺ = O_K` this is `(L, O_L)`.

**Finite étale algebras over strongly sheafy Tate rings are strongly sheafy.**
(*finite-etale-strongly-sheafy*) Let `(A, A⁺)` be a complete Tate Huber pair with `A` strongly
sheafy and `B` a finite étale `A`-algebra with its pair `(B, B⁺) = Huber.Pair.finiteEtale A⁺ B`.
Prove that `B` is strongly sheafy; in particular `(B, B⁺)` is sheafy and `Spa(B, B⁺)` is an
affinoid adic space. The proof passes through two statements: (i) `B` is monogenic locally on
`Spa(A, A⁺)` — residue fields of Tate rings are infinite, and a primitive element with unit
discriminant spreads to a rational neighbourhood — so there are a finite rational covering `{U_k}`
of `Spa(A, A⁺)` and monic `P_k ∈ O(U_k)[T]` with invertible discriminant such that
`B ⊗_A O(U_k) ≅ O(U_k)[T]/(P_k) = O(U_k)⟨T⟩/(P_k)` ([HK] §4, proof of Cor. 4.7, p. 13; [HK] §5,
after Def. 5.7, p. 16); (ii) a finite, flat, locally free, locally monogenic extension of a
strongly sheafy ring is strongly sheafy ([HK] §4, Cor. 4.7, p. 13). Special cases with direct
proofs: if `A` is strongly noetherian, so is `B` (`B⟨T₁, …, Tₙ⟩ = B ⊗_A A⟨T₁, …, Tₙ⟩` is finite
over a noetherian ring); if `A` has a noetherian ring of definition `A₀`, `B` has the noetherian
ring of definition `B₀` of (i) above. For `A` only sheafy, sheafiness of `B` is not known
([KL I] §8.2, Rem. 8.2.18, p. 162); for `A` stably uniform, `B` is uniform but not known to be
stably uniform ([HK] §3, Def. 3.13, p. 9). *Needs:* *strongly-sheafy-huber-pair*;
*finite-etale-affinoid-algebra*; AdicSpacesPartIII layer R3; AdicSpacesPartII layer R0; Mathlib
`Algebra.Etale`, `Module.Projective`; Tau Ceti `Huber.IsStronglyNoetherian`,
`ValuationSpectrum.rationalSubset`.

Lean: `Huber.IsStronglySheafy.finiteEtale` (for `B` with its natural topology, a complete Tate
ring); the rest is README only.

**Checks.**

- *stronglySheafy_kummer* — the Kummer algebra `B = K⟨T, T⁻¹⟩[S]/(S² − T)` over the annulus is
  strongly sheafy; indeed `B ≅ K⟨S, S⁻¹⟩` is strongly noetherian.
- *stronglySheafy_pi* (degenerate) — for `B = Aⁿ` the conclusion is the stability of strong
  sheafiness under finite products.
- *stronglySheafy_perfectoid_consumer* — applied with `A` perfectoid or sousperfectoid
  (PerfectoidSpaces, AdicSpacesPartIV layer R5), it gives sheafiness of finite étale covers of
  such affinoids once those rings are shown to be strongly sheafy.

**Rational coverings are effective descent morphisms for finite étale algebras.**
(*finite-etale-rational-descent*) Let `(A, A⁺)` be a complete Tate Huber pair (no sheafiness
assumed) and `{U_i}_{i=1}^n` a finite rational covering of `Spa(A, A⁺)`, with rational
localisations `A_i = O(U_i)`, `A_{ij} = O(U_i ∩ U_j)`, `A_{ijk} = O(U_i ∩ U_j ∩ U_k)`. Prove that
`A → A₁ × ⋯ × A_n` is an effective descent morphism for finite étale algebras: the functor sending
`B ∈ FÉt(A)` to `((B ⊗_A A_i)_i` with the canonical isomorphisms over the `A_{ij})` is an
equivalence onto the category of descent data `(B_i ∈ FÉt(A_i), φ_{ij} : B_i ⊗_{A_i} A_{ij} ≅
B_j ⊗_{A_j} A_{ij})` satisfying the cocycle condition over the `A_{ijk}` ([KL I] §2.6, Thm. 2.6.9,
p. 55; its proof reduces to a finite stage of an affinoid system and then glues by Kiehl's theorem
at the noetherian stage, [KL I] §2.6, proof of Thm. 2.6.9, p. 55). All tensor products are
uncompleted, the algebras being finite projective (*finite-etale-affinoid-algebra* (v)); the
equivalence is compatible with the plus rings of the associated pairs. Every rational covering has
a finite rational subcovering, so the statement covers all rational coverings. *Needs:*
*finite-etale-affinoid-algebra*; *affinoid-system-approximation*; *finite-etale-approximation*;
AdicSpacesPartIII layer R3; AdicSpacesPartII layer R0; Mathlib `Algebra.Etale`,
`Algebra.Etale.baseChange`, `Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`; Tau Ceti
`TauCeti.ValuationSpectrum.faithfullyFlat_pi_toCompletionLoc`, `ValuationSpectrum.rationalSubset`.

`Huber.finiteEtalePseudofunctor` uses Mathlib's `CommAlgCat.FiniteEtale.baseChange` on
morphisms of complete pairs and `Pseudofunctor.DescentData` for overlap compatibility.
The forward functor is identified on each member with
`A_i ⊗_A B`, and on a morphism `f` it sends `a ⊗ b` to `a ⊗ f(b)`.
`finiteEtalePseudofunctor_mapComp` fixes the composition comparison by
`t ⊗ b ↦ t ⊗ (1 ⊗ b)`; the identity comparison is multiplication. README only (no Lean declaration).

**Checks.**

- *finiteEtale_scalarExtension_cycle* — over `ℚ₂`, extending the cyclic permutation
  `f(v)(i) = v(i+1)` of `ℚ₂³` sends `2 ⊗ e₀` to `2e₂` under multiplication;
  its coordinate at `2` is `2`.
- *finiteEtale_scalarExtension_identity_component* — on `ℚ₂³`, the identity comparison sends
  `2 ⊗ e₀` to the vector with coordinates `2` at `0` and `0` at `1`.
- *finiteEtale_scalarExtension_cycle_not_identity* — the coordinate at `0` of the extended
  cycle applied to `2 ⊗ e₀` is different from `2`.
- *descent_kummer* — on the annulus `A = K⟨T, T⁻¹⟩` (`p` odd) with the rational covering
  `U₁ = {|T − 1| ≤ |p|}`, `U₂ = {|T − 1| ≥ |p|}`, the datum `B₁ = A₁ × A₁`, `B₂ = A₂[S]/(S² − T)`,
  glued on `U₁ ∩ U₂` by `S ↦ (√T, −√T)`, is effective with `B = A[S]/(S² − T)`: the Kummer
  covering is recovered from its restrictions by rational descent.
- *descent_trivial_cover* (degenerate) — the trivial covering `{Spa(A, A⁺)}` gives the identity
  equivalence.

**Complete Tate pairs are completed direct limits of noetherian affinoid pairs.**
(*affinoid-system-approximation*) Let `(A, A⁺)` be a complete Hausdorff Tate Huber pair
with arbitrary `A⁺`. The theorem `Huber.AffinoidSystem.exists` supplies a nonempty directed
system of complete strongly noetherian Tate pairs mapping compatibly to `(A, A⁺)`, with the
images of the stage plus rings exhausting `A⁺`. Its carrier `AffinoidSystem` records identity
and composition of transitions, density of the union of images, closure of the union of plus
rings, compatible rings of definition and pseudouniformisers, and detection of congruences:
if a stage element maps into `ϖⁿA₀`, its image at some later stage lies in `ϖⁿA_{j,0}`.
These conditions distinguish the completion from a dense quotient of a system.

Kedlaya–Liu construct the stages from finite subsets `S` of `A⁺`, as the quotients `A_S` of
`ℤ((z))⟨S⟩` by the kernel of the map to `A` with `z ↦ ϖ`. The stage norm is the supremum of the
quotient norm and the subspace norm from `A` ([KL I] §2.6, Def. 2.6.1 and Lem. 2.6.2, p. 53);
by the open mapping theorem it defines the quotient topology ([KL I] Thm. 2.2.8, p. 31).
Including the subspace norm ensures that completion retains the topology and nilpotents of `A`,
also when `A⁺` is unbounded. Let `R_S` be the image of `ℤ⟦z⟧⟨S⟩` in `A_S`. The stage plus ring
is the integral closure `A_S⁺` of `R_S` in `A_S`, so that `(ℤ((z))⟨S⟩, ℤ⟦z⟧⟨S⟩) → (A_S, A_S⁺)`
is a quotient mapping (Tau Ceti `Huber.Pair.quotient`). The proof of [KL I] Lem. 2.6.2 uses
`R_S` itself, which need not be integrally closed in `A_S` (Check
*affinoidSystem_plus_unbounded*), while plus rings must be ([KL I] §2.4, Def. 2.4.1, p. 38). As
`R_S` is an open bounded subring, `A_S⁺` is open, integrally closed in `A_S` and contained in
`A_S°` (`Huber.Pair.isRingOfIntegralElements_integralClosure`); it may be unbounded. For
`S ⊆ T` the transition sends generators to generators, hence `R_S` into `R_T` and `A_S⁺` into
`A_T⁺`. The image of `R_S` in `A` lies in the closure of `ℤ[ϖ][S]`, inside the open, hence
closed, subring `A⁺`; since `A⁺` is integrally closed in `A`, the map `A_S → A` sends `A_S⁺`
into `A⁺`. Each `a ∈ A⁺` is the image of the generator of `R_S` for `S = {a}`, so the images of
the `A_S⁺` exhaust `A⁺`. The rings of definition are not enlarged: the stage rings of
definition are the unit balls for the supremum norms, which are bounded and map into a fixed
ring of definition `A₀` of `A`. For bounded `A⁺`, `Huber.AffinoidSystem.exists_of_bounded_plus`
additionally makes the images of the stage rings of definition exhaust `A⁺`; boundedness is
needed for this stronger conclusion, not for existence of an affinoid system. Adjoining a
generator `x/ϖⁿ` whenever it lies in `A₀` gives the eventual congruence detection in the stage
rings of definition recorded by `detect_small`.

Moreover (a) the
restriction map `Spa(A, A⁺) → lim_α Spa(A_α, A_α⁺)` is a homeomorphism; every rational subset, and
every finite rational covering, of `Spa(A, A⁺)` is the preimage of one of some `Spa(A_α, A_α⁺)`,
and then the rational localisations of the `A_β` (`β ≥ α`) form an affinoid system whose completed
direct limit is the rational localisation of `A` ([KL I] §2.6, Rem. 2.6.3, p. 53; Lem. 2.6.5;
Rem. 2.6.7; the homeomorphism and the finite-stage descent of rational subsets and coverings are
PerfectoidSpaces layer P5's *spa-of-filtered-colimit-of-tate-pairs* and
*descent-of-quasicompact-opens*, stated for cofiltered systems of Tate pairs with compatible
rings of definition, while the construction of the system with its Banach-ring estimates is the
content here); (b) for a finite étale `A_α`-algebra `B_α`, the base changes `B_α ⊗_{A_α} A_β`
(`β ≥ α`) with their finite étale pairs form an affinoid system with completed direct limit the
pair `Huber.Pair.finiteEtale A⁺ (B_α ⊗_{A_α} A)` (no completion needed,
*finite-etale-affinoid-algebra* (v)), and `Spa(B_α ⊗ A) → Spa(B_α) ×_{Spa(A_α)} Spa(A)` is
surjective on underlying sets. The construction theorem
`Huber.AffinoidSystem.finiteEtaleBaseChange` includes a labelled order isomorphism with
`{β | α ≤ β}`, the topological ring isomorphisms from `A_β ⊗ B_α` to the stage rings,
their plus-ring equalities, and the formulas on pure tensors for transitions and completion
maps. `Huber.AffinoidSystem.finiteEtaleBaseChange_spa_surjective` lifts each compatible pair
of valuations; its map from `B_α` is fixed by `b ↦ 1 ⊗ b`. The valuation-amalgamation
argument is [H94], proof of Lem. 3.9(i), pp. 537–538, and finite projective completeness
is [KL I] Lem. 2.2.12(a), p. 32.

The finite-cover statement is `Huber.AffinoidSystem.exists_rationalCovering_stage`, retaining
the labels of all members of the cover. `Huber.AffinoidSystem.rationalLocalization` constructs
the localized affinoid system over the tail by an existence theorem, specifying every stage
as a rational localization and both commuting squares for its transition and completion maps.
`Huber.AffinoidSystem.rationalLocalization_limit` identifies the spectrum of the completed
localization with the compatible families in any such choice of localized stage spectra,
with the subspace topology from the product. These are [KL I] Lem. 2.6.5(a) and
Rem. 2.6.7, p. 54. This is how non-noetherian statements are reduced to Huber's
noetherian theory. *Needs:* *finite-etale-affinoid-algebra*; AdicSpacesPartII layer R0; Tau Ceti
`Huber.IsTateRing`, `Huber.Pair.quotient`, `Huber.Pair.isRingOfIntegralElements_integralClosure`,
`ValuationSpectrum.spa`, `TauCeti.ValuationSpectrum.spa_integralClosure`,
`ValuationSpectrum.rationalSubset`, `TauCeti.ValuationSpectrum.spaComap_preimage_rationalSubset`. README only (no Lean declaration).

**Checks.**

- *exists_rationalCovering_stage_split* — the two idempotent sheets of
  `Spa(ℚ₂ × ℚ₂, ℤ₂ × ℤ₂)` descend together to a two-member rational covering at one stage,
  with each labelled inverse image equal to the image of the corresponding evaluation map.
- *exists_rationalCovering_stage_empty* — a system completing to the zero pair has an empty
  rational covering at some stage; density alone would not imply this.
- *exists_rationalCovering_stage_one_sheet_excluded* — the rational subset `R({1}/e₀)`
  of the split two-point spectrum is not a one-member covering: it misses the second sheet.

- *AffinoidSystem_projection* — there exists an affinoid system indexed by `Fin 2`, with
  stages `ℚ₂ × ℚ₂ → ℚ₂` and first projection as transition. Ring isomorphisms in both
  directions are continuous; the stage plus rings and rings of definition are
  `ℤ₂ × ℤ₂` and `ℤ₂`, and the scales are `(2,2)` and `2`. The maps to the completed
  base are first projection and the identity. The nonzero idempotent `(0,1)` becomes
  zero at the terminal stage. Both the transition and the first map to the base are
  noninjective. This is an existence check, with no supplied system.
- *AffinoidSystem_constant_field* — there exists a one-stage system with ring `ℚ₂`,
  its usual topology, plus ring and ring of definition `ℤ₂`, scale `2`, and identity
  map to the completed base.
- *AffinoidSystem_constant_projection_excluded* — no one-stage system with ring
  `ℚ₂ × ℚ₂`, ring of definition `ℤ₂ × ℤ₂`, scale `(2,2)`, and map to the base given
  by first projection can be an affinoid system. Its transitions are identities,
  so the kernel idempotent survives and is not divisible by `2` in the ring of
  definition. Allowing density alone would admit these data.

- *dense_projection* — In an `AffinoidSystem` over (Q₂,ℤ₂), a stage Q₂ × Q₂
  mapping by first projection must eventually make its integral kernel idempotent (0,1)
  divisible by each power of the compatible pseudouniformiser, by `detect_small`.
- *dense_projection_constant* — Such a system cannot have identity transitions under
  identifications of every stage with Q₂ × Q₂, pseudouniformiser (2,2), and rings of
  definition contained in ℤ₂ × ℤ₂ and containing (0,1). Applying `detect_small` at
  exponent 1 gives 1 = 2y₂ with |y₂|₂ ≤ 1, a contradiction. The surjectivity of the
  projection does not suffice to make these data an `AffinoidSystem`.

- *affinoidSystem_field* — for `A = K` a complete nonarchimedean extension of `ℚ_p` with `ϖ = p`
  (so `ℤ((z))` maps onto `ℚ_p`), the `A_α` are the images of Tate algebras on finitely many elements of `K⁺`,
  equipped with their quotient topologies (their images need not be closed in `K`), and `|Spa(K, K⁺)| = lim |Spa(A_α, A_α⁺)|`.
- *affinoidSystem_rationalSubset_finite_stage* — a rational subset `R(f/g)` of `Spa(A, A⁺)` is the
  preimage of `R(f/g) ⊆ Spa(A_S, A_S⁺)` for any `S` containing `ϖᴺf`, `ϖᴺg` with `N` large.
- *affinoidSystem_plus_unbounded* — for `A = ℚ_p⟨T⟩[ε]/(ε²)` with ring of definition
  `ℤ_p⟨T⟩ ⊕ ℤ_p⟨T⟩ε`, the ring `A⁺ = A° = ℤ_p⟨T⟩ ⊕ ℚ_p⟨T⟩ε` is unbounded.
  An affinoid system still exists and its stage plus rings exhaust `A⁺`. Its completed
  limit is `A`, with `ε` retained: the supremum norms dominate the subspace norm.
  The images of the stage rings of definition cannot exhaust `A⁺`. With `ϖ = p` and
  `S = {T, ε}`, the stage `A_S` is `A`, the image `R_S` of `ℤ⟦z⟧⟨S⟩` is `ℤ_p⟨T⟩ ⊕ ℤ_p⟨T⟩ε`, and
  `ε/p ∉ R_S` although `(ε/p)² = 0`; the stage plus ring `A_S⁺` contains `ε/p` and equals `A⁺`.
- *Huber.affinoidSystem_plus_unbounded_definition* (non-example) — no system whose rings of
  definition map densely into a fixed base ring of definition can have those images exhaust
  an unbounded plus ring.
- *Huber.affinoidSystem_plus_bounded_definition* — a bounded plus ring can be exhausted by
  the images of the stage rings of definition.

**Finite étale algebras are defined at a finite stage of an affinoid system.**
(*finite-etale-approximation*) For an affinoid system `(A_α, A_α⁺)_α` of complete Tate pairs with
completed direct limit `(A, A⁺)` and `A_∞ := colim_α A_α`, the base change functors
`2-colim_α FÉt(A_α) → FÉt(A_∞) → FÉt(A)` are tensor equivalences preserving ranks, and the same
holds over every rational localisation with the induced systems: this is PerfectoidSpaces layer
P3 (*finite-etale-completed-direct-limit*; [KL I] §2.6, Prop. 2.6.8, p. 55; §1.2, Rem. 1.2.9,
p. 15), stated for filtered systems of complete Tate rings with compatible rings of definition and
pseudouniformiser. The structure `Huber.AffinoidSystem` allows noninjective transition and
structure maps; density does not identify `A_∞` with `A`. For the particular exhaustive
systems of subrings constructed in *affinoid-system-approximation*, `A_∞ = A`; only in that
case is the second functor the identity.
*Needs:* PerfectoidSpaces layer P3 (*finite-etale-completed-direct-limit*).

Outside this subsection and this layer: sheafiness of finite étale extensions of merely sheafy or
stably uniform rings, and the uniformisation comparison of finite étale algebras, which is
AdicEtaleGeometry layer A4's. README only (no Lean declaration).

### A1.3 finite étale and étale morphisms

**Finite étale morphisms of analytic adic spaces.** (*finite-etale-morphism*) Let `f : Y → X` be
a morphism of analytic adic spaces (every morphism into an analytic adic space is adic,
AdicSpacesPartII layer R0). Define `AdicSpace.IsFiniteEtale f`: `X` has a covering by open
affinoid subspaces `V = Spa(A, A⁺)` with `A` a complete Tate ring (such charts cover every
analytic adic space, [H96] §1.1, p. 39) such that, for each of them, `f⁻¹(V)` is affinoid,
`B := O_Y(f⁻¹(V))` is a finite étale `A`-algebra via `f^♯`, and the morphism of Huber pairs
`(O_X(V), O_X⁺(V)) → (O_Y(f⁻¹V), O_Y⁺(f⁻¹V))` is `(A, A⁺) → Huber.Pair.finiteEtale A⁺ B` (natural
topology on `B`, plus ring the integral closure of `A⁺`); equivalently `f⁻¹(V) ≅ Spa(B, B⁺)` over
`V` with `B ∈ FÉt(A)` ([KL I] §8.2, Def. 8.2.16, p. 162; [PS] §7, Def. 7.1(ii), p. 39; [Berkeley]
Lecture 7, Def. 7.5.1(1), p. 55). The condition is local on the target by definition; no
particular cover is fixed. The plus ring is part of the condition (a finite étale ring map with
plus ring `B°` is not finite étale in this sense when `A⁺ ≠ A°`); `f` need not be surjective (the
empty space over `X`, and the inclusion of a clopen subspace, are finite étale). Prove
`AdicSpace.IsFiniteEtale.spa` (`Spa(finiteEtale A⁺ B) → Spa(A, A⁺)` is finite étale when both
`(A, A⁺)` and `(B, B⁺)` are sheafy, so that both spectra are adic spaces; sheafiness of `(A, A⁺)`
alone does not give that of `(B, B⁺)`, *finite-etale-strongly-sheafy*), `AdicSpace.IsFiniteEtale.id` (isomorphisms are finite étale),
locality on the target (finite étale is local on the target), the affinoid preimage property
(over an open affinoid with strongly sheafy ring the
preimage is affinoid and finite étale over it, *finite-etale-local-to-global*; this is the "every
open affinoid" form of [ECD] §6, Def. 6.2(i), p. 26, in the perfectoid case ([ECD] §6, after
Def. 6.2, p. 26; [PS] §7, Prop. 7.6, p. 41); the strongly sheafy case is proved here),
`AdicSpace.IsFiniteEtale.isFinite` (finite
étale morphisms are finite in AdicSpacesPartII layer R0's sense),
`AdicSpace.IsEtaleLocalDescription.of_isFiniteEtale` (finite étale morphisms are étale),
`AdicSpace.IsFiniteEtale.comp`, `AdicSpace.IsFiniteEtale.baseChange`,
`AdicSpace.IsFiniteEtale.of_comp` (composites, base change and cancellation, A1.5),
the surjectivity criterion (`f` is surjective iff its degree is everywhere positive
iff each `O_Y(f⁻¹V)` is faithfully flat over `O_X(V)`) and
`AdicSpace.IsFiniteEtale.iff_isFinite_and_etale` (on locally noetherian `X`: finite étale iff
finite and Huber-étale, A1.4). The same local condition read in the category of analytic
Yoneda-adic spaces is Kedlaya–Liu's notion for preadic spaces (*etale-site-generalized*). *Needs:*
*finite-etale-affinoid-algebra*; AdicSpacesPartII layer R0; Tau Ceti `ValuationSpectrum.spa`,
`ValuationSpectrum.rationalSubset`.

Lean: `AdicSpace.IsFiniteEtale` (stated with AdicSpacesPartII's affinoid charts and
`Huber.Pair.Hom.IsFiniteEtale`) and `AdicSpace.IsEtaleLocalDescription.of_isFiniteEtale`; the
stability and comparison statements carry the `Lean:` notes of A1.4–A1.5; the rest is README only.

**Checks.**

- *test_fold* (degenerate) — for any analytic adic space `X`, the fold map `X ⊔ X → X` is finite
  étale of degree `2`, and `∅ → X` is finite étale of degree `0`.
- *test_rational_inclusion* (non-example) — the inclusion of the rational subset `{|T| ≤ |p|}`
  into the closed unit disc over `ℚ_p` is étale but not finite étale: the preimage of the disc is
  not finite over it (its image is not closed).
- *test_squaring* (non-example) — `Spa(K⟨S⟩) → Spa(K⟨T⟩)`, `T ↦ S²`, is finite but not finite
  étale (ramified at the origin).
- *test_plus_ring* (non-example) — for `(K, K⁺)` with `K⁺ ⊊ O_K` of rank 2,
  `Spa(K × K, O_K × O_K) → Spa(K, K⁺)` is not finite étale, although `K → K × K` is a finite
  étale ring map.
- *test_huber* (compatibility) — for `X` locally noetherian,
  `IsFiniteEtale f ↔ AdicSpace.IsFinite f ∧ AdicSpace.Etale f` (AdicSpacesPartII layer R0's
  notions).
- *test_kummer* — the Kummer map `Spa(K⟨S, S⁻¹⟩) → Spa(K⟨T, T⁻¹⟩)`, `T ↦ S²` (`char K ≠ 2`), is
  finite étale of degree `2`.

**Local-to-global recognition over strongly sheafy affinoids.** (*finite-etale-local-to-global*)
Let `f : Y → X` be finite étale and `V = Spa(A, A⁺) ⊆ X` an open affinoid with `A` strongly
sheafy (automatic when `X` is locally strongly sheafy). Prove: (a) `B := O_Y(f⁻¹(V))` is a finite
étale `A`-algebra, `f⁻¹(V)` is affinoid and `f⁻¹(V) ≅ Spa(Huber.Pair.finiteEtale A⁺ B)` over `V`
(in the perfectoid case [ECD] §6, after Def. 6.2, p. 26, and [PS] §7, Prop. 7.6, p. 41; the
strongly sheafy case is proved here); (b)
consequently, on a locally strongly sheafy `X`, `f` is finite étale iff the preimage of every open
affinoid is affinoid and finite étale over it (the form of [ECD] Def. 6.2(i)), iff this holds over
the members of one open cover of `X`; (c) global sections give an equivalence between finite étale
`V`-spaces and `FÉt(A)^op`, with quasi-inverse `B ↦ Spa(Huber.Pair.finiteEtale A⁺ B)`, so `X_fét`
of an affinoid is `FÉt(A)^op` ([KL I] §8.2, Lem. 8.2.17(a), p. 162); (d) the degree
`x ↦ dim_{k(x)} (B ⊗_A k(x))` is locally constant on `X`, and `f` is surjective iff the degree is
everywhere `≥ 1`, iff each such `B` is faithfully flat over `A`; (e) `f` is finite in
AdicSpacesPartII layer R0's sense. The proof is rational descent of finite étale algebras, then
sheafiness of the glued algebra ([KL I] §8.2, proof of Lem. 8.2.17, p. 162). For `V` with `A`
merely sheafy, (a) is not claimed; the preadic statement is *etale-site-generalized*. For
strongly noetherian `A`, (c) and (e) are AdicSpacesPartII layer R0's
*finite-etale-algebra-comparison*
(Huber 1.6.6(ii), quasi-inverse `X ↦ O_X(X)`); the strongly sheafy case, by rational descent and
*finite-etale-strongly-sheafy*, is the content here. *Needs:*
*finite-etale-morphism*; *finite-etale-affinoid-algebra*; *finite-etale-strongly-sheafy*;
*finite-etale-rational-descent*; *strongly-sheafy-huber-pair*; AdicSpacesPartII layer R0; Tau
Ceti `ValuationSpectrum.rationalSubset`. README only (no Lean declaration).

**Checks.**

- *localToGlobal_kummer* — for the annulus `X = Spa(K⟨T, T⁻¹⟩)`, if the Kummer covering is
  defined on the rational covering `{|T − 1| ≤ |p|}`, `{|T − 1| ≥ |p|}` by the descent datum of
  *finite-etale-rational-descent*, the preimage of `X` is `Spa(K⟨T, T⁻¹⟩[S]/(S² − T)) =
  Spa(K⟨S, S⁻¹⟩)`.
- *localToGlobal_degree_not_surjective* — for `X = X₁ ⊔ X₂` the inclusion `X₁ → X` is finite
  étale of degree `1` on `X₁` and `0` on `X₂`, not surjective.

**Étale morphisms of analytic adic spaces.** (*etale-morphism*) A morphism `f : Y → X` of
analytic adic spaces, with no noetherian, sheafiness-of-covers or separatedness hypothesis, is
étale in this layer's sense, `AdicSpace.IsEtaleLocalDescription f`, if every `y ∈ Y` has an open
neighbourhood `U ⊆ Y` such that `f|_U` factors as `U →ʲ W →ᵍ V →ⁱ X` with `j` an open immersion,
`g` finite étale (*finite-etale-morphism*) and `i` an open immersion ([KL I] §8.2, Def. 8.2.16,
p. 162; [PS] §7, Def. 7.1(iii), p. 39; [ECD] §6, Def. 6.2(ii), p. 26, for perfectoid spaces,
where the printed "`y ∈ Y`" means `y ∈ V`). Equivalently, locally `f` is a standard affinoid étale
map, the form of [ECD] §15, proof of Lem. 15.6, p. 91, and [PH] §5, Lem. 5.2, p. 28:

```text
Spa(C, C⁺) ⊆ Spa(B, B⁺) → Spa(A, A⁺) ⊆ X,     A → B finite étale,  B → C rational localisation,
```

`V` a rational subset of an open affinoid of `X`, `W = g⁻¹(V)` affinoid with `W → V` the `Spa` of
a finite étale pair and `U` a rational subset of `W`. No separatedness is included (two copies of
a disc glued along `{|p| ≤ |T|}` map étale to the disc). Prove
`AdicSpace.IsEtaleLocalDescription.of_isOpenImmersion` (open immersions are étale),
`AdicSpace.IsEtaleLocalDescription.of_isFiniteEtale` (finite étale morphisms are étale),
the standard affinoid local form above, locality on the source and on the target,
`AdicSpace.IsEtaleLocalDescription.comp`, `AdicSpace.IsEtaleLocalDescription.baseChange`,
`AdicSpace.IsEtaleLocalDescription.of_comp`, `AdicSpace.IsEtaleLocalDescription.isOpenMap`,
the open-immersion property of the diagonal (composition, base change,
cancellation, openness and the diagonal, A1.5) and `AdicSpace.IsEtaleLocalDescription.iff_etale`
(on locally noetherian analytic spaces, equivalence with Huber's `AdicSpace.Etale`, A1.4). The
name distinguishes this notion from Huber's; Huber's infinitesimal definition is not used on
non-noetherian spaces. *Needs:* *finite-etale-morphism*; *finite-etale-affinoid-algebra*; Tau
Ceti `ValuationSpectrum.rationalSubset`.

Lean: `AdicSpace.IsEtaleLocalDescription` (the local factorisation, with analytic source and
target), `AdicSpace.IsEtaleLocalDescription.of_isOpenImmersion` and
`AdicSpace.IsEtaleLocalDescription.of_isFiniteEtale`; the stability and comparison statements carry
the `Lean:` notes of A1.4–A1.5; the rest is README only.

**Checks.**

- *test_openImmersion* (degenerate) — every open immersion, in particular the inclusion of a
  rational subset, is étale; the identity is étale; the fold map `X ⊔ X → X` and the Kummer map
  of the annulus are étale.
- *test_origin* (non-example) — the closed immersion `Spa(K, K°) → Spa(K⟨T⟩, K°⟨T⟩)` at `T = 0`
  is finite and unramified but not étale; so "unramified" is not a substitute.
- *test_nonseparated* (characterisation) — for `K` a complete nonarchimedean extension of `ℚ_p` and
  `X = Spa(K⟨T⟩, K°⟨T⟩)`, two copies of `X` glued along the open subset `{|p| ≤ |T|}` map étale
  onto `X` by the identity on each copy; the map is not separated over `X`, and is neither finite
  étale nor an open immersion, so étale does not include separatedness. Over `𝔽_p((t))`,
  `p = 0` and the same gluing subset is the whole disc: the glued map is the separated identity.
- *test_huber* (compatibility) — for `X`, `Y` locally noetherian analytic,
  `IsEtaleLocalDescription f ↔ AdicSpace.Etale f` ([H96] §1.6, Def. 1.6.5, via AdicSpacesPartII
  layer R0).

### A1.4 comparison with Huber's definitions

**Comparison with Huber's finite étale and étale morphisms.**
(*etale-morphisms-local-description-and-comparison*) Let `X` be a locally noetherian analytic adic
space (its affinoid charts can be taken to be `Spa(A, A⁺)` with `A` a complete strongly noetherian
Tate ring) and `f : Y → X` a morphism of analytic adic spaces. Prove: (i) `f` is finite étale in
this layer's sense iff `f` is finite and étale in Huber's sense (locally of finite presentation
with bijective infinitesimal lifting against square-zero thickenings of affinoids, [H96] §1.6,
Def. 1.6.5, p. 78), by [H96] §1.6, Example 1.6.6(ii) via AdicSpacesPartII layer R0's comparison of
finite étale algebras; (ii) `f` is étale in this layer's sense iff `f` is étale in Huber's sense —
the direction "Huber-étale implies local description" is Huber's Lemma 2.2.8 via AdicSpacesPartII
layer R0's local open/finite-étale factorisation of étale maps
(*etale-local-open-finite-etale-factorisation*), the converse composes R0's *open-embedding-etale*,
*finite-etale-algebra-comparison*, *etale-smooth-composition* and *etale-smooth-locality*, so
that this item is the record of a three-line corollary of R0, and over a field it is [dJvP]
§3.1, Prop. 3.1.4 ([PS] §7, after Def. 7.1, p. 39, states exactly (i) and (ii), attributed to
Huber 1.6.6(ii) and 2.2.8; [Berkeley] Lecture 7, after Def. 7.5.1, p. 55: (ii) needs analytic
spaces, there is no scheme-theoretic analogue; [KL I] §8.2, before Def. 8.2.16, p. 162: the local
definitions are designed to agree with Huber's in his setting); (iii) consequently the category of
adic spaces étale over `X` in this layer's sense is Huber's `Et/X`, with the same morphisms (every
`X`-morphism between them is étale in both senses), and since both sites take the jointly
surjective families as coverings ([H96] §2.1, p. 109) the étale site built on either description
is the same (recorded as `smallEtaleTopology_eq_huber` under *etale-site*); every étale `Y → X`
in this layer's sense enjoys Huber's standard étale presentations, flatness and unramifiedness,
openness and local quasi-finiteness (AdicSpacesPartII layer R0); (iv) if `f` is étale, `Y` is
again locally noetherian, so (i)–(iii) apply to every object of `X_ét`. This is the statement
AdicSpacesPartIV layer R4 (the étale site on analytic carriers) cites. Huber's Lemma 2.2.8 enters
only through AdicSpacesPartII layer R0, where the gap on Huber's unpublished proof is recorded. No
comparison is claimed for non-analytic (for instance discretely ringed) adic spaces, and on
non-noetherian spaces Huber's infinitesimal notion is not used. *Needs:* *finite-etale-morphism*;
*etale-morphism*; *finite-etale-affinoid-algebra*; *finite-etale-strongly-sheafy*;
AdicSpacesPartII layer R0.

Lean: `AdicSpace.IsFiniteEtale.iff_isFinite_and_etale` ((i)) and
`AdicSpace.IsEtaleLocalDescription.iff_etale` ((ii)), both over a locally noetherian analytic base
(covered by strongly noetherian Tate charts) with analytic source; the rest is README only.

**Checks.**

- *comparison_kummer* — the Kummer map `Spa(K⟨S, S⁻¹⟩) → Spa(K⟨T, T⁻¹⟩)`, `T ↦ S²`
  (`char K ≠ 2`), is finite étale in both senses.
- *comparison_rational_inclusion* — the inclusion `{|T| ≤ |p|} ⊆ Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` is étale in
  both senses and finite in neither.
- *comparison_analytification* — the analytification of an étale morphism of schemes of finite
  type over a complete nontrivially valued nonarchimedean field `K` is étale in both senses:
  `IsEtaleLocalDescription` and Huber's `Etale` ([H96] §1.7, Cor. 1.7.3(i), p. 85,
  AdicSpacesPartII layer R1, transported by (ii)).


**`AdicSpace.smallEtale.huberEquiv`.** The infinitesimal and local-description sites identify the actual spaces and geometric arrows. README only (no Lean declaration).

**Checks.**

- *AdicSpace_smallEtale_huberEquiv_split_quadratic* (computation) — The split quadratic cover has two points after comparison.
- *AdicSpace_smallEtale_huberEquiv_empty_cover* (degenerate) — The empty cover stays empty.
- *AdicSpace_smallEtale_huberEquiv_cycle_fixed_point_free* (non-example) — The geometric three-cycle fixes no point after comparison.

**`AdicSpace.huberSmallEtaleTopology`.** Coverings in the infinitesimal étale site are jointly surjective on the underlying adic spaces. README only (no Lean declaration).

**Checks.**

- *AdicSpace_huberSmallEtaleTopology_fold_covers* (computation) — The split two-sheeted fold covers the point.
- *AdicSpace_huberSmallEtaleTopology_empty_covers_empty* (degenerate) — The empty family covers the empty space.
- *AdicSpace_huberSmallEtaleTopology_empty_does_not_cover_point* (non-example) — The empty space does not cover the nonempty point.

### A1.5 stability properties

Throughout this subsection `X` is locally strongly sheafy and fibre products are formed among adic
spaces.

**Base change of finite étale and étale morphisms.** (*etale-base-change*) Let `f : Y → X` be
finite étale (resp. étale) and `g : X' → X` any morphism of analytic adic spaces (adic, since `X`
is analytic) with `X'` locally strongly sheafy. Prove that the fibre product `Y' := Y ×_X X'`
exists in the category of adic spaces, `Y'` is locally strongly sheafy, and the projection
`f' : Y' → X'` is finite étale (resp. étale) ([KL I] §8.2, after Def. 8.2.16, p. 162). On
locally noetherian `X`, `X'` this is AdicSpacesPartII layer R0's *smooth-etale-base-change*, with
the surjectivity on points below its *fibre-product-points*; the locally strongly sheafy case, by
descent to a noetherian stage of an affinoid system, is the content here. Affinoid
formula: if `V = Spa(A, A⁺) ⊆ X` is open with `f⁻¹(V) = Spa(B, B⁺)`, `B ∈ FÉt(A)`, and
`V' = Spa(C, C⁺) ⊆ g⁻¹(V)` is an open affinoid, then
`f'⁻¹(V') = Spa(Huber.Pair.finiteEtale C⁺ (C ⊗_A B))`, with the uncompleted tensor product and
plus ring the integral closure of the image of `C⁺ ⊗ B⁺` ([PS] §7, Lem. 7.3(ii), p. 40); for a
local description `U ⊆ W → V ⊆ X` of an étale `f`, the base change over `g⁻¹(V)` is the open
subspace of `W ×_V g⁻¹(V)` lying over `U`. Points: `|Y'| → |Y| ×_{|X|} |X'|` is surjective
([PS] §7, Lem. 7.3(i), p. 40, whose printed indices are permuted; [H96] §1.2, Cor. 1.2.3, p. 49),
so jointly surjective families of étale maps pull back to jointly surjective families. The same
conclusions hold for an arbitrary analytic `X'` whenever every algebra `C ⊗_A B` occurring in the
construction is sheafy; without such sheafiness the fibre product is only formed among Yoneda-adic
spaces (*etale-site-generalized*), and fibre products of adic spaces are not claimed in general
([KL I] §8.2, Rem. 8.2.5, p. 160). *Needs:* *finite-etale-morphism*; *etale-morphism*;
*finite-etale-affinoid-algebra*; *finite-etale-local-to-global*; *strongly-sheafy-huber-pair*;
AdicSpacesPartII layer R0; *finite-etale-pullback-comparison*; *rational-pullback-comparison*;
Mathlib `Algebra.Etale.baseChange`.

Lean: `AdicSpace.IsEtaleLocalDescription.exists_fibreProduct`,
`AdicSpace.IsEtaleLocalDescription.baseChange` and `AdicSpace.IsFiniteEtale.baseChange`; the rest
is README only.

**Checks.**

- *baseChange_kummer_split* — for `K ⊇ ℚ_p` with `p` odd, pulling back the Kummer covering of
  the annulus `Spa(K⟨T, T⁻¹⟩)` along the rational inclusion `{|T − 1| ≤ |p|}` gives two disjoint
  copies of `{|T − 1| ≤ |p|}`; for `p = 2` the pullback to `{|T − 1| ≤ |2|}` is connected
  (check *finiteEtale_test_kummer_annulus_two_negative*), and the splitting disc is `{|T − 1| ≤ |8|}`.
- *baseChange_fold* (degenerate) — the base change of the fold map `X ⊔ X → X` along any
  `g : X' → X` is the fold map `X' ⊔ X' → X'`.
- *baseChange_rational_squaring* — the base change of the rational inclusion
  `{|T| ≤ |p|} ⊆ Spa(K⟨T⟩)` along the squaring map `T ↦ S²` is the rational subset
  `{|S²| ≤ |p|}` of `Spa(K⟨S⟩)`.

**Composites of finite étale, resp. étale, morphisms.** (*etale-composition*) Let `g : Z → Y` and
`f : Y → X` be morphisms of analytic adic spaces with `X` locally strongly sheafy. Prove: (i) if
`f` and `g` are finite étale, so is `f ∘ g` — over an open affinoid `V = Spa(A, A⁺) ⊆ X`,
`(f ∘ g)⁻¹(V) = Spa(C, C⁺)` with `C` finite étale over `B = O_Y(f⁻¹V)` and hence over `A`, and
`C⁺` the integral closure of `A⁺` in `C`; (ii) if `f` and `g` are étale, so is `f ∘ g`; (iii) an
étale `Y` over a locally strongly sheafy `X` is locally strongly sheafy. The content of (ii) is the
local statement: for `A` strongly sheafy, `B ∈ FÉt(A)`, a rational localisation `B → B'` and
`C ∈ FÉt(B')`, every point of `Spa(C, C⁺)` has a neighbourhood that is a rational subset of
`Spa(D, D⁺)` for some `D ∈ FÉt(A')`, `A'` a rational localisation of `A` — "finite étale after
rational after finite étale" is locally "rational after finite étale after rational" ([KL I]
§8.2, Lem. 8.2.17(c), p. 162). It is proved by descending the data to a noetherian stage of an
affinoid system, where Huber's Lemma 2.2.8 applies through AdicSpacesPartII layer R0 (on locally
noetherian spaces the statement is R0's *etale-smooth-composition*), and
base-changing back ([KL I] §8.2, proof of Lem. 8.2.17, p. 162; the same statement for perfectoid
spaces, also by reduction to noetherian adic spaces, is [Berkeley] Lecture 7, Prop. 7.5.2(1),
p. 55, and [PS] §7, proof of Cor. 7.8, p. 42). *Needs:* *finite-etale-morphism*;
*etale-morphism*; *finite-etale-local-to-global*; *affinoid-system-approximation*;
*finite-etale-approximation*; *strongly-sheafy-huber-pair*; *etale-base-change*;
*etale-morphisms-local-description-and-comparison*; AdicSpacesPartII layer R0; Mathlib
`Algebra.Etale.comp`, `Module.Finite.trans`, `integralClosure`.

Lean: `AdicSpace.IsEtaleLocalDescription.comp` and `AdicSpace.IsFiniteEtale.comp`; the rest is
README only.

**Checks.**

- *composition_kummer_degree_four* — over the annulus `Spa(K⟨T, T⁻¹⟩)` (`2 ∈ K^×`, any residue
  characteristic), the composite of the Kummer maps `S ↦ S²` and `R ↦ R²` is the finite étale
  Kummer covering `R ↦ R⁴` of degree `4` (the discriminant of `X⁴ − T` is `−4⁴T³ = −256T³`, a
  unit because `2` and `T` are units).
- *composition_rational_then_kummer* — for `K ⊇ ℚ_p` with `p` odd, the composite of the rational
  inclusion `{|S − 1| ≤ |p|} ⊆ Spa(K⟨S, S⁻¹⟩)` with the Kummer map `S ↦ S² = T` is étale; it is
  an open immersion onto `{|T − 1| ≤ |p|}`, since `|S + 1| = |(S − 1) + 2| = |2| = 1` there and so
  `|T − 1| = |S − 1||S + 1| = |S − 1|`, and `−S` lies outside the disc (`|−S − 1| = 1`). For
  `p = 2`, `|S + 1| ≤ |2|` on `{|S − 1| ≤ |2|}`, the image lies in `{|T − 1| ≤ |4|}` and the map is
  not onto `{|T − 1| ≤ |2|}` (`T = 3` is not hit).

**The diagonal of an étale morphism.** (*etale-diagonal*) Let `f : Y → X` be étale with `X`
locally strongly sheafy, so that `Y ×_X Y` exists (*etale-base-change*). Prove that the diagonal
`Δ_f : Y → Y ×_X Y` is an open immersion, and that if `f` is finite étale `Δ_f` is an open and
closed immersion: over an open affinoid `V = Spa(A, A⁺)` with `f⁻¹(V) = Spa(B, B⁺)`, `Δ_f` is
`Spa(B, B⁺) ≅ Spa(e(B ⊗_A B)) ⊆ Spa(B ⊗_A B)` for the diagonal idempotent `e ∈ B ⊗_A B`
(multiplication sends `e` to `1`, and `e` kills the kernel of multiplication) ([KL I] §1.2,
Def. 1.2.2, p. 13; open and closed subsets of the adic spectrum correspond to idempotents, [KL I]
§2.6, Prop. 2.6.4, p. 54; [dJvP] §3.2, proof of Prop. 3.2.2, p. 24; on locally noetherian spaces
the openness of the diagonal is AdicSpacesPartII layer R0's *infinitesimal-criteria* with
*diagonal-locally-closed*). Consequences: (a) for étale
`X`-spaces `U`, `W` and `X`-morphisms `s, t : U ⇉ W`, the equaliser of `s` and `t` is the open
subspace `(s, t)⁻¹(Δ_W)` of `U`, étale over `X`; so the category of étale `X`-spaces has
equalisers, and for finite étale `X`-spaces the equaliser is open and closed (this is what makes
stalk colimits filtered, [ECD] §14, proof of Prop. 14.3, p. 82); (b) every section of an étale
morphism is an open immersion, and every section of a finite étale morphism is an open and closed
immersion. *Needs:* *etale-morphism*; *finite-etale-morphism*; *etale-base-change*;
*finite-etale-local-to-global*; Mathlib `Algebra.FormallyUnramified.iff_exists_tensorProduct`,
`Algebra.TensorProduct.lmul'`; AdicSpacesPartII layer R0. README only (no Lean declaration).

**Checks.**

- *diagonal_fold* — for the fold map `X ⊔ X → X`, `(X ⊔ X) ×_X (X ⊔ X)` is four copies of `X`
  and `Δ` is the inclusion of the two diagonal copies.
- *diagonal_kummer* — for the Kummer covering `Y → X` of the annulus (`2` invertible),
  `Y ×_X Y ≅ Y ⊔ Y` (via `(S, S') ↦ S'/S = ±1`) and `Δ` is the inclusion of the component
  `S' = S`.
- *diagonal_nonseparated_not_closed* (non-example) — over a complete nonarchimedean extension
  of `ℚ_p`, for two copies of the disc glued along `{|p| ≤ |T|}` (étale over the disc),
  `Δ` is an open immersion that is not closed.

**Cancellation.** (*etale-cancellation*) Let `X` be locally strongly sheafy and `p : Y → X`,
`q : Z → X` étale (resp. finite étale). Prove that every `X`-morphism `h : Y → Z` is étale (resp.
finite étale); equivalently, if `q` and `q ∘ h` are étale (resp. finite étale), so is `h`
([dJvP] §3.2, p. 23; [Berkeley] Lecture 7, Prop. 7.5.2(3), p. 55; [ECD] §6, after Def. 6.2,
p. 26; on locally noetherian spaces, AdicSpacesPartII layer R0's *etale-smooth-cancellation*).
*Needs:* *etale-morphism*; *finite-etale-morphism*; *etale-base-change*;
*etale-diagonal*; *etale-composition*; *strongly-sheafy-huber-pair*.

Lean: `AdicSpace.IsEtaleLocalDescription.of_comp` (the étale case); the rest is README only.

**Checks.**

- *cancellation_kummer_automorphism* — the automorphism `S ↦ −S` of the Kummer covering of the
  annulus is finite étale.
- *cancellation_squaring_not_etale* (non-example) — the squaring map `Spa(K⟨S⟩) → Spa(K⟨T⟩)` is
  a morphism over `X = Spa(K⟨T⟩)` but is not étale; consistently, its source is not étale over
  `X`, so the hypothesis on `p` cannot be dropped.

**Étale morphisms are open.** (*etale-open-map*) Let `f : Y → X` be étale with `X` locally
strongly sheafy. Prove: (i) `f` is open on underlying spaces (by reduction to the noetherian case,
AdicSpacesPartII layer R0's *smooth-morphism-open*, Huber 1.7.8, the strategy of [PS] §7, proof
of Cor. 7.8, p. 42; openness is what makes covering
conditions of étale families purely set-theoretic, [ECD] §1, p. 3); (ii) if `Y` is quasi-compact,
`f(Y)` is a quasi-compact open subset of `X` and `f` factors uniquely as `Y → Z → X` with `Y → Z`
surjective and étale, `Z` the quasi-compact open subspace `f(Y)` and `Z → X` its inclusion
([KL I] §8.2, Lem. 8.2.17(b), p. 162); if moreover `X` is affinoid, `f(Y)` is a finite union of
rational subsets ([dJvP] §3.1, Prop. 3.1.7(1), p. 21); (iii) a family of étale maps `(Y_i → X)`
is jointly surjective iff the open images cover `X`, and for `X` quasi-compact finitely many
quasi-compact opens `V_j ⊆ Y_{i_j}` already have images covering `X`. [KL I] proves
Lem. 8.2.17(b) and (c) by a two-line reduction; that reduction is carried out here and in
*etale-composition*. *Needs:* *etale-morphism*; *finite-etale-morphism*; *etale-composition*;
*etale-base-change*; *etale-morphisms-local-description-and-comparison*; AdicSpacesPartII
layer R0.

Lean: `AdicSpace.IsEtaleLocalDescription.isOpenMap` ((i)); the rest is README only.

**Checks.**

- *openMap_kummer* — the Kummer covering of the annulus is open and surjective.
- *openMap_image_rational* — the image under `S ↦ S²` of the rational subset `{|S − 1| ≤ |p|}` of
  `Spa(K⟨S, S⁻¹⟩)` is the rational subset `{|T − 1| ≤ |p|}` (`p` odd).

Fibre products of arbitrary adic spaces lie outside this layer: they are asserted only in the
locally strongly sheafy situations above.

### A1.6 the étale and finite étale sites

**The small étale site.** (*etale-site*) Let `X` be a locally strongly sheafy analytic adic
space. Define `AdicSpace.smallEtale X`, the category `Et/X` of adic spaces over `X` whose
structure morphism is étale in this layer's sense (Mathlib `MorphismProperty.Over` of
`AdicSpace.IsEtaleLocalDescription` over `X`), with all `X`-morphisms admitted (they are
automatically étale, *etale-cancellation*), and the Grothendieck topology
`AdicSpace.smallEtaleTopology X` generated by the pretopology `AdicSpace.smallEtalePretopology` of
jointly surjective families: `(f_i : U_i → U)_i` is a covering iff `|U| = ⋃_i f_i(|U_i|)`, all
points counted, including points of higher rank ([H96] §2.1, p. 109; [KL I] §8.2, Def. 8.2.19 and the paragraph after it,
pp. 162–163; [Berkeley] Lecture 7, Def. 7.5.1(3), p. 55; the perfectoid instance is [PS] §7,
Def. 7.11, p. 43). Prove `AdicSpace.smallEtale.mk` (an object from an étale `U → X`),
`AdicSpace.smallEtale.forget` (the fully faithful forgetful functor `Et/X ⥤ Over X`),
`AdicSpace.smallEtale.hasFiniteLimits` (`Et/X` has the final object `X`, fibre products
(*etale-base-change*) and equalisers (*etale-diagonal*), hence all finite limits, and its objects
are locally strongly sheafy, *etale-composition* (iii)); that the jointly surjective families form
a Mathlib `Pretopology` (isomorphisms; stability under base change by the surjectivity of
`|U ×_V W| → |U| ×_{|V|} |W|`; composition), with
the covering criterion (`Sieve.ofArrows f` is covering iff
`⋃ range |f_i| = |U|`); `AdicSpace.opensToSmallEtale` (open subspaces of `X` are objects and open
coverings are coverings, and the inclusion of the analytic site, Mathlib
`Opens.grothendieckTopology`, is a continuous functor preserving finite limits, giving the
morphism of sites `λ_X : X_ét → X_an`); for `g : X' → X` of locally strongly sheafy analytic adic
spaces, `AdicSpace.smallEtale.map` (base change `U ↦ U ×_X X'` is a continuous functor
`Et/X ⥤ Et/X'` preserving finite limits, defining the morphism of sites `g_ét : X'_ét → X_ét`;
[dJvP] §3.2, p. 23), `AdicSpace.etaleSheafPushforward` (`(g_*F)(U) = F(U ×_X X')`, Mathlib
`Functor.sheafPushforwardContinuous`), `AdicSpace.etaleSheafPullback` (`g^{-1}`, Mathlib
`Functor.sheafPullback`, left adjoint of `g_*`) and `AdicSpace.smallEtale.mapComp`
(`(h ∘ g)^* ≅ g^* ∘ h^*` and `id^* ≅ id`, coherent) — these four functoriality items are
re-exported on the R0/R1 carriers by AdicSpacesPartIV layer R4 (*etale-site-functoriality*);
the identification with Huber's site (on
locally noetherian `X` this is Huber's `X_et`, *etale-morphisms-local-description-and-comparison*);
and `AdicSpace.structureSheafEtale` (`O_{X_ét}` and `O⁺_{X_ét}`, *etale-structure-sheaf*). On
perfectoid `X` this is Scholze's `X_ét` of perfectoid spaces. For an analytic `X` that is not
locally strongly sheafy, Kedlaya–Liu's site with Yoneda-adic objects is *etale-site-generalized*.
*Needs:* *strongly-sheafy-huber-pair*; *etale-morphism*; *etale-base-change*;
*etale-composition*; *etale-diagonal*; *etale-cancellation*;
*etale-morphisms-local-description-and-comparison*; Mathlib `Opens.grothendieckTopology`,
`AlgebraicGeometry.Scheme.smallEtaleTopology`, `CategoryTheory.MorphismProperty.Over`,
`CategoryTheory.Pretopology`, `CategoryTheory.Pretopology.toGrothendieck`,
`CategoryTheory.GrothendieckTopology`, `CategoryTheory.Functor.IsContinuous`,
`CategoryTheory.Functor.sheafPushforwardContinuous`, `CategoryTheory.Functor.sheafPullback`. README only (no Lean declaration).

**Checks.**

- *test_kummer_cover* (computation) — for `X` the annulus over `K ⊇ ℚ_p` (`p` odd), the Kummer
  map `Spa(K⟨S, S⁻¹⟩) → X` is a one-member covering, and so is the two-member rational covering
  `{|T − 1| ≤ |p|}`, `{|T − 1| ≥ |p|}`.
- *test_rank_one_not_enough* (non-example) — for `X = Spa(K, K⁺)` with `K⁺` of rank 2 (points
  `η` generic, `s` closed), the open immersion `{η} → X` is an object of `X_ét` whose image
  contains every rank-one point, but the one-member family `({η} → X)` is not a covering:
  coverings must be surjective on higher-rank points too.
- *test_geometric_point* (degenerate) — for `X = Spa(C, C⁺)` with `C` algebraically closed, every
  covering of `X` contains a member admitting a section (*geometric-point-etale-split*).
- *test_huber* (compatibility) — for `X` locally noetherian, `smallEtaleTopology X` is Huber's
  étale topology on `Et/X`, which AdicSpacesPartIV layer R4 uses on its carriers and constructs no
  other (*etale-site-on-analytic-carriers*), with Huber's properties of étale maps available.
- *test_opens* (characterisation) — a family of open immersions `U_i ⊆ U` is a covering of `U` in
  `X_ét` iff it is an open covering of `U`.
- *test_empty* (degenerate) — the empty family is a covering of `U ∈ X_ét` iff `|U| = ∅`;
  `∅ → X` is an object of `X_ét` (finite étale of degree `0`), covered by the empty family, and
  for `X = ∅` the site `Et/X` has the single object `∅` with the empty covering; a one-member
  family `(U → X)` with `U ≠ ∅` never covers `∅`.

**The small finite étale site.** (*finite-etale-site*) Let `X` be locally strongly sheafy
analytic. Define `AdicSpace.smallFiniteEtale X`, the full subcategory of adic spaces finite étale
over `X` (all `X`-morphisms, finite étale by *etale-cancellation*), with the topology
`AdicSpace.smallFiniteEtaleTopology X` generated by the jointly surjective families ([KL I] §8.2,
Def. 8.2.19 and the paragraph after it, pp. 162–163; the category underlying Scholze's pro-finite étale site, [PH] §3, before
Def. 3.3, p. 13). Prove the covering criterion (covering iff
jointly surjective), `AdicSpace.smallFiniteEtale.hasFiniteLimits` (finite limits — fibre products
by *etale-base-change*, equalisers open and closed by *etale-diagonal* — finite coproducts
(disjoint unions) and the initial object `∅`; the jointly surjective families form a
pretopology), `AdicSpace.smallFiniteEtale.affinoidEquiv` (for `X = Spa(A, A⁺)` affinoid, global
sections give `smallFiniteEtale X ≌ (CommAlgCat.FiniteEtale A)ᵒᵖ`, with quasi-inverse
`B ↦ Spa(Huber.Pair.finiteEtale A⁺ B)`, *finite-etale-local-to-global* (c), [KL I] §8.2,
Lem. 8.2.17(a), p. 162, and in the perfectoid case [ECD] §6, after Def. 6.2, p. 26; under it a
finite family `(B_i)` is a covering iff `∏_i B_i` is faithfully flat over `A`),
`AdicSpace.smallFiniteEtale.toSmallEtale` (the inclusion `X_fét → X_ét` is fully faithful,
continuous, preserves finite limits and coverings, and so defines a morphism of sites
`X_ét → X_fét`), `AdicSpace.smallFiniteEtale.map` (for `g : X' → X`, base change defines a
morphism of sites `X'_fét → X_fét` compatible with `toSmallEtale`),
`AdicSpace.smallFiniteEtale.fiberFunctor` (for a geometric point `ξ`,
`F_ξ : X_fét ⥤ FintypeCat`) and `AdicSpace.smallFiniteEtale.galoisCategory` (for connected
nonempty `X`, `X_fét` is a Galois category, *finite-etale-galois-category*). *Needs:*
*finite-etale-morphism*; *finite-etale-local-to-global*; *etale-base-change*; *etale-diagonal*;
*etale-cancellation*; *etale-composition*; *etale-site*; *strongly-sheafy-huber-pair*; Mathlib
`CommAlgCat.FiniteEtale`, `CategoryTheory.MorphismProperty.Over`, `CategoryTheory.Pretopology`,
`CategoryTheory.Pretopology.toGrothendieck`, `CategoryTheory.GrothendieckTopology`,
`CategoryTheory.Functor.IsContinuous`, `CategoryTheory.Functor.sheafPushforwardContinuous`,
`CategoryTheory.Functor.sheafPullback`. README only (no Lean declaration).

**Checks.**

- *test_field* (computation) — for `X = Spa(K, K⁺)`, `smallFiniteEtale X ≌
  (CommAlgCat.FiniteEtale K)ᵒᵖ ≃` finite continuous `Gal(K^sep/K)`-sets, independently of `K⁺`.
- *test_algClosed* (degenerate) — for `X = Spa(C, C⁺)` with `C` algebraically closed, every
  object of `X_fét` is a finite disjoint union of copies of `X`: `X_fét` is split.
- *test_open_not_object* (non-example) — the inclusion of a proper nonempty rational subset of a
  connected affinoid `X` is étale but is not an object of `X_fét`.
- *test_affinoid_equiv* (compatibility) — for `X = Spa(A, A⁺)`, `Γ` induces
  `smallFiniteEtale X ≌ (CommAlgCat.FiniteEtale A)ᵒᵖ`.
- *test_cover_iff* (characterisation) — for `X` affinoid, `(Spa B_i → X)_i` is a covering iff
  `∏ B_i` is faithfully flat over `A`.
- *test_kummer_connected* — for the annulus `X` over `ℂ_p`, the Kummer coverings `Sⁿ = T` are
  connected objects of `X_fét` with automorphism group `μ_n`.

**The structure sheaves on the étale site.** (*etale-structure-sheaf*) For `X` locally strongly
sheafy analytic, prove that the presheaves `O_{X_ét} : U ↦ O_U(U)` and `O⁺_{X_ét} : U ↦ O⁺_U(U)`
on `X_ét`, with restriction along `X`-morphisms, are sheaves (of complete topological rings,
resp. of rings); that `O_{X_ét}(U) = O_X(U)` for open `U ⊆ X`, i.e. `λ_{X,*}O_{X_ét} = O_X` and
`λ_{X,*}O⁺_{X_ét} = O⁺_X`; and that for a surjective finite étale `Spa(B, B⁺) → Spa(A, A⁺)` in
`X_ét`, `A → B ⇉ B ⊗_A B` is an equaliser of topological rings — faithfully flat descent for
finite étale surjections, via Mathlib's `CommRingCat.isLimitForkPushoutSelfOfFaithfullyFlat`
([KL I] §8.2, Thm. 8.2.22(a), p. 165, the sheaf property of `M̃` for the finite étale topology;
[HK] §5, proof of Prop. 5.5, p. 15; the criterion of [dJvP] §3.2, Prop. 3.2.2, p. 23). For a
sheafy affinoid with a stable basis the sheaf property of `O` is AdicSpacesPartIV layer R5's
*stable-basis-etale-vector-bundles* with `M = A`, and for perfectoid `X` PerfectoidSpaces layer
P3's *etale-almost-acyclicity*; `O⁺`, non-affinoid `X` and `λ_{X,*}O_{X_ét} = O_X` are the content
here. Only the
sheaf property is asserted; the vanishing of higher Čech and sheaf cohomology of `O` on the basis
([KL I] Thm. 8.2.22; [HK] §5, Prop. 5.8, p. 16) is cohomological and belongs to AdicSpacesPartIII
layer R3 and the étale-cohomology roadmaps. *Needs:* *etale-site*; *basis-comparison*;
*etale-covering-reduction*; *finite-etale-local-to-global*; *finite-etale-rational-descent*;
*strongly-sheafy-huber-pair*; Mathlib `CommRingCat.isLimitForkPushoutSelfOfFaithfullyFlat`,
`Module.FaithfullyFlat`, `CategoryTheory.Presieve.IsSheafFor`, `CategoryTheory.Sheaf`. README only (no Lean declaration).

**Checks.**

- *structureSheaf_kummer_equaliser* — for the Kummer covering `Y → X` of the annulus,
  `O(X) = K⟨T, T⁻¹⟩` is the equaliser of the two maps `K⟨S, S⁻¹⟩ ⇉ K⟨S, S⁻¹⟩ × K⟨S, S⁻¹⟩`
  (`Y ×_X Y ≅ Y ⊔ Y`, the second map twisted by `S ↦ −S`).
- *structureSheaf_galois_invariants* — for `X = Spa(K, K⁺)` and a finite Galois extension `L/K`
  with group `G`, `O(X) = K = L^G`.

**The affinoid étale basis.** (*basis-comparison*) For `X` locally strongly sheafy analytic, call
an object `U → X` of `X_ét` basic if `U` is affinoid and `U → X` factors as
`Spa(D_m) → ⋯ → Spa(D₀) = V ⊆ X` with `V` an open affinoid of `X` and each
`Spa(D_{k+1}) → Spa(D_k)` either the inclusion of a rational subset or the `Spa` of a finite étale
pair — composites of rational localisations and finite étale maps ([HK] §5, proof of Prop. 5.5,
p. 15) — and let `X_ét^aff ⊆ X_ét` be the full subcategory of objects isomorphic to basic ones,
with the induced topology. Prove: (a) every object of `X_ét` has an (open) covering by objects of
`X_ét^aff`; (b) every object of `X_ét^aff` is an affinoid adic space with strongly sheafy
coordinate ring, and `X_ét^aff` is closed under finite étale maps, rational subdomain embeddings
and fibre products over a common open affinoid `V ⊆ X` (for basic `U → V`, `U' → V`,
`U ×_V U'` is affinoid, `Spa` of a finite étale algebra over a rational localisation of a tensor
product). For basic `U`, `V` mapping to a quasi-separated étale object `W`,
`U ×_W V` admits a finite basic open covering. The proposed Lean statement also retains
quasi-separatedness of `X`; this alone does not imply quasi-separatedness of `W`.
This gives a stable basis in the sense used for stably adic spaces ([KL I] §8.2, Def. 8.2.19 and the paragraph after it, pp. 162–163; rigid
analytic spaces are stably adic, [KL I] §8.2, after Def. 8.2.19 and the paragraph after it, pp. 162–163); for `X` not
quasi-separated the fibre product of two basic objects need not be quasi-compact
(check *basis_nonseparated_fibre_product*), which the dense-subsite statement (c) does not need; (c) the
inclusion `X_ét^aff → X_ét` is a dense subsite (Mathlib `Functor.IsDenseSubsite`), so restriction
`Sh(X_ét, 𝒜) ≃ Sh(X_ét^aff, 𝒜)` is Mathlib's `IsDenseSubsite.sheafEquiv` for every coefficient
category `𝒜` to which it applies (sets, abelian groups, modules, rings). For sousperfectoid `X`
the stable basis is AdicSpacesPartIV layer R5's *sousperfectoid-stably-adic*; the locally
strongly sheafy case and (c) are the content here. For locally noetherian
`X` the objects of `X_ét^aff` include the affinoids "rational embedding, finite étale, rational
embedding" of [PH] §5, Lem. 5.2, p. 28, and [ECD] §6, proof of Prop. 6.4, pp. 27–28 (perfectoid spaces). *Needs:*
*etale-site*; *etale-morphism*; *strongly-sheafy-huber-pair*; *etale-composition*;
*finite-etale-local-to-global*; *finite-etale-affinoid-algebra*; *etale-base-change*;
*etale-open-map*; AdicSpacesPartII layer R0; Tau Ceti
`TauCeti.ValuationSpectrum.spaComap_preimage_rationalSubset`; Mathlib
`CategoryTheory.Functor.IsCoverDense`, `CategoryTheory.Functor.IsDenseSubsite`,
`CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`. README only (no Lean declaration).

**Checks.**

- *basis_kummer_rational* — in the annulus `X = Spa(K⟨T, T⁻¹⟩)`, the rational subset
  `{|S − 1| ≤ |p|}` of the Kummer covering `Spa(K⟨S, S⁻¹⟩)` is a basic object of `X_ét`.
- *basis_sheafEquiv* — a sheaf on `X_ét` is determined by its values on basic objects and their
  restriction maps.
- *basis_nonseparated_fibre_product* (non-example) — for `X` two copies `V`, `V'` of the closed
  disc `Spa(K⟨T⟩, K°⟨T⟩)` over a complete nonarchimedean field `K`, fix a pseudouniformiser `ϖ` and glue
  along the open unit disc `U = ⋃_{n ≥ 1} {|T|^n ≤ |ϖ|}`. Then `V` and `V'` are basic
  objects but `V ×_X V' = V ∩ V' = U` is not quasi-compact, so not affinoid: `X_ét^aff` is
  not closed under fibre products in `X_ét`. The map from this glued space to a single
  closed disc is étale; thus a quasi-separated base `X` does not suffice for products
  over arbitrary `W ∈ X_ét`. A quasi-separated `W` gives finite basic coverings of
  `U ×_W V`.

**Reduction of étale coverings and the sheaf criterion.** (*etale-covering-reduction*) Let `X`
be locally strongly sheafy analytic and `𝓑` a cover-dense class of affinoid objects of `X_ét`
stable under rational embeddings and finite étale maps — by default `𝓑 = X_ét^aff`, the basis of
*basis-comparison* (coverings of basis objects by basis objects admit finite subcovers, by
quasi-compactness), and in general any stable basis in this sense — and `P` a property of finite
coverings in `X_ét` of objects of `𝓑` by objects of `𝓑` such that (a) a covering admitting a
refinement with `P` has `P`; (b) composites of coverings with `P` have `P`; (c) for `Y ∈ 𝓑` every
rational covering of `Y` has `P`; (d) for `Y ∈ 𝓑` every surjective finite étale `Y' → Y`, as a
one-member covering, has `P`. Prove that every finite covering in `X_ét` of an object of `𝓑` by
objects of `𝓑` has `P` ([KL I] §8.2, Prop. 8.2.20 and its proof, p. 163, after [dJvP] §3.2,
Prop. 3.2.2, p. 23, by induction on the degree using the complement of the diagonal).
This is the generic theorem, proved once for an arbitrary stable class `𝓑`; AdicSpacesPartIV
layer R5 (*stable-basis-covering-reduction*) is its wrapper for the class of
sousperfectoid-stably-adic objects (a consumer, with no second proof). Sheaf
criterion: a presheaf `F` of sets (or abelian groups) on `X_ét` is a sheaf iff (1) for every
`U ∈ X_ét` the restriction of `F` to the open subspaces of `U` is a sheaf, and (2) for every
surjective finite étale `Y' → Y` of objects of `𝓑`, `F(Y) → F(Y') ⇉ F(Y' ×_Y Y')` is an equaliser.
*Needs:* *basis-comparison*; *etale-site*; *etale-diagonal*; *etale-open-map*;
*etale-composition*; *etale-base-change*; Mathlib `CategoryTheory.Presieve.IsSheafFor`. README only (no Lean declaration).

**Checks.**

- *reduction_structure_presheaf* — the structure presheaf `O` satisfies (1) (sheafiness of the
  strongly sheafy charts) and (2) (faithfully flat descent), so it is a sheaf on `X_ét`
  (*etale-structure-sheaf*).
- *reduction_constant_sheaf* — the presheaf `U ↦ H⁰(U, ℤ/n)` of locally constant functions
  satisfies (1) and (2), recovering the constant sheaf `ℤ/n`.

**The slice site.** (*slice-site*) Let `X` be locally strongly sheafy analytic and `u : U → X` an
object of `X_ét` (`U` is locally strongly sheafy, *etale-composition* (iii)). Prove that
`U_ét → X_ét/U`, `(V → U) ↦ (V → U → X` with its map to `U)`, is an equivalence identifying the
étale topology of `U` with the topology induced on the slice (Mathlib
`GrothendieckTopology.over`): a sieve on `V` is covering in `U_ét` iff its image is covering in
`X_ét` ([dJvP] §3.2, p. 23; coverings are defined by surjectivity independently of the base,
[H96] §2.1, p. 109; the pro-étale analogue is [PH] §3, Prop. 3.15, p. 19; AdicSpacesPartIV layer
R4 re-exports it on its carriers, *etale-slice-site*). Under it restriction
`u^{-1} : Sh(X_ét) → Sh(U_ét)` is Mathlib's `GrothendieckTopology.overPullback`,
`(u^{-1}F)(V) = F(V → X)`, agreeing with the inverse image along `u_ét` of *etale-site*, and
`u_*G(W) = G(W ×_X U)`. Likewise `U_fét ≃ X_fét/U` when `U → X` is finite étale, and
`U_an ≃ X_an/U` when `U ⊆ X` is open. *Needs:* *etale-site*; *finite-etale-site*;
*etale-composition*; *etale-cancellation*; *etale-base-change*; *basis-comparison*; Mathlib
`CategoryTheory.GrothendieckTopology.over`, `CategoryTheory.GrothendieckTopology.overPullback`,
`CategoryTheory.Over.iteratedSliceEquiv`, `CategoryTheory.Functor.sheafPushforwardContinuous`. README only (no Lean declaration).

**Checks.**

- *slice_identity* (degenerate) — for `U = X` the equivalence is `X_ét ≃ X_ét/X`.
- *slice_kummer_restriction* — for the Kummer covering `u : U → X` of the annulus and `F` on
  `X_ét`, `(u^{-1}F)(U) = F(U)`.

No derived or cohomological statement is made on these sites; that is the étale-cohomology
roadmaps' and AdicSpacesPartIII layer R3's.


**`AdicSpace.smallEtale.space`.** The étale source-space functor sends the split three-cycle to the corresponding permutation of points. README only (no Lean declaration).

**Checks.**

- *AdicSpace_smallEtale_space_positive* (computation) — The split two-sheeted Q₂ cover has exactly two underlying points.
- *AdicSpace_smallEtale_space_degenerate* (degenerate) — The zero-sheeted cover has empty underlying space.
- *AdicSpace_smallEtale_space_negative* (non-example) — The three-cycle sends point 0 to point 1, not point 2; inverse action is excluded.

**`AdicSpace.smallFiniteEtale.space`.** For finite étale objects, the source-space functor retains the empty cover and distinguishes a three-cycle from its inverse. README only (no Lean declaration).

**Checks.**

- *AdicSpace_smallFiniteEtale_space_positive* (computation) — The split two-sheeted Q₂ cover has exactly two underlying points.
- *AdicSpace_smallFiniteEtale_space_degenerate* (degenerate) — The zero-sheeted cover has empty underlying space.
- *AdicSpace_smallFiniteEtale_space_negative* (non-example) — The three-cycle sends point 0 to point 1, not point 2; inverse action is excluded.

**`AdicSpace.structurePresheafEtale`.** Before imposing descent, sections on split covers form ordered products of Q₂ and arrows pull back these functions. README only (no Lean declaration).

**Checks.**

- *AdicSpace_structurePresheafEtale_positive* (computation) — Pulling back the characteristic section of sheet 0 by the three-cycle gives value 1 on sheet 2.
- *AdicSpace_structurePresheafEtale_degenerate* (degenerate) — Sections on the empty étale object form the zero ring.
- *AdicSpace_structurePresheafEtale_negative* (non-example) — The same pullback has value 0 on sheet 0, excluding the identity pullback on the three factors.

**`AdicSpace.structureSheafEtale`.** The étale structure sheaf satisfies descent and its section restriction rotates the ordered Q₂ factors on a split cubic cover. README only (no Lean declaration).

**Checks.**

- *AdicSpace_structureSheafEtale_positive* (computation) — Pulling back the characteristic section of sheet 0 by the three-cycle gives value 1 on sheet 2.
- *AdicSpace_structureSheafEtale_degenerate* (degenerate) — Sections on the empty étale object form the zero ring.
- *AdicSpace_structureSheafEtale_negative* (non-example) — The same pullback has value 0 on sheet 0, excluding the identity pullback on the three factors.

**`AdicSpace.IsBasic`.** Basic étale objects are finite étale over rational affinoid charts; the source remains quasi-compact. README only (no Lean declaration).

**Checks.**

- *AdicSpace_IsBasic_positive* (computation) — The two-sheeted finite étale Q₂ cover is basic.
- *AdicSpace_IsBasic_degenerate* (degenerate) — The zero-sheeted finite étale cover is basic.
- *AdicSpace_IsBasic_negative* (non-example) — The open unit disc is étale but non-quasi-compact, so it is not basic.

**`AdicSpace.opensToSmallEtale`.** The functor sends an open to its actual open restriction over the base. README only (no Lean declaration).

**Checks.**

- *AdicSpace_opensToSmallEtale_positive* (computation) — The radius-1/2 rational disc maps onto precisely its named rational subset.
- *AdicSpace_opensToSmallEtale_degenerate* (degenerate) — The empty open gives the empty étale object.
- *AdicSpace_opensToSmallEtale_negative* (non-example) — The open unit disc object excludes the boundary Gauss point, ruling out the constant terminal functor.

**`AdicSpace.smallFiniteEtale.map`.** Base change preserves the actual finite étale source and the action of its morphisms. README only (no Lean declaration).

**Checks.**

- *AdicSpace_smallFiniteEtale_map_positive* (computation) — Identity base change of the split two-sheeted cover has exactly two points.
- *AdicSpace_smallFiniteEtale_map_degenerate* (degenerate) — Identity base change of the empty finite cover stays empty.
- *AdicSpace_smallFiniteEtale_map_negative* (non-example) — Base change separates the three-cycle from its inverse; a functor collapsing arrows is excluded.

**`AdicSpace.smallEtaleBasisTopology`.** Basic étale covering sieves include the split two-to-one cover and exclude the empty cover of a nonempty point. README only (no Lean declaration).

**Checks.**

- *AdicSpace_smallEtaleBasisTopology_positive* (computation) — The two-to-one split cover generates a covering sieve.
- *AdicSpace_smallEtaleBasisTopology_degenerate* (degenerate) — The empty sieve covers the empty object.
- *AdicSpace_smallEtaleBasisTopology_negative* (non-example) — The empty-to-one-sheeted map generates no covering sieve; the topology is not indiscrete.

**`AdicSpace.etaleSheafPushforward`.** Along the split two-sheeted projection, direct image evaluates a sheaf on both source sheets: a constant n-element sheaf has n² global sections. README only (no Lean declaration).

**Checks.**

- *AdicSpace_etaleSheafPushforward_positive* — Along the two-sheeted projection, direct image of the constant two-element sheaf has four global sections.
- *AdicSpace_etaleSheafPushforward_degenerate* — Direct image of the empty constant sheaf along this projection has no global sections.
- *AdicSpace_etaleSheafPushforward_negative* — Direct image of the constant three-element sheaf has nine global sections, excluding an operation that retains only one sheet.

**`AdicSpace.etaleSheafPullback`.** Along the split two-sheeted projection, inverse image restricts the base constant sheaf to each sheet; evaluating on the labelled second sheet gives n sections. README only (no Lean declaration).

**Checks.**

- *AdicSpace_etaleSheafPullback_positive* — Inverse image along the two-sheeted projection, evaluated on the labelled second sheet, has two sections for the constant two-element sheaf.
- *AdicSpace_etaleSheafPullback_degenerate* — The same inverse image of the empty constant sheaf has no sections on the second sheet.
- *AdicSpace_etaleSheafPullback_negative* — The inverse image of the constant three-element sheaf has three sections on the second sheet, excluding the nine-section direct-image computation.

**`AdicSpace.smallFiniteEtale.toSmallEtale_forget`.** Forgetting finiteness preserves the labelled source and its structural map. README only (no Lean declaration).

**Checks.**

- *AdicSpace_smallFiniteEtale_toSmallEtale_forget_sheet_one_source* (computation) — The comparison fixes sheet 1 of the split three-sheeted source.

- *AdicSpace_smallFiniteEtale_toSmallEtale_forget_one_sheet_source* (degenerate) — On the one-sheeted cover the unique point is fixed.

- *AdicSpace_smallFiniteEtale_toSmallEtale_forget_no_rotation* (non-example) — A comparison rotating the three components is excluded.

**`AdicSpace.smallEtale.sliceEquiv`.** The étale slice equivalence retains the selected component of an object over the split cubic cover. README only (no Lean declaration).

**Checks.**

- *AdicSpace_smallEtale_sliceEquiv_sheet_one_arrow* (computation) — The one-point object entering component 1 still maps exactly to component 1 in the slice.

- *AdicSpace_smallEtale_sliceEquiv_empty_object* (degenerate) — The empty object remains empty in the slice.

- *AdicSpace_smallEtale_sliceEquiv_no_rotation* (non-example) — Rotating the slice structural arrow to component 2 violates the comparison.

**`AdicSpace.smallFiniteEtale.sliceEquiv`.** The finite étale slice equivalence preserves the labelled finite source over a component and the empty finite source. README only (no Lean declaration).

**Checks.**

- *AdicSpace_smallFiniteEtale_sliceEquiv_sheet_one_arrow* (computation) — The one-point object entering component 1 still maps exactly to component 1 in the slice.

- *AdicSpace_smallFiniteEtale_sliceEquiv_empty_object* (degenerate) — The empty object remains empty in the slice.

- *AdicSpace_smallFiniteEtale_sliceEquiv_no_rotation* (non-example) — Rotating the slice structural arrow to component 2 violates the comparison.

**`AdicSpace.smallEtale.mapComp`.** Associativity of base change retains the labelled projection to the original étale object. README only (no Lean declaration).

**Checks.**

- *AdicSpace_smallEtale_mapComp_sheet_one_projection* (computation) — The comparison carries a point over sheet 1 to a point over sheet 1 through the two projections.

- *AdicSpace_smallEtale_mapComp_identity_projections* (degenerate) — For two identity base changes, the component labelled 0 still projects to component 0.

- *AdicSpace_smallEtale_mapComp_no_rotation* (non-example) — Rotating the final projection to sheet 2 violates associativity over the original object.

**`AdicSpace.smallFiniteEtale.affinoidEquiv`.** The contravariant equivalence retains the factors and algebra automorphisms of a split finite étale algebra. README only (no Lean declaration).

**Checks.**

- *AdicSpace_smallFiniteEtale_affinoidEquiv_split_quadratic* (computation) — The algebra Q₂ × Q₂ gives an adic space with two points.
- *AdicSpace_smallFiniteEtale_affinoidEquiv_zero_algebra* (degenerate) — The zero algebra gives the empty space.
- *AdicSpace_smallFiniteEtale_affinoidEquiv_cycle_not_square* (non-example) — The cyclic permutation of the three factors and its square induce different geometric arrows.

**The étale structure presheaf on opens.** On the full open of the split three-point Q₂ space, the comparison of the étale structure presheaf `AdicSpace.structurePresheafEtale` with the original one on opens returns the original labelled idempotent section. Pullback to the corresponding étale open supplies the input independently of the comparison. Huber 1996, §1.1, pp. 37–39.

**Checks.**

- *AdicSpace_structurePresheafEtale_onOpens_component_one_section* (computation) — The idempotent supported on component 1 is returned as that idempotent.

- *AdicSpace_structurePresheafEtale_onOpens_identity_component_zero* (degenerate) — For the identity open immersion, the component-0 idempotent remains component 0.

- *AdicSpace_structurePresheafEtale_onOpens_not_component_two* (non-example) — The component-1 section does not become the component-2 section.

**The integral étale structure presheaf on opens.** On the full open of the split three-point Q₂ space, the comparison of the integral étale structure presheaf `AdicSpace.structurePresheafPlusEtale` with the original one on opens returns the original labelled idempotent section. Each section is integral, so this checks the integral comparison itself. Huber 1996, §1.1, pp. 37–39.

**Checks.**

- *AdicSpace_structurePresheafPlusEtale_onOpens_component_one_section* (computation) — The idempotent supported on component 1 is returned as that idempotent.

- *AdicSpace_structurePresheafPlusEtale_onOpens_identity_component_zero* (degenerate) — For the identity open immersion, the component-0 idempotent remains component 0.

- *AdicSpace_structurePresheafPlusEtale_onOpens_not_component_two* (non-example) — The component-1 section does not become the component-2 section.

### A1.7 geometric points, enough points, strict localisations

**Étale maps to `Spa(C, C⁺)` split near the closed point.** (*geometric-point-etale-split*) Let
`C` be an algebraically closed field complete for a nontrivial nonarchimedean absolute value,
`C⁺ ⊆ C` an open and bounded valuation subring (`C°° ⊆ C⁺ ⊆ O_C`, of any rank `≥ 1`) and
`S = Spa(C, C⁺)`. Prove: (i) `|S|` is the chain, under specialisation, of the valuation rings
between `C⁺` and `O_C`; it has a unique closed point `s` (corresponding to `C⁺`), every point
specialises to `s`, the only open subset containing `s` is `S` ([ECD] §7, proof of Lem. 7.5,
p. 31), `S` is quasi-compact and connected, and `(C, C⁺)` is strongly sheafy; (ii) every finite
étale `S' → S` is isomorphic over `S` to a finite disjoint union of copies of `S`: finite étale
`C`-algebras are products `Cⁿ` (Mathlib `Algebra.FormallyEtale.equivPiOfIsSepClosed`), with plus
ring `(C⁺)ⁿ`; (iii) for every étale `g : V → S` and every `v ∈ V` with `g(v) = s` there is a
section `σ : S → V` of `g` with `σ(s) = v`, and `σ` is an open immersion ([ECD] §7, proof of
Prop. 7.16, p. 36); hence every jointly surjective family of étale maps to `S` contains a member
with a section, which is why global sections on `S_ét` define a point ([ECD] §14, proof of
Prop. 14.3, p. 82); (iv) non-example: if `C⁺ ≠ O_C`, the space `V` obtained by gluing two copies
of `S` along the open subset `S ∖ {s}` is étale over `S` and has two sections, but is not a
disjoint union of open subspaces of copies of `S` — étale `S`-spaces split near the closed point,
not globally; (v) if `K` is a complete nonarchimedean field admitting a nontrivial finite separable
extension `L/K`, and `K⁺ ⊆ K` is an open bounded valuation subring, then with `L⁺` the
integral closure of `K⁺` gives a nonsplit finite étale covering `Spa(L, L⁺) → Spa(K, K⁺)`
([ECD] §7, proof of Prop. 7.16, p. 36). *Needs:* *etale-morphism*; *finite-etale-morphism*;
*finite-etale-affinoid-algebra*; *finite-etale-local-to-global*; *strongly-sheafy-huber-pair*;
Mathlib `Algebra.FormallyEtale.equivPiOfIsSepClosed`, `IsAlgClosed`, `ValuationSubring`; Tau
Ceti `ValuationSpectrum.spa`. README only (no Lean declaration).

**Checks.**

- *split_rank_one* (degenerate) — for `C⁺ = O_C`, `S` is a single point and every étale `S`-space
  is a disjoint union of copies of `S`.
- *split_rank_two_glued* (non-example) — for `C⁺` of rank 2 (points `η`, `s`), the glued space of
  (iv) has points `η`, `s₁`, `s₂` and two sections through `s₁`, `s₂`; it is étale over `S` but
  not split globally.
- *split_plus_unbounded* (non-example) — `C⁺ = C` is an open valuation subring but not bounded,
  `(C, C)` is not a Huber pair and `Spa(C, C) = ∅` (a valuation `≤ 1` on all of `C` has
  `v(ϖ) = 1` and is not continuous); so a geometric point needs `C⁺ ⊆ O_C`, and `C⁺ = O_C` is the
  rank-one case.

**Geometric points and their fibre functors.** (*etale-site-and-geometric-points*) Let `X` be
locally strongly sheafy analytic with its étale site `X_ét` (*etale-site*; on locally noetherian
`X` Huber's `X_et`, [H96] §2.1, p. 109). Define `AdicSpace.GeometricPoint X`: a morphism
`ξ : Spa(C, C⁺) → X` with `C` an algebraically closed field complete for a nontrivial
nonarchimedean absolute value and `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank
([H96] §2.5, Def. 2.5.1, p. 130, which takes `C` separably closed; this roadmap takes `C`
algebraically closed, which is what [ECD] §14 uses; the strict localisation is Def. 2.5.11,
p. 134; [ECD] §14, Proposition 14.3, p. 82, gives the perfectoid/diamond
version, and §19, p. 109, retains higher-rank points),
with `AdicSpace.GeometricPoint.support` `x = ξ(s)`, `s` the closed point. Prove
`AdicSpace.exists_geometricPoint`: for every `x ∈ X` there is a geometric point with support `x`
— here and below `k(x)^` is the completed residue field of `x`: the completion of Tau Ceti's
valued residue field `k(x)` (`ValuationSpectrum.residueFieldValuation`, the residue field of the
support of `x` carrying the valuation induced by `x`, topologised by that valuation), with
`k(x)^+ ⊆ k(x)^` the closure of its valuation ring, so that `(k(x)^, k(x)^+)` is a complete
affinoid field pair receiving a canonical morphism from `(A, A⁺)` for `x ∈ Spa(A, A⁺)`; take `C`
the completion of an algebraic closure of `k(x)^` and `C⁺` a valuation ring of `C` with
`C⁺ ∩ k(x)^ = k(x)^+` (extension of valuation rings; `C⁺` is then open and bounded). Define
`AdicSpace.GeometricPoint.fiber`, `ε_ξ : smallEtale X ⥤ Type`, `U ↦ Hom_X(Spa(C, C⁺), U)` (the
lifts of `ξ` to `U`), and prove `AdicSpace.GeometricPoint.point`: `ε_ξ` is a point of `X_ét` in
Mathlib's sense (`GrothendieckTopology.Point`) — its category of elements, the étale
neighbourhoods of `ξ`, is cofiltered and essentially small, and coverings go to jointly surjective
families. Use Mathlib `CategoryTheory.GrothendieckTopology.Point.sheafFiber`, `F_ξ := (point ξ).sheafFiber F = colim F(U)`
over étale neighbourhoods `(U, ū)`, exact and commuting with colimits. Prove
`AdicSpace.GeometricPoint.comp` (for `g : X' → X` of locally strongly sheafy spaces and a
geometric point `ξ'` of `X'`, `g ∘ ξ'` is a geometric point of `X`),
the fibre comparison `ε_{g∘ξ'} ≅ g^* ⋙ ε_{ξ'}` for the base change `g^*` of
*etale-site*, the stalk comparison `(g^{-1}F)_{ξ'} ≅ F_{g∘ξ'}`,
natural in `F`, and that the image of `ξ`
consists of generisations of `x` ([PH] §3, footnote to Prop. 3.13, p. 18).
The conservativity of geometric points is *etale-enough-points* and
`AdicSpace.strictLocalization` is *strict-localisation*. Higher rank is essential:
rank-one geometric points do not detect sheaves supported on points of higher rank (the
rigid-analytic analogue with rank-one points only is [dJvP] §3.3, p. 27, and its insufficiency
[dJvP] §3.3, p. 29). *Needs:* *etale-site*; *geometric-point-etale-split*; *etale-base-change*;
*etale-diagonal*; *strongly-sheafy-huber-pair*; Mathlib
`CategoryTheory.GrothendieckTopology.Point`, `CategoryTheory.GrothendieckTopology.Point.sheafFiber`,
`CategoryTheory.Functor.sheafPullback`, `IsAlgClosed`, `ValuationSubring`,
`AlgebraicGeometry.Scheme.pointSmallEtale`.

Lean: `AdicSpace.GeometricPoint` (a morphism to `X` from the spectrum of an AdicSpacesPartII
affinoid whose ring is an algebraically closed Tate field and whose plus ring is a valuation
subring) and `AdicSpace.exists_geometricPoint` (for analytic `X`, every point is the image of the
closed point of a geometric point); the rest is README only.

**Checks.**

- *test_field_rank_two* (computation) — for `X = Spa(K, K⁺)` with `K⁺` of rank 2 (points `η`
  generic, `s` closed), the support of a geometric point `Spa(C, O_C) → X` is `η`; a geometric
  point with support `s` has `C⁺` of rank `≥ 2`.
- *test_rank_one_not_conservative* (non-example) — for `X = Spa(K, K⁺)` with `K⁺` of rank 2,
  `j : {η} → X` and `F = coker(j_!ℤ → ℤ)`: `F_ξ = 0` for every geometric point
  `ξ = Spa(C, O_C) → X`, but `F ≠ 0` — its stalk at a geometric point supported at `s` is `ℤ`.
- *test_identity* (degenerate) — for `X = Spa(C, C⁺)` and `ξ = id`, the fibre functor is
  `Γ(X, −)`, a point by *geometric-point-etale-split*, and `(point ξ).sheafFiber F ≅ F(X)`.
- *test_fet_fiber* (compatibility) — for `X = Spa(K, K⁺)` and `ξ` from `K ⊆ C`, the restriction
  of `ε_ξ` to `X_fét ≃ FÉt(K)^op` is Mathlib's `CommAlgCat.FiniteEtale.fiber K C`; for locally
  noetherian `X`, `ε_ξ` is Huber's fibre functor at `ξ` ([H96] Ch. 2, introduction, p. 108).
- *test_image_generizations* (characterisation) — the image of `ξ` is contained in the set of
  generisations of its support.

**The étale site has enough points.** (*etale-enough-points*) Let `X` be locally strongly sheafy
analytic and, for each `x ∈ X`, `ξ_x` a geometric point with support `x` (any choice). Prove
that the family `(ε_{ξ_x})_{x ∈ X}` is
conservative (Mathlib `ObjectProperty.IsConservativeFamilyOfPoints`, built with
`IsConservativeFamilyOfPoints.mk'`), by the argument of [ECD] §14, proof of Prop. 14.3, p. 82
(coverings are surjective families, [H96] §2.1, p. 109); hence `X_ét` has enough points
(`GrothendieckTopology.HasEnoughPoints`), a morphism of sheaves (of sets, abelian groups, modules)
on `X_ét` is an isomorphism, monomorphism or epimorphism iff it is so on every stalk `F_{ξ_x}`,
and a section over `U ∈ X_ét` is zero iff its germs at all geometric points of `U` vanish. The
family of rank-one geometric points is not conservative when `X` has points of higher rank
([dJvP] §3.3, p. 29). The classification of all points of the topos (every point isomorphic to
some `ε_ξ`, [H96] Ch. 2) is not claimed, and no later target uses it. *Needs:*
*etale-site-and-geometric-points*; *geometric-point-etale-split*; *etale-base-change*;
*etale-site*; Mathlib `CategoryTheory.ObjectProperty.IsConservativeFamilyOfPoints`,
`CategoryTheory.ObjectProperty.IsConservativeFamilyOfPoints.mk'`,
`CategoryTheory.ObjectProperty.IsConservativeFamilyOfPoints.jointlyReflectIsomorphisms`,
`CategoryTheory.GrothendieckTopology.HasEnoughPoints`,
`AlgebraicGeometry.Scheme.isConservative_pointSmallEtale`. README only (no Lean declaration).

**Checks.**

- *enoughPoints_coker_closed_point* — for `X = Spa(K, K⁺)` with `K⁺` of rank 2 and
  `F = coker(j_!ℤ → ℤ)`, `j` the inclusion of the generic point, `F ≠ 0` is detected at the
  geometric point supported at the closed point and at no rank-one geometric point.
- *enoughPoints_huber* (compatibility) — for locally noetherian `X` this is the conservativity of
  Huber's fibre functors ([H96] Ch. 2, introduction, p. 108).

**The strict localisation at a geometric point.** (*strict-localisation*) Let `X` be locally
strongly sheafy analytic and `ξ : Spa(C, C⁺) → X` a geometric point with support `x` (`C⁺` of any
rank). Define `AdicSpace.GeometricPoint.Neighbourhood`, the category `N(ξ)` of étale
neighbourhoods `(U, ū)` — `U ∈ X_ét` with a lift `ū` of `ξ`, the category of elements
`(fiber ξ).Elements` — and use Mathlib `CategoryTheory.GrothendieckTopology.Point.isCofiltered` (`N(ξ)`
is cofiltered and essentially small; [dJvP] §3.3, p. 28). Define `AdicSpace.strictLocalization`,
the cofiltered diagram `N(ξ) ⥤ smallEtale X`, `(U, ū) ↦ U`, regarded as a pro-object `X(ξ) =
lim U` of `X_ét` with its compatible lift `ξ̃` of `ξ`. This is the pointed strict-localisation
pro-object of `Pro(X_ét)`, initial among pro-objects of `X_ét` equipped with a compatible lift of
`ξ`; no assertion is made that it belongs to the pro-étale subcategory `X_proét` of
*pro-etale-site-corrected* (it need not: see *test_shrinking_disc_not_proetale*), and the initial pro-étale
diamond of [FS] §IV.2.1, p. 114 is a separate, diamond-theoretic comparison in the scope of
DiamondsAndVStacks D6; `AdicSpace.strictLocalization.eval`,
`F(X(ξ)) := colim_{N(ξ)ᵒᵖ} F(U)` for a presheaf `F`, with
Mathlib `CategoryTheory.GrothendieckTopology.Point.sheafFiber` (`F(X(ξ)) ≅ (point ξ).sheafFiber F` for
sheaves) and `AdicSpace.strictLocalization.openNeighbourhood_final` (opens of `U` containing
`ū(s)` are cofinal: they contain the image of `ū`, which consists of generisations of `ū(s)`);
`AdicSpace.GeometricPoint.localRing`, `O_{X_ét, ξ} := O(X(ξ)) = colim O_U(U) = colim O_{U, ū(s)}`
(the local rings `O_{U,u}` of [KL I] §2.4, Lem. 2.4.17(a), p. 43) and `O⁺_{X_ét, ξ}` from
*etale-structure-sheaf*, with the ring map
`O_{X_ét, ξ} → C` induced by the lifts and the valuation `v_ξ` pulled back from `C⁺`;
`AdicSpace.strictLocalization.space`, `|X(ξ)| := lim_{N(ξ)} |U|` with the map from
`|Spa(C, C⁺)|` induced by the lifts; and `AdicSpace.strictLocalization.map`: `g : X' → X` and a
geometric point `ξ'` of `X'` induce `N(g ∘ ξ') → N(ξ')` by base change, hence
`X'(ξ') → X(g ∘ ξ')` and `O_{X_ét, gξ'} → O_{X'_ét, ξ'}`. The structure of `X(ξ)` for analytic `X`
is *strict-localisation-analytic*. *Needs:* *etale-site-and-geometric-points*; *etale-site*;
*etale-structure-sheaf*; *etale-base-change*; Mathlib `CategoryTheory.Functor.Elements`,
`CategoryTheory.IsCofiltered`, `CategoryTheory.GrothendieckTopology.Point.sheafFiber`. README only (no Lean declaration).

**Checks.**

- *test_algClosed* (degenerate) — for `X = Spa(C, C⁺)` and `ξ = id`, `N(ξ)` has the initial
  object `(X, id)`, so `X(ξ) = X`, `F(X(ξ)) = F(X)` and `O_{X_ét, ξ} = C`: the strict
  localisation of `Spa(C, C⁺)` is `Spa(C, C⁺)` itself.
- *test_field* (computation) — for `X = Spa(K, K⁺)` and `ξ` from `K ⊆ C`, `O_{X_ét, ξ}` is the
  separable closure `K^sep` of `K` in `C`.
- *test_constant_stalk* (computation) — for the constant sheaf `Λ` on `X_ét`, `Λ(X(ξ)) = Λ`.
- *test_higher_rank_point* (non-example) — for `X = Spa(K, K⁺)` with `K⁺` of rank 2 and `ξ`
  supported at the closed point, `|X(ξ)|` has two points (the images of `η` and `s`); taking
  `C⁺ = O_C` instead gives a geometric point supported at `η` whose strict localisation has one
  point.
- *test_stalk_eq_sheafFiber* (compatibility) — for a sheaf `F`, `F(X(ξ)) ≅ (point ξ).sheafFiber F`
  (Mathlib `GrothendieckTopology.Point.sheafFiber`).
- *test_shrinking_disc_not_proetale* (non-example) — for the closed disc `X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`
  and `ξ` a geometric point at `T = 0`, every rational subdisc `U_n = {|T| ≤ |p|^n}` is a pointed
  étale neighbourhood, so the image of `|Spa(C, C⁺)| → lim_{N(ξ)} |U|` in `|X|` lies in
  `⋂_n U_n = {T = 0}` (a continuous valuation with `|T| ≠ 0` has `|p|^n < |T|` for `n` large) and is
  the single point `T = 0`, which is not open in `|X|`. The pro-object `X(ξ)` is thus a valid
  pointed pro-object with a well-defined stalk functor, but it is not an object of `X_proét`
  (whose objects have open image in `|X|`, *pro-etale-maps-open*); the Checks *test_algClosed* and the
  split finite covers of *etale-site-and-geometric-points* do not separate the two categories.

**Strict localisations of analytic adic spaces.** (*strict-localisation-analytic*) Let `X` be
locally noetherian analytic, `ξ : Spa(C, C⁺) → X` a geometric point with support `x` (`C⁺` of
any rank) and `X(ξ)` its strict localisation. Prove: (a) `O_{X_ét, ξ}` is a strictly henselian
local ring — a filtered colimit, along local homomorphisms, of the henselian local rings
`O_{U, ū(s)}` ([KL I] §2.4, Lem. 2.4.17(a), p. 43; finite étale algebras over a henselian local
ring are determined by the residue field, [KL I] §1.2, Thm. 1.2.8, p. 15) — with separably
closed residue field `κ(ξ)`, and the closure `C_ξ ⊆ C` of the image of `κ(ξ)` is an algebraically
closed complete field ([dJvP] §3.3, p. 27); (b) with `C_ξ⁺ := C⁺ ∩ C_ξ`, the map
`|Spa(C, C⁺)| → |X(ξ)| = lim_{N(ξ)} |U|` factors through a homeomorphism
`|Spa(C_ξ, C_ξ⁺)| ≅ |X(ξ)|` — on underlying spaces, the strict localisation of an analytic adic
space is the spectrum of the algebraically closed affinoid field `(C_ξ, C_ξ⁺)`; this is a
homeomorphism of spaces, not an identification of the uncompleted ring `O_{X_ét, ξ}` with `C_ξ`
([H96] §2.5, Prop. 2.5.13(i), pp. 134–135; [FS] §IV.2.1,
p. 114, in the diamond setting; the cofinality step in the rigid case, [dJvP] §3.3, p. 28) — so
`F_ξ` depends only on `x` and on the valuation ring `C_ξ⁺`, and `ξ` factors through
`Spa(C_ξ, C_ξ⁺)`; on points, `|X(ξ)|` is the set of generisations of `x` in `X` (the open
neighbourhoods of `ū(s)` in each `U` are cofinal and their intersection is the chain of
generisations of `ū(s)`, which an étale `U → X` maps bijectively onto the chain of
generisations of `x`: for the finite separable extension `k(x)^ → k(ū(s))^` the overrings of
`k(ū(s))^+` are the localisations of the integral closure of `k(x)^+` at primes under one
maximal ideal, which contract injectively and surjectively, by incomparability and going up,
to the overrings of `k(x)^+`), so when `rank(x)` is finite, `|X(ξ)|` has `rank(x)` points, matching the rank of `C_ξ⁺`,
which equals that of `k(x)^+`; (c) for `X = Spa(K, K⁺)` with `K` a complete nonarchimedean field,
`O_{X_ét, ξ} = K^sep`, the separable closure of `K` in `C` (the uncompleted ring of sections of
the pro-object), and, on underlying spaces, `|X(ξ)| ≅ |Spa((K^sep)^, C⁺ ∩ (K^sep)^)|`, the
spectrum of the completed geometric field, as in (b); the three objects — the pro-object `X(ξ)`,
its ring `O_{X_ét, ξ}`, and the affinoid field `(C_ξ, C_ξ⁺)` whose spectrum realises `|X(ξ)|` —
are kept distinct, and `X(ξ)` is never written as an equality with that spectrum. For arbitrary `K⁺` the stalk functor on `X_ét` is the colimit of
*strict-localisation* over all pointed étale neighbourhoods, which include pointed rational opens
inside finite étale covers `Spa(L, L⁺)` (`L⁺` the integral closure of `K⁺` in `L`,
*finite-etale-morphism*); it retains the prolongation of the valuation selected by `ξ` and
its decomposition subgroup `D_x` (A1.15, *proetale-fibre-morphism-of-topoi*), and no action of
the full group
`Gal(K^sep/K)` on the stalk of an arbitrary étale sheaf is asserted. If `K⁺ = K°`, the pointed
finite separable extensions `Spa(L, L°)`, `L ⊆ K^sep`, are cofinal in `N(ξ)` (every étale
neighbourhood of a rank-one point contains a finite étale one, *etale-local-open-finite-etale-factorisation*), and the
stalk functor is `F ↦ colim F(Spa(L, L°))` with its continuous `Gal(K^sep/K)`-action; on the
finite étale site of `Spa(K, K⁺)` this description holds for every `K⁺`
(A1.6, *finite-etale-site*, and A1.8, *finite-etale-galois-category*). For locally noetherian
analytic spaces, (b) is [H96] §2.5,
Prop. 2.5.13(i), pp. 134–135, with the cofinality and limit description in Lem. 2.5.12, p. 134.
The standing locally noetherian hypothesis is the hypothesis of Huber’s category of analytic
adic spaces in this statement. The evaluation map `O_{X_ét, ξ} → C` is fixed on each
pointed étale neighbourhood, and its kernel is the maximal ideal. The henselian property is (a),
`strictLocalization.exists_completedField` states the algebraic closedness, closure-of-image,
plus-ring and compatible homeomorphism clauses of (b), and (c)'s ring comparison is taken inside
the chosen geometric field. *Needs:* *strict-localisation*; *geometric-point-etale-split*;
*finite-etale-affinoid-algebra*; *etale-site-and-geometric-points*;
*finite-etale-approximation*; Mathlib `HenselianLocalRing`, `IsAlgClosed`. README only (no Lean declaration).

**Checks.**

- *strictLocalRing_quadratic_root* — take the chosen root `r = √2` in `ℚ̄₂`, the cover
  `Spa(ℚ₂(r), O_{ℚ₂(r)})`, and its lift from `Spa(ℂ₂, O_{ℂ₂})` induced by the fixed inclusion.
  The germ of `r` maps to that chosen root in `ℂ₂`.
- *strictLocalRing_quadratic_translate* — the same lift sends the germ of `r + 1` to `r + 1`.
- *strictLocalRing_quadratic_not_conjugate* — the germ of `r` is not sent to `−r`;
  composing evaluation with a field automorphism exchanging the quadratic roots fails this Check.
- *strictLocalization_padic* — for `X = Spa(ℚ_p, ℤ_p)` and `ξ` from `ℚ_p ⊆ ℂ_p`,
  `O_{X_ét, ξ} = ℚ̄_p` (the uncompleted stalk) and `|X(ξ)| ≅ |Spa(ℂ_p, O_{ℂ_p})|`, a one-point space;
  `ℂ_p` is the ring of global sections of that spectrum, not the stalk.
- *strictLocalization_rank_two* — for `X = Spa(K, K⁺)` with `K⁺` of rank 2 and `ξ` supported at
  the closed point, `|X(ξ)| ≅ |Spa(C_ξ, C_ξ⁺)|` with `C_ξ⁺` of rank 2 (two points).
- *strictLocalization_gauss_rank_two* (computation) — for the closed disc `X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`,
  `x` the rank-2 specialisation of the Gauss point `η` in the direction `|T| < 1⁺` (`k(x)^+ =
  {f ∈ O_{k(η)^} : f̄ ∈ 𝔽_p[T̄]_{(T̄)}}`) and `ξ` supported at `x`: `|X(ξ)| = {η, x}`, two points;
  `k(x)^+` is not henselian (its residual valuation on `𝔽_p(T̄)` is the `T̄`-adic one, and
  `X² − X − T̄` splits in `𝔽_p⟦T̄⟧` but not in `𝔽_p(T̄)`), so the rank-2 valuation has two
  extensions to the unramified quadratic extension `k(x)^(α)`, `α² − α = T`: the stalk functor
  still sees one chain, because a lift `ū` of `ξ` to `Spa(L, L⁺)` picks one of them.
- *strictLocalization_rank_two_branch* (non-example) — with `K = k(x)^`, `K⁺ = k(x)^+` of rank 2
  as in the previous Check, `L = K(α)`, `α² − α = T`, `L⁺` the integral closure of `K⁺` in `L`,
  and `W ⊊ Spa(L, L⁺)` the rational open `{|α| ≤ |T|}` containing the prolongation `V_1`
  selected by `ξ` but not `V_2` (the branch of *fibreTopos_rank_two_not_equivariant*): the
  represented étale sheaf `h_W` has `(h_W)_ξ ≠ ∅`, since `ξ` lifts to `W`, while for every
  finite separable `M ⊇ K` with `M⁺` the integral closure of `K⁺`, an `X`-map
  `Spa(M, M⁺) → W ⊆ Spa(L, L⁺)` gives a `K`-embedding `L → M` whose map on finite étale field
  spectra is surjective (every prolongation to `L` extends to `M`), so it cannot land in the
  proper open `W`, and `colim_M h_W(Spa(M, M⁺)) = ∅`; finite products of fields do not help,
  since each nonempty factor would have to land in `W`. Hence the whole finite covers are not
  cofinal among pointed étale neighbourhoods at higher rank, and the field-extension formula of
  (c) needs `K⁺ = K°`. Contrast: for `K⁺ = K°` (rank one) `k(x)^+` is henselian, the valuation
  has one prolongation to each `L`, and `W = Spa(L, L°)`.


**`AdicSpace.GeometricPoint.support`.** Support uses the image of the distinguished closed point, retaining the component chosen by the geometric map. README only (no Lean declaration).

**Checks.**

- *AdicSpace_GeometricPoint_support_positive* (computation) — A geometric point entering sheet 1 of the split three-sheeted spectrum has support at point 1.
- *AdicSpace_GeometricPoint_support_degenerate* (degenerate) — The geometric point with identity map is supported at its chosen closed point.
- *AdicSpace_GeometricPoint_support_negative* (non-example) — The support is not point 0; choosing an unrelated component fails.

**`AdicSpace.GeometricPoint.point`.** The site point uses geometric lifts and their action, not just the topological fibre. README only (no Lean declaration).

**Checks.**

- *AdicSpace_GeometricPoint_point_positive* (computation) — The site point gives two lifts on the split two-sheeted cover.
- *AdicSpace_GeometricPoint_point_degenerate* (degenerate) — The empty étale cover has no lifts.
- *AdicSpace_GeometricPoint_point_negative* (non-example) — The three-cycle moves each lift; a point functor with trivial action is excluded.

**`AdicSpace.GeometricPoint.comp`.** Composition postcomposes the actual geometric map and retains the complete field and its closed point. README only (no Lean declaration).

**Checks.**

- *AdicSpace_GeometricPoint_comp_positive* (computation) — Composing with section 1 puts the support on sheet 1.
- *AdicSpace_GeometricPoint_comp_degenerate* (degenerate) — Composition with the identity preserves the whole geometric point.
- *AdicSpace_GeometricPoint_comp_negative* (non-example) — Postcomposition by the three-cycle sends sheet 0 to sheet 1, excluding inverse composition.

**`AdicSpace.GeometricPoint.fieldMap`.** The ring map to the geometric field evaluates sections along the specified geometric point. README only (no Lean declaration).

**Checks.**

- *AdicSpace_GeometricPoint_fieldMap_positive* (computation) — At sheet 1, the characteristic idempotent of sheet 1 has value 1.
- *AdicSpace_GeometricPoint_fieldMap_degenerate* (degenerate) — For the identity geometric point, the map on every scalar is the identity.
- *AdicSpace_GeometricPoint_fieldMap_negative* (non-example) — At sheet 1, the characteristic idempotent of sheet 0 is not 1, excluding evaluation at the wrong component.

**`AdicSpace.strictLocalization`.** The pointed-neighbourhood diagram retains the whole étale neighbourhood and forgets only its chosen lift. README only (no Lean declaration).

**Checks.**

- *AdicSpace_strictLocalization_positive* (computation) — The neighbourhood consisting of the split two-sheeted cover with lift to sheet 0 has two underlying points.
- *AdicSpace_strictLocalization_degenerate* (degenerate) — The identity neighbourhood over Spa(Q₂,Z₂) has exactly one point.
- *AdicSpace_strictLocalization_negative* (non-example) — A three-sheeted neighbourhood with lift to sheet 1 remains three-sheeted. Replacing each neighbourhood by its selected component fails this check.

**`AdicSpace.strictLocalization.space`.** The topological strict localization is the subspace of compatible tuples in the product of all pointed étale neighbourhoods. Its coordinate projections are the evaluation maps. Huber 1996, §2.5, especially 2.5.9–2.5.13, pp. 132–135. README only (no Lean declaration).

**Checks.**

- *AdicSpace_strictLocalization_space_positive* (computation) — The three-sheeted neighbourhood pointed on sheet 1 has a compatible tuple whose coordinate is point 1.
- *AdicSpace_strictLocalization_space_degenerate* (degenerate) — Every tuple has the unique base point as its identity-neighbourhood coordinate.
- *AdicSpace_strictLocalization_space_negative* (non-example) — No compatible tuple has coordinate 0 in the same neighbourhood pointed on sheet 1. Taking the unrestricted product would incorrectly admit it.

**`AdicSpace.strictLocalization.map`.** The map of strict localizations projects a compatible tuple through pointed base change. Its characterizing equation on geometric points is `map_fromPoint`. README only (no Lean declaration).

**Checks.**

- *AdicSpace_strictLocalization_map_positive* (computation) — Postcomposing sheet 0 with the geometric three-cycle gives coordinate 1 at the identity neighbourhood of the target.
- *AdicSpace_strictLocalization_map_degenerate* (degenerate) — The identity base map preserves the unique Q₂ coordinate.
- *AdicSpace_strictLocalization_map_negative* (non-example) — The same composite does not give coordinate 2; using the inverse three-cycle violates the map convention.

**Stalk pullback and strict local rings.**
The stalk comparison identifies the fibre of the pullback sheaf at `ξ` with the
fibre of the original sheaf at `ξ.comp g`. Its germ equation sends the
pullback of a section, formed using the adjunction unit and the pulled-back lift, to that
section's original germ. `GeometricPoint.strictLocalRingComparison` compares the étale local
ring with the colimit of the ordinary local rings at the lifted supports. Its equation
`strictLocalRingComparison_germ` sends a global germ first to its ordinary local germ and then
to the colimit. These are ring comparisons before completion; they do not identify a separable
closure with its completion. Huber 1996, 2.5.3–2.5.4, p. 131; 2.5.9, p. 132; the proof of
2.5.10 and 2.5.11–2.5.13, pp. 134–135. README only (no Lean declaration).

**Open pointed neighbourhoods.**
`strictLocalization.OpenNeighbourhood` consists of an étale pointed neighbourhood and an open
subset containing the image of the distinguished closed point. It ranges over every étale
neighbourhood. `restrictNeighbourhood_spec` identifies its image with the actual open
restriction, preserving the structure map and the lifted geometric point.
`strictLocalization.openNeighbourhood_final` asserts finality of the opposite forgetful
functor, the orientation used for colimits of sections and local rings. This does not assert
that opens inside one fixed étale neighbourhood suffice for all étale germs. Huber 1996,
2.5.9, p. 132, and the proof of 2.5.10, p. 134. README only (no Lean declaration).

**The pullback-stalk comparison at a concrete point.** The pullback-stalk comparison for `AdicSpace.GeometricPoint` respects labelled germs and the pullback adjunction unit, at the concrete C₂ point.

**Checks.**

- *AdicSpace_GeometricPoint_stalk_pullback_iso_label_one_germ* (computation) — The germ of label 1 in the constant three-element sheaf stays label 1 under identity pullback at C₂.
- *AdicSpace_GeometricPoint_stalk_pullback_iso_singleton_germ* (degenerate) — The unique germ of the one-element sheaf is preserved.
- *AdicSpace_GeometricPoint_stalk_pullback_iso_not_label_two* (non-example) — That germ is not label 2; a permuted stalk comparison fails.

### A1.8 the finite étale fundamental group

**The finite étale site of a connected space is a Galois category.**
(*finite-etale-galois-category*) Let `X` be a nonempty connected (`|X|` connected) locally
strongly sheafy analytic adic space and `ξ : Spa(C, C⁺) → X` a geometric point. Prove that
`F_ξ : X_fét → FintypeCat`, `Y ↦ Hom_X(Spa(C, C⁺), Y)` — the finite set of components of
`Y ×_X Spa(C, C⁺)`, a finite disjoint union of copies of `Spa(C, C⁺)` by
*geometric-point-etale-split* (ii) — is a fibre functor (Mathlib
`PreGaloisCategory.FiberFunctor`) and `X_fét` is a Galois category (Mathlib `GaloisCategory`;
open and closed subsets of affinoids come from idempotents, [KL I] §2.6, Prop. 2.6.4, p. 54, which
gives connectedness and summands). Hence `π₁(X, ξ) := Aut(F_ξ)` is a profinite group and `F_ξ`
induces an equivalence of `X_fét` with finite sets with continuous `π₁(X, ξ)`-action (Mathlib
`PreGaloisCategory.functorToContAction`); for two geometric points the fibre functors are
isomorphic, so the groups are isomorphic up to inner automorphism ([PH] §3, before Def. 3.4,
p. 13, the statement for connected locally noetherian `X` with a geometric base point, with the
connectedness hypothesis at [PH] §3, p. 13; [Berkeley] Lecture 16, §16.3, p. 143, for connected
diamonds). For `X = Spa(K, K⁺)`, `K` a complete nonarchimedean field, `π₁(X, ξ) ≅ Gal(K^sep/K)`
for every open and bounded valuation subring `K⁺`. *Needs:* *finite-etale-site*;
*geometric-point-etale-split*; *etale-site-and-geometric-points*; *etale-diagonal*;
*finite-etale-local-to-global*; Mathlib `CategoryTheory.GaloisCategory`,
`CategoryTheory.PreGaloisCategory.FiberFunctor`,
`CategoryTheory.PreGaloisCategory.functorToContAction`, `CommAlgCat.FiniteEtale`. README only (no Lean declaration).

**Checks.**

- *pi1_field* — for `X = Spa(K, K⁺)`, `π₁(X, ξ) = Gal(K^sep/K)` and `X_fét ≃` finite continuous
  `Gal(K^sep/K)`-sets, independently of `K⁺`.
- *pi1_algClosed* (degenerate) — for `X = Spa(C, C⁺)` with `C` algebraically closed, `π₁(X, ξ)` is
  trivial.
- *pi1_annulus_kummer* — for the annulus `X` over `ℂ_p`, the Kummer coverings `Sⁿ = T` are
  connected Galois objects with group `μ_n` (étale since `n ∈ ℂ_p^×`, including `p ∣ n`), so
  `π₁(X, ξ)` surjects onto `lim_n μ_n = ℤ̂(1)`.
- *Huber.pi1_disc_nontrivial_negative* (non-example) — the closed disc `X = Spa(ℂ_p⟨T⟩, O_{ℂ_p}⟨T⟩)` does not have
  trivial `π₁`: `Y = Spa(B)`, `B = ℂ_p⟨T⟩[S]/(Sᵖ − (1 + pT))`, is finite étale of degree `p`
  (`1 + pT` is a unit, `p ∈ ℂ_p^×`) and connected — `1 + pT` has no `p`-th root in `ℂ_p⟨T⟩`
  since `v_p(binom(1/p, n) pⁿ) = −(n − s_p(n))/(p − 1) → −∞`, so the binomial series diverges on
  `|T| = 1`, and `ℂ_p⟨T⟩` is a principal ideal domain in which `1 + pT` is a unit, so a root in
  the fraction field would lie in the ring — hence `B` is a domain and `Y → X` is Galois with
  group `μ_p ≅ ℤ/p`, a quotient of `π₁(X, ξ)`. In characteristic `p` the Artin–Schreier cover
  `Sᵖ − S = T` of `Spa(K⟨T⟩)` is a connected finite étale cover of degree `p` likewise.
  When formalised, the check tests the absence of a root in `ℚ_p⟨T⟩`.
- *Huber.pi1_disc_nontrivial_positive* (positive control, `p` odd) —
  `1 + p³T` has a `p`-th root in `ℚ_p⟨T⟩`; the corresponding Kummer cover over `ℂ_p` splits.


**`AdicSpace.smallFiniteEtale.fiberFunctor`.** The finite fibre is the set of geometric lifts, with the induced action on them. README only (no Lean declaration).

**Checks.**

- *AdicSpace_smallFiniteEtale_fiberFunctor_positive* (computation) — At any geometric point of Spa(Q₂,Z₂), the split two-sheeted cover has fibre of cardinality 2.
- *AdicSpace_smallFiniteEtale_fiberFunctor_degenerate* (degenerate) — The empty cover has empty geometric fibre.
- *AdicSpace_smallFiniteEtale_fiberFunctor_negative* (non-example) — The three-cycle fixes no geometric lift, excluding the trivial action on the fibre.

**`AdicSpace.smallFiniteEtale.fiberFunctor_underlying`.** The comparison forgets finite-set packaging while preserving actual maps from the geometric point. README only (no Lean declaration).

**Checks.**

- *AdicSpace_smallFiniteEtale_fiberFunctor_underlying_component_one_lift* (computation) — The lift selected by component 1 becomes the actual geometric map into that component.
- *AdicSpace_smallFiniteEtale_fiberFunctor_underlying_unique_structural_lift* (degenerate) — The one-sheeted fibre becomes the unique structural lift.
- *AdicSpace_smallFiniteEtale_fiberFunctor_underlying_components_differ* (non-example) — The lift into component 1 differs from the lift into component 2.

### A1.9 the Kedlaya–Liu site of an arbitrary analytic adic space

**The Kedlaya–Liu étale and finite étale sites.** (*etale-site-generalized*) Let `X` be an analytic
adic space, not necessarily locally strongly sheafy, so that the finite étale covers of its
affinoids are not known to be adic spaces ([KL I] §8.2, Def. 8.2.3, p. 159, and Rem. 8.2.18, p.
162: sheafiness is not known to be stable under finite étale extension). Regard `X` as an analytic
Yoneda-adic space (*generalized-adic-presentation*: sheaves on complete Huber pairs for the
rational topology glued from the sheafified spectra `Spa^Y(A, A⁺)`; on complete Tate pairs these
are Kedlaya–Liu's preadic spaces and Scholze–Weinstein's adic spaces; AdicSpaces' adic spaces form
a full subcategory, *adic-spaces-in-yoneda-adic-spaces*; open immersions, fibre products and `|−|`
are *yoneda-adic-open-immersions*, *yoneda-adic-fibre-products* and
*maps-from-adic-spaces-to-yoneda-affinoids*). Define `YonedaAdicSpace.IsFiniteEtale` and
`YonedaAdicSpace.IsEtaleLocalDescription` for morphisms of analytic Yoneda-adic spaces by the local
descriptions of *finite-etale-morphism* and *etale-morphism* with `Spa^Y` in place of `Spa` ([KL I]
§8.2, Def. 8.2.16, p. 162), and `YonedaAdicSpace.smallEtale`, `YonedaAdicSpace.smallEtaleTopology`,
`YonedaAdicSpace.smallFiniteEtale`: Kedlaya–Liu's sites `X_ét^Y`, `X_fét^Y` with objects all étale
(resp. finite étale) `Y → X` of analytic Yoneda-adic spaces and coverings the set-theoretic
(jointly surjective) families ([KL I] §8.2, Def. 8.2.19 and the definition of the small sites after
it, pp. 162–163). Prove: (i) fibre products exist, the two classes are stable under base change and
composition (`YonedaAdicSpace.IsEtaleLocalDescription.baseChange`,
`YonedaAdicSpace.IsEtaleLocalDescription.comp`), and the covering families form pretopologies ([KL
I] §8.2, Rem. 8.2.5, p. 160; Lem. 8.2.17(c), p. 162); (ii) `YonedaAdicSpace.finiteEtaleEquiv`: for
every complete Tate pair `(A, A⁺)`, sheafy or not, the functor sending a finite étale algebra `B`
to `Spa^Y(B, B⁺)` gives `FÉt(A)^op ≃ Spa^Y(A, A⁺)_fét^Y` ([KL I] §8.2, Lem. 8.2.17(a), p. 162). Its
inverse uses finite étale descent; identification with global sections requires sheafiness of the
affinoids involved; (iii) `YonedaAdicSpace.smallEtale_equiv_of_isLocallyStronglySheafy`: if `X` is
locally strongly sheafy, every object of `X_ét^Y` is (the image of) an adic space and `X_ét^Y ≃
X_ét`, `X_fét^Y ≃ X_fét` (*etale-site*, *finite-etale-site*); (iv)
`YonedaAdicSpace.hasEnoughPoints_smallEtaleTopology`: geometric points define points of `X_ét^Y`
and form a conservative family, by the proofs of *etale-site-and-geometric-points* and
*etale-enough-points* (only `Spa(C, C⁺)`, which is sheafy, is used, together with: every point of
`|U| = Spa(B, B⁺)` of an affinoid object is the support of a geometric point `Spa(C, C⁺) → Spa^Y(B,
B⁺)`, given by a morphism of pairs `(B, B⁺) → (k(x)^, k(x)^+) → (C, C⁺)`,
*maps-from-adic-spaces-to-yoneda-affinoids*, and coverings are the jointly surjective families on
`|−|`); (v) this is the site `Y_ét`, `Y_fét` of [ECD] §15, Lem. 15.6, p. 91, for an analytic adic
space `Y` over `ℤ_p`, the right-hand side of the comparison `Y^◇_ét ≅ Y_ét` owned by
DiamondsAndVStacks layer D6, in the generality [ECD] §15, after Def. 15.5, p. 91, allows ("adic
spaces as defined in [SW13, Section 2.1]"). *Needs:* *generalized-adic-presentation*;
*yoneda-adic-open-immersions*; *yoneda-adic-fibre-products*; *adic-spaces-in-yoneda-adic-spaces*;
*maps-from-adic-spaces-to-yoneda-affinoids*; *finite-etale-affinoid-algebra*;
*finite-etale-rational-descent*; *affinoid-system-approximation*; *finite-etale-approximation*;
*finite-etale-morphism*; *etale-morphism*; *etale-base-change*; *etale-composition*; *etale-site*;
*finite-etale-site*; *finite-etale-strongly-sheafy*; *geometric-point-etale-split*;
*etale-site-and-geometric-points*; *etale-enough-points*; Mathlib
`CategoryTheory.MorphismProperty.Over`, `CategoryTheory.Pretopology`,
`CategoryTheory.Pretopology.toGrothendieck`, `CategoryTheory.GrothendieckTopology`,
`CategoryTheory.Functor.IsContinuous`, `CategoryTheory.Functor.sheafPushforwardContinuous`,
`CategoryTheory.Functor.sheafPullback`. README only (no Lean declaration).

**Checks.**

- *test_affinoid* (characterisation) — for every complete Tate pair `(A, A⁺)`,
  `YonedaAdicSpace.smallFiniteEtale (spaY A) ≌ (CommAlgCat.FiniteEtale A)ᵒᵖ`, with no sheafiness
  hypothesis; for `A` sheafy but not known to be strongly sheafy and `B ∈ FÉt(A)`,
  `Spa^Y(B, B⁺) → Spa^Y(A, A⁺)` is an object of `X_fét^Y` although `Spa(B, B⁺)` is not known to
  be an adic space ([KL I] §8.2, Rem. 8.2.18, p. 162).
- *test_eq_adic* (compatibility) — for `X` locally strongly sheafy, `AdicSpace.smallEtale X ⥤
  YonedaAdicSpace.smallEtale X^Y` is an equivalence of sites; for `X` locally noetherian,
  `X_ét^Y` is Huber's `X_et`.
- *test_opens* (degenerate) — open immersions into `X` are objects of `X_ét^Y` and open coverings
  are coverings.
- *test_adic_objects_insufficient* (non-example) — for `A` sheafy but not known to be strongly
  sheafy, the adic-space objects of `X_ét^Y` are not known to be closed under fibre products
  ([KL I] §8.2, Rem. 8.2.5, p. 160, and Rem. 8.2.18, p. 162): restricting to adic objects is not a
  substitute.

### A1.10 pro-étale morphisms and the underlying space

The second half of the layer builds Scholze's pro-étale site `X_proét` of a locally noetherian
analytic adic space with the class of coverings restricted as in his erratum, the projection
`ν : X_proét → X_ét`, the pro-finite-étale site and the sites of profinite `G`-sets, and the
structural results of [PH] §3 that the consumers use; then the Yoneda-adic spaces of ECD §15,
sheaves on the opposite category of complete Huber pairs glued from the sheafified representables
`Spa^Y(A, A⁺)`, with the proof that the sheafy adic spaces of the Foundations of adic spaces
roadmap (AdicSpaces) form a full subcategory. It owns no morphism theory: étale, finite étale,
smooth and finite morphisms, fibre products and completed tensor products come from
AdicSpacesPartII layer R0, and the small étale and finite étale sites, geometric points and the
étale slice site from A1.1–A1.9. It proves no derived comparison: Scholze's Lemma 3.16 for
`i > 0`, Corollary 3.17 and Proposition 3.7(iii) belong to the étale-cohomology roadmaps, the
affinoid perfectoid basis of [PH] §4 to the `A_inf`-cohomology roadmap, and the pro-étale and
v-topologies on perfectoid spaces of ECD §8 are a different site, DiamondsAndVStacks layer D2's.

Throughout A1.10–A1.15, `X` is a locally noetherian analytic adic space (AdicSpacesPartII layer
R0's locally noetherian adic spaces with every point analytic): locally `Spa(A, A⁺)` with `A` a
complete strongly noetherian Tate ring. Scholze allows all locally noetherian adic spaces and
schemes; the analytic case is the one the consumers use. `X_ét` and `X_fét` are the small étale
and finite étale sites (*etale-site*, *finite-etale-site*); every `X`-morphism between étale
`X`-spaces is étale (see *etale-cancellation*). `pro-X_ét := Pro(X_ét)` is the pro-category of
DiamondsAndVStacks layer D0 (the dual of Mathlib's `Ind`) with small cofiltered index categories;
objects are written `U = lim U_i`, and

```text
Hom(lim_i U_i, lim_j V_j) = lim_j colim_i Hom_X(U_i, V_j),     |U| := lim_i |U_i|.
```

`c : X_ét → pro-X_ét` is the fully faithful embedding by constant systems and `X` is final.
*Surjective* means surjective on underlying spaces `|·|`. A universe is fixed; `X_ét` is locally
small and sheaves are small-set-valued. The covering conventions are these: the corrected topology
includes the covering of a disjoint union by its summands; the transfinite steps of a covering are
pulled back from the étale category `X_ét`; the field-extension slice theorem is stated for spaces
of finite type over the base field.

**Étale, finite étale and pro-étale morphisms of pro-objects, and the underlying space.**
(*pro-etale-morphism*) Let `X`, `X_ét`, `X_fét` and `pro-X_ét` be as above; cofiltered limits exist
in `pro-X_ét` (a double system is combined into a single one), the underlying space
`|U| := lim_i |U_i|` (limit of topological spaces) is independent of the presentation, and
`U ↦ |U|` is a functor `pro-X_ét → Top` ([PH] §3, Def. 3.1 and Prop. 3.2, p. 13; [PH] §3, before
Def. 3.9, p. 15). A morphism `f : U → V` of `pro-X_ét` is *étale* (resp. *finite étale*) if there
are a morphism `V → V_0` with `V_0 ∈ X_ét` and an étale (resp.
finite étale, *finite-etale-morphism*)
`U_0 → V_0` of `X_ét` with `U ≅ U_0 ×_{V_0} V` over `V`, where for a presentation `V = lim_j V_j`
through which `V → V_0` factors, `U_0 ×_{V_0} V := lim_j U_0 ×_{V_0} V_j` (fibre products in
`X_ét`); *surjective* if `|f|` is; and *pro-étale* if there are a small cofiltered category `K`
and an isomorphism `U ≅ lim_{k∈K} U_k` over `V` with every `U_k → V` étale and every transition
`U_k → U_{k'}` finite étale and surjective for `k ≥ k' ≥ k_0` (a *pro-étale presentation*). `U` is
pro-étale over `X` if `U → X` is ([PH] §3, Def. 3.9, p. 15). In `AdicSpace.ProEtale`, define
`ProEt` (the category `pro-X_ét` with its final object `X`), `ProEt.const` (the fully faithful
`c : X_ét ⥤ pro-X_ét`), `ProEt.space` (`U ↦ |U|`, with `|c U| = |U|` and
`|lim_k U_k| = lim_k |U_k|`), the classes `IsEtale`, `IsFiniteEtale` (with `IsFiniteEtale.isEtale`),
`IsProEtale` with its structure `ProEtalePresentation`, and `IsSurjective`; prove
`ProEt.hom_const_equiv` (`Hom(lim_i U_i, c V) ≃ colim_i Hom_X(U_i, V)` for `V ∈ X_ét`, [PH] §3,
Prop. 3.2, p. 13; the constant-target case of the Hom formula of DiamondsAndVStacks layer D0's
pro-categories, *pro-category-of-finite-t0-spaces*), `IsEtale.isProEtale` (the constant
presentation) and `isEtale_const` (`c(g)` is
étale for every `g` of `X_ét`, and finite étale iff `g` is). *Needs:* *etale-site*,
*finite-etale-site*, *finite-etale-morphism*, *etale-cancellation*; AdicSpacesPartII layer R0;
DiamondsAndVStacks layer D0 (pro-categories); Mathlib `CategoryTheory.Ind`,
`CategoryTheory.IsCofiltered`. README only (no Lean declaration).

**Checks.**

- *ProEt_const_etale* (degenerate) — for `U ∈ X_ét`, `c(U) → X` is étale and pro-étale,
  finite étale exactly when `U → X` is, and `|c(U)| = |U|`; for `U = X` it is the identity of the
  final object.
- *ProEtale.test_kummer_tower_classical* and `ProEtale.test_kummer_tower_gauss` (computations) — for `K` complete nonarchimedean of characteristic
  `0`, `X = Spa(K⟨T^{±1}⟩, K°⟨T^{±1}⟩)` and `X_n = Spa(K⟨T^{±1/p^n}⟩, K°⟨T^{±1/p^n}⟩)`, the Kummer
  tower `X̃ := lim_n X_n → X` is pro-étale with transitions finite étale surjective of degree `p`
  (`Sᵖ = T` is étale since `p ∈ K^×`); for `K ⊇ μ_{p^∞}` (for instance `K = ℂ_p`) the fibre of
  `|X̃| → |X|` over the classical point `T = 1` is `lim_n μ_{pⁿ}(K) ≅ ℤ_p`. Over the Gauss point
  `η` the fibre is a single point for every `K`: the residue extension
  `k(T^{1/pⁿ})/k(T)` of the Gauss valuation has degree `pⁿ`, so `f = pⁿ`
  and the Gauss valuation has a unique extension. This residue extension is purely inseparable
  when `char k = p`, and separable when `char k ≠ p` (check *kummer_gauss_prime_to_residue*); at `n = 0`
  it is the identity (check *kummer_gauss_level_zero*). The classical Check tests splitting and
  the number of distinct roots at finite level; the Gauss Check tests irreducibility and
  inseparability over `𝔽_p(T)` for `n > 0`.
  For `K = ℚ_p` the fibre over `T = 1` is
  `lim_n (ℤ/pⁿ)/(ℤ/pⁿ)^× = {0} ∪ {p^k ℤ_p^× : k ≥ 0}`, countable, not `ℤ_p`.
- *ProEtale.test_kummer_not_etale* (non-example) — `X̃ → X` is not étale: `|X̃| = lim |X_n|` is
  quasi-compact, and a quasi-compact étale `U_0 ×_{V_0} X → X` (locally a rational subset of a
  finite étale cover, finitely many pieces) has finite fibres, while for `K ⊇ μ_{p^∞}` the fibre
  of `X̃ → X` over `T = 1` is `ℤ_p`; the non-quasi-compact étale map `⊔_ℕ X → X` has infinite
  fibres, which is why quasi-compactness is part of the argument.
- *ProEtale.test_hom_const* (characterisation) — `Hom(X̃, c(V)) = colim_n Hom_X(X_n, V)` for
  `V ∈ X_ét`; a morphism from `X̃` to an étale `X`-space factors through some `X_n`.

The seven parts of Scholze's Lemma 3.10 are separate statements, all for `X` locally noetherian
analytic with the morphism classes of *pro-etale-morphism*.

**Base change.** (*pro-etale-base-change*) Let `U → V` be étale (resp. finite étale, resp.
pro-étale) and `W → V` arbitrary in `pro-X_ét`. Then `U ×_V W` exists in `pro-X_ét`, the projection
`U ×_V W → W` is étale (resp. finite étale, resp. pro-étale), and `|U ×_V W| → |U| ×_{|V|} |W|` is
surjective with nonempty compact fibres (inverse limits of nonempty finite sets are nonempty; at
finite level this is the surjectivity on points of *etale-base-change*); so
the base change of a surjective map of any of the three classes is surjective, and fibre products
commute with cofiltered limits in each variable ([PH] §3, Lem. 3.10(i) and its proof, pp. 15–16).
*Needs:* *pro-etale-morphism*, *etale-morphisms-local-description-and-comparison*,
*finite-etale-morphism*; AdicSpacesPartII layer R0 (fibre products); DiamondsAndVStacks layer D0. README only (no Lean declaration).

**Checks.**

- *baseChange_kummer_rational* — for `U → V` the Kummer tower and `W → V` a rational subset of
  the torus, `U ×_V W` is the Kummer tower over `W`.
- *baseChange_geometric_fibre* — at a rank-one point `x` of `X` the geometric-fibre functor turns
  base change into fibre products of profinite sets.

**Composition of étale maps.** (*pro-etale-etale-composition*) If `U → V → W` are étale (resp.
finite étale) in `pro-X_ét`, so is `U → W`: writing `V = V_0 ×_{W_0} W` and `U = U_0 ×_{V_0} V`
with `V_0 → W_0`, `U_0 → V_0` in `X_ét`, there is a stage `W_i` of `W` with `U ≅ U_i ×_{W_i} W`
for an étale (resp. finite étale) `U_i → W_i` of `X_ét` ([PH] §3, Lem. 3.10(ii), p. 15). A
rational subset of a finite étale cover of `X`, pulled back to a pro-étale object, is étale over it
(`etaleComp_rational_of_finiteEtale`). *Needs:* *pro-etale-morphism*, *pro-etale-base-change*,
*finite-etale-morphism*; AdicSpacesPartII layer R0; DiamondsAndVStacks layer D0. README only (no Lean declaration).

**Quasi-compact opens are étale subobjects.** (*pro-etale-quasicompact-opens*) Let `U ∈ pro-X_ét`
and `W ⊂ |U|` a quasi-compact open. (a) There is an étale `V → U`, the pullback `V = V_i ×_{U_i} U`
of an open subspace `V_i ⊂ U_i` at a stage `i` of a presentation `U = lim U_i` large enough that
`W` is the preimage of a quasi-compact open `W_i ⊂ |U_i|` (for quasi-compact `U` this uses that
`|U|` is a cofiltered limit of spectral spaces along spectral maps), with `|V| → |U|` a
homeomorphism onto `W`; if `U = lim U_i` is a pro-étale
presentation, so is `V = lim V_i ×_{U_i} U_j`.
(b) If `U ∈ X_proét`, then `V ∈ X_proét`, `V → U` is a monomorphism, and `V' → U` in `X_proét`
factors uniquely through `V` iff `|V'| → |U|` has image in `W`; so `W ↦ V` identifies quasi-compact
opens of `|U|` with the subobjects they represent, compatibly with finite intersections
([PH] §3, Lem. 3.10(iii), p. 15). *Needs:* *pro-etale-morphism*, *pro-etale-base-change*;
DiamondsAndVStacks layer D0 (cofiltered limits of spectral spaces); AdicSpacesPartII layer R0. README only (no Lean declaration).

**Checks.**

- *qcOpen_of_space* — for `U = X` and `W` a quasi-compact open of `|X|`, `V` is the open subspace
  `W` with `c(W) → X`.
- *qcOpen_kummer* — for `X̃` and `W` the preimage of a rational subset of `X_n`, `V = X̃ ×_{X_n} W`.

**Pro-étale maps are open.** (*pro-etale-maps-open*) Every pro-étale `U → V` of `pro-X_ét`
induces an open map `|U| → |V|`; in particular every étale and finite étale morphism is open,
and so is every finite-étale tower once *finite-etale-tower-is-pro-etale* (A1.11) shows towers
are pro-étale. The proof uses only earlier targets: for a pro-étale presentation `U = lim U_k`
over `V`, the opens of `|U| = lim |U_k|` are unions of preimages of opens `W_k ⊆ |U_k|`, the maps
`|U| → |U_k|` are surjective for `k ≥ k_0` (*pro-etale-base-change*: fibres are inverse limits of
nonempty finite sets), so the image of the preimage of `W_k` in `|V|` is the image of `W_k` under
the étale map `U_k → V`, open by *etale-open-map* (Huber's Proposition 1.7.8 as AdicSpacesPartII
layer R0 states it) ([PH] §3, Lem. 3.10(iv) and its proof, pp. 15–16). The Kummer tower `X̃ → X` is
open, and the image of the preimage of a rational subset
of `X_n` is the image of that rational subset under `X_n → X`. *Needs:*
*pro-etale-morphism*, *pro-etale-base-change*, *etale-open-map*; AdicSpacesPartII layer R0. README only (no Lean declaration).

**Surjective étale maps come from a finite stage.** (*pro-etale-surjective-etale-descent*) Let
`V ∈ X_proét` and `U → V` surjective étale (resp. surjective finite étale) in `pro-X_ét`. Then there
are `V → V_0` with `V_0 ∈ X_ét` and a surjective étale (resp. surjective finite étale) `U_0 → V_0`
of `X_ét` with `U ≅ U_0 ×_{V_0} V`; `V_0` may be taken a stage `V_i` of a pro-étale presentation of
`V` ([PH] §3, Lem. 3.10(v), p. 15). A surjective finite étale map to `X̃` comes from a surjective
finite étale map to some `X_n` (check *surjDescent_kummer*). *Needs:* *pro-etale-morphism*,
*pro-etale-base-change*; AdicSpacesPartII layer R0. README only (no Lean declaration).

**Composition of pro-étale maps.** (*pro-etale-composition*) Let `U → V → W` be pro-étale with
`W ∈ X_proét`. Then `U, V ∈ X_proét` and `U → W` is pro-étale. Every pro-étale `U → V` factors as
`U → U_0 → V` with `U → U_0` a cofiltered inverse limit of finite étale surjections and `U_0 → V`
étale ([PH] §3, Lem. 3.10(vi) and its proof, pp. 16–17). The Kummer tower over a finite étale cover
`Y → X` of the torus is pro-étale over `X` (check *proEtale_comp_kummer*). *Needs:* *pro-etale-morphism*,
*pro-etale-base-change*, *pro-etale-surjective-etale-descent*; DiamondsAndVStacks layer D0. README only (no Lean declaration).

**Finite limits.** (*pro-etale-finite-limits*) `X_proét` has all finite limits, constructed as
follows; only (i) and (ii) are limits of `pro-X_ét`. (i) The final object is `X`. (ii) For a
pro-étale `U → V` and any `W → V` in `X_proét`, the fibre product `U ×_V W` of `pro-X_ét`
(*pro-etale-base-change*) lies in `X_proét` (*pro-etale-composition*) and is the fibre product
there; this covers binary products `U ×_X W` and base change along étale, finite étale and
pro-étale morphisms, in particular along members of coverings. (iii) For `f, g : U ⇉ W` in
`X_proét`, let `Z ⊂ |U|` be the set of points whose image under `(f, g)` lies in the image of the
diagonal of `W`. The equalizer is a subobject `E → U` with `|E| → |U|` a homeomorphism onto `Z`,
and a morphism `T → U` of `X_proét` factors through `E` iff its composites with `f` and `g` agree.
To build it, take a pro-étale presentation `W = lim W_j` with finite étale transitions beyond
`j_0` and replace `U` by its étale subobject `(f, g)^{-1}(W ×_{W_{j_0}} W)`; there `Z` is an
intersection of open and closed subsets pulled back from stages of `U` (diagonals of finite étale
maps are open and closed, *etale-diagonal*), and `E = lim E_i` with `E_i ⊂ U_i` the image of `Z`.
The locally finite number of connected components (see *etale-locally-finitely-many-components*)
makes the `E_i` open and closed for large `i`, with finite étale surjective transitions; this is
the nonformal part of the lemma ([PH] §3, Lem. 3.10(vii) and its proof, pp. 16–17; [PH] §3, after
Lem. 3.10, p. 17). The levelwise equalizer in `pro-X_ét` can have nonempty stages and empty
underlying space, and then it is not an object of `X_proét`: the inclusion `X_proét ⊂ pro-X_ét`
preserves the final object and the fibre products of (ii) but not equalizers. *Needs:*
*pro-etale-base-change*, *pro-etale-composition*, *etale-locally-finitely-many-components*,
*etale-diagonal*; AdicSpacesPartII layer R0. README only (no Lean declaration).

**Checks.**

- *equalizer_deck_empty* (computation) — for `K ⊇ μ_{p^∞}` and a nontrivial deck transformation
  `σ` of the Kummer tower `X̃`, the equalizer of `id` and `σ` is empty: from some stage `n` on,
  `(id, σ_n)` lands in a summand of `X_n ×_X X_n = ⊔_{ζ ∈ μ_{pⁿ}} X_n` other than the diagonal
  one, so `Z = ∅`; here the levelwise equalizer of `pro-X_ét` is empty as well.
- *finiteLimits_constant* (degenerate) — for `U, W ∈ X_ét`, `c` sends the product `U ×_X W` and
  the equalizer of `f, g : U ⇉ W` in `X_ét` (an open subspace of `U`, *etale-diagonal*) to the
  corresponding limits of `X_proét`, which are also those of `pro-X_ét`.
- *finiteLimits_equalizer_not_ambient* (non-example) — over `X = S = Spa(ℚ₂, ℤ₂)` let
  `U = lim_n U_n`, `U_n = ⊔_{m ≥ 1} ⊔_{a ∈ {0,1}^n} S`, the transitions forgetting the last digit
  of `a` and keeping `m` (finite étale surjective of degree two), and let `g_n` flip digit `m` of
  `a` on the summands with `m ≤ n` and fix those with `m > n`; the `g_n` are compatible and give
  `g : U → U`. The levelwise equalizer of `id` and `g` has stages `⊔_{m > n} ⊔_a S`, all nonempty,
  so by the Hom formula it has no map to `c(∅)` and is not initial; its underlying space is empty,
  since a compatible point keeps one index `m` and the stage `m` has no summand of index `m`. A
  pro-étale presentation with empty limit space has empty stages beyond its threshold (fibres of
  the late projections are inverse limits of nonempty finite sets), so this object is not in
  `X_proét`. The equalizer in `X_proét` is `c(∅)`, as `(id, g)` misses the diagonal at every
  point.

**Étale spaces have locally finitely many components.**
(*etale-locally-finitely-many-components*) For `Y ∈ X_ét`, every point of `Y` has an open affinoid
neighbourhood `Spa(B, B⁺)` with `B` a complete strongly noetherian Tate ring, hence sheafy. Prove
the clopen correspondence: for every complete Hausdorff Tate pair
`(A, A⁺)`, noetherian or not, the open and closed subsets of `Spa(A, A⁺)` are exactly the loci
`{v | v(e) ≠ 0}` of the idempotents `e ∈ A` ([KL I] §2.6, Prop. 2.6.4, p. 54, for every adic
Banach ring; [KL I] §2.5, Cor. 2.5.21, p. 52, for affinoid algebras); and the finiteness of
components: if `A` is moreover strongly noetherian, `Spa(A, A⁺)` has
finitely many connected components, each open and closed and cut out by a primitive idempotent
(`A` is noetherian, so it has finitely many idempotents, and the connected components of the
spectral space `Spa(A, A⁺)` are intersections of open and closed subsets). So every quasi-compact
`Y ∈ X_ét` is a finite disjoint union of connected open and closed subspaces, and every étale
object is locally connected in Scholze's sense ([PH] §3, before Def. 3.3, p. 13; [PH] §3, after
Lem. 3.10, p. 17). For `Y = X_n` in the Kummer tower there is one component; for `Y = X ⊔ X` there
are two (check *components_kummer_and_coprod*). *Needs:* AdicSpacesPartII layer R0 (locally noetherian
spaces, finite étale algebras over noetherian affinoids); the Foundations of adic spaces roadmap
(AdicSpaces), layer 4 (sheafiness of strongly noetherian Tate pairs); Tau Ceti
`ValuationSpectrum.spa`, `Huber.IsStronglyNoetherian`. README only (no Lean declaration).

**Checks.**

- *spa_idempotent_locus_units* (unfolding; two-term convention) — the idempotent `1` cuts out all of
  `Spa(A, A⁺)` and `0` the empty set: the locus of `e` is `v(e) ≠ 0`, not `v(e) = 0`.
- *components_padic_field* (degenerate) — for `A = ℚ_p`, `Spa(ℚ_p, ℤ_p)` is one point, with the
  two idempotents `0` and `1`; for the zero ring `Spa` is empty, with no components.
  *components_padic_field_zero* states `IsEmpty` for both its spectrum and its component
  space, as well as component cardinality zero, for every subsingleton Huber ring.
- *components_product* (computation) — for `A = ℚ_p × ℚ_p` with `A⁺ = ℤ_p × ℤ_p`,
  the spectrum has exactly two points and two connected components. When formalised, the
  instance uses the fixture `SplitChecks.pair 2`, the two-coordinate function ring over `ℚ₂`.
  The idempotent `(1,0)` cuts out a nonempty proper clopen equal to the image of the
  first evaluation map on spectra. This tests the nontrivial case of the clopen
  correspondence.
- *components_product_complement* — in that same pair, `(0,1)` cuts out the nonempty
  clopen image of the second evaluation map. It is the complement of the first
  locus and is different from it, fixing which component each idempotent selects.
- *components_product_exhaustion* — the only clopens of that spectrum are the empty
  set, the two coordinate loci, and the whole spectrum; the only idempotents are
  `0`, `(1,0)`, `(0,1)`, and `1`. Both sides of the clopen correspondence are exhausted.
- *components_nonnoetherian* (non-example) — for `A = C(K, ℚ_p)` with the supremum norm, `K` the
  Cantor set, the idempotents are the indicator functions of the open and closed subsets of `K`, so
  `Spa(A, A°)` has infinitely many connected components: the strongly noetherian hypothesis of
  the finiteness of components cannot be dropped, while the clopen correspondence still
  applies.


**`AdicSpace.ProEtale.ProEt.const`.** The constant embedding retains finite étale objects and their actual morphisms. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtale_ProEt_const_positive* (computation) — There are exactly two arrows from the constant one-sheeted Q₂ cover to the constant two-sheeted cover.
- *AdicSpace_ProEtale_ProEt_const_degenerate* (degenerate) — There is exactly one arrow from the constant empty object to the constant two-sheeted cover.
- *AdicSpace_ProEtale_ProEt_const_negative* (non-example) — The constant embedding separates the three-cycle from its inverse; collapsing all arrows fails this check.

**`AdicSpace.ProEtale.ProEt.space`.** Underlying spaces of pro-objects compute inverse limits, and recover the points of a constant object. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtale_ProEt_space_positive* (computation) — The constant split two-sheeted Q₂ cover has exactly two points.
- *AdicSpace_ProEtale_ProEt_space_degenerate* (degenerate) — The constant empty object has empty space.
- *AdicSpace_ProEtale_ProEt_space_negative* (non-example) — The three-cycle moves every point of the constant three-sheeted cover; the constant-map functor fails this check.

**`AdicSpace.ProEtale.IsSurjective`.** Surjectivity tests the whole underlying space of a pro-object. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtale_IsSurjective_positive* (computation) — The three-cycle on the constant split Q₂ cover is surjective.
- *AdicSpace_ProEtale_IsSurjective_degenerate* (degenerate) — The identity on the empty constant object is surjective.
- *AdicSpace_ProEtale_IsSurjective_negative* (non-example) — The proper open unit disc misses the boundary Gauss point, excluding a predicate that accepts all étale maps.

**`AdicSpace.ProEtale.ProEt.homDiagram`.** The diagram uses arrows from each source stage into the specified target, with contravariant transition maps. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtale_ProEt_homDiagram_positive* (computation) — For the one-stage one-sheeted cover and two-sheeted target, the stage has exactly two maps.
- *AdicSpace_ProEtale_ProEt_homDiagram_degenerate* (degenerate) — An empty source stage contributes exactly one map, not an empty set.
- *AdicSpace_ProEtale_ProEt_homDiagram_negative* (non-example) — A two-sheeted source and two-sheeted target give four maps, excluding a diagram that forgets the source.

**`AdicSpace.ProEtale.ProEt.hom_const_equiv`.** The Hom equivalence sends a finite-stage arrow to its actual composite with the presentation projection. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtale_ProEt_hom_const_equiv_positive* (computation) — For the one-stage three-sheeted cover, the three-cycle generator is the constant three-cycle.
- *AdicSpace_ProEtale_ProEt_hom_const_equiv_degenerate* (degenerate) — The identity generator in the constant diagram gives the identity pro-arrow.
- *AdicSpace_ProEtale_ProEt_hom_const_equiv_negative* (non-example) — The generator is not sent to the inverse three-cycle; reversing the Hom convention fails.

**`AdicSpace.ProEtale.ProEt.final`.** The final pro-object is the constant identity of the base, so its space varies with the base. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtale_ProEt_final_positive* (computation) — Over Spa(Q₂,Z₂), the final object has one point.
- *AdicSpace_ProEtale_ProEt_final_degenerate* (degenerate) — Over the empty base the final object has empty space.
- *AdicSpace_ProEtale_ProEt_final_negative* (non-example) — Over the two-point split base its space has two points, excluding a globally constant one-point object.

**The open two-adic unit disc.**
`AdicSpace.DiscChecks.closedDisc` is `Spa(Q₂⟨T⟩, Q₂⟨T⟩°)`. Its open unit disc is the union
of `radiusRegion n = {|T|ⁿ⁺¹ ≤ |2|}`. The inclusions of these rational opens form a strictly
increasing cover, so no finite subfamily covers their union. The radius-one Gauss point lies
in the closed disc and outside the union. `gauss_polynomial` fixes each Gauss valuation on
polynomials by `maxᵢ |aᵢ| rⁱ`; `gauss_radiusRegion` gives the corresponding radius inequality.
This is the object in `GeometricChecks.Pro.pro_open_const`, `GeometricChecks.basis_noncompact`,
and `GeometricChecks.Pro.qc_noncompact`.

**Checks.**

- *disc_radius_positive* (computation) — the radius-1/2 Gauss point lies in the first rational subdisc.
- *disc_radius_boundary* (non-example) — the radius-one Gauss point does not lie in the open disc.
- *disc_radius_unbounded* (non-example) — no individual rational subdisc contains the open disc; the increasing covering cannot have a finite subcover.

**`AdicSpace.ProEtale.ProEt.space_const`.** The comparison identifies the constant pro-space with the original space, including its maps. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtale_ProEt_space_const_sheet_one_point* (computation) — The section selecting sheet 1 maps to the labelled point 1.

- *AdicSpace_ProEtale_ProEt_space_const_sheet_zero_point* (degenerate) — The constant one-point diagram selecting sheet 0 maps to point 0.

- *AdicSpace_ProEtale_ProEt_space_const_not_sheet_two* (non-example) — The section selecting sheet 1 does not map to point 2.

**`AdicSpace.ProEtale.ProEt.Presentation`.** A presentation includes its actual cofiltered limit, as well as its finite stages. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtale_ProEt_Presentation_quadratic_stage* (computation) — A one-stage presentation of the split quadratic object has two points at its unique stage.
- *AdicSpace_ProEtale_ProEt_Presentation_empty_stage* (degenerate) — A one-stage presentation of the empty object has empty stage.
- *AdicSpace_ProEtale_ProEt_Presentation_empty_stages_excluded* (non-example) — An all-empty diagram cannot present the split quadratic object; omitting the limiting-cone condition would admit it.

**`AdicSpace.ProEtale.ProEtalePresentation`.** Pro-étale presentations fix the limit arrow in the slice over the target. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtale_ProEtalePresentation_quadratic_fold* (computation) — The two-sheeted fold has a one-stage presentation with two-point domain.
- *AdicSpace_ProEtale_ProEtalePresentation_empty_identity* (degenerate) — The identity of the empty object has a one-stage empty presentation.
- *AdicSpace_ProEtale_ProEtalePresentation_empty_domains_excluded* (non-example) — Empty stage domains cannot present the two-sheeted fold; dropping the limit condition gives this wrong alternative.

### A1.11 the corrected covering condition

The erratum restricts the coverings and leaves the category unchanged ([PH erratum] item (1),
p. 1). The explicit form used here follows.

**Finite-étale towers.** (*finite-etale-tower*) Let `W ∈ pro-X_ét`. A *finite-étale tower* over
`W` of length `λ` (an ordinal) is a functor `μ ↦ U_μ` on `{μ < λ}ᵒᵖ` to `pro-X_ét` over `W` with
`U_0 = W` such that for every `μ < λ` the canonical morphism

```text
U_μ  →  U_{<μ} := lim_{μ' < μ} U_{μ'}        (U_{<0} := W)
```

is finite étale and surjective, i.e. the pullback along some `U_{<μ} → V_0` of a finite étale
surjective `V_0' → V_0` of `X_ét`; its composite is `lim_{μ<λ} U_μ → W`. A morphism `t : U → W` is
a finite-étale tower if it is isomorphic over `W` to the composite of such a tower. Inside
`pro-X_fét` one requires `V_0' → V_0` to be a morphism of `X_fét`; this is the pro-finite-étale
tower of the erratum. Steps are allowed at every ordinal, including limit ordinals (Kerz's
transfinite compositions); `λ = 1` gives isomorphisms (and so does `λ = 0` with the convention
`lim_{μ<0} U_μ := U_{<0} = W`; without it the empty limit is the final object `X`), and `λ = 2`
gives single finite étale surjections.
Equivalently, after inserting `U_{<μ}` before `U_μ`, `t` is a tower iff `t.op` lies in Mathlib's
`MorphismProperty.transfiniteCompositions` of the opposite of the pullbacks of finite étale
surjections of `X_ét`, computed in `(pro-X_ét)ᵒᵖ` with well-order-continuous shapes. Steps pulled
back from `X_ét`, not only from `X_fét`, are allowed for towers inside `X_proét`; this is what keeps
the countable case unchanged ([PH erratum] item (1), p. 1). In `AdicSpace.ProEtale`, define the
structure `FetTower` (the ordinal `λ`, the functor with `U_0 = W`, and for each `μ` the finite étale
surjection of `X_ét` whose pullback is `U_μ → U_{<μ}`), `FetTower.comp` (the composite
`lim_{μ<λ} U_μ → W`) and the class `IsFetTower`; prove `IsFetTower.of_finiteEtale_surjective` (a
finite étale surjection is a tower of length `2`, an isomorphism one of length `1`),
`IsFetTower.comp` (concatenation: a tower of length `λ₁` over the composite of one of length `λ₂`
is a tower of length `λ₂ + λ₁`), `IsFetTower.baseChange` (base change along any `W' → W` is a tower
of the same length, since fibre products commute with cofiltered limits), `IsFetTower.surjective`,
`isFetTower_iff_transfiniteCompositions`, `IsFetTower.isProEtale` (see
*finite-etale-tower-is-pro-etale*)
and `isFetTower_of_countable` (the countable case, which is *finite-etale-tower-is-pro-etale*
(c)). *Needs:* *pro-etale-morphism*,
*pro-etale-base-change*, *finite-etale-site*; DiamondsAndVStacks layer D0; Mathlib
`CategoryTheory.MorphismProperty.transfiniteCompositions`,
`CategoryTheory.MorphismProperty.pullbacks`,
`CategoryTheory.Functor.IsWellOrderContinuous`. README only (no Lean declaration).

**Checks.**

- *FetTower.test_kummer* (computation) — the Kummer tower `X̃ = lim_n X_n → X` (`K` of
  characteristic `0`) is a finite-étale tower of length `ω` with steps of degree `p`.
- *FetTower.test_length_le_one* (degenerate) — a tower of length `1` (or `0`, with
  `lim_{μ<0} := W`) has composite an isomorphism; a tower of length `2` is exactly a finite étale
  surjective morphism; a tower of length `ω` is a sequence `⋯ → U_2 → U_1 → U_0 = W` of finite
  étale surjections with composite `lim_n U_n → W`, and no finite length gives a non-étale
  morphism (a tower of finite length is a finite étale surjection).
- *FetTower.test_open_immersion* (non-example) — for a nonempty open `V ⊊ X`, `c(V) → X` is étale
  but not a tower, since towers are surjective; this is why corrected coverings allow an étale
  factor.
- *FetTower.test_nonsplit_surjection* (non-example) — for `X = Spa(C, O_C)` (`C` algebraically
  closed, `O_C` of rank one) and an open continuous surjection `S → S'` of profinite sets without
  continuous section (Ribes–Zalesskii [RZ], Example 5.6.9, cited in [PH erratum] item (1)), the morphism
  `S × X → S' × X` (see *profinite-set-objects*) is pro-étale and surjective but not a tower, since
  towers over `X` split (see *transfinite-tower-splitting*).
- *FetTower.test_mathlib_shape* (compatibility) — `t` is a tower iff
  `t.op ∈ MorphismProperty.transfiniteCompositions` of the opposite of the pullbacks of finite étale
  surjections of `X_ét`.

**Towers are pro-étale.** (*finite-etale-tower-is-pro-etale*) Let `t : U → W` be a tower of length
`λ`. (a) There are a small directed set `K` — the finite subsets `F ⊂ λ` closed under a dependency
function, finite by König's lemma — and an isomorphism `U ≅ lim_{F∈K} V_F` over `W` with every
`V_F → W` and every transition `V_{F'} → V_F` (`F ≤ F'`) finite étale and surjective; so `t` is
pro-étale, and `U ∈ X_proét` whenever `W ∈ X_proét`. (b) `|t|` is surjective with nonempty compact
fibres. (c) Conversely, a pro-étale presentation `U = lim_{i∈I} U_i → V` with `I` countable has a
stage `i_0` with `U → U_{i_0}` a tower of length `ω` and `U_{i_0} → V` étale: the countable case is
unchanged ([PH erratum] item (1), p. 1; [PH] §3, proof of Lem. 3.10(vi), p. 17; [PH] §3, proof of
Lem. 3.10(i), p. 16). *Needs:* *finite-etale-tower*, *pro-etale-morphism*,
*pro-etale-base-change*, *pro-etale-etale-composition*, *pro-etale-composition*;
DiamondsAndVStacks layer D0. README only (no Lean declaration).

**Checks.**

- *towerProEtale_kummer* — for the Kummer tower, use the cofinal index set `ℕ`; for a finite
  set `F` of stages, set `V_∅ = X_0` and `V_F = X_{max F}` when `F` is nonempty.
  *tower_finite_stage_empty* computes the actual diagram objects at `∅` and `{0,1}`
  in `ProEtalePresentation.finiteSubsets`: they are `X_0` and `X_1`.
- *towerProEtale_profinite_group* — for a profinite group `G` with the filtration of
  *profinite-group-tower*, the tower `G → pt` has finite levels `G/N_F` for open normal `N_F`.

**`AdicSpace.ProEtale.ProEtalePresentation.finiteSubsets`.** Given a diagram
`D : ℕᵒᵖ ⥤ Over V` with a limiting cone representing `f : U → V`, étale structure maps
and finite étale surjective transitions, construct a `ProEtalePresentation f` indexed by
`(Finset ℕ)ᵒᵖ`. Reindex both the diagram and its cone along `F ↦ sup F`, with `sup ∅ = 0`.
This functor is initial, so the reindexed cone remains limiting. Thus the construction
applies to the natural-number presentation of the Kummer tower above, including the
empty finite subset; all maps remain the maps of the given tower. README only (no Lean declaration).

**Checks.**

- *ProEtalePresentation_finiteSubsets_empty* — the diagram objects at `∅` and `{0,1}`
  are `D(0)` and `D(1)`; this is also *tower_finite_stage_empty*.
- *ProEtalePresentation_finiteSubsets_singleton* — the limiting cone projection at `{2}`
  is the original cone projection at stage 2.
- *ProEtalePresentation_finiteSubsets_transition* — the inclusion `{0} ⊆ {0,1}` gives
  the original transition `D(1) → D(0)`, fixing the direction of the reindexing.

**Transfinite towers of profinite sets split.** (*transfinite-tower-splitting*) Let `f : S → S'` be
a continuous map of profinite sets written `S = lim_{μ<λ} S_μ` with `S_0 = S'`, such that for every
`μ < λ` the map `S_μ → S_{<μ} := lim_{μ'<μ} S_{μ'}` is the pullback of a surjection of finite sets
along a continuous `S_{<μ} → B_μ`; `λ` is an arbitrary ordinal with no countability assumption.
Then `f` has a continuous section (transfinite induction on `λ`). In the proposed Lean form the
steps form the class
`Profinite.finiteSurjPullbacks`, a tower is a map whose opposite lies in Mathlib's
`MorphismProperty.transfiniteCompositions` of their opposites, and the statement is
`Profinite.exists_section_of_transfiniteTower`. Consequently, for `X = Spa(C, O_C)` with `C`
algebraically closed and `O_C` of rank one, every finite-étale tower between quasi-compact objects
of `X_proét` has a continuous section on underlying spaces. The printed Proposition 3.7(i), that
every continuous open surjection of profinite sets splits, is false and is not used
(`Profinite.exists_isOpenMap_surjective_not_split`; [PH erratum] item (1), p. 1, which takes the
counterexample, built from an uncountable inverse limit, from Ribes–Zalesskii [RZ], *Profinite groups*,
2nd ed., Example 5.6.9; [PH] §3, Prop. 3.7(i), p. 14). *Needs:* *finite-etale-tower*; Mathlib
`Profinite`, `CategoryTheory.MorphismProperty.transfiniteCompositions`, `CategoryTheory.IsPullback`. README only (no Lean declaration).

**Checks.**

- *profinite_tower_identity* (degenerate) — `𝟙_S` is a step: the pullback of the identity of a
  point along `S → pt`.
- *profinite_tower_finite_surjection* (computation) — a surjection of finite sets is a step: its
  own pullback along the identity.
- *profinite_tower_empty* (negative control) — `∅ → T` with `T ≠ ∅` is not a step: a pullback of a
  surjection onto a nonempty target is nonempty.
- *towerSplit_profinite_group* — for `S = G` a profinite group with the filtration of
  *profinite-group-tower*, `G → pt` has a section (any point).
- *towerSplit_nonsplit_not_tower* (non-example) — the Ribes–Zalesskii [RZ] open surjection without
  continuous section is, by this lemma, not of tower form.

**Profinite groups are towers.** (*profinite-group-tower*) Let `G` be a profinite group, with no
countability assumption (for `G` countably based one may take `λ = ω`). (a)
There are an ordinal `λ` and decreasing closed normal subgroups `N_μ` (`μ < λ`) with `N_0 = G`,
`⋂_μ N_μ = 1` and `N_{<μ}/N_μ` finite, where `N_{<μ} := ⋂_{μ'<μ} N_{μ'}` (`N_{<0} := G`);
equivalently `G = lim_{μ<λ} G_μ` with `G_0 = 1` and `G_μ → G_{<μ}` the quotient by a finite normal
subgroup. (b) For closed subgroups `A ⊂ B` of `G` with `A` of finite index in `B`, the `G`-map
`G/A → G/B` is the pullback of `G/AN → G/BN` for an open normal `N` with `B ∩ N ⊂ A`, a surjection
of finite `G`-sets. (c) For every closed `G' ⊂ G`, `G → G/G'` is a `G`-tower, i.e. a covering of the
site of profinite `G`-sets with corrected coverings (see *profinite-g-sets-site*); in particular
`G → pt` is a covering ([PH erratum] item (1), p. 1). More generally, for closed subgroups
`H ⊆ K` of `G` the `G`-map `G/H → G/K` is a `G`-tower, with stages `G/H(K ∩ N_μ)`. In the
proposed Lean form, (a) is
`ProfiniteGrp.exists_transfiniteFiltration` (a well-ordered `J` with `⊥`, the index of `N_j` in
`N_{<j}` being Mathlib's `Subgroup.relIndex`). Part (b) is
`ProfiniteGSet.quotientMap_finiteIndex_pullback`: assuming `A.relIndex B ≠ 0`, it supplies an
`OpenNormalSubgroup N`, the containment `B ⊓ N ≤ A`, finite quotient carriers and a surjective
bottom map, and `IsPullback` for the four canonical quotient maps. Because `N` is normal,
`AN` and `BN` are the subgroup joins `A ⊔ N` and `B ⊔ N`. Part (c) is
`ProfiniteGSet.isGTower_quotientMap` and `ProfiniteGSet.singleton_toPt_mem_pretopology`. The continuous sections of `G → G/G'` that
(c) yields are in the library, Tau Ceti `exists_continuous_section` and
`exists_continuous_section_of_le` (ProfiniteCohomology layer 0); the transfinite filtration
(a)–(b) and the covering statement (c) are the content here. *Needs:* *profinite-g-sets-site*;
Mathlib `Profinite`, `ProfiniteGrp`, `Subgroup.relIndex`; Tau Ceti `exists_continuous_section`,
`exists_continuous_section_of_le`. README only (no Lean declaration).

**Checks.**

- *filtration_index_direction* (two-term convention) — `H.relIndex K` is the index of `H ⊓ K` in
  `K`: in `ℤ/2`, `⊥.relIndex ⊤ = 2` and `⊤.relIndex ⊥ = 1`, so the condition reads
  `[N_{<j} : N_j] < ∞`.
- *groupTower_Zp* — `G = ℤ_p`: `λ = ω`, `N_n = p^n ℤ_p`, and `ℤ_p → pt` is a tower with steps
  `ℤ/p^{n+1} → ℤ/p^n`.
- *groupTower_uncountable* — `G = ∏_{i∈I} ℤ/2` with `I` uncountable: `G → pt` is a tower of
  cardinal-indexed length with steps `ℤ/2 → pt`.
- *groupTower_trivial* (degenerate) — `G = 1`: `J = {⊥}` with `N_⊥ = 1 = G`, index `1`.

**Étale over a tower is a tower followed by étale.** (*etale-over-tower-swap*) Let `t : U → W` be
a finite-étale tower and `e : A → U` étale in `pro-X_ét`. Then `t ∘ e = e' ∘ t'` for a tower
`t' : A → B` and an étale `e' : B → W`, by transfinite induction on `λ`: at successors the last
finite étale step is absorbed into the étale map; at limits the classifying map factors through a
stage `μ_0 < λ` by the Hom formula for pro-objects. Consequently every finite composite of towers
and étale morphisms, in any order, is of the form (étale) ∘ (tower) ([PH erratum] item (1), p. 1;
[PH] §3, proof of Lem. 3.10(vi), p. 17; [PH] §3, Prop. 3.2, p. 13). For `t` the Kummer tower and
`e` the inclusion of the preimage of a rational subset `R ⊂ X_n`,
`t ∘ e = (R → X étale) ∘ (X̃ ×_{X_n} R → R tower)` (check *swap_kummer_rational*). *Needs:*
*finite-etale-tower*, *pro-etale-morphism*, *pro-etale-base-change*,
*pro-etale-etale-composition*; DiamondsAndVStacks layer D0. README only (no Lean declaration).

**The corrected coverings form a pretopology.** (*corrected-covers-pretopology*) Call a family
`{f_i : U_i → U}_{i∈I}` in `X_proét` a *corrected covering* if `|U| = ⋃_i f_i(|U_i|)` and each
`f_i` factors as `U_i → W_i → U` with `U_i → W_i` a finite-étale tower and `W_i → U` étale. Then:
(a) the corrected coverings form a Grothendieck pretopology on `X_proét` (Mathlib
`CategoryTheory.Pretopology`): isomorphisms are coverings, coverings are stable under base change
(fibre products exist by *pro-etale-finite-limits*) and under composition (via
*etale-over-tower-swap*); (b) every member is pro-étale and open; (c) every jointly surjective
family of étale morphisms and every finite-étale tower is a corrected covering; (d) every family of
pro-étale maps that is a covering of the printed Definition 3.9 and whose members have countably
indexed presentations is a corrected covering; (e) every corrected covering is a covering of the
printed Definition 3.9, so the corrected topology is coarser than the printed one on the same
category ([PH erratum] item (1), p. 1; [PH] §3, Def. 3.9, p. 15; [PH] §3, Lem. 3.10(i), p. 15).
The étale factor `e_i` is the reading of the erratum's "similar condition" for Definition 3.9
adopted here: without it open covers would be excluded; with steps from `X_ét`, (d) is immediate.
*Needs:* *finite-etale-tower*, *finite-etale-tower-is-pro-etale*, *etale-over-tower-swap*,
*pro-etale-base-change*, *pro-etale-etale-composition*, *pro-etale-maps-open*,
*pro-etale-composition*, *pro-etale-finite-limits*; Mathlib `CategoryTheory.Pretopology`. README only (no Lean declaration).

**Checks.**

- *coverPretopology_open_cover* — for an open cover `X = X_1 ∪ X_2`, `{X_1 → X, X_2 → X}` is a
  corrected covering.
- *coverPretopology_kummer* — the Kummer tower `X̃ → X` is a corrected covering.


**`AdicSpace.ProEtale.finiteSurjPullbacks`.** A tower step is a pullback of a finite étale surjection; surjectivity is essential. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtale_finiteSurjPullbacks_positive* (computation) — The split two-to-one Q₂ cover is a permitted finite surjective step.
- *AdicSpace_ProEtale_finiteSurjPullbacks_degenerate* (degenerate) — The identity of the empty object is a permitted step.
- *AdicSpace_ProEtale_finiteSurjPullbacks_negative* (non-example) — The empty-to-one-sheeted finite étale map is not a step; finiteness alone is insufficient.

**`AdicSpace.ProEtale.FetTower.comp`.** The tower composite retains the specified arrow, including its action on the ordered sheets. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtale_FetTower_comp_three_cycle* (computation) — The one-step tower given by the geometric three-cycle takes sheet 0 to sheet 1.

- *AdicSpace_ProEtale_FetTower_comp_constant_tower* (degenerate) — The constant tower on three labelled sheets has identity composite.

- *AdicSpace_ProEtale_FetTower_comp_not_inverse_cycle* (non-example) — Reversing the three-cycle gives a different composite.

**`AdicSpace.ProEtale.FetTower`.** The tower includes the nonempty well-ordered shape and finite étale surjective successor arrows. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtale_FetTower_surjective_fold* (computation) — The nontrivial two-sheeted fold is a one-step tower indexed by two stages.
- *AdicSpace_ProEtale_FetTower_empty_identity* (degenerate) — The empty identity is a constant one-stage tower.
- *AdicSpace_ProEtale_FetTower_empty_to_point_excluded* (non-example) — The empty-to-point map admits no such tower: omitting surjectivity of successor steps would incorrectly allow a one-step presentation.

### A1.12 the pro-étale site

**The pro-étale site with corrected coverings.** (*pro-etale-site-corrected*) Let `X` be locally
noetherian analytic with `X_ét` and `X_fét` as above. `X_proét` is the full subcategory of
`pro-X_ét` on objects pro-étale over `X`, with the Grothendieck topology `J_proét` generated
(Mathlib `CategoryTheory.Pretopology.toGrothendieck`) by the corrected coverings of
*corrected-covers-pretopology*: a sieve on `U` covers iff it contains a family

```text
{ U_i → W_i → U },   U_i = lim_{μ<λ_i} U_{i,μ} → W_i a finite-étale tower,   W_i → U étale,
|U| = ⋃_i image(|U_i| → |U|),
```

with `U_{i,0} = W_i` and each `U_{i,μ} → lim_{μ'<μ} U_{i,μ'}` the pullback of a finite étale
surjection of `X_ét`. `X` is final, finite limits exist, and base changes along pro-étale maps,
in particular along members of coverings, are fibre products of `pro-X_ét`, while equalizers in
general are not (see *pro-etale-finite-limits*), every `U` has `|U| = lim |U_i|`, quasi-compact
opens of `|U|` are represented by subobjects (see *pro-etale-quasicompact-opens*), and every
member of a covering is open.
The category is Scholze's ([PH] §3, Def. 3.9, p. 15); `J_proét` is coarser than the printed topology
and strictly coarser as soon as an open surjection of profinite sets without continuous section
occurs over a geometric point; families of pro-étale maps with countable presentations are coverings
exactly as before ([PH erratum] item (1), p. 1). No arbitrary open surjection of profinite sets is
assumed to split; Corollary 3.8 (called Proposition 3.8 in the erratum) and the last sentence of Proposition 3.13, deleted by the erratum,
are not used ([PH erratum] item (2), p. 1); enough points is only the abstract statement of
*proetale-topos-enough-points*. `X_proét` is neither the pro-étale site of a perfectoid space of ECD
Definition 8.1(ii), DiamondsAndVStacks layer D2's ([ECD] §8, Def. 8.1(ii), p. 39), nor Mathlib's
pro-étale topology on schemes. Scholze's hypothesis *locally noetherian* is what
*pro-etale-finite-limits* needs ([PH] §3, before Def. 3.3, p. 13). In `AdicSpace`, define
`ProEtaleSite` (the category) and `ProEtaleSite.topology` (`J_proét`); prove
`ProEtaleSite.mem_topology_iff` (a sieve covers iff it contains a family as displayed),
`isCovering_of_etale` (a jointly surjective family of étale maps covers), `isCovering_of_isFetTower`
(a tower covers), `isCovering_of_countable` (a jointly surjective family of pro-étale maps with
countably indexed presentations covers), `topology_le_printed` (`J_proét ≤` the printed topology),
the instance `hasFiniteLimits`, `ProEtaleSite.space` (`U ↦ |U|` on `X_proét`),
the openness of covering maps, and `ne_scheme_proetale` (no identification with
`AlgebraicGeometry.Scheme.proetaleTopology`, whose objects are schemes weakly étale over a base with
fpqc covers). *Needs:* *pro-etale-morphism*, *corrected-covers-pretopology*, *finite-etale-tower*,
*pro-etale-finite-limits*, *pro-etale-quasicompact-opens*, *pro-etale-maps-open*,
*transfinite-tower-splitting*, *etale-site*; Mathlib `CategoryTheory.Pretopology.toGrothendieck`,
`AlgebraicGeometry.Scheme.proetaleTopology`. README only (no Lean declaration).

**Checks.**

- *ProEtaleSite.test_point* (computation) — for `X = Spa(C, O_C)` (`C` algebraically closed, `O_C`
  of rank one), `U ↦ |U|` is an equivalence from the quasi-compact objects of `X_proét` to
  `Profinite`; a family `{S_i → S}` of maps of profinite sets is a corrected covering iff it is
  jointly surjective and each `S_i` is a finite disjoint union of open and closed pieces, each
  mapped by a finite-étale tower onto an open and closed subset of `S` (étale maps between
  quasi-compact objects are finite disjoint unions of clopen immersions); so every covering sieve
  of a profinite set contains a family with continuous sections locally on a finite clopen cover
  of the target.
- *ProEtaleSite.test_nonsplit_not_cover* (non-example) — for `X = Spa(C, O_C)` and an open
  continuous surjection `f : S → S'` of profinite sets without continuous section
  (Ribes–Zalesskii [RZ], Example 5.6.9), `f` is pro-étale and surjective, hence covering for the
  printed Definition 3.9, but the sieve it generates is not `J_proét`-covering: a corrected
  covering factoring through `f` would give a continuous section by *transfinite-tower-splitting*.
- *ProEtaleSite.test_countable_unchanged* (compatibility) — the Kummer tower `{X̃ → X}` over
  `X = Spa(K⟨T^{±1}⟩, K°⟨T^{±1}⟩)` (`char K = 0`) is a covering both for `J_proét` and for the
  printed Definition 3.9.
- *ProEtaleSite.test_etale_cover* (degenerate) — for an open cover `X = ⋃ X_k`, `{c(X_k) → X}` is a
  covering (towers of length `1`); for `X = ∅` the empty family covers `X`.
- *ProEtaleSite.test_geometric_stalk_not_conservative* (non-example) — for `X = Spa(C, O_C)` the
  fibre at the geometric point (colimit over pro-étale neighbourhoods) is `F ↦ F(pt)`, and the
  `J_proét`-sheafification of the separated presheaf `S ↦ C(S, ℝ)/LC(S, ℝ)` (continuous modulo
  locally constant functions) vanishes at `pt` and is nonzero on the Cantor set ([PH] §3,
  Rem. 3.14, first sentence, p. 19).

**The projection ν.** (*proetale-projection-nu*) The functor `c : X_ét → X_proét` is fully
faithful, preserves finite limits, and sends the coverings of `X_ét` (jointly surjective families
of étale maps) to corrected coverings; hence `c` is continuous (Mathlib
`CategoryTheory.Functor.IsContinuous`) and defines a morphism of sites `ν : X_proét → X_ét` with
`ν_* F = F ∘ c` (Mathlib `CategoryTheory.Functor.sheafPushforwardContinuous`) and left adjoint
`ν^*` (Mathlib `CategoryTheory.Functor.sheafPullback`) commuting with finite limits; for a sheaf
`F` on `X_ét`, `ν^*F` is the `J_proét`-sheafification (Mathlib `CategoryTheory.presheafToSheaf`)
of `V ↦ colim_{V → c(E)} F(E) = colim_j F(V_j)` for `V = lim V_j`, by the Hom formula ([PH] §3,
before Lem. 3.16, p. 19; [PH] §3, Prop. 3.2, p. 13). For `X = Spa(K, O_K)`, `K` complete discretely
valued with `G = Gal(K^sep/K)`, the quasi-compact objects form a site `X_proét^qc ≃ G-pfsets`
with the same topos as `X_proét` (`X_proét` itself also contains the non-quasi-compact `⊔_ℕ X`;
see *proetale-profinite-etale-morphism-of-sites*), and under it `ν^*` of the étale sheaf of a
discrete `G`-module `M` is `S ↦ Hom_cont,G(S, M)` (check *nu_pullback_discrete_module*). *Needs:*
*pro-etale-site-corrected*, *pro-etale-morphism*, *corrected-covers-pretopology*, *etale-site*;
Mathlib `CategoryTheory.Functor.IsContinuous`, `CategoryTheory.Functor.sheafPushforwardContinuous`,
`CategoryTheory.Functor.sheafPullback`, `CategoryTheory.presheafToSheaf`. README only (no Lean declaration).

**Sections of ν^*F on qcqs objects.** (*nu-pullback-sections-qcqs*) Let `F` be a sheaf of sets on
`X_ét` and `U = lim U_j ∈ X_proét` quasi-compact and quasi-separated
(see *proetale-quasicompactness-detection*), presented with
quasi-compact quasi-separated `U_j ∈ X_ét`;
`X` may be assumed quasi-separated since the statement is local, and then `X_proét^qc` has the same
topos. Then `(ν^*F)(U) = colim_j F(U_j)`: the presheaf `F̃` of *proetale-projection-nu* is first
shown separated and then a sheaf by the Čech argument, reducing to étale covers at finite level
(see *finite-etale-tower-is-pro-etale*). Hence the unit `F → ν_*ν^*F` is an isomorphism and `ν^*` is
fully faithful on sheaves of sets. This is the case `i = 0` of Lemma 3.16, which the consumers cite
for `O_X = ν^*O_{X_ét}` and for sections over Galois towers; the higher statements
`H^i(U, ν^*F) = colim_j H^i(U_j, F)` for `i > 0` and Corollary 3.17 belong to
the étale-cohomology roadmaps ([PH] §3, Lem. 3.16 and its proof, pp. 19–20; [PH] §3,
after Cor. 3.17, p. 20). *Needs:* *proetale-projection-nu*, *proetale-coherence*,
*proetale-quasicompactness-detection*, *finite-etale-tower-is-pro-etale*, *etale-site*;
DiamondsAndVStacks layer D0. README only (no Lean declaration).

**Checks.**

- *nuSections_kummer_constant* — for the Kummer tower and `F = ℤ/n`,
  `(ν^*ℤ/n)(X̃) = colim_m (ℤ/n)(X_m) = ℤ/n`, all `X_m` being connected.
- *nuSections_perfectoid_consumer* — PerfectoidTowers layer P9 uses
  `F(U_∞) = colim F(U_i ×_Y Y_j)`. Finite-stage sections generate the sections of the
  underlying pro-object; two representatives agree precisely when their pullbacks agree
  at a common stage.

**Slices.** (*proetale-slice*) For `V ∈ X_ét` (itself locally noetherian analytic), the functor
`V_proét → X_proét/c(V)`, `lim V_i ↦ (lim V_i → V)`, is an equivalence under which the corrected
coverings of `V_proét` correspond to the coverings of the slice topology (Mathlib
`GrothendieckTopology.over` of `J_proét`); hence `Sh(V_proét) ≃ Sh(X_proét)/h_V^♯`, the slice
over the sheafification of the presheaf `h_V` represented by `c(V)`, which is not itself a sheaf
in general (check *fieldSlice_raw_hom_not_sheaf*, where `V = S ⊔ S`). It is compatible
with `ν`: under the étale slice equivalence `V_ét ≃ X_ét/V` (see *slice-site*), `ν_V` is the
localisation of `ν_X`. For `V ⊂ X` open this is the pro-étale site of an open subspace, which
AdicSpacesPartIV layer R4 re-exports (*proetale-slice-open-subspace*) ([PH] §3, before Prop. 3.15,
p. 19; [PH] §3, Lem. 3.10(iii),
p. 15). *Needs:* *pro-etale-site-corrected*, *proetale-projection-nu*, *slice-site*,
*pro-etale-quasicompact-opens*; AdicSpacesPartII layer R0; DiamondsAndVStacks layer D0; Mathlib
`CategoryTheory.GrothendieckTopology.over`. README only (no Lean declaration).

**Checks.**

- *slice_self* — for `V = X` the equivalence is the identity.
- *slice_kummer_stage* — for `V = X_n` in the Kummer tower, `(X_n)_proét ≃ X_proét/X_n` and `X̃`
  corresponds to the Kummer tower over `X_n`.
- *slice_representable_sheafified* — for `V ∈ X_ét`, `h_V^♯ = ν^*(Hom_X(−, V))`: by the Hom
  formula `h_V` is `U ↦ colim_j Hom_X(U_j, V)`, the presheaf whose sheafification defines `ν^*`
  in *proetale-projection-nu*. So `h_V^♯(U) = Hom(U, c(V))` for qcqs `U`
  (*nu-pullback-sections-qcqs*), while for the non-quasi-compact `U` of
  *fieldSlice_raw_hom_not_sheaf* the two differ.

**Profinite sets.** (*profinite-set-objects*) Let `U ∈ X_proét` and `S = lim_j S_j` profinite (`S_j`
finite discrete). Put `S × X := lim_j ⊔_{s∈S_j} X ∈ X_proét` (the pullback to `X` of `S` viewed in
the pro-finite-étale site of the base) and `U × S := U ×_X (S × X)`. Then (a) `U × S ∈ X_proét` and
`|U × S| ≅ |U| × S`; (b) for quasi-compact `V ∈ X_proét`,
`Hom(V, U × S) ≅ Hom(V, U) × C(|V|, S)` naturally in `V`; (c) for `S ≠ ∅` the projection
`U × S → U` has a section (choose `s ∈ S`), so it generates a covering sieve (a sieve containing a
split epimorphism contains the identity). For metrizable `S` one can also use a countable
inverse system of finite sets with surjective transitions to obtain a finite-étale tower.
No tower presentation is asserted here for a general profinite set: at a limit stage, a quotient
by infinitely many clopen partitions need not be finite, and a further finite partition need not
be pulled back from a finite quotient of that limit. (d) for `X = Spa(C, O_C)` (`C`
algebraically closed, `O_C` of rank one) and an open continuous surjection `f : S → S'` of
profinite sets without continuous section (Ribes–Zalesskii [RZ], Example 5.6.9), `U × S → U × S'` is
pro-étale and surjective, but for `U = X` the sieve it generates is not a covering of `X_proét`:
no splitting of arbitrary open surjections is assumed ([PH] §5, proof of Lem. 5.6, p. 31; [PH] §6,
Cor. 6.6, p. 36; [PH erratum] item (1), p. 1). The perfectoid analogue `X × S`, with
`|X × S| = |X| × S` and `O(X × S) = C⁰(S, O(X))`, is PerfectoidSpaces layer P6
(*product-with-profinite-set*), whose `homEquiv` is the model for (b); the carrier here,
pro-objects of `X_ét` for locally noetherian `X`, is a different
one. *Needs:* *pro-etale-site-corrected*,
*pro-etale-morphism*, *pro-etale-base-change*, *finite-etale-tower*, *profinite-group-tower*,
*transfinite-tower-splitting*, *pro-finite-etale-site-corrected*; DiamondsAndVStacks layer D0;
Mathlib `Profinite`. README only (no Lean declaration).

**Checks.**

- *profiniteObj_galois_square* — Scholze, proof of Lemma 5.6: `Ṽ ×_V Ṽ ≅ Ṽ × ℤ_p^n` for the
  Galois cover `Ṽ → V` with group `ℤ_p^n`.
- *profiniteObj_affinoid_perfectoid* — the `p`-adic Hodge theory roadmaps: `V = U × S` is affinoid
  perfectoid when `U` is, and `F(U × S) = Hom_cont(S, F(U))` for the completed sheaves (proved
  there).

**Galois covers.** (*profinite-galois-cover-is-covering*) Let `U ∈ X_proét`, `G` a profinite group
and `Ũ = lim_j Ũ_j → U` a pro-finite-étale `G`-torsor: each `Ũ_j → U` finite étale and Galois with
group `G/N_j` for open normal `N_j` with `⋂ N_j = 1`, compatibly; quotients `Ũ/H` for closed normal
`H ⊂ G` are formed levelwise as quotients of finite étale covers by finite groups
(*finite-etale-galois-category*, axiom (G2)). Then (a) `Ũ ×_U Ũ ≅ Ũ × G` via `(x, g) ↦ (x, xg)`
(see *profinite-set-objects*); (b) `Ũ → U` is a finite-étale tower — the quotients `Ũ/N_μ` along the
erratum's filtration of `G` — hence a covering of `X_proét` for every profinite `G`, not only for
countable systems; (c) for every sheaf `F` on `X_proét`, `F(U) = eq(F(Ũ) ⇉ F(Ũ × G))`; if `U` is
quasi-compact quasi-separated and `F = ν^*F'` for a sheaf `F'` on `X_ét`, then
`F(Ũ × G) = LC(G, F(Ũ))` and `F(U) = F(Ũ)^G` ([PH] §5, proof of Lem. 5.6, p. 31; [PH erratum]
item (1), p. 1). PerfectoidTowers P9.4–P9.6 specialize these pro-object identities and
étale-sheaf descent to
towers satisfying their base, cofinal-sequence, affinoid-completion and continuity hypotheses
(*profinite-galois-tower*, *cech-descent-datum*, *etale-sheaf-sections-over-galois-tower*).
The perfectoid completion is a separate realization of the pro-object. The corrected-covering
assertion (b) and the general profinite statement are owned here. *Needs:*
*profinite-set-objects*, *profinite-group-tower*,
*finite-etale-galois-category*, *nu-pullback-sections-qcqs*, *finite-etale-tower*,
*pro-etale-site-corrected*, *corrected-covers-pretopology*. README only (no Lean declaration).

**Checks.**

- *galoisCover_kummer* — for `K ⊇ μ_{p^∞}` (for instance `K = ℂ_p`), the Kummer tower `X̃ → X`
  is a pro-finite-étale torsor under `G = ℤ_p(1) = lim_n μ_{pⁿ}(K)`, `X̃ ×_X X̃ ≅ X̃ × ℤ_p` and
  `(ν^*F')(X) = (ν^*F')(X̃)^{ℤ_p}`; for `K = ℚ_p` the stages `X_n → X` are not Galois (their
  automorphism group is `μ_{pⁿ}(ℚ_p)`, trivial for `p` odd), and the tower is a corrected covering
  without being a torsor.
- *galoisCover_perfectoid_consumer* — PerfectoidTowers layer P9: `F(U) = F(U_∞)^G` for `F` pulled
  back from the étale site. For a qcqs base object, restriction is injective and its image is the fixed sections of
  `GaloisPresentation.limitAction`.
- *galoisCover_field_extension* — the `p`-adic Hodge theory
  roadmaps: Galois descent along `X_K → X` with
  `G = Gal(K/k)`. For the system of all finite subextensions of the algebraic closure of
  `ℚ₂`, the limit action is faithful and restriction identifies pulled-back étale sections
  with absolute-Galois invariants.


**`AdicSpace.ProEtaleSite.forget`.** Forgetting the pro-étale condition retains the actual pro-object, its stage maps, and its empty constant object. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_forget_positive* (computation) — The explicit constant two-sheeted object has exactly two points after applying the functor.
- *AdicSpace_ProEtaleSite_forget_degenerate* (degenerate) — The explicit constant zero-sheeted object has empty space.
- *AdicSpace_ProEtaleSite_forget_negative* (non-example) — The three-sheeted object does not collapse to a one-point space.

**`AdicSpace.ProEtaleSite.space`.** Taking the space of a pro-étale object retains the empty space and all components of constant split covers. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_space_positive* (computation) — The explicit constant two-sheeted object has exactly two points after applying the functor.
- *AdicSpace_ProEtaleSite_space_degenerate* (degenerate) — The explicit constant zero-sheeted object has empty space.
- *AdicSpace_ProEtaleSite_space_negative* (non-example) — The three-sheeted object does not collapse to a one-point space.

**`AdicSpace.ProEtaleSite.const`.** The constant site functor retains finite étale fibres and morphisms. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_const_positive* (computation) — The constant two-sheeted cover has two points.
- *AdicSpace_ProEtaleSite_const_degenerate* (degenerate) — The constant empty cover has no points.
- *AdicSpace_ProEtaleSite_const_negative* (non-example) — The site functor separates the three-cycle from its inverse.

**`AdicSpace.ProEtaleSite.printedTopology`.** The printed pro-étale covering condition gives the stated covering sieves on constant split finite covers. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_printedTopology_positive* (computation) — The two-to-one split cover generates a covering sieve.
- *AdicSpace_ProEtaleSite_printedTopology_degenerate* (degenerate) — The empty sieve covers the empty object.
- *AdicSpace_ProEtaleSite_printedTopology_negative* (non-example) — The empty-to-one-sheeted map generates no covering sieve; the topology is not indiscrete.

**`AdicSpace.ProEtaleSite.qcTopology`.** The corrected quasi-compact covering condition covers every point and admits the empty sieve only over the empty split object. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_qcTopology_positive* (computation) — The two-to-one split cover generates a covering sieve.
- *AdicSpace_ProEtaleSite_qcTopology_degenerate* (degenerate) — The empty sieve covers the empty object.
- *AdicSpace_ProEtaleSite_qcTopology_negative* (non-example) — The empty-to-one-sheeted map generates no covering sieve; the topology is not indiscrete.

**`AdicSpace.ProEtaleSite.nuPush`.** Direct image from the pro-étale site evaluates finite constant sheaves on the connected étale base. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_nuPush_positive* (computation) — The image of the constant two-element sheaf has exactly two global sections.
- *AdicSpace_ProEtaleSite_nuPush_degenerate* (degenerate) — The image of the empty constant sheaf has no global sections on the nonempty connected base.
- *AdicSpace_ProEtaleSite_nuPush_negative* (non-example) — The image of the constant three-element sheaf is not terminal; the functor cannot collapse all sheaves to one value.

**`AdicSpace.ProEtaleSite.nuPull`.** Inverse image to the pro-étale site preserves the empty constant sheaf and the distinct sections of finite constant sheaves. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_nuPull_positive* (computation) — The image of the constant two-element sheaf has exactly two global sections.
- *AdicSpace_ProEtaleSite_nuPull_degenerate* (degenerate) — The image of the empty constant sheaf has no global sections on the nonempty connected base.
- *AdicSpace_ProEtaleSite_nuPull_negative* (non-example) — The image of the constant three-element sheaf is not terminal; the functor cannot collapse all sheaves to one value.

**`AdicSpace.ProEtaleSite.IsCoherentBasisObject`.** A coherent basis object has an affine presentation over an affinoid open and is quasi-compact. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_IsCoherentBasisObject_positive* (computation) — The constant split two-sheeted Q₂ cover is an affine coherent basis object.
- *AdicSpace_ProEtaleSite_IsCoherentBasisObject_degenerate* (degenerate) — The empty affine cover is a coherent basis object.
- *AdicSpace_ProEtaleSite_IsCoherentBasisObject_negative* (non-example) — The constant open unit disc is not a coherent basis object because it is non-quasi-compact.

**`AdicSpace.ProEtaleSite.IsQuasiCompactMap`.** Quasi-compact maps preserve quasi-compactness after base change to a quasi-compact object. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_IsQuasiCompactMap_positive* (computation) — The constant split two-sheeted fold is quasi-compact.
- *AdicSpace_ProEtaleSite_IsQuasiCompactMap_degenerate* (degenerate) — The identity of the empty constant object is quasi-compact.
- *AdicSpace_ProEtaleSite_IsQuasiCompactMap_negative* (non-example) — The constant open unit disc inclusion is not quasi-compact; étaleness alone does not imply this predicate.

**`AdicSpace.ProEtaleSite.profiniteObj.section`.** A selected profinite point gives the section with that constant second coordinate. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_profiniteObj_section_positive* (computation) — The section indexed by true has Boolean coordinate true at the Q₂ point.
- *AdicSpace_ProEtaleSite_profiniteObj_section_degenerate* (degenerate) — The section for the one-point profinite space preserves the base coordinate.
- *AdicSpace_ProEtaleSite_profiniteObj_section_negative* (non-example) — The section indexed by true does not have Boolean coordinate false; interchanging the two sections fails.

**The split geometric three-cycle.**
`SplitChecks.threeCycle` is the Spa map of the algebra automorphism
`(Q₂³ → Q₂³), f ↦ (i ↦ f(i+1))`. Its pullback sends the characteristic function of sheet 0
to the characteristic function of sheet 2. Its action on points sends sheet 0 to sheet 1.
This fixes the distinction between the geometric map and its inverse.
For the ring action generated by this algebra automorphism, the convention
`(g·v)(b) = v(g⁻¹·b)` instead sends point 0 to point 2: *inverse_action_three*
checks the actual valuation comap and its agreement with `threeCycle ≫ threeCycle`.

**Checks.**

- *threeCycle_geometric_positive* (computation) — point 0 maps to point 1.
- *threeCycle_geometric_identity* (degenerate) — its third iterate maps point 0 to point 0.
- *threeCycle_geometric_inverse_rejected* (non-example) — point 0 does not map to point 2.

**`AdicSpace.ProEtaleSite.GaloisPresentation.limitAction`.** The limit action of the one-stage split cubic presentation sends sheet 0 to sheet 1 for the generator of `Multiplicative (ZMod 3)`. README only (no Lean declaration).

**Checks.**

- *geometric_galois_action_positive* (computation) — The generator sends sheet 0 to sheet 1.
- *geometric_galois_action_degenerate* (degenerate) — The identity group element leaves sheet 0 fixed.
- *geometric_galois_action_negative* (non-example) — The generator does not send sheet 0 to sheet 2; the inverse-action convention fails.

**`AdicSpace.ProEtaleSite.galoisCover_torsorIso`.** The torsor isomorphism records the unique group coordinate relating two labelled sheets of the split cubic cover; its inverse sends `(x,g)` to `(x,gx)` ([PH] §5, proof of Lemma 5.6, p. 31). README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_galoisCover_torsorIso_generator_sheet_one* (computation) — The generator sends sheet 0 to sheet 1.
- *AdicSpace_ProEtaleSite_galoisCover_torsorIso_identity_sheet_zero* (degenerate) — The identity group element leaves sheet 0 fixed.
- *AdicSpace_ProEtaleSite_galoisCover_torsorIso_not_inverse_action* (non-example) — The generator does not send sheet 0 to sheet 2; the inverse-action convention fails.

**`AdicSpace.ProEtaleSite.profiniteObj.homEquiv`.** The Hom formula evaluates the continuous profinite coordinate with its given label. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_profiniteObj_homEquiv_boolean_true* (computation) — The inverse of the pair (identity, constant true) has second coordinate true.

- *AdicSpace_ProEtaleSite_profiniteObj_homEquiv_singleton_factor* (degenerate) — A one-point profinite factor has its unique coordinate.

- *AdicSpace_ProEtaleSite_profiniteObj_homEquiv_not_boolean_false* (non-example) — Complementing the Boolean coordinate gives the wrong map.

**`AdicSpace.ProEtaleSite.sliceEquiv`.** The pro-étale slice equivalence agrees with composition over the identity étale object. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_sliceEquiv_split_quadratic* (computation) — The split quadratic object in the slice over the identity has two points.
- *AdicSpace_ProEtaleSite_sliceEquiv_empty_object* (degenerate) — The empty object remains empty in the slice.
- *AdicSpace_ProEtaleSite_sliceEquiv_cycle_fixed_point_free* (non-example) — The three-cycle remains fixed-point-free in the slice; forgetting its arrow action fails.

**`AdicSpace.ProEtaleSite.IsQuasiSeparated`.** Quasi-separatedness tests intersections of quasi-compact objects. The double disc has the actual adic gluing square `DoubleDiscChecks.gluing` and the intersection square `DoubleDiscChecks.overlap`; PH Proposition 3.12(iv), (vi), pp. 17–18. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_IsQuasiSeparated_open_disc* (computation) — The open unit disc is quasi-separated even though it is not quasi-compact.
- *AdicSpace_ProEtaleSite_IsQuasiSeparated_empty_object* (degenerate) — The empty object is quasi-separated.
- *AdicSpace_ProEtaleSite_IsQuasiSeparated_doubled_disc_excluded* (non-example) — Two closed discs glued along the open unit disc are not quasi-separated: their affinoid intersection is not quasi-compact.

**`AdicSpace.ProEtaleSite.IsQuasiSeparatedMap`.** The relative condition is quasi-compactness of the diagonal, so it differs from quasi-compactness of the original map. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_IsQuasiSeparatedMap_open_disc_inclusion* (computation) — The non-quasi-compact open-disc inclusion is quasi-separated.
- *AdicSpace_ProEtaleSite_IsQuasiSeparatedMap_empty_identity* (degenerate) — The identity of the empty object is quasi-separated.
- *AdicSpace_ProEtaleSite_IsQuasiSeparatedMap_doubled_disc_diagonal* (non-example) — The doubled-disc projection has non-quasi-compact diagonal, witnessed by the intersection of its two closed-disc charts.

**`AdicSpace.ProEtaleSite.const_forget`.** The comparison carries component sections to the same labelled points in the constant pro-object. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_const_forget_sheet_one_point* (computation) — The point selected by sheet 1 maps to the labelled point 1 of the constant pro-space.
- *AdicSpace_ProEtaleSite_const_forget_one_sheet_point* (degenerate) — On the one-sheeted object the sole point maps to its normalized valuation.
- *AdicSpace_ProEtaleSite_const_forget_not_sheet_two* (non-example) — Sheet 1 does not become sheet 2; a rotated comparison fails.

**`AdicSpace.ProEtaleSite.galoisCover_descent`.** Descent for the split cubic Galois cover retains the labelled sections of representable sheaves. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_galoisCover_descent_sheet_one_section* (computation) — The section selecting sheet 1 descends to the constant sheet-1 map on the cubic torsor.
- *AdicSpace_ProEtaleSite_galoisCover_descent_identity_section* (degenerate) — For the one-point represented sheaf, the identity section pulls back to the covering map.
- *AdicSpace_ProEtaleSite_galoisCover_descent_not_sheet_two_section* (non-example) — The descended sheet-1 section is not the sheet-2 map; a permutation of sections fails.

**`AdicSpace.ProEtaleSite.nuPull_sections`.** On the constant one-stage presentation of the Q₂ point, a section of the sheaf represented by the split cubic cover is a labelled sheet. The inverse colimit comparison returns the pullback of that sheet through the adjunction unit. PH Lemma 3.16, pp. 19–20, and Corollary 3.17(i), p. 20. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_nuPull_sections_sheet_one_unit* (computation) — The colimit generator selecting sheet 1 becomes the unit section selecting sheet 1.

- *AdicSpace_ProEtaleSite_nuPull_sections_constant_sheet_zero* (degenerate) — For the constant diagram, the generator selecting sheet 0 becomes the unit section selecting sheet 0.

- *AdicSpace_ProEtaleSite_nuPull_sections_not_sheet_two_unit* (non-example) — The sheet-1 generator does not become the sheet-2 unit section; a permutation of the colimit labels fails.

### A1.13 profinite G-sets and the pro-finite-étale site

**The sites of finite and profinite G-sets.** (*profinite-g-sets-site*) Let `G` be a topological
group. The definitions below make sense for every `G`; every theorem about them takes `G`
profinite (compact, Hausdorff and totally disconnected), the case of [PH]. `G-fsets` is the
category of finite discrete sets with continuous `G`-action, with coverings the jointly surjective
families (`FiniteGSet.site`, on Mathlib's `ContAction FintypeCat G`). `G-pfsets` is the category
of profinite sets with continuous `G`-action and continuous `G`-maps (`ProfiniteGSet`, Mathlib's
`ContAction Profinite G`, with underlying spaces and maps `carrier`, `carrierMap`); fibre products
exist and are computed on underlying sets (`ProfiniteGSet.hasPullbacks`). For `G` profinite every
object is a cofiltered limit of finite `G`-sets (quotients by open `G`-invariant equivalence
relations), and `ProfiniteGSet.equivPro : G-pfsets ≃ Pro(G-fsets)`, `Pro(C) = (Ind Cᵒᵖ)ᵒᵖ` over
Mathlib's `Ind`, restricts on finite `G`-sets to the Yoneda embedding
(`FiniteGSet.equivPro_toProfiniteGSet`, through the inclusion `FiniteGSet.toProfiniteGSet`).

A `G`-map `S_1 → S` lies in `surjPullbacks` if it is the pullback of a surjection of finite
`G`-sets along a `G`-map `S → B`; it is *`G`-étale* (`IsGEtale`) if it is the pullback of a map of
finite `G`-sets along some `S → B` with `B` finite; and it is a *`G`-tower* (`IsGTower`) if
`S_1 = lim_{μ<λ} S_μ` with `S_0 = S` and each `S_μ → S_{<μ} := lim_{μ'<μ} S_{μ'}` in
`surjPullbacks`, i.e. its opposite is a Mathlib transfinite composition of opposites of
`surjPullbacks`. Prove `IsGTower.comp`: towers of lengths `λ₂` and `λ₁` compose to a tower of
length `λ₂ + λ₁`. A family `{f_i : S_i → S}` is a (corrected) covering if `S = ⋃ f_i(S_i)` and
each `f_i` is a `G`-tower followed by a `G`-étale map (`ProfiniteGSet.pretopology`); these replace
the printed Definition 3.4 (all jointly surjective families of open maps). They form a
pretopology, for every topological group `G`: an isomorphism is a tower of length one followed by
the identity, which is `G`-étale as the pullback of the identity of the point; base change keeps
towers (fibre products commute with limits) and `G`-étale maps (pasting of pullbacks); and for
transitivity a composite `t' ≫ e' ≫ t ≫ e` (towers `t, t'`, `G`-étale `e, e'`) is brought to the
form tower followed by `G`-étale by `IsGTower.comp` and two facts: (i) a composite of two `G`-étale
maps is `G`-étale, since a `G`-map from `S ×_B A` to a finite `G`-set `B'` is pulled back from the
finite `G`-set of maps `A → B' ⊔ {∗}`; (ii) `e' ≫ t = t'' ≫ e''` for `e'` `G`-étale and `t` a
tower, by transfinite induction on the length of `t`: at a limit stage the classifying map to a
finite `G`-set factors through an earlier stage, the projections of a tower being surjective, and
at a successor stage `e'` followed by the last step is a composite of two `G`-étale maps. The
`G`-étale factor is the reading of the erratum's "similar condition" under which a disjoint union
is covered by its summands. For a topological `G`-module `M`, `F_M(S) := Hom_cont,G(S, M)` is a
sheaf of abelian groups on `G-pfsets` (`ProfiniteGSet.sheafF`: members of a covering are open
maps, a tower being a limit of open surjections, so continuity glues) with the value equivalence
`sheafF_apply` and the laws `sheafF_apply_add` (pointwise addition) and `sheafF_apply_map`
(restriction by precomposition). For trivial `G` the forgetful functor is an equivalence
`ProfiniteGSet.forgetTrivial : G-pfsets ≃ Profinite`. For `G` profinite and a closed subgroup `H`,
normal or not, `ProfiniteGSet.quotient G H` is `G/H` with left translation
(`totallyDisconnectedSpace_quotient`; Tau Ceti's `QuotientGroup.instTotallyDisconnectedSpace`
covers closed normal subgroups only), `quotientMap` is `gH ↦ gK` for `H ⊆ K`, `pt = G/G`,
`regular = G/1` and `toPt : G → pt`. The inclusion of `G-fsets` preserves coverings
(`FiniteGSet.site_le_pretopology`). ([PH] §3, Def. 3.4, p. 13; [PH] §3, proof of Prop. 3.5, p. 14;
[PH] §3, after Lem. 3.6, p. 14; [PH erratum] item (1), p. 1.) *Needs:* DiamondsAndVStacks layer D0
(pro-categories); Mathlib `Profinite`, `ContAction`, `CategoryTheory.Ind`,
`CategoryTheory.Pretopology`, `CategoryTheory.MorphismProperty.transfiniteCompositions`; Tau Ceti
`QuotientGroup.instTotallyDisconnectedSpace`. README only (no Lean declaration).

**Checks.**

- *ProfiniteGSet.test_FM_on_G* (computation) — evaluation at the identity coset is a bijection
  `F_M(G) → M`, with inverse `m ↦ (g ↦ g·m)`, and evaluation at the point is injective on
  `F_M(pt)` with image `M^G` (not `M`). For the trivial action on `M = 𝔽₂` and `G = ℤ/2`, `F_M(G)`
  has two elements, whereas `C(G, M)` has four (*regular_action_two* compares the cardinality
  of the actual `sheafF` value with that of continuous maps from `ProfiniteGSet.regular G`).
- *sheafF_empty* (degenerate) — `F_M(∅)` is a singleton.
- *sheafF_add_values* (computation) — take discrete `G = Multiplicative (ZMod 2)` and
  `M = ZMod 2` with trivial action. Let `x, y ∈ F_M(regular G)` correspond under
  `sheafF_apply` to the constant functions `0, 1`. Evaluation at the identity coset,
  which identifies `F_M(regular G)` with `M`, sends `x + y` to `1` and `y + y` to `0`.
- *sheafF_restriction_values* (computation) — for the same `G` and `M`, restrict the
  section of `F_M(pt G)` represented by the constant function `1` along `toPt G`.
  Its values at the identity coset and at the coset of `Multiplicative.ofAdd 1`
  in `regular G` are both `1`.
- *sheafF_restriction_to_regular* (contravariance) — restricting `x ∈ F_M(pt)` along `G → pt`
  gives the constant function on `G` with value `x(pt)`.
- *ProfiniteGSet.test_summands* (degenerate) — for `G` trivial and profinite `S_1, S_2`, the summand
  inclusions `{S_1 → S_1 ⊔ S_2, S_2 → S_1 ⊔ S_2}` form a covering; the empty family covers the
  empty set.
- *ProfiniteGSet.test_trivial_group* (compatibility) — for `G = 1` the category is equivalent to
  `Profinite`, and every covering family of a profinite set has continuous sections locally on a
  finite clopen cover.
- *ProfiniteGSet.test_nonsplit* (non-example) — for `G = 1` an open continuous surjection of
  profinite sets without continuous section (`Profinite.exists_isOpenMap_surjective_not_split`) is
  not a covering, although it was one for the printed Definition 3.4.
- *ProfiniteGSet.test_G_to_pt* (characterisation) — for every profinite `G`, `{G → pt}` is a
  covering (see *profinite-group-tower*); for `G = ℤ_p` it is the tower with steps
  `ℤ/p^{n+1} → ℤ/p^n`; for every nontrivial `G`, for instance `ℤ/2` acting on itself by
  translation, `G → pt` has no `G`-equivariant section, so coverings need not split equivariantly.
- *finite_gset_identity* (degenerate) — `𝟙_S` lies in `surjPullbacks`, is `G`-étale and is a
  `G`-tower (the pullback of the identity of the point).
- *finite_gset_regular_to_point* (computation) — for finite discrete `G`, `G → pt` lies in
  `surjPullbacks`, is `G`-étale and is a tower with one step.
- *finite_gset_infinite_regular_to_point* (non-example) — for infinite profinite `G` (for instance
  `ℤ_p`), `G → pt` is a `G`-tower but neither `G`-étale nor in `surjPullbacks`: a pullback of a
  map of finite `G`-sets to the point is finite.
- *finite_gset_empty_to_point* (negative control) — `∅ → pt` is `G`-étale but neither in
  `surjPullbacks` nor a tower: towers are surjective.
- *quotient_point* (degenerate: `G/G` is one point), *quotient_regular* (computation: the cosets of
  `g` and `h` in `G/1` agree iff `g = h`), *quotient_map_values* (two-term convention:
  `quotientMap` sends the coset of `g` in `G/H` to the coset of `g` in `G/K`).
- *quotient_map_comp* (composition of towers) — `G/H → G/K → G/L` is a `G`-tower, by
  `IsGTower.comp`, and equals `G/H → G/L` on points.
- *equivPro_finite* (compatibility) — on finite `G`-sets `equivPro` is the Yoneda embedding of
  `G-fsets` into its pro-category (`FiniteGSet.equivPro_toProfiniteGSet`). When formalised, the
  check takes the regular action of discrete `G = ℤ/2` on itself: its image is isomorphic
  to its constant pro-object and has exactly two endomorphisms, the identity and
  translation. Replacing equivariant maps by arbitrary maps would give four.
- *equivPro_empty* (degenerate) — for `G = ℤ/2`, the empty finite action maps to the
  constant empty pro-object. There is no arrow to it from the image of the point.
- *equivPro_trivial* (unfolding; degenerate) — for `G = 1`, `forgetTrivial` and `equivPro` give
  `Profinite ≃ Pro(finite sets)`.
- *equivPro_needs_compact* (non-example) — for `G = ℤ` discrete, the profinite `ℤ`-set
  `ℤ ∪ {∞}` (one-point compactification, translation, `∞` fixed) has only constant `ℤ`-maps to
  finite `ℤ`-sets (such a map is eventually constant, hence fixed by the generator), so it is not
  a cofiltered limit of finite `ℤ`-sets: compactness of `G` is needed for `equivPro`.
  When formalised, the check asserts existence of an actual `ProfiniteGSet (Multiplicative ℤ)`
  with a homeomorphism to `OnePoint ℤ`, pins translation at every integer and at
  infinity, and requires every map to every finite action to be constant. In
  particular such maps cannot separate the distinct points `0` and `∞`.
- *forgetTrivial_inverse_carrier* (computation) — the inverse of `forgetTrivial` sends `T` to a
  profinite set with trivial action homeomorphic to `T`.
- *forget_not_full* (non-example) — for nontrivial `G` the forgetful functor `G-pfsets ⥤ Profinite`
  is not full: a constant map `pt → G` is continuous but not a `G`-map.
- *finiteGSet_site_surjection* (computation), *finiteGSet_site_empty* (degenerate),
  *finiteGSet_site_nonempty* (non-example) — in `FiniteGSet.site` a surjective `G`-map generates a
  covering sieve; the empty sieve covers the empty `G`-set and no nonempty one.
- *toProfiniteGSet_finite* (computation), *toProfiniteGSet_fullyFaithful* (compatibility),
  *toProfiniteGSet_not_essSurj* (non-example) — `FiniteGSet.toProfiniteGSet` has finite values, is
  fully faithful, and for infinite profinite `G` misses `G` itself.

**Open surjections of profinite G-sets.** (*open-surjection-profinite-structure*) Let `S → S'` be
an open surjective map in `G-pfsets`, no covering notion being involved.
`ProfiniteGSet.exists_limit_of_isOpenMap_surjective` expresses it as a small cofiltered limit
in the slice over `S'` of maps `T_i → S'`, each a pullback `A_i ×_{B_i} S' → S'` of a
surjection `A_i → B_i` of finite `G`-sets. Thus `S → S'` is a cofiltered limit of such pullbacks,
but by *transfinite-tower-splitting* not necessarily a `G`-tower ([PH] §3, Lem. 3.6 and its proof,
p. 14). *Needs:* *profinite-g-sets-site*; Mathlib `Profinite`. README only (no Lean declaration).

**Checks.**

- *openSurj_product_finite* — for `G = 1` and `S = S' × F` with `F` finite, `T_i = S` for all large
  `i`.
- *openSurj_ribes_zalesskii* (non-example) — the Ribes–Zalesskii [RZ] open surjection has such a
  presentation but no section.

**Sections over free G-sets are exact.** (*free-g-profinite-sections-exact*) Let `G` be profinite
and `S ∈ G-pfsets` with free `G`-action. Then `S ≅ T × G` as `G`-spaces for the profinite set
`T = S/G` with trivial action (`ProfiniteGSet.prodEquiv_of_free`): `S → S/G` is a `G`-tower, with
stages `S/N_μ` along the filtration of *profinite-group-tower*, so it has a continuous section by
*transfinite-tower-splitting*; the false printed 3.7(i) is not used. For `S = G` regarded as a free
`H`-set by left translation, `H ⊆ G` a closed subgroup, the splitting `G ≅ (H\G) × H` is Tau Ceti
`exists_continuous_rightCosetFactorization`. Moreover `F ↦ F(S)` from abelian sheaves on `G-pfsets`
(corrected coverings) to abelian groups is exact (`ProfiniteGSet.sections_exact_of_free`: it
preserves finite limits and finite colimits): a section of a quotient sheaf lifts on a finite
corrected covering of `S`, whose members split `G`-equivariantly over a finite clopen partition
because on `S/G` they become towers followed by clopen immersions ([PH] §3, Prop. 3.7(ii) and its
proof, pp. 14–15; [PH erratum] item (1), p. 1). The general free `G`-set and the exactness are the
content here. *Needs:* *profinite-g-sets-site*, *profinite-group-tower*,
*transfinite-tower-splitting*; Tau Ceti `exists_continuous_rightCosetFactorization`. README only (no Lean declaration).

**Checks.**

- *freeSections_Zp* — for `G = ℤ_p` and `S = G`, `F ↦ F(G)` is exact; this is the input for
  `H^i(pt, F_M) = H^i_cont(ℤ_p, M)` in the étale-cohomology roadmaps.
- *freeSections_trivial_group* (degenerate) — for `G = 1` every `S` is free, with `T = S`.
- *sections_exact_needs_free* (non-example) — for nontrivial finite discrete `G`, the point is not
  free and `F ↦ F(pt)` is not exact: the augmentation `F_{ℤ[G]} → F_ℤ` is an epimorphism of sheaves
  (surjective on sections over the covering `G → pt`), but on `pt` it is `ℤ[G]^G → ℤ`, with image
  `|G|ℤ`.

The input from the finite étale site is the Galois-category theorem of A1.8
(see *finite-etale-galois-category*): for `X` nonempty and connected with a geometric point `x̄`
(see *etale-site-and-geometric-points*), `X_fét` with `F_x̄ = Hom_X(x̄, −)` is a Galois category
(Mathlib `GaloisCategory`, `PreGaloisCategory.FiberFunctor`), `π_1(X, x̄) := Aut F_x̄` is profinite,
and `F_x̄` induces `X_fét ≃` finite continuous `π_1(X, x̄)`-sets (Mathlib
`PreGaloisCategory.functorToContAction`) ([PH] §3, before Def. 3.4, p. 13).

**The pro-finite-étale site with corrected coverings.** (*pro-finite-etale-site-corrected*)
`X_profét` is the category `pro-X_fét := Pro(X_fét)`, a full subcategory of `pro-X_ét`, with
`|U| = lim |U_i|`. If `X` has finitely many connected components (for instance `X`
quasi-compact, by *etale-locally-finitely-many-components*, or connected), it is also a full
subcategory of `X_proét`: every `U_i` then has finitely many open and closed subsets, so for each
`i` the images of the transition maps into `U_i` (open and closed, finite étale maps being open
and closed) have a smallest member `U_i^∞`, the transitions restrict to finite étale surjections
`U_{i'}^∞ → U_i^∞`, and `U ≅ lim_i U_i^∞` is a pro-étale presentation over `X`
(`ProFiniteEtaleSite.isProEtale_of_finite_components`). Without this hypothesis an object of
`pro-X_fét` can fail to be pro-étale over `X` (check
*ProFiniteEtaleSite.test_infinitely_many_components*). A family `{f_i : U_i → U}` is a covering if
`|U| = ⋃ f_i(|U_i|)` and each `f_i` factors as a pro-finite-étale tower `U_i → W_i` (steps pullbacks
of finite étale surjections of `X_fét`; *finite-etale-tower*) followed by a morphism `W_i → U` that
is the pullback of a morphism of `X_fét` along some `U → V_0` with `V_0 ∈ X_fét`. These coverings
form a pretopology and replace the printed Definition 3.3 (families of open morphisms); the
erratum states the condition with the tower only, which read literally would exclude the covering
of a disjoint union by its summands ([PH] §3, Def. 3.3, p. 13; [PH erratum] item (1), p. 1; [PH]
§5, proof of Lem. 5.6, p. 31). In `AdicSpace`, define `ProFiniteEtaleSite` (the category),
`ProFiniteEtaleSite.topology`, `ProFiniteEtaleSite.const` (`X_fét ⥤ X_profét`), `ProFiniteEtaleSite.space` and
`ProFiniteEtaleSite.toProEtale` (for `X` with finitely many connected components, the fully
faithful inclusion `X_profét ⥤ X_proét`); prove
`ProFiniteEtaleSite.isProEtale_of_finite_components`, `ProFiniteEtaleSite.isCovering_of_isFetTower` (pro-finite-étale towers cover) and
`ProFiniteEtaleSite.isCovering_summands` (the summand inclusions of a finite disjoint union cover).
*Needs:* *finite-etale-site*, *pro-etale-morphism*, *finite-etale-tower*,
*pro-etale-site-corrected*, *corrected-covers-pretopology*,
*etale-locally-finitely-many-components*; DiamondsAndVStacks layer D0; Mathlib
`CategoryTheory.Pretopology`. README only (no Lean declaration).

**Checks.**

- *ProFiniteEtaleSite.test_field* (computation) — for `X = Spa(ℚ_p, ℤ_p)`,
  `X_profét ≃ Gal(ℚ̄_p/ℚ_p)-pfsets`,
  and `lim_n Spa(ℚ_p(μ_{p^n}), ℤ_p[μ_{p^n}])` corresponds to `Gal(ℚ_p(μ_{p^∞})/ℚ_p) ≅ ℤ_p^×` with
  its translation action; for `X = Spa(K, K⁺)`, `X_profét ≃ Gal(K^sep/K)-pfsets`.
- *ProFiniteEtaleSite.test_alg_closed* (degenerate) — for `X = Spa(C, C⁺)` with `C` algebraically closed,
  `X_fét` is the category of finite disjoint unions of copies of `X` and `X_profét ≃ Profinite`.
- *ProFiniteEtaleSite.test_summands* (non-example) — the summand inclusions `X → X ⊔ X` form a covering of
  `X_profét`; under the literal reading of the erratum (each covering map a tower, hence surjective)
  they would not, which is why the second factor is allowed.
- *ProFiniteEtaleSite_topology_inclusion* (compatibility) — for `X` with finitely many connected
  components, every covering of `X_profét` is a covering of `X_proét`: pullbacks of morphisms of
  `X_fét` are finite étale, hence étale.
- *ProFiniteEtaleSite.test_infinitely_many_components* (non-example) — for `S = Spa(ℚ₂, ℤ₂)`,
  `X = ⊔_{m ≥ 0} S` and `V_n = ⊔_{m ≥ n} S` (open and closed, so finite étale over `X` of degree
  `0` or `1` on each summand), `V = lim_n V_n` is an object of `pro-X_fét` with every stage
  nonempty, hence with no map to `c(∅)` and not initial, while `|V| = ⋂_n V_n = ∅`. A pro-étale
  presentation with empty limit space has empty stages beyond its threshold, so `V` is not in
  `X_proét`; the images `U_i^∞` above do not stabilise, as each `V_n` has infinitely many open and
  closed subsets.

**Pro-finite-étale objects are profinite π_1-sets.** (*profinite-etale-galois-sets*) For `X`
connected with a geometric point `x̄`, the functor `Y = lim Y_i ↦ S(Y) := lim_i F_x̄(Y_i)` is an
equivalence of sites `X_profét ≃ π_1(X, x̄)-pfsets` for the corrected coverings on both sides
([PH] §3, Prop. 3.5 and its proof, p. 14; [PH] §3, before Def. 3.4, p. 13). For `X = Spa(K, O_K)`
with `K` complete discretely valued, `X_profét ≃ G_K-pfsets` and `Spa(K̂^sep) ↦ G_K`
(check *galoisSets_field*). *Needs:* *finite-etale-galois-category*, *pro-finite-etale-site-corrected*,
*profinite-g-sets-site*; DiamondsAndVStacks layer D0. README only (no Lean declaration).

**Open equals pro-étale on X_profét; the morphism of sites.**
(*proetale-profinite-etale-morphism-of-sites*) Let `X` have finitely many connected components,
so that `X_profét ⊂ X_proét` (*pro-finite-etale-site-corrected*). (a) Under this fully faithful
inclusion, a morphism `f : U → V` of `X_profét` is open on underlying spaces iff it is
pro-étale. (b) The inclusion preserves fibre products (those of `pro-X_fét` are levelwise, hence
fibre products of `pro-X_ét` lying in `X_proét`) and sends coverings of `X_profét` to
coverings of `X_proét`; hence it defines a morphism of sites `X_proét → X_profét` (Mathlib
`CategoryTheory.Functor.IsContinuous`). The printed consequence "the notions of coverings
coincide" is not asserted for the corrected coverings and is not used ([PH] §3, Lem. 3.11, p. 17).
Scholze states the lemma for every locally noetherian `X`; its proof passes through the
connected comparison of Prop. 3.5, and the hypothesis on components is needed for the inclusion
itself (check *ProFiniteEtaleSite.test_infinitely_many_components*).
For `X = Spa(K, O_K)` with `K` `p`-adic, the quasi-compact objects of `X_proét` are exactly the
objects of `X_profét`: a quasi-compact étale `X`-space is a finite disjoint union of
`Spa(L_i, O_{L_i})`, hence finite étale, so a pro-étale presentation of a quasi-compact object
has finite étale stages beyond its threshold; thus `X_proét^qc = X_profét`, the two sites have
the same topos (*proetale-quasicompactness-detection*, `X` quasi-separated) and the morphism of
sites is an equivalence on quasi-compact objects (check *morphismOfSites_field*). The infinite disjoint
union `⊔_ℕ X` is étale, hence pro-étale, over `X` but not pro-finite-étale (its underlying
space `ℕ` is not compact), so `X_proét ≠ X_profét` as categories (check *morphismOfSites_field_coprod*).
*Needs:*
*pro-finite-etale-site-corrected*, *pro-etale-site-corrected*, *pro-etale-maps-open*,
*pro-etale-base-change*, *pro-etale-finite-limits*, *finite-etale-tower*; Mathlib
`CategoryTheory.Functor.IsContinuous`. README only (no Lean declaration).


**`AdicSpace.ProFiniteEtaleSite.const`.** The constant pro-finite-étale embedding retains the ordered finite source and its permutations. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProFiniteEtaleSite_const_positive* (computation) — The constant one-sheeted to two-sheeted Hom set has exactly two elements.
- *AdicSpace_ProFiniteEtaleSite_const_degenerate* (degenerate) — The constant empty cover has exactly one arrow to the constant two-sheeted cover.
- *AdicSpace_ProFiniteEtaleSite_const_negative* (non-example) — The three-cycle and its inverse remain distinct.

**`AdicSpace.ProFiniteEtaleSite.toProEtale`.** The inclusion into the pro-étale site preserves the split finite stages and their structural arrows. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProFiniteEtaleSite_toProEtale_positive* (computation) — The constant two-sheeted finite étale cover has two points after applying the functor.
- *AdicSpace_ProFiniteEtaleSite_toProEtale_degenerate* (degenerate) — The constant empty finite étale cover has empty image space.
- *AdicSpace_ProFiniteEtaleSite_toProEtale_negative* (non-example) — The three-cycle moves every point, excluding a trivial action after the comparison.

**`AdicSpace.ProFiniteEtaleSite.space`.** The space of a constant pro-finite-étale object has precisely the labelled points of the corresponding split spectrum. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProFiniteEtaleSite_space_positive* (computation) — The constant two-sheeted finite étale cover has two points after applying the functor.
- *AdicSpace_ProFiniteEtaleSite_space_degenerate* (degenerate) — The constant empty finite étale cover has empty image space.
- *AdicSpace_ProFiniteEtaleSite_space_negative* (non-example) — The three-cycle moves every point, excluding a trivial action after the comparison.

**`AdicSpace.ProFiniteEtaleSite.finiteSurjPullbacks`.** The pro-finite-étale generating steps retain the surjectivity condition on finite covers. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProFiniteEtaleSite_finiteSurjPullbacks_positive* (computation) — The two-to-one split cover is a generating step.
- *AdicSpace_ProFiniteEtaleSite_finiteSurjPullbacks_degenerate* (degenerate) — The empty identity is a generating step.
- *AdicSpace_ProFiniteEtaleSite_finiteSurjPullbacks_negative* (non-example) — The empty-to-one-sheeted map is not a step despite being finite étale.

**`AdicSpace.ProFiniteEtaleSite.IsFetTower`.** Transfinite towers are built from finite surjective steps, so empty fibres over a nonempty target are excluded. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProFiniteEtaleSite_IsFetTower_positive* (computation) — The two-to-one split finite cover is a tower of one step.
- *AdicSpace_ProFiniteEtaleSite_IsFetTower_degenerate* (degenerate) — The identity tower on the empty object is allowed.
- *AdicSpace_ProFiniteEtaleSite_IsFetTower_negative* (non-example) — The finite empty-to-one-sheeted map cannot be a tower because it is not surjective.

**`AdicSpace.ProFiniteEtaleSite.pretopology`.** Covering families combine finite-surjective towers with étale maps and jointly meet every point. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProFiniteEtaleSite_pretopology_positive* (computation) — The singleton two-to-one split cover covers the one-sheeted object.
- *AdicSpace_ProFiniteEtaleSite_pretopology_degenerate* (degenerate) — The empty family covers the empty object.
- *AdicSpace_ProFiniteEtaleSite_pretopology_negative* (non-example) — The empty-to-one-sheeted arrow is finite étale but does not cover the nonempty target.

**`AdicSpace.ProFiniteEtaleSite.topology`.** The topology generated by corrected covering families accepts their generated sieves and rejects the empty sieve on a nonempty split object. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProFiniteEtaleSite_topology_positive* (computation) — The singleton two-to-one split cover covers the one-sheeted object.
- *AdicSpace_ProFiniteEtaleSite_topology_degenerate* (degenerate) — The empty family covers the empty object.
- *AdicSpace_ProFiniteEtaleSite_topology_negative* (non-example) — The empty-to-one-sheeted arrow is finite étale but does not cover the nonempty target.

**`AdicSpace.ProFiniteEtaleSite.toProEtale_const`.** The inclusion of pro-finite-étale objects commutes with constants and their labelled sections. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProFiniteEtaleSite_toProEtale_const_sheet_one_point* (computation) — The inclusion comparison preserves sheet 1 after passage to the underlying adic point.
- *AdicSpace_ProFiniteEtaleSite_toProEtale_const_one_sheet_point* (degenerate) — The one-sheeted object gives its unique point.
- *AdicSpace_ProFiniteEtaleSite_toProEtale_const_not_sheet_two* (non-example) — The same comparison does not send sheet 1 to sheet 2.

**`AdicSpace.ProFiniteEtaleSite.IsEtale`.** Étale arrows are pulled back from finite levels. `CantorChecks.comparison` identifies the Boolean-cube inverse limit with the profinite Cantor object over the Q₂ point; PH Definition 3.9, p. 15, and Lemma 3.11, p. 17. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProFiniteEtaleSite_IsEtale_finite_fold* (computation) — The two-sheeted finite fold is étale.
- *AdicSpace_ProFiniteEtaleSite_IsEtale_empty_map* (degenerate) — The empty-to-point finite map is étale, despite being nonsurjective.
- *AdicSpace_ProFiniteEtaleSite_IsEtale_cantor_projection_excluded* (non-example) — The Cantor-to-point projection is not étale; allowing an arbitrary profinite fibre would incorrectly accept it.

### A1.14 coherence and change of base field

**Coherence of the pro-étale topos.** (*proetale-coherence*) (i) If `U = lim U_i → X` is a
pro-étale presentation with all `U_i` affinoid, `U` is a quasi-compact object of `X_proét` (every
covering sieve contains a finite covering family; fewer coverings only make this easier). (ii) The
class `B_X` of such `U` for which `U → X` factors through an affinoid open of `X` is generating.
For `U, V, W ∈ B_X` and maps `U → W ← V`, the fibre product belongs to `B_X`.
This does not assert closure under products over arbitrary `X`: two affinoid opens in a
non-quasi-separated `X` can have non-quasi-compact intersection. (iii) Every member of `B_X` is coherent (quasi-compact and
quasi-separated) and `Sh(X_proét)` is an algebraic topos in the sense of DiamondsAndVStacks D0.17
(SGA 4 VI 2.3) ([PH] §3, Prop. 3.12(i)–(iii) and proof of (iii), pp. 17–18). The Kummer tower over
the torus lies in `B_X` and is coherent (check *coherence_kummer*). *Needs:* *pro-etale-site-corrected*,
*pro-etale-base-change*, *pro-etale-finite-limits*, *corrected-covers-pretopology*;
DiamondsAndVStacks layer D0 (cofiltered limits of spectral spaces, algebraic topoi);
AdicSpacesPartII layer R0; Tau Ceti `TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`. README only (no Lean declaration).

**Quasi-compactness is detected on underlying spaces.** (*proetale-quasicompactness-detection*)
(iv) `U ∈ X_proét` is quasi-compact (resp. quasi-separated) iff `|U|` is. (v) If `U → V` is an
inverse limit of finite étale surjections, `U` is quasi-compact (resp. quasi-separated) iff `V` is.
(vi) A morphism `f` of `X_proét` is quasi-compact (resp. quasi-separated) iff `|f|` is. (vii)
`X_proét` is quasi-separated (resp. coherent) iff `|X|` is. If `X` is quasi-separated, the full
subcategory `X_proét^qc` of quasi-compact objects with the induced coverings has the same topos as
`X_proét` (Mathlib `CategoryTheory.Functor.IsDenseSubsite`) ([PH] §3, Prop. 3.12(iv)–(vii) and
after Prop. 3.12, pp. 17–18). For `X` affinoid `X_proét` is coherent; for the open unit disc it is
not quasi-compact (check *qcDetection_affinoid_disc*). *Needs:* *proetale-coherence*,
*pro-etale-site-corrected*, *pro-etale-quasicompact-opens*; DiamondsAndVStacks layer D0; Mathlib
`CategoryTheory.Functor.IsDenseSubsite`. README only (no Lean declaration).

**Étale descent along an algebraic extension.** (*etale-descent-along-algebraic-extension*) Let
`K` be a complete nonarchimedean field with an open valuation subring `K⁺`, `X` a quasi-compact
quasi-separated adic space locally of finite type over `Spa(K, K⁺)` (the Foundations of adic spaces
roadmap (AdicSpaces), layer 5), `L/K` a separable algebraic extension with finite subextensions
`L_i`, `L_i⁺` and `L⁺` the integral closures of `K⁺`,
`X_{L_i} := X ×_{Spa(K,K⁺)} Spa(L_i, L_i⁺)` and
`X_{L̂} := X ×_{Spa(K,K⁺)} Spa(L̂, L̂⁺)`; this is the setting
in which `X_{L̂}` is locally noetherian.
Then (a) `|X_{L̂}| → lim_i |X_{L_i}|` is a homeomorphism; (b) for qcqs `U_i, U'_i` étale over
`X_{L_i}`, `Hom_{X_{L̂}}(U_i ×_{X_{L_i}} X_{L̂}, U'_i ×_{X_{L_i}} X_{L̂}) = colim_{j≥i} Hom_{X_{L_j}}(U_i ×_{X_{L_i}} X_{L_j}, U'_i ×_{X_{L_i}} X_{L_j})`;
(c) every qcqs étale `X_{L̂}`-space is `U_i ×_{X_{L_i}} X_{L̂}` for some `i` and qcqs étale
`U_i → X_{L_i}`. Hence base change is an equivalence
`2-colim_i (X_{L_i})_{ét,qcqs} ≃ (X_{L̂})_{ét,qcqs}`,
proved through standard étale presentations with polynomial equations, their stability under
perturbation of coefficients, and perturbation of rational subsets ([PH] §3, before Prop. 3.15,
p. 19, where the comparison is asserted to be immediate; [H93] §3, Prop. 3.9, p. 468). *Needs:*
*etale-site*; AdicSpacesPartII layer R0 (fibre products, étale structure, Tate norms); Tau Ceti
`TauCeti.ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`. README only (no Lean declaration).

**Checks.**

- *etaleDescent_kummer_cyclotomic* — `X = Spa(ℚ_p⟨T^{±1}⟩, ℤ_p⟨T^{±1}⟩)`, `L = ℚ_p(μ_{p^∞})`: the Kummer
  cover `T = S^p` over `X_{L̂}` is the base change of the same cover over `ℚ_p`.
- *etaleDescent_krasner* — for `X = Spa(K, K°)` this is Krasner's lemma: finite separable
  `L̂`-algebras come from finite separable `L_i`-algebras.

**Change of base field.** (*proetale-field-extension-slice*) With `K, K⁺, L/K, L_i` as above and
`X` locally of finite type over `Spa(K, K⁺)` (not necessarily qcqs), let
`X_L := lim_i X_{L_i} ∈ X_proét`, a pro-finite-étale object (the `X_{L_i}` are finite étale over
`X` with finite étale surjective transitions). Let `B_{L̂} ⊂ X_{L̂,proét}` be the full subcategory
of objects with a pro-étale presentation `lim_j V_j` by qcqs `V_j` étale over `X_{L̂}`, and
`B_L ⊂ X_proét/X_L` (slice topology, Mathlib `GrothendieckTopology.over`) the full subcategory of
objects whose underlying object has a pro-étale presentation by qcqs objects of `X_ét`, each with
the topology induced from its site (Mathlib `Functor.inducedTopology`). Then (a)
`lim_j V_j ↦ lim_{(i,j)} V_{j,i}`, with `V_{j,i} → X_{L_i}` the descent of `V_j` (see
*etale-descent-along-algebraic-extension*), is an equivalence `B_{L̂} ≃ B_L` identifying the
induced topologies: on Hom sets it is the Hom formula for pro-objects combined with the descent of
morphisms between qcqs étale objects, and on an object `c(V_j)` it is the pullback
`V_{j,i} ×_{X_{L_i}} X_L` along the stage projection; (b) every object of either site is covered
by objects with affinoid stages (*proetale-coherence* (ii)), so both inclusions are dense subsites
(Mathlib `Functor.IsDenseSubsite`), and (a) gives an equivalence of topoi
`Sh(X_{L̂,proét}) ≃ Sh(X_proét/X_L)`. For `L/K` finite, `X_L` is the constant object of the étale
`X`-space `X_{L̂}` and the equivalence extends to the whole sites: it is *proetale-slice* with
`V = X_L`. For infinite `L/K` no equivalence of the underlying categories of the two sites is
asserted, and non-quasi-compact objects are compared only through their sheaves: representable
presheaves of pro-objects need not be sheaves, and arrows given on the members of an infinite
covering need not glue (check *fieldSlice_raw_hom_not_sheaf*). The hypothesis *locally of finite
type over K* replaces Scholze's *locally noetherian*, for which `X_{L̂}` need not be locally
noetherian ([PH] §3, before Prop. 3.15 and Prop. 3.15, p. 19; [PH] §3, Prop. 3.2, p. 13, for the
Hom formula). *Needs:* *etale-descent-along-algebraic-extension*, *proetale-slice*,
*pro-etale-site-corrected*, *proetale-coherence*, *pro-finite-etale-site-corrected*; Mathlib
`CategoryTheory.GrothendieckTopology.over`, `CategoryTheory.Functor.inducedTopology`,
`CategoryTheory.Functor.IsDenseSubsite`. README only (no Lean declaration).

**Checks.**

- *fieldSlice_torus_cyclotomic* — `X = Spa(ℚ_p⟨T^{±1}⟩, ℤ_p⟨T^{±1}⟩)`, `L = ℚ_p(μ_{p^∞})`:
  `B_{L̂} ≃ B_L`, the two topoi agree, and the Kummer–cyclotomic tower over `X_{L̂}` (affinoid
  stages) corresponds to `X̃ ×_X X_L`.
- *fieldSlice_unramified* — `X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, `L = ℚ_p^unr` (the maximal unramified
  extension, with `L_i/ℚ_p` the unramified extension of degree `i!`): `L̂` is discretely valued, so not perfectoid, `X_{L̂}` is the disc
  over `ℚ̂_p^unr`, `X_L = lim_i X_{L_i}` is a pro-finite-étale `Ẑ`-torsor over `X`, and
  `Sh(X_{L̂,proét}) ≃ Sh(X_proét/X_L)`; perfectoidness of `L̂` plays no role in the statement.
- *fieldSlice_separable_closure* — `X = Spa(K, K°)`, `K` discretely valued, `L = K^sep`: on
  quasi-compact objects `X_{L̂,proét} ≃ X_proét/X_{K^sep} ≃ (G_K-pfsets)/G_K ≃ Profinite`, matching
  `X_{L̂} = Spa(Ĉ, O_Ĉ)` for `Ĉ` the completed separable closure.
- *fieldSlice_raw_hom_not_sheaf* (non-example) — take `L = K = ℚ₂`, so that the comparison is the
  identity of `X_proét`, and `X = S = Spa(ℚ₂, ℤ₂)`. Let `U = lim_n U_n` with
  `U_n = ⊔_{m ≥ 1} ⊔_{a ∈ {0,1}^n} S`, the transitions forgetting the last digit of `a` and keeping
  `m` (finite étale surjective of degree two), so `U ∈ X_proét`. Its summands `U^(m)`, pulled back
  from the `m`-th open and closed piece of `U_0`, form an étale covering of `U` with empty pairwise
  fibre products. The maps `U^(m) → c(S ⊔ S)` that read digit `m` of `a`, defined from stage `m`
  on, are a matching family for `W ↦ Hom(W, c(S ⊔ S))` with no amalgamation: by the Hom formula
  every `U → c(S ⊔ S)` factors through a single `U_n`, and on `U^(m)` with `m > n` it cannot
  separate two digit strings that differ only in digit `m`. So this representable presheaf is not
  a sheaf on `X_proét`.


**The identity two-adic field system.**
`FieldBaseChangeSystem.twoadicIdentity` has base and completed pair `(Q₂,Z₂)`, the one-object
index category, identity field maps and identity finite étale stages. Its completed fibre
product is the base space with both projections equal to the identity.

**Checks.**

- *fieldSystem_identity_extension* (computation) — the extension map is the identity of the two-adic Huber pair.
- *fieldSystem_identity_completed* (degenerate) — the completed first projection is the identity of Spa(Q₂,Z₂).
- *fieldSystem_identity_stage* (computation) — the only stage projection is the identity.

**`AdicSpace.FieldBaseChangeSystem`: completion of the algebraic closure.**
`CompletionChecks.system` has base Q₂, complete field C₂, and index category the opposite
of the finite intermediate fields in the fixed algebraic closure of Q₂. Each stage has the
finite-module topology and the integral closure of Z₂ as its plus ring. The transition maps
are inclusions. The map from the completed field spectrum is the actual Spa map of Q₂ → C₂;
[PH] Proposition 3.15, p. 19. README only (no Lean declaration).

**Checks.**

- *proper_completion_positive* (computation) — The stage Q₂(√2) maps its labelled root to the same root in C₂.
- *proper_completion_degenerate* (degenerate) — For the one-stage identity field system, the completed pair is Q₂ itself and the stage projection is the identity.
- *proper_completion_negative* (non-example) — The image of √2 in C₂ is not in the image of Q₂; the identity field system cannot replace this system.

**`AdicSpace.FieldBaseChangeSystem.stageMap`.** Stage maps retain the specified finite-field embeddings into the completion on global functions. README only (no Lean declaration).

**Checks.**

- *AdicSpace_FieldBaseChangeSystem_stageMap_quadratic_root* (computation) — Pulling the labelled square root of 2 from the quadratic stage to C₂ gives that root.
- *AdicSpace_FieldBaseChangeSystem_stageMap_identity_stage* (degenerate) — The one-stage identity field system has identity stage projection.
- *AdicSpace_FieldBaseChangeSystem_stageMap_not_negative_root* (non-example) — The stage projection does not change the root to its negative; inserting the quadratic automorphism fails.

**`AdicSpace.FieldBaseChangeSystem.homDiagram`.** The stage diagram consists of morphisms between the pulled-back étale objects. README only (no Lean declaration).

**Checks.**

- *AdicSpace_FieldBaseChangeSystem_homDiagram_two_maps_from_point* (computation) — At the sole stage of the identity field system, maps from one sheet to two form a two-element set.
- *AdicSpace_FieldBaseChangeSystem_homDiagram_unique_empty_map* (degenerate) — There is exactly one map from the empty cover to the two-sheeted cover.
- *AdicSpace_FieldBaseChangeSystem_homDiagram_four_endomorphisms* (non-example) — The two-sheeted cover has four endomorphisms, not two; substituting points for morphisms fails.

**`AdicSpace.FieldBaseChangeSystem.proObject`.** The pro-object remembers finite-stage field embeddings, beyond its one-point underlying topological space. README only (no Lean declaration).

**Checks.**

- *AdicSpace_FieldBaseChangeSystem_proObject_quadratic_lifts* (computation) — The completed algebraic closure has two lifts to the quadratic stage Q₂(√2).
- *AdicSpace_FieldBaseChangeSystem_proObject_identity_split_lifts* (degenerate) — The identity field system has two maps to the split quadratic cover.
- *AdicSpace_FieldBaseChangeSystem_proObject_identity_no_quadratic_lift* (non-example) — The identity field system has no map to Q₂(√2); replacing every system by the algebraic closure fails.

**`AdicSpace.FieldBaseChangeSystem.homEquiv`.** The morphism comparison keeps track of labelled finite-stage arrows, including its direction. README only (no Lean declaration).

**Checks.**

- *AdicSpace_FieldBaseChangeSystem_homEquiv_cycle_generator* (computation) — In the identity field system, the colimit generator given by the three-cycle pulls back to that three-cycle through the geometric projection.
- *AdicSpace_FieldBaseChangeSystem_homEquiv_identity_generator* (degenerate) — The identity-morphism generator gives the identity after completion.
- *AdicSpace_FieldBaseChangeSystem_homEquiv_not_inverse_cycle* (non-example) — The three-cycle generator does not give its inverse after projection; reversing the comparison fails.

### A1.15 points

**Scholze's point morphisms.** (*proetale-fibre-morphism-of-topoi*) Let `X` be locally noetherian
analytic, `x ∈ X`, `Y_x = Spa(k(x)^, k(x)^+) → X` the canonical morphism from the completed
residue field pair (its image is the set of generisations of `x`, possibly larger than `{x}`;
[PH] §3, footnote 2 to Prop. 3.13, p. 18), and `x̄ = Spa(C, C⁺) → Y_x → X` a geometric point over
the closed point of `Y_x` (`C` the completion of an algebraic closure of `k(x)^`, `C⁺` of arbitrary
rank with `C⁺ ∩ k(x)^ = k(x)^+`; *etale-site-and-geometric-points*). Let
`G_x = Gal(k(x)^sep/k(x)^)` and let `D_x ⊆ G_x` be the decomposition group of `x̄`, the
stabiliser of `C⁺ ∩ k(x)^sep`. Then `D_x` is the closed subgroup of automorphisms of `x̄` over `Y_x`, and
`D_x = G_x` exactly when `k(x)^+` is henselian, in particular at every rank-one point. For `X`
affinoid and `U = lim U_i ∈ X_proét` quasi-compact, presented with quasi-compact `U_i ∈ X_ét`, put
`Φ_x(U) := lim_i Hom_X(x̄, U_i)`, a profinite set on which `D_x` acts continuously by
precomposition. Prove: (a) `Φ_x : X_proét^qc → D_x-pfsets` preserves finite limits and sends
corrected coverings to corrected coverings of *profinite-g-sets-site* (a finite étale surjection
has nonempty fibre over `x̄`; a tower pulled back to `x̄` splits by *geometric-point-etale-split*
(ii) and *transfinite-tower-splitting*; an étale map with a point over the closed point of `x̄` has
a section through it by *geometric-point-etale-split* (iii)), so it is a morphism of sites and
defines a morphism of topoi `i_x : Sh(D_x-pfsets) → Sh(X_proét^qc) ≃ Sh(X_proét)` whose inverse
image is the sheafification of `S ↦ colim_{S → Φ_x(U)} F(U)` (Mathlib
`CategoryTheory.Functor.sheafPullback`); for general `X`, `i_x` is defined through an affinoid
neighbourhood of `x`, independently of it up to canonical isomorphism; (b) when `k(x)^+` is
henselian, `D_x = G_x`, `D_x-pfsets ≃ Y_x,profét` (*profinite-etale-galois-sets*), maps
`S(V) → Φ_x(U)` correspond to maps `V → U` over `Y_x → X` for `V ∈ Y_x,profét`, and so
`i_x : Sh(Y_x,profét) → Sh(X_proét)` is the morphism of [PH] §3, Prop. 3.13, first sentence, p. 18,
with inverse image the sheafification of `V ↦ colim_{V → U} F(U)`, whose construction is sketched
in its proof, p. 19, through the fibre over `x`; at a rank-one point `Φ_x(U)` is the profinite
fibre `S(U ×_X Y_x)`. The morphism is constructed through `Φ_x`, not as a
composite of the base change `Sh(Y_x,proét) → Sh(X_proét)` with a morphism between
`Sh(Y_x,proét)` and `Sh(Y_x,profét)`: restriction along `Y_x,profét ⊆ Y_x,proét` points the wrong
way for such a composite, and at a non-henselian `x` that inclusion is not cocontinuous
(check *fibreTopos_rank_two_not_equivariant*). The conservativity assertion of [PH] Prop. 3.13 (a sheaf
`F` with `i_x^*F = 0` for every `x` vanishes) is not claimed: its printed proof covers by a jointly
surjective family of pro-étale maps, which need not be a corrected covering, and no target of this
roadmap uses it; the final sentence of Prop. 3.13, on points, is deleted by the erratum
([PH erratum] item (2), p. 1). For `X = Spa(K, O_K)` with `K` complete discretely valued and `x`
its point, `Y_x = X`, `D_x = G_K`, `Φ_x` is the equivalence `X_proét^qc ≃ G_K-pfsets` and `i_x` an
equivalence of topoi (check *fibreTopos_field*). *Needs:* *pro-etale-site-corrected*,
*corrected-covers-pretopology*, *proetale-quasicompactness-detection*,
*geometric-point-etale-split*, *etale-site-and-geometric-points*, *transfinite-tower-splitting*,
*profinite-g-sets-site*, *profinite-etale-galois-sets*, *finite-etale-galois-category*;
AdicSpacesPartII layer R0; Mathlib `CategoryTheory.Functor.IsContinuous`,
`CategoryTheory.Functor.sheafPullback`. README only (no Lean declaration).

**Checks.**

- *fibreTopos_rank_two_not_equivariant* (non-example) — `X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, `x` the rank-2
  specialisation of the Gauss point towards `|T| < 1` (check *strictLocalization_gauss_rank_two*),
  `L = k(x)^(α)` with `α² − α = T`, `x̄` supported at `x`. The rank-2 valuation of `k(x)^` has two
  extensions `V_1, V_2` to `L` (`X² − X − T̄` has a root in `𝔽_p⟦T̄⟧` and none in `𝔽_p(T̄)`, the
  check *strictLocalization_gauss_rank_two*), and the nontrivial `σ ∈ Gal(L/k(x)^)` swaps
  them, so `D_x ≠ G_x`. The rational subset `R ⊆ Spa(L, L⁺)` containing `V_1` but not `V_2` is
  étale over `Y_x` and covers it; `Hom_X(x̄, R)` is the single embedding `φ` with
  `φ⁻¹(C⁺) = V_1`, which `σ` does not preserve; and no nonempty pro-finite-étale `Y_x`-space maps
  to `R` over `Y_x`, because a morphism of finite étale `Y_x`-spaces `Spa(L', L'⁺) → Spa(L, L⁺)`
  is surjective, so the covering `{R → Y_x}` restricts to the empty sieve of `Y_x,profét`.
- *fibreTopos_rank_one* (degenerate) — at a rank-one point `x`, `Y_x` is one point,
  `k(x)^+ = O_{k(x)^}` is henselian, `D_x = G_x`, every quasi-compact étale `Y_x`-space is finite
  étale, and `Φ_x(U) = S(U ×_X Y_x)` with its `G_x`-action is the fibre functor of the printed
  Proposition 3.13. (At a henselian point of rank two the open generic point of `Y_x` is a
  quasi-compact étale `Y_x`-space that is not finite étale; `Φ_x` sends it to `∅`.)
- *fibreTopos_field* (computation) — for `X = Spa(ℚ_p, ℤ_p)`, `i_x` is the equivalence of topoi
  `Sh(G_{ℚ_p}-pfsets) ≃ Sh(X_proét)`, and `Φ_x(lim_n Spa(ℚ_p(μ_{p^n}))) = ℤ_p^×` with
  `G_{ℚ_p}` acting through the cyclotomic character.

**Deligne's theorem: coherent topoi have enough points.** (*coherent-topos-enough-points*) Let
`(C, J)` be a site with `C : Type u`, morphisms in `Type v`, and `EssentiallySmall.{w} C`,
whose topos `Sh(C, J)` is coherent in the sense of SGA 4 VI 2.3: algebraic (DiamondsAndVStacks
D0.17, *quasicompact-objects-in-a-topos*) with quasi-compact quasi-separated terminal object;
for instance `C` has finite limits and every covering family has a finite subfamily that still
covers. Prove that `J` has enough points relative to `w` (Mathlib
`GrothendieckTopology.HasEnoughPoints.{w}`): there is a `w`-small set of points (Mathlib
`GrothendieckTopology.Point.{w}`) whose fibre functors jointly reflect isomorphisms of sheaves of
`w`-sets, so a morphism of sheaves is an isomorphism, monomorphism or epimorphism iff it is so on
every fibre ([SGA 4 VI] Exp. VI, Appendix by P. Deligne, Prop. 9.0, p. 336 of the original
pagination; the points are constructed by a transfinite chain of coherent objects and are not
identified with any geometric points). The sites of this layer to which it applies are `X_proét`
for qcqs `X` and `G-pfsets`; the étale site `X_ét` has the explicit conservative family of
*etale-enough-points* and does not need it. *Needs:* DiamondsAndVStacks D0.17
(*quasicompact-objects-in-a-topos*); Mathlib `CategoryTheory.GrothendieckTopology.HasEnoughPoints`,
`CategoryTheory.GrothendieckTopology.Point`. README only (no Lean declaration).

**Checks.**

- *coherentPoints_finite_sets* (degenerate) — for `C` the category of finite sets with jointly
  surjective coverings, the forgetful functor is a point and alone forms a conservative family.
- *coherentPoints_universe* (convention) — `G-pfsets` is a category in `Type 1` with morphisms in
  `Type 0`. Apply `coherentTopology_hasEnoughPoints.{1,1,0}` using essential smallness
  in universe `1`; this does not require changing its morphism universe to `1`.
  The topos version `coherentTopos_hasEnoughPoints` uses `CoherentSitePresentation`, an
  equivalence with sheaves on a small finite-cover site in the universe of its points.

**Enough points.** (*proetale-topos-enough-points*) If `|X|` is quasi-compact and quasi-separated,
`Sh(X_proét)` is a coherent topos (*proetale-quasicompactness-detection* (vii)) and so has enough
points by Deligne's theorem (*coherent-topos-enough-points*), i.e. `J_proét` satisfies
Mathlib `GrothendieckTopology.HasEnoughPoints`; for general `X` the same holds because `X` is
covered by qcqs opens `U` with `Sh(X_proét)/U ≃ Sh(U_proét)` (see *proetale-slice*). The same
applies to `G-pfsets` with the corrected coverings, for every profinite `G`: finite limits exist,
and every covering family has a finite subfamily that still covers, because objects are compact
and members have open images (a `G`-étale map has open and closed image, a tower is surjective).
For `ProfiniteGSet G : Type 1` formed from profinite sets in `Type 0`,
`ProfiniteGSet.hasEnoughPoints` is stated in universe `1`: both the conservative family and its
point functors may live there. Deligne's theorem does not supply a universe-`0` bound for this
large site. The points are abstract: Scholze's Corollary 3.8 (called Proposition 3.8 in the erratum) and the last sentence of
Proposition 3.13 (enough points given by profinite `G`-free covers of geometric points) are deleted
by the erratum and are used nowhere ([PH erratum] item (2), p. 1; [PH] §3, Corollary 3.8 (called Proposition 3.8 in the erratum), p. 15; [PH]
§3, Prop. 3.13, last sentence, p. 18). *Needs:* *proetale-quasicompactness-detection*,
*proetale-slice*, *profinite-g-sets-site*, *coherent-topos-enough-points*; Mathlib
`CategoryTheory.GrothendieckTopology.HasEnoughPoints`, `CategoryTheory.GrothendieckTopology.Point`. README only (no Lean declaration).

**Checks.**

- *enoughPoints_not_a_point* (non-example) — for `G = 1` and a profinite `T` with at least two
  points, `S ↦ C(T, S)` is not a point (Mathlib `GrothendieckTopology.Point`): the summand covering
  `{S_1 → S_1 ⊔ S_2, S_2 → S_1 ⊔ S_2}` is not sent to a jointly surjective family, since a map
  `T → S_1 ⊔ S_2` meeting both summands factors through neither.
- *enoughPoints_trivial_group_point* (computation) — for `G = 1` and `T` a point, `S ↦ S` is a point
  of `G-pfsets`: corrected coverings are jointly surjective.


**The decomposition-group valuation swap.**
Take K = Q((t)) with its t-adic topology and the composite valuation whose residue
valuation on Q is 5-adic. Thus K⁺ consists of series with no negative powers of t and
5-integral constant coefficient. In the fixed algebraic closure choose i² = −1 and
prolong the composite valuation through the branch i ≡ 2 mod 5. Complete this valued
algebraic closure to obtain `ValuationSwapChecks.point`; `embedding_integral` fixes
its integral elements on the dense algebraic closure. Extend i ↦ −i to the automorphism
`conjugation`. For a = (i−2)/5, a is integral on the chosen branch, whereas its conjugate
is not: the two numerators sum to the 5-adic unit −4. The decomposition group is therefore
proper in the absolute Galois group. The underlying prolongation construction is
Huber 1996, (2.5.2), p. 130; the subgroup is the stabilizer of that chosen valuation.

**Checks.**

- *valuation_swap_positive* (computation) — The chosen branch contains (i−2)/5.
- *valuation_swap_degenerate* (degenerate) — The identity automorphism belongs to its decomposition group.
- *valuation_swap_negative* (non-example) — Conjugation sends (i−2)/5 outside the integral ring and is excluded from the decomposition group; the full absolute Galois group fails this test.

**`AdicSpace.ProEtaleSite.fiberProfinite`.** The profinite fibre records lifts from the fixed rank-one geometric point defined by C₂. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_fiberProfinite_quadratic_lifts* (computation) — At the C₂ point the split quadratic object has two geometric lifts.
- *AdicSpace_ProEtaleSite_fiberProfinite_empty_fibre* (degenerate) — The empty object has empty profinite fibre.
- *AdicSpace_ProEtaleSite_fiberProfinite_cycle_fixed_point_free* (non-example) — The geometric three-cycle has no fixed lift; the trivial action on geometric arrows fails.

**`AdicSpace.ProEtaleSite.pointToposPush`.** Direct image for the point-site comparison at C₂ retains the nontrivial Galois action on the quadratic cover. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_pointToposPush_quadratic_endomorphisms* (computation) — For the sheaf represented by the quadratic cover Q₂(√2), sections over that quadratic object are its two equivariant endomorphisms.
- *AdicSpace_ProEtaleSite_pointToposPush_unique_empty_section* (degenerate) — The same sheaf has exactly one section over the empty object.
- *AdicSpace_ProEtaleSite_pointToposPush_no_base_section* (non-example) — It has no section over the Q₂ point; forgetting the nontrivial Galois action would incorrectly give two.

**`AdicSpace.ProEtaleSite.globalPointToposPush`.** Direct image to the global pro-étale site remembers the quadratic fibre and its Galois action at the C₂ point. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_globalPointToposPush_quadratic_endomorphisms* (computation) — For the sheaf represented by the quadratic cover Q₂(√2), sections over that quadratic object are its two equivariant endomorphisms.
- *AdicSpace_ProEtaleSite_globalPointToposPush_unique_empty_section* (degenerate) — The same sheaf has exactly one section over the empty object.
- *AdicSpace_ProEtaleSite_globalPointToposPush_no_base_section* (non-example) — It has no section over the Q₂ point; forgetting the nontrivial Galois action would incorrectly give two.

**`AdicSpace.ProEtaleSite.pointToposPull`.** Inverse image for the point-site comparison sends the quadratic representable to the sheaf represented by its profinite Galois fibre. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_pointToposPull_quadratic_endomorphisms* (computation) — For the sheaf represented by the quadratic cover Q₂(√2), sections over that quadratic object are its two equivariant endomorphisms.
- *AdicSpace_ProEtaleSite_pointToposPull_unique_empty_section* (degenerate) — The same sheaf has exactly one section over the empty object.
- *AdicSpace_ProEtaleSite_pointToposPull_no_base_section* (non-example) — It has no section over the Q₂ point; forgetting the nontrivial Galois action would incorrectly give two.

**`AdicSpace.ProEtaleSite.globalPointToposPull`.** Inverse image from the global pro-étale site evaluates the quadratic representable at the C₂ point with its full profinite Galois fibre. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_globalPointToposPull_quadratic_endomorphisms* (computation) — For the sheaf represented by the quadratic cover Q₂(√2), sections over that quadratic object are its two equivariant endomorphisms.
- *AdicSpace_ProEtaleSite_globalPointToposPull_unique_empty_section* (degenerate) — The same sheaf has exactly one section over the empty object.
- *AdicSpace_ProEtaleSite_globalPointToposPull_no_base_section* (non-example) — It has no section over the Q₂ point; forgetting the nontrivial Galois action would incorrectly give two.

**`AdicSpace.ProEtaleSite.decompositionAction`.** For Q₂, take a primitive seventh root ζ in the unramified cubic extension and extend its residue Frobenius ζ ↦ ζ² to the algebraic closure. Pullback of functions along the associated geometric action uses the inverse automorphism, hence ζ ↦ ζ⁴. This distinguishes the two action conventions on an extension of degree three; PH Proposition 3.13, pp. 18–19. README only (no Lean declaration).

**Checks.**

- *AdicSpace_ProEtaleSite_decompositionAction_inverse_frobenius* (computation) — The geometric Frobenius pulls ζ back to ζ⁴.

- *AdicSpace_ProEtaleSite_decompositionAction_identity_root* (degenerate) — The identity automorphism pulls ζ back to ζ.

- *AdicSpace_ProEtaleSite_decompositionAction_not_direct_frobenius* (non-example) — The pullback is not ζ², excluding direct instead of inverse precomposition.

### A1.16 generalized adic presentations

The name *Yoneda-adic space* ([Berkeley] Appendix to Lecture 3, p. 24) is used for the generalized
adic spaces, because the pre-adic spaces of the Foundations of adic spaces roadmap (AdicSpaces),
layer 3 (Wedhorn's `𝒱^pre`) are a different, presheaf-based category ([Wedhorn] §8.1, Rem. and
Def. 8.10, p. 77).

**The rational-covering site on complete Huber pairs.** (*huber-pair-rational-site*) `CAff` is the
category of complete Hausdorff Huber pairs `(A, A⁺)` (Tau Ceti `Huber.Pair` on complete Hausdorff
Huber rings, `A⁺` a ring of integral elements) whose morphisms are all morphisms of Huber pairs
(Tau Ceti `Huber.Pair.Hom`: continuous ring maps carrying `A⁺` into `B⁺`, adic or not), composed as
maps; this is the category of [Berkeley] Lecture 3, §3.4, p. 22. Rings live in a fixed universe, so
`CAff : Type 1`. For each pair, `CAff.presentation` chooses a ring of definition inside its
plus ring using Tau Ceti's `TauCeti.Huber.exists_pairOfDefinition_ringOfDefinition_le`;
`CAff.presentation_le` records this containment.
A morphism `φ : (A, A⁺) → (B, B⁺)` is a *rational localisation* at `R(T/s)`
(`T` finite with `T·A` open; Tau Ceti `ValuationSpectrum.rationalSubset`, the set of `v` with
`v(t) ≤ v(s)` for `t ∈ T` and `v(s) ≠ 0`) when `Spa(φ)` lands in `R(T/s)` and every morphism out of
`(A, A⁺)` whose `Spa` lands in `R(T/s)` factors uniquely through `φ` ([Wedhorn] Lemma 8.1 and
Prop. 8.2, p. 74); this characterises the completed `A⟨T/s⟩` with its plus ring up to unique
isomorphism (AdicSpaces, layer 3), and at `s = 0` it is the zero pair. Finitely many rational
subsets `U_k = R(T_k/s_k)` covering `Spa(A, A⁺)` form a *rational covering*, and the rational
localisations at the `U_k` form a *rational covering family* of `(A, A⁺)ᵒᵖ` in `CAffᵒᵖ`; the empty
family is a rational covering exactly when `Spa(A, A⁺) = ∅`, i.e. `A = 0` (Tau Ceti
`TauCeti.ValuationSpectrum.spa_eq_empty_iff_subsingleton`). These families form a coverage on `CAffᵒᵖ`
(Mathlib `CategoryTheory.Coverage`) for every morphism, adic or not: for `(A, A⁺) → (B, B⁺)` the
preimages of a rational covering are open (Tau Ceti `Huber.Pair.Hom.continuous_spaComap`) but
for a non-adic map need not be rational, so by quasi-compactness of `Spa(B, B⁺)` and the rational
basis they are refined by a rational covering, each member of which factors through a member of the
original family by the universal property. For an adic map the image data `(φ(T_k), φ(s_k))`
are themselves a rational covering (Tau Ceti `Huber.Pair.Hom.spaComap_preimage_rationalSubset`;
adicness makes `φ(T_k)·B` open, [Berkeley] Lecture 5, Prop. 5.1.5(1), p. 35; the set-level form,
with `Spa(φ)` spectral, is Tau Ceti `Huber.Pair.Hom.spaComap_preimage_mem_spaRationalFamily` and
`TauCeti.Huber.Pair.Hom.isSpectralMap_spaComap`); for
`(ℤ_p, ℤ_p) → (ℤ_p⟦T⟧, ℤ_p⟦T⟧)` and the covering `R({p}/1)` they are not, since `(p)` is not open
for the `(p, T)`-adic topology. `J_rat := Coverage.toGrothendieck`; the empty sieve is a
`J_rat`-covering exactly at the zero pair, so every `J_rat`-sheaf is a point there. A presheaf on
`CAffᵒᵖ` is a `J_rat`-sheaf iff it satisfies the sheaf condition for all rational covering families
(Mathlib `CategoryTheory.Presieve.isSheaf_coverage`). The presheaf `𝒪 : (A, A⁺) ↦ A` is represented
by the discrete pair `(ℤ[T], ℤ)` (plus ring the integers; with plus ring `ℤ[T]` it would represent
`𝒪⁺`), the morphism `T ↦ a` corresponding to `a`. `CAff` is formed in a fixed universe and
sheaves take values in the next, where sheafification exists ([Berkeley] Lecture 3, §3.4, p. 22;
[KL I] §8.2, Def. 8.2.3, p. 159). Define `CAff`, `CAff.IsRationalLocalization`,
`CAff.IsRationalCovering`, `CAff.rationalCover`, `CAff.rationalCoverage`, `CAff.ratTopology`
(`J_rat`), `CAff.spa` (`(A, A⁺) ↦ Spa(A, A⁺)` as a functor `CAffᵒᵖ ⥤ TopCat` via
`Pair.Hom.spaComap`), `CAff.O`, the discrete pair `CAff.affineLine` with coordinate
`AffineLineRing.T`, and `CAff.eval` (`T ↦ a`); prove `CAff.isSheaf_iff`,
`CAff.rationalCover_pullback` (for an adic map, the image rational data form a covering; for general
maps the refinement is the `pullback` field of `CAff.rationalCoverage`), `CAff.toRingHom_eval`,
`CAff.eval_bijective`, `CAff.O_iso_yoneda` (`𝒪 ≅ Hom((ℤ[T], ℤ), −)`, `a ↦ (T ↦ a)`) and
`CAff.isSheafAt_O_iff_isSheafyPair`: for a complete Tate pair `(A, A⁺)`, `𝒪` satisfies the sheaf
condition for the rational covering families of `(A, A⁺)` and of each of its rational localisations
iff `(A, A⁺)` is sheafy, Tau Ceti `Huber.IsSheafyForEveryPresentation A⁺` ([Wedhorn] Def. 8.26,
p. 81; [Berkeley] Lecture 3, Def. 3.1.11, p. 19). The left side is the sheaf condition of the
structure presheaf on rational coverings of rational subsets, which by the rational-basis criterion
(Tau Ceti `TauCeti.ValuationSpectrum.isSheaf_iff_isSheafFor_rationalCover`) is the sheaf condition of sets;
the topological condition is automatic for Tate rings by the open mapping theorem (AdicSpaces, layer
0; [Berkeley] Lecture 4, Prop. 4.3.4, p. 34).
*Needs:* Tau Ceti `Huber.Pair`, `Huber.Pair.Hom`
with `TauCeti.Huber.Pair.Hom.comp_id`, `TauCeti.Huber.Pair.Hom.id_comp`, `TauCeti.Huber.Pair.Hom.comp_assoc`, `Huber.Pair.Hom.spaComap`,
`TauCeti.Huber.Pair.Hom.continuous_spaComap`, `TauCeti.Huber.Pair.Hom.spaComap_id`, `TauCeti.Huber.Pair.Hom.spaComap_comp`,
`Huber.Pair.Hom.spaComap_preimage_rationalSubset`,
`Huber.Pair.Hom.spaComap_preimage_mem_spaRationalFamily`, `ValuationSpectrum.rationalSubset`,
`TauCeti.ValuationSpectrum.isTopologicalBasis_spaRationalFamily`,
`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`,
`TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_isUnit_of_forall_comap_mem_rationalSubset`,
`TauCeti.ValuationSpectrum.spa_eq_empty_iff_subsingleton`,
`TauCeti.ValuationSpectrum.isSheaf_iff_isSheafFor_rationalCover`, `Huber.IsSheafyForEveryPresentation`;
Mathlib `CategoryTheory.Coverage`, `CategoryTheory.Presieve.isSheaf_coverage`,
`DiscreteUniformity`; AdicSpacesPartII layer R0 (`Huber.IsAdicHom`); the Foundations of adic
spaces roadmap (AdicSpaces), layers 0 and 3. README only (no Lean declaration).

**Checks.**

- *CAff.test_laurent_cover* (computation) — for a complete Tate pair, a pseudouniformiser `ϖ` and
  any `f`, `U_1 = R({f, ϖ}/ϖ) = {|f| ≤ |ϖ|}` and `U_2 = R({ϖ, f}/f) = {|ϖ| ≤ |f|}` form a rational
  covering (the ideals contain the unit `ϖ`; every point has `|ϖ| ≠ 0`); for `(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`,
  `f = T`, `ϖ = p`, the rings are `ℚ_p⟨T/p⟩`, `ℚ_p⟨T, p/T⟩` and on the overlap `ℚ_p⟨T/p, p/T⟩`.
- *CAff.test_empty_cover* (degenerate) — the empty family is a rational covering of `(A, A⁺)` iff
  `A = 0`.
- *CAff.test_identity_cover* (degenerate) — `R({1}/1)` alone covers.
- *CAff.test_wrong_direction_not_cover* (non-example) — for a nonzero complete Tate pair and a
  pseudouniformiser `ϖ`, `R({1}/ϖ) = {1 ≤ |ϖ|}` is empty (every point has `|ϖ| < 1`), so it is not
  a covering; with the inequality read the other way it would be all of `Spa`.
- *CAff.test_O_sheafy* (compatibility) — for a complete strongly noetherian Tate pair, `𝒪`
  satisfies the sheaf condition for every rational covering family ([Wedhorn] Thm. 8.28(b), p. 81;
  AdicSpaces, layer 4).
- *CAff.test_rost* (non-example) — for Rost's complete Tate pair ([HK] §6, Ex. 6.28, p. 24),
  `𝒪 = h_{(ℤ[T],ℤ)}` fails the sheaf condition for the rational covering `{v(X_1) ≤ 1}`,
  `{v(X_1) ≥ 1}`: `X_3 ≠ 0` restricts to `0` on both members; representable presheaves are not
  `J_rat`-sheaves in general.
- *CAff.test_isSheaf_iff* (characterisation) — `G` on `CAffᵒᵖ` is a `J_rat`-sheaf iff for every
  `(A, A⁺)`, rational covering `{U_k}` and choice of rational localisations, compatible families
  (compatibility tested on every pair of maps out of `O(U_k)`, `O(U_l)` agreeing on `(A, A⁺)`,
  all of which factor through `O(U_k ∩ U_l)`) glue uniquely; the empty covering makes `G(0)` a
  point.
- *CAff.test_empty_sieve* (degenerate) — the empty sieve on `(A, A⁺)ᵒᵖ` is `J_rat`-covering iff
  `A = 0`; the presheaf `(B, B⁺) ↦ {∗ | Spa(B, B⁺) = ∅}` is a sheaf that is empty at every nonzero
  pair.
- *CAff.test_rationalCover_empty* (degenerate) — the presieve of the empty family is `⊥`.
- *CAff.rationalCover_pullback_nonadic* (non-example) — in `ℤ_p⟦T⟧` with every neighbourhood
  of `0` containing a power of `(p, T)`, the ideal `(p)` is not open (`Tⁿ ∉ (p)`: the coefficient of
  `Tⁿ` would make `p` a unit of `ℤ_p`).
- *CAff.rationalPreimage_nonadic* (non-example) — the preimage of a rational subset under a
  non-adic morphism need not be quasi-compact, hence need not be rational: for
  `(ℤ_p, ℤ_p) → (ℤ_p⟦T⟧, ℤ_p⟦T⟧)`, the preimage of `R({p}/p) = {|p| ≠ 0}` is the increasing union of
  the rational subsets `{|Tⁿ| ≤ |p| ≠ 0}` and contains the point `T ↦ p^{1/(n+1)}` (into the
  completion of `ℚ_p(p^{1/(n+1)})`), which lies outside the `n`-th one.
- *CAff.rationalCover_pullback_needs_adic* (non-example) — the adicness hypothesis of
  `CAff.rationalCover_pullback` cannot be dropped: for `(ℤ_p, ℤ_p) → (ℤ_p⟦T⟧, ℤ_p⟦T⟧)`, the
  covering `R({p}/1)` of `Spa(ℤ_p, ℤ_p)` has image data `({p}, 1)` that are not a rational
  covering.
- *CAff.rational_identity* (computation) — `R({1}/1)` is the whole spectrum and the identity is
  its rational localisation.
- *CAff.rational_zero_denominator* (degenerate) — the identity is the rational localisation at
  `R({1}/0) = ∅` exactly for the zero ring.
- *rational_direction* (two-term convention) — for a pseudouniformiser `ϖ` of a complete Tate pair,
  the identity is the rational localisation at `R({ϖ}/1) = {|ϖ| ≤ 1}` (all of `Spa`, as `ϖ ∈ A⁺`),
  while the rational localisation at `R({1}/ϖ) = {1 ≤ |ϖ|} = ∅` is the zero pair.
- *rational_nonopen_data* (unfolding) — empty numerators cannot define a rational
  localisation when the zero ideal is not open.
- *rational_nonopen_padic* (non-example) — in `(ℚ₂,ℤ₂)` the zero ideal is not open,
  although `R(∅/1)` as a valuation locus is the whole spectrum. The identity has
  the required unique factorisations, but is not `IsRationalLocalization` for
  these data. Thus dropping the open-ideal condition changes the predicate even
  when its locus and universal-property conditions hold.
- *caff_two_arrows* (contravariance) — for `A → B → C`, the ring map is `g(f(a))` and the
  map on spectra is `Spa(f)(Spa(g)(v))`; the order is reversed on spectra.
- *caff_identity* (degenerate) — the identity acts as the identity on rings and spectra.
- *caff_spa_zero* (degenerate) — `CAff.spa` of a pair is empty iff the ring is zero.
- *affineLine_plus* (non-example) — `T` is not in the plus ring of `(ℤ[T], ℤ)`, so a
  morphism out of it may send `T` anywhere: it represents `𝒪`, not `𝒪⁺`.
- *affineLine_eval_values* (computation) — `𝒪(T ↦ a)` sends `T` to `a` and `T + 1` to
  `a + 1`, and `T ↦ a`, `T ↦ b` are different morphisms for `a ≠ b`.

**Yoneda-adic spaces.** (*generalized-adic-presentation*) With `CAff` and `J_rat` as above:

```text
Spa^Y(A, A⁺) := J_rat-sheafification of Hom_CAff((A, A⁺), −),
F → Spa^Y(A, A⁺) open immersion  ⇔  F ≅ colim_{V ⊂ U rational} Spa^Y(O(V), O⁺(V)) for an open U ⊂ Spa(A, A⁺),
F → G open immersion              ⇔  every base change along Spa^Y(A, A⁺) → G is one,
F Yoneda-adic                     ⇔  F = colim of its affinoid open immersions Spa^Y(A, A⁺) → F.
```

The open subsheaf of `U` is described on sections (`IsOpenSubsheaf`): a monomorphism into
`Spa^Y(A, A⁺)` whose sections include the section of `φ : (A, A⁺) → (B, B⁺)` exactly when
`Spa(φ)` lands in `U`; a subsheaf of a sheaf is determined by the representable sections it
contains, and those of the colimit above are exactly the sections of the `φ` with `Spa(φ)` in
`U`. `YAdic` is the full subcategory of
`Sh(CAffᵒᵖ, J_rat)` on Yoneda-adic spaces. This is the category of adic spaces of
Scholze–Weinstein's *Moduli of p-divisible groups*, Definition 2.1.5, as repeated in the Berkeley
Lectures ([Berkeley] Lecture 3, §3.4 and Def. 3.4.1, pp. 21–22, there called pre-adic spaces), and,
over complete Tate pairs, Kedlaya–Liu's preadic spaces ([KL I] §8.2, Def. 8.2.3, p. 159); ECD
Definition 15.5 and Lemma 15.6 hold in this generality ([ECD] §15, after Def. 15.5, p. 91). The
framework is needed because sheafiness is not known to be stable under finite étale extension
([KL I] §8.2, Rem. 8.2.18, p. 162), so `Spa` of the finite étale algebras used in ECD §15 and in A4
need not be an adic space; no non-sheafy pair is assumed sheafy. Every Yoneda-adic space has an
underlying space `|F|` with `|Spa^Y(A, A⁺)| = Spa(A, A⁺)` (see
*yoneda-adic-ind-ringed-description*), open immersions into `F` are the open subsets of `|F|` (see
*yoneda-adic-open-immersions*), and AdicSpaces's adic spaces form a full subcategory (see
*adic-spaces-in-yoneda-adic-spaces*). In `YonedaAdicSpace`, define `spaYFunctor`
(`CAffᵒᵖ ⥤ Sh(CAffᵒᵖ, J_rat)`), `spaY`, `spaYSection` (the section of `Spa^Y(A, A⁺)` over
`(B, B⁺)` given by a morphism), `homSpaYEquiv` (`Hom(Spa^Y(A, A⁺), G) ≃ G(A, A⁺)` for every
`J_rat`-sheaf `G`: the sheafification adjunction followed by Mathlib's `uliftYonedaEquiv`, with
`homSpaYEquiv_apply` evaluating at the identity section), `IsOpenSubsheaf`, `IsOpenImmersion`
(stable under base change and composition), `AffinoidOpens`, `affinoidCocone`, `IsYonedaAdic`, the
full subcategory `YonedaAdicSpace` (`YAdic`), `ofSpaY`, and the global functions
`globalFunctions` (`Γ(F) := Hom(F, Spa^Y(ℤ[T], ℤ))`), with its ring structure
(`Spa^Y(ℤ[T], ℤ)` is the sheafification of the ring-valued `𝒪`, a ring object), the ring map
`toGlobalFunctions : A → Γ(Spa^Y(A, A⁺))`, `a ↦ Spa^Y(T ↦ a)` (`toGlobalFunctions_apply`), and the
precomposition ring maps `globalFunctions.map` (`globalFunctions.map_apply`); prove
`isColimit_affinoids` (a sheaf is Yoneda-adic iff it has a jointly epimorphic family of affinoid
open immersions, i.e. a covering by them), `spaY_isInitial_iff` (`Spa^Y(A, A⁺)` is initial iff
`A = 0`), `isYonedaAdic_spaY` and `toGlobalFunctions_bijective`: if `𝒪` satisfies the sheaf
condition for the rational coverings of every rational localisation of `(A, A⁺)` (for complete
Tate pairs: `(A, A⁺)` is sheafy, *huber-pair-rational-site*), then `A → Γ(Spa^Y(A, A⁺))` is
bijective. For Rost's pair it is not injective. *Needs:* *huber-pair-rational-site*; Mathlib
`CategoryTheory.presheafToSheaf`, `CategoryTheory.sheafificationAdjunction`,
`CategoryTheory.uliftYonedaEquiv`, `CategoryTheory.CostructuredArrow`; Tau Ceti `Huber.Pair`,
`TauCeti.ValuationSpectrum.spa_eq_empty_iff_subsingleton`. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace.test_zero_pair* (degenerate) — `Spa^Y(A, A⁺)` is initial in `Sh(CAffᵒᵖ, J_rat)`
  when `A = 0`, and the initial sheaf is Yoneda-adic (its affinoid open immersions come from zero
  pairs).
- *YonedaAdicSpace.test_open_disc* (computation) —
  `D := colim_{n ≥ 1} Spa^Y(ℚ_p⟨T, T^n/p⟩, ℤ_p⟨T, T^n/p⟩) → Spa^Y(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` is an open
  immersion with underlying image `U = {x : ∃ n ≥ 1, |T(x)|^n ≤ |p(x)|}` in the full adic
  spectrum `B = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` ([Hüb] Ex. 4.4, p. 18; [Berkeley] Lecture 4, p. 28).
  This is the open unit disc; `|D|` is not quasi-compact, and `D` is Yoneda-adic and not isomorphic
  to any `Spa^Y(A, A⁺)`. For `p = 2`, `U = ⋃_{m ∈ ℕ} AdicSpace.DiscChecks.radiusRegion m`, with
  `n = m + 1`; *ofAdicSpace_open_disc* identifies the inclusions of these same rational opens.
- *YonedaAdicSpace.test_open_disc_rank_two* (non-example) — for a nonzero restricted series
  `f = Σ a_i T^i` over `ℚ_p`, let `a = min_i v_p(a_i)`, with `v_p(p) = 1`, and set
  `w(f) = (a, ord_t(overline(p^(-a) f))) ∈ ℤ ×_lex ℤ`, with `w(0) = ∞`. The reduction is a
  nonzero polynomial in `𝔽_p[t]`. This additive Gauss valuation refined by the `t`-adic order
  defines a point `v ∈ B`: multiplication follows from multiplication of the reductions,
  `w(ℤ_p⟨T⟩) ≥ 0`, and the values `w(p^m) = (m, 0)` are cofinal, giving continuity for the Tate
  topology ([Hüb] Ex. 2.10, pp. 7–8). Since `w(T) = (0, 1) > 0` but
  `w(T^n) = (0, n) < (1, 0) = w(p)` for every `n ≥ 1`, `|T(v)| < 1` while
  `|T(v)|^n > |p(v)|`. Thus `v` belongs to the literal strict-inequality locus and to none of
  the radius regions or the image of `D`; for `p = 2` it is excluded from every
  `AdicSpace.DiscChecks.radiusRegion m` as well.
- *yonedaAdic_not_affinoid* (non-example) — some Yoneda-adic sheaf is not `Spa^Y(B, B⁺)` for any
  `(B, B⁺)`: the open disc `D`, or `∐_{n ∈ ℕ} Spa^Y(A, A⁺)` for a nonzero `A`, whose underlying
  space is not quasi-compact.
- *YonedaAdicSpace.test_affine_line* (characterisation) — `Spa^Y(ℤ[T], ℤ)` is isomorphic to the
  `J_rat`-sheafification of `𝒪`, so `Hom(F, Spa^Y(ℤ[T], ℤ))` is the sheafified `𝒪` evaluated at
  `F`; for `F = Spa^Y(A, A⁺)` with `(A, A⁺)` and all its rational localisations sheafy this is `A`.
- *YonedaAdicSpace.test_rost_not_faithful* (non-example) — for Rost's pair, `T ↦ X_3` and `T ↦ 0`
  induce the same morphism `Spa^Y(A, A⁺) → Spa^Y(ℤ[T], ℤ)`, since `X_3` restricts to `0` on the
  rational covering `{v(X_1) ≤ 1}, {v(X_1) ≥ 1}`; so `(A, A⁺) ↦ Spa^Y(A, A⁺)` is not faithful and
  `A → Γ(Spa^Y(A, A⁺))` is not injective; a presheaf-level definition without sheafification would
  separate these maps.
- *globalFunctions_zero_pair* (degenerate) — the global functions of `Spa^Y(0, 0)` form the zero
  ring.
- *globalFunctions_two_terms* (computation) — in `Γ(Spa^Y(A, A⁺))` the morphism induced by
  `T ↦ a + b` is the sum, and that induced by `T ↦ ab` the product, of those induced by `T ↦ a`
  and `T ↦ b`.
- *yoneda_identity_section* (computation) — the Yoneda equivalence sends the identity to
  the identity section.
- *yoneda_composition_sections* (two-term convention) — the image of the section `g : B → C` under
  the sheaf map induced by `f : A → B` is the section `f ≫ g`.
- *yoneda_section_zero_target* (degenerate) — over the zero pair all sections of `Spa^Y(A, A⁺)`
  coincide.
- *space_zero_pair* (degenerate) — `|Spa^Y(A, A⁺)|` is empty iff `A = 0`.
- *YonedaAdicSpace.test_sheafy* (compatibility) — for `(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`,
  `Spa^Y(A, A⁺) ≅ ι(Spa(A, A⁺))` for AdicSpaces's adic space, the closed unit disc, with global
  functions `ℚ_p⟨T⟩`.

**Open immersions into affinoids.** (*yoneda-adic-open-immersions*) For `(A, A⁺) ∈ CAff`,
sheafiness not assumed: (a) for a rational localisation at `U = R(T/s)`,
`Spa^Y(O(U), O⁺(U)) → Spa^Y(A, A⁺)` is an open immersion, the open subsheaf of `U`
(`isOpenImmersion_spaY_rational`); (b) `U ↦` its open subsheaf
`colim_{V ⊂ U rational} Spa^Y(O(V), O⁺(V))` is an order-preserving bijection from open subsets of
`Spa(A, A⁺)` to isomorphism classes of open immersions into `Spa^Y(A, A⁺)`, taking intersections to
fibre products and unions to unions: existence (`exists_isOpenSubsheaf`), uniqueness up to unique
isomorphism over `Spa^Y(A, A⁺)` (`isOpenSubsheaf_unique`), every open immersion arises
(`IsOpenImmersion.exists_isOpenSubsheaf`), order (`isOpenSubsheaf_factors_iff`), intersections
(`isOpenSubsheaf_pullback`) and unions (`isOpenSubsheaf_iUnion`); (c) for a rational covering
`{U_k}`, the open immersions `Spa^Y(O(U_k)) → Spa^Y(A, A⁺)` are jointly epimorphic
(`spaY_rationalCover_jointlyEpi`), so `Spa^Y(A, A⁺)` is the coequalizer of
`⊔_{k,l} Spa^Y(O(U_k ∩ U_l)) ⇉ ⊔_k Spa^Y(O(U_k))` — the gluing ECD §15 uses for `Spd`; (d) open
immersions are monomorphisms, stable under base change and composition
(`IsOpenImmersion.le_monomorphisms`, `IsOpenImmersion.isStableUnderBaseChange`,
`IsOpenImmersion.isStableUnderComposition`) ([Berkeley] Lecture 3, Def. 3.4.1, p. 22;
[Berkeley] Appendix to Lecture 3, proof of Prop. 3.5.3, pp. 24–26; [ECD] §15, before Def. 15.5,
p. 91). *Needs:* *generalized-adic-presentation*, *huber-pair-rational-site*; Tau Ceti
`TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_isUnit_of_forall_comap_mem_rationalSubset`,
`Huber.Pair.Hom.spaComap_preimage_rationalSubset`,
`TauCeti.ValuationSpectrum.isTopologicalBasis_spaRationalFamily`. README only (no Lean declaration).

**Checks.**

- *yoneda_whole_open* (degenerate) — the identity of `Spa^Y(A, A⁺)` is the open subsheaf of the
  whole spectrum.
- *yoneda_identity_not_proper_open* (computation) — the identity is the open subsheaf of `U` only
  for `U = Spa(A, A⁺)`; for the zero pair the whole and empty subsets coincide.
- *yoneda_open_unique* (computation) — the open of an open subsheaf is determined by it: a point of
  `U ∖ V` has a rational neighbourhood inside `U` whose rational localisation gives a section of `F`
  not landing in `V`.
- *yoneda_empty_open* (degenerate) — the open subsheaf of `∅` is the initial sheaf (only the zero
  pair is covered by zero pairs).
- *yoneda_nonopen* (unfolding) — a nonopen subset has no open subsheaf in the sense
  of `IsOpenSubsheaf`; without the openness clause every subset would have one.
- *yoneda_nonopen_zero_section* (non-example) — the explicit map
  `CAff.eval SplitChecks.discretePair 0`, namely `(ℤ[T],ℤ) → (ℤ,ℤ)` with `T ↦ 0`,
  has spectral image exactly the nonempty zero locus of `T`. That locus is not
  open, and no sheaf with a map to `Spa^Y(ℤ[T],ℤ)` represents it as an open
  subsheaf. The induced map on Yoneda sheaves is nevertheless a monomorphism;
  this tests the geometric boundary beyond the first conjunct of the definition.
- *yoneda_open_immersion_identity* (degenerate) — identities are open immersions.
- *yoneda_closed_not_open* (non-example) — a closed immersion is a monomorphism but not an open
  immersion: for `ℤ[T] → ℤ`, `T ↦ 0` (discrete, plus rings `ℤ`), the image `{|T| = 0}` of
  `Spa(ℤ) → Spa(ℤ[T], ℤ)` is not open (the trivial valuation with support `(0)` lies in every
  neighbourhood of the trivial valuation with support `(T)`).
- *openImmersion_laurent_glue* (computation) — the Laurent covering of a complete Tate pair glues:
  morphisms out of `Spa^Y(A, A⁺)` agreeing on `Spa^Y(O(U_1))` and `Spa^Y(O(U_2))` agree; for the
  closed disc these are `Spa^Y(ℚ_p⟨T/p⟩)` and `Spa^Y(ℚ_p⟨T, p/T⟩)`, glued along
  `Spa^Y(ℚ_p⟨T/p, p/T⟩)`.
- *openImmersion_spd_rational* — ECD §15: for rational `U ⊂ Spa(A, A⁺)`,
  `Spd(O(U), O⁺(U)) → Spd(A, A⁺)` is the open subfunctor attached to `U`.

**The ind-ringed description and the underlying space.** (*yoneda-adic-ind-ringed-description*)
Let `(V)_ind` be the category of triples `(X, 𝒪_X, (|·(x)|)_{x∈X})` with `X` a topological space,
`𝒪_X` a sheaf of ind-topological rings (formal filtered colimits `"lim" A_i` of topological rings,
Mathlib `CategoryTheory.Ind` on topological rings in a fixed universe) and `|·(x)|` an equivalence
class of continuous valuations on the stalk ([Berkeley] Appendix to Lecture 3, Def. 3.5.1, p. 23).
For `(A, A⁺) ∈ CAff` let `Spa^ind(A, A⁺)` be `Spa(A, A⁺)` with the structure presheaf sheafified in
ind-topological rings and the same valuations; a pre-adic space in `(V)_ind` is an object locally
isomorphic to some `Spa^ind(A, A⁺)` (Def. 3.5.2, p. 24). Then `X ↦ X^Y`,
`X^Y(A, A⁺) := Hom_{(V)_ind}(Spa^ind(A, A⁺), X)`, is an equivalence from pre-adic spaces in
`(V)_ind` to Yoneda-adic spaces (`X^Y` is a sheaf by gluing along rational covers), with
`Spa^ind(B, B⁺)^Y ≅ Spa^Y(B, B⁺)` and matching open immersions (Prop. 3.5.3 with its proof,
pp. 24–26). Consequently every Yoneda-adic `F` has a functorial underlying space `|F|`
(`YonedaAdicSpace.space : YonedaAdicSpace ⥤ TopCat`) with `|Spa^Y(A, A⁺)| = Spa(A, A⁺)`
(`space_ofSpaY`, natural on affinoid maps by `space_ofSpaY_naturality`), on which affinoid open
immersions are open embeddings jointly covering `|F|` (`space_charts`), so that `|F|` is the
topological colimit of the spectra of its affinoid opens; open subsets of `|F|` correspond to open
immersions, and `|F|` carries a structure sheaf of ind-topological rings and valuations at points.
Sheafifying in topological rings instead (`Spa^sh`) does not describe maps between affinoids
([Berkeley] Appendix to Lecture 3, p. 23; [KL I] §8.2, Def. 8.2.3, p. 159). *Needs:*
*generalized-adic-presentation*, *yoneda-adic-open-immersions*; Mathlib `CategoryTheory.Ind`,
`CategoryTheory.Ind.yoneda`.

The ind-ringed carrier is `IndGeometry.IndRingedSpace`. Its
`ValuedSheaf` records a sheaf in `Ind TopCommRingCat` and continuous valuations on maps
from topological rings into sections. These valuations commute with precomposition and
restriction to smaller open neighbourhoods, which expresses a valuation on each ind-stalk.
`IndRingedSpace.Hom` preserves this data. `Spectrum R` records the sheafification unit of
Tau Ceti's `presentationLimitPresheaf`, its universal property, and its effect on coefficient
valuations. The construction is `spaInd R`; `spaInd_valuation_coeff` identifies the valuation
pulled back along the coefficient map with the original point of `Spa(R)`, and
`spaInd_unit_isIso` identifies the unit on every sheafy pair. `OpenChart` requires an open
embedding and isomorphisms on sections over each open in its image; `PreAdicSpace` is locally
covered by such charts. `spaInd_hasCharts` gives the affinoid case. For a pair morphism,
`spaInd_map` specifies the unique ind-ringed morphism with its spectral map and its action on
the original global functions ([Berkeley] Definitions 3.5.1–3.5.2 and proof of Proposition
3.5.3, pp. 23–25). `IndGeometry.yonedaEquivalence` gives the equivalence of categories, identifies
its values with ind-ringed maps from affinoid spectra, compares underlying spaces, and
identifies open immersions with ind-ringed open embeddings. Its inverse takes `Spa^Y(R)`
to an ind-ringed space covered by a single surjective chart from `spaInd R`, identifying the
affinoid objects themselves.
The functor `IndGeometry.coefficients` embeds the original `Type 0` coefficient rings by
`ULift` into `TopCommRingCat.{1}`. The ind-sheaves and underlying spaces use this enlarged
universe, so that global sections over `Type 1` families of affinoid opens are permitted.
Affinoid charts use continuous maps between the two universes. README only (no Lean declaration).

**Checks.**

- *space_zero_pair* (degenerate) — see *generalized-adic-presentation*.
- *indRinged_closed_disc* — for `(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, `Spa^ind(A, A⁺)` is AdicSpaces's adic space
  `Spa(A, A⁺)` with constant ind-rings.
- *indRinged_rost* — for Rost's pair, `Spa^ind(A, A⁺)` has global sections the ind-ring `"lim"`
  over rational coverings of the Čech equalizers, in which `X_3` becomes `0`.
- *indRinged_preadic_split* (computation) — the ind-ringed pre-adic category contains the
  split two-sheeted spectrum over ℚ₂, with exactly two underlying points.
- *indRinged_preadic_closed_disc* (computation) — the closed two-adic disc gives a pre-adic
  space with an infinite compact underlying space.
- *indRinged_preadic_open_disc* (non-example) — the open two-adic unit disc gives a pre-adic
  space whose underlying space is not compact; admitting affinoid charts does not impose
  global compactness.
- *indRinged_chart_sheet* (computation) — either single sheet of the split quadratic
  cover of Spa(ℚ₂, ℤ₂) is a proper ind-ringed affinoid open chart.
- *indRinged_chart_subdisc* (computation) — the rational region |T| ≤ |2| in the closed
  two-adic disc is the image of an ind-ringed affinoid open chart.
- *indRinged_chart_fold* (non-example) — the finite étale map from the split quadratic
  cover to Spa(ℚ₂, ℤ₂) is not an ind-ringed open immersion.
- *indRinged_coefficients_evaluation* (computation) — the coefficient-enlargement functor
  sends evaluation of the integral affine-line coordinate at 2 in ℚ₂ to evaluation of the
  lifted coordinate at `ULift.up 2`.
- *indRinged_coefficients_projection* (computation) — after coefficient enlargement the
  second projection from the split two-sheeted ring sends the first idempotent to 0 and the
  second to 1.
- *indRinged_coefficients_topology* (non-example) — in the enlarged ℚ₂, the sequence
  `ULift.up (2ⁿ)` tends to 0 and the topology is not discrete.
- *indRinged_two_sheets* (computation) — on the two-sheeted spectrum over ℚ₂, the
  valuation on ind-sections at the first sheet kills the second idempotent and does not kill
  the first. The unit therefore retains the sheet labels.
- *indRinged_collapsed_functions* (non-example) — there is a complete Tate pair and two
  distinct maps from the integral affine line whose maps into the ind-ring of global sections
  agree after the sheafification unit; the unit need not be a monomorphism. This is the
  equal-function consequence of the Rost example ([HK] Example 6.28, p. 24).

**Maps from adic spaces to Yoneda affinoids.** (*maps-from-adic-spaces-to-yoneda-affinoids*) Let
`X` be an adic space in AdicSpaces's sense (layer 5: an object of Huber's `𝒱` covered by
affinoids `Spa(B, B⁺)` of sheafy complete pairs; Tau Ceti `TauCeti.AdicSpace`) and
`X^Y := colim Spa^Y(O_X(U), O_X⁺(U))` over the affinoid opens `U ⊂ X` and their open immersions.
For every `(A, A⁺) ∈ CAff`, sheafy or not, morphisms `X^Y → Spa^Y(A, A⁺)` of `J_rat`-sheaves
correspond bijectively, naturally in `X` and `(A, A⁺)`, to morphisms of pairs
`(A, A⁺) → (O_X(X), O_X⁺(X))`, i.e. continuous ring maps `A → O_X(X)` carrying `A⁺` into
`O_X⁺(X)`; for `(A, A⁺)` sheafy and `X^Y` replaced by `X` this is Huber's Proposition 2.1(ii),
layer A0's *maps-into-affinoids*, from which the sheafified statement is deduced
([KL I] §8.2, Lem. 8.2.9 and Rem. 8.2.10, p. 160; [ECD] §15, Lem. 15.1(ii), p. 89). For an
affinoid `X = Spa^Y(B, B⁺)` the formal case is `homSpaYEquiv`. *Needs:*
*generalized-adic-presentation*, *yoneda-adic-open-immersions*; *maps-into-affinoids* (layer A0);
the Foundations of adic spaces roadmap (AdicSpaces), layer 5; Tau Ceti `TauCeti.AdicSpace`. README only (no Lean declaration).

**Checks.**

- *mapsToAffinoid_open_disc* — `X` the open unit disc over `ℚ_p`, `(A, A⁺) = (ℤ[T], ℤ)`: morphisms
  `X^Y → Spa^Y(ℤ[T], ℤ)` are the elements of `O_X(X)`, the rigid functions on the open disc.
- *mapsToAffinoid_spd* — ECD Lemma 15.1(ii): `Spd(A, A⁺)(X)` uses exactly the continuous maps
  `(A, A⁺) → (O(X♯), O⁺(X♯))` for perfectoid `X♯`.

**Adic spaces inside Yoneda-adic spaces.** (*adic-spaces-in-yoneda-adic-spaces*) Let `Adic` be
AdicSpaces's category of adic spaces (layer 5; Tau Ceti `TauCeti.AdicSpace`, the full subcategory
of `TauCeti.PreAdicSpace` on `PreAdicSpace.isAdic`), with sheafy meaning Tau Ceti
`Huber.IsSheafyForEveryPresentation`. The functor `YonedaAdicSpace.ofAdicSpace : Adic ⥤ YAdic`,
`X ↦ X^Y := colim_{U ⊂ X affinoid open} Spa^Y(O_X(U), O_X⁺(U))`, equivalently
`X^Y(A, A⁺) = Hom_{(V)_ind}(Spa^ind(A, A⁺), X)`, is full and faithful;
`ofAdicSpace(Spa(A, A⁺)) ≅ Spa^Y(A, A⁺)` for every sheafy complete pair, `Spa(A, A⁺)` being Tau
Ceti's `ValuationSpectrum.presentationLimitPreAdicSpace`, an adic space by
`TauCeti.ValuationSpectrum.isAdic_presentationLimitPreAdicSpace`; `ofAdicSpace` preserves and reflects open
immersions (Tau Ceti `PreAdicSpace.IsOpenImmersion` on the left) and `|ofAdicSpace X| = |X|`
(`space` on the right, the underlying space of `TauCeti.PreAdicSpace` on the left); its essential
image is the Yoneda-adic spaces admitting a covering by open immersions from `Spa^Y(A_k, A_k⁺)` with
`(A_k, A_k⁺)` sheafy. On sheafy affinoids `ofAdicSpace` agrees with AdicSpaces's affinoid pre-adic
spaces `Spa(A, A⁺) ∈ 𝒱^pre`, which are then adic ([Berkeley] Lecture 3, §3.4, p. 22; [Berkeley]
Lecture 3, Def. 3.2.1 and Prop. 3.2.2, p. 20; [KL I] §8.2, Def. 8.2.3, p. 159). *Needs:*
*generalized-adic-presentation*, *yoneda-adic-open-immersions*,
*yoneda-adic-ind-ringed-description*, *maps-from-adic-spaces-to-yoneda-affinoids*; Tau Ceti
`TauCeti.AdicSpace`, `PreAdicSpace.IsOpenImmersion`,
`ValuationSpectrum.presentationLimitPreAdicSpace`,
`TauCeti.ValuationSpectrum.isAdic_presentationLimitPreAdicSpace`; Mathlib `CategoryTheory.Ind.yoneda`; the
Foundations of adic spaces roadmap (AdicSpaces), layers 3 and 5. README only (no Lean declaration).

**Checks.**

- *ofAdicSpace_closed_disc* — `X` the closed unit disc over `ℚ_p`: `ofAdicSpace X = Spa^Y(ℚ_p⟨T⟩,
  ℤ_p⟨T⟩)`.
- *ofAdicSpace_open_disc* — `X` the open unit disc: `ofAdicSpace X` is the Yoneda-adic space `D` of
  *YonedaAdicSpace.test_open_disc*. For `p = 2`, take `X = AdicSpace.DiscChecks.openDisc`; this
  isomorphism is over the Yoneda closed disc and carries the inclusion of `radiusRegion m` to
  the `n = m + 1` rational chart of `D`.
- *ofAdicSpace_padic* (computation) — for `(ℚ_p, ℤ_p)`: `Hom((ℚ_p, ℤ_p), (B, B⁺))` is a point if
  `p` is a topologically nilpotent unit of `B` (then `ℤ → B` extends uniquely and continuously
  to `ℤ_p → B⁺` and `ℚ_p → B`, every prime `ℓ ≠ p` being a unit of `ℤ_p`) and empty otherwise, so
  `Spa^Y(ℚ_p, ℤ_p)` is a subobject of the terminal sheaf `Spa^Y(ℤ, ℤ)` (the discrete pair
  `(ℤ, ℤ)` maps uniquely to every pair); the unit condition is pointwise on `Spa(B, B⁺)` ([Wedhorn]
  Prop. 7.52(2), p. 70); and `ofAdicSpace(Spa(ℚ_p, ℤ_p)) ≅ Spa^Y(ℚ_p, ℤ_p)`, the field `ℚ_p` being
  sheafy.

**Analytic Yoneda-adic spaces are Tate-local.** (*yoneda-adic-analytic-tate-local*) A point
`x ∈ |F|` of a Yoneda-adic space is analytic if it lies in the image of an affinoid open immersion
`Spa^Y(A, A⁺) → F` with `A` Tate (`YonedaAdicSpace.IsAnalyticPoint`), and `F` is analytic if all its
points are (`YonedaAdicSpace.IsAnalytic`) ([Berkeley] Lecture 4, Def. 4.3.2, p. 33). (a) For
`(A, A⁺) ∈ CAff`, `x ∈ Spa(A, A⁺)` is analytic in this sense iff its support is not open (Tau Ceti
`ValuationSpectrum.IsAnalyticPoint`, AdicSpaces, layer 2; `isAnalyticPoint_ofSpaY_iff`), and the
analytic locus of `Spa(A, A⁺)` is a finite union of rational subsets `U_g` with `O(U_g)` Tate
(`exists_tate_cover_spaAnalytic`) ([Berkeley] Lecture 4, Prop. 4.3.1(2), pp. 32–33). (b) Every
morphism of Huber pairs out of a Tate (or analytic) Huber ring is adic ([Berkeley] Lecture 5,
Lem. 5.1.2 and after Prop. 5.1.3, p. 35; AdicSpacesPartII `Huber.IsAdicHom.of_isTateRing` and
*adic-iff-analytic-locus*). (c) Restriction along `CAff^Tate ⊂ CAff` is fully faithful on analytic
Yoneda-adic spaces: a morphism out of an analytic `F` into any `J_rat`-sheaf is determined by, and
glued from, a family of maps on the values at complete Tate pairs natural for morphisms between
them (`bijective_restrictTate`); this identifies analytic Yoneda-adic spaces with the Yoneda-adic
spaces built on complete Tate pairs, i.e. with Kedlaya–Liu's preadic spaces, complete Tate pairs
being their adic Banach rings ([KL I] §8.2, Def. 8.2.2 and Def. 8.2.3, p. 159). *Needs:*
*generalized-adic-presentation*, *yoneda-adic-ind-ringed-description*,
*yoneda-adic-open-immersions*; Tau Ceti `TauCeti.ValuationSpectrum.spaAnalytic_eq_biUnion_rationalSubset`,
`TauCeti.ValuationSpectrum.isTateRing_completion_locTopology_of_mem_generators`, `Huber.IsTateRing`;
AdicSpacesPartII layer R0 (adic ring homomorphisms, analytic points). README only (no Lean declaration).

**Checks.**

- *analytic_zero_pair* (degenerate) — `Spa^Y(0, 0)` is analytic (its space is empty).
- *YonedaAdicSpace.analytic_tate* (computation) — `Spa^Y(A, A⁺)` of a complete Tate pair is analytic.
- *YonedaAdicSpace.analytic_discrete* (non-example) — `Spa^Y(A, A⁺)` of a nonzero discrete pair is not analytic:
  every support is open.
- *analytic_locus_Zp_T* — the analytic locus of `Spa(ℤ_p⟦T⟧, ℤ_p⟦T⟧)` (all points but the closed
  point, where `p` and `T` vanish) is covered by `{|T| ≤ |p| ≠ 0}` and `{|p| ≤ |T| ≠ 0}`, whose
  rings of sections are Tate (`p`, resp. `T`, becomes a topologically nilpotent unit);
  `Spa^Y(ℤ_p⟦T⟧, ℤ_p⟦T⟧)` itself is not analytic.

**Fibre products.** (*yoneda-adic-fibre-products*) For adic morphisms of complete Huber pairs
`(A, A⁺) → (B, B⁺)`, `(A, A⁺) → (C, C⁺)` (adic automatically when `A` is analytic, by
*yoneda-adic-analytic-tate-local* (b)),
`Spa^Y(B, B⁺) ×_{Spa^Y(A, A⁺)} Spa^Y(C, C⁺) ≅ Spa^Y(B ⊗̂_A C, (B ⊗̂_A C)⁺)` for the completed tensor
product of AdicSpacesPartII layer R0, with no sheafiness assumption: `B ⊗̂_A C` is the pushout in
`CAff` (AdicSpacesPartII `Huber.Pair.completedTensor.existsUnique_lift`; [Berkeley] Lecture 5,
Prop. 5.1.5(2) and Rem. 5.1.6, pp. 35–36), the Yoneda functor turns it into a fibre product of
representable presheaves, and sheafification preserves fibre products.
`YonedaAdicSpace.spaYPullbackIso` states this, identifying the two projections with the sheaf maps
induced by `b ↦ b ⊗ 1` and `c ↦ 1 ⊗ c`. Consequently analytic Yoneda-adic spaces have fibre
products, computed in `Sh(CAffᵒᵖ, J_rat)`, and the fibre product of analytic Yoneda-adic spaces is
analytic (`isYonedaAdic_pullback`); its points surject onto pairs of points with the same image
(`exists_space_pullback`; the affinoid case is AdicSpacesPartII *fibre-product-points*, stated in
AdicSpacesPartII's Lean as `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.exists_pullback_point`, as in
[H96] Cor. 1.2.3(iii)(d), p. 49), not injectively.
Beyond the adic case the affinoid formula fails: the non-adic diagram
`(ℤ_p⟦T⟧, ℤ_p⟦T⟧) ← (ℤ_p, ℤ_p) → (ℚ_p, ℤ_p)` has no pushout of Huber pairs ([Berkeley] Lecture 5,
Rem. 5.1.7, p. 36; [KL I] §8.2, Rem. 8.2.5, p. 160). *Needs:* *yoneda-adic-analytic-tate-local*,
*generalized-adic-presentation*, *yoneda-adic-open-immersions*; AdicSpacesPartII layer R0
(completed tensor products, their plus rings and universal property, affinoid fibre products,
*fibre-product-points*); Mathlib `CategoryTheory.presheafToSheaf` (which preserves finite limits). README only (no Lean declaration).

**Checks.**

- *fibreProduct_polydisc* — `Spa^Y(ℚ_p⟨T⟩) ×_{Spa^Y(ℚ_p)} Spa^Y(ℚ_p⟨S⟩) ≅ Spa^Y(ℚ_p⟨T, S⟩)`.
- *fibreProduct_no_pushout* (non-example) — the diagram `(ℤ_p⟦T⟧, ℤ_p⟦T⟧) ← (ℤ_p, ℤ_p) → (ℚ_p, ℤ_p)`
  has no pushout in Huber pairs: in a pushout `D`, `T` is topologically nilpotent and `1/p ∈ D`,
  so `Tⁿ/p ∈ D⁺` for some `n`, which rules out a map to `ℤ_p⟨T, T^{n+1}/p⟩`.

**Checks for the algebraic and categorical interfaces of A1.1–A1.15.** Each label below names a
Check, to be formalised as an `example`; the formulas specify evaluation, addition and the order
of composition.

- *affinoidSystem_kernel_congruence* (unfolding): if a stage element maps to zero in
  the limit, it becomes divisible by `ϖⁿ` in a later stage ring of definition, for
  every `n`, by applying `detect_small` with zero in the base. The concrete
  two-stage system `K × K → K` is realised at `K = ℚ₂` in
  *AffinoidSystem_projection*: its nonzero kernel idempotent maps to zero, and both the
  transition and the first structure map are explicitly noninjective.
  *AffinoidSystem_constant_projection_excluded* rules out retaining its kernel in a
  one-stage system. The bounded-plus and
  unbounded-plus Checks distinguish whether a system can exhaust `A⁺` by its
  rings of definition.
- *Huber.Pair.finiteEtale_identity*: for `B = A`, the integral closure is `A⁺`, including a strict
  `A⁺ ⊊ A°`. The check *finiteEtale_algEquiv_coordinates* sends `b` to `b`; the check
  *finiteEtale_hom_coordinates* sends `x + y` to `x + y` under the identity algebra map.
- *kummer_gauss_prime_to_residue*: for a residue field `k` with `p ≠ 0` in `k`,
  `X^(p^n) − T` over `k(T)` is irreducible and separable; this includes `p = 2`,
  `k = 𝔽₃`. *kummer_gauss_level_zero* gives `X − T`, also in characteristic `p`.
- *filtration_index_direction*: for `G = ℤ/2` and the two-stage filtration `G ⊇ 1`,
  `relIndex(1,G) = 2`, while `relIndex(G,1) = 1`; the finite quotient in the filtration is
  `N_{<j}/N_j`, fixing the argument order of `Subgroup.relIndex`.
- *profinite_tower_identity*: the identity is a pullback of a surjection of finite sets.
  *profinite_tower_finite_surjection*: a finite surjection is such a pullback itself, including
  `Fin 2 → pt`. *profinite_tower_empty*: `∅ → pt` is not such a pullback.
- *quotient_point*: `G/G` has one point. *quotient_regular*: equality in `G/1` is equality in
  `G`. *quotient_map_values*: for `H ≤ K`, the quotient map sends `gH` to `gK`; successive
  maps `gH → gK → gL` keep the representative `g`. These distinguish `pt`, `regular`,
  `quotient`, `quotientMap`, and the underlying `carrier` and `carrierMap`.
- *sheafF_empty*: maps from the empty profinite set form the zero group.
  For discrete `G = Multiplicative (ZMod 2)` and trivial `M = ZMod 2`,
  *sheafF_add_values* computes `0 + 1 = 1` and `1 + 1 = 0` at the identity of the
  regular action; *sheafF_restriction_values* computes the restriction of the constant
  section `1` along `G → pt` as `1` at each of the two cosets.
  *ProfiniteGSet.test_FM_on_G* identifies evaluation at the identity with `M` and
  evaluation at the point with `M^G`; *sheafF_restriction_to_regular* gives the
  corresponding constant function for any section over the point.
- *finite_gset_identity*: the identity is a finite surjection pullback, `G`-étale and a
  `G`-tower. *finite_gset_regular_to_point*: for finite discrete `G`, the map `G → pt`
  has all three properties (for `G = ℤ/2`, its fibre has two points).
  *finite_gset_empty_to_point*: `∅ → pt` is `G`-étale but neither a surjection pullback nor
  a `G`-tower. These check `surjPullbacks`, `IsGEtale` and `IsGTower` separately.


**`YonedaAdicSpace.ofAdicSpace`.** The Yoneda embedding recovers the actual points and morphisms of the adic space. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace_ofAdicSpace_positive* (computation) — The Yoneda space of the two-sheeted Q₂ spectrum has exactly two points.
- *YonedaAdicSpace_ofAdicSpace_degenerate* (degenerate) — The empty adic spectrum remains empty after the embedding.
- *YonedaAdicSpace_ofAdicSpace_negative* (non-example) — The embedded three-cycle has no fixed point; the constant terminal embedding is excluded.

**`YonedaAdicSpace.IsFiniteEtale`.** The Yoneda finite étale predicate takes the entire inverse image of each affinoid chart. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace_IsFiniteEtale_positive* (computation) — The image of the split two-sheeted Q₂ cover is finite étale.
- *YonedaAdicSpace_IsFiniteEtale_degenerate* (degenerate) — The image of the empty split cover is finite étale.
- *YonedaAdicSpace_IsFiniteEtale_negative* (non-example) — The image of the open unit disc in the closed unit disc is not finite étale; permitting smaller source charts would incorrectly admit it.

**`YonedaAdicSpace.IsEtaleLocalDescription`.** Étale local descriptions allow proper open immersions and require analytic source and target. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace_IsEtaleLocalDescription_positive* (computation) — The Yoneda image of the open unit disc inclusion is étale.
- *YonedaAdicSpace_IsEtaleLocalDescription_degenerate* (degenerate) — The empty split cover has an étale local description.
- *YonedaAdicSpace_IsEtaleLocalDescription_negative* (non-example) — The map to Spa(Z,Z) has no analytic étale local description. A predicate testing only the source would miss the failure.

**`YonedaAdicSpace.ofAdicSpace_space`.** The homeomorphism identifies Yoneda points with adic valuations naturally in the adic space. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace_ofAdicSpace_space_positive* (computation) — The Yoneda image of the section selecting sheet 1 maps to valuation 1.
- *YonedaAdicSpace_ofAdicSpace_space_degenerate* (degenerate) — The one-point Q₂ spectrum maps to its normalized two-adic valuation.
- *YonedaAdicSpace_ofAdicSpace_space_negative* (non-example) — The same section cannot map to valuation 2; a separately permuted comparison on the split cover fails.

**`YonedaAdicSpace.mapsFromAdicSpaceEquiv`.** The comparison recovers the coefficient pullback of a map to an affinoid. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace_mapsFromAdicSpaceEquiv_sheet_one_value* (computation) — The section selecting sheet 1 pulls the characteristic function of sheet 1 back to 1.

- *YonedaAdicSpace_mapsFromAdicSpaceEquiv_identity_scalar* (degenerate) — For the identity spectrum map, the scalar 2 remains 2.

- *YonedaAdicSpace_mapsFromAdicSpaceEquiv_not_sheet_zero* (non-example) — Selecting sheet 0 instead would give 0 and fails the comparison.

**`YonedaAdicSpace.ofAdicSpace_globalFunctions`.** Global functions retain their ordered affinoid coefficients. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace_ofAdicSpace_globalFunctions_sheet_one_function* (computation) — The characteristic global function of sheet 1 has value 1 there.

- *YonedaAdicSpace_ofAdicSpace_globalFunctions_empty_functions* (degenerate) — The empty spectrum has the zero ring of global functions.

- *YonedaAdicSpace_ofAdicSpace_globalFunctions_not_sheet_zero* (non-example) — The same function is not 1 on sheet 0, rejecting a permuted coefficient comparison.

**`YonedaAdicSpace.smallEtaleTopology`.** Étale covering sieves of Yoneda-adic spaces detect the surjective split two-sheeted cover and the empty object. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace_smallEtaleTopology_fold_covers* (computation) — The two-sheeted fold generates a covering sieve.

- *YonedaAdicSpace_smallEtaleTopology_empty_covers_empty* (degenerate) — The empty sieve covers the empty embedded spectrum.

- *YonedaAdicSpace_smallEtaleTopology_empty_does_not_cover_point* (non-example) — The empty-to-one-sheeted arrow does not cover; the indiscrete topology is excluded.

**`YonedaAdicSpace.smallFiniteEtaleTopology`.** Finite étale covering sieves of embedded split spectra retain the finite-surjective cover and exclude an empty cover of a point. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace_smallFiniteEtaleTopology_fold_covers* (computation) — The two-sheeted fold generates a covering sieve.

- *YonedaAdicSpace_smallFiniteEtaleTopology_empty_covers_empty* (degenerate) — The empty sieve covers the empty embedded spectrum.

- *YonedaAdicSpace_smallFiniteEtaleTopology_empty_does_not_cover_point* (non-example) — The empty-to-one-sheeted arrow does not cover; the indiscrete topology is excluded.

**`YonedaAdicSpace.smallEtale_equiv_of_isLocallyStronglySheafy`.** For a locally strongly sheafy space, the inverse étale comparison embeds each source and preserves its labelled component maps. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace_smallEtale_equiv_of_isLocallyStronglySheafy_split_quadratic* (computation) — The inverse comparison has two points on the split two-sheeted cover.

- *YonedaAdicSpace_smallEtale_equiv_of_isLocallyStronglySheafy_empty_cover* (degenerate) — It sends the empty cover to an empty Yoneda space.

- *YonedaAdicSpace_smallEtale_equiv_of_isLocallyStronglySheafy_cycle_fixed_point_free* (non-example) — The geometric three-cycle has no fixed point after comparison; replacing its arrow by the identity fails.

**`YonedaAdicSpace.smallFiniteEtale_equiv_of_isLocallyStronglySheafy`.** The inverse finite étale comparison embeds the finite split source, including the zero-sheeted case, with its actual arrows. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace_smallFiniteEtale_equiv_of_isLocallyStronglySheafy_split_quadratic* (computation) — The inverse comparison has two points on the split two-sheeted cover.

- *YonedaAdicSpace_smallFiniteEtale_equiv_of_isLocallyStronglySheafy_empty_cover* (degenerate) — It sends the empty cover to an empty Yoneda space.

- *YonedaAdicSpace_smallFiniteEtale_equiv_of_isLocallyStronglySheafy_cycle_fixed_point_free* (non-example) — The geometric three-cycle has no fixed point after comparison; replacing its arrow by the identity fails.

**`YonedaAdicSpace.ofAdicSpace_spa`.** The affinoid comparison sends a section selecting a component to the valuation on that component. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace_ofAdicSpace_spa_sheet_one_valuation* (computation) — The section into sheet 1 has valuation 1 after the affinoid comparison.

- *YonedaAdicSpace_ofAdicSpace_spa_one_sheet_valuation* (degenerate) — On the one-point spectrum the identity comparison gives the normalized two-adic point.

- *YonedaAdicSpace_ofAdicSpace_spa_no_rotation* (non-example) — A comparison permuting sheet 1 to sheet 2 fails.

**`YonedaAdicSpace.finiteEtaleEquiv`.** The finite étale algebra equivalence has the same contravariant factor ordering in the Yoneda carrier. README only (no Lean declaration).

**Checks.**

- *YonedaAdicSpace_finiteEtaleEquiv_split_quadratic* (computation) — The split quadratic algebra gives a two-point Yoneda space.
- *YonedaAdicSpace_finiteEtaleEquiv_zero_algebra* (degenerate) — The zero algebra gives the empty Yoneda space.
- *YonedaAdicSpace_finiteEtaleEquiv_cycle_not_square* (non-example) — The three-cycle and its square induce distinct arrows.

### Examples

The worked examples of the layer are its checks, read in order along the build. For the morphisms
and sites of A1.1–A1.9: the Kummer covering `Spa(K⟨S, S⁻¹⟩) → Spa(K⟨T, T⁻¹⟩)`, `T ↦ S²` over a
complete extension of `ℚ_p` with odd `p`, is finite étale in A1's and in Huber's sense, is an étale
covering, restricts to a split covering over `{|T − 1| ≤ |p|}`, and is recovered by rational descent
from its restrictions to `{|T − 1| ≤ |p|}` and `{|T − 1| ≥ |p|}`; the rational inclusion
`{|T| ≤ |p|}` of the disc is étale but not finite étale, the squaring map of the disc is finite but
not étale, and the origin is finite and unramified but not étale; over a rank-two field `(K, K⁺)`
the plus ring of `K × K` is `K⁺ × K⁺`, the generic point is not an étale covering, and
`coker(j_!ℤ → ℤ)` is invisible to rank-one geometric points and visible at the closed point; for
`Spa(C, C⁺)` every étale covering has a member with a section, `X_fét` is split and the strict
localisation is `Spa(C, C⁺)` itself, while for `C⁺ ≠ O_C` the space doubled along `S ∖ {s}` is étale
but not split globally; for a field `K`, `X_fét ≃` finite continuous `Gal(K^sep/K)`-sets and
`O_{X_ét, ξ} = K^sep`; and on locally noetherian `X`, A1's site is Huber's `X_et` with Huber's
properties of étale maps available. For the pro-étale site: the Kummer tower over the torus is a
covering of `X_proét` in both the corrected and the printed sense, and for `X = Spa(C, O_C)` an open
surjection of profinite sets without section is not a covering; `ν^*` is fully faithful on sheaves
of sets and `(ν^*F)(X̃) = colim F(X_n)`; `ℤ_p → pt` and every Galois cover `Ũ → U` are coverings,
with `F(U) = F(Ũ)^G` for sheaves pulled back from the étale site; and
`Sh(X_{L̂,proét}) ≃ Sh(X_proét/X_L)`, through the objects with qcqs stages, for
`X = Spa(ℚ_p⟨T^{±1}⟩)` and `L = ℚ_p(μ_{p^∞})`. For the Yoneda-adic spaces:
`Spa^Y(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` is AdicSpaces's closed disc, the open disc is Yoneda-adic and not affinoid,
and for Rost's pair `Spa^Y` is not faithful. Alongside them stand the non-examples that fix the
hypotheses: a proper open immersion is not a tower, the Ribes–Zalesskii [RZ] surjection is pro-étale,
surjective and open yet not a covering, the summand inclusions of `X ⊔ X` cover only because a
second factor is allowed, geometric-point stalks are not conservative, and `S ↦ C(T, S)` is not a
point.

### Dependencies

Inside AdicEtaleGeometry: layer A0 for pullbacks along rational open immersions and finite étale
maps (*rational-pullback-comparison*, *finite-etale-pullback-comparison*).
The finite-stage approximation uses PerfectoidSpaces P3, whose henselian-pair inputs are
A4's *henselian-pairs-filtered-colimit* and *power-bounded-henselian-along-pseudouniformizer*.
These algebraic inputs depend on completeness and henselian pairs, independently of the
étale sites of A1. Within the layer, A1.10–A1.15 use A1.1–A1.9 for `X_ét`, `X_fét`, finite étale and
étale morphisms, geometric points, the Galois category and the étale slice site, and the Kedlaya–Liu
site of an arbitrary analytic adic space (A1.9) uses the Yoneda-adic spaces of A1.16. Other
roadmaps: AdicSpacesPartII layer R0 (Huber's finite and étale morphisms and finite algebras over
noetherian affinoids, the étale structure 1.7.1–1.7.2 and openness 1.7.8, the import of Huber's
Lemma 2.2.8, locally noetherian spaces, fibre products and completed tensor products, valuation
amalgamation, finite étale algebras 1.6.6(ii), Tate norms) and layer R3 (Čech acyclicity of sheafy
affinoids, Kiehl's theorem); DiamondsAndVStacks layer D0 (pro-categories, cofiltered limits of
spectral spaces, qcqs objects, algebraic topoi); the Foundations of adic
spaces roadmap (AdicSpaces), layers 0 and 2–5 (completion of Huber pairs and the open mapping
theorem, analytic points, the rational-subset calculus and rational localisation with its universal
property and the category `𝒱`, the structure presheaf and sheafiness of strongly noetherian Tate
pairs, adic spaces with gluing and open subspaces). Mathlib and Tau Ceti as named in the `*Needs:*`
clauses: étale and finite projective algebras, integral closure and module topologies; Galois
categories and fibre functors; pro- and ind-categories, pretopologies, coverages, sheafification,
continuous functors and sheaf pullback, slice topologies, transfinite compositions, dense subsites,
points of a topology; profinite sets; Huber pairs, the adic spectrum, rational subsets and the
analytic-locus lemmas. Sheafiness of finite étale algebras over a merely sheafy Tate pair is kept
as a hypothesis throughout; strong sheafiness, perfectoid and sousperfectoid rings (PerfectoidSpaces
layers P2–P3, AdicSpacesPartIV layer R5) supply it, and the Yoneda-adic spaces carry the non-sheafy
case. Consumers: AdicSpacesPartIV layers R4 (re-export of the sites on the R0/R1 carriers,
geometric points, slices, pro-étale functoriality) and R5, PerfectoidSpaces layers P3–P4 and PerfectoidTowers P9,
the `p`-adic Hodge theory, étale-cohomology, `A_inf`-cohomology and Shimura-variety roadmaps,
AdicEtaleGeometry layers A2–A4, DiamondsAndVStacks layer D6.

## Layer A2: separatedness, smooth charts, and classical analytic geometry

This layer is the geometric comparison interface of the roadmap with AdicSpacesPartII layers R0
(separated, proper and smooth morphisms) and R1 (analytification), and AdicSpacesPartIII layers
R2 (formal models and generic fibres) and F0 (noetherian formal schemes), in the scope that the
étale-cohomology roadmaps and
the diamond layers use, on the same carriers and without any derived comparison theorem (the
étale-cohomology roadmaps own specialization and nearby cycles). It
cites R0's separatedness, properness and valuative criteria in the form its consumers use,
constructs the relative balls and tori that R0 uses only
affinoid-locally, compares Huber's smooth morphisms with the local ball charts of [ECD], supplies
compatible toric charts for smooth morphisms and the dimension theory that the dimension estimates
need, and proves the comparisons of analytification and of generic fibres with these objects and
with the étale site of AdicEtaleGeometry layer A1. It builds on AdicSpacesPartII layers R0–R1,
AdicSpacesPartIII layers F0/R2 and AdicSpacesPartIV layer R4, on AdicEtaleGeometry layer A0
(analytic loci, rational and finite étale pullbacks)
and layer A1 (étale morphisms by local description, the étale site), on the Foundations of adic
spaces roadmap (AdicSpaces), layers 1, 2, 3 and 5, and on Mathlib's `topologicalKrullDim`. Its
consumers are AdicEtaleGeometry layer A3; the étale-cohomology roadmaps (including the henselian
part of their specialisation theory); the adic-coefficient roadmaps; DiamondsAndVStacks layers D3
and D6; the `p`-adic Hodge theory roadmaps; and the six-functor
roadmap for diamonds ([ECD] §24, Prop. 24.4).

The standing conventions are these. Unless stated otherwise, spaces are analytic adic spaces
covered by open affinoids with complete stably sheafy rings — in particular locally noetherian
analytic adic spaces (AdicSpacesPartII layer R0, locally noetherian adic spaces), which is Huber's
scope and the scope of every comparison with Huber's definitions; smooth morphisms of
non-noetherian analytic spaces ([ECD] §24, Prop. 24.4, p. 156) are defined by ball charts, and
the closed embedding of an affinoid étale object into a relative ball over an affinoid perfectoid
base ([ECD] §6, proof of Prop. 6.4(iv), p. 28) belongs to AdicEtaleGeometry layer A3. Separated,
proper and partially proper are R0's notions ([H96] §1.3, Def. 1.3.1–1.3.3, p. 51), defined for morphisms
locally of (+)weakly finite type so that the diagonal and the base changes exist; they are not the
v-stack notions of DiamondsAndVStacks layers D3 and D6. On locally noetherian spaces, smooth and
étale are Huber's infinitesimal notions (AdicSpacesPartII layer R0), which agree with the
local-description notions of layer A1 by Huber's Lemma 2.2.8 ([H96] §2.2, Lem. 2.2.8, pp. 116–117). Balls and
tori are relative to a base `X`: `B^n_X = X ×_{Spa ℤ} Spa(ℤ[T], ℤ[T])` with plus ring `B⁺⟨T⟩` on
charts, and `T^n_X = {|T₁ ⋯ Tₙ| ≥ 1} ⊆ B^n_X`, of radius 1 unless stated. Dimension is the Krull
dimension of the underlying topological space ([H96] §1.8, Def. 1.8.1, p. 90), not of a ring; for a
smooth morphism whose `Ω` has constant rank `d`, R0's relative dimension `d` is the relative pure
dimension in this topological sense (*smooth-pure-relative-dimension*).

### A2.1 separated, proper and partially proper morphisms

**Separated, proper and partially proper morphisms and their valuative criteria.**
(*supplier-contract-separated-proper-smooth*) The following are AdicSpacesPartII layer R0 README targets for
`TauCeti.AdicSpace`. The adic `IsSeparated` and `IsProper` and their
`RigidSpace K` counterparts have separate carriers. The adic valuative criteria and the names below are
supplier targets; their rigid-space versions do not by themselves state these adic results. Let `f : X → Y` be a
quasi-separated morphism of analytic adic spaces (*analytic-locus-restriction*), locally of
weakly finite type, with `X` covered by open affinoids with complete stably sheafy rings (for
instance `X` locally noetherian), so that the diagonal `Δ_f : X → X ×_Y X` and the affinoid
fibre products exist (R0 *fibre-products-existence*; every morphism of analytic adic spaces is
adic). Clauses 2 and 3 assume moreover that `f` is locally of +weakly finite type. Then:

1. `f` is separated (R0 `IsSeparated`: the image of `|Δ_f|` is closed in `|X ×_Y X|`, [H96] §1.3,
   Def. 1.3.1, p. 51) iff `Δ_f` is a closed embedding (R0 `IsSeparated.iff_closedImmersion_diagonal`,
   *separated-diagonal-closed-embedding*) iff for every valuation ring `(x, A) ∈ X_v` of R0
   *adic-valuation-rings-and-centres* and every `y ∈ Y` there is at most one centre `z` of
   `(x, A)` on `X` with `f(z) = y` (R0 `IsSeparated.iff_valuativeCriterion`,
   *valuative-criterion-separated*; [H96] §1.3, Prop. 1.3.7, pp. 52–53);
2. `f` is partially proper iff for every `(x, A) ∈ X_v` and every centre `y` of `(x, A)` on `Y`
   there is exactly one centre `z` of `(x, A)` on `X` with `f(z) = y` (R0
   `IsPartiallyProper.iff_valuativeCriterion`, *separated-proper-partially-proper*; [H96] §1.3,
   Cor. 1.3.9, pp. 54–55);
3. if moreover `f` is quasi-compact, the same condition characterises properness (R0
   `IsProper.iff_valuativeCriterion`, *separated-proper-partially-proper*), and proper is
   partially proper and quasi-compact (R0 `IsProper.iff_isPartiallyProper_and_quasiCompact`,
   *proper-iff-partially-proper-quasi-compact*; [H96] §1.3, Lem. 1.3.4, pp. 51–52);
4. closed embeddings are proper (R0 *closed-embedding-proper*), finite morphisms to analytic adic
   spaces are proper (R0 `IsFinite.isProper`, *finite-morphisms*; [H96] §1.4, Lem. 1.4.5(ii)–(iii),
   p. 62), and separated, universally closed and proper morphisms are stable under composition (R0
   `IsSeparated.comp`, `UniversallyClosed.comp`, `IsProper.comp`, *proper-comp*) and under base
   change along adic morphisms (R0 `IsSeparated.baseChange`, `UniversallyClosed.baseChange`,
   `IsProper.baseChange`, *proper-base-change*).

Huber's definitions are [H96] §1.3, Def. 1.3.1–1.3.3, p. 51 (separated: locally of weakly finite
type with closed diagonal; proper and partially proper: locally of +weakly finite type, separated,
and universally closed, resp. universally specializing, proper being moreover quasi-compact);
the valuative criteria are proved there only for analytic spaces ([H96] §1.3, before Def. 1.3.5,
p. 52), which is why the clauses above are stated for analytic `X` and `Y`. The same notions are the ones AdicSpacesPartII layers
R1 and R2 compare with analytification and with formal models. Outside these hypotheses the
classical notions are not used: the structure map of a nontrivial perfectoid extension of `ℚ_p`
is not locally of +weakly finite type, although a perfectoid space does have separated morphisms
in this sense, such as its identity. They are distinct from the notions for small v-stacks
([Berkeley] Lecture 17, Def. 17.4.5, p. 156; [Berkeley] Lecture 17, Prop. 17.4.6, p. 156, the
v-sheaf valuative criterion; [Berkeley] Lecture 17, Cor. 17.4.8, p. 157, the v-sheaf analogue of
clause 3; [ECD] §18, before Prop. 18.6, p. 103, where the consumers use Huber's classical
notions), whose comparison with these is DiamondsAndVStacks layers D3 and D6's. *Needs:*
AdicSpacesPartII layer R0 (*fibre-products-existence*, *separated-morphism*,
*separated-diagonal-closed-embedding*, *adic-valuation-rings-and-centres*,
*valuative-criterion-separated*, *separated-proper-partially-proper*,
*proper-iff-partially-proper-quasi-compact*, *closed-embedding-proper*, *finite-morphisms*,
*proper-comp*, *proper-base-change*); AdicSpacesPartII layer R1 (analytification and
separatedness, properness); AdicSpacesPartIII layer R2 (properness of generic fibres);
*analytic-locus-restriction*. README only (no Lean declaration).

**Checks** (AdicSpacesPartII’s adic separatedness and properness predicates).

- *IsProper_test_projectiveLine* (computation) — the analytified projective line
  `P^{1,ad}_K → Spa(K, K°)` is proper: every pair `(x, A)` has exactly one centre.
- *IsProper_test_closedDisc* (non-example) — the closed unit disc over `K` is separated and
  quasi-compact but not proper: the valuation ring `A_∞` at the Gauss point (the preimage of the
  valuation ring of `K̃(T)` at `T = ∞`) has no centre on the disc.
- *IsProper_test_openDisc* (non-example) — the open unit disc is partially proper and not
  quasi-compact, hence not proper.
- *IsSeparated_test_doubledOrigin* (non-example) — the unit disc with doubled origin, glued
  along `D ∖ {0}`, is not separated; it is not quasi-separated either, and it satisfies the
  uniqueness of centres (the origin is a closed rank-one point, a specialisation of nothing but
  itself), so it lies outside clause 1. The quasi-separated non-separated witness is the disc
  doubled along `{|ϖ| ≤ |T|}`, where the Gauss point `x₁` of the disc of radius `|ϖ|` with the
  valuation ring at `T/ϖ = 0` has two centres, one in each copy (R0
  *valuative-criterion-separated*).
- *IsProper_test_finite* (degenerate) — the identity, every closed embedding, and
  `Spa(L, L°) → Spa(K, K°)` for a finite extension `L/K` are proper; finite morphisms satisfy
  existence and uniqueness of centres because integral plus rings lie in every valuation ring
  containing the base plus ring.
- *canonicalCompactification_consumer* (consumer instance, DiamondsAndVStacks layers D3 and D6)
  — [ECD] §18 recalls Huber's canonical compactifications of analytic adic spaces ([H96] §5.1,
  Thm. 5.1.5, pp. 273–274), for locally noetherian analytic spaces and morphisms locally of
  +weakly finite type that are separated and taut. The compactification is partially proper;
  it is proper when the original morphism is quasi-compact ([H96] §5.1, Cor. 5.1.6, p. 274).
  [ECD] Prop. 18.6 is the v-stack analogue.

### A2.2 relative closed polydiscs

The affinoid algebra targets — in `Suggested.lean` `Huber.Pair.polydiscPlus`,
`Huber.Pair.isRingOfIntegralElements_polydiscPlus`, `Huber.Pair.polydisc` (the pair
`(A⟨T⟩, A⁺⟨T⟩)`), `Huber.Pair.polydisc.proj` and `Huber.Pair.polydisc.existsUnique_hom` (the
universal property, with its coordinate evaluation), and, README only,
`relativePolydisc.coord_affinoid`, `relativePolydisc.baseChangeIso_affinoid`,
`relativePolydisc.addIso_affinoid` and `relativePolydisc.zeroIso_affinoid` — use arbitrary complete
Hausdorff Huber pairs. Here `Huber.Pair.polydiscVar` is the image of `weightedX` in the completed
restricted-series ring; `Huber.Pair.polydiscPlus` is the topological closure of the subring
generated by the base plus ring and those coordinates. The base-change theorem uses an adic homomorphism `A → A'` of complete
Hausdorff Huber rings (AdicSpacesPartII's `IsAdicHom`, the hypothesis under which its
`Huber.CompletedTensor` carries a specified topology) and identifies constants and coordinates;
it is R0's `Pair.completedTensorRestrictedEquiv` (*completed-tensor-restricted-power-series* (b))
at the weights `{1}`, landing in `restrictedMvPowerSeriesCompletion n A'` itself and pinned as a
homeomorphism fixing constants and coordinates. The product theorem
sends the first factor to the first `m` coordinates and the second to the last `n`.
The zero-variable theorem additionally tracks the plus ring, beyond the supplier’s
zero-variable ring equivalence. These algebra statements require no sheafiness.
The global targets below additionally impose the stated stable-sheafiness hypotheses. Their
carrier is Tau Ceti's category `TauCeti.AdicSpace` (the full subcategory of
`TauCeti.PreAdicSpace` on `PreAdicSpace.isAdic`): over an affinoid base the chart
`Spa(A⟨T⟩, A⁺⟨T⟩)` is the presentation-limit pre-adic space
`ValuationSpectrum.presentationLimitPreAdicSpace` of the pair `Huber.Pair.polydisc`, an
affinoid pre-adic space by `PreAdicSpace.isAffinoid_presentationLimitPreAdicSpace`, and an adic
space once its structure presheaf is a sheaf (`TauCeti.ValuationSpectrum.isAdic_presentationLimitPreAdicSpace`;
for `A` strongly noetherian Tate, Tau Ceti's `TauCeti.Huber.isSheafyRing_of_isStronglyNoetherian`).

**The relative closed unit polydisc.** (*relative-closed-polydisc*) Let `X` be an adic space
(AdicSpaces, layer 5) covered by open affinoids `Spa(B, B⁺)` with `B` complete and stably sheafy
(for instance `X` locally noetherian), and `n ≥ 0`. In `AdicSpace`, define `relativePolydisc` as
`B^n_X := X ×_{Spa(ℤ, ℤ)} Spa(ℤ[T₁, …, Tₙ], ℤ[T₁, …, Tₙ])`, both rings discrete and the plus ring
of the second factor being `ℤ[T₁, …, Tₙ]` itself; the fibre product exists because
`Spa(ℤ[T], ℤ[T]) → Spa(ℤ, ℤ)` is of finite type (AdicSpacesPartII layer R0, fibre product along a
map of finite type; Mathlib `CategoryTheory.IsPullback.paste_horiz` for pasting the affinoid
charts). It comes with `relativePolydisc.proj`, the projection `π : B^n_X → X`, and
`relativePolydisc.coord`, the coordinates `T₁, …, Tₙ ∈ O⁺(B^n_X)`. Prove: (a)
`relativePolydisc.affinoidChart` — over an open affinoid `Spa(B, B⁺) ⊆ X`,
`π⁻¹(Spa(B, B⁺)) ≅ Spa(B⟨T₁, …, Tₙ⟩, B⁺⟨T₁, …, Tₙ⟩)` over `Spa(B, B⁺)`, compatibly with the
coordinates, where `B⟨T⟩` is the completed ring of restricted power series (Tau Ceti
`Huber.restrictedMvPowerSeriesCompletion`, Mathlib `MvPolynomial`) and `B⁺⟨T⟩` the series with
all coefficients in `B⁺` ([Berkeley] Lecture 4, §4.1, the adic closed unit disc, p. 27, the chart
formula over a field; [ECD] §24, after Prop. 24.4, p. 156, ECD's affinoid ball `B^n_Y`;
[Berkeley] Lecture 10, Lem. 10.5.8, for the same pair), together
with `Huber.Pair.isRingOfIntegralElements_polydiscPlus` — for a complete Huber pair `(B, B⁺)`,
`B⁺⟨T⟩ = {h : v(h) ≤ 1 on Spa(B⟨T⟩, B⁺⟨T⟩)}` is integrally closed in `B⟨T⟩` and is a ring of
integral elements, being the set of functions bounded by 1 on the adic spectrum (Gauss extensions
of the points of `Spa(B, B⁺)`; Tau Ceti `TauCeti.ValuationSpectrum.spa_integralClosure`), so that
`B⁺⟨T⟩` is Huber's plus ring and ECD's; (b) `relativePolydisc.homEquiv` — for an adic space `Z`
over `X`, `Hom_X(Z, B^n_X) ≃ (Fin n → O⁺_Z(Z))`, `h ↦ (h^*Tᵢ)ᵢ`, natural in `Z`, so `B^n_X`
represents `Z ↦ O⁺_Z(Z)ⁿ` ([Berkeley] Lecture 4, §4.1, the adic closed unit disc, p. 27:
`Spa ℤ[T]` represents `X ↦ O⁺_X(X)`); (c) `relativePolydisc.baseChangeIso` —
`B^n_X ×_X X' ≅ B^n_{X'}` over `X'`, compatibly with the coordinates, for `X' → X` with `X'` of
the same kind (the fibre product exists because `π` is of finite type; the affinoid statement
`relativePolydisc.baseChangeIso_affinoid` is stated for adic `X' → X`, the case in which R0's
completed tensor product is specified), and `relativePolydisc.addIso` — `B^{m+n}_X ≅ B^m_X ×_X B^n_X`; (d)
`relativePolydisc.smooth` — for `X` locally noetherian, `π` is smooth in the sense of
AdicSpacesPartII layer R0 (smooth morphisms, Huber's infinitesimal notion, defined only on locally
noetherian spaces), with `Ω_{B^n_X/X}` free on `dT₁, …, dTₙ` (for general `X`, `π` is locally
étale over a relative ball by `IsLocallyEtaleOverPolydisc.relativePolydisc` of
*smooth-morphism-ball-charts*), and `relativePolydisc.quasiCompact_proj` —
`π` is quasi-compact, and `relativePolydisc.separated_proj` — `π` is separated;
`relativePolydisc.isLocallyNoetherian` and
`relativePolydisc.isAnalytic` — `B^n_X` is locally noetherian, resp. analytic, when `X` is; (e)
`relativePolydisc.isOpenImmersion_affineSpace` — for `X` locally noetherian and analytic, `B^n_X`
is the open subspace `{|T₁|, …, |Tₙ| ≤ 1}` of the relative affine space `A^n_ℤ ×_{Spec ℤ} X`
(AdicSpacesPartII layer R1, relative analytification); `relativePolydisc_spa_field` — over
`Spa(K, K°)` for a complete nonarchimedean field `K`, `|Bⁿ|` is Tau Ceti's `closedPolydisc n K`
(Tau Ceti `ValuationSpectrum.closedPolydisc`); and `relativePolydisc.zeroIso` — `B⁰_X ≅ X`. The
plus ring is `B⁺⟨T⟩`, not the power-bounded subring `B⟨T⟩°`: over `Spa(K, K⁺)` with `K⁺ ⊊ K°`
the fibre is `Spa(K⟨T⟩, K⁺⟨T⟩)`, whereas Tau Ceti's `closedPolydisc` over `K` uses
`K⟨T⟩° = K°⟨T⟩`; the radius is 1, and the polydiscs of radius `|ϖ|^{−k}` are the rational subsets
`{|ϖᵏTᵢ| ≤ 1}` of the relative affine space (for `K = ℚ_p`, `ϖ = p`, `k = 1`: the point `T = 1/p`
has `|p · (1/p)| = 1 ≤ 1`, so it lies in the disc of radius `p`, and `|1/p| = p > 1`, so it does
not lie in `B¹`) ([Berkeley] Lecture 4, §4.1, the adic affine line, p. 27: the plus ring
distinguishes the ball from the affine line). The base need not be Tate: over `Spa(ℤ_p, ℤ_p)`,
`B¹` is `Spa(ℤ_p⟨T⟩, ℤ_p⟨T⟩)`, quasi-compact and not analytic, whose analytic locus is `B¹` over
`Spa(ℚ_p, ℤ_p)`. This `B^n_X` is Huber's
relative ball over a Tate base ([H96] §1.6, Cor. 1.6.10, p. 80) and the ball over a
non-noetherian base of [ECD] §6, proof of Prop. 6.4(iv), p. 28. The existence of the fibre product
and the chart (a) are AdicSpacesPartII layer R0's *fibre-product-along-finite-type* and
*completed-tensor-restricted-power-series* (where the plus ring is taken as an integral closure),
and the smoothness in (d) with `Ω` free on the `dTᵢ` is R0's *restricted-power-series-smooth*;
`homEquiv`, `Huber.Pair.isRingOfIntegralElements_polydiscPlus` (which shows that no integral
closure is needed) and the globalisation over a non-affinoid `X` are the content here. *Needs:*
AdicSpacesPartII layer R0 (*fibre-product-along-finite-type*,
*completed-tensor-restricted-power-series*, *restricted-power-series-smooth*; smooth morphisms
and their differentials, quasi-compact and separated morphisms); AdicSpacesPartII layer R1 (the
relative affine space); *analytic-locus-restriction*; Tau Ceti
`Huber.restrictedMvPowerSeriesCompletion`,
`ValuationSpectrum.closedPolydisc`, `TauCeti.ValuationSpectrum.spa_integralClosure`; Mathlib
`MvPolynomial`, `CategoryTheory.IsPullback.paste_horiz`.

The proposed signature `AdicSpace.relativePolydisc.quasiCompact_proj` uses Mathlib's
`IsSpectralMap (AdicSpace.base π)`: inverse images of compact opens are compact, with no
compactness assumption on `X`. `AdicSpace.relativePolydisc.separated_proj` supplies an actual
`AdicSpace.FibreProduct π π` and states that its diagonal has closed image, precisely the
condition in R0's [*separated-morphism*](../AdicSpacesPartII/README.md#r010-separated-universally-closed-proper-and-partially-proper-morphisms).
`AdicSpace.relativePolydisc.isAnalytic` assumes only `IsAnalytic X` in addition to the
stable-sheafiness needed to construct the ball; local noetherianity is unnecessary.

The field case of (e) specialises `relativePolydisc.affinoidChart` to the
identity chart of `Spa(K,K°)`. It gives an isomorphism from the global ball to
`Spa(K⟨T⟩,K°⟨T⟩)`, commuting with the projection and sending each coordinate to the
corresponding restricted-series variable. Together with its affinoid form, it gives a
homeomorphism from the global ball's
underlying space to `ValuationSpectrum.closedPolydisc n K`; its map on valuations is explicitly
comap along `Completion.coeRingHom` after the affinoid isomorphism. Thus the comparison fixes
the coordinates and topology, including `n = 0`.

The target `relativePolydisc.isOpenImmersion_affineSpace` uses R1's
[*scheme-fibre-product-analytification*](../AdicSpacesPartII/README.md#r12-hubers-fibre-product-of-a-scheme-and-an-adic-space)
for `Aⁿ_ℤ → Spec ℤ` and the base `X`, with image defined by `|Tᵢ| ≤ 1` for every `i`.
The ambient space is R1’s `AdicSpace.SchemePullback` of affine space and `X`
over `Spec ℤ`. Its proposed Lean characterization represents unrestricted tuples of global sections
over `X`, fixing this ambient space up to unique isomorphism. The immersion respects the projection to `X` and identifies each
affine coordinate with the corresponding bounded polydisc coordinate.

Lean: `Huber.Pair.polydiscVar`, `Huber.Pair.polydiscPlus`,
`Huber.Pair.isRingOfIntegralElements_polydiscPlus`, `Huber.Pair.polydisc`,
`Huber.Pair.polydisc.proj` and `Huber.Pair.polydisc.existsUnique_hom` (the affinoid form over a
complete Huber pair: the chart pair of (a), its plus ring, and the universal property (b) for maps
into complete pairs); the global `relativePolydisc` and the rest are README only.

**Checks.**

- *relativePolydisc_quasiCompact_proj_empty_base* (degenerate) — the two-variable projection
  over the empty split affinoid is quasi-compact.
- *relativePolydisc_isAnalytic_twoadic_disc* (computation) — the one-variable ball over
  `Spa(Q₂,Z₂)` is analytic.
- *relativePolydisc_isAnalytic_discrete_zero* (non-example) — the zero-variable ball over the
  discrete integer affinoid is not analytic; stable sheafiness alone does not imply analyticity.
- *relativePolydisc_spa_field_zero_variables* (degenerate) — the global zero-variable ball over
  `Spa(Q₂,Z₂)` is homeomorphic to `closedPolydisc 0 Q₂`.
- *relativePolydisc_spa_field_coordinate_order* (computation, non-example) — on the global
  two-variable ball over `Spa(Q₂,Z₂)`, the affinoid comparison pulls the second coordinate back
  to the second restricted-series variable, which differs from the first.

- *relativePolydisc_test_Qp* (computation) — `B¹` over `Spa(ℚ_p, ℤ_p)` is
  `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, the closed unit disc (`Spa ℤ[T] × Spa K = Spa K⟨T⟩`, [Berkeley]
  Lecture 4, §4.1, p. 27), and its `(ℚ_p, ℤ_p)`-points are `ℤ_p`; the general extension-field
  formula is the global `relativePolydisc.homEquiv` target.
- *relativePolydisc_test_zero* (degenerate) — `B⁰_X = X` with `π` the identity
  (`relativePolydisc.zeroIso_affinoid`); computed instance: over `Spa(ℚ_p, ℤ_p)`, `B⁰` has exactly
  one point, as `Spa(ℚ_p, ℤ_p)` does, whereas `B¹` has infinitely many (its classical points
  `T ↦ c`, `c ∈ ℤ_p`). When formalised, the check asserts infinitude of the valuation-spectrum
  subset defining `B¹`, alongside both zero-dimensional point counts.
- *relativePolydisc_test_Zp* (computation, non-Tate base) — over `X = Spa(ℤ_p, ℤ_p)` (a complete
  noetherian, non-Tate Huber ring, `ℤ_p° = ℤ_p`), `B¹_X = Spa(ℤ_p⟨T⟩, ℤ_p⟨T⟩)` with plus ring the
  whole ring, `Hom_X(Spa(ℚ_p, ℤ_p), B¹_X) = ℤ_p` (`T ↦ 1` and `T ↦ p` are points, `T ↦ 1/p` is
  not). When formalised, the equivalence sends a pair morphism over the canonical inclusion
  `ℤ_p → ℚ_p` to its value on `T`, with separate clauses for these three coordinates.
  `B¹_X` is quasi-compact (one affinoid) and not analytic — the `T`-adic valuation of
  `𝔽_p[T] = ℤ_p⟨T⟩/p` is a non-analytic point — so clause (e) and the comparison
  AdicSpacesPartII R1’s *analytic-affine-space* do not apply to it, while its analytic locus is
  `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, the `B¹` of *relativePolydisc_test_Qp* and the generic fibre of
  *genericFibre_restrictedPowerSeries*.
- *relativePolydisc_test_notAffineLine* (non-example) — `B¹_{Spa K}` is not
  `Spa(ℤ[T], ℤ) ×_{Spa ℤ} Spa K` (the adic affine line, an increasing union of the discs
  `{|ϖⁿT| ≤ 1}`, not quasi-compact): replacing the plus ring `ℤ[T]` by `ℤ` changes the object.
  When formalised, the check uses `Spa(ℚ₂,ℤ₂)`: the ball is quasi-compact and excludes the affine-line
  point `T = 1/2`.
- *relativePolydisc_test_rankTwoPlus* (non-example) — for a complete rank-one field `K` and a
  ring of integral elements `K⁺ ⊊ K°`, the fibre of `B¹` over `Spa(K, K⁺)` is
  `Spa(K⟨T⟩, K⁺⟨T⟩)`, which strictly contains `Spa(K⟨T⟩, K°⟨T⟩)`; a definition with plus ring
  the power-bounded subring loses the points over the rank-two point of `Spa(K, K⁺)`.
- *relativePolydisc_test_closedPolydisc* (compatibility) — over `Spa(K, K°)` for a complete
  nonarchimedean field `K`, the underlying set of `Bⁿ` is Tau Ceti's `closedPolydisc n K` (as
  subsets of `Spv` of the restricted power series ring, through the completion map;
  `relativePolydisc_spa_field_affinoid`); computed instance: Tau Ceti's Gauss point
  `gaussPoint` of radius `1` over `ℚ_p` is the image of a point of `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`. A
  definition with plus ring the whole ring `ℚ_p⟨T⟩` fails this, the Gauss point having
  `|p⁻¹| > 1`.
- *relativePolydisc_test_homEquiv* (characterisation) — for an adic space `Z` over `X`, the map
  `Hom_X(Z, B^n_X) → O⁺_Z(Z)ⁿ`, `h ↦ (h^*Tᵢ)ᵢ`, is bijective; for `Z = X` it sends the zero
  section to `(0, …, 0)`.
- *relativePolydisc_test_ecdAffinoidBall* (compatibility) — [ECD] §24, Prop. 24.4, p. 156,
  defines `B^n_Y` for affinoid `Y = Spa(A, A⁺)` as `Spa(A⟨T₁, …, Tₙ⟩, A⁺⟨T₁, …, Tₙ⟩)`;
  `relativePolydisc.affinoidChart` recovers it, and the construction globalises it.
- *relativePolydisc_test_radius* (convention) — over `ℚ_p`, `|p·p⁻¹| = 1` whereas
  `|p⁻¹| = p > 1`; these two values distinguish the enlarged disc from the unit disc.
- *relativePolydisc_test_zeroRing* (degenerate) — over the zero ring the plus ring is
  the whole zero ring and the spectrum is empty for every `n`. In particular, the
  assertion that a positive-dimensional ball over a perfectoid base is not perfectoid
  requires a nonempty base.
- *relativePolydisc_test_emptyTuple* — The zero-variable Q₂ chart contains the projected scalar 2 in its plus ring and excludes the projected scalar 1/2; evaluation of the empty tuple returns 2 on the former.
- *relativePolydisc_test_twoCoordinates* (computation) — evaluation at `(0, 1)` sends the
  first coordinate to `0`, the second to `1`, and every projected constant `a` to `a`.
- *relativePolydisc_test_twoTerm* (computation) — for `T = p` over `ℚ_p`, evaluation sends
  `1 + pT` to `1 + p²` and the projected constant `p` to `p`, including `p = 2`.
- *relativePolydisc_test_addOrder* — The equivalence selected by `addIso_affinoid 1 1` sends the first tensor variable to coordinate 0 and the second to coordinate 1.
- *relativePolydisc_consumers* (consumer instances) — the closed embedding `Y ↪ B^n_X` of [ECD]
  §6, proof of Prop. 6.4(iv), p. 28, over an affinoid perfectoid `X` (AdicEtaleGeometry layer A3, where `B^n_X`
  is sousperfectoid by AdicSpacesPartIV layer R5, sousperfectoid rings), and Huber's relative
  balls in [H96] §1.6, Cor. 1.6.10 and in the étale-cohomology roadmaps.


**`AdicSpace.relativePolydisc.zeroIso`.** The zero-dimensional ball comparison is the structural projection, preserving every section of the base. README only (no Lean declaration).

**Checks.**

- *AdicSpace_relativePolydisc_zeroIso_positive* (computation) — The empty tuple over sheet 1 of the split three-point base returns point 1.
- *AdicSpace_relativePolydisc_zeroIso_degenerate* (degenerate) — The empty tuple over the identity of the Q₂ point returns the identity map.
- *AdicSpace_relativePolydisc_zeroIso_negative* (non-example) — The empty tuple over sheet 1 does not return point 2; composing the comparison with a base permutation fails.

**`AdicSpace.relativePolydisc.addIso`.** Additivity splits the ordered tuple: indices `Fin.castAdd n i` give the first factor and `Fin.natAdd m j` the second. The equations `addIso_over` and `addIso_coordinates` fix the comparison through the representing property. README only (no Lean declaration).

**Checks.**

- *AdicSpace_relativePolydisc_addIso_positive* (computation) — For the Q₂-valued point (0,1), the coordinate of the first factor pulls back to 0.
- *AdicSpace_relativePolydisc_addIso_degenerate* (degenerate) — For dimensions (1,0), the point with coordinate 1 retains coordinate 1 in the first factor.
- *AdicSpace_relativePolydisc_addIso_negative* (non-example) — For the point (0,1), the first coordinate is not 1. Interchanging the two one-dimensional factors fails.

**`AdicSpace.IsLocallyStablySheafy`.** Stable sheafiness is local on affinoid charts and does not require analyticity. README only (no Lean declaration).

**Checks.**

- *AdicSpace_IsLocallyStablySheafy_split_tate_charts* (computation) — The split two-adic two-point spectrum has stably sheafy Tate charts.

- *AdicSpace_IsLocallyStablySheafy_empty_space* (degenerate) — The empty spectrum satisfies the local condition.

- *AdicSpace_IsLocallyStablySheafy_discrete_integer_chart* (non-example) — The discrete integer spectrum is locally stably sheafy but not analytic. Requiring Tate charts would wrongly exclude it.

### A2.3 relative tori

The signatures ending in `_affinoid` use complete Hausdorff Huber pairs, not necessarily Tate
(over `Spa(ℤ_p, ℤ_p)` the torus chart contains non-analytic points); the embedding
`relativeTorus.polydiscEmbedding_affinoid` additionally fixes a pseudouniformiser of the base,
so it applies only to Tate bases.
`relativeTorus.mem_iff_isUnit_affinoid` characterizes which integral coordinate tuples
land in this rational open: each coordinate must have an integral inverse.
The field comparisons use a complete nontrivially normed ultrametric field with its Tate-ring
structure. The global constructions below use the same stable-sheafiness scope as the balls.

**The relative torus.** (*relative-torus*) Let `X` be as in *relative-closed-polydisc* and
`n ≥ 0`. In `AdicSpace`, define `relativeTorus` as the open subspace
`T^n_X := {|T₁ ⋯ Tₙ| ≥ 1} = {|T₁| = … = |Tₙ| = 1}` of `B^n_X`, with `relativeTorus.ι` the open
immersion `T^n_X → B^n_X`; over an affinoid `Spa(B, B⁺) ⊆ X` it is the rational subset
`R(1/(T₁ ⋯ Tₙ))` of `Spa(B⟨T⟩, B⁺⟨T⟩)` (Tau Ceti `ValuationSpectrum.rationalSubset`,
`ValuationSpectrum.spaLocalizationHomeomorph`; the numerator is `1` and the denominator
`T₁ ⋯ Tₙ`, so the condition is `|1| ≤ |T₁ ⋯ Tₙ| ≠ 0`, which with `|Tᵢ| ≤ 1` forces every
`|Tᵢ| = 1` — on the `(K, K°)`-point `T ↦ c` of `B¹` it reads `|c| ≥ 1`: `c = 1` lies on `T¹`,
`c = ϖ` does not), with coordinate ring `B⟨T₁^{±1}, …, Tₙ^{±1}⟩` and
plus ring `B⁺⟨T^{±1}⟩` (Mathlib `LaurentPolynomial`); equivalently
`T^n_X = X ×_{Spa ℤ} Spa(ℤ[T^{±1}], ℤ[T^{±1}])`. Prove `relativeTorus.affinoidChart` — over
`Spa(B, B⁺)` the torus is `Spa(B⟨T^{±1}⟩, B⁺⟨T^{±1}⟩)`, the rational subset `R(1/(T₁⋯Tₙ))` of the
polydisc chart — and then: (a) `relativeTorus.homEquiv` — `Hom_X(Z, T^n_X) ≃ (Fin n → (O⁺_Z(Z))ˣ)`,
natural in `Z`, the units of `O_Z(Z)` that lie in `O⁺_Z(Z)` with inverse in `O⁺_Z(Z)`, so `T^n_X`
represents `Z ↦ ((O⁺_Z(Z))^×)ⁿ`; (b) `relativeTorus.smooth` — for locally noetherian `X`, `T^n_X → X` is smooth in Huber’s sense (an open
subspace of `B^n_X`) with `Ω` free on the `dTᵢ`; in the full scope it has the ball charts
of A2.4; `relativeTorus.baseChangeIso` —
`T^n_X ×_X X' ≅ T^n_{X'}`; `relativeTorus.addIso` — `T^{m+n}_X ≅ T^m_X ×_X T^n_X`; and
`relativeTorus.mul`, `relativeTorus.one`, `relativeTorus.inv`, with associativity,
commutativity, unit and inverse laws — the
commutative group object structure over `X` (coordinatewise multiplication, unit `1`, inverse
`Tᵢ ↦ Tᵢ⁻¹`, which is defined on `T^n_X` because there each `Tᵢ` is a unit of `O` with
`|Tᵢ⁻¹| = 1`, so `Tᵢ⁻¹ ∈ O⁺`, and does not extend to `B^n_X`, where `|T| < 1` gives
`|T⁻¹| > 1`); (c)
`relativeTorus_spa_field` — over `Spa(K, K°)` it is Scholze's
`Tⁿ = Spa(K⟨T^{±1}⟩, K°⟨T^{±1}⟩)` ([PH] §4, Ex. 4.4, p. 23); (d) `relativeTorus.polydiscEmbedding`
— for a topologically nilpotent unit `ϖ` of `O(X)` (`X` analytic, locally), `Tᵢ ↦ 1 + ϖTᵢ` is an
isomorphism of `B^n_X` onto the rational subset `{|Tᵢ − 1| ≤ |ϖ|}` of `T^n_X` ([PH] §5, proof of
Lem. 5.2, p. 28, with `ϖ = p`); (e) `relativeTorus.iSup_translate_eq_polydisc` —
`B¹_X = T¹_X ∪ (T¹_X + 1)`: `B¹_X` is covered by `T¹_X` and its translate `{|T − 1| = 1}`, the
two annuli of [ECD] §24, proof of Prop. 24.4, p. 156. `T^n_X` is the unit polyannulus, not the
analytified torus `(G_m^n)^{ad}`, which is not quasi-compact over a field. Over `Spa(K, K°)`, `Tⁿ`
and the embedding `T ↦ 1 + ϖT` of (d) are the objects of AdicSpacesPartII layer R0's
*smooth-toric-chart* (the step of the proof of [PH] Lem. 5.2 that it follows), and Laurent
algebras over sousperfectoid rings are layer R5's *sousperfectoid-annulus*; the relative object,
the group structure (b) and the cover (e) are the content here. *Needs:*
*relative-closed-polydisc*; AdicSpacesPartII layer R0 (*smooth-toric-chart*; open subspaces and
rational subsets of
fibre products, smooth morphisms, group objects over a base); Tau Ceti
`ValuationSpectrum.rationalSubset`, `ValuationSpectrum.spaLocalizationHomeomorph`; Mathlib
`LaurentPolynomial`.

The proposed global signatures use `relativeTorus.openRegion`, whose defining stalk-valuation
inequality is identified with the affinoid torus locus `Huber.Pair.torusLocus` by
`relativeTorus.openRegion_chart`.
`relativeTorus` is literally the open restriction of the supplied `relativePolydisc`;
`relativeTorus.isOpenImmersion` applies to its inclusion, and `relativeTorus.proj` is the
inclusion followed by the ball projection. `relativeTorus.affinoidChart` supplies a rational
localisation of complete Huber pairs, including the plus ring, and both pullback squares.
`relativeTorus_spa_field` supplies an isomorphism to this Laurent affinoid over the field,
commuting with the inclusion and the projection and preserving the labelled coordinates.
The rational-localisation universal property specifies the completed Laurent algebra and its
integral subring; an algebraic Laurent polynomial ring alone is not the affinoid carrier.

`relativeTorus.homEquiv_apply` identifies each represented unit with pullback of the
corresponding ball coordinate. Its codomain uses units of `Oplus Z ⊤`, so both the element
and its inverse belong to the integral subring without an additional subtype condition.
`relativeTorus.homEquiv_natural` records pullback along arbitrary morphisms of test spaces.
`relativeTorus.zeroIso` identifies the zero-dimensional torus with the base by its projection.
`relativeTorus.baseChangeIso` and `relativeTorus.addIso` supply the fibre products as well as
the isomorphisms; their equations fix the base map and the order of coordinate blocks.

`relativeTorus.one_over`, `relativeTorus.inv_over`, and `relativeTorus.mul_over` make the
three group maps morphisms over the base. `relativeTorus.one_coord`,
`relativeTorus.inv_coord`, and `relativeTorus.mul_coord` specify their action on coordinates.
`relativeTorus.mul_assoc` is an equality on arbitrary generalized points over the base;
`relativeTorus.mul_comm`, `relativeTorus.one_mul`, `relativeTorus.mul_one`,
`relativeTorus.inv_mul`, and `relativeTorus.mul_inv` are equalities of morphisms from the
appropriate fibre product or torus. In particular the laws concern morphisms of adic spaces,
including their maps on sheaves. `relativeTorus.ballCharts` applies over analytic stably
sheafy bases. On locally noetherian analytic bases, `relativeTorus.isLocallyNoetherian`,
`relativeTorus.locallyFiniteType`, and `relativeTorus.smooth` supply the hypotheses for
`relativeTorus.differentials`, the free differential sheaf with the labelled basis `dTᵢ`.
The global `relativeTorus.polydiscEmbedding` fixes a unit whose image on every affinoid
chart is a pseudouniformiser and specifies both the coordinate formula and the rational image
by stalk valuations. `relativeTorus.iSup_translate_eq_polydisc` supplies translation by one
as an automorphism over the base with the two images covering the ball.

Lean: `Huber.Pair.torusLocus` (the rational subset `R(1/(T₁ ⋯ Tₙ))` of the polydisc chart over a
complete Huber pair) and `Huber.Pair.mem_torusLocus_iff` (the affinoid case of (a): a morphism out
of the polydisc lands in the torus iff every coordinate goes to a unit with inverse in the plus
ring); the global `relativeTorus` and the rest are README only.

**Checks for the global definitions.** Each identifier below labels a Check, to be formalised as
an `example`.

- *relativeTorus_openRegion_unit_section* — the all-one section lands in the open;
  *relativeTorus_openRegion_zero_dimension* — with no coordinates the open is the whole ball;
  *relativeTorus_openRegion_excludes_origin* — the zero section is disjoint from it.
- *relativeTorus_zero_dimension* — the zero-dimensional projection is an isomorphism;
  *relativeTorus_empty_base* — the two-dimensional torus over the empty base is empty;
  *relativeTorus_coordinate_is_unit* — the restricted coordinate is invertible.
- *relativeTorus_ι_unit_coordinate* — the included unit section evaluates to one;
  *relativeTorus_ι_zero_dimension* — the zero-dimensional inclusion is an isomorphism;
  *relativeTorus_ι_excludes_origin* — over a nonempty base the origin does not factor through it.
- *relativeTorus_proj_unit_section* — the represented unit section projects to the identity;
  *relativeTorus_proj_zero_dimension* — with no coordinates the point map is bijective;
  *relativeTorus_proj_not_injective* — the one-dimensional torus over the two-adic field has
  distinct points in a fibre.
- *relativeTorus_homEquiv_negative_unit* — the tuple of negative units evaluates to minus one;
  *relativeTorus_homEquiv_zero_dimension* — the empty tuple gives the unique section;
  *relativeTorus_homEquiv_distinguishes_coordinates* — swapping distinct units changes the map.
- *relativeTorus_one_coordinate_one* — the identity section evaluates to one;
  *relativeTorus_one_zero_dimension* — in dimension zero it inverts the projection;
  *relativeTorus_one_not_negative_unit* — over the two-adic field it differs from minus one.
- *relativeTorus_inv_evaluates_inverse* — inversion evaluates to the reciprocal unit;
  *relativeTorus_inv_involution* — applying inversion twice gives the identity morphism;
  *relativeTorus_inv_not_identity* — inversion itself is not the identity over the two-adic field.
- *relativeTorus_mul_two_units* — multiplication evaluates to the product of the two units;
  *relativeTorus_mul_negative_square* — minus one squared is the identity section;
  *relativeTorus_mul_not_first_projection* — multiplication on the two-adic torus is not its
  first projection.

**Checks.**

- *relativeTorus_test_field* (computation) — over `Spa(K, K°)`,
  `T¹ = Spa(K⟨T^{±1}⟩, K°⟨T^{±1}⟩)`, the unit circle `{|T| = 1}` of the closed disc, and
  a `(K, K°)`-point belongs to it exactly when its coordinate has norm `1`;
  extension-field points are the global `relativeTorus.homEquiv` target.
- *relativeTorus_test_zero* (degenerate) — `T⁰_X = X`.
- *relativeTorus_test_inverse* (convention, negative control) — the inverse of the group object
  is computed on `(K, K°)`-points by `c ↦ c⁻¹`: `c = 1 ↦ 1`, with `1⁻¹ ∈ K°`; the point `T ↦ ϖ`
  of `B¹` is not on `T¹`, and `ϖ⁻¹ ∉ K°`, so inversion has no extension to `B¹`.
- *relativeTorus_test_notGm* (non-example) — over `K`, `T¹ ≠ (G_m)^{ad} = A^{1,ad} ∖ {0}`: the
  latter is not quasi-compact and contains points with `|T| ≠ 1`; a definition as the analytified
  torus fails. When formalised, the check uses the invertible element `2 ∈ ℚ₂`, which gives no point of
  the unit circle, and asserts quasi-compactness of that circle.
- *relativeTorus_test_ballEmbedding* (characterisation) — over `ℚ_p`, `T ↦ 1 + pT` identifies
  `B¹` with the rational subset `{|T − 1| ≤ |p|}` of `T¹`, and the image of the zero section is
  the point `T = 1`. When formalised, the check identifies the composite ring map obtained by
  applying the zero section after the substitution with evaluation at `T = 1`.
- *relativeTorus_test_annulusCover* (computation) — `B¹_X = T¹_X ∪ {|T − 1| = 1}`, the second
  piece being the image of `T¹_X` under `T ↦ T + 1` (`relativeTorus.iSup_translate_eq_polydisc_affinoid`);
  computed instance: the `(ℚ_p, ℤ_p)`-point `T ↦ 0` of `B¹` lies on the translate and off the
  torus, so the torus alone does not cover `B¹`.
- *relativeTorus_test_translateTwoTerms* — Over Q₂ the point obtained from `homEquiv_affinoid` at T = 1 belongs to the torus and is excluded from its translate by 1.
- *relativeTorus_test_openImmersion* (compatibility) — the inclusion `T^n_X → B^n_X` is an open
  immersion whose chart over `Spa(B, B⁺)` is the rational localisation
  `B⟨T⟩ → B⟨T⟩⟨1/(T₁⋯Tₙ)⟩ = B⟨T^{±1}⟩`; when formalised, the check is the openness of the rational subset
  `R(1/(T₁⋯Tₙ))` in the chart (Tau Ceti `isOpen_val_preimage_rationalSubset`). In Tau Ceti's
  pre-adic spaces the same subset is an open affinoid subspace of the presentation-limit space
  of the chart, isomorphic to that of the rational localisation (`spaBasicOpen_mem_affinoidOpens`,
  `presentationLimitPreAdicSpaceLocIso`; the ideal spanned by `{1}` is open).
- *relativeTorus_test_nonTateBase* (computation, non-Tate base) — over `Spa(ℤ_p, ℤ_p)`, `T¹` is
  the rational subset `{|T| = 1}` of `Spa(ℤ_p⟨T⟩, ℤ_p⟨T⟩)`, with plus ring `ℤ_p⟨T^{±1}⟩` (the
  whole coordinate ring); it contains the non-analytic point given by the trivial valuation of
  `𝔽_p[T] = ℤ_p⟨T⟩/p`, so `T¹` over a non-Tate base is not the torus over `Spa(ℚ_p, ℤ_p)`
  (which is its analytic locus), and the embedding `T ↦ 1 + ϖT` has no analogue there (`ℤ_p`
  has no pseudouniformiser).
- *relativeTorus_perfectoidTower* (consumer instance) — for a perfectoid field `K` of
  characteristic zero and residue characteristic `p`, the tower of `Tⁿ_K` obtained by adjoining
  `pᵐ`-th roots of the coordinates has affinoid perfectoid limit `T̃ⁿ` ([PH] §4, Ex. 4.4).
  [ECD] §24, Prop. 24.4 uses the `ℤ_p`-torsor `T̃_{ℂ_p} → T_{ℂ_p}`. Over `ℚ_p` the completed
  coordinate-root algebra has discrete Gauss values `p^ℤ` and is not perfectoid: for any
  topologically nilpotent unit `ϖ`, `|ϖ| ≤ |p|`, so `p/ϖ^p` is not power-bounded.

**`Huber.Pair.torusLocus`.** The rational subset `R(1/(T₁ ⋯ Tₙ))` of `Spa(A⟨T⟩, A⁺⟨T⟩)`, the
affinoid relative torus. Each Check below is a Lean example.

**Checks.**

- *torusLocus_unit_coordinates* (computation) — a point of `Spa(A⟨T⟩, A⁺⟨T⟩)` lies in
  `torusLocus S n` iff `|Tᵢ| = 1` for every `i`, the bound `|Tᵢ| ≤ 1` holding on the whole
  polydisc; over `(ℚ_p, ℤ_p)` with `n = 1` the point `T ↦ 1` lies in it (Lean example).
- *torusLocus_zero* (degenerate) — for `n = 0` the empty product is `1` and the torus is the whole
  zero-variable polydisc, canonically the base spectrum (Lean example). For
  `(A, A⁺) = (ℚ₂ × ℚ₂, ℤ₂ × ℤ₂)` this spectrum has two points; for the zero pair it is empty.
- *torusLocus_vanishing_coordinate* (non-example) — a point with some `Tᵢ` in its support, such as
  the origin `T ↦ 0` of *relativeTorus_test_annulusCover*, is not in the torus, so for `n ≥ 1` the
  torus is not the whole polydisc (Lean example).

### A2.4 smooth morphisms by ball charts, and Huber's smooth morphisms

**Smooth morphisms by local étale charts over relative balls.** (*smooth-morphism-ball-charts*)
Let `f : Y' → Y` be a morphism of analytic adic spaces (*analytic-locus-restriction*) with `Y`
covered by open affinoids whose rings are complete and stably sheafy, so that the relative
polydiscs `B^n_Y` exist (*relative-closed-polydisc*). In `AdicSpace`, define the predicate
`IsLocallyEtaleOverPolydisc f hY`, where `hY : IsLocallyStablySheafy Y` —
`f` is locally étale over a relative ball — as: every `y' ∈ Y'`
has an open neighbourhood `U`, an integer `n ≥ 0` and a morphism `g : U → B^n_Y` that is étale in
the local-description sense of AdicEtaleGeometry layer A1 (locally an open immersion, a finite
étale morphism and an open immersion; *etale-morphisms-local-description-and-comparison*), with
`f|_U = π ∘ g`. This is the notion "smooth" of [ECD] §24, Prop. 24.4, p. 156, for analytic adic
spaces over `Spa ℤ_p`, including non-noetherian ones such as spaces étale over a perfectoid or
sousperfectoid base ([ECD] §24, Prop. 24.4, p. 156, whose statement makes no noetherian
hypothesis); the
charts are local on the source and `n` may vary with `y'`; étale is layer A1's local description,
which on locally noetherian spaces is Huber's étale (AdicSpacesPartII layer R0), and on general
bases Huber's infinitesimal definition is not used. The theorem
`relativePolydisc.isLocallyStablySheafy` follows from the defining stability of
sheafiness under maps topologically of finite type and transitivity of those maps
(AdicSpacesPartII R0, *finite-type-morphism-classes*; [Wedhorn] Def. 8.26). Prove the chart property
(for `y' ∈ Y'` and any prescribed neighbourhood `V`, an open `U ∋ y'` inside `V`, an `n` and an étale `g : U → B^n_Y` with `f|_U = π ∘ g`),
that A1-étale morphisms satisfy it with `n = 0`,
`IsLocallyEtaleOverPolydisc.relativePolydisc` (`π : B^n_Y → Y` and every open restriction, including `T^n_Y → Y`, satisfy it),
`IsLocallyEtaleOverPolydisc.comp` (stability under composition, using
`B^{m+n}_Y ≅ B^m_Y ×_Y B^n_Y` and *etale-composition*), `IsLocallyEtaleOverPolydisc.baseChange`
(stability under base change along morphisms `Y₁ → Y` of the same kind, using
*etale-base-change*; [KL I] §8.2, Def. 8.2.16, p. 162, base change of the étale charts for
Kedlaya–Liu's étale morphisms), locality on
the source (if `Y' = ⋃ U_i` and each `f|_{U_i}` satisfies it, so does `f`) and
`IsLocallyEtaleOverPolydisc.iff_smooth` (on locally noetherian analytic adic spaces,
`IsLocallyEtaleOverPolydisc f hY ↔ AdicSpace.Smooth f`: AdicSpacesPartII layer R0's
*smooth-local-structure* read in this predicate, *smooth-local-ball-charts*).
*Needs:* *relative-closed-polydisc*; *relative-torus*;
*etale-morphisms-local-description-and-comparison*; *etale-base-change*; *etale-composition*;
*analytic-locus-restriction*; AdicSpacesPartII layer R0 (fibre products, Huber's étale
morphisms); AdicEtaleGeometry layer A1 (étale morphisms by local description).

Lean: `AdicSpace.IsPolydiscOver` (an affinoid `D` over an affinoid `A` that is the relative closed
`n`-polydisc `(A⟨T⟩, A⁺⟨T⟩)` compatibly with the structure map), `AdicSpace.IsLocallyEtaleOverPolydisc`
(stated with étale maps into such `D` over affinoid charts of `Y`, so that it needs no
stable-sheafiness argument) and `AdicSpace.IsLocallyEtaleOverPolydisc.iff_smooth` (between locally
noetherian analytic spaces); the rest is README only.

**Checks.**

- *isLocallyEtaleOverPolydisc_test_polydisc* (computation) — `π : B^n_Y → Y` and `T^n_Y → Y`
  are locally étale over a relative ball, with `g` the identity, resp. the open immersion.
  When formalised, the instance uses the bidisc over ℚ₂ and every open restriction of it.
- *isLocallyEtaleOverPolydisc_test_etale* (degenerate) — an étale morphism (layer A1) satisfies
  the definition with `n = 0` (`B⁰_Y = Y`); when formalised, the instance is the two-sheeted
  projection over ℚ₂, with its global zero-coordinate chart.
- *isLocallyEtaleOverPolydisc_test_origin* (non-example) — the closed embedding of the origin
  `Spa(K, K°) → B¹_K` is not locally étale over a relative ball: its image is not open, whereas
  étale maps and projections from balls are open.
- *isLocallyEtaleOverPolydisc_test_huber* (compatibility) — for morphisms of locally noetherian
  analytic adic spaces the class coincides with the smooth morphisms of AdicSpacesPartII layer R0
  (*smooth-local-ball-charts*). The closed disc over ℚ₂ satisfies both predicates;
  its origin section fails smoothness.
- *isLocallyEtaleOverPolydisc_test_perfectoidBase* (characterisation) — for a nonempty affinoid
  perfectoid `Y = Spa(R, R⁺)`, `B^n_Y = Spa(R⟨T⟩, R⁺⟨T⟩) → Y` satisfies the definition although
  `B^n_Y` is not perfectoid for `n ≥ 1` (AdicSpacesPartIV layer R5, perfectoid times polydisc).
- *isLocallyEtaleOverPolydisc_ecd_consumer* (consumer instance) — [ECD] §24, Prop. 24.4: a
  separated morphism of analytic adic spaces over `Spa ℤ_p` that is locally étale over a relative
  ball has ℓ-cohomologically smooth diamond (the six-functor roadmap for diamonds), the case
  `n = 1` being reduced to the torus through the cover of `B¹` by two annuli. When formalised,
  the check computes this geometric input over ℚ₂: the ball-chart predicate and the union of
  the loci `|T| = 1` and `|T − 1| = 1`. The cohomological conclusion is supplied by
  the six-functor roadmap.

**`AdicSpace.IsPolydiscOver`.** The affinoid `D` is `(A⟨T₁, …, Tₙ⟩, A⁺⟨T⟩)` over the affinoid
`A`, compatibly with `q`. Each Check below is a Lean example.

**Checks.**

- *isPolydiscOver_surjective* (computation) — the closed unit disc
  `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩) → Spa(ℚ_p, ℤ_p)` satisfies it with `n = 1` and `e` the identity, and the
  origin `T ↦ 0` splits `q`; in general `q` is surjective on points (Lean example, the
  surjectivity).
- *isPolydiscOver_zero* (degenerate) — every affinoid is the `0`-dimensional polydisc over itself,
  with `q` the identity (Lean example).
- *isPolydiscOver_one_self* (non-example) — a nonzero affinoid is not the `1`-dimensional polydisc
  over itself through the identity: `e` would be the map `A → A⟨T⟩`, which misses `T` (Lean
  example).

**`AdicSpace.IsLocallyEtaleOverPolydisc`.** Smoothness by ball charts: both spaces analytic and,
locally on the source, an étale map to a relative closed polydisc over an affinoid chart of the
target followed by its projection. Each Check below is a Lean example.

**Checks.**

- *isLocallyEtaleOverPolydisc_proj* (computation) — over a Tate affinoid `A`, every `q` with
  `IsPolydiscOver A D n q` is smooth by ball charts, with the whole source as `U` and `g` the
  identity; the bidisc over `ℚ₂` of *isLocallyEtaleOverPolydisc_test_polydisc* is the case `n = 2`
  (Lean example).
- *isLocallyEtaleOverPolydisc_identity* (degenerate) — the identity of an analytic space is smooth
  by ball charts, with `0`-dimensional balls over its Tate charts (Lean example).
- *isLocallyEtaleOverPolydisc_nonAnalytic* (non-example) — the identity of `Spa(ℤ_p, ℤ_p)` is smooth
  in Huber's sense but not smooth by ball charts, which requires analytic spaces; this is why
  `IsLocallyEtaleOverPolydisc.iff_smooth` assumes both spaces locally noetherian analytic (Lean
  example, proved, for every non-analytic source).

**Huber's smooth morphisms are the morphisms locally étale over a relative ball.**
(*smooth-local-ball-charts*) For a morphism `f : X → S` of locally noetherian analytic adic
spaces, `f` is smooth in Huber's sense iff every `x ∈ X` has an open neighbourhood `U`, inside
any given neighbourhood of `x`, an `n ≥ 0` equal to the rank of `Ω_{X/S}` at `x`, and an étale
`g : U → B^n_S` (*relative-closed-polydisc*) with `f|_U = π ∘ g`: this is AdicSpacesPartII layer R0
(*smooth-local-structure*, Huber 1.6.10, with the rank from *smooth-differentials-locally-free*),
and over `S = Spa(K, K°)`, inside a chosen smooth affinoid source neighbourhood `W`,
`U` may be taken to contain the closure of `{x}` in `W`, with refinement inside
neighbourhoods of that closure. This is R0's *smooth-toric-chart* ([PH] §5, Lem. 5.2, p. 28; the
closure refinement is Scholze's, in its proof on p. 28, Huber's Cor. 1.6.10 giving only some
open neighbourhood of `x`); since on these carriers Huber's étale maps are
layer A1's (*etale-morphisms-local-description-and-comparison*),
`IsLocallyEtaleOverPolydisc.iff_smooth` of *smooth-morphism-ball-charts* is R0's statement read in
that predicate, with `n = 0` giving étaleness on both sides (relative pure dimension `0` alone
does not, *smooth-pure-relative-dimension*, *isPureRelDim_zero_not_etale*), and the composition
and base change of smooth morphisms correspond on the two sides. The closed embedding of an affinoid
étale object into a relative ball over a non-noetherian (affinoid perfectoid) base, used in [ECD]
§6, proof of Prop. 6.4(iv), p. 28, is AdicEtaleGeometry layer A3's. *Needs:* AdicSpacesPartII layer R0
(*smooth-local-structure*, *smooth-toric-chart*, *smooth-differentials-locally-free*);
*smooth-morphism-ball-charts*; *relative-closed-polydisc*;
*etale-morphisms-local-description-and-comparison*.

The global sheaf `relativeDifferentials f hX hY hf` is characterized by
`relativeDifferentials.finite_continuous` and `relativeDifferentials.universal`.
For `f : Y → X` locally of finite type between locally noetherian analytic adic spaces,
its sections on each affinoid open are finite over that open's structure ring, and its
derivation is continuous for the natural module topology. For every sheaf of structure
modules with these same local finiteness and continuity properties, a derivation killing
pullbacks of base sections factors through a unique morphism from `relativeDifferentials`.
That morphism commutes with restriction on all opens. Applying the property in both
directions determines the sheaf and its derivation on arbitrary sources, including
non-affinoid ones ([H96] §1.6, pp. 76–78). README only (no Lean declaration).


**Smoothness and differentials of relative balls.**
The target `relativePolydisc.smooth` is smoothness of the actual structural morphism
`(relativePolydisc X hX n).proj` for locally noetherian `X`, with Huber's infinitesimal smoothness
predicate. The differential target is an isomorphism of relative continuous differential
sheaves with the free structure module on `Fin n`, sending the basis vector indexed by `i`
to `dTᵢ`. For `n = 0` that module is zero; for `n = 1` it has basis `dT`; exchanging two basis
vectors is excluded by their coordinate labels. The sources are Huber 1996, 1.6.2(i), p. 76
(the Tate-algebra calculation), the definition of relative differential sheaves on p. 78,
Definition 1.6.5, p. 78, and Corollary 1.6.10, p. 80 (smooth ball charts).

**`AdicSpace.Smooth`.** The predicate is Part II's. With separate `IsLocallyNoetherianAnalytic` hypotheses on source and target, `Smooth.iff_tateCharts` expresses it as finite type on Tate charts together with the square-zero lifting condition. Finite type equals finite presentation here; Huber 1996, Definition 1.6.5, p. 78, and Corollary 1.6.10, p. 80. `relativePolydisc.smooth` applies it to the actual polydisc projection. The predicate is AdicSpacesPartII's; the comparison `Smooth.iff_tateCharts`, `relativePolydisc.smooth` and the Checks below are README only (no Lean declaration).

**Checks.**

- *AdicSpace_Smooth_closed_disc* (computation) — The closed one-disc over Q₂ is smooth over its base point.
- *AdicSpace_Smooth_identity_point* (degenerate) — The identity of Spa(Q₂,Z₂) is smooth.
- *AdicSpace_Smooth_origin_not_smooth* (non-example) — The zero section of the one-disc is not smooth; testing only that source and target are smooth spaces fails.

**`AdicSpace.relativeDifferentials`.** The module sheaf and derivation are identified with Part III's `AdicSpace.relativeDifferentials` and `.d` by `relativeDifferentials.continuousIso`, the unique sheaf isomorphism preserving every differential section. Part III's `.affinoidIso` supplies the continuous-differential module on Part II morphism charts. `relativeDifferentials.affinoidIso_D` identifies the affinoid derivation with the continuous universal derivation; `affinoidIso_smul` fixes its coefficient action. Huber 1996, §1.6, pp. 76–78. README only (no Lean declaration).

**Checks.**

- *AdicSpace_relativeDifferentials_disc_rank_one* (computation) — The differential module on the closed one-disc has rank one over its global section ring.
- *AdicSpace_relativeDifferentials_identity_zero* (degenerate) — The relative differential module of the identity Q₂ point is zero.
- *AdicSpace_relativeDifferentials_coordinate_nonzero* (non-example) — The differential of the disc coordinate is nonzero; assigning the zero module to every morphism fails.

**`AdicSpace.relativePolydisc.differentials`.** This is an isomorphism from the free structure sheaf on `Fin n` to the relative continuous differential sheaf. `differentials_basis` sends the i-th free section to dTᵢ, fixing the labels. Huber 1996, 1.6.2(i), p. 76, and the relative sheaf construction on p. 78. README only (no Lean declaration).

**Checks.**

- *AdicSpace_relativePolydisc_differentials_second_basis_vector* (computation) — On the two-disc, basis vector 1 maps to dT₁.
- *AdicSpace_relativePolydisc_differentials_zero_disc* (degenerate) — The zero-disc has zero relative differential module.
- *AdicSpace_relativePolydisc_differentials_not_first_coordinate* (non-example) — Basis vector 1 does not map to dT₀; permuting the coordinate labels fails.

### A2.5 compatible toric charts

**Compatible local toric charts for smooth morphisms of smooth rigid spaces.**
(*relative-toric-charts*) Let `K` be a complete nonarchimedean field (nontrivially valued, rank
one) with a pseudouniformiser `ϖ`, and `f : X → Y` a smooth morphism (AdicSpacesPartII layer R0)
between adic spaces smooth over `Spa(K, K°)`, with `X` affinoid. Let `x ∈ X`, `y = f(x)`, and
suppose an affinoid open `V ⊆ Y` containing `closure_Y {y}` is supplied together with an étale map `h : V → T^m_K`
(*relative-torus* over `Spa K`) that is a composite of rational embeddings and finite étale maps.
Let `d` be the rank of
`Ω_{X/Y}` at `x`. Prove `Smooth.exists_relativeToricChart`: there are an affinoid open
`U ⊆ f⁻¹(V)` containing `closure_X {x}` (which lies in `f⁻¹(V)`, since `f` is continuous
and `V` contains `closure_Y {y}`) and an étale map `k : U → T^d_V = T^d_K ×_{Spa K} V` over
`V` which is a composite of rational embeddings and finite étale maps
(*rational-pullback-comparison*, *finite-etale-pullback-comparison*); consequently
`(id × h) ∘ k : U → T^d_K ×_{Spa K} T^m_K = T^{d+m}_K` is étale, a composite of rational embeddings
and finite étale maps, and `pr ∘ (id × h) ∘ k = h ∘ f|_U` for the coordinate projection
`pr : T^{d+m}_K → T^m_K` ([PH] §5, Lem. 5.2, p. 28, the absolute chart `m = 0`; [PH] §5, proof of
Lem. 5.2, p. 28, the ball-into-torus step). With these supplied target data, `U` may be refined
inside any prescribed open neighbourhood `W` of `closure_X {x}` in `X`. For `Y = Spa K`
(`V = Y`, `m = 0`, `h = id`) this is the absolute chart theorem of AdicSpacesPartII layer R0.

For the local existence consequence, let `f : X → Y` be a smooth morphism between spaces
smooth over `Spa(K, K°)`, without affinoidness assumptions on `X` or `Y`. Given `x ∈ X` and
open neighbourhoods `N_X` of `x` and `N_Y` of `y = f(x)`, choose an affinoid neighbourhood
`V₀ ⊆ N_Y` of `y`. Apply R0's *smooth-toric-chart* to `V₀`: it supplies a toric affinoid
`V ⊆ V₀` containing `closure_{V₀} {y}`, with a map `h` as above. Choose an affinoid
neighbourhood `X₀ ⊆ N_X ∩ f⁻¹(V)` of `x` and apply `Smooth.exists_relativeToricChart` to
`f₀ : X₀ → V`, with target data `V` and `h`. This supplies `U ⊆ X₀` containing
`closure_{X₀} {x}` and the compatible maps `k` and `(id × h) ∘ k`. For fixed `X₀`, refinement
requires an open neighbourhood of `closure_{X₀} {x}` in `X₀`; ordinary refinement inside
`N_X` is obtained by choosing `X₀` there first. The resulting `U` form an open cover of `X`.
The closure conditions in this consequence are inside `V₀` and `X₀`; they impose no
containment of `closure_Y {y}` in `V` or of `closure_X {x}` in `U`.

This open-cover consequence gives the reduction to the
coordinate projection `Tⁿ → T^{n−d}` behind [PH] §8, Prop. 8.5, p. 49 (the relative Poincaré
lemma): the proof of [PH] §8, Lem. 8.6, p. 50, chooses an open cover of `X` by such charts fitting
into a commutative square over `Y → T^m` without proving that they exist; their existence is
proved here. Convention: [PH] projects onto the first coordinates, this roadmap writes
`T^{d+m} = T^d ×_{Spa K} T^m` and projects onto the last `m`; the two differ by a permutation of
the coordinates. *Needs:* AdicSpacesPartII layer R0 (smooth morphisms, the
rank of `Ω_{X/Y}`, smooth toric charts, étale maps as composites of rational embeddings and
finite étale maps); *smooth-local-ball-charts*; *relative-torus*; *relative-closed-polydisc*;
*rational-pullback-comparison*; *finite-etale-pullback-comparison*.

The interface of the conditional `Smooth.exists_relativeToricChart` uses the global `relativeTorus` over
`S = (CAff.of (Pair.powerBounded K)).adicSpa hK`. It supplies a basis of the stalk of
`relativeDifferentials f` indexed by `Fin d`, so the chart dimension is the rank at `x`.
The affinoid `U` is supplied with an `IsOpenImmersion` into `X`, whose image contains
`closure_X {x}` and lies in the prescribed open `W`, with `closure_X {x} ⊆ W` a hypothesis;
its map to the supplied `V` commutes with `f`. In the local consequence this interface is
applied to `X₀ → V`: the open immersion is first into `X₀`, its closure condition is
`closure_{X₀} {x}`, and its inclusion into `X` is the composite with `X₀ ↪ X`.
Finite composites are expressed by Mathlib's
[`MorphismProperty.multiplicativeClosure`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/CategoryTheory/MorphismProperty/Composition.lean#L273)
of A1's `IsRationalChartMap ∨ IsFiniteEtale`. This condition is imposed on `h`, `k`,
and the resulting absolute chart. The map `a = id × h` is specified by a pullback square
and its first `d` coordinates; `pr` preserves the structure map and pulls back coordinate
`j` to coordinate `d + j`. Thus `(k ≫ a) ≫ pr = u ≫ h` is an equality of adic morphisms.
The two computations below use the same carriers: the coordinate projection admits
an isomorphism `e : T^{d+m}_K ≅ T^d_{T^m_K}` with absolute chart `e ≫ e⁻¹ = id`,
and the polydisc map is rational with coordinate `T ↦ 1 + ϖT` and the stated image. README only (no Lean declaration).

**Checks.**

- *relativeToricChart_coordinateProjection* (computation) — for the coordinate projection
  `X = Tⁿ_K → Y = T^{n−d}_K` onto the last `n − d` coordinates (`0 ≤ d ≤ n`), `V = Y` and
  `h = id` (`m = n − d`), the chart `k` is the identity of `Tⁿ_K = T^d_K ×_{Spa K} T^{n−d}_K`:
  this is the reduction step of [PH] §8, Prop. 8.5; for `d = n` it is the absolute chart of
  `Tⁿ_K` (`Y = Spa K`), for `d = 0` the identity of `Y`.
- *relativeToricChart_polydisc* (computation) — for `f = π : B¹_V → V` the chart is
  `B¹_V ≅ {|T − 1| ≤ |ϖ|} ⊆ T¹_V`.
- *relativeToricChart_test_neighbourhood* (negative control) — in the two-point spectrum
  `Spa(K, K⁺)` for a rank-two valuation ring `K⁺`, the open generic point contains `x`
  but omits its specialization `y`. Thus no chart inside that open can contain
  the closure of `x`; the closure-containing refinement needs a neighbourhood of both points.
- *relativeToricChart_doubled_unit_annulus* (negative control) — glue two copies `D₁`, `D₂`
  of `D = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` along the rational open `E = {|T| = 1}` to form
  `Y = D₁ ∪_E D₂`, and take the smooth open immersion `f : X = D₁ ↪ Y`. This `Y` is smooth
  and qcqs, and `f` is separated. The common Gauss point `g ∈ E` has distinct specializations
  `v₁ ∈ D₁ ∖ E`, `v₂ ∈ D₂ ∖ E`. Explicitly, let `L` be the completion of `ℚ_p(T)` for the
  Gauss norm and set `L⁺ = red⁻¹(𝔽_p[t]_(t)) ⊆ L°`, using `L°/L°° = 𝔽_p(t)`.
  The two maps `Spa(L, L⁺) → Y` induced by the disc inclusions agree on the generic open
  `Spa(L, L°)` and send the rank-two closed point to `v₁` and `v₂`, where `|T| < 1`.
  No affinoid open of `Y` contains `closure_Y {g}`: both maps would factor through it,
  and their common restriction to `Spa(L, L°)` determines the same underlying ring map
  into `L`, hence the same morphism by *maps-into-affinoids*, contradicting `v₁ ≠ v₂`.
  The local consequence does apply with `V₀ = D₁`, `X₀ = D₁`, using the rational toric
  coordinate `S ↦ 1 + pT` on `V = D₁`.
- *relativeToricChart_poincare_consumer* (consumer instance) —
  the `p`-adic Hodge theory roadmaps (the
  relative Poincaré lemma in its local rational form) compute after restricting to each toric
  affinoid `V ⊆ V₀ ⊆ Y`, with base coordinates `X₁, …, X_m`, over the compatible toric
  open cover of `f⁻¹(V)` obtained from affinoid source neighbourhoods `X₀`. The closure
  conditions used to build this cover are `closure_{V₀} {y}` and `closure_{X₀} {x}`.

### A2.6 dimension and dimension estimates

**Dimension, pure dimension and relative dimension of adic spaces.** (*dimension-of-adic-spaces*)
Let `X` be an adic space (AdicSpaces, layer 5); its underlying space is locally spectral, hence
sober and T0 (Mathlib `QuasiSober`, `genericPoint`, `Specializes`). Write `dim X` for the existing
`topologicalKrullDim |X| ∈ ℕ∞ ∪ {⊥}` (Mathlib `topologicalKrullDim`, `Order.krullDim`:
the supremum of the lengths of chains of irreducible closed subsets), and use
`TauCeti.topologicalKrullDim_eq_iSup_coheight`: `dim X` is the supremum of the lengths `d` of chains of proper
specializations `x₀ ≻ x₁ ≻ ⋯ ≻ x_d` of pairwise distinct points of `X` ([H96] §1.8, Def. 1.8.1, as
stated in [Zav] §3, Def. 3.1, p. 4), which on the quasi-sober T0 space `|X|` is Tau Ceti's
`topologicalKrullDim_eq_iSup_coheight`; `dim ∅ = ⊥`. Define `IsPureDim`: `X` is of pure dimension
`d` if every nonempty open subset of `X` has dimension `d` ([Zav] §3, Def. 3.1, p. 4) — Huber's
open-subset form, which is vacuous for `X = ∅` (of pure dimension `d` for every `d`) and which
for nonempty `X` determines `d = dim X`. Tau Ceti's `IsPureDimensional d |X|` asks instead that
every irreducible component of `|X|` have dimension `d`. Its locality theorem, Tau Ceti
`isPureDimensional_iff_forall_of_isOpenEmbedding`, requires that every nonempty open part
of each irreducible component have the dimension of that component; this hypothesis fails
for a two-point valuation spectrum. On adic spaces the two notions differ in
both directions and this item does not identify them: `Spa(K, K⁺)` with `K⁺` a valuation ring of
rank two is one irreducible component of dimension `1`, so `IsPureDimensional 1` holds, while its
open point (the rank-one generization) has dimension `0`, so it is not of pure dimension `1`;
the closed unit disc `B¹_K` is of pure dimension `1`, while each classical point `T = c` is a
closed point that is a specialization of no other point (specializations in an analytic adic
space are vertical, with the same support), hence an irreducible component of dimension `0`, so
`IsPureDimensional 1 |B¹_K|` fails. For a morphism `f : X → Y` of analytic adic spaces define
`relDim`, the relative dimension `dim f := ⨆ y, topologicalKrullDim (f⁻¹(y))`, where
`f⁻¹(y) ⊆ X` carries the subspace topology (the fibre is T0, and `relDim` uses Mathlib's chains
of irreducible closed subsets of it; no chain-of-points form is asserted for fibres), and
`IsPureRelDim`: `f` is of relative pure dimension `d` if every nonempty fibre `f⁻¹(y)` is of
pure dimension `d` ([Zav] §3, after Def. 3.1, p. 5). Use the supplier results for dimension under open inclusions
(`dim U ≤ dim X` for an open subspace `U`; Mathlib `Topology.IsInducing.topologicalKrullDim_le`),
and open covers (`dim X = ⨆ᵢ dim Uᵢ` for an open cover; Tau Ceti
`topologicalKrullDim_eq_iSup_of_isOpenEmbedding` applied to `|X|`), and under
homeomorphisms (`IsHomeomorph.topologicalKrullDim_eq`). Prove `AdicSpace.topologicalKrullDim_spa_field`
(`dim Spa(K, K⁺) = rank(K⁺) − 1` for a complete rank-one field `K` and a valuation ring
`K⁺ ⊆ K°` of rank `r = ringKrullDim K⁺`, finite or not: the points correspond to the valuation overrings of `K⁺` contained in
`K°`. For finite rank these are `K⁺ = R_r ⊊ ⋯ ⊊ R₁ = K°`; in infinite rank their finite
chains have unbounded length. The trivial valuation is not continuous, and the chain
calculation gives `dim + 1 = r`, with `⊤ + 1 = ⊤`; the hypothesis that `K⁺`
is a valuation ring is needed, *dim_spa_field_test_notValuationRing*; [Hüb] §2, p. 5; Tau Ceti
`ValuationSpectrum.spa`). Prove the local-ring criterion (for `X` locally of
finite type over `Spa(K, K°)`, `X` is of pure dimension `d` iff `dim O_{X,x} = d` at every
classical point; [Zav] §3, Lem. 3.3, p. 5; it rests on AdicSpacesPartII layer R1's
*affinoid-domain-equidimensional*). The dimension is that of the topological space, not
the Krull dimension of a ring of functions (Mathlib `ringKrullDim`): `Spa(K, K⁺)` with `K⁺` of
rank `r` has dimension `r − 1` while `K` has Krull dimension 0; the fibre is the subspace
`f⁻¹(y)`, and its comparison with the adic fibre over rank-one points is
*relative-dimension-rank-one-fibres*. This topological relative dimension is distinct from R0's
rank of `Ω_{X/Y}` (`AdicSpace.Smooth.relativeDimension`); they agree for smooth morphisms by
*smooth-pure-relative-dimension*. A consumer, [ECD] §21, proof of Lem. 21.6, p. 123, compares
`dim f` with `dim.trg f`. *Needs:* AdicSpaces layer 5; Mathlib `topologicalKrullDim`,
`Order.krullDim`, `Specializes`, `QuasiSober`, `genericPoint`,
`Topology.IsInducing.topologicalKrullDim_le`, `IsHomeomorph.topologicalKrullDim_eq`,
`ringKrullDim`; Tau Ceti `ValuationSpectrum.spa`, `topologicalKrullDim_eq_iSup_coheight`,
`topologicalKrullDim_eq_iSup_of_isOpenEmbedding`, `IsPureDimensional`.

Lean: `AdicSpace.IsPureDim`, `AdicSpace.relDim` and `AdicSpace.IsPureRelDim` (on topological spaces
and maps, as described below), `AdicSpace.topologicalKrullDim_spa_field` and
`AdicSpace.isPureDim_spa_polydisc`; the rest is README only.

**Checks.**

- *dim_test_field* (computation) — `dim Spa(K, K°) = 0` and, for a valuation ring `K⁺ ⊊ K°` of
  rank two, `dim Spa(K, K⁺) = 1`.
- *dim_test_disc* (computation) — `dim Spa(K⟨T⟩, K°⟨T⟩) = 1` (the Gauss point specializes to
  rank-two points, and no chain is longer) and the closed unit disc is of pure dimension 1; the
  closed unit polydisc of dimension `n` has dimension `n`.
- *dim_test_empty* (degenerate, vacuous case) — `dim ∅ = ⊥`, and the empty space is of pure
  dimension `d` for every `d`, vacuously (it has no nonempty open subset); the definition is kept
  in this form, so "empty or of pure dimension `d`" in *relative-dimension-rank-one-fibres* is
  redundant but harmless, and for a nonempty `X`, `IsPureDim X d` and `IsPureDim X d'` force
  `d = d' = dim X`.
- *isPureDim_test_disjointUnion* (non-example) — `X = Spa(K, K°) ⊔ B¹_K = Spa(K × K⟨T⟩, K° × K°⟨T⟩)`
  has `dim X = max(0, 1) = 1` by Tau Ceti's `topologicalKrullDim_eq_iSup_of_isOpenEmbedding` and
  is of pure dimension `d` for no `d`:
  the open subset `Spa(K, K°)` has dimension `0`, the open subset `B¹_K` dimension `1`.
- *isPureDim_test_notIsPureDimensional* (non-example, both directions) — `Spa(K, K⁺)` with
  `K⁺` a valuation ring of rank two satisfies Tau Ceti's `IsPureDimensional 1` (one irreducible
  component, dimension `1`) and not `IsPureDim _ 1` (the open point has dimension `0`); the
  closed unit disc `B¹_K` satisfies `IsPureDim _ 1` and not `IsPureDimensional 1` (the closed
  classical point `T = 0` is an irreducible component of dimension `0`).
- *dim_spa_field_test_notValuationRing* (non-example) — `AdicSpace.topologicalKrullDim_spa_field` needs `K⁺` to be a
  valuation ring: for `K = k₀(u)((t))` (`t`-adic, complete, rank one) and
  `K⁺ = k₀ + t·k₀(u)⟦t⟧` — open, integrally closed in `K` (`k₀` is algebraically closed in
  `k₀(u)`), contained in `K°`, not a valuation ring (`u, u⁻¹ ∉ K⁺`) — `ringKrullDim K⁺ = 1` (its
  only nonzero prime is `t·k₀(u)⟦t⟧`), while `Spa(K, K⁺)` contains `K°` and the rank-two
  valuation ring `{x ∈ k₀(u)⟦t⟧ : x(0) ∈ k₀[u]_{(u)}}`, which specializes from it, so
  `dim Spa(K, K⁺) ≥ 1 ≠ 0 = ringKrullDim K⁺ − 1`. With `k₀(u, w)` in place of `k₀(u)` and
  `K⁺ = {x : x(0) ∈ k₀ + u·k₀(w)[u]_{(u)}}`, `ringKrullDim K⁺ = 2` and `dim Spa(K, K⁺) ≥ 2`, so
  the hypothesis `ringKrullDim K⁺ = 2` alone does not give `dim = 1` in *dim_test_field*.
- *dim_test_notRingDim* (non-example) — for `K⁺` a valuation ring of rank two,
  `dim Spa(K, K⁺) = 1 ≠ ringKrullDim K = 0`: a definition by the Krull dimension of the global
  sections fails.
- *dim_test_topologicalKrullDim* — The Q₂ bidisc projection has `AdicSpace.relDim = 2`, and its source satisfies `AdicSpace.IsPureDim 2`.
- *dim_test_Zp* (non-example, non-analytic) — `Spa(ℤ_p, ℤ_p)` has two points, the `p`-adic point
  and the closed non-analytic point (the trivial valuation of `𝔽_p`, support `(p)`), and the first
  specialises to the second (a specialisation that changes the support, which cannot happen in an
  analytic space); so `dim Spa(ℤ_p, ℤ_p) = 1`, the open analytic point has dimension `0`, and the
  space is not of pure dimension `1`. Here `dim + 1 = 2 ≠ 1 = ringKrullDim ℤ_p`: the rank formula
  of `AdicSpace.topologicalKrullDim_spa_field` is special to fields.
- *relDim_polydisc_test_nonAnalyticBase* (non-example) — over `Spa(ℤ_p, ℤ_p)` the fibre of
  `π : B¹ → Spa(ℤ_p, ℤ_p)` over the closed point contains the chain of valuations of
  `𝔽_p[T] = ℤ_p⟨T⟩/p` given by the trivial valuation of `𝔽_p(T)`, the `T`-adic valuation, and the
  trivial valuation of `𝔽_p[T]/(T)`, each a specialisation of the previous one; so the relative
  dimension of `π` is at least `2`, and the statement "`B^n_S → S` has relative pure dimension
  `n`" of *smooth-pure-relative-dimension* needs `S` analytic, as stated there.
- *relDim_le_dimTrg_consumer* (consumer instance) — [ECD] §21, Lem. 21.6: `dim f ≤ dim.trg f`
  for maps of analytic adic spaces.

The topological definitions in `Suggested.lean` are `AdicSpace.IsPureDim X d`, for an arbitrary
topological space, and `AdicSpace.relDim f`, `AdicSpace.IsPureRelDim f d`, for a map from a
topological space to a type. They use subspace fibres and require neither continuity nor a topology on
the target. Applying them to underlying maps gives the adic definitions above; the geometric
comparison theorems impose their additional hypotheses separately.
`AdicSpace.topologicalKrullDim_spa_field` applies `topologicalKrullDim` to `spa K⁺` for a valuation
ring `K⁺` of a complete nonarchimedean field `K`, and `AdicSpace.isPureDim_spa_polydisc` states
that the closed unit `n`-polydisc over `K` is pure of dimension `n`. The proposed local-ring
criterion uses `AdicSpace.IsPureDim X.obj d` and the actual
structure-sheaf stalk at each chart point whose valuation support is maximal; the
structure map to `Spa(K, K°)` is locally of finite type.

**Checks for the fibre definitions.**

- *relDim_test_empty* (degenerate) — the map `∅ → {⋆}` has relative dimension `⊥` and every pure
  relative dimension, since every fibre is empty.
- *relDim_test_point* (computation) — the identity of a point has relative dimension `0`, pure relative
  dimension `0`, and does not have pure relative dimension `1`.
- *relDim_test_missedPoint* (convention) — a point mapping to `false` in `{false, true}` has one point
  fibre and one empty fibre: `sup(0, ⊥) = 0`, pure relative dimension `0`, but not `1`.
- *dim_test_twoPointChain* — The structural map from Spa(ℤ₂,ℤ₂) to a point has `AdicSpace.relDim = 1` and fails `AdicSpace.IsPureRelDim 1`, since its analytic open has dimension zero.

**Relative pure dimension is detected on the fibres over rank-one points.**
(*relative-dimension-rank-one-fibres*) Let `S` be a locally noetherian analytic adic space and
`f : X → S` a morphism locally of finite type. Prove that `f` is of
relative pure dimension `d` (*dimension-of-adic-spaces*) iff for every rank-one point `s ∈ S` the
fibre `X_s := X ×_S Spa(K(s), K(s)°)` over the completed residue field — which exists by
AdicSpacesPartII layer R0 (fibre product along a map of finite type) — is empty or of pure
dimension `d` ([H96] §1.8, Cor. 1.8.7, p. 94; [Zav] §3, Lem. 3.2, p. 5). *Needs:* *dimension-of-adic-spaces*;
AdicSpacesPartII layer R0 (fibre products along morphisms of finite type, residue fields of
points, locally noetherian spaces); Tau Ceti
`ValuationSpectrum.IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic`.

The proposed global signature uses
`AdicSpace.IsPureRelDim (base f) d`. For every rank-one `s`, it asserts existence of a
`FibreProduct f (rankOneResidueMap S s hs)` whose underlying space satisfies
`AdicSpace.IsPureDim _ d`. Empty fibres already satisfy this predicate for every `d`.
The limiting-cone property makes the dimension condition independent of the chosen
fibre product. [Zavyalov §3, Lemma 3.2](https://arxiv.org/html/2409.15516v2)
gives the rank-one criterion. README only (no Lean declaration).

**`AdicSpace.rankOneResiduePair`.** Use `S.obj.valuation s` on the structure-stalk
residue field, topologize it with Mathlib's `WithVal`, and take
`UniformSpace.Completion`. The pair has the power-bounded plus ring. Rank one is
`Nonempty (S.obj.valuation s).valuation.RankOne`; this includes nontriviality.
`rankOneResiduePair.sheafy` supplies its adic spectrum. This realizes the residue-field
construction of AdicSpacesPartII R0 on the compiled `TauCeti.AdicSpace` carrier. README only (no Lean declaration).

**Checks.**

- *rankOneResiduePair_twoadic* (computation) — completion at the point of `Spa(ℚ₂, ℤ₂)`
  gives a topological ring isomorphism with `ℚ₂`.
- *rankOneResiduePair_integral_rank* (convention) — the integral subring has Krull
  dimension one, rather than the dimension zero of its fraction field.
- *rankOneResiduePair_plus_not_field* (non-example) — the plus ring is a proper
  subring of the completed field.

**`AdicSpace.rankOneResidueMap`.** The stalk residue map followed by completion
induces `Spa(K(s), K(s)°) → S`; `rankOneResidueMap_base` sends its point to `s`.
`rankOneResidueMap_sections` identifies the pullback of a section with its germ,
followed by the stalk residue map and the canonical embedding in the completion.
For an open containing `s`, the point equation identifies its inverse image with
the whole residue spectrum, so this equation applies to every such section. README only (no Lean declaration).

**Checks.**

- *rankOneResidueMap_twoadic* (computation) — the residue map of the complete
  two-adic point is an isomorphism.
- *rankOneResidueMap_second_sheet* (computation) — at sheet 1 of three disjoint
  two-adic points, the image is precisely sheet 1.
- *rankOneResidueMap_not_first_sheet* (non-example) — sheet 0 is outside that image.

**Checks for rank-one fibres.**

- *isPureRelDim_rankOneFibres_polydisc* (computation) — for `f = π : B^n_S → S` the fibre over a
  rank-one point `s` is the closed unit polydisc over `K(s)`, of pure dimension `n`
  (*smooth-pure-relative-dimension*).

**Smooth morphisms with differentials of rank `d` have relative pure dimension `d`.**
(*smooth-pure-relative-dimension*) Let `S` be a locally noetherian analytic adic space and
`f : X → S` a smooth morphism (AdicSpacesPartII layer R0) whose module of continuous
differentials `Ω_{X/S}` is locally free of constant rank `d`. Prove `Smooth.isPureRelDim`: `f`
is of relative pure dimension `d` (*dimension-of-adic-spaces*) ([Zav] §3, Cor. 3.4, p. 5, the
dimension statement for local charts, through the ball charts of *smooth-local-ball-charts*;
[Zav] §3, proof of Cor. 3.4, p. 5, gives two proofs). In particular étale morphisms are of
relative pure dimension 0, `B^n_S → S` and `T^n_S → S` are of relative pure dimension `n`
(*relative-closed-polydisc*, *relative-torus*), and an adic space `X` smooth over `Spa(K, K°)`
with `Ω_X` locally free of rank `d` is of pure dimension `d`, which for a rigid space means
`dim O_{X,x} = d` at every classical point — the classical dimension of smooth rigid spaces
([Zav] §3, Lem. 3.3, p. 5). *Needs:* *dimension-of-adic-spaces*;
*relative-dimension-rank-one-fibres*; *smooth-local-ball-charts*; *relative-closed-polydisc*;
*relative-torus*; AdicSpacesPartII layer R0 (smooth morphisms, the rank of `Ω_{X/S}`).
The proposed signature `AdicSpace.Smooth.isPureRelDim` takes the sheaf `relativeDifferentials`,
forms its stalks using Mathlib's `PresheafOfModules` stalk module instance, and requires
`Module.Finite` and `Module.finrank = d` at every point. Smoothness makes these
stalks free; constant stalk rank expresses the locally free constant-rank hypothesis.
Its conclusion is `AdicSpace.IsPureRelDim (base f) d`. README only (no Lean declaration).

**Checks.**

- *smooth_isPureRelDim_polydisc* (computation) — for `S = Spa(K, K°)` and `X = B^d_K` the
  conclusion is that `B^d_K` is of pure dimension `d`, in particular `dim B^d_K = d`; this is the
  affinoid theorem `relativePolydisc.isPureDim_affinoid` (over a field, in `Suggested.lean`,
  `AdicSpace.isPureDim_spa_polydisc`), with *relDim_polydisc_over_field* its relative form.
- *smooth_isPureRelDim_kummer* (computation) — the Kummer map `{|T| = 1} → {|T| = 1}`, `T ↦ Tⁿ`
  (`n` invertible in `K`), is finite étale, of relative pure dimension 0; this includes `n = p`
  in characteristic `0`, for instance `p = 2`, `K = ℚ_2`, `T ↦ T²`, where `2 ∈ ℚ_2^×` though
  `2 ∉ ℤ_2^×` (étale over `K`, Frobenius on the reduction mod `2`); the condition fails for
  `K = 𝔽_p((t))`, `n = p`: `T ↦ T^p` is then the Frobenius, not étale.
- *isPureRelDim_zero_not_etale* (non-example) — relative pure dimension `0` does not imply
  étale, nor smooth: the closed immersion of the origin `Spa(K, K°) → B¹_K` has one nonempty fibre, a
  point, of pure dimension `0`, and is not open; the Frobenius `T ↦ T^p` of `T¹_K` over
  `K = 𝔽_p((t))` is finite flat of relative pure dimension `0` with `Ω ≠ 0`, not étale. The
  converse holds among smooth morphisms (*smooth-local-ball-charts*, the charts with `n = 0`).

**Morphisms of weakly finite type to a quasi-compact base have finite dimension.**
(*weakly-finite-type-finite-dimension*) Let `f : X → Y` be a morphism of weakly finite type —
quasi-compact and locally of weakly finite type (AdicSpacesPartII layer R0) — between locally
noetherian analytic adic spaces, with `Y` quasi-compact. Prove
`AdicSpace.relDim_lt_top_of_locallyOfWeaklyFiniteType`: `dim f < ∞` (*dimension-of-adic-spaces*) ([Zav] §3, Lem.
3.7, p. 7; [Zav] §3, before Lem. 3.5, p. 5; the proof, [Zav] §3, proof of Lem. 3.7, p. 7, reduces
to the relative polydisc of *relative-closed-polydisc* and draws on [H96] §1.8). *Needs:*
*dimension-of-adic-spaces*; *relative-dimension-rank-one-fibres*; *relative-closed-polydisc*;
AdicSpacesPartII layer R0 (morphisms of weakly finite type, quasi-compact morphisms, locally
noetherian spaces).

Lean: `AdicSpace.relDim_lt_top_of_locallyOfWeaklyFiniteType`.

**Checks.**

- *relDim_lt_top_openDisc* (non-example of the hypothesis) — the open unit disc over `K` is not
  quasi-compact, so its structure map is not of weakly finite type although the base `Spa K` is
  quasi-compact. This finite-dimension theorem does not apply to that map; `dim f = 1`
  follows separately from Tau Ceti's `topologicalKrullDim_eq_iSup_of_isOpenEmbedding`. The next
  Check is the counterexample
  to dropping quasi-compactness from the theorem.
- *relDim_eq_top_iSup_polydiscs* (negative control) — `X = ⨆_{n ≥ 0} B^n_K → Spa K` is locally
  noetherian, analytic and locally of finite type, not quasi-compact, and `dim f = ⨆ n = ∞`
  (`topologicalKrullDim_eq_iSup_of_isOpenEmbedding` with `dim B^n_K = n`): the quasi-compactness
  of `f` cannot be
  dropped.
- *relDim_polydisc_over_field* (computation) — for `Y = Spa(K, K°)` and `X` the closed unit
  polydisc of dimension `n`, `dim f = n`.

The proposed affinoid finite-dimension signature (README only)
uses complete Hausdorff Huber pairs, a strongly noetherian Tate source ring and a
pair morphism whose ring map is `IsTopologicallyFiniteType`. The proposed field signatures
(the dimension of a field spectrum, the local-ring criterion and the dimension of the polydisc)
use complete nontrivially normed ultrametric Tate fields;
the first additionally assumes that the plus ring is a valuation ring, the second a
complete Hausdorff Huber algebra topologically of finite type, and the third is the
polydisc case; the first and third are `AdicSpace.topologicalKrullDim_spa_field` and
`AdicSpace.isPureDim_spa_polydisc` in `Suggested.lean`. The global
`AdicSpace.relDim_lt_top_of_locallyOfWeaklyFiniteType` takes weak finite type as AdicSpacesPartII's
`LocallyOfWeaklyFiniteType` together with `QuasiCompact` (compact inverse images of compact
opens). It assumes `CompactSpace Y.obj` and
local noetherian analyticity on both spaces, and concludes `AdicSpace.relDim (base f) < ⊤`.
The ring condition places no finite-type requirement on the plus rings, as specified
by AdicSpacesPartII R0, *finite-type-morphism-classes*. When formalised, the check
*relDim_lt_top_openDisc* uses `DiscChecks.openDisc` over `ℚ₂`, its inclusion in the
closed disc, and the scalar structure map: inverse images of compact opens need not
be compact, although the relative dimension is one.

The dimension theory follows [H96] §1.8, pp. 90–95, especially 1.8.4–1.8.9; [Zav] §3, pp. 4–7,
states the results used here for locally noetherian analytic adic spaces.

### A2.7 analytification

**The relative affine space is the union of relative polydiscs.**
(*analytification-relative-polydisc-comparison*) This is a supplier citation to
AdicSpacesPartII R1 (*affine-chart-analytification*, *analytic-affine-space*). For a complete Huber pair `(A, A⁺)` with `A` a
strongly noetherian Tate ring, `ϖ ∈ A` a pseudouniformiser and `S = Spa(A, A⁺)`, the relative
analytification `(A^n_A)^{ad/S} = A^n_A ×_{Spec A} S` is the increasing union of the rational open
subspaces `{|ϖᵏT₁|, …, |ϖᵏTₙ| ≤ 1}` with charts `Spa(A⟨ϖᵏT⟩, A⁺⟨ϖᵏT⟩)`, of which
`B^n_S` (*relative-closed-polydisc*) is the piece `k = 0`, and `T^n_S` (*relative-torus*) is the
open subspace `{|Tᵢ| = 1}` of `(G^n_{m,A})^{ad/S}`: this is AdicSpacesPartII layer R1
(*affine-chart-analytification*, *analytic-affine-space*), so that R1's comparisons for analytified
morphisms (separatedness and properness, étaleness and smoothness, continuous differentials) apply
to the balls and tori of this layer on the same carriers, étale charts `U → A^n_A` of a smooth
finite-type `A`-scheme analytify to ball charts over `B^n_S` in the sense of
*smooth-local-ball-charts*, and the étale sites compare through AdicSpacesPartIV layer R4
(*analytification-etale-site*). *Needs:* AdicSpacesPartII layer R1
(*affine-chart-analytification*, *analytic-affine-space*); AdicSpacesPartIV layer R4
(*analytification-etale-site*); *relative-closed-polydisc*; *relative-torus*;
*smooth-local-ball-charts*. README only (no Lean declaration).

### A2.8 compatibility with A1's étale site

**Smooth charts form a covering of the étale site.** (*smooth-etale-site-compatibility*) Let
`f : X → S` be a smooth morphism of locally noetherian analytic adic spaces, and `X_ét` the small
étale site of AdicEtaleGeometry layer A1 (*etale-site*, with its geometric points and fibre
functors *etale-site-and-geometric-points*), which on these carriers is the site of
AdicSpacesPartIV layer R4 (the étale site on analytic carriers) ([H96] §2.1, p. 109, Huber's
étale site, whose coverings are the jointly surjective families; Mathlib
`CategoryTheory.GrothendieckTopology`). Prove `Smooth.ballCharts_mem_etaleTopology`: the sieve
on `X` generated by the objects `U → X` of `X_ét` that admit an étale `S`-morphism `U → B^n_S`
for some `n` (ball charts, *smooth-local-ball-charts*, *relative-closed-polydisc*) is a covering
sieve of `X_ét`, and such charts can be chosen with `U → X` open immersions. Moreover: (i) `Smooth.etalePullback_differentials` — for
every object `u : U → X` of `X_ét`, `f ∘ u : U → S` is smooth and `u^*Ω_{X/S} ≅ Ω_{U/S}`
(AdicSpacesPartII layer R0, composition of smooth morphisms and the differentials of a composite,
with `Ω_{U/X} = 0` for étale `u`; *etale-morphisms-local-description-and-comparison*).
The isomorphism is uniquely characterised by its adjoint sending `da` to `d(u*a)` on every
open of `X`; use Mathlib `SheafOfModules.pullback` along the actual structure-sheaf map. (ii) `Smooth.ballCharts_baseChange` — for a
morphism `S' → S` of such spaces, the base-change functor `X_ét → (X ×_S S')_ét` of
AdicSpacesPartIV layer R4 carries ball charts of `f` to ball charts of its base change.
Use A1 `smallEtale.map` and `smallEtale.mapProjection`; the comparison
`Bⁿ_{S′} → Bⁿ_S` preserves the ordered coordinates, forms a pullback square over `S′ → S`,
and commutes with the original and pulled-back chart maps. (iii) `Smooth.toricCharts_mem_etaleTopology` — for
`S = Spa(K, K°)`, the objects with a toric chart `U → Tⁿ_K` that is a composite of rational
embeddings and finite étale maps (AdicSpacesPartII layer R0, smooth toric charts;
*relative-toric-charts*; *relative-torus*) also generate a covering sieve ([PH] §4, proof of
Cor. 4.7, p. 25, toric charts cover a smooth space). These are the compatibilities of this
layer's smooth charts with layer A1's site. The proposed Lean covering statements use
`Sieve.generate` on the terminal object `id_X` of `smallEtale X`, with generators required
to be open immersions and to carry the stated ball or toric chart. *Needs:* *etale-site-and-geometric-points*;
*etale-site*; *etale-morphisms-local-description-and-comparison*; AdicSpacesPartIV layer R4 (the
étale site on analytic carriers, its base-change functor); AdicSpacesPartII layer R0 (smooth
morphisms, their differentials, smooth toric charts); *smooth-local-ball-charts*;
*relative-closed-polydisc*; *relative-toric-charts*; *relative-torus*; Mathlib
`CategoryTheory.GrothendieckTopology`. README only (no Lean declaration).

**Checks.**

- *ballCharts_polydisc_identity* (computation) — for `X = B¹_K` the identity is a ball chart,
  and the cover `{|T| = 1} ∪ {|T − 1| = 1}` gives toric charts (the annulus cover of
  *relative-torus*).
- *ballCharts_omega_consumer* (consumer instance) — the
  `p`-adic Hodge theory roadmaps (vector bundles
  on the analytic étale and pro-étale sites) and the sheaf `Ω¹` on `X_ét` are computed on such
  covers. On the unit annulus in the two-adic disc, the pulled-back free generator is
  `dT`; when formalised, the check tests the image of the basis section in the actual differential sheaf.

### A2.9 formal schemes and generic fibres in the scope of the étale-cohomology roadmaps

**Huber's generic fibre of a noetherian formal scheme is the analytic locus of its adic space.**
(*formal-generic-fibre-analytic-locus*) **Supplier citation to AdicSpacesPartIII R2.**
The name `FormalScheme.genericFibreIsoAnalyticLocus` is this README's name for the comparison
`d(𝔛) ≅ t(𝔛)_a` of [Part III R2.3](../AdicSpacesPartIII/README.md#r23-generic-fibres), including
its globalisation, built from Part III's `FormalScheme.genericFibre`, `genericFibre.lift`,
`genericFibre.lift_unique` and `genericFibre_isAnalytic` (named in that roadmap's README,
*generic-fibre-functor-d*); Part III names no declaration for it. Use AdicSpacesPartIII's formal
schemes, with
their local noetherianity (`FormalScheme.IsLocallyNoetherian`), for the comparison with `t`. Formal schemes (AdicSpacesPartIII layer F0), type-(S) and
admissible formal schemes, Huber's functors `t` and `d`, the specialisation map, tubes,
admissible blow-ups, Raynaud's theorem, completions of schemes and the comparison maps `σ`, `φ`
are the constructions of AdicSpacesPartIII layer R2. Let `𝔛` be a locally noetherian formal
scheme (AdicSpacesPartIII layer F0); it is of type (S) through condition (a) ([H96] §1.9,
condition (S), p. 96; AdicSpacesPartIII layer R2). Let `t(𝔛)` be Huber's adic space of `𝔛` with
`π_𝔛 : t(𝔛) → 𝔛` ([Hüb] §8, Thm. 8.1, p. 37, the functor `t`; AdicSpacesPartIII layer R2) and
`d(𝔛)` with `λ_𝔛 : d(𝔛) → 𝔛` Huber's generic fibre ([H96] §1.9, Prop. 1.9.1, pp. 96–97;
AdicSpacesPartIII layer R2). The target `FormalScheme.genericFibreIsoAnalyticLocus` says: there is a
canonical isomorphism `d(𝔛) ≅ t(𝔛)_a` onto the analytic locus of `t(𝔛)`
(*analytic-locus-restriction*), under which `λ_𝔛 = π_𝔛 ∘ ι`; it is compatible with open formal
subschemes, and for an adic morphism `g : 𝔛' → 𝔛` of locally noetherian formal schemes,
`d(g) = t(g)_a` — `t(g)` is adic iff `g` is ([H94] §4, Prop. 4.2(i), p. 540). On `𝔛 = Spf A`:
`d(Spf A) = Spa(A, A)_a`, covered by the Tate charts `R(G/g)` for generators `G` of an ideal of
definition. This is the layer's supply of formal schemes and their generic fibres in the scope
that the étale-cohomology roadmaps use, none of it a derived comparison: `d(𝔛)` and
`λ_𝔛` for type-(S) formal schemes; noetherian formal models, `Spa(A, A)_a` for noetherian `A`
henselian along `I` ([H96] §3.2, Ex. 3.2.11, p. 181); `d(X̂)` for completions of schemes along closed
subschemes ([H96] §1.9, 1.9.4–1.9.6; AdicSpacesPartIII layer R2, case (α)); through the same R2
constructions, the type (S)(b) models (admissible formal schemes over `O_K`, with
`d(Spf A) = Spa(A[1/ϖ], A⁺)` on affines, `A⁺` the integral closure of the image of `A` in
`A[1/ϖ]`) and the microbial valuation-ring case `d(Spf A) = Spa(K, A)`, `K = A[1/ϖ]` its
fraction field; the preimages `λ⁻¹(L)` defining pseudo-adic supports; and base change of
generic fibres to `k̄^` (AdicSpacesPartIII layer R2, generic fibre fibre products). The theorem
`FormalScheme.genericFibreIsoAnalyticLocus` itself is stated for locally noetherian `𝔛`: over a
non-discretely valued `O_K` (`O_{ℂ_p}` is not noetherian) an admissible `Spf A` is not locally
noetherian and is covered only by R2's type (S)(b) statements, which are supplied, not proved,
here. On `𝔛 = Spf A` with `A` noetherian the identification `d(Spf A) = t(Spf A)_a` with the
restriction of `π`, its compatibility with open formal subschemes and its naturality in `g` are
AdicSpacesPartIII layer R2's *generic-fibre-functor-d* (`genericFibre_spf_of_isNoetherian`,
`genericFibre_ofIsOpenImmersion`, `map`), with `λ_𝔛` its *specialisation-map*; the content here
is their use on a locally noetherian `𝔛`. R2 owns the globalisation: its universal properties
and open-restriction compatibility glue the affine isomorphisms uniquely, and identify
specialisation and adic functoriality on overlaps. See the exact supplier table above. *Needs:*
AdicSpacesPartIII layer F0 (locally noetherian formal schemes); AdicSpacesPartIII layer R2 (type
(S), the functors `t` and `d`, completions of schemes, generic fibre fibre products);
*analytic-locus-restriction*. README only (no Lean declaration).

**Checks.**

- *genericFibre_powerSeries* (supplied computation; R2's *toAdicSpace_test_ZpT* and
  *genericFibre_test_powerSeries_dvr* read through this identification) — `𝔛 = Spf ℤ_p⟦T⟧`:
  `d(𝔛) = Spa(ℤ_p⟦T⟧)_a = R((p, T)/p) ∪ R((p, T)/T)` is quasi-compact and contains
  characteristic-`p` points; the Berthelot generic fibre `d(𝔛) ×_{Spa ℤ_p} Spa(ℚ_p, ℤ_p)`, the
  open unit disc over `ℚ_p`, is the part where `|p| ≠ 0` and is not quasi-compact ([Hüb] §8,
  Ex. 8.7, p. 39).
- *genericFibre_restrictedPowerSeries* (supplied computation; R2's
  *genericFibre_test_formalAffineLine* and *genericFibre_test_noetherian*) — `𝔛 = Spf ℤ_p⟨T⟩`:
  `d(𝔛) = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, the closed unit disc ([Hüb] §9, Ex. 9.4, p. 43).

### Examples

The worked examples of this layer are the checks above: the proper projective line
`P^{1,ad}_K`, the closed unit disc (separated and quasi-compact, not proper), the open unit disc
(partially proper), the disc with doubled origin (not separated, not quasi-separated) and the disc
doubled along `{|ϖ| ≤ |T|}` (quasi-separated, two centres); the disc
`B¹ = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` with `Hom(Spa(L, O_L), B¹) = O_L`, the non-Tate case
`B¹ = Spa(ℤ_p⟨T⟩, ℤ_p⟨T⟩)` over `Spa(ℤ_p, ℤ_p)`, and the adic affine line as the non-example
that fixes the plus ring; the unit circle `T¹ = Spa(K⟨T^{±1}⟩, K°⟨T^{±1}⟩)` with `c = 1` on it and
`c = ϖ` off it, the embedding `T ↦ 1 + pT` of `B¹` into `T¹`, the annulus cover
`B¹ = T¹ ∪ {|T − 1| = 1}` with `T ↦ 0` on the second piece only, and the torus over `Spa(ℤ_p, ℤ_p)`
with its non-analytic points; `B^n_Y → Y`, `T^n_Y → Y` and étale maps as ball-chart smooth
morphisms against the origin `Spa(K, K°) → B¹_K`, the chart `{|T| = 1} ⊆ B¹_K` for `T¹_K`, and
the toric charts of `Tⁿ_K → T^{n−d}_K` and of `B¹_V → V`; `dim Spa(K, K⁺) = 1` for `K⁺` a
valuation ring of rank two against `ringKrullDim K = 0` and against the non-valuation
`K⁺ = k₀ + t·k₀(u)⟦t⟧`, the disjoint union of a point and a disc as a space of no pure
dimension, `dim B^n_K = n`, `dim Spa(ℤ_p, ℤ_p) = 1` through a specialisation that changes the
support, the fibre of dimension at least `2` of `B¹ → Spa(ℤ_p, ℤ_p)` over the closed point, the
Kummer map of relative dimension 0 against the closed immersion
of the origin, and `⨆_n B^n_K` of infinite relative dimension;
`A^{1,ad}_K = ⋃_{k ≥ 0} {|ϖᵏT| ≤ 1}` with `B¹_K` as its piece `k = 0` and the closed bidisc over
`Spa(ℚ_p⟨U⟩, ℤ_p⟨U⟩)`; and `d(Spf ℤ_p⟦T⟧) = R((p, T)/p) ∪ R((p, T)/T)` against the Berthelot
generic fibre, with `d(Spf ℤ_p⟨T⟩)` the closed unit disc.

### Dependencies

AdicSpacesPartII layer R0 (locally noetherian adic spaces; morphisms locally of (+)weakly finite
type; fibre products, diagonals, closed embeddings and finite morphisms; separated, partially
proper and proper morphisms with their valuative criteria; Huber's smooth, étale and unramified
morphisms with their composition and base change — Huber's 1.6.7 is R0's base change of smooth
and étale morphisms — and the rank of `Ω`; Huber's Lemma 2.2.8; smooth toric charts);
AdicSpacesPartII layer R1 (analytification over a field and over a strongly noetherian Tate
affinoid, with its comparisons of separatedness, properness, étaleness, smoothness and
differentials); AdicSpacesPartIII layer R2 (formal schemes of type (S), the functors `t` and `d`,
completions of schemes, generic fibre fibre products); AdicSpacesPartIV layer R4 (the étale site
on analytic carriers, its base-change functor and the morphism of sites of analytification);
AdicSpacesPartIII layer F0 (locally noetherian formal schemes); AdicSpacesPartIII layer R3 for the
coherent sheaf `Ω¹_{X/Y}` of continuous differentials with its exterior powers, of which the
dimension subsection uses the étale-site version; AdicSpacesPartIV layer R5 for the
sousperfectoid and perfectoid-times-polydisc facts named in the checks. AdicEtaleGeometry layer
A0 (the analytic locus, rational and finite étale pullbacks) and layer A1 (étale morphisms by
local description and their comparison with Huber's, base change and composition of étale maps,
the étale site and its geometric points). The Foundations of adic spaces roadmap (AdicSpaces),
layers 1, 2, 3 and 5: the analytic adic spaces over `ℤ_p` with their diagonals, separated
morphisms, classical valuative criteria and Huber's étale and finite étale sites that
DiamondsAndVStacks layers D3 and D6 ask for are AdicSpaces layer 5 (the spaces), AdicSpacesPartII
layer R0 (the diagonals, separated morphisms and valuative criteria cited in the first subsection),
layer A0's analytic-locus interface and the sites of layer A1.
The `p`-adic Hodge theory roadmaps ask for Huber's 1.6.10 charts with Scholze's refinement
containing the closure of a point ([PH] §5, proof of Lem. 5.2, p. 28), Huber's
2.2.8 (AdicSpacesPartII layer R0), compatible toric charts and the sheaf `Ω¹` on `X_ét`, locally
free of rank `dim X`: the rank statement is the dimension subsection's and the sheaf itself is
AdicSpacesPartIII layer R3's. Mathlib and Tau Ceti as listed in the `*Needs:*` clauses above. The
closed embedding into a relative ball over an affinoid perfectoid base used in [ECD] §6, proof of
Prop. 6.4(iv), p. 28, and that proposition itself are AdicEtaleGeometry layer A3's; this layer's
non-noetherian content is the definitions of balls, tori and ball-chart smooth
morphisms.

## Layer A3: the nonnoetherian affinoid étale approximation input

This layer proves [ECD] §6, Prop. 6.4(iv), p. 27: for a cofiltered system `X_i = Spa(R_i, R_i⁺)` of
affinoid perfectoid spaces with limit `X`, the base change functors induce an equivalence

```text
2-colim_i (X_i)_{ét,aff}  ─────→  X_{ét,aff}
```

between affinoid perfectoid spaces étale over the `X_i` and over `X`. Full faithfulness is
PerfectoidSpaces layer P5's [ECD] 6.4(ii); essential surjectivity is the content of this layer: an
affinoid étale `Y → X` is written by finitely many equations with invertible Jacobian, and those
equations are approximated at a finite stage of the system. Scholze's sketch cites Huber's
Proposition 1.7.1, the pseudocoherent sheaves of Kedlaya–Liu and Fargues–Scholze IV.4.19, whose
printed proof uses diamond-level results; the layer replaces every diamond-level step by analytic
algebra in five pieces: pseudocoherent modules and sheaves (A3.1), standard étale presentations with
a quantitative implicit function theorem (A3.2), the Fargues–Scholze specialisations (A3.3), the
closed embedding of an affinoid étale object into a relative ball (A3.4) and finite-stage
approximation (A3.5). No diamond, no [ECD] Prop. 11.30, no [ECD] Lem. 15.6 and no six-functor
formalism is used anywhere. The layer builds on PerfectoidSpaces layers P1–P3 (perfectoid Tate rings
and tilts, rational localisations, the sheaf theorem, fibre products, almost purity, the étale site
and its tilting) and P5 (cofiltered limits of affinoid perfectoid spaces and [ECD] 6.4(o)–(iii)), on
AdicSpacesPartII layer R0 (completed tensor products and their base-change formulas, continuous
differentials and the conormal sequence over noetherian-type bases, Huber's noetherian étale
theory), AdicSpacesPartIII layer R3 (Tate's reduction and Čech acyclicity on sheafy Tate affinoids,
glueing squares, Kiehl gluing of finite projective modules) and AdicSpacesPartIV layer R5
(sousperfectoid rings and spaces), on AdicEtaleGeometry layer A1 (étale
morphisms by local description, finite étale affinoid algebras), and on the Foundations of adic
spaces roadmap (AdicSpaces), layers 0–5 (Huber pairs, Tate rings and the open mapping theorem,
restricted power series, rational subsets with their universal property and perturbation invariance,
sheafy pairs, adic spaces). [ECD] Thm. 5.8 (Zariski closed implies strongly Zariski closed) is not
an input: the closed immersions used here are built directly into the sousperfectoid ball, and the
transfer between characteristics is made on étale categories (PerfectoidSpaces layers P3 and P5).
The consumers are PerfectoidSpaces layer P6 (affinoid pro-étale maps, [ECD] 7.10–7.11, and through
it the strictly totally disconnected covers of [ECD] 7.18 used by DiamondsAndVStacks layer D1) and
the relative Fargues–Fontaine roadmap (the chart-cover argument for the integral curve).

The standing conventions are these. A prime `p` is fixed. Tate rings are complete and Hausdorff
(AdicSpaces convention 3) with a pseudouniformiser `ϖ`, a topologically nilpotent unit (Tau Ceti
`Huber.IsPseudoUniformizer`). Kedlaya–Liu's *Banach rings* are these Tate rings with a norm of the
form attached to a ring of definition (AdicSpacesPartII layer R0, the Tate ring norm); their *adic
Banach rings* are complete Tate Huber pairs ([KL II] §2, Convention 2.0.1, p. 29). *Sheafy* means
that the structure presheaf is a sheaf for finite rational coverings of rational subsets. A
*rational localisation* of `(A, A⁺)` is the completed localisation `(A⟨T/s⟩, A⟨T/s⟩⁺)` at a rational
subset `R(T/s)` (Tau Ceti `Huber.PairOfDefinition.completionLocalization`); its plus ring is the
completion of the integral closure of the image of `A⁺[T₁, …, Tₙ]` ([KL I] §2.4, Lem. 2.4.13(a), p.
42). `B^N_X := Spa(A⟨T₁, …, T_N⟩, A⁺⟨T₁, …, T_N⟩)` is the relative closed unit polydisc over
`X = Spa(A, A⁺)` (Tau Ceti `Huber.restrictedMvPowerSeriesCompletion`); over a perfectoid, hence
sousperfectoid, `A` it and all its rational subsets are sousperfectoid and sheafy (AdicSpacesPartIV
layer R5, sousperfectoid rings and their sheafiness). Partial derivatives `∂/∂T_j` are termwise on
`A⟨T⟩` (Mathlib `MvPowerSeries.pderiv`) and extend uniquely to rational localisations; the Jacobian
of `F = (F₁, …, F_N)` is `J_F := det(∂Fᵢ/∂T_j)`. A *quotient mapping* of complete Huber pairs
`π : (P, P⁺) → (C, C⁺)` is a surjective ring map with `C⁺` the integral closure of `π(P⁺)` (Tau Ceti
`Huber.Pair.quotient`); by the open mapping theorem it is open. An ideal generated by finitely many
elements need not be closed, so presentations always use the closure of the ideal of equations.
Étale morphisms of perfectoid spaces are those of [ECD] §6, Def. 6.2, p. 26 (locally an open
immersion into a space finite étale over an open of the base; PerfectoidSpaces layer P3); étale
morphisms of sousperfectoid or general analytic adic spaces are taken by local description
(*etale-morphisms-local-description-and-comparison* of layer A1; [FS] §IV.4.1, p. 135). `X_{ét,aff}`
is the full subcategory of affinoid perfectoid spaces étale over `X`. Modules are pseudocoherent in
the sense of SGA 6 and Kedlaya–Liu (resolutions by finitely generated projectives), not in the
different sense that [KL II] §1.1, p. 10, attributes to Bourbaki's *Algèbre commutative*, Exercise
I.2.11. Tensor products are algebraic unless written `⊗̂`. Characteristic `p` is used only through
the Jacobian criterion (A3.3); every other statement holds for perfectoid bases of any
characteristic, and the passage between characteristics tilts étale categories, never closed
immersions.

### A3.1 pseudocoherent modules and sheaves

The subsection builds the required cases of [KL II] §§1.1–1.2 and 2.4–2.5: pseudocoherent modules
over sheafy complete Tate pairs, with no imperfect period rings and no étale-site or pro-étale
variants.

**Pseudocoherent and finite-projective-dimension modules over a commutative ring.**
(*pseudocoherent-module*) Let `R` be a commutative ring, `M` an `R`-module and `m ∈ ℕ ∪ {∞}`. `M` is
*m-pseudocoherent* if it has a projective resolution `⋯ → P₁ → P₀ → M → 0` with `Pᵢ` finitely
generated for every `i ≤ m`, and *pseudocoherent* if it is ∞-pseudocoherent; `M` is *m-fpd* if it
has a resolution `0 → P_m → ⋯ → P₀ → M → 0` of length at most `m` by finitely generated projectives,
and *fpd* if it is m-fpd for some `m` ([KL II] §1.1, Def. 1.1.1, p. 10). The degree convention:
m-pseudocoherence is the existence of an exact sequence `F_m → ⋯ → F₁ → F₀ → M → 0` of finite free
modules, so the terms `F₀, …, F_m` enter and exactness is asked at `M, F₀, …, F_{m−1}` ([Stacks]
Lemma 15.66.4, Tag 064T); this is the form of the Lean definition `Huber.IsPseudoCoherentOver`, and it is the
`(−m)`-pseudo-coherence of SGA 6 and of [Stacks] Def. 15.66.1 (Tag 064Q), with the index negated. It
is not the different notion that [KL II] §1.1, p. 10, attributes to Bourbaki's *Algèbre
commutative*, Exercise I.2.11. The notion is a property of the module alone, with no topology;
0-pseudocoherent is Mathlib's `Module.Finite`, 1-pseudocoherent is `Module.FinitePresentation` ([KL
II] §1.1, Def. 1.1.1, p. 10), and 2-pseudocoherent asks in addition that the kernel of `F₀ → M` be
finitely presented; for `m ≥ 2` the condition is strictly stronger than finite presentation over
rings that are not coherent ([KL II] §1.1, Rem. 1.1.8, p. 12), which perfectoid Tate rings and their
Tate algebras need not be. Every fpd module is pseudocoherent, and `M` is m-fpd exactly when it is
pseudocoherent of projective dimension at most `m`. The case `m = ∞` is
`Huber.IsPseudoCoherentOver R M ⊤`, owned here. Define `Huber.IsPseudoCoherentOver R M m` and
`Module.IsFPD R M m`; prove `zero_iff` and `one_iff` (the identifications with `Module.Finite` and
`Module.FinitePresentation`), `of_projective` (a finitely generated projective module is
pseudocoherent and 0-fpd), `IsFPD.isPseudoCoherent`, `mono` (m-pseudocoherent implies
m'-pseudocoherent for `m' ≤ m`), `top_iff` (pseudocoherent iff m-pseudocoherent for every finite
`m`; [Stacks] Lemma 15.66.5, Tag 064U), `tensorProduct` (if `M` is flat and `M`, `N` are
m-pseudocoherent then `M ⊗_R N` is m-pseudocoherent, and with `M` flat an m-fpd `M` and an n-fpd `N`
give an (m+n)-fpd `M ⊗_R N`, by totalising the tensor product of resolutions; without flatness the
underived tensor product need not be pseudocoherent: in a non-coherent domain
`R/(f) ⊗_R R/(g) = R/(f, g)` with both factors 1-fpd can fail to be 2-pseudocoherent, so the two
bullets of [KL II] §1.1, Rem. 1.1.3, p. 11, hold for the derived tensor product, [Stacks] Lemma
15.66.16, Tag 0DJE, and not for the underived one), flat base change (along a flat `R → S`, base
change takes m-pseudocoherent (m-fpd) modules to m-pseudocoherent (m-fpd) modules and is exact on
them; [KL II] §1.1, Rem. 1.1.13, p. 13; [Stacks] Lemma 15.66.13, Tag 066C),
base change along a pseudocoherent algebra (if the `R`-algebra `S` is pseudocoherent as an `R`-module,
hence finite, an `S`-module is m-pseudocoherent over `S` iff it is m-pseudocoherent over `R`, for
every `m`; [Stacks] Lemma 15.66.11, Tag 064Z; [KL II] §1.1, Rem. 1.1.13, p. 14. The companion claim
there that `S ⊗_R M` is pseudocoherent over `S` for `M` pseudocoherent holds for the derived base
change, [Stacks] Lemma 15.66.12, Tag 0650; the underived `S ⊗_R M` needs `Tor^R_i(S, M) = 0` for
`i > 0`, for instance `S` flat, and fails for `S = R/(g)`, `M = R/(f)` in the domain of
*test_tensor_not_pseudocoherent*) and `of_isNoetherianRing` (over a noetherian ring every finitely
generated module is pseudocoherent; [Stacks] Lemma 15.66.17, Tag 066E). *Needs:* Mathlib
`Module.Finite`, `Module.FinitePresentation`, `Module.FinitePresentation.fg_ker`,
`Module.Projective`, `Module.Flat`, `TensorProduct`, `CategoryTheory.HasProjectiveDimensionLE`.

Lean: `Huber.IsPseudoCoherentOver` (with `m : ℕ∞`, by finite free resolutions exact in degrees
`≤ m`), `Huber.IsPseudoCoherentOver.zero_iff`, `Huber.IsPseudoCoherentOver.one_iff`, `Module.IsFPD`
(finite free resolutions whose `m`-th syzygy is projective, equivalent to the definition by
Schanuel's lemma) and `Module.IsFPD.isPseudoCoherent`; the rest is README only.

**Checks.**

- *test_quotient_nonZeroDivisor* (computation) — for `f ∈ R` a non-zero-divisor, `R/fR` is 1-fpd
  and pseudocoherent, with resolution `0 → R →(×f) R → R/fR → 0` ([KL II] §1.1, Rem. 1.1.6,
  p. 12).
- *test_finiteProjective* (degenerate) — a finitely generated projective `R`-module is 0-fpd and
  pseudocoherent; the zero module is 0-fpd.
- *test_not_two* (non-example) — for `R = k[x, y₁, y₂, …]/(x·yᵢ : i ≥ 1)`, `k` a field, the module
  `R/xR` is finitely presented but not 2-pseudocoherent: the kernel `xR ≅ R/Ann(x)` of `R → R/xR`
  is not finitely presented, `Ann(x) = (y₁, y₂, …)` being not finitely generated. A definition
  "pseudocoherent := finitely presented" fails this test.
- *test_noetherian* (compatibility) — for `R` noetherian, an `R`-module is pseudocoherent iff it is
  finitely generated (`Module.Finite`).
- *test_tensor_not_pseudocoherent* (negative control for the flatness hypothesis of
  `tensorProduct`) — in the domain `R = ℚ + xℝ[x]`, with `f = x` and `g = √2·x`, the modules
  `R/(f)` and `R/(g)` are 1-fpd, but `fR ∩ gR = x²ℝ[x]` is not finitely generated (its quotient
  by `x³ℝ[x]` is the infinite-dimensional `ℚ`-vector space `ℝ`), so the kernel of
  `R² → (f, g)`, `(a, b) ↦ af + bg`, which is isomorphic to `fR ∩ gR`, is not finitely generated
  and `R/(f) ⊗_R R/(g) = R/(f, g)` is finitely presented but not 2-pseudocoherent.
- *test_projectiveDimension* (compatibility) — `M` is m-fpd iff it is pseudocoherent and
  `CategoryTheory.HasProjectiveDimensionLE (ModuleCat.of R M) m` (all `Ext^i(M, −)`, `i > m`,
  vanish). A definition dropping the projectivity of the m-th syzygy fails it.
- *test_not_fpd* (non-example) — over `R = ℤ/4`, the module `R/2R` is pseudocoherent (`R` is
  noetherian) but not m-fpd for any `m`: every syzygy of `0 → 2R → R → R/2R → 0` is again
  `2R ≅ R/2R`, which is not projective. Here `2` is a zero-divisor, so the regularity hypothesis of
  *test_quotient_nonZeroDivisor* is needed.

**`Huber.IsPseudoCoherentOver`.** `M` has a resolution by finite free modules exact in degrees
`≤ m`. Each Check below is a Lean example.

**Checks.**

- *isPseudoCoherentOver_zmod_four* (computation) — over `ℤ/4` the module `ℤ/2` is pseudocoherent,
  by the periodic resolution with maps `×2`, and is `m`-fpd for no `m`; the Lean form of
  *test_not_fpd* (Lean example).
- *isPseudoCoherentOver_zero_module* (degenerate) — the zero module is pseudocoherent, by the zero
  resolution (Lean example).
- *isPseudoCoherentOver_not_two* (non-example) — for `R = ℚ[x, y₁, y₂, …]/(x yᵢ)` the module `R/xR`
  is `1`-pseudocoherent but not `2`-pseudocoherent; the Lean form of *test_not_two* with `k = ℚ`
  (Lean example).

**Two-out-of-three for pseudocoherent and fpd modules.** (*pseudocoherent-two-out-of-three*) Let
`0 → M₁ → M → M₂ → 0` be a short exact sequence of modules over a commutative ring `R` and `m ≥ 0`.
Prove: (a) if `M₁` and `M₂` are m-pseudocoherent, so is `M`; (b) if `M₁` is (m−1)-pseudocoherent and
`M` is m-pseudocoherent, then `M₂` is m-pseudocoherent; (c) if `M` is m-pseudocoherent and `M₂` is
(m+1)-pseudocoherent, then `M₁` is m-pseudocoherent (for `m = 0` the hypothesis on `M₁` in (b) is
empty: a quotient of a finitely generated module is finitely generated; the proposed Lean form requires
`(0 < m → IsPseudoCoherentOver R M₁ (m - 1))`, so imposes no condition on `M₁` when `m = 0`); (d) if
`M₁` and `M₂` are m-fpd, so is `M`; (e) if `M₁` is m-fpd and `M` is (m+1)-fpd, then `M₂` is
(m+1)-fpd; (f) if `M` is m-fpd and `M₂` is (m+1)-fpd, then `M₁` is m-fpd. In particular, if two of
`M₁`, `M`, `M₂` are pseudocoherent (resp. fpd) so is the third, and the pseudocoherent (resp. fpd)
modules form an exact subcategory closed under extensions, kernels of surjections and cokernels of
injections ([KL II] §1.1, Lem. 1.1.5, p. 11; [Stacks] Lemma 15.66.2, Tag 064R, with the index
negated). The proposed Lean forms are exact-sequence lemmas for `Huber.IsPseudoCoherentOver` (for
finite `m`; the case `m = ∞` follows with `top_iff`) and for `Module.IsFPD`. *Needs:* *pseudocoherent-module*; Mathlib
`Module.FinitePresentation.fg_ker`, `Module.Projective`. README only (no Lean declaration).

**Checks.**

- *test_ker_mul_nonZeroDivisor* — for `M` pseudocoherent and `f ∈ R` a non-zero-divisor *on `M`*
  (`M[f] = 0`), the cokernel `M/fM` of `M →(×f) M` is pseudocoherent by (b), and
  `fM = ker(M → M/fM) ≅ M` is pseudocoherent ([KL II] §1.1, Rem. 1.1.6, for `M = R`).
- *test_ker_mul_zeroDivisor_not* (non-example) — for
  `R = k[x, y₁, y₂, …]/(x·yᵢ)`, `M = R` and `f = x`, multiplication is not injective:
  `Ann(x) = (y₁, y₂, …)` is not finitely generated. Thus `R/xR` is not 2-pseudocoherent
  and `xR` is not finitely presented. The domain counterexample for regularity on `R`
  without regularity on `M` is *test_tensor_not_pseudocoherent*.
- *test_valuationRing_residue* (non-example; the degree shifts are sharp) — for a valuation ring
  `O` whose maximal ideal `𝔪` is not finitely generated, such as the valuation ring of `ℂ_p` or of
  any perfectoid field, `O/𝔪` is 0- but not 1-pseudocoherent, and in `0 → 𝔪 → O → O/𝔪 → 0` the
  middle term is pseudocoherent while `𝔪` is not even 0-pseudocoherent. So (c) at `m = 0` fails
  when `M₂` is only 0-pseudocoherent, and (b) at `m = 1` fails without the hypothesis on `M₁`. For
  `0 → ℤ →(×2) ℤ → ℤ/2 → 0` the projective dimensions are `0, 0, 1` (check *fpd_not_projective*), so
  (e) cannot conclude that `M₂` is m-fpd.

**Quotients by weakly regular sequences are fpd, with free conormal module.**
(*koszul-regular-sequence-fpd*) Let `R` be a commutative ring and `f₁, …, f_r ∈ R` a weakly regular
sequence on `R` (Mathlib `RingTheory.Sequence.IsWeaklyRegular R [f₁, …, f_r]`: each `fᵢ` is a
non-zero-divisor on `R/(f₁, …, f_{i−1})`; the quotient `R/(f)` may be zero). Prove that the Koszul
complex `K(f; R)` is a resolution of `R/(f)` by finite free modules of length `r`, so `R/(f)` is
r-fpd and pseudocoherent, the ideal `(f)` is (r−1)-fpd for `r ≥ 1`, and the conormal module
`(f)/(f)²` (Mathlib `Ideal.Cotangent`) is a free `R/(f)`-module with basis the classes
`Ideal.toCotangent fᵢ` of `f₁, …, f_r` ([KL II] §1.1, Rem. 1.1.6, p. 12, the r-fold iteration of
Kedlaya–Liu's non-zero-divisor example). The proposed Lean form states these conclusions, and a
companion supplies the two
linear differentials `R → R² → R` for a weakly regular pair `(x,y)`, with
`d₂(r) = (−yr,xr)` and `d₁(a,b) = xa+yb`, injective `d₂`, exactness at `R²`, and
exactness at `R` for the quotient augmentation `R → R/(x,y)`. This fixes the sign and
ordered basis of the two-equation resolution tested by *koszul_two_equations*.
The pinned Mathlib has no general Koszul complex; constructing the finite free resolution
in every length is part of this target. After a flat base change `R → R'` the sequence stays weakly
regular (Mathlib `RingTheory.Sequence.IsWeaklyRegular.of_flat`), so the same conclusions hold over
`R'`. In a noetherian local ring the projective dimension of the quotient is Mathlib's
`projectiveDimension_quotient_eq_length` and
`projectiveDimension_quotient_eq_add_length_of_isWeaklyRegular`; the finite free resolution, the
freeness of the conormal module and the non-noetherian case are the content here. *Needs:*
*pseudocoherent-module*; *pseudocoherent-two-out-of-three*; Mathlib
`RingTheory.Sequence.IsWeaklyRegular`, `Ideal.Cotangent`, `Module.Flat`. README only (no Lean declaration).

**Checks.**

- *test_single_nonZeroDivisor* — `r = 1`: `R/fR` is 1-fpd for `f` a non-zero-divisor, and
  `fR/f²R` is free of rank one over `R/fR` on the class of `f` ([KL II] §1.1, Rem. 1.1.6). For
  `f = 1` both are zero, over the zero ring.
- *test_variables_regular* — for a complete Tate ring `C`, the variables `u₁, …, u_N` are weakly
  regular on `C⟨u₁, …, u_N⟩`, so `C = C⟨u⟩/(u)` is N-fpd over `C⟨u⟩` (used by
  *fs-iv-4-13-regular-sequence*).

**Natural topology and strictness for finitely generated modules over a complete Tate ring.**
(*natural-topology-strict-exactness*) Let `A` be a complete Hausdorff Tate ring (Tau Ceti
`Huber.IsTateRing`; a pseudouniformiser makes `A` metrizable, Kedlaya–Liu's open mapping ring) and
`M` a finitely generated `A`-module. Prove: (a) the natural topology on `M`, the quotient topology
of any surjection `Aⁿ → M`, is Mathlib's `moduleTopology A M`; it does not depend on the surjection,
and every `A`-linear map from `M` to a topological `A`-module is continuous ([KL II] §1.2, Def.
1.2.2, p. 14); (b) every continuous surjective `A`-linear map between complete metrizable
topological `A`-modules, the source nonarchimedean, is strict (open onto its image), and a
continuous `A`-linear map with closed image between complete metrizable modules is strict (Tau Ceti
`Huber.IsTateRing.isOpenMap`, `Huber.IsTateRing.isStrictMap_of_isClosed_range`; [KL II] §1.2, Thm.
1.2.9(b), p. 16); (c) if `M` is Hausdorff for its natural topology then it is complete, and for
every exact `0 → K → F → M → 0` with `F` finite free, `K` is closed in `F` ([KL II] §1.2, Rem.
1.2.3, pp. 14–15); (d) if `M` is complete for its natural topology and `N ⊆ M` is a submodule whose
closure `N̄` is finitely generated, then `N = N̄`, `N` is closed in `M` and complete for its natural
topology, so a dense submodule of a finitely generated complete module is the whole module ([KL II]
§1.2, Cor. 1.2.11, p. 16, whose hypothesis is on the completion `N̂`; proof: the surjection
`Aᵏ → N̄` is open by (b), so the preimage of `N` is a dense submodule of `Aᵏ`, and a dense submodule
of `Aᵏ` is `Aᵏ`, by induction on `k` from the case `k = 1`, where a dense ideal contains a unit, the
units of `A` being open; for the induction step choose `(n, 1) ∈ N` and subtract multiples of it to
see that `N ∩ (A^{k−1} × 0)` is dense in `A^{k−1} × 0`); finite generation of `N` alone does not
suffice, as `x·A` is not closed in the Banach algebra `A = C(ℤ_p, ℚ_p)`; the proposed Lean form
`finite_submodule_isClosed` assumes `Module.Finite A M`, completeness for the module topology and
finite generation of `N̄`, and adds natural completeness of `N` to Tau Ceti’s closedness conclusion;
(e) finite projective `A`-modules are complete for their natural topology ([KL II] §1.2, Rem. 1.2.4,
p. 15); (f) a strict exact complex of complete metrizable modules stays strict exact after
completion (AdicSpacesPartII layer R0, *strict-complex-completion-exact*). Every clause is in the
library or in R0, and the item collects them in the form A3 uses: (a) is Mathlib
`IsModuleTopology.continuous_of_linearMap` with Tau Ceti `IsTateRing.isModuleTopology` for the
uniqueness; (b) is Tau Ceti `IsTateRing.isOpenMap`, `isQuotientMap` and
`isStrictMap_of_isClosed_range`; (c) is Tau Ceti `completeSpace_moduleTopology`
(`TauCeti/Topology/Algebra/Module/Finite.lean`: a finite module over a complete first-countable ring
is complete for the right uniformity of its module topology, with no Hausdorff hypothesis), so that
natural completeness of a finite module is its Hausdorff property (check *test_iff_t2*), with Mathlib
`ContinuousLinearMap.isClosed_ker` after `IsModuleTopology.continuous_of_linearMap`; (d) is
`finite_submodule_isClosed`, whose closedness half is Tau Ceti
`TauCeti.Huber.isClosed_of_module_finite_topologicalClosure`, with `isClosed_of_isNoetherian` for the
noetherian form and `IsTateRing.exists_presentation_isStrictMap_isOpenMap` for strict presentations;
(e) is the projective case of `Huber.IsNaturallyComplete` (completeness from `completeSpace_moduleTopology`, the
Hausdorff property because a finite projective module is a retract of some `Aⁿ`); and the forms over
a noetherian ring of definition are R0's *noetherian-rod-module-topology-strict* and its companions.
The strictly m-pseudocoherent modules of *stably-pseudocoherent-module* are the m-pseudocoherent
modules satisfying the Hausdorff condition of (c). *Needs:* AdicSpacesPartII layer R0; Tau Ceti
`Huber.IsTateRing`, `Huber.IsTateRing.isOpenMap`, `Huber.IsTateRing.isStrictMap_of_isClosed_range`,
`TauCeti.Huber.isClosed_of_module_finite_topologicalClosure`, `completeSpace_moduleTopology`; Mathlib
`moduleTopology`, `IsModuleTopology`, `Topology.IsStrictMap`.

Lean: `Huber.IsNaturallyComplete` (completeness and Hausdorffness for the natural topology,
Mathlib's `moduleTopology` with its canonical uniformity); the rest is README only.

**Checks.**

- *test_noetherian_submodules_closed* — for `A = ℚ_p⟨T⟩` every submodule of a finite module is
  closed (Tau Ceti `isClosed_of_isNoetherian`); for a non-noetherian Banach ring a principal ideal
  `fA` with `f` a non-zero-divisor need not be closed ([KL II] §1.2, Def. 1.2.13 and the remark
  there, p. 17; for perfectoid rings Ex. 2.4.2, pp. 35–36), so (d) does not extend to arbitrary
  submodules.
- *test_closure_fg_needed* (non-example) — for `A = C(ℤ_p, ℚ_p)` with the sup norm and `x` the
  identity function, `g(x) := p^{⌊v_p(x)/2⌋}` (`g(0) := 0`) is continuous and a uniform limit of
  elements of `x·A`, but `g/x` is unbounded, so `g ∉ x·A`: the ideal `x·A` is finitely generated
  and not closed, and its closure, the ideal of functions vanishing at `0`, is not finitely
  generated. So the hypothesis of (d) is on `N̄`, not on `N`.
- *test_iff_t2* (compatibility) — for `M` finite, `IsNaturallyComplete A M` holds iff `M` is
  Hausdorff for `moduleTopology A M` (Tau Ceti `completeSpace_moduleTopology`, [KL II] §1.2,
  Rem. 1.2.3).

**Strictly and stably pseudocoherent modules over a complete Tate Huber pair.**
(*stably-pseudocoherent-module*) Let `(A, A⁺)` be a complete Tate Huber pair (`A` complete Hausdorff
with a pseudouniformiser `ϖ`, `A⁺` a ring of integral elements) and `m ∈ ℕ ∪ {∞}`. An `A`-module `M`
is *strictly m-pseudocoherent* (resp. *strictly m-fpd*) if it is m-pseudocoherent (resp. m-fpd) and
complete, in particular Hausdorff, for its natural topology ([KL II] §1.2, Def. 1.2.13, p. 17); it
is *stably m-pseudocoherent* (resp. *stably m-fpd*) if it is m-pseudocoherent (resp. m-fpd) and for
every rational localisation `(A, A⁺) → (B, B⁺)`, `B = A⟨T/s⟩` the completed localisation at a
rational subset `R(T/s) ⊆ Spa(A, A⁺)` (AdicSpaces layer 3; Tau Ceti
`Huber.PairOfDefinition.completionLocalization`), the algebraic tensor product `M ⊗_A B` is complete
for its natural topology as a `B`-module ([KL II] §2.4, Def. 2.4.1, p. 35); *stably pseudocoherent*
means stably ∞-pseudocoherent. The tensor products are algebraic and are asked to be complete
already, no completed tensor product being formed; the identity localisation is included, so stably
implies strictly; the plus ring enters only through the set of rational subsets; no sheafiness is
assumed in the definition. Define `Huber.IsStrictlyPseudoCoherent`, `Huber.IsStablyPseudoCoherent`
and `Huber.IsStablyFPD`. Natural completeness is the second conjunct of strict
pseudocoherence; for stable pseudocoherence use `(h.isStrictlyPseudoCoherent).2`.
Prove `isStrictlyPseudoCoherent` (stably implies strictly),
`IsStablyFPD.isStablyPseudoCoherent`, `of_projective` (finite projective modules are stably
pseudocoherent and stably 0-fpd), and the base change
for `m = 2` (along a 2-pseudoflat rational
localisation `B`, `M ⊗_A B` is stably 2-pseudocoherent over `B`, since 1-pseudocoherence survives
every base change; [KL II] §2.4, Rem. 2.4.5, p. 37) and
for `m = ∞` (when every rational localisation of
`A` is 2-pseudoflat, as over a sheafy pair by *rational-localisation-pseudoflat*: the syzygies of
`M` are then stably pseudocoherent as well, which a hypothesis on `B` alone does not give; [KL II]
§2.4, Thm. 2.4.15 and its parenthetical consequence, p. 40), the two-out-of-three property (when
every rational localisation of `A` is 2-pseudoflat, for a short exact sequence
`0 → M₁ → M → M₂ → 0`: if `M₁` and `M₂` are stably pseudocoherent so is `M`, and if `M` and `M₂` are
stably pseudocoherent so is `M₁`; from *pseudocoherent-two-out-of-three*, the exactness of `− ⊗_A B`
on the sequence (`Tor₁(M₂, B) = 0`), the closedness of the kernel of a continuous map to a Hausdorff
module, and the completeness of an extension of complete finitely generated modules by a finitely
presented one. The third case fails: the cokernel `M₂` of an injection of stably pseudocoherent
modules is stably pseudocoherent only if the image of `M₁ ⊗_A B` is closed in `M ⊗_A B` for every
rational localisation `B`, see *test_coker_not_stably*) and `of_isStronglyNoetherian` (over a
strongly noetherian Tate ring, finite modules are stably pseudocoherent; [KL II] §2.4, remark after
Def. 2.4.1, p. 35). *Needs:* *pseudocoherent-module*; *natural-topology-strict-exactness*; Tau Ceti
`Huber.Pair`, `Huber.IsTateRing`, `Huber.PairOfDefinition.completionLocalization`,
`ValuationSpectrum.rationalSubset`; Mathlib `moduleTopology`.

Lean: `Huber.ratLoc` (with its ring structure `Huber.ratLocCommRing`) and `Huber.ratLocPair` (the
completed rational localisation `A⟨T/s⟩` as a complete Tate ring and Huber pair, from Tau Ceti's completion and completed plus ring) and
`Huber.IsStablyPseudoCoherent` (m-pseudocoherence together with natural completeness of every
`A⟨T/s⟩ ⊗_A M`, `T` generating an open ideal); the rest is README only.

**Checks.**

- *test_finiteProjective* (degenerate) — a finite projective `A`-module `P` is stably
  pseudocoherent and stably 0-fpd: `P ⊗_A B` is finite projective over `B`, hence complete.
- *test_tateAlgebra_quotient* (computation) — for `A = ℚ_p⟨T⟩`, strongly noetherian, `M = A/TA`
  is stably 1-fpd, and for every rational localisation `B`, `M ⊗_A B = B/TB`.
- *test_not_stably* (non-example) — [KL II] §2.4, Ex. 2.4.2, pp. 35–36: an affinoid perfectoid
  `(A, A⁺)` and a non-zero-divisor `f` with `fA` closed, so `A/fA` strictly pseudocoherent, but
  `fB` not closed for some rational localisation `B`, so `A/fA` is not stably pseudocoherent. A
  definition using only completeness of `M` itself fails this test.
- *test_strongly_noetherian* (compatibility) — for `A` strongly noetherian (Tau Ceti
  `IsStronglyNoetherian`), an `A`-module is stably pseudocoherent iff it is finitely generated.
- *test_coker_not_stably* (non-example) — for the sheafy (stably uniform) Banach algebra
  `A = C(ℤ_p, ℚ_p)` and `x` the identity function, `×x : A → A` is an injection of stably
  pseudocoherent modules whose cokernel `A/xA` is not Hausdorff for its natural topology
  (check *test_closure_fg_needed*), hence not strictly, let alone stably, pseudocoherent: cokernels of
  injections are not covered by the two-out-of-three property.
- *test_identity_localisation_needs_complete* (non-example) — the implication "stably implies
  strictly" uses that the identity localisation `A⟨1/1⟩` is `A`, i.e. that `A` is complete: for
  `A = ℚ` with the `p`-adic topology (ring of definition `ℤ_(p)`, pseudouniformiser `p`), a
  Hausdorff Tate ring that is not complete, the module `M = ℚ` is pseudocoherent and
  `B ⊗_ℚ ℚ = B` is complete for every completed localisation `B`, but `ℚ` is not complete for its
  natural topology. When formalised, the witness records that `ℚ` is Tate and Hausdorff, so only completeness
  is dropped.

**`Huber.ratLocCommRing`.** The ring structure of `A⟨T/s⟩ = Huber.ratLoc P T s hden`, that of
Tau Ceti's completion of `A[1/s]` for the localisation topology. Each Check below is a Lean
example.

**Checks.**

- *ratLocCommRing_isUnit* (computation) — the image of `s` in `A⟨T/s⟩` is a unit (Lean example).
- *ratLocCommRing_zero* (degenerate) — for `s = 0` the ring `A⟨T/0⟩` is zero, the coordinate ring
  of the empty rational subset `R(T/0)`, so `ratLocPair` is the zero pair, as in *rational_empty*
  (Lean example).
- *ratLocCommRing_padic_vanishes* (non-example) — `A⟨T/s⟩` is not `A[1/s]`: for `A = ℚ_p`,
  `T = {1}` and `s = p` the localisation `ℚ_p[1/p] = ℚ_p` is nonzero, but its localisation topology
  has ring of definition `ℤ_p[1/p] = ℚ_p` and is indiscrete, so `ℚ_p⟨1/p⟩ = 0`, matching
  `R(1/p) = ∅` in `Spa(ℚ_p, ℤ_p)` (Lean example).

**`Huber.ratLocPair`.** `A⟨T/s⟩` with Tau Ceti's completed plus ring, the closure of the image
of the integral closure of `A⁺[T/s]`. Each Check below is a Lean example.

**Checks.**

- *ratLocPair_mem_plus* (computation) — each `t/s`, `t ∈ T`, lies in the plus ring; for
  `A = ℚ_p⟨X⟩`, `T = {X, p}` and `s = p` this puts `X/p` in it, which is not in the closure of the
  image of `ℤ_p⟨X⟩` (Lean example, the membership).
- *ratLocPair_one* (degenerate) — over a complete `A`, `T = {1}` and `s = 1` return `(A, A⁺)`:
  `A → A⟨1/1⟩` is bijective and carries `A⁺` onto the plus ring, as in *Huber.ratLoc_identity*
  (Lean example).
- *ratLocPair_ne_powerBounded* (non-example) — the plus ring is not the power-bounded subring in
  general: for `A⁺ ⊊ A°` the identity localisation has plus ring the image of `A⁺` (Lean example).

**`Huber.IsStablyPseudoCoherent`.** `m`-pseudocoherence together with natural completeness of
every base change `A⟨T/s⟩ ⊗_A M`. Each Check below is a Lean example.

**Checks.**

- *isStablyPseudoCoherent_projective* (computation) — a finite projective module is stably
  pseudocoherent, its base changes being finite projective, hence complete (Lean example).
- *isStablyPseudoCoherent_zero* (degenerate) — the zero module is stably pseudocoherent (Lean
  example).
- *isStablyPseudoCoherent_coker* (non-example) — over a complete `A`, the quotient `A/xA` by a
  non-closed principal ideal is not stably pseudocoherent, its base change to `A⟨1/1⟩ = A` not
  being Hausdorff. For `A = C(ℤ_p, ℚ_p)` and `x` the identity function this is
  *test_coker_not_stably*; the Lean example states the general form, `C(ℤ_p, ℚ_p)` not being a
  carrier of `Suggested.lean` (Lean example).

**Pseudoflat and pro-projective modules over a complete Tate Huber pair.** (*pseudoflat-module*) Let
`(A, A⁺)` be a complete Tate Huber pair and `m ∈ ℕ ∪ {∞}`. A topological `A`-module `B` (for
rational localisations, an `A`-algebra) is *m-pseudoflat* if `Tor₁^A(P, B) = 0` for every stably
m-pseudocoherent `A`-module `P`, and *pseudoflat* if ∞-pseudoflat ([KL II] §2.4, Def. 2.4.4, p. 36).
The vanishing of `Tor₁^A(M, B)` for every strictly m-pseudocoherent `M`, equivalently the
injectivity of `M ⊗_A B → N ⊗_A B` for every short exact `0 → M → N → P → 0` with `N` finite
projective and `P` strictly m-pseudocoherent, implies m-pseudoflatness ([KL II] §2.4, Rem. 2.4.5,
pp. 36–37; stably implies strictly over a complete `A`). With *stably* in place of *strictly*, the
criterion with `N` finite projective is equivalent to m-pseudoflatness, since `Tor₁^A(P, B)` does
not depend on the projective presentation of `P`: this is `iff_injective_rTensor`. A complete
metrizable `A`-module `B` is *pro-projective* if it carries a sequence of continuous `A`-linear
projectors `πₖ`, indexed by `ℕ`, with finite projective images,
`πₗ ∘ πₖ = πₖ` whenever `k ≤ l`, and `πₖ(v) → v` for all `v` ([KL II]
§2.4, Def. 2.4.6, p. 37). Tor is algebraic; only `Tor₁` is required, higher Tor need not vanish;
2-pseudoflat implies m-pseudoflat for all `m ≥ 2`, in particular pseudoflat. Define
`Huber.IsPseudoFlat A B m` and `Huber.IsProProjective A B`; prove `of_flat` (flat modules are
pseudoflat), `of_isProProjective` (`Tor₁^A(Q, B) = 0` for `B` pro-projective and `Q` strictly
2-pseudocoherent, so pro-projective modules are 2-pseudoflat; [KL II] §2.4, Lem. 2.4.7, p. 37, and
Cor. 2.4.8, p. 38; *restricted-power-series-pro-projective*), `iff_injective_rTensor` (the
stably-pseudocoherent form of the Rem. 2.4.5(c) criterion), `mono`, `comp` (a 2-pseudoflat rational
localisation followed by a 2-pseudoflat morphism is 2-pseudoflat; [KL II] §2.4, Rem. 2.4.5, p. 37)
and the base change of stably pseudocoherent modules along rational localisations, for `m = 2`
and for `m = ∞` (see *stably-pseudocoherent-module*; exactness of `M ↦ M ⊗_A B` is
`Huber.exact_tensor_ratLoc` over sheafy bases and the proposed
`exact_tensor_ratLoc_sousperfectoid` over sousperfectoid ones). *Needs:* *stably-pseudocoherent-module*; Mathlib `Module.Flat`,
`TensorProduct`.

Lean: `Huber.IsPseudoFlat` (stated as injectivity of `K ⊗ B → Aⁿ ⊗ B` for every stably
m-pseudocoherent `Aⁿ/K`, the definition's vanishing of `Tor₁`); the rest is README only.

**Checks.**

- *test_flat* (compatibility) — a flat `A`-module (Mathlib `Module.Flat`) is m-pseudoflat for
  every `m` (Lean example).
- *test_restrictedPowerSeries* (computation) — for every complete Tate pair `(A, A⁺)`, `A⟨T⟩` and
  `A⟨T^{±1}⟩` are pro-projective, hence 2-pseudoflat.
- *test_quotient_not* (non-example) — for `A = ℚ_p⟨T⟩` and `B = A/TA`: `A/TA` is stably
  pseudocoherent and `Tor₁^A(A/TA, A/TA) ≅ A/TA ≠ 0`, so `B` is not pseudoflat (`m = ∞`, the
  weakest level), hence not m-pseudoflat for any `m`; more generally this obstruction applies
  when the nonzero quotient by the non-zero-divisor is itself stably pseudocoherent.
- *test_iff_injective* (characterisation) — `B` is m-pseudoflat iff `M ⊗_A B → N ⊗_A B` is
  injective for all `0 → M → N → P → 0` with `N` finite projective and `P` stably
  m-pseudocoherent (the stably-pseudocoherent form of [KL II] §2.4, Rem. 2.4.5(c)); the content
  is the passage from `N = Aⁿ`, which is the definition, to finite projective `N`. The test
  modules `M`, `N`, `P` live in the same universe `Type u` as `A`.
- *test_indiscrete_not_proProjective* (non-example) — the definition of pro-projective must ask
  for `B` complete metrizable (in particular Hausdorff): with the indiscrete topology on any
  `A`-module `B`, the zero projectors `πₖ = 0` are continuous with finite projective image and
  `πₖ(v) = 0 → v`, yet `B = ℚ_p⟨T⟩/(T)` over `A = ℚ_p⟨T⟩` is not 2-pseudoflat
  (check *test_quotient_not*); so "pro-projective implies 2-pseudoflat" needs the Hausdorff condition.

**`Huber.IsPseudoFlat`.** Injectivity of `K ⊗_A B → Aⁿ ⊗_A B` for every stably
`m`-pseudocoherent `Aⁿ/K`, the vanishing of `Tor₁`. Each Check below is a Lean example, as is
*test_flat* above.

**Checks.**

- *isPseudoFlat_tateAlgebra* (computation) — over a complete Tate ring `A`, `A⟨T⟩` is
  `2`-pseudoflat, being pro-projective; the Lean form of *test_restrictedPowerSeries* for `A⟨T⟩`
  (Lean example).
- *isPseudoFlat_zero* (degenerate) — the zero module is `m`-pseudoflat for every `m` (Lean
  example, proved).
- *isPseudoFlat_quotient* (non-example) — for `A = ℚ_p⟨T⟩` the quotient `A/TA` is not pseudoflat;
  the Lean form of *test_quotient_not* (Lean example).

**Restricted power series and Laurent series are pro-projective; `M ⊗_A A⟨T⟩ = M⟨T⟩`.**
(*restricted-power-series-pro-projective*) Let `(A, A⁺)` be a complete Tate Huber pair. Prove: (a)
`A⟨T⟩` (Tau Ceti `Huber.restrictedMvPowerSeriesCompletion 1 A`) and `A⟨T^{±1}⟩` (restricted Laurent
series `Σ_{n∈ℤ} aₙTⁿ` with `aₙ → 0` as `|n| → ∞`) are pro-projective `A`-modules, by truncation
projectors, and pro-projectivity is stable under completed base change ([KL II] §2.4, Def. 2.4.6, p.
37); (b) for `B` pro-projective and `M` strictly 2-pseudocoherent, `M ⊗_A B` is complete for its
natural topology and `Tor₁^A(M, B) = 0`, so every pro-projective module is 2-pseudoflat ([KL II]
§2.4, Lem. 2.4.7, p. 37, and Cor. 2.4.8, p. 38); (c) for `M` finitely generated (resp. finitely
presented) and complete for its natural topology, the natural maps `M ⊗_A A⟨T⟩ → M⟨T⟩` and
`M ⊗_A A⟨T^{±1}⟩ → M⟨T^{±1}⟩` onto the modules of null sequences are surjective (resp. bijective)
([KL II] §2.4, Cor. 2.4.9, p. 38). For a finite module with its module topology over a complete
noetherian Tate ring, (c) is Tau Ceti `restrictedMvPowerSeriesBaseChangeEquiv` (Wedhorn 8.29); its
statement for a finitely presented complete `M` over any complete Tate `A`, and the pro-projectivity
(a)–(b), are the content here. The proposed Lean forms are
`isProProjective_restrictedMvPowerSeriesCompletion`, `isProProjective_restrictedLaurentSeries`,
the pro-projective case of pseudoflatness (the `Tor₁` half of (b)) and, for `A⟨T⟩`, the natural map
`restrictedPowerSeriesTensorToNull`, `f ⊗ v ↦ (aₙ(f) v)ₙ` into the module `nullSequences M` of null
sequences, with coefficients `restrictedCoeff` read through Tau Ceti
`restrictedMvPowerSeriesCompletionEquiv`, and `restrictedPowerSeriesTensorToNull_surjective`
(surjective for `M` finite, bijective for `M` finitely presented). The Laurent map is
`restrictedLaurentSeriesTensorToNull`; `restrictedLaurentSeriesTensorToNull_tmul` specifies
its coefficient in every integer degree, and `restrictedLaurentSeriesTensorToNull_surjective`
gives surjectivity and the finitely presented bijectivity clause. Its domain and codomain
use the defining expression of Tau Ceti `twoSidedRestrictedSubmodule A A` and
`twoSidedRestrictedSubmodule A M`, namely Mathlib's `zeroAtFilterSubmodule` at the cofinite
filter on `ℤ`. Thus negative coefficients are part of the carrier, with no choice of a
representative in `A⟨T,S⟩/(TS−1)`. The targets for stability of pro-projectivity under
completed base change and completeness of `M ⊗_A B` in (b) retain their module-valued
scope; AdicSpacesPartII's `Huber.CompletedTensor` supplies the ring-valued tensor carrier. *Needs:* *natural-topology-strict-exactness*; *stably-pseudocoherent-module*;
*pseudoflat-module*; Tau Ceti `Huber.restrictedMvPowerSeriesCompletion`,
`restrictedMvPowerSeriesCompletionEquiv`. README only (no Lean declaration).

**Checks.**

- *test_quotient_tensor_restricted* (computation) — for `M = A/fA` with `fA` closed, `M` is
  finitely presented and Hausdorff, hence complete, and the natural map
  `A⟨T⟩ ⊗_A (A/fA) → (A/fA)⟨T⟩` is bijective, so `M ⊗ A⟨T⟩ = (A/fA)⟨T⟩ = A⟨T⟩/fA⟨T⟩`.
- *test_coordinate* (convention) — `restrictedCoeff 1 T = 1` and `restrictedCoeff 0 T = 0`:
  `restrictedCoeff n` reads the coefficient of `Tⁿ`; a shifted indexing fails it.
- *test_tmul* (computation) — on a pure tensor, `f ⊗ v ↦ (restrictedCoeff n f • v)ₙ`.
- *test_self* (compatibility) — for `M = A` the natural map is bijective: it is the identification
  of `A⟨T⟩` with the null sequences of `A`, which is how Tau Ceti defines restricted series.

**Checks for `restrictedLaurentSeriesTensorToNull`.**

- *restrictedLaurentSeriesTensorToNull_negative_degree* — `aT⁻¹ ⊗ 1` has coefficient `a` in degree `−1`.
- *restrictedLaurentSeriesTensorToNull_distinct_degrees* — the same tensor has coefficient zero in degree `1`.
- *restrictedLaurentSeriesTensorToNull_self* — for `M = A` the coefficient map is bijective.

**Strictness of multiplication by `T − f` and `1 − fT` over a sheafy pair.**
(*simple-laurent-strict-multiplication*) Let `(A, A⁺)` be a sheafy complete Tate Huber pair
(AdicSpaces layers 3–4) and `f ∈ A` arbitrary, not assumed power-bounded. Let `U₁ = {v(f) ≤ 1}`,
`U₂ = {v(f) ≥ 1}` be the simple Laurent covering of `Spa(A, A⁺)` with rational localisations `B₁`,
`B₂`, `B₁₂`. Prove that multiplication by `T − f` and by `1 − fT` are strict injections on `A⟨T⟩`
and on `A⟨T^{±1}⟩` (injective, with closed image, homeomorphisms onto the image), so that the ideals
`(T − f)A⟨T⟩` and `(1 − fT)A⟨T⟩` are closed and `B₁ = A⟨T⟩/(T − f)`, `B₂ = A⟨T⟩/(1 − fT)`,
`B₁₂ = A⟨T^{±1}⟩/(T − f)` with no closure needed ([KL II] §2.4, Lem. 2.4.10, p. 38; injectivity of
`1 − fT` on `M⟨T⟩` is [KL II] §1.2, Rem. 1.2.8, p. 15; the rational localisation as the quotient of
`A⟨T⟩` by the closure of `(gT − f)` is [KL I] §2.4, Lem. 2.4.13(a), p. 42). Injectivity of `1 − fT`
on `M⟨T⟩` over any nonarchimedean `A`, and of `T − f` for noetherian `M`, is Tau Ceti
`id_sub_smul_mulX_injective` and `smul_id_sub_mulX_injective`; strictness, and the `T − f` case over
a sheafy non-noetherian pair, are the content here. The proposed Lean form
`isStrictMap_mul_X_sub_sousperfectoid` states the four strict injections (closed embeddings) on
`A⟨T⟩` and on `restrictedLaurentSeries A` for `A` sousperfectoid (AdicSpacesPartIV layer R5), the
case used in this layer. The general sheafy forms are
`isStrictMap_mul_X_sub_sheafy` and the corresponding pseudoflatness statement of
*simple-laurent-pseudoflat*, with an explicit `Huber.IsSheafyRing A` hypothesis (Wedhorn Def. 8.26). The rings `simpleLaurentLe A f`, `simpleLaurentGe A f`, `simpleLaurentEq A f` are the
algebraic quotients above; they are the rings of `U₁`, `U₂`, `U₁ ∩ U₂` exactly when the ideals are
closed, which is what the lemma provides. *Needs:* *natural-topology-strict-exactness*;
*restricted-power-series-pro-projective*; AdicSpacesPartIII layer R3 (Tate acyclicity of sheafy
affinoids); Tau Ceti `Huber.restrictedMvPowerSeriesCompletion`,
`Huber.PairOfDefinition.rationalEvalHom_surjective`,
`Huber.PairOfDefinition.completionLocalization`. README only (no Lean declaration).

**Checks.**

- *test_disc_localisation* — for `A = ℚ_p⟨X⟩` and `f = X/p`: `B₁ = ℚ_p⟨X, T⟩/(T − X/p) =
  ℚ_p⟨X/p⟩`, the ring of `U₁ = {|X| ≤ |p|}`, and `B₂ = ℚ_p⟨X, T⟩/(1 − XT/p) = ℚ_p⟨X, p/X⟩`, the
  ring of `U₂ = {|X| ≥ |p|}`: on `U₂` the element `T = p/X` is the power-bounded inverse of `f`.
  For `f = 1/p ∈ ℚ_p` (not power-bounded), `T − 1/p = −p^{−1}(1 − pT)` is a unit of `ℚ_p⟨T⟩`, so
  `B₁ = 0 = O(∅)`, as `U₁ = {|1/p| ≤ 1} = ∅`. When formalised, the checks identify `B₁` with the rational
  localisation at `R({X, p}/p)` and `B₂` with that at `R({X, p}/X)`.
- The degenerate values `f = 0` (pieces `A`, `0`, `0`), `f = 1` (`A`, `A`, `A`) and `f = ϖ` a
  pseudouniformiser (`A`, `0`, `0`) are the Checks *simple_zero*, *simple_one*, *simple_small* of
  this layer's Examples.

**Simple Laurent Čech exactness for stably 2-pseudocoherent modules.**
(*simple-laurent-cech-exact-two*) In the situation of *simple-laurent-strict-multiplication*,
let `P` be a stably 2-pseudocoherent `A`-module. Prove that the algebraic tensor sequence
`0 → P → (P ⊗_A B₁) ⊕ (P ⊗_A B₂) → P ⊗_A B₁₂ → 0` is exact; the maps are the pair of
restriction maps and their difference, in that order. Its proposed name is
`simpleLaurent_cech_exact_of_isStablyPseudoCoherent_two`. This is the right column of
[KL II] §2.4, Lem. 2.4.13, diagram (2.4.13.1), pp. 39–40. Build it directly from finite
presentations, completeness of the rational base changes and the strict Laurent multiplication
sequences, using [KL II] Cor. 2.4.9 and the finite-module glueing argument of [KL I] §2.7,
Lem. 2.7.4. The ring Čech sequence comes from the sheafy hypothesis. This proof uses neither
rational pseudoflatness nor *pseudocoherent-tate-acyclicity*.
*Needs:* *stably-pseudocoherent-module*; *natural-topology-strict-exactness*;
*restricted-power-series-pro-projective*; *simple-laurent-strict-multiplication*;
AdicSpacesPartIII R3 (the ring-valued simple Laurent glueing square).
README only (no Lean declaration).

**Checks.**

- *simple_cech_two_free* — for `P = A²` this is two copies of the strict ring Čech sequence.
- *simple_cech_two_zero* — for `P = 0` all three module terms vanish.
- *simple_cech_two_unit* — for `f = 1` the sequence is
  `0 → P → P ⊕ P → P → 0`, with `p ↦ (p,p)` and `(p₁,p₂) ↦ p₁ − p₂`.
- *simple_cech_two_small* — for a pseudouniformiser `f = ϖ` the pieces are `A,0,0`,
  giving `0 → P → P → 0 → 0`.

**The three rational localisations of a simple Laurent covering are 2-pseudoflat.**
(*simple-laurent-pseudoflat*) In the situation of *simple-laurent-strict-multiplication* (`(A, A⁺)`
sheafy complete Tate, `f ∈ A`), prove that `A → B₂`, `A → B₁` and `A → B₁₂` are 2-pseudoflat, that
is (`iff_injective_rTensor`), for every exact `0 → M → N → P → 0` with `N` finite projective and `P`
stably 2-pseudocoherent, the sequences `0 → M ⊗ Bᵢ → N ⊗ Bᵢ → P ⊗ Bᵢ → 0` are exact ([KL II] §2.4,
Lem. 2.4.12, p. 39, for `A → B₂`; Lem. 2.4.13, pp. 39–40, for `A → B₁` and `A → B₁₂`; the argument
with `1 − fT` does not transfer directly to `T − f`, and the second lemma's diagram chase replaces
it, [KL II] §2.4, after the proof of Lem. 2.4.12, p. 39). The diagram chase in Lem. 2.4.13 uses
*simple-laurent-cech-exact-two* for its right column, with `P` stably 2-pseudocoherent.
First prove pseudoflatness of `A → B₂` by Lem. 2.4.12; applying it to `f⁻¹` in `B₂` and
composing gives `A → B₁₂`. The two known tensor rows and the Laurent Čech columns then
supply injectivity for `A → B₁`. Its proposed Lean form is the sousperfectoid case. *Needs:* *stably-pseudocoherent-module*; *pseudoflat-module*;
*restricted-power-series-pro-projective*; *simple-laurent-strict-multiplication*;
*simple-laurent-cech-exact-two*; AdicSpacesPartIII layer R3 (glueing squares). README only (no Lean declaration).

**Checks.**

- *test_strongly_noetherian_flat* — for `A` strongly noetherian, e.g. an affinoid
  `ℚ_p`-algebra, the three maps are flat ([KL II] §2.2, Lem. 2.2.6, p. 32; Tau Ceti
  `flat_quotient_algebraMap_sub_restrictedX`, `flat_quotient_one_sub_algebraMap_mul_restrictedX`,
  Wedhorn 8.31(2)), consistent with 2-pseudoflatness.
- *simple_pseudoflat_zero* — for `f = 0` the three algebras are `A,0,0`, all 2-pseudoflat.
- *simple_pseudoflat_unit* — for `f = 1` all three algebras are `A`; tensoring is the identity.

**Reduction of properties of rational inclusions to simple Laurent pieces.**
(*rational-inclusion-reduction*) Let `A` be a Tate ring, with a topologically nilpotent unit `z`,
and `A⁺ ⊆ A` a subring (the argument uses neither completeness of `A` nor any property of `A⁺`, and
the proposed Lean form assumes neither), and let `P` be a
property of inclusions `V ⊆ U` of rational subsets `R(T/s)`, `T` generating an open ideal, of
`Spa(A, A⁺)` such that (a) `P` is transitive: `P(V ⊆ U)` and `P(W ⊆ V)` imply `P(W ⊆ U)`; (b) `P`
holds for every inclusion `V ⊆ U` that is a member of a simple Laurent covering of `U`, i.e.
`V = {v ∈ U : v(h) ≤ 1}` or `V = {v ∈ U : v(h) ≥ 1}` for some `h ∈ O(U)`. Prove that `P` holds for
every inclusion of rational subsets ([KL I] §2.4, Prop. 2.4.24 and its chain of simple Laurent
inclusions, p. 47). The covering form of the same reduction — a local, transitive property of
rational coverings that holds for simple Laurent coverings holds for all — is AdicSpacesPartIII layer
R3's *rational-covering-reduction* (Kedlaya–Liu 2.4.19–2.4.20), stated for complete Tate pairs; this
is its inclusion form. In the proposed Lean form `rationalInclusion_induction` the property is `Q V U` with
the smaller set first (`Q V U` reads `V ⊆ U`), transitivity is `Q V U → Q W V → Q W U`, and (b) is
asked only for `h = t/sⁿ` with `t ∈ A` on `U = R(T/s)`: for `U = Spa(A, A⁺)`, `s = 1`, `h = t` the
two pieces are `R({t, 1}/1) = {v(t) ≤ 1}` and `R({1, t}/t) = {v(t) ≥ 1}`; a general `h ∈ O(U)`
differs from such a `t/sⁿ` by a topologically nilpotent element, which does not change the two
pieces (AdicSpaces layer 3, perturbation invariance). *Needs:* AdicSpacesPartIII layer R3; Tau Ceti
`ValuationSpectrum.rationalSubset`, `Huber.IsTateRing`,
`Huber.PairOfDefinition.completionLocalization`. README only (no Lean declaration).

**Checks.**

- *test_pseudoflat_property* — `P(V ⊆ U) := "O(U) → O(V) is 2-pseudoflat"` satisfies (a) and
  (b) (*rational-localisation-pseudoflat*).

**Rational localisations of sheafy Tate pairs are 2-pseudoflat.**
(*rational-localisation-pseudoflat*) Let `(A, A⁺)` be a sheafy complete Tate Huber pair, so that
every rational localisation is again sheafy, and `(A, A⁺) → (B, B⁺)` a rational localisation. Prove
that `A → B` is 2-pseudoflat; consequently, for `m ∈ {2, ∞}` and every stably m-pseudocoherent
`A`-module `M`, `M ⊗_A B` is a stably m-pseudocoherent `B`-module, and `M ↦ M ⊗_A B` is exact on
short exact sequences of stably m-pseudocoherent `A`-modules ([KL II] §2.4, Thm. 2.4.15 and its
proof via the inclusion-reduction principle and the simple Laurent lemmas, p. 40). This is the
substitute for flatness of rational localisations, which is not known in the non-noetherian case
([KL II] §2.2, Rem. 2.2.8, p. 32). In `Suggested.lean` this target and the next three are stated
over a sheafy complete Tate base: `Huber.isPseudoFlat_ratLoc`,
`Huber.cech_injective_of_isStablyPseudoCoherent`, `Huber.IsStablyPseudoCoherent.isFPD_of_cover`
and `Huber.exact_tensor_ratLoc`. Their proposed sousperfectoid forms (including
`cech_injective_of_isStablyPseudoCoherent_sousperfectoid` and `exact_tensor_ratLoc_sousperfectoid`)
are README only. The proposed `cech_exact_of_isStablyPseudoCoherent_sheafy` states the full
augmented complex over a sheafy base, including injectivity of `M → ∏ M ⊗_A O(Vᵢ)` and exactness in
every degree. The consequences for stably m-pseudocoherent modules are the base changes of
*stably-pseudocoherent-module* (`m = 2`, along one 2-pseudoflat rational localisation; `m = ∞`) and
its two-out-of-three property; the last two assume that every rational localisation of `A` is
2-pseudoflat, which this target supplies over a sheafy base and its sousperfectoid form over a
sousperfectoid one.
*Needs:* *stably-pseudocoherent-module*; *pseudoflat-module*;
*simple-laurent-strict-multiplication*; *simple-laurent-pseudoflat*; *rational-inclusion-reduction*.

Lean: `Huber.isPseudoFlat_ratLoc` (2-pseudoflatness of `A⟨T/s⟩` over a sheafy complete Tate ring);
the rest is README only.

**Checks.**

- *test_strongly_noetherian_reduces* — for `A` strongly noetherian the statement reduces to
  flatness of rational localisations ([KL II] §2.2, Lem. 2.2.6, p. 32; Tau Ceti
  `flat_toCompletionLoc`,
  `flat_restrictionRingHom`, Wedhorn 8.30, and faithful flatness of rational covers,
  `faithfullyFlat_pi_toCompletionLoc`, Wedhorn 8.32); for `A` perfectoid, rational
  localisations are in general not known to be flat and this theorem is the substitute.

**Tate acyclicity for stably pseudocoherent modules.** (*pseudocoherent-tate-acyclicity*) Let
`(A, A⁺)` be a sheafy complete Tate Huber pair, `X = Spa(A, A⁺)`, and `M` a stably pseudocoherent
`A`-module. Let `M̃` be the presheaf on the rational subsets of `X` with `M̃(U) := M ⊗_A O_X(U)`,
extended to open subsets by limits over rational subsets. Prove that for every rational
`U = Spa(B, B⁺) ⊆ X` and every finite covering `𝒱` of `U` by rational subsets the augmented
alternating Čech complex

```text
0 → M ⊗_A B → ∏ M ⊗_A O(V_{i₀}) → ∏ M ⊗_A O(V_{i₀i₁}) → ⋯
```

is exact; in particular `M̃` is a sheaf on the rational subsets with `M̃(U) = M ⊗_A B`, and
`Ȟⁱ(U, M̃; 𝒱) = 0` for `i > 0` ([KL II] §2.5, Thm. 2.5.1 and its proof, which reduces to the simple
Laurent lemma, p. 41). Čech cohomology on finite rational coverings is what is used; the passage to
derived sheaf cohomology is not. The degree-zero part (injectivity of the augmentation) is
`Huber.cech_injective_of_isStablyPseudoCoherent` over a sheafy base and the proposed
`cech_injective_of_isStablyPseudoCoherent_sousperfectoid` over a sousperfectoid base.
The proposed `cech_exact_of_isStablyPseudoCoherent_sheafy` supplies the differentials and full exactness:
cochains are indexed by all ordered tuples, including repetitions, and the `j`th face omits
entry `j` with sign `(−1)^j`. The coefficient map is `ratLocRestriction` tensored with the
identity of `M`. `ratLocRestriction_unique` characterises restriction by continuity and its
value on the base ring; `ratLocRestriction_of_subset` identifies numerator enlargement
with Tau Ceti `PairOfDefinition.restrictionRingHomOfSubset`. This includes intersections
whose rational presentations have different denominators. *Needs:* *stably-pseudocoherent-module*; *simple-laurent-pseudoflat*;
*rational-localisation-pseudoflat*; AdicSpacesPartIII layer R3 (Tate's reduction and Čech acyclicity
of sheafy affinoids).

Lean: `Huber.cech_injective_of_isStablyPseudoCoherent` (degree zero, for a finite rational covering
of `Spa(A, A⁺)` over a sheafy complete Tate ring); the rest is README only.

**Checks.**

- *test_structure_sheaf* — `M = A` is the Tate sheaf property of `O_X` (AdicSpacesPartIII layer
  R3, *sheafy-cech-acyclicity*).
- *test_finite_projective* — `M` finite projective is the finite projective case of
  AdicSpacesPartIII layer R3 (*finite-projective-module-acyclicity*).

**Checks for `ratLocRestriction`.**

- *ratLocRestriction_identity* — restriction from a presentation to itself is the identity.
- *ratLocRestriction_composition* — nested rational inclusions compose in the correct direction.
- *ratLocRestriction_denominator_inverse* — the inverse of the source denominator maps to its inverse in the target.

**Finite projective dimension is local on rational coverings.** (*fpd-local-to-global*) Let
`(A, A⁺)` be a sheafy complete Tate Huber pair and `M` a stably pseudocoherent `A`-module. Prove
that if there are `m ≥ 0` and a finite rational covering `𝒱` of `Spa(A, A⁺)` such that `M ⊗_A O(V)`
is an m-fpd `O(V)`-module for every `V ∈ 𝒱`, then `M` is m-fpd; in particular, for `m = 0`, if every
`M ⊗_A O(V)` is finite projective then `M` is finite projective ([KL II] §2.5, Cor. 2.5.2, p. 41).
*Needs:* *stably-pseudocoherent-module*; *rational-localisation-pseudoflat*;
*pseudocoherent-tate-acyclicity*; AdicSpacesPartIII layer R3 (vector bundles, Kiehl gluing of finite
projective modules, *sheafy-tate-acyclicity-and-kiehl-gluing*); Mathlib `Module.Projective`.

Lean: `Huber.IsStablyPseudoCoherent.isFPD_of_cover` (over a sheafy complete Tate ring and a finite
rational covering of `Spa(A, A⁺)`).

**Checks.**

- *test_locally_free_projective* — a finitely generated module over a strongly noetherian Tate
  ring whose restrictions to a rational cover are free is finite projective.

**Pseudocoherent and fpd sheaves of `O`-modules on adic spaces.** (*pseudocoherent-sheaf*) Let `X`
be an adic space (AdicSpaces layer 5) covered by affinoid opens `Spa(B, B⁺)` with `(B, B⁺)` a sheafy
complete Tate Huber pair, and `F` a sheaf of `O_X`-modules on the analytic (not étale) topology. `F`
is *pseudocoherent* (resp. *fpd*) if `X` has a covering by such affinoid opens `U = Spa(B, B⁺)` with
`F|_U ≅ M̃` for a stably (not merely strictly) pseudocoherent (resp. stably fpd) `B`-module `M` ([KL
II] §2.5, Def. 2.5.3, p. 41); by *rational-localisation-pseudoflat* the condition passes to open
subspaces and to rational subsets of the chosen affinoids. In this layer the spaces `X` are rational
subsets of relative balls `B^N_X` over affinoid perfectoid `X`, which are sousperfectoid and hence
sheafy (AdicSpacesPartIV layer R5). Define `AdicSpace.IsPseudoCoherentSheaf F` and
`AdicSpace.IsFPDSheaf F`; prove `of_module` (for `(A, A⁺)` sheafy and `M` stably pseudocoherent,
`M̃` is pseudocoherent on `Spa(A, A⁺)`), `restrict` (restriction to open subspaces preserves
pseudocoherence), `ker_of_surjective` (the kernel of a surjection of pseudocoherent sheaves is
pseudocoherent: on a fine enough rational cover the surjection is surjective on sections, and
kernels of surjections of stably pseudocoherent modules are stably pseudocoherent),
`coker_of_strict_injective` (the cokernel of an injection `F' → F` of pseudocoherent sheaves is
pseudocoherent provided the image of `F'(U) → F(U)` is closed for every rational `U` in an affinoid
cover; without closedness the cokernel can fail to be pseudocoherent, *test_coker_not*),
the sections property (on a sheafy affinoid the global sections form a stably
pseudocoherent module), `equivModule` (on `Spa(A, A⁺)` sheafy, pseudocoherent sheaves are equivalent
to stably pseudocoherent `A`-modules; *pseudocoherent-kiehl-gluing*) and
`IsFPDSheaf.isPseudoCoherentSheaf`. The carriers are Tau Ceti's `TauCeti.AdicSpace` (with its
structure sheaf) and Mathlib's `SheafOfModules (structureRingSheaf X)`.
`modulePullback` is Mathlib pullback along the ringed-space morphism. The functor
`affinoidModuleSheaf` sheafifies `U ↦ O(U) ⊗_A M`; `affinoidSections` evaluates at the whole
affinoid and transports scalars through `CAff.sectionsEquiv`.
`affinoidModuleSheaf_adjunction` fixes their adjunction, and `affinoidModuleSheaf_rational`
identifies rational restriction and its sections with algebraic scalar extension.
The predicates quantify over covering Tate affinoid charts and isomorphisms to these
associated sheaves; the local fpd bound may vary between charts.
The proposed typed API is `IsPseudoCoherentSheaf.of_module`, `IsPseudoCoherentSheaf.restrict`,
`IsPseudoCoherentSheaf.ker_of_surjective`, `IsPseudoCoherentSheaf.coker_of_strict_injective`,
`IsPseudoCoherentSheaf.isStablyPseudoCoherent_sections`, `IsPseudoCoherentSheaf.equivModule`,
`IsFPDSheaf.of_module`, `IsFPDSheaf.restrict`, `IsFPDSheaf.equivModule`, and
`IsFPDSheaf.isPseudoCoherentSheaf`. The cokernel hypothesis checks closed images on every
rational subchart of a covering, using the natural topology on the target sections. Fargues–Scholze use the notion for the ideal sheaf of a
Zariski closed immersion ([FS] §IV.4.1, Prop. IV.4.19, p. 140). *Needs:*
*stably-pseudocoherent-module*; *rational-localisation-pseudoflat*;
*pseudocoherent-tate-acyclicity*; AdicSpacesPartIII layer R3 (vector bundles; coherent sheaves on
`Spa ℚ_p⟨T⟩`). README only (no Lean declaration).

**Checks.**

- *test_structureSheaf* (degenerate) — on `X = Spa(A, A⁺)` with `(A, A⁺)` sheafy complete Tate,
  `O_X = Ã` is pseudocoherent and fpd.
- *test_vectorBundle* (compatibility) — a vector bundle of AdicSpacesPartIII layer R3 on a sheafy
  Tate affinoid is an fpd pseudocoherent sheaf, and its global sections are the finite projective
  module of layer R3.
- *test_tateAlgebra_ideal* (computation) — for `X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` and `J = (T)`, the
  sheaves `J̃` and `(ℚ_p⟨T⟩/J)~` are pseudocoherent, with `(ℚ_p⟨T⟩/J)~(U) = O(U)/T·O(U)` on
  rational `U`, and they coincide with the coherent sheaves of AdicSpacesPartIII layer R3; the same
  holds for every ideal `J ⊆ ℚ_p⟨T⟩`.
- *test_pushforward_not* (non-example) — for `X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` and the rational open
  immersion `j : U = {|T| ≤ |p|} → X`, the sheaf `j_*O_U` is not pseudocoherent: its global
  sections `O(U) = ℚ_p⟨T/p⟩` are not a finitely generated `ℚ_p⟨T⟩`-module, whereas the global
  sections of a pseudocoherent sheaf on a sheafy affinoid are stably pseudocoherent
  (the sections property of *pseudocoherent-sheaf*). A definition asking
  only that `F` be locally a module tensored with `O` fails this test.
- *test_coker_not* (non-example) — on `X = Spa(A, A°)` with `A = C(ℤ_p, ℚ_p)` (sheafy, stably
  uniform, `|X| = ℤ_p`), the injection `×x : O_X → O_X`, `x` the identity function, has a
  cokernel sheaf supported at `0 ∈ ℤ_p` which is not pseudocoherent: on every rational `U ∋ 0`
  (a clopen neighbourhood) its sections are `C(U, ℚ_p)/x·C(U, ℚ_p)`, which is not Hausdorff for
  its natural topology (check *test_closure_fg_needed*), so no stably pseudocoherent module can
  represent it; the image of `×x` on sections is not closed.

**Checks for the sheaf definitions.** Each label names a Check, to be formalised as an
`example`.

- *modulePullback_identity*, *modulePullback_composition*, *modulePullback_free_rank* —
  identity, composition in contravariant order, and preservation of the free sheaf of rank two.
- *affinoidModuleSheaf_rank_two*, *affinoidModuleSheaf_zero*, *affinoidModuleSheaf_scalar_map* —
  finite free modules give the corresponding free sheaves, the zero module gives zero,
  and multiplication by `a` induces multiplication by its specified global section.
- *affinoidSections_unit*, *affinoidSections_zero*, *affinoidSections_restriction_of_morphism* —
  the structure module recovers `A`, the zero free sheaf gives zero, and morphisms are
  evaluated by their actual component on the whole affinoid.
- *IsPseudoCoherentSheaf_structure*, *IsPseudoCoherentSheaf_empty*,
  *IsPseudoCoherentSheaf_infinite_free* — the structure sheaf qualifies, the empty space
  satisfies the local condition vacuously, and a countably infinite free sheaf on `Spa ℚ₂`
  fails it.
- *IsFPDSheaf_finite_free*, *IsFPDSheaf_empty*, *IsFPDSheaf_infinite_free* — finite rank free
  sheaves have fpd, the empty space satisfies the condition, and the infinite free sheaf
  on `Spa ℚ₂` does not.

**Effective descent of stably pseudocoherent modules along a simple Laurent covering.**
(*simple-laurent-pseudocoherent-descent*) In the situation of *simple-laurent-strict-multiplication*
(`(A, A⁺)` sheafy complete Tate, `f ∈ A`, simple Laurent covering `U₁, U₂` with rings
`B₁, B₂, B₁₂`), prove that `A → B₁ ⊕ B₂` is an effective descent morphism for stably pseudocoherent
modules and for stably fpd modules: every descent datum `(M₁, M₂, ψ)` with `Mᵢ` stably
pseudocoherent (resp. stably fpd) over `Bᵢ` and `ψ : M₁ ⊗_{B₁} B₁₂ ≅ M₂ ⊗_{B₂} B₁₂` comes from the
stably pseudocoherent `A`-module `M := ker(M₁ ⊕ M₂ → M₂ ⊗_{B₂} B₁₂)`, `(x, y) ↦ ψ(x ⊗ 1) − y ⊗ 1`,
and `M ⊗_A Bᵢ ≅ Mᵢ` compatibly with `ψ` ([KL II] §2.5, Lem. 2.5.4, pp. 41–42; the finite-generation
lemma for glueing data is [KL I] §2.7, Lem. 2.7.4, p. 57).
The proposed `simpleLaurent_pseudocoherent_descent` states this for a two-member rational cover, hence
for the simple Laurent cover. It uses `ratLocRestriction` for both maps to the overlap,
with numerator enlargement fixed by `ratLocRestriction_of_subset` and Tau Ceti
`PairOfDefinition.restrictionRingHomOfSubset`. The recovered module is the actual kernel
of the difference map; its scalar-extension isomorphisms send `1 ⊗ (x,y)` to `x` and `y`
and agree with the given overlap isomorphism. The last clause descends each common fpd
bound, including bound zero for finite projective modules.
*Needs:* *stably-pseudocoherent-module*; *simple-laurent-strict-multiplication*;
*simple-laurent-pseudoflat*; *rational-localisation-pseudoflat*; *pseudocoherent-tate-acyclicity*;
AdicSpacesPartIII layer R3 (glueing squares and finite projective descent). README only (no Lean declaration).

**Checks.**

- *test_finite_projective_descent* — finite projective descent data recover the finite projective
  gluing of AdicSpacesPartIII layer R3 on the simple Laurent glueing square.

**Kiehl gluing for pseudocoherent sheaves on sheafy Tate affinoids.**
(*pseudocoherent-kiehl-gluing*) Let `(A, A⁺)` be a sheafy complete Tate Huber pair (in this layer
sousperfectoid, for example a rational subset of a relative ball over an affinoid perfectoid space)
and `X = Spa(A, A⁺)`. Prove: (a) the global sections functor `F ↦ F(X)` is an exact equivalence from
pseudocoherent (resp. fpd) sheaves of `O_X`-modules to stably pseudocoherent (resp. stably fpd)
`A`-modules, with quasi-inverse `M ↦ M̃`; in particular every short exact `0 → F' → F → F'' → 0` of
pseudocoherent sheaves gives an exact `0 → F'(X) → F(X) → F''(X) → 0` of stably pseudocoherent
modules ([KL II] §2.5, Thm. 2.5.5, p. 42); (b) for every morphism of sheafy complete Tate pairs
`(A, A⁺) → (B, B⁺)` inducing an open immersion `Spa(B, B⁺) → Spa(A, A⁺)`, for instance a rational
localisation, base extension is an exact functor from stably pseudocoherent (resp. stably fpd)
`A`-modules to stably pseudocoherent (resp. stably fpd) `B`-modules, `M ⊗_A B = M̃(Spa(B, B⁺))`, and
`A → B` is pseudoflat ([KL II] §2.5, Cor. 2.5.6, p. 43). The exactness half of (b) for a rational
localisation is `Huber.exact_tensor_ratLoc` over a sheafy complete Tate ring and the proposed
`exact_tensor_ratLoc_sousperfectoid` over a sousperfectoid one.
For (a), `IsPseudoCoherentSheaf.equivModule` and `IsFPDSheaf.equivModule` give category
equivalences whose functors are naturally isomorphic to `affinoidSections` and whose
inverses are naturally isomorphic to `affinoidModuleSheaf`.
The proposed `pseudocoherent_kiehl_exact` states injectivity, exactness and surjectivity for the actual
maps on global sections of each short exact sequence of pseudocoherent sheaves. Fargues–Scholze invoke this gluing
in the proof of [FS] §IV.4.1, Prop. IV.4.19, p. 140; the finite projective case is Kiehl's glueing
property of [KL I] §2.7, Thm. 2.7.7, p. 58. *Needs:* *stably-pseudocoherent-module*;
*rational-localisation-pseudoflat*; *pseudocoherent-tate-acyclicity*; *pseudocoherent-sheaf*;
*simple-laurent-pseudocoherent-descent*; AdicSpacesPartIII layer R3.

Lean: `Huber.exact_tensor_ratLoc` (the exactness half of (b) for rational localisations of a sheafy
complete Tate ring, on short exact sequences whose cokernel is stably pseudocoherent); the rest is
README only.

**Checks.**

- *test_kiehl_strongly_noetherian* — for `(A, A⁺)` strongly noetherian Tate, pseudocoherent
  sheaves are the coherent sheaves and (a) is Kiehl's theorem (AdicSpacesPartIII layer R3,
  *tate-kiehl-affinoid*); for finite projective modules it is layer R3's sheafy Tate
  acyclicity and Kiehl gluing (*sheafy-tate-acyclicity-and-kiehl-gluing*,
  *finite-projective-module-acyclicity*).
- *test_ideal_sheaf_application* — in the char-p form of [FS] IV.4.19, the ideal sheaf of an
  affinoid étale `Y` in a relative ball over an affinoid perfectoid space corresponds to a stably
  pseudocoherent ideal of `A⟨T⟩` (*affinoid-etale-zariski-closed-embedding*).

### A3.2 standard étale presentations and the implicit function theorem

**Multivariable Newton–Hensel lemma for restricted power series.**
(*restricted-power-series-newton*) Let `C` be a complete Hausdorff Tate ring with a ring of
definition `C₀` containing a pseudouniformiser `ϖ` (Tau Ceti `Huber.PairOfDefinition`,
`Huber.IsPseudoUniformizer`), so that `C₀` is ϖ-adically complete and `C = C₀[1/ϖ]`. Let
`F = (F₁, …, F_N)` with `Fᵢ ∈ C₀⟨T₁, …, T_N⟩`, the ϖ-adic completion of `C₀[T]`, let `t ∈ C₀^N`,
`J(t) := (∂Fᵢ/∂T_j(t))ᵢⱼ ∈ M_N(C₀)`, and suppose there are `k ≥ 0` and `M ∈ M_N(C₀)` with
`M·J(t) = J(t)·M = ϖᵏ·1` and `F(t) ∈ ϖ^{2k+1}C₀^N`. Prove (a)
`exists_unique_zero_restrictedPowerSeries`: there is exactly one `t* ∈ t + ϖ^{k+1}C₀^N` with
`F(t*) = 0`; (b) `newton_error_and_inverse_bound`: if `F(t) ∈ ϖ^e·C₀^N` with `e ≥ 2k + 1` then
`t* − t ∈ ϖ^{e−k}·C₀^N` (the first Newton step is `t₁ − t = −ϖ^{−k}·M·F(t)`, and the later steps
are smaller), and `J(t*)` is invertible with `ϖᵏJ(t*)^{−1} ∈ M_N(C₀)`; (c) `newton_map`: for every
continuous ring homomorphism `φ : C₀ → C'₀` between rings of definition of two such rings
(equivalently a continuous `φ : C → C'` with `φ(C₀) ⊆ C'₀`), `φ(t*)` is a zero of `φF` in
`φt + φ(ϖ)^{k+1}C'₀^N`, hence the solution attached to `(φF, φt)` by (a); (d) `newton_parameters`:
if `F ∈ C₀⟨S, T⟩^N` and `t ∈ C₀⟨S⟩^N` depend on further variables `S = (S₁, …, S_M)` with the
hypotheses holding in `C₀⟨S⟩` (with `ϖ` as a constant series), then `t* ∈ C₀⟨S⟩^N`; this is (a)
over the Tate ring `C⟨S⟩` with its ring of definition `C₀⟨S⟩` (Tau Ceti
`PairOfDefinition.weighted`), and its proof is that application. Partial derivatives are the
termwise ones (Mathlib `MvPowerSeries.pderiv`, which preserves restricted series); Taylor
expansion uses Hasse derivatives (Mathlib `Polynomial.hasseDeriv`), so the lemma holds in
characteristic `p`. This is the inverse-function input, point (1), of the proof of [H96] §1.7,
Prop. 1.7.1, proof (1), pp. 81–82, with its complete f-adic hypothesis; the quantitative
bounds here are obtained by Newton iteration; [ECD] §6, proof of Prop. 6.4(iv), p. 28,
presupposes a quantitative implicit-function statement of this kind, and [FS] §IV.4.1, proof of
Lem. IV.4.16, p. 139, reduces a similar local statement to congruences modulo `ϖ`, here done by
Newton iteration instead of descent. The polynomial form over a `(t, I)`-adically complete ring,
with Jacobian control and uniqueness up to the stated congruence, is PerfectoidSpaces layer P3's
*approximate-solutions-over-complete-rings* (Gabber–Ramero 5.4.8 and 5.4.14), and the
one-variable case is Mathlib’s `IsAdicComplete.henselianRing`. The case `k = 0` is Tau Ceti’s
`IsAdicComplete.existsUnique_eq_zero_of_isUnit_det`
(`TauCeti/RingTheory/AdicCompletion/Newton.lean`), applied to evaluation of `F` on `C₀` after
Taylor linearisation. The quantitative `ϖ^k` form, error bound (b) and functoriality (c)–(d)
are the content here. *Needs:* Tau Ceti
`IsAdicComplete.existsUnique_eq_zero_of_isUnit_det`, `Huber.PairOfDefinition`,
`Huber.IsPseudoUniformizer`, `Huber.IsTateRing`, `Huber.restrictedMvPowerSeriesCompletion`,
`Huber.weightedEval` (the value `F(t) = weightedEval (RingHom.id C₀) t F`, a `tsum` that converges
for restricted `F` and power-bounded `t`; the Jacobian at a point is `mvPowerSeriesJacobianAt`);
Mathlib `MvPowerSeries.pderiv`, `Polynomial.hasseDeriv`. README only (no Lean declaration).

**Checks.**

- *test_hensel_sqrt* — `N = 1`, `F = T² − a` in `C₀⟨T⟩` over `C = ℚ_p` (`p` odd), `a ∈ ℤ_p^×`,
  `t ∈ ℤ_p` with `t² ≡ a mod p`, `J(t) = 2t` a unit (`k = 0`): `t*` is the Hensel square root of
  `a`, the unique root congruent to `t` modulo `p`.
- *test_hensel_p2* (`p = 2`, the exponent `k` is forced) — over `C = ℚ_2`, `ϖ = 2`, `F = T² − a`
  with `a ∈ ℤ_2^×` and `t = 1`: `J(1) = 2`, so `k = 1` with `M = 1`, and the hypothesis
  `F(1) = 1 − a ∈ 2^{2k+1}ℤ_2 = 8ℤ_2` is the classical condition `a ≡ 1 mod 8`; for `a = 5`,
  `F(1) = −4 ∉ 8ℤ_2`, the hypothesis fails, and indeed `5` is not a square in `ℤ_2`. No division
  by `2` occurs: the Taylor remainder uses Hasse derivatives.
- *test_linear* — `F = T − a` (`N = 1`, `J = 1`, `k = 0`): `t* = a` for every `t ∈ a + ϖC₀`
  (the Jacobian computations are the checks *jacobian_at_linear* and *series_jacobian_linear*).
- *test_frozen_vs_newton* — `ℚ₃`, `ϖ = 3`, `k = 0`, `F = T² − 4`, `t = 1`, `M = 1/2`: the frozen
  iteration `t_{n+1} = t_n − (t_n² − 4)/2` has `e_n := t_n + 2` with `e_{n+1} = e_n(3 − e_n/2)`, so
  `v₃(F(t_n)) = v₃(e_n) = n + 1`, a linear rate; Newton's `t_{n+1} = t_n − (t_n² − 4)/(2t_n)` has
  `e_{n+1} = e_n²/(2(e_n − 2))`, a quadratic rate; both converge to `t* = −2`, the only zero in
  `1 + 3ℤ₃` (the other root `2` is not congruent to `1`); when formalised, the check evaluates `mvPowerSeriesJacobianAt` to 2 at the initial
  point and −4 at the root, and tests the unique restricted-series zero in that residue class.

**Small perturbations of topological generators: automorphisms of `A⟨X⟩` and transport of
presentations.** (*perturbation-of-generators*) Let `(A, A⁺)` be a complete Tate Huber pair with
pseudouniformiser `ϖ` and `A₀` a ring of definition containing `ϖ`; `A⟨X⟩ = A⟨X₁, …, Xₙ⟩` is
`tateSeries n A`, and `A₀⟨X⟩` its ring of definition of series with coefficients in `A₀` (Tau Ceti
`PairOfDefinition.weightedRingOfDefinition`). Prove: (a) `bijective_perturbX`: for
`ε ∈ ϖ·A₀⟨X⟩ⁿ` the continuous `A`-algebra endomorphism `θ_ε` of `A⟨X⟩` with `θ_ε(X) = X + ε(X)` is
an automorphism with continuous inverse, `θ_ε^{−1} = θ_{ε'}` with `ε' ∈ ϖA₀⟨X⟩ⁿ`, and `θ_ε`
preserves `A₀⟨X⟩` and `A⁺⟨X⟩` for every ring of integral elements `A⁺` (the coefficients of `ε` lie
in `ϖA₀`, which consists of topologically nilpotent elements, hence lies in `A⁺`); (b) for a
quotient mapping `π : (A⟨X⟩, A⁺⟨X⟩) → (C, C⁺)` of complete Huber pairs over `(A, A⁺)` (Tau Ceti
`Huber.Pair.quotient`) and `c' ∈ (C⁺)ⁿ` with `c' − π(X) ∈ ϖ·π(A₀⟨X⟩)ⁿ`, the map `π' := π ∘ θ_ε`,
for any lift `ε ∈ ϖA₀⟨X⟩ⁿ` of `c' − π(X)`, is the continuous `A`-algebra map with `π'(X) = c'`;
`π'` is again a quotient mapping, `π'(A₀⟨X⟩) = π(A₀⟨X⟩)` and `π'(A⁺⟨X⟩) = π(A⁺⟨X⟩)` by (a), and
`ker π' = θ_ε^{−1}(ker π)`; (c) if `ker π` is the closure of `(F₁, …, F_r)` then `ker π'` is the
closure of the inverse substitutes `(θ_ε^{−1}(F₁), …, θ_ε^{−1}(F_r))`, where
`θ_ε^{−1}(F) = θ_{ε'}(F) = F(X + ε'(X))` (`perturbX_transport`, for any continuous automorphism
with continuous inverse), and (`tateSeriesJacobian_perturbX`, the chain rule)
`det(∂θ_{ε'}(F)/∂X) = θ_{ε'}(det(∂F/∂X))·det(1 + ∂ε'/∂X)`, the second factor of the form
`1 + ϖe` with `e ∈ A₀⟨X⟩`, a unit congruent to `1` modulo `ϖ`; the forward substitutes
`θ_ε(Fᵢ) = Fᵢ(X + ε(X))` generate the closure of `θ_ε(ker π)`, which is in general not `ker π'`.
Hence a small perturbation of a strong generating system of a quotient pair is again one, and a
presentation transports to `F ∘ θ_ε^{−1}` with Jacobian changed by a unit `≡ 1 mod ϖ`. The
noetherian analogue is point (3) of the proof of [H96] §1.7, Prop. 1.7.1, p. 83 (small
perturbations of topological generators define automorphisms) without the noetherian hypothesis
recorded there (the noetherian case is AdicSpacesPartII layer R0's *etale-local-structure*, and
the module-theoretic statement that families close to a generating family generate is layer R3's
*surjection-small-perturbation*; the non-noetherian automorphism `X ↦ X + ε(X)` of `A⟨X⟩` is the
content here); [ECD] §6, proof of Prop. 6.4(iv), p. 28, identifies close approximations with `Y`
through such comparison automorphisms. *Needs:* *restricted-power-series-newton*; Tau Ceti
`Huber.weightedRestrictedSubring`, `Huber.PairOfDefinition.weightedRingOfDefinition`,
`TauCeti.Huber.existsUnique_continuous_ringHom_completion_weightedRestrictedSubring`,
`Huber.Pair.quotient`, `Huber.PairOfDefinition`.

**Checks.**

- *test_automorphism_square* — `X ↦ X + ϖX²` is an automorphism of `A⟨X⟩`, with inverse
  `X ↦ X − ϖX² + 2ϖ²X³ − ⋯`; the coefficients `−ϖ` and `2ϖ²` fix the signs of the inverse.
- *test_dilation_not* (non-example) — the dilation `X ↦ ϖX`, not of the form `X + ε` with `ε`
  small, is not an automorphism: `g = Σ_{m≥0} ϖᵐXᵐ ∈ A⟨X⟩` has only the candidate preimage
  `Σ Xᵐ`, whose coefficients do not tend to `0`, while `X` itself (the image of `ϖ^{−1}X`) and
  every polynomial lie in the image (when formalised, the check, shared with *test_small_ball_not_product*,
  takes `A = ℚ_p`, `ϖ = p` and a continuous `φ` with `φ(X) = pX`).
- *test_transport_direction* — `A = ℚ₃`, `A₀ = ℤ₃`, `ϖ = 3`, `n = 1`, `π` evaluation at `0`,
  `ker π = (X)`, `c' = 3`, `ε = 3`, so `π'(f) = f(3)`: the inverse substitute
  `θ_ε^{−1}(X) = X − 3` generates `ker π' = (X − 3)`; the forward substitute `θ_ε(X) = X + 3` has
  `π'(X + 3) = 6 ≠ 0` and must be rejected (when formalised, the check evaluates `π ∘ θ` on
  both).

**Standard étale presentations of complete Huber pairs over a complete Tate pair.**
(*standard-etale-presentation*) Let `(A, A⁺)` be a complete Tate Huber pair with pseudouniformiser
`ϖ`, `X = Spa(A, A⁺)`, and `(C, C⁺)` a complete Huber pair over it. A *standard étale
presentation* of `(C, C⁺)` over `(A, A⁺)` carries completeness and Hausdorffness of both rings
for their given additive topologies, and a tuple `(N, F, k, π)` with `N ≥ 0`,
`F = (F₁, …, F_N) ∈ A⁺⟨T₁, …, T_N⟩^N`, `k ≥ 0` and a morphism of Huber pairs
`π : (A⟨T⟩, A⁺⟨T⟩) → (C, C⁺)` over `(A, A⁺)` such that (i) `π` is surjective, `ker π` is the
closure of the ideal `(F₁, …, F_N)`, the topology of `C` is the quotient topology, and `C⁺` is the integral closure of `π(A⁺⟨T⟩)`, so `(C, C⁺)`
is the quotient pair `A⟨T⟩/closure((F))` (Tau Ceti `Huber.Pair.quotient`); (ii) the Jacobian
`J_F := det(∂Fᵢ/∂T_j) ∈ A⁺⟨T⟩` maps to a unit of `C` with `ϖᵏ·π(J_F)^{−1} ∈ C⁺`, the Jacobian
inverse being bounded by `|ϖ|^{−k}`. The associated affinoid `V(F) := Spa(C, C⁺) → B^N_X` is the
*standard étale locus*. A presentation is in *explicit-inverse form* with exponent `k'` if
`N = N' + 1`, `T = (T', S)` and `F = (F', S·J_{F'} − ϖ^{k'})`; then `J_F = J_{F'}²`,
`|J_{F'}| ≥ |ϖ^{k'}|` on `V(F)`, condition (ii) holds with `k = 2k'`, and every presentation can
be put in this form (`withInverse`). Conversely every explicit-inverse system
`explicitInverse A ϖ F' k'` presents its own quotient pair with exponent `2k'`, whatever `F'` is:
the last equation forces `J_{F'}` to be invertible at every point of `V(F)`
(`nonempty_ofExplicitInverse`). It is the form that is perturbed and approximated. The number of equations
equals the number of variables and all variables have weight `1` (the Tate case of Huber's
presentations `A⟨X⟩_{T₁,…,Tₙ}`, AdicSpacesPartII layer R0); coefficients lie in `A⁺`, rescaling by
powers of `ϖ` not changing the ideal; the closure of the ideal is always taken; the plus ring is
always the integral closure of the image; rational subsets of `B^N_X` are absorbed by extra
variables (*standard-presentation-basic-pieces*); no sheafiness is part of the definition ([H96]
§1.7, Prop. 1.7.1, p. 80: `n` equations in `n` variables, unit Jacobian, `X ≅ Spa B/I`; [ECD] §6,
proof of Prop. 6.4(iv), p. 28: the ideal of `Y` in `B^n_X` is generated near `Y` by `n`
functions; the closure in (i) follows [KL I] §2.4, Lem. 2.4.13(a), p. 42). Define the structure
`Huber.StandardEtalePresentation Aplus ϖ Cplus`; provide `jacobian` (`J_F`), `isUnit_jacobian`
(`π(J_F)` a unit of `C` with `ϖᵏπ(J_F)^{−1} ∈ C⁺`), `quotientEquiv` (`(C, C⁺) ≅ Pair.quotient
(A⟨T⟩, A⁺⟨T⟩) (closure of (F))` over `(A, A⁺)`), `withInverse` (the explicit-inverse form
`(N+1, (F, S·J_F − ϖᵏ), 2k, ·)` with the old coordinates sent through `π` and `S` sent to
`ϖᵏπ(J_F)⁻¹`; `withInverse_π_castSucc` and `withInverse_π_last`; its equations are
`explicitInverse A ϖ P.F P.k`), `nonempty_ofExplicitInverse`, `ofRational` (the specified
rational presentation), `nonempty_of_finiteEtale` and `nonempty_ofComposite` (existence of the
presentations in *standard-presentation-basic-pieces* (b)–(c)), `baseChange` (for a morphism of complete Tate pairs
`(A, A⁺) → (A', A'⁺)` the image of `F` presents `C ⊗̂_A A'`; AdicSpacesPartII layer R0, completed
tensor products; its `N` and `k` are unchanged, coefficients are mapped through `A → A'`,
and its coordinate formula identifies coordinates via the left tensor-factor map), `tube`
(the tube rational subset `W ⊆ B^N_X` of *tubular-neighbourhood*) and `perturb` (the isomorphism
attached to a nearby presentation, *standard-presentation-perturbation*). *Needs:* Tau Ceti
`Huber.weightedRestrictedSubring` (the ring `Huber.tateSeries N A` of `Suggested.lean`),
`Huber.restrictedMvPowerSeriesCompletion`, `Huber.Pair`, `Huber.Pair.Hom`, `Huber.Pair.quotient`,
`Huber.IsTateRing`, `Huber.IsPseudoUniformizer`; Mathlib `MvPowerSeries.pderiv`,
`Algebra.PreSubmersivePresentation.jacobian`; AdicSpacesPartII layer R0. Mathlib's root-namespace
`StandardEtalePresentation` is the one-variable algebraic notion `R[X]_g/(f)` with `f` monic; the
structure here has `N` variables, restricted series, the closure of the ideal, the quotient
topology, the integral-closure plus ring and the bound `k`.

For a complete Hausdorff Huber pair `S`, a theorem (README only) identifies the image of
`Huber.tateSeriesPlus n A S.plus` under `(restrictedMvPowerSeriesCompletionEquiv n A).symm` with
`Huber.Pair.polydiscPlus S n`.
Thus `tateSeriesPair n A S` is the coefficient-series presentation of
`Huber.Pair.polydisc S n`; the Check *plus_polydisc* applies this theorem.
The completed coordinates throughout A3 are `Huber.Pair.polydiscVar` from A2, and
*coordinate_completion* records their agreement with `Huber.tateSeries.X`.

Lean: `Huber.tateSeries`, `Huber.tateSeries.X` and `Huber.tateSeriesPlus` (`A⟨T⟩` as Tau Ceti's
restricted series at trivial weights, its variables, and the series with coefficients in `A⁺`), and
`Huber.StandardEtalePresentation` (for a complete Tate base: the pseudouniformiser is a field, `π` is
an `A`-algebra map with `IsQuotientMap`, and the Jacobian is a series `J` equal to `det(∂Fᵢ/∂T_j)`;
completeness of `C` is not a field); the rest is README only.

**Checks.**

- *test_rational* (computation) — for `s₁, …, sₙ, t ∈ A⁺` with `ϖ^c` among the `sᵢ`,
  `(n, (tTᵢ − sᵢ)ᵢ, cn, Tᵢ ↦ sᵢ/t)` is a standard étale presentation of the rational localisation
  `A⟨s/t⟩` with its plus ring; `J = tⁿ` and `ϖ^{cn}t^{−n} ∈ A⟨s/t⟩⁺` because `|t| ≥ |ϖ^c|` on
  `R(s/t)`.
- *inverse_old_equation* — For an old equation Tᵢ² − 5, `withInverse` gives Tᵢ² − 5 in the enlarged coordinate ring, with index `i.castSucc`.
- *inverse_last_equation* — For the one-variable equation T² − 5 and k = 1, `withInverse` gives 2ST − ϖ as its last equation; the scale and the position of S are both fixed.
- *inverse_zero_variables* (degenerate) — an empty equation list has `J_F = 1`; the inverse
  presentation has one variable and equation `S − ϖᵏ` (*inverse_system_zero_variables* for
  `explicitInverse`).
- *rational_equation* — For denominator 1 and numerator ϖ², the `ofRational` quotient map evaluates the selected coordinate to ϖ²; `ofRational_π_X` supplies the general fraction formula.
- *rational_jacobian* — the diagonal Jacobian gives `tⁿ`, and the returned exponent is `cn`.
- *Huber.StandardEtalePresentation.rational_zero_denominator* (degenerate) — `t = 0` gives the zero localisation ring and
  empty adic spectrum; it does not give the identity localisation.
- *base_change_equation* — For the equation Tᵢ − ϖ, the base-changed quotient map evaluates Tᵢ to the image of ϖ through A → A′ → C ⊗̂_A A′.
- *base_change_zero* — For N = 0, the base-changed scalar map is bijective and the base-changed Jacobian is 1.
- *base_change_jacobian* — the Jacobian of the base-changed equations is the image of `J_F`
  under `A → A'`, so the exponent `k` is kept (the quotient coordinate `inl(π(Tᵢ))` in
  `C ⊗̂_A A'` is the coordinate formula of `baseChange`).
- *standard_scale_one* — `StandardEtalePresentation` of (Q₂,ℤ₂) over itself with scale 1 is empty, because its scale field requires a topologically nilpotent unit.
- *jacobian_two_equations* — for equations `T² − a` and `2TS − ϖᵏ` (the proposed
  `explicitInverse A ϖ (T² − a) k`), with rows indexed by equations and columns by `(T,S)`, the
  Jacobian is `[[2T,0],[2S,2T]]`, of determinant `(2T)²`. Appending the inverse equation last
  produces a positive square, not its negative.
- *explicitInverse_quadratic_determinant* — Over Q₂, applying `explicitInverse` to T² − 5 at scale 2 and exponent 1 gives Jacobian 4T².
- *test_zero* (degenerate) — `N = 0`, `F = ()`, `k = 0`, `π = id` presents `(A, A⁺)` itself;
  `J = 1`.
- *test_frobenius_not* (non-example) — over `A = F_p((t^{1/p^∞}))^∧` with `A⁺ = A°` (when formalised,
  over any complete Tate `A` of characteristic `p`), `F = T^p − a` is the equation of no standard
  étale presentation of a nonzero ring, in particular not of `A⟨T⟩/(T^p − a)`:
  `J_F = pT^{p−1} = 0`. A definition asking only for `N` equations in `N` variables fails this
  test.
- *test_artin_schreier* (computation, characteristic `p`) — the Artin–Schreier equation
  `T^p − T − u` (`u ∈ A⁺`) has `J_F = pT^{p−1} − 1 = −1` and is a standard étale presentation
  with `N = 1`, `k = 0` of its quotient pair: the Jacobian condition separates it from the
  Frobenius equation.
- *test_finiteEtale* (compatibility) — the split finite étale algebra
  `A × A = A⟨T⟩/(T² − T)` (with plus ring `A⁺ × A⁺`, the integral closure of `A⁺`) has the
  presentation `(1, T² − T, 0)`: `J_F = 2T − 1` and `(2T − 1)² = 1 + 4(T² − T)`, so the Jacobian is
  its own inverse on the quotient and `k = 0` in every characteristic, including `2`
  (*finite_etale_jacobian* computes `J_F`). The general finite étale case is
  `Huber.StandardEtalePresentation.nonempty_of_finiteEtale`, through a submersive presentation of relative dimension `0` (Mathlib
  `Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`) rescaled into `S⁺`; over a Tate
  ring with a noetherian ring of definition the existence of presentations for rational
  localisations and finite étale algebras is Huber's 1.7.1(ii) (AdicSpacesPartII layer R0,
  *etale-local-structure*).

**`Huber.tateSeries.X`.** The variable `Tᵢ` of `A⟨T₁, …, T_N⟩`. The first and third Checks
are Lean examples.

**Checks.**

- *tateSeries_X_coe* (computation) — as a power series `Tᵢ` is Mathlib's `MvPowerSeries.X i`
  (Lean example, proved).
- *tateSeries_X_no_variable* (degenerate) — for `N = 0` there is no variable `Tᵢ`. README only:
  this holds by type alone, `Fin 0` being empty.
- *tateSeries_X_not_isUnit* (non-example) — over a nonzero `A`, `Tᵢ` is not a unit of `A⟨T⟩`, its
  constant coefficient being `0`; it is invertible only on the torus of
  *torusLocus_unit_coordinates* (Lean example).

**`Huber.tateSeriesPlus`.** The restricted series all of whose coefficients lie in `A⁺`. Each
Check below is a Lean example.

**Checks.**

- *tateSeriesPlus_constant* (computation) — over `(ℚ_p, ℤ_p)` the constant `p` lies in `ℤ_p⟨T⟩`
  (Lean example).
- *tateSeriesPlus_top* (degenerate) — with `A⁺ = A` every series lies in `tateSeriesPlus N A ⊤`
  (Lean example).
- *tateSeriesPlus_inverse_constant* (non-example) — over `(ℚ_p, ℤ_p)` the constant `p⁻¹` lies in
  `ℚ_p⟨T⟩` but not in `ℤ_p⟨T⟩` (Lean example).

**Rational localisations, finite étale algebras and their composites have standard étale
presentations.** (*standard-presentation-basic-pieces*) Let `(A, A⁺)` be a complete Tate Huber
pair with pseudouniformiser `ϖ`. Prove: (a) for `s₁, …, sₙ, t ∈ A⁺` with `ϖ^c ∈ {s₁, …, sₙ}`, the
rational localisation `(A⟨s/t⟩, A⟨s/t⟩⁺)` of `R(s/t)` (Tau Ceti `completionLocalization`) has the
standard étale presentation `(n, (tTᵢ − sᵢ), cn, Tᵢ ↦ sᵢ/t)` ([KL I] §2.4, Lem. 2.4.13(a), p. 42:
the quotient of `A⟨T⟩` by the closure of `(gT − f)`, with plus ring the completed integral closure
of the image of `A⁺[T]`; in Lean `Huber.StandardEtalePresentation.nonempty_ratLocPair`, with the
rational localisation `Huber.ratLocPair`); (b) if `S` is a finite étale `A`-algebra as a ring (Mathlib
`Algebra.Etale A S`, `Module.Finite A S`) with its natural topology and `S⁺` the integral closure
of `A⁺` in `S` (*finite-etale-affinoid-algebra* of layer A1), then `S` is complete and `(S, S⁺)`
has a standard étale presentation (`Huber.StandardEtalePresentation.nonempty_of_finiteEtale`).
A relative dimension-zero submersive presentation supplies polynomial equations (Mathlib
`Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`); scaling generators and equations
into the plus rings proves existence, without choosing generators in the interface; finite étale algebras over perfectoid
rings are perfectoid, so (b) stays inside perfectoid rings ([ECD] §6, Thm. 6.1(i), p. 26); (c) if
`(C, C⁺)` has a standard étale presentation `(N, F, k, π)` over `(A, A⁺)` and `(D, D⁺)` has one
`(M, G, l, ρ)` over `(C, C⁺)`, then `(D, D⁺)` has a standard étale presentation over
`(A, A⁺)`. This assertion specifies the
composite algebra and its plus ring; coefficient lifts and a particular equation list are
not data of the result;
(d) consequently, if `(C, C⁺)` has a standard étale presentation over `(A, A⁺)` then so does
`(O(V), O⁺(V))` for every rational subset `V ⊆ Spa(C, C⁺)`
(from `ofRational` over `C` and (c)), and so does
every composite of rational localisations and finite étale maps, the composites to which [ECD]
§6, proof of Prop. 6.4(ii), p. 28, reduces étale maps. *Needs:* *standard-etale-presentation*; *perturbation-of-generators*;
*finite-etale-affinoid-algebra* (layer A1); AdicSpacesPartII layer R0 (completed tensor
products); Tau Ceti `Huber.PairOfDefinition.rationalEvalHom_surjective`,
`Huber.PairOfDefinition.completionLocalization`, `TauCeti.ValuationSpectrum.mem_iff_forall_vle_one`;
Mathlib `Algebra.Etale`, `Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`,
`Algebra.SubmersivePresentation`, `Module.Finite`.

Lean: `Huber.StandardEtalePresentation.nonempty_ratLocPair` ((a)) and
`Huber.StandardEtalePresentation.nonempty_of_finiteEtale` ((b)); the rest is README only.

**Checks.**

- *test_disc_presentation* — for `(A, A⁺) = (ℚ_p⟨X⟩, ℤ_p⟨X⟩)` and `ϖ = p`, the rational subset
  `{|X| ≤ |p|} = R(X, p / p)` has the presentation `(2, (pT₁ − X, pT₂ − p), 2)` with Jacobian
  `p²` (the case `n = 2`, `c = 1` of *test_rational* and *rational_jacobian*).
- *test_finite_etale_presentation* — the finite étale `ℚ_p⟨X⟩`-algebra
  `ℚ_p⟨X⟩[y]/(y² − 1 − pX)` (`p` odd) has the presentation `(1, (y² − 1 − pX), 0)`, whose
  Jacobian `2y` is a unit.

**Tubular neighbourhoods of standard étale loci: a nonarchimedean implicit function theorem.**
(*tubular-neighbourhood*) Let `(A, A⁺)` be a complete Tate Huber pair with pseudouniformiser `ϖ`
and `A` sousperfectoid (AdicSpacesPartIV layer R5), so that `A⟨T₁, …, T_N⟩` and its rational
localisations are sousperfectoid, hence uniform, and `O⁺(W')` is a ϖ-adically complete ring of
definition of `O(W')` for every rational `W'`; the Newton arguments below use only this
uniformity, but the targets are stated, and used, over sousperfectoid bases. Let
`X = Spa(A, A⁺)`, `e = (e₁, …, e_N) ∈ A⁺⟨T₁, …, T_N⟩^N`, `k ≥ 0` and `m ≥ 2k + 1`, and let
`R ⊆ B^N_X` be a finite intersection of rational subsets `R(g_j/h_j)` with
`g_{j,1}, …, g_{j,r_j}, h_j ∈ A⁺⟨T⟩` and `ϖ^{c_j} ∈ (g_{j,1}, …, g_{j,r_j}, h_j)·A⁺⟨T⟩` for some
`c_j < m − k` (the empty intersection being `B^N_X`), so that `R` is unchanged when a point is
moved by `ϖ^{m−k}·A⁺⟨T⟩` (AdicSpaces layer 3, perturbation invariance; `tubeSet` is the tube in
the whole ball, and `R` enters the proposed Lean statements through the hypothesis on the rational
subset `W`). Let `Δ := det(∂eᵢ/∂T_j) ∈ A⁺⟨T⟩` and
`W := R ∩ {|eᵢ| ≤ |ϖ^m| for all i} ∩ {|ϖᵏ| ≤ |Δ|}`, a rational subset, the *tube* of `e` of
radius `|ϖ|^m`, on which the Jacobian is bounded below by `|ϖᵏ|`. Put
`C := O(W)/closure(e·O(W))` with `C⁺` the integral closure of the image of `O⁺(W)`, and
`V(e) ∩ W := Spa(C, C⁺)`. Prove (a) `tube_product_equiv_sousperfectoid` (its section clause alone
is `exists_section_tube_sousperfectoid`, for a single `R(g/h)`), (b) `tube_product_restrict` and
(c) `tube_quotient_baseChange`: (a) there is a unique isomorphism of complete Huber pairs over
`(A, A⁺)`

```text
Φ : (C⟨u₁, …, u_N⟩, C⁺⟨u⟩) → (O(W), O⁺(W)),   Φ(uᵢ) = ϖ^{−m}eᵢ,
```

such that `Φ` restricted to `C` is a ring section `ρ` of the quotient map `q : O(W) → C` with
`ρ(q(T)) − T ∈ ϖ^{m−k}O⁺(W)^N`; geometrically `W ≅ (V(e) ∩ W) ×_X B^N_X(|ϖ|^m)` with `e`
corresponding to `ϖ^m u` (the section `ρ` is the Newton solution `t*` of `e(t*) = 0` starting
from `t = T`, and the point `T ↦ t*` lies in `W` because `|Δ(t*) − Δ| ≤ |ϖ|^{k+1} < |ϖᵏ| ≤ |Δ|`
and because `R` is stable under the move; the inverse of `Φ` sends `T` to the Newton solution
of `e(τ) = ϖ^m u` over `C⟨u⟩`); (b) the same holds, with `C` replaced by
`C_{W'} := O(W')/closure(e·O(W'))`, for every rational subset `W' ⊆ W` which is the preimage of a
rational subset `V' ⊆ V(e) ∩ W` under the projection `W → V(e) ∩ W` of (a), and for
`W' = W ∩ R'` with `R'` subject to the same condition as `R` (this second case is (a) for the
family `R ∩ R'`, and is covered by `tube_product_equiv_sousperfectoid`); it does not hold for an
arbitrary rational `W' ⊆ W` (*test_small_ball_not_product*, *test_section_fails_off_locus*); (c) for
every rational `W' ⊆ W` the ideal `e·O(W')` is closed (`isWeaklyRegular_tube_sousperfectoid`),
`O(W')/(e) = C_{W'} = C ⊗̂_{O(W)} O(W')`, and `V(e) ∩ W'` is the rational subset of `V(e) ∩ W` cut
out by the same inequalities (for `W' ∩ V(e) = ∅` both sides are the zero ring).
Integrality of `e` as a power series in `T` is essential: the Newton step needs integral Taylor
coefficients, and for `e ∈ O⁺(R)` involving the rational coordinates of `R` the statement fails;
equations with rational coordinates are handled by adjoining those coordinates as variables
(*standard-presentation-basic-pieces* (c)). This is the analytic-algebra replacement of
Fargues–Scholze's local statement that smooth spaces are balls near sections ([FS] §IV.4.1, before
Lem. IV.4.14, p. 137; proof of Lem. IV.4.16, p. 139, which establishes the local product
structure after reduction modulo `ϖ`, here obtained directly by Newton iteration); the
perturbation argument of [ECD] §6, proof of Prop. 6.4(iv), p. 28, is carried out inside such a
tube. *Needs:* *restricted-power-series-newton*; AdicSpacesPartIV layer R5 (sousperfectoid rings,
stably uniform); AdicSpacesPartII layer R0 (completed tensor products, rational localisation,
continuous differentials); Tau Ceti
`TauCeti.ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`,
`TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`,
`TauCeti.Huber.existsUnique_continuous_ringHom_completion_weightedRestrictedSubring`,
`Huber.PairOfDefinition.completionLocalization`, `TauCeti.ValuationSpectrum.mem_iff_forall_vle_one`,
`ValuationSpectrum.rationalSubset`. README only (no Lean declaration).

**Checks.**

- *tube_integral_certificate* — For F = 4T over Q₂, `tubeSet` with k = 0 is empty, while k = 2 gives a nonempty tube; the integral Jacobian bound detects the difference.
- *test_translation* — `N = 1`, `R = B¹_X`, `e = T − a` with `a ∈ A⁺`, `k = 0`, `m = 1`:
  `W = {|T − a| ≤ |ϖ|}` (the check *tube_linear*, for every radius `|ϖ|^m`), `C = A` and `Φ` is
  the translation `u ↦ ϖ^{−1}(T − a)`.
- *test_unit_jacobian_product* — for `R = B^N_X`, `k = 0` and `e` with `Δ ≡ 1 modulo
  (e₁, …, e_N)·A⁺⟨T⟩` (so `|Δ| = 1` on `{|e| ≤ |ϖ|}`), the tube is `W = {|e| ≤ |ϖ|}` and
  `W ≅ V(e) ×_X B^N(|ϖ|)`.
- *test_small_ball_not_product* (non-example for (b) with arbitrary `W'`) — `A = ℚ_p`, `N = 1`,
  `e = T`, `k = 0`, `m = 1`, `W = {|T| ≤ |p|}`, `C = ℚ_p`, and `W' = {|T| ≤ |p|²} ⊆ W`:
  `C_{W'} = ℚ_p`, but `O(W') = ℚ_p⟨T/p²⟩` is not `ℚ_p⟨u⟩` with `u ↦ T/p`, since the image of
  `ℚ_p⟨u⟩` is `ℚ_p⟨p·(T/p²)⟩ ⊊ ℚ_p⟨T/p²⟩`. Writing `v = T/p²`, the series
  `∑ p^n v^n` has no restricted preimage, whereas `v` itself is the image of `p⁻¹u`; equally, with `R = {|T| ≤ |p|^{10}}` (here
  `c = 10 ≥ m − k = 1`) the claim (a) fails for `W = R`.
- *test_section_fails_off_locus* (non-example) — same data, `W' = {|T − p| ≤ |p|²} ⊆ W`: `T` is a
  unit on `W'` (`|T| = |p|` there), so `C_{W'} = 0` while `O(W') ≠ 0`, and no ring section
  `C_{W'} → O(W')` of the quotient map exists; the Newton point `t* = 0` of `e = T` does not lie
  in `W'`.
- *test_integral_coefficients_needed* (non-example) — `A = ℚ_p`, `p` odd, `ϖ = p`, `N = 1`,
  `R = {|T| ≤ |p|}`: `e = (T/p)²` lies in `O⁺(R)` but not in the image of `ℤ_p⟨T⟩`,
  `Δ = 2T/p²`, and for `k = 0`, `m = 2` the set `W = {|T| = |p|²}` is a nonempty rational subset on
  which `e` is a unit, so `C = 0` while `O(W) ≠ 0` and no isomorphism `C⟨u⟩ ≅ O(W)` exists
  (when formalised, the check presents `W` as `R({T², p²T, p⁴}/p²T)` and records that `T` is a unit of the
  nonzero ring `O(W)`).

The proposed theorem `tube_product_restrict` applies to the product isomorphism `Φ` and a rational
localisation `C → C'`. Its numerators in `O(W)` are exactly the images under the coefficient
section `C → O(W)`. It produces `C'⟨u⟩ ≅ O(W')`, commuting with coefficients and labelled
coordinates and preserving plus rings. The proposed theorem `tube_quotient_baseChange` allows any
rational inclusion `W' ⊆ W` inside the tube. It states closedness of both equation ideals,
identifies their images under `ratLocRestriction`, and identifies the completed tensor
quotient with `O(W')/(e)`, including the plus ring. Its formula on pure tensors fixes the
comparison map. Together with rational base change, these statements identify the
restricted zero locus and its quotient pair.

**Stability of standard étale presentations under perturbation.**
(*standard-presentation-perturbation*) Let `(N, F, 2k, π)` be a standard étale presentation of
`(C, C⁺)` in explicit-inverse form with exponent `k`, `F = (F', S·J_{F'} − ϖᵏ)`, over a complete
Tate pair `(A, A⁺)` with `A` sousperfectoid (as in *tubular-neighbourhood*: the argument uses the
uniformity of the rational localisations of the Tate algebras over `A`), and put
`m₀ := 4k + 2`. For every
`G ∈ A⁺⟨T⟩^N` with `G − F ∈ ϖ^{m₀}A⁺⟨T⟩^N` coefficientwise, prove: (a) the quotient pair
`(C_G, C_G⁺) := A⟨T⟩/closure(G)` has the standard étale presentation `(N, G, 2k, π_G)`, the
Jacobian of `G` being invertible on `V(G)` with inverse bounded by `|ϖ|^{−2k}`; (b) `V(G)` and
`V(F)` both lie in the tube `W` of `F` with Jacobian exponent `2k` and radius `|ϖ|^{4k+1}`, and
there is a unique isomorphism of complete Huber pairs `α_{F,G} : (C, C⁺) → (C_G, C_G⁺)` over
`(A, A⁺)` with `α_{F,G}(π(T)) − π_G(T) ∈ ϖ^{m₀−2k}(C_G⁺)^N`, and it is already the only continuous
`A`-algebra map `C → C_G` with this congruence; (c)
if `G = (G', S·J_{G'} − ϖᵏ)` is itself in
explicit-inverse form with exponent `k` (which is the case when `G' − F' ∈ ϖ^{m₀}A⁺⟨T'⟩^{N−1}` and
the last equation is rebuilt from `G'`), then `α_{G,F}` is defined and `α_{G,F} = α_{F,G}^{−1}`, the
comparison maps being mutually inverse on the permitted tube with no further shrinking,
`α_{G,H}∘α_{F,G} = α_{F,H}` whenever all three are defined, and `α` is compatible with base change
along morphisms of complete Tate pairs, all by the uniqueness in (b); (d) plus rings correspond,
`α(C⁺) = C_G⁺`. In the proposed Lean form, for `F = P.withInverse.F` the explicit-inverse form of
a presentation `P`, `α_{F,G}` is `StandardEtalePresentation.perturb`, and (a), (b) and (d), with the
uniqueness, are its specification over a sousperfectoid base; a perturbed system that is itself in
explicit-inverse form presents its quotient pair by `nonempty_ofExplicitInverse`.
The inverse is characterised by the reverse coordinate congruence: every continuous reverse
comparison satisfying it is that inverse. The composite
with any continuous, plus-preserving nearby comparison `G → H` is the chosen comparison
`F → H`. Taking the reverse or intermediate comparison supplied by `perturb` on an
explicit-inverse system gives `α_{G,F} = α_{F,G}⁻¹` and the cocycle identity without shrinking.
The base-change square on rings commutes for
compatible presentations over sousperfectoid source and target bases, fixing the maps
on coefficients and labelled coordinates; the coordinate formula of `baseChange` supplies these
equations for completed base change. Hence
`Spa(C_G, C_G⁺) ≅ Spa(C, C⁺)` over `X`, and every property of `V(F)` over `X` (étale,
sousperfectoid, perfectoid) holds for `V(G)`. If `A` has a noetherian ring of definition this
agrees with Huber's 1.7.2 (AdicSpacesPartII layer R0, *etale-presentation-perturbation*; the
closure-of-the-ideal form over a non-noetherian base is the content here) ([ECD] §6,
proof of Prop. 6.4(iv), p. 28: slightly perturbed equations still define an affinoid
sousperfectoid space étale over `X`, and close approximations are isomorphic to `Y`, here through
`α_{F,G}`; [H96] §1.7, Cor. 1.7.2(i), p. 85, gives neighbourhood-wise perturbation
stability for Huber’s affinoid rings; the explicit exponent here is additional). *Needs:* *standard-etale-presentation*;
*perturbation-of-generators*; *tubular-neighbourhood*; AdicSpacesPartII layer R0; Tau Ceti
`TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`,
`TauCeti.ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`. README only (no Lean declaration).

**Checks.**

- *test_perturb_linear_identity* — `F = (T − a, S − 1)` with `a ∈ A⁺` (explicit-inverse form with
  `k = 0`) and `G = (T − a', S − 1)` with `a − a' ∈ ϖ²A⁺`: `C = C_G = A` and `α_{F,G}` is the
  identity of `A`; its coordinate error `α(π(T)) − π_G(T) = a − a'` is not zero and uses the full
  allowance `ϖ^{m₀−2k} = ϖ²` (when formalised: for any presentation with an equation `T − a`).
- *perturb_zero* (degenerate) — `G = F` gives `α_{F,F} = quotientEquiv⁻¹`, the identification of
  `C` with its own quotient presentation.
- *perturb_plus* — For Fᵢ = Tᵢ² − Tᵢ and Gᵢ = (Tᵢ − δ)² − (Tᵢ − δ), where δ = ϖ^(4k+2), the perturbation equivalence sends the old idempotent to the integral idempotent Tᵢ − δ and excludes its complement over a nonzero target.
- *perturb_coordinate* — For the same shifted idempotent equation, the coordinate error is −δ and differs from 1 − 2Tᵢ + δ, the error obtained by exchanging the two roots.
- *test_perturb_rational* — perturbing `s, t` in `(tT − s)` inside `ϖ^{m₀}` does not change
  `R(s/t)` (Tau Ceti `exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`), consistent with (b).

**Standard étale loci over sousperfectoid bases are sousperfectoid affinoids.**
(*standard-etale-locus-sousperfectoid*) Let `(A, A⁺)` be a complete Tate Huber pair with `A`
sousperfectoid (AdicSpacesPartIV layer R5; for instance perfectoid, or a rational localisation of
`A'⟨T⟩` with `A'` perfectoid) and `(N, F, k, π)` a standard étale presentation of `(C, C⁺)` over
`(A, A⁺)`. Prove that `C` is sousperfectoid (`StandardEtalePresentation.isSousperfectoid`): if
`W` is the tube of `F` (*tubular-neighbourhood*),
`ρ : C → O(W)` the section and `q : O(W) → C` the quotient, so that `C` is a `C`-linear direct
summand of the sousperfectoid `O(W)`, and `(P̃, ι, σ)` is a perfectoid frame of `O(W)`, then
`(P̃, ι∘ρ, q∘σ)` is a perfectoid frame of `C`. Consequently `(C, C⁺)` is sheafy and stably
uniform, `Spa(C, C⁺)` is a sousperfectoid affinoid adic space (AdicSpacesPartIV layer R5,
sousperfectoid sheafy, stably uniform, sousperfectoid adic space), and for every rational
`U ⊆ Spa(C, C⁺)` the ring `O(U)` is sousperfectoid with a standard étale presentation over
`(A, A⁺)` (*standard-presentation-basic-pieces* (d)). This is the étale case of the
sousperfectoid clause of [FS] §IV.4.1, Prop. IV.4.17, p. 139 (vanishing loci of functions with
independent differentials are sous-perfectoid spaces smooth over `X`), using the stability
properties of sous-perfectoid rings of [FS] §IV.4.1, p. 135. Whenever the locus is already known
to be étale over `Spa(A, A⁺)` — in characteristic `p` by *jacobian-criterion-char-p* — its
sousperfectoidness is AdicSpacesPartIV layer R5's *sousperfectoid-etale-stability*; the direct
tube argument here is valid in every characteristic. *Needs:*
*standard-etale-presentation*; *standard-presentation-basic-pieces*; *tubular-neighbourhood*;
AdicSpacesPartIV layer R5 (sousperfectoid rings, sheafiness, stable uniformity, frames, adic
spaces). README only (no Lean declaration).

**Checks.**

- *test_field_trivial* — `A = K` a perfectoid field, `F = T` (`N = 1`): `C = K`, sousperfectoid
  trivially.
- *test_field_quadratic* — `F = T² − a` with `a ∈ (K⁺)ˣ` and residue characteristic `p ≠ 2`: `C` is a finite étale
  `K`-algebra, `J = 2T` a unit of `C` with `k = 0`. For residue characteristic `p = 2` and `char K = 0`, the same `F` is a presentation
  only with `k ≥ 1` such that `|ϖ|^k ≤ |2|`, since `ϖᵏ/(2T) ∈ C⁺` requires it; `k = 0` is
  rejected (check *test_field_quadratic_p2*). In characteristic two its derivative is zero, so no exponent works
  (the check *characteristic_two_jacobian* evaluates the Jacobian `tateSeriesJacobian` on this
  restricted-series equation).

**The equations of a standard étale locus form a regular sequence with closed ideal on its tube.**
(*fs-iv-4-13-regular-sequence*) In the situation of *tubular-neighbourhood* (`(A, A⁺)` complete
Tate with `A` sousperfectoid, `e ∈ A⁺⟨T⟩^N`, tube `W` of `e` in `B^N_X`), prove for every rational
subset `W' ⊆ W` (`isWeaklyRegular_tube_sousperfectoid`): (a)
`e₁, …, e_N` is a weakly regular sequence on `O(W')` (Mathlib
`RingTheory.Sequence.IsWeaklyRegular`) and the Koszul complex `K(e; O(W'))` is a finite free
resolution of `O(W')/(e)`; (b) the ideal `e·O(W')` is closed and `O(W')/(e) ≅ O(V(e) ∩ W')`; (c)
`(e)/(e)²` is a free `O(V(e) ∩ W')`-module with basis the classes of the `eᵢ`; (d) consequently
`O(W)/(e)` is a stably N-fpd, hence stably pseudocoherent, `O(W)`-module and, for `N ≥ 1`, the ideal `(e)·O(W)`
is stably (N−1)-fpd; for `N = 0` that ideal is the zero module. The proposed Lean form states (a)–(d)
for every rational `W' ⊆ W` except the Koszul complex of (a), which has no Mathlib carrier at the
pin (the stably `N`-fpd clause is its consequence). This is the étale case of [FS]
§IV.4.1, Lem. IV.4.13, p. 137 (the coordinates of an étale map to a relative ball over a
sous-perfectoid base are regular with closed ideal), whose printed proof uses the spreading of
étale maps, a diamond-level input replaced here by the tube theorem. *Needs:* *koszul-regular-sequence-fpd*;
*stably-pseudocoherent-module*; *tubular-neighbourhood*; Mathlib
`RingTheory.Sequence.IsWeaklyRegular`. README only (no Lean declaration).

**Checks.**

- *test_linear_regular* — `N = 1`, `e = T − a` on `B¹_X`: `T − a` is a non-zero-divisor with
  closed ideal on every rational subset of `{|T − a| ≤ |ϖ|}`, and the quotient is `A`-restricted:
  `O(W')/(T − a) = O(W' ∩ {T = a})`.

### A3.3 the Fargues–Scholze specialisations by analytic algebra

The étale specialisations of [FS] §IV.4.1, pp. 135–141, are reconstructed by analytic algebra.
The order is: the tube theorem gives regular sequences and finite projective dimension; the
characteristic-`p` Jacobian criterion supplies the étale parts of IV.4.15 and IV.4.17;
pseudocoherent gluing and the integral cut-off then give the closed-image and conormal statements
used in IV.4.19. The arguments of IV.4.14, IV.4.16 and IV.4.18 involving diamonds are not inputs.
The specialisations are exactly those [ECD] 6.4(iv) uses: étale (relative dimension `0`) loci and
closed immersions of affinoid étale perfectoid spaces into rational subsets of relative balls over
affinoid perfectoid bases; the smooth cases over general sousperfectoid bases are outside this
construction.

**A perfectoid Tate ring of characteristic `p` is an algebra over a perfectoid field and a
completed colimit of `p`-finite algebras.** (*char-p-perfectoid-base-field*) Let `(R, R⁺)` be a
perfectoid Tate pair of characteristic `p` (PerfectoidSpaces layer P1: `R` a perfect complete
Tate ring) and `ϖ ∈ R⁺` a pseudouniformiser (Tau Ceti `Huber.IsPseudoUniformizer`); no base
field is assumed, it is constructed. The compatible roots `ϖ^{1/pⁿ}` of the given `ϖ`, each again
a pseudouniformiser, are `exists_pow_roots_pseudoUniformizer_charP`. Let `K := F_p((t^{1/p^∞}))^∧` be the `t`-adic completion of
the perfection of `F_p((t))`, a perfectoid field (PerfectoidSpaces layer P1). Prove: (a) there is
a unique continuous ring homomorphism `K → R` with `t^{1/pⁿ} ↦ ϖ^{1/pⁿ}`, the unique `pⁿ`-th
roots in the perfect ring `R`; it is injective when `R ≠ 0` and maps `K° = F_p[[t^{1/p^∞}]]^∧`
into `R⁺`, so `(R, R⁺)` is a perfectoid affinoid `K`-algebra with `R⁺` a `K°`-algebra; (b)
consequently `(R, R⁺)` is the completion of a filtered colimit of `p`-finite perfectoid affinoid
`K`-algebras `(R_α, R_α⁺)`, each the completed perfection of a reduced affinoid `K`-algebra
`(S_α, S_α⁺)` of topologically finite type ([PS] §6, Lem. 6.13(i), p. 37, under the hypothesis
supplied by (a); `p`-finite is [PS] §6, Def. 6.9, p. 35; PerfectoidSpaces layer P2, completed
direct limits of `p`-finite affinoids), and `R⁺/ϖ^M = colim_α colim_r S_α^{+,1/p^r}/ϖ^M` for
every `M`, so finitely many elements of `R⁺` are approximated modulo `ϖ^M` by elements of one
`S_α^{1/p^r} ≅ S_α`, again a reduced `K`-affinoid algebra of topologically finite type, hence
strongly noetherian. *Needs:* PerfectoidSpaces layers P1 and P2; Mathlib `PerfectRing`,
`frobenius`; Tau Ceti `Huber.IsPseudoUniformizer`.

**Checks.**

- *test_base_field_identity* — `R = K` itself: the map is the identity.
- *test_perfectoid_disc_pfinite* — `R = K⟨T^{1/p^∞}⟩` is `p`-finite, the completed perfection of
  `K⟨T⟩`. The inclusion has the Gauss topology, roots of integral elements are dense in the
  integral subring, and each positive root `T^{1/pⁿ}` lies outside the original disc algebra.

**Jacobian criterion over characteristic-`p` perfectoid bases.** (*jacobian-criterion-char-p*)
Let `(A, A⁺)` be a perfectoid Tate pair of characteristic `p`, `X = Spa(A, A⁺)`, and
`(B, B⁺) := (O(Q), O⁺(Q))` for a rational subset `Q ⊆ B^m_X` (`m ≥ 0`; `m = 0` and `Q = X` give
`(B, B⁺) = (A, A⁺)`; `B` is sousperfectoid, AdicSpacesPartIV layer R5). Let `(N, F, k, π)` be a
standard étale presentation of `(C, C⁺)` over `(B, B⁺)`, put in explicit-inverse form first.
Prove: (a) `Spa(C, C⁺) → Spa(B, B⁺)` is étale in the local-description sense
(*etale-morphisms-local-description-and-comparison* of layer A1: every point has an open
neighbourhood on which the map factors as an open immersion, a finite étale morphism and an open
immersion); (b) if `m = 0`, then `C` is a perfectoid Tate ring (`C` is perfect), `Spa(C, C⁺)` is
an affinoid perfectoid space and `Spa(C, C⁺) → X` is étale in the sense of [ECD] Def. 6.2
(PerfectoidSpaces layer P3); the ring part is that `C` is perfect and a perfectoid Tate ring
(PerfectoidSpaces' `Perfectoid.IsPerfectoidTateRing`); (c) a morphism `g : U → V` over `X` between rational subsets
`U ⊆ B^n_X` and `V ⊆ B^n_X` such that `det(∂gᵢ/∂T_j)` is a unit of `O(U)` with bounded inverse is
étale in the local-description sense (the étale case of [FS] §IV.4.1, Prop. IV.4.15(ii), p. 138:
an isomorphism on differentials gives étaleness; Prop. IV.4.17, p. 139: vanishing loci with
independent differentials, étale when `r = n`). The proof approximates the finitely many
coefficients by a strongly noetherian `K`-affinoid algebra (*char-p-perfectoid-base-field*), uses
Huber's noetherian theory (AdicSpacesPartII layer R0: étale local structure, the finite étale
embedding of an étale affinoid, the local open–finite étale factorisation), base changes along
the sousperfectoid `Spa(B)` (AdicSpacesPartIV layer R5, sousperfectoid étale base change) and
perturbs back (*standard-presentation-perturbation*) — the strategy of [PS] §7, Prop. 7.7, p. 41
(in characteristic `p` étale maps of perfectoid spaces are locally base changes of étale maps of
noetherian adic spaces); [ECD] §6, proof of Prop. 6.4(iv), p. 28, uses that the perturbed locus is
étale over `X` and thus perfectoid. No diamond, no [ECD] 11.30 or 15.6 and no v-descent is used:
the printed proofs of IV.4.15 and IV.4.17 rest on [ECD] Lem. 12.17 (the deformation step, [FS]
§IV.4.1, proof of Prop. IV.4.15, p. 138), on Lem. IV.4.14 and on Lem. IV.4.16 (descent to
strictly totally disconnected bases). *Needs:* *standard-etale-presentation*;
*standard-presentation-perturbation*; *standard-etale-locus-sousperfectoid*;
*char-p-perfectoid-base-field*; *etale-morphisms-local-description-and-comparison* (layer A1);
AdicSpacesPartII layer R0 (Huber 1.7.1, étale local structure, completed tensor products);
AdicSpacesPartIV layer R5 (sousperfectoid étale base change, sheafiness);
PerfectoidSpaces layers P1–P3; Tau
Ceti `TauCeti.ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`; Mathlib
`PerfectRing`. README only (no Lean declaration).

**Checks.**

- *test_rational_finite_etale_pieces* — rational subsets of `X` and finite étale algebras over
  rational subsets (*standard-presentation-basic-pieces*) give étale affinoid perfectoid spaces,
  as they must ([ECD] §3, Thm. 3.18 (rational subsets) and §6, Thm. 6.1(i) (finite étale
  algebras)).
- *test_frobenius_locus_not_etale* (non-example) — `F = T^p − a` has `J_F = 0` and is not a
  standard étale presentation; when the quotient is nonzero, its locus `Spa(A⟨T⟩/(T^p − a))` is not étale over `X`.

**Local presentations of a closed subspace from integral cut-offs and graphs; pseudocoherence of
its ideal.** (*integral-cutoff-graph-presentation*) Let `(A, A⁺)` be a complete Tate Huber pair
with `A` sousperfectoid, so that rational subsets of relative balls are sheafy, `X = Spa(A, A⁺)`,
`R ⊆ B^N_X` a rational subset with coordinates `T₁, …, T_N`, and `(C, C⁺)` a complete Huber pair
with a standard étale presentation `(n, F, k, π_v)` over `(A, A⁺)` in variables `v₁, …, vₙ`. Let
`g : Spa(C, C⁺) → R` be a morphism over `X`, i.e. a continuous `A`-algebra map `g* : O(R) → C`
with `g*(O⁺(R)) ⊆ C⁺`. Suppose given `w₁, …, wₙ ∈ O(R)`, not necessarily power-bounded, monic
polynomials `P_l(Z) ∈ O⁺(R)[Z]` and `M ≥ 1` such that (i) `c_l := g*(w_l)` satisfies
`c_l − π_v(v_l) ∈ ϖ·π_v(A₀⟨v⟩)` for a ring of definition `A₀ ⊆ A⁺`, and (ii)
`g*(P_l(w_l)) ∈ ϖ^{M+1}C⁺` for all `l`. Put `R'' := R ∩ ⋂_l {|P_l(w_l)| ≤ |ϖ^M|}` and
`Q_l := R ∩ {|P_l(w_l)| ≥ |ϖ^M|}`. Prove: (a) `{R''} ∪ {Q_l}` is a finite rational covering of
`R`, `g` factors through `R''` and `g⁻¹(Q_l) = ∅`; (b) `w_l ∈ O⁺(R'')` for all `l` — a monic
polynomial with bounded coefficients is large where its argument is; (c) `g* : O(R'') → C` is a
quotient mapping of complete Huber pairs, and for every rational `R''' ⊆ R''` the induced
`O(R''') → O(g⁻¹R''') = C ⊗̂_{O(R'')} O(R''')` is again one; (d) `C` is a stably pseudocoherent
`O(R'')`-module and the kernel of `O(R'') → C` is a stably pseudocoherent ideal: the graph of `g`
in `R'' ×_X Spa(C, C⁺)`, cut out by the `N` equations `Tᵢ − g*(Tᵢ)` with `g*(T) ∈ (C⁺)^N` and
identity Jacobian, is handled by the tube theorem over the sousperfectoid base `C`
(*standard-etale-locus-sousperfectoid*), and pseudocoherence descends along an algebra that is
itself pseudocoherent as a module ([KL II] §1.1, Rem. 1.1.13, p. 14). The graph of `w` alone does
not suffice: `O(R'')/closure(F(w))` is an algebra retracting onto `C` through `v ↦ w`, but it is
larger than `C` when `n < N`, as for `n = 0`, `C = A` and `g` a section of `R → X`, where
`F(w)` is empty; (e) hence the ideal sheaf
`I := ker(O_R → g_*O_{Spa C})` is a pseudocoherent sheaf on `R`, equal to `O_R` on each `Q_l`.
The integral cut-off, possible because plus rings of rational localisations are completed integral
closures ([KL I] §2.4, Lem. 2.4.13(a), p. 42), removes the boundary specialisations (points with
`|w| = 1⁺`) that otherwise prevent the image of `Y` from being closed; the graph argument replaces
Fargues–Scholze's local identification of an étale closed immersion ([FS] §IV.4.1, proof
of Prop. IV.4.19, p. 140). Quotient mappings of Huber pairs are `Pair.Hom.IsQuotientMapping`:
surjective and open, with target plus ring the integral closure of the image of the source plus
ring (Huber's quotient mappings of affinoid rings; between complete Tate rings openness follows
from surjectivity by the open mapping theorem, and the notion is the affinoid condition of [FS]
§IV.4.1, Prop. IV.4.19(i), p. 140). *Needs:* *pseudocoherent-module*; *stably-pseudocoherent-module*;
*pseudocoherent-sheaf*; *pseudocoherent-kiehl-gluing*; *perturbation-of-generators*;
*standard-etale-presentation*; *standard-presentation-basic-pieces*; *tubular-neighbourhood*;
*fs-iv-4-13-regular-sequence*; AdicSpacesPartII layer R0; AdicSpacesPartIV layer R5; Tau Ceti
`TauCeti.ValuationSpectrum.mem_iff_forall_vle_one`, `ValuationSpectrum.rationalSubset`.

**Checks.**

- *test_identity_cutoff* (degenerate) — `N = n = 0`, `R = X`, `C = A` and `g = id`:
  the presentation and the list of cutoff equations are empty, `R'' = R`, the identity is a
  quotient mapping and the ideal is `0`.
  A positive-dimensional ball `C = A⟨T₁,…,T_N⟩` is not étale over nonzero `A` for `N > 0`,
  so it cannot supply the standard étale presentation required by this theorem.
- *test_surjective_application* — in *fs-iv-4-19-zariski-closed-char-p*: `g* : O(R) → C`
  surjective, `w` lifts of the presentation variables, `P_l` monic equations of `π_v(v_l)` over
  the image of `O⁺(R)`, over which `C⁺` is integral.
- *quotient_identity*, *quotient_top*, *quotient_ideal* — the identity of a pair, the quotient by
  the unit ideal (zero ring, full plus ring) and every Tau Ceti quotient pair `Pair.quotientHom`
  are quotient mappings; the last is the agreement with Tau Ceti's `Huber.Pair.quotient`.
- *quotient_plus_too_big* (non-example) — the identity of a field `K` from `(K, K⁺₁)` to
  `(K, K⁺₂)` with `K⁺₁ ⊊ K⁺₂` is surjective and open but not a quotient mapping, since a ring of
  integral elements is integrally closed. The identity of `ℤ_p` from the discrete to the `p`-adic
  topology is continuous and bijective but not open, which the openness clause excludes.
  When formalised, the check specifies both topologies explicitly on the identity function and asserts
  continuity, bijectivity and failure of `IsOpenMap` for every prime `p`.

**Zariski closed immersions of affinoid étale perfectoid spaces into relative balls.**
(*fs-iv-4-19-zariski-closed-char-p*) Let `(A, A⁺)` be a perfectoid Tate pair, `X = Spa(A, A⁺)`,
`Y' ⊆ B^N_X` an open subspace which is a finite union of rational subsets (for instance a
rational subset or `B^N_X` itself; `Y'` is sousperfectoid and smooth over `X`), `Y` an affinoid
perfectoid space with an étale morphism `Y → X` ([ECD] Def. 6.2), and `g : Y → Y'` a morphism
over `X`. Prove that the following are equivalent: (i) `Y'` is covered by rational subsets
`V' ⊆ B^N_X` such that `V := g⁻¹(V')` is affinoid and `O(V') → O(V)` is a quotient mapping
(surjective, `O⁺(V)` the integral closure of the image of `O⁺(V')`); (ii) for every rational
subset `V' ⊆ Y'` the same holds ([FS] §IV.4.1, Prop. IV.4.19(i), p. 140; the passage (i) ⇒ (ii)
is Kedlaya–Liu's gluing, proof of Prop. IV.4.19, p. 140). If they hold, `g` is a Zariski closed
immersion ([FS] §IV.4.1, Def. IV.4.20, p. 141), and: (a) the ideal sheaf
`I_{Y⊂Y'} := ker(O_{Y'} → g_*O_Y)` is pseudocoherent ([FS] §IV.4.1, Prop. IV.4.19, p. 140); (b)
for every rational `V' ⊆ Y'`, `I(V')` is a stably pseudocoherent `O(V')`-module and
`O(V')/I(V') ≅ O(g⁻¹V')`, the *affine quotient description*, with plus ring the integral closure of
the image of `O⁺(V')`, the *plus-ring description*. The statement holds for
perfectoid `(A, A⁺)` of any characteristic; characteristic `p` is the case used in A3.5.
Fargues–Scholze prove IV.4.19 for smooth maps of sous-perfectoid spaces using the
diamond-dependent IV.4.15 and IV.4.17 and Kedlaya–Liu's gluing; here only the gluing is used,
together with *integral-cutoff-graph-presentation*. *Needs:* *pseudocoherent-sheaf*;
*pseudocoherent-kiehl-gluing*; *standard-etale-presentation*; *integral-cutoff-graph-presentation*;
AdicSpacesPartIV layer R5; PerfectoidSpaces layer P3
(étale morphisms of perfectoid spaces); Tau Ceti `TauCeti.ValuationSpectrum.mem_iff_forall_vle_one`,
`ValuationSpectrum.rationalSubset`.

The proposed Lean form states the ring-level equivalence on each
rational chart of the ball, and a companion gives every rational
restriction its quotient map, stably pseudocoherent kernel and homeomorphic quotient-ring
comparison; the quotient-map predicate includes the integral-closure condition on plus rings.
These are the affine assertions of [FS] IV.4.19, printed p. 140 (PDF page 140). README only (no Lean declaration).

**Checks.**

- *test_rational_closed* — `Y = X(s/t)` with `sᵢ, t ∈ A⁺` and `g : Y → B^n_X`, `Tᵢ ↦ sᵢ/t`: (i)
  holds with the single member `V' = B^n_X`, since `A⟨T⟩ → A⟨s/t⟩` is surjective with kernel the
  closure of `(tTᵢ − sᵢ)` and plus ring the completed integral closure ([KL I] §2.4,
  Lem. 2.4.13(a)).

**Affinoid étale perfectoid spaces have standard rational coverings by standard étale pieces.**
(*etale-standard-piece-cover*) Let `X = Spa(A, A⁺)` be an affinoid perfectoid space and
`f : Y = Spa(B, B⁺) → X` an étale morphism ([ECD] §6, Def. 6.2(ii), p. 26: locally an open
immersion into a space finite étale over an open of `X`) with `Y` affinoid perfectoid. Prove that
there are `σ₁, …, σ_m ∈ B` generating the unit ideal such that every
`V_j := Y(σ/σ_j) = {|σᵢ| ≤ |σ_j| for all i}` is `X`-isomorphic to a rational subset of an affinoid
perfectoid space `W_j` finite étale over a rational subset `U_j ⊆ X` (`O(W_j)` finite étale over
`O(U_j)`, `O⁺(W_j)` the integral closure of `O⁺(U_j)`); consequently each `(O(V_j), O⁺(V_j))` has
a standard étale presentation over `(A, A⁺)` (*standard-presentation-basic-pieces*), and so does
every rational subset of `Y` contained in some `V_j` ([ECD] §6, proof of Prop. 6.4(ii), p. 28:
the reduction of qcqs étale maps to composites of rational subsets and finite étale maps; remark
after Def. 6.2, p. 26: composites and base changes of (finite) étale maps are (finite) étale).
*Needs:* *standard-presentation-basic-pieces*; *finite-etale-affinoid-algebra* (layer A1);
PerfectoidSpaces layer P3; Tau Ceti
`TauCeti.ValuationSpectrum.exists_span_eq_top_forall_rationalSubset_subset_of_isTateRing`,
`ValuationSpectrum.rationalSubset`.

The proposed Lean form supplies a finite unit-ideal
family and, for each standard rational member, the rational–finite étale–rational
factorization over the base, together with a standard presentation. Further rational
restriction uses (d) of *standard-presentation-basic-pieces*. README only (no Lean declaration).

**Checks.**

- *test_rational_one_piece* — `Y = X(s/t)`: one piece, `V₁ = Y`.
- *test_disjoint_union_idempotent* — `Y = X' ⊔ X''` a disjoint union of two rational subsets:
  `σ = (e, 1 − e)` with `e` the idempotent.

### A3.4 the closed embedding of an affinoid étale object

**Local plus-generators are approximated by elements integral over global plus elements and
ratios.** (*integral-approximation-of-generators*) Let `(B, B⁺)` be a complete Tate Huber pair
with pseudouniformiser `ϖ` (in A3.4 `B` is perfectoid or sousperfectoid); let
`σ₁, …, σ_m ∈ B` generate the unit ideal, `V := Y(σ/σ_j) ⊆ Y = Spa(B, B⁺)` and `ū ∈ O⁺(V)`.
Prove that for every `M ≥ 0` there are finitely many `β₁, …, β_r ∈ B⁺`; an element `z ∈ O⁺(V)`
with `z − ū ∈ ϖ^M O⁺(V)`; a monic polynomial `P(Z) = Z^d + Σ_{e<d} a_e Z^e` with `P(z) = 0` whose
coefficients `a_e` are polynomials in the ratios `σ₁/σ_j, …, σ_m/σ_j` with coefficients in
`ℤ[β₁, …, β_r]`; and `b ∈ B`, `s ≥ 0` with `b/σ_j^s − z ∈ ϖ^M O⁺(V)`
(`exists_integral_approx`). Since `O⁺(V)` is the closure of the integral closure of
`B⁺[σ/σ_j]` in `B[1/σ_j]` ([KL I] §2.4, Lem. 2.4.13(a), p. 42; Tau Ceti
`Huber.PairOfDefinition.completedPlusSubring`) and `ϖ^M O⁺(V)` is an open neighbourhood of `0`, an
element `z = b/σ_j^s` of that integral closure close to `ū` does it, with `P` its integral
equation; no uniformity of `B` is used. *Needs:* Tau Ceti
`Huber.PairOfDefinition.completedPlusSubring`, `Huber.PairOfDefinition.completionLocalization`,
`ValuationSpectrum.rationalSubset`.

**Checks.**

- *test_ratio_is_generator* — `B = K⟨X⟩` (`K` a perfectoid field of characteristic `p`),
  `σ = (X, ϖ)`, `j = 1`, `V = {|ϖ| ≤ |X|}`: `ū = ϖ/X` is itself the ratio `σ₂/σ₁`, with
  `P(Z) = Z − σ₂/σ₁` and `r = 0`.

**An affinoid étale perfectoid space is Zariski closed in a relative ball, with stably
pseudocoherent ideal.** (*affinoid-etale-zariski-closed-embedding*) Let `(A, A⁺)` be a perfectoid
Tate pair of any characteristic, `X = Spa(A, A⁺)`, and `f : Y = Spa(B, B⁺) → X` an étale
morphism of affinoid perfectoid spaces ([ECD] Def. 6.2). Prove that there are `N ≥ 0` and
`b = (b₁, …, b_N) ∈ (B⁺)^N` such that the `X`-morphism `g_b : Y → B^N_X`, `Tᵢ ↦ bᵢ`, is a Zariski
closed immersion in the sense of *fs-iv-4-19-zariski-closed-char-p* with `Y' = B^N_X`;
equivalently, `π_b : A⟨T₁, …, T_N⟩ → B`, `T ↦ b`, is surjective and `B⁺` is the integral closure
of `π_b(A⁺⟨T⟩)`, a quotient mapping; the ideal `I := ker π_b` is a stably pseudocoherent
`A⟨T⟩`-module; the ideal sheaf `Ĩ` on `B^N_X` is pseudocoherent; and for every rational
`V' ⊆ B^N_X`, `O(V')/I·O(V') ≅ O(g_b⁻¹V')` with plus ring the integral closure of the image. Any
enlargement `b' = (b, b'')` with `b'' ∈ (B⁺)^{N'}` has the same properties. When `(B, B⁺)` is
given with a standard étale presentation over a sousperfectoid base, the stable pseudocoherence
of its ideal `closure (F)` in `A⟨T⟩` is part of this target.
[ECD] §6, proof of
Prop. 6.4(iv), p. 28, asserts this closed immersion without constructing it, and affinoid
subdomains of non-noetherian adic spaces are not controlled in general ([KL I] §2.4, after
Def. 2.4.12, p. 41); the construction takes global coordinates — the `σᵢ` of
*etale-standard-piece-cover*, a unit-ideal certificate `aᵢ`, the coefficients `β` of the monic
equations and the numerators `b` of the approximations of
*integral-approximation-of-generators* — forms the rational covering
`R₀ = {|h| ≥ |ϖ^{2c+1}|} ∪ {R''_j} ∪ {Q_{jl}}` of the whole ball from the integral cut-off, and
verifies the local-on-the-target condition of [FS] §IV.4.1, Prop. IV.4.19(i), p. 140, for it,
applying *fs-iv-4-19-zariski-closed-char-p* with `Y' = B^N_X` (Zariski closed immersions in the
sense of [FS] §IV.4.1, Def. IV.4.20, p. 141). *Needs:* *stably-pseudocoherent-module*;
*pseudocoherent-sheaf*; *integral-cutoff-graph-presentation*;
*fs-iv-4-19-zariski-closed-char-p*; *etale-standard-piece-cover*;
*integral-approximation-of-generators*; AdicSpacesPartIV layer R5; Tau Ceti
`ValuationSpectrum.rationalSubset`, `Huber.restrictedMvPowerSeriesCompletion`.

The proposed Lean form quantifies the integer `N`, integral
coordinates `b`, and pair map `π`; it fixes both the coefficients and coordinates of `π`
and asserts that it is a quotient mapping with stably pseudocoherent kernel.

**Checks.**

- *test_rational_embedding* — `Y = X(s/t)` rational with `s, t ∈ A⁺`: `b = (sᵢ/t)` works
  directly, `I = closure(tTᵢ − sᵢ)`.
- *test_finite_etale_embedding* — `Y` finite étale over `X` with `B = A[x]/(P)` and
  `det(∂P/∂x)` a unit: `b = ϖ^c x` works, and `I` is the closure of the ideal generated by the
  equations `P(ϖ^{−c}T)`, multiplied by a power of `ϖ` that puts them into `A⁺⟨T⟩`.

**Continuous differentials on relative balls and their closed étale loci over perfectoid bases.**
(*continuous-differentials-perfectoid-balls*) Let `(A,A⁺)` be a perfectoid Tate pair, `X = Spa(A,A⁺)`,
`V'` a rational subset of `B^N_X`, and `V = Spa(C,C⁺)` an affinoid perfectoid space étale over
`X` with a Zariski closed immersion into `V'` and quotient mapping `B := O(V') → C`.
Write `I` for its kernel. Construct continuous relative differentials on the smooth spaces
`V'/X` and `V/X` as the conormal sheaves of their diagonals, and their continuous derivations,
with convention `db = 1 ⊗ b − b ⊗ 1`. On affinoid charts they represent continuous
`A`-derivations into complete Hausdorff finite modules. Prove that
`Ωᶜ_{B/A} ≅ ⊕_{i=1}^N B·dTᵢ`, including rational restriction and termwise coordinate
derivations, and that `Ωᶜ_{C/A} = 0`. Construct the right exact sequence
`I/I² → C ⊗_B Ωᶜ_{B/A} → Ωᶜ_{C/A} → 0`, whose first map is `e ↦ 1 ⊗ de`.
This sequence alone asserts no injectivity on the left; *conormal-description* supplies that
additional conclusion for the closed étale locus.
[FS] §IV.4.1, Def. IV.4.11 and Prop. IV.4.12, pp. 136–137, construct the diagonal
conormal sheaf and its ball basis over sousperfectoid bases; their étale case has rank zero.
The quotient derivation argument gives the displayed sequence, the analytic input used in
[ECD] §6, proof of Prop. 6.4(iv), p. 28. These constructions have no noetherian-type assumption.
*Needs:* *relative-closed-polydisc* (A2); *fs-iv-4-19-zariski-closed-char-p*;
*fs-iv-4-13-regular-sequence*; *pseudocoherent-kiehl-gluing*;
AdicSpacesPartIV R5 (sousperfectoid balls, rational restrictions and étale base change);
AdicSpacesPartII R0 (completed tensor products).
README only (no Lean declaration).

**Checks.**

- *perfectoid_differentials_ball* — over the nonnoetherian perfectoid algebra
  `A = K⟨U^{1/p^∞}⟩` for `K = (𝔽_p((t^{1/p^∞})))^`, the one-variable ball has basis `dT`;
  the continuous derivation `∂/∂T` sends `T` to `1` and constants in `A` to `0`.
- *perfectoid_differentials_etale* — in characteristic `p`, the finite étale algebra
  `C = A[Z]/(Z^p − Z − a)` has zero relative differentials, since the derivative is `−1`.
- *perfectoid_differentials_rational* — for `V = X(s/t)` embedded by `Tᵢ = sᵢ/t`,
  the conormal map sends `tTᵢ − sᵢ` to `t·dTᵢ`; `t` is invertible on `V`.
- *perfectoid_differentials_zero* — for `N = 0` and the identity closed locus, both
  the ball differential module and the conormal module are zero.

**Conormal description of an affinoid étale closed subspace of a relative ball.**
(*conormal-description*) Let `(A, A⁺)` be a perfectoid Tate pair, `X = Spa(A, A⁺)`, `U ⊆ B^N_X`
a finite union of rational subsets, `Y` affinoid perfectoid étale over `X` and `g : Y → U` a
Zariski closed immersion (*fs-iv-4-19-zariski-closed-char-p*). For a rational `V' ⊆ U` with
`V := g⁻¹(V')` and `I := ker(O(V') → O(V))`, prove: (a) the continuous differentials vanish,
`Ω^c_{O(V)/A} = 0` (*continuous-differentials-perfectoid-balls*); (b) the `O(V)`-linear
map `δ : I/I² → ⊕_{i=1}^N O(V)·dTᵢ`, `e ↦ Σᵢ (∂e/∂Tᵢ)|_V dTᵢ`, is an isomorphism; in particular
`I/I²` is free of rank `N` and every basis of it lifts to elements of `I` whose Jacobian with
respect to `T` is invertible on `V`. The vanishing of relative differentials gives this conormal identification in [ECD] §6, proof of Prop. 6.4(iv), p. 28. *Needs:*
*fs-iv-4-19-zariski-closed-char-p*; *affinoid-etale-zariski-closed-embedding*;
*pseudocoherent-kiehl-gluing*; *fs-iv-4-13-regular-sequence*; *standard-etale-presentation*;
*integral-cutoff-graph-presentation*; *continuous-differentials-perfectoid-balls*;
AdicSpacesPartIII layer R3 (glueing squares). AdicSpacesPartII R0's *continuous-differentials*
and *conormal-sequence* apply when the base is of noetherian type.

The proposed Lean forms supply the continuous termwise derivations on the Tate algebra
`Huber.tateSeries`, state vanishing of continuous differentials and identify the conormal map on
the classes of ideal elements by partial differentiation, and give the same statement on a
rational chart, using the continuous coordinate derivations there. The scalar ring `O(V')/I` is identified with
`O(V)` by the quotient map; the displayed linear equivalence has target `(O(V')/I)^N`. README only (no Lean declaration).

**Checks.**

- *test_rational_conormal_basis* — `Y = X(s/t)`, `I = closure(tTᵢ − sᵢ)`: the classes of
  `tTᵢ − sᵢ` map to `t·dTᵢ`, a basis since `t` is a unit on `Y`.
- *test_no_tor_independence* (non-example) — the global step must not use Tor-independent base
  change: for `R = ℂ_p⟨T₁, T₂⟩`, `I = (T₁, T₂)`, the resolution `0 → R → R² → I → 0`
  (`r ↦ (−T₂r, T₁r)`) becomes zero after `⊗ R/I`, so `Tor₁^R(R/I, I) ≅ R/I ≠ 0`, although `I/I²`
  is free of rank `2` and `δ` is an isomorphism (`e ↦ (∂e/∂T₁, ∂e/∂T₂)` at the origin).
- *conormal_zero_variables* — for `N = 0` and `Y = X`, `I = 0` and `δ` identifies two zero modules.

**The ideal of an affinoid étale `Y` in a relative ball is generated by `N` equations with unit
Jacobian on a rational neighbourhood of `Y`.** (*local-equations-near-closed-subspace*) In the
situation of *conormal-description* with `U = V' = B^N_X` (`Y` affinoid perfectoid étale over
the affinoid perfectoid `X`, `g : Y → B^N_X` a Zariski closed immersion, `V = Y`,
`I = ker(A⟨T⟩ → O(Y))`; the case used by *global-standard-etale-presentation*), prove that there
are `e₁, …, e_N ∈ I` with `δ(eᵢ) = dTᵢ`, so that `Δ := det(∂eᵢ/∂T_j)` is `≡ 1` on `V`. For each `a ≥ 0` with `ϖ^a eᵢ ∈ A⁺⟨T⟩`, there is a
rational subset `W ⊆ V'` containing `g(V)` such that `e·O(W)` is a closed ideal,
`O(W)/(e) ≅ O(V)` compatibly with plus rings, and `W` lies in the tube of `ϖ^a e`, where
the tube is taken for these scaled equations (*tubular-neighbourhood* with `k = aN` and radius `|ϖ|^{2k+1}`).
In the tube of `e` the kernel `K` of `O(W₀)/(e) → O(Y)` satisfies `K = K²` and is finitely
generated, hence generated by an idempotent (Mathlib `Ideal.isIdempotentElem_iff_of_fg`), and
cutting the other component off by a rational condition gives `W`. For a proper rational `V'` the
tube step needs the rational coordinates of `V'` as extra variables, since *tubular-neighbourhood*
requires equations with integral Taylor coefficients. Together with the rational presentation of
`W` this gives a standard étale presentation of `(O(V), O⁺(V))` over `(A, A⁺)`
(*standard-presentation-basic-pieces* (c)). This supplies the neighbourhood and its equations required in [ECD] §6, proof of Prop. 6.4(iv), p. 28, and the
idempotent argument replaces Fargues–Scholze's use of étaleness to identify a closed immersion locally ([FS] §IV.4.1, proof of Prop. IV.4.19, p. 140). *Needs:* *conormal-description*;
*affinoid-etale-zariski-closed-embedding*; *tubular-neighbourhood*;
*fs-iv-4-13-regular-sequence*; *standard-presentation-basic-pieces*; Mathlib
`Ideal.isIdempotentElem_iff_of_fg`; Tau Ceti `ValuationSpectrum.rationalSubset`.

The proposed Lean form chooses equations whose derivative
matrix restricts to the identity on `Y`. For every integral scaling it supplies a rational
neighbourhood containing `Y`, contained in the specified tube, and a quotient mapping
whose kernel is the closed ideal generated by those equations. Its factorization equation
identifies the quotient with the original pair, including its plus ring.

**Checks.**

- *test_rational_local_equations* — `Y = X(s/t)` embedded in `B^n_X` by `Tᵢ ↦ sᵢ/t`, `I` the
  closure of `(tTᵢ − sᵢ)`: `δ(tTᵢ − sᵢ) = t·dTᵢ`, so `eᵢ := λ·(tTᵢ − sᵢ)` with `λ ∈ A⟨T⟩` any
  lift of `t^{−1} ∈ B` satisfies `δ(eᵢ) = dTᵢ`, and the tube `W` is a rational neighbourhood of
  the graph of `s/t` over `R(s/t)`.

**Huber's standard étale presentation for affinoid étale maps of affinoid perfectoid spaces.**
(*global-standard-etale-presentation*) Let `(A, A⁺)` be a perfectoid Tate pair,
`X = Spa(A, A⁺)`, and `f : Y = Spa(B, B⁺) → X` an étale morphism of affinoid perfectoid spaces
([ECD] Def. 6.2). Prove that `(B, B⁺)` admits a standard étale presentation over `(A, A⁺)`:
`B ≅ A⟨T₁, …, T_N⟩/closure(F₁, …, F_N)` with `det(∂Fᵢ/∂T_j)` a unit of `B` with bounded inverse
and `B⁺` the integral closure of the image of `A⁺⟨T⟩`, and that it can be chosen in
explicit-inverse form; conversely, if `A` has characteristic `p`, every standard étale
presentation over `(A, A⁺)` defines an affinoid perfectoid space étale over `X`
(*jacobian-criterion-char-p*). Hence, in characteristic `p`, an affinoid perfectoid space `Y`
over `X` is étale if and only if `Y ≅ Spa` of a standard étale presentation — the statement of
[H96] §1.7, Prop. 1.7.1, p. 80, for affinoid perfectoid spaces of characteristic `p` that [ECD]
§6, proof of Prop. 6.4(iv), p. 28, takes from the theory of pseudocoherent sheaves. *Needs:*
*standard-etale-presentation*; *affinoid-etale-zariski-closed-embedding*;
*conormal-description*; *local-equations-near-closed-subspace*; *jacobian-criterion-char-p*;
AdicSpacesPartII layer R0 (Huber 1.7.1).

The proposed Lean form uses
`AdicSpace.IsEtaleLocalDescription (CAff.spaHom φ …)` and the algebra structure induced by
`φ`; it comes with the characteristic-`p` converse and with perfectoidness of a presented
target.
The explicit-inverse presentation is `withInverse`. README only (no Lean declaration).

**Checks.**

- *test_noetherian_is_huber* — over a Tate ring with a noetherian ring of definition this is
  Huber's 1.7.1 (AdicSpacesPartII layer R0).
- *test_rational_presentation* — `Y = X(s/t)`: the presentation of
  *standard-presentation-basic-pieces* (a).

### A3.5 finite-stage approximation and Scholze's Proposition 6.4(iv)

The tilting input is PerfectoidSpaces layers P1, P3 and P5: For a cofiltered system
`X_i = Spa(R_i, R_i⁺)` of affinoid perfectoid spaces with limit `X = Spa(R, R⁺)`, the tilts form a
cofiltered system of affinoid perfectoid spaces of characteristic `p` with limit `X^♭`, with
`R^{♭+}/ϖ^♭ = R⁺/ϖ = colim R_i⁺/ϖ` (PerfectoidSpaces layer P1,
*completed-colimit-of-perfectoid-tate-rings* (c), and layer P5, *completed-colimit-is-perfectoid*),
and the tilting equivalences `(X_i)_{ét,aff} ≃ (X_i^♭)_{ét,aff}`, `X_{ét,aff} ≃ X^♭_{ét,aff}` of
PerfectoidSpaces layer P3 (*etale-site-tilting-equivalence*, applied levelwise) commute with the
base change functors; hence the comparison functor of [ECD] 6.4(iv) for `(X_i)` is an equivalence
iff the one for `(X_i^♭)` is, which is how [ECD] §6, proof of Prop. 6.4(iv), p. 28, reduces
essential surjectivity to characteristic `p`. *Needs:* PerfectoidSpaces layers P1, P3 and P5
(*completed-colimit-of-perfectoid-tate-rings*, *etale-site-tilting-equivalence*,
*completed-colimit-is-perfectoid*).

**Approximating equations and rational data at a finite stage of a cofiltered limit.**
(*cofiltered-limit-presentation-approximation*) In the situation of PerfectoidSpaces layer P5
(`X = Spa(R, R⁺) = lim X_i`, `X_i = Spa(R_i, R_i⁺)` affinoid perfectoid, compatible
pseudouniformiser `ϖ`), write `φ_i : R_i → R`. Prove: (a) `R⁺⟨T⟩/ϖ^M = colim (R_i⁺/ϖ^M)[T]`, so
for every `N ≥ 0`, every finite family of elements of `R⁺⟨T₁, …, T_N⟩` and every `M ≥ 0` there
are `i` and elements of `R_i⁺⟨T⟩` whose images agree with the given ones modulo `ϖ^M R⁺⟨T⟩`
(`exists_approx_restrictedPowerSeries`, with polynomial approximations and the colimit
described by approximation of `R⁺` modulo every `ϖ^M` through monotone directed images); the
same holds for the numerators and denominator of a rational subset of `B^N_X`, and for `M` large
the approximating data define, over `X`, the same rational subset (Tau Ceti
`exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`); (b) if `(N, F_i, k, π_i)` is a standard
étale presentation of `(C_i, C_i⁺)` over `(R_i, R_i⁺)` and `Y_i := Spa(C_i, C_i⁺)` is affinoid
perfectoid (automatic in characteristic `p`, *jacobian-criterion-char-p*), then the base change
`(N, φ_i(F_i), k, ·)` is a standard étale presentation of
`C_i ⊗̂_{R_i} R = R⟨T⟩/closure(φ_i(F_i))` (`StandardEtalePresentation.baseChange` with its
coordinate formula, for any morphism of complete Tate pairs), and `Y_i ×_{X_i} X = Spa(R⟨T⟩/closure(φ_i(F_i)),
integral closure)` as perfectoid spaces, the fibre product with `X` ([ECD] §6, Prop. 6.4
set-up, p. 27: the inverse limit is formed by ϖ-adically completing the colimit of the integral
rings; proof of Prop. 6.5, p. 29: uniformity makes `Spa` of the completed colimit the limit, and
the same completeness drives the approximation). The identification `R⁺/ϖ^M = colim R_i⁺/ϖ^M` is
PerfectoidSpaces layer P5's *cofiltered-limits-of-affinoid-perfectoid-spaces* and the finite-stage
descent of rational data its *descent-of-quasicompact-opens* and
*limit-restriction-to-rational-subsets*; the base change of presentations (b) is the content
here. *Needs:* *standard-etale-presentation*;
PerfectoidSpaces layers P2 and P5; AdicSpacesPartII layer R0 (completed tensor products); Tau
Ceti `TauCeti.ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`. README only (no Lean declaration).

**Checks.**

- *approximation_pointwise_union* — For the constant directed system Q₂, the polynomials selected by `exists_approx_restrictedPowerSeries` for the family (1,T) modulo 2 are both nonzero; the first has constant coefficient 1 modulo 2ℤ₂.
- *approximation_no_common_stage* — The same selected family has nonzero constant coefficient in its first polynomial and nonzero T coefficient in its second, and the two polynomials differ. A construction keeping just one member of the family cannot satisfy the simultaneous approximation.
- *approximation_directed* — for a directed, monotone family of image subrings, an upper
  bound of the stages containing `a` and `b` contains both; this is the `hmono` hypothesis of
  `exists_approx_restrictedPowerSeries`.
- *test_linear_base_change* — `F_i = (T − a_i)` with `a_i ∈ R_i⁺`: the base change is
  `T − φ_i(a_i)`, presenting `R` itself; its perturbation to `T − a` with `a ≡ φ_i(a_i) mod ϖ²`
  gives the same space.

**Affinoid étale objects over a cofiltered limit descend to a finite stage, in characteristic
`p`.** (*finite-stage-approximation-char-p*) Let `X_i = Spa(R_i, R_i⁺)`, `i ∈ I`, be a cofiltered
system of affinoid perfectoid spaces of characteristic `p` with limit `X = Spa(R, R⁺)`
(PerfectoidSpaces layer P5), and `Y → X` an étale morphism with `Y` affinoid perfectoid ([ECD]
Def. 6.2). Prove that there are `i ∈ I` and an affinoid perfectoid space `Y_i` with an étale
morphism `Y_i → X_i` such that `Y_i ×_{X_i} X ≅ Y` over `X`. Explicitly: let `(N, F, k, π)` be a
standard étale presentation of `O(Y)` over `R` in explicit-inverse form
(*global-standard-etale-presentation*), `F = (F', S·J_{F'} − ϖᵏ)`, and `m₀ = 4k + 2`; choose `i`
and `F'_i ∈ R_i⁺⟨T'⟩^{N−1}` with `φ_i(F'_i) ≡ F'` modulo `ϖ^{m₀}`
(*cofiltered-limit-presentation-approximation*) and put `F_i := (F'_i, S·J_{F'_i} − ϖᵏ)`, again in
explicit-inverse form, so that `φ_i(F_i) ≡ F` modulo `ϖ^{m₀}`; then the Jacobian
`J_{F_i} = J_{F'_i}²` is invertible on `Y_i := V(F_i)` everywhere, with `ϖ^{2k}J_{F_i}^{−1} = S²`
integral — the last equation forces `|J_{F'_i}| ≥ |ϖᵏ|` at every point of `V(F_i)`, also at
points not coming from `X` — `Y_i` is affinoid perfectoid and étale over `X_i`
(*jacobian-criterion-char-p* (b)), and `Y_i ×_{X_i} X = V(φ_i(F_i)) ≅ V(F) = Y`
(*cofiltered-limit-presentation-approximation* (b), *standard-presentation-perturbation*). The
ring-level steps are `nonempty_ofExplicitInverse` (the system `F_i`
presents its quotient pair with exponent `2k`, whatever `F'_i` is), `StandardEtalePresentation.baseChange`
and the specification of `StandardEtalePresentation.perturb` (the comparison
`V(φ_i(F_i)) ≅ V(F)` over the perfectoid, hence sousperfectoid, `R`). The
same holds for every `j ≥ i` with `F_j` the image of `F_i` ([ECD] §6, proof of Prop. 6.4(iv),
p. 28: perturbed equations define affinoid (sous)perfectoid spaces étale over the base, and
close enough approximations are isomorphic to `Y`). *Needs:* *standard-etale-presentation*;
*standard-presentation-perturbation*; *jacobian-criterion-char-p*;
*global-standard-etale-presentation*; *cofiltered-limit-presentation-approximation*;
PerfectoidSpaces layer P5.

The proposed Lean form chooses a stage, integral equations
approximating the original equations coefficientwise modulo `ϖ^(4k+2)`, and a perfectoid
étale model with the explicit-inverse equations and Jacobian exponent `2k`. Its pushout
square is the completed base change and fixes the identification with the given target.

**Checks.**

- *test_rational_descends* — `Y = X(s/t)` with `s, t ∈ R⁺`: approximate `s, t` by
  `s_i, t_i ∈ R_i⁺`; the model is `X_i(s_i/t_i)`.
- *test_finite_etale_descends* — `Y` finite étale over `X`: the model is the finite étale
  descent of PerfectoidSpaces layer P5 ([ECD] 6.4(i)), recovered from an approximated monic
  presentation.

**Independence of the finite-stage model from presentations, approximations and indices.**
(*independence-of-presentations*) In the situation of *finite-stage-approximation-char-p*, or of
*affinoid-etale-finite-stage-6-4-iv* in any characteristic (`X_i` affinoid perfectoid,
cofiltered; `Y` affinoid étale over `X`), prove: (a) if `(Y_i, α)` and `(Y'_{i'}, α')` are two
affinoid étale models of `Y` — `Y_i` affinoid étale over `X_i` with `α : Y_i ×_{X_i} X ≅ Y`,
obtained from any standard étale presentations, approximations and indices — then there is
`j ≥ i, i'` and an isomorphism `β_j : Y_i ×_{X_i} X_j ≅ Y'_{i'} ×_{X_{i'}} X_j` over `X_j`
whose base change to `X` is `α'^{−1}∘α`. Any two such isomorphisms agree after passage to
a sufficiently large common stage; uniqueness is in the filtered colimit, not asserted at a
fixed stage (the full faithfulness of [ECD] 6.4(ii), PerfectoidSpaces layer P5); (b) the rule
`Y ↦ (class of (Y_i, α))` is well defined in the 2-colimit `2-colim_i (X_i)_{ét,aff}` and,
together with the base change functor, gives mutually quasi-inverse equivalences; (c) the model
agrees with the finite-stage descent of `Y` as a qcqs étale object given by PerfectoidSpaces
layer P5 ([ECD] 6.4(ii)): the P5 descent `Z_k` of `Y` is isomorphic over some `X_j` to
`Y_i ×_{X_i} X_j`, and is therefore affinoid for large `j` ([ECD] §6, proof of Prop. 6.4(ii),
p. 28: isomorphism detection at a finite stage; proof of Prop. 6.4(iv), p. 28: full faithfulness
in (iv) follows from (ii)). *Needs:* *finite-stage-approximation-char-p*; PerfectoidSpaces
layers P2 and P5 (finite-stage descent of qcqs étale objects).

The proposed Lean forms descend the specified comparison of two
models and detect equality at a later stage.
The statements use cartesian systems of pair algebras: their transition squares and
squares to the completed base are pushouts in `CAff`. Models initially defined at different
indices are compared on the directed tail above a common upper bound. This is the ring-level
form of the isomorphism detection and full faithfulness in [ECD] 6.4(ii), printed p. 28. README only (no Lean declaration).

**Checks.**

- *test_two_rational_presentations* — two presentations of a rational subset
  `Y = X(s/t) = X(s'/t')`: the two models `X_i(s_i/t_i)` and `X_{i'}(s'_{i'}/t'_{i'})` coincide as
  subsets of `X_j` for `j` large, since qc opens descend uniquely ([ECD] 6.4(o)).

**Affinoid étale objects descend to a finite stage of a cofiltered limit of affinoid perfectoid
spaces.** (*affinoid-etale-finite-stage-6-4-iv*) Let `X_i = Spa(R_i, R_i⁺)`, `i ∈ I`, be a
cofiltered inverse system of affinoid perfectoid spaces of any characteristic indexed by a small
category, and `X = Spa(R, R⁺)` its inverse limit: `R⁺` is the ϖ-adic completion of
`colim_i R_i⁺` and `R = R⁺[1/ϖ]` for a compatible choice of pseudouniformisers `ϖ` for large `i`
(PerfectoidSpaces layer P5). For each `i` let `(X_i)_{ét,aff}` be the full subcategory of the
étale site ([ECD] Def. 6.2; PerfectoidSpaces layer P3) of affinoid perfectoid spaces étale over
`X_i`, and similarly `X_{ét,aff}`; base change is well defined in these categories because fibre
products of affinoid perfectoid spaces are affinoid perfectoid (PerfectoidSpaces layer P2), and
perfectoid Tate rings without base field use the [ECD]-generality of layers P1–P3. Prove that the
base change functors `(X_i)_{ét,aff} → X_{ét,aff}`, `Y_i ↦ Y_i ×_{X_i} X`, induce an equivalence
of categories `2-colim_i (X_i)_{ét,aff} → X_{ét,aff}`: (full faithfulness) for
`Y_i, Y'_i ∈ (X_i)_{ét,aff}`,
`colim_{j ≥ i} Hom_{X_j}(Y_i ×_{X_i} X_j, Y'_i ×_{X_i} X_j) → Hom_X(Y_i ×_{X_i} X, Y'_i ×_{X_i} X)`
is bijective; (essential surjectivity) every affinoid perfectoid space `Y` étale over `X` is
`X`-isomorphic to `Y_i ×_{X_i} X` for some `i` and some affinoid perfectoid `Y_i` étale over
`X_i`, the model being unique in the 2-colimit (*independence-of-presentations*). The proof
tilts to characteristic `p` (PerfectoidSpaces P3’s *etale-site-tilting-equivalence* and P5’s *completed-colimit-is-perfectoid*), applies
*finite-stage-approximation-char-p* and uses neither diamonds, nor [ECD] Prop. 11.30, nor [ECD]
Lem. 15.6, nor any six-functor formalism ([ECD] §6, Prop. 6.4(iv), p. 27, and its proof sketch,
p. 28: full faithfulness from (ii), essential surjectivity in characteristic `p` via Huber 1.7.1
and Kedlaya–Liu's pseudocoherent sheaves). *Needs:* PerfectoidSpaces P3’s *etale-site-tilting-equivalence* and P5’s *completed-colimit-is-perfectoid*;
*finite-stage-approximation-char-p*; *independence-of-presentations*; PerfectoidSpaces layers
P2, P3 and P5.

The proposed Lean forms give a perfectoid étale stage model and an
isomorphism `CompletedTensor R_i B_i R ≃+* B`, homeomorphic, with its value on each pure
tensor specified and its plus ring mapped onto `B⁺`, and identify the quotient of the disjoint union of stage pair-Hom sets by common extension
with the Hom set over `R`; the equation on representatives pins the comparison. The system
hypotheses express both approximation and eventual detection of congruences modulo every
power of a compatible pseudouniformiser, so they specify the completed colimit, including
its topology. These signatures use directed preorders; a cofinal directed presentation gives
the stated small cofiltered-category form. The source is [ECD] 6.4(iv), printed pp. 27–28.

**Checks.**

- *test_rational_finite_etale_composites* — `Y = X(s/t)` comes from `X_i(s_i/t_i)` for
  approximations `s_i, t_i` (Tau Ceti perturbation of rational subsets); finite étale `Y` comes
  from [ECD] 6.4(i) (PerfectoidSpaces layer P5); a composite rational ⊂ finite étale ⊂ rational
  comes from composing these.
- *test_ecd_7_18* — in [ECD] §7, proof of Lem. 7.18, p. 37, an affinoid étale cover of an affinoid
  perfectoid space comes from a finite level of the tower constructed there and splits at the
  next level. More generally, if every finite-stage affinoid étale cover acquires a section
  at some later stage, every affinoid étale cover of the completed limit has a section.
- *test_ecd_7_11* — in [ECD] §7, proof of Lem. 7.11(i), p. 33, composites of affinoid pro-étale
  maps are formed via Prop. 7.10 and 6.4(iv). On complete Huber pairs, two filtered étale
  presentations give a filtered étale presentation whose cocone point has the composite
  structure map over the original base.

**Scholze's Proposition 6.4 assembled.** (*etale-descent-to-finite-stage-6-4*) For a cofiltered
system `X_i = Spa(R_i, R_i⁺)` of affinoid perfectoid spaces with limit `X = Spa(R, R⁺)` (`R⁺`
the ϖ-adic completion of `colim R_i⁺`), under the hypotheses of [ECD] Prop. 6.4 with `κ` as in
[ECD] Lem. 4.1: (o) `|X| → lim |X_i|` is a homeomorphism of spectral spaces; (i)
`2-colim (X_i)_{fét} → X_{fét}`; (ii) `2-colim (X_i)_{ét,qcqs} → X_{ét,qcqs}`; (iii)
`2-colim (X_i)_{ét,qc,sep} → X_{ét,qc,sep}`; (iv) `2-colim (X_i)_{ét,aff} → X_{ét,aff}` are
equivalences of categories, and `X` is `κ`-small ([ECD] §6, Prop. 6.4(o)–(iv), p. 27). Parts
(o)–(iii) and the cardinal bound are PerfectoidSpaces layer P5 (cofiltered limits of affinoid
perfectoid spaces; finite-stage descent of qcqs étale objects), imported unchanged; part (iv) is
*affinoid-etale-finite-stage-6-4-iv*. Prove that the four equivalences are compatible: the
inclusions `X_{fét} ⊆ X_{ét,aff} ⊆ X_{ét,qc,sep} ⊆ X_{ét,qcqs}` (a finite étale space over an
affinoid perfectoid space is affinoid perfectoid, PerfectoidSpaces layer P3; affinoid perfectoid
spaces are quasi-compact and separated) commute with the base change functors and with the four
comparison functors from the 2-colimits. This layer does not reprove (o)–(iii), and
PerfectoidSpaces layer P5 does not claim (iv); PerfectoidSpaces layer P6
(*affinoid-etale-finite-stage-assembly*) cites this compatibility clause and records the division
of labour from its side. *Needs:* *affinoid-etale-finite-stage-6-4-iv*;
PerfectoidSpaces layers P2, P3 and P5.

The proposed Lean forms identify the same pair pushout with the
geometric pullback, preserving finite étale and étale maps; fix the comparison of two
realizations by both labelled tensor inclusions; and fix its action on
maps by the same equations and their contravariant `Spa` equations. Thus forgetting from
finite étale to affinoid étale to quasi-compact separated étale to qcqs étale retains the
same base-change object, projections and maps. Uniqueness makes these comparisons coherent
under composition and passage to the filtered colimit of Homs. README only (no Lean declaration).

**Checks.**

- *test_constant_system* — for the constant two-sheeted affinoid over `ℚ₂`, completed tensor
  base change along the identity has a unique comparison with the original split pair fixing
  both coprojections. It sends the first characteristic idempotent to the first, not the second.
  The four descent functors specialize to identity functors.

**The Zariski closed immersions of this layer are strongly Zariski closed.**
(*zariski-closed-immersion-ecd-comparison*) Let `(A, A⁺)` be a perfectoid Tate pair of
characteristic `p`, `X = Spa(A, A⁺)`, `Y = Spa(B, B⁺)` affinoid perfectoid étale over `X` and
`b ∈ (B⁺)^N` as in *affinoid-etale-zariski-closed-embedding*. Let
`B^{N,perf}_X := Spa(A⟨T₁^{1/p^∞}, …, T_N^{1/p^∞}⟩, A⁺⟨T^{1/p^∞}⟩)` be the perfectoid relative
ball and `g^perf : Y → B^{N,perf}_X` the map `T_i^{1/pⁿ} ↦ b_i^{1/pⁿ}`. Prove that `g^perf`, the
closed embedding of A3.4 composed into the perfectoid ball, is strongly Zariski closed in the
sense of [ECD] §5, Def. 5.7(ii), p. 24, directly: `A⟨T^{1/p^∞}⟩ → B` is surjective, its image
containing the image of `A⟨T⟩`, which is `B`; `B⁺` is the integral closure of the image of
`A⁺⟨T^{1/p^∞}⟩` (it is the integral closure of the smaller image of `A⁺⟨T⟩`, and the roots
`bᵢ^{1/pⁿ}` lie in `B⁺`); and `A⁺⟨T^{1/p^∞}⟩ → B⁺` is almost surjective, i.e. `ϖ^{1/pⁿ}B⁺` lies
in the image for every `n`: the image is open, so it contains `ϖ^c B°` for some `c`, and it is
perfect (the source plus ring is integrally closed in the perfect source ring, hence closed
under the unique p-th roots), so with `b ∈ B⁺` and
`ϖ^c b^{pⁿ} ∈ image` also `ϖ^{c/pⁿ}b ∈ image`. These are the two forms in which strong Zariski
closedness is used ([ECD] §5, Def. 5.7(ii) and Thm. 5.8: surjectivity on the rings with the plus
ring the integral closure of the image, and almost surjectivity on the plus rings); in particular
`g^perf` is a Zariski closed immersion ([ECD] 5.7(i)). The proof
of *affinoid-etale-finite-stage-6-4-iv* does not use [ECD] Thm. 5.8 (Zariski closed implies
strongly Zariski closed), which is not an input of this roadmap: the closed immersions it needs
are into the sousperfectoid ball `B^N_X` and are constructed as quotient mappings
(*affinoid-etale-zariski-closed-embedding*), and the transfer between characteristics is done on
étale categories (PerfectoidSpaces P3’s *etale-site-tilting-equivalence* and P5’s *completed-colimit-is-perfectoid*), not on Zariski closed immersions.
*Needs:* *affinoid-etale-zariski-closed-embedding*; AdicSpacesPartIV layer R5; PerfectoidSpaces
layer P1.

`Huber.Pair.Hom.quotientMapping_perfect_extension_charP` applies to the extension of the
ball quotient map to the perfectoid ball: any pair map extending that quotient is again
a quotient mapping and is almost surjective on plus rings.
`Huber.Pair.Hom.almost_surjective_of_quotient_charP` states the general ring-level implication:
for each compatible root `ϖ^(1/p^n)` and each integral target element its product lies in
the image of the source plus ring. These are the conditions of [ECD] 5.7(ii), printed p. 24. README only (no Lean declaration).

**Checks.**

- *ambient_perfect_not_plus_perfect* — in the perfection of `𝔽₂(t)`, let
  `B = 𝔽₂[t^(1/2^∞)]` and `S = 𝔽₂ + tB`. The integral closure of `S` is `B` and
  `tB ⊆ S`, but the unique square root `t^(1/2)` is absent from `S`. Thus an ambient
  perfect ring and a conductor bound do not suffice without integral closure of the source plus ring.
- *test_almost_surjective_of_perfect* — if the source plus subring is integrally closed in a
  perfect characteristic-p ring and `ϖ^c S⁺` lies in its image, taking p-power roots inside
  that subring gives the bounded lifts used in the argument. Perfectness of the ambient
  ring alone does not assert perfectness of an arbitrary subring.
- *test_rational_strongly_closed* — `Y = X(s/t)`: `g^perf` identifies `Y` with the Zariski closed
  subset `V(t^{1/pⁿ}T^{1/pⁿ} − s^{1/pⁿ} : n)` of the perfectoid ball, which is strongly Zariski
  closed.

### Examples

The worked examples of the layer run along its build. A rational subset `Y = X(s/t)` descends to
`X_i(s_i/t_i)` for approximations `s_i, t_i` of `s, t` (Tau Ceti's perturbation of rational
subsets, `exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`), and its closed embedding is
`Tᵢ ↦ sᵢ/t` with ideal the closure of `(tTᵢ − sᵢ)` (*affinoid-etale-zariski-closed-embedding*,
*finite-stage-approximation-char-p*). For a finite étale `Y`, the model from an approximated
monic presentation agrees with [ECD] 6.4(i) of PerfectoidSpaces layer P5. The tube of
`e = T − a` on `B¹_X` is the translation `{|T − a| ≤ |ϖ|} ≅ B¹(|ϖ|)` (*tubular-neighbourhood*),
and the perturbation of `(T − a)` to `(T − a')` with `a ≡ a' mod ϖ²` gives the identity of `A`
(*standard-presentation-perturbation*). `F = T^p − a` in characteristic `p` is rejected by the
Jacobian condition, `J_F = 0`, and a nonempty such locus is not étale (*standard-etale-presentation*,
*jacobian-criterion-char-p*). Over `ℚ_p⟨T⟩`, strongly noetherian, the pseudocoherent theory
reduces to Kiehl's coherent theory (AdicSpacesPartIII layer R3, Kiehl's theorem on Tate affinoids;
*pseudocoherent-kiehl-gluing*) and pseudoflatness to flatness
(*rational-localisation-pseudoflat*). The applications in [ECD] are those recorded under
*affinoid-etale-finite-stage-6-4-iv*: in the proof of Lemma 7.18, affinoid étale covers descend
to a finite level of a tower; in the proof of Lemma 7.11(i), composites of affinoid pro-étale
maps are formed via Proposition 7.10 and 6.4(iv). Alongside these sit the non-examples that fix
the definitions: the finitely presented but not 2-pseudocoherent `R/xR` over
`k[x, y₁, y₂, …]/(x·yᵢ)`, the strictly but not stably pseudocoherent quotient `A/fA` of [KL II]
Ex. 2.4.2, the non-pseudoflat `ℚ_p⟨T⟩/(T)`, the pushforward `j_*O_U` that is not pseudocoherent,
the dilation `X ↦ ϖX` that is no automorphism of `A⟨X⟩`, and the non-integral equation `(T/p)²`
for which the tube theorem fails.


The following additional Checks fix the algebra conventions. Unless a row specifies another
ring, the analytic examples use a complete separated Tate ring `A`, its chosen Huber pair,
and its pseudouniformiser; evaluation examples use a Hausdorff topological ring. Presentation
examples use the complete base and target, quotient map and plus rings stored in the presentation.
The perturbation examples additionally require a sousperfectoid base and integral error
`G − P.withInverse.F ∈ ϖ^(4P.k+2) A⁺⟨T⟩`.

| Check | Computation or boundary case |
| --- | --- |
| *inverse_zero_variables* | J of the empty equation list is 1. |
| *Huber.StandardEtalePresentation.rational_zero_denominator* | inverting zero gives the empty affinoid. |
| *base_change_zero* | For N = 0, the base-changed scalar map is bijective and the base-changed Jacobian is 1. |
| *perturb_zero* | no perturbation recovers the specified quotient identification. |
| *perturb_plus* | For Fᵢ = Tᵢ² − Tᵢ and Gᵢ = (Tᵢ − δ)² − (Tᵢ − δ), where δ = ϖ^(4k+2), the perturbation equivalence sends the old idempotent to the integral idempotent Tᵢ − δ and excludes its complement over a nonzero target. |
| *perturb_coordinate* | For the same shifted idempotent equation, the coordinate error is −δ and differs from 1 − 2Tᵢ + δ, the error obtained by exchanging the two roots. |
| *test_perturb_linear_identity* | for `T − a` perturbed to `T − a'` the comparison is the identity of `A` with coordinate error `a − a'`. |
| *test_identity_cutoff* | the identity is a quotient mapping with zero kernel; there are no cutoff equations. |
| *approximation_no_common_stage* | The same selected family has nonzero constant coefficient in its first polynomial and nonzero T coefficient in its second, and the two polynomials differ. A construction keeping just one member of the family cannot satisfy the simultaneous approximation. |
| *fpd_not_projective* | the torsion module has projective dimension one over ℤ. |
| *pseudo_zero_boundary* | the quotient needs no finite kernel at level zero. |
| *koszul_empty* | the empty sequence gives R and a zero conormal module. |
| *test_transport_direction* | `π ∘ θ` kills the inverse substitute `X − 3` and sends the forward substitute `X + 3` to `6`. |
| *koszul_two_terms* | The quotient Q[X₀,X₁]/(X₀,X₁) satisfies `Module.IsFPD` in degree 2 and fails it in degree 1. |
| *cech_two_terms* | The typed Čech differential chosen from the rational-cover exactness theorem sends (0,1) to 1 on the ordered overlap of two unit charts. |
| *natural_zero* | the module of rank zero is separated and complete. |
| *natural_rank_two* | `A²` is naturally complete over a complete Hausdorff Tate base. |
| *natural_nonclosed_principal* | Over a complete Hausdorff Huber ring, `A/(x)` for nonclosed `(x)` is not naturally complete: its module topology is not Hausdorff. |
| *strict_rank_one* | the regular module is strictly pseudocoherent in every degree. |
| *stable_fpd_zero* | completion of localizations preserves the zero module. |
| *proprojective_zero* | The zero module uses the constant zero projector sequence. |
| *null_zero* | the zero sequence tends to zero. |
| *null_two_terms* | a sequence supported in degrees zero and one is null. |
| *null_constant* | a nonzero constant sequence is not null in a Hausdorff ring. |
| *coordinate_completion* | the series variable maps to the completed variable. |
| *coordinate_constant* | the variable has constant coefficient zero. |
| *coordinate_linear* | two distinct variables have distinct unit coefficients. |
| *completed_coordinate_nonzero* | completion does not kill the variable. |
| *completed_coordinates_distinct* | completion keeps the two coordinates distinct. |
| *laurent_inverse* | the two quotient coordinates multiply to one. |
| *laurent_nonzero* | Laurent extension preserves a nonzero coefficient ring. |
| *laurent_zero_base* | the zero coefficient ring has zero Laurent extension. |
| *simple_zero* | the ≤ piece at zero is A; the ≥ and = pieces are empty. |
| *simple_one* | all three pieces at the constant unit one are A. |
| *simple_small* | a topologically nilpotent unit belongs only to the ≤ piece. |
| *series_zero_variables* | the zero-variable Tate algebra is the coefficient ring. |
| *plus_constant* | a constant is integral exactly when its coefficient is. |
| *plus_coordinate* | each coordinate lies in the specified plus ring. |
| *plus_zero* | the zero-variable plus ring is identified coefficientwise. |
| *plus_polydisc* | `A⁺⟨T⟩` corresponds to layer A2's `polydiscPlus` in the Tate algebra. |
| *series_jacobian_empty* | the determinant in zero variables is one. |
| *series_jacobian_linear* | a translated coordinate has derivative one. |
| *series_jacobian_swap* | switching two equations reverses the determinant. |
| *tube_empty_variables* | no equations and unit Jacobian give the whole spectrum. |
| *tube_zero_jacobian* | a positive-dimensional zero equation has no tube. |
| *tube_linear* | the Jacobian cutoff is automatic for T-a and k=0. |
| *Huber.ratLoc_identity* | completing the identity rational localization recovers `A`, and its plus ring pulls back to `A⁺`. |
| *rational_empty* | inverting zero gives the zero ring, including its plus subring. |
| *rational_fraction* | the completed denominator times its inverse equals one. |
| *rational_plus_fraction* | every defining ratio belongs to the localized plus ring. |
| *quotient_identity* | the identity is a quotient mapping. |
| *quotient_top* | quotient by the unit ideal has the zero target ring and full plus ring. |
| *quotient_ideal* | the canonical quotient has precisely the integral-image plus ring. |
| *quotient_plus_too_big* | a strictly larger target plus ring is not a quotient mapping. |
| *eval_two_terms* | Tau Ceti's `weightedEval` at `t` gives `a+b*t` on `a+b*T`. |
| *jacobian_at_empty* | the empty Jacobian has determinant one. |
| *jacobian_at_linear* | the derivative of a+b*T is b. |
| *jacobian_at_two* | rows are equations; columns are variables. |
| *quotient_coordinate* | quotientEquiv is induced by the actual presentation map. |
| *quotient_scalar* | quotientEquiv preserves the specified A-algebra structure. |
| *quotient_relation* | each defining relation vanishes under quotientEquiv. |
| *presentation_jacobian_empty* | rank zero has determinant one. |
| *presentation_jacobian_one* | one equation uses its first derivative. |
| *presentation_jacobian_two* | the order is ad-bc, with equations as rows. |
| *presentation_tube_zero* | the tube of a zero-variable presentation is the full spectrum. |
| *presentation_tube_radius* | larger m gives a smaller tube. |
| *presentation_tube_cutoff* | every point satisfies the Jacobian lower bound. |
| *inverse_system_zero_variables* | with no old variables the explicit-inverse system is `S − ϖᵏ`. |
| *jacobian_two_equations* | the explicit-inverse system of `T² − a` has Jacobian `(2T)²`. |
| *finite_etale_jacobian* | `T² − T` has Jacobian `2T − 1`, whose square is `1` modulo the equation. |
| *test_artin_schreier* | `T^p − T − u` has Jacobian `−1` in characteristic `p` and presents its quotient with `k = 0`. |
| *base_change_jacobian* | the base-changed Jacobian is the image of `J_F`. |

**Checks on presentations, modules and sheaves.** The labels below name Checks to be formalised
as `example`s; one `example` may state two named Checks. Rational presentations keep
both the numerator equations and the quotient map. Finite-stage examples retain the completed
tensor comparison and equality of plus rings. The sheaf examples use the analytic structure
sheaf, its actual pullback and pushforward, and global sections.

| Checks | Carriers and assertions |
| --- | --- |
| *test_noetherian_submodules_closed*, *test_strongly_noetherian_flat*, *test_strongly_noetherian_reduces*, *test_locally_free_projective* | `Huber.tateSeries`, `moduleTopology`, `simpleLaurentLe/Ge/Eq` and `Huber.ratLoc`: closed submodules, flat restrictions, and finite projectivity from locally free restrictions. |
| *test_pseudoflat_property* | Two composable `CAff.IsRationalLocalization` maps are 2-pseudoflat, as is their composite; both simple Laurent restrictions of the middle ring qualify. |
| *test_structure_sheaf*, *test_finite_projective* | The full ordered Čech complex of the proposed `cech_exact_of_isStablyPseudoCoherent_sheafy`, with its specified alternating restriction maps, for the regular module and for a finite projective module. |
| *test_finite_projective_descent* | The kernel and scalar-extension maps of the proposed `simpleLaurent_pseudocoherent_descent`, with finite projective input and output modules. |
| *test_structureSheaf*, *test_vectorBundle*, *test_tateAlgebra_ideal*, *test_kiehl_strongly_noetherian*, *test_ideal_sheaf_application* | `affinoidModuleSheaf` and `affinoidSections` identify the specified modules with their sheaves and recover their sections. *test_tateAlgebra_ideal* also identifies rational restriction with the quotient by the extended ideal. |
| *test_pushforward_not*, *test_coker_not* | `SheafOfModules.pushforward` of the smaller closed disc and the actual categorical cokernel of multiplication by the coordinate on `C(ℤ_p,ℚ_p)` fail `IsPseudoCoherentSheaf`. |
| *test_linear*, *test_disc_presentation*, *test_finite_etale_presentation* | Newton's linear zero is `a`; `ofRational` has two displayed equations and Jacobian `p²`; the quadratic presentation has Jacobian `2y` with inverse in the plus ring. |
| *test_translation*, *test_unit_jacobian_product*, *test_linear_regular* | `tubeSet` and `ratLoc` give the scaled coordinate, product comparison preserving plus rings, and regularity with closed ideal on every rational restriction. |
| *test_perturb_rational*, *test_linear_base_change*, *test_two_rational_presentations* | Close rational data give the same rational set and a homeomorphic pair comparison; linear coefficients pass through the base map; comparison of two rational presentations is unique over the base. |
| *test_field_trivial*, *test_field_quadratic* | `StandardEtalePresentation` has the specified equations and exponent zero. The quadratic Check assumes `2` is a unit in `K⁺`, expressing the odd residue-characteristic condition. |
| *test_rational_finite_etale_pieces*, *test_frobenius_locus_not_etale* | `CAff.spaHom` is étale for rational–finite étale composites over a perfectoid base; a nonzero Frobenius quotient in characteristic `p` has zero Jacobian and is not étale. |
| *test_surjective_application*, *test_rational_closed*, *test_rational_embedding*, *test_finite_etale_embedding* | Quotient mappings supply lifts and monic integral equations; rational and monogenic finite étale embeddings retain their coordinates and closed equation ideals. |
| *test_rational_one_piece*, *test_disjoint_union_idempotent* | The unit numerator gives the one-member covering, and the two complementary idempotents give precisely the two disjoint rational components. |
| *test_ratio_is_generator* | The nonzero ratio `ϖ/X` belongs to the rational plus ring and to the subalgebra generated by the prescribed ratios. |
| *test_rational_conormal_basis*, *test_rational_local_equations* | Equation classes give the diagonal basis matrix `t·1`; multiplication by a lift of `t⁻¹` gives the identity derivative matrix. |
| *test_no_tor_independence* | Mathlib's `CategoryTheory.Tor` (`Mathlib/CategoryTheory/Monoidal/Tor.lean`, definition `Tor`) gives `Tor₁^R(R/I,I) ≅ R/I ≠ 0` for the two-variable Tate algebra, although `I/I²` is free of rank two. The example allows any complete algebraically closed nonarchimedean field, including `ℂ_p`. |
| *test_noetherian_is_huber*, *test_rational_presentation* | Étaleness over a noetherian ring of definition agrees with the standard-presentation criterion; the rational example uses the equations `tTᵢ−sᵢ`. |
| *test_rational_descends*, *test_finite_etale_descends*, *test_rational_finite_etale_composites* | The completed-system hypotheses of `affinoid_etale_finite_stage_essSurj` yield models of the same morphism classes, with all three factors of a composite at one stage. |
| *test_constant_system* | The completed tensor of the split two-sheeted Q₂ pair with Q₂ has a unique comparison with that pair fixing both coprojections and the first characteristic idempotent. This tests the actual completed-tensor construction. The four category-level comparisons also require PerfectoidSpaces P5's finite étale, qcqs étale and qc separated étale limit equivalences. |

### Dependencies

Inside AdicEtaleGeometry: layer A1 for étale morphisms by local description
(*etale-morphisms-local-description-and-comparison*) and finite étale affinoid algebras with
their integral-closure plus rings (*finite-etale-affinoid-algebra*); within the layer, A3.2 uses
A3.1 for stable pseudocoherence of the quotients by regular sequences, A3.3 uses A3.1–A3.2, A3.4
uses A3.1–A3.3, and A3.5 uses A3.2–A3.4. Other roadmaps: PerfectoidSpaces layers P1–P3
(perfectoid Tate rings and tilts, rational localisations, the sheaf theorem, fibre products,
almost purity, the étale site and its tilting, in the generality of perfectoid Tate rings without
base field; the perfectoid-field generality of the P2/P3 targets is used here for the tilting
transfer), layer P2 (completed direct limits of `p`-finite affinoids, [PS] Lem. 6.13, whose
Bosch–Güntzer–Remmert inputs are inherited through it) and layer P5 (cofiltered limits of
affinoid perfectoid spaces, [ECD] 6.4(o)–(iii) and the cardinal bounds, finite-stage descent of
qcqs étale objects — PerfectoidSpaces layer P5 owns these, and this layer owns 6.4(iv) and the
analytic algebra behind it); *continuous-differentials-perfectoid-balls* (continuous
differentials and the conormal sequence for rational balls over perfectoid bases);
AdicSpacesPartII layer R0 (completed tensor products and their
base-change formulas, the Tate ring norm, completion of strict complexes, continuous
differentials and the conormal sequence over noetherian-type bases, Huber's noetherian étale
theory: 1.7.1, 1.7.2, the étale
local structure, the finite étale embedding of an étale affinoid and the local open–finite étale
factorisation, including Huber 1996 Lemma 2.2.8 and the de Jong–van der Put inputs inherited
through it and used by the characteristic-`p` Jacobian criterion); AdicSpacesPartIII layer R3
(Tate's reduction and Čech acyclicity on sheafy Tate affinoids, glueing squares, vector bundles,
coherent sheaves on `Spa ℚ_p⟨T⟩`, Kiehl's theorem and Kiehl gluing of finite projective modules);
AdicSpacesPartIV layer R5
(sousperfectoid rings and spaces, their sheafiness and stable uniformity, perfectoid frames,
sousperfectoid étale base change); the Foundations of adic spaces roadmap (AdicSpaces), layers
0–5 (Huber pairs, Tate rings and the open mapping theorem, restricted power series, rational
subsets with their universal property and perturbation invariance, sheafy pairs, adic spaces).
Not inputs: [ECD] Thm. 5.8 (Zariski closed implies strongly Zariski
closed); DiamondsAndVStacks layer D6, which owns
the identification of étale sites of analytic adic spaces with those of diamonds ([ECD] 15.6),
and [ECD] 11.30; Fargues–Scholze IV.4.13–IV.4.19 in their general smooth, sous-perfectoid-base
form, whose printed proofs rest on [ECD] 12.17, 15.6, 11.30 and on descent to strictly totally
disconnected bases — only the étale perfectoid-base specialisations are proved here; [KL II]
Rem. 2.4.3 (stable pseudocoherence of quotients with sheafy quotient), which cites further
lecture notes; and Kedlaya–Liu's open points (flatness of rational localisations, Fitting ideals
of pseudocoherent modules, the `T − f` case of Lem. 2.4.12), which lie outside what the layer
claims. Libraries: Mathlib `Module.Finite`, `Module.FinitePresentation`, `Module.Projective`,
`Module.Flat`, `TensorProduct`, `RingTheory.Sequence.IsWeaklyRegular`, `Ideal.Cotangent`,
`moduleTopology`, `IsModuleTopology`, `Topology.IsStrictMap`, `MvPowerSeries.pderiv`,
`Polynomial.hasseDeriv`, `Algebra.Etale`,
`Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`, `Algebra.SubmersivePresentation`,
`Algebra.PreSubmersivePresentation.jacobian`, `Ideal.isIdempotentElem_iff_of_fg`, `PerfectRing`,
`frobenius`; Tau Ceti `Huber.IsTateRing` with `isOpenMap` and `isStrictMap_of_isClosed_range`,
`Huber.IsPseudoUniformizer`, `Huber.Pair`, `Huber.Pair.Hom`, `Huber.Pair.quotient`,
`Huber.PairOfDefinition` with `completionLocalization` and `rationalEvalHom_surjective`,
`Huber.restrictedMvPowerSeriesCompletion`,
`TauCeti.Huber.existsUnique_continuous_ringHom_completion_weightedRestrictedSubring`,
`TauCeti.Huber.isClosed_of_module_finite_topologicalClosure`, `completeSpace_moduleTopology`,
`isClosed_of_isNoetherian`, `IsStronglyNoetherian`, `ValuationSpectrum.rationalSubset`,
`TauCeti.ValuationSpectrum.mem_iff_forall_vle_one`,
`TauCeti.ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`,
`TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`,
`TauCeti.ValuationSpectrum.exists_span_eq_top_forall_rationalSubset_subset_of_isTateRing`.

## Layer A4: analytic adic presentations for diamondification

This layer is the analytic half of [ECD] §15. For a complete Tate `ℤ_p`-algebra `A` it builds a
profinite tower of finite étale torsors `A → A_i` that kills every finite étale cover, completes it
uniformly to a perfectoid Tate ring `Â_∞` with a continuous action of `G = lim G_i`, and packages
the result as a *perfectoid torsor presentation*: an affinoid perfectoid cover
`X̃ = Spa(Â_∞, Â_∞⁺)` of `Spa(A, A⁺)`, the induced perfectoid equivalence relation
`R̃ = Spa(C^0(G, Â_∞)) ≅ G × X̃`, the topological quotient `|X̃|/G = |Spa(A, A⁺)|`, and effective
descent of finite étale algebras along `X̃ → Spa(A, A⁺)`. Everything here is a statement about
rings, Huber pairs and spaces of continuous valuations; no v-sheaf appears. The v-sheaf
`Spd(A, A⁺)`, the facts that `Spd(A_i) → Spd(A)` and `Spd(Â_∞) → Spd(A)` are torsors, that
`Spd(A, A⁺)` is a spatial diamond, the diamond `Y^♢` of an analytic adic space, and the equivalence
of its étale sites with those of `Y` are DiamondsAndVStacks layer D6's; D6 imports this layer, and
no statement here is justified by a D6 result. Sheafiness of `(A, A⁺)` is never assumed: the
presentation is exactly what makes a non-sheafy Tate pair usable in [ECD] §15. The layer is
consumed by DiamondsAndVStacks layer D6 (*spd-of-a-tate-pair*, *spd-is-a-spatial-diamond*,
*gluing-and-the-diamond-functor*, *etale-site-comparison*) and by the
`Bun_G` and Newton-strata roadmaps. It draws on
AdicEtaleGeometry layer A1 (finite étale algebras over complete Tate Huber pairs with their natural
topology and integral plus ring, *finite-etale-affinoid-algebra*; the finite étale and étale sites
of generalized adic spaces, *finite-etale-site*, *etale-site*, *generalized-adic-presentation*),
AdicSpacesPartII layer R0 (uniformization, spectral seminorm, spectral topology, Tate ring norm,
completed tensor product, uniform completed tensor product, finite algebras tensor complete),
PerfectoidSpaces layers P1 (perfectoid Tate rings and algebras), P2 (uniform completed tensor
products of perfectoid rings), P3 (the henselian finite étale comparison in the generality of
Tate rings without a base field), P5 (cofiltered
limits of affinoid perfectoid spaces) and P6 (products with profinite sets), PerfectoidTowers
layer P9 (finite Galois descent of modules), and the Foundations of adic spaces roadmap
(AdicSpaces) for Huber
pairs, power-bounded subrings, completion and adic spectra, through the declarations named in the
`*Needs:*` clauses.

The standing conventions are these. The parameter `p` is a prime natural number. A Tate ring is
Tau Ceti's `IsTateRing` (a Huber ring with a topologically nilpotent unit), not required to be
complete; *complete* means complete and Hausdorff; a *Tate `ℤ_p`-algebra* is a Tate ring in which
`p` is topologically nilpotent;
pseudouniformizers are Tau Ceti's `IsPseudoUniformizer`, `R°` is `powerBoundedSubring` and `R°°`
the topologically nilpotent elements. A finite étale `R`-algebra is one with Mathlib's
`Algebra.Etale` and `Module.Finite`, and `FÉt(R)` is their category with `R`-algebra maps; for `R`
a complete Tate ring a finite étale `R`-algebra carries its natural topology as a finite projective
`R`-module and, over a pair `(R, R⁺)`, the plus ring given by the integral closure of `R⁺`
(AdicEtaleGeometry layer A1). A finite étale `R`-algebra `T` is *totally split* if
`T ≅ ∏_{j=1}^m R/(1 − e_j)` for idempotents `e_j` of `R` (`m ≥ 0`), and `R` *has no nonsplit finite
étale covers* if every finite étale `R`-algebra is totally split. A finite group `G` acts on the
left by algebra automorphisms, the Galois map is `b ⊗ b′ ↦ (g ↦ b·g(b′))`, and faithful flatness
is part of the definition of a torsor. In a tower, `π_{ij} : G_j → G_i` goes from the larger index
to the smaller, `ι_{ij} : A_i → A_j` is equivariant along it, and `G = lim G_i` acts on
`A_∞ = colim A_i`. The colimit `A_∞` carries the topology in which `colim_i A_i°` is an open
subring with its `ϖ`-adic topology (the uniform topology of [Berkeley] Lecture 10), not the colimit
of chosen rings of definition. The uniform completion of a Tate pair is its uniformization in the
sense of AdicSpacesPartII layer R0 (separated completion for the spectral seminorm, plus ring the
closure of the image); for the colimit of a tower it is the Hausdorff completion, since `A_∞` is
uniform. Perfectoid Tate rings are those of PerfectoidSpaces layer P1 ([ECD] §3, Def. 3.1, p. 14:
complete, uniform, a pseudouniformizer `ϖ` with `ϖ^p | p` in `R°`, and `Φ : R°/ϖ → R°/ϖ^p`
bijective). The statements of this layer are for complete Tate rings `A`; for a Tate `ℤ_p`-algebra
that is not complete, the construction is applied to its completion `Â`, whose adic spectrum is
that of `A`, and D6 uses `Spd(A, A⁺) = Spd(Â, Â⁺)`; a torsor tower over the non-complete ring itself
need not have a perfectoid uniform completion (for `A = ℚ_p[T]` with ring of definition `ℤ_p[T]`,
finite étale `A`-algebras are products of rings `L[T]`, and the levels `L[T]` for the finite
Galois extensions `L/ℚ_p` form a tower with colimit `ℚ̄_p[T]`, whose uniform completion `ℂ_p⟨T⟩` is
not perfectoid: `T` is not a `p`-th power modulo `p`). Finally, `G` acts on `Spa(B, B⁺)` by
`(g·y)(b) = y(g⁻¹b)`, and the map of adic spectra of a presentation is spectral (quasi-compact)
automatically, as for every morphism out of a Tate pair (Tau Ceti
`Huber.Pair.Hom.isSpectralMap_spaComap_of_isTateRing`).

### A4.1 rings without nonsplit finite étale covers

**Rings with no nonsplit finite étale covers.** (*finite-etale-split-ring*) Let `R` be a
commutative ring; the zero ring is allowed. A finite étale `R`-algebra `T` (Mathlib
`Algebra.Etale R T` with `Module.Finite R T`) is *totally split* if there are finitely many
idempotents `e_1, …, e_m ∈ R` (`m ≥ 0`, repetitions and zero allowed) and an `R`-algebra
isomorphism `T ≅ ∏_{j=1}^m R/(1 − e_j)R`, and `R` *has no nonsplit finite étale covers* if every
finite étale `R`-algebra is totally split. This is the conclusion of [ECD] §15, Lem. 15.3, p. 90,
for `A_∞`; the proof there that `Â_∞` is perfectoid uses it only for `Â_∞`, to which it transfers
(*finite-etale-invariance-along-tower* (iii)), and only through `IsFiniteEtaleSplit.exists_root`.
"Split" means totally split over `R` itself, not after a further faithfully flat extension, the
zero algebra is totally split (`m = 0`), and no topology is involved. Define the class
`IsFiniteEtaleSplit R` and the predicate `Algebra.IsTotallySplit R T`
(`∃ m, ∃ idempotents e : Fin m → R, T ≃ₐ[R] Π j, R ⧸ Ideal.span {1 − e j}`);
prove `isFiniteEtaleSplit_iff_exists_section` (`R` has no nonsplit covers iff every *faithfully
flat* finite étale `R`-algebra `T` — for `T` finite étale, faithful flatness says the rank of `T`
is `≥ 1` at every prime of `R` — admits an `R`-algebra map `T → R`: for `T` faithfully flat and
totally split, refine the covering idempotents to orthogonal ones; conversely split off a section
by the idempotent of its graph and induct on the rank; sections are the form in which the proof of
[ECD] §15, Lem. 15.3, p. 90, uses the hypothesis),
`IsFiniteEtaleSplit.exists_root` (a monic `P` of degree `d ≥ 1` with `P′` a unit modulo `P`, so
that `(P, 1)` is a Mathlib `StandardEtalePair`, has a root in `R`, because `R[X]/(P)` is étale and
free of rank `d`, hence a faithfully flat finite étale `R`-algebra),
`isFiniteEtaleSplit_iff_isSepClosed` (for a field `K` the condition is `IsSepClosed K`, by Mathlib
`Algebra.Etale.iff_exists_algEquiv_prod`), invariance under base-change equivalences (if base
change along `φ : R → R′` is an equivalence `FÉt(R) ≅ FÉt(R′)`, then `R` has no nonsplit covers
iff `R′` has none: idempotents are the maps `R × R → R`, so faithful flatness is preserved and
reflected), stability of total splitting (a quotient of a totally split finite
étale algebra by an idempotent, and a finite étale direct factor of a totally split one, are
totally split), `IsFiniteEtaleSplit.pi` (a finite product of rings with no nonsplit covers has
none) and the zero-ring case (the zero ring has none) ([ECD] §15, Lem. 15.3,
p. 90; [Berkeley] Lecture 10, Lem. 10.1.6, p. 75). The locally constant case states
that the ring of locally constant functions from a profinite set to a separably closed field
has no nonsplit finite étale covers, being a filtered colimit of finite products of that field
(*finite-etale-algebras-filtered-colimit*). *Needs:* Mathlib `Algebra.Etale`, `Module.Finite`,
`Module.FaithfullyFlat`, `IsIdempotentElem`, `Module.rankAtStalk`, `StandardEtalePair`,
`StandardEtalePair.homEquiv`, `Algebra.IsStandardEtale`, `AdjoinRoot.powerBasis'`,
`Algebra.Etale.iff_exists_algEquiv_prod`, `Algebra.IsFiniteSplit`, `IsSepClosed`,
`IsSepClosed.exists_root`, `HenselianLocalRing`, `PadicComplex`.

Mathlib's `Algebra.IsFiniteSplit` requires constant rank. Here the ranks may vary over
clopen components: over `ℚ × ℚ`, the quotient by `1 − (1,0)` has ranks `(1,0)`.
The comparison with the library predicate is part of this target.

Lean: `Algebra.IsTotallySplit`, the class `IsFiniteEtaleSplit`, `isFiniteEtaleSplit_iff_exists_section`,
`IsFiniteEtaleSplit.exists_root` and `isFiniteEtaleSplit_iff_isSepClosed`; the rest is README only.

**Checks.**

- *test_isSepClosed* (compatibility) — for a field `K`, `IsFiniteEtaleSplit K ↔ IsSepClosed K`.
- *test_Cp* (computation) — `IsFiniteEtaleSplit ℂ_p` (Mathlib `ℂ_[p]`, algebraically closed).
- *test_not_Qp* (non-example) — `¬ IsFiniteEtaleSplit ℚ_p`, also for `p = 2`: `ℚ_p[X]/(X² − p)`
  is finite étale and faithfully flat (roots `±√p` distinct) with no `ℚ_p`-algebra map to `ℚ_p`,
  since `p` has odd valuation. A complete field is not enough; `ℂ_p` passes because it is
  separably closed.
- *test_strictlyHenselian* (computation) — a henselian local ring with separably closed residue
  field has no nonsplit finite étale covers (a finite étale algebra over it is a product of local
  factors with trivial residue extension, each isomorphic to the ring); `𝒪_{ℂ_p}` and the
  nonreduced `ℂ_p[ε]/(ε²)` are instances, so the notion is not confined to fields or to reduced
  rings.
- *test_zero* (degenerate) — the zero ring has no nonsplit finite étale covers: every finite étale
  algebra over it is the empty product.
- *test_not_rat* (non-example) — `¬ IsFiniteEtaleSplit ℚ`: `ℚ[X]/(X² − 2)` is finite étale and
  faithfully flat over `ℚ` but has no `ℚ`-algebra map to `ℚ`.
- *test_zero_algebra_has_no_section* (non-example) — over a nonzero ring `R` with no nonsplit
  finite étale covers, the zero algebra is finite étale and totally split (`m = 0`) but has no
  `R`-algebra map to `R`; so the section criterion must be restricted to faithfully flat algebras,
  and "every finite étale algebra has a section" is the wrong definition.
- *test_pi* (computation) — for separably closed fields `K_1`, `K_2`, the ring `K_1 × K_2` has no
  nonsplit finite étale covers.
- *test_exists_root* (characterisation) — if `IsFiniteEtaleSplit R`, `P ∈ R[X]` is monic of degree
  `≥ 1` and `P′` is a unit in `R[X]/(P)`, then `∃ r ∈ R, P(r) = 0`; this is the only form in which
  the proof of [ECD] §15, Lem. 15.3 uses the hypothesis.

### A4.2 finite étale torsors

**Finite étale `G`-torsors of commutative rings.** (*finite-etale-galois-torsor*) Let `G` be a
finite group, `A` a commutative ring and `B` a commutative `A`-algebra on which `G` acts on the
left by `A`-algebra automorphisms (Mathlib `MulSemiringAction G B` with `SMulCommClass G A B`).
`B` is a *finite étale `G`-torsor over `A`* if `B` is finite étale and faithfully flat over `A` and
the Galois map `γ : B ⊗_A B → Map(G, B) = ∏_{g∈G} B`, `γ(b ⊗ b′)(g) = b·g(b′)`, is bijective
(geometrically, `Spec B → Spec A` is a torsor under the constant finite group scheme `G`);
faithful flatness is part of the definition, which excludes `B = 0` over `A ≠ 0`, and given it,
finiteness and étaleness also follow from the bijectivity of `γ` by faithfully flat descent. On
spectra the component `g` of `γ` sends `x ∈ Spec B` to `(x, g⁻¹·x)` for the action
`(g·y)(b) = y(g⁻¹b)` of the Conventions. Consequences: `B` is finite projective of constant rank
`|G|`; `A → B` is injective (Mathlib `Module.FaithfullyFlat.faithfulSMul`,
`FaithfulSMul.algebraMap_injective`) and `B^G = A` (Mathlib `Algebra.IsInvariant A B G`); if
`A ≠ 0` the action is faithful, so Mathlib's `IsGaloisGroup G A B` holds, whereas over the zero
ring the zero algebra is a torsor under every finite group; and `γ` iterates to
`B^{⊗(k+1)} ≅ Map(G^k, B)` for `k ≥ 0`, of which `k = 0, 1, 2` give the finite-level rings of the
cover, its fibre square and its fibre cube used for descent (*finite-etale-invariance-along-tower*
(ii)). For `A = K` a field and `B` a field, `B` is a `G`-torsor over `K` iff `B/K` is a finite
Galois extension and `G → Gal(B/K)` is an isomorphism. Define `Algebra.galoisTensorMap G A B` (the
`B`-algebra map `γ`, for any group action), the class `Algebra.IsFiniteEtaleTorsor G A B`,
`galoisMap` (the `B`-algebra isomorphism `B ⊗[A] B ≃ₐ[B] (G → B)`, `b ⊗ b′ ↦ (g ↦ b * g • b′)`)
and `iterGaloisMap` (`B^{⊗(k+1)} ≃ₐ (G^k → B)`, specified in vertex coordinates by
`iterGaloisMap_tprod`: `b₀ ⊗ ⋯ ⊗ b_k ↦ ((g_i) ↦ b₀ ∏ᵢ gᵢ(b_{i+1}))`, which determines its
compatibility with the face maps); prove `trivial` (`Map(G, A)` with `(h·f)(g) = f(gh)` is a
`G`-torsor over `A`), `tensor` (`B ⊗[A] B′` is a `(G × G′)`-torsor for the factorwise action when
`B` is a `G`-torsor and `B′` a `G′`-torsor), `baseChange` (`A′ ⊗[A] B` is a `G`-torsor over `A′`
for every ring map `A → A′`, with `G` acting on the right factor), `isInvariant`
(`Algebra.IsInvariant A B G`), `isGaloisGroup` (`IsGaloisGroup G A B` for `A` nontrivial),
`rankAtStalk_eq_card` (`B` is finite projective with `Module.rankAtStalk B p = Fintype.card G` at
every prime `p`), `of_surjective` (for `π : G′ ↠ G` surjective and an `A`-algebra map
`ι : B → B′` from a `G`-torsor to a `G′`-torsor with `g′·ι(b) = ι(π(g′)·b)`, `B′` is a
`(ker π)`-torsor over `B`, hence `ι` is faithfully flat and injective) and `iff_isGalois` (for
fields `K ⊆ L` with `G` acting on `L`, `IsFiniteEtaleTorsor G K L ↔ IsGalois K L ∧ G ≃* (L ≃ₐ[K] L)`
via the action) ([ECD] §15, Lem. 15.3, p. 90; [Berkeley] Lecture 10, proof of Lem. 10.1.6, p. 75
(the levels as torsors under an inverse system of finite groups); [ECD] §15, proof of Prop. 15.4,
p. 91 (the torsor `A → A_i` which D6 turns into a `G_i`-torsor of v-sheaves)). PerfectoidTowers
layer P9's *finite-galois-descent-of-modules* works with the unbundled Galois condition (its
hypotheses are finite étaleness, the injectivity of `A → B` and the bijectivity of
`galoisTensorMap`, from which it derives faithful flatness and `B^G = A`) and owns the
preservation and reflection of ranks and the descent equivalence between `A`-modules and
`B`-modules with semilinear `G`-action; PerfectoidSpaces imports this roadmap and cites
`galoisTensorMap`. `isInvariant` is the bundled-class form of P9's fixed-ring statement, and the
class with `isGaloisGroup`, `of_surjective`, `tensor` and `iterGaloisMap` is the content here.
*Needs:* Mathlib `Algebra.Etale`, `Module.Finite`, `Module.FaithfullyFlat`, `Module.Projective`,
`Algebra.TensorProduct.lift`, `MulSemiringAction.toAlgHom`,
`Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`,
`Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`, `comonadicExtendScalars`,
`Algebra.IsInvariant`, `IsGaloisGroup`, `PiTensorProduct`.

Lean: `Algebra.galoisTensorMap`, the class `Algebra.IsFiniteEtaleTorsor` (finite étale, faithfully
flat, bijective Galois map) and `Algebra.IsFiniteEtaleTorsor.iff_isGalois`; the rest is README only.

**Checks.**

- *galois_zero* (degenerate) — the zero-fold group product gives `b₀ ↦ b₀`.
- *galois_one* — `b₀ ⊗ b₁` is the function `g ↦ b₀·g(b₁)`.
- *galois_two* — vertex coordinates give `b₀ ⊗ b₁ ⊗ b₂ ↦ ((g,h) ↦ b₀·g(b₁)·h(b₂))`;
  the last factor uses `h`, not `gh`. In general `iterGaloisMap_tprod` specifies
  `b₀ ∏ᵢ gᵢ(bᵢ₊₁)` on every pure tensor and hence determines the algebra map.
- *galois_faces_two* — inserting `1` in each of the three tensor positions gives, in order,
  `g(a·(g⁻¹h)(b))`, `a·h(b)`, and `a·g(b)`. Thus deleting the zeroth vertex rebases the
  remaining vertices by `g⁻¹`; deleting another vertex omits its coordinate.
- *galois_convention_three* (computation) — on the regular `ℤ/3`-torsor `Map(ℤ/3, ℚ)` with
  `(h·f)(g) = f(g + h)`, `γ(δ₀ ⊗ δ₁)` is `δ₀` at `g = 1` and `0` at `g = 2`: the component `g`
  pairs the point `x` with `x + g = g⁻¹·x`, which is the convention `(g, x) ↦ (x, g⁻¹·x)`; the
  opposite convention would give the support `g = 2`.
- *test_gaussian_half* (computation) — `ℤ[1/2][i]` with complex conjugation is a `(ℤ/2)`-torsor
  over `ℤ[1/2]`.
- *test_not_gaussian* (non-example) — `ℤ[i]` with complex conjugation is not a `(ℤ/2)`-torsor over
  `ℤ`: the Galois map `ℤ[i] ⊗ ℤ[i] → ℤ[i] × ℤ[i]`, `c + d·(1 ⊗ i) ↦ (c + di, c − di)`, has image
  `{(a, b) : a − b ∈ 2ℤ[i]}` and cokernel `ℤ[i]/2ℤ[i]`, of order `4`, reflecting ramification
  at `2` (the fibre at `2` is `𝔽_2[X]/((X + 1)²)`, on which conjugation is trivial); over `ℤ[1/2]`
  the same map is bijective (check *test_gaussian_half*).
- *test_trivial_action* (non-example) — `A × A` with the trivial action of `ℤ/2` is not a
  `(ℤ/2)`-torsor over a nonzero `A`: the image of `γ` consists of constant functions.
- *test_swap* (computation) — `A × A` with `ℤ/2` exchanging the factors is a `(ℤ/2)`-torsor over
  every `A`, including the zero ring and characteristic `2`: it is the trivial torsor.
- *test_sign_rat* (computation) — `X ↦ −X` makes `ℚ[X]/(X² − 1) ≅ ℚ × ℚ` a `(ℤ/2)`-torsor (the
  factors are exchanged).
- *test_sign_char_two* (non-example) — over `𝔽_2` the same formula is the trivial action on the
  non-étale `𝔽_2[X]/((X + 1)²)`, which is not a torsor: the sign construction needs `2`
  invertible.
- *test_trivial_group* (degenerate) — for the trivial group, `B` is a torsor over `A` iff `A → B`
  is an isomorphism.
- *test_zero_ring* (degenerate) — over the zero ring the zero algebra is a `G`-torsor for every
  finite `G`, and a nontrivial `G` does not act faithfully on it; this is why `isGaloisGroup`
  assumes `A` nontrivial.
- *test_isGalois* (compatibility) — for a finite Galois extension `L/K`,
  `IsFiniteEtaleTorsor (L ≃ₐ[K] L) K L`, and it implies Mathlib's `IsGaloisGroup (L ≃ₐ[K] L) K L`;
  `B^{⊗2} ≅ Map(G, B)` is the classical `L ⊗_K L ≅ ∏_{σ∈Gal(L/K)} L`.

### A4.3 the finite étale torsor tower

**Finite étale algebras over a filtered colimit come from a finite level.**
(*finite-etale-algebras-filtered-colimit*) Let `(R_i)_{i∈I}` be a directed system of commutative
rings, `I` nonempty and directed and no finiteness or noetherian hypothesis on the `R_i`, with
colimit `R = colim R_i` (Mathlib `Ring.DirectLimit`). (a) Every finite étale `R`-algebra `S` is
isomorphic to `S_i ⊗_{R_i} R` for some `i` and some finite étale `R_i`-algebra `S_i`. (b) For
finite étale `R_i`-algebras `S_i`, `T_i` the natural map
`colim_{j≥i} Hom_{R_j}(S_i ⊗_{R_i} R_j, T_i ⊗_{R_i} R_j) → Hom_R(S_i ⊗_{R_i} R, T_i ⊗_{R_i} R)`
is bijective. Hence base change is an equivalence of categories `2-colim_i FÉt(R_i) ≅ FÉt(R)`,
compatible with tensor products, and a finite étale `R_i`-algebra that becomes faithfully flat,
acquires an `R`-algebra section, or becomes totally split (*finite-etale-split-ring*) over `R`
already does so over some `R_j` (the rank-zero idempotent, the section and the splitting
isomorphism each descend). Prove object descent as `Ring.DirectLimit.finiteEtale_essSurj`, and
morphism descent and eventual equality for maps from a finite étale algebra into a directed
colimit of algebras, which gives (b) when applied over `R_i` to the
system `T_i ⊗_{R_i} R_j`, `j ≥ i` ([KL I] §1.2, Rem. 1.2.9, p. 15). The index set must be
nonempty: the colimit of the empty system is `ℤ`, and `ℤ × ℤ` comes from no stage. *Needs:*
Mathlib `Ring.DirectLimit`, `DirectLimit`, `Algebra.Etale`, `Module.Finite`,
`Module.FaithfullyFlat`; *finite-etale-split-ring*. README only (no Lean declaration).

**Every finite étale algebra is split by a finite étale torsor.**
(*splitting-torsor-of-finite-etale-algebra*) Let `A` be a commutative ring and `S` a finite étale
`A`-algebra (finite, flat, finitely presented, unramified). There are a finite group `G` and a
finite étale `G`-torsor `A → P` (*finite-etale-galois-torsor*) such that `S ⊗_A P` is totally
split over `P`. Explicitly, let `n` be the maximal rank of `S` and `e_k ∈ A` the idempotent of the
locus where `S` has rank `k`; replace `S` by `S′ := S × ∏_{k<n} (A/(1 − e_k))^{n−k}`, finite étale
of constant rank `n`; let `δ ∈ S′ ⊗_A S′` be the idempotent with `(S′ ⊗_A S′)δ ≅ S′` via
multiplication (Mathlib `Algebra.TensorProduct.lmul'`), `δ_{ab}` (`1 ≤ a < b ≤ n`) its image in
`S′^{⊗n}` under the `(a, b)`-th coprojection, and `ε := ∏_{a<b}(1 − δ_{ab})`; then one may take
`G = S_n` (Mathlib `Equiv.Perm (Fin n)`) permuting the tensor factors and `P = ε·S′^{⊗n}`, the
algebra of ordered `n`-tuples of pairwise distinct points in the fibres of `S′`: on geometric
fibres `P ⊗ k ≅ k^{S_n}`, and the universal frame `S′ ⊗_A P → P^n` is an isomorphism. Prove this as
`Algebra.exists_isFiniteEtaleTorsor_isTotallySplit` (compare [Stacks] Tag 0BN2, Lem. 58.3.8 for
connected objects in a Galois category; [KL I] §1.4, Rem. 1.4.7(c), p. 22 (a faithfully finite
étale splitting cover, which the torsor refines); [ECD] §15, proof of Lem. 15.3, p. 90, which calls
the construction of the tower standard).
This is the ring-theoretic form of the Galois-closure construction for Galois categories, needed
because `Spec A` may be disconnected. For `A = ℚ` and `S = ℚ(∛2)`, `n = 3` and `P` is the
`S_3`-torsor `ℚ(∛2, ζ_3)` of rank `6 = 3!`, the Galois closure; for `S = A × A`, `n = 2` and
`P ≅ A × A` with `S_2` exchanging the factors, the trivial torsor. *Needs:*
*finite-etale-galois-torsor*; *finite-etale-split-ring*; Mathlib `Module.rankAtStalk`,
`Algebra.TensorProduct.lmul'`, `Equiv.Perm`, `Algebra.Etale.comp`, `Algebra.Etale.baseChange`,
`IsIdempotentElem`, `IsSepClosed`.

Lean: `Algebra.exists_isFiniteEtaleTorsor_isTotallySplit` (existence of a finite group `G` and a
finite étale `G`-torsor `P` with `S ⊗_A P` totally split); the rest is README only.

**The finite étale torsor tower.** (*finite-etale-torsor-tower*) Let `A` be an arbitrary
commutative ring; the tower is purely algebraic. A *finite étale torsor tower* over `A` consists of
a nonempty directed set `I`; for `i ∈ I` a finite group `G_i` and an `A`-algebra `A_i` with a
`G_i`-action making it a finite étale `G_i`-torsor over `A` (*finite-etale-galois-torsor*); for
`i ≤ j` a surjective homomorphism `π_{ij} : G_j → G_i` and an `A`-algebra homomorphism
`ι_{ij} : A_i → A_j` with `ι_{ij}(π_{ij}(g)·a) = g·ι_{ij}(a)`, both functorial in `i ≤ j ≤ k`
(`π_{ii} = id`, `π_{ik} = π_{ij} ∘ π_{jk}`, and likewise for `ι`); such that the direct limit
`A_∞ := colim_i A_i` (Mathlib `Ring.DirectLimit`) has no nonsplit finite étale covers
(*finite-etale-split-ring*). Its group is the profinite group `G := lim_i G_i` (Mathlib
`ProfiniteGrp`), which acts on `A_∞` by `A`-algebra automorphisms with open stabilisers. Every ring
has a tower: choose a set `T` of representatives of the isomorphism classes of finite étale
`A`-algebras and, for each `S ∈ T`, a splitting torsor `A → P(S)` under a finite group `G(S)`
(*splitting-torsor-of-finite-etale-algebra*); index by the finite subsets `F ⊆ T` ordered by
inclusion, with `G_F := ∏_{S∈F} G(S)`, `A_F := ⊗_{S∈F} P(S)` (tensor product over `A`;
`A_∅ = A`, `G_∅ = 1`), `π` the projections and `ι` the inclusions of tensor factors. A finite étale
`A_∞`-algebra `C` is `A_∞ ⊗_{A_F} C_F` for some `F` and some finite étale `A_F`-algebra `C_F`
(*finite-etale-algebras-filtered-colimit*); as `A_F` is finite étale over `A`, `C_F` is a finite
étale `A`-algebra, isomorphic to some `S ∈ T`; with `F′ = F ∪ {S}`, the algebra `C_F ⊗_{A_F} A_{F′}`
is a direct factor of `C_F ⊗_A A_{F′} ≅ S ⊗_A A_{F′}` (the multiplication `A_F ⊗_A A_{F′} → A_{F′}`
splits off a factor, `A_F` being unramified), which is totally split, so `C` is totally split
(by the stability of total splitting in *finite-etale-split-ring*). Define the structure `FiniteEtaleTorsorTower A`
(`I`, `G_i`, `A_i` with torsor structure, `π_{ij}`, `ι_{ij}`, equivariance, functoriality, and
`IsFiniteEtaleSplit` of the direct limit). The structure
`FiniteEtaleTorsorTower.FiniteSubsetPresentation` records an order isomorphism from the index
set to the finite subsets of a small set of pairwise nonisomorphic representatives, the
singleton splitting property, the tensor and group-product identifications, and their
compatibility with transitions and actions. A theorem supplies such a tower and presentation;
`FiniteEtaleTorsorTower.nonempty_tower` states existence of a tower over every commutative ring.
Define `FiniteEtaleTorsorTower.canonical A` by `Classical.choice` of the former existence
theorem, retaining its presentation;
define `colim` (the `A`-algebra `A_∞` with the maps `toColimRingHom i : A_i → A_∞`
and `toColim i : A_i →ₐ[A] A_∞`), `group` (`G = lim_i G_i` as a `ProfiniteGrp`) with the
projections `toLevelGroup i : G → G_i`, and `colimAction` (the `MulSemiringAction` of `G` on
`A_∞`); prove `toLevelGroup_surjective`, `toLevelGroup_limit` (the projections embed `G`, as a
topological space, onto the compatible tuples in `∏_i G_i` with each `G_i` discrete),
`colimAction_spec` (`G` acts by `A`-algebra automorphisms, `toColim i` is equivariant along
`G → G_i`, and every element has an open stabiliser), the instance
`IsFiniteEtaleSplit A_∞` (the defining axiom), `exists_level_totallySplit` (every
finite étale `A`-algebra becomes totally split over some `A_i`), `transition_isFiniteEtaleTorsor`
(for `i ≤ j`, `A_j` is a `(ker π_{ij})`-torsor over `A_i`, so all transition maps are injective and
faithfully flat), the invariance (`Algebra.IsInvariant A A_∞ G`, i.e. `(A_∞)^G = A`, and
`IsGaloisGroup G A A_∞` for `A` nontrivial), `colimTensorEquiv`
(`A_∞ ⊗[A] A_∞ ≃ₐ LocallyConstant G A_∞`, onto the locally constant maps, Mathlib
`LocallyConstant`) with `colimTensorEquiv_tmul` (`a ⊗ b ↦ (g ↦ a * g • b)`), `faithfullyFlat_colim`
(`A_∞` is a faithfully flat, ind-étale `A`-algebra) and `baseChange` (for `A → A′`, each
`A′ ⊗_A A_i` is a finite étale `G_i`-torsor over `A′`, the levelwise case of
`Algebra.IsFiniteEtaleTorsor.baseChange`; the base-changed system need not be a tower, since
`A′ ⊗_A A_∞` need not be split: for `A = ℚ`, `A_∞ = ℚ̄` and `A′ = ℚ(t)` it is `ℚ̄(t)`) ([ECD] §15,
Lem. 15.3, p. 90, whose proof calls the existence standard; [Berkeley] Lecture 10, proof of
Lem. 10.1.6, p. 75 (the torsor refinement of a filtered system of finite étale algebras)). The
canonical tower exists for every ring, including rings with infinitely many idempotents; `G_i`
acts on the left, `π_{ij}` goes from the larger index to the smaller, and no topology is involved
(the topological completion is *completed-tower-pair*). *Needs:* *finite-etale-galois-torsor*;
*finite-etale-split-ring*; *finite-etale-algebras-filtered-colimit*;
*splitting-torsor-of-finite-etale-algebra*; Mathlib `Ring.DirectLimit`, `ProfiniteGrp`,
`LocallyConstant`, `Algebra.Etale.comp`, `Algebra.IsInvariant`.

Lean: `FiniteEtaleTorsorTower` (the structure; the splitting of the direct limit is a field),
`FiniteEtaleTorsorTower.colim`, `FiniteEtaleTorsorTower.nonempty_tower` and
`FiniteEtaleTorsorTower.exists_level_totallySplit`; the rest is README only.

**Checks.**

- *limit_group_extra_factor* — If all finite groups of a tower are trivial, its actual `group` has no group equivalence to ℤ/2.
- *tower_group_no_extra_factor* — A tower with trivial finite groups has no two distinct elements of its actual limit group with the same finite projections.
- *colimit_action_moves* (non-example for the trivial action) — over a nonzero base, an element
  of `G` whose image in `G_i` is not `1` moves some element of `toColim i (A_i)`, since `G_i` acts
  faithfully on the torsor `A_i` and `toColim i` is injective.
- *test_finiteField* (computation) — over `𝔽_p` there is a tower whose colimit is
  isomorphic as a ring to its algebraic closure (levels `𝔽_{p^{n!}}`, groups `ℤ/n!`).
- *test_trivial* (degenerate) — if `A` has no nonsplit finite étale covers (a separably closed
  field, or the zero ring), there is a tower whose colimit is isomorphic to `A` as an `A`-algebra
  (one level, the trivial group).
- *test_not_cyclotomic* (non-example) — over `ℚ_p`, the cyclotomic system `A_n = ℚ_p(μ_{p^n})` with
  `G_n = (ℤ/p^n)^×` is a compatible system of finite étale torsors with surjective transitions, but
  it is not a tower: its colimit has the nonsplit finite étale cover given by the unramified
  quadratic extension.
- *test_field_residue* (compatibility) — for any tower over a field `K`, every residue field of
  `A_∞` at a prime is a separable closure of `K` (Mathlib `IsSepClosure K`).
- *test_exists_level_split* (characterisation) — for every tower over `A` and every finite étale
  `A`-algebra `S` there is `i` with `A_i ⊗_A S` totally split over `A_i`.

### A4.4 uniformization does not change spectra or finite étale algebras

**Invariance under uniformization.** (*uniform-completion-etale-comparison*) Let `(A, A⁺)` be a
Huber pair (Tau Ceti `Huber.Pair`) with `A` a complete Hausdorff Tate ring and `A⁺` any ring of
integral elements, and let `ι : (A, A⁺) → (A^u, A^{u+})` be its uniformization (AdicSpacesPartII
layer R0: `A^u` is the separated completion of `A` for its spectral seminorm, `A^{u+}` the
closure of the image of `A⁺`; [KL I] §2.8, Def. 2.8.13, p. 63; the ring map `A → A^u` does not
depend on `A⁺`). Finite étale means finite étale as rings, with the natural topology on `B`. Then:

```text
(i)   Spa(ι) : Spa(A^u, A^{u+}) → Spa(A, A⁺) is a homeomorphism under which rational
      subsets correspond        (AdicSpacesPartII layer R0, uniformization, clause (d));
(ii)  FÉt(A) → FÉt(A^u), B ↦ B ⊗_A A^u, is an equivalence of categories;
(iii) for B ∈ FÉt(A) with its Huber pair (B, B⁺) (natural topology, B⁺ the integral
      closure of A⁺), the pair (B ⊗_A A^u, integral closure of A^{u+}) with its natural
      topology is uniform and is the uniformization of (B, B⁺);
(iv)  A has no nonsplit finite étale covers iff A^u has none.
```

Being base change, the functor in (ii) is compatible with tensor products; being an equivalence,
it induces bijections `Hom_A(B, A) ≅ Hom_{A^u}(B ⊗_A A^u, A^u)` and between the idempotents of
`A` and of `A^u` (the maps from `A × A`), hence preserves and reflects faithful flatness, which
is how (iv) follows from (ii). Clause (i) is AdicSpacesPartII's
`Huber.Pair.uniformization.spaComap_homeomorph` and
`Huber.Pair.uniformization.spaComap_preimage_rationalSubset`, cited and not restated. Prove (ii)
as `Huber.Pair.uniformization.baseChange_finiteEtale_equivalence` (essential surjectivity and full
faithfulness), (iii) as `Huber.Pair.uniformization.finiteEtale_uniformization` (a homeomorphic
ring isomorphism `A^u ⊗_A B ≅ B^u` sending `1 ⊗ b` to `ι_B(b)` and the integral closure of
`A^{u+}` onto `B^{u+}`) and (iv) as `Huber.Pair.uniformization.isFiniteEtaleSplit_iff` ([KL I]
§2.8, Def. 2.8.13, p. 63 for (i); [KL I] §2.8, Prop. 2.8.16(a), p. 64 for (ii); [KL I] §2.8,
Prop. 2.8.16(b), pp. 64–65 for the uniformity in (iii); [ECD] §15, Lem. 15.3, p. 90 for the
uniform completion whose finite étale algebras this controls). Kedlaya–Liu prove (ii) through
affinoid systems; the same equivalence follows from the topologically henselian comparison,
since the spectral topology has ring of definition `A°`, which is henselian along `ϖ` when `A` is
complete (*power-bounded-henselian-along-pseudouniformizer*), with completion `A^u`. By owner: (i)
is AdicSpacesPartII layer R0's *uniformization* (d); (ii) is the instance of PerfectoidSpaces
layer P3's *henselian-finite-etale-approximation* (b) for `A` with its spectral topology (whose
ring of definition `A°` is henselian along `ϖ`, P3's *henselian-pairs-colimits-and-completions*
(c)), stated here because PerfectoidSpaces imports this roadmap; the uniformity in (iii) is P3's
*finite-etale-over-uniform-is-uniform*; (iv) is the base-change invariance of
*finite-etale-split-ring* applied to (ii); and that `B ⊗_A A^u` is the uniformization of
`(B, B⁺)` is the content here. Completeness is essential: the non-complete Tate ring `ℚ_p[T]`
(ring of definition `ℤ_p[T]`, `p`-adic topology) has uniformization `ℚ_p⟨T⟩`, and
`ℚ_p⟨T⟩[X]/(X^p − X − T/p)` is finite étale (discriminant `±(pT^{p−1} − (p−1)^{p−1})` for `p` odd
and `1 + 2T` for `p = 2`, a unit on the disc since `|pT^{p−1}| < 1 = |(p−1)^{p−1}|`) but is not
the base change of a finite étale `ℚ_p[T]`-algebra: its fibre over `T = 0` splits while over
`T = p` it is the unramified extension of degree `p`, whereas finite étale `ℚ_p[T]`-algebras are
products of rings `L[T]`, whose fibres at `0` and `p` agree. For `A` uniform the theorem is
trivial, `ι` being an isomorphism; for `A` not uniform `ι` need not be injective
(check *uniformization_dualNumbers*).
*Needs:* AdicSpacesPartII layer R0 (uniformization, spectral seminorm, spectral topology, Tate
ring norm); AdicEtaleGeometry layer A1 (*finite-etale-affinoid-algebra*,
*affinoid-system-approximation*, *finite-etale-approximation*);
*power-bounded-henselian-along-pseudouniformizer*; PerfectoidSpaces layer P3;
*finite-etale-split-ring*; Tau Ceti `Huber.Pair`, `Huber.IsTateRing`,
`Huber.powerBoundedSubring`; Mathlib `Algebra.Etale`, `Module.FaithfullyFlat`, `HenselianRing`. README only (no Lean declaration).

**Checks.**

- *uniformization_dualNumbers* (compatibility) — for the complete, non-uniform Tate ring
  `A = ℚ_p[ε]/(ε²)` (topology of `ℚ_p²`), the kernel of `ι : A → A^u = ℚ_p` is the nilpotent ideal
  `(ε)` and `(A, (ε))` is henselian, so the equivalence (ii) is reduction modulo `ε`: for example
  `A[X]/(X² − p)` and `ℚ_p(√p)` correspond, and, as (iv) requires, neither `A` nor `A^u = ℚ_p` is
  split (check *test_not_Qp*).

### A4.5 the completed tower and its finite étale data

**The completed torsor tower.** (*completed-tower-pair*) Let `(A, A⁺)` be a Huber pair with `A`
a complete Hausdorff Tate ring and `A⁺` a ring of integral elements, `ϖ ∈ A` a pseudouniformizer,
and `T` a finite étale torsor tower over the ring `A` (*finite-etale-torsor-tower*) with levels
`A_i`, groups `G_i` and `G = lim G_i`. (a) Levels: `(A_i, A_i⁺)` is the Huber pair of
AdicEtaleGeometry layer A1 (*finite-etale-affinoid-algebra*: `A_i` with its natural topology as a
finite projective `A`-module, a complete Tate ring; `A_i⁺` the integral closure of `A⁺` in `A_i`);
the transition maps `ι_{ij}` and the action of `G_i` are morphisms of Huber pairs. (b) Colimit:
`A_∞ = colim A_i` carries the unique ring topology in which `A_∞^♮ := colim_i A_i°` (`A_i°` the
power-bounded subring, Tau Ceti `powerBoundedSubring`) is open and carries its `ϖ`-adic topology;
with `A_∞⁺ := colim_i A_i⁺` this is a Tate Huber pair `(A_∞, A_∞⁺)` with ring of definition
`A_∞^♮`, and it is *uniform*: `A_∞° ⊆ ϖ⁻¹·A_∞^♮`, since for power-bounded `x` the element `ϖx` is
topologically nilpotent, so `(ϖx)^n ∈ A_∞^♮` for some `n`, a monic equation over
`colim A_i°`, which is integrally closed in `A_∞` (each `A_i°` is integrally closed in `A_i`).
(c) Completion: the completed tower pair `(Â_∞, Â_∞⁺)` is the uniformization (AdicSpacesPartII
layer R0) of `(A_∞, A_∞⁺)`; since `A_∞` is uniform it is the Hausdorff completion (Tau Ceti
`IsTateRing.completion`), `Â_∞` is a complete uniform Tate ring and `Â_∞⁺` is the closure of the image of `colim_i A_i⁺` — this
is [ECD]'s uniform completion `Â_∞` of `A_∞` with `Â_∞⁺` the closure of `lim A_i⁺`. (d) `G` acts
on `(Â_∞, Â_∞⁺)` by automorphisms of Huber pairs over `(A, A⁺)`, continuously: the action map
`G × Â_∞ → Â_∞` is continuous for the profinite topology of `G`. (e) Universal property: for every
complete Hausdorff Huber pair `(B, B⁺)` with `B°` bounded, morphisms of Huber pairs
`(Â_∞, Â_∞⁺) → (B, B⁺)` correspond bijectively to families of morphisms `(A_i, A_i⁺) → (B, B⁺)`
compatible with the `ι_{ij}`. In `FiniteEtaleTorsorTower`, define `levelPair` (the Huber pair
`(A_i, A_i⁺)` with transition morphisms and the `G_i`-action by pair automorphisms), `colimPair`
(the Tate Huber pair `(A_∞, A_∞⁺)` with ring of definition `colim A_i°` and the `ϖ`-adic topology
on it), `completion T P` for `P = (A, A⁺)` (the completed tower pair, the uniformization of
`colimPair`), `toCompletion` (the morphisms `(A_i, A_i⁺) → (Â_∞, Â_∞⁺)`, compatible with
transitions and with `G → G_i`), `completionAction_toCompletion` (the completed action
on the image of every level), `completionAction` (the action of `G` on `(Â_∞, Â_∞⁺)` by pair
automorphisms over `(A, A⁺)`, with continuous action map `G × Â_∞ → Â_∞`) and `completion.lift`
(a compatible family of morphisms `(A_i, A_i⁺) → (B, B⁺)` into a complete Hausdorff pair with `B°`
bounded lifts to `(Â_∞, Â_∞⁺) → (B, B⁺)`); prove `colimPair_isUniform`
(`A_∞° ⊆ ϖ⁻¹·colim A_i°`; in particular `A_∞°` is bounded and the identity of `A_∞` is a
homeomorphism onto its spectral topology), `completion_eq_completion` (the uniformization of
`colimPair` is its Hausdorff completion, Mathlib `UniformSpace.Completion` and Tau Ceti
`IsTateRing.completion`), `completion.lift_comp_toCompletion` (`lift f ∘ toCompletion i = f i`)
and `completion.hom_ext` (two morphisms out of `(Â_∞, Â_∞⁺)` into a Hausdorff pair that agree
after every `toCompletion i` are equal). The levels are Tate by A1's `Huber.isTateRing_moduleTopology`
(`level_isTateRing` registers it for `T.level i` with its natural topology). Three clauses of (c)
are supplier statements applied to `colimPair` and are cited, not restated: `Â_∞⁺` is the closure
of the image of `colim A_i⁺` (AdicSpacesPartII `Huber.Pair.uniformization.plus_eq_closure`),
`Â_∞` is a Tate ring (Tau Ceti instance `Huber.IsTateRing.completion`, through AdicSpacesPartII
`SpectralTop.isTateRing`) and `Â_∞°` is bounded (AdicSpacesPartII
`Huber.Pair.uniformization.isBounded_powerBoundedSubring`); completeness and Hausdorffness are
those of `UniformSpace.Completion`. The topology is specified by
`colimTopology_hasBasis`: the neighbourhoods of zero have basis `ϖ^n·colim A_i°`, `n ≥ 0` ([Berkeley] Lecture 10, Lem. 10.1.6, p. 75
(the topology on the colimit `A_∞`); [ECD] §15, Lem. 15.3, p. 90 (the uniform completion of
`A_∞`); [ECD] §15, Prop. 15.4, p. 90 (the plus rings: `A_i⁺` the integral closure of `A⁺`, `Â_∞⁺`
the closure of `lim A_i⁺`)). The adicity needed by `uniformCompletedTensor_completion_equiv` follows from the supplied
`IsAdicHom.of_isTateRing` applied to `completionStructureHom`; preservation of the plus ring
is the `Pair.Hom.map_mem_plus` field. The colimit topology is that of the Berkeley lectures (`colim A_i°`
open and bounded), not the colimit of chosen rings of definition; completeness of `A` is a
hypothesis, needed for the levels in (a) and for *finite-etale-invariance-along-tower*. *Needs:*
*finite-etale-torsor-tower*; AdicEtaleGeometry layer A1 (*finite-etale-affinoid-algebra*);
AdicSpacesPartII layer R0 (uniformization, uniform completed tensor product); Tau Ceti
`Huber.Pair`, `Huber.Pair.Hom`, `Huber.IsTateRing`, `Huber.IsTateRing.completion`,
`Huber.powerBoundedSubring`, `TauCeti.Huber.isOpen_powerBoundedSubring`, `Huber.IsRingOfIntegralElements`,
`TauCeti.Huber.mem_of_isTopologicallyNilpotent_of_isIntegrallyClosedIn`; Mathlib
`UniformSpace.Completion`, `Ring.DirectLimit`, `IsIntegrallyClosedIn`, `ProfiniteGrp`. README only (no Lean declaration).

**Checks.**

- *completion_test_Qp* (computation) — for `(ℚ_p, ℤ_p)` and a tower of finite Galois field
  extensions exhausting `ℚ̄_p` (a valid tower, the colimit being separably closed),
  `(Â_∞, Â_∞⁺) ≅ (ℂ_p, 𝒪_{ℂ_p})`.
- *completion_test_trivial* (degenerate) — for a tower all of whose groups are trivial over a
  complete uniform `(A, A⁺)` (such a tower exists exactly when `A` has no nonsplit finite étale
  covers), the structure map `(A, A⁺) → (Â_∞, Â_∞⁺)` is a homeomorphic ring isomorphism carrying
  `A⁺` onto `Â_∞⁺`.
- *completion_test_not_colim* (non-example) — the completion step cannot be omitted: for the
  `ℚ_p` tower above, `A_∞ = ℚ̄_p` is not complete, and
  `colim A_i⁺ = 𝒪_{ℚ̄_p}` is not closed in `ℂ_p`
  (the plus ring is its closure `𝒪_{ℂ_p}`), so both completion steps are needed.
- *completion_test_uniformization* (compatibility) — nilpotents in a complete Tate base
  map to zero in `Â_∞`, including when the base is not uniform.
- *completion_test_lift* (characterisation) — morphisms `(Â_∞, Â_∞⁺) → (ℂ_p, 𝒪_{ℂ_p})` correspond
  to compatible families of morphisms `(A_i, A_i⁺) → (ℂ_p, 𝒪_{ℂ_p})`.
- *completion_plus_closure* (agreement with the library notion) — `Â_∞⁺` equals the closure of the
  image of `colim A_i⁺`, proved by AdicSpacesPartII `Huber.Pair.uniformization.plus_eq_closure`.
- *completion_tate_uniform* (agreement with the library notion) — `Â_∞` is a Tate ring with
  bounded `Â_∞°`, proved by the Tau Ceti instance and
  `Huber.Pair.uniformization.isBounded_powerBoundedSubring`.

**The uniform completed self-product of the completed tower.** (*completed-tower-self-product*)
In the situation of *completed-tower-pair* (`(A,A⁺)` complete Hausdorff Tate, `T` a finite étale
torsor tower), for every `k ≥ 0` the ring `C^0(G^k,Â_∞)` of continuous functions with
uniform convergence is complete Hausdorff uniform Tate, with ring of integral elements
`C^0(G^k,Â_∞⁺)`. For `k = 1`, the isomorphism `A_∞ ⊗_A A_∞ ≅ LC(G,A_∞)`,
`a ⊗ b ↦ (g ↦ a·g(b))` (`colimTensorEquiv` of *finite-etale-torsor-tower*), induces an
isomorphism of Huber pairs
`Â_∞ ⊗̂ᵘ_A Â_∞ ≅ (C^0(G,Â_∞), C^0(G,Â_∞⁺))`,
where continuous maps have the topology of uniform convergence. Prove
`uniformCompletedTensor_completion_equiv`, carrying `inlᵘ` and `inrᵘ` to
`s(b) = (g ↦ b)` and `t(b) = (g ↦ g·b)`.
Adicity of `A → Â_∞` follows from AdicSpacesPartII R0's `IsAdicHom.of_isTateRing`,
and plus-ring compatibility from `completionStructureHom`.
For `k = 1`, the spectrum of the function pair is `G × |Spa(Â_∞,Â_∞⁺)|`:
`(g,x)` evaluates `f` by `x(f(g))`. Hence `Spa(s)(g,x) = x` and
`Spa(t)(g,x) = g⁻¹·x` for `(h·x)(b) = x(h⁻¹b)`.
This identification uses uniform completion of the finite-level torsor tensor squares and
locally constant functions; it has no perfectoidness hypothesis.
[ECD] §15, proof of Lem. 15.6, p. 91, identifies the self-products with continuous function
rings; Prop. 15.4, p. 90 fixes the torsor presentation.
Build this target immediately after *completed-tower-pair*, before
*finite-etale-effective-descent-along-tower*.
*Needs:* *completed-tower-pair*; *finite-etale-torsor-tower*;
AdicSpacesPartII R0 (uniform completed tensor product); Mathlib
`ContinuousMap`, `LocallyConstant`, `ProfiniteGrp`. README only (no Lean declaration).

**Checks.**

- *tower_tensor_source* — `a ⊗ 1` maps to the constant function with value `a`.
- *tower_tensor_target* — `1 ⊗ b` maps to `g ↦ g·b`; its map on spectra sends `(g,x)` to `g⁻¹·x`.
- *tower_tensor_trivial* — for a trivial-group tower over a complete uniform split base,
  the tensor-square comparison is `A ⊗̂ᵘ_A A ≅ C^0({1},A) ≅ A`.

**Henselian pairs are stable under filtered colimits.** (*henselian-pairs-filtered-colimit*) For
a directed system of pairs `(R_i, I_i)` whose transition maps carry `I_i` into `I_j`, if every
`(R_i, I_i)` is henselian (Mathlib `HenselianRing`) then so is `(colim R_i, colim I_i)` (Mathlib
`Ring.DirectLimit`): `Ring.DirectLimit.henselianRing` ([Stacks] Tag 0FWT,
Lemma 15.11.13), used here for the colimit of the power-bounded subrings `A_i°` of a
directed system of complete Tate rings along a pseudouniformizer coming from the base.
The index is nonempty and the transition maps satisfy identity and composition laws.
PerfectoidSpaces P3 uses this result in *henselian-pairs-colimits-and-completions* (b).
*Needs:* Mathlib `HenselianRing`, `Ring.DirectLimit`, `DirectedSystem`. README only (no Lean declaration).

**Checks.** *henselian_colimit_constant* gives henselianity for the constant identity system.
*henselian_colimit_zero_ideal* gives henselianity along zero in the direct limit.
*henselian_zero_ring* allows the unit ideal in the zero ring, where it equals zero.

**Power-bounded elements are henselian along a pseudouniformizer.**
(*power-bounded-henselian-along-pseudouniformizer*) Let `A` be a complete Tate ring with
pseudouniformizer `ϖ`. (i) Every ring of definition `A_0` of `A` containing `ϖ` (a ring of
definition contains some power `ϖ^e`, which may replace `ϖ`) is open, hence closed, in `A`,
and its subspace topology is the `ϖ`-adic topology ([Wedhorn] §6.2, Prop. 6.14, p. 49); so `A_0`
is `ϖ`-adically complete and
separated, and `(A_0, ϖA_0)` is a henselian pair (Mathlib `IsAdicComplete.henselianRing`). (ii)
`A°` is the directed union of the rings of definition of `A` (for a ring of definition `A_0` and
`x ∈ A°`, `A_0[x]` is a ring of definition; [Wedhorn] §6.1, Cor. 6.4(3), p. 47), so `(A°, ϖA°)` is
henselian by *henselian-pairs-filtered-colimit*. (iii) The same holds for every open subring `B`
of `A°` that contains `ϖ`, with the ideal `ϖB` (an open subring contains the ring of definition
`ℤ·1 + ϖ^mA_0` for `m` large, so `B` is again the directed union of the rings of definition it
contains). Prove
`PairOfDefinition.isAdicComplete_of_completeSpace`, `PairOfDefinition.henselianRing`,
`powerBoundedSubring.henselianRing` and
`henselianRing_of_isOpen_subring`. The `ϖ`-adic completeness in (i) is what fails for `A°` itself
when `A` is not uniform: in `A = ℂ_p⟨T⟩/(T²)` the element `T` lies in `⋂_n ϖ^nA°` (every multiple
of `T` is nilpotent, hence power-bounded), so `A°` is not `ϖ`-adically separated and Mathlib's
`IsAdicComplete` does not apply to it directly; the directed-union argument (ii) is needed.
Clauses (i)–(iii) are owned here: PerfectoidSpaces layer P3 cites them as clause (c) of its
*henselian-pairs-colimits-and-completions*, whose clause (a) is Mathlib's
`IsAdicComplete.henselianRing`. The suppliers used are Tau Ceti
`isPowerBounded_iff_exists_mem_ringOfDefinition` (`A°` is the directed union of the rings of
definition, [Wedhorn] 6.4(3)) and Mathlib `IsAdicComplete.henselianRing`; the `ϖ`-adic
completeness of a ring of integral elements of a uniform complete Tate ring is the different
statement PerfectoidSpaces layer P1 *integral-elements-adically-complete*.
*Needs:* *henselian-pairs-filtered-colimit*; Mathlib `IsAdicComplete.henselianRing`,
`HenselianRing`; Tau Ceti `Huber.PairOfDefinition`, `Huber.IsPseudoUniformizer`,
`TauCeti.Huber.isOpen_powerBoundedSubring`.

Lean: `Huber.henselianRing_powerBoundedSubring` ((ii): `(A°, ϖA°)` is henselian for a
pseudouniformiser `ϖ ∈ A°`); the rest is README only.

**Checks.**

- *henselian_test_Zp* — the simple root zero of `X^p − X − p` modulo `p`
  lifts to a root in `pℤ_p`.
- *henselian_test_not_separated* (non-example) — a nilpotent `x` lies in `ϖ^n A°` for every `n`
  (`ϖ^{-n}x` is nilpotent, hence integral over `A°`); for `x = ε ≠ 0` in `ℚ_p[ε]/(ε²)` this shows
  that `A°` need not be `ϖ`-adically separated.
- *henselian_test_not_tate* (non-example) — the complete Huber ring `ℤ_p` (`p`-adic topology), like
  `ℤ_p⟦T⟧` with the `(p, T)`-adic topology, has no pseudouniformiser (its units have norm `1`), so
  it is outside the scope of this target, whose statements assume a Tate ring.
- *henselian_test_incomplete* (non-example) — for `A = ℚ_p[T]` with the `p`-adic topology on
  `ℤ_p[T]` (not complete), the pair `(ℤ_p[T], p)` is not henselian: for `p` odd, `X² − (1 + pT)`
  has the simple root `1` modulo `p`, but `√(1 + pT)` is a power series, not a polynomial, so the
  root does not lift to `ℤ_p[T]`; the finite étale `ℚ_p⟨T⟩`-algebra of
  *uniform-completion-etale-comparison* is the same phenomenon on finite étale algebras.

**Finite étale algebras are unchanged along the completed torsor tower.**
(*finite-etale-invariance-along-tower*) Let `(A, A⁺)` be a Huber pair with `A` complete Hausdorff
Tate, `T` any finite étale torsor tower over `A` and `(Â_∞, Â_∞⁺)` its completion
(*completed-tower-pair*). (i) The base change functors
`2-colim_i FÉt(A_i) → FÉt(A_∞) → FÉt(Â_∞)` are equivalences of categories, compatible with tensor
products, preserving and reflecting faithful flatness. (ii) For every `k ≥ 0` (the diamond
comparison uses `k = 0, 1, 2`), let `C^0(G^k, Â_∞)` be
the ring of continuous maps `G^k → Â_∞` (Mathlib `ContinuousMap`, topology of uniform
convergence), the completion of `colim_i Map(G_i^k, A_i) = LC(G^k, A_∞)` for the topology with
ring of definition `LC(G^k, A_∞^♮)`; then `2-colim_i FÉt(Map(G_i^k, A_i)) → FÉt(C^0(G^k, Â_∞))` is
an equivalence. (iii) `Â_∞` has no nonsplit finite étale covers (*finite-etale-split-ring*). In
short,

```text
2-colim_i FÉt(A_i) ≅ FÉt(A_∞) ≅ FÉt(Â_∞),
2-colim_i FÉt(Map(G_i^k, A_i)) ≅ FÉt(C^0(G^k, Â_∞))      (k ≥ 0),
Â_∞ has no nonsplit finite étale covers.
```

Each `A_i°` is henselian along `ϖ` (*power-bounded-henselian-along-pseudouniformizer*: `A_i` is
complete, and `A_i°` is the directed union of its `ϖ`-adically complete rings of definition), so
are the rings of definition `colim_i A_i°` and `LC(G^k, colim_i A_i°)`
(*henselian-pairs-filtered-colimit*), and the topologically henselian comparison
`FÉt(A) ≅ FÉt(Â)` ([Berkeley] Lecture 7, Thm. 7.4.8, p. 54; PerfectoidSpaces layer P3,
*henselian-finite-etale-approximation* (b), without a base field) passes from `A_∞` to its
completion; the first equivalence is *finite-etale-algebras-filtered-colimit* ([Berkeley]
Lecture 7, after Thm. 7.4.8, p. 54). Apply that henselian comparison directly to the specified colimit topology for (i),
and to the locally constant function rings for (ii); (iii) is
the splitting axiom of *finite-etale-torsor-tower* transported along (i) by
the base-change invariance of *finite-etale-split-ring*; the item records them
in the form the diamond comparison uses. The same argument gives `FÉt(colim A_i) ≅ FÉt(Â_∞)` for
any filtered system of complete Tate rings with compatible rings of definition containing the
image of `ϖ` ([Berkeley] Lecture 7, after Thm. 7.4.8, p. 54); that general form is PerfectoidSpaces
layer P3's *finite-etale-completed-direct-limit*, assembled there from P3's
*henselian-finite-etale-approximation* (b) and the two henselian statements above, and it is not a
target of this layer: here the system is a finite étale torsor tower and `A_∞` carries the
topology of *completed-tower-pair*. Prove the equivalence (i),
`completion_finiteEtale_equivalence_continuousMap` and
`completion_finiteEtale_fullyFaithful_continuousMap` for the object and morphism assertions in
(ii), and `completion_isFiniteEtaleSplit` for (iii). These are the equivalences
`(Â_∞)_fét = 2-colim (A_i)_fét`,
and their variants for `C^0(G, Â_∞)` and `C^0(G × G, Â_∞)`, that [ECD] §15, proof of Lem. 15.6,
p. 91 cites from [PS] §7, Lem. 7.5(i) and its proof, pp. 40–41, there over a perfectoid field.
*Needs:* *completed-tower-pair*; *finite-etale-torsor-tower*;
*finite-etale-split-ring*; *henselian-pairs-filtered-colimit*;
*finite-etale-algebras-filtered-colimit*; AdicEtaleGeometry layer A1
(*finite-etale-affinoid-algebra*); *power-bounded-henselian-along-pseudouniformizer*;
PerfectoidSpaces layer P3; Mathlib `HenselianRing`, `ContinuousMap`, `LocallyConstant`.

The comparison `FiniteEtaleTorsorTower.locallyConstantToContinuousMap` sends a function
`f` to `g ↦ ι(f(g))`, where `ι : A_∞ → Â_∞` is the uniformization map; this is specified by
`locallyConstantToContinuousMap_apply`. README only (no Lean declaration).

**Checks.**

- *locally_constant_value* — on `G^1`, evaluation at `g` is `ι(f(g))`.
- *locally_constant_zero_factors* — on the singleton `G^0`, the value `a` becomes `ι(a)`.
- *locally_constant_constants* — the image of a constant function has the same value at any
  two points, including for a nontrivial group.

**Finite étale algebras descend effectively along the completed torsor tower.**
(*finite-etale-effective-descent-along-tower*) In the situation of
*finite-etale-invariance-along-tower* (`(A, A⁺)` complete Hausdorff Tate, `T` a finite étale torsor
tower over `A`), base change is an equivalence from `FÉt(A)` to finite étale `Â_∞`-algebras
with continuous semilinear `G`-action extending the specified action on `Â_∞`. The topology on a
finite étale algebra is its natural module topology. Morphisms on the right are equivariant
algebra maps. In groupoid edge coordinates composition is `(g,h) ↦ gh`; vertex coordinates
instead record `(g,gh)`, as specified by `iterGaloisMap_tprod` and checked by *vertex_edge_three*.
Descent data come from a finite level (*finite-etale-invariance-along-tower*) and are
effective there by faithfully flat descent along `A → A_i` (Mathlib `comonadicExtendScalars`,
`Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`; in its finite-group form,
PerfectoidTowers layer P9's *finite-galois-descent-of-modules*); the packaging of the
continuous-`G`-action descent data over `C^0(G, Â_∞)` is the content here. Prove this for
objects, and `completion_finiteEtale_descent_hom` for the unique descent of equivariant
homomorphisms.
`completionAction_algHom` identifies every group element with an automorphism over the fixed
base map; thus equivariance uses the specified action ([ECD] §15, proof of Lem. 15.6, p. 91;
[KL I] §1.3, Thm. 1.3.4, p. 16 (effective faithfully flat descent); [KL I] §1.3, Thm. 1.3.5,
p. 16 (finite étaleness descends along faithfully flat maps)). This is the effectivity of finite
étale data along the tower that the diamond comparison needs. *Needs:*
*finite-etale-invariance-along-tower*; *finite-etale-galois-torsor*;
*completed-tower-pair*; *completed-tower-self-product* (the uniform tensor-square identification);
Mathlib `comonadicExtendScalars`,
`Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`,
`Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`, `ContinuousMap`. README only (no Lean declaration).

### A4.6 perfectoidness

[ECD] §15, Lem. 15.3, p. 90 (stated for every Tate `ℤ_p`-algebra) and [Berkeley] Lecture 10,
Lem. 10.1.6, p. 75 (stated for every Tate ring in which `p` is topologically nilpotent) give the
perfectoidness of the completed tower; here its base ring is complete, because the henselian
comparison that transfers finite étale splittings to the completion needs that hypothesis, and
the polynomial example over `ℚ_p[T]` of *uniform-completion-etale-comparison* prevents its
removal. Throughout, `p` is a prime (`[Fact p.Prime]`, or the field `p.Prime` of the presentation
record), the case `p = 2` included; the prime enters the arithmetic only through the exponent
bound `p^{n−1} > n` of *pseudouniformizer-dividing-p*. In the Frobenius argument
the choice of exponent also makes `p/ϖ^p` topologically nilpotent: divisibility `ϖ^p | p` alone
does not make the root algebra étale, since at `ϖ = p^{1/p}` and `f = 1 − p` the polynomial
`X^p − pX + p − 1` has a double root at `1`.

**Roots of monic polynomials with invertible derivative.** (*root-of-monic-in-split-tate-ring*)
Let `R` be a complete Hausdorff Tate ring with no nonsplit finite étale covers
(*finite-etale-split-ring*), `P ∈ R°[X]` monic of degree `d ≥ 1`, and `B := R[X]/(P)` with its
natural topology as a free `R`-module with basis `1, x, …, x^{d−1}`, `x` the class of `X`. Then
`x` is power-bounded in `B`. If moreover `P′(x) = u·(1 − τ)` in `B` with `u ∈ R^×` and `τ ∈ B`
topologically nilpotent, then `B` is complete and free, `1 − τ` is a unit (Tau Ceti
`IsTopologicallyNilpotent.isUnit_one_sub`), so `(P, 1)` is a standard étale pair (Mathlib
`StandardEtalePair`) and `B` is a faithfully flat finite étale `R`-algebra of rank `≥ 1`, which
has a section: `P` has a root in `R`, and every root of `P` in `R` lies in `R°` (a root is
integral over `R°`, which is integrally closed in `R`; `x` is power-bounded because the
subring of `R°` generated by the finitely many coefficients of `P` is bounded, also when `R` is
not uniform). Prove this ([ECD] §15, proof of Lem. 15.3, p. 90;
[Berkeley] Lecture 10, proof of Lem. 10.1.6, p. 75: the pattern "finite étale, hence a
solution"). The topological nilpotence of `τ` is what makes `P′(x)` a unit, and without it `B` need
not be étale (*frobenius-surjective-for-split-tate-ring*).
*Needs:* *finite-etale-split-ring*; Mathlib
`AdjoinRoot.powerBasis'`, `StandardEtalePair`, `Algebra.IsStandardEtale`,
`StandardEtalePair.homEquiv`, `Polynomial.Monic`, `Polynomial.derivative`; Tau Ceti
`IsTopologicallyNilpotent.isUnit_one_sub`, `Huber.IsPowerBounded`, `Huber.powerBoundedSubring`,
`Huber.IsTateRing`. README only (no Lean declaration).

**A pseudouniformizer whose `p`-th power divides `p`.** (*pseudouniformizer-dividing-p*) Let `R`
be a complete Hausdorff Tate ring in which `p` is topologically nilpotent and which has no nonsplit
finite étale covers, and `ϖ_0 ∈ R` a pseudouniformizer (Tau Ceti `IsPseudoUniformizer`). Choose
`n ≥ 1` with `p^n ∈ ϖ_0R°` and `p^{n−1} > n` (possible, since `p^n → 0` and `ϖ_0R°` is open). Then
`X^{p^n} − ϖ_0X − ϖ_0` has a root in `R`, and every root `ϖ` is a pseudouniformizer lying in `R°`
with `ϖ^{p^n} = ϖ_0(1 + ϖ)`, `1 + ϖ ∈ (R°)^×` (so `ϖ^{p^n}` and `ϖ_0` divide each other in `R°`),
`ϖ^p | p` in `R°` and `p/ϖ^p` topologically nilpotent. Here `τ = (p^n/ϖ_0)x^{p^n−1}` is
topologically nilpotent because `x^{p^n} ∈ ϖ_0·B°`, and from `p^n = ϖ^{p^n}w` one gets
`(p/ϖ^p)^n = ϖ^{p^n−pn}w`. Prove this as `Huber.exists_isPseudoUniformizer_pow_dvd_p` ([ECD] §15,
proof of Lem. 15.3, p. 90 (the root of `x^{p^n} − ϖ_0x − ϖ_0`); [Berkeley] Lecture 10, proof of
Lem. 10.1.6, p. 75 (the strengthening `p/ϖ^p` topologically nilpotent, by taking the exponent
larger)). The strict inequality `p^{n−1} > n`, rather than [ECD]'s `p^{n−1} ≥ n`, is what makes
`p/ϖ^p` topologically nilpotent, which the Frobenius step needs. *Needs:*
*root-of-monic-in-split-tate-ring*;
*finite-etale-split-ring*; Tau Ceti `Huber.IsPseudoUniformizer`,
`Huber.IsPowerBounded.isTopologicallyNilpotent_mul`, `IsTopologicallyNilpotent.isUnit_one_add`,
`Huber.powerBoundedSubring`; Mathlib `IsTopologicallyNilpotent`.

Lean: `Huber.exists_isPseudoUniformizer_pow_dvd_p` (a pseudouniformiser `ϖ ∈ R°` with `p = ϖ^p y`,
`y ∈ R°` topologically nilpotent); the rest is README only.

**Checks.**

- *test_exponent_table* (computation) — `p^{n−1} > n` excludes `n = 1` for every `p` (`p⁰ = 1`),
  and for `p = 2` also `n = 2` (`2 > 2` fails): the admissible exponents are `n ≥ 2` for `p ≥ 3`
  and `n ≥ 3` for `p = 2`; with `ϖ_0 = p` one may take `n = 2` (`p ≥ 3`) or `n = 3` (`p = 2`).
  When formalised, the computation uses a root of X⁸ − 8X − 8 in C₂: it is a pseudouniformiser v
  with 2/v² integral and topologically nilpotent. It also checks that the pseudouniformiser
  chosen by `Huber.exists_isPseudoUniformizer_pow_dvd_p` at p = 2 is neither 2 nor 1.
- *test_tau_nilpotent* (computation) — in a complete split Tate ring, if `x² = ϖ(1+x)`, `ϖ` is topologically nilpotent,
  and `x,c` are power-bounded, then `cx` is topologically nilpotent: its square is a
  topologically nilpotent element times a power-bounded element. This is the quadratic
  instance of the derivative-error argument.
- *test_equality_not_nilpotent* (non-example for [ECD]'s `p^{n−1} ≥ n`) — `R = ℂ_2`, `p = 2`,
  `n = 2` (`2^{n−1} = n`), `ϖ_0 = 4` (so `p^n = 4 ∈ ϖ_0R°`): a root `ϖ` of `X⁴ − 4X − 4` has
  `|ϖ|⁴ = |4|`, so `|ϖ²| = |2|` and `p/ϖ^p = 2/ϖ²` is a unit of `R°`, not topologically
  nilpotent; `ϖ^p | p` holds.

**Surjectivity of Frobenius modulo `ϖ^p`.** (*frobenius-surjective-for-split-tate-ring*) Let `R`
be a complete Hausdorff Tate ring with no nonsplit finite étale covers and `ϖ ∈ R` a
pseudouniformizer with `ϖ^p | p` in `R°` and `p/ϖ^p` topologically nilpotent. Then for every
`f ∈ R°` there is `x ∈ R°` with `x^p − ϖ^px = f`; consequently `Φ : R°/ϖ → R°/ϖ^p`, `x ↦ x^p`
(a ring homomorphism since `p ∈ ϖ^pR°`, [ECD] §3, Def. 3.1, p. 14), is surjective. The second
hypothesis is what makes `P′ = −ϖ^p(1 − (p/ϖ^p)x^{p−1})` invertible; without it the algebra need
not be étale. Prove this ([ECD] §15, proof
of Lem. 15.3, p. 90). Over the perfectoid field `K`, the completion of `ℚ_p(p^{1/p^∞})`, with
`ϖ = p^{1/p}` (so `p/ϖ^p = 1`) and `f = 1 − p`, the polynomial `X^p − ϖ^pX − f = X^p − pX + p − 1`
has the double root `1` (`P(1) = 0 = P′(1)`), so `K[X]/(P)` is not étale; [ECD]'s printed proof
asserts étaleness without this hypothesis. *Needs:* *root-of-monic-in-split-tate-ring*;
*pseudouniformizer-dividing-p*; *finite-etale-split-ring*; Tau Ceti
`Huber.IsPowerBounded.isTopologicallyNilpotent_mul`, `Huber.powerBoundedSubring`; Mathlib
`frobenius`. README only (no Lean declaration).

**Checks.**

- *test_double_root* (non-example) — `P = X^p − pX + p − 1` over `K = ℚ_p(p^{1/p^∞})^∧`,
  `ϖ = p^{1/p}`, `f = 1 − p`: `P(1) = 1 − p + p − 1 = 0` and `P′(1) = p − p = 0`, and
  `τ = (p/ϖ^p)x^{p−1} = x^{p−1}` is not topologically nilpotent; the root algebra is not étale.
- *test_frobenius_mod* (computation) — a root `x ∈ R°` of `X^p − ϖ^pX − f` has
  `x^p − f = ϖ^p·x ∈ ϖ^pR°`, so `Φ(x mod ϖ) = f mod ϖ^p`.
- *test_frobenius_injective* (characterisation) — an element whose `p`-th power is power-bounded
  is power-bounded; applied to `x/ϖ` when `x^p ∈ ϖ^pR°`, this makes `Φ` injective
  ([ECD] §3, Rem. 3.2, p. 14).

**A complete uniform Tate ring without nonsplit covers is perfectoid.**
(*split-tate-ring-is-perfectoid*) Let `R` be a complete Hausdorff uniform Tate ring (`R°`
bounded) in which `p` is topologically nilpotent. If `R` has no nonsplit finite étale covers, then
`R` is a perfectoid Tate ring in the sense of PerfectoidSpaces layer P1 ([ECD] §3, Def. 3.1,
p. 14): there is a pseudouniformizer `ϖ` with `ϖ^p | p` in `R°` (and `p/ϖ^p` topologically
nilpotent) such that `Φ : R°/ϖ → R°/ϖ^p` is an isomorphism; injectivity of `Φ` is automatic
([ECD] §3, Rem. 3.2, p. 14; PerfectoidSpaces layer P1,
*perfectoid-condition-independent-of-pseudouniformizer* (a), with the surjectivity bookkeeping of
its *frobenius-surjectivity-criterion*; the split-ring argument is the content here). Prove this
as `Huber.isPerfectoid_of_isFiniteEtaleSplit`, whose conclusion is the perfectoid Tate-ring
predicate that PerfectoidSpaces owns and every roadmap shares, `Perfectoid.IsPerfectoidTateRing p R`
(Frobenius surjective on `R°/p`), equivalent to the form above by [ECD] §3, Rem. 3.2, p. 14
([Berkeley] Lecture 10, proof of Lem. 10.1.6, p. 75: the perfectoidness argument uses only
completeness, uniformity and splitness of the completed ring). Completeness and the splitting hypothesis matter: `ℚ̄_p` has no
nonsplit finite étale
covers but is not complete, and `ℂ_p⟨T⟩` is complete and uniform but not perfectoid, hence by this
lemma has a nonsplit finite étale cover. *Needs:* *pseudouniformizer-dividing-p*;
*frobenius-surjective-for-split-tate-ring*; *finite-etale-split-ring*; PerfectoidSpaces layer P1.

Lean: `Huber.isPerfectoid_of_isFiniteEtaleSplit` (`R°` bounded as the uniformity hypothesis; its
conclusion is PerfectoidSpaces' `Perfectoid.IsPerfectoidTateRing`); the rest is README only.

**Perfectoid uniform completion.** (*perfectoid-uniform-completion*) Let `(A, A⁺)` be a Huber pair
with `A` a complete Hausdorff Tate ring in which `p` is topologically nilpotent (a complete Tate
`ℤ_p`-algebra), `A⁺` any ring of integral elements, `T` any finite étale torsor tower over `A`
(*finite-etale-torsor-tower*) and `(Â_∞, Â_∞⁺)` its completed tower pair (*completed-tower-pair*).
Then `Â_∞` is a perfectoid Tate ring (PerfectoidSpaces layer P1: `Perfectoid.IsPerfectoidTateRing p Â_∞`,
the predicate PerfectoidSpaces owns); explicitly, `Â_∞` contains a
pseudouniformizer `ϖ`, a root of `X^{p^n} − ϖ_0X − ϖ_0` for any pseudouniformizer `ϖ_0` of `A` and
`n` with `p^n ∈ ϖ_0Â_∞°` and `p^{n−1} > n`, such that `ϖ^p | p` in `Â_∞°`, `p/ϖ^p` is
topologically nilpotent and `Φ : Â_∞°/ϖ → Â_∞°/ϖ^p` is bijective. So `(Â_∞, Â_∞⁺)` is a perfectoid
Huber pair with a continuous action of the profinite group `G`. Prove this ([ECD] §15, Lem. 15.3,
p. 90, the statement,
with completeness of `A` added; [ECD] §15, proof of Lem. 15.3, p. 90, pseudouniformizer then
Frobenius; [Berkeley] Lecture 10, Lem. 10.1.6, p. 75, the completion of the colimit with
`colim R_i°` open and bounded; [ECD] §3, Def. 3.1, p. 14, the definition verified). Completeness
of `A` cannot be omitted: for the non-complete Tate `ℤ_p`-algebra `ℚ_p[T]` (ring of definition
`ℤ_p[T]`, `p`-adic topology) every tower has colimit `B[T]` with `B` a colimit of finite étale
`ℚ_p`-algebras, ind-finite-étale over `ℚ_p`, and the uniform completion `B̂⟨T⟩` is not perfectoid
(its power-bounded subring is `B̂°⟨T⟩`, and modulo `p` the class of `T` is not a `p`-th power in
`(B̂°/p)[T]`), although [ECD] Lem. 15.3 is stated for all Tate `ℤ_p`-algebras. *Needs:*
*completed-tower-pair*; *finite-etale-invariance-along-tower*; *split-tate-ring-is-perfectoid*;
*finite-etale-torsor-tower*; PerfectoidSpaces layer P1; Tau Ceti `Huber.IsPseudoUniformizer`. README only (no Lean declaration).

**Checks.**

- *nonprime_indices* — `PerfectoidTorsorPresentation` over (Q₂,ℤ₂) is empty at parameters 0 and 1 and inhabited at parameter 2.
- *completion_test_Qp* (computation) — for the field tower over `ℚ_p` the perfectoid ring
  produced is `ℂ_p`, for `p = 2` as for odd `p`.

### A4.7 adic spectra of the tower

**The adic spectrum of a torsor is a `G`-quotient.** (*torsor-spa-orbits*) Let `(A, A⁺)` be a
Huber pair with `A` a complete Hausdorff Tate ring, `A → B` a finite étale `G`-torsor
(*finite-etale-galois-torsor*) and `(B, B⁺)` its Huber pair (AdicEtaleGeometry layer A1,
*finite-etale-affinoid-algebra*: natural topology and integral plus ring); `G` acts on `(B, B⁺)`
by automorphisms of Huber pairs over `(A, A⁺)`, hence on `Spa(B, B⁺)` by `(g·y)(b) = y(g⁻¹b)`.
Let `q : Spa(B, B⁺) → Spa(A, A⁺)` be the induced map (Tau Ceti `spaComap`). Then `q` is open and
surjective and its fibres are exactly the `G`-orbits; hence `q` induces a homeomorphism
`|Spa(B, B⁺)|/G ≅ |Spa(A, A⁺)|` for the quotient topology. That `q` is continuous and spectral,
and that the preimage of the rational subset `R(T/s)` of `Spa(A, A⁺)` is the rational subset
`R(T/s)` of `Spa(B, B⁺)`, holds for every morphism out of a Tate pair and is cited, not restated
(Tau Ceti `Huber.Pair.Hom.continuous_spaComap`,
`Huber.Pair.Hom.isSpectralMap_spaComap_of_isTateRing` in
`TauCeti/AlgebraicGeometry/AdicSpace/Spa/MorphismSpectral.lean`,
`Huber.Pair.Hom.spaComap_preimage_rationalSubset`). Fibres are orbits because
`B ⊗_A B = B ⊗̂_A B ≅ ∏_G B` and Huber's valuation argument puts a point of `Spa(B ⊗̂_A B)` over
any two points with the same image, which works for affinoid rings without sheafiness. Prove this
as `ValuationSpectrum.spaComap_orbits_of_isFiniteEtaleTorsor` ([ECD] §15, proof of
Prop. 15.4, p. 91; [KL I] §9.1, proof of Lem. 9.1.9, p. 191 (openness for faithfully finite
étale morphisms); [H94] §3, proof of Lem. 3.9(i), p. 538, whose argument [PS] §7, proof of
Lem. 7.3, p. 40 uses for surjectivity). For the
trivial torsor `B = Map(G, A)`, `Spa(B) = G × Spa(A)` and `q` is the projection. PerfectoidTowers
cites this statement; its layer P8's quotient theorems for arbitrary finite group actions are
the non-free generalisation.
*Needs:* *finite-etale-galois-torsor*; AdicEtaleGeometry layer A1
(*finite-etale-affinoid-algebra*); AdicSpacesPartII layer R0 (completed tensor product, finite
algebra tensor complete); Tau Ceti `ValuationSpectrum.spa`, `ValuationSpectrum.spaComap`,
`TauCeti.ValuationSpectrum.continuous_spaComap`, `TauCeti.ValuationSpectrum.spaComap_preimage_rationalSubset`,
`ValuationSpectrum.rationalSubset`.

Lean: `ValuationSpectrum.spaComap_orbits_of_isFiniteEtaleTorsor` (`q` is surjective and open with
fibres the `G`-orbits, from which the homeomorphism follows).

**The adic spectrum of the completed tower.** (*spa-of-completed-tower*) In the situation of
*completed-tower-pair* (`(A, A⁺)` complete Hausdorff Tate, `T` a finite étale torsor tower over
`A`): (i) the maps `Spa(Â_∞, Â_∞⁺) → Spa(A_i, A_i⁺)` induce a homeomorphism
`|Spa(Â_∞, Â_∞⁺)| ≅ lim_i |Spa(A_i, A_i⁺)|` of spectral spaces, and every rational subset of
`Spa(Â_∞, Â_∞⁺)` is the preimage of a rational subset of some `Spa(A_i, A_i⁺)` (valuations on a
colimit are compatible families; for valuations bounded by `1` on the plus ring, continuity means
`v(ϖ)` is cofinal in the value group, which is the union of those of the restrictions; rational
subsets come from a finite level); (ii) `q_∞ : Spa(Â_∞, Â_∞⁺) → Spa(A, A⁺)` is open, surjective
and `G`-equivariant (continuous and spectral as every morphism out of a Tate pair, Tau Ceti
`Huber.Pair.Hom.isSpectralMap_spaComap_of_isTateRing`), its fibres are exactly the `G`-orbits, and it
induces a homeomorphism `|Spa(Â_∞, Â_∞⁺)|/G ≅ |Spa(A, A⁺)|` — the topological identification of
[ECD] §15, Prop. 15.4, with no sheafiness: it is an identification of spaces of continuous
valuations. Clause (i) is the torsor-tower case of PerfectoidSpaces layer P5's
*spa-of-filtered-colimit-of-tate-pairs*, which is stated for compatible rings of definition
contained in the plus rings and is cited for the general direct-limit form; here the colimit
carries the topology of *completed-tower-pair*, in which `colim_i A_i°` is open, and the
completion is the uniform one. Prove the homeomorphism of (i),
`rationalSubset_completion_descends` (with an open ideal generated by the rational numerator
set), and the quotient homeomorphism of (ii) ([ECD] §15, proof of Prop. 15.4, p. 91;
[KL I] §2.6, Rem. 2.6.3, p. 53 (the bijectivity argument of (i))).
*Needs:* *completed-tower-pair*; *torsor-spa-orbits*; *finite-etale-torsor-tower*;
AdicSpacesPartII layer R0 (uniformization); Tau Ceti `ValuationSpectrum.spa`,
`ValuationSpectrum.spaComap`, `ValuationSpectrum.rationalSubset`; Mathlib `ProfiniteGrp`. README only (no Lean declaration).

**Continuous function rings on the completed tower are perfectoid.**
(*completed-tower-continuous-functions-perfectoid*) In the situation of *completed-tower-pair*,
let `p` be prime and topologically nilpotent in `A`. For every `k ≥ 0`, prove that
`C^0(G^k,Â_∞)` is perfectoid, with ring of integral elements `C^0(G^k,Â_∞⁺)`.
For `k = 0` this is *perfectoid-uniform-completion*. In general it is the ring of the
product of `Spa(Â_∞,Â_∞⁺)` with the profinite set `G^k` (PerfectoidSpaces P6,
*product-with-profinite-set*). Combined with *completed-tower-self-product*, it makes the
uniform tensor square a perfectoid self-product; the tensor-square identification itself is
built in A4.5. This supplies `relation_isPerfectoid` for `ofTower T` in
*perfectoid-cover-presentation* ([ECD] §15, Prop. 15.4 and proof of Lem. 15.6, pp. 90–91).
*Needs:* *perfectoid-uniform-completion*; *completed-tower-self-product*;
PerfectoidSpaces P6 (*product-with-profinite-set*); Mathlib `ContinuousMap`, `ProfiniteGrp`.
README only (no Lean declaration).

**Checks.**

- *tower_functions_zero_factors* — `G^0` is a singleton and its function ring is `Â_∞`.
- *tower_functions_one_factor* — the relation ring `C^0(G,Â_∞)` is perfectoid,
  as in *tower_continuousMap_perfectoid*.
- *tower_functions_trivial* — for a trivial-group tower over a perfectoid split base `A`,
  every `C^0(G^k,Â_∞)` is `A`.

### A4.8 the perfectoid torsor presentation

**Perfectoid torsor presentation.** (*perfectoid-cover-presentation*) Let `p` be a prime and
`(A, A⁺)` a Huber pair with `A` a complete Hausdorff Tate ring, `A⁺` any ring of integral
elements, and no sheafiness of `(A, A⁺)`; existence of a presentation (`exists`) assumes that `p`
is topologically nilpotent in `A`. A *perfectoid torsor presentation* of
`(A, A⁺)` consists of a profinite group `G` (Mathlib `ProfiniteGrp`), a complete Huber pair
`(Ã, Ã⁺)` with `Ã` a perfectoid Tate ring (PerfectoidSpaces layer P1), a continuous action of `G`
on `(Ã, Ã⁺)` by automorphisms of Huber pairs, and a `G`-invariant morphism of Huber pairs
`q : (A, A⁺) → (Ã, Ã⁺)`, such that

```text
(a) Ã ⊗̂ᵘ_A Ã ≅ (C^0(G, Ã), C^0(G, Ã⁺)),  b ⊗ b′ ↦ (g ↦ b·g(b′))   (uniform completed tensor
    product, AdicSpacesPartII layer R0);
(b) Spa(q) : Spa(Ã, Ã⁺) → Spa(A, A⁺) is surjective and open with fibres exactly the
    G-orbits, so |Spa(Ã, Ã⁺)|/G ≅ |Spa(A, A⁺)|.
```

`Spa(q)` is moreover spectral, in particular quasi-compact, for every morphism `q` out of the Tate
pair `(A, A⁺)` (Tau Ceti `Huber.Pair.Hom.isSpectralMap_spaComap_of_isTateRing` in
`TauCeti/AlgebraicGeometry/AdicSpace/Spa/MorphismSpectral.lean`), so the quasi-compactness that
[ECD] Prop. 15.4 records is automatic and is not an axiom of the record.

The *perfectoid cover* is `X̃ = Spa(Ã, Ã⁺)`; the *induced perfectoid equivalence relation* is
`R̃ = Spa(C^0(G, Ã), C^0(G, Ã⁺)) ≅ G × X̃`, with `s, t : R̃ ⇉ X̃` induced by `b ↦ (g ↦ b)` and
`b ↦ (g ↦ g·b)`, identity `X̃ → R̃` (evaluation at `1`) and composition induced by
`C^0(G, Ã) → C^0(G × G, Ã)`, `f ↦ ((g,h) ↦ f(gh))` in edge coordinates — the action groupoid of `G` on `X̃`, with all objects affinoid
perfectoid. This is the generalized-affinoid presentation of [ECD] §15: `(A, A⁺)` need not be
sheafy, while `X̃` and `R̃` are affinoid perfectoid. `R̃` is an equivalence relation only in the
category of v-sheaves (DiamondsAndVStacks layer D6): on underlying sets
`|R̃| → |X̃| ×_{|Spa A|} |X̃|` is surjective but not injective. Define
the structure `Huber.PerfectoidTorsorPresentation p P` for `P = (A, A⁺)` (`p.Prime`, `G : ProfiniteGrp`, a
complete perfectoid pair `(Ã, Ã⁺)` with continuous `G`-action, a `G`-invariant `q`, and axioms
(a), (b)); define `ofTower` (for a finite étale torsor tower `T` over `A`, take `G = lim G_i` and
`(Ã, Ã⁺) = (Â_∞, Â_∞⁺)`, assembled field by field from *perfectoid-uniform-completion*,
`completionAction_spec` (*completed-tower-pair*), the self-product identification of
*completed-tower-self-product* (axiom (a)), the perfectoid relation from
*completed-tower-continuous-functions-perfectoid* and the quotient homeomorphism of
*spa-of-completed-tower* (axiom (b))), `exists` (every
complete Tate `ℤ_p`-pair admits a presentation: `ofTower` of `FiniteEtaleTorsorTower.canonical A`),
`relation` (the pair
`(C^0(G, Ã), C^0(G, Ã⁺))` with `relation.source`, `relation.target`,
`relation.unit` and `relation.composition`; `relation.mem_plus` fixes the plus ring
pointwise, `relation.source_apply` and `relation.target_apply` fix the two projections,
and `spaQuotientHomeomorph_mk` fixes the quotient map on classes; `unit_apply`, `composition_apply`, `unit_comp` and
`composition_laws` specify evaluation, the unit laws and associativity, while
`composition_continuous` and `composition_mem_plus` give continuity and preservation of integral elements) and `ofPerfectoid`
(the trivial presentation of a perfectoid pair, `G = 1`); prove `relation_isPerfectoid`
(`C^0(G^k, Ã)` is perfectoid for every `k ≥ 0`; PerfectoidSpaces layer P6,
*product-with-profinite-set*, and for `k = 1` through (a) also P2's
*uniform-completed-tensor-of-perfectoid-over-any-base*), `uniformCompletedTensorEquiv` (axiom (a),
with `inlᵘ ↦ s` and `inrᵘ ↦ t`), `spaQuotientHomeomorph` (`|Spa(Ã, Ã⁺)|/G ≃ₜ |Spa(A, A⁺)|` induced
by `Spa(q)`), `spa_relation_homeomorph` (`|Spa(C^0(G, Ã), C^0(G, Ã⁺))| ≃ₜ G × |Spa(Ã, Ã⁺)|`, under
which `s` and `t` become `(g, x) ↦ x` and `(g, x) ↦ g⁻¹·x`; PerfectoidSpaces layer P6,
*product-with-profinite-set*), with Tau Ceti’s `TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset` (the
preimage under `Spa(q)` of `R(T/s)` is `R(q(T)/q(s))`) cited. For `ofTower T hp`, apply the
effective descent along the tower: every finite étale `Ã`-algebra
with a continuous semilinear `G`-action is equivariantly isomorphic to `Ã ⊗_A B` for a
finite étale `A`-algebra `B` (*finite-etale-effective-descent-along-tower*) ([ECD] §15, Prop. 15.4, p. 90 (the
presentation of `Spd(A, A⁺)` by an affinoid perfectoid space with a `G`-torsor, of which this is
the analytic side); [ECD] §15, proof of Prop. 15.4, p. 91 (the topological quotient (b));
[Berkeley] Lecture 10, Lem. 10.1.7, p. 75; [ECD] §15, after Def. 15.5, p. 91 (generalized, not
necessarily sheafy, adic spaces)). *Needs:* *completed-tower-pair*;
*perfectoid-uniform-completion*; *completed-tower-self-product*;
*completed-tower-continuous-functions-perfectoid*; *spa-of-completed-tower*;
*finite-etale-effective-descent-along-tower*; *finite-etale-torsor-tower*; AdicSpacesPartII layer
R0 (uniform completed tensor product); PerfectoidSpaces layers
P1, P2 and P6; AdicEtaleGeometry layer A1
(*generalized-adic-presentation*); Tau Ceti `Huber.Pair`, `Huber.Pair.Hom`,
`ValuationSpectrum.spa`, `ValuationSpectrum.spaComap`; Mathlib `ProfiniteGrp`, `ContinuousMap`. README only (no Lean declaration).

**Checks.**

- *tower_carriers* — `ofTower T` has exactly `T.group` and `Uniformization T.colim`;
  a spurious extra factor in the group cannot satisfy these identities.
- *tower_integral_elements* — its plus pair is `T.completion P`, with the completed integral
  elements of the tower.
- *tower_structure_map* — `q(a) = T.completionStructureHom P(a)`; together with
  `completionStructureHom_apply`, this is the map through every finite level. Since the carrier,
  plus ring and structure map of `ofTower T` are those of *completed-tower-pair*, its computed
  value and degenerate case are *completion_test_Qp* and *completion_test_trivial*.
- *perfectoid_identity_map* (degenerate) — `ofPerfectoid` has `q(a) = a`.
- *perfectoid_identity_plus* — its plus pair is the original `P`, even when the plus ring
  is properly contained in the power-bounded subring.
- *perfectoid_trivial_action* — its one-element group acts by `a ↦ a`.
- *relation_evaluation* — the point corresponding to `(g,x)` is `f ↦ x(f(g))`, as fixed by
  `spa_relation_homeomorph_symm`.
- *relation_source* — source applied to that point is `x` (`spa_relation_source`).
- *relation_identity* (degenerate) — at `g = 1`, target also gives `x`; in general it is
  `b ↦ x(g·b)` (`spa_relation_target`). The two-term `C₃` computation in
  *galoisTensorMap_inverse_support* distinguishes this from the other action convention.
- *quotient_projection* — `spaQuotientHomeomorph([x]) = Spa(q)(x)`.
- *quotient_fibre* — equality of these values is exactly the existence of an element sending
  one point to the other; injectivity before taking orbits is not asserted.
- *quotient_trivial* (degenerate) — the quotient homeomorphism of `ofPerfectoid` sends `[x]`
  to `x` in the original adic spectrum.
- *test_Qp* (computation) — `(ℚ_p, ℤ_p)` has a presentation with ring topologically
  isomorphic to `ℂ_p`.
- *test_perfectoid* (degenerate) — if `(A, A⁺)` is perfectoid, `G = 1` and `(Ã, Ã⁺) = (A, A⁺)` is a
  presentation (`C^0(1, A) = A = A ⊗̂ᵘ_A A`).
- *test_relation_not_injective* (non-example) — for `(ℚ_p, ℤ_p)` the map
  `|R̃| = Gal(ℚ̄_p/ℚ_p) × |X̃| → |X̃| ×_{|Spa ℚ_p|} |X̃| = point` is surjective but not injective:
  `R̃ ⇉ X̃` is not an equivalence relation on underlying sets.
- *test_finite_level* (compatibility) — for a presentation `ofTower T` and a level `i`,
  two points of `Spa(Ã, Ã⁺)` have the same image in `Spa(A_i, A_i⁺)` exactly when
  they lie in an orbit of `ker(G → G_i)`.
- *test_nonuniform* (compatibility) — `(A, A⁺)` admits a presentation if and only if
  `(A^u, A^{u+})` does.
- *perfectoid_not_Qp* (non-example) — `ℚ_p` is not perfectoid (no `ϖ ∈ ℤ_p` has `ϖ^p ∣ p`;
  [ECD] §3, Rem. 3.3, p. 14), so `ofPerfectoid` does not apply to `(ℚ_p, ℤ_p)`, whose
  presentations come from the tower.

### A4.9 comparison interfaces with diamonds

**`Spd` of a Tate Huber pair and the perfectoid torsor.**
(*spd-of-tate-huber-pair-and-perfectoid-torsor*) The analytic half of [ECD] §15 — Lem. 15.3,
p. 90, and the identification of underlying spaces in the proof of Prop. 15.4, pp. 90–91 —
supplied by this layer is the declaration `Huber.PerfectoidTorsorPresentation.exists`: for a prime
`p`, every Huber pair `(A, A⁺)` with `A` a complete Hausdorff Tate ring in which `p` is
topologically nilpotent has a perfectoid torsor presentation (*perfectoid-cover-presentation*,
assembled from *finite-etale-torsor-tower*, *completed-tower-pair*, *perfectoid-uniform-completion*,
*completed-tower-self-product*, *completed-tower-continuous-functions-perfectoid* and
*spa-of-completed-tower*, with no sheafiness assumption). The
v-sheaf statements of [ECD] Lems. 15.1–15.2 and Prop. 15.4, pp. 89–91 — `Spd ℤ_p` and
`Spd(A, A⁺)` are v-sheaves, `Spd(A_i, A_i⁺) → Spd(A, A⁺)` and `Spd(Â_∞, Â_∞⁺) → Spd(A, A⁺)` are
torsors, `Spd(A, A⁺)` is a spatial diamond with `|Spd(A, A⁺)| = |Spa(A, A⁺)|` — are
DiamondsAndVStacks layer D6's targets *spd-of-a-tate-pair* (D6.1) and *spd-is-a-spatial-diamond*
(D6.3), which consume this record (for a Tate `ℤ_p`-algebra that is not complete, through its
completion, as in the conventions of this layer) and justify nothing here. *Needs:*
*perfectoid-cover-presentation*. README only (no Lean declaration).

**The diamond of an analytic adic space and its étale site.**
(*diamond-of-analytic-adic-space-and-etale-site-15-6*) [ECD] §15, Def. 15.5 and Lem. 15.6, p. 91
(`Y^♢` for an analytic adic space `Y` over `ℤ_p`, `|Y^♢| = |Y|`, `Y^♢_ét ≅ Y_ét`,
`Y^♢_fét ≅ Y_fét`) are DiamondsAndVStacks layer D6's targets *gluing-and-the-diamond-functor*
(D6.4) and *etale-site-comparison* (D6.5); the analytic input this layer supplies to the
affinoid case consists of the following separately named interfaces for the presentation of
`(A, A⁺)` from a finite étale torsor tower: the quotient
`|Spa(A, A⁺)| = |Spa(Â_∞, Â_∞⁺)|/G` with rational subsets corresponding (*spa-of-completed-tower*),
the equivalences `(Â_∞)_fét ≅ 2-colim (A_i)_fét` and their variants for `C^0(G, Â_∞)` and
`C^0(G × G, Â_∞)` (*finite-etale-invariance-along-tower*), and the descent of `FÉt(A)` along the
tower (*finite-etale-effective-descent-along-tower*), the sites `Y_fét`, `Y_ét` of a possibly
non-sheafy `Spa(A, A⁺)` being layer A1's (*finite-etale-site*, *etale-site*,
*etale-site-generalized* on *generalized-adic-presentation*; [KL I] §8.2, Lem. 8.2.17(a), p. 162)
([ECD] §15, proof of Lem. 15.6, p. 91). *Needs:* *perfectoid-cover-presentation*;
*spa-of-completed-tower*; *finite-etale-invariance-along-tower*;
*finite-etale-effective-descent-along-tower*; AdicEtaleGeometry layer A1 (*finite-etale-site*,
*etale-site*, *etale-site-generalized*, *generalized-adic-presentation*). README only (no Lean declaration).

### Examples

For `(ℚ_p, ℤ_p)`: the tower of finite Galois extensions has uniform completion `ℂ_p`.
Its profinite limit group `G` gives `ℂ_p ⊗̂ᵘ_{ℚ_p} ℂ_p ≅ C^0(G, ℂ_p)` and
`|Spa ℂ_p|/G = |Spa ℚ_p|`. For `(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`:
`Â_∞` is perfectoid (approximate `p`-power roots of `T` modulo `ϖ^p` exist in `Â_∞°`) although
`ℚ_p⟨T⟩` is not, and the finite étale `ℚ_p⟨T⟩`-algebra `ℚ_p⟨T⟩[X]/(X^p − X − T/p)` splits over
`Â_∞`. The incomplete ring `ℚ_p[T]` illustrates why the finite étale comparison requires completeness. For a perfectoid pair: the trivial presentation with `G = 1`.

**Checks for the constructions.** In the table, unqualified names belong to the namespace
of the preceding qualified name. The subsequent computations specify the labelled Checks. Of the
definitions in the table, `Algebra.IsTotallySplit`, `IsFiniteEtaleSplit`, `Algebra.galoisTensorMap`,
`Algebra.IsFiniteEtaleTorsor`, `FiniteEtaleTorsorTower` and `FiniteEtaleTorsorTower.colim` are in
`Suggested.lean`; the others are README only.

| Definition | Checks |
| --- | --- |
| `Algebra.IsTotallySplit` | *totally_split_empty*, *totally_split_idempotent*, *totally_split_variable_rank* |
| `IsFiniteEtaleSplit` | *test_isSepClosed*, *test_zero*, *test_not_rat*, *test_Cp*, *test_not_Qp*, *test_strictlyHenselian* |
| `Algebra.galoisTensorMap`; `Algebra.IsFiniteEtaleTorsor.galoisMap` | *galois_left*, *galois_right*, *galois_identity*, *galois_convention_three* |
| `Algebra.IsFiniteEtaleTorsor` | *test_gaussian_half*, *test_not_gaussian*, *test_trivial_group*, *test_swap*, *test_sign_rat*, *test_sign_char_two*, *test_zero_ring* |
| `Algebra.IsFiniteEtaleTorsor.iterGaloisMap` | *galois_zero*, *galois_one*, *galois_two*, *galois_faces_two* |
| `FiniteEtaleTorsorTower` | *test_finiteField*, *test_trivial*, *test_not_cyclotomic* |
| `FiniteEtaleTorsorTower.colim`; `toColimRingHom`; `toColim` | *colimit_transition*, *colimit_injective*, *colimit_trivial_groups* |
| `IndGeometry.ValuedSheaf`; `IndGeometry.Spectrum`; `IndGeometry.IndRingedSpace` | *indRinged_closed_disc*, *indRinged_two_sheets*, *indRinged_collapsed_functions* |
| `IndGeometry.IndRingedSpace.Hom` | *indRinged_chart_sheet*, *indRinged_chart_subdisc*, *indRinged_chart_fold* |
| `IndGeometry.PreAdicSpace` | *indRinged_preadic_split*, *indRinged_preadic_closed_disc*, *indRinged_preadic_open_disc* |
| `IndGeometry.coefficients` | *indRinged_coefficients_evaluation*, *indRinged_coefficients_projection*, *indRinged_coefficients_topology* |
| `IndGeometry.spaInd` | *indRinged_closed_disc*, *indRinged_two_sheets*, *indRinged_collapsed_functions* |
| `IndGeometry.OpenChart` | *indRinged_chart_sheet*, *indRinged_chart_subdisc*, *indRinged_chart_fold* |
| `FiniteEtaleTorsorTower.group`; `toLevelGroup` | *limit_trivial_groups*, *limit_projection_compatibility*, *limit_projection_lift*, *limit_group_extra_factor* |
| `FiniteEtaleTorsorTower.colimAction` | *colimit_action_identity*, *colimit_action_level*, *colimit_action_kernel*, *colimit_action_moves* |
| `FiniteEtaleTorsorTower.colimTensorEquiv` | *colimit_tensor_left*, *colimit_tensor_right*, *colimit_tensor_identity* |
| `FiniteEtaleTorsorTower.canonical` | *canonical_zero*, *canonical_rat*, *canonical_split* |
| `FiniteEtaleTorsorTower.levelTopology` | *level_topology_module*, *level_topology_transition*, *level_topology_trivial* |
| `FiniteEtaleTorsorTower.levelPair` | *level_integral_elements*, *level_trivial_plus*, *level_identity_transition* |
| `FiniteEtaleTorsorTower.levelPairTransition` | *level_identity_transition*, *level_transition_composition*, *level_topology_transition* |
| `FiniteEtaleTorsorTower.colimTopology` | *colimit_topology_unit_scale*, *colimit_topology_shrink*, *colimit_topology_nilpotent* |
| `FiniteEtaleTorsorTower.colimPlus`; `colimPair` | *colimit_plus_stage*, *colimit_plus_trivial*, *colimit_plus_zero* |
| `FiniteEtaleTorsorTower.completion` | *completion_test_Qp*, *completion_test_trivial*, *completion_test_not_colim* |
| `FiniteEtaleTorsorTower.toColimPair`; `toCompletion` | *completion_transition*, *completion_stage_value*, *completion_base_value* |
| `FiniteEtaleTorsorTower.completionStructureHom` | *completion_base_value*, *completion_action_base*, *completion_test_uniformization* |
| `FiniteEtaleTorsorTower.completionAction` | *completion_action_stage*, *completion_action_base*, *completion_action_identity* |
| `FiniteEtaleTorsorTower.completion.lift` | *completion_lift_identity*, *completion_lift_stage*, *completion_lift_unique* |
| `FiniteEtaleTorsorTower.locallyConstantToContinuousMap` | *locally_constant_value*, *locally_constant_zero_factors*, *locally_constant_constants* |
| `FiniteEtaleTorsorTower.completionAlgebra` | *completion_algebra_stage*, *completion_algebra_nilpotent*, *completion_algebra_injective* |
| `Huber.PerfectoidTorsorPresentation` | *presentation_prime*, *test_Qp*, *test_perfectoid*, *test_relation_not_injective* |
| `Huber.PerfectoidTorsorPresentation.q` | *tower_structure_map*, *perfectoid_identity_map*, *presentation_base_invariant* |
| `Huber.PerfectoidTorsorPresentation.ofTower` | *tower_carriers*, *tower_structure_map*, *test_finite_level*, *completion_test_Qp*, *completion_test_trivial* |
| `Huber.PerfectoidTorsorPresentation.relation` | *relation_plus_constants*, *relation_plus_pointwise*, *relation_plus_target* |
| `Huber.PerfectoidTorsorPresentation.relation.source` | *relation_source_values*, *relation_unit_source*, *relation_source* |
| `Huber.PerfectoidTorsorPresentation.relation.target` | *relation_target_values*, *relation_unit_target*, *relation_identity* |
| `Huber.PerfectoidTorsorPresentation.relation.unit` | *relation_unit_value*, *relation_unit_source*, *relation_unit_target* |
| `Huber.PerfectoidTorsorPresentation.relation.composition` | *relation_composition_value*, *relation_composition_units*, *relation_composition_associative*, *relation_composition_noncommutative* |
| `Huber.PerfectoidTorsorPresentation.uniformCompletedTensorEquiv` | *presentation_tensor_left*, *presentation_tensor_right*, *presentation_tensor_plus* |
| `Huber.PerfectoidTorsorPresentation.spaQuotientHomeomorph` | *quotient_projection*, *quotient_fibre*, *quotient_trivial* |
| `Huber.PerfectoidTorsorPresentation.spa_relation_homeomorph` | *relation_evaluation*, *relation_source*, *relation_identity* |
| `Huber.PerfectoidTorsorPresentation.ofPerfectoid` | *perfectoid_identity_map*, *quotient_trivial*, *test_perfectoid*, *perfectoid_not_Qp* |

- *totally_split_empty* — the empty product is the zero algebra.
- *totally_split_idempotent* — a single clopen component is totally split.
- *totally_split_variable_rank* — ranks one and zero cannot form a constant-rank split algebra.
- *galois_left* — the first tensor factor is the untwisted scalar factor.
- *galois_right* — the second factor carries the action.
- *galois_identity* — evaluation at the group identity is multiplication.
- *colimit_transition* — both canonical maps respect the direction of transition.
- *colimit_injective* — faithfully flat transitions do not lose a stage element.
- *colimit_trivial_groups* — a tower of trivial torsors has colimit A.
- *limit_trivial_groups* — the limit has no hidden factor.
- *limit_projection_compatibility* — projections follow the inverse-system direction.
- *limit_projection_lift* — each finite group element occurs in the limit.
- *colimit_action_identity* — A stage element moved by a projected group element remains moved under `colimAction`, while the identity fixes the same element.
- *colimit_action_level* — a projected group element acts before the stage inclusion.
- *colimit_action_kernel* — the kernel of the projection fixes that whole stage.
- *colimit_tensor_left* — left factors become constant functions.
- *colimit_tensor_right* — right factors become orbit functions.
- *colimit_tensor_identity* — identity evaluation recovers multiplication.
- *canonical_zero* — all algebras over the zero base, including the colimit, vanish.
- *canonical_rat* — the canonical tower over Q cannot have only trivial groups.
- *canonical_split* — its colimit, even over F2, has no nonsplit finite étale covers. These three
  hold for every tower. Its additional tensor-product data are specified by
  `FiniteSubsetPresentation` and `canonical_presentation`.
- *canonical_empty_stage* — the empty finite subset gives the base algebra and trivial group.
- *canonical_two_factors* — two distinct representatives give the tensor product of their
  singleton torsors and the product of their groups.
- *canonical_quadratic_stage* — over ℝ, a singleton stage splitting ℂ has even rank and
  contains an element moved by its torsor group.
- *level_requires_tate* — the discrete algebraic closure of `𝔽_2` has an algebraic torsor
  tower but is not a Tate ring; a Tate-base hypothesis is required for the stage topology.
- *level_topology_module* — For a level identified algebraically with A², `levelTopology` makes the identification a homeomorphism to the product topology.
- *level_topology_transition* — A `levelPairTransition` is a closed embedding and keeps the complementary idempotents of a split A² stage distinct over a nonzero base.
- *level_topology_trivial* — a rank-one torsor has exactly the base topology.
- *level_integral_elements* — the plus ring is the specified integral closure.
- *level_identity_transition* — the self-transition is the identity pair map.
- *level_transition_composition* — two transitions have the stated forward order.
- *level_trivial_plus* — a trivial torsor retains any chosen integral subring.
- *colimit_plus_stage* — a plus element is represented at a finite level.
- *colimit_plus_trivial* — trivial groups preserve the original plus ring.
- *colimit_plus_zero* — for the zero base the colimit and plus ring are zero rings.
- *colimit_topology_unit_scale* — exponent zero gives the union of stage power-bounded rings.
- *colimit_topology_shrink* — first and second powers are both neighbourhoods of zero.
- *colimit_topology_nilpotent* — nilpotents need not be separated before uniform completion.
- *completion_transition* — both pair maps commute with the transition.
- *completion_stage_value* — the two maps use the same finite-level element.
- *completion_base_value* — the structure map agrees with every stage, including 0 and 1.
- *completion_action_stage* — the action extends the specified stage action.
- *completion_action_base* — the action fixes the original base pointwise.
- *completion_action_identity* — For a stage element exchanged with 1 − x, an injective stage inclusion makes the completed action exchange its image with its complement, while the identity fixes it.
- *completion_lift_identity* — lifting all completion inclusions gives the identity.
- *completion_lift_stage* — lifting then restricting recovers any chosen stage.
- *completion_lift_unique* — the extension is determined by the stage values.
- *completion_algebra_value* — Over a nonzero uniform base, `completionAlgebra` sends a nontrivial scalar idempotent to a nontrivial idempotent; neither zero nor one can replace its image.
- *completion_algebra_stage* — scalars agree with the map through a chosen stage.
- *completion_algebra_nilpotent* — a nilpotent scalar dies after uniform completion.
- *completion_algebra_injective* — over a uniform base no scalar dies: `A → A_∞` is faithfully
  flat and the spectral seminorm of a uniform complete `A` is a norm.
- *presentation_prime* — the perfectoid parameter cannot be 0 or 1.
- *presentation_base_invariant* — q is fixed pointwise by the action.
- *relation_plus_constants* — a constant function is integral exactly at its value.
- *relation_plus_pointwise* — every value, not just the identity value, must be integral.
- *relation_plus_target* — an orbit function of an integral element is integral.
- *relation_source_values* — source has the same value at two group elements.
- *relation_target_values* — target is the orbit function and starts at a.
- *relation_unit_value* — the unit selects identity evaluation.
- *relation_unit_source* — source restricted along the unit is the identity.
- *relation_unit_target* — target restricted along the unit is the identity.
- *relation_composition_value* — two edges multiply in traversal order.
- *relation_composition_units* — either identity edge can be deleted.
- *relation_composition_associative* — rebracketing three edges does not change the value.
- *presentation_tensor_left* — the left tensor insertion is constant.
- *presentation_tensor_right* — the right insertion evaluates the action.
- *presentation_tensor_plus* — the isomorphism preserves the entire plus ring.
- *vertex_edge_three* — On the regular ℤ/3 torsor, `iterGaloisMap` of δ₀ ⊗ δ₁ ⊗ δ₂ evaluates to 1 at vertex coordinates (1,2) and the identity point, and to 0 at (1,1).
- *test_spa_target_convention* — evaluation at `(g, x)` followed by the target map gives the
  pullback of `x` along the ring action of `g`, which is `g⁻¹ • x`: the ring action is pulled back
  contravariantly (it follows from `spa_relation_target`).
- *tower_continuousMap_perfectoid* — for `ofTower T`, every `C^0(G^k, Â_∞)` is perfectoid,
  `k = 0` included (it follows from `relation_isPerfectoid`).
- *action_inverse_three* — On the regular ℤ/3 torsor, `galoisTensorMap` of 1 ⊗ δ₁ has value 1 at group coordinate 1 and the identity point, but value 0 at group coordinate 2.
- *relation_composition_noncommutative* — For a presentation with group identified with permutations of three letters, `relation.composition` of the function detecting g(0) = 1 gives 1 on ((01),(12)) and 0 in the opposite order.

### Dependencies

Inside AdicEtaleGeometry: layer A1 for the Huber pair of a finite étale algebra over an arbitrary
complete Tate pair (natural topology, integral plus ring, functoriality, group actions;
*finite-etale-affinoid-algebra*, with *affinoid-system-approximation* and
*finite-etale-approximation*) and for the finite étale and étale sites of generalized adic spaces
(*finite-etale-site*, *etale-site*, *etale-site-generalized*, *generalized-adic-presentation*)
with [KL I] §8.2, Lem. 8.2.17(a), p. 162; stability of finite étale and étale maps under
composition and fibre products is [KL I] §8.2, Lem. 8.2.17(c), p. 162 (by [H96] Prop. 1.7.5),
and the factorisation of a quasi-compact étale map through an open immersion is Lem. 8.2.17(b)
there (by [dJvP] §3.1, Prop. 3.1.7). Other roadmaps:
AdicSpacesPartII layer R0 (uniformization, spectral seminorm, spectral topology, Tate ring norm,
completed tensor product, uniform completed tensor product, finite algebra tensor complete);
PerfectoidSpaces layer P1 (perfectoid Tate rings and algebras), layer P3 (the topologically
henselian finite étale comparison for Tate rings without a base field, [Berkeley] Lecture 7,
Thm. 7.4.8: `FÉt(A) ≅ FÉt(Â)` when a ring of definition is henselian along a pseudouniformizer; [KL I] §2.8, Prop. 2.8.16
supplies the uniformization case), layer P2 (uniform completed tensor products of perfectoid
rings over any Tate base), layer P5 (cofiltered limits of affinoid perfectoid spaces, and
*spa-of-filtered-colimit-of-tate-pairs*, the general form of *spa-of-completed-tower* (i)) and layer
P6 (products with profinite sets); PerfectoidTowers layer P9 (the finite-group form of faithfully
flat module descent);
the Foundations of adic spaces roadmap (AdicSpaces) for Huber pairs, power-bounded subrings,
completion and adic spectra. Mathlib and Tau Ceti as named in the `*Needs:*` clauses: étale,
finite, faithfully flat and projective algebras with descent along faithfully flat maps, standard
étale pairs, direct limits of rings, henselian rings and adic completeness, profinite groups,
locally constant and continuous maps, Galois groups and invariants, separably closed fields;
Huber pairs and their morphisms, Tate rings and their completions, pseudouniformizers,
power-bounded and topologically nilpotent elements, rings of definition, the adic spectrum with
its comap and rational subsets. Sources: [ECD] §3 and §15; [Berkeley] Thm. 7.4.8 and
Lems. 10.1.6–10.1.7; [KL I] §§1.2–1.4, 2.6, 2.8, 8.2, 9.1; [PS] Lems. 7.3 and 7.5;
[H94] Lem. 3.9; [Stacks] Tags 0FWT, 0BN2; [Wedhorn] §6.1. Consumers: DiamondsAndVStacks
layer D6 (*spd-of-a-tate-pair*, *spd-is-a-spatial-diamond*, *gluing-and-the-diamond-functor*,
*etale-site-comparison*) and the `Bun_G` and Newton-strata roadmaps.

## Downstream consumers

AdicSpacesPartIV layers R4 and R5 re-export the sites of A1 on their carriers: the étale slice
site, the pro-étale slice site, the functoriality of the étale site and the reduction of étale
coverings on a stable basis. PerfectoidSpaces layers P3, P5, P6 and PerfectoidTowers layers P8 and P9 cite the named targets
of A1, A3 and A4 — finite étale algebras over a filtered colimit
(*finite-etale-algebras-filtered-colimit*), the finite étale Galois torsors and their completed
towers (*torsor-spa-orbits*, *spa-of-completed-tower*) and the compatibility clause of the
assembled Proposition 6.4 (*etale-descent-to-finite-stage-6-4*). DiamondsAndVStacks layer D6
consumes A4's perfectoid torsor presentation (*perfectoid-cover-presentation*) and the analytic
input of the étale-site comparison (*diamond-of-analytic-adic-space-and-etale-site-15-6*). The
étale-cohomology roadmaps, the Shimura-variety roadmaps, the `p`-adic Hodge theory roadmaps and
the adic-coefficient roadmaps consume A1–A4 through the layers named in their own documents.

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
