# Roadmap: étale cohomology of diamonds and its four operations

**Summary.** This roadmap builds the coefficient categories and functors used to do étale cohomology on diamonds and small `v`-stacks. The central category is the presentable stable category `𝒟_ét(Y, Λ)`, with triangulated homotopy category `D_ét(Y, Λ)`. Its four operations are pullback, direct image, derived tensor product and internal Hom. Their construction must carry adjunctions, composition laws, base-change transformations and coefficient changes, so that applications can use a coherent calculus rather than isolated cohomology groups.

The geometric part extends the properness theory of `DiamondsAndVStacks` §D4.11 with partially proper morphisms, canonical compactifications and étale extension by zero. The finiteness part supplies constructible sheaves, perfect-constructible complexes, geometric transcendence dimension and cohomological bounds. These culminate in compact generation and the identification of compact objects with perfect-constructible complexes under one uniform cohomological bound. This is the input to exceptional operations, duality and diamond-valued arithmetic geometry.

The main source is Scholze's *Étale cohomology of diamonds*, abbreviated ECD below. The layers organize reusable mathematical interfaces; the source locators identify statements and proof ingredients, not a prescribed order of formalization. [Suggested.lean](Suggested.lean) suggests names and signatures. This README specifies the mathematics, including the enhanced statements and hypotheses that a homotopy-category signature alone cannot express.

## Scope and ownership

Geometry is supplied by the perfectoid and diamond roadmaps. General enhanced sheaf theory and continuous group cohomology also have their own owners. The following boundaries determine which interfaces this roadmap imports.

| Supplier or consumer | Boundary |
| --- | --- |
| `AdicSpacesPartII`, §R0.19.10 | Quasicompact and quasiseparated objects and morphisms of a topos; algebraic/coherent topoi. |
| `PerfectoidSpaces`, Layers P0–P6, `DiamondsAndVStacks`, Layers D0–D6 | Perfectoid spaces, diamonds and small `v`-stacks; étale and quasi-pro-étale morphisms; underlying spaces, geometric points, presentations and cutoffs. `DiamondsAndVStacks` §D4.11 is the sole owner of the properness predicate for `v`-stacks and its basic API, re-exported by C4.1. C0 defines the three coefficient sites. C4 owns partial properness, valuative refinements and canonical compactification. |
| `EnhancedDerivedSheaves`, §§0.1–0.4 and Layers E1–E3 | Unbounded dg/enhanced derived categories of sheaves of modules, `K`-injective and `K`-flat models, derived tensor and Hom, coherent limits and exact-functor coherence, replete-topos convergence, Postnikov completion, coherent diagrams, hyperdescent and adjoints. C2–C3 specialize them to étale coefficients on `v`-stacks. |
| `ClassicalAdicEtaleCohomology`, §§2.1–2.5, 3.1, 6.1–6.3, 7.1–7.3, 10.1–10.4 and 11.2 | Henselian and Zariski–Riemann inputs, classical algebraically closed field invariance, tautness, and annulus/open-ball cohomology. C1 uses classical field invariance; C6 proves `v`-stack field invariance from that input and C5, avoiding a reverse dependency through C1. C8.37 specializes §11.2, `field_cohomological_dimension_transcendence`. |
| `SchemeAndStackFoundations`, §2.15; `EtaleCohomologyFoundations`, §F.2.1 | Torsion proper base change for schemes and continuity of étale topoi under qcqs limits with affine transitions. C5 uses these in its valuation-space argument. |
| Tau Ceti `ProfiniteCohomology`, Layers `0, 10` and `11` | Discrete continuous modules, their dictionary with `TopRep`, all-degree continuous cohomology, filtered-colimit compatibility and cohomological dimension. C8 proves the geometric point/sheaf/cohomology comparison; it does not introduce another cohomology carrier. |
| Tau Ceti `ProfiniteProPGroups`, Layers `2, 3` and `6` | Profinite Sylow theory, pro-`p` groups and Sylow cohomological-dimension equality. C8 adds the wild kernel attached to an action on an algebraically closed valued field. |
| `ArithmeticGaloisDuality`, Layer R02.1–R02.2 | Continuous Hochschild–Serre for closed normal subgroups, with all-degree convergence and edge maps. C8 applies it to discrete `ℓ`-primary torsion coefficients. |
| Tau Ceti `LocalFieldsRamification`, Layer `4` | Wild and tame ramification for discrete local fields. C8 works with general value groups and residue fields; the constructions must agree on their common domain. |
| `AdicSpacesPartII`, R0.11 and R0.7; `AdicEtaleGeometry`, A2.1 and A2.6 | Completed adic residue fields and valuation amalgamation (`ValuationSpectrum.exists_amalgamation`, including its field form). A2.6 supplies the topological fibre invariant `AdicSpace.relDim` on arbitrary topological sources and target types. A2.1 supplies Huber partial properness on its stated weakly/`+weakly` finite-type domain. C8.48a owns the unrestricted analytic field-pair predicate, its reduction to perfectoid tests and its diamondification comparison under relative tautness. |
| `DGAInfinity`, Layers `5`–`6` | Perfect module complexes, thick closure, and the compact objects of a derived category generated by a set of compact objects. C7 and C9 import these categorical results. |
| `DiamondSixOperations` | General exceptional direct image and exceptional inverse image consume this roadmap. C5 constructs `f_!` only for étale `f`, independently of that general construction. |
| `AdicCoefficientsAndComparisons`, `FarguesFontaineDiamonds` and arithmetic applications | Consume the coefficient categories, base change, finiteness and dimension bounds; their coefficient completions and arithmetic comparisons are outside this roadmap. |

Use the pinned library vocabulary directly. Mathlib supplies `CategoryTheory.GrothendieckTopology`, `CategoryTheory.Sheaf`, site points and continuity/cocontinuity, `ModuleCat`, `DerivedCategory`, adjunctions and monoidal categories. It also supplies `SpectralSpace`, `Topology.IsConstructible`, `WithConstructibleTopology`, `TopCat.Sheaf`, `topologicalKrullDim`, `IntermediateField`, `Algebra.trdeg`, `Dense` and `CategoryTheory.SimplicialObject`. Ordinary finite presentability uses `CategoryTheory.IsFinitelyPresentable`; the derived compactness comparison must come from the enhanced supplier. `CategoryTheory.ObjectProperty.triangEnvelope` supplies the ordinary thick-envelope vocabulary. The continuous cohomology carrier is `continuousCohomology`, and the pro-`p` predicate is Tau Ceti's `TauCeti.IsProP`.

The prerequisites under each target specify its more precise inputs. A local reference such as `C0.1` identifies a numbered target below; an external reference names its owner and layer. Foundational category, field and topology interfaces are imported rather than reconstructed here.

## Conventions

- `Perf` means perfectoid spaces in characteristic `p`. Maps called étale or quasi-pro-étale satisfy the locally separated convention. Covers are jointly surjective families of maps of `v`-stacks.
- `Y_ét` is defined for a locally spatial diamond, `Y_qproét` for a diamond, and `Y_v` for a small `v`-stack. An adequate cardinal cutoff `κ` makes the latter sites small. Cutoffs satisfy `DiamondsAndVStacks` §D0.23; they may be singular strong limits with `cf(κ)>ω`. Work in a fixed adequate cutoff when asserting presentability. Pullbacks and tensor commute with enlargement; ambient right adjoints carry comparison maps whose invertibility requires additional hypotheses. For `Y≠∅` and `Λ≠0`, the uncut module-sheaf category has no set of generators and its derived enhancement is not presentable; for `Y=∅` or `Λ=0` these coefficient categories are zero.
- A geometric stalk is evaluated at the closed point of `Spa(C, C⁺) → Y`, where `C` is complete and algebraically closed and `C⁺` is an open bounded valuation subring of arbitrary rank. Restricting to `C⁺ = O_C` does not give the full stalk test.
- `D` denotes a triangulated homotopy category; `𝒟` denotes its stable `∞`-category enhancement. Left completion means the homotopy category of the enhanced Postnikov limit, with its derived inverse-limit model. Ordinary compatible towers in a triangulated category lose the `lim¹` contribution to morphisms.
- `ℓ` always denotes a prime, and `p` denotes the characteristic of Perf. `Λ` is a commutative coefficient ring in the tensor, perfect-complex and compact-generation results. Constructible module sheaves and the cohomology/stalk criterion use noetherian `Λ`. Prime-to-`p` torsion means `nΛ = 0` for a specified `n` coprime to `p`. Results allowing arbitrary `Λ` retain that generality.
- Pullback is contravariant: `(f ∘ g)^* ≃ g^* ∘ f^*`. Direct image and internal Hom on `D_ét` are intrinsic right adjoints, computed by étale coreflection of their `v`-site versions at every adequate cutoff. Derived tensor is inherited without coreflection. The four operations carry coherent enhancements and natural transformations.
- Ambient `v`- and quasi-pro-étale direct images in C0–C3 are formed at a fixed adequate cutoff `κ`; a suppressed `κ` in such a formula denotes this stagewise construction. There is no uncut ambient direct-image functor in this specification. In comparisons with étale objects, write `i_{Y,κ}` for the fully faithful inclusion into `𝒟(Y_v,κ,Λ)`, and `R_{Y,ét,κ}` for its right adjoint. The intrinsic étale categories, their four operations and the uncut coreflection of C2.13 are independent of `κ`.
- A constructible stratum is a constructible locally closed subset of the underlying spectral space. It need not define a sub-`v`-stack. Restriction to a constructible closed support is formed using extension by zero from its open complement.
- Perfect-constructible means stratified constant perfect complexes after strictly totally disconnected tests. Over a general ring this is stronger than bounded constructible cohomology. Over a field the two agree on a quasicompact space.
- In C8, complete nonarchimedean fields carry nontrivial `ultrametric` norms. Field towers and base-change squares commute through explicit algebra structures, and embeddings are isometric for compatible chosen norms. Point-presentation isomorphisms in C8.25 preserve topology and valuation rings, without a prescribed norm normalization.
- Topological dimensions take values in `WithBot ENat`: the empty space has value `−∞`, and unbounded finite chain lengths have value `+∞`. Field degrees take values in `ENat`. Keep generating, independent and modified topological transcendence degrees separate. The modified degree minimizes over further algebraically closed complete valued extensions; the geometric dimension then takes a supremum over point presentations.
- Local finiteness of geometric dimension permits different bounds on different source neighborhoods. C9 instead requires one natural `N` for all coefficient sheaves on `Y`, which is then the same bound on every quasicompact separated étale test object.

## Exact supplier contracts

### From Mathlib at the pin

Use the pinned Mathlib declarations directly. `CategoryTheory.GrothendieckTopology`,
`CategoryTheory.Sheaf`, `CategoryTheory.GrothendieckTopology.Point`,
`CategoryTheory.Functor.IsContinuous` and `CategoryTheory.Functor.IsCocontinuous` supply
ordinary sites, sheaves, points and site comparison vocabulary. The geometric sites in C0
are targets here; a bare Grothendieck topology does not supply their geometric objects.
`ModuleCat`, `Module.Finite`, `IsNoetherianRing`, `CategoryTheory.IsFinitelyPresentable` and
`TopCat.Sheaf` supply module coefficients, finite generation and ordinary finite
presentability. On a topological space use `CategoryTheory.constantSheaf`,
`TopCat.Sheaf.pullback` and `TopCat.Sheaf.pushforward` directly, and use
`TopCat.ofHom` with `continuous_subtype_val` for a subspace inclusion. These are the constant
and restriction functors in C7, with no separate local definitions.

`DerivedCategory`, `DerivedCategory.homologyFunctor` and
`CategoryTheory.Sheaf.H` are the ordinary derived and cohomology carriers.
`CategoryTheory.Adjunction`, `CategoryTheory.MonoidalCategory`,
`CategoryTheory.MonoidalClosed`, `CategoryTheory.ObjectProperty.IsTriangulated` and
`CategoryTheory.ObjectProperty.triangEnvelope` provide the categorical vocabulary.
Derived compactness here means preservation of coproducts by mapping spectra, or the
corresponding shifted Hom functors on the triangulated category; it is distinct from
ordinary finite presentability of module sheaves. Enhanced limits, tensor–Hom constructions,
compact generation and coherences are supplied by the roadmap contracts below.

The topological declarations are `SpectralSpace`, `Topology.IsConstructible`,
`IsLocallyClosed`, `WithConstructibleTopology`, `Specializes`, `topologicalKrullDim`,
`irreducibleSetEquivPoints`, `Order.krullDim_eq_of_orderIso`, `IsClosedMap` and
`IsProperMap`. Use `CategoryTheory.SimplicialObject` for chain-space diagrams and
`TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system` for nonempty inverse limits of
nonempty compact Hausdorff spaces. The supplied `AdicSpace.relDim` in C8 uses the actual
subspace topology, and chains use specialization in the original topology before passing
to the constructible topology.

`IntermediateField`, `IntermediateField.adjoin`, `IsAlgebraic`, `Algebra.trdeg`,
`Dense`, `ValuationSubring` and `ValuationSubring.comap` supply the field and valuation
carriers. Use `trdeg_add_eq` for algebraic towers,
`spectralNorm.normedField` and `spectralNorm_extends` for the norm on an algebraic extension.
Completion of an algebraic closure in positive characteristic is the theorem required in
C8.6; the characteristic-zero hypothesis of `IsAlgClosed.of_denseRange` does not discharge it.
`PadicAlgCl`, `PadicComplex` and the dense completion embedding give C8.3–C8.4 their
`p`-adic checks. `continuousCohomology` on `TopRep` is the continuous cohomology carrier used
in C8.27; no separate group-cohomology carrier is defined here.

### From Tau Ceti at the pin and roadmaps on main

`TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic` supplies
`TauCeti.ValuationSpectrum.spa`, `TauCeti.ValuationSpectrum.spa_def` and
`TauCeti.ValuationSpectrum.mem_spa_iff`, the continuous valuations bounded by an explicit
plus subring, with their existing subspace topology. C5.7 uses this spectrum for a discrete
field and the image of a valuation subring, and proves the valuation-ring comparison.
Mathlib `Valuation.valuationSubring` and `Valuation.isEquiv_iff_valuationSubring` provide the
ring attached to a field valuation and its invariance under equivalence; a separate
Zariski–Riemann-space carrier and topology are not introduced.

`TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic` supplies `TauCeti.IsProP`,
`TauCeti.isProP_iff`, `TauCeti.isProP_iff_isPGroup`, `TauCeti.IsProP.of_surjective`
and `TauCeti.IsProP.quotient`. C8.34 concludes this predicate for the closed wild kernel;
its construction is the valued-field theorem of this roadmap, while the pro-`p` predicate and
its generic quotient theory belong to the supplier. `ProfiniteProPGroups`, Layers `2, 3` and `6`,
supplies the Sylow and cohomological-dimension results. `LocalFieldsRamification`, Layer `4`,
supplies discrete local-field wild and tame ramification; the general valued-field action in
C8.33–C8.40 agrees with that theory on its discrete-field domain.

`TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic` supplies
`TauCeti.IsSmoothDiscrete` and `TauCeti.DiscreteRep`, the discrete continuous-module dictionary
of `ProfiniteCohomology`, Layer `0`. The same roadmap, Layers `10`–`11`, supplies all-degree
comparison, filtered-colimit compatibility and `ℓ`-primary torsion cohomological dimension.
`TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.Basic`
supplies `TauCeti.CohomologicalDimensionLE` and `TauCeti.cohomologicalDimensionAt`: it quantifies over all discrete `ℓ`-primary
torsion coefficients and all higher degrees, rather than over modules with one chosen
exponent. C8.28 uses exactly that coefficient scope.

`TauCeti.Topology.Spectral.ProConstructible` supplies
`TauCeti.IsProConstructible` and `TauCeti.isProConstructible_iff_isClosed` in the
constructible topology, used in the separated hull comparison. `AdicSpacesPartII`, R0.11,
supplies the completed residue affinoid field `κ(x) = (k(x)^∧, k(x)⁺^∧)` of an analytic adic point.
`AdicSpaces`, Layers `0`–`5`, supplies the Huber-pair and adic-space foundations on which the
geometric suppliers build.

`SchemeAndStackFoundations`, §2.15 (`gabber_affine_proper_base_change`,
`etale_cohomology_limits`), supplies henselian-pair torsion invariance and continuity of
étale cohomology of qcqs schemes under cofiltered limits with affine transitions.
Scheme torsion proper base change is supplied by `EtaleCohomologyFoundations`,
§F.2.1 (`VanishingCycles.properBaseChange`), for a proper morphism and a bounded-below torsion
complex, with arbitrary base change. C5.7 uses these contracts for the relative
Zariski–Riemann argument; no invertibility restriction on scheme torsion is added.

`DGAInfinity`, Layers `5`–`6`, supplies perfect module complexes, derived tensor and Hom
with their adjunction and projection formulas, thick closure and the compact/thick-envelope
theorem. Dualizability of a perfect complex `P` with dual `RHom_Λ(P, Λ)` is proved here in
the point case of C7.12 (`IsPerfectLocalSystem.dualizable`), using the thick-envelope theorem.
Specialize the supplier's module-derived category
to an ordinary commutative ring `Λ`: perfect means represented by a bounded complex of finitely
generated projective `Λ`-modules. C7 consumes this notion and its basic module API; it owns the
stratified sheaf and diamond predicates, their descent and their coefficient-ring continuity.

### Topological open extension by zero

**Open extension by zero** (`extendByZero`). For a ring `Λ`, a topological space `X` and
an open `U⊆X`, use Mathlib's `TopologicalSpace.Opens.sheafEquivOver` to identify sheaves
on `U` with sheaves on the slice of the open-set site. Define `extendByZero` by this
identification followed by the canonical sheaf pullback along `CategoryTheory.Over.forget U`.
The pinned `TauCeti.CategoryTheory.PresheafExtensionByZero.functor` and
`TauCeti.CategoryTheory.PresheafExtensionByZero.adjunction` in
`TauCeti.CategoryTheory.Sites.ExtensionByZero` give its presheaf model; sheafification
and uniqueness of left adjoints identify that model with the canonical functor.
`TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback`
already gives sheaf exactness for `AddCommGrpCat`. This roadmap supplies the
`ModuleCat Λ` comparison and exactness, using the same presheaf functor with module
values, and the following topological adapter API before the reductions in C0–C1:

- `extendByZeroAdjunction`: The adapter is left adjoint to restriction to `U`, by composing
  Mathlib's `sheafAdjunctionContinuous` with the slice equivalence and transporting along
  `overPullbackSheafEquivOver`.
- `extendByZero_exact`: It preserves finite limits and finite colimits for every ring `Λ`.
- `extendByZero_stalk_mem`: At `x∈U` its stalk is naturally the input stalk at `x`.
- `extendByZero_stalk_not_mem`: At `x∉U` its stalk is zero.

These statements use no spectrality or noetherianity. C7.1 owns preservation of
constructibility for quasicompact opens in spectral spaces over noetherian rings.
Topological `j_!` in C0–C3 uses this adapter (abelian groups are `ℤ`-modules) under C0.19;
C5's étale extension by zero on diamonds is a separate geometric construction.
(ECD proof of Theorem 16.1, pp. 92–93; ECD Lemma 20.4, pp. 113–114;
pinned Tau Ceti `CategoryTheory/Sites/ExtensionByZero.lean`, presheaf adjunction and
sheaf finite-limit instance; Mathlib `Topology/Sheaves/Over.lean`, `sheafEquivOver`.)

**Checks.**

- For `U=∅` the adapter is the zero functor, with zero stalks everywhere.
- For `U=X` it is naturally the identity, with the identity adjunction and stalk comparisons.
- `extendByZero_sierpinski`: On Mathlib’s Sierpiński space `Prop` with open generic point `True` and closed point `False`,
  extension of `M` from `{True}` has stalk `M` at `True`, zero at `False`, and zero global sections.
  For `M≠0` this differs from direct image, whose stalk at `False` is `M`.

### From geometric and enhanced roadmaps

`PerfectoidSpaces`, Layers P0–P6, supplies perfectoid rings and spaces, geometric field pairs,
rational localization, tilting, almost purity and finite-stage étale descent, with arbitrary
open integral plus rings. `AdicSpacesPartII`, §R0.19.10, supplies algebraic/coherent topoi
and quasicompact and quasiseparated topos objects and morphisms.
`DiamondsAndVStacks`, Layers D0–D6, supplies cutoff cardinals (§D0.23), strictly totally
disconnected tests (D1), the `v`-topology and pro-étale geometry (D2–D3), small `v`-stacks and
diamonds (D4), their spaces and field-point presentations (D5), and analytic diamondification
and the étale-site comparison (D6). The field-point contracts retain arbitrary-rank open
bounded valuation subrings, localization at a point and valuative separatedness (D3.8).
D4.5 supplies the `v`-sheaves `T̲ : X ↦ C(|X|, T)` used in C4.3 for locally compact
Hausdorff `T`. D4.11 supplies the properness predicate for
`v`-stacks, closed immersions being proper, composition, base change and the field-valuative
criterion. C4.1 re-exports that predicate and basic API; C4 extends it with partial properness,
valuative refinements and canonical compactification. C0 owns coefficient sites over these objects.

`AdicEtaleGeometry`, A2.6, supplies `AdicSpace.relDim`, the supremum of the
topological Krull dimensions of subspace fibres, for arbitrary topological sources
and target types. C8.2 supplies its homeomorphism and boundary specializations;
C8.15 and C8.20 use this same invariant for analytic maps and diamond tests.

`AdicEtaleGeometry`, A2.1, supplies Huber's analytic valuative criterion on its stated
weakly/`+weakly` finite-type domain. C8.48a builds the field-pair criterion of CS17
Remark 4.2.20 for arbitrary analytic spaces. Over `Spa(ℤ_p,ℤ_p)`, its comparison with C4.5
requires relative tautness: the preimage of every affinoid target open is taut. C8.48a
reduces arbitrary complete-field tests to perfectoid tests and applies C4.18 on those opens.
C8.49–C8.51 use only the unrestricted field-pair predicate. `AdicEtaleGeometry` Layer A1 supplies analytic
étale sites and geometric points for the classical supplier. `ClassicalAdicEtaleCohomology`, §§2.1–2.5 and 6.1–6.3,
supplies henselian and valuation-support comparison; §3.1 supplies tautness; §§7.1–7.2
supply surjective algebraically closed field-pair invariance, including its perfectoid
finite-stage passage. For geometric field-pair spectra `X₁ → X₃ ← X₂` of residue
characteristic `p>0`, with `X₁ → X₃` surjective, a quasicompact open `j₂:U₂⊆X₂`
and an abelian group `M` killed by `n` prime to `p`, §7.3 supplies `Hⁱ(W_ét, j₂!M)=0` for
`W=X₁×_{X₃}X₂` and `i≥0`, except that `H⁰=M` when `U₂=X₂`. It also supplies
geometric connectedness of connected affinoid perfectoid spaces after arbitrary geometric
field-pair extensions. §§10.1–10.4 supply discs, annuli, cohomological continuity and the
coordinate pullback calculation; §11.2 supplies `field_cohomological_dimension_transcendence`
for arbitrary field extensions and primes, specialized in C8.37. In the characteristic-`p`
instances used here, prime-to-`p` coefficients are units in every geometric plus ring. The annulus input retains its degree-one
Kummer class: a `p`-power root tower does not kill prime-to-`p` `H¹`. C6.4 applies the actual
transition maps of its annulus presentation before taking the cohomological colimit.

**Checks.**

- In the support comparison, `U₂=X₂` gives `H⁰(W_ét,M)=M` and zero higher cohomology.
- For a proper quasicompact open `U₂⊊X₂`, all degrees of `Hⁱ(W_ét,j₂!M)` vanish when `X₁→X₃` is surjective.
- Let `X₃=X₂=Spa(C,C⁺)` in characteristic `p`, with `C⁺` of rank two, and
  `X₁=Spa(C,O_C)`. The first map is not surjective. For `U₂={η}` and nonzero
  prime-to-`p` torsion `M`, `W=X₁` and `H⁰(W_ét,j₂!M)=M`, although `U₂≠X₂`.
  (ECD Lemma 16.3, p. 93; `ClassicalAdicEtaleCohomology`, §7.3.)

`EnhancedDerivedSheaves`, §§0.1–0.4, supplies ringed-site enhancements, `K`-injective and `K`-flat
replacements, derived tensor–Hom, coherent derived limits and exact-functor coherence,
including the `ClassicalDerived` exports. Its Layers E0–E3 supply the enhancement comparisons,
replete-topos inverse limits, Postnikov completion, hyperdescent, presentability, adjoints
and coherent mates.
Use §E2.3 (`postnikovCompletion`) for a coherent Postnikov limit including its mapping-space
`lim¹` contribution, §E2.4 for cohomological convergence, and §E3.4 (`coherentMate`) for
base-change mates. C9 requires realization of every compatible Postnikov tower and one
uniform truncation window, not only convergence of towers attached to individual objects.
Stacks Tag 0D6P supplies object-wise convergence on a site; C9.3 also proves
reconstruction for arbitrary coherent compatible towers from the uniform bound.
C0.20–C0.21 supply repleteness of the geometric topoi. No coherent projective
covering condition, and hence no local weak contractibility, is required from them.

`ArithmeticGaloisDuality`, §R02.2.1, supplies continuous Hochschild–Serre for a closed normal
subgroup and its profinite quotient, with all-degree convergence and edge maps on discrete
`ℓ`-primary torsion modules. C8.32 and C8.35 use this contract together with
`ProfiniteCohomology`, Layers `10`–`11`, to compare the cohomological dimensions of an extension
and of a quotient by a pro-`p` kernel.

## How to read the build

| Layer | Main output |
| --- | --- |
| C0 | Three sites, geometric stalks, comparison pullbacks, repleteness and bounded cohomological comparisons |
| C1 | Pushforward comparisons and base change, with the separate coefficient and geometric cases |
| C2 | `v`-local étaleness, `D_ét`, its stable enhancement, hyperdescent and étale coreflection |
| C3 | Pullback, direct image, tensor, internal Hom and coefficient change |
| C4 | Re-exported properness API, partial properness and canonical compactification |
| C5 | Étale extension by zero and proper base change |
| C6 | Algebraically closed base-field invariance |
| C7 | Constructible sheaves, perfect local systems and perfect-constructible complexes |
| C8 | Topological and geometric dimensions, point stabilizers and cohomological bounds |
| C9 | Uniform bounds, compact generators and compact-object characterization |

The C8 point quotient, point/sheaf equivalence and specialization-stabilizer results must precede the C7 filtration argument. They use C0 and the geometric suppliers, without using C7 constructibility, so this order has no mathematical cycle. The C8 acyclicity statement reuses the proof in C0; C9 bounded filtered compactness is the finite-field specialization of the C7 restricted compactness theorem.

## Sources and proof requirements

C0's higher-direct-image vanishing requires a proof in every positive degree. The splitting argument for rational opens in a perfectoid ball establishes the degree-one step; it does not by itself establish the higher-degree dimension shifting in ECD Proposition 14.7, p. 84. Develop that argument with `DiamondsAndVStacks`, Layer D3 and the enhanced coefficient theory before using the full comparison.

For C4 use `R⁺ ⊂ R°` in Tate pairs, and retain uniqueness in the partial-properness valuative criterion (ECD Definitions 18.1 and 18.4, pp. 101–103). The converse colimit description in Proposition 18.9, p. 106, is required here with quasiseparated target; the unrestricted printed converse is not used. The hull in Lemma 14.5, pp. 82–83, maps through a pro-constructible generalizing injection, which need not be open for higher-rank valuation rings.

C7 perfect-constructible `v`-descent is a theorem for arbitrary commutative `Λ`. For noetherian `Λ` it follows from constructible descent and the stalk criterion. For general `Λ`, prove descent of the perfect comparison across the separated pro-étale hull, with a `cone`-vanishing argument on the whole descended stage. The substitution by the underlying topological fibre product in the proof of ECD Proposition 20.13, p. 118, alone does not justify an affinoid pro-étale cover.

C8 requires completion of algebraic closures in arbitrary characteristic, valuation-compatible extension/amalgamation, and a universe bound for finite modified-degree witnesses. Conrad's Theorem 1.1 and §2, pp. 1–3, provide the coefficient/root-approximation route for completion. Temkin's finite comparison depends on the perturbation theorem in §3.1, including its earlier primitive perturbation input (Temkin 2010, Lemma 6.3.2); C8.4a–C8.4c build these perturbation inputs explicitly. C8.11a specializes
`AdicSpacesPartII` R0.7 to complete real-valued fields before C8.12–C8.13. No general infinite-degree monotonicity or equality with the modified invariant is asserted. ECD Question 21.4, p. 122, and Fargues–Scholze Problem I.11.1, §I.11, pp. 41–42, distinguish the open questions from the finite theorem.

The specialization-chain complex in C8 needs the quasi-augmented comparison and normalized-support theorem used in Kelly–Saito–Tamme Lemma 6.6, p. 24, which refer to Scheiderer §2, Remark 2.5, Theorem 4.1 and Proposition 4.7. An ordinary Cartesian hypercover theorem does not establish this comparison. The dimension bound can also be obtained from Stacks Tag 0A3G, but that route does not replace the chain-space interface specified here. The wild-automorphism proof uses the compact closure of the powers of `γ`; prove that factorial convergence and the isometry condition extend the powers continuously to a quotient of the profinite completion of `ℤ`.

C9.3 proves category-level left completeness by realizing arbitrary compatible Postnikov towers under the uniform bound. `EnhancedDerivedSheaves` §E2.4 supplies the derived-limit and cohomological stabilization tools and object-wise convergence of Stacks Tag 0D6P; the finite-bound tower reconstruction is a target here. Tag 0719 treats ringed spaces and does not directly supply the required site theorem. Promote `IsPerfectLocalSystem.dualizable` in C7 to a usable named input for C9: its dual is `RHom_Λ(L, Λ)`, with `RHom_Λ(L, A) ≃ L^∨ ⊗^L A`. The compact/thick-envelope theorem comes from Tau Ceti `DGAInfinity` Layers `5`–`6`.

The geometric suppliers must expose the field-point localization/presentation contracts, valuative separatedness for `v`-stacks, locally compact Hausdorff `v`-sheaves, and the coherent-topos limit theorems used below. The enhanced suppliers must expose module-coefficient repleteness/hyperdescent, small limits of presentable categories and coherent adjunction/base-change data. These are inputs to this roadmap's proofs, not assertions that generic ordinary-category carriers already provide the geometry or enhancement.

## References

- **ECD:** Peter Scholze, [*Étale cohomology of diamonds*, arXiv:1709.07343v4](https://arxiv.org/pdf/1709.07343v4), 14 April 2026. Locators below use its printed pages. Core statements are in §§14, 16–21, with Convention 22.1 identifying the local dimension condition.
- **CS17:** Ana Caraiani and Peter Scholze, [*On the generic part of the cohomology of compact unitary Shimura varieties*](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Annals of Mathematics 186 (2017), 649–766, §4.2, Propositions 4.2.19 and 4.2.21, pp. 711–712.
- **KST:** Shane Kelly, Shuji Saito and Georg Tamme, [*On pro-cdh descent on derived schemes*, arXiv:2407.04378v3](https://arxiv.org/pdf/2407.04378v3), Lemma 6.6 and proof, p. 24.
- **Temkin:** Michael Temkin, [*Topological transcendence degree*, arXiv:1610.09162v2](https://arxiv.org/pdf/1610.09162v2), §§2.1–2.2 and 3.1–3.2, pp. 4–8; published in Journal of Algebra 568 (2021), 35–60.
- **Conrad:** Brian Conrad, [*Completion of algebraic closure*](https://math.stanford.edu/~conrad/248APage/handouts/algclosurecomp.pdf), Theorem 1.1 and §2, pp. 1–3.
- **Stacks:** [The Stacks Project](https://stacks.math.columbia.edu/). Individual tags below are stable locators for their numbered definitions and lemmas. Section 13.37 supplies compact-generation/thick-envelope statements; Tag 0D6P supplies the site-level Postnikov comparison.
- **FS:** Laurent Fargues and Peter Scholze, [*Geometrization of the local Langlands correspondence*, arXiv:2102.13459v4](https://arxiv.org/pdf/2102.13459v4), §I.11, pp. 41–42, for the distinction between a dimension theorem and the stated problem.

<a id="c0"></a>

## Layer C0: Sites, stalks and cohomological comparison

Build the three sites and their comparison morphisms. The stalks retain higher-rank geometric points, and the cutoff categories retain their universe data. Repleteness provides unbounded `v`- and quasi-pro-étale convergence; the ordinary étale category is asserted left-complete here only for strictly totally disconnected spaces.

### Sites, universes and points

#### C0.1 The étale site of a locally spatial diamond

Let `Y` be a small `v`-stack on Perf that is a locally spatial diamond. The étale site `Y_ét` is the site whose objects are the étale maps `Y′ → Y` that are locally separated (Convention 10.2), whose morphisms are maps over `Y`, and whose coverings are the families `{Y′_i → Y′}` that are jointly surjective as maps of `v`-stacks on Perf. Every object `Y′` is again a locally spatial diamond, and the topos `Y_ét^∼` is the category of étale sheaves on `Y`.

Require the following API.

- `etaleSite`: For a locally spatial diamond `Y`, the Grothendieck topology on the category of locally separated étale maps `Y′ → Y` whose covering sieves are those generated by jointly surjective families.
- `etaleSite.mem_iff_surjective_points`: A family of étale maps `{Y′_i → Y′}` in `Y_ét` generates a covering sieve if and only if the images of the `|Y′_i|` cover `|Y′|`.
- `etaleSite.hasFiniteLimits`: `Y_ét` has all finite limits, computed as fibre products and equalizers of small `v`-stacks over `Y`.
- `etaleSite.over_equiv`: For an étale map `U → Y` in `Y_ét`, the slice `(Y_ét)/U` is equivalent to `U_ét` as a site.
- `etaleSite.pullback`: A map `f : Y → Z` of locally spatial diamonds gives the continuous functor `Z_ét → Y_ét, Z′ ↦ Z′ ×_Z Y`, which preserves finite limits; hence a morphism of sites `f_ét : Y_ét → Z_ét`, with `(g ∘ f)_ét = g_ét ∘ f_ét` and `id_ét = id`.
- `etaleSite.perfectoid_compat`: For a perfectoid space `X, X_ét` is equivalent to the étale site of the perfectoid space `X`, compatibly with coverings.
- `etaleSite.adic_compat`: For an analytic adic space `Z` over `ℤ_p, (Z^♢)_ét` is equivalent to `Z_ét` (ECD Lemma 15.6, `DiamondsAndVStacks`, Layer D6); this comparison uses `DiamondsAndVStacks`, Layer D6, as does C1.

**Checks.**

- `etaleSite_geometricPoint`: For `Y = Spa(C, O_C)` with `C` algebraically closed, every étale map to `Y` is a disjoint union of copies of `Y`, and global sections `Y_ét^∼ → Set` is an equivalence.
- `etaleSite_chain`: For `Y = Spa(C, C⁺)` with `C` algebraically closed, every étale map to `Y` is a local isomorphism, and `Y_ét^∼` is equivalent to the category of sheaves on the totally ordered space `|Y|`.
- `etaleSite_empty`: For `Y = ∅` the site has one object and the topos is the terminal category.
- `etaleSite_tilt`: For `Y = Spa(R, R⁺)^♢` with `(R, R⁺)` a perfectoid Tate pair, `Y_ét` is equivalent to `Spa(R♭, R♭⁺)_ét`.
- `etaleSite_not_qproet`: For an infinite profinite set `S, Spa(C, O_C) × S → Spa(C, O_C)` is quasi-pro-étale but not étale, so it is not an object of `Spa(C, O_C)_ét`.

*Needs:* `DiamondsAndVStacks`, Layer D3; `DiamondsAndVStacks`, Layer D5; `DiamondsAndVStacks`, Layer D4; `CategoryTheory.GrothendieckTopology`; `CategoryTheory.Sheaf`.

(ECD Definition 14.1(i), p. 81; ECD paragraph after Definition 14.1, p. 81.)

#### C0.2 The quasi-pro-étale site of a diamond

Let `Y` be a diamond. The quasi-pro-étale site `Y_qproét` is the site whose objects are the quasi-pro-étale maps `Y′ → Y` that are locally separated (Convention 10.2), whose morphisms are maps over `Y`, and whose coverings are the families that are jointly surjective as maps of `v`-stacks on Perf. For every cutoff cardinal `κ` (ECD Lemma 4.1) `Y_qproét,κ` is the full subsite of objects `Y′` admitting a surjection from a `κ`-small perfectoid space (equivalently, by the perfectoid basis, the site of `κ`-small perfectoid spaces quasi-pro-étale over `Y`, which has the same topos); small sheaves on `Y_qproét` form the large filtered colimit of the topoi `Y_qproét,κ^∼` along the fully faithful restriction functors.

Require the following API.

- `qproetSite`: For a diamond `Y` and a cutoff cardinal `κ`, the Grothendieck topology on `κ`-small locally separated quasi-pro-étale maps `Y′ → Y` with jointly surjective coverings.
- `qproetSite.restrict_fullyFaithful`: For `κ ≤ κ′` the induced functor on sheaf topoi is fully faithful and commutes with cohomology.
- `qproetSite.over_equiv`: For a quasi-pro-étale `U → Y`, the slice of `Y_qproét` at `U` is equivalent to `U_qproét`.
- `qproetSite.pullback`: A map `f : Y′ → Y` of diamonds gives a finite-limit-preserving continuous functor `Y_qproét → Y′_qproét` by base change, hence `f_qproét`, functorial in `f`.
- `qproetSite.etale_le`: Every object of `Y_ét` is an object of `Y_qproét` when `Y` is locally spatial, and `Y_ét → Y_qproét` preserves fibre products and coverings.
- `qproetSite.std_basis`: The strictly totally disconnected perfectoid spaces quasi-pro-étale over `Y` form a basis of `Y_qproét`.

**Checks.**

- `qproetSite_geometricPoint`: For `Y = Spa(C, O_C)` with `C` algebraically closed, `S ↦ Spa(C, O_C) × S` identifies profinite sets with the quasicompact separated objects of `Y_qproét`, so small sheaves on `Y_qproét` are condensed sets.
- `qproetSite_empty`: For `Y = ∅` every cutoff topos is the terminal category.
- `qproetSite_etale_object`: `A` locally separated étale map `Y′ → Y` is an object of both `Y_ét` and `Y_qproét`, and a jointly surjective étale family covers in both.
- `qproetSite_not_v`: For an extension `C ⊊ C′` of algebraically closed perfectoid fields, `Spa(C′, O_C′) → Spa(C, O_C)` is a `v`-cover but not quasi-pro-étale, so it is not an object of `Spa(C, O_C)_qproét`.

*Needs:* `DiamondsAndVStacks`, Layer D3; `DiamondsAndVStacks`, Layer D2; `DiamondsAndVStacks`, Layer D0; `DiamondsAndVStacks`, Layer D4; `CategoryTheory.GrothendieckTopology`.

(ECD Definition 14.1(ii), p. 81; ECD paragraph after Definition 14.1, p. 81.)

#### C0.3 The `v`-site of a small `v`-stack

Let `Y` be a small `v`-stack on Perf. The `v`-site `Y_v` is the site whose objects are all maps `Y′ → Y` from small `v`-sheaves `Y′`, whose morphisms are maps over `Y`, and whose coverings are the jointly surjective families (as maps of `v`-stacks on Perf); for perfectoid spaces `X` and `{X_i → X}` this means a `v`-cover. For every cutoff cardinal `κ` there is the subsite `Y_v,κ` of small `v`-sheaves over `Y` admitting a surjection from a `κ`-small perfectoid space (equivalently, by the perfectoid basis, the site of `κ`-small perfectoid spaces over `Y`, with the same topos), and small sheaves on `Y_v` form the large filtered colimit of the topoi `Y_v,κ^∼`.

Require the following API.

- `vSite`: For a small `v`-stack `Y` and a cutoff cardinal `κ`, the Grothendieck topology on `κ`-small maps from small `v`-sheaves to `Y` with jointly surjective coverings.
- `vSite.restrict_fullyFaithful`: For cutoff cardinals `κ ≤ κ′` with `Y κ`-small (or after choosing a `κ`-small presentation of `Y`), the induced functor on sheaf topoi is fully faithful and commutes with cohomology.
- `vSite.perfectoid_basis`: Strictly totally disconnected perfectoid spaces over `Y` form a basis of `Y_v`, so restriction to perfectoid objects is an equivalence of topoi of small sheaves.
- `vSite.over_equiv`: For a small `v`-sheaf `U → Y`, the slice of `Y_v` at `U` is `U_v`.
- `vSite.pullback_zeroTruncated`: `A 0`-truncated map `f : Y′ → Y` gives the base-change functor `Y_v → Y′_v`, a morphism of sites `f_v`, functorial in `f`.
- `vSite.representable_isSheaf`: For every object `Y′ → Y` the representable presheaf is a sheaf (subcanonicity, `DiamondsAndVStacks` D2 and D4).

**Checks.**

- `vSite_empty`: For `Y = ∅` every cutoff topos is the terminal category.
- `vSite_subcanonical`: For a small `v`-sheaf `Y′ → Y`, the presheaf `Hom_Y(−, Y′)` is a sheaf on `Y_v`.
- `vSite_perfectoid_compat`: For a perfectoid space `X`, the restriction of `X_v` to perfectoid objects is the `v`-site of `DiamondsAndVStacks` D2, with the same covering families.
- `vSite_not_qproet`: For an extension `C ⊊ C′` of algebraically closed perfectoid fields, `{Spa(C′, O_C′) → Spa(C, O_C)}` covers in the `v`-site but is not a family of quasi-pro-étale maps.

*Needs:* `DiamondsAndVStacks`, Layer D4; `DiamondsAndVStacks`, Layer D2; `DiamondsAndVStacks`, Layer D0; `CategoryTheory.GrothendieckTopology`.

(ECD Definition 14.1(iii), p. 81; ECD paragraph after Definition 14.1, p. 81.)

#### C0.4 Derived categories of the quasi-pro-étale and `v`-sites through cutoffs

Fix a ring `Λ`. For a topos `T, D(T, Λ)` is the derived category of sheaves of `Λ`-modules and `D⁺, D⁻, D^b ⊂ D(T, Λ)` are the cohomologically bounded below, above and bounded subcategories. For a diamond `Y`, resp. small `v`-stack `Y, D(Y_qproét, Λ)`, resp. `D(Y_v, Λ)`, is the filtered colimit over cutoff cardinals `κ` of `D(Y_qproét,κ, Λ)`, resp. `D(Y_v,κ, Λ)`, along fully faithful transition functors; the canonical `t`-structures and truncations are compatible with the transitions.

Require the following API.

- `cutoffDerived.transition_fullyFaithful`: For `κ ≤ κ′` the transition functor `D(Y_v,κ, Λ) → D(Y_v,κ′, Λ)` is fully faithful and commutes with shifts, cones and canonical truncations.
- `cutoffDerived.ofCutoff`: Every object of `D(Y_v, Λ)` comes from `D(Y_v,κ, Λ)` for some cutoff `κ`, and Hom groups are computed at any common cutoff.
- `cutoffDerived.tStructure`: The canonical `t`-structure on `D(Y_v, Λ)`, with `Hⁱ` computed at any cutoff, and the subcategories `D⁺, D⁻, D^b`.
- `cutoffDerived.pullback`: `λ_Y^∗, ν_Y^∗` and `f_v^∗` for `0`-truncated `f` induce `t`-exact functors on these derived categories, compatible with the transitions.
- `cutoffDerived.transition_products`: For `κ ≤ κ′` the transition functor commutes with countable products and with `R lim` of sequences (`κ′`-small objects are `κ`-cofiltered limits of `κ`-small ones and `cf(κ) > ω`, and products are exact by repleteness). This does not assert compatibility with arbitrary products.

**Checks.**

- `cutoffDerived_zeroRing`: For `Λ = 0`, including nonempty `Y`, every `D(Y_v, Λ)` is zero and presentable.
- For `Y=∅` and `Λ≠0, D(Y_v, Λ)` is also zero and presentable.
- `cutoffDerived_cohomology_transition`: For `A ∈ D(Y_v,κ, Λ)` and `κ ≤ κ′, Hⁱ` of the image of `A` in `D(Y_v,κ′, Λ)` is the image of `Hⁱ(A)`.
- `cutoffDerived_set_generated`: If `Y_v,κ` is fixed, `D(Y_v,κ, Λ)` is Mathlib's `DerivedCategory` of the Grothendieck abelian category of sheaves of `Λ`-modules on `Y_v,κ`.
- `cutoffDerived_not_one_topos`: The category of all small sheaves of `Λ`-modules on `Y_v` has no set of generators when `Y ≠ ∅` and `Λ ≠ 0`, so `D(Y_v, Λ)` is not the derived category of a single Grothendieck abelian category.

*Needs:* `DiamondsAndVStacks`, Layer D2; `DiamondsAndVStacks`, Layer D0; `EnhancedDerivedSheaves`, Layer E1; `DerivedCategory`.

(ECD paragraph before Proposition 14.10, p. 86.)

#### C0.5 The étale, quasi-pro-étale and `v`-topoi are algebraic

The categories of small sheaves on `Y_ét, Y_qproét` and `Y_v`, for `Y` a locally spatial diamond, a diamond and a small `v`-stack respectively, are algebraic topoi (at each cutoff for the last two). If `Y` is `0`-truncated (a small `v`-sheaf), an object of any of these sites is quasicompact, resp. quasiseparated, in the topos-theoretic sense if and only if it is quasicompact, resp. quasiseparated, as a small `v`-stack on Perf.

*Needs:* `DiamondsAndVStacks`, Layer D0; `DiamondsAndVStacks`, Layer D2; `C0.1`; `C0.2`; `C0.3`; `C0.16`; `DiamondsAndVStacks`, Layer D4; `DiamondsAndVStacks`, Layer D5; `DiamondsAndVStacks`, Layer D1.

(ECD Proposition 14.2, p. 82; ECD proof of Proposition 14.2, p. 82.)

#### C0.6 Stalks of étale sheaves at geometric points

Let `Y` be a locally spatial diamond and `y ∈ |Y|`. Choose a quasi-pro-étale map `ȳ : Spa(C(y), C(y)⁺) → Y` with `C(y)` algebraically closed, `C(y)⁺ ⊂ C(y)` an open and bounded valuation subring, mapping the closed point to `y`. For a sheaf `F` on `Y_ét` put `F_ȳ = colim_{ȳ → U ∈ Y_ét} F(U)`. The index category is cofiltered over `U`, and `F ↦ F_ȳ` is pullback along `ȳ_ét` followed by global sections on `Spa(C(y), C(y)⁺)_ét`; it is a point of the topos `Y_ét^∼`.

Require the following API.

- `geometricStalk`: The stalk functor `F ↦ F_ȳ` from `Y_ét^∼` to sets (and to `Λ`-modules for sheaves of `Λ`-modules).
- `geometricStalk.eq_pullback_sections`: `F_ȳ ≅ Γ(Spa(C(y), C(y)⁺)_ét, ȳ^∗F)`, naturally in `F`.
- `geometricStalk.exact`: The stalk functor commutes with all colimits and finite limits; on sheaves of `Λ`-modules it is exact.
- `geometricStalk.toPoint`: The stalk functor is the fibre functor of a point of the site `Y_ét` in the sense of Mathlib's GrothendieckTopology.Point.
- `geometricStalk.map`: For `f : Y′ → Y, y′ ∈ |Y′|` and geometric points `ȳ′` over `y′` and `ȳ` over `f(y′), (f_ét^∗F)_ȳ′ ≅ F_ȳ`.
- `geometricStalk.of_constant`: The stalk of the constant sheaf with value `M` is `M`.
- `geometricStalk.indep`: For two geometric points `ȳ, ȳ′` (quasi-pro-étale maps from geometric field pairs whose closed points map to `y`), `F_ȳ ≅ F_ȳ′`: both are the stalk at the closed point of the pullback to the chain of generalizations of `y`.

**Checks.**

- `geometricStalk_closedPoint`: For `Y = Spa(C, C⁺)` with `C` algebraically closed and `y` the closed point `(ȳ = id), F_ȳ = F(Y)`.
- `geometricStalk_constant`: For every `y` the stalk of the constant sheaf `M` is `M`.
- `geometricStalk_isPoint`: `geometricStalk` is the fibre functor of a GrothendieckTopology.Point of `Y_ét`.
- `geometricStalk_generic_vs_global`: For `Y = Spa(C, C⁺)` of rank `2` with open generic point `j : {η} ⊂ Y` and `M ≠ 0`, the sheaf `j_!M` has `F(Y) = 0` but `F_η̄ = M`; so stalks at generalizations are not global sections.

*Needs:* `C0.1`; `DiamondsAndVStacks`, Layer D5; `DiamondsAndVStacks`, Layer D1; `CategoryTheory.GrothendieckTopology.Point`.

(ECD Proposition 14.3, p. 82; ECD proof of Proposition 14.3, p. 82.)

#### C0.7 The étale topos of a locally spatial diamond has enough points

Let `Y` be a locally spatial diamond. For every `y ∈ |Y|` the stalk functor `F ↦ F_ȳ` at a geometric point `ȳ` over `y` is a point of `Y_ét^∼`, and a section `s ∈ F(Y)` of a sheaf `F` on `Y_ét` is zero if and only if `s_ȳ = 0` for all `y ∈ |Y|`. Hence a map of étale sheaves is an isomorphism iff it is so on all stalks `F_ȳ, y ∈ |Y|`.

*Needs:* `C0.6`; `C0.1`; `CategoryTheory.GrothendieckTopology.Point`.

(ECD Proposition 14.3, p. 82; ECD proof of Proposition 14.3, p. 82.)

#### C0.8 The comparison morphisms `λ_Y` and `ν_Y` and the relative pullbacks

For a diamond `Y` there is a morphism of sites `λ_Y : Y_v → Y_qproét`, and for a locally spatial diamond `Y` a morphism of sites `ν_Y : Y_qproét → Y_ét`; the underlying functors go the other way (an étale map is quasi-pro-étale, a quasi-pro-étale map has a small `v`-sheaf as source) and preserve finite limits, so they define morphisms of topoi with pullbacks `ν_Y^∗ : Y_ét^∼ → Y_qproét^∼` and `λ_Y^∗ : Y_qproét^∼ → Y_v^∼` on small sheaves, right adjoints `ν_Y∗, λ_Y∗`, units and counits. A map `f : Y′ → Y` of locally spatial diamonds (resp. diamonds, resp. a `0`-truncated map of small `v`-stacks) induces `f_ét, f_qproét, f_v`, and the squares `f_v ∘ λ_{Y′} = λ_Y ∘ f_qproét` and `f_qproét ∘ ν_{Y′} = ν_Y ∘ f_ét` commute up to canonical isomorphism.

Require the following API.

- `lambdaY`: The morphism of topoi `λ_Y : Y_v^∼ → Y_qproét^∼` for a diamond `Y`, with `λ_Y^∗ ⊣ λ_Y∗`.
- `nuY`: The morphism of topoi `ν_Y : Y_qproét^∼ → Y_ét^∼` for a locally spatial diamond `Y`, with `ν_Y^∗ ⊣ ν_Y∗`.
- `lambdaY_pullback_finiteLimits`: `λ_Y^∗` and `ν_Y^∗` preserve finite limits and all colimits.
- `comparison_square_v`: For `f : Y′ → Y` of diamonds, `f_v^∗ ∘ λ_Y^∗ ≅ λ_{Y′}^∗ ∘ f_qproét^∗`, compatible with composition of maps.
- `comparison_square_et`: For `f : Y′ → Y` of locally spatial diamonds, `f_qproét^∗ ∘ ν_Y^∗ ≅ ν_{Y′}^∗ ∘ f_ét^∗`, compatible with composition.
- `comparison_slice`: For `U → Y` étale (resp. quasi-pro-étale), the restriction of `ν_Y` (resp. `λ_Y`) to the slice at `U` is `ν_U` (resp. `λ_U`).
- `comparison_derived`: The derived pullbacks `λ_Y^∗, ν_Y^∗` on `D(−, Λ)` and the derived pushforwards `Rλ_Y∗, Rν_Y∗`, with the derived adjunctions.

**Checks.**

- `comparison_geometricPoint`: For `Y = Spa(C, O_C), ν_Y^∗` sends a set `M` to the condensed set of locally constant maps `S ↦ C(S, M)`, i.e. the discrete condensed set.
- `comparison_empty`: For `Y = ∅` both `λ_Y` and `ν_Y` are the identity of the terminal topos.
- `comparison_perfectoid`: For a perfectoid space `X`, the perfectoid spaces pro-étale over `X` form a basis of `X_qproét`, so `X_qproét^∼ ≃ X_proét^∼`, and under this equivalence `ν_X` is the comparison morphism `X_proét → X_ét` of `DiamondsAndVStacks` D2.
- `comparison_nu_not_essSurj`: For `Y = Spa(C, O_C)`, the sheaf `S ↦ C(S, ℤ_p)` (continuous maps to `ℤ_p`) on `Y_qproét` is not in the essential image of `ν_Y^∗`, whose image consists of discrete condensed sets.

*Needs:* `C0.1`; `C0.2`; `C0.3`; `CategoryTheory.Functor.IsContinuous`; `CategoryTheory.Adjunction`.

(ECD paragraph after Proposition 14.3, p. 82.)

#### C0.9 Perfectoid bases and coherent subsites over a strictly totally disconnected space

Let `Y` be a small `v`-stack. Strictly totally disconnected perfectoid spaces over `Y` form a basis of `Y_v`, and if `Y` is a diamond, strictly totally disconnected perfectoid spaces quasi-pro-étale over `Y` form a basis of `Y_qproét`. If `X` is a strictly totally disconnected perfectoid space, then `X_qproét^∼ ≃ X_qproét,qc,sep^∼` for the site of quasicompact separated pro-étale maps `X′ → X`, and `X_v^∼ ≃ X_v,qcqs^∼` for the site of qcqs representable `X′ → X`; both subsites consist of qcqs objects, are stable under fibre products, and the topoi are coherent.

*Needs:* `DiamondsAndVStacks`, Layer D1; `PerfectoidSpaces`, Layer P6; `DiamondsAndVStacks`, Layer D4; `DiamondsAndVStacks`, Layer D0; `C0.2`; `C0.3`.

(ECD proof of Lemma 14.4, p. 83.)

### The separated pro-étale hull and `v`-pullback

#### C0.10 The universal separated pro-étale quotient `λ∘_X(X′)`

For a qcqs perfectoid `X′` equipped with a map to a strictly totally disconnected perfectoid `X`, construct a factorization `X′ → λ∘_X(X′) → X` whose second arrow is quasicompact, separated and pro-étale. Require its universal property: a map `X′ → Z` over `X`, with `Z → X` separated pro-étale and perfectoid, has exactly one factorization through `λ∘_X(X′)`. Prove that the first arrow is surjective, and that a surjection `X′_2 → X′_1` between quasicompact separated perfectoid spaces over `X` induces a surjection between their hulls.

Require the following API.

- `sepProetHull`: The object `λ∘_X(X′)` of `X_qproét,qc,sep` with the map `X′ → λ∘_X(X′)` over `X`.
- `sepProetHull.lift`: For a separated pro-étale `Z → X` and `g : X′ → Z` over `X`, the unique map `λ∘_X(X′) → Z` through which `g` factors.
- `sepProetHull.lift_comp`: The lift composed with `X′ → λ∘_X(X′)` is `g`, and any map `λ∘_X(X′) → Z` with this property equals the lift.
- `sepProetHull.surjective`: `X′ → λ∘_X(X′)` is surjective.
- `sepProetHull.map`: A map `X′_2 → X′_1` over `X` induces `λ∘_X(X′_2) → λ∘_X(X′_1)`, functorially, and surjections go to surjections.
- `sepProetHull.of_proetale`: If `X′ → X` is itself quasicompact separated pro-étale then `λ∘_X(X′) = X′`.
- `sepProetHull.spectral_image`: `|λ∘_X(X′)|` is the image of `|X′| → |X| ×_{π0 X} π0 X′`.

**Checks.**

- `sepProetHull_self`: `λ∘_X(X) = X`.
- `sepProetHull_geometricPoints`: For `X = Spa(C, C⁺)` and `X′ = Spa(C′, C′⁺)` with algebraically closed `C, C′, λ∘_X(X′)` is the pro-constructible generalizing subspace of `X` formed by the generalizations of the image of the closed point of `X′` (an open subset when `C⁺` has finite rank); it is `X` exactly when `X′ → X` is surjective.
- `sepProetHull_profinite`: For `X′ = X × S` with `S` profinite, `λ∘_X(X′) = X × S`.
- `sepProetHull_not_identity`: For a nontrivial extension `C ⊊ C′` of algebraically closed fields, `Spa(C′, O_C′) → Spa(C, O_C)` is not pro-étale, yet its hull is `Spa(C, O_C)`.

*Needs:* `DiamondsAndVStacks`, Layer D1; `DiamondsAndVStacks`, Layer D0; `PerfectoidSpaces`, Layer P6.

(ECD Lemma 14.5, p. 83; ECD Lemma 14.5(i), p. 83.)

#### C0.11 The hull commutes with fibre products of strictly totally disconnected spaces

Let `X` be strictly totally disconnected and `X′_1 → X′_3 ← X′_2` a diagram of strictly totally disconnected perfectoid spaces over `X`. Then `λ∘_X(X′_1 ×_{X′_3} X′_2) → λ∘_X(X′_1) ×_{λ∘_X(X′_3)} λ∘_X(X′_2)` is an isomorphism.

*Needs:* `C0.10`; `ClassicalAdicEtaleCohomology`, §§7.1–7.2 and §7.3 (geometric connectedness); `DiamondsAndVStacks`, Layer D1; `DiamondsAndVStacks`, Layer D4.

(ECD Lemma 14.5(ii), p. 83; ECD proof of Lemma 14.5(ii), p. 84.)

#### C0.12 Values of `λ_X^∗` on strictly totally disconnected objects

Let `X` be strictly totally disconnected and `F` a sheaf on `X_qproét,qc,sep` (equivalently on `X_qproét`). Then `λ_X^∗F` on `X_v,qcqs` is the sheafification of the separated presheaf `X′ ↦ F(λ∘_X(X′))`, and for strictly totally disconnected `X′ ∈ X_v,qcqs, (λ_X^∗F)(X′) = F(λ∘_X(X′))`.

*Needs:* `C0.10`; `C0.11`; `C0.9`; `C0.8`.

(ECD proof of Lemma 14.4, p. 84.)

#### C0.13 `λ_Y^∗` and quasi-pro-étale pullbacks commute with all small limits

Let `Y` be a diamond. Then `λ_Y^∗ : Y_qproét^∼ → Y_v^∼` commutes with all small limits. If `f : Y′ → Y` is any map of diamonds, then `f^∗ : Y_qproét^∼ → Y′_qproét^∼` commutes with all small limits.

*Needs:* `C0.12`; `C0.9`; `C0.8`.

(ECD Lemma 14.4, p. 82; ECD proof of Lemma 14.4, p. 84.)

#### C0.14 `λ_Y^∗` is fully faithful

Let `Y` be a diamond. Then `λ_Y^∗ : Y_qproét^∼ → Y_v^∼` is fully faithful: for every small sheaf `F` on `Y_qproét` the unit `F → λ_Y∗λ_Y^∗F` is an isomorphism.

*Needs:* `C0.12`; `C0.10`; `C0.9`.

(ECD Proposition 14.7, p. 84.)

#### C0.15 Vanishing of higher direct images `R^iλ_Y∗λ_Y^∗F` for étale `F`

Let `Y` be a locally spatial diamond and `F` a sheaf of abelian groups (resp. groups) on `Y_qproét` that comes via pullback from `Y_ét`. Then `R^iλ_Y∗λ_Y^∗F = 0` for all `i > 0` (resp. for `i = 1`). The statement is not claimed for arbitrary sheaves on `Y_qproét`.

*Needs:* `C0.12`; `C0.14`; `C0.17`; `DiamondsAndVStacks`, Layer D3; `DiamondsAndVStacks`, Layer D0; `PerfectoidSpaces`, Layer P5; `C0.18`; `C0.8`.

(ECD Proposition 14.7, p. 84; ECD after Proposition 14.7, p. 84; ECD proof of Proposition 14.7, p. 85.)

### Quasi-pro-étale comparison and continuity

#### C0.16 `Pro`-objects of quasicompact separated étale maps form a basis of `Y_qproét`

Let `Y` be a spatial diamond and `Y_ét,qc,sep ⊂ Y_ét` the full subcategory of quasicompact separated étale maps. Then `Y_ét,qc,sep` is an essentially small basis of `Y_ét`, so `Y_ét,qc,sep^∼ ≃ Y_ét^∼`. The functor `Pro(Y_ét,qc,sep) → Y_qproét`, “`lim`” `Ỹ_j ↦ lim Ỹ_j`, is fully faithful and its essential image is a basis of `Y_qproét`; for a sheaf `F` on `Y_ét` and `Ỹ = lim Ỹ_j, (ν_Y^∗F)(Ỹ) = colim_j F(Ỹ_j)`.

*Needs:* `DiamondsAndVStacks`, Layer D5; `PerfectoidSpaces`, Layer P6; `DiamondsAndVStacks`, Layer D2; `C0.1`; `C0.2`; `C0.8`.

(ECD proof of Proposition 14.8, p. 85.)

#### C0.17 `ν_Y^∗` is fully faithful with vanishing higher direct images

Let `Y` be a locally spatial diamond. Then `ν_Y^∗ : Y_ét^∼ → Y_qproét^∼` is fully faithful: for every sheaf `F` on `Y_ét` the unit `F → ν_Y∗ν_Y^∗F` is an isomorphism, and if `F` is a sheaf of abelian groups (resp. groups) then `R^iν_Y∗ν_Y^∗F = 0` for all `i > 0` (resp. for `i = 1`).

*Needs:* `C0.16`; `DiamondsAndVStacks`, Layer D2; `C0.8`; `DiamondsAndVStacks`, Layer D0; `DiamondsAndVStacks`, Layer D5.

(ECD Proposition 14.8, p. 85; ECD proof of Proposition 14.8, p. 85.)

#### C0.18 Étale cohomology commutes with cofiltered limits of spatial diamonds

Let `Y_i, i ∈ I`, be a cofiltered inverse system of spatial diamonds with inverse limit `Y`, and assume `I` has a final object `0`. Let `F_0` be an étale sheaf on `Y_0` with pullbacks `F_i` to `Y_i` and `F` to `Y`. Then `colim_i Hʲ(Y_i, F_i) → Hʲ(Y, F)` is an isomorphism for `j = 0` if `F_0` is a sheaf of sets, for `j = 0, 1` if it is a sheaf of groups, and for all `j ≥ 0` if it is a sheaf of abelian groups. Relative form: for `i_0 ∈ I` and `f_i : Y → Y_i, f_{i,i_0} : Y_i → Y_{i_0}`, one has `R^q f_{i_0∗}F = colim_{i→i_0} R^q f_{i,i_0∗}F_i` on `(Y_{i_0})_ét`, in the same range of `q` as the absolute statement (`q = 0` for sheaves of sets, `q ≤ 1` for sheaves of groups, all `q` for abelian sheaves).

*Needs:* `C0.16`; `DiamondsAndVStacks`, Layer D5; `C0.5`; `PerfectoidSpaces`, Layer P5; `DiamondsAndVStacks`, Layer D0.

(ECD Proposition 14.9, p. 86; ECD proof of Proposition 14.9, p. 86.)

#### C0.19 The étale topos of a strictly totally disconnected space

Let `X` be a strictly totally disconnected perfectoid space. Then `X_ét^∼` is equivalent to the topos of sheaves on `|X|`, every étale cover of a quasicompact open `U ⊂ X` splits, and `Hⁱ(U_ét, F) = 0` for all `i > 0`, all sheaves of abelian groups `F` and all quasicompact open `U`; in particular these `U` form a basis of `X_ét` of objects with vanishing higher cohomology.

*Needs:* `DiamondsAndVStacks`, Layer D1; `C0.1`; `CategoryTheory.Sheaf.H`; `DiamondsAndVStacks`, Layer D5.

(ECD proof of Proposition 14.10, p. 86; ECD Definition 20.1(i), p. 113.)

### Repleteness and derived comparison

#### C0.20 The quasi-pro-étale topos of a diamond is replete

Let `Y` be a diamond and `κ` a cutoff cardinal. The topos `Y_qproét,κ^∼` (hence the category of small sheaves on `Y_qproét`) is replete: for every sequence of epimorphisms of sheaves `⋯ → F_2 → F_1 → F_0`, the map `lim_n F_n → F_0` is an epimorphism.

*Needs:* `C0.2`; `C0.9`; `EnhancedDerivedSheaves`, Layer E2; `DiamondsAndVStacks`, Layer D1; `PerfectoidSpaces`, Layer P6; `DiamondsAndVStacks`, Layer D0; `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`; `PerfectoidSpaces`, Layer P5.

(ECD proof of Proposition 14.10, p. 86.)

#### C0.21 The `v`-topos of a small `v`-stack is replete

Let `Y` be a small `v`-stack and `κ` a cutoff cardinal. The topos `Y_v,κ^∼` (and hence the category of small sheaves on `Y_v`) is replete: for every sequence of epimorphisms of sheaves `⋯ → F_2 → F_1 → F_0`, the map `lim_n F_n → F_0` is an epimorphism.

*Needs:* `C0.3`; `EnhancedDerivedSheaves`, Layer E2; `PerfectoidSpaces`, Layer P5; `PerfectoidSpaces`, Layer P6; `DiamondsAndVStacks`, Layer D0; `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`.

(ECD proof of Proposition 14.10, p. 86.)

#### C0.22 Left-completeness of the `v`-, quasi-pro-étale and étale derived categories

Let `Y` be a small `v`-stack and `Λ` a ring. (i) `D(Y_v, Λ)` is left-`complete: A ≅ R lim_n τ^{≥−n}A` for all `A`. (ii) If `Y` is a diamond, `D(Y_qproét, Λ)` is left-complete. (iii) If `Y` is a strictly totally disconnected perfectoid space, `D(Y_ét, Λ)` is left-complete.

*Needs:* `C0.21`; `C0.20`; `C0.19`; `EnhancedDerivedSheaves`, Layer E2; `C0.4`.

(ECD Proposition 14.11, p. 86; ECD before Proposition 14.11, p. 86.)

#### C0.23 Bounded-below comparison of étale, quasi-pro-étale and `v`-cohomology

Let `Y` be a locally spatial diamond and `Λ` a ring. The pullback functors `ν_Y^∗ : D⁺(Y_ét, Λ) → D⁺(Y_qproét, Λ)` and `λ_Y^∗ν_Y^∗ : D⁺(Y_ét, Λ) → D⁺(Y_v, Λ)` are fully faithful.

*Needs:* `C0.17`; `C0.15`; `C0.14`; `C0.8`; `C0.4`.

(ECD Proposition 14.10, p. 86; ECD proof of Proposition 14.10, p. 86.)

#### C0.24 Unbounded comparison over strictly totally disconnected spaces

If `Y` is a strictly totally disconnected perfectoid space, the pullback functors `ν_Y^∗ : D(Y_ét, Λ) → D(Y_qproét, Λ)` and `λ_Y^∗ν_Y^∗ : D(Y_ét, Λ) → D(Y_v, Λ)` are fully faithful.

*Needs:* `C0.23`; `C0.22`; `C0.19`.

(ECD Proposition 14.10, p. 86; ECD proof of Proposition 14.10, p. 86.)

### Examples

For `Y=Spa(C,C⁺)` of rank two, write `η` for the open generic point and `s` for the closed point. With `j:{η}→Y` and `M≠0, j!M` has stalks `M` at `η` and `0` at `s`, and `Γ(Y,j!M)=0`. Thus stalk tests must retain both points rather than replacing every field pair by `Spa(C,O_C)`. (ECD Proposition 14.3, p. 82.)

### Dependencies

`PerfectoidSpaces`, Layers P0–P6; `DiamondsAndVStacks`, Layers D0–D5; `EnhancedDerivedSheaves`, Layers E1–E2; `ClassicalAdicEtaleCohomology`, §§7.1–7.2. The analytic comparison also uses `DiamondsAndVStacks`, Layer D6.

<a id="c1"></a>

## Layer C1: Base change before étale coreflection

Construct the comparison transformations first. Prove their separate cases before assembling the derived statements. The arbitrary-coefficient quasi-pro-étale case and the prime-to-`p` torsion case are distinct.

### Comparison transformations and local reduction

#### C1.1 The base change transformations comparing étale, quasi-pro-étale and `v`-pushforwards

Let `f : Y′ → Y` be a map of locally spatial diamonds. From the commuting squares `f_v ∘ λ_{Y′} ≅ λ_Y ∘ f_qproét` and `f_qproét ∘ ν_{Y′} ≅ ν_Y ∘ f_ét`, construct the base change morphisms `λ_Y^∗R^if_qproét∗F → R^if_v∗λ_{Y′}^∗F` and `ν_Y^∗R^if_ét∗F → R^if_qproét∗ν_{Y′}^∗F`, and their derived versions `λ_Y^∗Rf_qproét∗ → Rf_v∗λ_{Y′}^∗` and `ν_Y^∗Rf_ét∗ → Rf_qproét∗ν_{Y′}^∗`; for a cartesian square of locally spatial diamonds (`g′ : Y′ → Y` over `g : X′ → X, f, f′`) construct `g^∗Rf∗ → Rf′∗g′^∗` on the quasi-pro-étale and on the étale sites. For strictly totally disconnected `X` and strictly totally disconnected `X̃ ∈ X_v` with factorization `X̃ → λ∘_X(X̃) → X`, construct the comparison `Hⁱ((λ∘_X(X̃) ×_X Y′)_qproét, F) → Hⁱ((X̃ ×_X Y′)_v, λ_{Y′}^∗F)`. These transformations are compatible with composition of maps and with restriction to quasi-pro-étale slices.

Require the following API.

- `vQproetBaseChange`: The natural transformation `λ_Y^∗ ∘ Rf_qproét∗ ⟶ Rf_v∗ ∘ λ_{Y′}^∗` of functors `D(Y′_qproét,κ, Λ) → D(Y_v,κ, Λ)` at each common adequate `κ`, the mate of `f_v^∗λ_Y^∗ ≅ λ_{Y′}^∗f_qproét^∗`.
- `etQproetBaseChange`: The natural transformation `ν_Y^∗ ∘ Rf_ét∗ ⟶ Rf_qproét∗ ∘ ν_{Y′}^∗` of functors `D(Y′_ét, Λ) → D(Y_qproét,κ, Λ)` at each common adequate `κ`.
- `squareBaseChange`: For a cartesian square, `g^∗Rf∗ ⟶ Rf′∗g′^∗` on the quasi-pro-étale and on the étale sites.
- `vQproetBaseChange.comp`: For composable `f` and `h`, the transformation for `f ∘ h` is the pasting of those for `f` and `h`.
- `vQproetBaseChange.id`: For `f = id` the transformation is the identity.
- `vQproetBaseChange.slice`: Restriction to a quasi-pro-étale `U → Y` carries the transformation for `f` to that for `f ×_Y U`.
- `vQproetBaseChange.cohomology`: On cohomology sheaves the derived transformation induces the sheaf-level base change maps in each degree `i`, and for strictly totally disconnected `X` it is computed by the cohomology comparison over `λ∘_X(X̃) ×_X Y′` and `X̃ ×_X Y′`.
- `etQproetBaseChange.comp`: For composable `f` and `h`, the transformation `ν^∗Rf_ét∗ → Rf_qproét∗ν^∗` for `f ∘ h` is the pasting of those for `f` and `h`; for `f = id` it is the identity.
- `squareBaseChange.paste`: The base change transformation of a horizontal or vertical composite of cartesian squares is the pasting of the transformations of the two squares.
- `squareBaseChange.iso_of_qproet`: If `g` is quasi-pro-étale, at every common adequate `κ` the site `X′_qproét,κ` is the slice of `X_qproét,κ` at `X′` and `g^∗Rf_qproét,κ∗ → Rf′_qproét,κ∗g′^∗` is an isomorphism on all of `D(Y_qproét,κ, Λ)` (restriction to slices).

**Checks.**

- `baseChange_id`: For `f = id_Y` every base change transformation is the identity.
- `baseChange_fold`: For the fold map `Y ⊔ Y → Y` and `F = F_1 ⊔ F_2, R^0f∗F = F_1 × F_2` and the base change morphism in degree `0` is the identity of `λ_Y^∗F_1 × λ_Y^∗F_2`.
- `baseChange_degree_zero`: In degree `0` the transformation `λ_Y^∗f_qproét∗F → f_v∗λ_{Y′}^∗F` is the mate of the commutation isomorphism; evaluated on strictly totally disconnected `X̃` over strictly totally disconnected `X` it is `F((λ∘_X(X̃) ×_X Y′)) → (λ_{Y′}^∗F)(X̃ ×_X Y′)`.
- `baseChange_ArtinSchreier`: With `p`-torsion coefficients the final comparison need not be an isomorphism: for the perfectoid closed disc `D` over `Spa(C, O_C), C ⊊ C′` with strictly larger residue field and `F = 𝔽_p`, the Artin–Schreier class of `c′T` in `H¹(D_{C′}, 𝔽_p)`, for `c′ ∈ O_{C′}` with residue class outside the residue field of `C`, is not in the image of `H¹(D_C, 𝔽_p)`.

*Needs:* `C0.8`; `C0.10`; `EnhancedDerivedSheaves`, Layer E3; `C0.4`.

(ECD Theorem 16.1, p. 92; ECD Proposition 16.6, p. 94.)

#### C1.2 Reduction of Theorem 16.1 to geometric points and extension by zero

In the situation of Theorem 16.1 it suffices to prove the final statement for strictly totally disconnected `X` and `X̃`, and that statement reduces to: for connected strictly totally disconnected `X = Spa(C, C⁺), X̃ = Spa(C̃, C̃⁺)` and `X′ = Spa(C′, C′⁺)` with `X̃ → X` and `X′ → X` surjective, and `F = j_!M` for a quasicompact open `V ⊂ X′` with inclusion `j` and an abelian group `M`, the map `Hⁱ(X′_ét, F) → Hⁱ((X̃ ×_X X′)_ét, F)` is an isomorphism (in degree `0`, for `f` pro-étale, or for nM `= 0` with `n` prime to `p`).

*Needs:* `C1.1`; `C0.14`; `C0.15`; `C0.17`; `C0.19`; `DiamondsAndVStacks`, Layer D1; `C0.18`; `DiamondsAndVStacks`, Layer D0; `extendByZero`.

(ECD proof of Theorem 16.1, p. 92; ECD proof of Theorem 16.1, p. 93.)

### Comparison of direct images

#### C1.3 `v`- and quasi-pro-étale pushforward agree in degree `0`

Let `f : Y′ → Y` be a map of locally spatial diamonds and `F` a small sheaf of abelian groups on `Y′_qproét` that comes via pullback from `Y′_ét`. Then `λ_Y^∗f_qproét∗F → f_v∗λ_{Y′}^∗F` is an isomorphism, and for `X = Y` strictly totally disconnected and `X̃ ∈ X_v` strictly totally disconnected the map `H⁰((λ∘_X(X̃) ×_X Y′)_qproét, F) → H⁰((X̃ ×_X Y′)_v, λ_{Y′}^∗F)` is an isomorphism.

*Needs:* `C1.2`; `ClassicalAdicEtaleCohomology`, §§7.1–7.2 and §7.3 (geometric connectedness); `C1.5`.

(ECD Theorem 16.1(i), p. 92; ECD proof of Theorem 16.1, p. 93.)

#### C1.4 `v`- and quasi-pro-étale pushforward agree for quasi-pro-étale maps

Let `f : Y′ → Y` be a quasi-pro-étale map of locally spatial diamonds and `F` a small sheaf of abelian groups on `Y′_qproét` pulled back from `Y′_ét`. Then `λ_Y^∗R^if_qproét∗F → R^if_v∗λ_{Y′}^∗F` is an isomorphism for all `i ≥ 0`, together with the final statement for `X = Y` strictly totally disconnected and `X̃ ∈ X_v` strictly totally disconnected.

*Needs:* `C1.2`; `C1.3`; `C0.19`.

(ECD Theorem 16.1(ii), p. 92; ECD proof of Theorem 16.1, p. 93.)

#### C1.5 `v`- and quasi-pro-étale pushforward agree for prime-to-`p` torsion

Let `f : Y′ → Y` be a map of locally spatial diamonds and `F` a small sheaf of abelian groups on `Y′_qproét` pulled back from `Y′_ét` with nF `= 0` for some integer `n` prime to `p`. Then `λ_Y^∗R^if_qproét∗F → R^if_v∗λ_{Y′}^∗F` is an isomorphism for all `i ≥ 0`, and for `X = Y` strictly totally disconnected and `X̃ ∈ X_v` strictly totally disconnected the map `Hⁱ((λ∘_X(X̃) ×_X Y′)_qproét, F) → Hⁱ((X̃ ×_X Y′)_v, λ_{Y′}^∗F)` is an isomorphism for all `i`.

*Needs:* `C1.2`; `ClassicalAdicEtaleCohomology`, §§7.1–7.2 and §7.3 (geometric connectedness); `C0.1`; `C0.19`.

(ECD Theorem 16.1(iii), p. 92; ECD Lemma 16.3, p. 93.)

#### C1.6 Derived comparison of `v`- and quasi-pro-étale pushforward

Let `f : Y′ → Y` be a map of locally spatial diamonds, and assume `f` is quasi-pro-étale or `nΛ = 0` for some `n` prime to `p`. For every `A ∈ D(Y′_qproét, Λ)` all of whose cohomology sheaves are pulled back from `Y′_ét` (by C2.5 this is the subcategory `D_ét(Y′, Λ) ⊂ D(Y′_qproét, Λ)`; the statement here does not use that identification), at each common adequate `κ` the base change morphism `λ_Y^∗Rf_qproét,κ∗A → Rf_v,κ∗λ_{Y′}^∗A` in `D(Y_v,κ, Λ)` is an isomorphism; more precisely, for `X = Y` strictly totally disconnected and `X̃ ∈ X_v` strictly totally disconnected, `RΓ((λ∘_X(X̃) ×_X Y′)_qproét, A) = RΓ((X̃ ×_X Y′)_v, λ_{Y′}^∗A)`.

*Needs:* `C1.4`; `C1.5`; `C0.22`; `C1.1`.

(ECD Corollary 16.4, p. 93; ECD proof of Corollary 16.4, p. 93.)

#### C1.7 Étale and quasi-pro-étale pushforward agree for qcqs maps

Let `f : Y′ → Y` be a qcqs map of locally spatial diamonds and `F` a sheaf of abelian groups on `Y′_ét`. Then `ν_Y^∗R^if_ét∗F → R^if_qproét∗ν_{Y′}^∗F` is an isomorphism of sheaves on `Y_qproét` for all `i ≥ 0`.

*Needs:* `C0.16`; `C0.17`; `C0.18`; `C1.1`.

(ECD Proposition 16.6, p. 94; ECD proof of Proposition 16.6, p. 94.)

#### C1.8 Derived comparison of étale and quasi-pro-étale pushforward

Let `f : Y′ → Y` be a qcqs map of locally spatial diamonds. For every `A ∈ D⁺(Y′_ét, Λ)` and every common adequate `κ, ν_Y^∗Rf_ét∗A → Rf_qproét,κ∗ν_{Y′}^∗A` is an isomorphism in `D⁺(Y_qproét,κ, Λ)`. If `Y` and `Y′` are strictly totally disconnected perfectoid spaces, the same holds for all `A ∈ D(Y′_ét, Λ)`.

*Needs:* `C1.7`; `C0.22`; `C0.24`; `C0.19`.

(ECD Corollary 16.7, p. 94.)

### Cartesian base change

#### C1.9 Base change for quasi-pro-étale pushforward in cartesian squares

Let `g′ : Y′ → Y, f′ : Y′ → X′, f : Y → X, g : X′ → X` be a cartesian diagram of locally spatial diamonds and `F` a small sheaf of abelian groups on `Y_qproét` pulled back from `Y_ét`. Then `g_qproét^∗R^if_qproét∗F → R^if′_qproét∗g′_qproét^∗F` is an isomorphism (i) if `i = 0`, (ii) for all `i ≥ 0` if `f` or `g` is quasi-pro-étale, (iii) for all `i ≥ 0` if nF `= 0` for some `n` prime to `p`.

*Needs:* `C1.3`; `C1.4`; `C1.5`; `C0.14`; `C1.1`; `C0.15`; `C0.12`; `C0.10`.

(ECD Corollary 16.9, p. 95; ECD proof of Corollary 16.9, p. 95.)

#### C1.10 Derived base change for quasi-pro-étale pushforward

In the cartesian diagram of target C1.9, assume `f` or `g` is quasi-pro-étale, or `nΛ = 0` for some `n` prime to `p`. Then at every common adequate `κ`, for every `A ∈ D(Y_qproét,κ, Λ)` all of whose cohomology sheaves are pulled back from `Y_ét, g_qproét^∗Rf_qproét,κ∗A → Rf′_qproét,κ∗g′_qproét^∗A` is an isomorphism.

*Needs:* `C1.9`; `C0.22`.

(ECD Corollary 16.9, p. 95; ECD proof of Corollary 16.9, p. 95.)

#### C1.11 Base change for étale cohomology of qcqs maps of locally spatial diamonds

Let `g′ : Y′ → Y, f′ : Y′ → X′, f : Y → X, g : X′ → X` be a cartesian diagram of locally spatial diamonds with `f` qcqs, and `F` a sheaf of abelian groups on `Y_ét`. Then `g_ét^∗R^if_ét∗F → R^if′_ét∗g′_ét^∗F` is an isomorphism (i) if `i = 0`, (ii) for all `i ≥ 0` if `f` or `g` is quasi-pro-étale, (iii) for all `i ≥ 0` if nF `= 0` for some `n` prime to `p`.

*Needs:* `C1.9`; `C1.7`; `C0.17`.

(ECD Corollary 16.10, p. 96; ECD proof of Corollary 16.10, p. 96.)

#### C1.12 Derived base change for étale cohomology on `D⁺`

In the cartesian diagram of target C1.11 (`f` qcqs), if `f` or `g` is quasi-pro-étale or `nΛ = 0` for some `n` prime to `p`, then `g_ét^∗Rf_ét∗A → Rf′_ét∗g′_ét^∗A` is an isomorphism for every `A ∈ D⁺(Y_ét, Λ)`.

*Needs:* `C1.11`.

(ECD Corollary 16.10, p. 96; ECD proof of Corollary 16.10, p. 96.)

### Examples

For the fold `Y⊔Y→Y` and a pair `(F₁,F₂)`, direct image in degree zero is `F₁×F₂`. Pullback preserves this finite product, and the degree-zero base-change map is its canonical identity. The Artin–Schreier check above records why the prime-to-`p` coefficient condition cannot be dropped in positive degrees. (ECD Theorem 16.1, p. 92.)

### Dependencies

Layer C0; `ClassicalAdicEtaleCohomology`, §§7.1–7.2; `EnhancedDerivedSheaves`, Layer E3.

<a id="c2"></a>

## Layer C2: The étale derived category and its enhancement

Define étale complexes by strictly totally disconnected tests, prove `v`-locality, and construct the stable enhancement in a single adequate cutoff. The resulting coreflection is the input to direct image and internal Hom.

### Étale complexes and their tests

#### C2.1 Being étale can be checked `v`-locally

Given a `v`-cover `f : Y′ → Y` between locally spatial diamonds, prove two descent tests for a complex `A` in either `D(Y_qproét, Λ)` or `D(Y_v, Λ)`. First, `f^∗A ∈ D⁺(Y′_ét, Λ)` implies `A ∈ D⁺(Y_ét, Λ)`. Second, when both diamonds are strictly totally disconnected, `f^∗A ∈ D(Y′_ét, Λ)` implies `A ∈ D(Y_ét, Λ)` without a boundedness condition. Regard the étale categories as full subcategories by the C0 comparisons.

*Needs:* `C0.22`; `C0.24`; `C0.23`; `C0.16`; `C0.10`; `C1.3`; `C0.12`; `C0.14`.

(ECD Theorem 14.12, p. 87; ECD proof of Theorem 14.12, p. 87.)

#### C2.2 The étale derived category `D_ét(Y, Λ)` of a small `v`-stack

Let `Y` be a small `v`-stack and `Λ` a ring. `D_ét(Y, Λ) ⊂ D(Y, Λ) = D(Y_v, Λ)` is the full subcategory of those `A` such that for every strictly totally disconnected perfectoid space `X` with a map `f : X → Y`, the pullback `f^∗A` lies in `D(X_ét, Λ) ⊂ D(X_v, Λ)` (the fully faithful embedding of C0.24).

Require the following API.

- `Det`: The full triangulated subcategory `D_ét(Y, Λ)` of `D(Y_v, Λ)`, as an object property closed under isomorphisms, shifts and cones.
- `Det.mem_iff_std`: `A ∈ D_ét(Y, Λ)` iff `f^∗A ∈ D(X_ét, Λ)` for every map `f : X → Y` from a strictly totally disconnected perfectoid space.
- `Det.mem_iff_cover`: For one `v`-cover `X → Y` by a disjoint union of strictly totally disconnected spaces, `A ∈ D_ét(Y, Λ)` iff its pullback lies in `D(X_ét, Λ)`.
- `Det.mem_iff_cohomology`: `A ∈ D_ét(Y, Λ)` iff `Hⁱ(A)[0] ∈ D_ét(Y, Λ)` for all `i` (target C2.6).
- `Det.pullback_mem`: For a `0`-truncated `g : Y′ → Y, g_v^∗` (restriction to the slice) carries `D_ét(Y, Λ)` into `D_ét(Y′, Λ)`, because a strictly totally disconnected `X → Y′` composes to `X → Y`; arbitrary `g` are treated in C3.1.
- `Det.std_eq`: For strictly totally disconnected `Y, D_ét(Y, Λ)` is the essential image of `D(Y_ét, Λ) = D(|Y|, Λ)`.
- `Det.plus_eq`: For a locally spatial diamond `Y, D⁺_ét(Y, Λ)` is the essential image of `D⁺(Y_ét, Λ)`.
- `Det.isTriangulated`: `D_ét(Y, Λ)` is a triangulated subcategory closed under the canonical truncations, so it carries the induced `t`-structure.

**Checks.**

- `Det_zero_ring`: For `Λ = 0, D_ét(Y, Λ) = 0`.
- `Det_empty`: For `Y = ∅, D_ét(Y, Λ) = 0`.
- `Det_geometric_point`: For `Y = Spa(C, O_C)` with `C` algebraically closed, `D_ét(Y, Λ)` is equivalent to `D(Λ)` via global sections.
- `Det_std`: For strictly totally disconnected `X, D_ét(X, Λ)` is equivalent to Mathlib's `DerivedCategory` of sheaves of `Λ`-modules on `|X|`.
- `Det_condensed_nonexample`: For `Y = Spa(C, O_C)` and `Λ = ℤ_p`, the `v`-sheaf `X ↦ C(|X|, ℤ_p)` (continuous maps for the `p`-adic topology) is not in `D_ét(Y, ℤ_p)`: it is concentrated in degree `0` and not pulled back from `Y_ét`, whose sheaves take the value `C(S, M)` with `M` discrete on `Spa(C, O_C) × S`.

*Needs:* `C0.24`; `C0.4`; `C2.1`; `DiamondsAndVStacks`, Layer D1; `DerivedCategory`.

(ECD Definition 14.13, p. 88.)

#### C2.3 `D_ét` is tested on one `v`-cover and agrees with the étale derived category in two cases

Let `Y` be a small `v`-stack. `A ∈ D(Y_v, Λ)` lies in `D_ét(Y, Λ)` as soon as its pullback to one `v`-cover of `Y` by a locally spatial diamond (e.g. a disjoint union of strictly totally disconnected spaces) does. If `Y` is a locally spatial diamond, `D⁺_ét(Y, Λ) = D⁺(Y_ét, Λ)`; if `Y` is strictly totally disconnected, `D_ét(Y, Λ) = D(Y_ét, Λ)`.

*Needs:* `C2.1`; `C2.2`; `C0.9`; `DiamondsAndVStacks`, Layer D1.

(ECD Remark 14.14, p. 88.)

#### C2.4 `D_ét(Y, Λ)` is left-complete

For every small `v`-stack `Y`, the category `D_ét(Y, Λ)` is left-complete: for `A ∈ D_ét(Y, Λ), A ≅ R lim_n τ^{≥−n}A`, and every Postnikov tower in `D_ét(Y, Λ)` has its limit in `D_ét(Y, Λ)`.

*Needs:* `C0.22`; `C2.2`; `EnhancedDerivedSheaves`, Layer E2; `C0.24`.

(ECD Proposition 14.15, p. 88; ECD proof of Proposition 14.15, p. 88.)

#### C2.5 `D_ét` of a locally spatial diamond is the left completion of `D(Y_ét, Λ)`

Let `Y` be a locally spatial diamond. Then `D_ét(Y, Λ)` is the left completion of `D(Y_ét, Λ)`: the functor `D(Y_ét, Λ) → D_ét(Y, Λ)` induces an equivalence from the left completion (the left completion of `EnhancedDerivedSheaves`, §E2.3 (`postnikovCompletion`), i.e. the homotopy category of `lim_n 𝒟(Y_ét, Λ)^{≥−n}`, realised as Postnikov towers in the derived category of `ℕ`-indexed inverse systems; not the `1`-category of towers in `D(Y_ét, Λ)`, whose Hom sets omit the `lim¹` term) onto `D_ét(Y, Λ)`, compatibly with truncations and with the enhancements and cutoff transitions. In particular the embedding `D⁺(Y_ét, Λ) ⊂ D(Y_qproét, Λ)` extends to a fully faithful embedding `D_ét(Y, Λ) ⊂ D(Y_qproét, Λ)`, whose image consists of the objects all of whose cohomology sheaves are pulled back from `Y_ét`.

*Needs:* `C2.3`; `C2.4`; `EnhancedDerivedSheaves`, Layer E2; `C0.23`; `C0.22`; `C2.12`; `C2.9`.

(ECD Proposition 14.15, p. 88; ECD proof of Proposition 14.15, p. 88.)

#### C2.6 Membership in `D_ét` is detected on cohomology sheaves

Let `Y` be a small `v`-stack and `A ∈ D(Y_v, Λ)`. Then `A ∈ D_ét(Y, Λ)` if and only if `Hⁱ(A)[0] ∈ D_ét(Y, Λ)` for all `i ∈ ℤ`.

*Needs:* `C2.4`; `C2.2`; `C0.22`.

(ECD Proposition 14.16, p. 88; ECD proof of Proposition 14.16, p. 88.)

#### C2.7 Étale quasi-pro-étale pushforward computes the `v`-pushforward

Let `f : Y′ → Y` be a map of locally spatial diamonds, and assume `f` is quasi-pro-étale or `nΛ = 0` for some `n` prime to `p`. At a common adequate `κ`, if `A ∈ D_ét(Y′,Λ)` and `Rf_qproét,κ∗A` lies in the étale essential image in `D(Y_qproét,κ,Λ)`, then `Rf_v,κ∗i_{Y′,κ}A` lies in `i_{Y,κ}D_ét(Y,Λ)` and agrees with the `v`-pullback of `Rf_qproét,κ∗A`. Cutoff compatibility on a range of stages requires this essential-image hypothesis at each stage in that range.

*Needs:* `C1.6`; `C2.5`.

(ECD Corollary 16.5, p. 93; ECD proof of Corollary 16.5, p. 94.)

#### C2.8 `v`-pushforward along qcqs maps preserves étale complexes

For a qcqs map `f` of small `v`-stacks, at every adequate `κ` require `Rf_v,κ∗` to send `i_{Y′,κ}D_ét` into `i_{Y,κ}D_ét` when `f` is quasi-pro-étale. Under the alternative coefficient condition `nΛ = 0` for some `n` prime to `p`, require this preservation on `D⁺_ét`. If source and target are locally spatial in this second case, identify `D⁺_ét` with `D⁺(−_ét)` and prove `Rf_v,κ∗i_{Y′,κ} ≃ i_{Y,κ}Rf_ét∗` on that category. The étale essential-image assertion supplies cutoff compatibility for these inputs.

*Needs:* `C1.8`; `C2.7`; `C1.6`; `DiamondsAndVStacks`, Layer D1; `C2.2`; `C2.3`; `C2.10`; `DiamondsAndVStacks`, Layer D5; `C2.6`.

(ECD Corollary 16.8(i), p. 94; ECD proof of Corollary 16.8, p. 94.)

### Enhanced categories and descent

#### C2.9 The enhanced `v`-derived categories at a cutoff and their functoriality

For a small `v`-stack `Y`, a ring `Λ` and a cutoff cardinal `κ`, the `∞`-derived category `𝒟(Y_v,κ, Λ)` of sheaves of `Λ`-modules on `Y_v,κ` is a presentable stable `∞`-category with homotopy category `D(Y_v,κ, Λ)`; the transition functors for `κ ≤ κ′` and the pullbacks `f_v^∗` along `0`-truncated maps are colimit-preserving exact functors of `∞`-categories, with coherent compatibility data under change of cutoff and composition. For a simplicial small `v`-stack `Y_•` with `0`-truncated face maps, use `𝒟(Y_•,v,κ, Λ)` for the `∞`-derived category of the simplicial site at `κ`, with its full subcategory `𝒟_cart(Y_•,v,κ, Λ)` of cartesian objects.

Require the following API.

- `enhancedV`: The presentable stable `∞`-category `𝒟(Y_v,κ, Λ)` with an equivalence of its homotopy category with `D(Y_v,κ, Λ)`.
- `enhancedV.transition`: For `κ ≤ κ′` a fully faithful colimit-preserving exact functor `𝒟(Y_v,κ, Λ) → 𝒟(Y_v,κ′, Λ)`, with coherent composition for `κ ≤ κ′ ≤ κ″`.
- `enhancedV.pullback`: For `0`-truncated `f`, a colimit-preserving exact functor `f_v^∗` commuting with transitions, with coherent `(f ∘ g)_v^∗ ≃ g_v^∗ ∘ f_v^∗`.
- `enhancedV.simplicial`: For a simplicial `Y_•` with `0`-truncated face maps, `𝒟(Y_•,v,κ, Λ)` and the full subcategory of cartesian objects at a common adequate `κ`.
- `enhancedV.homotopy`: Passing to homotopy categories recovers the triangulated categories and derived pullbacks of C0.
- `enhancedV.augmentation`: For an augmented simplicial `Y_• → Y` with `0`-truncated maps and all `Y_i κ`-small, pullback gives `𝒟(Y_v,κ, Λ) → 𝒟(Y_•,v,κ, Λ)` landing in cartesian objects; its right adjoint is the totalization, in `𝒟(Y_v,κ,Λ)`, of the termwise `Rg_{n,v,κ∗}`. This is a formula at `κ`. Compatibility of the inverse on the cartesian hyperdescent image comes from C2.10, independently of invertibility of the termwise cutoff comparisons.
- `enhancedV.pushforward`: For `0`-truncated `f` and each adequate `κ`, the right adjoint `Rf_{v,κ∗}` of `f_{v,κ}^∗`. For `κ≤κ′` let `c_Y^∗` and `c_{Y′}^∗` be the fully faithful cutoff extensions. Construct the canonical mate `c_Y^∗Rf_{v,κ∗}A → Rf_{v,κ′∗}c_{Y′}^∗A`, natural in `A` and coherent for identities, composition of maps and three cutoffs. It is not required to be invertible. Taking right adjoints of compatible pullbacks instead gives `c_{Y∗}Rf_{v,κ′∗} ≃ Rf_{v,κ∗}c_{Y′∗}`, with the right adjoints of the extensions.
- For adjunctions `L⊣R, L′⊣R′` and `comm : L⋙cD ≃ cC⋙L′`, the ordinary categorical mate is Mathlib's `CategoryTheory.mateEquiv` applied to `comm.inv` (`CategoryTheory/Adjunction/Mates.lean`). Its component `cCRA → R′cDA` is adjoint to `L′cCRA ≃ cDLRA → cDA`, using the counit of `L⊣R`.
- `mate_isIso_iff_essImage`: When `cC` and `cD` are fully faithful, the component at `A` is invertible if and only if `R′(cD A)` belongs to the essential image of `cC`. Applied with `cC=c_Y^∗` and `cD=c_{Y′}^∗`, this is the sufficient essential-image criterion for upgrading the ambient comparison. It does not assert that a geometrically adequate cutoff meets that criterion for arbitrary coefficients.

**Checks.**

- `enhancedV_zero_ring`: For `Λ = 0, 𝒟(Y_v,κ, Λ)` is the zero `∞`-category.
- `enhancedV_point`: For `Y = Spa(C, O_C)`, mapping spectra from `Λ` in `𝒟(Y_v,κ, Λ)` compute `RΓ(Y_v, −)`; for `Λ = 𝔽_ℓ (ℓ ≠ p)` and the constant sheaf, `π_0 Map(Λ, Λ[i]) = 𝔽_ℓ` for `i = 0` and `0` otherwise. This computation in degrees `i ≥ 2` uses the higher-vanishing theorem of C0.
- `enhancedV_homotopy_category`: The homotopy category of `𝒟(Y_v,κ, Λ)` is `D(Y_v,κ, Λ)`, compatibly with shifts and distinguished triangles.
- `enhancedV_not_set_presentable_uncut`: For `Y ≠ ∅` and `Λ ≠ 0` the colimit over all `κ` is not presentable: any set of objects lies in one cutoff, whose image is closed under colimits. For each `κ` construct a perfectoid test `Z→Y` with a profinite fibre of weight exceeding `κ` and prove that the free `Λ`-module sheaf `Λ[h_Z]`, placed in degree zero, does not descend to that cutoff. On that fibre, distinct points give distinct basis vectors since `1≠0`; any putative descent would make these vectors factor through a `κ`-small profinite quotient, contradicting the fibre weight. For `Y=∅` or `Λ=0` the colimit is zero and presentable.
- For `f=id`, the ambient cutoff mate is the identity at every adequate `κ≤κ′`.
- For the finite fold `Y⊔Y→Y, Rf_{v,κ∗}(A,B)=A×B`. Cutoff extension preserves this finite product, so the mate is invertible for arbitrary `A,B`.
- Let `κ` be an allowed singular cutoff with `δ=cf(κ)=ω₁<κ, Y=Spa(C,O_C) κ`-small with `C` algebraically closed perfectoid of characteristic `p, Λ=𝔽_ℓ, ℓ≠p`, and `|J_i|<κ` cofinal in `κ` for `i<δ`. Put `S_i=Λ^{J_i}, F_i(T)=C(|T|,S_i)` and `f:⊔_{i<δ}Y→Y`. Each `F_i` is a module sheaf represented as a set sheaf by the `κ`-small perfectoid space `Y×S_i`; strong limit growth bounds both its profinite set and its continuous-function ring below `κ`. The disjoint union is `κ`-small, and the family `F=(F_i)` is an ambient module sheaf with no uniform bound on the `|J_i|`. Cutoff extension is componentwise and preserves each `κ`-small representable `Y×S_i`, hence extends each `F_i` to the same represented module sheaf. Write `J=⊔_i J_i, |J|=κ`. Then `H⁰Rf_{v,κ∗}F=∏_{j∈J}Λ_Y`. At `κ′` large enough for `Y×S` with `S=Λ^J`, the larger pushforward has the coordinate section given by `id_S`. By ECD Proposition 8.2, a section extended from `κ` factors through a `κ`-small affinoid approximation, so its coordinate image has cardinality `<κ`, whereas `|S|=ℓ^κ>κ`. The mate fails already on `H⁰`. This uses `t`-exactness of extension, without an exactness assertion for uncountable products.

*Needs:* `EnhancedDerivedSheaves`, Layer E1; `EnhancedDerivedSheaves`, Layer E3; `C0.4`; `C0.3`.

(ECD Lemma 17.1 and proof, p. 96; ECD Proposition 8.2 and proof, pp. 39–40; ECD Lemma 4.1, pp. 19–20; `EnhancedDerivedSheaves` §E3.4, `cutoffRightAdjoint_compat`; pinned Mathlib `CategoryTheory/Adjunction/Mates.lean`, `CategoryTheory.mateEquiv`.)

#### C2.10 Hyperdescent for the `v`-derived category

Let `Y` be a small `v`-stack, `Y_• → Y` a simplicial `v`-hypercover by small `v`-stacks with `0`-truncated maps `Y_i → Y`, and `κ` a cutoff with all `Y_i κ`-small. Pullback induces a fully faithful functor `𝒟(Y_v,κ, Λ) → 𝒟(Y_•,v,κ, Λ)` whose essential image is the full `∞`-subcategory of cartesian objects. These equivalences commute with the transition functors for `κ ≤ κ′`, so they pass to the colimit `𝒟(Y_v, Λ)`, and for a `0`-truncated `g : Y′ → Y` they commute with `g_v^∗` and the pulled-back hypercover `Y_• ×_Y Y′`. On homotopy categories `D(Y_v, Λ) → D(Y_•,v, Λ)` is fully faithful with essential image the cartesian objects. On that image the stagewise totalization inverse of C2.9 commutes with cutoff enlargement by uniqueness of an inverse to the compatible pullbacks. This gives no termwise ambient pushforward equivalence on arbitrary simplicial coefficients.

*Needs:* `C0.21`; `EnhancedDerivedSheaves`, Layer E2; `C2.9`; `EnhancedDerivedSheaves`, Layer E3.

(ECD Proposition 17.3, p. 97; ECD proof of Proposition 17.3, p. 97.)

#### C2.11 `D_ét(Y, Λ)` lies in one cutoff

Let `Y` be a small `v`-stack and `Y_• → Y` a simplicial `v`-hypercover by disjoint unions of strictly totally disconnected spaces. Then `D_ét(Y, Λ) = D_ét,cart(Y_•, Λ)`, the cartesian objects with terms in `D(Y_i,ét, Λ)`; hence `D_ét(Y, Λ) ⊂ D(Y_v,κ, Λ)` for every cutoff `κ` such that all `Y_i` are `κ`-small.

*Needs:* `C2.10`; `C2.3`; `PerfectoidSpaces`, Layer P6.

(ECD Remark 17.4, p. 97.)

#### C2.12 The presentable stable `∞`-category `𝒟_ét(Y, Λ)`

For a small `v`-stack `Y` there is a natural presentable stable `∞`-category `𝒟_ét(Y, Λ)` with homotopy category `D_ét(Y, Λ)`: for `κ` large enough it is the full `∞`-subcategory of `𝒟(Y_v,κ, Λ)` on the objects of `D_ét(Y, Λ)`; it is closed under all colimits, and its formation is compatible with change of cutoff and with pullback.

Require the following API.

- `enhancedEt`: The full `∞`-subcategory `𝒟_ét(Y, Λ) ⊂ 𝒟(Y_v,κ, Λ)`, for `κ` adequate for `Y`.
- `enhancedEt.presentable`: `𝒟_ét(Y, Λ)` is presentable and stable.
- `enhancedEt.closed_colimits`: `𝒟_ét(Y, Λ)` is closed under all small colimits in `𝒟(Y_v,κ, Λ)`.
- `enhancedEt.homotopy`: Its homotopy category is `D_ét(Y, Λ)`.
- `enhancedEt.cutoff_independent`: For `κ ≤ κ′` both adequate, the transition functor restricts to an equivalence of the two `𝒟_ét(Y, Λ)`.
- `enhancedEt.descent`: For a hypercover `Y_• → Y` by disjoint unions of strictly totally disconnected spaces, `𝒟_ét(Y, Λ) ≃ lim_{[n]∈Δ} 𝒟`(`Y_n`,ét, `Λ`).
- `enhancedEt.pullback`: For a `0`-truncated `f : Y′ → Y` and `κ` adequate for both, `f_v^∗` restricts to a colimit-preserving exact functor `𝒟_ét(Y, Λ) → 𝒟_ét(Y′, Λ)`, commuting with cutoff transitions, with coherent `(f ∘ g)^∗ ≃ g^∗ ∘ f^∗` and `id^∗ ≃ id`.

**Checks.**

- `enhancedEt_std`: For strictly totally disconnected `X, 𝒟_ét(X, Λ) ≃ 𝒟(X_ét, Λ)`, the `∞`-derived category of sheaves of `Λ`-modules on `|X|`.
- `enhancedEt_point`: For `Y = Spa(C, O_C), 𝒟_ét(Y, Λ) ≃ 𝒟(Λ)`, the `∞`-derived category of `Λ`-modules.
- `enhancedEt_empty`: For `Y = ∅, 𝒟_ét(Y, Λ)` is the zero `∞`-category.
- `enhancedEt_not_all_sheaves`: `𝒟_ét(Y, Λ)` is not closed under limits in `𝒟(Y_v,κ, Λ)` in general; its limits are computed with the coreflection `R_Yét`.

*Needs:* `C2.9`; `C2.10`; `C2.11`; `C0.24`; `EnhancedDerivedSheaves`, Layer E3; `C2.6`; `DiamondsAndVStacks`, Layer D1; `DiamondsAndVStacks`, Layer D4.

(ECD Lemma 17.1, p. 96; ECD proof of Lemma 17.1, p. 96.)

### Étale coreflection

#### C2.13 The étale coreflection `R_Yét`

For every small `v`-stack `Y` the inclusion `D_ét(Y, Λ) ⊂ D(Y_v, Λ)` has a right adjoint `R_Yét : D(Y_v, Λ) → D_ét(Y, Λ)`, the homotopy category of right adjoints at each adequate cutoff, which are compatible with change of cutoff.

Require the following API.

- `etaleCoreflection`: The functor `R_Yét : D(Y_v, Λ) → D_ét(Y, Λ)` with the adjunction `incl ⊣ R_Yét`.
- `etaleCoreflection.counit_iso_of_mem`: For `A ∈ D_ét(Y, Λ)` the counit `R_Yét(A) → A` is an isomorphism.
- `etaleCoreflection.exact`: `R_Yét` is exact and commutes with all limits.
- `etaleCoreflection.cutoff`: `R_Yét` computed at `κ` and at `κ′ ≥ κ` agree on `D(Y_v,κ, Λ)`.
- `etaleCoreflection.bounded_formula`: For locally spatial `Y, R_Yét = R(ν ∘ λ)∗` on `D⁺(Y_v, Λ)` (target C2.14).

**Checks.**

- `etaleCoreflection_on_etale`: `R_Yét(A) ≅ A` for every `A ∈ D_ét(Y, Λ)`.
- `etaleCoreflection_point`: For `Y = Spa(C, O_C), R_Yét(A)` is the constant complex `RΓ(Y_v, A)`.
- `etaleCoreflection_std`: For strictly totally disconnected `Y, R_Yét = R(ν ∘ λ)∗` on all of `D(Y_v, Λ)`.
- `etaleCoreflection_not_identity`: For `Y = Spa(C, O_C)` and the `v`-sheaf `S ↦ C(S, ℤ_p), R_Yét` of it is `ℤ_p[0]` (global sections), which differs from the sheaf itself.

*Needs:* `C2.12`; `EnhancedDerivedSheaves`, Layer E3; `CategoryTheory.Adjunction`.

(ECD Corollary 17.2, p. 97; ECD proof of Corollary 17.2, p. 97.)

#### C2.14 `R_Yét` on bounded-below objects of a locally spatial diamond

If `Y` is a locally spatial diamond, then on `D⁺(Y_v, Λ)` the coreflection `R_Yét` is `R(ν ∘ λ)∗` followed by the embedding `D⁺(Y_ét, Λ) ⊂ D_ét(Y, Λ)`, where `ν ∘ λ : Y_v → Y_ét` is the map of sites; if `Y` is strictly totally disconnected, this formula holds on all of `D(Y_v, Λ)`.

*Needs:* `C2.13`; `C0.23`; `C0.24`; `C2.3`; `C0.8`.

(ECD after Corollary 17.2, p. 97.)

### Examples

On `Spa(C,O_C), D_ét` is `D(Λ)`. The `p`-adically continuous `v`-sheaf `S↦C(S,ℤ_p)` is distinct from the constant étale sheaf with discrete value `ℤ_p`; coreflection sends it to the latter in degree zero. This distinguishes membership in the `v`-derived category from étaleness. (ECD Definition 14.13, p. 88; Corollary 17.2, p. 97.)

### Dependencies

Layers C0–C1; `PerfectoidSpaces`, Layer P6; `DiamondsAndVStacks`, Layers D1, D4–D5; `EnhancedDerivedSheaves`, Layers E1–E3.

<a id="c3"></a>

## Layer C3: The four operations

Construct the operations with adjunctions and naturality. Base change for unbounded complexes carries the finite cohomological dimension hypothesis; general coefficient change is a separate interface.

### Pullback, direct image and base change

#### C3.1 Pullback `f^∗` on `D(Y_v, Λ)` and `D_ét` for arbitrary maps of small `v`-stacks

Let `f : Y′ → Y` be a map of small `v`-stacks. Choose a perfectoid space `Y′_0` with a surjection `Y′_0 → Y′` and let `Y′_•` be its Čech nerve; all `Y′_i` are small `v`-sheaves and `Y′_i → Y′, Y′_i → Y` are `0`-truncated. Pullback along `Y′_• → Y` gives `f_v^∗ : 𝒟(Y_v, Λ) → 𝒟_cart(Y′_•,v, Λ) ≃ 𝒟(Y′_v, Λ)`, which carries `𝒟_ét(Y, Λ)` into `𝒟_ét(Y′, Λ)` and restricts to `f^∗ : D_ét(Y, Λ) → D_ét(Y′, Λ)`. The functor is canonically independent of the choice of `Y′_0 → Y′` and, for `g : Y″ → Y′`, there is a natural equivalence `(f ∘ g)^∗ ≃ g^∗ ∘ f^∗` with the usual coherences. For `0`-truncated `f` it is the pullback of the morphism of sites `f_v`.

Require the following API.

- `pull`: For `f : Y′ → Y`, the exact colimit-preserving functor `f^∗ : 𝒟_ét(Y, Λ) → 𝒟_ét(Y′, Λ)`, and on homotopy categories `f^∗ : D_ét(Y, Λ) → D_ét(Y′, Λ)`.
- `pull_comp`: For `g : Y″ → Y′` and `f : Y′ → Y, pull (g ≫ f) ≅ pull f ⋙ pull g`, coherently associative.
- `pull_id`: `pull (𝟙 Y) ≅ 𝟭`.
- `pull_zeroTruncated`: If `f` is `0`-truncated, `pull f` is the restriction of `f_v^∗` for the morphism of sites `f_v`.
- `pull_locallySpatial`: If `f` is a map of locally spatial diamonds, `pull f` restricted to `D⁺_ét = D⁺(−_ét)` is `f_ét^∗`.
- `pull_tStructure`: `pull f` is `t`-exact for the standard `t`-structures and commutes with `Hⁱ`.
- `pull_colimits`: `pull f` preserves all small colimits.
- `pull_twoCell`: `A 2`-isomorphism `α : h ⇒ h′` of maps of small `v`-stacks induces `pull h ≅ pull h′`, compatibly with `pull_comp` and with vertical composition of `2`-cells.
- `vPull`: `f_{v,κ}^∗ : 𝒟(Y_v,κ, Λ) → 𝒟(Y′_v,κ, Λ)` for `κ` adequate for the presentations of `Y` and `Y′` and the Čech nerve of `Y′_0 → Y′`. These pullbacks commute coherently with cutoff extension and assemble to the uncut pullback. Require `vPull_comp : vPull (g ≫ f) ≅ vPull f ⋙ vPull g`; for `0`-truncated `f` this is the pullback of the morphism of sites.
- `vPush`: At each such `κ`, the right adjoint `Rf_{v,κ∗}` of `f_{v,κ}^∗`, given by `Rf_{v,κ∗}A = lim_{[n]∈Δ} Rg_{n,v,κ∗}(A|Y′_n)`, with totalization in `𝒟(Y_v,κ,Λ)`. For `0`-truncated `f` it is the derived pushforward of the morphism of sites. At fixed `κ` it is independent of the cover by adjunction, composes coherently and commutes with restriction to `0`-truncated `v`-slices at a common adequate `κ`. Require the canonical cutoff mate and its coherences as in C2.9; its equivalence requires the stated essential-image criterion. The formula uses stagewise termwise pushforwards, and does not assemble an uncut ambient right adjoint.

**Checks.**

- `pull_id_test`: `pull (𝟙 Y) A ≅ A` for every `A ∈ D_ét(Y, Λ)`.
- `pull_constant`: `pull f` carries the constant sheaf `Λ_Y` to `Λ_{Y′}`.
- `pull_std_compat`: For a map `f : X′ → X` of strictly totally disconnected spaces, `pull f` corresponds to the derived pullback of sheaves on `|X|` along `|f|` under `D_ét = D(|−|, Λ)`.
- `pull_comp_order`: For `g : Z → Y` and `f : Y → X, (f ∘ g)^∗ ≃ g^∗ ∘ f^∗` (and not `f^∗ ∘ g^∗`, which does not typecheck).
- `pull_classifying_stack`: For a finite group `G` acting trivially on `X = Spa(C, O_C)` and `q : X → [X/G]`, hyperdescent along the Čech nerve `G^• × X` (C2.10) gives `𝒟_ét([X/G], Λ) ≃ Fun`(BG, `𝒟(Λ)`) `≃ 𝒟(Λ[G])`, and `pull q` is the forgetful functor to `𝒟(Λ)`; for `G ≠ 1` and `Λ ≠ 0` it is not fully faithful (`End(Λ[G])` is `Λ[G]` in `𝒟(Λ[G])` but the `|G| × |G|` matrix ring over `Λ` in `𝒟(Λ)`).

*Needs:* `C2.9`; `C2.10`; `C2.2`; `C2.12`; `EnhancedDerivedSheaves`, Layer E3; `CategoryTheory.Functor.IsCocontinuous`; `C0.5`.

(ECD §17, p. 98.)

#### C3.2 Pushforward `Rf∗` on `D_ét`

For any map of small `v`-stacks `f : Y′ → Y`, the functor `f^∗ : D_ét(Y, Λ) → D_ét(Y′, Λ)` has a right adjoint `Rf∗ : D_ét(Y′, Λ) → D_ét(Y, Λ)`, the homotopy category of a right adjoint of the colimit-preserving functor `f^∗ : 𝒟_ét(Y, Λ) → 𝒟_ét(Y′, Λ)` of presentable `∞`-categories.

Require the following API.

- `push`: `Rf∗ : 𝒟_ét(Y′, Λ) → 𝒟_ét(Y, Λ)` with the adjunction `pull f ⊣ push f`.
- `push_comp`: `push (g ≫ f) ≅ push g ⋙ push f`, i.e. `R(f ∘ g)∗ ≃ Rf∗ ∘ Rg∗`, the mate of `pull_comp`, coherently.
- `push_id`: `R(𝟙 Y)∗ ≅ 𝟭`.
- `push_limits`: `Rf∗` is exact and preserves all limits.
- `push_globalSections`: `RΓ(Y, −) := RHom_{𝒟_ét(Y,Λ)}(Λ_Y, −) : D_ét(Y, Λ) → D(Λ)`, so `Hⁱ(Y, A) = Hom(Λ_Y, A[i])`; for `f : Y → ∗` the adjunction gives `Hom(Λ_Y, A[i]) = Hom(Λ_∗, (Rf∗A)[i])` and `RΓ(Y, A) = RΓ(∗, Rf∗A)`. `D_ét(∗, Λ)` is not `D(Λ)`, so `Hⁱ(Rf∗A)` is a sheaf on `∗_v`, not `Hⁱ(Y, A)`.
- `push_eq_coreflection`: For every adequate `κ` and `A∈𝒟_ét(Y′,Λ), Rf∗A ≃ R_{Y,ét,κ}(Rf_{v,κ∗}i_{Y′,κ}A)`, coherently in `κ` (target C3.3).
- `push_locallySpatial`: For locally spatial `Y′, Y, Rf∗` is the left-completed `Rf_ét∗` (target C3.4).
- `push.baseChange`: For a `2`-cartesian square of small `v`-stacks (`f̃ : Ỹ′ → Ỹ, g′ : Ỹ′ → Y′` over `f : Y′ → Y, g : Ỹ → Y`), the base change transformation `g^∗ ∘ Rf∗ ⟶ Rf̃∗ ∘ g′^∗`, the mate of `pull_comp` and the `2`-cell `(pull_twoCell)`; the identity for `g = id`; compatible with horizontal and vertical pasting; for qcqs `f` with `nΛ = 0, n` prime to `p`, on `D⁺_ét` it agrees at every common adequate `κ` with the `v`-site base-change map under `i_{Y,κ}Rf∗ ≃ Rf_{v,κ∗}i_{Y′,κ}`.

**Checks.**

- `push_id_test`: `R(𝟙 Y)∗ A ≅ A`.
- `push_point`: For `f : Spa(C, O_C) × S → Spa(C, O_C)` with `S` profinite and `M` a `Λ`-module, `Rf∗ M = C(S, M)` placed in degree `0` (locally constant functions).
- `push_adjunction`: `Hom_{D_ét(Y,Λ)}(B, Rf∗A) ≅ Hom_{D_ét(Y′,Λ)}(f^∗B, A)` naturally in `B` and `A`.
- `push_not_v_pushforward`: For `f : ⊔_{n∈N} Spa(C, O_C) → Spa(C, O_C)` (not quasicompact) and `Λ ≠ 0` finite, at each adequate `κ, Rf_{v,κ∗}i_{Y′,κ}Λ` is the `v`-sheaf `X ↦ C(|X|, Λ^N)` with `Λ^N` in the product topology, which is not in `D_ét` (its sections over `Spa(C, O_C) × (N ∪ {∞})` are not locally constant), while `Rf∗Λ ≃ R_{Y,ét,κ}(Rf_{v,κ∗}i_{Y′,κ}Λ)` is the constant sheaf `Λ^N`; for qcqs `f` with `nΛ = 0, n` prime to `p`, the two agree on `D⁺_ét` (Proposition 17.6).

*Needs:* `C3.1`; `C2.12`; `EnhancedDerivedSheaves`, Layer E3; `CategoryTheory.Adjunction`.

(ECD Lemma 17.5, p. 98; ECD proof of Lemma 17.5, p. 98.)

#### C3.3 `Rf∗` is the coreflection of the `v`-pushforward

For any map of small `v`-stacks `f:Y′→Y`, every common adequate `κ` and `A∈𝒟_ét(Y′,Λ)`, prove `Rf_* A ≃ R_{Y,ét,κ}(Rf_{v,κ*}(i_{Y′,κ} A))`. Both sides represent `B↦Map(f^∗B,A)` on the fixed category `𝒟_ét(Y,Λ)`, using the adjunctions of C3.1 and C2.13 and full faithfulness of `i_{Y′,κ}`. The equivalence is natural in `A` and `f`. After target coreflection, the ambient cutoff mate of C2.9 induces the equivalence of these representatives at `κ` and `κ′`; require the identity, composition and three-cutoff coherences. No ambient essential-image assertion is needed for this coreflected comparison.

The representative ordinary categorical signature `push_coreflectionIso` expresses this argument: if `L⊣R, i⊣S, P⊣Q, j` is fully faithful and `i⋙L≃P⋙j`, then `Q≃j⋙R⋙S`. Here `i,j` are the étale inclusions, `P=f^∗` and `Q=Rf∗`.

**Checks.**

- For `f=id`, the formula is `R_{Y,ét,κ}i_{Y,κ}≃id` at every adequate cutoff.
- For `f:Y⊔Y→Y` and étale `A,B`, it gives their product in `𝒟_ét(Y,Λ)`, computed by coreflecting the ambient product at either cutoff.
- In the singular-cutoff example of C2.9 the input `F` is ambient and need not be étale. Coreflecting it at the source gives an étale input to which this formula applies at every adequate cutoff, without making the failed ambient comparison on `F` invertible. For the countable fold with constant `Λ` in C3.2, target coreflection gives the same constant value `Λ^N` at all adequate cutoffs, despite the ambient output being non-étale.

*Needs:* `C3.2`; `C2.13`; `C3.1`.

(ECD after Lemma 17.5, p. 98.)

#### C3.4 `Rf∗` for locally spatial diamonds is the left-completed étale pushforward

Let `f : Y′ → Y` be a map of locally spatial diamonds. Under the identifications of `D_ét(Y′, Λ)` and `D_ét(Y, Λ)` with the left completions of `D(Y′_ét, Λ)` and `D(Y_ét, Λ)` (C2.5), `Rf∗` is the left-completed étale pushforward: `Rf∗(R lim_n A_n) = R lim_n Rf_ét∗A_n` for a Postnikov tower `(A_n)` in `D(Y′_ét, Λ)`, and `Rf∗ = Rf_ét∗` on `D⁺_ét(Y′, Λ) = D⁺(Y′_ét, Λ)`.

*Needs:* `C3.2`; `C2.5`; `C2.4`; `C3.1`.

(ECD after Lemma 17.5, p. 98.)

#### C3.5 Pushforward along qcqs maps with prime-to-`p` torsion coefficients: comparison and base change on `D⁺`

Assume `nΛ = 0` for some `n` prime to `p`, and let `f : Y′ → Y` be a qcqs map of small `v`-stacks. For every `A ∈ D⁺_ét(Y′, Λ)` and every common adequate `κ, Rf_{v,κ∗}i_{Y′,κ}A` lies in `i_{Y,κ}D⁺_ét(Y,Λ)`, hence `i_{Y,κ}Rf∗A ≃ Rf_{v,κ∗}i_{Y′,κ}A`. In particular the ambient cutoff mate is invertible on these inputs by the essential-image criterion of C2.9. Moreover the formation of `Rf∗` commutes with any base change: for every map `g : Ỹ → Y` of small `v`-stacks with `f̃ : Ỹ′ = Y′ ×_Y Ỹ → Ỹ` and `g′ : Ỹ′ → Y′`, the natural transformation `g^∗Rf∗A → Rf̃∗g′^∗A` is an equivalence for all `A ∈ D⁺_ét(Y′, Λ)`.

*Needs:* `C2.8`; `C3.3`; `C3.1`; `C3.2`.

(ECD Proposition 17.6, p. 98; ECD proof of Proposition 17.6, p. 99.)

#### C3.6 Unbounded comparison and base change under finite cohomological dimension

Assume `nΛ = 0` for some `n` prime to `p` and let `f : Y′ → Y` be a qcqs map of small `v`-stacks such that `Rf∗` has finite cohomological dimension: there is `N` with `R^if∗A = 0` for `i > N` and all `A ∈ D_ét(Y′, Λ)` concentrated in degree `0`. Then for all `A ∈ D_ét(Y′, Λ)` and every common adequate `κ, i_{Y,κ}Rf∗A ≃ Rf_{v,κ∗}i_{Y′,κ}A` lies in `i_{Y,κ}D_ét(Y,Λ)`, so the ambient cutoff mate is invertible on these inputs, and for every map `g : Ỹ → Y` of small `v`-stacks `g^∗Rf∗A → Rf̃∗g′^∗A` is an isomorphism. Only `Rf∗`, not `Rf̃∗`, needs finite cohomological dimension.

*Needs:* `C3.5`; `EnhancedDerivedSheaves`, Layer E2; `C2.6`; `C0.22`; `C0.21`.

(ECD Proposition 17.6, p. 99; ECD proof of Proposition 17.6, p. 99.)

### Tensor, internal Hom and coefficients

#### C3.7 The derived tensor product on `D(Y_v, Λ)` and its compatibility with pullback

For a small `v`-stack `Y`, a commutative coefficient ring `Λ` and every cutoff `κ` adequate for `Y`, there is a functor `− ⊗^L_Λ − : 𝒟(Y_v,κ, Λ) × 𝒟(Y_v,κ, Λ) → 𝒟(Y_v,κ, Λ)` of `∞`-categories, preserving colimits separately in each variable, which makes `𝒟(Y_v,κ, Λ)` presentably symmetric monoidal with unit `Λ`, with internal `Hom RHom_v` right adjoint to `− ⊗^L_Λ A`. The cutoff transitions are symmetric monoidal, so `⊗^L_Λ` is defined on the colimit `𝒟(Y_v, Λ)`, which is symmetric monoidal and, when `Y≠∅` and `Λ≠0`, not presentable. For `Y=∅` or `Λ=0` it is zero and presentable. On homotopy categories it is the derived tensor product of the ringed topos. For every map `f : Y′ → Y` of small `v`-stacks there is a natural equivalence `f^∗(A ⊗^L_Λ B) ≃ f^∗A ⊗^L_Λ f^∗B`.

Require the following API.

- `vTensor`: The bifunctor `⊗^L_Λ` on `𝒟(Y_v, Λ)`, colimit-preserving in each variable.
- `vTensor.symmetricMonoidal`: For each adequate `κ, 𝒟(Y_v,κ, Λ)` is presentably symmetric monoidal with unit the constant sheaf `Λ`; the transitions `κ ≤ κ′` are symmetric monoidal, and the colimit `𝒟(Y_v, Λ)` is symmetric monoidal, and is not presentable when `Y≠∅` and `Λ≠0`.
- `vTensor.pull`: `f^∗(A ⊗^L B) ≃ f^∗A ⊗^L f^∗B`, naturally and monoidally coherent.
- `vTensor.cohomology_flat`: If `B` is a flat `Λ`-module sheaf in degree `0, Hⁱ(A ⊗^L B) = Hⁱ(A) ⊗ B`.
- `vTensor.internalHom`: At each adequate `κ, RHom_{v,κ}(A, −)` is right adjoint to `− ⊗^L_Λ A`; on homotopy categories it is the derived internal Hom of that ringed topos. For the transition `c*` from `κ` to `κ′`, monoidality and evaluation give a canonical map `c*RHom_{v,κ}(A,B) → RHom_{v,κ′}(c*A,c*B)`, coherent under further enlargement. This map need not be invertible. If `A` is dualizable, it is an equivalence by `RHom(A,B) ≃ A^∨ ⊗^L B` and preservation of duals by `c*`. Perfect local systems give dualizable inputs through C7.12; perfect-constructibility alone does not give dualizability.

**Checks.**

- `vTensor_unit`: `Λ ⊗^L A ≃ A`.
- `vTensor_constant`: For `Λ`-modules `M, N, const M ⊗^L const N = const (M ⊗^L_Λ N)`.
- `vTensor_pull`: For `f : X′ → X` strictly totally disconnected, `f^∗(A ⊗^L B) ≃ f^∗A ⊗^L f^∗B` agrees with the tensor product of sheaves on `|X′|`.
- `vTensor_not_exact`: For `Λ = ℤ, ℤ/p ⊗^L ℤ/p` has `H⁻¹ = ℤ/p ≠ 0`, so the derived tensor product is not the underived one.
- At `Y=Spa(C,O_C), Λ=𝔽_ℓ` with `ℓ≠p`, let `I` have cardinality at least `κ` in the coefficient universe, `A=⊕_{i∈I}Λ_Y` and `B=Λ_Y`. Then `H⁰RHom_{v,κ}(A,B)=∏_IΛ_Y`. Choose `κ′` large enough for `X_S=Y×S, S=(𝔽_ℓ)^I` profinite. The coordinate tuple on `X_S` in the larger product cannot come from the smaller product: ECD Proposition 8.2 expresses every extended section through one `κ`-small affinoid approximation `X_j`, so its coordinate map factors through `|X_j|` of cardinality `<κ`, whereas the identity of `S` has image of cardinality `ℓ^{|I|}>κ`. Thus the ambient Hom comparison is not an equivalence in this example; the cutoff bounds tests, not the rank of `A`.
- For dualizable `A`, including finite free constant complexes, the ambient Hom comparison is an equivalence at every adequate enlargement; the dual-tensor formula supplies it.

*Needs:* `EnhancedDerivedSheaves`, Layer E1; `C2.9`; `C3.1`; `CategoryTheory.MonoidalCategory`.

(ECD §17, p. 99; ECD Proposition 8.2 and proof, pp. 39–40; ECD Definition 4.2, p. 20.)

#### C3.8 The derived tensor product on `D_ét`

For any small `v`-stack `Y, − ⊗^L_Λ −` on `D(Y_v, Λ)` restricts to a functor `D_ét(Y, Λ) × D_ét(Y, Λ) → D_ét(Y, Λ)`; hence `𝒟_ét(Y, Λ)` is presentably symmetric monoidal, in a unique way compatible with the symmetric monoidal structure of `𝒟(Y_v, Λ)`, and `f^∗` is symmetric monoidal.

Require the following API.

- `etTensor`: The symmetric monoidal structure on `𝒟_ét(Y, Λ)` with unit `Λ_Y`.
- `etTensor.incl`: The inclusion `𝒟_ét(Y, Λ) → 𝒟(Y_v, Λ)` is symmetric monoidal.
- `etTensor.pull`: `pull f` is symmetric monoidal: `f^∗(A ⊗^L B) ≃ f^∗A ⊗^L f^∗B`.
- `etTensor.colimits`: `⊗^L` preserves colimits separately in each variable on `𝒟_ét(Y, Λ)`.
- `etTensor.stalk`: For a locally spatial diamond `Y` and a geometric point `ȳ, (A ⊗^L B)_ȳ = A_ȳ ⊗^L_Λ B_ȳ`.

**Checks.**

- `etTensor_unit`: `Λ_Y ⊗^L A ≅ A` in `D_ét(Y, Λ)`.
- `etTensor_point`: For `Y = Spa(C, O_C)`, under `D_ét(Y, Λ) ≃ D(Λ)` the tensor product is `⊗^L_Λ`.
- `etTensor_std`: For strictly totally disconnected `X`, the tensor product on `D_ét(X, Λ)` is the derived tensor product of sheaves of `Λ`-modules on `|X|`.
- `etTensor_lower_shriek`: For `X` strictly totally disconnected, `U ⊂ |X|` quasicompact open and `Λ_U^! ∈ D(|X|, Λ) = D_ét(X, Λ)` the extension by zero of `Λ_U` on the space `|X|: Λ_U^! ⊗^L B` is the extension by zero of `B|_U`, for every `B ∈ D_ét(X, Λ)`.
- `etTensor_not_closed_v_hom`: The `v`-internal Hom of two objects of `D_ét(Y, Λ)` need not lie in `D_ét(Y, Λ)`; internal Hom on `D_ét` requires `R_Yét` (target C3.9).

*Needs:* `C3.7`; `C2.3`; `C2.12`; `C0.24`.

(ECD Lemma 17.7, p. 100; ECD after Lemma 17.7, p. 100.)

#### C3.9 Internal Hom on `D_ét`

For any small `v`-stack `Y` and `A ∈ D_ét(Y, Λ), B ↦ B ⊗^L_Λ A` on `D_ét(Y, Λ)` has a right adjoint `C ↦ RHom_Λ(A, C)`, i.e. `Hom(B ⊗^L A, C) = Hom(B, RHom_Λ(A, C))`; for varying `A` these assemble into `RHom_Λ(−, −) : D_ét(Y, Λ)^op × D_ét(Y, Λ) → D_ét(Y, Λ)`. Construct this adjoint intrinsically in the fixed presentable category `𝒟_ét(Y,Λ)`. At each adequate cutoff `κ`, let `iκ:𝒟_ét(Y,Λ)→𝒟(Y_v,κ,Λ)` be the inclusion and `R_Yét,κ` its right adjoint. Then `RHom_Λ(A,C) ≃ R_Yét,κ(RHom_{v,κ}(iκ A,iκ C))`. These coreflected objects agree coherently for all adequate cutoffs because they represent `B↦Map(B⊗^L A,C)` on the same étale category. This does not assert that the ambient internal Homs agree under enlargement.

Require the following API.

- `etHom`: The bifunctor `RHom_Λ(−, −)` on `𝒟_ét(Y, Λ)` making it closed symmetric monoidal.
- `etHom.adj`: `Hom(B ⊗^L A, C) ≅ Hom(B, RHom_Λ(A, C))` naturally in `A, B, C`.
- `etHom.eq_coreflection`: For every adequate `κ, RHom_Λ(A,C) ≃ R_Yét,κ(RHom_{v,κ}(iκ A,iκ C))`, naturally in `A,C` and coherently under cutoff enlargement; after coreflection the ambient comparison of C3.7 induces this equivalence.
- `etHom.globalSections`: `RΓ(Y, RHom_Λ(A, C))` computes `RHom_{D_ét(Y,Λ)}(A, C)`.
- `etHom.pull_map`: `A` natural map `f^∗RHom_Λ(A, C) → RHom_Λ(f^∗A, f^∗C)`, adjoint to `f^∗` monoidality; that it is an isomorphism for étale `f` is an API item of C5.1 (it needs the projection formula for `f_!`).
- `etHom.dual`: The dual `A^∨ = RHom_Λ(A, Λ_Y)`; for dualizable `A, RHom_Λ(A, C) ≅ A^∨ ⊗^L C`.

**Checks.**

- `etHom_unit`: `RHom_Λ(Λ_Y, C) ≅ C`.
- For the large free module `A=⊕_I 𝔽_ℓ` at `Y=Spa(C,O_C)` in C3.7, coreflection at either adequate cutoff gives the constant étale object with value `∏_I 𝔽_ℓ`. Thus the intrinsic comparison is an equivalence even though the ambient comparison is not.
- `etHom_point`: For `Y = Spa(C, O_C)`, under `D_ét(Y, Λ) ≃ D(Λ), RHom_Λ` is the derived Hom of complexes of `Λ`-modules.
- `etHom_std_compat`: For strictly totally disconnected `X, U ⊂ |X|` quasicompact open with inclusion `j` and `Λ_U^!` the extension by zero of `Λ_U` on the space `|X|, RHom_Λ(Λ_U^!, C) ≅ Rj_∗j^∗C`, as for sheaves of `Λ`-modules on `|X|`.
- `etHom_not_v_hom`: For `Y = Spa(C, O_C), Λ = ℤ` and `A = ⊕_{n∈N} ℤ`, the `v`-internal `Hom Hom(A, ℤ)` is the sheaf `S ↦ C(S, ℤ^N)` with `ℤ^N` carrying the product topology, which is not in `D_ét(Y, ℤ)`; the étale internal `Hom RHom_Λ(A, ℤ)` is the constant sheaf with value `ℤ^N`.

*Needs:* `C3.8`; `C2.13`; `C2.12`; `EnhancedDerivedSheaves`, Layer E3; `CategoryTheory.MonoidalClosed`; `C3.7`.

(ECD Lemma 17.8, p. 100; ECD after Lemma 17.8, p. 100.)

#### C3.10 Pushforward and internal Hom

Let `f : Y′ → Y` be a map of small `v`-stacks. There is a natural equivalence `Rf∗RHom_Λ(f^∗A, B) ≅ RHom_Λ(A, Rf∗B)` of functors `D_ét(Y, Λ)^op × D_ét(Y′, Λ) → D_ét(Y, Λ)`.

*Needs:* `C3.9`; `C3.2`; `C3.8`.

(ECD Corollary 17.9, p. 100; ECD proof of Corollary 17.9, p. 101.)

#### C3.11 Change of coefficient ring on `D_ét`

Let `φ : Λ → Λ′` be a map of commutative rings and `Y` a small `v`-stack. Restriction of scalars `φ_∗ : D(Y_v, Λ′) → D(Y_v, Λ)` and extension of scalars `φ^∗ = Λ′ ⊗^L_Λ − : D(Y_v, Λ) → D(Y_v, Λ′)` preserve the étale subcategories, giving `φ^∗ ⊣ φ_∗` on `D_ét`. Both commute with pullback `f^∗`; `φ_∗` commutes with `Rf∗`; `φ^∗` is symmetric monoidal; and `Rf∗φ_∗ ≅ φ_∗Rf∗`. For `Λ → Λ/I` and `Λ/Iⁿ → Λ/I^m` these give the reduction functors.

Require the following API.

- `restrictScalars`: `φ_∗ : D_ét(Y, Λ′) → D_ét(Y, Λ)`.
- `extendScalars`: `φ^∗ = Λ′ ⊗^L_Λ − : D_ét(Y, Λ) → D_ét(Y, Λ′)`, left adjoint to `φ_∗`.
- `restrictScalars_pull`: `φ_∗ ∘ f^∗ ≅ f^∗ ∘ φ_∗`.
- `restrictScalars_push`: `φ_∗ ∘ Rf∗ ≅ Rf∗ ∘ φ_∗`.
- `extendScalars_pull`: `φ^∗ ∘ f^∗ ≅ f^∗ ∘ φ^∗`, symmetric monoidally.
- `changeOfCoefficients_comp`: `(ψ ∘ φ)_∗ ≅ φ_∗ ∘ ψ_∗` and `(ψ ∘ φ)^∗ ≅ ψ^∗ ∘ φ^∗`.

**Checks.**

- `restrictScalars_id`: For `φ = id, φ_∗ ≅ 𝟭` and `φ^∗ ≅ 𝟭`.
- `extendScalars_reduction`: For `Λ = ℤ/ℓ² → Λ′ = ℤ/ℓ` and the constant sheaf `Λ, φ^∗Λ = Λ′` and `φ_∗φ^∗Λ` is the constant sheaf `ℤ/ℓ` viewed as a `ℤ/ℓ²`-module.
- `changeOfCoefficients_point`: For `Y = Spa(C, O_C)`, under `D_ét ≃ D(Λ)` these are the restriction and derived extension of scalars of Mathlib's module categories.
- `extendScalars_not_underived`: For `ℤ → ℤ/p` and the constant sheaf `ℤ/p, φ^∗(ℤ/p) = ℤ/p ⊗^L_Z ℤ/p` has `H⁻¹ ≠ 0`, so the underived extension of scalars is not the right functor.

*Needs:* `EnhancedDerivedSheaves`, §E1.4 (`enhancedCoeffChange`, `enhancedPullback`, `enhancedPushforward`), specialized to the identity on the underlying topos and the constant ring map `Λ→Λ′`; `C2.2` for preservation of étale complexes; `C3.1`; `C3.2`; `C3.8`; `C2.13`; `ModuleCat`.

([Stacks 06YY](https://stacks.math.columbia.edu/tag/06YY), Lemma 21.18.2;
[Stacks 0D6D](https://stacks.math.columbia.edu/tag/0D6D), Lemma 21.18.3;
[Stacks 07A4](https://stacks.math.columbia.edu/tag/07A4), Lemma 21.18.4,
together with `EnhancedDerivedSheaves` §E1.4 for enhanced adjunctions and coherent comparisons.)

### Examples

For `g:Z→Y` and `f:Y→X`, pullback sends `A` on `X` first to `f*A` on `Y` and then to `g*f*A` on `Z`. Hence `(f∘g)*=g*∘f*`. Over `Λ=ℤ`, the constant complex `ℤ/q⊗ᴸℤ/q` has `ℤ/q` in degrees `0` and `−1` for a prime `q`, witnessed by the resolution `[ℤ --q→ ℤ]` in degrees `−1,0`. (ECD §17, pp. 98–100.)

### Dependencies

Layers C0–C2; `EnhancedDerivedSheaves`, Layers E1–E3. The tensor and symmetric-monoidal clauses use commutative coefficient rings.

<a id="c4"></a>

## Layer C4: Proper maps and canonical compactification

Use the properness predicate and basic API of `DiamondsAndVStacks` §D4.11, prove the valuative refinements and construct the partially proper envelope. Distinguish a space being quasicompact from its structure map to the terminal `v`-stack being quasicompact, and distinguish the envelope being a diamond from it being spatial.

### Properness and partial properness

#### C4.1 Proper maps of `v`-stacks

Import and re-export the properness predicate and basic API from `DiamondsAndVStacks` §D4.11. For a map `f : Y′ → Y` of `v`-stacks, this predicate means quasicompact, separated and universally closed: for every small `v`-sheaf `X` with a map `X → Y`, the map `|Y′ ×_Y X| → |X|` is closed. Since `f` is quasicompact, `Y′ ×_Y X` is a small `v`-sheaf for small `X`, and it suffices to test universal closedness on perfectoid `X`, or even on strictly totally disconnected perfectoid `X`. Every properness conclusion in C4 uses this imported predicate.

Expose the supplied predicate and basic API under the following names.

- `IsProper`: The properness predicate of `DiamondsAndVStacks` §D4.11.
- `IsProper.iff_std`: `f` is proper iff it is quasicompact and separated and `|Y′ ×_Y X| → |X|` is closed for every strictly totally disconnected perfectoid `X → Y`.
- `IsProper.comp`: Composites of proper maps are proper.
- `IsProper.baseChange`: Proper maps are stable under arbitrary base change of `v`-stacks.
- `IsProper.iff_valuative`: D4.11's criterion: `f` is proper iff `0`-truncated, qcqs and the `(K, K⁺)` valuative criterion holds (re-exported in C4.4).
- `IsProper.isClosedMap`: For proper `f` between small `v`-sheaves, `|f| : |Y′| → |Y|` is closed.
- `IsUniversallyClosed`: The universal-closedness condition in D4.11: for every small `v`-sheaf `X → Y, |Y′ ×_Y X| → |X|` is closed; it suffices to test strictly totally disconnected `X`.
- `IsProper.iff`: `IsProper f ↔ f` quasicompact `∧` separated `∧ IsUniversallyClosed f`.
- `IsUniversallyClosed.comp`: Composites of universally closed maps are universally closed.
- `IsUniversallyClosed.baseChange`: Universally closed maps are stable under base change.
- `IsProper.surjective_of_surjective_points`: `A` proper (indeed quasicompact) map `f` of small `v`-stacks with `|f|` surjective is a surjection of `v`-stacks (ECD Lemma 12.11, D4); a map `Spa(C, C⁺) → Y` lifts after replacing `C` by an extension, not necessarily over the same `C`.

The additional C4 consequences use that same predicate.

- `IsProper.of_comp`: If `g ∘ f` is proper and `g` is separated, then `f` is proper (target C4.7).
- `IsProper.partiallyProper`: Proper maps are partially proper (targets C4.4–C4.5).

**Checks.**

- `isProper_id`: The identity of a `v`-stack is proper.
- `isProper_closedImmersion`: `A` closed immersion of `v`-sheaves is proper (target C4.2).
- `isProper_topological`: For a map of locally compact Hausdorff spaces `T′ → T`, the induced map of `v`-sheaves is proper iff `T′ → T` is a proper map (Mathlib `IsProperMap`), target C4.3.
- `isProper_open_not`: For a rank-two `C⁺ ⊊ O_C`, the open immersion `Spa(C, O_C) → Spa(C, C⁺)` is quasicompact and separated but not proper in D4.11's sense: its image is the nonclosed open point. The square with `top` arrow `id` of `Spa(C, O_C)` and bottom arrow `id` of `Spa(C, C⁺)` has no diagonal lift.
- `isProper_openDisc_not`: The perfectoid open unit disc over `Spa(C, O_C)` is partially proper over `Spa(C, O_C)` but not quasicompact, hence not proper.
- `isUniversallyClosed_not_separated`: For a finite group `G ≠ 1` acting trivially on `X = Spa(C, O_C), [X/G] → X` is quasicompact and universally closed `(|[X/G] ×_X T| = |T|)` but not `0`-truncated, hence not separated and not proper; its valuative lifts exist but form the groupoid BG.

*Needs:* `DiamondsAndVStacks`, §D4.11; `DiamondsAndVStacks`, Layer D3; `DiamondsAndVStacks`, Layer D4; `DiamondsAndVStacks`, Layer D1; `IsClosedMap`; `DiamondsAndVStacks`, Layer D0.

(ECD Definition 18.1, p. 101; ECD after Definition 18.1, p. 101.)

#### C4.2 Closed immersions are proper

Re-export D4.11's theorem that every closed immersion of `v`-sheaves is proper.

*Needs:* `DiamondsAndVStacks`, §D4.11; `DiamondsAndVStacks`, Layer D3; `DiamondsAndVStacks`, Layer D4; `C4.1`.

(ECD Remark 18.2, p. 101.)

#### C4.3 Properness for maps of locally compact Hausdorff spaces

Let `T′ → T` be a continuous map of locally compact Hausdorff spaces and `T̲′ → T̲` the induced map of `v`-sheaves `(X ↦ C(|X|, T))`. Then `T̲′ → T̲` is proper in the sense of Definition 18.1 if and only if `T′ → T` is proper in the usual sense (preimages of compact subsets are compact; equivalently universally closed).

*Needs:* `C4.1`; `DiamondsAndVStacks`, Layer D4; `DiamondsAndVStacks`, Layer D3; `DiamondsAndVStacks`, Layer D5; `IsProperMap`.

(ECD Remark 18.2, p. 101.)

#### C4.4 Valuative criterion of properness

Re-export D4.11's characterization of a proper map `f : Y′ → Y` of `v`-stacks by `0`-truncatedness, quasicompactness, quasiseparatedness and the following unique-extension condition. For every perfectoid field `K` and open bounded valuation subring `K⁺`, a square with `top` arrow `Spa(K, O_K) → Y′` and bottom arrow `Spa(K, K⁺) → Y` has a unique diagonal lift to `Y′`. Prove also the stronger consequence for a proper `f`: the same uniqueness and existence hold with `Spa(R, R°) ⊂ Spa(R, R⁺)`, for perfectoid Tate `R` and open integrally closed `R⁺ ⊂ R°`.

*Needs:* `C4.1`; `DiamondsAndVStacks`, Layer D3; `DiamondsAndVStacks`, Layer D4; `DiamondsAndVStacks`, Layer D0; `DiamondsAndVStacks`, Layer D1; `DiamondsAndVStacks`, Layer D5.

(ECD Proposition 18.3, p. 101.)

#### C4.5 Partially proper maps of `v`-stacks

Define partial properness of `f : Y′ → Y` by separatedness together with extension of every compatible map `Spa(R, R°) → Y′` to `Spa(R, R⁺) → Y′` over `Y`, for perfectoid Tate `R` and open integrally closed `R⁺ ⊂ R°`. Separatedness makes the extension unique. Equivalently require `0`-truncatedness, quasiseparatedness and existence of a unique extension in every such square. For a `v`-stack `Y`, partial properness means this condition for `Y → ∗`. Existence without uniqueness fails: gluing two copies of `Spa(C, C⁺)` along a quasicompact open containing the rank-one point gives a nonseparated map with extensions.

Require the following API.

- `IsPartiallyProper`: The predicate on maps of `v`-stacks: separated and the `(R, R⁺)` lifting property, for perfectoid Tate `R` with open integrally closed `R⁺ ⊂ R°`.
- `IsPartiallyProper.iff_qs`: `f` is partially proper iff `f` is `0`-truncated, quasiseparated, and every `(R, R⁺)`-square has a unique lift.
- `IsPartiallyProper.comp`: Composites of partially proper maps are partially proper.
- `IsPartiallyProper.baseChange`: Partially proper maps are stable under base change.
- `IsPartiallyProper.of_isProper`: Proper maps are partially proper.
- `isProper_iff_partiallyProper_qc`: `f` is proper iff it is partially proper and quasicompact (target C4.6).
- `IsPartiallyProperStack`: `A v`-stack `Y` is partially proper iff `Y → ∗` is.

**Checks.**

- `isPartiallyProper_id`: Identities are partially proper.
- `isPartiallyProper_point_residue`: For `C` algebraically closed, `Spa(C, O_C) → ∗` is partially proper iff the residue field of `C` is algebraic over `𝔽_p` (by target C4.9, `Spa(C, O_C)‾ = Spa(C, (O_C)′)` with `(O_C)′` the integral closure of `𝔽_p + m_C`).
- `isPartiallyProper_openDisc`: The perfectoid open unit disc over `Spa(C, O_C)` is partially proper over `Spa(C, O_C)`.
- `isPartiallyProper_closedDisc_not`: The perfectoid closed unit disc `Spa`(`C`⟨`T^{1/p^∞}`⟩, `O_C`⟨`T^{1/p^∞}`⟩) over `Spa(C, O_C)` is quasicompact and separated but not partially proper: it misses the rank-two points at the boundary that its canonical compactification adds.
- `isPartiallyProper_glued_not`: For `C⁺ ⊊ O_C, a ∈ O_C ∖ C⁺` and `U = {|a| ≤ 1} ⊂ X = Spa(C, C⁺)`, the space `Y′` obtained by gluing two copies of `X` along `U` maps to `X` by a `0`-truncated quasiseparated map with lifts for all `(R, R⁺)`-squares, which is not partially proper: the `(C, C⁺)`-square at the rank-one point has two lifts, so `Y′ → X` is not separated.

*Needs:* `DiamondsAndVStacks`, Layer D3; `PerfectoidSpaces`, Layer P4.

(ECD Definition 18.4, p. 103; ECD Remark 18.5, p. 103.)

#### C4.6 Proper is partially proper plus quasicompact

A map `f : Y′ → Y` of `v`-stacks is proper if and only if it is partially proper and quasicompact.

*Needs:* `C4.4`; `C4.5`.

(ECD Remark 18.5, p. 103.)

#### C4.7 Stability of proper and partially proper maps

Re-export D4.11's stability of proper maps under composition and arbitrary base change, and prove the corresponding statements for partially proper maps. If `g ∘ f` is proper (resp. partially proper) and `g` is separated, then `f` is proper (resp. partially proper). In particular a fibre product of two proper maps to `X` is proper over `X`.

*Needs:* `C4.1`; `C4.5`; `C4.2`; `DiamondsAndVStacks`, Layer D3.

(ECD proof of Theorem 19.2, p. 109.)

### Absolute partially proper envelopes

#### C4.8 The partially proper envelope `Ȳ` of a separated `v`-sheaf

For a separated `v`-sheaf `Y, Ȳ` is the `v`-sheaf with `Ȳ(R, R⁺) = Y(R, R°)` for totally disconnected `Spa(R, R⁺)`; it comes with an injective map `Y → Ȳ`.

Require the following API.

- `cpt`: The `v`-sheaf `Ȳ` with `Ȳ(R, R⁺) = Y(R, R°)` on totally disconnected `Spa(R, R⁺)`.
- `toCpt`: The injection `Y → Ȳ`.
- `cpt.map`: A map `Y′ → Y` of separated `v`-sheaves induces `Ȳ′ → Ȳ`, functorially.
- `cpt.affinoid`: For `Y = Spa(R, R⁺)` affinoid perfectoid, `Ȳ = Spa(R, (R⁺)′)` (target C4.9).
- `cpt.lift`: Every map from `Y` to a partially proper `v`-sheaf extends uniquely along `Y → Ȳ` (from C4.10 and C4.14).

**Checks.**

- `cpt_affinoid`: For `Y = Spa(R, R⁺), Ȳ = Spa(R, (R⁺)′)` with `(R⁺)′` the integral closure of `𝔽_p + R°°`.
- `cpt_of_partiallyProper`: If `Y` is partially proper (over `∗`), `Y → Ȳ` is an isomorphism.
- `cpt_point`: For `C` algebraically closed with residue field not algebraic over `𝔽_p, Spa(C, O_C)‾ = Spa(C, (O_C)′) ≠ Spa(C, O_C)`.
- `cpt_spatial_not_claimed`: For a separated diamond `Y, Ȳ` is a diamond (target C4.12); for a spatial diamond `Y, Ȳ` is quasicompact and quasiseparated and `Y → Ȳ` is a quasicompact injection. Whether `Ȳ` is spatial is open (ECD p. 130) and is not asserted.
- `cpt_point_not_open`: For `C` algebraically closed with residue field `k` transcendental over `𝔽_p, Spa(C, O_C) → Spa(C, (O_C)′)` is a quasicompact injection whose image, the rank-one point, is not open (any finitely many elements of `k` lie in a proper valuation ring of `k` containing the algebraic closure of `𝔽_p` in `k`); so `Y → Ȳ` is not an open immersion in general.

*Needs:* `DiamondsAndVStacks`, Layer D1; `DiamondsAndVStacks`, Layer D3; `PerfectoidSpaces`, Layer P4.

(ECD after Proposition 18.6, p. 104.)

#### C4.9 The envelope of an affinoid perfectoid space

If `Y = Spa(R, R⁺)` is an affinoid perfectoid space, then `Ȳ = Spa(R, (R⁺)′)`, where `(R⁺)′ ⊂ R⁺` is the smallest open and integrally closed subring of `R`, namely the integral closure of `𝔽_p + R°°`. Relative form: for a map `Spa(R, R⁺) → X = Spa(A, A⁺)` of affinoid perfectoid spaces (in particular for `X` strictly totally disconnected), the canonical compactification is `Spa(R, R⁺_X)`, where `R⁺_X` is the integral closure in `R` of (the image of `A⁺`) `+ R°°`; it is affinoid perfectoid. For `X = Spa(C, C⁺)` and `X′ = Spa(C′, C′⁺)` with `C` algebraically closed, `R⁺_X = C⁺ + C′°°`.

*Needs:* `C4.8`; `C4.13`; `DiamondsAndVStacks`, Layer D1.

(ECD Proposition 18.7(iv), p. 104; ECD proof of Proposition 18.7, p. 105.)

#### C4.10 The envelope commutes with limits and preserves surjections

Let `Y` be a separated `v`-sheaf. The functor `Y ↦ Ȳ` commutes with all limits, and if `f : Y′ → Y` is a surjective map of separated `v`-sheaves, then `f̄ : Ȳ′ → Ȳ` is a surjective map of `v`-sheaves.

*Needs:* `C4.8`; `DiamondsAndVStacks`, Layer D1.

(ECD Proposition 18.7(v),(vi), p. 104; ECD proof of Proposition 18.7, p. 105.)

#### C4.11 The envelope is partially proper, and envelopes of quasicompact maps are proper

Let `Y` be a separated `v`-sheaf. Then `Ȳ` is partially proper, and if `f : Y′ → Y` is a quasicompact map of separated `v`-sheaves, then `f̄ : Ȳ′ → Ȳ` is proper.

*Needs:* `C4.9`; `C4.10`; `C4.5`; `C4.6`; `C4.7`.

(ECD Proposition 18.7(i), p. 104; ECD Proposition 18.7(vii), p. 105.)

#### C4.12 The envelope of a small `v`-sheaf, of a diamond and of a quasi-pro-étale map

Let `Y` be a separated `v`-sheaf. If `Y` is a small `v`-sheaf, so is `Ȳ`; if `Y` is a diamond, so is `Ȳ`; and if `f : Y′ → Y` is a quasi-pro-étale map of separated `v`-sheaves, then `f̄ : Ȳ′ → Ȳ` is quasi-pro-étale. Spatiality is not asserted.

*Needs:* `C4.9`; `C4.10`; `DiamondsAndVStacks`, Layer D1; `DiamondsAndVStacks`, Layer D4.

(ECD Proposition 18.7(ii),(iii), p. 104; ECD proof of Proposition 18.7, p. 105.)

### Relative canonical compactification

#### C4.13 The canonical compactification of a separated map of `v`-stacks

Let `f : Y′ → Y` be a separated map of `v`-stacks. The functor on totally disconnected perfectoid spaces `X = Spa(R, R⁺)` over `Y, X ↦ Y′(R, R°) ×_{Y(R,R°)} Y(R, R⁺)`, extends to a `v`-stack `Ȳ′^{/Y}` with a map `f̄^{/Y} : Ȳ′^{/Y} → Y` and a natural map `Y′ → Ȳ′^{/Y}` over `Y`. Its formation is functorial in `f` and commutes with base change in `Y`; for separated `Y, Ȳ′^{/Y} = Ȳ′ ×_Ȳ Y`.

Require the following API.

- `canonicalCompactification`: The `v`-stack `Ȳ′^{/Y}` over `Y` attached to a separated `f : Y′ → Y`.
- `canonicalCompactification.toCpt`: The map `Y′ → Ȳ′^{/Y}` over `Y`.
- `canonicalCompactification.fac`: `f̄^{/Y} ∘ (Y′ → Ȳ′^{/Y}) = f`.
- `canonicalCompactification.partiallyProper`: `f̄^{/Y}` is partially proper (target C4.14).
- `canonicalCompactification.lift`: For partially proper `g : Z → Y`, every `Y`-map `Y′ → Z` extends uniquely to `Ȳ′^{/Y} → Z`.
- `canonicalCompactification.baseChange`: For `Ỹ → Y`, the canonical compactification of `Y′ ×_Y Ỹ → Ỹ` is `Ȳ′^{/Y} ×_Y Ỹ`.
- `canonicalCompactification.map`: A map `Y′_2 → Y′_1` of separated `Y`-stacks induces `Ȳ′_2^{/Y} → Ȳ′_1^{/Y}`, functorially.
- `canonicalCompactification.of_partiallyProper`: If `f` is partially proper then `Y′ → Ȳ′^{/Y}` is an isomorphism.
- `cpt.relative_eq`: `Ȳ′^{/Y} = Ȳ′ ×_Ȳ Y` for a map `Y′ → Y` of separated `v`-sheaves (ECD p. 104).
- `canonicalCompactification.toCpt_injective`: `Y′ → Ȳ′^{/Y}` is an injection of `v`-stacks over `Y` (ECD 10.10); it is not in general an open immersion (test `cpt_point_not_open`).

**Checks.**

- `canonicalCompactification_id`: For `f = id_Y, Ȳ^{/Y} = Y`.
- `canonicalCompactification_field`: For `X = Spa(C, C⁺)` with `C` algebraically closed and connected strictly totally disconnected `X′ = Spa(C′, C′⁺)` over `X, X̄′^{/X} = Spa(C′, C⁺ + C′°°)`.
- `canonicalCompactification_affinoid`: For `X′ = Spa(R, R⁺)` over `X = Spa(A, A⁺)` affinoid perfectoid, `X̄′^{/X} = Spa(R, R⁺_X)` with `R⁺_X` the integral closure of the image of `A⁺` plus `R°°`.
- `canonicalCompactification_closedDisc`: For the perfectoid closed unit disc `D` over `Spa(C, O_C), D → D̄^{/Spa(C,O_C)}` is not an isomorphism (`D` is not partially proper), though it is an open immersion; the same map need not be an open immersion for general separated `f`.

*Needs:* `C4.8`; `DiamondsAndVStacks`, Layer D1; `DiamondsAndVStacks`, Layer D3; `DiamondsAndVStacks`, Layer D4.

(ECD Proposition 18.6, p. 103; ECD after Proposition 18.6, p. 103.)

#### C4.14 Partial properness and universal property of the canonical compactification

In the situation of target C4.13, `f̄^{/Y} : Ȳ′^{/Y} → Y` is partially proper, and for every partially proper map `g : Z → Y` of `v`-stacks, composition with `Y′ → Ȳ′^{/Y}` induces a bijection `Hom_Y(Ȳ′^{/Y}, Z) → Hom_Y(Y′, Z)`.

*Needs:* `C4.13`; `C4.11`; `C4.5`; `C4.7`.

(ECD Proposition 18.6, p. 103; ECD proof of Proposition 18.6, p. 104.)

#### C4.15 Properties of the relative canonical compactification

Let `Y′ → Y` be a separated map of `v`-stacks. (i) `Ȳ′^{/Y} → Y` is partially proper. (ii) If `Y` and `Y′` are small `v`-stacks, `Ȳ′^{/Y}` is a small `v`-stack. (iii) If `Y` and `Y′` are diamonds, `Ȳ′^{/Y}` is a diamond. (iv) `Y′ ↦ Ȳ′^{/Y}`, from `v`-sheaves over `Y` to `v`-sheaves over `Y`, commutes with all limits. (v) If `f : Y′_2 → Y′_1` is a surjective map of separated `v`-stacks over `Y`, then `f̄^{/Y}` is surjective. (vi) If `f : Y′_2 → Y′_1` is a quasicompact map of separated `v`-stacks over `Y`, then `f̄^{/Y} : Ȳ′_2^{/Y} → Ȳ′_1^{/Y}` is proper. (vii) If `f : Y′_2 → Y′_1` is a quasi-pro-étale map of separated `v`-stacks over `Y`, then `f̄^{/Y}` is quasi-pro-étale.

*Needs:* `C4.13`; `C4.14`; `C4.11`; `C4.12`; `C4.10`; `C4.7`.

(ECD Corollary 18.8, p. 105; ECD proof of Corollary 18.8, p. 106.)

#### C4.16 Images of proper maps in separated targets

Suppose `Z, Y′` and `Y` are `v`-sheaves, with `Z → Y` proper, `f : Y′ → Y` separated and a compatible map `h : Z → Y′` over `Y`. Form the image `Z′` of `h` in the category of sheaves. Prove that `Z′ → Y` is proper and that its inclusion in `Y′` is closed.

*Needs:* `C4.4`; `C4.7`; `DiamondsAndVStacks`, Layer D3.

(ECD proof of Proposition 18.9, p. 106.)

### Colimit and tautness criteria

#### C4.17 Partially proper maps of `v`-sheaves are filtered colimits of proper ones

For `v`-sheaves, a filtered colimit of proper maps to `Y` with closed immersion transition maps is partially proper, allowing a large indexing category. If `Y` is quasiseparated, every partially proper `f : Y′ → Y` has this description: take all closed sub-`v`-sheaves of `Y′` proper over `Y`. This index is small when `Y′` is small. Quasiseparatedness of the target is necessary for the converse. For `C` the completed algebraic closure of `𝔽_p((t)), Spa(C, O_C) → ∗` is partially proper but its structure map is not quasicompact; its only closed sub-`v`-sheaves are the empty sheaf and itself.

In this statement, `Y` quasiseparated for the direction `⇒` (ECD states 18.9 for all `v`-sheaves `Y`; the printed proof needs `Z → Y` quasicompact for affinoid `Z`).

*Needs:* `C4.4`; `C4.16`; `C4.15`; `C4.14`.

(ECD Proposition 18.9, p. 106.)

#### C4.18 Partial properness through tautness for locally spatial sources

For a morphism `f : Y′ → Y` of `v`-sheaves, assume the source is locally spatial and the target spatial. Partial properness is equivalent to two conditions. The space `|Y′|` must be taut: it is quasiseparated and the closure of each quasicompact open is quasicompact. Also, for every perfectoid field `K` and open bounded valuation subring `K⁺`, every compatible pair of maps `Spa(K, O_K) → Y′` and `Spa(K, K⁺) → Y` must admit exactly one extension `Spa(K, K⁺) → Y′` over `Y`.

*Needs:* `C4.17`; `C4.4`; `ClassicalAdicEtaleCohomology`, §3.1; `DiamondsAndVStacks`, Layer D5; `DiamondsAndVStacks`, Layer D0.

(ECD Proposition 18.10, p. 106; ECD after Proposition 18.10, p. 107.)

### Examples

For a nontrivial algebraically closed field extension `C⊆C′`, the canonical compactification of `Spa(C′,C′⁺)` over `Spa(C,C⁺)` is `Spa(C′,C⁺+C′°°)`. The perfectoid closed unit disc acquires boundary refinements in its compactification; it is quasicompact but fails partial properness. (ECD Proposition 18.7(iv), p. 104; proof, p. 105.)

### Dependencies

`DiamondsAndVStacks`, Layers D0–D5; `PerfectoidSpaces`, Layer P4; `ClassicalAdicEtaleCohomology`, §3.1.

<a id="c5"></a>

## Layer C5: Étale extension by zero and proper base change

Construct the left adjoint for an étale map and its base-change law. State proper base change through the open-support exchange map, because an arbitrary complementary closed subset need not be a sub-`v`-stack.

### Extension by zero and the exchange transformation

#### C5.1 Extension by zero `f_!` along étale maps

Let `f : Y′ → Y` be an étale morphism of small `v`-stacks. Then `f^∗ : D_ét(Y, Λ) → D_ét(Y′, Λ)` has a left adjoint `Rf_! : D_ét(Y′, Λ) → D_ét(Y, Λ)`. It commutes with canonical truncations, so it is written `f_!` and is `t`-exact. If `Y` is a perfectoid space, `f_!` is induced by the exact left adjoint of `f^∗` on `Y_ét` (the slice `(Y_ét)_{/Y′}`), and it commutes with base change along maps of perfectoid spaces.

Require the following API.

- `etaleShriek`: For étale `f : Y′ → Y`, the exact functor `f_! : D_ét(Y′, Λ) → D_ét(Y, Λ)` with `f_! ⊣ f^∗`.
- `etaleShriek.tExact`: `f_!` commutes with canonical truncations and with `Hⁱ`.
- `etaleShriek.comp`: For étale `g : Y″ → Y′` and `f : Y′ → Y, (f ∘ g)_! ≅ f_! ∘ g_!`, and `(𝟙 Y)_! ≅ 𝟭`.
- `etaleShriek.sheaf`: On sheaves of `Λ`-modules over a perfectoid `Y, f_!(Λ[h_Z]) ≅ Λ[h_{Z→Y}]` naturally for étale `Z→Y′`. Here `h_Z` is the represented set sheaf and `Λ[h_Z]` is its free `Λ`-module sheaf; the right side uses the composite `Z→Y′→Y`.
- `etaleShriek.projection`: `f_!(A ⊗^L f^∗B) ≅ f_!A ⊗^L B` (projection formula), checked on a hypercover by strictly totally disconnected spaces where it is the projection formula for slices.
- `etaleShriek.homAdj`: `RHom_Λ(f_!A, B) ≅ Rf∗RHom_Λ(A, f^∗B)`.
- `etaleShriek.enhanced`: `f_! : 𝒟_ét(Y′, Λ) → 𝒟_ét(Y, Λ)`, left adjoint of `f^∗`, obtained from the `f_{i!}` on a hypercover by Beck–Chevalley (`EnhancedDerivedSheaves`, §E3.4 (`coherentMate`)); its homotopy-category functor is `etaleShriek`.
- `etHom.pull_map_isIso`: For étale `f`, the natural map `f^∗RHom_Λ(A, C) → RHom_Λ(f^∗A, f^∗C)` of C3.9 (`etHom.pull_map`) is an isomorphism, by the projection formula for `f_!`.

**Checks.**

- `etaleShriek_id`: For `f = 𝟙 Y, f_! ≅ 𝟭`.
- `etaleShriek_disjoint`: For `f : Y ⊔ Y → Y` the fold map, `f_!(A, B) = A ⊕ B`.
- `etaleShriek_stalk`: For an open immersion `j : U ⊂ Y` of locally spatial diamonds and a geometric point `ȳ, (j_!A)_ȳ = A_ȳ` if `y ∈ |U|` and `0` otherwise (classical extension by zero on `Y_ét`).
- `etaleShriek_finite_etale`: For a finite étale map `f` of degree `d` over a geometric point `Spa(C, O_C), f_!Λ = Λ^d`.
- `etaleShriek_not_pushforward`: For `Λ≠0, C⁺ ≠ O_C` of rank `2` and the open immersion `j : Spa(C, O_C) ⊂ Spa(C, C⁺), j_!Λ` has zero stalk at the closed point while `Rj∗Λ` has stalk `Λ`, so `j_! ≠ Rj∗`.

*Needs:* `C3.1`; `C2.10`; `C2.11`; `C0.1`; `C0.19`; `DiamondsAndVStacks`, Layer D3; `C2.5`; `C2.3`; `EnhancedDerivedSheaves`, Layer E3.

(ECD Definition/Proposition 19.1, p. 107; ECD after Definition/Proposition 19.1, p. 107.)

#### C5.2 Base change for extension by zero

In the situation of target C5.1, for every map `g : Ỹ → Y` of small `v`-stacks with pullbacks `f̃ : Ỹ′ = Y′ ×_Y Ỹ → Ỹ` and `g′ : Ỹ′ → Y′`, the natural transformation `Rf̃_!g′^∗ → g^∗Rf_!` of functors `D_ét(Y′, Λ) → D_ét(Ỹ, Λ)`, adjoint to `g′^∗ → g′^∗f^∗Rf_! = f̃^∗g^∗Rf_!`, is an equivalence. Consequently, passing to right adjoints, for an open immersion `j : U ⊂ Y` and any `f : Y′ → Y` with pullback `g : U′ → U, j′ : U′ ⊂ Y′`, the base change map `j^∗Rf∗ → Rg∗j′^∗` is an isomorphism on all of `D_ét(Y′, Λ)`.

*Needs:* `C5.1`; `C3.1`; `EnhancedDerivedSheaves`, Layer E3.

(ECD Definition/Proposition 19.1, p. 107; ECD proof of Definition/Proposition 19.1, p. 108.)

#### C5.3 Extension by zero along open immersions

Let `j : U ⊂ Y` be an open immersion of small `v`-stacks. Then `j^∗j_! ≅ 𝟭` on `D_ét(U, Λ)`, so `j_!` is fully faithful; `j_!` is the classical extension by zero (its stalks vanish at points outside `|U|` for locally spatial `Y`); and for `A ∈ D_ét(Y, Λ)` the `cone C` of the counit `j_!j^∗A → A` satisfies `j^∗C = 0`. The complement `|Y| ∖ |U|` need not underlie a closed sub-`v`-sheaf.

*Needs:* `C5.1`; `C5.2`; `C0.6`.

(ECD Remark 19.3, p. 108; ECD proof of Theorem 19.5(ii), p. 112.)

#### C5.4 The proper base change map `j_!Rg∗ → Rf∗j′_!`

Let `f : Y′ → Y` be a proper morphism of small `v`-stacks and `j : U ⊂ Y` an open immersion, with pullbacks `g : U′ = U ×_Y Y′ → U` and `j′ : U′ ⊂ Y′`. The natural transformation `j_!Rg∗ → Rf∗j′_! : D_ét(U′, Λ) → D_ét(Y, Λ)` is adjoint to `f^∗j_!Rg∗ ≅ j′_!g^∗Rg∗ → j′_!`, using base change for `j_!` and the counit of `g^∗ ⊣ Rg∗`. It is compatible with restriction along open immersions, and with base change in `Y` in the sense of a commuting square with the base-change maps for `Rg∗` and `Rf∗` (which are not isomorphisms in general).

Require the following API.

- `pbcMap`: The transformation `j_! ∘ Rg∗ ⟶ Rf∗ ∘ j′_!` for `f` proper and `j` an open immersion.
- `pbcMap.adjoint`: Its adjoint `f^∗j_!Rg∗ → j′_!` is `j′_!`(counit) composed with the base change isomorphism.
- `pbcMap.restrict`: Restricted to `U` (via `j^∗`) it is the identity of `Rg∗` under `j^∗j_! ≅ 𝟭` and base change for `Rf∗` along `j`.
- `pbcMap.baseChange`: For `h : Ỹ → Y` with pulled-back data, the square formed by `h^∗(pbcMap)`, the `pbcMap` of the pulled-back data, the base-change map `h^∗Rg∗ → Rg̃∗h′^∗` (composed with `j_!` base change) and `h^∗Rf∗ → Rf̃∗h″^∗` (composed with `j′_!` base change) commutes.

**Checks.**

- `pbcMap_U_eq_Y`: If `U = Y`, the transformation is the identity of `Rf∗`.
- `pbcMap_f_id`: If `f = id_Y`, the transformation is the identity of `j_!`.
- `pbcMap_restrict_U`: After applying `j^∗` the transformation becomes the identity `Rg∗ → Rg∗` (base change for `Rf∗` along the open immersion `j`).
- `pbcMap_not_iso_nonproper`: For `Λ≠0` and the non-proper open immersion `f : Spa(C, O_C) ⊂ Spa(C, C⁺)` (`C⁺ ≠ O_C`, rank `2`) and `j = f`, the analogous transformation `j_!Rg∗Λ = j_!Λ → Rf∗j′_!Λ = Rf∗Λ` is not an isomorphism (stalks at the closed point `0` and `Λ`).

*Needs:* `C5.2`; `C3.2`; `C4.1`; `EnhancedDerivedSheaves`, Layer E3.

(ECD Theorem 19.2, p. 108; ECD proof of Theorem 19.2, p. 109.)

### Compactified field points and valuation spaces

#### C5.5 Hypercovers of proper maps by compactified strictly totally disconnected spaces

Let `X = Spa(C, C⁺)` be a geometric point (or any strictly totally disconnected space) and `Y′ → X` proper. There is a `v`-hypercover `Y′_• → Y′` in which each `Y′_i` is the canonical compactification `X̄′_i^{/X}` of a strictly totally disconnected `X′_i → X`; each `Y′_i` is an affinoid perfectoid space proper over `X`, and `RΓ(Y′, B) = R lim_{[i]∈Δ} RΓ(Y′_i, B)` for `B ∈ D_ét(Y′, Λ)`.

*Needs:* `C4.15`; `C4.9`; `C4.14`; `C4.7`; `C2.10`; `EnhancedDerivedSheaves`, Layer E2.

(ECD proof of Theorem 19.2, p. 109.)

#### C5.6 The étale topos of a compactified geometric point is a Zariski–Riemann topos

Let `X = Spa(C, C⁺)` and `X′ = Spa(C′, C′⁺)` be connected strictly totally disconnected (`C, C′` algebraically closed) with `X′ → X`, and `Y′ = X̄′^{/X} = Spa(C′, C′°° + C⁺)`. Then `Y′` has a single rank-one point, every map in `Y′_ét` is a local isomorphism, so `Y′_ét^∼ ≃ |Y′|^∼`; and with `K′, K` the residue fields of `C′, C` and `V = C⁺/C°° ⊂ K, |Y′| ≅ |Spa(K′, V)|`, the space of valuation rings of `K′` containing `V`. This is compatible with `|X| ≅ |Spa(K, V)|` under `V′ ↦ V′ ∩ K`, so the points of `Y′` over the closed point of `X` form `f^{−1}(s)`.

*Needs:* `C4.9`; `C0.1`; `C0.19`; `PerfectoidSpaces`, Layer P3.

(ECD proof of Theorem 19.2, p. 110.)

#### C5.7 Acyclicity of relative Zariski–Riemann spaces away from the special fibre

Prove `zariskiRiemannAcyclicity`. Let `K ⊂ K′` be algebraically closed fields and `V ⊂ K` a valuation ring. Let `T′ = Spa(K′, V)` be the spectral space of valuation rings `V′ ⊂ K′` containing `V, T = Spa(K, V), f : T′ → T, V′ ↦ V′ ∩ K`, and `s ∈ T` the closed point. If `F` is a sheaf of torsion abelian groups on `T′` with `F_{x′} = 0` for all `x′ ∈ f^{−1}(s)`, then `RΓ(T′, F) = 0`.

Use the supplied spectrum `TauCeti.ValuationSpectrum.spa` of the discrete field `K′` with
plus subring `V.toSubring.map(ι)`. Prove `valuationSpace.valuationSubringEquiv`: its points
identify with the valuation subrings `W⊆K′` satisfying `V≤W.comap(ι)`. The supplied subspace
topology then agrees with the topology generated by the sets {`W` | `a∈W`}, `a∈K′`.
This is a comparison of existing carriers, required before identifying the geometric
valuation space with `T′`. Membership in an overring is the specialization convention.
Use `Valuation.valuationSubring` and `Valuation.isEquiv_iff_valuationSubring` for this dictionary.
(ECD Lemma 19.4 and proof, p. 110.)

Require `valuationSpace.restrict` `(W↦W∩K)`, `valuationSpace.mem_basicOpen` (`W` lies in the
a-open exactly when `a∈W`), `valuationSpace.restrict_preimage` (the inverse image of the a-open
is the `ι(a)`-open), and `valuationSpace.restrict_comp` (restriction along a tower is the
composite restriction).

**Checks.**

- For `K′=K` and `V=K`, the space has one point, the valuation ring `K`.
- For `V=K`, every valuation in the relative space restricts to `K` on the base, so the restriction map is constant.
- If `V⊊K`, the valuation ring `V` belongs to the identity-extension space and differs from its generic point `K`; a one-point definition fails.

*Needs:* `ClassicalAdicEtaleCohomology`, §§2.1–2.5; `ClassicalAdicEtaleCohomology`, §§6.1–6.3; `DiamondsAndVStacks`, Layer D0; `SchemeAndStackFoundations`, §2.15; `EtaleCohomologyFoundations`, §F.2.1.

(ECD Lemma 19.4, p. 110; ECD proof of Lemma 19.4, p. 110.)

### Bounded and unbounded proper base change

#### C5.8 Proper base change for diamonds on `D⁺`

Let `f : Y′ → Y` be a proper morphism of small `v`-stacks and `j : U ⊂ Y` an open immersion, with `g : U′ = U ×_Y Y′ → U` and `j′ : U′ ⊂ Y′`. If `f` is quasi-pro-étale or `nΛ = 0` for some `n` prime to `p`, then `j_!Rg∗A → Rf∗j′_!A` is an isomorphism for every `A ∈ D⁺_ét(U′, Λ)`.

*Needs:* `C5.4`; `C3.5`; `C2.8`; `C5.2`; `C0.7`; `DiamondsAndVStacks`, Layer D1; `PerfectoidSpaces`, Layer P6; `C4.1`; `C5.5`; `C5.6`; `C5.7`; `DiamondsAndVStacks`, Layer D0; `C0.19`; `C0.18`; `C3.3`; `C2.10`.

(ECD Theorem 19.2, p. 108; ECD proof of Theorem 19.2, p. 109.)

#### C5.9 Proper base change under finite cohomological dimension

In the situation of target C5.8, assume moreover that `f` is quasi-pro-étale or `nΛ = 0` for some `n` prime to `p`, and that `Rf∗` has finite cohomological dimension: there is `N` with `R^if∗A = 0` for `i > N` for all `A ∈ D_ét(Y′, Λ)` concentrated in degree `0`. Then `j_!Rg∗A → Rf∗j′_!A` is an isomorphism for all `A ∈ D_ét(U′, Λ)`.

*Needs:* `C5.8`; `C2.6`; `C2.4`; `EnhancedDerivedSheaves`, Layer E2; `C0.21`; `C5.2`.

(ECD Theorem 19.2, p. 108; ECD proof of Theorem 19.2, p. 109.)

### Examples

In a rank-two field pair with `j:Spa(C,O_C)→Spa(C,C⁺), j!Λ` has closed stalk zero whereas `Rj*Λ` has closed stalk `Λ`. For the fold `Y⊔Y→Y`, extension by zero adds the two input objects. These computations fix the direction and support convention of the left adjoint. (ECD Definition/Proposition 19.1, p. 107.)

### Dependencies

Layers C0–C4; `EnhancedDerivedSheaves`, Layers E2–E3; `ClassicalAdicEtaleCohomology`, §§2.1–2.5 and 6.1–6.3; `SchemeAndStackFoundations`, §2.15; `EtaleCohomologyFoundations`, §F.2.1.

<a id="c6"></a>

## Layer C6: Algebraically closed base-field invariance

Prove full faithfulness for the three algebraically closed field extensions with prime-to-`p` torsion coefficients. The annulus argument joins the discrete and complete settings; cohomology and connectedness follow.

### Complete-to-complete extension

#### C6.1 Invariance under extension of algebraically closed nonarchimedean base fields

Let `Y` be a small `v`-stack over `Spa(C, C⁺)`, with `C` an algebraically closed complete nonarchimedean field and `C⁺ ⊂ C` an open and bounded valuation subring; let `C′/C` be an extension of algebraically closed complete nonarchimedean fields and `C′⁺ ⊂ C′` an open and bounded valuation subring containing `C⁺` such that `Spa(C′, C′⁺) → Spa(C, C⁺)` is surjective, and `Y′ = Y ×_{Spa(C,C⁺)} Spa(C′, C′⁺)`. If `nΛ = 0` for some `n` prime to `p`, then pullback `D_ét(Y, Λ) → D_ét(Y′, Λ)` is fully faithful.

*Needs:* `C3.5`; `C1.5`; `C2.4`; `C3.1`; `C3.2`; `ClassicalAdicEtaleCohomology`, §§7.1–7.2; `C0.10`; `C0.23`.

(ECD Theorem 19.5(iii), p. 111; ECD proof of Theorem 19.5, p. 111.)

### The annulus argument

#### C6.2 Reduction of Theorem 19.5(ii) to annuli and stalks

Let `k` be a discrete algebraically closed field of characteristic `p, C` the completed algebraic closure of `k((t)), Y = Spa(A, A⁺)` strictly totally disconnected over `k` with pseudouniformizer `ϖ`, and `Y′ = Y ×_k Spa(C, C⁺)` (here `C⁺ = O_C`, as `O_C = k + C°°`). Assume `nΛ = 0` for some `n` prime to `p`. Then `Y′` is the increasing union of the affinoid perfectoid annuli `Y′_n = {|t|^n ≤ |ϖ| ≤ |t|^{1/n}} ⊂ Y′`, interleaved with their canonical compactifications `Y′_n ⊂ Ȳ′_n^{/Y} ⊂ Y′_{n+1}` (target C6.3), and `D_ét(Y, Λ) → D_ét(Y′, Λ)` is fully faithful as soon as, for every `n ≥ 1` and every geometric point `Spa(C′, C′⁺) → Y, RΓ(Spa(C′, C′⁺), A) → RΓ(Ȳ′_n^{/Y} ×_Y Spa(C′, C′⁺), f̄_n^∗A)` is an isomorphism for `A ∈ D⁺_ét`.

*Needs:* `C2.11`; `C2.10`; `C2.4`; `C0.7`; `C3.2`; `C3.5`; `PerfectoidSpaces`, Layer P2; `C4.13`.

(ECD proof of Theorem 19.5, p. 111; ECD proof of Theorem 19.5, p. 112.)

#### C6.3 Compactified annuli and the vanishing for extensions by zero

In the situation of target C6.2 (so `C` is the completed algebraic closure of `k((t))` and `C⁺ = O_C`), `f : Y′ = Y ×_k Spa(C, O_C) → Y` is partially proper, and the canonical compactifications `Ȳ′_n^{/Y}` of the annuli `f_n : Y′_n → Y` embed in `Y′` with `Y′_n ⊂ Ȳ′_n^{/Y} ⊂ Y′_{n+1}`; each `f̄_n : Ȳ′_n^{/Y} → Y` is proper. Over a geometric point `Y = Spa(C′, C′⁺)` with closed point `s, U = Y ∖ {s}` and `j : U ⊂ Y`, and with `nΛ = 0` for some `n` prime to `p: RΓ(Ȳ′_n^{/Y}, f̄_n^∗j_!A_0) = 0 = RΓ(Y, j_!A_0)` for every `A_0 ∈ D⁺_ét(U, Λ)`, and `RΓ(Ȳ′_n^{/Y}, 𝔽_ℓ) = RΓ(Y′_n, 𝔽_ℓ)` for `ℓ ≠ p`.

In this statement, `nΛ = 0` for some `n` prime to `p` (needed for Theorem 19.2 and Proposition 17.6 on the proper `f̄_n`).

*Needs:* `C4.5`; `C4.13`; `C4.14`; `C4.15`; `C5.8`; `C3.5`; `C0.6`; `C6.4`; `C6.2`; `C1.12`; `C5.3`.

(ECD proof of Theorem 19.5, p. 112.)

#### C6.4 Cohomology of the perfectoid annulus over a geometric point

In the situation of target C6.2 over a geometric point `Spa(C′, C′⁺)`, with `ℓ ≠ p: RΓ(Y′_n, 𝔽_ℓ) = 𝔽_ℓ` (concentrated in degree `0`).

*Needs:* `C0.18`; `ClassicalAdicEtaleCohomology`, §§10.1–10.4.

(ECD proof of Theorem 19.5, p. 112.)

### Discrete bases and consequences

#### C6.5 Invariance from a discrete to a complete algebraically closed base field

Take `k` discrete and algebraically closed of characteristic `p`. For an algebraically closed complete nonarchimedean extension `C/k`, choose an open bounded valuation subring `C⁺ ⊂ C` containing `k`. Given a small `v`-stack `Y` over `k`, set `Y′ = Y ×_k Spa(C, C⁺)`. If `nΛ = 0` for some `n` coprime to `p`, prove that the induced pullback from `D_ét(Y, Λ)` to `D_ét(Y′, Λ)` is fully faithful.

*Needs:* `C6.1`; `C6.2`; `C6.3`; `C6.4`; `C5.3`.

(ECD Theorem 19.5(ii), p. 111; ECD proof of Theorem 19.5, p. 111.)

#### C6.6 Invariance under extension of discrete algebraically closed base fields

Let `Y` be a small `v`-stack over `k`, a discrete algebraically closed field of characteristic `p, k′/k` an extension of discrete algebraically closed fields and `Y′ = Y ×_k k′`. If `nΛ = 0` for some `n` prime to `p`, pullback `D_ét(Y, Λ) → D_ét(Y′, Λ)` is fully faithful.

*Needs:* `C6.5`; `C6.1`; `C3.1`.

(ECD Theorem 19.5(i), p. 111; ECD proof of Theorem 19.5, p. 111.)

#### C6.7 Invariance of étale cohomology and of connected components

In the situation of Theorem 19.5 (i), (ii) or (iii), with `nΛ = 0` for some `n` prime to `p` and `f : Y′ → Y` the projection: for every `A ∈ D_ét(Y, Λ), RΓ(Y, A) → RΓ(Y′, f^∗A)` is an isomorphism; and pullback induces a bijection between open and closed subsets of `|Y|` and of `|Y′|`, so `Y` is connected if and only if `Y′` is.

*Needs:* `C6.1`; `C6.5`; `C6.6`; `C3.2`; `DiamondsAndVStacks`, Layer D4.

(ECD Theorem 19.5, p. 111.)

### Examples

For `k` algebraically closed of characteristic `p` and `C` the completed algebraic closure of `k((t))`, the annulus presentation in C6.2 computes `H⁰=𝔽_ℓ` and `Hⁱ=0` for `i>0` when `ℓ≠p`. The degree-one assertion uses the coordinate transition calculation before the colimit, rather than treating a single ordinary annulus as acyclic. (ECD proof of Theorem 19.5, p. 112.)

### Dependencies

Layers C0–C5; `ClassicalAdicEtaleCohomology`, §§7.1–7.2 and 10.1–10.4; `PerfectoidSpaces`, Layer P2; `DiamondsAndVStacks`, Layer D4.

<a id="c7"></a>

## Layer C7: Constructibility and perfect complexes

Build usable sheaf and complex predicates, their descent and filtration APIs, and continuity in both spaces and coefficient rings. The finite-field criterion is a specialization; arbitrary commutative coefficients retain perfectness and `Tor`-amplitude information.

### Constructible module sheaves

#### C7.1 Constructible sheaves of modules on a spectral space

Let `Λ` be a noetherian ring and `X` a spectral space. A sheaf `F` of `Λ`-modules on `X` is constructible if there is a finite stratification `X = ⊔ S_i` into constructible locally closed subsets `S_i` such that each `F|_{S_i}` is the constant sheaf on `S_i` associated with a finitely generated `Λ`-module. Constructible refers to the constructible subsets of the spectral space (finite Boolean combinations of quasicompact opens).

Write `IsConstFGOn(F,Z)` for the restriction of `F` to `Z` being isomorphic to the constant sheaf
of a finitely generated `Λ`-module. This light predicate is defined for every ring `Λ` and every
topological `X` and subset `Z`, with the subspace topology; spectrality, constructibility of `Z`
and noetherianity of `Λ` enter the stratification theorem, not this restriction predicate.
Require `IsConstFGOn.iff_exists` (the displayed constant-value criterion),
`IsConstFGOn.iso` (invariance under isomorphisms of sheaves), and `IsConstFGOn.restrict`
(constant finitely generated restriction to every further subspace).
(ECD Definition 20.1(i) and Lemma 20.4, p. 113.)

**Checks.**

- The zero sheaf has zero finitely generated value on every subspace, including the empty one.
- A constant finite free sheaf `Λ^n` has that same value on every nonempty subspace.
- On a nonempty space with `Λ≠0`, the constant sheaf of `⊕_ℕΛ` fails this predicate on the whole space, although it is constant.


Use the topological `extendByZero` adapter and its adjunction, exactness and stalk
formulas from the exact supplier contracts above. For noetherian `Λ` and quasicompact
open `U` in spectral `X`, prove its constructibility preservation below; no additional
generic extension functor is introduced. (ECD Lemma 20.4, pp. 113–114.)

Require the following API.

- `IsConstructibleSheaf`: The predicate on sheaves of `Λ`-modules on a spectral space `X`: a finite stratification by constructible locally closed subsets on which `F` is constant with finitely generated value.
- `IsConstructibleSheaf.constant`: The constant sheaf of a finitely generated `Λ`-module is constructible.
- `IsConstructibleSheaf.extendByZero_open`: For a quasicompact open `j : U ⊂ X, j_!` preserves constructibility; for a constructible closed `i : Z ⊂ X, i_∗` preserves it. In the open signature, `hU : IsCompact (U : Set X)` supplies compactness; the spectral structure on `U` follows from its open embedding into spectral `X`.
- `IsConstructibleSheaf.pullback`: Pullback along a spectral map of spectral spaces preserves constructibility.
- `IsConstructibleSheaf.kernel_cokernel_extension`: Constructible sheaves on a spectral space are closed under kernels, cokernels, images, direct summands and extensions (target C7.5).
- `IsConstructibleSheaf.iff_compact`: `F` is constructible iff `Hom(F, −)` commutes with filtered colimits (target C7.5).
- `IsConstructibleSheaf.stalk_fg`: Every stalk of a constructible sheaf is a finitely generated `Λ`-module.

**Checks.**

- The zero sheaf is constructible.
- The constant sheaf `Λ^n` on a spectral space is constructible.
- On a finite `T₀` space (spectral, all subsets constructible) a sheaf is constructible iff all its stalks are finitely generated.
- On a nonempty spectral space, the constant sheaf with value `⊕_{n∈N} Λ (Λ ≠ 0)` is not constructible.
- `isConstructibleSheaf_not_qc_open`: On the Cantor set `X`, a point `x` and `U = X ∖ {x}`, the sheaf `j_!Λ_U (Λ ≠ 0)` is not constructible: `U` is open but not quasicompact, hence not constructible.

*Needs:* `Topology.IsConstructible`; `SpectralSpace`; `TopCat.Sheaf`; `Module.Finite`; `IsNoetherianRing`.

(ECD Lemma 20.4, p. 113; ECD Remark 20.3, p. 113.)

#### C7.2 Constructible étale sheaves on a strictly totally disconnected space

Let `Λ` be noetherian and `X` a strictly totally disconnected perfectoid space; identify étale sheaves on `X` with sheaves on `|X|`. A sheaf of `Λ`-modules on `X_ét` is constructible if there is a stratification of `X` into constructible locally closed subsets `S_i ⊂ |X|` such that `F|_{S_i}` is the constant sheaf on `S_i` associated with a finitely generated `Λ`-module; i.e. if the corresponding sheaf on the spectral space `|X|` is constructible.

Require the following API.

- `IsConstructibleStd`: Constructibility of a sheaf of `Λ`-modules on `X_ét` for strictly totally disconnected `X`.
- `IsConstructibleStd.iff_space`: `F` is constructible iff its image in `Sh(|X|, Λ)` is constructible in the sense of the spectral space `|X|`.
- `IsConstructibleStd.pullback`: Pullback along a map of strictly totally disconnected spaces preserves constructibility.

**Checks.**

- `isConstructibleStd_point`: For `X = Spa(C, O_C), F` is constructible iff `F(X)` is a finitely generated `Λ`-module.
- `isConstructibleStd_chain`: For `X = Spa(C, C⁺)` of rank `2` with open generic point `j, j_!Λ` is constructible (stratification `{η} ⊔ {s}`).
- `isConstructibleStd_profinite`: For `X = Spa(C, O_C) × S` with `S` profinite, constructible sheaves are the sheaves on `S` that are locally constant with finitely generated values on a finite clopen partition.
- `isConstructibleStd_not`: For `X = Spa(C, O_C) × S` with `S` infinite profinite and `s ∈ S` a non-isolated point, the skyscraper sheaf `i_{s∗}Λ (Λ ≠ 0)` at `{s} × Spa(C, O_C)` is not constructible: `{s}` is closed but not constructible (the constructible subsets of `|X| = S` are the clopen ones), although all stalks are finitely generated.

*Needs:* `C7.1`; `C0.19`; `DiamondsAndVStacks`, Layer D1.

(ECD Definition 20.1(i), p. 113; ECD Remark 20.2, p. 113.)

#### C7.3 Constructible sheaves on a small `v`-stack

Let `Λ` be noetherian, `Y` a small `v`-stack and `F` a small sheaf of `Λ`-modules on `Y_v`. `F` is constructible if `F[0] ∈ D_ét(Y, Λ)` and, for every strictly totally disconnected perfectoid space `f : X → Y`, the pullback `f^∗F` is constructible on `X` (target C7.2). `Cons(Y, Λ)` denotes the category of constructible sheaves.

Require the following API.

- `IsConstructible`: Constructibility of a small sheaf of `Λ`-modules on `Y_v`, for a small `v`-stack `Y` and noetherian `Λ`.
- `IsConstructible.iff_cover`: For a surjection `X → Y` from a strictly totally disconnected space, `F` is constructible iff `F ∈ D_ét(Y, Λ)` and its pullback to `X` is constructible (target C7.6).
- `IsConstructible.pullback`: For any map `g : Y′ → Y` of small `v`-stacks, `g^∗` preserves constructibility.
- `Cons`: The full abelian subcategory `Cons(Y, Λ)` of constructible sheaves (target C7.4).
- `IsConstructible.iff_compact_spatial`: For a spatial diamond `Y, F` is constructible iff `F` is compact among étale sheaves of `Λ`-modules (target C7.7).
- `IsConstructible.etaleShriek`: For a quasicompact separated étale `j : U → Y` and a constructible sheaf `G` on `U, j_!G` is constructible (C5 extension by zero, target C7.11).
- `IsConstructible.stalk_fg`: For a locally spatial diamond `Y`, every geometric stalk of a constructible sheaf is a finitely generated `Λ`-module.

**Checks.**

- `isConstructible_constant`: The constant sheaf `Λ_Y` on any small `v`-stack is constructible.
- `isConstructible_zero`: The zero sheaf is constructible.
- `isConstructible_std_compat`: For strictly totally disconnected `X` the notion agrees with target C7.2.
- `isConstructible_open_disc`: For the closed perfectoid unit disc `D` over `Spa(C, O_C)`, a classical point `x (T = 0), Λ ≠ 0` and `U = D ∖ {x}`, which is open but not quasicompact (the increasing union of the rational opens `{|T| ≥ |ϖ|^n}`, for a pseudouniformizer `ϖ` with `0 < |ϖ| < 1`), `j_!Λ_U` is not constructible: its support `U` would be a finite union of constructible strata of the spatial diamond `D`, hence a constructible open, hence quasicompact.
- `isConstructible_v_sheaf_not`: For `Y = Spa(C, O_C)` and `Λ ≠ 0`, the étale sheaf `⊕_{n∈N} Λ_Y` lies in `D_ét(Y, Λ)` but is not constructible (its value is not a finitely generated `Λ`-module).

*Needs:* `C7.2`; `C2.2`; `C3.1`.

(ECD Definition 20.1(ii), p. 113.)

#### C7.4 Constructible sheaves form an abelian category

For noetherian `Λ` and a small `v`-stack `Y`, the class of constructible sheaves on `Y` is stable under kernels, cokernels, images and extensions in the category of small sheaves of `Λ`-modules on `Y_v`; in particular `Cons(Y, Λ)` is an abelian category.

*Needs:* `C7.3`; `C7.1`; `C2.6`; `IsNoetherianRing`; `C7.5`; `C7.2`.

(ECD Remark 20.3, p. 113.)

#### C7.5 Constructible equals compact on a spectral space

Prove `constructibleCompactSpectral`. For a noetherian coefficient ring `Λ` on a spectral space `X`, identify the constructible module sheaves with the finitely presentable objects of the module-sheaf category: `Hom(F, −)` preserves filtered colimits precisely for those `F` admitting the finite stratification in C7.1. Prove in addition that every module sheaf is a filtered colimit of such sheaves.

*Needs:* `C7.1`; `CategoryTheory.IsFinitelyPresentable`; `TopCat.Sheaf`; `DiamondsAndVStacks`, Layer D0.

(ECD Lemma 20.4, p. 113; ECD proof of Lemma 20.4, p. 114.)

#### C7.6 `v`-descent of constructibility

Let `Λ` be noetherian, `f : Ỹ → Y` a surjective map of small `v`-stacks and `F` a small sheaf of `Λ`-modules on `Y_v`. If `f^∗F` is constructible, then `F` is constructible.

*Needs:* `C7.5`; `C7.3`; `C2.3`; `C0.23`.

(ECD Proposition 20.5, p. 114; ECD proof of Proposition 20.5, p. 114.)

#### C7.7 Characterizations of constructible sheaves on spatial diamonds

Work with a spatial diamond `Y`, a noetherian `Λ` and an étale `Λ`-module sheaf `F`. Prove the equivalence of constructibility, finite presentability of `F` in the étale module-sheaf category, and the following stratum condition. There must be a stratification `|Y| = ⋃ S_i` by constructible locally closed subsets such that, for each strictly totally disconnected `f : X → Y`, the restriction of `f^∗F` to `f^{−1}(S_i)` is constant with a finitely generated module as value. Here finite presentability means that `Hom(F, −)` preserves filtered colimits. Prove also that arbitrary étale `Λ`-module sheaves are filtered colimits of constructible ones.

*Needs:* `C7.3`; `C7.5`; `C7.6`; `DiamondsAndVStacks`, Layer D5; `C5.1`; `C0.1`; `C0.23`; `C5.2`.

(ECD Proposition 20.6, p. 114; ECD proof of Proposition 20.6, p. 114.)

#### C7.8 Constructible sheaves in cofiltered limits of spatial diamonds

Let `Y_i, i ∈ I`, be a cofiltered inverse system of spatial diamonds with inverse limit `Y = lim Y_i`, again a spatial diamond, and `Λ` noetherian. Then `2-colim_i Cons(Y_i, Λ) → Cons(Y, Λ)` is an equivalence of categories.

*Needs:* `C7.7`; `C0.18`; `DiamondsAndVStacks`, Layer D5; `C5.1`; `C5.2`.

(ECD Proposition 20.7, p. 115; ECD proof of Proposition 20.7, p. 115.)

### Local systems and support filtration

#### C7.9 Local systems of finitely generated `Λ`-modules on the étale site

Let `Λ` be noetherian and `U` a locally spatial diamond. A sheaf `L` of `Λ`-modules on `U_ét` is a local system (of finitely generated `Λ`-modules) if there is an étale cover `{U_k → U}` such that each `L|_{U_k}` is isomorphic to the constant sheaf of a finitely generated `Λ`-module.

Require the following API.

- `IsLocalSystem`: Étale-local constancy with finitely generated values for a sheaf of `Λ`-modules on `U_ét`.
- `IsLocalSystem.isConstructible`: On a spatial diamond, a local system is constructible.
- `IsLocalSystem.pullback`: Pullback along any map of locally spatial diamonds preserves local systems.
- `IsLocalSystem.tensor_hom`: Local systems are closed under `⊗` and internal Hom of sheaves, and under kernels and cokernels of maps between them.
- `IsLocalSystem.ofRep`: For a quasi-pro-étale presentation `Spa(C, O_C) → Spa(C, O_C)/G`, continuous `G`-representations on finitely generated `Λ`-modules give local systems.

**Checks.**

- `isLocalSystem_constant`: The constant sheaf `Λ^n` is a local system.
- `isLocalSystem_finite_etale`: For a finite étale Galois `G`-cover `V → U` and a finitely generated `Λ[G]`-module `M`, the sheaf of `G`-equivariant maps `V → M` is a local system, trivialized on `V`.
- `isLocalSystem_point`: On `Spa(C, O_C)` local systems are finitely generated `Λ`-modules, i.e. constant sheaves.
- `isLocalSystem_not`: For a rank-`2` point `Y = Spa(C, C⁺)` with open generic point `j` and `Λ ≠ 0, j_!Λ` is constructible but not a local system (stalks `Λ` and `0`).

*Needs:* `C0.1`; `C7.3`; `Module.Finite`.

(ECD Proposition 20.8, p. 116.)

#### C7.10 Restriction to a constructible closed subset `L|_Z`

Let `U` be a locally spatial diamond, `Z ⊂ |U|` a constructible closed subset with open complement `j′ : U ∖ Z → U` (a quasicompact open immersion), and `L` a sheaf of `Λ`-modules on `U_ét`. Then `L|_Z` is the cokernel of the injective map `j′_!(L|_{U∖Z}) → L`. For complexes `A ∈ D_ét(U, Λ), A|_Z` is the `cone` of the counit `j′_!j′^∗A → A`.

Require the following API.

- `supportRestrict`: For constructible closed `Z ⊂ |U|`, the exact functor `L ↦ L|_Z = coker(j′_!j′^∗L → L)` on sheaves of `Λ`-modules on `U_ét`.
- `supportRestrictDerived`: The triangulated version `A ↦ A|_Z = cone(j′_!j′^∗A → A)` on `D_ét(U, Λ)`.
- `supportRestrict.stalk`: `(L|_Z)_ū = L_ū` for `u ∈ Z` and `0` for `u ∉ Z`.
- `supportRestrict.triangle`: `j′_!j′^∗A → A → A|_Z` is a distinguished triangle.
- `supportRestrict.idempotent`: `(A|_Z)|_Z ≅ A|_Z`, and `(A|_Z)|_{Z′} ≅ A|_{Z∩Z′}`.
- `supportRestrict.pullback`: For `g : U″ → U` of locally spatial diamonds, `g^∗(A|_Z) ≅ (g^∗A)|_{g^{−1}(Z)}` (C5.2).
- `supportRestrict.etaleShriek`: For étale `j : U → Y` and a constructible closed `W ⊂ |Y|, (j_!(A|_Z))|_W ≅ j_!(A|_{Z ∩ j^{−1}(W)})`.
- `supportRestrict.isConstructible`: For `U` spatial and `L` constructible (noetherian `Λ`), `L|_Z` is constructible (a cokernel of constructible sheaves).

**Checks.**

- `supportRestrict_all`: For `Z = |U|, L|_Z = L`; for `Z = ∅, L|_Z = 0`.
- `supportRestrict_point`: For `U = Spa(C, C⁺)` of rank `2` and `Z = {s}, Λ|_Z` has stalk `Λ` at `s` and `0` at `η`.
- `supportRestrict_triangle`: For `A ∈ D_ét(U, Λ), j′^∗(A|_Z) = 0`.
- `supportRestrict_not_subsheaf`: For `U = Spa(C, C⁺)` of rank `2` and `Z = {s}`, there is no sub-`v`-sheaf `Z′ ⊂ U` with `|Z′| = Z`, because images of maps from perfectoid spaces are generalizing and `{s}` is not; so `L|_Z` cannot be written as `i_∗` of a sheaf on a sub-`v`-sheaf with underlying set `Z`.

*Needs:* `C5.3`; `C5.1`; `Topology.IsConstructible`; `C5.2`.

(ECD Proposition 20.8, p. 116.)

#### C7.11 Dévissage of constructible sheaves on spatial diamonds

Let `Λ` be noetherian and `Y` a spatial diamond. An étale sheaf `F` of `Λ`-modules on `Y` is constructible if and only if `F` has a finite filtration whose graded pieces are of the form `j_!(L|_Z)`, where `j : U → Y` is a quasicompact separated étale map, `Z ⊂ |U|` a constructible closed subset, and `L` a local system of finitely generated `Λ`-modules on `U`.

Use `HasFiltrationBy(P,F)` for the finite-filtration condition in an abelian category:
there are `n`, objects `G₀,…,Gₙ` and monomorphisms `Gᵢ→Gᵢ₊₁`, with `G₀` zero, `Gₙ` isomorphic to `F`,
and `P` holding on every cokernel. When `P` is invariant under isomorphism, require the API
`HasFiltrationBy.zero`, `HasFiltrationBy.of_mem`, `HasFiltrationBy.iso` and concatenation
of finite filtrations across a short exact sequence. The intended signature is a predicate
on an object and an isomorphism-invariant object property; the displayed Lean body also
allows an arbitrary predicate when no invariance theorem is invoked.
(ECD Proposition 20.8, pp. 115–116.)

**Checks.**

- A zero object has a length-zero filtration, even if `P` is always false.
- If `P` is invariant under isomorphism and `P(F)` holds, the filtration `0⊂F` has one graded piece isomorphic to `F`.
- For `P` always false, no nonzero object has a filtration; allowing a missing final graded piece fails this check.

*Needs:* `C7.7`; `C7.8`; `C7.9`; `C7.10`; `C8.24`; `C8.29`; `C8.26`; `DiamondsAndVStacks`, Layer D5; `C5.1`.

(ECD Proposition 20.8, p. 115; ECD proof of Proposition 20.8, p. 116.)

### Perfect local systems and perfect-constructibility

#### C7.12 Locally constant complexes with perfect values

Let `Λ` be a commutative ring and `U` a locally spatial diamond. `A ∈ D_ét(U, Λ)` is locally constant with perfect values if there is a cover `{U_k → U}` in `U_ét` such that each `A|_{U_k}` is isomorphic to the constant complex attached to a perfect complex of `Λ`-modules. If `U` is spatial, the cover can be taken to be one quasicompact separated étale surjection `U′ → U`.

Require the following API.

- `IsPerfectLocalSystem`: Local constancy with perfect values for objects of `D_ét(U, Λ)`.
- `IsPerfectLocalSystem.dualizable`: `A` is dualizable with dual `A^∨ = RHom_Λ(A, Λ_U)`, and `A^∨ ⊗^L B ≅ RHom_Λ(A, B)`. For perfect module complexes this follows from dualizability of the unit and closure under shifts, cones, finite sums and retracts; the local-system statement follows by étale descent.
- `IsPerfectLocalSystem.pullback`: Pullback preserves the property.
- `IsPerfectLocalSystem.triangle`: The property is closed under shifts, cones, extensions, retracts, finite sums, `⊗^L` and duals: étale-locally a map between constant perfect complexes `P_V → Q_V` is the constant map attached to a map of perfect complexes (`H⁰(V, P^∨ ⊗ Q)` has colimit `Hom_{D(Λ)}(P, Q)` over étale neighbourhoods of a geometric point), and perfect complexes form a thick subcategory.
- `IsPerfectLocalSystem.isPerfectConstructible`: Locally constant complexes with perfect values on a spatial diamond are perfect-constructible.
- `IsPerfectLocalSystem.exists_qcsep_trivialization`: If `U` is spatial, there is a quasicompact separated étale surjection `U′ = ⊔_{k=1}^m U_k → U` with `A|_{U_k}` constant with perfect value.

**Checks.**

- `isPerfectLocalSystem_unit`: `Λ_U` is locally constant with perfect values.
- `isPerfectLocalSystem_point`: On `Spa(C, O_C)`, these are exactly the perfect complexes of `Λ`-modules under `D_ét ≃ D(Λ)`.
- `isPerfectLocalSystem_field`: For `Λ` a field and `U` a locally spatial diamond, `A` is locally constant with perfect values iff `A` is locally bounded (bounded if `U` is quasicompact) with cohomology sheaves that are local systems of finite-dimensional vector spaces.
- `isPerfectLocalSystem_not_fg`: On nonempty `U`, the constant complex attached to `Λ = ℤ`, module `ℚ` (not perfect over `ℤ`) is locally constant but not with perfect values.

*Needs:* `C2.2`; `C3.9`; `C3.8`; `DGAInfinity`, Layers 5–6; `C0.1`; `C0.6`.

(ECD Proposition 20.16(iii), p. 120; Stacks Tag 07VI, perfect-complex duality.)

#### C7.13 Perfect-constructible complexes on a strictly totally disconnected space

Let `Λ` be any commutative ring and `X` a strictly totally disconnected perfectoid space. `A ∈ D_ét(X, Λ) ≅ D(|X|, Λ)` is perfect-constructible if there is a stratification of `X` into constructible locally closed subsets `S_i ⊂ |X|` such that `A|_{S_i}` is the constant complex on `S_i` attached to a perfect complex of `Λ`-modules.

The spectral-space form is `IsPerfectConstructibleTop(A)` for
`A∈D(Sh(X,Λ)), X` spectral: a finite constructible locally closed stratification has restrictions
isomorphic to constant complexes of supplied perfect module complexes. Its intended signature
uses the enhanced constant and restriction functors from the supplier; require invariance
under equivalence, refinement and spectral pullback. This specializes to the predicate below
under C0.19. (ECD Definition 20.11(i), p. 117.)
Its API is `IsPerfectConstructibleTop.refine` (a finite constructible locally closed refinement
preserves a witnessing stratification), `IsPerfectConstructibleTop.pullback` (spectral pullback
preserves the predicate), and `IsPerfectConstructibleTop.iff_point` (on a point, equivalence
to the supplied perfectness predicate).

**Checks.**

- On a one-point spectral space it is exactly supplied module perfectness.
- The zero complex has a witnessing stratification and is perfect-constructible.
- Over `Λ=ℤ[ε]/(ε²)`, the constant complex `Λ/ε` is bounded and constructible and fails perfectness; finite generation alone is insufficient.

Require the following API.

- `IsPerfectConstructibleStd`: Perfect-constructibility for `A ∈ D(|X|, Λ), X` strictly totally disconnected.
- `IsPerfectConstructibleStd.pullback`: Pullback along maps of strictly totally disconnected spaces preserves the property.
- `IsPerfectConstructibleStd.refine`: The witnessing stratification may be refined, and two witnessing stratifications have a common refinement.

**Checks.**

- `isPerfectConstructibleStd_point`: For `X = Spa(C, O_C), A` is perfect-constructible iff `RΓ(X, A)` is a perfect complex of `Λ`-modules.
- `isPerfectConstructibleStd_zero`: The zero complex is perfect-constructible.
- `isPerfectConstructibleStd_field`: For `Λ` a field, `A` is perfect-constructible iff `A` is bounded with constructible cohomology sheaves in the sense of target C7.2.
- `isPerfectConstructibleStd_not`: For `Λ = ℤ[ε]/(ε²)` and `X = Spa(C, O_C)`, the constant sheaf `ℤ = Λ/ε` is constructible (finitely generated) but not perfect-constructible, since `Λ/ε` has infinite projective dimension.

*Needs:* `C2.3`; `C0.19`; `Topology.IsConstructible`; `DGAInfinity`, Layers 5–6.

(ECD Definition 20.11(i), p. 117.)

#### C7.14 Perfect-constructible complexes on a small `v`-stack

Let `Λ` be any commutative ring, `Y` a small `v`-stack and `A ∈ D_ét(Y, Λ)`. A is perfect-constructible if for every strictly totally disconnected perfectoid `f : X → Y` the pullback `f^∗A` is perfect-constructible (target C7.13). `D_ét,pc(Y, Λ)` is the full subcategory of perfect-constructible complexes. Over a general `Λ` this is distinct from bounded complexes with constructible cohomology sheaves.

Require the following API.

- `IsPerfectConstructible`: Perfect-constructibility of `A ∈ D_ét(Y, Λ)`.
- `Dpc`: The full subcategory `D_ét,pc(Y, Λ)`, a thick triangulated subcategory (target C7.15).
- `IsPerfectConstructible.pullback`: Pullback along any map of small `v`-stacks preserves perfect-constructibility.
- `IsPerfectConstructible.iff_cover`: For a surjection `X → Y` from a strictly totally disconnected space, `A` is perfect-constructible iff its pullback is (target C7.18).
- `IsPerfectConstructible.iff_noetherian`: For noetherian `Λ`: locally bounded, constructible cohomology sheaves and perfect geometric stalks at all geometric points `Spa(C, C⁺) → Y` (target C7.16 (ii)).
- `IsPerfectConstructible.etaleShriek`: For quasicompact separated étale `j` and perfect-constructible `B` on `U, j_!B` is perfect-constructible.
- `IsPerfectConstructible.tensor`: `D_ét,pc(Y, Λ)` is closed under `⊗^L` and contains `Λ_Y`.
- `IsPerfectConstructible.changeOfRings`: Extension of scalars `Λ′ ⊗^L_Λ −` preserves perfect-constructibility (C3.11).
- `HasLocallyBoundedTorAmplitude`: `A ∈ D(Y_v, Λ)` has locally bounded `Tor` amplitude if for every strictly totally disconnected `f : X → Y` there are `a ≤ b` with `Hⁱ(f^∗A ⊗^L_Λ M) = 0` for all `Λ`-modules `M` and `i ∉ [a, b]`.
- `IsPerfectConstructible.iff_torAmplitude`: For noetherian `Λ: A` is perfect-constructible iff `A ∈ D_ét(Y, Λ)` is locally bounded with constructible cohomology sheaves and locally bounded `Tor` amplitude (target C7.16 (iii)).

**Checks for `HasLocallyBoundedTorAmplitude`.**

- `Λ_Y` has `Tor` amplitude `[0,0]`, including `Λ=0` or `Y=∅`: tensoring it with a constant module `M` gives `M[0]`.
- On `Y=Spa(C,O_C)` with `Λ≠0, Λ_Y[1]` has amplitude `[−1,−1]` and fails `[0,0]`; take `M=Λ` to detect `H⁻¹`.
- On `Y=Spa(C,O_C)` with `Λ=ℤ[ε]/(ε²), (Λ/ε)_Y[0]` has no finite `Tor` amplitude. The free resolution with multiplication by `ε` in every positive homological degree is exact because `ker(ε)=im(ε)`. Tensoring with `Λ/ε` makes every differential zero, yielding `Λ/ε` in every nonpositive cohomological degree.

The module calculations use `CategoryTheory.Tor` on `ModuleCat`, with `Tor_n` corresponding
to cohomological degree `−n`; the enhanced derived-tensor comparison is supplied by
`EnhancedDerivedSheaves` §E1.4.
([Stacks 0652](https://stacks.math.columbia.edu/tag/0652), Definition 15.68.1.)

**Checks.**

- `isPerfectConstructible_unit`: `Λ_Y` is perfect-constructible.
- `isPerfectConstructible_zero`: `0` is perfect-constructible.
- `isPerfectConstructible_field`: For `Λ = 𝔽_ℓ, D_ét,pc(Y, 𝔽_ℓ)` consists of the locally bounded complexes with constructible cohomology sheaves (target C7.17).
- `isPerfectConstructible_not_bounded_cons`: For `Λ = ℤ[ε]/(ε²)`, the constructible sheaf `Λ/ε` on `Spa(C, O_C)` is bounded with constructible cohomology but not perfect-constructible.
- `isPerfectConstructible_not_sum`: For `Y≠∅` and `Λ≠0, ⊕_{n∈N} Λ_Y` is not perfect-constructible. For `Y=∅` or `Λ=0` the same sum is zero and perfect-constructible.

*Needs:* `C7.13`; `C2.2`; `C3.1`; `EnhancedDerivedSheaves`, §E1.4.

(ECD Definition 20.11(ii), p. 117; ECD before Definition 20.11, p. 117.)

#### C7.15 Perfect-constructible complexes form a thick subcategory

For any commutative ring `Λ` and small `v`-stack `Y, D_ét,pc(Y, Λ)` `⊂ D_ét(Y, Λ)` is a thick triangulated subcategory: it contains `0`, is closed under shifts, cones and direct summands.

*Needs:* `C7.14`; `C7.13`; `CategoryTheory.ObjectProperty.IsTriangulated`; `DGAInfinity`, Layers 5–6; `C0.19`.

(ECD after Definition 20.11, p. 118.)

#### C7.16 Perfect-constructibility through cohomology sheaves, stalks and `Tor` amplitude

Let `Λ` be noetherian, `Y` a small `v`-stack and `A ∈ D_ét(Y, Λ)`. The following are equivalent. (i) `A` is perfect-constructible. (ii) `A` is locally bounded, each cohomology sheaf `Hⁱ(A)` is constructible, and all geometric stalks of `A` are perfect complexes of `Λ`-modules. (iii) `A` is locally bounded, each cohomology sheaf `Hⁱ(A)` is constructible, and `A` has locally bounded `Tor` amplitude: for every strictly totally disconnected `f : X → Y` there are `a ≤ b` such that `Hⁱ(f^∗A ⊗^L_Λ M) = 0` for every `Λ`-module `M` (as a constant sheaf) and every `i ∉ [a, b]`. Here locally bounded means that `f^∗A` is bounded for every strictly totally disconnected `f : X → Y`, and a geometric stalk is the stalk at the closed point of `Spa(C, C⁺) → Y` for every algebraically closed `C` and every open bounded valuation subring `C⁺`, not only `C⁺ = O_C`.

In this statement, `Λ` noetherian: constructible sheaves (Definition 20.1) are only defined over noetherian `Λ`, and the pointwise equivalence of (ii) and (iii) uses that over a noetherian ring a bounded complex with finitely generated cohomology is pseudo-coherent.

*Needs:* `C7.14`; `C7.3`; `C0.19`; `DiamondsAndVStacks`, Layer D1; `DGAInfinity`, Layers 5–6.

(ECD Proposition 20.12, p. 118; ECD proof of Proposition 20.12, p. 118; [Stacks 0652](https://stacks.math.columbia.edu/tag/0652) (Definition 15.68.1); [Stacks 0658](https://stacks.math.columbia.edu/tag/0658) (Lemma 15.76.2); [Stacks 066E](https://stacks.math.columbia.edu/tag/066E) (Lemma 15.66.17).)

#### C7.17 Perfect-constructible complexes with field coefficients

Let `Λ` be a field (for example `𝔽_ℓ`) and `Y` a small `v`-stack. `A ∈ D_ét(Y, Λ)` is perfect-constructible if and only if it is locally bounded and all its cohomology sheaves are constructible. In particular, for quasicompact `Y, D_ét,pc(Y, 𝔽_ℓ)` is the category of bounded complexes with constructible cohomology sheaves.

*Needs:* `C7.16`; `C7.3`.

(ECD §1, p. 7.)

#### C7.18 `v`-descent of perfect-constructibility

Let `Λ` be a commutative ring, `f : Ỹ → Y` a surjective map of small `v`-stacks and `A ∈ D_ét(Y, Λ)`. If `f^∗A` is perfect-constructible, then `A` is perfect-constructible.

*Needs:* `C7.14`; `C7.13`; `PerfectoidSpaces`, Layer P6; `DiamondsAndVStacks`, Layer D5; `C2.3`; `C7.16`; `C7.6`; `C0.10`; `DiamondsAndVStacks`, Layer D1; `DiamondsAndVStacks`, Layer D0.

(ECD Proposition 20.13, p. 118; ECD proof of Proposition 20.13, p. 118.)

### Restricted compactness and continuity

#### C7.19 Restricted compactness of perfect-constructible complexes

Let `Y` be a spatial diamond, `Λ` a commutative ring and `A ∈ D_ét(Y, Λ)` perfect-constructible. For every filtered direct system `C_j ∈ D^{≥−n}_ét(Y, Λ), j ∈ J`, uniformly bounded to the left, `colim_j Hom_{D_ét(Y,Λ)}(A, C_j) → Hom_{D_ét(Y,Λ)}(A, colim_j C_j)` is an isomorphism.

*Needs:* `C7.14`; `C7.15`; `DiamondsAndVStacks`, Layer D0; `C5.1`; `C2.10`.

(ECD Proposition 20.14, p. 119; ECD proof of Proposition 20.14, p. 119.)

#### C7.20 Full faithfulness of perfect-constructible complexes in cofiltered limits

Let `Y_i, i ∈ I`, be a cofiltered inverse system of spatial diamonds with inverse limit `Y = lim Y_i` a spatial diamond, and `Λ` a commutative ring. Then `2-colim_i D_ét,pc(Y_i, Λ)` `→ D_ét,pc(Y, Λ)` is fully faithful. Likewise, for a spatial diamond `Y` and a filtered colimit of commutative rings `Λ = colim Λ_i`, `2-colim_i D_ét,pc(Y, Λ_i)` `→ D_ét,pc(Y, Λ)` is fully faithful.

*Needs:* `C7.19`; `C0.18`; `C3.11`; `C7.14`; `C3.2`.

(ECD Proposition 20.15, p. 119; ECD proof of Proposition 20.15, p. 119.)

#### C7.21 Perfect local systems spread out along cofiltered limits

Let `Y_i, i ∈ I`, be a cofiltered inverse system of spatial diamonds with limit `Y = lim Y_i` a spatial diamond, and `Λ` a commutative ring. Every `L ∈ D_ét(Y, Λ)` that is locally constant with perfect values is isomorphic to the pullback of some `L_i ∈ D_ét(Y_i, Λ)` that is locally constant with perfect values. The same holds for a spatial diamond `Y` and a filtered colimit of commutative rings `Λ = colim Λ_i`.

*Needs:* `C7.20`; `C7.12`; `C2.10`; `DiamondsAndVStacks`, Layer D5.

(ECD proof of Proposition 20.15, pp. 119–120.)

#### C7.22 Characterizations of perfect-constructible complexes on spatial diamonds

Let `Λ` be a commutative ring, `Y` a spatial diamond and `A ∈ D_ét(Y, Λ)`. Equivalent: (i) `A` is perfect-constructible; (ii) there is a stratification of `|Y|` into constructible locally closed `S_i` such that for every strictly totally disconnected `f : X → Y, f^∗A|_{f^{−1}(S_i)}` is constant with perfect value; (iii) `A` has a finite filtration with graded pieces `j_!(L|_Z), j : U → Y` quasicompact separated étale, `Z ⊂ |U|` constructible closed, `L ∈ D_ét(U, Λ)` locally constant with perfect values.

*Needs:* `C7.20`; `C7.19`; `C7.18`; `C7.12`; `C7.10`; `C7.15`; `C8.24`; `C8.29`; `C8.26`; `DiamondsAndVStacks`, Layer D5; `C5.1`; `C7.21`.

(ECD Proposition 20.16, p. 120; ECD proof of Proposition 20.16, p. 120.)

#### C7.23 Perfect-constructible complexes in cofiltered limits of spatial diamonds

Let `Y_i, i ∈ I`, be a cofiltered inverse system of spatial diamonds with inverse limit `Y = lim Y_i` a spatial diamond, and `Λ` a commutative ring. Then `2-colim_i D_ét,pc(Y_i, Λ)` `→ D_ét,pc(Y, Λ)` is an equivalence of categories.

*Needs:* `C7.20`; `C7.22`; `C2.10`; `DiamondsAndVStacks`, Layer D5; `C7.21`; `C5.2`; `C7.10`.

(ECD proof of Proposition 20.15, p. 119; ECD proof of Proposition 20.15, p. 120.)

#### C7.24 Perfect-constructible complexes under filtered colimits of coefficient rings

Let `Y` be a spatial diamond and `Λ = colim_i Λ_i` a filtered colimit of commutative rings. Then `2-colim_i D_ét,pc(Y, Λ_i)` `→ D_ét,pc(Y, Λ)` is an equivalence of categories.

First establish `perfectComplexRingColimit` for the supplied module perfectness predicate:
for a filtered system of commutative rings `Λ_i` with colimit `Λ`, every perfect `Λ`-complex is
derived extension of scalars of a perfect complex at one stage. For perfect `P_i,Q_i` at a
stage `i`, the canonical map from the filtered colimit, over `j≥i`, of
`Hom(P_i⊗ᴸΛ_j,Q_i⊗ᴸΛ_j)` to `Hom(P_i⊗ᴸΛ,Q_i⊗ᴸΛ)` is an isomorphism; the same assertion holds
with `Q_i` replaced by any shift. This is the module coefficient-descent input of the sheaf
statement, including descent of morphisms and of their equalities.
([Stacks Tag 0BC7](https://stacks.math.columbia.edu/tag/0BC7), Lemma 15.76.18;
ECD Proposition 20.15, p. 119.)

**Checks.**

- A constant ring system gives the identity equivalence on perfect complexes.
- A finite free complex with specified finite differential matrices is the base change of its finite coefficient data at a common stage, including the equations `d²=0`.
- Over a nonzero ring `Λ`, the degree-zero free module `Λ^(ℕ)` is outside `Perf(Λ)` and does not satisfy the claimed finite-complex descent contract merely by being a module.

*Needs:* `C7.20`; `C7.22`; `C3.11`; `DGAInfinity`, Layers 5–6; `C7.21`.

(ECD Proposition 20.15, p. 119.)

### Examples

At `Spa(C,O_C)` with `Λ=ℤ[ε]/(ε²)`, the module `Λ/ε` is finitely generated and constructible, but its periodic `ε`-resolution never becomes a bounded projective resolution. It is therefore not perfect-constructible. Over a field, a finite-dimensional degree-zero module is perfect and both notions agree. (ECD Definition 20.11, p. 117; Proposition 20.12, p. 118.)

### Dependencies

Layers C0–C6 and the independent point-presentation targets C8.24, C8.26 and C8.29; `DGAInfinity`, Layers `5`–`6`; `EnhancedDerivedSheaves`, Layers E1–E3; `DiamondsAndVStacks`, Layers D0–D5; `PerfectoidSpaces`, Layer P6.

<a id="c8"></a>

## Layer C8: Dimension and cohomological bounds

Build field degrees on the existing field carriers, prove invariance of geometric dimension under point choices, and compare point cohomology with canonical continuous cohomology. Combine the spectral-space and point-stabilizer bounds to obtain the spatial cohomological bound.

### Topological dimension and transcendence degrees

#### C8.1 Dimension through the specialization order

Prove `specialization_dimension`. For a quasi-sober `T₀` space `X, topologicalKrullDim X` equals `Order.krullDim` of `X` with its specialization order. Thus on locally spectral spaces it is ECD 21.1(i), with empty space valued at minus infinity and unbounded finite chain lengths at plus infinity.

*Needs:* `topologicalKrullDim`; `irreducibleSetEquivPoints`; `Order.krullDim_eq_of_orderIso`.

(ECD Definition 21.1(i), p.122.)

#### C8.2 Topological fibre dimension

Use `AdicEtaleGeometry`, A2.6, `AdicSpace.relDim`, for topological fibre dimension throughout C8 and its downstream contracts. For a map `f:X′→X` it is the supremum, over `x∈X`, of `topologicalKrullDim` of `f⁻¹({x})` with its subspace topology, in `WithBot ENat`. This carrier allows an arbitrary topological source and an arbitrary target type. For spectral maps of locally spectral spaces it is ECD 21.1(ii). C8.2 supplies the following specializations of that invariant.

- `relDim_homeomorph`: A commuting square with homeomorphisms on source and target preserves `AdicSpace.relDim`.
- `relDim_id`: For nonempty `X` the identity has `AdicSpace.relDim` zero.

The subtype {`x′` | `f(x′)=x`} and the preimage subspace `f⁻¹({x})` are canonically homeomorphic, including empty fibres. The suggested signatures use the supplier's defining supremum directly.

**Checks.**

- A map with empty domain has `AdicSpace.relDim` bottom.
- The identity on any nonempty topological space has `AdicSpace.relDim` zero.
- For `f:X→`PUnit, `AdicSpace.relDim` equals `topologicalKrullDim X`.
- The unique function from the empty space to itself has `AdicSpace.relDim` bottom, despite being an identity.

*Needs:* `AdicEtaleGeometry`, A2.6 (`AdicSpace.relDim`); `topologicalKrullDim`; `C8.1`.

(ECD Definition 21.1(ii), p.122.)

#### C8.3 Topological transcendence degree

For an extension `K→L` of fields with a topology on `L, topologicalTrdeg(K,L)∈ENat` is the infimum of finite `n` admitting an intermediate field `A⊆L` whose underlying subset is dense and whose Algebra.trdeg over `K` is at most `n`. If no such finite `n` exists the value is infinity. ECD 21.2 uses this for extensions of complete algebraically closed nonarchimedean fields with their given continuous embeddings.

Require the following API.

- `topologicalTrdeg_le_iff`: For `n` natural, `topologicalTrdeg(K,L)≤n` iff some dense intermediate field has `Algebra.trdeg≤n`.
- `topologicalTrdeg_le_of_dense`: A dense intermediate field of algebraic transcendence degree `≤n` gives the corresponding upper bound.
- `topologicalTrdeg_eq_top_iff`: The value is infinity iff no dense intermediate field has finite algebraic transcendence degree.
- `topologicalTrdeg_self`: `topologicalTrdeg(K,K)=0`.
- `topologicalTrdeg_equiv`: `A K`-algebra equivalence that is a homeomorphism preserves the invariant.

**Checks.**

- For any field `K` with any topology, the identity extension has value zero.
- If the image of an algebraic intermediate extension `A/K` is dense in `L`, the value is zero, even when `L/K` is not algebraic.
- If `L` has the discrete topology and Algebra.trdeg `K L=1`, then `topologicalTrdeg(K,L)=1`.
- For discrete `L` with infinite algebraic transcendence degree, the value is infinity, not zero.
- `topologicalTrdeg_padicComplex`: `topologicalTrdeg(ℚ_p, ℂ_p) = 0`: the image of the algebraic `closure PadicAlgCl p` is a dense intermediate field algebraic over `ℚ_p`, although Algebra.trdeg `ℚ_p ℂ_p` is infinite. A definition using the algebraic transcendence degree of the ambient field fails this test.
- `topologicalTrdeg_eq_zero_iff_surjective`: For complete algebraically closed nonarchimedean `K` with an isometric embedding into any normed field `L`, `topologicalTrdeg(K,L)=0` iff the embedding is surjective: a dense intermediate field algebraic over the algebraically closed `K` is `K`, whose image is closed. No completeness or algebraic closedness of `L` is required.
- For such `K`, the rational function field `K(T)` with its Gauss norm has generating degree one: the whole field gives the upper bound, and the closed proper image of `K` rules out degree zero. The target of the embedding is neither complete nor algebraically closed.

*Needs:* `Algebra.trdeg`; `IntermediateField`; `Dense`.

(ECD Definition 21.2, p.122.)

#### C8.4 Topological algebraic independence and its degree

For a field extension `K→L` with a topology on `L`, a set `S⊆L` is topologically algebraically independent over `K` (Temkin's topgebraically independent) if no `x∈S` lies in the closure in `L` of the set of elements of `L` algebraic over the intermediate field `K(S∖{x})`. `topologicalIndependenceDegree(K,L)∈ENat` is the supremum of the cardinalities of finite topologically algebraically independent sets. For complete algebraically closed nonarchimedean `L` that closure is the completed algebraic closure of `K(S∖{x})` inside `L`, so this is Temkin's `top.tr.deg(L/K)` whenever the latter is finite.

Require the following API.

- `topologicalIndependenceDegree_le_iff`: For `n` natural, `topologicalIndependenceDegree(K,L)≤n` iff every finite topologically algebraically independent set has at most `n` elements.
- `IsTopAlgIndependent.algebraicIndependent`: `A` topologically algebraically independent set is algebraically independent over `K`, since an element algebraic over `K(S∖{x})` lies in the closure of the algebraic elements.
- `IsTopAlgIndependent.mono`: `A` subset of a topologically algebraically independent set is topologically algebraically independent.
- `topologicalIndependenceDegree_self`: `topologicalIndependenceDegree(K,K)=0`: every element of `K` is algebraic over `K`.

**Checks.**

- `topologicalIndependenceDegree_padicComplex`: `topologicalIndependenceDegree(ℚ_p, ℂ_p)=0` because the algebraic closure of `ℚ_p` is dense in `ℂ_p`, although `ℂ_p` has infinite algebraic transcendence degree over `ℚ_p`.
- If `L` has the discrete topology, a set is topologically algebraically independent over `K` iff it is algebraically independent over `K`.
- `{x}` is topologically algebraically independent over `K` iff `x` is not in the closure of the elements of `L` algebraic over `K`.
- For `K=L`, the independent degree is zero because every element is algebraic over `K`.
- For discrete `L` with Algebra.trdeg `K L=1`, the independent degree is one; a definition always returning zero fails.

*Needs:* `IntermediateField`; `IsAlgebraic`.

(Temkin §2.1.6, p.5.)

#### C8.4a Primitive perturbation

Build `primitivePerturbation` for an isometric extension `L/K` of complete nonarchimedean
fields. Compute the radius `r_K(t)=inf_{c∈K^a}|t−c|` in a common completed algebraic closure
of `L`, and prove it is zero exactly when `t` lies in the completed algebraic closure of `K`.
For `t,t′∈L` with `|t−t′|<r_K(t)` and `|t−t′|/r_K(t)<α<1`, there is a unique
`K`-isometric isomorphism between the closures of `K(t)` and `K(t′)` in `L` sending `t` to `t′`.
For every nonzero `x` in the first closure it satisfies `|φ(x)−x|<α|x|`.
Here closures of generated fields are ordinary completions, not algebraic closures.

**Checks.**

- For `t′=t` with `r_K(t)>0` and `0<α<1` the unique extension is the identity.
- A perturbation with `|t−t′|<r_K(t)` preserves the norm of every rational expression in `t` and extends to its completion.
- For `t` algebraic over `K` the radius is zero, so the strict perturbation hypothesis is impossible, including `t′=t`.

*Needs:* `C8.3`; completion of normed fields; `spectralNorm.normedField` and `spectralNorm_extends` for the common algebraic-closure norm.

(Temkin Lemma 3.1.6 and §§3.1.1–3.1.3, pp.6–7; Temkin 2010, Lemma 6.3.2.)

#### C8.4b Extension of a perturbation of generators

Build `perturbationExtension`. For an isometric analytic extension `L/K`, a subset `S⊆L`,
`0<α<1` and `φ:S→L` satisfying `|s−φ(s)|<α r_{K,S}(s)` for all `s∈S`, prove `φ` is injective
and extends uniquely to a `K`-isometric isomorphism `closure(K(S))≃closure(K(φ(S)))`.
The multiradius `r_{K,S}(s)` is `r_{closure(K(S∖{s}))}(s)`, computed as in C8.4a.
The extension satisfies `|φ`̂`(x)−x|<α|x|` for every nonzero `x`.

**Checks.**

- For `S` empty the extension is the identity of `K`.
- For a singleton the statement reduces to C8.4a, with its stricter `α`-bound.
- If a multiradius is zero, no map satisfies the strict perturbation bound at that element; continuity alone is insufficient.

*Needs:* `C8.4a`; completion and closure of intermediate fields.

(Temkin Theorem 3.1.9 and §§3.1.7–3.1.8, p.7.)

#### C8.4c Preservation of multiradii and independence

Build `perturbationMultiradius` under the hypotheses of C8.4b:
`r_{K,φ(S)}(φ(s))=r_{K,S}(s)` for every `s∈S`. In a complete algebraically closed
ambient `L`, positivity of all these radii is precisely `IsTopAlgIndependent`,
so `φ(S)` is topologically algebraically independent and has the same cardinality as `S`.

**Checks.**

- The empty set has the empty multiradius and remains independent.
- The identity perturbation of an independent singleton preserves its positive radius.
- A singleton algebraic over `K` has radius zero and cannot satisfy these perturbation hypotheses.

*Needs:* `C8.4b`; `C8.4`.

(Temkin Corollary 3.1.10, p.8, and §3.1.7, p.7.)

#### C8.5 Temkin's comparison of independent and generating degrees

Prove `topologicalIndependenceDegree_le_topologicalTrdeg`, `topologicalIndependenceDegree_eq_of_lt_top`, `topologicalIndependenceDegree_mono`. Let `K⊆L⊆M` be complete algebraically closed nonarchimedean fields with isometric embeddings. `(a) topologicalIndependenceDegree(K,M)≤topologicalTrdeg(K,M)`. `(b)` If `topologicalTrdeg(K,M)` is finite, the two are equal. `(c) topologicalIndependenceDegree(K,L)≤topologicalIndependenceDegree(K,M)`.

In this statement, All field inclusions preserve the given nonarchimedean absolute values.

*Needs:* `C8.4`; `C8.4a`; `C8.4b`; `C8.4c`; `C8.6`.

(Temkin Theorem 3.2.1, p.8; Temkin Remark 2.1.10(i) and Theorem 3.2.3, pp.5 and 8; Temkin Lemma 2.2.2, p.6.)

#### C8.6 Finite topological generators

Prove `finite_topological_generators`. For complete algebraically closed nonarchimedean fields `K⊆L` and `n` natural, `topologicalTrdeg(K,L)≤n` iff there exist `n` elements of `L` such that `L` is the smallest complete algebraically closed subfield of `L` containing `K` and those elements.

*Needs:* `C8.3`; `spectralNorm.normedField`; `spectralNorm_extends`.

(ECD After Definition 21.2 and proof of Lemma 21.3, p.122; Conrad Theorem 1.1 and §2, pp.1–3.)

#### C8.7 Topological transcendence degree in a tower

Prove `topological_trdeg_tower`. For complete algebraically closed nonarchimedean fields `K⊆L⊆M, topologicalTrdeg(K,M)≤topologicalTrdeg(L,M)+topologicalTrdeg(K,L)` in `ENat`.

*Needs:* `C8.6`.

(ECD Lemma 21.3(i) and proof, p.122.)

#### C8.8 Topological transcendence degree after dense compositum

Prove `topological_trdeg_base_change`. For a commutative square of continuous embeddings `K⊆K′` and `L⊆L′` of complete algebraically closed nonarchimedean fields, with `K′` embedded in `L′` and the relative algebraic closure of LK′ dense in `L′, topologicalTrdeg(L,L′)≤topologicalTrdeg(K,K′)`.

*Needs:* `C8.6`.

(ECD Lemma 21.3(ii) and proof, p.122.)

#### C8.9 Finite topological transcendence degree is monotone

Prove `topologicalTrdeg_mono_of_lt_top`. For complete algebraically closed nonarchimedean fields `K⊆L⊆M`, if `topologicalTrdeg(K,L)` is finite then `topologicalTrdeg(K,L)≤topologicalTrdeg(K,M)`.

In this statement, All field inclusions preserve the given nonarchimedean valuations.

*Needs:* `C8.6`; `C8.5`.

(ECD Paragraph immediately after Question 21.4, p.123; Temkin Lemma 2.2.2; Theorems 3.2.1 and 3.2.3, pp.6–8.)

#### C8.10 Modified topological transcendence degree

For complete algebraically closed nonarchimedean fields `K⊆L, modifiedTopologicalTrdeg(K,L)` is the minimum in `ENat` of `topologicalTrdeg(K,E)` over further complete algebraically closed valued extensions `E` of `L`, with compatible continuous embeddings. Equivalently it is the infimum of finite `n` admitting such `E` and a dense intermediate field of `E` over `K` of algebraic transcendence degree `≤n`. Prove a universe bound for finite witnesses, so that the infimum is taken over a set.

Bundle a fixed-universe witness as `CompleteACExtension(K,L)`: a field `E` with an actual
nontrivial `ultrametric` norm, completeness and algebraic closedness, `K`- and `L`-algebra structures,
a scalar-tower law, and an isometric embedding `L→E`. This is extension data on existing field
carriers. Its API exposes the two algebra maps, their commuting triangle and norm preservation;
change of witness by a `K`-algebra isometric equivalence preserves every transcendence bound.
Prove that each finite witness in a larger universe has a model in the fixed universe, using
finite algebraic generation and completion, before identifying the following infimum with the
unrestricted invariant. (ECD paragraph before Definition 21.5, p. 123.)

Require the extension API:

- `CompleteACExtension.algebraK` and `CompleteACExtension.algebraL` are the specified `K`- and `L`-algebra structures on `E`.
- `CompleteACExtension.tower` identifies the composite `K→L→E` with the specified `K→E`.
- `CompleteACExtension.isometry` preserves the absolute value of every element of `L`; the projections `complete`, `ultrametric` and `algebraicallyClosed` supply the corresponding properties of `E`.


**Checks.**

- `E=L` with its identity embedding is a witness for an isometric `K→L`.
- A commuting isometric tower `K⊆L⊆M` gives the witness `E=M`; incompatible `K`-algebra maps do not.
- A continuous field embedding that changes a nonzero absolute value is not an isometric witness; mere continuity does not satisfy this fixed-normalization contract.

Require the following API.

- `modifiedTopologicalTrdeg_le_iff`: A finite bound `n` is equivalent to a further extension with `topologicalTrdeg` at most `n`.
- `modifiedTopologicalTrdeg_le`: `modifiedTopologicalTrdeg(K,L)≤topologicalTrdeg(K,L)`, using `E=L`.
- `modifiedTopologicalTrdeg_mono`: For `K⊆L⊆M, modifiedTopologicalTrdeg(K,L)≤modifiedTopologicalTrdeg(K,M)`.
- `modifiedTopologicalTrdeg_equiv`: Compatible topological valued-field equivalences preserve the invariant, independently of the real-valued normalization: simultaneous positive-power rescaling preserves closures and finite witnesses, and transports isometric extension data after compatible normalization.

**Checks.**

- The identity extension has value zero.
- Any further extension `E` with `topologicalTrdeg(K,E)=0` forces `modifiedTopologicalTrdeg(K,L)=0`.
- If every further extension has infinite `topologicalTrdeg` over `K`, the modified invariant is infinity.
- When every further extension `E` satisfies `topologicalTrdeg(K,L)≤topologicalTrdeg(K,E)`, the modified and original invariants agree; this monotonicity is an explicit hypothesis, not an unconditional theorem.
- For an isometric extension `K⊆L` of complete algebraically closed nonarchimedean fields, `modifiedTopologicalTrdeg(K,L)=0` iff `L=K`: a further extension `E` with `topologicalTrdeg(K,E)=0` is `K` and contains `L`.
- If `topologicalTrdeg(K,L)=1` then `modifiedTopologicalTrdeg(K,L)=1`, without Temkin's theorem: the value is at most `1` by `modifiedTopologicalTrdeg_le` and is not `0` because `L≠K`. A definition that is always zero, or that takes a supremum over further extensions, fails this test.

*Needs:* `C8.3`; `DiamondsAndVStacks`, Layer D0.

(ECD Paragraph before Definition 21.5, p.123.)

#### C8.11 The modified and original finite degrees agree

Prove `modifiedTopologicalTrdeg_eq_of_lt_top`. For a complete algebraically closed nonarchimedean extension `K⊆L` with finite `topologicalTrdeg(K,L), modifiedTopologicalTrdeg(K,L)=topologicalTrdeg(K,L)`.

In this statement, All field inclusions preserve the given nonarchimedean valuations.

*Needs:* `C8.10`; `C8.9`.

(ECD Finite-degree paragraph and modified invariant before Definition 21.5, p.123.)

#### C8.11a Complete real-valued amalgamation

Prove `completeFieldAmalgamation`. For complete nonarchimedean fields `K,L,M` with
isometric `K`-algebra embeddings `K→L` and `K→M` and nontrivial valuation on `K`, there is a
common complete algebraically closed nonarchimedean `E` with compatible isometric
`K`-algebra embeddings `L→E` and `M→E`. The norm on `E` extends the chosen norms exactly.

Import the field form of `AdicSpacesPartII`, R0.7 (`ValuationSpectrum.exists_amalgamation`).
Construct a real-valued semivaluation on `L⊗_K M` extending both factor norms:
relative to a fixed `0<|π|<1` in `K`, every finite tensor sum is bounded by some `|π|^{−n}`.
The rank-one passage may enlarge the support by killing elements smaller than every
|`π|^n`; quotient by that support and pass to the fraction field before taking an algebraic
closure and completion. The common nontrivial base fixes the relative normalization. Prove the finite-witness universe bound
of C8.10 for the resulting amalgam before using it in that fixed-universe infimum.

**Checks.**

- For `L=M=K`, the completed algebraic closure of `K` is an amalgam.
- An isometric tower `K⊆L⊆M` embeds compatibly into a completed algebraic closure of `M`.
- Rescaling one factor's norm while fixing the base norm, so its `K`-map ceases to be isometric, cannot give an isometric amalgam with that prescribed triangle.

*Needs:* `AdicSpacesPartII`, R0.7 (`ValuationSpectrum.exists_amalgamation`, including its field form); `C8.6` (completion of an algebraic closure); `C8.10` (universe bounds).

(Huber `1996` §1.1, (1.1.14)`(f)`, p.45; ECD modified-degree paragraph before Definition 21.5, p.123.)

#### C8.12 Modified transcendence degree in a tower

Prove `modified_topological_trdeg_tower`. For complete algebraically closed nonarchimedean fields `K⊆L⊆M, modifiedTopologicalTrdeg(K,M)≤modifiedTopologicalTrdeg(L,M)+modifiedTopologicalTrdeg(K,L)`.

*Needs:* `C8.10`; `C8.11a`; `AdicSpacesPartII`, R0.7; `C8.7`; `C8.8`.

(ECD Paragraph before Definition 21.5, p.123.)

#### C8.13 Modified transcendence degree after base change

Prove `modified_topological_trdeg_base_change`. In the commutative square and dense-algebraic-compositum situation of 21.3(ii), `modifiedTopologicalTrdeg(L,L′)≤modifiedTopologicalTrdeg(K,K′)`.

*Needs:* `C8.10`; `C8.11a`; `AdicSpacesPartII`, R0.7; `C8.8`.

(ECD Paragraph before Definition 21.5 and Remark 21.8, p.123.)

#### C8.14 Geometric transcendence dimension of an analytic map

For a map `f:X′→X` of analytic adic spaces, `analyticDimTrg(f)∈WithBot ENat` is the supremum over `x′∈X′` of `modifiedTopologicalTrdeg(C(f(x′)),C(x′))`, where `C(x)` is a completed algebraic closure of the completed residue field. The comparison embeddings must lie over the residue-field map.

Require the following API.

- `analyticDimTrg_le_iff`: `analyticDimTrg(f)≤d` iff every displayed completed residue-field contribution is `≤d`.
- `analyticDimTrg_equiv`: Isomorphic analytic morphisms have the same invariant.
- `analyticDimTrg_empty`: A map with empty source has dimension bottom.
- `analyticDimTrg_field`: For a map of rank-one algebraically closed field spectra, the invariant equals `modifiedTopologicalTrdeg` of the field extension.

**Checks.**

- `analyticDimTrg_empty_test`: Empty analytic source gives bottom.
- `analyticDimTrg_identity_point`: The identity of a nonempty algebraically closed field spectrum has dimension zero.
- `analyticDimTrg_field_test`: `A` compatible extension `C⊆D` of complete algebraically closed fields gives the field invariant on `Spa(D,O_D)→Spa(C,O_C)`.

*Needs:* `C8.10`; `C8.13`; `AdicSpacesPartII`, R0.11 (`κ(x)`).

(ECD Definition 21.5, p.123.)

#### C8.15 Topological dimension bounded by geometric transcendence dimension

For a morphism `f` of analytic adic spaces, `AdicSpace.relDim(f)≤analyticDimTrg(f)`.

*Needs:* `C8.2`; `C8.14`.

(ECD Lemma 21.6 and proof, p.123.)

#### C8.16 Geometric transcendence dimension of a diamond map

For `f:Y′→Y` of diamonds, choose at each `y′` over `y` a quasi-pro-étale field point `Spa(C(y),C(y)+)→Y` and a quasi-pro-étale point `Spa(C(y′),C(y′)+)` of its pullback through `y′`. `diamondDimTrg(f)` is the supremum of `modifiedTopologicalTrdeg(C(y),C(y′))` over `y′` in `WithBot ENat`. Independence of choices is required. For `f` representable in diamonds between `v`-stacks, take the supremum over all diamond base changes `X→Y`.

Require the following API.

- `diamondDimTrg_le_iff`: For diamond maps, the bound `d` holds iff every point-field contribution is `≤d`.
- `diamondDimTrg_vstack`: For representable `v`-stack maps the bound is tested on all diamond base changes.
- `diamondDimTrg_empty`: Empty source gives bottom.
- `diamondDimTrg_point`: On compatible algebraically closed field points this is the modified field invariant.
- `diamondDimTrg_representative`: Changing the quasi-pro-étale point representatives preserves the value.

**Checks.**

- `diamondDimTrg_empty_test`: Empty source gives bottom.
- `diamondDimTrg_identity_point`: The identity of `Spa(C,O_C)` has value zero.
- `diamondDimTrg_field_test`: `Spa(D,O_D)→Spa(C,O_C)` gives `modifiedTopologicalTrdeg(C,D)`.
- `diamondDimTrg_bottom`: Nonempty source has value at least zero, never bottom.

*Needs:* `C8.10` (normalization independence via `modifiedTopologicalTrdeg_equiv`); `C8.13`; `DiamondsAndVStacks`, Layer D5.

(ECD Definition 21.7 and Remark 21.8, p.123.)

#### C8.17 Geometric transcendence dimension under pullback

For `f` representable in diamonds and any base change `g, diamondDimTrg(g* f)≤diamondDimTrg(f)`.

*Needs:* `C8.16`; `C8.13`.

(ECD Remark 21.8, p.123.)

#### C8.18 Geometric transcendence dimension of a composite

For composable maps `g:Z→Y` and `f:Y→X` representable in diamonds with nonempty `Z, diamondDimTrg(f∘g)≤diamondDimTrg(g)+diamondDimTrg(f)`. For empty `Z` the composite has bottom dimension; this separates the empty case from arithmetic involving infinity.

*Needs:* `C8.16`; `C8.12`.

(ECD Lemma 21.3, the modified-degree paragraph, Definitions 21.5 and 21.7 and Lemma 21.6, pp. 122–123.)

#### C8.19 Local finiteness of geometric transcendence dimension

For `f` representable in locally spatial diamonds, `LocallyFiniteDimTrg(f)` means that after every locally spatial diamond test `X→Y`, each point of `Y′×_Y X` has an open neighborhood `W` and a natural number `d` with `diamondDimTrg(W→X)≤d`. Bounds depend on the neighborhood. For maps of locally spatial diamonds, base-change stability makes this equivalent to the source-neighborhood condition before testing.

Require the following API.

- `locallyFiniteDimTrg_of_bound`: A finite global bound implies the local condition.
- `locallyFiniteDimTrg_openCover`: On locally spatial diamond maps, an open source cover with finite bounds is equivalent to the predicate.
- `locallyFiniteDimTrg_baseChange`: Base change preserves the predicate.
- `locallyFiniteDimTrg_identity`: Identity morphisms satisfy the predicate.

**Checks.**

- `locallyFiniteDimTrg_empty`: Empty source satisfies the predicate.
- `locallyFiniteDimTrg_identity_test`: The identity has bound zero.
- `locallyFiniteDimTrg_localNotUniform`: A disjoint union of maps of finite but unbounded component dimensions is locally finite without a uniform global finite bound.

*Needs:* `C8.16`; `C8.17`; `DiamondsAndVStacks`, Layer D5.

(ECD Convention 22.1, p. 127; Definition 21.7 and Remark 21.8, p. 123.)

#### C8.20 Topological fibre dimension can be tested on field points

For `f:Y′→Y` representable in locally spatial diamonds, define its topological fibre dimension as the supremum of `AdicSpace.relDim(f×Y X)` over locally spatial diamond tests `X→Y`. The same supremum is obtained by restricting to `X=Spa(C,C+)` for complete algebraically closed perfectoid fields `C` and open bounded valuation subrings `C+`.

*Needs:* `C8.2`; `DiamondsAndVStacks`, Layer D5.

(ECD Remark 21.8, second paragraph, p.123.)

### Point presentations, stabilizers and direct image

#### C8.21 Étale acyclicity of strictly totally disconnected spaces

For strictly totally disconnected perfectoid `X`, every abelian étale sheaf `F` has `Hⁱ(X_et,F)=0` for `i>0`.

*Needs:* `DiamondsAndVStacks`, Layer D1; `C0.19`; `EnhancedDerivedSheaves`, Layer E1.

(ECD Remark 21.14, p.125.)

#### C8.22 Degree-zero direct image for quasi-pro-étale maps

For a quasicompact separated quasi-pro-étale map `j:U→Y` of locally spatial diamonds, `R^i j_et`,* `F=0` for every abelian étale sheaf `F` and `i>0`.

*Needs:* `C1.11`; `DiamondsAndVStacks`, Layer D1; `DiamondsAndVStacks`, Layer D5; `C0.19`; `C0.7`.

(ECD Remark 21.14, p.125.)

#### C8.23 Degree-zero direct image for a quasicompact injection

For a quasicompact injection `j:U→Y` of locally spatial diamonds, `R^i j_et`,* `F=0` for every abelian étale `F` and `i>0`.

*Needs:* `C8.22`; `DiamondsAndVStacks`, Layer D5; `DiamondsAndVStacks`, Layer D0.

(ECD Lemma 21.13 and proof, p.125.)

#### C8.24 A one-point diamond as a profinite quotient

A quasiseparated diamond `Y` with exactly one underlying point is `Spa(C,O_C)/G` for a complete algebraically closed nonarchimedean field `C` of characteristic `p` and a profinite group `G` acting continuously and faithfully on `C`.

*Needs:* `DiamondsAndVStacks`, Layer D5; `DiamondsAndVStacks`, Layer D1; `DiamondsAndVStacks`, Layer D0.

(ECD Proposition 21.9 and proof, pp.123–124.)

#### C8.25 Uniqueness of the profinite point presentation

Two faithful presentations of the same one-point quasiseparated diamond yield a continuous field isomorphism preserving valuation rings and a topological profinite-group isomorphism intertwining the actions. The isomorphisms need not be unique or isometric for independently chosen real-valued norms.

**Checks.**

- Identical presentations admit the identity pair of isomorphisms.
- Conjugating the action by a topological valued-field isomorphism gives the same quotient diamond.
- For `C` the completed algebraic closure of `𝔽_p((t))`, normalize `|t|=e⁻¹` and then replace `|·|` by `|·|^√2`. With `G=1` both give the same `Spa(C,O_C)`. Their nonzero norm images are `e^ℚ` and `e^(√2ℚ)`, so there is no isometry between these normed fields.

*Needs:* `C8.24`; `DiamondsAndVStacks`, Layer D1.

(ECD Proposition 21.9, uniqueness paragraph, p.124.)

#### C8.26 Sheaves at a diamond point as discrete modules

For `Y=Spa(C,O_C)/G` as in 21.9, abelian étale sheaves on `Y` are equivalent to discrete abelian groups with continuous `G`-action. Global sections correspond to `G`-invariants.

*Needs:* `C8.24`; `C0.1`; `C0.19`; `C0.17`; `C0.16`; Tau Ceti `ProfiniteCohomology`, Layer 0.

(ECD Paragraph after Proposition 21.9, p.124.)

#### C8.27 Point cohomology is canonical continuous cohomology

Under C8.26, `Hⁱ(Y_et,F)` is naturally isomorphic to the underlying abelian group of `continuousCohomology i` on the corresponding discrete module through the `ProfiniteCohomology`, Layer `0`, `TopRep` dictionary. This holds for all `i` and commutes with coefficient maps and changes of point presentation.

*Needs:* `C8.26`; `C8.21`; `DiamondsAndVStacks`, Layer D0; `continuousCohomology`; Tau Ceti `ProfiniteCohomology`, Layer 10.

(ECD After Proposition 21.9, p.124; proof of 21.15, p.126.)

#### C8.28 Cohomological dimension at a maximal point

For a prime `ℓ` and a maximal point `y` of a quasiseparated diamond `Y, pointCd(ℓ,y)∈ENat` is `cd_ℓ(G_y)` for any faithful presentation `Y_y=Spa(C_y,O_Cy)/G_y` of the one-point subdiamond `Y_y` with `|Y_y|={y}`. The same definition applies at a maximal point of a locally spatial diamond, because `Y_y` lies in a spatial open neighbourhood and is quasiseparated; 21.16 uses it in that form, and the value does not depend on the neighbourhood. The invariant quantifies over all discrete `ℓ`-primary torsion modules; no fixed common exponent is imposed.

Require the following API.

- `pointCd_presentation`: For every faithful presentation, `pointCd(ℓ,y)=cd_ℓ(G_y)`.
- `pointCd_le_iff`: The finite bound `n` is equivalent to vanishing in degrees `>n` for all `ℓ`-primary torsion étale sheaves on `Y_y`.
- `pointCd_equiv`: Isomorphisms of pointed diamonds preserve the invariant.
- `pointCd_open`: For an open subdiamond `V⊆Y` containing the maximal point `y, pointCd` computed in `V` equals `pointCd` computed in `Y`.

**Checks.**

- `pointCd_closedField`: The algebraically closed field point `Spa(C,O_C)` has value zero.
- `pointCd_perfectedLaurentField`: Let `p` be prime and `K` be the `t`-adic completion of `⋃ₙ 𝔽_p((t^{1/pⁿ}))`. This is a perfectoid field with residue field `𝔽_p`. For the unique point `y` of `Y=Spa(K,O_K), pointCd(p,y)=1`. The Artin–Schreier class of `1` in `K/(Frob−1)K` is nonzero: any solution of `x^p−x=1` would have `|x|≤1`, and reduction to the residue field `𝔽_p` would give `0=1`. The characteristic-`p` field bound `cd_p(K)≤1` gives equality through C8.27. Thus a one-point underlying space need not have `pointCd` zero. For the upper bound, apply `SchemeAndStackFoundations`, §§2.11 and 2.15 (Artin–Schreier and field/Galois comparison), to the fixed field of a `p`-Sylow subgroup of `G_K`, then use `ProfiniteProPGroups`, Layer `6` (the pro-`p` constant-module criterion and Sylow dimension equality), with `ProfiniteCohomology`, Layer `11`.
- `pointCd_unbounded`: Nonzero `ℓ`-primary torsion cohomology in arbitrarily high degrees forces infinite `pointCd`.

*Needs:* `C8.24`; `C8.25`; `C8.27`; `DiamondsAndVStacks`, Layer D5; `SchemeAndStackFoundations`, §§2.11 and 2.15 (`artinSchreier_sequence`, `etale_galois_comparison`); Tau Ceti `ProfiniteCohomology`, Layer 11; Tau Ceti `ProfiniteProPGroups`, Layer 6.

(ECD Definition 21.10, p.124; [Stacks 0A3J](https://stacks.math.columbia.edu/tag/0A3J), Artin–Schreier sequence, and [Stacks 0A3K](https://stacks.math.columbia.edu/tag/0A3K), affine characteristic-p vanishing.)

#### C8.29 Closed inclusion of specialization stabilizers

For a spatial diamond `Y` whose underlying space is local with closed point `s` and generic point `η`, the presentation `Spa(C,C+)→Y` in 21.15 gives profinite groups `G_y` at the points. If `y′` generalizes `y`, then `G_y` embeds as a closed subgroup of `G_y′`; in particular `G_s≤G_η`.

*Needs:* `C8.24`; `DiamondsAndVStacks`, Layer D1; `DiamondsAndVStacks`, Layer D5.

(ECD Proposition 21.15, proof first two paragraphs, p.126.)

#### C8.30 Cohomology with support at the closed point

In 21.15, an abelian étale sheaf `F` with zero restriction to `Y` minus `{s}` corresponds to a discrete continuous `G_s`-module, and its cohomology is canonically the continuous cohomology of that module.

*Needs:* `C8.29`; `C8.27`; `DiamondsAndVStacks`, Layer D0; Tau Ceti `ProfiniteCohomology`, Layer 10.

(ECD Proposition 21.15, last proof paragraph, p.126.)

#### C8.31 Closed-point support and generic-point cohomological dimension

For spatial `Y` with local underlying space, closed point `s` and generic point `η`, an `ℓ`-torsion étale sheaf `F` vanishing off `s` satisfies `Hⁱ(Y,F)=0` for `i>pointCd(ℓ,η)`.

*Needs:* `C8.30`; `C8.29`; `C8.28`; Tau Ceti `ProfiniteCohomology`, Layer 11.

(ECD Proposition 21.15, p.126.)

### Wild, residue and tame bounds

#### C8.32 Cohomological dimension of a profinite extension

For an exact sequence of profinite groups `1→N→G→Q→1` with `N` closed and normal and the quotient topology on `Q, cd_ℓ(G)≤cd_ℓ(N)+cd_ℓ(Q)`. The coefficient category is all discrete `ℓ`-primary torsion modules.

*Needs:* `ArithmeticGaloisDuality`, Layer R02.1; `ArithmeticGaloisDuality`, Layer R02.2; Tau Ceti `ProfiniteCohomology`, Layer 10; Tau Ceti `ProfiniteCohomology`, Layer 11.

(ECD Proposition 21.16, final inequality, p.127.)

#### C8.33 Wild continuous automorphisms in characteristic `p`

Prove `wild_automorphism`. Let `γ` be a continuous automorphism of a complete algebraically closed nonarchimedean field `C` of characteristic `p`. If the powers `γ^(n!)` converge pointwise to the identity and `γ` induces the identity on `C×/(1+C°°)`, prove that `γ^(p^n)` also converge pointwise to the identity. The proof must establish that the closure of the powers, with the pointwise topology, is a procyclic profinite group before invoking Sylow theory.

**Checks.**

- The identity automorphism has both factorial-power and `p`-power sequences constantly equal to `x` at every `x`.
- The leading-term hypothesis quantifies over `x≠0`. At `x=0`, totalized division gives ‖`0/0−1`‖`=1`, so the strict inequality fails even for the identity.
- For the trivial group acting on `C`, the wild kernel is trivial and is `TauCeti.IsProP p`; a nontrivial kernel of a nonfaithful action cannot be discarded in C8.34.

The compact procyclic closure used in the proof comes from the pointwise topology on
automorphisms: prove that the powers of `γ` extend continuously from `ℤ` to a quotient of its
profinite completion, using factorial convergence and the isometry forced by the
leading-term condition. (ECD Lemma 21.17, p. 127.)

*Needs:* Tau Ceti `ProfiniteProPGroups`, Layer 2; Tau Ceti `ProfiniteProPGroups`, Layer 3.

(ECD Lemma 21.17 and proof, p.127.)

#### C8.34 The wild kernel is pro-`p`

Prove `wild_kernel_pro_p`. For a continuous faithful action of a profinite group `G` on an algebraically closed complete nonarchimedean field `C′` of characteristic `p`, the closed normal kernel `P` of its action on `C′×/(1+C′°°)` is pro-`p`.

*Needs:* `C8.33`; Tau Ceti `ProfiniteProPGroups`, Layer 3; `TauCeti.IsProP`.

(ECD Proposition 21.16, first proof paragraph, p.126.)

#### C8.35 Removing a pro-`p` kernel from cohomological dimension

For a closed normal pro-`p` subgroup `P` of a profinite `G` and `ℓ≠p, cd_ℓ(G)=cd_ℓ(G/P)`.

*Needs:* `C8.32`; `ArithmeticGaloisDuality`, Layer R02.1; Tau Ceti `ProfiniteCohomology`, Layer 10; Tau Ceti `ProfiniteCohomology`, Layer 11; Tau Ceti `ProfiniteProPGroups`, Layer 3.

(ECD Proposition 21.16, first proof paragraph, p.126.)

#### C8.36 The residue action as an absolute Galois group

In 21.16, for complete algebraically closed `C⊆C′` fixed by a continuous faithful profinite `G`-action, let `k⊆k′` be residue fields and `I` the kernel of the residue action. Then `k0′=(k′)^(G/I)` is perfect, `k′` is its algebraic closure, and `G/I` identifies topologically with `Gal(k′/k0′)`.

*Needs:* `C8.34`.

(ECD Proposition 21.16, residue-action paragraph, p.126.)

#### C8.37 Residue-field transcendence bound

For algebraically closed `k` of characteristic `p`, perfect `F/k` and `ℓ≠p`, apply
`ClassicalAdicEtaleCohomology`, §11.2 (`field_cohomological_dimension_transcendence`),
to `k⊂F`. Since `cd_ℓ(k)=0`, this gives `cd_ℓ(G_F)≤trdeg(F/k)`, interpreted in `ENat`,
with infinity for infinite transcendence degree. The field theorem is supplied there.

*Needs:* `ClassicalAdicEtaleCohomology`, §11.2 (`field_cohomological_dimension_transcendence`).

(ECD Proposition 21.16, residue-field bound, p.126; [Stacks 03RF](https://stacks.math.columbia.edu/tag/03RF) (Lemma 59.67.11), with Tag 03RD (Theorem 59.67.10, Tsen).)

#### C8.38 The tame-inertia character embedding

In 21.16, with rational value groups `Γ⊆Γ′` and residue fields `k⊆k′`, the tame quotient `I/P` embeds continuously into `Hom(Γ′/Γ,μ∞(k))`. If `r=dim_ℚ(Γ′/Γ)` is finite, this character group is the prime-to-`p` finite-adele group of rank `r`. The embedding is a closed embedding because `I/P` is compact.

*Needs:* `C8.34`; `C8.36`.

(ECD Proposition 21.16, tame-inertia paragraph, p.127.)

#### C8.39 Cohomological dimension of tame inertia

For `ℓ≠p` and finite `r=dim_ℚ(Γ′/Γ)` in 21.16, `cd_ℓ(I/P)≤r`.

*Needs:* `C8.38`; `C8.32`; Tau Ceti `ProfiniteCohomology`, Layer 11; Tau Ceti `ProfiniteProPGroups`, Layer 6.

(ECD Proposition 21.16, p.127.)

#### C8.40 Residue and value-group transcendence inequality

For complete algebraically closed nonarchimedean `C⊆C′`, with residue fields `k⊆k′` and value groups `Γ⊆Γ′, trdeg(k′/k)+dim_ℚ(Γ′/Γ)≤modifiedTopologicalTrdeg(C,C′)`, with finite-cardinal ranks interpreted in `ENat` and infinite ranks as infinity.

*Needs:* `C8.10`; `Algebra.trdeg`.

(ECD Proposition 21.16, final proof paragraph, p.127.)

#### C8.41 Maximal-point cohomological dimension bound

Let `f:Y→Spa(C,C+)` be a map of locally spatial diamonds, `C complete` algebraically closed of characteristic `p` and `C+` an open bounded valuation subring. For a maximal point `y` and prime `ℓ≠p, pointCd(ℓ,y)≤diamondDimTrg(f)`.

*Needs:* `C8.24`; `C8.28`; `C8.16`; `C8.17`; `C8.34`; `C8.35`; `C8.36`; `C8.37`; `C8.39`; `C8.40`; `C8.32`.

(ECD Proposition 21.16, pp.126–127.)

### Specialization chains and spatial cohomological dimension

#### C8.42 The simplicial space of specialization chains

For spectral `X`, form `sp_n(X)` from tuples `(x0,…,xn)` for which `xi` generalizes `xj` when `i≤j`, allowing repetitions, with the subspace topology from the product constructible topology. Deleting and repeating coordinates gives a simplicial topological space. The projection `γ_n` to `x0` takes values in the original topology; `γ_0` is the quasi-augmentation and the projections are not an ordinary simplicial augmentation. This chain orientation matches KST; reversing chains preserves the dimension convention of ECD 21.1.

The light carrier `SpecializationChain(X,n)` is the subtype of
`Fin(n+1)→WithConstructibleTopology X` consisting of tuples whose original `X`-points specialize
in the displayed order. Give it the subspace topology. The intended construction
`specializationChainSpace : SimplicialObject TopCat` has degree-`n` object this carrier and
reindexes coordinates along the simplex maps; prove continuity and the functor laws.
`SpecializationChain.reindex` gives monotone vertex reindexing on the light carrier, and
`SpecializationChain.reindex_comp` identifies successive reindexing with composition.
The degree-zero comparison is a homeomorphism to `WithConstructibleTopology X`. Its API
`specializationChainSpace_zero_apply` evaluates at coordinate zero, and the face and degeneracy
formulas delete and repeat their specified coordinates. For `T₀` `X`, a positive-degree chain is
nondegenerate exactly when its coordinate map is injective. These are part of the chain-space
target, with the quasi-augmentation stated below. (KST Lemma 6.6 and proof, p. 24.)

Require the following API.

- `specializationChainSpace_zero`: The degree-zero space is `X` with its constructible topology.
- `specializationChainSpace_face`: The ith face deletes the ith entry.
- `specializationChainSpace_degeneracy`: The ith degeneracy repeats the ith entry.
- `specializationChainSpace_nondegenerate`: For a `T₀` space and a positive-degree chain, absence of an elementary degeneracy preimage is equivalent to pairwise distinct vertices; degree-zero chains are all nondegenerate.

**Checks.**

- All degrees are empty for empty `X`.
- For a one-point space there is exactly one simplex in every degree and no nondegenerate positive-dimensional simplex.
- For a two-point discrete space every chain is constant; there is no nondegenerate edge.
- For a two-point spectral chain there is exactly one nondegenerate edge, whereas no nondegenerate simplex exists in degree `2`.
- For the nondegenerate Sierpiński edge `(η,s)`, taking face zero leaves `s`, while its first vertex was `η`. Hence the first-vertex maps do not form a simplicial augmentation.

*Needs:* `WithConstructibleTopology`; `CategoryTheory.SimplicialObject`; `DiamondsAndVStacks`, Layer D0.

(KST Lemma 6.6 and proof, p.24, citing Scheiderer §2, Remark 2.5, Theorem 4.1 and Proposition 4.7.)

#### C8.43 Cohomology from the quasi-augmented chain space

For spectral `X` and abelian sheaf `F` on `X, H*(X,F)` is computed by the cosimplicial section complex `Γ(sp_n(X),γ_n*F)`, whose coefficient transition maps use specialization. Its normalized subcomplex has degree-`n` sections supported on nondegenerate chains.

*Needs:* `C8.42`; `EnhancedDerivedSheaves`, Layer E2.

(KST Lemma 6.6 and proof, p.24, citing Scheiderer §2, Remark 2.5, Theorem 4.1 and Proposition 4.7.)

#### C8.44 Spectral-space cohomological dimension

Prove `spectralCohomologicalBound`. For spectral `X` with `topologicalKrullDim X≤d, d` natural, and any abelian sheaf `F` on `X, Hⁱ(X,F)=0` for `i>d`.

*Needs:* `C8.1`; `C8.43`.

(KST Lemma 6.6 and proof, p.24, citing Scheiderer §2, Remark 2.5, Theorem 4.1 and Proposition 4.7.)

#### C8.45 Dimension drop at the boundary of an open stratum

In the constructible-stratum reduction of 21.11, the boundary `B=closure(V minus U) minus V` satisfies `dim B<dim(Y minus U)` whenever the latter dimension is finite and the boundary is nonempty. Here `V` is quasicompact open and `U` is the open on which `F` vanishes.

*Needs:* `C8.1`; `DiamondsAndVStacks`, Layer D0.

(ECD Proposition 21.11, first proof paragraph on p.125.)

#### C8.46 Constructible reduction with controlled support

To prove the 21.11 bound for an `ℓ`-primary torsion sheaf `F` vanishing on open `U`, it suffices to treat `F=F0/j_U!F0|U` with `F0` constructible and supported on one locally closed constructible stratum `S=V∩Z0`, where its pullback to any strictly totally disconnected cover is constant finite `ℓ`-torsion on the stratum.

*Needs:* `C7.7`; `C7.11`; `C7.1`; `DiamondsAndVStacks`, Layer D0; `C5.1`; `C5.3`.

(ECD Proposition 21.11, proof p.124.)

#### C8.47 The local stalk bound for topological direct image

In ECD Proposition 21.11, after C8.46 and replacement by a closed support `Z`, for `g:Y_et→|Y|` the sheaves `R^i g_*F` vanish for `i>sup_y pointCd(ℓ,y)`, with `y` ranging over maximal points.

*Needs:* `C8.46`; `C8.23`; `C8.31`; `C0.18`; `C0.6`; `C0.7`; `DiamondsAndVStacks`, Layer D5.

(ECD Proposition 21.11, final proof paragraph, p.125.)

#### C8.48 Cohomological dimension of a spatial diamond

Fix a spatial diamond `Y`, a prime `ℓ`, an open `U ⊂ Y` and an étale sheaf `F` of `ℓ`-primary torsion groups whose restriction to `U` is zero. If `d` bounds the topological dimension of `|Y| ∖ |U|` and `e` bounds `pointCd(ℓ, y)` at every maximal point, prove `Hⁱ(Y, F) = 0` for `i > d + e`. Equivalently the bound is the support dimension plus the supremum of maximal-point dimensions. Empty support gives `F = 0`; infinite values give no finite vanishing range.

*Needs:* `C8.46`; `C8.45`; `C8.23`; `C8.47`; `C8.44`; `DiamondsAndVStacks`, Layer D0.

(ECD Proposition 21.11 and Remark 21.12, pp.124–125.)

### Partially proper analytic dimension

#### C8.48a Analytic field-pair partial properness

Define `analyticFieldPairPartiallyProper` for a map `f:X→Y` of arbitrary analytic adic
spaces: for every complete nonarchimedean `T` and open bounded valuation subring
`T⁺⊆O_T`, the map
`X(T,T⁺)→X(T,O_T)×_{Y(T,O_T)}Y(T,T⁺)`
is bijective. No finite-type hypothesis enters this predicate.

For analytic `f` over `Spa(ℤ_p,ℤ_p)`, assume relative tautness: for every affinoid open
`W⊂Y`, the space `|f⁻¹(W)|` is taut, meaning quasiseparated with quasicompact closures of
quasicompact opens. Prove `analyticFieldPairPartiallyProper_diamondification`: under
this hypothesis the field-pair predicate is equivalent to partial properness of `f^◇` in
C4.5. Apply C4.18 to `f⁻¹(W)^◇→W^◇` using D6's underlying-space homeomorphisms and the
field-test reduction below, and glue over target opens. Conversely, partial properness of
`f^◇` implies this relative tautness by C4.18 on each `W^◇`. Thus the unrestricted
characterization has both relative tautness and field-pair lifting on the analytic side.
On the Huber domain stated in
`AdicEtaleGeometry`, A2.1, compare this predicate with its supplied Huber valuative criterion.

**Checks.**

- Every analytic identity is relatively taut, satisfies the bijection and has partially proper diamondification: the preimage of an affinoid open is that affinoid.
- `Spa(ℂ_p,O_ℂ_p)→Spa(ℚ_p,ℤ_p)` is relatively taut and satisfies the field-pair criterion despite failing local `+`weak finite type: its source is one point and its residue extension is algebraic over `𝔽_p`, so every extended valuation subring containing `ℤ_p` contains `O_ℂ_p`.
- The closed unit disc over an algebraically closed nonarchimedean field fails the criterion. At a Gauss point its coordinate has rank-one norm `1`; refining by the valuation at infinity of the residue coordinate makes the coordinate unbounded, so the rank-one map does not extend to that field pair.
- Let `K` be the completed algebraic closure of `𝔽_p((u))`, with residue field `k=𝔽̄_p`,
  and `C` the completed algebraic closure of the radius-one Gauss completion of `K(t)`.
  Its residue field `k̃` is an algebraic closure of `k(t)`. For every nontrivial valuation
  subring `V⊂k̃` trivial on `k`, let `C_V⁺` be its inverse image in `O_C`. These `V` have rank
  one and are infinite in number, including extensions of the valuations at `t−`a.
  Glue the two-point perfectoid spaces `X_V=Spa(C,C_V⁺)` along their common open
  `η=Spa(C,O_C)`. The resulting `X→Spa(K,O_K)` is quasiseparated, since distinct charts
  intersect in `η`, and satisfies the field-pair predicate: for every embedding `C→T`,
  the inverse image of a compatible `T⁺` is `O_C` or exactly one `C_V⁺`, giving a unique
  extension through `η` or `X_V`. But `closure{η}=X` has no finite subcover by the `X_V`.
  Thus `X` is not relatively taut and its diamondification is not partially proper by
  C4.18, although all complete-field tests have unique lifts.

*Needs:* `C4.5`; `C4.18`; `ClassicalAdicEtaleCohomology`, §3.1 (taut spaces);
`DiamondsAndVStacks`, D6.4 and D6.8 (analytic diamondification and underlying spaces);
`AdicEtaleGeometry`, A2.1 only on its stated Huber domain; the field-test reduction below.

(CS17 Remark 4.2.20, p.712; ECD Proposition 18.10 and proof, pp.106–107;
ECD Proposition 15.4 and Lemma 15.6, pp.90–91.)

**Perfectoid field-test reduction** (`analyticFieldPairPartiallyProper_iff_perfectoidTests`).
For analytic `f:X→Y` over `Spa(ℤ_p,ℤ_p)`, the unrestricted field-pair predicate is
equivalent to the same bijections tested only on perfectoid fields `T` of characteristic
`0` or `p`. These in turn are exactly the characteristic-`p` perfectoid field tests for
`f^◇` over `Spd ℤ_p`, with their marked untilts and all open bounded valuation subrings.

For the reduction from arbitrary `T`, take its completed algebraic `closure C` and extend
the residue valuation defining `T⁺` to the residue field of `C`. Its inverse image `C⁺⊂O_C`
is open bounded and satisfies `C⁺∩T=T⁺`; `C` is perfectoid. A lift over `(C,C⁺)` lands in
an affinoid neighborhood of its closed-point image. The given rank-one map already
defines that affinoid's ring map into `T`. The equality `C⁺∩T=T⁺` descends its boundedness
to `T⁺` and hence supplies the analytic lift over `(T,T⁺)`. Uniqueness is detected after
this field extension. Tilting and the marked-untilt description then identify the
perfectoid tests with those for `f^◇`. (CS17 Remark 4.2.20, p.712; ECD Definition 15.5
and Lemma 15.6, p.91; Conrad Theorem 1.1, pp.1–2; Stacks Tag 00IA, valuation
domination applied to residue fields.)

**Checks.**

- For `T` already complete algebraically closed, take `C=T` and `C⁺=T⁺`; the reduction is the identity.
- For `T=ℚ_p` and `T⁺=ℤ_p`, take `C=ℂ_p` and `C⁺=O_ℂ_p`; the mixed-characteristic test is identified with the test on its characteristic-`p` tilt and the specified untilt.
- For a perfectoid `C` whose residue field has a nontrivial valuation `V`, retain the higher-rank plus ring `C⁺` given by its inverse image in `O_C`. The open immersion `Spa(C,O_C)→Spa(C,C⁺)` has no lift in the square with both horizontal maps identities, so tests with maximal plus rings alone do not suffice.

*Needs:* `PerfectoidSpaces`, P1 (tilts and untilts of perfectoid fields) and P3.7 (`isPerfectoidField_of_isAlgClosed`);
`DiamondsAndVStacks`, D6.1 and D6.4 (marked untilts and analytic diamondification);
`LocalSubring.exists_le_valuationSubring`; `ValuationSubring.comap`.

#### C8.49 Dimension of a rank-one closure in a partially proper adic space

Let `X` be an analytic adic space whose structure map to `Spa(K,O_K)` satisfies `analyticFieldPairPartiallyProper` of C8.48a, `K complete` nonarchimedean with residue field `k`. For rank-one `x∈X`, the topological dimension of `closure{x}` equals `trdeg(k(x)/k)`, where `k(x)` is the residue field of `O_K(x)` for the completed residue field `K(x)`. This uses the field-pair predicate alone, through the residue valuation space; relative tautness is needed when invoking C8.48a's diamondification comparison.

*Needs:* `C8.1`; `C8.48a`; `Algebra.trdeg`.

(CS17 Proposition 4.2.19 and proof, pp.711–712.)

#### C8.50 Dimension of a partially proper adic space

For analytic `X` whose structure map to `Spa(K,O_K)` satisfies `analyticFieldPairPartiallyProper` of C8.48a, `dim X` is the supremum of `trdeg(k(x)/k)` over its points. The supremum convention includes empty `X` and infinite dimension; any asserted finite maximum must be justified by attainment. This uses the field-pair conclusion of C8.49.

*Needs:* `C8.49`; `C8.48a`.

(CS17 Proposition 4.2.19 and proof, pp.711–712.)

#### C8.51 Closure dimension along a partially proper analytic map

For a map `f:X→Y` of analytic adic spaces whose structure maps to `Spa(K,O_K)` both satisfy `analyticFieldPairPartiallyProper` of C8.48a, rank-one `x∈X` and `y=f(x), dim closure_X{x}=dim closure_Y{y}+dim closure_(X_y){x}`. Closures here are topological closures; `X_y` is the fibre over the rank-one point. The field-pair predicate suffices for the residue-field dimension calculations.

*Needs:* `C8.49`; `C8.48a`; `Algebra.trdeg`; `trdeg_add_eq`.

(CS17 Proposition 4.2.21 and proof, p.712.)

### Examples

For the empty space topological dimension is bottom; for a nonempty identity map fibre dimension is zero. A map to a point has fibre dimension equal to the dimension of its source. The dense algebraic closure of `ℚ_p` in `ℂ_p` gives generating and independent topological degree zero despite the ambient algebraic transcendence degree. In the Sierpiński space there is exactly one injective two-vertex specialization chain and no injective three-vertex chain. (ECD Definitions 21.1–21.2, p. 122; Temkin §2.1.6, p. 5; KST Lemma 6.6, p. 24.)

### Dependencies

Layers C0–C7, with C8.24–C8.30 independent of C7; `AdicSpacesPartII`, R0.11 and R0.7; `AdicEtaleGeometry`, A2.1 on its stated domain; `ClassicalAdicEtaleCohomology`, §11.2; `DiamondsAndVStacks`, Layers D0–D5; `EnhancedDerivedSheaves`, Layers E1–E2; `ArithmeticGaloisDuality`, §R02.2.1; `ProfiniteCohomology`, Layers `0, 10`–`11`; `ProfiniteProPGroups`, Layers `2, 3` and `6`; `LocalFieldsRamification`, Layer `4`.

<a id="c9"></a>

## Layer C9: Compact generation under a uniform bound

Assume one common cohomological bound throughout the chain from left completeness to compact generation. Describe the compact generators and prove both implications in the perfect-constructible characterization. Derive the finite-field and finite-dimension consequences.

### Uniform bounds and the ordinary-derived comparison

#### C9.1 Constructible sheaves and bounded filtered colimits

Let `Y` be spatial and `F` a constructible étale sheaf of `𝔽_ℓ`-vector spaces. For a filtered system `C_j` in `D_et(Y,𝔽_ℓ)`, uniformly in `D^{≥−n}` for one `n`, the canonical map `colim_j Hom(F[0],C_j)→Hom(F[0],colim_j C_j)` is an isomorphism.

*Needs:* `C7.17`; `C7.19`; `EnhancedDerivedSheaves`, Layer E2; `DiamondsAndVStacks`, Layer D0.

(ECD Proposition 20.9 and proof, pp.116–117.)

#### C9.2 The same cohomological bound on étale test objects

Let `Λ` be a commutative ring and `Y` spatial. Suppose one natural `N` satisfies `Hⁱ(Y,F)=0` for `i>N` and every étale `Λ`-module sheaf `F`. Then the same `N` works for every quasicompact separated étale `j:U→Y` and every étale `Λ`-module sheaf on `U`.

*Needs:* `C8.22`; `DiamondsAndVStacks`, Layer D0.

(ECD First proof paragraphs of 20.10 and20.17, pp.117,121.)

#### C9.3 Left completeness under the uniform bound

For `Y` and `Λ` satisfying C9.2, the unbounded ordinary enhanced derived category
`𝒟(Y_et,Λ)` is equivalent to its Postnikov completion; hence `D(Y_et,Λ)` is left-complete.
In addition to convergence for existing objects, prove the following reconstruction
statement here. For every coherent tower `(L_n)_{n≥0}` with `L_n∈𝒟^{≥−n}` and transition
maps inducing `τ^{≥−n}L_{n+1}≃L_n`, put `L=Rlim_n L_n` in `𝒟(Y_et,Λ)`. The projections
induce equivalences `τ^{≥−n}L≃L_n` for every `n`, with the prescribed coherences. In
particular `Hⁱ(L)→Hⁱ(L_n)` is an isomorphism for every integer `i≥−n`, including
negative `i`. This supplies essential surjectivity onto all coherent compatible towers;
object-wise convergence supplies full faithfulness.

Use the qc separated étale basis and its common bound `N` from C9.2. The successive
fibres are `H^{−r−1}(L_{r+1})[r+1]`; applying sections on a basis object puts their
cohomology in `[−r−1,N−r−1]`. Thus for each integer `m` the section cohomology in
both degrees `m−1` and `m` stabilizes uniformly in the basis and its basis refinements,
for example after `r≥max(0,N−m+2)`. Derived sections commute with `Rlim`; their Milnor
sequence identifies `Hᵐ(U,L)` with the stable section-cohomology value. Sheafify
this comparison on the basis at a common stabilization stage `k`, then use
`Hᵐ(L_k)≃Hᵐ(L_n)` for `k≥n` and `m≥−n`. This gives `Hᵐ(L)≃Hᵐ(L_n)` for `m≥−n`.
This argument applies to an arbitrary coherent compatible tower, without assuming
that it is already the
truncation tower of an object or that the étale topos is replete.

**Checks.**

- For a constant tower from an object in `𝒟^{≥0}`, reconstruction is that object.
- For a sheaf `F`, the tower `L_n=⊕_{0≤r≤n}F[r]` has `H^{−r}(L)=F` for every `r≥0`;
  the comparison at `n` retains all degrees `−n,…,0`, including the negative endpoint.
- With the zero ring, or empty `Y`, every compatible tower and its reconstruction is zero.
- A family of bounded-below objects without the equivalences `τ^{≥−n}L_{n+1}≃L_n`
  is not a compatible Postnikov tower and is not assigned this conclusion.

*Needs:* `C9.2`; `C0.16`; `C0.5`; `EnhancedDerivedSheaves`, §E2.3 (coherent limits and
Postnikov completion), §E2.2 (Milnor for module complexes over the point) and
§E2.4 (local cohomology comparison). Stacks Tag 0D6K supplies the section-cohomology
Milnor sequence and commutation of derived sections with `Rlim`. Tag 0D6P supplies
convergence of the truncation tower of each existing object; C9.3 supplies the
arbitrary-tower reconstruction.

(ECD Propositions 20.10 and 20.17, pp. 117, 121; Stacks Tags 0D6K–0D6P,
cohomology of derived limits on sites.)

#### C9.4 The ordinary and enhanced étale categories agree

Under the same hypotheses, the canonical comparison `D(Y_et,Λ)→D_et(Y,Λ)` is an equivalence, compatibly with the enhanced ordinary-derived comparison and adequate cutoff changes.

*Needs:* `C9.3`; `C2.5`; `EnhancedDerivedSheaves`, Layer E1.

(ECD Propositions20.10 and20.17, pp.117,121.)

#### C9.5 Global sections preserves coproducts under a uniform bound

Under the same hypotheses, for every quasicompact separated étale `U→Y, RΓ(U,−)` on `D(U_et,Λ)` commutes with arbitrary coproducts.

*Needs:* `C9.2`; `C9.3`; `DiamondsAndVStacks`, Layer D0; `EnhancedDerivedSheaves`, Layer E2.

(ECD Propositions20.10 and20.17, pp.117,121.)

### Compact generators and thick closure

#### C9.6 Compactness of étale extension-by-zero generators

Under the same hypotheses, `j!Λ` is compact for every quasicompact separated étale `j:U→Y`.

*Needs:* `C9.5`; `EnhancedDerivedSheaves`, Layer E3; `C5.1`.

(ECD Proposition 20.17, p.121.)

#### C9.7 Étale test objects detect zero complexes

Under the same hypotheses, if `RΓ(U,A)=0` for every quasicompact separated étale `U→Y` then `A=0` in `D_et(Y,Λ)`.

*Needs:* `C9.4`; `C9.2`; `C0.7`; `C0.6`; `C0.16`; `EnhancedDerivedSheaves`, Layer E2.

(ECD Proposition 20.17, second proof paragraph, p.121.)

#### C9.8 Compact generation under bounded cohomological dimension

For spatial `Y` of bounded `Λ`-cohomological dimension, `Λ` commutative, `D_et(Y,Λ)` is compactly generated by a set of objects `j!Λ` with `j` ranging over quasicompact separated étale maps to `Y` in an adequate cutoff skeleton.

*Needs:* `C9.6`; `C9.7`; `C0.16`; `EnhancedDerivedSheaves`, Layer E3.

The topological coefficient form `compactGeneration_spectral` holds for every spectral
space `X` and commutative `Λ` with one natural bound `N` on `Hⁱ(U,F)` for all
quasicompact opens `U` and all module sheaves `F` on `X`. In the unbounded derived
category of module sheaves on `X`, the degree-zero sheaves `j_!Λ_U` are compact
generators. Its compact objects are their thick envelope, including retracts.
The signature expresses the bound as vanishing of maps `j_!Λ_U→F[0][i]` for `i>N`.
If `topologicalKrullDim X≤d` for some natural `d`, C8.44 gives such a common bound;
the generator and thick-closure arguments are those of C9.6–C9.12.

At a geometric point `Y=Spa(C,O_C)`, `compactGeneration_point` states the coefficient
specialization on `DerivedCategory (ModuleCat Λ)`: arbitrary small coproducts exist,
`Hom(Λ[0],−)` with values in abelian groups preserves them, and the shifts of `Λ[0]`
detect zero. This is the `N=0` case, for every commutative `Λ`.

**Checks.**

- On a finite-dimensional spectral space, maps from `j_!Λ_U` to `A[i]` compute `Hⁱ(U,A)`; the quasicompact open basis detects every cohomology sheaf.
- At a geometric point, maps from `Λ[0]` to `A[i]` recover `Hⁱ(A)`; vanishing in every integer degree detects zero.
- The direct sum of copies of `Λ[0]` has the direct sum of their degree-zero cohomology groups, rather than their product.
- For the zero coefficient ring the derived category is zero; the same compact-generator statement holds.

(ECD Proposition 20.17, p.121; [Stacks 09SQ](https://stacks.math.columbia.edu/tag/09SQ)
Definition 13.37.5 and [Stacks 09SR](https://stacks.math.columbia.edu/tag/09SR)
Proposition 13.37.6; [Stacks 0A3G](https://stacks.math.columbia.edu/tag/0A3G),
cohomological dimension of spectral spaces.)

#### C9.9 Compact objects are perfect-constructible

Under C9.8, every compact `A∈D_et(Y,Λ)` is perfect-constructible in the C7 sense.

*Needs:* `C9.8`; Tau Ceti `DGAInfinity`, Layer 6; `CategoryTheory.ObjectProperty.triangEnvelope`; `EnhancedDerivedSheaves`, Layer E1; `C7.22`; `C7.15`; `C7.12`.

(ECD Proposition 20.17, p.121; [Stacks 09SM](https://stacks.math.columbia.edu/tag/09SM) Lemmas 13.37.3–13.37.4 and proof of Proposition 13.37.6.)

### Perfect local systems and compact-object characterization

#### C9.10 Compactness of extensions of perfect local systems

Under the same bounded-cohomological-dimension hypotheses, `j!L` is compact when `j:U→Y` is quasicompact separated étale and `L∈D_et(U,Λ)` is locally constant with perfect values.

*Needs:* `C9.5`; `C7.12` (API `IsPerfectLocalSystem.dualizable`); `C7`; `EnhancedDerivedSheaves`, Layer E1; `C5.1`; `C3.8`; `C3.9`.

(ECD Proposition 20.17, end of proof, pp.121–122.)

#### C9.11 Perfect-constructible objects are compact

Under the same hypotheses every perfect-constructible `A∈D_et(Y,Λ)` is compact.

*Needs:* `C9.10`; `C7.22`; `C7.10`; `C5.3`; `C5.1`.

(ECD Proposition 20.17, last proof paragraph, pp.121–122.)

#### C9.12 Characterization of compact étale complexes

For a commutative `Λ` and a spatial diamond `Y` with one finite bound on `Hⁱ(Y, F)` for all étale `Λ`-module sheaves `F`, prove that `A ∈ D_ét(Y, Λ)` is compact exactly when `A` is perfect-constructible. Use the C7 predicate with perfect values; the bounded-constructible criterion is its finite-field specialization.

*Needs:* `C9.9`; `C9.11`.

At a geometric point, `compact_iff_perfect_point` states this characterization on
`DerivedCategory (ModuleCat Λ)`. Compactness is preservation of small coproducts by
abelian-group-valued `Hom(A,−)`. Perfectness is membership in
`CategoryTheory.ObjectProperty.triangEnvelope` of `Λ[0]`, including retracts,
equivalently representation by a bounded complex of finitely generated projective modules.
The spatial-diamond statement uses the C7 stratified perfectness predicate.

**Checks.**

- Finite projective coefficient modules, placed in any integer degree, are compact and perfect at a geometric point.
- Over a field, this criterion gives precisely bounded complexes with finite-dimensional cohomology at the point.
- Over `Λ=ℤ[ε]/(ε²)`, the degree-zero module `Λ/ε` is constructible but has nonzero self-Tor in every positive degree, so it is neither perfect nor compact.

(ECD Proposition 20.17, p.121; [Stacks 0ATI](https://stacks.math.columbia.edu/tag/0ATI)
Lemma 15.80.1 and [Stacks 07LT](https://stacks.math.columbia.edu/tag/07LT)
Proposition 15.80.3.)

#### C9.13 Compact complexes with finite-field coefficients

For spatial `Y` with one bound `N` on `Hⁱ(Y,F)` for all `ℓ`-torsion étale sheaves `F, A∈D_et(Y,𝔽_ℓ)` is compact iff it is bounded with constructible cohomology sheaves.

*Needs:* `C9.12`; `C7.17`.

(ECD Proposition 20.10, p.117.)

#### C9.14 Compact generation from finite dimension bounds

Let `Y` be a spatial diamond over `Spa(C,C+), C complete` algebraically closed perfectoid of characteristic `p`. Let `ℓ≠p` be prime and `d,e` natural with `dim |Y|≤d` and `diamondDimTrg(Y→Spa(C,C+))≤e`. Then one bound `d+e` works for all `ℓ`-torsion étale sheaves on `Y` and every qc separated étale test `U→Y`. Consequently `D_et(Y,𝔽_ℓ)` is left-complete and compactly generated, with compact objects precisely the bounded constructible complexes.

*Needs:* `C8.41`; `C8.48`; `C9.2`; `C9.8`; `C9.13`.

(ECD Propositions 21.11 and 21.16 combined with 20.10, pp.117,124,126.)

### Examples

For `Y=Spa(C,O_C)` and commutative `Λ`, all positive étale cohomology vanishes, so `N=0` works uniformly. The compact objects of `D_ét(Y,Λ)=D(Λ)` are exactly the perfect `Λ`-complexes. For `Λ=ℤ[ε]/(ε²)`, the constructible module `Λ/ε` is consequently not compact; bounded constructible cohomology alone does not characterize compact objects over this ring. (ECD Proposition 20.17, pp. 121–122.)

### Dependencies

Layers C0–C8; `EnhancedDerivedSheaves`, Layers E1–E3; `DGAInfinity`, Layers `5`–`6`; `DiamondsAndVStacks`, Layer D0. The cohomological bound is one `N` for all coefficient sheaves, not a varying local bound.

## Downstream consumers

`DiamondSixOperations` consumes C2–C5 and C7–C9 for exceptional direct image, exceptional
inverse image and duality. `AdicCoefficientsAndComparisons` uses the coefficient changes and
bounded-cohomological-dimension comparisons. `FarguesFontaineDiamonds` and arithmetic diamond
applications use the constructibility, point-stabilizer and geometric-dimension contracts.
Their own targets specify the additional exceptional operations, completed coefficients and
arithmetic comparisons; the four operations and étale extension by zero specified here are
independent inputs to them.
