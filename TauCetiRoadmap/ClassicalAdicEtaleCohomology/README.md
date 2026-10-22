# Roadmap: classical analytic étale cohomology

**Summary.** Starting with analytic adic geometry and the algebra of sheaves, this roadmap builds the classical cohomology needed to pass from schemes and formal models to analytic spaces. It constructs supported and ordinary cohomology, proves valuation-ring nearby-cycle comparison and invariance, and develops proper supports, normalized smooth traces and Poincaré duality. Its geometric computations cover discs, annuli, affine-space exhaustions and the boundary of a smooth curve. These are the classical inputs to étale cohomology and duality for diamonds.

## Scope and ownership

The objects here are sheaves on classical étale and pro-étale sites, including pseudo-adic support spaces. We own the coefficient-specific exactness, derived direct images, support functors, henselian comparison, formal specialization, valuation nearby cycles, analytic covering spaces and their rational monodromy, classical traces and analytic cohomology calculations. Scheme-theoretic nearby and vanishing cycles belong to `LefschetzPencilsAndVanishingCycles`, §§0.2–0.8; Section 4.5a owns their comparison with the adic generic fibre and the compatibility of finite, integral and rational coefficient comparisons with perverse structures. The distinction between nearby cycles and the vanishing-cycle `cone` is retained even when a source uses older terminology.

`TauCetiRoadmap.AdicSpaces`, `AdicSpacesPartII` (layers R0–R1), `AdicSpacesPartIII` (layers F0, R2 and R3) and `AdicSpacesPartIV` (layers R4 and R5) own Huber rings, adic spectra, analytic spaces, formal schemes and generic fibres, analytic morphism classes, analytification and vector bundles. `AdicEtaleGeometry`, layers A1, A2 and A4, owns the analytic étale and pro-étale sites, geometric points, strict localizations, finite étale descent and the analytic smoothness and dimension predicates. Their geometric constructions are supplier interfaces, not additional targets here. The extension to pseudo-adic carriers with non-analytic points needed for henselian comparison is specified in Section 1.2.

`PerfectoidSpaces`, layers P1–P5 and P7, owns perfectoid fields and spaces, tilting, analytic Yoneda and perfectoid tilde-limit refinements, completed-colimit geometry and the perfectoid étale-topos comparison. The ordinary tilde-limit predicate and its affinoid and base-change API come from `AdicSpacesPartII`, §§R0.20.1–R0.20.2; P7 supplies the analytic Yoneda and perfectoid refinements. Section 1.5 adds the qcqs pseudo-adic support variant and the locally noetherian cohomological comparison; it does not reconstruct the ordinary adic predicate or the perfectoid comparison. The perfectoid approximation in Layer 2 is an approximation for henselized generic-locus cohomology, and the approximation in Layer 7 is for geometric-field extension invariance. Neither replaces perfectoid geometric limit theory.

`AdicSpacesPartII`, §§R0.19.1–R0.19.10, supplies constructible topology, spectral limits and finite-stage opens, generic Pro categories and qcqs objects and morphisms in ordinary sheaf topoi. `DiamondsAndVStacks`, layer D0, supplies coherent-site cohomology, universes and cardinal cutoffs; its D1 supplies strictly totally disconnected perfectoid bases. `EnhancedDerivedSheaves`, §§0.1–0.4, supplies enhanced derived categories, derived tensor and internal `Hom`, replacements and coherent enhancement of derived functors. We prove the analytic hypotheses required to apply those constructions. `SchemeAndStackFoundations`, Layers 0, 2 and 4, supplies the scheme étale site, strict henselization, scheme cohomology and scheme-theoretic finiteness and comparison. `ArithmeticGaloisDuality`, layer R02.2, supplies continuous group cohomology and Hochschild–Serre; it does not supply the arbitrary-value-group Gauss extension used in Layer 5.

`EtaleCohomologyFoundations`, §§0.5–0.6, supplies the coefficient and finite-presentation descent interfaces; `EtaleCohomologyFoundations`, §§0.7–0.11, supplies the algebraic support, trace, cycle-class and duality inputs. The trait action, specialization triangle and variation maps of `LefschetzPencilsAndVanishingCycles`, layer LPV.0, are also shared. The logarithmic differential, Cartier and closed/exact differential interfaces used in the semistable filtration come from `CrystallineCohomology`, layer CR.5, Section CR.5.1, and the log de Rham–Witt interfaces from its layer CR.6, Section CR.6.1 (*Logarithmic de Rham–Witt complexes* and *Log de Rham–Witt model*). We leave integral comparison with crystalline and prismatic cohomology, primitive comparisons and diamond six operations to their own roadmaps.

`EnhancedDerivedSheaves`, §§0.1–0.4, owns ringed-site enhancements, tensor–`Hom`, coherent derived limits, module-completion comparisons and enhanced functor coherence. `EtaleCohomologyFoundations`, §§0.5–0.11, owns finite-presentation coefficient descent and algebraic support, trace, cycle-class and duality inputs; §§`F`.0–`F`.4 and `F`.6 supply constructible finite coefficients, universal-homeomorphism invariance, geometric base change, bounded ctf operations, normalized adic realization and higher Gysin operations. Its §§`G`.1–`G`.3 supply scheme compactification objects, Nagata existence and common refinements over qcqs bases. These algebraic compactifications are distinct from the analytic compactifications constructed in Layer 8.

The supplier interfaces have the following owners and domains.

`|` Interface `|` Owner and domain `|`
`| --- |` --- `|`
`|` Constructible topology and spectral limits `|` `AdicSpacesPartII`, §§R0.19.1–R0.19.8, supplies the constructible and pro-constructible calculus, specialization closure, spectral limits and finite-stage opens. `|`
`|` Generic Pro categories and qcqs topoi `|` `AdicSpacesPartII`, §§R0.19.9–R0.19.10, supplies Pro categories and the qcqs object and morphism predicates in sheaf topoi. `DiamondsAndVStacks`, D0, supplies the cohomological applications. `|`
`|` Ordinary adic tilde-limits `|` `AdicSpacesPartII`, §§R0.20.1–R0.20.2, supplies the single ordinary predicate, the affinoid and completed-colimit criteria and base change on the qcqs, adic, locally weakly finite-type domain with the required fibre products. `|`
`|` Ordinary tower algebra, ML and Milnor maps `|` `DerivedModuleAlgebra`, §`1.T`.1, supplies abelian-group shifts, `lim` and `lim¹`; `DerivedModuleAlgebra`, §1.1, supplies `DerivedDeRham.derivedLimit` and its module adapters. `EnhancedDerivedSheaves`, §0.3, compares enhanced limits with these supplied constructions. `|`
`|` Module completion and its unit `|` `DerivedModuleAlgebra`, §§1.2–1.5, supplies the completeness predicate, reflector, unit and quotient-tower comparison. `ClassicalDerived.derivedCompletion` is its `ℓ`-adic `ℤ`-module specialization with the enhanced comparison of `EnhancedDerivedSheaves`, §0.3. `|`
`|` Generic enhancement foundations and sheaf-completion refinements `|` `EnhancedDerivedSheaves`, E0, supplies the quasicategorical and dg-nerve foundations used in `EnhancedDerivedSheaves`, §0.1; its E1 compares the resulting ringed-site enhancements. Its E4 supplies completion on replete ringed topoi, the Koszul/regular-quotient comparison and coefficient reconstruction, compared with `EnhancedDerivedSheaves`, §0.3 on the point topos. `|`
`|` Abelian and derived extension by zero, with their comparison `|` `EtaleCohomologyFoundations`, §0.7, `ClassicalAlgebraic.supportLocalization`, for open immersions of arbitrary schemes and any coefficient ring; `EnhancedDerivedSheaves`, §0.4, supplies its coherent enhancement. `|`
`|` Module-valued enhanced Rf* and coefficient-forgetting coherence `|` `EnhancedDerivedSheaves`, §§0.1–0.4, `ClassicalDerived.functorCoherence` and `ClassicalDerived.functorCoherence.coefficientComparison`; the underlying abelian `D⁺` functors and Leray belong to `SchemeAndStackFoundations`, §§2.1–2.2. `|`
`|` Scheme compactification objects, Nagata existence and common refinements `|` `EtaleCohomologyFoundations`, §§`G`.1–`G`.3, for separated finite-type morphisms over qcqs bases; `EtaleCohomologyFoundations`, §0.8, consumes this geometry. `|`
`|` Compactification-independent `D⁺` torsion Rf! `|` `EtaleCohomologyFoundations`, §0.8, `ClassicalAlgebraic.properSupports`, for separated finitely presented morphisms between qcqs schemes and any coefficient ring; this includes all separated finite-type morphisms between Noetherian schemes. `|`
`|` Localization, finite-open Mayer–Vietoris and forget-supports `|` `EtaleCohomologyFoundations`, §0.7, `ClassicalAlgebraic.supportLocalization` and `ClassicalAlgebraic.supportLocalization.mayerVietoris`, on arbitrary schemes; `EtaleCohomologyFoundations`, §0.8, owns their compact-support applications and Rf!`→`Rf* on its `D⁺` torsion domain. `|`
`|` Base-change transformations and coherence `|` `EnhancedDerivedSheaves`, §0.4, owns the general transformations, including pasting; `EtaleCohomologyFoundations`, §`F`.2, owns the proper, smooth and constructible exchange theorems under their respective hypotheses. `EtaleCohomologyFoundations`, §0.8, constructs lower-shriek exchange using that proper exchange and `EtaleCohomologyFoundations`, §0.7's extension-by-zero exchange. `|`
`|` Finite-coefficient local acyclicity and ULA `|` `EtaleCohomologyFoundations`, §`F`.2, `VanishingCycles.localAcyclicity`, on bounded constructible complexes with finite invertible coefficients. Section 5.6 extends this same notion to perfect-constructible complexes with noetherian prime-power coefficient rings and supplies valuation and correspondence-duality results, with agreement on the common domain. `|`
`|` General-trait inertia and coefficient realization for Section 4.5a `|` `EtaleCohomologyFoundations`, §`F`.3a, supplies henselian-trait inertia; §§`F`.4 and `F`.8 supply normalized adic realization and field perverse structures. `LefschetzPencilsAndVanishingCycles`, §§0.7–0.8 and 6.2, supplies scheme nearby-cycle coefficient change, realization and the rectified trait perversity. `|`
`|` Nearby-cycle comparison with the adic generic fibre `|` Section 4.5a, using the completion and trait comparisons of Sections 4.4–4.5, for torsion coefficients; integral and rational forms use normalized constructible systems with uniform bounds. Specialization and every inertia element are respected. `|`
`|` Perverse compatibility of coefficient and fibre comparisons `|` Section 4.5a on the excellent-trait constructible domain with invertible finite coefficients and its integral/rational realization; integral duality exchanges `p` and `p⁺`. `LefschetzPencilsAndVanishingCycles`, §0.8a (`VanishingCycles.nearbyBettiCompatibility`) and §2.8, supplies the complex Milnor-fibre adapter on its algebraic degeneration domain. `|`

For Berkovich geometry the affinoid spectrum `M(A)` is the `Huber.GelfandSpectrum` construction of `AdicSpacesPartIII`, Section R3.9 (`gelfand-spectrum-banach-ring`), specialized to a strict affinoid Banach algebra. We own the additional gluing to Hausdorff strict analytic spaces, the taut adic comparison and its sheaf-theoretic consequences in Section 3.1. The global analytic covering and monodromy results in Layer 3 are likewise classical constructions here. This keeps their foundations independent of tropical geometry, which consumes them (`TropicalAndBerkovichArithmetic`). Existing discrete local-field ramification in `TauCetiRoadmap.LocalFieldsRamification` and `LocalGaloisGroups` remains a supplier only for its stated discrete-field scope; Layer 5 requires valuation rings of arbitrary rank. Existing algebraic vector bundles, differential geometry, integral lattices and profinite arithmetic do not provide the analytic sites, valuation supports or local-system lattice descent considered here.

## Conventions

Rings are commutative unless the coefficient statement explicitly permits an arbitrary ring. Universes are fixed so that the small étale basis has a small skeleton. A cutoff `κ` is an admissible cardinal from `DiamondsAndVStacks`, D0: uncountable strong limit of uncountable cofinality, with the subordinate strong-limit closure stated there, and large enough for the chosen base and coefficient data. A pro-étale site is used through cardinal-bounded presentations and compatible enlargement; an unbounded collection of pro-étale objects is never treated as a small site. `Sh(X,Λ)` means sheaves of `Λ`-modules. Inverse image is written `f*`, while Rf* is derived direct image. Superscripts `D+, D−` and `Dᵇ` refer to cohomological boundedness. A shift has `Hⁱ(K[r])=Hⁱ⁺ʳ(K)`. Thus `Λ(−d)[−2d]` has its only nonzero cohomology in degree 2d.

Always `n>0` when `μₙ, Z/n` or a Tate twist occurs. For residue characteristic zero the residue characteristic exponent `p` is 1; in mixed or equal positive residue characteristic it is the prime p. The condition that `n` is a unit in `O⁺` is stronger than being a unit in `O`. For a higher-rank `C⁺` with rank-one residue characteristic zero, a residual valuation on `O_C/C°°` may have positive residue characteristic `ℓ`; then `ℓ` is prime to the rank-one exponent 1 but is not a unit in `C⁺`. The plus-ring unit condition must therefore be stated independently even in residue characteristic zero. Prime-to-residue duality and arbitrary-rank base-change isomorphisms use the former; Kummer exactness and the broader smooth trace construction can use the latter. In characteristic zero, `p` is a unit in the field but not in its ring of integers. The constant sheaf is the sheafification of the constant presheaf.

For the non-analytic comparison layers, Huber’`s` standing condition means: locally the affinoid ring has a completion generated as an algebra by finitely many elements over a noetherian ring of definition, is strongly noetherian Tate, or is discrete. Algebra generation in the first alternative does not mean module finiteness: for example, `ℚ_p = ℤ_p[1/p]` belongs to it. The last case includes discrete nonnoetherian rings. The term “locally noetherian analytic” is used only in its analytic scope. (Huber (1996), §1.1, (1.1.1), p. 37.)

A geometric field pair `(C,C⁺)` has `C` complete, algebraically closed and nontrivially valued, and `C⁺` an open bounded valuation subring, possibly of higher rank. `Spa(C,C⁺)` has its full specialization chain. Its closed pseudo-adic point supplies an étale stalk; the whole field-pair space supplies a cohomological fibre. Replacing `C⁺` by `O_C` is a separate operation, never implicit. Constructibility means the classical étale notion using locally closed constructible strata in the spectral topology, not Zariski constructibility and not merely finite stalks.

For a pseudo-adic support `(X,S)`, local pro-constructibility is tested on spectral neighborhoods of points of `S`. Formal specialization uses the full inverse image `λ⁻¹L`. The open tube is its interior and is a different support. `A` tilde-limit asserts both a topological limit and density of finite-stage functions; it is not asserted to be a categorical limit. Increasing open exhaustions use derived inverse limits for ordinary cohomology, whereas shrinking neighborhoods of a closed support give filtered colimits under the continuity hypotheses.

Trace is normalized by the class of a rational point on a curve, or equivalently `c₁(O(1))` on `P¹`, having degree `+1`. For a boundary valuation with value group `Γ_C×Z`, the secondary degree is minus the second coordinate: the greatest value below 1 has degree `+1`, and the exterior boundary of a closed coordinate disc has degree `v(T)=−1`. The localization connecting map is taken from `H¹(boundary,μₙ)` to `H²_c(curve,μₙ)`; this fixes its sign relative to the point normalization. For the left monodromy action, variation is `ρ(σ)−1` and `Var(στ)=Var(σ)+Var(τ)+Var(σ)Var(τ)`. On `Q`, the scalar automorphisms `ρ(σ)=2, ρ(τ)=3` give `5=1+2+1·2`. To fix composition order, take `u=`[[1,1],[0,1]] and `v=`[[1,0],[1,1]] acting on `Z²` by left multiplication. Then uv`−1=`[[1,1],[1,0]], whereas vu`−1=`[[0,1],[1,1]]; the product term is `(u−1)(v−1)`, in that order.

## Exact supplier contracts

### From Mathlib

Use `CategoryTheory.Sheaf` on a Grothendieck topology and `ModuleCat`, `SheafOfModules`, `CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`, `CategoryTheory.Sheaf.isGrothendieckAbelian_of_essentiallySmall` and `CategoryTheory.IsGrothendieckAbelian.enoughInjectives`. These supply a Grothendieck abelian category once an essentially small analytic basis has been proved. `CategoryTheory.GrothendieckTopology.Point.presheafFiber` and `presheafToSheafCompSheafFiberIso` identify presheaf and sheaf stalks; the analytic geometric points and their conservativity are additional geometric input. Use `Functor.rightDerivedFunctorPlus`, `DerivedCategory` and `Abelian.Ext` for bounded-below derived functors and `Ext`. `Mathlib.CategoryTheory.Sites.SheafCohomology.Basic`, `.Cech` and `.MayerVietoris` supply generic sheaf cohomology and cover comparison; the analytic continuity hypotheses and support functors are proved here.

Use `HenselianRing` for an actual ring and ideal, `IsLocalRing` with `IsLocalRing.closedPoint`, `IsAdicComplete`, `PrimeSpectrum`, `PrimeSpectrum.comap`, `IsLocalHom`, `Ideal.height`, `RingHom.FaithfullyFlat`, `ValuationRing`, `ValuationSubring` with `ValuationSubring.comap`, `Valuation`, `ValuativeRel` with its strict relation `ValuativeRel.vlt`, `IsTopologicallyNilpotent`, and ordered groups with zero. Algebraic closures, separable closures, fraction rings, étale algebras and localization are their existing algebraic notions. Topological constructibility is `Topology.IsConstructible`; spectral and quasi-separated spaces use the corresponding topological predicates (`QuasiSeparatedSpace` in the definition of tautness). A constant sheaf is Mathlib's `constantSheaf`, and constancy of a sheaf is `CategoryTheory.Sheaf.IsConstant`. `Module.End`, `Submodule`, finite generation, tensor product, roots of unity and finite sums supply the algebraic parts of the lattice, variation, Kummer and boundary calculations. None of these generic definitions is reintroduced; in particular surjectivity on prime spectra, which Mathlib writes inline as `Function.Surjective (PrimeSpectrum.comap φ)`, is named `ValuationBase.IsSurjectiveValuationMap` only as that inline condition.

### From Tau Ceti

`TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic` supplies `TauCeti.ValuationSpectrum.spa`, `spa_def`, `mem_spa_iff`, `spa_antitone` and `spa_integralClosure`. The spectrum is a subset of `Spv A` formed from continuous valuative relations bounded by the explicit subring `A⁺`; no real-valued representative is chosen. `TauCeti.AlgebraicGeometry.AdicSpace.ValuationSpectrum.Basic` supplies `basicOpen`, `basicOpenFinset`, `suppFun`, the valuation pullback `TauCeti.ValuationSpectrum.comap` with `comap_vle` and `comap_vlt`, and its rational-open formula. `TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basic` supplies the rational subsets `TauCeti.ValuationSpectrum.rationalSubset`, `mem_rationalSubset_iff`, `rationalSubset_subset_spa`, `isOpen_val_preimage_rationalSubset` and `rationalSubset_image_mul_right`. `TauCeti.AlgebraicGeometry.AdicSpace.Spa.Comap` supplies `comap_mem_spa`, the map `spaComap` of adic spectra along a continuous plus-preserving ring homomorphism, and `comap_preimage_rationalSubset_inter_spa`; `TauCeti.AlgebraicGeometry.AdicSpace.Spa.HuberPair` supplies the spectrum map of a Huber-pair homomorphism and its identity, composition and continuity interfaces. `TauCeti.AlgebraicGeometry.AdicSpace.Spa.Polydisc.Basic` and `.GaussPoint` supply `closedPolydisc`, `classicalPoint`, `classicalPoint_vle` and the rank-one Gauss points `gaussPoint`; `TauCeti.AlgebraicGeometry.AdicSpace.ResidueField.Basic` supplies `residueFieldValuation`. The radial definitions of Sections 10.1–10.2, and the spectrum statements of Section 6.1, specialize these carriers and valuative relations. The Zariski–Riemann vanishing statement in `Suggested.lean` uses `ValuationSpectrum.Basic`.

`TauCeti.RingTheory.Huber.Basic`, `.PowerBounded`, `.Pair` and `.Completion` supply `f`-adic rings, pairs of definition `TauCeti.Huber.PairOfDefinition`, power-bounded and topologically nilpotent elements (`TauCeti.Huber.powerBoundedSubring` and `TauCeti.Huber.topologicallyNilpotentIdeal`, so that `Huber.IsHenselian` of Section 2.1 is Mathlib's `HenselianRing` applied to them), Huber pairs `TauCeti.Huber.Pair`, integral elements and completion. `TauCeti.RingTheory.Valuation.Microbial` supplies `Valuation.IsMicrobial`, the microbial predicate used for valuation bases in Sections 4.5 and 6.1. `TauCeti.RingTheory.RootsOfUnity.Henselian` supplies `TauCeti.rootsOfUnityResidue_surjective`, `rootsOfUnityResidue_bijective` and `rootsOfUnityEquivResidueField` for roots of unity over henselian local rings, with the torsion order a unit. Section 9.3 derives the congruent-unit root-lifting lemma needed at a boundary directly from Mathlib’`s` `HenselianRing.is_henselian`; it does not assume a general pair theorem from the local-ring roots-of-unity module.

### From geometric and derived roadmaps

The ownership statements above are exact contracts: use only the named layers and only the stated morphism and coefficient scope. In particular the analytic étale owner must supply open/finite-étale local factorization, finite étale algebra–space comparison, base change, enough geometric points of every valuation rank, the strict-local neighborhood system and coherent qcqs étale bases. Formal geometry supplies type-`(S)` formal schemes, all nilpotent thickenings, adic generic fibres, specialization, formal completion and admissible blow-ups. Scheme foundations supplies the analogous scheme constructions, normalizations and their filtered finite-presentation descent.

`EtaleCohomologyFoundations`, §§0.5–0.6, uses `SchemeAndStackFoundations`, §0.9, for noetherian approximation and constructs finite-stage descent of finitely presented spaces, relative diagrams, finite compactifications, constructible complexes and their `Hom` groups. It is not used to assert descent of a merely finite-type scheme over a nonnoetherian valuation ring. `EtaleCohomologyFoundations`, §§0.7–0.11, supplies the normalization of the algebraic trace and cycle classes, finite-étale traces, derived support localization; `EnhancedDerivedSheaves`, §0.3, defines the finite-`Tor`-amplitude notion. The determinant lines of bounded finite-projective complexes and their quasi-isomorphism, localization and base-change identifications come from `PadicMeasuresIwasawaAlgebras`, Layer 5. They are used for line-bundle extension in Section 9.3. The trait roadmap supplies the oriented fibre-product topos, nearby-cycle Galois action, vanishing triangle and variation. Section 5.5 uses this trait theory in its prime-to-residue scope; the arbitrary-torsion formal comparison of Section 4.5 is stated separately.

`EnhancedDerivedSheaves`, §§0.1–0.4, supplies coherent extension of exact inverse image and bounded-below direct images to enhanced derived categories, with derived tensor, internal `Hom` and colimit-compatible gluing. Applying this unbounded support calculus requires the local amplitude, proper étale exchange, projection and colimit statements in Layer 8. The construction is never invoked to substitute for one of those analytic proofs. The strictly totally disconnected perfectoid-base transfer in Section 10.5 likewise needs its explicit relative support comparison; it is not deduced from diamond cohomology.

For scheme coefficients, use `SchemeAndStackFoundations`, §§2.1–2.2 (`Sheaf.derivedPushforward`, `Sheaf.higherDirectImage`, `leray_spectral_sequence`) for the underlying abelian `D⁺` functors and Leray; `EnhancedDerivedSheaves`, §0.4, supplies their module-valued enhancement and coefficient-forgetting comparison. `EtaleCohomologyFoundations`, §`F`.2.1 (`VanishingCycles.properBaseChange`), supplies proper base change for every `D⁺` torsion complex, without invertibility or Noetherian hypotheses. `EtaleCohomologyFoundations`, §0.8 applies it to the chosen proper factor of `EtaleCohomologyFoundations`, §`G`.1 (`Compactification`, `DenseCompactification`), using §`G`.2 (`nagataCompactification`) for existence and §`G`.3 (`compactificationCommonRefinement`) for coherent comparison. Only finite-presentation compactification diagrams enter `EtaleCohomologyFoundations`, §0.5's descent. Constructible lower-shriek exchange and ctf preservation are the additional contracts of `EtaleCohomologyFoundations`, §§`F`.2–`F`.3; they use its `D⁺` functor. Its §`F`.4 uses the derived limits and completion of `EnhancedDerivedSheaves`, §0.3, to construct geometric adic realization, rather than identifying it with an underived limit of cohomology groups.


`AdicEtaleGeometry`, Layer A2, supplies spectral dimension, relative pure dimension and its detection on fibres over rank-one points for locally finite-type morphisms. Pure dimension `d` means dimension `d` on every nonempty open; relative pure dimension `d` means that every nonempty fibre is pure of dimension `d`. Empty fibres impose no surjectivity condition. Section 9.4 derives from A2's ball charts that a smooth map of relative pure dimension `d` has differentials of rank `d` and completed transcendence dimension `d`, that relative pure dimensions add along composites of smooth maps, and that the Berkovich realization of a smooth partially proper map is smooth of the same pure dimension; the top-degree Leray trace uses these statements. Section 8.2 defines the distinct completed transcendence dimension `dim.tr` used for universal compactifications. (Huber (1996), Definitions 1.8.1–1.8.4 and Corollary 1.8.7; Zavyalov, *`Mod`-`p` Poincaré duality*, Definition 5.3.1 and the argument after Lemma `A`.8 in Theorem 5.3.3, pp. 77–78 and Appendix `A`.)

## How to read the build

`EnhancedDerivedSheaves`, §§0.1–0.4, and `EtaleCohomologyFoundations`, §§0.5–0.11, supply enhanced derived sheaves, finite coefficient descent and algebraic trace and support inputs. Layer 1 supplies coefficient sheaves and strict-local calculations. Layer 2 proves henselian comparisons, including the perfectoid approximation needed for them, and Layer 3 uses these to control local lattices and analytic monodromy. Layer 4 constructs formal specialization, proves the inertia-equivariant adic generic-fibre and perverse coefficient comparisons of Section 4.5a, and develops semistable symbols. Layers 5 and 6 develop valuation nearby cycles and their invariance and finiteness. Layer 7 proves geometric-field extension invariance. Layer 8 first supplies geometric curve compactifications and constructs proper supports, and Layer 9 normalizes traces and proves duality, keeping the broader trace separate from prime-to-residue duality. Layer 10 computes radial regions and transfers constructibility to smooth families. Layer 11 proves algebraic comparison and the boundary argument that applies curve duality to quasi-compact opens. Each statement records any hypotheses beyond these standing conventions.

`Suggested.lean` states the Zariski–Riemann vanishing theorem of Section 2.4, the valuation-ring section-lifting theorem of Section 9.2 and the field cohomological-dimension bound of Section 11.2. Its only auxiliary definition is the constrained Zariski–Riemann locus. Other Lean names in this document specify mathematical targets; the module docstring identifies the structures needed to state the remaining headline results.

## Layer 1: Sheaves, supports and strict-local cohomology

### 1.1 Module sheaves and derived direct images

Let `X` be a locally strongly sheafy analytic adic space (`AdicEtaleGeometry`, layer A1 (`strongly-sheafy-huber-pair`)) with small étale site `X_ét` (`AdicEtaleGeometry`, layer A1 (`etale-site`)) and affinoid étale basis `X_ét^aff` (`AdicEtaleGeometry`, layer A1 (`basis-comparison`): objects isomorphic to chains `Spa(D_m) → ⋯ → Spa(D_0) = V ⊆ X` of rational localisations and finite étale pairs over open affinoids `V` of `X`). Then: (a) `X_ét^aff` is essentially small: there is a cardinal `κ(X)`, depending only on a chosen open affinoid cover `(V_α = Spa(A_α, A_α⁺))_α` of `X`, such that every object of `X_ét^aff` is isomorphic to `Spa(D, D⁺)` with `|D| ≤ κ(X)`; `(b)` consequently, for every ring `Λ`, the category `Sh(X_ét, Λ)` of sheaves of `Λ`-modules on `X_ét` is equivalent to `Sh(X_ét^aff, Λ)` (`AdicEtaleGeometry`, layer A1 (`basis-comparison`) `(c)`), has sheafification, and is a Grothendieck abelian category; in particular it has enough injectives; the same holds for sheaves of modules over any sheaf of rings `R` on `X_ét` (Mathlib `SheafOfModules`); `(c)` for `X` locally noetherian and nonempty, the pro-étale site `X_proét` (`AdicEtaleGeometry`, layer A1 (`pro-etale-site-corrected`)) is not essentially small; for every cutoff cardinal `κ` (`DiamondsAndVStacks`, layer D0 (`cutoff-cardinal`)) the full subcategory `X_proét,κ` of pro-étale objects presented by `κ`-small cofiltered diagrams of `X_ét^aff`, with the induced topology, is essentially small, closed under fibre products and under the covers of `AdicEtaleGeometry`, layer A1 (`corrected-covers-pretopology`) refined by `κ`-small ones, so `Sh(X_proét,κ, Λ)` and `Sh(X_proét,κ, R)` are Grothendieck abelian; for `κ ≤ κ′` the pullback functors `Sh(X_proét,κ, Λ) → Sh(X_proét,κ′, Λ)` along the inclusion of sites (left adjoint to restriction) are fully faithful and commute with the cohomology functors `Hⁱ(U, −)` of objects `U` of `X_ét`, and sheaves and cohomology on `X_proét` are defined as the colimit over `κ`.

This uses `X` locally strongly sheafy analytic; for `(c) X` locally noetherian analytic; `Λ` an arbitrary ring; `R` an arbitrary sheaf of rings on the site in question; The cardinal bound is a size statement, not a finiteness statement: `X` need not be quasi-compact.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, §8.2, before Proposition 8.2.20, p. 163; Scholze, Étale cohomology of diamonds, §7, proof of Lemma 7.18, p. 36; Scholze, Étale cohomology of diamonds, §14, before Proposition 14.10, p. 86.)

For `X = Spa(K, K⁺)` with `K` a complete nonarchimedean field and `K⁺` of rank one, `X_ét^aff` is equivalent to the opposite of the category of finite étale `K`-algebras, which is essentially small, and `Sh(X_ét, Λ)` is equivalent to the category of discrete `Gal(K^sep/K)`-modules over `Λ`. `Sh(X_ét, Λ)` has enough injectives, so Mathlib's `Functor.rightDerivedFunctorPlus` applies to `Γ(U, −)` and to `g_*`.

*Needs:* `AdicEtaleGeometry`, layer A1 (`basis-comparison`); `AdicEtaleGeometry`, layer A1 (`etale-site`); `AdicEtaleGeometry`, layer A1 (`strongly-sheafy-huber-pair`); `AdicEtaleGeometry`, layer A1 (`pro-etale-site-corrected`); `AdicEtaleGeometry`, layer A1 (`corrected-covers-pretopology`); `AdicEtaleGeometry`, layer A1 (`proetale-coherence`); `AdicEtaleGeometry`, layer A1 (`profinite-set-objects`); `DiamondsAndVStacks`, layer D0 (`cutoff-cardinal`); `DiamondsAndVStacks`, layer D0 (`completion-cardinality-bound`); Mathlib CategoryTheory.Functor.IsDenseSubsite.sheafEquiv; Mathlib `CategoryTheory.Sheaf.isGrothendieckAbelian_of_essentiallySmall`; Mathlib SheafOfModules; Mathlib CategoryTheory.IsGrothendieckAbelian.enoughInjectives; Mathlib ModuleCat.

Let `X` be a locally strongly sheafy analytic adic space with small étale site `X_ét` (`AdicEtaleGeometry`, layer A1 (`etale-site`)) and `Λ` a ring. The category of étale sheaves of `Λ`-modules is `Sh(X_ét, Λ) :=` `Sheaf (AdicSpace.smallEtaleTopology X) (ModuleCat Λ)`; more generally for a sheaf of rings `R` on `X_ét` (the constant sheaf `Λ_X`, the structure sheaf `O_{X_ét}` of `AdicEtaleGeometry`, layer A1 (`etale-structure-sheaf`), or `O⁺_{X_ét}`) the category `Mod(X_ét, R) :=` `SheafOfModules R`; for `X` locally noetherian the same definitions on `X_proét` (`AdicEtaleGeometry`, layer A1 (`pro-etale-site-corrected`); size handled by Section 1.1). Structure: (i) `Sh(X_ét, Λ)` is Grothendieck abelian with enough injectives and `Sh(X_ét, Λ) ≃ Mod(X_ét, Λ_X)`; (ii) `Γ(U, −): Sh(X_ét, Λ) → Mod_Λ, F ↦ F(U)`, for `U ∈ X_ét`, left exact; (iii) the constant sheaf `M_X :=` sheafification of the constant presheaf `M` (Mathlib `constantSheaf`) with `Hom(M_X, F) = Hom_Λ(M, F(X))`; for every `U ∈ X_ét, M_X(U)` is the module of locally constant functions `|U| → M`; (iv) for a morphism `g: X′ → X` of locally strongly sheafy analytic adic spaces, `g_*` (sections `(g_*F)(U) = F(U ×_X X′)`) with exact left adjoint `g⁻¹` (`AdicEtaleGeometry`, layer A1 (`etale-site`) (iv)); (v) for `u: U → X` in `X_ét`, restriction `u⁻¹F = F|_U` identified with Mathlib's `overPullback` under `U_ét ≃ X_ét/U` (`AdicEtaleGeometry`, layer A1 (`slice-site`)); (vi) stalks `F_ξ` at geometric points `ξ: Spa(C, C⁺) → X` with `C⁺` of any rank (`AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`)) are exact, commute with colimits and jointly detect isomorphisms, monomorphisms, epimorphisms and zero objects (`AdicEtaleGeometry`, layer A1 (`etale-enough-points`)); (vii) change of coefficients along `Λ → Λ′` (restriction and extension of scalars); (viii) `ν⁻¹` and `ν_*` along `ν: X_proét → X_ét` (`AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`)). These are the carriers of D0's ordinary generic sheaf interface (`DiamondsAndVStacks`, layer D0) and of `EnhancedDerivedSheaves`, §0.1's module sheaves on the classical analytic étale and pro-étale sites; no second site is constructed.

This uses `X` locally strongly sheafy analytic (locally noetherian for the pro-étale clause); Coverings are A1's jointly surjective families on all points, including points of higher rank; `Λ` is any ring; torsion hypotheses on `Λ` are imposed only by the theorems that need them.

(Huber (1996), §2.1, p. 109; A. J. de Jong, M. van der Put, Étale cohomology of rigid analytic spaces, §3.2, examples of sheaves on the étale site, item 5, p. 25; Scholze, Étale cohomology of diamonds, §14, before Proposition 14.10, p. 86; A. J. de Jong, M. van der Put, Étale cohomology of rigid analytic spaces, §3.3, p. 28.)

Provide `AdicSpace.EtaleSheaf`: `Sh(X_ét, Λ) :=` Sheaf (smallEtaleTopology `X`) (ModuleCat `Λ`), for `X` locally strongly sheafy analytic and a ring `Λ`; `AdicSpace.EtaleSheaf.isGrothendieckAbelian`: `Sh(X_ét, Λ)` is Grothendieck abelian (Section 1.1); `AdicSpace.EtaleSheaf.enoughInjectives`: `Sh(X_ét, Λ)` has enough injectives; `AdicSpace.EtaleSheaf.equivSheafOfModules`: `Sh(X_ét, Λ) ≌` SheafOfModules `(Λ_X)`, the identity on underlying presheaves.

Provide `AdicSpace.EtaleSheaf.sections`: `Γ(U, −): Sh(X_ét, Λ) ⥤` ModuleCat `Λ` for `U ∈ X_ét`, additive and left exact; `AdicSpace.EtaleSheaf.const`: The constant sheaf `M_X` (constantSheaf), with constAdj : `Hom(M_X, F) ≃ Hom_Λ(M, F(X))`; `AdicSpace.EtaleSheaf.const_sections`: For every `U ∈ X_ét, Γ(U, M_X) =` locally constant functions `|U| → M`; `AdicSpace.EtaleSheaf.pushforward`: `g_*: Sh(X′_ét, Λ) ⥤ Sh(X_ét, Λ), (g_*F)(U) = F(U ×_X X′)`, the instance of A1's AdicSpace.etaleSheafPushforward with values in ModuleCat `Λ` (no new construction); `pushforward_comp: (h∘g)_* ≅ h_* ∘ g_*`.

Provide `AdicSpace.EtaleSheaf.pullback`: `g⁻¹ =` A1's AdicSpace.etaleSheafPullback with values in ModuleCat `Λ`, left adjoint to `g_*` (pullbackPushforwardAdj); the new content is its exactness (preserves finite limits); `AdicSpace.EtaleSheaf.restrict`: `u⁻¹F = F|_U` for `u: U → X` in `X_ét`, equal to overPullback under `U_ét ≃ X_ét/U` (`AdicEtaleGeometry`, layer A1 (`slice-site`), with values in ModuleCat `Λ`); `AdicSpace.EtaleSheaf.stalk`: `F ↦ F_ξ =` A1's AdicSpace.GeometricPoint.stalk `=` (point `ξ`).sheafFiber `F` with values in ModuleCat `Λ`, for a geometric point `ξ` (`C⁺` of any rank); exact and colimit preserving; `AdicSpace.EtaleSheaf.stalk_pullback`: `(g⁻¹F)_{ξ′} ≅ F_{g∘ξ′}`, natural in `F`: A1's `AdicSpace.GeometricPoint.stalk_pullback_iso` for ModuleCat `Λ` coefficients.

Provide `AdicSpace.EtaleSheaf.isIso_iff_stalk`: A morphism `φ` is an isomorphism (resp. mono, epi) iff `φ_ξ` is for every geometric point `ξ`; this is `AdicEtaleGeometry`, layer A1 (`etale-enough-points`), which states it for sheaves of modules, cited rather than reproved; `AdicSpace.EtaleSheaf.restrictScalars`: Change of coefficients along `Λ → Λ′`: restriction of scalars and its left adjoint `Λ′ ⊗_Λ −`; `AdicSpace.ProEtaleSheaf`: `Sh(X_proét, Λ)` and SheafOfModules `R` on `X_proét` (`X` locally noetherian), defined via the `κ`-small sites and colimit over `κ`; `AdicSpace.ProEtaleSheaf.nuPullback`: `ν⁻¹: Sh(X_ét, Λ) ⥤ Sh(X_proét, Λ)` left adjoint to `ν_*`, exact.

**Checks.**

- If `U ∈ X_ét` has `|U|` connected, then `Γ(U, M_X) ≅ M`; if `U = U₁ ⊔ U₂` with `|U₁|` and `|U₂|` nonempty and connected, `Γ(U, M_X) ≅ M × M`.
- For `X = ∅` every object of `Sh(X_ét, Λ)` is a zero object.
- For `Λ = ℤ, Sh(X_ét, ℤ)` is equivalent to Mathlib's sheaf category Sheaf (AdicSpace.smallEtaleTopology `X`) AddCommGrpCat on A1's topology, compatibly with sections, so Mathlib's `Sheaf.H` applies.
- For `X = Spa(K, O_K)` with `K` complete nonarchimedean and rank-one plus ring, the stalk at a geometric point over `K ⊆ C` induces an equivalence of `Sh(X_ét, Λ)` with discrete `Λ[Gal(K^sep/K)]`-modules.
- For `Λ ≠ 0` and `X = Spa(C, C⁺)` with `C` algebraically closed and `C⁺` of rank 2, the skyscraper at the closed point (`i_*Λ` for the closed point, a nonzero sheaf) has zero stalk at the rank-one geometric point `Spa(C, O_C) → X`; only the family of all geometric points detects zero sheaves.
- On the point site with coefficient map `ℤ→ℤ`/2, tensor pullback sends the injection 2:`ℤ→ℤ` to the zero endomorphism of `ℤ`/2, while inverse image on underlying abelian sheaves is the identity and is exact.

For `M ≠ 0` and `X = U ⊔ V` with `|U|, |V|` nonempty and connected, the constant presheaf `M` (value `M` on every object) is not a sheaf, while `M_X(X) = M ⊕ M`. For `X = Spa(K, O_K)` with `K` a complete nonarchimedean field (rank-one plus ring) and `ξ` given by `K ⊆ C, F ↦ F_ξ` is an equivalence of `Sh(X_ét, Λ)` with discrete `Λ[Gal(K^sep/K)]`-modules (de Jong–van der Put §3.3; `AdicEtaleGeometry`, layer A1 (`strict-localisation-analytic`) `(c)`).

*Needs:* `AdicEtaleGeometry`, layer A1 (`etale-site`); `AdicEtaleGeometry`, layer A1 (`etale-structure-sheaf`); `AdicEtaleGeometry`, layer A1 (`slice-site`); `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); `AdicEtaleGeometry`, layer A1 (`etale-enough-points`); `AdicEtaleGeometry`, layer A1 (`etale-open-map`); `AdicEtaleGeometry`, layer A1 (`etale-base-change`); `AdicEtaleGeometry`, layer A1 (`pro-etale-site-corrected`); `AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`); Section 1.1; Mathlib ModuleCat; Mathlib SheafOfModules; Mathlib CategoryTheory.constantSheaf; Mathlib CategoryTheory.presheafToSheaf; Mathlib CategoryTheory.Functor.sheafPushforwardContinuous; Mathlib CategoryTheory.Functor.sheafPullback; Mathlib CategoryTheory.Functor.sheafAdjunctionContinuous; Mathlib CategoryTheory.RepresentablyFlat; Mathlib CategoryTheory.Functor.sheafPullbackConstruction.preservesFiniteLimits; Mathlib CategoryTheory.GrothendieckTopology.overPullback; Mathlib CategoryTheory.GrothendieckTopology.Point.sheafFiber; Mathlib CategoryTheory.ObjectProperty.IsConservativeFamilyOfPoints; Mathlib `CategoryTheory.flat_of_preservesFiniteLimits`; Mathlib `CategoryTheory.lan_preservesFiniteLimits_of_flat`; Mathlib CategoryTheory.constantSheafAdj.

Let `X` be a locally strongly sheafy analytic adic space, `Λ` a ring and `R` a sheaf of rings on `X_ét`. (a) For `u: U → X` in `X_ét`, the restriction `u⁻¹: Mod(X_ét, R) → Mod(U_ét, R|_U)` has an exact left adjoint `u_`! (extension by zero: the sheafification of the presheaf left Kan extension along the forgetful functor `X_ét/U → X_ét`), hence `u⁻¹` is exact and preserves injective objects; `(b)` for `g: X′ → X`, the direct image on underlying abelian sheaves, or on sheaves with the same fixed coefficients `Λ`, has exact left adjoint `g⁻¹`, hence preserves injective objects; `(c)` consequently, for `F ∈ Mod(X_ét, R)` and `U ∈ X_ét`, the groups `Hⁿ(U, F) := R^nΓ(U, −)(F)` computed in `Mod(X_ét, R)` agree with `Hⁿ(U_ét, F|_U)` computed in `Mod(U_ét, R|_U)`, naturally in `F` and compatibly with restriction along morphisms of `X_ét`; `(d)` the same statements hold on `X_proét,κ` for `X` locally noetherian (`AdicEtaleGeometry`, layer A1 (`proetale-slice`)).

This uses `X` locally strongly sheafy analytic; `U ∈ X_ét`; `R` an arbitrary sheaf of rings for slice restriction and `(c)`, with fixed coefficients in `(b)`. The exact `f⁻¹ ⊣ f_*` argument concerns underlying sheaves or fixed coefficients. For a general ringed morphism the module pullback is `R′⊗_{f⁻¹R}f⁻¹(−)`; its tensor factor need not be exact. The coefficient-forgetting/flasque-resolution comparison below gives the module-valued higher-direct-image comparison without assuming that exactness.

(Stacks project, Tags 03F3 (Cohomology on Sites, Lemma 21.7.1) and 0730 (Lemma 21.14.2); P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, proof of Lemma 3.16, p. 20.)

For `U ⊆ X` an open subspace, `Hⁿ(U, F)` computed in `X_ét` equals `Hⁿ(U_ét, F|_U)`. For a finite étale Galois cover `π: U → X` with group `G` and `I` injective in `Sh(X_ét, Λ), Γ(U, I)` is an injective, hence `G`-acyclic, `Λ[G]`-module (in general not an induced one): `Γ(U, −)` has the exact left adjoint `M ↦ π_`!`Λ_U ⊗_{Λ[G]} M, π_`!`Λ_U` being étale-locally free of rank one over `Λ[G]`.

*Needs:* `AdicEtaleGeometry`, layer A1 (`slice-site`); `AdicEtaleGeometry`, layer A1 (`proetale-slice`); Section 1.1; Mathlib CategoryTheory.GrothendieckTopology.overPullback; Mathlib CategoryTheory.Functor.sheafPullback; Mathlib CategoryTheory.Functor.sheafAdjunctionContinuous; Mathlib `CategoryTheory.Injective.injective_of_adjoint`; Mathlib CategoryTheory.Functor.rightDerived; Mathlib CategoryTheory.InjectiveResolution.

Let `u: (C, J) → (C′, J′)` be one of the following continuous functors preserving finite limits, defining a morphism of sites `f: (C′, J′) → (C, J)` with direct image `f_*F = F ∘ u`: (1) base change `U ↦ U ×_X X′` from `X_ét` to `X′_ét` for a morphism `g: X′ → X` of locally strongly sheafy analytic adic spaces (`f = g_ét`, `AdicEtaleGeometry`, layer A1 (`etale-site`) (iv)); (2) the constant-pro-object functor `c: X_ét → X_proét` for `X` locally noetherian (`f = ν`, `AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`)); (3) base change along a morphism of locally noetherian analytic adic spaces on pro-étale sites. Let `R′` be a sheaf of rings on `C′` and `F` an `R′`-module. Then for every `q ≥ 0` the sheaf `R^q f_* F` is canonically isomorphic to the sheafification of the presheaf `U ↦ H^q(u(U), F)` on `C`, naturally in `F` and compatibly with the connecting maps. In particular `R^qν_*F` is the sheafification of `U ↦ H^q(c(U), F)` with `U` regarded as an object of `X_proét`, and `R^q g_*F` is the sheafification of `U ↦ H^q(U ×_X X′, F)`.

This uses `u` continuous and finite-limit preserving: `f⁻¹` is exact on underlying sheaves and on fixed-coefficient sheaves. For `R′`-modules the sheafification formula uses the coefficient-forgetting/flasque-resolution comparison below, rather than exactness of ringed-module tensor pullback.

(Stacks project, Tag 072W, Cohomology on Sites, Lemma 21.7.4; P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, proof of Corollary 3.17, p. 20; P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, proof of Corollary 3.17 (ii), p. 20.)

`q = 0: R⁰ f_*F = f_*F`, and the presheaf `U ↦ F(u(U))` is already a sheaf. Scholze's Corollary 3.17 (i): `R^iν_*ν^*F` is the sheaf associated to `U ↦ Hⁱ(U, ν^*F)` with `U` regarded in `X_proét`.

*Needs:* `AdicEtaleGeometry`, layer A1 (`etale-site`); `AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`); Section 1.1; Mathlib CategoryTheory.Functor.rightDerived; Mathlib CategoryTheory.presheafToSheaf; Mathlib CategoryTheory.InjectiveResolution; `AdicSpacesPartIV`, layer R4 (`proetale-site-functoriality`).

Let `(C, J)` be the étale site `X_ét` of a locally strongly sheafy analytic adic space `X`, or the `κ`-small pro-étale site `X_proét,κ` of a locally noetherian one, and `R` a sheaf of rings on it. Let forget: `Mod(C, R) → Sh(C, ℤ)` be the forgetful functor. Then: (a) every injective `R`-module `I` is acyclic for every section functor `Γ(U, −)` on abelian sheaves: `Hⁿ(U, forget I) = 0` for `n > 0` and every `U`; `(b)` hence for every `R`-module `F` and `U`, the natural map `R^nΓ(U, −)(F) → Hⁿ(U, forget F)` is an isomorphism, compatible with long exact sequences; `(c)` for a morphism of sites `g: (C′, J′) → (C, J)` induced by a continuous finite-limit-preserving functor (for example `g_ét` of `AdicEtaleGeometry`, layer A1 (`etale-site`) (iv), or `ν` of `AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`)), a sheaf of rings `R′` on `C′` and an `R′`-module `F`, the higher direct images of `F` computed in `g_*R′`-modules and in abelian sheaves agree: forget `∘ R^q g_* ≅ R^q g_* ∘` forget; in particular `Rν_*` of a sheaf of `Ô_X`-modules on `X_proét` is computed on the underlying abelian sheaf.

This uses `R` any sheaf of rings; the `Λ`-module case is `R = Λ_X`; For `(c): g_*` of `R`-modules is the direct image of the underlying abelian sheaves.

(Stacks project, Tag 072Z, Cohomology on Sites, Lemma 21.14.1, applied to coefficient forgetting; P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, proof of Lemma 3.16, p. 20; Berkovich (1993), §4.2, after Proposition 4.2.4, p. 88.)

For `R = O_{X_ét}, Hⁿ(X_ét, O_{X_ét})` computed in `O`-modules equals the cohomology of the abelian sheaf `G_a` of de Jong–van der Put §3.2. Use the generic coefficient-sheaf resolution comparison: an injective sheaf of modules is flasque and its underlying abelian sheaf is acyclic for sections. Exact forgetting therefore identifies the cohomology of the module resolution with abelian sheaf cohomology. This is the coefficient-forgetting comparison of this section, with its enhanced compatibility supplied by `EnhancedDerivedSheaves`, §0.4 (`ClassicalDerived.functorCoherence.coefficientComparison`), before the analytic Čech comparison.

*Needs:* Section 1.1; `AdicEtaleGeometry`, layer A1 (`proetale-topos-enough-points`); `AdicEtaleGeometry`, layer A1 (`etale-enough-points`); `AdicEtaleGeometry`, layer A1 (`etale-site`); `AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`); Mathlib SheafOfModules; Mathlib CategoryTheory.cechComplexFunctor.

Let `X` be a locally strongly sheafy analytic adic space, `Λ` a ring (or `R` a sheaf of rings) and `Sh(X_ét, Λ)` the Grothendieck abelian category of Section 1.1. Define: (i) `D⁺(X_ét, Λ) :=` `DerivedCategory.Plus (Sh(X_ét, Λ))`, the full subcategory of cohomologically bounded below objects of the ordinary derived category `D(X_ét, Λ) =` `DerivedCategory (Sh(X_ét, Λ))`; (ii) for `U ∈ X_ét, RΓ(U, −) := Γ(U, −)`.rightDerivedFunctorPlus: `D⁺(X_ét, Λ) → D⁺(Mod_Λ)` and `Hⁿ(U, K) := Hⁿ(RΓ(U, K))`; for a sheaf `F, Hⁿ(U, F) = R^nΓ(U, −)(F)` (Mathlib `Functor.rightDerived`), computed by any injective resolution; (iii) for a morphism `g: X′ → X` of locally strongly sheafy analytic adic spaces, `Rg_* := (g_*)`.rightDerivedFunctorPlus: `D⁺(X′_ét, Λ) → D⁺(X_ét, Λ)` and `R^q g_* F := H^q(Rg_* F) = (g_*)`.rightDerived `q (F)`; (iv) for `X` locally noetherian, `D⁺(X_proét, Λ)` and `Rν_*: D⁺(X_proét, Λ) → D⁺(X_ét, Λ)` for `ν: X_proét → X_ét` (`AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`)), and `Rf_proét`,* for morphisms of locally noetherian analytic adic spaces; the same for sheaves of `R`-modules. Normalisations: `H⁰(U, F) = F(U)`; `Hⁿ(U, F) = Hⁿ(U_ét, F|_U)` (Section 1.1); `Hⁿ(X, F) ≅ Extⁿ(Λ_X, F)` in `Sh(X_ét, Λ)` (Mathlib `Abelian.Ext`), and for `Λ = ℤ` this is Mathlib's `Sheaf.H F n`; the cohomology of `R`-modules agrees with that of the underlying abelian sheaves (Section 1.1). These are D0's ordinary derived global sections and direct images (`DiamondsAndVStacks`, layer D0) instantiated on A1's sites; the unbounded enhanced versions are supplied by `EnhancedDerivedSheaves`, §§0.1–0.4, compared in Section 1.2.

This uses `X, X′` locally strongly sheafy analytic; locally noetherian for the pro-étale clauses; Only bounded-below complexes are derived with injective resolutions; unbounded complexes use `EnhancedDerivedSheaves`, §0.2's `K`-injective replacements; No torsion hypothesis on `Λ` is needed for the definitions.

(Scholze, Étale cohomology of diamonds, §14, before Proposition 14.10, p. 86; Huber (1996), §3.5, Corollary 3.5.11, p. 206; P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, Corollary 3.17 (ii), p. 20.)

Provide `AdicSpace.EtaleDPlus`: `D⁺(X_ét, Λ) :=` DerivedCategory.Plus (EtaleSheaf `X Λ`), a full subcategory of DerivedCategory (EtaleSheaf `X Λ`); `AdicSpace.RGamma`: `RΓ(U, −) :=` (EtaleSheaf.sections `U`).rightDerivedFunctorPlus : EtaleDPlus `X Λ ⥤` DerivedCategory.Plus (ModuleCat `Λ`); `AdicSpace.RGamma.isIso_unit_of_injective`: On bounded below complexes of injectives the unit `Γ(U, I^•) → RΓ(U, I^•)` is an isomorphism; `AdicSpace.etaleCohomology`: `Hⁿ(U, F) :=` (EtaleSheaf.sections `U`).rightDerived `n F`, computed from any injective resolution (isoOfInjectiveResolution).

Provide `AdicSpace.etaleCohomology_zero`: `H⁰(U, F) ≅ F(U)`, naturally in `F`; `AdicSpace.etaleCohomology.δ`: Connecting maps `Hⁿ(U, F″) → H^{n+1}(U, F′)` for a short exact sequence, with the long exact sequence; `AdicSpace.etaleCohomology_iso_ext`: `Hⁿ(X, F) ≅ Extⁿ(Λ_X, F)` (Mathlib `Abelian.Ext`); `AdicSpace.etaleCohomology_iso_sheafH`: For `Λ = ℤ, Hⁿ(X, F) ≅ Sheaf.H F n`.

Provide `AdicSpace.etaleCohomology_restrict`: `Hⁿ(U, F) ≅ Hⁿ(U_ét, F|_U)` (Section 1.1); `AdicSpace.Rpushforward`: `Rg_* :=` (EtaleSheaf.pushforward `g`).rightDerivedFunctorPlus : EtaleDPlus `X′ Λ ⥤` EtaleDPlus `X Λ`; `AdicSpace.higherDirectImage`: `R^q g_* F :=` (EtaleSheaf.pushforward `g`).rightDerived `q F`; `R⁰ g_* = g_*`; `AdicSpace.higherDirectImage_iso_sheafify`: `R^q g_* F` is the sheafification of `U ↦ H^q(U ×_X X′, F)` (Section 1.1).

Provide `AdicSpace.Rpushforward_comp`: `R(h ∘ g)_* ≅ Rh_* ∘ Rg_*` (Section 1.3); `AdicSpace.RNu`: `Rν_* := ν_*`.rightDerivedFunctorPlus : `D⁺(X_proét, Λ) ⥤ D⁺(X_ét, Λ)` for `X` locally noetherian, and `R^qν_*`; `AdicSpace.RGamma_Rpushforward`: `RΓ(X, Rg_* K) ≅ RΓ(X′, K)`, naturally in `K ∈ D⁺(X′_ét, Λ)`; `AdicSpace.etalePullbackDPlus`: `g⁻¹: D⁺(X_ét, Λ) ⥤ D⁺(X′_ét, Λ)` induced by the exact functor `g⁻¹` on sheaves (Mathlib Functor.mapDerivedCategory, which preserves bounded-below objects), with `(h ∘ g)⁻¹ ≅ g⁻¹ ∘ h⁻¹`; likewise `ν⁻¹: D⁺(X_ét, Λ) ⥤ D⁺(X_proét, Λ)`.

Provide `AdicSpace.pullbackRpushforwardAdj`: `g⁻¹ ⊣ Rg_*` on `D⁺` (and `ν⁻¹ ⊣ Rν_*`), with unit `K → Rg_*g⁻¹K` computed on an injective resolution of `g⁻¹K`; its mates are the base-change morphisms `ν_Y⁻¹Rf_ét`,* `→ Rf_proét`,* `ν_X⁻¹` of Section 1.3 (ii); `AdicSpace.etaleCohomology_iso_cohomologyPresheaf`: For `Λ = ℤ` and `U ∈ X_ét, Hⁿ(U, F) ≅` Mathlib's Sheaf.H' `F n U =` (`F`.cohomologyPresheaf `n`)`(U)`, the `Ext` group from the sheafified free abelian sheaf on `U` (that is `j_{U!}ℤ`), naturally in `U` and `F`.

**Checks.**

- If `I ∈ Sh(X_ét, Λ)` is injective then `Hⁿ(U, I) = 0` for every `U ∈ X_ét` and `n > 0`; `Hⁿ(∅, F) = 0` for all `n`.
- For `X = Spa(K, O_K), K` complete nonarchimedean with rank-one plus ring, `Hⁿ(X, F) ≅ H^n_cont(Gal(K^sep/K), F_ξ)` (Mathlib `continuousCohomology` of the discrete module `F_ξ`).
- For `Λ = ℤ, Hⁿ(X, F) ≅` Mathlib `Sheaf.H F n` naturally in `F`, and `H⁰(X, F) ≅ F(X)` is `Sheaf.H.equiv₀`.
- For a bounded below complex `I^•` of injectives, the unit `Γ(U, I^•) → RΓ(U, I^•)` is an isomorphism in `D⁺(Mod_Λ)`.
- For `X = Spa(ℚ_p, ℤ_p)` (`p` odd), `H¹(X, ℤ/p) ≠ 0` while `H¹(X_ét, O_{X_ét}) = 0`; étale cohomology with torsion coefficients is not computed by the rational acyclicity of `O`.

For `X = Spa(K, O_K)` with `K` a complete nonarchimedean field (rank-one plus ring), `Hⁿ(X, F) ≅ H^n_cont(Gal(K^sep/K), F_ξ)` for every `F ∈ Sh(X_ét, Λ)`. For `X = Spa(ℚ_p, ℤ_p)` and `p` odd, `H¹(X, ℤ/p) ≅ H¹(Gal(ℚ̄_p/ℚ_p), ℤ/p)` is two-dimensional over `F_p`, whereas `H¹(X_ét, O_{X_ét}) = 0` (Section 1.3): acyclicity of `O` says nothing about constant torsion coefficients.

*Needs:* Section 1.1; `AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`); `AdicEtaleGeometry`, layer A1 (`etale-site`); Mathlib DerivedCategory; Mathlib DerivedCategory.Plus; Mathlib CategoryTheory.Functor.rightDerivedFunctorPlus; Mathlib CategoryTheory.Functor.rightDerivedFunctorPlusUnit; Mathlib CategoryTheory.Functor.rightDerived; Mathlib CategoryTheory.InjectiveResolution; Mathlib `CategoryTheory.Abelian.Ext`; Mathlib `CategoryTheory.Abelian.Ext.addEquiv₀`; Mathlib CategoryTheory.HasExt; Mathlib `CategoryTheory.Sheaf.H`; Mathlib `CategoryTheory.Sheaf.H.equiv₀`; Mathlib CategoryTheory.constantSheaf; Mathlib CategoryTheory.constantSheafAdj; `AdicSpacesPartIV`, layer R4 (`proetale-site-functoriality`).

### 1.2 Pseudo-adic supports and localization

Let `X` be a locally strongly sheafy analytic adic space and `S ⊆ |X|` a subset. The étale site of `(X, S)` is `(X, S)_ét := (X_ét, J_S)`: the category `X_ét` of `AdicEtaleGeometry`, layer A1 (`etale-site`) with the Grothendieck topology `J_S` in which a sieve `R` on `u: U → X` is covering iff `u⁻¹(S) ⊆ ⋃_{(f: V → U) ∈ R} f(|V|)`; equivalently, it is generated by the families `(f_i: U_i → U)` with `u⁻¹(S) ⊆ ⋃_i f_i(|U_i|)`. Properties: (i) every covering of `X_ét` is a `J_S`-covering, and the identity functor is continuous and finite-limit preserving, giving a morphism of sites `i_S: (X, S)_ét → X_ét` with `i_{S,*}` the inclusion of `J_S`-sheaves and `i_S⁻¹ = J_S`-sheafification, exact; (ii) for a geometric point `ξ` of `X` whose support lies in `S`, the fibre functor of `ξ` is a point of `(X, S)_ét`, these points form a conservative family, and `(i_S⁻¹F)_ξ = F_ξ`; (iii) `S = |X|` gives `X_ét, S = ∅` gives the trivial topos (every sheaf is terminal), and for `S = |W|` with `W ⊆ X` an open subspace, `(X, S)_ét` and `W_ét` have equivalent sheaf categories via restriction; (iv) a morphism `g: X′ → X` and `S′ ⊆ g⁻¹(S)` give a morphism of sites `(X′, S′)_ét → (X, S)_ét` by base change; (v) `T ⊆ S` gives `i_{T,S}: (X, T)_ét → (X, S)_ét` with `i_T = i_S ∘ i_{T,S}`. When `S` is convex (closed under the specialisations lying between two of its points) and locally pro-constructible — tested on spectral open neighbourhoods of the points of `S`, the convention also used by Section 4.2, under which locally closed subsets of locally spectral spaces qualify — `(X, S)` is a pseudo-adic space in Huber's sense; for `S` closed or locally closed and constructible this holds, and `(X, S)` is in general not an adic space. Extend this construction to an ambient adic space satisfying Huber’`s` standing condition without the analytic hypothesis: locally its affinoid ring either has completion generated as an algebra by finitely many elements over a noetherian ring of definition, is strongly noetherian Tate, or is discrete. Use Huber’`s` étale morphisms, their local presentation by étale scheme fibre products, and coverings jointly surjective on the chosen support. The ambient structure sheaf and its stalk valuations are retained even at points with open support. The variants with objects `(V,T)`, where `V` is étale over `X` and `T` is open in the inverse image of `S`, and with the support topology on the ambient étale site give equivalent topoi. Consequently discrete affinoids and non-analytic points in a formal adic spectrum are legitimate objects of the supported comparisons in Layer 2. The pseudo-adic carrier `AdicSpace.PseudoAdic` imposes convexity and local pro-constructibility of `S` on this support-site construction. For a closed support `Z`, its direct image is exact and fully faithful, and with open complement `U` it gives the localization triangle `j`!`j*K→K→i_Z*i_Z*K`. For an open support use the open subspace; for a closed non-open support use the supported topos, retaining the ambient space. Spectral morphisms carry this construction to inverse-image supports. In particular the fibre over the closed point of `Spa(C,C⁺)` and the boundary of a universal compactification remain pseudo-adic support spaces.

This uses For analytic `X` use the strongly sheafy étale supplier. For non-analytic `X` require the stated Huber standing condition; a discrete ring need not be noetherian. The supported site is defined for arbitrary `S`, while convex locally pro-constructible `S` gives a pseudo-adic space.

(Huber (1996), §1.1, standing condition (1.1.1), p. 37; §1.7, Corollary 1.7.3, pp. 85–86; §2.3, Definition 2.3.1, Remark 2.3.4, Lemmas 2.3.6 and 2.3.11, pp. 117–124; Scholze, Étale cohomology of diamonds, §19, Remark 19.3, pp. 108–109.)

Provide `AdicSpace.PseudoAdicSite`: The site `(X_ét, J_S)` attached to `X` and `S ⊆ |X|`; `AdicSpace.PseudoAdicSite.topology`: The Grothendieck topology `J_S` on `X_ét`; `AdicSpace.PseudoAdicSite.mem_topology_iff`: `A` sieve `R` on `U` is `J_S`-covering iff `u⁻¹(S) ⊆ ⋃_{f ∈ R} f(|V|)`; `AdicSpace.PseudoAdicSite.le_topology`: smallEtaleTopology `X ≤ J_S`.

Provide `AdicSpace.PseudoAdicSite.incl`: `i_S⁻¹` (`J_S`-sheafification, exact) `⊣ i_{S,*}` (inclusion of `J_S`-sheaves); `AdicSpace.PseudoAdicSite.point`: The point of `(X, S)_ét` attached to a geometric point with support in `S`; `AdicSpace.PseudoAdicSite.isConservativeFamily`: Geometric points with support in `S` form a conservative family of points; `AdicSpace.PseudoAdicSite.stalk_incl`: `(i_S⁻¹F)_ξ = F_ξ` for `ξ` supported in `S`.

Provide `AdicSpace.PseudoAdicSite.equivOpen`: `Sh((X, |W|)_ét) ≃ Sh(W_ét)` for an open subspace `W`; `AdicSpace.PseudoAdicSite.map`: The morphism of sites `(X′, S′)_ét → (X, S)_ét` for `g: X′ → X` with `S′ ⊆ g⁻¹(S)`, with `map_comp`; `AdicSpace.PseudoAdicSite.IsPseudoAdic`: Huber's conditions on `S`: convex and locally pro-constructible; satisfied by locally closed constructible `S`; `AdicSpace.PseudoAdic`: The carrier `(X,S)`, with `X` satisfying Huber’`s` standing condition and `S` convex and locally pro-constructible on spectral neighborhoods of its points; the analytic variant uses the strongly sheafy analytic supplier.

Provide `AdicSpace.PseudoAdic.site`: The Grothendieck topology on Et/`X` whose coverings are the families surjective over the points of `S`; `AdicSpace.PseudoAdic.restrict`: The exact functor `i_S^* : Sh(X_ét, Λ) → Sh((X, S)_ét, Λ)` and its derived version on `D⁺`; `AdicSpace.PseudoAdic.pushforward`: The fully faithful inclusion `i_{S*}` right adjoint to `i_S^*`, with `i_S^* i_{S*} ≅` id; for `S` closed it is the pushforward along the closed subset; `AdicSpace.PseudoAdic.ofClosed`: Every closed subset of `|X|` gives a pseudo-adic support space.

Provide `AdicSpace.PseudoAdic.ofOpen`: Every open subset gives a pseudo-adic support space equivalent to the open adic subspace; `AdicSpace.PseudoAdic.stalk`: Geometric points of `(X, S)` are geometric points of `X` supported in `S`; stalks of `i_S^*F` are stalks of `F`; they are conservative; `AdicSpace.PseudoAdic.recollement`: For `Z` closed with complement `U`: the triangle `j_`!`j^* →` id `→ i_{Z*}i_Z^*`; `AdicSpace.PseudoAdic.comap`: A morphism `f : X → Y` and `T ⊆ |Y|` convex locally pro-constructible give `(X, f⁻¹T) → (Y, T)` with pullback compatible with `i^*`.

Provide `AdicSpace.PseudoAdic.closedFibre`: For `f : X → Spa(C, C⁺)` the closed fibre `(X, f⁻¹(s))`.

**Checks.**

- For `S = |X|, (X, S)_ét = X_ét` and `i_S` is the identity; for `S = ∅` every sheaf on `(X, S)_ét` is a terminal object.
- For `S = |W|` with `W ⊆ X` open, restriction gives `Sh((X, S)_ét, Λ) ≃ Sh(W_ét, Λ)`, compatibly with `i_S⁻¹` and `W → X`.
- For `X = Spa(C, C⁺)` (`C` algebraically closed, `C⁺` of rank 2) and `S` the closed point, `F ↦ F_s` is an equivalence `Sh((X, S)_ét, Λ) ≃ Mod_Λ`.
- For the closed unit disc `X` over `K` and `Z = X ∖ {|T| ≤ |ϖ|}` (`ϖ` a pseudo-uniformizer of `K`), `Z` is closed, infinite and not open (the disc is connected), so it is the underlying set of no open adic subspace and of no Zariski-closed adic subspace; `i_Z⁻¹` is not restriction to an adic subspace.
- For `S = |X|` the site `(X, S)_ét` is `X_ét` and `i_S^*` is the identity.
- For `S = Spa(C, C⁺)` and its closed point `s`, global sections on `(S, {s})` is the stalk at `s` and is exact.
- In the universal compactification `B̄` of the closed disc over `Spa(C, O_C)` the boundary point `x_∞` is closed and not open: `{x_∞}` is not an adic subspace, although `(B̄, {x_∞})` is a pseudo-adic support space.
- For `Z` closed with open complement `U, j_`!`j^*K → K → i_{Z*}i_Z^*K` is a distinguished triangle in `D⁺(X_ét, Λ)`.
- For `S` open, `(X, S)_ét` is equivalent to the étale site of the open adic subspace `S`.

For `X = Spa(C, C⁺)` with `C` algebraically closed and `C⁺` of rank 2, and `S = {s}` the closed point, `Sh((X, S)_ét, Λ)` is equivalent to `Λ`-modules via the stalk at `s`. For the closed unit disc `X` over a complete nonarchimedean field `K` with pseudo-uniformizer `ϖ` and the quasi-compact open `U = {|T| ≤ |ϖ|}`, the closed complement `Z = X ∖ U` gives the pseudo-adic site `(X, Z)_ét` on which `i_Z⁻¹` is defined, although `Z` is not the underlying set of any open or closed adic subspace of `X`. For `S = Spa(C, C⁺)` and its closed point `s, Sh((S, {s})_ét)` is equivalent to the category of sets (`Λ`-modules) and `H^q((S,{s}), F) = 0` for `q > 0`. In the universal compactification `B̄ = B ∪ {x_∞}` of the closed unit disc over `Spa(C, O_C), {x_∞}` is closed and not open, so `(B̄, {x_∞})` is a pseudo-adic support space and not an adic subspace. Huber's `d(X, L) = (d(X), λ_X⁻¹(L))` of Section 4.2 is an instance with `X = d(𝔛)`.

*Needs:* `AdicEtaleGeometry`, layer A1 (`etale-site`); `AdicEtaleGeometry`, layer A1 (`etale-base-change`); `AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`); `AdicEtaleGeometry`, layer A1 (`etale-enough-points`); `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); `AdicEtaleGeometry`, layer A1 (`slice-site`); Section 1.1; Mathlib CategoryTheory.Functor.sheafPushforwardContinuous; Mathlib CategoryTheory.Functor.sheafPullback; Mathlib CategoryTheory.GrothendieckTopology.Point.

Let `C` be an algebraically closed field complete for a nontrivial nonarchimedean absolute value, `C⁺ ⊆ C` an open and bounded valuation subring of any rank `r ≥ 1, S = Spa(C, C⁺)` with closed point `s`, and `Λ` a ring. (a) For every `F ∈ Sh(S_ét, Λ), Γ(S, F) = F_{id}` is the stalk at the geometric point `id_S` (support `s`); `Γ(S, −)` is exact and commutes with all colimits. `(b) Hⁿ(S, F) = 0` for all `n > 0` and all `F`. `(c)` Every étale map `V → S` is a local isomorphism, so restriction to the opens of `|S|` is an equivalence `Sh(S_ét, Λ) ≃ Sh(|S|, Λ)`; `|S|` is the chain, under specialisation, of the valuation rings `V` with `C⁺ ⊆ V ⊆ O_C` (`r` of them when `r` is finite), and the stalk at the point `V` corresponds to the geometric point `Spa(C, V) → S`. `(d)` For a locally strongly sheafy analytic `X` and a geometric point `ξ: Spa(C, C⁺) → X, F_ξ ≅ Γ(Spa(C, C⁺), ξ⁻¹F)`, naturally in `F`. `(e)` Higher rank is retained: for `Λ ≠ 0` and `r ≥ 2` the family of stalks at the rank-one points of all such `S` does not detect nonzero sheaves (the skyscraper at `s`), and `Γ(S, F)` is the stalk at the closed point, not at the rank-one point `Spa(C, O_C)`.

This uses `C` algebraically closed complete nonarchimedean, nontrivially valued; `C⁺` open, bounded, a valuation ring of any rank; The algebraic-closure hypothesis cannot be dropped uniformly, as the `ℚ_p` example below shows.

(Scholze, Étale cohomology of diamonds, §14, proof of Proposition 14.3, p. 82; Scholze, Étale cohomology of diamonds, §7, proof of Proposition 7.16, p. 36; Huber (1996), Chapter 2 introduction, p. 108.)

`Hⁿ(Spa(C, C⁺), Λ) = 0` for `n > 0` and `H⁰ = Λ`. Non-example: for `K = ℚ_p` and `ℓ = p, H¹(Spa(K, O_K), ℤ/ℓ) = H¹(Gal(K^sep/K), ℤ/ℓ) ≠ 0`, and `Spa(L, L⁺) → Spa(K, K⁺)` is a nonsplit finite étale cover for every nontrivial finite separable extension `L` (`L⁺` the integral closure of `K⁺`).

*Needs:* `AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`); `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); `AdicEtaleGeometry`, layer A1 (`etale-enough-points`); `AdicEtaleGeometry`, layer A1 (`etale-morphism`); Section 1.1; Mathlib CategoryTheory.GrothendieckTopology.Point.sheafFiber; Mathlib IsAlgClosed; Mathlib ValuationSubring.

Let `X` be a locally strongly sheafy analytic adic space and `Λ` a ring. (i) For `u: U → X` in `X_ét`, extension by zero `u_`!: `Sh(U_ét, Λ) → Sh(X_ét, Λ)` is the left adjoint of the restriction `u⁻¹` (Section 1.1 (a)); it is exact, `(u_!G)_ξ = ⊕_{ū} G_ū` over the lifts `ū` of the geometric point `ξ` to `U`, and `u_`! `≅ u_*` when `u` is finite étale. (ii) For an open subspace `j: U ⊆ X` with closed complement `Z = |X| ∖ |U|`, let `i: (X, Z)_ét → X_ét` be the pseudo-adic site of Section 1.2; then `j_`!, `j⁻¹, j_*, i⁻¹, i_*` satisfy `j⁻¹j_! ≅` id `≅ j⁻¹j_*, i⁻¹i_* ≅` id, `j⁻¹i_* = 0, i⁻¹j_! = 0`, and `i_*` is exact. (iii) Sections with support: `ℋ_Z(F) := ker(F → j_*j⁻¹F), Γ_Z(X, F) := ker(F(X) → F(U)), i^!F := i⁻¹ℋ_Z(F)` (right adjoint of `i_*`), with derived functors `RΓ_Z(X, −), Ri^!` on `D⁺` and `H^n_Z(X, F) := Hⁿ RΓ_Z(X, F)`. (iv) For a locally closed `T = U′ ∩ Z′` (`U′` open, `Z′` closed), extension by zero from `T: i_{T,!} := j_{U′,!} ∘ (i_{Z′∩U′ ⊆ U′})_*`, exact and independent of the presentation of `T`. No closed or locally closed subset is replaced by an adic subspace: `(X, Z)` is a pseudo-adic space, not an adic space.

This uses `X` locally strongly sheafy analytic; `U` open (for (ii)–(iii)) or étale over `X` (for (i)); `Λ` an arbitrary ring.

(Stacks project, Tag 03SH (Étale Cohomology, Section 59.66); Berkovich (1993), §5.2, proof of Proposition 5.2.6, p. 100; Scholze, Étale cohomology of diamonds, §19, Remark 19.3, pp. 108–109.)

Provide `AdicSpace.EtaleSheaf.extendByZero`: `u_`!: `Sh(U_ét, Λ) ⥤ Sh(X_ét, Λ)` for `u: U → X` étale; `AdicSpace.EtaleSheaf.extendByZeroAdj`: `u_`! `⊣ u⁻¹`; `AdicSpace.EtaleSheaf.extendByZero_exact`: `u_`! preserves finite limits and colimits; `AdicSpace.EtaleSheaf.stalk_extendByZero`: `(u_!G)_ξ ≅ ⊕_{lifts ū of ξ} G_ū`; for an open immersion, `G_ξ` or 0 according as supp `ξ ∈ U`.

Provide `AdicSpace.EtaleSheaf.extendByZero_iso_pushforward_of_finiteEtale`: `u_`! `≅ u_*` for `u` finite étale; `AdicSpace.EtaleSheaf.restrict_extendByZero`: `j⁻¹j_! ≅` id for an open immersion `j`; `AdicSpace.EtaleSheaf.closedRestrict`: `i⁻¹: Sh(X_ét, Λ) ⥤ Sh((X, Z)_ét, Λ)` and `i_*`, for the closed complement `Z` of an open `U`; `AdicSpace.EtaleSheaf.sectionsWithSupport`: `ℋ_Z(F) = ker(F → j_*j⁻¹F), Γ_Z(X, F)`, and `i^! = i⁻¹ℋ_Z` with `i_* ⊣ i^!`.

Provide `AdicSpace.cohomologyWithSupport`: `H^n_Z(X, F) := Hⁿ(RΓ_Z(X, F)), RΓ_Z` the right derived functor of `Γ_Z` on `D⁺`; `AdicSpace.EtaleSheaf.extendByZeroLocallyClosed`: `i_{T,!}` for `T = U′ ∩ Z′` locally closed, independent of the presentation; `AdicSpace.EtaleSheaf.closedRestrict_extendByZero`: `i⁻¹j_! = 0` and `j⁻¹i_* = 0`.

**Checks.**

- For the quasi-compact open `j: U = {|T| ≤ |p|} ⊆ X = Spa(ℚ_p⟨T⟩), Γ(X, j_!Λ) = 0` and `Γ(X, j_*Λ) ≅ Λ`.
- For `j = id_X, j_`! `=` id and `Z = ∅`; for `U = ∅, j_`! `= 0` and `i_* i⁻¹ =` id.
- `u_`! is naturally isomorphic to Functor.sheafPullback (Over.forget `U`) with values in ModuleCat `Λ` under `U_ét ≃ X_ét/U`, and agrees with the `j_`! of `AdicSpacesPartIV`, layer R4 (`boundary-complement-restriction`) for the boundary complement of a smooth pair.
- For `Λ ≠ 0, U = {|T| ≤ |p|}` in the closed disc over `ℚ_p` and the rank-two point `x ∉ U` in the closure of `U` (a specialisation of the Gauss point of radius `|p|`), `(j_!Λ)_x = 0` but `(j_*Λ)_x ≅ Λ`, so `j_`! `≠ j_*` although `U` is quasi-compact.
- For an open immersion `j: U ⊆ X`, the natural map `j_`!`G → j_*G` is a monomorphism, and a section `s ∈ (j_*G)(V) = G(V ×_X U)` lies in `(j_!G)(V)` iff its support is closed in `|V|`; `i^!` is right adjoint to `i_*`.

For the quasi-compact open `j: U = {|T| ≤ |p|} ⊆ X =` closed unit disc over `ℚ_p: Γ(X, j_!Λ) = 0` while `Γ(X, j_*Λ) = Λ`, and `j_`!`Λ` is constructible in the sense of Section 1.4. For `U = X: j_`! `=` id, `Z = ∅` and `i⁻¹F = 0`.

*Needs:* Section 1.1; Section 1.2; `AdicEtaleGeometry`, layer A1 (`slice-site`); Mathlib CategoryTheory.Functor.sheafPullback; Mathlib CategoryTheory.GrothendieckTopology.overPullback; `AdicSpacesPartIV`, layer R4 (`boundary-complement-restriction`); `AdicEtaleGeometry`, layer A1 (`etale-diagonal`); `AdicEtaleGeometry`, layer A1 (`finite-etale-local-to-global`).

Let `X` be a locally strongly sheafy analytic adic space and `Λ` a ring; let `D(X_ét, Λ) =` `DerivedCategory (Sh(X_ét, Λ))`, `D⁺(X_ét, Λ) ⊆ D(X_ét, Λ)` the full subcategory of Section 1.1, and `𝒟(X_ét, Λ)` the enhanced derived category of `EnhancedDerivedSheaves`, §0.1, whose homotopy category is `D(X_ét, Λ)`. Then: (a) for `F, G ∈ Sh(X_ét, Λ)` and `n ≥ 0, Extⁿ(F, G)` (Mathlib `Abelian.Ext`) `≅ Hom_{D(X_ét, Λ)}(F, G[n]) ≅ Hom_{D⁺(X_ét, Λ)}(F, G[n]) ≅ π_0 Map_{𝒟(X_ét, Λ)}(F, G[n])`; in particular `Hⁿ(U, G) ≅ π_0 Map_𝒟(j_{U!}Λ, G[n])` for `U ∈ X_ét`, with `j_{U!}Λ` the extension by zero of Section 1.2; `(b)` a bounded below complex of injective sheaves is `K`-injective, so for `K ∈ D⁺(X_ét, Λ)` the value `RΓ(U, K)` of the `D⁺` right derived functor agrees with `EnhancedDerivedSheaves`, §0.1's enhanced `RΓ(U, K)` computed by `K`-injective replacement (`EnhancedDerivedSheaves`, §§0.1–0.4 (`K`-injective and `K`-flat replacements)), and likewise `Rg_*K` and `Rν_*K`; `(c)` the comparisons in (a)–`(b)` are compatible with composition (Yoneda product), with the connecting maps of long exact sequences and with `g⁻¹`. Consequently every classical statement of Layers 1–11 formulated in `D⁺` is a statement about `EnhancedDerivedSheaves`, §0.1's enhanced objects restricted to bounded-below complexes, and conversely.

This uses `Λ` an arbitrary ring; the enhanced category is `EnhancedDerivedSheaves`, §0.1's for the ringed site `(X_ét, Λ_X)`; Only bounded-below complexes are claimed to be computed by injective resolutions.

(Scholze, Étale cohomology of diamonds, §17, proof of Lemma 17.1, p. 96; Scholze, Étale cohomology of diamonds, §14, before Proposition 14.10, p. 86.)

For `U = X` and `G = Λ_X: Hⁿ(X, Λ) ≅ π_0 Map_𝒟(Λ_X, Λ_X[n])`. The comparison is required for the passage from Huber's `D⁺` statements (Layers 2–9) to ECD's unbounded `D_ét` on the diamond side.

*Needs:* Section 1.1; Section 1.2; `EnhancedDerivedSheaves`, §§0.1–0.4 (the enhanced derived category); `EnhancedDerivedSheaves`, §§0.1–0.4 (`K`-injective and `K`-flat replacements); `EnhancedDerivedSheaves`, §§0.1–0.4 (module sheaves and the Grothendieck property); Mathlib `CategoryTheory.Abelian.Ext`; Mathlib DerivedCategory; Mathlib DerivedCategory.Plus; Mathlib CochainComplex.IsKInjective; Mathlib `CochainComplex.isKInjective_of_injective`; Mathlib `CochainComplex.IsKInjective.quasiIso_iff`.

Let `X` be a locally strongly sheafy analytic adic space, `j: U ⊆ X` an open subspace with closed complement `Z` and `i: (X, Z)_ét → X_ét` (Section 1.2). (a) For a geometric point `ξ` of `X` with support `x: (j_!G)_ξ = G_ξ` if `x ∈ U` and 0 if `x ∈ Z`; `(i_*H)_ξ = H_ξ` if `x ∈ Z` and 0 if `x ∈ U`. `(b)` For `F ∈ Sh(X_ét, Λ)` the sequence `0 → j_`!`j⁻¹F → F → i_*i⁻¹F → 0` is exact. `(c)` For `K ∈ D⁺(X_ét, Λ)` there are distinguished triangles `j_`!`j⁻¹K → K → i_*i⁻¹K →` and `i_*Ri^!K → K → Rj_*j⁻¹K →`, and a long exact sequence `⋯ → H^n_Z(X, K) → Hⁿ(X, K) → Hⁿ(U, K) → H^{n+1}_Z(X, K) → ⋯`, natural in `K`. `(d)` For an injective sheaf `I, Γ(X, I) → Γ(U, I)` is surjective.

This uses `U` open, `Z` its closed complement; supports of geometric points are points of `|X|`.

(Berkovich (1993), §5.2, proof of Proposition 5.2.6, p. 100; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §2.1, after Proposition 2.3, p. 5.)

For `X = Spa(C, C⁺)` with `C⁺` of rank 2, `U =` the generic point and `Z =` the closed point: `H^0_Z(X, Λ) = 0, H^1_Z(X, Λ) = 0`, since `Hⁿ(X, Λ) → Hⁿ(U, Λ)` is an isomorphism (both spaces have trivial étale cohomology in positive degrees and `Γ = Λ`). The Berkovich analogue: Berkovich Proposition 5.2.6 (ii) and Corollary 5.2.7.

*Needs:* Section 1.2; Section 1.1; `AdicEtaleGeometry`, layer A1 (`etale-enough-points`); `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); Mathlib CategoryTheory.GrothendieckTopology.Point.sheafFiber.

### 1.3 Descent and the étale–pro-étale comparison

Let `g: X′ → X` and `h: X → X″` be morphisms of locally strongly sheafy analytic adic spaces and `Λ` a fixed coefficient ring. (a) `g_*` sends injective objects of `Sh(X′_ét, Λ)` to injective objects, and the natural map `R(h ∘ g)_* → Rh_* ∘ Rg_*` of functors `D⁺(X′_ét, Λ) → D⁺(X″_ét, Λ)` is an isomorphism; in particular `RΓ(X, Rg_*K) ≅ RΓ(X′, K)`. `(b)` For `F ∈ Sh(X′_ét, Λ)` there are convergent first-quadrant spectral sequences `E_2^{pq} = Rᵖ h_* R^q g_* F ⇒ R^{p+q}(h ∘ g)_* F` and `E_2^{pq} = Hᵖ(X, R^q g_* F) ⇒ H^{p+q}(X′, F)`, functorial in `F`. `(c)` For `X` locally noetherian the same holds for `ν: X_proét → X_ét` and for composites of pro-étale and étale direct images: `Hᵖ(X_ét, R^qν_*F) ⇒ H^{p+q}(X_proét, F)`, and `R(f_ét,* ∘ ν_{X,*}) ≅ Rf_ét`,* `∘ Rν_{X,*} ≅ Rν_{Y,*} ∘ Rf_proét`,* for `f: X → Y`. These are the Leray spectral sequences of `DiamondsAndVStacks`, layer D0, Section D0.19 on A1's sites.

This uses `g, h` arbitrary morphisms of locally strongly sheafy analytic adic spaces (locally noetherian for the pro-étale clauses); `F` bounded below (a sheaf, or an object of `D⁺`); no torsion hypothesis. For ringed-module coefficients the composition and cohomology comparisons follow from Section 1.1’`s` coefficient-forgetting comparison and total acyclicity of pushforwards of injectives (Stacks Tag 072Z); preservation of injectives in (a) is the fixed-coefficient assertion.

(Berkovich (1993), §5.2, Theorem 5.2.2, p. 98; Berkovich (1993), §5.2, proof of Theorem 5.2.2, p. 98.)

For `g = ν` and `F = ν^*F′: E_2^{pq} = Hᵖ(X_ét, R^qν_*ν^*F′) ⇒ H^{p+q}(X_proét, ν^*F′)` degenerates (Section 1.3), giving `Hⁿ(X_ét, F′) = Hⁿ(X_proét, ν^*F′)`. For `g: X′ → X` finite étale, `R^q g_* F = 0` for `q > 0` (stalks are finite products of stalks of `F`, Section 1.5), and the spectral sequence gives `Hⁿ(X, g_*F) = Hⁿ(X′, F)`.

*Needs:* Section 1.1; `AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`); `DiamondsAndVStacks`, layer D0, Section D0.19; Mathlib CategoryTheory.Functor.rightDerivedFunctorPlusUnit; Mathlib CategoryTheory.Abelian.SpectralObject.spectralSequence; Mathlib `CategoryTheory.Injective.injective_of_adjoint`; `DiamondsAndVStacks`, layer D0; `AdicSpacesPartIV`, layer R4 (`proetale-site-functoriality`).

Let `X` be a locally strongly sheafy analytic adic space and `(C, J)` its étale site `X_ét`, or, for `X` locally noetherian, its `κ`-small pro-étale site `X_proét,κ`. Let `F` be a sheaf of `Λ`-modules (or `R`-modules) and `𝔘 = (U_i → U)_{i∈I}` a covering in `C`, with fibre products `U_{i₀⋯i_p} = U_{i₀} ×_U ⋯ ×_U U_{i_p}`. (a) There is a convergent first-quadrant spectral sequence `E_2^{pq} = Ȟᵖ(𝔘, ℋ^q(F)) ⇒ H^{p+q}(U, F)`, where `ℋ^q(F)` is the presheaf `V ↦ H^q(V, F)` and `Ȟᵖ` is the cohomology of the Čech complex of `𝔘` (Mathlib `cechComplexFunctor` applied in the slice category `C/U`, whose finite products are the fibre products over `U`); the edge map `Ȟᵖ(𝔘, F) → Hᵖ(U, F)` is an isomorphism for `p = 0`, injective for `p = 1`, and an isomorphism for all `p` if `H^q(U_{i₀⋯i_p}, F) = 0` for all `q > 0` and all (`i₀`, …, `i_p`) (Leray acyclicity). `(b)` If `B ⊆ C` is a full subcategory stable under the fibre products occurring in Čech nerves, every covering of an object of `B` is refined by a covering by objects of `B`, and `Ȟ^q(𝔙, F) = 0` for `q > 0` for every covering `𝔙` in `B` of an object of `B`, then `H^q(V, F) = 0` for all `V ∈ B` and `q > 0`, and Čech cohomology on `B`-coverings computes `H^*(U, F)` for `U ∈ B`. For `X_ét, B` may be taken to be the stable affinoid basis `X_ét^aff` (`AdicEtaleGeometry`, layer A1 (`basis-comparison`)), and it suffices to test the Čech condition on rational coverings and on single faithfully finite étale maps (`AdicEtaleGeometry`, layer A1 (`etale-covering-reduction`); Kedlaya–Liu Proposition 8.2.21).

This uses Coverings as in A1 (jointly surjective families; corrected coverings on `X_proét`); In `(b) B` is stable under the fibre products occurring in Čech nerves.

(A. J. de Jong, M. van der Put, Étale cohomology of rigid analytic spaces, §2.5, proof of Proposition 2.5.4, p. 12; K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, §8.2, Proposition 8.2.21, p. 164; K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, §8.2, Proposition 8.2.21, p. 165.)

Čech complex of a two-member rational (Laurent) covering of an affinoid computes `H^*(U, F)` for every `F` that is acyclic on affinoid étale objects. For a finite étale Galois covering `U → X` with group `G`, the Čech complex is the complex of inhomogeneous cochains of `G` with values in `F(U)` (Section 1.3).

*Needs:* `DiamondsAndVStacks`, layer D0, Section D0.19; `AdicEtaleGeometry`, layer A1 (`basis-comparison`); `AdicEtaleGeometry`, layer A1 (`etale-covering-reduction`); `AdicEtaleGeometry`, layer A1 (`corrected-covers-pretopology`); `AdicEtaleGeometry`, layer A1 (`etale-site`); Section 1.1; Mathlib CategoryTheory.cechComplexFunctor.

Let `G` be a profinite group and `G`-pfsets the site of profinite sets with continuous `G`-action and the corrected coverings of `AdicEtaleGeometry`, layer A1 (`profinite-g-sets-site`) (the erratum's towers of pullbacks of surjections of finite `G`-sets followed by `G`-étale maps). For a topological `G`-module `M` let `F_M` be the sheaf `S ↦ Hom_{cont,G}(S, M)`. Then for every `i ≥ 0` there is a canonical isomorphism `Hⁱ(pt, F_M) ≅ H^i_cont(G, M)`, where, `G`-pfsets not being essentially small, `Hⁱ` is computed on the full subsite of `κ`-small profinite `G`-sets for a cutoff cardinal `κ` exceeding the weight of `G` (`DiamondsAndVStacks`, layer D0 (`cutoff-cardinal`)), and is independent of `κ` because the Čech computation below takes place in every such subsite with the continuous cohomology of the homogeneous continuous cochains (Mathlib `continuousCohomology`), where pt is the one-point `G`-set; it is natural in `M` and compatible with connecting maps for short exact sequences of topological `G`-modules that are sheaf-exact.

This uses `G` profinite; `M` a topological `G`-module (discrete, or with the topology used by the consumer); corrected coverings; Scholze's Proposition 3.7 (i) (splitting of arbitrary open surjections of profinite sets) is false and is not used; its replacement is the splitting of towers.

(P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, Proposition 3.7 (iii) and proof, p. 15; P. Scholze, Erratum to "p-adic Hodge theory for rigid-analytic varieties", Erratum, item (1), p. 1.)

For `G = ℤ_p` and `M` discrete, `H¹(pt, F_M) = Hom_cont(ℤ_p, M)` for trivial action; `Hⁱ(pt, F_M) = 0` for `i ≥ 2` and `M` torsion `(cd_p ℤ_p = 1)`. For `X` connected locally noetherian analytic, via `X_profét ≃ π₁(X, x̄)`-pfsets (`AdicEtaleGeometry`, layer A1 (`profinite-etale-galois-sets`)), `Hⁱ` of the sheaf attached to a discrete `π₁`-module on `X_profét` is `H^i_cont(π₁(X, x̄), M)` (the input of the `K(π, 1)` arguments of PadicHodgeTheory P8).

*Needs:* `AdicEtaleGeometry`, layer A1 (`profinite-g-sets-site`); `AdicEtaleGeometry`, layer A1 (`profinite-group-tower`); `AdicEtaleGeometry`, layer A1 (`free-g-profinite-sections-exact`); `AdicEtaleGeometry`, layer A1 (`profinite-etale-galois-sets`); Mathlib continuousCohomology; `DiamondsAndVStacks`, layer D0, Section D0.19; `DiamondsAndVStacks`, layer D0 (`cutoff-cardinal`).

Let `X` be a locally noetherian analytic adic space, `F` an abelian sheaf (or sheaf of `Λ`-modules) on `X_ét` and `U = lim_j U_j ∈ X_proét` quasi-compact and quasi-separated, presented by quasi-compact quasi-separated `U_j ∈ X_ét` (`AdicEtaleGeometry`, layer A1 (`proetale-coherence`)). Then for every `i ≥ 0` the natural map `colim_j Hⁱ(U_j, F) → Hⁱ(U, ν^*F)` is an isomorphism. The case `i = 0` is `AdicEtaleGeometry`, layer A1 (`nu-pullback-sections-qcqs`).

This uses `X` locally noetherian analytic; `U` qcqs with a qcqs presentation; the corrected coverings of `AdicEtaleGeometry`, layer A1 (`pro-etale-site-corrected`).

(P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, Lemma 3.16, p. 19; P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, proof of Lemma 3.16, p. 20; P. Scholze, Erratum to "p-adic Hodge theory for rigid-analytic varieties", Erratum, item (1), p. 1.)

If `U ∈ X_ét` (a constant pro-object), the statement is the tautology `Hⁱ(U, ν^*F) = Hⁱ(U, F), i.e`. Section 1.3 on `U`. For `V ∈ X_proét` quasi-compact and quasi-separated and a pro-finite-étale `G`-torsor `Ṽ → V, Hⁱ(Ṽ × S, ν^*F) = LC(S, Hⁱ(Ṽ, ν^*F))` for profinite `S` (the hypothesis (★) of Section 1.3).

*Needs:* `AdicEtaleGeometry`, layer A1 (`proetale-coherence`); `AdicEtaleGeometry`, layer A1 (`nu-pullback-sections-qcqs`); `AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`); `AdicEtaleGeometry`, layer A1 (`pro-etale-surjective-etale-descent`); `AdicEtaleGeometry`, layer A1 (`pro-etale-site-corrected`); `AdicEtaleGeometry`, layer A1 (`finite-etale-tower`); Section 1.1; `DiamondsAndVStacks`, layer D0, Section D0.19; Section 1.3.

Let `X` be a locally strongly sheafy analytic adic space and `Λ` a ring. (a) If `π: U → X` is a finite étale Galois covering with finite group `G` (so `U ×_X U ≅ G × U` over `U`), then for `F ∈ Sh(X_ét, Λ)` there is a convergent spectral sequence `E_2^{pq} = Hᵖ(G, H^q(U, F|_U)) ⇒ H^{p+q}(X, F)`, natural in `F`. `(b)` Let `X` be locally noetherian, `V ∈ X_proét` quasi-compact and quasi-separated, and `Ṽ = lim_j Ṽ_j → V` a pro-finite-étale `G`-torsor for a profinite group `G` (`AdicEtaleGeometry`, layer A1 (`profinite-galois-cover-is-covering`)). For a sheaf `F` of `Λ`-modules on `X_proét` there is a convergent spectral sequence with `E_1^{pq} = H^q(Ṽ × Gᵖ, F) ⇒ H^{p+q}(V, F)`; if `F` satisfies (★) the natural maps `LC(S, H^q(Ṽ, F)) → H^q(Ṽ × S, F)` are isomorphisms for all profinite sets `S` (discrete topology on `H^q(Ṽ, F)`), then `E_2^{pq} = H^p_cont(G, H^q(Ṽ, F)) ⇒ H^{p+q}(V, F)`; (★) holds for `F = ν^*F′` with `F′ ∈ Sh(X_ét, Λ)` (Section 1.3). `(c)` The edge maps are the inflation `Hᵖ(G, F(U)) → Hᵖ(X, F)` and the restriction `Hⁿ(X, F) → Hⁿ(U, F)^G`. Consumers with non-discrete coefficients (completed structure sheaves, period sheaves) supply (★) for the topology they use; this assertion claims the `E_2` identification only under (★).

This uses (a) `π` finite étale Galois with group `G`; `(b) X` locally noetherian, `V` qcqs, `Ṽ → V` a pro-finite-étale `G`-torsor with the corrected coverings; The continuous-cohomology form of `E_2` in `(b)` needs hypothesis (★); without it only the Čech `(E_1)` form is asserted.

(A. J. de Jong, M. van der Put, Étale cohomology of rigid analytic spaces, §2.4, proof of Proposition 2.4.1, p. 10; P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, proof of Proposition 3.7 (iii), p. 15.)

For `X = Spa(K, O_K)` and `U = Spa(L, O_L)` with `L/K` finite Galois, (a) is the Hochschild–Serre spectral sequence `Hᵖ(Gal(L/K), H^q(Gal(K^sep/L), M)) ⇒ H^{p+q}(Gal(K^sep/K), M)`. Scholze's computation of `Hⁱ(V_proét, L ⊗ O⁺/p)` via the `ℤ_pⁿ`-cover `Ṽ = V ×_{Tⁿ} T̃ⁿ → V` of a torus chart (proof of his Lemma 5.6) is `(b)`. There (★) is his Lemma 3.16 (the coefficients are pulled back from `V_ét`), and the almost vanishing of `H^q(Ṽ, L ⊗ O⁺/p)` for `q > 0` (his Lemma 4.12) collapses `E_2` to `H^p_cont(ℤ_pⁿ, M)`. The proof of his Proposition 6.16 (ii) applies `(b)` to the `Γ_k`-cover `X_K → X`, with (★) checked by inspection (PadicHodgeTheory P8).

*Needs:* Section 1.3; Section 1.1; `AdicEtaleGeometry`, layer A1 (`profinite-galois-cover-is-covering`); `AdicEtaleGeometry`, layer A1 (`profinite-set-objects`); `AdicEtaleGeometry`, layer A1 (`finite-etale-morphism`); Mathlib continuousCohomology.

Let `X` be a locally noetherian analytic adic space and `ν: X_proét → X_ét` the projection (`AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`)). (i) For every abelian sheaf (or sheaf of `Λ`-modules) `F` on `X_ét` the unit `F → Rν_*ν^*F` is an isomorphism in `D⁺(X_ét)`; hence `Hⁱ(X_ét, F) ≅ Hⁱ(X_proét, ν^*F)` for all `i` and `ν^*: D⁺(X_ét, Λ) → D⁺(X_proét, Λ)` is fully faithful. (ii) For a quasi-compact quasi-separated morphism `f: X → Y` of locally noetherian analytic adic spaces and `F ∈ Sh(X_ét, Λ)`, the base-change morphism `ν_Y^* Rf_ét`,* `F → Rf_proét`,* `ν_X^* F` is an isomorphism.

This uses `X, Y` locally noetherian analytic; `f` quasi-compact and quasi-separated in (ii); `F` a sheaf of abelian groups or `Λ`-modules on the étale site (not an arbitrary pro-étale sheaf).

(P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, Corollary 3.17 (i), p. 20; P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, Corollary 3.17 (ii), p. 20; P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, after Corollary 3.17, p. 20.)

`Hⁱ(X_ét, ℤ/p) = Hⁱ(X_proét, ℤ/p)` for every locally noetherian analytic `X` (used in Scholze's primitive comparison theorem). Non-example for (ii) without quasi-compactness: for the non-quasi-compact boundary complement `j: U → X` of a smooth pair, the comparison of `ν^*Rj_ét`,* and `Rj_proét`,*`ν^*` is not asserted (`AdicSpacesPartIV`, layer R4 (`boundary-complement-restriction`)).

*Needs:* `AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`); `AdicEtaleGeometry`, layer A1 (`nu-pullback-sections-qcqs`); Section 1.1; Section 1.3; Mathlib `DerivedCategory.isIso_iff`; `AdicSpacesPartIV`, layer R4 (`proetale-site-functoriality`).

Let `X` be a locally strongly sheafy analytic adic space, `Λ` a ring and `X_ét^aff` the stable affinoid étale basis (`AdicEtaleGeometry`, layer A1 (`basis-comparison`)). (i) Restriction to `X_ét^aff` is an equivalence `Sh(X_ét, Λ) ≃ Sh(X_ét^aff, Λ)`, exact in both directions, inducing `D⁺(X_ét, Λ) ≃ D⁺(X_ét^aff, Λ)` compatible with `RΓ(U, −)` for `U ∈ X_ét^aff`; a presheaf on `X_ét^aff` is a sheaf iff it is a sheaf for rational coverings and satisfies descent for single faithfully finite étale maps (`AdicEtaleGeometry`, layer A1 (`etale-covering-reduction`)). (ii) For `X = Spa(A, A⁺)` affinoid, `X_ét^aff` is equivalent to the opposite of the category of complete Huber pairs reached from `(A, A⁺)` by finite chains of rational localisations and finite étale extensions, so an étale sheaf on `X` is a functor on such `A`-algebras with these two descent conditions. (iii) Étale-locality on the target: for `g: X′ → X` and `v: V → X` in `X_ét` with `g_V: X′ ×_X V → V`, restriction commutes with derived direct image, `(Rg_*K)|_V ≅ R(g_V)_*(K|_{X′ ×_X V})` for `K ∈ D⁺(X′_ét, Λ)`; in particular `R^q g_*F` can be computed over any open affinoid cover of `X`. (iv) For `U ∈ X_ét` quasi-compact and quasi-separated, `Hⁿ(U, F)` is the Čech cohomology of any finite covering of `U` by basis objects on whose finite intersections `F` is acyclic (Section 1.3), and `Hⁿ(U, −)` commutes with filtered colimits of sheaves (`DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`), the étale topos of a qcqs `X` being coherent with generating family `X_ét^aff`).

This uses `X` locally strongly sheafy analytic; in (iv) `U` quasi-compact and quasi-separated; `K` bounded below in (iii).

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, §8.2, before Proposition 8.2.20, p. 163; A. J. de Jong, M. van der Put, Étale cohomology of rigid analytic spaces, §3.4, Lemma 3.4.3, p. 32; A. J. de Jong, M. van der Put, Étale cohomology of rigid analytic spaces, §3.2, Proposition 3.2.2, p. 23.)

For `X = Spa(K, O_K)` (rank-one plus ring), (ii) identifies `Sh(X_ét, Λ)` with sheaves on the opposite of finite étale `K`-algebras, `i.e`. discrete Galois modules. For an open affinoid cover `X = V₁ ∪ V₂` with `V₁ ∩ V₂` affinoid, (iii)–(iv) give the Mayer–Vietoris sequence `⋯ → Hⁿ(X, F) → Hⁿ(V₁, F) ⊕ Hⁿ(V₂, F) → Hⁿ(V₁ ∩ V₂, F) → ⋯` (compare Mathlib's Mayer–Vietoris sequence for `Sheaf.H`).

*Needs:* `AdicEtaleGeometry`, layer A1 (`basis-comparison`); `AdicEtaleGeometry`, layer A1 (`etale-covering-reduction`); `AdicEtaleGeometry`, layer A1 (`finite-etale-local-to-global`); Section 1.1; Section 1.3; `AdicSpacesPartII`, §R0.19.10 (`quasicompact-objects-in-a-topos`); `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`); Mathlib CategoryTheory.Functor.IsDenseSubsite.sheafEquiv.

Let `X = Spa(A, A⁺)` with `A` a complete strongly sheafy Tate ring (`AdicEtaleGeometry`, layer A1 (`strongly-sheafy-huber-pair`)) and `M` a finite projective `A`-module. Let `M̃_ét` be the presheaf on `X_ét^aff` sending `Y = Spa(B, B⁺)` to `M ⊗_A B`. Then `M̃_ét` is a sheaf on `X_ét` (via `AdicEtaleGeometry`, layer A1 (`basis-comparison`)) and `Hⁱ(Y_ét, M̃_ét) = 0` for every `Y ∈ X_ét^aff` and `i > 0`; in particular `Hⁱ(X_ét, O_{X_ét}) = 0` for `i > 0` and `H⁰(X_ét, O_{X_ét}) = A`. Consequently, on a locally strongly sheafy analytic `X`, for a vector bundle `E` on `X_an` the pullback `λ^*E` to `X_ét` satisfies `Rλ_*λ^*E = E` for `λ: X_ét → X_an`, and vector bundles on `X_an` and on `X_ét` correspond (Kedlaya–Liu 8.2.22 `(d)`). This is a statement about `O`-modules; it implies nothing about constant coefficients: `H¹(Spa(ℚ_p, ℤ_p)_ét, ℤ/p) ≠ 0`.

This uses A complete strongly sheafy Tate ring (so every object of `X_ét^aff` is a sheafy affinoid); `M` finite projective; The coefficient sheaf is `M ⊗_A O`, not a constant or torsion sheaf.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, §8.2, Theorem 8.2.22 (c), p. 165; Stacks project, Tag 023M (Descent, Lemma 35.3.6).)

Kedlaya–Liu Theorem 8.2.22 `(c)`: for `Y ∈ X_ét^aff, Hⁱ(Y, M̃) = M̃(Y)` for `i = 0` and 0 for `i > 0`. For `A = ℚ_p⟨T⟩` and `M = A: H¹(X_ét, O) = 0` while `H¹(X_ét, ℤ/p) ≠ 0`.

*Needs:* `AdicEtaleGeometry`, layer A1 (`strongly-sheafy-huber-pair`); `AdicEtaleGeometry`, layer A1 (`basis-comparison`); `AdicEtaleGeometry`, layer A1 (`etale-covering-reduction`); `AdicEtaleGeometry`, layer A1 (`finite-etale-local-to-global`); `AdicEtaleGeometry`, layer A1 (`etale-base-change`); `AdicEtaleGeometry`, layer A1 (`etale-structure-sheaf`); `AdicSpacesPartIII`, layer R3 (`finite-projective-module-acyclicity`); `AdicSpacesPartIII`, layer R3 (`vector-bundle-global-generation`); `AdicSpacesPartIII`, layer R3 (`finite-projective-etale-descent`); Section 1.3; Section 1.1.

For a locally noetherian analytic adic space `X` over `Spa(Q_p,Z_p)`, define `ProEtaleSheaf.completedZp` as `lim_r ν*Z/pʳ`. More generally a lisse coefficient tower consists of finite locally constant `Z/pʳ`-module sheaves `L_r` with the usual compatible reductions, interpreted up to pro-isomorphism. Prove `ProEtaleSheaf.lisseTower_derivedLimit`: for such a tower, `Rlim_r ν*L_r` is concentrated in degree zero and equals its ordinary inverse-limit sheaf. The proof uses the analytic perfectoid basis: refine further by compatible finite étale trivializations of the coefficient tower, kill positive-degree finite-coefficient cohomology on this basis, and apply the derived-limit criterion to the resulting Mittag–Leffler sections. This is a statement about these lisse towers, rather than exactness of inverse limits of arbitrary epimorphic analytic sheaf towers. (Scholze, *`p`-adic Hodge theory for rigid-analytic varieties*, Lemma 3.18, p. 21, Theorem 4.9, pp. 25–26, and Proposition 8.2, p. 48.)

Provide `ProEtaleSheaf.completedZp_derivedLimit`, the constant-tower specialization; `ProEtaleSheaf.completedZp_modPow`, the derived quotient by `pʳ` is `ν*Z/pʳ`; `ProEtaleSheaf.lisseTower_twist`, the same result for the compatible `μ_{pʳ}`-twists; and `ProEtaleSheaf.completedZp_pullback`, compatibility of these lisse coefficient sheaves with analytic pullback. For the quotient statement, use multiplication by `pʳ` and compatible local lifts of the lisse tower, giving the exact sequence `0→Ẑ_p→Ẑ_p→ν*Z/pʳ→0`. Right adjoints Rf* preserve derived limits. Derived reduction commutes with Rf* here because tensoring with `Z/pʳ` over `Z_p` is the `cone` of multiplication by `pʳ`, an operation preserved by the exact derived functor; this does not require finite generation. General inverse systems remain derived objects unless their own acyclicity has been proved.

**Checks.**

- On an algebraically closed field-point pro-étale site, completed coefficient sections are `Z_p` and reduction by `pʳ` gives `Z/pʳ`.
- On a split pair of points, sections are `Z_p×Z_p`; neither reduction nor completion identifies the components.
- The tower `Z/pʳ` with reduction transitions has no higher derived inverse-limit sheaf. Multiplication-by-`p` transitions form a different tower and cannot be substituted.
- For `p=2` the exact sequence still uses multiplication by `2ʳ` followed by reduction; rationalization is absent.

*Needs:* the corrected analytic pro-étale site and its qcqs presentations from `AdicEtaleGeometry`, layer A1; the compatible cardinal cutoffs of `DiamondsAndVStacks`, layer D0; the perfectoid bases and finite étale descent of `PerfectoidSpaces`, layers P3, P5 and P7; derived limits from `EnhancedDerivedSheaves`, §§0.1–0.4.

### 1.4 Finite local systems, constructibility and twists

Let `X` be a locally strongly sheafy analytic adic space and `Λ` a ring. A sheaf `F ∈ Sh(X_ét, Λ)` is locally constant if there are an étale covering `(U_α → X)_α` and `Λ`-modules `M_α` with `F|_{U_α} ≅ (M_α)_{U_α}`; it is locally constant of finite type if the `M_α` can be chosen finitely generated. `A` torsion local system of rank `r` is a locally constant sheaf of `Λ`-modules for a ring `Λ` with `nΛ = 0` for some `n ≥ 1` whose local values `M_α` are free of rank `r` (for `Λ` noetherian, a locally constant sheaf of finite type with finite projective values is called lisse). For `ℓ` a prime, a lisse `ℤ_ℓ`-sheaf is an inverse system `(L_m)_{m ≥ 1}` with `L_m` a locally constant sheaf of finitely generated `ℤ/ℓᵐ`-modules, such that the system is isomorphic in the pro-category to one with `L_{m+1}/ℓᵐ ≅ L_m`; on `X_proét` (`X` locally noetherian) a lisse `Ẑ_ℓ`-sheaf is a sheaf of `Ẑ_ℓ`-modules locally isomorphic to `Ẑ_ℓ ⊗_{ℤ_ℓ} M` with `M` finitely generated, `Ẑ_ℓ := lim_m ν^*(ℤ/ℓᵐ)`. The same definitions apply on the pseudo-adic sites `(X, S)_ét` (Section 1.2).

This uses `X` locally strongly sheafy analytic (locally noetherian for the pro-étale clause); Coverings are A1's étale coverings; the local trivialising cover is part of the existence statement, not data.

(P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §8, Definition 8.1, p. 48; Berkovich (1993), §4.4, p. 94; Berkovich (1993), §4.4, p. 93.)

Provide `AdicSpace.EtaleSheaf.IsLocallyConstant`: `F` is locally constant: there is an étale covering on whose members the restriction of `F` is constant in the sense of Mathlib's `CategoryTheory.Sheaf.IsConstant` (in the essential image of `constantSheaf`); `AdicSpace.EtaleSheaf.IsLocallyConstant.ofFiniteType`: Local values finitely generated `Λ`-modules; `AdicSpace.TorsionLocalSystem`: The full subcategory of locally constant sheaves with local values free of finite rank, for `Λ` with `nΛ = 0`; `AdicSpace.EtaleSheaf.isLocallyConstant_const`: Constant sheaves `M_X` are locally constant.

Provide `AdicSpace.EtaleSheaf.IsLocallyConstant.pullback`: `g⁻¹` preserves local constancy (and finite type, and rank); `AdicSpace.EtaleSheaf.IsLocallyConstant.restrict`: Restriction to `U ∈ X_ét` and to pseudo-adic sites preserves local constancy; `AdicSpace.EtaleSheaf.IsLocallyConstant.kernel`: Kernels, cokernels and extensions of locally constant sheaves of finite type over noetherian `Λ` are locally constant of finite type; `AdicSpace.EtaleSheaf.IsLocallyConstant.tensor`: `F ⊗_Λ G` and `Hom_Λ(F, G)` are locally constant of finite type.

Provide `AdicSpace.EtaleSheaf.IsLocallyConstant.stalk_iso`: On connected `X` all stalks of a locally constant sheaf are isomorphic (specialisation maps are isomorphisms); `AdicSpace.EtaleSheaf.IsLocallyConstant.equivFiniteEtale`: Locally constant sheaves of finite sets `≃` finite étale `X`-spaces; `AdicSpace.EtaleSheaf.IsLocallyConstant.equivPiOneModules`: For `X` connected with geometric point `ξ`: locally constant sheaves of finitely generated `Λ`-modules (`Λ` finite) `≃` finite `Λ`-modules with continuous `π₁(X, ξ)`-action; torsion local systems of rank `r ↔` modules free of rank `r`; `AdicSpace.LisseSheaf`: Lisse `ℤ_ℓ`-sheaves on `X_ét` (inverse systems, Scholze Definition 8.1) and lisse `Ẑ_ℓ`-sheaves on `X_proét`.

**Checks.**

- For `X = Spa(K, O_K), F ↦ F_ξ` is an equivalence from locally constant sheaves of finitely generated `Λ`-modules (`Λ` finite) to finite `Λ`-modules with continuous `Gal(K^sep/K)`-action; torsion local systems of rank `r` correspond to the modules free of rank `r`.
- On `X = Spa(C, C⁺)` with `C` algebraically closed (`C⁺` of any rank) every locally constant sheaf is constant: `F ≅ (F_ξ)_X`.
- For a scheme `Y` locally of finite type over a complete nonarchimedean field and a locally constant sheaf `F` on `Y_ét`, the pullback along the analytification morphism of sites (`AdicEtaleGeometry`, layer A2.6a (`analytification-etale-site`)) is locally constant with the same stalks.
- For `Λ ≠ 0` and the quasi-compact open `j: U = {|T| ≤ |p|}` of the (connected) closed unit disc, `j_`!`Λ` is constructible but not locally constant: its stalks are `Λ` at geometric points supported in `U` and 0 at those supported in the nonempty complement, whereas a locally constant sheaf on a connected space has isomorphic stalks.
- A sheaf of sets with finite stalks is locally constant iff it is representable by a finite étale `X`-space (Section 1.4).

On `X = Spa(K, O_K)` (`K` complete nonarchimedean, rank-one plus ring), locally constant sheaves of finitely generated `Λ`-modules (`Λ` finite) correspond to finite `Λ`-modules with continuous `Gal(K^sep/K)`-action, and torsion local systems of rank `r` to those free of rank `r`. `μ_n` (Section 1.4) is a torsion local system of rank one over `ℤ/n` when `n` is invertible on `X`.

*Needs:* Section 1.1; Section 1.2; `AdicEtaleGeometry`, layer A1 (`etale-site`); `AdicEtaleGeometry`, layer A1 (`pro-etale-site-corrected`); `AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`).

Let `X` be a locally strongly sheafy analytic adic space. (a) A sheaf of sets `F` on `X_ét` is locally constant with finite values iff `F ≅ h_Y := Hom_X(−, Y)` for a finite étale `X`-space `Y`; `Y ↦ h_Y` is an equivalence from `X_fét` (`AdicEtaleGeometry`, layer A1 (`finite-etale-site`)) to the category of locally constant sheaves of finite sets. `(b)` If `X` is connected and `ξ` a geometric point, `F ↦ F_ξ` is an equivalence from locally constant sheaves of finite sets to finite sets with continuous `π₁(X, ξ)`-action (`π₁` of `AdicEtaleGeometry`, layer A1 (`finite-etale-galois-category`)); for a finite ring `Λ` it restricts to locally constant sheaves of finitely generated `Λ`-modules `≃` finite `Λ`-modules with continuous `π₁(X, ξ)`-action (torsion local systems of rank `r ↔` modules free of rank `r`), compatible with `⊗, Hom` and pullback along pointed morphisms. `(c)` For a finite group `G, H¹(X, G_X)` is in bijection with isomorphism classes of finite étale `G`-torsors over `X`.

This uses `X` locally strongly sheafy analytic; in `(b) X` connected (`|X|` connected) with a geometric point `ξ`.

(Berkovich (1993), §4.1, proof of Proposition 4.1.8, p. 85; Berkovich (1993), §4.1, Corollary 4.1.9 and remark, p. 85; Scholze, Étale cohomology of diamonds, §7, proof of Proposition 7.16, p. 36; Stacks project, Tag 023M (Descent, Lemma 35.3.6).)

For `X = Spa(K, O_K), (b)` is the classical equivalence of finite étale `K`-algebras with finite continuous `Gal(K^sep/K)`-sets. On `Spa(C, C⁺)` with `C` algebraically closed, `π₁` is trivial and every locally constant sheaf of finite sets is constant.

*Needs:* `AdicEtaleGeometry`, layer A1 (`finite-etale-site`); `AdicEtaleGeometry`, layer A1 (`finite-etale-galois-category`); `AdicEtaleGeometry`, layer A1 (`etale-covering-reduction`); `AdicEtaleGeometry`, layer A1 (`finite-etale-local-to-global`); `AdicEtaleGeometry`, layer A1 (`finite-etale-rational-descent`); `AdicEtaleGeometry`, layer A1 (`etale-diagonal`); `AdicSpacesPartIII`, layer R3 (`finite-projective-etale-descent`); `AdicSpacesPartIII`, layer R3 (`etale-iff-trace-pairing-perfect`); Section 1.4; Section 1.3; Section 1.1.

Let `X` be a quasi-compact quasi-separated locally noetherian analytic adic space (`AdicSpacesPartII`, layer R0 (`locally-noetherian-adic-space`)) and `Λ` a noetherian ring. `A` subset `S ⊆ |X|` is constructible if it is a finite Boolean combination of quasi-compact open subsets, `i.e`. Mathlib's Topology.IsConstructible (the Boolean subalgebra generated by the retrocompact opens, which on the quasi-compact quasi-separated `|X|` are exactly the quasi-compact opens). A sheaf `F ∈ Sh(X_ét, Λ)` is constructible if there is a finite partition `|X| = S_1 ⊔ ⋯ ⊔ S_m` into locally closed constructible subsets such that for each `k` the restriction `i_{S_k}⁻¹F` to the pseudo-adic site `(X, S_k)_ét` (Section 1.2) is locally constant of finite type (Section 1.4). For general locally noetherian `X, F` is constructible if `F|_U` is constructible for every quasi-compact open `U`. `A` complex `K ∈ D⁺(X_ét, Λ)` is constructible if its cohomology sheaves are; `D^b_c(X_ét, Λ)` denotes the bounded constructible complexes. The condition is on all points of `X`, including higher-rank points, and on constructible strata that are in general not adic subspaces. This is Huber's notion, the classical analytic constructibility used in Layers 2–11; it differs from Zariski-constructibility (Bhatt–Hansen), which requires Zariski-locally closed strata of rigid spaces.

This uses `X` qcqs locally noetherian analytic (locally noetherian for the local version); `Λ` noetherian; Strata are locally closed and constructible in `|X|`; they need not be generalizing or Zariski-closed.

(Scholze, Étale cohomology of diamonds, §20, p. 113; Scholze, Étale cohomology of diamonds, §20, Definition 20.1 (i), p. 113; B. Bhatt, D. Hansen, The six functors for Zariski-constructible sheaves in rigid geometry, §3, Warning 3.2 (2), p. 14; Berkovich (1993), §4.4, Definition 4.4.2, p. 94.)

Provide `AdicSpace.EtaleSheaf.IsConstructible`: `F` is constructible: a finite partition into locally closed constructible subsets on whose pseudo-adic sites `F` is locally constant of finite type; `AdicSpace.EtaleSheaf.IsConstructible.ofIsLocallyConstant`: Locally constant of finite type `⇒` constructible; `AdicSpace.EtaleSheaf.IsConstructible.refine`: Constructibility is preserved under refinement of the stratification; `AdicSpace.EtaleSheaf.IsConstructible.kernel`: Kernels, cokernels, images and extensions of constructible sheaves are constructible (abelian subcategory).

Provide `AdicSpace.EtaleSheaf.IsConstructible.pullback`: `g⁻¹` of a constructible sheaf is constructible for qcqs morphisms of qcqs locally noetherian spaces; `AdicSpace.EtaleSheaf.IsConstructible.extendByZero`: `j_`! preserves constructibility for quasi-compact open immersions and `u_`! for qcqs étale `u`; `AdicSpace.EtaleSheaf.IsConstructible.pushforward_finiteEtale`: `π_*` preserves constructibility for finite étale `π`; `AdicSpace.EtaleSheaf.IsConstructible.stalk_fg`: Every stalk of a constructible sheaf is a finitely generated `Λ`-module.

Provide `AdicSpace.EtaleSheaf.IsConstructible.colimit`: Every sheaf of `Λ`-modules on qcqs `X` is a filtered colimit of constructible sheaves (not, in general, of its constructible subsheaves; Section 1.4); `AdicSpace.DbConstructible`: `D^b_c(X_ét, Λ)`: bounded complexes with constructible cohomology sheaves, a thick triangulated subcategory; `AdicSpace.isConstructible_iff_boolean_qcOpens`: On qcqs `|X|`, Topology.IsConstructible `S` holds iff `S` lies in the Boolean algebra generated by the quasi-compact opens; preimages along the spectral maps `|g|` of qcqs morphisms preserve it (Topology.IsConstructible.preimage, retrocompact opens pulling back to retrocompact opens); `AdicSpace.EtaleSheaf.IsConstructible.pseudoAdic`: Constructibility on a pseudo-adic space `(X, S)` (Section 1.2) is intrinsic to `S`: each `s∈S` lies in a subset `L⊆S` locally closed and locally constructible in `S`, on whose supported étale site the sheaf is locally constant of finite type. On a qcqs support this is equivalent to a finite partition into relative locally closed constructible strata. The strata need not be constructible in the ambient `|X|`. For `S=|X|` this recovers the preceding definition; for a singleton support every finite constant module is constructible even if the singleton is not ambient-constructible. Use this notion for `d(X,L)` in Section 4.2. (Huber (1996), §2.7, Definitions 2.7.1–2.7.2, p. 145.)

**Checks.**

- A locally constant sheaf of finitely generated `Λ`-modules is constructible, with the one-stratum partition.
- The zero sheaf is constructible; on `X = ∅` every sheaf is constructible (empty partition).
- For `Λ ≠ 0` and the qcqs open `j` of the disc of radius 1/2 in the disc of radius 1, `j_`!`Λ` is constructible, and it is not Zariski-constructible in the sense of Bhatt–Hansen.
- For `Λ ≠ 0`, the skyscraper sheaf `i_{x,*}Λ` at a classical point `x` of the closed unit disc over `ℂ_p` is not constructible (Bhatt–Hansen, footnote 2): its stalk is `Λ` at `x` and 0 at every other point, while every constructible subset containing `x` contains other points (otherwise the punctured disc `U ∖ {x}`, for a rational neighbourhood `U` of `x`, would be quasi-compact).
- Every sheaf of `Λ`-modules on a qcqs `X` is a filtered colimit of constructible sheaves (Section 1.4).
- On the singleton pseudo-adic support of a classical point `x` of the closed disc, the constant finite `Λ`-module is constructible: the support itself is its relative stratum, although `{x}` is not constructible in the ambient disc. Its ambient skyscraper for `Λ≠0` is the preceding non-example.
- The zero sheaf on any pseudo-adic support is constructible, whether or not the support is ambient-constructible.
- For full support `S=|X|` the relative criterion is the ordinary criterion above; for empty support the empty partition gives the unique sheaf.

Every locally constant sheaf of finite type is constructible (one stratum). For `Λ ≠ 0` and the qcqs open immersion `j` of a closed disc of radius 1/2 into the closed disc of radius 1, `j_`!`Λ` is constructible (strata `U` and its complement) but is not Zariski-constructible (Bhatt–Hansen Warning 3.2 (2)).

*Needs:* Section 1.2; Section 1.4; Section 1.1; `AdicSpacesPartII`, layer R0 (`locally-noetherian-adic-space`); `AdicSpacesPartII`, §R0.0 (`locally-spectral-space`); Mathlib Topology.IsConstructible.

Let `X` be a qcqs locally noetherian analytic adic space and `Λ` noetherian. (a) Constructible sheaves form an abelian subcategory of `Sh(X_ét, Λ)` stable under kernels, cokernels, images and extensions, and under `⊗_Λ`; `D^b_c(X_ét, Λ)` is a thick triangulated subcategory. `(b)` For a qcqs morphism `g: X′ → X` of qcqs locally noetherian analytic adic spaces, `g⁻¹` preserves constructibility. `(c)` For a qcqs étale `u: U → X` (in particular a quasi-compact open immersion), `u_`! preserves constructibility; in particular `u_`!`Λ` is constructible. `(d)` For `π: X′ → X` finite étale, `π_*` preserves constructibility. `(e)` Stalks of constructible sheaves are finitely generated.

This uses `X, X′` qcqs locally noetherian analytic; `Λ` noetherian; morphisms qcqs.

(Scholze, Étale cohomology of diamonds, §20, Remark 20.3, p. 113; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §2.1, proof of Proposition 2.4, p. 6.)

For the complement `Z` of a quasi-compact open `U` in qcqs `X, i_*i⁻¹Λ = coker(j_!Λ → Λ)` is constructible by (a) and `(c)`. Hansen's use (proof of Proposition 2.4): for a short exact sequence `0 → F → G → H → 0` on a dense Zariski-open `U ⊆ X` in which two of the three terms are locally constant of finite type, all three are constructible on `U` (Hub96 2.7.3 as cited by Hansen).

*Needs:* Section 1.4; Section 1.2; `AdicEtaleGeometry`, layer A1 (`etale-morphism`); `AdicSpacesPartII`, §R0.0 (`locally-spectral-space`); `AdicEtaleGeometry`, layer A1 (`finite-etale-galois-category`).

Let `X` be a qcqs locally noetherian analytic adic space and `Λ` a noetherian ring. Every `F ∈ Sh(X_ét, Λ)` is a filtered colimit of constructible sheaves, though in general not of its constructible subsheaves (on the closed unit disc, `coker(j_!Λ → Λ)` for the open unit disc `j: U → X` has stalk `Λ` at the rank-two point `|T| = 1⁻` outside `U`, while every constructible subsheaf has constructible support in `X ∖ U` and every constructible set containing that point meets `U`); in particular every abelian torsion sheaf is a filtered colimit of constructible sheaves of `ℤ/n`-modules for varying `n`. Consequently `H^q(X, −)` and, for qcqs `g: X′ → X, R^q g_*` commute with filtered colimits, so statements about torsion sheaves reduce to constructible ones.

This uses `X` qcqs locally noetherian analytic; `Λ` noetherian.

(Scholze, Étale cohomology of diamonds, §20, Lemma 20.4, p. 113; Berkovich (1993), §4.4, Proposition 4.4.5, p. 95.)

Hansen's reduction (proof of Theorem 1.7): `Hⁿ(X, −)` commutes with filtered colimits, so it suffices to treat constructible sheaves. ECD Lemma 20.4: on a spectral space every sheaf of `Λ`-modules is a filtered colimit of constructible sheaves.

*Needs:* Section 1.4; Section 1.2; Section 1.3; Section 1.1; `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`).

Let `X` be a locally strongly sheafy analytic adic space and `n ≥ 1` an integer invertible in `O_X(X)`. Let `G_m` be the sheaf `U ↦ O_U(U)^×` on `X_ét` (`AdicEtaleGeometry`, layer A1 (`etale-structure-sheaf`)) and `μ_n := ker(G_m → G_m, x ↦ xⁿ)`. (a) The sequence `1 → μ_n → G_m → G_m → 1` is exact on `X_ét`. `(b)` Its connecting map gives `δ: O(X)^×/(O(X)^×)ⁿ` ↪ `H¹(X, μ_n)` and an exact sequence `0 → O(X)^×/n → H¹(X, μ_n) → H¹(X, G_m)[n] → 0`. `(c) H¹(X_ét, G_m) ≅ Pic(X)` (Hilbert 90), so `H¹(X, μ_n)` classifies pairs `(L, ψ)` of a line bundle `L` and an isomorphism `ψ: L^{⊗n} ≅ O_X`.

This uses `n` invertible on `X` (for `X` over `Spa(K, K⁺), n` prime to the characteristic of `K`); `X` locally strongly sheafy analytic; `(c)` uses étale descent of line bundles.

(A. J. de Jong, M. van der Put, Étale cohomology of rigid analytic spaces, §3.2, examples of sheaves, item 6, p. 25; Berkovich (1993), §4.1, Proposition 4.1.7 (i), p. 84; Berkovich (1993), §4.1, Proposition 4.1.10, p. 86.)

If `K` contains a primitive `n`-th root of unity `ζ` and `X` lies over `Spa(K, K⁺), μ_n ≅ ℤ/n` on `X_ét` via `ζ`, and `H¹(X, ℤ/n) ⊇ O(X)^×/n`. Non-example: for `K` imperfect of characteristic `p (e.g. K = 𝔽_p((t)))` and `n = p, Tᵖ − f` is not étale, the `p`-th power map on `G_m` is not an epimorphism of étale sheaves on `Spa(K, O_K)` (for `f ∈ K^×` not a `p`-th power), and the Artin–Schreier sequence replaces the Kummer sequence.

*Needs:* `AdicEtaleGeometry`, layer A1 (`etale-structure-sheaf`); `AdicEtaleGeometry`, layer A1 (`finite-etale-affinoid-algebra`); `AdicEtaleGeometry`, layer A1 (`basis-comparison`); Section 1.1; Section 1.3; Mathlib rootsOfUnity.

Let `X` be a locally strongly sheafy analytic adic space and `n ≥ 1` invertible in `O_X(X)`. (i) `μ_n := ker(x ↦ xⁿ on G_m)`, with `μ_n(U) =` the group of `n`-th roots of unity in `O_U(U)^×` (Mathlib `rootsOfUnity n (O_U(U))`); it is a torsion local system of free `ℤ/n`-modules of rank one (Section 1.4), trivialised on the finite étale cover adjoining a primitive `n`-th root of unity. (ii) For a `ℤ/n`-algebra `Λ: Λ(1) := Λ ⊗_{ℤ/n} μ_n, Λ(r) := Λ(1)^{⊗_Λ r}` for `r ≥ 0, Λ(r) := Hom_Λ(Λ(−r), Λ)` for `r < 0`, and `F(r) := F ⊗_Λ Λ(r)` for `F ∈ Sh(X_ét, Λ)` and for complexes in `D⁺(X_ét, Λ)`. (iii) For a prime `ℓ` invertible on `X: ℤ_ℓ(1) := (μ_{ℓᵐ})_{m ≥ 1}` with the `ℓ`-th power transition maps, a lisse `ℤ_ℓ`-sheaf, and on `X_proét` (`X` locally noetherian) `Ẑ_ℓ(1) := lim_m ν^*μ_{ℓᵐ}` with `F(r) := F ⊗_{Ẑ_ℓ} Ẑ_ℓ(1)^{⊗r}` for sheaves of `Ẑ_ℓ`-modules. (iv) Canonical isomorphisms `Λ(r) ⊗_Λ Λ(s) ≅ Λ(r + s), g⁻¹(F(r)) ≅ (g⁻¹F)(r), (Rg_*K)(r) ≅ Rg_*(K(r))` (projection formula for the locally free rank-one `Λ(r)`), and stalks `(μ_n)_ξ = μ_n(C)` at a geometric point `Spa(C, C⁺)`. The exactness of the Kummer sequence is Section 1.4.

This uses `n` (resp. `ℓ`) invertible on `X`; `Λ` a `ℤ/n`-algebra in (ii); Twists are defined for all `r ∈ ℤ`, with `Λ(0) = Λ`.

(P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §6, Proposition 6.7, p. 37; A. J. de Jong, M. van der Put, Étale cohomology of rigid analytic spaces, §3.2, examples of sheaves, item 6, p. 25.)

Provide `AdicSpace.muN`: `μ_n` on `X_ét` for `n` invertible on `X`: the kernel of the `n`-th power map of `G_m`; `AdicSpace.muN_apply`: `μ_n(U) =` rootsOfUnity `n (O_U(U))`; `AdicSpace.muN.isLocallyConstant`: `μ_n` is a torsion local system of rank one over `ℤ/n`; `AdicSpace.muN.equivOfPrimitiveRoot`: `A` primitive `n`-th root of unity in `O(X)` gives `μ_n ≅ ℤ/n` on `X_ét`.

Provide `AdicSpace.EtaleSheaf.twist`: `F(r) := F ⊗_Λ Λ(r)` for `Λ` a `ℤ/n`-algebra and `r ∈ ℤ`, on sheaves and on `D⁺`; `AdicSpace.EtaleSheaf.twistAdd`: `F(r)(s) ≅ F(r + s)` and `Λ(r) ⊗ Λ(s) ≅ Λ(r + s)`; `AdicSpace.EtaleSheaf.twist_pullback`: `g⁻¹(F(r)) ≅ (g⁻¹F)(r)`; `AdicSpace.EtaleSheaf.twist_Rpushforward`: `(Rg_*K)(r) ≅ Rg_*(K(r))`.

Provide `AdicSpace.EtaleSheaf.stalk_muN`: `(μ_n)_ξ ≅ μ_n(C)` for `ξ: Spa(C, C⁺) → X`; `AdicSpace.ZellOne`: `ℤ_ℓ(1) = (μ_{ℓᵐ})_m` as a lisse `ℤ_ℓ`-sheaf, and `Ẑ_ℓ(1) = lim ν^*μ_{ℓᵐ}` on `X_proét`; `AdicSpace.muN_analytification`: Compatibility with the scheme `μ_n` under the analytification morphism of sites.

**Checks.**

- At a geometric point `ξ: Spa(C, C⁺) → X, (μ_n)_ξ ≅ μ_n(C) ≅ ℤ/n` (after choosing a primitive root in `C`).
- `Λ(0) = Λ, F(0) = F`, and `μ_1` is the trivial sheaf.
- For `U ∈ X_ét, μ_n(U) =` rootsOfUnity `n (O_U(U))` (Mathlib); and `λ_X⁻¹μ_{n,Y} ≅ μ_{n,Y^ad}` for the analytification of a scheme `Y` locally of finite type over `K`.
- `Λ(r) ⊗_Λ Λ(s) ≅ Λ(r + s)` canonically, and `F(r)(s) ≅ F(r + s)`.
- For `K = 𝔽_p((t))` (or any imperfect `K` of characteristic `p`) and `X = Spa(K, O_K)`, the `p`-th power map on `G_m` is not surjective as a map of étale sheaves (`t` is not a `p`-th power in any finite separable extension of `K`), so there is no Kummer sequence for `n = p`; twists are defined only for `n` invertible on `X`.

For `X` over `Spa(ℂ_p, O_{ℂ_p})`, a compatible system of roots of unity gives `ℤ_ℓ(1) ≅ ℤ_ℓ` on `X_ét`. For `X = Spa(ℚ_p, ℤ_p)` and a prime `ℓ ≠ p` with `ℓ ∤ p − 1, μ_ℓ` is a nonconstant local system `(μ_ℓ(ℚ_p) = 1)`, whose Galois module is the cyclotomic character mod `ℓ`.

*Needs:* Section 1.4; Section 1.1; Section 1.3; `AdicEtaleGeometry`, layer A1 (`etale-structure-sheaf`); `AdicEtaleGeometry`, layer A1 (`strict-localisation-analytic`); `AdicEtaleGeometry`, layer A1 (`finite-etale-affinoid-algebra`); `AdicEtaleGeometry`, layer A1 (`proetale-projection-nu`); Mathlib rootsOfUnity; Mathlib IsPrimitiveRoot; `AdicEtaleGeometry`, layer A2.6a (`analytification-etale-site`).

### 1.5 Limits with pseudo-adic supports

Define a supported tilde-limit for a small cofiltered system of qcqs pseudo-adic spaces `(Xᵢ,Sᵢ)`, with adic transition morphisms, and a compatible adic `cone (X,S)→(Xᵢ,Sᵢ)`. Require `S→lim Sᵢ` to be a homeomorphism in the subspace topologies and, at every `x∈S`, an affinoid ambient neighborhood `U` such that the union of the images `O_Xᵢ(V)→O_X(U)`, over compatible finite-stage opens `V` containing the image of `U`, is dense. This is the support version of the ordinary tilde-limit supplied by AdicSpacesPartII §§R0.20.1–R0.20.2; it can apply to non-analytic ambient spaces. The two requirements are independent. Density in residue fields gives the weaker primed variant and does not replace density of functions. Neither variant asserts a categorical limit in adic spaces.

This uses The supported spaces are qcqs and both the transitions and `cone` maps are adic. In the analytic case the ambient spaces use the analytic supplier; otherwise they satisfy Huber’`s` standing condition.

(Huber (1996), §2.4, Definition 2.4.2 and Remark 2.4.3, pp. 125–127.)

Use `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsTildeLimit` and the ordinary-space API of §§R0.20.1–R0.20.2 (*tilde-limits-affinoid-criterion*, *tilde-limit-base-change*) for topology, local density, affinoid criteria and ordinary base change. Its base-change theorem assumes a final stage `j`, qcqs spaces, adic transitions and `cone` maps, and an adic qcqs morphism `Y→X_j` locally of weakly finite type. The relevant fibre products must exist as adic spaces with the supplied completed-tensor-product charts. PerfectoidSpaces P7 supplies its analytic Yoneda and perfectoid refinements. The ordinary-space assertions below use this single supplier predicate on its stated domain.

Provide `SupportedTildeLimit` for the supported cones defined above, with `SupportedTildeLimit.homeomorph` on supports, `SupportedTildeLimit.dense` on ambient neighborhoods of support points, constructors from these two conditions, transport under `cone` isomorphisms and initial reindexing, and restriction to inverse images of finite-stage rational opens. Provide `SupportedTildeLimit.fullSupport_iff`: for a `cone` of qcqs adic spaces satisfying Huber’`s` standing condition, with adic transitions and `cone` maps, the supported predicate with `S=|X|` and `Sᵢ=|Xᵢ|` holds if and only if `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsTildeLimit` holds for that same ambient `cone`. The residue-field-density variant is separate. Huber's bijective-`cone` criterion (Remark 2.4.3(i)) gives a supported tilde-limit if local function density holds and each support point has an ambient affinoid neighborhood containing the preimage of a finite-stage open neighborhood: rational inequalities can then be approximated at a finite stage, so the support bijection is open.

**Checks.**

- For `K` complete nonarchimedean of residue characteristic `p, Spa(K⟨T^{1/p^∞}⟩, K°⟨T^{1/p^∞}⟩) ∼ lim_n Spa(K⟨T^{1/pⁿ}⟩, K°⟨T^{1/pⁿ}⟩)`, the left side being the completed colimit (Section 1.5).
- For the one-object category and an isomorphism `φ: X ≅ X₀, X ∼ X₀`.
- For a complete nonarchimedean field `K, Spa(K, K°) ∼ Spa(K[ε]/(ε²), K° + Kε)` along `K[ε] → K` (both spaces are one point and `K[ε] → K` is surjective), although the two adic spaces are not isomorphic.
- `Spa(ℂ_p, O_{ℂ_p}) → Spa(ℚ_p, ℤ_p)` (one object) satisfies (a) (both are one point) but not `(b)` (`ℚ_p` is not dense in `ℂ_p`).
- The closed unit disc `D` mapped into the first summand of the constant system `D ⊔ D` satisfies `(b)` (`O(D) × O(D) → O(D)` is surjective) but not (a).
- On a qcqs `cone` with adic maps satisfying Huber’`s` standing condition, `SupportedTildeLimit.fullSupport_iff` identifies the full-support condition with the Part II predicate for the identical ambient `cone`.
- For a nonempty qcqs adic space `D` satisfying Huber’`s` standing condition, the fold `D ⊔ D→D` over the one-object constant system has dense stage functions on each component but identifies distinct points; neither the ordinary nor the full-support predicate holds.

Scholze–Weinstein Proposition 2.4.2 / Section 1.5: the completed colimit of a system of affinoid rings with compatible rings and ideals of definition is a tilde-limit. Strict localisations: `Spa(C_ξ, C_ξ⁺) ∼ lim V` over affinoid étale neighbourhoods of a geometric point `ξ` (Section 1.5).

*Needs:* `AdicSpacesPartII`, §§R0.20.1–R0.20.2; `PerfectoidSpaces`, P7; `AdicSpacesPartII`, §R0.19.6 (`cofiltered-limits-of-spectral-spaces`); Section 1.2; Mathlib TopCat.limitCone; Mathlib CategoryTheory.IsCofiltered.

(1) Huber-pair form. Let `(A_i, A_i⁺)_{i∈I}` be a filtered system of complete sheafy Huber pairs with compatible adic transition maps. Choose rings of definition `A_{i,0} ⊆ A_i⁺` preserved by transition maps and finitely generated ideals of definition `I_i` satisfying `I_j = I_i A_{j,0}` for `j ≥ i`. Fix generators at one stage and restrict to its cofinal tail. Put `A := colim_i A_i`, `A_0 := im(colim_i A_{i,0} → A)` and `I := I_i A_0`. Assume finite-stage detection: if the image of `a ∈ A_{i,0}` belongs to `Iⁿ`, its image belongs to `I_jⁿ` at some `j ≥ i`. Give `A` the ring topology with open subring `A_0` and zero-neighborhood basis `Iⁿ`, and put `A⁺ :=` the integral closure in `A` of `im(colim_i A_i⁺ → A)`. Let `Â` be the actual separated completion of this topological ring, and `Â⁺` the closure of the image of `A⁺` in `Â`. Suppose `(B, B⁺)` is a complete sheafy Huber pair with compatible adic maps from the stages, together with `(C)` a topological ring isomorphism `Â ≅ B` carrying `Â⁺` onto `B⁺` and whose composite with each canonical map `A_i → Â` is the specified map `A_i → B`. Apply AdicSpacesPartII §R0.20.1's completed-direct-limit criterion and transport along this isomorphism: `Spa(B, B⁺) ∼ lim_i Spa(A_i, A_i⁺)`, using the single ordinary predicate above, with global function density. In particular, `ker(A → B) = ⋂_n Iⁿ`, where the ideals are viewed as subsets of `A`; the completion identifies only elements in the closure of zero. (2) Tate form (colimit-presented affinoids). For complete sheafy Tate pairs with compatible pseudouniformiser `ϖ`, use compatible genuine rings of definition `A_{i,0} ⊆ A_i⁺` and ideals `ϖA_{i,0}` satisfying (1), including finite-stage detection and the stage-compatible actual completion identification `(C)`. Call such a cone colimit-presented. Then it is an ordinary tilde-limit with global function density, and every rational subset of the limit descends to a finite stage. This criterion permits nonuniform Tate rings; their plus rings need not be rings of definition. (3) Bounded-target reduction test. Let `(C,C⁺)` be a complete sheafy Tate pair with `C⁺` bounded and with zero-neighborhood basis `ϖⁿC⁺` for its actual topology. For a compatible adic cone from complete sheafy Tate pairs with common pseudouniformiser `ϖ`, put `L⁺ := colim_i A_i⁺`. Suppose (P2) `L⁺/ϖⁿL⁺ → C⁺/ϖⁿC⁺` is an isomorphism for every `n ≥ 1`, and independently suppose `|Spa(C,C⁺)| → lim_i |Spa(A_i,A_i⁺)|` is a homeomorphism. Then the cone is an ordinary tilde-limit: surjectivity of the reductions makes the stage-plus image dense in `C⁺`, and inverting `ϖ` gives density of stage functions in `C`. This test does not identify `C` with the completion for an unspecified topology on `colim A_i`.

This uses Complete Huber (resp. Tate) pairs; all Spa's involved are adic spaces (sheafy). This restricts to honest adic spaces: Scholze–Weinstein state Proposition 2.4.2 for the uncompleted colimit in their larger category of adic spaces (Definition 2.1.5), where `Spa(A, A⁺) = Spa(Â, Â⁺)` is defined without completeness or sheafiness, so the source statement is correct as written there. In (1), the topology and plus ring belong to the specified algebraic colimit before completion, and the isomorphism `(C)` must respect the stage maps. In (2), rings of definition control the actual completion. In (3), boundedness and the stated neighborhood basis connect (P2) to the actual topology; the topological-limit condition is separate. For an affinoid field, every open valuation subring `C⁺ ⊆ O_C` is bounded, and `ϖⁿC⁺` is a neighborhood basis: it is contained in `ϖⁿO_C` and contains `ϖ^{n+1}O_C`.

(Scholze–Weinstein (2013), §2.4, Definition 2.4.1 and Proposition 2.4.2, pp. 19–20; AdicSpacesPartII §R0.20.1, completed-direct-limit criterion; Huber (1996), §2.4, Remark 2.4.3(i), pp. 125–126.)

**Checks.**

- A constant complete sheafy pair with identity stage maps has its own separated completion and satisfies `(C)` via the identity; the induced cone is the identity tilde-limit.
- For any prime `p`, the constant pair `(ℚ_p × ℚ_p, ℤ_p × ℤ_p)` with identity transitions and definition ideal `p(ℤ_p × ℤ_p)` has itself as separated completion. Projection to `(ℚ_p, ℤ_p)` is surjective on the ambient, definition and plus rings and induces the usual image topology, but kills `(0,1) ∉ ⋂_n pⁿ(ℤ_p × ℤ_p) = 0`. It fails `(C)` and is not a tilde-limit: its spectrum misses the second of the two components.
- For the scalar cone from the constant system `(ℚ_p,ℤ_p)` to `C = ℚ_p⟨ε⟩/(ε²)` with `C⁺ = ℤ_p ⊕ ℚ_pε`, use the actual definition ring `C₀ = ℤ_p ⊕ ℤ_pε`. Every reduction in (P2) is `ℤ_p/pⁿ`, and both spectra have one point, but `ℚ_p` misses the open set `ε + pC₀`. Here `⋂_n pⁿC⁺ = ℚ_pε` and `C⁺` is unbounded; neither (2) nor (3) applies. Strong noetherianness and sheafiness do not imply boundedness of the plus ring (Kedlaya–Liu, Definition 2.4.1 and Proposition 2.4.16).
- For the constant closed-disc pair `(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, evaluation `T ↦ 0` is surjective on the ambient, definition and plus rings, but `T ∉ ⋂_n pⁿℤ_p⟨T⟩ = 0`. It fails `(C)` and (P2) already modulo `p`, and its spectrum map misses the point `T = 1`.

Scholze–Weinstein Proposition 2.4.2: `Spa(A, A⁺) ∼ lim Spa(A_i, A_i⁺)` for the colimit with its colimit topology. `Spa(K⟨T^{1/p^∞}⟩) ∼ lim_n Spa(K⟨T^{1/pⁿ}⟩)` for any complete nonarchimedean `K` of residue characteristic `p` (the perfectoid case is PerfectoidSpaces P7). Use `AdicSpacesPartII`, §§R0.20.1–R0.20.2, for the ordinary affinoid criterion and, for qcqs `U→L` locally of weakly finite type with the required fibre products, its base change `(X_∞ ×_L U ∼ lim X_n ×_L U)`, retaining qcqs spaces, adic transitions and `cone` maps, a final stage and the required fibre products. Apply base change to the established ordinary tilde-limit; no boundedness of the new plus rings or reduction test for them is asserted. Density of `colim A_n` in `A` and closure of the stage plus rings alone do not establish the completion identification in (1).

*Needs:* the supplier contracts; Section 1.5; Tau Ceti TauCeti.Huber.PairOfDefinition.completionLocalization; Tau Ceti `TauCeti.ValuationSpectrum.spa_integralClosure`; Mathlib `UniformSpace.Completion.denseRange_coe`.

Let `Y` be a locally strongly sheafy analytic adic space, `ξ: Spa(C, C⁺) → Y` a geometric point with support `y, N(ξ)^aff` the cofiltered category of étale neighbourhoods `(V, v̄)` of `ξ` with `V` affinoid Tate (cofinal in `N(ξ)`, `AdicEtaleGeometry`, layer A1 (`strict-localisation`)), `L := colim_{N(ξ)^aff} O(V) = O_{Y_ét,ξ}, L⁺ := colim O⁺(V), m_ξ` the maximal ideal of the local ring `L, κ(ξ) = L/m_ξ`, and `(C_ξ, C_ξ⁺)` the completion of `(κ(ξ), κ(ξ)⁺)` where `κ(ξ)⁺` is the valuation ring of the valuation at the closed point (`AdicEtaleGeometry`, layer A1 (`strict-localisation-analytic`) (a)). Then: (a) `L⁺` is the preimage of `κ(ξ)⁺` in `L`, and `m_ξ ⊆ ϖⁿ L⁺` for every `n` and every pseudouniformiser `ϖ` of a neighbourhood; `(b)` the maps `L⁺/ϖⁿ → C_ξ⁺/ϖⁿ` are isomorphisms for all `n ≥ 1`; `(c)` the valuation and pointed rational-neighborhood shrinking argument identifies `|Spa(C_ξ,C_ξ⁺)|` with `lim_{N(ξ)} |V|`. Since the field plus ring `C_ξ⁺` is bounded with neighborhood basis `ϖⁿC_ξ⁺`, apply (3) to obtain `Spa(C_ξ, C_ξ⁺) ∼ lim_{N(ξ)^aff} V` with global density. On the locally noetherian domain the topological identification is clause `(b)` of `AdicEtaleGeometry`, layer A1 (`strict-localisation-analytic`); for locally strongly sheafy analytic spaces establish the same identification as follows. A compatible family of continuous stage valuations gives a valuation on `L` bounded on `L⁺`. For `a∈m_ξ`, every `a/ϖⁿ` lies in `L⁺`; continuity on a stage containing `a` forces its value to vanish. The valuation therefore factors through `κ(ξ)` and extends uniquely to its completion. This identifies the points with the valuation overrings between `C_ξ⁺` and `O_{C_ξ}`; approximation of rational inequalities gives the homeomorphism; `(d) (C_ξ, C_ξ⁺)` is an algebraically closed affinoid field with `C_ξ⁺ = C⁺ ∩ C_ξ`, and the valuation rings of `Spa(C_ξ, C_ξ⁺)` correspond to the vertical generisations of `y`.

This uses `Y` locally strongly sheafy analytic; `ξ` a geometric point with `C⁺` of any rank (higher-rank field pairs are kept).

(Huber (1996), §2.5, Lemma 2.5.12 and Proposition 2.5.13(i), pp. 134–135; T. Wedhorn, Adic spaces, §8.1, Proposition 8.6, p. 76, and Proposition 8.15, p. 78; §7.6, Proposition 7.52(1), p. 70; A. J. de Jong, M. van der Put, Étale cohomology of rigid analytic spaces, §3.7, Lemma 3.7.1, p. 37.)

**Checks.**

- For `Y = Spa(K,K⁺)` with `K⁺` of rank two and `ξ` supported at the closed point, the strict localisation field pair has two points, and the pointed neighborhood limit retains both valuation overrings.
- For `Y` a rigid space and `ξ` of rank one, the field-pair space is the one-point étale fibre `Sp(F_e)` of de Jong–van der Put §3.3.
- For `Y = Spa(C[ε]/(ε²),O_C ⊕ Cε)` with `C` algebraically closed complete and `ξ` its rank-one geometric point, `L=C[ε]/(ε²)` and `m_ξ=Cε` is killed in `C_ξ=C`. Its image is not a missing direction in the target: the target plus ring is bounded and its actual topology is the field topology.

*Needs:* `AdicEtaleGeometry`, layer A1 (`strict-localisation`); `AdicEtaleGeometry`, layer A1 (`strict-localisation-analytic`); `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); `AdicEtaleGeometry`, layer A1 (`basis-comparison`); Section 1.5; Tau Ceti TauCeti.ValuationSpectrum.spa; Tau Ceti `TauCeti.ValuationSpectrum.mem_spa_iff`; Mathlib TopCat.limitCone; Tau Ceti `TauCeti.ValuationSpectrum.mem_of_forall_vle_one`.

Let `Z = Spa(C, C⁺)` be colimit-presented by a system `Z_i = Spa(A_i, A_i⁺)` of complete Tate affinoids with compatible pseudouniformiser `ϖ` (Section 1.5 (2), for example the specified completed colimits). (a) If `(A_{i₀}, A_{i₀}⁺) → (B, B⁺)` is an adic morphism of complete Huber pairs, topologically of finite type or étale, such that the completed tensor products `B_i := B ⊗̂_{A_{i₀}} A_i` (`i` over `i₀`) and `B_C := B ⊗̂_{A_{i₀}} C` are sheafy (`AdicSpacesPartII`, layer R0 (`completed-tensor-product`)), then `Spa(B_C) ∼ lim_i Spa(B_i)` by ordinary tilde-limit base change. The new plus rings need not be bounded. `(b)` Globally: if `Y(ξ) ∼ lim V` is the strict localisation of a locally strongly sheafy analytic `Y` and `f: X → Y` is quasi-compact, quasi-separated and locally of weakly finite type, then `X ×_Y Spa(C_ξ, C_ξ⁺) ∼ lim_{N(ξ)^aff} X ×_Y V`; likewise for the base change of any colimit-presented system along such a morphism. Strict localisations use the independently established tilde-limit of (3) and the same ordinary base-change theorem, without a completion presentation of the base-changed rings. The statement for arbitrary tilde-limits and arbitrary maps `Y_i → X_i` (Scholze–Weinstein Proposition 2.4.3, proved there by reference to Huber's Remark 2.4.3) is not claimed.

This uses Colimit-presented tilde-limits of complete Tate affinoids; `B` topologically of finite type or étale over `A_{i₀}`, with sheafy completed tensor products; For `(b), f` quasi-compact, quasi-separated and locally of weakly finite type, so that the fibre products exist (`AdicSpacesPartII`, layer R0 (`fibre-products-existence`)).

(Huber (1996), §2.4, Remark 2.4.3(ii), pp. 126–127.)

For `f: X → Y` and `ξ` a rank-one geometric point of a rigid space `Y, X ×_Y Spa(C_ξ, O_{C_ξ})` is the étale fibre `X_e` of de Jong–van der Put, and `(b)` is the tilde-limit form of their Lemma 3.7.1. For an étale `V_{i₀} → Z_{i₀}` the base change is the étale case of Scholze–Weinstein Proposition 2.4.3 for colimit-presented systems.

*Needs:* Section 1.5; the supplier contracts; `AdicSpacesPartII`, layer R0 (`completed-tensor-product`); `AdicSpacesPartII`, layer R0 (`affinoid-fibre-product`); `AdicSpacesPartII`, layer R0 (`fibre-products-existence`); `AdicEtaleGeometry`, layer A1 (`etale-base-change`); `AdicSpacesPartII`, §R0.19.6 (`cofiltered-limits-of-spectral-spaces`); Tau Ceti TauCeti.ValuationSpectrum.comap; Tau Ceti `TauCeti.ValuationSpectrum.mem_of_forall_vle_one`; Tau Ceti `TauCeti.ValuationSpectrum.spa_integralClosure`.

For a supported tilde-limit of qcqs pseudo-adic spaces satisfying that standing condition with adic transition maps, identify the étale topos of the limit with the projective limit of the fibred étale topoi. On the restricted qcqs étale sites, objects, morphisms and finite covering families descend to a finite stage. In the analytic setting the same comparison holds if the topological limit condition is accompanied only by density of the union of finite-stage residue fields at every point. For the separate strongly sheafy, possibly nonnoetherian, setting use the locally completed-colimit systems for which the corresponding finite étale descent and covering detection have been supplied; do not infer this statement for an arbitrary nonnoetherian analytic tilde-limit.

This uses The Huber comparison assumes qcqs pseudo-adic spaces, adic transitions, and Huber’`s` standing condition. `A` final object is needed when subsequently pulling a coefficient object from one stage.

(Huber (1996), §2.4, Proposition 2.4.4, Remark 2.4.5 and proof, pp. 127–129.)

For the strict localisation `Spa(C_ξ, C_ξ⁺) ∼ lim V`, every qcqs étale space over `Spa(C_ξ, C_ξ⁺)` is a finite disjoint union of open subspaces of copies of `Spa(C_ξ, C_ξ⁺)` near the closed point (`AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`)) and descends to a neighbourhood. Scholze 2012 Theorem 7.17 is the perfectoid analogue (`PerfectoidSpaces`, layer P7 (`tilde-limits-and-etale-topos-comparison`)), proved using the same open-immersion/finite-étale factorisation.

*Needs:* Section 1.5; the supplier contracts; `AdicEtaleGeometry`, layer A1 (`etale-morphism`); `AdicEtaleGeometry`, layer A1 (`finite-etale-approximation`); `AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`); `AdicEtaleGeometry`, layer A1 (`finite-etale-local-to-global`); `AdicEtaleGeometry`, layer A1.0.5 (`henselian-finite-etale-approximation`); `AdicSpacesPartII`, §R0.19.6 (`cofiltered-limits-of-spectral-spaces`); `DiamondsAndVStacks`, layer D0.

Let `I` be a small cofiltered category with final object 0, `(X_i)` a system of quasi-compact quasi-separated locally strongly sheafy analytic adic spaces with quasi-compact quasi-separated transition maps, `X` a quasi-compact quasi-separated locally strongly sheafy analytic adic space with `X ∼ lim_i X_i` (Section 1.5) for which the conclusion of Section 1.5 holds (in particular every colimit-presented tilde-limit). Let `F_0` be a sheaf of sets (resp. groups, resp. abelian groups or `Λ`-modules) on `X_{0,ét}`, with pullbacks `F_i` on `X_{i,ét}` and `F` on `X_ét`. Then for `n = 0` (resp. `n ∈` {0, 1}, resp. all `n ≥ 0`) the natural map `colim_i Hⁿ(X_i, F_i) → Hⁿ(X, F)` is bijective. For a bounded-below complex `K_0` the same holds for hypercohomology. The same statement holds for pseudo-adic tilde-limits of qcqs pseudo-adic spaces whose étale topoi satisfy the descent of Section 1.5; that general hypothesis is exactly where Huber's Proposition 2.4.4 enters.

This uses `X, X_i` qcqs; transition maps qcqs; final object 0; `F_0` pulled back from `X_0`; The étale topos of `X` is the projective limit of the `(X_{i,ét}~)` (Section 1.5), proved for colimit-presented tilde-limits.

(Huber (1996), §2.4, Corollary 2.4.6, p. 129; Scholze, Étale cohomology of diamonds, §14, proof of Proposition 14.9, p. 86; Scholze, Perfectoid spaces, §7, Corollary 7.18, p. 44; Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, before (4.10.7), p. 11.)

Continuity along strict localisations: `colim_{N(ξ)} Hⁿ(X ×_Y V, F) = Hⁿ(X ×_Y Spa(C_ξ, C_ξ⁺), F)` (the input of Section 1.5). For `X = Spa(K⟨T^{1/p^∞}⟩) ∼ lim Spa(K⟨T^{1/pⁿ}⟩)` and a torsion sheaf `F_0: Hⁿ(X, F) = colim Hⁿ(Spa(K⟨T^{1/pⁿ}⟩), F_n)`. Česnavičius (4.10.7): on a common-ideal perfectoid completed-colimit system whose qcqs étale site is a filtered 2-colimit, finite locally constant abelian coefficient cohomology is the filtered colimit in every fixed degree.

*Needs:* Section 1.5; Section 1.3; Section 1.1; `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`); `AdicSpacesPartII`, §R0.19.10 (`quasicompact-objects-in-a-topos`); `DiamondsAndVStacks`, layer D0.

Let `g: X′ → X` be a morphism of locally strongly sheafy analytic adic spaces, `F ∈ Sh(X′_ét, Λ)` and `ξ` a geometric point of `X` with category of étale neighbourhoods `N(ξ)` (`AdicEtaleGeometry`, layer A1 (`strict-localisation`)). Then for every `q ≥ 0` there is a natural isomorphism `(R^q g_*F)_ξ ≅ colim_{(V, v̄) ∈ N(ξ)} H^q(V ×_X X′, F)`, and the colimit may be taken over the cofinal subcategory `N(ξ)^aff` of affinoid neighbourhoods; it is compatible with the connecting maps in `F`. The same holds for `ν: (R^qν_*F)_ξ ≅ colim_{N(ξ)} H^q(V, F)` with `V` regarded in `X_proét` (`X` locally noetherian).

This uses `g` arbitrary; `ξ` a geometric point (`C⁺` of any rank).

(A. J. de Jong, M. van der Put, Étale cohomology of rigid analytic spaces, §3.7, Theorem 3.7.3, p. 38; P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §3, proof of Corollary 3.17, p. 20.)

For `g` finite étale, `V ×_X X′` splits over small neighbourhoods into copies of `V` (Section 1.4), and the formula gives `(g_*F)_ξ = ⊕` over the geometric points of `X′` above `ξ` of `F` at those points, and `R^q g_*F = 0` for `q > 0` after Section 1.5.

*Needs:* Section 1.1; `AdicEtaleGeometry`, layer A1 (`strict-localisation`); `AdicEtaleGeometry`, layer A1 (`basis-comparison`); `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); Mathlib CategoryTheory.GrothendieckTopology.Point; Mathlib CategoryTheory.GrothendieckTopology.Point.presheafFiber; Mathlib CategoryTheory.Functor.Elements; Mathlib CategoryTheory.GrothendieckTopology.Point.presheafToSheafCompSheafFiberIso.

Let `f: X → Y` be a quasi-compact, quasi-separated morphism of locally strongly sheafy analytic adic spaces which is locally of weakly finite type, `ξ: Spa(C, C⁺) → Y` a geometric point (`C⁺` of any rank) with strict localisation `Y(ξ) = Spa(C_ξ, C_ξ⁺)` (Section 1.5), and `F` a sheaf of sets (resp. groups, resp. abelian groups or `Λ`-modules) on `X_ét` with pullback `G` to `X ×_Y Y(ξ)`. (a) For `n = 0` (resp. `n ≤ 1`, resp. all `n ≥ 0`) there is a natural isomorphism `(Rⁿ f_*F)_ξ ≅ Hⁿ(X ×_Y Spa(C_ξ, C_ξ⁺), G)`, compatible with connecting maps and natural in `ξ` (in particular equivariant for automorphisms of the strict localisation over `y`); for `K ∈ D⁺(X_ét, Λ), (Rf_*K)_ξ ≅ RΓ(X ×_Y Y(ξ), K|)`. `(b)` If `ξ` is the geometric point built from the completion `C` of an algebraic closure of the completed residue field `k(y)^ `(`AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`) (a)), then `(C_ξ, C_ξ⁺) = (C, C⁺)`, so `(Rⁿ f_*F)_ξ ≅ Hⁿ(X ×_Y Spa(C, C⁺), F)`. `(c)` If `y` is a point of rank one (a maximal point of the analytic space `Y`), `Y(ξ) = Spa(C_ξ, O_{C_ξ})` is one point and the stalk is the cohomology of the geometric fibre over `y` (Huber Example 2.6.2). `(d)` For higher-rank `y` the fibre over `Spa(C_ξ, C_ξ⁺)` has more points than the fibre over its generic point, and both enter (a). Comparison of the fibre over `(C_ξ, C_ξ⁺)` with the fibre over a larger algebraically closed field `(C, C⁺) ⊋ (C_ξ, C_ξ⁺)` is the invariance theorem of Layer 7 (Huber 4.1.1`(c)`), not part of this assertion.

This uses `f` quasi-compact, quasi-separated and locally of weakly finite type (so that `X ×_Y V` and `X ×_Y Y(ξ)` exist and are qcqs, locally strongly sheafy over qcqs `V`); `ξ` a geometric point with `C⁺` of any rank; field pairs `(C, C⁺)` are not replaced by `(C, O_C)`.

(Huber (1996), §2.6, Proposition 2.6.1, p. 138; Huber (1996), §3.8, proof of Lemma 3.8.2, p. 229; P. Scholze, p-adic Hodge theory for rigid-analytic varieties, §5, proof of Corollary 5.11, p. 34; B. Bhatt, D. Hansen, The six functors for Zariski-constructible sheaves in rigid geometry, §3, proof of Theorem 3.15, p. 20; A. J. de Jong, M. van der Put, Étale cohomology of rigid analytic spaces, §3.7, Theorem 3.7.3, p. 38.)

Finite étale `f`: the fibre is a finite disjoint union of copies of `Spa(C_ξ, C_ξ⁺)`, so `Rⁿ f_*F = 0` for `n > 0` by Section 1.2. Huber Lemma 3.8.2 (via the decomposition): `(Rⁿ g′_* f′_! F′)_y = Hⁿ(X′ ×_{Y′} Y′(y), L) = 0` is an application of (a). Bhatt–Hansen, proof of Theorem 3.15: two applications of Huber Example 2.6.2 compute `(g^*Rf_*F)_y` and `(Rf′_*g′^*F)_y` at rank-one points `y`, which is `(c)`.

*Needs:* Section 1.5; Section 1.1; Section 1.2; `AdicEtaleGeometry`, layer A1 (`strict-localisation-analytic`); `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); `AdicSpacesPartII`, layer R0 (`fibre-products-existence`).

### Examples

For `X=X₁⊔X₂` with both components connected and `Λ` nonzero, sheafification of the constant presheaf gives `Γ(X,Λ_X)=Λ⊕Λ`. The constant presheaf assigns only `Λ` to `X`; it fails the gluing test for the two-component cover. For an open immersion `j:U→X` and a geometric point outside `U`, the stalk of `j`!`Λ_U` is zero. The stalk of `j*Λ_U` can be nonzero at a frontier point because every étale neighborhood still meets `U`. These calculations test sheafification and extension by zero separately. (Huber (1996), §2.1, pp. 108–110; §2.5, Lemma 2.5.4, pp. 131–132.)

For a geometric field pair `(C,C⁺)`, let `s` denote its closed pseudo-adic point. `A` strict-local stalk at `s` is an exact fibre functor, whereas `RΓ(Spa(C,C⁺),−)` is the cohomology of the entire field-pair space. Even when `C⁺` has rank two, replacing the latter with `RΓ(Spa(C,O_C),−)` requires the explicit comparison theorem. For the constant torsion sheaf its positive cohomology vanishes, but this computation does not identify the underlying spaces or their points. (Huber (1996), Corollary 2.4.6, p. 129; Corollary 2.6.3, p. 139.)

### Dependencies

Use Mathlib’`s` sheaf, module, Grothendieck abelian and bounded-below derived-category APIs; `AdicSpacesPartII`, §§R0.19.1–R0.19.10, for constructible topology, spectral limits, Pro categories and qcqs topoi; and the coherent-site cohomology contract of `DiamondsAndVStacks`, D0. `AdicEtaleGeometry`, A1 and A4, supplies classical étale/pro-étale geometry, conservative points and finite-stage étale descent. `AdicSpacesPartII`, §§R0.20.1–R0.20.2, supplies ordinary tilde-limits, and `PerfectoidSpaces`, P7, supplies the analytic refinements; Section 1.5 proves the pseudo-adic support and sheaf-cohomology comparisons. `EtaleCohomologyFoundations`, §§0.5–0.6 supply coefficient descent. Localize supports before taking their derived cohomology; the basis and stalk constructions precede continuity.

## Layer 2: Henselian comparison and perfectoid approximation

### 2.1 Henselian f-adic rings and rational localization

Use `SchemeAndStackFoundations`, §0.14, *`henselian_pair_characterisations*` and *`henselian_pair_permanence*`, for the simple-root, factorization, étale-section and idempotent criteria and radical invariance of Mathlib's `HenselianRing A I`, for arbitrary commutative `A` and ideals `I`. Section 2.1 adds their Huber-ring consequences. For a pair of definition `(A₀,J₀), √J₀=A₀∩A°°`, so the supplied radical invariance identifies henselianity along these two ideals. (Stacks, tags 09XI and 09XJ.)

Provide `HenselianRing.of_gabber` and its converse as the additional Gabber polynomial test: a pair `(A,I)` is henselian exactly when `I` is in the Jacobson radical and, for every `n≥1` and `a₀`,…,`a_n∈I`, the monic polynomial `Tⁿ(T−1)+a_nTⁿ+⋯+a₀` has a root in `1+I`. Under these hypotheses the root is unique. This specialized test is in addition to the supplier's stated characterizations. (Stacks, Lemma 15.11.6, tag 09XI, item (5) and its uniqueness clause.)

**Checks.**

- For `I=0` the test polynomial is `Tⁿ(T−1)`, with unique root 1 in `1+I`.
- Over `Z_p` with `I=pZ_p`, the test lifts the root 1 for every such polynomial.
- Over `Z_(3)` with `I=3Z_(3), T²−T+3` has a root congruent to 1 in `Z_3` but none in `Z_(3)`, since `−11` is not a square in `Q`; the test fails.

*Needs:* `SchemeAndStackFoundations`, §0.14; Mathlib HenselianRing, Polynomial and Ideal.jacobson.

Let `φ: A → A′` be a ring homomorphism, `I ⊆ A` and `I′ ⊆ A′` ideals such that `φ` restricts to a bijection `I → I′` (so `I ≅ I′` as non-unital rings). Then HenselianRing `A I ↔` HenselianRing `A′ I′`. In particular, if `R ⊆ R′` are rings and `J` is an ideal of both `R` and `R′`, then `(R, J)` is henselian iff `(R′, J)` is. Lean: `HenselianRing.iff_of_bijOn_ideal`.

This uses `φ` need not be injective or surjective; only its restriction `I → I′` is assumed bijective.

(Gabber–Ramero, Almost ring theory, arXiv v3, §5.1, Remark 5.1.9(ii), p. 104; Bhargav Bhatt, Lecture notes for a class on perfectoid spaces, Chapter 7, proof of Lemma 7.2.3(3), p. 58.)

For rings of definition `B₀ ⊆ B₀′` of a Tate ring with `ϖⁿB₀′ ⊆ B₀`, the ideal `ϖ^{n+1}B₀′` is common to both, so `(B₀, ϖB₀)` is henselian iff `(B₀′, ϖB₀′)` is (using `SchemeAndStackFoundations`, §0.14, `henselian_pair_permanence`). `(ℤ + pℤ_p⟨T⟩, pℤ_p⟨T⟩)` is a henselian pair, because `pℤ_p⟨T⟩` is also an ideal of the `p`-adically complete ring `ℤ_p⟨T⟩`.

*Needs:* Section 2.1; Mathlib HenselianRing; Mathlib Ideal.jacobson.

Let `φ: B → R` be a ring homomorphism such that `Spec(φ): Spec R → Spec B` is a universal homeomorphism (equivalently: `φ` is integral and `Spec(φ)` is universally injective and surjective, Stacks Tag 04DF), and let `I ⊆ B` be an ideal. Then HenselianRing `B I ↔` HenselianRing `R (I·R)`. Lean: `HenselianRing.iff_of_isUniversalHomeomorph`.

This uses No finiteness hypothesis on `φ`.

(Bhargav Bhatt, Lecture notes for a class on perfectoid spaces, Chapter 7, proof of Lemma 7.2.3(3), p. 59; Stacks project, Tag 04DZ (Theorem 59.45.2); Stacks project, Tag 09XK (Lemma 15.11.8).)

`A` surjection `B → B/N` with `N` a nil ideal is a universal homeomorphism, so `(B, I)` is henselian iff `(B/N, I(B/N))` is (Gabber–Ramero Remark 5.1.9(i)). For a Tate ring with ring of definition `A₀ ∋ ϖ, A₀ → A₀ + A°°` is integral and a universal homeomorphism, which transfers henselianity from `(A₀ + A°°, A°°)` to `(A₀, ϖA₀)` (Bhatt Lemma 7.2.3(3)).

*Needs:* Section 2.1; Mathlib HenselianRing; Mathlib Algebra.IsIntegral; Mathlib Algebra.Etale; Mathlib PrimeSpectrum.isIdempotentElemEquivClopens.

Let `A` be a Huber (`f`-adic) ring (Tau Ceti `Huber.IsHuberRing`), `A°` its power-bounded subring and `A°° ⊆ A°` the ideal of topologically nilpotent elements (Tau Ceti `powerBoundedSubring`, `topologicallyNilpotentIdeal`). `A` *henselian datum* of `A` is a pair `(B, I)` with `B ⊆ A°` an open subring and `I` an ideal of `B` that is open in `A` and contained in `A°°`. Then (a) for fixed `B`, HenselianRing `B I ↔` HenselianRing `B (B ∩ A°°)`; `(b)` the truth of HenselianRing `B (B ∩ A°°)` does not depend on `B`. Hence Huber's four conditions are equivalent: (i) some henselian datum is a henselian pair; (ii) every henselian datum is a henselian pair; (iii)/(iv) for some/every open subring `B ⊆ A°, Spec B` is henselian along the closed set of its open prime ideals, which is `V(B ∩ A°°)`. No completeness, noetherian or Tate hypothesis enters. Lean: `Huber.henselianRing_iff_of_isOpen`.

This uses `A` an arbitrary Huber ring (the §3.1 convention of Huber's book: arbitrary `f`-adic rings); Subrings are unital; 'open' refers to the topology of `A`.

(Huber (1996), §3.1, opening, p. 163; Bhargav Bhatt, Lecture notes for a class on perfectoid spaces, Chapter 7, Lemma 7.2.3(3), p. 57; Roland Huber, Continuous valuations, §1, Proposition 1 (iii), p. 457 (GDZ OCR).)

Tate case: for a Tate ring `A` with ring of definition `A₀ ∋ ϖ, (A₀,ϖA₀), (A°,A°°)` and `(A⁺,A°°)` have equivalent henselianity. For complete Tate `A`, use `AdicEtaleGeometry`, A1.0.2 (`power-bounded-henselian-along-pseudouniformizer`); PerfectoidSpaces P3 cites that supplier. The targets here cover arbitrary `f`-adic rings. Discrete `A: A° = A` and `A°°` is the nilradical, which is locally nilpotent, so every henselian datum is a henselian pair (Stacks Tag 0ALI): discrete rings are henselian.

*Needs:* Section 2.1; Tau Ceti TauCeti.Huber.IsHuberRing; Tau Ceti TauCeti.Huber.PairOfDefinition; Tau Ceti TauCeti.Huber.powerBoundedSubring; Tau Ceti TauCeti.Huber.topologicallyNilpotentIdeal; Mathlib IsTopologicallyNilpotent; Mathlib HenselianRing.

Let `A` be a Huber ring whose uniform structure is complete and Hausdorff (CompleteSpace `A`, T2Space `A`), and let `(A₀, J)` be a pair of definition (Tau Ceti `Huber.PairOfDefinition`: `A₀` open, `J ⊆ A₀` finitely generated, subspace topology `J`-adic). Then `A₀` is `J`-adically complete in the algebraic sense: Mathlib `IsAdicComplete J A₀` (Hausdorff and precomplete for the filtration `Jⁿ`). Lean: `Huber.PairOfDefinition.isAdicComplete`, for arbitrary complete Hausdorff `f`-adic `A`. Its complete Tate specialization agrees with `AdicEtaleGeometry`, A1.0.2, `PairOfDefinition.isAdicComplete_of_completeSpace` (`power-bounded-henselian-along-pseudouniformizer`).

This uses Completeness and Hausdorffness refer to the topology of `A`; `J` finitely generated.

(T. Wedhorn, Adic spaces, §7.5, proof of Lemma 7.45, p. 67; Bhargav Bhatt, Lecture notes for a class on perfectoid spaces, Chapter 7, Lemma 7.2.3(4), p. 57.)

**Checks.**

- For the non-Tate `f`-adic ring `A=Z_p` with `A₀=A` and `J=(p)`, this gives algebraic `p`-adic completeness.
- For `Q_p⟨T⟩, A₀=Z_p⟨T⟩` and `J=pA₀`, the result agrees with the Tate specialization of `AdicEtaleGeometry`, A1.0.2.
- For `Q` with the 3-adic topology, `A₀=Z_(3)` is not 3-adically complete; completeness of `A` is necessary.

*Needs:* Tau Ceti TauCeti.Huber.PairOfDefinition; Mathlib IsAdicComplete; Mathlib IsAdic; Mathlib CompleteSpace; Mathlib `IsAdic.isAdicComplete_iff`; Mathlib `IsClosed.completeSpace_coe`.

Let `A` be a complete Hausdorff Huber ring. Then for every open subring `B ⊆ A°` and every ideal `I` of `B` that is open in `A` and contained in `A°°`, the pair `(B, I)` is henselian (Mathlib `HenselianRing B I`). In particular `(A°, A°°)` and `(A⁺, A°°)` are henselian pairs for every ring of integral elements `A⁺` (Tau Ceti `IsRingOfIntegralElements`), and if `A` is a Tate ring with pseudo-uniformiser `ϖ`, then `(A°, ϖA°)` and `(A⁺, ϖA⁺)` are henselian pairs. The proof uses neither Huber's book nor henselian-`f`-adic-ring-independence. Lean: `Huber.henselianRing_of_completeSpace`.

This uses A complete and Hausdorff; no noetherian, Tate or uniformity hypothesis; `A°` may be unbounded.

(Bhargav Bhatt, Lecture notes for a class on perfectoid spaces, Chapter 7, proof of Lemma 7.2.3(5), p. 59; Stacks project, Tag 0ALJ (Lemma 15.11.4); Stacks project, Tag 0FWT (Lemma 15.11.13); K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, §2.2, before Lemma 2.2.3, p. 28; Roland Huber, Continuous valuations, §1, Proposition 1 (ii)–(iii), p. 457 (GDZ OCR).)

`ℤ_p⟨T⟩ = (ℚ_p⟨T⟩)°` is henselian along `pℤ_p⟨T⟩`. Non-uniform instance: `A = ℚ_p⟨T⟩[ε]/(ε²)` with ring of definition `ℤ_p⟨T⟩[ε]`; `A° = ℤ_p⟨T⟩ ⊕ εℚ_p⟨T⟩` is unbounded and is henselian along `A°° = pℤ_p⟨T⟩ ⊕ εℚ_p⟨T⟩`. The complete Tate specialization is supplied by `AdicEtaleGeometry`, A1.0.2 (`power-bounded-henselian-along-pseudouniformizer`); the `f`-adic theorem agrees with it. Completeness cannot be dropped: `ℚ` with the 3-adic topology has `(ℚ°, ℚ°°) = (ℤ_(3), 3ℤ_(3))`, not henselian (`X² − 7` has the simple root 1 modulo 3 and no root in `ℤ_(3)`).

*Needs:* Section 2.1; `AdicEtaleGeometry`, A1.0.2 (`power-bounded-henselian-along-pseudouniformizer`); Mathlib HenselianRing; Tau Ceti `TauCeti.Huber.isBounded_subringClosure`; Tau Ceti TauCeti.Huber.PairOfDefinition; Tau Ceti TauCeti.Huber.powerBoundedSubring; Tau Ceti TauCeti.Huber.topologicallyNilpotentIdeal; Tau Ceti TauCeti.Huber.IsRingOfIntegralElements; Mathlib IsAdicComplete.

`A` Huber ring `A` is *henselian* (`Huber.IsHenselian A`) if the pair `(A°, A°°)` is henselian: `HenselianRing (powerBoundedSubring A) (topologicallyNilpotentIdeal A)`. By henselian-`f`-adic-ring-independence this holds iff some, equivalently every, henselian datum `(B, I)` — `B ⊆ A°` an open subring, `I` an ideal of `B` open in `A` with `I ⊆ A°°` — is a henselian pair. `A` Huber pair `(A, A⁺)` (Tau Ceti `Huber.Pair`) is henselian (`Huber.Pair.IsHenselian`) iff its underlying Huber ring is; the plus ring plays no role, and `(A⁺, A°°)` is then a henselian pair. Conventions: completeness is not assumed; the topology enters only through `A°` and `A°°`; on Tate rings the notion coincides with the topological henselianity of `AdicEtaleGeometry`, A1.0.4 (`henselian-pairs-colimits-and-completions`) (c), built on A1.0.2 (`power-bounded-henselian-along-pseudouniformizer`): `(A₀, ϖA₀)` is henselian for one, equivalently every, ring of definition `A₀` containing a pseudouniformiser `ϖ`.

This uses `A` a Huber ring (any `f`-adic ring); no completeness, noetherian or Tate hypothesis.

(Huber (1996), §3.1, opening, p. 163; Bhargav Bhatt, Lecture notes for a class on perfectoid spaces, Chapter 7, Definition 7.2.2(2), p. 57; K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, §2.2, before Lemma 2.2.3, p. 28.)

Provide `Huber.IsHenselian`: Prop-valued class on Huber rings: HenselianRing `A° A°°` (its field `henselianRing_powerBoundedSubring`); `Huber.IsHenselian.henselianRing`: If `A` is henselian then HenselianRing `B I` for every open subring `B ⊆ A°` and every ideal `I` of `B` open in `A` with `I ⊆ A°°`; `Huber.IsHenselian.of_henselianRing`: If HenselianRing `B I` for one such `(B, I)`, then `A` is henselian; `Huber.IsHenselian.of_completeSpace`: A complete Hausdorff Huber ring is henselian (complete-`f`-adic-ring-is-henselian).

Provide `Huber.IsHenselian.of_discreteTopology`: `A` discrete ring is henselian; `Huber.IsHenselian.of_isOpen_subring`: An open subring of a henselian Huber ring, with the subspace topology, is henselian; `Huber.IsHenselian.of_ringEquiv`: Henselianity transports along ring isomorphisms that are homeomorphisms (Tau Ceti `powerBoundedSubringEquiv`); `Huber.IsHenselian.iff_henselianRing_ringOfDefinition`: For a Tate ring `A` with pseudouniformiser `ϖ` and a ring of definition `A₀ ∋ ϖ`, IsHenselian `A ↔` HenselianRing `A₀ (ϖA₀)` (`AdicEtaleGeometry`, A1.0.2).

Provide `Huber.Pair.IsHenselian`: `A` Huber pair `(A, A⁺)` is henselian iff `A` is; then HenselianRing `A⁺ (A⁺ ∩ A°°)`.

**Checks.**

- `ℚ_p` and `ℚ_p⟨T⟩` with their `p`-adic topologies are henselian (complete); `ℚ_p⟨T⟩° = ℤ_p⟨T⟩` is henselian along `pℤ_p⟨T⟩`.
- Every ring with the discrete topology is henselian: `A° = A` (Tau Ceti `powerBoundedSubring_eq_top`) and `A°°` is the nilradical, a locally nilpotent ideal (Stacks Tag 0ALI).
- `ℚ` with the 3-adic topology is not henselian: `ℚ° = ℤ_(3), ℚ°° = 3ℤ_(3)`, and `X² − 7` has the simple root 1 modulo 3 but no root in `ℤ_(3)`.
- The field `ℚ_p ∩ ℚ̄` of algebraic `p`-adic numbers with the `p`-adic topology is henselian but not complete: its power-bounded subring is the henselisation `ℤ_(p)^h` of `ℤ_(p)`.
- For a Tate ring `A` with pseudouniformiser `ϖ` and ring of definition `A₀ ∋ ϖ`, `Huber.IsHenselian A ↔ HenselianRing A₀ (ϖA₀)` (`AdicEtaleGeometry`, A1.0.1–A1.0.2); for `A = ℚ_p⟨T⟩` and `A₀ = ℤ_p⟨T⟩` both sides hold.

Every complete Huber ring is henselian (complete-`f`-adic-ring-is-henselian), every discrete ring is henselian, and `ℚ` with the 3-adic topology is not.

*Needs:* Section 2.1; `AdicEtaleGeometry`, A1.0.1–A1.0.2 (`power-bounded-henselian-along-pseudouniformizer`); Tau Ceti TauCeti.Huber.powerBoundedSubring; Tau Ceti TauCeti.Huber.topologicallyNilpotentIdeal; Tau Ceti TauCeti.Huber.IsHuberRing; Tau Ceti TauCeti.Huber.Pair; Tau Ceti `TauCeti.Huber.powerBoundedSubring_eq_top`; Mathlib HenselianRing; Tau Ceti TauCeti.Huber.powerBoundedSubringEquiv.

Let `A` be a henselian Huber ring (henselian-`f`-adic-ring) and `A⁺` a ring of integral elements. Then (a) `1 + A°° ⊆ A^×` and the unit group `A^×` is open in `A`; `(b)` every maximal ideal of `A` is closed; `(c)` every proper ideal `J` of `A` is contained in supp `v` for some `v ∈ Spa(A, A⁺)`; hence `f ∈ A` is a unit iff `f ∉` supp `v` for every `v ∈ Spa(A, A⁺)`, and a finite `T ⊆ A` generates the unit ideal iff no point of `Spa(A, A⁺)` kills all of `T`. Completeness is not assumed. Lean: `Huber.IsHenselian.isOpen_setOf_isUnit`, `Huber.IsHenselian.isClosed_of_isMaximal`, `Huber.IsHenselian.isUnit_iff_forall_mem_spa_notMem_supp`.

This uses `A` henselian (in particular `A°° ⊆` Jacobson radical of `A°`); `A⁺` any ring of integral elements.

(T. Wedhorn, Adic spaces, §7.6, Proposition 7.51, p. 69; K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, §2.2, Lemma 2.2.2, p. 28.)

For the henselian, non-complete field `A = ℚ_p ∩ ℚ̄` with the `p`-adic topology, `Spa(A, A°)` is one point with support 0 and the criterion says that the non-zero elements are the units. The criterion is what makes `f(s)` a unit in rational-henselization (ii) for henselian, not necessarily complete, targets.

*Needs:* Section 2.1; Tau Ceti `Ideal.isClosed_of_isMaximal_of_isOpen_isUnit`; Tau Ceti `Ideal.closure_ne_top_of_isOpen_isUnit`; Tau Ceti `TauCeti.ValuationSpectrum.spa_eq_empty_iff_one_mem_closure_zero`; Tau Ceti `TauCeti.ValuationSpectrum.exists_mem_spa_le_supp_of_ne_top`; Tau Ceti TauCeti.ValuationSpectrum.spa; Mathlib Ideal.jacobson.

Let `A` be a Huber ring and `(D, I)` a pair of definition (`D` open and bounded, `I ⊆ D` a finitely generated ideal of definition). The *henselization* of `A` is `A^h := A ⊗_D D^h`, where `(D^h, ID^h)` is the henselization of the pair `(D, I)` (`SchemeAndStackFoundations`, Layer 0, Sections 0.12–0.13 (`Henselization.algebra`)); `D^h → A^h` is injective (`D^h` is flat over `D`) and `A^h` is topologised so that the image of `D^h` is a ring of definition with ideal of definition `I·D^h` (neighbourhood basis `{IⁿD^h}` of 0); `ι: A → A^h` is the canonical map. (i) `A^h` is a henselian Huber ring (henselian-`f`-adic-ring) and `ι` is continuous and adic. (ii) Universal property: every continuous ring homomorphism `φ: A → B` into a henselian Huber ring factors uniquely as `φ = ψ ∘ ι` with `ψ: A^h → B` continuous; hence `A^h` does not depend on `(D, I)` up to unique isomorphism. (iii) `D/Iⁿ ≅ D^h/IⁿD^h` for all `n`, so `ι` induces isomorphisms of the completed rings of definition and of completions `Â ≅ (A^h)^` (Tau Ceti `PairOfDefinition.completion`), with `Â = Â₀ ⊗_{A₀} A`. (iv) `ι` is an isomorphism iff `A` is henselian; in particular complete Huber rings are their own henselizations (complete-`f`-adic-ring-is-henselian). Affinoid case: for a Huber pair `(A, A⁺)` choose `D ⊆ A⁺`; then `(A⁺)^h := A⁺ ⊗_D D^h` is the henselization of the Huber ring `A⁺`, it equals the integral closure of the image of `A⁺ ⊗_D D^h` in `A^h`, and `(A, A⁺)^h := (A^h, (A⁺)^h)` is a henselian Huber pair, universal among continuous homomorphisms of Huber pairs to henselian Huber pairs, whose completion is `(Â, Â⁺)`. Section-wide convention (Huber 1996 §3.1): no noetherian or completeness hypothesis on `A`. The henselian notion itself (Huber 1996, 3.1.1–3.1.2) is henselian-`f`-adic-ring-independence and henselian-`f`-adic-ring, and the clause 'complete `f`-adic rings are henselian' is complete-`f`-adic-ring-is-henselian.

This uses `A` an arbitrary Huber ring; `D ⊆ A⁺` may be chosen because `D ∩ A⁺` is again a ring of definition; Henselization of pairs is the left adjoint of Stacks Tag 0A02, filtered colimit of étale `D`-algebras `E` with `D/I ≅ E`/IE.

(Huber (1996), §3.1, Lemma 3.1.3.ii, p. 164; Huber (1996), §3.1, opening, p. 163; Bhargav Bhatt, Lecture notes for a class on perfectoid spaces, Chapter 7, Lemma 7.2.5, p. 59; Kazuhiro Fujiwara, Fumiharu Kato, Foundations of Rigid Geometry I, Chapter 0, §7.3 (a), p. 161; Stacks project, Tag 0AGU (Lemma 15.12.2); Stacks project, Tag 03GE (Lemma 10.147.2); Peter Scholze, Jared Weinstein, Berkeley lectures on p-adic geometry, Lecture 2, §2.2, p. 10.)

Provide `Huber.Henselization`: The henselization `A^h` of a Huber ring `A`, with its Huber topology; `Huber.Henselization.of`: The canonical continuous adic ring map `ι: A → A^h`; `Huber.Henselization.isHuberRing`: `A^h` is a Huber ring, with ring of definition the image of `D^h` and ideal of definition `ID^h`; `Huber.Henselization.isHenselian`: `A^h` is henselian.

Provide `Huber.Henselization.lift`: For continuous `φ: A → B` with `B` henselian, the continuous `ψ: A^h → B`; `Huber.Henselization.lift_comp_of`: lift `φ ∘ ι = φ`; `Huber.Henselization.hom_ext`: Two continuous maps `A^h → B` to a henselian Huber ring agreeing on `A` are equal; `Huber.Henselization.map`: `A` continuous `φ: A → A′` induces `A^h → A′^h`, with `map_id` and `map_comp`.

Provide `Huber.Henselization.of_bijective_iff`: `ι` is bijective iff `A` is henselian; `Huber.Henselization.completionEquiv`: The completion of `ι` is an isomorphism `Â ≃ (A^h)^` of topological rings; `Huber.Henselization.ringOfDefinitionEquiv`: The ring of definition of `A^h` is the henselization of the pair `(D, I)` (`SchemeAndStackFoundations`, Layer 0, Sections 0.12–0.13 (`Henselization.algebra`)); `Huber.Pair.henselization`: `(A, A⁺)^h = (A^h, (A⁺)^h)`, a henselian Huber pair with the universal property for pairs.

Provide `Huber.Pair.henselization_plus`: `(A^h)⁺ = (A⁺)^h =` the integral closure of the image of `A⁺ ⊗_D D^h` in `A^h`; its completion is `Â⁺`.

**Checks.**

- If `A` is complete `(e.g. ℚ_p⟨T⟩), ι: A → A^h` is an isomorphism of topological rings.
- For `ℚ` with the `p`-adic topology, `A^h = ℚ_p ∩ ℚ̄` with ring of definition `ℤ_(p)^h`, and the completion of `A^h` is `ℚ_p`.
- The completion map induces `Â ≅ (A^h)^` as topological rings, compatible with Tau Ceti `PairOfDefinition.completion` for the pairs `(D, I)` and `(D^h, ID^h)`.
- For `ℤ[T]` with the `(p, T)`-adic topology, the inclusion into `ℤ_p⟦T⟧` factors uniquely through `ℤ[T]^h`, the henselization of `(ℤ[T], (p, T))`.
- `A^h ≠ Â` in general: for `ℚ` with the `p`-adic topology, `A^h = ℚ_p ∩ ℚ̄` is countable while `ℚ_p` is not.

A complete Huber pair is its own henselization; the henselization does not change the completion (Huber 1996, Lemma 3.1.3.ii). `(A^h)⁺ = (A⁺)^h`: the plus ring is henselized along with the ring and is recovered in every completion as `Â⁺`. For `ℚ` with the `p`-adic topology `(D = ℤ_(p), I = pℤ_(p)): A^h = ℚ ⊗ ℤ_(p)^h = ℚ_p ∩ ℚ̄`, and `(A^h)^ = ℚ_p = Â`.

*Needs:* Section 2.1; `SchemeAndStackFoundations`, Layer 0, Sections 0.12–0.13 (`Henselization.algebra`); Tau Ceti TauCeti.Huber.PairOfDefinition; Tau Ceti TauCeti.Huber.PairOfDefinition.completion; Tau Ceti TauCeti.Huber.Pair; Tau Ceti TauCeti.Huber.IsRingOfIntegralElements; Mathlib HenselianRing; Mathlib Algebra.Etale.

Let `(A, A⁺)` be a Huber pair and `U = R(T/s) ⊆ Spa(A, A⁺)` a rational subset (`T ⊆ A` finite with `T·A` open, `s ∈ A`). Let `(A(T/s), A(T/s)⁺)` be the uncompleted rational localisation: the localisation `A_s` with the Huber topology of Tau Ceti `PairOfDefinition.localization`/`locTopology` (ring of definition `A₀[t/s : t ∈ T]`, ideal of definition generated by an ideal of definition of `A₀`) and `A(T/s)⁺` the integral closure of `A⁺[t/s : t ∈ T]`. Define `G_A(U) := (A(T/s), A(T/s)⁺)^h` (henselian-`f`-adic-rings-and-henselization) with `h: (A, A⁺) → G_A(U)`. (i) `G_A(U)` is a henselian Huber pair and `Spa(h)` is a homeomorphism of `Spa G_A(U)` onto `U` carrying rational subsets to rational subsets. (ii) Every continuous homomorphism of Huber pairs `f: (A, A⁺) → (B, B⁺)` with `B` henselian and `Spa(f)(Spa(B, B⁺)) ⊆ U` factors uniquely through `h`; hence `G_A(U)` depends only on `U`. (iii) The completion of `G_A(U)` is the completed rational localisation `(O_X(U), O_X⁺(U))` (Tau Ceti `completionLocalization`), plus rings included. (iv) (3.1.5) `A(U) :=` the underlying ring of `G_A(U)`, the *henselization of `A` along `U*`, is a presheaf of rings on the rational subsets of `Spa(A, A⁺)` (restrictions from (ii)); completing it gives the structure presheaf on rational subsets. Lean: `Huber.Pair.rationalHenselization`.

This uses `(A, A⁺)` an arbitrary Huber pair; completeness and sheafiness are not assumed.

(Roland Huber, A generalization of formal schemes and rigid analytic varieties, §1, Proposition 1.3, p. 517 (GDZ OCR); Huber (1996), §3.5, proof of 3.5.13, p. 209; T. Wedhorn, Adic spaces, §7.6, Proposition 7.48, p. 68.)

Provide `Huber.Pair.rationalHenselization`: `G_A(U)` for a rational `U` presented as `R(T/s)`; `Huber.Pair.rationalHenselization.toHom`: The continuous homomorphism of Huber pairs `h: (A, A⁺) → G_A(U)`; `Huber.Pair.rationalHenselization.isHenselian`: `G_A(U)` is a henselian Huber pair; `Huber.Pair.rationalHenselization.spaHomeomorph`: `Spa(h)` is a homeomorphism `Spa G_A(U) ≃ U` preserving rational subsets.

Provide `Huber.Pair.rationalHenselization.lift`: The factorisation of `f` through `h` for henselian targets with image in `U`; `Huber.Pair.rationalHenselization.hom_ext`: Two continuous maps out of `G_A(U)` agreeing after composition with `h` are equal; `Huber.Pair.rationalHenselization.equivOfEq`: `R(T/s) = R(T′/s′)` gives a unique isomorphism between the two constructions; `Huber.Pair.rationalHenselization.restrict`: Restriction `G_A(U) → G_A(V)` for `V ⊆ U`, with `restrict_id` and `restrict_comp`.

Provide `Huber.Pair.rationalHenselization.completionEquiv`: The completion of `G_A(U)` is Tau Ceti's completed rational localisation with its plus ring.

**Checks.**

- For `U = Spa(A, A⁺) = R({1}/1), G_A(U) = (A, A⁺)^h`.
- For `A = ℚ_p⟨T⟩` and `U = R((T, p)/p)`, the completion of `G_A(U)` is `ℚ_p⟨T/p⟩` with plus ring `ℤ_p⟨T/p⟩`.
- The completion map `(A, A⁺) → (O_X(U), O_X⁺(U))` has image in `U` and complete, hence henselian, target; its factorisation through `G_A(U)` is the completion map of `G_A(U)`.
- For rational `V ⊆ U` the restriction `A(U) → A(V)` completes to the Tau Ceti restriction `O_X(U) → O_X(V)`.
- For `(A, A⁺) = (ℚ_p[T], ℤ_p[T])` with the `p`-adic topology and `U = Spa(A, A⁺), A(U) = ℤ_p[T]^h[1/p]` (henselization along `p`) is algebraic over `ℚ_p[T]` and so is not the completion `ℚ_p⟨T⟩: exp(p²T) = Σ p^{2n}Tⁿ/n`! lies in `ℤ_p⟨T⟩` and is transcendental over `ℚ_p(T)`.

`U = Spa(A, A⁺) = R({1}/1): G_A(U)` is the henselization `(A, A⁺)^h`, and `A(U) = A` for complete `A`. For `A = ℚ_p⟨T⟩` and `U = R((T, p)/p) = {|T| ≤ |p|}`, the completion of `G_A(U)` is `ℚ_p⟨T/p⟩`. In the proof of Huber Theorem 3.5.13 (Section 4.4) the scheme `U ×_X Z^h` is the spectrum of the henselization of `(B(1/s), C)` along `Spa(B(1/s), C)` — the case `U = Spa` of this construction.

*Needs:* Section 2.1; Tau Ceti TauCeti.Huber.PairOfDefinition.localization; Tau Ceti TauCeti.Huber.PairOfDefinition.locTopology; Tau Ceti TauCeti.ValuationSpectrum.rationalSubset; Tau Ceti TauCeti.ValuationSpectrum.spaLocalizationToRationalSubset; Tau Ceti `TauCeti.ValuationSpectrum.valuation_ne_zero_of_mem_rationalSubset`; Tau Ceti `TauCeti.ValuationSpectrum.vle_one_of_comap_mem_rationalSubset`; Tau Ceti `TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`; Tau Ceti TauCeti.Huber.PairOfDefinition.completionLocalization; Mathlib IsLocalization.Away; Tau Ceti TauCeti.ValuationSpectrum.spaLocalizationHomeomorph; Tau Ceti `TauCeti.ValuationSpectrum.mem_of_forall_vle_one`.

### 2.2 Special subsets and henselization along a support

Let `(A, A⁺)` be a Huber pair and `X = Spa(A, A⁺)`. For `t ∈ A` and finite subsets `D, E ⊆ A` such that the ideal `(D ∪ E ∪ {t})·A` is open, put `S(D|E / t) := {x ∈ X : |d(x)| ≤ |t(x)| ≠ 0` for all `d ∈ D`, and `|e(x)| < |t(x)|` for all `e ∈ E`}. `A` subset `U ⊆ X` is *special* if `U = S(D|E / t)` for such data, and *pro-special* if it is an intersection of special subsets. Every rational subset `R(T/s) = S(T|∅ / s)` is special; `X = S(∅|∅ / 1)`; pro-special subsets are stable under arbitrary intersections. Relative to a rational subset `R: S(D|E / t) = R ∖ ⋃_{e ∈ E} R_e` with `R := R((D ∪ E ∪ {t})/t)` and `R_e := {x ∈ R : |t(x)| ≤ |e(x)|}`. Functoriality (generalising the rational-localisation and completion cases of Huber 1996, Corollary 3.1.9): for an adic homomorphism of Huber pairs `f: (A, A⁺) → (B, B⁺), Spa(f)⁻¹(S(D|E/t)) = S(f(D)|f(E) / f(t))`, and special subsets of `Spa A` and of `Spa Â` correspond under `Spa Â ≅ Spa A`. Lean: `Huber.specialSubset`, `Huber.IsSpecialSubset`, `Huber.IsProSpecialSubset`.

This uses `|a(x)|` denotes the value of a at the continuous valuation `x`; `D, E` finite; the openness of `(D ∪ E ∪ {t})·A` is part of the data of a special subset, not of the set `S(D|E / t)`; Functoriality is stated for adic homomorphisms, for which `f(D ∪ E ∪ {t})·B` is open.

(Huber (1996), §3.1, Definition 3.1.6, p. 166; Huber (1996), §3.1, Corollary 3.1.8, p. 167.)

Provide `Huber.specialSubset`: the set `S(D|E / t)` inside `spa A⁺`, defined for all finite `D, E` and `t`, as Tau Ceti's `rationalSubset` is; `Huber.IsSpecialSubset`: `U` is of the form `S(D|E / t)` for data with `(D ∪ E ∪ {t})·A` open; `Huber.IsProSpecialSubset`: `U` is an intersection of special subsets; `Huber.IsSpecialSubset.isProSpecialSubset`: Special subsets are pro-special.

Provide `Huber.isSpecialSubset_rationalSubset`: `R(T/s)` is special; `Huber.IsProSpecialSubset.iInter`: Arbitrary intersections of pro-special subsets are pro-special; `Huber.specialSubset_eq_diff`: `S(D|E/t) = R((D ∪ E ∪ {t})/t) ∖ ⋃_{e ∈ E} {x ∈ R : |t(x)| ≤ |e(x)|}`; `Huber.IsSpecialSubset.preimage`: Preimages of special (pro-special) subsets under `Spa(f)` for adic `f` are special (pro-special).

Provide `Huber.IsSpecialSubset.completion`: Special subsets of `Spa A` and `Spa Â` correspond under the homeomorphism `Spa Â ≅ Spa A`; `Huber.IsSpecialSubset.rationalLocalization_iff`: For a rational subset `U` of `Spa(A, A⁺)`, the special subsets of `Spa(O_A(U), O_A⁺(U))` correspond, under `Spa(O_A(U), O_A⁺(U)) ≅ U`, to the special subsets of `Spa(A, A⁺)` contained in `U` (Huber 1996, Corollary 3.1.9, as recorded in the stated theorem).

**Checks.**

- `R(T/s) = S(T|∅/s)` is special.
- `Spa(A, A⁺) = S(∅|∅/1)` is special.
- In `Spa(ℤ_p[T], ℤ_p[T])` with the `p`-adic topology, `S(∅|{T}/1) = {x : |T(x)| < 1}` (the ideal `({T, 1})` is the unit ideal, hence open).
- `S(∅|{T}/1)` above is closed (its complement is the rational subset `R({1}/T)`) and not open (`Spa(ℤ_p[T], ℤ_p[T])` is connected, `ℤ_p⟨T⟩` having no non-trivial idempotents), so special subsets are not rational in general.

Every rational subset is special; the tube `{|T| < 1} = S(∅|{T}/1)` in `Spa(ℤ_p[T], ℤ_p[T])` (`p`-adic topology) is special and not open.

*Needs:* Tau Ceti TauCeti.ValuationSpectrum.spa; Tau Ceti TauCeti.ValuationSpectrum.rationalSubset; Tau Ceti TauCeti.Huber.Pair; Tau Ceti TauCeti.ValuationSpectrum.spaComap; `AdicSpacesPartII`, layer R0 (`adic-ring-homomorphism`).

Let `(A, A⁺)` be a Huber pair and `X = Spa(A, A⁺)`, a spectral space (Tau Ceti `spectralSpace_spa_of_pairOfDefinition`). Every special subset `S = S(D|E / t)` is locally closed and constructible in `X` (Mathlib `Topology.IsConstructible`): `S = R ∖ ⋃_{e ∈ E} R_e` with `R := R((D ∪ E ∪ {t})/t)` quasi-compact open and each `R_e := {x ∈ R : |t(x)| ≤ |e(x)|}` quasi-compact open. Consequently every pro-special subset `U` is pro-constructible (`AdicSpacesPartII`, §R0.19.2 (`pro-constructible-subsets`)), hence quasi-compact, and convex: if `x, z ∈ U` and `x` specialises to `y` which specialises to `z`, then `y ∈ U`. Hence `(X, U)` satisfies Huber's conditions for a pseudo-adic space whenever `X` is an adic space. Lean: `Huber.IsSpecialSubset.isLocallyClosed`, `Huber.IsSpecialSubset.isConstructible`, `Huber.IsProSpecialSubset.isProConstructible`, `Huber.IsProSpecialSubset.isConvex`.

This uses `(A, A⁺)` any Huber pair.

(Huber (1996), §3.1, Corollary 3.1.8, p. 167; Peter Scholze, Jared Weinstein, Berkeley lectures on p-adic geometry, Lecture 2, §2.3, Theorem 2.3.3, p. 14.)

`S(∅|{T}/1) ⊆ Spa(ℤ_p[T], ℤ_p[T])` (`p`-adic topology) is closed, constructible and not open. Huber 1996, Corollary 3.1.8: special subsets are locally closed and constructible, pro-special subsets convex and pro-constructible.

*Needs:* Section 2.2; Tau Ceti `TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`; Tau Ceti `TauCeti.ValuationSpectrum.isOpen_val_preimage_rationalSubset`; Tau Ceti `TauCeti.ValuationSpectrum.isCompact_of_mem_spaRationalFamily`; Tau Ceti TauCeti.ValuationSpectrum.spaLocalizationToRationalSubset; Mathlib Topology.IsConstructible; Mathlib SpectralSpace; `AdicSpacesPartII`, §R0.19.2 (`pro-constructible-subsets`); `AdicSpacesPartII`, §R0.0 (`locally-spectral-space`); Tau Ceti TauCeti.ValuationSpectrum.spaLocalizationHomeomorph.

(3.1.11) `A` *triple* `(K, L, M)` is a ring `K`, a subring `L ⊆ K` and an ideal `M` of `L`; it is henselian if `(L, M)` is a henselian pair; its henselization is `(K ⊗_L L^h, L^h, ML^h)`, where `(L^h, ML^h)` is the henselization of the pair `(L, M)` (`SchemeAndStackFoundations`, Layer 0, Sections 0.12–0.13 (`Henselization.algebra`)); its saturation replaces `L` by its integral closure in `K` and `M` by the radical of the extended ideal. (3.1.12) Let `(A, A⁺)` be a Huber pair, `A^▷` its underlying ring, and `U = ⋂_{i ∈ Λ} S(D_i|E_i / t_i)` a pro-special subset of `Spa(A, A⁺)` with a chosen presentation; let `(B, P)` be a pair with `B ⊆ A⁺` a subring over which `A⁺` is integral and `P ⊆ B ∩ A°°` an ideal of `B` with `P·A` open (for example `(A⁺, A⁺ ∩ A°°)`). Put `F := A^▷[1/t_i : i ∈ Λ], G := B[d/t_i, e/t_i : i ∈ Λ, d ∈ D_i, e ∈ E_i] ⊆ F` and `J := (P ∪ {e/t_i : i ∈ Λ, e ∈ E_i})·G`, and define `A(U) := F^h`, where `(F^h, G^h, J^h)` is the henselization of the triple `(F, G, J)`: the *henselization of `A` along `U*`, a ring without topology (used with the discrete topology). Then (i) `A(U)` is independent of the presentation of `U` and of `(B, P)` up to unique isomorphism; (ii) `U ↦ A(U)` is a presheaf of rings on the pro-special subsets of `Spa(A, A⁺)` whose restriction to rational subsets is the presheaf `A(U)` of rational-henselization; (iii) a continuous homomorphism of Huber pairs `f: (A, A⁺) → (A′, A′⁺)` and pro-special `U ⊆ Spa A, U′ ⊆ Spa A′` with `Spa(f)(U′) ⊆ U` induce a ring map `A(U) → A′(U′)`, compatibly with restrictions. (3.1.13) Examples: (i) for `A` with an `I`-adic topology, the henselization of `(A, A⁺)` along `Spa(A, A⁺)` is the henselization of `A` along `I`; (iii) for `s ∈ A` and `B = (A, A)(1/s), λ⁻¹(P)` is a pro-special subset of `Spa B` and `(A^h)_s` is the henselization of `B` along it — the bridge to formal generic fibres (`AdicEtaleGeometry`, layer A2 (`formal-generic-fibre-analytic-locus`)); (iv) the henselization of an affinoid field `(K, K⁺)` along its closed point is the henselization of `K` with respect to the valuation ring `K⁺`. Lean: `Huber.Triple`, `Huber.Pair.proSpecialHenselization`.

This uses `(A, A⁺)` any Huber pair (arbitrary `f`-adic `A^▷`); `U` pro-special; `A(U)` carries no natural Huber topology when `U` is not rational (Huber's remark after (3.1.5)); it is used as a discrete ring; Inputs of the source's proof: EGA IV 18.12.15 (henselization and integral closure; here replaced by Stacks Tag 03GE) and Huber 1993 (valuation spectra and the retraction `r: Spv A^▷ → Spv(A^▷, Q)`).

(Huber (1996), §3.1, Proposition and Definition 3.1.12, p. 170; Huber (1996), §3.1, proof of 3.1.12, (3), p. 172; Huber (1996), §3.1, Example 3.1.13.iii, p. 171.)

Provide `Huber.Triple`: `A` triple `(K, L, M)`: ring, subring, ideal of the subring; `Huber.Triple.henselization`: `(K ⊗_L L^h, L^h, ML^h)`; `Huber.Triple.saturation`: (`K`, integral closure of `L` in `K`, radical of the extended ideal); `Huber.Pair.proSpecialHenselization`: `A(U) = F^h` for a presented pro-special `U` and a pair `(B, P)`.

Provide `Huber.Pair.proSpecialHenselization.equivOfPresentation`: (i): independence of the presentation and of `(B, P)`; `Huber.Pair.proSpecialHenselization.restrict`: (ii): restriction `A(U) → A(U′)` for `U′ ⊆ U`, with `restrict_id` and `restrict_comp`; `Huber.Pair.proSpecialHenselization.map`: (iii): `A(U) → A′(U′)` for `f` with `Spa(f)(U′) ⊆ U`; `Huber.Pair.proSpecialHenselization.rationalEquiv`: For rational `U`, agreement with rational-henselization.

Provide `Huber.Pair.proSpecialHenselization.isHenselian`: The saturated triple `(A(U), (G^h)^c, (J^h)^c)` is henselian; `Huber.Pair.proSpecialHenselization.adicEquiv`: 3.1.13(i): for `I`-adic `A, A` along `Spa(A, A⁺)` is the henselization along `I`; `Huber.Pair.proSpecialHenselization.formalGenericFibreEquiv`: 3.1.13(iii): `(A^h)_s` is the henselization of `(A, A)(1/s)` along `λ⁻¹(P)`.

**Checks.**

- For rational `U = R(T/s), A(U)` is the underlying ring of rational-henselization `G_A(U)`.
- For complete `(A, A⁺)` and `U = Spa(A, A⁺), A(U) = A`.
- For `(ℤ_p[T], ℤ_p[T])` with the `p`-adic topology and `U = S(∅|{T}/1), A(U)` is the henselization of the pair `(ℤ_p[T], (p, T))`.
- For an affinoid field `(K, K⁺)` and `U` its closed point, `A(U)` is the henselization of `K` with respect to `K⁺`.
- `A(U)` is not the ring of germs `Γ(U, O|_U)` along `U`: for `U = S(∅|{T}/1) ⊆ Spa(ℤ_p[T], ℤ_p[T]), exp(p²T) ∈ ℤ_p⟨T⟩` restricts to a germ along `U` but is transcendental over `ℚ_p(T)`, whereas `A(U)` is ind-étale over `ℤ_p[T]`.

For a rational `U` the construction returns the ring of rational-henselization. Example 3.1.13(iii) identifies the henselization along `λ⁻¹(P) ⊆ d(Spf A)` with `(A^h)_s` — the bridge between henselian pairs and formal generic fibres used in the proof of Huber Theorem 3.5.13 (Section 4.4). For `(A, A⁺) = (ℤ_p[T], ℤ_p[T])` with the `p`-adic topology and `U = S(∅|{T}/1): F = G = ℤ_p[T], J = (p, T)`, and `A(U)` is the henselization of `ℤ_p[T]` along `(p, T)`.

*Needs:* Section 2.2; Section 2.1; `SchemeAndStackFoundations`, Layer 0, Sections 0.12–0.13 (`Henselization.algebra`); `AdicEtaleGeometry`, layer A2 (`formal-generic-fibre-analytic-locus`); Tau Ceti TauCeti.ValuationSpectrum; Mathlib HenselianRing.

Let `U = ⋂_λ U_λ` be the intersection of a cofiltered family of pro-special subsets of `Spa(A, A⁺)`, with presentations indexed by `Λ_λ` such that `Λ = ⋃_λ Λ_λ` is a directed union presenting `U`. Then the restriction maps induce an isomorphism `colim_λ A(U_λ) ≅ A(U)` (henselization-along-pro-special-subset). In particular, for `U = ⋂_{i ∈ Λ} S(D_i|E_i / t_i), A(U)` is the filtered colimit of `A(⋂_{i ∈ Λ₀} S(D_i|E_i / t_i))` over finite `Λ₀ ⊆ Λ`. Lean: `Huber.Pair.proSpecialHenselization.colimitEquiv`.

This uses Presentations compatible as stated; `(B, P)` fixed.

(Stacks project, Tag 0A04 (Lemma 15.12.5); Huber (1996), §3.1, Proposition and Definition 3.1.12, p. 170.)

For `U = ⋂_n S(∅|{f_n}/1)` with all `f_n ∈ A⁺` (countably many strict inequalities; for general `f_n` replace `A⁺` by `G = A⁺[f_1, f_2, …]`) with `(B, P) = (A⁺, A⁺ ∩ A°°), A(U)` is the henselization of `A` along (`P, f_1, f_2`, …) as the union of the henselizations along (`P, f_1`, …, `f_n`). `A` special subset is its own finite presentation, so the statement is empty for it.

*Needs:* Section 2.2; `SchemeAndStackFoundations`, Layer 0, Sections 0.12–0.13 (`Henselization.algebra`); Mathlib Ring.DirectLimit.

### 2.3 Scheme fibre products and the comparison morphism

For a pseudo-adic space `𝒮=(X,Σ)` with convex locally pro-constructible support, write `ℓ(𝒮)=(Σ,O_X|Σ)`. Given a locally ringed-space morphism `g:ℓ(𝒮)→Y` to a scheme and a scheme `Z` locally of finite type over `Y`, construct the universal pseudo-adic fibre product `𝒮×_Y Z`. Its projection to `𝒮` is locally of finite type and is étale when `Z→Y` is étale. Every compatible pair of points of `Σ` and `Z` has a lift to the fibre product. The assignment `Z↦𝒮×_Y Z` preserves finite limits and coverings on the small étale site and induces `g*:Sh(Y_ét)→Sh(𝒮_ét)`, its direct image, and the cohomology pullback `Hⁿ(Y,F)→Hⁿ(𝒮,g*F)`. This includes non-analytic ambient spaces through Section 1.2.

This uses The ambient `X` satisfies Huber’`s` standing condition, `Z→Y` is locally of finite type, and `g` is a morphism of locally ringed spaces.

(Huber (1996), §3.2, Lemma 3.2.7 and construction (3.2.8), pp. 179–180.)

Provide `AdicSpace.PseudoAdic.schemeFibreProduct`: `𝒮 ×_Y Z` for `g: ℓ(𝒮) → Y` and `Z` locally of finite type over `Y`; `AdicSpace.PseudoAdic.schemeFibreProduct.fst`: `p: 𝒮 ×_Y Z → 𝒮`, locally of finite type; `AdicSpace.PseudoAdic.schemeFibreProduct.snd`: `q: ℓ(𝒮 ×_Y Z) → Z` over `Y`; `AdicSpace.PseudoAdic.schemeFibreProduct.lift`: The morphism `𝒯 → 𝒮 ×_Y Z` from compatible `𝒯 → 𝒮` and `ℓ(𝒯) → Z`; `lift_fst, lift_snd` and uniqueness.

Provide `AdicSpace.PseudoAdic.schemeFibreProduct.surjective_points`: Every compatible pair `(s, z)` comes from a point; `AdicSpace.PseudoAdic.schemeFibreProduct.isEtale_fst`: `Z → Y` étale `⇒ p` étale; `AdicSpace.PseudoAdic.etaleSitePullback`: `g⁻¹`: Et/`Y ⥤` Et/`𝒮` is a morphism of sites (continuous, cover preserving, finite limit preserving); `AdicSpace.PseudoAdic.etaleSitePullback_comp`: Compatibility with composition of `g` with morphisms of schemes `Y → Y′` and of pseudo-adic spaces `𝒯 → 𝒮`.

Provide `AdicSpace.PseudoAdic.etaleCohomologyPullback`: `Hⁿ(Y_et, F) → Hⁿ(𝒮_et, g^*F)`, natural in `F`.

**Checks.**

- For `Z = Y, 𝒮 ×_Y Y = 𝒮` and `g⁻¹(Y) = 𝒮`.
- For `𝒮 = Spa(A, A⁺)` with `A` Tate, `Y = Spec A` and `Z = A¹_Y, 𝒮 ×_Y Z` is the relative analytic affine line, the increasing union of the relative closed discs of radius `|ϖ|^{-n}`.
- For `𝒮 = Spa(ℚ_p, ℤ_p)` and `Z = A¹_{ℚ_p}`, all non-classical points of the analytic affine line lie over the generic point of `Z`: the map to the set-theoretic fibre product is surjective but not injective.
- For `𝒮 = Spa(K, K°), Y = Spec K, 𝒮 ×_Y Z = Z^ad` of `AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`).
- For a `K`-affinoid `A, g⁻¹` for `Spa(A, A°) → Spec A` is Hansen's `µ_X`.

For `Y=Spec A` and `Z=Spec(A/I)`, the construction is the adic closed fibre with its induced support. For `Z=Y` both projections identify the fibre product with `𝒮`.

*Needs:* `AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`); `AdicSpacesPartII`, layer R0 (`locally-noetherian-adic-space`); Layer 1; `AdicEtaleGeometry`, layer A1 (`etale-site`); Mathlib AlgebraicGeometry.Scheme.smallEtaleTopology; Mathlib `CategoryTheory.Sheaf.H`; Section 1.2; `AdicSpacesPartII`, layer R1 (`analytification-etale-smooth`); `AdicSpacesPartII`, layer R1 (`analytification-points`); `AdicSpacesPartII`, layer R1 (`analytification-fibre-products`).

Let `(A, A⁺)` be a Huber pair, not necessarily complete, satisfying Huber's standing condition: the completion `Â` is generated as an algebra by finitely many elements over a noetherian ring of definition, is strongly noetherian Tate, or is discrete (the standing condition in Conventions), so that `Spa(Â, Â⁺)` is an adic space; let `U ⊆ Spa(A, A⁺)` be pro-special, `𝒰 := (Spa(Â, Â⁺), U)` (a pseudo-adic space by special-subsets-locally-closed-constructible), `A^▷` the underlying ring of `A, Y := Spec A(U)` (henselization-along-pro-special-subset), `j: Y → Spec A^▷` and `i: ℓ(𝒰) → Spec A^▷` the canonical morphisms. For a morphism of schemes `f: X → Spec A^▷` locally of finite type put `X′ := 𝒰 ×_{Spec A^▷} X` (pseudo-adic-scheme-fibre-product) and `X″ := Y ×_{Spec A^▷} X`, with projections `p′: X′ → X` and `p″: X″ → X`. Huber 1996, 3.2.12 constructs a morphism of topoi `γ_X: (X′_et)~ → (X″_et)~` with `p″ ∘ γ_X ≅ p′`, natural in `X`; for `X = Spec A^▷` it is `γ: (𝒰_et)~ → (Y_et)~` with `j ∘ γ ≅ i`. For A complete and `U = Spa(A, A⁺), Y = Spec A^▷` and `γ` is the morphism of topoi of `i⁻¹` (pseudo-adic-scheme-fibre-product (3.2.8)). `γ^*` gives the comparison maps `Hⁿ(X″_et, F″) → Hⁿ(X′_et, F′)` for `F` on `X_et`. Lean: `AdicSpace.henselianComparison`.

This uses The completed pair satisfies Huber’`s` standing condition, `U` is pro-special, and `X→Spec A` is locally of finite type. Properness is not required for construction of `γ_X`. The support site includes non-analytic points as in Section 1.2.

(Huber (1996), §3.2, Remark 3.2.12 and Remark 3.2.13, pp. 181–183; §3.3, Theorem 3.3.3, p. 184; §3.4, Theorem 3.4.4, p. 194.)

Provide `AdicSpace.henselianComparison`: `γ_X: (X′_et)~ → (X″_et)~` for `f: X → Spec A^▷` locally of finite type; `AdicSpace.henselianComparison.snd_comp`: `p″ ∘ γ_X ≅ p′`; `AdicSpace.henselianComparison.triangle`: For `X = Spec A^▷: j ∘ γ ≅ i`; `AdicSpace.henselianComparison.of_complete`: The complete case `γ = i^*`.

Provide `AdicSpace.henselianComparison.naturality`: Naturality in `X` over `Spec A^▷`; `AdicSpace.henselianComparison.restrict`: Compatibility with shrinking `U` to a pro-special `U₁ ⊆ U` and the restriction `A(U) → A(U₁)`; `AdicSpace.henselianComparison.cohomologyMap`: `γ^*: Hⁿ(X″_et, F″) → Hⁿ(X′_et, F′)` for `F` on `X_et`, natural in `F`.

**Checks.**

- For complete `A` and `U = Spa(A, A⁺), γ = i^*` (the canonical morphism of sites).
- `j ∘ γ ≅ i`; hence `γ^*(j^*F) ≅ i^*F` for every sheaf `F` on `(Spec A^▷)_et`.
- For `X₁ → X` étale over `Spec A^▷, γ_{X₁}` is the restriction of `γ_X` along `X₁′ → X′` and `X₁″ → X″`.
- For `ℚ` with the `p`-adic topology and `U = Spa(ℚ, ℤ_(p))`, replacing `γ` by `i: 𝒰 → Spec ℚ` fails: `H¹` with `ℤ/n`-coefficients of `Spec ℚ` differs from that of `Spa(ℚ_p, ℤ_p)`, while through `Y = Spec(ℚ_p ∩ ℚ̄)` they agree.

For A complete and `U = Spa(A, A⁺), γ` is the canonical morphism (Hansen's `µ_X` for affinoid rigid spaces). For `ℚ` with the `p`-adic topology `(A⁺ = ℤ_(p))` and `U = Spa(A, A⁺)`, a single point with étale site that of `Spa(ℚ_p, ℤ_p): Y = Spec(ℚ_p ∩ ℚ̄)`, and `γ` identifies the Galois cohomology of `ℚ_p` with that of the henselian field `ℚ_p ∩ ℚ̄`, whereas `i: 𝒰 → Spec ℚ` does not induce isomorphisms.

*Needs:* Section 2.3; Section 2.2; Section 2.1; Layer 1; `AdicSpacesPartII`, layer R0 (`locally-noetherian-adic-space`); Mathlib AlgebraicGeometry.Scheme.smallEtaleTopology; Section 1.2.

Let `g: ℓ(𝒮) → Y` be as in pseudo-adic-scheme-fibre-product (or `γ` as in comparison-morphism-3-2-12), `F` an abelian sheaf on `𝒮_et` and `ȳ` a geometric point of `Y` with strict localisation `Y(ȳ) = Spec O^{sh}_{Y,ȳ} = lim` over the étale neighbourhoods `(V, v̄)` of `ȳ`. Then `(R^q g_*F)_ȳ ≅ colim_{(V, v̄)} H^q((𝒮 ×_Y V)_et, F)`, the colimit over étale neighbourhoods (the stalk at the point of Mathlib `pointSmallEtale`); when `𝒮` is quasi-compact and quasi-separated, the fibre products form a Huber tilde-limit `𝒮(ȳ) := 𝒮 ×_Y Y(ȳ) ~ lim_V 𝒮 ×_Y V` and the stalk is `H^q(𝒮(ȳ)_et, F|)` (continuity). The same holds for `γ` with `𝒮 ×_Y V` replaced by `γ^*V`. Lean: `AdicSpace.PseudoAdic.stalk_higherDirectImage`.

This uses `F` abelian (for `q = 0` sheaves of sets, for `q ≤ 1` sheaves of groups); `𝒮` quasi-compact quasi-separated for the tilde-limit form.

(Huber (1996), §2.6, Proposition 2.6.1, p. 138; Huber (1996), §2.4, Corollary 2.4.6, p. 129.)

`q = 0, 𝒮 = Spa(K, K⁺) → Y = Spec K` for a complete nonarchimedean field `K` and `ȳ = Spec K^sep`: the formula gives `colim` over finite separable `L ⊆ K^sep` of `F(Spa(L, L⁺))`, the stalk of `AdicEtaleGeometry`, layer A1 (`strict-localisation-analytic`) `(c)`. For `𝒮 = Spa(A, A°)` with `A` a `K`-affinoid and `Y = Spec A`, the stalks of `R^q µ_*` at geometric points of `Spec A` are the cohomology groups of the analytic fibres over strictly henselian local rings.

*Needs:* Section 2.3; Layer 1; Section 1.1; Section 1.5; Mathlib AlgebraicGeometry.Scheme.pointSmallEtale; `DiamondsAndVStacks`, layer D0, Section D0.19; `AdicEtaleGeometry`, layer A1 (`strict-localisation`); Section 1.2.

(a) Let `U = ⋂_λ U_λ` be a cofiltered intersection of pro-special subsets of `Spa(A, A⁺)` (standing condition as in comparison-morphism-3-2-12). For every sheaf `F` of abelian groups (resp. groups, resp. sets) on `(Spec A^▷)_et` the natural maps `colim_λ Hⁿ(Spec A(U_λ), j_λ^*F) → Hⁿ(Spec A(U), j^*F)` and `colim_λ Hⁿ(𝒰_λ, i_λ^*F) → Hⁿ(𝒰, i^*F)` are bijective for all `n` (resp. `n ≤ 1`, resp. `n = 0`), compatibly with the comparison maps `γ^*`. Hence the comparison theorems for pro-special `U` follow from those for special `U`. `(b)` Let `X → Spec A^▷` be of finite type with `X` quasi-compact and quasi-separated, written as `X = lim_μ X_μ` with `X_μ → Spec A^▷` of finite presentation and closed immersions `X ⊆ X_μ` as transition maps, and `F = colim_μ` (pullback of `F_μ`). Then `colim_μ Hⁿ(X_μ″, F_μ″) ≅ Hⁿ(X″, F″)` and `colim_μ Hⁿ(X_μ′, F_μ′) ≅ Hⁿ(X′, F′)`, compatibly with `γ^*`. Lean: `AdicSpace.henselianComparison_colimit`.

This uses Standing condition on `Â`; `X` qcqs in `(b)`; degree ranges as for 3.2.9.

(Stacks project, Tag 09YQ (Theorem 59.51.3); Huber (1996), §2.4, Corollary 2.4.6, p. 129.)

`X = Spec A^▷/𝔞` with `𝔞` not finitely generated is the limit of the `Spec A^▷/𝔞_μ` over finitely generated `𝔞_μ ⊆ 𝔞`, and both sides of the comparison for `X` are colimits of those for the `Spec A^▷/𝔞_μ`. For `U = ⋂_n S(∅|{f_n}/1)`, the comparison for `U` is the colimit of the comparisons for the finite intersections.

*Needs:* Section 2.2; Section 2.3; Section 1.5; `EtaleCohomologyFoundations`, §§0.5–0.6; `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`); Section 1.2.

Use `SchemeAndStackFoundations`, §2.15, `gabber_affine_proper_base_change`: for every henselian pair `(A,I), X=Spec A, Z=Spec(A/I)`, and torsion abelian étale sheaf `F` on `X`, restriction `H^q(X_et,F)→H^q(Z_et,F|_Z)` is an isomorphism for every `q≥0`, with `A` arbitrary. Extend its `RΓ` comparison to `K∈D⁺(X_et)` with torsion cohomology sheaves using the hypercohomology spectral sequence.

This uses `(A, I)` henselian; `F` torsion: every local section is, locally on `X_et`, killed by some non-zero integer `(F = colim_n F[n])`; for example the constant sheaf `ℚ/ℤ`, whose sections over an infinite disjoint union of copies of `X` need not be killed by one integer; `A` arbitrary.

(Huber (1996), §3.2, Lemma 3.2.5, pp. 178-179; Stacks project, Tag 09ZI (Theorem 59.82.7, Gabber); Stacks project, Tag 09Z8 (Section 59.82, Affine analog of proper base change); Roland Huber, Étale cohomology of henselian rings and cohomology of abstract Riemann surfaces of fields, Introduction, Theorem 0.1, p. 703 (GDZ OCR).)

`A` henselian local ring `(A, 𝔪)` with residue field `k: Hⁿ(Spec A, F) ≅ Hⁿ(Spec k, F|)` is Galois cohomology of `k`. The henselian hypothesis is needed: for `A = ℤ_(3), I =` 3A and `F = ℤ`/2, the étale double cover `Spec ℤ_(3)[√7] → Spec ℤ_(3)` is non-trivial (7 is not a square in `ℚ`) but split over `𝔽_3` (7 `≡` 1 is a square), so `H¹(Spec ℤ_(3), ℤ/2) → H¹(Spec 𝔽_3, ℤ/2)` is not injective.

*Needs:* Mathlib HenselianRing; Mathlib AlgebraicGeometry.Scheme.smallEtaleTopology; Mathlib `CategoryTheory.Sheaf.H`; Section 2.1; `SchemeAndStackFoundations`, §2.15 (`gabber_affine_proper_base_change`); `EnhancedDerivedSheaves`, §§0.1–0.4 for the hypercohomology extension.

Let `A` be a ring, `J ⊆ A` an ideal, `K` a separably closed field, `s: A → K` a ring homomorphism with `t := Spec(s): Spec K → Spec A`, and `G` an abelian torsion group, viewed as a sheaf on `(Spec K)_et`. Then `Hⁱ((Spec A/J)_et, (t_*G)|_{Spec A/J}) = 0` for every `i ≥ 1`. Lean: `HenselianRing.etaleCohomology_pushforward_sepClosed_eq_zero`.

This uses `K` separably closed; `G` torsion; `A, J` arbitrary.

(Roland Huber, Étale cohomology of henselian rings and cohomology of abstract Riemann surfaces of fields, Introduction, p. 704 (GDZ OCR).)

`A = K, J = 0`: the vanishing of `Hⁱ(Spec K, G)` for separably closed `K`. `A = ℤ_(p)[T], J = (p), K` an algebraic closure of the fraction field: the input that Huber 1993 calls `A_i`, from which the Zariski–Riemann vanishing follows.

*Needs:* Section 2.3; `SchemeAndStackFoundations`, Layer 0, Sections 0.12–0.13 (`Henselization.algebra`); `EtaleCohomologyFoundations`, §§0.5–0.6; `SchemeAndStackFoundations`, Layer 2; `DiamondsAndVStacks`, layer D0, Section D0.19; Mathlib IsSepClosed.

### 2.4 Normal models and Zariski–Riemann vanishing

Let `A` be a ring, `K` a field and `s: A → K` a ring homomorphism. Let `I` be the category of triples `(X, f, g)` with `X` an integral scheme, `f: X → Spec A` projective and `g: Spec K → X` dominant with `f ∘ g = Spec(s)`; between two objects there is at most one morphism, and `I` is cofiltered. Then the subspace `{V ∈ Spv K : s(A) ⊆ V}` of the Zariski–Riemann space `Spv K` (the valuation rings of `K`, topologised by the sets `{V : a ∈ V}, a ∈ K`) is homeomorphic, via the centre maps, to the projective limit `lim_{(X, f, g) ∈ I} |X|`; every `|X|` is spectral and the transition maps are spectral, so the limit is spectral. Lean: `ValuationSpectrum.zariskiRiemannHomeomorphLimit`.

This uses `A` arbitrary; `K` a field; 'projective' in the sense of EGA.

(Roland Huber, Étale cohomology of henselian rings and cohomology of abstract Riemann surfaces of fields, §2, Lemma 2.1, p. 705 (GDZ OCR); Scholze, Étale cohomology of diamonds, §19, proof of Lemma 19.4, p. 110.)

`A = K, s =` id: the only model is `Spec K` and the space is the single point `{K}`. `A = ℤ, K = ℚ`: the space is {`ℤ_(p) : p` prime} `∪ {ℚ}`, homeomorphic to `Spec ℤ`, the final model.

*Needs:* `AdicSpacesPartII`, §R0.19.6 (`cofiltered-limits-of-spectral-spaces`); `AdicSpacesPartII`, §R0.0 (`locally-spectral-space`); Mathlib ValuationRing; Mathlib SpectralSpace; Tau Ceti TauCeti.ValuationSpectrum.

Let `X` be a normal integral scheme whose function field is separably closed, `Y ⊆ X` a closed subscheme and `f: Z → Y` an étale morphism. Then `f` is a local isomorphism: every `z ∈ Z` has an open neighbourhood mapped isomorphically onto an open subscheme of `Y`. Consequently the small étale topoi of `X` and of `Y` are equivalent to their Zariski topoi. Lean: `AlgebraicGeometry.isLocalIso_of_etale_of_isSepClosed_functionField`.

This uses `X` normal and integral with separably closed function field; `Y` closed; `f` étale.

(Roland Huber, Étale cohomology of henselian rings and cohomology of abstract Riemann surfaces of fields, §2, Lemma 2.4, p. 706 (GDZ OCR); Scholze, Étale cohomology of diamonds, §19, proof of Lemma 19.4, p. 110.)

For a valuation ring `V` with separably closed fraction field and any ideal `𝔞, (Spec V/𝔞)_et` is equivalent to the Zariski site of `Spec V/𝔞`. ECD Lemma 19.4 uses this to identify étale and Zariski topoi of the models in the limit.

*Needs:* `SchemeAndStackFoundations`, Layer 2; Mathlib AlgebraicGeometry.Scheme.smallEtaleTopology; Mathlib IsSepClosed.

Let `K` be a separably closed field, `E, F ⊆ K` subsets, and `Y :=` {`V ∈ Spv K : E ⊆ V` and `F ⊆ 𝔪_V`}, with the subspace topology of the Zariski–Riemann space `Spv K`. Then (a) `Hⁿ(Y, G) = 0` for every abelian torsion group `G` and every `n ≥ 1` (sheaf cohomology of the constant sheaf on the topological space `Y`); `(b) H¹(Y, G)` is trivial for every ind-finite group `G`. Torsion is necessary: there are algebraically closed `K` and subsets `E, F` with `H¹(Y, G) ≠ 0` for every group `G` containing an element of infinite order. In `Suggested.lean`, `ValuationSpectrum.zariskiRiemannLocus E F` is this subspace and `ValuationSpectrum.zariskiRiemann_cohomology_eq_zero` states (a), using the sheafification of the constant presheaf and Mathlib’s sheaf cohomology.

This uses `K` separably closed; `E, F` arbitrary subsets; `G` torsion (a), ind-finite `(b)`.

(Roland Huber, Étale cohomology of henselian rings and cohomology of abstract Riemann surfaces of fields, Introduction, Theorem 0.2, p. 703 (GDZ OCR); Roland Huber, Étale cohomology of henselian rings and cohomology of abstract Riemann surfaces of fields, §4, Proposition 4.1, p. 708 (GDZ OCR); Scholze, Étale cohomology of diamonds, §19, before Lemma 19.4, p. 110.)

`E = F = ∅: Y = Spv K` has the generic point `K` contained in every non-empty open subset, so constant sheaves are flasque and (a) is immediate. For algebraically closed fields `K⊆K′` and a valuation subring `V⊆K`, the discrete Zariski–Riemann space `Spa(K′,V)` is obtained by the condition `V⊆W` for valuation subrings `W⊆K′`. Its constant torsion sheaves have vanishing higher cohomology by this theorem; this is the field-extension application of Scholze, Lemma 19.4, p. 110. Both fields have the discrete topology in this application, so there is no analytic continuity requirement. The torsion hypothesis excludes the infinite-order coefficient counterexamples of Huber, *Étale cohomology of henselian rings and cohomology of abstract Riemann surfaces of fields* (1993), §4, Proposition 4.1, p. 708.

*Needs:* Section 2.4; Section 2.3; `AdicSpacesPartII`, §R0.19.6 (`cofiltered-limits-of-spectral-spaces`); `DiamondsAndVStacks`, layer D0; `SchemeAndStackFoundations`, Layer 2; `DiamondsAndVStacks`, layer D0, Section D0.19; Mathlib ValuationRing; Mathlib IsSepClosed; Mathlib `CategoryTheory.Sheaf.H`.

### 2.5 Relative and constant-coefficient comparison

Let `(A, A⁺)` be a Huber pair, not necessarily complete, satisfying Huber's standing condition: the completion `Â` is generated as an algebra by finitely many elements over a noetherian ring of definition, is strongly noetherian Tate, or is discrete (the standing condition in Conventions); `U ⊆ Spa(A, A⁺)` pro-special, `𝒰 = (Spa(Â, Â⁺), U), Y = Spec A(U), i: ℓ(𝒰) → Spec A^▷` and `j: Y → Spec A^▷` as in comparison-morphism-3-2-12. Let `f: X → Spec A^▷` be a morphism of schemes such that (a) `f` is locally of finite type, and `(b)` with `V :=` {`𝔭 ∈ Spec A^▷ : 𝔭` is not open in `A^▷`} (an open subscheme) and `g: f⁻¹(V) → V` the restriction of `f, g` is proper at every `x ∈ f⁻¹(V)` such that `f(x)` specialises to a point of `i(U) ∩ V` (for separated `g` locally of finite type: proper at `x` iff universally specialising at `x`). Put `X′ := 𝒰 ×_{Spec A^▷} X, X″ := Y ×_{Spec A^▷} X` and let `F` be a sheaf of sets (resp. ind-finite groups, resp. abelian torsion groups) on `X_et` with pullbacks `F′, F″`. Then `γ_X^*: Hⁿ(X″_et, F″) → Hⁿ(X′_et, F′)` (comparison-morphism-3-2-12) is bijective for `n = 0` (resp. `n ∈` {0, 1}, resp. all `n ≥ 0`). The case `X = Spec A^▷` is sheaf-comparison-3-2-9; condition `(b)` is what makes the comparison morphism of 3.2.12, which exists for every `X` locally of finite type, a cohomological isomorphism. Lean: `AdicSpace.henselianComparison_bijective`.

This uses Standing condition on `Â`; `U` pro-special; (a) and `(b)` as stated; coefficient types with their degree ranges.

(Huber (1996), §3.2, Theorem 3.2.10, p. 180; Huber (1996), §3.4, p. 193; Huber (1996), §3.2, Example 3.2.11, p. 181; Huber (1996), §3.7, proof of 3.7.2, p. 227.)

Huber 1996, Example 3.2.11 (Fujiwara): `A` noetherian and henselian along `I, X` proper over `Spec A ∖ V(I)` — fujiwara-comparison-3-2-11. The proof of Theorem 3.7.2 applies 3.2.10 to the henselian pair `(B, I)` and the proper scheme `X ×_S Spec B`. `X = Spec A^▷` (`f` the identity, proper): sheaf-comparison-3-2-9.

*Needs:* Section 2.3; Section 2.2; Layer 1; `AdicSpacesPartII`, layer R0 (`locally-noetherian-adic-space`); Section 1.2.

In the situation of comparison-morphism-3-2-12 (standing condition, `U` pro-special, `Y = Spec A(U), j ∘ γ ≅ i`), let `F` be a sheaf of sets (resp. ind-finite groups, resp. abelian torsion groups) on `(Spec A^▷)_et`. Then `γ^*: Hⁿ(Y_et, j^*F) → Hⁿ(𝒰_et, i^*F)` is bijective for `n = 0` (resp. `n ∈` {0, 1}, resp. all `n ≥ 0`). Lean: `AdicSpace.henselianComparison_bijective_of_spec`.

This uses As in comparison-morphism-3-2-12; `F` on `(Spec A^▷)_et`.

(Huber (1996), §3.5, proof of 3.5.13, p. 209; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §1, Theorem 1.7, p. 3.)

`U = Spa(A, A°)` for a `K`-affinoid algebra `A` (A complete, `A(U) = A`): Hansen's Theorem 1.7 (`Hⁿ(Spec A, F) ≅ Hⁿ(Spa A, µ^*F)` for every torsion abelian `F`), which Hansen deduces from the constant case affinoid-algebra-comparison-3-2-3 by cohomological descent — an independent public route for this case. Section 4.5, proof of Theorem 3.5.13 (principal-ideal case): `Hⁿ(U ×_X Z^h, K) = Hⁿ(d(Ẑ), a^*K)`.

*Needs:* Section 2.5; Section 2.3.

Let `(A, A⁺)` be a Huber pair, not necessarily complete, satisfying Huber's standing condition: the completion `Â` is generated as an algebra by finitely many elements over a noetherian ring of definition, is strongly noetherian Tate, or is discrete (the standing condition in Conventions); let `U ⊆ Spa(A, A⁺)` be a pro-special subset (special-and-pro-special-subsets), `𝒰 = (Spa(Â, Â⁺), U)` the pseudo-adic space, `Y = Spec A(U)` (henselization-along-pro-special-subset) and `γ: (𝒰_et)~ → (Y_et)~` the comparison morphism (comparison-morphism-3-2-12). For a set (resp. an ind-finite group, resp. an abelian torsion group) `G` with constant sheaves `G_Y, G_𝒰`, the maps `γ^*: Hⁿ(Y_et, G_Y) → Hⁿ(𝒰_et, G_𝒰)` are bijective for `n = 0` (resp. `n ∈` {0, 1}, resp. all `n ≥ 0`). The corollaries 3.2.2–3.2.3 are complete-affinoid-comparison-3-2-2 and affinoid-algebra-comparison-3-2-3, and the affine input Lemma 3.2.5 is affine-henselian-comparison-3-2-5. Lean: `AdicSpace.henselianComparison_constant_bijective`.

This uses Standing condition on `Â`; `A` need not be complete (which matters for the applications); `U` pro-special; constant coefficients.

(Huber (1996), §3.2, Theorem 3.2.1, p. 174; Huber (1996), §3.2, Lemma 3.2.5, pp. 178-179; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §1, after Theorem 1.7, p. 4.)

Complete `A` and `U = Spa(A, A⁺)`: complete-affinoid-comparison-3-2-2. `A = ℚ` with the `p`-adic topology, `A⁺ = ℤ_(p), U = Spa(A, A⁺)` (one point, with the étale site of `Spa(ℚ_p, ℤ_p)`): `A(U) = ℚ_p ∩ ℚ̄` and the theorem is the equality of the Galois cohomology of the henselian field `ℚ_p ∩ ℚ̄` and of `ℚ_p` with torsion coefficients (their absolute Galois groups coincide); `Spec ℚ` itself has different cohomology, which is why `A(U)` and not `A^▷` appears. For a special `U = S(∅|{T}/1) ⊆ Spa(ℤ_p[T], ℤ_p[T])` (`p`-adic topology), `Y` is the spectrum of the henselization of `ℤ_p[T]` along `(p, T)`.

*Needs:* Section 2.5; Section 2.3; Section 2.2; Layer 1; Section 1.2.

Let `(A, A⁺)` be a complete Huber pair satisfying Huber's standing condition: the completion `Â` is generated as an algebra by finitely many elements over a noetherian ring of definition, is strongly noetherian Tate, or is discrete (the standing condition in Conventions), `X = Spa(A, A⁺)` and `i⁻¹`: Et/`Spec A →` Et/`X` the morphism of sites of pseudo-adic-scheme-fibre-product. For a set (resp. an ind-finite group, resp. an abelian torsion group) `G`, the maps `Hⁿ((Spec A)_et, G) → Hⁿ(X_et, G)` are bijective for `n = 0` (resp. `n ≤ 1`, resp. all `n`). Lean: `AdicSpace.spec_spa_etaleCohomology_bijective`.

This uses A complete (Hausdorff); standing condition; constant coefficients.

(Huber (1996), §3.2, Theorem 3.2.1, p. 174; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §1, after Theorem 1.7, p. 4.)

`n = 0, G =` {0, 1}: connected components of `Spa(A, A⁺)` and of `Spec A` correspond (both are given by the idempotents of `A`). `n = 1, G` finite: `G`-torsors over `Spec A` and over `Spa(A, A⁺)` correspond; for finite étale covers this is compatible with `AdicEtaleGeometry`, layer A1 (`finite-etale-affinoid-algebra`). `A = ℚ_p⟨T⟩: Hⁿ(Spec ℚ_p⟨T⟩, μ_ℓ) ≅ Hⁿ(closed unit disc over ℚ_p, μ_ℓ)`.

*Needs:* Section 2.5; Section 2.3; Section 2.1; Section 2.2.

Let `k` be a complete nonarchimedean field, `A` a Tate algebra topologically of finite type over `k` (a quotient of `k⟨T₁`, …, `T_n⟩`) and `X = Spa(A, A°)`. For a set (resp. an ind-finite group, resp. an abelian torsion group) `G, Hⁿ((Spec A)_et, G) → Hⁿ(X_et, G)` is bijective for `n = 0` (resp. `n ≤ 1`, resp. all `n`). Hansen (Theorem 1.7) extends the abelian case to every torsion abelian sheaf pulled back from `Spec A`; within this layer that extension is the case `U = Spa(A, A°)` of sheaf-comparison-3-2-9. Lean: `AdicSpace.tateAlgebra_spec_spa_etaleCohomology_bijective`.

This uses `A` topologically of finite type over `k`; `A⁺ = A°`; constant coefficients.

(D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §3.1, p. 10; Huber (1996), §3.2, Theorem 3.2.1, p. 174.)

For `k` algebraically closed and `ℓ` invertible in the residue field: `H¹(Spec k⟨T⟩, μ_ℓ) = k⟨T⟩^×/ℓ = 0` (units are `c(1 + f)` with `c ∈ k^×` and `|f| < 1`, and both factors are `ℓ`-th powers; `Pic k⟨T⟩ = 0`), matching `H¹` of the closed unit disc. Hansen's Lemma 3.1 uses exactly this corollary for constant coefficients `(ψ_{2,n}, ψ_{3,n})`.

*Needs:* Section 2.5.

Let `A` be a noetherian ring henselian along an ideal `I`, with the `I`-adic topology (so `(A, A)` is a henselian Huber pair with `A° = A`: henselian-`f`-adic-ring), and let `X` be a scheme with a proper morphism `X → Spec A ∖ V(I)`. Put `𝒰 := (Spa(Â, Â), Spa(A, A))` with `Â` the `I`-adic completion `(Spa(A, A) ≅ Spa(Â, Â))` and `X′ := 𝒰 ×_{Spec A} X` (pseudo-adic-scheme-fibre-product); since `X` lies over `Spec A ∖ V(I), X′` lies over the analytic locus. Then for every abelian torsion sheaf `F` on `X_et`, with pullback `F′` to `X′_et`, and every `n ≥ 0`, the pullback map `Hⁿ(X_et, F) → Hⁿ(X′_et, F′)` along the morphism of sites of pseudo-adic-scheme-fibre-product (3.2.8) is bijective; equivalently `RΓ(X_et, F) ≅ RΓ(X′_et, F′)`. In particular, for `X = Spec A ∖ V(I): Hⁿ(Spec A ∖ V(I), F) ≅ Hⁿ(Spa(A, A)_a, F′)`, where `Spa(A, A)_a` is the analytic locus (points with non-open support), the generic fibre of the formal completion (`AdicEtaleGeometry`, layer A2 (`formal-generic-fibre-analytic-locus`)). Lean: `AdicSpace.fujiwara_comparison`.

This uses `A` noetherian, henselian along `I`, with the `I`-adic topology; `X` proper over `Spec A ∖ V(I)`; `F` torsion.

(Huber (1996), §3.2, Example 3.2.11, p. 181.)

`A` a henselian discrete valuation ring with fraction field `K` and `I = 𝔪: Spa(A, A)_a` is the point `Spa(K̂, Â)` and the statement is `Hⁿ(Spec K, F) = Hⁿ(Spa(K̂, Â), F)`: a henselian discretely valued field and its completion have the same Galois cohomology. `AdicEtaleGeometry`, layer A2 (`formal-generic-fibre-analytic-locus`) records this use: `Hⁿ(Spa(A, A)_a, F′)` for noetherian `A` henselian along `I`. For the principal-ideal comparison: for `I = (t), X′` is the analytification of the proper `A[1/t]`-scheme `X` over `Spa(A[1/t], A) = Spa(A, A)_a`, so this assertion is the noetherian case of Bhatt–Mathew Corollary 6.18; applied to `A` and to its `I`-adic completion `Â` (both noetherian and henselian along `I`, with the same `𝒰`) it gives `Hⁿ(Spec A ∖ V(I), F) ≅ Hⁿ(Spec Â ∖ V(IÂ), F|)`, the noetherian case of the Fujiwara–Gabber theorem (Bhatt–Mathew Theorem 6.11). The non-noetherian and strongly noetherian Tate variants are not covered.

*Needs:* Section 2.5; Section 2.1; Section 2.2; `AdicEtaleGeometry`, layer A2 (`formal-generic-fibre-analytic-locus`); Section 2.3.

### 2.6 Noetherian models of perfectoid affinoids

Let `R` be a `p`-torsion-free integral perfectoid `ℤ_p`-algebra with `R = (R[1/p])°`, and put `X = Spa(R[1/p],R)`. Choose the filtered system of finite-type `ℤ_p`-subalgebras `R_j` of `R`, enlarged to their integral closures in `R_j[1/p]`. Write `R_j^h` for the henselization along p. The inclusions `R_j → R` extend uniquely to `R_j^h → R`, and `R = colim_j R_j^h` as rings. The adic system `X_j = Spa(R_j[1/p],R_j)` has common ideal of definition `(p)`; its completed colimit presents `X`. This is approximation data, not a claim that `R` is Noetherian or that `X` is an ordinary categorical inverse limit.

(Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, p. 10; Kęstutis Česnavičius, Purity for the Brauer group, §4.8, p. 9.)

Provide `PerfectoidHuberApproximation`: The filtered rings `R_j`, their henselizations, common `p`-adic ideal, transition maps and maps into `R`; `PerfectoidHuberApproximation.henselianMap`: The unique extension `R_j^h → R` of `R_j → R`; `PerfectoidHuberApproximation.ringColimit`: `R ≅ colim R_j^h` as rings; `PerfectoidHuberApproximation.adicStage`: `X_j = Spa(R_j[1/p],R_j)` with its `f`-adic topology.

Provide `PerfectoidHuberApproximation.refine`: Finite collections of elements and finite-presentation equations descend after a common refinement; `PerfectoidHuberApproximation.stage_isHuberPair`: Each `R_j` is noetherian, `p`-torsion free and integrally closed in `R_j[1/p]`, so `(R_j[1/p], R_j)` is a Huber pair whose completion has the noetherian ring of definition `R̂_j` (Huber's standing condition in Section 2.3), and its henselization is `R_j^h[1/p]`.

**Checks.**

- A finite tuple in `R` is contained in one finite stage.
- `R_j → R` factors through `R_j^h`, and the two factorizations coincide on refinement.
- For `R` the `p`-adic completion of `ℤ_p[p^{1/p^∞}]` (the valuation ring of the completion of `ℚ_p(p^{1/p^∞})`), every stage `R_j` is noetherian, `ℤ_p[p^{1/pⁿ}]` is a stage for every `n` (it is integrally closed in `ℚ_p(p^{1/pⁿ})`), and `R` itself is not noetherian (its maximal ideal `⋃_n p^{1/pⁿ}R` is not finitely generated).

*Needs:* Section 2.1; `AdicSpacesPartII`, layer R0 (`locally-noetherian-adic-space`); `SchemeAndStackFoundations`, Layer 0, Sections 0.12–0.13 (`Henselization.algebra`); the supplier contracts; Tau Ceti `TauCeti.ValuationSpectrum.spa_integralClosure`.

For the model system in perfectoid-noetherian-approximation, `X = Spa(R[1/p],R)` satisfies `X ∼ lim_j X_j`: its underlying topological space is the inverse limit of `|X_j|`, rational subsets are pulled back from a finite stage, and the colimit of finite-stage rings of sections has dense image on rational affinoids. These are the separate topological and density clauses of HuberTildeLimit; no universal mapping property of an ordinary inverse limit is asserted.

(Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, p. 10; Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, (4.10.6), p. 10.)

*Needs:* Section 2.6; Section 1.5; the supplier contracts; `PerfectoidSpaces`, layer P3 (`perfectoid-tate-rings-are-strongly-sheafy`); `AdicSpacesPartII`, layer R0 (`locally-noetherian-adic-space`).

For the system `X ∼ lim_j X_j` above, qcqs étale `X`-spaces, their morphisms, finite fibre products and finite covering families descend to some `X_j` and two descended data agree after a further stage. Thus the qcqs étale site of `X` is the filtered 2-colimit of the qcqs étale sites of `X_j`. This is the colimit-presented case of Section 1.5 (Česnavičius footnote 3: noetherian stages, perfectoid completed limit); it is not inferred from the topological part of a tilde-limit alone, and the perfectoid hypothesis enters only through the sheafiness of `X` and of its rational localisations.

(Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, p. 10; Kęstutis Česnavičius, Purity for the Brauer group, §4.10, footnote 3, p. 10.)

*Needs:* Section 2.6; Section 1.5; `PerfectoidSpaces`, layer P3 (`perfectoid-tate-rings-are-strongly-sheafy`); `PerfectoidSpaces`, layer P3 (`perfectoid-vs-analytic-finite-etale`).

For a finite locally constant abelian sheaf `G_j` on `X_j` and `G` its pullback to `X`, every finite truncation of a qcqs étale hypercover of `X` together with the coefficient cocycle needed to compute a fixed `H^q(X,G)` descends to a later `X_k`. Coboundaries and identifications descend after another refinement. Consequently `colim_{k≥j} H^q(X_k,G_k) ≅ H^q(X,G)` for every `q≥0`. This is continuity of cohomology, not commutation with an inverse limit of coefficient groups.

(Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, p. 11; Kęstutis Česnavičius, Purity for the Brauer group, §4.10, footnote 4, p. 11.)

*Needs:* Section 2.6; Section 1.5.

With `R = colim_j R_j^h` and a finite étale commutative `p`-primary group scheme `G` over `R[1/p], G` descends to a finite étale commutative group scheme `G_j` over `R_j[1/p]` for some `j` (`R[1/p] = colim_k R_k[1/p]`; Česnavičius descends `G` to `R_j[1/p]`, the form Huber 3.2.9 needs on the analytic side), `G_k` denoting its base change to `R_k^h[1/p]`, and `colim_{k≥j} H^q(Spec(R_k^h[1/p]),G_k) ≅ H^q(Spec(R[1/p]),G)` for all `q≥0`. The finite generic schemes here are `Spec(R_k^h[1/p])`, not `Spec(R_k[1/p])`.

(Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, (4.10.5), p. 10; Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, p. 10.)

*Needs:* Section 2.6; `EtaleCohomologyFoundations`, §§0.5–0.6; Mathlib AlgebraicGeometry.Scheme.smallEtaleTopology.

For each Noetherian `p`-adic model `R_j` as above and every abelian torsion sheaf `G_j` on `Spec(R_j[1/p])_ét` (for instance the finite étale group scheme to which `G` descends), pulled back to `Spec(R_j^h[1/p])` and to `X_j, H^q(Spec(R_j^h[1/p]),G_j) ≅ H^q(Spa(R_j[1/p],R_j),G_j^an)` canonically for `q≥0`. The map is `γ^*` of Section 2.3 for `U = Spa(R_j[1/p], R_j)`, whose henselization `A(U)` is `R_j^h[1/p]` (henselization-along-pro-special-subset, (3.1.13)(i)). The ambient Noetherian hypotheses are checked only at `R_j`; neither `R` nor `R[1/p]` is put into that theorem.

(Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, p. 11.)

*Needs:* Section 2.6; Section 2.5; Section 2.3; Section 2.2.

For `j≤k` the Noetherian generic comparison gives a commutative square between `H^q(Spec(R_j^h[1/p]),G_j) → H^q(Spec(R_k^h[1/p]),G_k)` and `H^q(X_j,G_j^an) → H^q(X_k,G_k^an)`. The identifications also commute with coefficient morphisms and the connecting maps of short exact coefficient sequences.

(Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, p. 11.)

*Needs:* Section 2.6; Section 1.1; Section 2.2; Section 2.3.

Let `R` be `p`-torsion-free integral perfectoid with `R=(R[1/p])°`, and let `G` be a finite étale commutative group scheme of `p`-power order over `R[1/p]`. For every `q≥0` the canonical pullback induces `H^q_et(Spec(R[1/p]),G) ≅ H^q_et(Spa(R[1/p],R),G^an)`. The proof is the colimit of comparisons for `Spec(R_j^h[1/p])` and `Spa(R_j[1/p],R_j)`, using coherent-site continuity on the analytic side and L2 scheme continuity on the other side. No blanket Noetherian comparison is applied at the perfectoid limit.

(Kęstutis Česnavičius, Purity for the Brauer group, §4.10, Theorem 4.10, p. 9; Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, p. 11.)

All degrees `q≥0` and all finite commutative `p`-primary `G`, including nonconstant `G`, are retained. The proof visibly passes through `R_j^h[1/p]`; replacing it with `R_j[1/p]` is rejected. The only perfectoid input is that `Spa(R[1/p], R)` is a strongly sheafy adic space whose étale site is the one of Česnavičius's footnote 2 (`PerfectoidSpaces`, layer P3); the limit statements are the colimit-presented Layer 1 results with noetherian stages.

*Needs:* Section 2.6.

For the tilt `R^♭`, with `ϖ^♭` as in Česnavičius 4.9 so that `R^♭ = (R^♭[1/ϖ^♭])°` (`PerfectoidSpaces`, layer P1 (`rings-of-integral-elements-under-tilting`)), apply the same approximation and henselization argument to finite-type `𝔽_p[ϖ^♭]`-models. For finite étale commutative `p`-primary `G^♭` over `R^♭[1/ϖ^♭], H^q(Spec(R^♭[1/ϖ^♭]),G^♭) ≅ H^q(Spa(R^♭[1/ϖ^♭],R^♭),G^{♭,an})` for all `q≥0`. Finite stages are henselized along `ϖ^♭` and only then localized.

(Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, p. 11.)

For the tilt `R^♭` and a chosen pseudouniformizer `ϖ^♭`, apply the same approximation and henselization argument to finite-type `𝔽_p[ϖ^♭]`-models. For finite étale commutative `p`-primary `G^♭` over `R^♭[1/ϖ^♭], H^q(Spec(R^♭[1/ϖ^♭]),G^♭) ≅ H^q(Spa(R^♭[1/ϖ^♭],R^♭),G^{♭,an})` for all `q≥0`. Finite stages are henselized along `ϖ^♭` and only then localized.

*Needs:* `EtaleCohomologyFoundations`, §§0.5–0.6; Section 2.6; `PerfectoidSpaces`, layer P1 (`rings-of-integral-elements-under-tilting`).

Under the hypotheses of the preceding mixed- and equal-characteristic comparisons, let `G^♭` correspond to `G` under the finite-étale tilting equivalence (`PerfectoidSpaces`, layer P3 (`finite-etale-tilting-equivalence`); Česnavičius (4.9.3), Kedlaya–Liu 3.6.23). Their cohomology groups `H^q(Spec(R[1/p]),G)` and `H^q(Spec(R^♭[1/ϖ^♭]),G^♭)` are canonically identified for `q≥0` by passing to the two analytic étale sites and their tilting equivalence. This export is the cohomology step used in Česnavičius 4.10; it does not assert Brauer purity or vanishing of all such cohomology.

(Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, (4.10.3), p. 10.)

*Needs:* Section 2.6; `PerfectoidSpaces`, layer P3 (`etale-site-tilting-equivalence`); `PerfectoidSpaces`, layer P3 (`finite-etale-tilting-equivalence`).

The canonical comparison `H^q(Spec(R[1/p]),G)→H^q(Spa(R[1/p],R),G^an)` obtained through finite Noetherian henselized models is independent of the cofinal model system and the stage where `G` descends. `A` common refinement compares any two finite data and the natural finite-stage squares agree. Thus the proof gives the canonical pullback comparison rather than a choice-dependent isomorphism.

(Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, p. 11.)

*Needs:* Section 2.6.

The perfectoid generic scheme/adic cohomology comparison is natural in finite étale commutative `p`-primary `G` and commutes with the long exact sequences of short exact coefficient sequences. Both sides use the same descended finite-stage morphisms, while filtered colimits of abelian groups are exact. This coefficient compatibility concerns finite torsion groups and makes no inverse-limit `ℤ_p` assertion.

(Kęstutis Česnavičius, Purity for the Brauer group, §4.10, proof of Theorem 4.10, p. 11.)

*Needs:* Section 2.6.

### Examples

Let `C` be a complete algebraically closed mixed-characteristic field, `A⁺=O_C⟨T⟩` and `I=(p)`. For `n` prime to `p`, the element `u=1+`pT has a unique root `b` congruent to 1 modulo `I` with `bⁿ=u`. Apply henselian root lifting to `Xⁿ−u` at the root 1 modulo `I`; its derivative is the unit `n`. The same argument with `n=p` has nonunit derivative and supplies no conclusion. This distinguishes a henselian pair statement from a claim about unrestricted `p`-th roots in an analytic function ring. (Huber (1996), Lemma 3.1.3, p. 164; Stacks, More on Algebra, §15.11, tags 09XE and 0ALJ.)

For a scheme over a discrete ring `A`, the associated non-analytic adic construction is available without putting a Tate topology on `A`. Its comparison with scheme fibre products retains non-analytic points. By contrast, for a perfectoid closed coordinate disc, the completed `p`-power-root tower uses analytic finite-type stages; its stage rings need not be perfectoid. Descent of an étale object or a finite cohomology calculation means finding a finite stage through the henselized comparison, not asserting that every stage has a perfectoid structure. (Huber (1996), Proposition 3.2.7 and Remark 3.2.8, pp. 180–181; Scholze, *Étale cohomology of diamonds*, Lemma 19.4, p. 110.)

### Dependencies

Use Layer 1, Mathlib’`s` henselian ring/ideal, valuation ring, spectrum and localization carriers, and the formal and affine geometry of `AdicSpacesPartII`, layers R0–R1, and `AdicSpacesPartIII`, layers F0, R2 and R3. Scheme strict henselization and étale topoi are `SchemeAndStackFoundations`, Layers 0 and 2. `PerfectoidSpaces`, P1–P3 and P7, supplies perfectoid geometric approximation and henselian algebraization in its stated scope. The normal-model and Zariski–Riemann vanishing assertions here supply the cohomological comparison; neither a geometric tilde-limit nor ordinary scheme invariance replaces them.

## Layer 3: Preadic local systems and analytic covering spaces

### 3.1 Taut spaces and strict analytic geometry

A locally spectral space `T` (`AdicSpacesPartII`, §R0.0 (`locally-spectral-space`)) is taut if it is quasi-separated (the intersection of two quasi-compact open subsets is quasi-compact) and the closure of every quasi-compact open subset of `T` is quasi-compact; for quasi-separated `T` this is equivalent to asking that the closure of every quasi-compact subset be quasi-compact. A locally spectral map `g` : T' `→ T` of locally spectral spaces (`AdicSpacesPartII`, §R0.0 `IsLocallySpectralMap`) is taut if `g⁻¹(W)` is taut for every taut open subset `W ⊆ T`. An adic space, or a morphism of adic spaces, is taut if its underlying locally spectral space, or locally spectral map, is. Examples fixed by the definition: every quasi-compact quasi-separated space is taut; a quasi-separated space admitting a locally finite covering by quasi-compact open subsets is taut; every quasi-compact quasi-separated spectral map is taut; the composite of taut maps is taut. Non-example: the adic space obtained by gluing two copies of the closed unit disc over an analytic field along the complement of the origin is not taut, because that complement is not quasi-compact.

This uses `T` locally spectral; quasi-separatedness is part of the definition, never an extra hypothesis; tautness of a morphism quantifies over taut open subsets of the target, not over quasi-compact ones.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Definition 8.1.10, p. 158; Scholze, Étale cohomology of diamonds, §18, before Proof of Proposition 18.10, p. 107; K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Remark 8.1.11, p. 158; Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Appendix A, Remark A.4, p. 84.)

Provide `AdicSpace.IsTaut`: The predicate on a locally spectral space `T`: Mathlib's `QuasiSeparatedSpace T`, and every quasi-compact open subset has quasi-compact closure; `AdicSpace.IsTaut.isCompact_closure`: If `T` is taut and `A ⊆ T` is quasi-compact then `closure(A)` is quasi-compact; `AdicSpace.IsTaut.of_compactSpace`: `A` quasi-compact quasi-separated locally spectral space is taut; `AdicSpace.IsTaut.of_locallyFinite`: `A` quasi-separated space with a locally finite covering by quasi-compact open subsets is taut.

Provide `AdicSpace.IsTaut.isOpen_subset`: `A` partially proper open subset of a taut adic space over an analytic field is taut (Kedlaya–Liu 8.2.12`(c)`); `AdicSpace.IsTautMap`: The predicate on a locally spectral map `g` : T' `→ T: g⁻¹(W)` is taut for every taut open `W ⊆ T`; `AdicSpace.IsTautMap.of_qcqs`: Quasi-compact quasi-separated spectral maps are taut; `AdicSpace.IsTautMap.comp`: The composite of taut maps is taut; the identity is taut.

Provide `AdicSpace.IsTaut.of_isTautMap`: If `g` : T' `→ T` is taut and `T` is taut then T' is taut; `AdicSpace.IsTaut.of_partiallyProper`: If `f : X → Y` is partially proper and `Y` is a quasi-compact quasi-separated analytic adic space then `X` is taut (`AdicSpacesPartII`, layer R0 (`partially-proper-closure-quasi-compact`)); `AdicSpace.IsTautMap.of_partiallyProper`: `A` partially proper morphism of analytic adic spaces is taut (Hub96 Lemma 5.1.4, restated in Zavyalov PD Remark `A`.4).

**Checks.**

- `Spa(K⟨T⟩, K°⟨T⟩)` is taut for every complete nonarchimedean field `K`.
- The adic affine line `A^{1,ad}_K` is taut but not quasi-compact.
- The gluing of two closed unit discs along the complement of the origin is not taut (it is not quasi-separated).
- For a quasi-separated locally spectral `T`: IsTaut `T ↔ ∀ A ⊆ T`, IsCompact `A →` IsCompact (closure `A`).
- Every quasi-compact quasi-separated spectral map (in particular the identity) is taut.
- The open unit disc `D→Spa(C,O_C)` is partially proper, taut and locally spectral. It is not globally `IsSpectralMap`: the preimage of the compact open base is the non-quasi-compact disc.

The closed unit disc `Spa(K⟨T⟩, K°⟨T⟩)` and every affinoid adic space are taut. The analytic affine line `A^{1,ad}_K` (`AdicSpacesPartII`, layer R1 (`analytic-affine-space`)) is taut: the annuli `{|ϖ|^{-k} ≤ |T| ≤ |ϖ|^{-k-1}}` and the unit disc form a locally finite quasi-compact open cover. The doubled disc of Kedlaya–Liu Remark 8.1.11 is not taut.

*Needs:* `AdicSpacesPartII`, §R0.0 (`locally-spectral-space`); `AdicSpacesPartII`, layer R0 (`partially-proper-closure-quasi-compact`); Mathlib QuasiSeparatedSpace; Mathlib IsCompact; Mathlib closure; `AdicSpacesPartII`, §R0.0 `IsLocallySpectralMap`; Mathlib IsSpectralMap for the quasi-compact cases.

Starting with the affinoid spectra `M(A)` of the affinoid-spectrum supplier, define `StrictAnalyticSpace K` by strict affinoid atlases and compatible analytic-domain identifications on intersections, with refinement equivalence; require the resulting topological space to be Hausdorff. Morphisms are locally analytic maps compatible with domain refinements. Define quasi-étale and quasi-smooth morphisms by their local affinoid presentations, and étale and smooth morphisms by the respective additional absence of relative boundary. Prove that gluing the affinoid correspondence `M(A)↔Spa(A,A°)` gives an equivalence with taut adic spaces locally of finite type over `Spa(K,O_K)`. Write `u` for the Berkovich realization and `s₀` for its inverse. The underlying space of `u(X)` is `X_max` with the maximal Hausdorff quotient topology. `A` partially proper adic map realizes as a boundaryless map; a proper map realizes as a proper map. Adic étale and smooth maps realize as quasi-étale and quasi-smooth maps; partial properness upgrades these to étale and smooth maps.

This uses `K` complete, nontrivially rank-one valued; strict analytic spaces Hausdorff; the adic spaces taut and locally of finite type over `Spa(K,O_K)`.

(Huber (1996), §8.1, Lemma 8.1.8, p. 403; §8.3, Proposition 8.3.1 and proof, pp. 423–426; Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Appendix A, Definition A.6, Lemmas A.7–A.8 and Corollary A.11, pp. 84–86.)

Provide `StrictAnalyticSpace.affinoid`: The strict affinoid space `M(A)` with its analytic-domain atlas; `StrictAnalyticSpace.glue`: Glue compatible strict affinoid domain atlases, invariant under common refinement; `StrictAnalyticSpace.Hom`: Locally analytic maps compatible with atlas changes, with identity and composition; `StrictAnalyticSpace.quasiEtale`: Local analytic-domain restriction followed by an étale affinoid morphism.

Provide `StrictAnalyticSpace.quasiSmooth`: The quasi-smooth affinoid local presentation, invariant under domain refinement; `StrictAnalyticSpace.u`: The realization of a taut rigid adic space; `StrictAnalyticSpace.s₀`: The inverse construction, with the unit and counit of the equivalence; `StrictAnalyticSpace.u_max`: Identify `|u(X)|` with the rank-one maximal Hausdorff quotient.

Provide `StrictAnalyticSpace.u_partiallyProper`: Partial properness implies absence of relative boundary; `StrictAnalyticSpace.u_proper`: Properness is preserved and reflected; `StrictAnalyticSpace.u_etale_smooth`: Quasi-étale and quasi-smooth comparison, upgraded for partially proper maps.

**Checks.**

- The realization of `Spa(K,O_K)` is `M(K)`, a one-point analytic space.
- The closed unit disc realizes as `M(K⟨T⟩)`; its Gauss boundary is retained, so its structure map is quasi-smooth but has boundary.
- The open unit disc is boundaryless and is the inverse image of the open Berkovich disc under the maximal quotient.
- `A` rank-two specialization of a Gauss point has the same rank-one image as its generalization, so the quotient map is not injective on the adic point set.

Prove atlas independence by common rational-domain refinement, and prove the morphism comparisons using relative reductions and the valuative criterion for partial properness.

*Needs:* `AdicSpacesPartIII`, Section R3.9 (`gelfand-spectrum-banach-ring`); Section 3.1.

For a Hausdorff strict analytic `Z` over `K`, define `StrictAnalyticEtaleSite Z`: objects are étale maps `W→Z` with `W` Hausdorff and strictly `K`-analytic, and covering families are jointly surjective. Pullback and composition use analytic fibre products. Prove that this strict subsite is a basis for the full Berkovich étale site, so restriction induces an equivalence of topoi. This construction specializes the existing generic site and sheaf machinery to the strict analytic carrier. Provide `StrictAnalyticEtaleSite.fiberProduct`, `StrictAnalyticEtaleSite.comp`, `StrictAnalyticEtaleSite.cover_iff_jointlySurjective` and `StrictAnalyticEtaleSite.sheafEquiv`, the strict-basis comparison.

This uses `K` complete and nontrivially rank-one valued; `Z` Hausdorff strictly `K`-analytic.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Appendix A, Definition A.13, p. 86; Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Appendix A, Remark A.14, p. 86.)

Provide `StrictAnalyticEtaleSite`: The category of strict étale analytic `Z`-spaces and its covering topology; `StrictAnalyticEtaleSite.cover_iff`: `A` covering family has jointly surjective images on `Z`-points after every pullback; `StrictAnalyticEtaleSite.baseChange`: Pullback of étale objects and coverings along analytic morphisms; `StrictAnalyticEtaleSite.toposEquiv`: Restriction from the full étale site is an equivalence, with compatible stalks and cohomology.

**Checks.**

- At `M(K)`, the objects are disjoint unions of finite separable spectra `M(L)`, giving discrete `G_K`-sets.
- The identity family covers every `Z`, while the empty family covers exactly the empty analytic space.
- `A` disjoint union of two nonempty components requires both component inclusions for a cover; either inclusion alone fails joint surjectivity.

Use local strictness of an étale map over a strict base and descent under affinoid refinements to prove the basis hypotheses.

*Needs:* Section 3.1; `DiamondsAndVStacks`, layer D0.

For taut rigid `X` over `Spa(K,O_K), θ_X:X_et→u(X)_et,s` is induced by the functor sending a strict Berkovich étale `Y→u(X)` to `s₀(Y)→X`. The functor is well-defined because `s₀` sends étale maps to partially proper étale adic maps. Denote its exact inverse image by `θ_X^*`. For `f:X→Y` between taut rigid spaces the square of `θ_X,θ_Y,f,u(f)` commutes, with the canonical pullback identification `θ_X^*u(f)^*≅f^*θ_Y^*`.

This uses `K` complete and nontrivially rank-one valued; `X,Y` taut adic spaces locally of finite type over `Spa(K,O_K)`; the strict analytic realization and its inverse are those constructed above.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Appendix A, before Theorem A.15, p. 87; Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Appendix A, Remark A.12, p. 86.)

Provide `AdicBerkovichToposMorphism`: The morphism `θ_X` with its inducing site functor; `AdicBerkovichToposMorphism.etaleObject`: Send `Y→u(X)` to `s₀(Y)→X`; `AdicBerkovichToposMorphism.pullback`: The exact inverse-image functor `θ_X^*` on abelian sheaves; `AdicBerkovichToposMorphism.naturality`: `θ_X^*u(f)^*≅f^*θ_Y^*`.

Provide `AdicBerkovichToposMorphism.stalkMaximal`: At a maximal geometric point, `θ_X^*` has the corresponding Berkovich stalk; `AdicBerkovichToposMorphism.constant`: `θ_X^*` preserves constant coefficient sheaves and their Tate twists.

**Checks.**

- `θ_X^*ℤ/n` is the constant `ℤ/n` sheaf on `X`.
- For `X = Spa(K, O_K) (u(X) = M(K)), θ_X^*` is an equivalence `Ab(M(K)_ét.s) ≃ Ab(X_ét)`, both identified with discrete `Gal(K^sep/K)`-modules by the stalk at a geometric point.
- For a rank-one point `x` of `X`, viewed as a point of `|u(X)|`, and a geometric point `x̄` over it, `(θ_X^*G)_{x̄} ≅ G_{x̄}` naturally in `G ∈ Ab(u(X)_ét.s)`.
- For `X` the closed unit disc over `K` and `j: U → X` the quasi-compact open `{|T| ≤ |ϖ|}, j_`!`ℤ/n` with `n>1` is not isomorphic to `θ_X^*G` for any `G` (it is not overconvergent, Section 3.2).

For composable `f: X → Y` and `g: Y → Z` in `(A)₀` the identifications `θ_X^*u(f)^* ≅ f^*θ_Y^*` compose to the one for `g ∘ f`, as needed to transport traces along compositions (Zavyalov Theorem 5.3.3 (2)).

*Needs:* Section 3.1; `AdicEtaleGeometry`, layer A1; Section 1.1; Mathlib CategoryTheory.Functor.sheafPullback.

Prove `strictAnalytic.local_arcwise_connected`: every point of a strict `k`-analytic space has a basis of open locally compact, paracompact, arcwise connected neighborhoods. In particular a connected analytic space is arcwise connected, and its connected components are open. The affinoid form first supplies open arcwise connected neighborhoods countable at infinity; the analytic atlas transports this basis across gluing. This is a topological input to the paths and fibre-orbit theorems in Section 3.6. Local arcwise connectedness is retained when restricting to an ordinary open subspace. It does not identify a rational affinoid domain with an ordinary open subset of the Hausdorff spectrum. (Berkovich (1993), Remark 1.2.4(iii), p. 16; de Jong (1995), §2, pp. 90–96.)

*Needs:* the strict analytic atlas and adic–Berkovich comparison of this section; `AdicSpacesPartIII`, layer R3, for affinoid spectra; Mathlib's path and connectedness predicates.

### 3.2 Overconvergence and strict analytic sheaves

For an analytic adic space `X` an abelian étale sheaf `F` is overconvergent when every specialization `η₁→η₂` of geometric points induces an isomorphism `F_{η₂}→F_{η₁}`. Here a specialization `η₁ → η₂` is a morphism `ε_{η₁} → ε_{η₂}` of the corresponding points of the site `X_ét` (Mathlib `GrothendieckTopology.Point.Hom`: a natural transformation `ε_{η₂} ⇒ ε_{η₁}` of fibre functors, `i.e`. a functorial lift of `η₁` to every étale neighbourhood of `η₂`, equivalently an `X`-morphism of strict localisations `X(η₁) → X(η₂)`), and `F_{η₂} → F_{η₁}` is the induced map `Point.Hom`.sheafFiber. `Ab_ov(X_et)` is the full subcategory of such sheaves. The quantifier includes geometric points with higher-rank plus rings and their specialization maps; it is not only a condition on closed points or on a chosen rank-one subspace.

This uses `X` a locally strongly sheafy analytic adic space; geometric points `Spa(C, C⁺) → X` with `C⁺` of any rank (`AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`)).

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Appendix A, Definition A.17, p. 87; Huber (1996), §8.2, Definition 8.2.1 and Remark 8.2.2, pp. 407–408.)

Provide `OverconvergentEtaleSheaf`: The full subcategory `Ab_ov(X_et)`; `OverconvergentEtaleSheaf.specializationIso`: The stalk isomorphism for every geometric specialization; `OverconvergentEtaleSheaf.ofStalkIsos`: Construct the overconvergence property from the full family of specialization isomorphisms; `OverconvergentEtaleSheaf.restrict`: Restriction preserves all specialization isomorphisms.

Provide `OverconvergentEtaleSheaf.isoInvariant`: Overconvergence is invariant under sheaf isomorphism; `OverconvergentEtaleSheaf.abelian`: `Ab_ov(X_ét)` is closed under kernels, cokernels, extensions and colimits in `Ab(X_ét)`, since stalk functors are exact and commute with colimits and specialisation maps are natural; `OverconvergentEtaleSheaf.ofIsLocallyConstant`: Locally constant sheaves (Section 1.4) are overconvergent.

**Checks.**

- A constant abelian sheaf is overconvergent.
- On `X = Spa(K, O_K)` every abelian étale sheaf is overconvergent: `X` is one rank-one point, every strict localisation is `Spa(Ĉ, O_Ĉ)` for the completed separable closure, and every specialisation is an isomorphism of points.
- For `X` the closed unit disc over `K` and `j: U → X` the quasi-compact open `{|T| ≤ |ϖ|}, j_`!`Λ (Λ ≠ 0)` is not overconvergent: the Gauss point `x` of radius `|ϖ|` lies in `U`, and its rank-two specialisation `x′` with `|ϖ| < |T(x′)| < r` for every real `r > |ϖ|` does not, so the specialisation map `(j_!Λ)_{x̄′} = 0 → (j_!Λ)_{x̄} = Λ` is not an isomorphism.

For an analytic adic space `X` an abelian étale sheaf `F` is overconvergent when every specialization `η₁→η₂` of geometric points induces an isomorphism `F_{η₂}→F_{η₁}`. `Ab_ov(X_et)` is the full subcategory of such sheaves. The quantifier includes geometric points with higher-rank plus rings and their specialization maps; it is not only a condition on closed points or on a chosen rank-one subspace.

*Needs:* Section 1.2; `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); Mathlib `CategoryTheory.GrothendieckTopology.Point.Hom`; Mathlib `CategoryTheory.GrothendieckTopology.Point.Hom`.sheafFiber.

For a taut rigid `K`-space `X, θ_X^*:Ab(u(X)_et,s)→Ab(X_et)` is fully faithful with essential image exactly `Ab_ov(X_et)`, hence induces an equivalence with that full subcategory. It does not assert an equivalence between all adic étale sheaves and Berkovich sheaves. This is Zavyalov Lemma `A`.18, importing Huber 8.3.5.

This uses `K` complete with a nontrivial rank-one valuation; `X` a taut rigid `K`-space (Zavyalov's `(A)₀`).

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Appendix A, Lemma A.18, p. 87; Huber (1996), §8.3, Theorem 8.3.5, pp. 427–428.)

For `X = Spa(K, O_K), u(X) = M(K)`: every sheaf on `X_ét` is overconvergent and `θ_X^*` identifies both categories with discrete `Gal(K^sep/K)`-modules; for the closed unit disc, `j_`!`ℤ/n` with `n>1` and `j` the quasi-compact open `{|T| ≤ |ϖ|}` is not in the essential image.

*Needs:* Section 3.1; Section 3.2.

On a locally strongly sheafy analytic adic space `X` (for instance any rigid space, taut or not), equality of two morphisms between overconvergent abelian sheaves can be checked at geometric points over maximal points of `X`. A morphism between them is an isomorphism if and only if those maximal geometric stalk maps are isomorphisms. Every geometric point `η₂: Spa(C, C⁺) → X` receives the specialisation `η₁ → η₂` from `η₁: Spa(C, O_C) → Spa(C, C⁺) → X`, which lies over the unique rank-one generalisation of the support of `η₂`, and overconvergence transports the stalk test; this does not say that an arbitrary unrelated family of stalk maps extends to a sheaf morphism.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, §5.3, proof of Theorem 5.3.3, p. 78.)

On a taut rigid `X`, equality of two morphisms between overconvergent abelian sheaves can be checked at geometric points over maximal points of `X`. A morphism between them is an isomorphism if and only if those maximal geometric stalk maps are isomorphisms. Every geometric point specializes along its unique maximal generalization and overconvergence transports the stalk test; this does not say that an arbitrary unrelated family of stalk maps extends to a sheaf morphism.

*Needs:* Section 3.2; `AdicSpacesPartII`, layer R0; Section 1.2; `AdicEtaleGeometry`, layer A1 (`etale-enough-points`); `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`).

For a morphism of analytic adic spaces `f:X→Y, f^*` sends overconvergent abelian sheaves to overconvergent sheaves: each specialization of geometric points of `X` maps to a specialization over `Y` and the corresponding stalk map is the pullback of the original isomorphism. On taut rigid spaces this agrees with the `θ`-naturality identification whenever the Berkovich realization is available.

This uses `f: X → Y` a morphism of locally strongly sheafy analytic adic spaces.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Appendix A, proof of Lemma A.19, p. 88; Huber (1996), §8.2, Proposition 8.2.3(i), p. 408.)

*Needs:* Section 3.2; Section 3.1; Section 1.1; `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`).

Under the taut strict-analytic realization above, inverse images of Berkovich open subsets are exactly partially proper open adic subspaces. Ordinary étale cohomology of an overconvergent sheaf agrees with that of its strict analytic realization. This applies to locally constant coefficients on a smooth curve. The ordinary comparison does not identify the two compact-support theories on a closed analytic disc.

This uses `K` complete and nontrivially rank-one valued; base `Spa(K,O_K)`; overconvergent coefficients for the cohomology assertion.

(Huber (1996), §8.3, Theorem 8.3.5 and proof, pp. 427–430.)

For a closed unit disc the Berkovich space is compact while the adic disc has a boundary in its universal compactification. For the open disc the quotient inverse image is partially proper.

*Needs:* Section 3.1; Section 3.2.

### 3.3 Integral, isogeny and rational coefficients

Fix a prime `p` and a preadic space `X` in the sense of Kedlaya–Liu §8.2 (Definition 8.2.3). For every preadic affinoid covering `U_i = Spã(A_i,A_i⁺)`, take descent data for finite-free `ℤ_p`-local systems on `Spec(A_i)`: compatible inverse systems `T_n` of finite locally free `ℤ/pⁿ`-sheaves, with `T_{n+1}/pⁿ ≅ T_n`, and transition isomorphisms on affinoid coverings of `U_i∩U_j` satisfying the triple-overlap cocycle. The category `PreadicSpace.ZpLocalSystem(X)` consists of these data modulo common refinement, with morphisms descended on common refinements. It is the category of Definition 8.4.3, without a sheafiness or strong-noetherianness assumption on `X`. On a locally strongly sheafy analytic space it agrees with the finite-free part of Section 1.4; a finitely generated `ℤ_p`-sheaf with `p`-torsion is not an integral lattice in this category.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Definition 8.4.3, p. 168; Definition 1.4.1, p. 20.)

Provide `PreadicSpace.ZpLocalSystem`: The refinement-invariant category described above; `PreadicSpace.ZpLocalSystem.ofDescent`: Integral descent data on an affinoid cover give a local system; `PreadicSpace.ZpLocalSystem.restrict`: Restriction to a preadic open or an affinoid refinement preserves the inverse system and cocycle; `PreadicSpace.ZpLocalSystem.pullback`: Pullback along a preadic morphism, with canonical identity and composition isomorphisms.

Provide `PreadicSpace.ZpLocalSystem.modPow`: `T ↦ T_n` is finite locally free over `ℤ/pⁿ` and `T_{n+1}/pⁿ ≅ T_n`; `PreadicSpace.ZpLocalSystem.equivLisse`: On strongly sheafy analytic `X`, equivalence with finite-free lisse `ℤ_p`-systems in Layer 1; `PreadicSpace.ZpLocalSystem.tensor`: Tensor product, dual and internal `Hom`, computed levelwise on the `T_n` over every affinoid; compatible with pullback and with `T ↦ T_n`; the trivial rank-one system is the unit.

**Checks.**

- The trivial system of rank `r` has `T_n = (ℤ/pⁿ)ʳ` on every affinoid and identity overlap maps.
- On the empty preadic space the category has one object and one morphism.
- The mod-`pⁿ` projection on a strongly sheafy analytic `X` agrees with the corresponding Layer 1 finite-free lisse sheaf.
- The constant `ℤ/p`-system is not a rank-one `ℤ_p`-local system: its next level does not give a free `ℤ/p²`-lattice.

*Needs:* `SchemeAndStackFoundations`, Layer 2; `DiamondsAndVStacks`, layer D0; Section 1.4; `AdicEtaleGeometry`, layer A1 (`yoneda-adic-analytic-tate-local`); `AdicEtaleGeometry`, layer A1 (`yoneda-adic-open-immersions`).

For a prime `p` and preadic `X, PreadicSpace.IsogenyZpLocalSystem(X)` has the same objects as `ZpLocalSystem(X)` and `Hom(T,T′) = Hom_Zp(T,T′) ⊗_ℤp ℚ_p`, with bilinear composition, identity `1⊗`id, tensor products and internal `Hom` induced from integral systems. This is rationalization of a category; it is not its stackification. `A` rational transition isomorphism and its inverse become integral after multiplication by some powers of `p` on every quasi-compact overlap where the underlying `Hom` has descended. The subsequent QpLocalSystem category is obtained by descent, and need not have a global integral lattice.

(de Jong (1995), §4, p. 103, paragraph before Definition 4.1; `K`. Kedlaya, `R`. Liu, Relative `p`-adic Hodge theory: Foundations, Definition 1.4.1, p. 20.)

Provide `PreadicSpace.IsogenyZpLocalSystem`: Integral objects with `ℚ_p`-rationalized morphisms; `PreadicSpace.IsogenyZpLocalSystem.rationalize`: The tensor functor `T ↦ T⊗ℚ_p`; `PreadicSpace.IsogenyZpLocalSystem.hom`: `Hom` is the scalar extension of the integral `Hom` module, with bilinear composition; `PreadicSpace.IsogenyZpLocalSystem.pullback`: Rationalization commutes with preadic pullback.

Provide `PreadicSpace.IsogenyZpLocalSystem.toQp`: The canonical faithful functor to `QpLocalSystem(X)`; it is fully faithful when `X` is quasi-compact or connected, but not in general: on `X = ⊔_{n∈ℕ} Spã(K,K°)` the endomorphisms of the trivial rank-one system are `(∏_n ℤ_p)⊗ℚ_p` in the isogeny category and `∏_n ℚ_p` in `QpLocalSystem(X)`.

**Checks.**

- The endomorphisms of the trivial rank-one system on a connected geometric point are `ℚ_p`.
- Multiplication by `p` becomes invertible, with inverse `p⁻¹`, although it is not an integral isomorphism.
- The zero system remains zero after rationalization.
- `A` rational local system with noncompact monodromy on a Tate curve is outside the image of global integral rationalization.

*Needs:* Section 3.3; `SchemeAndStackFoundations`, Layer 2; `DiamondsAndVStacks`, layer D0.

For a prime `p` and arbitrary preadic `X, PreadicSpace.QpLocalSystem(X)` is the category of descent data for scheme étale `ℚ_p`-local systems `V_i` on `Spec(A_i)`, over preadic affinoid coverings `Spã(A_i,A_i⁺)`, with restriction isomorphisms on affinoid coverings of intersections, cocycle on triple intersections, and identification under common refinements. Scheme `ℚ_p`-local systems here mean the étale stackification of the isogeny `ℤ_p`-local-system category, not arbitrary sheaves of discrete `ℚ_p`-vector spaces. Tensor product, dual, internal `Hom` and pullback are obtained by descent. Definition 8.4.3 applies to non-sheafy preadic spaces; comparison with sheaves on A1 sites is restricted to genuine strongly sheafy adic spaces. On affinoid spaces over an analytic field, compare with de Jong’`s` rational local systems through Section 3.7.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Definition 8.4.3, p. 168.)

Provide `PreadicSpace.QpLocalSystem`: The category of rational local systems by affinoid descent; `PreadicSpace.QpLocalSystem.ofDescent`: Objects and cocycles on an affinoid cover define a rational local system; `PreadicSpace.QpLocalSystem.refine`: Common refinement induces an equivalence of the descent presentations; `PreadicSpace.QpLocalSystem.pullback`: Pullback preserves tensor products and duals, with coherent identity and composition maps.

Provide `PreadicSpace.QpLocalSystem.rank`: The finite rank is locally constant, determined by the affinoid scheme local systems; `PreadicSpace.QpLocalSystem.rationalize`: An integral local system gives a rational local system by scalar extension; `PreadicSpace.QpLocalSystem.homDescent`: Morphisms are equal if their restrictions agree on a covering; `PreadicSpace.QpLocalSystem.tensor`: Tensor product, dual and internal `Hom` obtained by descent from `Spec(A_i)`, with unit the trivial rank-one system; rationalize and pullback are tensor functors.

**Checks.**

- On `Spã(K,K⁺)` for a complete field, the category agrees with continuous finite-dimensional `ℚ_p`-representations of `Gal(K^sep/K)`.
- Rank zero is the zero object, preserved by every pullback.
- Refining every affinoid of a trivial rank-one descent datum gives an isomorphic object with identity transitions.
- The rank-one rational local system on a Tate curve with generator acting by `p` has no global integral lattice.

*Needs:* Section 3.3; `SchemeAndStackFoundations`, Layer 2; `DiamondsAndVStacks`, layer D0; `AdicEtaleGeometry`, layer A1 (`yoneda-adic-analytic-tate-local`); `AdicEtaleGeometry`, layer A1 (`yoneda-adic-open-immersions`).

### 3.4 Local lattices and the affine comparison

Let `(A,A⁺)` be an adic Banach ring and `Spec(A′)→Spec(A)` a surjective étale morphism. For every `α∈M(A)` there is a rational localization `(A,A⁺)→(B,B⁺)` encircling `α` for which `A′⊗_A B` decomposes as a finite product of rings, with at least one factor faithfully finite étale over `B`. Encircling is the neighborhood notion of KL §2.4; replacing it by an arbitrary rational subset containing `α` loses the neighborhood assertion. The algebra `A′⊗_A B` is the algebraic base change of the scheme cover, not an unspecified completion.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Lemma 8.4.1 and proof, p. 167.)

For a faithfully finite étale `A′/A`, choose the identity localization and the whole `A′` as the factor. `A` non-surjective open immersion need not supply a faithful factor near a point outside its image.

*Needs:* `SchemeAndStackFoundations`, Layer 2; `AdicSpacesPartII`, layer R0; `AdicEtaleGeometry`, layer A1; Section 3.1.

Let `(A,A⁺)` be an adic Banach ring, `V` a scheme étale `ℚ_p`-local system on `Spec(A)`, and `α∈M(A)`. There is a rational localization `(A,A⁺)→(B,B⁺)` encircling `α` such that `V|_Spec(B)` is isomorphic to `T⊗ℚ_p` for an integral `ℤ_p`-local system `T` on `Spec(B)`.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Lemma 8.4.2 and proof, p. 167.)

*Needs:* Section 3.4; `SchemeAndStackFoundations`, Layer 2; Section 3.3.

The integral and rational local-system categories of KL Definition 8.4.3 are unchanged if preadic étale covering families replace the adic open covering families in the descent presentation. The comparison functors preserve pullback, rank, tensor product and dual; on strongly sheafy spaces they agree with the corresponding local-system categories on A1’`s` ordinary étale site. The assertion extends the local-system categories, not every torsion cohomology theorem of Layer 1, to arbitrary preadic spaces.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Remark 8.4.4, p. 168.)

*Needs:* Section 3.3; Section 3.4; `AdicEtaleGeometry`, layer A1; `SchemeAndStackFoundations`, Layer 2; `AdicEtaleGeometry`, layer A1 (`etale-site-generalized`); Section 1.4.

For an integral `ℤ_p`-local system `T` on a preadic `X` and `m≥0`, define `L_m(T)(Y)` to be isomorphism classes of pairs `(T′,ι)`, with `T′` integral on `Y` and `ι:T_Y⊗ℚ_p ≅ T′⊗ℚ_p` satisfying `p^mι∈Hom(T_Y,T′)` and `p^mι⁻¹∈Hom(T′,T_Y)`. It is represented by a finite étale preadic `X`-space. At a geometric point it is the finite set of lattices between `pᵐ T_x` and `p^(−m`)`T_x`; the two inequalities are both required. It has an inclusion relation represented by a finite étale subspace of `L_m(T)×_X L_m(T)` and a canonical operation taking the sum of finitely many bounded lattices. These are the analytic transports of KL Remark 1.4.7, used in Proposition 8.4.6.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Proof of Proposition 8.4.6, p. 168; Remark 1.4.7, pp. 21–22.)

Provide `PreadicSpace.BoundedLattice`: The moduli functor with bounds on `ι` and `ι⁻¹`; `PreadicSpace.BoundedLattice.finiteEtale`: `L_m(T)` is finite étale over `X`; `PreadicSpace.BoundedLattice.pullback`: `L_m(T_Y) ≅ L_m(T)×_X Y`; `PreadicSpace.BoundedLattice.inclusion`: The finite étale relation detects whether the rationally identified lattices are included.

Provide `PreadicSpace.BoundedLattice.sup`: Finite lattice sums are canonical and compatible with base change; `PreadicSpace.BoundedLattice.FiberCore`: For submodules `T,T′` of a `ℚ_p`-vector space with compatible `ℤ_p` scalar restriction, the geometric-fibre core is the conjunction `p^mT⊆T′` and `p^mT′⊆T`. It records both bounds, without asserting finite freeness or representability; `PreadicSpace.BoundedLattice.FiberCore.zero_iff`: At `m=0` the two-sided bound is equivalent to `T=T′`; `PreadicSpace.BoundedLattice.FiberCore.refl`: Every submodule is two-sided bounded relative to itself at every nonnegative `m`.

Provide `PreadicSpace.BoundedLattice.FiberCore.symm`: The two-sided bound is symmetric in `T,T′`; `PreadicSpace.BoundedLattice.FiberCore.trans`: Bounds `m` and `n` compose to a bound `m+n`; `PreadicSpace.BoundedLattice.FiberCore.mono`: Increasing `m` preserves the two-sided bound.

**Checks.**

- `L_0(T)` has one point on each geometric fibre: the original lattice.
- For `T=0, L_m(T)` is the terminal `X`-space for every `m`.
- For trivial rank one over a geometric point, `L_m` has 2m`+1` points, the lattices `p^aℤ_p` with `−m≤a≤m`.
- The condition `p^mι` integral alone admits arbitrarily large lattices; it does not define the finite `L_m`.
- At bound zero the two-sided core identifies `T` and `T′`.
- The zero submodule is two-sided bounded with itself at every `m`.
- Two successive bounds add, so a bound `m` and a bound `n` give `m+n`.

*Needs:* Section 3.3; `SchemeAndStackFoundations`, Layer 2; `AdicEtaleGeometry`, layer A1; Mathlib Submodule; Mathlib Padic; Mathlib PadicInt; `AdicEtaleGeometry`, layer A1 (`etale-site-generalized`).

For an integral system `T` and `m≥0`, a lattice `T′` with `p^mT⊆T′⊆p^(−m`)`T` is determined by the submodule `T′/p^mT` of the finite locally free quotient `p^(−m`)`T/p^mT`. The freeness and lattice conditions select a finite locally constant subset of the finite submodule set. Thus the two-sided bounded-lattice stratum is finite étale locally and globally represented by the corresponding finite étale preadic space.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Remark 1.4.7, pp. 21–22; proof of Proposition 8.4.6, p. 168.)

*Needs:* Section 3.4; Section 3.3; `SchemeAndStackFoundations`, Layer 2; `AdicEtaleGeometry`, layer A1; `AdicEtaleGeometry`, layer A1 (`etale-site-generalized`).

For every adic Banach ring `(A,A⁺)`, the natural tensor functor `ℤ_p`-`Loc(Spec A)→ZpLocalSystem(Spã(A,A⁺))` is an equivalence, and induces an equivalence on the isogeny categories. Its mod-`pⁿ` functors are the finite-étale algebra/space comparisons of A1. This does not assert an equivalence of the full étale topoi or an equivalence of their rational stackifications.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Remark 8.4.5, p. 168.)

*Needs:* Section 3.3; `SchemeAndStackFoundations`, Layer 2; `AdicEtaleGeometry`, layer A1; `AdicSpacesPartII`, layer R0; `AdicEtaleGeometry`, layer A1 (`finite-etale-rational-descent`); `AdicEtaleGeometry`, layer A1 (`etale-site-generalized`).

For an adic Banach ring `(A,A⁺)`, a rational local system `V` on `Spã(A,A⁺)`, and `α∈M(A)`, there is a rational localization `(A,A⁺)→(B,B⁺)` encircling `α` such that `V|_Spã(B,B⁺)` is an isogeny `ℤ_p`-local system. No global lattice and no strong-sheafiness assumption is asserted.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Proposition 8.4.6 and proof, p. 168.)

A constant `ℚ_p`-system has its constant integral lattice on the identity neighborhood. `A` noncompact global monodromy example still has local lattices.

*Needs:* Section 3.3; Section 3.4; `SchemeAndStackFoundations`, Layer 2; `AdicEtaleGeometry`, layer A1.

Every rational local system on `Spã(A,A⁺)`, for an adic Banach ring `(A,A⁺)`, admits a descent presentation by isogeny `ℤ_p`-local systems on a strong rational covering family. Strong has KL’`s` meaning (Definition 2.4.14, p. 42): a finite family of rational subspaces of `M(A)` whose relative interiors in `M(A)` cover `M(A)`; it induces a rational covering of `Spã(A,A⁺)`. Compactness of `M(A)` extracts such a finite family from the encircling neighbourhoods of Proposition 8.4.6. Transition maps are rational isomorphisms satisfying the cocycle; they are not required to preserve the chosen integral lattices.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Corollary 8.4.7 and proof, p. 168.)

*Needs:* Section 3.4; Section 3.3; `AdicSpacesPartII`, layer R0; Section 3.1.

### 3.5 Locally finite analytic coverings

For a `k`-analytic Berkovich space `X`, an analytic étale covering map `f:Y→X` means that every `x∈X` has an ordinary open neighborhood `U` such that `f⁻¹(U)` is a disjoint union of spaces finite étale over `U`. `A` topological covering is the case where these finite étale pieces are isomorphisms. `Cov_X` is the category of these maps over `X`, including the empty map; it is not the category of all étale maps and is not silently enlarged to arbitrary disjoint unions. On Hausdorff strictly `k`-analytic spaces, transport this definition to the corresponding taut adic spaces via Huber’`s` equivalence with Hausdorff strictly `k`-analytic spaces (supplied by Section 3.1). For a quasi-separated rigid space `X`, de Jong §5 requires, when `X` is affinoid, that `Y` be paracompact and that every analytic point have a wide affinoid neighbourhood `U` with `Y×_X U` a disjoint union of affinoids finite étale over `U`, and in general that every base change to an affinoid `X′` be such a covering; for `X` coming from a Hausdorff strictly `k`-analytic space this agrees with Definition 2.1. The weaker condition over an admissible affinoid covering (de Jong’`s` almost étale covering maps) is not used.

(de Jong (1995), Definition 2.1, p. 91; §5, p. 106; de Jong (1995), §5, p. 106.)

Provide `AdicSpace.AnalyticEtaleCover`: The local disjoint-finite-étale condition and its category; `AdicSpace.AnalyticEtaleCover.ofFiniteEtale`: Every finite étale map is an analytic covering; `AdicSpace.AnalyticEtaleCover.ofTopological`: `A` topological covering with its canonical analytic structure is an analytic covering; `AdicSpace.AnalyticEtaleCover.pullback`: Coverings are stable under arbitrary analytic base change.

Provide `AdicSpace.AnalyticEtaleCover.finiteCoproduct`: Finite coproducts, including the empty covering, stay in `Cov_X`; `AdicSpace.AnalyticEtaleCover.berkovichEquiv`: Agreement with de Jong Definition 2.1 on Hausdorff strictly analytic spaces; `AdicSpace.AnalyticEtaleCover.fiberProduct`: For coverings `Y₁,Y₂` of `X, Y₁×_X Y₂` is a covering of `X` (de Jong p. 91); `AdicSpace.AnalyticEtaleCover.ofMorphism`: A morphism `g:Y₁→Y₂` of coverings of `X` is itself an étale covering map; compositions of covering maps need not be coverings (de Jong p. 91).

**Checks.**

- The identity and empty map are covering spaces.
- A finite étale covering has the same fibres as A1’`s` finite étale space.
- The open immersion of a nonempty proper open subset of connected `X` is not an analytic covering: its image is not a union of connected components.

*Needs:* `SchemeAndStackFoundations`, Layer 2; Section 3.1; `AdicEtaleGeometry`, layer A1 (`finite-etale-morphism`).

`A` de Jong étale covering `Y→X` is separated. On an ordinary neighbourhood where it is a disjoint union of finite étale spaces, each diagonal is closed and the disjoint-component diagonal is closed; separatedness then descends over the open covering of `X`.

(de Jong (1995), Lemma 2.2(i), pp. 91–92.)

*Needs:* Section 3.5; `AdicEtaleGeometry`, layer A1 (`etale-diagonal`); Section 3.1.

For an arbitrary analytic map `X′→X` and a de Jong covering `Y→X, Y×_X X′→X′` is again a covering. Pull back the ordinary neighbourhoods and their disjoint finite-étale presentations; base change of each finite étale piece is finite étale.

(de Jong (1995), Lemma 2.2(ii), p. 92.)

*Needs:* Section 3.5; `AdicEtaleGeometry`, layer A1 (`etale-base-change`); Section 3.1.

The image of a de Jong covering `Y→X` is a union of connected components of `X`. In particular, on connected `X` any nonempty covering is surjective. This follows from the locally constant image condition of finite étale pieces, with the uniform ordinary neighbourhood in the covering definition.

(de Jong (1995), Lemma 2.2(iv), p. 92.)

*Needs:* Section 3.5; `AdicEtaleGeometry`, layer A1 (`etale-open-map`); Section 3.1.

A sheaf of sets on the Berkovich étale site of a `k`-analytic space is represented by a de Jong covering if and only if its pullback to each member of a covering in that site is so. For a taut strict adic space `X`, this is the site `u(X)_ét,s` of Section 3.1: `s₀` identifies it with the subsite of partially proper étale adic maps, with jointly surjective covering families. This identification transports the descent assertion and its represented covering to `X`. Effective descent retains a single ordinary Berkovich neighbourhood on which all fibres are a disjoint union of finite étale pieces.

(de Jong (1995), Lemma 2.3 and proof, pp. 92–93.)

**Checks.**

- Descent along the identity covering returns the original represented covering.
- Finite étale descent on this site agrees with A1's finite étale descent after transport by `s₀`.
- In characteristic `p`, the Artin–Schreier construction on `A = {|ϖ| ≤ |T| ≤ |ϖ|⁻¹}` is a disjoint union of finite étale covers over each of the rational opens `{|ϖ| ≤ |T| ≤ 1}` and `{1 ≤ |T| ≤ |ϖ|⁻¹}`, but is not a de Jong covering over `A`. These rational opens do not form a covering in the partially proper étale subsite. (Achinger–Lara–Youcis, *Variants of the de Jong fundamental group*, Construction 2.1.3 and Proposition 2.1.4, [arXiv:2203.11750v1](https://arxiv.org/html/2203.11750v1#S2.SS1).)

*Needs:* Section 3.5; `SchemeAndStackFoundations`, Layer 2; `DiamondsAndVStacks`, layer D0; Section 3.1.

For a de Jong covering `Y→X` and an equivalence relation `R` which is a union of connected components of `Y×_X Y`, the quotient sheaf `Y/R` on the Berkovich étale site (on `u(X)_ét,s` after adic transport) is represented by a de Jong covering. Locally reduce to finite étale pieces and quotient by the descended relation; the component condition is essential to that reduction.

(de Jong (1995), Lemma 2.4 and proof, p. 93.)

*Needs:* Section 3.5; `SchemeAndStackFoundations`, Layer 2; `DiamondsAndVStacks`, layer D0.

A sheaf of sets on the Berkovich étale site is representable by a de Jong covering iff it is so after a covering in that site. On a taut strict adic `X` this means `u(X)_ét,s`, transported by `s₀` to the partially proper étale subsite of Section 3.1. If `Y→X` is such a covering and `R⊆Y×_X Y` is an equivalence relation that is a union of connected components, then the quotient sheaf in this same site is representable by a de Jong covering. Coverings are separated and stable under base change; their images are unions of connected components. The quotient assertion retains the connected-component condition on `R`.

(de Jong (1995), Lemmas 2.2–2.4 with proofs, pp. 91–93.)

*Needs:* Section 3.5; `SchemeAndStackFoundations`, Layer 2; `DiamondsAndVStacks`, layer D0; Section 3.1.

### 3.6 Fibres, paths and the analytic fundamental group

For a geometric point `x:M(K)→X` with `K` algebraically closed complete, define `F_x:Cov_X→`Set by `F_x(Y)=Y×_X M(K)`, viewed as its discrete set of `K`-points. Morphisms act by the induced maps on fibres. The functor preserves finite fibre products and existing disjoint unions. Its restrictions to finite étale and topological coverings define the algebraic and topological fibre functors. The same fibre functor on the corresponding taut adic space uses `Spa(K,O_K)`; it agrees with A1’`s` geometric stalk on a represented covering.

(de Jong (1995), §2, p. 93, definition of `F_x̄` (as a functor to `π₁`-Sets: p. 95).)

Provide `AdicSpace.AnalyticCoverFiber`: The fibre functor `F_x` on `Cov_X`; `AdicSpace.AnalyticCoverFiber.map`: Maps of coverings induce fibre maps respecting identity and composition; `AdicSpace.AnalyticCoverFiber.pullback`: `A` pointed analytic map identifies the fibre of a pulled-back covering; `AdicSpace.AnalyticCoverFiber.stalk`: `F_x(Y)` is the A1 geometric stalk of the represented covering sheaf.

**Checks.**

- The identity covering has a singleton fibre.
- The empty covering has the empty fibre.
- For `X=M(k)` and `Y=M(L), L/k` finite separable, the fibre is `Hom_k(L,K)`.

*Needs:* Section 3.5; `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); `AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`); Section 3.1.

For a connected `k`-analytic space `X` with geometric point `x`, define `π₁^an(X,x)=Aut(F_x)`, where `F_x` is the fibre functor on de Jong covering spaces. Give it the topology whose identity neighborhoods are stabilizers `H(Y,y)` of `y∈F_x(Y), Y∈Cov_X`; finite intersections and conjugates again occur. This topological group need not be profinite. Restriction to finite étale coverings gives a continuous map to the profinite algebraic fundamental group `π₁^alg`; restriction to topological coverings gives the topological covering group. On taut strictly analytic adic spaces this is the transported analytic group. The scheme fundamental groups of `EtaleCohomologyFoundations`, §§`F`.0.2 and `F`.0.A0, use finite étale covers.

(de Jong (1995), §2, definition of `π₁` and topology, p. 94.)

Provide `AdicSpace.AnalyticEtaleFundamentalGroup`: `Aut(F_x)` with the stabilizer topology; `AdicSpace.AnalyticEtaleFundamentalGroup.action`: The continuous action on every discrete covering fibre; `AdicSpace.AnalyticEtaleFundamentalGroup.stabilizerBasis`: `H(Y,y)` is a neighborhood basis at the identity; `AdicSpace.AnalyticEtaleFundamentalGroup.map`: Pointed analytic maps give continuous homomorphisms with identity and composition laws.

Provide `AdicSpace.AnalyticEtaleFundamentalGroup.toAlgebraic`: Restriction to finite coverings is the algebraic profinite comparison; `AdicSpace.AnalyticEtaleFundamentalGroup.toTopological`: Restriction to topological coverings is the topological comparison.

**Checks.**

- For `X=M(k), π₁^an` is `Gal(k^sep/k)` with its profinite topology.
- For `X=M(C), C` algebraically closed, `π₁^an` is trivial.
- For a Tate elliptic curve the topological quotient is `ℤ`; `π₁^an` cannot be replaced by its profinite finite-cover quotient.

*Needs:* Section 3.6; Section 3.5; `AdicEtaleGeometry`, layer A1 (`finite-etale-galois-category`); Section 3.1.

For `π=π₁^an(X,x)`, the natural map `π→lim_H π/H`, over the point-stabilizer neighborhood system with quotient maps, is a homeomorphism of spaces. Thus `π` is Hausdorff and prodiscrete in de Jong’`s` sense. The stabilizers need not be normal and this formula is not a presentation as an inverse limit of finite groups.

(de Jong (1995), Lemma 2.7 and proof, p. 94.)

*Needs:* Section 3.6; Mathlib TopCat.limitCone.

For a connected `k`-analytic Berkovich `X` and any geometric points `x,x′`, there exists a natural isomorphism `F_x≅F_x′` on de Jong covering spaces. `A` choice induces a continuous isomorphism of analytic fundamental groups, unique up to inner conjugation; no canonical path is asserted.

(de Jong (1995), Theorem 2.9, p. 95; proof pp. 97–98.)

*Needs:* Section 3.6; Section 3.5; `AdicEtaleGeometry`, layer A1 (`finite-etale-galois-category`); Section 3.1.

For connected `X` and a geometric base point `x`, two maps between de Jong coverings agreeing on `F_x` agree everywhere. Use paths `F_x≅F_z` at every geometric point `z`, natural in covering maps, then the enough-points criterion for the represented étale sheaves.

(de Jong (1995), Proof of Theorem 2.10, p. 96.)

*Needs:* Section 3.6; Section 3.5; `AdicEtaleGeometry`, layer A1 (`etale-enough-points`).

For connected `X`, the fibres of connected components of a de Jong covering are exactly the `π₁^an`-orbits in `F_x(Y)`. Connected coverings therefore have transitive fibre action and, `X` being connected, are surjective onto `X`. This is the connected-component/orbit step in the proof of de Jong 2.10.

(de Jong (1995), Proof of Theorem 2.10, p. 96.)

*Needs:* Section 3.6; Section 3.5.

For `π=π₁^an(X,x)` and an open subgroup `H⊆π`, the continuous transitive discrete action `π/H` is represented by a connected de Jong covering. Choose a connected pointed covering `(Y,ȳ)` with `H(Y,ȳ) ⊆ H` (replace `Y` by its component through `ȳ`) and quotient by the union of fibre-product components corresponding to `H`; the quotient is representable by the componentwise quotient theorem.

(de Jong (1995), Proof of Theorem 2.10(i), p. 96.)

*Needs:* Section 3.6; Section 3.5.

For connected `X` and de Jong coverings `Y,Z`, every `π₁^an`-equivariant map `F_x(Y)→F_x(Z)` is induced by a unique analytic covering map `Y→Z` over `X`. Its graph is a union of components of `Y×_X Z`; projection to `Y` is an isomorphism by the fibre criterion and path transport.

(de Jong (1995), Proof of Theorem 2.10(i), p. 96.)

*Needs:* Section 3.6; Section 3.5.

The category of arbitrary analytic disjoint unions of objects of `Cov_X`, with maps over `X`, is equivalent via `F_x` to all continuous discrete `π₁^an`-sets: decompose an action into transitive orbits, realize each orbit, and take their disjoint union in analytic spaces. Such a union need not be an object of `Cov_X` because one uniform ordinary neighbourhood may fail for its infinitely many components.

(de Jong (1995), Theorem 2.10(i), p. 95; de Jong (1995), §2, p. 91.)

*Needs:* Section 3.6; Section 3.1.

For connected `X` with geometric point `x, F_x:Cov_X→π₁^an(X,x)`-Set is fully faithful and every transitive continuous discrete action occurs. The category of arbitrary disjoint unions of objects of `Cov_X` is equivalent to all continuous discrete `π₁^an`-sets. The original `Cov_X` itself is not asserted equivalent to all such sets: arbitrary disjoint unions need not satisfy the uniform local covering condition. Restriction to finite étale covers is an equivalence with finite continuous `π₁^alg`-sets.

(de Jong (1995), Theorem 2.10(i) and proof, pp. 95–96.)

The regular action of the discrete deck group of a connected topological Galois cover recovers that cover. Finite covering fibres agree with the ordinary finite-étale Galois category.

*Needs:* Section 3.6; Section 3.5; `AdicEtaleGeometry`, layer A1 (`finite-etale-galois-category`).

The algebraic group `π₁^alg(X,x)` is profinite. Every continuous homomorphism `π₁^an(X,x)→G` to a profinite group factors uniquely through `π₁^alg(X,x)`, and the canonical maps to `π₁^alg` and `π₁^top` have dense image. The map to `π₁^alg` is not surjective in general: for two projective lines over an algebraically closed field glued at 0 and `∞, π₁^alg = ℤ̂` and the map factors through `ℤ ⊂ ℤ̂` (de Jong Remark 2.11(i)). `A` continuous representation on a finite-free `ℤ_p`-module factors through `π₁^alg`, since `GL_r(ℤ_p)` is profinite; a representation on `ℚ_p` may have noncompact image and need not do so.

(de Jong (1995), Theorem 2.10(iii)–(iv), pp. 95–96; Remark 2.11(i), p. 96; de Jong (1995), Remark 2.11(i), p. 96.)

*Needs:* Section 3.6; `AdicEtaleGeometry`, layer A1 (`finite-etale-galois-category`); `ArithmeticGaloisRepresentations`, Layer 1, Section 1.1 (`ContinuousRep`) for the carrier and `EtaleCohomologyFoundations`, §`F`.4.0 (`exists_stable_lattice_iff`) for the monodromy subgroup with `E=Q_p`; `GaloisLattice.IntegralModel.nonempty` applies only to compact acting groups.

The category of topological analytic covering spaces of a `k`-analytic `X` is equivalent to the category of topological covering spaces of `|X|`. `A` topological covering `T→|X|` defines the étale sheaf `U↦Hom_|X|(|U|,T)`; étale-local covering representability equips `T` with its unique analytic covering structure. Thus `π₁^top` depends only on `(|X|,x)`, as required by the Tate-curve monodromy example.

(de Jong (1995), Lemma 2.6 and proof, p. 93.)

*Needs:* Section 3.5; `AdicEtaleGeometry`, layer A1; Section 3.1.

### 3.7 Rational monodromy and lattice orbits

Construct `AnalyticTateQuotient` for a complete algebraically closed rank-one nonarchimedean field `C` and `q∈C×` with `|q|<1`: the quotient of `G_m^an` by `T↦`qT, together with a specified isomorphism to `E_q^an`. Consume the Tate equation and its point-level uniformization from `TauCetiRoadmap.EllipticCurves`, layer 4. The additional target here is the analytic quotient, its covering map and its topology. Cover `G_m^an` by annuli whose logarithmic radii have length less than `−`log`|q|`, and glue their translates. The `q`-series uniformization converges uniformly on compact annuli away from `q^Z`; its extension in projective coordinates at those points gives the origin of `E_q`. The invariant differential gives an étale map `Q → E_q^an` from the glued quotient. Establish that `Q` is Hausdorff from the properly discontinuous translation action on annular charts, and establish its compactness from the fundamental annulus `|q| ≤ |T| ≤ 1` and its boundary identifications: translates provide analytic neighborhoods across both seams, so the quotient has no analytic boundary and is proper. Since `E_q^an` is separated, this makes the étale map proper, hence finite by the supplied proper quasi-finite criterion. The point-level kernel `q^ℤ` and surjectivity give exactly one point in each classical fibre. The finite étale degree-one criterion below identifies `Q` with `E_q^an` at every analytic point, including completed residue fields. Only then deduce the local analytic isomorphisms for the uniformization map. The annulus skeleton gives a deformation retract to the real line, and `q` acts by translation of length `−`log`|q|`. Thus `G_m^an` is the universal topological cover, the quotient skeleton is a circle, and its deck group and topological fundamental group are `Z`. (de Jong (1995), Proposition 5.3, pp. 107–108, for the semistable graph computation; Kedlaya–Liu, Remark 8.4.8, pp. 168–169, and Example 8.5.17, pp. 174–175, for the Tate-cover monodromy application.)

Provide `AnalyticTateQuotient.cover`, `deck_equiv_int`, `kernel_points`, `quotient_iso_analytification`, and `topologicalFundamentalGroup_equiv_int`. Specify the generator by `T↦`qT; reversing it inverts the monodromy. Under the continuous surjection from the analytic fundamental group to this discrete group, the character `a↦p^a` defines the rational system below. Changing the base point changes the fundamental-group identification by a path and conjugacy, leaving this rank-one character unchanged.

**Checks.**

- `q=0` is excluded: the input is a unit, so all positive and negative translates exist.
- Replacing `q` by `qᵐ, m>0`, gives a degree-`m` covering of quotient circles and multiplies the generator of the corresponding subgroup by `m`.
- The character of the generator acts as `p` on a rank-one `Q_p`-space. A nonzero finite free `Z_p`-lattice would be sent to its proper sublattice, so no global stable lattice exists.
- For the trivial character every translate acts as 1 and the constant rank-one `Z_p`-lattice descends.

*Needs:* Sections 3.1 and 3.5–3.6; `AdicSpacesPartII`, layer R0 (`quasi-finite-and-finiteness-criteria`); `TauCetiRoadmap.EllipticCurves`, layer 4 (Tate equation, convergent `q`-series, kernel and point-level uniformization); `AdicSpacesPartII`, layer R1 (analytification); the semistable curve and graph constructions of `TauCetiRoadmap.StableReduction`, layers 1–3. The analytic annulus gluing above precedes its cohomology calculations in Layer 10.

**Finite étale degree-one criterion.** Provide `AnalyticTateQuotient.finiteEtaleDegreeOneIso`: if `g:Y→Z` is a finite étale morphism of strictly analytic spaces over a complete algebraically closed nontrivially valued field `C`, `Z` is nonempty and connected, and one classical fibre has exactly one point, then `g` is an analytic isomorphism. The finite locally free algebra `g_*O_Y` has locally constant rank, and the specified fibre forces rank one everywhere. Its unit `O_Z→g_*O_Y` is an isomorphism, which gives the analytic inverse on affinoid charts. In particular all completed residue-field extensions are trivial. Apply the strict analytic/taut adic comparison of Section 3.1 to obtain the same isomorphism for the associated adic spaces. Properness of the glued Tate quotient uses the compactness and absence of boundary criterion before applying this finite étale theorem. (Berkovich (1990), §3.1, definition of proper morphisms, p. 50, and Proposition 3.1.7, p. 51; §3.3, Corollary 3.3.8, p. 60; de Jong (1995), Lemma 3.10, p. 102, for the completed residue-field condition in topological covering maps.)

**Checks.**

- The identity of a connected analytic space has fibre cardinality one and the criterion gives its identity inverse.
- A split finite étale cover of degree `d > 1` has `d` points in every classical fibre and is excluded.
- For `T↦Tᵈ` on `G_m^an`, with `d > 1` prime to the residue characteristic, the differential is invertible but the map is not a local analytic isomorphism at the unit Gauss point: the residue extension is `k(t)/k(tᵈ)` of degree `d`. Its classical fibres also have `d` points, so it fails the degree-one hypothesis.

*Needs:* Section 3.1; `AdicEtaleGeometry`, layer A1 (`finite-etale-affinoid-algebra`); `AdicSpacesPartII`, layer R0 (`quasi-finite-and-finiteness-criteria`); Mathlib finite projective modules and Nakayama.

For an étale `ℚ_p`-local system `V` on a `k`-analytic Berkovich space, let `Lat(V)` be the sheaf on its Berkovich étale site whose sections are finite-free integral `ℤ_p`-lattices in `V`, with inclusion after rationalization equal to `V`. For a corresponding taut strict adic space `X`, use `u(X)_ét,s` before transport by `s₀`. Locally choose an integral presentation `T`. Its lattice sheaf is the increasing union of the open and closed finite étale subspaces `L_m(T)`, and its disjoint decomposition is `L_0(T) ⊔ ⨿_{m≥0}(L_{m+1}(T)∖L_m(T))`. Descent on this same Berkovich site (Section 3.5) gives a global de Jong covering, transported to the adic space by `s₀`. This construction allows `Lat(V)` to lack a global section.

(de Jong (1995), Proof of Theorem 4.2, p. 104.)

Provide `AnalyticRationalLatticeCover`: The represented covering `Lat(V)→X`; `AnalyticRationalLatticeCover.fiber`: At `x` its points are `ℤ_p`-lattices in the rational fibre `V_x`; `AnalyticRationalLatticeCover.boundedStratum`: For a local integral presentation `T` and index in `ℕ`, stratum 0 is `L_0(T)` and stratum `m+1` is `L_{m+1}(T)∖L_m(T)`; its points have least two-sided bound equal to the index, and `Lat(V)` is locally the disjoint union of these finite étale strata; `AnalyticRationalLatticeCover.universalLattice`: The tautological integral system on `Lat(V)` rationalizes to the pullback of `V`.

Provide `AnalyticRationalLatticeCover.pullback`: `Lat(f^*V)≅Lat(V)×_X X′`; `AnalyticRationalLatticeCover.section`: Global sections correspond to global integral lattices in `V`.

**Checks.**

- For `V=0`, every `L_m` is `X`; stratum 0 is `X` and all successor strata are empty, so the lattice cover is `X` with its unique zero lattice.
- For trivial rank-one `V` at a geometric point, stratum 0 is `{ℤ_p}` and stratum `m+1` is `{p^(m+1)ℤ_p, p^(−m−1)ℤ_p}`; their union is `{p^aℤ_p | a∈ℤ}`.
- The Tate-curve `p^ℤ` monodromy system has no section of its lattice cover.

*Needs:* Section 3.3; Section 3.4; Section 3.5; `SchemeAndStackFoundations`, Layer 2; `AdicEtaleGeometry`, layer A1.

For a connected `k`-analytic space `X` and geometric point `x`, the geometric fibre functor is a `ℚ_p`-linear tensor equivalence between de Jong’`s` étale `ℚ_p`-local systems (the stackification of integral systems after rationalizing morphisms) and continuous finite-dimensional `ℚ_p`-representations of `π₁^an(X,x)`. On Hausdorff strictly analytic spaces this identifies KL Definition 8.4.3 with de Jong Definition 4.1 (KL asserts this for `X = Spa(A,A°), A` affinoid; the general case uses that lisse sheaves are overconvergent and the overconvergent sheaf equivalence of Section 3.2). Integral rationalizations correspond exactly to representations admitting a `π₁^an`-stable `ℤ_p`-lattice; representations with noncompact image have none. The group is the analytic covering group, not the scheme group of `Spec A`.

(de Jong (1995), Definition 4.1 and Theorem 4.2 with proof, pp. 103–105.)

*Needs:* Section 3.3; Section 3.6; `SchemeAndStackFoundations`, Layer 2; Section 3.7; Section 1.4; Section 3.2; Section 3.1.

For connected `X`, a lattice `L⊂V_x` has an open stabilizer under a continuous `π₁^an`-action. Its orbit in `Lat(V)_x` corresponds to a connected de Jong covering carrying the universal stable lattice, whose rationalization is the pulled-back `V`. The orbit can be infinite; the stabilizer need not have finite index.

(de Jong (1995), Proof of Theorem 4.2, p. 105.)

*Needs:* Section 3.7; Section 3.6.

Every rational local system on a `k`-analytic Berkovich space has a presentation by integral lattices on ordinary open neighborhoods with rational overlap isomorphisms. At a point `x`, the compact absolute Galois group of `H(x)` stabilizes a lattice in the fibre; the lattice covering then has a point with `H(y)=H(x)`, producing a local section. On affinoids this agrees with the encircling rational-neighborhood assertion of KL Proposition 8.4.6 through the Berkovich/preadic comparison.

(de Jong (1995), Corollary 4.4 and proof, p. 105.)

*Needs:* Section 3.7; Section 3.5; Section 3.4; `SchemeAndStackFoundations`, Layer 2; Section 3.1.

For connected analytic `X` and a finite-dimensional continuous `ℚ_p`-local system `V`, a global integral `ℤ_p`-lattice exists if and only if the image of `π₁^an` in `GL(V_x)` is relatively compact (equivalently its closure is compact). `A` stable lattice places the image in `GL_r(ℤ_p)`; conversely a compact closure stabilizes a lattice by the general `p`-adic linear-algebra input. This criterion is for analytic local systems, and does not force all rational monodromy to be compact.

(de Jong (1995), Proof of Corollary 4.4, p. 105; `K`. Kedlaya, `R`. Liu, Relative `p`-adic Hodge theory: Foundations, Remark 1.4.4, p. 21.)

*Needs:* Section 3.7; Section 3.6; `ArithmeticGaloisRepresentations`, Layer 1, Section 1.1 (`ContinuousRep`) for the carrier and `EtaleCohomologyFoundations`, §`F`.4.0 (`exists_stable_lattice_iff`) for the monodromy subgroup with `E=Q_p`; `GaloisLattice.IntegralModel.nonempty` applies only to compact acting groups.

Let `E_q` be a Tate elliptic curve over an algebraically closed complete nonarchimedean field of characteristic zero, with `0<|q|<1`. The topological covering `G_m^an→E_q` has deck group `q^ℤ≅ℤ`. Compose `π₁^an(E_q,x)→π₁^top(E_q,x)≅ℤ`, which is surjective because its image is dense (de Jong Theorem 2.10(iv)) in the discrete deck group `ℤ`, with `a↦p^a∈ℚ_p×`. The resulting rank-one rational local system has local integral lattices but no global integral lattice: `p^ℤ` is noncompact and multiplication by `p` cannot stabilize a nonzero finite-free `ℤ_p`-lattice of rank one. This is a discriminating example for rational stackification. The reduced-affinoid failure of rational `Spec`–`Spa` equivalence is the separate assertion of KL Remark 8.4.8, not a claim that `E_q` is affinoid.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Remark 8.4.8, p. 169.)

The noncompact system still has the local lattices of Proposition 8.4.6. On a geometric point every continuous Galois representation has a stable integral lattice.

*Needs:* Section 3.7; Section 3.6; `ArithmeticGaloisRepresentations`, Layer 1, Section 1.1 (`ContinuousRep`) for the carrier and `EtaleCohomologyFoundations`, §`F`.4.0 (`exists_stable_lattice_iff`) for the monodromy subgroup with `E=Q_p`; `GaloisLattice.IntegralModel.nonempty` applies only to compact acting groups; the analytic Tate quotient of Section 3.7.

For an adic Banach ring `(A,A⁺)`, the natural tensor functor `ℚ_p`-`Loc(Spec A)→QpLocalSystem(Spã(A,A⁺))` is fully faithful. It need not be essentially surjective, even for reduced affinoid algebras over an analytic field; an explicit case is the rank-one system glued by `p` on the smooth connected strictly affinoid subspace of a Tate curve in KL Example 8.5.17. When `A` is normal noetherian (KL Remark 8.4.8 infers normality from integrality of `A`, which does not suffice; normality is assumed here), source objects admit a global `ℤ_p`-lattice by KL Remark 1.4.9, whereas the analytic category can contain continuous representations of de Jong’`s` non-profinite analytic fundamental group with noncompact image. The latter are outside the source image.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Remark 8.4.8, pp. 168–169; K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Example 8.5.17, pp. 174–175.)

*Needs:* Section 3.3; Section 3.4; `SchemeAndStackFoundations`, Layer 2; Section 3.7.

Let `(A,A⁺)` be an adic Banach ring and `V_i=T_i⊗ℚ_p, i=1`,2, isogeny integral local systems on `Spec A`. Every short exact sequence `0→V_1→V→V_2→0` in `QpLocalSystem(Spã(A,A⁺))` is the pullback of an extension of isogeny `ℤ_p`-local systems on `Spec A`. This extension closure does not imply that every analytic rational local system has a global lattice.

(K. Kedlaya, R. Liu, Relative p-adic Hodge theory: Foundations, Remark 8.4.9 and proof, p. 169.)

*Needs:* Section 3.4; Section 3.7; `SchemeAndStackFoundations`, Layer 2.

### Examples

Inside `Q_p`, the `Z_p`-lattices between `pᵐZ_p` and `p⁻ᵐZ_p` are exactly `pᵃZ_p` for `−m≤a≤m`. There are 2m`+1`, not an infinite family, in this bounded rank-one window. For the monodromy transformation `x↦p·x`, the orbit of `Z_p` is `{pᵃZ_p:a∈Z}`; it escapes every such window. Therefore the resulting `Q_p`-local system on a Tate curve has local lattices but no monodromy-invariant global lattice. `A` representation whose image preserves `Z_p` has the invariant lattice `Z_p` and passes the integral test. (Kedlaya–Liu, §8.4, Remark 8.4.8, pp. 168–169; de Jong, Proposition 5.3, pp. 107–108.)

The annular gluing of Section 3.7 yields an analytic quotient `G_m^an/q^Z` with `0<|q|<1`. Its real skeleton is `R`/log`|q|Z`, a circle with fundamental group `Z`. This gives an infinite locally finite analytic cover; a profinite fundamental group alone cannot classify it. The rational rank-one monodromy sending the circle generator to `p` fixes the convention for the counterexample above. (de Jong, Proposition 5.3, pp. 107–108; Kedlaya–Liu, Example 8.5.17, pp. 174–175.)

### Dependencies

Use Layers 1–2, `AdicSpacesPartII`, layers R0–R1, and `AdicSpacesPartIII`, layers R2–R3, for the affinoid Berkovich spectrum and analytic geometry, and `AdicEtaleGeometry`, A1, A2 and A4, for the étale and pro-étale sites. Layer 3 supplies continuous rational local-system representations; `EtaleCohomologyFoundations`, §§0.5–0.6 supply finite-presentation coefficient descent; finite Galois representations are the lower-tier coefficient contract of `ArithmeticGaloisRepresentations`, Layer 1, Section 1.1. The algebraic Tate curve and its point uniformization are `TauCetiRoadmap.EllipticCurves`, Layer 4. Section 3.7 adds its analytic quotient and skeleton. Overconvergence, bounded lattice moduli and covering-space monodromy are established here before the trace and duality arguments of Layers 8–9 use them.

## Layer 4: Formal specialization and semistable nearby cycles

### 4.1 Formal étale sites and specialization

Let `X` and `Y` be formal schemes of type `(S)` (`AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`); formal schemes of finite ideal type in the sense of `AdicSpacesPartIII`, layer F0, locally `Spf A` with `A` adic and either noetherian or with an ideal of definition sA such that the Tate ring `A(1/s)` is strongly noetherian). A morphism `f: Y → X` is étale (`FormalScheme.Hom.IsEtale`) if (a) `f` is adic: for one, equivalently every, ideal of definition `𝒥` of `X` the ideal `f*(𝒥)·O_Y` is an ideal of definition of `Y`; and `(b)` for every open `U ⊆ X` and every ideal of definition `𝒥 ⊆ O_U`, the morphism of schemes `f⁻¹(U) ×_U (U, O_U/𝒥) → (U, O_U/𝒥)` is étale (Mathlib `AlgebraicGeometry.Etale`). Equivalent form of `(b)`, used in proofs: for an open cover `X = ∪ U_α` and ideals of definition of finite type `𝒥_α ⊆ O_{U_α}`, every reduction `f_{α,n}: f⁻¹(U_α) ×_{U_α} (U_α, O/𝒥_α^{n+1}) → (U_α, O/𝒥_α^{n+1}), n ≥ 0`, is étale. Pinned conventions: the source `Y` is required to be of type `(S)`; étaleness is tested at every level `n`, never only on the reduction modulo one ideal of definition or on the reduced special scheme; no separatedness or quasi-compactness is imposed.

This uses `X, Y` formal schemes of type `(S)`; the reductions are schemes because the ideals of definition are of finite type (`AdicSpacesPartIII`, layer F0 (`thickening-colimit-finite-ideal-type`)); Equivalence of the two forms of `(b)`: an ideal of definition `𝒥'` of a quasi-compact open `U` contains `𝒥ᵐ` for an ideal of definition `𝒥` of finite type, and étale morphisms are stable under base change.

(Vladimir G. Berkovich, Vanishing cycles for formal schemes, §2, before Lemma 2.1, printed p. 542; Stacks project, Tag 039R (Étale Morphisms of Schemes, Theorem 41.15.2); Huber (1996), §3.5, p. 201.)

Provide `FormalScheme.Hom.IsEtale`: `f: Y → X` between type-`(S)` formal schemes is étale: adic, and every reduction `f⁻¹(U) ×_U (U, O_U/𝒥) → (U, O_U/𝒥)` (`U` open, `𝒥` an ideal of definition) is an étale morphism of schemes; `FormalScheme.Hom.isEtale_iff_forall_thickening`: For an ideal of definition `𝒥` of finite type on `X` with thickenings `X_n = (X, O_X/𝒥^{n+1})`: IsEtale `f ↔ f` adic `∧ ∀ n, Y ×_X X_n → X_n` is étale; `FormalScheme.Hom.IsEtale.comp`: Composites of étale morphisms are étale; identities are étale; `FormalScheme.Hom.IsEtale.of_isOpenImmersion`: Open immersions of type-`(S)` formal schemes are étale.

Provide `FormalScheme.Hom.IsEtale.baseChange`: For `f: Y → X` étale and any morphism `g`: X' `→ X` of type-`(S)` formal schemes, X' `×_X Y` is of type `(S)` and the projection X' `×_X Y →` X' is étale; `FormalScheme.Hom.IsEtale.of_comp`: If `g ∘ f` and `g` are étale then `f` is étale; in particular every `X`-morphism between objects étale over `X` is étale; `FormalScheme.Hom.IsEtale.reduction`: If `f` is étale then `Y ×_X X_red = Y_red` and `Y_red → X_red` is an étale morphism of schemes (`X_red` as in construction reduced-special-scheme-equivalence); `FormalScheme.Hom.isEtale_ofScheme_iff`: For a morphism of locally noetherian schemes, viewed as formal schemes with the discrete topology: IsEtale `↔` AlgebraicGeometry.Etale.

Provide `FormalScheme.Hom.isEtale_iff_smoothFormal`: For formal `O_K`-schemes locally of tf presentation (`K` complete of rank one), IsEtale agrees with étaleness in `AdicSpacesPartIII`, layer R2 (`smooth-formal-scheme`).

**Checks.**

- `Spf W(F_{pⁿ}) → Spf Z_p` is IsEtale for every `n ≥ 1`, while `Spf Z_p[√p] → Spf Z_p` (`p` odd, `p`-adic topologies) is adic and not IsEtale because `Spec F_p[x]/(x²) → Spec F_p` is not étale.
- `Spf F_p → Spf Z_p` (`p`-adic topology on `Z_p`, discrete on `F_p`) is adic and an isomorphism modulo `p`, but `Spec F_p → Spec Z/p²` is not flat; so it is not IsEtale, and a definition testing only the reduction modulo one ideal of definition (or on `X_red`) would wrongly accept it.
- `Spf Z_p[[T]]` with the `(p,T)`-adic topology `→ Spf Z_p` with the `p`-adic topology is not adic (`p·Z_p[[T]]` is not an ideal of definition), hence not IsEtale.
- The identity of `X` and, for `X = Spf A` and `f ∈ A`, the open immersion `Spf A_{f} → Spf A` (`A_{f}` the completed localisation, `AdicSpacesPartIII`, layer F0 (`completed-localization`)) are IsEtale.
- For locally noetherian schemes `X, Y` regarded as formal schemes with the discrete topology (ideal of definition 0; type `(S)` via (a)), a morphism is IsEtale iff it is étale in Mathlib's sense `AlgebraicGeometry.Etale`.

`Spf W(F_{pⁿ}) → Spf Z_p` (`p`-adic topologies) is étale; `Spf Z_p[√p] → Spf Z_p` is adic but not étale (its reduction `Spec F_p[x]/(x²) → Spec F_p` is ramified). `Spf F_p → Spf Z_p` is adic and its reduction modulo `p` is an isomorphism, but modulo `p²` it is the non-flat closed immersion `Spec F_p → Spec Z/p²`, so it is not étale.

*Needs:* `AdicSpacesPartIII`, layer F0 (`adic-morphism-of-formal-schemes`); `AdicSpacesPartIII`, layer F0 (`ideal-of-definition`); `AdicSpacesPartIII`, layer F0 (`thickening-colimit-finite-ideal-type`); `AdicSpacesPartIII`, layer F0 (`adic-systems-equivalence-finite-ideal-type`); `AdicSpacesPartIII`, layer F0 (`formal-fibre-product`); `AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`); Mathlib AlgebraicGeometry.Etale; Mathlib `AlgebraicGeometry.Etale.etale_isStableUnderBaseChange`; Mathlib `AlgebraicGeometry.Etale.etale_comp`; Mathlib `AlgebraicGeometry.Etale.of_comp`; Mathlib AlgebraicGeometry.IsLocallyNoetherian; `AdicSpacesPartIII`, layer R2 (`smooth-formal-scheme`).

Let `X` be a formal scheme of type `(S)`. Its étale site `X_et` has underlying category Et/`X =` `FormalScheme.SmallEtale X`: the objects are the formal schemes `Y` of type `(S)` with an étale structure morphism `Y → X` (construction formal-etale-morphism), the morphisms are all `X`-morphisms (automatically étale, `FormalScheme.Hom.IsEtale.of_comp`); its Grothendieck topology `FormalScheme.smallEtaleTopology X` is generated by the pretopology of jointly surjective families: `(g_i: Y_i → Y)_i` covers `Y` iff `|Y| = ∪_i g_i(|Y_i|)`. Et/`X` has the final object `X` and fibre products (`FormalScheme.Hom.IsEtale.baseChange`), hence finite limits, and the Zariski opens of `X` are objects. Functoriality: a morphism `h`: X' `→ X` of type-`(S)` formal schemes gives the continuous, finite-limit-preserving functor Et/`X →` Et/X', `Y ↦` X' `×_X Y`, hence a morphism of sites `h_et: X'_et → X_et`, with (`h ∘` h')`_et ≅ h_et ∘ h'_et` and `id_et =` id. The topos of `X_et` is written `X~`. Huber identifies `X_et` with the étale site of the reduced special scheme `X_red`; that identification is the separate construction reduced-special-scheme-equivalence.

This uses `X` of type `(S)`; the objects of Et/`X` are required to be of type `(S)`; Coverings count all points of the underlying spaces `|Y| = |Y_red|` (not only closed points); Imports: construction formal-etale-morphism; `AdicSpacesPartIII`, layer F0 (`formal-fibre-product`) for fibre products.

(Huber (1996), §3.5, p. 201; Huber (1996), §2.1, p. 109; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §2, Lemma 2.1, printed p. 542.)

Provide `FormalScheme.SmallEtale`: The category Et/`X` of type-`(S)` formal schemes étale over `X`, with all `X`-morphisms; `FormalScheme.SmallEtale.hasFiniteLimits`: Et/`X` has a final object `(X)` and fibre products, hence all finite limits; `FormalScheme.smallEtalePretopology`: The pretopology of jointly surjective families on Et/`X`; `FormalScheme.smallEtaleTopology`: The Grothendieck topology on Et/`X` generated by smallEtalePretopology.

Provide `FormalScheme.ofArrows_mem_smallEtaleTopology_iff`: `A` family `(g_i: Y_i → Y)` generates a covering sieve iff `|Y| = ∪ g_i(|Y_i|)`; `FormalScheme.SmallEtale.map`: A morphism `h`: X' `→ X` of type-`(S)` formal schemes gives the continuous finite-limit-preserving functor `Y ↦` X' `×_X Y`, with `map_id` and `map_comp` isomorphisms; `FormalScheme.etaleSheafPushforward`: `h_{et,*}: Sheaf(X'_et) ⥤ Sheaf(X_et), (h_*F)(Y) = F(X' ×_X Y)`; `FormalScheme.etaleSheafPullback`: `h_et^*`, left adjoint to `h_{et,*}` (Mathlib sheafPullback and sheafAdjunctionContinuous).

Provide `FormalScheme.SmallEtale.ofOpens`: The Zariski site of `X` embeds into Et/`X (U ↦ U)`, continuously; used for Huber's Remark 3.5.2; `FormalScheme.smallEtaleTopology_eq_formalEtaleSiteInvariance`: For `X` locally tfp over `O_K, X_et` is the étale site of `AdicSpacesPartIII`, layer R2 (`formal-etale-site-invariance`).

**Checks.**

- For `X = Spf Z_p`, SmallEtale `X` is equivalent to the category of étale `F_p`-schemes; `{Spf W(F_{p²}) → Spf Z_p}` is a covering and `Sheaf(X_et, Type)` is equivalent to continuous `Ẑ`-sets.
- For `X = Spec k` with `k` a field and the discrete topology, `X_et` is the small étale site of `Spec k`; for `X = ∅` the site is trivial and its topos is the degenerate topos: the empty family covers `∅`, so every sheaf is terminal and the sheaf category is equivalent to the terminal category, not to the one-point topos Set.
- For `X = Spf Z_p[[T]]` with the `p`-adic topology `(X_red = Spec F_p[[T]])`, the open immersion `{Spf Z_p[[T]]{T} → X}` is not a covering: it misses the closed point `T = 0` of `X_red` although it contains the generic point.
- For a locally noetherian scheme `X` with the discrete topology, FormalScheme.smallEtaleTopology `X` is Mathlib's AlgebraicGeometry.Scheme.smallEtaleTopology `X` under the equivalence of categories given by `FormalScheme.Hom.isEtale_ofScheme_iff`.
- For `Y ∈` Et/`X` the site `Y_et` is the slice site `X_et/Y`.

For `X = Spf Z_p, X_et` is equivalent to `(Spec F_p)_et`: its sheaves of sets are the continuous `Ẑ`-sets, and the one-element family `{Spf W(F_{p²}) → Spf Z_p}` is a covering. `X_et` depends only on the reduced special scheme (construction reduced-special-scheme-equivalence); the equivalence is the reduced-special-fibre comparison below.

*Needs:* Section 4.1; `AdicSpacesPartIII`, layer F0 (`formal-fibre-product`); `AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`); Mathlib AlgebraicGeometry.Scheme.smallEtaleTopology; Mathlib AlgebraicGeometry.Scheme.Etale; Mathlib CategoryTheory.Functor.IsContinuous; Mathlib CategoryTheory.Functor.sheafPushforwardContinuous; Mathlib CategoryTheory.Functor.sheafPullback; `AdicSpacesPartIII`, layer R2 (`formal-etale-site-invariance`).

Let `X` be a formal scheme of type `(S), 𝒥 ⊆ O_X` an ideal of definition of finite type and `X_n = (X, O_X/𝒥^{n+1})`. (i) The functor Et/`X →` Et/`X_0` (Mathlib `AlgebraicGeometry.Scheme.Etale X_0`), `Y ↦ Y_0 := Y ×_X X_0`, is an equivalence of categories; a quasi-inverse sends an étale `X_0`-scheme `V` to the formal scheme attached to the adic system `(V_n)_n` of its unique étale lifts `V_n → X_n`. (ii) If `X = Spf A` with `A` as in `(S), J ⊆ A` the corresponding finitely generated ideal of definition, and `B` an étale `A`-algebra with `J`-adic completion `B^,` then `Spf B^ → Spf A` is étale and `Spf B^ is` of type `(S)` (`A` noetherian `⇒ B^ noetherian`; in case `(b), B^(1/s`) is topologically of finite type over `A(1/s)`, hence strongly noetherian); every object of Et/`Spf A` is covered by open formal subschemes of this form, and `B` may be taken standard étale.

This uses `X` of type `(S)`; `𝒥` of finite type (exists locally); Imports: Stacks 039R (EGA IV 18.1.2) at each level; `AdicSpacesPartIII`, layer F0 (`adic-systems-equivalence-finite-ideal-type`); the type-`(S)` stability of completions of morphisms locally of finite type (`AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`), API FormalScheme.IsTypeS.completion, Huber (1.9.5)).

(Vladimir G. Berkovich, Vanishing cycles for formal schemes, §2, Lemma 2.1, printed p. 542; Stacks project, Tag 039R (Étale Morphisms of Schemes, Theorem 41.15.2); Huber (1996), §1.9, condition (S), p. 96.)

For `X = Spf Z_p`, the étale `F_p`-scheme `Spec F_{pⁿ}` lifts to `Spf W(F_{pⁿ})`; for `X = Spf O_C⟨T⟩ (C = C_p)` the étale `X_0`-scheme `Spec (O_C/p)[T, T⁻¹]` (`X_0 = Spec (O_C/p)[T]` for `𝒥 = (p)`; it is the unique lift along `X_red ⊆ X_0` of the étale `k̄[T]`-algebra `k̄[T, T⁻¹]`, construction reduced-special-scheme-equivalence) lifts to `Spf O_C⟨T, T⁻¹⟩`, which is of type `(S)` via `(b)` though `O_C⟨T, T⁻¹⟩` is not noetherian.

*Needs:* Section 4.1; `AdicSpacesPartIII`, layer F0 (`adic-systems-equivalence-finite-ideal-type`); `AdicSpacesPartIII`, layer F0 (`thickening-colimit-finite-ideal-type`); `AdicSpacesPartIII`, layer F0 (`formal-fibre-product`); `AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`); Mathlib AlgebraicGeometry.Scheme.Etale; Mathlib AlgebraicGeometry.Etale; Mathlib Algebra.Etale; Mathlib AdicCompletion; Tau Ceti TauCeti.Huber.IsStronglyNoetherian.

Let `X` be a formal scheme of type `(S)` and `𝒯 ⊆ O_X` the ideal of sections vanishing at every point (affine-locally the ideal `√J` of topologically nilpotent elements of `A, J` an ideal of definition). Then `X_red := (|X|, O_X/𝒯)` is a reduced scheme with underlying space `|X|`; for every ideal of definition `𝒥` one has `𝒥 ⊆ 𝒯` and `X_red → X_𝒥 = (X, O_X/𝒥)` is a closed immersion which is a homeomorphism, hence a universal homeomorphism. The functor `ρ_X`: Et/`X →` Et/`X_red, Y ↦ Y ×_X X_red (= Y_red)`, is an equivalence of categories which preserves finite limits and preserves and reflects coverings; hence `ρ_X` is an equivalence of sites `X_et ≃ (X_red)_et` and induces an equivalence of topoi `X~ ≃ (X_red)~`. It is natural in `X`: for a morphism `h`: X' `→ X` of type-`(S)` formal schemes, `ρ_{X'} ∘` (X' `×_X −`) `≅ (X'_red ×_{X_red} −) ∘ ρ_X`. In general `𝒯` is not an ideal of definition (for `X = Spf O_{C_p}, 𝒯 = m` and `m² = m`), so `X_red` need not be any thickening `X_𝒥`.

This uses `X` of type `(S)`; Imports: Stacks 04DZ (topological invariance for universal homeomorphisms) and 039R; construction etale-lifting-along-special-fibre.

(Huber (1996), §3.5, p. 201; Stacks project, Tag 04DZ (Étale Cohomology, Theorem 59.45.2); Stacks project, Tag 04DY (Étale Cohomology, Section 59.45); D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §3.3, proof of Theorem 1.4, statement (†), p. 16.)

`X = Spf O_{C_p}: X_red = Spec k̄ (k̄ = F̄_p)` while no ideal of definition `𝒥` has `O/𝒥 = k̄`; still `X_et ≃ (Spec k̄)_et` is trivial (every covering has a section). For `X` locally tfp over `O_K` this is `AdicSpacesPartIII`, layer R2 (`formal-etale-site-invariance`) (a), and it is the identification `(X^)_et ≅ Y_et` used to define `b` in Huber's (3.5.12).

*Needs:* Section 4.1; `AdicSpacesPartIII`, layer R2 (`formal-etale-site-invariance`); Mathlib AlgebraicGeometry.Scheme.smallEtaleTopology; Mathlib CategoryTheory.Functor.IsDenseSubsite; Mathlib CategoryTheory.Functor.IsDenseSubsite.sheafEquiv; `SchemeAndStackFoundations`, Layer 2; `AdicSpacesPartIII`, layer F0 (`ideal-of-definition`).

Let `f: Y → X` be an étale morphism of formal schemes of type `(S)` (construction formal-etale-morphism). (i) `d(f): d(Y) → d(X)` is an étale morphism of adic spaces (Huber's sense, `AdicSpacesPartII`, layer R0 (`differentials-unramified-smooth-etale`); equivalently AdicEtaleGeometry A1's, `AdicEtaleGeometry`, layer A1 (`etale-morphisms-local-description-and-comparison`), since `d(X)` is analytic and locally noetherian), and `λ_X ∘ d(f) = f ∘ λ_Y`. (ii) If `X = Spf A` with `A` as in `(S), J ⊆ A` the ideal of definition and `Y = Spf B^ for` an étale `A`-algebra `B`, then the comparison morphism `φ: d(Spf B^) → Spec B ×_{Spec A} d(Spf A)` of Huber (1.9.5) (`AdicSpacesPartIII`, layer R2 (`formal-completion-and-algebraic-comparison`), with `Spec B ×_{Spec A} d(Spf A)` the fibre product of `AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`)) is an open embedding. (iii) For an étale `Y → X` and an adic morphism `g`: X' `→ X` of type-`(S)` formal schemes, the natural morphism `d(X' ×_X Y) → d(X') ×_{d(X)} d(Y)` is an isomorphism; in particular `d(Y ×_X Y') ≅ d(Y) ×_{d(X)} d(Y')` for `Y`, Y' `∈` Et/`X`, and `d` sends open immersions to open immersions.

This uses `f` étale between type-`(S)` formal schemes; `g` adic in (iii); Imports: Huber (1.7.3) (a scheme étale over `Spec D` gives an adic space étale over `Spa A`, `AdicSpacesPartII`, layer R0 (`etale-local-structure`)) and Proposition 1.9.6 (`φ` is a local isomorphism, injective for separated `f`).

(Huber (1996), §1.9, Proposition 1.9.6, p. 98; Huber (1996), §1.7, Corollary 1.7.3, pp. 85-86; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §3, opening, printed p. 543; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §1, printed p. 542.)

For `X = Spf Z_p` and `Y = Spf W(F_{p²}), d(f)` is `Spa(Q_{p²}, Z_{p²}) → Spa(Q_p, Z_p)`, finite étale of degree 2. For `X = Spf Z_p⟨T⟩` and the open immersion `Spf Z_p⟨T⟩{T} → X, d(f)` is the open immersion of the rational subset `{|T| ≥ 1} = {|T| = 1}`.

*Needs:* Section 4.1; `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`); `AdicSpacesPartIII`, layer R2 (`specialisation-map`); `AdicSpacesPartIII`, layer R2 (`formal-completion-and-algebraic-comparison`); `AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`); `AdicSpacesPartII`, layer R0 (`differentials-unramified-smooth-etale`); `AdicSpacesPartII`, layer R0 (`etale-local-structure`); `AdicEtaleGeometry`, layer A1 (`etale-morphisms-local-description-and-comparison`).

Let `f: Y → X` be an étale morphism of formal schemes of type `(S)`. For every `y ∈ |Y|` and every `s ∈ d(X)` with `f(y) = λ_X(s)` there is `t ∈ d(Y)` with `λ_Y(t) = y` and `d(f)(t) = s`. Consequently, if a family `(g_i: Y_i → Y)` in Et/`X` is jointly surjective on `|Y|`, then `(d(g_i): d(Y_i) → d(Y))` is jointly surjective on `d(Y)`.

This uses `f` étale; `y` a point of the underlying space (equivalently of `Y_red`); `s` any point of `d(X)`, of any rank; The proof replaces Huber's appeal to [HK, 2.1.3] (lifting of primary generalizations in valuation spectra, a source not in the library) by going-down for the flat map `V → B ⊗_A V` and the extension of valuation rings.

(Huber (1996), §3.5, Lemma 3.5.1, p. 202; Huber (1996), §3.5, proof of Lemma 3.5.1, p. 202.)

For `X = Spf Z_p, Y = Spf W(F_{p²}), s` the unique point of `d(X)` and `y` the closed point of `Y: t` is the unique point of `Spa(Q_{p²}, Z_{p²})`. For a rank-two point `s` of `d(Spf Z_p⟨T⟩)` with `λ(s)` the closed point `(p, T)` and an étale neighbourhood `Y` of `(p,T)`, the lift `t` has rank two as well (its value group has the rank of `v_s`): the lemma does not only lift rank-one points.

*Needs:* Section 4.1; `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`); `AdicSpacesPartIII`, layer R2 (`specialisation-map`); Mathlib Algebra.Etale.baseChange; Mathlib `Algebra.Etale.iff_formallyUnramified_and_smooth`; Mathlib Algebra.Smooth.flat; Mathlib `Algebra.HasGoingDown.of_flat`; Mathlib `Ideal.exists_ideal_le_liesOver_of_le`; Mathlib `LocalSubring.exists_le_valuationSubring`; Mathlib `ValuationSubring.isMax_toLocalSubring`; Tau Ceti TauCeti.ValuationSpectrum.spaAnalytic; Tau Ceti TauCeti.ValuationSpectrum.supp.

Let `X` be a formal scheme of type `(S)` and `d(X)` its generic fibre (`AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`)), an analytic, locally strongly noetherian adic space with étale site `d(X)_et` (`AdicEtaleGeometry`, layer A1 (`etale-site`)). The functor `u_X`: Et/`X →` Et/`d(X), Y ↦ (d(Y) → d(X))`, is well defined (the generic-fibre theorem (i)), preserves the final object and fibre products (the same theorem, (iii)) and sends coverings to coverings (construction specialization-point-lifting); hence it is continuous and defines a morphism of sites `λ_X: d(X)_et → X_et` with `λ_X⁻¹ = u_X`, direct image `(λ_{X*}F)(Y) = F(d(Y))` and exact inverse image `λ_X^*` left adjoint to `λ_{X*}`. Properties: (a) (Remark 3.5.2) for Zariski opens `U ⊆ X, u_X(U) = d(U) = λ_X⁻¹(U)`, so on Zariski sites `λ_X` is the continuous map `λ_X` of `AdicSpacesPartIII`, layer R2 (`specialisation-map`); `(b)` for an adic morphism `g`: X' `→ X` of type-`(S)` formal schemes, `u_{X'}(X' ×_X Y) ≅ d(X') ×_{d(X)} u_X(Y)` naturally in `Y`, so `g_et ∘ λ_{X'} ≅ λ_X ∘ d(g)_et` as morphisms of topoi; `(c)` composed with `X_et ≃ (X_red)_et` (construction reduced-special-scheme-equivalence) `λ_X` is a morphism of sites `d(X)_et → (X_red)_et` sending an étale `X_red`-scheme `V` to `d(Ṽ), Ṽ` the unique étale lift of `V`; `(d)` for a geometric point `ξ: Spa(C, C⁺) → d(X)` with support `x` (`AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`)), `u_X` maps étale neighbourhoods of the point `λ_X(ξ)` of `X~` to étale neighbourhoods of `ξ`, and `(λ_X^*F)_ξ ≅ F_{λ_X(ξ)}`.

This uses `X` of type `(S)`; `d(X)_et` is AdicEtaleGeometry A1's site, which on the locally noetherian analytic space `d(X)` is Huber's (`AdicEtaleGeometry`, layer A1 (`etale-morphisms-local-description-and-comparison`)); Sheaves with values in sets, abelian groups or `E`-modules (Section 1.1).

(Huber (1996), §3.5, Lemma 3.5.1, p. 202; Huber (1996), §3.5, proof of Lemma 3.5.1, p. 202; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §3.3, proof of Theorem 1.4, statement (†), p. 16; B. Bhatt, D. Hansen, The six functors for Zariski-constructible sheaves in rigid geometry, §4.1, Theorem 4.2 (Properties of the perverse t-structure), item (8).)

Provide `FormalScheme.specialisationFunctor`: `u_X`: FormalScheme.SmallEtale `X ⥤` AdicSpace.smallEtale `(d X), Y ↦ d(Y)`; `FormalScheme.specialisationFunctor.isContinuous`: `u_X` is continuous for smallEtaleTopology and AdicSpace.smallEtaleTopology and preserves finite limits; `FormalScheme.specialisationPushforward`: `λ_{X*}: Sheaf(d(X)_et) ⥤ Sheaf(X_et), (λ_*F)(Y) = F(d(Y))`; `FormalScheme.specialisationPullback`: `λ_X^*: Sheaf(X_et) ⥤ Sheaf(d(X)_et)`, exact.

Provide `FormalScheme.specialisationAdjunction`: `λ_X^* ⊣ λ_{X*}`; `FormalScheme.specialisationFunctor_opens`: `u_X(U) = d(U) = λ_X⁻¹(U)` for Zariski opens `U` (Remark 3.5.2); `FormalScheme.specialisationFunctor_map`: For adic `g`: X' `→ X, u_{X'}(X' ×_X Y) ≅ d(X') ×_{d(X)} u_X(Y)` naturally in `Y`; hence `g_et ∘ λ_{X'} ≅ λ_X ∘ d(g)_et`; `FormalScheme.specialisationRed`: The composite of `λ_X` with `X_et ≃ (X_red)_et`; its inverse image sends an étale `X_red`-scheme `V` to `d` of the étale lift of `V`.

Provide `FormalScheme.specialisation_stalk`: For a geometric point `ξ` of `d(X): (λ_X^*F)_ξ ≅ F_{λ_X(ξ)}`, the stalk at the composite point; `FormalScheme.specialisationPushforward_sections`: `Γ(X_et, λ_{X*}F) = Γ(d(X)_et, F)`.

**Checks.**

- For `X = Spf O_K` (`K` complete, rank one, residue field `k`), `u_X` sends `Spf O_L` (`L/K` finite unramified) to `Spa(L, O_L)`; `λ_{X*}` of the sheaf given by a continuous `Gal(K^sep/K)`-set `M` is the `Gal(k^sep/k)`-set `M^{I_K}`.
- For an open `U ⊆ X, u_X(U) = d(U)` is the open subspace `λ_X⁻¹(U)` of `AdicSpacesPartIII`, layer R2 (`specialisation-map`).
- For `X = Spf Z_p`, the finite étale cover `Spa(Q_p(√p)) → Spa(Q_p, Z_p)` is not isomorphic to `u_X(Y)` for any `Y ∈` Et/`X: λ_X` is a morphism of sites, not an equivalence.
- `u_X` sends the covering `{Spf W(F_{p²}) → Spf Z_p}` to the covering `{Spa(Q_{p²}) → Spa(Q_p)}`.
- If `X` is a scheme with the discrete topology (ideal of definition 0), `d(X) = ∅, λ_{X*}F =` * (the terminal sheaf) for every `F`.

`λ_X` restricted to Zariski sites is the continuous map `λ` of Huber 1.9.1. For `X = Spf O_K` (`K` complete of rank one) `λ` is a homeomorphism of one-point spaces and `λ_{X*}` on sheaves of sets is the functor 'inertia invariants' from continuous `Gal(K^sep/K)`-sets to continuous `Gal(k^sep/k)`-sets.

*Needs:* Section 4.1; `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`); `AdicSpacesPartIII`, layer R2 (`specialisation-map`); `AdicEtaleGeometry`, layer A1 (`etale-site`); `AdicEtaleGeometry`, layer A1 (`etale-morphisms-local-description-and-comparison`); `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); Section 1.1; Mathlib CategoryTheory.Functor.IsContinuous; Mathlib CategoryTheory.Functor.sheafPushforwardContinuous; Mathlib CategoryTheory.Functor.sheafPullback; Mathlib CategoryTheory.Functor.sheafAdjunctionContinuous; Mathlib CategoryTheory.GrothendieckTopology.Point.

### 4.2 Pairs and full specialization supports

`A` pair `(X, L)` consists of a formal scheme `X` of type `(S)` and a subset `L ⊆ |X| (= |X_red|)`. A morphism of pairs `f`: (X', L') `→ (X, L)` is a morphism of formal schemes `f`: X' `→ X` with `f(L') ⊆ L`; it is adic when `f` is. The support space of `(X, L)` is the prepseudo-adic space `d(X, L) := (d(X), λ_X⁻¹(L))`: the adic space `d(X)` (`AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`)) together with the subset `λ_X⁻¹(L)` of its underlying space (`λ_X` the continuous map of `AdicSpacesPartIII`, layer R2 (`specialisation-map`)). Since `λ_X` is spectral on affine formal opens (Huber (1.9.3)), `λ_X⁻¹(L)` is convex and locally pro-constructible whenever `L` is, and then `d(X, L)` is a pseudo-adic space (the carrier of Section 1.2). In particular `d(X, L)` is pseudo-adic for every locally closed `L ⊆ |X|`, the case used in 3.5.6–3.5.16 (with the convention that local pro-constructibility of a subset `S` is tested on spectral open neighbourhoods of the points of `S`, under which locally closed subsets of locally spectral spaces qualify; this is weaker than the test on every spectral open of `AdicSpacesPartII`, §R0.19.2 (`pro-constructible-subsets`), and the predicate IsPseudoAdic of Section 1.2, whose stated sufficient condition is 'locally closed and constructible', must use the same convention; when `|X|` is locally noetherian, `e.g`. `X` locally noetherian or locally tf over `O_K`, locally closed subsets are locally constructible and the conventions agree). An adic morphism of pairs induces `d(f): d(X', L') → d(X, L)`, because `λ_X ∘ d(f) = f ∘ λ_{X'}`. Pinned conventions: the support is the full preimage `λ_X⁻¹(L)`, not the tube ]`L`[ `=` interior of `λ_X⁻¹(L)` of `AdicSpacesPartIII`, layer R2 (`tube`); `d(X, |X|) = d(X)` as a pseudo-adic space; for L' `⊆ L` the identity of `X` is a morphism of pairs `i`: (`X`, L') `→ (X, L)` and `d(i)` is the inclusion of supports.

This uses `X` of type `(S)`; `L ⊆ |X|` arbitrary for the prepseudo-adic space, convex and locally pro-constructible (`e.g`. locally closed) for the pseudo-adic space; Pseudo-adic spaces, their morphisms and étale sites are owned by Section 1.2 and Section 1.2 (the supported site of Section 1.2); this assertion only produces objects of that category.

(Huber (1996), §3.5, (3.5.3), p. 203; Huber (1996), §3.5, (3.5.5), p. 204; Huber (1996), §2.6, Proposition 2.6.1, p. 138; Scholze, Étale cohomology of diamonds, Remark 19.3, pp. 108-109; Scholze, Étale cohomology of diamonds, §20 opening, p. 109.)

Provide `FormalScheme.Pair`: `A` pair `(X, L): X` a formal scheme of type `(S), L ⊆ |X|`; `FormalScheme.Pair.Hom`: Morphisms of pairs `f`: (X', L') `→ (X, L), f(L') ⊆ L`; identities and composition make pairs a category; `FormalScheme.Pair.supportSpace`: `d(X, L) = (d(X), λ_X⁻¹(L))`, a prepseudo-adic space; `FormalScheme.Pair.isPseudoAdic_supportSpace`: If `L` is convex and locally pro-constructible (in particular locally closed) then `d(X, L)` is a pseudo-adic space.

Provide `FormalScheme.Pair.supportSpace_map`: An adic morphism of pairs `f` induces `d(f): d(X', L') → d(X, L)`, with `d(id) =` id and `d(g ∘ f) = d(g) ∘ d(f)`; `FormalScheme.Pair.supportSpace_univ`: `d(X, |X|) = d(X)`; `FormalScheme.Pair.supportSpace_mono`: For L' `⊆ L` the identity of `X` is a morphism of pairs `i`: (`X`, L') `→ (X, L)` and `d(i)` is the inclusion of supports `λ_X⁻¹(L') ⊆ λ_X⁻¹(L)`; `FormalScheme.Pair.supportSpace_isOpen`: For `L = U` open, `d(X, U) = d(U)` (the open subspace `λ_X⁻¹(U)`).

Provide `FormalScheme.Pair.supportSpace_isClosed`: For `X` admissible over `O_K` (the scope in which `AdicSpacesPartIII`, layer R2 (`tube`) defines ]`L[) and L closed, the support λ_X⁻¹(L) is closed in d(X) and contains the tube ]L`[ as its interior (`AdicSpacesPartIII`, layer R2 (`tube`)).

**Checks.**

- `X = Spf Z_p⟨T⟩, L = {(p, T)}`: the support of `d(X, L)` is `{x : |T(x)| < 1}`, closed and not open in `d(X)`, and it contains the rank-two point `η_{1⁻}`.
- In the previous example the support `λ_X⁻¹(L)` is strictly larger than the tube ]`L`[ of `AdicSpacesPartIII`, layer R2 (`tube`) (it contains `η_{1⁻}`); a definition by tubes gives a different pseudo-adic space.
- `d(X, |X|) = d(X)` and `d(X, ∅)` is the empty pseudo-adic space.
- For `X = Spf A` and `L = D(f)` open, `d(X, L) = d(Spf A_{f})`, the rational subset `{|f| ≥ 1} = {|f| = 1}` of `d(X)` with its full support.
- For `A` a microbial valuation ring of rank two with fraction field `K` and `X = Spf A, d(X) = Spa(K, A)` has two points (`A` and its rank-one generization `K°`); for `L` the closed point of `X`, the support of `d(X, L)` is the closed point of `Spa(K, A)` only.

For `X = Spf Z_p⟨T⟩` and `L` the closed point `(p, T): λ_X⁻¹(L) = {|T| < 1}` is closed and not open in `d(X)`; it contains the rank-two point `η_{1⁻}` which is not in the tube ]`L`[ (the open disc).

*Needs:* `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`); `AdicSpacesPartIII`, layer R2 (`specialisation-map`); `AdicSpacesPartIII`, layer R2 (`tube`); `AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`); `AdicSpacesPartII`, §R0.0 (`locally-spectral-space`); `AdicSpacesPartII`, §R0.19.2 (`pro-constructible-subsets`); Section 1.2.

Let `(X, L)` be a pair (construction pairs-and-pseudo-adic-supports). The site `(X, L)_et` has objects the pairs `(Y, S)` with `Y ∈` Et/`X` (structure map `g: Y → X`) and `S` an open subset of `g⁻¹(L)` (subspace topology); morphisms (Y', S') `→ (Y, S)` are `X`-morphisms `h`: Y' `→ Y` with `h(S') ⊆ S`; a family `(h_i: (Y_i, S_i) → (Y, S))` is a covering iff `S = ∪ h_i(S_i)`. The category has the final object `(X, L)` and fibre products `(Y_1, S_1) ×_{(Y,S)} (Y_2, S_2) = (Y_1 ×_Y Y_2, pr_1⁻¹(S_1) ∩ pr_2⁻¹(S_2))`. The topos is `(X, L)~`. For `L = |X|` the functor `Y ↦ (Y, |Y|)` induces an equivalence `X~ ≃ (X, |X|)~`. A morphism of pairs `f`: (X', L') `→ (X, L)` induces a morphism of sites `f_et`: (X', L')`_et → (X, L)_et` with inverse image functor `(Y, S) ↦` (X' `×_X Y, pr⁻¹(S) ∩ q⁻¹(L')`) (`q`: X' `×_X Y →` X'), compatible with composition. For L' `⊆ L` the identity of `X` gives `i`: (`X`, L')`_et → (X, L)_et` with `(Y, S) ↦ (Y, S ∩ g⁻¹(L'))`; when L' is open in `L, i^*` has the exact left adjoint `i_`! (extension by zero) and `i^*i_`! `=` id.

This uses `(X, L)` a pair; `L` arbitrary for the site, locally closed in 3.5.5–3.5.16; Coverings only test the supports `S: (Y, S)` can be covered by objects (Y', S') with Y' `→ Y` not surjective.

(Huber (1996), §3.5, (3.5.5), p. 204; Huber (1996), §3.5, (3.5.3), p. 203; Scholze, Étale cohomology of diamonds, Remark 19.3, pp. 108-109.)

Provide `FormalScheme.Pair.SmallEtale`: The category of pairs `(Y, S), Y ∈` Et/`X, S` open in `g⁻¹(L)`; `FormalScheme.Pair.smallEtaleTopology`: Coverings: `(h_i: (Y_i, S_i) → (Y, S))` with `S = ∪ h_i(S_i)`; `FormalScheme.Pair.SmallEtale.hasFiniteLimits`: Final object `(X, L)` and fibre products `(Y_1 ×_Y Y_2, pr_1⁻¹S_1 ∩ pr_2⁻¹S_2)`; `FormalScheme.Pair.SmallEtale.map`: A morphism of pairs `f`: (X', L') `→ (X, L)` gives the continuous finite-limit-preserving functor `(Y, S) ↦` (X' `×_X Y, pr⁻¹S ∩ q⁻¹L'`), with `map_id` and `map_comp`.

Provide `FormalScheme.Pair.toposUnivEquiv`: `X~ ≃ (X, |X|)~` induced by `Y ↦ (Y, |Y|)`; `FormalScheme.Pair.restrictSupport`: For L' `⊆ L`, the morphism of sites `i`: (`X`, L')`_et → (X, L)_et`, with `i^*(Y, S) = (Y, S ∩ g⁻¹L')`; `FormalScheme.Pair.extendByZero`: For L' open in `L, i_`!: left adjoint of `i^*` on sheaves of `E`-modules, exact, with `i^* i_`! `≅` id and `i''^* i_`! `= 0` for the closed complement L'' `= L −` L'; `FormalScheme.Pair.ofArrows_mem_smallEtaleTopology_iff`: `A` family generates a covering sieve iff the images of the supports cover `S`.

**Checks.**

- `(X, |X|)~ ≃ X~`, and `(X, ∅)~` is the degenerate topos: every object `(Y, ∅)` is covered by the empty family, so every sheaf is terminal (as for `S = ∅` in Section 1.2 (iii)); it is not the one-point topos Set.
- For `X = Spf Z_p⟨T⟩` and `L` the closed point `(p, T), (X, L)~` is equivalent to the category of continuous `Gal(F̄_p/F_p)`-sets.
- For an open neighbourhood `U` of `L`, the one-element family `{(U, L) → (X, L)}` is a covering of `(X, L)` although `U → X` is not surjective: the site only sees `L`.
- For `L ≠ ∅`, the one-element family `{(X, ∅) → (X, L)}` given by the identity of `X` with empty support is not a covering of `(X, L)`, although its underlying morphism of formal schemes is an isomorphism; a definition testing coverings on `Y` instead of on the supports `S` would accept it.
- For `X` a locally noetherian scheme with the discrete topology and `L` locally closed, `(X, L)~` is the étale topos of the reduced subscheme `L_red` (construction pair-topos-reduced-subscheme-3-5-5).

For `L = {y}` a closed point, `(X, {y})~` is the étale topos of `Spec κ(y)` (construction pair-topos-reduced-subscheme-3-5-5).

*Needs:* Section 4.2; Section 4.1; Mathlib CategoryTheory.Functor.IsDenseSubsite; Mathlib CategoryTheory.Functor.IsDenseSubsite.sheafEquiv; Mathlib CategoryTheory.Functor.IsContinuous; Mathlib CategoryTheory.Functor.sheafPullback; Section 1.2.

Let `(X, L)` be a pair with `L` convex and locally pro-constructible (`e.g`. locally closed), so that `d(X, L)` is a pseudo-adic space (construction pairs-and-pseudo-adic-supports) with étale site `d(X, L)_et` (Huber's site: objects the pairs `(V, T)` with `V` étale over `d(X)` and `T` open in the preimage of `λ_X⁻¹(L)`, coverings the families whose supports cover `T`; its topos is that of the carrier `(d(X)_ét, J_{λ_X⁻¹(L)})` of Section 1.2, see the proof). The functor `u_(X,L): (X, L)_et → d(X, L)_et, (Y, S) ↦ d(Y, S) := (d(Y), λ_Y⁻¹(S))` with its map to `d(X, L)`, is well defined (`d(Y) → d(X)` is étale and `λ_Y⁻¹(S)` is open in `λ_Y⁻¹(g⁻¹(L)) = d(g)⁻¹(λ_X⁻¹(L))`), preserves finite limits and sends coverings to coverings; it defines the morphism of sites `λ = λ_(X,L): d(X, L)_et → (X, L)_et`, with direct image `(λ_*F)(Y, S) = F(d(Y, S))`, exact inverse image `λ^* ⊣ λ_*`, and derived direct image `R⁺λ_*: D⁺(d(X, L)_et, E) → D⁺((X, L)_et, E)` for every ring `E`. For `L = |X|` it is `λ_X` of construction specialization-morphism-of-sites-lambda under `(X, |X|)~ ≃ X~` and `d(X, |X|) = d(X)`.

This uses `L` convex and locally pro-constructible (locally closed in 3.5.6–3.5.16); The étale site of a pseudo-adic space is Layer 1's carrier Section 1.2 (a construction of this roadmap).

(Huber (1996), §3.5, (3.5.3), p. 203; Huber (1996), §3.5, Lemma 3.5.1, p. 202; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §3.3, proof of Theorem 1.4, statement (†), p. 16.)

Provide `FormalScheme.Pair.specialisationFunctor`: `u_(X,L): (Y, S) ↦ d(Y, S) = (d(Y), λ_Y⁻¹(S))`; `FormalScheme.Pair.specialisationFunctor.isContinuous`: `u_(X,L)` is continuous and preserves finite limits; `FormalScheme.Pair.specialisationPushforward`: `λ_*: Sheaf(d(X, L)_et) ⥤ Sheaf((X, L)_et), (λ_*F)(Y, S) = F(d(Y, S))`; `FormalScheme.Pair.specialisationPullback`: `λ^*`, exact, left adjoint to `λ_*`.

Provide `FormalScheme.Pair.specialisationAdjunction`: `λ^* ⊣ λ_*`; `FormalScheme.Pair.derivedSpecialisationPushforward`: `R⁺λ_*: D⁺(d(X, L)_et, E) ⥤ D⁺((X, L)_et, E)` for every ring `E`; `FormalScheme.Pair.specialisation_univ`: `λ_(X,|X|) = λ_X` under `(X, |X|)~ ≃ X~` and `d(X, |X|) = d(X)`; `FormalScheme.Pair.specialisation_restrict`: For L' `⊆ L: i ∘ λ_(X,L') ≅ λ_(X,L) ∘ d(i)` (the square of construction pair-specialization-functoriality-3-5-4 for the identity of `X`).

**Checks.**

- For `L = |X|, λ_(X,|X|)` is `λ_X` under `(X, |X|)~ ≃ X~`; for `L = ∅` both topoi are trivial.
- `X = Spf O_K, L` the closed point: `λ_*` sends a continuous `Gal(K^sep/K)`-set `M` to `M^{I_K}`.
- For `X = Spf Z_p⟨T⟩` and `L = |X|`, the Zariski covering `{(X{T}, ·), (X{T−1}, ·)} (D(T) ∪ D(T−1) = A^1_{F_p})` is sent to the covering `{|T| = 1} ∪ {|T − 1| = 1}` of the closed unit disc: every point has `|T| = 1` or `|T − 1| = 1`.
- Replacing `λ_Y⁻¹(S)` by the tube ]`S[ does not give a functor to d(X, L)_et preserving coverings: for L closed, the point η_{1⁻} ∈ λ_X⁻¹(L) is not in ]L`[.

For `X = Spf O_K` and `L` the closed point, `λ_(X,L)` is `λ_X` (the closed point is all of `|X|`). The covering property fails if supports are replaced by tubes: for `L` closed, the rank-two boundary points of `λ⁻¹(L)` lie in no ]`S_i`[ (construction pairs-and-pseudo-adic-supports).

*Needs:* Section 4.2; Section 4.1; Section 1.2; Section 1.1; Mathlib CategoryTheory.Functor.IsContinuous; Mathlib CategoryTheory.Functor.sheafPushforwardContinuous; Mathlib CategoryTheory.Functor.sheafPullback; Mathlib CategoryTheory.Functor.sheafAdjunctionContinuous; Mathlib CategoryTheory.Functor.rightDerivedFunctorPlus; Mathlib CategoryTheory.Functor.IsDenseSubsite.sheafEquiv.

Let `f`: (X', L') `→ (X, L)` be an adic morphism of pairs with `L`, L' convex and locally pro-constructible. Then the square of morphisms of sites formed by `λ_(X',L'), λ_(X,L), d(f)_et: d(X', L')_et → d(X, L)_et` and `f_et`: (X', L')`_et → (X, L)_et` commutes up to a canonical isomorphism: for `(Y, S) ∈ (X, L)_et, d(X' ×_X Y, S') ≅ d(X', L') ×_{d(X,L)} d(Y, S)` with S' `= pr⁻¹(S) ∩ q⁻¹(L')`, naturally in `(Y, S)`. Consequently `f^* ∘ λ_* ⟶ λ'_* ∘ d(f)^*` and, for every ring `E`, the base-change transformation `f^* ∘ R⁺λ_(X,L)* ⟶ R⁺λ_(X',L')* ∘ d(f)^*` on `D⁺(d(X, L)_et, E)` are defined.

This uses `f` adic; `L`, L' convex and locally pro-constructible.

(Vladimir G. Berkovich, Vanishing cycles for formal schemes, §1, printed p. 542; Huber (1996), §3.5, (3.5.3), p. 203.)

For the identity of `X` and L' `⊆ L` this is the square used in Corollary 3.5.11(i).

*Needs:* Section 4.2; Section 4.1; `AdicSpacesPartIII`, layer R2 (`specialisation-map`); Section 1.1; Section 1.2.

Let `(X, L)` be a pair with `L` locally closed in `|X|` or `L = {y}` a single point, and let `L_red` be the reduced locally closed subscheme of `X_red` with underlying space `L` (for `L = {y}: Spec κ(y)`). The functor `φ⁻¹: (X, L)_et →` Et/`L_red, (Y, S) ↦` the open subscheme of `L_red ×_{X_red} Y_red` with underlying set `S` (`S` is open in `g⁻¹(L) = |L_red ×_{X_red} Y_red|`), is continuous and preserves finite limits, so it defines a morphism of sites `φ: (L_red)_et → (X, L)_et`, and the induced morphism of topoi `φ~: (L_red)~ → (X, L)~` is an equivalence. Henceforth `(X, L)~` is identified with `(L_red)~`; for `L = |X|` this is construction reduced-special-scheme-equivalence.

This uses `L` locally closed, or a single point; Imports (scheme level, `SchemeAndStackFoundations`, Layer 2): étale morphisms to a locally closed subscheme lift Zariski-locally to étale morphisms of the ambient scheme; étale `κ(y)`-algebras spread out to étale neighbourhoods of `y`.

(Huber (1996), §3.5, (3.5.5), p. 204; Stacks project, Tag 04DZ (Étale Cohomology, Theorem 59.45.2); Stacks project, Tag 039R (Étale Morphisms of Schemes, Theorem 41.15.2).)

`L = {y}` a closed point: `(X, {y})~ ≃ Gal(κ(y)^sep/κ(y))`-sets. `L = |X|: (X, |X|)~ ≃ X~ ≃ (X_red)~` (construction reduced-special-scheme-equivalence).

*Needs:* Section 4.2; Section 4.1; `SchemeAndStackFoundations`, Layer 2; Mathlib CategoryTheory.Functor.IsDenseSubsite; Mathlib CategoryTheory.Functor.IsDenseSubsite.sheafEquiv; Mathlib AlgebraicGeometry.Scheme.smallEtaleTopology.

Let `B` be a complete microbial valuation ring (Wedhorn Definition 5.46) with algebraically closed fraction field `C`, and `X = Spf B` with the valuation topology (of type `(S)`: `AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`), API `spf_microbial`). Then (i) `d(X) = Spa(C, B)` and `λ_X: d(X) → |X|` is a homeomorphism: both are the chain of valuation rings `V` with `B ⊆ V ⊆ C° ↔` primes `p` of `B` containing the height-one prime `q = √`(sB) `(V = B_p)`; (ii) `X_red = Spec(B/q)` with `B/q` a valuation ring whose fraction field is algebraically closed, hence a strictly henselian local ring, and every étale morphism into `X_red`, into `X`, or into `d(X)` has, through every point over the closed point, a section which is an open immersion (`AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`) for `d(X)`); (iii) consequently, for sheaves `F` on `X_et` and `G` on `d(X)_et`, the stalk of `F` at the closed point is `F(X)`, the stalk of `G` at the closed point of `Spa(C, B)` is `G(d(X))`, and `(λ_X^*F)_{closed} ≅ F(X)`.

This uses `B` complete microbial valuation ring, Frac `B = C` algebraically closed; any rank; Henselianity of `B/q`: a valuation ring with algebraically closed fraction field is henselian (every finite extension of its fraction field is trivial), and its residue field (that of `B`) is algebraically closed.

(T. Wedhorn, Adic spaces, Remark and Definition 5.46; T. Wedhorn, Adic spaces, Example 7.17; Huber (1996), §1.9, p. 96; Huber (1996), §3.5, proof of 3.5.6, p. 204.)

For `B = O_C` (rank one), `X_red = Spec k̄` is a point and `d(X) = Spa(C, O_C)` is a point; for `B` of rank two, both `X` and `d(X)` have two points and `λ_X` matches them.

*Needs:* `AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`); `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`); `AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`); Section 4.1; `SchemeAndStackFoundations`, Layer 2; Mathlib HenselianLocalRing; Mathlib ValuationRing; Tau Ceti Valuation.IsMicrobial.

Let `X` be a formal scheme of type `(S), L ⊆ |X|` locally closed and `λ = λ_(X,L)`. Let `x ∈ |d(X, L)| = λ_X⁻¹(L), y := λ_X(x) ∈ L`, and let `x̄: Spa(C, C⁺) → d(X)` be a geometric point with support `x` (`AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); `C` complete algebraically closed, `C⁺` an open bounded valuation ring of any rank). The composite point `λ(x̄)` of `(X, L)~ ≃ (L_red)~` is the geometric point `ȳ: Spec k_{C⁺} → L_red` over `y` given by the residue field `k_{C⁺}` of `C⁺` (algebraically closed, and `κ(y) → k_{C⁺}` because `y` is the centre of `x`). For every sheaf `F` on `(X, L)_et` there is a natural isomorphism of stalks `(λ^*F)_x̄ ≅ F_ȳ`. In particular `λ^*` creates no cohomology: all cohomology of the comparison comes from `R⁺λ_*`.

This uses `L` locally closed; `F` a sheaf of sets (hence also of groups or modules); The auxiliary valuation ring in the proof must have algebraically closed fraction field: it is the completion of `C⁺` for the chosen geometric point (the source's parenthetical example, the completion of `k(x)⁺`, has this property only after passing to a geometric point).

(Huber (1996), §3.5, Proposition 3.5.6, p. 204; Huber (1996), §3.5, proof of 3.5.6, p. 204; Huber (1996), Chapter 2 introduction, p. 108.)

Stalks of `λ^*F` at the analytic points of the support over `y` are the stalks of `F` at `y`; `e.g`. for `X = Spf Z_p⟨T⟩, L = {(p,T)}` and `F = i_{y*}M` (`M` a `Gal(F̄_p/F_p)`-set), `λ^*F` has stalk `M` at every geometric point of `{|T| < 1}`, including `η_{1⁻}`.

*Needs:* Section 4.2; Section 4.1; `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`); `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); Section 1.2; Mathlib CategoryTheory.GrothendieckTopology.Point; Mathlib AlgebraicGeometry.Scheme.pointSmallEtale.

Let `X` be a formal scheme of type `(S), L ⊆ |X|` locally closed, `Λ` a noetherian ring and `λ = λ_(X,L)`. If `F` is a constructible sheaf of `Λ`-modules on `(X, L)_et ≃ (L_red)_et` (constructible in the sense of schemes: locally on `L_red` there is a finite partition into locally closed constructible subsets on whose reduced subschemes `F` is locally constant with finitely generated stalks), then `λ^*F` is a constructible sheaf of `Λ`-modules on the pseudo-adic space `d(X, L)` in Huber's sense for pseudo-adic spaces, `i.e`. the definition of Section 1.4 with `|X|` replaced by the support: locally on the support `λ_X⁻¹(L)`, there is a finite partition into subsets locally closed and constructible relative to that support, on each of which (as a pseudo-adic site, Section 1.2) the sheaf is locally constant of finite type. This is the intrinsic pseudo-adic definition in Section 1.4, not an ambient-constructibility condition. (Huber (1996), §2.7, Definition 2.7.2, p. 145.)

This uses `L` locally closed; `Λ` noetherian; `F` constructible (scheme sense).

(Huber (1996), §3.5, Proposition 3.5.6, p. 204; Kazuhiro Fujiwara, Fumiharu Kato, Foundations of Rigid Geometry I, Chapter II, Theorem 3.1.2(2).)

For `X = Spf O_K, L` the closed point and `F` the constant sheaf `Λ, λ^*F` is the constant sheaf `Λ` on `Spa(K, O_K)`.

*Needs:* Section 4.2; `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`); `AdicSpacesPartII`, §R0.19.2 (`pro-constructible-subsets`); Section 1.4; `SchemeAndStackFoundations`, Layer 2; Section 1.2.

Let `X` be a formal scheme of type `(S), E` a ring and `F` a sheaf of `E`-modules on `d(X)_et`. (i) `R^nλ_{X*}F` is the sheaf on `X_et` associated with the presheaf `Y ↦ Hⁿ(d(Y), F|_{d(Y)})`. (ii) For a geometric point `ȳ` of `X_red` (a point of `X~` via construction reduced-special-scheme-equivalence), `(R^nλ_{X*}F)_ȳ = colim Hⁿ(d(Y), F)`, the colimit over the cofiltered category of étale neighbourhoods `(Y, u)` of `ȳ` in `X_et`. (iii) For `K ∈ D⁺(d(X)_et, E)` there is a natural isomorphism `R⁺Γ(d(X), K) ≅ R⁺Γ(X_red, R⁺λ_{X*}K)` and a spectral sequence `E_2^{pq} = Hᵖ(X_red, R^qλ_{X*}K) ⇒ H^{p+q}(d(X), K)`.

This uses `X` of type `(S)`; `E` any ring; `K` bounded below; The same statements hold for `λ_{(X,L)}` (construction pair-specialization-morphism) with `(X,L)_et ≃ (L_red)_et`.

(Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, Proposition 4.1(ii), printed p. 548; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, Corollary 4.2(iii), printed p. 548; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §3.3, proof of Theorem 1.4, statement (†), p. 16; Vladimir G. Berkovich, Vanishing cycles for formal schemes, Introduction, printed p. 540.)

For `X = Spf O_K` with `K` complete discretely valued and `ℓ ≠ p: (R^1λ_*Z/ℓ)_{s̄} = H¹(I_K, Z/ℓ) ≅ Z/ℓ(−1)` and `(R^nλ_*Z/ℓ)_{s̄} = 0` for `n ≥ 2` (construction stalk-formula-constant-coefficients-3-5-10).

*Needs:* Section 4.1; Section 1.1; `DiamondsAndVStacks`, layer D0, Section D0.19; `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`); `EnhancedDerivedSheaves`, §§0.1–0.4 (`K`-injective and `K`-flat replacements); Mathlib CategoryTheory.GrothendieckTopology.Point; Mathlib CategoryTheory.Functor.rightDerivedFunctorPlus; Mathlib CategoryTheory.GrothendieckTopology.Point.presheafFiber; Section 4.2; Mathlib AlgebraicGeometry.Scheme.pointSmallEtale.

### 4.3 Formal strict localization and tube cohomology

Let `X` be a formal scheme of type `(S), L ⊆ |X|` locally closed, `x ∈ L` and `x̄` a geometric point of `X_red` over `x`. Choose an affine formal open `U = Spf A ∋ x` with `A` as in `(S)` such that `L ∩ U` is closed in `U`, and let `B` be the ring `A` with a finitely generated ideal of definition `J`, taken principal (`J =` sB, `s` as in `(S)(b)`) when `A` is not noetherian. Put `Y := Spec B` (a scheme), `y ∈ Y` the open prime corresponding to `x (J ⊆ y), ȳ` the induced geometric point of `Y`. Let `I` be the category of `ȳ`-pointed affine étale `Y`-schemes `(Y_i, u_i)` (`u_i: ȳ → Y_i` lifting `ȳ → Y`); `I` is cofiltered and essentially small, and `Y_∞ := lim_I Y_i = Spec O^sh_{Y,ȳ}` is the strict localisation. Let `Y_i^ and Y_∞^` be the formal completions along the closed subschemes defined by `J` (`Spf` of the `J`-adic completions of `O(Y_i)` and of `O^sh_{Y,ȳ}`), with the induced morphisms `f_i: Y_i^ → X` and `f: Y_∞^ → X, z_i ∈ Y_i^ the` point `u_i(ȳ)` and `z ∈ Y_∞^` the closed point. Then: each `Y_i^ is` étale over `U` and of type `(S)`, so `(Y_i^, u_i)` is an étale neighbourhood of `x̄` in `X_et`, and these neighbourhoods are cofinal among all étale neighbourhoods of `x̄`; the pseudo-adic spaces `d(Y_i^, f_i⁻¹(L))` and `d(Y_i^, {z_i})` form cofiltered systems along adic transition maps; `Y_∞^` is an affine formal scheme which is of type `(S)` when `A` is noetherian and need not be of type `(S)` otherwise; when `Y_∞^` is of type `(S), d(Y_∞^, f⁻¹(L)) ~ lim_I d(Y_i^, f_i⁻¹(L))` is a Huber tilde-limit (Section 1.5), and likewise for the supports `{z}, {z_i}`.

This uses `X` of type `(S)`; `L` locally closed, shrunk to be closed in `U`; `J` principal in the non-noetherian case; Strict henselisation and limits of affine schemes are scheme-level inputs (`SchemeAndStackFoundations`, Layer 2).

(Huber (1996), §3.5, Theorem 3.5.8, p. 205; Huber (1996), §3.5, Theorem 3.5.10, p. 206; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §3.3, proof of Theorem 1.4, before formula (∗), p. 17.)

Provide `FormalScheme.StrictLocalisationSystem`: The data `(U = Spf A, B, J, y, ȳ, I, (Y_i, u_i))` of (3.5.7); `FormalScheme.StrictLocalisationSystem.isCofiltered`: The index category `I` is cofiltered and essentially small; `FormalScheme.StrictLocalisationSystem.completion`: `i ↦ Y_i^ ∈` Et/`X` with `f_i: Y_i^ → X` and the points `z_i`; transition maps adic; `FormalScheme.StrictLocalisationSystem.completionInfty`: `Y_∞^ = Spf (O^sh_{Y,ȳ})^_J, f: Y_∞^ → X`, and its closed point `z`.

Provide `FormalScheme.StrictLocalisationSystem.limit_iso`: `lim_I Y_i ≅ Spec O^sh_{Y,ȳ}` (strict localisation); `FormalScheme.StrictLocalisationSystem.completion_isEtale`: Each `Y_i^ → U` is étale and `Y_i^ is` of type `(S)`; `FormalScheme.StrictLocalisationSystem.cofinal`: The `(Y_i^, u_i)` are cofinal among étale neighbourhoods of `x̄` in `X_et`; `FormalScheme.StrictLocalisationSystem.isTypeS_infty_of_isNoetherian`: If `A` is noetherian, `Y_∞^` is of type `(S)`.

Provide `FormalScheme.StrictLocalisationSystem.tildeLimit`: If `Y_∞^` is of type `(S): d(Y_∞^, f⁻¹(L)) ~ lim_I d(Y_i^, f_i⁻¹(L))` and `d(Y_∞^, {z}) ~ lim_I d(Y_i^, {z_i})` (Huber tilde-limits).

**Checks.**

- For `X = Spf O_K` (`K` complete discretely valued) and `x` the closed point, `Y_∞ = Spec O_K^sh` and `Y_∞^ = Spf O_{K̆}`; `d(Y_∞^)` is the single point `Spa(K̆, O_{K̆})`.
- Replacing `I` by Zariski neighbourhoods of `y` gives `Y_∞ = Spec B_y` (for `X = Spf Z_p: Spec Z_p`, not strictly henselian); the resulting 'stalk' of `R^1λ_*Z/ℓ` would be `H¹(Q_p, Z/ℓ)` instead of `H¹(Q_p^nr, Z/ℓ)`, so the pointed étale neighbourhoods are essential.
- If `A` is noetherian then `Y_∞^` is of type `(S)` via (a), so Theorem 3.5.8 applies (construction stalks-of-higher-direct-images-lambda).
- The pointed completions `(Y_i^, u_i)` are cofinal among étale neighbourhoods of `x̄` in `X_et`, so `(R^nλ_*F)_x̄ = colim_I Hⁿ(d(Y_i^, f_i⁻¹(L)), F)` (construction higher-direct-images-of-lambda (ii)).

`X = Spf O_K` (`K` complete discretely valued), `x` the closed point: `Y_∞ = Spec O_K^sh, Y_∞^ = Spf O_{K̆}` (completion of the maximal unramified extension), `d(Y_∞^) = Spa(K̆, O_{K̆})` is one point.

*Needs:* Section 4.1; Section 4.2; Section 1.5; `SchemeAndStackFoundations`, Layer 2; `AdicSpacesPartII`, §R0.1b (`adic-completion-noetherian`); Mathlib AdicCompletion; Mathlib HenselianLocalRing; Section 1.2.

In the situation of construction formal-strict-localisation-system-3-5-7, let `F` be an abelian sheaf on `d(X, L)_et, λ = λ_(X,L)`, and assume that the formal scheme `Y_∞^` is of type `(S)`. Put `F'_∞ := d(f)^*F` on `d(Y_∞^, f⁻¹(L))`. Then for every `n ≥ 0` there is a natural isomorphism `(R^nλ_*F)_x̄ ≅ Hⁿ(d(Y_∞^, f⁻¹(L)), F'_∞)`. The type-`(S)` hypothesis on `Y_∞^` is part of the statement; without it the filtered formula of construction stalk-formula-filtered-3-5-9 is used instead, and no analytic strict-localisation space is asserted to exist.

This uses `Y_∞^` of type `(S)` (automatic when `A` is noetherian); `F` any abelian sheaf (no torsion hypothesis in part (i)); `L` locally closed, closed in the chosen affine `U`.

(Huber (1996), §3.5, Theorem 3.5.8, p. 205; Huber (1996), §3.5, after 3.5.8, p. 206; Huber (1996), §3.5, Theorem 3.5.10, p. 206; Huber (1996), §2.4, Corollary 2.4.6, p. 129; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, Proposition 4.1(ii), printed p. 548.)

`X = Spf O_K` (`K` complete discretely valued), `L = |X|, x` the closed point: `(R^nλ_*F)_x̄ = Hⁿ(Spa(K̆, O_{K̆}), F|) = Hⁿ(Gal(K̆^sep/K̆), F_{ξ})` — the cohomology of the inertia group, as in SGA 7 XIII 1.2.2`(b)` for `n = 0`.

*Needs:* Section 4.3; Section 4.2; Section 1.5; `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`); Section 1.2.

Let `A` be an affinoid ring (not necessarily complete), `J ⊆ I` ideals of `A⁺` such that `A⁺/J` is henselian along `I/J`, and let `T :=` {`x ∈ Spa A : |i(x)| < 1` for all `i ∈ I`} `⊆ U :=` {`x ∈ Spa A : |j(x)| < 1` for all `j ∈ J`}, closed subsets of `Spa A` regarded as pseudo-adic subspaces. Let `f: X → Spec A^▷` be a morphism of schemes satisfying conditions (a) and `(b)` of Theorem 3.2.10, or with `A^▷` discrete, and `X_T := X ×_{Spec A^▷} T → X_U := X ×_{Spec A^▷} U` the induced morphism of pseudo-adic spaces (Huber's fibre products (3.2.7), Section 2.5). Let `F` be an abelian torsion sheaf on `(X_U)_et` and F' its preimage on `(X_T)_et`. Then the restriction map `Hⁿ(X_U, F) → Hⁿ(X_T, F')` is bijective for every `n ≥ 0`.

This uses `A⁺/J` henselian along `I/J`; `X` satisfies (a),`(b)` of 3.2.10 or `A^▷` is discrete; `F` torsion.

(Huber (1996), §3.6, Proposition 3.6.1, p. 211; Huber (1996), §3.6, step (IV), p. 213; Huber (1996), §3.6, step (IX), p. 219; Huber (1996), §3.2, Lemma 3.2.5, pp. 178-179.)

For a complete affinoid `A` with `A⁺` henselian along `I = (A^▷)°°·A⁺ ∩ A⁺`, the cohomology of a Zariski-open `W ⊇ (Spa A)_a` equals that of the closed tube over the special fibre; this is the mechanism behind Theorem 3.5.8(ii). The induction is on the Krull dimension of a discrete noetherian ring obtained after henselisation; completeness is not used.

*Needs:* Section 2.5; Section 2.2; Section 2.1; Section 1.5; Section 1.2; Section 1.4; Mathlib HenselianRing.

Let `A` be an affinoid ring with `A⁺` henselian along an ideal `I ⊆ A⁺`, let `W ⊆ Spa A` be a Zariski-open subset containing all analytic points of `Spa A`, and `T :=` {`w ∈ W : |i(w)| < 1` for all `i ∈ I`}. (3.6.2) For every abelian torsion sheaf `F` on `W_et` with preimage F' on the pseudo-adic space `(Spa A, T), Hⁿ(W, F) → Hⁿ(T, F')` is bijective for all `n`. (3.6.3) More generally, for a closed subset `S ⊆ W` (so that `(Spa A, S)` and `(Spa A, S ∩ T)` are pseudo-adic spaces) and a torsion sheaf `F` on `(Spa A, S)_et` with preimage F' on `(Spa A, S ∩ T), Hⁿ(S, F) → Hⁿ(S ∩ T, F')` is bijective for all `n`. (3.6.2) is the case `S = W`.

This uses `A⁺` henselian along `I`; `W` Zariski-open containing `(Spa A)_a`; `S` closed in `W`; `F` torsion.

(Huber (1996), §3.6, Proposition 3.6.1, p. 211.)

Applied to the completed strict henselisation `C` of construction formal-strict-localisation-system-3-5-7 (henselian along its maximal ideal), with `W = Spa(C, C)_a` and `S` the support over `f⁻¹(L)`, it gives construction stalk-formula-closed-point-3-5-8-ii.

*Needs:* Section 4.3; Section 1.2; Mathlib HenselianRing.

In the situation of construction stalks-of-higher-direct-images-lambda (`Y_∞^` of type `(S)`), assume moreover that `F` is a torsion sheaf. Let `z` be the closed point of `Y_∞^` and `F_∞` the preimage of `F'_∞` on `d(Y_∞^, {z}) ⊆ d(Y_∞^, f⁻¹(L))`. Then `(R^nλ_*F)_x̄ ≅ Hⁿ(d(Y_∞^, {z}), F_∞)` for every `n ≥ 0`: only the analytic points specialising to the closed point contribute.

This uses `Y_∞^` of type `(S)`; `F` torsion; The distinction between `F'_∞` on `d(Y_∞^, f⁻¹(L))` and its preimage `F_∞` on `d(Y_∞^, {z})` is the source's.

(Huber (1996), §3.5, Theorem 3.5.8, p. 205; Huber (1996), §3.6, Proposition 3.6.1, p. 211.)

`X = Spf Z_p⟨T⟩, L = |X|, x = (p, T)`: the stalk is the cohomology of the pseudo-adic space `d(Y_∞^, {z})` whose support is the set of points of `Spa` of the completed strict henselisation specialising to `z`; the points specialising only to the generic point of the special fibre do not contribute.

*Needs:* Section 4.3; Section 2.1; Mathlib HenselianLocalRing.

In the situation of construction formal-strict-localisation-system-3-5-7, without assuming that `Y_∞^` is of type `(S)`, let `F` be a torsion sheaf on `d(X, L)_et` and `F_i` its preimage on `d(Y_i^, {z_i}) (z_i = u_i(ȳ))`. Then for every `n ≥ 0: (R^nλ_*F)_x̄ ≅ colim_{i∈I} Hⁿ(d(Y_i^, {z_i}), F_i)`. This is the formula to use when the completed strict localisation is not of type `(S)`; it involves only the type-`(S)` formal schemes `Y_i^ and` no analytic space attached to `Y_∞^`.

This uses `F` torsion; no hypothesis on `Y_∞^`; In the non-noetherian case the ideal of definition of `B` is principal (`J =` sB).

(Huber (1996), §3.5, after 3.5.8, p. 206; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, Proposition 4.1(ii), printed p. 548.)

Without an analytic strict-localization space, retain the filtered cohomology formula of Huber Theorem 3.5.9. For `X = Spf O_K` with `K` complete discretely valued, each `d(Y_i^, {z_i}) = Spa(K_i, O_{K_i})` for the unramified extensions `K_i`, and the formula gives `colim Hⁿ(K_i, M) = Hⁿ(K^nr, M)`.

*Needs:* Section 4.3; Section 4.2; Section 1.5; `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`); Section 1.2.

In the situation of construction formal-strict-localisation-system-3-5-7, let `G` be a torsion sheaf on `(X, L)_et` and `F = λ^*G`. Let `V := Y_∞ − (Y_∞ ×_Y Spec B/J)`, the open complement of `V(J)` in the strict localisation (`V = Spec O^sh_{Y,ȳ}[1/s]` when `J =` sB), and `M` the constant sheaf on `V_et` with value `G_x̄`. Then `(R^nλ_*F)_x̄ ≅ Hⁿ(V, M)` for every `n ≥ 0`. No type-`(S)` hypothesis on `Y_∞^` and no completion appears on the right-hand side; the torsion of `G` may be divisible by the residue characteristic.

This uses `G` torsion (any torsion, including `p`-torsion); No type-`(S)` hypothesis on `Y_∞^`.

(Huber (1996), §3.5, Theorem 3.5.10, p. 206; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §3.3, proof of Theorem 1.4, formula (∗), p. 17; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §1, after Theorem 1.4, p. 3; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §3.3, proof of Theorem 1.4, before formula (∗), p. 17.)

`X = Spf O_K` with `K` complete discretely valued, `x` the closed point, `G = Z/ℓ` with `ℓ ≠ p: V = Spec` of the fraction field of `O_K^sh`, so `(R^nλ_*Z/ℓ)_x̄ = Hⁿ(I_K, Z/ℓ) = Z/ℓ, Z/ℓ(−1)`, 0 for `n = 0`, 1, `≥ 2`. The same `X` with `G = Z/p: (R^1λ_*Z/p)_x̄ = H¹(K^nr_h, Z/p)` is infinite (Artin–Schreier or Kummer theory): the theorem makes no prime-to-`p` restriction. Hansen's formula `(∗)`: for `X = Spf A°` with `A` a reduced affinoid over a complete discretely valued field, `(R^jλ_*Z/ℓ)_x ≅ H^j(Spec O^sh_{X,x}[1/ϖ], Z/ℓ)`.

*Needs:* Section 4.3; Section 4.2; Section 2.5; `SchemeAndStackFoundations`, Layer 2.

Let `X` be a formal scheme of type `(S)`, L' `⊆ L` locally closed subsets of `|X|, i`: (`X`, L') `→ (X, L)` the morphism of pairs given by the identity of `X, d(i): d(X, L') → d(X, L)` the inclusion of supports, `λ = λ_(X,L), λ' = λ_(X,L')` and `E` a torsion ring. Then the base-change morphism of functors `D⁺(d(X, L)_et, E) → D⁺((X, L')_et, E), i^* ∘ R⁺λ_* ⟶ R⁺λ'_* ∘ d(i)^*` (construction pair-specialization-functoriality-3-5-4), is an isomorphism.

This uses `E` a torsion ring; L' `⊆ L` both locally closed.

(Huber (1996), §3.5, Corollary 3.5.11, p. 206; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, Proposition 4.1(ii), printed p. 548.)

The compatibility holds in `D⁺` with torsion coefficients, exactly the scope of 3.5.9.

*Needs:* Section 4.2; Section 4.3; Section 1.1; Mathlib CategoryTheory.GrothendieckTopology.HasEnoughPoints; Mathlib `AlgebraicGeometry.Scheme.isConservativeFamilyOfPoints_pointSmallEtale'`.

In the situation of construction restriction-and-extension-by-zero-3-5-11, assume L' open in `L`, and let `i_`! and `d(i)_!` be the extensions by zero along the open inclusions of supports (construction pair-etale-site, Section 1.2). Then the natural morphism of functors `D⁺(d(X, L')_et, E) → D⁺((X, L)_et, E), i_`! `∘ R⁺λ'_* ⟶ R⁺λ_* ∘ d(i)_!`, is an isomorphism for every torsion ring `E`. The source writes the same morphism `i` (with lower shriek) in (ii), not a separately named open immersion.

This uses `E` a torsion ring; L' open in `L`; `L` locally closed.

(Huber (1996), §3.5, Corollary 3.5.11, p. 206; Scholze, Étale cohomology of diamonds, Remark 19.3, pp. 108-109.)

For `X = Spf Z_p⟨T⟩, L = |X|`, L' `= D(T): i_`! `R⁺λ'_* K ≅ R⁺λ_*(d(i)_! K)`, whose stalks at the closed point `(p, T)` vanish.

*Needs:* Section 4.3; Section 4.2; Section 1.2; Section 1.1.

### 4.4 Completion and henselized generic loci

Let `X` be a scheme, `𝓘 ⊆ O_X` a quasi-coherent ideal of finite type, `Y = V(𝓘)` with closed immersion `i: Y → X, U = X − Y` with open immersion `j: U → X`, and `X^ the` formal completion of `X` along `Y` (the formal scheme of finite ideal type attached to the thickenings `V(𝓘^{n+1})`, `AdicSpacesPartIII`, layer F0 (`colimit-of-thickenings`); affine-locally `Spf` of the `𝓘`-adic completion, Stacks 05GG). Hypothesis (3.5.12), at least one of (both may hold, `e.g`. `X = Spec O_K` with `𝓘 = (ϖ)`): `(α) X` is locally noetherian; or `(β) 𝓘` is locally generated by one element and `X^ is` of type `(S)`. Under `(α), X^ is` locally noetherian, hence of type `(S)`. The completion data consist of: the morphisms of sites `i: Y_et → X_et` and `j: U_et → X_et`; `b: d(X^)_et → Y_et`, the composite of `λ_{X^}` (construction specialization-morphism-of-sites-lambda) with `(X^)_et ≃ (X^_red)_et = (Y_red)_et ≃ Y_et` (construction reduced-special-scheme-equivalence and topological invariance); and a: `d(X^)_et → U_et`, induced by the morphism of locally ringed spaces `σ_{X^}: d(X^) → X` of (1.9.4) (`AdicSpacesPartIII`, layer R2 (`formal-completion-and-algebraic-comparison`)), whose image lies in `U`, via `a⁻¹(Z) := Z ×_X d(X^)` (Huber's fibre product of a scheme locally of finite type over `X` with an adic space over `X`, `AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`)) for `Z` étale over `U`.

This uses `𝓘` of finite type; `(α) X` locally noetherian, or `(β) 𝓘` locally principal and `X^ of` type `(S)` — exactly as in Huber (3.5.12); Without `(α)` or `(β), X^ need` not be of type `(S)` and `d(X^)` is not defined.

(Huber (1996), §3.5, (3.5.12), p. 207; Huber (1996), §1.2, (1.2.7), p. 50; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, printed p. 553; Stacks project, Tag 04DZ (Étale Cohomology, Theorem 59.45.2).)

Provide `FormalScheme.CompletionData`: `(X, 𝓘)` with `𝓘` quasi-coherent of finite type and hypothesis `(α) ∨ (β)` of (3.5.12); `FormalScheme.CompletionData.completion`: `X^ with` its type-`(S)` instance; `FormalScheme.CompletionData.isTypeS_of_isLocallyNoetherian`: Under `(α), X^ is` locally noetherian, hence of type `(S)`; `FormalScheme.CompletionData.sigma_mem_open`: `σ_{X^}(d(X^)) ⊆ U = X − Y`.

Provide `FormalScheme.CompletionData.specialMap`: `b: d(X^)_et → Y_et, λ_{X^}` composed with `(X^)_et ≃ Y_et`; `FormalScheme.CompletionData.genericMap`: a: `d(X^)_et → U_et` with `a⁻¹(Z) = Z ×_X d(X^)`; `FormalScheme.CompletionData.restrict`: For `Z` étale over `X, (Z, 𝓘O_Z)` is again completion data of the same type, `Z^ ∈` Et/`X^,` and a, `b, i, j` restrict compatibly; `FormalScheme.CompletionData.genericMap_goodReduction`: For `X` locally of finite type over `O_K` and `𝓘 = (ϖ)`, a is the restriction of the analytification morphism of sites `X_K^{ad}_et → (X_K)_et` to the good-reduction locus `d(X^)` (`AdicSpacesPartIII`, layer R2 (`good-reduction-locus`)).

**Checks.**

- `X = Spec O_K` (`K` complete discretely valued), `𝓘 = (ϖ): Y = Spec k, U = Spec K, d(X^) = Spa(K, O_K)`, a: `Spa(K)_et → (Spec K)_et` is an equivalence and `b = λ_{Spf O_K}`.
- `𝓘 = O_X` gives `Y = ∅, U = X` and `X^ = ∅`; `𝓘 = 0` with `X` locally noetherian gives `Y = X, U = ∅, X^ = X` with the discrete topology and `d(X^) = ∅`.
- `X = Spec O_C[T] (C = C_p)` with `𝓘 = (p, T): X` is not locally noetherian, `𝓘` is not locally principal, and `X^ = Spf O_C[[T]]` with the `(p,T)`-adic topology is not of type `(S)`; the data are not defined and no comparison is claimed.
- `X = Spec O_C[T], 𝓘 = (p)` (case `(β)`): `X^ = Spf O_C⟨T⟩, d(X^)` is the closed unit disc over `C`, and a is the inclusion of the disc into the analytified affine line composed with the analytification morphism of sites (`AdicSpacesPartIII`, layer R2 (`good-reduction-locus`)).

For `X = Spec O_K` (`K` complete discretely valued) and `𝓘 = (ϖ): Y = Spec k, U = Spec K, X^ = Spf O_K, d(X^) = Spa(K, O_K)`; a is the equivalence between finite étale `K`-algebras seen algebraically and analytically, `b` is `λ` of `Spf O_K`.

*Needs:* Section 4.1; `AdicSpacesPartIII`, layer R2 (`formal-completion-and-algebraic-comparison`); `AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`); `AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`); `AdicSpacesPartII`, layer R0 (`etale-local-structure`); `AdicSpacesPartIII`, layer F0 (`colimit-of-thickenings`); `AdicSpacesPartIII`, layer F0 (`formal-completion`); `SchemeAndStackFoundations`, Layer 2; Mathlib AlgebraicGeometry.IsLocallyNoetherian; Mathlib AlgebraicGeometry.IsClosedImmersion; `AdicSpacesPartII`, layer R1 (`analytification-surjective`).

Let `(X, 𝓘)` be completion data (construction completion-comparison-data-3-5-12). For `Z ∈` Et/`X` let `Z^ ∈` Et/`X^ be` its completion along `Y ×_X Z` and `φ_Z: d(Z^) → Z ×_X d(X^)` the comparison morphism of Huber (1.9.5) (`AdicSpacesPartIII`, layer R2 (`formal-completion-and-algebraic-comparison`)). The `φ_Z` are natural in `Z` and form a natural transformation `φ: b⁻¹ ∘ i⁻¹ ⟶ a⁻¹ ∘ j⁻¹` of functors Et/`X →` Et/`d(X^) (b⁻¹i⁻¹Z = d(Z^), a⁻¹j⁻¹Z = Z ×_X d(X^))`. On sheaves this gives `j_* ∘ a_* ⟶ i_* ∘ b_*` and, by adjunction, for every ring `E` and every sheaf `K` of `E`-modules on `U_et`, the morphism `ψ_K: i^* j_* K ⟶ b_* a^* K`, natural in `K`. Deriving: since `i^*` is exact, `R⁺(i^* ∘ j_*) = i^* ∘ R⁺j_*`, and composing `R⁺ψ` with the canonical `R⁺(b_* ∘ a^*) ⟶ R⁺b_* ∘ a^*` gives the natural transformation (*) `i^* ∘ R⁺j_* ⟶ R⁺b_* ∘ a^*` of functors `D⁺(U_et, E) → D⁺(Y_et, E)`, defined for every ring `E`. It is natural with respect to étale `Z → X` (restriction of completion data) and to isomorphisms of completion data, and on `H⁰` of a sheaf in degree 0 it is `ψ`.

This uses `(X, 𝓘)` completion data; `E` any ring for the construction (torsion only for the isomorphism, construction scheme-completion-comparison-3-5-13).

(Huber (1996), §3.5, Theorem 3.5.13, p. 208; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, before Theorem 5.1, printed p. 553; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, before Theorem 5.1, printed p. 554.)

Provide `FormalScheme.CompletionData.phi`: `φ_Z: d(Z^) → Z ×_X d(X^)`, natural in `Z ∈` Et/`X`; `FormalScheme.CompletionData.comparisonInverseImage`: The natural transformation `b⁻¹i⁻¹ ⟶ a⁻¹j⁻¹` of functors Et/`X →` Et/`d(X^)`; `FormalScheme.CompletionData.psi`: `ψ: i^* ∘ j_* ⟶ b_* ∘ a^*` on sheaves of `E`-modules on `U_et`; `FormalScheme.CompletionData.derivedComparison`: (*): `i^* ∘ R⁺j_* ⟶ R⁺b_* ∘ a^*` on `D⁺(U_et, E)`, for every ring `E`.

Provide `FormalScheme.CompletionData.derivedComparison_H0`: `H⁰` of (*) on a sheaf in degree 0 is `ψ`; `FormalScheme.CompletionData.psi_stalk`: At a geometric point `ȳ` of `Y, ψ_ȳ` is the colimit over `ȳ`-pointed étale neighbourhoods `(Z, u)` of the restriction maps `K(U ×_X Z) → (a^*K)(d(Z^))` along `φ_Z`; `FormalScheme.CompletionData.derivedComparison_natural`: (*) is natural for étale `Z → X` (restriction of completion data), for isomorphisms of completion data (in particular for automorphisms of `X` over a base), and for change of coefficient ring `E →` E'; `FormalScheme.CompletionData.globalComparison`: Applying `R⁺Γ(Y, −)` and the Leray isomorphism `R⁺Γ(Y, R⁺b_*−) ≅ R⁺Γ(d(X^), −)` gives `R⁺Γ(Y, i^*R⁺j_*K) → R⁺Γ(d(X^), a^*K)`.

**Checks.**

- For `X = Spec O_K` with `O_K` a henselian DVR and `𝓘 = (ϖ), ψ` on the sheaf of a `Gal(K^sep/K)`-module `M` is `M^{I_K} → M^{I_{K^}}`, an isomorphism.
- If `𝓘 = O_X (Y = ∅)` both sides are zero; if `U = ∅` both sides are zero.
- For `X = Spec Z_(p), 𝓘 = (p), K = Z/ℓ`: the comparison is with `R⁺Γ(Y, i^*R⁺j_*K)`, not with `R⁺Γ(U, K): H¹(Spec Q, Z/ℓ)` is infinite while `H¹(Spa(Q_p), Z/ℓ)` is finite; a comparison map with target `R⁺Γ(U, −)` cannot be an isomorphism.
- On a sheaf `K` in degree 0, `H⁰` of (*) is `ψ_K: i^*j_*K → b_*a^*K`.

For `X = Spec O_K` (`O_K` a henselian discretely valued ring with completion `O_K^)` and `𝓘 = (ϖ)`: on a sheaf given by a continuous `Gal(K^sep/K)`-module `M, ψ` is `M^{I_K} → M^{I_{K^}}`, an isomorphism because `Gal(K^^sep/K^) ≅ Gal(K^sep/K)` for henselian `K`.

*Needs:* Section 4.4; `AdicSpacesPartIII`, layer R2 (`formal-completion-and-algebraic-comparison`); Section 4.1; Section 1.1; `EnhancedDerivedSheaves`, §§0.1–0.4 (`K`-injective and `K`-flat replacements); Mathlib CategoryTheory.Functor.rightDerivedFunctorPlus; Mathlib CategoryTheory.Functor.sheafPushforwardContinuous; Mathlib CategoryTheory.Functor.sheafAdjunctionContinuous.

Let `(X, 𝓘)` be completion data with `X = Spec A` affine, `J = 𝓘(X)`, and `Z = Spec B` affine étale over `X, Z^h = Spec B^h` for the henselisation `(B^h, J^h)` of the pair (`B`, JB), and `Z^ = Spf B^ (J-adic completion)`. The composite `d(Z^) → Spec B^ − V(JB^) → Spec B^h − V(JB^h) = U ×_X Z^h` induces, for every torsion sheaf `K` on `U_et`, isomorphisms `Hⁿ(U ×_X Z^h, K) ≅ Hⁿ(d(Z^), a^*K), n ≥ 0`. Case `(α): d(Z^) = Spa(B, B)_a` with `B` carrying the JB-adic topology, and the statement is Theorem 3.2.10 for the pro-special subset `Spa(B, B)` and the scheme `Spec B − V(JB)`. Case `(β)` (`J =` sA): `d(Z^) = Spa(B(1/s), C)` with `C` the integral closure of `B` in `B(1/s), U ×_X Z^h` is the spectrum of the henselisation of the affinoid ring `(B(1/s), C)` along `Spa(B(1/s), C)`, and the statement is Theorem 3.2.9.

This uses `K` torsion; `(α)` or `(β)`; Imports: Theorems 3.2.9 and 3.2.10 and the henselisation along pro-special subsets (Layer 2 nodes); the identification of the henselisation along `Spa(B(1/s), C)` with the henselisation of `B` along `J` is Huber's Example 3.1.13.iii.

(Huber (1996), §3.5, proof of 3.5.13, p. 209; Huber (1996), §3.1, Example 3.1.13.iii, p. 171; Huber (1996), §3.2, Theorem 3.2.10, p. 180.)

For `Z = X = Spec O_K` (`O_K` a DVR, not necessarily henselian) and `J = (ϖ): U ×_X Z^h = Spec K^h` (henselisation), `d(Z^) = Spa(K^, O_K^)`, and the lemma is the classical Galois-theoretic fact `Gal(K^sep/K^h) ≅ Gal(K^^sep/K^)`.

*Needs:* Section 4.4; Section 2.5; Section 2.2; Section 2.1; `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`); Mathlib HenselianRing; Mathlib IsAdicComplete.

Let `(X, 𝓘)` be completion data (construction completion-comparison-data-3-5-12): `X` a scheme, `Y = V(𝓘)` for a quasi-coherent ideal `𝓘` of finite type, `U = X − Y, X^ the` completion along `Y`, and either `(α) X` locally noetherian or `(β) 𝓘` locally principal and `X^ of` type `(S)` — exactly as in (3.5.12). Let `E` be a torsion ring. Then the natural transformation (*) `i^* ∘ R⁺j_* ⟶ R⁺b_* ∘ a^*` of construction completion-comparison-map-3-5-13-`i` is an isomorphism of functors `D⁺(U_et, E) → D⁺(Y_et, E)`. The torsion scope is the source's: every torsion ring, with no prime-to-residue-characteristic hypothesis; that narrower restriction belongs to the valuation-base-change theorem (Layer 5), not to this comparison.

This uses `(α)` or `(β)` exactly as (3.5.12); `E` torsion for the isomorphism; the transformation exists for every ring `E`.

(Huber (1996), §3.5, (3.5.12), p. 207; Huber (1996), §3.5, Theorem 3.5.13, p. 208; Huber (1996), §3.5, proof of 3.5.13, p. 209; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, Theorem 5.1, printed p. 554; Vladimir G. Berkovich, Vanishing cycles for formal schemes, Introduction, printed p. 540; Scholze, Étale cohomology of diamonds, §1 (Introduction).)

Both alternatives cover the classical case of a discrete valuation base (locally noetherian) and the nondiscrete rank-one case (principal ideal of definition, `X^ of` type `(S)`). The theorem is stated for arbitrary torsion `E`; the prime-to-residue-characteristic restriction is not part of 3.5.13. `X = Spec O_K, 𝓘 = (ϖ), O_K` henselian DVR: the isomorphism is `M^{I_K} ≅ M^{I_{K^}}` in degree 0 and `Hⁿ(K^sh, M) ≅ Hⁿ(K^^sh, M)` in degree `n` (henselian fields and their completions have the same Galois theory).

*Needs:* Section 4.4; Section 4.1; Section 4.2; `SchemeAndStackFoundations`, Layer 2; Section 2.5; Mathlib CategoryTheory.GrothendieckTopology.HasEnoughPoints; Mathlib `AlgebraicGeometry.Scheme.isConservativeFamilyOfPoints_pointSmallEtale'`; Mathlib AlgebraicGeometry.Scheme.pointSmallEtale.

Let `(X, 𝓘)` be completion data (hypothesis `(α)` or `(β)` of (3.5.12)), `E` a torsion ring and `K ∈ D⁺(U_et, E)`. Then `R⁺Γ(d(X^), a^*K) ≅ R⁺Γ(Y, i^*R⁺j_*K)` naturally in `K`, the isomorphism being the inverse of the global comparison `R⁺Γ(Y, i^*R⁺j_*K) → R⁺Γ(Y, R⁺b_*a^*K) ≅ R⁺Γ(d(X^), a^*K)`. In particular there is a spectral sequence `Hᵖ(Y, i^*R^q j_*K) ⇒ H^{p+q}(d(X^), a^*K)` for arbitrary (not necessarily proper) `X`.

This uses `(α)` or `(β)`; `E` torsion; `K` bounded below.

(Huber (1996), §3.5, Theorem 3.5.13, p. 208; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, Corollary 4.2(iii), printed p. 548; Vladimir G. Berkovich, Vanishing cycles for formal schemes, Introduction, printed p. 540; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, Theorem 5.1, printed p. 554.)

If `X` is proper over a henselian discrete valuation ring `O` with `𝓘 = m_O·O_X` (`Y` the closed fibre), proper base change gives `R⁺Γ(Y, i^*R⁺j_*K) = R⁺Γ(X, R⁺j_*K) = R⁺Γ(U, K)`; so for `X` proper over a complete discrete valuation ring `O_K` the cohomology of the generic fibre `X_K` equals that of the analytic space `d(X^) = (X_K)^ad` (the good-reduction locus is everything for proper `X`). For `X = A^1_{O_C} (C = C_p)` with `𝓘 = (p): R⁺Γ(closed unit disc, Z/ℓ) = R⁺Γ(A^1_{k̄}, Z/ℓ) = Z/ℓ` in degree 0 `(ℓ ≠ p)`, although `X` is not proper.

*Needs:* Section 4.4; Section 4.2; Section 4.1; Section 1.1.

Let `(X, 𝓘)` be completion data, `E` a torsion ring, `K ∈ D⁺(U_et, E)` and `L ⊆ |Y| = |X^|` locally closed. Let K' be the restriction of `a^*K` to the pseudo-adic space `d(X^, L) = (d(X^), λ_{X^}⁻¹(L))` and K'' the restriction of `i^*R⁺j_*K` to `(L_red)_et ≃ (X^, L)_et`. Then `R⁺Γ(d(X^, L), K') ≅ R⁺Γ(L, K'')` naturally in `K`.

This uses `(α)` or `(β)`; `E` torsion; `L` locally closed in `Y`.

(Huber (1996), §3.5, proof of 3.5.16, p. 210; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, Corollary 4.2(iii), printed p. 548.)

`L = |Y|`: this is construction generic-fibre-cohomology-3-5-14. `X = Spec O_C[T] (C = C_p), 𝓘 = (p), L = {T = 0} ⊆ A^1_{k̄}`: the support `d(X^, L) =` (closed disc, `{|T| < 1}`) and, for a prime `ℓ ≠ p, R⁺Γ(d(X^, L), Z/ℓ) = (i^*R⁺j_*Z/ℓ)_{0} = Z/ℓ` in degree 0 (the nearby cycles of the smooth `X` are constant for `ℓ ≠ p`, not for `ℓ = p`).

*Needs:* Section 4.4; Section 4.3; Section 4.2; Section 1.1; Section 1.2.

### 4.5 Microbial valuation bases and trait comparison

Let `A` be a microbial valuation ring (Wedhorn Definition 5.46: `A` has a prime ideal of height one; equivalently `A` with its valuation topology is adic and non-discrete) with fraction field `K` and its valuation topology, `I ⊆ A` a finitely generated ideal of definition (so `I =` sA for a nonzero topologically nilpotent `s`), `η` and `s_0` the generic and closed points of `Spec A`, and `X` a scheme locally of finite type over `A` with fibres `X_η, X_{s_0}`. Let `X^ be` the completion of `X` along `X ×_A Spec A/I`. Then: (1) `X^ is` of type `(S)` and does not depend on the choice of `I`; (2) `(X, I·O_X)` is completion data of type `(β)` (construction completion-comparison-data-3-5-12): `I·O_X` is principal and `X − V(I·O_X) = X_η`, because (0) is the only prime of `A` not containing `s`; (3) `d(Spf A) = Spa(K^, A^)` (Huber 1.9.2(i)), whose points are the valuation rings between `A^ and K^°` (a chain with a unique closed point `c_A`, corresponding to `A^ itself`); (4) `T :=` the preimage of `c_A` under `d(X^) → d(Spf A)` equals `λ_{X^}⁻¹(X_{s_0})`, so `Z := (d(X^), T) = d(X^, X_{s_0})` is a pseudo-adic space (construction pairs-and-pseudo-adic-supports; `X_{s_0}` is closed in `|X^| = |X ×_A Spec A/I|`); (5) `c: Z_et → (X_η)_et` is the restriction to `Z` of the morphism a of the completion data. The base need not be a discrete valuation ring and need not have rank one; if `A` has rank one, `d(Spf A)` is a point and `Z = d(X^)`.

This uses `A` microbial valuation ring with its valuation topology (any rank; not necessarily complete, discrete or noetherian); `I` finitely generated ideal of definition; `X` locally of finite type over `A`.

(Huber (1996), §3.5, Corollary 3.5.16, p. 210; Huber (1996), §3.5, proof of 3.5.16, p. 210; Huber (1996), §1.9, p. 96; T. Wedhorn, Adic spaces, Remark and Definition 5.46; T. Wedhorn, Adic spaces, Remark and Definition 5.46(iii); T. Wedhorn, Adic spaces, Example 7.17; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, opening, printed p. 552.)

Provide `FormalScheme.MicrobialBase`: `(A, I, X): A` a microbial valuation ring with its valuation topology, `I` a finitely generated ideal of definition, `X` a scheme locally of finite type over `A`; `FormalScheme.MicrobialBase.completion_isTypeS`: `X^ (completion along X ×_A Spec A/I)` is of type `(S)`; `FormalScheme.MicrobialBase.completion_indep`: `X^ does` not depend on `I`; `FormalScheme.MicrobialBase.completionData`: `(X, I·O_X)` is completion data of type `(β)` with `U = X_η` and `Y = X ×_A Spec A/I`.

Provide `FormalScheme.MicrobialBase.genericFibre_spf`: `d(Spf A) = Spa(K^, A^)` with points the valuation rings between `A^ and K^°`, and closed point `c_A`; `FormalScheme.MicrobialBase.closedFibreSupport`: `Z = (d(X^), T) = d(X^, X_{s_0})`, a pseudo-adic space; `FormalScheme.MicrobialBase.mem_closedFibreSupport_iff`: `t ∈ T ↔ t` maps to `c_A ↔ λ_{X^}(t) ∈ X_{s_0}`; `FormalScheme.MicrobialBase.closedFibreSupport_eq_of_rankOne`: If `A` has rank one then `Z = d(X^)`.

Provide `FormalScheme.MicrobialBase.genericFibreMap`: `c: Z_et → (X_η)_et`, the restriction of a to `Z`.

**Checks.**

- For `A = O_K` of rank one, `d(Spf A) = Spa(K^, O_K^)` is a point, `T = d(X^)` and `Z = d(X^)`.
- Let `K` be the completion of `Q_p(t)` for the Gauss norm (residue field `F_p(t)`) and `A = {a ∈ O_K : ā ∈ F_p[t]_(t)}`, a microbial valuation ring of rank two. For `X = Spec A, d(X^) = Spa(K, A)` has two points `v_2` (valuation ring `A`) and `v_1` (valuation ring `O_K`); `T = {v_2}`, and `λ(v_1)` is the height-one prime, which lies in `V(I)` but not in `X_{s_0}`.
- For `A = O_C (C = C_p), X = Spec O_C[T]: X^ = Spf O_C⟨T⟩` and `Z` is the closed unit disc over `C`; the construction does not use discreteness of the valuation.
- In the rank-two example, `T = {v_2}` is closed and not open in `d(X^)`, so `Z` is not an open adic subspace: replacing `Z` by an adic space (`e.g`. the interior of `T`) loses the point `v_2`.

For `A` of rank two and `X = Spec A, T = {v_2}` is closed and not open in `d(X^)` (for general `X, T` is closed, and not open as soon as it is nonempty, since the rank-one generisation of a point of `T` maps to the rank-one point of `Spa(K^, A^)`; `T` is empty, hence open, `e.g`. for `X = Spec K`): `Z` is a pseudo-adic space which is not an adic space.

*Needs:* Section 4.4; Section 4.2; `AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`); `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`); Section 1.2; Mathlib ValuationRing; Mathlib AlgebraicGeometry.LocallyOfFiniteType; Tau Ceti Valuation.IsMicrobial.

In the situation of construction microbial-closed-fibre-support (`A` a microbial valuation ring with its valuation topology, `I` a finitely generated ideal of definition, `X` locally of finite type over `A, j: X_η → X, i: X_{s_0} → X, Z = (d(X^), T) = d(X^, X_{s_0}), c: Z → X_η`), for every torsion ring `E` and every `K ∈ D⁺((X_η)_et, E)` there is a natural isomorphism `R⁺Γ(Z, c^*K) ≅ R⁺Γ(X_{s_0}, i^*R⁺j_*K)`. The base need not be a discrete valuation ring, need not be noetherian, and may have any rank; the coefficients may be any torsion ring.

This uses `A` microbial valuation ring (any rank); `E` torsion; `K` bounded below.

(Huber (1996), §3.5, Corollary 3.5.16, p. 210; Huber (1996), §3.5, proof of 3.5.16, p. 210; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, opening, printed p. 552; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, Theorem 5.1, printed p. 554.)

For `A = O_K` complete of rank one and `X` proper over `A: Z = d(X^) = (X_K)^ad` and the statement becomes `R⁺Γ((X_K)^ad, K) ≅ R⁺Γ(X_{s_0}, i^*R⁺j_*K) ≅ R⁺Γ(X_K, K)` by proper base change. For `A` of rank two (construction microbial-closed-fibre-support, test rankTwo), `X = Spec A` and `K = M` a torsion Galois module on `Spec K: Z` is the closed point of `Spa(K, A)` (as a pseudo-adic space) and both sides are `R⁺Γ(Gal(K^sep/K^h), M)` for the henselisation `K^h` of `K` with respect to the rank-two valuation of `A`.

*Needs:* Section 4.5; Section 4.4.

Let `A` be a henselian discrete valuation ring with separably closed residue field (a strictly henselian trait `S = Spec A` with generic point `η` and closed point `s`), `k =` Frac `A, k̄` an algebraic closure, `Ā` the integral closure of `A` in `k̄` (a henselian valuation ring of rank one, not discrete, with residue field purely inseparable over `k(s)`), `S̄ = Spec Ā = {s̄, η̄}, X` locally of finite type over `A, X̄ = X ×_A Ā` with `ī: X_s̄ → X̄` and `j̄: X_η̄ → X̄`. For a torsion ring `E` and `K ∈ D⁺((X_η)_et, E)`, Huber's complex `RΨ_η(K) ∈ D⁺((X_s)_et, E)` of Corollary 3.5.17 is `ī^* R⁺j̄_*(K|_{X_η̄})`, transported to `(X_s)_et` along the universal homeomorphism `X_s̄ → X_s` (topological invariance). With the action of `Gal(k̄/k) = I` (the inertia group, the residue field being separably closed) induced by its action on `X̄` over `X`, this is the object `RΨ_η(K) = (RΨ(K))_η` of `LefschetzPencilsAndVanishingCycles`, layer LPV.0 (SGA 7 XIII 2.1.2.3, `S̄` the normalisation of `S` in `k(η̄)`) in `D⁺(X_s ×_s η, E)`: the nearby-cycle complex. It is not the vanishing-cycle `cone RΦ(K)`, which for `K` on `X` sits in the distinguished triangle `sp^*i^*K → RΨ_η(K_η) → RΦ(K) →` of LPV.0. Huber's statement only uses the underlying complex; the Galois action is added here and is used in construction formal-nearby-cycles-comparison.

This uses `A` strictly henselian DVR; `E` torsion; `K` bounded below; LPV.0 states its theory for coefficients prime to the residue characteristic; the definition `ī^*R⁺j̄_*` uses no such hypothesis, and for torsion divisible by `p` this assertion uses the same formula using the derived functors of Section 1.1 on scheme étale sites.

(Huber (1996), §3.5, Corollary 3.5.17, p. 210; Huber (1996), §3.5, proof of 3.5.17, p. 210; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, opening, printed p. 552; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, printed p. 553.)

`X = S = Spec A, K = E: RΨ_η(E) = E` in degree 0 with trivial action, `RΦ(E) = 0`; 3.5.17 gives `R⁺Γ(Spa(k̄^), E) = E`, consistent with `RΨ` and not with `RΦ`. `X` smooth over `A, K = Z/ℓ` with `ℓ ≠ p: RΨ_η(Z/ℓ) = Z/ℓ` and `RΦ(Z/ℓ) = 0`.

*Needs:* `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.5; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.3; `EtaleCohomologyFoundations`, §`F`.3a; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.2; `LefschetzPencilsAndVanishingCycles`, layer LPV.0; `SchemeAndStackFoundations`, Layer 2.

In the situation of construction huber-vanishing-cycles-are-nearby-cycles, let `π` be a uniformiser of `A, X̄^ the π`-adic completion of `X̄ = X ×_A Ā` along `X_s̄, λ̄: d(X̄^)_et → (X̄^)_et ≃ (X_s̄)_et ≃ (X_s)_et` the specialization morphism (construction specialization-morphism-of-sites-lambda) and `c: d(X̄^)_et → (X_η)_et` the composite of the morphism a of the completion data `(X̄, π·O_X̄)` with `X_η̄ → X_η`. Then: (i) `(X̄, π·O_X̄)` is completion data of type `(β)`, and `d(X̄^) ≅ d(X^) ×_{Spa(k^, A^)} Spa(k̄^, O_{k̄^}) = Ȳ`, the base change of the generic fibre of `X^ to` the completed algebraic closure; (ii) for every torsion ring `E` and `K ∈ D⁺((X_η)_et, E)`, the comparison (*) of construction completion-comparison-map-3-5-13-`i` for `(X̄, π·O_X̄)` is an isomorphism `RΨ_η(K) = ī^*R⁺j̄_*(K|_{X_η̄}) ≅ R⁺λ̄_*(c^*K)` in `D⁺((X_s)_et, E)`; (iii) this isomorphism is `Gal(k̄/k)`-equivariant for the action on `RΨ_η(K)` (construction huber-vanishing-cycles-are-nearby-cycles) and the action on `R⁺λ̄_*(c^*K)` induced by the continuous action of `Gal(k̄/k)` on `k̄^,` hence on `X̄^ and d(X̄^)` over `X^ and d(X^)`; in particular the inertia actions on `R^qΨ_η(K)` and on the formal nearby-cycle sheaves `R^qλ̄_*(c^*K)` agree, and the latter action is continuous.

This uses `A` strictly henselian DVR; `E` any torsion ring; `K` bounded below; `Ā` is neither noetherian nor complete; its completion is `O_{k̄^}`.

(Huber (1996), §3.5, proof of 3.5.17, p. 210; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, Corollary 5.3, printed p. 555; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, before Theorem 5.1, printed p. 554; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, after Corollary 4.2, printed p. 548; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, Lemma 4.3, printed p. 548; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, before Theorem 4.9, printed p. 551.)

`X = A^1_A, K = Z/ℓ (ℓ ≠ p): R⁺λ̄_*(Z/ℓ)` is the constant sheaf `Z/ℓ` on `A^1_{k(s)}` with trivial inertia action, matching `RΨ_η(Z/ℓ) = Z/ℓ` for the smooth `X`. `X = Spec A[x, y]`/(xy `− π`) (the nodal trait family of LPV.0's acceptance tests), `K = Z/ℓ` with `ℓ ≠ p`: at the geometric point `x̄, R^1Ψ_η(Z/ℓ)_x̄ ≅ Z/ℓ(−1)` (`LefschetzPencilsAndVanishingCycles`, layer LPV.2), (ii) identifies it with `(R^1λ̄_*Z/ℓ)_x̄`, the `H¹` of the support over the geometric point in the generic fibre of the completion (an annulus over `k̄^)`, and (iii) makes the two inertia actions agree.

*Needs:* Section 4.5; Section 4.4; Section 4.1; `AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`); `AdicSpacesPartIII`, layer R2 (`generic-fibre-fibre-products`); `AdicSpacesPartIII`, layer R2 (`raynaud-generic-fibre`); `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.5; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.6; `SchemeAndStackFoundations`, Layer 2.

Let `A` be a henselian discrete valuation ring (of rank one) with separably closed residue field, `k` its fraction field with the valuation topology, `k^ its` completion, `k̄^ the` completion of an algebraic closure `k̄, η` and `s` the generic and closed points of `Spec A, X` a scheme locally of finite type over `A, E` a torsion ring, `K ∈ D⁺((X_η)_et, E)`, and `RΨ_η(K) ∈ D⁺((X_s)_et, E)` Huber's 'complex of vanishing cycles of K', `i.e`. the nearby-cycle complex of `LefschetzPencilsAndVanishingCycles`, layer LPV.0 (construction huber-vanishing-cycles-are-nearby-cycles; not `RΦ`). Let `Y` be the rigid analytic variety over `k^ attached` to the completion `X^ of X` along `X_s` (so `r(Y) = d(X^)`, `AdicSpacesPartIII`, layer R2 (`raynaud-generic-fibre`)), `Ȳ := Y ⊗̂_{k^} k̄^,` and `c: Ȳ_et → (X_η)_et` the natural morphism. Then `R⁺Γ(Ȳ, c^*K) ≅ R⁺Γ(X_s, RΨ_η K)`, with `X_s` the closed fibre itself (its residue field is separably closed), and the isomorphism is `Gal(k̄/k)`-equivariant. No properness is assumed.

This uses `A` a henselian DVR with separably closed residue field; `E` torsion (any, including `p`-torsion); `K` bounded below; Rigid and adic étale topoi are identified by Huber's 2.1.4 (`AdicSpacesPartIV`, layer R4 (`etale-site-and-rigid-comparison`)).

(Huber (1996), §3.5, Corollary 3.5.17, p. 210; Huber (1996), §3.5, proof of 3.5.17, p. 210; Huber (1996), §2.1, Proposition 2.1.4, p. 111; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, Corollary 5.3, printed p. 555; Roland Huber, A generalization of formal schemes and rigid analytic varieties, Introduction, printed p. 514.)

`X` proper and smooth over `A, K = Z/ℓ (ℓ ≠ p): RΨ_η(Z/ℓ) = Z/ℓ`, and `Ȳ = (X_{k̄^})^an`, so `Hⁿ(X_{k̄}, Z/ℓ) ≅ Hⁿ(Ȳ, Z/ℓ) ≅ Hⁿ(X_s, Z/ℓ)`: the specialisation isomorphism. `X = A^1_A` (not proper), `K = Z/ℓ, ℓ ≠ p: Ȳ` is the closed unit disc over `k̄^ and` both sides are `Z/ℓ` in degree 0; with `K = Z/p` the theorem still applies (no prime-to-`p` hypothesis), although `RΨ_η(Z/p)` is then in general not the constant sheaf (smooth morphisms are locally acyclic only for torsion prime to `p`). The Galois/inertia action is matched by construction formal-nearby-cycles-comparison (iii), not only the abstract cohomology groups.

*Needs:* Section 4.5; Section 4.4; Section 4.2; `AdicSpacesPartIII`, layer R2 (`raynaud-generic-fibre`); `AdicSpacesPartIII`, layer R2 (`generic-fibre-fibre-products`); `AdicSpacesPartIV`, layer R4 (`etale-site-and-rigid-comparison`); `AdicSpacesPartII`, layer R1 (`rigid-adic-comparison-functor`).

Let `(X, 𝓘)` and `(X′, 𝓘′)` be completion data (construction completion-comparison-data-3-5-12), with `Y = V(𝓘), U = X − Y, Y′ = V(𝓘′), U′ = X′ − Y′`, and let `g: X → X′` be a morphism of schemes with `g⁻¹(Y′) = Y` as sets (equivalently `√(𝓘′O_X) = √𝓘`) and `𝓘′O_X ⊆ 𝓘`. Then `g` restricts to `g_U: U → U′` and `g_Y: Y → Y′`, the completion `ĝ: X^ → X′^ is` adic, and `d(ĝ): d(X^) → d(X′^)` satisfies `a′ ∘ d(ĝ) ≅ g_U ∘ a` and `b′ ∘ d(ĝ) ≅ g_Y ∘ b` as morphisms of sites. For every ring `E` and `K′ ∈ D⁺(U′_et, E)`, the square formed by the canonical base-change morphisms `g_Y^* i′^* R⁺j′_* K′ → i^* R⁺j_* g_U^* K′` and `g_Y^* R⁺b′_* a′^* K′ → R⁺b_* d(ĝ)^* a′^* K′ ≅ R⁺b_* a^* g_U^* K′` and the comparison maps (*) of construction completion-comparison-map-3-5-13-`i` for `(X, 𝓘)` and `(X′, 𝓘′)` commutes, naturally in `K′` and compatibly with composition of such morphisms `g`. The base-change morphisms are not asserted to be isomorphisms; torsion is not needed for the commutativity. The same holds after restricting to supports `L ⊆ Y, L′ ⊆ Y′` with `g_Y(L) ⊆ L′` (construction tube-cohomology-3-5-15), in particular for the microbial bases of construction valuation-ring-base-3-5-16. The hypothesis `g⁻¹(Y′) = Y` is needed: if only `g(Y) ⊆ Y′, g` need not map `U` into `U′` and `ĝ` need not be adic, so neither `g_U` nor `d(ĝ)` exists.

This uses `g: X → X′` with `g⁻¹(Y′) = Y` set-theoretically and `𝓘′O_X ⊆ 𝓘` for the unreduced closed-fibre map; `(X, 𝓘)` and `(X′, 𝓘′)` each satisfy `(α)` or `(β)` of (3.5.12); `E` any ring; `K′` bounded below.

(Huber (1996), §3.5, Theorem 3.5.13, p. 208.)

**Checks.**

- For the identity completion datum, the square is the identity comparison square.
- Two morphisms satisfying ideal containment and radical equality give the comparison square for their composite.
- On `Spec Z_p` with `g=`id, `𝓘=(p²)` and `𝓘′=(p)`, radical equality holds but containment fails: `Spec(Z/p²)` has no map over `Spec Z_p` to `Spec(Z/p)`.

The square uses canonical base-change maps even when those maps are not invertible. The actual comparison map is preserved; an abstract group isomorphism is insufficient.

*Needs:* Section 4.4; Section 4.5; `DiamondsAndVStacks`, layer D0; Section 4.1; `AdicSpacesPartIII`, layer R2 (`formal-completion-and-algebraic-comparison`).

### 4.5a Nearby-cycle and perverse coefficient comparisons

**Comparison with nearby cycles of the adic generic fibre.** Let `X` be a scheme, `Y = V(𝓘)` a closed subscheme defined by a quasi-coherent ideal of finite type, `U = X − Y`, and `X̂` the `𝓘`-adic completion. Assume either `X` is locally noetherian, or `𝓘` is locally principal and `X̂` is of type `(S)`, as in Section 4.4. For a torsion coefficient ring `E` and `K ∈ D⁺(U_et, E)`, the canonical completion comparison `i^* Rj_* K → Rb_* a^* K` is an isomorphism. Here `i` and `j` are the closed and open immersions, a maps the adic generic complement `d(X̂)` to `U`, and `b` is its specialization to `Y`, with the maps and transformation of Section 4.4.

For a strictly henselian rank-one trait `S = Spec A` and `X` locally of finite type over `S`, choose an algebraic closure of Frac `A` and let `Ā` be the integral closure of `A` in it. Complete `X ×_A Ā` along the geometric special fibre. The comparison of Section 4.5 identifies the scheme nearby-cycle complex `RΨK` with `Rλ_* c^*K` on that fibre, where `λ` is formal specialization and `c` is the generic-fibre map. This isomorphism intertwines specialization and every inertia element. For a complex `K′` on `X`, it identifies the specialization triangle and hence its vanishing-cycle `cone` `RΦK′`; the `cone` is a separate object from nearby cycles. Integral and rational comparisons are formed only from the normalized bounded constructible systems with uniform cohomological and `Tor` bounds in the realization domain of `LefschetzPencilsAndVanishingCycles`, §0.8. The torsion completion comparison itself imposes no prime-to-residue-characteristic condition; invertibility is required for the constructible adic realization and perverse assertions below.

*Proof sketch.* Apply Sections 4.4–4.5 to the completion and geometric-trait diagrams. Naturality under their automorphisms identifies the inertia actions, and naturality of the specialization transformation identifies the triangle. Apply the derived adic realization to these coherent finite-level maps and then rationalize. (Huber (1996), §3.5, (3.5.12) and Theorem 3.5.13, pp. 207–209, Corollaries 3.5.16–3.5.17, p. 210; Caraiani–Scholze, §4.6, p. 63.)

*Needs:* Sections 4.4–4.5; `EtaleCohomologyFoundations`, §`F`.3a (general-trait inertia); `LefschetzPencilsAndVanishingCycles`, §§0.5 and 0.8 (scheme nearby cycles and their adic/rational realization).

**Checks.**

- For the node xy `= π` and `Λ = ℤ/ℓ` with `ℓ` invertible on the trait, the algebraic and adic tube calculations identify `R¹ΨΛ` with `Λ(−1)`; the induced vanishing stalk is the same rank-one Tate-twisted stalk.
- The comparison square commutes with each inertia element on the complexes and on every cohomology sheaf, rather than just identifying cohomology dimensions.
- For `X = S` and constant invertible coefficients, both nearby objects are `Λ` in degree zero, specialization is the identity and `RΦΛ = 0`.
- For a smooth family with constant invertible coefficients, the comparison identifies specialization with an isomorphism and carries the zero vanishing-cycle `cone` to zero.

**Coefficients and comparisons.** Let `X` be of finite type over an excellent henselian trait `S`, and let `ℓ` be a prime invertible on `S`. Use finite coefficients `Λ = ℤ/ℓ^ν` with `ν ≥ 1`, normalized constructible `ℤ_ℓ`-systems with uniform cohomological and `Tor` bounds, and their rational `ℚ_ℓ`-realizations. Finite coefficient change uses derived tensor on constructible complexes of finite `Tor` dimension. The finite-level nearby-cycle functor and its integral and rational realizations preserve the support and cosupport bounds of the perverse structures. Integral Verdier duality exchanges the perversities `p` and `p⁺` when torsion is present; rationalization identifies these perversities.

Use the rectified trait dimension function and glued perverse structure of `LefschetzPencilsAndVanishingCycles`, §6.2: the geometric generic fibre carries its middle perversity shifted by one, while the special fibre carries its unshifted middle perversity. Thus `ψ[−1]` and `φ[−1]`, viewed as functors on the total space, have the same conventions at finite, integral and rational level; geometric-fibre `RΨ` itself adds no shift. Compare scheme nearby cycles with the adic generic fibre by the comparison above, and with complex Milnor fibres by `VanishingCycles.nearbyBettiCompatibility` for algebraic complex one-parameter degenerations and §2.8's ordinary-quadratic calculation. These comparisons preserve the dimension shifts, specialization and inertia on those finite-type domains. The adic statement transports the scheme perverse bounds through the comparison, with no perverse structure on arbitrary analytic spaces or diamonds asserted.

*Proof sketch.* Apply the finite-level coefficient change, then the normalized derived adic realization and rational realization. Track support and cosupport through the derived limit. Compare can with its Galois descent and, after exact geometric restriction `U`, compare `Var(σ): U(RΦ) → U(RΨ)` at each finite level, keeping the specialization direction and the integral `p/p⁺` duality. Transport the composition identities with `U(can)` and the pullback/descent conjugation covariance of the family `Var(σ)`. Compare normalized var and `N` only after rationalization on the unipotent part, retaining their Tate twists and equivariance. (Illusie, *Autour du théorème de monodromie locale* (1994), §§4.4–4.6, pp. 47–51.)

*Needs:* Section 4.5a, *Comparison with nearby cycles of the adic generic fibre*; `LefschetzPencilsAndVanishingCycles`, §0.7 (coefficient change), §6.2 (trait perversity and nearby/vanishing exactness), §0.8a (`VanishingCycles.nearbyBettiCompatibility`) and §2.8 (complex Milnor fibres); `EtaleCohomologyFoundations`, §§`F`.4 and `F`.8 (normalized adic realization and field perverse structures).

**Checks.**

- Rationalization removes the integral torsion distinction between `p` and `p⁺` and retains the same fibrewise shift convention.
- The ordinary node and its complex Milnor fibre have matching Tate twists and specialization from the special fibre to the generic fibre.
- On a point, `ℤ_ℓ/ℓ` is `p`-perverse, whereas its integral Verdier dual `(ℤ_ℓ/ℓ)[−1]` is `p⁺`-perverse and is not `p`-perverse; the coefficient comparison retains this distinction.
- For `X` smooth of relative dimension `d` over `S`, the total-space normalization is `Λ_X[d + 1]`, and the corresponding geometric nearby object `Λ_{X_s}[d]` is perverse with no additional fibrewise shift.

### 4.6 Semistable formal schemes and Kummer symbols

Let `K` be a finite extension of `ℚ_p` with uniformizer `ϖ_K`. `A` formal `O_K`-scheme `𝔛` is semistable if Zariski-locally on `𝔛` there is an étale morphism (construction formal-etale-morphism) to `Spf(O_K{X_1,…,X_n}/(X_1⋯X_r − ϖ_K))` for some `1 ≤ r ≤ n` (CDN §2.1.2). For a subfield `F ⊆ K` with uniformizer `ϖ_F, 𝔛` is a semistable base change from `O_F` if `𝔛 ≅ 𝔛′ ×_{Spf O_F} Spf O_K` with `𝔛′` semistable over `O_F` (CDN §2.1.1). Every `𝔛` of either class is Zariski-locally étale over some `Spf(O_K{X_1,…,X_n}/(X_1⋯X_r − ϖ_F))` (`F = K` in the first case); this local class is stable under étale morphisms `𝔘 → 𝔛` and Zariski restriction (as is the semistable class; the global base-change class is not evidently so) and is the one the étale-local BKH arguments use. All these formal schemes are locally noetherian (hence of type `(S)`), flat over `O_K`, with reduced special fibre `𝔛 ⊗ k`. No quasi-compactness is imposed. When `K/F` is ramified, base changes need not be regular (Hyodo's `𝒳 ⊗_{O_K} O_L`), so they are not semistable over `O_K`.

This uses `K/ℚ_p` finite; `F ⊆ K` a subfield (hence also finite over `ℚ_p`); `ϖ_K, ϖ_F` uniformizers.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.2, p. 24; Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, p. 22; Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.2, Préliminaires, p. 27; Osamu Hyodo, A note on p-adic étale cohomology in the semi-stable reduction case, §1, (1.3), printed p. 546.)

Provide `FormalScheme.IsSemistable`: The predicate: a Zariski cover by opens with étale maps to standard charts `Spf(O_K{X_1,…,X_n}/(X_1⋯X_r − ϖ_K))`; `FormalScheme.IsSemistable.of_chart`: `A` Zariski cover with étale maps to standard charts gives IsSemistable; `FormalScheme.IsSemistable.of_etale`: If `𝔘 → 𝔛` is étale and `𝔛` is semistable then `𝔘` is semistable; `FormalScheme.IsLocallyStandardOver`: The local class: Zariski-locally étale over `Spf(O_K{X_1,…,X_n}/(X_1⋯X_r − ϖ_F))` for a fixed subfield `F`; stable under étale maps `(of_etale)` and containing both global classes.

Provide `FormalScheme.IsSemistableBaseChange`: `𝔛 ≅ 𝔛′ ×_{Spf O_F} Spf O_K` with `𝔛′` semistable over `O_F, F ⊆ K`; `FormalScheme.IsSemistable.toBaseChange`: Semistable over `O_K` implies the base-change class with `F = K`; `FormalScheme.IsSemistableBaseChange.isTypeS`: Members are locally noetherian, hence of type `(S)`, so `λ_𝔛` and `d(𝔛)` are defined; `FormalScheme.IsSemistable.completion`: The `ϖ`-adic completion of a scheme étale over `O_K[X_1,…,X_n]/(X_1⋯X_r − ϖ_K)` (CR.5 standard chart) is semistable.

Provide `FormalScheme.standardSemistableChart`: `Spf(O_K{X_1,…,X_n}/(X_1⋯X_r − ϖ_K))` for `1 ≤ r ≤ n`.

**Checks.**

- For `r = 1, O_K{X_1,…,X_n}/(X_1 − ϖ_K) ≅ O_K{X_2,…,X_n}`, so every smooth formal `O_K`-scheme is semistable.
- `Spf(O_K{X,Y}/(XY − ϖ_K))` is semistable, with special fibre `Spec k[X,Y]`/(XY), two lines meeting in one point.
- If `ϖ_F = uϖ_K² (u ∈ O_K^×), Spf(O_K{X,Y}/(XY − ϖ_F))` lies in the base-change class but is not semistable over `O_K`: at the origin of the special fibre the maximal ideal `(ϖ_K, X, Y)` needs three generators in a ring of dimension 2, so it is not regular.
- `Spf(O_K{X}/(X² − ϖ_K))` is in neither class over `O_K`: its special fibre `Spec k[X]/(X²)` is not reduced.

Every construction of the formal BKH chain quantifies over the union of the two classes, as CDN §2.1.1 does. `Spf O_K{X,Y}`/(XY `− ϖ_K`) is semistable; `Spf O_K{X,Y}`/(XY `− ϖ_F`) with `e(K/F) = 2` is in the base-change class only.

*Needs:* Section 4.1; `AdicSpacesPartIII`, layer F0 (`formal-spectrum`); `AdicSpacesPartIII`, layer F0 (`restricted-power-series-adic`); `AdicSpacesPartIII`, layer F0 (`formal-fibre-product`); `AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`).

Let `K` be a finite extension of `ℚ_p, ϖ` a uniformizer and `k` its residue field. Let `𝔛` be a semistable formal `O_K`-scheme, or a base change of such a scheme from the integers of a subfield (construction semistable-formal-scheme), with no quasi-compactness assumption. Import its canonical divisorial log structure `M` from CR.5. On étale formal opens `U, M(U)` consists of sections of `O_𝔛(U)` invertible on `U_K`; its groupification is identified with `O(U_K)×` as in CDN §2.1.1. The reduced special fibre `Y` carries the induced log structure relative to the log point `(k,ℕ→k,1↦0)`. This construction identifies the formal analytic carrier with the imported log carrier; it does not define log schemes again.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, p. 22; Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.2, p. 24.)

The generic-unit identification is sheafwise and compatible with étale formal restriction. The statement permits an infinite union of semistable charts.

*Needs:* `CrystallineCohomology`, layer CR.5, Section CR.5.1; Section 4.1; Section 4.6; `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`).

For `𝔛` as above, `n≥1` and integer `j`, define `R^iΨ_𝔛(ℤ/pⁿ(j))` on `Y_et` as the sheaf associated to `U_0 ↦ H^i_et(U_K,ℤ/pⁿ(j))`, where `U→𝔛` ranges over étale formal schemes. This is the `i`-th derived functor of Berkovich’`s` nearby-cycle functor (denoted `Θ` in his Proposition 4.1). The formal and classical adic realizations are compared using the specialization and completion comparisons of this layer. Equivalently `R^iΨ_𝔛(ℤ/pⁿ(j)) = R^iλ_{𝔛*}(ℤ/pⁿ(j))` on `𝔛_et ≃ Y_et`. They are formed over `K` itself (Berkovich's `Θ`, the generic-to-special nearby-cycle functor; Bloch–Kato's `M^q_n`), not over a geometric generic point, so they are not LPV.0's `RΨ_η`; the vanishing-cycle `cone` is a separate object.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, p. 22; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, Proposition 4.1, printed p. 548.)

Provide `SemistableFormalNearbyCycles`: The derived nearby-cycle sheaves `R^iΨ_𝔛 ℤ/pⁿ(j)` on `Y_et`; `SemistableFormalNearbyCycles.ofGenericCohomology`: Sheafification of generic-fibre cohomology on étale formal opens; `SemistableFormalNearbyCycles.restrict`: Compatible with étale formal restriction and special-fibre restriction; `SemistableFormalNearbyCycles.coefficientMap`: Reduction `ℤ/pⁿ⁺¹(j)→ℤ/pⁿ(j)` induces the corresponding nearby-cycle morphism.

Provide `SemistableFormalNearbyCycles.cup`: `R^aΨ ℤ/pⁿ(j) ⊗ R^bΨ ℤ/pⁿ(l) → R^{a+b}Ψ ℤ/pⁿ(j+l)`; `SemistableFormalNearbyCycles.adicComparison`: The specialization/completion comparison identifies this object with the classical adic realization.

**Checks.**

- For `𝔛 = Spf O_K (Y = Spec k)` the stalk of `R¹Ψℤ/p(1)` at the geometric point of `Y` is `(K^ur)^×/((K^ur)^×)ᵖ` (Kummer theory on the finite unramified `L/K`, whose integers are the étale neighbourhoods), and `R^iΨℤ/pⁿ(j) = 0` for `i ≥ 2 (cd_p K^ur ≤ 1)`.
- Computing on an étale formal `U` before or after restricting gives canonically the same sheaf.
- For the smooth model `𝔛 = Spf O_K{T}, R⁰Ψℤ/p = ℤ/p` but `R¹Ψℤ/p(1) ≠ 0`: the Kummer class `{ϖ}` maps to 1 in `V⁰/U¹ ≅ ℤ`/p. So, unlike the prime-to-`p` case (LPV.0, SGA 7 XIII 2.1.5), the `cone` of `ℤ/p_Y → RΨℤ/p` is not zero for a smooth model.

*Needs:* Section 4.6; Section 4.2; Section 1.4; Section 4.1.

For `n≥1` the Kummer boundary on `U_K` induces a sheaf morphism `i^*M^gp → R¹Ψ ℤ/pⁿ(1)`. Its `q`-fold cup product, `q≥0`, defines `sym_q : i^*(M^gp)^{⊗q} → R^qΨ ℤ/pⁿ(q)`, with tensor power over `ℤ` and `sym_0` the unit. Write {`a_1`,…,`a_q`} for its value. The maps are multiplicative in each unit, compatible with étale restriction and coefficient reduction, and graded commutative in the cohomology factors. This construction gives symbols before the generation theorem.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, p. 22; Spencer Bloch, Kazuya Kato, p-adic étale cohomology, §1, (1.2), printed p. 111.)

Provide `FormalNearbySymbol`: The morphisms `sym_q` for all `n≥1` and `q≥0`; `FormalNearbySymbol.unitBoundary`: The degree-one Kummer boundary of a section of `i^*M^gp`; `FormalNearbySymbol.symbol`: The `q`-fold cup-product symbol; `FormalNearbySymbol.multilinear`: Multiplication in a slot becomes addition of symbols.

Provide `FormalNearbySymbol.restrict`: Symbols commute with étale formal restriction; `FormalNearbySymbol.reduce`: Coefficient reduction sends a `pⁿ⁺¹`-symbol to the corresponding `pⁿ`-symbol; `FormalNearbySymbol.steinberg`: `{a, 1−a} = 0` and `{a, −a} = 0` whenever a and `1−a` are local sections of `i^*M^gp` (invertible on `U_K`); hence `{a, b} = −{b, a}`.

**Checks.**

- `A` symbol with a slot equal to 1 is zero in positive degree.
- At level `p`, a slot which is a `p`-th power gives a zero symbol.
- The empty symbol is the unit in `R⁰Ψℤ/pⁿ`.
- The degree-one boundary commutes with reduction from `p²` to p.

*Needs:* Section 4.6; Section 1.4.

Put `(𝔛₂,M₂)=(𝔛,M)` modulo `p²`. The mod-`p` nearby-cycle symbols used in CDN §2.1.1 factor through `i^*(M₂^gp)^{⊗q}`; the kernel of `i^*M^gp → i^*M₂^gp` is `1+p²O_𝔛`, and a section congruent to 1 modulo `p²` has zero image in the sheaf `R¹Ψℤ/p(1)` (for `p = 2` only after an étale refinement). This supplies the actual domain of the `U/V` filtration, without replacing the whole generic fibre by its special fibre.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, p. 22.)

*Needs:* Section 4.6; `CrystallineCohomology`, layer CR.5, Section CR.5.1.

### 4.7 Bloch–Kato–Hyodo filtrations

**Algebraic BKH under finite ramified base change.** Own `semistable_algebraic_symbol_generation`: let `R` be a henselian DVR with perfect residue field of characteristic `p>0` and fraction field `F` of characteristic zero. Let `T→Spec R` be flat and essentially of finite type, with `T` regular, reduced strict normal-crossings special fibre and smooth generic fibre. Let `K/F` be any finite extension, `R_K` its extended valuation ring, and `X` an étale neighborhood of `T×_R R_K`, allowing Zariski localization. Regularity is required of `T`, not of `X`; ramified extensions, including wild ones, are allowed. For `i:X_s→X` and `j:X_K→X`, the `q`-fold Kummer symbol from generic units generates `i*R^qj*Z/p^N(q)` as an étale sheaf for `q≥0` and `N≥1`. Give the mod-`p U/V` filtration of Section 4.7, using a uniformizer `ϖ_K` of `R_K` and `e_K=v_K(p)`. On `Y=X_s`, with the induced log structure relative to the log point, its zero quotients are `Ω^q_log` and `Ω^{q−1}_log`; for `0<m<pe_K/(p−1)` its positive quotients are `Ω^{q−1}/B^{q−1}` when `p∤m, Ω^{q−1}/Z^{q−1}` when `p|m`, and `Ω^{q−2}/Z^{q−2}` for the uniformizer-ending quotient in both cases. Use the symbol formulas below, the degree-zero and degree-one conventions, and `Uᵐ=0` for integral `m≥pe_K/(p−1)`, including an integral endpoint. Prove compatibility with étale restriction. Preserve the uniformizer, the induced log structure and the distinction between exact and closed forms. These are arithmetic algebraic nearby cycles over `K`, before completion. (Hyodo, *`A` note on `p`-adic étale cohomology in the semi-stable reduction case*, §1, (1.1)–(1.3), pp. 545–546, Theorem 1.6, pp. 547–548, and Corollary 1.7, p. 548; Colmez–Dospinescu–Nizioł, §2.1.1, Theorem 2.4 and its proof, pp. 22–24.)

For the proof start with the smooth case of Bloch–Kato. The log Cartier and log de Rham–Witt restriction sequences of `CrystallineCohomology`, layer CR.5, Section CR.5.1, and layer CR.6, Section CR.6.1 (*Logarithmic de Rham–Witt complexes* and *Log de Rham–Witt model*), give the symbol-to-differential map and its kernels (Hyodo, §2.4–2.6, pp. 552–554). Keep the finite extension `K/F` throughout Hyodo's induction on dimension and cohomological degree. In the projective-line step let `B` be the henselized lower-dimensional semistable chart over `R, B_K=B⊗_R R_K, Y_B=Spec(B_K/ϖ_K), G=Aut(P¹_{B_K})` and `I⊂Z[G]` the augmentation ideal. Prove both inputs of Hyodo (3.2)–(3.3): a power of `I` annihilates the abutment `H^*(P¹_{B_K}[1/p],Z/p)`, whereas any nonzero discrepancy sheaf `N^q_i` forces `I^a H⁰(P¹_{Y_B},M^q_1)≠0` for every a. The latter uses the skyscraper support, the `G`-action and the already computed graded pieces; the spectral sequence and induction would then force nonnilpotent action on the abutment, a contradiction. Nilpotence alone is not a vanishing criterion. At a maximal crossing use the two blow-up charts and the exact differential Čech sequence of Hyodo Lemma 3.5 and (3.6). This proves generation and the kernel formulas on the possibly singular base change. Coefficient reduction and the exact Kummer sequences extend generation from mod `p` to `p`-power coefficients. (Hyodo, §3, (3.1)–(3.6), pp. 554–557.) Formal local algebraization and the comparison of Section 4.4 transport this ramified algebraic theorem to the full formal scope below. The formal mod-`p` computation does not assert the same graded formulas for every `p^N` coefficient.

**Checks.**

- `K=F` recovers the regular semistable theorem, with the original uniformizer and ramification index.
- For `F=Q₂` and `K=Q₂(√2)`, the algebraic chart XY`−2=`XY`−ϖ_K²` and its formal completion are not regular at the node, but their nearby cycles are generated by symbols. Here `e_K=2` and the cutoff is 4. In degree one `U¹/U²=O_Y, U²/U³=O_Y/Z⁰, U³/U⁴=O_Y` and `U⁴=0`; `Vᵐ=U^{m+1}` for `m≥1`. Thus wild base change gives both generation and the graded formulas with `v_K(2)`, rather than the old cutoff 2 over `F`.
- For a chart XY`−uϖ_K^h` with `h=e(K/F)>1`, completion identifies every algebraic `Uᵐ` and `Vᵐ` with its formal counterpart; it retains the singular node and measures the cutoff using `e_K=h v_F(p)`.
- A nonzero trivial `F_p[G]`-module has IM`=0` and nilpotent `I`-action; it fails the nonnilpotence implication required of a nonzero discrepancy in Hyodo (3.3).

*Needs:* Sections 4.1–4.6 for completion comparison and Kummer symbols; `SchemeAndStackFoundations`, Layers 2 and 4, for the scheme étale site, strict localization and the regular semistable model `T`; `CrystallineCohomology`, CR.5.1 and CR.6.1, for the log differential, Cartier and restriction interfaces. The ramified symbol-generation and filtration theorem is a target here.

Define `Semistable.filtrationCutoff p e = ceil(pe/(p−1))`, the natural ceiling of the rational number pe/`(p−1)`; in the application `p` is prime and `e>0` is the absolute ramification index, and it is the first integral level where the filtration is zero. The formula is defined on all natural inputs; primality and `e>0` enter only its cohomological application.

Provide `Semistable.filtrationCutoff_le_iff`: filtrationCutoff `p e ≤ m` iff pe/`(p−1) ≤ m` in `Q`, for every natural `m` (Mathlib `Nat.ceil_le`); `Semistable.filtrationCutoff_two`: the value at `p=2` is 2e, including the arithmetic input `e=0`; and `FormalBKHFiltration.zero_of_cutoff_le`, which applies the ramification theorem to `m≥`filtrationCutoff `p e`.

**Checks.**

- At `p=2,e=0` the arithmetic cutoff is 0, excluding an artificial positive lower bound.
- At `p=2,e=3` the cutoff is 6; replacing `e` by 1 loses ramification information.
- At `p=3,e=1` the threshold is 3/2 and the first zero level is 2, so taking its floor is incorrect.
- At `p=3,e=2` the threshold is integral and the cutoff is 3; the filtration is already zero at level 3, rather than only above it.
- For degree zero the unit symbol generates the constant `Z/p` sheaf and every positive filtration level is zero.

*Needs:* Layers 1–2 and Sections 4.1–4.6; `CrystallineCohomology`, layer CR.5, Section CR.5.1, for the exact log differential and Cartier interfaces; `SchemeAndStackFoundations`, Layers 2 and 4, for strict localization and strict semistable charts; Mathlib's natural ceiling and rational arithmetic.

Fix `q≥0` and put `A=M₂^gp` on the special étale site. Define `U⁰=A^{⊗q}`. For `q=0` put `U^{m+1}=Vᵐ=0` for `m≥0`. For `q=1` put `V⁰=(1+ϖO_𝔛₂)·ϖ^ℤ, Uᵐ=1+ϖ^mO_𝔛₂` for `m≥1`, and `Vᵐ=U^{m+1}` for `m≥1`. For `q≥2`, writing `Uᵐ(A)` for the `q=1` subsheaves (`U⁰(A)=A, Uᵐ(A)=1+ϖ^mO_𝔛₂` for `m≥1`), let `Uᵐ` be the image of `Uᵐ(A)⊗A^{⊗(q−1)}`; let `Vᵐ` be the sum of `U^{m+1}` and the image of `Uᵐ(A)⊗A^{⊗(q−2)}⊗ϖ^ℤ`. Apply `sym_q` to define image subsheaves `Uᵐ,Vᵐ` of `R^qΨℤ/p(q)`, giving …`⊂U²⊂V¹⊂U¹⊂V⁰⊂U⁰`. Tensor powers, sums and images are sheaf operations, not pointwise quotients of presheaves.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, p. 22.)

Provide `FormalBKHFiltration`: The `U/V` filtration on symbol tensors and on their nearby-cycle images; `FormalBKHFiltration.principalUnits`: The subsheaf `1+ϖ^mO_𝔛₂` for `m≥1`; `FormalBKHFiltration.U`: The `m`-th principal-unit image subsheaf; `FormalBKHFiltration.V`: The uniformizer-symbol subsheaf plus `U^{m+1}`, with the `q=1` special convention.

Provide `FormalBKHFiltration.interleaving`: `U^{m+1}⊂Vᵐ⊂Uᵐ`; `FormalBKHFiltration.restrict`: The filtration and image subsheaves commute with étale restriction; `FormalBKHFiltration.graded`: Sheaf quotients `Uᵐ/Vᵐ` and `Vᵐ/U^{m+1}`; `FormalBKHFiltration.symbol_mem_U`: For `m ≥ 1, u ∈ 1+ϖ^mO_𝔛₂` and local sections `a_2`,…,`a_q` of `A`, {`u, a_2`,…,`a_q`} `∈ Uᵐ`, and `Uᵐ` is the subsheaf generated by such symbols.

Provide `FormalBKHFiltration.symbol_mem_V`: For `m ≥ 0` (`u ∈ A` if `m = 0, u ∈ 1+ϖ^mO_𝔛₂` if `m ≥ 1`), {`u, a_2`,…,`a_{q−1}, ϖ`} `∈ Vᵐ`, and `Vᵐ` is generated by these symbols together with `U^{m+1}`.

**Checks.**

- For `q=0` all positive unit levels and all `V`-levels are zero.
- For `q=1` and `m≥1, Vᵐ/U^{m+1}=0` by definition.
- The uniformizer symbol belongs to `V⁰` in degree one.
- `Uᵐ(A) = 1+ϖ^mO_𝔛₂` is nontrivial for every `m <` 2e `= v_K(p²)` and trivial for `m ≥` 2e; since pe/`(p−1) ≤` 2e, every level `0 < m <` pe/`(p−1)` of Theorem 2.4 is visible on the mod-`p²` model, whereas on the mod-`p` model `1+ϖ^mO` would already be trivial for `m ≥ e`.

*Needs:* Section 4.6; Section 1.1.

Import `Ω^q_{Y/k}`, the sheaf of logarithmic `q`-differentials of `(Y, M_Y)` relative to the log point `(k, ℕ→k, 1↦0)` (so dlog `ϖ = 0`), its differential `d, B^q=im(d:Ω^{q−1}→Ω^q), Z^q=ker(d:Ω^q→Ω^{q+1})`, and the additive logarithmic subsheaf `Ω^q_log` generated by wedges of dlog sections of `M_Y` from CR.5. Use `Ωʳ=Bʳ=Zʳ=Ω^r_log=0` for `r<0`. The formal BKH comparison is with sheaf quotients `Ω/B` and `Ω/Z`; `Ω_log` is an additive subsheaf and is not asserted to be an `O_Y`-submodule.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, p. 23.)

*Needs:* `CrystallineCohomology`, layer CR.5, Section CR.5.1; Section 4.6.

Étale locally on `𝔛`, a semistable formal chart is the completion of a semistable `O_K`-scheme `T` (in the base-change case, of a scheme `T` étale over `Spec(O_F[X_1,…,X_n]/(X_1⋯X_r − ϖ_F)) ⊗_{O_F} O_K, i.e`. an étale neighbourhood in Hyodo's `𝒳 ⊗_{O_K} O_L`), with the same reduced special fibre `Y` and the same induced canonical log structure modulo `p²`. The charts may be chosen independently on an infinite covering; no global algebraization or global finite covering is needed.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, proof of Theorem 2.4, p. 23.)

*Needs:* `CrystallineCohomology`, layer CR.5, Section CR.5.1; Section 4.6; Section 4.1; `AdicSpacesPartIII`, layer F0 (`formal-completion`); `SchemeAndStackFoundations`, Layer 2.

On a chart `𝔛=Ť` with `j:T_K→T` and `i:Y→T`, the natural completion morphism `i^*R^qj_*ℤ/p(q) → R^qΨ_𝔛ℤ/p(q)` is an isomorphism. It commutes with Kummer symbols from the common log model modulo `p²`, and with restriction to smaller charts. This is CDN (2.5), using Berkovich 1994 Theorem 5.1; its classical adic realization uses this layer’`s` completion comparison, with transport through the formal/adic and strict-analytic site comparisons of Sections 3.2 and 4.4; their natural site maps carry the Kummer boundary from the common unit to the same class.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, proof of Theorem 2.4, (2.5), p. 23; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, Theorem 5.1, p. 554 (running head; the OCR file labels this block 553).)

*Needs:* Section 4.7; Section 4.6; Section 4.4.

Under the completion comparison on a local algebraized chart, the algebraic principal-unit and uniformizer symbol images `Uᵐ,Vᵐ` are identified with the formal `Uᵐ,Vᵐ` for every `m` and `q`. The identification uses the common mod-`p²` log reduction and thus identifies each associated graded sheaf and its differential-symbol morphism.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, proof of Theorem 2.4, p. 24.)

*Needs:* Section 4.7.

Construct the additive maps `U⁰/V⁰→Ω^q_log` and `V⁰/U¹→Ω^{q−1}_log` using {`a₁`,…,`a_q`}`↦∧dlog(a_i)` and {`a₁`,…,`a_{q−1},ϖ`}`↦∧dlog(a_i)`. They are defined on nearby-cycle image quotients by the algebraic BKH relations transported under completion, not merely on formal symbol tensors.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, proof of Theorem 2.4, p. 23; Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, proof of Theorem 2.4, p. 24.)

Provide `FormalBKHZeroSymbolMaps`: The two zero-level maps on nearby-cycle image quotients; `FormalBKHZeroSymbolMaps.unit`: The map `U⁰/V⁰→Ω^q_log`; `FormalBKHZeroSymbolMaps.uniformizer`: The map `V⁰/U¹→Ω^{q−1}_log`; `FormalBKHZeroSymbolMaps.restrict`: Both maps commute with étale chart restriction.

Provide `FormalBKHZeroSymbolMaps.unit_symbol`: `unit({a₁,…,a_q} mod V⁰) =` dlog `ā₁ ∧` … `∧` dlog `ā_q`; `FormalBKHZeroSymbolMaps.uniformizer_symbol`: `uniformizer({a₁,…,a_{q−1},ϖ} mod U¹) =` dlog `ā₁ ∧` … `∧` dlog `ā_{q−1}`.

**Checks.**

- For `q=0` the empty wedge is the degree-zero unit.
- `A` symbol with a unit 1 maps to zero in positive degree.
- In degree one the uniformizer symbol maps to 1 in `Ω⁰_log`.
- dlog `ϖ = 0` in `Ω¹_{Y/k}` (log differentials relative to the log point), so the first map vanishes on {`a₁`,…,`a_{q−1},ϖ`} `∈ V⁰` as it must; with absolute log differentials of `Y` over (`k`, trivial log structure) dlog `ϖ ≠ 0` and {`a₁`,…,`a_q`} `↦ ∧`dlog `a_i` would not factor through `U⁰/V⁰`.

*Needs:* Section 4.7; `CrystallineCohomology`, layer CR.5, Section CR.5.1.

For `0<m<`pe/`(p−1)`, map the principal-unit generator {`1+ϖᵐ x,a₁`,…} to `x̄∧dlog(a_i)`, and the generator ending in `ϖ` to the corresponding wedge one degree lower. On `Uᵐ/Vᵐ` the target is `Ω^{q−1}/B^{q−1}` if `p∤m` and `Ω^{q−1}/Z^{q−1}` if `p|m`; on `Vᵐ/U^{m+1}` it is `Ω^{q−2}/Z^{q−2}` in both cases. Use the imported algebraic relations to make these maps independent of the symbol presentation and lifts.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, Theorem 2.4(2)–(3), p. 23; Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, Theorem 2.4(2), p. 23.)

Provide `FormalBKHPositiveSymbolMaps`: The two positive-level quotient maps with their `p`-divisibility-specific targets; `FormalBKHPositiveSymbolMaps.principal`: The `Uᵐ/Vᵐ` map on principal-unit generators; `FormalBKHPositiveSymbolMaps.uniformizer`: The `Vᵐ/U^{m+1}` map on uniformizer-ending generators; `FormalBKHPositiveSymbolMaps.liftIndependent`: The maps depend only on the quotient symbol, not on chosen lifts.

Provide `FormalBKHPositiveSymbolMaps.restrict`: Compatibility with étale chart restriction; `FormalBKHPositiveSymbolMaps.principal_symbol`: `principal({1+ϖᵐ x, a₁,…,a_{q−1}}) =` class of `x̄·`dlog `ā₁∧`…`∧`dlog `ā_{q−1}`; `FormalBKHPositiveSymbolMaps.uniformizer_symbol`: `uniformizer({1+ϖᵐ x, a₁,…,a_{q−2}, ϖ}) =` class of `x̄·`dlog `ā₁∧`…`∧`dlog `ā_{q−2}` in `Ω^{q−2}/Z^{q−2}`.

**Checks.**

- `A` principal-unit generator with `x̄=0` maps to zero.
- At `q=1` the second map has zero source and negative-degree target.
- For `q=1, p=2, e=2, m=2` and `y=1`, the symbol `{1+ϖ²}` maps to `1=0` in `O_Y/Z⁰`, since `d(1)=0`. The threshold is 4 and `(1+ϖ)²` agrees with `1+ϖ²` modulo `ϖ³` because `v_K(2)=2`. `A` uniform `B`-denominator would instead send this symbol to the nonzero section 1 of `O_Y/B⁰=O_Y`.

*Needs:* Section 4.7; `CrystallineCohomology`, layer CR.5, Section CR.5.1.

For an étale formal map `𝔘→𝔛`, pulling back `M₂`, nearby cycles and their symbol images carries `Uᵐ,Vᵐ` to the corresponding filtration on `𝔘`. The canonical differential-symbol quotient maps also pull back. This is the locality used to pass from algebraizable charts to a non-quasi-compact semistable model.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, p. 22.)

*Needs:* Section 4.7; Section 4.6; `CrystallineCohomology`, layer CR.5, Section CR.5.1.

For every `q≥0, U⁰/V⁰ ≅ Ω^q_{Y/k,log}` and `V⁰/U¹ ≅ Ω^{q−1}_{Y/k,log}`. The first sends {`a₁`,…,`a_q`} to `∧dlog(a_i)`; the second sends {`a₁`,…,`a_{q−1},ϖ`} to `∧dlog(a_i)`. These are isomorphisms of additive étale sheaves, with negative-degree terms zero. In particular the `q=0` first piece is the constant `ℤ/p` logarithmic degree-zero sheaf.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, Theorem 2.4(1), p. 23; Osamu Hyodo, A note on p-adic étale cohomology in the semi-stable reduction case, §1, Corollary (1.7), printed p. 548.)

*Needs:* Section 4.7; `CrystallineCohomology`, layer CR.5, Section CR.5.1.

Let `e=v_K(p), q≥0` and `m` be an integer with `0<m<`pe/`(p−1)` and `p∤m`. Then `Uᵐ/Vᵐ ≅ Ω^{q−1}_{Y/k}/B^{q−1}_{Y/k}` and `Vᵐ/U^{m+1} ≅ Ω^{q−2}_{Y/k}/Z^{q−2}_{Y/k}`. The first sends {`1+ϖᵐ x,a₁`,…,`a_{q−1}`} to `x̄∧dlog(a_i)`; the second sends {`1+ϖᵐ x,a₁`,…,`a_{q−2},ϖ`} to `x̄∧dlog(a_i)`. Bounds are strict and quotients are additive sheaf quotients.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, Theorem 2.4(2), p. 23; Osamu Hyodo, A note on p-adic étale cohomology in the semi-stable reduction case, §1, Theorem (1.6.3), printed p. 548.)

For `q=1` the second quotient is zero, consistent with `Vᵐ=U^{m+1}`. The first denominator is `B`, not `Z`, when `p∤m`.

*Needs:* Section 4.7; `CrystallineCohomology`, layer CR.5, Section CR.5.1.

For `q≥0` and `0<m<`pe/`(p−1)` with `p|m, Uᵐ/Vᵐ ≅ Ω^{q−1}_{Y/k}/Z^{q−1}_{Y/k}`, and `Vᵐ/U^{m+1} ≅ Ω^{q−2}_{Y/k}/Z^{q−2}_{Y/k}`, via the same principal-unit and uniformizer symbol formulas as in the prime-to-`p` case. The first denominator changes from exact forms `B` to closed forms `Z`.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, Theorem 2.4(3), p. 23; Spencer Bloch, Kazuya Kato, p-adic étale cohomology, §1, Corollary (1.4.1), printed p. 112.)

The formula distinguishes `p|m` from `p∤m` rather than applying a uniform `B`-denominator. For `q=0` both displayed negative-degree quotients vanish.

*Needs:* Section 4.7; `CrystallineCohomology`, layer CR.5, Section CR.5.1.

For integer `m≥`pe/`(p−1), Uᵐ(R^qΨ_𝔛ℤ/p(q))=0` for every `q≥0`, in the étale sheaf sense, as stated in CDN Theorem 2.4(4). At an integral endpoint `m=`pe/`(p−1)`, this is an étale-local assertion, not a claim that every principal unit over the original non-separably-closed residue field is already a `p`-th power. The endpoint is included in the algebraic input: Bloch–Kato (1.4.1)(iv) (`U^mM^q_1 = 0` for `m ≥ e′ =` ep/`(p−1)`) and Hyodo (1.7.4) `(U^{e′}M^q_1 = 0)` are statements about sheaves on `Y_et`.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, Theorem 2.4(4), p. 23; Spencer Bloch, Kazuya Kato, p-adic étale cohomology, §1, (1.2), printed p. 111; Spencer Bloch, Kazuya Kato, p-adic étale cohomology, §1, printed p. 110.)

*Needs:* Section 4.7; `CrystallineCohomology`, layer CR.5, Section CR.5.1.

For `q=0, U⁰ = sym_0(ℤ)` is the constant subsheaf `ℤ/p·1` of `R⁰Ψℤ/p, U⁰/V⁰≅Ω⁰_log=ℤ/p`, and all other `U/V` pieces vanish by the degree-zero definition. The first symbol map sends the empty symbol to 1. This case tests the tensor-zero and negative-degree conventions of the full theorem.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, p. 22.)

*Needs:* Section 4.7.

For `q=1` and positive `m, Vᵐ/U^{m+1}=0`. For `0<m<`pe/`(p−1)` the first quotient `Uᵐ/Vᵐ = Uᵐ/U^{m+1}` is `O_Y/B⁰=O_Y` when `p∤m` and `O_Y/Z⁰` when `p|m`, and it is 0 for `m ≥` pe/`(p−1)` (CDN Remark 2.6(2)), since `B⁰=0` and `Z⁰=ker(d:O_Y→Ω¹)`. At level zero, the uniformizer symbol gives `V⁰/U¹≅Ω⁰_log`. This simultaneously tests the `q=1` filtration convention and the distinction between `B` and `Z`.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, Remarque 2.6(2), p. 24; Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, Remarque 2.6(1), p. 24.)

*Needs:* Section 4.7.

For integer indices, the vanishing theorem says `Uᵐ=0` for `m≥ceil(pe/(p−1))`; the positive graded formulas are used only for integers strictly below pe/`(p−1)`. If the threshold is integral, its endpoint is excluded from both positive formulas and included in the vanishing theorem. This arithmetic restatement preserves the étale-local endpoint convention.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, Theorem 2.4(4), p. 23; Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, Theorem 2.4(2), p. 23.)

*Needs:* Section 4.7.

Two local algebraizations of a semistable formal model induce the same BKH differential-symbol morphisms on their overlap. Both are the canonical map on the common mod-`p²` log symbols; after a common étale refinement their maps agree on generators, hence on the nearby-cycle image quotients. No chosen global algebraization enters the resulting formal theorem.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, proof of Theorem 2.4, p. 23.)

*Needs:* Section 4.7.

The four graded-description and cutoff statements hold on any semistable `𝔛` allowed above, including non-quasi-compact `𝔛`. The isomorphisms are defined by the displayed symbols and logarithmic differential maps, so they agree on pairwise overlaps of any semistable étale chart covering. An isomorphism or vanishing of étale sheaves can be checked locally; no cohomology continuity over an infinite union is used here.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, proof of Theorem 2.4, p. 23; Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.2, p. 24.)

*Needs:* Section 4.7; Section 4.6.

Let `𝔛` be as in semistable-formal-canonical-log-comparison, `e = v_K(p)` and `q ≥ 0`. The symbol map `sym_q: i^*(M₂^gp)^{⊗q} → R^qΨ_𝔛ℤ/p(q)` (formal-symbols-mod-`p`-squared) is an epimorphism of étale sheaves on `Y, i.e`. `U⁰ = R^qΨ_𝔛ℤ/p(q)`. With `m₀ =` ⌈pe/`(p−1)`⌉, the chain `0 = U^{m₀} ⊂ V^{m₀−1} ⊂ U^{m₀−1} ⊂` … `⊂ U¹ ⊂ V⁰ ⊂ U⁰ = R^qΨ_𝔛ℤ/p(q)` is a finite exhaustive filtration whose successive quotients are the sheaves of CDN Theorem 2.4(1)–(3). This is the form in which CDN §2.2 (Étape 2) use Theorem 2.4.

This uses `𝔛` semistable over `O_K` or a semistable base change from the integers of a subfield (semistable-formal-scheme); no quasi-compactness.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.2, Étape 2, p. 28; Osamu Hyodo, A note on p-adic étale cohomology in the semi-stable reduction case, §1, Theorem (1.6.1), printed p. 547; Spencer Bloch, Kazuya Kato, p-adic étale cohomology, §1, Theorem (1.4), printed p. 112.)

`q = 1: R¹Ψℤ/p(1)/U¹` is an extension of `Ω¹_{Y/k,log}` by `F_p` (CDN Remarque 2.6(1)), now with `U⁰ = R¹Ψℤ/p(1)`. `𝔛 = Spf O_K, q = 1`: the stalk `(K^ur)^×/((K^ur)^×)ᵖ` is generated by Kummer classes of units and of `ϖ`.

*Needs:* Section 4.6; Section 4.7.

The semistable nearby-cycle sheaves, Kummer symbols and BKH filtration above use the formal comparison of Section 4.5. These sheaves are formed over `K` itself (Berkovich's `Θ`; Bloch–Kato's `M^q_n`) with `p`-torsion coefficients; no prime-to-`p` or LPV.0 statement is used. The `p`-torsion BKH export is the formal nearby-cycle theorem above and does not assert that LPV.0 already owns `p`-torsion log nearby cycles or that they are the vanishing-cycle `cone`.

(Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.1.1, Theorem 2.4, p. 23; Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld, §2.2, Étape 2, p. 28.)

*Needs:* Section 4.7; Section 4.6.

### Examples

For the semistable trait chart XY`=π`, the special fibre has two branches. At the geometric node, with `Λ=Z/ℓ` and `ℓ` different from the residue characteristic, the generic tube is an annulus: `R⁰ΨΛ=Λ, R¹ΨΛ=Λ(−1)`, and the higher groups vanish. The relation dlog `X+`dlog `Y=`dlog `π` becomes dlog `X+`dlog `Y=0` in relative logarithmic differentials. Replacing the full specialization support by its open tube is a separate restriction and need not preserve its rank-two boundary points. (Huber (1996), Theorem 3.5.13 and Corollary 3.5.17, pp. 208–211; Berkovich, *Vanishing cycles for formal schemes*, Corollary 5.4, p. 555.)

For the `p`-torsion semistable filtration with absolute ramification index `e`, the upper bound is pe/`(p−1)`, not `p/(p−1)`. Thus `p=2,e=3` gives cutoff 6, while `p=3,e=1` gives ceiling 2 of the threshold 3/2. In degree `q=1` the `π`-symbol contributes to `V⁰/U¹` as `Ω⁰_log`, an `F_p`-line; it is not a principal-unit symbol. The principal-unit quotients at a positive index use `Ω⁰/B⁰` when `p∤m` and `Ω⁰/Z⁰` when `p|m`, distinguishing exact from closed differentials. (Hyodo, (1.6)–(1.7), pp. 547–548; Colmez–Dospinescu–Nizioł, §2.1.1, pp. 22–23.)

### Dependencies

Use Layers 1–3 and the type-`(S)` formal scheme, thickening, completion, blow-up and generic-fibre interfaces of `AdicSpacesPartIII`, layers F0 and R2. `SchemeAndStackFoundations`, Layers 0 and 2, supplies scheme henselian and étale comparisons. `LefschetzPencilsAndVanishingCycles`, §§0.2–0.8 and LPV.2, supplies trait nearby and vanishing cycles and the nodal prime-to-residue calculation. Section 4.5a consumes its §6.2 trait perversity and §0.8a nearby-Betti adapter, with `EtaleCohomologyFoundations`, §§`F`.3a, `F`.4 and `F`.8, supplying general-trait inertia, adic realization and field perversity. `CrystallineCohomology`, layer CR.5, Section CR.5.1, supplies logarithmic differentials, Cartier, closed and exact forms, and its layer CR.6, Section CR.6.1 (*Logarithmic de Rham–Witt complexes* and *Log de Rham–Witt model*), the log de Rham–Witt complexes and restriction sequences; the `p`-torsion symbol filtration and its ramification-index cutoff are this layer’`s` additional targets. The nondiscrete `O_C` curve models used in Layer 8 belong to Section 8.2, `SemistableFormalCurveModel` and its compatible-model theorem.

## Layer 5: Nearby cycles over valuation rings

### 5.1 Valuation quadruples and strict localization

`A` valuation-base quadruple `(X, S, η, s)` consists of: a valuation ring `V` (an integral domain whose ideals are totally ordered by inclusion; Mathlib ValuationRing) with fraction field `K` and `S = Spec V`; two points `η, s ∈ S` with `η` a generization of `s, i.e`. `𝔭_η ⊆ 𝔭_s` for the corresponding primes (`s` lies in the closure of `{η}`); and a scheme `X` with a morphism `f: X` -`> S`; subject to the condition that the local ring `O_{S,s} = V_{𝔭_s}` is strictly henselian (henselian local, Mathlib HenselianLocalRing, with separably closed residue field `k(s)`, Mathlib IsSepClosed). The case `η = s` is allowed. Pinned notation: `p_s` is the characteristic exponent of `k(s)`; `k(η) = Frac(V/𝔭_η)`, the residue field of the valuation ring `O_{S,η} = V_{𝔭_η}`; `X_s := X ×_S Spec k(s)` is the fibre (Mathlib `AlgebraicGeometry.Scheme.Hom`.fiber) with its canonical morphism `i: X_s` -`> X`; `X_η := X ×_S Spec k(η)`. The quadruple is locally of finite type (resp. locally of finite presentation) if `f` is. Finite type means quasi-compact and locally of finite type; finite presentation means quasi-compact, quasi-separated and locally of finite presentation. The points of `S` lying between `η` and `s` are the primes `𝔭` with `𝔭_η ⊆ 𝔭 ⊆ 𝔭_s`; they form a chain. Nothing is assumed about the rank of `V` or about discreteness of its value group, and `V` need not be noetherian.

This uses `V` is an arbitrary valuation ring: any rank, any value group; `V` is not assumed noetherian, complete or of finite rank; `O_{S,s}` strictly henselian is a condition on the pair `(V, s)` only; `O_{S,η}` is then a localization of `O_{S,s}` and in general has a residue field `k(η)` that is not separably closed; `η = s` is allowed; `η` need not be the generic point of `S` and `s` need not be the closed point of `S`.

(Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Introduction, p. 1 (arXiv math/0507475v1); Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §2.1, p. 3; David Hansen, Bogdan Zavyalov, Arithmetic properties of ℓ-adic étale cohomology and nearby cycles of rigid-analytic spaces, Appendix A.4, p. 64 (arXiv 2301.01800v2).)

Provide `AlgebraicGeometry.ValuationQuadruple`: The structure bundling `V, 𝔭_η ⊆ 𝔭_s, f: X` -`> Spec V` and the strict henselianity of `V_{𝔭_s}`; `AlgebraicGeometry.ValuationQuadruple.specializes`: `η ⤳ s` in `Spec V, i.e`. `𝔭_η ⊆ 𝔭_s`; `AlgebraicGeometry.ValuationQuadruple.henselianLocalRing_special`: HenselianLocalRing (Localization.AtPrime `𝔭_s`) with separably closed residue field; `AlgebraicGeometry.ValuationQuadruple.valuationRing_localizationAtEta`: `O_{S,η} = V_{𝔭_η}` is a valuation ring of `K`, and `O_{S,s}` -`> O_{S,η}` is a localization.

Provide `AlgebraicGeometry.ValuationQuadruple.specialFiberι`: `i: X_s` -`> X`, the canonical morphism from the fibre over `s`; `AlgebraicGeometry.ValuationQuadruple.localize`: The quadruple `(X ×_S Spec O_{S,s}, Spec O_{S,s}, η, s)` obtained by localizing the base at `s`; its special fibre is `X_s`; `AlgebraicGeometry.ValuationQuadruple.ofEq`: For `η = s`: the quadruple `(X, S, s, s)`; `AlgebraicGeometry.ValuationQuadruple.residueCharExp`: `p_s`, the characteristic exponent of `k(s)`; an integer `n` is 'prime to the residue characteristic' iff it is prime to `p_s`, iff `n` is invertible in `O_{S,s}`.

Provide `AlgebraicGeometry.ValuationQuadruple.baseChange`: For a morphism `h`: S' `= Spec` V' -`> S` of valuation spectra and points `η' ↦ η`, s' `↦ s` with `η' ⤳` s' and `O_{S',s'}` strictly henselian, the quadruple (`X ×_S` S', S', `η'`, s').

**Checks.**

- For a separably closed field `k` and any `k`-scheme `X`, (`X, Spec k`, pt, pt) is a quadruple with `η = s` and `X_s = X`.
- If `V` is a strictly henselian valuation ring with value group `ℤ × ℤ` (lexicographic) and primes `0 ⊊ 𝔭 ⊊ 𝔪`, then `(X, Spec V, η, s)` is a quadruple iff `s = 𝔪`; the three choices `η ∈ {0, 𝔭, 𝔪}` are admissible.
- `(Spec ℤ_(p), Spec ℤ_(p), (0), (p))` is not a quadruple: `ℤ_(p)` is not henselian and its residue field `𝔽_p` is not separably closed; a definition asking only for a valuation ring would accept it.
- For a strictly henselian discrete valuation ring `V` with `η` generic and `s` closed, the quadruple structure on an `S`-scheme `X` is the henselian-trait datum of `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.5 with `s̄ = s`.

For a strictly henselian valuation ring `V` with value group `ℤ × ℤ` (lexicographic) and primes `0 ⊊ 𝔭 ⊊ 𝔪`, the admissible pairs `(η, s)` are exactly `(0, 𝔪), (𝔭, 𝔪)` and `(𝔪, 𝔪)`: for the value group `ℤ × ℤ` (lexicographic) `V/𝔭` is a discrete valuation ring, so the residue field `Frac(V/𝔭)` of `V_𝔭` has Kummer extensions of every prime degree `ℓ ≠` char and is not separably closed; `s = 0` is excluded because `K = V_0` is not separably closed (`x^ℓ − a` with `v(a) =` (1, 0) is irreducible and separable for `ℓ ≠` char, a root having value `(1/ℓ, 0) ∉ ℤ × ℤ`). `A` strictly henselian discrete valuation ring with `η` the generic point and `s` the closed point is a quadruple; this is the trait situation of LefschetzPencilsAndVanishingCycles LPV.0.

*Needs:* Mathlib ValuationRing; Mathlib HenselianLocalRing; Mathlib IsSepClosed; Mathlib IsLocalRing.ResidueField; Mathlib `AlgebraicGeometry.Scheme.Hom`.fiber; Mathlib AlgebraicGeometry.LocallyOfFiniteType; Mathlib AlgebraicGeometry.LocallyOfFinitePresentation.

Let `V` be a valuation ring with fraction field `K, 𝔭 ⊂ V` a prime, `A := V_𝔭` (a valuation ring of `K` with residue field `κ(𝔭)`), and `L` a separable closure of `κ(𝔭)`. Let `A^sh` be the strict henselization of `A` with respect to `κ(𝔭)` -`> L` and `S(𝔭̄) := Spec A^sh`. Then: (a) `A^sh` is a valuation ring, strictly henselian with residue field `L`, and `A` -`> A^sh` induces an isomorphism of value groups `Γ_A ≅ Γ_{A^sh}`; `(b) A^sh` is the localization `(Y^I)_{𝔮 ∩ Y^I}` of the fixed ring `Y^I`, where `Y` is the integral closure of `A` in a separable closure `Kˢ` of `K, 𝔮` a maximal ideal of `Y`, and `D ⊇ I` the decomposition and inertia subgroups of `𝔮` in `Gal(Kˢ/K)`; `(c) D/I ≅ Aut(κ(𝔮)/κ(𝔭)) = Gal(L/κ(𝔭))` (with `L` identified with the separable closure of `κ(𝔭)` in `κ(𝔮)`, the residue field of `A^sh`; `κ(𝔮)` itself is a normal extension of `κ(𝔭)`, an algebraic closure when `𝔭 ≠ 0`, purely inseparable over `L`) acts on `A^sh` by `A`-algebra automorphisms, and this action identifies `Gal(L/κ(𝔭))` with the group of `A`-algebra automorphisms of `A^sh`; `(d)` if `𝔭 = 0` then `A^sh = L` and `S(𝔭̄) = Spec L`; if `A` is already strictly henselian (for instance `𝔭 = 𝔭_s` in a quadruple) then `A^sh = A` and `L = κ(𝔭)`.

This uses `V` is any valuation ring; no rank or discreteness hypothesis; The strict henselization of a local ring at a separable closure of its residue field, with its universal property, is supplied by the scheme-level étale owner (`SchemeAndStackFoundations`, Layer 2).

(Gabber–Ramero, Almost ring theory, §6.2, Lemma 6.2.5, p. 159 (arXiv math/0201175v3); Gabber–Ramero, Almost ring theory, §6.2, proof of Lemma 6.2.5, p. 159; Gabber–Ramero, Almost ring theory, §6.2, (6.2.3), p. 159.)

For `V` a strictly henselian discrete valuation ring and `𝔭 = 0: S(𝔭̄) = Spec Kˢ` and `Gal(L/κ(𝔭)) = Gal(Kˢ/K)`. For `V` of rank 2 with primes `0 ⊊ 𝔭 ⊊ 𝔪` and `V` strictly henselian: `V_𝔭` is a henselian rank-one valuation ring and `(V_𝔭)^sh` is a strictly henselian rank-one valuation ring with value group that of `V_𝔭` (`Γ/Δ` for the value group `Γ` of `V` and its nonzero proper convex subgroup `Δ`), residue field a separable closure of `Frac(V/𝔭)`.

*Needs:* Mathlib ValuationRing; Mathlib ValuationRing.ValueGroup; Mathlib HenselianLocalRing; Mathlib IsSepClosed; Mathlib separableClosure; `SchemeAndStackFoundations`, Layer 2; Mathlib IsSepClosure; Mathlib ValuationSubring.decompositionSubgroup; Mathlib ValuationSubring.inertiaSubgroup.

Let `(X, S, η, s)` and (X', S', `η'`, s') be quadruples (Section 5.1), with chosen separable closures `L` of `k(η)` and L' of `k(η')`. A morphism `φ = (g, h, ι)`: (X', S', `η'`, s', L') -`> (X, S, η, s, L)` consists of a morphism of schemes `h`: S' -`> S` (equivalently a ring map `V` -`>` V') with `h(η') = η` and `h(s') = s`, a morphism `g`: X' -`> X` with `f ∘ g = h ∘` f', and a `k(η)`-embedding `ι: L` -`>` L' extending the residue map `k(η)` -`> k(η')`. By the universal property of strict henselization (Section 5.1), `ι` determines a unique local morphism `h̃`: S'`(η̄')` -`> S(η̄)` over `h` inducing `ι` on residue fields; this is the 'chosen compatible map of strict localizations'. `ι` also determines the continuous homomorphism `φ_`#: `Gal(L'/k(η'))` -`> Gal(L/k(η)), σ' ↦ ι⁻¹ ∘ σ' ∘ ι` (well defined because `ι(L)` is the separable closure of `k(η)` in L', which every `σ'` preserves). `φ` is Cartesian if the square (`g`, f', `f, h`) is Cartesian, `i.e`. X' -`> X ×_S` S' is an isomorphism; `φ` is dominant if the local homomorphism `O_{S,s}` -`> O_{S',s'}` induced by `h` is injective. Composition is componentwise `((g, h, ι) ∘ (g_1, h_1, ι_1) = (g ∘ g_1, h ∘ h_1, ι_1 ∘ ι))` and identities are (id, id, id).

This uses `h(s') = s` makes `O_{S,s}` -`> O_{S',s'}` a local homomorphism of valuation rings; no injectivity, flatness or finiteness of `h` is part of the definition; The embedding `ι` is part of the data: two morphisms with the same `(g, h)` and different `ι` differ by the action of `Gal(L/k(η))` (Section 5.2).

(Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §2.4(b), p. 5; Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Remarque 4.4, p. 13.)

Provide `AlgebraicGeometry.ValuationQuadruple.Hom`: The triple `(g, h, ι)` with `f ∘ g = h ∘` f', `h(η') = η, h(s') = s` and `ι: L` -`>` L' a `k(η)`-embedding; `AlgebraicGeometry.ValuationQuadruple.Hom.id`: The identity morphism (id, id, `id_L`); `AlgebraicGeometry.ValuationQuadruple.Hom.comp`: Componentwise composition; associative, with `id_comp` and `comp_id`; `AlgebraicGeometry.ValuationQuadruple.Hom.strictLocalizationMap`: The unique local morphism `h̃`: S'`(η̄')` -`> S(η̄)` over `h` inducing `ι` on residue fields; `strictLocalizationMap_comp` and `strictLocalizationMap_id`.

Provide `AlgebraicGeometry.ValuationQuadruple.Hom.galoisRestrict`: `φ_`#: `Gal(L'/k(η'))` -`>`* `Gal(L/k(η)), σ' ↦ ι⁻¹σ'ι`, continuous; `galoisRestrict_comp` and `galoisRestrict_id`; `AlgebraicGeometry.ValuationQuadruple.Hom.IsCartesian`: The square (`g`, f', `f, h`) is a pullback square of schemes; `AlgebraicGeometry.ValuationQuadruple.Hom.IsDominant`: The local homomorphism `O_{S,s}` -`> O_{S',s'}` is injective; `AlgebraicGeometry.ValuationQuadruple.Hom.specialFiberMap`: `g_s: X'_{s'}` -`> X_s`, the induced morphism of fibres; for Cartesian `φ, X'_{s'} ≅ X_s ×_{k(s)} k(s')`.

Provide `AlgebraicGeometry.ValuationQuadruple.Hom.ofBaseChange`: For `h`: S' -`> S` and `ι`, the Cartesian morphism from ValuationQuadruple.baseChange.

**Checks.**

- For the identity morphism, `φ_`# is the identity of `Gal(L/k(η))` and `h̃` is the identity of `S(η̄)`.
- For the integral closure V' of a strictly henselian discrete valuation ring `V` in a finite separable K'/`K`, with `ι = id_L, φ_`#: `Gal(L/K')` -`> Gal(L/K)` is the inclusion and its image has index [K' : `K`].
- The inclusion `Spec K` -`> Spec V` (`V` a strictly henselian valuation ring that is not a field, with `K =` Frac `V` separably closed, `e.g`. `V = O_C`, so that the source is a quadruple) does not underlie a morphism of quadruples (`X_K, Spec K`, pt, pt) -`>` (`X, Spec V`, generic, closed): the point pt would have to map to the closed point.
- The morphism ValuationQuadruple.baseChange -`>` original, built from `h`: S' -`> S`, is Cartesian, and every Cartesian morphism with base `h` is isomorphic to it.

For a strictly henselian discrete valuation ring `V`, a finite separable extension K'/`K` and V' the integral closure of `V` in K' (again a strictly henselian discrete valuation ring), (`X ×_V` V', `Spec` V', generic, closed, `L`) -`>` (`X, Spec V`, generic, closed, `L`) with `ι =` id is a Cartesian dominant morphism and `φ_`# is the inclusion of the open subgroup `Gal(L/K') ⊆ Gal(L/K)`.

*Needs:* Section 5.1; Mathlib separableClosure; Mathlib ValuationRing.

### 5.2 Nearby-cycle functors and Galois actions

Let `(X, S, η, s)` be a quadruple (Section 5.1), `L` a separable closure of `k(η), η̄ = Spec L`, and `S(η̄) = Spec (O_{S,η})^sh` the strict localization of `S` at `η̄` (Section 5.1) with its canonical morphism `S(η̄)` -`> S` (which factors through `Spec O_{S,s}`). Put `X_η̃ := X ×_S S(η̄)`, let `j: X_η̃` -`> X` be the projection (an affine morphism) and `i: X_s` -`> X` the special fibre. For a ring `Λ` and `F ∈ D⁺(X_et, Λ)` define `RΨ_L(F) := i^* Rj_* j^* F ∈ D⁺(X_{s,et}, Λ)` and `R^qΨ_L(F) := H^q(RΨ_L(F))`. This is a `Λ`-linear triangulated functor `RΨ_L: D⁺(X_et, Λ)` -`> D⁺(X_{s,et}, Λ)`, and the unit id -`> Rj_* j^*` gives the specialization transformation sp: `i^*` -`> RΨ_L`. Conventions pinned: (i) `j` is the base change of the strict localization `S(η̄)` -`> S`, not of `η̄` -`> S: RΨ_L` is formed with Milnor tubes; the version `RΨ_L^geo(F) := i^* R(jk)_*(jk)^* F` formed with the geometric fibre `k: X_η̄ := X ×_S η̄` -`> X_η̃` receives the natural map `RΨ_L(F)` -`> RΨ_L^geo(F)` from the unit id -`> Rk_*k^*` (Section 5.2); if `η` is the generic point of `S` then `S(η̄) = η̄` and the two agree. (ii) If `η = s` then `S(η̄) = Spec O_{S,s}, j` is a limit of open immersions containing `X_s`, and `RΨ_L = i^*`. (iii) `RΨ_L` is the nearby-cycle object; the `cone` of sp (vanishing cycles `RΦ`) is not part of this assertion. (iv) The derived functors are computed in the Grothendieck abelian category of sheaves of `Λ`-modules on the small étale sites (Mathlib `AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology`), bounded below, and commute with restriction of scalars along ring maps `Λ'` -`> Λ`.

This uses No finiteness assumption on `f`, on `F` or on `Λ` is needed for the definition; theorems about `RΨ_L` carry their own hypotheses (finite type, torsion prime to `p_s`, constructibility); `L` is a choice; dependence on it is controlled by Section 5.2.

(Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §2.3, (2.3.2), p. 4; Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §2.1, p. 3; David Hansen, Bogdan Zavyalov, Arithmetic properties of ℓ-adic étale cohomology and nearby cycles of rigid-analytic spaces, Appendix A.4, Lemma A.4.3, p. 65.)

Provide `AlgebraicGeometry.ValuationQuadruple.nearbyCycles`: `RΨ_L: D⁺(X_et, Λ) ⥤ D⁺(X_{s,et}, Λ)`, a triangulated `Λ`-linear functor; `AlgebraicGeometry.ValuationQuadruple.nearbyCycles_def`: `RΨ_L ≅ i^* ∘ Rj_* ∘ j^*` (by definition); `AlgebraicGeometry.ValuationQuadruple.tube`: `X_η̃ = X ×_S S(η̄)` with `j: X_η̃` -`> X` affine; `AlgebraicGeometry.ValuationQuadruple.specialization`: sp: `i^* ⟶ RΨ_L`, from the unit id `⟶ Rj_* j^*`.

Provide `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesGeo`: `RΨ_L^geo = i^* R(jk)_*(jk)^*` with `k: X_η̄` -`> X_η̃`, and the natural map nearbyCycles `⟶` nearbyCyclesGeo; `AlgebraicGeometry.ValuationQuadruple.nearbyCycles_ofEq`: `η = s ⇒ RΨ_L ≅ i^*`, with sp an isomorphism; `AlgebraicGeometry.ValuationQuadruple.nearbyCycles_generic`: `η` generic `⇒ S(η̄) = η̄` and nearbyCycles `⟶` nearbyCyclesGeo is an isomorphism; `AlgebraicGeometry.ValuationQuadruple.nearbyCycles_stalk`: `(RΨ_L F)_x̄ ≅ RΓ(X_(x̄) ×_S S(η̄), F)` (Section 5.2).

Provide `AlgebraicGeometry.ValuationQuadruple.nearbyCycles_restrictScalars`: For a ring map `Λ'` -`> Λ`, restriction of scalars commutes with `RΨ_L`; `AlgebraicGeometry.ValuationQuadruple.nearbyCycles_trait`: For a strictly henselian DVR base, `RΨ_L` agrees with LPV.0's `RΨ_η` on underlying complexes over `X_s`.

**Checks.**

- If `η = s` then `RΨ_L(F) ≅ i^* F` for all `F ∈ D⁺(X_et, Λ)`; in particular `R^qΨ_L(F) = 0` for `q > 0` when `F` is a sheaf.
- For `X = S` and a ring `Λ, RΨ_L(Λ_S) ≅ Λ` concentrated in degree 0.
- `V` a strictly henselian DVR with uniformizer `π, n` prime to `p_s, X = Spec V[t]/(tⁿ − π): R^0Ψ_L(Λ) ≅ Λⁿ` (one copy per `K`-embedding of `K(π^{1/n})` into `L`) and `R^qΨ_L(Λ) = 0` for `q ≥ 1`.
- For `X = S, V` a strictly henselian DVR, `η` generic and `n ≥ 2` prime to `p_s: i^* R(j_η)_* Z/n` with `j_η: X_η` -`> X` (the non-geometric generic fibre) has `H¹ ≅ Hom_cont(Gal(L/K), Z/n) ≠ 0`, whereas `R^1Ψ_L(Z/n) = 0`; a definition using `X_η` instead of `X_η̃` fails `nearbyCycles_base`.
- For `V` a strictly henselian DVR, `η` generic, `s` closed and a torsion ring `Λ` prime to `p_s, RΨ_L(F)` is isomorphic to the complex on `X_s = X_s̄` underlying LPV.0's `RΨ_η(F|X_η)` (`LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.5, (2.1.2.3)).

For `X = S`, any quadruple and any `Λ: RΨ_L(Λ) = Λ` in degree 0 with trivial Galois action, because the Milnor tube `S_(s̄) ×_S S(η̄) = S(η̄)` is strictly local. For `V` a strictly henselian discrete valuation ring with uniformizer `π, η` generic, `n ≥ 1` prime to `p_s, X = Spec V[t]/(tⁿ − π): X_s` is one point and `R^0Ψ_L(Λ) = Λ^{Hom_K(K(π^{1/n}), L)} ≅ Λⁿ, R^qΨ_L(Λ) = 0` for `q > 0`.

*Needs:* Section 5.1; Mathlib AlgebraicGeometry.Scheme.smallEtaleTopology; Mathlib `AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology`; Mathlib DerivedCategory; Mathlib HasDerivedCategory; Mathlib DerivedCategory.Plus; Mathlib CategoryTheory.Functor.totalRightDerived; `EnhancedDerivedSheaves`, §§0.1–0.4 (`K`-injective and `K`-flat replacements); `SchemeAndStackFoundations`, Layer 2; `EtaleCohomologyFoundations`, §§0.5–0.6; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.5.

In the situation of Section 5.2 put `G_η := Gal(L/k(η))` with its Krull topology. Each `σ ∈ G_η` extends uniquely to an automorphism `σ̃` of `S(η̄)` over `S` inducing `σ` on `L` (Section 5.1 `(c)`), hence to an automorphism `σ̃_X := X ×_S σ̃` of `X_η̃` over `X`, with `j ∘ σ̃_X = j`. Transport of structure along `σ̃_X⁻¹` gives isomorphisms `j^*F ≅ (σ̃_X)_* j^*F` and hence automorphisms `ρ_F(σ)` of `Rj_* j^* F` and of `RΨ_L(F)`, natural in `F ∈ D⁺(X_et, Λ)`, with `ρ(στ) = ρ(σ) ρ(τ)` and `ρ(1) =` id (a left action). The action is continuous: for every `q`, every quasi-compact étale `U` -`> X_s` and every section `a ∈ R^qΨ_L(F)(U)` the stabilizer of a in `G_η` is open; equivalently each stalk `(R^qΨ_L F)_x̄ = H^q(X_(x̄) ×_S S(η̄), F)` is a discrete `G_η`-module, because `S(η̄)` is the limit of the spectra of the local finite étale `O^h_{S,η}`-algebras whose residue fields are the finite separable subextensions of `L/k(η)` and cohomology commutes with this limit. The specialization map sp: `i^*F` -`> RΨ_L(F)` is `G_η`-invariant. If `k(η)` is separably closed (in particular if `η = s`) then `G_η = 1`. If `V` is strictly henselian at `s` and `η` is the generic point, `G_η = Gal(L/K)` is the inertia group of `K`.

This uses `G_η` acts on `RΨ_L(F)` through automorphisms of `X_η̃` over `X`; it does not act on `X_s` (`k(s)` is separably closed).

(Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §1.1, p. 1; Gabber–Ramero, Almost ring theory, §6.2, (6.2.10), p. 160; David Hansen, Bogdan Zavyalov, Arithmetic properties of ℓ-adic étale cohomology and nearby cycles of rigid-analytic spaces, Appendix A.3, Remark A.3.6, p. 62.)

Provide `AlgebraicGeometry.ValuationQuadruple.galoisAction`: `ρ_F: Gal(L/k(η)) →`* `Aut(RΨ_L F)`, natural in `F`; `AlgebraicGeometry.ValuationQuadruple.galoisAction_mul`: `ρ(στ) = ρ(σ) ∘ ρ(τ)`; `AlgebraicGeometry.ValuationQuadruple.galoisAction_one`: `ρ(1) =` id; `AlgebraicGeometry.ValuationQuadruple.galoisAction_natural`: For `u: F ⟶` F', `RΨ_L(u) ∘ ρ_F(σ) = ρ_{F'}(σ) ∘ RΨ_L(u)`.

Provide `AlgebraicGeometry.ValuationQuadruple.isDiscrete_stalk_cohomology`: Each stalk `(R^qΨ_L F)_x̄` is a discrete `Gal(L/k(η))`-module (open stabilizers); `AlgebraicGeometry.ValuationQuadruple.specialization_galoisInvariant`: `ρ(σ) ∘` sp `=` sp; `AlgebraicGeometry.ValuationQuadruple.galoisAction_eq_inertia`: `η` generic and `V` strictly henselian: `Gal(L/K)` is the inertia group: the decomposition and inertia subgroups (Mathlib ValuationSubring.decompositionSubgroup, Mathlib ValuationSubring.inertiaSubgroup) of the unique valuation subring of `L` over `O_{S,s}` are everything (Gabber–Ramero 6.2.10); `AlgebraicGeometry.ValuationQuadruple.galoisAction_trait`: For a strictly henselian DVR, `ρ` is the inertia action of LPV.0 on `RΨ_η`.

**Checks.**

- If `η = s` then `G_η` is trivial and galoisAction is the trivial action.
- In the Kummer example (`V` strictly henselian DVR, `X = Spec V[t]/(tⁿ − π), n` prime to `p_s`), `σ ∈ Gal(L/K)` acts on `R^0Ψ_L(Λ) ≅ Λ^{μ_n}` by translation by `σ(π^{1/n})/π^{1/n} ∈ μ_n`.
- The trivial action is not the Galois action: in the Kummer example with `n ≥ 2` for `Λ≠0` some `σ` acts on `R^0Ψ_L(Λ) ≅ Λⁿ` without fixed basis vectors, so a definition forgetting the transport along `σ̃` fails `galoisAction_kummer`.
- sp: `i^*F` -`> RΨ_L(F)` factors through the `G_η`-invariants in each degree: `ρ(σ) ∘` sp `=` sp for all `σ`.

For `V` a strictly henselian DVR, `π` a uniformizer, `n` prime to `p_s` and `X = Spec V[t]/(tⁿ − π): G_η = Gal(L/K)` acts on `R^0Ψ_L(Λ) ≅ Λ^{Hom_K(K(π^{1/n}), L)}` by permuting the `n` embeddings through the quotient `Gal(K(π^{1/n})/K) ≅ μ_n, i.e`. through the tame character.

*Needs:* Section 5.2; Section 5.1; `EnhancedDerivedSheaves`, §§0.1–0.4 (`K`-injective and `K`-flat replacements); `EtaleCohomologyFoundations`, §§0.5–0.6; `SchemeAndStackFoundations`, Layer 2; Mathlib `continuousSMul_iff_stabilizer_isOpen`; Tau Ceti TauCeti.IsSmoothDiscrete.

Let `(X, S, η, s)` be a quadruple, `L` a separable closure of `k(η), F ∈ D⁺(X_et, Λ)`, and `x̄` a geometric point of `X_s` (with image `x ∈ X_s`). Let `X_(x̄) = Spec O^sh_{X,x̄}` be the strict localization of `X` at `x̄`. Then `X_(x̄)` -`> S` factors through `S_(s) = Spec O_{S,s}` (which is strictly henselian), `X_(x̄) ×_S S(η̄) = X_(x̄) ×_{S_(s)} S(η̄)` is an affine scheme (the Milnor tube at `(x̄, η̄)`), and there is a natural isomorphism `(RΨ_L F)_x̄ ≅ RΓ(X_(x̄) ×_S S(η̄), F)`, in particular `(R^qΨ_L F)_x̄ ≅ H^q(X_(x̄) ×_S S(η̄), F)`, compatible with the Galois actions (`σ` acting through `X_(x̄) ×_S σ̃`) and with the base-change maps (nearby-cycles-base-change-map `(e)`). It is the stalk at the point `(x̄, η̄ ⤳ s̄)` of Deligne's nearby-cycle complex on the vanishing topos `X ×←_S S`. No finiteness assumption on `f`.

This uses `j: X_η̃` -`> X` is affine, hence quasi-compact and quasi-separated; this is what the stalk formula for `Rj_*` needs.

(Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §2.2, (2.2.3), p. 4; Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), §1, p. 2; Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §2.3, p. 4.)

For `X = S: X_(x̄) = S_(s)` and the Milnor tube is `S(η̄)`, a strictly local scheme, so `(RΨ_L Λ)_s̄ = Λ` in degree 0. For `η = s`: the Milnor tube is `X_(x̄)` itself and `(RΨ_L F)_x̄ = F_x̄`.

*Needs:* Section 5.2; Mathlib AlgebraicGeometry.Scheme.pointSmallEtale; Mathlib CategoryTheory.GrothendieckTopology.Point.sheafFiber; Mathlib `AlgebraicGeometry.Scheme.isConservativeFamilyOfPoints_pointSmallEtale'`; `SchemeAndStackFoundations`, Layer 2; `EtaleCohomologyFoundations`, §§0.5–0.6.

Let `φ = (g, h, ι)`: (X', S', `η'`, s', L') -`> (X, S, η, s, L)` be a morphism of quadruples (Section 5.1), `h̃`: S'`(η̄')` -`> S(η̄)` its map of strict localizations, `g̃ := g ×_h h̃: X'_η̃'` -`> X_η̃` and `g_s: X'_{s'}` -`> X_s`. For `F ∈ D⁺(X_et, Λ)` the base-change map `c_φ(F): g_s^* RΨ_L(F)` -`> RΨ_{L'}(g^* F)` is the composite `g_s^* i^* Rj_* j^*F ≅ i'^* g^* Rj_* j^*F` -`> i'^* Rj'_* g̃^* j^*F ≅ i'^* Rj'_* j'^* g^*F`, where the middle arrow is `i'^*` applied to the base-change morphism `g^* Rj_*` -`> Rj'_* g̃^*`, adjoint to `j'^* g^* Rj_* ≅ g̃^* j^* Rj_*` -`> g̃^*` (counit of `j^* ⊣ Rj_*`), and the outer isomorphisms are the equalities `i ∘ g_s = g ∘` i' and `j ∘ g̃ = g ∘` j'. Properties: (a) naturality in `F`; `(b)` equivariance: `c_φ ∘ g_s^* ρ_F(φ_#(σ')) = ρ'_{g^*F}(σ') ∘ c_φ` for `σ' ∈ Gal(L'/k(η'))` (Section 5.2); `(c) c_id =` id and `c_{φ ∘ ψ} = c_ψ ∘ ψ_s^* c_φ`; `(d)` compatibility with specialization: `c_φ ∘ g_s^*` sp `=` sp' (under `i'^* g^* ≅ g_s^* i^*`); `(e)` on stalks at a geometric point `x̄'` of `X'_{s'}` with image `x̄` it is the restriction map `RΓ(X_(x̄) ×_S S(η̄), F)` -`> RΓ(X'_(x̄') ×_{S'} S'(η̄'), g^*F)` along `X'_(x̄') ×_{S'}` S'`(η̄')` -`> X_(x̄) ×_S S(η̄)`. When `c_φ` is an isomorphism is the content of Section 5.4; for non-Cartesian `φ` it is in general not an isomorphism.

This uses `φ` arbitrary; no Cartesian, dominance or torsion hypothesis is needed to construct `c_φ`.

(Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §2.4(b), p. 5; Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Théorème 1.1, (1.1.a), p. 2.)

Provide `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange`: `c_φ: g_s^* ∘ RΨ_L ⟶ RΨ_{L'} ∘ g^*`, a natural transformation of functors on `D⁺(X_et, Λ)`; `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_id`: `c_id =` id; `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_comp`: `c_{φ∘ψ} = c_ψ ∘ ψ_s^* c_φ`; `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_equivariant`: Equivariance along `φ_`#.

Provide `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_specialization`: `c_φ ∘ g_s^*` sp `=` sp'; `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_stalk`: On stalks, `c_φ` is restriction along the map of Milnor tubes `X'_(x̄') ×_{S'}` S'`(η̄')` -`> X_(x̄) ×_S S(η̄)`; `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_isIso`: Is an isomorphism for Cartesian dominant `φ` and torsion prime to `p_s` (valuative-base-change-for-nearby-cycles).

**Checks.**

- `c_id(F)` is the identity of `RΨ_L(F)`.
- For the localization morphism at `s, c_φ(F)` is an isomorphism for every `F ∈ D⁺(X_et, Λ)`.
- For `V` a strictly henselian DVR, `n ≥ 2` prime to `p_s, X = S` and X' `= Spec V[t]/(tⁿ − π)` with `g` the structure map and `h =` id: `c_φ(Λ): Λ` -`> Λⁿ` is the diagonal; for `Λ≠0` it is not an isomorphism.
- `c_φ` intertwines `ρ(φ_# σ')` and `ρ'(σ')` for every `σ' ∈ Gal(L'/k(η'))`.

For the localization morphism `(X ×_S Spec O_{S,s}, Spec O_{S,s}, η, s)` -`> (X, S, η, s)` (Cartesian, dominant) `c_φ` is an isomorphism (nearby-cycles-equivariant-transport `(b)`).

*Needs:* Section 5.1; Section 5.2; `SchemeAndStackFoundations`, Layer 2; `EnhancedDerivedSheaves`, §§0.1–0.4 (`K`-injective and `K`-flat replacements).

Let `(X, S, η, s)` be a quadruple. (a) For separable closures `L_1, L_2` of `k(η)` and a `k(η)`-isomorphism `τ: L_1` -`> L_2`, the morphism of quadruples `φ_τ := (id_X, id_S, τ): (X, S, η, s, L_2)` -`> (X, S, η, s, L_1)` has an isomorphism as base-change map, `c_τ: RΨ_{L_1}(F) ≅ RΨ_{L_2}(F)`, natural in `F ∈ D⁺(X_et, Λ)`, with `c_τ ∘ ρ_1(σ) = ρ_2(τ σ τ⁻¹) ∘ c_τ` for `σ ∈ Gal(L_1/k(η))`; for `σ_0 ∈ Gal(L_1/k(η)), c_{τ ∘ σ_0} = c_τ ∘ ρ_1(σ_0)`. Thus the pair `(RΨ_L(F), ρ)` is independent of `L` up to an isomorphism that is unique modulo the Galois action. `(b)` Localization: for `S_(s) := Spec O_{S,s}` and `X_(s) := X ×_S S_(s)`, the Cartesian dominant morphism `(X_(s), S_(s), η, s, L)` -`> (X, S, η, s, L)` has an isomorphism as base-change map `RΨ_L(F) ≅ RΨ_L(F|X_(s))` (the special fibres coincide), compatible with Galois actions; so every statement about `RΨ_L` may be proved after replacing `S` by the spectrum of the strictly henselian valuation ring `O_{S,s}`, in which `s` is the closed point.

This uses No finiteness or torsion hypothesis.

(Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §2.1, p. 3; Gabber–Ramero, Almost ring theory, §6.2, (6.2.3), p. 159.)

For a strictly henselian discrete valuation ring with `η` generic, any two choices of `L` give `Gal(L/K)`-equivariantly isomorphic `RΨ_L(F)`, the isomorphism being unique up to the action of `Gal(L/K)`.

*Needs:* Section 5.2; Section 5.1; `EtaleCohomologyFoundations`, §§0.5–0.6.

Let `(X, S, η, s)` be a quadruple and `Λ` a ring. (a) Étale locality: for an étale morphism `u: U` -`> X`, with `(U, S, η, s)` the induced quadruple, the base-change map of the morphism `(u, id_S, id_L)` is an isomorphism `u_s^* RΨ_L(F) ≅ RΨ_L(u^* F)` for all `F ∈ D⁺(X_et, Λ)`, compatible with Galois actions. `(b)` Proper push-forward: if `Λ` is a torsion ring and `h: X` -`> Y` is a proper `S`-morphism (so `(Y, S, η, s)` is a quadruple), there is a natural `G_η`-equivariant isomorphism `RΨ_L^Y(Rh_* F) ≅ Rh_{s*} RΨ_L^X(F)` for `F ∈ D⁺(X_et, Λ)`. `(c)` Projective reduction: let `X` be affine of finite type over `S, z: X` -`> A^N_S` a closed immersion and `w: A^N_S` -`> P^N_S` the standard open immersion, `e := w ∘ z`. For `F ∈ D⁺(X_et, Λ)` with `Λ` torsion, `RΨ_L^X(F) ≅ z_s^* w_s^* RΨ_L^{P^N}(w_! z_* F)` (the restriction to `X_s` of the nearby cycles of the extension by zero), compatibly with Galois actions and with the base-change maps of Cartesian morphisms of quadruples. Consequently, for a class of pairs `(X, F)` stable under these operations, constructibility of the `R^qΨ_L` and bijectivity of the base-change maps for `(P^N_S, G)` with `G ∈ D⁺(P^N_{S,et}, Λ)` imply the same for `(X, F)`; and every quadruple of finite type is covered by affine opens of finite type to which (a) applies.

This uses `(b)` and `(c)` need `Λ` torsion (proper base change). (a) holds for every `Λ`; Extension by zero along `w` changes `RΨ` at the boundary `P^N_s` \ `A^N_s`; only the restriction to `A^N_s` is used in `(c)`.

(Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §1.1(a)(i), (1.1.4), p. 2; Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §4.1(b), p. 8; Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Lemme 8.1.1 and following remark, p. 19.)

For `V` a strictly henselian DVR and `h`: X' `= Spec V[t]/(tⁿ − π)` -`> X = S` finite (hence proper), `(b)` gives `RΨ_L(h_* Λ) ≅ h_{s*} RΨ_L(Λ) ≅ Λⁿ`, consistent with the Kummer computation of Section 5.2.

*Needs:* Section 5.2; Mathlib AlgebraicGeometry.IsProper; Mathlib AlgebraicGeometry.IsClosedImmersion; Mathlib AlgebraicGeometry.IsOpenImmersion; Mathlib AlgebraicGeometry.LocallyOfFiniteType; `SchemeAndStackFoundations`, Layer 2; `EtaleCohomologyFoundations`, §§0.5–0.6.

Let `(X, S, η, s)` be a quadruple with `S = Spec V, K =` Frac `V`, K'/`K` a purely inseparable algebraic extension, V' the integral closure of `V` in K' and S' `= Spec` V'. Then: (i) V' is a valuation ring, the unique extension of `V` to K' (the valuation extends uniquely); (ii) `h`: S' -`> S` is integral, universally injective and surjective (a universal homeomorphism), so there are unique `η'`, s' `∈` S' over `η, s, η' ⤳` s', and `O_{S',s'}` is strictly henselian (its residue field is purely inseparable over the separably closed `k(s)`); (iii) with L' :`=` the separable closure of `k(η')` in an algebraic closure containing `L`, restriction `Gal(L'/k(η'))` -`> Gal(L/k(η))` is an isomorphism, `ι: L` -`>` L' the inclusion, and the Cartesian dominant morphism `φ`: (X', S', `η'`, s', L') -`> (X, S, η, s, L)`, X' `= X ×_S` S', has maps `g`: X' -`> X, g_s: X'_{s'}` -`> X_s, g̃: X'_η̃'` -`> X_η̃` that are universal homeomorphisms; (iv) the base-change map `c_φ(F): g_s^* RΨ_L(F)` -`> RΨ_{L'}(g^* F)` is an isomorphism for every `F ∈ D⁺(X_et, Λ)` and every ring `Λ`, equivariant along the isomorphism of Galois groups, and `g^*, g_s^*` are equivalences of étale sites. Consequently, in positive characteristic `RΨ_L` may be computed after replacing `V` by its integral closure in the perfect closure of `K`.

This uses No torsion hypothesis: topological invariance holds for all sheaves.

(Stacks project, Tag 04DY (Étale Cohomology, Section 59.45); Stacks project, Tag 04DZ (Étale Cohomology, Theorem 59.45.2); Gabber–Ramero, Almost ring theory, §6.1, Example 6.1.4(ii), p. 152.)

For `V = 𝔽_p[[t]]^sh` (a strictly henselian DVR of characteristic `p`) and K' `= K(t^{1/p})`, V' `= V[t^{1/p}]`: nearby cycles of `X ×_V` V' over V' equal those of `X` over `V`.

*Needs:* Section 5.2; Section 5.1; Mathlib AlgebraicGeometry.IsIntegralHom; Mathlib AlgebraicGeometry.UniversallyInjective; Mathlib AlgebraicGeometry.Surjective; `SchemeAndStackFoundations`, Layer 2.

Let `(X, S, η, s)` be a quadruple with `f` quasi-compact and quasi-separated, and `(F_a)` a filtered system of sheaves of `Λ`-modules on `X_et`. Then for every `q` the natural map `colim_a R^qΨ_L(F_a)` -`> R^qΨ_L(colim_a F_a)` is an isomorphism, compatibly with Galois actions and with base-change maps of morphisms of quadruples. If moreover `n ∈ ℤ_{≥1}` and `X` is of finite presentation over `S`, every sheaf of `ℤ/n`-modules on `X_et` is a filtered colimit of constructible sheaves mapping to it; these maps need not be monomorphisms, and a sheaf of abelian groups whose local sections are killed by integers prime to `p_s` is the filtered colimit of its `n`-torsion subsheaves over `n` prime to `p_s`. Hence a statement `'c_φ(F)` is an isomorphism for all F' (or `'R^qΨ_L(F)` vanishes for `q >` m') holds for all torsion `F` prime to `p_s` once it holds for constructible sheaves of `ℤ/n`-modules with `n` prime to `p_s`, and extends from sheaves to `D⁺` by truncation (`R^qΨ_L(F)` depends only on `τ_{≤q} F`).

This uses The Milnor tubes `X_(x̄) ×_S S(η̄)` are affine for every `f` (milnor-tube-stalk-formula); `f` qcqs makes `X` qcqs for the colimit presentation; the colimit reduction to constructible sheaves uses `f` of finite presentation (constructible `=` finitely presented sheaves on a qcqs scheme). (Stacks project, Lemma 59.73.2, Tag 03SA; Lemma 18.30.7, Tag 093C.)

(Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §2.5, p. 6; Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), §7.1, p. 17.)

The constant sheaf `ℤ/ℓ^∞ := colim_m ℤ/ℓᵐ (ℓ ≠ p_s)` has `R^qΨ_L(ℤ/ℓ^∞) = colim_m R^qΨ_L(ℤ/ℓᵐ)`.

`A` negative control for the colimit presentation is `X=Spec V`, with `V` strictly henselian and its closed point `s` not constructible, and `i:s→X`. Such valuation rings occur with infinite-rank value group `⊕_{j≥0}ℚ` in lexicographic order: the maximal ideal is not the radical of any finitely generated ideal. For a prime `ℓ` invertible in `V, i_*ℤ/ℓ` has support `{s}` and is not constructible. Its only subobjects are zero and itself, so it is not a union of constructible subsheaves. It is still a filtered colimit of constructible sheaves with possibly noninjective structure maps.

*Needs:* Section 5.2; `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`); Mathlib `AlgebraicGeometry.Scheme.isConservativeFamilyOfPoints_pointSmallEtale'`; Mathlib AlgebraicGeometry.LocallyOfFinitePresentation; `SchemeAndStackFoundations`, Layer 2.

Let `(X, S, η, s)` be a quadruple of finite type, `L` a separable closure of `k(η), η̄ = Spec L` the closed point of `S(η̄), k: X_η̄ = X ×_S η̄` -`> X_η̃` the closed fibre of `X_η̃` -`> S(η̄), n ≥ 1` an integer invertible in `k(s)` and `Λ` a ring with `nΛ = 0`. Then for every `F ∈ D⁺(X_et, Λ)` the natural map `RΨ_L(F) = i^* Rj_* j^* F` -`> i^* R(jk)_*(jk)^* F = RΨ_L^geo(F)` (induced by the unit id -`> Rk_* k^*`) is a `Gal(L/k(η))`-equivariant isomorphism. Equivalently, for every geometric point `x̄` of `X_s`, restriction from the Milnor tube to the Milnor fibre `RΓ(X_(x̄) ×_S S(η̄), F)` -`> RΓ(X_(x̄) ×_S η̄, F)` is an isomorphism. If `η` is the generic point of `S` then `k =` id; if `η = s` both sides are `F_x̄`. Nothing is asserted when `p_s` divides `n`.

This uses `f` locally of finite type; `n` invertible in `k(s)` (hence in `O_{S,s}` and in every `k(t)` for `t` between `η` and `s`); The comparison is needed only when `η` is neither the generic point nor `s, i.e`. when `V_{𝔭_s}` has rank `≥ 2`.

(Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Théorème 5.1, p. 14; Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Remarque 4.4, p. 13; Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §2.1, p. 3.)

`X = S`: both sides are `Λ` in degree 0 (`S(η̄)` and `η̄` are strictly local). `η` the generic point: `S(η̄) = η̄` and the map is the identity. `V` strictly henselian of rank 2 with primes `0 ⊊ 𝔭 ⊊ 𝔪` and `η = 𝔭` (the higher-rank regression case): the theorem identifies `RΨ_L`, formed with the tube over the strictly henselian rank-one valuation ring `(V_𝔭)^sh`, with cohomology of the fibres over the point `η̄`.

*Needs:* Section 5.2; `SchemeAndStackFoundations`, Layer 2; `EtaleCohomologyFoundations`, §§0.5–0.6.

### 5.3 Amplitude, tame quotients and Gauss extensions

Let `(X, S, η, s)` be a quadruple with `f` locally of finite type and `N :=` dim `X_η` finite (`RΨ_L = 0` if `X_η = ∅`), and `n ≥ 1` invertible in `k(s)`. Then `R^qΨ_L(F) = 0` for every `q >` 2N and every sheaf `F` of `ℤ/n`-modules on `X_et` (and every sheaf of `Λ`-modules for a ring `Λ` with `nΛ = 0`); consequently `RΨ_L` maps `D^b(X_et, Λ)` to `D^b(X_{s,et}, Λ)`, sending `D^{[a,b]}` into `D^{[a, b+2N]}`.

This uses the finite global bound `N` and `n` invertible in `k(s)`: the proof goes through the prime-to-`p_s` tube-versus-fibre comparison. Without a finite global dimension bound, boundedness holds locally on finite-dimensional charts.

(Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §4.1(d), p. 8; Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Théorème 1.1, p. 2; Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Démonstration du théorème 5.1, p. 14.)

**Checks.**

- For `X=A¹_S, N=1` gives vanishing for `q≥3`; over a strictly henselian DVR smoothness gives constant nearby cycles in degree zero.
- For `η=s`, the functor is exact restriction `i*`, within the asserted range.
- Over a strictly henselian trait with uniformizer `π` and `ℓ` invertible, take the disjoint union over `d≥1` of the `d`-fold products of xy`=π`. At the deepest node `R^dΨ(Z/ℓ)=Z/ℓ(−d)`. This locally finite-type `X` has infinite generic dimension and globally unbounded nearby cycles.

*Needs:* Section 5.2; `SchemeAndStackFoundations`, Layer 2; `EtaleCohomologyFoundations`, §§0.5–0.6.

Let `K` be a field with a henselian valuation ring `V` whose residue field `κ` is separably closed, `p` the characteristic exponent of `κ, Γ` the value group, `Kˢ` a separable closure and `G_K = Gal(Kˢ/K)` (which equals the inertia group, Mathlib ValuationSubring.inertiaSubgroup of the unique extension of `V` to `Kˢ`, by Gabber–Ramero (6.2.10)). Let `Kᵗ ⊆ Kˢ` be the maximal tame extension, the union of the finite Galois extensions `E/K` in `Kˢ` with `[E : K]` prime to p. Then: (i) there is a natural isomorphism of profinite groups `Gal(Kᵗ/K) ≅ Hom_ℤ(Γ ⊗_ℤ ℤ_(p)/Γ, μ_(p))`, where `ℤ_(p)` is `ℤ` localized at `p` (denominators prime to `p`) and `μ_(p)` is the group of roots of unity of order prime to `p` in `K`; in particular `Gal(Kᵗ/K)` is abelian and its supernatural order is prime to `p`; (ii) for every finite Galois `E/K` in `Kˢ` the map `Gal(E/K)` -`> Hom_ℤ(Γ_E/Γ, μ(κ)), σ ↦` (`γ ↦ σ(x)/x` mod `𝔪_E` for `|x| = γ`), is surjective with kernel a `p`-group, and `E ∩ Kᵗ` is the fixed field of that kernel; (iii) hence `P := Gal(Kˢ/Kᵗ)` is a closed normal pro-`p` subgroup of `G_K` of index prime to `p, i.e`. the unique `p`-Sylow subgroup of `G_K` (the wild inertia subgroup). For `p = 1` (`κ` of characteristic 0), `P = 1` and `G_K ≅ Hom(Γ ⊗ ℚ/Γ, μ)`. This is the valuation-theoretic pro-`p` Sylow/tame comparison in the form used by this stage.

This uses `V` henselian with separably closed residue field (`e.g`. `V` strictly henselian, or the strict henselization of any valuation ring, strict-localisation-of-a-valuation-ring); `Γ` arbitrary (any rank, not necessarily discrete or finitely generated).

(Gabber–Ramero, Almost ring theory, §6.2, Proposition 6.2.12, p. 160; Gabber–Ramero, Almost ring theory, §6.2, Definition 6.2.16, p. 162; Gabber–Ramero, Almost ring theory, §6.2, (6.2.17), p. 162; Scholze, Étale cohomology of diamonds, §21, proof of Proposition 21.16, p. 127.)

`V` a strictly henselian DVR `(Γ = ℤ): Gal(Kᵗ/K) ≅ ∏_{ℓ ≠ p} ℤ_ℓ(1)`, the classical tame inertia of LefschetzPencilsAndVanishingCycles LPV.1. `V` strictly henselian of rank one with value group `ℤ_(p) ⊂ ℚ` (for example the valuation ring of the maximal tamely ramified extension of the maximal unramified extension of `ℚ_p`): `Γ ⊗ ℤ_(p) = Γ`, so `Gal(Kᵗ/K) = 1` and `G_K = P` is pro-`p` (a nondiscrete rank-one regression case). `V` strictly henselian with `Γ = ℤ × ℤ` (lexicographic): `Gal(Kᵗ/K) ≅ ∏_{ℓ ≠ p} ℤ_ℓ(1)²` (a higher-rank regression case).

*Needs:* Mathlib ValuationRing; Mathlib HenselianLocalRing; Mathlib IsSepClosed; Mathlib IsPGroup; Section 5.1; Tau Ceti TauCeti.IsProP; Tau Ceti `TauCeti.isProPSylow_iff_isClosed_and_isProP_and_not_dvd_profiniteIndex`; Tau Ceti `TauCeti.IsProPSylow.eq_of_normal`; Mathlib ValuationSubring.inertiaSubgroup.

In the situation of Section 5.3 let `P ⊆ G_K` be the wild inertia subgroup and `M` a discrete `G_K`-module each of whose elements is killed by an integer prime to p. Then (i) `H^q(P, M) = 0` for all `q > 0`; (ii) the inflation maps `Hⁿ(G_K/P, M^P)` -`> Hⁿ(G_K, M)` are isomorphisms for all `n ≥ 0`, with `G_K/P = Gal(Kᵗ/K)`; (iii) consequently `cd_ℓ(G_K) = cd_ℓ(Gal(Kᵗ/K))` for every prime `ℓ ≠` p. The same holds for any closed normal pro-`p` subgroup `P` of a profinite group `G` in place of the wild inertia.

This uses `M` discrete (open stabilizers) and prime-to-`p` torsion; no finiteness of `M`.

(Scholze, Étale cohomology of diamonds, §21, proof of Proposition 21.16, p. 126; Gabber–Ramero, Almost ring theory, §6.2, (6.2.10), p. 160.)

`V` a strictly henselian DVR, `M = ℤ/n` with `n` prime to `p` and trivial action: `H¹(G_K, ℤ/n) ≅ Hom(∏_{ℓ≠p} ℤ_ℓ(1), ℤ/n) ≅ ℤ/n(−1), H^q = 0` for `q ≥ 2 (cd_ℓ ℤ_ℓ = 1)`. Value group `ℤ_(p): G_K` is pro-`p` and `H^q(G_K, M) = 0` for `q > 0` and every prime-to-`p` torsion `M`.

*Needs:* Section 5.3; `ArithmeticGaloisDuality`, layer R02.2, Section R02.2.1 (the Hochschild–Serre spectral sequence and its degeneration) and Section R02.2.3 (descent along open subgroups).

Let `V` be a valuation ring with fraction field `K`, residue field `κ`, maximal ideal `𝔪` and valuation `|·|: K` -`> Γ ∪` {0} (multiplicative notation; Mathlib ValuationRing.valuation). The Gauss valuation (centre 0, radius 1) on `K[T]` is `|a_0 + a_1 T +` … `+ a_m Tᵐ|_G := max_i |a_i|`; it is multiplicative (Gauss's lemma) and extends uniquely to a valuation `|·|_G: K(T)` -`> Γ ∪` {0} with the same value group `Γ`. Unlike Tau Ceti's rank-one Gauss point `TauCeti.ValuationSpectrum.gaussPoint` of the closed disc (the Gauss norm on restricted power series), this is an algebraic valuation on `K(T)` for an arbitrary ordered value group. Its valuation ring is `V(T) := {h ∈ K(T) : |h|_G ≤ 1}`. Properties: (a) `V(T) = V[T]_{𝔪V[T]}`, the localization of `V[T]` at the prime `𝔪V[T]`; equivalently `V(T)` is the local ring of `A^1_V` at the generic point of the special fibre `A^1_κ`; `(b) V(T) ∩ K = V` and `V(T)` dominates `V`; `(c)` the residue field of `V(T)` is `κ(T)`, purely transcendental over `κ`; `(d)` the value group of `V(T)` equals `Γ` (in particular `V(T)` has the same rank as `V`, and is not discrete if `V` is not); `(e)` iterating (or directly: `|Σ a_α T^α|_G =` max `|a_α|`) gives the Gauss valuation ring `V(T_1, …, T_d) = V[T_1, …, T_d]_{𝔪V[T_1,…,T_d]}`, the local ring of `A^d_V` at the generic point of `A^d_κ`, with residue field `κ(T_1, …, T_d)` and value group `Γ`. For a quadruple with base `V`, the strict henselization of `V(T_1, …, T_d)` (strict-localisation-of-a-valuation-ring) is a strictly henselian valuation ring with value group `Γ`: the 'Gauss valuation base' used for induction on the dimension of the generic fibre.

This uses `V` arbitrary valuation ring (the trivial valuation `V = K` is allowed and gives the trivial valuation on `K(T)`).

(Gabber–Ramero, Almost ring theory, §6.1, Example 6.1.4(iii), p. 152; Gabber–Ramero, Almost ring theory, §6.1, Example 6.1.4(iv), p. 152; Gabber–Ramero, Almost ring theory, §6.1, before Lemma 6.1.9, p. 153.)

Provide `Valuation.gaussPoly`: `|·|_G` on `K[T]: p ↦ max_i |`coeff `p i|`; `Valuation.gauss`: The extension of gaussPoly to RatFunc `K`, a valuation with values in `Γ ∪` {0}; `Valuation.gauss_C`: `|a|_G = |a|` for `a ∈ K`; `Valuation.gauss_X`: `|T|_G = 1`.

Provide `Valuation.gaussPoly_mul`: Gauss's lemma: `|`fg`|_G = |f|_G |g|_G`; `Valuation.gauss_valueGroup`: The value group of `|·|_G` is the value group of `|·|`; `ValuationRing.gaussRing`: `V(T) := {h : |h|_G ≤ 1}`, a valuation ring of `K(T)`; `ValuationRing.gaussRing_eq_localization`: `V(T) =` Localization.AtPrime `(𝔪V[T])`.

Provide `ValuationRing.gaussRing_residueFieldEquiv`: Residue field of `V(T) ≃ κ(T)`; `ValuationRing.gaussRing_inf_K`: `V(T) ∩ K = V` and `V` -`> V(T)` is local; `ValuationRing.gaussRingMv`: `V(T_1, …, T_d)`, with the same characterisations; `Valuation.gauss_eq_gaussNorm`: Agreement with Polynomial.gaussNorm `v` 1 in the rank-one real case.

**Checks.**

- For `V = ℤ_(p): |p + T|_G = 1, |pT² + p²|_G = |p|`; 1/`(p + T) ∈ V(T)` and `(p + T)/p ∉ V(T)`.
- For `V = K` a field (trivial valuation), `|h|_G = 1` for every nonzero `h ∈ K(T)` and `V(T) = K(T)`.
- If `|·|` is a rank-one valuation realized as a nonarchimedean absolute value `v: K` -`> ℝ_{≥0}`, then for `p ∈ K[T], |p|_G` corresponds to Polynomial.gaussNorm `v` 1 `p` (Mathlib Polynomial.gaussNorm).
- For `V` nontrivial with `0 ≠ π ∈ 𝔪`, the local ring `V[T]_{(𝔪, T)}` at the origin of the special fibre is not a valuation ring (neither `π | T` nor `T | π`), so it is not `V(T)`; the generic point of the special fibre is required.
- The residue field of `V(T)` is `κ(T)` and `V(T) ∩ K = V`.

For `V = ℤ_p: |1 +` pT`|_G = 1, |p T²|_G = |p|`, and `V(T) = ℤ_p[T]_{(p)}` has residue field `𝔽_p(T)`, a purely transcendental extension of the residue field of `V` (Gauss's lemma). The value group of `|·|_G` on `K(T)` equals that of `V`: the Gauss valuation is residually transcendental, not value-transcendental.

*Needs:* Mathlib ValuationRing; Mathlib ValuationRing.valuation; Mathlib ValuationRing.ValueGroup; Mathlib RatFunc; Mathlib Polynomial.gaussNorm; Mathlib `Polynomial.gaussNorm_mul`; Section 5.1.

Let `V` be a strictly henselian valuation ring with fraction field `K`, value group `Γ` and residue characteristic exponent `p`; let `W` be the strict henselization of the Gauss valuation ring `V(T_1, …, T_d)` (Section 5.3) at a separable closure of `κ(T_1, …, T_d), E :=` Frac `W`, and choose a separable closure `Eˢ` of `E` containing a separable closure `Kˢ` of `K`. Then (i) `W` is a strictly henselian valuation ring with value group `Γ`; (ii) the maximal tame extension of `E` is `Eᵗ = E · Kᵗ`; (iii) restriction `Gal(Eᵗ/E)` -`> Gal(Kᵗ/K)` is an isomorphism, compatible with the identifications of both sides with `Hom(Γ ⊗ ℤ_(p)/Γ, μ_(p))` of Section 5.3; (iv) consequently, for every discrete `G_K`-module `M` of prime-to-`p` torsion on which the wild inertia `P_K` acts trivially (a tame module), restriction `Hⁿ(G_K, M)` -`> Hⁿ(G_E, M)` is an isomorphism for all `n`. The statement concerns only the tame quotients; it makes no claim that `Gal(Eˢ/E)` -`> Gal(Kˢ/K)` is surjective on wild inertia, and without that surjectivity (iv) fails for modules on which `P_K` acts nontrivially (`M^{P_E}` can be larger than `M^{P_K}`).

This uses `V` strictly henselian; `d ≥ 0` (`d = 0` gives `W = V`).

(Gabber–Ramero, Almost ring theory, §6.2, (6.2.18), p. 162; Gabber–Ramero, Almost ring theory, §6.2, (6.2.17), p. 162; Gabber–Ramero, Almost ring theory, §6.2, Lemma 6.2.5, p. 159.)

`V` a strictly henselian DVR and `d = 1: W` is the strict henselization of the DVR `V[T]_{(π)}`, a strictly henselian DVR with the same uniformizer `π`, and both tame quotients are `∏_{ℓ≠p} ℤ_ℓ(1)` generated by the action on `π^{1/n}`.

*Needs:* Section 5.3; Section 5.1.

### 5.4 Base change and constructibility

The general-base construction below extends the trait gluing topos to specialization arrows over an arbitrary scheme. For scheme maps `X→S←Y`, define `OrientedEtaleProduct` as the oriented product of their small étale topoi: a map from a topos `T` consists of maps `T→X_ét` and `T→Y_ét` together with a natural transformation between their two composites to `S_ét`, in the specialization orientation. Construct its coherent site using triples of étale neighborhoods `U→X, V→S` and `W→Y` with `U→V←W`. The topology must present the stated universal property: besides étale refinements of `U` and `W` it includes the Cartesian refinements of the middle base neighborhood; a topology generated only by independent covers of the three entries is insufficient. Its geometric points are triples (`x,y`,sp), with sp a specialization arrow from the image of `y` to the image of `x`. For `X→S` the canonical diagonal map `Ψ_f:X_ét→X_ét←×_{S_ét}S_ét` sends `x` to (`x,f(x)`,id). Derived direct image along `Ψ_f` is general-base nearby cycles. (Orgogozo, arXiv:math/0507475v1, §1, pp. 2–3, and §7.1–7.2, p. 17; Lu–Zheng, §1–2, pp. 3–15.)

Provide `OrientedEtaleProduct.projections` and `OrientedEtaleProduct.specialization`, with their universal compatibility; `OrientedEtaleProduct.baseChange`, functorial for a Cartesian scheme square; `OrientedEtaleProduct.enoughPoints`, proved from the coherent étale basis and its specialization points; `OrientedEtaleProduct.shred`, restriction at a fixed specialization `(s,η)`; and `OrientedEtaleProduct.nearbyCycles_stalk`, identifying the stalk at (`x,η`,sp) with `RΓ(X_(x)×_{S_(s)}S_(η),F)`. Construct all maps by adjunction before asserting that any is an isomorphism. For qcqs schemes this site is coherent, with representable triples generating the constructible objects; use its finite locally closed partitions to define constructibility over a noetherian coefficient ring. `A` general-base oriented topos is not the étale topos of an ordinary scheme fibre product.

**Checks.**

- When `S` is a separably closed field, there are no nontrivial base specialization arrows; for `X=Y=S` the product is the point topos and its coefficient cohomology is concentrated in degree zero.
- On a strictly henselian trait the generic-to-closed shred has stalk `RΓ(X_(x)×_S η̄,F)`, agreeing with the trait nearby-cycle convention. Reversing the arrow would not recover this stalk.
- For `X` empty the oriented product is empty and nearby cohomology vanishes. For `η=s` the identity shred recovers the special restriction rather than a geometric generic fibre.
- `A` Cartesian base change supplies a canonical comparison morphism. General-base constructibility and invertibility of that morphism require the theorems below; they are not fields of the definition.

The geometric reduction needed here is `PlurinodalAlteration.exists`: if `f:X→S` is dominant proper between integral excellent schemes, there exist alterations `S₁→S` and `X_d→X`, forming a commuting square, such that `X_d→S₁` is a composition of projective flat families of connected nodal curves. A finite group `N` acts over `X` and `S₁`, and the invariant function field of `X_d/N` is purely inseparable over the function field of the component of `X×_S S₁` dominated by `X_d`. No finite-dimensionality hypothesis on `S` is added to this corollary. This extends the alteration and prestable-family interfaces of `SchemeAndStackFoundations`, Layer 4, by the plurinodal factorization and group control needed for cohomological descent. (de Jong, *Families of curves and alterations*, Corollary 5.10, p. 618; Theorem 5.9, pp. 616–617.)

Define `PlurinodalPresentation` as a finite chain `X_d→`…`→X₀=S` of projective flat nodal connected-curve families, retaining the individual maps and an isomorphism of the composite with `f`. Provide `PlurinodalPresentation.baseChange`, `PlurinodalPresentation.comp`, `PlurinodalPresentation.relativeDimension` `(d)`, and `PlurinodalPresentation.singularLocus_last`, finite over `X_{d−1}`. For the alteration theorem, normalize after a finite ground-field extension to separate the generic components, use a separating transcendence basis to factor a geometrically reduced generic fibre through a curve, and extend that factorization by a projective modification and Stein factorization. For the curve step, first add markings and, if necessary, a controlled covering to make the generic pointed curve stable. Take a finite extension of its function field that supplies level structure, extend the resulting point by properness of stable pointed-curve moduli, and take the closure of the generic comparison graph; finite Isom and normalization extend the comparison after alteration. This is the generic stable-extension argument, not an assumption that every stable family already extends unchanged over an arbitrary open subset. Flattening and the marked-section construction then give the prestable curve over the modified base (de Jong, §3.7–3.13, pp. 608–609). Preserve the group actions by taking simultaneous translates of the modifications; quotienting a projective nodal curve by a finite group over a normal excellent base is nodal. At a completed node the invariant ring is a power-series ring or again `R[[u,v]]`/(uv`−a`); use branch-preserving norms and the branch-exchanging case separately. Induct on the generic relative dimension. The projective curve step permits marked sections and a proper exceptional base locus, and the quotient control persists under composition. (de Jong, Theorem 2.4 and Remark 2.5, pp. 602–603; Lemma 5.2, pp. 612–613; Proposition 4.2 and Lemma 4.3, pp. 610–612; Corollary 5.10, p. 618.)

**Checks.**

- `A` single proper nodal curve has a one-step presentation of relative dimension one; a smooth curve is included.
- `A` chain of two such families has relative dimension two and retains two separate singular loci. Its composite need not be a nodal curve.
- `A` zero-length chain is the identity and has relative dimension zero. An open affine-line morphism is not a projective one-step presentation.
- Pullback preserves each projective flat nodal-curve step, even when the base change is non-dominant. The altered map to `X` is an alteration, not automatically a birational modification.

Prove `OrientedNearbyCycles.modificationBaseChange`: for `S` qcqs irreducible, `f:X→S` finitely presented, `n>0` a unit on `S` and `F∈Dᵇ_c(X,Z/n)`, there is a modification `S′→S`, allowed to depend on `F`, after which formation of general-base `RΨF` commutes with every base change `T→S′`. `A` modification here is proper surjective, an isomorphism on a dense open, with generic points mapping to generic points; it is not an arbitrary alteration. Establish also the uniform bound `q≤`2N when `f` has fibres of dimension `≤N` and `F` is a sheaf, and constructibility after a suitable modification using finite locally closed partitions of `X` and `S`. Preserve finite `Tor` amplitude under its usual finite-coefficient hypotheses. (Orgogozo, Theorem 1.1, pp. 2–3; Proposition 2.3, pp. 3–4; Theorem 6.1 and Remark 6.3, p. 16.)

The proof descends finitely presented geometry and bounded constructible coefficients to a finite-type `Z`-model, then uses a bounded proper hypercover whose components are plurinodal or map into a strict closed subset of the base. The hypercover degree required for a fixed truncation is finite; higher components have no asserted uniform bound on their generic relative dimensions. Finite-surjective descent and flattening convert the needed alterations into modifications. To extend a modification from a closed image to the ambient base, first construct a finite-surjective intermediary over the pullback of that image; restricting ambient modifications alone is not cofinal. Induct lexicographically on the truncation bound, base dimension and generic relative dimension. At the last nodal-curve step, the base-change obstruction vanishes on the smooth locus by universal local acyclicity and is supported on a finite singular locus; proper direct image then detects its vanishing. The uniform 2N bound terminates the truncation induction. Constructibility is proved by the same reduction and finite oriented strata, not by finiteness of individual stalks. (Orgogozo, Lemmas 2.6–2.7, pp. 5–6, Lemma 3.2.1, pp. 7–9, Proposition 3.3.1 and §3.4, pp. 9–11, Lemma 4.3, p. 13, §8.1–8.2, pp. 19–22.)

For a valuation base, the chosen modification has a section by the valuative criterion, so pullback along that section proves universal nearby-cycle base change without modifying the valuation scheme. Approximation and filtered coefficient colimits extend the finite-presentation constructible statement to the precise valuation coefficient scope below. The locally finite-type tube theorem is proved independently by the henselian/tube argument; it is not obtained by dropping finite presentation from this modification theorem.

*Needs:* scheme étale sites, strict localizations, normalizations, proper base change and cohomological descent from `SchemeAndStackFoundations`, Layer 2; alterations, flattening, stable pointed-curve extension and Stein factorization from `SchemeAndStackFoundations`, Layer 4, and `TauCetiRoadmap.StableReduction`; finite-presentation and constructible coefficient descent from `EtaleCohomologyFoundations`, §§0.5–0.6; coherent-site and derived operations from `DiamondsAndVStacks`, layer D0, and `EnhancedDerivedSheaves`, §§0.1–0.4.

Let `φ = (g, h, ι)`: (X', S', `η'`, s', L') -`> (X, S, η, s, L)` be a Cartesian and dominant morphism of quadruples (Section 5.1): X' `= X ×_S` S', and the local homomorphism `O_{S,s}` -`> O_{S',s'}` of valuation rings is injective. Assume `f: X` -`> S` locally of finite type and let `n ≥ 1` be invertible in `k(s)` (equivalently prime to the residue characteristic exponent `p_s`). Then for every ring `Λ` with `nΛ = 0` and every `F ∈ D⁺(X_et, Λ)`, the base-change map `c_φ(F): g_s^* RΨ_L(F)` -`> RΨ_{L'}(g^* F)` of Section 5.2 is an isomorphism, equivariant along `φ_`#: `Gal(L'/k(η'))` -`> Gal(L/k(η))`. In particular, for every torsion abelian sheaf `F` on `X_et` whose local sections are killed by integers prime to `p_s, g_s^* R^qΨ_L(F) ≅ R^qΨ_{L'}(g^* F)` for all `q`. No constructibility or finiteness of `F` is assumed. Nothing is asserted for torsion divisible by `p_s`, for non-Cartesian `φ`, or for non-dominant `h`.

This uses `φ` Cartesian: X' `= X ×_S` S' (for non-Cartesian `φ` the map is not an isomorphism in general, nearby-cycles-base-change-map test `nearbyCyclesBaseChange_not_iso_nonCartesian`); `φ` dominant: `O_{S,s}` -`> O_{S',s'}` injective; this is the case of valuative bases dominating `S` covered by Hub96's argument as described by Orgogozo, Remarque 4.4; `n` invertible in `k(s)`; `Λ` an arbitrary `ℤ/n`-algebra; `f` locally of finite type; `F ∈ D⁺` arbitrary.

(Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Remarque 4.4, p. 13; Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, Remark 3.3(c), p. 7; Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §1.1(b), p. 2.)

Traits: for strictly henselian discrete valuation rings `V` -`>` V' (dominant) this is the commutation of nearby cycles with dominant changes of traits (Deligne, SGA `4½` Th. finitude, recalled by Illusie §1.1`(b)`). Nondiscrete rank one: `V` a strictly henselian DVR and V' `= O_C` for `C` the completion of an algebraic closure of `K` (`O_C` is henselian with residue field the algebraic closure of `k(s)`, purely inseparable over `k(s)`, so a quadruple with `η'` generic); the theorem identifies nearby cycles of `X_{O_C}` over `O_C` with `g_s^* RΨ_L(F)`, forgetting the Galois action (`Gal(L'/k(η'))` is trivial). `η = s` (and `η' =` s'): `c_φ(F)` is the identity-type isomorphism `g_s^* i^* F ≅ i'^* g^* F`. Regression (no claim): for `p_s | n` the theorem says nothing; for a morphism that is not dominant, such as `Spec(V/𝔮)` -`> Spec V` for a nonzero prime `𝔮 ⊆ 𝔭_η`, the theorem says nothing.

*Needs:* Section 5.2; Section 5.1; Section 5.3; `ArithmeticGaloisDuality`, layer R02.2, Section R02.2.1.

Let `(X, S, η, s)` be a quadruple with `X` affine of finite presentation over `S` and `n ≥ 1` invertible in `k(s)`. Assume that (i) for every constructible sheaf `G` of `ℤ/n`-modules on `X_et, RΨ_L(G) ∈ D^b_c(X_{s,et}, ℤ/n)`, and (ii) `R^qΨ_L` vanishes for `q > m` on sheaves of `ℤ/n`-modules (Section 5.3, `m = 2` dim `X_η`). Then for every noetherian ring `B` with nB `= 0` and every constructible sheaf `F` of `B`-modules on `X_et, RΨ_L(F) ∈ D^b_c(X_{s,et}, B)`; in particular each `R^qΨ_L(F)` is a constructible sheaf of `B`-modules.

This uses `X` affine of finite presentation (the general case follows by locality, nearby-cycles-locality-and-proper-pushforward); `B` noetherian: constructible sheaves of `B`-modules then form an abelian category stable under kernels and extensions.

(Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Remarque 6.3, p. 16; Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), §7.1, p. 17; Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §2.5, p. 6.)

`B = 𝔽_ℓ[t] (ℓ ≠ p_s), X = S, F = B: RΨ_L(B) = B`, a constructible `B`-module although not a finite abelian group.

*Needs:* Section 5.2; Section 5.3; `EnhancedDerivedSheaves`, §§0.1–0.4 (presentability and the derived tensor product); `SchemeAndStackFoundations`, Layer 2.

Let `(X, S, η, s)` be a quadruple with `f: X` -`> S` locally of finite type, `B` a noetherian ring with nB `= 0` for an integer `n` invertible in `k(s)`, and `F` a constructible sheaf of `B`-modules on `X_et` (each quasi-compact open of `X` has a finite partition into constructible locally closed subschemes on each of which `F` is locally constant with finitely generated stalks). Then for every `q` the sheaf `R^qΨ_L(F)` on `X_{s,et}` is a constructible sheaf of `B`-modules (`X_s` is locally of finite type over the field `k(s)`), `R^qΨ_L(F) = 0` for `q > 2` dim `X_η`, and for `X` quasi-compact `RΨ_L(F) ∈ D^b_c(X_{s,et}, B)`; the action of `Gal(L/k(η))` on each `R^qΨ_L(F)` is continuous. Nothing is asserted when `p_s` divides `n`, and the statement is not deduced from the trait case by writing `V` as a limit of discrete valuation rings.

This uses `f` locally of finite type (not necessarily of finite presentation; `X` need not be noetherian); `B` noetherian with nB `= 0` and `n` invertible in `k(s)`; `B` may be infinite (for example `𝔽_ℓ[t]`).

(Huber (1996), §4.2, Proposition 4.2.5, p. 243; for finitely presented `f`: Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Théorème 6.1, p. 16; Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Introduction, p. 1; Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, Remark 3.3(c), p. 7; Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §1.1(b), p. 2.)

Traits: for a strictly henselian discrete valuation ring this is Deligne's constructibility theorem (SGA `4½` Th. finitude 3.2, recalled by Illusie §1.1`(b)`). `X = S: RΨ_L(B) = B` in degree 0. Kummer example (`V` a strictly henselian DVR, `X = Spec V[t]/(tⁿ − π), n` prime to `p_s`): `R^0Ψ_L(B) ≅ Bⁿ`, constructible (a skyscraper at the unique point of `X_s`). Higher rank (regression): `V` strictly henselian with value group `ℤ × ℤ` (lexicographic). `V` is not a directed union of discrete valuation rings along injective local homomorphisms, since a directed union of archimedean ordered groups along order embeddings is archimedean; the theorem applies to `V` directly. `p`-torsion (regression, no claim): for `V` of mixed characteristic `(0, p)` and `B = ℤ/p` the theorem asserts nothing.

*Needs:* Section 5.2; Section 5.4; Section 5.3; `SchemeAndStackFoundations`, Layer 2.

For the inherited quadruple `Q=(X,Spec V,η,s)`, chosen separable closure `L` of `κ(η)` and compatible specialization of geometric points, restrict the general oriented-product nearby-cycle object `RΨ_f F` to its `(s,η)`-shred. There is a canonical natural isomorphism with the inherited tube-defined `i*Rj*j*F` on `X_s`, where `j` is the base change of `S_(η̄)→S`, not of `η̄→S`. Under this isomorphism, the general nearby exchange map restricts to the inherited nearby-cycles-base-change-map for each Cartesian morphism of quadruples; automorphisms of `L` restrict to the inherited Galois action.

This uses `F` lies in `D⁺(X_et,Λ)`. No torsion or finite-type hypothesis is required for this identification; A geometric lift over `s` and a compatible geometric specialization `η̄→s̄` are retained; when identifying with `X_s`, use that `O_(S,s)` is strictly henselian.

(Qing Lu and Weizhe Zheng, Duality and nearby cycles over general bases, §4.1, Lemma 4.1, Remark 4.2(a) and Remark 4.3, pp. 26–27.)

For `η=s`, both sides are `i*F` and the unit is the identity after the canonical identification. For rank two and an intermediate `η`, use `S_(η̄)`; replacing it by `η̄` is a separate comparison theorem, not this definition. Changing the chosen embedding `L→L′` conjugates the map by the inherited equivariant transport.

*Needs:* Section 5.1; Section 5.2; `LefschetzPencilsAndVanishingCycles`, layer LPV.0; `SchemeAndStackFoundations`, Layer 2; Mathlib DerivedCategory.Plus.

Let `S=Spec V` for any valuation ring `V`, let `n≥1` be a unit in `V`, let `nΛ=0`, and let `f:X→S` be a morphism of schemes. For `F∈D⁺(X_et,Λ)`, the general oriented-product `RΨ_f F` commutes with every scheme base change `h:T→S`: the canonical exchange transformation `h←`*`RΨ_f F→RΨ_(f_T)(h_X*F)` is an isomorphism. No dominance, flatness, rank-one, discreteness, noetherianity or finite-presentation hypothesis on `h` or `V` is imposed. This is a valuation-specific theorem, not universal `Ψ`-goodness over arbitrary bases.

This uses `A` single `n` annihilates `Λ` and is invertible on `S`. For the hypothesis `n` invertible in `κ(s)`, first replace `S` by `Spec O_(S,s)`; `F` is bounded below. The unbounded case is outside this declaration.

(Qing Lu and Weizhe Zheng, Duality and nearby cycles over general bases, §4.5, Example 4.26(2), p. 37; Fabrice Orgogozo, Modifications et cycles évanescents sur une base de dimension supérieure à un, Theorem 1.1, p. 2; Remark 4.4, p. 13.)

`A` quotient `V→V/𝔭` with prime `𝔭` need not be injective or flat; the canonical exchange is still an isomorphism. The identity of a rank-two valuation spectrum passes with no discrete uniformizer or DVR approximation. If `n` is not a unit in `V`, this theorem supplies no isomorphism. Use the canonical exchange map itself; existence of an unrelated isomorphism between the two objects is insufficient.

For any Cartesian morphism `φ=(g,h,ι):Q′→Q` of the inherited valuation quadruples, let `n≥1` be invertible in `κ(s), nΛ=0` and `F∈D⁺(X_et,Λ)`. Then the inherited map `β_φ(F):g_s*RΨ_L(F)→RΨ_L′(g*F)` is an isomorphism and is equivariant for the specified restriction homomorphism `Gal(L′/κ(η′))→Gal(L/κ(η))`. Neither injectivity of `O_(S,s)→O_(S′,s′)` nor dominance or flatness is required. This extends the dominant comparison of Section 5.1, using the same map `β`.

This uses `h(η′)=η` and `h(s′)=s`, and the embedding `ι` and local map of strict localizations belong to `φ`; Localize both bases at `s,s′` before applying universal `Ψ`-goodness; `n` is then a unit on the source base.

(Qing Lu and Weizhe Zheng, Duality and nearby cycles over general bases, Example 4.26(2), p. 37; Remark 4.2(a), pp. 26–27; Fabrice Orgogozo, Modifications et cycles évanescents sur une base de dimension supérieure à un, Remark 4.4, p. 13.)

For `η=s` and the residue map `V→κ(s)`, choose `η′=s′` and the compatible separable closures: `β` is ordinary special-fibre pullback and is the identity on the constant coefficient stalk. For a prime `𝔭⊊𝔪` of a strictly henselian rank-two `V, h:Spec(V/𝔭)→Spec V` is non-dominant; choose `η=𝔭,s=𝔪` and matching generic/closed points upstairs. The map is covered. When `g,h` are identities, `β` is the inherited identity transformation. Two composable Cartesian maps, including a quotient followed by a residue-field extension, give the inherited composite `β`.

*Needs:* Section 5.4; Section 5.1; Section 5.2.

Let `V` be a valuation ring, `n≥1` invertible in `V, f:X→Spec V` of finite presentation and `F∈Dᵇ_c(X_et,ℤ/n)`. After every scheme base change `T→Spec V`, for every geometric point `x` of `X_T` over a geometric point a of `T` and every compatible geometric generization `b` of a, the canonical restriction `RΓ((X_T)_(x)×_(T_(a))T_(b),F_T)→RΓ((X_T)_(x)×_(T_(a))b,F_T)` is an isomorphism. `T` need not itself be a valuation spectrum. Restricting to the inherited quadruple gives the actual unit-induced tube–fibre comparison, not merely isomorphic cohomology groups.

This uses Finite presentation and bounded constructible `ℤ/n` input are retained from Orgogozo v1 Theorem 5.1; The two strictly localized schemes and their map `b→T_(b)` are fixed by the compatible geometric specialization.

(Fabrice Orgogozo, Modifications et cycles évanescents sur une base de dimension supérieure à un, Theorem 5.1 and proof, pp. 14–15; Proposition 2.3, pp. 3–4; Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, Theorem 3.2 and Remark 3.3(c), p. 7.)

For `b=a`, both sides restrict to the same geometric stalk. If `b` is a generic geometric point of a valuation spectrum, `T_(b)=b` and the restriction is already the identity. At an intermediate prime of a rank-two valuation ring the comparison has nontrivial content; do not identify the schemes `T_(b)` and `b`. `A` uniform bound on all fibre dimensions is used here; Proposition 2.3 is not cited as a bound in terms of the generic fibre alone.

*Needs:* `LefschetzPencilsAndVanishingCycles`, layer LPV.0; `SchemeAndStackFoundations`, Layer 4; `SchemeAndStackFoundations`, Layer 2; Section 5.4; Section 5.2; `SchemeAndStackFoundations`, §0.9 (`noetherian_approximation`); `EtaleCohomologyFoundations`, §0.5 (`ClassicalCoefficients.finitePresentationDescent`); `SchemeAndStackFoundations`, §2.15 (`etale_cohomology_limits`); `EtaleCohomologyFoundations`, §0.6 (`ClassicalCoefficients.constructibleDerivedDescent`); `EtaleCohomologyFoundations`, §0.6 (`ClassicalCoefficients.constructibleHomContinuity`); `EtaleCohomologyFoundations`, §§0.5–0.6.

Let `V` be any valuation ring, `n≥1` invertible in `V, B` a noetherian ring with nB`=0` and `f:X→Spec V` of finite presentation. For `F∈D_c(X_et,B)∩D⁺(X_et,B)`, the general oriented-product `RΨ_f F` has constructible `B`-module cohomology: each stalk is finitely generated over `B` and, for each cohomology sheaf, there are finite constructible locally closed partitions of `X` and `Spec V` on whose oriented products it is locally constant. In particular its `(s,η)`-shred is constructible on `X_s`. If `F` is bounded, `RΨ_f F` is bounded constructible, using the uniform all-fibre cohomological-dimension bound. This declaration does not identify finite type with finite presentation.

This uses Noetherian `B` can be infinite, `e.g`. `𝔽_ℓ[t]`; finite `B`-modules do not mean finite underlying abelian groups; The bounded-below restriction agrees with the bounded-below derived category. The published source permits a larger `D_c` input.

(Qing Lu and Weizhe Zheng, Duality and nearby cycles over general bases, Theorem 4.27(2), definition and proof, pp. 37–38; Fabrice Orgogozo, Modifications et cycles évanescents sur une base de dimension supérieure à un, Theorem 6.1, p. 16; §8.1–8.2, pp. 19–22.)

For `B=𝔽_ℓ[t], f=`id, and `F=B`, the output stalk is `B`, which is constructible over `B` and is infinite as an abelian group. For `η=s` the shred is `i*F`, with its inherited constructibility. For a semistable curve, the smooth locus and the finite nodal locus must both be treated; local constancy on the smooth locus alone does not prove constructibility. For a locally finite-type morphism which is not finitely presented, use the tube constructibility theorem of Huber (1996), Proposition 4.2.5, p. 243, in Section 5.4. The general oriented finite-presentation theorem itself retains finite presentation.

*Needs:* Section 5.4; `LefschetzPencilsAndVanishingCycles`, layer LPV.0; `SchemeAndStackFoundations`, Layer 2; `SchemeAndStackFoundations`, Layer 4; `EtaleCohomologyFoundations`, §§0.7–0.11; `EtaleCohomologyFoundations`, §§0.7–0.11 (the coefficient and support notation of the étale derived category); `EtaleCohomologyFoundations`, §§0.7–0.11 (bounded constructible and finite-`Tor`-amplitude complexes).

### 5.5 Trait action and variation

For a left action `ρ` on a coefficient module define `Trait.variation σ = ρ(σ)−id`, using the existing endomorphism ring. Its cohomological form is the induced transformation on the nearby-cycle complex. The multiplication formula is `Var(στ)=Var(σ)+Var(τ)+Var(σ)Var(τ)`; the last product is composition in the order of the left action. Keep the associated comparison to the trait variation maps of `LefschetzPencilsAndVanishingCycles`, layer LPV.0. (SGA 7 II, Exposé XIII, §1.4.3 and §2.1.2.5, pp. 17–19; Lu–Zheng, Remark 2.17, equations (2.17)–(2.18), p. 23, and Remark 3.5, equations (3.13)–(3.14), p. 26. The full fixed-element variation family is the SGA 7 XIII §1.4.3 interface; Lu–Zheng gives its Iwasawa-twist formulation.)

Provide `Trait.variation_one`, `Trait.variation_mul`, compatibility with equivariant module maps, and compatibility with coefficient reduction. Over a ring where `u` and `v` are arbitrary endomorphisms, the same algebraic formula holds for `variation(u)=u−1` and `variation(v)=v−1`; the Lean milestone states this carrier-level identity.

**Checks.**

- The identity monodromy has variation zero, while the zero endomorphism has variation `−`id.
- Scalar endomorphisms 2 and 3 give `Var(6)=5=1+2+1·2` over `Z`; they are monodromy automorphisms after extending scalars to `Q`; the additive formula without its product term fails.
- Over a free rank-two module the formula keeps the order uv. With `u=`[[1,1],[0,1]] and `v=`[[1,0],[1,1]], its last term is [[1,0],[0,0]], whereas reversing the product gives [[0,0],[0,1]].

*Needs:* Layer 1; the trait nearby-cycle action and specialization triangle supplied by `LefschetzPencilsAndVanishingCycles`, layer LPV.0; Mathlib's `Module.End` and linear maps.

Let `A` be a strictly henselian discrete valuation ring (henselian, with separably closed residue field `k(s)` of characteristic exponent `p`), `S = Spec A` with generic point `η` and closed point `s, k =` Frac `A` with its valuation topology, `k^sep ⊆ k̄` a separable and an algebraic closure of `k, Ā` the integral closure of `A` in `k̄, A^sep` the integral closure of `A` in `k^sep, k^, k̄^, A^ and Ā^ the` completions of `k, k̄, A` and `Ā`, and `I = Gal(k^sep/k)`, which is the inertia group because `k(s)` is separably closed and which acts on `k̄` through the restriction isomorphism `Aut(k̄/k) ≅ Gal(k^sep/k)` (`k̄/k^sep` is purely inseparable). Let `X` be an `S`-scheme, `E` a torsion ring prime to `p`, and `K ∈ D⁺((X_η)_et, E)`. Consider: (a) LPV.0's nearby-cycle complex `RΨ_η(K) ∈ D⁺(X_s ×_s η, E)`: with `η̄ = Spec k^sep, S̄ = Spec A^sep, X̄ = X ×_S S̄, j̄: X_η̄ → X̄` and `ī: X_s̄ → X̄`, its underlying complex is `ī^*Rj̄_*(K|X_η̄)` (SGA 7 XIII 2.1.2.3), with `I` acting by transport of structure; `(b)` Huber's complex of vanishing cycles in Hub96 3.5.17: with X' `= X ×_A Ā`, j': X' `×_Ā k̄ →` X' and i': `X_s ×_A Ā →` X', the complex `i'^*Rj'_*(K|X_k̄)`, with `Aut(k̄/k) ≅ I` acting through its action on `Ā`; `(c) RΨ_L(F) = i^*Rj_*j^*F` of Section 5.2 for the quadruple `(X, S, η, s)` and any `F ∈ D⁺(X_et, E)` with `F|X_η ≅ K`, where `η̃ = Spec k^sep` is the strict localization of `S` at `η, j: X_η̃ → X` and `i: X_s → X`, with `I = Gal(η̃/η)` acting by transport of structure; it depends only on `K`. The projections `X_s̄ → X_s` and `X_s ×_A Ā → X_s` are universal homeomorphisms (integral, universally injective, surjective: the residue fields of `A^sep` and `Ā` are purely inseparable over the separably closed `k(s)`) and identify the étale topoi. Under these identifications there are canonical isomorphisms `(c) ≅` (a) `≅ (b)` in `D⁺((X_s)_et, E)`, each commuting with the action of every `σ ∈ I`. For the degenerate quadruple `η = s` (`η̃ = S, j` the identity), `RΨ_L(F) = i^*F`, which is the `s`-component `RΨ(F)_s = i^*F` of LPV.0 (SGA 7 XIII 2.1.2.1).

This uses `A` strictly henselian discrete valuation ring; `X` an arbitrary `S`-scheme (quasi-compactness of `j` is automatic: `j` is affine); `E` a torsion ring prime to `p =` the characteristic exponent of `k(s)` — the coefficient scope of LPV.0 (SGA 7 XIII 2.1.1); steps 1 and 2 use no prime-to-`p` hypothesis, so `(b) ≅ (c)` holds for every torsion ring `E`; `K ∈ D⁺`; objects of `D⁺(X_s ×_s η, E)` are complexes on `X_s̄` with continuous `I`-action (LPV.0 1.2.4, 1.1.3).

(Pierre Deligne, Nicholas Katz (directors); Exposé XIII by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340, Exposé XIII, 1.3.2.2, p. 13; Pierre Deligne, Nicholas Katz (directors); Exposé XIII by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340, Exposé XIII, 2.1.2, p. 18; Huber (1996), §3.5, proof of 3.5.17, p. 210; Stacks project, Tag 04DZ (Theorem 59.45.2); Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, p. 552 (running head; the OCR file labels this block 551).)

**Checks.**

- For `X = S` and `K = M` an `E[I]`-module (a sheaf on `η`), the three objects are `M` on the point `s` with its `I`-action, and the isomorphisms of the construction are the identity of `M`.
- For the quadruple `(X, S, s, s), RΨ_L(F) = i^*F = RΨ(F)_s` for every `F ∈ D⁺(X_et, E)`.
- For `X = A^1_S` and `K = E` constant (`E` prime to `p`), the three objects are isomorphic to `E_{X_s}` in degree 0 with trivial `I`-action, compatibly with the isomorphisms of the assertion.
- None of (a)–`(c)` is LPV.0's vanishing complex: for `X = S` and K' `= E` on `S, RΦ(K') = cone(E → E) = 0`, while `RΨ_η(K'|η) = E`.

`X = S`: all three objects are the `I`-module `K_η̄` on the point `s`. `X` smooth over `S` and `K = E` constant: all three are `E_{X_s}` in degree 0 with trivial `I`-action (LPV.0 local acyclicity, SGA 7 XIII 2.1.5: `RΦ = 0`).

*Needs:* `EtaleCohomologyFoundations`, §`F`.3a; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.2; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.3; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.5; Section 4.5; Section 5.2; `SchemeAndStackFoundations`, Layer 2; Mathlib IsDiscreteValuationRing; Mathlib HenselianLocalRing; Mathlib IsSepClosed; Mathlib IsSepClosure; Mathlib IsAlgClosure; Mathlib integralClosure; Mathlib AlgebraicGeometry.IsIntegralHom; Mathlib AlgebraicGeometry.UniversallyInjective; Mathlib AlgebraicGeometry.Surjective.

Let `A` be a strictly henselian discrete valuation ring (henselian, with separably closed residue field `k(s)` of characteristic exponent `p`), `S = Spec A` with generic point `η` and closed point `s, k =` Frac `A` with its valuation topology, `k^sep ⊆ k̄` a separable and an algebraic closure of `k, Ā` the integral closure of `A` in `k̄, A^sep` the integral closure of `A` in `k^sep, k^, k̄^, A^ and Ā^ the` completions of `k, k̄, A` and `Ā`, and `I = Gal(k^sep/k)`, which is the inertia group because `k(s)` is separably closed and which acts on `k̄` through the restriction isomorphism `Aut(k̄/k) ≅ Gal(k^sep/k)` (`k̄/k^sep` is purely inseparable). Let `X → S` be locally of finite type, `E` a torsion ring and `K ∈ D⁺((X_η)_et, E)`. Let `X̂` be the completion of `X` along `X_s, Y = d(X̂)` its generic fibre over `Spa(k^, A^), Ȳ = Y ×_{Spa(k^, A^)} Spa(k̄^, Ā^)` (the completed base change `Y ⊗̂_{k^} k̄^)`, and `c: Ȳ_et → (X_η)_et` the natural morphism; let X' `= X ×_A Ā`, i', j' as in Section 5.5. Every `σ ∈ Aut(k̄/k)` extends uniquely to an isometric automorphism of `k̄^ (the valuation of the henselian field k has a unique extension to k̄)`, acts on `Ȳ` over `Y` with `c ∘ σ = c`, hence on `R^+Γ(Ȳ, c^*K)`; and `σ` acts on X' over `X`, preserving `X_s ×_A Ā`, hence on `R^+Γ(X_s ×_A Ā, i'^*Rj'_*(K|X_k̄))`. The isomorphism `R^+Γ(Ȳ, c^*K) ≅ R^+Γ(X_s ×_A Ā, i'^*Rj'_*(K|X_k̄))` of Hub96 3.5.17 commutes with these two actions of `σ`, for every `σ ∈ Aut(k̄/k)`.

This uses `X → S` locally of finite type; `E` an arbitrary torsion ring (no prime-to-`p` hypothesis); `K ∈ D⁺`; `σ` acts semilinearly: the action on `Ȳ` is not `k̄^-linear`, and the statement is an equality of automorphisms of complexes of `E`-modules; Neither Hub96 nor SGA 7 states this equivariance; the proof uses only the naturality of the constructions.

(Huber (1996), §3.5, proof of 3.5.17, p. 210; Huber (1996), §3.5, proof of 3.5.13, p. 209; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, p. 548 (running head; the OCR file labels this block 547); Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, p. 553 (running head; the OCR file labels this block 552).)

`X = S: Ȳ = Spa(k̄^, Ā^)`, whose étale site is trivial, and both sides are the stalk `K_η̄`; `σ` acts on both by its Galois action. `X = A^1_A, K = Z/ℓ` with `ℓ ≠ p`: both sides are `Z/ℓ` in degree 0 with trivial action (closed unit disc over `k̄^)`.

*Needs:* Section 4.5; Section 4.4; `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`); `AdicSpacesPartIII`, layer R2 (`generic-fibre-fibre-products`); Mathlib IsAlgClosure; Mathlib HenselianLocalRing; Section 4.2.

Let `A` be a strictly henselian discrete valuation ring (henselian, with separably closed residue field `k(s)` of characteristic exponent `p`), `S = Spec A` with generic point `η` and closed point `s, k =` Frac `A` with its valuation topology, `k^sep ⊆ k̄` a separable and an algebraic closure of `k, Ā` the integral closure of `A` in `k̄, A^sep` the integral closure of `A` in `k^sep, k^, k̄^, A^ and Ā^ the` completions of `k, k̄, A` and `Ā`, and `I = Gal(k^sep/k)`, which is the inertia group because `k(s)` is separably closed and which acts on `k̄` through the restriction isomorphism `Aut(k̄/k) ≅ Gal(k^sep/k)` (`k̄/k^sep` is purely inseparable). Let `X → S` be locally of finite type, `E` a torsion ring prime to `p, K ∈ D⁺((X_η)_et, E)`, and `Ȳ, c` as in Section 5.5 (`Ȳ = d(X̂) ⊗̂_{k^} k̄^,` the analytic geometric generic fibre of the completion of `X` along `X_s`). Then the isomorphism of Hub96 3.5.17 composed with the identification of Section 5.5 is an isomorphism `R^+Γ(Ȳ, c^*K) ≅ R^+Γ(X_s, RΨ_η(K))`, where `RΨ_η(K)` is LPV.0's nearby-cycle complex (SGA 7 XIII 2.1.2), and it is `I`-equivariant for `I` acting on `Ȳ` through `k̄^ and` on `RΨ_η(K)` as in LPV.0; in particular `H^q(Ȳ, c^*K) ≅ H^q(X_s, RΨ_η(K))` as `E[I]`-modules for every `q`. This is the trait nearby-cycle comparison Layers 2, 4 and 5 exports on LPV.0's carriers; for torsion rings `E` with `p`-torsion the analytic statement is Hub96 3.5.17 itself, whose right side is Huber's object `i'^*Rj'_*(K|X_k̄)`, outside LPV.0's coefficient scope.

This uses `A` strictly henselian discrete valuation ring; `X → S` locally of finite type (no properness); `E` a torsion ring prime to `p` (LPV.0's scope); `K ∈ D⁺`.

(Huber (1996), §3.5, Corollary 3.5.17, p. 210; Vladimir G. Berkovich, Vanishing cycles for formal schemes, Introduction, p. 540 (running head; the OCR file labels this block 539); Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, Corollary 5.4, p. 555 (running head; the OCR file labels this block 554).)

**Checks.**

- For `X = S` the isomorphism is the identity of `K_η̄` as an `E[I]`-module.
- For `X = A^1_A` and `K = Z/ℓ, ℓ ≠ p: H⁰(Ȳ, Z/ℓ) = Z/ℓ, H^q(Ȳ, Z/ℓ) = 0` for `q ≥ 1, I` acting trivially.
- For `X` proper and smooth over `A` and `K = Z/ℓ (ℓ ≠ p)`, the composite with LPV.0 2.1.8.3 is an `I`-equivariant isomorphism `H^q(X_η̄, Z/ℓ) ≅ H^q(Ȳ, Z/ℓ)` with trivial `I`-action (`RΦ = 0` by SGA 7 XIII 2.1.5), both equal to `H^q(X_s, Z/ℓ)`.
- Replacing `RΨ_η` by LPV.0's `RΦ` is false: for `X = A^1_A`, K' `= Z/ℓ, H⁰(Ȳ, Z/ℓ) = Z/ℓ` while `H⁰(X_s, RΦ(K')) = 0`.

`X = S: R^+Γ(Spa(k̄^, Ā^), c^*K) = K_η̄ = RΨ_η(K)_s` with the Galois action on both sides. `X = A^1_A, K = Z/ℓ` with `ℓ ≠ p: Ȳ` is the closed unit disc over `k̄^ and RΨ_η(Z/ℓ) = Z/ℓ` (SGA 7 XIII 2.1.5), so `H⁰(Ȳ, Z/ℓ) = Z/ℓ, H^q(Ȳ, Z/ℓ) = 0` for `q > 0`, with trivial `I`-action (Berkovich 1994, Corollary 5.4, gives the same for smooth formal schemes). `X` proper over `A: Ȳ` is the analytification of `X_η ⊗_k k̄^,` and composing with LPV.0's proper specialization isomorphism `R^+Γ(X_η̄, K) ≅ R^+Γ(X_s̄, RΨ_η K)` (`LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.6, 2.1.8.3) gives an `I`-equivariant isomorphism `R^+Γ(X_η̄, K) ≅ R^+Γ(Ȳ, c^*K)`. The agreement with the proper algebraic comparison is the target of Section 8.2 after that comparison is constructed. LPV.2: for `X` proper and flat of odd relative dimension `n =` 2m `+ 1` over `A` whose only non-smooth point `x` of `X_s` is an ordinary quadratic point with `b(x)` a uniformizer, the Picard–Lefschetz formula `σ(a) = a + (−1)^{m+1} ε_{b(x)}(σ)(a·δ_x)δ_x` of `LefschetzPencilsAndVanishingCycles`, layer LPV.2, Section 2.8 (SGA 7 XV 3.3.6), with `δ_x`, the pairing and the twists as there, holds on `Hⁿ(Ȳ, Λ)` through the previous item; use the specified generator `δ_x`, its Tate twists and pairing, and the coefficient and ordinary-quadratic-point hypotheses of LPV.2.

*Needs:* Section 5.5; Section 4.5; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.5; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.6; `LefschetzPencilsAndVanishingCycles`, layer LPV.2, Section 2.8; `AdicSpacesPartIII`, layer R2 (`formal-completion-and-algebraic-comparison`).

Let `A →` A' be an injective local homomorphism of strictly henselian discrete valuation rings, S' `= Spec` A' `→ S = Spec A` the induced surjective morphism of traits, k' `=` Frac A', separable closures chosen with `k^sep ⊆ k'^sep`, and I' `= Gal(k'^sep/k') → I = Gal(k^sep/k)` the induced map. Let `X` be an `S`-scheme, X' `= X ×_S` S', `g`: X' `→ X, g_s: X'_s → X_s, E` a torsion ring prime to `p`, and `F ∈ D⁺(X_et, E)`. The base-change map `g_s^*RΨ_L(F) → RΨ_{L'}(g^*F)` of Section 5.2 for the morphism of quadruples (X', S', `η'`, s') `→ (X, S, η, s)` and the map of strict localizations `η̃' = Spec k'^sep → η̃ = Spec k^sep` corresponds, under Section 5.5 for `S` and for S', to LPV.0's change-of-trait morphism `g^*RΨ → RΨg^*` (SGA 7 XIII 1.3.10, derived in 2.1.7.5), I'-equivariantly. If `X → S` is locally of finite type, both are isomorphisms, by Hub96 4.2.4 (Section 5.4; the morphism of quadruples is Cartesian and dominant). SGA 7 XIII 2.1.7.5 only constructs the morphism (isomorphy is conjectured for excellent `S, S′` and proved in 2.1.12 in two cases). If `A′` is finite over `A`, Section 5.2 map is an isomorphism for every `X` and every torsion ring `E`.

This uses `A →` A' injective and local, both strictly henselian discrete valuation rings (a surjective change of traits in the sense of SGA 7 XIII 1.2.7); `E` prime to `p`; `F ∈ D⁺`; For the isomorphism clause with `A′` not finite over `A: X → S` locally of finite type (hypothesis of valuative-base-change-for-nearby-cycles).

(Pierre Deligne, Nicholas Katz (directors); Exposé XIII by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340, Exposé XIII, 1.3.10, p. 15; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, Theorem 4.9, p. 551 (running head; the OCR file labels this block 550); Pierre Deligne, Nicholas Katz (directors); Exposé XIII by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340, Exposé XIII, after 2.1.11, p. 25; Pierre Deligne, Nicholas Katz (directors); Exposé XIII by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340, Exposé XIII, Proposition 2.1.12, p. 25.)

**Checks.**

- For A' `= A[π^{1/e}], e` prime to `p`, and `X = A^1_S, F = E`: both maps are the identity of `E_{X'_s}`, I' of index `e` in `I`.
- For A' `= A` the base-change map is the identity of `RΨ_L(F)`.
- For A' finite over `A` and any torsion ring `E` Section 5.2 base-change map is an isomorphism: `X'_η̃' → X_η̃` and `X'_s → X_s` are universal homeomorphisms and `X'_(x̄') = X_(x̄) ×_S` S'.

A' `= A[π^{1/e}]` with `e` prime to `p` (`π` a uniformizer): I' is the open subgroup of index `e` in `I` and the base-change map is an I'-equivariant isomorphism. The construction makes no claim for a morphism of valuation rings that is not local, and none for `p`-torsion coefficients along a non-finite `A →` A'.

*Needs:* Section 5.5; Section 5.2; Section 5.4; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.6; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.3; Mathlib IsDiscreteValuationRing; Section 5.1.

Terminology convention. The objects denoted by `RΨ` in Huber (1996), §3.5, by `Ψ` in Berkovich’`s` formal comparison, and by `RⁱΨ` in SGA 7 XIII, §2.1.2 are the nearby-cycle object of `LefschetzPencilsAndVanishingCycles`, layer LPV.0. The vanishing-cycle object is instead the third vertex `RΦ(K′)` of the triangle sp* `i* K′ → RΨ(K′|X_η) → RΦ(K′) →`, defined for `K′ ∈ D⁺(X_et,E)` (SGA 7 XIII, (2.1.2.4)); it depends on `K′`, not just on its generic-fibre restriction. Statement. In the setting of Section 5.5 (`A` a strictly henselian discrete valuation ring, `X → S` locally of finite type, `E` a torsion ring prime to `p`), let K' `∈ D⁺(X_et, E)` and `K =` K'`|X_η`. Applying `R^+Γ(X_s, −)` to LPV.0's triangle and composing with the isomorphism of lpv-trait-comparison gives an `I`-equivariant distinguished triangle `R^+Γ(X_s, i^*K') → R^+Γ(Ȳ, c^*K) → R^+Γ(X_s, RΦ(K')) → (+1)`, whose first map is the analytic specialization map `sp_an`: pullback along `b = λ_X̂': Ȳ_et = d(X̂')_et → (X_s ×_A Ā)_et ≅ (X_s)_et` followed by `R^+Γ(Ȳ, τ)` for the transformation `τ: b^*i'^* → a^*j'^*` of Hub96 3.5.13(i) (for X' `= X ×_A Ā`, applied to K'`|`X'). Consequently `H^q(X_s, RΦ(K'))` is the cohomology of the `cone` of `sp_an`; it is not `H^q(Ȳ, c^*K)` in general.

This uses `A` strictly henselian discrete valuation ring; `X → S` locally of finite type; `E` a torsion ring prime to `p`; K' `∈ D⁺(X_et, E)` on the whole of `X: RΦ` needs the special-fibre restriction `i^*K'`, not only `K =` K'`|X_η`.

(Pierre Deligne, Nicholas Katz (directors); Exposé XIII by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340, Exposé XIII, 2.1.2, p. 19; Pierre Deligne, Nicholas Katz (directors); Exposé XIII by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340, Exposé XIII, 2.1.8.9, p. 22; Pierre Deligne, Nicholas Katz (directors); Exposé XIII by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340, Exposé XIII, 1, p. 6; Vladimir G. Berkovich, Vanishing cycles for formal schemes, Introduction, p. 540 (running head; the OCR file labels this block 539); Huber (1996), §3.5, Corollary 3.5.17, p. 210; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §3.3, p. 16.)

**Checks.**

- For `X = A^1_A` and K' `= Z/ℓ, ℓ ≠ p: RΦ(K') = 0` and `sp_an: Z/ℓ = R^+Γ(A^1_s, Z/ℓ) → R^+Γ(Ȳ, Z/ℓ)` is an isomorphism.
- For `X = Spec A[x, y]`/(xy `− π`) and `Λ = Z/ℓ, ℓ ≠ p: H¹(Ȳ, Λ) ≅ H¹(X_s, RΦ(Λ))` is free of rank one over `Λ, H⁰(Ȳ, Λ) = Λ`.
- For `X = S` the triangle is the stalk specialization triangle `K'_s → K_η̄ → RΦ(K')`.
- `R^+Γ(Ȳ, c^*K) ≅ R^+Γ(X_s, RΦ(K'))` fails for `X = A^1_A`, K' `= Z/ℓ`: the left side has `H⁰ = Z/ℓ`, the right side is 0.

`X = S`: the triangle is `K'_s → K_η̄ → RΦ(K') →`, the specialization map of stalks and its `cone`. `X` smooth over `A`, K' `= Λ` constant, `ℓ ≠ p: RΦ = 0` (SGA 7 XIII 2.1.5), so `sp_an` is an isomorphism; for `X = A^1_A` this is `R^+Γ(A^1_s, Λ) = Λ ≅ R^+Γ(closed unit disc over k̄^, Λ)`. Nodal model `X = Spec A[x, y]`/(xy `− π`), `π` a uniformizer, `Λ = Z/ℓ` with `ℓ ≠ p: X_s` is two affine lines meeting in one point (`H⁰ = Λ, H^q = 0` for `q ≥ 1`); by `LefschetzPencilsAndVanishingCycles`, layer LPV.2, Section 2.7 with `n = 1, RΦ(Λ)` is concentrated in degree 1, supported at the node, free of rank one; the triangle gives `H⁰(Ȳ, Λ) = Λ, H¹(Ȳ, Λ) ≅ H¹(X_s, RΦ(Λ))` free of rank one and `H^q(Ȳ, Λ) = 0` for `q ≥ 2`, where `Ȳ` is the closed annulus `{|π| ≤ |x| ≤ 1}` over `k̄^ `— the cohomology of an annulus.

*Needs:* Section 5.5; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.5; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.3; Section 4.4; Section 4.1; Section 4.5; `LefschetzPencilsAndVanishingCycles`, layer LPV.2, Section 2.7.

In the setting of Section 5.5 (`A` a strictly henselian discrete valuation ring, `X → S` locally of finite type, `E` a torsion ring prime to `p`, K' `∈ D⁺(X_et, E), K =` K'`|X_η`), let `U` be LPV.0's exact geometric restriction to the geometric special fibre, identified with `(X_s)_et` by topological invariance. For `σ ∈ I` let `Var(σ): U(RΦ(K')) → U(RΨ_η(K))` be its underlying variation (SGA 7 XIII 1.4.3.1, 2.1.2.5), and let `q: RΨ_η(K) → RΦ(K')` be the second map of LPV.0's equivariant triangle. In the underlying derived category, `Var(σ) ∘ U(q) = σ − 1` on `U(RΨ_η(K)), U(q) ∘ Var(σ) = σ − 1` on `U(RΦ(K'))`, and `Var(στ) = Var(σ) ∘ U(q) ∘ Var(τ) + Var(σ) + Var(τ)`. Transported along the `I`-equivariant isomorphism of Section 5.5, the endomorphism `σ − 1` of `Hⁿ(Ȳ, c^*K)` is the composite `Hⁿ(Ȳ, c^*K) → Hⁿ(X_s, U(RΦ(K'))) → Hⁿ(X_s, U(RΨ_η K)) ≅ Hⁿ(Ȳ, c^*K)`, using `Hⁿ(U(q))` and `Hⁿ(Var(σ))`. The same comparison transports the family's pullback/descent conjugation covariance: `c_Ψ(g) ∘ g^*Var(σ) ∘ c_Φ(g)⁻¹ = Var(gσg⁻¹)`, where `c_Ψ` and `c_Φ` are the descent isomorphisms of the nearby and vanishing objects. In particular `I` acts trivially on `Hⁿ(Ȳ, c^*K)` when `RΦ(K') = 0`. On LPV.1's unipotent rational realization, normalized var and the monodromy operator `N` are transported by the same comparison with their Tate twists and equivariance.

This uses As in Section 5.5; `I` acts trivially on the special-fibre part (SGA 7 XIII 1.4.3); For `N`: the action on `Hⁿ` is unipotent, as LPV.1 requires.

(Pierre Deligne, Nicholas Katz (directors); Exposé XIII by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340, Exposé XIII, 1.4.3, p. 17; Pierre Deligne, Nicholas Katz (directors); Exposé XIII by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340, Exposé XIII, 2.1.8.9, p. 22.)

**Checks.**

- For `X = A^1_A` and K' `= Z/ℓ, ℓ ≠ p`, every `σ ∈ I` acts as the identity on `Hⁿ(Ȳ, Z/ℓ)`.
- For `σ, τ ∈ I`, the transported underlying variations satisfy `Var(στ) = Var(σ) ∘ U(q) ∘ Var(τ) + Var(σ) + Var(τ)`; applying `Hⁿ` preserves this identity and the family's conjugation covariance.

`X` smooth over `A`, K' `= Λ` constant, `ℓ ≠ p: RΦ = 0` (SGA 7 XIII 2.1.5) and `I` acts trivially on `Hⁿ(Ȳ, Λ)`; for `X = A^1_A` this is the trivial action on the cohomology of the closed unit disc over `k̄^. X = S: σ − 1` on `K_η̄` factors through `RΦ(K') = cone(K'_s → K_η̄)`, as in SGA 7 XIII 1.4.3.

*Needs:* Section 5.5; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.4; `LefschetzPencilsAndVanishingCycles`, layer LPV.0, Section 0.5; `LefschetzPencilsAndVanishingCycles`, layer LPV.1.

### 5.6 Absolutely integrally closed generic extension

**Universal local acyclicity.** Use `EtaleCohomologyFoundations`, §`F`.2, `VanishingCycles.localAcyclicity`, for local acyclicity defined by strict-local specialization maps. Extend that supplier's ULA notion as `ClassicalAlgebraic.IsUniversallyLocallyAcyclic` for separated finitely presented `f:X→S` of qcqs schemes and perfect-constructible `Λ`-complexes, where `Λ` is commutative noetherian, `ℓʳΛ=0, r≥1`, and `ℓ` is a prime invertible on `S`: require local acyclicity after every scheme base change, tested on qcqs neighborhoods. Prove invariance under equivalence of complexes and base change, and form the full subcategory of ULA objects. For finite `Λ` on the common bounded constructible domain, identify this predicate with `VanishingCycles.localAcyclicity`'s ULA condition by the same strict-local comparison maps. The valuation-base specialization uses this same predicate. (SGA 4, Exposé XV, §1 and Exposé XVI, §§1–2; Hansen–Scholze, *Relative perversity*, Theorem 4.4(ii)–(iii), p. 22.)

**Checks.**

- The identity of a valuation-base scheme with a constant perfect `Λ`-complex is ULA, including after base change.
- A smooth constant family with finite locally free `Λ` coefficients is ULA.
- On a nonfield rank-one AIC valuation base, the nonzero special-fibre skyscraper `i_*Λ` for `f=`id has zero generic restriction and nonzero closed stalk, so its strict-local specialization map fails and it is not ULA.

*Needs:* `EnhancedDerivedSheaves`, §§0.1–0.4 and `EtaleCohomologyFoundations`, §§0.5–0.6; `EtaleCohomologyFoundations`, §`F`.2 (`VanishingCycles.localAcyclicity`) for the strict-local specialization definition and smooth local acyclicity.

**Relative correspondence duality.** Provide `ClassicalAlgebraic.relativeDuality` for separated finitely presented morphisms `f:X→S` of qcqs schemes, with `Λ` commutative noetherian, `ℓʳΛ=0, r≥1`, and `ℓ` a prime invertible on `S`. Construct the ambient left-completed enhanced étale derived category of Hansen–Scholze setting `(A)`, with the perfect-constructible subcategory of setting `(B)`, and `f^!` right adjoint to `Rf_`!. Prove the geometric-fibre amplitude and colimit hypotheses used to obtain this adjoint; reuse `EtaleCohomologyFoundations`, §`F`.5, `VanishingCycles.etaleExceptionalInverseImage` on its finite-cohomological-dimension domain, with its stated amplitude and colimit hypotheses, and construct the extension to the remaining qcqs bases. Define `D_X/S(A)=Rℋom_Λ(A,f^!Λ_S)`. Construct `C_S` with kernels in `D(X×_S Y,Λ)`, convolution composition and diagonal unit, and its lax coslice `C′_S` of pairs `(X,A)`. Give internal `Hom` in the ambient setting `(A)`, the dualizable-object criterion of Proposition 3.3, and preservation and detection of dualizability under the setting `(B)` inclusion. For correspondence-dualizable objects prove relative biduality, perfect constructibility, and compatibility of relative duality with arbitrary base change. Prove that perfect-constructible complexes and correspondence-dualizable objects form finitary arc-sheaves of enhanced categories, as in Theorem 2.2 and Proposition 3.7, and prove the rank-one valuation detection of Corollary 3.10 in this coefficient scope; arc covers are tested by lifting maps from rank-at-most-one valuation rings after extension. Identify correspondence dualizability with the preceding ULA predicate by Theorem 4.4 after proving the generic-extension equivalence below. This gives ULA relative biduality and base change without using that identification as an input to generic extension. `EtaleCohomologyFoundations`, §0.11 retains its curve scope. (Hansen–Scholze, *Relative perversity*, §2, settings `(A)`–`(B)` and Theorem 2.2, pp. 7–9; §3, pp. 12–18, especially Proposition 3.4, Proposition 3.7 and Corollary 3.10; Theorem 4.4, p. 22.)

**Checks.**

- For `f=`id on an algebraically closed field point and `A` a perfect `Λ`-complex, `D_X/S(A)=RHom_Λ(A,Λ)` and relative biduality is perfect-module biduality.
- For `A¹_S→S, f^!Λ_S=Λ(1)[2]`, with the normalized curve trace as counit.
- The finite split two-copy map `S⊔S→S` has exceptional pullback equal to ordinary pullback and counit addition, including over a disconnected `S`.

*Needs:* `EnhancedDerivedSheaves`, §§0.1–0.4 and `EtaleCohomologyFoundations`, §§0.5–0.11; `EtaleCohomologyFoundations`, §`F`.2 and `F`.5 (`VanishingCycles.etaleExceptionalInverseImage`) on their stated domains; `EtaleCohomologyFoundations`, §§0.5–0.6 for finite-presentation and constructible continuity. The correspondence construction and its arc descent precede generic extension; the geometric ULA identification follows it.

Let `V` be a valuation ring with algebraically closed fraction field `K` (hence `V` is absolutely integrally closed), let `ℓ` be a prime invertible in `V`, let `r≥1` and `Λ` be a commutative noetherian ring with `ℓʳΛ=0`. For separated finitely presented `f:X→Spec V` and `j:X_K→X`, generic restriction is an equivalence from the full category of perfect-constructible universally locally acyclic complexes over `Spec V` to the category of perfect-constructible complexes on `X_K`. Its specified inverse is Rj*. In particular, Rj*`F` is constructible, has finite `Tor`-amplitude and is ULA over `Spec V`; these are separate conclusions. The unit `A→`Rj*`j*A` and counit `j*Rj*F→F` are the canonical adjunction maps. The construction uses the existing étale derived/coefficient carriers, extended to qcqs schemes, and `ClassicalAlgebraic.IsUniversallyLocallyAcyclic` above.

This uses Perfect-constructible means a finite constructible stratification with locally constant perfect `Λ`-complexes on each stratum, as in Hansen–Scholze setting `(B)`; ULA is the scheme notion quantified over all base changes and geometric generizations; neither diamond ULA nor mere local acyclicity replaces it; Finite presentation and separatedness of `f` are essential in this declaration. Generic inclusion `j` is not assumed to be an open immersion at arbitrary rank; Proof order: use `ClassicalAlgebraic.relativeDuality` to establish generic extension for ambient correspondence-dualizable objects first. The geometric/valuative characterisation of ULA in Hansen–Scholze Theorem 4.4 uses Theorem 4.1 in its reverse implication and is identified with that category afterward, not assumed as an early input.

(David Hansen and Peter Scholze, Relative perversity, §2, setting (B), pp. 7–9; Theorem 4.1 and proof, pp. 19–21; Lemma 4.3, pp. 21–22; David Hansen and Peter Scholze, Relative perversity, Proposition 3.4(iii)–(iv) and proof, pp. 14–16; Lemma 3.5 and proof, p. 16; David Hansen and Peter Scholze, Relative perversity, Corollary 3.10, p. 18; Theorem 4.4 and proof, p. 22.)

Provide `aicGenericExtensionEquivalence_functor`: The forward functor is the actual generic restriction `j*` on ULA complexes; `aicGenericExtensionEquivalence_inverse`: The inverse is the ULA lift of the actual Rj* on perfect-constructible generic complexes; forgetting ULA gives Rj*; `aicGenericExtension_unit`: On every ULA object `A` the unit `A→`Rj*`j*A` is an isomorphism, with the same unit as pullback/direct-image adjunction; `aicGenericExtension_counit`: For every perfect-constructible generic `F` the counit `j*Rj*F→F` is an isomorphism; the unit and counit satisfy both triangle identities.

Provide `aicGenericExtension_perfectConstructible`: The underlying total-scheme object of the inverse lies in the imported perfect-constructible category, giving constructible cohomology and finite `Tor`-amplitude separately.

**Checks.**

- Rj* of the zero generic object is the zero total object, also in the ULA category.
- For `V=K` an algebraically closed field, the canonical adjunction unit is an isomorphism on every perfect-constructible `X`-complex, because `j` is the identity up to the canonical generic-fibre identification.
- Generic restriction of the inverse applied to `F` is canonically isomorphic to `F`, through the actual adjunction counit.
- If `A` is ULA and `j*A` is zero, then `A` is zero. This excludes a nonzero complex supported entirely on the special fibre from the domain.

The output is perfect-constructible on the total `X`, not just constructible after restricting to `X_s`. For a field `V=K` algebraically closed, restriction and Rj* identify with identity on the perfect-constructible category. ULA objects are recovered by the canonical unit; a complex supported only on the closed fibre cannot be ULA unless it is zero. For `Λ=ℤ/ℓ²` the constructible constant `ℤ/ℓ` complex need not be perfect; it is not an admissible generic input merely because its stalks are finite.

*Needs:* `ClassicalAlgebraic.relativeDuality` and `ClassicalAlgebraic.IsUniversallyLocallyAcyclic` above; `EtaleCohomologyFoundations`, §`F`.2 (`VanishingCycles.etaleBaseChange`); Section 5.3; Section 5.2; `SchemeAndStackFoundations`, Layer 2; `SchemeAndStackFoundations`, Layer 4; `EtaleCohomologyFoundations`, §§0.7–0.11; `EnhancedDerivedSheaves`, §§0.1–0.4 (`K`-injective and `K`-flat replacements); `EtaleCohomologyFoundations`, §0.5 (`ClassicalCoefficients.finitePresentationDescent`); `SchemeAndStackFoundations`, §2.15 (`etale_cohomology_limits`); `EtaleCohomologyFoundations`, §0.6 (`ClassicalCoefficients.constructibleDerivedDescent`); `EtaleCohomologyFoundations`, §0.6 (`ClassicalCoefficients.constructibleHomContinuity`); Mathlib CategoryTheory.Equivalence; Mathlib DerivedCategory; `EtaleCohomologyFoundations`, §§0.7–0.11 (the coefficient and support notation of the étale derived category); `EtaleCohomologyFoundations`, §§0.7–0.11 (bounded constructible and finite-`Tor`-amplitude complexes).

Under the exact hypotheses of aic-generic-extension-equivalence, composing its inverse with the inclusion of ULA objects into `D⁺(X,Λ)` is canonically naturally isomorphic to Rj* composed with the inclusion of perfect-constructible generic objects.

This uses Perfect-constructible means a finite constructible stratification with locally constant perfect `Λ`-complexes on each stratum, as in Hansen–Scholze setting `(B)`; ULA is the scheme notion quantified over all base changes and geometric generizations; neither diamond ULA nor mere local acyclicity replaces it; Finite presentation and separatedness of `f` are essential in this declaration. Generic inclusion `j` is not assumed to be an open immersion at arbitrary rank.

(David Hansen and Peter Scholze, Relative perversity, Theorem 4.1, pp. 19–21.)

Retain all AIC, separated finite-presentation and prime-power coefficient hypotheses of the construction. For an algebraically closed field base use the canonical generic-fibre identification.

*Needs:* Section 5.6.

Under the exact hypotheses of aic-generic-extension-equivalence, for every perfect-constructible ULA object `A` the canonical pullback/direct-image adjunction unit `A→`Rj*`j*A` is an isomorphism.

This uses Perfect-constructible means a finite constructible stratification with locally constant perfect `Λ`-complexes on each stratum, as in Hansen–Scholze setting `(B)`; ULA is the scheme notion quantified over all base changes and geometric generizations; neither diamond ULA nor mere local acyclicity replaces it; Finite presentation and separatedness of `f` are essential in this declaration. Generic inclusion `j` is not assumed to be an open immersion at arbitrary rank.

(David Hansen and Peter Scholze, Relative perversity, Theorem 4.1 and full-faithfulness proof, pp. 19–20.)

Retain all AIC, separated finite-presentation and prime-power coefficient hypotheses of the construction. For an algebraically closed field base use the canonical generic-fibre identification.

*Needs:* Section 5.6.

Under the exact hypotheses of aic-generic-extension-equivalence, Rj* of every perfect-constructible generic `F` belongs to the imported perfect-constructible category on total `X`: it has constructible cohomology and finite `Tor`-amplitude.

This uses Perfect-constructible means a finite constructible stratification with locally constant perfect `Λ`-complexes on each stratum, as in Hansen–Scholze setting `(B)`; ULA is the scheme notion quantified over all base changes and geometric generizations; neither diamond ULA nor mere local acyclicity replaces it; Finite presentation and separatedness of `f` are essential in this declaration. Generic inclusion `j` is not assumed to be an open immersion at arbitrary rank.

(David Hansen and Peter Scholze, Relative perversity, Corollary 4.2(i), pp. 19–20.)

Retain all AIC, separated finite-presentation and prime-power coefficient hypotheses of the construction. For an algebraically closed field base use the canonical generic-fibre identification.

*Needs:* Section 5.6.

In the hypotheses of aic-generic-extension-equivalence, let `V→W` be a flat map to another absolutely integrally closed valuation ring, let `L=`Frac `W, X_W=X×_V W`, and let `g:X_W→X` and `g_K:X_L→X_K` be the canonical maps. For `F` perfect-constructible on `X_K`, the canonical derived exchange `g*Rj*F→Rj_W*(g_K*F)` is an isomorphism on the total scheme `X_W`. Flatness, rather than faithful flatness, is sufficient here. The induced nearby-cycle comparison on the closed fibres additionally needs a local/faithfully flat map carrying the closed point to the closed point.

This uses Both valuation fraction fields are algebraically closed. The generic fibre maps exist by injectivity of the flat map of domains; No claim of total-scheme generic-extension base change along arbitrary nonflat maps is made; the earlier arbitrary nearby-cycle theorem has a different target.

(David Hansen and Peter Scholze, Relative perversity, Corollary 4.2(ii) and proof, pp. 19–20.)

For `V=W` the exchange is the identity. `A` localization `V→V_𝔭` is flat and is allowed on total schemes; it need not preserve the old closed point. `A` quotient `V→V/𝔭` is covered by arbitrary nearby base change but is not an input to this flat Rj* theorem.

*Needs:* Section 5.6; `SchemeAndStackFoundations`, Layer 2.

For the same separated finitely presented `X` over an AIC valuation `V` and perfect-constructible torsion coefficients `Λ`, let `D_X/V(A)=Rℋom_Λ(A,f^!Λ_V)`, using `ClassicalAlgebraic.relativeDuality` above. For `F` on `X_K`, the canonical comparison `D_X/V(Rj*F)≅`Rj*`(D_X_K/K F)` is a natural isomorphism. Relative duality and its ULA base-change comparison are those of `ClassicalAlgebraic.relativeDuality`. Passing to `X_s` gives the corresponding nearby-cycle duality comparison, with the specified relative-duality identifications; no arbitrary base-change compatibility of Verdier duality on non-ULA objects is asserted.

This uses Use perfect-constructible generic `F`, the prime-power coefficient hypotheses and AIC base of the equivalence; This is relative duality over `Spec V`, not an absolute duality based on an unspecified dualizing complex.

(David Hansen and Peter Scholze, Relative perversity, Corollary 4.2(iii) and proof, pp. 19–20.)

For `X=Spec V` the formula is derived `Λ`-module duality of a perfect complex. The comparison preserves shifts and the supplier’`s` Tate-twist convention. Finite stalks without finite `Tor`-amplitude do not satisfy the input convention.

*Needs:* Section 5.6 (`ClassicalAlgebraic.relativeDuality`); `EnhancedDerivedSheaves`, §§0.1–0.4 for derived tensor and internal `Rℋom`.

Let `X,Y` be separated finitely presented over the same AIC valuation `V`, with the same coefficient hypotheses, and let `F,G` be perfect-constructible on `X_K,Y_K`. On `(X×_V Y)`, the canonical exterior-product map `Rj_X*F ⊠^L_Λ Rj_Y*G→Rj_(X×Y)*(F⊠^L_Λ G)` is an isomorphism. All exterior products use the imported derived tensor and the two scheme projections, and the product remains separated finitely presented.

This uses Perfect-constructible factors; derived tensor is used even when coefficients are not a field; The product is over `V` on total schemes and over `K` on generic fibres.

(David Hansen and Peter Scholze, Relative perversity, Corollary 4.2(iv) and proof, pp. 19–20.)

One factor `Spec V` with generic coefficient unit gives the unit constraint. If either generic factor is zero, both sides vanish. With `Λ=ℤ/ℓ²` use derived tensor; replacing it by degreewise ordinary tensor can change the complex.

*Needs:* Section 5.6; `SchemeAndStackFoundations`, Layer 2; `EtaleCohomologyFoundations`, §§0.7–0.11 (derived tensor and internal `RHom`).

For an AIC valuation `V` and separated finitely presented `X/V`, take the inherited quadruple with `η` the generic point and `s` the closed point. Then `κ(η)=K` is algebraically closed, its chosen separable closure can be identified with `K`, and `S_(η̄)=Spec K`. For a total-scheme perfect-constructible `F`, the inherited `RΨ_L(F)=i*Rj*j*F` identifies canonically with `i*` applied to the underlying total object of the generic-extension inverse evaluated on `j*F`. This comparison preserves the specialization unit, canonical base-change maps whenever their diagrams are defined, and the inherited (now trivial) Galois action. It reconciles the stronger Rj*/ULA theorem with special-fibre constructibility without identifying the two assertions.

This uses `η` is generic for this comparison; an intermediate `η` uses the separate Milnor tube–fibre comparison; `F` is perfect-constructible, not just an arbitrary constructible `B`-module complex.

(David Hansen and Peter Scholze, Relative perversity, Corollary 4.2, pp. 19–20; Qing Lu and Weizhe Zheng, Duality and nearby cycles over general bases, Remark 4.2(a), pp. 26–27; Tomoyuki Abe, On the Serre conjecture for Artin characters in the geometric case, Lemma 1.4, pp. 4–5; Theorem 1.5 and proof, pp. 5–7; Enlin Yang and Yigeng Zhao, Cohomological Milnor formula and Saito’s conjecture on characteristic classes, §6.4, p. 46.)

For `X=Spec V` and `F=Λ_X` both constructions give `Λ` on the closed point and specialization fixes 1. For `V` an algebraically closed field, `η=s` and this becomes identity restriction. An AIC valuation of rank greater than one is allowed; its generic inclusion is not relabelled as an open immersion. An arbitrary absolute integral closure need not be a valuation ring; the valuation-ring comparison uses exactly the AIC valuation hypothesis.

*Needs:* Section 5.6; Section 5.4; Section 5.2; Section 5.1; `SchemeAndStackFoundations`, Layer 2; `EtaleCohomologyFoundations`, §§0.7–0.11 (the coefficient and support notation of the étale derived category); `EtaleCohomologyFoundations`, §§0.7–0.11.

### Examples

Take a strictly henselian valuation ring whose value group is `Z⊕Z` with lexicographic order and residue characteristic `p>0`. Its tame quotient is the product of two copies of `∏_(ℓ≠p)Z_ℓ(1)`; with `Z/ℓ` coefficients its first tame cohomology has two generators. For value group `Z[1/ℓ]`, the `ℓ`-primary tame quotient is zero: divisibility eliminates `Γ/ℓΓ`. These examples depend on the value group and cannot be recovered by declaring every valuation ring to be a DVR. (Gabber–Ramero, *Almost ring theory*, §6.2, Proposition 6.2.12 and (6.2.17), pp. 160–162; Huber (1996), Lemma 4.2.2, p. 241.)

For a sheaf on the generic point of a trait, `Ψ` retains the nearby object and its inertia action; `Φ` is the `cone` of specialization from the special-fibre object to `Ψ`. For a constant sheaf in a smooth family, specialization is an isomorphism and `Φ=0` while `Ψ` is nonzero. For a left monodromy action on `Q` with scalar values `ρ(σ)=2` and `ρ(τ)=3`, variation is `ρ−1` and `Var(στ)=5=1+2+1·2`. This endomorphism is distinct from the variation morphism `Φ→Ψ` in the specialization triangle. (SGA 7 II, Exposé XIII, §§1.4.3 and 2.1.2.5, pp. 17–19; Berkovich, *Vanishing cycles for formal schemes*, §5, pp. 552–553.)

### Dependencies

Use Layers 1–4, Mathlib’`s` valuation and ordered-group APIs, and `SchemeAndStackFoundations`, Layers 0 and 2, for finite-type schemes, henselian extension and étale descent. `ArithmeticGaloisDuality`, R02.2, supplies group cohomology and Hochschild–Serre, while the arbitrary-value-group tame extension and Gauss construction are built in Sections 5.2–5.3. `LefschetzPencilsAndVanishingCycles`, LPV.0, supplies the oriented topos, trait action and specialization triangle; Section 5.4 supplies the scoped alteration and constructibility proofs. The absolute-integral-closure argument of Section 5.6 requires flat finite-presentation descent, not finite-type descent over arbitrary nonnoetherian valuation rings.

## Layer 6: Valuation invariance, finiteness and supported exports

### 6.1 Surjective valuation base change

Let `A` and `B` be valuation rings (integral domains whose ideals are totally ordered by inclusion; every rank is allowed, including rank 0, `i.e`. fields) and let `φ: A → B` be a ring homomorphism. `φ` is a surjective map of valuation spectra if `Spec(φ): Spec B → Spec A`, the map `p ↦ φ⁻¹(p)` on prime spectra, is surjective. For valuation rings the following are equivalent: (i) `Spec(φ)` is surjective; (ii) `φ` is injective and local, `i.e`. `φ⁻¹(m_B) = m_A`; (iii) `B` is a faithfully flat `A`-module through `φ`. In this case `Spec(φ)` maps the generic point to the generic point and the closed point to the closed point. The predicate involves no topology. For microbial valuation rings (`A` has a prime `p_A` of height one, `B` has `p_B`) with their valuation topologies, `φ` is continuous if and only if `φ(p_A) ⊆ p_B`, and a continuous surjective map of valuation spectra satisfies `φ⁻¹(p_B) = p_A`. For an extension `C_3 ⊆ C_1` of algebraically closed nonarchimedean fields with open and bounded valuation subrings `C_3⁺ ⊆ C_1⁺`, the induced map `Spa(C_1, C_1⁺) → Spa(C_3, C_3⁺)` is surjective if and only if `C_3⁺ → C_1⁺` is a surjective map of valuation spectra, if and only if `C_1⁺ ∩ C_3 = C_3⁺`.

This uses `A` and `B` are valuation rings (integral domains with totally ordered ideals), of arbitrary rank; `φ: A → B` is a ring homomorphism; for the continuity clause: `A` and `B` are microbial and carry their valuation topologies; for the `Spa` clause: `C_3 ⊆ C_1` is a continuous extension of algebraically closed nonarchimedean fields and `C_i⁺ ⊆ C_i` are open and bounded valuation subrings with `C_3⁺ ⊆ C_1⁺`.

(Scholze, Étale cohomology of diamonds, Lemma 16.3, p. 93 (arXiv v4); Hiroki Kato, Étale cohomology of algebraizable rigid analytic varieties via nearby cycles over general bases, §3.2, before Definition 3.4, p. 14 (arXiv 2011.09880v2).)

Define `ValuationBase.IsSurjectiveValuationMap φ` for a ring homomorphism `φ : A → B` of commutative rings as surjectivity of Mathlib's `PrimeSpectrum.comap φ` : `Spec B → Spec A`. Mathlib writes this condition inline and has no name for it; the valuation-ring hypotheses enter only the theorems below.

Provide `ValuationBase.isSurjectiveValuationMap_iff_injective_and_isLocalHom`: for valuation domains `A, B` (Mathlib `ValuationRing`, fields included), `IsSurjectiveValuationMap φ ↔` Function.Injective `φ ∧ IsLocalHom φ`; `ValuationBase.isSurjectiveValuationMap_iff_faithfullyFlat`: for valuation domains `A, B, IsSurjectiveValuationMap φ ↔ φ`.FaithfullyFlat (Mathlib `RingHom.FaithfullyFlat`; a torsion-free module over a valuation ring is flat, and a flat map is faithfully flat iff it is surjective on spectra); `ValuationBase.IsSurjectiveValuationMap.injective`: for `A` a domain, `IsSurjectiveValuationMap φ →` Function.Injective `φ` (the zero ideal of `A` is a contracted prime); `ValuationBase.IsSurjectiveValuationMap.isLocalHom`: `IsSurjectiveValuationMap φ → IsLocalHom φ`, for arbitrary commutative rings (Mathlib `IsLocalHom.of_comap_surjective`).

Provide `ValuationBase.IsSurjectiveValuationMap.id`: `IsSurjectiveValuationMap` (RingHom.id `A`); `ValuationBase.IsSurjectiveValuationMap.comp`: `IsSurjectiveValuationMap φ → IsSurjectiveValuationMap ψ → IsSurjectiveValuationMap` (`ψ`.comp `φ`) (from `PrimeSpectrum.comap_comp`); `ValuationBase.IsSurjectiveValuationMap.of_field`: every ring homomorphism between fields is a surjective map of valuation spectra; `ValuationBase.IsSurjectiveValuationMap.comap_closedPoint`: for local domains `A, B`, PrimeSpectrum.comap `φ` sends `IsLocalRing.closedPoint B` to `IsLocalRing.closedPoint A` and the generic point `⊥` to `⊥`.

Provide `ValuationBase.IsSurjectiveValuationMap.comap_heightOnePrime`: for valuation domains `A, B` with height-one primes `p_A, p_B` (Mathlib `Ideal.height` equal to 1; these exist exactly when `A` and `B` are microbial) and `p_A ⊆ φ⁻¹(p_B)`, which for microbial valuation rings with their valuation topologies is continuity of `φ, IsSurjectiveValuationMap φ` implies `φ⁻¹(p_B) = p_A`; `ValuationBase.isSurjectiveValuationMap_iff_inter_eq`: for fields `K → L`, valuation subrings `A ⊆ K` and `B ⊆ L`, and `φ : A → B` induced by `K → L, IsSurjectiveValuationMap φ ↔ B ∩ K = A`, that is `B.comap (algebraMap K L) = A` (Mathlib `ValuationSubring.comap`); `ValuationBase.IsSurjectiveValuationMap.spa_surjective_iff`: for a continuous extension `C_3 → C_1` of algebraically closed complete nonarchimedean fields (a normed algebra) with open bounded valuation subrings `C_3⁺ ⊆ C_1⁺`, Tau Ceti's `spaComap` : `Spa(C_1, C_1⁺) → Spa(C_3, C_3⁺)` is surjective iff `IsSurjectiveValuationMap (C_3⁺ → C_1⁺)`.

**Checks.**

- For `C ⊆` C' complete algebraically closed nonarchimedean fields, the inclusion `O_C → O_{C'}` satisfies `IsSurjectiveValuationMap` (`Spec O_{C'} =` {0, m'} maps onto `{0, m}`).
- For a rank-two open bounded valuation subring `C⁺ ⊊ O_C`, the injective inclusion `C⁺ → O_C` does not satisfy `IsSurjectiveValuationMap`: the closed point of `Spec O_C` maps to the height-one prime of `C⁺`. A definition by injectivity alone fails this test.
- For a rank-two valuation ring `A` with height-one prime `p`, the local surjection `A → A/p` does not satisfy `IsSurjectiveValuationMap`: the generic point of `Spec A` is not in the image. A definition by locality alone fails this test.
- Every ring homomorphism `K → L` of fields satisfies `IsSurjectiveValuationMap (η = s)`.
- For the inclusion `ℤ_(p) → ℤ_p` of discrete valuation rings, `IsSurjectiveValuationMap` holds and agrees with Module.FaithfullyFlat `ℤ_(p) ℤ_p`.
- For a rank-two `C⁺ ⊊ O_C, Spa(C, O_C) → Spa(C, C⁺)` is not surjective (its image is the rank-one point), matching the failure of `IsSurjectiveValuationMap` for `C⁺ → O_C` and the equality `O_C ∩ C = O_C ≠ C⁺`.

For an extension `C ⊆` C' of complete algebraically closed nonarchimedean fields, `O_C → O_{C'}` is a surjective map of valuation spectra (rank one, nondiscrete). For a rank-two open bounded valuation subring `C⁺ ⊊ O_C`, the inclusion `C⁺ → O_C` is injective and not local: `Spec O_C → Spec C⁺` misses the closed point, and `Spa(C, O_C) → Spa(C, C⁺)` is not surjective. Any homomorphism of fields `K → L` (valuation rings of rank 0, `η = s`) is a surjective map of valuation spectra.

*Needs:* Mathlib ValuationRing; Mathlib PrimeSpectrum.comap; Mathlib `PrimeSpectrum.comap_comp`; Mathlib `IsLocalHom`; Mathlib `IsLocalHom.of_comap_surjective`; Mathlib Module.FaithfullyFlat; Mathlib `Module.FaithfullyFlat.of_flat_of_isLocalHom`; Mathlib `Module.FaithfullyFlat.of_comap_surjective`; Mathlib `PrimeSpectrum.comap_surjective_of_faithfullyFlat`; Mathlib `Module.Flat.flat_iff_torsion_eq_bot_of_isBezout`; Mathlib `ValuationRing.iff_local_bezout_domain`; Mathlib RingHom.FaithfullyFlat; Mathlib IsLocalRing.closedPoint; Mathlib Ideal.height; Mathlib ValuationSubring.comap; Tau Ceti TauCeti.ValuationSpectrum.spaComap; Section 1.2.

Let `V` be a valuation ring whose fraction field `K` is algebraically closed. Then `V` is absolutely integrally closed (every monic polynomial over `V` is a product of linear factors over `V`), and `V` is a strictly henselian local ring: it is henselian and its residue field is algebraically closed. In particular, for an algebraically closed nonarchimedean field `C` and an open and bounded valuation subring `C⁺ ⊆ C` (for instance `C⁺ = O_C`, or a rank-two `C⁺ ⊊ O_C`), `Spec C⁺` with its generic point `η = Spec C` and closed point `s` is the base of a quadruple `(X, Spec C⁺, η, s)` of Section 5.2 for every `C⁺`-scheme `X`, and the strict localisation of `Spec C⁺` at `η` is `η` itself.

This uses `V` is a valuation ring; the fraction field `K` of `V` is algebraically closed.

(Stacks project, More on Algebra chapter, Lemma 14.5 (Tag 0DCQ), version ed88ff78; Stacks project, More on Algebra chapter, Lemma 14.7 (Tag 0DCS), version ed88ff78; Scholze, Étale cohomology of diamonds, Lemma 16.3, p. 93 (arXiv v4).)

`V = O_C` for `C =` the completion of an algebraic closure of `Q_p`: strictly henselian with residue field an algebraic closure of `F_p`. `V = C⁺` of rank two inside `O_C`: strictly henselian, residue field algebraically closed. Non-example of the hypothesis: `Z_p` is henselian but not strictly henselian (residue field `F_p`), and its fraction field is not algebraically closed.

*Needs:* Mathlib ValuationRing; Mathlib IsAlgClosed; Mathlib HenselianLocalRing; Section 5.1.

Let `φ: A → B` be a surjective map of valuation spectra between strictly henselian valuation rings whose fraction fields `K ⊆ L` are separably closed; put `S = Spec A`, S' `= Spec B, g = Spec(φ)`, with generic points `η, η'` and closed points `s`, s', so that `g(η') = η` and `g(s') = s`. Let `f: X → S` be quasi-compact and quasi-separated, X' `= X ×_S` S' with projection `g_X, i: X_s → X` and `j: X_η → X` the inclusions of the fibres (i', j' on X'), and `g_s: X'_{s'} = X_s ⊗_{k(s)} k(s') → X_s`. Let `Λ` be a torsion ring and `F ∈ D⁺((X_η)_et, Λ)` with pullback F' `= g_{X,η}^*F` on `X'_{η'}`. Since `A` is strictly henselian and `K` is separably closed, `(X, S, η, s)` is a quadruple of Section 5.2 whose strict localisation at `η` is `η`, so `RΨF = i^*Rj_*F`, and (X', S', `η'`, s') `→ (X, S, η, s)` is a morphism of quadruples whose compatible map of strict localisations is `η' → η`, given by `K ⊆ L`. The invariance map is the composite `inv_φ(F): RΓ(X_s, RΨF) → RΓ(X'_{s'}, g_s^*RΨF) → RΓ(X'_{s'}, RΨF')` of pullback along `g_s` and `RΓ(X'_{s'}, bc_φ(F))`, where `bc_φ(F): g_s^*RΨF → RΨF'` is the base-change map of Section 5.2. Its degree-`n` components are `inv_φⁿ(F): Hⁿ(X_s, RΨF) → Hⁿ(X'_{s'}, RΨF')`. The construction is natural in `F` (a morphism of triangulated functors on `D⁺((X_η)_et, Λ)`) and in `X` for `S`-morphisms.

This uses `A, B` strictly henselian valuation rings with separably closed fraction fields `K ⊆ L`; `φ: A → B` a surjective map of valuation spectra; `f: X → S` quasi-compact and quasi-separated; `Λ` a torsion ring; `F ∈ D⁺((X_η)_et, Λ)`.

(David Hansen, Bogdan Zavyalov, Arithmetic properties of ℓ-adic étale cohomology and nearby cycles of rigid-analytic spaces, Lemma A.4.3, Appendix A.4 (arXiv 2301.01800v2); Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §1.1 (b), p. 2; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, before Theorem 4.9, printed p. 551 (GDZ OCR).)

Provide `AdicSpace.ValuationBase.invarianceMap`: `inv_φ(F): RΓ(X_s, RΨF) → RΓ(X'_{s'}, RΨF')`, the composite of pullback along `g_s` and `RΓ(X'_{s'}, bc_φ(F))`; `AdicSpace.ValuationBase.invarianceMap_eq_comp_baseChange`: `inv_φ(F) = RΓ(X'_{s'}, bc_φ(F)) ∘ g_s^*`; `AdicSpace.ValuationBase.invarianceMap_id`: For `φ = id_A, inv_φ(F)` is the identity; `AdicSpace.ValuationBase.invarianceMap_comp`: For surjective maps `φ: A → B, ψ: B → C` of such valuation rings, `inv_{ψ∘φ}(F) = inv_ψ(F') ∘ inv_φ(F)` (transitivity of bc of Section 5.2).

Provide `AdicSpace.ValuationBase.invarianceMap_natural`: `inv_φ` is a natural transformation of triangulated functors `D⁺((X_η)_et, Λ) → D⁺(Λ-Mod)`; a distinguished triangle in `F` gives a map of long exact sequences; `AdicSpace.ValuationBase.invarianceMap_restrict`: For an étale `S`-morphism `u: U → X, inv_φ` for `U` and for `X` commute with restriction along `u_s` and `u'_{s'}`; `AdicSpace.ValuationBase.invarianceMap_of_isField`: For fields `A = K, B = L, inv_φ(F)` is pullback along `X ⊗_K L → X`; `AdicSpace.ValuationBase.invarianceMap_proper`: For `f` proper, under the isomorphisms `RΓ(X_η, F) ≅ RΓ(X_s, RΨF)` and `RΓ(X'_{η'}, F') ≅ RΓ(X'_{s'}, RΨF')` of proper-nearby-cycle-cohomology, `inv_φ(F)` is the pullback `RΓ(X_η, F) → RΓ(X_η ⊗_K L, F')`.

Provide `AdicSpace.ValuationBase.invarianceMap_tube`: For microbial `A, B` and continuous `φ, inv_φ(F)` corresponds under the isomorphisms of Huber Corollary 3.5.16 (Section 4.5) to pullback of cohomology of the tubes over the closed points (proved in formal-adic-compatibility).

**Checks.**

- For `X = S = Spec A` and `F = Λ, H⁰(s, RΨΛ) = Λ, Hⁿ(s, RΨΛ) = 0` for `n > 0`, and `inv_φ⁰` is the identity of `Λ`.
- For fields `A = K ⊆ B = L (η = s), inv_φ(F)` is the pullback `RΓ(X, F) → RΓ(X ⊗_K L, F)`.
- For a rank-two `C⁺ ⊊ O_C` and the inclusion `C⁺ → O_C`, the closed point of `Spec O_C` maps to the height-one prime of `C⁺`, so (`X ⊗ O_C, Spec O_C, η`, s') `→ (X, Spec C⁺, η, s)` is not a morphism of quadruples and inv is not defined.
- For a strictly henselian discrete valuation ring `R` with fraction field `k` and `Ā` the integral closure of `R` in an algebraic closure `k̄` (a rank-one valuation ring with algebraically closed fraction field), `RΨ` over `Ā` of `X ⊗_R Ā` is the SGA 7 XIII complex `RΨ_η(F)` of `LefschetzPencilsAndVanishingCycles`, layer LPV.0 on the geometric special fibre, and for a surjective map `Ā →` Ā' of such rings inv is `RΓ` of the change-of-trait isomorphism (LPV.0, XIII 2.1.7.5).

For `X = S` and `F = Λ: RΨΛ` is the constant sheaf `Λ` on `s` (its stalk is `RΓ(Spec K, Λ) = Λ`), and `inv_φ` is the identity of `Λ`. For fields `A = K ⊆ B = L: η = s, RΨ` is the identity and `inv_φ` is pullback `Hⁿ(X, F) → Hⁿ(X ⊗_K L, F)`.

*Needs:* Section 6.1; Section 5.1; Section 5.2; `SchemeAndStackFoundations`, Layer 2; Mathlib AlgebraicGeometry.Scheme.smallEtaleTopology; Mathlib DerivedCategory; Mathlib IsSepClosed.

Let `A` be a valuation ring such that `Spec A` is a noetherian topological space (for instance `A` of finite rank, `i.e`. of finite Krull dimension), `S = Spec A`, and `f: X → S` a morphism of finite type with `X` affine. Then there is an `S`-scheme `Y` of finite presentation with `Y_red ≅ X_red` over `S`. The closed immersions `X_red → X` and `X_red → Y` are universal homeomorphisms, so they induce equivalences of étale sites `X_et ≃ (X_red)_et ≃ Y_et`, compatible with the fibres over every point of `S` and with base change along any S' `→ S`; hence the functors `i^*, Rj_*, RΨ`, the base-change maps and the invariance maps for `X` and for `Y` correspond. For quasi-compact `X` the same holds étale-locally on `X`, which suffices for sheaf-level statements about `RΨ` and its base change.

This uses `A` a valuation ring with `Spec A` a noetherian topological space; `f: X → Spec A` of finite type, `X` affine (quasi-compact for the étale-local form).

(Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Remarque 4.5, p. 13 (arXiv math/0507475v1); Stacks project, Étale Cohomology chapter, Section 45 (Tag 04DY), version ed88ff78.)

**Checks.**

- For a valuation ring of infinite rank whose primes contain an infinite strictly increasing chain `p_1 ⊊ p_2 ⊊` …, `Spec A` is not noetherian (the closed sets `V(p_n)` strictly decrease), and the lemma does not apply.

`A = C⁺` of rank two, `X = Spec C⁺[x]/I` for an ideal `I` that is not finitely generated: `Y` exists with `Y_red = X_red`, so the invariance theorem applies to `X`. `A` of rank 0 (a field): every finite type algebra is of finite presentation and `Y = X`.

*Needs:* Mathlib ValuationRing; Mathlib Algebra.FinitePresentation; Mathlib AlgebraicGeometry.LocallyOfFiniteType; `SchemeAndStackFoundations`, Layer 2.

### 6.2 Supported specialization and comparison

Let `A` be a valuation ring, `S = Spec A` with generic point `η` and closed point `s, S_0 ⊆ S` a closed subset with `s ∈ S_0` and `η ∉ S_0`, and `U_S = S ∖ S_0`. Let `f: X → S` be quasi-compact and quasi-separated, `X_0 = f⁻¹(S_0)` with closed immersion `i_0, U = f⁻¹(U_S)` with open immersion `j_U, j: X_η → X` and `i: X_s → X`, and write `RΨ_S(G) = i^*Rj_*G` for `G ∈ D⁺((X_η)_et, Λ), Λ` a torsion ring. For `E ∈ D⁺(X_et, Λ)`: (a) there are natural distinguished triangles `i_{0*}RH_{X_0}(E) → E → Rj_{U*}j_U^*E →` and `RΓ_{X_0}(X, E) → RΓ(X, E) → RΓ(U, E) →`; `(b)` restriction along `X_η ⊆ U` gives a natural map `c_U: i^*Rj_{U*}j_U^*E → RΨ_S(j^*E)`, which is an isomorphism when `U_S = {η}`; this happens exactly when `A` is microbial and `S_0 = V(p_A)` for its height-one prime `p_A`, and then `i^*i_{0*}RH_{X_0}(E) → i^*E → RΨ_S(j^*E) →` is a distinguished triangle on `X_s` (for `A` of rank one, `S_0 = {s}` and the first term is `Ri^!E`); `(c)` when `U_S ≠ {η}, c_U` need not be an isomorphism. When `A` is strictly henselian with separably closed fraction field, `RΨ_S` is the nearby-cycle functor `RΨ` of Section 5.2.

This uses `A` a valuation ring; `S_0 ⊆ Spec A` closed with `s ∈ S_0, η ∉ S_0`; `f: X → Spec A` quasi-compact and quasi-separated; `Λ` a torsion ring; `E ∈ D⁺(X_et, Λ)`.

(Stacks project, Étale Cohomology chapter, Section 79 (Tag 09XP), version ed88ff78; Stacks project, Étale Cohomology chapter, Lemma 79.3 (Tag 0A45), version ed88ff78; Hiroki Kato, Étale cohomology of algebraizable rigid analytic varieties via nearby cycles over general bases, Construction 4.2, p. 17 (arXiv 2011.09880v2); Hiroki Kato, Étale cohomology of algebraizable rigid analytic varieties via nearby cycles over general bases, §3.2, before Definition 3.4, p. 14 (arXiv 2011.09880v2).)

**Checks.**

- For `A = O_C, X = S, E = Λ`: the triangle is `0 → Λ → Λ →` with identity middle map; `H^n_s(Spec O_C, Λ) = 0` for all `n`.
- For `A = C⁺` of rank two, `S_0 = {s}, X = S, E = j_{U*}ι_*Λ` with `ι` the inclusion of the point `p_A` of `U_S: (i^*Rj_{U*}j_U^*E)_s = Λ` but `RΨ_S(j^*E) = 0`, so for `Λ≠0, c_U` is not an isomorphism.
- For `A = C⁺` of rank two and `S_0 = V(p_A): c_U` is an isomorphism for every `E`.

Rank one, nondiscrete: `A = O_C, S_0 = {s}: Ri^!E → i^*E → RΨ(E|X_η) →`. For `X = S` and `E = Λ: RΨΛ = Λ` and `i^*Λ → RΨΛ` is the identity, so `RΓ_s(Spec O_C, Λ) = 0`. Higher-rank plus ring: `A = C⁺` of rank two with `S_0 = V(p_A) = {p_A, s}` gives the triangle, while `S_0 = {s}` gives the counterexample of `(c)`. `η = s`: for `A` a field there is no closed `S_0` containing `s` and not `η`, so the statement is vacuous; `RΨ_S` is the identity and the localization triangle for `S_0 = ∅` is `0 → E → E →`, with identity on `E`.

*Needs:* Section 5.2; Section 5.1; `SchemeAndStackFoundations`, Layer 2; Mathlib ValuationRing; Mathlib AlgebraicGeometry.Scheme.smallEtaleTopology.

Let `A` be a strictly henselian valuation ring with separably closed fraction field `K, S = Spec A, f: X → S` proper, `i: X_s → X, j: X_η → X`, and `Λ` a torsion ring (no condition relating `Λ` to the residue characteristic). (a) For every `E ∈ D⁺(X_et, Λ)`, restriction `RΓ(X, E) → RΓ(X_s, i^*E)` is an isomorphism. `(b)` For every `F ∈ D⁺((X_η)_et, Λ)`, the composite `RΓ(X_η, F) = RΓ(X, Rj_*F) → RΓ(X_s, i^*Rj_*F) = RΓ(X_s, RΨF)` is an isomorphism. `(c)` If moreover `A` is microbial and `X_0 = f⁻¹(V(p_A))`, then for `E ∈ D⁺(X_et, Λ)` the isomorphisms (a) and `(b)` identify the local-cohomology sequence of `X_0 ⊆ X` (… `→ H^n_{X_0}(X, E) → Hⁿ(X, E) → Hⁿ(X_η, E) →` …) with the cohomology sequence of the specialisation triangle `i^*E → RΨ(E|X_η) → RΦ(E) →` on `X_s`, where `RΦ(E)` is a `cone` of `i^*E → RΨ(E|X_η)`; in particular `H^n_{X_0}(X, E) ≅ H^{n−1}(X_s, RΦ(E))`.

This uses `A` a strictly henselian valuation ring with separably closed fraction field; `f: X → Spec A` proper; `Λ` a torsion ring; for `(c): A` microbial.

(Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §1.1 (a)(i), (1.1.4), p. 2; Stacks project, Étale Cohomology chapter, Theorem 91.11 (Tag 095T), version ed88ff78; Stacks project, Étale Cohomology chapter, Lemma 92.3 (Tag 0F0C), version ed88ff78; Stacks project, Étale Cohomology chapter, Lemma 91.3 (Tag 0A3S), version ed88ff78; Stacks project, Étale Cohomology chapter, Section 45 (Tag 04DY), version ed88ff78.)

**Checks.**

- For microbial `A` the generic point is open; `X = Spec K ⊆ S` is an open subscheme with `X_s = ∅`, so `RΓ(X_s, RΨΛ) = 0` while `RΓ(X_η, Λ) = Λ`: properness cannot be dropped in `(b)`.
- For `A` of residue characteristic `p` and `Λ = Z/p, (b)` holds for `X = P¹: Hⁿ(P^1_k, RΨ Z/p) ≅ Hⁿ(P^1_C, Z/p)`; no prime-to-`p` hypothesis is used.
- For `C` the completed algebraic closure of `𝔽_p((t))`, `A = O_C` and `Λ = 𝔽_p`, proper comparison still holds, but `H²(P¹_k,RΨ𝔽_p) ≅ H²(P¹_C,𝔽_p) = 0` (Stacks, Tag 0A3N); the invertible-coefficient Tate-twist calculation does not apply.

Nondiscrete rank one: `A = O_C, X = P¹_{O_C}, Λ = ℤ/ℓʳ` with `ℓ` prime, `r ≥ 1` and `ℓ ≠ char C`: `H^q(P¹_k, RΨΛ) ≅ H^q(P¹_C, Λ)`, which is `Λ`, 0, `Λ(−1)` for `q = 0`, 1, 2. This requires invertibility in `C`, including `ℓ = p` in mixed characteristic. Higher-rank plus ring: `A = C⁺` of rank two, `X = P¹`: the same groups for these coefficients; `(c)` applies with `X_0` the fibre over `V(p_A)`. `η = s: A = K` a field, `X_s = X_η = X` and `RΨ` is the identity; (a), `(b)` are tautological. Trait analogue: over the normalisation of a strictly henselian discrete valuation ring in an algebraic closure of its fraction field, `(b)` is the isomorphism `RΓ(X_η̄, K) → RΓ(X_s̄, RΨ_η K)` of SGA 7 XIII 2.1.8.3 for proper `f` (`LefschetzPencilsAndVanishingCycles`, layer LPV.0).

*Needs:* Section 5.2; Section 5.1; Section 6.2; `SchemeAndStackFoundations`, Layer 2; Mathlib AlgebraicGeometry.IsProper.

Let `φ: A → B` be a surjective map of valuation spectra between strictly henselian valuation rings whose fraction fields `K =` Frac `A` and `L =` Frac `B` are separably closed; `S = Spec A`, S' `= Spec B`, with generic points `η, η'` and closed points `s`, s'. Let `f: X → S` be of finite presentation, or of finite type with `Spec A` a noetherian topological space (for instance `A` of finite rank). Let `Λ` be a ring with `mΛ = 0` for an integer `m` invertible in `A` (equivalently in `k(s)`), and let `F ∈ D⁺((X_η)_et, Λ)`, with F' its pullback to `X'_{η'}` for X' `= X ×_S` S'. Then: (i) the base-change map `bc_φ(F): g_s^*RΨF → RΨF'` is an isomorphism in `D⁺((X'_{s'})_et, Λ)`; (ii) the invariance map `inv_φ(F): RΓ(X_s, RΨF) → RΓ(X'_{s'}, RΨF')` is an isomorphism, so `Hⁿ(X_s, RΨF) ≅ Hⁿ(X'_{s'}, RΨF')` for every `n`; (iii) if `f` is proper, the conclusion of (ii) holds for every torsion ring `Λ`, and reads `RΓ(X_η, F) ≅ RΓ(X'_{η'}, F')`. No invariance is asserted for a map of valuation rings that is not surjective on spectra, and (i)–(ii) are not asserted when the residue characteristic of `A` divides the annihilator of `Λ`.

This uses `A, B` strictly henselian valuation rings; `K =` Frac `A` and `L =` Frac `B` separably closed; `φ: A → B` a surjective map of valuation spectra; `f: X → Spec A` of finite presentation, or of finite type with `Spec A` a noetherian topological space; `Λ` a ring with `mΛ = 0` for an integer `m` invertible in `A` (for (i) and (ii)); `Λ` an arbitrary torsion ring and `f` proper for (iii); `F ∈ D⁺((X_η)_et, Λ)`.

(Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Introduction, p. 1 (arXiv math/0507475v1); Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Remarque 4.4, p. 13 (arXiv math/0507475v1); Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Remarque 4.5, p. 13 (arXiv math/0507475v1); Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, Remarks 3.3 (c), p. 7; Qing Lu, Weizhe Zheng, Duality and nearby cycles over general bases, Example 4.26 (2), §4.5 (arXiv 1712.10216v7); Stacks project, Étale Cohomology chapter, Lemma 90.2 (Tag 0F0B), version ed88ff78; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, proof of Theorem 4.9, Step 2, printed p. 552 (GDZ OCR); Stacks project, Étale Cohomology chapter, Lemma 92.1 (Tag 0DDG), version ed88ff78; Scholze, Étale cohomology of diamonds, Lemma 16.3, p. 93 (arXiv v4).)

**Checks.**

- For a rank-two `C⁺ ⊊ O_C`, the inclusion `C⁺ → O_C` is not a surjective map of valuation spectra. With `X = S = Spec C⁺` and `G = j_`!`Λ` the extension by zero from the open subscheme `Spec O_C = S ∖ {s}: H⁰(S, G) = 0` (`S` is strictly local and `G_s = 0`), while the pullback of `G` to `Spec O_C` is `Λ` with `H⁰ = Λ`. No invariance is asserted for this map.
- For algebraically closed fields `K ⊊ L` of characteristic `p` (valuation rings of rank 0, `η = s`), `X = A^1_K` and `Λ = Z/p`: by the Artin–Schreier sequence `H¹(A^1_K, Z/p) ≅ K[x]/{gᵖ − g}`, and the map to `H¹(A^1_L, Z/p) ≅ L[x]/{gᵖ − g}` misses the class of `λx` for `λ ∈ L ∖ K`. Here `m = p` is not invertible, so (i)–(ii) are not asserted, and (iii) does not apply as `A¹` is not proper.
- For algebraically closed fields `K ⊆ L` of characteristic `p` and `X = P¹`, (iii) gives `Hⁿ(P^1_K, Z/p) ≅ Hⁿ(P^1_L, Z/p)` for all `n` although `m = p` (Stacks Tag 0DDG).

Nondiscrete rank one: `A = O_C → B = O_{C'}` for complete algebraically closed `C ⊆` C', `X = P^1_{O_C}, Λ = Z/ℓ` with `ℓ ≠ p: H²(P^1_k, RΨΛ) ≅ H²(P^1_{k'}, RΨΛ) ≅ Λ(−1)` and `H¹ = 0` on both sides. Higher-rank plus ring: `A = C⁺` of rank two `→ B = C'⁺` with `C'⁺ ∩ C = C⁺`: (i)–(iii) apply; for `X = P¹` the groups are `Λ`, 0, `Λ(−1)`. `η = s`: for fields `A = K ⊆ B = L`, (ii) is Stacks Lemma 90.2 (Tag 0F0B) for `X` over `K`. Trait analogue: over the normalisation of a strictly henselian discrete valuation ring in an algebraic closure of its fraction field, (i) is the change-of-trait isomorphism of SGA 7 XIII 2.1.7.5 (`LefschetzPencilsAndVanishingCycles`, layer LPV.0).

*Needs:* Section 6.1; Section 6.2; Section 5.1; Section 5.2; Section 5.4; `SchemeAndStackFoundations`, Layer 2; Mathlib IsSepClosed; Mathlib ValuationRing; Mathlib AlgebraicGeometry.LocallyOfFinitePresentation; Mathlib AlgebraicGeometry.IsProper.

Let `A` be a strictly henselian valuation ring with separably closed fraction field `K, S = Spec A`, and `f: X → S` separated of finite presentation, with a compactification `X →(j_X) X̄ →(f̄) S` (`j_X` a quasi-compact open immersion, `f̄` proper; `EtaleCohomologyFoundations`, §`G`.2 (`nagataCompactification`), supplies one over the qcqs base `S`). Let `Λ` be a torsion ring, `F ∈ D⁺((X_η)_et, Λ)`, and `RΓ_c(X_η, F) = RΓ(X̄_η, j_{X,η!}F)`. (a) There is a natural isomorphism `RΓ_c(X_η, F) ≅ RΓ(X̄_s, RΨ_{X̄}(j_{X,η!}F))`, compatible with the canonical identifications between compactifications of `ClassicalAlgebraic.properSupports` in `EtaleCohomologyFoundations`, §0.8, using `EtaleCohomologyFoundations`, §`G`.3 (`compactificationCommonRefinement`), hence independent of `X̄`. `(b) RΨ_{X̄}(j_{X,η!}F)` restricts to `RΨ_X(F)` on `X_s`; adjunction gives `j_{X,s!}RΨ_X(F) → RΨ_{X̄}(j_{X,η!}F)` and a distinguished triangle `RΓ_c(X_s, RΨ_X F) → RΓ_c(X_η, F) → RΓ(∂_s, RΨ_{X̄}(j_{X,η!}F)|_{∂_s}) →`, where `∂_s = X̄_s ∖ X_s`. In particular `RΓ_c(X_s, RΨ_X F) → RΓ_c(X_η, F)` is an isomorphism when `f` is proper.

This uses `A` a strictly henselian valuation ring with separably closed fraction field; `f: X → Spec A` separated of finite presentation; a compactification `X ⊆ X̄` over `S` (open immersion followed by a proper morphism); `Λ` a torsion ring; `F ∈ D⁺((X_η)_et, Λ)`.

(Hiroki Kato, Étale cohomology of algebraizable rigid analytic varieties via nearby cycles over general bases, Construction 4.3, p. 17 (arXiv 2011.09880v2); Hiroki Kato, Étale cohomology of algebraizable rigid analytic varieties via nearby cycles over general bases, §1.2, p. 3 (arXiv 2011.09880v2); Stacks project, Étale Cohomology chapter, Theorem 91.11 (Tag 095T), version ed88ff78; Stacks project, Étale Cohomology chapter, Lemma 79.3 (Tag 0A45), version ed88ff78.)

**Checks.**

- For `A = O_C` and `X = Spec C ⊆ X̄ = Spec O_C: RΓ_c(X_s, RΨ_X Λ) = 0` but `RΓ_c(X_η, Λ) = Λ`; compact support on the special fibre is not compact support on the generic fibre when `f` is not proper.
- For `f` proper and `X̄ = X`, the map `RΓ_c(X_s, RΨ_X F) → RΓ_c(X_η, F)` equals the isomorphism of proper-nearby-cycle-cohomology `(b)`.

Degenerate: `f` proper, `X̄ = X, ∂_s = ∅`, and `(b)` reduces to proper-nearby-cycle-cohomology. Boundary example (nondiscrete rank one): `A = O_C, X = Spec C ⊆ X̄ = S`. Then `X_s = ∅, RΓ_c(X_η, Λ) = Λ, ∂_s = {s}` and `RΨ_S(Λ)_s = Λ`: the triangle is `0 → Λ → Λ →`. Higher-rank plus ring: `A = C⁺` of rank two with `X = Spec O_C ⊆ S: X_η = Spec C, X_s = ∅`, and `RΓ_c(Spec C, Λ) = Λ` is carried entirely by the boundary point `s`. Trait analogue: over the normalisation of a strictly henselian discrete valuation ring in an algebraic closure of its fraction field, the map of `(b)` is the map `RΓ_c(X_s̄, RΨ_η K) → RΓ_c(X_η̄, K)` of SGA 7 XIII 2.1.8.4 (`LefschetzPencilsAndVanishingCycles`, layer LPV.0).

*Needs:* Section 6.2; Section 5.2; `EtaleCohomologyFoundations`, §§0.5–0.6; `EtaleCohomologyFoundations`, §0.8 (`ClassicalAlgebraic.properSupports`); `EtaleCohomologyFoundations`, §§`G`.1–`G`.3 (`Compactification`, `nagataCompactification`, `compactificationCommonRefinement`); `EtaleCohomologyFoundations`, §`F`.2.1 (`VanishingCycles.properBaseChange`); `SchemeAndStackFoundations`, Layer 2; Mathlib AlgebraicGeometry.LocallyOfFinitePresentation.

Let `A` be a strictly henselian valuation ring with separably closed fraction field `K, S = Spec A, f: X → S` of finite type with fibres of dimension `≤ N`. Let `Λ` be a noetherian ring with `mΛ = 0` for an integer `m` invertible in `A`, and `F ∈ D^b_c((X_η)_et, Λ)` with cohomology sheaves in degrees `[a, b]`. Then: (i) `RΨF ∈ D^b_c((X_s)_et, Λ)`, with `R^nΨF = 0` for `n ∉` [a, `b +` 2N]; (ii) for every closed subscheme `L ⊆ X_s` proper over `k(s)` (for instance `L = X_s` when `f` is proper), each `Hⁿ(L, RΨF|_L)` is a finitely generated `Λ`-module and vanishes for all but finitely many `n`; (iii) for every locally closed subscheme `L ⊆ X_s` separated over `k(s)`, each `H^n_c(L, RΨF|_L)` is finitely generated, with compact supports as in `EtaleCohomologyFoundations`, §`F`.2.5; (iv) if `f` is proper, `Hⁿ(X_η, F) ≅ Hⁿ(X_s, RΨF)` is finitely generated, and if `f` is separated of finite presentation, `H^n_c(X_η, F)` is finitely generated.

This uses `A` a strictly henselian valuation ring with separably closed fraction field; `f: X → Spec A` of finite type with fibres of dimension `≤ N` (of finite presentation and separated for the compactly supported part of (iv)); `L` separated over `k(s)` for (iii); `Λ` noetherian with `mΛ = 0, m` invertible in `A`; `F ∈ D^b_c((X_η)_et, Λ)` with cohomology in degrees `[a, b]`.

(Luc Illusie, Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo, §1.1 (b), p. 2; Vladimir G. Berkovich, Vanishing cycles for formal schemes, §5, proof of Corollary 5.5 (GDZ OCR); Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), §6 Énoncés, p. 16 (arXiv math/0507475v1); Fabrice Orgogozo, Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un), Proposition 2.3, p. 3 (arXiv math/0507475v1); Stacks project, Étale Cohomology chapter, Situation 83.1 statement (5) (Tag 0A57), version ed88ff78; Stacks project, Étale Cohomology chapter, Situation 83.1 statement (4) (Tag 0A56), version ed88ff78.)

**Checks.**

- For an algebraically closed field `K` of characteristic `p (A = K, η = s), H¹(A^1_K, Z/p) ≅ K[x]/{gᵖ − g}` is infinite: ordinary cohomology of a non-proper `L` with `p`-torsion coefficients is not finite, and the construction claims finiteness only for proper `L` and for compact supports, with `m` invertible for (i).
- For `X = A^N_A` and `F = Λ` (smooth, so `RΨΛ = Λ` by local acyclicity), `R^nΨΛ = 0` for `n > 0`, within the bound [0, 2N].
- For algebraically closed `A=k`, the affine line with doubled origin `X`, `η=s` and `F=ℤ/ℓ` with `ℓ` invertible in `k`, (i) gives `RΨF=F`. The choice `L=X` does not meet (iii)'s separatedness hypothesis: it cannot be an open subscheme of a proper `k`-scheme. Either affine-line chart is separated and does meet (iii).

Nondiscrete rank one: `A = O_C, X = E` an elliptic curve over `O_C` with good reduction, `F = Z/ℓⁿ` with `ℓ ≠ p: H¹(E_s, RΨF) ≅ H¹(E_C, Z/ℓⁿ) ≅ (Z/ℓⁿ)²`. Higher-rank plus ring: `A = C⁺` of rank two, `X = P¹`: the groups of (iv) are `Λ`, 0, `Λ(−1)`. `η = s: A = K` a field, `RΨF = F` and (ii)–(iii) are the finiteness theorems over `K`.

*Needs:* Section 5.4; Section 5.2; Section 6.2; `SchemeAndStackFoundations`, Layer 2; Mathlib AlgebraicGeometry.LocallyOfFiniteType; Mathlib AlgebraicGeometry.IsProper; Section 5.3; `EtaleCohomologyFoundations`, §§0.5–0.6 and §`F`.2.5 (`VanishingCycles.compactSupportCohomology`, on separated finite-type schemes over a field; Stacks, Definition 63.12.1, tag 0GJZ).

Let `A` be a strictly henselian microbial valuation ring with separably closed fraction field `K` and its valuation topology, `a ∈ p_A` a nonzero element of its height-one prime, `S = Spec A, f: X → S` locally of finite type, `X^ the` a-adic completion of `X` (of type `(S)` by Section 4.5 3.5.16), `X_0 = X ×_S V(p_A), T ⊆ d(X^)` the preimage of the closed point of `d(Spf A) = Spa(K, A), Z = (d(X^), T)` and `c: Z → X_η` the natural morphism. Let `Λ` be a torsion ring and `F ∈ D⁺((X_η)_et, Λ)`. (i) The isomorphism `κ_X: RΓ(Z, c^*F) ≅ RΓ(X_s, i^*Rj_*F)` of 3.5.16 has target `RΓ(X_s, RΨF), RΨ` the nearby-cycle functor of Section 5.2 (`X_η ⊆ X` is open and the strict localisation at `η` is `η`). (ii) For every closed subset `L` of `X_0` contained in `X_s`, the sheaf-level isomorphism of 3.5.13 restricted to `L` gives `κ_{X,L}: RΓ(d(X^, L), c_L^*F) ≅ RΓ(L, RΨF|_L)`, with `κ_{X,X_s} = κ_X`, compatible with restriction to closed L' `⊆ L` and with extension by zero from open L' `⊆ L` (3.5.11). (iii) Let `φ: A → B` be a continuous surjective map of valuation spectra to a ring `B` of the same kind (fraction field `L`), `X_B = X ×_S Spec B`. The morphism `d(X_B^) → d(X^)` maps the tube `Z_B` over the closed point of `Spa(L, B)` into `Z`, and pullback of tube cohomology `RΓ(Z, c^*F) → RΓ(Z_B, c_B^*F_B)` corresponds under `κ_X` and `κ_{X_B}` to the invariance map `inv_φ(F)`. (iv) For `A = O_C` complete of rank one (necessarily nondiscrete, its fraction field `C` being separably closed), `T = d(X^)` and `κ_X` is `RΓ(X_s, −)` applied to the isomorphism `i^*Rj_*F ≅ Rb_*a^*F` of 3.5.13, with `b: d(X^)_et → X^_et ≅ (X_s)_et` and a: `d(X^)_et → (X_η)_et`: the algebraic nearby cycles are the analytic nearby cycles of the completion.

This uses `A` a strictly henselian microbial valuation ring with separably closed fraction field, with its valuation topology; `f: X → Spec A` locally of finite type; `Λ` a torsion ring; `F ∈ D⁺((X_η)_et, Λ)`; for (ii): `L` a closed subset of `X_0` contained in `X_s`; for (iii): `φ: A → B` continuous and a surjective map of valuation spectra, `B` of the same kind.

(Hiroki Kato, Étale cohomology of algebraizable rigid analytic varieties via nearby cycles over general bases, Construction 4.2, p. 17 (arXiv 2011.09880v2); Hiroki Kato, Étale cohomology of algebraizable rigid analytic varieties via nearby cycles over general bases, Definition 3.3, p. 14 (arXiv 2011.09880v2); David Hansen, Bogdan Zavyalov, Arithmetic properties of ℓ-adic étale cohomology and nearby cycles of rigid-analytic spaces, Theorem A.4.4, Appendix A.4 (arXiv 2301.01800v2); David Hansen, Bogdan Zavyalov, Arithmetic properties of ℓ-adic étale cohomology and nearby cycles of rigid-analytic spaces, proof of Theorem A.4.4 (arXiv 2301.01800v2); Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, before Theorem 4.9, printed p. 551 (GDZ OCR).)

Nondiscrete rank one: `A = O_C, X = A^1_{O_C}, Λ` killed by an integer prime to `p: Z` is the closed unit disc over `C`, and `κ_X` identifies `RΓ(Z, Λ)` with `RΓ(A^1_k, RΨΛ) = RΓ(A^1_k, Λ) = Λ` (`RΨΛ = Λ` by local acyclicity of the smooth morphism). Higher-rank plus ring: `A = C⁺` of rank two, `X = A^1_{C⁺}: Z` is the tube in the closed unit disc over the closed point of `Spa(C, C⁺)`, and `κ_X` identifies its cohomology with `RΓ(A^1_k, RΨΛ)` for the residue field `k` of `C⁺`. Support: for `L` a closed point `x` of `X_s, κ_{X,{x}}` identifies the cohomology of the full specialization support `d(X^, {x})` with the stalk `(RΨF)_x̄`. Trait: over the normalisation of a strictly henselian discrete valuation ring in an algebraic closure of its fraction field, (i) and (iv) are the identification of Section 4.5 with `LefschetzPencilsAndVanishingCycles`, layer LPV.0 `RΨ`.

*Needs:* Section 4.5; Section 4.4; Section 4.3; Section 4.2; Section 6.1; Section 6.2; Section 5.2; Section 5.1; Section 1.1; Section 1.2.

Let `C_3 ⊆ C_1` be a continuous extension of complete algebraically closed nonarchimedean fields with open and bounded valuation subrings `C_3⁺ ⊆ C_1⁺` such that `Spa(C_1, C_1⁺) → Spa(C_3, C_3⁺)` is surjective (equivalently `C_1⁺ ∩ C_3 = C_3⁺`). Let `X` be a `C_3⁺`-scheme of finite presentation, or of finite type when `Spec C_3⁺` is noetherian, `X_1 = X ⊗_{C_3⁺} C_1⁺`, and for `i ∈` {1, 3} let `Z_i ⊆ d(X_i^)` be the tube over the closed point of `Spa(C_i, C_i⁺)` with `c_i: Z_i → (X_i)_{C_i}` (Section 4.5 3.5.16). Let `n>0` be an integer that is a unit in `C_3⁺` (hence in `C_1⁺`), `Λ` a ring with `nΛ = 0, F ∈ D⁺((X_{C_3})_et, Λ)` and `F_1` its pullback. Then pullback `RΓ(Z_3, c_3^*F) → RΓ(Z_1, c_1^*F_1)` is an isomorphism. In particular, for a Zariski-open `V ⊆ X_{C_3}` and an abelian group `M` killed by `n, Hⁱ(Z_3, c_3^*j_{V!}M) ≅ Hⁱ(Z_1, c_1^*j_{V!}M)` for all `i`. This is the algebraizable, extension-by-zero case of the input [Hub96, Theorem 4.1.1`(c)`] used in ECD Lemma 16.3; Layer 7 passes from it to affinoids topologically of finite type over `C_3`, to perfectoid limits and to quasi-compact adic open subsets.

This uses `C_3 ⊆ C_1` complete algebraically closed nonarchimedean fields, continuous extension; `C_i⁺ ⊆ C_i` open and bounded valuation subrings with `C_3⁺ ⊆ C_1⁺` and `Spa(C_1, C_1⁺) → Spa(C_3, C_3⁺)` surjective; `X` of finite presentation over `C_3⁺` (or of finite type with `Spec C_3⁺` noetherian); `n>0` a unit in `C_3⁺, nΛ = 0, F ∈ D⁺((X_{C_3})_et, Λ)`.

(Huber (1996), Theorem 4.1.1(c), p. 238, with char⁺ computed from the plus-ring residue fields; Scholze, Étale cohomology of diamonds, Lemma 16.3, p. 93 (arXiv v4), for the perfectoid residue-characteristic-p specialization; Scholze, Étale cohomology of diamonds, proof of Lemma 16.3, p. 93 (arXiv v4); Vladimir G. Berkovich, Vanishing cycles for formal schemes, §4, before Theorem 4.9, printed p. 551 (GDZ OCR); Hiroki Kato, Étale cohomology of algebraizable rigid analytic varieties via nearby cycles over general bases, §1.2, p. 3 (arXiv 2011.09880v2).)

Nondiscrete rank one: `C_3 = C_p` (completed algebraic closure of `Q_p`) `⊆ C_1` a larger complete algebraically closed field, `C_i⁺ = O_{C_i}, X = G_{m,O_{C_3}}, F = Z/ℓ`: the tubes are the unit circles `{|x| = 1}` and `H¹ ≅ Z/ℓ(−1)` on both sides. Higher-rank plus ring: `C_3⁺ ⊊ O_{C_3}` of rank two and `C_1⁺ =` the valuation ring of `C_1` with `C_1⁺ ∩ C_3 = C_3⁺`: the conclusion holds; for `C_1⁺ = O_{C_1} ⊋ C_3⁺` the surjectivity hypothesis fails and nothing is asserted; the conclusion of ECD Lemma 16.3 fails for that map with `X_2 = X_3` and `U_2` the rank-one point, which is why the lemma assumes surjectivity. Degenerate: `C_1 = C_3, C_1⁺ = C_3⁺`: the map is the identity.

*Needs:* Section 6.1; Section 6.2; Section 4.5; Section 1.2.

**Checks.**

- For the identity field-pair extension the comparison is the identity.
- In perfectoid residue characteristic `p>0, n` is a plus-ring unit precisely when `n` is prime to p.
- If the rank-one residue characteristic is zero and `C_3⁺` has a secondary residue characteristic `ℓ, n=ℓ` is prime to the rank-one exponent 1 but is not a plus-ring unit; this invariance assertion does not apply.

### 6.3 Total cohomology and adjunction descent

Let `V → W` be a faithfully flat homomorphism of valuation domains whose fraction fields are algebraically closed. Fix a prime `ℓ` invertible in `V` and a commutative coefficient ring `Λ` killed by `ℓⁿ, n > 0`. For any qcqs `V`-scheme `X` and `E ∈ D⁺(X_ét, Λ)`, put `X_W = X ×_V W` and `g: X_W → X`. The canonical cohomology pullback `β_g(E): RΓ(X,E) → RΓ(X_W,g*E)`, obtained from `E →` Rg*`g*E` and the direct-image/global-sections composition isomorphism, is an isomorphism in `D⁺(Λ)`. Consequently `H^q(X,E) → H^q(X_W,g*E)` is an isomorphism for every integer `q`. There is no finite-type or constructibility assumption in this bounded-below form.

This uses `V` and `W` are valuation domains, with no rank, completeness, discreteness or microbial hypothesis; `φ: V → W` is faithfully flat; equivalently in this valuation setting it is injective and local, and `Spec W → Spec V` is surjective; `ℓ` is prime, `n > 0, Λ` is a commutative ring with `ℓⁿΛ = 0`, and `ℓ` is a unit of `V` (therefore also of `W`); `X` is qcqs over `Spec V`; `E` belongs to `D⁺(X_ét, Λ)`; Both fraction fields are algebraically closed; since valuation domains are normal, these are absolutely integrally closed valuation rings.

(David Hansen and Peter Scholze, Relative perversity, Corollary 4.5 and proof, §4, printed pp. 22–23; coefficient setting (A), §1 p. 2 and §2 pp. 7–8; David Hansen and Peter Scholze, Relative perversity, Lemma 3.5, §3, pp. 16–17; Theorem 4.1 and Corollary 4.2(ii), §4, pp. 19–22; The Stacks Project authors, The Stacks Project: valuation rings, étale invariance and supports, Lemma 15.14.5 (0DCQ) and Lemma 59.90.2 (0F0B), unpaginated HTML; Bhargav Bhatt and Peter Scholze, The pro-étale topology for schemes, §5 Corollary 5.1.6, p. 35; Proposition 5.2.6, p. 37; Lemmas 5.4.1 and 5.4.3, p. 39, in the author copy; Lemma 5.4.3 pp. 153–154 in Astérisque 369 (2015).)

Identity valuation map: `β_id` is the identity, including on nonzero constant coefficients. Rank zero: `V` and `W` algebraically closed fields gives the classical invariance of Stacks 0F0B. Nondiscrete rank one: `V = O_C` and `W = O_D` for an isometric extension of algebraically closed valued fields, with `ℓ` invertible in `O_C`; arbitrary qcqs `X` and bounded-below `E` are allowed. Higher rank: any local injective extension of rank-two absolutely integrally closed valuation rings has the same conclusion; neither completion nor rank-one replacement enters the statement. Non-surjective exclusion: for a nonfield rank-one such `V, V →` Frac `V` is flat but not faithfully flat. For `E = i*Λ` supported at the closed point, `RΓ(Spec V,E) = Λ` in degree zero while its generic pullback is zero.

*Needs:* Section 6.1; `EtaleCohomologyFoundations`, §§0.7–0.11 (the coefficient and support notation of the étale derived category); `SchemeAndStackFoundations`, Layer 2; Layer 5; `SchemeAndStackFoundations`, §2.15 (`etale_cohomology_limits`); Mathlib ValuationRing; Mathlib Module.FaithfullyFlat; Mathlib IsAlgClosed; Mathlib FractionRing; Mathlib DerivedCategory.Plus; Mathlib HasDerivedCategory.standard.

Let `A,A′,q,X,p` be as above, and let `F` be an abelian torsion sheaf on `X_ét` with torsion orders prime to the residue characteristics occurring on `X′`. For a closed constructible `Z ⊆ S` such that `Z′ = q⁻¹Z` is a proper subset of `S′`, set `T = f⁻¹Z` and `T′ = p⁻¹T`, with open complements `r` and `r′`. For every `n ≥ 0` the canonical map `p*Rⁿr_*r*F → Rⁿr′_*r′*p*F` is an isomorphism. Equivalently the canonical sheaf-local support map `p*𝓗ⁿ_T(X,F) → 𝓗ⁿ_T′(X′,p*F)` is an isomorphism. These are sheaves on `X′`, not global support groups. The derived local-support exchange is an isomorphism on `F[0]`.

This uses `A` and `A′` are valuation domains with separably closed fraction fields; arbitrary rank, including fields, is admitted; `q: S′ = Spec A′ → S = Spec A` is any scheme morphism; `X` is any `S`-scheme and `p: X′ = X ×_S S′ → X` is the actual projection; `F` is a torsion abelian sheaf prime to `char(X′)`; a common annihilator is not required; `Z` is closed and constructible in the base spectrum; `q⁻¹Z ≠ S′`. No surjectivity, dominance, finite-type, properness or qcqs assumption is made.

(Roland Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces, Corollary 4.2.6(i) and proof, pp. 243–244; Proposition 4.2.4, p. 243 and proof pp. 246–249.)

For `Z = ∅` both local-support complexes are zero and the open-restriction comparison is the identity. For identity `q` the comparison is the canonical identity on local cohomology. For a rank-two base choose a compact open complement with more than one point; the proof uses its closed point and must not replace it by the generic point. `A` localization map of valuation rings is allowed when the pulled-back boundary remains proper; no surjectivity condition is inserted.

*Needs:* `EtaleCohomologyFoundations`, §§0.7–0.11 (cohomology with supports as the localization fibre); `SchemeAndStackFoundations`, Layer 2; Section 5.2; Layer 5.

With `A,A′,q,X,p,F` as in local-cohomology-valuation-base-change, take any proper closed constructible `Z′ ⊊ S′`, and let `η′` be the closed point of `S′∖Z′`. Assume `q(z′) = q(η′)` for every `z′ ∈ Z′`. If `T′ = f′⁻¹Z′`, then `𝓗ⁿ_T′(X′,p*F) = 0` for every `n ≥ 0`. Equivalently the local-support complex on `p*F[0]` is zero, or the canonical `p*F → Rr′_*r′*p*F` is an isomorphism. Global support cohomology also vanishes by the support spectral sequence.

This uses `A` and `A′` are valuation domains with separably closed fraction fields; arbitrary rank, including fields, is admitted; `q: S′ = Spec A′ → S = Spec A` is any scheme morphism; `X` is any `S`-scheme and `p: X′ = X ×_S S′ → X` is the actual projection; `F` has prime-to-`char(X′)` torsion, with no common exponent required; `Z′` is a proper closed constructible subset of `S′`, not necessarily the pullback of a subset of `S`; `η′` is the closed point of its open complement, and all points of `Z′` have the same `q`-image as `η′`.

(Roland Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces, Corollary 4.2.6(ii) and proof, p. 244.)

`A` rank-one valuation `A′` with separably closed fraction field over a separably closed base field `A` satisfies the collapse condition for its closed point. The result applies to sheaves pulled back from an `A`-scheme. `Z′ = ∅` gives the zero support complex. For identity `q` and a nonempty proper boundary, the collapse hypothesis fails; no vanishing is asserted for an arbitrary special-fibre sheaf.

*Needs:* `EtaleCohomologyFoundations`, §§0.7–0.11 (cohomology with supports as the localization fibre); `SchemeAndStackFoundations`, Layer 2; Section 5.2; Layer 5.

Let `A,A′` have separably closed fraction fields and `q:Spec A′→Spec A` be surjective. For any `A`-scheme `X` and abelian torsion sheaf `F` on `X_ét` whose torsion is prime to `char(X)`, the canonical cohomology pullback `Hⁿ(X,F) → Hⁿ(X ×_A A′,p*F)` is an isomorphism for every `n ≥ 0`. Equivalently `β_p(F[0])` is an isomorphism in `D⁺(ℤ)`. There is no uniform exponent, `ℓ`-primary, finite-type, qcqs or constructibility requirement.

This uses `A` and `A′` are valuation domains with separably closed fraction fields; arbitrary rank, including fields, is admitted; `q` is surjective on spectra, equivalently its ring map is injective and local or faithfully flat; `X` is any `S`-scheme. `F` is an abelian torsion sheaf on `X_ét` prime to `char(X)`; it need not be constructible or killed by one integer.

(Roland Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces, Corollary 4.2.7(i) and proof, pp. 244–245.)

Identity `q` induces the identity on `Hⁿ`. Rank-zero valuations recover prime-to-characteristic separably closed field invariance. An unbounded direct sum of sheaves killed by varying invertible integers is admitted as a torsion sheaf; it is not an arbitrary unbounded derived complex. For a non-surjective generic localization, a nonzero special-fibre skyscraper loses its global sections; surjectivity cannot be dropped.

*Needs:* Section 6.1; Section 6.3; `SchemeAndStackFoundations`, Layer 2; `SchemeAndStackFoundations`, §2.15 (`etale_cohomology_limits`); Mathlib AlgebraicGeometry.Scheme.pointSmallEtale; Mathlib CategoryTheory.GrothendieckTopology.Point.sheafFiber; Mathlib DerivedCategory.Plus.singleFunctor.

Under torsion-sheaf-total-cohomology-valuation-invariance, the canonical adjunction `F → p_*p*F` is an isomorphism and `Rⁿp_*p*F = 0` for all `n > 0`. Thus the specific derived adjunction unit `F[0] → Rp_*p*F[0]` is an isomorphism, natural in `F` and compatible with composition of surjective valuation changes. The statement is about the pulled-back sheaf `p*F`; it does not make `p` an equivalence on all sheaves on `X′`.

This uses `A` and `A′` are valuation domains with separably closed fraction fields; arbitrary rank, including fields, is admitted; `q` is surjective on spectra, equivalently its ring map is injective and local or faithfully flat; `X` is any `S`-scheme. `F` is an abelian torsion sheaf on `X_ét` prime to `char(X)`; it need not be constructible or killed by one integer.

(Roland Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces, Corollary 4.2.7(ii) and proof, pp. 244–245; The Stacks Project authors, The Stacks Project: valuation rings, étale invariance and supports, Lemma 59.51.6 (03Q8), unpaginated HTML; apply also to `id_X`.)

On each étale `U, H⁰(U,F)` is carried by the actual adjunction unit. For the identity valuation map the unit is the identity and all positive direct images vanish. On a separably closed base field the theorem agrees with the sheaf form of Stacks 0F0B. No assertion that every sheaf on `X′` descends, and no arbitrary `Rⁿp_*G` vanishing, is made. Positive `Hⁿ(U,F)` on a chart is allowed: the proof kills its associated sheaf, not each chart group. The identity-pushforward case tests this distinction.

*Needs:* Section 6.3; `SchemeAndStackFoundations`, Layer 2; Mathlib CategoryTheory.Adjunction.

In the notation and coefficient range of total-cohomology-valuation-invariance, suppose only that Frac `V` and Frac `W` are separably closed. For any qcqs `V`-scheme `X` and `E ∈ D⁺(X_ét, Λ)`, the same canonical map `β_g(E)` is an isomorphism. In positive characteristic this is obtained by passage to the purely inseparable perfect closures of the fraction fields and their valuation rings, followed by descent through universal homeomorphisms. No claim that a separably closed field is already algebraically closed is made.

This uses `V` and `W` are valuation domains, with no rank, completeness, discreteness or microbial hypothesis; `φ: V → W` is faithfully flat; equivalently in this valuation setting it is injective and local, and `Spec W → Spec V` is surjective; `ℓ` is prime, `n > 0, Λ` is a commutative ring with `ℓⁿΛ = 0`, and `ℓ` is a unit of `V` (therefore also of `W`); `X` is qcqs over `Spec V`; `E` belongs to `D⁺(X_ét, Λ)`; Frac `V` and Frac `W` are separably closed, with imperfect positive-characteristic fields admitted.

(David Hansen and Peter Scholze, Relative perversity, Corollary 4.5, §4, printed pp. 22–23; The Stacks Project authors, The Stacks Project: valuation rings, étale invariance and supports, Theorems 59.45.1–59.45.2 and Proposition 59.45.4, §59.45 (04DY), unpaginated HTML; Roland Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces, Corollary 4.2.7(i)–(ii), pp. 244–245.)

Retains the identity, field, nondiscrete rank-one and higher-rank cases of the preceding theorem. In positive characteristic use an imperfect separably closed field with a valuation: the proof must include its radicial perfect closure, rather than asserting an IsAlgClosed instance from IsSepClosed. Coefficient order remains invertible in `V`; this extension changes the fraction-field hypothesis only.

*Needs:* Section 6.3; Section 6.1; Section 5.2; `SchemeAndStackFoundations`, Layer 2; Mathlib IsSepClosed.

Let `V → W, Λ, X` and `E` satisfy total-cohomology-separably-closed-valuation-invariance. Let `Z` be a closed subset of `X` whose open complement `U` is quasi-compact (therefore qcqs). Write `Z_W = g⁻¹(Z)`. The canonical pullback with closed supports `β_g,Z(E): RΓ_Z(X,E) → RΓ_Z_W(X_W,g*E)` is an isomorphism in `D⁺(Λ)`, and `H^q_Z(X,E) → H^q_Z_W(X_W,g*E)` is an isomorphism in the same degree `q` for every integer `q`. This map is the closed-support functoriality map in the natural localization triangle. It commutes with forgetting supports, restriction to `U` and the connecting morphisms. Closed support is imported from `EtaleCohomologyFoundations`, §0.7; it is neither cohomology of `Z` nor compactly supported cohomology of `X`.

This uses `V` and `W` are valuation domains, with no rank, completeness, discreteness or microbial hypothesis; `φ: V → W` is faithfully flat; equivalently in this valuation setting it is injective and local, and `Spec W → Spec V` is surjective; `ℓ` is prime, `n > 0, Λ` is a commutative ring with `ℓⁿΛ = 0`, and `ℓ` is a unit of `V` (therefore also of `W`); `X` is qcqs over `Spec V`; `E` belongs to `D⁺(X_ét, Λ)`; Both fraction fields are separably closed; `Z ⊆ X` is closed and `X∖Z` is quasi-compact; no finite-boundary hypothesis is substituted for this explicit condition.

(David Hansen and Peter Scholze, Relative perversity, Corollary 4.5, §4, printed pp. 22–23; The Stacks Project authors, The Stacks Project: valuation rings, étale invariance and supports, §59.79 (09XP), the global localization triangle before Lemma 59.79.1; Lemma 59.79.3 (0A45); unpaginated HTML.)

`Z = X` reduces to total cohomology invariance; `Z = ∅` yields the zero object. For a rank-one valuation `V` with closed point `s` and nonzero `Λ` supported by `E = i_*Λ, H⁰_s(Spec V,E) = Λ`. It stays `Λ` after faithfully flat valuation extension; this distinguishes supported cohomology from deleting the special fibre. For a microbial valuation, take `Z = f⁻¹(V(p_V))`; the complement is `X_η`, and the support triangle agrees with the inherited special-locus-support-triangle. In rank two this `Z` need not be the closed fibre. The claim is in degree `q` on both sides. The separate proper comparison `H^q_Z(X,E) = H^{q−1}(X_s,RΦE)` uses the inherited proper-nearby-cycle-cohomology theorem and must keep its shift.

*Needs:* Section 6.3; `EtaleCohomologyFoundations`, §§0.7–0.11 (cohomology with supports as the localization fibre); `SchemeAndStackFoundations`, Layer 2; Section 6.2.

Let `V → W` be faithfully flat valuation rings with separably closed fraction fields `K,L`; let `ℓ` be invertible in `V, ℓⁿΛ = 0`, and `f: X → Spec V` proper. For `X_W`, write `g_η: (X_W)_η′ → X_η` and `g_s: (X_W)_s′ → X_s`. Let `j,j′` be the generic-fibre maps and `i,i′` the closed-fibre maps. Put `RΨF = i*Rj*F`. For `F ∈ D⁺((X_η)_ét,Λ)`, let `α_X(F): RΓ(X_η,F) → RΓ(X_s,RΨF)` be the canonical proper comparison, and `inv_φ(F)` the inherited nearby invariance map (cohomology pullback along `g_s` followed by cohomology of the nearby base-change transformation). Then `α_X(F)` followed by `inv_φ(F)` equals `β_gη(F)` followed by `α_X_W(g_η*F)`. Both `α` maps and `β_gη` are isomorphisms, so this identifies `inv_φ` with geometric-generic cohomology pullback. The comparison can also be computed through `β_g(Rj*F)` followed by `RΓ` of `g*Rj*F → Rj′*g_η*F`; total invariance alone must not omit that exchange transformation. If `V,W` are microbial with valuation topologies, the ring map is continuous, and the completions and tubes satisfy the imported formal-adic-compatibility hypotheses, the same equality transports through `κ_X` and `κ_X_W` to the canonical tube pullback square.

This uses Proper `f`; both fraction fields separably closed; faithful flatness preserves closed and generic points; The prime-power coefficient assumptions of the new total-cohomology theorem are retained. The inherited proper-nearby comparison itself permits a larger torsion range; Formal/tube transport additionally requires the actual microbial, continuous, type-`(S)` setting of the inherited formal-adic comparison. Purely scheme-theoretic invariance supplies no adic continuity assumption.

(David Hansen and Peter Scholze, Relative perversity, Corollary 4.5 and proof, §4, printed pp. 22–23; Corollary 4.2(ii), p. 19; The Stacks Project authors, The Stacks Project: valuation rings, étale invariance and supports, Lemma 59.90.2 (0F0B), unpaginated HTML.)

For `V = W` and `φ =` id, `inv_φ` and `β_gη` are identities and the square reduces to `α_X = α_X`. For `X = P¹_V`, rank one or higher, the induced degree-zero map fixes 1; degree two preserves the first Chern class of `O(1)`, giving `Λ(−1)` with the specified Tate-twist normalization. For rank-two microbial `V` and `W`, use the actual closed-point tube in `Spa(K,V)`. Continuity and the plus ring `V` are retained under `κ`; rank-one completion cannot silently replace the tube. With `η = s` (`V` a field), `j` and `i` are identity maps and the square is ordinary geometric-field cohomology pullback. Residue-characteristic torsion is not asserted by these new invariance nodes. The larger torsion scope of proper-nearby-cycle-cohomology does not enlarge the prime-to-residue total-invariance theorem.

*Needs:* Section 6.3; Section 6.2; Section 6.1; Section 5.2; Section 4.5; `SchemeAndStackFoundations`, Layer 2; Mathlib CategoryTheory.Adjunction; Mathlib AlgebraicGeometry.IsProper; Mathlib `AlgebraicGeometry.Scheme.Hom.fiberι`.

### 6.4 Finite-rank descent and finite boundaries

Let `A` be a valuation domain with separably closed fraction field, `f:X→Spec A` finitely presented, `B` noetherian killed by `m>0` prime to `char(X), F` a constructible `B`-module on `X_ét`, and `Z` a closed constructible subset of `Spec A`. There exist a valuation subring `A₀⊆A` with separably closed fraction field and finite Krull dimension, an injective local inclusion `A₀→A` (hence `q:Spec A→Spec A₀` surjective), a finitely presented `f₀:X₀→Spec A₀`, a closed constructible `Z₀`, and a constructible `B`-module `F₀` on `X₀_ét` such that `X≅X₀×_A₀ A` over `A, Z=q⁻¹Z₀` and `F≅p*F₀` under this identification. The model can be chosen with `m` prime to `char(X₀)`.

This uses `A` is a valuation domain with separably closed fraction field; `S = Spec A`; `B` is a noetherian commutative ring killed by some `m > 0` prime to `char(X)`, and `F` is a constructible étale `B`-module on `X`; Constructibility is affine-local finite stratification by constructible locally closed subschemes, with finite-type locally constant `B`-modules on the strata; `X` need not be noetherian; `f` is finitely presented, including quasi-compactness and quasi-separatedness; `Z` is closed constructible.

(Roland Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces, Proof of Corollary 4.2.8, part (2), p. 245; proof of Corollary 4.2.9, part (2), p. 246.)

For finite-rank `A` one may take `A₀=A` and the identity model. The coefficient sheaf and `Z` must descend together with `X`; descending only defining equations is insufficient. In rank greater than one no discrete or rank-one approximation is asserted. The conclusion is an actual Cartesian model over `A`; the corrected orientation of the p. 246 displayed base change is retained.

*Needs:* `SchemeAndStackFoundations`, Layer 2; Tau Ceti TauCetiRoadmap/AdicSpaces#layer-1-valuation-spectra-and-continuous-valuations; `SchemeAndStackFoundations`, §2.15 (`etale_cohomology_limits`); Section 6.1; Mathlib AlgebraicGeometry.LocallyOfFinitePresentation; Mathlib ringKrullDim.

Let `A,B,F` satisfy the finiteness conventions, `f:X→S` be locally of finite type, and `Z⊆S` closed constructible. Put `T=f⁻¹Z` and `j:X∖T→X`. If either `f` is locally of finite presentation or `Z` has finitely many points, then `Rⁿj_*j*F` and, equivalently, `𝓗ⁿ_T(X,F)` are constructible `B`-module sheaves for every `n≥0`. The finite boundary is `Z` in the base spectrum. Neither properness nor quasi-compactness of `X` is required.

This uses `A` is a valuation domain with separably closed fraction field; `S = Spec A`; `B` is a noetherian commutative ring killed by some `m > 0` prime to `char(X)`, and `F` is a constructible étale `B`-module on `X`; Constructibility is affine-local finite stratification by constructible locally closed subschemes, with finite-type locally constant `B`-modules on the strata; `X` need not be noetherian; `f` is locally of finite type, and `Z` is closed constructible; Either `f` is locally of finite presentation, or the underlying point set `Z` is finite. These are alternatives, not simultaneous assumptions.

(Roland Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces, Corollary 4.2.8 and proof, p. 245; Proposition 4.2.5, p. 243 and proof pp. 249–250.)

`Z=∅` yields `R⁰j_*j*F=F` and higher terms zero; all local-support sheaves vanish. `Z=S` yields `Rⁿj_*j*F=0` and local support `F` in degree zero. If `A` has finite rank then every `Z` is finite, so the locally-finite-type branch applies without finite presentation. For infinite-rank `A` with finite `Z`, locally finite type suffices. For an infinite `Z`, retain local finite presentation; no finite-type-only claim is made.

*Needs:* Section 6.4; Section 6.3; Section 5.4; `EtaleCohomologyFoundations`, §§0.7–0.11 (cohomology with supports as the localization fibre); `SchemeAndStackFoundations`, Layer 2; Mathlib Topology.IsConstructible; Mathlib AlgebraicGeometry.LocallyOfFinitePresentation.

Let `A,B,F` satisfy the finiteness conventions and let `f:X→Spec A` be of finite type. If either `f` is of finite presentation or dim `A<∞`, then `Hⁿ(X_ét,F)` is a finitely generated `B`-module for every `n≥0`. This is ordinary global cohomology, with no properness or separatedness hypothesis in the finite-dimensional branch. No uniform vanishing range or finite cardinality is claimed.

This uses `A` is a valuation domain with separably closed fraction field; `S = Spec A`; `B` is a noetherian commutative ring killed by some `m > 0` prime to `char(X)`, and `F` is a constructible étale `B`-module on `X`; Constructibility is affine-local finite stratification by constructible locally closed subschemes, with finite-type locally constant `B`-modules on the strata; `X` need not be noetherian; `f` is of finite type globally, hence quasi-compact and locally of finite type; Either `f` is finitely presented (including quasi-separatedness), or `A` has finite Krull dimension.

(Roland Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces, Corollary 4.2.9 and proof, pp. 245–246.)

`A` separably closed field `A` reduces the theorem to the scheme supplier’`s` classical finiteness result. For finite-rank `A`, any finite-type `X` in the stated coefficient range is admitted, including nonproper `X`. For infinite-rank `A`, retain finite presentation; no finite-type-only theorem is asserted. Finitely generated over a noetherian torsion ring `B` can be an infinite set when `B` is infinite. The conclusion must remain Module.Finite, not Finite. For `X=P¹_A` and constant `B, H⁰` is `B` and `H²` is `B(−1)`; this checks ordinary global cohomology and the standard twist, not compact support.

*Needs:* Section 6.4; Section 6.3; `SchemeAndStackFoundations`, Layer 2; `EtaleCohomologyFoundations`, §§0.7–0.11 (cohomology with supports as the localization fibre); Mathlib Module.Finite; Mathlib ringKrullDim.

### Examples

`A` homomorphism `V→W` of valuation domains is surjective on prime spectra precisely when it is injective and local. The identity of a field satisfies this rank-zero case. For a rank-two valuation ring `C⁺` inside an algebraically closed analytic field `C`, inclusion `C⁺→O_C` is injective but can fail locality: an element infinitesimal in the secondary valuation becomes a unit of `O_C`. Its spectrum map loses the closed secondary prime. The surjective-valuation invariance theorem therefore cannot be applied to this inclusion merely from its injectivity. (Stacks, More on Algebra, Lemma 15.22.10, tag 0539, for torsion-free flatness; Mathlib `Module.FaithfullyFlat.of_flat_of_isLocalHom` and `PrimeSpectrum.comap_surjective_of_faithfullyFlat`; see Section 6.1.)

For an open complement `j:U→X` of a closed `Z`, the supported triangle `RΓ(X,j!Λ)→RΓ(X,Λ)→RΓ(Z,Λ)` fixes the two maps and connecting morphism. If `X` is proper, its first term is `RΓ_c(U,Λ)`; for `X=A¹` over an algebraically closed field and `Z=∅`, ordinary `RΓ(X,Λ)=Λ` is distinct from `RΓ_c(X,Λ)=Λ(−1)[−2]` for prime-to-characteristic `Λ`. In the proper setting where `Z` is a finite set, the last complex is a finite product of its closed-point complexes. For a single geometric closed point its constant-coefficient group is `Λ` in degree zero. This finite-boundary calculation supplies the supported exports of this layer. (Stacks, Étale Cohomology, §59.79, tags 09XP and 0A45; Huber (1996), §2.3, Proposition 2.3.10, pp. 122–124.)

### Dependencies

Use Layers 1, 4 and 5; Mathlib’`s` `PrimeSpectrum.comap`, `IsLocalHom` and valuation-domain notions; `SchemeAndStackFoundations`, Layers 0 and 2, for spectrum criteria, étale invariance and support localization; and `EtaleCohomologyFoundations`, §§0.5–0.6, for constructible finite-stage descent. The supported formal export uses the full `λ⁻¹L` of Layer 4. Invariance for total nearby cohomology uses surjectivity on spectra and a noetherian finite-generation coefficient ring; finite cardinality of that ring is not imposed unless a theorem explicitly requires finite coefficients.

Section 6.2's compact-support comparison uses `EtaleCohomologyFoundations`, §0.8 (`ClassicalAlgebraic.properSupports`), `EtaleCohomologyFoundations`, §`F`.2.1 (`VanishingCycles.properBaseChange`), and `EtaleCohomologyFoundations`, §§`G`.1–`G`.3, for scheme compactifications and coherent refinements. The base `Spec A` is qcqs and `f` remains separated of finite presentation; finite-presentation descent is not a replacement for the qcqs Nagata existence theorem.

## Layer 7: Geometric field extensions and connectedness

### 7.1 Extensions of geometric field pairs

A geometric field pair is a complete Huber pair `(C, C⁺)` (Tau Ceti `Huber.Pair`) in which `C` is an algebraically closed field, complete for a nontrivial nonarchimedean absolute value, and `C⁺ ⊆ C` is an open and bounded valuation subring, so that `C°° ⊆ C⁺ ⊆ O_C := C°` and `C⁺` may have any rank `≥ 1` (rank one exactly when `C⁺ = O_C`). Its spectrum `S(C, C⁺) := Spa(C, C⁺)` is the source of the geometric points of `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`). An extension of geometric field pairs `ι: (C, C⁺) →` (C', `C'⁺`) is a morphism of Huber pairs, `i.e`. a continuous ring homomorphism `ι: C →` C' with `ι(C⁺) ⊆ C'⁺`; it is injective, `ι⁻¹(O_{C'}) = O_C`, and it induces the morphism of adic spaces `g_ι := Spa(ι): Spa(C', C'⁺) → Spa(C, C⁺)` (Tau Ceti `Huber.Pair.Hom.spaComap`), which sends the point of `Spa(C', C'⁺)` with valuation ring V' (`C'⁺ ⊆` V' `⊆ O_{C'}`) to the point with valuation ring `ι⁻¹(V')`. Every morphism of adic spaces `Spa(C', C'⁺) → Spa(C, C⁺)` arises from a unique extension (global sections). The extension is surjective if `g_ι` is surjective on underlying sets; this is the condition `'X₁ → X₃` surjective' of ECD Lemma 16.3, and by Section 7.1 it holds if and only if `ι⁻¹(C'⁺) = C⁺`. No condition relates the ranks of `C⁺` and `C'⁺`, C'/`C` need not be algebraic, and `C`, C' may have characteristic 0 or p.

This uses `C`, C' algebraically closed, complete for nontrivial nonarchimedean absolute values (if the residue characteristic is `p > 0, i.e`. `|p| < 1`, these are exactly the algebraically closed perfectoid fields: `C` is not discretely valued and Frobenius is surjective on `O_C/p`, so `PerfectoidSpaces`, layer P1 (`perfectoid-field-characterisation`) applies; in residue characteristic 0, `e.g`. the completed algebraic closure of `ℂ((t)), C` is not perfectoid, and the nodes of this layer that use perfectoid spaces over `C` need residue characteristic `p`); `C⁺, C'⁺` open and bounded valuation subrings, of arbitrary rank; `ι` continuous with `ι(C⁺) ⊆ C'⁺`; surjectivity is a property of `ι`, not part of the data.

(Scholze, Étale cohomology of diamonds, §16, Lemma 16.3, p. 93; Scholze, Étale cohomology of diamonds, §14, Lemma 14.6, p. 84; Scholze, Étale cohomology of diamonds, §14, proof of Lemma 14.5(ii), p. 83.)

Provide `AdicSpace.GeometricFieldPair`: `A` field `C` with `IsAlgClosed C`, a complete nontrivial nonarchimedean absolute value, and a `ValuationSubring C` `C⁺` that is open and bounded; `AdicSpace.GeometricFieldPair.toPair`: The Tau Ceti `Huber.Pair` `(C, C⁺)`; `AdicSpace.GeometricFieldPair.spa`: The affinoid adic space `Spa(C, C⁺)` (sheafy: `C` is a field), with its closed point `s` (valuation ring `C⁺`) and generic point `η` (valuation ring `O_C`); `AdicSpace.GeometricFieldPair.Hom`: Extensions `ι: (C, C⁺) →` (C', `C'⁺`): continuous ring homomorphisms with `ι(C⁺) ⊆ C'⁺` (a `Huber.Pair.Hom`).

Provide `AdicSpace.GeometricFieldPair.Hom.id`: The identity extension; `Hom.comp` composes, with `spaMap_id` and `spaMap_comp`; `AdicSpace.GeometricFieldPair.Hom.spaMap`: `g_ι: Spa(C', C'⁺) → Spa(C, C⁺)`, with (`g_ι` v')'s valuation ring `= ι⁻¹(V')`; `AdicSpace.GeometricFieldPair.Hom.comap_powerBounded`: `ι⁻¹(O_{C'}) = O_C` and `C⁺ ⊆ ι⁻¹(C'⁺)`; `AdicSpace.GeometricFieldPair.Hom.IsSurjective`: The Prop that `g_ι` is surjective on points.

Provide `AdicSpace.GeometricFieldPair.Hom.isSurjective_iff_comap_eq`: `ι` is surjective iff `ι⁻¹(C'⁺) = C⁺` iff `g_ι(s') = s` (Section 7.1); `AdicSpace.GeometricFieldPair.Hom.range_spaMap`: The image of `g_ι` is the set of generalisations of `g_ι(s'), i.e`. the points with valuation ring containing `ι⁻¹(C'⁺)`; `AdicSpace.GeometricFieldPair.Hom.isSurjective_of_rankOne`: If `C⁺ = O_C` every extension is surjective; `AdicSpace.GeometricFieldPair.Hom.IsSurjective.comp`: Composites of surjective extensions are surjective.

Provide `AdicSpace.GeometricFieldPair.ofEqPlus`: For a valuation ring `V` with `C⁺ ⊆ V ⊆ O_C`, the pair `(C, V)` and the extension `(C, C⁺) → (C, V)` given by the identity; its image is the set of generalisations of the point `V` (used for `Spa(C, O_C) ⊆ Spa(C, C⁺)`); `AdicSpace.GeometricFieldPair.Hom.toGeometricPoint`: `g_ι` as an `AdicSpace.GeometricPoint` of `Spa(C, C⁺)` (`AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`)), with support `g_ι(s')`.

**Checks.**

- For every geometric field pair `(C, C⁺)` the identity extension is surjective.
- If `C⁺ ⊊ O_C`, the identity of `C`, viewed as an extension `(C, C⁺) → (C, O_C)`, is a morphism of Huber pairs that is not surjective: the image of `Spa(C, O_C)` is the generic point only. A definition of surjectivity as `'ι(C⁺) ⊆ C'⁺'` would accept it.
- If `C⁺ = O_C` then every extension `ι: (C, O_C) →` (C', `C'⁺`) is surjective (`Spa(C, O_C)` is one point); `e.g`. `C` the completed algebraic closure of `F_p((t))`, C' the completed algebraic closure of the completion of `C(u)` for the Gauss norm `(|u| = 1)`, with any open and bounded valuation subring `C'⁺`.
- `g_ι` is a geometric point of `Spa(C, C⁺)` in the sense of `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`), with support the point of valuation ring `ι⁻¹(C'⁺)`; the support is the closed point iff `ι` is surjective.
- If `ι: (C, C⁺) →` (C', `C'⁺`) and `κ`: (C', `C'⁺`) `→` (C'', `C''⁺`) are surjective, so is `κ ∘ ι`; if `κ ∘ ι` is surjective then so is `ι`.

For `C⁺ = O_C` (rank one) every extension is surjective; for `C⁺ ⊊ O_C` the identity extension `(C, C⁺) → (C, O_C)` is not surjective (its image is the generic point). ECD Lemma 14.5(ii) replaces `Spa(C₃, C₃⁺)` by the smaller of the two (generalising) images, after which both extensions are surjective.

*Needs:* `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); `AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`); Tau Ceti TauCeti.Huber.Pair; Tau Ceti `TauCeti.Huber.Pair.Hom`; Tau Ceti `TauCeti.Huber.Pair.Hom`.spaComap; Tau Ceti TauCeti.ValuationSpectrum.spa; Mathlib ValuationSubring; Mathlib ValuationSubring.comap; Mathlib `ValuationSubring.mem_comap`; Mathlib IsAlgClosed; `PerfectoidSpaces`, layer P1 (`perfectoid-field-characterisation`).

Let `ι: (C, C⁺) →` (C', `C'⁺`) be an extension of geometric field pairs (Section 7.1) and `g = g_ι`. (i) The points of `Spa(C, C⁺)` are the valuation subrings `V` of `C` with `C⁺ ⊆ V ⊆ O_C`; they form a chain, a point `V₂` is a specialisation of `V₁` iff `V₂ ⊆ V₁`, the closed point `s` is `C⁺`, the generic point `η` is `O_C`, and every point is a generalisation of `s`. (ii) `g(V') = ι⁻¹(V')`, and `g` maps the closed point s' of `Spa(C', C'⁺)` to the point `W := ι⁻¹(C'⁺) ⊇ C⁺`. (iii) The image of `g` is the set of generalisations of `W, i.e`. `{V : W ⊆ V ⊆ O_C}`; in particular `g` is generalising. (iv) Consequently the following are equivalent: `g` is surjective; `g(s') = s`; `ι⁻¹(C'⁺) = C⁺`. (v) If `C⁺ = O_C` then `ι` is surjective, and a composite of surjective extensions is surjective.

This uses `ι` an extension of geometric field pairs (no condition on ranks).

(Peter Scholze, Jared Weinstein, Berkeley lectures on p-adic geometry, Lecture 4, Proposition 4.2.5, p. 30; Scholze, Étale cohomology of diamonds, §14, proof of Lemma 14.5(ii), p. 83; Scholze, Étale cohomology of diamonds, §16, Lemma 16.3, p. 93.)

Rank two: let `C⁺ ⊊ O_C` be of rank two and `ι =` id: `(C, C⁺) → (C, O_C)`. Then `W = O_C` and the image is `{η} ≠ Spa(C, C⁺)`. ECD Lemma 14.5(ii): the images of `Spa(C_i, C_i⁺) → Spa(C₃, C₃⁺) (i = 1, 2)` are generalising, hence nested, by (iii).

*Needs:* Section 7.1; `AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`); Section 6.1; Mathlib ValuationSubring.linearOrderOverring; Mathlib ValuationSubring.primeSpectrumEquiv; Mathlib ValuationSubring.comap; Mathlib `ValuationSubring.mem_comap`; Tau Ceti `TauCeti.Huber.Pair.Hom`.spaComap; Mathlib `ValuationSubring.comap_comap`.

Let `(C, C⁺)` be a geometric field pair, `S = Spa(C, C⁺)` with closed point `s`. (i) Every étale morphism `V → S` is, locally on `V`, an open immersion; the étale topos of `S` is equivalent to the topos of sheaves on the topological space `|S|` (the chain of Section 7.1), the stalk of an étale sheaf at a geometric point with support `t` is its topological stalk at `t`, and, since `S` is the only open subset containing `s`, the global-sections functor `Γ(S_ét, −)` is the stalk functor at `s`: it is exact, `H⁰(S_ét, G) = G_s` and `Hⁱ(S_ét, G) = 0` for `i > 0`, for every abelian sheaf `G`. (ii) For every morphism `f: Y → S` of locally strongly sheafy analytic adic spaces (for instance `Y` locally of finite type over `S`, or `Y` perfectoid) and every abelian sheaf `F` on `Y_ét, Hⁱ(Y_ét, F) ≅ (Rⁱf_*F)_s` naturally in `F`. (iii) For an extension `ι: (C, C⁺) →` (C', `C'⁺`) with `g = g_ι`: S' `→ S`, Y' `= Y ×_S` S', `g_Y`: Y' `→ Y` and f': Y' `→` S', the pullback map `g_Y^*: Hⁱ(Y_ét, F) → Hⁱ(Y'_ét, g_Y^*F)` is identified, via (ii) for `f` and f', with the base-change map `(Rⁱf_*F)_{g(s')} = (g^*Rⁱf_*F)_{s'} → (Rⁱf'_*g_Y^*F)_{s'}` precomposed with the specialisation map `(Rⁱf_*F)_s → (Rⁱf_*F)_{g(s')}`; if `ι` is surjective, `g(s') = s` and the specialisation map is the identity.

This uses `S` the spectrum of a geometric field pair; statements (ii)-(iii) for sheaves of abelian groups (the same holds for complexes in `D⁺`).

(Scholze, Étale cohomology of diamonds, §14, proof of Proposition 14.3, p. 82; Huber (1996), Chapter 2 introduction, p. 108; Scholze, Étale cohomology of diamonds, §16, proof of Theorem 16.1, p. 93.)

`Y = S, F = j_`!`M` for the open `{η} ⊊ S` (`C⁺` of rank two): `H⁰(S, j_!M) = (j_!M)_s = 0`, while the stalk at `η` is `M`; along the non-surjective `(C, C⁺) → (C, O_C)` the comparison map of (iii) is the map `0 → M`, as the specialisation map predicts. ECD Proposition 14.3, proof: the global-sections functor on `Spa(C, C⁺)_ét` is exact and is a point.

*Needs:* Section 7.1; `AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`); `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); `AdicEtaleGeometry`, layer A1 (`etale-diagonal`); `AdicEtaleGeometry`, layer A1 (`etale-site`); `AdicEtaleGeometry`, layer A1 (`etale-morphism`); Section 1.1; Section 1.3; Section 1.2; Mathlib CategoryTheory.GrothendieckTopology.Point.

Let `ι: (C, C⁺) →` (C', `C'⁺`) be a surjective extension of geometric field pairs (Section 7.1), `S = Spa(C, C⁺)`, S' `= Spa(C', C'⁺), p ≥ 1` the characteristic exponent of the residue field of `O_C` (the residue characteristic, or 1 if it is 0), `n≥1` an integer that is a unit in `C⁺` (hence in `C'⁺`) and `M` a `ℤ/nℤ`-module. Let `(R, R⁺)` be a complete Huber pair with a morphism of pairs `(C, C⁺) → (R, R⁺)` such that `R` is topologically of finite type over `C` (a `C`-affinoid algebra) and `R⁺ ⊆ R°` is any open integrally closed subring containing the image of `C⁺`; put `Y := Spa(R, R⁺)` (an affinoid adic space over `S`, noetherian, of weakly finite type over `S`) and Y' :`= Y ×_S` S' `= Spa(R ⊗̂_C C', (R ⊗̂_C C')⁺)`, the completed tensor product with plus ring the closure of the integral closure of the image of `R⁺ ⊗_{C⁺} C'⁺` (`R ⊗̂_C` C' is topologically of finite type over C'), with projection `g_Y`: Y' `→ Y`. Let `U ⊆ Y` be a quasicompact open subset, `j: U → Y`, U' :`= g_Y⁻¹(U)` (quasicompact open) and j': U' `→` Y'. Then for every `i ≥ 0` the pullback map `g_Y^*: Hⁱ(Y_ét, j_!M) → Hⁱ(Y'_ét, g_Y^*j_!M) = Hⁱ(Y'_ét, j'_!M)` is bijective. The case `U = Y` is the invariance of `Hⁱ(Y_ét, M)`; for `U = ∅` both sides vanish. The theorem is not asserted when `n` is not a unit in `C⁺`, nor for non-surjective `ι` (Section 7.1, acceptance).

This uses `ι` surjective, `i.e`. `ι⁻¹(C'⁺) = C⁺` (Section 7.1); `n` a unit in `C⁺`; `M` any `ℤ/nℤ`-module (not necessarily finite); `R` a `C`-affinoid algebra (quotient of some `C⟨T₁`, …, `T_m⟩`); `R⁺` any ring of integral elements containing the image of `C⁺`, so that `Y → S` is of weakly finite type (higher-rank plus rings allowed). If `C⁺ = O_C` and the morphism of pairs is required to be topologically of finite type, then `R⁺ = R°` (`AdicSpacesPartII`, layer R1 (`tft-plus-ring-power-bounded`)); the theorem does not need that requirement; `U` quasicompact open in `Y`, not necessarily rational; no hypothesis on the ranks of `C⁺, C'⁺`.

(Huber (1996), Theorem 4.1.1(c), p. 238, using char⁺; Scholze, Étale cohomology of diamonds, §16, proof of Lemma 16.3, p. 93, for the perfectoid specialization; Scholze, Étale cohomology of diamonds, §16, Lemma 16.3, p. 93; Scholze, Étale cohomology of diamonds, §16, Remark 16.2, p. 92; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §3, proof of Proposition 3.2, p. 11; Berkovich (1993), §7.6, Theorem 7.6.1, p. 150; Berkovich (1993), §7.6, proof of Theorem 7.6.1, p. 151.)

`Y = S (R = C, R⁺ = C⁺)`: for `U = S` both sides are `M` in degree 0 and 0 in positive degrees; for a quasicompact open `U ⊊ S` both sides vanish in all degrees (Section 7.1 (i), `s ∉ U`, and s' `∉` U' by surjectivity). This is ECD Lemma 16.3 for `X₂ = X₃`. ECD's instance: `C`, C' of characteristic `p, R` topologically of finite type over `C` with any `R⁺, U` any quasicompact open (the proof of ECD Lemma 16.3, after reduction to `X₂ = Spa(R_perf, R⁺_perf)`). Surjectivity cannot be dropped: for `C⁺` of rank two, `ι =` id: `(C, C⁺) → (C, O_C), Y = S` and `U = {η}`, the left side is `H⁰(S, j_!M) = 0` and the right side is `H⁰(Spa(C, O_C), M) = M`.

*Needs:* Section 7.1; Section 1.2; Section 1.5; Section 1.1; Section 6.2; Section 6.1; Section 4.4; Section 4.5; Section 4.3; Section 2.5; Layer 5; `AdicSpacesPartII`, layer R0 (`completed-tensor-product`); `AdicSpacesPartII`, layer R0 (`affinoid-fibre-product`); `AdicSpacesPartII`, layer R0 (`completed-tensor-noetherian-stability`); `AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`); `AdicSpacesPartII`, layer R1 (`tft-plus-ring-power-bounded`); Tau Ceti TauCeti.Huber.IsTopologicallyFiniteType.

**Checks.**

- For `Y=S` and `U=S`, the map is the identity of `M` in degree zero and both positive-degree groups vanish.
- For `U=∅`, the two complexes are zero.
- `A` higher-rank `C⁺` with rank-one residue exponent 1 and secondary residue characteristic `ℓ` excludes `n=ℓ`. Rank-one coprimality alone does not meet Huber's `char⁺` hypothesis.

### 7.2 Perfectoid finite-type approximations

Let `(C, C⁺)` be a geometric field pair, `S = Spa(C, C⁺)`, and `X = Spa(R, R⁺)` an affinoid perfectoid space over `S, i.e`. `(R, R⁺)` a complete perfectoid Tate pair with a morphism of Huber pairs `(C, C⁺) → (R, R⁺)` (any characteristic; `PerfectoidSpaces`, layer P2 (`affinoid-perfectoid-space`)). For a finite subset `I ⊆ R⁺` let `S_I ⊆ R` be the image of the continuous `C`-algebra map `C⟨T_i : i ∈ I⟩ → R, T_i ↦ i`, with the quotient topology, and let `S_I⁺ ⊆ S_I` be the integral closure of the subring generated by the image of `C⁺`, the elements of `I` and `S_I°°`. Put `Y_I := Spa(S_I, S_I⁺)` and let `φ_I: X → Y_I` be induced by the inclusion. Then: (i) `S_I` is a reduced `C`-affinoid algebra, `(S_I, S_I⁺)` is a complete Huber pair with `S_I⁺ ⊆ R⁺, Y_I` is a noetherian affinoid adic space over `S` (strongly noetherian, not perfectoid in general), and for `I ⊆ J` the inclusion `S_I ⊆ S_J` is a morphism of pairs, so `I ↦ Y_I` is a cofiltered system over `S` indexed by the finite subsets of `R⁺` with compatible `φ_I`; (ii) `R = ⋃_I S_I` and `R⁺ = ⋃_I S_I⁺` inside `R`, and the `ϖ`-adic topology of `R⁺ = colim_I S_I⁺` is that of `R` (no completion is needed); (iii) `|X| → lim_I |Y_I|` is a homeomorphism of spectral spaces, every quasicompact open (resp. rational) subset of `X` is `φ_I⁻¹` of a quasicompact open (resp. rational) subset of some `Y_I`, and two quasicompact opens of `Y_I` with equal preimages in `X` have equal preimages in some `Y_J`; (iv) `X ~ lim_I Y_I` is a perfectoid tilde-limit (`PerfectoidSpaces`, layer P7 (`perfectoid-tilde-limit`)) and hence `X ~′ lim_I Y_I` in the sense of Scholze 2012 Definition 7.14 (`PerfectoidSpaces`, layer P7 (`residue-field-tilde-limit`)): `X` is a tilde-limit of the analytic approximation spaces `Y_I`, which are not perfectoid, and not a categorical limit of them; (v) if char `C = p`, the completed perfections `Y_I^perf := Spa(S_I^perf∧, S_I^{+,perf∧})` are perfectoid, `Y_I^perf ~ lim_Φ Y_I` with `|Y_I^perf| = |Y_I|` and `Y_I^perf_ét ≃ Y_I`,ét, and `X = lim_I Y_I^perf` is a limit in perfectoid spaces (the presentation of ECD Lemma 16.3), so that `X_ét`,qcqs `≃ 2`-`colim_I (Y_I^perf)_ét`,qcqs; for `C⁺ = O_C` one has `S_I⁺ = S_I°` and `(Y_I^perf)` is the `p`-finite system of Scholze 2012 Lemma 6.13 with `K = C`; (vi) if `W_I ⊆ Y_I` are rational subsets containing `φ_I(X)`, compatible under the transition maps, then `(W_I)` with the restricted `φ_I` satisfies (iii) and (iv) as well.

This uses `(C, C⁺)` a geometric field pair; `X` affinoid perfectoid over `S`; any characteristic for (i)-(iv), (vi); characteristic `p` for (v); `R⁺` need not be an `O_C`-algebra (`C⁺` may have higher rank): this is why `S_I⁺` is built from `C⁺, I` and `S_I°°` rather than taken to be `S_I°` as in Scholze 2012 Lemma 6.13, where `R⁺` is a `K°`-algebra.

(Scholze, Perfectoid spaces, §6, Lemma 6.13(i), p. 37; Scholze, Perfectoid spaces, §6, proof of Lemma 6.13(i), p. 37; Scholze, Étale cohomology of diamonds, §16, proof of Lemma 16.3, p. 93; Scholze, Perfectoid spaces, §7, Definition 7.14, p. 44; Scholze, Perfectoid spaces, §6, proof of Proposition 6.11(i), p. 36.)

Provide `AdicSpace.FiniteTypeApprox`: The system `I ↦ (S_I, S_I⁺)` over `(C, C⁺)`, indexed by the finite subsets of `R⁺` ordered by inclusion; `AdicSpace.FiniteTypeApprox.isTopologicallyFiniteType`: `C → S_I` is topologically of finite type (Tau Ceti `Huber.IsTopologicallyFiniteType`) and `S_I` is reduced and strongly noetherian; `AdicSpace.FiniteTypeApprox.space`: `Y_I = Spa(S_I, S_I⁺)` as an adic space over `S`; `AdicSpace.FiniteTypeApprox.map`: Transition morphisms `Y_J → Y_I` for `I ⊆ J`, with `map_id` and `map_comp`.

Provide `AdicSpace.FiniteTypeApprox.proj`: `φ_I: X → Y_I` over `S`, compatible with the transition maps; `AdicSpace.FiniteTypeApprox.iUnion_eq`: `⋃_I S_I = R` and `⋃_I S_I⁺ = R⁺` inside `R`; `AdicSpace.FiniteTypeApprox.homeomorph`: `|X| ≃ₜ lim_I |Y_I|`; `AdicSpace.FiniteTypeApprox.exists_isQuasiCompactOpen_preimage`: Every quasicompact open (resp. rational) `U ⊆ X` equals `φ_I⁻¹(U_I)` for some `I` and quasicompact open (resp. rational) `U_I ⊆ Y_I`; equal preimages are equal at a finite level.

Provide `AdicSpace.FiniteTypeApprox.isTildeLimit`: `X ~ lim_I Y_I` (`PerfectoidSpace.IsTildeLimit`) and `X ~′ lim_I Y_I` (`PerfectoidSpace.IsResidueFieldTildeLimit`); `AdicSpace.FiniteTypeApprox.perf`: In characteristic `p, Y_I^perf`, with `|Y_I^perf| ≃ₜ |Y_I|, Y_I^perf`,ét `≃ Y_I`,ét and `X ≅ lim_I Y_I^perf` in perfectoid spaces; `AdicSpace.FiniteTypeApprox.restrict`: Restriction of the system to compatible rational subsets `W_I ⊇ φ_I(X)`, keeping homeomorph and isTildeLimit; `AdicSpace.FiniteTypeApprox.plus_eq_powerBounded`: If `C⁺ = O_C` then `S_I⁺ = S_I°`.

**Checks.**

- For `X = Spa(C, C⁺)` itself, `S_I = C` and `S_I⁺ = C⁺` for every `I`, so every `Y_I` equals `S` and `φ_I` is the identity.
- For char `C = p, X` the perfectoid closed unit disc over `(C, O_C)` and `I = {T^{1/pᵏ}}: S_I = C⟨T^{1/pᵏ}⟩` and `S_I⁺ = O_C⟨T^{1/pᵏ}⟩`.
- In the disc example with `I = {T}, Y_I = Spa(C⟨T⟩, O_C⟨T⟩)` is not perfectoid (`T` has no `p`-th root in `C⟨T⟩`) although `X` is; the approximation spaces are analytic, not perfectoid, and `X ~ lim Y_I` is only a tilde-limit.
- If `C⁺ = O_C` then `S_I⁺ = S_I°`, and for char `C = p` the completed perfections of `(S_I, S_I°)` form the system of `PerfectoidSpaces`, layer P2 (`completed-direct-limits-of-p-finite-affinoids`) (Scholze 2012 Lemma 6.13 with `K = C`).
- `|X| → lim_I |Y_I|` is a homeomorphism, and the rational subset `{|T| ≤ |ϖ|}` of the perfectoid disc is the preimage of the rational subset `{|T| ≤ |ϖ|}` of `Y_{{T}}`.

`X = S: S_I = C` and `S_I⁺ = C⁺` for all `I`, so `Y_I = S` and the system is constant. The perfectoid closed unit disc `X = Spa(C⟨T^{1/p^∞}⟩, R⁺)` over `S` in characteristic `p, R⁺` the completed integral closure of `C⁺[T^{1/p^∞}] + C°°⟨T^{1/p^∞}⟩`: for `I = {T}` one gets `S_I = C⟨T⟩` with `S_I⁺` the integral closure of `C⁺[T] + C°°⟨T⟩`, the classical disc over `S`, and for `I = {T^{1/pᵏ}}` the disc in the variable `T^{1/pᵏ}`.

*Needs:* Section 7.1; `PerfectoidSpaces`, layer P2 (`affinoid-perfectoid-space`); `PerfectoidSpaces`, layer P2 (`completed-direct-limits-of-p-finite-affinoids`); `PerfectoidSpaces`, layer P2 (`p-finite-acyclicity-from-tate`); `AdicSpacesPartII`, §R0.19.7 (`spa-of-filtered-colimit-of-tate-pairs`); `AdicSpacesPartII`, §R0.19.8 (`quasicompact-opens-in-limits-of-spectral-spaces`); `PerfectoidSpaces`, layer P5 (`cofiltered-limits-of-affinoid-perfectoid-spaces`); `PerfectoidSpaces`, layer P5 (`finite-stage-descent-of-qcqs-etale-objects`); `PerfectoidSpaces`, layer P5 (`limit-restriction-to-rational-subsets`); `PerfectoidSpaces`, layer P7 (`perfectoid-tilde-limit`); `PerfectoidSpaces`, layer P7 (`residue-field-tilde-limit`); `PerfectoidSpaces`, layer P7 (`tilde-limit-from-completed-colimit`); `PerfectoidSpaces`, layer P7 (`tilde-limit-implies-residue-field-tilde-limit`); `PerfectoidSpaces`, layer P7 (`perfection-tilde-limit`); `PerfectoidSpaces`, layer P7 (`etale-topos-invariance-under-inseparable-towers`); `AdicSpacesPartII`, §R0.19.6 (`cofiltered-limits-of-spectral-spaces`); `AdicSpacesPartII`, layer R0 (`reduced-affinoid-supremum-norm`); `AdicSpacesPartII`, layer R0 (`affinoid-power-bounded-integral`); `AdicSpacesPartII`, layer R0 (`noetherian-type-stably-sheafy`); Section 1.5; Tau Ceti TauCeti.Huber.IsStronglyNoetherian; Tau Ceti TauCeti.Huber.Pair; Tau Ceti `TauCeti.Huber.Pair.Hom`; Tau Ceti TauCeti.Huber.IsTopologicallyFiniteType.

In the situation of Section 7.2, let `ι: (C, C⁺) →` (C', `C'⁺`) be an extension of geometric field pairs (not necessarily surjective), S' `= Spa(C', C'⁺)`, X' :`= X ×_S` S' and `Y_I' := Y_I ×_S` S' (or `W_I ×_S` S' for a restricted system as in (vi) there). Then: (i) X' `= Spa(R ⊗̂_C C', (R ⊗̂_C C')⁺)` is affinoid perfectoid and `Y_I' = Spa(S_I ⊗̂_C C', (S_I ⊗̂_C C')⁺)` is a noetherian affinoid adic space topologically of finite type over S'; (ii) the images of the `S_I ⊗̂_C` C' in `R ⊗̂_C` C' have dense union, the plus ring of X' is the closure of the integral closure of the union of the images of the plus rings of the `Y_I'`, and X' `~ lim_I Y_I'`, hence X' `~′ lim_I Y_I'` and `|`X'`| ≅ lim_I |Y_I'|`; (iii) for a quasicompact open `U_I ⊆ Y_I`, the preimage in X' of `φ_I⁻¹(U_I)` is the preimage of `U_I' := (Y_I' → Y_I)⁻¹(U_I)` under X' `→ Y_I'`.

This uses The approximation system of the base; `ι` any extension of geometric field pairs.

(Scholze, Étale cohomology of diamonds, §14, proof of Lemma 14.6, p. 84; Scholze, Étale cohomology of diamonds, §16, proof of Lemma 16.3, p. 93.)

`X = S`: X' `=` S' and `Y_I' =` S' for all `I`. The pullback presentation in ECD Lemma 14.6 is used here in tilde-limit form, with the finite-type `Y_I′` replacing its `p`-finite stages.

*Needs:* Section 7.2; Section 7.1; `PerfectoidSpaces`, layer P2 (`perfectoid-fibre-product-universal-property`); `PerfectoidSpaces`, layer P7 (`tilde-limit-from-completed-colimit`); `PerfectoidSpaces`, layer P7 (`tilde-limit-implies-residue-field-tilde-limit`); `AdicSpacesPartII`, layer R0 (`affinoid-fibre-product`); `AdicSpacesPartII`, layer R0 (`completed-tensor-product`); `AdicSpacesPartII`, layer R0 (`completed-tensor-noetherian-stability`); `AdicEtaleGeometry`, layer A0 (`fibre-product-associativity-and-unit`).

Let `ι: (C, C⁺) →` (C', `C'⁺`) be a surjective extension of geometric field pairs, `S = Spa(C, C⁺)`, S' `= Spa(C', C'⁺), p` the residue characteristic exponent, `n` prime to `p` and `M` a `ℤ/nℤ`-module. Let `X = Spa(R, R⁺)` be an affinoid perfectoid space over `S` (any characteristic), X' :`= X ×_S` S' (affinoid perfectoid) with projection `g_X`: X' `→ X, U ⊆ X` a quasicompact open subset, `j: U → X`, U' :`= g_X⁻¹(U)` and j': U' `→` X'. Then for every `i ≥ 0` the pullback `g_X^*: Hⁱ(X_ét, j_!M) → Hⁱ(X'_ét, j'_!M)` is bijective, where `X_ét, X'_ét` are the étale sites of the perfectoid spaces (`PerfectoidSpaces`, layer P3 (`etale-site-of-perfectoid-space`)). This is the assertion proved in ECD's proof of Lemma 16.3 for a perfectoid space over the base field pair, for affinoid `X₂`; the proof below uses neither diamonds nor ECD Theorem 16.1 or 14.12.

This uses `ι` surjective; `n` prime to `p`; `X` affinoid perfectoid over `S`; `U` quasicompact open.

(Scholze, Étale cohomology of diamonds, §16, proof of Lemma 16.3, p. 93; Scholze, Perfectoid spaces, §7, Corollary 7.18, p. 44; Scholze, Perfectoid spaces, §7, before Definition 7.14, p. 43.)

`X = S`: this is Section 7.1 for `Y = S`, and gives ECD Lemma 16.3 for `X₂ = X₃`. `X` the perfectoid closed unit disc over `S, U = {|T| ≤ |ϖ|}`: descends to the rational subset `{|T| ≤ |ϖ|}` of `Y_{{T}} =` the classical disc, and the theorem reduces to the classical disc and its base change to C'. Used with `X = Spa(C₂, C₂⁺)` in Section 7.3 (ECD Lemma 16.3).

*Needs:* Section 7.2; Section 7.1; `PerfectoidSpaces`, layer P7 (`tilde-limits-and-etale-topos-comparison`); `PerfectoidSpaces`, layer P3 (`etale-site-of-perfectoid-space`); `PerfectoidSpaces`, layer P2 (`perfectoid-fibre-product-universal-property`); Section 1.5; Section 1.2; Section 1.1.

### 7.3 Supports and geometric connectedness

Let `X_k = Spa(C_k, C_k⁺), k = 1`, 2, 3, be spectra of geometric field pairs and `X₁ → X₃ ← X₂` morphisms (induced by extensions `ι₁: (C₃, C₃⁺) → (C₁, C₁⁺), ι₂: (C₃, C₃⁺) → (C₂, C₂⁺)`) with `X₁ → X₃` surjective. Let `j₂: U₂ → X₂` be a quasicompact open subset, assume the residue characteristic `p` of `C₃` is positive (so that the `C_k` are perfectoid fields; in ECD they have characteristic `p`), let `M` be an abelian group killed by some `n` prime to `p, W := X₁ ×_{X₃} X₂` (an affinoid perfectoid space) and `j₂`!`M` also its pullback to `W`. Then `Hⁱ(W_ét, j₂!M) = 0` for all `i ≥ 0` unless `U₂ = X₂` and `i = 0`, in which case pullback from `X₂` gives `H⁰(W_ét, j₂!M) = M`.

This uses `X₁ → X₃` surjective; no condition on `X₂ → X₃`; residue characteristic `p > 0`; `n` prime to p.

(Scholze, Étale cohomology of diamonds, §16, Lemma 16.3, p. 93; Scholze, Étale cohomology of diamonds, §16, proof of Theorem 16.1, p. 93.)

`U₂ = X₂: H⁰(W, M) = M` and `Hⁱ(W, M) = 0` for `i > 0` (with `M = ℤ/ℓ` this re-proves, for such `W`, the connectedness of Section 7.3, which does not need surjectivity). Used by `DiamondEtaleCohomology`, layer C1 in the prime-to-`p` case (iii) of ECD Theorem 16.1, after reduction to connected strictly totally disconnected `X̃ → X ←` X' and `F = j`!`M`. Surjectivity cannot be dropped: `X₃ = X₂ = Spa(C, C⁺)` with `C⁺` of rank two, `X₁ = Spa(C, O_C) → X₃` the non-surjective map, `U₂ = {η}: W = X₁` and `H⁰(W, j₂!M) = M` although `U₂ ≠ X₂`.

*Needs:* Section 7.2; Section 7.1; `AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`); `PerfectoidSpaces`, layer P2 (`perfectoid-fibre-product-universal-property`).

Let `(C, C⁺)` be a geometric field pair, `S = Spa(C, C⁺)` with generic point `η` (valuation ring `O_C`), and `Z` a quasicompact quasiseparated analytic adic space over `S` (for instance an affinoid perfectoid space over `S`, or an affinoid adic space topologically of finite type over `S`). Let `Z° := Z ×_S Spa(C, O_C)`. Then (i) the projection `Z° → Z` is a homeomorphism onto the subspace `h⁻¹(η)` of points of `Z` lying over `η (h: Z → S)`; for affinoid `Z = Spa(A, A⁺), Z° = Spa(A, A°⁺)` with `A°⁺` the closure of the integral closure of `A⁺·O_C`, and `h⁻¹(η) =` {`z : |c(z)| ≤ 1` for all `c ∈ O_C`}; (ii) every `z ∈ Z` has a unique maximal generalisation `z̃`, and `z̃ ∈ Z°`; (iii) `Z` is connected if and only if `Z°` is connected: a decomposition of `Z` into disjoint open and closed subsets restricts to one of `Z°`, and a decomposition `Z° = A ⊔ B` into disjoint open and closed subsets extends to the decomposition `Z = Ā ⊔ B̄` by closures.

This uses `Z` quasicompact and quasiseparated (so `|Z|` is spectral) and analytic over `S`.

(Scholze, Étale cohomology of diamonds, §14, proof of Lemma 14.6, p. 84; Peter Scholze, Jared Weinstein, Berkeley lectures on p-adic geometry, Lecture 4, Proposition 4.2.5, p. 30.)

`Z = S: Z° = {η}` and both are connected. `Z = S ⊔ S` (disconnected): `Z° = {η} ⊔ {η}`, disconnected, as (iii) requires. ECD Lemma 14.6, proof: the reduction to `C⁺ = O_C` and `C'⁺ = O_{C'}`.

*Needs:* Section 7.1; `AdicSpacesPartII`, layer R0 (`affinoid-fibre-product`); `PerfectoidSpaces`, layer P2 (`perfectoid-fibre-product-universal-property`); `AdicSpacesPartII`, §R0.19.2 (`pro-constructible-subsets`); `AdicSpacesPartII`, §R0.19.3 (`closure-of-pro-constructible`); Mathlib IsClopen; Mathlib ConnectedSpace; Mathlib SpectralSpace.

Let `C` be an algebraically closed field complete for a nontrivial nonarchimedean absolute value, C' a complete nonarchimedean field extension of `C` (not necessarily algebraically closed), and `Y` a quasi-separated adic space locally of finite type over `Spa(C, O_C)`, with Y' :`= Y ×_{Spa(C,O_C)} Spa(C', O_{C'})`. Then `Y` is connected if and only if Y' is connected. For affinoid `Y = Spa(A, A°)` (`A` a `C`-affinoid algebra) this says: `A` has no idempotents other than 0 and 1 iff `A ⊗̂_C` C' has none.

This uses `C` algebraically closed (so every nonempty quasi-separated rigid space over `C` has a `C`-rational point); C'/`C` any complete extension; `Y` quasi-separated, locally of finite type over `Spa(C, O_C)` (rank-one base; the higher-rank case is reduced to this one by Section 7.3).

(Brian Conrad, Irreducible components of rigid spaces, §3.2, Theorem 3.2.1, p. 18; Brian Conrad, Irreducible components of rigid spaces, §2.1, p. 11; Brian Conrad, Irreducible components of rigid spaces, §3.2, proof of Theorem 3.2.1, p. 20; Scholze, Étale cohomology of diamonds, §14, proof of Lemma 14.6, p. 84; Huber (1996), §1.1, (1.1.11), pp. 42-43.)

The closed unit disc `Spa(C⟨T⟩, O_C⟨T⟩)` is connected and so is its base change to any C'. The affinoid `Spa(C⟨T⟩/(T² − T))` (two points) is disconnected, and stays so over C'. Used for the finite-level spaces in Section 7.3 (ECD Lemma 14.6: 'for rigid spaces, being geometrically connected passes to extensions of algebraically closed fields').

*Needs:* `AdicSpacesPartII`, layer R1 (`rigid-adic-quasi-separated-equivalence`); `AdicSpacesPartII`, layer R1 (`rigid-adic-topos-equivalence`); `AdicSpacesPartII`, layer R1 (`rigid-adic-comparison-functor`); `AdicSpacesPartII`, layer R1; `AdicSpacesPartII`, layer R0; `AdicSpacesPartII`, layer R0 (`affinoid-fibre-product`); `AdicSpacesPartII`, layer R0 (`affinoid-residue-fields-finite`); `AdicSpacesPartII`, layer R0 (`fibre-product-points`); `AdicSpacesPartII`, layer R1 (`tft-plus-ring-power-bounded`); Mathlib IsClopen; Mathlib ConnectedSpace; Mathlib IsAlgClosed; Tau Ceti `TauCeti.connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed`.

Let `(C, C⁺)` be a geometric field pair, `X = Spa(C, C⁺), Z → X` a connected affinoid perfectoid space over `X`, and X' `= Spa(C', C'⁺) → X` the spectrum of a geometric field pair with any morphism to `X` (an extension `ι`, not necessarily surjective). Then Z' :`= Z ×_X` X' is connected (and nonempty). `C` may have characteristic 0 or p.

This uses `Z` connected (in particular nonempty) affinoid perfectoid over `X`; X' `→ X` arbitrary.

(Scholze, Étale cohomology of diamonds, §14, Lemma 14.6, p. 84; Scholze, Étale cohomology of diamonds, §14, proof of Lemma 14.6, p. 84; Scholze, Étale cohomology of diamonds, §14, proof of Lemma 14.5(ii), p. 84.)

`Z = X`: Z' `=` X' is connected. `Z` the perfectoid closed unit disc over `X`: Z' is the perfectoid closed unit disc over X', connected. `Z = X ⊔ X` is not connected and neither is Z' (the hypothesis 'connected' cannot be dropped). Used in the proof of ECD Lemma 14.5(ii) (`DiamondEtaleCohomology`, layer C0) to show that `X₁' ×_{X₃'} X₂'` is connected, and for `i = 0, V =` X' in the proof of ECD Theorem 16.1 (`DiamondEtaleCohomology`, layer C1).

*Needs:* Section 7.3; Section 7.2; Section 7.1; `AdicEtaleGeometry`, layer A1 (`etale-locally-finitely-many-components`); `AdicEtaleGeometry`, layer A0 (`fibre-product-associativity-and-unit`); `AdicSpacesPartII`, §R0.19.8 (`quasicompact-opens-in-limits-of-spectral-spaces`); `PerfectoidSpaces`, layer P2 (`completed-direct-limits-of-p-finite-affinoids`); `AdicSpacesPartII`, layer R0 (`fibre-product-points`); Mathlib IsClopen; Mathlib ConnectedSpace.

### Examples

Let `(C,C⁺)→(D,D⁺)` be an extension of geometric field pairs with `C⁺=C∩D⁺`. Both full plus rings occur in the base-change map. For a geometric point and constant torsion coefficients, connectedness gives `H⁰=Λ` and the positive groups vanish; field-extension invariance preserves this computation. If one replaces `D⁺` by `O_D` before taking the pullback, the equality of plus rings can fail and the stated comparison is no longer that map. (Huber (1996), Theorem 4.1.1`(c)`, pp. 238–240; Scholze, *Étale cohomology of diamonds*, Lemma 9.5, pp. 46–47.)

For a completed root tower `C⟨T^(1/p^∞)⟩`, a finite étale cover described by finitely many coefficients descends through a finite-type approximation. The completed limit comparison controls both functions and topology; an inverse limit of point sets alone would not descend that cover. Connectedness at all relevant finite stages gives the single constant section at the limit. `A` two-component disjoint union instead has `H⁰=Λ²` at every stage and at the limit. (Scholze, *Étale cohomology of diamonds*, Lemma 19.4, p. 110; Huber (1996), §2.4, Corollary 2.4.6, p. 129.)

### Dependencies

Use Layers 1–2 and 5–6, `PerfectoidSpaces`, P1–P3 and P7, for the geometric completed-colimit presentation, and `AdicEtaleGeometry`, A1 and A4, for finite-stage étale descent. The finite-type approximation is specialized to full geometric field pairs. Section 7.3 derives geometric connectedness from degree-zero comparison. These are inputs to the proper-support fibres of Layer 8; the invariance is not deduced from analytic duality.

## Layer 8: Proper supports and the all-torsion calculus

### 8.1 Compactifiable maps

Let `f : X → Y` be a morphism of locally noetherian analytic adic spaces (`AdicSpacesPartII`, layer R0 (`locally-noetherian-adic-space`)). `f` is compactifiable if it is separated (`AdicSpacesPartII`, layer R0 (`separated-morphism`)), locally of `+`weakly finite type (`AdicSpacesPartII`, layer R0 (`plus-weakly-finite-type`)) and taut (Section 3.1). This is the class on which Huber's proper-support direct image `R⁺f_`! is defined; it is the class 'separated, taut, locally `+`-weakly finite type' of Zavyalov's comparison with Hub96 Theorem 5.4.3. Distinguished subclasses: `𝓘`, the quasi-compact open immersions; `𝓟`, the proper morphisms (`AdicSpacesPartII`, layer R0 (`universally-closed-and-proper-morphism`)); `𝓔`, the compactifiable morphisms that are quasi-compact (equivalently of `+`weakly finite type). The class contains every proper morphism, every quasi-compact open immersion, every open immersion with taut source, every separated quasi-compact étale morphism (Hub96 Lemma 5.1.3(iv), in Zavyalov’`s` formulation), every separated smooth morphism of finite type between qcqs spaces, and it is closed under composition. It is stable under base change along any morphism of locally noetherian analytic adic spaces when `f` is quasi-compact (then the base change is again quasi-compact quasi-separated, hence taut).

This uses `X` and `Y` are locally noetherian analytic adic spaces. Separatedness and the local `+`weakly-finite-type predicate are the analytic-geometry supplier’`s`. The unrestricted base-change assertion here is for qc `f`; for general `f` the tautness statement of Huber 5.1.4(iii) assumes an adic base change.

(Bogdan Zavyalov, Some foundational results in adic geometry, §9, proof of Theorem 9.4, Step 1, p. 28; Bogdan Zavyalov, Some foundational results in adic geometry, Theorem 1.3(3) `=` Theorem 9.4(3), p. 3; Bogdan Zavyalov, Some foundational results in adic geometry, §9, proof of Theorem 9.4, Step 4, p. 29; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, Conjecture 2.5(ii), p. 6; Huber (1996), §5.1, Definitions 5.1.1–5.1.2 and Lemmas 5.1.3–5.1.4, pp. 272–273.)

Provide `AdicSpace.IsCompactifiable`: The predicate: separated, locally of `+`weakly finite type and taut; `AdicSpace.IsCompactifiable.comp`: Composites of compactifiable morphisms are compactifiable; identities are compactifiable; `AdicSpace.IsCompactifiable.of_isProper`: Proper morphisms are compactifiable; `AdicSpace.IsCompactifiable.of_isOpenImmersion`: Open immersions with taut source are compactifiable; quasi-compact open immersions always are.

Provide `AdicSpace.IsCompactifiable.of_etale`: Separated quasi-compact étale morphisms are compactifiable (Hub96 Lemma 5.1.3(iv)); `AdicSpace.IsCompactifiable.baseChange`: If `f` is compactifiable and quasi-compact then every base change of `f` along a morphism of locally noetherian analytic adic spaces is compactifiable and quasi-compact; `AdicSpace.IsCompactifiable.restrict`: If `f` is compactifiable and `V ⊆ X` is a taut open subspace then `f|_V` is compactifiable; `AdicSpace.IsCompactifiable.locallyOfPlusWeaklyFiniteType`: `A` compactifiable morphism is locally of `+`weakly finite type; in particular it is adic.

**Checks.**

- For `S = Spa(C, C⁺)` the projection `B_S → S` is compactifiable and quasi-compact.
- The open unit disc `D = ⋃_m {|T|ᵐ ≤ |ϖ|} → Spa(C, O_C)` is compactifiable and not quasi-compact.
- The doubled closed disc `→ Spa K` is locally of finite type but not compactifiable.
- Every proper morphism in the sense of `AdicSpacesPartII`, layer R0 is compactifiable.
- The identity of a locally noetherian analytic adic space is compactifiable.

The relative closed unit disc `B_S → S = Spa(C, C⁺)` (`AdicEtaleGeometry`, layer A2 (`relative-closed-polydisc`)) is compactifiable and quasi-compact, `i.e`. lies in `𝓔`. The open unit disc `D → Spa(C, O_C)` is compactifiable but not quasi-compact. The doubled disc over `Spa K` is locally of finite type but neither separated nor taut, hence not compactifiable.

*Needs:* `AdicSpacesPartII`, layer R0 (`locally-noetherian-adic-space`); `AdicSpacesPartII`, layer R0 (`separated-morphism`); `AdicSpacesPartII`, layer R0 (`plus-weakly-finite-type`); `AdicSpacesPartII`, layer R0 (`finite-type-morphism-classes`); `AdicSpacesPartII`, layer R0 (`universally-closed-and-proper-morphism`); `AdicSpacesPartII`, layer R0 (`differentials-unramified-smooth-etale`); `AdicSpacesPartII`, layer R0 (`base-change-stability`); `AdicSpacesPartII`, layer R0 (`fibre-products-existence`); Section 3.1.

### 8.2 Universal compactifications and proper algebraic comparison

Let `f : X → Y` be compactifiable (Section 8.1). There are an adic space `X̄ = X̄^{/Y}`, an open embedding `j : X → X̄` and a partially proper morphism `f̄ : X̄ → Y` (`AdicSpacesPartII`, layer R0 (`partially-proper-morphism`)) with `f = f̄ ∘ j`, such that for every partially proper morphism `g : Z → Y` composition with `j` is a bijection `Hom_Y(X̄, Z) → Hom_Y(X, Z)`. Affinoid charts: if `Y = Spa(A, A⁺)` and `X = Spa(B, B⁺)` with `B` topologically of finite type over `A`, then `X̄ = Spa(B, B'⁺)` where `B'⁺ ⊆ B⁺` is the integral closure in `B` of the subring generated by the image of `A⁺` and the topologically nilpotent elements `B°°`, and `j` is the identity of `B`. The rank-one points of `X̄` and of `X` coincide; every point of `X̄ ∖ j(X)` is a specialisation of a point of `j(X)`, and `X̄ ∖ j(X)` is closed, generally not open, and is treated only as a pseudo-adic support space (the supplier contracts). The construction is functorial in `f`, compatible with open immersions into `X` and with base change along Y' `→ Y` when `f` is quasi-compact ((`X ×_Y` Y')‾`^{/Y'} = X̄^{/Y} ×_Y` Y'), and `X̄ = X` when `f` is partially proper.

This uses `f` compactifiable: separated, locally of `+`weakly finite type, taut; `Y` locally noetherian analytic; `X̄` is in general not locally of finite type over `Y` (its plus rings are minimal), so `f̄` is partially proper but not smooth even when `f` is smooth.

(Scholze, Étale cohomology of diamonds, §18, before Proposition 18.6, p. 103; Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence, proof of Theorem IV.5.3, p. 153; Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence, proof of Theorem IV.5.3, pp. 153–154; Bogdan Zavyalov, Some foundational results in adic geometry, proof of Lemma 9.1, Step 1, p. 24.)

Provide `AdicSpace.compactification`: The adic space `X̄^{/Y}` for a compactifiable `f : X → Y`; `AdicSpace.compactification.ι`: The open embedding `j : X → X̄^{/Y}`; `AdicSpace.compactification.proj`: The partially proper morphism `f̄ : X̄^{/Y} → Y` with `f̄ ∘ j = f`; `AdicSpace.compactification.isPartiallyProper`: `f̄` is partially proper.

Provide `AdicSpace.compactification.lift`: For `g : Z → Y` partially proper and `h : X → Z` over `Y`, the unique `h̄ : X̄ → Z` over `Y` with `h̄ ∘ j = h`; `AdicSpace.compactification.lift_comp_ι`: lift `h ∘ j = h`; `AdicSpace.compactification.hom_ext`: Two `Y`-morphisms `X̄ → Z` to a partially proper `Z` that agree after composing with `j` are equal; `AdicSpace.compactification.affinoid`: For `X = Spa(B, B⁺) → Y = Spa(A, A⁺), X̄ = Spa(B, B'⁺)` with `B'⁺` the integral closure of `A⁺·1 + B°°` in `B`.

Provide `AdicSpace.compactification.rankOne_points`: `j` induces a bijection on points of rank one; every point of `X̄` specialises from a point of `j(X)`; `AdicSpace.compactification.baseChange`: For `f` quasi-compact and Y' `→ Y`, the canonical map (`X ×_Y` Y')‾`^{/Y'} → X̄^{/Y} ×_Y` Y' is an isomorphism; `AdicSpace.compactification.map`: Functoriality in `f` for commutative squares, with `map_id` and `map_comp`.

**Checks.**

- For the closed unit disc `B` over `Spa(C, O_C), B̄ ∖ B` consists of exactly one point, which is closed in `B̄`.
- If `f` is proper then `j : X → X̄` is an isomorphism.
- For the partially proper open unit disc `D → Spa(C, O_C), D̄ = D`.
- For the closed unit disc `B → Spa(C, O_C), B̄ → Spa(C, O_C)` is partially proper but not locally of finite type, hence not smooth: the compactification is not `P¹` and not the closed disc.
- For `P¹ → Spa(C, O_C)` (proper) and the inclusion `B ⊆ P¹`, the induced map `B̄ → P¹` is injective with image the closure of `B`.

Closed unit disc over `S = Spa(C, O_C): X̄ = Spa(C⟨T⟩, B'⁺)` with `B'⁺` the integral closure of `O_C + C°°⟨T⟩`; `X̄ ∖ X` is the single rank-two point `x_∞` specialising the Gauss point in the direction `T → ∞`. If `f` is proper then `X̄ = X` and `j` is the identity. For the open unit disc `D` over `Spa(C, O_C)`, which is partially proper, `D̄ = D`.

*Needs:* Section 8.1; the supplier contracts; `AdicSpacesPartII`, layer R0 (`partially-proper-morphism`); `AdicSpacesPartII`, layer R0 (`separated-proper-partially-proper`); `AdicSpacesPartII`, layer R0 (`universally-closed-and-proper-morphism`); `AdicSpacesPartII`, layer R0 (`fibre-product-points`); `AdicSpacesPartII`, layer R0 (`locally-noetherian-adic-space`).

Let `f : X → Y` be compactifiable and quasi-compact (`i.e`. of `+`weakly finite type), with universal compactification `f = f̄ ∘ j` (Section 8.2). Then (i) `f̄ : X̄ → Y` is proper; (ii) `j` is a quasi-compact open immersion; (iii) `dim.tr f̄ = dim.tr f`, by the completed transcendence-dimension contract below. In particular every `f ∈ 𝓔` factors as `f = p ∘ i` with `i ∈ 𝓘` and `p ∈ 𝓟`.

This uses `f` compactifiable and quasi-compact; `Y` locally noetherian analytic.

(Bogdan Zavyalov, Some foundational results in adic geometry, proof of Theorem 9.4, Step 1, p. 28; Bogdan Zavyalov, Some foundational results in adic geometry, proof of Lemma 9.1, Step 1, p. 24; Scholze, Étale cohomology of diamonds, Corollary 18.8(vi), p. 106.)

For the closed unit disc over `Spa(C, C⁺), B → B̄` is a quasi-compact open immersion and `B̄ → Spa(C, C⁺)` is proper with `dim.tr = 1`. Non-example: for the open unit disc (not quasi-compact) the compactification is `D` itself and `D → Spa(C, O_C)` is partially proper but not proper.

*Needs:* Section 8.2; `AdicSpacesPartII`, layer R0 (`proper-iff-partially-proper-quasi-compact`); `AdicSpacesPartII`, layer R0 (`universally-closed-and-proper-morphism`); `AdicSpacesPartII`, layer R0 (`plus-weakly-finite-type`).

**Completed transcendence dimension and compactification invariance.** For an extension `E⊆F` of nonarchimedean fields, define `tr.c(F/E)` as the least finite bound on `trdeg(L/E)` among intermediate fields `L` from which finitely many repetitions of relative algebraic closure in `F` followed by topological closure in `F` reach `F`; put `tr.c(F/E)=∞` when no finite bound exists. Prove invariance under topological isomorphisms of field extensions and tower subadditivity. For an analytic adic morphism `f:X→Y`, define `dim.tr f = sup_{x∈X} tr.c(κ̂(x)/κ̂(f(x)))`, with empty supremum `−∞`, using the completed residue fields of `AdicSpacesPartII`, layer R0. Prove invariance under isomorphisms of morphisms and monotonicity on open subspaces of `X`.

For a quasi-compact separated taut `+`weakly finite type morphism `f:X→Y` of locally noetherian analytic adic spaces, let `j:X→Xᶜ` and `fᶜ:Xᶜ→Y` be its universal compactification. Then `fᶜ` is proper and `dim.tr fᶜ = dim.tr f`. Every added point specializes from a point of `X`, and the induced completed residue-field extensions are isomorphic, including the corresponding base fields; this preserves their `tr.c`. In particular a finite upper bound remains valid at the added higher-rank points. The morphism `fᶜ` need not be locally of finite type.

This uses `f` is in the universal-compactification scope of Sections 8.1–8.2; no rank-one-fibre criterion is required for `fᶜ`.

(Huber (1996), Definitions 1.8.2 and 1.8.4 and Remark 1.8.3(i), p. 91; Corollary 5.1.14 and its proof, p. 280; Bogdan Zavyalov, Some foundational results in adic geometry, Lemma 9.1, proof of (1), p. 24.)

**Checks.**

- Over the unique rank-one point of `Spa(C,O_C)`, the compactified closed disc's fibre contains the added exterior rank-two point. The fibres differ although `j` is a bijection on rank-one points and both morphisms have `dim.tr = 1`.
- For a proper `f`, `j` is an isomorphism and the equality of completed transcendence dimensions is immediate.
- The empty morphism to a nonempty base has `dim.tr = −∞`; the identity of a nonempty analytic space has `dim.tr = 0`.

*Needs:* Sections 8.1–8.2; `AdicSpacesPartII`, layer R0 (completed residue fields and their specialization isomorphisms); Mathlib field algebraicity, transcendence degree and topological closure.

(Huber 3.7.1) Let `R` be an adic space, `S` a scheme and `φ: R → S` a morphism of locally ringed spaces; let `X, Y` be schemes locally of finite type over `S` and `f: X → Y` an `S`-morphism; put `X^ad = X ×_S R, Y^ad = Y ×_S R` (`AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`)) with `f^ad: X^ad → Y^ad`, and let `φ_X, φ_Y` be the induced morphisms of étale sites, which form a commutative square with `f` and `f^ad`. (Theorem 3.7.2) If `f` is proper and `Λ` is a torsion ring, the base-change transformation `φ_Y^* ∘ R⁺f_* → R⁺f^ad_* ∘ φ_X^*` of functors `D⁺(X_ét, Λ) → D⁺((Y^ad)_ét, Λ)` is an isomorphism. Here `φ^*` is inverse image. No constructibility and no condition on the torsion relative to the residue characteristics is imposed. (Lemma 3.7.3) For proper `f` the morphism `f^ad` is separated and quasi-compact, indeed proper; this is imported from `AdicSpacesPartII`, layer R1 (`analytification-separated-proper`) `(ii′)`. The generality of `R` is that in which the fibre product exists (R1); no non-noetherian extension is added.

This uses `X` and `Y` are locally of finite type over a scheme `S`; `R` is an adic space satisfying the locally noetherian standing condition and `R→S` is locally ringed. Require `f` proper and `Λ` torsion.

(Huber (1996), §3.7, Theorem 3.7.2, p. 226; Huber (1996), §3.7, proof of 3.7.2, p. 227; Huber (1996), §3.7, Lemma 3.7.3, p. 227.)

For `R = Spa(C, O_C)` and `S = Spec C` this compares proper pushforward of algebraic torsion sheaves with the analytic pushforward; `p`-torsion over a mixed-characteristic field is allowed; for `f` the identity the comparison is the identity; it is not coherent GAGA.

*Needs:* `AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`); `AdicSpacesPartII`, layer R1 (`analytification-separated-proper`); Section 2.3; Section 2.5; Section 1.5; Section 1.1; `SchemeAndStackFoundations`, Layer 2.

Prove `proper_trait_comparison_agreement`: for a proper locally finite-type scheme `X` over a strictly henselian DVR and prime-to-residue torsion `K∈D⁺((X_η)_ét)`, the equivariant trait comparison of Section 5.5, composed with LPV.0's proper specialization map, equals the proper algebraic comparison just constructed. Identify both maps through the same adjunction transformation before taking global sections. Preserve the inertia action and the coefficient maps. (Huber (1996), Theorem 3.7.2 and proof, pp. 226–227; Corollary 3.5.17 and proof, p. 210.)

**Checks.**

- For `X=Spec A`, both comparisons are the identity on the geometric generic stalk of `K` with its inertia action.
- For proper smooth `X` and constant prime-to-residue coefficients, the common comparison is the smooth specialization isomorphism with trivial inertia.
- `A` nontrivial inertia module on the generic point retains its action under both maps; equality is equivariant equality of transformations, not equality of dimensions.

*Needs:* the preceding proper comparison; Section 5.5; `LefschetzPencilsAndVanishingCycles`, LPV.0 §0.6.

For a commutative triangle of `k`-schemes `U→^j X→^g Y` with `g` proper, `h=g∘j:U→Y` an open immersion, `j` an open immersion and `j(U)=g⁻¹(h(U))`, every abelian sheaf `F` on `U^rig_ét` has a canonical isomorphism `h^rig_`!`F→Rg^rig_* j^rig_`!`F`. No constructibility, invertibility or finite-stalk condition on `F` is added. The equality of opens ensures `g` is an isomorphism above `h(U)`, so the comparison is the identity there.

This uses Schemes are locally of finite type over a complete nonarchimedean field. Require `g` proper, `j` and `h` open immersions and `j(U)=g⁻¹(h(U))`; `F` is an arbitrary abelian étale sheaf on `U^rig`.

(Huber (1996), §3.8, proof of Lemma 3.8.2, p. 229.)

For `g=`id, recover extension by zero; omit the inverse-image equality and the statement is not asserted.

*Needs:* `AdicSpacesPartII`, layer R1 (`analytification-separated-proper`); Section 1.2; Section 1.5.

The curve compactification constructions use the following geometric inputs, with the following scopes.

Define `RelativelyCompactRigidOpen U X S` for a qcqs rigid base `S` and a qc open `U⊆X`: some admissible formal `S`-model induces `U` as a formal open whose schematic special-fibre closure is proper over the special fibre of `S`. Define the corresponding subset condition by containment in such an open. Keep the chosen model as witness data, and prove independence under common admissible refinements. (Lütkebohmert (1995), Definition 7.1, pp. 211–212.)

Provide `relativeCompact.exists_model`, `relativeCompact.refinement`, downward closure in `U`, restriction to an intermediate ambient open when the closure is retained, and compatibility with products over the base. For polydiscs over a complete DVR field, record the strict inequality criterion of Lemma 7.3, p. 212: in the coordinates transverse to the base, every smaller radius must be strictly below the larger radius.

**Checks.**

- Every qc open in a proper rigid `S`-space satisfies the condition, including the whole proper space.
- A closed disc of radius `r` inside a closed disc of radius `r′` is relatively compact over a point when `r<r′`; equal radii fail.
- In a relative polydisc only the transverse radii require strict shrinking. `A` coordinate belonging to the base is retained.
- Witnesses transported through an admissible blow-up give the same predicate although the special-fibre models differ.

Prove `rigid_smooth_weierstrass_approximation`: `R` is a complete DVR, `S=Spf A` is admissible affine, `X→S` is separated admissible and rig-smooth, `Z→S` is admissible with affinoid generic fibre, and `U⊆Z` is a formal open whose generic fibre is a Weierstrass domain. If `φ:U→X` has relatively `S`-compact image, then for every approximation order `N` there is an admissible blow-up `Z′→Z`, finite over `U`, a formal open `U′⊆Z′` containing the schematic closure of the pulled-back `U₀`, and a map `φ′:U′→X` agreeing with `φ` modulo `πᴺ`. The schematic closure of `U′₀` is proper over the schematic closure of `U₀` in `Z₀`. If `φ` on generic fibres is an open immersion, `φ′` can be chosen to be one too. This is a scoped approximation theorem, with the Weierstrass, relative-compactness and rig-smoothness hypotheses retained. (Lütkebohmert, Theorem 7.4, pp. 212–213, proof pp. 214–216.)

The affine proof approximates the target coordinates using density of functions on the Weierstrass domain. Relative compactness provides monic relations for their reductions. Blow up the ideals generated by those relations and powers of `π`, taking the chart where the prescribed `π`-power generates; this enlarges the formal neighborhood and controls boundedness. Apply Elkik’`s` rig-smooth correction to the approximate equations. The precise correction input is: for a rig-smooth affine formal target `V`, there is an integer `c(V)` such that every map modulo `πᴺ, N≥c(V)`, lifts to a formal map agreeing modulo `πᴺ⁻ᶜ⁽ⱽ⁾`. (Proposition 7.5, p. 213; the noetherian henselian approximation is `PerfectoidSpaces`, layer P3.) For a general separated target, apply this to the graph and an affinoid neighborhood of its relatively compact image. Approximate inverses and separate the formal connected components after blowing up to retain an open immersion. Lemmas 7.6–7.7, pp. 213–216, supply the neighborhood enlargement and separation steps. These are inputs to extension of compactifications, without assuming a general approximation theorem from formal geometry.

Prove the curve case of `reduced_fibre_formal_model`: let `X→S` be flat between qcqs admissible formal schemes over a complete rank-one valuation ring, with geometrically reduced equidimensional one-dimensional rigid fibres. After a rig-étale cover `S′→S` there is a finite rig-isomorphism `Y′→X×_S S′` such that `Y′→S′` is flat and all its geometric formal fibres are reduced. A finite rig-isomorphism is an isomorphism on generic fibres, so this gives a reduced-fibre formal model étale locally on the rigid base. The DVR case used in smooth-family finiteness is included. (Bosch–Lütkebohmert–Raynaud, *Formal and rigid geometry IV*, Theorem 2.1, p. 367; its scheme version Theorem `2.1′`, p. 368.)

Build this from flattening (`AdicSpacesPartIII`, layer R2), finite normalization of curve charts and the two scoped reduction steps: Proposition 2.2, p. 369, lowers the maximal geometric multiplicity after a rig-étale localization, while Proposition 2.3, pp. 369–370, removes embedded components by a finite rig-isomorphism after blowing up. The first uses a monogenous finite-flat presentation over a smooth curve chart and the relative maximum principle to choose a translated and rescaled generator with smaller multiplicity. The second uses the finite extension obtained by taking the relative closure of the generic reduced structure. Uniqueness of the finite modification and étale descent, Lemma 2.4, p. 370, glue the charts. Maximal multiplicity is a positive integer and falls until it equals one, so the procedure terminates. A smooth formal curve already satisfies the conclusion with identity maps; a ramified model may require a finite separable base extension, and reduction of the generic fibre alone does not force the original special fibre to be reduced.


*Needs:* Layers 1–4; universal compactifications and proper algebraic comparison in this section; `AdicSpacesPartII`, layers R0–R1, and `AdicSpacesPartIII`, layers R2–R3; `PerfectoidSpaces`, layer P3; `SchemeAndStackFoundations`, Layers 2 and 4; the algebraic curve and Serre duality interfaces of `TauCetiRoadmap.AlgebraicCurves`, layer 12, and `JacobianChallenge`, layer `B`. The algebraic Hilbert schemes used here are supplied by `SchemeAndStackFoundations`, Layer 4, Section 4.14; stable pointed-curve moduli belong to `SchemeAndStackFoundations`, Layer 4, Section 4.15.

Let `X → S` be a flat morphism of admissible formal schemes over a complete discrete valuation ring whose associated rigid morphism is a smooth rigid curve fibration, and let `U` be the image of `X` in `S`. `X` is `S`-compactifiable if there is an open `S`-immersion of `X` into a flat projective formal curve `C → U` whose associated rigid curve `C_rig → U_rig` is smooth (Lütkebohmert, Definition 5.6). The curve `C` is projective over the image `U`, not over `S`. For an open formal subscheme `U′ ⊆ S, X` is `S`-compactifiable over `U′` if `X ×_S U′` is `U′`-compactifiable.

This uses `R` a complete discrete valuation ring with fraction field `K` (the standing notation of the article, p. 167); admissible formal schemes over `Spf R`; `X → S` a flat morphism of admissible formal schemes whose associated rigid morphism `X_rig → S_rig` is a smooth rigid curve fibration: quasi-compact, quasi-separated, smooth, with purely one-dimensional fibres (p. 196); The image `U` of `X → S` is part of the definition.

(Lütkebohmert (1995), §5, Definition 5.6, p. 200.)

Provide `FormalCurve.compactification_data`: Extract `U`, the flat projective formal `U`-curve `C`, the open immersion and smooth rigid fibres; `FormalCurve.compactifiable_baseChange`: Admissible formal base change preserves the property when the pulled-back flat morphism and open image satisfy the same contracts; `FormalCurve.compactifiable_genericFibre`: The generic-fibre map factors as an open immersion into a smooth proper relative rigid curve over `U_rig`, agreeing with Layers 8–9 compactifiability; `FormalCurve.IsSCompactifiableOver`: For an open formal subscheme `U′` of `S, X` is `S`-compactifiable over `U′` if and only if `X ×_S U′` is `U′`-compactifiable (third clause of Definition 5.6); this is the form used in the proof of Theorem 5.3.

**Checks.**

- `A` flat projective formal curve with smooth rigid fibres and image `S` is compactifiable via its identity immersion.
- An affine open chart of the projective formal line over `S` is `S`-compactifiable by its given embedding.
- The formal surface `Spf R⟨S,T⟩` over `Spf R` is not an `S`-compactifiable formal curve: its rigid fibre has dimension two. A definition retaining only an open immersion into a proper formal space would wrongly admit it.

`A` flat projective formal curve with smooth rigid fibres is `S`-compactifiable by the identity; an affine chart of the formal projective line is `S`-compactifiable by its inclusion.

*Needs:* `AdicSpacesPartIII`, layer R2 (`admissible-formal-scheme`); `AdicSpacesPartIII`, layer R2 (`raynaud-generic-fibre`); Section 8.1; `AdicSpacesPartIII`, layer R2.

(Proposition 5.4.) Over a complete discrete valuation ring, let `f: X → S` be a flat affine morphism of admissible formal schemes with reduced geometric fibres that are equidimensional of dimension 1. Then there are a stratification `S₀ = S₀¹ ∪` … `∪ S₀ʳ` of the special fibre by subschemes and a rig-étale cover `S′ → S` such that `X′ = X ×_S S′` admits a projective compactification `P^ρ` over the formal completion of `S′` along each stratum, which can be chosen smooth at infinity, together with a closed subscheme `Δ^ρ` of `P^ρ` that is an ample relative Cartier divisor. (Lemma 5.5.) Around a point `s` of `S₀`, with `𝒥` a finitely generated ideal with zero set the closure of `s`: there are an open neighbourhood `U` of `s`, a rig-étale cover `U′ → U` and, for every `n`, a projective flat scheme `P′(n)` over the reduction `U′(n)` modulo `𝒥ⁿ` with an open immersion of `X′(n)`, such that the geometric fibres of `P′(n)` are reduced, `P′(n)` is smooth along `P′(n) − X′(n), X′(n)` is fibrewise dense, and there is an ample invertible sheaf `O(Δ(n))` for a relative Cartier divisor `Δ(n)` containing `P′(n) − X′(n)` and contained in the smooth locus; the `P′(n)` and `Δ(n)` can be chosen coherently in `n`. These are compactifications over completions along strata of the special fibre, a topology finer than the given one; they are not yet a compactification over the rigid generic fibre.

This uses `R` a complete discrete valuation ring (standing notation, p. 167); `X → S` flat affine, admissible formal schemes; geometric fibres reduced and equidimensional of dimension 1; Rig-étale covers and formal completions along subschemes of the special fibre are supplied by `AdicSpacesPartIII`, layer R2.

(Lütkebohmert (1995), §5, Proposition 5.4 (Infinitesimal compactification), p. 197; Lütkebohmert (1995), §5, Lemma 5.5 (d), p. 198.)

The boundary is smooth and contained in the divisor at every level; the completion is along a stratum, not along the special fibre of `S`.

*Needs:* `AdicSpacesPartIII`, layer R2 (`admissible-formal-scheme`); `AdicSpacesPartIII`, layer R2; Tau Ceti TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts.

With `X → S` as in the definition of `S`-compactifiable, `X` is locally `S`-compactifiable if every closed point `x₀` of the special fibre `X₀` has an open neighbourhood `V` in `X` that is `S`-compactifiable (Lütkebohmert, Definition 5.6); and `X` is locally `S`-compactifiable over an open `U′ ⊆ S` if `X ×_S U′` is locally `U′`-compactifiable. This is a property at closed points of the special fibre; it does not ask for one projective completion of `X`.

This uses `R` a complete discrete valuation ring with fraction field `K` (the standing notation of the article, p. 167); admissible formal schemes over `Spf R`; `X → S` a flat morphism of admissible formal schemes whose associated rigid morphism `X_rig → S_rig` is a smooth rigid curve fibration: quasi-compact, quasi-separated, smooth, with purely one-dimensional fibres (p. 196).

(Lütkebohmert (1995), §5, Definition 5.6, p. 200.)

Provide `FormalCurve.local_compactification_at`: At every closed special-fibre point choose an open neighborhood and its `S`-compactification; `FormalCurve.compactifiable_isLocal`: `A` global `S`-compactification implies the local property by restricting its open immersion to neighborhoods; `FormalCurve.local_compactifiable_open`: The local property restricts to a formal open subcurve, with its inherited open base image.

**Checks.**

- `A` projective smooth formal curve is locally compactifiable.
- For an affine open of the formal projective line, the original projective line supplies the neighborhood completion.
- `A` formal open cover by `S`-compactifiable subcurves supplies a witness around every closed special-fibre point; the definition must not demand one common projective completion.

`A` formal open cover by `S`-compactifiable subcurves gives the property, with a separate completion for each member of the cover.

*Needs:* Section 8.2; `AdicSpacesPartIII`, layer R2 (`admissible-formal-scheme`).

(Proposition 5.7.) Let `K` be the fraction field of a complete discrete valuation ring `R`, and `X → S` a flat affine morphism of admissible formal schemes whose associated rigid map is a smooth rigid curve fibration. Let `V = Spf(B)` be an open affine formal subscheme of `X` that is faithfully flat over an open affine `U = Spf(A)` of `S`, and assume `V` is `S`-compactifiable. Then, after base change by an admissible formal blowing-up `S′ → S`, there are an admissible formal blowing-up `X′ → X` and an open formal subscheme `V′` of `X′` such that the schematic closure of `(X′ ×_X V)₀` is contained in `V′₀` and `V′` is `S`-compactifiable. (Lemma 5.8.) The Hilbert scheme `H(d, g, N)` of closed subschemes of `P^N` that are smooth curves of genus `g` and degree `d` is smooth over `ℤ` if `d ≥` 2g `− 1`.

This uses Exactly the hypotheses of Proposition 5.7: complete discrete valuation ring, `X → S` flat affine with smooth rigid curve fibration, `V` affine and faithfully flat over an affine open `U` of `S, V S`-compactifiable; Use the scoped relative compactness and approximation theorem below; the formal geometry supplier supplies blowing-ups and generic fibres.

(Lütkebohmert (1995), §5, Proposition 5.7 (Extension of compactifications), p. 200 (proof pp. 200–202); Lütkebohmert (1995), §5, Lemma 5.8, p. 202.)

Admissible blowing-ups do not change the rigid generic fibre; the special fibre of the new chart contains the closure of the old one. Embed the given compactification by an ample line bundle of fibre degree at least 2g`−1`. The smooth Hilbert locus is smooth by lifting curves and divisors, with the obstruction `H¹` of the ample divisor vanishing. Approximate its classifying map, then the immersion, by the scoped approximation theorem above, and flatten by admissible blowing-up. This enlarges the formal chart while preserving the rigid generic fibre.

*Needs:* Section 8.2; `AdicSpacesPartIII`, layer R2 (`admissible-blow-up`); `AdicSpacesPartIII`, layer R2 (`generic-fibre-inverts-admissible-blow-ups`); `AdicSpacesPartIII`, layer R2 (`flattening-by-blow-up`); `AdicSpacesPartIII`, layer R2; `AdicEtaleGeometry`, layer A1.0.4 (`elkik-noetherian-henselian-approximation`); Tau Ceti TauCetiRoadmap/JacobianChallenge#layer-`b`-coherent-cohomology-over-`k`-genus-riemannroch-serre-duality.

Let `K` be the fraction field of a complete DVR `R` and `f:X→S` a smooth rigid curve fibration, meaning smooth qcqs with purely one-dimensional fibres. Étale locally on `S` and locally on `X`, there is a smooth projective `S`-compactification: for charts `S′→S` and an open `U⊂X×_S S′, U` admits an open immersion into a smooth projective `S′`-curve. This is the exact scope of Lütkebohmert Theorem 5.3. It does not state a global compactification of `X`, and it does not directly cover a nondiscretely valued algebraically closed field.

This uses Complete discrete valuation base; smooth quasi-compact quasi-separated rigid morphism with pure one-dimensional fibres; Locality on the source and étale locality on the base are part of the conclusion.

(Lütkebohmert (1995), §5, Theorem 5.3, p. 197 (proof pp. 202–203).)

A proper smooth projective curve is already its own compactification; source charts and base cover remain explicit in a nonproper family. First use the reduced-fibre model theorem above. Apply infinitesimal compactification to each special-fibre stratum. The strata yield rational rigid neighborhoods defined by bounds on their equations; the approximation theorem extends the compactifications over these neighborhoods. Noetherian induction makes the construction finite. The resulting compactification is local on the source and étale local on the base.

*Needs:* Section 8.2; `AdicSpacesPartIII`, layer R2 (`generic-fibre-inverts-admissible-blow-ups`); `AdicSpacesPartIII`, layer R2.

For the nondiscrete geometric case define `SemistableFormalCurveModel` over `O_C` by pure one-dimensional special fibre and étale local smooth charts or node charts `O_C⟨S,T⟩`/(ST`−α`), `α∈𝔪_C`. Rig-smoothness is the additional condition `α≠0` at every node. The model and its formal charts retain their `O_C` structure; the discrete semistable symbols of Section 4.6 are a different coefficient computation. (Li–Reinecke–Zavyalov, Definition 4.1.3 and Remark 4.1.4, p. 30.)

Provide `SemistableFormalCurveModel.nodeChart`, `smoothChart`, `specialFibre_pure_one`, `genericFibre_smooth_iff`, admissible refinement, and restriction to a formal open. The compatible-model theorem at the end of this section supplies a proper model and its open submodel together, so compatibility of the two is part of the output.

**Checks.**

- The formal projective line is semistable with no nodes and is rig-smooth.
- For `0≠α∈𝔪_C` the node chart has nodal special fibre and smooth annular generic fibre; `α=0` remains a permissible semistable chart but has singular generic fibre.
- Over `C=ℂ_p` the definition still applies: neither `O_C` nor its value group is declared discrete.
- Restricting to the formal open defining a closed disc preserves semistability while losing properness.


*Needs:* `AdicSpacesPartIII`, layer R2, for admissible formal `O_C`-models and their étale charts.

Let `C` be algebraically closed, complete and nontrivially valued. Every smooth affinoid curve over `Spa(C,O_C)` is an open subspace of a proper smooth curve. Every qc separated irreducible smooth curve is either affinoid or proper; applying this to its finitely many components gives a proper smooth compactification for an arbitrary qc separated smooth curve. In particular every point has a qc open neighborhood that embeds into such a proper curve. Prove the stronger global statement and retain the local form used in the frontier argument. Construct compatible semistable formal `O_C`-models of the proper curve and its affinoid open; this uses nondiscrete formal models over `O_C`, not a claim that `C` is discretely valued.

This uses The plus ring is `O_C`. The curves are smooth of pure dimension one, qc and separated. For disconnected curves compactify the finitely many components separately.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, §4.1, Proposition 4.1.6(i),(iii),(iv),(v), pp. 30–31.)

The closed disc and a closed annulus embed in `P¹_C`. A proper curve needs no added boundary. The field `C=`completed algebraic closure of `Q_p` is admissible even though its value group is not discrete. For the proper formal model, lift an ample line bundle on the one-dimensional special fibre through the `π`-adic thickenings using `H²=0`. Formal GAGA algebraizes it as a finitely presented projective `O_C`-curve. Admissibility makes this algebraization flat, and analytification reflects smoothness of its generic fibre. Apply stable modification over the rank-one valuation ring and complete; the modification is an isomorphism on the generic fibre. The affinoid open is pulled back to an open formal subscheme of the resulting semistable model. The irreducible qc dichotomy and affinoid embedding are Li–Reinecke–Zavyalov Proposition 4.1.6(`i`,iii), pp. 30–31; the model construction is its proof of (iv), using Lemma 4.1.5, p. 30, and Temkin Theorem 1.5, p. 4. This proves the global assertion componentwise without applying a discrete-valuation theorem to `C`.

*Needs:* Section 3.1; `AdicSpacesPartIII`, layer R2.

Prove `semistable_curve_prescribed_normalization`: for a proper semistable formal `O_C`-curve and a finite set of closed special-fibre points meeting every irreducible component, there is a finite map to the formal projective line whose special-fibre inverse image of infinity is exactly that set. Choose an effective Cartier divisor with that support, ample because it meets every component; sufficiently high powers have a second section with no common zero. Lift the ample bundle and both sections through the `π`-adic thickenings, after a high enough power kills `H¹`, and apply Nakayama to retain their joint generation. The resulting proper quasi-finite map is finite. The prescribed points need not be nodes. (Li–Reinecke–Zavyalov, Lemma 4.1.7, pp. 31–32.) `A` one-component projective line with one point gives the identity normalization; prescribing one point on only one of two components is excluded by the component condition.

Prove `qc_curve_finite_valuation_boundary`: for a qc separated smooth rigid curve over `Spa(C,O_C)`, the boundary of its universal compactification is finite and discrete, and its points have rank two. For a smooth affinoid curve, use the compatible proper semistable model above and the prescribed normalization to reduce its boundary to that of a closed disc under a finite map. Finite maps of universal compactifications preserve the inverse image of the original open, so their boundary is the finite inverse image of the disc’`s` single exterior rank-two valuation. A finite affinoid cover and the universal property extend the conclusion to qc separated curves. `A` boundary point has a proper rank-one generization and at most one extra value-group rank by the transcendence-degree-one inequality. (Li–Reinecke–Zavyalov, Lemmas 4.2.1–4.2.2 and 4.2.4 with Example 4.2.3, pp. 32–33.)

Consequently, for a qc open `U` in a qc separated smooth curve `X`, its frontier in `X` is finite and discrete: the proper map Uᶜ`→`Xᶜ carries the finitely many boundary points of Uᶜ onto the specializations of `U` outside `U` that lie in `X`. Separatedness identifies the relative compactification with the relevant open part of this absolute one. Each frontier point has rank two. The closed unit disc’`s` universal boundary has one exterior point, whereas its boundary inside itself is empty. For an annulus strictly inside the disc the interior frontier consists of its two endpoint refinements, with the orientation fixed in Section 9.3.


*Needs:* Layers 1–4; universal compactifications and proper algebraic comparison in this section; `AdicSpacesPartII`, layers R0–R1, and `AdicSpacesPartIII`, layers R2–R3; `PerfectoidSpaces`, layer P3; `SchemeAndStackFoundations`, Layers 2 and 4; the algebraic curve and Serre duality interfaces of `TauCetiRoadmap.AlgebraicCurves`, layer 12, and `JacobianChallenge`, layer `B`. The algebraic Hilbert schemes used here are supplied by `SchemeAndStackFoundations`, Layer 4, Section 4.14; stable pointed-curve moduli belong to `SchemeAndStackFoundations`, Layer 4, Section 4.15.

### 8.3 Lower shriek and independence of compactification

Let `f : X → Y` be a partially proper morphism of locally noetherian analytic adic spaces with `f` taut (so `f` is compactifiable) and `Λ` a ring. For an étale sheaf `F` of `Λ`-modules on `X, f_`!`F ⊆ f_*F` is the subsheaf whose sections over `V ∈ Y_ét` are the `s ∈ F(X ×_Y V)` whose support `supp(s)` (a closed subset of `X ×_Y V`) is quasi-compact over `V: supp(s) ∩ f⁻¹(W)` is quasi-compact for every quasi-compact open `W ⊆ V`. Equivalently, when `Y` is affinoid, `f_`!`F = colim_U f_*(j_{U!}(F|_U))` over the filtered system of quasi-compact open subsets `U ⊆ X`, where `j_U : U → X` is the inclusion (Section 1.2). `f_`! : `Sh(X_ét, Λ) → Sh(Y_ét, Λ)` is left exact, commutes with filtered colimits, equals `f_*` when `f` is proper, and `R⁺f_`! denotes its right derived functor on `D⁺(X_ét, Λ)` (via injective resolutions, Section 1.1). Stalk formula: for a geometric point `ȳ = Spa(C, C⁺) → Y, (f_!F)_ȳ` is the group of sections of `F` over `X ×_Y Spa(C, C⁺)` with support quasi-compact.

This uses `f` partially proper and taut; `Y` locally noetherian analytic; supports are quasi-compact relative to the base, never compact in a Hausdorff sense: the relevant spaces are not Hausdorff.

(Bogdan Zavyalov, Some foundational results in adic geometry, proof of Theorem 9.4, Step 5, p. 30; Berkovich (1993), §5.1, after Example 5.1.3, p. 98.)

Provide `AdicSpace.properSupportSections`: The subsheaf `f_`!`F ⊆ f_*F` of sections with support quasi-compact over the base; `AdicSpace.properSupportSections.le_pushforward`: The inclusion `f_`!`F → f_*F`, natural in `F`; `AdicSpace.properSupportSections.eq_of_isProper`: For proper `f` the inclusion is an isomorphism; `AdicSpace.properSupportSections.colim`: The colimit description over quasi-compact opens for affinoid `Y`.

Provide `AdicSpace.properSupportSections.leftExact`: `f_`! is left exact and additive; `AdicSpace.properSupportSections.preservesFilteredColimits`: `f_`! commutes with filtered colimits of sheaves; `AdicSpace.properSupportSections.stalk`: `(f_!F)_ȳ =` sections over `X ×_Y Spa(C, C⁺)` with quasi-compact support; `AdicSpace.properSupportSections.comp`: `(g ∘ f)_`! `= g_`! `∘ f_`! for composable partially proper taut morphisms.

Provide `AdicSpace.RProperSupportSections`: The right derived functor `R⁺f_`! : `D⁺(X_ét, Λ) → D⁺(Y_ét, Λ)`.

**Checks.**

- For `f : D → Spa(C, O_C)` the open unit disc and `Λ = ℤ/n, f_`!`Λ = 0`.
- If `f` is proper then `f_`! `= f_*` as subfunctors.
- For `f =` id, `f_`! `=` id.
- For the open unit disc and `Λ ≠ 0, f_`!`Λ ≠ f_*Λ`: the unit section has non-quasi-compact support.
- For `Y` affinoid, `f_`!`F ≅ colim_U f_*(j_{U!}(F|_U))` over quasi-compact opens `U ⊆ X`.

For the open unit disc `f : D → Spa(C, O_C), f_`!`Λ = 0` while `f_*Λ = Λ`. For `P¹ → Spa(C, C⁺)` (proper), `f_`! `= f_*`.

*Needs:* `AdicSpacesPartII`, layer R0 (`partially-proper-morphism`); Section 3.1; Section 8.1; Section 1.2; Section 1.1; `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`); `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`); `AdicSpacesPartII`, layer R0 (`locally-noetherian-adic-space`); Section 1.5.

Let `f : X → Y` be compactifiable (Section 8.1), `f = f̄ ∘ j` its universal compactification (Section 8.2) and `Λ` a ring. The proper-support direct image is `R⁺f_`! :`= R⁺f̄_`! `∘ j_`! : `D⁺(X_ét, Λ) → D⁺(Y_ét, Λ)`, where `j_`! is extension by zero along the open embedding `j` (exact; Section 1.2) and `R⁺f̄_`! is the derived functor of sections with proper support for the partially proper `f̄` (Section 8.3). Its cohomology sheaves are `R^q f_`!`K`, and for `Y = Spa(C, C⁺)` the groups `H^q_c(X, K) := H^q(Y, R⁺f_!K) = (R^q f_!K)(Y)` are the compactly supported cohomology groups (global sections over `Spa(C, C⁺)` is exact). There is a natural forget-supports transformation `R⁺f_`! `→ R⁺f_*`, an isomorphism when `f` is proper. When `f` is quasi-compact, `R⁺f_`! `≅ Rf̄_* ∘ j_`! with `f̄` proper (Section 8.2). When `nΛ = 0` with `n` invertible in `O_Y⁺` and `f` is locally of finite type of finite relative dimension, `R⁺f_`! has finite cohomological dimension (Section 8.4) and extends uniquely to a triangulated functor `Rf_`! : `D(X_ét, Λ) → D(Y_ét, Λ)` commuting with direct sums, computed on `K`-injective replacements (`EnhancedDerivedSheaves`, §§0.1–0.4 (`K`-injective and `K`-flat replacements)).

This uses `f` compactifiable between locally noetherian analytic adic spaces; `Λ` any ring for the definition on `D⁺`; the unbounded extension, base change and duality statements require `nΛ = 0` with `n` invertible in `O_Y⁺`; `H^q_c` is always relative to the base; for the absolute case the base is `Spa(C, C⁺)` and `C⁺` is part of the data.

(Bogdan Zavyalov, Some foundational results in adic geometry, Theorem 1.3(3), p. 3; Bogdan Zavyalov, Some foundational results in adic geometry, proof of Theorem 9.4, Step 1, p. 28; B. Bhatt, D. Hansen, The six functors for Zariski-constructible sheaves in rigid geometry, §3.4, p. 20; Scholze, Étale cohomology of diamonds, §1, p. 2.)

Provide `AdicSpace.lowerShriek`: The triangulated functor `R⁺f_`! : `D⁺(X_ét, Λ) → D⁺(Y_ét, Λ)` for compactifiable `f`; `AdicSpace.lowerShriek_def`: `R⁺f_`! `≅ R⁺f̄_`! `∘ j_`! for the universal compactification; `AdicSpace.lowerShriek_of_isCompact`: For quasi-compact `f, R⁺f_`! `≅ Rf̄_* ∘ j_`! with `f̄` proper; `AdicSpace.lowerShriekToPushforward`: The natural transformation `R⁺f_`! `→ R⁺f_*` (forget supports).

Provide `AdicSpace.lowerShriekToPushforward_isIso_of_isProper`: It is an isomorphism for proper `f`; `AdicSpace.compactCohomology`: `H^q_c(X/Y, K) := H^q(Y, R⁺f_!K)`; for `Y = Spa(C, C⁺)` it is `(R^q f_!K)(Y)`; `AdicSpace.lowerShriek_shift`: `R⁺f_`!`(K[m]) = (R⁺f_!K)[m]`, and `R⁺f_`! sends distinguished triangles to distinguished triangles; `AdicSpace.lowerShriekUnbounded`: Under finite cohomological dimension, the extension `Rf_`! : `D(X_ét, Λ) → D(Y_ét, Λ)`, commuting with direct sums and agreeing with `R⁺f_`! on `D⁺`.

Provide `AdicSpace.lowerShriek.map_comp`: Composition isomorphisms `R(g ∘ f)_! ≅ Rg_`! `∘ Rf_`! (Section 8.3).

**Checks.**

- For `B → Spa(C, O_C)` and `n` invertible in `O_C, R²f_`!`μ_n ≅ ℤ/n` and `R^q f_`!`μ_n = 0` for `q ≠ 2`.
- For proper `f` the forget-supports map `R⁺f_`! `→ R⁺f_*` is an isomorphism.
- For an open immersion `j` with taut source, `R⁺j_`! is extension by zero `j_`!.
- For the closed unit disc over `Spa(C, O_C)` and nonzero prime-to-residue `Λ, H⁰_c(B, Λ) = 0 ≠ H⁰(B, Λ) = Λ`: compact support is not full cohomology even though `B` is quasi-compact.
- `H²_c(B, μ_n) ≅ ℤ/n`, whereas the cohomology with compact support of the compact Berkovich disc `E(0, 1)` vanishes in degree 2: Huber's proper support is not compact support on the Hausdorff quotient.

For the closed unit disc `f : B → Spa(C, O_C)` and `n` invertible in `O_C: R²f_`!`μ_n ≅ ℤ/n` and `R^q f_`!`μ_n = 0` for `q ≠ 2`, while `Rf_*μ_n = μ_n` in degree 0 (Section 9.2). For an open immersion `j` with taut source, `R⁺j_`! `= j_`! (Section 8.3).

*Needs:* Section 8.1; Section 8.2; Section 8.3; Section 1.2; Section 1.1; `EnhancedDerivedSheaves`, §§0.1–0.4 (`K`-injective and `K`-flat replacements); `EnhancedDerivedSheaves`, §§0.1–0.4 (the enhanced derived category); Mathlib DerivedCategory.

Let `A` be a ring henselian along an ideal `I` (Mathlib HenselianRing), `π : 𝒫 → Spec A` a proper morphism of finite presentation, and `K ∈ D⁺(𝒫_ét)` with torsion cohomology sheaves. Then restriction `RΓ(𝒫, K) → RΓ(𝒫 ⊗_A A/I, K|)` is an isomorphism. Applied twice with the notation `C` an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p ≥ 1`; `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank; `S = Spa(C, C⁺)`, with closed point `s` and generic point `η = Spa(C, O_C)`; `n ≥ 1` an integer invertible in `C⁺` (hence prime to `p`); `μ_n` the étale sheaf of `n`-th roots of unity and `Λ(1) = Λ ⊗ μ_n`, and `ϖ ∈ C⁺` a pseudo-uniformiser: (i) `C⁺` is `ϖ`-adically complete, hence henselian along `ϖC⁺` (Section 2.1), so `RΓ(𝒫, K) ≅ RΓ(𝒫_0, K|)` for `𝒫_0 = 𝒫 ⊗ C⁺/ϖ`; (ii) `C⁺/C°°` is a valuation ring of the algebraically closed residue field of `C`, hence strictly henselian local with algebraically closed residue field `k_s`, and `RΓ(𝒫_0, K) ≅ RΓ(𝒫_s, K|)` for the fibre `𝒫_s` over the closed point.

This uses `π` proper and finitely presented; torsion coefficients; `A` henselian along `I`.

(Huber (1996), §3.2, Lemma 3.2.5, pp. 178-179; Scholze, Étale cohomology of diamonds, proof of Lemma 19.4, p. 110.)

`𝒫 = P¹_{C⁺}: RΓ(P¹_{C⁺}, μ_n) ≅ RΓ(P¹_{k_s}, μ_n)`, giving `H²(P¹_{C⁺}, μ_n) ≅ ℤ/n` via the degree.

*Needs:* Section 2.1; `SchemeAndStackFoundations`, Layer 2; `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`); Mathlib HenselianRing; Mathlib ValuationRing; Section 2.3.

Notation: `C` an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p ≥ 1`; `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank; `S = Spa(C, C⁺)`, with closed point `s` and generic point `η = Spa(C, O_C)`; `n ≥ 1` an integer invertible in `C⁺` (hence prime to `p`); `μ_n` the étale sheaf of `n`-th roots of unity and `Λ(1) = Λ ⊗ μ_n`; `ϖ ∈ C⁺` a pseudo-uniformiser. Let `𝒫` be a proper flat finitely presented `C⁺`-scheme with special fibre `𝒫_0 = 𝒫 ⊗ C⁺/ϖ, P := 𝒫_C ×_{Spec C} S` (Huber's fibre product), which equals the generic fibre `d(𝒫̂)` of the `ϖ`-adic completion (a formal scheme of type `(S)`), and `λ : P_ét → (𝒫_0)_ét` the specialisation morphism of sites; similarly `λ_S : S_ét → Spec(C⁺/ϖ)_ét`, an equivalence of topoi (both are the topos of the chain of valuation rings between `C⁺` and `O_C`, since étale maps to either side split locally). For an open subscheme `𝒰 ⊆ 𝒫_0` let `U := λ⁻¹(𝒰) ⊆ P` (an open subspace, quasi-compact if `𝒰` is), `f_U : U → S` and `π_𝒰 : 𝒰 → Spec(C⁺/ϖ)`. For `j_0:𝒰↪𝒫_0`, define the fixed-model expression `Rπ_{𝒰!} := Rπ_{𝒫_0*} ∘ j_{0!}` on bounded-below torsion complexes, using the arbitrary-open extension by zero of `EtaleCohomologyFoundations` §0.7. If `𝒰` is quasi-compact, `π_𝒰` is separated finitely presented between qcqs schemes, and this expression canonically agrees with `ClassicalAlgebraic.properSupports` of its §0.8 via the displayed compactification. For arbitrary `𝒰` it denotes this fixed-model composite. Then for every `K ∈ D⁺(U_ét, Λ)` with `Λ` torsion there is a natural isomorphism `λ_{S*} R f_{P*}(j_{U!} K) ≅ Rπ_{𝒰!} Rλ_{U*} K`, where `j_U : U ⊆ P` is the open inclusion and `f_P : P → S` the proper structure map (for quasi-compact `U` the left side is the proper-support direct image of `U → S`, see Section 9.2), compatible with open immersions `𝒰' ⊆ 𝒰` (extension by zero on both sides), with restriction to open subsets of `S` (localisation of `C⁺`) and with the trace-type maps induced by finite flat maps of models. If moreover `𝒫` is smooth over `C⁺` along `𝒰` and `𝓛` is a locally constant constructible sheaf on the model `𝒫` with torsion invertible in `C⁺`, put `K = 𝓛|_U` and `L_0 = 𝓛|_𝒰`. Then `Rλ_{U*}K ≅ L_0`, so `λ_{S*} R f_{P*}(j_{U!} K) ≅ Rπ_{𝒰!} L_0`: compactly supported cohomology of the tube is compactly supported cohomology of the special fibre.

This uses `𝒫` proper flat of finite presentation over `C⁺`; `C⁺` of arbitrary rank (the `ϖ`-adic completion is of type `(S)` because `𝒫̂[1/ϖ]` is strongly noetherian); `Λ` torsion; the smooth clause needs a locally constant constructible model extension `𝓛` and torsion invertible in `C⁺`; `U` is the open tube of an open of the special fibre; the scheme expression for arbitrary opens is the fixed-model composite above; tubes of closed or locally closed subsets are pseudo-adic and are treated through Layer 4, not here.

(Huber (1996), §3.5, Corollary 3.5.11, p. 206; Huber (1996), §3.5, (3.5.12), p. 207; Huber (1996), §3.5, Theorem 3.5.13, p. 208; Vladimir G. Berkovich, Vanishing cycles for formal schemes, Introduction, p. 540.)

**Checks.**

- For `𝒰 = ∅`, both fixed-model composites vanish. For `𝒰 = 𝒫_0`, both reduce to the proper comparison.
- For quasi-compact `𝒰`, the scheme composite agrees with the imported compactification-defined lower shriek, including its forget-supports map.
- Constant model coefficients have constant smooth nearby cycles in degree zero.
- `A` rank-`r` locally constant model sheaf has rank-`r` nearby cycles on the smooth locus.
- Over `ℂ₃`, the good supersingular model `y²=x³−x` has generic local system [3]`_*Z`/2 of rank nine. Its nearby cycles are [3]`_{s*}Z/2=Z`/2, since [3]`_s` is radicial. This generic local system has no locally constant model extension of rank nine.

`𝒫 = P¹_{C⁺}, 𝒰 = A¹ ⊆ P¹_0: U = B_S` is the relative closed ball and `λ_{S*}Rf_{P¹*}(j_!Λ) ≅ Rπ_{A¹!}Λ = Λ(−1)[−2]` (Section 9.2). `𝒰 = 𝒫_0: U = P` and the statement is `RΓ(P, K) ≅ RΓ(𝒫_0, Rλ_*K)`, Hub96 Corollary 3.5.14. `𝒰 = A¹ ∖` {0}: `U` is the annulus `{|T| = 1}` over `S`, with `H¹_c` and `H²_c` those of `G_{m,k_s}`.

*Needs:* `EtaleCohomologyFoundations`, §§0.7–0.8 (`ClassicalAlgebraic.supportLocalization`, `ClassicalAlgebraic.properSupports`); `AdicSpacesPartIII`, layer R2 (`formal-completion-and-algebraic-comparison`); `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`); `AdicSpacesPartIII`, layer R2 (`formal-schemes-of-type-S`); `AdicSpacesPartII`, layer R0 (`universally-closed-and-proper-morphism`); Section 4.2; Section 4.1; Section 4.3; Section 4.4; Layer 4; `SchemeAndStackFoundations`, Layer 2; `AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`); Section 8.3.

Let `C` be an algebraically closed field complete for a nontrivial nonarchimedean absolute value, `C⁺ ⊆ C` an open and bounded valuation subring, `S = Spa(C, C⁺)` with closed point `s, f : X → S` a proper morphism with `X` locally noetherian, and `Λ` with `nΛ = 0` for some `n` invertible in `C⁺`. Let `X_s = (X, f⁻¹(s))` be the pseudo-adic closed fibre (the supplier contracts). Then for every `K ∈ D⁺(X_ét, Λ)` the restriction map `RΓ(X, K) → RΓ(X_s, K|_{X_s})` is an isomorphism; equivalently, `RΓ(X, K) = 0` whenever `K|_{X_s} = 0, e.g`. for `K = j'_`!`L` with j' : `f⁻¹(S ∖ {s}) → X` the open complement.

This uses `f` proper (`AdicSpacesPartII`, layer R0), `X` locally noetherian analytic; `n` invertible in `C⁺`: the `p`-torsion analogue is not asserted; `X_s` is a pseudo-adic support space, not an adic subspace.

(Bogdan Zavyalov, Some foundational results in adic geometry, proof of Proposition 9.3, Part (1), p. 27; Bogdan Zavyalov, Some foundational results in adic geometry, §9, footnote 6, p. 27; Scholze, Étale cohomology of diamonds, proof of Theorem 19.2, p. 109; Scholze, Étale cohomology of diamonds, Lemma 19.4, p. 110.)

`X = P¹_S = P^{1,ad}` over `S = Spa(C, C⁺)` and `K = Λ: H^q(P¹_S, Λ) ≅ H^q(P¹_{k_s}, Λ)` with `k_s` the residue field of `C⁺` (algebraically closed): `Λ`, 0, `Λ(−1)` in degrees 0, 1, 2. If `C⁺ = O_C` then `f⁻¹(s) = |X|` and the statement is empty.

*Needs:* the supplier contracts; `AdicSpacesPartII`, layer R0 (`universally-closed-and-proper-morphism`); Section 1.4; `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`); Section 8.3; Section 4.5; `SchemeAndStackFoundations`, Layer 2.

Let `f : X → Y` be a proper morphism of locally noetherian analytic adic spaces, `j : U → Y` an étale morphism (for instance an open immersion), `g : X_U = X ×_Y U → U` and j' : `X_U → X` the base changes, and `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺` (equivalently, `n` prime to the residue characteristic of every point of `Y`). The natural transformation `α : j_`! `Rg_* → Rf_* j'_`!, adjoint to `f^*j_`!`Rg_* ≅ j'_`!`g^*Rg_* → j'_`! (base change for `j_`!, Section 1.2, followed by the counit), is an isomorphism of functors `D⁺(X_{U,ét}, Λ) → D⁺(Y_ét, Λ)`; if `Rf_*` has finite cohomological dimension it is an isomorphism on `D(X_{U,ét}, Λ)`. Equivalently, `R f_*` commutes with restriction to the pseudo-adic closed complement of `U`: this is the classical meaning of ECD's Theorem 19.2.

This uses `f` proper; `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺` (equivalently, `n` prime to the residue characteristic of every point of `Y`); `j` étale; the case of open immersions is the one used for the compactly supported pushforward.

(Bogdan Zavyalov, Some foundational results in adic geometry, Proposition 9.3(1), p. 26; Scholze, Étale cohomology of diamonds, Theorem 19.2, p. 108; Scholze, Étale cohomology of diamonds, Remark 19.3, p. 108.)

For `Y = Spa(C, C⁺)` with `C⁺ ≠ O_C` of finite rank (so that the generic point `U = Spa(C, O_C)` is an open subset, and `U ≠ Y`) and `X = P¹_Y`: both sides of `α` applied to `Λ` have zero stalk at the closed point. For `U = Y, α` is the identity.

*Needs:* `AdicSpacesPartII`, layer R0 (`universally-closed-and-proper-morphism`); `AdicSpacesPartII`, layer R0 (`etale-local-open-finite-etale-factorisation`); Section 1.2; Section 1.5; Section 8.3; `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`).

Let `f : X → Y` be compactifiable and quasi-compact, and let `f = p ∘ i` be any factorisation with `i : X → P` a quasi-compact open immersion and `p : P → Y` proper. Then there is a canonical isomorphism `R⁺f_`! `≅ Rp_* ∘ i_`! of functors `D⁺(X_ét, Λ) → D⁺(Y_ét, Λ)`, for every ring `Λ` with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺`, and these isomorphisms are compatible with morphisms of factorisations (a proper `Y`-morphism `h : P →` P' with `h ∘ i =` i') and transitive for composites of such morphisms.

This uses `f` compactifiable and quasi-compact; `i` a quasi-compact open immersion, `p` proper; `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺` (equivalently, `n` prime to the residue characteristic of every point of `Y`).

(Bogdan Zavyalov, Some foundational results in adic geometry, proof of Theorem 9.4, Step 1, p. 28; Bogdan Zavyalov, Some foundational results in adic geometry, proof of Theorem 9.4, Step 5, p. 30; Scholze, Étale cohomology of diamonds, Definition 22.4, p. 129.)

`X = B_S` the closed ball over `S = Spa(C, C⁺), P = P¹_S, i` the inclusion `{|T| ≤ 1} ⊆ P¹: R⁺f_`!`Λ ≅ R(p)_* i_`!`Λ`, which computes `H^q_c(B_S)` from `P¹_S` and the pseudo-adic complement `{|T| > 1}`‾. For `f` proper and the trivial factorisation, the isomorphism is the identity of `Rf_*`.

*Needs:* Section 8.2; Section 8.3; `AdicSpacesPartII`, layer R0 (`proper-of-comp-separated`); `AdicSpacesPartII`, layer R0 (`separated-morphism`); `AdicSpacesPartII`, layer R0 (`separated-proper-partially-proper`); `AdicSpacesPartII`, layer R0 (`proper-comp`).

Let `f : X → Y` be compactifiable with `Y` quasi-compact and quasi-separated, and `Λ` a ring. For `K ∈ D⁺(X_ét, Λ)` the maps `R⁺f_`!`(j_{U!}(K|_U)) → R⁺f_`!`K` induced by the counits `j_{U!}j_U^*K → K`, for `U` ranging over the filtered system of quasi-compact open subsets of `X`, induce an isomorphism `colim_U R⁺f_`!`(j_{U!}(K|_U)) ≅ R⁺f_`!`K`; in each degree `R^q f_`!`K = colim_U R^q f_`!`(j_{U!}(K|_U))`. Combined with Section 8.3, `R⁺f_`!`(j_{U!}(K|_U)) ≅ R⁺(f|_U)_!(K|_U)`, so `R⁺f_`! is the colimit of the proper-support direct images of the quasi-compact opens.

This uses `f` compactifiable; `Y` qcqs (the statement is local on `Y`); `K` bounded below; for arbitrary `Λ` the derived statement rests on Hub96 §5.3; the public proof needs `nΛ = 0` with `n` invertible in `O_Y⁺` (Zavyalov, Theorem 9.4).

(Bogdan Zavyalov, Some foundational results in adic geometry, proof of Theorem 9.4, Step 5, p. 30; Berkovich (1993), Proposition 5.2.8, p. 101.)

For the open unit disc `D` over `Spa(C, O_C), H²_c(D, μ_n) = colim_{r<1} H²_c(D, j_{B(0,r)!}μ_n)` with each term `ℤ/n` and identity transition maps.

*Needs:* Section 8.3; Section 1.2; `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`).

Let `f : X → Y` and `g : Y → Z` be compactifiable morphisms of locally noetherian analytic adic spaces and `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Z⁺` (equivalently, `n` prime to the residue characteristic of every point of `Z`). There is a canonical isomorphism `R⁺(g ∘ f)_! ≅ R⁺g_`! `∘ R⁺f_`! of functors `D⁺(X_ét, Λ) → D⁺(Z_ét, Λ)`, associative for triples and unital (`R⁺id_`! `=` id), and compatible with the forget-supports maps to `R⁺(g ∘ f)_* ≅ R⁺g_* ∘ R⁺f_*`.

This uses `f, g` compactifiable; `n` invertible in `O_Z⁺` (and hence in `O_Y⁺, O_X⁺`).

(Bogdan Zavyalov, Some foundational results in adic geometry, proof of Theorem 9.4, Step 5, p. 30; Scholze, Étale cohomology of diamonds, Proposition 22.9, p. 132.)

For `X → Y` the inclusion of the open unit disc into the closed unit disc over `Spa(C, O_C)` and `g` the structure map, `R⁺(g ∘ f)_!Λ ≅ R⁺g_`!`(j_!Λ)`, giving `H²_c(D, μ_n) ≅ H²_c(B, j_!μ_n) ≅ ℤ/n`.

*Needs:* Section 8.3; Section 8.2; `AdicSpacesPartII`, layer R0 (`proper-comp`); Section 8.1.

Let `f : X → Y` be compactifiable and `Λ` a ring. (a) If `f` is proper, the forget-supports map `R⁺f_`! `→ R⁺f_*` is an isomorphism. `(b)` If `f` is partially proper, `R⁺f_`! is the right derived functor of the functor `f_`! of sections with proper support (Section 8.3). `(c)` If `f = j` is an open immersion with taut source, `R⁺j_`! is extension by zero `j_`!, which is exact and left adjoint to `j^*`. `(d)` If `f` is étale, separated and quasi-compact and `nΛ = 0` with `n` invertible in `O_Y⁺, R⁺f_`! `≅ f_`!, the exact left adjoint of `f^*` (Section 1.2), and `R^q f_`! `= 0` for `q > 0`.

This uses `f` compactifiable; `(d)` needs `n` invertible in `O_Y⁺` through proper base change.

(Bogdan Zavyalov, Some foundational results in adic geometry, proof of Theorem 9.4, Step 5, p. 30; Scholze, Étale cohomology of diamonds, Proposition 22.10, p. 133.)

For the inclusion `j : D ⊆ B` of the open disc into the closed disc, `R⁺j_`!`Λ = j_`!`Λ`. For the degree-`n` Kummer covering of the unit annulus `{|T| = 1}` over `Spa(C, O_C), R⁺f_`!`Λ = f_*Λ` is locally free of rank `n`.

*Needs:* Section 8.2; Section 8.3; `AdicSpacesPartII`, layer R0 (`etale-local-open-finite-etale-factorisation`); Section 1.2; `AdicSpacesPartII`, layer R0 (`finite-morphism`); Section 1.5; Section 7.1.

### 8.4 Base change, dimension and projection

Let `f:X→Y` be a proper `+`weakly finite type morphism of locally noetherian analytic adic spaces, with a uniform bound dim.tr `f≤d`. For every étale `Z/n`-module sheaf `F, n>0, Rᑫf_*F=0` for `q>`2d. Locally on quasi-compact `Y` this gives a finite cohomological amplitude for `Rf_*` on unbounded complexes. In particular `Rf_*` preserves all small homotopy colimits. No invertibility of `n` in `O_Y⁺` is imposed in this proper amplitude statement.

This uses `A` uniform `d` for the displayed 2d estimate; finite bounds may vary between quasi-compact opens of `Y`.

(Bogdan Zavyalov, Some foundational results in adic geometry, Lemma 9.1(1)–(2), pp. 23–25.)

For finite maps `d=0` and higher direct images vanish. For a non-quasi-compact base do not claim one global `d` from local finiteness alone.

*Needs:* Section 8.2; Section 1.5; `EnhancedDerivedSheaves`, §§0.1–0.4 (the enhanced derived category); `EnhancedDerivedSheaves`, §§0.1–0.4 (presentability and the derived tensor product).

Let `f : X → Y` be a proper morphism of locally noetherian analytic adic spaces, `g` : Y' `→ Y` any morphism of locally noetherian analytic adic spaces with base change f' : X' `= X ×_Y` Y' `→` Y', g' : X' `→ X`, and `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺`. The base change transformation `g^* Rf_* → Rf'_* g'^*` is an isomorphism of functors `D⁺(X_ét, Λ) → D⁺(Y'_ét, Λ)`, and on `D(X_ét, Λ)` when `Rf_*` has finite cohomological dimension.

This uses `f` proper; `g` arbitrary between locally noetherian analytic adic spaces; `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺`.

(Bogdan Zavyalov, Some foundational results in adic geometry, Lemma 9.1(3), p. 23; Bogdan Zavyalov, Some foundational results in adic geometry, proof of Lemma 9.1, Step 3, pp. 24–25; Berkovich (1993), Theorem 7.7.1, p. 153.)

For Y' `= Spa(C, O_C) ⊆ Y = Spa(C, C⁺)` the generic point and `X = P¹_Y`, the theorem identifies `(Rf_*Λ)|_{Y'}` with `Rf'_*Λ = RΓ(P¹_C, Λ)`. For `g` an open immersion the statement is the restriction of `Rf_*` to an open subset, which is formal.

*Needs:* `AdicSpacesPartII`, layer R0 (`universally-closed-and-proper-morphism`); `AdicEtaleGeometry`, layer A1 (`etale-enough-points`); `AdicEtaleGeometry`, layer A1 (`strict-localisation-analytic`); Section 1.5; Section 8.3; `AdicSpacesPartII`, layer R0 (`fibre-products-existence`); Section 7.1.

Let `f : X → Y` be compactifiable and quasi-compact, `g` : Y' `→ Y` a morphism of locally noetherian analytic adic spaces, f' : X' `→` Y' and g' : X' `→ X` the base changes, and `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺`. There is a canonical isomorphism `g^* R⁺f_`! `≅ R⁺f'_`! `g'^*` of functors `D⁺(X_ét, Λ) → D⁺(Y'_ét, Λ)`. For compactifiable `f` that is not quasi-compact the same holds when `g` is an open immersion or when f' is again compactifiable, via the quasi-compact exhaustion. Two special cases: the stalk of `R^q f_`!`K` at a geometric point `Spa(C, C⁺) → Y` is `H^q_c(X ×_Y Spa(C, C⁺), K)` (compact support relative to `Spa(C, C⁺)`); and restriction of `R⁺f_`! to an open `U ⊆ Y` is `R⁺(f_U)_!` of the restriction.

This uses `f` compactifiable and quasi-compact (general `f` through Section 8.3); `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺`.

(Bogdan Zavyalov, Some foundational results in adic geometry, §9, before Theorem 9.4, p. 22; Scholze, Étale cohomology of diamonds, Proposition 22.8, p. 132; Berkovich (1993), Theorem 7.7.1, p. 153.)

For `S = Spa(C, C⁺)`, the ball `B_S → S` and `g` the inclusion of the generic point `Spa(C, O_C): (R^q f_!Λ)|_{Spa(C,O_C)} = R^q f_{C!}Λ`. For a geometric point over a point `x` of a curve family, the stalk of `R²f_`!`μ_n` is `H²_c` of the geometric fibre.

*Needs:* Section 8.2; Section 8.3; Section 8.4; `AdicSpacesPartII`, layer R0 (`proper-base-change`); Section 1.2; `AdicSpacesPartII`, layer R0 (`fibre-products-existence`).

Let `f` be a separated taut morphism of analytic pseudo-adic spaces, locally of `+`weakly finite type, with `dim.tr(f)≤d<∞`. For every torsion étale sheaf `F`, prove `R^q f_`!`F=0` for `q>`2d. For compactifiable `f` this agrees with the compactification definition. The bound uses the transcendence dimension of the actual supported fibres, including higher-rank field pairs and compactifications which need not be locally of finite type. No invertibility assumption is imposed on the torsion. The bounded-below functor consequently extends to unbounded torsion complexes by the enhanced derived-category supplier.

This uses `f` separated, taut, locally of `+`weakly finite type; finite transcendence dimension bound `d`; torsion coefficients.

(Huber (1996), §5.5, Proposition 5.5.8 and proof, pp. 307–308; Proposition 5.3.11, pp. 293–294.)

A finite étale morphism has `d=0` and exact lower shriek. For a relative one-dimensional ball, the amplitude is [0,2]; its top-degree value is computed in Section 9.2. Prove the bound by the proper supported-fibre calculation, then a Čech resolution by relatively quasi-compact opens; the proof does not replace a compactification by a finite-type space.

*Needs:* Section 8.4.

Let `f : X → Y` be compactifiable, locally of finite type, of finite relative dimension, and `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺`. Then `Rf_`! : `D(X_ét, Λ) → D(Y_ét, Λ)` commutes with arbitrary direct sums, and for a filtered system `(F_i)` of sheaves `R^q f_`!`(colim F_i) = colim R^q f_`! `F_i`.

This uses finite relative dimension, so that `R⁺f_`! has finite cohomological amplitude; `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺`.

(Bogdan Zavyalov, Some foundational results in adic geometry, Lemma 9.1(2) and its proof, pp. 23–24; Bogdan Zavyalov, Some foundational results in adic geometry, Lemma 9.1(2), p. 23.)

For the ball and a family of constant sheaves `Λ_i, H²_c(B, ⊕Λ_i(1)) = ⊕Λ_i`.

*Needs:* Section 8.3; Section 8.4; `DiamondsAndVStacks`, layer D0 (`filtered-colimits-and-cohomology-on-coherent-sites`).

Let `f : X → Y` be compactifiable of finite relative dimension and `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺`. For `K ∈ D(X_ét, Λ)` and `G ∈ D(Y_ét, Λ)` there is a natural isomorphism `Rf_`!`K ⊗^L_Λ G ≅ Rf_`!`(K ⊗^L_Λ f^*G)`, functorial in `K` and `G` and compatible with composition of morphisms. The formula lies in the enhanced unbounded category. For a comparison inside `D⁺`, take `K` and `G` bounded below and require finite `Tor` amplitude for `G`, or for `K` on `X`, so that both tensor products are bounded below; finite support amplitude also preserves this condition. Boundedness of both inputs alone does not suffice. Berkovich Theorem 5.3.9 separately gives the formula for `K,G∈D⁻` in `D⁻`, and for `G∈Dᵇ` of finite `Tor` dimension with arbitrary `K` in `D`.

This uses `f` compactifiable of finite relative dimension (so `Rf_`! is defined on unbounded complexes); `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺`.

(Bogdan Zavyalov, Some foundational results in adic geometry, Proposition 9.3(2), p. 26; Berkovich (1993), Theorem 5.3.9, p. 105; Scholze, Étale cohomology of diamonds, Proposition 22.23, p. 139.)

For `f : B_S → S` the ball and `G = Λ'` a `Λ`-module viewed as a constant sheaf: `Rf_`!`(Λ) ⊗ Λ' = Rf_`!`(Λ')`, so `H²_c(B_S, Λ') = H²_c(B_S, Λ) ⊗ Λ'`. Tate twists: `Rf_`!`(K(m)) ≅ (Rf_!K)(m)` (Section 1.4).

**Checks.**

- For `f=`id on `Spa(C,O_C), C` of residue characteristic 3, `Λ=Z`/4 and `K=G=Z`/2 in degree zero, the derived tensor has `Z`/2 in every nonpositive degree and is outside `D⁺`. The unbounded formula still holds.
- Taking `G=Λ` gives the unit constraint for `Rf_`!, with no `Tor` correction.
- `A` bounded-below `K` and finite locally free `G` in degree zero give the same projection comparison in `D⁺`.

*Needs:* Section 8.3; Section 8.4; Section 1.2; Section 1.4; `EnhancedDerivedSheaves`, §§0.1–0.4 (presentability and the derived tensor product).

Let `S=Spa(C,C⁺)`, where `C` is complete algebraically closed nonarchimedean and `C⁺` is an open bounded valuation subring; write `s` for its unique closed point. Let `f:X→S` be proper, with `X` locally noetherian, and let `F` be an étale `Z/n`-module sheaf, `n>0`. If `F` restricts to zero on the pseudo-adic fibre `(X,f⁻¹(s))`, then `RΓ(X,F)=0`. The same vanishing holds for `K∈D⁺` with all cohomology sheaves restricting to zero. This includes extension by zero from `f⁻¹(S∖{s})` and does not require `n` to be a unit in `C⁺`.

This uses The closed fibre is a pseudo-adic support subset, not a presumed closed analytic adic subspace.

(Bogdan Zavyalov, Some foundational results in adic geometry, Proposition 9.3(1), proof, pp. 26–27 and footnote 6.)

For `F=j′`!`L` from the inverse image of `S∖{s}`, every cohomology group is zero. Residue-`p` proper base change along an arbitrary field extension is a different assertion and is not a consequence.

*Needs:* the supplier contracts; Section 8.4; Section 1.3.

For a Cartesian square `X′→X` over an étale `j:Y′→Y` and proper `f:X→Y` of locally noetherian analytic adic spaces, the canonical map `j`! `Rf′_* → Rf_* j′`! is an equivalence on unbounded `D(X′_ét,Z/n)`, for every `n>0`. Both ! functors here are the exact étale extension-by-zero functors, and the transformation uses the usual slice-site base-change map and its counit.

This uses `f` is proper; `j` is étale, with no invertibility hypothesis on `n`.

(Bogdan Zavyalov, Some foundational results in adic geometry, Proposition 9.3(1), pp. 26–27.)

Identity `j` yields the identity transformation. A finite étale split cover gives the sum of the proper pushforwards on its components. This does not strengthen arbitrary proper base change to residue-`p` coefficients.

*Needs:* Section 8.4; `AdicSpacesPartII`, layer R0 (`etale-local-open-finite-etale-factorisation`); Section 1.2; `EnhancedDerivedSheaves`, §§0.1–0.4 (presentability and the derived tensor product).

For a proper `+`weakly finite type `f:X→Y` of locally noetherian analytic adic spaces and any `F∈D(X_ét,Z/n), G∈D(Y_ét,Z/n), n>0`, the canonical morphism `Rf_*F ⊗ᴸ G → Rf_*(F⊗ᴸ f*G)` is an equivalence. It is natural in both complexes and compatible with the proper–étale exchange transformation.

This uses Unbounded derived tensor and the ordinary/enhanced comparison come from `EnhancedDerivedSheaves`, §§0.1–0.3.

(Bogdan Zavyalov, Some foundational results in adic geometry, Lemma 9.2 and Proposition 9.3(2), pp. 25–27.)

`G=Z/n` gives the unit comparison. For finite split `f` this becomes the finite-sum tensor identity. The proof must not call Lemma 9.1(3) for arbitrary residue-`p` base change.

*Needs:* Section 8.4; Section 1.2; `EnhancedDerivedSheaves`, §§0.1–0.4 (presentability and the derived tensor product).

### 8.5 Localization, descent and enhanced functors

Let `f : X → Y` be compactifiable, `U ⊆ X` an open subspace with taut source (so `f_U = f|_U` is compactifiable), `Z = X ∖ U` with its pseudo-adic support structure (the supplier contracts), and `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺` (needed for the composition isomorphism `R⁺f_`! `∘ j_`! `≅ R⁺(f_U)_!`). For `K ∈ D⁺(X_ét, Λ)` there is a distinguished triangle `R⁺(f_U)_!(K|_U) → R⁺f_`!`K → R⁺f_`!`(i_{Z*}i_Z^*K) → R⁺(f_U)_!(K|_U)[1]`, natural in `K`. For `Y = Spa(C, C⁺)` this is the long exact sequence `⋯ → H^q_c(U, K) → H^q_c(X, K) → H^q_c((X, Z), K) → H^{q+1}_c(U, K) → ⋯`, where `H^q_c((X, Z), K) := H^q(Y, R⁺f_!(i_{Z*}i_Z^*K))` is the compactly supported cohomology of the pseudo-adic `Z`.

This uses `U` open with `f|_U` compactifiable (`e.g`. `U` quasi-compact); `Z` is never treated as an adic subspace; `Λ` a ring with `nΛ = 0` for an integer `n ≥ 1` invertible in `O_Y⁺` (lower-shriek-composition).

(Berkovich (1993), Proposition 5.2.6(ii), p. 100; Scholze, Étale cohomology of diamonds, Remark 19.3, p. 108.)

For `X = P¹_C` over `Spa(C, O_C), U` the open unit disc `D` and `Z` its closed complement: `H¹_c((P¹, Z), μ_n) → H²_c(D, μ_n) → H²(P¹, μ_n) → H²((P¹, Z), μ_n) = 0` recovers Berkovich's sequence of Remark 6.2.10 in adic form. `U = X` gives the trivial triangle with `Z = ∅`.

*Needs:* the supplier contracts; Section 8.3.

Fix `n>0` invertible in `O_S⁺`. On locally noetherian analytic `S`-spaces and locally `+`weakly finite type maps, there is a coherent colimit-preserving proper-support functor on the enhanced unbounded derived categories. For a separated taut `f` it restricts on `D⁺` to the inherited Huber `R⁺f`!, including non-quasi-compact `f`. For proper `f` it is `Rf_*`; for étale `f` it is the exact `f`! with its usual counit. Composition, base change and projection formula agree with the inherited classical transformations wherever those are defined. No global dimension bound for all of `S` is required.

This uses Only the proper/étale gluing fragment is used; no right adjoint `Rf^!` or diamond duality is assumed; The coefficient hypothesis is `n` invertible in `O_S⁺`.

(Bogdan Zavyalov, Some foundational results in adic geometry, Theorem 9.4, pp. 27–30, especially Steps 2–5.)

For étale `f` the comparison preserves the summation counit, not just the underlying functor. An exhaustion has the same result after passage to a cofinal family of quasi-compact opens. Do not infer this general comparison for arbitrary `Λ` from the `Z/n` statement.

*Needs:* Section 8.4; Section 8.3; `EnhancedDerivedSheaves`, §§0.1–0.4; `EnhancedDerivedSheaves`, §§0.1–0.4 (presentability and the derived tensor product).

Let `Λ=Z/n, n>0` invertible in `O_Y`, and let `f:X→Y` and `g:Y→Z` be separated taut locally finite type maps of locally noetherian analytic adic spaces, with `n` invertible in `O_Z` when composing. For the inherited classical bounded-below support functors there are natural, unital and associative comparisons `R⁺(g∘f)`!`≅R⁺g`!`R⁺f`!, compatible with the proper and exact étale cases, forget-supports maps and Tate twists. Open/pseudo-adic-closed localization holds in this coefficient range. Taut open-cover support descent, including infinite covers by quasi-compact opens, gives the support Čech spectral sequence used to glue top-degree traces. These comparisons are coherent with the canonical weak base-change transformations; this statement does not assert that arbitrary base-change transformations are isomorphisms.

This uses Only `D⁺` support calculus is asserted. Constant complexes and their shifts used by the smooth trace lie in this range; The operators are the inherited proper-support functors, not a second construction of analytic cohomology.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Lemma 6.1.3, pp. 67–68; Lemma 6.1.6, pp. 69–70; Theorem 6.1.1 proof, pp. 73–74; Bogdan Zavyalov, Some foundational results in adic geometry, Lemma 9.2 and Proposition 9.3(1)–(2), pp. 25–27.)

`A` mixed-characteristic `n=p` affine chart must not invoke an `O⁺`-restricted support-composition theorem. The support Čech abutment uses `Λ_X`; the open-ring calculus does not imply residue-`p` base-change isomorphisms.

*Needs:* Section 8.3; Section 8.2; Section 8.4; the supplier contracts; Section 1.2; Layers 1 and 3; `EnhancedDerivedSheaves`, §§0.1–0.4.

### 8.6 Flat quasi-finite traces

Let `φ : Y → X` be a separated, flat (`AdicSpacesPartII`, layer R0 (`flat-morphism`)), locally quasi-finite (`AdicSpacesPartII`, layer R0 (`quasi-finite-morphism`)) morphism of locally noetherian analytic adic spaces that is locally of finite type and taut. Then `R^qφ_`!`G = 0` for `q > 0` for every sheaf `G` killed by an integer invertible in `O_X⁺`, and to every abelian étale sheaf `F` on `X` there is attached a trace `Tr_φ : φ_`!`φ^*F → F`, uniquely determined by: (a) `Tr_φ` is natural in `F`; `(b) Tr_φ` is compatible with base change along any morphism X' `→ X` (via the base change isomorphism for `φ_`!); `(c) Tr_φ` is compatible with composition: `Tr_{φ∘ψ} = Tr_φ ∘ φ_`!`(Tr_ψ)`; `(d)` if `φ` is finite locally free of constant rank `d` (`AdicSpacesPartIII`, layer R3 (`finite-locally-free-morphism`)) the composite `F → φ_*φ^*F = φ_`!`φ^*F → F` is multiplication by `d`; `(e)` if `φ` is étale, `Tr_φ` is the counit of the adjunction `φ_`! `⊣ φ^*` (Section 1.2). At a geometric point `x̄ = Spa(K, O_K)` of `X` of rank one, the fibre `Y ×_X x̄` is a possibly infinite disjoint union of `Spa(A_y, A_y°)` with `A_y` local Artinian `K`-algebras. The union is finite when `φ` is quasi-compact. Proper-support sections give `(φ_!φ^*F)_x̄ = ⊕_y F_x̄`, and `Tr_φ((a_y)_y) = Σ_y length(A_y)·a_y` is a finite sum on each finitely supported tuple. The induced maps on compactly supported cohomology `H^q_c(Y, φ^*F) → H^q_c(X, F)` (for `X → Z` compactifiable) are also called `Tr_φ`.

This uses `φ` separated, flat, locally quasi-finite, locally of finite type, taut; no torsion hypothesis on `F` for the trace itself; the vanishing of `R^qφ_`! for `q > 0` (proved through lower-shriek-base-change and lower-shriek-cohomological-dimension) and the Kummer compatibility need torsion invertible in `O_X⁺`.

(Berkovich (1993), Theorem 5.4.1, p. 107; Berkovich (1993), Remark 5.4.2(ii), p. 109; Stacks project, Section 59.66 (Tag 03SH), Méthode de la trace.)

Provide `AdicSpace.quasiFiniteTrace`: The natural transformation `Tr_φ : φ_`!`φ^* →` id on `Sh(X_ét, ℤ)`; `AdicSpace.quasiFiniteTrace_naturality`: Naturality in the sheaf `F`; `AdicSpace.quasiFiniteTrace_baseChange`: Compatibility with base change along X' `→ X`; `AdicSpace.quasiFiniteTrace_comp`: Compatibility with composition.

Provide `AdicSpace.quasiFiniteTrace_unit_eq_mul`: For `φ` finite locally free of rank `d, Tr_φ ∘` unit `= d`; `AdicSpace.quasiFiniteTrace_etale`: For étale `φ, Tr_φ` is the adjunction counit; `AdicSpace.quasiFiniteTrace_stalk`: At a rank-one geometric point, `Tr_φ((a_y)) = Σ length(A_y) a_y` on the direct sum of stalks, with each tuple finitely supported; `AdicSpace.quasiFiniteTrace_unique`: Any family of maps satisfying (a)–`(d)` equals `Tr`.

Provide `AdicSpace.quasiFiniteTrace_compactCohomology`: The induced maps `H^q_c(Y, φ^*F) → H^q_c(X, F)` for `X` compactifiable over a base.

**Checks.**

- For an étale separated quasi-compact `φ, Tr_φ` is the counit `φ_`!`φ^*F → F`.
- For `φ` finite locally free of constant rank `d, Tr_φ ∘` unit `= d·`id.
- For `X=Spa(C,O_C)` and `φ:⨿_{m∈N}X→X`, the separated flat locally quasi-finite taut projection has a countably infinite fibre. Trace adds finitely supported tuples in `⊕_{m∈N}F_x̄`; no sum of an arbitrary infinite tuple is defined.
- For `T ↦ T²` on the closed disc `(p ≠ 2)`, the stalk of `Tr_φ` at 0 is multiplication by 2, not the sum over geometric points of the fibre (a single point): the point-count formula holds only for étale `φ`.
- `Tr_{φ∘ψ} = Tr_φ ∘ φ_`!`(Tr_ψ)`.
- For X' `→ X`, the base-changed trace is the trace of the base change.

For the Kummer map `φ : {|T| = 1} → {|T| = 1}, T ↦ Tᵐ` with `p ∤ m`, over `Spa(C, O_C), Tr_φ ∘` (unit) `= m`. For `φ : B → B, T ↦ T²` with `p ≠ 2` (finite flat of rank 2, ramified at 0), the stalk of `Tr_φ` at the origin is `F_0 → F_0, a ↦` 2a (one point of multiplicity 2), and at other rank-one points the sum over the two preimages.

*Needs:* `AdicSpacesPartII`, layer R0 (`flat-morphism`); `AdicSpacesPartII`, layer R0 (`quasi-finite-morphism`); `AdicSpacesPartII`, layer R0 (`quasi-finite-and-finiteness-criteria`); `AdicSpacesPartII`, layer R0 (`separated-morphism`); Section 3.1; Section 8.4; `AdicSpacesPartIII`, layer R3 (`finite-locally-free-morphism`); `AdicSpacesPartIII`, layer R3 (`analytic-trace-finite-locally-free`); `AdicSpacesPartII`, layer R0 (`etale-local-open-finite-etale-factorisation`); Section 1.2; `AdicEtaleGeometry`, layer A1 (`etale-enough-points`); `AdicSpacesPartII`, layer R0 (`partially-proper-quasi-finite-local-finiteness`).

Let `C` be algebraically closed complete nonarchimedean with residue characteristic `p, n` prime to `p, T` a coordinate on `P¹_C` over `Spa(C, O_C), a ∈ C` and `r ∈ |C^×|`. (i) `A` function `g` on the circle `A = {|T − a| = r}` (an affinoid adic space) is a unit iff `g = c(T − a)ᵐ(1 + h)` with `c ∈ C^×, m ∈ ℤ` and sup`|h| < 1` on `A`; `m =: deg_D(g)` for the open disc `D = {|T − a| < r}`, and `deg_{D_opposite}(g) = −m` for the complementary open disc `D_opposite ∋ ∞`. (ii) Let `φ:A_source→A_target` be a finite flat analytic map of coordinate circles. Write `φ*(T_target−a_target)=c(T_source−a_source)^k(1+h)`, with `k≠0` and sup`|h|<1`. For a complementary disc `D_source` of `A_source`, define `D_target` to be the complementary disc of `A_target` of the same type (containing `∞` or not) when `k>0`, and of the opposite type when `k<0`. This is the oriented-disc convention; it does not evaluate `φ` outside its domain. Then `deg_{D_target}(N_φ g)=deg_{D_source}(g)`. If `φ` extends to an analytic map `Φ` on the adjoining closed disc, the selected `D_target` agrees with its image disc. Section 3.2 transfers this Berkovich convention to the adic support sequence. (iii) Let `E = {|T − a| ≤ r}` be the closed disc, `Z = E ∖ D` its closed pseudo-adic complement (the supplier contracts; `Z` has the same rank-one points as `A`), and `γ_D : O(A)^× → ℤ/n` the composite of the Kummer map `O(A)^× → H¹(A, μ_n) ≅ H¹((E, Z), μ_n)`, the connecting map `H¹((E, Z), μ_n) → H²(E, j_!μ_n) = H²_c(D, μ_n)` of the recollement triangle `j_`!`μ_n → μ_n → i_{Z*}μ_n` on `E`, extension by zero to `H²(P¹, μ_n)` and the degree isomorphism `H²(P¹, μ_n) ≅ ℤ/n`. (The three sheaves of the triangle are overconvergent, so Section 3.2 `(c)` identifies this sequence with Berkovich's sequence for `D ⊆ E ⊇ A`, and `H²(E, j_!μ_n) = H²_c(D, μ_n)` because no point of `D` specialises to a point outside `D`.) Then `γ_D(g) = −deg_D(g)` mod `n`. (iv) For an open annulus `B = D₁ ∩ D₂` in `P¹` with boundary circles `A₁, A₂`, closed annulus `A = B ∪ A₁ ∪ A₂`, let `γ_B : O(A₁)^× × O(A₂)^× → ℤ/n` be the composite of the Kummer maps to `H¹(A₁ ⊔ A₂, μ_n)`, the connecting map to `H²_c(B, μ_n)` of the triangle for `B ⊆ A ⊇ A₁ ⊔ A₂`, extension by zero to `H²(P¹, μ_n)` and the degree (Berkovich's `γ_B`, p. 115); then for `(g₁, g₂) ∈ O(A₁)^× × O(A₂)^×, γ_B(g₁, g₂) = −deg_{D₁}(g₁) − deg_{D₂}(g₂)` mod `n`.

This uses `C⁺ = O_C`: the computation lives on rank-one points; the plus-ring case reduces to it by generic-point determination (Section 9.2); `n` prime to the residue characteristic (Berkovich Remark 6.2.10 shows the `p`-part fails).

(Berkovich (1993), Lemma 6.2.2, p. 112; Berkovich (1993), Lemma 6.2.5 and the definition of `γ_D`, p. 114; Berkovich (1993), Lemma 6.2.5, p. 114; Berkovich (1993), Lemma 6.2.4, p. 113.)

**Checks.**

- For `g=T−a, deg_D(g)=1` and `γ_D(g)=−1`; for `g=(T−a)ⁿ` the Kummer class and `γ_D` vanish modulo `n`.
- On the unit circle, `φ(T)=T²` selects the interior target disc for the interior source disc; `N_φ(T)=−T_target` has degree one, equal to the source degree of `T`.
- For `φ(T)=T⁻¹` the interior source disc selects the exterior target disc. `N_φ(T)=T_target⁻¹` has exterior degree one, again equal to the source degree. No disc extension is required.

*Needs:* Section 8.5; Section 3.2; Section 8.3; the supplier contracts; Section 1.4.

### Examples

The closed analytic disc over `Spa(C,O_C)` is quasi-compact and has a one-point exterior boundary in its universal compactification. The boundary point has rank two; it is absent from the original disc. Thus quasi-compactness does not make the disc proper over its base. With coefficients prime to the residue characteristic, its proper-support `H⁰` is zero and `H²` is `Λ(−1)`, whereas ordinary `H⁰` is `Λ`. Proper supports are determined by the structural morphism, not by Hausdorff compactness of the associated Berkovich disc. (Li–Reinecke–Zavyalov, Lemma 4.2.2, p. 32; Huber (1996), Theorem 7.1.1, p. 361.)

For a finite étale split degree-`r` map `⊔_(a=1)^rX→X`, direct image is the `r`-fold direct sum and trace sends (`x₁`,…,`x_r`) to `Σx_a`. The composite of the diagonal unit and trace is multiplication by `r`. If `r=ℓ` and `Λ=Z/ℓ`, that composite is zero, although the summation trace remains surjective. The empty split map has zero source and zero trace. These tests preserve the distinction between a degree formula and division by the degree. (Huber (1996), Proposition 5.7.2, pp. 316–317; Stacks, Étale Cohomology, §59.66, tag 03SH.)

### Dependencies

Use Layers 1–7 and `AdicSpacesPartII`, layers R0–R1, and `AdicSpacesPartIII`, layers R2–R3, for separated morphisms, formal models, admissible modifications and analytification. `SchemeAndStackFoundations`, Layers 0 and 2 and Section 4.15, supplies noetherian descent, proper scheme comparison, infinitesimal deformation and stable pointed-curve moduli; `SchemeAndStackFoundations`, Layer 4, Section 4.14, supplies Hilbert and Quot constructions. The algebraic curve and Serre duality inputs are `TauCetiRoadmap.AlgebraicCurves`, Layer 12, and `JacobianChallenge`, `B`. The additional DVR approximation, reduced-fibre model and `O_C`-semistable curve compactification are stated in Section 8.2 with distinct scopes. `EnhancedDerivedSheaves`, §§0.1–0.4, supplies derived enhancements only after the analytic exchange, amplitude and projection properties have been proved here. Shared étale traces and algebraic supports are `EtaleCohomologyFoundations`, §§0.7–0.11.

## Layer 9: Berkovich comparison, traces and duality

### 9.1 Overconvergent proper supports

For a partially proper morphism `f` of rigid `K`-spaces and overconvergent abelian `F`, every `R^if_`!`F` is overconvergent. In particular `R^{2d}f_!Λ(d)` and `Λ_Y` are overconvergent, permitting the maximal-stalk test in the trace construction. For partially proper étale `f, f_`! restricts to the overconvergent categories and remains left adjoint to `f^*` there.

(Huber (1996), §8.2, Corollary 8.2.4 and proof, pp. 408–409; Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, §5.3, proof of Theorem 5.3.3, p. 78; Appendix A, Lemma A.19, p. 88.)

*Needs:* Section 3.2; Section 8.3; Section 1.2.

For a partially proper `f:X→Y` between taut rigid `K`-spaces and `F∈D⁺(u(X)_et,s,ℤ)`, there is a natural isomorphism `α_f(F):Rf_`!`θ_X^*F ≅ θ_Y^*Ru(f)_!F`. This is Zavyalov Theorem `A`.15, importing Huber 8.3.6. Its domain is a complex of Berkovich sheaves and its adic inverse image; the statement does not cover an arbitrary non-overconvergent complex on `X`.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Theorem A.15 and proof, p. 87; Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Remark A.16, p. 87.)

The morphism is natural in `F` and in the partially proper map, with source and target written in the stated direction. Arbitrary plus rings `C⁺≠O_C` and arbitrary adic sheaves are not silently included.

*Needs:* Section 3.1; Section 8.3; `DiamondsAndVStacks`, layer D0.

For partially proper étale `f:X→Y` between taut rigid spaces and `G∈Ab(u(Y)_et,s)`, the diagram comparing `θ_Y^*(u(f)_!u(f)^*G→G)` with `f_`!`f^*θ_Y^*G→θ_Y^*G` commutes via `α_f(u(f)^*G)` and `θ`-naturality. This is Zavyalov `A`.19, and fixes the degree-zero normalization used by the general trace.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Lemma A.19 and proof, p. 88 (adjunctions recalled on p. 87).)

*Needs:* Section 9.1; Section 3.2; Section 8.3; Section 1.2.

### 9.2 Curves, relative balls and algebraic comparison

Prove `aic_valuation_finite_conditions_transfer`: an embedding of algebraically closed nontrivially valued fields, with valuation subrings `V⊆W` and `W∩Frac(V)=V`, preserves and reflects solvability of finite polynomial equations and valuation-divisibility or strict-inequality conditions with parameters in `Frac(V)`. Value groups may have arbitrary rank. State this finite existential fragment on Mathlib's polynomial and valuation carriers. Its proof uses the quantifier elimination argument for algebraically closed valued fields: extend valued embeddings across algebraic closures by uniqueness up to conjugacy of valuation extensions, and across one transcendental element by its valuation cut and residue transcendence type. `A` back-and-forth extension in sufficiently saturated valued fields eliminates one existential block, and hence transfers the finite conditions. The trivially valued case needed below is ordinary algebraically closed field solvability and is treated separately; an extension from a trivial valuation to a nontrivial one is not an instance of the nontrivial theorem. (Huber (1996), proof of Lemma 7.2.3, p. 371, identifies precisely this quantifier-elimination input and the finite conditions used.)

Deduce `aic_valuation_section_lift`, stated in `Suggested.lean`: for a valuation ring `V` with algebraically closed fraction field, every residue-field-valued section of a flat finitely generated `V`-algebra `B` lifts to a `V`-valued section. Flatness gives a generic prime specializing to the chosen closed point. Dominate that localization by a valuation ring in an algebraic closure of its fraction field, then transfer the finite equations, integrality inequalities and prescribed strict residue congruences to `V`. Although the relation ideal of `B` over `V` can be infinitely generated, its generic relation ideal is finitely generated over the fraction field; flatness then retains every original relation. If `V` is a field this is the identity lift. (Huber, proof of Lemma 7.2.3, pp. 370–371.)

Let `S_s=(Spa(C,C⁺),{s})` be the analytic geometric point supported at the closed point `s`. Prove `indconstructible_nonempty_has_rational_section`: for a prepseudo-adic morphism `X→S_s` whose ambient map is locally of finite type and whose support is nonempty and ind-constructible in the inverse image of `{s}, X(S_s)` is nonempty. Reduce to finite constructible inequalities on a topologically finite-type affinoid chart. Lift the selected special-fibre point through the residual valuation using the preceding section theorem, then through rank-one analytic reduction using `AdicSpacesPartIII`, R2 (*specialisation-map*, property (iii)). The result respects the indicated support. Over full `S=Spa(C,C⁺)`, this applies to the nonempty closed-point pseudo-adic fibre; a section `S→X` must be supplied separately. The resulting point classes lie on that fibre. (Huber (1996), §7.2, Lemma 7.2.3 and proof, pp. 368, 370–372; the geometric-point convention is fixed on p. 366.)

**Checks.**

- The identity of `S_s` is an `S_s`-rational section.
- For rank-two `C⁺`, the rational open `Spa(C,O_C)⊂Spa(C,C⁺)` is nonempty but its closed-point fibre is empty and it has no section over full `S`.
- `A` nonempty ind-constructible closed-point fibre in a locally finite-type curve admits an `S_s`-rational point; a singleton nonclassical Gauss point need not and is outside the ind-constructible hypothesis.

*Needs:* Mathlib's polynomial, algebraic-closure and valuation-extension carriers; Layers 1–2 and 7; `AdicSpacesPartIII`, layer R2 (`specialisation-map`), for the specialisation map and its classical point lifting.

Let `S` be a locally noetherian analytic adic space. A smooth adic curve over `S` is a morphism `f : X → S` that is smooth (`AdicSpacesPartII`, layer R0 (`smooth-morphism`)), separated, taut (Section 3.1) and of relative pure dimension 1 (`AdicEtaleGeometry`, layer A2 (`dimension-of-adic-spaces`); for smooth `f` equivalently `Ω_{X/S}` locally free of rank 1, `AdicEtaleGeometry`, layer A2 (`smooth-pure-relative-dimension`)). Every smooth adic curve is locally of finite type, hence compactifiable (Section 8.1). The main base is `S = Spa(C, C⁺)` with `C` algebraically closed complete nonarchimedean and `C⁺ ⊆ C` an open and bounded valuation subring of any rank. Standard examples over such `S`: the relative closed unit ball `B_S = Spa(C⟨T⟩, C⁺⟨T⟩)` (`AdicEtaleGeometry`, layer A2 (`relative-closed-polydisc`); this is ECD's `B × Spa(C, C⁺)` with `B(R, R⁺) = R⁺`), the open discs `⋃_{m} {|T − a|ᵐ ≤ |ϖ| ρᵐ}`, the closed and open annuli, `P¹_S = P¹_C ×_{Spec C} S` (`AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`)), and `W ×_{Spec C} S` for a smooth separated curve `W` over `C`; taut open subspaces and étale separated taut `X`-spaces of a smooth adic curve are smooth adic curves. The generic fibre `X_η := X ×_S Spa(C, O_C)` is a pro-open subspace of `X` containing every rank-one point; it is open when the generic point `η` is open in `|S|` (for instance when `C⁺` has finite rank), and only pro-open in general.

This uses `S` locally noetherian analytic; the base `Spa(C, C⁺)` with `C⁺ ≠ O_C` is allowed and is the 'valued-plus-ring' case; relative dimension is the topological one of `AdicEtaleGeometry`, layer A2, computed on rank-one fibres.

(Scholze, Étale cohomology of diamonds, §1, p. 9; Scholze, Étale cohomology of diamonds, Theorem 24.1, p. 152; Berkovich (1993), §6.2, p. 112.)

Provide `AdicSpace.IsSmoothCurve`: The predicate: smooth, separated, taut, relative pure dimension 1; `AdicSpace.IsSmoothCurve.isCompactifiable`: Smooth adic curves are compactifiable; `AdicSpace.IsSmoothCurve.of_etale`: If `X → S` is a smooth adic curve and `V → X` is étale, separated and taut then `V → S` is a smooth adic curve; `AdicSpace.IsSmoothCurve.restrict`: Taut open subspaces of smooth adic curves are smooth adic curves.

Provide `AdicSpace.IsSmoothCurve.baseChange`: For quasi-compact `f` and S' `→ S`, the base change is a smooth adic curve; `AdicSpace.IsSmoothCurve.relBall`: `B_S → S` is a smooth adic curve; `AdicSpace.IsSmoothCurve.projectiveLine`: `P¹_S → S` is a proper smooth adic curve; `AdicSpace.IsSmoothCurve.genericFibre`: The pro-open generic fibre `X_η ⊆ X` over `Spa(C, O_C)` (open when `η` is open in `|S|`).

Provide `AdicSpace.IsSmoothCurve.relDim_eq_one`: `Ω_{X/S}` is locally free of rank 1.

**Checks.**

- For `S = Spa(C, C⁺), B_S → S` is a smooth adic curve with `Ω_{B_S/S}` free on dT.
- `P¹_S → S` is a smooth adic curve and is proper; for `S = Spa(C, O_C)` it is the analytification of `P¹_C` (`AdicSpacesPartII`, layer R1 (`analytification-functor`)).
- `B̄_S → S` is not a smooth adic curve: it is not locally of finite type.
- `A` nonempty étale separated morphism has relative dimension 0 and is not a smooth adic curve. The empty morphism satisfies both pure-dimension predicates vacuously.
- If `X → S` is a smooth adic curve then `X_η → Spa(C, O_C)` is a smooth adic curve and `X_η ⊆ X` is pro-open (open when `η` is open in `|S|`) with the same rank-one points.

For `S = Spa(C, C⁺), B_S → S` and `P¹_S → S` are smooth adic curves; `P¹_S → S` is proper. The universal compactification `B̄_S → S` of the ball is partially proper but not smooth (not locally of finite type). `A` nonempty étale morphism `X → S` is not a smooth adic curve (relative dimension 0).

*Needs:* `AdicSpacesPartII`, layer R0 (`smooth-morphism`); `AdicSpacesPartII`, layer R0 (`separated-morphism`); Section 3.1; Section 8.1; `AdicEtaleGeometry`, layer A2 (`dimension-of-adic-spaces`); `AdicEtaleGeometry`, layer A2 (`smooth-pure-relative-dimension`); `AdicEtaleGeometry`, layer A2 (`relative-closed-polydisc`); `AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`); `AdicSpacesPartII`, layer R0 (`finite-type-morphism-classes`); `AdicSpacesPartII`, layer R0 (`etale-smooth-composition`).

Notation: `C` an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p ≥ 1`; `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank; `S = Spa(C, C⁺)`, with closed point `s` and generic point `η = Spa(C, O_C)`; `n ≥ 1` an integer invertible in `C⁺` (hence prime to `p`); `μ_n` the étale sheaf of `n`-th roots of unity and `Λ(1) = Λ ⊗ μ_n`. Let `f : B_S → S` be the relative closed unit ball (`AdicEtaleGeometry`, layer A2 (`relative-closed-polydisc`)). Then `R^q f_`!`Λ = 0` for `q ≠ 2` and `R²f_`!`μ_n ≅ ℤ/n` is a constant sheaf on `S`: its specialisation maps along the chain `|S|` are isomorphisms. The isomorphism is the formal-model transfer (Section 8.3, with `𝒫 = P¹_{C⁺}` and `𝒰 = A¹`) of the scheme trace `Tr_{A¹} : R²π_`!`μ_n → ℤ/n` of the affine line over `C⁺/ϖ` (`EtaleCohomologyFoundations`, §§0.7–0.11). It is compatible (i) with restriction to every open `U = Spa(C, C⁺_U) ⊆ S (C⁺ ⊆ C⁺_U ⊆ O_C)`, (ii) with base change along every morphism `Spa(C', C'⁺) → Spa(C, C⁺)` of algebraically closed affinoid fields (`B_S` pulls back to `B_{S'}`), and (iii) with the inclusion `B_S ⊆ P¹_S`: extension by zero `R²f_`!`μ_n → R²(f_{P¹})_*μ_n` is an isomorphism onto `H²(P¹_S, μ_n) ≅ ℤ/n`, the degree normalisation. For `C⁺ = O_C` this is the case of Hub96 Theorem 7.2.2 and Proposition 5.5.8 restated in ECD's proof of Theorem 24.1: `Rf_{C!}F_ℓ(1) → F_ℓ[−2]` with `Rⁱ f_{C!} = 0` for `i > 2`.

This uses `C` algebraically closed, `C⁺` arbitrary open bounded valuation subring; `n>0` a unit in `C⁺`.

(Scholze, Étale cohomology of diamonds, proof of Theorem 24.1, p. 152; Scholze, Étale cohomology of diamonds, §1, p. 9; Huber (1996), §3.5, (3.5.12), p. 207.)

`C⁺ = O_C, n = ℓ: R²f_{C!}F_ℓ(1) ≅ F_ℓ` and `Rⁱ f_{C!}F_ℓ(1) = 0` for `i ≠ 2`, the input of ECD's condition (iv). For `C⁺` of rank two, the stalk of `R²f_`!`μ_n` at the closed point `s` is `H²_c(B_S/S, μ_n) ≅ ℤ/n` and the specialisation to `η` is an isomorphism.

*Needs:* `AdicEtaleGeometry`, layer A2 (`relative-closed-polydisc`); `AdicSpacesPartIII`, layer R2 (`generic-fibre-functor-d`); Section 8.3; `EtaleCohomologyFoundations`, §§0.7–0.11 (the trace for smooth curves); `SchemeAndStackFoundations`, Layer 2; Section 9.2.

Notation: `C` an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p ≥ 1`; `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank; `S = Spa(C, C⁺)`, with closed point `s` and generic point `η = Spa(C, O_C)`; `n ≥ 1` an integer invertible in `C⁺` (hence prime to `p`); `μ_n` the étale sheaf of `n`-th roots of unity and `Λ(1) = Λ ⊗ μ_n`. Let `W` be a separated scheme of finite type over `C` of dimension `≤ 1, W^ad := W ×_{Spec C} S` (`AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`)) with its structure map `f^ad : W^ad → S`, and `F` a constructible sheaf of `ℤ/n`-modules on `W` with analytification `F^ad` (pullback along the morphism of sites `W^ad_ét → W_ét`). Then there is a canonical isomorphism `RΓ_c(W, F) ≅ RΓ(S, Rf^ad_!F^ad)`, compatible with the maps induced by open immersions and finite flat morphisms of curves and with restriction to the generic point `Spa(C, O_C)`; for `W` proper, `RΓ(W, F) ≅ RΓ(W^ad, F^ad)`.

This uses dim `W ≤ 1` (the case needed for traces of curves); the general proper comparison is Hub96 Theorem 3.7.2, owned by Sections 8.2 and 11.1–11.3; `n>0` a unit in `C⁺`; `C⁺` arbitrary.

(Berkovich (1993), Theorem 7.1.1, p. 128; Huber (1996), §3.7, Theorem 3.7.2, p. 226; Huber (1996), §3.5, Theorem 3.5.13, p. 208.)

`W = P¹_C, F = μ_n: H²(P¹_S, μ_n) ≅ H²(P¹_C, μ_n) ≅ ℤ/n`. `W = G_{m,C}: H¹_c(W^ad/S, ℤ/n) ≅ ℤ/n` and `H²_c ≅ ℤ/n(−1)`.

*Needs:* `AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`); Section 8.3; `AdicSpacesPartIII`, layer R2 (`formal-completion-and-algebraic-comparison`); Section 4.4; `SchemeAndStackFoundations`, Layer 2; Section 2.5.

Notation: `C` an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p ≥ 1`; `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank; `S = Spa(C, C⁺)`, with closed point `s` and generic point `η = Spa(C, O_C)`; `n ≥ 1` an integer invertible in `C⁺` (hence prime to `p`); `μ_n` the étale sheaf of `n`-th roots of unity and `Λ(1) = Λ ⊗ μ_n`. To every smooth adic curve `f : X → S` (Section 9.2) is attached a trace `Tr_f : R²f_`!`μ_n → ℤ/n` of sheaves on `S`, which induces a homomorphism `Tr_X : H²_c(X/S, μ_n) → ℤ/n` on global sections, and, by the projection formula and `R^q f_`! `= 0` for `q > 2`, a map `Tr_f : Rf_`!`(f^*K(1))`[2] `→ K` for `K ∈ D(S_ét, ℤ/n)`. The traces are uniquely determined by: (a) for every flat, separated, locally quasi-finite `S`-morphism `φ : Y → X` of smooth adic curves, `Tr_Y = Tr_X ∘ Tr_φ`, with `Tr_φ` the flat quasi-finite trace (Section 8.6); `(b) Tr_{P¹_S}` is the degree: `H²(P¹_S, μ_n) ≅ H²(P¹_C, μ_n) ≅ Pic(P¹)/n → ℤ/n` (Section 9.2); `(c)` generic-point determination: `Hom_S(R²f_!μ_n, ℤ/n) ≅ Hom(H²_c(X_η, μ_n), ℤ/n)` by restriction to the generic point `η = Spa(C, O_C)`, and `Tr_f` corresponds to `Tr_{X_η}`. For `C⁺ = O_C` the traces are surjective for nonempty `X`; they are compatible with base change of `S` and with restriction to opens of `S` (Section 9.2), with finite étale maps and restrictions to open subspaces (Section 9.2), with the algebraic trace (Section 9.2), and are isomorphisms for connected `X` in the cases of Section 9.2. Hub96 Theorem 7.2.2 applies to geometric-point fibres (singleton support); the full-field-pair trace uses the generic-point determination and relative-ball comparison stated here.

This uses `S = Spa(C, C⁺)` with `C` algebraically closed; quasi-compact open subsets `U ⊆ S` are again of this form `(U = Spa(C, C⁺_U))` and are allowed as bases; a non-quasi-compact open of the chain `|S|` (which exists for some `C⁺` of infinite rank) is not of this form; `n>0` a unit in `C⁺`; no trace is asserted on `p`-torsion (Berkovich Remark 6.2.10).

(Berkovich (1993), Theorem 6.2.1, p. 112; Scholze, Étale cohomology of diamonds, proof of Theorem 24.1, p. 152; Scholze, Étale cohomology of diamonds, §1, p. 9.)

Provide `AdicSpace.curveTrace`: `Tr_f : R²f_`!`μ_n → ℤ/n` for a smooth adic curve `f` over `Spa(C, C⁺)`; `AdicSpace.curveTrace'`: The derived form `Rf_`!`(f^*K(1))`[2] `→ K`; `AdicSpace.curveTrace_comp_quasiFiniteTrace`: `Tr_Y = Tr_X ∘ Tr_φ` for flat quasi-finite separated `φ : Y → X`; `AdicSpace.curveTrace_projectiveLine`: On `P¹_S` the trace is the degree.

Provide `AdicSpace.curveTrace_generic`: `Hom(R²f_!μ_n, ℤ/n) ≅ Hom(H²_c(X_η, μ_n), ℤ/n)` sends `Tr_f` to `Tr_{X_η}`; `AdicSpace.curveTrace_surjective`: For `C⁺ = O_C, Tr_X` is surjective for nonempty `X`; `AdicSpace.curveTrace_unique`: Any family of maps satisfying (a)–`(c)` is the trace; `AdicSpace.curveTrace_baseChange`: Compatibility with change of the base `Spa(C, C⁺)` (construction curve-trace-base-change).

Provide `AdicSpace.curveTrace_isIso`: Isomorphism for connected `X` in the cases of curve-trace-iso-connected.

**Checks.**

- For `B_S → S, Tr : R²f_`!`μ_n → ℤ/n` is an isomorphism.
- `Tr_{P¹_S}(c₁(O(1))) = 1 ∈ ℤ/n`.
- For the finite étale Kummer covering of degree `m` of the unit circle, `Tr ∘ φ^* = m · Tr`.
- For `X = ∅, H²_c(X/S, μ_n) = 0` and `Tr = 0`.
- For `C⁺ ≠ O_C, Tr_f` is the unique map `R²f_`!`μ_n → ℤ/n` whose stalk at `η` is `Tr_{X_η}`.
- For rank-two `S` and `n>1`, let `j:η=Spa(C,O_C)`↪`S, p:P¹_η→η` and `f=j∘`p. Then `R²f_`!`μ_n=j_`!`Λ_η, Λ=Z/n`, and `Γ(S,j_!Λ_η)=0`: extension by zero has zero closed stalk, and a section over `S` is determined by that stalk. By `j_`!`⊣j*, Hom_S(j_!Λ_η,Λ_S)=Λ`. The normalized nonzero trace and the zero sheaf map therefore induce the same map `H²_c(P¹_η/S,μ_n)=0→Λ`; their generic restrictions differ. For `C⁺=O_C` the base has one point and the numerical trace does determine the sheaf map.
- For char `C = 0` and residue characteristic `p, H²_c(D, μ_p)` of the open unit disc is not `ℤ/p` (Berkovich Remark 6.2.10): no trace isomorphism exists for `p`-torsion.

For the relative ball `B_S → S, Tr` is the isomorphism `R²f_`!`μ_n ≅ ℤ/n` of Section 9.2; for `C⁺ = O_C` this is ECD's trace map `Rf_{C!}F_ℓ(1) → F_ℓ[−2]`. For the Kummer covering `φ : {|T| = 1} → {|T| = 1}, T ↦ Tᵐ (p ∤ m), Tr ∘ φ^* = m·Tr` on `H²_c`. For `P¹_S, Tr(c₁(O(1))) = 1`.

*Needs:* Section 9.2; Section 8.6; Section 3.2; Section 8.5; Section 8.3; Section 8.4; `AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`); `EtaleCohomologyFoundations`, §§0.7–0.11 (the trace for smooth curves); Section 1.4.

Notation: `C` an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p ≥ 1`; `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank; `S = Spa(C, C⁺)`, with closed point `s` and generic point `η = Spa(C, O_C)`; `n ≥ 1` an integer invertible in `C⁺` (hence prime to `p`); `μ_n` the étale sheaf of `n`-th roots of unity and `Λ(1) = Λ ⊗ μ_n`. Let `X → S` be a smooth adic curve. (i) For a finite étale `S`-morphism `φ : Y → X` of degree `d, Tr_Y = Tr_X ∘ Tr_φ` on `H²_c(Y/S, μ_n)` and `Tr_Y ∘ φ^* = d · Tr_X` on `H²_c(X/S, μ_n)`. (ii) For an open subspace `U ⊆ X` with taut source, `Tr_U = Tr_X ∘ ι_`! where `ι_`! : `H²_c(U/S, μ_n) → H²_c(X/S, μ_n)` is extension by zero; in particular the traces of `X` and of its quasi-compact open subspaces are compatible under the quasi-compact exhaustion. (iii) For a separated étale `V → X` that is quasi-compact, `Tr_V = Tr_X ∘ Tr_{V/X}`.

This uses `n>0` a unit in `C⁺`; `φ` finite étale, `U` open with taut source, `V → X` separated étale quasi-compact.

(Berkovich (1993), Theorem 6.2.1(a), p. 112; Berkovich (1993), Theorem 5.4.1(d), p. 107.)

For the open unit disc `D ⊆ B, Tr_D = Tr_B ∘ ι_`! and `ι_`! : `H²_c(D, μ_n) → H²_c(B, μ_n)` is an isomorphism. For the degree-`m` Kummer covering of the unit circle, `Tr ∘ φ^* = m · Tr`.

*Needs:* Section 9.2; Section 8.6; Section 8.3.

Let `g` : S' `= Spa(C', C'⁺) → S = Spa(C, C⁺)` be a morphism of algebraically closed affinoid fields (C' `⊇ C` complete algebraically closed, `C'⁺ ∩ C ⊇ C⁺` or more generally any morphism of adic spaces), `n>0` a unit in `C⁺, f : X → S` a quasi-compact smooth adic curve and f' : X' `= X ×_S` S' `→` S'. Then under the base change isomorphism `g^*R²f_`!`μ_n ≅ R²f'_`!`μ_n` (Section 8.4) one has `g^*(Tr_f) = Tr_{f'}`. In particular: (i) for an open `U = Spa(C, C⁺_U) ⊆ S` the trace of `X_U → U` is the restriction of `Tr_f`; (ii) for the morphism `Spa(C', C'⁺) → Spa(C, O_C)` given by an extension `C ⊆` C' with `O_C ⊆ C'⁺` (the situation of ECD's condition (iv)), `Tr_{X'}` is the pullback of `Tr_{X_C}`. These are the relative and valued-plus-ring compatibilities used in ECD's proof of Theorem 24.1.

This uses `f` quasi-compact (so base change applies); `n>0` a unit in `C⁺`.

(Berkovich (1993), Theorem 6.2.1, p. 112; Scholze, Étale cohomology of diamonds, proof of Theorem 24.1, p. 152.)

For the relative ball, `g^*(Tr_{B_S}) = Tr_{B_{S'}}`, both being the formal-model transfer of the scheme trace of `A¹` (Section 9.2 (ii)). For `U = Spa(C, O_C) ⊆ S`, restricting `Tr_{B_S}` gives ECD's trace over `Spa(C, O_C)`.

*Needs:* Section 9.2; Section 8.4; Section 8.6.

Notation: `C` an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p ≥ 1`; `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank; `S = Spa(C, C⁺)`, with closed point `s` and generic point `η = Spa(C, O_C)`; `n ≥ 1` an integer invertible in `C⁺` (hence prime to `p`); `μ_n` the étale sheaf of `n`-th roots of unity and `Λ(1) = Λ ⊗ μ_n`. Let `f : X → S` be a smooth adic curve with `X` nonempty. If `C⁺ = O_C`, then `Tr_X : H²_c(X/S, μ_n) → ℤ/n` is surjective, and it is an isomorphism when `X` is connected. If `C⁺` is arbitrary, `X_η` is connected and `R²f_`!`μ_n` is a constant sheaf on `S` (its specialisation maps along `|S|` are isomorphisms), `Tr_f : R²f_`!`μ_n → ℤ/n` is an isomorphism; for a quasi-compact tube `λ⁻¹(𝒰)` in a proper `C⁺`-model smooth of relative dimension one along `𝒰`, a sufficient hypothesis is that the normalized scheme trace `R²π_{𝒰!}μ_n → Λ`, with `Λ = ℤ/n`, is an isomorphism over the whole base `Spec(C⁺/ϖ)`. Section 8.3 transports that isomorphism, including its trace normalization, to `S`. The supplied scheme smooth-curve trace and torsion proper-support base change identify each top stalk with the normalized trace of its geometric fibre; nonempty geometrically connected fibres throughout that base therefore give this hypothesis. It applies to the relative ball, the circle `{|T| = 1}` and `P¹_S`; quasi-compact exhaustion by relative balls of radius in `|C^×|` gives the open discs over `S`. Arbitrary opens of smooth models need not satisfy it. Annuli of positive width are not covered by this tube argument.

This uses `n>0` a unit in `C⁺`; plus-ring case: constancy of `R²f_`!`μ_n` is a hypothesis. The sufficient tube condition retains the scheme trace isomorphism over the entire base, rather than connectedness only at its generic point.

(Berkovich (1993), Theorem 6.2.1, last sentence, p. 112; Scholze, Étale cohomology of diamonds, §1, p. 9; SGA 4 XVIII, §§1–3, especially Theorem 3.2.5, for the scheme trace and its fibrewise normalization; `EtaleCohomologyFoundations` §0.11 (`ClassicalAlgebraic.smoothTrace`).)

**Checks.**

- The open unit disc and the relative ball have trace isomorphisms for every `C⁺`; the relative circle and `P¹_S` have the normalized scheme trace over the whole residual base.
- For `n > 1`, two relative discs have `R²f_!μ_n = Λ_S²` and trace the sum map, which is surjective and not injective. For `n = 1` the zero map between zero sheaves is an isomorphism.
- Let `k` be an algebraic closure of `𝔽_p(u)` with a prolongation of the `u`-adic valuation, `C` the completed algebraic closure of `k((t))` for its `t`-adic absolute value, and `C⁺` the inverse image of that valuation ring under `O_C→k`. Put `A₀=C⁺/tC⁺`. The open `𝒰=P¹_{A₀}×D(ū)` in the special fibre of `P¹_{C⁺}` has tube `P¹_η` over rank-two `S`, where `η=Spa(C,O_C)`. For `n>1` prime to `p`, its top direct image is `j_!Λ_η`, with generic stalk `Λ` and closed stalk zero. Its generic fibre is connected, but its trace is not an isomorphism. The missing closed fibre violates the sufficient scheme trace hypothesis.

*Needs:* Section 9.2; Section 3.2; Section 8.3; `AdicSpacesPartIII`, layer R2 (`residue-disc`); Section 8.5; `EtaleCohomologyFoundations`, §§0.7–0.11 (the trace for smooth curves).

Notation: `C` an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p ≥ 1`; `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank; `S = Spa(C, C⁺)`, with closed point `s` and generic point `η = Spa(C, O_C)`; `n ≥ 1` an integer invertible in `C⁺` (hence prime to `p`); `μ_n` the étale sheaf of `n`-th roots of unity and `Λ(1) = Λ ⊗ μ_n`. Let `W` be a smooth separated curve over `C, W^ad = W ×_{Spec C} S`, and `Tr^alg_W : H²_c(W, μ_n) → ℤ/n` the scheme trace (`EtaleCohomologyFoundations`, §§0.7–0.11, which also supplies the trace of proper `W`). Then `Tr_{W^ad} ∘ c = Tr^alg_W`, where `c : H²_c(W, μ_n) ≅ H²_c(W^ad/S, μ_n)` is the comparison isomorphism of Section 9.2. For `W = P¹` this is the normalisation `(b)` of Section 9.2.

This uses `W` smooth separated over `C`; `n>0` a unit in `C⁺`.

(Berkovich (1993), Corollary 6.2.9, p. 118.)

`W = G_m`: both traces send the class of the generator of `H²_c(G_m, μ_n) ≅ ℤ/n` to 1. `W` proper of genus `g: Tr_{W^ad}` is the degree map on `Pic(W)/n` under `H²(W^ad, μ_n) ≅ H²(W, μ_n)`.

*Needs:* Section 9.2; Section 8.6; `EtaleCohomologyFoundations`, §§0.7–0.11 (the trace for smooth curves); `EtaleCohomologyFoundations`, §§0.7–0.11 (the finite flat trace in relative dimension zero).

Let `f : Y → X` be a quasi-compact smooth morphism of locally noetherian analytic adic spaces such that for every geometric point `ξ = Spa(C, C⁺) → X` the fibre `Y ×_X Spa(C, C⁺)` is nonempty and connected and, when `C⁺ ≠ O_C`, also every fibre of `f` over a point of the chain `|Spa(C, C⁺)|` (for `X` of rank one, the only case used by Section 9.6, this is the first condition). Then for every étale sheaf of sets `F` on `X` the unit `F → f_*f^*F` is an isomorphism; in particular `(f^*F)(Y) = F(X)`.

This uses `f` quasi-compact and smooth (hence open, `AdicSpacesPartII`, layer R0 (`smooth-morphism-open`)); fibres over all geometric points nonempty and connected.

(Berkovich (1993), Proposition 7.3.2, p. 137.)

For the relative ball `B_S → S` over `S = Spa(C, C⁺), f_*f^*F = F` for every sheaf `F` on `S`; in particular `H⁰(B_S, Λ) = Λ`. For the disjoint union of two balls the unit is the diagonal `F → F × F`; it fails to be an isomorphism when `F ≠ 0`, and is an isomorphism for the zero sheaf.

*Needs:* `AdicSpacesPartII`, layer R0 (`smooth-morphism-open`); `AdicEtaleGeometry`, layer A1 (`etale-enough-points`); `AdicEtaleGeometry`, layer A1 (`strict-localisation-analytic`); Section 1.5; `AdicSpacesPartII`, layer R0 (`smooth-morphism`).

### 9.3 Chern classes, boundary degrees and reciprocity

Let `f:X→Y` be a compactifiable locally `+`weakly finite type morphism of locally noetherian analytic adic spaces and `K` a bounded-below torsion complex. Formation of `R⁺f`! has a base-change transformation for every analytic pullback. This transformation is an isomorphism for pullbacks of transcendence dimension zero, in particular the canonical completed algebraic-closure field-pair maps used to compute geometric stalks. This weak assertion does not require torsion orders to be units in `O_Y⁺`. If torsion orders are units there, the inherited full base-change theorem applies to arbitrary pullbacks.

This uses The dimension-zero condition is on the base-change morphism, not on `f`; Only the bounded-below version and constant shifted complexes are needed for the public trace proof.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Theorem 6.1.1(2) and footnote 23, pp. 66–67; proof of Lemma 6.1.10, pp. 72–73; proof of Lemma 6.2.3, pp. 75–76.)

At residue-`p` coefficients the transformation remains a map for arbitrary pullbacks; LRZ Example 6.3.3 gives failures of invertibility. `A` completed algebraic-closure stalk map has the stated zero transcendence dimension; an arbitrary extension of algebraically closed fields need not.

*Needs:* Section 8.3; Section 8.4; Section 1.2; `AdicEtaleGeometry`, layer A2; `EnhancedDerivedSheaves`, §§0.1–0.4.

For a locally noetherian analytic adic space `X, n>0` invertible in `O_X`, and a line bundle `L`, define `c₁(L)∈H²(X_ét,μ_n)` as the Kummer connecting image of its class in `Pic(X)≅H¹(X_ét,G_m)`. It is additive under tensor product, commutes with analytic pullback, and agrees with the scheme first Chern class under relative analytification. This is a cohomological construction in Layers 8–9; the line bundles themselves and their pullbacks are supplied by R3.

This uses No choice of a root of unity is part of the definition; the target is `μ_n`, not an untwisted coefficient group.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Variant 3.1.8, Remarks 3.1.9–3.1.10 and Lemma 3.1.11, pp. 22–23.)

Provide `AnalyticFirstChernClass.kummer`: `c₁(L)=δ_Kummer([L])` in `H²(X,μ_n)`; `AnalyticFirstChernClass.tensor`: `c₁(L⊗M)=c₁(L)+c₁(M)`; `AnalyticFirstChernClass.pullback`: `g*c₁(L)=c₁(g*L)`; `AnalyticFirstChernClass.analytification`: The scheme-to-analytic étale comparison sends the scheme `c₁(L)` to `c₁(L_an)`.

**Checks.**

- The trivial line bundle has first Chern class zero.
- `c₁(L⊗n)=n·c₁(L)=0` in `H²(X,μ_n)`.
- On `P¹,an_C` the class of `O(1)` agrees with the scheme degree-one generator and has algebraic trace 1.

The line-bundle class lies in `H¹(G_m)`, correcting the degree slip in Remark 3.1.10.

*Needs:* `AdicSpacesPartIII`, layer R3; Section 1.4; Layers 1 and 3; `EnhancedDerivedSheaves`, §§0.1–0.4; `EtaleCohomologyFoundations`, §§0.7–0.11; `AdicSpacesPartIII`, layer R3 (`locally-free-sheaf`).

For `Y` locally noetherian analytic and `n>0` invertible in `O_Y`, write `Λ=Z/n` and `π̄:P¹,an_Y→Y`. The unit and `c₁(O(1))` give an equivalence `Λ_Y ⊕ Λ_Y(−1)[−2]→Rπ̄_*Λ`. In particular `c₁(O(1))` induces `Λ_Y≅R²π̄_*Λ(1)`. These identifications commute with the canonical base-change transformations.

This uses This special projective-bundle formula suffices for affine trace normalization; no analytic lci cycle-class or blow-up theory is reconstructed here.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Construction 3.2.1 and Proposition 3.2.2, p. 23.)

`R⁰π̄_*Λ=Λ` and `R²π̄_*Λ(1)=Λ`, with all other positive degrees zero. The generator is `c₁(O(1))`; changing it by a sign would change the trace normalization.

*Needs:* Section 9.3; Section 9.2; `AdicSpacesPartIII`, layer R3; Layers 1 and 3; `EtaleCohomologyFoundations`, §§0.7–0.11.

Construct the analytic localized cycle class `AnalyticLCICycleClass i` for an lci Zariski-closed immersion `i:Z→X` of pure codimension `c` in a locally noetherian analytic adic space, with `n>0` a unit in `O_X` and `Λ=Z/n`. It has type `H^{2c}_Z(X,Λ(c))`, or equivalently a morphism `i_*Λ_Z→Λ_X(c)[2c]`. For a divisor use the localized Kummer Chern class. For higher codimension blow up along `Z`: the exceptional divisor has projective normal bundle, and the projective-bundle formula together with localization gives the unique monic relation for its negative divisor class; the constant term defines the class on `X`. Obtain the projective-bundle formula here from proper algebraic comparison and the algebraic formula, including all twists and coefficient changes. This defines a class for `n` a unit in `O`; it does not assert an absolute purity isomorphism for every such `n`. (Li–Reinecke–Zavyalov, §3.2, Construction 3.2.3, Convention 3.2.4 and Proposition 3.2.5, pp. 24–25; §3.3, Definition 3.3.2 and Variant 3.3.3, p. 25.)

Provide `AnalyticLCICycleClass.cartier`, agreement with the localized first Chern class; `AnalyticLCICycleClass.transversalPullback`, pullback when both immersions remain lci of the same codimension; `AnalyticLCICycleClass.normalCrossingProduct`, the product of divisor classes for normally crossing equations; `AnalyticLCICycleClass.normalCrossingComp`, compatibility for successive blocks of those equations; `AnalyticLCICycleClass.coefficientReduction`, naturality in `Z/n→Z/m` for `m|n`; and `AnalyticLCICycleClass.analytification`: for `S=Spa(A,A⁺)` strongly noetherian Tate, `X` locally of finite type over `A, Z→X` a regular closed immersion of pure codimension `c` and `n>0` invertible in `A`, relative analytification carries `ClassicalAlgebraic.lciCycleClass` of `EtaleCohomologyFoundations`, §0.9 to the analytic class. This comparison requires algebraic input data for the immersion. `A` section of a smooth morphism has a regular immersion of codimension `d`, so these interfaces give its coefficient-compatible class. (Li–Reinecke–Zavyalov, Lemmas 3.3.4 and 3.3.6, Corollary 3.3.8, pp. 25–27; Lemma 3.4.1, pp. 27–28; Zavyalov, *Foundational results in adic geometry*, Corollary 5.11 and Lemma 7.14, pp. 12 and 18.)

**Checks.**

- For `c=1` the blow-up prescription is the localized divisor Chern class, with the negative exceptional divisor used in the monic relation.
- The coordinate origin in a two-dimensional smooth chart has class `cl(T₁=0)∪cl(T₂=0)` in degree 4 and twist 2. Interchanging the two degree-2 factors gives sign `(−1)⁴=+1`, including for `n=2`.
- For `C=ℂ₃, X=A³_C` and `Z=V(y²−x³,t)`, the two equations are a regular sequence although `Z` is singular. The algebraic and analytic degree-four, twist-two classes agree for `n=2`.
- An empty intersection of normally crossing coordinate divisors has zero class with empty support; its product cannot be treated as a nonzero global orientation.
- On `P¹` the degree-one point class maps to `c₁(O(1))`, and the trace is `+1`. Reduction from `Z`/4 to `Z`/2 preserves this value.

*Needs:* Section 1.2 localization, Section 8.2 proper algebraic comparison, the preceding Kummer Chern classes, and the analytic lci, normal bundle, blow-up and projective bundle geometry of `AdicSpacesPartII`, layers R0–R1, and `AdicSpacesPartIII`, layers R2–R3. The algebraic regular-immersion class is `ClassicalAlgebraic.lciCycleClass` of `EtaleCohomologyFoundations`, §0.9; the projective-bundle formula is `ClassicalAlgebraic.cycleClasses` there.

Let `X=Spa(A,A°)` be a nonempty smooth affinoid curve over a complete algebraically closed nonarchimedean field `C`, and let `j:X→`Xᶜ be the universal compactification over `Spa(C,O_C)`. Its boundary `I` is finite and discrete, consisting of rank-two closed points, with at least one point on every connected component. For `x∈I` set `K_x=k(x)ʰ`, or its completion after henselization, and use the corresponding henselian valuation pair. The boundary étale topos is the finite product of the topoi `(Spec K_x)_ét`. For `n>0` invertible in `C, H⁰({x},μ_n)=μ_n(C), H¹({x},μ_n)=K_x×/(K_x×)ⁿ`, and `Hⁱ({x},μ_n)=0` for `i≥2`. These identifications carry finite-flat cohomological trace on `H¹` to the field norm.

This uses `X` uses the maximal plus ring `A°` and the base plus ring is `O_C`; The henselian field, not the raw residue field or its unhenseled completion, is essential.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Lemmas 4.2.2, 4.2.4–4.2.5, pp. 32–33; Lemma 5.1.4, p. 43; Corollary 5.2.5, pp. 47–48; Appendix B.1–B.2, pp. 123–124.)

The closed disc has one boundary point and one Kummer field summand. Replacing `K_x` by `k(x)` is disallowed by the source’`s` explicit henselian warning. `A` boundary point is handled through its pseudo-adic topos, rather than by inventing an analytic adic point space.

*Needs:* the supplier contracts; Section 8.2; Section 8.6; `AdicSpacesPartII`, layer R0; Layer 2; Section 1.4; `SchemeAndStackFoundations`, Layer 2; `TauCetiRoadmap.ProfiniteCohomology`, Layer 9.

In the preceding affinoid-curve setting, let `r=`#`I` and `s=`#`π₀(X)`. For `n` invertible in `C, H⁰_c(X,μ_n)=0` and `Hⁱ_c(X,μ_n)=0` for `i≥3`, and localization gives the exact sequence `0→μ_n(C)^(r−s`)`→H¹_c(X,μ_n)→H¹(Xᶜ,μ_n)→⊕_{x∈I}K_x×/(K_x×)ⁿ→H²_c(X,μ_n)→0`. Moreover `H¹(Xᶜ,μ_n)≅H¹(X,μ_n)`, with `0→A×/(A×)ⁿ→H¹(X,μ_n)→Pic(X)[n]→0`. Thus `H²_c` is canonically the cokernel of the boundary restriction `β`, as a `Z/n`-module.

This uses The compact support is relative to `Spa(C,O_C)`; all Kummer groups are written additively when treated as modules.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Proposition 5.1.2 and Proposition 5.1.5, pp. 42–43; Bogdan Zavyalov, Some foundational results in adic geometry, Lemma 10.3, pp. 31–32.)

For a connected disc `r=s=1`, the initial `μ_n(C)^(r−s`) term is zero. For a connected positive-width annulus with two boundary branches, the initial term is one `μ_n(C)`. Do not replace `H¹(X,μ_n)` by units alone when `Pic(X)[n]` is nonzero.

*Needs:* Section 9.3; Section 8.5; Layers 1 and 3; Layer 2; `SchemeAndStackFoundations`, Layer 2; `AdicSpacesPartII`, layer R0.

In the affinoid boundary setting define `q_x:K_x×/(K_x×)ⁿ→Z/n` by the secondary degree #`v_x` modulo `n`, and define pretrace `P_X:⊕_{x∈I}K_x×/(K_x×)ⁿ→Z/n` as the sum of the `q_x`. The degree is normalized by #`(γ₀)=1` for the greatest value `γ₀<1`. Under the ordered-group decomposition `Γ_x≅Γ_C×Z` used by LRZ, # is the negative of the second-coordinate projection. In particular the disc boundary has #`v(T)=−1`. Its finite linear assembly is an instance of Mathlib LinearMap.lsum; geometry and Kummer identifications are additional inputs, not arbitrary parameters replacing cohomology.

This uses `n>0` invertible in `C`; finite boundary `I` and the secondary degrees are supplied by R0.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Definition 2.2.8 and Warning 2.2.9, pp. 11–12; Definition 5.1.8 and Example 5.1.15, pp. 43–45.)

Provide `BoundaryPretrace.sumDegree`: The value on `(a_x)` is `Σ_x q_x(a_x)`; `BoundaryPretrace.single`: The value on a class supported at `x` is `q_x` of that class; `BoundaryPretrace.reindex`: `A` bijection of the finite boundary set leaves the sum unchanged after transporting its degree maps; `BoundaryPretrace.descend`: For a submodule `N` contained in `ker P_X` there is a unique linear map from `B/N` whose composite with `N`.mkQ is `P_X`; it is `N`.liftQ `P_X`.

Provide `BoundaryPretrace.norm`: For a finite flat map and its boundary norm map `N, P_Y∘N=P_X` whenever each secondary degree satisfies the field norm identity.

**Checks.**

- For the empty finite index set the assembly is zero; this is an algebraic test, not a claim that a nonempty affinoid curve has empty boundary.
- `A` vector with one supported component a has value `q_x(a)`.
- Two components of degrees a and `−a` give zero; neither a maximum nor an unsigned count passes this test.
- At the closed-disc boundary, the Kummer class of `T` has pretrace `−1` modulo `n`. For `n>2` this distinguishes the two possible signs.

Actual degrees use the value group of henselized boundary fields. `A` positive projection onto the displayed `Z` factor gives the wrong value on `T`.

*Needs:* Section 9.3; `AdicSpacesPartII`, layer R0; Mathlib LinearMap.lsum; Mathlib `LinearMap.lsum_piSingle`; Mathlib Submodule.liftQ; Mathlib `Submodule.liftQ_mkQ`; Mathlib Submodule.mkQ; Mathlib `Submodule.mkQ_surjective`.

For every smooth affinoid curve `X` in the boundary setting, the composite `H¹(Xᶜ,μ_n)→⊕_x K_x×/(K_x×)ⁿ→ᴾ_X Z/n` is zero. Equivalently `im β⊆ker P_X`. The statement applies when `n` is invertible in `C`, even if it is divisible by the residue characteristic.

This uses The secondary degrees have the normalization of boundary-pretrace.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Theorem 5.1.9, p. 44; §5.2, Setup 5.2.1, Lemma 5.2.3 with diagrams (5.2.2) and (5.2.4), and Corollary 5.2.5, pp. 45–48; Lemma 2.2.10, p. 12.)

Vanishing is required on all `H¹(Xᶜ,μ_n)`, including line-bundle Kummer classes. Norm compatibility must use henselized field extensions and their defectless curve-like valuation normalization.

*Needs:* Section 9.3; Section 8.6; `AdicSpacesPartII`, layer R0; `AdicSpacesPartII`, layer R0 (`affinoid-noether-normalisation`).

For a smooth affinoid curve `X` over `Spa(C,O_C)` and `n>0` invertible in `C`, define `t_X:H²_c(X,μ_n)→Z/n` as the unique linear map satisfying `t_X∘∂=P_X`, where `∂` is the surjective boundary connecting map of boundary-localization-presentation. It is surjective. Under a finite flat map of such curves `f:X→Y, t_Y∘H²_c(tr_f(1))=t_X`. This boundary construction gives the inherited prime-to-residue curve trace once its algebraic normalization comparison is proved; residue-`p` surjectivity does not imply injectivity.

This uses All compact supports are relative to `Spa(C,O_C)`; no extension of this boundary construction to arbitrary `C⁺` is asserted.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Definition 5.1.10 and Remark 5.1.11, p. 44; Theorem 5.2.7, p. 48.)

Provide `BoundaryResidueTrace.comp_boundary`: `t_X∘∂=P_X`; `BoundaryResidueTrace.unique`: Any linear map from `H²_c` with this composite equals `t_X`; `BoundaryResidueTrace.surjective`: For nonempty `X` the map `t_X` is onto; `BoundaryResidueTrace.finiteFlat`: `t_Y∘H²_c(tr_f(1))=t_X` for a finite flat morphism.

Provide `BoundaryResidueTrace.classical`: For `n` invertible in `O_C` it agrees with the inherited normalized curve trace, after the algebraic comparison theorem.

**Checks.**

- For the disc, `t_X(∂[T])=−1` modulo `n`; equivalently the class `∂[T⁻¹]` has trace 1.
- The boundary restriction of any global annulus Kummer class has trace zero after applying `∂`, by reciprocity on both branches.
- For a disjoint union of two copies mapping finitely to `X`, trace is the sum of the two component traces.
- For a mixed-characteristic closed disc and `n=p`, the trace is onto but has nonzero kernel: the difference of point classes at 0 and 1 is nonzero by LRZ Lemma 5.5.21, pp. 60–61, while both have trace 1 by Corollary 5.5.18, p. 60.

The quotient relation is `im β`, not the subgroup of `n`-th powers already killed in each component. Do not equate the finite locally free algebra trace with this degree-two cohomological trace.

*Needs:* Section 9.3; Mathlib Submodule.liftQ; Mathlib `Submodule.liftQ_mkQ`; Mathlib `Submodule.mkQ_surjective`.

The boundary trace comparison uses the following two key results, independently of smooth analytic duality.

Prove `disc_complement_kummer`: for the standard inclusion `D¹_C→P¹,an_C` let `Z` be its closed pseudo-adic complement and put `B⁺=O_C[S]ʰ_(ϖ,S`), `B=B⁺[1/ϖ]`. Then `Pic(B)=0, B×=C×·(B⁺)×`, and `H⁰(Z,μ_n)=μ_n(C), H¹(Z,μ_n)=B×/(B×)ⁿ, Hⁱ(Z,μ_n)=0` for `i≥2`, for every `n>0` a unit in `C`. Supported localization consequently gives `0→B×/(B×)ⁿ→H²_c(D¹_C,μ_n)→H²(P¹,an_C,μ_n)→0`. This is an exact sequence, including when `n` is divisible by the residue characteristic; the first term need not vanish. (Li–Reinecke–Zavyalov, Notation 5.5.2, Propositions 5.5.3 and 5.5.10, Lemmas 5.5.4–5.5.6 and Corollaries 5.5.7–5.5.8, pp. 54–57.)

The algebraic input is `smooth_valuation_line_bundle_extension`: for a qc smooth `O_C`-scheme, or qc smooth admissible formal `O_C`-scheme, every line bundle on its generic fibre extends to the integral model. A finite-type integral lattice becomes `O_C`-flat after quotienting its `ϖ`-power torsion. On a smooth chart it is perfect: coherence and flat finite-presentation give pseudo-coherence, and smooth fibres of bounded dimension give a finite relative `Tor` bound. The determinant of this perfect lattice is the required extension and agrees with the original rank-one bundle on the generic fibre. The determinant-line construction and base change are the lower-tier contract of `PadicMeasuresIwasawaAlgebras`, Layer 5, “Determinant lines of perfect complexes”; use the formal descent supplied by `AdicSpacesPartIII`, layer R2. (Li–Reinecke–Zavyalov, Lemmas 4.5.1–4.5.2, p. 41; Stacks, tags 053E and 068X, More on Algebra, §§15.26 and 15.79.) Applying this at finite étale stages proves `Pic(B)=0`, since the henselian integral ring `B⁺` is local.

For the units assertion prove the scoped residue-section lemma: if `π∈O_C` is a pseudouniformizer and `O_C/(π)` has the residue-field characteristic, its map to `k_C` has a ring section. Lift a transcendence basis of `k_C` over its prime field, choosing compatible `p`-power roots in positive characteristic; lift the remaining separable algebraic extension by henselian ind-étale lifting. The quotient’`s` maximal ideal is locally nilpotent, so nonzero elements of the lifted field are units. Integral base change of henselization identifies `B⁺/(π)` with `O_C/(π)⊗_(k_C)k_C[S]ʰ_(S`), a free `O_C/(π)`-module. The ring `B⁺` is `ϖ`-adically separated: descend an element to a local étale stage and use its saturated, finitely generated intersection of the `ϖ`-powers and Nakayama. It follows that the minimum scalar needed to put a nonzero element of `B` in `B⁺` exists. Reduction to the domain `k_C[S]ʰ_(S`) makes this scalar norm multiplicative; normalizing an invertible element to norm one puts it and its inverse in `B⁺`. (Li–Reinecke–Zavyalov, Lemmas 5.5.4–5.5.6, pp. 55–56; Stacks, tag 0DYE, More on Algebra, §15.12.)

Restriction from `B` to the henselian exterior boundary field sends `(B⁺)×` to integral units and `C×` to degree zero. Thus the boundary pretrace kills the displayed kernel of extension to `P¹`. Both the boundary trace and algebraic trace are onto, so their ratio is a unit of `Z/n`. Prove `disc_point_boundary_class`: for `a∈O_C` the compactly supported divisor class of a is `∂[(T−a)⁻¹]`. The Kummer and support boundary square anticommutes; taking the inverse is essential. Secondary degree gives 1 on this class, and the algebraic divisor has degree 1, fixing the ratio to 1. (Li–Reinecke–Zavyalov, Lemma 5.5.11 and Corollary 5.5.12, pp. 57–58; Proposition 5.5.13, Lemma 5.5.14, Corollary 5.5.18 and Theorem 5.5.19, pp. 58–60.)

Prove `pointed_semistable_trace_comparison`: let `𝔛` be a connected rig-smooth proper semistable formal `O_C`-curve and `P` a nonempty finite set of closed points of its special fibre. Let `𝔘` be the complementary formal open. The boundary trace of `𝔘_η` equals its extension-by-zero map to `H²(𝔛_η,μ_n)` followed by algebraic trace. At a smooth marked point the boundary has one rank-two branch, and at a node it has two. On enlarging `P` the original boundary summands retain their maps to proper cohomology: apply the support triangles and the clopen decomposition of old boundary versus new deleted tubes. Consequently the comparison for a union of two marked sets is equivalent to comparison for both sets. Enlarge `P` to meet every component, apply the prescribed finite normalization of Section 8.2 to `P¹`. Its generic-fibre map is finite flat: on every connected component it is a nonconstant finite map of smooth curves, and a finite torsion-free module over a regular one-dimensional local ring is flat. Use finite-flat trace and norm compatibility to reduce to the disc calculation. For an arbitrary affinoid open in a proper smooth curve, a compatible semistable model and its disjoint complementary formal open reduce the comparison to this pointed theorem. (Li–Reinecke–Zavyalov, Definition 5.6.1 and Notation 5.6.5, p. 63; Lemma 5.6.6 and Corollary 5.6.8, pp. 64–65; Theorem 5.6.13 and proof of Theorem 5.4.2, pp. 65–66.)

The pointed-model interface extends `SemistableFormalCurveModel` from Section 8.2: provide finite nonempty marking, complementary formal open, enlargement, single- versus double-branch boundary decomposition, and compatibility of their support triangles under enlargement.

**Checks.**

- `A` projective line marked at infinity gives a closed disc and one exterior branch; this fixes the one-branch normalization.
- Marking a node gives two branches.
- Marking no points is excluded, since the generic fibre is then proper and has no boundary trace of this type.
- The marking is a finite set, so duplicate marks do not create duplicate boundary summands.

*Needs:* Sections 1.2, 2.3–2.5 and 8.2, the preceding Kummer classes and boundary norm calculation; `SchemeAndStackFoundations`, Layers 0 and 2, for flat finite-presentation, coherent extension, henselian and étale descent, and algebraic Artin vanishing; `PadicMeasuresIwasawaAlgebras`, Layer 5, for determinant lines. These arguments do not use Section 9.6 analytic duality.

Let `X` be a smooth affinoid curve over `Spa(C,O_C), n` invertible in `C`, and `j:X→X̄` an open immersion into the analytification of a smooth proper algebraic `C`-curve. Let `t_alg` be the scheme curve trace transported by proper algebraic–analytic comparison. Then `t_X = t_alg∘H²_c(tr_j(1)):H²_c(X,μ_n)→Z/n`. Consequently affinoid-curve boundary traces commute with étale maps wherever their source and target are smooth affinoid curves. For `n` invertible in `O_C` this identifies `t_X` with the inherited classical curve trace.

This uses Scheme traces and their open and finite-flat compatibilities are supplied by `EtaleCohomologyFoundations`, §§0.8–0.11.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Theorem 5.4.2 and Corollary 5.4.3, p. 53; Theorem 5.6.13 and final proof, pp. 65–66.)

Comparison is with the scheme cohomological trace, including its Tate twist. Different embeddings in proper curves give the same boundary trace. For the closed disc, the class of a classical point a is `∂[(T−a)⁻¹]`. The minus sign comes from the anticommuting square of Kummer and supported localization boundary maps. Secondary degree gives trace `+1` on this inverse, which fixes the comparison scalar to 1. For a pointed proper semistable formal `O_C`-curve, enlarging the finite set of deleted special-fibre points does not alter the comparison on the original boundary summands. After the enlarged set meets every component, prescribed finite flat normalization to the projective line reduces comparison to the disc. For an arbitrary affinoid inclusion in a proper curve, a compatible formal model and the disjoint complementary formal open reduce to this pointed case.

*Needs:* Section 9.3; Section 9.2; Section 8.6; `EtaleCohomologyFoundations`, §§0.7–0.11 (the trace for smooth curves); `EtaleCohomologyFoundations`, §§0.7–0.11 (the finite flat trace in relative dimension zero); `AdicSpacesPartIII`, layer R2.

### 9.4 Relative top degree and affine normalization

For a partially proper morphism `f` of rigid `K`-spaces of relative pure dimension `d` and any abelian `Λ=ℤ/n`-sheaf `F, R^if_`!`F=0` for `i>`2d. This is Zavyalov Lemma 5.3.2 (stated in §5, where `O_K` has mixed characteristic `(0, p)`; its Huber inputs carry no condition on `n`), whose proof cites Huber 5.3.11 and 1.8.7. It is the dimensional bound required by the trace’`s` top-degree Leray isomorphism, and is recorded separately from this roadmap’`s` more restricted relative-ball and general compactifiable-map bounds.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Lemma 5.3.2 and proof, p. 77 (`Λ = ℤ/nℤ` fixed at the start of §5.3).)

*Needs:* the supplier contracts; Section 8.3; `AdicEtaleGeometry`, layer A2 (`relative-dimension-rank-one-fibres`).

**Dimension of smooth morphisms, composites and the Berkovich realization.** Provide `AdicSpace.Smooth.finrank_eq_of_isPureRelDim`, `AdicSpace.Smooth.dimTr_eq_of_isPureRelDim`, `AdicSpace.Smooth.isPureRelDim_comp` and `StrictAnalyticSpace.u_smooth_isPureDim`. Let `f : X → Y` be a smooth morphism (`AdicSpacesPartII`, layer R0 (`smooth-morphism`)) of locally noetherian analytic adic spaces, of relative pure dimension `d` (`AdicEtaleGeometry`, layer A2 (`dimension-of-adic-spaces`)). (i) `Ω_{X/Y}` is locally free of rank `d`, and `dim.tr f = d` (Section 8.2) when `X` is nonempty; in every case `dim.tr f ≤ d`. (ii) If `g : Y → Z` is a smooth morphism of locally noetherian analytic adic spaces of relative pure dimension `e`, then `g ∘ f` is smooth of relative pure dimension `d + e`. (iii) If `K` is complete and nontrivially rank-one valued and `f` is a partially proper morphism of taut rigid `K`-spaces, then its realization `u(f)` (Section 3.1) is a smooth morphism of strict `K`-analytic spaces of pure dimension `d` in Berkovich's sense. For (i), an étale ball chart `U → B^n_Y` at `x`, with `n` the rank of `Ω_{X/Y}` at `x`, makes every nonempty fibre of `f|_U` pure of dimension `n` with completed transcendence dimension `n`, and the open part of the fibre through `x` forces `n = d`. For (ii), the charts of `f` and `g` compose to an étale map to `B^{d+e}_Z`. For (iii), the same charts realize as quasi-étale maps to the `d`-dimensional Berkovich polydisc, and partial properness removes the relative boundary.

This uses `X`, `Y`, `Z` locally noetherian and analytic; both maps smooth in (ii), since relative dimensions do not add along non-flat maps; `f` partially proper in (iii).

(Huber (1996), §1.6, Corollary 1.6.10, p. 80; §1.8, Corollary 1.8.7 and Example 1.8.9(i), pp. 94–95; Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, proof of Theorem 5.3.3, p. 78; Appendix A, Lemma A.8 and proof, pp. 85–86, and Corollary A.11, p. 86.)

**Checks.**

- For nonempty `Y`, the relative closed polydisc `B^d_Y → Y` has `Ω` free of rank `d` and `dim.tr = d`, and the composite `B^d_{B^e_Z} = B^{d+e}_Z → B^e_Z → Z` has relative pure dimension `d + e`.
- Smoothness cannot be dropped in (ii): the origin `Spa(K, K°) → B¹_K` has relative pure dimension `0` and `B¹_K → Spa(K, K°)` relative pure dimension `1`, while their composite, the identity of `Spa(K, K°)`, has relative pure dimension `0`, not `1`.
- For `d = 0`, a nonempty partially proper étale map has `dim.tr = 0` and realizes as an étale map of Berkovich spaces.
- Partial properness cannot be dropped in (iii): `B¹_K → Spa(K, O_K)` is smooth of relative pure dimension `1`, but its realization `M(K⟨T⟩) → M(K)` keeps the Gauss boundary and is quasi-smooth, not smooth; the open unit disc is partially proper and realizes as the open Berkovich disc, smooth of pure dimension `1`.
- The empty space has every relative pure dimension and `dim.tr = −∞`, so the equality in (i) needs `X` nonempty.

*Needs:* `AdicEtaleGeometry`, layer A2 (`smooth-local-ball-charts`); `AdicEtaleGeometry`, layer A2 (`relative-closed-polydisc`); `AdicEtaleGeometry`, layer A2 (`smooth-pure-relative-dimension`); `AdicEtaleGeometry`, layer A2 (`dimension-of-adic-spaces`); `AdicSpacesPartII`, layer R0 (`etale-smooth-composition`); Section 3.1; Section 8.2.

**Top-degree trace composition.** Provide `SmoothRelativeTrace.topDegreeComposition`. Let `K` be complete nontrivially rank-one valued and `Λ=ℤ/n` with `n>0` invertible in `K`. For smooth partially proper taut rigid `f:X→Y` and `g:Y→Z` of relative pure dimensions `d,e`, Leray and the 2d/2e bounds give a canonical isomorphism `R^{2(d+e)}(g∘f)_!Λ(d+e) ≅ R^{2e}g_!(R^{2d}f_!Λ(d))(e)`. For `α:R^{2d}f_!Λ(d)→Λ` and `β:R^{2e}g_!Λ(e)→Λ`, define `β⊙α` by this isomorphism followed by `R^{2e}g_!(α)(e)` and `β`. This specifies the meaning of trace compatibility with composition.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, §5.3, paragraph before Theorem 5.3.3, pp. 77–78; Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, §5.3, p. 78.)

**Checks.**

- If `f` is the identity in relative dimension zero, `β⊙`id`=β` under the Leray identification.
- For two composable split finite étale covers with summation traces `α,β, β⊙α` is the sum over the composite finite fibre, agreeing with iterated summation.
- For `P¹×P¹→P¹→Spa(C,O_C)`, the product of the two `c₁(O(1))` classes has iterated trace 1 for the normalized `P¹` traces, including `n=p` in mixed characteristic.

*Needs:* the relative 2d bound above; Section 8.3; Section 8.4; `DiamondsAndVStacks`, layer D0.

For a separated taut smooth `f:X→Y` of equidimension `d` between locally noetherian analytic adic spaces, and `n>0` invertible in `O_Y`, put `Λ=Z/n`. Then Rf!`Λ_X(d)[2d]` belongs to `D≤0(Y_ét,Λ)`. Every morphism from this complex to `Λ_Y` factors uniquely through `R²ᵈf`!`Λ_X(d)`. The source’`s` use of Huber 5.5.8 covers this constant-coefficient statement without requiring `n` to be invertible in `O_Y⁺`.

This uses `dim.tr f ≤ d`, with equality for nonempty `X`, from the smooth-dimension target of this section; A2 supplies the ball charts and relative pure dimension, and Section 8.2 the completed transcendence dimension.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Lemma 6.1.2, p. 67.)

For `d=0` this agrees with exact étale `f`!. For a residue-`p` disc, the top cohomology need not have rank one despite vanishing above degree two.

*Needs:* Section 8.3; `AdicEtaleGeometry`, layer A2 (`smooth-pure-relative-dimension`); `AdicEtaleGeometry`, layer A2; `EnhancedDerivedSheaves`, §§0.1–0.4 (the enhanced derived category).

For `f` as in smooth-constant-support-top-degree and a cover `X=⋃_i U_i` by taut open immersions, write `f_i=f|U_i` and `f_ii′=f|U_i∩U_i′`. The alternating sum of the two extension-by-zero maps gives an exact sequence `⊕_{i,i′}R²ᵈf_ii′`!`Λ(d)→⊕_i R²ᵈf_i`!`Λ(d)→R²ᵈf`!`Λ(d)→0`. Consequently trace maps `Rf_i`!`Λ(d)[2d]→Λ` that agree on overlaps descend to one unique trace on `X`. The result allows infinite covers.

This uses All restricted maps remain separated, taut, smooth and equidimensional `d`.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Lemma 6.1.3 and proof, pp. 67–68.)

One-member covers give the original trace. For a disjoint union the descended trace is the sum. The overlap arrow has the difference of its two faces; an unsigned sum would give the wrong quotient.

*Needs:* Section 9.4; Section 8.5; Layers 1 and 3; `EnhancedDerivedSheaves`, §§0.1–0.4 (presentability and the derived tensor product).

Let `Y` be locally noetherian analytic, `n>0` invertible in `O_Y`, and `Λ=Z/n`. The trace for `π:A¹,an_Y→Y` is the composite `Rπ`!`Λ(1)[2]→Rπ̄_*Λ(1)[2]→R²π̄_*Λ(1)≅Λ`, where `π̄:P¹,an_Y→Y` and the last map is the inverse of the first-Chern-class projective-bundle isomorphism. Define the trace for `Aᵈ,an_Y` by successive projections and the support composition comparison, with twists and shifts added. For `d=0` it is the identity. This trace is independent of a permutation of the affine coordinates and commutes with base-change transformations.

This uses Projective bundle geometry is imported from R3; its cohomological normalization is analytic-projective-line-chern-normalization; The model is the analytic affine space, not the closed polydisc.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Lemma 6.1.6 and formula (6.1.7), pp. 69–70; Remark 6.1.8, pp. 70–71.)

Provide `AffineSpaceTrace.projectiveLine`: For `d=1` the trace is restriction to `P¹` followed by the inverse Chern-class isomorphism in degree two; `AffineSpaceTrace.projection`: Successive projections compose the traces with the corresponding Tate twists and cohomological shifts; on the partially proper taut rigid domain their top-degree maps use `SmoothRelativeTrace.topDegreeComposition`; `AffineSpaceTrace.permutation`: Any permutation of affine coordinates leaves the trace unchanged; `AffineSpaceTrace.baseChange`: Pullback of the trace equals the trace on the pullback after the canonical support base-change transformation.

Provide `AffineSpaceTrace.algebraic`: Over `Spa(C,O_C)` it agrees with the scheme affine-space trace under algebraic–analytic support comparison.

**Checks.**

- Dimension zero gives the identity `Λ→Λ`.
- Under the supported algebraic comparison of Section 9.2 for `A¹_C`, the image of the scheme degree-one point class has trace 1 in `H²_c(A¹,an_C,Λ(1))`.
- Interchanging the two coordinates of `A²,an_C` preserves its trace.
- At residue-`p` coefficients the same permutation-triviality assertion for `H⁴_c(D²_C,μ_p⊗²)` is false; LRZ Remark 6.1.8 gives two distinct point classes.

Every base-change square commutes with its canonical support transformation; this need not be invertible.

*Needs:* Section 9.4; Section 9.3; Section 8.5; `AdicSpacesPartIII`, layer R3; Layers 2, 4–6; `EtaleCohomologyFoundations`, §§0.7–0.11 (the trace in smooth relative dimension `d` through elementary charts); Layers 1 and 3.

### 9.5 Smooth traces and coordinate independence

For a separated smooth strict Berkovich `f:Y→X` of pure dimension `d` with an étale factorization `Y→𝔸_Xᵈ→X, Tr_f=Tr_projection∘Tr_etale` is independent of the factorization. This is Berkovich Lemma 7.2.2, the key input making the general relative trace canonical. It uses the algebraic affine-space trace normalization and does not identify an adic closed ball with analytic affine space.

(Berkovich (1993), Lemma 7.2.2 and proof, pp. 132–133; Berkovich (1993), proof of Theorem 7.2.1, p. 132.)

*Needs:* `AdicSpacesPartII`, layer R1; Section 9.2; `EtaleCohomologyFoundations`, §§0.7–0.11 (the trace in smooth relative dimension `d` through elementary charts); `EtaleCohomologyFoundations`, §§0.7–0.11 (the finite flat trace).

For separated smooth `u(f):u(X)→u(Y)` of pure relative dimension `d` (Berkovich's smooth morphisms are boundaryless; separatedness is a hypothesis of Theorem 7.2.1 that must come from the separatedness of the partially proper `f`, since Zavyalov's Lemma `A`.8 and Corollary `A`.11 do not state it), import Berkovich 1993 Theorem 7.2.1’`s` trace `R^{2d}u(f)_!Λ(d)→Λ`, with geometric-fibre/base-change compatibility, top-degree composition, dimension-zero étale counit and surjectivity for nonempty fibres. Work with `n` invertible in `K` so the Tate twist is defined; in mixed characteristic `p, n=pʳ` is allowed here. The prime-to-residue hypothesis is imposed on Poincaré duality, not on this trace interface.

(Berkovich (1993), Theorem 7.2.1, pp. 131–132; Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, proof of Theorem 5.3.3, p. 78; Berkovich (1993), §7.2, first sentence, p. 130.)

*Needs:* Section 3.1; Section 9.4; Section 1.4; Section 9.5.

Let `K` be a complete nontrivially rank-one valued field, `n>0` invertible in `K` and `Λ=ℤ/n`. (Zavyalov §5 assumes `O_K` of mixed characteristic `(0, p)` and allows every `n`; Berkovich §7.2 needs only `n` prime to char `K` and Zavyalov's Appendix `A` holds for every complete rank-one `K`, so the construction applies verbatim.) For a smooth partially proper rigid `f:X→Y` of relative pure dimension `d`, define `t_f:R^{2d}f_!Λ_X(d)→Λ_Y` by `θ_Y^*` of the Berkovich trace on taut affinoid-base neighbourhoods, using `α_f`. These local sheaf morphisms glue by their compatible geometric maximal stalks. The map has geometric-maximal-fibre compatibility, `t_g⊙t_f=t_{g∘f}`, the étale counit normalization at `d=0`, and is surjective when every fibre is nonempty. This is Zavyalov Theorem 5.3.3; it constructs a trace without asserting `p`-torsion duality.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Theorem 5.3.3 and proof, p. 78.)

Provide `SmoothRelativeTrace`: The family `t_f:R^{2d}f_!Λ(d)→Λ` for smooth partially proper pure-dimensional `f`; `SmoothRelativeTrace.ofBerkovich`: Local trace obtained through `α_f` and `θ^*`; `SmoothRelativeTrace.maximalFiber`: Restriction to a geometric fibre over a maximal point is its trace; `SmoothRelativeTrace.comp`: `t_g⊙t_f=t_{g∘f}`, using `SmoothRelativeTrace.topDegreeComposition` of Section 9.4.

Provide `SmoothRelativeTrace.dimensionZero`: For `d=0` the map is the counit `(f_!,f^*)`; `SmoothRelativeTrace.surjective`: All nonempty fibres imply an epimorphism of sheaves; `SmoothRelativeTrace.restrict`: Trace commutes with restriction to the affinoid-base neighbourhoods used in its construction; `SmoothRelativeTrace.proper`: For proper `f`, use `f_`!`=f_*` to obtain `R^{2d}f_*Λ(d)→Λ`.

Provide `SmoothRelativeTrace.baseChange`: For a morphism `g : Y′ → Y` of taut rigid `K`-spaces with base change `f′ : X′ → Y′, t_{f′}` composed with the base-change map `g^*R^{2d}f_!Λ(d) → R^{2d}f′_!Λ(d)` equals `g^*t_f` (Berkovich 7.2.1(a); construction smooth-trace-rigid-base-change).

**Checks.**

- The trace of `id_X` in dimension zero is `id_Λ`.
- For a disjoint union of `r` copies of `Y→Y, t_f` is the sum `Λʳ→Λ`.
- The zero trace for an empty fibre is not surjective onto a nonzero coefficient sheaf.
- For two projections of smooth proper factors, the trace on their product is the iterated trace.
- For `C` complete algebraically closed and `f : P^{1,ad}_C → Spa(C, O_C), t_f : H²(P¹_C, μ_n) → ℤ/n` is the isomorphism induced by deg : `Pic(P¹) → ℤ` (Berkovich 6.2.1`(b)` and 7.2.1`(d)`), for every `n` invertible in `C`, including `n = pʳ` when char `C = 0` and the residue characteristic is p.
- If char `K = 0` and the residue characteristic is `p`, for the open unit disc `f : D → Spa(C, O_C)` and `n = p, t_f : H²_c(D, μ_p) → 𝔽_p` is surjective but not injective, since `H²_c(D, μ_p)` is infinite (Berkovich Remark 6.2.10): connected nonempty fibres give an isomorphism only for `n` invertible in `O_K`.

*Needs:* Section 9.5; Section 9.1; Section 3.2; Section 9.4.

For the trace `t_f` and a geometric point over a maximal `y∈Y`, the proper-support base-change identification carries its stalk to `t_{f_y}:H_c^{2d}(X_y,Λ(d))→Λ`. It is the maximal-geometric-fibre property in Zavyalov 5.3.3(1). This statement does not claim a base-change theorem for arbitrary higher-rank plus rings or arbitrary morphisms of bases.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Theorem 5.3.3(1), p. 78.)

*Needs:* Section 9.5; Section 9.4; Section 9.1.

The compatibility theorem `SmoothRelativeTrace.comp` uses exactly the composition operation `SmoothRelativeTrace.topDegreeComposition` of Section 9.4 for smooth partially proper taut rigid `f,g` of pure dimensions `d,e`. It asserts `t_g⊙t_f=t_{g∘f}`; this is a property of the normalized trace family of this section.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Theorem 5.3.3(2), p. 78.)

*Needs:* Section 9.5; Section 9.4; Section 3.2.

When `d=0`, smooth partially proper `f` is étale and `t_f:f_`!`Λ→Λ` is exactly the counit of `(f_!,f^*)`, via `f^*Λ=Λ`. In the proper case `f` is finite étale and this is the usual summation trace on finite geometric fibres.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Theorem 5.3.3(3), p. 78; proved by Lemma A.19, p. 88.)

*Needs:* Section 9.5; Section 9.1; Section 8.3; Section 1.2.

If all fibres of smooth partially proper `f` are nonempty, `t_f` is an epimorphism of `Λ`-sheaves. On each taut affinoid-base piece, surjectivity of `f` gives surjectivity `X_max→Y_max`, hence of `u(f)`, and the Berkovich trace is surjective. Exact `θ^*` and locality preserve this conclusion. Nonempty fibres are needed; connectedness is not required.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Theorem 5.3.3(4) and the last paragraph of its proof, p. 78.)

*Needs:* Section 9.5; Section 3.1; Section 3.2.

For `f:X→Y` smooth partially proper of relative pure dimension `d`, an arbitrary morphism `g:Y′→Y` of rigid `K`-spaces and the base change `f′:X′=X×_YY′→Y′`, with all four spaces taut, the smooth trace commutes with the canonical proper-support base-change map. The comparison `α_f` must be coherent with that square; that coherence is a supplier obligation. The statement covers rigid spaces over `Spa(K,O_K)`, retaining `n` invertible in `K`, and does not assert arbitrary-plus-ring base change.

(Berkovich (1993), §7.2, definition of compatibility with base change (pp. 130–131) and Theorem 7.2.1(a), p. 131.)

*Needs:* Section 9.5; Section 9.1; Section 3.1.

For smooth partially proper taut rigid `f` of pure relative dimension `d` and `n` invertible in `O_K`, if the geometric fibres over all maximal points of `Y` (base changes along `Spa(C, O_C) → Y`) are nonempty and connected, `t_f:R^{2d}f_!ℤ/n(d)→ℤ/n` is an isomorphism. This is the final assertion of Berkovich 7.2.1 transferred by `θ^*` and `α_f`. The stronger prime-to-residue condition is retained here; nonempty fibres alone give only surjectivity.

(Berkovich (1993), Theorem 7.2.1, final assertion (p. 132) and its proof (p. 133); Berkovich (1993), Remark 6.2.10, p. 118.)

*Needs:* Section 9.5; Section 9.1; Section 3.2.

`A` trace family on separated smooth morphisms of analytic spaces over all non-archimedean extensions of `K` (Berkovich's base change in 7.2.1(a) is along morphisms of analytic spaces over `k`, including ground-field extensions) is uniquely determined by base-change compatibility, top-degree composition, the dimension-zero étale trace, and the absolute algebraically closed curve trace. Consequently the adic trace obtained through the fixed `θ/α` comparison is independent of the local affinoid cover and any choice of normalized Berkovich family. This uses all four normalizations of Berkovich 7.2.1; it does not claim uniqueness from Guo–Reinecke’`s` three assumptions alone.

(Berkovich (1993), Theorem 7.2.1(a)–(d), pp. 131–132.)

*Needs:* Section 9.5; Section 9.2.

The smooth relative trace is compatible with the reduction maps `ℤ/p^{r+1}(d)→ℤ/pʳ(d)` when `char(K)=0`, and likewise with coefficient maps between finite constant torsion rings having invertible torsion in `K`. The trace squares commute through the natural support comparison and the coefficient-natural Berkovich trace. This finite-level fact is required before passing to a `ℤ_p` trace; it alone does not identify `R^{2d}f_*ℤ_p` with `lim_r R^{2d}f_*ℤ/pʳ`.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, proof of Theorem 5.5.2, p. 82 (the square comparing `t_{X,ℤ/p^nℤ} ⊗ 𝔽_p` with `t_{X,𝔽_p}` through `H^{2d}_ét(X, ℤ/p^nℤ(d)) ⊗ 𝔽_p ≅ H^{2d}_ét(X, 𝔽_p(d))`).)

*Needs:* Section 9.5; Section 9.1; Section 9.4.

For `f:X→Y` separated taut smooth of equidimension `d` and `n` invertible in `O_Y`, suppose `g₁,g₂:X→Aᵈ,an_Y` are étale `Y`-maps. The maps Rf!`Λ(d)[2d]→Rπ`!`Λ(d)[2d]→Λ` obtained from the two étale counits and AffineSpaceTrace are equal.

This uses Trace equality only requires the codomain `Λ` to be overconvergent; no overconvergence of `R²ᵈf`!`Λ` is assumed.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Lemmas 6.1.5 and 6.1.9–6.1.10, pp. 68, 71–73.)

The lower chart arrow uses the `g₂` counit, correcting the duplicated `g₁` label in the source diagram. No diamond smoothness or pre-existing exceptional right adjoint is used.

*Needs:* Section 9.4; Section 9.3; `AdicSpacesPartII`, layer R0 (`smooth-differentials-locally-free`); `AdicSpacesPartII`, layer R0; Layers 1 and 3.

Assign to every separated taut smooth `f:X→Y` of equidimension `d` between locally noetherian analytic adic spaces, `n>0` invertible in `O_Y` and `Λ=Z/n`, a trace `tr_f`:Rf!`Λ_X(d)[2d]→Λ_Y`. Choose étale smooth coordinate charts into `Aᵈ`,an, compose their étale counits with AffineSpaceTrace, and descend from a taut source cover. The resulting assignment is independent of all choices, compatible with compositions and pullback transformations, equals the étale counit in dimension zero, and has the scheme `P¹` normalization. These properties characterize the assignment. This expands the inherited rigid-base trace scope to arbitrary analytic bases and plus rings; it does not assert arbitrary-sheaf duality or that top trace is an isomorphism.

This uses `n` must be a unit in `O_Y`; it can fail to be a unit in `O_Y⁺`; Classical Rf! on the displayed shifted constant complex suffices; an exceptional right adjoint is not part of the construction.

(Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, Theorem 6.1.1 and its proof, pp. 66–74; Theorem 1.2.1, pp. 3–4.)

Provide `GeneralSmoothTrace.chart`: On an étale coordinate chart, trace is AffineSpaceTrace composed with the étale counit; `GeneralSmoothTrace.independent`: The trace does not depend on the charts or cover; any normalized compatible assignment has the same maps; `GeneralSmoothTrace.comp`: `tr_(g∘f)=tr_g∘`Rg!`(tr_f(e)[2e])` for smooth maps of dimensions `d` and `e`, using support composition and projection formula; on the partially proper taut rigid domain its top-degree form is `SmoothRelativeTrace.comp` with the operation of Section 9.4; `GeneralSmoothTrace.baseChange`: For a Cartesian pullback, `tr_f′∘`BC`=g*tr_f`. BC is not declared invertible unless its separate hypotheses hold.

Provide `GeneralSmoothTrace.etale`: For étale `f` the trace is the usual exact `f`!–`f*` counit; `GeneralSmoothTrace.projectiveLine`: For `P¹,an_C` over `Spa(C,O_C)`, the trace is the transported algebraic curve trace; `GeneralSmoothTrace.topDegree`: The trace factors uniquely through `R²ᵈf`!`Λ(d)`.

**Checks.**

- The trace for `id_Y` is `id_Λ`.
- For a split finite étale cover with `r` sheets, the trace sums the `r` components and its composite with the unit is multiplication by `r`.
- The analytified degree-one point class of `P¹_C` has trace 1.
- The trace is defined for the relative disc over `Spa(C,C⁺)` of `rank(C⁺)>1` and is compatible with the rank-one generic pullback.
- For the mixed-characteristic closed disc with `Λ=F_p`, the nonzero difference of the point classes at 0 and 1 lies in the kernel of its trace; trace existence therefore cannot give an isomorphism `H²_c≅F_p` (LRZ Corollary 5.5.18 and Lemma 5.5.21, pp. 60–61).

Affine-space normalization has its home in `AffineSpaceTrace` of Section 9.4. On the common smooth partially proper taut rigid domain, the top-degree map of `GeneralSmoothTrace` is `SmoothRelativeTrace`, by the same coordinate normalization and étale descent. The general derived trace retains its larger domain, including `Spa(C,C⁺)` for arbitrary open bounded valuation subrings. Residue-`p` coefficients on a nonproper disc do not satisfy full classical Poincaré duality merely because this trace exists.

*Needs:* Section 9.4; Section 9.5; Section 9.3; `AdicSpacesPartII`, layer R0; Section 1.2; `EnhancedDerivedSheaves`, §§0.1–0.4.

### 9.6 Effacement and duality at every valuation rank

Let `C` be complete algebraically closed nonarchimedean, `C⁺` an open bounded valuation subring, `S=Spa(C,C⁺)`, and `n>0` invertible in `C⁺`. For a separated taut smooth curve `f:X→S` with all geometric fibres nonempty and connected, the specialization maps of `R²f`!`μ_n` between geometric points of `S` are isomorphisms. Consequently its normalized trace `R²f`!`μ_n→(Z/n)_S` is an isomorphism, by the rank-one connected-curve trace theorem. This contract covers arbitrary curves, including positive-width annuli and curves without smooth-model tube presentations.

This uses Connectedness is required for every geometric fibre, rather than merely nonemptiness of `X`; The constancy and plus-ring scope are required inputs, not established by the public trace-existence theorem.

(Peter Scholze, Étale cohomology of diamonds, Theorem 24.1, proof, pp. 152–153.)

`A` positive-width annulus is covered by the contract; an argument restricted to tubes of smooth models does not pass. Nonempty disconnected fibres have componentwise trace and do not satisfy a rank-one top-trace isomorphism.

*Needs:* Section 9.2; Section 9.5; Section 9.3; Section 1.2.

For a smooth separated taut curve over a geometric field pair and `n` invertible in `C⁺`, the `d=1` fundamental lemma supplies étale neighborhoods whose lower proper-support maps vanish and whose derived support map factors through `Λ(−1)[−2]`. Apply the full local statement of Section 9.6, rather than replacing the higher-rank base by its maximal point. In the rank-one case this agrees with Berkovich’`s` curve effacement; iteration and the top-degree normalization supply the duality argument.

This uses The arbitrary-rank assertion uses Huber’`s` separated qc local neighborhoods; prime-to-residue coefficients are essential.

(Huber (1996), §7.4, Theorem 7.4.2, pp. 382–383; Berkovich (1993), §7.3, Fundamental Lemma 7.3.4 and Step 2, p. 138.)

For `Y` an open disc and `y` its centre, `g =` id works: `H¹_c(D, μ_n) = 0`.

*Needs:* Section 3.2; Section 8.5; Section 9.2; `EtaleCohomologyFoundations`, §§0.7–0.11 (the curve duality and effacement calculation of SGA 4 XVIII §1); `EtaleCohomologyFoundations`, §§0.7–0.11 (the effacement and local-acyclicity argument of SGA 4 XVIII §§1–2); `AdicSpacesPartII`, layer R1 (`scheme-fibre-product-analytification`).

Let `f:X→S` be smooth of pure relative dimension `d` between quasi-separated analytic pseudo-adic spaces, `ξ` a geometric point of `X`, and `n>0` prime to `char⁺(S)`. Find étale separated quasi-compact maps `V→S, U→X` and `W→U`, with `U=X×_S V`, a lift of `ξ` into `W`, and `λ:W→V` the composite through `φ:U→V`, such that the trace `R²ᵈλ`!`Λ→Λ(−d)` is an isomorphism and the map `Rᵖλ`!`Λ→Rᵖφ`!`Λ` is zero for every `p≠`2d. Moreover the derived map `Rλ`!`Λ→Rφ`!`Λ` factors through `Λ(−d)[−2d]` by the trace. Retain this as a statement in `D+` with the indicated trace factorization, not only as a degree-one effacement statement. It includes every rank of `C⁺` at a geometric field-pair base and every `d≥0`.

This uses `Λ=Z/n` and `n` is prime to every residue characteristic of `O⁺` on `S`. The local maps in the conclusion are separated and qc; no global algebraic compactification of `X` is assumed.

(Huber (1996), §7.4, Theorem 7.4.2, pp. 382–383; Lemmas 7.4.3–7.4.4, pp. 386–388.)

*Needs:* Section 9.2; Section 9.4; Section 9.3; `EnhancedDerivedSheaves`, §§0.1–0.4.

Notation: `C` an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p ≥ 1`; `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank; `S = Spa(C, C⁺)`, with closed point `s` and generic point `η = Spa(C, O_C)`; `n ≥ 1` an integer invertible in `C⁺` (hence prime to `p`); `μ_n` the étale sheaf of `n`-th roots of unity and `Λ(1) = Λ ⊗ μ_n`. Let `f : Y → S` be a smooth adic curve. For `G ∈ D⁻(Y_ét, ℤ/n)` and `F ∈ D⁺(S_ét, ℤ/n)` the duality morphism `Rf_* RHom(G, f^*F(1)[2]) → RHom(Rf_!G, F)`, obtained from the canonical map `Rf_* RHom(G, G') → RHom(Rf_!G, Rf_!G')` (for G' bounded below, via injective resolutions) with G' `= f^*F(1)[2]` and the trace `Rf_`!`(f^*F(1))`[2] `→ F` (Section 9.2), is an isomorphism in `D(S_ét, ℤ/n)`. Equivalently, for all `q ∈ ℤ, Hom_{D(Y_ét, ℤ/n)}(G, f^*F(1)[2+q]) ≅ Hom_{D(S_ét, ℤ/n)}(Rf_!G, F[q])` (morphisms in Mathlib's DerivedCategory; for sheaves `G` and `F` these are the groups of Mathlib's `Abelian.Ext`). The statement uses no right adjoint of `Rf_`!: consumers that construct `Rf^!` (DiamondSixOperations S4–S5) deduce from it, by the Yoneda lemma, that the transformation `f^*(1)[2] → Rf^!` adjoint to the trace is an isomorphism.

This uses The curve is smooth, separated and taut over `Spa(C,C⁺)`, with `C⁺` of any rank. Require `n` prime to `char⁺(Spa(C,C⁺))`; `G∈D−` and `F∈D+`. The internal-`Hom` comparison is bounded in this form; the global `Hom` adjunction admits arbitrary `G` by Huber 7.5.3.

(Huber (1996), §7.5, Theorem 7.5.3 and Corollary 7.5.5, pp. 390–396; Berkovich (1993), §7.3, Theorem 7.3.1, p. 135.)

`G = μ_n, F = ℤ/n` on `S = Spa(C, O_C), Y` connected: `H^q(Y, ℤ/n) ≅ H^{2−q}_c(Y, μ_n)^∨, e.g`. `H⁰(Y, ℤ/n) = ℤ/n` dual to `H²_c(Y, μ_n) ≅ ℤ/n`. `Y = B` the ball over `Spa(C, O_C)` and `G = j_`!`ℤ/n` for the open disc `j : D ⊆ B: Ext^q(j_!ℤ/n, μ_n[2]) = H^{q+2}(D, μ_n) ≅ Hom(H^{−q}_c(D, ℤ/n), ℤ/n)`. ECD condition (iii) at `X = Spa(C, O_C)` (only `U = X` occurs), in the `Rf^!`-free form proved here: for every `G ∈ D⁻(Y_ét, ℤ/n)`, composition with the trace gives `Hom(G, ℤ/n(1)[2]) ≅ Hom(Rf_!G, ℤ/n)`.

*Needs:* Section 9.2; Section 9.6; Section 8.4; Section 3.2; `AdicEtaleGeometry`, layer A1 (`geometric-point-etale-split`); Section 1.1; Section 1.4; Mathlib `CategoryTheory.Abelian.Ext`; Mathlib DerivedCategory.

Notation: `C` an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p ≥ 1`; `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank; `S = Spa(C, C⁺)`, with closed point `s` and generic point `η = Spa(C, O_C)`; `n ≥ 1` an integer invertible in `C⁺` (hence prime to `p`); `μ_n` the étale sheaf of `n`-th roots of unity and `Λ(1) = Λ ⊗ μ_n`. Let `f : Y → S` be a quasi-compact smooth adic curve, `j : U → S` a quasi-compact open (every quasi-compact open of `S` is `Spa(C, C⁺_U)` for a valuation ring `C⁺ ⊆ C⁺_U ⊆ O_C`, though not every such `Spa(C, C⁺_U)` is open), `f_U : Y_U → U` and j' : `Y_U → Y` the base changes. Then: (i) `Rf_`! `∘ j'_`! `≅ j_`! `∘ Rf_{U!}` canonically; (ii) under (i), `Tr_f ∘ Rf_`!`(j'_! f_U^*K(1))`[2] `= j_`!`(Tr_{f_U})` for `K ∈ D(U_ét, ℤ/n)`, using `j'_`! `f_U^* ≅ f^* j_`!; (iii) consequently the duality morphisms of Section 9.6 for `f` (with `G = j'_`!`G_U, F = j_`!`F_U`) and for `f_U` (with `G_U, F_U`) correspond under the adjunction isomorphisms `Hom(j'_!G_U, f^*j_!F_U(1)[2]) ≅ Hom(G_U, f_U^*F_U(1)[2])` and `Hom(Rf_!j'_!G_U, j_!F_U) ≅ Hom(Rf_{U!}G_U, F_U)`. This is the classical input of ECD Proposition 23.10(iii) for the ball over `Spa(C, C⁺)`: together with Poincaré duality for `f` and `f_U` it identifies `j'_`!`Rf_U^!(ℤ/n) → Rf^!j_`!`(ℤ/n)` with the base change isomorphism `j'_`!`f_U^*(1)[2] ≅ f^*j_`!(1)[2]; that final identification is carried out by the consumer.

This uses `f` quasi-compact smooth adic curve over `S = Spa(C, C⁺)`; `U ⊆ S` quasi-compact open; `n` prime to p.

(Scholze, Étale cohomology of diamonds, Proposition 23.10(iii), p. 145; Scholze, Étale cohomology of diamonds, Proposition 23.10(iii), pp. 145–146.)

For the ball `B_S` and `U = Spa(C, O_C)` the generic point (a quasi-compact open of `S` when `η` is open in `|S|, e.g`. `C⁺` of finite rank): `R²f_`!`(j'_!μ_n) ≅ j_`!`(ℤ/n)` and the trace is `j_`! of the rank-one trace. For `U = S` all statements are identities.

*Needs:* Section 8.3; Section 9.2; Section 8.4; Section 9.6; Section 1.2.

For a smooth proper zero-dimensional `X/K` with `r` geometric points, `H⁰(X_C,𝔽_ℓ)=𝔽_ℓʳ` and higher cohomology is zero. Cup product followed by the normalized trace pairs `(a_j),(b_j)` by `Σ_j a_jb_j`. This pairing is perfect, even when `ℓ` divides `r`; its perfectness is not the assertion that the trace of the constant unit is invertible.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Theorem 5.3.3(3), p. 78; Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, proof of Theorem 5.4.4, p. 79.)

*Needs:* Section 9.5; Section 1.3.

Let `S=Spa(C,C⁺), ℓ` invertible in `C⁺, Λ=F_ℓ, f:X→S` a separated taut smooth curve, `j:U→S` a quasi-compact open immersion, and `j′:X_U→X` its pullback. For every `G` in the unbounded `D(X_ét,Λ)`, the trace gives a natural equivalence of derived mapping complexes `RHom_X(G,j′!Λ(1)[2])≅RHom_S(Rf!G,j!Λ)`. The equivalence respects localization, the projection formula and the support exchange `j`!`Rf_U`!`≅`Rf!`j′`!. It applies in particular to the relative ball used by ECD 24.1. `A` consumer that has independently constructed exceptional right adjoints can identify the corresponding open-extension mate by Yoneda; no such adjoint is used to prove this classical equivalence.

This uses Use the higher-rank curve duality of this section, proved from Huber Theorem 7.5.3, together with the finite amplitude and enhancement in Sections 8.4–8.5; The assertion is for all `G`; restricting `G` to `j′`!`G_U` would not supply Proposition 23.10(iii).

(Peter Scholze, Étale cohomology of diamonds, Proposition 23.10(iii) and proof, pp. 145–146; Theorem 24.1 and proof, pp. 152–153.)

Include a test object whose support meets the complement of `X_U`; the theorem must still be stated for it. For `U=S` this is ordinary unbounded curve duality with constant coefficients. For `U` empty both target coefficients vanish and both derived mapping complexes are zero.

*Needs:* Section 9.6; Section 8.5; Section 8.4; `EnhancedDerivedSheaves`, §§0.1–0.4 (the enhanced derived category); `EnhancedDerivedSheaves`, §§0.1–0.4 (presentability and the derived tensor product).

Notation: `C` an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p ≥ 1`; `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank; `S = Spa(C, C⁺)`, with closed point `s` and generic point `η = Spa(C, O_C)`; `n ≥ 1` an integer invertible in `C⁺` (hence prime to `p`); `μ_n` the étale sheaf of `n`-th roots of unity and `Λ(1) = Λ ⊗ μ_n`. Let `f : X → S` be a smooth adic curve that is quasi-compact or proper over `S`, and `F` a locally constant constructible sheaf of `ℤ/n`-modules on `X`. Then `H^q(X, F)` is finite for all `q` and vanishes for `q > 2`; if `C⁺ = O_C` then `H^q_c(X/S, F)` is finite for all `q` and vanishes outside [0, 2]. For affinoid `X, H^q(X, F) = 0` for `q ≥ 2`. For arbitrary `C⁺, H^q(X, F) ≅ H^q(X_η, F|_{X_η})`.

This uses `X` quasi-compact or proper over `S`; `F` locally constant constructible, torsion prime to p.

(Berkovich (1993), Theorem 6.4.1, p. 125; Berkovich (1993), Corollary 7.4.4, p. 143; Bogdan Zavyalov, Some foundational results in adic geometry, Lemma 10.3, p. 31; D. Hansen, Vanishing and comparison theorems in rigid analytic geometry, §1, p. 2.)

The closed disc: `H⁰ = ℤ/n, H^q = 0` for `q > 0`; `H^q_c = 0` for `q ≠ 2` and `H²_c(B, μ_n) = ℤ/n`. A proper curve of genus `g` over `Spa(C, C⁺): H¹(X, ℤ/n) ≅ (ℤ/n)^{2g}` for every `C⁺`.

*Needs:* Section 3.2; Section 9.6; Section 8.4; `DiamondsAndVStacks`, layer D0, Section D0.19; Section 1.4; Section 9.2.

Notation: `C` an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p ≥ 1`; `C⁺ ⊆ C` an open and bounded valuation subring of arbitrary rank; `S = Spa(C, C⁺)`, with closed point `s` and generic point `η = Spa(C, O_C)`; `n ≥ 1` an integer invertible in `C⁺` (hence prime to `p`); `μ_n` the étale sheaf of `n`-th roots of unity and `Λ(1) = Λ ⊗ μ_n`. Assume `C⁺=O_C`. Let `X` be a smooth adic curve over `S` and `F` a locally constant constructible sheaf of `ℤ/n`-modules with dual `F^∨ = Hom(F, ℤ/n)`. The pairing `H^q_c(X, F) × H^{2−q}(X, F^∨(1)) → H²_c(X, μ_n) →^{Tr} ℤ/n` is nondegenerate: it induces an isomorphism `H^{2−q}(X, F^∨(1)) ≅ Hom(H^q_c(X, F), ℤ/n)` for all `q`, and, when `X` is quasi-compact or proper (all groups finite, Section 9.6), also `H^q_c(X, F) ≅ Hom(H^{2−q}(X, F^∨(1)), ℤ/n)`. In derived form `RΓ(X, F^∨(1)) ≅ RHom(RΓ_c(X, F), ℤ/n)[−2]` and, for finite groups, the biduality `RΓ_c(X, F) ≅ RHom(RΓ(X, F^∨(1)), ℤ/n)[−2]`; this is the passage between a complex and its dual. For `X = W^ad` with `W` smooth projective over `C` the pairing is the algebraic one under Section 9.2.

This numerical pairing uses `C⁺=O_C`; over the full higher-rank base use the relative derived-`Hom` equivalence above. `F` is finite locally constant and `n` is invertible in `O_C`. Finite perfect pairings require the finiteness theorem in addition to the `Hom` duality. `Z/n` is self-injective.

(Huber (1996), §7.5, Corollary 7.5.6, pp. 396–397; Berkovich (1993), §7.4, Theorem 7.4.3, p. 143.)

`X` proper of genus `g, F = ℤ/n: H¹(X, ℤ/n) × H¹(X, μ_n) → ℤ/n` is perfect, groups `(ℤ/n)^{2g}`. `X = D` the open disc: `H²_c(D, ℤ/n) = ℤ/n(−1)` is dual to `H⁰(D, μ_n) = μ_n`, and `H^q_c(D) = 0` for `q ≠ 2` matches `H^q(D, μ_n) = 0` for `q ≠ 0`.

*Needs:* Section 9.6; Section 9.2; `EtaleCohomologyFoundations`, §§0.7–0.11 (curve duality from the Jacobian and Kummer inputs); Section 1.4.

Let `S=Spa(C,O_C), ℓ` invertible in `O_C, Λ=F_ℓ`, and `f:X→S` a quasi-compact separated taut smooth curve. For a finite-rank `Λ`-local system `L`, the trace pairing `Hⁱ_c(X/S,L)×H²⁻ⁱ(X,L∨(1))→Λ` is perfect, and both groups are finite-dimensional; they vanish outside degrees 0 through 2. Equivalently `RΓ_c(X/S,L)` and `RΓ(X,L∨(1))[2]` are finite complexes dual to each other. The pairing is the rank-one specialization of the relative derived duality above. Non-quasi-compact curves are not included in the finite-dimensionality assertion.

Here `Λ` is a field, so finite local systems are locally finite free and the ordinary linear dual computes their derived dual. The one-point base is essential to pass from relative sheaf duality to `Λ`-linear duality of global cohomology groups.

(Bogdan Zavyalov, Some foundational results in adic geometry, Lemma 10.3, pp. 31–32; Peter Scholze, Étale cohomology of diamonds, Theorem 24.1, proof, pp. 152–153, citing Huber 7.5.3.)

For a rank-two base `S` with open generic point `η`, let `X` be the closed disc over `η`, viewed over `S`, and take `Λ≠0`. Then Rf!`Λ=j`!`Λ(−1)[−2]`, hence `RΓ(S,Rf!Λ)=0`, while `H⁰(X,Λ)=Λ`. This excludes the numerical pairing over the full higher-rank base; the relative duality with `RHom_S(j!Λ,Λ)` still holds. For a connected proper curve this specializes to the usual degree-reversed perfect pairing. An infinite disjoint union of discs is excluded from this finite-dimensional conclusion. Residue-`p` coefficients on nonproper discs are excluded by `ℓ` invertible in `C⁺`.

*Needs:* Section 9.6; Layers 1 and 3; `EnhancedDerivedSheaves`, §§0.1–0.4 (presentability and the derived tensor product); Section 1.2.

### 9.7 Proper pairings and integral traces

For smooth proper rigid `X/K` of pure dimension `d, n` invertible in `K` and a completed algebraic closure `C`, the proper field-fibre specialization of `SmoothRelativeTrace` in Section 9.5 yields (as in Zavyalov §5.4 for `𝔽_p` in mixed characteristic) a `G_K`-equivariant map `t_X:H^{2d}_et(X_C,ℤ/n(d))→ℤ/n`. It is compatible with finite coefficient reduction and with composition of smooth proper maps. The field-point stalk comparison transports the continuous Galois action; equivariance is part of the sheaf morphism on `Spa(K,O_K)`.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, §5.4, first paragraph, and Remark 5.4.1, p. 78.)

*Needs:* Section 9.5; Section 1.3; `AdicEtaleGeometry`, layer A1 (`finite-etale-galois-category`).

Let `h:Z→W` be separated smooth strict Berkovich of pure dimension `d` and `n` invertible in `O_K`. For `G∈D⁻(Z_et,ℤ/n)` and `F∈D⁺(W_et,ℤ/n)`, the trace-induced map `Rh_*RHom(G,h^*F(d)[2d])→RHom(Rh_!G,F)` is an isomorphism. This is the precise imported Berkovich 7.3.1 input. It is not asserted here for every arbitrary non-overconvergent adic `G`; each adic application below states the properness/local-coefficient hypotheses enabling transport.

(Berkovich (1993), §7.3, duality morphism and Theorem 7.3.1, p. 135; Berkovich (1993), Theorem 7.3.1, p. 135.)

*Needs:* Section 3.1; Section 9.5; `DiamondsAndVStacks`, layer D0.

For an algebraically closed complete rank-one field `C`, a proper smooth rigid `X/C` and a finite locally constant `ℤ/n`-sheaf `L` with `n` invertible in `O_C`, every `H^i_et(X,L)` is finite. This is the adic proper transport of Berkovich 7.4.4, extending the existing curve finiteness construction to arbitrary dimension. For `𝔽_ℓ`-coefficients these finite groups are finite-dimensional vector spaces, as required by the perfect-pairing formulation.

(Berkovich (1993), Corollary 7.4.4, p. 143.)

*Needs:* Section 9.7; Section 9.1; Section 3.2; Section 1.4.

Let `X` be a smooth proper rigid `K`-space of pure dimension `d, C` a completed algebraic closure and `ℓ` a prime invertible in `O_K`. For every `i≥0` the pairing `H^i_et(X_C,𝔽_ℓ)⊗ H^{2d−i}_et(X_C,𝔽_ℓ(d)) → H^{2d}_et(X_C,𝔽_ℓ(d)) → 𝔽_ℓ` is perfect and `G_K`-equivariant, with the second map the normalized trace above. The theorem is Zavyalov 1.1.3, citing Huber 7.5.3/Berkovich 7.3.1. In mixed characteristic `p` it requires `ℓ≠p`; the `p`-torsion duality of Zavyalov §5.4 is an external theorem on another roadmap.

(Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Theorem 1.1.3, p. 3; Berkovich (1993), Theorem 7.3.1, p. 135; Berkovich (1993), §7.3, after Theorem 7.3.1, p. 135.)

All `i` and arbitrary dimension `d` are included. The hypothesis is `ℓ` invertible in `O_K`, not merely invertible in `K`. The pairing uses the same trace fixed by the composition and counit normalization.

*Needs:* Section 9.7; Section 9.1; Section 3.2; `DiamondsAndVStacks`, layer D0.

For smooth separated taut curves and `n` invertible in `O⁺`, the smooth trace of Section 9.5 agrees with the point-normalized curve trace, including over any-rank geometric field pairs. On the maximal-point fibre over `Spa(C,O_C)`, its Berkovich transport is Berkovich’`s` trace. The identification follows from point normalization, local coordinate independence and étale descent, so it fixes the Tate twist and sign in every dimension-one duality specialization.

This uses The comparison with Berkovich spaces uses the maximal-plus fibre; equality of the two adic traces uses their common prime-to-`O⁺` coefficient range.

(Huber (1996), §7.3, Theorem 7.3.4(iv), pp. 379–380; Berkovich (1993), §7.2, Theorem 7.2.1(d), p. 132.)

On `P¹` the comparison sends `c₁(O(1))` to `+1`. On a split disjoint union of two curves it gives the sum of the two traces.

*Needs:* Section 9.5; Section 9.7; Section 9.2; Section 9.6; Section 9.1.

For smooth proper taut rigid `f:X→Y` of pure relative dimension `d, n` invertible in `O_K` and a finite locally free `ℤ/n`-sheaf `F` on `Y`, the normalized trace induces `Rf_*f^*F ≅ RHom_Y(Rf_*ℤ/n,F(−d)[−2d])`. This is the proper adic transport of Berkovich 7.4.1; both direct images are proper-support images and `F`’`s` finite local freeness allows internal `Hom` to be transported through `θ`. Generic derived tensor/`Hom` coherence is imported from D0 and `EnhancedDerivedSheaves`, §§0.1–0.4.

(Berkovich (1993), Theorem 7.4.1 and proof, p. 143; Berkovich (1993), §7.4, first sentence, p. 143.)

*Needs:* Section 9.7; Section 9.1; Section 3.2; Section 9.5; `DiamondsAndVStacks`, layer D0; `EnhancedDerivedSheaves`, §§0.1–0.4.

For smooth proper rigid `X/K` of pure dimension `d, ℓ` invertible in `O_K` and a finite locally constant `𝔽_ℓ`-sheaf `L` on `X_C`, let `L∨=Hom(L,𝔽_ℓ)`. The trace and evaluation cup product give perfect pairings `Hⁱ(X_C,L)⊗H^{2d−i}(X_C,L∨(d))→𝔽_ℓ` for all `i`. If `L` descends to `X`, the pairing is `G_K`-equivariant. This generalizes the constant-coefficient target using Berkovich 7.4.3; local freeness over the field ensures the dual is the actual finite local system.

(Berkovich (1993), Theorem 7.4.3 (k algebraically closed, X separated smooth of pure dimension d), p. 143.)

*Needs:* Section 9.7; Section 9.1; Section 1.4; `DiamondsAndVStacks`, layer D0.

Let `f:X→Y` be smooth proper taut rigid of pure relative dimension `d, ℓ` invertible in `O_K`, and `L` a finite locally constant `𝔽_ℓ`-sheaf. If every `R^if_*L∨` is finite locally constant, the trace pairing gives canonical isomorphisms `R^qf_*L ≅ (R^{2d−q}f_*L∨)∨(−d)`. This is the proper adic instance of Berkovich 7.4.9, which holds for separated smooth `φ` with `R^qφ_*F ≅ (R^{2d−q}φ_!F^∨)^∨(−d)` and `ℤ/n`-coefficients; properness (so that `α_f` transports `R^qf_*`) and `𝔽_ℓ`-coefficients are restrictions made here. The local-constancy hypothesis is retained. The finite-coefficient `Ext` calculation is proved locally: a finite locally constant `F_ℓ`-sheaf is locally a finite free module, so its internal `Hom` functor is a finite direct sum and is exact. Internal `Ext` vanishes in positive degree. The resulting degeneration of the internal-`Hom` spectral sequence gives the displayed cohomology-sheaf formula.

(Berkovich (1993), Theorem 7.4.9 and proof, pp. 145–146.)

For `d=0` and a split finite étale map, the formula identifies the dual of a finite direct sum with the sum of the duals. In relative dimension one it pairs degrees 0 with 2 and degree 1 with itself, with twist `−1`. `A` general constructible sheaf cannot replace the locally constant sheaf in this `Ext` calculation.

*Needs:* Section 9.7; Section 9.1; `DiamondsAndVStacks`, layer D0; `EnhancedDerivedSheaves`, §§0.1–0.4.

Let `f:𝔛→𝔜` be smooth proper of constant relative dimension `d` between smooth formal `O_K`-schemes, with `K` complete of mixed characteristic `(0,p)`, and write `f_η` for the analytic generic-fibre map. Construct `IntegralSmoothProperTrace` on the pro-étale site as the degree-zero map of the derived trace `Rf_{η,*}Ẑ_p(d)[2d]→Ẑ_p`. Use the proper generic-fibre specialization of `GeneralSmoothTrace` from Section 9.5 at each finite level; on its rigid domain this is `SmoothRelativeTrace`. Identify `Rf_{η,*}Ẑ_p(d)` with `Rlim_r ν*Rf_{η,ét,*}Z/pʳ(d)`, and take their derived inverse limit. Taking `H⁰` gives `t_f:R^{2d}f_{η,*}Ẑ_p(d)→Ẑ_p`. Equivalently this is the canonical top-degree edge map to `lim_r ν*R^{2d}f_{η,ét,*}Z/pʳ(d)`, followed by the limit traces; the edge map need not be declared an isomorphism in a family. Prove compatibility with finite-level projections and derived coefficient reduction, composition and the finite étale counit in dimension zero. If every geometric fibre is nonempty, prove `t_f` is an epimorphism using compatible local cycle classes, rather than inverse limits of unrelated surjections. For the Guo–Reinecke application restrict `K` further to a complete discretely valued field with perfect residue field.

This uses The integral sheaf is `Ẑ_p=lim_r ν*Z/pʳ` on the pro-étale site, and derived operations use the enhanced category. Formal schemes are smooth and the morphism proper, smooth and equidimensional. Nonempty fibres are required only for epimorphy.

(Haoyang Guo, Emanuel Reinecke, A prismatic approach to crystalline local systems, Remark 7.17, p. 114; Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, §5.5, Lemma 5.5.1 and Definition 5.5.3, pp. 81–82; Haoyang Guo, Emanuel Reinecke, A prismatic approach to crystalline local systems, Theorem 7.16, p. 114; Haoyang Guo, Emanuel Reinecke, A prismatic approach to crystalline local systems, §1, conventions, p. 30; Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry, §6.2, Lemma 6.2.2, pp. 74–75; §6.4, Lemma 6.4.5, p. 83.)

Provide `IntegralSmoothProperTrace`: The `ℤ_p`-linear trace family on smooth proper formal generic fibres; `IntegralSmoothProperTrace.modPow`: Derived reduction of the integral trace complex by `pʳ` recovers the normalized finite-level trace complex, and the finite-level projections commute with the top-degree edge map. `A` quotient isomorphism for the relative top cohomology sheaf requires a further amplitude assertion and is not part of this interface; `IntegralSmoothProperTrace.comp`: The integral trace family is compatible with composition by derived inverse limit of `GeneralSmoothTrace.comp` on these proper generic fibres; `IntegralSmoothProperTrace.dimensionZero`: For `d=0` the trace is the finite étale adjunction counit.

Provide `IntegralSmoothProperTrace.surjective`: For nonempty geometric fibres the trace is an epimorphism of pro-étale `Z_p`-sheaves, witnessed locally by compatible section cycle classes; `IntegralSmoothProperTrace.guoReineckeInput`: Packages exactly assumptions (a)–`(c)` of Guo–Reinecke Theorem 7.16.

**Checks.**

- The split finite étale trace is the sum `ℤ_pʳ→ℤ_p`.
- Reducing that sum modulo `pⁿ` gives the finite-level counit sum.
- The empty proper smooth fibre supplies the zero map and fails the nonempty-fibre surjectivity hypothesis.
- For `f : P¹_𝒴 → 𝒴` (relative dimension 1, `f_*O = O`), `t_{f_η} : R²f_{η,*}Ẑ_p(1) → Ẑ_p` is an isomorphism sending `c₁(O(1))` to 1; its reduction modulo `pʳ` is the degree isomorphism of `smoothTrace_projectiveLine`.

The finite étale–pro-étale exchange is Section 1.3. The lisse-tower derived-limit theorem there identifies `Rlim_r ν*Z/pʳ(d)` with `Ẑ_p(d)`; applying Rf* gives the relative derived-limit identification needed for the construction. At finite level the amplitude bound in Section 8.4 gives the canonical derived trace from the top-cohomology trace, compatibly with coefficient reduction. The coherent derived inverse limit therefore defines the integral trace. Its projections recover every finite-level trace, and its derived quotient recovers the finite-level complexes and maps. No relative ordinary-cohomology inverse-limit isomorphism, or quotient formula for the top cohomology sheaf, is used. For epimorphy, prove `IntegralSmoothProperTrace.localSectionClasses`: a smooth proper surjection admits local quasi-sections on an étale cover of the base. Choose a finite separable closed point of each smooth fibre, use an étale coordinate presentation and the implicit-function lifting property to spread it after étale localization, and include the full valued-field pair in that localization. For the stated formal scope, equivalently choose a separable closed point of the smooth special fibre, lift its finite étale residue extension over a formal étale neighborhood, and use formal smoothness and henselian lifting to obtain the section; its generic fibre retains all specializations. The section is lci of codimension `d`, and its compatible analytic cycle classes define maps `ν*Z/pʳ→ν*Rf_{η,ét,*}Z/pʳ(d)[2d]`. Smooth trace composed with that class is the identity, so derived inverse limit gives a local section of the integral trace. Thus every local `Z_p`-section lifts compatibly. The normalization of a section is Li–Reinecke–Zavyalov Lemma 6.2.2, pp. 74–75, or Lemma 6.4.5, p. 83. If the finite-level absolute cohomology groups are finite, their inverse systems satisfy Mittag–Leffler, so the Milnor sequence identifies `H^q(X,Ẑ_p)` with `lim_r H^q(X,Z/pʳ)`. This conditional strengthening is not needed to construct the relative trace. Zavyalov Lemma 5.5.1, pp. 81–82, applies it in the proper smooth absolute setting after the requisite finiteness theorem.

*Needs:* Section 1.3; Section 8.4; Section 9.5; `EnhancedDerivedSheaves`, §§0.1–0.4.

The specialization `IntegralSmoothProperTrace.guoReineckeInput` of the integral trace family above supplies a collection `tr^et` of `Ẑ_p`-linear maps `R^{2n}f_{η,*}Ẑ_p(n) → Ẑ_p` satisfying Guo–Reinecke 7.16(a)–`(c)` (`K` complete discretely valued with perfect residue field), and agrees with the classical family specified in Remark 7.17 after finite-level reduction. The downstream prismatic theorem may consume these hypotheses to construct its own Frobenius-equivariant trace; no prismatic pairing or mod-`p` analytic duality is asserted by this export.

(Haoyang Guo, Emanuel Reinecke, A prismatic approach to crystalline local systems, Theorem 7.16(a)–(c) and Remark 7.17, p. 114.)

*Needs:* Section 9.7.

### Examples

On `P¹,an_C` the Kummer Chern class `c₁(O(1))` has trace 1. At the exterior boundary of the closed coordinate disc, secondary degree gives #`(v(T))=−1`. The disc point class at a is `∂[(T−a)⁻¹]`, so its trace is `+1`. In mixed characteristic with `n=p`, the point classes at `a=0` and `a=1` are distinct but both have trace 1; hence their nonzero difference lies in the trace kernel. The broader smooth trace does not provide residue-`p` duality for a closed disc. (Li–Reinecke–Zavyalov, Warning 2.2.9, pp. 11–12; Proposition 3.2.2, p. 23; Lemma 5.5.14, Corollary 5.5.18 and Lemma 5.5.21, pp. 58–61.)

For a finite set of `r` geometric points, the dimension-zero duality pairing on `Λʳ` is `(a,b)↦Σ_(i=1)ʳ a_i b_i`. Its basis vectors satisfy `⟨e_i,e_j⟩=δ_ij`, including over `Z`/4, so perfectness does not require coefficients to be a field. For a smooth proper family the integral trace is constructed through the compatible derived inverse system `Z/pʳ`; the absolute passage to ordinary inverse limits additionally uses finite cohomology and Mittag–Leffler. An arbitrary inverse system with nonzero `R¹lim` cannot be substituted. (Huber (1996), Corollaries 7.5.5 and 7.5.7, pp. 396–397; Zavyalov, *`Mod`-`p` Poincaré duality*, Lemma 5.5.1, pp. 81–82; Guo–Reinecke, Remark 7.17, p. 114.)

### Dependencies

Use Layers 1–8. The overconvergent comparison and all-rank geometric fibres precede curve trace. Sections 9.2–9.3 build the field-pair lifting, boundary Kummer, reciprocity, localized cycle classes and algebraic normalization needed for smooth trace; Sections 9.4–9.5 then prove coordinate-independent trace, and Sections 9.6–9.7 prove prime-to-residue duality and integral proper traces. `EtaleCohomologyFoundations`, §§0.7–0.11, supplies scheme traces and cycle classes; `AdicSpacesPartII`, layers R0–R1, and `AdicSpacesPartIII`, layers R2–R3, supplies lci and projective geometry; `PadicMeasuresIwasawaAlgebras`, Layer 5, supplies determinant lines for integral line-bundle extension. `EnhancedDerivedSheaves`, §§0.1–0.4, supplies internal `Hom` and derived inverse limits. Boundary residues with `O_C` as plus ring are not substituted for arbitrary-rank fibres.

## Layer 10: Radial cohomology and smooth families

### 10.1 Closed radial regions

For a commutative ring `A` with a topology, a subring `A⁺`, a coordinate `T ∈ A` and a radius representative `b ∈ A, closedDisc(A⁺,T,b)` is the set of points `v` of the pinned `Spa(A,A⁺)` (continuous valuations with `v ≤ 1` on `A⁺`) such that `T ≤ᵥ b`. For a unit `b` it is the pinned rational subset `R({T}/b)`, hence relatively open in `Spa(A,A⁺)`, and it is unchanged when `T` and `b` are multiplied by the same unit. For `A = C⟨T⟩` over a complete nontrivially valued field `C` and `b = ϖ_b ∈ C^×` with `|ϖ_b|≤1` it is the underlying set of the closed disc of radius `|ϖ_b|` (Ito's `B(ε)`, Berkovich's `E(0,r)` on rank-one points), an affinoid open subspace supplied by AdicEtaleGeometry A2. For arbitrary radii choose the ambient disc `Spa(C⟨T/c⟩)` with `c∈C^×` and `|c|≥|ϖ_b|`. The valuative comparison is taken at every rank: a weak inequality gives an open subset of the adic space, whereas a strict inequality gives a closed constructible subset (Ito, p. 37), so the words closed and open of radial terminology are not adic-topological.

This uses `A` commutative ring with a topology and an explicit plus subring `A⁺` for the set-level construction (the pinned spa asks for nothing more); sheafiness, completeness and the Huber hypotheses belong to AdicSpacesPartII R0; For analytic discs and annuli: `C` complete nontrivially valued, radius representatives a, `b ∈ C^×` with `|a| ≤ |b|`.

(Kazuhiro Ito, Uniform local constancy of étale cohomology of rigid analytic varieties, §6.2, p. 35 (after Remark 6.9); Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Remarks 6.3.4 (ii), p. 121.)

Provide `Radial.mem_closedDisc`: `x` belongs iff `x∈Spa(A,A⁺)` and `T≤`ᵥb; `Radial.closedDisc_eq_rational`: For a unit `b`, closedDisc equals the pinned `rationalSubset(A⁺,{T},b)`; `Radial.comap_preimage_closedDisc_inter_spa`: For a continuous ring map `φ:A→B` with `φ(A⁺) ⊆ B⁺, comap(φ)⁻¹(closedDisc(A⁺,T,b))∩Spa(B,B⁺)=closedDisc(B⁺,φ(T),φ(b))`, the disc analogue of Tau Ceti's `comap_preimage_rationalSubset_inter_spa`; the intersection specifies the domain `Spa`; `Radial.closedDisc_subset_spa`: `closedDisc(A⁺,T,b) ⊆ Spa(A,A⁺)`.

Provide `Radial.closedDisc_mono`: If `b ≤ᵥ b′` at every point of `Spa(A,A⁺)`, then `closedDisc(A⁺,T,b) ⊆ closedDisc(A⁺,T,b′)`; these are the actual inclusions of concentric discs; `Radial.closedDisc_mul_unit`: For a unit `u, closedDisc(A⁺,Tu,bu) = closedDisc(A⁺,T,b)`: rescaling the coordinate and the radius together; `Radial.isOpen_closedDisc`: For a unit `b` the preimage of `closedDisc(A⁺,T,b)` in the subspace `Spa(A,A⁺)` is open (pinned openness of rational subsets).

**Checks.**

- For `v∈Spa(A,A⁺)` and unit `b, v∈closedDisc(A⁺,0,b)`.
- `closedDisc(A⁺,T,1)` equals `rationalSubset(A⁺,{T},1)`.
- In `C⟨T⟩`, radius `|ϖ|⁻¹>1` still cuts out only the unit disc; `C⟨T/c⟩` with `c=ϖ⁻¹` includes the classical point `T=ϖ⁻¹`.
- For the pinned classicalPoint at a power-bounded tuple `c` over a complete Hausdorff nonarchimedean ring `K` with base point `x ∈ Spa(K,K°)`, and a constant radius `b ∈ K`: the classical point lies in `closedDisc(K⟨T⟩°, T_i, b)` if and only if `c_i ≤ᵥ b` at `x` (pinned `classicalPoint_vle` and evaluation of `T_i` and of constants). For `b = 1` both sides always hold, so the radius is kept general.

On a rank-two valuation with `T` strictly inside the radius but equivalent to it at rank one (Ito's `η(b)`), the weak locus contains the point; compare the closed unit disc with the pinned closedPolydisc set.

*Needs:* Tau Ceti TauCeti.ValuationSpectrum.spa; Tau Ceti `TauCeti.ValuationSpectrum.mem_spa_iff`; Tau Ceti TauCeti.ValuationSpectrum.rationalSubset; Tau Ceti `TauCeti.ValuationSpectrum.mem_rationalSubset_iff`; Tau Ceti `TauCeti.ValuationSpectrum.isOpen_val_preimage_rationalSubset`; Tau Ceti `TauCeti.ValuationSpectrum.rationalSubset_image_mul_right`; Tau Ceti TauCeti.ValuationSpectrum.comap; Tau Ceti `TauCeti.ValuationSpectrum.comap_mem_spa`; Tau Ceti `TauCeti.ValuationSpectrum.comap_preimage_rationalSubset_inter_spa`; Tau Ceti TauCeti.ValuationSpectrum.closedPolydisc; Tau Ceti `TauCeti.ValuationSpectrum.classicalPoint_vle`; Mathlib ValuativeRel.vlt; `AdicEtaleGeometry`, layer A2 (`relative-closed-polydisc`).

`puncturedDisc(A⁺,T,b)` is `closedDisc(A⁺,T,b)` minus the support locus of `T`, that is the set of `v ∈ Spa(A,A⁺)` with `T ≤ᵥ b` and not `T ≤ᵥ` 0. For the unit disc over a complete nontrivially valued field it is Ito's `B(ε)^* = B(ε)∖`{0}: the complement of the classical point `T = 0`, an open subspace of the disc. It is not the complement of a reduction fibre or of a residue disc.

This uses `A` commutative ring with a topology and an explicit plus subring `A⁺` for the set-level construction (the pinned spa asks for nothing more); sheafiness, completeness and the Huber hypotheses belong to AdicSpacesPartII R0; For analytic discs and annuli: `C` complete nontrivially valued, radius representatives a, `b ∈ C^×` with `|a| ≤ |b|`.

(Kazuhiro Ito, Uniform local constancy of étale cohomology of rigid analytic varieties, §6.2, p. 35 (after Remark 6.9); Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Corollary 6.3.6, p. 122.)

Provide `Radial.mem_puncturedDisc`: Membership is closed-disc membership and `T` outside the valuation support; `Radial.puncturedDisc_subset_closedDisc`: The punctured-disc locus is contained in its outer closed disc; `Radial.puncturedDisc_eq_diff`: It equals closedDisc minus {`v | T≤`ᵥ0}, the support locus defined by the pinned valuative relation.

**Checks.**

- `puncturedDisc(A⁺,0,b)` is empty for every `b`.
- `puncturedDisc(A⁺,1,1)=Spa(A,A⁺)`.
- `puncturedDisc(A⁺,1,0)=∅`: a nonzero coordinate outside the outer bound is excluded even after removing the support locus.

`A` valuation with `T` in its support is excluded whatever the outer radius; the coordinate 1 gives the whole spectrum.

*Needs:* Section 10.1.

`closedAnnulus(A⁺,T,a,b)` is the set of `v ∈ Spa(A,A⁺)` with `a ≤ᵥ T ≤ᵥ b` and `T` outside the support of `v`. For all a, `b` it equals `R({T}/b) ∩ R({a}/T)` for the pinned rational subsets: no unit hypothesis is needed, because `T` outside the support and `T ≤ᵥ b` put `b` outside the support. Over a complete nontrivially valued field `C`, with `a = ϖ_a, b = ϖ_b ∈ C^×` and `|ϖ_a| ≤ |ϖ_b|`, in an ambient disc `Spa(C⟨T/c⟩)` with `|c|≥|ϖ_b|` it is the affinoid annulus with coordinate ring `C⟨U,V⟩`/(UV`−ϖ_a/ϖ_b`), where `U=T/ϖ_b` and `V=ϖ_a/T` (Ito's `B(a,b)`, Berkovich's `A(r,R)` on rank-one points); equal radii give the circle and are allowed. Ito calls `B(a,b)` an open annulus because it is an open subspace; the name closedAnnulus follows the classical convention `r ≤ |T| ≤ R`.

This uses `A` commutative ring with a topology and an explicit plus subring `A⁺` for the set-level construction (the pinned spa asks for nothing more); sheafiness, completeness and the Huber hypotheses belong to AdicSpacesPartII R0; For analytic discs and annuli: `C` complete nontrivially valued, radius representatives a, `b ∈ C^×` with `|a| ≤ |b|`.

(Kazuhiro Ito, Uniform local constancy of étale cohomology of rigid analytic varieties, §6.1, p. 31 (repeated in Appendix A.1, p. 46); Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Remarks 6.3.4 (ii), p. 121.)

Provide `Radial.mem_closedAnnulus`: Membership is `Spa` membership, both weak inequalities and `T` outside support; `Radial.closedAnnulus_eq_inter`: For all a, `b: closedAnnulus(A⁺,T,a,b) = rationalSubset(A⁺,{T},b) ∩ rationalSubset(A⁺,{a},T)`. No unit hypothesis is needed; `Radial.closedAnnulus_subset_puncturedDisc`: Every closed-annulus point lies in the punctured outer disc; `Radial.closedAnnulus_mono`: If `a′ ≤ᵥ` a and `b ≤ᵥ b′` at every point of `Spa(A,A⁺)`, then `closedAnnulus(A⁺,T,a,b) ⊆ closedAnnulus(A⁺,T,a′,b′)`: the inclusion of a concentric subannulus.

Provide `Radial.puncturedDisc_eq_iUnion_closedAnnulus`: For a topologically nilpotent `ϖ` (Mathlib `IsTopologicallyNilpotent`): `puncturedDisc(A⁺,T,b) = ⋃ₙ closedAnnulus(A⁺,T,ϖⁿ,b)`. This is the annular exhaustion of the punctured disc used for its cohomology.

**Checks.**

- `closedAnnulus(A⁺,0,a,b)` is empty.
- `closedAnnulus(A⁺,1,1,1)=Spa(A,A⁺)`.
- The annulus with `a=1, b=ϖ⁻¹` and `|ϖ|<1` contains `T=ϖ⁻¹` in `C⟨T/b⟩`; the same inequalities in `C⟨T⟩` exclude this point.
- For all a, `b` the locus equals the intersection `rationalSubset(A⁺,{T},b) ∩ rationalSubset(A⁺,{a},T)` of the two pinned rational subsets.

Equal radius representatives give the weak circle, not the empty set; the coordinate 0 gives the empty set.

*Needs:* Section 10.1; Tau Ceti TauCeti.ValuationSpectrum.rationalSubset; Tau Ceti `TauCeti.ValuationSpectrum.mem_rationalSubset_iff`.

### 10.2 Strict and open radial regions

`strictAnnulus(A⁺,T,a,b)` imposes `a<`ᵥT`<`ᵥb and `T` outside support on `Spa(A,A⁺)`; strict means the negation of the reverse weak comparison, as in Mathlib ValuativeRel.vlt. It is the locus with strict bounds at every rank. `A` strict-valuative locus is not asserted to be an open subset of the adic topology: topology and the corresponding pseudo-adic/support convention are supplied by A2 and Section 1.2. In geometric Berkovich or rigid terminology the associated region is called an open annulus; the words open and closed in radial terminology do not determine adic topological openness.

This uses `A` commutative ring with a topology and an explicit plus subring `A⁺` for the set-level construction (the pinned spa asks for nothing more); sheafiness, completeness and the Huber hypotheses belong to AdicSpacesPartII R0; For analytic discs and annuli: `C` complete nontrivially valued, radius representatives a, `b ∈ C^×` with `|a| ≤ |b|`; No openness is asserted for the strict locus.

(Kazuhiro Ito, Uniform local constancy of étale cohomology of rigid analytic varieties, §6.2, p. 37 (before Lemma 6.12); Kazuhiro Ito, Uniform local constancy of étale cohomology of rigid analytic varieties, Appendix A.1, Example A.1 (2), p. 47; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Remarks 6.3.4 (i), p. 121.)

Provide `Radial.mem_strictAnnulus`: Membership is `Spa` membership, both strict comparisons and `T` outside support; `Radial.strictAnnulus_subset_closedAnnulus`: The strict-annulus locus lies in the weak-annulus locus; `Radial.strictAnnulus_vlt`: Membership equals `Spa` membership, `a<`ᵥT and `T<`ᵥb in the pinned ValuativeRel.vlt convention, and `T` outside support.

**Checks.**

- `strictAnnulus(A⁺,T,a,a)=∅`; equality of radii must not produce the weak circle.
- `strictAnnulus(A⁺,0,a,b)=∅`.
- `A` valuation equivalent in value on `T` and a is excluded by the inner strict bound, including a higher-rank refinement with that exact equivalence.

Equal radii give the empty set; a valuation with `T` equivalent to an endpoint is excluded; a rank-two point infinitesimally inside the outer endpoint is included.

*Needs:* Section 10.1; Mathlib ValuativeRel.vlt.

Given families of radius representatives `a_j, b_j (j ∈ ℕ), openAnnulus(A⁺,T,a,b) = ⋃_j closedAnnulus(A⁺,T,a_j,b_j)`. Over a complete nontrivially valued field `C`, with `0 < r < |a_j| ≤ |b_j| < R`, the `|a_j|` decreasing to `r` and the `|b_j|` increasing to `R`, in an ambient disc `Spa(C⟨T/c⟩)` with `|c|≥R`, the union is the analytic open annulus `r < |T| < R`: an open subspace of that disc, the union of an increasing chain of closed annuli (Ito, p. 38), and the adic space of Berkovich's `B(r,R)`. It depends on the families only up to mutual cofinality. It is not the strict valuative locus `{a <ᵥ T <ᵥ b}` at the endpoints: by Ito's Example `A`.1 the rank-two points `η(R)` and `η(r)′` satisfy the strict inequalities, their rank-one generalisations lie on the boundary circles, and they belong to no closed annulus of strictly smaller size, hence not to the union.

This uses Set-level construction: `A` commutative topological ring, plus subring `A⁺` and explicit radius representatives indexed by `ℕ`; Analytic interpretation: `C` complete nontrivially valued, the nested strict radii in `|C×|` converge to the asserted endpoints; A2 supplies the corresponding open immersion.

(Kazuhiro Ito, Uniform local constancy of étale cohomology of rigid analytic varieties, proof of Lemma 6.12 (1)(b), p. 38; Kazuhiro Ito, Uniform local constancy of étale cohomology of rigid analytic varieties, Appendix A.1, Example A.1 (2), p. 47; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Remarks 6.3.4 (i), p. 121.)

Provide `Radial.mem_openAnnulus`: Membership means membership in one closed-annulus stage; `Radial.closedAnnulus_subset_openAnnulus`: Every stage is contained in the union; `Radial.openAnnulus_constant`: Constant inner and outer representative families give the same closed-annulus locus, not an automatically strict annulus; `Radial.openAnnulus_eq_of_cofinal`: If every stage of `(a,b)` is contained in a stage of `(a′,b′)` and conversely (inner radii compared downwards, outer radii upwards, at every point of `Spa`), then `openAnnulus(A⁺,T,a,b) = openAnnulus(A⁺,T,a′,b′)`.

**Checks.**

- With `a_j=b_j=1` and `T=1` the union is `Spa(A,A⁺)`, so the family hypotheses cannot be omitted from analytic openness.
- The open-annulus union with coordinate `T=0` is empty.
- `A` point belongs to this union iff one of the exact pinned rational annulus intersections contains it, when each `a_j,b_j` is a unit.

The rank-two points `η(R)` and `η(r)′` of Ito's Appendix `A`.1 satisfy the strict inequalities and are absent from the union.

*Needs:* Section 10.1; `AdicEtaleGeometry`, layer A2 (`relative-closed-polydisc`); Section 9.2.

For a family of radius representatives `b_j (j ∈ ℕ), openDisc(A⁺,T,b) = ⋃_j closedDisc(A⁺,T,b_j)`. Over a complete nontrivially valued field `C` with `|b_j| < R` increasing to `R`, in an ambient disc `Spa(C⟨T/c⟩)` with `|c|≥R`, the union is the analytic open disc of radius `R`, an open subspace of the affine line and the adic space of Berkovich's open disc `D(0,R)`; it depends on the family only up to mutual cofinality. The strict valuative locus `{T <ᵥ b}` with `|b| = R` is a different subset: it is closed and constructible (Ito, p. 37), and it contains the rank-two point `η(R)`, which lies in no closed disc of smaller radius.

This uses Set-level construction: `A` commutative topological ring, plus subring `A⁺` and explicit radius representatives indexed by `ℕ`; Analytic interpretation: `C` complete nontrivially valued, the nested strict radii in `|C×|` converge to the asserted endpoints; A2 supplies the corresponding open immersion.

(Kazuhiro Ito, Uniform local constancy of étale cohomology of rigid analytic varieties, §6.2, p. 37 (before Lemma 6.12); Kazuhiro Ito, Uniform local constancy of étale cohomology of rigid analytic varieties, Appendix A.1, Example A.1 (2), p. 47; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Corollary 6.3.6, p. 122.)

Provide `Radial.mem_openDisc`: Membership is membership in one closed-disc stage; `Radial.closedDisc_subset_openDisc`: Every closed-disc stage lies in the union; `Radial.openDisc_constant`: A constant radius family gives the associated closed-disc locus; `Radial.openDisc_eq_of_cofinal`: If every `b_j` is `≤ᵥ` some `b′_k` at every point of `Spa(A,A⁺)` and conversely, then `openDisc(A⁺,T,b) = openDisc(A⁺,T,b′)`.

**Checks.**

- A constant radius-one family gives the unit closed-disc locus.
- `openDisc(A⁺,0,b)=Spa(A,A⁺)` for every radius family `b:N→A`, including zero and nonunit radii: the zero coordinate lies in every stage.
- For unit representatives `b_j` the union equals `⋃_j rationalSubset(A⁺,{T},b_j)`.

A constant family gives a closed disc, so the hypotheses on the family matter; the rank-two point `η(R)` of Ito's Appendix `A`.1 is absent from the union.

*Needs:* Section 10.1; `AdicEtaleGeometry`, layer A2 (`relative-closed-polydisc`); Section 9.2.

### 10.3 Tame coverings and Kummer generators

Let `k` be an algebraically closed complete nonarchimedean field with residue characteristic exponent `p ≥ 1`. An étale morphism `φ: Y → X` of `k`-analytic curves is tame at `y` if the geometric ramification index `v_φ(y) = [𝓗(y) : 𝓗(φ(y))]` is prime to `p`, and tame if this holds at every point of `Y`; a Galois covering of degree prime to `p` is tame. Then every tame finite étale Galois covering of the closed disc `E(0,r)` is trivial, that is a disjoint union of copies of the disc (Berkovich, Theorem 6.3.2). Wild coverings exist in positive residue characteristic, so nothing is asserted without tameness. For radius in `|k^×|` the finite étale coverings of the Berkovich disc and of the adic disc are given by the same finite étale algebras over the affinoid ring, and tameness is tested at rank-one points, so the statement holds for the adic closed disc over `Spa(k, k°)`.

This uses `k` algebraically closed and complete; the valuation may be trivial in Berkovich's statement, and is nontrivial with radius in `|k^×|` for the adic form; Tame means: the geometric ramification index is prime to the residue characteristic at every point, not merely that the degree is invertible in `k`.

(Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Theorem 6.3.2, p. 119; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, opening paragraph, p. 119.)

`A μ_n`-torsor on the closed disc with `n` prime to `p` is trivial; an Artin–Schreier covering of the disc in residue characteristic `p` is not covered by the statement.

*Needs:* Section 10.1; Section 3.2.

With `k` as in the disc theorem and `0 < r ≤ R`, let `A(r,R) = {r ≤ |T| ≤ R}` and let `φ_n: A(r^{1/n}, R^{1/n}) → A(r,R), z ↦ zⁿ`, which is a finite étale Galois covering when `n` is prime to `char(k)` and is tame when `n` is prime to p. Every tame finite étale Galois covering `Y → A(r,R)` with `Y` connected is standard, that is isomorphic to `φ_n` for `n` its degree (Berkovich, Theorem 6.3.5); a tame standard covering has `n` prime to p. The case `r = R` (a circle) is included. This classifies tame Galois coverings, not all finite étale coverings. For `r, R ∈ |k^×|` the same holds for the adic closed annulus over `Spa(k, k°)`.

This uses `k` algebraically closed and complete, residue characteristic `p`; `0 < r ≤ R` (in `|k^×|` for the adic form); Tame as in the disc theorem; standard means isomorphic to `z ↦ zⁿ`.

(Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Theorem 6.3.5, p. 121 (proof pp. 121–122); Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Remarks 6.3.4 (ii), p. 121.)

The identity covering is `φ_1`; `z ↦ z^ℓ` is a nontrivial connected tame covering for `ℓ ≠ p`; a covering of degree divisible by `p` is not asserted to be standard.

*Needs:* Section 10.1; Section 10.3; Section 3.2.

Let `A` be a closed annulus over `Spa(C, O_C)` with coordinate `T` and `n ≥ 1` prime to the residue characteristic. `annulusKummer(T) := δ_n(T) ∈ H¹(A, μ_n)` is the image of the unit `T` under the Kummer connecting map of Section 1.4. The map `O(A)^×/n → H¹(A, μ_n)` is an isomorphism, and the degree identifies both with `ℤ/n` so that `δ_n(T) ↦ 1`, where the degree of a unit `c·Tᵐ·(1 + h)` (`c ∈ C^×`, sup`|h| < 1`) is `m`; on a boundary circle this is Berkovich's `deg_D` for the inner complementary disc `D`, the outer disc gives `−m`, and Layers 8–9's residue map is `γ_D = −deg_D`. The identification is canonical for `μ_n`-coefficients and a coordinate; identifying `H¹(A, ℤ/n)` with `ℤ/n` needs a trivialisation of `μ_n`. The construction applies the imported connecting homomorphism; it does not define the Kummer sequence.

This uses `C` algebraically closed complete, base `Spa(C, O_C)`; the coordinate is a unit on `A`; `n` prime to the residue characteristic; The analytic site and `δ_n` come from Layer 1; the generator is a cohomology class on that site.

(Peter Scholze, Étale cohomology of diamonds, proof of Theorem 19.5 (ii), p. 112; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.2, after Lemma 6.2.2, p. 112.)

Provide `annulusKummer_natural`: For an annulus map `g`, pullback `δ_n(T)=δ_n(g* T)`; `annulusKummer_pow`: `δ_n(S^e)=e·δ_n(S)`; `annulusKummer_mul_nthPower`: `δ_n(T·uⁿ)=δ_n(T)`; `annulusKummer_degree`: Under the degree isomorphism to `ℤ/n, δ_n(T)` maps to 1.

Provide `annulusKummer_coordinateScale`: Replacing `T` by cT for `c∈C×` leaves the `μ_n` class unchanged since `c` has an `n`-th root.

**Checks.**

- The class of the unit coordinate 1 is zero.
- Under `T=S^e`, the pulled back coordinate class is `e` times the `S`-class; for `e=n` it is zero.
- Multiplying the coordinate by an `n`-th power preserves its class.
- The coordinate on an unpunctured disc is not a unit at the origin, so this annulus construction cannot take it as input.

The class in `H¹(A, μ_n)` does not depend on a choice of primitive root of unity; untwisting changes the generator by a unit of `ℤ/n`. With respect to the outer complementary disc the degree of `T` is `−1`.

*Needs:* Section 10.1; Section 10.3; Section 1.4; Section 8.6; Mathlib `CategoryTheory.Sheaf.H`.map.

### 10.4 Cohomology with and without supports

Let `D` be a closed disc of radius in `|C^×|` over `Spa(C, O_C), C` algebraically closed complete nontrivially valued, and `Λ = ℤ/n` with `n` prime to the residue characteristic. Then `H⁰(D, Λ) = Λ` and `H^q(D, Λ) = 0` for `q > 0`. The analytic open disc (the union of an increasing sequence of closed discs) has the same cohomology, and the restriction maps to closed subdiscs are isomorphisms. No statement is made for the strict valuative locus at a fixed endpoint.

This uses `C` algebraically closed, complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p`; base `Spa(C, O_C)`; radii in `|C^×|`; `Λ = ℤ/n` with `n` prime to `p` (false for `p`-torsion: Berkovich Remarks 6.2.10 and 6.4.2); `H^q_c` is Huber's proper-support cohomology relative to `Spa(C, O_C)` (Section 8.3); for a quasi-compact non-proper space it differs from Berkovich's compact-support cohomology.

(Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Corollary 6.3.3, p. 121; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.4, Theorem 6.4.1, p. 125.)

For `Λ = F_ℓ, ℓ ≠ p`, the dimensions are (1, 0, 0, …); for `ℓ = p` in mixed characteristic `H¹` of the closed disc is infinite (Berkovich, Remark 6.4.2).

*Needs:* Section 10.1; Section 10.2; Section 10.3; Section 9.6; `EnhancedDerivedSheaves`, §§0.1–0.4.

With the same `C` and `Λ`, for a closed disc `D` over `Spa(C, O_C): H^q_c(D, Λ) = 0` for `q ≠ 2` and `H²_c(D, Λ) = Λ(−1)`; the trace identifies `H²_c(D, μ_n)` with `ℤ/n`. The same holds for the analytic open disc, and extension by zero from a closed subdisc is an isomorphism on `H²_c`. Here `H_c` is Huber's proper-support cohomology: for the closed disc it is not the cohomology of a compact Hausdorff space (in particular `H⁰_c(D, Λ) = 0`), and it differs from Berkovich's compact-support cohomology of the compact disc.

This uses `C` algebraically closed, complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p`; base `Spa(C, O_C)`; radii in `|C^×|`; `Λ = ℤ/n` with `n` prime to `p` (false for `p`-torsion: Berkovich Remarks 6.2.10 and 6.4.2); `H^q_c` is Huber's proper-support cohomology relative to `Spa(C, O_C)` (Section 8.3); for a quasi-compact non-proper space it differs from Berkovich's compact-support cohomology.

(Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.2, Remark 6.2.10, p. 118; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.2, Theorem 6.2.1, p. 112.)

For `Λ = F_ℓ` the compact-support dimensions are (0, 0, 1) for both the closed and the open disc; duality with disc-cohomology gives the same answer.

*Needs:* Section 10.4; Section 9.2; Section 8.3.

For a closed annulus `A = A(r,R)` over `Spa(C, O_C), r = R` included, and `Λ = ℤ/n` with `n` prime to the residue characteristic: `H⁰(A, Λ) = Λ, H¹(A, Λ) = Λ(−1)` and `H^q(A, Λ) = 0` for `q > 1`; with `μ_n`-coefficients `H¹(A, μ_n) = ℤ/n` is generated by the Kummer class `δ_n(T)`, of degree 1. The analytic open annulus (a union of an increasing sequence of closed annuli) has the same cohomology.

This uses `C` algebraically closed, complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p`; base `Spa(C, O_C)`; radii in `|C^×|`; `Λ = ℤ/n` with `n` prime to `p` (false for `p`-torsion: Berkovich Remarks 6.2.10 and 6.4.2); `H^q_c` is Huber's proper-support cohomology relative to `Spa(C, O_C)` (Section 8.3); for a quasi-compact non-proper space it differs from Berkovich's compact-support cohomology; `0 < r ≤ R` with `r, R ∈ |C^×|`; `r < R` for the open annulus. Arbitrary plus rings are annulus-geometric-plus-ring.

(Peter Scholze, Étale cohomology of diamonds, proof of Theorem 19.5 (ii), p. 112; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Theorem 6.3.5, p. 121 (proof pp. 121–122); Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.4, Theorem 6.4.1, p. 125.)

For `F_ℓ` the dimensions are (1, 1, 0, …); a primitive root of unity only untwists the generator; the circle `r = R` has the same cohomology.

*Needs:* Section 10.1; Section 10.2; Section 10.3; Section 9.6; `EnhancedDerivedSheaves`, §§0.1–0.4.

For a closed annulus `A` over `Spa(C, O_C)` and `Λ = ℤ/n` prime to the residue characteristic: `H¹_c(A, Λ) = Λ, H²_c(A, Λ) = Λ(−1)`, and `H^q_c(A, Λ) = 0` otherwise, for Huber's proper-support cohomology. The same holds for the analytic open annulus. For either ambient annulus, extension by zero along the inclusion `j:V→A` of a nonempty concentric closed subannulus, retaining the same coordinate `T`, is an isomorphism in every degree. Under the curve-duality pairing this map is dual to restriction: `⟨j_!u,v⟩_A = ⟨u,j*v⟩_V`. Restriction preserves the coordinate Kummer generator, as in the adjacent ordinary-cohomology contract, so its dual is an isomorphism.

This uses `C` algebraically closed, complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p`; base `Spa(C, O_C)`; radii in `|C^×|`; `Λ = ℤ/n` with `n` prime to `p` (false for `p`-torsion: Berkovich Remarks 6.2.10 and 6.4.2); `H^q_c` is Huber's proper-support cohomology relative to `Spa(C, O_C)` (Section 8.3); for a quasi-compact non-proper space it differs from Berkovich's compact-support cohomology; `0 < r ≤ R` with `r, R ∈ |C^×|`; `r < R` for the open annulus. The extension-by-zero assertion requires `V` nonempty, closed and concentric in the coordinate `T`.

(Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.2, Theorem 6.2.1, p. 112; Peter Scholze, Étale cohomology of diamonds, proof of Theorem 19.5 (ii), p. 112.)

**Checks.**

- For `F_ℓ` the compact-support dimensions are (0, 1, 1); the closed disc has (0, 0, 1).
- The concentric circle `{|T|=s}` inside `A(r,R)`, with `r≤s≤R`, gives an extension-by-zero isomorphism, including when the ambient annulus is itself a circle.
- Over `C=ℂ₃` with `Λ=ℤ/2`, take `A={|3|≤|T|≤|3|⁻¹}` and `V={|3|²≤|T−1|≤|3|}`. Writing `S=T−1`, one has `|S|≤|3|<1`, so the convergent square-root series for `1+S` kills the restriction of `δ₂(T)`. Thus `H¹_c(V,Λ)→H¹_c(A,Λ)` is zero between copies of `Λ`, by the pairing. The same `V` lies in the analytic open annulus with these endpoint radii and gives the same zero map there.

*Needs:* Section 10.4; Section 9.6; Section 8.3.

With the preceding geometric and coefficient hypotheses, restriction from a closed annulus to any nonempty concentric closed subannulus is an isomorphism in every cohomological degree. In degree one with `μ_n` coefficients it preserves the class `δ_n(T)` of the same coordinate. The coordinate degree, rather than abstract equality of dimensions, determines this actual map.

This uses `C` algebraically closed, complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p`; base `Spa(C, O_C)`; radii in `|C^×|`; `Λ = ℤ/n` with `n` prime to `p` (false for `p`-torsion: Berkovich Remarks 6.2.10 and 6.4.2); `H^q_c` is Huber's proper-support cohomology relative to `Spa(C, O_C)` (Section 8.3); for a quasi-compact non-proper space it differs from Berkovich's compact-support cohomology.

(Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Theorem 6.3.5, p. 121 (proof pp. 121–122); Peter Scholze, Étale cohomology of diamonds, proof of Theorem 19.5 (ii), p. 112.)

Restriction from `A(r,R)` to a circle `{|T| = s}, r ≤ s ≤ R`, is an isomorphism; a map between the same groups that kills `δ_n(T)` would have the same source and target dimensions.

*Needs:* Section 10.4; Section 10.3.

Let `D` be a closed disc (or an analytic open disc) over `Spa(C, O_C)` centred at 0, `D^× = D∖`{0} the complement of the classical point, and `Λ = ℤ/n` prime to the residue characteristic. Then `H⁰(D^×, Λ) = Λ, H¹(D^×, Λ) = Λ(−1)` (generated over `μ_n` by `δ_n(T)`) and `H^q(D^×, Λ) = 0` for `q > 1`; and `H¹_c(D^×, Λ) = Λ, H²_c(D^×, Λ) = Λ(−1), H^q_c(D^×, Λ) = 0` otherwise. The puncture is the classical point, not a reduction fibre.

This uses `C` algebraically closed, complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p`; base `Spa(C, O_C)`; radii in `|C^×|`; `Λ = ℤ/n` with `n` prime to `p` (false for `p`-torsion: Berkovich Remarks 6.2.10 and 6.4.2); `H^q_c` is Huber's proper-support cohomology relative to `Spa(C, O_C)` (Section 8.3); for a quasi-compact non-proper space it differs from Berkovich's compact-support cohomology.

(Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Corollary 6.3.6, p. 122; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Theorem 6.3.5, p. 121 (proof pp. 121–122).)

Adding the origin kills ordinary `H¹` and `H¹_c`; for `F_ℓ` the dimensions are (1, 1, 0) and (0, 1, 1) with compact support.

*Needs:* Section 10.1; Section 10.4; Section 8.5; `EnhancedDerivedSheaves`, §§0.1–0.4.

In Layers 8–9 localization triangle for the closed origin {0}`⊂D`, with `D` a geometric disc and prime-to-residue `Λ`, the canonical boundary `H⁰_c({0},Λ)=Λ→H¹_c(D∖{0},Λ)=Λ` is an isomorphism. The disc proper-support groups vanish in degrees zero and one, so exactness determines this map.

This uses `C` algebraically closed, complete for a nontrivial nonarchimedean absolute value, with residue characteristic exponent `p`; base `Spa(C, O_C)`; radii in `|C^×|`; `Λ = ℤ/n` with `n` prime to `p` (false for `p`-torsion: Berkovich Remarks 6.2.10 and 6.4.2); `H^q_c` is Huber's proper-support cohomology relative to `Spa(C, O_C)` (Section 8.3); for a quasi-compact non-proper space it differs from Berkovich's compact-support cohomology.

(Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.3, Corollary 6.3.6, p. 122; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §6.2, Remark 6.2.10, p. 118.)

For `n>1`, the connecting map from the puncture is nonzero; it is not determined by the dimensions alone but by exactness.

*Needs:* Section 10.4; Section 8.5.

Let `C` be algebraically closed complete nonarchimedean with residue characteristic exponent `p, C⁺ ⊆ C` an open and bounded valuation subring of any rank, `S = Spa(C, C⁺)` with generic point `η = Spa(C, O_C), n` prime to `p` and `Λ = ℤ/n`. Let `A` be a closed annulus over `S` with radius representatives in `C^×`, and `A_η` its fibre over `η`, the closed annulus over `Spa(C, O_C)`. Then restriction `H^q(A, Λ) → H^q(A_η, Λ)` is an isomorphism for all `q`, so `H⁰(A, Λ) = Λ, H¹(A, Λ) = Λ(−1)` (generated over `μ_n` by the Kummer class of the coordinate) and `H^q(A, Λ) = 0` for `q ≥ 2`. Likewise a closed disc over `S` has cohomology `Λ` in degree 0 only. This is the arbitrary-rank ordinary cohomology calculation used in Scholze’`s` proof of Theorem 19.5(ii), pp. 110–112. Proper-support cohomology over the full higher-rank field pair uses the normalization and prime-to-`C⁺` duality of Sections 9.5–9.6.

This uses `C` algebraically closed complete; `C⁺` of any rank; `n` prime to the residue characteristic exponent; Ordinary cohomology only.

(Peter Scholze, Étale cohomology of diamonds, proof of Theorem 19.5 (ii), p. 112.)

For `C⁺` of rank two the annulus over `Spa(C, C⁺)` has more points than its generic fibre and the same cohomology with constant coefficients; for `j_`!`Λ` from the generic fibre the two differ.

*Needs:* Section 10.4; Section 9.6; Section 9.2.

Let `ℓ` be a prime different from the residue characteristic p. (a) Let `A′ → A` be a morphism of closed annuli over a geometric base with coordinates `S` on `A′` and `T` on `A` such that `T` pulls back to `u·S^e` with `u` an `ℓ`-th power of a unit. Then pullback `H¹(A, μ_ℓ) → H¹(A′, μ_ℓ)` sends `δ_ℓ(T)` to `e·δ_ℓ(S)`: it is zero if `ℓ | e` and an isomorphism if `ℓ ∤ e`, in particular for `p`-power root extractions. `(b)` For a filtered system of such annuli in which `ℓ`-th roots of the coordinate are cofinally adjoined, `colim H¹(−, F_ℓ) = 0` and `colim H⁰(−, F_ℓ) = F_ℓ`. `(c)` The ECD system: let `k` be an algebraically closed discrete field of characteristic `p, (C′, C′⁺)` a geometric field pair over `k` with pseudouniformiser `ϖ`, and for a finite extension `L` of `k((t^{1/p^∞}))` let `Y′_{n,L} = {|t|ⁿ ≤ |ϖ| ≤ |t|^{1/n}} ⊂ Spa(L, O_L) ×_k Spa(C′, C′⁺)`. Each `L` is `k((t_L^{1/p^∞}))` for a uniformiser `t_L` of the corresponding finite separable extension of `k((t))`, each `Y′_{n,L}` is the perfection of a closed annulus over `Spa(C′, C′⁺)` in the coordinate `t_L`, and for `L ⊂ L′` of ramification index `e` one has `t_L = u·t_{L′}^e` with `u` a unit of the integers of `L′`, hence an `ℓ`-th power. Therefore `RΓ(lim_L Y′_{n,L}, F_ℓ) = F_ℓ`: the classical input of ECD Theorem 19.5 (ii).

This uses `ℓ ≠ p`; annuli over a geometric base `Spa(C′, C′⁺)`, the plus ring of any rank (annulus-geometric-plus-ring); Passage to the limit uses cohomological continuity for a colimit-presented tilde-limit (Section 1.5), not an inverse limit of underlying spaces alone; the perfectoid annuli have the étale cohomology of the classical ones (perfection, part (v) of Section 7.2).

(Peter Scholze, Étale cohomology of diamonds, proof of Theorem 19.5 (ii), p. 112.)

An `ℓ`-th root transition is zero on `H¹(−, F_ℓ)`; a `p`-th root transition is an isomorphism on `H¹(−, F_ℓ)`, so a tower adjoining only `p`-power roots does not kill the class.

*Needs:* Section 10.4; Section 10.3; Section 1.5; Section 7.2.

### 10.5 Constructibility in smooth families

The smooth-family finiteness proof requires the following intermediate theorem, `reduced_curve_singular_tube_H1_constructible`. Let `B` be a noetherian Nagata ring, `s∈B`, and `p:Z→Spec B` projective, flat with geometrically reduced one-dimensional fibres and smooth generic locus over `B[1/s]`. On a locally closed special-base stratum `E`, suppose the singular locus splits into finitely many disjoint components finite radicial over `E`. Let `T` be one such component, let `q:d(Z,T)→d(Spf B,E)` be the resulting proper supported generic-fibre map, and let `G` be a finitely generated module over a noetherian ring killed by an integer prime to the relevant residue characteristics. Then `R¹q_*G` is constructible. Finite radicial components are retained, rather than called étale sections. (Huber (1996), §6.3, reduction `(V)`, pp. 337–339, and proof (VI)–(VII), pp. 339–359.)

At a geometric point of `E`, strictly localize both `Z` and the base. The scheme nearby-cycle finiteness and exchange of Lemmas 6.3.1–6.3.2, pp. 329–334, give a finite locally constant `H¹` on the punctured strict-local base. After a finite étale localization, choose a single finitely generated submodule `H` whose restriction identifies with all these fibre `H¹` groups. Descend `H` and its finite set of generators to one neighborhood. Refine by rational regions `|sᵐ|≤|a|` and their specialization supports; the formal stalk comparison of Section 4.3 and henselian comparison of Layer 2 identify the supported analytic `H¹` with those same groups. Thus one neighborhood carries a finite locally constant `H¹`, and finite locally closed strata cover the support. The proof requires this common submodule and its restriction isomorphisms, rather than just separate finite stalks. (Huber, §6.3(VI), pp. 339–343, and (VII), pp. 343–359.)

To obtain the theorem below, a field-base map permits algebraically finite-type smooth charts to descend to a finite-type model over a complete DVR. The local projective curve compactification, Weierstrass approximation and reduced-fibre model of Section 8.2 give projective reduced curve models. On the smooth special-fibre locus, the formal comparison and supported proper-image theorem give constructibility in all degrees; on its finite singular locus only degree one remains and is the theorem above. Constructible coefficients reduce to constants by locally closed extension by zero and finite étale trivializations. Higher relative dimension factors locally into smaller-dimensional smooth maps; the Leray and finite-cover spectral sequences, with the 2d amplitude bound, finish the induction. These reductions retain finitely generated modules over a noetherian coefficient ring; the ring need not have finite cardinality. (Huber, §6.3`(I)`–`(V)`, pp. 334–339; Theorem 6.2.2, p. 329.)

*Needs:* Layers 1–2, 4 and 7–8; Section 8.2's DVR local compactification and reduced-fibre theorem; `SchemeAndStackFoundations`, Layers 2 and 4, for scheme finiteness, strict localization, normalization and noetherian stratification; `EtaleCohomologyFoundations`, §§0.5–0.6, for simultaneous finite-presentation descent of the geometry and coefficients.

Let `f:X→Y` be a smooth separated quasi-compact morphism of analytic pseudo-adic spaces and suppose `Y` admits a morphism to `Spa(K,O_K)` for a complete nonarchimedean field `K`. For a noetherian coefficient ring `B` killed by `n>0` prime to `char⁺(Y)`, every constructible `B`-sheaf `F` on `X` has constructible Rᑫf!`F` for every `q≥0`. The field-base map is part of this statement. The smooth proper specialization gives finite locally constant direct images of finite locally constant sheaves. `A` transfer to bases with no field-base map is a separate comparison theorem of Section 10.5.

This uses The spaces satisfy the locally noetherian standing condition; `f` is smooth, separated and qc. Constructible `B`-sheaves have finitely generated stalk modules, which need not be finite as sets.

(Huber (1996), §6.2, Theorem 6.2.2 and Corollary 6.2.3, p. 329; Kazuhiro Ito, Uniform local constancy of étale cohomology of rigid analytic varieties, §6.2, Theorem 6.8 and Remark 6.9, p. 35.)

For `f=`id and `B=F_ℓ[t]`, the output constant stalk `B` is finitely generated over `B` and infinite as an abelian group. For `f` proper the identification `f`!`=f*` recovers the stated locally constant case.

*Needs:* Section 1.4; Section 8.3; Section 8.4; `AdicEtaleGeometry`, layer A2 (`relative-closed-polydisc`); `AdicSpacesPartII`, layer R0 (`smooth-morphism`).

Let `C` be an algebraically closed complete nonarchimedean field, `Y_I` a quasi-compact quasi-separated adic space of topologically finite type over `Spa(C, O_C), f_I: B_{Y_I} → Y_I` the relative closed unit ball, `n` invertible in `O_C` and `F_I` a Huber-constructible sheaf of `ℤ/n`-modules on `B_{Y_I}`. Let `g: Y → Y_I` be a morphism of adic spaces from a strictly totally disconnected perfectoid space `Y`. Then for every `q ≥ 0` the sheaf `g^*R^q f_{I!}F_I` on `Y_ét = |Y|` admits a finite partition of `|Y|` into constructible locally closed subsets on each of which it is constant with value a finitely generated `ℤ/n`-module; that is, it is constructible in the sense of ECD Definition 20.1 (i). This is the classical input of condition (ii) in ECD's proof of Theorem 24.1. There `Y` is strictly totally disconnected of characteristic `p`; it maps to `Spa(K, O_K)` for `K` the completion of `F_p((ϖ^{1/p^∞}))` and, having no nonsplit finite étale covers, to `Spa(C, O_C)` for `C` the completed algebraic closure of `K`. The approximation `Y ~ lim_I Y_I` of Section 7.2 over the geometric pair `(C, O_C)` therefore has bases of topologically finite type over an algebraically closed field, and the form of Hub96 6.2.2 over a non-closed base field, which the wording of ECD's proof uses with `K`, is not needed. The statement concerns the pulled-back sheaf only; its identification with a direct image over `Y` is perfectoid-support-image-comparison.

This uses `C` algebraically closed complete; `Y_I` quasi-compact quasi-separated of topologically finite type over `Spa(C, O_C)`; `F_I` Huber-constructible; `n` invertible in `O_C`; `Y` strictly totally disconnected perfectoid (`DiamondsAndVStacks`, layer D1 (`strictly-totally-disconnected`)), so that étale sheaves on `Y` are sheaves on `|Y|`; Finite-stage constructible coefficient descent uses Section 1.4–1.5 and `EtaleCohomologyFoundations`, §§0.5–0.6; all rational strata, finite étale trivializations and gluing maps descend together.

(Peter Scholze, Étale cohomology of diamonds, proof of Theorem 24.1, condition (ii), p. 152; Peter Scholze, Étale cohomology of diamonds, proof of Theorem 24.1, condition (iv), p. 152.)

The strata are constructible locally closed subsets of the spectral space `|Y|` pulled back from a finite stage; no diamond, `v`-descent or six-functor statement is used.

*Needs:* Section 10.5; Section 1.4; Section 1.2; Section 7.2; `DiamondsAndVStacks`, layer D1 (`strictly-totally-disconnected`); Layers 1 and 3.

Let `Y` be a qc strictly totally disconnected perfectoid space with a colimit-presented approximation `Y∼lim_J Y_J` over `(C,O_C), C` complete algebraically closed, with qcqs finite-type stages. Write `f_J:B_{Y_J}→Y_J` for the relative closed unit ball and choose the standard qc open immersion `j_J:B_{Y_J}→P¹_{Y_J}`. Let `f̄_J:P¹_{Y_J}→Y_J` be proper. On `Y` define Rf!`F=Rf̄*j`!`F` on the classical étale site, using the base-changed factorization and the sheafy relative projective line. For `n>0` invertible in `O_C` and a constructible `Z/n`-sheaf `F_J` on `B_{Y_J}`, prove the canonical comparison `g_J*Rf_{J!}F_J≃`Rf!`h_J*F_J`. Prove independence of `J` and of any finite-stage compactification used to define this functor on descended constructible coefficients.

This uses Use completed-colimit, not arbitrary tilde-limit, presentations; `Y` and the relevant relative polynomial charts are strongly sheafy. Relative projective and ball geometry over a perfectoid base uses `AdicSpacesPartII`, layer R0, and `AdicSpacesPartIV`, layer R5. Coefficients and their finite support diagrams descend to a finite stage. No unrestricted six-operation assertion over a nonnoetherian base is included.

(Huber (1996), §2.4, Proposition 2.4.4 and Corollary 2.4.6, pp. 127–129; §5.3–5.4, pp. 290–298 (finite-stage proper exchange and independence); the completed-colimit extension is the deduction above; Peter Scholze, Étale cohomology of diamonds, Theorem 24.1, proof of condition (ii), p. 152 (application of the finite-stage constructibility input).)

Construct the exchange morphism by adjunction and exact pullback of `j`!. At a geometric point `ξ` of `Y`, Section 1.5 identifies the target stalk with `RΓ(P¹_{Y(ξ)},j!F)`. This identification uses descent of qcqs étale neighborhoods along completed colimits and coherent-site cohomological continuity; it applies to the relative projective line over the strongly sheafy base even though `Y` is nonnoetherian. The source stalk has the same description by proper base change at the finite noetherian stage, pulled to the full field pair `Y(ξ)`. The extension of that pair to the chosen geometric point is harmless by Layer 7. Exact extension by zero commutes with these fibre restrictions. Thus the canonical map is an isomorphism on every geometric stalk, including higher-rank points, hence an isomorphism of sheaves and bounded-below complexes. The comparison does not identify the target with a fibre over just the maximal generization. For later stages the finite-stage base-change maps compose, so the comparisons form a compatible system. Two finite-stage compactifications admit the usual common proper refinement after enlarging the index. Independence at that stage is Section 8.3; pullback and the established stalk comparison transfer its canonical identification to `Y`. All coherence identities are checked before pullback, rather than inferred from equality of stalk dimensions. Combine this with Section 10.5’`s` finite constructible partition for the pulled-back finite-stage image.

*Needs:* Section 10.5; Section 8.2; Section 8.3; Section 1.2; Section 1.5; Section 7.2; Layers 8–9.

Let `ι: (C, C⁺) → (C′, C′⁺)` be a surjective extension of geometric field pairs, that is `ι⁻¹(C′⁺) = C⁺`, let `n>0` be a unit in `C⁺` (hence in `C′⁺`) and `M` a `ℤ/n`-module. Let `Y` be a closed disc or a closed annulus over `S = Spa(C, C⁺)` with radius representatives in `C^×, j: U → Y` a quasi-compact open, and `Y′, U′` their base changes to `S′ = Spa(C′, C′⁺)`; `Y′` is the disc or annulus with the same radius representatives over `S′`. Then pullback `Hⁱ(Y, j_!M) → Hⁱ(Y′, j′_!M)` is bijective for every `i`. This is Section 7.1 applied to radial affinoids; ECD Theorem 19.5 (iii) gives its perfectoid specialization. The inclusion of the generic point `Spa(C, O_C) → Spa(C, C⁺)` is induced by the identity of `C`, which is not a surjective extension when `C⁺ ≠ O_C`; the comparison with the maximal plus ring is annulus-geometric-plus-ring.

This uses `C, C′` algebraically closed complete; `ι` surjective, `i.e`. `ι⁻¹(C′⁺) = C⁺` (Section 7.1); no hypothesis on the ranks of the plus rings; `n>0` a unit in `C⁺`; `M` any `ℤ/n`-module.

(Huber (1996), Theorem 4.1.1(c), p. 238, for arbitrary-plus-ring invariance; Peter Scholze, Étale cohomology of diamonds, Theorem 19.5 (iii), p. 111, and proof of Theorem 19.5 (ii), p. 112, for the perfectoid specialization.)

For `U = Y` this is invariance of `Hⁱ(Y, M)`; for `C⁺ ≠ O_C` the map `Spa(C, O_C) → Spa(C, C⁺)` is not surjective and the statement does not apply to it.

*Needs:* Section 10.1; Section 7.1.

### Examples

For `C` algebraically closed complete with residue characteristic exponent `p` and `ℓ≠p`, a closed annulus has `H⁰(−,F_ℓ)=F_ℓ, H¹(−,F_ℓ)=F_ℓ(−1)`, and no higher cohomology. Its Huber proper-support groups are `H¹_c=F_ℓ` and `H²_c=F_ℓ(−1)`, with all other degrees zero; a closed disc has only `H²_c` nonzero. An equal-radius closed annulus still has the degree-one Kummer class. Removing the origin of a disc produces the connecting isomorphism `H⁰_c({0},F_ℓ)→H¹_c(D∖{0},F_ℓ)`; exactness fixes this actual map. (Berkovich (1993), Theorems 6.2.1 and 6.3.5, pp. 112 and 121–122; Huber (1996), Corollary 7.5.5, p. 396.)

For the cover `T=S^e`, pullback sends `δ_ℓ(T)` to `e·δ_ℓ(S)`. Adjoining an `ℓ`-th root kills `H¹` modulo `ℓ`; adjoining only `p`-th roots preserves it because `p` is a unit modulo `ℓ`. Hence a `p`-power root tower alone does not make the annulus `ℓ`-cohomologically acyclic. Cofinal `ℓ`-root extraction does, through completed-colimit cohomological continuity with the full geometric plus ring. (Scholze, *Étale cohomology of diamonds*, proof of Theorem 19.5(ii), p. 112.)

### Dependencies

Use Layers 1–9, `AdicSpacesPartII`, layers R0–R1, and `AdicSpacesPartIII`, layers R2–R3, and `AdicEtaleGeometry`, A1 and A2, for rational radial loci and their smooth geometry. `PerfectoidSpaces`, P7, and Section 1.5 supply completed-colimit continuity. Ordinary exhaustion uses `EnhancedDerivedSheaves`, §§0.1–0.4, for derived inverse limits; proper-support exhaustion uses Section 8.3. Smooth-family constructibility uses the curve factorization and compactification of Section 8.2, the supported tube finiteness theorem of Section 10.5 and coefficient descent from `EtaleCohomologyFoundations`, §§0.5–0.6. For strictly totally disconnected perfectoid bases use the explicit classical relative-support comparison in Section 10.5, with the base supplied by `DiamondsAndVStacks`, D1.

## Layer 11: Analytification, compactification and boundary duality

### 11.1 Nonproper algebraic comparison and finiteness

Prove the relative purity theorem `smooth_closed_immersion_purity`: let `Y→X→S` be maps of analytic pseudo-adic spaces, `Y→X` a closed immersion of pure codimension `c`, and `Y→S` and `X→S` smooth. Let `Λ=Z/n, n>0`, and let `F` on `X` be locally pulled back from a sheaf on `S`. Then the support cohomology sheaf `ℋ^q_Y(F)` is zero for `q≠`2c and its top support sheaf is locally `i_*i*F(−c)`, under either of the following two scopes. First, `n` is a unit in `O⁺_S`, with no finite local-constancy assumption on the pulled-back sheaf. Second, `n` is a unit in `O_S, F` is finite locally constant over `Λ`, the ambient `S` is of type `(S)`, its pseudo-adic support is closed under generization, and every positive residue-characteristic prime at a characteristic-zero maximal point is a unit in `O_S`. The second condition applies over a characteristic-zero field even for `n` divisible by its residue characteristic. Keep the local identification separate from a globally normalized cycle-class isomorphism. (Huber (1996), Theorem 3.9.1, p. 230, and proof, pp. 230–237.)

The codimension-one calculation uses `P¹` and proper algebraic comparison. For prime-to-residue coefficients the punctured affine-line calculation follows from henselian comparison. For the second scope, exhaust `A¹` by closed discs and prove a uniform radius-ratio estimate, depending on the finite coefficient exponent, under which restriction from a larger disc to a prescribed smaller disc is zero on `H¹`. Analytic unit expansions and binomial roots supply this estimate. `A` cofinal subexhaustion using those ratios kills the `H¹` inverse-limit obstruction, and the degree-at-least-two disc calculation supplies the remaining vanishing. Lemma 3.9.3, pp. 236–237, transports this calculation over general pseudo-adic bases. Smooth coordinate charts and successive support localization give the codimension-`c` result. This proves purity in the locally constant characteristic-zero scope without assuming `p`-torsion smooth duality for arbitrary analytic sheaves.

Deduce `normal_crossings_open_comparison` for the complement `j` of a strict normal-crossings divisor `D` in a smooth finite-type `k`-scheme, where `k` is complete nonarchimedean, `n>0` is prime to `char(k)`, and `F` is a finite locally constant `Z/n`-sheaf on the ambient smooth scheme, restricted to the complement. For constant coefficients, at a strict-local point where `r` branches meet, the cohomology of the punctured neighborhood is the exterior algebra on the `r` Kummer classes of its local equations, with degree-one generators carrying twist `−1` in the untwisted coefficient description. For `F` the calculation is its stalk tensored with that exterior algebra: `Hᵠ` is `F_x⊗Λ ∧ᵠ(Λ(−1)ʳ)`. `A` local system given only on the complement, with nontrivial boundary monodromy, is outside this calculation. Both algebraic and analytic restriction maps use the same equations and cup products, so analytification identifies `Rj_*` locally. Iterating the purity calculation, with its stated characteristic-zero or prime-to-residue scope, proves the claim at every geometric point. For the coefficient unit, one branch gives one degree-one generator and two transverse branches give two generators and their degree-two product. With no branch, the result is `F_x` in degree zero; for `F=Λ²` and one branch, both degrees zero and one have rank two, excluding an exterior-algebra formula that forgets `F`. This is the regular-boundary input for the nonproper comparison below. (Huber, proof route (a) of Theorem 3.8.1, pp. 227–229; Theorem 3.9.1, p. 230, and proof, pp. 230–237; the algebraic normal-crossings calculation is `EtaleCohomologyFoundations`, §§0.7–0.11.)

*Needs:* Layers 1–2, Section 8.2 proper algebraic comparison, Layer 9's prime-to-residue smooth trace and duality, and analytic smooth coordinate charts from `AdicEtaleGeometry`, layer A2; the algebraic purity, divisor and normal-crossings interfaces from `EtaleCohomologyFoundations`, §§0.7–0.11. In characteristic zero, `AlgebraicModuliForArithmeticGeometry`, Layer 9, Section 9.7 (`relativeEmbeddedResolution`), supplies the resolution with a regular normal-crossings boundary used in the comparison proof.

For a finite-type morphism `f:X→Y` of schemes locally of finite type over a complete nonarchimedean field `k, n>0` prime to `char(k)`, and a constructible `Z/n`-sheaf `F` on `X`, the natural map `φ_Y*Rᑫf*F→Rᑫf^rig*φ_X*F` is an isomorphism for all `q≥0`. Here `φ*` is inverse image under analytification. In characteristic zero there is no residue-characteristic restriction on `n`. The proof reduces by algebraic compactification and proper comparison to a regular boundary. In characteristic zero use the locally constant purity case of Section 11.1; in positive characteristic use the prime-to-residue smooth duality and support comparison of Layer 9 in every relative dimension.

This uses Require `f` of finite type and `F` constructible. The order `n` is positive and invertible in `k`. Properness of `f` is unnecessary.

(Huber (1996), §3.8, Theorem 3.8.1, pp. 227–228; Huber (1996), §3.8, after 3.8.1, p. 228; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §7.5, Corollary 7.5.3, p. 150; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §7.4, Theorem 7.4.9, p. 145; Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, §7.1, Corollary 7.1.4, pp. 129–130; Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry, Appendix A, Lemma A.18, p. 87.)

For `f` proper this is the comparison above, without needing constructibility. For a characteristic-zero field with residue characteristic `p` it applies to a constructible `Z/p`-sheaf; this does not enlarge the prime-to-`O⁺` duality statement. For `k` of characteristic `p` the coefficient `Z/p` is excluded.

*Needs:* Section 8.2; `AdicSpacesPartII`, layer R1 (`analytification-functor`); `AdicEtaleGeometry`, layer A2.6a (`analytification-etale-site`); Section 1.1; Layers 8–9; `SchemeAndStackFoundations`, Layer 2; `EtaleCohomologyFoundations`, §§0.7–0.11.

Let `f:(X,Σ)→(S,T)` be a morphism of qcqs pseudo-adic spaces with ambient `S=Spa(k,k⁺)`, where `k` is separably closed and complete. Assume `f` is locally algebraically of finite type and `Σ` is a locally closed locally constructible subset of `f⁻¹(T)` in the ambient `X`. If `B` is noetherian and killed by `n>0` prime to `char⁺(S,T)`, and `F` is a constructible `B`-sheaf, then Hᑫ`((X,Σ),F)` is finitely generated over `B` for every `q`. The smooth full-support specialization follows from the locally algebraically finite-type presentation of smooth maps. For `B=F_ℓ` and `ℓ` prime to `char⁺(S,T)`, the groups are finite-dimensional.

This uses The locally algebraically finite-type presentation and its support condition are essential. Noetherian coefficients mean module-finite conclusions, not finite cardinality.

(Huber (1996), §6.1, Proposition 6.1.1 and proof, pp. 324–326; §1.7, (1.7.7), p. 88; Yoichi Mieda, Zelevinsky involution and ℓ-adic cohomology of the Rapoport–Zink tower, proof of Proposition 3.38, p. 20.)

The smooth qcqs case gives finite-dimensional `F_ℓ` cohomology. For `B=F_ℓ[t]` and a geometric point the `H⁰` module `B` is finitely generated but infinite as a set. Finiteness in each degree does not itself supply a bound on the degrees.

*Needs:* Section 1.4; `AdicSpacesPartII`, layer R0 (`smooth-morphism`); Section 1.1.

### 11.2 Finite polydiscs and affine-space exhaustion

First prove `field_cohomological_dimension_transcendence`, stated in `Suggested.lean` using Tau Ceti’s continuous cohomological dimension of the absolute Galois group: for a field extension `L/K` and a prime `ℓ, cd_ℓ(L)≤cd_ℓ(K)+trdeg_K(L)`, with infinite bounds permitted. For finite transcendence degree, use a transcendence basis, algebraic-extension monotonicity and Hochschild–Serre. Over a separably closed base the one-variable prime-to-characteristic bound follows from Tsen applied also to finite extensions and the finite-module cohomological-dimension criterion; in characteristic `ℓ` use Artin–Schreier. Iterate one variable and pass through filtered unions of finitely generated subfields. (Compare Stacks project, Lemma 59.95.4, tag [0F0T](https://stacks.math.columbia.edu/tag/0F0T), for the all-torsion bound.) This is the field input below; `SchemeAndStackFoundations`, Layer 2, Sections 2.11, 2.15 and 2.16, supplies Artin–Schreier, Tsen, Hochschild–Serre and the field/Galois and limit comparisons, while `TauCetiRoadmap.ProfiniteCohomology`, Layer 11, supplies the finite-module criterion and algebraic-extension monotonicity.

Prove `ordinary_etale_cohomological_dimension`: for a qcqs analytic pseudo-adic space `X` and any prime `ℓ`,

```text
cd_ℓ(X) ≤ dim(X) + sup_{x∈|X|} cd_ℓ(k(x)ʰ).
```

Here `k(x)ʰ` is henselization with respect to `k(x)⁺`; the expression is allowed to be infinite. For an analytic pseudo-adic morphism `X→S` with `X` qcqs, also prove

```text
cd_ℓ(X) ≤ dim(X) + dim.tr(X/S) + sup_{s∈|S|} cd_ℓ(k(s)ʰ).
```

If `S` is a geometric point, this gives `cd_ℓ(X)≤2 dim.tr(X/S)`. A geometric point here has a one-point pseudo-adic support with separably closed henselian residue field; a full higher-rank `Spa(K,K⁺)` is not substituted for that support. In particular `Spa(C,O_C)` is a geometric point for `C` algebraically closed and rank one. These are bounds for ordinary cohomology of arbitrary `ℓ`-primary torsion sheaves, independent of the lower-shriek amplitude of Section 8.4. (Huber (1996), Proposition 2.8.1, Corollaries 2.8.2–2.8.3 and Lemma 2.8.4, pp. 156–159.)

For the proof, push from the étale topos to the topological space. On a qc constructible neighborhood, the higher direct-image stalk at `x` is the cohomology of the generization support whose unique closed point is `x`. Section 1.2 identifies that support with the henselian-field étale topos. The spectral topological dimension bounds the remaining topological cohomology. Reduce arbitrary torsion sheaves to filtered colimits of constructible sheaves; finite locally closed stratifications and the supported localization triangle give induction on dimension. For the relative estimate prove the field input: a continuous extension of analytic field pairs `(K,K⁺)→(L,L⁺)` with `K⁺=K∩L⁺` satisfies `cd_ℓ(Lʰ)≤cd_ℓ(Kʰ)+tr.c(L/K)`. Choose a subfield of transcendence degree `tr.c(L/K)`, then pass through the finite chain of algebraic closure, topological closure and henselization used to define completed transcendence degree. Algebraic extension does not increase the bound, while topological closure preserves the henselian-field étale topos. This supplies the bound for completed residue fields in the displayed inequality.

**Checks.**

- For `X=Spa(C,O_C)`, with `C` algebraically closed, the bound is zero and every positive-degree torsion cohomology group vanishes.
- For a strict `m`-ball over this point the bound is 2m; it concerns ordinary cohomology and does not follow from a bound on Rf!.
- Over a field whose `ℓ`-cohomological dimension is positive, the residue-field term remains. Dropping it would already give a false zero-dimensional bound for a point.
- The equality `K⁺=K∩L⁺` is required in the relative field input; a change of the plus ring is not treated as an extension with that property.

*Needs:* Sections 1.1–1.2 and 1.4–1.5 for derived direct images, henselian support topoi, constructible dévissage and filtered-colimit continuity; `AdicEtaleGeometry`, Section A2.6, for spectral dimensions; Tau Ceti `TauCeti.ValuationSpectrum.residueFieldValuation`, completed in `AdicEtaleGeometry`, layer A1 (`etale-site-and-geometric-points`), for completed residue fields; `AdicEtaleGeometry`, A0–A2, for analytic field pairs; Section 8.2 for relative completed transcendence degree; `TauCetiRoadmap.ProfiniteCohomology`, Layers 9 and 11, for the absolute Galois cohomology and cohomological-dimension interfaces, and `SchemeAndStackFoundations`, Layer 2, Sections 2.11, 2.15 and 2.16, for the field inputs of `field_cohomological_dimension_transcendence`.

`A` strict closed `m`-ball over `C`, the completed algebraic closure of `F_p((t))`, has finite total `F_ℓ` cohomology for every constructible sheaf when `m` is finite and `ℓ≠`p. Finiteness in each degree is the locally algebraically finite-type theorem of Section 11.1; vanishing above 2m is the ordinary cohomological-dimension bound stated here. In particular this applies to pullbacks of constructible sheaves on `Aᵐ_F_p`. Coordinate perfection preserves these groups through the perfectoid étale-topos equivalence.

This uses Require finite `m, ℓ≠p` and constructible finite `F_ℓ` coefficients. The ball radii belong to `|C×|`.

(Huber (1996), Proposition 6.1.1, pp. 324–326; Proposition 2.8.1 and Corollary 2.8.3, pp. 156–158; Peter Scholze, Étale cohomology of diamonds, proof of Proposition 27.2, p. 164.)

For `m=0` and constant `F_ℓ, H⁰=F_ℓ` and all higher groups vanish. For a constant sheaf on a positive-dimensional ball the same result follows from the radial affine-space calculation. An infinite number of coordinates is excluded from this finite-dimensional assertion.

*Needs:* Section 11.1; `AdicEtaleGeometry`, layer A2 (`relative-closed-polydisc`); `AdicEtaleGeometry`, layer A2.6a (`analytification-etale-site`); `PerfectoidSpaces`, layer P7 (`perfection-tilde-limit`); `PerfectoidSpaces`, layer P7 (`etale-topos-invariance-under-inseparable-towers`); Layers 1 and 3.

Define `BallExhaustion` for analytic affine `m`-space over a complete nontrivially valued field `C`, with a fixed nonzero topologically nilpotent `t`, by `B_n=`{`|tⁿX_i|≤1` for all `i`}, `n≥0`. Use the analytic spaces and their increasing open exhaustion from the geometry suppliers; the radius is `|t|⁻ⁿ`. In characteristic `p` choose compatible roots `t_k` with `t_k^(p^k`)`=t` and define the ball of exponent a/`p^k` by `|t_k^a X_i|≤1`. For these rational indices `B_a⊆B_b` if `a≤b`, and the closure of `B_1` in affine space is the intersection of `B_a` for `a>1` in `Z[1/p]`. Define `radiusBall(X,t,T,n)` to be the subset of the ambient valuation locus `X` satisfying `tⁿT_i≤`ᵥ1 for every coordinate. Perfected balls `Spa C⟨(tⁿX_i)^(1/p^∞)⟩` have the same underlying space and étale topos through the perfectoid supplier. The finite-dimensional exhaustion is the scope here.

This uses `m` finite; `C` complete and nontrivially valued; `t` nonzero and topologically nilpotent; use the affine-space coordinates and geometry-supplier exhaustion; Fractional exponents require chosen compatible `p`-power roots.

(Peter Scholze, Étale cohomology of diamonds, proof of Proposition 27.2, p. 164.)

Provide `radiusBall_mem`: `x∈radiusBall(X,t,T,n)` iff `x∈X` and every `tⁿ T_i≤`ᵥ1; `radiusBall_zero`: At `n=0` the coordinate inequalities are `T_i≤`ᵥ1; `radiusBall_mono`: If every `x∈X` satisfies `t≤`ᵥ1, radiusBall `n⊂radiusBall(n+1)`; `radiusBall_dimensionZero`: With no coordinates the ball is exactly `X`.

Provide `radiusBall_polydisc`: For `n=0` and `X` the pinned closedPolydisc set with its weightedX coordinates, the radiusBall set equals that closedPolydisc. This set equality does not provide the missing affine-space site; `radiusBall_baseChange`: Pullback along a compatible point map that preserves coordinate valuation comparisons gives the ball formed from pulled-back `t` and `T`; `radiusBall_exhaustive`: Under the full analytic affine-space hypotheses and topological nilpotence, the union over `n≥1` is the whole analytification; `radiusBall_pow`: `radiusBall(X, s^j, T, n) = radiusBall(X, s, T, j·n)`; with `s^j = t` this is the ball of fractional exponent in `t`, defined through a chosen root.

**Checks.**

- For Fin 0 coordinates, every ball equals `X`.
- If `t=1`, radiusBall `n` is independent of `n`; it need not exhaust affine space.
- At `n=0` on closedPolydisc, the set is exactly the existing Tau Ceti closedPolydisc.
- For one coordinate, `n=1` membership is exactly tT`≤`ᵥ1; the outer radius is `|t|⁻¹`, not `|t|`.

`A` larger exponent gives a larger ball; the union over `n` covers rank-two points because every coordinate is bounded at every point of the analytification.

*Needs:* `AdicSpacesPartII`, layer R1 (`analytic-affine-space`); `AdicEtaleGeometry`, layer A2 (`analytification-relative-polydisc-comparison`); `AdicEtaleGeometry`, layer A2 (`relative-closed-polydisc`); `PerfectoidSpaces`, layer P7 (`perfection-tilde-limit`); Tau Ceti TauCeti.ValuationSpectrum.closedPolydisc; Tau Ceti TauCeti.ValuationSpectrum.comap; Tau Ceti `TauCeti.ValuationSpectrum.comap_mem_spa`.

With `C=`completed algebraic closure of `F_p((t)), ℓ≠p, m` finite and constructible coefficients descended from `F_p` affine space, the restriction `RΓ(B_n,A)→RΓ(B_1,A)` is an equivalence for some `n>1` in `ℤ[1/p]` sufficiently close to 1 and for the cofinal geometric sequence of radii `n^j` obtained by scaling. The proof requires both finite total cohomology and overconvergent neighborhood continuity: `colim_{n>1,n→1} H^q(B_n,A)≅H^q(B_1,A)`. Automorphisms over `F_p` sending `t` to `tⁿ` yield equal finite dimensions, but they alone do not prove that the restriction maps are isomorphisms. Uniform surjectivity in the finitely many degrees, followed by equal finite cardinality, does.

This uses Coefficient object is pulled back from `F_p`; scaling of `C` fixes those coefficients; Positive rational `p`-power indices and their chosen roots; overconvergence of the analytified sheaf; finite total `Fℓ` cohomology.

(Peter Scholze, Étale cohomology of diamonds, proof of Proposition 27.2, p. 164.)

Abstractly isomorphic vector spaces with zero transition maps fail the statement; `m=0` and constant coefficients produce identity maps.

*Needs:* Section 11.2; Layers 1 and 3.

Under the preceding `F_p` descent, finite-dimension and overconvergence hypotheses, `RΓ((A^m_C)^ad,A^ad)≅Rlim_j RΓ(B_(n^j),A^ad)≅RΓ(B_1,A^ad)`. Finite-type algebraic/analytic comparison then identifies `RΓ(A^m_C,A)` with the last object. Coordinate perfection is admitted only through the imported étale equivalence/continuity. The first limit is derived and inverse, coming from restriction on an increasing open cover; it is distinct from the filtered direct limit over shrinking neighborhoods used to prove stabilization. This comparison supplies the classical input to Scholze’`s` Proposition 27.2.

This uses All hypotheses of radius stabilization; actual exhaustion of analytic affine space; constructible algebraic coefficients.

(Peter Scholze, Étale cohomology of diamonds, proof of Proposition 27.2, p. 164.)

Test `m=2` to detect the missing relative duality input; maintain canonical coefficient and coordinate functoriality.

*Needs:* Section 11.1; Section 11.2; `EnhancedDerivedSheaves`, §§0.1–0.4.

### 11.3 Frontier contributions and compactification duality

Let `C` be algebraically closed complete nonarchimedean, `X` a quasi-compact separated smooth rigid curve over `Spa(C, O_C), j: U → X` a quasi-compact open and `ℓ` a prime invertible in `O_C`. The frontier `B = Ū∖U` of `U` in the adic space `X` is a finite discrete set of points (by Section 8.2; for `0 < |a| ≤ |b| < 1` in the closed unit disc it consists of the two rank-two points of Ito’`s` Example `A`.1). For `M ∈ D(F_ℓ)`, let `α_X: j_`!`M → RHom(Rj_*F_ℓ, M)` be the map adjoint to `j_`!`M ⊗ Rj_*F_ℓ = j_`!`(M ⊗ j^*Rj_*F_ℓ) = j_`!`M → M`. Then `α_X` is an isomorphism over `U` and over the complement of `Ū`, its `cone` is supported on `B`, and `RΓ(X, cone(α_X))` is the direct sum over `b ∈ B` of contributions that depend only on an open neighbourhood of `b` in `X`.

This uses `C` algebraically closed complete with plus ring `O_C`; `X` quasi-compact separated smooth of pure dimension one; `j` quasi-compact open; `ℓ` invertible in `O_C`; No compactification of `X` is used in this statement.

(Peter Scholze, Étale cohomology of diamonds, proof of Theorem 25.1, p. 160.)

**Checks.**

- For `U = X` the frontier is empty and `α_X` is an isomorphism.
- For `0 < |a| ≤ |b| < 1`, the closed annulus in the closed unit disc has frontier `{η(a),η(b)′}`, including the equal-radius circle.
- For `0 < |a| < |b| = 1`, the frontier inside the closed unit disc is `{η(a)}`: the exterior refinement `η(b)′` has full rank-two value `|T| > 1` and lies outside the ambient disc. For `|a| = |b| = 1`, only the inner refinement remains as well.

*Needs:* Section 1.2; Section 9.2; `EnhancedDerivedSheaves`, §§0.1–0.4; Section 8.2.

In the situation of curve-boundary-contributions, let `V ⊆ X` be a quasi-compact open and `i: V → X′` an open immersion into a proper smooth rigid curve over `C`. Write `U_V = U ∩ V, j′: U_V → X′` and `α_{X′}: j′_`!`M → RHom(Rj′_*F_ℓ, M)`. Then `i^*cone(α_{X′}) = cone(α_X)|_V`, the frontier of `U_V` in `X′` is finite and discrete, and for every frontier point `b` of `U` in `X` that lies in `V`, with `V` a neighbourhood of `b` on which `U_V = U ∩ V`, the contribution of `b` to `RΓ(X, cone(α_X))` is a direct summand of `RΓ(X′, cone(α_{X′}))`, by an explicit inclusion and projection. Consequently, if every frontier point of `U` has such a neighbourhood (the local form `(L)` of the compactification export) and `RΓ(X′,α_{X′})` is an isomorphism for every proper smooth curve `X′` and quasi-compact open, then `RΓ(X,α_X)` is an isomorphism. For `V = X` this is the statement in ECD's proof of Theorem 25.1.

This uses The hypotheses of curve-boundary-contributions; For each frontier point, a quasi-compact open neighbourhood with an open immersion into a proper smooth rigid curve; a single embedding of `X` is not required; The frontier is the topological frontier in the adic space; its points are of rank two, not classical boundary points.

(Peter Scholze, Étale cohomology of diamonds, proof of Theorem 25.1, p. 160.)

The inclusion and projection of a single frontier contribution compose to the identity on that contribution. If the total proper-curve contribution complex is zero, each summand is zero, and the global `cone` on `X` is zero. This tests global sections, not a stalkwise isomorphism of `α_X`.

*Needs:* Section 11.3; Section 1.2.

Let `X′` be a proper smooth rigid curve over `Spa(C, O_C), f` its structure map, `j: U → X′` a quasi-compact open, `ℓ` invertible in `O_C`, and `N ∈ D(F_ℓ)` with `M = N(1)[2] = f^!N` in the normalisation of Layers 8–9. Then `RΓ(X′, RHom(Rj_*F_ℓ, M)) ≃ RHom_{D(F_ℓ)}(RΓ(U, F_ℓ), N)` and `RΓ(X′, j_!M) = RΓ_c(U, N(1)[2])`, and the map between them induced by `α_{X′}` is the map given by the Poincaré duality pairing `RΓ_c(U, F_ℓ(1))[2] ⊗ RΓ(U, F_ℓ) → F_ℓ` of Layers 8–9; it is an isomorphism. Hence `α_{X′}` induces an isomorphism on global sections for every `M`, and with curve-boundary-direct-summand and the local form of the compactification export, `α_X` induces an isomorphism on global sections for every quasi-compact separated smooth rigid curve `X` over `C` and quasi-compact open `U`. This applies Layers 8–9's curve duality; it does not plan a second duality theorem.

This uses `C` is algebraically closed and complete, with plus ring `O_C`; `ℓ` is invertible in `O_C, X′` is proper smooth of pure dimension one, and `U` is qc open. The local compactification in Section 8.2 supplies the extension to general qc separated smooth curves; Arbitrary `N` is reduced to `N=F_ℓ` using the finite cohomology and colimit preservation of the two global functors.

(Peter Scholze, Étale cohomology of diamonds, proof of Theorem 25.1, p. 160.)

For `U=X′` this is the proper curve duality pairing. For the closed unit disc inside `P¹` it gives a global equivalence; this does not imply that the map `α` of sheaves is an isomorphism at its frontier points.

*Needs:* Section 11.3; Section 8.2; Section 9.6; Section 9.2; `EnhancedDerivedSheaves`, §§0.1–0.4.

### Examples

Over `C`, the completed algebraic closure of `F_p((t))`, fix `ℓ≠p` and exhaust affine `m`-space by the closed balls `B_(aʲ)={|T_i|≤|t|⁻ᵃʲ}`, with `a>1` in `Z[1/p]` sufficiently close to 1. Restriction goes from a larger ball to a smaller one; ordinary cohomology of the union is the derived inverse limit of these actual restriction maps. For a constructible sheaf pulled back from `F_p` affine space, finite total cohomology and overconvergent neighborhood continuity give the stabilized restriction maps of Section 11.2. Merely knowing that consecutive finite cohomology groups have equal cardinality would not prove stabilization: a sequence of zero endomorphisms of a nonzero finite group has equal cardinalities and no invertible transition. (Huber (1996), Corollary 2.8.3, p. 158; Scholze, *Étale cohomology of diamonds*, proof of Proposition 27.2, p. 164.)

For the identity open immersion `U=X` in a qc separated smooth curve, the frontier is empty and the `cone` of `j`!`M→RHom(Rj*F_ℓ,M)` is zero. For a strict interior annulus in a closed disc the frontier has two rank-two endpoint refinements, and its `cone` contributions localize there. A proper compactification supplies global curve duality; the conclusion is an isomorphism after `RΓ`, not an assertion that every boundary stalk map is an isomorphism. The semistable `O_C`-model used for this argument also exists for `C=C_p`, whose valuation is nondiscrete; the DVR approximation theorem does not by itself prove that case. (Ito, Appendix `A`, Example `A`.1, pp. 46–47; Scholze, *Étale cohomology of diamonds*, proof of Theorem 25.1, pp. 159–160; Li–Reinecke–Zavyalov, Proposition 4.1.6, pp. 30–31.)

### Dependencies

Use Layers 1–10, the analytification and algebraic lci geometry of `AdicSpacesPartII`, layers R0–R1, and `AdicSpacesPartIII`, layers R2–R3, and scheme comparison from `SchemeAndStackFoundations`, Layer 2. Relative purity and normal-crossing complement cohomology in Section 11.1 supply the nonproper algebraic comparison in its precise coefficient scopes. Characteristic-zero resolution is `AlgebraicModuliForArithmeticGeometry`, Layer 9, Section 9.7 (`relativeEmbeddedResolution`). Section 8.2 supplies compatible `O_C`-models and the finite rank-two frontier; Section 9.6 supplies smooth curve duality. Section 11.2 uses the actual restriction maps and `EnhancedDerivedSheaves`, §§0.1–0.4, for derived inverse limits. Section 11.3 proves the global compactification pairing from local frontier contributions.

## Downstream consumers

`DiamondsAndVStacks` uses supported classical étale topoi and their continuity. `DiamondSixOperations` uses valuation comparison, arbitrary-rank proper supports, smooth-family constructibility, the finite-ball calculation and curve boundary duality. Coefficient-comparison consumers use the preadic local-system categories, actual base-change transformations, finite coefficient traces and the separately scoped integral trace. The classical comparisons are supplied as natural transformations, with their coefficient and support conditions, so that those roadmaps can identify the resulting functors rather than compare numerical cohomology groups.

`GeneralBasesFourierAndCorrespondences` uses valuation nearby cycles and the AIC generic-extension equivalence. A normalization of a general coherent base in a geometric generic field still needs its own descent from valuation tests; the valuation theorem is not a statement over every such normalization. `TropicalAndBerkovichArithmetic` uses the strict analytic carrier, the taut adic comparison, analytic coverings and the Tate quotient constructed here. Crystalline, prismatic and arithmetic applications use the semistable nearby-cycle symbol and differential filtration with the ramification index retained.

## References

Locators in the layers refer to the printed pages of the stated edition. Stacks tags are stable identifiers on unpaginated pages. For the following preprints, use the indicated version where one is specified.

- R. Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*, Aspects of Mathematics E30, Vieweg, 1996. [Publisher](https://doi.org/10.1007/978-3-663-09991-8).
- R. Huber, “Étale cohomology of henselian rings and cohomology of abstract Riemann surfaces of fields,” *Mathematische Annalen* 295 (1993), 703–708. [GDZ](https://gdz.sub.uni-goettingen.de/id/PPN235181684_0295).
- R. Huber, “Continuous valuations,” *Mathematische Zeitschrift* 212 (1993), 455–477. [GDZ](https://gdz.sub.uni-goettingen.de/id/PPN266833020_0212).
- R. Huber, “A generalization of formal schemes and rigid analytic varieties,” *Mathematische Zeitschrift* 217 (1994), 513–551. [GDZ](https://gdz.sub.uni-goettingen.de/id/PPN266833020_0217).
- V. G. Berkovich, “Étale cohomology for non-Archimedean analytic spaces,” *Publications Mathématiques de l’IHÉS* 78 (1993), 5–161. [Numdam](https://www.numdam.org/item/PMIHES_1993__78__5_0/).
- V. G. Berkovich, “Vanishing cycles for formal schemes,” *Inventiones Mathematicae* 115 (1994), 539–571. [GDZ](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0115).
- A. J. de Jong, “Étale fundamental groups of non-Archimedean analytic spaces,” *Compositio Mathematica* 97 (1995), 89–118. [Numdam](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf).
- A. J. de Jong and M. van der Put, “Étale cohomology of rigid analytic spaces,” *Documenta Mathematica* 1 (1996), 1–56. [EMS](https://ems.press/content/serial-article-files/25781).
- A. J. de Jong, “Families of curves and alterations,” *Annales de l’Institut Fourier* 47 (1997), 599–621. [Numdam](https://www.numdam.org/item/10.5802/aif.1575.pdf).
- S. Bosch, W. Lütkebohmert and M. Raynaud, “Formal and rigid geometry IV. The reduced fibre theorem,” *Inventiones Mathematicae* 119 (1995), 361–398. [GDZ](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0119).
- W. Lütkebohmert, “The structure of proper rigid groups,” *Journal für die reine und angewandte Mathematik* 468 (1995), 167–219. [GDZ](https://gdz.sub.uni-goettingen.de/id/PPN243919689_0468).
- M. van der Put, “The class group of a one dimensional affinoid space,” *Annales de l’Institut Fourier* 30 (1980), no. 4, 155–164. [Numdam](https://www.numdam.org/item/AIF_1980__30_4_155_0/).
- M. Temkin, “Stable modification of relative curves,” arXiv:0707.3953v3. [arXiv](https://arxiv.org/abs/0707.3953v3).
- O. Gabber and L. Ramero, *Almost ring theory*, Lecture Notes in Mathematics 1800, 2003; arXiv:math/0201175v3. [arXiv](https://arxiv.org/abs/math/0201175v3).
- K. S. Kedlaya and R. Liu, *Relative p-adic Hodge theory: Foundations*, arXiv:1301.0792v5. [arXiv](https://arxiv.org/abs/1301.0792v5).
- T. Wedhorn, *Adic spaces*, arXiv:1910.05934. [arXiv](https://arxiv.org/abs/1910.05934).
- K. Fujiwara and F. Kato, *Foundations of Rigid Geometry I*, arXiv:1308.4734. [arXiv](https://arxiv.org/abs/1308.4734).
- B. Conrad, “Irreducible components of rigid spaces,” *Annales de l’Institut Fourier* 49 (1999), 473–541. [Author copy](https://math.stanford.edu/~conrad/papers/irredpaper.pdf).
- P. Scholze, “Perfectoid spaces,” *Publications Mathématiques de l’IHÉS* 116 (2012), 245–313. [arXiv](https://arxiv.org/abs/1111.4914).
- P. Scholze, “p-adic Hodge theory for rigid-analytic varieties,” *Forum of Mathematics, Pi* 1 (2013), e1, with its erratum. [Paper](https://arxiv.org/abs/1205.3463), [erratum](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf).
- P. Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4 and the author’s 14 April 2026 PDF, whose printed pagination is used for Theorem 24.1 and Proposition 27.2 and Theorem 25.1. [Author copy](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).
- P. Scholze and J. Weinstein, “Moduli of p-divisible groups,” *Cambridge Journal of Mathematics* 1 (2013), 145–237. [arXiv](https://arxiv.org/abs/1211.6357).
- P. Scholze and J. Weinstein, *Berkeley lectures on p-adic geometry*, 2020. [Author copy](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf).
- L. Fargues and P. Scholze, *Geometrization of the local Langlands correspondence*, arXiv:2102.13459. [arXiv](https://arxiv.org/abs/2102.13459).
- B. Bhatt, *Lecture notes for a class on perfectoid spaces*, 2017. [Author copy](https://www-personal.umich.edu/~bhattb/teaching/mat679w17/lectures.pdf).
- B. Bhatt and P. Scholze, “The pro-étale topology for schemes,” *Astérisque* 369 (2015), 99–201; layer locators use the 72-page author PDF, with published pages specified separately where needed. [Author copy](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf).
- B. Bhatt and D. Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, arXiv:2101.09759. [arXiv](https://arxiv.org/abs/2101.09759).
- D. Hansen, “Vanishing and comparison theorems in rigid analytic geometry,” arXiv:1708.07276. [arXiv](https://arxiv.org/abs/1708.07276).
- D. Hansen and P. Scholze, *Relative perversity*, 38-page author PDF. [Author copy](https://people.mpim-bonn.mpg.de/scholze/RelativePerverse.pdf).
- D. Hansen and B. Zavyalov, *Arithmetic properties of ℓ-adic étale cohomology and nearby cycles of rigid-analytic spaces*, arXiv:2301.01800. [arXiv](https://arxiv.org/abs/2301.01800).
- B. Zavyalov, *Some foundational results in adic geometry*, arXiv:2409.15516v2. [arXiv](https://arxiv.org/abs/2409.15516v2).
- B. Zavyalov, “Mod-p Poincaré duality in p-adic analytic geometry,” *Annals of Mathematics* 201 (2025); layer locators use the author’s 88-page preprint. [Author copy](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf).
- S. Li, E. Reinecke and B. Zavyalov, *Relative Poincaré duality in nonarchimedean geometry*, arXiv:2410.08200v1. [arXiv](https://arxiv.org/abs/2410.08200v1).
- H. Guo and E. Reinecke, *A prismatic approach to crystalline local systems*, published author copy. [Public copy](https://par.nsf.gov/servlets/purl/10534610).
- O. Hyodo, “A note on p-adic étale cohomology in the semi-stable reduction case,” *Inventiones Mathematicae* 91 (1988), 543–557. [GDZ](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0091).
- S. Bloch and K. Kato, “p-adic étale cohomology,” *Publications Mathématiques de l’IHÉS* 63 (1986), 107–152. [Numdam](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf).
- P. Colmez, G. Dospinescu and W. Nizioł, “Factorisation de la cohomologie étale p-adique de la tour de Drinfeld,” *Forum of Mathematics, Pi* 11 (2023), e16; layer locators use the paper’s internal pagination. [Publisher PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf).
- F. Orgogozo, *Modifications et cycles évanescents sur une base de dimension supérieure à un*, arXiv:math/0507475v1; published as “Modifications et cycles proches sur une base générale.” [arXiv](https://arxiv.org/abs/math/0507475v1).
- L. Illusie, *Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo*, 9 April 2006 author PDF. [Author copy](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf).
- L. Illusie, “Autour du théorème de monodromie locale,” *Astérisque* 223 (1994), 9–57, with the author's errata sheet. [Numdam](https://www.numdam.org/item/AST_1994__223__9_0/), [errata](https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrTML.pdf).
- A. Caraiani and P. Scholze, *On the generic part of the cohomology of non-compact unitary Shimura varieties*, author manuscript, §4.6, p. 63. [Author copy](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf).
- Q. Lu and W. Zheng, *Duality and nearby cycles over general bases*, arXiv:1712.10216v7. [arXiv](https://arxiv.org/abs/1712.10216v7).
- P. Deligne and N. Katz, directors, *Groupes de monodromie en géométrie algébrique (SGA 7 II)*, Lecture Notes in Mathematics 340, 1973; Exposé XIII by P. Deligne. [Public scan](https://publications.ias.edu/sites/default/files/Number12.pdf).
- K. Česnavičius, “Purity for the Brauer group,” *Duke Mathematical Journal* 168 (2019), 1461–1486. [Author copy](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf).
- K. Ito, *Uniform local constancy of étale cohomology of rigid analytic varieties*, arXiv:2008.07794. [arXiv](https://arxiv.org/abs/2008.07794).
- Y. Mieda, *Zelevinsky involution and ℓ-adic cohomology of the Rapoport–Zink tower*, author PDF. [Author copy](https://www.ms.u-tokyo.ac.jp/~mieda/pdf/RZ-Zel.pdf).
- T. Abe, *On the Serre conjecture for Artin characters in the geometric case*, arXiv:2405.19601v2. [arXiv](https://arxiv.org/abs/2405.19601v2).
- E. Yang and Y. Zhao, *Cohomological Milnor formula and Saito’s conjecture on characteristic classes*, arXiv:2209.11086v4. [arXiv](https://arxiv.org/abs/2209.11086v4).
- The Stacks Project authors, *The Stacks Project*. The layers give the individual chapter, section and tag. [Project](https://stacks.math.columbia.edu).

- Stacks project, Lemma 59.95.4 (tag [0F0T](https://stacks.math.columbia.edu/tag/0F0T)): transcendence-degree bound for field cohomological dimension.
