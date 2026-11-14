# Roadmap: logic, definability, valued fields and motivic integration

**Summary.** Build the logical interfaces that turn arithmetic descriptions into transferable statements, integrals and counting estimates. Starting from native first-order semantics, valuation rings, polynomial functions and computability, construct quotient interpretations, valued-field elimination, local and motivic integration, and the full MRDP theorem. Develop analytic and exponential o-minimal geometry through Pila–Wilkie and bounded-degree counting, using the supplied semirational block theorem. The arithmetic endpoints include a universal definition of the integers in the rationals and the reduction of André–Oort for A_g, and of its Hodge-theoretic and mixed relatives, to explicitly stated functional-transcendence and Galois-orbit inputs.

## Scope and ownership

This roadmap owns definable quotient presentations and their semantic translation; the Denef–Pas adapters; definable local integration and its motivic lift; the polynomial syntax comparison, effective computation encoding and Diophantine definability results; general analytic/exponential definability and counting; and the Pila–Zannier reductions of Layer 7, which turn counting into special-subvariety and finiteness statements. The geometric and arithmetic inputs of those reductions are hypotheses of the Layer 7 theorems, with their exact content; this roadmap does not construct Shimura varieties, period domains or CM theory a second time.

The following are prerequisites and boundaries. The general theory of o-minimal structures (definable sets and maps, monotonicity, continuous cell decomposition, uniform finiteness, definable dimension with its union, image, product, fibre and frontier laws, definable choice and curve selection, for every o-minimal structure) belongs to ShimuraVarieties §§3.4b–3.4e, earlier than both this roadmap and the block theorem it consumes; §§6.4–6.5 here add connected components with their uniform family bound and definable path-connectedness. The general Pila–Wilkie parametrization and determinant machinery belongs to the parameter-uniform block decomposition of AbelianSchemesAndArithmeticModuliPartII B2.6; this roadmap proves its rational and bounded-degree counting corollaries.

- **TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero** §6.2, **TauCetiRoadmap.WeilConjectures** §5.29, “Curve RH from the surface bound”, **TauCetiRoadmap.Chebotarev** Layer 14 and **TauCetiRoadmap.ClassFieldTheory** Layers 5, 10–13 own the compactification, curve estimate, auxiliary-prime existence and reciprocity inputs used by §4.29.
- **TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII** B2.6, B2.7, B2.14, B2.15 and B2.18 own semirational block counting with its parameter-uniform decomposition, free matrix word growth, the invariant Ax-type torus theorem, abelian Ax–Lindemann and invariant algebraic subvarieties. Sections 6.14 and 6.15–6.16 here add rational, integral, image-block and bounded-degree corollaries; the abelian group-action results are consumed from that roadmap.
- **TauCetiRoadmap.AdelicAlgebraicGroups** §2.4 owns gauge Haar measures and Weil volumes for characteristic-zero smooth affine groups. Sections 2.7 and 2.9 here extend the constructions to arbitrary analytic manifolds with tensor forms and arbitrary smooth finite-type models.
- Mathlib owns first-order languages, formulas, structures, realization, definability, compactness and ultraproducts. Use its native syntax throughout. A finite tagged encoding of several sorts is an adapter to that syntax.
- Mathlib owns `Poly`, `Dioph`, `Dioph.DiophFn`, Pell-based Diophantine exponentiation, `REPred` and the halting obstruction. This roadmap builds the comparison of `Poly` with integer polynomial syntax and the full computation-to-polynomial argument (§§4.1–4.15).
- Tau Ceti's `TauCeti/RingTheory/GrothendieckRing.lean` owns general ring completion of a semiring, including `Algebra.GrothendieckAddGroup.instCommRing`, `Algebra.GrothendieckAddGroup.ofRingHom` and `Algebra.GrothendieckAddGroup.liftRingHom`. The additional target is the residue-definable scissor semiring and its particular functorial maps.
- **TauCetiRoadmap.RealAlgebraicGeometry**, from [Layer 3: sign determination and semialgebraic descriptions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/RealAlgebraicGeometry/README.md#layer-3-sign-determination-and-semialgebraic-descriptions) through [Layer 6: CAD and quantifier elimination](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/RealAlgebraicGeometry/README.md#layer-6-cad-and-quantifier-elimination), owns semialgebraic syntax, CAD, projection closure and the semialgebraic/ordered-field-definability dictionary over ℝ. Its elimination theorem is over ℝ; it does not supply elimination over every real closed field. This supplies the semialgebraic o-minimal reduct used here. Its exports in Tau Ceti include projection closure over ℝ, the instance of `TauCeti.HasSemialgebraicProjections` on ℝ (Tarski–Seidenberg, TauCeti/Geometry/RealAlgebraic/CAD/Existence.lean), and the dictionary `TauCeti.isSemialgebraic_iff_definable_real`. General o-minimal structures and their dimension theory are ShimuraVarieties §§3.4b–3.4e; the analytic/exponential theorems, connected components and definable paths belong here.
- **TauCetiRoadmap.DifferentialGeometry**, [“Boundary and corners”](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DifferentialGeometry/README.md#boundary-and-corners), owns the manifold-with-corners substrate used for finite definable atlases in §6.6. The local-field analytic integration of Layer 2 is a separate theory over a nonarchimedean field, with its own inverse/substitution and measure-gluing targets.
- **TauCetiRoadmap.QuadraticFormInvariants**, Layer 2 (quaternion algebras, reduced norm and trace) and §6C items 9–12 (the closed Hilbert symbol in odd residue characteristic, the closed formula and the 8×8 table over ℚ₂), and **TauCetiRoadmap.GlobalQuadraticForms**, §§4.2–4.3 (the global square theorem, the quadratic Hasse norm theorem), §4.4 through that roadmap's section and name map (Hilbert sign prescription), §5.5 (Hasse–Minkowski isotropy) and §6.1 (scalar representation at all finite and real places), own the quadratic-form theory used in Layer 4; vector weak approximation is Tau Ceti's `TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds`. This roadmap builds the definable trace images, the local trace ranges at division places and the prime-parameter formulas.
- Mathlib supplies schemes, affine opens, closed immersions, fibre products, smooth morphisms, finite-type presentations as quotients of polynomial rings and Kähler differentials with their exterior powers. **TauCetiRoadmap.SchemeAndStackFoundations** §0.7 supplies dimension theory of schemes of finite type over a field and §2.20 the identification of the relative dualising module of a smooth morphism with the top exterior power of its differentials. Global motivic integration on varieties uses closed embeddings of affine charts into affine space (§3.1).
- **TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties** supplies Néron models, isogeny functoriality (§2.5) and Grothendieck's pairing on component groups (§4.6). The point-count identity for the Néron models of dual abelian varieties over a local field with finite residue field, needed by the dual-volume comparison, is §2.10 here.
- **TauCetiRoadmap.MotivesAndAlgebraicCycles** §4.20 supplies K₀(Var_k), its compactly supported motivic measure χ^c into the triangulated Grothendieck ring of geometric motives and the image of 𝕃. The realization of the residue classes of Layer 3 in the localized target is §3.11 here; no equality of definable and geometric coefficient rings is assumed.
- **TauCetiRoadmap.DiophantineApproximationAndTranscendence** §§0.2–0.3 owns the Mahler and absolute-height comparisons and bounded-degree Northcott; Mathlib supplies rational height. Its Layer 5 functional-transcendence results (differential-exponential Ax–Schanuel, §5.6) are different statements from the abelian, Shimura and Hodge theorems that appear as Layer 7 hypotheses. **TauCetiRoadmap.HeightsRationalPointsAndObstructions** §2.20 supplies the Brauer pairing on zero-cycles of arbitrary degree; the effective zero-cycle theorem for normic bundles of Colliot-Thélène–Van Geel is §4.29 here. Its §§5.1, 5.6 and 5.8 own Manin–Mumford and its uniform family version, including torsion cosets of positive dimension.
- **TauCetiRoadmap.ShimuraVarieties** §§3.4b–3.4e own, for every o-minimal structure, o-minimal structures and definable maps with the `Set.Definable` bridge, monotonicity, continuous cell decomposition, uniform finiteness, definable dimension with its union, image, product, fibre and frontier laws and its agreement with `TauCeti.semialgebraicDim`, definable choice and curve selection; §3.5a owns the structure R_an,exp itself (its language of polynomial maps, restricted analytic functions and the exponential, with its structure on ℝ), its o-minimality with finite cell decomposition, definable dimension and the finite-atlas calculus in that structure; §3.5d owns the definable Chow theorem on smooth complex algebraic varieties; §3.6 owns the R_an,exp comparison between the arithmetic and the algebraic definable structures of a torsion-free arithmetic Hermitian quotient with fixed maximal compact, including the fact that R_an does not suffice at a cusp. This roadmap consumes §§3.4b–3.4e in §§6.1, 6.4–6.5, 6.8, 6.11 and 6.13, §3.5a in §§6.2, 6.3 and 6.6 and §3.5d in §§6.8–6.9, and keeps: the acceptance predicate `IsOMinimalExpansion`, connected components with their uniform family bound, definable path-connectedness, the reducts R_an and R_exp with the globally subanalytic description of R_an, analytic cells, definable atlases with corners over an arbitrary o-minimal expansion, singular ambient varieties and Boolean combinations.
- **TauCetiRoadmap.ComplexComparisonPartII** Layer C4 owns the classical Remmert–Stein extension theorem and Chow's theorem for complex analytic spaces; §§6.8–6.9 here are the definable forms, with no dimension hypothesis on the exceptional analytic set and no properness of the ambient variety.
- **TauCetiRoadmap.StratifiedSpacesAndTameTopology** §4.1 owns the triangulation theorem for o-minimal expansions of ordered fields and §7.1 the C^p cell decomposition of definable sets over ℝ; neither is used or restated here.
- Shimura-variety and Hodge-theoretic functional transcendence (special and weakly special subvarieties, definability of uniformizations on fundamental sets, hyperbolic and mixed Ax–Lindemann, Ax–Schanuel for variations of Hodge structure), the Galois-orbit and lift-height bounds for CM points are not proved here. Layer 7 states each of them, with its source, as a hypothesis of the theorems that use it.

## Conventions

Work with native `FirstOrder.Language` and native realization. Parameters are explicit finite tuples, and translating an interpretation retains their representatives. Definability always names its language, structure and parameter set. Interpretations use invariant graphs on definable quotients, without choosing definable representatives.

Compare valuations through their rings and actual ordered value groups. Only a specified discrete normalization uses `ord : K× → ℤ`. In a Denef–Pas formula an occurrence of `ord(f)` has a nonzero guard, or uses a stated totalization together with that guard. Angular components are chosen data. Write ℤ_(p) for the rational local ring and ℤ_p for its completion.

On a nonarchimedean local field F, normalize additive Haar measure by μ(O_F)=1, and let q=#k_F>1 and |π|=q⁻¹. Analytic statements (substitution, analytic manifolds, gauge forms) hold over every nonarchimedean local field; statements about arbitrary definable maps, cells and definable dimension are made only in characteristic-zero regimes: a fixed finite extension of ℚ_p, the fields K((t)) with char K=0, or fixed definable data above a residue-characteristic bound. Products use product Haar measure. A tensor r-gauge density, r>0, is |f|^(1/r). Intrinsic dimension is separate from ambient Haar dimension. Relative top forms use the determinant isomorphism in **base-first order**, π*η∧φ=ω. Signs disappear only after taking absolute values, not in the form identity.

For motivic integration fix a base field k of characteristic zero and the chosen coefficient presentation over k((t)). The coefficient ring is A=ℤ[L,L⁻¹,(1−L⁻ⁱ)⁻¹ : i>0]. Its evaluation parameter satisfies q>1. Definable subassignments are assignments on the declared field category; arbitrary field extensions need not preserve the truth of quantified formulas. Residue-field scissor objects, positive functions, signed functions and dimension-graded Functions are distinct objects. A direct image is additive and satisfies a projection formula; it is not generally a ring homomorphism.

Natural assignments and integer assignments remain separate. `Poly α` evaluates natural tuples in ℤ. Its comparison with `MvPolynomial α ℤ` retains signed coefficients. Finite witness compression fixes every input coordinate, even for infinite α. Computable reductions take explicit syntax and effective coefficient codes as input; a classically chosen inverse of an extensional polynomial map is not a syntax-extraction algorithm. General ring Diophantine sets use finite systems. A single sum-of-squares equation is justified over ℚ or ℤ, not over an arbitrary ring.

Fix one o-minimal expansion of the ordered real field at a time, allowing named real parameters. Restricted analytic symbols agree with their analytic representatives on the **closed** cube [−1,1]^n and are zero outside it. The real exponential is unrestricted. Finite definable atlases are mandatory. Charts map coordinate domains into the space; their mixed coordinate map is φ_j⁻¹∘φ_i.

The algebraic part X_alg is the union of connected positive-dimensional semialgebraic subsets of X, with real parameters. It is not asserted to be definable. Put dim∅=−∞, the value ⊥ of ShimuraVarieties §3.4d; use topological boundary for cl(X)∖int(X), Mathlib `frontier`. The frontier law of definable dimension (ShimuraVarieties §3.4d) separately uses the closure remainder cl(X)∖X. For a reduced rational a/b with b>0, H(a/b)=max(|a|,b), which is Mathlib's `Height.mulHeight₁` on ℚ (`Rat.mulHeight₁_eq_max`); tuple height is the maximum and H(())=1. An algebraic tuple's degree bound applies to each coordinate separately. Counting constants depend on the fixed family, degree bound and ε, never its varying parameter or T≥1.

## Exact supplier contracts

### From Mathlib

The APIs are those pinned by lake-manifest.json.

For logic use `FirstOrder.Language`, `FirstOrder.Language.Formula`, `FirstOrder.Language.ring`, `Set.Definable` and `FirstOrder.Language.BoundedFormula.IsExistential`. The last predicate is the native quantifier-free/existential fragment. `FirstOrder.Language.Ultraproduct.«structure»`, `FirstOrder.Language.Ultraproduct.realize_formula_cast` and `FirstOrder.Language.Ultraproduct.sentence_realize` give the structure and Łoś transfer on `Filter.Product`. Interpretations and their quotient invariance (§§0.1–0.2) and the existential-preservation/diagram theorem (§4.31) are targets here.

For valued fields use `ValuationSubring`, `ValuationSubring.ValueGroup` and `HenselianLocalRing`; for fraction presentations use `IsFractionRing`. The value group has zero in the native multiplicative presentation; any additive comparison is named explicitly.

For polynomial normal forms use `Poly.ext`, `Poly.proj`, `Poly.const`, `Poly.induction`, `Poly.map` and their evaluation rules, together with the native ring on `Poly`. Use `MvPolynomial.eval₂Hom`, `MvPolynomial.eval₂Hom_C`, `MvPolynomial.eval₂Hom_X'`, `MvPolynomial.induction_on`, `MvPolynomial.rename`, `MvPolynomial.rename_rename`, `MvPolynomial.eval_rename` and `MvPolynomial.exists_finset_rename`. `MvPolynomial.funext_set` requires an integral domain and infinite coordinate sets; use the image of ℕ in ℤ, with `Nat.cast_injective` and `Set.infinite_range_of_injective`. `Finset.toRight`, `Finset.mem_toRight`, `Fintype.equivFin`, `Function.extend` and `Function.Injective.extend_apply` give the finite witness enumeration without requiring finite inputs. `RingEquiv.ofBijective` supplies a classical inverse after bijectivity is proved.

`Dioph`, `Dioph.DiophFn` and `Dioph.pow_dioph` supply the existing Diophantine vocabulary and exponentiation. `REPred` uses the existing `Primcodable` encoding; `ComputablePred.halting_problem` supplies undecidability. `Nat.chineseRemainder`, `Nat.sum_four_squares` and `Nat.forall_exists_prime_gt_and_modEq` provide CRT, four squares and primes in coprime arithmetic progressions, with their actual hypotheses. None supplies the missing uniform native computation adapter by itself.

For charts use `AlgebraicGeometry.IsAffineOpen`, `AlgebraicGeometry.IsClosedImmersion`, fibre products of schemes, `AlgebraicGeometry.Smooth` and `AlgebraicGeometry.QuasiCompact`; a finitely generated algebra over a field is a quotient of a polynomial ring in finitely many variables (`Algebra.FiniteType.iff_quotient_mvPolynomial''`), which gives a closed embedding of every affine chart into affine space. An affine variety need not be an open subset of affine space, so closed embeddings, not open ones, are used to globalize integrals. Relative differentials are `KaehlerDifferential` with `ExteriorAlgebra.exteriorPower`. Haar measure on a local field and its products is `MeasureTheory.Measure.addHaar`, normalized by the measure of the ring of integers; countable gluing uses `MeasureTheory.Measure.sum` and `MeasureTheory.Measure.restrict`.

Use `FirstOrder.Language.presburger` and `FirstOrder.Language.presburger.definable_iff_isSemilinearSet` on ℕ, and `FirstOrder.Language.presburger.mul_not_definable` (Mathlib/ModelTheory/Arithmetic/Presburger/Definability.lean). The integer multiplication negative control restricts to nonnegative inputs before applying this native theorem. `FirstOrder.Ring.CompatibleRing` supplies the ring-language structures of `ax_kochen_ring` as instance binders; since `FirstOrder.Language.ring` has no relation symbols, every compatible structure equals the one `FirstOrder.Ring.compatibleRingOfRing` builds, so the theorem concerns the usual ring structures; `IsDiscreteValuationRing`, `Ideal.Quotient.mk` and `PowerSeries.mk` give the congruence-series carriers.

For heights use `Height.mulHeight₁`, `Rat.mulHeight₁_eq_max` and `NumberField.absMulHeight₁` in Mathlib/NumberTheory/Height/NumberField.lean (line 532 for the rational identity and line 136 for absolute height). The rational theorem identifies the native height with the maximum reduced numerator/denominator height; the absolute height has total value 1 on transcendental inputs, so bounded-degree counting also requires explicit algebraicity.

### From Tau Ceti

Use `TauCeti.IsSemialgebraic` from TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean: it is the Boolean algebra generated by polynomial zero and positivity sets; projection closure is a separate theorem, over ℝ the instance of `TauCeti.HasSemialgebraicProjections` in TauCeti/Geometry/RealAlgebraic/CAD/Existence.lean. `TauCeti.isSemialgebraic_iff_definable_real` (TauCeti/Geometry/RealAlgebraic/Semialgebraic/RingLanguage.lean) identifies semialgebraic sets with the sets definable with real parameters in the ordered field ℝ. `TauCeti.semialgebraicDim` (TauCeti/Geometry/RealAlgebraic/Semialgebraic/Dimension/Basic.lean) is the supremum of the d for which a set contains a nonempty subset homeomorphic to an open subset of ℝ^d, with value ⊥ on ∅. Use `Algebra.GrothendieckAddGroup.instCommRing`, `Algebra.GrothendieckAddGroup.ofRingHom` and `Algebra.GrothendieckAddGroup.liftRingHom` from TauCeti/RingTheory/GrothendieckRing.lean. Vector weak approximation is `TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds` (TauCeti/NumberTheory/NumberField/Global/Approximation/Vector.lean): for a finite-dimensional vector space over a number field, finitely many finite and real places and a neighbourhood of a local vector at each, one global vector localizes into every neighbourhood.

### From TauCetiRoadmap.SchemeAndStackFoundations

From [TauCetiRoadmap.SchemeAndStackFoundations, §0.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#07-local-dimension-and-dimension-theory-of-schemes-of-finite-type-over-a-field), use `dim O_{X,x}+trdeg κ(x)=dim_x X` and the dimension theory of schemes of finite type over a field; from [§2.20](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#220-relative-dualising-complexes-and-modules-serre-duality-curve-comparison), use the identification of the relative dualising module of a smooth morphism of relative dimension d with the d-th exterior power of its differentials. The analytic manifold structure on the F-points of a smooth F-variety uses the locally analytic inverse function theorem over a complete nonarchimedean field (Schneider, *p-Adic Lie Groups*, Proposition 6.4, p.42, and §7 for charts and atlases).

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

From [TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md), use Néron models, their identity components and component groups, isogeny functoriality ([§2.5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md#25-functoriality-under-isogeny)) and Grothendieck's pairing ([§4.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md#46-grothendiecks-pairing-on-component-groups)). The pairing is defined for general abelian varieties, but §4.6 proves perfectness only for semistable ones; the general prime-to-p extension and the point-count consequences are §2.10 here.

What NeronModelsAndSemistableAbelianVarieties must provide (gap:neron-pairing-perfect-finite-residue): §4.6 must prove that Grothendieck’s Galois-equivariant pairing on the geometric component groups of any abelian variety and its dual over a nonarchimedean local field with finite residue field is perfect, without a semistability hypothesis (Lorenzini, Proposition 4.3 and its preceding paragraph, p.2032).

### From TauCetiRoadmap.ReductiveGroupsPartII

Use RG2.3.7, Lang’s theorem: for every smooth geometrically connected group of finite type over a finite field k, H¹(k,G) is trivial, and exact sequences with such a kernel are surjective on k-points. Section 2.11 applies this to the connected Néron special fibres.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

From [TauCetiRoadmap.MotivesAndAlgebraicCycles, §4.20](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md#420-the-scissor-ring-and-motivic-measure), use `K₀Var k`, the ring structure on `TriangulatedK0` of the geometric motives `DM_gm(k,ℚ)` and the ring homomorphism χ^c:K₀Var k→TriangulatedK0(DM_gm(k,ℚ)), [X]↦[M^c(X)], with χ^c(𝕃)=[ℚ(1)]. That section inverts `1−𝕃^{−i}` only in a designated localized target; §3.11 here constructs that target and the realization of residue classes into it.

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

From [TauCetiRoadmap.HeightsRationalPointsAndObstructions, §2.20](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md#220-brauer-pairing-on-zero-cycles), use the Brauer evaluation of zero-cycles of arbitrary degree on smooth projective varieties over a number field and its orthogonality to global Brauer classes. The effective symmetric-power theorem for the normic bundles of Colliot-Thélène–Van Geel, with its Brauer-group computation and the finiteness of obstructed parameter classes, is §4.29 here.

### From TauCetiRoadmap.QuadraticFormInvariants

From [TauCetiRoadmap.QuadraticFormInvariants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md), use the quaternion algebra (a,b), its reduced norm and trace and the four-fold splitting criterion of Layer 2, and from §6C the Hilbert symbol with its closed formula in odd residue characteristic (item 9), the closed formula over ℚ₂ (item 10) and the 8×8 table on the basis {−1,2,5} of ℚ₂ˣ/ℚ₂ˣ² (item 12).

### From TauCetiRoadmap.GlobalQuadraticForms

From [TauCetiRoadmap.GlobalQuadraticForms](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalQuadraticForms/README.md), use the global square theorem (§4.2), the quadratic Hasse norm theorem at finite, real and complex places (§4.3), Hilbert sign prescription (§4.4, which that roadmap's section and name map sends to Tau Ceti's `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite`), Hasse–Minkowski isotropy (§5.5) and scalar representation at all finite and real places (§6.1). The rational norm-one witnesses of §4.20 come from §6.1 applied to the ternary form ⟨a,b,−ab⟩; the local trace ranges at division places, including the dyadic and real ones, are computed in §4.20.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

From [TauCetiRoadmap.DiophantineApproximationAndTranscendence](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md), use the comparison 2^(−d)H(x)≤H_abs(x)^d≤√(d+1)·H(x) between the coefficient height of the minimal polynomial and the absolute multiplicative height of an algebraic number of degree d ([§0.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md#02-mahler-measure-house-and-absolute-height)), and bounded-degree Northcott ([§0.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md#03-finiteness-and-size-estimates)), which is Tau Ceti's `TauCeti.finite_setOf_absMulHeight₁_le` (TauCeti/NumberTheory/Height/Absolute.lean): in a field of characteristic zero, the elements algebraic over ℚ whose minimal polynomial over ℚ has degree at most d and whose absolute multiplicative height is at most B form a finite set. Keep the degree fixed when converting coefficient height to absolute multiplicative height. In the native absolute-height convention, the total multiplicative definition takes value 1 outside the algebraic domain, while the logarithmic height takes value 0; every counting application is restricted to algebraic coordinates.

### From TauCetiRoadmap.ShimuraVarieties

From [TauCetiRoadmap.ShimuraVarieties, §3.4b](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34b-o-minimal-structures-and-definable-maps), use o-minimal structures on a linearly ordered set (definable sets of each `Fin n → R` with the five axioms there) and definable maps by their graphs, their Boolean, product, fibre, coordinate-map, first-order, closure and composition laws, the bridge `exists_oMinimalStructure_definable_iff` (a first-order structure on R in which the strict order is definable with parameters and every unary set definable with parameters is a finite union of points and open intervals has its `Set.Definable` sets as the definable sets of an o-minimal structure), and the inclusion of every semialgebraic set in an o-minimal structure containing the graphs of addition and multiplication. From [§3.4c](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34c-monotonicity-and-cell-decomposition), use monotonicity, cells with their dimension, continuous cell decomposition (I) of finitely many definable sets and (II) with a definable map continuous on the cells, and uniform finiteness, for a densely ordered R without endpoints with its order topology. From [§3.4d](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34d-definable-dimension), use definable dimension with values in `WithBot ℕ∞`, its independence of the decomposition, monotonicity, union, image, injective-image, product, fibre and frontier laws (dim(cl(A)∖A)<dim A for nonempty definable A) and, on ℝ, its equality with `TauCeti.semialgebraicDim`. From [§3.4e](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34e-definable-choice-and-curve-selection), use curve selection (a point in the closure of a definable set is the limit at 0⁺ of a continuous definable curve in the set), stated for an ordered abelian group with definable addition and so for every o-minimal expansion of the real field. From [§3.5a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#35a-the-o-minimal-structure-r_anexp), use R_an,exp (the real exponential and every restricted analytic function, zero outside the closed cube), its o-minimality, finite cell decomposition, definable dimension with its product, projection and fibre laws, and its finite-atlas calculus; from [§3.5d](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#35d-definable-chow), use the definable Chow theorem: a closed complex analytic subset of a smooth complex algebraic variety that is definable in an o-minimal expansion of R_an is algebraic. The comparison of the arithmetic and algebraic definable structures of a Hermitian arithmetic quotient is [§3.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#36-definable-comparison-with-the-algebraic-target) there and is not restated here.

### From TauCetiRoadmap.AdelicAlgebraicGroups

Use §2.4, “The Haar measure of a gauge form over a local field” and “Weil’s volume formula for integral points”, for characteristic-zero smooth affine groups and smooth affine group models. Sections 2.7 and 2.9 here extend to analytic manifolds with tensor densities and arbitrary smooth finite-type models, respectively.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII

Use B2.6 for parameter-uniform semirational block counting, including its block decomposition; B2.7 for free matrix word growth; B2.14 for invariant Ax-type subsets of real tori; B2.15 for the abelian Ax input and real-period adapter; and B2.18 for monodromy-invariant subvarieties. Sections 6.14 and 6.15–6.16 here give rational, integral-height, image-block and bounded-degree corollaries of B2.6. These supplied abelian results are not targets of this roadmap. The cell decomposition, definable dimension and definable choice that B2.6 uses for an arbitrary o-minimal expansion of the real field are ShimuraVarieties §§3.4c–3.4e, earlier than B2.6; nothing of this roadmap enters B2.6.

### From TauCetiRoadmap.RealAlgebraicGeometry

Use Layer 3 (sign conditions and semialgebraic descriptions) and Layer 6 (projection closure and quantifier elimination over ℝ) for the semialgebraic/ordered-field definability dictionary of §§6.2 and 6.11, with its Tau Ceti exports named above. The dimension used in §6.11 is Tau Ceti's `TauCeti.semialgebraicDim`, compared with o-minimal dimension in ShimuraVarieties §3.4d.

### From TauCetiRoadmap.DifferentialGeometry

Use “Boundary and corners” for the manifold-with-corners substrate; §6.6 adds finite definable atlas certificates.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

Use §6.2, the smooth projective compactification with strict normal-crossing boundary for smooth quasi-projective varieties over a characteristic-zero field, in the normic-bundle construction of §4.29.

### From TauCetiRoadmap.WeilConjectures

Use §5.29, “Curve RH from the surface bound”, including its all-conjugates reciprocal-root bound, for the point estimate on smooth projective curves over finite fields in §4.29.

### From TauCetiRoadmap.Chebotarev

Use Layer 14, natural-density Chebotarev and its finite-exception invariance: a nonempty conjugacy class in a finite Galois extension supplies infinitely many unramified primes with that Frobenius class, outside any finite excluded set. Section 4.29(d) applies this to choose the auxiliary primes a and b.

### From TauCetiRoadmap.ClassFieldTheory

Use Layers 5 and 10 for cyclic algebras, local Brauer invariants and their global sum, and Layers 11–13 for global reciprocity, class fields and norm conditions on the auxiliary primes in §4.29.

### Input hypotheses of Layer 7

The theorems of Layer 7 carry their geometric and arithmetic inputs as hypotheses, each a proposition about fixed objects, stated exactly in §§7.1, 7.5, 7.6–7.7 with the source that proves it: the André–Oort input datum for A_g (definability on Siegel sets, the structure of weakly special subvarieties, hyperbolic Ax–Lindemann, the Galois-orbit lower bound and the lift-height bound), the product-locus input for A₁×A₁, the Ax–Schanuel conclusion for a polarized variation of Hodge structure, and the mixed input datum of Gao. No Layer 7 theorem assumes its own conclusion: each uses Layer 6 counting to pass from its inputs to a finiteness or special-subvariety statement that the inputs do not contain. The reductions retain these hypotheses explicitly.

## How to read the build

Layer 0 fixes semantic transport. Layer 1 provides the languages and valuation interfaces used by Layer 2 local integration and Layer 3 motivic integration. Layer 4 is the separate computation and arithmetic-definability branch; it begins with polynomial comparison and finite witnesses. Layer 5 connects normalized local coefficients to arithmetic consumers while retaining the stated measure normalizations. Layer 6 builds real definability and counting: o-minimal geometry, definable complex algebraicity, rational, integral, image-block and bounded-degree counting and the orbit-counting bridge. Layer 7 combines Layer 6 with explicitly stated functional-transcendence and Galois-orbit inputs. The *Needs:* lines specify the build order; the local substitution theorem of §2.5 precedes its use in §2.4. The README is the mathematical specification; [Suggested.lean](Suggested.lean) contains only the definitions and milestones directly statable on the pinned carriers.

## Layer 0: interpretations and arithmetic transfer

Specify definable domains, kernels and symbol graphs before translating formulas. Semantic composition and fraction presentations test that equality and quantifier witnesses are transported correctly.

### 0.1 Interpretations on definable quotients

For languages L_A,L_B and nonempty native structures A,B, an interpretation I of B in A consists of a finite arity m, an A-parameter-definable D⊆A^m, a definable equivalence E on D, a bijection D/E≃B, and definable E-invariant pullbacks of every relation and function graph of L_B. Function graphs must be total on D and single valued modulo E. A finite tuple of parameters is part of the data. There is no definable choice of representatives requirement.

Use the existing definable-set predicate for D, the kernel and symbol graphs. Form the native setoid quotient and transport the B-structure along the supplied bijection. Translate terms by their graph formulas. Translate equality by E; relativize existential quantifiers to D and use kernel invariance for independence of representatives.

The basic interface must include:

- The finite-power domain and kernel are definable over the recorded parameters.
- Every L_B-formula has an E-invariant L_A-formula on representative tuples, with the same semantic truth value.
- For each source function and representative input there exists an output in D unique modulo E.
- Enlarging the named parameter tuple transports an interpretation without changing its quotient structure.

**Checks.**

- D=A, E=equality and identity symbol graphs recover the original native structure.
- For an integral domain R, pairs (a,b) with b≠0 and relation ad=bc interpret Frac(R); (1,2) and (2,4) have the same class when 2≠0.
- The graph assigning both 0 and 1 to one input over a two-element equality quotient fails the function uniqueness axiom.
- A definable ideal I gives R/I by a quotient; no definable transversal is required.

(Wilfrid Hodges, *Model Theory*, §5.3, interpretations and composition.)

*Needs:* Mathlib `FirstOrder.Language`; Mathlib `FirstOrder.Language.Formula`; Mathlib `Set.Definable`.

### 0.2 Semantics and composition of interpretations

An interpretation I:B in A gives, for every finite tuple of B-elements and any representatives in D, equivalence between realization of a B-formula and realization of its translated A-formula. Composing interpretations C in B and B in A gives C in A; its parameter tuple includes representatives of the inner parameters and its domain, kernel and symbol formulas are obtained by translation. Identity interpretations act as identities up to definable quotient isomorphism.

Induct over native formulas: equality uses E; symbol atoms use their defining graphs; Boolean operations are native; quantified witnesses range over D and quotient surjectivity supplies representatives. For composition flatten the two finite tuples, translate the inner domain and equivalence, and apply the first semantic equivalence twice. No elimination of imaginaries is assumed.

(Wilfrid Hodges, *Model Theory*, §5.3, interpretations and composition.)

*Needs:* [0.1 Interpretations on definable quotients](#01-interpretations-on-definable-quotients); Mathlib `FirstOrder.Language.Formula`.

### 0.3 Fraction fields as interpreted structures

For an integral domain R in the ring language, interpret its fraction field by D={(a,b)∈R²:b≠0}, equality (a,b)E(c,d) iff ad=bc, sum (ad+bc,bd), product (ac,bd), and integer constants (n,1). The quotient is canonically isomorphic to the native fraction field and the embedded copy of R has representatives (a,1).

Use the native fraction field universal property to identify the cross-multiplication quotient. The domain condition makes all displayed operations total, and cross multiplication proves compatibility and uniqueness modulo E.

The basic interface must include:

- The quotient is ring-isomorphic to Frac(R), sending [(a,b)] to a/b.
- Translated ring formulas agree with realization in the native fraction field.
- The interpretation of r∈R is the class of (r,1).
- A representative is legal exactly when its denominator is nonzero.

**Checks.**

- For R=ℤ the quotient is ℚ with the usual arithmetic.
- The pair (1,0) is excluded even though cross multiplication alone would not define a fraction.
- For R=ℤ, the class of (−1,2) plus that of (1,2) is zero; in a general domain the denominator requires 2≠0.
- When R is already a field, [(a,b)] corresponds to ab⁻¹ in R.

(Wilfrid Hodges, *Model Theory*, §5.3, interpretations and composition.)

*Needs:* [0.1 Interpretations on definable quotients](#01-interpretations-on-definable-quotients); [0.2 Semantics and composition of interpretations](#02-semantics-and-composition-of-interpretations); Mathlib `IsFractionRing`.

### 0.4 Explicit arithmetic semantics bridges

For every supplied interpretation of an arithmetic ring or field, translate its fixed formula together with its named parameter tuple and exhibit the representative-domain guards. The resulting realization statement is equivalent in the interpreted and ambient structures. In particular this gives the fraction-field bridge and any supplied residue-field quotient; it makes no assertion that ℤ is existentially definable in ℚ.

Instantiate the interpretation semantics theorem with the native ring language and the appropriate quotient isomorphism. Keep parameter representatives in the formula; any algorithmic transfer additionally needs an effective syntax translation, as in Layer 4.

(Wilfrid Hodges, *Model Theory*, §5.3, interpretations and composition.)

*Needs:* [0.2 Semantics and composition of interpretations](#02-semantics-and-composition-of-interpretations); [0.3 Fraction fields as interpreted structures](#03-fraction-fields-as-interpreted-structures).

### Examples

In the fraction interpretation of ℤ, (1,2) and (2,4) give the same rational, and (1,0) is outside the domain. Translating an existential assertion must quantify over legal pairs modulo cross multiplication.

### Dependencies

Mathlib `FirstOrder.Language`; Mathlib `FirstOrder.Language.Formula`; Mathlib `Set.Definable`; Mathlib `IsFractionRing`; Mathlib `FirstOrder.Language.Ultraproduct.realize_formula_cast`; Mathlib `FirstOrder.Language.Ultraproduct.sentence_realize`; Mathlib `FirstOrder.Language.Ultraproduct.«structure»`.

## Layer 1: valued-field languages and transfer

Build the three-sorted adapter and its chosen angular components, then relative valued-field elimination and transfer. The transfer statements retain the selected residue and value-group languages.

### 1.1 The Denef–Pas language

Use a tagged disjoint union of the valued-field, residue-field and value-group carriers to encode a three-sorted language in native first-order syntax. The first two sorts have ring language; the third has any fixed expansion L_Ord of the ordered abelian group language +,−,0,≤, and RF may have any fixed expansion L_Res of rings. The specialization for Layers 2–3 uses a ℤ-group in Presburger language, with 1 and congruences modulo positive integers. Cross-sort symbols are ord:VF×→VG and ac:VF→RF; a total ord on VF is allowed only with a specified value at 0 and every genuine valuation comparison guarded against 0. Quantifiers are relativized to their named sort. Coefficients and extra constants are recorded by a parameter diagram.

Tag each carrier and add sort predicates, with disjointness and exhaustiveness axioms. Totalize irrelevant symbol inputs by fixed tagged zeros, and guard every translated atom. Induct on sorted formulas to prove equivalence between sorted semantics and the tagged native semantics; changing the off-sort totalization leaves sorted truth unchanged.

The basic interface must include:

- A sorted quantifier ranges over exactly its tagged carrier in the native encoding.
- VF and RF reducts agree with the native ring language on correctly sorted tuples.
- An atom ord(x)=γ used as a nonzero valuation assertion includes x≠0.
- Named coefficient maps and their residue interpretations are preserved by the syntax translation.

**Checks.**

- The expression ac(ξ) for a residue-field variable ξ is rejected by the sorted syntax.
- Changing the chosen total value ord(0) cannot change the truth of a guarded sorted formula.
- In the value sort, γ≡1 mod 2 holds at γ=3 and fails at γ=2.
- A residue-field sentence translates to that ring sentence on RF, with no VF witnesses.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §2.1, Theorem 2.1.1 and Corollary 2.1.2, author pp.8–10 (Theorem p.9, Corollary p.10).)

*Needs:* Mathlib `FirstOrder.Language`; Mathlib `FirstOrder.Language.Formula`; Mathlib `FirstOrder.Language.ring`; [0.2 Semantics and composition of interpretations](#02-semantics-and-composition-of-interpretations).

### 1.2 Angular components and valued structures

A Denef–Pas valued structure consists of a henselian valued field K, its native valuation subring O, residue field k, a chosen surjective additive valuation ord:K×→Γ with arbitrary ordered abelian Γ and fixed expansions L_Res,L_Ord, and a map ac:K→k satisfying ac(0)=0, ac(xy)=ac(x)ac(y), and ac(u)=res(u) for units u∈O. On nonzero inputs ac takes values in k×. This is additional structure, not a canonical map supplied by every valued field.

Compare O and its residue quotient to native ValuationSubring and IsLocalRing.ResidueField. Convert the native multiplicative valuation convention to the chosen additive normalization explicitly. For a discretely valued field with chosen uniformizer π, define ac(x)=res(π^(−ord x)x) for x≠0; verify its laws using the unit factor and set ac(0)=0.

The basic interface must include:

- On valuation-ring units, ac is exactly the native residue map.
- ac(xy)=ac(x)ac(y), including zero inputs.
- For the uniformizer-defined ac, ac(π)=1 and ac(π^n u)=res(u).
- Replacing π by ε π multiplies the nonzero angular component by res(ε)^(−ord x); formulas cannot ignore this choice.

**Checks.**

- ac(0)=0, whereas ac(1)=1.
- In k((t)) with π=t, ac(t³(2+t))=2 when 2≠0 in k, and ord is 3.
- For every unit u of O, the new ac agrees with the native residue map.
- Choosing π′=ε π with res ε≠1 changes ac(π) to (res ε)⁻¹.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §2.1, Theorem 2.1.1 and Corollary 2.1.2, author pp.8–10 (Theorem p.9, Corollary p.10).)

*Needs:* [1.1 The Denef–Pas language](#11-the-denefpas-language); Mathlib `ValuationSubring`; Mathlib `ValuationSubring.ValueGroup`; Mathlib `HenselianLocalRing`.

### 1.3 Relative elimination of valued-field quantifiers

Over H_ac,0, the henselian ac-valued structures of residue characteristic zero with arbitrary ordered abelian value group and fixed expansions L_Res,L_Ord, every formula is equivalent, uniformly in such structures, to a finite disjunction of a residue-field formula in ac(f_i(x)) and RF variables, conjoined with an L_Ord-formula in ord(f_i(x)) and VG variables, with all zero cases separated. Here f_i are finitely many VF polynomials with the named coefficients. RF and VG quantifiers may remain. For a definable parameter base S, the corresponding relative form holds over its parameter diagram.

Prepare the finite polynomial family by induction on degree, refining cells prepared for the derivative family. Partition according to which Taylor terms have least valuation. A unique least term determines the order and angular component. If several least terms cancel, residue characteristic zero makes the relevant integer derivatives units; the henselian root lemma supplies a unique new centre in the prescribed order/angular-component ball. Prove that centre strongly definable using the lower-degree preparation, then recenter so that the linear Taylor term controls the remaining cell. Record each polynomial's angular component by an additional residue parameter. Relative elimination follows by applying this simultaneous preparation to one valued-field quantifier: the fibre's existence conditions are now RF/VG formulas. Separate f_i=0 from nonzero valuation atoms, distribute finite Boolean combinations, and retain RF/VG quantifiers. The parameter form follows by naming the parameter tuple and using its diagram.

The theorem does not assert elimination of residue-field quantifiers. No mixed-characteristic field ℚ_p satisfies the characteristic-(0,0) hypothesis. The parameter diagram preserves the chosen coefficient and angular-component data.

**Checks.**

- The Hahn field ℂ((t^ℚ)) has residue ℂ, value group ℚ and leading-coefficient angular component. Its value group is divisible, so it is included here although it is not a ℤ-group.
- For ℂ((t)), ord(t³(2+t))=3 and ac(t³(2+t))=2; this also belongs to the Presburger specialization.
- ℚ₂ has residue characteristic 2, so it is outside H_ac,0; the fixed-prime theorems of Layer 2 apply to it.

Cluckers–Loeser gives the precise relative elimination statement. The preparation and proof source is Pas 1989, Theorem 3.2, pp.142–143, with proof in §§3.6–3.8, pp.144–155, and Theorem 4.1 and proof, pp.155–157. Its hypotheses are in §2.4, p.140; the henselian root and definable-centre steps are Lemmas 3.5 and 3.7, pp.143–144 and 151–154. Pas uses a value group with ∞ for zero; the guarded presentation above must preserve that case when translating to the ordered-group sort.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §2.1, Theorem 2.1.1 and Corollary 2.1.2, author pp.8–10 (Theorem p.9, Corollary p.10).)

*Needs:* [1.1 The Denef–Pas language](#11-the-denefpas-language); [1.2 Angular components and valued structures](#12-angular-components-and-valued-structures).

### 1.4 Ax–Kochen–Ershov in the selected language

For the H_ac,0 structures of §1.3, elementary equivalence of their L_Res residue fields and of their L_Ord value groups, compatibly with all named coefficient data, implies elementary equivalence of their Denef–Pas structures. The reduct conclusion is a source-scoped AKE principle; no assertion is made for arbitrary imperfect residue fields or for all mixed-characteristic henselian fields.

A sentence in the VF-quantifier-free normal form has only RF and VG truth data once its coefficient diagram is fixed. Apply the two elementary equivalences to each finite disjunct. State the coefficient-free special case separately from any relative version.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §2.1, Theorem 2.1.1 and Corollary 2.1.2, author pp.8–10 (Theorem p.9, Corollary p.10).)

*Needs:* [1.3 Relative elimination of valued-field quantifiers](#13-relative-elimination-of-valued-field-quantifiers); Mathlib `FirstOrder.Language.Ultraproduct.sentence_realize`.

### 1.5 Finite-formula transfer for large residue characteristic

Fix a number field k with ring of integers O, and let L_O be the Denef–Pas language of §1.1 with Presburger value group, residue-field coefficients from k and valued-field coefficients from O[[t]]. An allowed local field is a nonarchimedean local field K with an O-algebra structure: a finite extension of a completion of k, or a local field of positive characteristic with an O-algebra structure. Interpret L_O in K after choosing a uniformizer ϖ_K: a power series ∑a_i t^i means ∑a_i ϖ_K^i, ord(ϖ_K)=1, and ac is the angular component of §1.2 with ac(ϖ_K)=1; a residue constant from k is interpreted once the residue characteristic does not divide its denominator. For a fixed sentence θ of L_O there is a bound N, depending on θ, such that:

- (a) for allowed local fields K₁,K₂ of residue characteristic greater than N whose residue fields are isomorphic as O-algebras, and for every choice of their uniformizers, θ holds in K₁ if and only if it holds in K₂;
- (b) if θ holds in κ((t)), with uniformizer t and coefficients ∑a_i t^i read in κ[[t]], for every field κ of characteristic zero containing k, then θ holds in every allowed local field of residue characteristic greater than N, for every choice of uniformizer.

For O=ℤ and a coefficient-free sentence, (a) gives the same truth for ℚ_p and ℤ/pℤ((t)) for all sufficiently large primes p. The assertion is eventual, with no claimed effective or uniform-in-all-formulas N. The ring-language headline is `ax_kochen_ring` in Suggested.lean, stated for ring-language structures compatible with the field operations (Mathlib `FirstOrder.Ring.CompatibleRing`), each equal to the canonical one.

Assume infinitely many counterexamples (pairs in (a), fields in (b)) with residue characteristics tending to infinity, and choose a nonprincipal ultrafilter on them. The ultraproducts are henselian of characteristic (0,0), their value groups are ℤ-groups and their residue fields contain k. In (a) the two residue ultraproducts are isomorphic as O-algebras; in (b) compare the ultraproduct with κ((t)) for κ its residue field. The coefficient data agree: a nonzero a∈O[[t]] with lowest term a_j t^j is interpreted with ord equal to j and ac equal to the image of a_j, in every field considered, as soon as the residue characteristic does not divide the norm of a_j; the residue constants are matched by the O-algebra isomorphism. Apply AKE with these named coefficient data (§1.4) and native Łoś to contradict the differing fixed sentence. A contradiction to unbounded counterexamples produces an existential finite exceptional set; it does not supply its numerical elements.

The bound depends on a fixed sentence and its coefficients. This logical transfer assertion is eventual; the fixed-prime integration results of Layer 2 have no such exclusion.

**Checks.**

- For the coefficient-free sentence ∃x, x²+1=0, ℚ₂ fails (a unit square is 1 mod 8, and −1 is 7 mod 8) while ℤ/2ℤ((t)) holds (x=1), so N≥2; at p=3 both fail, at p=5 both hold (2²≡−1 mod 5 and Hensel).
- With O=ℤ, the sentence ∃x, x²=1+t holds in every κ((t)) of characteristic zero (binomial series) and in every allowed field of odd residue characteristic (Hensel, since 1+ϖ_K is 1 modulo ϖ_K), but fails in ℚ₂ with ϖ=2 (3 is not 1 mod 8) and in ℤ/2ℤ((t)), whose squares are series in t²; so the bound in (b) is at least 2.
- Field isomorphism of residue fields is not enough when O≠ℤ. For O=ℤ[i] write ι for the residue constant i. At p=5 the completions of ℚ(i) at 2−i and at 2+i are both ℚ₅, with ι equal to 2 and to 3 in 𝔽₅; the sentence ∃ξ, ξ²=1+ι in the residue sort fails at the first (3 is not a square mod 5) and holds at the second (4=2²). For every p≡5 mod 8 the product (1+ι)(1−ι)=2 is a nonsquare, so exactly one of the two completions above p satisfies it (p=13: 1+ι is 6 or 9).

([Raf Cluckers and François Loeser, *Constructible exponential functions, motivic Fourier transform and transfer principle*](https://arxiv.org/pdf/math/0512022), §9.1, Notation 9.1.1 and the coefficient language L_O with its uniformizer interpretation, pp.40–41; §9.2, Proposition 9.2.1 and its proof, author pp.44–46; cf. the integral transfer in Theorem 9.2.4, p.46.)

*Needs:* [1.4 Ax–Kochen–Ershov in the selected language](#14-axkochenershov-in-the-selected-language); Mathlib `FirstOrder.Language.Ultraproduct.sentence_realize`; Mathlib `FirstOrder.Language.Ultraproduct.«structure»`; Mathlib `FirstOrder.Ring.CompatibleRing` for the ring-language statement.

### Examples

For k((t)), ac_t(t³(2+t))=2 when char k≠2; changing t to εt multiplies that angular component by res(ε)⁻³.

### Dependencies

Mathlib `FirstOrder.Language`; Mathlib `FirstOrder.Language.Formula`; Mathlib `FirstOrder.Language.ring`; [0.2 Semantics and composition of interpretations](#02-semantics-and-composition-of-interpretations); Mathlib `ValuationSubring`; Mathlib `ValuationSubring.ValueGroup`; Mathlib `HenselianLocalRing`; Mathlib `FirstOrder.Language.Ultraproduct.sentence_realize`; Mathlib `FirstOrder.Language.Ultraproduct.«structure»`; Mathlib `FirstOrder.Ring.CompatibleRing`.

## Layer 2: local constructible integration and geometric measure

Cell fibres and normalized Haar measure supply the local integral. Construct the analytic substitution and chart-gluing theory over the local field itself, then use differential forms to relate volumes to residue counts. Integrability remains a hypothesis throughout.

### 2.1 Denef–Pas cells and presentations

Over a definable base S, a presented 0-cell has z=c(y), and a presented 1-cell has ord(z−c(y))=α(y) and ac(z−c(y))=ξ(y) with ξ(y)≠0. The presentation is a definable isomorphism over S to such a cell whose base C lies in S×RF^n×VG^r; auxiliary residue and integer variables are permitted. The center is VF-valued, α is VG-valued, and ξ is RF-valued. A cell is the underlying subassignment together with such a presentation, not just an interval or a ball without angular data.

Form the displayed definable graphs and fibres in the fixed language. The presentation records a definable inverse and the base projection; refinement transports a presentation rather than assuming a definable VF choice function.

The basic interface must include:

- A 0-cell fibre is one point, z=c(y).
- A nonempty 1-cell fixes a nonzero angular component and one valuation of z−c(y).
- The presentation and inverse are definable over S and commute with the VF coordinate projection.
- A definable partition of the auxiliary base pulls back to a compatible partition of the cell.

**Checks.**

- Over a local field with q residue elements, ord z=0 and ac z=1 has Haar measure q⁻¹.
- The graph z=0 is a 0-cell and has zero one-dimensional Haar measure.
- A putative 1-cell with ξ=0 is invalid; it must not model an annulus.
- The units split into q−1 angular-component fibres after residue specialization, not into one fibre of volume q⁻¹.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §7.1, unnumbered 0-cell, 1-cell and presentation definitions, p.37; Remark 7.1.1.)

*Needs:* [1.1 The Denef–Pas language](#11-the-denefpas-language); [1.2 Angular components and valued structures](#12-angular-components-and-valued-structures).

### 2.2 Cell decomposition and preparation

In the equicharacteristic-zero Denef–Pas setting, a definable subset of S×VF admits a finite partition into presented 0- and 1-cells. The partition can be chosen adapted to finitely many definable integer-valued functions and positive constructible functions: after the presentation, their relevant values factor through the auxiliary base. For the selected local-field specialization the same fixed formulas give cells for sufficiently large residue characteristic; the following fixed-prime theorem supplies every finite extension of ℚ_p separately.

Apply the relative valued-field preparation theorem to the finitely many polynomials in the quantifier-eliminated formulas. Record their orders and angular components in auxiliary variables, then partition by the finitely many zero/nonzero patterns. Use the factorization over the resulting base to prepare integer-valued and constructible functions, with the degree induction and henselian recentering specified in §1.3.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), Theorem 7.2.1 and proof, pp.37–39; [Johan Pas, *Uniform p-adic cell decomposition and local zeta functions*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0399/LOG_0010.pdf), Theorem 3.2, pp.142–143; proof in §§3.6–3.8, pp.144–155.)

*Needs:* [2.1 Denef–Pas cells and presentations](#21-denefpas-cells-and-presentations); [1.3 Relative elimination of valued-field quantifiers](#13-relative-elimination-of-valued-field-quantifiers).

For every prime p and every finite extension F/ℚ_p, prove finite semialgebraic cell decomposition and preparation for finite families of definable integer-valued functions over F in the Macintyre language (ring language with coefficients from F and predicates for nonzero n-th powers, n>1). The cells use valuation bounds, centers and power-coset conditions; they need not be the uniform Denef–Pas cells. There is no restriction on p or the ramification index (Cluckers–Gordon–Halupczok, §3, Theorem 3.3.2).

Over the same fixed F, prove cell decomposition with analytic data. A cell in F is a nonempty set {t : |α| □₁ |t−c| □₂ |β|, t−c ∈ λP_n} with constants α,β∈F×, c,λ∈F, n>0, each □ either < or no condition, P_n the nonzero n-th powers; a cell in F^(m+1) is a nonempty set {(x,t) : x∈D, |α(x)| □₁ |t−c(x)| □₂ |β(x)|, t−c(x) ∈ λP_n} whose projection to F^m is a cell D, with α,β:F^m→F× and c:F^m→F definable and analytic on D. For λ=0 the cell is the graph t=c(x) over D. Every definable X⊆F^(m+1) has a finite partition into such cells, which can moreover be chosen to prepare the absolute values of finitely many given definable functions on X (Cluckers–Comte–Loeser, Definition 1.4.1, pp.5–6, and Theorem 1.4.2, p.6). A cell whose every coordinate step has λ≠0 is open, since its defining conditions are open and its data continuous; a cell with some step λ=0 has empty interior, since its fibres in that coordinate are single points. Every cell is a Borel set.

Over the same F, define the dimension of a definable A⊆F^m as the largest r such that the image of A under some coordinate projection F^m→F^r has nonempty interior, with dim∅=−∞. Prove the following, in which every set and map is definable:

- dim A=m if and only if A has nonempty interior in F^m, and dim A=0 if and only if A is finite and nonempty.
- dim(A∪B)=max(dim A, dim B).
- Additivity: for S⊆F^(m+n) and S(d) the set of a∈F^m whose fibre S_a has dimension d, S(d) is definable and the union of those fibres has dimension dim S(d)+d.
- dim g(A)≤dim A for every definable map g on A, with equality when g is injective: the graph of g has dimension dim A by additivity over A, and by additivity over g(A) its dimension is at least dim g(A), with equality when the fibres of g are single points.
- If dim A<m then A is Haar-null in F^m: by the analytic cell decomposition A is a finite union of cells with empty interior, each with a coordinate in which its fibres are single points, and Fubini applies.

([Pablo Cubides-Kovacsics, Luck Darnière and Eva Leenknegt, *Topological cell decomposition and dimension theory in P-minimal fields*](https://arxiv.org/pdf/1508.07536v1), arXiv v1, Definition 2.2 and the remarks after it, property (HM1), p.4, and Lemma 2.3, p.5, for P-minimal expansions of p-adically closed fields; F with its Macintyre structure is one, its definable sets being the semialgebraic ones. Cell decomposition with analytic data: [Raf Cluckers, Georges Comte and François Loeser, *Local metric properties and regular stratifications of p-adic definable sets*](https://arxiv.org/pdf/0910.0799v1), arXiv v1, §1.1 for the setting over a finite extension of ℚ_p, Definition 1.4.1, pp.5–6, and Theorem 1.4.2, p.6.)

**Checks.**

- Over ℚ₂, the polynomial 1 has order 0 everywhere and needs only a constant-order piece.
- For x²+y² over ℚ₂ the point (0,0) is a zero fibre; its value has no finite valuation and is separated from the prepared nonzero pieces.
- In ℚ₂(√2), a uniformizer π=√2 has ord π=1 and ord 2=2. Preparation retains this ramified normalization.
- The graph {(x,x²) : x∈F} has dimension 1, since its first projection is F, and is Haar-null in F², since each vertical fibre is one point; a definition counting only boxes contained in the set itself would give it dimension 0.
- The set of powers p^k, k∈ℤ, in ℚ_p is infinite with empty interior; it is not definable, because a definable subset of F with empty interior has dimension at most 0 and is therefore finite.
- Interleaving p-adic digits is a homeomorphism ℤ_p→ℤ_p×ℤ_p; it is not definable, since a definable injection cannot raise dimension from 1 to 2. Dimension is a definable invariant, not a topological one.
- The union law needs definability: the elements of ℚ_p algebraic over ℚ form a countable dense set, both it and its complement have empty interior, and their union is ℚ_p.

*Needs:* the fixed Macintyre language and the cell/presentation vocabulary of §2.1; §1.2 for the chosen discrete valuation and uniformizer; Mathlib `MeasureTheory.Measure.addHaar` for the nullity statement.

### 2.3 Local constructible functions

For a fixed nonarchimedean local field F with residue cardinal q, use the ℚ-algebra generated by indicator functions of the chosen DP-definable sets, cardinalities of finite definable residue-field fibres, integer-valued definable functions α, and q^β for integer-valued definable β; allow the scalar denominators (1−q^(−i))⁻¹ for i>0. Definability refers to the specified coefficient and uniformizer data. Integrability is an extra property of a function, never built into this ring.

Evaluate the indicated generators as ordinary functions on local-field points and take the generated subalgebra. Comparison with specialization is by the values of each generator; no injectivity of a motivic realization is asserted.

The basic interface must include:

- A fixed definable subset contributes its indicator function.
- Composition with a definable map preserves the constructible algebra.
- Motivic L^β and integer-function generators specialize to q^β and α.
- Absolute integrability is a separate predicate, and need not hold for the constant function 1 on all of F.

**Checks.**

- The indicator of O_F is constructible and has integral 1 with the chosen normalization.
- The constant function 1 on F is constructible but not integrable.
- The sum over n≥0 of q^(−n) equals (1−q⁻¹)⁻¹.
- The indicator of the empty definable set is zero.

([Raf Cluckers and François Loeser, *Constructible exponential functions, motivic Fourier transform and transfer principle*](https://arxiv.org/pdf/math/0512022), §9.1, specialization conventions, pp.40–42; Cluckers–Loeser 2008 §4.1 and §5.2.)

*Needs:* [2.1 Denef–Pas cells and presentations](#21-denefpas-cells-and-presentations); [1.1 The Denef–Pas language](#11-the-denefpas-language).

### 2.4 Constructible local integration

Normalize additive Haar measure on F^m by vol(O_F^m)=1. For a chosen definable family X⊆S×F^m and a local constructible function φ on X, the integral `s↦∫_{X_s}φ(s,x)dx` is constructible on a specified definable parameter locus on which absolute integrability has been proved, in the uniform large-residue-characteristic family. Separately, for every finite extension F/ℚ_p at every prime, the same integration assertion holds for semialgebraic constructible functions: the ℚ-algebra generated by definable integer-valued functions and their q-powers, including indicators. Its integrability locus is a constructible zero locus, and an everywhere-integrable constructible replacement agrees on integrable fibres. This fixed-F theorem uses Macintyre cells (Cluckers–Gordon–Halupczok, §3.1, Theorems 3.1.1, 3.1.3 and 3.1.5); it supplies no uniform bound in p. The normalization for a 1-cell fibre ord(z−c)=a, ac(z−c)=ξ≠0 is q^(−a−1). Zero-dimensional sets are null for positive-dimensional Haar measure.

For a fixed uniform constructible presentation φ, extended by zero off X, also construct uniform constructible functions h and G on S and an N such that, for every allowed local field F of residue characteristic greater than N and every s∈S(F), h_F(s)=0 if and only if φ_F(s,−) is absolutely integrable, and G_F(s) is its integral whenever this condition holds. The value of G outside that locus is unspecified. Construct an everywhere fibre-integrable constructible replacement agreeing with φ on every integrable fibre. Clear the fixed rational coefficient denominators before applying the integral-coefficient motivic theorem, and divide the resulting integral by that nonzero constant. The full integrability locus is a zero locus of a constructible function; it need not be definable. Restriction to a certified definable integrability domain recovers the initial assertion.

Use finite cell preparation and integrate each 1-cell by q^(−a−1). Remove lower-dimensional contributions for Haar measure, while retaining them in zero-dimensional counting measures. Reduce the remaining value-group coordinates to Presburger summation of polynomial-exponential terms; a convergent geometric series produces precisely the inverted denominators. For the full locus and replacement, use residual parameterization and the Presburger zero-locus/interpolation argument of Cluckers–Gordon–Halupczok §4.5. Descend the residue parameters by finite sums of squares, whose vanishing means that every summand vanishes. Integrate the replacement motivically and specialize to obtain G. This additional interpolation step is not supplied by the specialization theorem alone.

For Presburger summation, use parametric rectilinearization to reduce fibres to Λ_s×ℕ^ℓ, with Λ_s finite, and functions to finite sums c_i(s)y^a_i q^(b_i·y), combining repeated exponent pairs first. On an unbounded coordinate, terms with b_ij≥0 obstruct absolute summability unless their combined coefficient function vanishes identically. Certify that vanishing by a constructible zero locus, and discard those terms to obtain the everywhere-summable replacement. Finite fibres are summed directly; on ℕ, differentiate the convergent geometric series to sum each y^a q^(by) with b<0. The finite bound on zeros needed for coefficient detection can be proved here for the fixed nonnegative integer powers by repeated Rolle arguments after factoring an exponential, with bound Σ_b(deg P_b+1)−1 for a nonzero Σ_b P_b(y)q^(by). This avoids making local integration depend on the o-minimality theorem of Layer 6. Rectilinearization with parameters is Cluckers' theorem: a ∅-definable Presburger set in G^(m+n) has a finite definable partition such that on each piece a definable family of linear bijections, indexed by the parameter, maps the fibre onto ℕ^ℓ×Λ_λ with Λ_λ bounded and ℓ fixed on the piece (Cluckers, *Presburger sets and p-minimal fields*, Theorem 3 and proof, pp.6–7 of arXiv:math/0206197; induction on the fibre dimension through Theorem 2).

**Negative control.** Let a,b,c range over the value-group integers and let φ(a,b,c;x)=ab−c on all of F. Products of integer-valued generators are constructible. The fibre is integrable exactly when c=ab, because the zero function is integrable and any nonzero constant on F is not. This multiplication graph is not Presburger-definable: restricting a putative integer definition to a,b,c≥0 would contradict Mathlib `FirstOrder.Language.presburger.mul_not_definable`, which is stated on ℕ. Thus an API returning a definable set for every integrability locus would be false, even though h(a,b,c)=ab−c is a constructible zero-locus certificate.

Prove the full Presburger preparation/summation and interpolation arguments without inferring an effective residue bound. Local diffeomorphisms use the locally analytic inverse function theorem over F (Schneider, *p-Adic Lie Groups*, Proposition 6.4, p.42) and the analytic substitution §2.5(a); definable maps use §2.5(b) in regime (iii) for the uniform family and regime (i) for a fixed finite extension of ℚ_p.

([Raf Cluckers and François Loeser, *Constructible exponential functions, motivic Fourier transform and transfer principle*](https://arxiv.org/pdf/math/0512022), Theorem 9.1.5, p.43, with §9.1 conventions, pp.40–42; Cluckers–Loeser 2008 §9.1, pp.49–53; [Raf Cluckers, Julia Gordon and Immanuel Halupczok, *Integrability of oscillatory functions on local fields: transfer principles*](https://arxiv.org/pdf/1111.4405v2), arXiv v2, Theorems 2.1.3–2.1.6 and proofs, pp.5–9, uniform-base versions §2.2, p.10; Theorems 3.1.1, 3.1.3 and 3.1.5, pp.11–12; Theorem 3.3.2, p.15; Theorems 4.3.1–4.3.3, p.32 and proofs in §4.5, pp.37–40; [Raf Cluckers, *Presburger sets and p-minimal fields*](https://arxiv.org/pdf/math/0206197), Theorems 2–3, pp.5–7.)

*Needs:* [2.2 Cell decomposition and preparation](#22-cell-decomposition-and-preparation); [2.3 Local constructible functions](#23-local-constructible-functions); [2.5 Jacobian change of variables](#25-jacobian-change-of-variables).

### 2.5 Jacobian change of variables

The section has two assertions with different hypotheses.

*(a) Analytic substitution, every local field.* Let F be a nonarchimedean local field of any characteristic, U,V⊆Fⁿ open, and f:U→V a bijection that is strictly differentiable at every point with invertible derivative; a locally analytic isomorphism with locally analytic inverse is the main case. For every absolutely integrable φ on V, ∫_V φ(y)dy=∫_U φ(f(x))|det Df(x)|dx for normalized Haar measure. The same holds for such isomorphisms of F-analytic manifolds with respect to the chart-glued measures of §2.7.

*(b) Definable regularity, characteristic zero.* Let f:X→Y be a definable bijection between definable subsets X,Y⊆Fⁿ, where F is the valued field of the regime, in one of the following regimes: (i) a fixed finite extension F/ℚ_p in the Macintyre language, for every prime p and every ramification index, with X and Y of dimension n; (ii) the fields K((t)) with char K=0 in the Denef–Pas language over a base field of characteristic zero, with X and Y of dimension n; (iii) fixed formulas of the language L_O of §1.5, with coefficients from O[[t]] for the ring of integers O of a number field k, that define a bijection f:X→Y in every allowed local field of §1.5 of residue characteristic greater than a bound N₀, the conclusion being asserted above a bound N≥N₀ depending on those formulas, for every choice of uniformizer; regime (iii) has no dimension hypothesis, since no dimension theory is set up here in positive characteristic. Then there is a definable Z⊆X such that Z and f(Z) are open in Fⁿ and f restricted to Z is strictly differentiable at every point with invertible derivative, where: in regimes (i) and (ii), X∖Z and Y∖f(Z) have dimension less than n; in regime (iii), Z is defined by one L_O-formula built from those of f, the same in every such field, and each of X∖Z and Y∖f(Z) is covered by finitely many definable sets each of which, after a coordinate permutation, has at most M points in every fibre of the projection Fⁿ→Fⁿ⁻¹ forgetting the last coordinate, for an integer M depending on the formulas. In regimes (i) and (ii) Z can moreover be chosen so that f|Z is analytic over the field of the regime, with analytic inverse on f(Z); no analyticity is asserted in regime (iii). In regimes (i) and (iii), where F is a local field, the discarded loci are Haar-null and (a) gives ∫_Y φ(y)dy=∫_X φ(f(x))|det Df(x)|dx for absolutely integrable φ on Y. In regime (ii) the residue field is infinite and there is no Haar normalization; the regularity statement is consumed by the motivic change of variables of §3.8. Discarded lower-dimensional loci are null only for the matching positive-dimensional measure; lower-dimensional graded integration is kept separate. No assertion (b) is made for a local field of positive characteristic outside regime (iii).

Prove (a) directly. By strict differentiability and the ultrametric inequality, on a small enough ball around x₀ the remainder f(x)−f(y)−Df(x₀)(x−y) is smaller than every value of Df(x₀) on the corresponding sphere, so f maps each smaller ball x₁+π^kO_Fⁿ onto f(x₁)+Df(x₀)(π^kO_Fⁿ) (Schneider, *p-Adic Lie Groups*, Proposition 6.4 and its proof, p.42); a linear map scales normalized Haar measure on Fⁿ by |det|, and summing over a partition into such balls gives the formula. The argument uses completeness and the ultrametric inequality only, not the characteristic. Record the sign convention |det|=q^(−ord det) and fix the determinant direction by x=πu as in the layer example.

Prove (b) separately in each regime. In regime (ii) apply the partition into analytic manifolds with analytic restrictions (CL Theorem 3.2.1(i),(iii), p.14, proof p.17) to the coordinate functions of f and of f⁻¹; on Z=Z_f∩f⁻¹(Z_(f⁻¹)), with Z_f and Z_(f⁻¹) the two open analytic loci, f is bianalytic, so Df is invertible by the chain rule, and X∖Z⊆(X∖Z_f)∪f⁻¹(Y∖Z_(f⁻¹)) is lower-dimensional because a definable map does not raise dimension and dimension is maximal on finite unions (CL Theorem 3.3.1(i),(iii), p.15); likewise for Y∖f(Z). The one-variable Jacobian preparation (CL Theorem 7.5.3 and Corollary 7.5.4, pp.43–44, stated for K of characteristic zero; Lemma 7.5.2 uses it) supplies the ball-to-ball property consumed by §3.7. In regime (i) use the analytic cells and the dimension theory of §2.2 over the fixed field F. For each coordinate function f_k of f, partition the graph of f_k in Fⁿ×F, value coordinate last, into analytic cells. A cell whose last step has λ≠0 has open, hence infinite, fibres over its base, whereas each fibre of a graph is one point; so every piece is the graph of a function analytic on its base cell, and these base cells partition X. Let U_k be the union of the open base cells: f_k is analytic on U_k, and X∖U_k is a finite union of cells with empty interior, so dim(X∖U_k)<n. Put U=⋂_k U_k, so that f is analytic on U and dim(X∖U)<n, and construct V⊆Y in the same way for f⁻¹. Then Z=U∩f⁻¹(V) is open because f is continuous on U, and f(Z)=V∩(f⁻¹)⁻¹(U) is open because f⁻¹ is continuous on V; f is analytic on Z with analytic inverse on f(Z), so D(f⁻¹)(f(x))·Df(x) is the identity by the chain rule and Df is invertible. Since X∖Z⊆(X∖U)∪f⁻¹(Y∖V) and Y∖f(Z)⊆(Y∖V)∪f(X∖U), both complements have dimension less than n by the union law and because a definable map does not raise dimension (§2.2). Generic real manifold theory does not supply these steps. CL Proposition 9.3.2 treats one valued-field coordinate and is not used for the higher-dimensional statement.

In regime (iii) let Z be the set of x∈X having a ball B⊆X around x such that f(B) is open and f is strictly differentiable at every point of B with invertible derivative. Strict differentiability at a point is first order (some matrix L with det L≠0 satisfies, for every γ in the value group, ord(f(y)−f(y′)−L(y−y′))≥ord(y−y′)+γ for all y,y′ close enough to the point), so Z is given by one L_O-formula built from those of f. In every field Z is open, being a union of balls (each point of a ball is a centre of it), f(Z) is open as a union of the open sets f(B), and f is strictly differentiable on Z with invertible derivative, by the definition alone. Fix κ⊇k of characteristic zero and suppose that the sentence β saying that f is a bijection X→Y holds in κ((t)). Apply (ii) over the base field k to the definable bijection equal to f where β holds and empty where it fails: its bianalytic locus lies in Z in κ((t)), since an analytic map is strictly differentiable and a bianalytic map sends small balls to open sets, so X∖Z and Y∖f(Z) lie in the zero set of a nonzero polynomial, CL dimension being the dimension of the Zariski closure (CL §3.1, p.13); when that bijection has domain of dimension less than n, X itself lies in such a zero set. Such a definable W⊆κ((t))ⁿ is covered as the conclusion requires, by induction on n. Write W through its valued-field-quantifier-free form in the shape (3.3.2) of CL p.16, given by relative elimination over the coefficient ring (CL Theorem 2.1.1 and Corollary 2.1.2; §1.3), and let M be the sum of the degrees in the last variable of its polynomials; the form and M depend on the formula of W, not on κ. Write points as (x,z) with x∈κ((t))ⁿ⁻¹. If z₀ is a root of none of the polynomials that are nonconstant in z at x₀, each of them has constant order and angular component for z near z₀ and the others do not depend on z, so z₀ is interior to the fibre W_(x₀). Hence the set B of points (x,z)∈W with z not interior to W_x has at most M points in every fibre over κ((t))ⁿ⁻¹. The fibres of A=W∖B are open; if W lies in the zero set of g=Σ_i g_i(x)z^i≠0, each nonempty fibre of A is an infinite set of roots of g(x,·), so the projection of A lies in the zero set of a nonzero g_i, and the induction hypothesis covers it by sets P_l with at most M_l points in every fibre of the projection forgetting a coordinate i_l; then A⊆⋃_l(P_l×κ((t))) with the same bounds in the coordinates i_l. For n=0 the set W is empty, and for n=1 the set A is empty, nonempty open subsets of κ((t)) being infinite. The pieces are defined by formulas determined by that of W, so the sentence saying that β implies that X∖Z and Y∖f(Z) lie in the union of these pieces, each with at most its bound in every fibre of its coordinate, holds in every κ((t)) with κ⊇k of characteristic zero; §1.5(b) gives N≥N₀ above which it holds in every allowed local field, where β holds by hypothesis. Analyticity is not a first-order property and is not transferred.

In regimes (i) and (iii) apply (a) on Z. The discarded loci are Haar-null: in regime (i) by the nullity statement of §2.2, and in regime (iii) by Fubini, each piece having finite fibres in one coordinate. In regime (iii) the pieces, X and Y are Borel: the equivalence of each defining formula with its valued-field-quantifier-free form holds in every κ((t)) and transfers by §1.5(b) (as in the CL exponential paper, §9.1.2, pp.40–41), and in a local field such a form defines a finite union of locally closed sets, the order and angular component of a nonvanishing polynomial being locally constant.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), Theorem 2.1.1, p.9, and Corollary 2.1.2, p.10; §3.1, p.13 (dimension through the Zariski closure); Theorem 3.2.1, p.14, and its proof, p.17; Theorem 3.3.1(i),(iii), p.15; the elimination shape (3.3.2) in the proof of Theorem 3.3.1, p.16; Lemma 7.5.2, Theorem 7.5.3 and Corollary 7.5.4, pp.43–45; Proposition 9.3.2 (relative dimension one), pp.58–59; Theorem 12.1.1 (general motivic isomorphism), p.74; [Raf Cluckers, Georges Comte and François Loeser, *Local metric properties and regular stratifications of p-adic definable sets*](https://arxiv.org/pdf/0910.0799v1), arXiv v1, Definition 1.4.1, pp.5–6, and Theorem 1.4.2, p.6; [Pablo Cubides-Kovacsics, Luck Darnière and Eva Leenknegt, *Topological cell decomposition and dimension theory in P-minimal fields*](https://arxiv.org/pdf/1508.07536v1), arXiv v1, Definition 2.2 and (HM1), p.4, and Lemma 2.3, p.5; [Raf Cluckers and François Loeser, *Constructible exponential functions, motivic Fourier transform and transfer principle*](https://arxiv.org/pdf/math/0512022), §9.1.2, pp.40–41, for formulas defining the same subassignment.)

**Checks.**

- For x=πu with q=3 and u∈O_F, the target has volume 1/3 and the pulled-back density integrates to |π|·1=1/3; using the inverse determinant would give 3.
- For (u,v)↦(πu,π²v) at q=3, the image of O_F² has volume 1/27, equal to |det diag(π,π²)|.
- A singleton in F has Haar mass zero and the graph {(x,0):x∈F} has product Haar mass zero by Fubini. The singleton F⁰ has intrinsic zero-dimensional mass one, so nullity requires dimension strictly below the ambient dimension.
- Negative control for (b) in positive characteristic: over F=𝔽₂((t)) write each x uniquely as a²+tb² (even and odd Laurent coefficients) and put s(x)=b²+ta². The graph is defined by ∃a,b (x=a²+tb² ∧ y=b²+ta²) with parameter t; s is additive, s∘s=id and s(O_F)=O_F, so both sides have measure 1. Its difference quotients are t along h=t^(2n) and t⁻¹ along h=t^(2n+1), so s is differentiable nowhere and no open locus as in (b) exists. It is excluded from (b) by char F=2 and from (a) because it has no derivative.
- Analytic substitution in positive characteristic: over 𝔽₂((t)) (q=2) the map x↦tx satisfies (a), and μ(tO_F)=1/2=|t|·μ(O_F).
- Bounded fibres, not graphs, in regime (iii): in ℂ((t))² let S′ be the set of (x,y) with y²=x³+x and ord x<0, and let f be (x,y)↦(x,−y) on S′ and the identity elsewhere, an involution defined over ℤ. On S′, ord y=3·ord x/2<0, so y≠0 and f is discontinuous at every point of S′, which therefore lies in X∖Z for every admissible Z. S′ is not covered by finitely many definable graphs over either coordinate: put the coefficients of their parameters in a countable field K₀∋ζ₃, take s∈ℂ transcendental over K₀, y=s³t⁻³ and x the root of x³+x=y² with ac x=s² (Hensel); the coefficientwise automorphism s↦−s fixes x and negates y, and s↦ζ₃s fixes y and changes ac x to ζ₃²s². S′ has at most 2 points over each x and at most 3 over each y, so the bounded-fibre covering holds with M=2, and in every local field the same formulas give a set with at most 2 points over each x, Haar-null by Fubini.

*Needs:* for (a), Mathlib `MeasureTheory.Measure.addHaar` and the local substitution argument over F stated above; for (b), in addition [2.2 Cell decomposition and preparation](#22-cell-decomposition-and-preparation) (in regime (i), its analytic cells and dimension theory over the fixed field) and, in regime (iii), [1.3 Relative elimination of valued-field quantifiers](#13-relative-elimination-of-valued-field-quantifiers) for the elimination forms and [1.5 Finite-formula transfer for large residue characteristic](#15-finite-formula-transfer-for-large-residue-characteristic).

### 2.6 Igusa and local Poincaré rationality

For fixed integral polynomial data f in m variables over O_F, let `Z_f(T)=∑_{k≥0} vol{x∈O_F^m : ord f(x)=k} T^k`, omitting f(x)=0. For every prime p, every finite extension F/ℚ_p and every f over O_F, both Z_f and the normalized congruence series A_f defined below are rational over ℚ, with denominators products of 1−q^(−a)T^b, a≥0 and b>0 (Denef 1984, Theorems 1.1–1.2; the tail identity below). The fixed-F route uses the Macintyre preparation of §2.2. In addition, for F in a fixed sufficiently large-residue-characteristic family, Z_f is a rational function with coefficients in ℚ, arising from a uniform constructible coefficient algebra, with denominators products of 1−q^a T^b (a∈ℤ,b>0), after cancellation as necessary. This latter statement retains uniform constructible data across the family. Z_f(q^(−s)) is initially the usual Igusa integral for Re(s)>0. The normalized congruence Poincaré series `A_f(T)=∑_{n≥0} q^(−mn) #{x mod π^n : f(x)=0 mod π^n} T^n` is rational as well, with TZ_f(T)=1+(T−1)A_f(T). Singular zero loci and the identically zero polynomial are treated by this formal identity.

After cell preparation, orders and volumes are affine Presburger data, so sum the resulting geometric progressions with polynomial factors. Write a_n=vol{ord f≥n}; then vol{ord f=k}=a_k−a_(k+1), with a_0=1. Summing coefficientwise gives T Z=1+(T−1)A without assuming the zero locus has measure zero. State possible denominator factors separately from genuine poles: cancellation can remove a factor. The analytic integral and its meromorphic extension in s require the substitution T=q^(−s).

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), Theorem 14.4.1, p.80; Theorem 4.4.1, p.21; comparison with arithmetic motivic integration, Theorem 16.4.1, p.90, and Remark 16.4.2, p.91; specialization to local fields, [Raf Cluckers and François Loeser, *Constructible exponential functions, motivic Fourier transform and transfer principle*](https://arxiv.org/pdf/math/0512022), Theorem 9.1.5, p.43, as in §2.4; own coefficientwise tail identity.)

**Checks.**

- For f=0, Z_f=0 and A_f=(1−T)⁻¹; both sides of TZ_f=1+(T−1)A_f are zero. The nonzero-valuation layers omit the whole zero fibre.
- For f=1, Z_f=A_f=1; both sides of the tail identity equal T, including the level-zero quotient.
- For f=x, Z_f=(1−q⁻¹)/(1−q⁻¹T) and A_f=1/(1−q⁻¹T). At q=2 these are (1/2)/(1−T/2) and 1/(1−T/2); no prime is omitted.

The acceptance theorem `igusa_poincare_rationality` uses a characteristic-zero DVR O finite as a module over ℤ_p, equivalently a ring of integers of a finite extension of ℚ_p. It states rationality of the raw counts in O/mⁿ for every polynomial over O. Multiplying its n-th coefficient by q^(−mn) gives A_f; conversely substituting q^m T in A_f recovers the raw series. The algebra over ℤ_p and module finiteness are explicit hypotheses.

*Needs:* [2.2 Cell decomposition and preparation](#22-cell-decomposition-and-preparation); [2.4 Constructible local integration](#24-constructible-local-integration); [2.5 Jacobian change of variables](#25-jacobian-change-of-variables).

### 2.7 Measures attached to gauge forms

Extend the characteristic-zero algebraic-group gauge measures of TauCetiRoadmap.AdelicAlgebraicGroups §2.4 to arbitrary F-analytic manifolds and tensor powers. Let F be a nonarchimedean local field, X a second-countable Hausdorff F-analytic manifold of pure dimension d, r≥1, and ω a section of (Ω_X^d)⊗r. In a chart write ω=f(x)(dx₁∧⋯∧dx_d)⊗r and assign density |f(x)|^(1/r) against normalized additive Haar measure. Glue these local measures by analytic substitution. When ω never vanishes call it an r-gauge form. For a geometrically reduced algebraic X, extend the measure on its smooth locus by zero across the singular locus when using the stated Yasuda-style measure.

In a chart construct the density-weighted measure. The determinant transformation of an r-fold top form exactly cancels the r-th root after substitution. Use measure gluing on a countable chart cover after the chart substitution theorem of §2.5; use a disjoint measurable refinement for uniqueness. For the singular extension, define zero on the complement of the smooth locus. Geometric reducedness gives the required full-dimensional smooth locus; null-set comparisons are §2.8. For an algebraic X, the F-points of its smooth locus form an F-analytic manifold: cover X by finitely many affine opens, embed each as a closed subvariety of affine space, and at each point choose coordinates whose differentials restrict to a basis of the cotangent space; the locally analytic inverse function theorem makes the projection a chart (Schneider, *p-Adic Lie Groups*, Proposition 6.4, p.42). Two such charts differ by a locally analytic isomorphism, so the measure of §2.7 does not depend on the affine cover, the closed embeddings or the coordinate choice, by analytic pullback invariance.

The basic interface must include:

- The measure in a chart is |f|^(1/r) times normalized Haar measure.
- An analytic isomorphism pulls the gauge measure back to the measure of its pulled-back form.
- Multiplication by an analytic unit of norm one leaves the measure unchanged.
- Replacing a 1-gauge form η by η⊗r leaves its measure unchanged.

**Checks.**

- For ω=dx₁∧⋯∧dx_d on O_F^d, the volume is 1.
- For ω=π²(dx)⊗2, the volume of O_F is q⁻¹, not q⁻².
- The zero section gives the zero measure; it is not a gauge form.
- A constant unit u with |u|=1 does not alter the normalized chart measure.

Glue chart measures over a countable disjoint measurable refinement of the chart cover (`MeasureTheory.Measure.sum` of restrictions). For a relative morphism X→Y, the relative top section lives on X. A local ordinary top form η has tensor degree one, so the reference tensor is η⊗r, not a second tensor power of an already r-fold form (GWZ mirror, Proposition 4.1 and Claim 4.2, p.20).

([Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Geometric stabilisation via p-adic integration*](https://arxiv.org/pdf/1810.06739v2), §2.1, p.5; Proposition 2.1, p.6; [Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration*](https://arxiv.org/pdf/1707.06417v3), §4.1, pp.19–21 in arXiv v3; published pp.536–539.)

*Needs:* [2.5 Jacobian change of variables](#25-jacobian-change-of-variables); Mathlib `MeasureTheory.Measure.addHaar`; Mathlib `AlgebraicGeometry.IsAffineOpen`; Mathlib `Algebra.FiniteType.iff_quotient_mvPolynomial''`; Mathlib `AlgebraicGeometry.IsClosedImmersion`; Mathlib `AlgebraicGeometry.Smooth`; Mathlib `KaehlerDifferential`; [TauCetiRoadmap.SchemeAndStackFoundations, §2.20](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#220-relative-dualising-complexes-and-modules-serre-duality-curve-comparison).

### 2.8 Positive-codimension loci are null

For a geometrically reduced F-variety X with the measure from an r-fold top form on its smooth locus, a closed subvariety Y⊂X of positive codimension in every component has measure zero. Thus removing Y leaves the integral of an absolutely integrable function unchanged. No measure on a nonreduced thickening is inferred from this assertion.

Work on smooth affine charts. On each chart ball choose an analytic equation not identically zero there. Its zero set has Haar measure zero by the one-variable power-series zero theorem and induction/Fubini. Cover each positive-codimension locus by such local zero sets and use second countability. The singular part is assigned zero by the extension convention.

Prove the local analytic positive-codimension zero-locus nullity needed to discard nongeneric loci, then transport it through the countably glued chart measures. Ambient nullity is not an assertion of zero intrinsic volume.

([Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Geometric stabilisation via p-adic integration*](https://arxiv.org/pdf/1810.06739v2), Proposition 2.1(a), p.6; GWZ mirror, Proposition 4.4, p.21 (published p.539).)

*Needs:* [2.7 Measures attached to gauge forms](#27-measures-attached-to-gauge-forms).

### 2.9 Weil volume and residue point counts

The smooth affine group case is the Weil volume theorem of TauCetiRoadmap.AdelicAlgebraicGroups §2.4. The additional target is the formula for arbitrary smooth finite-type models, with their gauge form.

If X is smooth of pure relative dimension d over O_F and ω is an integral nowhere-vanishing top form (or an integral r-gauge form), then vol_ω(X(O_F))=#X(k_F)/q^d. Assume X is of finite type so the count is finite. Each residue fibre has analytic residue coordinates in (πO_F)^d, of normalized mass q^(−d). For non-global gauge forms, the canonical local unit-compatible measure gives the same formula.

Use smooth integral coordinates on each residue fibre and the formal implicit-function theorem. Integral gauge transition factors are units, so the fibre measure is q^(−d). Partition X(O_F) by its finitely many residue points and add the fibre measures. This concerns arbitrary smooth varieties, distinct from the adelic-group Tamagawa normalization.

The smooth lifting and local chart argument uses the stated finite-type integral model, reduction fibres and unit gauge; the analytic step is the inverse function theorem and measure gluing of §2.7.

([Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Geometric stabilisation via p-adic integration*](https://arxiv.org/pdf/1810.06739v2), Theorem 1.4, p.3; §2.1, p.5.)

*Needs:* [2.7 Measures attached to gauge forms](#27-measures-attached-to-gauge-forms); [2.8 Positive-codimension loci are null](#28-positive-codimension-loci-are-null).

### 2.10 Néron point counts of dual abelian varieties

Let F be a nonarchimedean local field with finite residue field k of characteristic p and q elements. For an abelian variety A over F write 𝒜 for its Néron model over O_F, 𝒜° for the identity component, and Φ_A for the finite étale component group of the special fibre. Prove the dual Néron point-count theorem:

- (a) every isogeny φ:A→B of degree prime to p extends to a homomorphism φ:𝒜→ℬ of Néron models, there is ψ:ℬ→𝒜 with ψ∘φ=[deg φ], and φ restricts to an étale isogeny 𝒜°→ℬ° of identity components;
- (b) #𝒜(k)=#𝒜°(k)·#Φ_A(k), and an étale isogeny of smooth connected commutative k-groups preserves the number of k-points;
- (c) `#Φ_A(k)=#Φ_{A^∨}(k)` for the dual abelian variety A^∨.

Hence, for dual abelian varieties A and B=A^∨ and an isogeny of degree prime to p, #𝒜(k)=#ℬ(k). No semistability hypothesis is made, and no claim that φ is finite flat on the whole Néron model.

For (a), extend φ and an isogeny φ′:B→A with φ′∘φ=[l], l=deg φ, by the Néron mapping property; since l is a unit in O_F, multiplication by l is étale on the smooth group 𝒜, so φ is unramified, hence étale, on identity components (Bosch–Lütkebohmert–Raynaud, *Néron Models*, §7.3, Proposition 6, p.180). For (b), the sequence 0→𝒜°_k→𝒜_k→Φ_A→0 and Lang’s theorem H¹(k,𝒜°_k)=0 from ReductiveGroupsPartII RG2.3.7 give the product formula; for an étale isogeny G→H with finite kernel K, the long exact sequence 0→K(k)→G(k)→H(k)→H¹(k,K)→H¹(k,G)=0 and #H¹(k,K)=#K(k) for a finite Galois module over a finite field (the cokernel and kernel of Frobenius−1 on a finite group have the same order) give #G(k)=#H(k). For (c), the perfect Galois-equivariant pairing on geometric component groups required by gap:neron-pairing-perfect-finite-residue identifies Φ_A(k̄) with `Hom(Φ_{A^∨}(k̄),ℚ/ℤ)`, and for a finite module Φ with an action of the cyclic group Gal(k′/k) through which Galois acts, #Φ^G=#(Φ/(σ−1)Φ), which dualizes to `#Φ_A(k)=#Φ_{A^∨}(k)` (Lorenzini, Proposition 4.3 and proof, pp.2032–2033).

The basic interface must include:

- the prime-to-p isogeny extends, with an isogeny in the other direction composing to multiplication by its degree.
- #𝒜°(k)=#ℬ°(k) for isogenous A,B with prime-to-p isogeny.
- `#Φ_A(k)=#Φ_{A^∨}(k).`
- #𝒜(k)=#ℬ(k) for dual A,B.

**Checks.**

- For A with good reduction, Φ_A is trivial and #𝒜(k)=#𝒜_k(k), the point count of the reduction, which equals that of the dual reduction.
- For a Tate curve E with ord(Δ)=n split multiplicative, Φ_E(k)=ℤ/n, #𝒜°(k)=q−1 and #𝒜(k)=n(q−1); E is its own dual, so (c) is the identity n=n.
- For Φ=ℤ/3 with Frobenius acting by −1, Φ(k)=0 while Φ/(σ−1)Φ=ℤ/3/(2·ℤ/3)=0; the cyclic-group identity #Φ^G=#(Φ/(σ−1)Φ) is what (c) uses. For the noncyclic group S₃ acting on M=(𝔽₃)³/diagonal, M^G=0 while (M*)^G has order 3 (Lorenzini, Example 4.4), so cyclicity of the residue Galois group is essential.
- The hypothesis that p does not divide deg φ is needed for étaleness: a degree-p isogeny of an elliptic curve with good supersingular reduction reduces to a purely inseparable isogeny of the special fibre, which is not étale.

([Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Geometric stabilisation via p-adic integration*](https://arxiv.org/pdf/1810.06739v2), proof of Proposition 2.2, p.6; Bosch–Lütkebohmert–Raynaud, *Néron Models*, §7.3, Proposition 6, p.180; [Dino Lorenzini, *Torsion and Tamagawa numbers*](https://aif.centre-mersenne.org/item/10.5802/aif.2664.pdf), Annales de l’Institut Fourier 61 (2011), Proposition 4.3 and proof, pp.2032–2033.)

*Needs:* [TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties, §2.5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md#25-functoriality-under-isogeny); [TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties, §4.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md#46-grothendiecks-pairing-on-component-groups); gap:neron-pairing-perfect-finite-residue (NeronModelsAndSemistableAbelianVarieties §4.6); TauCetiRoadmap.ReductiveGroupsPartII RG2.3.7.

### 2.11 Dual abelian isogeny volume invariance

Let A and B be dual abelian varieties over a nonarchimedean local field F of residue characteristic p, and let φ:A→B be an isogeny whose degree is prime to p. For every ω∈H⁰(B,Ω_B^top), `∫_{A(F)}|φ*ω|=∫_{B(F)}|ω|.` The zero form is allowed. The proof needs the identity-component and dual component-group comparison of §2.10; it does not require declaring the entire Néron-model morphism finite flat.

Scale ω by an element of F so that it extends to a generator of the top differentials of ℬ; translation invariance makes its pole order constant on each component of the special fibre. The extension of φ is étale on identity components (§2.10(a)), so φ*ω generates the top differentials of 𝒜. By Weil volume (§2.9) both integrals equal point counts of the special fibres divided by q^dim, and §2.10 gives #𝒜(k)=#ℬ(k).

([Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Geometric stabilisation via p-adic integration*](https://arxiv.org/pdf/1810.06739v2), Proposition 2.2 and proof, p.6.)

*Needs:* [2.7 Measures attached to gauge forms](#27-measures-attached-to-gauge-forms); [2.9 Weil volume and residue point counts](#29-weil-volume-and-residue-point-counts); [2.10 Néron point counts of dual abelian varieties](#210-néron-point-counts-of-dual-abelian-varieties).

### 2.12 Fubini for relative top forms

For a submersion f:X→Y of F-analytic manifolds and r-gauge forms ω_X,ω_Y, there is a unique nowhere-vanishing relative r-fold top form θ on X satisfying f*ω_Y⊗θ=ω_X via det Ω_X≃f*det Ω_Y⊗det Ω_(X/Y). For every absolutely integrable α, ∫_X α dμ_(ω_X)=∫_Y(∫_(X_y) α dμ_(θ_y))dμ_(ω_Y). In the smooth algebraic case θ is algebraic. For a generically smooth map, apply this on its smooth locus and prove the omitted loci null.

Use the determinant exact sequence to divide the two nowhere-vanishing sections on X. In submersion coordinates this is the usual Fubini formula with densities. The r-th root is a positive real density; it does not require an analytic r-th root of a unit. Glue the local formula using absolute integrability and remove only loci justified null by the stated hypotheses.

In submersion coordinates the Fubini comparison is the product-measure Fubini theorem for Haar measure (`MeasureTheory.Measure.addHaar` on F^a×F^b), and the relative determinant line is the exterior-power exact sequence of Kähler differentials, with the relative section on the source. The sign convention is base-first: for a=xy it gives −dx/x. Absolute-value density then agrees with the source’s logarithmic measure.

([Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Geometric stabilisation via p-adic integration*](https://arxiv.org/pdf/1810.06739v2), §2.2, equations (6)–(8), pp.6–7; [Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration*](https://arxiv.org/pdf/1707.06417v3), Proposition 4.1, Claim 4.2, Lemma 4.3, pp.20–21 (published pp.537–538).)

*Needs:* [2.7 Measures attached to gauge forms](#27-measures-attached-to-gauge-forms); [2.8 Positive-codimension loci are null](#28-positive-codimension-loci-are-null); Mathlib `AlgebraicGeometry.IsClosedImmersion`; Mathlib `AlgebraicGeometry.Smooth`; Mathlib `KaehlerDifferential`; [TauCetiRoadmap.SchemeAndStackFoundations, §2.20](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#220-relative-dualising-complexes-and-modules-serre-duality-curve-comparison).

### Examples

For fixed ac(x)=ξ≠0 and ord(x)=a, the ball has mass q⁻ᵃ⁻¹. Summing over q−1 nonzero ξ gives shell mass (1−q⁻¹)q⁻ᵃ. For x=πu, source volume of O is 1 and target volume of πO is q⁻¹, so the substitution factor is |π|. For ω=π²(dx)⊗² the density is |π²|^(1/2)=q⁻¹, rather than q⁻². In the product map a=xy with ω=dx∧dy and η=da, base-first order gives φ=−dx/x because da∧(−dx/x)=dx∧dy; the fibre measure is |dx/x|.

### Dependencies

[1.1 The Denef–Pas language](#11-the-denefpas-language); [1.2 Angular components and valued structures](#12-angular-components-and-valued-structures); [1.3 Relative elimination of valued-field quantifiers](#13-relative-elimination-of-valued-field-quantifiers); [1.5 Finite-formula transfer for large residue characteristic](#15-finite-formula-transfer-for-large-residue-characteristic); Mathlib `AlgebraicGeometry.IsClosedImmersion`; Mathlib `MeasureTheory.Measure.addHaar`; [TauCetiRoadmap.SchemeAndStackFoundations, §2.20](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#220-relative-dualising-complexes-and-modules-serre-duality-curve-comparison); [TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties, §§2.5 and 4.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md#25-functoriality-under-isogeny).

## Layer 3: motivic functions, integration and transfer

Fix the characteristic-zero coefficient field and build residue scissor objects, Presburger coefficients and dimension grades. The integration theorem specifies the pushforward laws, and specialization turns the formal L factors into actual local volumes after a fixed residue-characteristic threshold.

### 3.1 Definable subassignments

Fix a characteristic-zero base field k and named coefficients in k((t)). A definable subassignment of h[m,n,r] assigns to each extension field K/k the subset of K((t))^m×K^n×ℤ^r satisfying one fixed Denef–Pas formula with those coefficients. A map is specified by one uniformly definable graph that is a function in every K. This is a subassignment of point sets; it need not be a subfunctor under arbitrary field extensions because quantified formulas need not be extension invariant. Gluing along finite algebraic charts is a separate global construction.

Assign formula realizations for each extension K with the named ac_t and ord_t structures. Define morphisms by graph formulas with totality and uniqueness in every K. Boolean operations, fibre products and images are defined uniformly by formulas; these are categorical constructions of subassignments, without claiming functoriality in K. For globalization to subassignments of h_W with W=𝒳×X×ℤ^r (𝒳 a k((t))-variety, X a k-variety), cover W by finitely many affine opens U and choose closed embeddings `ι:U↪𝔸^m_{k((t))}×𝔸^n_k×ℤ^r;` then S∩h_U is a definable subassignment of h[m,n,r]. Two closed embeddings of the same U differ by the isomorphism of definable subassignments ι′∘ι⁻¹, whose graph and inverse graph are polynomial on the images, so every construction that is invariant under definable isomorphisms (CL Lemma 15.1.1, p.83) is independent of the embedding. Varieties are separated, so U∩U′ is affine; on overlaps both restrictions are computed in the embedding of U∩U′, and a finite definable partition of S subordinate to the cover, with additivity and extension by zero, glues the local data. Intrinsic K-dimension does not depend on the embedding. This replaces CL's assertion on p.83 that each affine open is isomorphic to an open subset of affine space, which fails in general.

The basic interface must include:

- Evaluate the assigned set in any chosen extension K/k.
- A morphism is a uniformly definable functional graph.
- The image is defined by existential quantification in the fixed language.
- A definable map S′→S induces a fibre-product pullback of subassignments over S.

**Checks.**

- h[0,0,0] assigns one point to every K.
- For ∀y, y²≠−1 the truth set is {⋆} over ℝ and ∅ over ℂ, so the assignment is not a subfunctor for ℝ⊂ℂ. For ∃y, y²=−1 the truth sets instead give the compatible inclusion ∅→{⋆}.
- The VF graph z=x² is a morphism and evaluates to ordinary squaring.
- h[0,1,0](K)=K and h[0,0,1](K)=ℤ; their sorts are not interchangeable.

An affine elliptic curve, for instance y²=x³−x over k((t)), is not isomorphic to an open subset of 𝔸¹ (an open subset of 𝔸¹ has genus zero), so CL's open-coordinate reduction does not apply to it; its closed embedding in 𝔸² does (CL §15.1, p.83).

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §§2.2–2.3, pp.10–12, with definable subassignments of varieties by closed embeddings and finite affine covers in §2.3, p.11; the category GDef_k of global definable subassignments, §2.4, p.12; global volume-form gluing §15.1, pp.82–84.)

*Needs:* [1.1 The Denef–Pas language](#11-the-denefpas-language); [1.3 Relative elimination of valued-field quantifiers](#13-relative-elimination-of-valued-field-quantifiers); Mathlib `AlgebraicGeometry.IsAffineOpen`; Mathlib `Algebra.FiniteType.iff_quotient_mvPolynomial''`; [TauCetiRoadmap.SchemeAndStackFoundations, §0.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#07-local-dimension-and-dimension-theory-of-schemes-of-finite-type-over-a-field).

### 3.2 Residue-field Grothendieck semirings

For S∈Def_k let RDef_S consist of definable maps Y→S with Y⊂S×RF^n for some finite n. Its Grothendieck semiring SK₀(RDef_S) is generated by definable isomorphism classes, with empty class zero, scissor relation [Y]=[Z]+[Y\Z], product by fibre product over S and unit [S]. Its additive group completion K₀(RDef_S) is a ring. Import the existing Tau Ceti general Grothendieck completion and its universal property; construct only this particular definable scissor semiring. These are neither K₀(Var_k) nor a category of Chow motives.

Form the commutative semiring presentation of definable residue objects by isomorphism and scissor relations. Verify fibre product respects those relations. Reuse Algebra.GrothendieckAddGroup with the TauCeti/RingTheory/GrothendieckRing.lean instCommRing, ofRingHom and liftRingHom. Pullback is multiplicative; direct image along residue-sort structure maps is additive with the projection formula, not generally a ring homomorphism.

The basic interface must include:

- [Y]=[Z]+[Y\Z] for a definable subobject Z.
- A map S′→S induces a semiring/ring pullback by fibre product.
- If S→T is a residue-sort object of RDef_T, composition induces additive direct image, satisfying f_!(a·f*b)=f_!(a)·b.
- Additive maps from the scissor semiring to an abelian group extend uniquely to K₀; positivity is not identified with an injective subset of the completion.

**Checks.**

- The empty object has class 0 and [S] is the multiplicative unit over S.
- Over a point, [RF]=[RF×]+1, so the punctured line has class L−1 in the ring.
- The map from two points to one point sends the unit to 2 under direct image; direct image is not unital or multiplicative.
- The product of two residue objects specializes to the Cartesian fibre product count over each base point.

Construct the definable scissor semiring and its maps, and apply the existing general completion from Scope and ownership. Pullback is multiplicative; direct image is additive with the projection formula. The two-point map gives direct image 2 rather than a ring homomorphism (CL §5.1.2, p.28, and §5.6, p.30).

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §5.1.1–5.1.2, pp.26–28 (scissor semiring, completion and maps).)

*Needs:* [3.1 Definable subassignments](#31-definable-subassignments).

### 3.3 The motivic coefficient ring

Let A=ℤ[L,L⁻¹,(1−L^(−i))⁻¹:i∈ℕ, i>0], the iterated localization of ℤ[L] first at L, then at every 1−L^(−i) in that Laurent polynomial ring. For each real q>1 it has a specialization L↦q. A_+ consists of elements nonnegative under every such real specialization; order is pointwise under these specializations. This ring is the coefficient ring for Presburger summation and not an arbitrary completion or inversion of all polynomials.

Use native polynomial/Laurent polynomial localization with its universal property. Each generator of the multiplicative set specializes nonzero when q>1, giving the ring map. Define the positive subsemiring by all these inequalities.

The basic interface must include:

- For q>1, evaluation is a ring homomorphism A→ℝ with L↦q.
- Evaluation of (1−L^(−i))⁻¹ is (1−q^(−i))⁻¹ for i>0.
- a∈A_+ exactly when every real q>1 specialization is nonnegative.
- A coefficient map extends iff it makes L and every required denominator invertible.

**Checks.**

- `∑_{n≥0}q^(−n)=eval_q((1−L⁻¹)⁻¹).`
- q=1 is excluded because 1−L⁻¹ would specialize to zero.
- L−2 is not in A_+, since its value is negative for 1<q<2.
- L, L⁻¹ and 1−L⁻¹ are positive under every permitted specialization.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §4.2, p.19 (the ring A, its evaluations L↦q for real q>1, the order and A_+).)

*Needs:* Mathlib `LaurentPolynomial` with `LaurentPolynomial.isLocalization`, `Localization` and `IsLocalization.lift`.

### 3.4 Presburger constructible functions

For a definable S, let P(S) be the A-algebra of functions generated by constants from A, definable integer-valued functions α:S→ℤ and exponentials L^β for definable β:S→ℤ. Let P_+(S) be its pointwise positive part under all q>1 evaluations. Let P⁰(S) be generated by indicators of definable subsets and L−1, with positive counterpart. The notation P⁰ does not mean all of P and is not obtained by inverting an indicator.

Generate the subalgebra of A-valued pointwise functions by the stated functions. Define the base-change and extension-by-zero maps on generators. Preparation partitions integer fibres into affine congruence cones; summing L^linear times polynomial functions yields the denominators already inverted in A.

The basic interface must include:

- Pullback of α and L^β is composition with a definable map.
- A definable subset contributes its indicator in P⁰ and hence P.
- On the integrable Presburger locus, fibre summation agrees under every q>1 evaluation with absolutely convergent integer summation.
- A nonnegative ray weighted by L^(−n) sums to (1−L⁻¹)⁻¹.

**Checks.**

- Summing over an empty integer fibre gives 0.
- The constant function 1 on ℕ is not summable under any q>1 evaluation.
- L^(−n) on n≥0 has sum (1−L⁻¹)⁻¹.
- The weight L^(−n) on nonnegative even n sums to (1−L⁻²)⁻¹.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §4.2–4.5, pp.19–24; Theorem 4.4.1, p.21.)

*Needs:* [3.3 The motivic coefficient ring](#33-the-motivic-coefficient-ring); [3.1 Definable subassignments](#31-definable-subassignments).

### 3.5 Constructible motivic functions

Define C(S)=K₀(RDef_S)⊗_(P⁰(S))P(S), with the map from P⁰ sending indicators to their definable residue classes and L−1 to the punctured residue line. Define C_+(S) by the corresponding semiring tensor product with SK₀ and P_+. Keep the canonical map C_+→C without assuming it injective. Pullback is a ring map; any pushforward is an additive partially defined operation constrained by integrability.

Construct the common P⁰-algebra structures, check indicator scissor relations, and form the semiring and ring tensor products. Use the tensor universal property for pullback and for the two elementary auxiliary-sort pushforwards, with their projection formula.

The basic interface must include:

- A common P⁰ generator acts identically from either tensor factor.
- Definable pullback is a ring map respecting residue and Presburger generators.
- The canonical positive-to-ring map is used without an injectivity claim.
- Projection along RF variables is additive class composition, with the projection formula; it is not multiplicative.

**Checks.**

- An indicator taken from either tensor factor has the same class in C(S).
- The residue affine-line class equals L and its punctured-line class equals L−1.
- Pushing 1 from two residue points gives 2, so a ring-homomorphism pushforward definition is rejected.
- C(∅) has only the zero function class.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §5.2, pp.28–29; §5.3–5.8, pp.29–35.)

*Needs:* [3.2 Residue-field Grothendieck semirings](#32-residue-field-grothendieck-semirings); [3.4 Presburger constructible functions](#34-presburger-constructible-functions); [3.3 The motivic coefficient ring](#33-the-motivic-coefficient-ring).

### 3.6 Dimension-graded constructible Functions

For X∈Def_k let C^≤d(X) be the ideal generated by indicators of definable subassignments of VF-dimension ≤d, define C^d(X)=C^≤d(X)/C^≤d−1(X), and set the graded group of constructible Functions to ⊕_d C^d(X); define the positive and relative variants in the source semigroup sense. Relative dimension is measured fibrewise over the fixed base. A graph over a d-dimensional VF base has absolute dimension d and relative dimension zero over that base; it is zero in a larger ambient Haar grade, not in its own absolute grade.

Generate the filtration ideals by indicators of definable subassignments with the specified VF-dimension bound, then take their graded quotients. Define relative dimension on fibres and prove invariance under the specified definable isomorphisms using cell decomposition.

The basic interface must include:

- A function supported in VF-dimension ≤d determines a degree-d Function.
- Its degree-d class vanishes if its support has VF-dimension <d.
- Relative grading uses fibre dimension over the declared base, not total dimension.
- Restriction respects support filtrations and hence the graded object.

**Checks.**

- A singleton has nonzero counting contribution in degree zero.
- The same singleton is zero in degree one; this does not erase its degree-zero class.
- A graph over a d-dimensional base has relative dimension zero and total dimension d.
- The empty-support class is zero in every degree.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §6.1–6.2, pp.35–36; §10.1, pp.59–60.)

*Needs:* [3.5 Constructible motivic functions](#35-constructible-motivic-functions); [2.2 Cell decomposition and preparation](#22-cell-decomposition-and-preparation).

### 3.7 Cluckers–Loeser motivic pushforward

For a fixed base S∈Def_k there is a unique assignment of integrable graded positive Functions I_SC_+(X)⊂C_+(X), together with additive pushforwards f_! for every definable f:X→Y over S, satisfying CL Theorem 10.1.1 A0–A8: composition and integrability Fubini, disjoint additivity, projection formula, extension by zero, residue-field class pushforward, Presburger summation, one-cell volume L^(−α−1), and graph/Jacobian normalization. Extend to the group-valued integrable theory as in §13.2, with the relative extension in Theorem 14.1.1. Pushforwards are not ring homomorphisms.

First define one-dimensional VF integration by prepared cells, using the displayed volume and graph factors; prove independence of presentations through common refinements. Compare the two orders of integration on (0,0), (0,1), (1,0) and (1,1) bicells. In the ball-to-ball case use the Jacobian preparation theorem, §2.5(b) in regime (ii) (characteristic-zero K). This is the key two-variable Fubini step. Iterate coordinate projections and use Fubini to make the result independent of ordering. Factor a definable map as its graph inclusion followed by a projection, then verify A0–A8. Pass from positive to group-valued integrable Functions without asserting injectivity of positive classes.

The proof includes general graph factorization, bicell Fubini, independence of variable order and the signed integrability extension; CL §§11–14 gives this construction, and the uniqueness axioms alone do not prove existence. Integration of volume forms on varieties (CL §15.1, pp.82–84) uses the closed-embedding globalization of §3.1 in place of CL's open-coordinate charts, with Lemma 15.1.1 for embedding independence.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), Theorem 10.1.1, pp.59–60; construction §11, pp.61–73; signed extension §13.2, p.77; relative Theorem 14.1.1, p.78.)

*Needs:* [3.6 Dimension-graded constructible Functions](#36-dimension-graded-constructible-functions); [3.5 Constructible motivic functions](#35-constructible-motivic-functions); [3.4 Presburger constructible functions](#34-presburger-constructible-functions); [2.1 Denef–Pas cells and presentations](#21-denefpas-cells-and-presentations); [2.5 Jacobian change of variables](#25-jacobian-change-of-variables).

### 3.8 Motivic change of variables and Fubini

For a definable isomorphism f:X→Y of pure equal VF-dimension and an integrable graded Function φ on Y, its pullback weighted by L^(−ordjac f) is integrable and has the same integral over X as φ over Y. For composable definable maps, integrability and iterated pushforward satisfy the A0(c) Fubini equivalence. State relative and global variants with their fixed base and dimension conventions; lower-dimensional exceptional sets are removed only in the appropriate grade.

The definable regularity used is §2.5(b) in regime (ii), over the fields K((t)) with char K=0. Apply graph factorization and the graph axiom to the isomorphism and its inverse. Use functoriality to compare the two projections from the graph, retaining the Jacobian grade. Apply A0(c) for the Fubini integrability equivalence.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), Theorem 12.1.1, p.74; relative Theorem 14.1.1 A0(c), p.78.)

*Needs:* [3.7 Cluckers–Loeser motivic pushforward](#37-cluckersloeser-motivic-pushforward); [3.6 Dimension-graded constructible Functions](#36-dimension-graded-constructible-functions); [2.5 Jacobian change of variables](#25-jacobian-change-of-variables).

### 3.9 Specialization to local-field integrals

Fix the source coefficient datum, formulas and uniformizer interpretations. For φ in the source relative motivic integrable class over a definable parameter base, some N makes every allowed local field K of residue characteristic >N satisfy (∫φ)_K=∫φ_K at every permitted parameter, with integrability. This is Theorem 9.1.5 for all allowed local fields. Theorem 9.1.6 additionally gives specialization compatibility with a fixed general definable pushforward over the characteristic-zero local-field class A_O. Specialization sends L to q_K and residue classes to fibre cardinalities. No computable N is asserted.

Define specialization on the two tensor factors and verify the common P⁰ relations. Cell-by-cell, the motivic annulus factor becomes q^(−α−1), the RF class becomes its fibre count, and the VG sum becomes the convergent integer sum. Exclude the finitely many residue characteristics needed by the chosen formula reductions and coefficients, including the bound of §2.5(b) regime (iii) for the Jacobian data of the fixed pushforwards. Compare iterated coordinate pushforwards, using Fubini.

([Raf Cluckers and François Loeser, *Constructible exponential functions, motivic Fourier transform and transfer principle*](https://arxiv.org/pdf/math/0512022), Notation 9.1.1, p.40; Theorem 9.1.5, p.43; Theorem 9.1.6, p.44.)

*Needs:* [3.7 Cluckers–Loeser motivic pushforward](#37-cluckersloeser-motivic-pushforward); [3.5 Constructible motivic functions](#35-constructible-motivic-functions); [2.4 Constructible local integration](#24-constructible-local-integration).

### 3.10 Transfer of integral identities

For a fixed compatible coefficient datum and fixed integrable constructible data φ,ψ in a definable parameter family, there exists N such that, for allowed local fields K₁,K₂ of residue characteristics >N with isomorphic residue fields compatibly with that datum, the identity φ_(K₁)(s)=ψ_(K₁)(s) for every s in its parameter domain holds iff the corresponding universal identity holds over K₂. Apply this to specialized motivic pushforwards. This is transfer of a universally quantified identity, not pointwise equality between unrelated VF parameter sets.

Express the obstruction to a universal identity as the nonvanishing of a fixed constructible specialization. Use the source transfer theorem for that constructible datum, then apply specialization compatibility to replace motivic pushforwards by local integrals. Track coefficient compatibility, all parameters and the union of exceptional-prime bounds. No bijection of VF parameter spaces is introduced.

([Raf Cluckers and François Loeser, *Constructible exponential functions, motivic Fourier transform and transfer principle*](https://arxiv.org/pdf/math/0512022), Theorem 9.2.4, p.46, with §9.1 conventions.)

*Needs:* [3.9 Specialization to local-field integrals](#39-specialization-to-local-field-integrals); [1.5 Finite-formula transfer for large residue characteristic](#15-finite-formula-transfer-for-large-residue-characteristic).

### 3.11 Geometric realizations remain distinct

Let M_loc be the localization of TriangulatedK0(DM_gm(k,ℚ)) at the classes [ℚ(1)] and 1−[ℚ(−i)] for all i>0. Construct the residue motivic realization: `SK₀(RDef_k)⊗_{ℕ[𝕃−1]}A₊→M_loc` as the composite of the change of theory from the empty theory to algebraically closed fields (CL Proposition 16.1.1), the identification of K₀ of residue objects over algebraically closed fields with K₀(Var_k) by Chevalley constructibility (CL §16.2), the canonical map γ into `K₀(Var_k)⊗_{ℤ[𝕃]}A` (CL §16.3), and χ^c⊗A, which sends 𝕃 to [ℚ(1)] and each denominator 1−𝕃^(−i) to the invertible class 1−[ℚ(−i)]. Invertibility holds by construction of M_loc; no injectivity is asserted, and M_loc may be smaller than expected. There is no automatic equality between K₀(RDef), K₀(Var), Chow-motive Grothendieck rings and the coefficient ring C(S). No such realization is required for the point-count specialization theorem.

The composite respects definable isomorphisms, scissor relations and products because each factor does: theory change is a ring map, Chevalley constructibility identifies residue objects with constructible sets, and χ^c is a ring homomorphism with the scissor relation (MotivesAndAlgebraicCycles §4.20). The localization universal property extends it to the inverted classes. The realization of 𝔾_m is [ℚ(1)]−1 and of ℙ¹ is 1+[ℚ(1)]; an odd shift would introduce a sign, the even shift [2] in the Lefschetz object does not.

The general definable residue quotient is not declared identical to a variety class. A Lefschetz inversion is specified before its realization map is extended.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), Proposition 16.1.1, p.88; §16.2, p.88; §16.3, p.89.)

*Needs:* [3.2 Residue-field Grothendieck semirings](#32-residue-field-grothendieck-semirings); [3.5 Constructible motivic functions](#35-constructible-motivic-functions); [3.3 The motivic coefficient ring](#33-the-motivic-coefficient-ring); [TauCetiRoadmap.MotivesAndAlgebraicCycles, §4.20](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md#420-the-scissor-ring-and-motivic-measure).

### Examples

The residue affine line specializes to q points. A one-cell of order a and one angular component specializes from L⁻ᵃ⁻¹ to q⁻ᵃ⁻¹. A singleton has zero class in the ambient one-dimensional grade but survives in its intrinsic zero-dimensional grade. The direct image of the constant 1 along a two-point map is 2: its square is 4, whereas the direct image of 1·1 remains 2.

### Dependencies

[1.1 The Denef–Pas language](#11-the-denefpas-language); [1.3 Relative elimination of valued-field quantifiers](#13-relative-elimination-of-valued-field-quantifiers); [TauCetiRoadmap.SchemeAndStackFoundations, §0.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#07-local-dimension-and-dimension-theory-of-schemes-of-finite-type-over-a-field); [2.2 Cell decomposition and preparation](#22-cell-decomposition-and-preparation); [2.1 Denef–Pas cells and presentations](#21-denefpas-cells-and-presentations); [2.5 Jacobian change of variables](#25-jacobian-change-of-variables); [2.4 Constructible local integration](#24-constructible-local-integration); [1.5 Finite-formula transfer for large residue characteristic](#15-finite-formula-transfer-for-large-residue-characteristic); [TauCetiRoadmap.MotivesAndAlgebraicCycles, §4.20](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md#420-the-scissor-ring-and-motivic-measure); Mathlib `LaurentPolynomial`, `Localization` and `IsLocalization.lift`.

## Layer 4: Diophantine normal forms and arithmetic definability

First compare native polynomial functions with integer polynomial syntax and compress only the existential witnesses. Effective coding and Diophantine exponentiation then give MRDP and integer undecidability. The rational branch uses quaternion trace images and semilocal rings to obtain universal integer predicates, with existential integer definability kept conditional.

### 4.1 Integer polynomials as native polynomial functions

For every type α, construct the ring homomorphism Tα from MvPolynomial α ℤ to Poly α which sends each integer constant c to Poly.const(c) and each variable Xᵢ to Poly.proj(i). Its underlying function evaluates the polynomial on natural assignments after casting them to integers.

α and β are arbitrary types, possibly empty or infinite. Natural-number assignments are cast coordinatewise to integers. Additional hypotheses are stated explicitly.

Use the existing commutative ring on Poly α; the integer cast there is its constant constructor. Apply MvPolynomial.eval₂Hom to Int.castRingHom and Poly.proj. This supplies the ring-map laws without a second ring structure. The constant and variable API laws follow directly from eval₂Hom_C and eval₂Hom_X'. Evaluate pointwise using Poly.ext, const_apply and proj_apply; the key evaluation theorem identifies the map with the intended polynomial function. No second polynomial carrier is introduced.

The basic interface must include:

- Tα(C c) = Poly.const(c) for every integer c.
- Tα(Xᵢ) = Poly.proj(i).
- For p and a natural assignment x, Tα(p)(x) = p evaluated at the integer casts of x.
- Tα(p+q)=Tα(p)+Tα(q).
- Tα(pq)=Tα(p)Tα(q).
- Tα(p−q)=Tα(p)−Tα(q), using integer subtraction.
- If Tα(p) and Tα(q) agree at every natural assignment, they are equal as native Poly elements.

**Checks.**

- With no variables, the image of constant −3 evaluates to −3 on the unique assignment.
- At (1,3), the image of X₀−2X₁ has value −5, not a truncated natural difference.
- Evaluation agrees with native MvPolynomial.eval at every natural assignment cast to integers.
- The images of X₀ and X₁ in two variables differ: assignment (0,1) distinguishes them.

([Cameron Freer, *Hilbert10 polynomial bridge*](https://github.com/cameronfreer/hilbert10/blob/25b42fcd6c6c5af710c514638a6fcb4e22d00a30/Hilbert10/PolyBridge.lean), toDiophPoly and its evaluation lemmas; [Bjorn Poonen, *Undecidability in number theory*](https://math.mit.edu/~poonen/papers/h10_notices.pdf), Definition 1 and footnote 4, author-copy p.2.)

*Needs:* Mathlib `Poly`; Mathlib `Poly.proj`; Mathlib `Poly.const`; Mathlib `MvPolynomial.eval₂Hom`; Mathlib `Int.castRingHom`; Mathlib `MvPolynomial.eval₂Hom_C`; Mathlib `MvPolynomial.eval₂Hom_X'`; Mathlib `Poly.ext`; Mathlib `Poly.const_apply`; Mathlib `Poly.proj_apply`.

### 4.2 Evaluation on natural assignments

For p in MvPolynomial α ℤ and x:α→ℕ, Tα(p)(x) = eval(cast∘x,p), where cast is the natural embedding into ℤ.

α and β are arbitrary types, possibly empty or infinite. Natural-number assignments are cast coordinatewise to integers. Additional hypotheses are stated explicitly.

Induct on p by MvPolynomial.induction_on. The constant case uses the parent constant API law and Poly.const_apply. For addition use the ring-map law and Poly.add_apply. For multiplication by Xᵢ use the ring-map law, the parent variable API law, Poly.mul_apply and Poly.proj_apply. Each step matches native polynomial evaluation.

Negative coefficients and products give their integer values.

([Cameron Freer, *Hilbert10 polynomial bridge*](https://github.com/cameronfreer/hilbert10/blob/25b42fcd6c6c5af710c514638a6fcb4e22d00a30/Hilbert10/PolyBridge.lean), toDiophPoly and its evaluation lemmas; [Bjorn Poonen, *Undecidability in number theory*](https://math.mit.edu/~poonen/papers/h10_notices.pdf), Definition 1 and footnote 4, author-copy p.2.)

*Needs:* [4.1 Integer polynomials as native polynomial functions](#41-integer-polynomials-as-native-polynomial-functions); Mathlib `MvPolynomial.induction_on`; Mathlib `Poly.const_apply`; Mathlib `Poly.proj_apply`; Mathlib `Poly.add_apply`; Mathlib `Poly.mul_apply`.

### 4.3 Every native polynomial has integer polynomial syntax

The map Tα is surjective for every type α.

α and β are arbitrary types, possibly empty or infinite. Natural-number assignments are cast coordinatewise to integers. Additional hypotheses are stated explicitly.

Apply Poly.induction with the proposition that a preimage under Tα exists. Projection and constant cases use Xᵢ and C c and the separate comparison nodes. For subtraction and multiplication, take the corresponding operation on the two existing preimages. The ring-map laws prove the required equality. The induction is into a proposition, so it is permitted by native Poly.induction. This does not construct a computable extraction procedure from an extensional function.

No finite input-type hypothesis. No executable syntax recovery is claimed.

([Cameron Freer, *Hilbert10 polynomial bridge*](https://github.com/cameronfreer/hilbert10/blob/25b42fcd6c6c5af710c514638a6fcb4e22d00a30/Hilbert10/PolyBridge.lean), exists_mvPolynomial and its constructor induction; [Bjorn Poonen, *Undecidability in number theory*](https://math.mit.edu/~poonen/papers/h10_notices.pdf), Definition 1 and footnote 4, author-copy p.2.)

*Needs:* [4.1 Integer polynomials as native polynomial functions](#41-integer-polynomials-as-native-polynomial-functions); Mathlib `Poly.induction`.

### 4.4 Polynomial identity from natural assignments

The map Tα is injective for every type α.

α and β are arbitrary types, possibly empty or infinite. Natural-number assignments are cast coordinatewise to integers. Additional hypotheses are stated explicitly.

Let Tα(p)=Tα(q). By the evaluation theorem of §4.2 their evaluations agree on all tuples of natural numbers. For every variable use the subset of ℤ which is the image of the natural embedding. Nat.cast_injective and Set.infinite_range_of_injective prove each side of this Cartesian box is infinite. For a tuple in this box, choose a natural preimage in every coordinate and apply the assumed equality. MvPolynomial.funext_set over the integral domain ℤ now gives p=q. The empty index type is covered by the same statement.

X(X−1) is distinguished from zero by assignment 2, even though both vanish at 0 and 1.

([The Mathlib contributors, *Multivariate polynomial extensionality on infinite boxes*](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/MvPolynomial/Funext.lean), funext_set, lines 51–74; [Bjorn Poonen, *Undecidability in number theory*](https://math.mit.edu/~poonen/papers/h10_notices.pdf), Definition 1 and footnote 4, author-copy p.2.)

*Needs:* [4.2 Evaluation on natural assignments](#42-evaluation-on-natural-assignments); Mathlib `MvPolynomial.funext_set`; Mathlib `Nat.cast_injective`; Mathlib `Set.infinite_range_of_injective`.

### 4.5 Polynomial ring equivalence

For every α, bundle Tα as a ring equivalence Eα: MvPolynomial α ℤ ≃ Poly α. Its inverse sends a native polynomial function to the unique multivariate integer polynomial with the same values on every natural assignment. The inverse is classical and carries no computability assertion.

α and β are arbitrary types, possibly empty or infinite. Natural-number assignments are cast coordinatewise to integers. Additional hypotheses are stated explicitly.

Combine the separately proved injectivity and surjectivity into bijectivity. Apply RingEquiv.ofBijective. Record that the resulting forward ring map is exactly Tα. Its inverse laws and algebraic compatibility are inherited from the ring equivalence. Evaluate Eα(Eα⁻¹(f))=f and apply the evaluation theorem of §4.2 to obtain the inverse evaluation law. Uniqueness follows from injectivity, not from a chosen syntactic representative.

The basic interface must include:

- The forward ring map of Eα is Tα.
- Evaluating Eα⁻¹(f) at the integer casts of x gives f(x).
- Eα⁻¹(Poly.const(c))=C c for every integer c.
- Eα⁻¹(Poly.proj(i))=Xᵢ.
- Eα⁻¹(f+g)=Eα⁻¹(f)+Eα⁻¹(g).
- Eα⁻¹(fg)=Eα⁻¹(f)Eα⁻¹(g).
- Eα⁻¹(Eα(p))=p.
- Eα(Eα⁻¹(f))=f.
- For any map h:α→β, Eβ(rename(h,p))=Poly.map(h,Eα(p)); injectivity of h is not required. Compare values using the evaluation law, native Poly.map_apply and MvPolynomial.eval_rename on both sides.

**Checks.**

- With no variables, E⁻¹(Poly.const(−7)) is C(−7).
- In two variables, E⁻¹(Poly.proj(0)·Poly.proj(1)) is X₀X₁.
- For every native f and natural assignment x, eval(cast∘x,E⁻¹(f))=f(x).
- E(X₀(X₀−1)) is nonzero: its value at 2 is 2. Sampling only a Boolean grid is insufficient.
- Collapsing both variables of X₀−X₁ to one variable gives zero on both sides of renaming compatibility; swapping coordinates at (2,5) gives 5−2=3 on both sides.

([Mario Carneiro and the Mathlib contributors, *Diophantine functions and Matiyasevic’s theorem: native Poly and Dioph*](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/Dioph.lean), Poly, Poly.induction and the comparison its comments record as missing, lines 48–51,93,197–204,226–234; [Bjorn Poonen, *Undecidability in number theory*](https://math.mit.edu/~poonen/papers/h10_notices.pdf), Definition 1 and footnote 4, author-copy p.2.)

*Needs:* [4.1 Integer polynomials as native polynomial functions](#41-integer-polynomials-as-native-polynomial-functions); [4.3 Every native polynomial has integer polynomial syntax](#43-every-native-polynomial-has-integer-polynomial-syntax); [4.4 Polynomial identity from natural assignments](#44-polynomial-identity-from-natural-assignments); [4.2 Evaluation on natural assignments](#42-evaluation-on-natural-assignments); Mathlib `RingEquiv.ofBijective`.

### 4.6 Finite witness support with fixed inputs

For a commutative semiring R and p in MvPolynomial (α⊕β) R, there exist a finite subset t of β and q in MvPolynomial (α⊕t) R such that p=rename(idα⊕inclusion,q). Every input variable is left unchanged.

α and β are arbitrary types, possibly empty or infinite. Natural-number assignments are cast coordinatewise to integers. Additional hypotheses are stated explicitly.

Apply MvPolynomial.exists_finset_rename to p, obtaining a finite set s of sum variables and a polynomial r on s. Put t=Finset.toRight(s). Map each element of s to α⊕t: an input inl(a) goes to inl(a); a witness inr(b) goes to inr(b), with its membership in t supplied by Finset.mem_toRight. Rename r by this map to form q. The composite with idα⊕inclusion is the original inclusion of s, so MvPolynomial.rename_rename gives p=rename(idα⊕inclusion,q).

No domain or characteristic assumption on R. No finite input-type assumption. A polynomial involving only inputs admits t empty.

(Mathlib MvPolynomial.exists_finset_rename and the fixed-input support proof of §4.6; [Bjorn Poonen, *Undecidability in number theory*](https://math.mit.edu/~poonen/papers/h10_notices.pdf), Definition 1 and footnote 4, author-copy p.2.)

*Needs:* Mathlib `MvPolynomial.exists_finset_rename`; Mathlib `Finset.toRight`; Mathlib `Finset.mem_toRight`; Mathlib `MvPolynomial.rename`; Mathlib `MvPolynomial.rename_rename`.

### 4.7 Finite witness enumeration

For a commutative semiring R and p in MvPolynomial (α⊕β) R, there exist m∈ℕ, an injective map h:Fin m→β, and q in MvPolynomial (α⊕Fin m) R with p=rename(idα⊕h,q).

α and β are arbitrary types, possibly empty or infinite. Natural-number assignments are cast coordinatewise to integers. Additional hypotheses are stated explicitly.

Apply §4.6 to obtain t and its polynomial q₀. Choose e:t≃Fin(card t) using Fintype.equivFin. Set h=inclusion∘e⁻¹ and rename q₀ by idα⊕e. The chosen h is injective because e⁻¹ and subtype inclusion are injective. Use MvPolynomial.rename_rename and the inverse laws of e to verify the displayed identity.

If β is empty the witness block has size zero. Inputs are not silently permuted when witnesses are numbered.

(Mathlib MvPolynomial.exists_finset_rename and the fixed-input support proof of §4.6; [Bjorn Poonen, *Undecidability in number theory*](https://math.mit.edu/~poonen/papers/h10_notices.pdf), Definition 1 and footnote 4, author-copy p.2.)

*Needs:* [4.6 Finite witness support with fixed inputs](#46-finite-witness-support-with-fixed-inputs); Mathlib `Fintype.equivFin`; Mathlib `MvPolynomial.rename_rename`.

### 4.8 Preservation of existential natural roots

Let h:Fin m→β be injective, q∈ℤ[α⊕Fin m], and x:α→ℕ. There exists y:β→ℕ with rename(idα⊕h,q)(x,y)=0 if and only if there exists z:Fin m→ℕ with q(x,z)=0. All evaluations cast naturals into integers.

α and β are arbitrary types, possibly empty or infinite. Natural-number assignments are cast coordinatewise to integers. Additional hypotheses are stated explicitly.

Given y, restrict it to z=y∘h. MvPolynomial.eval_rename proves the evaluations agree. Given z, use Function.extend(h,z,0) as a β-assignment. Function.Injective.extend_apply gives y(h(j))=z(j), so the same evaluation identity gives a root of the renamed polynomial. The default zero supplies all unused witnesses, including when m=0. No surjectivity of h is needed.

For q(u,v)=u−v−1, collapsing both witnesses makes the equation unsatisfiable although q has natural roots; the injectivity hypothesis cannot be dropped.

([Cameron Freer, *Hilbert10 finite Diophantine normal form*](https://github.com/cameronfreer/hilbert10/blob/25b42fcd6c6c5af710c514638a6fcb4e22d00a30/Hilbert10/NormalForm.lean), dioph_iff_exists_fin_mvPolynomial, key equality and witness extension; [Bjorn Poonen, *Undecidability in number theory*](https://math.mit.edu/~poonen/papers/h10_notices.pdf), Definition 1 and footnote 4, author-copy p.2.)

*Needs:* Mathlib `MvPolynomial.eval_rename`; Mathlib `Function.extend`; Mathlib `Function.Injective.extend_apply`.

### 4.9 Finite Diophantine normal form

For every type α and S⊆(α→ℕ), native Dioph(S) holds exactly when there are m∈ℕ and p∈MvPolynomial (α⊕Fin m) ℤ such that, for every input x, x∈S if and only if there exists y:Fin m→ℕ with eval(cast∘Sum.elim(x,y),p)=0. This holds without assuming α finite.

α and β are arbitrary types, possibly empty or infinite. Natural-number assignments are cast coordinatewise to integers. Additional hypotheses are stated explicitly.

Unpack native Dioph(S) as a polynomial function f on α⊕β and its existential-root characterization. Apply the inverse of the ring equivalence of §4.5 to obtain integer polynomial syntax with exactly the same values. Apply §4.7 to that polynomial. Then §4.8 replaces the arbitrary β-witness block by Fin m while fixing x; this proves the forward implication. For the reverse implication in universe zero use witness type Fin m and native polynomial T(p). Apply the evaluation theorem of §4.2. For an arbitrary input universe use the witness type ULift(Fin m) at that universe and rename p along idα⊕ULift.up before applying T. Lifting or lowering assignments gives the same existential condition by MvPolynomial.eval_rename. This is a mathematical existential normal form, not a computable procedure for recovering p or m from a proof of native Dioph. Computable encodings and the MRDP simulation are §§4.10–4.15.

Even natural inputs are represented by X−2Y. A nonzero constant polynomial has no root, including with zero inputs and witnesses. The statement specializes both to finite tuples and to α=ℕ. Zero witness variables means a polynomial condition, not automatic truth.

([Cameron Freer, *Hilbert10 finite Diophantine normal form*](https://github.com/cameronfreer/hilbert10/blob/25b42fcd6c6c5af710c514638a6fcb4e22d00a30/Hilbert10/NormalForm.lean), dioph_iff_exists_fin_mvPolynomial and dioph_iff_exists_finite_mvPolynomial; [Bjorn Poonen, *Undecidability in number theory*](https://math.mit.edu/~poonen/papers/h10_notices.pdf), Definition 1 and footnote 4, author-copy p.2.)

*Needs:* [4.5 Polynomial ring equivalence](#45-polynomial-ring-equivalence); [4.2 Evaluation on natural assignments](#42-evaluation-on-natural-assignments); [4.7 Finite witness enumeration](#47-finite-witness-enumeration); [4.8 Preservation of existential natural roots](#48-preservation-of-existential-natural-roots); Mathlib `Dioph`; Mathlib `MvPolynomial.eval_rename`.

### 4.10 Effective polynomial and witness coding

Choose a primitive-recursive finite syntax for integer-coefficient polynomials in finitely many free and witness variables. Decode into MvPolynomial and prove evaluation agrees with a computable syntax evaluator on natural and integer assignments. Enumerate witness tuples by a native computable encoding of finite tuples. Any effective input carries its finite syntax explicitly. A bare native Poly is a function with a propositional polynomiality certificate, so neither its classical polynomial representative nor Poly.induction into Prop is a computable reification algorithm.

Encode constants, variables, addition and multiplication, and signed coefficients; prove decoding and evaluation by structural recursion. Enumerate finite witness tuples and dovetail across arities and steps. Prove each actual solution is eventually visited. An explicit finite code gives both its decoded MvPolynomial and, by the syntax evaluation map, its native Poly with the same values. Conversely the classical comparison gives existence of a representative for a bare Poly, with no computability assertion. Normalize by recursion only on supplied code; no algorithm takes arbitrary native functions as input.

The basic interface must include:

- Decoded syntax and its computable evaluator have identical integer values.
- Every finite tuple occurs in the effective witness enumeration.
- Given an explicit finite polynomial code, recursively normalize that code and preserve evaluation and free/witness variable order. A code representing a native Poly is supplied with an evaluation certificate; no computable map from arbitrary Poly is asserted.

**Checks.**

- The code for X−2 evaluates to −2 at zero, retaining signed coefficients.
- The code for free X−witness Y distinguishes the two variable blocks.
- An empty witness block is evaluated once; it is not interpreted as an empty search space.
- A bare Poly with only its IsPoly proof supplies no executable constructor tree. The code-level algorithms require a supplied finite code; the classical comparison asserts representation existence only.

([Martin Davis, *Hilbert’s tenth problem is unsolvable*](https://doi.org/10.2307/2318447), §7, pp.260–261; §8, pp.262–264.)

*Needs:* [4.9 Finite Diophantine normal form](#49-finite-diophantine-normal-form); Mathlib `REPred`.

### 4.11 Diophantine sets are recursively enumerable

For each n and S⊆ℕ^n, native Dioph S implies native REPred (fun x => x∈S), using an effective encoding of Fin n→ℕ. The construction is uniform in a finite polynomial code and witness arity. The analogous finite-system result over ℤ holds with integer witnesses.

Dovetail the witness enumeration, evaluate the coded polynomial, and halt precisely on a zero. Prove termination iff a finite witness exists; the zero-witness case reduces to a computable equality.

([Martin Davis, *Hilbert’s tenth problem is unsolvable*](https://doi.org/10.2307/2318447), §8, Definition 8.1 and Theorem 8.1 with the witness-search direction of its proof, p.264; code enumeration §7, pp.260–261.)

*Needs:* [4.10 Effective polynomial and witness coding](#410-effective-polynomial-and-witness-coding); Mathlib `REPred`; [4.9 Finite Diophantine normal form](#49-finite-diophantine-normal-form).

### 4.12 Diophantine sequence number theorem

There is a Diophantine relation Seq(i,u,a) on positive integers that is single-valued in a and codes every prescribed finite list: for every a₁,…,a_n>0 some u satisfies Seq(i,u,a_i) for 1≤i≤n. The zero-based natural version shifts indices and entries explicitly. Its finite-list surjectivity is sufficient; no unique code or total decoder on malformed codes is assumed.

Use the positive pairing P(x,y)=T(x+y−2)+y and its polynomial inverse graph; keep the possible zero remainder represented by the positive modulus itself. The target relation may restrict to the legal decoding cases. Choose y larger than all desired positive entries and divisible by 1,…,n. The moduli 1+iy are pairwise coprime: any common prime divides i−j and hence y, a contradiction. Iterate native CRT, choose a positive x with the required remainders and put u=P(x,y). The remainder graph is a finite polynomial system with inequalities expressed by positive or natural slack variables; combine equations by sums of squares. Shift indices and entries explicitly for the zero-based natural interface. Factorial, binomial and AP-product representability is used in §4.13, not needed for this elementary coding theorem.

([Martin Davis, *Hilbert’s tenth problem is unsolvable*](https://doi.org/10.2307/2318447), §1, Theorem 1.1 and Theorems 1.2–1.3 with complete CRT proof, pp.236–238; with the positive-domain pairing convention stated here.)

*Needs:* Mathlib `Nat.chineseRemainder`.

### 4.13 Bounded universal Diophantine closure

For a Diophantine predicate P(x,i) on natural tuples, the predicate ∀i<n, P(x,i) is Diophantine, uniformly in a finite representation of P. The polynomial witness block has fixed finite arity for that representation; a varying tuple of individual witnesses is compressed by the sequence number theorem. Include n=0 as the true predicate.

Bound the finitely many witnesses at a given input by one auxiliary integer and encode their list. Using native Dioph.pow_dioph, derive Davis Theorem 4.1: binomial coefficients from the large-base binomial expansion and remainder, factorials from the large-binomial floor estimate, and products of an arithmetic progression from their binomial congruence. Then apply Lemmas 5.1–5.2: one bound for all witnesses, factorial moduli 1+kt, CRT encoding, and divisibility by their product replace the bounded universal block. Keep this non-routine construction inside the key theorem; every step is explicit, so tracking codes through it gives the uniform effective form. Convert the resulting finite system to one polynomial over ℕ or ℤ by sums of squares, preserving the positive-to-natural shift.

([Martin Davis, *Hilbert’s tenth problem is unsolvable*](https://doi.org/10.2307/2318447), §4, Theorem 4.1 and Lemmas 4.1–4.7, pp.249–252; §5, Theorem 5.1 and Lemmas 5.1–5.2 with final reduction, pp.253–256.)

*Needs:* [4.12 Diophantine sequence number theorem](#412-diophantine-sequence-number-theorem); Mathlib `Dioph.pow_dioph`.

### 4.14 Diophantine computation graphs

Every partial recursive function on natural tuples has a Diophantine graph. For minimization, certify defined unequal previous values at all earlier indices and the equal values at the least successful index; divergence at an earlier index must not be silently accepted. For a semidecidable predicate, project the graph of a machine that halts precisely on its members.

Prove graph closure under initial functions and composition using the native Dioph closure operations. Encode a primitive-recursive run by one sequence code and enforce its transition relation with bounded universal closure. For minimization retain all earlier defined outputs and their inequality. Translate the source recursive presentation to native Partrec by its generating constructors.

Prove equivalence between the source’s positive recursive presentation and native Partrec, including a uniform code translation. Davis Theorem 6.1 concerns total positive-integer functions. A native partial computation trace must certify defined outputs and defined earlier values during minimization; an undefined earlier computation cannot be skipped.

([Martin Davis, *Hilbert’s tenth problem is unsolvable*](https://doi.org/10.2307/2318447), §6, Theorem 6.1 and proof, pp.257–260 (total positive-integer functions); §8, Theorem 8.1, p.264; the comparison with native partial recursion is part of this target.)

*Needs:* [4.12 Diophantine sequence number theorem](#412-diophantine-sequence-number-theorem); [4.13 Bounded universal Diophantine closure](#413-bounded-universal-diophantine-closure); Mathlib `REPred`; Mathlib `Dioph.pow_dioph`.

### 4.15 Matiyasevich–Robinson–Davis–Putnam theorem

For every n and S⊆(Fin n→ℕ), native REPred membership is equivalent to native Dioph S, hence equivalent to a finite existential natural-root representation by one integer-coefficient multivariate polynomial. The forward construction is effective from a program code; the reverse construction is effective from a polynomial code. No rational-witness analogue is asserted.

Represent semidecision by the projected halting computation graph. Compress all finite witnesses into the native polynomial normal form. Use the witness search theorem for the converse. Track code transformations so that the undecidability reduction below is many-one computable.

The code-level comparison with native Partrec (§4.14) and the uniform bounded-universal translation (§4.13) are part of the proof. Existing Diophantine exponentiation and a classical polynomial inverse do not supply them. The Lean milestone `Diophantine.mrdp` uses native REPred on finite tuples, exactly as this statement requires.

The acceptance signature is `Diophantine.mrdp` in Suggested.lean.

([Martin Davis, *Hilbert’s tenth problem is unsolvable*](https://doi.org/10.2307/2318447), §8, Definition 8.1, Theorem 8.1 and proof, p.264, using Theorems 1.3, 5.1 and 6.1.)

*Needs:* [4.14 Diophantine computation graphs](#414-diophantine-computation-graphs); [4.11 Diophantine sets are recursively enumerable](#411-diophantine-sets-are-recursively-enumerable); [4.9 Finite Diophantine normal form](#49-finite-diophantine-normal-form).

### 4.16 Undecidability of Hilbert tenth over integers

There exist n and p∈ℤ[t,x₁,…,x_n] such that the predicate on a∈ℤ given by existence of x∈ℤⁿ with p(a,x)=0 is not computable. The acceptance theorem is `hilbert_tenth_integers`. As a corollary, no total computable predicate on finite integer-polynomial codes decides integer solvability: substitution of the integer parameter into this fixed polynomial is computable. The polynomial can be chosen so that restricting its parameter to ℕ remains noncomputable. Obtain this family from MRDP and the native halting problem, then replace each natural witness by four integer squares. Computability of the resulting predicate on ℤ would imply computability of its restriction to ℕ.

Choose a recursively enumerable undecidable native halting set. If polynomial solvability were decidable then its effective MRDP representation would decide that set. Keep the free natural parameter unchanged and substitute a sum of four squares for every natural witness; every natural value is attained by the native Nat.sum_four_squares theorem, and every such integer value is nonnegative. Keep signed coefficients and arbitrary finite arity in the code transformation.

([Martin Davis, *Hilbert’s tenth problem is unsolvable*](https://doi.org/10.2307/2318447), §7, Theorems 7.2–7.4, pp.261–262; §8, Theorem 8.1, p.264; positive/integer witness conversion is a separate four-square argument; Poonen, *Undecidability in number theory*, “Negative answer to H10”, author-copy p.3.)

**Checks.**

- For the test family p(a,x)=a−x², a=0 and 1 admit x=0 and 1, whereas a=−1 has no integer root. This decidable family is not a witness to the existential undecidability theorem.
- Four integer squares attain 0 and 1 but never −1, so replacing natural witnesses does not admit a negative value.
- In arity zero, p(a)=a vanishes exactly at a=0, a computable predicate; the theorem asserts existence of a fixed family rather than undecidability for every polynomial.

*Needs:* [4.15 Matiyasevich–Robinson–Davis–Putnam theorem](#415-matiyasevichrobinsondavisputnam-theorem); Mathlib `ComputablePred.halting_problem`; Mathlib `Nat.sum_four_squares`; [4.10 Effective polynomial and witness coding](#410-effective-polynomial-and-witness-coding).

### 4.17 Diophantine sets over a commutative ring

For a commutative ring R and n∈ℕ, a set S⊆R^n is Diophantine over R when there are finite m,r and polynomials p₁,…,p_r∈R[X₁,…,X_n,Y₁,…,Y_m] such that x∈S iff some y∈R^m satisfies every p_j(x,y)=0. Coefficients are named parameters unless a coefficient subring is explicitly fixed. Finite systems are retained: the sums-of-squares conversion is only available over formally real fields or the specified integer/natural domains.

Use a finite tuple of witness variables and a finite tuple of equations. Prove intersection by concatenating witnesses. Prove finite union over domains by all pairwise products of equations, or over rings with only trivial idempotents by a selector. Over fields express nonzero f by fz=1; no such inverse certificate is assumed for a general domain. Prove comparison with existential ring formulas over fields and with native Dioph only on its natural-assignment domain.

The basic interface must include:

- Projection appends a finite witness block.
- Intersection concatenates systems. Finite union is closed over domains using polynomial products, or over rings with no nontrivial idempotents using a selector; unrestricted-ring union is not asserted.
- Polynomial substitution pulls Diophantine sets back.
- Over a field, existential ring formulas with parameters define precisely these finite-system sets.

**Checks.**

- Over ℂ, x²+y²=0 need not imply x=y=0, so it cannot replace that two-equation system.
- The equation 1=0 defines the empty set over a nonzero ring.
- In ℤ/6, a product equation can vanish with both factors nonzero; the domain-only union proof must not be applied.
- Over ℚ, ∃z,xz=1 defines precisely x≠0.

For unary subsets of ℚ, `rationalDiophantine` in Suggested.lean specializes this theory to a single equation with a finite witness block. The integers are the image `Set.range ((↑) : ℤ → ℚ)` of ℤ in ℚ; zero and −7 belong to it, whereas 1/2 does not. The empty Diophantine set is witnessed by 1=0 with no witnesses; x≠0 by xy−1=0. These are checks of the specialization, not existential definitions of the integer set.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), §1, pp.73–75, and §3, pp.87–91.)

*Needs:* [0.4 Explicit arithmetic semantics bridges](#04-explicit-arithmetic-semantics-bridges); [4.9 Finite Diophantine normal form](#49-finite-diophantine-normal-form).

### 4.18 Effective Diophantine undecidability transfer

Let A have an undecidable finite-system existential theory with a fixed effective coefficient presentation. If an effectively presented ring R has an effective Diophantine interpretation of A, including its domain, equality congruence, ring-operation graphs and computable translation of coefficients, then the finite-system existential theory of R is undecidable. In particular, if ℤ is Diophantine in ℚ then H10 over ℚ is undecidable. That antecedent is a hypothesis, not a theorem of this roadmap.

Translate each input equation using the domain and operation graphs, retaining quotient equality and coefficient codes. Prove both solvability directions by interpretation semantics. A hypothetical target decider composed with this computable translation decides the source problem. For the conditional integer predicate in ℚ, its complement also has an existential certificate: write t=m/n in coprime integer terms with n≠0,±1, witnessing coprimality by um+vn=1. This proves Observation 0 without assuming an unconditional existential integer definition.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), §1, p.73, and Observation 0, p.74.)

*Needs:* [4.17 Diophantine sets over a commutative ring](#417-diophantine-sets-over-a-commutative-ring); [4.16 Undecidability of Hilbert tenth over integers](#416-undecidability-of-hilbert-tenth-over-integers); [0.2 Semantics and composition of interpretations](#02-semantics-and-composition-of-interpretations).

### 4.19 Quaternion trace and semilocal sets

For a,b∈ℚ× define S_ab={2x₁: ∃x₂,x₃,x₄∈ℚ, x₁²−ax₂²−bx₃²+abx₄²=1}, T_ab=S_ab+S_ab, and Δ_ab as the places of ℚ at which the quaternion algebra (a,b) is division. Treat the real place separately from rational primes. Define T_ab×={x∈ℚ×: x∈T_ab and x⁻¹∈T_ab}; inverses are guarded by nonzeroness.

Compare the displayed norm polynomial with the existing quaternion norm and trace API. Construct witnesses for the two summands and the inverse test. Use the imported local Hilbert symbol to define the finite ramification support, with the separate real-place flag.

The basic interface must include:

- The trace-set predicate has the displayed norm-one existential representation.
- T membership is witnessed by two S elements.
- A rational unit of T is tested by x and x⁻¹ membership.
- Quaternion presentation changes preserving trace and norm preserve S and T.

**Checks.**

- 2∈S_ab via x₁=1 and x₂=x₃=x₄=0.
- For a,b<0 the real trace range is [−2,2], so the real condition cannot be dropped.
- When the quaternion algebra is split at every place, T_ab=ℚ and Δ_ab is empty.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), §2, definitions and local facts preceding Proposition 6, pp.75–78.)

*Needs:* [4.17 Diophantine sets over a commutative ring](#417-diophantine-sets-over-a-commutative-ring); [TauCetiRoadmap.QuadraticFormInvariants, layer 2 quaternion algebras and the four fold splitting criterion](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion); [TauCetiRoadmap.QuadraticFormInvariants, 6c the hilbert symbol and the local hasse invariant](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md#6c-the-hilbert-symbol-and-the-local-hasse-invariant).

### 4.20 Local trace and semilocal integrality theorem

For a,b∈ℚ×, T_ab equals the intersection of ℤ_(p) over finite p∈Δ_ab, further intersected with [−4,4]⊂ℚ if the real place ramifies. If a>0 or b>0 there is no real restriction. For a sum T_ab+T_cd with at least one of a,b,c,d positive, the sum is the intersection over the common finite ramification primes. Empty intersections mean ℚ.

At a finite division place compare S with the inverse image of the permitted finite-field trace set and compute that two copies cover the valuation ring, including the small primes explicitly. At the real place compute the trace interval, or all of ℝ when split. Use weak approximation (Tau Ceti `TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds`, for ℚ as a one-dimensional space over itself) to choose compatible summands and the imported local-global representation theorem to obtain rational norm-one witnesses. For the sum formula, prescribe p-integral decompositions at the union of supports; intersection primes are the only constraints.

In the dyadic trace calculation for a=6,b=15, the auxiliary triple (1,1,1) gives −6−15+90=69≡5 mod 8; (1,1,0) gives 3 mod 8 and does not supply that row (Koenigsmann Proposition 6 proof, p.78).

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), Proposition 6, p.76; proof pp.76–78; Remark 8(a), statement p.79 and proof pp.79–80.)

*Needs:* [4.19 Quaternion trace and semilocal sets](#419-quaternion-trace-and-semilocal-sets); Tau Ceti `TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds`; [TauCetiRoadmap.GlobalQuadraticForms, layer 4 global square norm and approximation lemmas](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalQuadraticForms/README.md#layer-4-global-square-norm-and-approximation-lemmas); [TauCetiRoadmap.GlobalQuadraticForms, layer 6 representation and isometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalQuadraticForms/README.md#layer-6-representation-and-isometry); [TauCetiRoadmap.QuadraticFormInvariants, 6c the hilbert symbol and the local hasse invariant](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md#6c-the-hilbert-symbol-and-the-local-hasse-invariant).

### 4.21 Prime-class semilocal rings

For k∈{1,3,5,7}, let P^[k] be the odd primes congruent to k mod8, P(p) the primes where v_ℓ(p) is odd, and P^[k](p)=P(p)∩P^[k]. For p,q∈ℚ× put R³_p=T_(−1,−p)+T_(2,−p), R⁵_p=T_(−2,−p)+T_(2,−p), R⁷_p=T_(−1,−p)+T_(−2,p), and R¹_pq=T_(−2p,q)+T_(2p,q). If p∈k+8ℤ_(2), then `R^k_p=∩_{ℓ∈P^[k](p)}ℤ_(ℓ)` for k=3,5,7; otherwise an additional 2-integrality condition may occur. If p∈1+8ℤ_(2) and q∈3+8ℤ_(2), R¹_pq is the intersection over Δ_(−2p,q)∩Δ_(2p,q). Empty intersections are ℚ. All displayed rings have uniform existential definitions.

Define the finite prime sets and the four ring expressions exactly as displayed. Apply the local trace sum theorem and Hilbert symbol computations with exactly the stated congruence guards. Without those guards retain any extra dyadic condition; do not identify the ring with the odd-prime intersection. Keep the prime 2 and the real place outside the odd class partition.

The basic interface must include:

- Each ring has its finite-prime intersection description under the displayed congruence guard, with any dyadic correction retained otherwise.
- Each ring membership predicate is existential uniformly in its nonzero parameters.
- Under the corresponding congruence guard, empty prime support gives ℚ.

**Checks.**

- For p=1 and q=3 the class-one common ramification support is empty and R¹_1,3=ℚ.
- R³_3=ℤ_(3), R⁵_5=ℤ_(5), and R⁷_7=ℤ_(7); each parameter satisfies its own congruence guard.
- For p=5 the odd class-three support is empty but R³_5=ℤ_(2), demonstrating the necessary dyadic correction outside the class-three guard.

Keep the first quaternion entries in Definition 7 fixed: the class-five formula uses −2 and 2, and the class-seven formula uses −1 and −2. The altered entries in the proof of Proposition 10(b), p.81, are not alternative definitions.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), Definitions 7 and 9, pp.79–80; Proposition 10, pp.80–81.)

*Needs:* [4.19 Quaternion trace and semilocal sets](#419-quaternion-trace-and-semilocal-sets); [4.20 Local trace and semilocal integrality theorem](#420-local-trace-and-semilocal-integrality-theorem).

### 4.22 Diophantine semilocal radicals

For a,b,c∈ℚ× set I^c_ab=cℚ²T_ab×∩(1−ℚ²T_ab×), allowing the zero square, and J_ab=(I^a_ab+I^a_ab)∩(I^b_ab+I^b_ab). Put Δ′=Δ_ab∖{2,∞} when 2 ramifies and both v₂(a),v₂(b) are even, and Δ′=Δ_ab∖{∞} otherwise. Then `J_ab=∩_{ℓ∈Δ′}ℓℤ_(ℓ),` with empty intersection ℚ. If ∞ does not ramify, Δ′ is the full finite ramification set and is nonempty, this is the Jacobson radical of T_ab. For pairs (a,b),(c,d) with nonempty common finite ramification support, no common dyadic ramification, and at least one of a,b,c,d positive, J_ab+J_cd is the Jacobson radical of T_ab+T_cd. Empty support is handled separately: Jac(ℚ)={0}.

Translate T units into simultaneous membership of x and x⁻¹. Compute valuations of square-times-units and of 1 minus such elements; separate the odd and dyadic cases in Lemma 13. For sums of semilocal rings with nonempty common support, combine the two radical ideals by the source intersection formula.

The basic interface must include:

- With nonempty support and the stated parity hypotheses the J formula is the Jacobson radical.
- The displayed I and J expressions use existential ring conditions.
- Lemma 14 combines radicals after checking nonempty common support.
- The radical of the field ℚ is {0}; no empty-intersection formula changes it to ℚ.

**Checks.**

- For R=ℤ_(3), Jac(R)=3ℤ_(3).
- For R=ℤ_(3)∩ℤ_(5), Jac(R)=3ℤ_(3)∩5ℤ_(5).
- For R=ℚ, Jac(R)={0}, while the unguarded existential expression can be ℚ.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), Definition 12, pp.81–82; Lemma 13, pp.82–83; Lemma 14, p.83.)

*Needs:* [4.21 Prime-class semilocal rings](#421-prime-class-semilocal-rings); [4.19 Quaternion trace and semilocal sets](#419-quaternion-trace-and-semilocal-sets); [4.17 Diophantine sets over a commutative ring](#417-diophantine-sets-over-a-commutative-ring).

### 4.23 Prime-covering Diophantine parameter families

For k=1,3,5,7 let Φ_k={p∈ℚ×:p>0, p∈k+8ℤ_(2), P(p)⊂P^[1]∪P^[k]}. Define Ψ={(p,q)∈Φ₁×Φ₃:p∈2(ℚ×)²(1+Jac(R³_q))}. Their membership and the relevant radical memberships are Diophantine over ℚ. For p∈Φ_k with k=3,5,7 the k-support is nonempty; for (p,q)∈Ψ the support P(p,q) is nonempty. Every odd rational prime is detected by a suitable family with singleton support, and the dyadic place has the separate fixed T-set test.

Use the source existential expressions for rational positivity and congruences, preserving nonzero square factors. Apply the Hilbert symbol parity computations to prove nonemptiness in each family. For the class-one case use the two-parameter construction in Proposition 16, including the prescribed local conditions at 2.

The basic interface must include:

- Each allowed parameter predicate has a fixed existential ring formula.
- Every allowed radical use has nonempty prime support.
- For each odd prime a permitted parameter has support exactly that prime.

**Checks.**

- p=3 is in Φ₃ and detects 3-integrality.
- p=−3 fails the positivity condition even though its odd prime divisor is 3.
- A rational square cannot be a member of Φ₃, Φ₅ or Φ₇, by its 2-adic unit congruence.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), Corollary 15 and Proposition 16, pp.84–86.)

*Needs:* [4.22 Diophantine semilocal radicals](#422-diophantine-semilocal-radicals); [4.21 Prime-class semilocal rings](#421-prime-class-semilocal-rings); [4.20 Local trace and semilocal integrality theorem](#420-local-trace-and-semilocal-integrality-theorem); Mathlib `Nat.forall_exists_prime_gt_and_modEq`.

### 4.24 Universal definition of integers in rationals

There is a parameter-free universal first-order formula in the ring language defining ℤ⊂ℚ; equivalently ℚ∖ℤ is Diophantine over ℚ. For a nonempty finite S and `R=∩_{ℓ∈S}ℤ_(ℓ),` the source universal predicate R̃={x:¬∃y∈Jac(R),xy=1} equals `⋃_{ℓ∈S}ℤ_(ℓ),` not R itself. Intersect its instances over Φ₃,Φ₅,Φ₇ and Ψ, together with the fixed dyadic integrality predicate, to recover ℤ.

For x≠0 compare x⁻¹∈Jac(R) with v_ℓ(x)<0 for all ℓ∈S; at x=0 the universal condition holds. Each integer passes every local integrality test. A noninteger has a negative valuation at some prime; choose a singleton-support parameter, or the dyadic test, that rejects it. All guards have existential descriptions, so their implications can be placed under universal quantifiers. Negate the resulting formula and combine equations using formal reality of ℚ.

The acceptance signature is `universal_integers` and `rational_nonintegers_diophantine` in Suggested.lean.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), Lemma 17, p.85, and Proposition 18, p.86; Theorem 1 and Corollary 2, pp.73–74.)

*Needs:* [4.23 Prime-covering Diophantine parameter families](#423-prime-covering-diophantine-parameter-families); [4.22 Diophantine semilocal radicals](#422-diophantine-semilocal-radicals); [4.21 Prime-class semilocal rings](#421-prime-class-semilocal-rings); [4.17 Diophantine sets over a commutative ring](#417-diophantine-sets-over-a-commutative-ring).

### 4.25 Undecidable universal-existential rational theory

There exist fixed k,l and q∈ℤ[a,x₁,…,x_k,y₁,…,y_l] such that the predicate on a∈ℕ given by ∀x∈ℚᵏ ∃y∈ℚˡ, q(a,x,y)=0 is not computable. The acceptance theorem is `forall_exists_rational_undecidable`. Substituting the numeral for a gives the undecidability of the parameter-free universal-existential ring theory of ℚ; the existential-universal fragment is undecidable by negation. This does not establish undecidability of the existential theory of ℚ.

Choose the fixed integer-polynomial family P(a,z) representing a noncomputable subset of ℕ as in §4.16. Write integer membership as ∀u, g(t,u)≠0 using §4.24. The complement of integer solvability is ∀z∈ℚⁿ, P(a,z)≠0 or at least one coordinate z_i is nonintegral. Express this disjunction by the single equation (P(a,z)w−1)∏ᵢg(z_i,u_i)=0, with w and all u_i existentially quantified. If P(a,z)≠0 choose w=P(a,z)⁻¹; if z_i is nonintegral choose u_i with g(z_i,u_i)=0. Conversely, a zero product in ℚ forces one of those alternatives. This is a universal-existential family defining the complement of the noncomputable natural-parameter set. Its coefficient and sentence substitutions are computable.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), Corollaries 3 and 3′, p.74.)

**Checks.**

- At a tuple of integers z with P(a,z)=0, every g(z_i,u_i) is nonzero and P(a,z)w−1=−1; the product never vanishes, so this tuple refutes the universal sentence.
- When P(a,z)=2, w=1/2 gives P(a,z)w−1=0, irrespective of the other factors. The inverse witness is used only with P(a,z)≠0.
- For a nonintegral coordinate z_i=1/2, some u_i gives g(1/2,u_i)=0 by §4.24, so the product vanishes even when P(a,z)=0. With no coordinates the empty product is 1, and the equation reduces to P(a)w−1=0.

*Needs:* [4.24 Universal definition of integers in rationals](#424-universal-definition-of-integers-in-rationals); [4.16 Undecidability of Hilbert tenth over integers](#416-undecidability-of-hilbert-tenth-over-integers); [0.4 Explicit arithmetic semantics bridges](#04-explicit-arithmetic-semantics-bridges).

### 4.26 Square-detection unions of local rings

For p∈Φ₁ define S_p={x:∃q, (p,q)∈Ψ, q∈(R¹_pq)× and x∈R¹_pq}. Its membership is uniformly Diophantine and `S_p=⋃_{ℓ∈P(p)}ℤ_(ℓ).` For square p∈Φ₁ this union is empty. The parameter guard p∈Φ₁ is essential: this is not a formula for arbitrary nonzero rational p. The notation is S_p from Definition 19, not a one-parameter R¹_p.

Expand Ψ, the unit test and R membership into existential conditions. Use Lemma 20 to prove both containments and construct q for each selected odd-valuation prime, with the dyadic case separated as in the source.

The basic interface must include:

- S_p has a uniform existential ring definition.
- For square p∈Φ₁ the set is empty.
- For p∈Φ₁, the set equals the union over its odd-valuation primes.

**Checks.**

- S_1 is empty.
- S_17=ℤ_(17), since the prime 17 lies in Φ₁.
- For p=17·41∈Φ₁, S_p=ℤ_(17)∪ℤ_(41), so 1/17 belongs; the intersection would reject it.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), Definition 19, p.86; Lemma 20, pp.86–87.)

*Needs:* [4.23 Prime-covering Diophantine parameter families](#423-prime-covering-diophantine-parameter-families); [4.21 Prime-class semilocal rings](#421-prime-class-semilocal-rings); [4.17 Diophantine sets over a commutative ring](#417-diophantine-sets-over-a-commutative-ring); Mathlib `Nat.forall_exists_prime_gt_and_modEq`.

### 4.27 Diophantine nonsquares and quadratic nonnorms

The subsets ℚ∖ℚ² and {(x,y)∈(ℚ×)²: x is not a norm from ℚ(√y)} are Diophantine over ℚ, with the split case y square contributing no nonnorms. The prime-disjointness and empty-prime-class predicates used in the proof are Diophantine with multiplicative square-class parametrizations. For class 3, use {±1,±2}(ℚ×)² `∏_{k∈{1,5,7}}Φ′_kΦ′_k` for P^[3](x)=∅, where Φ′_k is Φ_k∪{1}; multiplication of square classes uses the product of the two factors.

Express disjoint finite prime supports by the radical criterion. Prove the nonsquare and empty-class tests by parity of valuations, retaining rational square factors and signs. Use the quadratic Hasse norm theorem and local norm/Hilbert symbol tests; include the real-place obstruction when appropriate.

For an odd prime ℓ≡3 mod 8, (2/ℓ)=−1 by the supplementary reciprocity law. For the class-three empty-support predicate, 35 requires both the class-five and class-seven factors, while squares and signed unit multiples require the square and {±1,±2} factors. Keep ℤ_(ℓ) for the rational ring in the norm formula (Koenigsmann Proposition 21(b),(d),(e), p.87; proofs pp.88–90).

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), Proposition 21(a)–(e), p.87; proofs pp.87–90.)

*Needs:* [4.26 Square-detection unions of local rings](#426-square-detection-unions-of-local-rings); [4.23 Prime-covering Diophantine parameter families](#423-prime-covering-diophantine-parameter-families); [4.22 Diophantine semilocal radicals](#422-diophantine-semilocal-radicals); [TauCetiRoadmap.GlobalQuadraticForms, layer 4 global square norm and approximation lemmas](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalQuadraticForms/README.md#layer-4-global-square-norm-and-approximation-lemmas); [4.17 Diophantine sets over a commutative ring](#417-diophantine-sets-over-a-commutative-ring); Mathlib `Nat.forall_exists_prime_gt_and_modEq`.

### 4.28 Integer definition with one universal variable

There exists an integer polynomial P(t,x,y₁,…,y_m) such that for t∈ℚ, t∈ℤ iff ∀x∈ℚ ∃y∈ℚ^m, P(t,x,y)=0. The single universally quantified variable is x; the witness arity m is fixed. Use S_x from Definition 19 for the class-one clause, and the rational 2-local residue classes k+8ℤ_(2) in the source proof.

Use the Diophantine complements of the Φ_k guards and the S_x characterization to obtain one universal parameter. Combine finitely many rational polynomial conditions by a product for disjunction and sums of squares for conjunction.

The class-one clause uses the one-parameter S_p, not an undefined one-parameter R¹_p. The dyadic guards are k+8ℤ_(2); k+ℤ_(2) cannot distinguish odd residue classes (Koenigsmann Corollary 22, pp.90–91).

The acceptance signature is `one_universal_variable` in Suggested.lean.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), Corollary 22, pp.90–91.)

*Needs:* [4.26 Square-detection unions of local rings](#426-square-detection-unions-of-local-rings); [4.27 Diophantine nonsquares and quadratic nonnorms](#427-diophantine-nonsquares-and-quadratic-nonnorms); [4.24 Universal definition of integers in rationals](#424-universal-definition-of-integers-in-rationals); [4.17 Diophantine sets over a commutative ring](#417-diophantine-sets-over-a-commutative-ring).

### 4.29 Effective zero-cycles on normic bundles

Let k be a number field, p a prime, K/k a cyclic field extension of degree p, and P=QR∈k[x] separable of degree 2p with Q,R irreducible of degree p and without zero in K. Let U=U(K/k,P) be the smooth affine k-variety `N_{K/k}(Ξ)=P(x)≠0.` Prove the effective normic zero-cycle theorem:

- (a) U has a smooth projective model X with a morphism π:X→ℙ¹ extending (Ξ,x)↦x, whose generic fibre is the Severi–Brauer variety of dimension p−1 of the cyclic algebra (K/k,P(x)); the classes (K/k,Q(x)) and (K/k,R(x)) of Br k(x) lie in Br X, and Br X/Br k is cyclic of order p generated by (K/k,Q(x)).
- (b) If an adelic point (M_v)∈∏_v U(k_v) is orthogonal to (K/k,Q(x)), then U has a point over a field extension L/k of degree 2p+1; in particular Sym^(2p+1)U and Sym^(2p+1)X have k-points.
- (c) Suppose k contains a primitive p-th root of unity ζ and fix d∈k×. Put A=k[u,u⁻¹] and B=A[v]/(v^p−du), a finite étale A-algebra of rank p. Define the smooth affine A-family by N_(B/A)(Ξ)=P(x)≠0 and construct a smooth projective A-family containing it fibrewise as a dense open. Write X_u for its fibre at u∈k×; the fibre algebra is k[v]/(v^p−du), including k^p when du∈k×p (CTV §4, p.14). Apply (a) only to fibres for which this algebra is a degree-p field and Q,R have no zero in it. The set of u with X_u(𝔸_k)≠∅ and X_u(𝔸_k)^Br=∅ is a finite union of classes of k×/k×p.
- (d) For k containing ζ there exist d∈k×∖k×p and P=QR as above for K=k(d^(1/p)) such that X has points in every completion of k but no zero-cycle of degree 1, the obstruction coming from (d,Q(x))_ζ; consequently Sym^(2p+1)U has no k-point.

For (a), glue the two affine charts x and y=1/x of the norm equation, replace the fibres away from P=0 by Severi–Brauer varieties, and resolve and compactify; the residues of (K/k,Q(x)) at the closed points of ℙ¹ vanish on X because Q and R have no zero in K (CTV Proposition 2.2, pp.5–7). For (b), apply the fibration method for rational points on π: fibres over closed points have the Hasse principle (Severi–Brauer), every fibre over a closed point has a multiplicity-one component whose function field contains an abelian extension of the residue field, and d₀=2p is the total degree of the closed points with nonsmooth fibre; Harari's formal lemma, the implicit function theorem (to produce d=2p+1 distinct local points with equal Brauer values) and Salberger's device give a closed point of degree 2p+1 whose fibre has a rational point (CTV Theorem 3.1 and proof, pp.8–9; Corollary 3.2, p.10). For (c), outside a finite set of places the curve z^p=Q(x)R(x) has points and the algebra (u,Q(x))_ζ takes every value in ℤ/p on it when v(u)≢0 mod p, by the Weil bound for the smooth complete-intersection curves z₁^p=γQ, z₂^p=γ⁻¹R over large residue fields and Hensel's lemma (CTV Lemma 4.1, pp.14–15); so obstructed u have p-divisible valuations outside a finite set, a finite group of classes by finiteness of the class group and Dirichlet's unit theorem (CTV Proposition 4.2, pp.15–16). For (d), choose primes a,b≡1 mod (1−ζ)^(2p−1) with the stated nonresidue conditions by Chebotarev and class field theory, put d=ab, Q=x^p+c, R=ax^p+ac+1 with b∣ac+1, check local points at every place by Hensel's lemma, and evaluate (d,Q(x))_ζ on zero-cycles of degree one place by place (CTV Proposition 3.4 and proof, pp.10–14).

The basic interface must include:

- Under the field and polynomial hypotheses of (a), Br X/Br k is cyclic of order p, generated by (K/k,Q(x)).
- orthogonality of one adelic point to (K/k,Q(x)) yields a point over an extension of degree exactly 2p+1.
- a point over a degree-N extension gives a k-point of Sym^N U, and conversely a k-point of Sym^N U is an effective Galois-stable zero-cycle of degree N.
- the obstructed parameters form finitely many classes of k×/k×p.

**Checks.**

- In (c), if du∈k×p, the fibre algebra is k^p, X_u is k-birational to ℙ^p and Br X_u=Br k, so there is no obstruction (CTV Proposition 2.2(ii)). For k=ℚ, p=2, d=2 and P=(x²−3)(x²−5), the fibres at u=1 and u=1/2 both have dimension 2; the latter has equation XY=P(x)≠0, rather than the dimension-one equation obtained from the norm of ℚ/ℚ.
- U has a point over K itself, since over K the norm form splits and represents every nonzero value. Since gcd(p,2p+1)=1, a point of degree 2p+1 from (b) and this point of degree p give the zero-cycle of degree (2p+1)−2p=1; in the family of (d) no such cycle exists, so the obstruction is what removes the degree-(2p+1) point.
- For N=1, Sym¹U=U; for N=2p+1 the effective cycle of a closed point of degree 2p+1 is one k-point of Sym^(2p+1)U.
- In the family of (d), every completion has points but the Brauer evaluation of (d,Q(x))_ζ on degree-one zero-cycles never sums to zero, so (b) cannot hold without its orthogonality hypothesis.

([Jean-Louis Colliot-Thélène and Jan Van Geel, *Le complémentaire des puissances n-ièmes dans un corps de nombres est un ensemble diophantien*](https://arxiv.org/pdf/1401.0915), Proposition 2.2, pp.5–7; Theorem 3.1, pp.8–9; Corollary 3.2, p.10; Proposition 3.4, pp.10–14; Lemma 4.1, pp.14–15; Proposition 4.2, pp.15–16.)

*Needs:* [TauCetiRoadmap.HeightsRationalPointsAndObstructions, §2.16b](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md#216b-brauer-residues); [§2.17](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md#217-unramified-brauer-groups); [§2.20](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md#220-brauer-pairing-on-zero-cycles); [§2.21](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md#221-hararis-formal-lemma); [TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero, §6.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md#62-snc-compactification); [TauCetiRoadmap.WeilConjectures, §5.29, Curve RH from the surface bound](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/WeilConjectures/README.md#529-curve-rh-from-the-surface-bound); [TauCetiRoadmap.Chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/Chebotarev/README.md); [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md).

### 4.30 Nonpowers over a number field

The acceptance theorem `nonpowers_diophantine` states the following finite-system form. For a number field k and natural exponent r>1, k×∖k×r is Diophantine over k; equivalently it is a finite union of polynomial-system images on k-rational points. Zero is excluded by an inverse witness. For r=1 the set is empty, which is Diophantine separately. The prime-exponent reduction and the descent from a root-of-unity extension are part of the finite-dimensional interpretation.

Reduce r to prime factors and pass to a finite extension containing the needed roots of unity, recording norm/power and restriction-of-scalars comparisons (CTV p.16, citing Poonen and Várilly-Alvarado–Viray). For r=p, the sets N_v=k×∖(k×∩k_v×p) are Diophantine; D₁={u: Sym^(2p+1)U_u(k)≠∅} is Diophantine as the image of the k-points of the relative symmetric power over k[u,1/u]. Put `D₂=D₁∪⋃_{v∈S}N_v.` By §4.29(b) its complement E lies in the obstructed set, which by §4.29(c) is a finite union of k×p-classes, and by §4.29(d) the class k×p lies in E. Hence D₃=E∖k×p is a finite union of classes, each Diophantine, and k×∖k×p=D₂∪D₃. Enforce x≠0 explicitly.

The effective zero-cycle theorem and the Brauer computations are §4.29; a general Brauer pairing on zero-cycles by itself gives neither the degree bound 2p+1 nor the finiteness of obstructed classes.

([Jean-Louis Colliot-Thélène and Jan Van Geel, *Le complémentaire des puissances n-ièmes dans un corps de nombres est un ensemble diophantien*](https://arxiv.org/pdf/1401.0915), Theorem 4.3 and proof, pp.16–17.)

**Checks.**

- Over ℚ with r=2, −1 belongs and 4 does not: a rational square is nonnegative and 4=2².
- Zero is excluded, since the set is in k×; an inverse equation xz=1 has no witness at x=0.
- Over ℚ with r=3, 2 belongs (its 2-adic valuation 1 is not divisible by 3), while −8=(−2)³ does not. For r=1 every x is a first power, so the complement is empty.

*Needs:* [4.17 Diophantine sets over a commutative ring](#417-diophantine-sets-over-a-commutative-ring); [4.29 Effective zero-cycles on normic bundles](#429-effective-zero-cycles-on-normic-bundles).

### 4.31 Existential closure and model completeness

For a ring embedding M↪N, M is existentially closed in N if every existential ring formula with parameters from M true in N is true in M. A theory T is model complete when every embedding between models of T is elementary. Keep these distinct predicates and the native semantic notions of embedding and elementary embedding; Robinson’s test relates them for models of a theory.

Define relative existential closure using native BoundedFormula.IsExistential and parameters from the smaller structure; reuse that existing syntax fragment instead of defining another one. Define model completeness by all embeddings of models being elementary, then prove the existential test by the standard diagram/compactness argument.

The basic interface must include:

- Existential closure allows arbitrary parameters from the smaller model.
- An elementary embedding is existentially closed.
- T is model complete iff embeddings between its models are existentially closed.

**Checks.**

- Every structure is existentially closed in itself.
- ℚ is not existentially closed in ℝ: X²=2 acquires a root.
- Existential closure only descends existential truths; it does not assert arbitrary elementary equivalence.

Prove the existential-preservation theorem by the native compactness/diagram argument, retaining all parameters from the smaller model. A new syntax for existential formulas is unnecessary.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), §4, preservation criterion before Proposition 23, p.91; Remark 24, p.92.)

*Needs:* [0.2 Semantics and composition of interpretations](#02-semantics-and-composition-of-interpretations); Mathlib `FirstOrder.Language.BoundedFormula.IsExistential`.

### 4.32 Rational-model preservation criteria

For K⊂L both models of Th(ℚ), let Z_K,Z_L be defined by a fixed universal integer formula. Then (a) Z_L∩K⊂Z_K; (b) Z_L∩K is integrally closed in K; (c) for every positive n, L^n∩K=K^n, so K is radically closed in L. Conditionally, if ℤ is Diophantine in ℚ, then (d) Z_L∩K=Z_K and K is relatively algebraically closed in L. More generally, ℤ has an existential definition in ℚ iff Z_K⊂Z_L for every such embedding. Finally Th(ℚ) is not model complete: model completeness would make every definable rational subset existential, contradicting the non-RE complement of an RE undecidable subset of the defined integer ring. No unconditional existential integer definition follows.

Koenigsmann’s published Proposition 23(c) states all positive n; its proof uses the nonpower theorem of §4.30 for n>2. Use downward preservation of universal formulas for the first containment. Use monic-equation witnesses for integral closure and Diophantine nonpowers for radical closure. Apply the model-theoretic existential preservation theorem to the fixed universal formula, using the complete theory Th(ℚ). For non-model-completeness, take an RE nonrecursive set represented in interpreted arithmetic and use existential normal forms to derive the impossible RE complement.

For the conditional relative-algebraic-closure conclusion, formalize the monic-root decision predicate and its uniform MRDP translation from Koenigsmann Proposition 23(d). The diagram/preservation theorem is §4.31. Neither conclusion supplies an unconditional existential integer definition.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), §4, Proposition 23(a)–(d), pp.91–92; Remark 24, p.92.)

*Needs:* [4.31 Existential closure and model completeness](#431-existential-closure-and-model-completeness); [4.24 Universal definition of integers in rationals](#424-universal-definition-of-integers-in-rationals); [4.30 Nonpowers over a number field](#430-nonpowers-over-a-number-field); [4.15 Matiyasevich–Robinson–Davis–Putnam theorem](#415-matiyasevichrobinsondavisputnam-theorem).

### 4.33 Two-universal-variable integer formula

For t∈ℚ, let u=(u₁,u₂,u₃,u₄), v=(v₂,v₃,v₄), A(u)=Σᵢuᵢ², B=a u₂²+b u₃²−ab u₄², and C=a v₂²+b v₃²−ab v₄². Put F=(a+A(u))(b+A(u))((u₁²−B−1)²+((t−2u₁)²−4C−4)²). Then t∈ℤ iff for every a,b∈ℚ there exist u∈ℚ⁴,v∈ℚ³ with F=0. This displayed polynomial has degree at most 8 in the seven existential coordinates and total degree 12 when a,b,t are also variables; no total-degree-8 claim is made.

For a,b>0 the two guard factors are nonzero, so F=0 gives two norm-one quaternion traces whose sum is t. Apply the semilocal trace description and intersect over the positive parameters to recover ℤ. If a≤0 or b≤0, four rational squares represent its negative after clearing a square denominator; choose the shared u tuple to make the corresponding guard factor zero. For positive a,b and integral t the trace-sum theorem supplies u and v. The highest existential degree is 8; the monomial a²b²u₄⁸ has coefficient 1, certifying total degree 12.

The acceptance signature is `two_universal_integer_formula` in Suggested.lean, with the polynomial `twoUniversalIntegerPolynomial` written in zero-based coordinates u₀,…,u₃ and v₀,v₁,v₂ for u₁,…,u₄ and v₂,v₃,v₄. There are exactly two universally quantified and seven existentially quantified rational variables. Degenerate nonpositive parameters are discharged by a guard factor, never by assuming they are positive. The degree convention distinguishes existential-block degree from total degree.

The basic interface must include:

- Evaluation agrees with the displayed expression for every a,b,t∈ℚ and every u∈ℚ⁴,v∈ℚ³, with the stated conversion to zero-based coordinates.
- If a+A(u)=0 or b+A(u)=0, then F=0 for every t and v.
- For a,b>0, F=0 if and only if u₁²−B=1 and (t/2−u₁)²−C=1; these are the two norm-one equations with traces 2u₁ and t−2u₁.
- The degree in the seven existential coordinates is at most 8, and the total degree in a,b,t,u,v is 12, witnessed by the coefficient 1 of a²b²u₄⁸.

**Checks.**

- At a=b=1, t=0, u=(1,0,0,0) and v=(0,0,0), the guards are 2 and 2 and both squared residuals vanish, so F=0.
- With the same a,b,u,v and t=2, the second residual is −4, so F=4·16=64; replacing t−2u₁ by t would incorrectly give zero.
- At a=−1, b=1 and u=(1,0,0,0), the first guard is 0, so F=0 for every t and v; dropping the guards would fail this test.

([Jochen Koenigsmann, *Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf), Step 1 conclusion, p.79; introduction p.75.)

*Needs:* [4.20 Local trace and semilocal integrality theorem](#420-local-trace-and-semilocal-integrality-theorem); Mathlib `Nat.sum_four_squares`; [4.17 Diophantine sets over a commutative ring](#417-diophantine-sets-over-a-commutative-ring).

### Examples

The syntax X₀−2X₁ evaluates at (1,3) to −5. X(X−1) vanishes on {0,1} yet takes value 2 at 2, so injectivity of the syntax comparison uses an infinite box. The equation U−V−1 has natural root (1,0), and identifying the two witnesses removes every root. R³₃=ℤ_(3), while R³₅=ℤ_(2) outside its class-three congruence guard. For p=17·41, S_p is a union of the two local rings and contains 1/17. The universal predicate must therefore not be replaced by an intersection. The constant equation 1=0 has no roots, including with empty input and witness blocks.

### Dependencies

Mathlib `Poly`; Mathlib `Poly.proj`; Mathlib `Poly.const`; Mathlib `MvPolynomial.eval₂Hom`; Mathlib `Int.castRingHom`; Mathlib `MvPolynomial.eval₂Hom_C`; Mathlib `MvPolynomial.eval₂Hom_X'`; Mathlib `Poly.ext`; Mathlib `Poly.const_apply`; Mathlib `Poly.proj_apply`; Mathlib `MvPolynomial.induction_on`; Mathlib `Poly.add_apply`; Mathlib `Poly.mul_apply`; Mathlib `Poly.induction`; Mathlib `MvPolynomial.funext_set`; Mathlib `Nat.cast_injective`; Mathlib `Set.infinite_range_of_injective`; Mathlib `RingEquiv.ofBijective`; Mathlib `Poly.map_apply`; Mathlib `MvPolynomial.eval_rename`; Mathlib `MvPolynomial.exists_finset_rename`; Mathlib `Finset.toRight`; Mathlib `Finset.mem_toRight`; Mathlib `MvPolynomial.rename`; Mathlib `MvPolynomial.rename_rename`; Mathlib `Fintype.equivFin`; Mathlib `Function.extend`; Mathlib `Function.Injective.extend_apply`; Mathlib `Dioph`; Mathlib `REPred`; Mathlib `Nat.chineseRemainder`; Mathlib `Dioph.pow_dioph`; Mathlib `ComputablePred.halting_problem`; Mathlib `Nat.sum_four_squares`; [0.4 Explicit arithmetic semantics bridges](#04-explicit-arithmetic-semantics-bridges); [0.2 Semantics and composition of interpretations](#02-semantics-and-composition-of-interpretations); [TauCetiRoadmap.QuadraticFormInvariants, layer 2 quaternion algebras and the four fold splitting criterion](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion); [TauCetiRoadmap.QuadraticFormInvariants, 6c the hilbert symbol and the local hasse invariant](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md#6c-the-hilbert-symbol-and-the-local-hasse-invariant); [TauCetiRoadmap.GlobalQuadraticForms, layer 4 global square norm and approximation lemmas](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalQuadraticForms/README.md#layer-4-global-square-norm-and-approximation-lemmas); [TauCetiRoadmap.GlobalQuadraticForms, layer 6 representation and isometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalQuadraticForms/README.md#layer-6-representation-and-isometry); Mathlib `Nat.forall_exists_prime_gt_and_modEq`; [TauCetiRoadmap.HeightsRationalPointsAndObstructions, §§2.16b–2.21](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md#layer-2-adelic-spaces-and-brauer-evaluation); [TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero, §6.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md#62-snc-compactification); [TauCetiRoadmap.WeilConjectures, §5.29, Curve RH from the surface bound](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/WeilConjectures/README.md#529-curve-rh-from-the-surface-bound); [TauCetiRoadmap.Chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/Chebotarev/README.md); [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md); Mathlib `FirstOrder.Language.BoundedFormula.IsExistential`.

## Layer 5: normalized local densities and arithmetic consumers

Normalize congruence counts before forming a generating series or naming a density. Uniform local identities transfer through fixed motivic data; global analytic conclusions remain the consumers’ responsibility.

### 5.1 Congruence counts and normalized local densities

For a fixed integral coefficient datum, a fixed Denef–Pas formula Φ(x,t,n) with x∈O_K^d, parameters t in its declared definable base, and n∈ℕ, define A_K,t,n as its measurable solution set, N_K,t,n as the finite count modulo π^n only when Φ is invariant under that reduction, and a_K,t,n=µ(A_K,t,n). In that invariant case a=q_K^(−dn)N. Define P_K,t(T)=Σ_n a_K,t,n T^n. A local density is a specified limit of a chosen normalization only when existence has been proved; it is not the raw count N.

Define the level sets and measure coefficients, then prove the reduction-fibre measure q^(−dn). Record reduction invariance as a separate hypothesis before using finite counts. Obtain rationality by motivic Presburger summation and specialization.

The basic interface must include:

- For reduction-invariant Φ, normalized finite counts equal Haar volumes.
- The series records the displayed coefficients with its formal variable T.
- Allowed coefficient specializations preserve the defining formula after its fixed finite residue bound.
- A density value is introduced only with a proved convergence statement.

**Checks.**

- For all of O_K^d, N_n=q^(dn) and a_n=1.
- For x∈πO_K in one variable, a_n=q^−1 for n≥1.
- Raw counts of all of O_K grow with n and cannot be called a probability density.
- At n=0 the reduction ring has one element; its use requires the formula’s level-zero interpretation.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §14.4, Theorem 14.4.1, p.80; §16.4, Theorem 16.4.1 and Remark 16.4.2, pp.90–91.)

*Needs:* [1.1 The Denef–Pas language](#11-the-denefpas-language); [2.6 Igusa and local Poincaré rationality](#26-igusa-and-local-poincaré-rationality); [3.9 Specialization to local-field integrals](#39-specialization-to-local-field-integrals).

### 5.2 Uniform identities for local counting series

For the fixed formula and coefficients of §5.1 and fixed constructible relations between its rational generating functions, there is N such that the universally quantified relation in all allowed parameters holds over one local field of residue characteristic >N iff it holds over any other with compatibly isomorphic residue field. The same conclusion applies to specified convergent local-density formulas only after proving that their limits are represented by the fixed motivic data. No effective N or equality between unrelated valued-field parameters is asserted.

Represent each normalized counting coefficient or rational expression by the chosen motivic pushforward. Clear only the explicitly invertible denominators. Apply transfer to the resulting universal equality of constructible functions. For a limiting density first prove the limit expression is one of these fixed functions; transfer is not interchanged with an arbitrary limit.

([Raf Cluckers and François Loeser, *Constructible exponential functions, motivic Fourier transform and transfer principle*](https://arxiv.org/pdf/math/0512022), Theorem 9.2.4, p.46; §9.1, pp.40–44.)

*Needs:* [5.1 Congruence counts and normalized local densities](#51-congruence-counts-and-normalized-local-densities); [3.10 Transfer of integral identities](#310-transfer-of-integral-identities).

### 5.3 Local zeta and arithmetic-statistics interface

Export the local rational function, normalized measure, parameter domain and finite exceptional-prime policy to arithmetic-statistics consumers. For a polynomial f and Re(s)>0 put T=q^(−s), compare the specialized generating function with `∫_{O_K^d}|f|^s,` and only then identify the consumer’s local factor. Euler-product convergence, orbit stabilizers, global counting asymptotics and functional equations are additional consumer inputs, not consequences of local definability.

Match the generating-variable convention and Haar mass of O_K before substituting T. Derive the valuation-layer identity term by term in an absolute-convergence half-plane. Export the resulting formula with its poles and finite exceptional set.

([Raf Cluckers and François Loeser, *Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203), §14.4, p.80, and §16.4, pp.90–91.)

*Needs:* [5.1 Congruence counts and normalized local densities](#51-congruence-counts-and-normalized-local-densities); [2.6 Igusa and local Poincaré rationality](#26-igusa-and-local-poincaré-rationality); [3.9 Specialization to local-field integrals](#39-specialization-to-local-field-integrals).

### 5.4 Singular-fibre integral for the product map

For a nonarchimedean local field with residue size q and Haar mass µ(O)=1, the number of residue-field solutions of xy=0 is 2q−1. Over nonzero a∈m, the fibre of xy=a in O² is parametrized by |a|≤|x|≤1 with relative density |dx/x|, whose mass is (v(a)+1)(1−q^−1). Integrating this mass over a∈m∖{0} and multiplying by q² gives 2q−1. The singular fibre a=0 is not a smooth fibre endowed with that relative formula.

Count the two residue coordinate axes and subtract their shared origin. For v(a)=n≥1 split the annulus into shells v(x)=0,…,n, each with logarithmic mass 1−q^−1. Sum `q²(1−q^−1)²Σ_{n≥1}(n+1)q^−n` and evaluate the elementary series.

([Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Geometric stabilisation via p-adic integration*](https://arxiv.org/pdf/1810.06739v2), Example 2.4, p.7, equations (8)–(9).)

*Needs:* [2.12 Fubini for relative top forms](#212-fubini-for-relative-top-forms); [2.9 Weil volume and residue point counts](#29-weil-volume-and-residue-point-counts).

### Examples

For all of O^d at level n, the raw count is q^(dn) and its normalized measure is 1. For xy=0 over the residue field, the axes contribute q+q−1=2q−1. At v(a)=n≥1, the nonzero fibre xy=a has logarithmic mass (n+1)(1−q⁻¹). Its sum over a∈m∖{0}, multiplied by q², is `q²(1−q⁻¹)²∑_{n≥1}(n+1)q⁻ⁿ=2q−1.` This calculation uses only smooth nonzero fibres; it gives no relative smooth measure to the singular fibre itself.

### Dependencies

[1.1 The Denef–Pas language](#11-the-denefpas-language); [2.6 Igusa and local Poincaré rationality](#26-igusa-and-local-poincaré-rationality); [3.9 Specialization to local-field integrals](#39-specialization-to-local-field-integrals); [3.10 Transfer of integral identities](#310-transfer-of-integral-identities); [2.12 Fubini for relative top forms](#212-fubini-for-relative-top-forms); [2.9 Weil volume and residue point counts](#29-weil-volume-and-residue-point-counts).

## Layer 6: o-minimal geometry and counting

This layer builds analytic/exponential definability, finite atlases, complex algebraicity, uniform rational and bounded-degree counting and the orbit-counting bridge. It uses no functional-transcendence or Galois-orbit input; Layer 7 adds those as hypotheses. Real analytic cells used for algebraic unions are a selected-structure theorem, distinct from continuous cell decomposition in an arbitrary expansion.

### 6.1 O-minimal expansions of the real field

The acceptance predicate `IsOMinimalExpansion` uses native `Set.Definable` with all real parameters: the graphs of order, addition and multiplication are definable, and every definable unary subset of ℝ has finite topological boundary (Mathlib `frontier`, closure minus interior). On ℝ this is equivalent to being a finite union of points and open intervals, so it states an expansion of the ordered real field up to definability.

The predicate is the hypothesis of the bridge `exists_oMinimalStructure_definable_iff` of ShimuraVarieties §3.4b, with two differences: the unary condition is stated by finite topological boundary instead of as a finite union of points and open intervals, and the graphs of addition and multiplication are also required to be definable. Through the bridge, the `Set.Definable` sets of a structure satisfying `IsOMinimalExpansion` are the definable sets of an o-minimal expansion of the real field in the sense of §3.4b; its Boolean, product, fibre, projection, first-order, closure and composition laws, and the inclusion of every semialgebraic set, are those of §3.4b. Do not create a second general formula or definable-set calculus.

Prove the unary equivalence: if a set S⊆ℝ has finite boundary F, then ℝ∖F is a finite union of open intervals, each connected and disjoint from the boundary of S, hence contained in the interior of S or of its complement; so S is the union of S∩F and of some of these intervals. Conversely the boundary of a finite union of points and open intervals lies in the finite set of the points and finite endpoints.

The basic interface must include:

- A subset of ℝ has finite topological boundary if and only if it is a finite union of points and open intervals with endpoints in ℝ∪{±∞}; hence a structure satisfying `IsOMinimalExpansion` satisfies the hypotheses of the bridge of ShimuraVarieties §3.4b, and the o-minimal structure it gives contains the graphs of addition and multiplication.
- Under `IsOMinimalExpansion`, every set definable with real parameters in the ordered field ℝ, equivalently (`TauCeti.isSemialgebraic_iff_definable_real`) every semialgebraic set, is L-definable.
- A reduct along a language map L′→L whose L′-structure is the restriction of the L-structure, and in which order, addition and multiplication remain definable with parameters, again satisfies `IsOMinimalExpansion`.
- Expanding L by constant symbols for finitely many real numbers, interpreted by those numbers, does not change the sets definable with real parameters, so it preserves `IsOMinimalExpansion`.

**Checks.**

- For ℤ⊂ℝ, closure(ℤ)=ℤ and interior(ℤ)=∅, so the topological boundary is the infinite set ℤ. The closure remainder closure(ℤ)∖ℤ is empty and would give the wrong o-minimality test.
- The open interval (0,1) has boundary {0,1} and the singleton {0} has boundary {0}: both finite, the interval being open and the point closed.
- For ℚ⊂ℝ, closure(ℚ)=ℝ and interior(ℚ)=∅, so the boundary is all of ℝ, and ℚ is not a finite union of points and intervals; an expansion defining ℤ or ℚ fails the predicate.
- The empty set has empty boundary and is the empty finite union; a finite set F⊂ℝ has boundary F.
- In the empty language every unary set definable with parameters is finite or cofinite, so has finite boundary, but the order is not definable with parameters (the definable subsets of ℝ² are Boolean combinations of the lines x₀=a, x₁=a and the diagonal), so the predicate fails.

([Lou van den Dries and Chris Miller, *Geometric categories and o-minimal structures*](https://people.math.osu.edu/miller.1987/newg.pdf), §2, pp.7–9 (revised author copy); [TauCetiRoadmap.ShimuraVarieties, §3.4b](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34b-o-minimal-structures-and-definable-maps).)

*Needs:* [0.2 Semantics and composition of interpretations](#02-semantics-and-composition-of-interpretations); [TauCetiRoadmap.ShimuraVarieties, §3.4b](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34b-o-minimal-structures-and-definable-maps); Tau Ceti `TauCeti.isSemialgebraic_iff_definable_real`.

### 6.2 Restricted analytic and exponential expansions

R_an,exp is the expansion of the ordered real field constructed in [TauCetiRoadmap.ShimuraVarieties, §3.5a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#35a-the-o-minimal-structure-r_anexp): its function symbols are the real polynomial maps, the restricted analytic functions (a restricted analytic n-variable symbol denotes a function analytic at every point of [−1,1]^n, restricted to that cube and extended by zero outside it) and the unrestricted real exponential, and its relation symbol is the strict order. Define R_alg, R_an and R_exp as its reducts to the sublanguages of polynomial maps; of polynomial maps and restricted analytic functions; and of polynomial maps and the exponential. R_an-definable sets are exactly the globally subanalytic sets under the compactifying coordinate map t↦t/√(1+t²). Unrestricted real sine is in none of these languages.

Take the language and structure of R_an,exp from ShimuraVarieties §3.5a; do not construct them again. Form the three reducts along the inclusions of sublanguages, with the restricted structures. Compare R_alg-definability with the semialgebraic syntax and QE theorem of RealAlgebraicGeometry rather than redefining it. State the globally subanalytic equivalence for R_an.

The basic interface must include:

- R_alg is a reduct of R_an and of R_exp, and both are reducts of R_an,exp, each along an inclusion of languages with the restricted structure.
- R_an definability is globally subanalytic definability, not arbitrary local subanalyticity.

**Checks.**

- The function agrees with its analytic representative on the closed cube.
- Its specified extension is zero outside the cube, even if that extension is discontinuous at its boundary.
- Restricted sine is allowed; unrestricted sine would define an infinite discrete zero set.
- The unrestricted exponential belongs to R_exp and R_an,exp; it is not introduced as one restricted symbol.
- The function equal to e^x on [0,1] and 0 elsewhere, composed with x↦(x+1)/2, is e^((x+1)/2) on [−1,1] and 0 elsewhere, a restricted analytic function for the closed cube [−1,1]; it is recovered by x↦2x−1. So the [0,1]ⁿ normalization of Bakker–Klingler–Tsimerman and the [−1,1]ⁿ normalization of ShimuraVarieties §3.5a, used here, define the same sets, and R_an defines the restricted exponential although R_exp is the reduct carrying the unrestricted one.

([Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, *Tame topology of arithmetic quotients and algebraicity of Hodge loci*](https://benjamin-bakker.github.io/DefArith.pdf), §1.2, pp.2–3, with restricted analytic functions on [0,1]ⁿ; Appendix A, pp.19–21; van den Dries–Miller §2.5, pp.8–9, with the closed cube [−1,1]ⁿ of the convention here in item (4), p.9, and the o-minimality definition, p.9.)

*Needs:* [6.1 O-minimal expansions of the real field](#61-o-minimal-expansions-of-the-real-field); [TauCetiRoadmap.ShimuraVarieties, §3.5a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#35a-the-o-minimal-structure-r_anexp); [TauCetiRoadmap.RealAlgebraicGeometry, Layer 3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/RealAlgebraicGeometry/README.md#layer-3-sign-determination-and-semialgebraic-descriptions); [TauCetiRoadmap.RealAlgebraicGeometry, Layer 6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/RealAlgebraicGeometry/README.md#layer-6-cad-and-quantifier-elimination); Tau Ceti `TauCeti.isSemialgebraic_iff_definable_real`.

### 6.3 O-minimality of the selected expansions

R_an, R_exp and R_an,exp are o-minimal, R_an-definable sets are exactly the globally subanalytic sets, and R_an,exp has analytic cell decomposition. No quantifier-elimination or effective decision assertion for R_exp or R_an,exp is included.

The o-minimality of R_an,exp, with finite cell decomposition and definable dimension, is [TauCetiRoadmap.ShimuraVarieties, §3.5a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#35a-the-o-minimal-structure-r_anexp). R_an and R_exp are reducts of R_an,exp, so their o-minimality follows from the reduct theorem of §6.1; R_alg is compared with the semialgebraic dictionary of RealAlgebraicGeometry. The identification of R_an-definable sets with globally subanalytic sets (subanalytic in the compactifying coordinates t↦t/√(1+t²)) is Gabrielov's complement theorem in van den Dries' formulation. Analytic cell decomposition for R_an,exp is stated by van den Dries–Miller §4.2, p.12, citing van den Dries–Macintyre–Marker; it is used for the identity theorem on connected cells in §6.10. Finite C^p cells in a general expansion do not substitute for analytic cells.

([Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, *Tame topology of arithmetic quotients and algebraicity of Hodge loci*](https://benjamin-bakker.github.io/DefArith.pdf), §1.2, pp.2–3; van den Dries–Miller §4.1 and §4.2, p.12; [TauCetiRoadmap.ShimuraVarieties, §3.5a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#35a-the-o-minimal-structure-r_anexp).)

*Needs:* [6.2 Restricted analytic and exponential expansions](#62-restricted-analytic-and-exponential-expansions); [6.1 O-minimal expansions of the real field](#61-o-minimal-expansions-of-the-real-field); [TauCetiRoadmap.ShimuraVarieties, §3.5a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#35a-the-o-minimal-structure-r_anexp).

### 6.4 Connected components and definable paths

Fix an o-minimal expansion of ℝ, with the o-minimal structure that §6.1 attaches to it. Cells, continuous cell decomposition and the coordinate projection carrying a cell of dimension d homeomorphically onto an open cell of ℝ^d, with continuous definable inverse, are [TauCetiRoadmap.ShimuraVarieties, §3.4c](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34c-monotonicity-and-cell-decomposition); curve selection is [§3.4e](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34e-definable-choice-and-curve-selection): if a lies in the closure of a definable A⊆ℝ^n, a continuous definable γ:(0,ε)→A tends to a as t→0⁺. Prove: (a) every cell is definably path connected, and each definable set has finitely many connected components, each definable and a union of cells of every cell decomposition partitioning the set; (b) a definable connected set X is definably path connected: any two of its points are joined by a continuous definable γ:[0,1]→X.

Take a cell decomposition partitioning A (§3.4c). An open cell of ℝ^d is definably path connected, by induction on d: join two points of a band over an open cell D′ vertically to a fixed continuous definable section of the band (the midpoint of its bounds, or the finite bound shifted by 1, or 0) and follow a path of D′ along that section; so every cell, carried onto an open cell by a coordinate projection with continuous definable inverse, is definably path connected, hence connected. A component of A is therefore a union of cells of A, which gives (a). For (b), call two cells of X adjacent when one meets the closure of the other. If the adjacency graph were disconnected, the unions of the cells in two complementary classes would be disjoint, cover X and each be closed in X, against connectedness; and where a point x of one cell lies in the closure of another, curve selection, with γ(0)=x, gives a definable path from x into the other cell inside their union. Concatenating finitely many such paths, reparametrized affinely, joins any two points of X.

**Checks.**

- The hyperbola {xy=1} is the union of the two graph cells of x↦1/x over (−∞,0) and over (0,∞); each is connected, neither meets the closure of the other, so the components are {xy=1, x>0} and {xy=1, x<0}, each definable, and no definable path runs from (1,1) to (−1,−1).
- For A=[0,∞) the decomposition {(−∞,0), {0}, (0,∞)} puts the two cells {0} and (0,∞) in A; 0 lies in the closure of (0,∞), so A has one component although it contains two cells: counting cells instead of joining adjacent cells would give 2.
- The closed topologist's sine curve {(x,sin(1/x)) : x>0}∪({0}×[−1,1]) is connected but not path connected. It is definable in no o-minimal expansion of ℝ: its intersection with the axis y=0 consists of (0,0) and the points (1/(kπ),0), k≥1, an infinite set containing no interval, so not a finite union of points and intervals. So (b) does not extend beyond definable sets.

([Lou van den Dries and Chris Miller, *Geometric categories and o-minimal structures*](https://people.math.osu.edu/miller.1987/newg.pdf), component theorem 4.3 and curve selection 4.6, p.13; connectedness of cells, p.12 (author revision).)

*Needs:* [6.1 O-minimal expansions of the real field](#61-o-minimal-expansions-of-the-real-field); [TauCetiRoadmap.ShimuraVarieties, §3.4c](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34c-monotonicity-and-cell-decomposition); [TauCetiRoadmap.ShimuraVarieties, §3.4e](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34e-definable-choice-and-curve-selection).

### 6.5 Uniform bounds on the components of fibres

Fix an o-minimal expansion of ℝ, with the o-minimal structure of §6.1. Prove: for definable A⊆ℝ^(m+n) there is N such that for every x∈ℝ^m the fibre A_x={y∈ℝ^n : (x,y)∈A} has at most N connected components. The bound counts components, not points; an empty fibre has none.

Permute coordinates so that the parameter coordinates form the base of the cell construction of §3.4c, a definable homeomorphism, and take a cell decomposition partitioning A. By induction on the cell construction, the fibre over x of a cell is empty or a cell of ℝ^n, its bounding functions being the restrictions of the bounding functions of the cell; so it is connected by §6.4(a). The nonempty fibres of the cells contained in A partition A_x, each lies in one component, and N can be the number of cells.

**Checks.**

- For A={(t,x) : |x|<1, x≠t}⊂ℝ², the fibre A_t has two components for |t|<1 and one otherwise, so N=2 works and N=1 does not.
- For t=2πk, the fibre of {(t,x)∈ℝ×(0,1) : sin(tx)>0} is the union of the k intervals (j/k,(2j+1)/(2k)), j=0,…,k−1; the counts are unbounded, so this set is definable in no o-minimal expansion of ℝ.
- For A=ℝ×(0,1)⊂ℝ² every fibre is the infinite interval (0,1), with one component, so N=1. Uniform finiteness of §3.4c bounds the cardinality of finite fibres and says nothing here; the bound on components is the statement that applies.
- For m=0 there is a single fibre, A itself, and the statement is the finiteness of components of §6.4(a).

([Lou van den Dries and Chris Miller, *Geometric categories and o-minimal structures*](https://people.math.osu.edu/miller.1987/newg.pdf), uniform bounds on fibres 4.4, p.13 (author revision).)

*Needs:* [6.4 Connected components and definable paths](#64-connected-components-and-definable-paths); [TauCetiRoadmap.ShimuraVarieties, §3.4c](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34c-monotonicity-and-cell-decomposition).

### 6.6 Finite definable atlases and corners

Fix an o-minimal expansion R of the real field. The finite-atlas and overlap calculus in R_an,exp, without corners, is ShimuraVarieties §3.5a; this section is its form for an arbitrary R and with corners. An R-definable n-manifold with corners is a Hausdorff paracompact space with a finite atlas φ_i:U_i→X, where U_i is definable and relatively open in an orthant ℝ_≥0^k×ℝ^(n−k), the images are open and cover X, and every overlap and transition φ_j⁻¹∘φ_i is definable. Atlases are equivalent when their mixed transitions are definable. Subsets and maps are definable in these finite charts; a map is tested by its graph. Analytic regularity means transitions extend real analytically to ambient neighbourhoods, and uses the existing manifold-with-corners substrate.

Add a finite definability certificate to the existing topological/charted-space data. Prove equivalence of atlases by composing transitions and taking finite unions of chart graphs. Transport graph-definability through the mixed transitions.

The basic interface must include:

- Equivalent finite atlases give the same definable subsets and maps.
- A map is definable exactly when its chart graphs are definable.
- Finite chart products define the product manifold with corners.
- Definable images, pullbacks and finite gluing are definable.

**Checks.**

- The usual one-chart atlas makes ℝ an R_alg-definable manifold.
- The closed quadrant has its relative-open orthant charts; it is not ambient-open at its vertex.
- A countably infinite family of isolated point charts does not by itself give a finite definable atlas.
- For charts from coordinates to X the mixed map is φ_j⁻¹∘φ_i.

([Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, *Tame topology of arithmetic quotients and algebraicity of Hodge loci*](https://benjamin-bakker.github.io/DefArith.pdf), Appendix A.1–A.2, pp.19–20.)

*Needs:* [6.4 Connected components and definable paths](#64-connected-components-and-definable-paths); [6.2 Restricted analytic and exponential expansions](#62-restricted-analytic-and-exponential-expansions); [TauCetiRoadmap.ShimuraVarieties, §3.5a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#35a-the-o-minimal-structure-r_anexp); [TauCetiRoadmap.DifferentialGeometry, “Boundary and corners”](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DifferentialGeometry/README.md#boundary-and-corners).

### 6.7 Definable structure of complex algebraic varieties

A complex algebraic variety of finite type acquires its canonical R_alg-definable space structure by finite affine charts, identifying ℂ^n with ℝ^(2n). For smooth varieties this is a definable complex manifold; singular varieties retain a finite definable space atlas without a false manifold assertion. Morphisms are definable, and finite affine-cover refinements give the same structure.

Rewrite complex polynomial equations by their real and imaginary parts. Use finite affine covers and regular transition maps on their nonvanishing loci. Compare cover refinements by finite gluing.

The basic interface must include:

- An affine variety is the common zero locus of the real and imaginary polynomial equations.
- Regular maps and their compositions are definable.
- The manifold claim is restricted to the smooth locus.
- Changing a finite affine cover preserves definable subsets.

**Checks.**

- The complex affine line gives ℝ².
- The two standard charts of ℙ¹ have definable inversion on their overlap.
- A nodal curve is definable but is not declared a smooth manifold at its node.

([Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, *Tame topology of arithmetic quotients and algebraicity of Hodge loci*](https://benjamin-bakker.github.io/DefArith.pdf), Theorem 4.13 context, p.18; Mok–Pila–Tsimerman §2.2, p.5.)

*Needs:* [6.6 Finite definable atlases and corners](#66-finite-definable-atlases-and-corners); Mathlib `AlgebraicGeometry.IsAffineOpen`; Mathlib `Algebra.FiniteType.iff_quotient_mvPolynomial''`.

### 6.8 Definable Remmert–Stein closure

In an o-minimal expansion of R_an, let Y be a complex quasi-projective variety, E⊂Y a closed definable complex analytic subset, and A⊂Y∖E a relatively closed definable complex analytic subset. Prove that its closure in Y is definable and complex analytic, including singular Y. The manifold closure theorem used in the proof is imported from ShimuraVarieties §3.5d.

The manifold case is supplied by TauCetiRoadmap.ShimuraVarieties §3.5d; the additional target is closure in a singular quasi-projective ambient space. By the local criterion of Peterzil–Starchenko Theorem 4.1, it suffices that dim_ℝ fr_U(A∩U)≤dim_ℝ(A∩U)−2 for every open U; working locally with A definable, Theorem 3.2 applied to each connected component M_i of the regular locus of A∩U gives M_i⊆E or dim_ℝ(cl(M_i)∩E)≤dim_ℝM_i−2, and the first alternative is excluded because A∩E=∅. For a singular quasi-projective ambient Y, write Y as a closed subvariety of an open subset W of projective space: W is a smooth definable complex manifold, E is closed analytic in W, and A is closed analytic in W∖E, so the manifold theorem in W gives the closure, which lies in Y because Y is closed in W. Mok–Pila–Tsimerman §2.2 states the application.

([Ya’acov Peterzil and Sergei Starchenko, *Complex analytic geometry and analytic-geometric categories*](https://math.haifa.ac.il/kobi/analytic.pdf), Theorem 3.2, p.10; Theorem 4.1, p.10; Theorem 4.4 and proof, p.12, author copy dated 22 July 2005; [Ngaiming Mok, Jonathan Pila and Jacob Tsimerman, *Ax–Schanuel for Shimura varieties*](https://arxiv.org/pdf/1711.02189), Theorem 2.1, §2.2, p.5.)

**Checks.**

- In Y=ℂ with E={0} and A=ℂ∖{0}, the closure is ℂ, defined by the zero ideal.
- In the node Y={xy=0}, with E={(0,0)} and A={(x,0):x≠0}, the closure is the single branch {y=0}, including its singular meeting point.
- For E=Y the only permitted A is ∅ and its closure is ∅; no positive dimension is imposed on an empty locus.

*Needs:* TauCetiRoadmap.ShimuraVarieties §3.5d; [6.7 Definable structure of complex algebraic varieties](#67-definable-structure-of-complex-algebraic-varieties); [6.4 Connected components and definable paths](#64-connected-components-and-definable-paths); [TauCetiRoadmap.ShimuraVarieties, §3.4d](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34d-definable-dimension).

### 6.9 Definable complex analytic Chow theorem

If Y is a complex quasiprojective variety and A⊂Y is closed in Y, complex analytic and definable in an o-minimal expansion of R_an, then A is algebraic. For a smooth Y and an expansion containing R_an this includes BKT Theorem 4.13. Boolean combinations of closed definable complex analytic sets are constructible algebraic. Closedness is relative to Y, not necessarily to a projective compactification.

For smooth Y this is [TauCetiRoadmap.ShimuraVarieties, §3.5d](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#35d-definable-chow). For general quasi-projective Y, write Y as a closed subvariety of an open subset W of projective space; A is closed in Y, hence closed complex analytic and definable in the smooth variety W, so §3.5d makes A algebraic in W and therefore in Y. Boolean combinations follow by induction on the finite Boolean decomposition. Peterzil–Starchenko prove the affine case by definable Remmert–Stein (§6.8) for the closure in ℙⁿ followed by Chow's theorem (Corollary 4.5).

([Ya’acov Peterzil and Sergei Starchenko, *Complex analytic geometry and analytic-geometric categories*](https://math.haifa.ac.il/kobi/analytic.pdf), Corollary 4.5 and proof, p.12, for the affine case; [Ngaiming Mok, Jonathan Pila and Jacob Tsimerman, *Ax–Schanuel for Shimura varieties*](https://arxiv.org/pdf/1711.02189), Theorem 2.2 and Corollary 2.3, p.5; BKT Theorem 4.13, p.18.)

**Checks.**

- The branch {y=0} in the nodal variety {xy=0} is closed analytic and algebraic although the ambient is singular.
- In ℂ×, the subset {1} is relatively closed and algebraic, with ideal (z−1) in ℂ[z,z⁻¹]; properness of the ambient is unnecessary.
- The empty subset has ideal (1), and the whole variety has ideal (0). Their Boolean difference is again constructible.

*Needs:* [6.8 Definable Remmert–Stein closure](#68-definable-remmertstein-closure); [6.7 Definable structure of complex algebraic varieties](#67-definable-structure-of-complex-algebraic-varieties); [TauCetiRoadmap.ShimuraVarieties, §3.5d](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#35d-definable-chow).

### 6.10 Finite reduction of a definable algebraic union

Let A be a complex quasiprojective variety and (Vᵢ) a countable family of closed complex algebraic subvarieties. If X=⋃ᵢVᵢ is definable in R_an,exp, then X is a finite subunion. The proof uses finite real analytic cell decomposition for this selected structure; arbitrary o-minimal expansions are not silently assigned analytic cells. Closedness and algebraicity of the Vᵢ are retained.

Take a finite decomposition of X into connected real analytic cells in R_an,exp (§6.3), refining a finite affine cover of the ambient variety. On one such cell U, the relatively closed analytic sets U∩Vᵢ form a countable cover. Baire category gives one intersection with nonempty interior. Each polynomial vanishing on Vᵢ then vanishes on a nonempty open part of U and hence all of connected analytic U. Thus U lies in Vᵢ. Select one index for each of finitely many cells.

A countable union of points filling the rational numbers is not definable in an o-minimal real structure. The theorem does not assert that a general countable definable family has a finite subcover. Every polynomial identity is continued within one connected real analytic cell.

Use real analytic cells for R_an,exp and closed algebraic members. On one cell Baire gives an intersection with interior; polynomial identities continue on the connected analytic cell. Arbitrary o-minimal C^p decomposition is insufficient for this identity argument.

([Jonathan Pila and Jacob Tsimerman, *Ax-Lindemann for A_g*](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p05-p.pdf), Lemma 7.7 and proof, p.678.)

*Needs:* [6.4 Connected components and definable paths](#64-connected-components-and-definable-paths); [6.3 O-minimality of the selected expansions](#63-o-minimality-of-the-selected-expansions); [6.7 Definable structure of complex algebraic varieties](#67-definable-structure-of-complex-algebraic-varieties).

### 6.11 Algebraic part of a definable set

For X⊂ℝ^n define X_alg as the union of all connected positive-dimensional semialgebraic subsets of X; define X_trans=X∖X_alg. This algebraic part is a set, not a claim that the union is definable. Real parameters are permitted in the semialgebraic pieces. Positive dimension and containment in X are required.

Use native `TauCeti.IsSemialgebraic` and Tau Ceti's `TauCeti.semialgebraicDim`, which on sets definable in an o-minimal structure on ℝ is the o-minimal dimension (ShimuraVarieties §3.4d). The acceptance definition `algebraicPart` expresses positive dimension of a connected semialgebraic set by the equivalent condition that it is not a subsingleton: a connected subset of ℝ^n with two distinct points is infinite, a semialgebraic set of dimension 0 is a finite union of point cells, and a singleton has dimension 0. Form the set-theoretic union; prove monotonicity and the effect of semialgebraic coordinate maps.

The basic interface must include:

- X⊂Y implies X_alg⊂Y_alg.
- Every connected positive-dimensional semialgebraic subset of X is in X_alg.
- For finite X, X_alg=∅.
- A positive-dimensional connected semialgebraic component contributes itself; isolated points do not.

**Checks.**

- For X=(0,1), X_alg=X.
- For X={0}, X_alg=∅.
- The graph of real exp on an interval has no positive-dimensional semialgebraic arc.
- The algebraic part of the restricted x^y surface can have infinitely many components, so it is not given a definability instance.

([Jonathan Pila and Alex Wilkie, *The rational points of a definable set*](https://doi.org/10.1215/S0012-7094-06-13336-7), Definition 1.4 and §1, pp.592–594; Pila 2009 §3 examples, p.5.)

*Needs:* Tau Ceti `TauCeti.IsSemialgebraic`; Tau Ceti `TauCeti.semialgebraicDim`; [TauCetiRoadmap.ShimuraVarieties, §3.4d](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34d-definable-dimension); [TauCetiRoadmap.RealAlgebraicGeometry, Layer 3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/RealAlgebraicGeometry/README.md#layer-3-sign-determination-and-semialgebraic-descriptions); [TauCetiRoadmap.RealAlgebraicGeometry, Layer 6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/RealAlgebraicGeometry/README.md#layer-6-cad-and-quantifier-elimination).

### 6.12 Rational and algebraic counting height interface

The height of a rational number is Mathlib's `Height.mulHeight₁`, which on ℚ is max(|a|,b) for a reduced fraction a/b with b>0 (`Rat.mulHeight₁_eq_max`). A rational tuple has height at most T exactly when every coordinate does; this is the maximum-height condition of Pila–Wilkie, and the empty tuple satisfies it for every T≥1. No separate tuple-height definition is introduced.

For rational a/b in lowest terms with b>0 use H=max(|a|,b), and for a tuple use the maximum coordinate height, with H(())=1. Import absolute multiplicative Weil height and bounded-degree Northcott from DiophantineApproximationAndTranscendence §§0.2–0.3 for algebraic coordinates. Keep degree bounded separately in each coordinate; the field generated by all coordinates need not have that same degree. Relate polynomial coefficient heights to Weil height using the Mahler inequalities of DiophantineApproximationAndTranscendence §0.2 before transferring a counting estimate.

Use Mathlib `Rat.mulHeight₁_eq_max` (Mathlib/NumberTheory/Height/NumberField.lean, line 532) and the maximum over finitely many coordinates. Convert coefficient height ≤2^kH^k using the comparison of §0.2 there, keeping k fixed. Apply bounded-degree Northcott coordinatewise to make each counting set finite.

([Jonathan Pila and Alex Wilkie, *The rational points of a definable set*](https://doi.org/10.1215/S0012-7094-06-13336-7), §1, pp.591–593; Pila 2009 §5, pp.7–8.)

**Checks.**

- For −3/4, the reduced numerator absolute value is 3 and denominator 4, giving H=4; the sign has no effect.
- The tuple (−3,2) has H=max(3,2)=3, while the empty tuple has H=1.
- The rational 0 has numerator 0 and denominator 1, so H(0)=1 rather than 0.

*Needs:* Mathlib `Height.mulHeight₁`; Mathlib `Rat.mulHeight₁_eq_max`; [TauCetiRoadmap.DiophantineApproximationAndTranscendence, §0.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md#02-mahler-measure-house-and-absolute-height); [TauCetiRoadmap.DiophantineApproximationAndTranscendence, §0.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md#03-finiteness-and-size-estimates).

### 6.13 Definable semialgebraic blocks

A basic block of dimension d is a connected definable C¹-regular subset U of a semialgebraic C¹ locus A of the same dimension d, locally open in that locus; include a singleton at d=0. A block is a continuous semialgebraic image of a basic block, with the map defined on a semialgebraic set containing it. Families carry these conditions fibrewise. Blocks may be definable without being semialgebraic as entire sets. Positive-dimensional blocks contained in X lie in X_alg.

Package the ambient semialgebraic locus and regularity certificate. For positive dimension, cover a definable path by finitely many semialgebraic neighbourhoods and replace its pieces by semialgebraic paths. Push those paths through the continuous semialgebraic map to prove algebraic-part containment.

The basic interface must include:

- Every point is a zero-dimensional basic block.
- A continuous semialgebraic map sends a basic block to a block.
- A positive-dimensional block in X is contained in X_alg.
- The union of positive-dimensional fibres of a block family is definable and contained in X_alg.

**Checks.**

- A point is allowed but contributes nothing to X_alg.
- A connected open interval is a positive-dimensional basic block.
- An arbitrary definable image, such as the graph of exp, need not be a block; the image map must be semialgebraic.
- A definable open subset of a semialgebraic manifold can be a basic block without being globally semialgebraic.

([Jonathan Pila, *On the algebraic points of a definable set*](https://people.maths.ox.ac.uk/pila/Algebraic.pdf), Definition 3.2 and Proposition 3.4, pp.5–6 (author copy); Selecta pp.157–158.)

*Needs:* [6.4 Connected components and definable paths](#64-connected-components-and-definable-paths); [6.11 Algebraic part of a definable set](#611-algebraic-part-of-a-definable-set); [TauCetiRoadmap.ShimuraVarieties, §3.4d](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34d-definable-dimension).

### 6.14 Pila–Wilkie rational-point counting

The acceptance theorem `pila_wilkie` states the parameter-uniform bound below on native definable fibres, using `algebraicPart` and the coordinatewise bound `Height.mulHeight₁ (x i) ≤ T` of §6.12.

For every definable family X⊂ℝ^n×ℝ^m and every ε>0 there is C(X,ε)>0 such that for every parameter t and every T≥1, #{x∈X_t∩ℚ^n:H(x)≤T, x∉(X_t)_alg}≤C T^ε. The stronger source form removes a definable family `X_{t,ε}⊂(X_t)_alg` instead. Constants may depend on the family and ε but not on t or T. No computable constant or logarithmic bound is claimed.

Apply the parameter-uniform block decomposition of AbelianSchemesAndArithmeticModuliPartII B2.6 with no unrestricted coordinates (b=0). By §6.13, every positive-dimensional block lies in (X_t)_alg. Every block of dimension zero is a singleton, so at most C T^ε points remain outside (X_t)_alg. The union of the positive-dimensional fibres of the finitely many block families gives the definable family `X_{t,ε}` in the stronger form. The parametrization and determinant arguments are inputs of B2.6.

**Checks.**

- For X_t=(0,1), the algebraic part is all of X_t and the remaining count is 0.
- A singleton fibre has empty algebraic part and at most one rational point; C≥1 covers it for T≥1.
- For n=0 a fibre is empty or the singleton empty tuple, of height 1; the counts are 0 and 1.

([Jonathan Pila and Alex Wilkie, *The rational points of a definable set*](https://doi.org/10.1215/S0012-7094-06-13336-7), Theorems 1.8 and 1.10, pp.595–597; proof §7, pp.611–613.)

*Needs:* [6.11 Algebraic part of a definable set](#611-algebraic-part-of-a-definable-set); [6.12 Rational and algebraic counting height interface](#612-rational-and-algebraic-counting-height-interface); TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII B2.6; [6.13 Definable semialgebraic blocks](#613-definable-semialgebraic-blocks); [6.4 Connected components and definable paths](#64-connected-components-and-definable-paths).

### 6.15 Integral points and images of blocks

Use the parameter-uniform block decomposition of TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII B2.6. The additional statements here are its integral-point and continuous-semialgebraic-image corollaries. Integral tuples of maximum absolute coordinate ≤T, T≥1, have rational height ≤T and therefore admit the same O(T^ε) covering by blocks. A continuous semialgebraic map, defined on semialgebraic ambient sets containing the blocks, takes that covering to at most the same number of image blocks; positive-dimensional images lie in the algebraic part, and zero-dimensional images are points (Pila 2009, Theorem 3.5 and Proposition 3.4, pp.5–6).

**Checks.**

- The integer tuple (−3,2) has rational height 3, equal to its maximum absolute coordinate.
- A constant map sends the interval (0,1) to one point, a zero-dimensional image block with empty algebraic part.
- The identity on (0,1) preserves its positive-dimensional block and its algebraic part. The map t↦(t,exp t) is not semialgebraic and has no such image-block conclusion.

*Needs:* TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII B2.6; [6.13 Definable semialgebraic blocks](#613-definable-semialgebraic-blocks); [6.12 Rational and algebraic counting height interface](#612-rational-and-algebraic-counting-height-interface).

### 6.16 Counting algebraic points of bounded degree

The acceptance theorem `bounded_degree_counting` states the uniform bound outside the algebraic part, with explicit algebraicity, minimal-polynomial degree and native absolute-height conditions on every real coordinate. Fix k≥1, a definable family X and ε>0. The points x in each fibre whose real coordinates are algebraic of degree individually ≤k and absolute multiplicative Weil height ≤T are covered by at most C(X,k,ε)T^ε blocks. Consequently the number outside X_alg has that bound. Encode each coordinate by a nonzero coefficient vector (a₀,…,a_k) of length k+1 and polynomial `Σ_{j=0}^k` a_j t^j; the constant term and all k other coefficients are retained.

Use the height comparison of DiophantineApproximationAndTranscendence §0.2 to find a coefficient vector of height ≤2^kT^k for every coordinate. Partition the nonzero coefficient space into semialgebraic strata with continuous ordered real-root branches; a polynomial of degree ≤k has at most k roots. Apply block counting in coefficient space with exponent smaller than ε/k and push blocks through these root branches. Use Northcott only after fixing the coordinatewise degree and height bounds.

([Jonathan Pila, *On the algebraic points of a definable set*](https://people.maths.ox.ac.uk/pila/Algebraic.pdf), Theorem 1.6, p.2; §5, Lemma 5.2 and Theorem 5.3, pp.7–8; Tsimerman §§6.2–6.3, pp.387–388.)

**Checks.**

- For √2 the minimal polynomial is X²−2 and the absolute height is √2; it is admitted when k=2,T=2, and excluded when k=1. Its coefficient height 2 is at most 2²·2²=16.
- The tuple (√2,√3) has coordinate degrees 2 although its generated field has degree 4; k=2 admits it at T=2.
- A transcendental real has native total absolute height 1 and zero minimal polynomial, whose natural degree is 0. The explicit algebraicity condition excludes it even at T=1; degree and total height alone would not.
- For n=0 there is one empty tuple, with all coordinate conditions vacuous; a nonempty fibre has count 1 and empty algebraic part.

*Needs:* TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII B2.6; [6.15 Integral points and images of blocks](#615-integral-points-and-images-of-blocks); [6.12 Rational and algebraic counting height interface](#612-rational-and-algebraic-counting-height-interface); [6.13 Definable semialgebraic blocks](#613-definable-semialgebraic-blocks); [TauCetiRoadmap.DiophantineApproximationAndTranscendence, §0.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md#02-mahler-measure-house-and-absolute-height).

### 6.17 Orbit growth versus definable counting

Let X⊆T×ℝ^n be a fixed definable family. Suppose independent arithmetic inputs associate to each special point s of complexity D_s a parameter t_s∈T and a finite set Σ_s⊆X_(t_s) of at least cD_s^δ distinct lifts, each with coordinatewise degree ≤k and height ≤CD_s^A, for fixed c,C,δ,A>0 and k. Neither the set of special parameters nor Σ_s is required to be definable. For ε with Aε<δ and D_s sufficiently large, at least one member of Σ_s lies in a positive-dimensional block of X_(t_s). Layer 7 turns such a block into a special subvariety through s under its stated inputs, with Galois transport back to s when the lift represents a conjugate.

Insert T=CD_s^A into the uniform block estimate and compare exponents. For large D_s the number of lifts exceeds the number of singleton blocks, so some lift lies in a positive-dimensional block. Identifying a geometric locus through that block is not part of this theorem.

([Jacob Tsimerman, *The André–Oort conjecture for A_g*](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), §6.2–6.4, pp.387–388.)

*Needs:* [6.16 Counting algebraic points of bounded degree](#616-counting-algebraic-points-of-bounded-degree); [6.15 Integral points and images of blocks](#615-integral-points-and-images-of-blocks).

### Examples

For a line X⊂ℝ², cl(X)∖X=∅ although its ambient topological boundary is X. A singleton has empty algebraic part. For the supplied semirational counting theorem, the set [0,1]×{z₀} may contain many rational first coordinates but has only one second projection and cannot force a path with nonconstant second coordinate. If an orbit supplies cD^δ lifts of height at most CD^A, choose ε<δ/A; for large D their number exceeds the O(D^(Aε)) singleton blocks.

### Dependencies

TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII B2.6; [0.2 Semantics and composition of interpretations](#02-semantics-and-composition-of-interpretations); Mathlib `AlgebraicGeometry.IsAffineOpen`; Tau Ceti `TauCeti.IsSemialgebraic`; Tau Ceti `TauCeti.isSemialgebraic_iff_definable_real`; Tau Ceti `TauCeti.semialgebraicDim`; [TauCetiRoadmap.RealAlgebraicGeometry, Layers 3 and 6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/RealAlgebraicGeometry/README.md#layer-3-sign-determination-and-semialgebraic-descriptions); [TauCetiRoadmap.DifferentialGeometry, “Boundary and corners”](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DifferentialGeometry/README.md#boundary-and-corners); [TauCetiRoadmap.ShimuraVarieties, §§3.4b–3.4e](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#34b-o-minimal-structures-and-definable-maps); [TauCetiRoadmap.ShimuraVarieties, §3.5a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#35a-the-o-minimal-structure-r_anexp); [TauCetiRoadmap.ShimuraVarieties, §3.5d](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#35d-definable-chow); [TauCetiRoadmap.DiophantineApproximationAndTranscendence, §§0.2–0.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md#layer-0-heights-and-approximation-exponents).

## Layer 7: Pila–Zannier reductions under explicit inputs

Each theorem here combines the counting of Layer 6 with geometric and arithmetic inputs from the theory of Shimura varieties, Hodge theory and complex multiplication. Each input is a named hypothesis with its exact content and the source that proves it; no theorem of this layer depends on a roadmap that consumes Layer 6. Discharging the hypotheses gives the unconditional theorems of Tsimerman, André, Lawrence–Sawin and Gao.

### 7.1 The André–Oort input datum for A_g

Fix g≥1. Let ℋ_g⊂Sym_g(ℂ) be the Siegel space, `Γ=Sp_{2g}(ℤ),` A_g=Γ\ℋ_g the coarse moduli variety over ℂ with its quasi-projective structure and the R_alg-definable structure of §6.7, and π:ℋ_g→A_g the uniformization. Let 𝔉_g be the standard Siegel fundamental set and 𝔉̄_g its closure in ℋ_g. For a special point x write A_x for the CM abelian variety, R_x for the centre of End(A_x) and D(x)=|disc R_x|. Weakly special subvarieties are the images of X₁⁺×{y} for a Shimura subdatum (H,X_H) of the Siegel datum and a splitting (H^ad,X⁺)=(H₁,X₁⁺)×(H₂,X₂⁺); they are special when y is special (Pila–Tsimerman 2014, §2, p.663). Define the André–Oort input datum for g as the conjunction of the following propositions about these fixed objects.

- (I-def) (a) The restriction of π to 𝔉̄_g is definable in R_an,exp (Peterzil–Starchenko's definability of restricted theta functions, as used in Tsimerman §6.3, p.388). (b) For every Shimura subdatum (G,X_G) of the Siegel datum there is a semialgebraic S_G⊆X_G⁺ with G(ℤ)⁺·S_G=X_G⁺ and π|S_G definable in R_an,exp (Pila–Tsimerman 2014, Theorem 4.4(1),(3), p.668).
- (I-ws) From Pila–Tsimerman 2014: (a) a weakly special subvariety is special if and only if it contains a special point (p.663, citing Moonen). (b) An irreducible algebraic S⊆ℋ_g is weakly special if and only if π(S) is algebraic (Ullmo–Yafaev; Lemma 2.1, p.663). (c) Every weakly special subvariety is G₀(ℝ)⁺·Z₀ for a semisimple ℚ-subgroup G₀ without compact ℚ-factors (Lemma 2.3, pp.663–664). (d) For irreducible V⊆A_g and each F in the class 𝒞 of Pila–Tsimerman §7, N(F) is reductive and only finitely many special N(F)_sh(ℝ)⁺-orbits occur; when N(F)_sh=G, the splitting map ψ identifies the special F-orbits in V with the special points of an auxiliary closed V′⊆A_g of smaller dimension (Lemmas 7.2–7.3, pp.674–675, and pp.676–677). (e) The union of the positive-dimensional weakly special subvarieties of V is a countable union of algebraic subvarieties and is R_an,exp-definable (Lemmas 7.5–7.6, p.677).
- (I-AL) For irreducible algebraic V⊆A_g and a connected irreducible semialgebraic W⊆π⁻¹(V) there is a weakly special S⊆V with W⊆π⁻¹(S) (hyperbolic Ax–Lindemann, semialgebraic form; Pila–Tsimerman 2014, Theorem 6.1, p.670).
- (I-orbit) There are b_g,c_g>0 with D(x)≤c_g·#(Gal(ℚ̄/ℚ)·x)^(b_g) for every special x (Tsimerman, Theorem 5.2, pp.385–386; Pila–Tsimerman 2014, Conjecture 7.1, p.673).
- (I-lift) There are k_g, a_g and C_g such that every special x has a preimage z∈𝔉̄_g whose real coordinates are algebraic of degree at most k_g with H(z)≤C_g·D(x)^(a_g) (Pila–Tsimerman 2013, Theorem 3.1, as used in Pila–Tsimerman 2014, Lemma 7.4, p.675, with k_g=2g; Tsimerman, §6.2, p.387).

The constants are ineffective, and nothing is computed from them.

The basic interface must include:

- by (I-lift) and bounded-degree Northcott, only finitely many special x have D(x)<B (Pila–Tsimerman 2014, Lemma 7.4, p.675).
- for V defined over a number field L and special x∈V, the Gal(ℚ̄/L)-conjugates of x lie on V, have the same D, and give at least (D(x)/c_g)^(1/b_g)/[L:ℚ] distinct points of π⁻¹(V)∩𝔉̄_g of coordinate degree at most k_g and height at most C_g·D(x)^(a_g).
- by (I-AL) and (I-ws)(a), a connected positive-dimensional semialgebraic subset of π⁻¹(V) through a lift of a special point x lies in π⁻¹ of a positive-dimensional special subvariety of V through x.

**Checks.**

- For g=1 and the reduced form (a,b,c) of discriminant D=b²−4ac<0, |b|≤a≤c, the lift τ=(−b+√D)/(2a) has Re τ=−b/(2a) rational of height at most 2a≤|D| (as 3a²≤|D|), and Im τ=√|D|/(2a) has minimal polynomial dividing 4a²X²−|D|, of degree at most 2: so k₁=2=2g and a₁=1 suffice.
- For g=1, #(Gal·j(τ))=h(𝒪) for the order 𝒪 of discriminant D=disc R_x, and (I-orbit) is the Landau–Siegel bound h(𝒪)≫_ε|D|^(1/2−ε); any b₁>2 works, ineffectively.
- π itself is not definable in any o-minimal structure, since its fibre over a point is an infinite discrete Γ-orbit; definability is asserted only on S_G and 𝔉̄_g.
- In A₁ every point is a zero-dimensional weakly special subvariety but only CM points are special; the clause (I-ws)(a) is what turns the weakly special output of (I-AL) into a special subvariety.

*Needs:* [6.7 Definable structure of complex algebraic varieties](#67-definable-structure-of-complex-algebraic-varieties); [6.12 Rational and algebraic counting height interface](#612-rational-and-algebraic-counting-height-interface); [TauCetiRoadmap.DiophantineApproximationAndTranscendence, §0.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md#03-finiteness-and-size-estimates).

### 7.2 Finite exceptional CM points

Assume the André–Oort input datum for g. For an algebraic V⊆A_g defined over a number field, only finitely many special points of V lie on no positive-dimensional special subvariety contained in V.

Fix a number field L of definition and work componentwise. Use Y⁰=π⁻¹(V)∩𝔉̄_g, definable by (I-def)(a), as the ambient counting family. For a special x avoiding the positive-dimensional special subvarieties of V, the conjugate-lift clause of §7.1 gives a finite set Σ_x of at least (D(x)/c_g)^(1/b_g)/[L:ℚ] lifts of degree at most k_g and height at most C_g·D(x)^(a_g); Σ_x need not be definable. Avoidance persists under conjugation over L, since conjugates of special subvarieties of V are special subvarieties of V. If D(x) is large, §6.17 with §6.16 places some member of Σ_x in a positive-dimensional block, hence in a connected positive-dimensional semialgebraic subset of Y⁰; the promotion clause of §7.1 gives a positive-dimensional special subvariety of V through that conjugate, and conjugating back contradicts avoidance. So D(x) is bounded, and the bounded-discriminant clause of §7.1 finishes. Neither the union of the special subvarieties of V nor its complement is assumed definable.

([Jonathan Pila and Jacob Tsimerman, *Ax-Lindemann for A_g*](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p05-p.pdf), proof of Theorem 7.1, first paragraph, p.676; [Jacob Tsimerman, *The André–Oort conjecture for A_g*](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), §§6.1–6.4, pp.387–388.)

*Needs:* [7.1 The André–Oort input datum for A_g](#71-the-andréoort-input-datum-for-a_g); [6.17 Orbit growth versus definable counting](#617-orbit-growth-versus-definable-counting); [6.16 Counting algebraic points of bounded degree](#616-counting-algebraic-points-of-bounded-degree).

### 7.3 Finite special families and dimension induction

Assume the André–Oort input datum for g. Every irreducible closed V⊆A_g contains only finitely many maximal special subvarieties.

Induct on dim V; it suffices to show that V is special when its special points are Zariski dense. By §7.2 all but finitely many special points of V lie on positive-dimensional special subvarieties of V, so it suffices to show that there are finitely many maximal positive-dimensional ones. Each is π(F(ℝ)⁺·y) for some F∈𝒞 by (I-ws)(c). If N(F)_sh≠G, (I-ws)(d) places these in finitely many special subvarieties meeting V properly, and induction applies. If N(F)_sh=G, (I-ws)(d) identifies them with the special points of V′ of smaller dimension, and induction gives finiteness. By (I-ws)(e) the union of the positive-dimensional weakly special subvarieties of V is a definable countable union of algebraic subvarieties, so §6.10 reduces it to finitely many F, and Zariski density of special points in each special subvariety places it in one of the finitely many corresponding special families. Definability of a countable union does not by itself make an arbitrary family finite; the algebraic-family and maximality inputs are used.

([Jonathan Pila and Jacob Tsimerman, *Ax-Lindemann for A_g*](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p05-p.pdf), Theorem 7.1, p.673, and proof with Lemmas 7.2–7.7, pp.674–678; [Jacob Tsimerman, *The André–Oort conjecture for A_g*](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), §6.5, p.388.)

*Needs:* [7.2 Finite exceptional CM points](#72-finite-exceptional-cm-points); [6.10 Finite reduction of a definable algebraic union](#610-finite-reduction-of-a-definable-algebraic-union); [6.4 Connected components and definable paths](#64-connected-components-and-definable-paths).

### 7.4 André–Oort for A_g under its input datum

Assume the André–Oort input datum for g. For every algebraic V⊆A_g the Zariski closure of the special points of V is a finite union of special subvarieties. Each input is a theorem: (I-def) is Pila–Tsimerman 2014 Theorem 4.4, (I-ws) is their §§2 and 7 with Moonen and Ullmo–Yafaev, (I-AL) is their Theorem 6.1, (I-orbit) is Tsimerman's Theorem 5.2 (via the averaged Colmez formula and isogeny estimates), and (I-lift) is Pila–Tsimerman 2013 Theorem 3.1. With them discharged this is Tsimerman's unconditional Theorem 1.3 for every g≥1. No statement for general or mixed Shimura varieties is made here.

Pass to the irreducible components of the Zariski closure of the special points; each has dense special points, so by §7.3 it is special. Zero-dimensional components are special points.

([Jacob Tsimerman, *The André–Oort conjecture for A_g*](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Theorem 1.3, p.380; Theorem 5.3, p.386; §6, pp.387–388.)

*Needs:* [7.3 Finite special families and dimension induction](#73-finite-special-families-and-dimension-induction); [7.2 Finite exceptional CM points](#72-finite-exceptional-cm-points).

### 7.5 CM-pair finiteness on a nonmodular curve

Let ι:A₁×A₁→A₂ send (E₁,E₂) to E₁×E₂ with the product principal polarization, and identify A₁×A₁ with ℂ² by (j₁,j₂). Define the product-locus input datum as the conjunction of: (P1) ι is a finite morphism of Shimura varieties onto a special surface, and every irreducible component of the preimage under ι of a special subvariety is special; (P2) the positive-dimensional proper special subvarieties of ℂ² are the lines {j₁=a} and {j₂=a} where a is a CM j-invariant and the modular curves Φ_N(j₁,j₂)=0, N≥1. Assume the André–Oort input datum for g=2 and the product-locus input datum. Then for every irreducible algebraic curve C⊆ℂ² that is none of these special curves, only finitely many points of C have both coordinates CM j-invariants.

A point with both coordinates CM maps to a special point of the curve ι(C)⊆A₂. If C has infinitely many, §7.4 for g=2 makes ι(C) special; by (P1), C is a component of the preimage of ι(C) and so special, and (P2) contradicts the choice of C. In the Masser–Zannier application the curve f(y₁,y₂)=0 is absolutely irreducible, involves both variables and is not modular, which excludes every special alternative.

The basic interface must include:

- components of ι-preimages of special subvarieties are special.
- the list of (P2).

**Checks.**

- Φ₁(j₁,j₂)=j₁−j₂, so the diagonal is the modular curve N=1 and carries the infinitely many CM pairs (j,j).
- {j₁=1728} is special, since 1728=j(i) is a CM value, and contains the infinitely many CM pairs (1728,j).
- {j₁=1} contains no CM pair, since 1 is not a CM j-invariant (the integral CM values of class number one are 0, 1728, −3375, 8000, −32768, 54000, 287496, −884736, −12288000, 16581375, −884736000, −147197952000, −262537412640768000); it is not special.

([David Masser and Umberto Zannier, *Abelian varieties isogenous to no Jacobian*](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §3.2, p.648 (André's theorem as input); pp.649–650 (block consumer); [Jonathan Pila and Jacob Tsimerman, *Ax-Lindemann for A_g*](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p05-p.pdf), p.673, recalling André's theorem for the product of two modular curves.)

*Needs:* [7.4 André–Oort for A_g under its input datum](#74-andréoort-for-a_g-under-its-input-datum); [7.1 The André–Oort input datum for A_g](#71-the-andréoort-input-datum-for-a_g).

### 7.6 Complex period codimension consequence

In Lawrence–Sawin's polarized integral Hodge–Deligne system on a smooth irreducible complex base X of positive dimension, let Φ_C from its universal cover X̃ take values in the monodromy flag variety G_mon/P, and let W⊆X^an×Ď be the image of X̃, where Ď=(G_mon/P)_ℂ. Assume (I-BT): for every algebraic V⊆X×Ď and every irreducible analytic component U of V∩W with codim U<codim V+codim W, the projection of U to X lies in a proper weak Mumford–Tate subvariety, and weak Mumford–Tate subvarieties are algebraic (Bakker–Tsimerman, Theorem 1.1, p.2, with Cattani–Deligne–Kaplan). If an algebraic Z⊆Ď has codimension at least dim X, then every irreducible component of Φ_C⁻¹(Z) projects into a proper algebraic subvariety of X. The p-adic comparison and formal-to-rigid transport of the subsequent theorem are not part of this statement.

Treat a zero-dimensional component separately. For a positive-dimensional component, let U be the component of W∩(X×Z) containing its image; then codim(W)=dim Ď and codim(X×Z)≥dim X, and dim U>0 gives codim U<dim X+dim Ď≤codim(X×Z)+codim W. Apply (I-BT) and project to the proper algebraic locus of X.

([Brian Lawrence and Will Sawin, *The Shafarevich conjecture for hypersurfaces in abelian varieties*](https://arxiv.org/pdf/2004.09046v5), §6.1, Lemma 6.3 and proof, pp.64–65; [Benjamin Bakker and Jacob Tsimerman, *The Ax–Schanuel conjecture for variations of Hodge structures*](https://arxiv.org/pdf/1712.05088), Theorem 1.1, p.2.)

*Needs:* [6.9 Definable complex analytic Chow theorem](#69-definable-complex-analytic-chow-theorem).

### 7.7 Mixed André–Oort under its input datum

Let S=Γ\X⁺ be a connected mixed Shimura variety attached to a connected mixed Shimura datum (P,X⁺) with Levi decomposition P=W⋊G, unipotent radical W with centre U and quotient V=W/U, pure part π:(P,X⁺)→(G,X_G⁺), and uniformization unif:X⁺→S. *Abelian type* means here the form used in the proof of Gao Theorem 13.6 (p.49): a Shimura morphism `ι : (G, X_G⁺) → ∏_{i=1}^r (GSp_{2g}, ℋ_g⁺)` is fixed whose group homomorphism `G → ∏ GSp_{2g}` has finite kernel contained in the centre of G and whose map X_G⁺→(ℋ_g⁺)^r is injective. With Gao's semialgebraic identification ρ of X⁺ with U(ℂ)×V(ℝ)×X_G⁺ (Proposition 4.3, p.15) and ι, a point x̃∈X⁺ has coordinates x̃_U, x̃_V and Siegel coordinates `x̃_{G,1}, …, x̃_{G,r} ∈ ℋ_g`. For a special point x∈S write x₁,…,x_r∈A_g for the images of its pure part [π](x) in the r Siegel factors, special points of A_g; put D(x)=max_i D(x_i), with D as in §7.1, and let N(x) be the order of x: the least positive integer N with N·w∈W(ℤ), where the Mumford–Tate group of a lift of x is wTw⁻¹ with T⊂G a torus and w∈W(ℚ) (Gao §13.1, p.47; up to a constant it is the torsion order of x in its fibre when the fibres of S over the pure part are semi-abelian, Remark 13.1). "(I-orbit) for the pure part of S" is (I-orbit) of §7.1 for this g.

Define the mixed André–Oort input datum for S as the conjunction of: (M-def) there is a fundamental set 𝔉 with unif|𝔉 definable in R_an,exp (Gao §10.1, p.33); (M-AL) maximal irreducible algebraic subsets of unif⁻¹(Y) are weakly special for every closed irreducible Y⊆S (mixed Ax–Lindemann, Gao Theorem 1.2, p.3), and a weakly special subvariety containing a special point is special; (M-red) if the positive-dimensional weakly special subvarieties of Y are Zariski dense in Y, then Y is special if and only if its image under the quotient by the associated normal subgroup is special (Gao Theorem 12.2, p.42); (M-orbit) at the level of Gao §13.1 and with E the reflex field, for every ε∈(0,1) there is C_ε>0 with `#(Gal(ℚ̄/E)·x) ≥ C_ε·N(x)^(1−ε)·#(Gal(ℚ̄/E)·[π](x))` for every special point x (Gao Theorem 13.3, p.48); (M-lift) there is B_g>0 such that every special x has a lift x̃∈𝔉 with x̃_U, x̃_V rational, each `x̃_{G,i}` with algebraic coordinates of degree at most k_g of §7.1, `H(x̃_U), H(x̃_V) ≪ N(x)` and `H(x̃_{G,i}) ≪ D(x_i)^(B_g)` for i=1,…,r (Pila–Tsimerman 2013, Theorem 3.1, as used in the proof of Gao Theorem 13.6, pp.49–50, and Gao Remark 4.4, p.16). Assume the mixed André–Oort input datum for S and (I-orbit) for the pure part of S. Then every closed irreducible Y⊆S with a Zariski-dense set of special points is special. With (I-orbit) from Tsimerman, this is unconditional for every mixed Shimura variety whose pure part is a Shimura subvariety of some A_g (r=1, ι the inclusion); the input is the pure orbit bound, not pure André–Oort.

Pass to a neat level and to the smallest mixed Shimura subvariety containing Y, so that Y is Hodge generic and defined over a number field k. By (M-red) assume that the positive-dimensional special subvarieties of Y are not Zariski dense. The morphism of Shimura varieties induced by ι is defined over a number field E′, so the Gal(ℚ̄/E′)-orbit of [π](x) maps onto that of (x₁,…,x_r) and `#(Gal(ℚ̄/ℚ)·x_i) ≤ [E′:ℚ]·#(Gal(ℚ̄/E′)·[π](x))`; (M-orbit) and (I-orbit) then give `#(Gal(ℚ̄/k)·x) ≫ N(x)^(1−ε)·D(x)^(1/b_g)`, and (M-lift) gives `H(x̃) ≪ max(N(x), D(x)^(B_g))`, so `#(Gal(ℚ̄/k)·x) ≫ H(x̃)^δ` with `δ=min(1−ε, 1/b_g)/max(1, B_g)`. The conjugates of x over k have the same N and D. For x outside the positive-dimensional special subvarieties of Y, which conjugation over k preserves, these are polynomially many conjugate lifts in unif⁻¹(Y)∩𝔉 of bounded degree and polynomially bounded height; Pila–Wilkie with bounded degree (§§6.14, 6.16) puts one in a positive-dimensional semialgebraic set, hence in a positive-dimensional maximal algebraic subset, which (M-AL) makes weakly special, and special because it contains a special point. So the heights of the remaining special points are bounded, Northcott makes them finitely many, and Zariski density forces Y special.

([Ziyang Gao, *Towards the André-Oort conjecture for mixed Shimura varieties: the Ax-Lindemann theorem and lower bounds for Galois orbits of special points*](https://arxiv.org/pdf/1310.1302v6), Theorem 13.6 and proof, pp.49–50; [Jacob Tsimerman, *The André–Oort conjecture for A_g*](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Introduction, p.380.)

**Checks.**

- A special singleton has one special point, dense in itself; the conclusion returns that special point.
- In a CM elliptic fibre, a torsion singleton has one special point, while a non-torsion singleton has zero and fails special-point density.
- For a pure Shimura variety the torsion part has order 1; its lift bound reduces to the pure discriminant bound.
- For S=A_g: r=1, ι the identity, W trivial so N(x)=1, D(x) is D of §7.1, "(I-orbit) for the pure part" is (I-orbit) verbatim, and (M-orbit) holds with C_ε=1.
- For the universal elliptic curve over A₁ (g=1, r=1, U trivial, V=ℚ²), the 2-torsion point of the fibre over τ=i with V-coordinate (1/2,0) has N(x)=2, H(x̃_V)=max(H(1/2),H(0))=2 and D(x)=|disc ℤ[i]|=4.
- A quaternionic Shimura curve over a real quadratic field F (`G = Res_{F/ℚ} B^×`, B split at exactly one real place) is pure and of abelian type in Deligne's sense but admits no ι: its weight cocharacter is (−1,0) in `X_*(Res_{F/ℚ} 𝔾_m) = ℤ²`, not invariant under the swap of the two real places, whereas a homomorphism with finite kernel is injective on cocharacters of the centre and carries it to the ℚ-rational Siegel weight. Its points have no D(x), and the statement does not apply to it.

*Needs:* [7.1 The André–Oort input datum for A_g](#71-the-andréoort-input-datum-for-a_g); [6.14 Pila–Wilkie rational-point counting](#614-pilawilkie-rational-point-counting); [6.16 Counting algebraic points of bounded degree](#616-counting-algebraic-points-of-bounded-degree); [TauCetiRoadmap.DiophantineApproximationAndTranscendence, §0.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md#03-finiteness-and-size-estimates).

### Examples

For g=1 the datum of §7.1 is classical: a CM point of discriminant D has the quadratic lift (−b+√D)/(2a) and Galois orbit of size h(𝒪). If an orbit supplies (D/c)^(1/b) lifts of height at most CD^a, any ε<1/(ab) makes their number exceed the O(D^(aε)) singleton blocks of §6.15 for large D. The diagonal j₁=j₂ and the line j₁=1728 carry infinitely many CM pairs; the line j₁=1 carries none.

### Dependencies

[6.7 Definable structure of complex algebraic varieties](#67-definable-structure-of-complex-algebraic-varieties); [6.9 Definable complex analytic Chow theorem](#69-definable-complex-analytic-chow-theorem); [6.10 Finite reduction of a definable algebraic union](#610-finite-reduction-of-a-definable-algebraic-union); [6.14 Pila–Wilkie rational-point counting](#614-pilawilkie-rational-point-counting); [6.16 Counting algebraic points of bounded degree](#616-counting-algebraic-points-of-bounded-degree); [6.17 Orbit growth versus definable counting](#617-orbit-growth-versus-definable-counting); [TauCetiRoadmap.DiophantineApproximationAndTranscendence, §0.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md#03-finiteness-and-size-estimates).

## Downstream consumers

Local-density applications consume the exact formula, coefficient domain, Haar normalization and generating-variable convention of Layer 5. The fixed-prime theorem supplies every p-adic field; uniform transfer carries its separate finite exceptional set. Definable geometry applications consume the counting and algebraicity theorems with their stated height and analytic hypotheses. Layer 7 exports reductions under the specified functional-transcendence and Galois-orbit inputs.

## References

Page numbers for author copies are the printed page numbers of the indicated PDF, unless a published page range is specified. Every target gives its local theorem/section/page locator above. The following list fixes the source identities; it does not replace those locators.

- Bjorn Poonen, [*Undecidability in number theory*](https://math.mit.edu/~poonen/papers/h10_notices.pdf). Author-hosted eight-page copy of the Notices AMS 55 (2008), no.3, 344–350 survey.
- Mario Carneiro and the Mathlib contributors, [*Diophantine functions and Matiyasevic’s theorem: native Poly and Dioph*](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/Dioph.lean). Mathlib source at the linked commit, Apache-2.0.
- Cameron Freer, [*Hilbert10 polynomial bridge*](https://github.com/cameronfreer/hilbert10/blob/25b42fcd6c6c5af710c514638a6fcb4e22d00a30/Hilbert10/PolyBridge.lean). Public independent formalization, commit 25b42fcd6c6c5af710c514638a6fcb4e22d00a30, Apache-2.0.
- Cameron Freer, [*Hilbert10 finite Diophantine normal form*](https://github.com/cameronfreer/hilbert10/blob/25b42fcd6c6c5af710c514638a6fcb4e22d00a30/Hilbert10/NormalForm.lean). Public independent formalization, same pinned commit, Apache-2.0.
- The Mathlib contributors, [*Multivariate polynomial extensionality on infinite boxes*](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/MvPolynomial/Funext.lean). Mathlib source at the linked commit, Apache-2.0.
- Raf Cluckers and François Loeser, [*Constructible motivic functions and motivic integration*](https://arxiv.org/pdf/math/0410203). arXiv:math/0410203v3, 29 May 2008; author pagination.
- Raf Cluckers and François Loeser, [*Constructible exponential functions, motivic Fourier transform and transfer principle*](https://arxiv.org/pdf/math/0512022). arXiv:math/0512022v1, 1 December 2005.
- Raf Cluckers, Julia Gordon and Immanuel Halupczok, [*Integrability of oscillatory functions on local fields: transfer principles*](https://arxiv.org/pdf/1111.4405v2). Duke Mathematical Journal 163 (2014), 1549–1600; arXiv:1111.4405v2, preprint pagination and numbering.
- Raf Cluckers, Georges Comte and François Loeser, [*Local metric properties and regular stratifications of p-adic definable sets*](https://arxiv.org/pdf/0910.0799v1). Commentarii Mathematici Helvetici 87 (2012), 963–1009; arXiv:0910.0799v1, preprint pagination and numbering.
- Pablo Cubides-Kovacsics, Luck Darnière and Eva Leenknegt, [*Topological cell decomposition and dimension theory in P-minimal fields*](https://arxiv.org/pdf/1508.07536v1). Journal of Symbolic Logic 82 (2017), 347–358; arXiv:1508.07536v1, preprint pagination and numbering.
- Johan Pas, [*Uniform p-adic cell decomposition and local zeta functions*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0399/LOG_0010.pdf). Journal für die reine und angewandte Mathematik 399 (1989), 137–172, GDZ scan.
- Jochen Koenigsmann, [*Defining Z in Q*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf). Annals of Mathematics 183 (2016), 73–93; version of record.
- Martin Davis, [*Hilbert’s tenth problem is unsolvable*](https://doi.org/10.2307/2318447). American Mathematical Monthly 80 (1973), 233–269; published locator.
- Jean-Louis Colliot-Thélène and Jan Van Geel, [*Le complémentaire des puissances n-ièmes dans un corps de nombres est un ensemble diophantien*](https://arxiv.org/pdf/1401.0915). arXiv:1401.0915v1.
- Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, [*Tame topology of arithmetic quotients and algebraicity of Hodge loci*](https://benjamin-bakker.github.io/DefArith.pdf). Author-hosted DefArith.pdf, 22 pages; scoped to this author copy.
- Michael Groechenig, Dimitri Wyss and Paul Ziegler, [*Geometric stabilisation via p-adic integration*](https://arxiv.org/pdf/1810.06739v2). arXiv:1810.06739v2.
- Michael Groechenig, Dimitri Wyss and Paul Ziegler, [*Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration*](https://arxiv.org/pdf/1707.06417v3). arXiv:1707.06417v3.
- Lou van den Dries and Chris Miller, [*Geometric categories and o-minimal structures*](https://people.math.osu.edu/miller.1987/newg.pdf). Revised author copy newg.pdf, forty-one pages; author pagination.
- Jonathan Pila and Alex Wilkie, [*The rational points of a definable set*](https://doi.org/10.1215/S0012-7094-06-13336-7). Duke Mathematical Journal 133 (2006), 591–616; published locator.
- Ya’acov Peterzil and Sergei Starchenko, [*Complex analytic geometry and analytic-geometric categories*](https://math.haifa.ac.il/kobi/analytic.pdf). Author copy dated 22 July 2005, thirty-two pages; Theorem 4.4 and Corollary 4.5, p.12.
- Jonathan Pila, [*On the algebraic points of a definable set*](https://people.maths.ox.ac.uk/pila/Algebraic.pdf). Author copy dated 20080627; Selecta Mathematica 15 (2009), 151–170; author and journal pagination distinguished.
- Jacob Tsimerman, [*The André–Oort conjecture for A_g*](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf). Annals of Mathematics 187 (2018), 379–390; version of record.
- David Masser and Umberto Zannier, [*Abelian varieties isogenous to no Jacobian*](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf). Annals of Mathematics 191 (2020), 635–674; version of record.
- Brian Lawrence and Will Sawin, [*The Shafarevich conjecture for hypersurfaces in abelian varieties*](https://arxiv.org/pdf/2004.09046v5). arXiv:2004.09046v5.
- Benjamin Bakker and Jacob Tsimerman, [*The Ax–Schanuel conjecture for variations of Hodge structures*](https://arxiv.org/pdf/1712.05088). arXiv:1712.05088v1.
- Ngaiming Mok, Jonathan Pila and Jacob Tsimerman, [*Ax–Schanuel for Shimura varieties*](https://arxiv.org/pdf/1711.02189). arXiv:1711.02189v3.
- Jonathan Pila and Jacob Tsimerman, [*Ax-Lindemann for A_g*](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p05-p.pdf). Annals of Mathematics 179 (2014), 659–681; version of record.
- Ziyang Gao, [*Towards the André-Oort conjecture for mixed Shimura varieties: the Ax-Lindemann theorem and lower bounds for Galois orbits of special points*](https://arxiv.org/pdf/1310.1302v6). arXiv:1310.1302v6, 54 pages; author pagination.
- Raf Cluckers, [*Presburger sets and p-minimal fields*](https://arxiv.org/pdf/math/0206197). Journal of Symbolic Logic 68 (2003), 153–162; arXiv:math/0206197, author pagination.
- Dino Lorenzini, [*Torsion and Tamagawa numbers*](https://aif.centre-mersenne.org/item/10.5802/aif.2664.pdf). Annales de l’Institut Fourier 61 (2011), 1995–2037; published copy.
- Siegfried Bosch, Werner Lütkebohmert and Michel Raynaud, *Néron Models*, Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 21, Springer, 1990.
- Peter Schneider, *p-Adic Lie Groups*, Grundlehren der mathematischen Wissenschaften 344, Springer, 2011.
- Mathlib contributors, [*Native ultraproduct structures and Łoś transfer*](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/ModelTheory/Ultraproducts.lean). Mathlib source at the linked commit.
- Mathlib contributors, [*Native multiplicative heights*](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/Height/NumberField.lean). Mathlib source at the linked commit.
- Wilfrid Hodges, *Model Theory*, Cambridge University Press, 1993, §5.3.
- Jan Denef, [*The rationality of the Poincaré series associated to the p-adic points on a variety*](https://doi.org/10.1007/BF01389133), Inventiones Mathematicae 77 (1984), 1–23, Theorems 1.1–1.2.
- Jonathan Pila and Jacob Tsimerman, [*The André–Oort conjecture for the moduli space of abelian surfaces*](https://arxiv.org/pdf/1106.4023v1), Theorem 3.1.
- Eduardo Cattani, Pierre Deligne and Aroldo Kaplan, [*On the locus of Hodge classes*](https://arxiv.org/pdf/alg-geom/9402009), Theorem 1.1.
- Lou van den Dries, *Tame Topology and O-minimal Structures*, Cambridge University Press, 1998, Chapters 3–4 and 9–10.
- Lou van den Dries, Angus Macintyre and David Marker, *The Elementary Theory of Restricted Analytic Fields with Exponentiation*, 1994, analytic cell decomposition as cited by van den Dries–Miller §4.2, p.12.
