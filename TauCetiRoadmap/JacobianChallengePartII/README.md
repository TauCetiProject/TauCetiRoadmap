# Roadmap: the Jacobian challenge, Part II — relative Jacobians, theta bundles and universal differences

**Summary.** The Jacobian challenge builds the Jacobian of a pointed smooth projective curve over a field and its Abel–Jacobi universal property. This roadmap starts where it stops and works in families: a smooth projective curve `X → S` over a noetherian base, with geometrically connected fibres of genus `g > 0` and no chosen section. It cuts the relative Picard scheme into degree components, each a torsor under the degree-zero part; it proves that the degree-zero part `J = J(X/S)` is an abelian scheme of relative dimension `g` with a canonical principal polarization `λ_X` that needs no degree-one line bundle on `X`; it builds the section-free Abel map `X → Pic¹_{X/S}`, the degree-d Abel–Jacobi morphisms `i_α` for every integer d, the degree-one closed immersion and finiteness for `d ≠ 0`; it fixes the sign of the Poincaré bundle on `J ×_S J`, proves Yuan's theta and Poincaré identities over an arbitrary field for an arbitrary degree-one divisor, and identifies Yuan's canonical twice-theta bundle with the graph bundle of `λ_X`; it compares actual line-bundle classes with sections of the relative Picard sheaf and proves Yuan's torsion-cokernel theorems for pullback along Abel maps; it constructs the curve difference morphism, the Faltings–Zhang morphisms on fibre powers, their shifted versions and the triangular coordinate change that factors the shifted canonical power through a tail isogeny; it compares the Hodge bundle of a stable curve with the invariant differentials of its semi-abelian generalized Jacobian; and it records how all of this applies to a curve family carrying a full symplectic level structure on its Jacobian, the form in which the fine moduli of curves with level consume it. The motivating applications are Yuan's uniform Bogomolov-type theorem ([arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4)) and the uniformity results of Dimitrov–Gao–Habegger ([arXiv:2001.10276v3](https://arxiv.org/pdf/2001.10276v3)); their adelic metrics, heights and nondegeneracy theorems belong to other roadmaps.

Every equality of morphisms below is an equality on all test schemes, nonreduced ones included; a check on geometric points never replaces it. Three signs are fixed once and for all: the difference is `j(x, y) = [y] − [x]`, the degree-d Abel map is `i_α(x) = [d·x − α]`, and the Poincaré bundle on `J ×_S J` has negative addition class. Actual line-bundle classes, sections of the relative Picard sheaf and rigidified line bundles are three different kinds of data and are never identified silently.

| Layer | Title | Headline targets |
| --- | --- | --- |
| 0 | Relative Picard degree components and torsors | finite-stage descent of line bundles, relative degree components, local constancy of fibre degree, relative curve Picard representability, Picard degree torsors |
| 1 | Relative Jacobians and principal polarization | relative Jacobian, properness of the relative Jacobian, base change of the relative Jacobian, determinant of curve cohomology, canonical principal polarization |
| 2 | Abel maps and section-free differences | section-free Abel map, degree-d Abel map, degree-one Abel closed immersion, finiteness of nonzero-degree Abel maps, curve difference morphism, difference as the Abel map over X |
| 3 | Poincaré normalization and twice-theta | normalized Jacobian Poincaré bundle, theta divisor with a degree-one class, canonical twice-theta bundle, theta pullback, Poincaré curve-square identity, Poincaré diagonal identity, relative ampleness of twice-theta |
| 4 | Actual Picard groups and autoduality pullbacks | actual fibrewise Picard subgroup, actual bi-zero Picard subgroup, relative curve autoduality, actual Picard pullback torsion cokernel, bi-Picard pullback torsion cokernel, axis-normalized Picard subgroup, pointed square Picard comparison |
| 5 | Fibre powers and shifted Faltings–Zhang maps | canonical-bundle Abel morphism, universal shifted canonical morphism, Faltings–Zhang morphism, shifted Faltings–Zhang morphism, triangular coordinate equivalence, shifted-power factorization |
| 6 | Stable Hodge bundles and determinant lines | Picard Lie–cohomology comparison, curve–Jacobian Hodge bundle comparison, Hodge line isomorphism |
| 7 | Curve families with full symplectic level | Jacobian of a curve family with full level, Faltings–Zhang for a curve family with full level |

## Scope and ownership

The distinction between a Jacobian and its degree-one torsor is the point of the roadmap. A family can have a Jacobian with an identity section while the curve and its degree-one Picard torsor have no section. The curve still maps canonically to that torsor, and subtracting two such images gives a map to the Jacobian without choosing an origin on the curve. A degree-one line bundle, when one exists, supplies a translation to the Jacobian; it is additional input, never part of the curve-family data.

**Owned here.** For a smooth projective curve `X/S` with geometrically connected fibres of genus `g > 0` over a noetherian base: local constancy of the fibre degree and the degree components `Picᵈ_{X/S}`; representability of the relative Picard sheaf by a smooth separated group scheme with quasi-projective degree pieces; the torsor structure of `Picᵈ_{X/S}` under `Pic⁰_{X/S}` and its intrinsic difference; the relative Jacobian as an abelian scheme of relative dimension `g`, its properness, its base change and its canonical principal polarization defined without a degree-one bundle; the section-free Abel map, the degree-d Abel–Jacobi morphisms, their local pointed factorization, the degree-one closed immersion and finiteness for `d ≠ 0`; the curve difference morphism and its description as an Abel map over `X`; the Jacobian Poincaré bundle in Yuan's sign, the theta divisor of an arbitrary degree-one divisor over an arbitrary field and the identities of Yuan's Theorem A.3 (theta pullbacks, Poincaré addition, curve-square and diagonal identities); the identification of the canonical twice-theta bundle with the graph bundle of `λ_X`, and its geometric-fibre class; actual Picard subgroups of projective flat families (fibrewise algebraically trivial classes, the two-projection version and the axis-normalized subgroup), relative curve autoduality with Abel pullback, the actual-to-relative comparison for the curve and its Jacobian, Yuan's torsion-cokernel theorems and the pointed square Picard comparison; the canonical Abel morphism of `ω_{X/S}`, the universal shift, the Faltings–Zhang and shifted Faltings–Zhang morphisms, the triangular coordinate change on fibre powers of a group scheme and the tail-isogeny factorization; for stable curves, the Lie algebra of the semi-abelian generalized Jacobian, the curve–Jacobian Hodge bundle comparison and its determinant; and the specialization of Layers 0–5 to a curve family with a full symplectic level structure on its Jacobian.

Sections 1.2–1.4 supply the generic relative Jacobian and canonical principal polarization. The export contract for ModularCurvesPartII §13.1 (`modularJacobian`, `modularJacobian_thetaSpecialization`, `modularJacobian_baseChange`) is the positive-genus instance of those constructions, including arbitrary-base-change compatibility; norm, divisor-class and modular comparisons belong there. The export contract for ArithmeticStatisticsPartVIII's `hyperellipticJacobian n` is the same instance for its smooth projective pointed hyperelliptic family when `g>0`; hyperelliptic-model comparisons belong there. In genus zero both contracts use the trivial abelian scheme and its unique principal polarization. Neither consumer supplies a prerequisite here.

**Supplied by pinned Tau Ceti.** `TauCeti.AlgebraicGeometry.InvertibleSheaf`, its tensor product, dual and pullback; `LineBundleClass`, the commutative group of actual isomorphism classes with pullback; `SchemeWeilDivisor.relativeDegree`; `Scheme.Modules.Cohomology`; the section-rigidified functor `rigidifiedPicardFunctor`; the field carrier `AbelianVariety` and its `AbelianVariety.IsAlbanese` universal-property predicate. `InvertibleSheaf.eulerDegree` and `LineBundleClass.eulerDegree` use the difference of Euler characteristics truncated below degree two; finiteness and vanishing on proper curves identify it with ordinary degree. These group, pullback, rigidification, cohomology, field-degree and Albanese definitions are consumed, not rebuilt. Relative Picard sheafification and representability over a general base are the separate supplier contracts below.

**Supplied by roadmaps on main.**

- *JacobianChallenge.* Layer A (line bundles, divisors, the Picard group of actual classes and the degree `deg L = χ(L) − χ(O)`); Layer B (coherent cohomology of a curve over a field, genus, Riemann–Roch, Serre duality, `deg ω = 2g − 2`); Layer C (relative coherent cohomology with cohomology and base change, relative effective Cartier divisors and symmetric powers); Layer D (the Picard functor and Jacobian of a curve over a field); Layer E (abelian varieties, tangent space `T₀Pic⁰ = H¹(O)`, cube, dual, the theta polarization of a Jacobian, `[n]` as an isogeny); Layer F (the pointed Abel–Jacobi morphism and its Albanese universal property, base change along field extensions). This roadmap consumes those field and pointed results and owns their family and section-free extensions.
- *StableReduction.* Layer 2 (coherent curve theory over locally noetherian bases: cohomology and base change, `HasGenus`, the invertible relative dualizing sheaf of a nodal family and its base change, relative ampleness from fibrewise ampleness on proper finitely presented families, polarized étale descent); Layer 3 (prestable, semistable and stable families).
- *AlgebraicVectorBundles.* L0B (finite locally free sheaves, duals, rank-one objects are the invertible sheaves) and L0C (exterior powers and the fixed-rank determinant functor with pullback comparisons).
- *PadicMeasuresIwasawaAlgebras.* §5.1 (`detLine`, `detLine_quasiIso`, `detLine_shortExact`, `detLine_baseChange`): determinants of bounded finite-projective complexes over arbitrary commutative rings, with graded signs and coherent comparisons. The curve pushforward and its geometric determinant are constructed in §1.3a here.
- *SchemeAndStackFoundations.* §0.11 (fpqc-locality on the base of affine, separated, finite-type, proper and smooth morphisms); §2.20 (relative dualizing complexes and Serre duality, with the curve comparison); §3.6 (`picardComponent`, the Picard torsors of a single curve without a rational point, with the genus-one period checks); §3.7 (`abelMaps_highDegree`, Abel maps of a single curve without a base point); §3.8 (`invariant_differentials`, `Ω¹_{G/S} ≅ f^*e^*Ω¹_{G/S}` for a group scheme over any base); §4.14 (`hilbert_quot_schemes`). Its §3.6–§3.7 are the field-base specializations of Layers 0 and 2 here: over `S = Spec k` the objects below are those objects.

- *ModularCurves*, §2D: relative Picard representability and normalized Poincaré for an elliptic curve with its identity over an arbitrary base. Here the family has arbitrary positive genus over a noetherian base and can have no degree-one class. The elliptic comparisons use that existing package; its divisor-class map `P ↦ O([P]−[0])` equals `−λ_X` in the positive Mumford-map convention used here.

**Supplied by relative moduli and comparison roadmaps.**

- *AbelianSchemesAndArithmeticModuli* (abelian schemes over arbitrary bases). A0.1 `AbelianScheme`; A1.1 `relativeProductsAndDimension`; A1.2 `relativeRigidity`; A1.4 `relativeSeesaw`; A1.5 `relativeCube` (including `[2]^*L ≅ L³ ⊗ [−1]^*L` for a zero-rigidified `L`); A2.1 `raynaudRepresentability`; A2.2 `AbelianScheme.dual`, `AbelianScheme.poincare`, `normalizedPoincare`; A2.3 `mumfordMap`; A2.5 `Polarization`; A2.6 `Polarization.graphBundle` with `graphBundle_spec`; A3.2 `multiplicationAndDensity`; A3.7 `polarizedWeilPairing`; A3.8 `FullLevel`.
- *AlgebraicModuliForArithmeticGeometry* (Picard sheaves over arbitrary bases). §7.3 `picard_infinitesimal_lifting`; §7.6.1 `relativePicardSheaf`, `relativePicardBaseChange`, `relativePicardKernel`; §7.6.1a `sectionPicardSplit`; §7.9 `spaceSectionComponentCriterion`; Layer 3 `finiteLocallyFreeDescent`. Quasi-coherent fpqc descent is SchemeAndStackFoundations §1.1 `qcoh_fpqc_descent`.
- *ComplexComparisonPartII*. §§C3.2d.2–C3.2d.4 `relative_picard_algebraicSpace`, `relative_picard_separated`, `picard_brauer_obstruction`; §§C3.2f.1–C3.2f.2 `picardZeroSheaf`, `picardZeroCriterion`.
- *NeronModelsAndSemistableAbelianVarieties.* §4.13 `StableFamilyPicard` (`Pic⁰` of a stable curve of genus `g > 1` over an integral noetherian base is a smooth separated semi-abelian group scheme).

**Not built here.** The fine moduli scheme of smooth curves with full symplectic level and its universal curve: StableReductionPartII builds them, using Layer 1 for the curve Jacobian, and then applies Layer 7 to its universal curve; no layer here depends on a curve moduli space. General Picard theory over arbitrary bases (algebraic-space representability, the Brauer obstruction, identity components) is AlgebraicModuliForArithmeticGeometry's and ComplexComparisonPartII's; general abelian-scheme theory (duality, cube and seesaw, polarizations, the graph bundle, torsion, Weil pairings, level structures) is AbelianSchemesAndArithmeticModuli's; this roadmap applies both to the relative Jacobian of a curve and adds only what is specific to curves. Compactified Jacobians of singular curves are not built: Layer 6 uses only the semi-abelian identity component. Adelic line bundles, admissible metrics, heights, Betti maps and nondegeneracy (the arithmetic halves of Yuan and of Dimitrov–Gao–Habegger) belong to the Arakelov and height roadmaps and to AbelianSchemesAndArithmeticModuliPartII; a variation hypothesis is needed by some of those applications, never by the algebraic morphisms here.

Suggested library home: `TauCeti/AlgebraicGeometry/Jacobian/Relative/`. General tensor, dual, determinant, descent, Picard and abelian-scheme infrastructure stays in its existing namespaces. The name refers to Jacobian varieties and schemes; the Jacobian coordinate chart of a Weierstrass equation is a different object.

## Conventions

- **Curve families.** For Layers 0–5, except where a target states other hypotheses, `S` is a noetherian scheme and `π` : `X → S` is smooth and projective of relative dimension one with geometrically connected fibres of constant genus `g > 0`. The constructions work componentwise when `S` is disconnected. No section of `π` is assumed. Base-change comparisons are proved for every `T → S`, nonreduced `T` included. A pullback of a family defined over a noetherian base keeps the constructed objects and their comparison maps even when `T` is not noetherian; this does not replace a representability proof for a family that is only given over a non-noetherian base.
- **Picard objects.** For a scheme `Y`, `Pic(Y)` means actual isomorphism classes of invertible `O_Y`-modules with tensor product (Tau Ceti's `LineBundleClass Y`). For a family `Y → S`, `Pic_{Y/S}` is AlgebraicModuliForArithmeticGeometry §7.6.1's `relativePicardSheaf`, the fppf sheafification of `T ↦ Pic(Y_T)`; a section of it need not have an actual line-bundle representative. A trivial class means that a trivialization exists; a rigidified bundle carries a specified trivialization. These three levels of information stay distinct in every comparison.
- **Degree.** The fibre degree is `deg(L) = χ(L) − χ(O)`, equal to the residue-field-weighted divisor degree (JacobianChallenge Layer A). Degree on a disconnected test scheme is a locally constant function, not one integer. `Picᵈ` is the fixed-degree subsheaf and `J = Pic⁰_{X/S}`. Addition in `J` is tensor product, negation is dualization, and the difference of two elements `L`, `M` of the same degree torsor is `M − L`, so `j(x, y) = [y] − [x]`. In point formulas `[x]` is the relative divisor class of the graph of x, with its test base understood.
- **Poincaré conventions.** Write `U` for AbelianSchemesAndArithmeticModuli A2.2's Poincaré bundle `AbelianScheme.poincare` on `J ×_S J^∨`, rigidified along both zero sections and normalized by evaluation: `U` restricted to `J × {b}` represents b. A2.3's Mumford map is `φ_L(a) = t_a^*L ⊗ L⁻¹` (with its base-line correction), so that `(id × φ_L)^*U ≅ m^*L ⊗ p₁^*L⁻¹ ⊗ p₂^*L⁻¹` after normalization at zero. The canonical principal polarization `λ_X` (§1.4) is positive in A2.5's sense: on a field fibre with a degree-one divisor `α` it is `φ_{O(θ_α)}`. Yuan's Poincaré bundle is `P_X := (id_J × (−λ_X))^*U` on `J ×_S J`; it has the negative addition class `m^*L⁻¹ ⊗ p₁^*L ⊗ p₂^*L` on a field fibre (with `L = O(θ_α)`), and its dual is `(id_J × λ_X)^*U`. The canonical twice-theta bundle `Θ_X := Δ_J^*(P_X^∨)` is the pullback of `U` along the graph `(id_J, λ_X)` : `J → J ×_S J^∨`, so it is A2.6's graph bundle `Polarization.graphBundle λ_X`. Witness for the sign: for an elliptic curve `E` with origin 0 and `α = O(0)`, `Θ_X` has degree 2 and `Δ_J^*P_X` has degree `−2`. A Picard-class equality over a field never supplies a preferred scalar isomorphism; every rigidified comparison includes its normalization at the origin.
- **Field identities.** In Layer 3's field identities `K` is any field, `C/K` is smooth projective geometrically connected of genus `g > 0`, and `α` is a divisor of degree one. It need not be effective, need not be a rational point, and the associated theta divisor is not assumed symmetric; in particular no hypothesis `(2g − 2)α = ω_C` enters the curve-square identity. The degree-d Abel map exists for every integer d; finiteness assumes `d ≠ 0`. Multiplication is finite when the characteristic divides d and need not be étale.
- **Actual Picard subgroups.** Layer 4 uses actual Picard subgroups. On a geometric fibre V, algebraic equivalence of invertible sheaves is the relation generated by families on `V×T` for connected finite-type parameter schemes T and isomorphisms of successive geometric fibres over common residue fields (Kleiman, Definition 5.9, p. 41). A class is algebraically trivial when it is equivalent to O. This definition needs no represented Picard sheaf. When the fibre fppf Picard sheaf is represented, §4.1 compares it with membership in the identity component (Kleiman, Proposition 5.10, pp. 41–42); for a smooth projective connected curve this is degree zero and for an abelian variety it is the kernel of `L ↦ φ_L`. For projective flat `Y → S`, `Pic⁰(Y/S)` consists of actual classes algebraically trivial on every geometric fibre; on a product, `Pic⁰⁰` asks the same intrinsic relation along both projections; `Pic⁻` is instead the intersection of the kernels of the two restrictions to specified pointed axes. Classes pulled back from the base stay in the actual groups. The obstruction groups are `H²_fppf(−, G_m)`; no identification with Azumaya Brauer groups is used.
- **Stable families (Layer 6).** `S` is integral and noetherian, and `X/S` is a proper flat finitely presented stable curve (StableReduction Layer 3) of constant arithmetic genus `g > 1`. Its generalized Jacobian `G = Pic⁰_{X/S}` is a smooth separated semi-abelian group scheme (NeronModelsAndSemistableAbelianVarieties §4.13) and can fail to be proper; its toric rank may jump.
- **Level (Layer 7).** `g ≥ 2`; `ℓ ≥ 3` is invertible on the base; the base is a scheme over `ℤ[1/ℓ, ζ_ℓ]` with `ζ_ℓ` fixed. A full symplectic `level-ℓ` structure on `X/S` is a full level structure `α` : `(ℤ/ℓ)^{2g}_S ≅ J[ℓ]` in the sense of AbelianSchemesAndArithmeticModuli A3.8 (`FullLevel`) such that the polarized Weil pairing `e_{λ_X, ℓ}` of A3.7 satisfies `e_{λ_X,ℓ}(α(v), α(w)) = ζ_ℓ^{⟨v,w⟩}`, where `⟨(a, b), (a′, b′)⟩ = a·b′ − b·a′` is the standard alternating form on `(ℤ/ℓ)^g × (ℤ/ℓ)^g`. Forgetting `ζ_ℓ` gives the similitude version with a multiplier; it is a different moduli problem and is not used.
- **Lean.** Names in `Suggested.lean` are relative to `TauCetiRoadmap.JacobianChallengePartII`. Its declarations are `RelativeJacobian.AxisNormalizedPicard` (§4.8), the actual two-axis condition, and `RelativeJacobian.pointedSquarePicardIsomorphism` (§4.9), the unique extension of those classes along the pointed Abel square. The module docstring identifies the geometric objects needed to state the other headline results against the pinned libraries. All targets and Checks below are mathematical specifications, including those without Lean statements.

## Exact supplier contracts

### From Mathlib (pinned)

Schemes, the slice category `Over S`, the morphism properties `IsProper`, `IsSeparated`, `Smooth`, `Flat`, `IsFinite`, `LocallyOfFinitePresentation`, `Surjective` and `IsProper.of_comp`; the fppf topology `AlgebraicGeometry.Scheme.fppfTopology`; group objects `GrpObj` and `IsCommMonObj` in the cartesian monoidal category `Over S`, with the group `CategoryTheory.Hom.group` on `Hom(T, A)` and the precomposition lemmas `CategoryTheory.MonObj.comp_mul`, `CategoryTheory.GrpObj.comp_div` and `CategoryTheory.GrpObj.comp_zpow`; finite products `piObj`, `Pi.π`, `Pi.lift`, `Pi.hom_ext`, `Pi.map`; pullback `Over.pullback f` with the comparisons `PreservesLimitPair.iso` and `PreservesProduct.iso` and the transported group structure `Functor.grpObjObj`. Mathlib's `CommRing.Pic` concerns invertible modules over a ring and supplies no relative Picard scheme. The pinned fpqc-descent instances for morphism properties (`AlgebraicGeometry/Morphisms/FlatDescent.lean`) do not include closed immersions or finite morphisms; §2.4 and §2.5 use the Stacks lemmas for those two properties.

### From Tau Ceti (pinned)

All declarations below are at Tau Ceti `a91d3aa`; the namespace prefix is `TauCeti.AlgebraicGeometry` unless indicated otherwise.

| Module | Contract consumed here |
| --- | --- |
| `TauCeti.AlgebraicGeometry.LineBundle.Basic`, `.TensorProduct`, `.Dual`, `.Pullback`, `.Functoriality` | `InvertibleSheaf`, `InvertibleSheaf.tensorProduct`, `InvertibleSheaf.dual`, `InvertibleSheaf.pullback`, `InvertibleSheaf.pullbackId`, `InvertibleSheaf.pullbackComp`: actual invertible sheaves and their tensor, dual and contravariant pullback operations. |
| `TauCeti.AlgebraicGeometry.LineBundle.Class`, `.Functoriality` | `LineBundleClass`, `LineBundleClass.mk`, `LineBundleClass.mk_eq_mk_iff`, `LineBundleClass.mk_tensorProduct`, its `CommGroup` instance, `LineBundleClass.pullback`, `LineBundleClass.pullback_id`, `LineBundleClass.pullback_comp`: actual Picard classes, inverses and functorial pullback. |
| `TauCeti.AlgebraicGeometry.LineBundle.Degree` | `InvertibleSheaf.eulerDegree`, `LineBundleClass.eulerDegree`, `LineBundleClass.eulerDegree_mk`, `LineBundleClass.eulerDegree_one`: the fieldwise Euler degree, using cohomology truncated below two. Curve finiteness and vanishing identify this with ordinary degree. |
| `TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Degree` | `SchemeWeilDivisor.relativeDegree`: residue-field-weighted divisor degree. |
| `TauCeti.AlgebraicGeometry.Cohomology.Basic` | `Scheme.Modules.Cohomology`: module-sheaf cohomology on the small Zariski site. The carrier alone supplies neither relative proper pushforward nor relative duality. |
| `TauCeti.AlgebraicGeometry.PicardFunctor.Rigidified` | `rigidifiedPicardFunctor`: the section-rigidified Picard functor on scheme test objects, retaining the specified rigidification. |
| `TauCeti.AlgebraicGeometry.AbelianVariety.Basic`, `.Albanese` | `AbelianVariety`, `AbelianVariety.IsAlbanese`, its factorization `AbelianVariety.IsAlbanese.fac` and uniqueness `AbelianVariety.IsAlbanese.hom_ext`: the field carrier and pointed Albanese universal-property API. Abelian schemes over a general base use the roadmap carrier below. |

### From TauCetiRoadmap roadmaps

| Supplier | Contract consumed here |
| --- | --- |
| JacobianChallenge, Layers A–C | Actual line bundles, divisors and degree; field curve cohomology, Riemann–Roch and Serre duality; relative cohomology and base change for proper flat families, relative effective Cartier divisors (graphs of sections of a smooth curve) and symmetric powers with their universal divisors. |
| JacobianChallenge, Layers D–F | Over a field: the Picard scheme and Jacobian of a curve, the theta divisor and principal polarization, the cube theorem, the pointed Abel–Jacobi morphism and its Albanese universal property. Used for fibre specializations and for the pointed comparisons after a cover acquiring a section, never as a family theorem. |
| StableReduction, Layer 2 | Cohomology and base change over locally noetherian bases; `R¹π_*O_X` locally free of rank `g` for a nodal family of genus `g`; the invertible relative dualizing sheaf `ω_{X/S}` of a nodal family with its base change; on a proper finitely presented family, relative ampleness of an actual invertible sheaf from ampleness on geometric fibres. |
| StableReduction, Layer 3 | Stable families and their base change. |
| AlgebraicVectorBundles, L0B–L0C | Finite locally free sheaves and their duals, and the fixed-rank determinant functor, with coherent pullback comparisons. |
| SchemeAndStackFoundations §0.9, §0.11, §2.20, §3.6–§3.8, §4.14 | `affine_transition_limits` and `finite_presentation_limits`; fpqc-locality of properness and affineness; relative duality for curves; Picard torsors and Abel maps of a single curve; invariant differentials of a group scheme over any base; Hilbert schemes. |
| PadicMeasuresIwasawaAlgebras §5.1 | `detLine`, `detLine_quasiIso`, `detLine_shortExact`, `detLine_baseChange`: the ring-level determinant functor used to glue §1.3a's curve determinant. |

### From relative moduli and comparison roadmaps

| Supplier | Contract consumed here |
| --- | --- |
| AlgebraicModuliForArithmeticGeometry §7.6.1 | `relativePicardSheaf` (fppf sheafification of line-bundle classes), `relativePicardBaseChange` (restriction to `Sch/T` is the Picard sheaf of `X_T/T`), `relativePicardKernel` (`0 → Pic(T) → Pic(X_T) → Pic_{X/S}(T)` exact under universal `O_T ≅ π_*O`), §7.6.1a `sectionPicardSplit` (split exactness when a section exists). |
| ComplexComparisonPartII §§C3.2d.2–C3.2d.4 | `relative_picard_algebraicSpace` and `relative_picard_separated`: for proper flat finitely presented families with universal global functions, a quasi-separated Picard algebraic space locally of finite presentation, separated for geometrically integral fibres. `picard_brauer_obstruction` gives the fppf Leray sequence to `H²(−, G_m)`. |
| ComplexComparisonPartII §§C3.2f.1–C3.2f.2 | `picardZeroSheaf` and `picardZeroCriterion`: the full fibrewise identity-component subfunctor, open of finite type when geometric identity components are smooth of locally constant dimension, proper and closed when they are proper and the ambient Picard space is separated. On a nonreduced base smoothness uses formal smoothness along the component, supplied here by curve `H²-vanishing`. Formation commutes with arbitrary base change. |
| AlgebraicModuliForArithmeticGeometry §7.3, §7.9 | `picard_infinitesimal_lifting`: square-zero obstructions in `H²(O)`, with framed lift classes a torsor under `H¹(O)` when the obstruction vanishes; `H² = 0` gives formal smoothness. `spaceSectionComponentCriterion` supplies the group-algebraic-space component construction consumed by `picardZeroCriterion`. |
| SchemeAndStackFoundations §1.1; AlgebraicModuliForArithmeticGeometry, Layer 3 | `qcoh_fpqc_descent` and `finiteLocallyFreeDescent`: effective descent of quasi-coherent modules and descent of finite local freeness, including invertibility, along fpqc covers. |
| AbelianSchemesAndArithmeticModuli A0–A1 | The carrier `AbelianScheme S`; products, base change and relative dimension; rigidity over nonreduced bases (a zero-preserving morphism is a homomorphism, commutativity); the rigidified seesaw principle; the cube theorem with `[n]^*L ≅ L^{n(n+1)/2} ⊗ ([−1]^*L)^{n(n−1)/2}`. |
| AbelianSchemesAndArithmeticModuli A2 | Raynaud's representability (abelian algebraic spaces are schemes); the dual `A^∨` with its doubly rigidified Poincaré bundle and `normalizedPoincare`; the Mumford map and its biextension identities; `Polarization` with `principal_iff` and `baseChange`; the graph bundle `M = (id, λ)^*U` with `graphBundle_spec`: `M` symmetric, rigidified along zero, relatively ample, `φ_M = 2λ` and `M ≅ [2]^*L ⊗ L⁻²` when `λ = φ_L`. |
| AbelianSchemesAndArithmeticModuli A3 | For `n ≠ 0`, `[n]` finite locally free of rank `abs(n)^{2g}`, étale where n is invertible, with the converse on positive-dimensional components; on a zero-dimensional component multiplication is identity. The torsion kernel has the same finite locally free rank and commutes with arbitrary base change; polarized Weil pairings; `FullLevel` with `FullLevel.weilPairing`. |
| NeronModelsAndSemistableAbelianVarieties §4.13 | `StableFamilyPicard`: for a stable curve of genus `g > 1` over an integral noetherian base, `Pic⁰_{X/S}` is a smooth separated semi-abelian group scheme. |

## How to read the build

Construct Layer 0, then §§1.1–1.3a, then §§2.1–2.3, then §1.4, and finally §§2.4–2.7. This constructs the relative Jacobian and curve determinant before the Abel maps, and the Abel maps before the principal polarization that uses them. Layer 2 recovers curve differences by subtraction in a degree torsor. Layer 3 fixes the Poincaré sign, proves Yuan's field identities for an arbitrary degree-one divisor and identifies the canonical twice-theta bundle with the graph bundle of `λ_X`. Layer 4 compares actual Picard classes with relative sections and with the pointed axis-normalized subgroups. Layer 5 assembles fibre powers and shifted differences, then factors the shifted canonical power through triangular coordinates and a tail isogeny. Layer 6 compares the Hodge bundles of stable curves and their generalized Jacobians. Layer 7 records the specialization to curve families with full symplectic level.

## Layer 0: Relative Picard degree components and torsors

Begin with the relative Picard sheaf `Pic_{X/S}` of AlgebraicModuliForArithmeticGeometry §7.6.1. The degree condition comes from actual line bundles and is local for the fppf topology. Local constancy of degree is proved before the degree components are cut out. Representability then transports the tensor group law to schemes, and the degree-d pieces are torsors under the degree-zero piece without a chosen S-point.

The algebraic-space representability and separatedness of `Pic_{X/S}` are ComplexComparisonPartII §§C3.2d.2–C3.2d.3; infinitesimal lifting is AlgebraicModuliForArithmeticGeometry §7.3; this layer adds what is specific to a projective curve family: representability by a scheme with quasi-projective degree pieces, smoothness from `H² = 0`, and the identification of the identity component with the degree-zero piece. For a locally varying degree on a disconnected test scheme, `Pic_{X/S}` is the coproduct sheaf of the fixed-degree pieces: a section may land in different pieces on different open-and-closed components.

### 0.0 Finite-stage descent of line bundles

Let `Spec A` be an affine open of the noetherian base `S`, let `B` be any A-algebra, and express `B = colim B_i` as a filtered colimit of finite-type A-algebras. Every invertible sheaf on `X_B` descends to an invertible sheaf on some `X_{B_i}`. Isomorphisms between descended bundles descend after increasing i, and any finite list of equalities between those isomorphisms holds at a sufficiently large stage if it holds over B. ([Stacks, Lemma 32.10.2 (01ZR)](https://stacks.math.columbia.edu/tag/01ZR).)

On finite affine covers, descend finite presentations, transition maps, their inverses and their cocycle equalities. Descending the inverse identities retains invertibility; descending the equalities gives independence after passage to a common larger stage. SchemeAndStackFoundations §0.9 supplies the affine-transition limits and finite-presentation comparisons.

**Checks.**

- For `B=A[x₁,x₂,…]`, each bundle and finite diagram of its isomorphisms descend to some `A[x₁,…,x_N]`, although B need not be noetherian.
- In a system beginning `k[ε]/ε² → k → k[x₁] → k[x₁,x₂] → ⋯`, multiplication by `1+ε` and by 1 on the trivial bundle are distinct at the first stage but equal at the limit and at a later stage. Equality is eventual, not necessarily true at the initially chosen stage.
- For a pointed elliptic `E/k`, a k-algebra B and `P∈E(B)`, `O(Γ_P)` descends with its inverse transition maps and has degree one at the finite stage; descent cannot replace it by the trivial bundle.

*Needs:* SchemeAndStackFoundations §0.9 (`affine_transition_limits`, `finite_presentation_limits`); JacobianChallenge, Layers A and C.

### 0.1 Local constancy of relative degree

For a test scheme `T → S` and an invertible sheaf `L` on `X_T`, the function `t ↦ deg(L_t) = χ(L_t) − χ(O_{X_t})` is locally constant on `T` and unchanged by any extension of residue fields. ([Kleiman](https://arxiv.org/pdf/math/0504020v1), proof of Theorem 4.8, pp. 28–29, for the openness of the loci of fixed Hilbert polynomial.)

Work on affine opens of T mapping into an affine open `Spec A⊆S`. By §0.0 descend L to `X_{B_i}` for a finite-type A-algebra `B_i`, hence a noetherian base. Apply JacobianChallenge Layer C's Euler-characteristic constancy there to L and O. Residue-field invariance identifies their difference after pullback to B with the degree on `X_B`; glue the locally constant functions over T. On each fibre this degree agrees with divisor degree by JacobianChallenge Layer A.

*Needs:* §0.0; JacobianChallenge, Layer A; JacobianChallenge, Layer B; JacobianChallenge, Layer C.

### 0.2 Relative degree components

For every `d ∈ ℤ`, `Picᵈ_{X/S}` is the subsheaf of `Pic_{X/S}` of sections whose geometric-fibre classes have degree d. A locally varying integer degree gives the disjoint union of these constant-degree pieces, not a single integer on a disconnected `T`. ([Dimitrov–Gao–Habegger](https://arxiv.org/pdf/2001.10276v3), §6.1 p. 24; [Kleiman](https://arxiv.org/pdf/math/0504020v1), proof of Theorem 4.8, p. 29, for the decomposition into open and closed pieces.)

Use the fibre degree on each geometric fibre and §0.1 to make it locally constant. The condition is fppf local, so it cuts out a subsheaf; do not replace sheafification by actual global representatives.

The relative degree components have the following properties, giving membership, tensor degree, inverse degree and restriction to a new base; these locate the later Abel classes in the right component:

- A class lies in Picᵈ(T) iff its degree is d on every geometric fibre.
- Tensor product sends Picᵈ `×` Picᵉ to Picᵈ⁺ᵉ.
- `Picᵈ_{X/S}` restricted to `Sch/T` is `Picᵈ_{X_T/T}`, through `relativePicardBaseChange`.
- Inversion of line classes sends Picᵈ to `Pic⁻ᵈ` and fixes the class of the structure sheaf.

**Checks.**

- **Computation.** For an elliptic curve `E/k` with origin e, `O_E(e)` lies in `Pic¹` and `O_E` lies in `Pic⁰`.
- **Non-example.** On `T = Spec k ⊔ Spec k`, a bundle of degree 0 on one component and 1 on the other is a section of `Pic_{X/S}` but of neither constant-degree piece.
- **Compatibility.** Over `S = Spec k` the component is SchemeAndStackFoundations §3.6's `picardComponent X d`, and it is not the set of degree-d divisors.

*Needs:* AlgebraicModuliForArithmeticGeometry §7.6.1 (`relativePicardSheaf`, `relativePicardBaseChange`); JacobianChallenge, Layer A; JacobianChallenge, Layer C; §0.1.

### 0.3 Relative curve Picard scheme

`Pic_{X/S}` is represented by a smooth separated S-group scheme, locally of finite presentation, whose pieces `Picᵈ_{X/S} (d ∈ ℤ)` are open and closed and quasi-projective over `S`. Its degree-zero piece is the identity component `picardZeroSheaf`. Representability commutes with arbitrary change of base. ([Kleiman](https://arxiv.org/pdf/math/0504020v1), Theorem 4.8, pp. 27–29, Proposition 5.19, p. 47, and Exercise 5.23, p. 50.)

The hypotheses of ComplexComparisonPartII §§C3.2d.2–C3.2d.3 hold: `X/S` is proper, flat, finitely presented, with `O_T ≅ (π_T)_*O_{X_T}` universally because the fibres are geometrically integral. So `Pic_{X/S}` is a quasi-separated algebraic space locally of finite presentation (`relative_picard_algebraicSpace`), separated because the geometric fibres are integral (`relative_picard_separated`). Scheme representability with quasi-projective fixed-Hilbert-polynomial pieces is Grothendieck's theorem for projective flat families with integral geometric fibres over a noetherian base (Kleiman, Theorem 4.8(2)); for a curve the Hilbert polynomial of `L⁻¹(n)` determines the degree, so these pieces are the Picᵈ. Each `Picᵈ` is of finite type: étale locally on `S` the smooth family `X/S` has a section, and translation by d times that section identifies Picᵈ with `Pic⁰`, which is of finite type by `picardZeroCriterion` (Kleiman, Exercise 5.23); finite type descends, and a quasi-compact open of Kleiman's increasing union of quasi-projective opens lies in one of them. Smoothness: `H²(O_{X_s}) = 0` on curve fibres, so `picard_infinitesimal_lifting` (equivalently Kleiman, Proposition 5.19) gives smoothness over every base. On a geometric fibre the identity component of `Pic` is the degree-zero part (JacobianChallenge Layer D), which identifies `Pic⁰_{X/S}` with `picardZeroSheaf`. Do not infer smoothness of the Hilbert parameter scheme from flatness of its universal family.

*Needs:* §0.2; JacobianChallenge, Layer C; JacobianChallenge, Layer D; ComplexComparisonPartII §§C3.2d.2–C3.2d.3 (`relative_picard_algebraicSpace`, `relative_picard_separated`); AlgebraicModuliForArithmeticGeometry §7.3 (`picard_infinitesimal_lifting`); ComplexComparisonPartII §§C3.2f.1–C3.2f.2 (`picardZeroSheaf`, `picardZeroCriterion`); SchemeAndStackFoundations §4.14 (`hilbert_quot_schemes`).

### 0.4 Picard degree torsors

Tensoring by degree-zero classes makes `Picᵈ_{X/S}` an fppf torsor under `Pic⁰_{X/S}`; Picᵈ need not have an S-point. Its difference morphism Picᵈ `×_S` Picᵈ `→ Pic⁰` sends `(L, M)` to `M ⊗ L⁻¹`. ([Kleiman](https://arxiv.org/pdf/math/0504020v1), Exercise 5.23, p. 50, together with the tensor law and étale-local section argument below; over a field, SchemeAndStackFoundations §3.6, `picardComponent_torsor`.)

Obtain local sections after an fppf cover of `S`, using relative effective divisors of degree d (and their inverses for negative d); smooth `X/S` has sections étale locally. Translate `Pic⁰` to Picᵈ by such a local section, and descend the action and the difference, which are defined intrinsically by tensor product.

The Picard degree torsors expose the action and the intrinsic difference; a change of origin becomes a translation:

- `J ×` Picᵈ `→` `Picᵈ` is tensor product.
- `δ(L, M) = M ⊗ L⁻¹` lies in `J` and does not depend on local origins.
- A chosen `β ∈` Picᵈ(T) identifies `Picᵈ_T` with `J_T` by `L ↦ L ⊗ β⁻¹`.
- For `L`, `M ∈` Picᵈ(T), `δ(L, M) ⊗ L = M`; the action has an identity and is associative, and `δ(L, L) = 0`.

**Checks.**

- **Degenerate.** `Pic⁰` is the trivial J-torsor, with the structure sheaf as origin.
- **Non-example.** A genus-one curve of period greater than one has no k-point of `Pic¹` (SchemeAndStackFoundations §3.6, `picardComponent_test_genus_one_period`); a global origin cannot be part of the torsor definition.
- **Computation.** `δ(M, L) = −δ(L, M)`, while `δ(L, L) = 0`.

*Needs:* §0.3.

### Examples

For an elliptic curve `E/k`, `O_E(e)` has degree one and `O_E` has degree zero. Over a disconnected test scheme, a line bundle with these two degrees on the two components has a relative Picard class but lies in neither fixed-degree subsheaf. A genus-one curve of period greater than one gives a nontrivial `Pic¹` torsor: its difference map exists although no rational origin does. The checks in §0.2 and §0.4 detect each of these distinctions.

### Dependencies

JacobianChallenge Layers A–D supply actual degrees, Euler characteristics, relative curve divisors and cohomology, and the field Picard scheme. AlgebraicModuliForArithmeticGeometry §7.6.1 supplies the relative Picard sheaf and its base change, §7.3 infinitesimal lifting; ComplexComparisonPartII §§C3.2d.2–C3.2d.3 supplies representability and separatedness, and §§C3.2f.1–C3.2f.2 the identity component. SchemeAndStackFoundations §0.9 supplies limits for §0.0, §3.6 is the field case of §0.2 and §0.4, and §4.14 supplies Hilbert schemes. Finite-stage descent extends degree constancy from noetherian stages to arbitrary test bases; constancy precedes the degree components, which precede representability and the torsors.

## Layer 1: Relative Jacobians and principal polarization

Properness is proved before the degree-zero Picard scheme is called an abelian scheme; its tensor law is already commutative. The tangent and cohomology comparison on geometric fibres gives relative dimension `g`. The carrier is AbelianSchemesAndArithmeticModuli A0.1's `AbelianScheme`. Restriction of the Picard sheaf under base change identifies these objects even over nilpotent test bases.

Relative Abel pullback gives a canonical autoduality isomorphism `u:J^∨→J`, constructed without a global degree-one bundle. Define `λ_X=−u⁻¹`. On geometric fibres the field theta theorem identifies this with the positive theta polarization; positivity is the fibrewise condition of A2.5. Independence and base change of u hold for families, including nilpotent bases. The general dual abelian scheme and polarization API is AbelianSchemesAndArithmeticModuli A2.

### 1.1 Properness of the relative Jacobian

For `X/S` as in the conventions, `Pic⁰_{X/S} → S` is proper. With the relatively ample twice-theta bundle of §3.13 it is projective over `S`. ([Kleiman](https://arxiv.org/pdf/math/0504020v1), Proposition 5.20, pp. 47–48, and Exercise 5.23, p. 50.)

Apply `picardZeroCriterion`: `Pic_{X/S}` is separated (§0.3) and its geometric identity components are the Jacobians of the geometric fibres, which are proper (JacobianChallenge Layers D–E), so the identity component is closed in `Pic_{X/S}` and proper over `S`. Do not infer properness from algebraic-space representability alone.

*Needs:* §0.3; JacobianChallenge, Layer D; JacobianChallenge, Layer E; ComplexComparisonPartII §§C3.2f.1–C3.2f.2 (`picardZeroCriterion`).

### 1.2 Relative Jacobian

`J(X/S) := Pic⁰_{X/S}`, with the tensor group law, is an abelian scheme (A0.1 `AbelianScheme`) of relative dimension `g`. No section of `X/S` is part of its data. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29; [Kleiman](https://arxiv.org/pdf/math/0504020v1), Remark 5.26, p. 51.)

Use the represented identity component of §0.3, smooth over `S`, its properness from §1.1 and the geometric connectedness of its fibres; then it is an abelian scheme in the sense of A0.1. Its relative dimension is `g` by the tangent comparison `T₀Pic⁰ = H¹(O)` on geometric fibres (JacobianChallenge Layer E).

The relative Jacobian has the following identifications of test-scheme points, base change and field specialization while preserving the group law:

- `J(T) = Pic⁰_{X/S}(T)`, with its fppf-sheaf interpretation.
- `J(X/S) ×_S T ≅ J(X_T/T)`, preserving the group law.
- Over a field-valued base it is the Jacobian of JacobianChallenge Layer D, as a Tau Ceti `AbelianVariety` through A0.1's `AbelianScheme.toAbelianVariety`.
- Under `J(T) = Pic⁰_{X/S}(T)`, the identity is `[O]` and addition and inverse are tensor product and dual.

**Checks.**

- **Compatibility.** For an elliptic curve `E` with identity, `J(E/k) ≅ E`, matching origins and group laws.
- **Non-example.** A genus-one torsor `C/k` has `J(C/k)` even when `C(k) =` ∅.
- **Non-example.** For an irreducible one-nodal curve the generalized `Pic⁰` contains a torus and is not an abelian scheme; it is outside this smooth definition (Layer 6 treats it).

*Needs:* §0.3; §1.1; AbelianSchemesAndArithmeticModuli A0.1 (`AbelianScheme`); JacobianChallenge, Layer E.

### 1.3 Base change of the relative Jacobian

For every `T → S`, the Picard-sheaf base-change isomorphism restricts to an isomorphism of abelian schemes `J(X/S)_T ≅ J(X_T/T)`, including infinitesimal base changes. ([Milne](https://www.jmilne.org/math/xnotes/JVs.pdf), §8 Theorem 8.1 p. 27 and the following paragraph p. 28.)

Restrict the represented fppf sheaves to `Sch/T` (`relativePicardBaseChange`), identify the degree-zero components by the geometric degree condition (`picardZeroCriterion` commutes with arbitrary base change), and use Yoneda on all test schemes for the group law.

*Needs:* §1.2; §0.2; AlgebraicModuliForArithmeticGeometry §7.6.1 (`relativePicardBaseChange`); ComplexComparisonPartII §§C3.2f.1–C3.2f.2 (`picardZeroCriterion`).

### 1.3a Determinant of curve cohomology

For the smooth projective curve family `π:X→S` and every `T→S`, an invertible sheaf L on `X_T` has a determinant line `det R(π_T)_*L` on T. On an affine test base with a finite-projective cohomology complex K it is `⊗_q det(K^q)^{(−1)^q}`. Construct its canonical comparisons under quasi-isomorphisms, independence of presentations, multiplicativity for short exact sequences, the projection formula
`det R(π_T)_*(L⊗π_T^*N) ≅ det R(π_T)_*L ⊗ N^{χ(L_t)}`
for an invertible N on T, and compatibility with arbitrary base change. The exponent is locally constant. Extend the construction to bounded complexes of vector bundles, including the two-term resolutions of line bundles restricted to relative effective Cartier divisors. Include composition, overlap and cocycle identities for these comparisons, retaining graded determinant signs before forgetting the grading. ([Esteves–Gagné–Kleiman](https://arxiv.org/pdf/math/9911071), Proposition (2.2), pp. 6–7; [Knudsen–Mumford, I](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976b--DetDiv%2BKnudsenSequel-GT.pdf), Definition 1, pp. 23–24, Theorem 1, p. 25; [Stacks, Lemma 36.30.4 (0B91)](https://stacks.math.columbia.edu/tag/0B91).)

Use JacobianChallenge Layer C's finite-projective cohomology complexes on affine noetherian test bases. Apply PadicMeasuresIwasawaAlgebras §5.1's ring-level determinant functor, and glue its quasi-isomorphism and base-change comparisons by AlgebraicVectorBundles L0C and fpqc descent. For arbitrary test bases, §0.0 descends the line bundles and finite presentation data locally to noetherian stages; the same finite-data argument descends bounded vector-bundle complexes and their maps. The cohomology complex computes every base change, so its determinant comparison applies also to nonflat and nonreduced changes of base. Quasi-isomorphism transitivity gives independence of the stage and the overlap cocycles. For short exact sequences use the corresponding perfect-complex presentations and their graded determinant multiplicativity.

**Checks.**

- Over a field the line is `det H⁰(L) ⊗ (det H¹(L))⁻¹`; for L=O on a genus-two curve it is `(det H¹(O))⁻¹`.
- On a constant genus-two family, replacing O by `π^*N` multiplies its determinant by `N⁻¹`; on a genus-one family the exponent is zero. This distinguishes the determinant of cohomology from either individual cohomology determinant.
- For the normalized Poincaré bundle on `E×E` with E elliptic over an algebraically closed field and projection to the second E, the determinant is `O_E(−[0])`. Both cohomology dimensions jump from 0 to 1 at 0; the determinant and its comparisons still pull back to every infinitesimal neighbourhood of 0.
- For a section p and an invertible L, `0→L(−p)→L→p_*p^*L→0` gives `det Rπ_*L ≅ det Rπ_*L(−p) ⊗ p^*L`, compatibly with arbitrary base change.

*Needs:* §0.0; JacobianChallenge, Layer C; PadicMeasuresIwasawaAlgebras §5.1 (`detLine`, `detLine_quasiIso`, `detLine_shortExact`, `detLine_baseChange`); AlgebraicVectorBundles L0C; SchemeAndStackFoundations §1.1 (`qcoh_fpqc_descent`); AlgebraicModuliForArithmeticGeometry, Layer 3 (`finiteLocallyFreeDescent`); AbelianSchemesAndArithmeticModuli A2.2 (`AbelianScheme.poincare`, for the elliptic Check).

### 1.4 Canonical principal polarization

There is a canonical principal polarization `λ_X` : `J → J^∨` (A2.5 `Polarization`, principal), compatible with base change and defined without a global degree-one bundle on `X`. On a field fibre with a degree-one divisor `α` it is `φ_{O(θ_α)}` of JacobianChallenge Layer E, with the positive sign of the conventions. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29; [Esteves–Gagné–Kleiman](https://arxiv.org/pdf/math/9911071), Theorem (2.1), pp. 4–6, Proposition (2.2), pp. 6–7, Proposition (3.7), pp. 15–16, and proof (4.1), p. 16, restricted to smooth curves; [Kleiman](https://arxiv.org/pdf/math/0504020v1), Remark 5.26, p. 51.)

On a cover carrying an actual degree-one bundle `β`, the positive Abel map of §§2.1–2.2 sends x to `O(Γ_x)⊗β⁻¹`. Its pullback on the relative identity components gives `u_β:J^∨→J`. This map is an isomorphism independent of `β` over the entire base: apply the smooth-curve case of Esteves–Gagné–Kleiman's family autoduality theorem. Their Abel map `A_β` sends x to `β⊗O(−Γ_x)`, so `A_β=−i_β` and their isomorphism is `−u_β`. Construct their determinant-of-cohomology right inverse and its overlap comparison (Proposition (2.2)) using §1.3a on the curve over the Jacobian-product test base; these give base-change compatibility. Proposition (3.7) proves independence over a locally noetherian base, not just on geometric points. Thus the `u_β` glue to a canonical isomorphism `u:J^∨→J` even without `β`. For arbitrary non-noetherian pullbacks, pull back this isomorphism and its comparisons.

Set `λ_X=−u⁻¹`. On every geometric fibre the classical theta theorem gives `u∘φ_{O(θ_β)}=−id_J`, so `λ_X` is the positive theta polarization on that fibre. A2.5 defines positivity fibrewise, while the inverse of u proves principality over `S` itself. Only field theta divisors enter the positivity check. Fppf descent glues u and its inverse as morphisms on all test schemes; the family independence theorem supplies the overlap equality even when `S` is nonreduced.

The canonical principal polarization has the following properties, making the family construction an isomorphism that agrees with the field theta convention after every base change:

- `λ_X` is an isomorphism of abelian schemes (A2.5 `Polarization.principal_iff`).
- `λ_{X_T}` is the base change of `λ_X` under the canonical comparisons of `J` (§1.3) and of the dual (A2.2 `AbelianScheme.dual_baseChange`).
- On a field fibre with a degree-one divisor `α`, `λ_X = φ_{O(θ_α)}` with the convention of A2.3.
- `u:J^∨≅J` is the canonical relative degree-one positive Abel pullback, independent of the local degree-one bundle, compatible with base change, and `u∘λ_X=−id_J`.

**Checks.**

- **Computation.** For genus one, `λ_X` is the principal polarization `φ_{O(0)}` of A2.3, `a ↦ O([−a] − [0])`; the divisor-class map `a ↦ O([a] − [0])` differs from it by `[−1]`.
- **Non-example.** The construction exists when `X` has no global degree-one bundle; it cannot require a global theta divisor.
- **Characterisation.** For `S = Spec(k[ε]/ε²)` and degree-one `β`, `β′` whose quotient is an infinitesimal `Pic⁰` class, `i_β^*=i_β′^*` on `Pic⁰_{J/S}`, and both compositions `u_β∘λ_X` equal `−id_J` over `S`. Merely selecting a lift of the reduced-fibre polarization does not meet this test.

*Needs:* §1.2; §1.3; §1.3a; §2.1; §2.2; AbelianSchemesAndArithmeticModuli A2.2 (`AbelianScheme.dual`, `AbelianScheme.dual_baseChange`); AbelianSchemesAndArithmeticModuli A2.3 (`mumfordMap`); AbelianSchemesAndArithmeticModuli A2.5 (`Polarization`); Mathlib `fppfTopology` (subcanonical); JacobianChallenge, Layer E.

### Examples

An elliptic curve with its identity gives `J(E/k) ≅ E` as a group, with its usual principal polarization. Removing the chosen point from a genus-one torsor removes neither its Jacobian nor its polarization. A one-nodal curve has a torus in its generalized Jacobian and fails the smooth-curve hypotheses of this layer. Pullback to `Spec(k[ε]/ε²)` tests the polarization comparisons as morphisms rather than only on the reduced fibre (§1.1 and §1.4).

### Dependencies

Layer 0 supplies the represented degree-zero group. JacobianChallenge Layers C–E supply finite-projective curve cohomology complexes, the field Picard scheme and the theta polarization. PadicMeasuresIwasawaAlgebras §5.1 and AlgebraicVectorBundles L0C supply the determinant functors for §1.3a. AlgebraicModuliForArithmeticGeometry §7.6.1 supplies base change, and ComplexComparisonPartII §§C3.2f.1–C3.2f.2 supplies the identity-component criterion. After §§1.1–1.3a, construct §§2.1–2.3 before §1.4: Esteves–Gagné–Kleiman Theorem (2.1), Proposition (2.2) and Proposition (3.7), using that curve determinant, give relative Abel autoduality with its independence and base change; Mathlib's subcanonical fppf topology glues those isomorphisms. AbelianSchemesAndArithmeticModuli A0.1 supplies the carrier, and A2.2–A2.5 the dual, the Mumford map and polarizations. The ampleness result of §3.13 strengthens properness to a global projective presentation.

## Layer 2: Abel maps and section-free differences

The graph of a test-scheme point is a relative effective Cartier divisor on the pulled-back smooth curve. Its line class defines a natural transformation to `Pic¹`. Representability turns that transformation into the section-free Abel morphism. A specified actual degree-d bundle allows multiplication and subtraction in the Picard functor, producing `i_α`.

After a section-acquiring fppf cover, `i_α` is multiplication by d on the pointed Abel map followed by translation. The relative pointed Abel map is a closed immersion by the proper–unramified–universally-injective criterion, whose last two conditions are fibrewise; this is then descended. Finite locally free multiplication (AbelianSchemesAndArithmeticModuli A3.2) gives finiteness for `d ≠ 0`, including negative d and inseparable multiplication. The difference map needs neither `α` nor a section and keeps the order `y − x` throughout.

### 2.1 Section-free Abel map

The diagonal relative effective Cartier divisor on `X×_S X` defines a canonical S-morphism `a₁:X→Pic¹_{X/S}`, taking a T-point x to the class of `O_{X_T}(Γ_x)`. It commutes with arbitrary base change and needs no section of `π`. Over `S = Spec k` it is SchemeAndStackFoundations §3.7's Abel map `a_1` on `X^{(1)} = X`. ([Dimitrov–Gao–Habegger](https://arxiv.org/pdf/2001.10276v3), §6.1 p. 24, paragraph defining the Faltings–Zhang morphism; [Kleiman](https://arxiv.org/pdf/math/0504020v1), Definition 4.6, p. 27, for the Abel map of relative effective divisors.)

Use smooth relative dimension one to make `Γ_x a` relative effective Cartier divisor. Take its invertible sheaf and map to the relative Picard sheaf. Use representability for the S-morphism and the pullback law of the diagonal.

The section-free Abel map supplies the graph-class formula and its base change. A specified point yields the comparison with the pointed construction:

- `a₁(x)=[O(Γ_x)]` in `Pic¹(T)`.
- The Abel map of `X_T` is the base change of `a₁`.
- If `x₀` is chosen, subtracting `a₁(x₀)` gives the parent pointed Abel–Jacobi map.

**Checks.**

- **Compatibility.** For a genus-one curve `C`, `a₁:C→Pic¹_C` is an isomorphism of torsors, including when `C(k)=∅`.
- **Computation.** For a pointed elliptic E, `a₁(0)=[O_E(0)]`, and `a₁(P)−a₁(0)` equals P under the divisor-class identification `J(E)≅E`.
- **Infinitesimal.** For `g>0`, the tangent map of `a₁` at every geometric curve point is injective, including in characteristics 2 and 3. Under Serre duality its dual is evaluation of canonical differentials; the canonical system has no base point for positive genus (Kleiman, Remark 5.18, pp. 45–46).

*Needs:* §0.4; JacobianChallenge, Layer C.

### 2.2 Degree-d Abel–Jacobi morphism

For an actual invertible `α` on `X` of constant relative degree `d∈ℤ`, `i_α:X→J` sends x to `[O(dΓ_x)⊗α_T⁻¹]`. The morphism exists for every d, including 0 and negative d. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29.)

Multiply the Picard-sheaf class `a₁(x)` by d and subtract `α`. The degree becomes `d−d=0`. Represent the resulting natural transformation by a scheme morphism.

The properties of the degree-d Abel map make the degree-d class explicit and record how it changes with the normalizing bundle:

- `i_α(x)=[dΓ_x−α_T]`.
- `i_{α_T}` is the base change of `i_α`.
- For `α,β` of the same degree, `i_β=t_{α−β}∘i_α`.
- For `α=O(x₀)` and `d=1`, `i_α` is the parent pointed Abel–Jacobi morphism.

**Checks.**

- **Degenerate.** For `d=0` the map is the constant section `−[α]`; it is not finite on a nonempty positive-dimensional curve fibre.
- **Compatibility.** For `d=1` and `α=O(x₀)`, `i_α(x₀)=0`.
- **Non-example.** On an elliptic `E` in characteristic p with `α=O_E(p[0])`, `i_α=[p]` under the divisor-class identification `J≅E`: it is finite but has a nonzero differential kernel and is not étale. With `α=O_E(−[0])` and `d=−1`, the map is `[−1]`, not the degree-one identity.

*Needs:* §2.1; §0.4; §1.2.

### 2.3 Local pointed factorization

After any base change with a section `x₀:X_T/T`, `i_α=t_β∘[d]∘i_{O(x₀)}`, where `β=[dO(x₀)−α_T]∈J(T)`. The equality holds as T-morphisms. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29; Proposition 2.6 proof p. 31.)

Evaluate both maps on arbitrary `U→T` using the relative Picard group law. Apply Yoneda, retaining nonreduced `U`.

*Needs:* §2.2; JacobianChallenge, Layer F; AbelianSchemesAndArithmeticModuli A0.1 (`AbelianScheme`, translations and `[d]`).

### 2.4 Degree-one Abel immersion

If `d=1`, `i_α:X→J` is a closed immersion over every noetherian `S` in the standing scope. No global section of `X/S` is required. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3 p. 109; §2.2.1 p. 29; [Stacks, Lemma 41.7.2](https://stacks.math.columbia.edu/tag/04XV) and [Lemma 35.23.21](https://stacks.math.columbia.edu/tag/02L6).)

First the relative pointed bridge: for a section `x₀` of `X_T/T`, the pointed Abel map `i_{O(x₀)}` is proper (`X_T/T` proper, `J_T/T` separated), and it is unramified and universally injective because both properties of a morphism locally of finite type are checked on geometric fibres, where the pointed Abel–Jacobi map of a curve of genus `g > 0` is a closed immersion (JacobianChallenge Layer F); a proper, unramified, universally injective morphism is a closed immersion (Stacks, Lemma 41.7.2). On an fppf cover acquiring a section, §2.3 identifies `i_α` with a translate of that pointed map, and being a closed immersion is fpqc local on the base (Stacks, Lemma 35.23.21). A list of fibrewise closed immersions alone is not the proof: the criterion is applied to the morphism over `T`.

**Checks.**

- For genus one it is an isomorphism `X≅J` when `α` exists. Works in characteristic 2; no separability or perfectness premise is inserted.

*Needs:* §2.2; §2.3; JacobianChallenge, Layer F.

### 2.5 Finiteness of nonzero-degree Abel maps

For `d≠0`, `i_α:X→J` is finite over `S`. The statement allows negative d and characteristic dividing d. The degree-zero map is constant and is not finite on a nonempty curve fibre; Yuan's §2.2.1 states finiteness without the condition `d ≠ 0`, which is needed (every use in the source has `d > 0`). ([Yuan](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29; Proposition 2.6 proof p. 31; [Stacks, Lemma 35.23.25](https://stacks.math.columbia.edu/tag/02LA).)

Use the pointed factorization on a cover acquiring a degree-one bundle. Compose a closed immersion, the finite locally free `[d]` and a translation. Being finite is fpqc local on the base (Stacks, Lemma 35.23.25), so finiteness descends.

**Checks.**

- For `d=−1` obtain a closed immersion followed by inversion. For `d=p` in characteristic p finiteness survives inseparability.

*Needs:* §2.3; §2.4; AbelianSchemesAndArithmeticModuli A3.2 (`multiplicationAndDensity`).

### 2.6 Curve difference morphism

`j:X×_S X→J` is `δ∘(a₁,a₁)`, with `j(x,y)=[O(Γ_y−Γ_x)]`; it is defined without a section. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Theorem 2.10(2) p. 37; proof pp. 38–39; [Dimitrov–Gao–Habegger](https://arxiv.org/pdf/2001.10276v3), §6.1 pp. 24–25.)

Use the `Pic¹` torsor difference with the order `(x,y)`. Represent the natural transformation and check diagonal, swap and base change.

The curve difference morphism records the point formula, diagonal, swapping and triangle relation. These identities fix the order of subtraction in the later fibre powers:

- `j(x,y)=[y]−[x]`.
- `j∘Δ_X=e∘π`.
- The morphism commutes with arbitrary `T→S`.
- With a degree-one `α`, `j(x,y)=i_α(y)−i_α(x)`.
- On `X³`, `j(x,z)=j(x,y)+j(y,z)` on every test scheme.

**Checks.**

- **Degenerate.** `j(x,x)=0` on every test scheme.
- **Computation.** For an elliptic curve with identity, `j(0,y)=y` and `j(y,0)=−y`.
- **Non-example.** The construction applies to a nontrivial genus-one torsor and must not choose a point of it.
- **Computation.** For three points x,y,z, `j(x,y)+j(y,z)=j(x,z)`; replacing the order in just one difference fails this identity.

For the pointed comparison, let `a:X→J` be the degree-one Abel morphism of §2.2.
Then `j=(p₂∘a)−(p₁∘a)` in the group of S-morphisms to J. Evaluation, the diagonal,
swapping, the cocycle relation and arbitrary base change follow from this formula.
Translating a by a base section leaves j unchanged. These equalities hold on every
test scheme, including nonreduced ones. The section-free construction still comes
from the `Pic¹` torsor; the pointed formula does not choose a point on a nontrivial
genus-one torsor. ([Yuan, arXiv v4](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29
and Theorem 2.10(2), pp. 37–38.)

**Checks for the pointed comparison.**

- Two identical T-valued points have zero difference.
- For the identity map of a group scheme, `(0,y)` and `(y,0)` give y and `−y`.
- The differences of `(x,y)` and `(y,z)` add to that of `(x,z)`.
- Every base-section translate of a gives the same difference on every pair of T-valued points.

*Needs:* §2.1; §0.4.

### 2.7 Difference as the Abel map over X

View `X×_S X` over the first X-factor. Its diagonal is a section and its Jacobian is `X×_S J`. The Abel map for `O(Δ_X)` is `(x,y)↦(x,j(x,y))`; forgetting the first coordinate gives `j`. ([Yuan](https://arxiv.org/pdf/2108.05625v4), proof of Theorem 2.10(2) p. 38.)

Base change `J` along `X→S`. Apply the degree-one Abel map to the diagonal relative divisor. Compare on all test schemes, using the degree-one point formula.

*Needs:* §2.6; §2.2; §1.3; JacobianChallenge, Layer C.

### Examples

If `α=O(x₀)`, then `i_α(x₀)=0` and `j(x₀,y)=i_α(y)`. A degree-zero `α` gives the constant morphism `−[α]`, so it fails the nonzero-degree finiteness assertion. In characteristic p, degree p gives a finite Abel morphism although its multiplication factor may be inseparable. The identities `j(x,x)=0`, `j(y,x)=−j(x,y)` and `j(x,y)+j(y,z)=j(x,z)` fix the sign of every later difference (§2.2–§2.6).

### Dependencies

Layer 0 and §§1.1–1.3 supply torsors, Jacobians and arbitrary-base-change comparisons. Construct §§2.1–2.3 before the polarization in §1.4; §§2.4–2.7 follow it in the build order. JacobianChallenge Layers A, `C` and `F` supply Cartier graph divisors and the pointed Abel map. AbelianSchemesAndArithmeticModuli A3.2 supplies finite locally free multiplication by nonzero integers. SchemeAndStackFoundations §3.7 is the field case of §2.1. The descent of closed immersions and finiteness uses Stacks, Lemmas 35.23.21 and 35.23.25. The pointed curve-difference formula uses Mathlib’s `CategoryTheory.Hom.group` and `CategoryTheory.GrpObj.comp_div`; its identification with the geometric `j` uses the earlier Abel construction.

## Layer 3: Poincaré normalization and twice-theta

Construct `P_X` with the evaluation and polarization conventions of the introduction, and construct `Θ_X` by dualizing `P_X` before taking its diagonal pullback; `Θ_X` is then the graph bundle of `λ_X` in the sense of AbelianSchemesAndArithmeticModuli A2.6. The field theta divisor is used to calculate these canonical family objects, never to choose a theta divisor on a family. Its symmetric-power Cartier structure comes from the parent theta construction.

The translated-theta calculation is required for every degree-one divisor `α`. The curve-square comparison must include the `arbitrary-α` computation, not only the special case in which `α` is a canonical root. The nonsymmetric doubling relation is the `n = 2` case of the cube formula (A1.5), the Poincaré addition identity is the Mumford-bundle identity of A2.3 for `L = O(θ_α)`, and normalized seesaw (A1.4, A2.2 `normalizedPoincare`) gives the Poincaré comparisons. The general seesaw, biextension and cube theories stay in AbelianSchemesAndArithmeticModuli A1–A2.

The geometric-fibre class of `Θ_X` is twice the principal theta class. Symmetry, zero rigidification and relative ampleness of `Θ_X` are the corresponding properties of the graph bundle (A2.6 `graphBundle_spec`) applied to `λ_X`; they are identities over `S`, and the fibre calculation of §3.10 does not replace their all-test-scheme statements.

### 3.1 Normalized Jacobian Poincaré bundle

Let `U` on `J×_S` J∨ be the Poincaré bundle `AbelianScheme.poincare` of A2.2, with `U|_{J×{b}}` representing b. Fix the supplier convention `φ_L(a)=t_a^*L⊗L⁻¹` and the positive canonical theta polarization `λ_X`. Define `P_X=(id_J×(−λ_X))^*U` on `J×_S J`. Thus on a field fibre with theta line `L` its Picard class is `m^*L⁻¹⊗p₁^*L⊗p₂^*L`, Yuan’s negative addition convention. Both zero axes are rigidified. The comparison with the supplier evaluation and `φ_L` conventions is required on all test schemes, including nonreduced ones. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 30; §A.4 Theorem A.3(2) p. 109 and proof p. 110.)

Import J∨ and the normalized universal `U`, with evaluation `U_b=b`. Use the specified `−λ_X` in the second factor; compare `φ_L` with `U` to obtain the negative addition class, including the fibre-at-zero factor for a rigidified isomorphism. Pull back both compatible axis rigidifications and the biextension identities. Verify the signed convention comparison after every base change.

The normalized Jacobian Poincaré bundle has both axis rigidifications, arbitrary base change and the comparison that fixes the negative addition sign:

- Both zero-axis pullbacks are canonically trivial with compatible unit trivializations.
- The normalized bundle and rigidifications commute with base change.
- With `U_b=b` and `φ_L(a)=t_a^*L⊗L⁻¹`, `P_X=(id×(−λ_X))^*U` has class `m^*L⁻¹+p₁^*L+p₂^*L`; the rigidified comparison also normalizes `L` at zero.

**Checks.**

- **Degenerate.** `P` restricted to either zero axis is trivial.
- **Computation.** For a genus-one pointed curve, `(i,i)^*P` has class `Δ−p₁^*0−p₂^*0`, fixing the sign.
- **Non-example.** Twisting by a nontrivial line pulled from `S` fails the specified zero-axis rigidifications.

*Needs:* §1.4; AbelianSchemesAndArithmeticModuli A2.2 (`AbelianScheme.poincare`, `normalizedPoincare`); AbelianSchemesAndArithmeticModuli A2.3 (`mumfordMap`).

### 3.2 Theta divisor with a degree-one class

Over a field `K`, for a smooth projective geometrically connected `C` of genus `g>0` and an actual degree-one divisor `α`, `θ_α` is the image of `Sym^{g−1}C→J`, `D↦[D−(g−1)α]`, with its effective Cartier divisor structure. For `g=1` the symmetric power is `Spec K` and `θ_α` is the origin. This translates the parent theta construction to arbitrary degree-one `α`, which need not be effective or a rational point. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3 p. 109.)

Here `K` is any field; `C` is smooth projective geometrically connected of genus `g>0`; `α` is a divisor of degree 1.

Import the parent symmetric power and theta-divisor theorem. Translate its `degree-(g−1)` Picard component by `−(g−1)α`. Retain the Cartier multiplicity, not just the set-theoretic image.

The theta divisor with a degree-one class exposes the translated effective locus, its change under a new degree-one divisor and its comparison with the pointed theta divisor:

- The support is the effective `degree-(g−1)` locus translated by `−(g−1)α`.
- For `α′=α+c` with `c∈Pic⁰(C)`, `θ_{α′}` is the translate of `θ_α` by `−(g−1)c`.
- For `α=O(x₀)`, this is the parent pointed theta divisor with its Cartier structure.

**Checks.**

- **Degenerate.** For `g=1 θ_α` is the origin divisor on the elliptic Jacobian.
- **Computation.** For `g=2 θ_α` is the Abel image of `C`.
- **Non-example.** On a genus-two curve over an algebraically closed field, choose `α=[P]` with 2[P] not linearly equivalent to `ω_C`. Then `θ_α` and `[−1]^*θ_α` are distinct: in the hyperelliptic involution description their equality would force `2[P]∼ω_C`. A definition that symmetrizes `θ_α` fails this test.

*Needs:* §2.2; JacobianChallenge, Layer C; JacobianChallenge, Layer E.

### 3.3 Canonical twice-theta bundle

`Θ_X:=Δ_J^*(P_X∨)`, an actual invertible sheaf on `J` with the induced zero rigidification. It is defined without a degree-one bundle on `X` and is not a chosen theta divisor. Since `P_X∨=(id_J×λ_X)^*U`, `Θ_X` is the pullback of `U` along the graph `(id_J,λ_X):J→J×_S` J∨, that is, the graph bundle `Polarization.graphBundle λ_X` of AbelianSchemesAndArithmeticModuli A2.6. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Definition 2.4 p. 30, after Mumford–Fogarty–Kirwan §6.2.)

Use the dual of the invertible sheaf `P_X`. Pull back along the diagonal morphism. Transport the zero-axis trivializations to the identity section.

The canonical twice-theta bundle records the dual diagonal construction and the inherited rigidification. Its base-change comparison is needed before calculating geometric fibres:

- `Θ=Δ_J^*(P∨)`, with the dual, not `Δ_J^*P`.
- `Θ_{X_T}` identifies with `Θ_X` pulled to `J_T`, respecting rigidification.
- `e^*Θ≅O_S` with the specified trivialization.
- `Θ_X` equals `Polarization.graphBundle λ_X` as rigidified line bundles, compatibly with base change.

**Checks.**

- **Computation.** On a pointed elliptic curve the class of `Θ` is 2[0], of degree2.
- **Non-example.** `Δ_J^*P` has negative degree on an elliptic fibre and is not the ample bundle `Θ`.
- **Non-example.** `Θ` exists without a global degree-one class; no arbitrary theta divisor is part of its definition.

*Needs:* §3.1; AbelianSchemesAndArithmeticModuli A2.6 (`Polarization.graphBundle`); Tau Ceti `InvertibleSheaf`.

### 3.4 Pullback of inverse theta

First prove the translated inverse-theta pullback. For any field K, a smooth projective geometrically connected curve `C/K` of genus `g>0`, a degree-one divisor α and an actual degree-zero line class c on C,
`i_{α−c}^*O_J([−1]^*θ_α)=O_C(gα)⊗c⁻¹`
in `Pic(C)`. Here `α−c` denotes the actual degree-one line class `O_C(α)⊗c⁻¹` used in §2.2. No rational base point or symmetry of `θ_α` is assumed. ([Yuan](https://arxiv.org/pdf/2108.05625v4), proof of Theorem A.3(1), p. 110, displaying Serre's p. 75 identity.)

Construct this comparison from curve Riemann–Roch and the translated effective theta locus of §3.2, keeping the actual degree-one class throughout. It is a Picard-class identity; it does not select a scalar isomorphism.

**Checks for the translated pullback.**

- For `c=O_C`, the class is `O_C(gα)`, giving the inverse-theta pullback below.
- On an elliptic E over an algebraically closed field, take `α=[0]` and `c=O_E([P]−[0])` with `2P≠0`. The Abel map is translation by P, and its pullback of the origin divisor is `O_E([−P])`, not `O_E([P])`. This detects the inverse on c.
- For genus two with `2α` not linearly equivalent to `ω_C`, the class is `O_C(2α)⊗c⁻¹`. At `c=0` it differs from the ordinary theta pullback `ω_C` of §3.5; replacing inverse theta by theta fails.

*Needs:* §3.2; §2.2; JacobianChallenge, Layer B.

Prove `i_α^*O_J([-1]^*θ_α)≅O_C(gα)`. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3(1) first identity p. 109; proof p. 110.)

Here `K` is any field; `C` is smooth projective geometrically connected of genus `g>0`; `α` is a degree-one divisor; `J`, `i_α`, `θ_α` and `P` have the conventions of Layers 2–3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Specialize the translated inverse-theta pullback to `c=0`. Preserve the degree-one divisor hypothesis over `K`; a rational base point is not substituted.

**Checks.**

- For `g=1` this is the degree-one α class.
- For `g=2` the class is `2α`, of degree two.
- For genus two and `2α` not linearly equivalent to `ω_C`, the inverse-theta pullback differs from the ordinary theta pullback; symmetrizing the divisor changes the statement.

*Needs:* §3.4 (the translated inverse-theta pullback).

### 3.5 Pullback of theta

Prove `i_α^*O_J(θ_α)≅ω_{C/K}⊗O_C((2−g)α)`. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3(1) second identity p. 109; proof p. 110.)

Here `K` is any field; `C` is smooth projective geometrically connected of genus `g>0`; `α` is a degree-one divisor; `J`, `i_α`, `θ_α` and `P` have the conventions of Layers 2–3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Use Riemann–Roch to identify `[−1]^*θ_α=t_κ^*θ_α` for `κ=[ω_C−(2g−2)α]`. Thus `O_J(θ_α)=t_{−κ}^*O_J([−1]^*θ_α)`. Pull back along `i_α` and apply the translated inverse-theta pullback with `c=−κ`: the resulting class `gα+κ` is `ω_C+(2−g)α`.

**Checks.**

- For `g=2` the answer is `ω_C`, independently of `α`. The degree is `g`, not `2g−2`.

*Needs:* §3.2; §3.4 (the translated inverse-theta pullback, the inverse-theta pullback); JacobianChallenge, Layer B.

### 3.6 Poincaré addition identity

In `Pic(J×J)`, `P=m^*O_J(−θ_α)⊗p₁^*O_J(θ_α)⊗p₂^*O_J(θ_α)`. As a rigidified isomorphism, include the constant fibre normalization of `O_J(θ_α)` at the origin; the displayed formula alone is a class equality over the field. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3(2) p. 109; proof p. 110.)

Here `K` is any field; `C` is smooth projective geometrically connected of genus `g>0`; `α` is a degree-one divisor; `J`, `i_α`, `θ_α` and `P` have the conventions of Layers 2–3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

By §1.4, `λ_X=φ_L` with `L=O(θ_α)`, and A2.3 identifies `(id×φ_L)^*U` with the Mumford bundle `m^*L⊗p₁^*L⁻¹⊗p₂^*L⁻¹` normalized at zero; `P_X` is its inverse by §3.1. Compare the zero-axis restrictions; a one-dimensional K-vector-space factor is trivial as a Picard class but has no unchosen canonical trivialization.

*Needs:* §3.1; §3.2; §1.4; AbelianSchemesAndArithmeticModuli A2.3 (`mumfordMap`).

### 3.7 Poincaré pullback on the curve square

In `Pic(C×C)`, `(i_α,i_α)^*P=O(Δ_C)⊗p₁^*O_C(−α)⊗p₂^*O_C(−α)`. There is no assumption `(2g−2)α=ω_C`. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3(3) p. 109; proof p. 110.)

Here `K` is any field; `C` is smooth projective geometrically connected of genus `g>0`; `α` is a degree-one divisor; `J`, `i_α`, `θ_α` and `P` have the conventions of Layers 2–3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Compare the two families of degree-zero line classes by the Poincaré universal property. Compute their translated-theta restrictions using the translated inverse-theta pullback with arbitrary α and c. Use normalized seesaw to remove the axis terms; the translated formula supplies the computation without a canonical-root hypothesis.

**Checks.**

- For genus 2 with arbitrary `α`, the formula still holds without `2α=ω_C`. The diagonal has positive sign.

*Needs:* §3.6; §3.4 (the translated inverse-theta pullback); §3.5; JacobianChallenge, Layer F; AbelianSchemesAndArithmeticModuli A1.4 (`relativeSeesaw`); AbelianSchemesAndArithmeticModuli A2.2 (`normalizedPoincare`).

### 3.8 Theta doubling formula

Prove `[2]^*O_J(θ_α)≅O_J(3θ_α+[-1]^*θ_α)` as a Picard class over `K`. This is the case `n = 2`, `L = O(θ_α)` of the cube formula `[n]^*L ≅ L^{n(n+1)/2}⊗([−1]^*L)^{n(n−1)/2}` of AbelianSchemesAndArithmeticModuli A1.5; over a field the base-line factor is a trivial class. ([Yuan](https://arxiv.org/pdf/2108.05625v4), proof of §A.4 Theorem A.3(4) p. 110, citing Serre's corollary of the cube theorem.)

Here `K` is any field; `C` is smooth projective geometrically connected of genus `g>0`; `α` is a degree-one divisor; `J`, `i_α`, `θ_α` and `P` have the conventions of Layers 2–3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Apply `relativeCube` with `n = 2` to the theta line. Keep the nonsymmetric inversion term instead of replacing it by `θ_α`.

**Checks.**

- For a symmetric theta line this specializes to `[2]^*L≅L⁴`; for `g = 1` and `α = O(0)`, `[2]^*O(0) ≅ O(4·0)` has degree 4.

*Needs:* §3.2; AbelianSchemesAndArithmeticModuli A1.5 (`relativeCube`).

### 3.9 Poincaré diagonal identity

Prove `Δ_J^*P≅O_J(−θ_α−[-1]^*θ_α)`. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3(4) and proof p. 110.)

Here `K` is any field; `C` is smooth projective geometrically connected of genus `g>0`; `α` is a degree-one divisor; `J`, `i_α`, `θ_α` and `P` have the conventions of Layers 2–3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Pull the addition identity back to the diagonal, obtaining `[2]^*O(−θ)+O(2θ)`. Substitute the doubling formula and cancel the theta classes.

**Checks.**

- Dualizing gives the positive twice-theta class.

*Needs:* §3.6; §3.8.

### 3.10 Geometric fibre twice-theta class

For every geometric point s of `S`, `Θ_s` is algebraically equivalent to twice a theta divisor on `J_s`. With a chosen degree-one `α` over the algebraically closed residue field, its Picard class is `θ_α+[-1]^*θ_α`. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Definition 2.4 and following paragraph p. 30; §A.4 Theorem A.3(4) p. 110.)

Base change the normalized Poincaré bundle. Choose `α` on the geometric fibre only. Dualize the diagonal identity; inversion acts trivially on the Néron–Severi class, which is `2[O(θ_α)]` in agreement with A2.6 `graphBundle_spec`.

*Needs:* §3.3; §3.9; §1.3; AbelianSchemesAndArithmeticModuli A2.6 (`graphBundle_spec`).

### 3.11 Symmetry of twice-theta

Prove `[-1]^*Θ_X≅Θ_X` as zero-rigidified bundles over `S`, not merely on geometric fibres. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Definition 2.4 and following paragraph p. 30.)

By §3.3, `Θ_X` is the graph bundle of `λ_X`, which is symmetric by A2.6 `graphBundle_spec`; equivalently, simultaneous inversion fixes the normalized biextension `P_X`, and the rigidified identity passes through `Δ_J` and dualization.

*Needs:* §3.3; §3.1; AbelianSchemesAndArithmeticModuli A2.6 (`graphBundle_spec`).

### 3.12 Zero rigidification of twice-theta

The zero-axis trivializations of `P` induce `e^*Θ_X≅O_S`, compatible with base change. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Definition 2.4 and following paragraph p. 30.)

Factor the zero diagonal through either zero axis. Dualize the trivialization and check the agreement at the unit; this is the rigidification of the graph bundle in A2.6.

*Needs:* §3.3; §3.1.

### 3.13 Relative ampleness of twice-theta

Prove `Θ_X` is relatively ample for `J→S`; hence `J→S` is projective. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Definition 2.4 and following paragraph p. 30; [Kleiman](https://arxiv.org/pdf/math/0504020v1), Remark 5.26, p. 51.)

The graph bundle of a polarization is relatively ample (A2.6 `graphBundle_spec`), and `Θ_X` is the graph bundle of `λ_X` by §3.3. Concretely: twice the principal theta class is ample on every geometric fibre (§3.10), and on the proper finitely presented `J→S` an actual invertible sheaf that is ample on every geometric fibre is relatively ample (StableReduction Layer 2); algebraic equivalence preserves ampleness on these fibres.

*Needs:* §3.10; §3.3; §1.1; AbelianSchemesAndArithmeticModuli A2.6 (`graphBundle_spec`); StableReduction, Layer 2.

### Examples

For an elliptic Jacobian, the positive canonical `Θ` has degree two, while `Δ^*P` has degree minus two. For genus two, the pullback of `θ_α` is `ω_C` independently of the choice of degree-one `α`. A translated theta divisor can fail symmetry; its doubling formula must keep both `θ_α` and `[−1]^*θ_α`. Twisting `P` by a nontrivial base bundle fails the specified rigidifications. These checks distinguish the signs, the actual line-bundle classes and the chosen normalizations (§3.1–§3.9).

### Dependencies

Layers 1 and 2 supply the polarized Jacobian and Abel maps. JacobianChallenge Layers `B`, `E` and `F` supply field duality and theta. AbelianSchemesAndArithmeticModuli A1.4–A1.5 supply seesaw and the cube formula, A2.2–A2.3 the Poincaré bundle and the Mumford map, and A2.6 the graph bundle with its symmetry, rigidification and relative ampleness. StableReduction Layer 2 supplies the fibrewise ampleness criterion. Tau Ceti's invertible sheaves carry `Θ=Δ^*(P∨)`.

## Layer 4: Actual Picard groups and autoduality pullbacks

Work first with actual line-bundle classes and their two projection conditions. Define algebraic triviality intrinsically by connected finite-type parameter families, as in the conventions and §4.1. Tensoring, dualizing and pulling back these families construct the subgroup and functoriality laws without fibre Picard representability. The intrinsic-to-identity-component comparison (§4.1) identifies this relation with identity-component membership when the fibre Picard sheaf is represented. Curve fibres use §0.3; abelian-scheme fibres use AbelianSchemesAndArithmeticModuli A2.1–A2.2. For a curve the condition is degree zero; on higher-dimensional fibres it is not a degree condition.

The universal-global-functions hypothesis permits the low-degree fppf Leray sequence (ComplexComparisonPartII §C3.2d.4, `picard_brauer_obstruction`). A section of `J/S` removes the Brauer obstruction on `J`; it does not create a section of `X/S`. Compare degree-d Abel pullback to multiplication by d through relative autoduality on all test schemes. When lifting an actual class, absorb any difference pulled from `S` by a corresponding base twist on `J`.

For the bi-zero statement, lift along one factor and then the other. Each lift must preserve algebraic triviality along the remaining projection; the one-variable torsion-cokernel assertion alone does not prove this. The pointed field comparison instead uses the two actual axis kernels and the Albanese universal property with normalized seesaw. Its algebraic statement makes sense over any field, independently of the complete-valued-field application.

### 4.1 Actual fibrewise Picard subgroup

For a projective flat `Y→S`, `Pic⁰(Y/S)` is the subgroup of the actual `Pic(Y)` formed by line-bundle classes algebraically equivalent to O on every geometric fibre, using connected finite-type parameter families. It is not `Pic⁰_{Y/S}(S)`; comparison to that sheaf group requires a separate obstruction statement. ([Kleiman](https://arxiv.org/pdf/math/0504020v1), Definition 5.9, p. 41, Proposition 5.10, pp. 41–42; [Yuan](https://arxiv.org/pdf/2108.05625v4), Proposition 2.6 proof p. 31.)

Construct algebraic equivalence as the relation generated by finite chains of invertible-sheaf families on `V×T_i`, where each `T_i` is connected and of finite type over the geometric fibre's field; endpoints and consecutive fibres are identified after extension to common geometric residue fields. Constant families, reversal and concatenation give an equivalence relation. Tensor a chain with a fixed bundle and concatenate chains to obtain tensor compatibility; dualize or pull back the families to obtain inverse and pullback compatibility. Extension of algebraically closed residue fields preserves these relations. None of these constructions assumes universal global functions or a represented fibre Picard sheaf.

Prove that whenever a geometric fibre's fppf Picard sheaf is represented, an actual restricted class is algebraically equivalent to O exactly when its image lies in the identity component. Families give connected images in that component; conversely, an fppf cover carrying a universal line class supplies the connecting families (Kleiman, Proposition 5.10 and proof). Apply this comparison to curve and abelian-scheme fibres using their supplied representability.

The properties of the actual fibrewise Picard subgroup distinguish actual membership from a relative section and keep the kernel condition explicit:

- Membership means algebraic triviality on every geometric fibre, not degree zero for higher-dimensional `Y`.
- For represented fibre Picard sheaves, the intrinsic condition is equivalent to identity-component membership on every geometric fibre.
- An S-morphism `Y′→Y` pulls these actual classes to fibrewise algebraically trivial classes.
- When the relative Picard sheaf is represented, the class map lands in its fibrewise identity-component subfunctor `Pic⁰_{Y/S}(S)` by the intrinsic-to-identity-component comparison; under universal global-functions hypotheses its kernel is the base classes.

**Checks.**

- **Degenerate.** For `Y=S`, every class in `Pic(S)` belongs to this subgroup.
- **Compatibility.** For a smooth projective curve over a field, membership is equivalent to degree 0.
- **Non-example.** An obstructed point of the relative Picard sheaf is not an actual line-bundle class in this subgroup.
- For `Y=E⊔E` over an algebraically closed field, a pair of line classes belongs exactly when both degrees are zero. For `P≠0`, `(O_E([P]−[0]),O_E)` belongs and `(O_E,O_E([0]))` does not, although `H⁰(Y,O_Y)=k×k` and universal global functions fail.

*Needs:* JacobianChallenge, Layer A; AlgebraicModuliForArithmeticGeometry §7.6.1 (`relativePicardSheaf`, `relativePicardKernel`, for the relative-class comparison); ComplexComparisonPartII §C3.2f.1 (`picardZeroSheaf`, for represented Picard sheaves); §0.3 and AbelianSchemesAndArithmeticModuli A2.1–A2.2 (curve and abelian-scheme fibre representability).

### 4.2 Picard subgroup along both projections

For projective flat `Y₁,Y₂` over `S`, `Pic⁰⁰(Y₁×_S Y₂)` consists of actual line classes whose restrictions to every geometric fibre of each projection to `Y₁` and to `Y₂` are algebraically equivalent to O by the intrinsic parameter-family relation of §4.1. No representability of those fibre Picard sheaves is assumed. ([Kleiman](https://arxiv.org/pdf/math/0504020v1), Definition 5.9, p. 41; [Yuan](https://arxiv.org/pdf/2108.05625v4), Proposition 2.6 proof p. 31.)

Intersect the two fibrewise algebraic-triviality subgroups. Check that tensor and inverse preserve both conditions.

The actual bi-zero Picard subgroup records both projection conditions, their pullback compatibility and the base classes that remain in the actual group:

- Both projection-fibre conditions are required.
- Products of S-morphisms preserve the two fibre conditions.
- Classes pulled from `S` lie in `Pic⁰⁰`; they are not quotiented out of the definition.

**Checks.**

- **Degenerate.** The structure sheaf and every base pullback lie in `Pic⁰⁰`.
- **Non-example.** On `C×C`, `p₁^*L` of positive degree fails one projection condition, despite being trivial along the other projection fibres.
- **Compatibility.** The normalized Poincaré bundle `P_X` on `J×J` belongs to `Pic⁰⁰`: its restriction to each fibre of either projection lies in the identity component `Pic⁰` of that abelian fibre, hence is intrinsically algebraically trivial by the intrinsic-to-identity-component comparison (§4.1) (degree zero when `g = 1`, but for `g ≥ 2` the condition is algebraic triviality, not a degree).

*Needs:* §4.1; JacobianChallenge, Layer A.

### 4.3 Relative curve autoduality

There is a canonical base-change-compatible identification `u:Pic⁰_{J/S}≅Pic⁰_{X/S}` such that, for the actual degree-d `α`, `i_α^*= [d]∘u` as morphisms of fppf group sheaves. The sign of u is characterized by degree-one Abel pullback. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Proposition 2.6 proof p. 31; [Kleiman](https://arxiv.org/pdf/math/0504020v1), Remark 5.26, p. 51, for the autoduality isomorphism, independent of the degree-one bundle and existing without one. Kleiman's Abel map sends t to `L_T ⊗ O(−Γ_t)`, the negative of `i_α` for `d = 1`, so his autoduality is `−u.`)

Use the canonical family Abel pullback isomorphism `u` of §1.4. On a cover with a section `x₀`, §2.3 gives `i_α=[d]∘i_{O(x₀)}+b` for a base section b of `J`. Translation acts trivially on the relative `Pic⁰` of an abelian scheme (A2.3), and the pullback of `[d]` on its dual is `[d]` (A2.2). Consequently `i_α^*=[d]∘u` on every test scheme. The equality descends along the cover, including nilpotent bases.

**Checks.**

- For `d=0` this morphism is zero. For `d=−1` it is `−u`.

*Needs:* §1.2; §1.4; §2.2; JacobianChallenge, Layer F; AbelianSchemesAndArithmeticModuli A2.2 (`AbelianScheme.dual`, `AbelianScheme.dual_baseChange`).

### 4.4 Actual Picard classes and the Brauer obstruction

For proper flat `Y/S` with `O_S≅f_*O_Y` universally, the exact sequence `0→Pic(S)→Pic(Y)→Pic_{Y/S}(S)→H²_fppf(S,G_m)→H²_fppf(Y,G_m)` is ComplexComparisonPartII §C3.2d.4's `picard_brauer_obstruction` (cohomological Brauer groups, no identification with Azumaya classes; the boundary is the Leray differential `d₂^{0,1}`). The target here is its restriction to the algebraically trivial parts: for `J/S` the identity section kills the obstruction, so `Pic⁰(J/S)/Pic(S)≅Pic⁰_{J/S}(S)`; for `X/S` the same map is only injective without a section. ([Kleiman](https://arxiv.org/pdf/math/0504020v1), Remark 2.11, pp. 20–21, sequence (2.11.4).)

Here `Y→S` is proper, flat and finitely presented, with `O_T≅(f_T)_*O_{Y_T}` for every `T→S`. For the `Pic⁰` restrictions, use the smooth geometrically connected curve `X/S` and its abelian-scheme Jacobian `J/S` in the standing scope.

Take the imported sequence and restrict it to classes that are algebraically trivial on geometric fibres. For X and J the fibre Picard sheaves are represented, so the intrinsic-to-identity-component comparison (§4.1) identifies this condition with the identity-component subfunctor. Use `sectionPicardSplit` for the identity section of `J` to get surjectivity; do not use it as a section of `X`.

**Checks.**

- For a sectionless genus-one curve a relative class may have nonzero Brauer obstruction.

*Needs:* ComplexComparisonPartII §C3.2d.4 (`picard_brauer_obstruction`); AlgebraicModuliForArithmeticGeometry §7.6.1–§7.6.1a (`relativePicardKernel`, `sectionPicardSplit`); §4.1 (the intrinsic-to-identity-component comparison (§4.1)); §1.2; JacobianChallenge, Layer C.

### 4.5 Actual Picard pullback torsion cokernel

Let `S` be a normal integral quasi-projective scheme flat over `ℤ` or over a field, and let `α` have relative degree `d>0`. Every `L∈Pic⁰(X/S)` has a positive tensor power in the image of `i_α^*:Pic⁰(J/S)→Pic⁰(X/S)`. In particular the cokernel is a torsion group. No integral surjectivity is asserted. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Proposition 2.6 proof p. 31.)

View the class of `L` in `Pic⁰_{X/S}(S)`. Use `u⁻¹` to obtain a relative class on `J`, and the identity section to represent it by an actual `M`. The relative equality `i_α^*[M]=d[L]` says that `i_α^*M−dL` is a base pullback. Absorb this base pullback in `M` using `J→S`, proving the actual-class statement, with the necessary global-functions and fibre-triviality checks. The argument gives `L^d` in the image, so the exponent d kills the cokernel.

**Checks.**

- For `d=1` the argument gives surjectivity under the stated comparison hypotheses. For `d>1`, torsion cokernel does not mean `[d]` is surjective on S-points.

*Needs:* §4.3; §4.4; §4.1.

### 4.6 Lift preserving both fibre conditions

In the arithmetic normal-base scope and for positive-degree `i_α`, every `Pic⁰⁰` class on `X×_S X` has a positive power lifted through `id_X×i_α` to a class on `X×_S J` lying in `Pic⁰⁰`. The corresponding assertion through `i_α×id_J` lifts `Pic⁰⁰(X×J)` to `Pic⁰⁰(J×J)`. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Proposition 2.6 proof pp. 31–32.)

Here the arithmetic normal-base scope means `S` is normal, integral, quasi-projective and flat over `Z` or over a field, the standing smooth curve hypotheses hold, `α` is an actual relative degree-d line bundle, and `d>0`.

Apply the actual Picard pullback statement to the curve after base change to the other factor. The other projection condition follows from connectedness, as follows. The new bases `X` and `J` are normal integral and quasi-projective: they are smooth with geometrically integral fibres over `S`, and `X` is projective while `J` is projective by §3.13. They are flat over the same arithmetic base. Thus §4.5 applies to both.

First take `L∈Pic⁰⁰(X×X)`. Over base `X`, §4.5 gives an actual `M` on `X×J`, algebraically trivial on the `J` fibres over `X`, with `(id_X×i_α)^*M=L^d`. Fix a geometric s. The degree of `M` restricted to `X_s×{a}` is locally constant as a varies through the connected `J_s`. At `a=i_α(x)` it is zero because this restriction is `L|_{X_s×{x}}^d`. Hence it is zero everywhere, so `M` lies in `Pic⁰⁰(X×J)`.

Next, for `M∈Pic⁰⁰(X×J)`, apply §4.5 over base `J` (with the factors reordered) to obtain `N` on `J×J` with `(i_α×id_J)^*N=M^d` and algebraically trivial restrictions on the first-J fibres. For fixed geometric s, the restrictions `N|_{{a}×J_s}` define a morphism from connected `J_s` to `Pic_{J_s/s}`. At `a=i_α(x)` the class is `M|_{{x}×J_s}^d`, which belongs to `Pic⁰`. The connected image therefore lies entirely in the identity component (Kleiman, Proposition 5.10 and proof, pp. 41–42). This proves the second condition on `N`. The actual equalities include the base-line correction from §4.5, so no extra twist is made after this argument.

**Checks.**

- A lift that acquires a positive-degree restriction on the other axis fails this lemma.

*Needs:* §4.5; §4.2; §0.1; §1.3; §3.13; ComplexComparisonPartII §§C3.2f.1–C3.2f.2 (`picardZeroSheaf`); AbelianSchemesAndArithmeticModuli A2.2 (`AbelianScheme.dual`).

### 4.7 Bi-Picard pullback torsion cokernel

Under the same `S`, `X`, `α` and `d>0` hypotheses, `(i_α,i_α)^*:Pic⁰⁰(J×_S J)→Pic⁰⁰(X×_S X)` has torsion cokernel. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Proposition 2.6 proof pp. 31–32.)

Here the arithmetic normal-base scope means `S` is normal, integral, quasi-projective and flat over `Z` or over a field, the standing smooth curve hypotheses hold, `α` is an actual relative degree-d line bundle, and `d>0`.

Factor the pullback through `X×_S J`. Each one-factor argument of §4.6 lifts the d-th power with the other fibre condition intact. Their composition lifts `L^{d²}`, so `d²` kills the cokernel. This is a bound from the actual lifting construction, not an assertion that multiplication by d is surjective on S-points.

*Needs:* §4.6; §4.2.

### 4.8 Axis-normalized Picard subgroup

Define `RelativeJacobian.AxisNormalizedPicard`. Over a field `K`, with a rational `x₀∈C(K)`, `Pic⁻(C²)` is the subgroup of actual `Pic(C²)` whose restrictions to `C×{x₀}` and `{x₀}×C` are trivial; `Pic⁻(J²)` uses the two zero axes. These are classes with trivial restrictions, not chosen rigidifications and not the larger `Pic⁰⁰` subgroup. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.3 p. 108, axis-normalized subgroups.)

Here `K` is a field; `C/K` is smooth projective geometrically connected of `genus>0`; `x₀∈C(K)`. Its nonarchimedean application additionally assumes `K` complete nontrivially nonarchimedean.

Take the intersection of the kernels of the two actual restriction maps. Retain the distinction between existence of a trivialization and a specified trivialization. `RelativeJacobian.AxisNormalizedPicard` in `Suggested.lean` defines the underlying set by these two equalities on Tau Ceti’s actual `LineBundleClass`, using the native fibre product in `Over S`.

The axis-normalized Picard subgroup has the following properties. The Poincaré comparison includes its additional rigidification:

- Both actual axis restrictions have the trivial Picard class.
- Pointed product morphisms pull back axis-normalized classes.
- The normalized Poincaré class belongs to `Pic⁻(J²)`, with an additional rigidification available from its construction.

**Checks.**

- **Degenerate.** The trivial line class lies in `Pic⁻`.
- **Non-example.** On `C²`, `p₁^*L` for a nontrivial degree-zero `L` fails one axis restriction despite belonging to `Pic⁰⁰`.
- **Computation.** For a pointed elliptic E, `O(Δ−E×{0}−{0}×E)` is a nonzero element of `Pic⁻(E²)`. Both axis restrictions are trivial, while its diagonal pullback has degree `−2`: the diagonal normal bundle has degree zero and the two axis terms each contribute `−1`.

*Needs:* §4.1; §4.2; JacobianChallenge, Layer A.

### 4.9 Pointed square Picard comparison

Prove `RelativeJacobian.pointedSquarePicardIsomorphism`. With `x₀` as above and `i=i_{O(x₀)}`, `(i,i)^*:Pic⁻(J²)→Pic⁻(C²)` is an isomorphism. The application over complete nonarchimedean `K` uses only this algebraic assertion here; its metrics belong to the Arakelov owner. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.3 p. 108, citing Zhang Lemmas 2.2.1–2.2.3.)

Here `K` is a field; `C/K` is smooth projective geometrically connected of genus `g>0`; `x₀∈C(K)`, and `i=i_{O(x₀)}`. No complete-valued-field assumption is used by the algebraic comparison.

`RelativeJacobian.pointedSquarePicardIsomorphism` in `Suggested.lean` states this as unique extension of every axis-normalized actual class. It uses a native `AbelianVariety` and `AbelianVariety.IsAlbanese x₀ i` to characterize the pointed Jacobian, with positive dimension expressing positive genus. The curve is smooth of relative dimension one, geometrically connected and proper over an arbitrary field; such a curve is projective.

Identify an axis-normalized line class with its pointed Picard-valued family. Use the parent Albanese universal property to extend it uniquely from `C` to `J` in each variable. Apply normalized seesaw to recover the original actual class; prove the two-variable pointed Picard comparison used in this step.

**Checks.**

- For `C` elliptic and `x₀` its identity the map is the identity. The rational point `x₀` is required; this statement does not choose a rational point on an arbitrary curve.

*Needs:* §4.8; §2.2; §4.3; JacobianChallenge, Layer F; AbelianSchemesAndArithmeticModuli A1.4 (`relativeSeesaw`); AbelianSchemesAndArithmeticModuli A2.2 (`normalizedPoincare`).

### Examples

A base pullback lies in the actual fibrewise Picard subgroup, although it maps to zero in the relative sheaf. A positive-degree pullback from one factor of `C×C` fails the other projection’s algebraic-triviality condition. A nontrivial degree-zero pullback from one factor can lie in `Pic⁰⁰` while failing triviality on its pointed axis. These are three different tests; quotienting by `Pic(S)`, requiring algebraic triviality and imposing axis trivializations must not be interchanged (§4.1, §4.2 and §4.8).

### Dependencies

Layers 1–3 supply the relative Jacobian, the degree-d Abel map and the Poincaré normalization. JacobianChallenge Layers A and `F` supply actual Picard classes and pointed universal properties. Section 4.1 constructs intrinsic algebraic equivalence and compares it with represented fibre identity components. ComplexComparisonPartII §C3.2d.4 supplies the Brauer-obstruction sequence and §§C3.2f.1–C3.2f.2 the represented identity-component subfunctor; AlgebraicModuliForArithmeticGeometry §§7.6.1–7.6.1a supplies the actual-to-relative comparison; AbelianSchemesAndArithmeticModuli A1.4 and A2.2 supply seesaw and duality. The obstruction sequence and the lift preserving the other projection are separate prerequisites for the torsion-cokernel assertions.

## Layer 5: Fibre powers and shifted Faltings–Zhang maps

The canonical bundle has degree `2g−2`, so for `g>1` it gives a finite canonical Abel map without a choice of degree-one bundle. Addition with a free Jacobian coordinate gives the universal shift. Repeated use of the section-free difference defines the Faltings–Zhang map on every positive fibre power.

Keep the first shifted canonical coordinate separate from the unscaled tail differences. The triangular coordinate equivalence is natural on represented points for any group object, including noncommutative ones. In the Jacobian application the group is commutative and these coordinate formulas assemble to an isomorphism of fibre-power schemes by Yoneda. Only the tail-isogeny factorization uses multiplication by `2g−2`. Nondegeneracy, maximal variation and numerical height estimates are arithmetic consumers of these maps, rather than hypotheses of their definition.

### 5.1 Canonical-bundle Abel morphism

For `g>1`, `ω_{X/S}` has relative degree `2g−2`, so `i_ω(x)=[(2g−2)Γ_x−ω_{X/S}]` is a finite S-morphism `X→J`. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Theorem 2.10(1) p. 37; §2.2.1 p. 29.)

Assume `g>1`; in the fibre-power assertions `m≥1`.

Use the fibre canonical degree and dualizing base change. Apply the nonzero-degree finiteness theorem.

*Needs:* §2.2; §2.5; JacobianChallenge, Layer B; JacobianChallenge, Layer C.

### 5.2 Universal shifted canonical morphism

For `g>1`, `τ:J×_S X→J×_S J` is `(y,x)↦(y,y+i_ω(x))`; it is a morphism over the first J-factor and has no global-section hypothesis. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Theorem 2.10(3) p. 37.)

Assume `g>1`; in the fibre-power assertions `m≥1`.

Take `id_J×i_ω` and apply addition in the second `J` coordinate. Verify the first projection is unchanged.

The same construction makes sense for any group object A in `Over S` and any S-morphism
`c:X→A`: its two projections are `p₁` and `p₁·(p₂∘c)` in Mathlib's multiplicative group
notation. The product comparison identifies its pullback with the shift built from the
pulled-back c, as morphisms over the new base. With `c=0` it is the diagonal shift
`(y,x)↦(y,y)`. In the geometric application `A=J` and `c=i_ω` from §5.1.
([Yuan, arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29 and
Theorem 2.10(3) p. 37.)

The coordinate properties of the universal shifted canonical morphism preserve its first Jacobian factor and commute with arbitrary base change:

- `τ(y,x)=(y,y+(2g−2)[x]−ω)`.
- `q₁∘τ=p₁`.
- `τ` commutes with arbitrary `T→S`.

**Checks.**

- **Computation.** `τ(0,x)=(0,i_ω(x))`.
- **Non-example.** The asserted finite canonical Abel map uses `g>1`; in genus 1 its degree is 0 and it is constant.
- **Characterisation.** Changing x leaves the first coordinate y fixed on every test scheme.

*Needs:* §5.1; AbelianSchemesAndArithmeticModuli A1.1 (`relativeProductsAndDimension`).

### 5.3 Faltings–Zhang morphism

For `m≥1`, `FZ_m:X^{m+1}_S→J^m_S` sends `(x₀,…,x_m)` to `(j(x₀,x₁),…,j(x₀,x_m))`. It is defined without a section and without a maximal-variation hypothesis. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §4.6.2 pp. 96–97 and Theorem 4.17 proof p. 98; [Dimitrov–Gao–Habegger](https://arxiv.org/pdf/2001.10276v3), §6.1 equation (6.3) and paragraph after (6.5) p. 25.)

Use the actual fibre-power projections and form each difference coordinate. Use the product universal property to assemble the morphism. Check base change through the fibre-power comparisons.

The source fibre power is indexed by `Fin (m+1)` and the target by `Fin m`;
target coordinate i uses source coordinates 0 and i.succ, in that order. The
pointed comparison uses `j(x,y)=a(y)−a(x)` and `a(P)=0`. Changing the degree-one
normalization does not change these differences. Base change uses the canonical
fibre-product comparisons. Properness follows from `AlgebraicGeometry.IsProper.of_comp`:
the source is proper over S and the target is separated over S.
([Yuan, arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4), §4.6.2 pp. 96–98;
Dimitrov–Gao–Habegger, §6.1 p. 25.)

The Faltings–Zhang morphism records every difference coordinate, its base change and the specialization obtained by fixing the first point:

- The r-th coordinate is `[x_r]−[x₀]`, for `1≤r≤m`.
- The morphism pulls back to `FZ_m` of `X_T/T`.
- Fixing `x₀=P₀` on a fibre gives the m-fold product of the pointed Abel embedding `C−P₀`.
- `FZ_m` is proper: its source is proper over `S` and `J^m` is separated over `S`, so the graph factorization is proper.

**Checks.**

- **Computation.** `FZ₁(x₀,x₁)=j(x₀,x₁)`.
- **Degenerate.** The small diagonal maps to the zero tuple.
- **Characterisation.** With any degree-one `α`, all coordinates equal `i_α(x_r)−i_α(x₀)`, independent of `α`.

*Needs:* §2.6; AbelianSchemesAndArithmeticModuli A1.1 (`relativeProductsAndDimension`).

### 5.4 Shifted Faltings–Zhang morphism

For `g>1` and `m≥1`, `τ_m:X^m_S×_S J→J^m_S` sends `(x₁,…,x_m,y)` to `(i_ω(x₁)+y,j(x₁,x₂),…,j(x₁,x_m))`. The source order, first shift and unscaled remaining differences are part of the definition. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §4.6.2 pp. 96–97 and Theorem 4.17 proof p. 98.)

Assume `g>1`; in the fibre-power assertions `m≥1`.

Assemble the first coordinate from addition and `i_ω`. Assemble the remaining coordinates from `j` and use the product universal property.

Write `m=n+1` so that the head coordinate exists. The source is `X^m×_S J`;
the head is `i_ω(x₁)+y` and coordinate `r>1` is `j(x₁,x_r)`. The base-change
comparison includes both the binary product and the curve fibre power, preserves
this source order and holds over the whole new base. ([Yuan, arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4),
§4.6.2, definition preceding Theorem 4.17 p. 97 and proof p. 98.)

The shifted Faltings–Zhang morphism distinguishes the shifted head from each unscaled tail and preserves this order under base change:

- The first coordinate is `(2g−2)[x₁]−ω+y`.
- Coordinate `r>1` is `[x_r]−[x₁]`, with no factor `2g−2`.
- The shifted morphism commutes with `T→S`.

**Checks.**

- **Degenerate.** For `m=1` the map is `i_ω(x₁)+y`; there is no tail coordinate.
- **Computation.** For the same coordinate construction with arbitrary `c:X→A`, take `m=2`, `X=A` and `d(x,y)=y/x`. The second coordinate is `x₂/x₁` in Mathlib's group notation, independently of c and y. On a pointed elliptic curve this is `x₂−x₁`.
- **Characterisation.** If all `x_r=x₁`, every tail coordinate is 0 and the first remains `i_ω(x₁)+y`.

*Needs:* §5.2; §5.3; §2.6.

### 5.5 Triangular change on represented points

For any scheme `S`, any group object A of `Over S`, any test object `T : Over S`, and `n≥0`, there is a natural equivalence of `(n+1)-tuples` of T-valued points of A: `R(q)₀=q₀`, `R(q)_r=q_r q₀⁻¹` for `r≠0`. Its inverse sends r to `(r₀,r₁r₀,…,r_nr₀)`. Multiplicative notation is Mathlib’s notation for group objects; on the Jacobian it means subtraction and addition. The construction uses actual morphisms `T→A`, not an abstract point-set replacement for A. ([Yuan](https://arxiv.org/pdf/2108.05625v4), proof of Theorem 4.17(5) p. 98.)

Here `S` is a scheme, A is a group object in `Over S`, `T` is an object of `Over S`, n is a natural number. Commutativity is not needed for this equivalence.

Define the two coordinate operations on the native `Hom` group. Use group cancellation to check both inverse composites. Precomposition preserves products and inverses, so the equivalence is natural in every test scheme.

Represent the same coordinate change on the actual fibre power `A^{n+1}_S`. Its forward morphism has first projection `p₀` and remaining projections `p_r p₀⁻¹`; its inverse has first projection `p₀` and remaining projections `p_r p₀`. Assemble both maps with the product universal property. Composition with each projection reduces both inverse identities to group cancellation, and the product extensionality theorem gives their equality with the identity S-morphism. This argument also works for a noncommutative group scheme; the right-hand position of `p₀` in the inverse is essential.

Use Mathlib's `CategoryTheory.Limits.piObj`, `Pi.π`, `Pi.lift` and `Pi.hom_ext`
for these fibre powers and morphisms. The induced forward and inverse maps on
`Hom(T,A^{n+1}_S)` are the coordinate operations above. A fibre power in `Over S`
retains the common structure morphism to S.

For arbitrary `S′→S`, let F denote pullback and C the canonical finite-product
comparison `PreservesProduct.iso`. The entire triangular isomorphism satisfies
`F(R)≫C=C≫R′`. Taking inverses gives `C⁻¹≫F(R⁻¹)=R′⁻¹≫C⁻¹`.
Thus both coordinate changes commute with arbitrary base extension, including
nonreduced bases. This uses the product universal property, group cancellation
and uniqueness of the inverse, without commutativity. ([Yuan](https://arxiv.org/pdf/2108.05625v4),
proof of Theorem 4.17(5), p. 98, for the Jacobian coordinate change.)

**Checks.**

- For `n=0` the equivalence and the scheme isomorphism are identity on the one-factor fibre power.
- The inverse sends the actual T-valued pair `(f,g/f)` to `(f,g)`.
- The small diagonal sends f to f in the head and the identity in every tail.
- For noncommuting actual T-valued points a,b, the inverse sends `(a,b)` to `(a,ba)`,
  which differs from `(a,ab)`. For `GL₂` over `F₂`, take a with rows `(1,1),(0,1)`
  and b with rows `(1,0),(1,1)`. Then ab has rows `(0,1),(1,1)` and ba has rows
  `(1,1),(1,0)`. Projection to the second factor detects the distinction, so the
  inverse must restore the head on the right.

*Needs:* Mathlib `CategoryTheory.Hom.group`, `CategoryTheory.GrpObj.comp_div`, `piObj`, `Pi.lift`, `Pi.hom_ext`, `PreservesProduct.iso`.

### 5.6 Shifted-power factorization

Let `B_m(x₁,…,x_m,y)=(i_ω(x₁)+y,…,i_ω(x_m)+y)`. After the triangular change `R` on `J^m`, `R∘B_m=D∘τ_m`, where `D` fixes the first coordinate and multiplies each tail by `2g−2`. This equality holds as S-morphisms; `D` is a finite locally free isogeny for `g>1`. ([Yuan](https://arxiv.org/pdf/2108.05625v4), proof of Theorem 4.17(5) p. 98.)

Assume `g>1`; in the fibre-power assertions `m≥1`.

Evaluate the triangular map on every test scheme. Subtract the common first coordinate: `i_ω(x_r)−i_ω(x₁)=(2g−2)j(x₁,x_r)`. Apply the nonzero multiplication theorem to the tail factors. Do not identify `τ_m` itself with the tuple of all shifted canonical Abel coordinates.

For any group object A in `Over S` and `c:X→A`, define the shifted power on
`X^{n+1}_S×_S A` by the coordinates `c(x_i)·y`. For `e∈ℤ`, define tail
multiplication on `A^{n+1}_S` by fixing coordinate zero and taking the e-th power
of every tail. These maps commute with arbitrary base change through the same
product comparisons as in §5.4. In the Jacobian application A is commutative,
`c=i_ω`, `d=j` and `e=2g−2`. The difference identity is
`(p₂∘c)/(p₁∘c)=d^e` in Mathlib's multiplicative notation. Projection to the head
preserves `c(x₁)+y`; projection to each tail cancels y and applies that difference
identity. This proves the factorization with its positive tail scaling.
([Yuan](https://arxiv.org/pdf/2108.05625v4), proof of Theorem 4.17(5), p. 98.)

The product transfer must identify the schemes and their morphisms. Separate the
head to obtain `H:A^{n+1}_S≅A×_S A^n_S`. Its forward map sends `(a₀,…,a_n)` to
`(a₀,(a₁,…,a_n))`; its inverse reassembles that tuple in order. Projection to the
head after H is original coordinate zero, and tail coordinate i is original
coordinate `i+1`. Then `D≫H=H≫(id_A×[e]^n)` as S-morphisms. Product stability
and invariance under isomorphism transfer finiteness, flatness, local finite
presentation and surjectivity of `[e]` to D. Finite locally free multiplication
on the Jacobian supplies these hypotheses for `e=2g−2≠0`, including when the
characteristic divides e.

For commutative A, the represented-point map on `(Hom_S(T,A))^{n+1}` is a group
homomorphism, fixing the head and powering every tail. The scheme morphism D
represents this homomorphism. The homomorphisms commute with precomposition
`T′→T`; transporting D through the canonical finite-product comparison for
`S′→S` gives the same map on `A_{S′}`. These statements include nonreduced
schemes. Without commutativity, powering need not preserve multiplication,
although the coordinate map still exists.

**Checks for the shifted canonical power.**

- For `n=0` its single coordinate is `c(x)·y`.
- At identity translation the output is the tuple `c(x_i)`.
- A constant source tuple x gives the constant output tuple `c(x)·y`.

**Checks for tail multiplication.**

- For `n=0` D is identity for every integer e, since the tail is terminal over S.
- On `(a,b)` D gives `(a,b^e)`; the head stays unscaled. At `e=2` the tail is `b²`.
- For `e=1` D is identity on every factor.
- For `e=−1` D fixes the head and inverts every tail. It is an isomorphism,
  hence finite, flat, locally finitely presented and surjective, even for a
  noncommutative group scheme such as `GL₂`.
- For `e=0` D preserves the head and kills every tail. For positive-dimensional A
  and a nonempty tail it is not an isogeny.
- In characteristic dividing `2g−2`, the geometric D is finite but need not be étale.

**Checks for the product decomposition.**

- H sends a singleton `(a)` to `(a,())` with its terminal empty tail.
- H sends `(a,b)` to `(a,(b))`, preserving the order and doing no scaling.
- Its inverse sends `(a,(b))` to `(a,b)` on every test scheme.

*Needs:* §5.5; §5.4; §2.2; AbelianSchemesAndArithmeticModuli A3.2 (`multiplicationAndDensity`).

### Examples

For `m=1`, the shifted Faltings–Zhang map is its single canonical-shift coordinate. For `m=2`, its tail is `j(x₁,x₂)`, with no `2g−2` factor. The triangular change on the full shifted canonical power introduces that factor only through `D`. A one-factor triangular change is identity, and an empty tail makes `D` identity for every integer exponent. The represented-point checks include `e=−1`, 0 and 1; `e=0` collapses a nonempty tail. The two-factor inverse restores `(f,g/f)` to `(f,g)`, fixing the right-hand multiplication order (§5.2–§5.6).

### Dependencies

Layer 2 supplies the degree-d Abel map and curve difference; Layers 1 and 3 supply their base-change comparisons and canonical normalization. AbelianSchemesAndArithmeticModuli A1.1 supplies relative products and A3.2 finite locally free multiplication by nonzero integers. Mathlib’s group objects and finite products give the coordinate constructions. The factorization uses the explicit canonical-Abel difference identity before transferring properties of multiplication to tail powers.

## Layer 6: Stable Hodge bundles and determinant lines

Use the stable-family hypotheses of the conventions. NeronModelsAndSemistableAbelianVarieties §4.13 (`StableFamilyPicard`) supplies the semi-abelian Picard identity component `G`. StableReduction Layer 2 supplies the nodal Gorenstein dualizing sheaf and coherent-curve base change, and SchemeAndStackFoundations §3.8 the invariant differentials of a group scheme over `S`. The infinitesimal Picard calculation identifies `Lie(G/S)` with `R¹π_*O_X`. Dualizing it identifies the curve Hodge bundle with invariant differentials at the identity of `G`.

Both sheaves have rank `g`. Apply the determinant functor and its coherent pullback comparisons from AlgebraicVectorBundles L0C to the actual rank-g comparison isomorphism. A determinant-line comparison without that specified vector-bundle map would lose its canonicity. The semi-abelian degeneration is allowed: properness of `G` is not a hypothesis.

### 6.1 Picard Lie algebra and coherent cohomology

For an integral noetherian `S` and a stable genus-g>1 family `π:X→S`, let `G=Pic⁰_{X/S}` be the smooth separated semi-abelian group scheme of NeronModelsAndSemistableAbelianVarieties §4.13. There is a canonical `O_S`-linear isomorphism `Lie(G/S)≅R¹π_*O_X`, compatible with base change. ([Kleiman](https://arxiv.org/pdf/math/0504020v1), Theorem 5.11 and proof, pp. 42–44, and its relative version, Remark 5.12, p. 44; [Yuan](https://arxiv.org/pdf/2108.05625v4), Lemma 3.4 proof p. 44.)

Here `S` is integral and noetherian; `π:X→S` is a proper flat finitely presented stable connected nodal curve of constant arithmetic genus `g>1`. `G=Pic⁰_{X/S}` is the smooth separated semi-abelian generalized Jacobian, and the relative-duality/base-change isomorphisms of Layer 6 are fixed.

Verify `O_S≅π_*O_X` universally for the stable geometrically connected reduced fibres. On an affine test open U⊆S put `U_ε=Spec_U(O_U[ε]/ε²)`. The split sequence of units on `X_{U_ε}`, with kernel `1+εO_{X_U}≅O_{X_U}`, identifies the kernel of `Pic(X_{U_ε})→Pic(X_U)` with `H¹(X_U,O_{X_U})`. Sheafify this comparison over `U` and pass to the relative Picard sheaf; base classes are removed and the result is `R¹π_*O_X`. Multiplication of units adds `ε-coefficients`, and `ε↦aε` gives scalar multiplication by `a∈O_U`, so the identification is `O_U`-linear. The infinitesimal kernel is supported at the identity and hence belongs to the open `G`, even if the whole Picard object is an algebraic space. Gluing gives the Lie isomorphism of Kleiman Remark 5.12. Its construction is natural under pullback, and StableReduction Layer 2's coherent base-change comparison identifies the pulled-back `R¹` with that of the new family. The field deformation theorem alone is not used as a relative sheaf comparison.

**Checks.**

- An irreducible one-node fibre has the Lie algebra of its semi-abelian generalized Jacobian, not of an abelian scheme.

*Needs:* NeronModelsAndSemistableAbelianVarieties §4.13 (`StableFamilyPicard`); AlgebraicModuliForArithmeticGeometry §7.3 (`picard_infinitesimal_lifting`); JacobianChallenge, Layer C; StableReduction, Layer 2; StableReduction, Layer 3; Tau Ceti `Scheme.Modules.Cohomology`.

### 6.2 Curve and Jacobian Hodge bundles

Under the hypotheses of the Picard Lie comparison, relative duality gives `π_*ω_{X/S}≅e^*Ω¹_{G/S}`. Both are locally free of rank `g` and commute with the allowed base changes; the right side uses invariant differentials of the semi-abelian `G`. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Lemma 3.4 and proof pp. 43–44.)

Here `S` is integral and noetherian; `π:X→S` is a proper flat finitely presented stable connected nodal curve of constant arithmetic genus `g>1`. `G=Pic⁰_{X/S}` is the smooth separated semi-abelian generalized Jacobian, and the relative-duality/base-change isomorphisms of Layer 6 are fixed.

Dualize the Lie/cohomology isomorphism. Apply relative Serre duality for the stable Gorenstein curve (StableReduction Layer 2; SchemeAndStackFoundations §2.20) to identify `(R¹π_*O_X)∨` with `π_*ω_{X/S}`. Identify the dual Lie sheaf with invariant differentials at e (SchemeAndStackFoundations §3.8, `invariant_differentials`).

*Needs:* §6.1; JacobianChallenge, Layer C; NeronModelsAndSemistableAbelianVarieties §4.13 (`StableFamilyPicard`); StableReduction, Layer 2; SchemeAndStackFoundations §2.20; SchemeAndStackFoundations §3.8 (`invariant_differentials`); AlgebraicVectorBundles, L0B.

### 6.3 Curve–Jacobian Hodge line isomorphism

For the same stable family, the Hodge line `λ_H(X/S):=det(π_*ω_{X/S})` is canonically isomorphic to `det(e^*Ω¹_{G/S})`; the isomorphism is the determinant of the vector-bundle comparison and is compatible with its base-change isomorphisms. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Lemma 3.4 and proof pp. 43–44.)

Here `S` is integral and noetherian; `π:X→S` is a proper flat finitely presented stable connected nodal curve of constant arithmetic genus `g>1`. `G=Pic⁰_{X/S}` is the smooth separated semi-abelian generalized Jacobian, and the relative-duality/base-change isomorphisms of Layer 6 are fixed.

Take the determinant of the identified rank-g locally free sheaves. Use functoriality of determinant on the actual comparison map. Keep the analytic metric equality outside this algebraic roadmap.

**Checks.**

- For a smooth fibre this recovers the abelian Jacobian Hodge line. For a one-nodal stable fibre `G` is semi-abelian and the determinant still has rank-g input.

Pulling back the determinant isomorphism agrees with taking the determinant after pulling back the rank-g isomorphism.

*Needs:* §6.2; AlgebraicVectorBundles, L0C.

### Examples

A smooth fibre recovers the usual abelian Jacobian Hodge bundle. For an irreducible one-nodal fibre, the generalized Jacobian has a torus and the invariant-differential comparison still has rank equal to arithmetic genus. For a compact-type reducible fibre, the toric rank is zero and the Hodge comparison is still the prescribed rank-g comparison before taking determinants. These cases test why this layer uses the semi-abelian carrier (§6.1–§6.3).

### Dependencies

NeronModelsAndSemistableAbelianVarieties §4.13 supplies the smooth separated semi-abelian Picard identity component. JacobianChallenge Layer C, StableReduction Layers 2–3 and SchemeAndStackFoundations §2.20 supply nodal coherent cohomology, stable families, Gorenstein duality and base change; SchemeAndStackFoundations §3.8 supplies invariant differentials. AlgebraicVectorBundles L0B–L0C supply finite locally free duals and determinants. Tau Ceti's module-sheaf cohomology supplies the cohomological vocabulary. The rank-g comparison precedes its determinant. AbelianSchemesAndArithmeticModuli A6.38's Hodge line bundle of an abelian scheme is the smooth-fibre case of the right-hand side of §6.3.

## Layer 7: Curve families with full symplectic level

This layer records the form in which the moduli of curves with level consume Layers 0–5. Fix `g ≥ 2`, `ℓ ≥ 3` and `ζ_ℓ`, and let `M` be a noetherian `ℤ[1/ℓ, ζ_ℓ]-scheme` with a smooth projective curve `C → M` of genus `g`, geometrically connected fibres, and a full symplectic `level-ℓ` structure `α` on `J(C/M)` in the sense of the conventions (AbelianSchemesAndArithmeticModuli A3.8 `FullLevel`, with the Weil pairing of A3.7 equal to the standard form through `ζ_ℓ`). The motivating instance is the universal curve over the fine moduli scheme `M_g[ℓ]` of smooth curves with full symplectic level; StableReductionPartII constructs that scheme from Layer 1's Jacobian and then applies this layer to it, so the dependency runs from this roadmap to that one and never back. The rational characteristic-zero instance in Dimitrov–Gao–Habegger is a specialization.

Apply Layers 0–3 on the noetherian base `M`, then pull back to arbitrary `S → M`. This order permits arbitrary non-noetherian pullbacks while keeping the noetherian scope of the family theorems. Every Faltings–Zhang coordinate is inherited from Layer 5; a field point is needed only for the pointed fibre specialization.

### 7.1 Jacobian of a curve family with full level

For `(C/M, α)` as above, Layers 0–3 give `Pic_{C/M} = ⨆_d Picᵈ_{C/M}`, the principally polarized `J(C/M)` and the section-free morphism `C → Pic¹_{C/M}`; `α` is a full symplectic `level-ℓ` structure on `(J(C/M), λ_C)`, and for every `S → M` its pullback is one on `(J(C_S/S), λ_{C_S})` under the comparisons of §1.3 and §1.4. ([Dimitrov–Gao–Habegger](https://arxiv.org/pdf/2001.10276v3), §6.1 pp. 23–24, universal relative Jacobian and equation (6.1).)

Read the level datum as an identification of the `ℓ-torsion` of the curve Jacobian with the standard paired group. The pairing condition is preserved by pullback because the Weil pairing of A3.7 and the polarization of §1.4 commute with base change (`FullLevel.baseChange`). For `ℓ` not invertible on `M` the étale level structure is not defined, and nothing is asserted.

**Checks.**

- The family is any `(C/M, α)` with the stated pairing; the universal curve over `M_g[ℓ]` is the instance consumed downstream, not a hypothesis of the theorem. For `ℓ` noninvertible this étale full-level application is not asserted.
- A full level without the pairing condition (A3.8's plain `FullLevel`, `a GL_{2g}(ℤ/ℓ)-torsor`) and the similitude version that forgets `ζ_ℓ` are different data; with `ℓ = 3` and `g = 1`, an elliptic curve over an algebraically closed field of characteristic not 3 has 48 full level-3 structures but only 24 with Weil pairing equal to a fixed `ζ₃`.

*Needs:* §1.2; §1.3; §1.4; §2.1; AbelianSchemesAndArithmeticModuli A3.7 (`polarizedWeilPairing`); AbelianSchemesAndArithmeticModuli A3.8 (`FullLevel`, `FullLevel.weilPairing`, `FullLevel.baseChange`).

### 7.2 Faltings–Zhang for a curve family with full level

For every `S → M` and `m ≥ 1`, base change `C` and `J(C/M)` to `S`. `FZ_m` : `C_S^{m+1} → J_S^m` is a morphism over `S`, proper, and equal to the pullback of `FZ_m` over `M` under the fibre-power comparisons. On a field fibre with `P₀ ∈ C(k)`, fixing the first coordinate gives the m-fold pointed Abel embedding `C − P₀`. ([Dimitrov–Gao–Habegger](https://arxiv.org/pdf/2001.10276v3), §6.1 equation (6.3) and base change equation (6.5) p. 25.)

Here `g ≥ 2`, `ℓ ≥ 3` is invertible on `M`, `M` is a noetherian `ℤ[1/ℓ, ζ_ℓ]-scheme` carrying `(C/M, α)` as above, `S → M` is arbitrary and `m ≥ 1`; `S` need not be noetherian.

Use the arbitrary-base-change comparisons of §1.3 and of the Faltings–Zhang base-change comparison (§5.3). Apply the coordinate formula with the chosen field point only in the fibre specialization.

*Needs:* §7.1; §5.3; §1.3.

### Examples

On a field fibre with a specified `P₀`, fixing the first coordinate of `FZ_m` gives the tuple of pointed Abel images relative to `P₀`. Before `P₀` is chosen, the section-free universal difference already exists. Pulling the family back to a non-noetherian or nonreduced `S` uses the base-change comparisons already constructed. A non-invertible level, or a similitude datum with a varying pairing component, fails the hypotheses (§7.1–§7.2).

### Dependencies

Layers 0–3 supply the section-free principally polarized relative Jacobian; Layer 5 supplies Faltings–Zhang and its base change. AbelianSchemesAndArithmeticModuli A3.7–A3.8 supply Weil pairings and full level structures. No curve moduli space is used; the fine moduli scheme with level is a downstream instance.

## Worked examples

A genus-one torsor without a rational point still has its canonical map `C → Pic¹_C`. A pointed genus-one curve identifies its Jacobian with the elliptic curve and `j(x, y)` with `y − x`; changing the sign of one difference breaks the triangle relation. An actual degree-zero bundle produces a constant degree-zero Abel map, so the finiteness theorem keeps `d ≠ 0`. Characteristic-p multiplication can be inseparable while remaining finite.

On the elliptic Jacobian the positive canonical `Θ` has degree two, whereas `Δ^*P` has degree `−2`. Twisting `P` by a nontrivial bundle from `S` fails its axis normalization. An arbitrary translated theta divisor is not symmetric: the doubling formula keeps both `θ` and its inverse pullback. The identities hold after dual-number base change as morphism or rigidified-bundle identities, not merely on the underlying geometric fibre.

A class pulled back from `S` stays in the actual Picard subgroups and disappears only in the separately stated quotient comparison. In a square `C × C`, a positive-degree pullback from one factor fails the other projection's algebraic-triviality condition. A nontrivial degree-zero class pulled back from one factor lies in `Pic⁰⁰` but fails an axis-normalized condition. These examples distinguish the three Picard notions of Layer 4.

For `m = 1` the shifted Faltings–Zhang map has only its canonical-shift coordinate. For `m = 2` its tail is `x₂ − x₁` without a factor `2g − 2`. Applying triangular coordinates to the tuple of all shifted canonical Abel images introduces that factor only in the tail isogeny `D`. The coordinate change and its inverse commute with precomposition by actual test-scheme morphisms.

In a stable family, invariant differentials use the semi-abelian generalized Jacobian and the rank equals the arithmetic genus. The Hodge-line comparison is the determinant of the prescribed rank-g comparison. In the level application the root of unity, the Weil pairing and the component stay fixed under pullback; the similitude functor obtained by forgetting the root is a different moduli problem.

## Downstream consumers

- *ModularCurvesPartII* §13.1: the export to `modularJacobian`, `modularJacobian_thetaSpecialization` and `modularJacobian_baseChange` is the positive-genus instance of §§1.2–1.4, including arbitrary base change. Norm, divisor-class and modular comparisons belong to that consumer. *ArithmeticStatisticsPartVIII*: the export to `hyperellipticJacobian n` is the same instance for its smooth projective pointed hyperelliptic family when `g>0`, with model comparisons belonging to that consumer. Both genus-zero contracts use the trivial principally polarized abelian scheme.
- *StableReductionPartII* (fine moduli of smooth curves with full symplectic level): defines curve level structures through the Jacobian of §1.2 with its polarization §1.4 and base change §1.3, constructs the fine moduli scheme `M_g[ℓ]` and its universal curve, and applies Layer 7 to it.
- *AbelianSchemesAndArithmeticModuliPartII* (Betti maps and nondegeneracy): uses the curve difference of §2.6 and the Faltings–Zhang morphism of a curve family with level (§7.2) in the nondegeneracy of universal-curve difference images.
- *AbelianVarietiesIsogenousToNoJacobian*: uses the relative Jacobian §1.2 and the principal polarization §1.4 for the Torelli locus.
- The arithmetic roadmaps on heights and on uniform bounds for rational points (Yuan's adelic line bundles on `J` and on `X ×_S X`, Dimitrov–Gao–Habegger's height inequalities) consume Layers 2–5: the Abel maps, the canonical twice-theta bundle, the torsion-cokernel theorems that make admissible adelic extensions exist, and the shifted Faltings–Zhang morphisms.

The generic construction of Layers 0–5 uses no curve moduli space; Layer 6 compares stable-family Hodge objects using the existing nodal, Néron and vector-bundle suppliers.

## References

- Xinyi Yuan, [*Arithmetic bigness and a uniform Bogomolov-type result*, arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4), 125 pages; printed page numbers equal PDF page numbers. Locators used: §2.2.1, Definition 2.4, Proposition 2.6 and its proof, pp. 29–32; Theorem 2.10 and its proof, pp. 37–39; Lemma 3.4 and its proof, pp. 43–44; §4.6.2 and Theorem 4.17 with its proof, pp. 96–98; §A.3, p. 108; §A.4, Theorem A.3 and its proof, pp. 109–110. Published in Annals of Mathematics `203 (2026)`; the arXiv page numbers are not publisher page numbers.
- Vesselin Dimitrov, Ziyang Gao and Philipp Habegger, [*Uniformity in Mordell–Lang for curves*, arXiv:2001.10276v3](https://arxiv.org/pdf/2001.10276v3), §6.1, pp. 23–25, with equations (6.1), (6.3) and (6.5).
- Steven `L`. Kleiman, [*The Picard scheme*, arXiv:math/0504020v1](https://arxiv.org/pdf/math/0504020v1) (in *Fundamental Algebraic Geometry: Grothendieck's FGA Explained*, AMS 2005). Locators use the arXiv pagination: Remark 2.11, pp. 20–21; Definition 4.6 and Theorem 4.8 with its proof, pp. 27–29; Definition 5.9, p. 41, and Proposition 5.10, pp. 41–42; Theorem 5.11 and Remark 5.12, pp. 42–44; Remark 5.18, pp. 45–46; Propositions 5.19–5.20, pp. 47–48; Exercise 5.23, p. 50; Remark 5.26, p. 51.
- Eduardo Esteves, Mathieu Gagné and Steven `L`. Kleiman, [*Autoduality of the compactified Jacobian*, arXiv:math/9911071](https://arxiv.org/pdf/math/9911071), Theorem (2.1), pp. 4–6; Proposition (2.2) and proof, pp. 6–7; Proposition (3.7), pp. 15–16; proof (4.1), p. 16. Only the smooth-curve family specialization is consumed, not the singular compactified Jacobian construction. Locators use the arXiv pagination; the published theorem starts on p. 595 in Journal of the London Mathematical Society `65 (2002)`, 591–610.
- Finn Knudsen and David Mumford, [*The projectivity of the moduli space of stable curves, I: Preliminaries on “det” and “Div”*](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976b--DetDiv%2BKnudsenSequel-GT.pdf), Chapter I, Definition 1, pp. 23–24, Theorem 1, p. 25: the coherent determinant functor.
- `J`. `S`. Milne, [*Jacobian Varieties*, notes](https://www.jmilne.org/math/xnotes/JVs.pdf), §8, Theorem 8.1 and the following discussion, pp. 27–28.
- The Stacks Project: [Lemma 32.10.2 (01ZR)](https://stacks.math.columbia.edu/tag/01ZR), [Lemma 35.23.21 (02L6)](https://stacks.math.columbia.edu/tag/02L6), [Lemma 35.23.25 (02LA)](https://stacks.math.columbia.edu/tag/02LA), [Lemma 36.30.4 (0B91)](https://stacks.math.columbia.edu/tag/0B91), [Lemma 41.7.2 (04XV)](https://stacks.math.columbia.edu/tag/04XV).
