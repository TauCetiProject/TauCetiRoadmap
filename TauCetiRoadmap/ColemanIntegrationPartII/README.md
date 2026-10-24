# Roadmap: coleman integration, part ii — harmonic realizations, indices and descent

**Summary.** Extend good-reduction Coleman integration to natural p-adic single integration over every closed subfield of ℂ_p in arbitrary reduction, followed by a harmonic realization on curves, logarithmic annular double and triple indices, the corrected global double pairing, wide-open triple sums and their Coleman one-form pairing. The natural theory includes ℂ_p and the completed maximal unramified field; the curve end theorems identify the harmonic realization with its specialization over every finite extension of ℚ_p, descend nonsplit poles and degree-zero divisors, and state branch, trace and refinement compatibilities with their actual choice laws. The formal local index theory is developed over every characteristic-zero field. Graphs retain loops and parallel edges; p=2 and p=3 are included.

## Scope and ownership

This continues **ColemanIntegration**, whose L0 supplies analytic Laurent/logarithmic functions and whose L1 constructs good-reduction Coleman integration. Its polylogarithms and special-value applications remain there. This Part II constructs natural single integration in arbitrary reduction over every closed subfield K⊆ℂ_p, using the geometric Colmez construction of §§4.0–4.0c and closed-field descent. PadicPeriodRings §§1.1–1.2 own the continuous Galois action and Ax–Sen–Tate fixed-closure theorem; §4.0c supplies the closed-subfield adapter and primitive descent. The finite p-adic field specialization uses the abelian logarithm over finite extensions of ℚ_p from AnabelianGeometryAndNonabelianChabauty §5.8. The additional logarithm for arbitrary abelian varieties defined over ℂ_p is §4.0; it agrees with the supplied point-extension logarithm on varieties with a finite p-adic field model.

This roadmap owns harmonic graph normalization and metric refinement, formal logarithmic local algebra and the degree-one index subspace, double/triple indices and their choice laws, wide-open reciprocity, curve cohomology/graph comparisons, harmonic realization, traced local contributions, divisor evaluation and descent. The additional full-analytic-coefficient Coleman extension is §3.0b; the analytic logarithmic algebra on complete subfields of ℂ_p is imported from ColemanIntegration L0.20–L0.23. The general analytic coefficient extension is §2.1a. Jacobians over finite extensions of ℚ_p use the imported logarithms; their natural integration/topology bridge is §4.0e. The geometric abelian logarithm of §4.0 additionally allows abelian varieties defined over ℂ_p without a finite p-adic field model. Tate point uniformization is imported; its differential and chart bridge is §7.0. ModularCurves §0F owns finite-presentation finite-locally-free Weil restriction. ReductiveGroupsPartII §§RG2.0a.1–RG2.0a.2 own its norm-open presentation for the multiplicative group, group structure, point identification, changes of basis, smoothness and separable splitting. Section 4.0c keeps the additional invariant trace-form adapter on this supplied scheme to fix descended logarithmic generators in the uniqueness proof.

AlgebraicCurves Layers 5 and 9 own general DVR completions, point expansions, traced geometric residues and the proper residue theorem. FormalLaurentPuiseux L1–L3 own formal substitutions, differential rules, residue transport, residue-zero primitives and the characteristic-zero scalar kernel. Section 2.0 adds finite analytic-map transport and comparison adapters between these point expansions and convergent meromorphic analytic germs; the underlying formal/analytic residue agreement is ColemanIntegration L0.11 `annulusResidue_laurentSeries`. The polynomial-logarithm extension, its degree-one presentation and the indices remain here.

Already in the library are Mathlib's p-adic field, general multigraph, simple-graph Laplacian, Laurent-series derivative and field trace, and Tau Ceti's simple-graph cochain/cohomology quotients, native Albanese universal-property carrier and normed restricted-series carrier. Their exact declarations appear below. RigidAnalyticGeometry §§1.3, 2.3, 6.2 and 8.1 own the analytic spaces, reduction, extension and analytification. StableReduction Layers 0–2, 4–5, 7 and 9 own models, branches, dual graphs, positivity, common resolutions, all-genus nodal reduction and section separation. JacobianChallenge Layers D–F own the algebraic Jacobian and pointed Abel–Jacobi after finite extension. EllipticCurves Layer 4 owns point-level Tate uniformization. PadicDifferentialEquationsAndRigidCohomology §§RD.4.31–RD.4.33, RD.5.76 and RD.6.1, RD.6.86, RD.6.88, RD.6.92 own the generic rigid comparisons, finite dimensionality and component Frobenius weights. ResolutionOfSingularitiesCharacteristicZero §6.2 supplies smooth projective compactifications of smooth quasi-projective varieties. These constructions are imported by their exact sections.

K-theory symbols, regulator maps, motivic relations, height pairings, special values and effective procedures belong to their consumers. The triple end-sum here is defined on a Coleman wide open with global auxiliary data. There is no whole-curve triple pairing obtained by a choice-free sum of arbitrary bad-reduction Vologodsky component primitives.

## Conventions

A variety is a separated finite-type geometrically integral scheme; smooth geometrically connected varieties here are geometrically integral. Work in universes u,v with native field, module, submodule, linear-map, polynomial, Laurent-series and Graph carriers. For natural single integration the coefficient field K is any closed subfield of ℂ_p, p prime, with its induced norm and topology; it contains ℚ_p and is complete. The semistable-model, harmonic, finite-trace and compactness assertions retain the explicit hypothesis K/ℚ_p finite. No odd-prime, unramified or good-reduction hypothesis is standing. Formal graph and local index algebra need only a characteristic-zero coefficient field k. Complete ultrametric coefficients enter analytic annuli. A connected Coleman wide open over K has constant field K and is geometrically connected; a larger finite constant field is treated over that field with its trace, as in §7.6. Over ℂ_p use connected wide opens.

Fix the logarithm by λ=log(p). Its universal parameter T is fixed by scalar extension and Galois, and log_univ(u)=log₀(u)+v_p(u)T with v_p(p)=1. If π is a uniformizer of ramification index e over ℚ_p, ν_π(π)=1 and v_p=ν_π/e. These normalizations differ: a branch change of size 2 changes log(π) by 2/e, including e=2 at p=2. The affine-in-T assertion concerns single integrals; no degree-one-in-T assertion is made for arbitrary triple auxiliary data.

An oriented graph edge points from tail to head. Reversal acts freely on **flags**, even at a loop. Put d f=f(tail)−f(head); jumps are c=F_head−F_tail, so adding a_v to component primitives changes c to c−d a. On a single edge f(tail)=2,f(head)=5 gives d f=−3. Unit edge lengths correspond to one fixed regular model. For comparisons keep a common rational metric: replacing an edge by m equal pieces gives jumps c/m, not c on every piece. General lengths ℓ_i give increments ℓ_i c/ℓ. A loop contributes two opposite outgoing flags to divergence.

At xy=π choose tail=(y), head=(x), and x as the end parameter of the tail; Res_e(dx/x)=1. The relative affine position is t=ν_π(x), increasing from tail 0 to head 1. The value is F_tail+c t. Reversal uses y=π/x and gives F_head−c(1−t). For F_tail=2,c=6,t=1/3 both equal 4. Vertical orders satisfy Res_e(dlog f)=ord_head(f)−ord_tail(f)=−d(ord)(e) in this convention; f=x gives 1. This fixes the sign without identifying the two papers' differential conventions by name alone.

A puncture at a point has its usual positive uniformizer orientation. An end of a wide open is oriented by the parameter vanishing in the omitted disc. Define B(F,G) by Res(F dG) when F is Laurent, so B(1,log z)=1 and B(z,z⁻¹)=−1. The proper cup comparison is primitive-of-α against β, in the order α∪β. Graph corrections are c_ω Res η−c_η Res ω: (2,3,5,7) gives −11, and reversing the edge keeps −11.

In the Čech representative ((ω_v),(f_e)), d f_e=ω_tail−ω_head and a coboundary is ((d a_v),(a_tail−a_head)). The graph retraction χ is represented by f_e−(F_tail−F_head), so a global form with f_e=0 gives its jump c. In a fixed metric N_ℓ has representative ℓ(e)Res_e(ω_tail); its comparison with geometric monodromy must carry that scale. Geometric monodromy N is different from differentiation with respect to T. For K-linear q-Frobenius with identity coefficient lift, write Q_K=#κ_K and require q=Q_K^r with integer r≥1; thus q≥2 and the q-power residue action is the identity.

Triple auxiliary choices are labelled primitives `I(R dS)` with dI=R dS and `I(R dS)`+`I(S dR)`=RS. Functions, branch and every auxiliary entry are transported together. Increasing `I(G dH)` by 1 changes T(log z,G;H) by −1. With all half-square primitives, T(log z,log z;log z)=0; characteristic zero makes both 2 and 3 invertible even over ℚ₂ or ℚ₃.

Divisors are finite integral sums of **closed** points, with degree Σ n_x[κ(x):K]. Local nonsplit indices use the full scalar trace after taking the index. A quadratic point contributes trace 2 to a local scalar index 1. Trace is linear, not multiplicative: if α²=π in a quadratic extension, Tr(α)=0 and Tr(α²)=2π. The finite-extension divisor sum repeats each closed point once for each embedding, and a temporary basepoint cancels only at degree zero.

## Exact supplier contracts

### From Mathlib

The baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. All declarations below use this pin.

- `Padic` in `Mathlib/NumberTheory/Padics/PadicNumbers.lean` is the Cauchy completion of ℚ for the p-adic norm, with `[Fact p.Prime]`; the file supplies `Padic.normedField` and its `CompleteSpace` instance. It is a coefficient-field foundation, not an integration theorem.
- `PadicAlgCl`, `PadicComplex`, `PadicComplex.norm_extends'`, `PadicComplex.isUltrametricDist`, `PadicComplex.charZero` and `PadicComplex.isAlgClosed` in `Mathlib/NumberTheory/Padics/Complex.lean` supply the geometric completed field and its algebraic closure, norm and coefficient structure. They supply no Galois fixed-field or natural-integration theorem.
- `Graph`, `Graph.IsLoopAt`, `Graph.ext` and `Graph.banana` in `Mathlib/Combinatorics/Graph/Basic.lean` retain edge identities, loops and parallel edges. The cochain flags are compared to this incidence structure. `SimpleGraph.lapMatrix` and `SimpleGraph.lapMatrix_mulVec_apply'` in `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean` give the unit-length simple-graph case. Its `SimpleGraph.lapMatrix_toLinearMap₂'_apply'_eq_zero_iff_forall_reachable` identifies the zero quadratic form with componentwise constants over a linearly ordered field with `IsStrictOrderedRing`; `SimpleGraph.lapMatrix_ker_basis` and `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix` give the component-indicator kernel basis and nullity over ℝ. Transport their rational matrix rank to ℚ and then to characteristic-zero fields. The kept variant is a rational-length cochain theory on multigraphs; it does not reintroduce the simple-graph matrix.
- `LaurentSeries`, `LaurentSeries.hasseDeriv_coeff`, `LaurentSeries.hasseDeriv_single`, `LaurentSeries.derivative` and `LaurentSeries.derivative_map` in `Mathlib/RingTheory/LaurentSeries.lean` provide the formal carrier and its derivative. The first Hasse derivative is the ordinary derivative. `HahnSeries.map`, `HahnSeries.coeff_single_same` and `HahnSeries.coeff_single_of_ne` in `Mathlib/RingTheory/HahnSeries/Basic.lean` compute singleton coefficients. The formal residue used below is coefficient −1 of a differential on this carrier, rather than a second Laurent-series type.
- `spectralNorm_unique_field_norm_ext` in `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean` identifies every multiplicative absolute value on an algebraic extension of a complete nontrivially normed ultrametric field with the spectral norm, provided it extends the base norm. Apply it to the algebraic compositum Kℚ̄_p/K in §4.0c to prove that K-automorphisms are isometric.
- `Polynomial.eval_add`, `Polynomial.eval_C`, `Polynomial.eval_X` and `Polynomial.eval_map` in `Mathlib/Algebra/Polynomial/Eval/Defs.lean`, and `Polynomial.hom_eval₂` in `Mathlib/Algebra/Polynomial/Eval/Coeff.lean`, supply scalar polynomial specialization and its coefficient-map laws. The affine pair presentation in §7.1 uses these operations.
- `Algebra.trace` in `Mathlib/RingTheory/Trace/Defs.lean` is the linear map obtained from left multiplication. `Algebra.trace_algebraMap` says Tr(algebraMap x)=finrank·x under its free-module hypotheses. `Algebra.trace_trace` requires both finite free stages of a scalar tower. For finite extensions of fields these hypotheses hold. `trace_eq_sum_embeddings` in `Mathlib/RingTheory/Trace/Basic.lean` requires finite-dimensional separable L/K and an algebraically closed target E; it states algebraMap(Tr x)=Σ_σ σx. The name is at the root namespace. It is not a product formula and is not used for inseparable extensions.
- `Algebra.norm` and `Algebra.norm_eq_matrix_det` in `Mathlib/RingTheory/Norm/Defs.lean` supply the determinant of multiplication and its finite-basis matrix formula; `Algebra.norm_ne_zero_iff` in `Mathlib/RingTheory/Norm/Basic.lean` requires finite free domain coefficients. The finite field extensions of §4.0c satisfy these hypotheses. Its trace-torus adapter uses this norm on a universal element; it does not define a second field norm.
- `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.LocallyOfFiniteType`, `AlgebraicGeometry.QuasiCompact`, `AlgebraicGeometry.IsSeparated` and `AlgebraicGeometry.GeometricallyConnected` in `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`, `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean`, `Mathlib/AlgebraicGeometry/Morphisms/QuasiCompact.lean`, `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean` and `Mathlib/AlgebraicGeometry/Geometrically/Connected.lean` state the geometric hypotheses on the structure morphism of an object of `CategoryTheory.Over`. Finite type means locally of finite type and quasi-compact. Together with Tau Ceti's native Albanese predicate they support the signature of `NaturalIntegration.properAlbanese_exists`.

### From Tau Ceti

The baseline is Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean`, `MvPowerSeries.norm_eq_gaussNorm` identifies the native restricted-series norm with its Gauss norm for positive polyradii over an ultrametric normed ring. Its `CompleteSpace` instance requires complete coefficients. RigidAnalyticGeometry consumes this native floor. It supplies no p-adic integration or index theorem.

- In `TauCeti/Combinatorics/SimpleGraph/Cohomology/Basic.lean`, `SimpleGraph.oneCochains`, `SimpleGraph.coboundary` and `SimpleGraph.FirstCohomology` use a commutative multiplicative coefficient group. `SimpleGraph.coboundary_apply` is target divided by source. Use `Multiplicative k`, so additive translation gives head minus tail. The value-preserving module and quotient bridges in §§1.1–1.2 account for the opposite differential. Import `SimpleGraph.FirstCohomology.lift`, `.mk_eq_mk_iff` and `.congr`; coefficient functoriality comes from `SimpleGraph.oneCochainsMap_coboundary` and `SimpleGraph.firstCohomologyMap` in `Cohomology/Map.lean`; relabelling comes from `SimpleGraph.oneCochainsRelabel_coboundary` and `SimpleGraph.firstCohomologyRelabel` in `Cohomology/Relabel.lean`. Their hypotheses are commutative groups, coefficient homomorphisms and graph isomorphisms, respectively.
- In `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean`, `TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese`, its `.homEquiv` and `.uniqueUpToIso` supply the pointed universal property on the native abelian-variety carrier. §4.0b constructs the additional higher-dimensional proper Albanese existence and rational-form comparison on this predicate; it does not redefine the universal property.

### From TauCetiRoadmap.AlgebraicCurves

Import Layer 5's completion comparison milestone: complete a place's fraction field and DVR, preserving the normalized valuation, valuation ring, maximal ideal, residue field and chosen uniformizer, without a finite-residue-field hypothesis. Import Layer 9's “Local expansions and residues”: at a smooth closed point x with finite separable residue extension κ(x)/k, use its k-compatible coefficient-field lift and chosen uniformizer to identify the completed local ring with κ(x)[[z]] and the completed fraction field with κ(x)((z)). Consume the induced differential expansion, geometric coefficient residue, parameter independence and traced k-valued residue. Import Layer 9's residue theorem through its comparison theorem, Remark 4.3.7(d), and Layer 5's abstract residue theorem: for a smooth proper geometrically connected curve over a characteristic-zero field, the finite sum over closed points x of the traces from κ(x) to k of the geometric residues of ω is zero. Characteristic zero makes the residue extensions separable and the base field perfect; no rational-point or split-pole restriction is imposed.

### From TauCetiRoadmap.FormalLaurentPuiseux

Import L1's Laurent substitutions for nonzero parameter series of positive order, their composition, coefficient-extension and coordinate-isomorphism laws. Import L2's continuous Laurent derivation, product/inverse/quotient and chain rules, its one-form coefficient presentation and, in characteristic zero, its scalar kernel. Import L3's coefficient residue, exact-residue vanishing, integration by parts, residue transport of ramification order n>0, and residue-zero primitives unique modulo scalars. These contracts use the native Mathlib Laurent carrier over arbitrary coefficient fields where stated; primitive existence and the scalar-kernel assertion require characteristic zero. Geometric transport uses AlgebraicCurves Layer 9's completion charts and separable residue-field trace.

### From TauCetiRoadmap.ColemanIntegration

Import L0.A1–L0.A2: `LaurentOn`, `LaurentOn.derivative`, `.restrict`, `.endGerm`, `.pullback`, `laurentSeriesEval` and `LaurentOn.eval_injective`. The coefficient carrier uses complete nontrivially normed ultrametric fields; point evaluation is into ℂ_p and faithfulness retains the radius hypotheses. L0.11–L0.12 supply `annulusResidue`, `exists_laurent_primitive_iff` and vanishing residue for exact forms on genuine open annuli/end germs. In particular L0.11 `annulusResidue_laurentSeries` identifies analytic residue with the formal coefficient −1 for a convergent meromorphic germ with finitely many negative powers on a punctured disc. L0.15–L0.19 supply `padicLogBranch`, `logBranch_sub`, finite-extension/Galois compatibility and its local derivative. L0.20–L0.23 supply `AnnulusLogRing`, `.changeParam`, `.restrict`, `.realize_branch`, `exists_logLaurent_primitive` and `logLaurent_derivative_eq_zero_iff`. Their analytic logarithmic ring has coefficients in a complete subfield of ℂ_p; parameter change retains a unit scale and a strictly small perturbation on the chosen annulus. Its extension beyond that coefficient scope is §2.1a.

Import L1.2–L1.3 for `wideOpen`, `daggerAlgebra`, `daggerDifferentials` and their ordinary/end restrictions on a good-reduction pair and a cofinal system of strict neighborhoods. Import L1.17–L1.19 for `ColemanFunctions`, `.d_mem`, `.ker_d`, `colemanIntegral`, `d_colemanIntegral`, `colemanIntegral_d`, `definiteIntegral`, `definiteIntegral_add`, `definiteIntegral_tiny` and `definiteIntegral_d`. Their datum carries the base's `(H0)`, `(H1)` and `(Hi)` conditions. L1.17a supplies `colemanCoefficients_exact`, `colemanCoefficients_meromorphicPrimitive` and `colemanCoefficients_restrict_injective` for algebraic coefficient extension. No equality with the full analytic ℂ_p algebra follows from this extension. L1.43 supplies `ColemanFunctions.pullback` and `definiteIntegral_pullback` under its common Frobenius-power, same-reduction cross-map and uniform strict-neighborhood bounds. §§3.0a–3.0b supply the extra component and full-analytic-coefficient comparisons required here.

### From TauCetiRoadmap.PadicPeriodRings

Import §1.1 `padicComplexGaloisAction`, `padicComplexGaloisAction_spec` and `padicComplexGaloisAction_continuous`, the continuous isometric action of `G_Qp` on the pinned PadicComplex. Import §1.2 `padicComplex_fixed_closure_eq`: for every closed subgroup H⊆`G_Qp`, with algebraic fixed field L=(ℚ̄_p)^H, the fixed field (ℂ_p)^H is the closure of L in ℂ_p. The closed-subfield adapter of §4.0c identifies this closure with a specified closed K⊆ℂ_p for its pointwise stabilizer H_K. Only that adapter and the descent of geometric primitives are constructed here; the Ax–Sen–Tate theorem is consumed from this supplier.

### From TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty

Import §5.8, “Abelian logarithms”: `abelianLog.add`, `.derivative`, `.unique`, `.baseChange`, `.functorial` and `.cp` for any abelian variety over finite K/ℚ_p, without a good-reduction hypothesis. Its `colemanAbelian.integral` comparison has good-reduction hypotheses. Here `.cp` extends the points of that same K-defined variety, and does not cover arbitrary varieties defined over ℂ_p. The additional arbitrary-ℂ_p logarithm and finite-model agreement are §4.0; the natural arbitrary-reduction comparison and compact divisor-topology bridge are §4.0e.

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

Import §RD.4.31 for finite rigid coefficient extension with compatible Frobenius; §RD.4.32 for dagger de Rham cohomology of a smooth affine lift and its lift-independent Frobenius; §RD.4.33 for the proper tube comparison; and §RD.5.76 for finite dimensionality with F-isocrystal coefficients. Use §RD.6.1 `linearFrobenius` with residue field 𝔽_q, q-power Frobenius and coefficient lift the identity, and `linearFrobenius_eq_pow`, `linearFrobenius_natural`, `linearFrobenius_baseChange`: after residue extension of degree f the geometric Frobenius becomes the f-th iterate. Higher powers q=(#κ_K)^r are iterates, and scalar extension alone is distinguished in §3.0c. §§RD.6.86, RD.6.88 and RD.6.92 supply proper weight-one H¹, the curve Gysin sequence and affine-curve weights: boundary eigenvalues are qζ, becoming q after splitting the boundary. The additional semistable Čech/graph comparison is §3.0c; the index/compact-cup comparison is §3.1a.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

Import §6.2 `sncCompactification`: for a smooth quasi-projective finite-type variety over a characteristic-zero field, a smooth projective compactification preserving that variety, with strict-SNC boundary. §4.0b uses it on a dense quasi-projective open and proves the extension of the proper Albanese map to the whole smooth variety. General compactification and resolution are not reconstructed here.

### From TauCetiRoadmap.RigidAnalyticGeometry

Use §1.3 for finite/complete coefficient extension and its tensor comparison, §2.3 for reduction, §6.2 for rigid spaces, discs, annuli, gluing and quasi-separated field extension, and §8.1 for analytification and its compatibility with finite maps and products. Carry quasi-separatedness in global rigid base change. These interfaces supply the ambient geometry of component wide opens, not the analytic Coleman algebra or a de Rham comparison.

### From TauCetiRoadmap.StableReduction

Use Layer 0 for model generic-fibre identifications, finite DVR extensions, towers and common extensions; Layer 1 for nodal charts, finite splitting of nodes, branches and components and the connected dual graph with loops; Layer 2 for curve positivity; Layers 4–5 for regularization, blowups and common model resolutions; Layer 7 for finite-extension nodal reduction in genera 0, 1 and ≥2; and Layer 9 for separation of finitely many markings into disjoint smooth sections. Only the section-separation construction is used without the stable-range inequality. Genus-zero and genus-one cases do not pass through an unpointed stable-model theorem of genus ≥2.

### From TauCetiRoadmap.JacobianChallenge

Use Layer B for curve duality and Layers D–F: proper smooth curves are projective, divisor classes and the Jacobian, its abelian-variety structure, pointed Abel–Jacobi and base change. The pointed theorem is applied over an extension containing a temporary point. It supplies no K-rational point on X and no unpointed Abel–Jacobi morphism. The extra natural integration and compactness bridge is §4.0e.

### From TauCetiRoadmap.ReductiveGroupsPartII

Use §RG2.0a.1 “Finiteness and coordinates of a Weil restriction” (`weil-restriction-finiteness`) for `basisPresentation` and the presentation of Res₍L/k₎ Gₘ as the complement of the determinant norm’s zero locus in affine [L:k]-space, with its change-of-basis law. Use §RG2.0a.2 “Weil restriction of an affine group scheme” (`weil-restriction-group-scheme`) for the induced group structure, `WeilRestriction.pointsMulEquiv`, `WeilRestriction.multiplicativeGroupPoints` and `WeilRestriction.diagonal`, natural in coefficient algebras. Its `weil-restriction-smoothness-and-immersions` and `weil-restriction-separable-splitting` targets give smoothness and splitting as a product of multiplicative groups, hence geometric connectedness. The extension L/k in §4.0c is finite separable in characteristic zero, so all finite locally free and separability hypotheses hold. Section 4.0c adds the invariant differential and traced-logarithm comparison.

### From TauCetiRoadmap.EllipticCurves

Use Layer 4's analytic Tate strand: q is a **unit** with |q|<1, and the point-level isomorphisms L×/q^ℤ≃E_q(L) commute with finite extensions and Galois. The differential and annular realization comparison is §7.0; no rigid quotient is attributed to the point-level theorem.

## How to read the build

Layer 1 constructs the metric multigraph theory and its signed bridge to pinned simple-graph cohomology. Layer 2 imports the analytic logarithmic algebra, adds formal/general-coefficient extensions and defines local double indices. Layer 3 constructs component/full-coefficient/cohomology comparisons and wide-open reciprocity before the corrected pairing. Layer 4 first constructs Colmez natural integration over ℂ_p and descends it to every closed coefficient subfield independently of a curve model, then proves its harmonic realization and point-sum formula. Layer 5 constructs labelled triple-index choices using the supplied analytic primitives; Layer 6 proves global cancellation and the relation theorem before descending to actual Coleman forms. Layer 7 supplies Tate differential charts, branch, trace, divisor and arbitrary-reduction descent. The pairing theory precedes harmonic identification, which precedes its point-sum consequences.

Suggested.lean states the headline theorems that can be expressed on the pinned carriers: the full rational-length multigraph harmonic/exact decomposition of §1.2 and the higher-dimensional proper Albanese existence theorem of §4.0b. Its only definitions are the edge differential and weighted divergence needed for the former. The other headline theorems are metric subdivision (§1.3), analytic index transport (§2.3), full analytic Coleman extension and curve comparisons (§§3.0b–3.0c), wide-open reciprocity and corrected cup/Frobenius/monodromy comparison (§§3.1a,3.4–3.5), geometric abelian logarithms and natural integration (§§4.0–4.0e), harmonic and point-sum realization (§§4.2–4.4), local triple-index characterization and transport (§§5.2–5.5), global triple-index vanishing and the actual-form pairing (§§6.0–6.4), and Tate, branch, trace, divisor and model descent (§§7.0–7.7). The module docstring identifies the missing carriers for each group. The API facts and Checks below specify the entire library independently of the acceptance test.

## Layer 1: Finite graph cochains and harmonic normalization

### 1.1 Cochains with edge identities

For a finite graph Γ, retain both flags of every edge, including a loop, and an orientation-reversing fixed-point-free involution e ↦ −e on its darts. For a field k of characteristic zero and positive rational lengths ℓ(e)=ℓ(−e), define C⁰=V→k, C¹={c:E→k | c(−e)=−c(e)}, d f(e)=f(tail e)−f(head e), div_ℓ(c)(v)=`sum_{tail(e)=v}` c(e)/ℓ(e), Harm_ℓ=ker(div_ℓ), and (c,d)_ℓ=`sum_{unoriented edges}` c(e)d(e)/ℓ(e). These are modules, linear maps, a submodule and a bilinear form on the native graph carrier; the flag presentation has an explicit forgetful comparison to Graph.IsLink. (besser2017, Definitions 4.1–4.3, printed pp. 11–12, besser2017 line 528; rational-length extension by subdivision from Proposition 4.12(3), besser2017 line 768).

Assume Γ has finite actual vertex and edge sets; ambient types need not be finite; k is a field with CharZero; ℓ(e) is a strictly positive rational number, interpreted through ℚ→k.

- A native graph, a choice of its two flags per edge and positive reversal-invariant rational lengths give this presentation; reversing the chosen orientation gives a canonically isomorphic complex.

- Two cochains are equal exactly when their values on every dart agree; values on one dart of each edge suffice.

- Σ_v f(v) div_ℓ(c)(v)=(d f,c)_ℓ; loops contribute two opposite values.

- Graph isomorphisms preserving lengths and characteristic-zero coefficient embeddings commute with d, divergence and the edge pairing; unit lengths recover Definitions 4.1–4.3.

- For a finite simple graph with unit lengths, div(d f) is SimpleGraph.lapMatrix acting on f. The multigraph extension retains parallel edges and two loop flags.

For a finite simple graph and additive commutative coefficient group, define its unit-length divergence on the supplied cochains by summing additive values on outgoing darts. Divergence of the pinned head-minus-tail coboundary is the negative of the Laplacian on the potential; the tail-minus-head differential gives the positive Laplacian. This construction commutes with coefficient embeddings and graph isomorphisms by its finite-sum definition (besser2017 Definitions 4.1–4.3, besser2017 line 528).

For the headline signature choose one orientation of each actual edge of a native multigraph G, with tail and head in its actual vertex set and satisfying G.IsLink. Define `Graph.edgeDifferential` on vertex functions by f ↦ (e ↦ f(tail e)−f(head e)), for any additive commutative coefficient group. For a characteristic-zero field k and positive rational lengths, define `Graph.edgeDivergence` on edge functions by summing c(e)/ℓ(e) at the tail and −c(e)/ℓ(e) at the head. The two edge maps are defined for arbitrary endpoint functions into the actual vertex set; native incidence is a hypothesis of the decomposition theorem. Only the actual edge set is required finite for divergence; both actual vertex and edge sets are finite for harmonic decomposition. The value on the reverse flag is −c(e), including at loops, so this presentation identifies with the flag cochains above.

- Both maps are additive; over k they are k-linear.
- Reorienting an edge negates its cochain coordinate and preserves divergence and the harmonic/exact decomposition.
- Under this presentation the differential and divergence equal d and div_ℓ above; a loop has zero differential and contributes zero to divergence. The headline theorem is `Graph.harmonic_exact_decomposition` in §1.2.

- For a finite simple graph G and characteristic-zero field k, the identity on dart values identifies C¹ with Additive (G.oneCochains (Multiplicative k)). Give the latter its pointwise k-module structure. Under this k-linear equivalence d f is the negative of the additive translation of G.coboundary (Multiplicative k) (Multiplicative.ofAdd ∘ f). Thus the identity on C⁰ and the negative of this equivalence on C¹ is a chain comparison. Coefficient maps and graph relabelling are the supplied maps through this bridge.

Use submodules of function modules and finite sums. Define the two flags separately even when their incident vertices coincide; the involution has no fixed dart. The adjoint identity follows by grouping the two flags of each edge.

*Needs:* Mathlib `Graph`, Mathlib `Graph.IsLoopAt`, Mathlib `SimpleGraph.lapMatrix`, Tau Ceti `SimpleGraph.oneCochains`, Tau Ceti `SimpleGraph.coboundary`, Tau Ceti `SimpleGraph.FirstCohomology`, Tau Ceti `SimpleGraph.oneCochainsMap_coboundary`, Tau Ceti `SimpleGraph.oneCochainsRelabel_coboundary`.

**Checks.**

- On one oriented edge v→w with f(v)=2,f(w)=5, unit-length divergence of the pinned coboundary is +3 at v and −3 at w, while this roadmap has d f=−3; the additive value of the pinned coboundary on Multiplicative.ofAdd ∘ f is +3. Negating the degree-one comparison makes the chain square commute.
- For one vertex and no edges C¹=0 and Harm_ℓ=0; unit-length divergence of its unique cochain is zero. The empty graph has C⁰=C¹=0.
- A loop at v carrying c(e)=1,c(−e)=−1 has divergence zero and is a nonzero harmonic cochain. Giving the loop only one dart incorrectly excludes it.
- On one edge of length 1/2, c=2,d=3 give (c,d)_ℓ=12; using an unweighted product gives 6.
- Reversing the selected orientation replaces both c,d by their negatives and leaves the value 12. A zero argument gives zero.
- For one edge of length 1/2 with c=2, divergence is +4 at its tail and −4 at its head; it is not harmonic. An outgoing sum omitting the inverse length gives the wrong values.
- A cochain assigning 1 to both directions of a nonloop edge is not in C¹ in characteristic zero. On no edges C¹ is the zero module; on one loop C¹ is k.
- The empty graph has only the zero 0-cochain; on one isolated vertex C⁰=k and d=0. On two isolated vertices its kernel has two independent constants.
- In the oriented-edge presentation, one edge of length 1/2 with potential (2,5) has differential −3 and divergence (−6,6). Reversing the orientation gives differential +3 and the same vertex divergence. Incidence requires the edge's actual endpoints; assigning a nonloop edge twice to its tail is excluded.
- A single loop with c=2 and length 1/2 has weighted divergence 4−4=0, while every potential has edge differential 0; thus its harmonic/exact pair is (2,0), not (0,2). An isolated ambient vertex outside G.vertexSet is not a coordinate in either edge map.

### 1.2 The harmonic representative

Prove `Graph.harmonic_exact_decomposition`. For Γ,k,ℓ as in §1.1, C¹=Harm_ℓ ⊕ im(d). Thus every graph cohomology class has one harmonic representative. The kernel of d consists of the functions constant on each connected component. If Γ is connected and nonempty, a potential for the exact part is unique modulo one common constant. Harmonic and exact cochains are orthogonal for ( , )_ℓ; the induced form on harmonic cochains is nondegenerate. All these decompositions commute with coefficient extension. (besser2017, Theorem 4.4 and following orthogonality statement, p. 12, besser2017 line 553; rational-length consequence).

Use the hypotheses of §1.1; connectedness and nonemptiness only for a single common constant.

- The unique harmonic projection C¹→ₗ[k]Harm_ℓ has kernel im(d), is identity on Harm_ℓ and is idempotent.

- Adding an exact cochain d a leaves the harmonic projection unchanged.

- For each connected component with r vertices, the positive-rational-length multigraph Laplacian has rank r−1, preserved over k. Its unit-length simple-graph specialization follows from Mathlib’s `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix` over ℝ and invariance of rational matrix rank under field extension.

In the oriented-edge signature `Graph.harmonic_exact_decomposition`, every edge function c has a unique pair (h,r) with weighted divergence of h equal to zero, r the edge differential of some vertex potential, and c=h+r. The orientation satisfies G.IsLink on every actual edge, and the lengths are strictly positive rationals. This states the full multigraph decomposition, including disconnected graphs, loops and parallel edges, over every characteristic-zero field; uniqueness is of cochains, not potentials. The unit-length simple-graph case also gives a unique harmonic/exact pair in the supplied multiplicative cochains, where multiplication translates addition.

- The value-preserving cochain equivalence of §1.1 sends im(d) onto the additive translation of the pinned coboundary range, since negation preserves that range. Transport scalar multiplication to Additive (G.FirstCohomology (Multiplicative k)); the induced quotient equivalence is k-linear and identifies harmonic representatives with this existing quotient. Import FirstCohomology.lift, mk_eq_mk_iff, firstCohomologyMap and firstCohomologyRelabel through the bridge; do not redefine their simple-graph universal properties or functoriality.

Multiply all conductances 1/ℓ by a common positive integer to make them positive integers. Replace each resulting parallel unit edge by a two-edge path of lengths 1/2, with distinct inserted vertices, and discard loops from the Laplacian computation. This gives a simple graph; eliminating the inserted potentials recovers the scaled weighted Laplacian. Its Laplacian is twice the unit-length one, so the supplied real kernel theorem gives componentwise constants and nullity. Subdivision preserves the original components, and loops contribute zero to d. Rational matrix rank is unchanged on extension to ℝ or any characteristic-zero k, giving the weighted rank assertion. Rank-nullity and orthogonality give the direct sum, uniqueness, nondegeneracy and extension compatibility.

*Needs:* §1.1, Mathlib `SimpleGraph.lapMatrix_ker_basis`, Mathlib `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`, Tau Ceti `SimpleGraph.FirstCohomology.lift`, Tau Ceti `SimpleGraph.firstCohomologyMap`, Tau Ceti `SimpleGraph.firstCohomologyRelabel`.

**Checks.**

- On a cyclic triangle with unit lengths and cyclic edge values (3,0,0), the harmonic part is (1,1,1) and the exact part is (2,−1,−1), the pinned head-minus-tail coboundary of (0,2,1). The reverse darts have the opposite values. The cyclic unit cochain has divergence zero at all three vertices and values +1 and −1 on the two darts of the edge 0–1; the zero cochain or a same-sign reversal would fail.
- On a tree the harmonic part is zero; on two isolated vertices the ambiguity is two constants, not one.
- In characteristic 3 on a triangle, the constant cyclic cochain (1,1,1) is the pinned coboundary of (0,1,2), is nonzero and has zero unit-length divergence. Characteristic zero is essential for the direct sum; p=3 coefficients ℚ₃ are still allowed.
- On a simple triangle the cochain (1,1,1) has nonzero cycle class in both quotients; on a one-edge tree ±3 are coboundaries in both. The quotient bridge preserves cochain values, while the signed chain comparison negates them.
- For two parallel edges with the same orientation and lengths (1,2), c=(3,0) decomposes as harmonic h=(1,−2) and exact r=(2,2), with potential (2,0). Divergence of h is (0,0) and (h,r)_ℓ=2−2=0. Discarding one parallel edge changes the decomposition.
- If positivity were dropped, lengths (1,−1) on two parallel edges would make the nonzero exact cochain (1,1) harmonic: its outgoing current is 1−1=0. Zero lengths are excluded as well. In characteristic 2 even unit lengths give outgoing current 1+1=0 for this exact cochain; characteristic zero admits ℚ₂ while excluding this example.

### 1.3 Subdivision with a fixed metric

If an edge of length ℓ is subdivided into consecutive positive rational lengths ℓ_i with Σℓ_i=ℓ, a harmonic jump c on that edge extends by c_i=(ℓ_i/ℓ)c. Restriction adds the jumps along the chain, and these operations identify graph cohomology and its harmonic representatives. Pairings ( , )_ℓ are preserved when both arguments are extended this way. If a residue current r is constant along the chain, Σ_i c_i r=c r. Attaching a tree contributes zero harmonic current. Uniform subdivision into m pieces gives c/m on each new edge, for m≥1. (besser-zerbes2017, Corollary 1.2 and preceding subdivision argument, p. 3, besser-zerbes2017 line 99; compare besser2017 Proposition 4.12(3), line 768).

Assume Finite graphs and positive rational lengths as in §1.1; m is positive; no division by zero; New degree-two vertices have no additional attached marked source terms.

- Successive subdivisions give the same extension as their common refinement.

- The jump-residue contribution is invariant under subdivision; reversing every dart preserves it.

Divergence at each new vertex forces constant c_i/ℓ_i. Summing along the chain determines that current. Direct substitution proves the energy and residue identities; the cohomology isomorphism follows by extending potentials and applying §1.2.

*Needs:* §1.2.

**Checks.**

- Splitting a jump 6 into lengths 1/3 and 2/3 of its original length gives jumps 2 and 4, total 6.
- m=1 is identity; a rational tail carries zero current.
- For a triangle with jumps (1,1,1), dividing one edge into two halves gives (1/2,1/2) on that edge. Treating all four resulting lengths as 1 changes the harmonic representative and is not the same metric realization.

### Examples

A single vertex, a bridge, a two-edge cycle, a loop and a triangle distinguish graph incidence from simple adjacency.

### Dependencies

Pinned Mathlib Graph; finite linear algebra over a characteristic-zero field. No analytic or cohomological comparison is a premise.

## Layer 2: Logarithmic annular functions and the double index

### 2.0 Residues, finite maps and meromorphic germs

For differential-compatible finite maps of oriented open annuli of positive oriented degree n, prove Res(φ*ω)=n Res(ω), compatible with reversal, finite separable coefficient extension, coefficient trace and restriction to smaller end annuli. Combine the point-expansion and formal-calculus supplier contracts with analytic restriction for convergent meromorphic point germs. There is no map from every analytic annular Laurent family to a bounded-below formal Laurent series. This target adds analytic finite-map transport and formal/analytic comparison adapters. (besser2017, Definition 3.1 and (3.1), p. 9, besser2017 line 402; degree consequence as in besser-dejeu2012 Lemma 8.1, p. 361, line 2529).

Assume Formal coefficients are characteristic-zero fields; analytic coefficients are complete nontrivially normed ultrametric fields; A finite analytic map has positive degree and compatible orientation; coefficient trace is for finite separable extensions; Formal/analytic germ comparison requires a meromorphic germ with finitely many negative powers.

- Res of the pullback of dz/z under z=t^n is n.

- At a smooth closed point over a complete analytic coefficient field, for a chosen uniformizer and a meromorphic germ converging on a punctured disc, identify its transported point expansion with its analytic Laurent germ. This comparison commutes with differentiation, restriction and finite separable scalar extension. Apply `annulusResidue_laurentSeries` to identify the two residue computations; coefficient trace commutes with the comparison.

For the analytic finite-map law, factor the parameter pullback locally as a monomial times a unit, apply the logarithmic derivative and the supplied exact-residue law, and extend by the analytic residue/exact decomposition. Use the formal substitution and residue-degree laws through the point-completion charts. For convergent meromorphic germs, identify their coefficient families through these charts and analytic evaluation; apply `annulusResidue_laurentSeries` for residue agreement. The finite negative part is essential. Coefficient extraction commutes with linear trace.

*Needs:* AlgebraicCurves Layers 5 and 9, FormalLaurentPuiseux L1–L3, ColemanIntegration L0.A1–L0.A2, L0.11–L0.12 `annulusResidue_laurentSeries`, RigidAnalyticGeometry §§1.3, 6.2, 8.1, Mathlib `LaurentSeries.derivative`, Mathlib `Algebra.trace`.

**Checks.**

- For z=t² the residue of dz/z is 2; for z=t⁻¹ it is −1 in the t orientation.
- The identity map gives residue 1 on dz/z; constants have derivative residue zero. A constant map is excluded from the positive-degree claim.
- At a quadratic closed point a residue 1 traces to 2. An analytic Laurent family with infinitely many negative terms is not a formal Laurent germ.

### 2.1 Functions with one logarithmic term

For a characteristic-zero field k define the formal extension A_log=k((z))[L], dL=dz/z, and its degree-at-most-one subspace A_log,1=k((z))+kL. In the analytic case take the degree-at-most-one subspace O_k(A)+kL inside the supplied AnnulusLogRing on an open annulus over a complete subfield of ℂ_p, with its fixed logarithm realization. This subspace, its coefficient decomposition and the index data are the additions here; the analytic polynomial ring, its derivation, changeParam, primitive existence and constant kernel are imported. The formal derivative maps A_log,1 onto k((z))dz with kernel k, and Res(d(f+aL))=a. The analytic version has the same residue criterion using the supplied primitive theorem. The extension to general complete ultrametric characteristic-zero analytic coefficients is §2.1a. (besser2017, Definition 3.1, pp. 9–10, besser2017 line 402; formal polynomial logarithms in besser-dejeu2012 §7, pp. 355–356, line 2232).

For the formal case let k be a characteristic-zero field. In the analytic coefficient scope of ColemanIntegration L0.20 take k a complete subfield of ℂ_p, A a genuine open annulus or end germ, branch as in ColemanIntegration L0.20; A common branch for realization and orientation with Res(dz/z)=1; all restrictions share a convergence domain.

- Construct f+aL from an analytic or formal Laurent f and scalar a; add, scale, differentiate and restrict coefficientwise.

- Equality in a fixed parameter is equality of the Laurent part and the coefficient a. The formal module k((z)) × k represents f+aL; its componentwise multiplication is not used.
- The map (f,a) ↦ f+aL into k((z))[L] is injective.
- Differentiation sends (f,a) to f′+a z⁻¹, interpreted as the coefficient of dz. Every w∈k((z)) has a primitive F in this space with logarithmic coefficient w₋₁.
- The differential kernel consists exactly of the pairs (c,0) with c scalar, and Res(dF)=a.

These formal assertions require a characteristic-zero field k, with no norm or prime hypothesis (besser-dejeu2012 §7, p. 355, besser-dejeu2012 line 2232).

- F is Laurent without L exactly when Res(dF)=0.

- On the analytic subspace restrict the supplied AnnulusLogRing.changeParam, retaining u=az(1+h), |a|=1 and |h|<1. Formally, for u=az(1+h), a≠0 and h∈zk[[z]], choose a scalar δ and transport L_u=L_z+δ+log(1+h) through the full differential-algebra substitution. The broader analytic coefficient/radius-transport statement is §2.1a. Orientation reversal changes both residue and the logarithmic generator.

Use Polynomial (LaurentSeries k) for the formal ring, extending the Laurent derivation by dL=z⁻¹. For w with residue a, apply the supplied residue-zero primitive theorem to w−a z⁻¹ and then add aL. The supplied exact-residue law and Laurent scalar kernel give the logarithmic coefficient and constant kernel. Polynomial coefficient uniqueness proves the degree-one presentation; integration by parts extends the supplied Laurent primitives to the polynomial-logarithm algebra. Restrict the supplied formal substitutions and chain rule after choosing the logarithmic lift δ. On the analytic ring take the degree-one subspace and use exists_logLaurent_primitive and logLaurent_derivative_eq_zero_iff. Compare formal and analytic carriers only for convergent meromorphic germs, via §2.0.

*Needs:* FormalLaurentPuiseux L1–L3, RigidAnalyticGeometry §6.2, Mathlib `LaurentSeries`, Mathlib `LaurentSeries.derivative`, Mathlib `LaurentSeries.hasseDeriv_coeff`, §2.0, ColemanIntegration L0.A1–L0.A2, L0.11–L0.12, L0.20–L0.23.

**Checks.**

- d(2+3L)=3 dz/z and Res=3; replacing the residue by the constant term of F fails.
- dC=0 for every constant C and dL≠0, including over ℚ₂. In the coefficient presentation L=(0,1), a scalar is (C,0), and the residue of dL is 1, which a constant-only space would miss.
- Over ℚ, the Laurent constant 2 maps to the constant polynomial 2. A zero map would lose it.
- Over ℚ, L maps to the polynomial variable. A map retaining only the Laurent part would send it to zero.
- L² is in A_log but not A_log,1, since d(L²)=2L dz/z is not an analytic differential. Over ZMod 2, F=(single 2 1,0) represents z², has dF=0, and differs from every scalar pair (single 0 c,0): its coefficient at exponent 2 is 1, while each scalar's is 0. Thus the constant-kernel theorem needs characteristic zero.

### 2.1a The analytic coefficient extension

For every complete nontrivially normed ultrametric characteristic-zero field k and genuine open annulus A, extend the supplied polynomial-logarithm differential algebra to O_k(A)[L], dL=dz/z, using the supplied LaurentOn carrier. Its differential is surjective onto O_k(A)[L]dz and its kernel is k. Its degree-at-most-one part has image Ω¹(A). Restriction, isometric coefficient extension and differential-compatible parameter substitution commute with these operations. For complete subfields of ℂ_p identify this algebra with the supplied AnnulusLogRing, including its changeParam under the supplied unit/small-perturbation hypotheses; do not reconstruct that special case. Pointwise realization is asserted only when a compatible logarithm branch and a faithful analytic evaluation are supplied. (besser2017, Definition 3.1, p. 9, besser2017 line 404; polynomial-log extension of besser-dejeu2012 §7, p. 355, line 2232).

Assume k complete, nontrivially normed, ultrametric and characteristic zero; A is an open annulus with nonempty interval of positive radii; restrictions stay in a common domain; Parameter change u=az(1+h) has a≠0 and |h|<1 on the domain, transports radii, and includes a chosen logarithm δ of a.

- Every logarithmic polynomial differential has a primitive, unique modulo k.

- For complete subfields of ℂ_p these maps agree with exists_logLaurent_primitive, logLaurent_derivative_eq_zero_iff and AnnulusLogRing.changeParam.

Reuse the supplied Laurent coefficient algebra. The ultrametric absolute value restricted to ℚ bounds inverse integers by a fixed power of their real size. An interior-radius margin absorbs this growth. Integrate by parts in L, and prove the kernel coefficientwise by descending degree and the residue obstruction. This is the general-coefficient extension of the supplied analytic theorem; the formal argument stays in §2.1.

*Needs:* §2.1, ColemanIntegration L0.A1, L0.12, L0.20–L0.23.

**Checks.**

- d(L²/2)=L dz/z also over ℚ₂, and d(L³/3)=L² dz/z over ℚ₃.
- A scalar has zero derivative; L and every nonconstant Laurent monomial do not. Characteristic p would make z^p a counterexample.
- For u=az with chosen δ, L_u maps to L_z+δ. On a closed annulus boundary, division by integers can lose convergence; openness is required.

### 2.2 The alternating local index

For the oriented formal punctured disc or open annulus of §2.1 define B_e(f+aL,g+bL)=Res_e(f dg)+b Res_e(f dz/z)−a Res_e(g dz/z), using a parameter compatible with the orientation. This is the unique alternating k-bilinear pairing with B_e(F,G)=Res_e(F dG) when F has no logarithmic term. In particular B_e(C,G)=C Res_e(dG). This definition owns the index; analytic residue is imported and its additional transport/germ laws are §2.0. (besser2017, Definition 3.2 and Lemma 3.3, p. 9, besser2017 line 421; besser-dejeu2012 Definition 7.1 and construction, p. 356, line 2243).

Use the field, function spaces, orientation and branch hypotheses of §2.1.

- B(F,F)=0 for every F. In the formal coefficient presentation prove the Laurent-first law: B((f,0),G)=Res(f dG). These are the alternating and Laurent-first laws over every characteristic-zero field (besser-dejeu2012 Definition 7.1, p. 356, besser-dejeu2012 line 2243).

- For every characteristic-zero field k, F∈A_log,1 and g∈k((z)), B(F,(g,0))=−Res(g dF). This formal residue-order target uses Laurent integration by parts; with F=(f,0) it equates the two Laurent reductions (besser-dejeu2012 Definition 7.1 and its construction, p. 356, besser-dejeu2012 lines 2243–2249).

- An alternating bilinear pairing with the analytic-first residue rule equals B_e.

- B_e(F+F′,G)=B_e(F,G)+B_e(F′,G), with analogous scalar and right-variable laws.

- `B_{-e}`(F,G)=−B_e(F,G).

- B_e(F+A,G+B)−B_e(F,G)=A Res_e(dG)−B Res_e(dF).

Expand in the direct sum of the Laurent subspace and kL. Apply the supplied Laurent integration-by-parts and exact-residue laws to prove alternation. The residue rule determines all terms except B(L,L), which is zero by alternation.

*Needs:* §2.1, §2.1a, FormalLaurentPuiseux L2–L3.

**Checks.**

- B_e(1,L)=1, B_e(L,1)=−1 and B_e(z,z⁻¹)=−1; both residue order and logarithmic constant terms are detected.
- B_e(L,L)=0 and B_e(C,D)=0 for constants C,D; the expression Res(F dG) alone is undefined when F=L.
- The Laurent-first reduction is tested for arbitrary f,G. For the Laurent-second target, F=z+2L and g=z⁻¹ give B(F,g)=−1 and −Res(g dF)=−1; reversing the residue sign would give +1. The two-Laurent witness B(z,z⁻¹)=−1 agrees with both reductions. The universal Laurent-second and two-Laurent agreement assertions are theorem targets using the supplied integration-by-parts calculus.

### 2.3 Coordinate changes, degrees and coefficients

Let φ:e′→e be a finite map of annuli with positive degree n and compatible orientation, or a formal parameter substitution of ramification order n. For pulled-back functions and branch, B_e′(φ*F,φ*G)=n B_e(F,G). In particular the index is invariant under orientation-preserving parameter isomorphisms, and reverses sign with orientation. Scalar extension commutes with B; restricting to smaller annuli preserves B. For a finite separable coefficient extension L/k, the residue trace commutes with Laurent coefficient trace. (besser-dejeu2012, Definition 7.1, p. 356, line 2243; §8 and residue-degree argument in Lemma 8.1, p. 361, line 2524; double-index consequence).

Use the hypotheses of §2.1; φ finite of positive degree with no poles in its analytic domain; formal substitution has positive order; Branches and coefficient embeddings agree on the source field.

- For characteristic-zero fields k,l, a field embedding f:k→l and formal coefficient pairs F,G, f(B_k(F,G))=B_l((F.1.map f,f(F.2)),(G.1.map f,f(G.2))). This formal coefficient-extension law uses `HahnSeries.map` and requires no analytic annulus. For analytic coefficients use the transported analytic functions on their common domain.

- Analytic continuation to a common end annulus identifies the values.

Apply the analytic residue pullback adapter of §2.0, or the supplied formal substitution, chain rule and residue-degree law, to the Laurent-first rule; uniqueness in §2.2 supplies all logarithmic terms. Coefficient trace commutes with coefficient extraction. The same argument handles shrinking and scalar extension.

*Needs:* §2.2, FormalLaurentPuiseux L1–L3, Mathlib `Algebra.trace`, §2.0.

**Checks.**

- Under z=t², B(1,log(z)) pulls back to B(1,2log(t))=2.
- The identity map has degree 1; there is no degree-zero constant-map residue identity here.
- Under z=t⁻¹ with reversed orientation B(1,log(z))=−1 in the t orientation. Counting absolute degree without an orientation loses this sign.

### Examples

The values B(1,log z)=1 and B(z,z⁻¹)=−1 fix the residue order; z↦z² fixes the degree convention.

### Dependencies

AlgebraicCurves Layers 5 and 9 for point completions and geometric residues; FormalLaurentPuiseux L1–L3 for formal differential calculus; ColemanIntegration L0 analytic/logarithmic theory; additional analytic finite-map/comparison adapters and formal logarithmic/general-coefficient extensions in §§2.0–2.1a; RigidAnalyticGeometry §§1.3, 6.2.

## Layer 3: Wide-open pairings and semistable graph corrections

### 3.0a Coleman domains of a nodal model

For a split regular nodal model of a smooth proper geometrically connected curve over finite K/ℚ_p, construct the component wide opens, their smooth residue domains, paired end annuli and restriction maps for forms. After separating pole sections and making a compatible finite extension and regular subdivision for self-nodes when necessary, compare each component core and a cofinal system of strict neighborhoods with a Coleman good-reduction wide-open presentation. Transfer the supplied Coleman algebra and integration through these identifications; coordinate changes preserve germs and primitive constants. The overlap differential equations give constant differences of two Coleman primitives on a connecting annulus. This constructs no restriction of a natural primitive. (besser2017, §4, pp. 12–13, besser2017 line 562; besser-zerbes2017 §1, pp. 1–2, lines 49–85).

Assume p any prime; K/ℚ_p finite; model split, regular and nodal; Finite pole support is separated from nodes and connecting annuli; Use cofinal strict neighborhoods and compatible refinements; a self-node is subdivided before choosing Coleman domains; All cover assertions are over the chosen realization field; refinements compare in a common finite extension.

- Ordinary and paired-end restrictions commute with d and the supplied Coleman realization on common strict neighborhoods.

- Subdivisions give compatible Coleman domains; forgetting inserted domains adds the jumps along the chain.

Use the formal tubes of the smooth affine component cores and their good-reduction lifts, compare their cofinal strict neighborhoods, and glue the nodal charts along annuli. Import Coleman pullback only where its same-reduction and common-Frobenius-power bounds hold. Integration and the constant kernel transfer through those comparisons; §1.3 handles coarsening.

*Needs:* StableReduction Layers 0–1, 4–5, 7, 9, RigidAnalyticGeometry §§2.3, 6.2, 8.1, ColemanIntegration L1.2–L1.3, L1.17–L1.19, L1.43, §2.1a.

**Checks.**

- A smooth special fibre has one core and no connecting ends; its presentation is the supplied good-reduction one.
- A node xy=π has two opposite end orientations, residues +1 and −1 for dx/x.
- For a self-node a subdivision gives two genuinely different neighboring domains. The expression F_v−F_v cannot encode a nonzero loop period.

### 3.0b Full analytic Coleman coefficients

For a geometrically connected Coleman wide open U with finite end set, extend the supplied good-reduction dagger Coleman algebra to the actual Coleman function and one-form algebra with full analytic coefficients on U over ℂ_p. Construct its derivation, analytic-function inclusion, products, integration of Coleman one-forms modulo constants, and differential-compatible end restrictions. Define A_col,1 as the subspace of actual Coleman functions with analytic differential. Over finite K/ℚ_p construct the K-defined subalgebra and its finite-extension and Galois maps, whose scalar extensions inject into the full ℂ_p algebra. No equality between an algebraic tensor extension and all analytic ℂ_p coefficients is asserted. (besser-dejeu2012, §8, p. 361, besser-dejeu2012 lines 2520–2547; §9, p. 364, line 2766).

Assume U is a Coleman wide open presented on a cofinal strict-neighborhood system; constant field is the geometric coefficient field; For K-valued assertions K/ℚ_p is finite and the branch and data are K-defined; Pullbacks carry compatible Coleman presentations; restrictions preserve a common domain of convergence.

- The differential kernel on the full Coleman algebra is the scalar field, so two global primitives differ by one constant.

- Every actual Coleman one-form has a global Coleman primitive modulo constants; restrictions of a primitive of an analytic form lie in A_log,1.

- The inclusion from algebraically extended base coefficients is injective and commutes with products, d, primitive classes and end restriction.

Extend the existing word/connection realization using full analytic strict-neighborhood sections and their de Rham basis, rather than completing a tensor product by fiat. Reprove faithfulness and the constant kernel on this enlarged coefficient ring by meromorphic pole removal and minimal differential relations. Construct primitive classes in the same unipotent realization. For K-defined data compare local realizations with the supplied algebra by uniqueness. This is the additional full-analytic-coefficient theorem; the base finite/algebraic-coefficient construction is imported.

*Needs:* §3.0a, ColemanIntegration L1.2, L1.17, L1.17a, L1.18–L1.19, L1.43.

**Checks.**

- For U an affine-line wide open and α transcendental over K with |α|<1, (1−αz)⁻¹ on a suitable strict neighborhood is full analytic data but not a finite K-coefficient tensor sum.
- A scalar has zero differential; log z has differential dz/z and is not scalar. A locally constant indicator on two residue discs is not a Coleman function.
- Global primitives of R dS and S dR can be shifted to sum to RS. Unrelated constants at different ends need not come from a global primitive.

### 3.0c Curve cohomology and the graph maps

For X/K smooth proper geometrically connected with finite reduced boundary Z and a split separated regular nodal realization, using the supplied rigid cohomology, finite-dimensionality, scalar-extension and component dagger comparisons, construct the additional curve algebraic/rigid de Rham comparison with the component-annulus Čech total complex. Its degree-one representatives ((ω_v),(f_e)) satisfy d f_e=ω_tail−ω_head and its coboundaries are ((d a_v),(a_tail−a_head)). Prove the graph exact sequence (4.5), restriction maps, and the graph retraction χ represented by f_e−(F_tail−F_head). Define N_ℓ by the harmonic class of ℓ(e)Res_e(ω_tail) using one fixed rational metric, and identify it with geometric monodromy at that valuation scale. Writing Q_K=#κ_K, construct the K-linear q-Frobenius for q=Q_K^r with integer r≥1 and identity coefficient lift via rigid component cohomology and its weight splitting: χφ=χ, Nφ=qN, χN=N, N²=0. Construct ordered proper cup product and its second-kind local-primitive residue formula. The cohomology, cup, χ and N maps respect coefficient extension and admissible common refinements at one valuation scale; Frobenius extension distinguishes scalar extension of an operator from iteration for the enlarged residue field. For nonsplit Z the scalar-extension maps of complexes are defined before choosing a splitting field. (besser2017, §4, (4.2)–(4.7), pp. 13–14, besser2017 lines 586–658; Lemma 4.8, p. 14, line 671; Proposition 4.12 proof, pp. 15–16, lines 777–782).

Assume K/ℚ_p finite, p any prime; X smooth proper geometrically connected of dimension one; a fixed logarithm branch and valuation normalization; Z finite reduced; for displayed split Frobenius charts its points are rational and lie in distinct smooth sections; A split regular nodal model and compatible Coleman cover from §3.0a; common rational metric and fixed valuation scale; Q_K=#κ_K and q=Q_K^r with integer r≥1, so the q-power residue map is the identity; coefficient lift is id_K; the operators are the constructed comparison operators.

- The injection H¹(Γ,K)→H¹_dR(X−Z) and restriction fit the exact sequence (4.5), with χ a retraction.

- Second-kind representatives α,β have α∪β=Σ_x Res_x((∫α)β), with α first.

- With q=Q_K^r, r≥1, and identity coefficient lift, the constructed operators obey χφ=χ, Nφ=qN, χN=N and N²=0; inserted edges and residue currents carry the same valuation normalization. Positive a-th iteration replaces φ,q by φ^a,q^a and retains these identities.

- For finite L/K of residue degree f, let F_K be the Q_K-Frobenius and `phi_{K,r}`=F_K^r. Under the cohomology base-change comparison, F_L=F_K^f⊗1 and `phi_{L,r}`=`phi_{K,r}`^f⊗1 has degree Q_L^r=q^f. The L-linear endomorphism `phi_{K,r}`⊗1 always exists as scalar extension; it is an identity-coefficient q-Frobenius over L only when f divides r, when it equals `F_L^(r/f)`. For f=1 no iterate is needed. χ and N extend at the common valuation scale.

Prove the curve algebraic/logarithmic de Rham and rigid comparison and compute its Mayer–Vietoris complex on the constructed cover. The imported rigid finite-dimensionality theorem and component Frobenius weight decomposition give the weight-zero retraction and linear Q_K-Frobenius with identity coefficient lift; its r-th iterate gives q=Q_K^r. The supplier linearFrobenius_baseChange law gives F_L=F_K^f⊗1; a scalar-extended operator represents the same q-power geometric Frobenius with identity coefficient lift only if that power fixes κ_L. Residue defines monodromy; the metric convention transports the unit-length formula through §1.3. Compute ordered cup by local second-kind primitives. Prove extension and model maps on these complexes and their agreement on refinements; no index identity or §4.2 is used.

*Needs:* §1.3, §3.0a, §3.0b, RigidAnalyticGeometry §§1.3, 6.2, 8.1, StableReduction Layers 0–1, 4–5, 9, PadicDifferentialEquationsAndRigidCohomology §§RD.4.31–RD.4.33, RD.5.76, RD.6.1, RD.6.86, RD.6.88, RD.6.92.

**Checks.**

- For a smooth model χ=N=0 but proper H¹ can be nonzero. A graph-only replacement loses positive-genus cohomology.
- For a global form f_e=0, χ is the class of F_head−F_tail, with the roadmap sign. A total coboundary gives zero class.
- For φ=diag(1,q), N(e₂)=e₁, Nφ=qN. Replacing φ by the identity violates this relation for N≠0; arbitrary endomorphisms are not comparison operators.
- For unramified quadratic K/ℚ₂, κ_K=𝔽₄ and α∈𝔽₄−𝔽₂ has α²≠α, whereas α⁴=α. Thus q=2 cannot have identity coefficient lift; q=4 can. Extending ℚ₂ to K scalar-extends its 2-Frobenius as an operator, while the geometric identity-coefficient 4-Frobenius is its square.

### 3.1 The end-sum on a wide open

For a connected Coleman wide open U, ω,η analytic one-forms on U and their Coleman primitives F,G, define B_U(ω,η)=`sum_{e in End(U)}` B_e(F|e,G|e), orienting each end by a parameter vanishing in its omitted disc. The value is independent of the two global primitive constants, alternating and agrees under common shrinking of ends. Cohomology factorization, analytic-exact vanishing, rational-core vanishing and logarithmic-unit reciprocity are the subsequent theorems of §3.1a. The same construction allows finitely many punctures by replacing them by sufficiently small omitted discs. (besser2017, Definition 3.8, Proposition 3.9 and Remark 3.10, p. 11, besser2017 line 492).

Assume U is a connected Coleman wide open over a finite extension K/ℚ_p or its complete algebraically closed extension; F,G are global Coleman primitives of analytic differentials, with one branch; Use the actual Coleman algebras and end maps of §§3.0a–3.0b; Over K the wide open is geometrically connected with Coleman constant field K; a larger finite constant field is treated over that field and then by trace; The construction is first made after splitting the finite family of ends over the coefficient field; nonsplit ends are traced by §7.5 and descended by §7.6.

- The function-level notation B_U(F,G) means the pairing of their differentials, evaluated by the end-sum.

- Changing either global primitive constant changes the sum by a constant times Σ_ends Res(ω) or Σ_ends Res(η), hence zero.

- Restriction to a smaller wide open preserving the core gives the same pairing, including newly excised discs on which both differentials extend analytically.

- For an analytic one-form extending on the specified strict neighborhood, the sum of its oriented end residues is zero. This supplies the global constant cancellation.

Prove global residue cancellation on these Coleman wide opens using the proper residue theorem and the annular restriction maps. Then §2.2 kills global primitive constants and proves alternation. Local analytic disc primitives and the residue theorem prove shrinking across newly filled nonsingular discs. The cohomological and reciprocity properties are proved after this definition in §3.1a.

*Needs:* §2.3, §3.0a, §3.0b, AlgebraicCurves Layers 5 and 9 (proper residue theorem).

**Checks.**

- If either differential is zero then B_U=0; a proper domain with no ends has zero end-sum for its analytic global one-forms.
- For ℙ¹ minus discs, B_U=0 even if a local end index B_e(1,log z)=1; cancellation over ends is essential.
- On a positive-genus good-reduction curve choose second-kind de Rham representatives α,β with α∪β=1 and delete their pole discs; B_U(∫α,∫β)=1. An identically zero definition fails.

### 3.1a Cohomology and wide-open reciprocity

For a geometrically connected Coleman wide open U with good-reduction compactification C, let B_U be §3.1. Construct the Frobenius-equivariant projection p_U:H¹_dR(U)→H¹_dR(C) splitting proper restriction, and prove B_U(ω,η)=p_U[ω]∪p_U[η]. Hence B_U kills analytic exact forms, factors through H¹_dR(U), vanishes for rational C, and satisfies B_U(F,log f)=0 for every invertible analytic f on U. The supplied component Frobenius spectrum, transported to H¹_dR(U), consists of Weil weight-one eigenvalues and boundary eigenvalues qζ with ζ a root of unity (ζ=1 when the boundary is split); in particular 1/q is absent, the q-eigenspace is in the radical of B_U, and B_U(φ α,φ β)=q B_U(α,β). The assertions hold for full ℂ_p coefficients by comparison, and for K-defined data over finite K. (besser2017, Proposition 3.9 and proof, p. 11, besser2017 lines 503–515; besser-dejeu2012 Proposition 8.4 proof, p. 362, lines 2594–2617; besser-zerbes2017 §2, p. 4, line 212).

Assume U and its Coleman presentation as in §§3.0a–3.1; finite end set and analytic differentials; For Frobenius assertions U descends to finite K/ℚ_p, with a compatible degree-q lift, q=(#κ_K)^r for integer r≥1 and identity coefficient lift; full ℂ_p assertions extend this operator from K; The invertible analytic f and its logarithmic primitive share the given Coleman domain and branch.

- B_U(df,η)=0 for analytic f, and the same holds in the other slot.

- B_U(F,log f)=0 for an invertible analytic f.

- Every q-eigenclass is in the radical. The supplied weight spectrum has no eigenvalue 1/q, including when nonsplit ends contribute qζ.

Use the proper/boundary de Rham sequence and disjoint Frobenius weights to construct p_U. Compute the end-sum by second-kind representatives and prove the compact cup comparison using the local double index, then kill analytic exacts by residue reciprocity. A logarithmic unit has only weight-two boundary class, giving its vanishing. Import the component rigid weight theorem and Gysin sequence, with boundary eigenvalues qζ for nonsplit ends. The cup projection gives the radical and scaling assertions; the positive weights exclude 1/q. This proves the index-dependent claims after the index is defined.

*Needs:* §3.1, §3.0c, PadicDifferentialEquationsAndRigidCohomology §§RD.6.86, RD.6.88, RD.6.92.

**Checks.**

- On ℙ¹ minus discs p_U has zero target and B_U=0 although one local index can equal 1.
- For a proper second-kind cup value 1, B_U=1. Analytic exact df instead gives 0.
- On G_m, [dlog z] is a q-eigenclass and is radical. At q=2 the forbidden reciprocal is 1/2, not 2.
- Take C_k=ℙ¹ over 𝔽₃ and D_k the degree-two point t²+1=0, with rigid coefficients K=ℚ₃; equivalently use its good-reduction Coleman wide-open lift omitting the two conjugate unramified discs. H¹ is one-dimensional: the residue quotient is the anti-diagonal of the two geometric boundary coordinates, and Frobenius is 3 times transposition. Its eigenvalue is −3, its square is 9, and its r-th iterate has eigenvalue (−1)^r 3^r. The generic quadratic point t²−3 over ℚ₃ is ramified and its conjugates collide modulo 3, so it is not this good-reduction boundary. General boundary eigenvalues remain qζ, and 1/q is still excluded.

### 3.2 Normalized component primitives

For a smooth proper geometrically connected curve X/K with a split regular nodal model and meromorphic ω, remove the poles and choose Coleman primitives F_v on the connected component wide opens. Their differences c_ω(e)=F_head|e−F_tail|e are constants and antisymmetric. Normalize by adding component constants until c_ω is harmonic. At a regular model use unit edge lengths; for subdivisions use the compatible rational metric of §1.3. For a self-node, first take a compatible subdivision giving Coleman component domains; coarsening then adds jumps along its chain, rather than subtracting a primitive from itself. The normalized family exists and is unique up to one common constant, and c_ω is independent of that common constant. The family is a torsor under K, not a distinguished primitive with an invented zero value. (besser-zerbes2017, Equation (1.4) and normalization preceding Theorem 1.1, p. 2, besser-zerbes2017 line 74).

Assume K/ℚ_p finite, p any prime; a fixed branch; X smooth, proper, geometrically connected, dimension one; Chosen split regular nodal realization; pole support separated from the connecting annuli; Component wide opens and their Coleman primitives are those in §§3.0a–3.0b.

- Normalize any family by projecting its jump cochain and solving for a component potential; no basepoint is selected.

- Two normalized families for the same ω differ by the same scalar on every component.

- Sums and scalar multiples of normalized families normalize the corresponding forms.

- Replacing F_v by F_v+a_v replaces c by c−d a, with d from §1.1.

- The class of c is the χ([ω]) class of §3.0c, with the signs fixed in the conventions.

Kernel-of-d equals constants on each connected annulus by Coleman uniqueness. Apply §1.2 to c=h+d a and add a_v to the primitives, producing c−d a=h. Connectedness of the dual graph gives uniqueness modulo one scalar.

*Needs:* §1.2, §2.1, §3.0b, StableReduction Layers 0–1, RigidAnalyticGeometry §§2.3, 6.2, §3.0c.

**Checks.**

- A two-component bridge with F_head−F_tail=2 is normalized by subtracting 2 from F_head, giving jump zero; this tests c↦c−d a.
- A smooth irreducible special fibre has one primitive modulo one constant and no graph jumps.
- On a unit-length triangle a cyclic jump cochain (1,1,1) is already normalized and cannot be made zero by component constants. Harmonic gluing does not identify functions on overlaps.

### 3.3 The graph correction before identification

In the split setup of §3.2 let Z contain the poles of ω,η and let F_v,G_v be any component Coleman primitives with jumps c,d. Then Σ_v `sum_{x in Z intersect U_v}` B_x(F_v,G_v)=Σ_v `B_{U_v-Z}`(ω,η)+`sum_{e modulo reversal}`(c(e)Res_e η−d(e)Res_e ω). The ends at Z use the point orientation; connecting annuli are oriented as ends of the tail component. The formula holds before harmonic normalization; neither side is claimed independent of arbitrary component constants. (besser2017, Theorem 4.10 and its expansion, pp. 14–15, besser2017 line 700).

Use the hypotheses of §3.2; ω and η regular on X−Z; Z consists of rational points in separated smooth residue domains in this realization; No pole lies on a connecting annulus.

- Each summand c Res η−d Res ω is invariant under e↦−e.

- Changing component primitives changes both sides by the same residue-weighted sum.

Expand every component end-sum, separating puncture ends from connecting ends. Each connecting annulus occurs twice with opposite orientation. Substitute F_head=F_tail+c and G_head=G_tail+d; §2.2 gives the stated sign. This proof uses no harmonic/Vologodsky comparison.

*Needs:* §2.2, §3.1, §3.2.

**Checks.**

- On one paired overlap take c=2,d=3,Res η=5,Res ω=7. The correction is 10−21=−11, and reversing all four signs still gives −11.
- If c=d=0 the correction is zero. Zero forms give zero on both sides.
- Adding a constant only on one component can change the point-sum when that component has nonzero total puncture residue. Independence is not valid before normalization.

### 3.4 The cohomological pairing with graph terms

For X,Z and a split separated semistable realization define on H¹_dR(X−Z/K) the alternating pairing B_h(α,β)=Σ_v `B_{U_v-Z}`(res_v α,res_v β)+(χ α,N_ℓ β)_ℓ−(χ β,N_ℓ α)_ℓ. Here χ is the graph retraction constructed in §3.0c, graph representatives of χ are harmonic, and N_ℓ is represented by ℓ(e)Res_e of the differential in a Čech representative. For global meromorphic forms this equals §3.3 with harmonic component jumps. It annihilates algebraic exact forms, restricts to α∪β in that order on proper H¹_dR(X), and is unchanged by refinements between admissible nodal realizations, using the metric when edge lengths change; modifications outside that class are compared after finite extension and regularization. If Z is empty use Čech hypercohomology, rather than pretending all proper classes have global regular representatives. (besser2017, Definition 4.11 and Proposition 4.12(1)–(3), pp. 15–16, besser2017 line 738; metric formulation is the subdivision consequence).

Assume X/K smooth proper geometrically connected curve, K/ℚ_p finite with fixed branch; Z finite reduced and split in this realization; points separated in the model; Use the Čech, cup, χ and monodromy maps constructed in §3.0c; Lengths have one fixed valuation normalization; Every model at which the displayed formula is evaluated is an admissible split nodal realization; a modification outside that class is compared after finite extension and regularization.

- For harmonic F_v,G_v, B_h([ω],[η])=`sum_{x in Z}` B_x(F_v,G_v).

- For proper classes α,β, B_h(j*α,j*β)=α∪β.

- Transport through the canonical cohomology maps of refinements preserves the pairing; rational tails contribute zero.

- Equal de Rham classes give equal values in either argument; changing Čech representatives by a total coboundary does not change B_h.

§3.0c makes res,χ,N_ℓ maps on hypercohomology, so the expression is defined on classes. §1.2 makes the graph products independent of exact representatives. §3.3 identifies forms; the local second-kind residue formula in §3.0c proves the proper restriction. Subdivision and rational-tail invariance follow from §§1.3 and 3.1; the model comparison transports this to common refinements.

*Needs:* §1.3, §3.3, §3.0c, §3.1a.

**Checks.**

- The graph contribution on harmonic/residue values c_ω=2,c_η=3,r_η=5,r_ω=7 is −11 in the chosen order; exchanging α and β gives +11.
- For X=ℙ¹ and Z empty, H¹_dR=0 and B_h=0; for good reduction there is no graph contribution.
- For second-kind representatives with proper classes α∪β=1, the normalized point-sum is 1. Defining the proper pairing only from global holomorphic forms would miss these classes.

### 3.5 Frobenius and monodromy compatibility

For the linear q-Frobenius φ and geometric monodromy N in §3.0c, B_h(φ α,φ β)=q B_h(α,β) and B_h(Nα,β)+B_h(α,Nβ)=0. The geometric N here is distinct from differentiation in the universal logarithm variable. When using metric cochains, the comparison maps must identify that geometric N with N_ℓ using the same valuation scale. (besser2017, Proposition 4.12(4) and proof, pp. 15–16, besser2017 line 754).

Use the hypotheses of §3.4; q=(#κ_K)^r with integer r≥1 and identity coefficient lift, as in §3.0c; Operators are the comparison operators of §3.0c, not arbitrary endomorphisms; χφ=χ, Nφ=qN, χN=N, N²=0; the wide-open scaling theorem is §3.1a.

- For a≥1, the a-th iterate φ^a has degree q^a=`(#kappa_K)^(r*a)` and scales the pairing by q^a. For finite L/K of residue degree f, the corresponding degree-q^f operator is φ^f⊗1 as in the cohomology base-change law of §3.0c; simply extending φ scales the extended pairing by q and need not be a geometric identity-coefficient q-Frobenius over L.

Apply wide-open Frobenius scaling and χφ=χ, Nφ=qN to §3.4. For monodromy the component restrictions of N vanish, χN=N and N²=0; the two remaining symmetric graph products cancel. No reference to the later harmonic identification is needed.

*Needs:* §3.4, §3.0c.

**Checks.**

- For N=0 the skew-adjointness equation is 0=0; this does not force B_h=0.
- On a symplectic two-dimensional test space, φ=diag(1,q), N(e₂)=e₁,N(e₁)=0 and B(e₁,e₂)=1 give B(φe₁,φe₂)=q and B(Ne₂,e₂)+B(e₂,Ne₂)=1−1=0.
- An arbitrary identity operator on a nonzero symplectic pairing cannot be called a q-Frobenius when q≥2: it scales by 1, not q.
- For K/ℚ₂ unramified quadratic, use q=4 and scaling 4; q=2 with identity coefficient lift is excluded. Under the residue-degree-two extension from ℚ₂, iterating a symplectic test operator diag(1,2) gives diag(1,4) and scaling 4, whereas its scalar extension alone still scales by 2.

### Examples

A rational wide open has zero double pairing. A positive-genus wide open can have nonzero pairing, and a cycle forces the graph correction to be retained.

### Dependencies

Layers 1–2; ColemanIntegration L1 good-reduction theory; the component/full-coefficient/cohomology constructions in §§3.0a–3.0c and index reciprocity in §3.1a.

## Layer 4: Harmonic realization of arbitrary-reduction single integration

### 4.0 Abelian logarithms for arbitrary geometric coefficients

For every abelian variety A defined over ℂ_p, construct the unique locally ℂ_p-analytic additive homomorphism log_A:A(ℂ_p)→Lie(A)(ℂ_p) whose differential at the identity is the identity. No model over a finite extension of ℚ_p is required. It is independent of the scalar logarithm branch. This extends the class of varieties covered by the logarithm supplier over finite extensions of ℚ_p; for varieties descending to a finite p-adic field, identify the result with the supplied construction. (colmez1998, Theorem II.1.9, pp. 76–77, colmez1998 lines 3079–3121 (including varieties not defined over a finite p-adic field); Definition II.1.12 and Lemma II.1.13, p. 78, lines 3145–3159; vector-valued formulation and homomorphism compatibility by uniqueness).

Assume p any prime, including 2 and 3; coefficients ℂ_p; A an abelian variety over ℂ_p of any dimension and arbitrary reduction.

- For every open subgroup V of A(ℂ_p), the quotient A(ℂ_p)/V is torsion; openness does not imply finite index over ℂ_p (Theorem II.1.9).

- Every locally ℂ_p-analytic additive homomorphism A(ℂ_p)→Lie(A)(ℂ_p) with identity differential equals log_A. In particular log_A is zero on torsion points and restricts to an analytic group isomorphism on a sufficiently small open subgroup.

- For every homomorphism f:A→B of abelian varieties over ℂ_p and x∈A(ℂ_p), log_B(f(x))=df_0(log_A(x)).

- If A is obtained from A₀/K with K/ℚ_p finite and a specified base-change identification, log_A agrees on all A(ℂ_p) with the transported abelianLog.cp of AnabelianGeometryAndNonabelianChabauty §5.8, and hence on A₀(L) with its abelianLog for every finite L/K. These comparisons respect homomorphisms and towers.

Construct the normalized local analytic logarithm by integrating invariant forms near the identity; its differential is the identity, so it is an analytic group isomorphism after shrinking. Prove the open-quotient torsion theorem for arbitrary A/ℂ_p using the geometric deformation argument of Theorem II.1.9, including varieties without a finite p-adic field model. No compactness of A(ℂ_p) is assumed. For x choose n≥1 with [n]x in the local subgroup and set log_A(x)=n⁻¹ log_V([n]x). Local additivity and common multiples prove independence and additivity. Translation proves local analyticity. A competing homomorphism with the same differential agrees locally, and torsion of the quotient forces global agreement in the characteristic-zero Lie algebra. Apply the same argument to invariant-form evaluations to prove homomorphism compatibility. The transported finite-model logarithm has the required differential and analyticity, so uniqueness gives the comparison on all ℂ_p-points.

*Needs:* JacobianChallenge Layer E, AnabelianGeometryAndNonabelianChabauty §5.8 abelianLog.cp for the finite-model comparison.

**Checks.**

- For dimension-zero A, its point group and Lie algebra are trivial, and log_A is the zero map with the identity differential on the zero space.
- If [n]x=0 for n≥1 then n log_A(x)=0, hence log_A(x)=0. For positive-dimensional A a small nonzero tangent vector v instead has log_A(exp_A(v))=v≠0. Thus the zero map fails the differential condition and the local inverse is not a global inverse.
- For A₀/K and x∈A₀(L), with L/K finite, the geometric logarithm has value the embedded supplied `log_{A0,L}`(x), without multiplication by [L:K]. The comparison is also on all A₀(ℂ_p), not only algebraic points.
- For t∈ℂ_p transcendental over ℚ_p, E_t:y²=x(x−1)(x−t) is smooth and has j=256(1−t+t²)³/(t²(1−t)²), transcendental over ℚ_p. It has no finite p-adic field model, but `log_{E_t}` and invariant-form primitives are covered here, including p=2 and 3. Extending points of a variety defined over a finite p-adic field does not cover this example.

### 4.0a Natural primitives on abelian varieties

For an abelian variety A over a finite p-adic field or ℂ_p and every closed rational one-form ω, construct a locally log-meromorphic primitive F_ω modulo one affine scalar constant. Let Δ_h F(x)=F(x+h)−F(x). Over ℂ_p the algebraic theorem of the square makes Δ_hΔ_kω exact in rational functions and scalar logarithms; normalize its primitive to vanish when h=k=0. Over a finite p-adic field use the descended span of traces `Tr_{L/K}`(c dlog f), with L/K finite separable, c∈L and f∈L(A³)×, together with rational exact forms; its primitive uses `Tr_{L/K}`(c log_univ f). Require Δ_hΔ_k F_ω to be that primitive. Prove existence, uniqueness, linearity, compatibility with homomorphisms and evaluation of rational exact and logarithmic forms. Prove the finite-difference splitting theorem for symmetric locally log-meromorphic additive cocycles needed for this construction. On invariant holomorphic forms over finite K use the supplied abelian logarithm; for arbitrary A/ℂ_p use §4.0 and its finite-model comparison. (colmez1998, Theorem II.1.16 and Proposition II.1.17, pp. 78–79, colmez1998 lines 3169–3214; logarithm uniqueness Lemma II.1.13, p. 78, line 3147; geometric algebraic scope, Chapter I opening, p. 13, colmez1998 line 602; Galois descent, Remark 2(iv), pp. 2–3, colmez1998 lines 246–258).

Assume p any prime; K/ℚ_p finite, or coefficients in ℂ_p with the same universal logarithm; A is an abelian variety; ω closed rational; all evaluations avoid its poles; Universal values lie in K+K T (respectively ℂ_p+ℂ_p T), with log_univ(p)=T.

- For n≥1, over ℂ_p a symmetric additive n-cocycle of locally log-meromorphic functions on A has a finite-difference primitive modulo polynomials of degree <n in abelian logarithms, with the same allowed singularities (Theorem II.1.16). Prove the finite K/ℚ_p version on A(K) for K+K T-valued cocycles, with traced scalar logarithms, and compatibility of the normalized differential rigidification with extension to ℂ_p.

- Over ℂ_p construct the normalized rational-logarithmic primitive of the second difference of every closed rational ω. For finite K/ℚ_p its normalized primitive is Galois invariant, uses traced scalar logarithms, and rigidifies F_ω modulo constants with no rational-pole assumption (Proposition II.1.17 and descent).

- For invariant holomorphic ω, F_ω(b)−F_ω(a)=ω(abelianLog(b−a)) and its universal T coefficient is zero.

- For A,ω defined over finite K/ℚ_p and regular endpoints a,b∈A(K), the rigidified ℂ_p primitive difference F_ω(b)−F_ω(a) belongs to K+K T. Continuous Galois conjugation acts coefficientwise with T fixed. For every finite L/K the same difference on embedded endpoints is its coefficientwise image; these comparisons compose in towers.

Establish the algebraic square identity and its normalized rational-logarithmic primitive geometrically; for K-defined data descend this finite algebraic expression by normalized trace, including traced scalar logarithms. Prove symmetric cocycle splitting by convergent local analytic differences and division in the coefficient field. Over finite K, apply it to this K-valued cocycle on A(K), obtaining a K+K T-valued primitive; completeness keeps the convergent coefficients in K. Subtract the K-defined invariant differential error with the imported abelian logarithm. Over arbitrary A/ℂ_p subtract that error using abelianLogCp of §4.0; its finite-model comparison identifies the two corrections whenever A descends. Run the construction over each finite L/K and over ℂ_p. The common square identity and differential rigidification identify restrictions modulo constants: their difference has zero differential and zero second difference. Its apparent singularities cancel, leaving a locally constant additive map modulo a scalar; properness makes A(K) compact, so this map has finite image and vanishes in the characteristic-zero target. Normalization at a regular K-point identifies the based values. Conjugating the construction transports every coefficient and logarithm, so uniqueness gives Galois equivariance with T fixed. Thus rationality and finite-extension independence precede natural integration, using the finite p-adic field construction rather than an additional completed-field fixed-point theorem. The same uniqueness proves linearity, exact evaluation and algebraic pullback without a semistable graph.

*Needs:* §4.0, AnabelianGeometryAndNonabelianChabauty §5.8 abelianLog, JacobianChallenge Layer E, ColemanIntegration L0.15–L0.19.

**Checks.**

- For dimension-zero A every form and every normalized integral is zero.
- An invariant form has second difference zero and its based primitive is the abelian logarithm pairing. An unrelated locally constant function with zero derivative need not obey the finite-difference condition.
- For a rational function f, F_df=f modulo constants; the zero form has only scalar constant ambiguity, not arbitrary residue-disc constants.
- For a K-defined rational f on A, the normalized primitive of df is f−f(a) and is fixed by G_K. Enlarging K to L does not multiply it by [L:K]; an averaged trace, rather than an unnormalized trace of the whole primitive, is needed for descent.

### 4.0b Reduction of closed rational forms to the Albanese

Prove `NaturalIntegration.properAlbanese_exists`. For every characteristic-zero field k, smooth geometrically connected separated finite-type X/k and x₀∈X(k), construct an abelian variety A/k and a pointed morphism a_X:X→A satisfying the native IsAlbanese predicate. The headline Lean signature binds smoothness, local finite type, quasi-compactness, separatedness and geometric connectedness explicitly on the structure morphism; X need not be proper. Prove functoriality for pointed morphisms and compatibility with every field extension, with the canonical comparison preserving a_X. Over an algebraic closure first lift a generating map through finite isogenies to a maximal morphism, then use the algebraic maximal-morphism construction: the dimensions of generated abelian targets are bounded by the space of regular one-forms on a smooth projective compactification; a maximal target then has the universal property. Extend rational maps to abelian varieties across smooth X. Uniqueness rigidified by x₀ gives effective descent of the polarized projective target and map to k; spreading morphisms and rigidity give stability under arbitrary field extension. This is the higher-dimensional existence assertion of this subsection (serre1959, Exposé 10, §2 Theorems 1–2 and the corollary, pp. 10-02–10-05, lines 83–205; §4 Theorems 5–6, pp. 10-10–10-11, lines 431–481; colmez1998 Corollary I.5.10, Remark I.5.11 and Proposition I.5.12, pp. 49–50, lines 2083–2110).

For X,k,x₀ as above, use `NaturalIntegration.properAlbanese_exists`. Over algebraically closed k, pullback is an isomorphism on closed rational one-forms modulo the k-span of df and dlog f, giving ω=a_X*η+df₀+Σ_i c_i dlog f_i. Over arbitrary k, define LogDesc_k(X) as the k-span of `Tr_{L(X)/k(X)}`(c dlog f), for finite separable L/k, c∈L and f∈L(X)×; the differential trace is the coefficient trace under `Omega^1_{L(X)/L}`≃L⊗_k `Omega^1_{k(X)/k}`. Pullback gives the corresponding quotient isomorphism modulo d(k(X))+LogDesc_k(X). Thus over k the decomposition uses a finite sum of these traced logarithmic terms. For k-defined data choose the geometric decomposition over an algebraic closure k̄/k, then embed k̄ into any desired algebraically closed overfield E. Full logarithmic spanning holds over k̄; over arbitrary E it identifies only the span generated by rational functions defined over finite algebraic extensions of k inside E. Genuinely E-defined data use the geometric rational-form comparison over E itself. Prove functoriality, compatibility with finite separable extension, and moving of apparent poles away from finite regular evaluation sets. Over finite p-adic k, pull back the abelian primitive and add f₀ and the traced scalar universal logarithms. Its based value is k-rational, independent of the decomposition and finite field of definition, and extends where ω is regular. This comparison concerns rational forms and the proper Albanese. (colmez1998, Lemmas II.1.26–II.1.27, pp. 83–85, colmez1998 lines 3376–3431; geometric algebraic scope, Chapter I opening, p. 13, colmez1998 line 602; Galois descent, Remark 2(iv), pp. 2–3, colmez1998 lines 246–258; proper Albanese §I.5, pp. 45–49, lines 1938–2100; trace-averaging consequence in characteristic zero).

Assume k a characteristic-zero field; algebraic closedness only for the untraced geometric decomposition; finite p-adic k or ℂ_p for primitive assertions; X smooth geometrically connected finite type with a rational point a, and ω closed rational; Evaluation points are outside the poles of ω; auxiliary decompositions may have additional poles; traces use finite separable constant extensions.

- Over algebraically closed k pullback identifies closed rational forms modulo d(k(X))+span_k{dlog f}. Over arbitrary characteristic-zero k it identifies the quotients modulo rational exact forms and LogDesc_k on X and its Albanese. These quotient comparisons commute with finite separable coefficient extension.

- For k-defined data and any finite set of regular algebraic points, including the base point, choose the geometric decomposition over k̄/k with no apparent poles there, descend after a common finite extension of k, and only then embed into E or ℂ_p. For data defined over E itself, use the independent geometric decomposition over E; primitive assertions retain the finite p-adic or ℂ_p coefficient hypotheses. Its based primitive extends to the regular locus and is independent of that choice.

- An algebraic morphism induces the pointed Albanese comparison. On a dense open where the chosen rational expressions pull back, it respects rational exact forms and LogDesc_k; moving gives the based primitive pullback wherever the original form is regular.

- For finite K/ℚ_p, a K-defined X,ω and regular a,b∈X(K), the based geometric primitive constructed from §4.0a, rational functions and scalar logarithms belongs to K+K T by the finite p-adic field construction and traced logarithms; its geometric comparison is fixed by G_K with T fixed. Every finite L/K gives the coefficientwise embedded value, independent of splitting field, apparent-pole removal and decomposition; these identifications compose in towers. The assertion follows from the abelian primitive descent of §4.0a and geometric decomposition independence, without §7.3 or naturalIntegration.

- For characteristic-zero k and X as above, LogDesc_k(X) is closed under addition: concatenate finite traced logarithmic presentations.

- For a∈k, scaling a traced generator gives `Tr_{L(X)/k(X)}`((ac)dlog f); in particular zero belongs to LogDesc_k(X).

- In every algebraically closed overfield E/k, each traced generator becomes Σ_σ σ(c)dlog(σf), over k-embeddings σ:L→E. For an algebraic closure k̄/k, the k̄-span of the scalar-extended LogDesc_k(X) is the full logarithmic subspace `span_{k_bar}`{dlog f : f∈k̄(X)×}. For arbitrary algebraically closed E/k its E-span equals only span_E{dlog f : f∈L(X)×, k⊆L⊆E finite algebraic}; no equality with all E-rational logarithmic forms is asserted.

- For finite separable M/L/k, iterated differential traces agree with direct trace. Presentations computed in a larger normal closure therefore define the same k-subspace; averaging uses the reciprocal of the extension degree.

Use the supplied compactification on a dense quasi-projective open in the construction of `NaturalIntegration.properAlbanese_exists`; its rational-map extension identifies the proper Albanese of that compactification with that of X. For curves compare with the supplied pointed Jacobian by IsAlbanese.uniqueUpToIso. Prove the rational residue/Picard comparison over any algebraically closed characteristic-zero field, giving its geometric quotient isomorphism. For X,ω defined over k, first choose this decomposition over an algebraic closure k̄/k. Its finitely many coefficients then lie in a finite algebraic extension of k. In a finite Galois extension containing that field, average conjugates: η and f₀ descend by normalized trace, and each logarithmic term becomes a trace of c dlog f divided by the extension degree. Conversely each trace splits into scalar logarithmic derivatives. For any f over a finite separable L/k, write L=k(θ). The matrix (σ(θ)^j) for 0≤j<[L:k] is a Vandermonde matrix with nonzero determinant, since the embeddings σ have distinct values on θ. Inverting the trace identities Tr(θ^j dlog f)=Σ_σ σ(θ)^j dlog(σf) expresses every conjugate dlog f as a k̄-linear combination of traces. This proves full spanning over k̄ and, after embedding k̄ in E, exactly the finite-algebraic-field-of-definition span over E. It gives no spanning statement for rational functions with transcendental coefficients. The same averaging proves quotient injectivity. Division is legitimate in characteristic zero, and a non-Galois extension is handled in a normal closure by trace transitivity. This also proves coefficient-extension compatibility of the descended quotient. For genuinely E-defined data use the geometric rational-form comparison over E itself; when E=ℂ_p, prove geometric primitive independence using the rational-logarithmic constant kernel and §4.0a. For k-defined data perform the decomposition and apparent-pole removal over k̄ before embedding into E or ℂ_p. Galois conjugation then preserves the based primitive; the abelian primitive descent of §4.0a and coefficientwise traced logarithms give rationality and finite-extension independence before §4.0c. Curve Albanese is the supplied pointed Jacobian.

*Needs:* §4.0a, JacobianChallenge Layers D–F, ResolutionOfSingularitiesCharacteristicZero §6.2 sncCompactification, Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese`, Mathlib `Algebra.trace`, Mathlib `Algebra.trace_trace`, Mathlib `trace_eq_sum_embeddings`.

**Checks.**

- For Spec k or ℙ²_k the proper Albanese is zero; a curve-only construction does not cover the dimension-two input. These identities persist after extending k.
- For a proper smooth curve with a rational point, `NaturalIntegration.properAlbanese_exists` agrees with the supplied pointed Jacobian by the native universal property, including the zero Jacobian of ℙ¹.
- On A=E×E with its identity basepoint the Albanese map is the identity; after any extension L/k its comparison is the identity on A_L. For a general X with no k-point no pointed a_X is manufactured.
- For A¹ with ω=dt use f₀=t and no Albanese contribution; its proper Albanese is zero.
- For G_m with ω=dt/t use f₁=t; a proper-Albanese-only differential would miss its logarithmic term.
- For a proper curve use its pointed Jacobian as Albanese; for a point every term is zero. A decomposition with cancelling apparent poles must still give a regular primitive where ω is regular.
- Over k=ℚ₃ take X=ℙ¹, α²=2 and ω=dt/(t²−2). Its residues ±1/(2α) are not in k, so no k-linear sum of dlog of k-rational functions, even with an exact term, represents it. Instead ω=`Tr_{k(alpha)/k}`((1/(2α))dlog(t−α)); its based primitive is the trace of (1/(2α))log_univ((t−α)/(a−α)), and further finite extension leaves this value unchanged.
- For ω=dt defined over k, averaging an expression over a quadratic extension gives (1/2)Tr(dt)=dt; using Tr without the factor 1/2 gives 2dt. For a point the quotient and based primitive are zero, over every constant extension.
- On ℙ¹, dt has a double pole at infinity and is not in LogDesc_k(ℙ¹): every traced scalar logarithmic derivative has at most simple poles. In contrast dt/t is logarithmic, and the nonsplit quadratic form above belongs through its trace. Exact forms and descended logarithmic forms are distinct subspaces.
- For k=ℚ, E=ℂ, X=ℙ¹ and α transcendental over ℚ, dt/(t−α)=dlog(t−α) is logarithmic over E with residue 1 at α. Every finite E-linear combination of scalar-extended traced generators from finite algebraic extensions of ℚ is regular at α, so the E-span is strictly smaller than the full E-logarithmic subspace. The geometric rational-form decomposition over E still includes this form.

### 4.0c The all-prime natural single integral

For every prime p, every closed subfield K⊆ℂ_p, every smooth geometrically connected finite-type variety U/K, closed regular one-form ω and a,b∈U(K), construct the unique natural single-integration theory with universal value A+B T in K+K T⊆K[T]. It is K-linear in ω, locally K-analytic in endpoints, differentiates to ω in the second endpoint, vanishes at a=b and satisfies Chasles. It commutes with algebraic pullback and integrates df and dlog f by endpoint differences and the universal logarithm. These theories commute with inclusions of closed coefficient subfields, including K⊆ℂ_p, and with continuous Galois conjugation with T fixed. For finite K/ℚ_p its specialization agrees with the finite p-adic field primitives of §§4.0a–4.0b and with supplied Coleman integration in good reduction. Apply the general theorem to complements of poles of meromorphic curve forms. No graph, genus, local compactness or reduction condition enters existence or uniqueness. Uniqueness concerns the whole natural theory across varieties over each fixed K, rather than derivatives alone. Vologodsky2001 Proposition 52, §17.2, p. 42, line 1806, whose proof uses Conjecture 1 in the rank-two case established by Colmez (line 1810), identifies the finite-K specialization with that preprint’s single integral under its p>2 standing convention (line 51); the all-prime theorem uses Colmez. (colmez1998, Closed coefficient scope p. 73, colmez1998 line 2957; Definitions II.1.2–II.1.3 and Theorem II.1.4, pp. 73–74, colmez1998 lines 2982–2997; proof pp. 83–85, lines 3395–3431; closed-field descent Remark 2(iv), pp. 2–3, lines 246–258; open-quotient restriction in Theorem II.1.9, pp. 76–77, lines 3102–3105).

Assume p any prime, including 2 and 3; K a closed subfield of ℂ_p with the induced complete ultrametric topology; U smooth geometrically connected finite type; ω regular and closed; endpoints K-rational and off all excluded poles; Coefficient extension uses inclusions K⊆L of closed subfields of the same ℂ_p; a specialized branch λ lies in K and maps to its image in L; T is fixed.

- The natural integral belongs to the affine subspace K+K T; evaluate T=λ for the chosen branch.

- For every inclusion K⊆L of closed subfields of ℂ_p, the pullback form and embedded endpoints have the coefficientwise embedded universal integral; the maps compose in towers. This includes infinite coefficient extensions and L=ℂ_p. Continuous Galois automorphisms transport the theory to the conjugate closed field, acting coefficientwise and fixing T.

- For finite K/ℚ_p, the specialization of the general theory equals the based finite p-adic field primitive of §§4.0a–4.0b. For a supplied good-reduction Coleman presentation and a fixed branch, it agrees with the supplied Coleman single integral; this equality also holds after the coefficient comparisons to ℂ_p.

- For df the integral is f(b)−f(a); for dlog f it is log_univ(f(b)/f(a)), on their domains.

- For K=ℂ_p this exports natural integration on every smooth geometrically connected finite-type U/ℂ_p, including varieties without any finite p-adic field model. The primitive is the geometric one from §§4.0a–4.0b. This is the ℂ_p theory used by the finite-map and rational-line APIs of §4.0d.

- For closed K⊆ℂ_p let H_K⊆`G_Qp` be the subgroup whose continuous action fixes every element of K, and let L_K=`(Qp_bar)^(H_K)`. Prove H_K is closed and identify the closure of L_K in ℂ_p with K. Apply PadicPeriodRings §1.2 padicComplex_fixed_closure_eq to obtain `Cp^(H_K)`=K. With T fixed, the H_K-invariants of ℂ_p+ℂ_p T are K+K T. This is the closed-subfield adapter to the supplied fixed-closure theorem (colmez1998 Remark 2(iv), lines 246–258).

- For U,ω over a closed K⊆ℂ_p and a∈U(K), the based geometric primitive P↦F_ω(P)−F_ω(a) of §§4.0a–4.0b is H_K-equivariant on U(ℂ_p), with T fixed. At every b∈U(K) its value lies in K+K T. Its restriction is locally K-analytic with differential ω and is independent of the geometric decomposition. It commutes with inclusions of closed fields. No unbased primitive is claimed fixed without normalization at a K-point.

- For every abelian variety A over a closed K⊆ℂ_p and every open subgroup V⊆A(K), A(K)/V is torsion. Choose a sufficiently small geometric analytic subgroup W⊆A(ℂ_p) with W∩A(K)⊆V and use the geometric open-quotient torsion theorem of §4.0. Consequently a locally constant additive map A(K)→K+K T is zero; no finite-index or compactness claim is made (colmez1998 Theorem II.1.9, lines 3102–3105).

For a characteristic-zero field k and finite extension L/k, equip the supplied smooth geometrically connected group R=Res₍L/k₎ Gₘ with its invariant trace forms; call this the trace-form adapter. Its supplied basis presentation is R={N≠0} in affine n-space, n=[L:k], where N is the determinant norm, and its supplied point identification is R(k)=L×. For c∈L construct the closed invariant regular k-form η_c=`Tr_{L/k}`(c z⁻¹dz), compatible with that presentation and changes of basis. Prove dη_c=0 and the group-law identity m*η_c=pr₁*η_c+pr₂*η_c, and that restriction along k×→L× is Tr(c)dlog t. For smooth geometrically integral X/k and f∈L(X)×, the rational k-map f:X⇢R pulls η_c back to `Tr_{L(X)/k(X)}`(c dlog f) on its common regular invertible domain. These assertions use the differential trace of §4.0b (trace-form consequence of colmez1998 Definition II.1.3(iv)–(v), p. 74, lines 2993–2995; geometric logarithmic decomposition, Lemmas II.1.26–II.1.27, pp. 83–85, lines 3376–3431).

- For closed K⊆ℂ_p and finite L/K inside ℂ_p, every theory satisfying the fixed-K naturality, linearity, Chasles, derivative and K-rational dlog axioms has, for each c∈L, I_R(1,z;η_c)=`Tr_{L/K}`(c log_univ z). Consequently the based integral of Tr(c dlog f) is Tr(c log_univ(f(b)/f(a))) wherever f defines the displayed map; moving handles apparent poles. This assertion does not assume coefficient base change of the theory. Group-law naturality makes the difference from the displayed trace-logarithm formula a locally constant homomorphism δ:L×→K+K T, zero on K×. Its kernel contains an open subgroup W. Every unit u has residue of finite multiplicative order, since the residue field lies in 𝔽̄_p; after that power u is a principal unit and its successive powers u^(p^m) tend to 1: the binomial estimate `r_(m+1) <= max(p^(-1)*r_m, r_m^2)` for r_m=|u^(p^m)−1| contracts geometrically from r₀<1. Hence the unit group modulo its intersection with W is torsion and δ vanishes on units. All K-embeddings of the finite extension L preserve the norm, since K is complete. Thus zⁿ/`N_{L/K}`(z) is a unit, giving nδ(z)=δ(`N_{L/K}`(z))=0. The target is torsion-free, so δ=0. This proves the traced logarithmic step over every closed K, without a compactness or discreteness hypothesis (elementary trace/norm consequence of the logarithm rigidity in colmez1998, Introduction p. 1, lines 170–183, and Definition II.1.3, p. 74, lines 2986–2995).

First construct the geometric theory over ℂ_p using §§4.0a–4.0b, moving apparent poles and subtracting endpoint values. Its geometric rigidity gives equivariance under every continuous automorphism of ℂ_p. For closed K put F=K∩ℚ̄_p. Characteristic zero makes K/F regular, so K and ℚ̄_p are linearly disjoint over F; every element of Gal(ℚ̄_p/F) extends uniquely to Kℚ̄_p fixing K. Completeness of K and `spectralNorm_unique_field_norm_ext` make this extension isometric on the algebraic extension Kℚ̄_p/K; its continuous extension to ℂ_p is the supplied Galois action, hence H_K=Gal(ℚ̄_p/F) and L_K=F⊆K. Continuity of the action makes H_K closed. The supplied fixed-closure theorem gives `K <= (Cp)^H_K = closure(F) <= K`, proving equality before it is used for descent. Apply this coefficientwise with T fixed. The normalized geometric primitive is H_K-equivariant, so at K-points its coefficients lie in K. Its local Taylor coefficients at a K-point are fixed as well, giving local K-analyticity and the correct differential. This proves geometricPrimitiveDescent before defining the K-valued integral. Restricting the same geometric theory to nested closed fields proves base change; endpoint differences give Chasles, and the geometric construction gives linearity, exact/logarithmic evaluation and algebraic naturality. For uniqueness over each fixed K, naturality forces the rational-logarithmic second-difference identity on abelian varieties. The difference of two rigidified primitives is locally constant additive modulo a scalar; the torsion open-quotient theorem, obtained by restriction from §4.0, makes that difference constant over every closed K. The explicit trace torus and the traced-logarithm uniqueness theorem fix every generator of LogDesc_K, including coefficients outside K. Apply the descended Albanese quotient and moving of §4.0b to conclude uniqueness on U. This uses torsion, not compactness. For finite K, the early finite p-adic field construction satisfies these rigidifications, giving agreement; compare the same auxiliary varieties and primitives in good reduction with the supplied Coleman theory. The semistable realization and compact Jacobian arguments remain over finite p-adic fields.

*Needs:* §4.0, §4.0a, §4.0b, ReductiveGroupsPartII §§RG2.0a.1–RG2.0a.2 (norm-open Weil restriction and its group, point, smoothness and splitting laws), the trace-form API of the trace-form adapter in this subsection, PadicPeriodRings §§1.1–1.2 `padicComplexGaloisAction_spec`, `padicComplexGaloisAction_continuous`, `padicComplex_fixed_closure_eq`, Mathlib `PadicComplex`, Mathlib `spectralNorm_unique_field_norm_ext`, Mathlib `Algebra.norm`, Mathlib `Algebra.norm_eq_matrix_det`, Mathlib `Algebra.norm_ne_zero_iff`, ColemanIntegration L1.19, L1.43.

**Checks.**

- On A¹ with df=dt, I(0,1)=1 and the universal T coefficient is zero; I(a,a)=0.
- On G_m with dlog t, I(1,p)=T, so a branch-independent replacement fails, including at p=2.
- Two residue-disc-wise primitives of the zero form can differ by a nonconstant locally constant function; the derivative alone does not characterize the natural theory.
- For L=K, the trace-form adapter is G_m, η_c=c dlog t and I(1,p;η_c)=c T; c=0 gives the zero form and value. The excluded point z=0 has N=0 and admits neither inverse nor logarithm; using all of affine space fails.
- For K=ℚ₃ and L=K(α), α²=2, the basis (1,α) gives R={x²−2y²≠0}. With c=1/(2α), η_c=(x dy−y dx)/(x²−2y²); f=t−α, represented by (t,−1), pulls it back to dt/(t²−2). Exchanging the basis to (α,1) gives norm y²−2x² and form (y dx−x dy)/(y²−2x²), the same objects after exchanging coordinates. Its integral between rational endpoints away from the poles is Tr(c log_univ((b−α)/(a−α))) in ℚ₃+ℚ₃ T. This tests the traced-logarithm uniqueness theorem; treating each geometric residue as a ℚ₃ scalar cannot construct it.
- For a compatible system of roots and K the closure of the union of ℚ_p(p^(1/p^m)) inside ℂ_p, the value group is not discrete. For L=K the unit group has no compact neighborhood: distinct principal units 1+p^(1/p^m) approach norm distance 1 from the identity and are eventually pairwise separated, and replacing these by 1+p^r p^(1/p^m) produces a separated sequence inside any prescribed neighborhood for sufficiently large r. Nevertheless every locally constant homomorphism from units to K+K T is zero by the residue and p-power argument, and the norm proof of the traced-logarithm uniqueness theorem remains valid for finite L/K. Neither a compact unit group nor a finite quotient L×/(O_L×K×) is used.
- For transcendental t∈ℂ_p, the curve E_t of §4.0 has transcendental j and no finite p-adic field model. For a nonzero invariant differential ω and sufficiently small v with ω(v)≠0, I(O,`exp_{E_t}`(v);ω)=ω(v) and its T coefficient is zero. The ℂ_p integration theory therefore exceeds point extension of finite p-adic field varieties.
- Let K be the closure of `Qp^nr` in ℂ_p and choose α∈K outside `Qp^nr`. For U=A¹_K and ω=αdt, I(0,1;ω)=α∈K; on G_m,K, I(1,p;dlog t)=T. Here H_K is inertia, its completed fixed field is K, and the residue field is 𝔽̄_p, so K is not locally compact. A finite p-adic field compactness argument cannot supply this case.
- For finite K/ℚ_p, the general integral on A¹ gives I(a,b;dt)=b−a and agrees with the earlier finite p-adic field construction. An invariant differential on any abelian variety defined over K gives the supplied abelian logarithm pairing; after inclusion into ℂ_p there is no factor [L:K].
- For K=ℂ_p the stabilizer is trivial and all affine coefficients are fixed; for K=ℚ_p they are exactly ℚ_p+ℚ_p T. If the closedness hypothesis is dropped and K=ℚ̄_p, its stabilizer is still trivial and its ℂ_p-fixed field is ℂ_p, not ℚ̄_p. Normalizing the zero primitive at a makes it zero; an arbitrary non-K scalar added to an unbased geometric primitive need not descend.

### 4.0d Natural principal-divisor reciprocity

For X/K smooth proper geometrically connected, a meromorphic ω, its natural primitive F from §4.0c and f∈K(X)× with divisor disjoint from the poles of ω, prove Σ_x B_x(F,log f)=0, summing over the singularities of the two primitives after splitting. Local germs are taken in smooth point parameters, not on entire component wide opens. Consequently the natural integral on (f) equals `sum_{x at a pole of omega}` Res_x(log f·ω), with log f analytic near those poles. The result uses no harmonic realization theorem. (besser2005, arXiv math/0301029v1, Proposition 3.4 and Lemmas 3.5–3.7, pp. 8–9, besser2005 lines 355–380; application in besser-zerbes2017 §2, p. 4, lines 151–167; natural integration from colmez1998 Theorem II.1.4).

Assume p any prime; finite K/ℚ_p; X smooth proper geometrically connected; ω meromorphic; f nonzero rational and div(f) disjoint from poles of ω; First take a finite extension splitting the finite supports; local logarithm branches and F are compatible.

- The principal-divisor natural integral equals the residue expression, with F in the first local-index slot.

- Changing F by a global scalar changes the total by that scalar times the degree of div(f), hence zero.

- For a finite surjective morphism h:X→Y of smooth proper geometrically connected curves over a finite p-adic field or ℂ_p, with one branch, let B_C^nat denote, for C=X or Y, the sum of local indices of the natural primitives of two meromorphic forms on C after splitting singularities. For meromorphic α,β on Y, prove B_X^nat(h*α,h*β)=deg(h) B_Y^nat(α,β), with local ramification multiplicities included (besser2005 Lemma 3.6, line 365).

- For the same h, meromorphic α on Y and β on X, the separable differential trace satisfies B_X^nat(h*α,β)=B_Y^nat(α,Tr_h β). Define Tr_h on rational differential germs through the finite separable function-field trace. In a Galois closure, h*Tr_h β is the sum of conjugate pullbacks; natural primitive sums have the same differential and rigidification modulo constants (besser2005 Lemma 3.7, line 369).

- On ℙ¹ over an algebraically closed p-adic coefficient field, B^nat(dlog t,dlog(t−a))=0 for every a, and B^nat(dg,dlog t)=0 for rational g. The first is a direct computation at 0,a,∞, with a=0 handled by alternation; the second is the proper residue theorem (besser2005 Lemma 3.5, line 358, and Proposition 3.4 proof, line 376).

First define the global natural double-index sum using §4.0c and prove finite-map degree scaling from the local ramification law of §2.3. Define the differential trace for the finite separable function-field extension. In a Galois closure, naturality makes the primitive of the trace the sum of conjugate primitives modulo a scalar; global residue cancellation removes that scalar. Divide the degree formula by the nonzero covering degree to obtain the projection formula. For nonconstant f the induced map X→ℙ¹ is finite and projection reduces B_X^nat(ω,dlog f) to B_ℙ¹^nat(Tr_f ω,dlog t). Over the algebraically closed coefficient field, partial fractions split Tr_f ω into an exact rational differential and scalar logarithmic derivatives. Compute the logarithmic pair at 0,a,∞; the exact term vanishes by the residue theorem. Use the ℂ_p integration theory and geometric primitive descent of §4.0c; for finite K this agrees with the early primitive compatibility in §4.0b. Constant f is handled separately. Finally, at div(f) the local term is ord_x(f)F(x), while at poles of ω it is −Res_x(log f·ω). This yields the separated-support formula before harmonic realization.

*Needs:* §2.2, §2.0, §4.0c, §2.3, AlgebraicCurves Layer 9 (proper residue theorem).

**Checks.**

- For f a nonzero constant both the divisor term and the reciprocity sum vanish.
- On P¹ with ω=dt and f=(t−a)/(t−b), the divisor integral is a−b; at infinity Res(log f·dt)=a−b and its local index contribution is b−a.
- For f=0 log f is undefined. If a pole of ω meets div(f), the displayed separated-support formula is not asserted.
- For h:ℙ¹_t→ℙ¹_z, z=t², pulling back dlog z gives 2dlog t: its local index with 1 at t=0 is 2. The global degree law includes this ramification multiplicity; the identity has degree 1, while a constant map cannot be used for the projection step.

### 4.0e Jacobian differentials and point topology

For X/K smooth proper geometrically connected with a chosen b∈X(K), identify holomorphic curve forms with pullbacks of invariant differentials on J=Jac(X) and prove I_univ(a,c;ω)=ω_J(abelianLog([c−a])). Prove J(K) is compact. The subgroup H generated by differences of K-rational points is open and compact: the differential of an Abel–Jacobi sum X^g→J is surjective at a suitable tuple of K-points. An additive locally constant map H→K is therefore zero. Prove moving of divisors away from a fixed finite pole set for the divisor-class argument. When X has no K-point, apply these assertions after a finite extension containing a temporary point; do not manufacture an unpointed Abel–Jacobi morphism. (colmez1998, Lemma II.1.13 and Remark II.1.18, pp. 78–79, colmez1998 lines 3147–3159 and 3213–3214; besser-zerbes2017 §2, pp. 3–4, lines 142–150).

Assume K/ℚ_p finite, p any prime; X smooth proper geometrically connected; A temporary K-rational base point for the pointed assertions; holomorphic ω for the logarithm identity; The vanishing assertion requires an additive locally constant map on the compact subgroup H, not on an arbitrary noncompact group.

- Natural integration of holomorphic forms is evaluation of the supplied abelian logarithm on the degree-zero Abel–Jacobi class.

- J(K) and its open subgroup H are compact, and additive locally constant H→K maps vanish.

- Divisor representatives can be moved away from the pole set; local sections of Abel–Jacobi sums make a divisor functional with zero derivative locally constant on H.

Construct this subsection’s Abel–Jacobi differential identification from the Jacobian tangent comparison and curve duality, then apply §4.0c naturality, comparing invariant forms with §4.0a and the supplied abelian logarithm. Properness over a locally compact field gives compact rational points. Nonzero holomorphic forms cannot vanish at every point of a residue disc, so choose g evaluation points giving an invertible differential matrix; the analytic inverse theorem makes H open. A locally constant homomorphism from compact H has finite image, which is zero in characteristic zero. Moving and these local sections supply the divisor-topology bridge used in §4.2.

*Needs:* §4.0c, JacobianChallenge Layer B (curve duality) and Layers D–F, AnabelianGeometryAndNonabelianChabauty §5.8 abelianLog.add, abelianLog.derivative, abelianLog.unique, abelianLog.baseChange.

**Checks.**

- For P¹, J and H are trivial and every holomorphic integral is zero.
- For an elliptic curve with split multiplicative reduction, J(K) remains compact; good reduction is unnecessary.
- The valuation K×→K is locally constant and additive but nonzero. Its source is noncompact, so it cannot justify vanishing on general groups.

### 4.1 Rational logarithms and graph residues

In a split regular semistable model, if f is a nonzero rational function whose divisor has support away from all connecting annuli, then Res_e(dlog f)=ord_head(f)−ord_tail(f)=−d(ord)(e), where ord_v is the multiplicity of the vertical component in div(f). Thus the residue cochain of dlog f is exact. The functions f and log_λ f are global component primitives of df and dlog f respectively, so both have zero harmonic jumps wherever defined. (besser-zerbes2017, Lemma 2.1 and proof, p. 5, besser-zerbes2017 line 218; exact/log primitives in §2, line 135).

Use the hypotheses of §3.2; f≠0 and has neither zero nor pole on a connecting annulus; At a node xy=π, tail=(y), head=(x), Res_e(dx/x)=1.

- For harmonic c, Σ_e c(e)Res_e(dlog f)=0 at unit lengths; in a metric realization use the associated weighted exact cochain.

The local node computation determines the order sign; factor f by its two vertical powers. The remaining unit has zero annular logarithmic residue by the no-zero/no-pole hypothesis and the annular residue theorem. Global f and log f have matching restrictions, proving zero jumps.

*Needs:* §1.1, §3.2, §2.0, ColemanIntegration L0.11–L0.12, §4.0c.

**Checks.**

- For xy=π, tail=(y), head=(x), f=x gives ord_tail=0,ord_head=1 and Res_e(dlog x)=1=−d(ord)(e). Identifying the residue with +d(ord) under this differential convention gives the wrong sign.
- A nonzero constant f has zero residue and zero jumps; f=0 is excluded from dlog.
- For a rational f on a proper curve, ∫df=f plus a constant and ∫dlog f=log f plus a constant on every component; no new cycle class is created.

### 4.2 Identification on smooth residue domains

Let F be a primitive from the natural single-integration theory of §4.0c for a meromorphic ω on a smooth proper geometrically connected X/K. In the split regular semistable realization of §3.2, its values away from poles on residue domains of smooth special-fibre points agree, modulo one common constant, with the normalized component Coleman primitives. This comparison holds for every prime and every genus. Loops and parallel edges are retained through their flags or a compatible subdivision. (besser-zerbes2017, Theorem 1.1, p. 2, besser-zerbes2017 line 88; §2, pp. 3–5, line 130; all-prime integration supplied by colmez1998 Theorem II.1.4).

Assume K/ℚ_p finite, p any prime, with a fixed branch; ω meromorphic; every evaluated point lies outside its poles; A split regular semistable realization with separated supports is chosen for the comparison.

- For a split degree-zero divisor D disjoint from the poles, Σ n_P F(P)=Σ n_P F_v(P), with P in its smooth residue domain.

- For a smooth proper model this is the base Coleman single-integral comparison.

For principal D=(f), compare the natural reciprocity of §4.0d with §3.3 for the harmonic family; no Coleman restriction of the natural primitive is assumed. §3.1a kills the component pairings, and §4.1 with harmonic-exact orthogonality kills the correction. Thus the difference of the two split divisor evaluations factors through the subgroup H generated by K-rational point differences in the Jacobian. Its derivative is zero on smooth residue domains. The moving and local-section theorem of §4.0e makes it locally constant on H; compactness of H gives finite image, hence zero in the torsion-free additive field. This proves smooth-residue comparison. Annular values are proved separately in §4.3.

*Needs:* §3.4, §4.1, §4.0c, §3.1, §3.1a, JacobianChallenge Layers D–F, §4.0e, AnabelianGeometryAndNonabelianChabauty §5.8, §4.0d.

**Checks.**

- On a tree every harmonic jump is zero; with a single component the comparison is equality of Coleman primitives modulo one constant.
- On a cycle the harmonic cochain may be nonzero, so analytic equality of primitives on connecting overlaps is not a conclusion.
- For df and dlog f the identification follows from their global primitives. This includes p=2 through §4.0c, without invoking all-prime iterated transport.
- For q=p³ and log(p)=1 on the Tate curve, F(z)=log(z)−ν_p(z). On 0<ν_p(z)<1 its differences from the same Coleman primitive log(z) at valuations 1/3 and 2/3 are −1/3 and −2/3. Whole-component-wide-open comparison by one constant is false.

### 4.3 The valuation term and its sign

For the oriented node xy=π with tail component (y), head component (x), set t=ν_π(x), so the tail has t=0 and the head t=1. If c=F_head−F_tail is the normalized jump, then on algebraic points of the connecting annulus the single-integral primitive equals F_tail+c t, after the same global constant is fixed. In a metric segment of length ℓ, use the relative affine coordinate t/ℓ. With y=π/x the reverse expression is F_head−c ν_π(y), giving the same value. (besser-zerbes2017, Corollary 1.2, p. 3, besser-zerbes2017 line 108).

Use the hypotheses of §4.2; ν_π(π)=1 and endpoints avoid poles; Points may be rational over any finite extension; their branches extend the chosen one.

- F_tail+c t=F_head−c(1−t).

- Under ramification m, the new component constants interpolate with increments c/m; the old ν_π equals ν_ϖ/m.

Choose a finite ramified extension in which the point reduces to a newly inserted component. Theorem §4.2 and harmonicity at its degree-two vertices force the constants given by §1.3. The new component lies at rational position t, giving the formula. Finite-extension compatibility identifies it with the original single integral.

*Needs:* §1.3, §4.2, §4.0c.

**Checks.**

- With F_tail=2,c=6,t=1/3, the value is 4; the reverse expression is 8−6·(2/3)=4.
- If c=0 the formula is the Coleman function; t=0 and t=1 give the two boundary values by continuation to the adjacent smooth residue domains.
- For c=6, a quadratic ramified refinement has two jumps 3,3. Assigning 6 to each new edge gives total 12 and violates the formula.
- For q=p³, log(p)=1 and valuations 1/3,2/3 in the first connecting annulus, the valuation corrections are −1/3,−2/3. A constant correction on that annulus is wrong.

### 4.4 The Vologodsky point-sum

In the split setup, for meromorphic ω,η regular on X−Z and single-integral primitives F,G, `sum_{x in Z}` B_x(F,G)=B_h([ω],[η]). The sum is independent of the two global constants and descends to H¹_dR(X−Z). It extends the ordered proper cup product and has the Frobenius/monodromy compatibilities of §3.5. The nonsplit formulation is the residue-field trace construction of §7.5; its validity is not a rational-pole hypothesis on the final theorem. (besser2017, Corollary 5.3, p. 16, besser2017 line 807; Proposition 3.5, p. 10, line 449).

Assume X/K and branch as in §4.2; Z finite reduced and contains all poles; For this split formula points of Z are rational and separated in the chosen realization.

- If ω=df with f rational regular off Z, the point-sum is zero for every η regular off Z.

- Adding A to F changes the sum by AΣ_x Res_x η=0, and similarly in the other slot.

Near a pole in a smooth residue domain, §4.2 identifies the single-integral germ with its component Coleman germ up to the common constants. §3.3 and §3.4 give the equality; global residue cancellation handles constants. Import the class-level and operator properties from §§3.4–3.5.

*Needs:* §3.3, §3.4, §3.5, §4.2.

**Checks.**

- For Z empty the point-sum on global regular forms is zero, compatible with the isotropic holomorphic subspace. Proper cohomology is handled through §3.4, not this representation.
- For second-kind representatives α,β the sum is α∪β, with primitive of α placed first.
- Omitting the jump-residue term from §3.3 need not reproduce this point-sum on a graph with cycles.

### Examples

Exact and logarithmic differentials have zero jumps; a Tate curve has a nonzero harmonic cycle jump.

### Dependencies

Layers 1–3; the geometric logarithm, closed-field natural integration and reciprocity of §§4.0–4.0d; PadicPeriodRings §§1.1–1.2 for the continuous Galois action and fixed-closure theorem; JacobianChallenge Layers D–F and the finite p-adic field abelian logarithm of AnabelianGeometryAndNonabelianChabauty §5.8 via §4.0e. Compactness and semistable-model comparisons retain finite K/ℚ_p. No height or regulator theorem is used.

## Layer 5: Auxiliary primitives and the local triple index

### 5.1 Compatible labelled auxiliary primitives

For three labelled functions F,G,H in A_log,1, define TripleIndexData to consist of primitives `I(R dS)` in A_log for every labelled pair, with `dI(R dS)`=R dS and `I(R dS)`+`I(S dR)`=RS. On the diagonal set `I(R dR)`=R²/2. Distinct labels retain their choices even when their functions happen to coincide. Such data exist. Choices for each unordered off-diagonal pair form a torsor under k, acting by `I(R dS)`↦`I(R dS)`+C and `I(S dR)`↦`I(S dR)`−C. Data may be permuted, pulled back and combined linearly with their functions; no arbitrary primitive choices are silently identified. (besser-dejeu2012, §7, equation (7.2) and the data before Proposition 7.3, pp. 355–356, besser-dejeu2012 line 2232 and line 2251).

Use a characteristic-zero field k and the formal ring of §2.1, or its analytic open-annulus version; All differential and product equations are imposed on the actual functions; In the analytic case all functions and primitives share a domain of convergence.

- Choose a primitive for one direction of each unordered pair and set the reverse to RS−I; use R²/2 on the diagonal.

- Equality is equality of the three functions and their labelled primitive entries.

- The indicated opposite shifts preserve all derivative and integration-by-parts equations; any two choices are related by unique pair constants.

- Differential-compatible annular or formal substitutions pull back every entry, preserving products and pair equations.

- Mixed-pair auxiliary primitives for a linear combination are the same linear combination of the original mixed entries; reverse entries satisfy integration by parts, and a new diagonal entry is recomputed as R²/2.

On the imported analytic AnnulusLogRing use exists_logLaurent_primitive and logLaurent_derivative_eq_zero_iff; on the general-coefficient extension use §2.1a. Only the formal case uses the integration-by-parts induction in k((z))[L], dividing by n+1 or j+1 as appropriate. Choose one entry per unordered labelled pair and define the reverse as RS−I; set the diagonal to R²/2. The constant kernel gives the torsor law. These are new compatible choice data, not another construction of the analytic primitive theorem.

*Needs:* §2.1, §2.1a, ColemanIntegration L0.22 exists_logLaurent_primitive, logLaurent_derivative_eq_zero_iff.

**Checks.**

- For all three functions equal to L and all auxiliary integrals L²/2, d(L²/2)=L dz/z and each pair sums to L².
- For all functions zero, choosing all auxiliary integrals zero is valid; independent opposite constants on off-diagonal pairs are also valid.
- If G=0,H=L, the choices `I(G dH)`=1,`I(H dG)`=0 fail because their sum is 1 rather than GH=0. The compatible pair is (1,−1).

### 5.2 Existence and characterization of the local index

For compatible TripleIndexData define T_e(F,G;H) as the unique scalar operation that is trilinear under the compatible linear combinations of §5.1, symmetric in F,G, satisfies T(F,G;H)+T(F,H;G)+T(G,H;F)=0 with the same permuted auxiliary entries, and equals B_e(F,`I(G dH)`) when G has no logarithmic term. Existence and uniqueness hold in the formal and analytic annular settings. T is an operation on the full auxiliary data, not a trilinear map on three bare functions. (besser-dejeu2012, Proposition 7.3, Lemma 7.5 and equation (7.6), pp. 356–359, besser-dejeu2012 line 2277 and line 2327).

Assume Hypotheses and actual primitive equations of §5.1; The analytic-first reduction uses Res(dG)=0.

- Any scalar operation on the same data satisfying the four stated laws equals T.

- T(F,G;H)=T(G,F;H) with the natural permutation of primitive entries.

- The three cyclic placements of the distinguished third slot sum to zero with common auxiliary data.

- If F,G have no logarithmic term then T(F,G;H)=Res_e(FG dH).

Expand each function into Laurent part plus scalar L. If one slot is Laurent, the reduction, symmetry and three-term identity determine the value; integration by parts proves consistency on intersections of those cases. For three L slots choose all half squares, making the value zero. Extend by compatible trilinearity and derive the conditional choice-change formulas from these axioms and use them to compare arbitrary primitive choices; §5.3 exports those formulas after existence.

*Needs:* §2.2, §5.1.

**Checks.**

- T(1,1;L)=1 and T(z,z;z⁻²)=−2 by the Laurent-first rule. These computed values detect the order of the differentiated third slot; the three-term identity uses one common labelled primitive data set.
- With F=G=H=L and all I=L²/2, T=0, since three equal summands give 3T=0. This holds over ℚ₃ because 3 is nonzero.
- For Laurent F=z,G=z⁻¹,H=L, T=Res(dz/z)=1; an index that always vanishes on rational-function slots fails.

### 5.3 The actual choice laws

Increasing `I(G dH)` by C and decreasing `I(H dG)` by C changes T(F,G;H) by −C Res_e(dF). Changing the F,H pair similarly changes it by −C Res_e(dG). It is independent of the F,G pair. Simultaneous pair changes add these effects. In particular zero in a function slot does not force the local value to vanish when its associated auxiliary data are not the compatible zero data. (besser-dejeu2012, Lemma 7.4, p. 357, besser-dejeu2012 line 2299).

Assume TripleIndexData as in §5.1; C∈k; the opposite primitive is shifted by −C; Functions and all other primitive entries are fixed.

- Changing the G,H pair by C and the F,H pair by D changes the value by −C Res(dF)−D Res(dG).

Use the reduction rule on the added data (F,0;H), where `I(0 dH)`=C. Then T(F,0;H)=B(F,C)=−C Res(dF). Symmetry gives the other law, and changing the unused F,G pair has no effect in the generating cases, hence in general.

*Needs:* §5.2.

**Checks.**

- For F=L,G=0,H=L with the G,H pair (1,−1), T=−1; the all-zero G,H primitive pair gives 0.
- If Res(dF)=0 the G,H constant change has no effect. Changing only the F,G pair never changes T.
- For Res(dF)=1 and C=2, the change is −2. The local index cannot be exported as independent of auxiliary primitives.

### 5.4 A local normalization formula

In the formal case assume dF,dG,dH have at most simple poles at z=0. Write c_z for the constant coefficient of the L⁰ Laurent coefficient in A_log. Then T(F,G;H)=c_z(F)c_z(G)Res(dH)−Res(dF)c_z(`I(G dH)`)−Res(dG)c_z(`I(F dH)`). The coefficient c_z is parameter dependent; the whole expression, with all functions and primitive data transported, is parameter independent. (besser-dejeu2012, Definition 7.7 and Proposition 7.8, pp. 359–360, besser-dejeu2012 line 2413 and line 2430).

Assume k a characteristic-zero field; TripleIndexData of §5.1; dF,dG,dH have no poles of order greater than one at the formal origin.

- If the two relevant primitive constant terms are zero, the value is c_z(F)c_z(G)Res(dH).

First normalize the two relevant primitives to constant term zero. By trilinearity reduce to analytic power series and L. The residue characterization gives the displayed product in these generating cases. Apply §5.3 to restore arbitrary primitive constants.

*Needs:* §5.3.

**Checks.**

- For F=2+L,G=3,H=L and `I(G dH)`=3L, `I(F dH)`=2L+L²/2, the value is 6.
- For three L functions and all half-square primitives every constant term is zero, hence T=0.
- Over an analytic coefficient field with its fixed branch, under u=az one has c_u(log z)=−log a while c_z(log z)=0. Formally the same value is −δ for the chosen logarithmic lift δ. A formula asserting constant-term invariance alone is false.

### 5.5 Orientation, parameter and degree laws

Orientation reversal negates the triple index with fixed functions and auxiliary data. For an orientation-preserving finite map φ:e′→e of annuli of degree n≥1, or a formal substitution of positive order n, T_e′(φ*F,φ*G;φ*H)=n T_e(F,G;H), provided every auxiliary primitive is pulled back. In particular parameter isomorphisms preserve T. Restrictions of ends and scalar embeddings also preserve the index on transported data. (besser-dejeu2012, §8 parameter independence and Lemma 8.1, p. 361, besser-dejeu2012 line 2524; orientation/scalar consequences of the characterization).

Use the hypotheses of §5.1; φ finite with positive degree and compatible orientations; All functions, branches and primitive entries are transported together.

- Degrees multiply under composable pullbacks and scalar embeddings commute with the degree law.

Compose the index with pullback and divide by the nonzero scalar n. The residue degree law of §2.3 and uniqueness of §5.2 recover the original index; reversal and scalar extension use the same characterization. Restricting Laurent expansions to a common annulus preserves every term.

*Needs:* §2.3, §5.2, §5.3.

**Checks.**

- z=t² sends (1,1;log z) with its primitives to (1,1;2log t), and T changes from 1 to 2.
- An orientation-preserving identity has degree 1; reversal sends the same value 1 to −1.
- Pulling back F,G,H but replacing `I(G dH)` by its pullback plus 1 changes T by −Res(dφ*F). Function pullback alone does not imply the degree formula.

### Examples

The triple (1,1;log z) has value 1. The triple (log z,0;log z) with a nonzero auxiliary constant has value −1.

### Dependencies

Layer 2, characteristic-zero polynomial-logarithm calculus and the base annular residue laws. Global integration and semistable models are not prerequisites for the formal theory.

## Layer 6: Wide-open triple sums and Coleman one-form pairings

### 6.0 Relations among actual Coleman forms

Let A_col,1(U) be the actual Coleman functions with analytic differential in §3.0b, and let Ω¹_col,1(U) be the submodule of actual Coleman forms generated by Gη with G∈A_col,1(U), η analytic. Construct the well-defined symbol map Ω¹_col,1(U)→H¹_dR(U)⊗Ω¹(U), Gη↦[dG]⊗η. For the product presentation m:A_col,1(U)⊗Ω¹(U)→Ω¹_col,1(U), prove ker(m) is contained in the image of A(U)⊗Ω¹(U). Thus equal actual forms have equal symbols. This is a theorem about the actual connection/word realization, not a defining relation imposed on a free module. (besser-dejeu2012, Lemma 9.1 and Proposition 9.2 proof, p. 364, besser-dejeu2012 lines 2769–2789).

Assume U geometrically connected Coleman wide open with finite ends; coefficients ℂ_p or K-defined data as in §3.0b; All tensors are over the coefficient field; η is analytic; The function/form products and equalities are those of the constructed full Coleman algebra.

- Every tensor relation among actual products lies in the analytic-function tensors.

- The symbol map respects admissible restriction and finite scalar extension.

Use the analytic-differential/depth-one part of the full Coleman connection realization. Differentiate a relation Σ_i G_iη_i=0 in its coefficient word expansion; independence of the degree-one de Rham letters gives Σ_i[dG_i]⊗η_i=0. Since G↦[dG] has kernel A(U), exactness of tensoring over a field gives the kernel containment. This supplies the additional relation theorem before the index pairing descends in §6.4.

*Needs:* §3.0b, §3.1a.

**Checks.**

- For analytic g, [dg]=0, so gη has symbol zero.
- If [dG]⊗η≠0, then Gη cannot be the zero actual form. A freely declared zero product would contradict the connection realization.
- The actual zero form G dC has symbol zero for scalar C. Linearity in a free symbol presentation alone does not prove the kernel containment.

### 6.1 The global end-sum

For a connected Coleman wide open U and global Coleman functions F,G,H with analytic differentials, choose all `I(R dS)` as global Coleman primitives with `I(R dS)`+`I(S dR)`=RS, and define T_U(F,G;H)=`sum_{e in End(U)}`T_e(F,G;H). Restrictions of these global choices, rather than unrelated local choices at each end, are part of the construction. Over a finite extension K/ℚ_p use functions and auxiliary data defined over K or scalar extension with descent as in §7.6; over ℂ_p take the same end-sum. (besser-dejeu2012, §8 global construction and Lemma 8.2, p. 361, besser-dejeu2012 line 2533).

Assume U connected and a Coleman wide open with finitely many ends; F,G,H global Coleman functions with dF,dG,dH analytic on U; A common branch and global compatible Coleman auxiliary primitives; Over K the wide open is geometrically connected with Coleman constant field K; a larger finite constant field is treated over that field and then by trace; The construction is first made after splitting the finite family of ends over the coefficient field; nonsplit ends are traced by §7.5 and descended by §7.6.

- The global value is the finite end-sum of local indices using the restrictions of any global compatible primitive family.

- Global Coleman integration supplies a primitive of each Coleman form R dS; integration by parts supplies the opposite primitive.

Use the global Coleman algebra and integration of its one-forms to construct the pair primitives, then restrict to ends and apply §5.2. Finite end sets make the sum algebraic. Auxiliary-choice independence is proved in §6.2 rather than encoded as an assumed field of the data.

*Needs:* §3.1, §5.2, §3.0b, §3.1a.

**Checks.**

- The zero triple with all global auxiliary primitives zero has value 0; global auxiliary changes still give 0 by residue cancellation.
- On a rational wide open T_U(F,1;H)=B_U(F,H)=0, although individual end indices can be nonzero.
- On a positive-genus wide open with B_U(F,H)=1, T_U(F,1;H)=1. A construction factoring through [dG] would give 0 since d1=0.

### 6.2 Choice cancellation, constants and shrinking

The end-sum of §6.1 is independent of the global auxiliary primitives, is k-trilinear in the actual functions, is symmetric in the first two slots and satisfies the three-term identity. For a scalar C, T_U(F,C;H)=C B_U(F,H) and T_U(F,G;C)=0. Hence replacing G by G+C changes the value by C B_U(F,H). It is preserved on common smaller end annuli and on deleting discs across which all three functions and their global auxiliary data extend as Coleman data with analytic differentials. A restriction theorem carries that extension hypothesis; it does not allow arbitrary singular excisions. (besser-dejeu2012, Lemmas 8.2–8.3, pp. 361–362, besser-dejeu2012 line 2546; introduction p. 310, line 250, for shrinking).

- Equal global Coleman functions give equal values independently of the chosen global compatible auxiliary primitives, by the global triple-index laws of §6.2; functions are not replaced by their differential classes.

Use the hypotheses of §6.1; Auxiliary changes are global constants on connected U; Shrinking preserves the core, or has the stated extension across added discs.

- T_U(F,G+C;H)−T_U(F,G;H)=C B_U(F,H).

- T_U(F,G;C)=0 for any constant C.

- Compatible repeated shrinking gives the same value, including any finite chain of common end restrictions.

Sum §5.3 and use the residue theorem for the analytic one-form dF. This gives auxiliary independence and ordinary trilinearity. Reduction with G=C gives C B_U(F,H); the three-term identity and alternation of B_U give zero in the third slot. Restriction uses §5.5; an added filled disc has total zero index from analytic local primitives and the residue theorem.

*Needs:* §5.3, §5.5, §6.1, §3.1, §3.1a.

**Checks.**

- For B_U(F,H)=1, adding 2 to G adds 2 to T_U; it is not a pairing of three differential classes.
- A global shift C in `I(G dH)` changes the sum by −CΣ_e Res_e(dF)=0, even if individual residues are nonzero.
- On an annular rational wide open with end residues +1 and −1, changing the auxiliary primitive only at the first end by 1 changes the sum by −1. Local choices do not cancel without global compatibility.

### 6.3 The q-eigenspace vanishing theorem

Let U be a Coleman wide open defined over a finite K/ℚ_p with a degree-q Frobenius lift in the supplied rigid-cohomology sense, q=(#κ_K)^r for integer r≥1 and identity coefficient lift. If φ*[dF]=q[dF] and φ*[dG]=q[dG] in H¹_dR(U), then T_U(F,G;H)=0 for every global Coleman H with analytic differential. The assertion also includes zero classes. It uses the supplied spectrum theorem excluding 1/q from Frobenius on H¹_dR(U), and the fact that the q-eigenspace is in the radical of B_U. (besser-dejeu2012, Proposition 8.4 and proof, p. 362, besser-dejeu2012 line 2591).

Use the hypotheses of §6.1; U and data descend to a finite p-adic field; A compatible degree-q Frobenius lift with q=(#κ_K)^r, integer r≥1 and identity coefficient lift, as in §3.0c; Both stated q-eigenclass equations; §3.1a supplies the spectrum and double-pairing radical properties.

- For a≥1, use φ^a, degree q^a=`(#kappa_K)^(r*a)` and both corresponding q^a-eigenclass hypotheses. Under finite L/K of residue degree f the geometric operator is φ^f⊗1 with degree q^f, using §3.0c; q-eigenclasses extend to q^f-eigenclasses for it. A mere scalar extension of φ is not automatically that geometric operator.

Write φ*F=qF+r and φ*G=qG+s with analytic r,s, absorbing global constants into r,s. If a slot is analytic, reduce the triple index to the double pairing and use the q-radical property to kill its value when paired with the other q-eigenclass; the three-term identity handles an analytic third slot. Thus the functional H↦T_U(F,G;H) factors through [dH]. The degree law gives qT=q²T(F,G;φ*H), so its functional has reciprocal eigenvalue 1/q. The spectrum exclusion forces it to vanish.

*Needs:* §5.5, §6.2, §3.0c, §3.0b, §3.1a.

**Checks.**

- F=0 satisfies the eigenclass condition and gives zero; p=2 and q=2 are admitted over ℚ₂. Over its unramified quadratic extension the identity-coefficient lift instead uses q=4; q=2 fails the residue condition.
- A general F with B_U(F,H)=1 and G=1 gives T_U=1. The theorem cannot drop the q-eigenclass hypothesis on F.
- The proof produces L(φ*γ)=q⁻¹L(γ). At q=2 this is eigenvalue 1/2, not 2 or 1; the excluded reciprocal is essential.

### 6.4 A pairing on actual Coleman one-forms

Let Ω¹_col,1(U) be the submodule of actual Coleman one-forms generated by G dH for global Coleman G,H with analytic differentials, using the actual Coleman algebra of §3.0b and its multiplication relations. There is a unique k-bilinear pairing P_U:A_col,1(U)×Ω¹_col,1(U)→k with P_U(F,G dH)=T_U(F,G;H). In particular P_U(F,dH)=B_U(F,H). The pairing respects equalities of actual Coleman forms, not only chosen expressions as sums of symbols. (besser-dejeu2012, Lemma 9.1 and Proposition 9.2, p. 364, besser-dejeu2012 line 2769 and line 2776).

Use the hypotheses of §6.1; Use the actual Coleman one-form module of §3.0b and symbol/relation theorem of §6.0; No free module on unrelated formal symbols replaces the Coleman form module.

- The values on generators G dH uniquely determine the bilinear pairing.

- If Σ_i G_i dH_i=0 as a Coleman one-form, then Σ_i T_U(F,G_i;H_i)=0 for every F.

- Compatible restriction of the functions and actual forms to a smaller wide open preserves P_U.

By §6.2 the generator formula depends on dH, not its primitive constant. §6.0 gives the map Ω¹_col,1→H¹_dR(U)⊗Ω¹(U), G dH↦[dG]⊗dH, and says the kernel of the product presentation is generated inside analytic-function tensors. On those tensors the double-index reduction depends only on the actual product form. Therefore the generator prescription kills all relations and descends; generators prove uniqueness.

*Needs:* §6.2, §6.0.

**Checks.**

- P_U(F,1·dH)=B_U(F,H); for B_U(F,H)=1 this gives 1.
- P_U(F,G dC)=0 for a constant C, as the one-form is zero.
- G dH+H dG=d(GH) is one and the same actual form when GH is a Coleman function. Where it lies in the stated module, the two presentations give the same pairing; bilinearity on a free symbol module alone would not prove this.

### Examples

A local auxiliary change survives at an end, while a global change cancels by the residue theorem. Constants in the first two slots can survive globally.

### Dependencies

Layers 2–3 and 5; full analytic Coleman algebra §3.0b, wide-open Frobenius theorem §3.1a and actual-form relation theorem §6.0.

## Layer 7: Branch transport, traces and arbitrary-reduction descent

### 7.0 Tate invariant differential and annular charts

For q∈K× with n=ν_π(q)>0, let u_q:K×/q^ℤ→E_q(K) be the supplied point uniformization. Prove its covering map K×→E_q(K) is locally analytic. Normalize the invariant differential ω_q on E_q by the standard Tate Weierstrass model and prove u_q*ω_q=dz/z. Compare the valuation strips v−1<ν_π(z)<v+1 and connecting annuli v<ν_π(z)<v+1 with the component and annular charts of the regular Tate model. The q-identification gives the final edge. For n=1,2 use loop/parallel-edge charts or a regular subdivision; maps respect coefficient extensions and orientation. This adds differential and chart comparisons to the point theorem, without reconstructing that theorem. (besser-zerbes2017, §3, pp. 5–6, besser-zerbes2017 lines 245–270; differential pullback also colmez1998 Remark 2(iii), p. 2, lines 237–244).

Assume Finite K/ℚ_p, any prime p; π a uniformizer; q≠0, n=ν_π(q)>0; The invariant differential is normalized by the Tate Weierstrass model; Algebraic points and charts over finite extensions use compatible valuation scales.

- The normalized invariant differential pulls back to dz/z; q multiplication preserves that differential.

- Valuation-strip charts identify the component/end restrictions and the final gluing z↦z/q, also after a compatible regular subdivision.

Differentiate the convergent Tate coordinate functions of the supplied uniformization to identify the invariant differential, then compare reduction of those coordinates on the valuation strips. Use nodal charts and common refinements for n=1,2. This local analytic comparison proves no equality of natural and Coleman primitives on entire connecting annuli.

*Needs:* §3.0a, EllipticCurves Layer 4, RigidAnalyticGeometry §§6.2, 8.1, StableReduction Layers 0–1, 4–5.

**Checks.**

- For q=p³ the last gluing changes log z by −log q, while dlog(z/q)=dz/z.
- For n=1 and n=2 the graph has a loop or parallel edges; replacing it by a simple adjacency graph loses the period.
- q=1 has n=0 and is excluded. At p=2 all convergent Tate charts and the same differential normalization apply.

### 7.1 Specializing the universal branch

Write the universal single integral of §4.0c as I_univ(a,b;ω)=A+B T in K[T], with T=Log(p). For λ,λ′∈K, I_λ′−I_λ=(λ′−λ)B. For u∈K×, log_λ′(u)−log_λ(u)=(λ′−λ)v_p(u), where v_p(p)=1. For local double or triple indices, changing a branch transports the functions and every auxiliary primitive; the new value is computed by the same residue characterization and the change-of-constant laws. When F and G change by constants A₀,B₀ on a fixed end, ΔB=A₀ Res(dG)−B₀ Res(dF). A branch change with nonconstant valuation term on an annulus is not assumed to be such a constant shift. (colmez1998, Definition II.1.3 and Theorem II.1.4, p. 74, colmez1998 line 2986; §II.2.5, p. 97, line 3950; index transport from besser-dejeu2012 Lemma 7.4, line 2299).

Assume p prime, K a closed subfield of ℂ_p with its induced topology; Closed regular one-form on a smooth geometrically connected variety, endpoints outside poles; The universal affine-in-T integral is §4.0c; λ and λ′ belong to K; extensions use their images.

Represent an affine value A+B T by its coefficient pair (A,B)∈k×k; specialization at λ is A+Bλ. For every commutative ring k this is polynomial evaluation of C(A)+C(B)X. It evaluates to A at zero, preserves addition and commutes with coefficient ring homomorphisms, using `Polynomial.eval_C`, `Polynomial.eval_X`, `Polynomial.eval_add`, `Polynomial.eval_map` and `Polynomial.hom_eval₂`. Subtracting its values at λ′ and λ gives (λ′−λ)B by distributivity (colmez1998 Definition II.1.3, p. 74, colmez1998 line 2989).

- Transport from λ to λ″ is the composite of transport from λ to λ′ and λ′ to λ″, on the full functions and primitive data.

- For df the coefficient B is zero; for dlog f it is v_p(f(b)/f(a)).

Evaluate the affine polynomial at λ′ and λ and subtract. Apply the universal logarithm formula for the multiplicative case. For indices, transport formal/analytic logarithms and products and apply the local characterizations; when the transported changes are constants the explicit constant laws apply. No assertion that arbitrary index data are affine in T is made.

*Needs:* §4.0c, §2.2, §5.3, §6.2, ColemanIntegration L0.16 logBranch_sub, L0.23.

**Checks.**

- For u=p, branch change from 0 to 2 changes log(u) by 2; for a ramified uniformizer ϖ with v_p(ϖ)=1/e it changes it by 2/e.
- For λ′=λ or ω=0 the change is zero; for u∈O_K×, equivalently v_p(u)=0, the logarithm change is zero, as for u=1. The field unit p∈K× has v_p(p)=1 and changes by 2 when λ=0, λ′=2.
- B_e(F+A₀,G+B₀) need not equal B_e(F,G); F=0,G=L,A₀=1,B₀=0 changes it by 1. Index branch independence cannot be inferred from the derivative alone.

**Checks for affine specialization.**

- The affine value (0,1), representing the integral of dlog t from 1 to p, specializes at 0 and 2 to 0 and 2. Interchanging the subtraction order gives −2.
- The affine value (a,0), representing an exact-form endpoint difference, specializes to a for every branch; the zero pair specializes to zero.
- The affine value (0,1/2), representing the branch term at a ramified uniformizer with e=2, changes by 1 between branch parameters 0 and 2, whereas (0,1) changes by 2. This distinguishes v_p from the integer uniformizer valuation. For arbitrary (A,B) over any commutative ring, including the zero ring, specialization changes by (λ′−λ)B.

### 7.2 Holomorphic integration on a proper curve

For a smooth proper geometrically connected curve X/K, a holomorphic one-form ω and algebraic endpoints a,b, its single integral I_λ(a,b;ω) is independent of λ. After a finite extension containing a,b and a temporary basepoint, this is the abelian logarithm on Jac(X) paired with the invariant differential corresponding to ω. Descent eliminates the temporary basepoint; the statement does not require X(K) to be nonempty. (colmez1998, Lemma II.1.13 and Remark II.1.18, pp. 78–79, colmez1998 line 3147 and line 3213; curve illustration besser-zerbes2017 §3, line 245).

Assume K a closed subfield of ℂ_p with its induced topology, all primes; X smooth proper geometrically connected of dimension one; ω regular everywhere; λ,λ′∈K; endpoints in a finite extension L/K inside ℂ_p, with the induced complete topology.

- The T coefficient of the universal integral is zero for holomorphic forms on proper curves.

Base change X to ℂ_p and use §4.0b to identify its proper Albanese with its geometric pointed Jacobian. Pullback identifies holomorphic curve forms with invariant differentials. By §§4.0 and 4.0c their integral is the geometric abelian logarithm pairing, whose T coefficient is zero. The injective coefficient comparison of §4.0c descends this identity to L and removes the temporary basepoint. Section 4.0e identifies the finite p-adic specialization and its topology; compactness is not a premise of the closed-field assertion.

*Needs:* §7.1, §4.0, §4.0b, §4.0c, JacobianChallenge Layers D–F; §4.0e only for the finite p-adic specialization.

**Checks.**

- On ℙ¹ all holomorphic one-forms vanish and so do all their integrals.
- For an elliptic curve the value from the identity is the unique locally analytic group logarithm with differential ω, and is branch independent. In particular for the transcendental-j curve E_t/ℂ_p of §4.0 and small v, I(O,exp(v);ω)=ω(v) for every λ,λ′∈ℂ_p, with zero T coefficient; a finite-model-only assertion would omit it.
- On the nonproper curve G_m the form dz/z integrates from 1 to p to λ. Properness cannot be dropped.

### 7.3 Finite extension and coefficient trace

For a finite extension L/K of p-adic fields with compatible branches, base change sends I_K(a,b;ω) to I_L(a,b;ω_L). For an L-valued regular closed form ω on U_L and K-rational endpoints a,b, `Tr_{L/K}`(I_L(a,b;ω))=I_K(a,b;`Tr_{L/K}`ω), where the form trace uses Ω¹(U_L)=Ω¹(U)⊗_K L. Both identities hold coefficientwise for universal affine polynomials with T fixed. The constructions commute with field embeddings, Galois conjugation and towers. (colmez1998, Theorem II.1.4, p. 74, colmez1998 line 2996; Galois descent Remark 2(iv), pp. 2–3, line 246; trace consequence, not a quoted trace theorem. Compare vologodsky2001 Theorem B(4), line 195, only under p>2).

Assume U/K smooth geometrically connected finite-type algebraic variety; ω regular and closed on U_L; curves may use the complement of their poles; a,b∈U(K) for the trace formula; L/K finite; the branches are restrictions of one branch with parameter in K.

- `Tr_{M/K}`I_M=`Tr_{L/K}`(`Tr_{M/L}`I_M) in every finite tower M/L/K, with the same coefficient trace on forms.

- σ(I(a,b;ω))=I(σa,σb;σω), with σ fixing the universal T.

- After a finite Galois extension containing a point a, averaging the conjugates of P↦I(a,P;ω) gives a K-defined primitive torsor representative; any two such representatives differ by a K-constant.

Finite scalar extension of forms and K-linearity reduce the coefficient trace formula to ω=αη with η over K. Trace linearity and the base-change identity then prove it. Equivalently sum over embeddings in a normal closure using the pinned embedding formula and descend. The pinned tower theorem gives transitivity. Average over the finite Galois group, dividing by its nonzero order, to obtain a descended primitive; its constant ambiguity follows from the natural theory.

*Needs:* §4.0c, §7.1, Mathlib `Algebra.trace`, Mathlib `trace_eq_sum_embeddings`, Mathlib `Algebra.trace_trace`, Mathlib `Algebra.trace_algebraMap`.

**Checks.**

- If ω is defined over K and [L:K]=n, Tr(I_L(a,b;ω))=n I_K(a,b;ω), not I_K(a,b;ω).
- L=K is identity, and a=b gives zero. Every finite extension of p-adic fields is separable, including ramified quadratic extensions at p=2.
- Trace is not multiplicative: for α²=π in a quadratic extension, Tr(α)=0 but Tr(α²)=2π≠0. Do not trace each factor of an index separately.

### 7.4 Degree-zero divisors without a rational basepoint

For a smooth proper geometrically connected curve X/K, meromorphic ω, and a degree-zero K-divisor D=Σ_x n_x[x] disjoint from its poles, choose a finite Galois extension L splitting the support and containing a point a outside the poles. Define ∫_D ω=Σ_x n_x `sum_{sigma : kappa(x) -> L}` I_L(a,σx;ω). Its value is independent of a, L and the embeddings used to display the geometric support, belongs to K and is additive in D and K-linear in ω. Degree means Σ_x n_x[κ(x):K]=0. No K-rational basepoint is part of the exported object. (besser-zerbes2017, Degree-zero divisor evaluation and splitting argument, §2, p. 4, besser-zerbes2017 line 142; Galois consequence of colmez1998 Remark 2(iv), line 246).

Assume K/ℚ_p finite, any prime, fixed branch; X smooth proper geometrically connected curve; D integral divisor of degree zero; support disjoint from poles of ω; L is a finite Galois extension splitting the support and containing a permissible temporary point.

- For D=b−a with a,b rational, the value is I_K(a,b;ω).

- Equal divisors, evaluated as finite sums over closed points, give equal values; regrouping the support changes nothing.

- The evaluation is a homomorphism on divisors of degree zero disjoint from the pole support.

- Ordinary divisor pullback to a finite field extension preserves the value after scalar extension; closed points split with their usual multiplicities.

Chasles makes a basepoint change contribute deg(D)·I(a′,a;ω)=0. Scalar extension and a common finite Galois overfield compare any two splitting fields. Galois equivariance permutes the geometric points and changes the basepoint only, so the scalar is fixed and lies in K. Finite-sum linearity gives the API.

*Needs:* §7.3, §4.0c, StableReduction Layer 0.

**Checks.**

- For α²=π in a ramified quadratic extension, D=[t²−π]−2[0] on ℙ¹ and ω=t dt give ∫_D ω=π, since each geometric point contributes π/2. This works at p=2 as a field identity.
- D=0 gives zero even when X(K) is empty; changing the temporary basepoint contributes deg(D) times one integral, hence zero.
- A single quadratic closed point has degree 2, not 1. Subtracting one rational point does not make degree zero and the putative evaluation depends on the basepoint.

### 7.5 Closed-point indices and traced sums

For X/K smooth proper geometrically connected and a finite reduced Z, use K-defined primitive representatives from §7.3 for ω,η regular off Z. At a closed point x the formal germs lie over κ(x); define its double contribution as `Tr_{kappa(x)/K}` B_x(F,G), and sum over Z. This sum is independent of the two global primitive constants and extends the corrected pairing to nonsplit poles. For triple-index data that themselves descend to κ(x), define the local traced contribution `Tr_{kappa(x)/K}` T_x(F,G;H) with the full auxiliary data. No auxiliary independence is asserted for a local triple index. For any expression already defined over K, extension to L followed by scalar trace multiplies its value by [L:K]. For a finite Galois-stable family of annular ends with end fields κ(e), define the corresponding end-sums by Σ_e `Tr_{kappa(e)/K}` B_e or Σ_e `Tr_{kappa(e)/K}` T_e, using descended functions and, for triples, the full compatible auxiliary data. Their scalar extension is the sum over geometric ends. (colmez1998, Galois descent Remark 2(iv), line 246, and §II.2.5, line 3950; consequence of besser2017 Definition 3.4/Corollary 5.3, lines 435/807 and besser-dejeu2012 §8, line 2524).

Assume K/ℚ_p finite; a compatible branch; Z finite reduced, all residue fields finite separable over K; F,G are descended representatives of the global single-integral primitive torsors; For a traced triple contribution, functions and auxiliary primitives are all defined over κ(x).

- In a normal splitting extension the embedded traced contribution is the sum of the conjugate point contributions, and the global sum equals the split corrected pairing.

- Computing residue traces through an intermediate residue field gives the same contribution.

- Parameter changes preserving the formal point orientation and equal local germs preserve the traced values.

- The global double sum is alternating and K-bilinear in the forms; it factors through de Rham classes and extends the proper cup product after descent.

- Taking the index over each end field and then its field trace gives the same scalar as splitting all ends and summing their conjugate contributions; traces compose in towers.

Scalar extension of local indices and the pinned trace-as-embeddings identity identify each closed-point contribution with its geometric conjugate sum. Apply §4.4 after splitting. Faithful scalar embedding proves constant independence, cohomology factorization and cup compatibility over K. Transitivity is the pinned trace tower theorem. For triple data the same proof yields descent of values, retaining local choice dependence.

*Needs:* §2.3, §4.4, §5.5, §7.3, Mathlib `trace_eq_sum_embeddings`, Mathlib `Algebra.trace_trace`.

**Checks.**

- At the quadratic closed point t²−π=0, B_x(1,log(t²−π))=1 over κ(x), so its trace is 2; at infinity the residue is −2, and the global constant-first sum is 0.
- A K-rational point uses the identity trace; an empty point set contributes zero for global regular forms.
- In a quadratic extension α²=π, replacing Tr(B) by a product of traces of its input coefficients can turn Tr(α²)=2π into 0. Only the whole scalar index is traced.

### 7.6 Independence of semistable extensions and models

For every smooth proper geometrically connected X/K, every meromorphic ω and every degree-zero divisor away from its poles, choose any finite extension giving a split regular nodal model with separated pole and divisor support. The harmonic formula of §§4.2–4.3 evaluates the single integral of §4.0c and §7.4, and the corrected double formula evaluates §7.5. These values agree after any further coefficient extension, common model refinement, node subdivision or pole separation, hence descend to the original arbitrary-reduction curve. For a connected Coleman wide open with F,G,H and global compatible auxiliary data defined over K, T_U and P_U are K-valued and commute with scalar extension and admissible shrinking. This last assertion is about a wide open; it does not construct a triple pairing of three arbitrary whole-curve Vologodsky primitives by summing components. A connected wide open whose constant field is a finite extension k₀/K is treated over k₀, and its K-valued end-sum is the field trace, equivalently the sum over geometric components. (besser-zerbes2017, Corollary 1.2 and §2 finite-extension argument, p. 3, besser-zerbes2017 line 95 and line 130; besser2017 Proposition 4.12(3), line 753; besser-dejeu2012 introduction p. 310, line 250).

Assume K/ℚ_p finite, p any prime; fixed branch parameter in K; X/K smooth proper geometrically connected curve; no reduction or genus restriction; Meromorphic forms evaluated off poles; divisor degree zero where a divisor is evaluated; Triple assertions require actual global Coleman wide-open data and descended auxiliary choices.

- Two realization fields and models are compared in one common finite extension with compatible generic-fibre identifications.

- The harmonic evaluation equals the K-valued degree-zero divisor integral without a chosen K-point.

- If the wide-open functions and auxiliary data descend, their end-sums are fixed by Galois and belong to the coefficient field; local end values may require their residue fields.

StableReduction supplies finite nodal reduction in all genera, regularization, splitting of branches and separation of marked sections, together with common refinements. Apply the split comparison and then §7.3. Since each harmonic evaluation equals the intrinsic natural integral of §4.0c, two realizations agree in a common field; trace/embedding descent gives the K-value. §1.3 handles the metric under refinement, and §7.5 handles nonsplit local terms. For global triple data use §5.5 and §6.2 and descend the resulting scalar, without asserting a new global bad-reduction triple construction.

*Needs:* §1.3, §4.3, §4.4, §6.4, §7.3, §7.4, §7.5, StableReduction Layers 0–1, 4–5, 7, 9, RigidAnalyticGeometry §§1.3, 6.2, 8.1, JacobianChallenge Layers D–F, StableReduction Layer 2.

**Checks.**

- Good reduction uses a single component and gives Coleman integration, with no graph correction.
- A ramified extension splitting a quadratic divisor gives the value π of §7.4 and traced local residue 2 of §7.5, independent of further ramification.
- A whole-curve sum of local triple indices changes under unrelated component auxiliary shifts by the residue change laws. Wide-open global-choice independence does not certify that construction.
- A connected wide open with quadratic constant field L has K-valued end-sum `Tr_{L/K}` of its L-valued sum; the scalar 1 contributes 2, not 1. Geometric connectedness cannot be inferred from connectedness alone.

### 7.7 A cycle with nonzero jump and branch cancellation

For a Tate curve E_q/K with q∈K× and n=ν_π(q)>0, the invariant differential dz/z has primitive on K×/q^ℤ given by F(z)=log_λ(z)−(ν_π(z)/n)log_λ(q), normalized by F(1)=0. In the regular n-gon presentation its cyclic harmonic jump is −log_λ(q)/n. For n=1 use the loop presentation and for n=2 the two parallel edges, or a compatible regular subdivision. The expression is invariant under z↦qz and under a change of logarithm branch. (besser-zerbes2017, §3, pp. 5–6, besser-zerbes2017 line 245 and line 265).

Assume K/ℚ_p finite, fixed uniformizer π and any logarithm branch; q≠0, ν_π(q)=n>0; this hypothesis makes n invertible in K; The point-level Tate uniformization is supplied by EllipticCurves Layer 4; its differential normalization is §7.0; Algebraic points are interpreted after compatible finite coefficient extension.

- F(qz)−F(z)=log(q)−(n/n)log(q)=0.

- The branch change is (λ′−λ)(v_p(z)−ν_π(z)v_p(q)/n)=0 since v_p=ν_π/e.

On successive fundamental annuli use log(z) as the Coleman primitive. Crossing the final q-identification contributes −log(q). Project this cochain to the constant cyclic harmonic cochain, using §1.2. Subtract the vertex potential and apply §4.3. The displayed two-term computations verify q-periodicity and branch independence.

*Needs:* §4.3, §7.1, §7.2, §7.0, EllipticCurves Layer 4.

**Checks.**

- Over ℚ_p take π=p, q=p³ and log(p)=1. Then n=3, every cyclic jump is −1 and F(z)=log(z)−ν_π(z); enforcing zero jumps fails.
- For n=1 or n=2 the same formula holds on loops or parallel edges. The case q=1 is excluded because n=0 and the quotient is not this Tate curve.
- At p=2 the cancellation uses only characteristic-zero division by n and v_p=ν_π/e; it imposes no odd-prime condition.

### Examples

A ramified quadratic closed point tests residue-field traces; a degree-zero divisor tests basepoint cancellation; the Tate curve tests branch cancellation with a nonzero cycle.

### Dependencies

All previous layers; the universal single-integration theorem of §4.0c; StableReduction Layers 0–1, 4–5, 7 and 9; finite-dimensional field trace at the pins. No regulator construction is used.

## Downstream consumers

Regulator, height and effective-method roadmaps consume the index laws, the Coleman one-form pairing, divisor integration and descent; none is a premise here.

## References

All statements are paraphrases; source-id line numbers refer to versioned text extractions. The numbered results and printed pages identify the claims in the linked source versions.

- **colmez1998**, Pierre Colmez, *Intégration sur les variétés p-adiques*, Astérisque 248 (1998), [Numdam open archive](https://www.numdam.org/item/AST_1998__248__R1_0.pdf). Closed-subfield coefficient scope, p. 73, colmez1998 line 2957; Definitions II.1.2–II.1.3 and Theorem II.1.4, pp. 73–74, line 2982; Remark 2, pp. 2–3, line 225, especially closed-subfield descent Remark 2(iv), colmez1998 line 246; Theorem II.1.9, pp. 76–77, lines 3079–3121; Theorem II.1.16 and Proposition II.1.17, pp. 78–79, lines 3169/3193; Lemmas II.1.26–II.1.27, pp. 83–85, lines 3376/3399; Lemma II.1.13 and Remark II.1.18, pp. 78–79, lines 3147 and 3213; §II.2.5, p. 97, line 3950.
- **besser2005**, Amnon Besser, *p-adic Arakelov theory*, [arXiv:math/0301029v1](https://arxiv.org/abs/math/0301029v1), Proposition 3.4 and Lemmas 3.5–3.7, pp. 8–9, besser2005 lines 355–380. The cited version is the 2003 preprint of the 2005 publication; its numbering is used here.
- **vologodsky2001**, Vadim Vologodsky, *Hodge structure on the fundamental group and its application to p-adic integration*, [arXiv:math/0108109v1](https://arxiv.org/abs/math/0108109v1). Standing p>2 convention §1.1, p. 2, line 51; Theorem B(4), §1.17, p. 5, line 195; Proposition 52, §17.2, p. 42, line 1806, using Conjecture 1 in the rank-two case established by Colmez (line 1810).
- **besser2017**, Amnon Besser, *p-adic heights and Vologodsky integration*, [arXiv:1711.06957v1](https://arxiv.org/abs/1711.06957v1). Definitions 3.1–3.2/Lemma 3.3, p. 9, line 402; Definitions 3.4/3.8 and Propositions 3.5/3.9, pp. 9–11, lines 435/492; graph Definitions 4.1–4.3, printed pp. 11–12, line 528, and Theorem 4.4, p. 12, line 553; Theorem 4.10, Definition 4.11 and Proposition 4.12, pp. 14–16, lines 700/738/747; Corollary 5.3, p. 16, line 807. The height construction and comparison are outside scope.
- **besser-zerbes2017**, Amnon Besser and Sarah Livia Zerbes, *Vologodsky integration on curves with semi-stable reduction*, [arXiv:1711.06950v1](https://arxiv.org/abs/1711.06950v1). Theorem 1.1, p. 2, line 88; Corollary 1.2, p. 3, line 108; §2 and Lemma 2.1, pp. 3–5, lines 130/218; Tate example §3, pp. 5–6, line 245. The n≥3 presentation is replaced by a flag graph or subdivision in the general example.
- **besser-dejeu2012**, Amnon Besser and Rob de Jeu, *The syntomic regulator for K4 of curves*, Pacific Journal of Mathematics 260 (2012), 305–380, [publisher open archive](https://msp.org/pjm/2012/260-2/pjm-v260-n2-p03-p.pdf). Published §§7–8, pp. 355–362, lines 2227/2519; Lemma 9.1 and Proposition 9.2, p. 364, lines 2769/2776; shrinking and field descent in the introduction, p. 310, line 250. The regulator itself is not imported or constructed here.

- **serre1959**, Jean-Pierre Serre, *Morphismes universels et variété d’Albanese*, Séminaire Claude Chevalley 4 (1958–1959), Exposé 10, [Numdam open archive](https://www.numdam.org/article/SCC_1958-1959__4__A10_0.pdf). §2 Theorems 1–2 and corollary, pp. 10-02–10-05, serre1959 lines 83–205; §4 Theorems 5–6, pp. 10-10–10-11, lines 431–481. The algebraically closed construction is descended with its pointed universal property in §4.0b.
