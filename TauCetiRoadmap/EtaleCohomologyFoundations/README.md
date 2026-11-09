# Étale cohomology foundations

**Summary.** This roadmap builds reusable scheme étale cohomology with finite, integral adic and rational coefficients. It supplies scheme compactifications, finite-cover monodromy, localization and proper supports, geometric base change and finiteness, general henselian-trait inertia, normalized adic realization, purity and duality, perverse sheaves, and the independent Frobenius and perfect-complex trace algebra used in arithmetic applications.

## Scope and ownership

This roadmap owns scheme compactification objects, Nagata existence and coherent common refinements; constructible étale module sheaves, finite étale Galois categories and the étale fundamental groupoid; finite Tate twists and topological invariance; coefficient and bounded-complex descent; étale extension by zero, localization, `D⁺` torsion lower shriek, finite traces and finite cycle classes; proper and smooth base change, local acyclicity, finite-coefficient Künneth, cohomological dimension and constructible finiteness; henselian-trait inertia and tame characters; stable lattices for compact groups over nonarchimedean local fields; normalized integral and rational adic realization; exceptional inverse image, duality, smooth Gysin maps, projective and blow-up formulas, weak Lefschetz and field perverse `t`-structures; finite-field descent, scheme/descent Frobenius comparison, perfect-complex trace algebra and free-torsor coefficient descent.

The generic derived enhancement, `K`-injective/`K`-flat replacements, coherent tensor–Hom and sheaf-level limits belong to EnhancedDerivedSheaves. Module-level derived tensor, towers, limits and completion belong to DerivedModuleAlgebra. Scheme sites, their universal-homeomorphism equivalences, scheme Frobenius and intersection geometry belong to SchemeAndStackFoundations; §F.0.4 supplies sheaf and cohomology transport along those equivalences.

Nearby and vanishing cycles, absolute purity and Lefschetz pencils belong to LefschetzPencilsAndVanishingCycles; analytic support geometry and analytic cohomology belong to ClassicalAdicEtaleCohomology; Betti and analytic comparison belong to ComplexComparisonPartII. Hilbert irreducibility, tame specialization and the arithmetic trace formulas belong to InverseGaloisAndArithmeticFundamentalGroups. The stable-lattice theorem covers nonarchimedean local fields, with finite `E/ℚ_ℓ` used by the adic consumers; coefficient-field descent in `ℚ̄_ℓ` and building comparisons are arithmetic representation theory.

The consumer roadmaps include LefschetzPencilsAndVanishingCycles, ClassicalAdicEtaleCohomology, ComplexComparisonPartII, InverseGaloisAndArithmeticFundamentalGroups, AbelianSchemesAndArithmeticModuli, NeronModelsAndSemistableAbelianVarieties, NeronModelsAndSemistableAbelianVarietiesPartII, ArithmeticGaloisRepresentations, ArithmeticGaloisDuality, DeligneWeightsAndPurity, AlgebraicModuliForArithmeticGeometry, FiniteFlatGroupsAndIntegralPadicHodgeTheory, ArithmeticLocallySymmetricSpaces, ModularCurvesPartII, DiamondEtaleCohomology, DiamondSixOperations, AutomorphicLFunctionsAndLocalFactors, GL2AutomorphicRepresentationsAndTransfer and ShimuraVarieties. Consumers use each interface on its stated coefficient and geometric domain. Scheme targets ClassicalCoefficients and ClassicalAlgebraic in §§0.5–0.11 are the common algebraic interfaces; analytic instantiations use these interfaces. Sections F.0–F.8, F.3a and F.10 supply the finite/adic coefficient, trait and trace inputs to nearby-cycle and pencil constructions. Sections F.0.A0–F.0.A2 supply the field, multiplicative-group, arithmetic-sequence and SchemeInertia inputs to arithmetic fundamental-group applications. Section F.4.0 supplies `ContinuousRep`, its `Iso`, `ofCharacter` and `baseChange`, `ContinuousRep.exists_stable_lattice_iff`, and `GaloisLattice.IntegralModel` with its generic-fibre, homothety and commensurability API to arithmetic representation applications; coefficient-field descent and building comparisons belong to those applications. Section F.3a supplies `VanishingCycles.tameCharacter_eq_inertiaTameCharacter`, including the henselian inertia/residue-Tate identifications and positive Kummer direction, to arithmetic representation and Néron-model applications.

## Conventions

Use Mathlib's scheme, morphism-class, sheaf, Galois-category, module and derived-category vocabulary, and adopt its API as it develops. Construct every specified missing interface in Tau Ceti. Names in this README are relative to `TauCetiRoadmap.EtaleCohomologyFoundations` in [Suggested.lean](Suggested.lean); implementation homes are the corresponding Tau Ceti algebraic-geometry, module and category-theory namespaces. The README specifies every target; the Lean file records only signatures supported by the pinned libraries.

Finite commutative coefficients `Λ` are killed by an integer `N≥1`. Invertibility of `N` is required only where stated: finite lissity, constructibility, finite-cover monodromy, localization and proper base change for torsion have no invertibility restriction. On Noetherian schemes constructibility means a finite locally closed stratification with finite lisse restrictions; on locally Noetherian schemes it is tested on affine opens. `Dᵇ_c` and `Dᵇ_ctf` differ by finite Tor amplitude. A noetherian coefficient ring in §§0.5–0.6 permits finitely generated infinite modules. Statements allowing an arbitrary ring retain that generality.

Complexes are cohomological: `Hⁱ(K[r])=Hⁱ⁺ʳ(K)`. Thus `Λ(−d)[−2d]` is concentrated in degree `2d`. The unit and tensor associativity, Koszul signs, connecting maps and finite-group actions live in the enhancement before passing to the homotopy category. A bounded adic system has common cohomological and Tor intervals and coherent derived coefficient reductions; its realization is `Rlim`, with Milnor terms retained. Ordinary inverse limits of cohomology are used only after the appropriate ML comparison is proved.

A trait is `Spec R` for a henselian DVR, with a chosen separable closure of its fraction field, its normalization and geometric closed point; completeness is not assumed. Its residue characteristic is `p≥0`, and `ℓ` is a prime different from `p`. Tate twists use the canonical roots-of-unity sheaf and negative dual powers. Arithmetic `q`-Frobenius acts on coordinates by `q`-th power; geometric Frobenius is its inverse and acts on `ℚ_ℓ(1)` by `q⁻¹`. Point and hyperplane trace classes have degree `+1`. Compact-support lower shriek is `Rp_*j_!`, with its comparison to the right derived functor of the underived composite explicitly retained.

The mathematical targets below occur in prerequisite order. Labels F.2 and F.10 group interfaces whose proofs are interleaved with their required algebraic support and realization inputs; §F.3.0 precedes §F.2.6, §F.2.7 follows §F.3, and the finite and adic clauses of `VanishingCycles.frobeniusCohomology` are §§F.10.2 and F.10.2b.

## Exact supplier contracts

This table specifies the prerequisites of the roadmap. In particular, §F.10.3 depends on
AdicSpacesPartIII §R3.8 for commutative finite-projective trace, EnhancedDerivedSheaves
§§0.1–0.4 for the enhancement, DerivedModuleAlgebra §§0.2/1.E.0 for module-derived tensor
and perfectness, DGAInfinity Layer 5 for perfect/compact comparison, and
PadicMeasuresIwasawaAlgebras §5.1 for finite-projective determinants. PerfectoidSpaces P5.10–P5.12 and P7.15
are additional prerequisites for §0.5's conditional analytic instantiation.

| Supplier | Exact interface consumed |
| --- | --- |
| Mathlib, pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` | `AlgebraicGeometry.Scheme`, `Over`, pullbacks, `IsOpenImmersion`, `QuasiCompact`, `IsProper`, `IsSeparated`, `LocallyOfFiniteType`, `IsSchemeTheoreticallyDominant` and its flat-pullback API; schematic images; `Scheme.smallEtaleTopology`, `Scheme.AffineEtale.sheafEquiv`, `ModuleCat`, `SheafOfModules`, `DerivedCategory`, sheaf cohomology and derived functors; `CategoryTheory.GaloisCategory` and `CategoryTheory.FiberFunctor`; finite fields and `FiniteField.frobeniusAlgEquivOfAlgebraic`; finite projectives, matrices, trace and tensor products; henselian DVRs, valuation decomposition and inertia, ideal residue-action groups; nonarchimedean local fields and compact balls. |
| Tau Ceti finite étale schemes ([`FiniteEtale/Basic.lean` at `9b58aa7`](https://github.com/TauCetiProject/TauCeti/blob/9b58aa766a76235fda88e5b492731a0933188081/TauCeti/AlgebraicGeometry/FiniteEtale/Basic.lean)) | `TauCeti.FiniteEtaleScheme X`, its affine finite-étale-algebra anti-equivalence and its separably closed field comparison. This module is separate from the pinned interfaces in the next row; §F.0.2 uses its carrier and comparisons. |
| Tau Ceti, pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` | `TauCeti.AlgebraicGeometry.Fibers` supplies `TauCeti.genericFiber` and `TauCeti.specialFiber`; function-field place groups supply `TauCeti.Place.stabilizer_eq_decompositionSubgroup`, `TauCeti.Place.decompositionQuotientInertiaEquiv`, `TauCeti.Place.card_inertiaSubgroup`; `TauCeti.RepresentationTheory.BaseChange` supplies `Representation.baseChange`; existing affine blow-up charts and henselian roots of unity are used on their stated domains. |
| SchemeAndStackFoundations | Layer 0: §0.3 relative Proj, §0.8 étale coordinates, §0.9 limits/approximation, §§0.12–0.14 henselization, §0.21 excellence, §§0.23–0.23a universal homeomorphisms and their cover-preserving étale-site equivalences; §0.29 scheme Frobenius and its twists, iterates and base-change laws; Layer 1 effective descent; §§2.1–2.2 underlying abelian `D⁺` cohomology and Leray, §§2.5/2.7 derived and support foundations, §§2.9–2.11 module sheaves, finite étale sites, Hilbert 90 and Kummer, §2.15 étale descent/continuity, §2.16 Picard theory, §2.17 pro-étale comparison and completeness; §4.11 schematic strict transforms; Layer 5, especially §§5.3–5.5 projective bundles, Chern classes, normal bundles and deformation to the normal cone. |
| EnhancedDerivedSheaves | §§0.1–0.4: `ClassicalDerived.enhancedCategory`, `ClassicalDerived.replacements`, `ClassicalDerived.tensorHom`, `ClassicalDerived.inverseLimits`, `ClassicalDerived.derivedCompletion`, `ClassicalDerived.functorCoherence` and coefficient-forgetting comparisons; E0–E1 supply enhancement foundations and comparisons, E2 replete-topos inverse limits, E4 derived completion. All geometric equivalences require their proved geometric hypotheses. |
| DerivedModuleAlgebra | §0.I.1 module replacements, §0.2 derived tensor, §1.1 coherent module limits, §§1.2–1.5 completeness, reflector, unit and Koszul/quotient-tower comparison, and §1.T.1 tower `lim`/`lim¹`, ML and Milnor sequences. Quotient-tower completion retains bounded power-torsion or Noetherian hypotheses. EnhancedDerivedSheaves compares its sheaf constructions with these module inputs on the point site. |
| AdicSpacesPartIII | §R3.8 / `LinearMap.projectiveTrace`, `LinearMap.projectiveTrace_eq_trace`, `LinearMap.projectiveTrace_baseChange` and `LinearMap.projectiveTrace_cyclic` on commutative finite projective modules. |
| DGAInfinity | Layer 5 perfect/compact equivalence and finite semi-free retract description, specialized to the one-object DG category `R` in degree zero. |
| PadicMeasuresIwasawaAlgebras | §5.1 / `projectiveDeterminant`, `projectiveDeterminantMap` and their arbitrary-base-change API, including varying local rank. |
| StableReduction | Layer 4 Rees-algebra blowups (the admissible-blowup results are targets of §G.2 here); compactification extension, separation and gluing are targets of §G.2 here. |
| ModularCurves | Layer 0d finite étale field algebras and finite Galois sets; Layer 4D strict henselizations and their completions. |
| AlgebraicCurves | Layers 8 and 12 normalization and the curve/place dictionary for decomposition and inertia groups. |
| BelyiMaps | Layers 12–13, including §§12.5–12.6, punctured-line finite covers used in §F.0.A0. |
| ProfiniteArithmetic | Layers 0–1 profinite integers, their units and continuous exponentiation. |
| JacobianChallenge | Layer D pointed smooth proper field-curve Jacobian input for the algebraic smooth-curve trace and duality construction in §0.11. |
| PerfectoidSpaces | P5.10–P5.12 (qcqs étale 2-colimit and finite-stage detection) and P7.15 (étale-topos comparison for tilde-limits) only when instantiating §0.5's conditional analytic statement. The scheme descent theorem uses SchemeAndStackFoundations §0.9/§2.15. |

The scheme Frobenius contract is supplied by SchemeAndStackFoundations §0.29: `SchemeFrobenius.absoluteFrobenius`, `SchemeFrobenius.schemeFrobeniusTwist`, `SchemeFrobenius.relativeFrobenius`, `SchemeFrobenius.iteratedSchemeFrobenius` and `SchemeFrobenius.qPowerFrobenius`. A `p`-power map need not be `k`-linear; over finite `k` of cardinality `q` the `q`-power map is over `k`. Sections F.10.1–F.10.2b own its separate field-descent and cohomological comparison.

## G.1 Scheme compactification objects

The carrier and category here, together with §§G.2–G.3's existence and refinement API,
are the shared scheme compactification package in `TauCeti.AlgebraicGeometry`. Coherent and
étale proper-support functors use this package with their own coefficient categories.

**Scheme compactification objects — `Compactification`, `DenseCompactification`.**
For a separated finite-type morphism `f : X → S` with `S` qcqs, a `Compactification f`
contains a scheme `Xbar`, a quasi-compact open immersion `j : X → Xbar`, a proper
`p : Xbar → S`, and `j ≫ p = f`. A morphism `Compactification.Hom C D` is a scheme map
`h : C.Xbar → D.Xbar` satisfying `C.j ≫ h = D.j` and `h ≫ D.p = C.p`; identities and
composition give the compactification category. `DenseCompactification f` is its full
subcategory where `j` is schematically dense, expressed by Mathlib's
`IsSchemeTheoreticallyDominant j`. For a quasi-compact open immersion this also implies
topological density. The factorization carrier makes sense for any `f`; the existence
theorems below use the separated finite-type/qcqs hypotheses.

Supply transport along isomorphisms of the source, base and factorization, products over `S`,
restriction over base opens, and `Compactification.baseChange` along any `S' → S`.
`Compactification.denseReplacement` replaces `Xbar` by the schematic closure of `j(X)`,
with `Compactification.denseReplacementMap` as its canonical map to the original
compactification. Prove this is functorial and retains
the original open subscheme, including its nilpotents. Under arbitrary base change supply the
canonical map from the dense replacement after base change to the base change of the dense
replacement; it is an isomorphism for flat base change. Density of the pulled-back `j` is
asserted for flat base change. For arbitrary base change take dense replacement again.
These comparisons satisfy the identity and composition laws. `Compactification.identity`
is the dense identity choice when `f` is proper.

*Source:* Stacks, §38.32 (*Compactifications*), §29.7 (*Scheme theoretic closure and density*),
and §29.6 (*Scheme theoretic image*); the flat density API is also Mathlib's
`IsSchemeTheoreticallyDominant.of_isPullback`.
*Needs:* SchemeAndStackFoundations Layer 0 (scheme gluing and schematic images);
Mathlib `Scheme`, `Over`, pullbacks, `IsOpenImmersion`, `QuasiCompact`, `IsProper` and
`IsSchemeTheoreticallyDominant` with their isomorphism/composition/base-change APIs.

**Checks.**

- A proper `f` has `Xbar = X`, `j = id`, `p = f` as its identity compactification.
- `A¹_k ⊂ P¹_k` is a dense compactification with the single boundary point `∞`.
- For `Spec k[t,ε]/(ε²)` inside `P¹_{k[ε]/(ε²)}`, schematic closure keeps the square-zero
  structure. Taking the reduced closure would change the open subscheme.
  `Compactification.denseReplacement_dualNumber_section` states that the nonzero
  square-zero coefficient section survives dense replacement of any compactification.
- `D(t) ⊂ Spec k[t]` is schematically dense, but after base change to `t = 0` its interior
  is empty inside a point; the dense replacement there is empty
  (`Compactification.denseReplacement_specialFiber_empty`).

## G.2 Nagata compactification over a qcqs base

**Nagata compactification over a qcqs base — `nagataCompactification`.**
For every qcqs scheme `S` and separated finite-type `f : X → S`, construct a
`Compactification f`; applying `Compactification.denseReplacement` gives a
`DenseCompactification f`. The Lean existence theorem states `Nonempty (DenseCompactification f)`.
No Noetherian, field, finite-presentation or complex-base hypothesis is added to this theorem.

Build the geometric steps of the Noetherian proof: extension and composition of admissible
blowups over quasi-compact opens, their strict transforms, separation of closures of disjoint
constructible closed subsets by an admissible blowup, and gluing across a dense common open
after blowups. Establish enlargement of a compactified dense open and the two-open
compactifiability step. A finite affine cover with dense total intersection reduces existence
to affine embeddings and schematic closures in projective space. For a qcqs base, first
embed `X` as a closed subscheme of a separated finitely presented `X' → S`, descend `X'`
and separatedness through a Noetherian approximation of `S`, compactify at that stage, and
pull back. The schematic closure of `X` then supplies the compactification of the original
finite-type morphism; finite type must not be replaced by finite presentation.

*Source:* Stacks, §38.33, Lemmas 38.33.1–38.33.7 and Theorem 38.33.8
([0F41](https://stacks.math.columbia.edu/tag/0F41)); the reduction uses Limits,
Propositions 32.9.6 and 32.5.4, Lemmas 32.10.1 and 32.8.6.
*Needs:* §G.1; SchemeAndStackFoundations §0.9 (limits and approximation), scheme images
and gluing; StableReduction Layer 4's blowup geometry and SchemeAndStackFoundations §4.11's
schematic strict transforms. The admissible-blowup extension, disjoint-closure and gluing
results just specified are targets here, using the existing blowup carriers.

**Checks.**

- A proper morphism admits the identity choice of §G.1.
- `A¹_k → Spec k` admits `A¹_k ⊂ P¹_k` over any field `k`.
- The open immersion for a nonproper morphism need not be surjective; for the preceding
  affine line its boundary is nonempty.

## G.3 Common refinements and coherent comparison

**Common refinements and coherent comparison — `compactificationCommonRefinement`.**
For separated finite-type `f : X → S` with `S` qcqs and compactifications `C₁`, `C₂`, take
the schematic closure of `(j₁,j₂)(X)` in `C₁.Xbar ×_S C₂.Xbar`. It is a dense
compactification with proper projections to both choices fixing `X`. The Lean statement
supplies a dense `C` and `Compactification.Hom` maps from `C` to `C₁`, `C₂`.
Prove properness of every compactification morphism (`Compactification.Hom.proper`) and
finite-diagram refinement.
The dense full subcategory is nonempty and cofiltered, and two maps out of a dense
compactification into any fixed compactification agree, since the target is separated over `S`.
The Lean forms are `denseCompactification_cofiltered` and `denseCompactification_hom_unique`.
For nondense sources equalize parallel maps after dense replacement; agreement on the interior
does not itself assert equality on their extra components.

Export the canonical cones and their compatibility with products and base change. Under
arbitrary base change a refinement remains a refinement; use §G.1's dense replacement
to return to the dense subcategory. Flat base change also preserves the schematic-closure
construction. Prove the categorical comparison principle: a functor assigning equivalences
to refinement arrows, with its identity/composition laws, has canonical choice comparisons
independent of the refining cone, satisfying the identity, inverse, three-choice cocycle and
base-change laws. Coherent and étale consumers construct their own coefficient functors
and discharge these hypotheses; the geometry does not identify those functors.

*Source:* Stacks, Lemma 38.32.1, §29.7 (uniqueness on a schematically dense open), and
§63.9, Lemma 63.9.1 (the coefficient-specific use of coherent refinement comparisons).
*Needs:* §§G.1–G.2; schematic images, proper products and separated diagonals;
Mathlib's category/limit API. No étale base-change theorem is needed to construct the geometry.

**Checks.**

- A refinement of the proper identity choice has its specified comparison map to that choice.
- Comparisons among three compactifications satisfy `α₂₃ ∘ α₁₂ = α₁₃`.
- Refining `A¹ ⊂ P¹` leaves the étale consumer's forget-supports map unchanged once that
  consumer has proved its refinement equivalences.

## F.0.1 Finite and constructible étale module sheaves

**Finite and constructible étale module sheaves.** `VanishingCycles.constructibleEtale`.
Use sheaves valued in `ModuleCat Λ` on `Scheme.smallEtaleTopology`, transported through
`Scheme.AffineEtale.sheafEquiv` to the essentially small affine site. Extend geometric stalks
with their module structure, exactness, tensor/coefficient comparison and conservativity.
For coefficient hypotheses, express integer invertibility stalkwise and prove its affine,
residue-characteristic and `ℤ[1/N]`-factorization criteria, together with pullback/restriction
and divisor stability. Finite lisse means étale locally constant with finite module fibres. Build finite locally
closed stratifications, common refinements and the Noetherian/global versus locally
Noetherian/affine-local characterization above. Prove pullback and étale descent, support
and restriction, open–closed gluing, quasi-compact extension by zero, coefficient change,
and closure under finite limits, colimits, extensions and tensor products. Internal Hom
and dual statements retain finite-projective stalk hypotheses where required. These
constructions do not require `N` invertible. (SGA 4 IX §§2–3; Stacks §§59.64–59.65, 59.71–59.74.)
*Needs:* SchemeAndStackFoundations §§2.1, 2.9–2.10; Mathlib module sheaves, geometric points
and the small affine étale-site equivalence.

**Checks.**

- Over a separably closed point the finite coefficient category is finite `Λ`-modules.
- On `Spec ℝ`, the quadratic character yields a nonconstant rank-one `ℤ/3` local system.
- Affine-local stratifications on infinitely many components do not by themselves provide
  a single global finite stratification.

## F.0.2 Finite étale Galois categories and the étale fundamental groupoid

**Finite étale Galois categories and the étale fundamental groupoid.**
`VanishingCycles.finiteEtaleGaloisCategory`. For any scheme `X` use
`TauCeti.FiniteEtaleScheme X`, the finite étale full subcategory of `Over X` in
`TauCeti.AlgebraicGeometry.FiniteEtale.Basic`, together with that module's affine
finite-étale-algebra anti-equivalence and separably closed field comparison. Supply pullback,
finite coproducts, connected components, deck maps, effective descent and finite-group quotients
on this carrier. For every connected nonempty scheme `X`
verify `CategoryTheory.PreGaloisCategory`, `CategoryTheory.GaloisCategory` and the geometric
`CategoryTheory.FiberFunctor` axioms. Define `π₁` as the profinite automorphism group of that
functor and paths as natural isomorphisms of geometric fibre functors. Prove identity,
inverse, composition, nonemptiness within a component and simply transitive basepoint actions.
`VanishingCycles.lisseMonodromyEquiv` identifies finite lisse `Λ`-modules with continuous
finite `π₁`-module actions; finite covers correspond to finite continuous sets. A chosen
path gives tensor/dual transport and basepoint conjugation. For disconnected `X` use the groupoid of geometric fibre functors, with no global choice of basepoints; the connected-component description applies when components are open. Retain
`VanishingCycles.fieldSheavesEquiv` for all sheaves on a field and continuous discrete
Galois modules. No coefficient invertibility is required. (SGA 1 V §§4–7; SGA 4 VIII §2;
Mathlib's Galois-category fundamental theorem; Stacks 58.6.2, tag 0BND.)
*Needs:* §F.0.1 constructibleEtale; SchemeAndStackFoundations §§2.10, 2.15 (finite étale
sites and descent); Mathlib Galois categories; Tau Ceti's finite étale carrier and comparisons
from the module identified in the supplier table.

**Checks.**

- A separably closed field has trivial étale `π₁`; the finite-cover equivalence agrees with
  the supplied finite-set comparison, including the empty cover.
- A connected finite cover corresponds to a transitive action.
- On a locally Noetherian scheme, points in different connected components admit no étale path.
- `Spec(k[x₁,x₂,…])` has the based finite-cover and path API despite not being locally Noetherian; finite étale covers and their maps over qcqs schemes descend through affine approximation (Stacks 01ZM, 07RP).

## F.0.3 Finite Tate twists on the canonical roots-of-unity sheaf

**Finite Tate twists on the canonical roots-of-unity sheaf.** `VanishingCycles.etaleTateTwists`.
For `N` invertible on `X` and `NΛ = 0` use SchemeAndStackFoundations' `muEtale` and its Kummer
sequence: `Λ(1) = Λ ⊗_(ℤ/N) μ_N`. Define positive tensor powers, negative dual powers and all
integer twists. Prove twist addition, finite lissity, pullback/tensor/dual identities and
all coefficient reductions. A primitive root over a separably closed field gives a
coordinate, whose change is multiplication by a unit. Integral twists are systems realized
in F.4. (Stacks 03PL; SGA 4 IX.) *Needs:* §F.0.1 constructibleEtale;
SchemeAndStackFoundations §§2.9, 2.11; Kummer remains that roadmap's theorem.

**Checks.**

- With `Λ = ℤ/ℓ`, `Λ(1)` is `μ_ℓ`.
- Replacing `ζ` by `ζᵘ` multiplies the parametrization by `u` and the coordinate of a fixed element by `u⁻¹`.
- Arithmetic `q`-Frobenius acts on `μ_(ℓⁿ)` by `q` and geometric Frobenius by `q⁻¹`.

## F.0.4 Étale topological invariance

**Scheme Frobenius interfaces.** Consume SchemeAndStackFoundations §0.29's
`SchemeFrobenius.absoluteFrobenius`, `SchemeFrobenius.schemeFrobeniusTwist`,
`SchemeFrobenius.relativeFrobenius`, `SchemeFrobenius.iteratedSchemeFrobenius` and
`SchemeFrobenius.qPowerFrobenius`, with their characteristic-`p` hypotheses, specified twists,
universal-homeomorphism properties and coherent composition/base-change laws. Sections
F.10.1–F.10.2b construct their field-descent and cohomological comparisons.

*Source:* Stacks §33.36, Definitions 33.36.1 and 33.36.4, Lemmas 33.36.2–33.36.6,
Remark 33.36.11 (03SM, 0CC9, 0CC7, 0CC8, 0CCA, 0CCB, 0CCG).
*Needs:* SchemeAndStackFoundations §0.29.

**Checks.**

- Absolute `p`-Frobenius on `Spec 𝔽_(p²)` is not over `𝔽_(p²)`; its square is.
- Relative Frobenius on `𝔸¹_k` has codomain the specified twist; over `k=𝔽_q` the `q`-power map sends `T` to `T^q` and fixes `k`.
- Base-changing that `q`-power map to `k̄` fixes its scalars; absolute `q`-Frobenius on the base-changed scheme also raises those scalars to `q`-th powers and is a different map.

**Étale topological invariance.** `VanishingCycles.universalHomeomorphismEtaleEquivalence`.
For every universal homeomorphism `f:X→Y` consume SchemeAndStackFoundations §0.23a's
`universalHomeomorphismEtaleEquivalence`: the cover-preserving base-change equivalence
`Y_et ≃ X_et`, with identity, composition and base-change coherence. Construct its transport
to sheaves for every target category satisfying Mathlib's sheaf assumptions. Include
constants, module coefficients, stalks, sections and cohomology, with the induced coherence
and no Noetherian, finite-type or invertibility restriction. Apply this to the absolute and
relative scheme Frobenius of SchemeAndStackFoundations §0.29.
(Stacks §59.45, Theorem 59.45.2, 04DZ.)
*Needs:* SchemeAndStackFoundations §§0.23–0.23a, §0.29 and Layer 2; EnhancedDerivedSheaves §§0.1–0.4 for generic sheaf equivalences and derived transport.

**Checks.**

- A nilpotent thickening induces an equivalence of étale sites.
- The normalization of a cuspidal curve, a universal homeomorphism, induces the equivalence.
- Normalization of a nodal curve is not universally injective and does not meet the hypothesis.

## F.0.A1 Decomposition and inertia groups of a cover

**Decomposition and inertia groups of a cover.** Let `X` be a normal integral locally Noetherian
scheme, `L/K(X)` a finite Galois extension with group `G`, and `Y → X` the normalisation of `X` in
`L`, assumed finite (for instance `X` Nagata). For a point `y ∈ Y` over `x ∈ X` (or an extension of a
valuation), the decomposition group `D_y ⊂ G` is the stabiliser of `y` and the inertia group
`I_y ⊂ D_y` is the kernel of the action of `D_y` on the residue field `κ(y)`. Conjugating `y` by
`g ∈ G` conjugates `D_y` and `I_y` by `g`. When the residue extension `κ(y)/κ(x)` is separable, the
stabiliser of a geometric point lifting `y` is `I_y`, not `D_y`. For a curve, at a discrete valuation
with separable residue extension, `D_y/I_y ≅ Gal(κ(y)/κ(x))`; `|I_y| = e` holds under the defectless
hypotheses of the valuation theory, in particular for curves in characteristic zero. For an
intermediate cover with group `H ⊂ G`, the `D_y`-orbits on `G/H` index points of the intermediate normalization above `x`. For defectless discrete valuations with separable residue extensions, inertia-orbit lengths are ramification indices, and the numbers of inertia orbits within a decomposition orbit are residue degrees. No ramification-index formula is asserted at arbitrary higher-codimension scheme points. Define `SchemeInertia` with
`SchemeInertia.decomposition`, the stabiliser of the point or valuation, with the geometric lift
having inertia stabiliser under separability; `SchemeInertia.inertia`, the kernel of the
residue-field action inside `D_y`; `SchemeInertia.conjugate`, transport to `gy` by conjugation by
`g`; and `SchemeInertia.intermediateOrbits`, the orbit description on `G/H`, with orbit lengths of
inertia equal to ramification indices for defectless discrete valuations with separable residue extensions. For curves, that is for
places of a Galois extension of function fields, these groups and the
identities `D/I ≅ Aut(κ(y)/κ(x))` and `|I| = e` (separable residue extension) are Tau Ceti's
`TauCeti.Place.stabilizer_eq_decompositionSubgroup`, `TauCeti.Place.decompositionQuotientInertiaEquiv`
and `TauCeti.Place.card_inertiaSubgroup`; this target is their scheme-theoretic form, which must agree
with them on normal curves. *Proof sketch.* Use normalisation and integral closure, Mathlib's
decomposition and inertia groups of primes in a Galois extension of integral domains (the surjection
of the stabiliser onto the automorphisms of the residue extension and the order of inertia) and the
function-field results just named with the curve dictionary of AlgebraicCurves Layers 8 and 12, and
compute geometric fibres as coset spaces of the finite Galois action. Source:
[SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé V, §2, pp. 92–96, and Exposé X, Lemma 3.6,
pp. 214–215. *Needs:* Supplied by §F.0.2 /
`VanishingCycles.finiteEtaleGaloisCategory`; SchemeAndStackFoundations Layer 0;
AlgebraicCurves Layers 8 and 12; Mathlib `Ideal.inertia`, `Ideal.Quotient.stabilizerHom_surjective`,
`Ideal.Quotient.stabilizerQuotientInertiaEquiv`, `Ideal.card_inertia_eq_ramificationIdxIn`; Tau Ceti
`TauCeti.Place.stabilizer_eq_decompositionSubgroup`,
`TauCeti.Place.decompositionQuotientInertiaEquiv`, `TauCeti.Place.card_inertiaSubgroup`.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
schemes and the geometric fibre-functor groupoid.

**Checks.**

- For the cover `z ↦ z^n` of `𝔸¹` in characteristic zero, the inertia group at `0` is the cyclic
  group of order `n` and the inertia group at a point over `1` is trivial.
- For an unramified extension of local fields `I = 1` and `D` is the Galois group of the residue
  extension.
- For `A=𝔽₂(u)[[t]]` and `L=Frac(A)(α)`, `α²−tα−u=0`, `A[α]` is a DVR with `e=1` and purely inseparable residue degree 2. The nontrivial automorphism sends `α` to `α+t`, so `I=C₂` has a regular orbit of length 2 despite defect 1; separability is essential.
- For the Artin–Schreier cover `y^p − y = x` of `𝔸¹` in characteristic `p`, the inertia group at
  infinity is a nontrivial `p`-group, so tame ramification fails there.

## F.0.A0 The fundamental groups of a field and of `𝔾_m`

**The fundamental groups of a field and of `𝔾_m`.** For any field `K` with a separable closure
`K^sep`, identify `π₁^ét(Spec K, Spec K^sep)` with `Gal(K^sep/K)` as profinite groups, compatibly
with the identification of finite étale `K`-algebras with finite continuous `Gal(K^sep/K)`-sets of
ModularCurves Layer 0d. For an algebraically closed field `K` of characteristic zero, identify
`π₁^ét(𝔾_{m,K}, 1)` with the Tate module `lim_n μ_n(K)`, the limit taken along the `d`-th power maps
`μ_{nd}(K) → μ_n(K)`: the degree-`n` power cover `z ↦ z^n` has fibre `μ_n(K)` over `1`, and every
connected finite étale cover of `𝔾_{m,K}` is one of these. A compatible system of primitive roots of
unity `(ζ_n)` gives the parametrization `e_ζ : ẑ → T`, `a ↦ (ζ_n^a)_n`, where
`T = lim_n μ_n(K)`, and its inverse coordinate map `c_ζ : T → ẑ`. For a unit `u ∈ ẑ^×`, write
`[u] : ẑ → ẑ` for multiplication by `u`. Then `e_(ζ^u) = e_ζ ∘ [u]` and
`c_(ζ^u) = [u⁻¹] ∘ c_ζ`. The Tate-module identification is canonical, while these maps depend on
the chosen roots. The punctured-line instances used for the thrice-punctured
line are those of BelyiMaps Layers 12.5–12.6, and the profinite integers are the ring of
ProfiniteArithmetic Layer 0. *Proof sketch.* Match the affine fibre of a finite étale `K`-algebra
with its set of `K^sep`-points; for `𝔾_m`, match the power covers and their fibres with the tower
`μ_n(K)`, using that in characteristic zero every finite étale cover of `𝔾_m` over an algebraically
closed field is a Kummer cover. Source: [SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé V,
Proposition 8.1, p. 117, and Exposé XIII, Corollary 2.12, p. 290. *Needs:* Supplied by
§F.0.2 / `VanishingCycles.finiteEtaleGaloisCategory`; ModularCurves
Layer 0d; BelyiMaps Layers 12 and 13; ProfiniteArithmetic Layer 0.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
schemes and the geometric fibre-functor groupoid.

**Checks.**

- For a separably closed field `K = K^sep` the group is trivial, so a definition producing the
  absolute Galois group of a different field (for example of the prime field) would fail here.
- Over `ℂ`, the fibre of the degree-`n` power cover of `𝔾_m` over `1` is `μ_n(ℂ)`, of cardinality
  `n`, with `π₁` acting through `ẑ → ℤ/n` once a primitive `n`-th root is fixed.
- Replacing `(ζ_n)` by `(ζ_n^u)` multiplies the forward parametrization by `u` and the coordinate
  of a fixed Tate-module element by `u⁻¹`, leaving the intrinsic identification unchanged.
- If `u ≡ 2 mod 5`, the fixed element `(ζ_n)_n` has coordinate `1` in the original basis and
  coordinate `3 mod 5` in the new basis, since `(ζ₅²)³ = ζ₅`; the residue `2` does not give its
  new coordinate. Complex conjugation alone cannot distinguish the formulas, since `−1` is its
  own inverse.

## F.0.A2 The arithmetic fundamental-group sequence

**The arithmetic fundamental-group sequence.** Let `X` be a quasi-compact, geometrically connected
scheme over a field `k`, and `x̄` a geometric point of `X_{k̄}`. The natural continuous homomorphisms
form an exact sequence of profinite groups

`1 → π₁^ét(X_{k̄}, x̄) → π₁^ét(X, x̄) → Γ_k → 1`.

Here `k̄` is an algebraic closure of `k`; in positive characteristic an arbitrary algebraically closed
overfield would not do. A `k`-rational point `a` of `X` gives a continuous section `s_a`, defined
after the choice of an étale path from `x̄` to the geometric point over `a`; for a fixed `a`, changing
the path changes `s_a` by conjugation by an element of `π₁^ét(X_{k̄}, x̄)`. Different rational points
can give sections that are not conjugate under `π₁^ét(X, x̄)`. Exactness alone chooses no section. The
induced outer action `Γ_k → Out(π₁^ét(X_{k̄}, x̄))` does not depend on any section, and is a separate
datum from the conjugacy class of a section. *Proof sketch.* Descend finite étale
covers of `X_{k̄}` and their morphisms to `X_{k'}` for finite separable `k'/k`; apply the exact
sequence of the finite Galois cover `X_{k'} → X` and pass to the inverse limit; a rational point
gives a section of schemes and hence of groups. Source: [SGA 1](https://arxiv.org/pdf/math/0206203v2),
Exposé IX, Theorem 6.1 and Corollary 6.4, pp. 195–196. *Needs:* §F.0.A0; Supplied by §F.0.2 /
`VanishingCycles.finiteEtaleGaloisCategory` (fundamental groups, paths, functoriality);
SchemeAndStackFoundations Layer 1 (descent).
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
schemes and the geometric fibre-functor groupoid.

**Checks.**

- For `X = Spec k`, the geometric group is trivial and `π₁^ét(Spec k) → Γ_k` is the identification
  of §F.0.A0.
- For `X = 𝔾_{m,ℚ}` and the rational point `1`, the section exists, and conjugation through it acts
  on the geometric group `ẑ(1)` by the cyclotomic character; exactness alone does not choose this
  section, and a different rational point `a` gives the section twisted by the Kummer cocycle of
  `a`.
- The rational points `1` and `2` of `𝔾_{m,ℚ}` give nonconjugate sections. The connected double cover
  `z² = t` is a quotient `π₁^ét(𝔾_{m,ℚ}) ↠ C₂`; composed with `s_1` it is the trivial character of
  `Γ_ℚ`, the fibre over `1` being split, and composed with `s_2` it is the character of `ℚ(√2)`.
  Conjugate sections have equal composites with a map to the abelian group `C₂`.

## 0.5 Finite-presentation geometry and coefficient descent

**Finite diagrams with coefficients.** Provide `ClassicalCoefficients.finitePresentationDescent`: for `X=lim X_i` with `X_i` qcqs schemes and affine transition maps, finite diagrams of finitely presented `X`-spaces, their maps, finite covering families and finitely presented coefficient modules descend to a common stage; equalities are detected after enlargement. For geometric descent and noetherian approximation use `SchemeAndStackFoundations`, §0.9, `finite_presentation_limits` and `noetherian_approximation`. For a noetherian coefficient ring `Λ`, descend constructible `Λ`-sheaves by a finite constructible stratification, finite étale trivializations on each stratum and the finite gluing diagram. This includes infinite finite-type `Λ`-modules, not just finite sets. For analytic spaces use finite qcqs étale trivialization and gluing data; the coefficient descent assertion is conditional on a qcqs étale-site 2-colimit with finite covering detection, assumed as a proved site-continuity hypothesis (for example the domains supplied by PerfectoidSpaces P5.10–P5.12 (qcqs étale 2-colimit and finite-stage detection) and P7.15 (étale-topos comparison for tilde-limits)); no arbitrary analytic tilde-limit is asserted to have it. (Stacks, Limits of Schemes, Lemma 32.10.1, tag 01ZM; Étale Cohomology, §§59.51 and 59.73; SGA 4, Exposé VI, §8.)

**Checks.**

- A constant identity system descends the same finite diagram and coefficient sheaf.
- A finite collection of objects descending separately has a common stage by filteredness.
- A merely finite-type scheme over a nonnoetherian ring with infinitely generated relations is not covered by the finite-presentation assertion.

*Needs:* `SchemeAndStackFoundations`, §0.9 and §2.15 (`etale_cohomology_limits`); Mathlib's finite presentation and constructibility; a proved site-continuity hypothesis for analytic use.

## 0.6 Constructible complexes and Hom descent

**Constructible derived continuity.** Under Section 0.5's hypotheses with fixed noetherian `Λ`, provide `ClassicalCoefficients.constructibleDerivedDescent`: every bounded complex with constructible cohomology descends to a bounded constructible complex at a stage. Descend its finite Postnikov diagram, attaching maps and relations together, by constructible sheaf descent and étale cohomology continuity. No assertion descends arbitrary unbounded complexes to one stage. (SGA 4, Exposé VI, §§8.5–8.7; Stacks, Theorem 59.51.3, tag 09YQ, and §59.73; Huber (1996), Proposition 2.4.4 and Corollary 2.4.6, pp. 127–129, for the classical analytic site input.)

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; §0.5; SchemeAndStackFoundations §2.15. Analytic instantiations require §0.5's proved site-continuity hypothesis.

**Checks.**

- Degree-zero complexes give constructible sheaf descent.
- A finite extension class descends with its two end terms after enlargement.
- A complex in a fixed interval `[a,b]` descends its finite Postnikov diagram; the theorem supplies no stage for an infinite sequence of independent attaching maps.

**Constructible Hom continuity.** Under the same hypotheses, for descended bounded constructible `K_i,L_i`, provide `ClassicalCoefficients.constructibleHomContinuity`: the filtered colimit of `Hom(K_j,L_j[r])` is `Hom(K,L[r])` for each fixed `r`. A finite set of maps, triangles and equalities descends simultaneously; equalities are detected at a stage. Prove the assertion by induction on cohomological amplitude and sheaf Ext continuity. (SGA 4, Exposé VI, §§8.5–8.7; Stacks, Theorem 59.51.3, tag 09YQ, and §59.73; Huber (1996), Proposition 2.4.4 and Corollary 2.4.6.)

**Checks.**

- For sheaves and `r=0`, this is descent of constructible sheaf morphisms.
- An extension class becoming zero on the limit is zero after some enlargement.
- A finite commutative triangle descends with its equality; infinitely many independently chosen maps have no asserted common stage.

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; this roadmap §0.5; `SchemeAndStackFoundations`, §2.15 for scheme cohomology continuity; analytic use requires the proved site-continuity hypothesis of §0.5.

## 0.7 Derived localization with supports

For every open immersion `j:U→X` of schemes and every coefficient ring `Λ`, construct abelian extension by zero as the left adjoint of restriction, with the original stalks on `U` and zero stalks on its complement. Prove exactness, full faithfulness, composition, arbitrary scheme base change and agreement with abelian extension by zero after forgetting `Λ`. Its termwise action on complexes preserves quasi-isomorphisms and defines the enhanced derived `j_!` of EnhancedDerivedSheaves §0.4; identify its cohomology sheaves with `j_!Hⁱ(K)`, and its degree-zero restriction with the abelian functor. These are the extension-by-zero interfaces of `ClassicalAlgebraic.supportLocalization`. (Stacks, §59.70, tags 03S2 and 03S6; Modules on Sites, Remark 18.19.6, tag 08P4.)

**Finite-open Mayer–Vietoris and equivariant localization.** Provide `ClassicalAlgebraic.supportLocalization`: for any scheme `X`, a closed subscheme `i:Z→X`, its open complement `j:U→X` and `K` in the enhanced derived category of étale `Λ`-module sheaves, construct `i^!`, sections supported on `Z` and the natural triangles `i_*i^!K→K→Rj_*j^*K` and `j_!j^*K→K→i_*i^*K`. Here `Λ` is any ring; these constructions require no Noetherian or invertibility hypothesis. Prove nested-support compatibility, excision and naturality of the connecting maps. The support depends on the closed set; identify nilpotent thickenings using §F.0.4 (`VanishingCycles.universalHomeomorphismEtaleEquivalence`), whose general topological-invariance theorem supplies this special case (Stacks, tag 04DZ). Construct the support carrier on the small étale site from EnhancedDerivedSheaves §§0.1–0.4 and étale open–closed recollement. `SchemeAndStackFoundations`, §2.7, supplies the separate Zariski `O_X`-module support calculus. Analytic support geometry is a downstream application in ClassicalAdicEtaleCohomology. (Stacks, Étale Cohomology, §§59.46 and 59.79; SGA 4, Exposé XVII, §5.)

Provide `ClassicalAlgebraic.supportLocalization.mayerVietoris`: for `X=U∪V`, with open inclusions `j_U,j_V,j_(U∩V)`, construct the triangle `j_(U∩V)!K|_(U∩V)→j_U!K|_U⊕j_V!K|_V→K→`, using `(1,−1)` on the intersection and addition toward `K`. Also give ordinary cohomology descent `RΓ(X,K)→RΓ(U,K)⊕RΓ(V,K)→RΓ(U∩V,K)→` with difference of restrictions. Extend to the alternating finite-intersection complexes of every finite open cover and prove refinement coherence. Prove coherent finite group actions for actions preserving the support or permuting the cover, derived coefficient-change transformations and tensor compatibility for commutative `Λ`. Extension-by-zero localization commutes with arbitrary scheme pullback and derived scalar extension. For the `i^!` triangle use the canonical exchange and tensor transformations of EnhancedDerivedSheaves §0.4, asserting equivalences only under their proved hypotheses; tensoring by a perfect coefficient complex gives the tensor equivalence.

**Checks.**

- `Z=∅` gives the zero support functor and identity open restriction.
- `Z=X` gives the identity closed term and zero open complement.
- A two-open cover gives the intersection connecting map with the stated difference sign; exchanging `U` and `V` changes the intersection sign coherently.
- Replacing `(p)` by `(p²)` on `Spec ℤ_p` leaves the support functor and étale localization triangle unchanged without creating a scheme map in the wrong direction.
- For `j:𝔾_m→A¹` and a `Λ`-module sheaf `F` in degree zero, derived `j_!F` has only `H⁰=j_!F` and zero stalk at the origin; forgetting `Λ` gives the same abelian extension by zero.

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`; `SchemeAndStackFoundations`, §§2.1–2.2 for cohomology transport and Leray; §F.0.4 (`VanishingCycles.universalHomeomorphismEtaleEquivalence`) for nilpotent invariance.

## F.1 Derived sheaves and coherent diagrams

**Bounded constructible and ctf categories.** `VanishingCycles.constructibleDerivedCategory`.
Specialize `ClassicalDerived.enhancedCategory`, `ClassicalDerived.replacements`,
`ClassicalDerived.tensorHom` and `ClassicalDerived.functorCoherence` to étale `Λ`-module
sheaves, with homotopy category Mathlib's `DerivedCategory`. On Noetherian `X` form full
subcategories `Dᵇ_c` and `Dᵇ_ctf`; use affine-local constructibility on locally Noetherian `X`,
and global cohomological/Tor bounds for the bounded category. Tor amplitude `[a,b]` means
that derived tensor with every degree-zero module sheaf has cohomology in `[a,b]`; prove the
geometric-stalk criterion and invariance under quasi-isomorphism. Build shifts, cones,
finite sums, pullback and generic lissity of cohomology. `Dᵇ_c` admits truncations; its tensor
closure requires one finite-Tor factor, and bounded internal Hom requires the stated
perfectness of its source. `Dᵇ_ctf` is triangulated and symmetric monoidal; a truncation belongs
to it only after its Tor bound is verified. Use `ClassicalAlgebraic.supportLocalization`
for open–closed triangles. (Stacks §§59.76–59.77; SGA 4 VI; EnhancedDerivedSheaves §0.3.)
*Needs:* §§F.0.1–F.0.4; EnhancedDerivedSheaves §§0.1–0.4; §0.7; SchemeAndStackFoundations §§2.5, 2.7.

**Checks.**

- A finite free degree-zero sheaf has Tor amplitude `[0,0]`.
- On a point `ℤ/2` over `ℤ/4` is constructible but has unbounded Tor amplitude.
- Quasi-isomorphic representatives have identical `Dᵇ_c` and `Dᵇ_ctf` membership.

**Finite-coefficient cohomology and coherent actions.** `VanishingCycles.finiteCoefficientCohomology`.
Use the supplier's `RΓ` and `CategoryTheory.Sheaf.H` for F.1's objects, retaining `Λ`-module
structure. Build cup products, coefficient restriction and derived extension, scheme
pullbacks, long exact sequences and coherent finite-group actions. Identify the underlying
abelian `D⁺` cohomology and pullback with SchemeAndStackFoundations §2.1. For a finite étale
cover with acyclic finite intersections prove the Čech comparison through the Čech-to-derived
spectral sequence. Prove `VanishingCycles.filteredColimit_cohomology` on the qcqs scheme
étale domain: exact filtered colimits commute with cohomology; geometric stalks commute
with them on every scheme. Consume `ClassicalDerived.inverseLimits` and
`ClassicalDerived.derivedCompletion` for derived limits, Milnor sequences and completion.
(SGA 4 V–VI, VI §5, VII §5; Bhatt–Scholze §§3, 5–6.)
*Needs:* §§F.0.1–F.0.4, F.1 constructibleDerivedCategory; SchemeAndStackFoundations §§2.1–2.2, 2.17;
EnhancedDerivedSheaves §§0.3–0.4, especially tensorHom and functorCoherence.

**Checks.**

- A constant module on a separably closed point has only degree-zero cohomology.
- Identity pullback is the identity module map.
- An equivariant short exact sequence has an equivariant connecting map, even when the
  group order is not invertible in `Λ`.
- The cone of multiplication by `ℓ` on `ℤ/ℓ²` has both kernel and cokernel `ℤ/ℓ`.
- An infinite filtered sum of nonzero finite constant modules commutes with stalks and
  is not constructible on a point.

## F.2.1 Proper base change for arbitrary torsion

`VanishingCycles.etaleBaseChange` indexes §§F.2.1–F.2.2. EnhancedDerivedSheaves §0.4 supplies the canonical transformations and pasting; SchemeAndStackFoundations §§2.1–2.2 supplies underlying abelian `D⁺` functors.

**Proper base change for arbitrary torsion.** `VanishingCycles.properBaseChange`.
For proper `f:X→Y`, every cartesian square with `g:Y′→Y` and `g′:X′→X`, and every `K` in `D⁺` of
torsion abelian sheaves, prove `g*Rf*K ≅ Rf′*g′*K` by the canonical exchange. No Noetherian
or invertibility hypothesis is imposed. Include sheaf and geometric-stalk forms,
composition/pasting, products, group actions, coefficient change and coefficient forgetting.
(SGA 4 XII 5.1; Stacks §59.91.) *Needs:* SchemeAndStackFoundations §§2.1–2.2;
EnhancedDerivedSheaves §§0.1–0.4. This theorem precedes properSupports and adic realization.

**Checks.**

- A geometric stalk of `Rf*K` is the geometric fibre's cohomology.
- The exchange for a proper identity square is identity.
- Residue-characteristic torsion still satisfies this proper base-change theorem.

## F.2.2 Smooth base change in the rotated square

**Smooth base change in the rotated square.** `VanishingCycles.smoothBaseChange`.
Let `f:X→S` be smooth, `g:T→S` qcqs, `Y=X×_S T`, `h:Y→X` and `e:Y→T`. For every torsion abelian
sheaf `F` on `T` whose every section is killed by some integer invertible on `S`, prove
`f*Rᵠg*F ≅ Rᵠh*e*F` and the `D⁺` version with the same condition on cohomology sheaves.
Prove the cofiltered smooth-base-change limit corollary with affine transitions, and
invariance under extension of separably closed fields, retaining cup and twist maps.
(SGA 4 XVI 1.1–2.2; Stacks §§59.89–59.90.)
*Needs:* F.1 finiteCoefficientCohomology and generic `D⁺` functor calculus;
SchemeAndStackFoundations §0.9 (scheme limits).

**Checks.**

- Smooth identity base change gives identity exchange.
- Extending a separably closed ground field preserves geometric cohomology.
- An arbitrary nonsmooth base change does not meet the smooth hypothesis.

## F.2.3 Local and universal local acyclicity

**Local and universal local acyclicity.** `VanishingCycles.localAcyclicity`.
For a scheme morphism and a bounded constructible complex with finite invertible
coefficients, define local acyclicity by the strict-local fibre comparison maps; ULA
requires these comparisons after every base change. Prove source/target locality,
base-change stability of ULA, smooth ULA for finite lisse coefficients, triangle closure
and the following tensor stability: if `K` is ULA for `f` and `L` is a locally constant
perfect `Λ`-complex on `X` with global Tor amplitude `[c,d]`, then `K⊗ᴸ_Λ L` is ULA.
If `K` has cohomological (respectively Tor) amplitude `[a,b]`, the tensor has the
corresponding amplitude bound `[a+c,b+d]`. Construct cospecialization with coherent
specialization and path composition. (SGA 4 XV–XVI; Stacks §§59.93–59.94,
Definition 59.93.1, tag 0GJP.) *Needs:* F.1, properBaseChange, smoothBaseChange;
geometric points and strict henselizations from SchemeAndStackFoundations and ModularCurves Layer 4D.

**Checks.**

- A smooth constant family with invertible coefficients is ULA.
- In characteristic different from two, `x↦x²` is locally acyclic away from zero but not at zero.
- Concatenated specialization/path data give the composite cospecialization map.
- For `f:𝔸²_(t,x)→𝔸¹_t` over `ℂ`, the sections `i(t)=(t,0)` and `j(t)=(t,t)`
  give ULA sheaves `i_*𝔽_ℓ` and `j_*𝔽_ℓ`, both of Tor amplitude `[0,0]`.
  Their derived tensor is the skyscraper at `(0,0)` and is not locally acyclic:
  its special stalk is `𝔽_ℓ` and its nearby geometric-fibre cohomology is zero.

## 0.8 Algebraic proper supports and finite traces

**Compactification-defined lower shriek.** Provide `ClassicalAlgebraic.properSupports`: for a separated finitely presented `f:X→S` between qcqs schemes and a compactification `f=p∘j`, with `j` a quasi-compact open immersion and `p` proper, define `R⁺f!=Rp_*j_!` on `D⁺` of étale `Λ`-module sheaves with torsion cohomology, for any coefficient ring `Λ`. This includes every separated finite-type morphism between Noetherian schemes. Use the structured compactifications, dense replacements and coherent common refinements of §§G.1–G.3 (`Compactification`, `DenseCompactification`, `nagataCompactification`, `compactificationCommonRefinement`). Prove independence with identity and cocycle coherence, enhanced composition `Rg!Rf!≅R(g∘f)!`, proper agreement with `Rf*` and open agreement with exact `j!`. Construct the canonical forget-supports map `Rf!→Rf*`, compatible with composition and refinement. Use §F.2.1 (`VanishingCycles.properBaseChange`), on the proper factor to establish torsion base-change compatibility, without an invertibility condition. Prove compatibility with shifts, triangles, finite group actions and coefficient transformations, retaining the Tor bounds needed to stay in `D⁺` under derived scalar extension. For unbounded complexes require finite cohomological amplitude and the colimit hypotheses of EnhancedDerivedSheaves §0.4. Only finite-presentation compactification diagrams descend by Section 0.5. Bounded ctf preservation and constructible exchange are the additional results of §§F.2–F.3, applied to this functor. (SGA 4, Exposé XVII, §§5–6; Stacks, More Étale Cohomology, *Derived lower shriek via compactifications*, tag 0F7H.)

Provide `ClassicalAlgebraic.properSupports.derivedComparison`: writing underived `f!=p_*j_!`, construct the canonical map `R(f!)→Rp_*j_!=R⁺f!`, with `H⁰(R⁺f!F)=f!F` for a sheaf `F`. The right-derived composite uses an injective resolution on `X`; `R⁺f!` instead resolves `j_!F` on the compactification. Exactness of `j_!` does not imply that it sends injectives to `p_*`-acyclic sheaves, so the comparison is generally noninvertible; preserve the identity comparisons in the proper and open cases. (Stacks, More Étale Cohomology, *Sections with compact support*, tag 0F4W, and *Compactly supported cohomology*, tag 0GJY; SGA 4, Exposé XVII, §§5–6.)

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; §§G.1–G.3, 0.7 and F.2.1; §0.5 for finite-presentation descent of compactification diagrams.

**Checks.**

- A proper morphism uses `j=id` and gives `R⁺f!=R⁺f*`.
- An open immersion with tautological compactification into its target gives exact extension by zero.
- For `X=A¹_k` over an algebraically closed field with `ℓ` invertible and `Λ=ℤ/ℓ`, true `H²_c(X,Λ)=Λ(−1)`. In contrast `R²(Γ_c)(Λ)=⊕_(a∈k)Λ(−1)`: proper closed supports are finite sets, so the naive derived functor is the filtered colimit of local cohomology at those supports. The comparison adds the point classes and has a nonzero kernel. The open immersion `X⊂P¹` alone has exact `j_!` and identity derived comparison.
- Refining a compactification properly gives the same functor with the same forget-supports map, not just isomorphic cohomology groups.

Applying `Rf!` to §0.7's triangles gives compact-support localization and finite-open Mayer–Vietoris whenever `f` is separated finitely presented between qcqs schemes and `K` is bounded below with torsion cohomology; quasi-compact opens keep the restricted maps in this domain. The connecting maps retain §0.7's signs, support naturality and refinement coherence.

**Algebraic finite traces.** Provide `ClassicalAlgebraic.finiteTrace` for finite locally free maps on abelian étale sheaves; for finite étale maps it is the adjunction counit. Its geometric-stalk map sums with the lengths of local Artinian fibre rings, and its composite with the unit is multiplication by rank. Prove naturality, composition, pullback compatibility and the norm description on Kummer classes when `n` is invertible. (SGA 4, Exposé XVII, §6; Stacks, Étale Cohomology, §59.66, tag 03SH.)

**Checks.**

- A split finite étale degree-`r` map has trace the sum of `r` components, including `r=0`.
- If `ℓ` divides `r`, coefficients `Z`/`ℓ` give zero after the diagonal unit; trace does not divide by `r`.
- For `T↦T²` on `A¹` in characteristic different from two, trace at zero is twice the value, despite the fibre having one geometric point.

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; this roadmap §0.7; §F.2.1 (`VanishingCycles.properBaseChange`) on `D⁺` torsion complexes; §§G.1–G.3 (`Compactification`, `DenseCompactification`, `nagataCompactification`, `compactificationCommonRefinement`). Section 0.5 is used only for finite-presentation descent of chosen diagrams.

## F.2.4 Constructible lower shriek and arbitrary base change

**Constructible lower shriek and arbitrary base change.** `VanishingCycles.etaleCompactSupports`.
Use the `D⁺` torsion functor `Rf!` of `ClassicalAlgebraic.properSupports`, defined by `Rp*j!`;
its compactification-independent definition is not another target here. The geometry is
supplied by §§G.1–G.3 / `Compactification`,
`nagataCompactification`, `compactificationCommonRefinement`, over qcqs bases.
For separated finite-type `f:X→S` between Noetherian schemes, finite `Λ` killed by `N` invertible
on `S` and `K∈Dᵇ_ctf(X,Λ)`, prove arbitrary cartesian exchange `g*Rf!K ≅ Rf′!g′*K` in the
ambient derived categories, with composition, coefficient and finite-group coherence and
proper/open agreement. F.3 compactSupportFiniteness supplies bounded ctf preservation;
for a non-Noetherian base change assert boundedness only on its verified domain.
(SGA 4 XVII §§3–5.) *Needs:* F.1 constructibleDerivedCategory, properBaseChange;
EnhancedDerivedSheaves §0.4; §§0.7–0.8; the three supplied compactification targets.

**Checks.**

- Proper `f` recovers the proper exchange theorem.
- Open immersions recover extension-by-zero base change.
- Two cartesian squares yield the same exchange as their pasted square.

## F.2.5 Compact-support cohomology

**Compact-support cohomology.** `VanishingCycles.compactSupportCohomology`.
For separated finite-type `a:X→Spec k` define `RΓc(X,K)=RΓ(Spec k,Ra!K)` with the supplied
lower-shriek functor on its `D⁺` torsion domain. Build forget-supports, proper comparison,
field-extension exchange, localization, finite-open Mayer–Vietoris, twists and coherent
group actions. This construction has no finiteness assertion built into its definition.
(SGA 4 XVII §§5–6.) *Needs:* etaleCompactSupports;
§§0.7–0.8 / supportLocalization, properSupports.

**Checks.**

- `H⁰c(𝔸¹,Λ)=0` for nonzero invertible `Λ`, whereas `H⁰(𝔸¹,Λ)=Λ`.
- On a proper scheme forget-supports is an equivalence.
- An open–closed decomposition gives the compact-support connecting map.

## F.3.0 Geometric étale dimension bound

**Geometric étale dimension bound.** `VanishingCycles.etaleCohomologicalDimension`.
For finite-type `X` over separably closed `k` and any torsion abelian sheaf `F` whose torsion
orders are invertible in `k`, prove `Hᵠ(X,F)=0` for `q>2 dim X`. For `K` of cohomological amplitude
`[a,b]` with such cohomology sheaves obtain the upper bound `b+2 dim X`. Use Mathlib's Krull
dimension interface and build the finite-type and fibre-dimension lemmas needed here.
(SGA 4 X, XIV; Stacks §§59.95–59.96.) *Needs:* F.1 finiteCoefficientCohomology and its
underlying-abelian comparison, §F.2.2 smoothBaseChange; SchemeAndStackFoundations finite-type geometry.

**Checks.**

- `ℙ¹` has nonzero `H²` with nonzero invertible constant coefficients.
- A geometric point has no positive cohomology.
- `Spec 𝔽_q` is outside the separably closed hypothesis and can have `H¹`.

## F.2.6 Ordinary finite-coefficient étale Künneth

**Ordinary finite-coefficient étale Künneth.** `VanishingCycles.etaleKunneth`.
Define `K⊠L=p_X*K⊗ᴸ_Λ p_Y*L` once. For finite-type `X,Y` over separably closed `k`, finite `Λ`
with invertible annihilator and `K,L∈Dᵇ_ctf`, prove
`RΓ(X,K)⊗ᴸ_Λ RΓ(Y,L) ≅ RΓ(X×_k Y,K⊠L)`, without properness, smoothness or constant-coefficient
restrictions. Prove the projection/exchange lemmas needed for the nonproper case by the
field-base-change argument, not by proper base change alone. Apply §F.3.0's
`VanishingCycles.etaleCohomologicalDimension` to obtain finite cohomological dimension
for sheaves of `Λ`-modules on each factor; this supplies the coefficient-specific bound
in the global-sections projection formula (Stacks 0F12) used in the proof of 0F1P.
More generally the same
canonical map is an equivalence whenever the exchange
`underline(RΓ(X,K)) ≅ Rp_Y*(p_X*K)`, the derived projection formula for `p_Y` and the projection
formula for global sections against `RΓ(X,K)` hold, and the tensor/global-section expressions
are bounded below with the required Tor bounds. These are explicit sufficient hypotheses
on arbitrary `k`-schemes. Retain Tor terms, cup products, pullbacks, base change, Koszul
symmetry, associativity, finite groups and coefficient reductions. (Stacks §59.97,
Lemmas 59.97.6–59.97.9; SGA 4 XVII §5; Milne, Abelian Varieties, §15.)
*Needs:* F.1, properBaseChange, smoothBaseChange; finite-coefficient projection/exchange
lemmas built here; §F.3.0 etaleCohomologicalDimension;
`ClassicalDerived.tensorHom` and scheme limits.

**Checks.**

- A geometric point gives the tensor unit.
- Swapping degree-one factors gives the Koszul sign `−1`, including its reduction at `ℓ=2`.
- On `A×A` for an abelian variety, this is ordinary cohomology with addition pullback.
- For `X=Y=𝔸¹_k`, both factors are nonproper but the coefficient-specific dimension bounds
  still supply the global-sections projection step.

## F.3 Finiteness, Artin vanishing and generic acyclicity

**Affine torsion vanishing.** `VanishingCycles.affineArtinVanishing`.
For affine finite-type `X` over separably closed `k` and every prime-to-characteristic torsion
abelian `F` prove `Hᵠ(X,F)=0` for `q>dim X`. For constructible `F` retain the sharper bound
`a>dim Supp F`. Over a general field apply the geometric bound to `X_k̄`; arithmetic amplitude
also requires finite `ℓ`-cohomological dimension of `k` for every coefficient prime.
(SGA 4 XIV §3; Stacks §59.95.) *Needs:* F.1; etaleCohomologicalDimension and its dimension lemmas.

**Checks.**

- A finite lisse sheaf on an affine smooth curve has `H²=0`.
- `ℙ¹` fails the affine hypothesis and has nonzero `H²`.
- A constructible skyscraper at a closed point has support-dimension bound zero.
- `Spec ℝ` with `ℤ/2` has cohomology in every nonnegative degree.

**Proper constructibility, finiteness and ctf preservation.** `VanishingCycles.etaleFiniteness`.
For proper `f:X→Y` between Noetherian schemes and finite `Λ` annihilated by `N` invertible on `Y`,
prove constructibility of `Rⁱf*F` for constructible `F` and `Rf*K∈Dᵇ_ctf(Y,Λ)` for `K∈Dᵇ_ctf(X,Λ)`.
For proper finite-type `X` over separably closed `k` prove that every `Hⁱ(X,K)` is a finite
`Λ`-module, with bounded cohomological amplitude. Retain ordinary constructible direct-image
and generic-base-change results for finite-type field schemes and the excellent-trait
forms on their invertible coefficient domains. (SGA 4½ [Th. finitude] §§1–2.)
*Needs:* F.1 constructibleDerivedCategory; §§F.2.1–F.2.3; etaleCohomologicalDimension; SchemeAndStackFoundations §§0.9, 0.21.

**Checks.**

- A finite scheme over separably closed `k` has finite degree-zero cohomology.
- A proper smooth genus-`g` curve has finite `H¹` at each finite coefficient level.
- An infinite sum of finite sheaves need not be constructible and is not an admissible input.

**Lisse direct images and path-aware transport.** `VanishingCycles.lisseDirectImageTransport`.
For smooth proper `f` and finite lisse coefficients with invertible annihilator prove lissity
of `Rⁱf*K` and the geometric fibre stalk formula. More generally, for proper `f:X→S`, bounded
constructible `K` with finite invertible coefficients and a connected locally closed Noetherian
stratum `T⊂S`, put `f_T:X×_S T→T` and `K_T=K|_(X×_S T)`. Require constructibility of
`R(f_T)_*K_T` and ULA of `(f_T,K_T)`; deduce lissity of `Rⁱ(f_T)_*K_T` and identify it
with `(Rⁱf_*K)|_T` by proper base change. A supplied étale path transports
fibre cohomology, with identity/inverse/composition, cup/twist/group/reduction compatibility.
(SGA 4 XVI; SGA 1 V; Stacks Lemma 59.94.3, tag 0GJW.)
*Needs:* §F.0.2 finiteEtaleGaloisCategory; §§F.2.1–F.2.3; etaleFiniteness.

**Checks.**

- In a constant smooth proper family, paths with trivial coefficient monodromy transport identically.
- Changing the chosen path can produce nontrivial monodromy.
- The theorem supplies no comparison between points of different strata.
- For `j:𝔾_m→𝔸¹` over `ℂ`, let `𝓛` be the rank-one `𝔽_3` Kummer sheaf with monodromy
  `T=−1` from the quadratic cover. Then `(j,𝓛)` is ULA and `Rj_*𝓛≅j_!𝓛` is bounded
  constructible with every original geometric-fibre comparison, but is not lisse: its
  rank drops from one to zero at the origin. Here `T−1=−2` is invertible on `𝔽_3`;
  after `t=z²` the sheaf becomes constant and the new direct image has a nonzero
  boundary stalk, so arbitrary base change fails.

**Constructible compact-support finiteness and perfectness.** `VanishingCycles.compactSupportFiniteness`.
For separated finite-type `f` between Noetherian schemes, finite `Λ` killed by `N` invertible
on the base and `K∈Dᵇ_ctf` prove `Rf!K∈Dᵇ_ctf`. For separated finite-type `X` over separably
closed `k` prove finite `Hⁱc`, bounded amplitude and perfect `RΓc(X,K)` over `Λ`. Also prove the
ordinary finite-coefficient finiteness/perfectness on this geometric domain needed by F.4,
using ordinary constructibility and cohomological dimension. Finite `Λ`-modules alone do not
establish perfectness; prove the global Tor bound from the ctf hypothesis.
(SGA 4½ [Th. finitude] §§1–2; SGA 4 XVII.) *Needs:* F.1; §§F.2.1, F.2.4–F.2.5; etaleFiniteness and geometric dimension;
§§G.1–G.3; §§0.7–0.8.

**Checks.**

- On `𝔸¹`, `H⁰c=0` while `H⁰=Λ` for nonzero invertible coefficients.
- `ℙ¹` has the proper comparison between ordinary and compact support.
- `ℤ/2` over `ℤ/4` on a point is excluded by ctf, although its cohomology module is finite.

**Generic local acyclicity.** `VanishingCycles.genericLocalAcyclicity`.
For finite-type `f:Y→B` over a field, integral `B`, and bounded constructible `K` with coefficients
invertible on `B`, construct a dense open on which `(f,K)` is ULA, with base-change compatibility.
Excellent-trait applications use constructibility and generic base change on the stated
finite-type domains. (SGA 4½ [Th. finitude] §§1–2; Weil II, proof of 6.2.11.)
*Needs:* §§F.0.1–F.0.4, F.1–F.2.6; SchemeAndStackFoundations §§0.9, 0.21, 2.15.

**Checks.**

- A smooth constant family may take the whole parameter space as its acyclic open.
- For `x↦x²` in characteristic different from two, the acyclic open excludes zero.
- Restricting an acyclic open to a smaller dense open preserves ULA.

## F.2.7 Compact-support projection and Künneth

**Compact-support projection and Künneth.** `VanishingCycles.etaleKunnethCompactSupport`.
For separated finite-type `f:X→S` between Noetherian schemes, finite `Λ` with invertible
annihilator, `K∈Dᵇ_ctf(X,Λ)`, `L∈Dᵇ_ctf(S,Λ)`, prove
`Rf!(K⊗ᴸf*L) ≅ Rf!K⊗ᴸL`. For separated finite-type `X,Y` over separably closed `k` with these
coefficients prove `RΓc(X,K)⊗ᴸRΓc(Y,L) ≅ RΓc(X×_k Y,K⊠L)`, using etaleKunneth's external
product. Include cup/external products, symmetry, associativity, base-change, action and
reduction coherence. (SGA 4 XVII §5.) *Needs:* etaleKunneth, etaleCompactSupports,
compactSupportCohomology, F.3 compactSupportFiniteness; EnhancedDerivedSheaves §0.3; §§0.7–0.8.

**Checks.**

- A point gives the compact-support tensor unit.
- Two `𝔸¹` computations give `𝔸²` with degree-four twist `−2`.
- Localization for `𝔾_m` commutes with external products.

## F.3a Henselian traits, inertia and the tame character

**Henselian traits.** `VanishingCycles.HenselianTrait`. A henselian trait is `S = Spec R` for a henselian discrete valuation ring
`R`, with closed point `s`, generic point `η`, a chosen separable closure `k(η̄)` of `k(η)` (the
geometric generic point `η̄`), the normalization `S̄` of `S` in `k(η̄)`, its closed point `s̄` and the
inclusions `j̄ : η̄ → S̄`, `ī : s̄ → S̄`. Because `R` is henselian the valuation extends uniquely to
`k(η̄)`, so `S̄` is local, and the residue field `k(s̄)` is an algebraic closure of `k(s)` that may be
purely inseparable over the separable closure `k(s)^sep`. The inertia group `I` is the kernel of
the specialization map `Gal(η̄/η) → Gal(s̄/s)`, a closed normal subgroup, and the specialization map
is surjective (Stacks 09ED applied to every finite Galois subextension, and the henselian property
for the limit). Define `VanishingCycles.HenselianTrait` as this structure, with the generic and
special fibres of an `S`-scheme taken as Tau Ceti's `TauCeti.genericFiber` and
`TauCeti.specialFiber`. Sheaves on `Spec k` are continuous `Gal(k^sep/k)`-sets, by the Galois
description of F.0.

- `VanishingCycles.HenselianTrait`: A henselian trait `S = Spec R` with closed point `s`, generic point `η`, a geometric generic point `η̄`, the geometric closed point `s̄` and `S̄ = Spec` of the normalisation of `R` in `k(η̄)`.
- `VanishingCycles.HenselianTrait.inertia`: `I = ker(Gal(η̄/η) → Gal(s̄/s))`, a closed normal subgroup.
- `VanishingCycles.HenselianTrait.inertia_exact`: `1 → I → Gal(η̄/η) → Gal(s̄/s) → 1` is exact; surjectivity uses that `R` is henselian.
- `VanishingCycles.HenselianTrait.genericFiber`: The trait-indexed generic fibre is TauCeti.genericFiber, with its canonical pullback projection.
- `VanishingCycles.HenselianTrait.specialFiber`: The trait-indexed closed fibre is TauCeti.specialFiber over the residue field.

The fibre squares `X_η̄ → X_{S̄} ← X_s̄` induce the inverse- and direct-image adjunctions between the
small étale sites (Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`, through
§§F.2–F.3), and `Gal(η̄/η)` acts on `ī^*Rj̄_*` by transport
of structure, coherently for identities and composites. The open map is `j̄` over `S̄`: replacing
it by `j : η → S` loses the inertia action. (SGA 7 II, Exposé XIII, 0.2.5, p. 5 and Rappel 1.1.3,
p. 7; Illusie 2006, §1.1, pp. 1–2.)

*Needs:* Mathlib henselian DVRs and valuation inertia; Tau Ceti generic and special fibres; §§F.0.2, F.2.1–F.2.3 and F.3.

**Checks.**

- `VanishingCycles.inertia_eq_top_of_strictlyHenselian`: If `R` is strictly henselian then `Gal(s̄/s) = 1` and `I = Gal(η̄/η)`.
- `VanishingCycles.inertia_puiseux`: For `R` the henselisation of `k[t]` at `(t)`, `k` algebraically closed of characteristic 0, `I = Gal(η̄/η) ≅ Ẑ(1)`, acting on `t^{1/n}` through `μ_n`.
- `VanishingCycles.inertia_eq_valuation_inertia`: `I` coincides with Mathlib's `ValuationSubring.inertiaSubgroup` for the valuation subring of `k(η̄)` over `R`, as a subgroup of the decomposition group, which here is all of `Gal(η̄/η)`.
- `VanishingCycles.wild_inertia_ne_bot`: For `R` the henselisation of `𝔽̄_p[t]` at `(t)`, `I` is not procyclic: the Artin–Schreier extensions `x^p − x = t^{-a}` (`p ∤ a`) give infinitely many independent `ℤ/p` quotients.
- For `Y = Spec k` the equivalence recovers `Gal(k̄/k)`-sets.
- For `X = S` the geometric nearby stalk is the generic representation, not its inertia
  invariants; using `j` in place of `j̄` changes the answer.

**The tame character.** Let `p ≥ 0` be the characteristic of `k(s)` and `ℓ ≠ p` a prime. For
every finite Galois extension `L/k(η)` inside `k(η̄)`, Stacks 09EE and 0BU4 give the wild inertia
`P_L` (a `p`-group, trivial when `p = 0`) and the tame character `θ_L : I_L/P_L ≅ μ_e(k(s̄))`, with
`e` the prime-to-`p` part of the ramification index. Define the wild inertia `P ⊂ I` as the inverse
limit of the `P_L` and the tame character `t_ℓ : I → ℤ_ℓ(1) = lim μ_{ℓ^n}(k(s̄))` as the inverse
limit of the `ℓ`-power parts of the normalized characters `θ_{L,can}` of Stacks 0BU8. Prove:

- `VanishingCycles.tameCharacter_kummer`: for a uniformizer `π` and `σ ∈ I`, `t_ℓ(σ) mod ℓ^n` is
  `σ(π^{1/ℓ^n})/π^{1/ℓ^n}`, and this does not depend on `π` or on the chosen root;
- `VanishingCycles.tameCharacter_surjective`: `t_ℓ` is surjective and continuous, with kernel
  containing `P`, and `I/P ≅ ∏_{ℓ' ≠ p} ℤ_{ℓ'}(1)`;
- `VanishingCycles.tameCharacter_conj`: `t_ℓ(gσg⁻¹) = g · t_ℓ(σ)` for `g ∈ Gal(η̄/η)` acting on
  `ℤ_ℓ(1)` through `Gal(s̄/s)` (Stacks 0BU5);
- `VanishingCycles.tameCharacter_restrict`: for a finite extension of henselian traits with
  ramification index `e` and inertia `I' ⊂ I`, `t_ℓ|_{I'} = e · t'_ℓ`: write `π = uπ'^e` with `u` a unit
  and apply the Kummer description above, the roots of `u` being fixed by `I'` (the finite-level
  characters are compatible in towers by Stacks 0BU7);
- `VanishingCycles.tameCharacter_eq_inertiaTameCharacter`: for `R` the valuation ring of a nonarchimedean local field `K`, identify trait inertia with the pinned `TauCeti.inertiaSubgroup K` and identify the residue Tate module with the roots-of-unity Tate module in `K^sep` by henselian lifting. Under these identifications `t_ℓ` is the `ℓ`-component of `TauCeti.inertiaTameCharacter`, hence `TauCeti.inertiaPadicTameCharacter` for `ℓ` prime to the residue characteristic. The comparison follows levelwise from the positive Kummer ratio `σ(π^(1/ℓⁿ))/π^(1/ℓⁿ)`.

(Stacks Project, Section 15.114, Lemma 09EE, Definition 0BU4, Lemma 0BU5, Lemma 0BU7, Remark 0BU8.)
*Needs:* Mathlib `HenselianLocalRing`, `IsDiscreteValuationRing`, `ValuationSubring.inertiaSubgroup`;
Tau Ceti `TauCeti.genericFiber`, `TauCeti.specialFiber`; F.0 and F.2–F.3; for the local-field comparison, pinned `TauCeti.inertiaTameCharacter`, `TauCeti.inertiaPadicTameCharacter`, `TauCeti.coe_proj_inertiaTameCharacter_apply` and henselian prime-to-residue roots-of-unity lifting.

**Checks.**

- `VanishingCycles.tameCharacter_puiseux`: for `R` the henselization of `k[t]` at `(t)` with `k` algebraically
  closed of characteristic 0, `I = Gal(η̄/η)` and `t_ℓ` is the `ℓ`-component of the isomorphism
  `I ≅ Ẑ(1)` given by the action on the roots `t^{1/n}`.
- `VanishingCycles.tameCharacter_restrict_quadratic`: for `R' = R[π^{1/2}]` with `p ≠ 2`, `e = 2` and `t_ℓ` restricted
  to `I'` is twice the new character; a definition that ignored `e` would fail this.
- Over a local field, the comparison sends every `ℓⁿ`-level Kummer ratio to the pinned character with the same positive direction; changing the uniformizer by a unit leaves it unchanged.
- `VanishingCycles.tameCharacter_wild`: for `R` the henselization of `𝔽̄_p[t]` at `(t)`, every element of `P`
  has `t_ℓ = 0`, while `P` is nonzero (Artin–Schreier extensions).

## F.4.0 Stable lattices and integral models

The stable-lattice theorem is stated for every nonarchimedean local field `E`, with valuation ring `O_E = 𝒪[E]`; integral-model operations are stated for a DVR `O` with fraction field `E`, on their explicit topological hypotheses. Finite `E/ℚ_ℓ` with `O = O_E` is the case used by adic consumers. In the local-field statements, `V` is a finite-dimensional `E`-vector space with the module topology. A lattice is a finitely generated `O`-submodule spanning `V` over `E`, expressed by the pinned Mathlib predicate `Submodule.IsLattice E Λ`.

**Continuous representation carrier.** Construct `ContinuousRep Γ A M` for a topological group `Γ`, a commutative topological ring `A` and a finite projective `A`-module `M` with its module topology: a Mathlib `Representation A Γ M` whose action `Γ×M→M` is jointly continuous. Build equivariant `ContinuousRep.Iso`, identity/composition/inverse, rank-one `ContinuousRep.ofCharacter` for a continuous character `Γ→Aˣ`, and `ContinuousRep.baseChange` using the pinned `Representation.baseChange` along a continuous coefficient map, with module topology on `B⊗_A M`. Prove continuity, identity/composition of base change, equivariance and agreement with the underlying linear representation. These are the carrier and elementary operations needed by integral models.

*Source:* DDT §2.1, p. 52; pinned Mathlib `Representation` and Tau Ceti `Representation.baseChange`.
*Needs:* Mathlib topological groups and module topology; Tau Ceti representation base change.

**Checks.**

- The continuous trivial character gives the identity action on `A`.
- Joint continuity implies each operator is continuous. For the multiplication action of `ℤ_ℓ^×` on discrete `ℚ_ℓ`, each operator is continuous but the action is not jointly continuous: the orbit map at 1 is not locally constant.
- Base change of a rank-one character sends `χ(g)` to its image in `Bˣ`; the generic-fibre comparison of an integral model preserves its action.
- `ContinuousRep.Iso` has identity, inverse and composition with the corresponding
  linear equivalences; two character lines are isomorphic exactly when their characters agree
  (`ContinuousRep.ofCharacter_iso_iff`).
- Identity scalar extension is equivariantly identified with the original representation
  through `TensorProduct.lid` (`ContinuousRep.baseChange_self_iso`). For `A → B → C`,
  `ContinuousRep.baseChange_trans_iso` sends `c⊗(b⊗m)` to `(c·b)⊗m`;
  composing three scalar extensions gives the same identification.
- The unipotent action `a ↦ [[1,a],[0,1]]` on `ℚ_ℓ²` retains that matrix after
  any continuous coefficient-field extension, including `ℚ_ℓ(√ℓ)`.

**Stable lattices.** `ContinuousRep.exists_stable_lattice_iff` (also written `exists_stable_lattice_iff`). Prove that every lattice is compact and open, with compact open stabilizer `GL(Λ)≤GL(V)`, equal to `GL_n(O_E)` in a lattice basis. A subgroup `K≤GL(V)` stabilizes a lattice if and only if its closure is compact: the sum of the `K`-translates of a lattice is a finite sum and is `K`-stable. Every jointly continuous action of a compact group `Γ` on `V` therefore has a stable lattice and in a lattice basis is a continuous `Γ→GL_n(O_E)`. (DDT, §2.1, p. 53, paragraph after Proposition 2.6; Ribet 1976, §2, p. 154; BHKT, Theorem 4.8(ii), p. 16.)
*Needs:* Mathlib nonarchimedean local fields, `IsNonarchimedeanLocalField.isCompact_closedBall`, finite-dimensional module topology and finite-module algebra.

**Checks.**

- Over `E = 𝔽_q((t))`, the standard lattice `𝔽_q[[t]]ⁿ` has compact open stabilizer `GL_n(𝔽_q[[t]])`, including the equal-characteristic case.
- In dimension zero the zero lattice is the unique lattice.
- A nonzero `E`-vector space is not a lattice over `O_E`: it is not finitely generated over `O_E`.
- The cyclic subgroup generated by multiplication by a uniformizer on `E` has noncompact closure in `GL_1(E)` and stabilizes no lattice.
  `ContinuousRep.uniformizer_zpowers_no_stable_lattice` states the `ℚ_ℓ` instance.

**Integral models.** `GaloisLattice.IntegralModel O ρ` is a `Γ`-stable lattice `Λ`. Expose `Submodule.IsLattice E Λ.lattice` through `GaloisLattice.IntegralModel.isLattice`. Reuse Mathlib's finite/free instances, unit scaling, sums, intersections, basis extension and rank comparison on their stated ring and fraction-field domains. In particular it is free of rank `dim_E V`; its restricted action `GaloisLattice.IntegralModel.toContinuousRep` uses the inherited subspace topology on `Λ.lattice` and is jointly continuous by restriction. Its `ContinuousRep` carrier requires that this inherited topology be the `O`-module topology. For the valuation ring of a nonarchimedean local field this is also the uniformizer-adic topology. For topological rings `O` and `E` with continuous scalar action and the indicated module topologies, the equivariant generic-fibre isomorphism is `E⊗_OΛ≅V` (`nonempty_iso_genericFibre`). Supply homothety `GaloisLattice.IntegralModel.smul`, with `(cd)Λ=c(dΛ)` and `1Λ=Λ`; sums and intersections of models; existence `GaloisLattice.IntegralModel.nonempty` for compact `Γ`, compact `O` embedded openly in `E` with its topological-ring structure; saturation `W∩Λ` in a stable subspace, whose quotient models `V/W`; and the dual lattice `Λ^∨={λ∈V^∨ : λ(Λ)⊂O}` with biduality. Any two models are commensurable: `𝔪^aΛ⊂Λ′` and `𝔪^aΛ′⊂Λ` for some `a≥0` (`exists_pow_le`). (DDT, §2.1, paragraph after Proposition 2.6, for existence; Mathlib's [Algebra/Module/Lattice.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Module/Lattice.lean), `Submodule.IsLattice` and its algebra; elementary DVR arguments using lattice bases, saturation and clearing denominators for the equivariant and topological comparisons. Adopt Mathlib's full-span predicate vocabulary as it develops, including [Mathlib #44365](https://github.com/leanprover-community/mathlib4/pull/44365).)
*Needs:* the stable-lattice theorem above; Mathlib's lattice API, DVRs, finite free modules, tensor products, dual modules and fraction fields. The prototype `ContinuousRep` packages a `Representation` with its joint-continuity proof; coefficient extension uses Tau Ceti's `Representation.baseChange`.

**Checks.**

- For a continuous unit-valued character `χ:Γ→ℤ_ℓ^×`, every `ℓ^kℤ_ℓ` is a stable model of `ℚ_ℓ(χ)`, and every model has this form with unique `k∈ℤ`. In particular this applies to a continuous `ℚ_ℓ`-valued character of compact `Γ`, whose valuation has compact image in `ℤ` and is zero. The zero submodule is excluded by spanning; for discrete `Γ=ℤ` and `χ(n)=ℓ^n` no full stable lattice exists.
- The zero representation has only the zero model; its underlying submodule has the
  Mathlib lattice instance and rank zero. Finite/free instances apply in this case too.
- The additive group `ℤ_ℓ` acts on `ℚ_ℓ²` by `a↦[[1,a],[0,1]]`. It preserves `ℤ_ℓ²` and `ℤ_ℓe₁⊕ℓℤ_ℓe₂`, which are not homothetic. Allowing `a=ℓ⁻¹` would fail to preserve `ℤ_ℓ²`.
- Scalar extension of a model recovers the given action on `V`, not just its dimension.
- Homothety satisfies `(smul 1 Λ).lattice = Λ.lattice` and
  `(smul c (smul d Λ)).lattice = (smul (c*d) Λ).lattice`.
  On a character line, scaling `ℓ^kℤ_ℓ` by `ℓ` gives `ℓ^(k+1)ℤ_ℓ`.
- The restricted action on the standard unipotent lattice `ℤ_ℓ²` has matrix
  `[[1,a],[0,1]]` over `ℤ_ℓ`; its inclusion in `ℚ_ℓ²` intertwines the actions.
- On the zero model, the restricted action is the unique action on the zero module.
- With discrete coefficient ring `O = ℤ_ℓ` and the usual topology on `E = ℚ_ℓ`,
  the inherited topology on the lattice `ℤ_ℓ ⊂ E` is nondiscrete and fails
  `IsModuleTopology O Λ.lattice`. Replacing that lattice topology by the discrete
  topology makes the unit-group action discontinuous at 1; it is no longer the
  inherited topology used by `toContinuousRep`.

## F.10.1 Finite-field descent and rational-point fixed points

Scheme Frobenius is supplied by SchemeAndStackFoundations §0.29, with the interface Checks in §F.0.4. Coefficient objects carry descent data over `k`. Geometric Frobenius is the inverse of arithmetic field Frobenius; cohomological traces use geometric Frobenius and compact support.

**Finite-field descent and rational-point fixed points.** `VanishingCycles.frobeniusFixedPoints`.
For finite `k` of cardinality `q` with chosen algebraic closure `k̄`, use
`FiniteField.frobeniusAlgEquivOfAlgebraic` as `VanishingCycles.arithmeticFrobenius` and its
inverse as `VanishingCycles.geometricFrobenius`. For every `r≥1` identify the fixed subfield
of its `r`-th power with the degree-`r` field `k_r⊂k̄` of cardinality `qʳ`, using the fixed intermediate field of the subgroup generated by that power. For every `k`-scheme `X`
prove the natural equivalence `X(k_r) ≃ Fix(arithmeticFrobeniusʳ on X(k̄))`; give the
geometric inverse-power formulation. Coordinate action is `x↦x^q`; preserve maps, products,
coproducts and changes of algebraic closure. Use the over-`Spec k` morphism type for points,
building its adapter to the existing scheme API. Define `VanishingCycles.numberOfRationalPoints`
as `Nat.card` of that type, with no finiteness hypothesis on the definition.
`VanishingCycles.rationalPoints_finite` gives point finiteness for finite-type `X` over finite
`k` and any finite extension `L/k`, by a finite affine cover.
`VanishingCycles.numberOfRationalPoints_pullback` gives multiplicativity for fibre products
over any ground field, with `Nat.card` retaining its value zero on infinite point sets.
The power formula is Mathlib's
`FiniteField.coe_frobeniusAlgEquivOfAlgebraic_iterate` with `AlgEquiv.coe_pow`; the
representative new signature is `VanishingCycles.frobeniusFixedField_card`.
(Mathlib FieldTheory/Finite/Basic.lean, frobeniusAlgEquivOfAlgebraic and its iterate theorem;
SGA 1 I §8, finite-field descent.)
*Needs:* Mathlib finite fields, algebraic closures, `Nat.card`, scheme spectra and affine
covers; the supplied `qPowerFrobenius` only for conversion to scheme maps.

**Checks.**

- `Spec k_m` has `m` `k_r`-points when `m` divides `r`, and none otherwise.
- `𝔸¹` has `qʳ` fixed points of arithmetic `Frobeniusʳ`.
- The point equivalence for a product is the product of the two point equivalences; for finite-type factors the rational-point count is multiplicative.
- Arithmetic and geometric Frobenius compose to the identity in both orders.

## F.10.2 Scheme/descent Frobenius comparison, finite coefficients

**Scheme/descent Frobenius comparison.** `VanishingCycles.frobeniusCohomology`.
For finite-field `X` with a descended finite coefficient object, construct the canonical
coefficient identifications for `qPowerFrobenius` pullback and semilinear arithmetic descent
on `X_k̄`. Prove the comparison diagrams: after the universal-homeomorphism identification,
the `q`-power scheme pullback is the geometric cohomological action, inverse to arithmetic
Galois action. Carry the coefficient map as part of the statement, especially for twists;
there is no automatic action on an arbitrary complex given only on `X_k̄`. Prove all `r`-power,
Tate-twist, finite-group and coefficient-reduction compatibilities at finite level. (SGA 4½ [Rapport] §§1–2; Weil I §§1–2.)
*Needs:* F.1 finiteCoefficientCohomology; §F.0.4 universalHomeomorphismEtaleEquivalence;
frobeniusFixedPoints and the supplied absolute/relative/`q`-power scheme maps. The finite-level bridge uses only these inputs.

**Checks.**

- Arithmetic Frobenius on `μ_(ℓⁿ)` multiplies the Tate coordinate by `q`.
- Geometric Frobenius on `μ_(ℓⁿ)` acts by `q⁻¹` modulo `ℓⁿ`.
- On the finite constant sheaf of a geometric point, the scheme/descent comparison gives the identity action.

## F.4.1 Normalized bounded constructible systems

`VanishingCycles.adicRealization` indexes §§F.4.1–F.4.6. Generic limits and completion are EnhancedDerivedSheaves §0.3, with module comparisons supplied by DerivedModuleAlgebra §§1.1–1.5 and 1.T.1.

**Normalized bounded constructible systems.** `VanishingCycles.normalizedAdicSystems`.
For locally Noetherian `X` and invertible prime `ℓ` form coherent systems `K_n∈Dᵇ_ctf(X,Λ_n)`,
`Λ_n=ℤ/ℓⁿ`, `n≥1`, with `K_(n+1)⊗ᴸ_(Λ_(n+1))Λ_n≅K_n`. Membership requires common cohomological
and Tor intervals independent of `n`, rather than storing chosen bounds in the object.
Build morphisms, equivalences, shifts, cones, pullback, constant/lisse fixed-rank systems,
twists, finite groups, tensor with uniform bounds and internal Hom for uniformly perfect
sources. Admit ambient truncations only when their finite-Tor/uniform conditions hold.
(Bhatt–Scholze §6.8; SGA 5 VI.) *Needs:* §§F.0.1–F.0.4, F.1;
EnhancedDerivedSheaves §0.3 inverseLimits and derivedCompletion.

**Checks.**

- The constant tower `Λ_n` with its quotient transitions is normalized.
- Unrelated ranks at successive levels cannot satisfy derived normalization.
- All reductions detect zero for a derived-complete object.

## F.4.2 Classical realization and finite-level cohomology limits

**Classical realization and finite-level cohomology limits.** `VanishingCycles.classicalAdicRealization`.
Define `K_Zℓ=Rlim_n K_n` in the enhanced small-étale sheaf category. Cohomology of the
realization is primitive; prove `RΓ(X,K_Zℓ)≅Rlim RΓ(X,K_n)`. Construct the adic lower-shriek
operation from the normalized finite-level operation, with its reduction/continuity maps,
and prove `RΓc(X,K_Zℓ)≅Rlim RΓc(X,K_n)` under the uniform finite-level bounds and finiteness/ML
conditions of F.3; §F.4.4 proves the resulting integral finiteness. On wider domains explicitly require that the
canonical derived-continuity maps for the relevant functors are equivalences. Keep Milnor
and `lim¹` terms, reductions, proper/`Rf!` comparison, cup/group/coefficient coherence.
Do not apply the torsion `D⁺` lower-shriek construction directly to a discrete `ℤ_ℓ` sheaf.
(Bhatt–Scholze §§5–6; Illusie 1994 §4.4.) *Needs:* normalizedAdicSystems;
F.2–F.3 finite-level operations and finiteness; EnhancedDerivedSheaves §0.3.

**Checks.**

- A separably closed point gives `ℤ_ℓ` in degree zero.
- The `μ_(ℓⁿ)` tower with its power transition maps realizes the Tate object.
- Without ML, the Milnor sequence retains a possibly nonzero `lim¹` term.

## F.4.3 Classical/pro-étale realization comparison

**Classical/pro-étale realization comparison.** `VanishingCycles.etaleProetaleAdicComparison`.
Using SchemeAndStackFoundations §2.17 construct `ν:X_proet→X_et` and finite-torsion
comparison. For locally Noetherian `X` and normalizedAdicSystems' bounded objects, form
`K_pro=Rlim ν*K_n` and prove `Rν*K_pro≅K_Zℓ`, with ordinary and, on F.2's separated finite-type
domain, adic compact-support cohomology comparison. This is derived pushforward comparison;
it does not assert that `ν*` commutes with inverse limits on the small étale site.
Identify the constant pro-étale realization with `Scheme.ellAdicSheaf` and its degreewise
cohomology with `Scheme.EllAdicCohomology`, carrying explicit universe lifts. Prove reductions
and proper/smooth/`Rf!` exchange, cup/Künneth and group/Galois compatibility on their proved
domains. (Bhatt–Scholze §§5–6, especially §6.8; Mathlib Sites/ElladicCohomology.lean.)
*Needs:* normalizedAdicSystems, classicalAdicRealization;
SchemeAndStackFoundations §2.17 (repleteness, w-contractible covers, left completeness);
F.2 exchanges and EnhancedDerivedSheaves §0.3.

**Checks.**

- Constant pro-étale reductions recover `Λ_n` at every `n`.
- A nonconstant finite lisse system retains its monodromy under comparison.
- Each comparison square commutes with the `n+1→n` coefficient reduction.

## F.4.4 Integral finiteness, perfectness and derived reduction

**Integral finiteness, perfectness and derived reduction.** `VanishingCycles.adicFiniteness`.
For separated finite-type `X` over separably closed `k`, `ℓ` invertible in `k` and a normalized
constructible system with uniform cohomological and Tor bounds, prove finite generation
of `Hⁱ` and `Hⁱc` over `ℤ_ℓ`, bounded perfect `RΓ` and `RΓc`, and
`RΓ_(c)(X,K_Zℓ)⊗ᴸΛ_n≅RΓ_(c)(X,K_n)` for every `n`. Build small-universe models and comparisons
with Mathlib's lifted objects. Prove the finite-level, ML and derived-completeness argument
from F.3, followed by geometric continuity; arithmetic field cohomological dimension is
an additional hypothesis on arithmetic versions. (Bhatt–Scholze §6.8; SGA 4½ [Th. finitude];
Illusie 1994 §4.4.) *Needs:* F.3 proper and compact-support finiteness, including ordinary
geometric finiteness; normalizedAdicSystems, classicalAdicRealization, etaleProetaleAdicComparison;
EnhancedDerivedSheaves §0.3.

**Checks.**

- A geometric point with the constant system gives a free rank-one `ℤ_ℓ`-module.
- Derived reduction of integral torsion retains the Tor group in the adjacent degree.
- A nonseparably closed field is not covered by this geometric boundedness theorem.

## F.4.5 Rational realization and finite-dimensional cohomology

**Rational realization and finite-dimensional cohomology.** `VanishingCycles.rationalAdicRealization`.
On Noetherian `X` with invertible `ℓ` define lisse rational sheaves as locally free finite-rank
`ℚ_ℓ,X`-module sheaves on `X_proet`, where `ℚ_ℓ,X=ℤ_ℓ,X[1/ℓ]`. Prove pro-étale descent and
étale-local existence of lisse integral lattices. Separate the full subcategory admitting
a global lisse `ℤ_ℓ` lattice: rationalization of integral lisse systems is fully faithful
up to isogeny with precisely this essential image. On connected `X` with a geometric basepoint,
this subcategory corresponds to continuous finite-dimensional representations of F.0's
profinite `π₁`; compactness supplies a stable lattice. If `X` is geometrically unibranch
(in particular normal), every lisse rational sheaf is in this subcategory. No general
pro-étale fundamental-group construction is required.

Define the general bounded constructible rational category by finite stratifications with
lisse rational cohomology on the strata. Prove that each such object has a bounded
constructible integral model, whose derived reductions have the common cohomological and
Tor bounds of normalizedAdicSystems, and that rationalization gives an equivalence from
the integral constructible category up to isogeny. An integral model of a lisse rational
sheaf need only be constructible. Rationalizing etaleProetaleAdicComparison transports
this equivalence to the classical normalized constructible category; it preserves both
general rational lissity and the distinguished global-lattice subcategory without making
their essential images equal. This comparison uses integral derived realization followed
by rationalization, rather than an interchange of `ν*` with inverse limits.

On separated finite-type `X` over separably closed `k` with invertible `ℓ` prove
`RΓ_(c)(X,K_Qℓ)≅RΓ_(c)(X,K_Zℓ)⊗ᴸℚ_ℓ`, finite-dimensional `Hⁱ_(c)` and bounded amplitude
for a constructible integral model `K_Zℓ`. Prove independence of the integral model,
tensor/Hom/duality, ordinary/compact Künneth and trace/determinant scalar comparison.
Include finite `E/ℚ_ℓ` by scalar extension, using `O_E` lattices, and bounded constructible
`ℚ̄_ℓ` objects defined over finite `E`.
(Bhatt–Scholze Definition 6.8.3, Proposition 6.8.4(4)–(6), Lemma 6.8.13,
Proposition 6.8.14 and Lemma 7.4.10; flat scalar extension.) *Needs:* normalizedAdicSystems
through adicFiniteness; §F.0.2 finiteEtaleGaloisCategory; F.2 Künneth;
§F.4.0 (`exists_stable_lattice_iff`,
`GaloisLattice.IntegralModel.nonempty`); Mathlib finite-dimensional trace/determinant.

**Checks.**

- `ℤ_ℓ/ℓ` rationalizes to zero; `ℤ_ℓ` rationalizes to a line over `ℚ_ℓ`.
- On the rational nodal curve `ℙ¹/(0∼∞)` over algebraically closed `k` of characteristic
  different from `ℓ`, descend the constant rational line on the infinite-chain cover with
  loop multiplier `ℓ`. It is lisse and has a constructible integral model, but no global
  lisse lattice: `ℓ·ℓᵃℤ_ℓ≠ℓᵃℤ_ℓ` for every `a`. Its monodromy does not come from profinite `π₁`.
- On a connected normal Noetherian scheme every lisse rational object has a global
  lisse lattice and recovers the ordinary continuous profinite-representation correspondence.
- `𝔾_m` has two finite-dimensional compact-support groups in degrees one and two,
  different from its ordinary groups in degrees zero and one.

## F.4.6 Continuous actions and finite-level operation comparison

**Continuous actions and finite-level operation comparison.** `VanishingCycles.adicFunctoriality`.
For `X/k` and coefficient descent data in normalizedAdicSystems' category, construct the
continuous `G_k` action on geometric ordinary/compact cohomology and their complexes,
restriction along field extensions and conjugacy under change of separable closure.
Retain finite-group, tensor and twist coherence. Pass proper/smooth/`Rf!` exchange,
projection, lissity and both Künneth formulas through normalized systems and derived
completeness under the respective F.2–F.3 hypotheses and verified uniform bounds.
§F.10.2b specializes this action. (Bhatt–Scholze §§5–6.)
*Needs:* normalizedAdicSystems through rationalAdicRealization; F.2–F.3 finite-level
operations; §F.0.4 universalHomeomorphismEtaleEquivalence and §F.10.2 finite-level Frobenius bridge.

**Checks.**

- Geometric `q`-Frobenius acts on `ℚ_ℓ(1)` by `q⁻¹`.
- Restriction to `𝔽_(qʳ)` takes Frobenius to its `r`-th power.
- A finite symmetry compatible with descent commutes with the Galois action.

## F.10.2b Scheme/descent Frobenius comparison, adic extension

**Scheme/descent Frobenius comparison through realization.** `VanishingCycles.frobeniusCohomology`. For `X` over a finite field `k` and a normalized bounded constructible system descended over `k`, extend §F.10.2's comparison through normalized realization and rationalization. With the coefficient identification retained, `q`-power scheme pullback is geometric cohomological Frobenius, inverse to arithmetic Galois action. Prove all `r`-power, Tate-twist, finite-group and coefficient-reduction compatibilities; an arbitrary complex on `X_k̄` without descent data has no asserted canonical action. (SGA 4½ [Rapport] §§1–2; Weil I §§1–2.)
*Needs:* §F.10.2; §§F.4.1–F.4.6 and their continuity, uniform-bound and ML hypotheses.

**Checks.**

- Arithmetic Frobenius on `μ_(ℓⁿ)` multiplies the Tate coordinate by `q` at every level.
- Geometric Frobenius on `ℚ_ℓ(1)` multiplies by `q⁻¹`.
- `H²c(𝔸¹,ℚ_ℓ)=ℚ_ℓ(−1)` has geometric trace `q`.
- Reduction of the realized comparison is the finite-level comparison.

## 0.9 Algebraic cycle classes and the projective bundle formula

**Normalized algebraic classes.** For `n>0` invertible on a qcqs scheme `X`, provide `ClassicalAlgebraic.cycleClasses`: the Kummer first Chern class of a line bundle and the localized class `cl_Z∈H_Z^(2c)(X,μ_n^⊗c)` for a regular immersion `Z→X` of codimension `c` between schemes smooth over a common base on which `n` is invertible. Construct the class by deformation to the normal bundle and prove transverse pullback, composition of regular immersions and Cartier-divisor agreement. Provide the étale projective bundle formula for a rank-`r` vector bundle, with summands indexed by `0≤i<r` generated by `c₁(O(1))ⁱ` and normalization by degree-one point classes. For `r=0` both the sum and projectivization are empty. No absolute purity for arbitrary singular schemes is included. (SGA 4½, *Cycle*, §§1–2; SGA 4, Exposé XVIII, §§2–3; Kummer sequence: Stacks, tag 03PL.)

For finite commutative `Λ` annihilated by `n`, use derived extension of scalars from `ℤ/n` for the same classes and projective-bundle decomposition, compatibly with pullback and coefficient reduction. Over a separably closed field this gives one `Λ(−i)` summand in degree `2i` for `P^m`, generated by the hyperplane powers for `0≤i≤m`. §F.6 (`VanishingCycles.smoothPairGysin`), consumes these finite classes for higher Gysin, self-intersection and adic extensions; §F.10 uses the same hyperplane generator and Tate orientation in its Frobenius calculations.

*Needs:* §§0.7–0.8 and F.0.3; SchemeAndStackFoundations §§2.11, 0.3, 5.5; StableReduction Layer 4.

**Checks.**

- On `P¹` over an algebraically closed field, `c₁(O(1))` has trace `+1`.
- The divisor `T=0` on `A¹` has localized class given by the Kummer connecting image of `T`.
- A rank-one bundle has projectivization `X` and only the degree-zero projective-bundle summand.
- The zero bundle has empty projectivization and zero cohomology, including over `Spec k`; there is no degree-zero basis vector.

**Regular-immersion classes.** Provide `ClassicalAlgebraic.lciCycleClass`: for a regular closed immersion `i:Z→X` of pure codimension `c` between locally noetherian schemes, with `n>0` invertible on `X`, construct `cl_Z∈H_Z^(2c)(X,Λ(c))`, `Λ=ℤ/n`. For `c>0`, use the exceptional divisor of `Bl_Z(X)`, the projective bundle formula for its normal bundle and the monic relation for the negative exceptional-divisor class; its constant term defines `cl_Z`. For `c=0`, use the coefficient unit on the open-and-closed support. Prove Cartier agreement, coefficient reduction `ℤ/n→ℤ/m` for `m>0` with `m|n`, transverse pullback when the pulled-back immersion remains regular of codimension `c`, and agreement with `ClassicalAlgebraic.cycleClasses` on locally noetherian pairs in its smooth-pair scope. This constructs a class without asserting purity for singular pairs. (Fujiwara, *A proof of the absolute purity conjecture (after Gabber)*, §1.1, Lemma 1.1.1 and Definition 1.1.2; Li–Reinecke–Zavyalov, §§3.2–3.3, Proposition 3.2.5 and Definition 3.3.2, pp. 24–25, and §3.4, Lemma 3.4.1, pp. 27–28.)

**Checks.**

- A Cartier divisor has the localized Kummer first Chern class; the class of `T=0` on `A¹` has the degree-one point normalization.
- In `A³_C` for `C=ℂ₃` and `n=2`, `Z=V(y²−x³,t)` is a codimension-two regular immersion with singular `Z`. Its degree-four, twist-two class exists; smooth-pair purity does not cover `Z`.
- Reduction from `ℤ/4` to `ℤ/2` carries the class of the coordinate origin in `A²` to the corresponding `ℤ/2` class, with degree 4 and twist 2.

*Needs:* Sections 0.7–0.8 and the projective bundle formula above; `SchemeAndStackFoundations`, §2.11 for Hilbert 90 and Kummer, §0.3 (`relativeProj`) for relative Proj and §5.5 (`normalBundle`, `deformationToNormalCone`) for normal-bundle and deformation geometry; `StableReduction`, Layer 4, for the Rees blow-up of a quasi-coherent finite-type ideal, using the pinned Tau Ceti affine blow-up charts. The analytification comparison consumes the algebraic class defined here. Finite `Λ`-Tate twists are supplied by §F.0.3 (`VanishingCycles.etaleTateTwists`); the cycle-class and projective-bundle normalization is owned here.

## 0.10 Relative purity and normal-crossings restriction

**Smooth-boundary purity.** Provide `ClassicalAlgebraic.smoothBoundaryPurity`: for a closed immersion `i:Z→X` of codimension `c` between schemes smooth over a field `k` and `n>0` invertible in `k`, `i!Λ_X≅Λ_Z(−c)[−2c]` for `Λ=ℤ/n`, with its counit carrying the class of Section 0.9. For `j` the complement of a strict normal-crossings divisor in smooth `X` and `F` finite locally constant on `X`, give at a strict-local point with `r` branches the exterior algebra on the local Kummer equations: `(R^qj*j*F)_x=F_x⊗Λ∧^q(Λ(−1)^r)`, naturally in restriction maps. This is relative smooth-boundary purity, not a hypothesis-free assertion of absolute purity. (SGA 4, Exposé XVI, §3 and Exposé XVIII, §3; SGA 4½, *Cycle*, §2; Huber (1996), Theorem 3.9.1, p. 230, and proof, pp. 230–237, for its analytic comparison use.)

**Checks.**

- No branch gives `F_x` in degree zero and zero in positive degrees.
- One branch with `F=Λ²` gives rank two in both degrees zero and one.
- Two transverse branches give two degree-one Kummer generators and their degree-two product; a local system only on the complement with nontrivial boundary monodromy is outside this formula.

*Needs:* Sections 0.7–0.9; scheme strict localization, Kummer and smooth coordinates from `SchemeAndStackFoundations`.

## 0.11 Algebraic smooth trace and curve duality

**Algebraic smooth trace.** For a separated smooth finitely presented `f:X→S` of relative pure dimension `d`, with a compactification as in Section 0.8, `n>0` invertible on `S` and `Λ=ℤ/n`, provide `ClassicalAlgebraic.smoothTrace`: `Rf!Λ(d)[2d]→Λ`. Normalize by degree-one point classes and prove composition, open restriction, finite flat trace and base-change compatibility. Construct it for curves using the pointed smooth proper field-curve Jacobian of JacobianChallenge Layer D, Kummer and effacement, then by elementary smooth charts in dimension `d`. Build the étale-local reduction and spreading/base-change comparisons from relative smooth curves to that field-curve construction, including independence of the chosen point and descent of the trace. No arbitrary-base relative Jacobian is assumed supplied. (SGA 4, Exposé XVIII, §§1–3, especially Theorem 3.2.5; SGA 4½, *Cycle*, §2.)

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; §§0.5–0.10; SchemeAndStackFoundations §§2.11, 2.16; JacobianChallenge Layer D (pointed smooth proper curves over fields); the relative reduction and comparisons constructed in this target.

**Checks.**

- The dimension-zero identity morphism has identity trace.
- The `P¹` trace sends `c₁(O(1))` to 1, fixing the sign on open curves by extension by zero.
- For `S=Spec C` with `C` algebraically closed and `n>1` invertible in `C`, `X=A¹_C⊔A¹_C` has `R²f_!μ_n=(ℤ/n)²` and trace is addition, with nonzero kernel. Both components lie over the same base point. For `S=Spec ℂ₃⊔Spec ℂ₃`, one `A¹` over each point and `n=2` instead give identity trace on both stalks.

**Algebraic curve duality and effacement.** Under the same hypotheses with `d=1`, provide `ClassicalAlgebraic.curveDuality`: for constructible finite-Tor-amplitude `K`, the trace pairing identifies `Rf*Rℋom(K,Λ(1)[2])` with `Rℋom(Rf!K,Λ)`. Prove the curve effacement and smooth local-acyclicity calculations used in the passage from coordinate charts to local systems. Higher-dimensional trace is supplied above; higher-dimensional scheme duality is outside this target. (SGA 4, Exposé XVIII, §§1–3; SGA 4½, *Cycle*, §2.)

**Checks.**

- For a proper smooth connected curve over an algebraically closed field, the pairing on `H⁰` and `H²` is the normalized degree pairing.
- For `A¹` over such a field, `RΓ_cΛ=Λ(−1)[−2]` pairs with `RΓΛ=Λ`.
- A finite direct sum of finite locally free coefficient sheaves has the direct sum of the duality pairings; finite Tor amplitude is retained.

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; this roadmap §§0.5–0.10; `SchemeAndStackFoundations`, §§2.11 and 2.16, and `JacobianChallenge`, Layer D, for the pointed smooth proper field-curve Jacobian; the relative reduction and base-change comparisons of the smooth-trace target above.

## F.5 Exceptional inverse image and duality

**Theorem.** Construct `VanishingCycles.etaleExceptionalInverseImage`, right adjoint to `Rf_!`
on the finite-cohomological-dimension domain of F.2, and `VanishingCycles.etaleVerdierDuality`.
For separated finite-type field schemes use `D_XK=RHom(K,a_X^!Λ)`; prove biduality on bounded
constructible finite-Tor complexes, tensor–Hom adjunction, proper duality and localization
with supports. Include the dualizing complexes and local biduality on excellent traits used
in trait-duality applications: construct the trait dualizing complex by its dimension-one Kummer calculation,
then finite-type exceptional pullback and local biduality. Retain finite-Tor hypotheses; this
construction supplies absolute-purity applications. Adic duality is the realization of F.4.
(SGA 4 XVIII §3; SGA 4½ [Th. finitude] §4; ILO XVII §§0–2.)
*Needs:* F.1–F.4, including §F.3a; §§0.7–0.11 (support localization,
finite trace, smooth trace and curve duality on their stated torsion domains);
SchemeAndStackFoundations §0.21. Higher-dimensional duality and trait dualizing complexes are built here.

**Checks.**

- On a geometric point with field coefficients, duality is ordinary linear duality.
- For a proper smooth curve it pairs `H⁰` with `H²(1)` and `H¹` with `H¹(1)`.
- With integral coefficients on a point, the dual of `ℤ_ℓ/ℓ` is `(ℤ_ℓ/ℓ)[−1]`.

## F.6 Smooth purity, Gysin maps and cycle classes

**Theorem.** Prove `VanishingCycles.smoothPurity`: for smooth `f` of relative dimension `d`,
`f^!Λ≅Λ(d)[2d]`, using the normalized `ClassicalAlgebraic.smoothTrace` and extending
`ClassicalAlgebraic.curveDuality` to higher-dimensional Poincaré duality. Use
`ClassicalAlgebraic.cycleClasses` and `ClassicalAlgebraic.smoothBoundaryPurity` for smooth
field pairs with invertible finite coefficients. Extend them as `VanishingCycles.smoothPairGysin`
with projection and self-intersection formulas and the adic realizations of F.4. Construct
the additional Gysin morphism for smoothable local complete intersection morphisms
between regular schemes with ample bundles; its being an isomorphism for general regular
pairs is the absolute-purity theorem of LefschetzPencilsAndVanishingCycles §0.10. (SGA 4 XVIII 3.2; SGA 5 VII; ILO XVI §§1–2.)
*Needs:* F.2, F.4–F.5; §§0.9–0.11; SchemeAndStackFoundations Layer 5 (Chow and Chern classes).

**Checks.**

- The point zero in `𝔸¹` has supported `H²(Λ(1))=Λ`, generated by its cycle class.
- A line in `ℙ²` has self-intersection one.
- On a smooth surface over a separably closed field, the exceptional curve of the blow-up at a rational point has self-intersection `−1`. Over a general field, a separable closed point of degree `d` gives exceptional intersection degree `−d` over the base: the point `y=0, x²−2=0` in an affine chart of `ℙ²_ℚ` gives `−2`.

**Étale Gauss–Bonnet.** `VanishingCycles.etaleGaussBonnet`. For smooth proper
pure-dimensional `X` of dimension `d` over algebraically closed `k` and `ℓ` invertible in `k`, prove

`deg c_d(T_X) = Σ_i (−1)ⁱ dim_Qℓ Hⁱ_et(X,ℚ_ℓ)`.

Use the diagonal's regular-immersion cycle class and its self-intersection to identify the
left side with the diagonal intersection. Compute the identity correspondence's trace by
ordinary Künneth and Poincaré duality, giving the right side. This is an arbitrary-field
identity for the stated smooth proper domain. (SGA 5 III, VII, cycle-class and Lefschetz
formalism; F.6 projection/self-intersection formulas.) *Needs:* §F.2.6 etaleKunneth;
F.4 adicFiniteness and rationalAdicRealization; F.5–F.6 duality and diagonal Gysin;
§0.9 / cycleClasses; SchemeAndStackFoundations §5.4 Chern classes.

**Checks.**

- `ℙ²` gives top Chern degree and Euler characteristic three.
- `ℙ¹×ℙ¹` gives four on both sides.
- A positive-dimensional abelian variety has trivial tangent bundle, top Chern degree
  zero and Euler characteristic zero.

## F.7 Projective bundles, blow-ups and weak Lefschetz

**Theorem.** Use the projective-bundle formula of `ClassicalAlgebraic.cycleClasses` with
its hyperplane generators, and realize it adically by F.4. Prove `VanishingCycles.etaleBlowup`
for a smooth separated finite-type `k`-scheme `X` and a smooth closed `k`-subscheme `Z` of pure
codimension `c≥1`:

`RΓ(Bl_Z X,Λ) ≅ RΓ(X,Λ) ⊕ ⨁_(1≤i<c) RΓ(Z,Λ)(−i)[−2i]`.

Construct this decomposition with exceptional Gysin maps and their inverse signs, and its
compact-support analogue with `RΓ_c` in every summand. Coefficients are finite `Λ` with
invertible annihilator in `k`, or integral/rational `ℓ`-adic coefficients with `ℓ≠char(k)`, using
F.4 for realization. The formula is valid over arbitrary `k`; geometric specialization uses
`X_k̄` and `Z_k̄`. Prove separately `VanishingCycles.etaleWeakLefschetz` for a smooth ample
hyperplane section of a smooth projective variety: isomorphism below the middle degree and
injection at the middle, on the same coefficient domain. (SGA 5 VII; SGA 4 XIV §3; SGA 7 XVIII §§2–5.)
*Needs:* F.3–F.4, F.6; §0.9; SchemeAndStackFoundations §§0.3, 5.4 (`relativeProj`, `projectiveBundle`, `projectiveBundle_dual_convention`);
StableReduction Layer 4 (Rees-algebra blow-ups).

**Checks.**

- For separably closed `k` and invertible finite `Λ`, or `ℓ`-adic coefficients with `ℓ≠char(k)`, `H^*(ℙ^r_k,Λ)` has one `Λ(−i)` in each degree `2i`, `0≤i≤r`, and no odd groups. Over arbitrary `k` use the projective-bundle formula over `RΓ(k,Λ)`; for `k=𝔽_q` and nonzero `Λ=ℤ/ℓ` with `ℓ∤q`, `H¹(Spec k,Λ)=Λ` survives on `ℙ^r_k`.
- Blowing up a smooth surface at a rational point over a separably closed field adds one middle Tate class of square `−1`. A separable closed point of degree `d` over a general field adds `d` geometric Tate classes and has exceptional intersection degree `−d` over the base. For `y=0, x²−2=0` in `ℙ²_ℚ` there are two classes after base change to `ℚ̄` and degree `−2`.
- Blowing up a smooth Cartier divisor (`c=1`) is the identity and adds no summands. For the nodal rational curve `X=ℙ¹_ℂ/(0∼∞)`, blowing up the node gives `ℙ¹_ℂ` and changes `H¹` from `ℚ_ℓ` to zero; its smooth centre does not satisfy the smooth-ambient hypothesis.
- For a smooth plane cubic `C⊂ℙ²` over an algebraically closed field with invertible nonzero finite field coefficients, `H¹(ℙ²)=0→H¹(C)=Λ²` is injective and is not an isomorphism.

## F.8 Perverse t-structures over a field

**Construction.** Let `X` be a finite-type scheme over a field `k`, with finite coefficients `Λ` whose annihilator is invertible in `k`, or integral/rational `ℓ`-adic coefficients with `ℓ≠char(k)`. Build `VanishingCycles.fieldPerverseTStructure` on the corresponding bounded constructible
complexes by the middle support and cosupport inequalities for `δ(x)=dim closure{x}`.
Prove the `t`-structure axioms, open–closed gluing, the abelian heart, perverse cohomology,
`VanishingCycles.intermediateExtension` as
`im(ᵖH⁰j_!→ᵖH⁰Rj_*)`, with its no-boundary-subobject/no-boundary-quotient characterization.
Include finite coefficients and the distinct integral perversities `p,p⁺`; integral duality
exchanges them, rational duality preserves the middle perversity. For affine `X` over
separably closed `k` and finite or rational coefficients, prove `Hⁱ(X,P)=0` for `i>0` and
`H_cⁱ(X,P)=0` for `i<0` for perverse `P`. For integral coefficients, the `p` heart has `Hⁱ(X,P)=0`
for `i>0`; the `p⁺` heart has `Hⁱ(X,P)=0` for `i>1` and torsion `H¹(X,P)`. Both have `H_cⁱ(X,P)=0`
for `i<0`, and `H_c⁰(X,P)` is torsion-free for `P` in the `p⁺` heart. Over arbitrary `k` apply
these statements to `X_k̄`; compute arithmetic cohomology through Galois cohomology of the
geometric complex. (BBD §§1.4, 2.2, 4.1.1, 4.4; Illusie 1994 §4; Juteau,
*Decomposition numbers for perverse sheaves*, §2.1, equations (2.4)–(2.7), for the integral
`p⁺` inequalities and torsion tilt.) *Needs:* F.1–F.6.

**Checks.** All schemes are finite type over `k` and coefficients have the preceding invertibility hypotheses.

- On a nonempty smooth curve with `Λ≠0`, `Λ[1]` is perverse, whereas `Λ` is not.
- On the empty scheme, or with the zero coefficient ring, both shifts are the zero perverse object.
- A skyscraper at a closed point is perverse with no shift.
- For `j:𝔾_m→𝔸¹` over an algebraically closed field and invertible finite field coefficients, `j_!*Λ[1]=Λ_𝔸¹[1]`; it has no nonzero subobject or quotient supported at the origin.
- For the identity open immersion, intermediate extension is the identity.
- Restricting intermediate extension back to the open recovers its input, and applying it to zero gives zero.
- On a geometric point the integral torsion sheaf `ℤ_ℓ/ℓ` has dual `(ℤ_ℓ/ℓ)[−1]` in the `p⁺` heart, not the `p` heart; its `H¹` is nonzero torsion, testing the `p⁺` upper bound.
- On the affine arithmetic point `Spec ℝ` with `Λ=𝔽₂`, `Λ[0]` is perverse but `Hⁱ_et(Spec ℝ,Λ)=𝔽₂` for every `i≥0`. Its geometric point has no positive cohomology, so affine vanishing is asserted geometrically.
- For `j:𝔾_m→𝔸¹` over `𝔽̄_p`, coefficients `𝔽_p` are excluded: the independent Artin–Schreier classes `t^(−a)`, `p∤a`, in the strict-local fraction field give an infinite-dimensional `(R¹j_*𝔽_p)_0`, so `Rj_*` does not preserve constructibility.

## F.10.3 Perfect-complex traces and coherent additivity

**Perfect-complex traces and coherent additivity.** `PerfectComplex.lefschetzNumber`,
`PerfectComplex.filteredTraceAdditivity`. For a commutative ring `R` and an endomorphism
of a perfect derived `R`-module object, lift to a bounded finite-projective representative
and take the alternating termwise trace supplied by AdicSpacesPartIII §R3.8 /
`LinearMap.projectiveTrace`, with its finite-free comparison, base change and cross-object
cyclicity. Prove representative, lift and homotopy
independence, shift sign, scalar extension, tensor/dual identities and agreement with
cohomology traces when cohomology is finite projective or `R` is a field. Identify the module
objects satisfying `DerivedDeRham.IsPerfect R K`, equivalently its alias
`PerfectComplex.IsPerfect R K` from DerivedModuleAlgebra §1.E.0, with the dualizable
objects for the tensor of DerivedModuleAlgebra §0.2, using Mathlib's existing notions
(Stacks, Tag 0FNS). Consume
DGAInfinity Layer 5's perfect/compact equivalence on the one-object DG category `R`
concentrated in degree zero. Construct `PerfectComplexInput(R)` as the realization
equivalence from these perfect DG objects onto the full subcategory of
`DerivedCategory (ModuleCat R)` defined by that
shared predicate, and prove the dualizable comparison through it. Its unit, counit and
comparisons are natural in module morphisms and coefficient maps and commute with shifts,
scalar extension, tensor, duals and finite filtered graded-piece maps. A bounded
finite-projective representative realizes to its usual derived object, and its trace to
the alternating termwise trace.
Construct filtered derived objects and endomorphisms before localization and prove
`L(u,K)=Σ_a L(grᵃu,grᵃK)` when the finite filtration and its graded pieces are perfect.
Use this coherent enhancement for open–closed additivity and devissage.

Build Hattori–Stallings trace for finite projective right modules over every ring `R` in the
additive quotient `R/[R,R]`, with cyclicity, complement independence, direct-sum/split-exact
additivity, scalar extension and the commutative tensor/dual/rank rules. Right modules
use left modules over the opposite ring. Prove that the commutative specialization of
Hattori–Stallings trace agrees with the supplied `LinearMap.projectiveTrace`. Over commutative
rings use PadicMeasuresIwasawaAlgebras §5.1's `projectiveDeterminant`,
`projectiveDeterminantMap` and base-change API. Define the scalar determinant of an
endomorphism through `End(det P)≅R`, and its characteristic polynomial by applying that
determinant to `T·id−u` after `R→R[T]`; prove agreement with the finite-free API. For finite `G` define `ε:Λ[G]/[Λ[G],Λ[G]]→Λ/[Λ,Λ]` by the identity coefficient and
`Tr^G=ε∘Tr_HS` on finite-projective `Λ[G]`-modules. For an extension
`1→G→Γ̃→ℤ→1` let `Γ` be the inverse image of `ℕ`. If `P` is a `Λ[Γ]`-module finite projective
as a `Λ[G]`-module and `γ∈Γ`, put `Z_γ={g∈G | gγ=γg}`; prove
`Tr_Λ(γ,P)=|Z_γ|Tr_Λ^(Z_γ)(γ,P)` and
`Tr_Λ(1,P_G)=Σ′_(γ↦1) Tr_Λ^(Z_γ)(γ,P)`, with one summand per `G`-conjugacy class.
For commutative `A` mapping centrally to `Λ`, `P` finite projective over `A[G]` with `Γ`-action,
and `M` a `Λ[Γ]`-module finite projective over `Λ`, prove diagonal tensor projectivity and
`Tr_Λ^(Z_γ)(γ,P⊗_A M)=Tr_A^(Z_γ)(γ,P)·Tr_Λ(γ,M)`. Build induction and the auxiliary
`A=ℤ/ℓⁿ` coefficient-descent argument used in the curve proof. These are the precise
monoid-extension identities of Stacks §64.15, Lemmas 64.15.1–64.15.9.
No division by `|G|` is used. Generic code belongs in module and category-theory namespaces,
outside algebraic geometry. The split-retract comparison
`PerfectComplex.projectiveTraceOfRetract` takes inclusion `i` and retraction `r` with `r∘i=id`
and uses Mathlib finite-free trace. Prove it equals the supplied `LinearMap.projectiveTrace R P u`;
`PerfectComplex.projectiveTraceOfRetract_eq_contract` states this against the supplier's
contraction formula, `contractLeft R P ((dualTensorHomEquiv R P P).symm u)`.
`PerfectComplex.projectiveTrace_independent` is the resulting independence of the chosen
split retract. Every finite projective admits such a finite-free retract.
(Stacks §§64.4–64.6, 64.15; finite-projective duality and filtered-complex trace formalism.)
*Needs:* EnhancedDerivedSheaves §§0.1–0.4 enhancement/tensor; the finite filtered enhanced objects constructed in this target before localization;
Mathlib projective modules, matrices and trace; DerivedModuleAlgebra §§0.2, 1.E.0 for
module-derived tensor and the shared ordinary-module perfectness predicate;
AdicSpacesPartIII §R3.8 for commutative projective trace; DGAInfinity Layer 5 for
perfect/compact equivalence; PadicMeasuresIwasawaAlgebras §5.1 for finite-projective
determinants and determinant maps.
Geometric uses verify coefficient-ring perfectness by §F.3 and group-ring perfectness by
§F.10.4; neither geometric assertion is a prerequisite of this algebraic trace construction.

**Checks.**

- A shift by one negates the Lefschetz number.
- An acyclic bounded projective representative has trace zero.
- The identity on `[ℤ/4 —2→ ℤ/4]` has Lefschetz number zero, although both cohomology
  modules are `ℤ/2` and their finite-projective traces are not defined.
- Group-ring identities remain meaningful when `|G|` is zero in `Λ`.
- For any finite-free split retract with `r∘i=id`, the zero endomorphism has projectiveTraceOfRetract equal to zero.
- On the standard rank-`r` free retract the identity has trace `r`, including `r=0`.
- On `ℤ`, `i=0` and `r=id` do not satisfy `r∘i=id`, so they are excluded as retract data; their raw cyclic expression would give zero for the identity instead of one.
- On `R²`, `diag(a,b)` has trace `a+b`; adjoining a zero complement to the split retract leaves that value unchanged.
- For `R=k×k` and `P=(1,0)R` with `u` multiplication by `(a,b)`, the characteristic polynomial is `(T−a,1)` in `k[T]×k[T]`; the supplied determinant handles the ranks `(1,0)`.

## F.10.4 Free-torsor equivariant compact-support perfectness

**Free-torsor equivariant compact-support perfectness.**
`VanishingCycles.freeTorsorEquivariantPerfectness`. Let `U` be a smooth affine curve over a
field `k`, `ℓ` invertible in `k`, `A=ℤ/ℓ^ν` with `ν≥1`, and `q:V→U` a finite étale torsor under a
finite constant group `G` acting on the left. On the existing enhanced étale module-sheaf
carriers construct the actual deck-equivariant complex
`P_A=RΓc(V_k̄,A)≅RΓc(U_k̄,q_*A)` and prove `P_A∈D_perf(A[G])`. Use the left action
`g·s=(g⁻¹)*s` on `q_*A` and cohomology; right modules are left modules over the opposite ring,
with `p·g=g⁻¹·p`. Prove independence of compactification, field-extension compatibility
and derived reduction `P_A⊗ᴸ_A A′≅P_A′` for `A′=ℤ/ℓ^μ`, `1≤μ≤ν`. If `q` and its `G`-action
are defined over finite `k`, retain the commuting Frobenius action of frobeniusCohomology.

Build the finite-ring perfectness argument needed here for the actual possibly
noncommutative ring `R=A[G]`: `q_*A` is locally free of rank one over `R`, and its extension
by zero to a projective compactification of `U` is constructible of Tor amplitude `[0,0]`
over `R`. Construct right–left derived tensor over `R` on these same enhancement carriers
using flat resolutions, with quasi-isomorphism invariance and associative coefficient
extension. Prove the projection comparison
`N⊗ᴸ_R RΓc(U_k̄,q_*A)≅RΓc(U_k̄,N⊗ᴸ_R q_*A)` for right `R`-modules `N`.
Finite cohomology and the uniform geometric cohomological bound then give finite Tor
amplitude and a bounded finite-projective `R`-representative. This is perfectness of the
total complex, without projectivity of its cohomology modules. No invertibility of `|G|`
is assumed. (Stacks §64.13, Proposition 64.13.1, tag 03TV, proof with right coefficient
modules; §64.16, Steps 4–7, tag 03UF.) *Needs:* §F.0.2 finite étale torsors;
F.1 enhanced module sheaves and coherent actions; F.2 compact-support construction;
F.3 geometric finiteness and cohomological dimension; EnhancedDerivedSheaves §§0.1–0.4; §§0.7–0.8 (enhancement and arbitrary-ring torsion lower shriek).
The noncommutative projection and Tor argument on this torsor domain are targets here.

**Checks.**

- The trivial torsor `V=G×U` gives `P_A≅A[G]⊗_A RΓc(U_k̄,A)`, perfect over `A[G]`.
- The free Kummer `C_ℓ`-torsor `t↦t^ℓ` on `𝔾_m` over `k` containing `μ_ℓ`, `char k≠ℓ`, satisfies
  the theorem with `A=𝔽_ℓ`, including when `ℓ` divides `|G|`.
- On a point with trivial `C₂`-action, `A=𝔽₂` is perfect over `A` but not over
  `A[C₂]=𝔽₂[ε]/(ε²)`: the resolution with differential `ε` gives `Tor_i(A,A)=A` for every `i≥0`.
  This action is not a torsor and does not satisfy the free-action hypothesis.
- Reducing from `ℤ/ℓ²` to `𝔽_ℓ` gives the same equivariant complex as constructing `P_𝔽ℓ` directly.

## F.10.5 Derived coefficient descent along a finite torsor

**Derived coefficient descent along a finite torsor.**
`VanishingCycles.freeTorsorCoefficientDescent`. On the preceding torsor domain let `Λ` be a
finite commutative `A`-algebra and `M` a finite projective `Λ`-module with left `Λ`-linear `G`-action.
Let `F_M` be the descended lisse sheaf, with `q*F_M` identified with the constant `M`-sheaf and
its given descent action. Give `q_*A⊗_A M` and `P_A⊗ᴸ_A M` the diagonal left `G`-action and
convert both to right `Λ[G]`-modules by `x·g=g⁻¹·x`; `Λ` is the trivial left `Λ[G]`-module.
Prove `(q_*A⊗_A M)⊗ᴸ_Λ[G]Λ≅F_M` on sheaves and the derived compact-support counterpart

`RΓc(U_k̄,F_M) ≅ (P_A⊗ᴸ_A M)⊗ᴸ_Λ[G]Λ`.

Construct these equivalences in the supplied enhancement, with naturality in `M`,
coefficient reduction, field extension and, over finite `k` with descended data,
Frobenius compatibility. The diagonal tensor of a finite-projective `A[G]`-representative
of `P_A` with `M` is termwise finite projective over `Λ[G]`, although `M` need not be projective
over `A`. Derive the comparison by finite-cover pushforward, the sheaf coinvariant
identification and the right-module projection formula above; no exactness of ordinary
coinvariants for arbitrary `G`-modules is used. (Stacks §64.16, Steps 4–7, tag 03UF;
§64.15, Lemma 64.15.8, tag 03UC.) *Needs:* freeTorsorEquivariantPerfectness;
§F.0.2 finite-cover descent; F.1 coherent derived tensor; PerfectComplex diagonal tensor
projectivity and trace algebra; EnhancedDerivedSheaves §§0.1–0.4.

**Checks.**

- `G=1` gives `RΓc(U_k̄,M)≅RΓc(U_k̄,A)⊗ᴸ_A M`.
- On the free Kummer `C_ℓ`-torsor with `Λ=M=𝔽_ℓ` and trivial coefficient action,
  derived diagonal coinvariants recover `RΓc((𝔾_m)_k̄,𝔽_ℓ)`, including its degrees one and two.
- For `A=ℤ/ℓ²` and `Λ=M=𝔽_ℓ` the comparison still holds; `M` is `Λ`-free but not `A`-projective.
- Frobenius and reduction commute in the comparison square whenever the torsor and
  coefficient descent data are defined over the finite base field.

## References

The individual targets give theorem, section, page and Stacks-tag locators.

- SGA 1, *Revêtements étales et groupe fondamental*, Exposés V, IX, X and XIII; [scan](https://arxiv.org/pdf/math/0206203v2).
- SGA 4, *Théorie des topos et cohomologie étale des schémas*, Exposés V–IX, XII and XIV–XVIII; SGA 4½, *Cohomologie étale*, [Th. finitude], [Cycle] and [Rapport]; SGA 5, *Cohomologie ℓ-adique et fonctions L*, Exposés III, VI and VII.
- P. Deligne, *La conjecture de Weil I*, and P. Deligne and N. Katz, directors, *SGA 7 II*, Exposé XIII, 0.2.5 and Rappel 1.1.3; [scan](https://publications.ias.edu/sites/default/files/Number12.pdf).
- L. Illusie, *Autour du théorème de monodromie locale* (1994), §4, and *Vanishing cycles over general bases* (2006), §1.1; [2006 text](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf).
- B. Bhatt and P. Scholze, *The pro-étale topology for schemes*, Astérisque 369 (2015), §§3, 5–7; [author PDF](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf).
- A. Beilinson, J. Bernstein and P. Deligne, *Faisceaux pervers* (BBD), §§1.4, 2.2, 4.1.1 and 4.4; L. Illusie, Y. Laszlo and F. Orgogozo, *Travaux de Gabber* (ILO), Exposés XVI–XVII.
- D. Juteau, *Decomposition numbers for perverse sheaves*, §2.1, equations (2.4)–(2.7), for integral perversities and the torsion tilt; [text](https://www.numdam.org/item/10.5802/aif.2461.pdf).
- R. Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces* (1996), Proposition 2.4.4 and Corollary 2.4.6, pp. 127–129, and Theorem 3.9.1, p. 230.
- K. Fujiwara, *A proof of the absolute purity conjecture (after Gabber)*, §1.1; S. Li, E. Reinecke and B. Zavyalov, *Relative Poincaré duality in nonarchimedean geometry*, §§3.2–3.4; [preprint](https://arxiv.org/abs/2410.08200v1).
- H. Darmon, F. Diamond and R. Taylor (DDT), *Fermat’s Last Theorem*, §2.1, paragraph after Proposition 2.6, for stable-lattice existence; [text](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf). K. Ribet, *A modular construction of unramified p-extensions of `ℚ(μ_p)`*, Invent. Math. 34 (1976), §2, pp. 153–154.
- G. Böckle, M. Harris, C. Khare and J. Thorne (BHKT), *Ĝ-local systems on smooth projective curves are potentially automorphic*, Theorem 4.8(ii).
- The Stacks Project: [compactifications](https://stacks.math.columbia.edu/tag/0F41), [lower shriek](https://stacks.math.columbia.edu/tag/0F7H), [torsor perfectness](https://stacks.math.columbia.edu/tag/03TV), and the individual locators in the targets.
