# Roadmap: Coleman integration and noncritical Dirichlet `L`-values

**Summary.** This roadmap builds Coleman's p-adic integration on curves with good reduction, uses it to construct Coleman's p-adic polylogarithms `Li_k` on `ℂ_p ∖ {1}` with their functional equations, and proves Coleman's formula expressing the Kubota–Leopoldt p-adic L-values at positive integers through polylogarithms at roots of unity: for an odd prime `p`, a nontrivial primitive Dirichlet character `θ` of conductor `N = Dp^n` with `p ∤ D`, a primitive `N`-th root of unity `ε_N` and `k ≥ 1`,

```text
L_p(θ ω^{1−k}, k) = (1 − θ(p) p^{−k}) · G(θ⁻¹)⁻¹ · Σ_{c ∈ (ℤ/Nℤ)^×} θ⁻¹(c) · Li_k(ε_N^c),
G(θ⁻¹) = Σ_c θ⁻¹(c) ε_N^c,
```

with `Li_k` taken for the Iwasawa branch of the logarithm (L3.28). The Teichmüller twist `ω^{1−k}` is part of the statement: RJW Theorem 6.7(ii) prints the left side without it. The twist disappears when `k ≡ 1` modulo `p − 1`; for `p = 5, θ = χ_{−3}` and `k = 2` the untwisted value vanishes by parity while the right side is a 5-adic unit (RJW §6.2, Theorem 6.7, p. 39; BBdJR proof of Proposition 4.17, p. 22). Layer L0 supplies the elementary p-adic analysis: formal primitives and their radius of convergence, functions analytic on a whole disc, residues and logarithmic primitives on annuli, and the valuation adapters `log_a` to the Iwasawa logarithm `log_p` supplied by DirichletPadicLFunctions §0.6. Layer L1 builds Coleman integration from a Frobenius-structured unipotent datum on a wide open (Dwork's principle, the word algebra of iterated integrals, Coleman functions, the uniqueness principle, independence of the Frobenius lift, pullback), and makes it explicit on `ℙ¹ ∖ {0, ∞, μ_N}` and on the four-punctured line. Layer L2 constructs `Li_k`, proves the distribution, inversion and branch-change relations, computes values at roots of unity, constructs the integral modified polylogarithm, and proves the five-term relation for Coleman's dilogarithm, scalar and projective. Layer L3 proves Coleman's formula through geometric and pole-cancelled smoothed measures and their negative moments, compares it with the complex formula and with the arguments of Rodrigues Jacinto–Williams and Bannai–Hagihara–Yamada–Yamamoto, and reads it as a statement about syntomic regulators of Beilinson's cyclotomic elements (Besser–de Jeu): the modified polylogarithm `L^mod_n`, the syntomic regulator of `[ζ]_n`, the p-adic Beilinson conjecture for Artin motives over `ℚ` as a proposition, and its parts `(1)`–`(3)` for Dirichlet motives. The end theorems are Coleman's formula (L3.28) with its trivial-character and RJW-normalized forms (L3.29, L3.30), the five-term relation (L2.70), the syntomic regulator of cyclotomic elements (L3.15) and the p-adic Beilinson conjecture for Dirichlet motives (L3.36).

## Scope and ownership

This roadmap owns:

1. **Elementary p-adic analysis** (Layer L0): the normalized formal primitive of a power series over a `ℚ`-algebra and its radius estimates; functions analytic on a whole open disc and their primitives; the logarithm series over a general complete ultrametric field of characteristic zero, extending the `ℚ_p`-algebra theory of PadicFunctionalAnalysis §4.5; the point-evaluation, zero-count and logarithmic-primitive APIs on the annulus carriers and Robba ring, using the unit criterion and compact preparation imported from PadicDifferentialEquationsAndRigidCohomology (L0.A1–L0.A2); residues and logarithmic primitives on open annuli and on the end germ of a residue disc; the valuation adapters `log_a(x) = iwasawaLog p x + a·v_p(x)` on `ℂ_p^×`, with value 0 at zero, their local analytic expansions and their compatibility with the logarithm contract supplied by DirichletPadicLFunctions §0.6; the rational polylogarithm coefficient series `q_k ∈ ℚ[[X]]` (L0.F).
2. **Coleman integration** (Layer L1): good-reduction pairs, wide opens, locally analytic functions with logarithmic ends, Frobenius lifts and Teichmüller points, Frobenius-structured unipotent data and their existence, Dwork's principle, the word algebra, Coleman functions and integrals, the uniqueness principle, independence of the Frobenius lift and of the branch, functoriality, and the explicit punctured lines `ℙ¹ ∖ ({0, ∞} ∪ μ_N)` and the four-punctured lines used by the five-term relation.
3. **Coleman's polylogarithms** (Layer L2): `Li_k^a`, their residue-disc expansions, tangential base point, distribution and inversion relations, branch dependence, the value at 1, Frobenius relation and integral modified polylogarithm, Galois equivariance, the dilogarithm identities, values at roots of unity, the closed-disc restriction and ordered weight-one boundary comparison (L2.Fa), the scalar five-term relation and its projective and Bloch-group forms over an arbitrary field (L2.Fb, L2.70).
4. **L-values and regulators** (Layer L3): geometric and smoothed measures and their negative moments, Coleman's formula and its comparisons, the complex formula, the modified polylogarithm `L^mod_n`, and the motivic and regulator foundations L3.Fa.1–L3.Fd.2: scheme specializations of imported Quillen K-theory and their Adams operations, multi-relative K-theory of cubes, de Jeu's symbols and complexes, Beilinson's cyclotomic elements, Besser's modified syntomic cohomology and syntomic regulator, the relative rigid complexes and the integration-down computation, the Gros regulator, the complex regulator pairings and determinants, the rank criterion, the complex-valued adapter to Zagier's single-valued polylogarithms, and Artin L-functions with coefficients, complex and p-adic.

It leaves to other roadmaps, and imports:

- **PolylogarithmFunctions** §§1.1–1.7 and §3.1 supply the complex analytic polylogarithms, their closed-disc series, continuity, exponential-zeta comparison and distribution. L2.Fa restricts that family to the closed unit disc and owns the ordered weight-one root-of-unity boundary series and its arithmetic comparisons. §§4.2–4.7 supply the real single-valued family and its analytic and functional-equation API; L3.Fc.3 uses the parity-dependent conversion to BBdJR's complex line and owns the regulator and cyclotomic comparisons. §5.8 supplies the field-general homogeneous determinant comparison, Möbius invariance and five-point normalization; L2.Fb transports these through `OnePoint.equivProjectivization`, using its bracket `1 − r` on distinct tuples, and owns the symbols, field maps and scalar-to-group descent.
- **TauCetiRoadmap RigidAnalyticGeometry** §7.3 (classical identity principle), read through AdicSpacesPartII §R1.9 (*rigid-identity-principle*): on a connected normal rigid space, restriction to a nonempty admissible open is injective on sections of the structure sheaf and of finite locally free modules. L1 uses it through AdicSpacesPartIV §F1.8.
- **AdicSpacesPartIII** Layers R2 and R3: generic fibres (§R2.3); specialization and tubes (§R2.4); residue discs of smooth rational points as open discs, with the reparametrization `t′ = u t (1 + h)` (§R2.9, *residue-disc*); quasi-Stein spaces with Kiehl's Theorems A and `B` (§R3.4); proper GAGA (§R3.7).
- **AdicSpacesPartIV** Layer F1: dagger algebras (§F1.2), fringe presentations and the fringe topology (§F1.3), rational localization (§F1.4), weak completions (§F1.5), Tate acyclicity (§F1.6), and coherent modules and strict neighbourhoods (§F1.7). Also the identity principle (§F1.8), the overconvergent de Rham complex with smooth dagger spaces and the cohomology of dagger annuli (§F1.9), finite base change of dagger de Rham cohomology (§F1.11), and logarithmic complexes of smooth pairs (§F1.12).
- **TauCetiRoadmap RestrictedPowerSeries** §§1.1, 2.1, 2.4, 3.2 and 7.1–7.2 and **TauCetiRoadmap NewtonPolygons** §§0.3 and 0.5: Gauss norms, evaluation, the maximum principle and units for one-sided restricted series; series on open discs and entire series; supporting values of integer-indexed height sequences. Both roadmaps leave analytic Laurent rings out of scope. The two-sided carriers are imported from PadicDifferentialEquationsAndRigidCohomology RD.0.1–RD.0.2; L0.A1–L0.A2 extend their analytic API.
- **PadicDifferentialEquationsAndRigidCohomology** Layers RD.0 (including RD.0.1–RD.0.2 for Laurent and Robba carriers, convolution, Gauss norms, completeness and restriction, RD.0.18 for compact Laurent preparation, finite Newton breaks and the dominant-term unit criterion, and RD.0.36 for the derivation), RD.3.5, RD.3.12, RD.3.17–RD.3.18 and RD.4–RD.6: Frobenius lifts on weak completions and the finite-order linear algebra of Frobenius; diagonal-tube charts, the Taylor convergence criterion and the connection/stratification equivalence; rigid cohomology, its finite-dimensionality, independence of choices and Frobenius weights.
- **PadicMeasuresIwasawaAlgebras** Layers 2 and 3: bounded Mahler–Amice theory over `O_K`, continuous rotation and residue-class integrals; evaluation of pseudomeasures at nontrivial characters.
- **LocallyAnalyticDistributions** Layer 1: locally analytic distributions on `ℤ_p`, their Amice transforms onto `R⁺` and restriction to `ℤ_p^×`.
- **DirichletPadicLFunctions** §0.6 and Layers 0–3: the Iwasawa decomposition and normalized logarithm `iwasawaLog p` on `ℂ_p`, including uniqueness, finite-extension restriction and equivariance; Gauss-sum conventions, smoothing measures, character measures and the Kubota–Leopoldt normalization (RJW Definition 5.18 and Remark 5.19, p. 35). L0.14–L0.18 import this logarithm contract and form the general branches by adding `a·v_p`; L3 uses the same supplied zero branch. The generic `ℚ_p` logarithm-series theory comes from **PadicFunctionalAnalysis** §4.5; the general ultrametric-field extension and the local analytic expansions remain here.
- **TauCetiRoadmap AdelicAlgebraicGroups** §2.4 (convergence factors): finite-image complex Artin factors on inertia invariants, their induction formula and the Euler product, consumed by L3.Fd.1.
- **TauCetiRoadmap RepresentationTheory**, the induction–restriction roadmap, Layer 6: the virtual character ring and Brauer's induction theorem, consumed by L3.Fd.2.
- **GeometryOfNumbersAndQuadraticArithmetic** §§6.1.1–6.1.3: the Quillen construction, exact-category K-groups, their `K₀` comparison and functoriality, nerve realization and Quillen A/B; §6.10: finite-field K-groups. L3.Fa.1 specializes these to schemes and constructs products, localization, homotopy invariance, exact-cube comparisons and Adams operations, together with the filtered-union comparison for algebraic extensions of finite fields.
- **TauCetiRoadmap GrothendieckEulerForms** Layers 0–2 and **AlgebraicVectorBundles** L0A–L0C: exact structures and `K₀`, finite locally free sheaves and their polynomial operations, consumed by L3.Fa.1.
- **TauCetiRoadmap DerivedModuleAlgebra** §0.K.1: the linear-functional Koszul complex, its functorial maps and regular-sequence exactness, used for the homogeneous Koszul pieces in L3.Fa.1.
- **TauCetiRoadmap JacobianChallenge** Layer `B`: genus, Riemann–Roch and Serre duality for curves over a field, consumed by L1.9. The comparison from relative differentials to that canonical sheaf is the additional target `goodReduction_differentialsEquivDualizing` in L1.9; it is not asserted to be part of Layer `B`.

Tau Ceti supplies the principal-unit logarithm and exponential on local fields (`TauCeti.NumberTheory.LocalField.Logarithm`, `TauCeti.NumberTheory.LocalField.Exponential`), the Teichmüller lift `TauCeti.teichmullerLift` and the splitting of `ℤ_p^×` into torsion and principal units (`TauCeti.NumberTheory.LocalField.UnitsDecomposition`). DirichletPadicLFunctions §0.6 supplies their comparison with its Iwasawa logarithm on `ℂ_p` and finite extensions of `ℚ_p`. L0.15 forms the general branches on `ℂ_p`, which is not a local field, by valuation adapters; L0.17 transports the supplied restriction and equivariance laws to those branches. General Tannakian path torsors and nonabelian Chabauty belong to AnabelianGeometryAndNonabelianChabauty; its §5.8 owns the generic regular Coleman/abelian logarithm comparison on Jacobians as a downstream consumer of the Coleman integration supplied here. ColemanIntegration owns L1.12–L1.23 and L2.3–L2.18. AnabelianGeometryAndNonabelianChabauty §5.0 must import these targets and retain only the comparison with its tensor-path realization, through its `colemanFunctions_*`, `colemanPrimitive_*` and `colemanDilogarithm_*` interfaces. Both roadmaps are downstream consumers here.

## Conventions

- `p` is a prime, `|p| = p⁻¹` on `ℂ_p` (Mathlib `PadicComplex`) and `v_p(p) = 1`; `v_p(x) = −log_p|x| ∈ ℚ` for `x ∈ ℂ_p^×`. Results about general complete ultrametric fields state their own characteristic-zero and completeness assumptions.
- `D⁻(a, r)` is the open disc of radius `r ∈ (0, ∞]`, measured in `ENNReal` as in `FormalMultilinearSeries.radius`. "Analytic on the disc" means given by one convergent power series on the whole disc (L0.7); `AnalyticOnNhd` alone is local analyticity and allows nonconstant locally constant functions.
- `log_a` is the branch with `log_a(p) = a`, defined on nonzero inputs by `log_a(x) = iwasawaLog p x + a·v_p(x)`, and `log_p = log_0` is the supplied `iwasawaLog p`. On `ℂ_p^×, log_b − log_a = (b − a)v_p`. As functions on all of `ℂ_p` the branches take the junk value 0 at 0; every statement using the homomorphism property states nonvanishing.
- A good-reduction pair is defined over a finite extension `K` of `ℚ_p` with residue field `k = 𝔽_q`. The arithmetic Frobenius lift is `K`-linear and lifts `z ↦ z^q`. The auxiliary `p`-power map `z ↦ z^p` used on punctured lines permutes the tame roots of unity; when `q ≠ p` it is not arithmetic Frobenius over `K`.
- In an iterated integral the first letter of a word is the outermost integration. Nonempty words are normalized at an ordinary base point, or at a tangential base point through the constant term of their regular-logarithmic expansion. The constant term of an arbitrary Laurent germ is not multiplicative, so tangential statements carry the simple-pole and pullback-normalization hypotheses of L1.
- `Li_0(z) = z/(1 − z), Li_1(z) = −log_a(1 − z)` and `dLi_k = Li_{k−1} dz/z`; near `0, Li_k(z) = Σ_{m≥1} z^m/m^k`. For `k ≥ 2, Li_k(1)` is the limiting value of L2.11. The Frobenius-modified value is `Li_k^{(p)}(z) = Li_k(z) − p^{−k}Li_k(z^p)`.
- Formulas in the normalization of the Kubota–Leopoldt function assume `p` odd; analytic statements about polylogarithms allow `p = 2`. The dyadic case of the regulator comparison is the separate target L3.36(b).
- On `R⁺, ∂ = (1 + T)d/dT`. A pole-cancelled smoothing transform is formed before formal inversion; taking separate inverses at the removed centre gives a different power series (L3.17–L3.23).
- Standing hypothesis sets used by several targets, cited by label:
  - (C1) `K` is complete, ultrametric and of characteristic zero.
  - (C2) `p` is any prime, including 2; `a ∈ ℂ_p`; `L = log_a` is the branch of L0.15 (any function satisfying `IsLogBranch`); `D` and `R_a` are Coleman's dilogarithm `dilogD` (L2.18) and the five-term defect `fiveTermDefect` (L2.31).
  - (C3) `q_n = p^(n+1)` for `n ∈ ℕ`, a sequence in `ℂ_p`.
  - (C4) `p` does not divide `N`.
  - (C5) `K` is a finite extension of `ℚ_p` inside `ℂ_p` with valuation ring `O_K` and residue field `k` of cardinality `q = p^f`, and `v ∈ K` satisfies `|v| = |1 − v| = 1`.
  - (C6) `p` is any prime, `a ∈ ℂ_p` is the branch parameter and `D = D^a` is Coleman's dilogarithm of L2.18; no finite-extension assumption is made on the points.
  - (C7) An admissible pair is `(x, y)` with `x, y ∉ {0, 1}` and `x ≠ y`; every use of reflection or inversion checks its nonvanishing hypotheses, and the junk values of the total functions outside this locus are used by no statement.
  - (C8) As (C2): `p` any prime including 2, a branch parameter `a ∈ ℂ_p` with a logarithm `L` satisfying `IsLogBranch`, and `D, R_a` the dilogarithm and the scalar five-term defect.
  - (C9) `A ⊂ ℂ_p²` is the set of admissible pairs of (C7) with the product topology, and `S ⊂ A` its subset with `|y| = |1 − y| = 1`; no condition `|x| = 1` or `|x − y| = 1` is imposed.
  - (C10) `K` is a finite extension of `ℚ_p` with its extended absolute value, `b > 1` is an integer prime to `p`, and `|w − 1| < 1`, unless a more general algebraic statement is given.
  - (C11) `K` is a complete nontrivially normed ultrametric field, `b` is a natural number with `|b| = 1`, and `|w − 1| < 1`; in the arithmetic application `K/ℚ_p` is finite and `p ∤ b`.
- Cones follow `d(a, b) = (da, f(a) − db)` on `A^i ⊕ B^{i−1}`, and the relativity isomorphisms of K-theory and of rigid cohomology are normalized at `t = 0` (L3.Fa.2, L3.Fb.3). With these choices the sign in both regulators of the raw de Jeu symbol `[z]_n` is `(−1)^n`. We retain that raw-symbol convention throughout, including the cyclotomic classes. BBdJR Remark 4.16, p. 21, instead replaces its map `Ψ_n` by `(−1)^n Ψ_n` to remove this sign; formulas imported from that convention acquire `(−1)^n` here. In weight `3, Φ_∞([−1]_3) = −2P_3(−1) = (3/2)ζ(3)`, and `reg_p([−1]_3) = −2Li_3(−1)`.

## Exact supplier contracts

### From Mathlib (pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`)

- Power series: `PowerSeries`, `PowerSeries.coeff`, `PowerSeries.derivative` with `PowerSeries.coeff_derivative` and `PowerSeries.derivative.ext`, `PowerSeries.log` (the formal `log(1 + X)`) with `PowerSeries.derivative_log_mul_one_add_X`, `PowerSeries.IsRestricted`, `PowerSeries.gaussNorm`, the inverse of a unit power series (`PowerSeries.isUnit_iff_constantCoeff`, `PowerSeries.coeff_inv`), `LaurentSeries`.
- Analysis: `FormalMultilinearSeries.ofScalars`, `FormalMultilinearSeries.radius`, `HasFPowerSeriesOnBall` (with `HasFPowerSeriesOnBall.fderiv` and `HasFPowerSeriesOnBall.changeOrigin`), `HasFPowerSeriesAt.eq_formalMultilinearSeries`, `AnalyticOnNhd`, `Metric.eball`, `IsUltrametricDist`, `IsLocallyConstant`.
- p-adic numbers: `PadicComplex`, `PadicAlgCl`, `PadicComplexInt`, `Padic.norm_p_lt_one`, `padicValNat`, `PadicInt`, `spectralNorm`.
- Measures: `AbstractMeasure` (written `D(ℤ_p, R)`), `AbstractMeasure.amiceTransform`, `AbstractMeasure.injective_amiceTransform` and the `ℤ_p`-valued `AbstractMeasure.amiceTransformEquiv`. Arbitrary `O_K` coefficients are not provided by this equivalence and come from PadicMeasuresIwasawaAlgebras Layer 2.
- Characters and L-functions: `DirichletCharacter` with `DirichletCharacter.IsPrimitive`, `gaussSum`, `gaussSum_mulShift_eq`, `AddChar.zmodChar`, `ZMod.stdAddChar`, `ZMod.dft`, `DirichletCharacter.LFunction` and `DirichletCharacter.LFunction_eq_LSeries`, `ZMod.LFunction`, `HurwitzZeta.expZeta` and `HurwitzZeta.hasSum_expZeta_of_one_lt_re`, `bernoulli`, `Polynomial.cyclotomic`, `IsPrimitiveRoot`.
- Algebra: `Derivation`, `Finsupp`, `FreeMonoid`, `FreeAbelianGroup`, `TensorProduct`, `ExteriorAlgebra`, `Projectivization`, `Module.Free`, `LinearMap.charpoly`, `Module.End.HasEigenvalue`, and the morphism properties `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.Etale`, `AlgebraicGeometry.IsFinite`.

Each is used with its stated hypotheses only. In particular Mathlib has no polylogarithm at the pin (PolylogarithmFunctions supplies the complex family, with its closed-disc adapter in L2.Fa), no p-adic logarithm on `ℂ_p`, no Coleman integration and no algebraic K-theory of schemes.

### From Tau Ceti (pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`)

- `NormedSpace.logOneAdd`, `NormedSpace.logOneAddSeries`, `NormedSpace.hasFPowerSeriesOnBall_logOneAdd` and `NormedSpace.logOneAdd_eq_tsum`: the logarithm series `log(1 + u)` and its defining power series. The radius theorem proved there assumes a continuous action of `ℚ≥0`, which p-adic fields lack; L0.10 proves the ultrametric radius bound on the same series.
- `TauCeti.teichmuller` and `TauCeti.range_teichmuller`: the Teichmüller lift of a local field, used for the Teichmüller points of L1.6.
- `TauCeti.hasSum_log_of_mem_unitFiltration_one` and `TauCeti.valuation_log` (`TauCeti.NumberTheory.LocalField.Logarithm`): convergence of Mathlib's `NormedSpace.log` on principal units of a finite extension of `ℚ_p`, and its valuation on units at depths `e < (p − 1)i`. DirichletPadicLFunctions §0.6 supplies the comparison with its Iwasawa logarithm, including the separate dyadic depth bound; L0.17 consumes that comparison.
- `TauCeti.laurentEval` (module `TauCeti.Algebra.Polynomial.Laurent.Basic`): evaluation of a Laurent polynomial at a unit of an algebra. On Laurent polynomials it is the evaluation of L0.A2.

### From TauCetiRoadmap

- **RigidAnalyticGeometry**, §7.3 (classical identity principle), through **AdicSpacesPartII**, §R1.9 (*rigid-identity-principle*): on a connected normal rigid space, sections of the structure sheaf or of a finite locally free module that vanish on a nonempty admissible open vanish. RigidAnalyticGeometry states it for its affinoid algebras (`IsAffinoidAlgebra K A`) and rigid spaces, read through the carrier bridge of AdicSpacesPartII §R0.9. L1.2 and L1.35 apply it to the wide opens `W_r`, which are connected smooth curves and hence normal, through the dagger–rigid comparison of AdicSpacesPartIV §F1.8.
- **RestrictedPowerSeries**, §1.1 (Gauss norms, their attainment and multiplicativity), §2.1 (evaluation), §2.4 (Strassmann's bound and the maximum principle on the closed disc), §3.2 (units of restricted algebras), §7.1 (series on an open disc) and §7.2 (entire series). L0.A1 applies them to the two halves `f⁺` and `f⁻` of a Laurent family, and L2.13 uses the evaluation of §2.1. The two-sided product is imported from PadicDifferentialEquationsAndRigidCohomology RD.0.1; the unit criterion and finite Newton breaks come from RD.0.18, and L0.A2 supplies the maximum principle on circles and point-count corollaries of compact preparation.
- **RestrictedPowerSeries**, §7.1 and §2.1: `TauCetiRoadmap.RestrictedPowerSeries.OnOpenDisc 1 F` is the condition that `F` is restricted at every `0 < r < 1`; `TauCetiRoadmap.RestrictedPowerSeries.eval₂ (RingHom.id K) F t` is `Σ' n, F.coeff n * t^n`. L3.6 uses these directly for `R⁺` and its evaluation.
- **NewtonPolygons**, §0.3 (supporting values and their concavity) and §0.5 (the same theory for integer-indexed sequences): `ρ ↦ −log|f|_ρ` is the supporting function of `n ↦ −log‖a_n‖` at slope `log ρ` (L0.A1, `laurentGaussNorm_logConvex`).
- **AdelicAlgebraicGroups**, §2.4 (convergence factors): for a finite-image complex Galois representation, the local factor on inertia invariants, its induction formula and the Euler product of the global `L`-function on `Re s > 1` with its continuation. L3.Fd.1 assembles these over the embeddings of a coefficient field.
- **RepresentationTheory**, induction and restriction, Layer 6: the ring of virtual characters and Brauer's induction theorem (every character is a `ℤ`-combination of characters induced from one-dimensional characters of elementary subgroups). L3.Fd.2 uses the version that keeps the fixed fields totally real when the kernel field is totally real.
- **GrothendieckEulerForms**, Layers 0–2: the essentially small exact-category infrastructure and exact Grothendieck group, with universal properties and equivalence invariance. **AlgebraicVectorBundles**, L0A–L0C: finite locally free sheaves and their exact pullback, tensor, symmetric and exterior powers. L3.Fa.1 imports these objects to specialize the exact-category K-groups supplied by GeometryOfNumbersAndQuadraticArithmetic §§6.1.1–6.1.3.
- **DerivedModuleAlgebra**, §0.K.1: the Koszul complex of a linear functional and its maps; exactness locally for a regular sequence. L3.Fa.1 uses the tautological functional over `Sym(E)`, takes homogeneous components and glues them for a vector bundle `E`.
- **JacobianChallenge**, Layer `B`: genus, Riemann–Roch and Serre duality for a smooth proper geometrically integral curve over a field with a rational point (the current library has `SchemeWeilDivisor.eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus` and `SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero`). L1.9 supplies the additional differential/canonical-sheaf comparison, extends scalars to supply a rational point and uses geometric integrality for the constant field.

### From other roadmaps

- **PadicFunctionalAnalysis §4.5** — logarithm-series convergence, continuity and the product law for commutative Banach `ℚ_p`-algebras with bounded scalar action, on the native `NormedSpace.logOneAdd` carrier. For a complete normed `ℚ_p`-field `E`, the series converges on `‖u‖ < 1`, uniformly on each closed disc of radius less than 1, and `logOneAdd E E (u + v + uv) = logOneAdd E E u + logOneAdd E E v` for `‖u‖, ‖v‖ < 1`. These are the local inputs to DirichletPadicLFunctions §0.6; L0.10 and L0.13 retain their generality over complete ultrametric fields of characteristic zero.

- **GeometryOfNumbersAndQuadraticArithmetic §§6.1.1–6.1.3, §6.10** — `quillenQ`, `exactKGroup`, `exactKGroup_zero_iso`, `exactKGroup_map`, `nerveRealization_homotopy`, `quillenTheoremA` and `quillenTheoremB` supply ordinary K-theory of exact categories; `finiteFieldKGroups` supplies the positive-degree finite-field calculation. L3.Fa.1 constructs the scheme and multi-relative specializations, exact-cube comparison and higher Adams theory, and proves the filtered-union comparison used for algebraic residue fields.
- **AdicSpacesPartIII R2, R3**. §R2.3 (*raynaud-generic-fibre*) and §R2.4 (*specialisation-map*, *tube*) give the generic fibre `X_an`, the specialization map and the tubes `]x[` and `]Y_k[` of L1.2. §R2.9 (*residue-disc*) identifies the tube of a smooth rational point with the open unit disc and gives `residueDisc_reparam_one`, the change of parameter `t′ = u t (1 + h)` used in L1.2–L1.3. §R3.4 (*quasi-stein-space*; Theorem `B`, the vanishing of higher coherent cohomology, is *quasi-stein-theorems-a-b*, and Theorem `A` is *quasi-stein-theorem-a*) and §R3.7 (*proper-gaga*) give the Čech and GAGA steps of L1.9.
- **AdicSpacesPartIV F1**. §F1.2 (*dagger-algebra*, *dagger-norm-and-continuity*, *dagger-weak-completeness*) gives dagger algebras, their residue norms and overconvergent geometric series. §F1.3 (*fringe-presentation*, *fringe-topology*, *fringe-module-descent*) gives fringe stages and descent of finite modules to them. §F1.5 (*weak-completion*, *weak-completion-generic-fibre*) gives the weak completion `S†⊗K` of a finitely generated `O_K`-algebra as a dagger algebra, for `K` finite over `ℚ_p`. §F1.6 (*dagger-tate-acyclicity*) and §F1.7 (*dagger-coherent-module*, *strict-neighbourhood*, *overconvergent-sections-formula*) give acyclicity, coherent descent and overconvergent sections over strict neighbourhoods. §F1.8 (*dagger-identity-principle*) transports the identity principle of RigidAnalyticGeometry §7.3 through AdicSpacesPartII §R1.9. §F1.9 (*dagger-differentials*, *dagger-smooth-space*, *dagger-de-rham-complex*, *dagger-polyannulus-de-rham-cohomology*) gives differentials, smoothness, the de Rham complex and the cohomology of annuli. §F1.11 (*dagger-de-rham-finite-field-extension*) gives finite base change, and §F1.12 (*dagger-snc-divisor*, *log-de-rham-complex*) gives the logarithmic complex of a smooth pair. L1 states its carriers (wide opens, `A⁺` and `Ω⁺`) as these suppliers construct them. The comparison of `colim_r O(W_r)` with `S†⊗K` for the particular wide opens `W_r` is L1.2's own `daggerAlgebra_eq_weakCompletion`.
- **PadicDifferentialEquationsAndRigidCohomology RD.0, RD.3.5, RD.3.12, RD.3.17–RD.3.18, RD.4–RD.6** — RD.0.1–RD.0.2 supply `A_K(I)`, convolution, Gauss norms, completeness, restriction and `RobbaRing` with its topology; RD.0.18 supplies compact Laurent preparation into the finite polynomial zero divisor and a unit, finite Newton breaks and the dominant-term inverse criterion over arbitrary complete nonarchimedean coefficients; RD.0.36 supplies the derivation. Also diagonal-tube charts, the Taylor convergence criterion and the connection/stratification equivalence (L1.21); Frobenius lifts and homotopies between them, rigid cohomology of smooth curves with its finiteness and independence of the lift, and the Frobenius weights used in L1.8 and L3.Fb.3.
- **PadicMeasuresIwasawaAlgebras Layers 2 and 3** — bounded measures with `O_K` coefficients, their Amice transforms, rotation by `p`-power roots of unity, residue-class values, and pseudomeasure values at nontrivial characters.
- **LocallyAnalyticDistributions Layer 1** — `D^la(ℤ_p, K)`, the Amice isomorphism onto `R⁺`, multiplication by `x` and restriction to `ℤ_p^×`.
- **DirichletPadicLFunctions §0.6 and Layers 0–3** — §0.6 supplies `hasIwasawaDecomposition_padicComplex`, `hasIwasawaDecomposition_of_finiteDimensional`, `existsUnique_isIwasawaLog_padicComplex`, `existsUnique_isIwasawaLog_of_finiteDimensional` and `iwasawaLog p`, with value 0 at both 0 and `p`, the principal-unit series and the homomorphism law on nonzero products. It also supplies finite-extension restriction, `IsIwasawaLog.map_algHom`, `IsIwasawaLog.mem_intermediateField`, `IsIwasawaLog.map_padicComplex_ringEquiv` and `IsIwasawaLog.natCast_mul_eq_of_map_mul`: for every admissible pair `N ≥ 1, m ∈ ℤ` and every homomorphism `ℓ` with the principal-unit series, `N·ℓ(x) = N·iwasawaLog p x + m·ℓ(p)`. The decomposition gives `v_p(x) = m/N`. L0.15–L0.18 use these identities and the valuation laws to form the general branches and their compatibility APIs, retaining the supplied `iwasawaLog` as the zero branch. Layers 0–3 supply the Gauss sum `G(θ⁻¹)` with a chosen primitive root, the smoothing measure `μ_b` with Amice transform `1/T − b/((1 + T)^b − 1)`, the measures `μ_θ`, the Teichmüller character and the p-adic `L`-function `L_p(θ, s)` of RJW Definition 5.18 and Remark 5.19, p. 35, for odd `p`.

## How to read the build

The layers are built in the order L0 `→` L1 `→` L2 `→` L3, and within a layer the *Needs* clauses give the dependency order. In the regulator foundations first construct K-theory (L3.Fa.1), the syntomic complexes and regulator (L3.Fb.1–L3.Fb.2) and the complex regulator and Borel theorem (L3.Fc.1). The number-field vanishing consequence of Borel supplies L3.Fa.1 before constructing the symbol complexes (L3.Fa.2–L3.Fa.4), then the cyclotomic classes of L3.Fa.5. Construct the regulator maps and rank criterion (L3.Fb, L3.Fc.1–L3.Fc.2) before using the complex cyclotomic calculation of L3.Fc.3 to prove the basis and spanning claims of L3.Fa.5. Separately, the construction and distribution of these classes feed L3.15, which supplies the general cyclotomic regulator formula for the p-adic calculation of L3.Fc.3, including pure p-power conductors; L3.15 does not use the basis or spanning theorem. L0 uses the normalized logarithm contract of DirichletPadicLFunctions §0.6 and the `ℚ_p` logarithm-series theory of PadicFunctionalAnalysis §4.5, together with Mathlib, the logarithm series of Tau Ceti, and the one-sided series theory of TauCetiRoadmap RestrictedPowerSeries and NewtonPolygons; its Laurent and Robba carriers, Gauss norms, completeness, restrictions and derivation are imported from PadicDifferentialEquationsAndRigidCohomology RD.0.1–RD.0.2 and RD.0.36, with the analytic extensions of L0.A1–L0.A2. L1 needs L0 and the rigid-geometric suppliers, and delivers Coleman integration in general and explicitly on punctured lines. L2 uses PolylogarithmFunctions §§1.1–1.7, 3.1 and 5.8 for its complex and projective adapters, needs L1 only through the punctured lines and the uniqueness principle, and delivers the polylogarithms and the five-term relation. L3 has two halves: the scalar half (L3.1–L3.13, L3.17–L3.35) needs L2, the measure suppliers and DirichletPadicLFunctions, and delivers Coleman's formula; the regulator half (L3.14–L3.16, L3.36–L3.37) also needs the motivic and regulator foundations L3.Fa.1–L3.Fd.2, which use the supplier contracts above together with Coleman integration (L1) and the polylogarithms (L2). Proof sketches cite targets by number; locators refer to the editions listed under References, with published page numbers marked as such.

## Layer L0: Power series, residues and logarithm branches

Use Mathlib’s analytic and formal-series carriers. Termwise integration preserves the open convergence radius but can lose the closed boundary. Functions on an open annulus are two-sided Laurent families with a decay condition at every interior radius (L0.A1), evaluated at points of `ℂ_p` (L0.A2). Adjoin one logarithmic symbol to remove the annulus residue obstruction; use the Iwasawa logarithm supplied by DirichletPadicLFunctions §0.6 and form every branch on `ℂ_p` by adding its parameter times the valuation. Whole-disc analyticity is stronger than local analyticity.

### L0.F Rational coefficient series

**Definition.** For `k ∈ ℤ` let `q_k ∈ ℚ[[X]]` be the power series with `coeff_0(q_k) = 0` and `coeff_n(q_k) = n^(−k)` for `n ≥ 1` (`rationalPolylogSeries`). Its image under the coefficient map to any field of characteristic zero is the polylogarithm series of that field, so the p-adic series of L2.1 and the complex series of L2.Fa are both images of `q_k`. The laws below are coefficientwise and need no convergence hypothesis (F §2, Remark 2.29, p. 14, for the depth-one rational series in integer weights; RJW §6.2, Remark 6.6, pp. 38–39).

- `rationalPolylogSeries`: `q_k ∈ ℚ[[X]]`.
- `coeff_rationalPolylogSeries`: `coeff_n(q_k) = 0` for `n = 0` and `n^(−k)` for `n ≥ 1`.
- `map_rationalPolylogSeries_coeff`: for a field `F` of characteristic zero, the coefficients of the image of `q_k` in `F[[X]]` are the images of `n^(−k)`.
- `map_rationalPolylogSeries_comp`: `ℚ`-algebra homomorphisms commute with this coefficient map.
- `X_mul_derivative_rationalPolylogSeries`: `X·q_k′ = q_(k−1)` for every `k ∈ ℤ`, including `k ≤ 0`.
- `rationalPolylogSeries_unique`: `q_k` is the unique series with zero constant term and `X·f′ = q_(k−1)`.
- `rationalPolylogSeries_zero_weight`: `q_0 = X/(1 − X)`.
- `rationalPolylogSeries_one_eq_neg_log`: `q_1 = −log(1 − X)`, obtained from Mathlib's `PowerSeries.log` (the series of `log(1 + X)`) by substituting `−X` and negating.

*Construction.* Define `q_k` by its coefficients with `PowerSeries.mk`; the derivative law is a coefficient computation with `PowerSeries.coeff_derivative`, uniqueness follows from coefficient extensionality since multiplication by `n` is injective over `ℚ`, and the two closed forms compare coefficients with the geometric series and the formal logarithm.

*In `Suggested.lean`:* `rationalPolylogSeries`, `X_mul_derivative_rationalPolylogSeries`, `rationalPolylogSeries_unique`, `rationalPolylogSeries_zero_weight`, `rationalPolylogSeries_one_eq_neg_log`.

*Needs:* Mathlib `PowerSeries.mk`, `PowerSeries.coeff_derivative`, `PowerSeries.log`, `PowerSeries.coeff_map`.

**Checks.**

- `coeff_0(q_1) = 0, coeff_2(q_1) = 1/2` and `coeff_3(q_1) = 1/3`.
- `coeff_1(q_(−2)) = 1` and `q_(−1) = X/(1 − X)²`: the coefficients `n^1 = n` of `q_(−1)` are those of `X/(1 − X)²`.
- The image of `coeff_2(q_2)` in `ℂ` is `1/4`; a definition with `coeff_n = n^k` instead of `n^(−k)` gives 4.
- `X·q_1′ = q_0 = X/(1 − X)`; a definition without the factor `X` in the derivative law would give `1/(1 − X)`, whose constant term is 1.

### L0.1 Norms of integers in an ultrametric field of characteristic zero

**Lemma.** Let `K` be a nontrivially normed field whose norm is ultrametric (`IsUltrametricDist`) and whose characteristic is zero. Then `||(n : K)||≤1` for natural number `n`, and exactly one of the following holds: (a) `||(n : K)|| = 1` for `n≥1` (residue characteristic zero); (b) there is a unique prime `p` with `||(p : K)|| < 1`, and then `||(n : K)|| = ||(p : K)||^(v_p(n))` for `n≥1`, where `v_p = padicValNat` p. Put `s := 0` in case (a) and `s := log(1/||p||)/log(p)` in case (b). Then `||(n : K)||^(-1)≤n^s` for `n≥1`. For `K` a complete subfield of `ℂ_p`, normalised by `|p| = 1/p, s = 1`: `|1/n| = p^(v_p(n))≤n`. (BBK §2, Rem. 2, p. 3; BH §1.3.2, p. 5 (author copy).)

Standing hypotheses of this target: `K` is a field with a nontrivial ultrametric norm and `CharZero` `K`. No completeness is needed.

*Proof sketch.* `||n|| ≤ 1` by induction on `n` from `||1|| = 1` and the ultrametric inequality `||a + b|| ≤ max(||a||, ||b||)`. If two distinct primes `q, l` had `||q|| < 1` and `||l|| < 1`, a Bezout relation `a q + b l = 1` with integers `a, b` would give `1 = ||a q + b l|| ≤ max(||q||, ||l||) < 1`, a contradiction; so at most one prime has norm `< 1`. In case (b), for `m` prime to `p` choose integers with `a m + b p = 1`; then `1 ≤ max(||m||, ||p||)` forces `||m|| = 1`. Writing `n = p^(v_p(n)) m` with `p` not dividing `m` and using multiplicativity gives `||n|| = ||p||^(v_p(n))`. The bound: `p^(v_p(n)) ≤ n`, hence `||n||^(-1) = (1/||p||)^(v_p(n)) = p^(s v_p(n)) ≤ n^s`; in case (a) the bound is `1 ≤ n^0`.

*In `Suggested.lean`:* `norm_natCast_inv_le_rpow`.

*Needs:* `IsUltrametricDist`, `padicValNat`, `CharZero`.

### L0.2 The normalised formal primitive of a power series

**Definition.** Let `A` be a commutative ring which is a `Q`-algebra. The normalised formal primitive is the A-linear map `PowerSeries.primitive` : `A[[X]]→A[[X]]` with constant coefficient 0 and `coeff (n+1) (primitive f) = (n+1)^(-1) * coeff n f` for all `n≥0`; that is, `primitive (sum a_n X^n) = sum a_n X^(n+1)/(n+1)`. It is the unique power series with derivative `f` (Mathlib's `PowerSeries.derivative`) and constant coefficient zero (L0.3, L0.4). (BBK §3.2, Algorithm 8, step 2, p. 6; MP §5.2, item (3), p. 6.)

Standing hypotheses of this target: `A` is a commutative ring with an algebra structure over `Q` (every positive integer is invertible in A). Without the `Q`-algebra hypothesis the construction is not available: over ZMod `p` the monomial `X^(p-1)` is not a derivative.

- `PowerSeries.primitive`: For a commutative `Q`-algebra `A`, the A-linear map `A[[X]]→A[[X]], sum a_n X^n↦sum a_n X^(n+1)/(n+1)`.
- `PowerSeries.coeff_zero_primitive`: `coeff 0 (primitive f) = 0`.
- `PowerSeries.coeff_succ_primitive`: `coeff (n+1) (primitive f) = (n+1)^(-1) * coeff n f`.
- `PowerSeries.derivative_primitive`: `d/dX (primitive f) = f`.
- `PowerSeries.primitive_derivative`: `primitive (d/dX f) = f - C (constantCoeff f)`.
- `PowerSeries.primitive_X_pow`: `primitive (X^n) = (n+1)^(-1) * X^(n+1)`.
- `PowerSeries.map_primitive`: For a morphism of `Q`-algebras `g` : `A→B`, map `g (primitive f) =` primitive (map `g f`).
- `PowerSeries.primitive_eq_log`: primitive (`mk` fun `n => (-1)^n`) `=` `PowerSeries.log` `A`, Mathlib's formal `log(1 + X)`.

*Construction.* Define `primitive f :=` `PowerSeries.mk` (fun `n =>` if `n = 0` then 0 else `(n : A)^(-1) * coeff (n-1) f`), the inverse being the image of `1/n` under `algebraMap Q` A. A-linearity follows coefficientwise from the linearity of coeff. The derivative identity and uniqueness are L0.3 and L0.4.

*In `Suggested.lean`:* `PowerSeries.primitive`.

*Needs:* `PowerSeries.derivative`, `PowerSeries.log`.

**Checks.**

- `primitive (1 : A[[X]]) = X`.
- `primitive (0 : A[[X]]) = 0`.
- primitive (`mk` fun `n => (-1 : A)^n`) `=` `PowerSeries.log` A (Mathlib's formal logarithm of `1 + X`).
- Over ZMod `p` there is no `g` with `d/dX g = X^(p-1)`: the coefficient of `X^(p-1)` in `d/dX g` is `p * coeff p g = 0`. Hence the `Q`-algebra hypothesis cannot be dropped.

### L0.3 The derivative of the normalised formal primitive in characteristic zero

**Lemma.** Let `A` be a commutative `Q`-algebra and `f` in `A[[X]]`. Then `d/dX (primitive f) = f` and `primitive (d/dX f) = f - C(constantCoeff f)`, where `d/dX` is Mathlib's `PowerSeries.derivative`. (BH §1.3.2, p. 5.)

*Proof sketch.* Compare coefficients with Mathlib `PowerSeries.coeff_derivative`, `coeff n (d/dX g) = coeff (n+1) g * (n+1)`. For `g = primitive f` this is `(n+1)^(-1) coeff n f * (n+1) = coeff n f`, using that `n+1` is invertible in the `Q`-algebra A. For `primitive (d/dX f)` the coefficient at `n+1` is `(n+1)^(-1) (n+1) coeff (n+1) f = coeff (n+1) f` and the constant coefficient is 0.

*In `Suggested.lean`:* `PowerSeries.derivative_primitive`, `PowerSeries.primitive_derivative`.

*Needs:* L0.2, `PowerSeries.coeff_derivative`, `PowerSeries.derivative_log_mul_one_add_X`.

**Checks.**

- Differentiating the primitive of a constant series `C c` gives `C c`, including `c ≠ 0`.
- Integrating the derivative of `C c` gives zero, rather than recovering its lost constant.
- For `f = C c + X`, the integrated derivative is `X = f − C c`.

### L0.4 Uniqueness of the formal primitive with given constant term

**Lemma.** Let `A` be a commutative `Q`-algebra, `f` in `A[[X]]` and `c` in A. A power series `g` satisfies `d/dX g = f` and `constantCoeff g = c` if and only if `g = C c + primitive f`. (BT §5, p. 18.)

*Proof sketch.* The 'if' direction is L0.3 together with `d/dX (C c) = 0`. For 'only if', `g` and `C c + primitive f` have the same derivative and the same constant coefficient, so they are equal by Mathlib `PowerSeries.derivative.ext`.

*In `Suggested.lean`:* `PowerSeries.eq_C_add_primitive_iff`.

*Needs:* L0.3, `PowerSeries.derivative.ext`.

### L0.5 Radius-loss estimate for termwise integration

**Theorem.** For complete nontrivially normed ultrametric `K` of characteristic zero, `R(primitive f)=R(f)`, using `FormalMultilinearSeries.ofScalars` `K (coeff f)`. If `f` is restricted at `ρ>0`, its primitive is restricted at every `0<r<ρ`, with Gauss bound `‖primitive f‖_r≤C(r,ρ)‖f‖_ρ`, where `C(r,ρ)=sup_n r^(n+1)‖1/(n+1)‖/ρ^n<∞`. Restrictedness at `ρ` can fail (L0.6). Thus integration preserves open-disc analytic series and dagger series overconvergent at `ρ`, but need not preserve the closed-disc Tate algebra. (BH §1.3.2, p. 5; BBK §2, Rem. 2, p. 3.)

Standing hypotheses of this target: `K` complete, nontrivially normed, ultrametric, characteristic zero; in particular every complete subfield of `ℂ_p`. `ρ > 0` is a real number; radii are compared in ENNReal as in Mathlib's `FormalMultilinearSeries.radius`.

*Proof sketch.* By L0.1, `|1/(n+1)| ≤ (n+1)^s` for a fixed `s ≥ 0`. (a) If `|a_n| r^n ≤ C` then `|a_n/(n+1)| r'^(n+1) ≤ C r' (n+1)^s (r'/r)^n` is bounded for `r' < r`, so `R(primitive f) ≥ R(f)`; conversely `|a_n| = |n+1| |a_n/(n+1)| ≤ |a_n/(n+1)|` because `|n+1| ≤ 1`, so a bound for the primitive at `r` gives one for `f` at `r` and `R(f) ≥ R(primitive f)`. Conclude with the characterisation of Mathlib `FormalMultilinearSeries.radius` by bounded sequences. (b) `|a_n/(n+1)| r^(n+1) ≤ r (n+1)^s (r/ρ)^n |a_n| ρ^n`, and `(n+1)^s (r/ρ)^n → 0`, which gives the restrictedness (`PowerSeries.IsRestricted`) and the Gauss-norm bound (`PowerSeries.gaussNorm`). (c) Apply (b) with `ρ` replaced by `ρ' > ρ` and `r :=` any number in `(ρ, ρ')`; for the open-disc case apply (b) for every pair `r < r' < ρ`.

*In `Suggested.lean`:* `radius_ofScalars_primitive`, `isRestricted_primitive_of_lt`.

*Needs:* L0.1, L0.2, `FormalMultilinearSeries.radius`, `FormalMultilinearSeries.ofScalars`, `PowerSeries.IsRestricted`, `PowerSeries.gaussNorm`.

### L0.6 Termwise integration fails on the closed disc

**Lemma.** Let `K` be a complete ultrametric field of characteristic zero with `|p| < 1` for the prime `p` (for example any complete subfield of `ℂ_p`). The series `f := sum_{k≥0} p^k X^(p^k - 1)` is restricted at 1 (it lies in the Tate algebra `K<X>`, since `|p^k|→0`), but `primitive f = sum_{k≥0} X^(p^k)` is not restricted at 1 and does not converge at `X = 1`. Hence `d` : `K<X>→K<X> dX` is not surjective, whereas every `f` restricted at some `ρ > 1` (the dagger algebra) and every `f` analytic on the open unit disc has a primitive of the same kind (L0.5 (c)). (BH §1.3.2, p. 5; BBK §2, Rem. 2, p. 3.)

Standing hypotheses of this target: `|p| < 1` in `K`.

*Proof sketch.* Restrictedness of `f`: the only nonzero coefficients are `p^k` at `X^(p^k - 1)`, with `|p^k| → 0`. The coefficient of `X^(p^k)` in `primitive f` is `p^k/p^k = 1`, which does not tend to 0; so `primitive f` is not restricted at 1 and its partial sums at `X = 1` are `k + 1`. Any `g` in `K<X>` with `dg = f dX` would equal `C c + primitive f` by L0.4, a contradiction.

*In `Suggested.lean`:* `not_isRestricted_primitive_closedDisc`.

*Needs:* L0.2, L0.4, `PowerSeries.IsRestricted`.

### L0.7 Analytic functions on an open disc

**Definition.** For complete nontrivially normed ultrametric `K` and `0<r≤∞, O_K(D⁻(a,r))` is the `K`-subalgebra of functions on `Metric.eball` `a r` represented by one `HasFPowerSeriesOnBall` series: `f(z)=Σ c_n(z−a)^n`, with `‖c_n‖ρ^n→0` for `ρ<r`. For `K=ℂ_p, a=0, r=1` and coefficients in `L`, this is `R⁺`, the Amice target of LocallyAnalyticDistributions Layer 1. Prove invariance under every centre `a′∈D⁻(a,r)`, and the identity principle for vanishing on a nonempty open subset. (RJW Rem. 3.39, p. 24; BH §1.3.1, pp. 4-5; BT §5, p. 18.)

Standing hypotheses of this target: `K` complete, nontrivially normed, ultrametric; characteristic zero where primitives are used. `r` in `(0, ∞]` (ENNReal); `r = ∞` gives entire functions.

- `discAnalytic`: `discAnalytic K a r` (hr : `0 < r`) : `Subalgebra K` (`Metric.eball` `a r→K`), the functions given on the ball by one convergent power series. Every operation below carries the positive-radius hypotheses for its discs.
- `mem_discAnalytic_iff`: `f` is in `discAnalytic K a r` iff there is `P` with `HasFPowerSeriesOnBall` (extension of `f`) `P a r`.
- `discAnalytic.coeff`: The coefficient sequence of `f` at the centre `a`, unique by `HasFPowerSeriesAt.eq_formalMultilinearSeries`.
- `discAnalytic.deriv_mem`: `f` in `discAnalytic` implies `deriv f` in `discAnalytic` (termwise, same radius).
- `discAnalytic.recentre`: For `a'` in `Metric.eball` `a r, discAnalytic K a r = discAnalytic K a' r` (same ball, recentred series).
- `discAnalytic.restrict`: for `b ∈ D⁻(a,r)` and numerical radii `0 < r' ≤ r`, restriction maps `discAnalytic K a r` to `discAnalytic K b r'`. The ultrametric inequality gives containment of the point balls; their containment alone does not imply the numerical radius inequality.
- `discAnalytic.eq_zero_of_eqOn`: If `f` vanishes on a nonempty open subset of the ball then `f = 0`.
- `discAnalytic.equivRPlus`: For `a = 0, r = 1` the coefficient map is an isomorphism onto the ring `R^+` of LocallyAnalyticDistributions Layer 1 (power series with `|a_n| ρ^n→0` for all `ρ < 1`).
- `discAnalytic.ofIsRestricted`: A power series restricted at some `ρ > r` (in particular an element of a dagger or Tate algebra at radius `> r`) defines an element.

*Construction.* Membership is Mathlib's predicate: exists `P`, `HasFPowerSeriesOnBall` `f P a r` (Mathlib `HasFPowerSeriesOnBall`). Subalgebra: sums and products of series convergent on the ball converge on the ball (Mathlib's `HasFPowerSeriesOnBall.add` and products of analytic functions). Derivative: Mathlib `HasFPowerSeriesOnBall.fderiv` gives the termwise derivative series on the same ball, and Mathlib `FormalMultilinearSeries.radius_le_radius_derivSeries` shows the radius does not shrink. Recentring at `a' = a+d` uses an ultrametric coefficient argument, not the smaller radius furnished by the generic `changeOrigin` theorem. For every `0<ρ<r` choose `τ` with `max(ρ, ||d||)<τ<r`. Put `b_m = sum_(n≥m) c_n choose(n,m) d^(n-m)`. The binomial coefficients have norm at most 1; with `C_n=||c_n|| τ^n` tending to `0, ||b_m|| ρ^m ≤ sup_(n≥m) C_n (ρ/τ)^m`. Thus the recentred coefficients decay on every `ρ<r`. The same bound justifies interchanging the two convergent sums and proves equality on the whole ball; the strong triangle inequality identifies the two balls. The case `r=∞` uses an arbitrary finite `τ`. Coefficients are unique by Mathlib `HasFPowerSeriesAt.eq_formalMultilinearSeries`; vanishing on an open subset forces all coefficients at an interior point to vanish, hence `f = 0` on the whole ball after recentring. At `a = 0, r = 1` the coefficient map identifies the ring with the Amice target `R⁺` of LocallyAnalyticDistributions Layer 1.

*In `Suggested.lean`:* `discAnalytic`, `discAnalytic.restrict`, `discAnalytic.eq_zero_of_eqOn`.

*Needs:* `HasFPowerSeriesOnBall`, `Metric.ball`, `HasFPowerSeriesOnBall.fderiv`, `FormalMultilinearSeries.radius_le_radius_derivSeries`, `HasFPowerSeriesAt.eq_formalMultilinearSeries`, `AnalyticOnNhd`, `PowerSeries.IsRestricted`, LocallyAnalyticDistributions Layer 1, L0.1, `Metric.eball`.

**Checks.**

- For `K = ℂ_p`, the function `z↦``NormedSpace.logOneAdd` `K K z` restricted to `D^-(0, 1)` lies in `discAnalytic K 0 1`, with coefficients `(-1)^(n+1)/n`.
- The indicator function of `D^-(0, 1/p)` on `D^-(0, 1)` in `ℂ_p` is `AnalyticOnNhd` (locally constant) but is not in `discAnalytic ℂ_p 0 1`.
- Over `ℚ₂`, the point balls `D⁻(0,2/3)` and `D⁻(0,1)` both equal `2ℤ₂`. The series for `1/(1 − t²/2)` has coefficients `2⁻ⁿ` at degree `2n` and radius `2^(−1/2)`, with `2/3 < 2^(−1/2) < 3/4 < 1`, so it defines a member at radius `2/3` but none at radius 1. At `ρ = 3/4` the weighted coefficients are `(9/8)ⁿ`; uniqueness of the expansion at 0 excludes a replacement series. Thus restriction must retain the numerical radius bound.
- Constant functions lie in `discAnalytic K a r` for every positive `r`, including `r = ∞`.
- At `r = 0` even a constant function admits no `HasFPowerSeriesOnBall` witness, since its `r_pos` field would assert `0 < 0`. Thus radius zero cannot define this subalgebra by the same membership condition.
- The geometric series `z↦sum z^n` is in `discAnalytic ℂ_p 0 1` but its coefficient sequence is not `PowerSeries.IsRestricted` at 1 (not in the Tate algebra).

### L0.8 The unique primitive with chosen base value on an open disc

**Theorem.** Let `K` be a complete nontrivially normed ultrametric field of characteristic zero, a in `K, r` in `(0, ∞], f` in `O_K(D^-(a, r))` (L0.7), `b` in `D^-(a, r)` and `c` in `K`. There is a unique `F` in `O_K(D^-(a, r))` with `F' = f` and `F(b) = c`; explicitly `F(z) = c + sum_n f_n (z - b)^(n+1)/(n+1)` where `f(z) = sum_n f_n (z - b)^n` is the expansion at `b`. Uniqueness is among functions analytic on the whole disc; among locally analytic functions it fails (L0.9). (BT §5, p. 18; MP §5.2, item (3), p. 6.)

Standing hypotheses of this target: (C1); `b` lies in the open disc `D^-(a, r)`.

*Proof sketch.* Recentre at `b` (API recentre of L0.7): `f` is given by one series around `b` converging on `D^-(b, r) = D^-(a, r)`. Take the formal primitive of that series (L0.2); its radius equals that of `f` (L0.5 (a)), so `F` lies in the ring. `F' = f`: the termwise derivative (Mathlib `HasFPowerSeriesOnBall.fderiv`) of the primitive series is `f` by L0.3; `F(b) = c` by construction. Uniqueness: `G = F_1 - F_2` is in the ring with `G' = 0`; the expansion of `G` at `b` has `(n+1) g_(n+1) = 0` for all `n`, so `g_(n+1) = 0` in characteristic zero (uniqueness of expansions, Mathlib `HasFPowerSeriesAt.eq_formalMultilinearSeries`), hence `G` is the constant `G(b) = 0`.

*In `Suggested.lean`:* `existsUnique_primitive_disc`.

*Needs:* L0.7, L0.2, L0.3, L0.5, `HasFPowerSeriesOnBall.fderiv`, `HasFPowerSeriesAt.eq_formalMultilinearSeries`.

### L0.9 Locally analytic primitives are unique only up to locally constant functions

**Lemma.** On any nonempty open `U⊆ℂ_p`, locally analytic functions with zero derivative are exactly the locally constant ones. Nonconstant examples exist, such as indicators of clopen discs. Given a locally analytic `primitive F`, all such primitives are `F+LC(U)`, an infinite-dimensional affine space. A fixed value determines a whole-disc analytic primitive on `D⁻(0,1)` (L0.8), but does not determine a locally analytic primitive, including on `P¹(ℂ_p)∖{0,1,∞}`. (BH §1.2, p. 2; F §3.1, before Thm. 3.3, p. 15.)

*Proof sketch.* (a) Near each point `g` is a power series with zero derivative, hence constant near that point (L0.8 uniqueness part); conversely a locally constant function is analytic at every point with zero series beyond the constant term. (b) Open discs in `ℂ_p` are also closed, so their indicators are locally constant; `U` contains infinitely many disjoint discs. (c) Compare with L0.8; locally analytic primitives on `ℤ_p` modulo locally constant functions are the objects of LocallyAnalyticDistributions Layer 1.

*In `Suggested.lean`:* `exists_locallyConstant_nonconst`.

*Needs:* L0.7, L0.8, `AnalyticOnNhd`, `IsLocallyConstant`, LocallyAnalyticDistributions Layer 1.

### L0.10 Convergence of the logarithm series on the open unit disc

**Lemma.** Let `K` be a complete nontrivially normed ultrametric field of characteristic zero (for example `ℂ_p` or a finite extension of `ℚ_p`). The Tau Ceti series `NormedSpace.logOneAddSeries` `K K` has radius at least 1, the Tau Ceti function `log(1 + u) :=` `NormedSpace.logOneAdd` `K K u` equals `sum_{n≥1} (-1)^(n+1) u^n/n` for `||u|| < 1`, satisfies `HasFPowerSeriesOnBall` `(logOneAdd K K) (logOneAddSeries K K) 0 1`, and its derivative is `1/(1 + u)` on the open unit disc. (Tau Ceti proves the radius bound only under `ContinuousSMul` `Q≥0 K`, which fails for p-adic fields; this lemma supplies the ultrametric case.) (BBK §2, opening paragraph, p. 3; F §2.1, p. 7.)

Standing hypotheses of this target: `K` complete, nontrivially normed, ultrametric, `CharZero`.

*Proof sketch.* By L0.1, `||(-1)^(n+1)/n|| ≤ n^s`, so `||c_n|| r^n` is bounded for every `r < 1`; hence radius `≥ 1` by the bound criterion for Mathlib `FormalMultilinearSeries.radius`. `HasFPowerSeriesOnBall` on the ball of radius 1 follows from the radius bound as in the proof of Tau Ceti `NormedSpace.hasFPowerSeriesOnBall_logOneAdd`, which uses the radius only. The derivative: the termwise derivative is `sum (-1)^n u^n = 1/(1 + u)`; formally this is Mathlib `PowerSeries.derivative_log_mul_one_add_X`.

*In `Suggested.lean`:* `one_le_radius_logOneAddSeries_of_ultrametric`, `hasFPowerSeriesOnBall_logOneAdd_of_ultrametric`, `hasDerivAt_logOneAdd_of_ultrametric`.

*Needs:* L0.1, `NormedSpace.logOneAdd`, `NormedSpace.logOneAddSeries`, `NormedSpace.hasFPowerSeriesOnBall_logOneAdd`, `FormalMultilinearSeries.radius`, `HasFPowerSeriesOnBall`, `PowerSeries.derivative_log_mul_one_add_X`.

**Checks.**

- At `u = 0`, the series has value zero and derivative 1.
- Over `ℚ₂`, `u = 2` lies in the convergence disc and the derivative at that point is `1/3`.
- The point `u = −1` has norm 1 and is excluded; the reciprocal derivative has a pole there.

### L0.A1 Laurent carriers of annuli

Import `A_K(I)`, its coefficient/convolution algebra, Gauss norms, completeness and restriction from PadicDifferentialEquationsAndRigidCohomology RD.0.1–RD.0.2, compact preparation, finite Newton breaks and the dominant-term unit criterion from RD.0.18, and its derivation from RD.0.36. The end germ is that supplier’s `RobbaRing`. The notation `O_K(I)` and `LaurentOn K I` denotes this same carrier. The coefficient predicates and operations in `Suggested.lean` are adapters to this supplier, including its convolution and Gauss norms. L0.A1 records adapters to that unit criterion; L0.A2 adds point evaluation and point-count corollaries of compact preparation. Coordinate pullback and logarithmic primitives use the same carriers.

**Definition.** Let `K` be a complete nontrivially normed ultrametric field and `I ⊆ (0, ∞)` a nonempty interval of radii. `I` may be open, closed, half-open, unbounded above or a single radius, and its endpoints need not lie in `|K^×|`. The Laurent carrier `O_K(I)` consists of the two-sided coefficient families `a` : `ℤ → K`, written `f = Σ_{n∈ℤ} a_n T^n`, with `‖a_n‖ρ^n → 0` as `|n| → ∞` for every `ρ ∈ I` (`IsLaurentOn I a`). For a centre `e ∈ K` and `0 ≤ r < s ≤ ∞`, the ring of the open annulus `A(e; r, s) = {r < |z − e| < s}` is `O_K(A(e; r, s)) := O_K((r, s))`, read in the coordinate `T = z − e`. The centre changes the interpretation, not the coefficient algebra. Around `∞` use the coordinate `1/z`. Addition is coefficientwise. The product is the two-sided Cauchy product `c_n = Σ_{m∈ℤ} a_m b_{n−m}` (`laurentMul`). For fixed `n` and `ρ ∈ I` the terms satisfy `‖a_m b_{n−m}‖ρ^n = (‖a_m‖ρ^m)(‖b_{n−m}‖ρ^{n−m}) → 0` as `|m| → ∞`, so each `c_n` converges in the complete ultrametric field `K`. For `ρ ∈ I` and `f ≠ 0` the `ρ`-Gauss norm `|f|_ρ := sup_n ‖a_n‖ρ^n` (`laurentGaussNorm`) is a maximum. It is attained at a nonempty finite set of indices, with least element `n_ρ(f)` and greatest element `N_ρ(f)`. With these operations `O_K(I)` is a commutative `K`-algebra and an integral domain, and every `|·|_ρ` with `ρ ∈ I` is a multiplicative ultrametric norm on it. `O_K(I)` is complete for the topology of all `|·|_ρ, ρ ∈ I`. The carrier is not a subring of Mathlib's `LaurentSeries K` (`HahnSeries ℤ K`, whose supports are bounded below): when `inf I = 0` a member may have infinitely many negative terms, and a formal Laurent series need converge at no radius. (Lazard 1962, §1, (1.1)–(1.3), p. 48, and (1.7)–(1.9), p. 49; §2, Prop. 1, pp. 50–51, and (2.5)–(2.6), p. 51; Kedlaya pde, Def. 8.1.1, p. 136, Def. 8.2.1, p. 138, Props. 8.2.3 and 8.2.5, pp. 138–139, and §8.4, Defs. 8.4.1–8.4.3, pp. 143–144.)

Standing hypotheses of this target: `K` complete, nontrivially normed and ultrametric. Characteristic zero is not used here; it enters with primitives in L0.12. `I ⊆ (0, ∞)` is a nonempty interval. Each weighted term `‖a_n‖ρ^n` is log-affine in `log ρ`, so decay at two radii gives decay in between. Hence `O_K(S) = O_K(hull S)` for every nonempty set `S` of positive radii, and the Lean statements are made for such sets.

- `IsLaurentOn`: the predicate on `a` : `ℤ → K`, quantified over `ρ ∈ I`.
- `LaurentOn K I`: the `K`-algebra `O_K(I)` of such families with coefficientwise sum and `laurentMul`. `LaurentOn.coeff n` is the `n`-th coefficient, and two elements are equal when all coefficients agree.
- `IsLaurentOn.laurentMul`: the Cauchy product of two members converges coefficientwise and is a member. The product is commutative and associative, distributes over the sum, and has unit `Pi.single 0 1`.
- `laurentGaussNorm`: `|f|_ρ = sup_n ‖a_n‖ρ^n`. For `f` in the carrier and `ρ ∈ I` it is attained, and `laurentGaussNorm_eq_zero_iff` gives `|f|_ρ = 0` iff `f = 0`.
- `laurentGaussNorm_add_le`: `|f + g|_ρ ≤ max(|f|_ρ, |g|_ρ)`.
- `laurentGaussNorm_laurentMul`: `|fg|_ρ = |f|_ρ |g|_ρ`, with `n_ρ(fg) = n_ρ(f) + n_ρ(g)` and `N_ρ(fg) = N_ρ(f) + N_ρ(g)`. Hence `O_K(I)` is a domain.
- `laurentGaussNorm_logConvex`: for `f ≠ 0, log |f|_ρ` is a convex function of `log ρ` on `I`. On each compact subinterval of `I` it is piecewise affine with finitely many breaks, as supplied by RD.0.18. Its left and right slopes at `ρ` are `n_ρ(f)` and `N_ρ(f)`, and `n_ρ(f) < N_ρ(f)` only at the breaks. In particular the conditions at the two endpoints of a compact interval give the condition at every radius in between. This is the supporting-value geometry of the integer-indexed height sequence `n ↦ −log‖a_n‖` (TauCetiRoadmap NewtonPolygons §§0.3 and 0.5) at slope `log ρ`.
- `LaurentOn.complete`: a sequence that is Cauchy for every `|·|_ρ, ρ ∈ I`, converges in `O_K(I)`. It suffices to test the endpoints of a sequence of compact subintervals exhausting `I`.
- `IsLaurentOn.mono` and `LaurentOn.restrict`: for `J ⊆ I` the identity on coefficients is an injective `K`-algebra map `O_K(I) → O_K(J)` preserving every `|·|_ρ` with `ρ ∈ J`. Restrictions compose, and `O_K(I)` is the inverse limit of the `O_K(J)` over compact `J ⊆ I`.
- `LaurentOn.endGerm`: the end germ ring `R := colim_{r→1} O_K((r, 1))` along these injective maps. It is realized as the union over `r < 1` of the carriers inside the families `ℤ → K`, identified with the imported `RobbaRing` of RD.0.1, with the topology of RD.0.2. At a point `e` of `D, R_e` is this ring in the coordinate `z − e`.
- `LaurentOn.ofPowerSeries`: a power series converging on the open disc of radius `s` (TauCetiRoadmap RestrictedPowerSeries §7.1, or §7.2 for entire series when `s = ∞`), extended by zero on negative indices, lies in `O_K(I)` for every `I ⊆ (0, s)`. On `(0, s)` this is the coefficient map at the centre of the whole-disc functions of L0.7.
- `LaurentOn.decomp`: for `I = (r, s)`, every `f` decomposes uniquely as `f⁺ + f⁻`. Here `f⁺ = Σ_{n≥0} a_n T^n` converges on `|T| < s`, and `f⁻ = Σ_{n<0} a_n T^n` is a series without constant term in `w = T^{-1}` converging on `|w| < 1/r` (entire in `w` when `r = 0`).
- `LaurentOn.derivative`: the termwise derivative `d/dT`, with coefficient `(n + 1)a_{n+1}` at `T^n`, is a `K`-derivation of `O_K(I)` with `|df|_ρ ≤ ρ^{-1}|f|_ρ`. Its kernel is `K` when `K` has characteristic zero, and the coefficient of `T^{-1}` in every `df` is 0.
- `isUnit_laurentOn_iff`: the adapter to RD.0.18’s dominant-term inverse criterion: `f` is a unit of `O_K(I)` iff a single index `j` dominates at every radius, that is, `‖a_n‖ρ^n < ‖a_j‖ρ^j` for all `n ≠ j` and all `ρ ∈ I`. On a compact `I = [ρ₁, ρ₂]` this reads `n_{ρ₁}(f) = N_{ρ₂}(f)`. Then `f = a_j T^j (1 + h)` with `|h|_ρ < 1` for every `ρ ∈ I`, and `f^{-1} = a_j^{-1} T^{-j} Σ_{k≥0} (−h)^k`.
- `exists_subinterval_single_dominant`: if `f ≠ 0` and `I` has nonempty interior, some open interval `(ρ₁, ρ₂) ⊆ I` carries a single dominant index. So `f` restricts to a unit of `O_K((ρ₁, ρ₂))`.
- `LaurentOn.pullback`: let `u ∈ K` with `|u| = 1`, and let `h ∈ O_K(I)` have `|h|_ρ < 1` for every `ρ ∈ I`. The substitution `t = uT(1 + h)` sends `g = Σ b_n t^n` in `O_K(I)` to `Σ b_n u^n T^n (1 + h)^n` in `O_K(I)`. It is a `K`-algebra automorphism preserving every `|·|_ρ`, and it commutes with `d` through `dt = t′(T) dT`. The power `(1 + h)^n` for `n < 0` uses the unit criterion.

*Construction.* Read the coefficient identities, completeness, restriction and derivation below on the imported carriers; the corresponding local names are adapters. Membership and the Cauchy product are as stated. For convergence of the product family at `ρ ∈ I`: given `ε > 0`, only finitely many `m` have `‖a_m‖ρ^m ≥ ε/(|f|_ρ + |g|_ρ + 1)`, and similarly for `g`. So `‖c_n‖ρ^n ≤ max_m ‖a_m‖ρ^m ‖b_{n−m}‖ρ^{n−m}` tends to 0 as `|n| → ∞` (Lazard, Prop. 1, pp. 50–51). For multiplicativity, take `i = n_ρ(f)` and `j = n_ρ(g)`. Every other pair `(m, i + j − m)` has one factor strictly below its maximum. So the coefficient of index `i + j` has norm exactly `|f|_ρ|g|_ρ ρ^{-(i+j)}`, and no coefficient exceeds it. The same argument with `N_ρ` gives the upper indices.

For convexity and finite breaks: `log(‖a_n‖ρ^n)` is affine in `log ρ`, and the supremum of these affine functions is convex. On `[ρ₁, ρ₂] ⊆ I, ‖a_n‖ρ^n ≤ ‖a_n‖ρ₂^n` for `n ≥ 0` and `‖a_n‖ρ^n ≤ ‖a_n‖ρ₁^n` for `n < 0`. Both bounds tend to 0. Meanwhile `|f|_ρ ≥ ‖a_k‖min(ρ₁^k, ρ₂^k) > 0` for any `k` with `a_k ≠ 0`. So only finitely many indices can dominate on `[ρ₁, ρ₂]`, and a maximum of finitely many affine functions has finitely many breaks (Lazard (1.8)–(1.9), p. 49; Kedlaya Prop. 8.2.3, pp. 138–139). For completeness: each coefficient functional is bounded by `ρ^{-n}`, so coefficientwise limits exist, and the limit family satisfies the decay condition at each `ρ` by the usual `ε/3` argument (Kedlaya Prop. 8.2.5, p. 139). The decomposition `f = f⁺ + f⁻` splits the coefficient family; the two halves are the open-disc series of RestrictedPowerSeries §7.1 in `T` and in `T^{-1}`.

For units and finite Newton breaks use RD.0.18 on compact subintervals, with its dominant-term inverse criterion. Restrictions of the resulting inverses agree by uniqueness, and completeness on the imported carrier gives the inverse on `I`. The dominant index is locally constant and hence constant on the interval `I`. The sub-interval assertion follows by choosing an interval between consecutive Newton breaks in a compact subinterval of the interior. These give the local adapter names without a second preparation theorem.

For the pullback: at each `ρ, |b_n u^n T^n ((1 + h)^n − 1)|_ρ ≤ |b_n|ρ^n |h|_ρ`. So the substituted series converges in every Gauss norm, and the dominance of the leading term preserves each Gauss norm. The inverse substitution comes from the Neumann series of (pullback along `uT`)`^{-1}` ∘ (pullback along `t`) `− 1`, which is strictly contracting for each `|·|_ρ`. The derivation commutes with substitution because both sides are continuous and agree on Laurent polynomials.

*In `Suggested.lean`:* `IsLaurentOn`, `laurentGaussNorm`, `laurentMul`, `IsLaurentOn.mono`, `IsLaurentOn.laurentMul`, `laurentGaussNorm_laurentMul`, `isUnit_laurentOn_iff`, `exists_subinterval_single_dominant`.

*Needs:* PadicDifferentialEquationsAndRigidCohomology RD.0.1–RD.0.2 (carriers, convolution, Gauss norms, completeness and restriction), RD.0.18 (compact preparation, finite Newton breaks and units), RD.0.36 (derivation); `IsUltrametricDist`, `CompleteSpace`, TauCetiRoadmap RestrictedPowerSeries §§1.1, 3.2, 7.1–7.2, TauCetiRoadmap NewtonPolygons §§0.3 and 0.5, `LaurentSeries` (comparison only), L0.7.

**Checks.**

- Over `ℚ_p` the family `a_n = p^{|n|}` lies in `O((1/p, p))`: `‖a_n‖ρ^n = (ρ/p)^n` for `n ≥ 0` and `(pρ)^n` for `n < 0`. It does not lie in `O((1/p, p²))`, because at any `ρ ∈ (p, p²)` the terms `(ρ/p)^n → ∞`. So the radius condition is not vacuous.
- Over `ℚ_p` take `a_{−n} = p^{n²}` for `n ≥ 0` and `a_n = 0` for `n > 0`. This family lies in `O((0, ∞))`, since `p^{−n²}ρ^{−n} → 0` for every `ρ > 0`, but its support is not bounded below. It is the coefficient family of no element of Mathlib's `LaurentSeries`.
- Over `ℚ_p, |T + p|_1 = max(1, p^{-1}) = 1`; a weighted `ℓ¹` norm would give `1 + p^{-1}`. For a multiplicativity witness take `f = T + p` and `g = T^{-1} + p`, so `fg = 1 + p² + pT + pT^{-1}`. At `ρ = 1, |f|_1|g|_1 = 1 = |fg|_1`. At `ρ = p^{-2}, |f|_ρ = p^{-1}, |g|_ρ = p²` and `|fg|_ρ = max(1, p^{-3}, p) =` p.
- `T − p` is a unit of `O((1/p, 1))`: index 1 dominates for every `ρ > 1/p`, and the inverse is `Σ_{k≥0} p^k T^{−k−1}`. It is not a unit of `O((p^{-2}, 1))`, nor of `O({1/p})`. At `ρ = 1/p` the indices 0 and 1 tie, since `‖1‖ p^{-1} = ‖p‖`, and `T = p` is a zero on that circle. On the compact `[p^{-2}, 1]` the criterion fails as `n_{p^{-2}} = 0 ≠ 1 = N_1`.
- `d(T^{-1}) = −T^{-2}` and `d(T^0) = 0`. The `T^{-1}-`coefficient of every derivative is 0, so the family `Pi.single (−1) 1` is not a derivative.

### L0.A2 Points, the maximum principle on circles and the identity principle

**Theorem.** Let `f = Σ a_n T^n` lie in `O_{ℂ_p}(I)`, with `I ⊆ (0, ∞)` a nonempty interval and centre `e ∈ ℂ_p`. This covers every complete subfield `K` of `ℂ_p`, through the isometric inclusion of coefficients. Write `A_I(ℂ_p) = {z ∈ ℂ_p : |z − e| ∈ I}`.

(a) For `z ∈ A_I(ℂ_p)` the series `f(z) = Σ a_n (z − e)^n` converges (`laurentSeriesEval`). Evaluation at `z` is a ring homomorphism `O(I) → ℂ_p`, compatible with restriction and with the pullbacks of L0.A1. On power series it agrees with the whole-disc functions of L0.7.

(b) `|f(z)| ≤ |f|_{|z−e|}` for every `z ∈ A_I(ℂ_p)`.

(c) If `ρ ∈ I` lies in `|ℂ_p^×| = p^ℚ`, then `|f(z)| = |f|_ρ` for some `z` with `|z − e| = ρ`. Hence `|f|_ρ` is the maximum of `|f|` on that circle. Since `ρ ↦ |f|_ρ` is continuous on `I` (L0.A1), the values of `f` on `A_I(ℂ_p)` determine its Gauss norms on the closure of `I ∩ p^ℚ` in `I`. That is all of `I` unless `I` is a single radius outside `p^ℚ`, whose circle has no `ℂ_p`-points.

(d) If `f ≠ 0` and `ρ₁ ≤ ρ₂` lie in `I`, then `f` has only finitely many zeros `z` with `ρ₁ ≤ |z − e| ≤ ρ₂`. Counted with multiplicity there are `N_{ρ₂}(f) − n_{ρ₁}(f)` of them, with `N` and `n` the greatest and least dominant indices of L0.A1.

(e) (Identity principle.) Suppose `f` vanishes on an infinite subset of a closed sub-annulus `ρ₁ ≤ |z − e| ≤ ρ₂` with `ρ₁, ρ₂ ∈ I`. Then `f = 0`. This applies in particular when `f` vanishes on a nonempty open subset of `A_I(ℂ_p)`, or on a whole circle `|z − e| = ρ` with `ρ ∈ I ∩ p^ℚ`.

(Lazard 1962, (1.1), p. 48; Prop. 2, pp. 53–54; Prop. 4, p. 55; Kedlaya pde, Prop. 8.3.2, p. 141. The closed-disc analogue of (b)–(c) is TauCetiRoadmap RestrictedPowerSeries §2.4.)

Standing hypotheses of this target: `p` any prime, including 2; coefficients in `ℂ_p` (Mathlib `PadicComplex`); `I ⊆ (0, ∞)` a nonempty interval. Points are taken in `ℂ_p`, not in the coefficient field.

- `laurentSeriesEval`: the value `Σ' a_n w^n` at `w = z − e`. `laurentSeriesEval_add`, `laurentSeriesEval_laurentMul` and `laurentSeriesEval_one` hold on `A_I(ℂ_p)`.
- `norm_laurentSeriesEval_le`: (b).
- `laurentGaussNorm_eq_max_on_circle`: (b) and (c) on the circle of radius `‖c‖`, for nonzero `c ∈ ℂ_p` with `‖c‖ ∈ I`.
- `finite_zeros_closedSubannulus`: (d), the finiteness part. `card_zeros_closedSubannulus` is the count with multiplicity.
- `eq_zero_of_eval_eq_zero_on_open`: (e) for a nonempty open subset of `A_I(ℂ_p)`.
- `LaurentOn.eval_injective`: if `I` is not a single radius outside `p^ℚ`, two members with equal values on `A_I(ℂ_p)` are equal.

*Proof sketch.* (a) `|a_n (z − e)^n| = ‖a_n‖ρ^n → 0` with `ρ = |z − e|`. Multiplication commutes with evaluation by absolute convergence of the double series in the ultrametric field `ℂ_p`. (b) is the ultrametric inequality.

(c) Pick `c` with `|c| = ρ` and put `b_n = a_n c^n`. Then `f(e + cw) = Σ b_n w^n` for `|w| = 1`, with `|b_n| → 0` in both directions. The value `|f|_ρ = |b_j|` for a dominant index `j` lies in `|ℂ_p^×|`. After dividing by `b_j`, the reduction is a nonzero Laurent polynomial over the residue field `F̄_p`, nonzero only at the finitely many indices that attain the maximum. Since `F̄_p^×` is infinite, some unit `w₀` has reduction that is neither 0 nor a root. Then `|f(e + cw₀)| = |b_j| = |f|_ρ`.

(d) Apply PadicDifferentialEquationsAndRigidCohomology RD.0.18 to the restriction to `[ρ₁, ρ₂]`, obtaining `f = P·f*`, where `P` is a polynomial in `z − e` of degree `N_{ρ₂}(f) − n_{ρ₁}(f)` and `f*` is a unit of `O([ρ₁, ρ₂])` (Lazard, Prop. `4 (2)`, p. 55, built from the extremal factors of Prop. 2, pp. 53–54; Kedlaya Prop. 8.3.2, p. 141). This is the imported compact preparation factorization; the degree is its Newton-index formula. A unit has a single strictly dominant index at each radius (RD.0.18 through L0.A1). By the ultrametric equality, its value at `z` then has norm `|f*|_{|z−e|} ≠ 0`. The zeros of `f` are therefore the finitely many roots of `P`.

(e) An infinite set of zeros inside a closed sub-annulus contradicts (d) unless `f = 0`. A nonempty open `U ⊆ A_I(ℂ_p)` contains a small disc around some `z₀`. That disc lies in the circle `|z − e| = |z₀ − e|` and is infinite.

*In `Suggested.lean`:* `laurentSeriesEval`, `laurentGaussNorm_eq_max_on_circle`, `finite_zeros_closedSubannulus`, `eq_zero_of_eval_eq_zero_on_open`.

*Needs:* PadicDifferentialEquationsAndRigidCohomology RD.0.18 (compact Laurent preparation and dominant-term inverse criterion), L0.A1, L0.7, `PadicComplex`, `PadicComplex.isNonarchimedean`, TauCetiRoadmap RestrictedPowerSeries §2.4.

**Checks.**

- A Laurent polynomial `P` over `ℚ_p` lies in `O((0, ∞))`, and its value at a unit `u` is Tau Ceti's `TauCeti.laurentEval u P`. A definition summing only `n ≥ 0`, or reading `T^{-1}` as 0, would give `P(u)` wrongly for `P = T^{-1}`.
- The annulus `1/p < |z| < 1` has no `ℚ_p`-points, because `‖ℚ_p^×‖ = p^ℤ`. Vanishing on its `ℚ_p`-points says nothing, so the identity principle must test points of `ℂ_p`.
- `f = T^p − T` has `|f|_1 = 1`, but `|f(z)| ≤ p^{-1}` at every `z ∈ ℤ_p^×` by Fermat's little theorem. The maximum on the unit circle is attained at a unit of `ℂ_p` whose reduction lies outside `F_p`, never at a `ℚ_p`-point.
- `T − p` has exactly one zero on the circle `|z| = p^{-1}`, namely `z = p`, since `N_{1/p} − n_{1/p} = 1 − 0`. On `|z| = 1` it has none, and there `|f(z)| = 1 = |f|_1` at every point.
- Finite zero sets do not force vanishing. The nonzero `T^{p−1} − 1` vanishes at the `p − 1` roots of unity in `ℤ_p^×`, all on the circle `|z| = 1`, so (e) needs an infinite set.
- For `ρ = p^{√2}` the circle `|z| = ρ` has no `ℂ_p`-point. Part (c) is stated only for `ρ ∈ p^ℚ`. On `I = {p^{√2}}`, every member vanishes at all (no) points of `A_I(ℂ_p)`, which is why `LaurentOn.eval_injective` excludes that case.

### L0.11 The residue of a differential on an annulus

**Definition.** Let `K` be a complete subfield of `ℂ_p, e` in `K` a centre, `0≤r < s≤∞`, and `A = A(e; r, s) =` {`z` in `ℂ_p` : `r < |z - e| < s`} (around `∞` use the coordinate `1/z`). Let `O_K(A)` be the Laurent carrier of L0.A1: the ring of Laurent series `f = sum_{n in Z} a_n (z - e)^n, a_n` in `K`, with `|a_n| ρ^n→0` as `|n|→∞` for `ρ` in `(r, s)`, identified with functions on `A(ℂ_p)` by the injective evaluation of L0.A2. For a differential `ω = f dz` with `f` in `O_K(A), res_A(ω) := a_(-1)`. The same definition applies to the germ ring `R_e = colim_{r→1} O_K(A(e; r, 1))` of the end of a residue disc (`LaurentOn.endGerm`, L0.A1), the only case in which `A` is not a full punctured disc. (BBK §2, Def. 1, p. 3; BT §5, p. 18.)

Standing hypotheses of this target: `K` complete subfield of `ℂ_p` (or any complete ultrametric field of characteristic zero). `0≤r < s≤∞`; the residue is taken with respect to the coordinate `z - e`, oriented so that `|z - e|` increases outwards.

- `annulusResidue`: `annulusResidue A` : `(O_K(A) dz) →L[K] K, f dz↦a_(-1)`.
- `annulusResidue_d`: `annulusResidue A (d g) = 0` for `g` in `O_K(A)`.
- `annulusResidue_dz_div`: `annulusResidue A (dz/(z - e)) = 1` and `annulusResidue A ((z - e)^n dz) = 0` for `n≠-1`.
- `annulusResidue_coord`: Invariance under orientation-preserving automorphisms `t = u (z - e)(1 + h)` of A with `|u| = 1, |h| < 1`.
- `annulusResidue_inv`: Under `t = 1/(z - e)` the residue changes sign.
- `annulusResidue_restrict`: Compatible with restriction to a sub-annulus `A(e; r', s')` with `r≤r' < s'≤s` and with passage to the end germ ring `R_e`.
- `annulusResidue_laurentSeries`: For `r = 0` and `f` meromorphic at `e` (finitely many negative powers) the residue is the coefficient of `X^(-1)` of the corresponding Mathlib `LaurentSeries`.

*Construction.* Define res on `O_K(A) dz` as the `K`-linear coefficient functional `a_(-1)`. `res(dg) = 0` for `g` in `O_K(A)`: the coefficient of `(z-e)^(-1)` in `g'` is `0 * b_0 = 0`. Coordinate independence: for an automorphism `t = u (z - e)(1 + h)` of A with `|u| = 1` and `|h| < 1` on `A, dt/t = dz/(z-e) + d(log(u(1+h)))` with `log(u(1+h))` in `O_K(A)` (L0.10), so residues agree; under `t = 1/(z - e)` the orientation reverses and res changes sign. For a general Laurent differential, split off `a_(-1) dt/t`. Every remaining monomial is exact; its primitive converges on each smaller annulus by the polynomial denominator bound of L0.1. Analytic substitution (`LaurentOn.pullback`, L0.A1) commutes with `d`, so these exact terms still have zero residue. The logarithmic derivative of `t'=u t(1+h)` is `dt/t + d log(1+h)`, using L0.10. This proves coordinate invariance for the entire differential, rather than only `dt/t`.

*Needs:* L0.A1, L0.A2, `LaurentSeries`, `IsUltrametricDist`, L0.10.

**Checks.**

- On `A(0; r, s), annulusResidue (dz/z) = 1` and `annulusResidue (z^2 dz) = 0`.
- Pulling `dz/z` back along `z = 1/w` gives `-`dw`/w`, whose residue in `w` is `-1`.
- `annulusResidue` A `0 = 0`, and on a full disc (no negative powers) every residue is 0.
- For `|c - e|≥s` the form `dz/(z - c)` is analytic on A with residue 0, although as a rational form it has a pole with residue 1: the residue on `A` is not the algebraic residue at a chosen point.

### L0.12 A differential on an annulus is exact exactly when its residue vanishes

**Theorem.** Let `K` be a complete subfield of `ℂ_p` (or any complete ultrametric field of characteristic zero), `A = A(e; r, s)` an open annulus, and `ω = f dz` with `f = sum a_n (z - e)^n` in `O_K(A)`. There is `g` in `O_K(A)` with `dg = ω` if and only if `res_A(ω) = 0`; in that case `g = sum_{n≠-1} a_n (z - e)^(n+1)/(n+1) +` const, and `g` is unique up to an additive constant because `ker(d on O_K(A)) = K`. (BBK §2, Def. 1 and Rem. 2, p. 3; BT §5, p. 18.) For `K` of characteristic zero and radii in √`|K^×|`, the open-annulus case is also the degree-one part of AdicSpacesPartIV §F1.9 (*dagger-polyannulus-de-rham-cohomology* (b)), stated for the rigid open annulus. The coefficient argument here covers arbitrary real radii and the end germ, and it needs no comparison of `O_K(A)` with rigid sections.

Standing hypotheses of this target: (C1); A an open annulus or the end germ of a residue disc.

*Proof sketch.* Write `η = sum a_n t^n dt`. An analytic primitive forces `a_(-1)=0` because a derivative has no `t^(-1)` coefficient in characteristic zero. Conversely put `b_(n+1)=a_n/(n+1)` for `n ≠ -1` and `b_0=0`. The bound is `||((n+1):K)^(-1)|| ≤ |n+1|_real^σ` for a fixed `σ≥0`; the integer absolute value is real, and the annulus outer radius is not this exponent. For each positive `ρ` between `r` and `s` choose `r<ρ_minus<ρ<ρ_plus<s`. The coefficient-decay estimates at `ρ_minus` for the negative tail and at `ρ_plus` for the positive tail absorb the polynomial denominators, so the primitive converges at `ρ`. Differentiate termwise. The kernel follows coefficientwise: `(n+1)b_(n+1)=0` forces every nonconstant coefficient to vanish.

*In `Suggested.lean`:* `exists_laurent_primitive_iff`, in coefficient form on a nonempty open set of positive radii; this includes annuli with infinite outer radius.

**Checks.**

- The differential `dT/T` has residue 1 and no Laurent primitive.
- The differential `T⁻² dT` has residue zero and primitive `−T⁻¹` on every annulus avoiding zero.
- In characteristic `p`, the derivative of `T^p` is zero, so the assertion that the kernel consists of constants requires characteristic zero.

*Needs:* L0.11, L0.1, L0.5, L0.A1.

### L0.13 The logarithm series is a homomorphism on principal units

**Lemma.** Let `K` be as in L0.10. For `||u|| < 1` and `||v|| < 1, log(1 + u) + log(1 + v) = log((1 + u)(1 + v))` (note `||u + v +` uv`|| < 1`). Hence `u↦log(1 + u)` is a continuous group homomorphism from the principal units `1 + m_K` to `(K, +)`, and it vanishes at every root of unity lying in `1 + m_K`. (BBK §2, opening paragraph, p. 3.)

Standing hypotheses of this target: (C1).

*Proof sketch.* Fix `v`. On `D^-(0, 1)` the function `G(u) = log((1+u)(1+v)) - log(1+u) - log(1+v)` is analytic (composition of the series with the affine map `u |→ u + v +` uv, which maps the disc into itself). Its derivative is `(1+v)/((1+u)(1+v)) - 1/(1+u) = 0` by L0.10, so `G` is constant by the uniqueness part of L0.8, and `G(0) = 0`. Roots of unity: if `ζ^m = 1` then `m log(ζ) = log(ζ^m) = 0`, so `log(ζ) = 0` in characteristic zero.

*In `Suggested.lean`:* `logOneAdd_add_mul_of_ultrametric`.

*Needs:* L0.10, L0.8.

### L0.14 Every element of `ℂ_p^×` has a power that is `p^m` times a principal unit

**Theorem.** Import the Iwasawa decomposition from DirichletPadicLFunctions §0.6: for `x ∈ ℂ_p^×` there are `N ≥ 1` and `m ∈ ℤ` such that `‖x^N p^(−m) − 1‖ < 1`. For every such pair, `m/N = v_p(x) = −log_p ‖x‖ ∈ ℚ`. Thus `‖ℂ_p^×‖ = p^ℚ`. The supplied finite-dimensional version gives the same decomposition inside every finite extension `K/ℚ_p` in `ℂ_p`. (F §2.1, p. 7, for the branch parameter; DirichletPadicLFunctions §0.6 for the decomposition.)

Standing hypotheses of this target: `p` prime; `ℂ_p` is Mathlib's `PadicComplex p`, with `|p| = p⁻¹`. The finite-extension assertion assumes `K/ℚ_p` finite with the extended norm.

The imported `hasIwasawaDecomposition_padicComplex` and `hasIwasawaDecomposition_of_finiteDimensional` provide the pairs. Taking norms gives `‖x‖^N p^m = 1`, hence `v_p(x) = m/N`; every rational value is realized by an algebraic root of a power of `p`.

*Needs:* DirichletPadicLFunctions §0.6, `PadicComplex`, `Real.logb`.

**Checks.**

- For `x = p`, the pair `N = 1, m = 1` gives the principal unit 1 and `v_p(p) = 1`.
- For `p = 3, x = 2`, the pair `N = 2, m = 0` is admissible since `‖2² − 1‖ = 1/3`; no assumption that `x` itself is a principal unit is made.
- At `x = 0`, no pair with `N ≥ 1` satisfies the strict inequality: its left side is 1. The nonzero hypothesis is necessary.

### L0.15 The branches `log_a` of the p-adic logarithm

**Definition.** Fix a prime `p` and `a ∈ ℂ_p`. With the `iwasawaLog p` supplied by DirichletPadicLFunctions §0.6, define `log_a(x) = iwasawaLog p x + a·v_p(x)` for `x ≠ 0`, and `log_a(0) = 0`. The valuation laws and the supplied logarithm contract make this a homomorphism `ℂ_p^× → ℂ_p`, equal to the series on principal units and with `log_a(p) = a`. The supplied `IsIwasawaLog.natCast_mul_eq_of_map_mul` makes it the unique homomorphism with those properties. It kills roots of unity and satisfies `log_a(−x) = log_a(x)`. Local analyticity and `d log_a = dz/z` are L0.19. At `a = 0` this is the supplied Iwasawa logarithm on all of `ℂ_p`, including zero (L0.18). (F §2.1, p. 7; BBK §2, opening paragraph, p. 3; RJW Proof of Thm. 6.1(ii), p. 38.)

Standing hypotheses of this target: `p` prime; a in `ℂ_p`. As a Lean function on all of `ℂ_p` the value at 0 is the junk value 0.

- `padicLogBranch`: `padicLogBranch p a` : `ℂ_p→ℂ_p`, the valuation adapter `log_a` to the supplied `iwasawaLog p` (value 0 at 0).
- `IsLogBranch`: the predicate on `L` : `ℂ_p → ℂ_p` of being multiplicative on `ℂ_p^×`, equal to the logarithm series on `1 + m_(ℂ_p)` and with `L(p) = a`; `padicLogBranch p a` satisfies it (`isLogBranch_padicLogBranch`), and two functions satisfying it agree on `ℂ_p^×` (`padicLogBranch_unique`).
- `padicLogBranch_mul`: For `x, y≠0, log_a(x y) = log_a(x) + log_a(y)`.
- `padicLogBranch_p`: `log_a(p) = a`.
- `padicLogBranch_one_add`: For `||u|| < 1, log_a(1 + u) =` `NormedSpace.logOneAdd` `ℂ_p ℂ_p u` (Tau Ceti's series).
- `padicLogBranch_pow`: `log_a(x^n) = n log_a(x)` and `log_a(x^(-1)) = -log_a(x)`.
- `padicLogBranch_rootOfUnity`: If `ζ^m = 1` with `m≥1` then `log_a(ζ) = 0`; in particular `log_a(-x) = log_a(x)`.
- `padicLogBranch_unique`: A group homomorphism `ℂ_p^x→ℂ_p` that agrees with the series on `1 + m` and sends `p` to a equals `log_a`.
- `padicLogBranch_sub`: `log_b(x) - log_a(x) = (b - a) v_p(x)`.
- `padicLogBranch_hasDerivAt`: For `x≠0, log_a` has derivative `1/x` at `x` and is given on `D^-(x, |x|)` by one power series.
- `padicLogBranch_map`: For a continuous field automorphism `σ` of `ℂ_p, log_(σ a)(σ x) = σ(log_a x)` (L0.17).

*Construction.* Use the supplied `iwasawaLog p` and the rational valuation of L0.14. Additivity of `v_p` and the supplied product law give the homomorphism property on nonzero arguments. On principal units `v_p = 0`, so the series is unchanged; at `p`, its valuation is 1 and the supplied logarithm vanishes. For uniqueness, the imported branch comparison gives `N·ℓ(x) = N·iwasawaLog p x + m·a` for an admissible pair. Division by `N` and `m/N = v_p(x)` identify `ℓ` with the adapter. The value at zero is imposed separately, as `IsLogBranch` constrains only nonzero inputs. Roots of unity have zero valuation and zero supplied logarithm.

*In `Suggested.lean`:* `IsLogBranch`, `existsUnique_logBranch`.

*Needs:* DirichletPadicLFunctions §0.6 (`iwasawaLog`, `existsUnique_isIwasawaLog_padicComplex`, `IsIwasawaLog.natCast_mul_eq_of_map_mul`), L0.14, `NormedSpace.logOneAdd`, `PadicComplex`.

**Checks.**

- `padicLogBranch p a p = a` and `padicLogBranch p` a `1 = 0`.
- Every branch kills `−1`, including at `p = 2`; this is a torsion identity, not an injectivity assertion on all principal units.
- For `p = 3` and every `a`: `log_a(4) = 3 + 2*3^2 + 3^3 + 2*3^5 + 2*3^6 + 3^8 + 2*3^10 + 3^11` modulo `3^12` (PARI`/`GP).
- For `p = 5` and `ζ` in `Q_5` with `ζ^4 = 1` and `ζ = 2` mod 5: `log_a(ζ) = 0`; and `log_a(-2) = log_a(16)/4`.
- On the open ball of radius 1 around 1 the branch equals Tau Ceti's `NormedSpace.logOneAdd` composed with `u↦1 + u`.
- The series `sum (-1)^(n+1) (x - 1)^n/n` diverges at `x = p`, so no branch is given by one power series on `ℂ_p^x`.
- The zero function fails `IsLogBranch` for every `a`: even at `a = 0` it fails the nonzero logarithm at a sufficiently small nontrivial principal unit. Two branches satisfying the same series and normalization agree at every nonzero point; their unrestricted values at 0 need not agree.

### L0.16 Changing the branch of the logarithm

**Theorem.** For `a, b` in `ℂ_p` and `x` in `ℂ_p^x`: `log_b(x) - log_a(x) = (b - a) v_p(x)`, where `v_p(x) = -log_p ||x||` in `Q`. In particular all branches agree on the units `O_{ℂ_p}^x` (and on `1 + m_{ℂ_p}`), and `log_a = log_p + a v_p` with `log_p` the Iwasawa branch. (F §2.1, p. 7; BBK §2, p. 3.)

*Proof sketch.* Subtract the valuation adapters of L0.15: the common supplied `iwasawaLog p x` cancels. For arbitrary functions satisfying `IsLogBranch`, the supplied `IsIwasawaLog.natCast_mul_eq_of_map_mul` identifies each with its adapter on nonzero inputs, so the same formula holds without any assumption at zero.

*In `Suggested.lean`:* `logBranch_sub`.

*Needs:* DirichletPadicLFunctions §0.6 (`IsIwasawaLog.natCast_mul_eq_of_map_mul`), L0.15, L0.14, `Real.logb`.

**Checks.**

- At `x = p, log_b(p) − log_a(p) = b − a`.
- At `x = p², log_b(p²) − log_a(p²) = 2(b − a)`, fixing the sign and the normalization `v_p(p) = 1`; this also holds at `p = 2`.
- At any unit `x`, the difference is zero. A formula with an arbitrary nonzero branch difference on units would contradict their common principal-unit series and the finite-order residue-field reduction.

### L0.17 Compatibility of the branches with automorphisms and finite extensions

**Theorem.** (a) For continuous field automorphism `σ` of `ℂ_p`, every a in `ℂ_p` and `x` in `ℂ_p^x`: `log_(σ(a))(σ(x)) = σ(log_a(x))`; in particular the Iwasawa branch commutes with every such `σ`. (b) For a finite extension `K` of `ℚ_p` inside `ℂ_p` and a in `K, log_a(K^x)` is contained in `K`, and `log_a` restricted to `K^x` is the unique homomorphism `K^x→K` that agrees with the series on `1 + m_K` and sends `p` to a. (c) Hence the logarithms of all finite (algebraic) extensions of `ℚ_p` obtained this way are compatible under inclusion: the restriction of `log_a` from `L^x` to `K^x` is `log_a` of `K` for `K` inside `L`. (F §2.1, p. 7; DirichletPadicLFunctions §0.6 for restriction and equivariance.)

Standing hypotheses of this target: a in `ℂ_p`; for (b) and (c), `K` and `L` are finite over `ℚ_p` inside `ℂ_p` and a lies in `K`.

*Proof sketch.* Import `IsIwasawaLog.map_padicComplex_ringEquiv`, `IsIwasawaLog.mem_intermediateField`, `IsIwasawaLog.map_algHom` and finite-extension restriction from DirichletPadicLFunctions §0.6. A continuous field automorphism of `ℂ_p` is isometric: it fixes `ℚ_p`, preserves the algebraic closure with its unique extended norm, and then preserves the norm on its completion by density. Consequently it fixes `v_p(x) ∈ ℚ`. Apply it to `iwasawaLog p x + a·v_p(x)` to get (a). For (b), the supplied logarithm preserves `K`, and `a·v_p(x)` belongs to `K` when `a ∈ K`. The supplied branch comparison gives uniqueness inside `K`. Part (c) follows from restriction of the supplied logarithm and the valuation.

*In `Suggested.lean`:* `IsLogBranch.map_ringEquiv`, `IsLogBranch.mem_intermediateField`, on nonzero inputs.

*Needs:* DirichletPadicLFunctions §0.6 (finite-extension restriction, `IsIwasawaLog.map_algHom`, `IsIwasawaLog.mem_intermediateField`, `IsIwasawaLog.map_padicComplex_ringEquiv`, `IsIwasawaLog.natCast_mul_eq_of_map_mul`), L0.15, L0.14.

**Checks.**

- At `x = p`, equivariance reads `log_(σ(a))(p) = σ(a)`. For `σ(a) ≠ a`, the fixed branch `log_a` does not commute with `σ`.
- For `K = ℚ_3` and `a ∈ K`, `log_a(4)` is the same convergent principal-unit series in `K` and `ℂ_3`; it is unchanged in every finite extension containing `K`.
- If `a ∉ K`, the conclusion `log_a(K^×) ⊂ K` fails already at `p`, since `log_a(p) = a`. The branch-parameter hypothesis is necessary even though the zero branch always preserves `K`.

### L0.18 The Iwasawa logarithm `log_p`

**Definition.** Use the `iwasawaLog p` supplied by DirichletPadicLFunctions §0.6 as `log_p` on all of `ℂ_p`. It has value 0 at zero, is the unique homomorphism on `ℂ_p^×` with the principal-unit series and value 0 at `p`, commutes with continuous field automorphisms, and restricts to the supplied intrinsic logarithm of every finite extension `K/ℚ_p` inside `ℂ_p`. L0.15 gives `padicLogBranch p 0 = iwasawaLog p`, including at zero, and `log_a = log_p + a·v_p` on nonzero inputs. This is the same logarithm used in the supplied p-adic `L`-function and in Layer L3. (RJW Thm. 6.1(ii), p. 36; F §2.1, p. 7.)

Standing hypotheses of this target: `p` prime.

- `iwasawaLog`: the supplied `iwasawaLog p`, re-exported under the same name; `padicLogBranch p 0 = iwasawaLog p` as functions on all of `ℂ_p`.
- `iwasawaLog_p`: `iwasawaLog p p = 0`.
- `padicLogBranch_eq_iwasawaLog_add`: `padicLogBranch p a x = iwasawaLog p x + a * v_p(x)` for `x≠0`.
- `iwasawaLog_map`: `iwasawaLog p (σ x) = σ (iwasawaLog p x)` for continuous field automorphism `σ` of `ℂ_p`.
- `iwasawaLog_mem_of_finite`: For `K` a finite extension of `ℚ_p` inside `ℂ_p` and `x` in `K^x, iwasawaLog p x` lies in `K`.
- `iwasawaLog_of_unit`: On units of `O_{ℂ_p}` the Iwasawa logarithm agrees with every branch.
- `iwasawaLog_eq_normalizedLog`: For a finite extension `K` of `ℚ_p` inside `ℂ_p` and a homomorphism `ℓ_K` : `K^× → K` agreeing with the principal-unit series and vanishing at `p`, the inclusion of `ℓ_K(x)` into `ℂ_p` equals `iwasawaLog p x` for every `x ∈ K^×`.

*Compatibility.* Import the supplied normalization, uniqueness, restriction and equivariance laws directly. The identity with the zero-parameter adapter follows from L0.15 on nonzero inputs and from the common value 0 at zero. The comparison `iwasawaLog_eq_normalizedLog` is the supplied uniqueness theorem on the finite extension, transported by `IsIwasawaLog.map_algHom`. General-branch compatibility is L0.16–L0.17.

*Needs:* DirichletPadicLFunctions §0.6 (`iwasawaLog`, `existsUnique_isIwasawaLog_padicComplex`, `existsUnique_isIwasawaLog_of_finiteDimensional`, `IsIwasawaLog.map_algHom`, `IsIwasawaLog.mem_intermediateField`, `IsIwasawaLog.map_padicComplex_ringEquiv`), L0.15, L0.16, L0.17.

**Checks.**

- `padicLogBranch p 0 0 = iwasawaLog p 0 = 0`; the two functions agree on all of `ℂ_p`. Changing only the value at zero preserves `IsLogBranch` but breaks equality with the supplied function unless that value remains 0.
- `iwasawaLog p (p^k) = 0` for all `k`.
- At `p = 2, iwasawaLog 2 (−1) = 0` and `iwasawaLog 2 4 = 0`; the principal-unit logarithm condition alone does not fix the value at 2, whereas the normalization does.
- In `Q_3`: `iwasawaLog 3 63 = iwasawaLog 3 7`.
- `iwasawaLog` commutes with every continuous `ℚ_p`-automorphism `σ` of `ℂ_p`. If `σ(a)≠a`, then `log_a` does not commute with `σ`, as evaluation at `p` shows. An algebraic a with a nontrivial conjugate gives a discriminating example; no assertion about the fixed field of all automorphisms is needed.
- `padicLogBranch p 1` agrees with `iwasawaLog` on units but `padicLogBranch p 1 p = 1≠0`.

### L0.19 Local expansion of `log_a` and its derivative

**Lemma.** For `x_0` in `ℂ_p^x` and `z` in `D^-(x_0, |x_0|)` (so `|z| = |x_0|`): `log_a(z) = log_a(x_0) + log(1 + (z - x_0)/x_0)`, with log the series of L0.10. Hence the restriction of `log_a` to `D^-(x_0, |x_0|)` lies in `O(D^-(x_0, |x_0|))` (L0.7) with derivative `1/z`; `log_a` is locally analytic on `ℂ_p^x` with `d log_a = dz/z`. Every open disc in `ℂ_p^x` lies in a sphere `|z| =` const, so `log_a` is analytic on every such disc; its failure to be a single analytic function shows only on annuli (L0.21). (F §2.1, p. 7; BBK §2, Def. 1, p. 3.)

*Proof sketch.* `z = x_0 (1 + (z - x_0)/x_0)` with `||(z - x_0)/x_0|| < 1`; apply the homomorphism property of L0.15 and its agreement with the series on `1 + m`. The composite of the series with the affine map is given by one power series in `z - x_0` on the disc (L0.10), with derivative `(1/x_0)/(1 + (z-x_0)/x_0) = 1/z`.

*In `Suggested.lean`:* `IsLogBranch.hasDerivAt`.

**Checks.**

- At `x = p` every branch has derivative `p⁻¹`, although their values there depend on the parameter.
- At `x = 1` the derivative is 1, agreeing with the principal-unit series.
- Zero is excluded: the assigned value `log_a(0) = 0` does not give an analytic extension across zero.

*Needs:* L0.15, L0.13, L0.7, L0.10.

### L0.20 Functions with logarithmic terms on an annulus

**Definition.** Let `A = A(e; r, s)` be an open annulus (or the end germ `R_e` of a residue disc) over a complete subfield `K` of `ℂ_p` and a in `ℂ_p` a branch. The logarithmic function ring is the polynomial ring `O_K(A)[l]` in one indeterminate `l`, with the derivation `d` extending `d` on `O_K(A)` by `dl = dz/(z - e)`; it is realised on points by the ring homomorphism `ρ_a` : `O_K(A)[l]→(A(ℂ_p)→ℂ_p), sum f_k l^k↦(z↦sum f_k(z) log_a(z - e)^k)`, which commutes with `d` (L0.19) and is injective (L0.21). This is `A_log(U_x)` of Besser and `A^a_log(U_x)` of Furusho at an end; it does not depend on the local parameter (a change `t = u (z - e)(1 + h)` with `|u| = 1` replaces `l` by `l + log_a(u) + log(1 + h)`, an element of `O(A)`). (BT §5, p. 18; F §2.1, p. 7.)

Standing hypotheses of this target: `K` complete subfield of `ℂ_p`; `a∈ℂ_p`; `A=A(e;r,s), 0≤r<s`, or `colim_(r→1)O(A(e;r,1))`. Parameter changes require `u∈K, |u|=1`, and `K`-coefficient `h` with `|h|<1` on a subannulus. L0.17 gives `log_a(u)=log_p(u)∈K`.

- `AnnulusLogRing`: The ring `O_K(A)[l]` with its derivation `d, dl = dz/(z - e)`.
- `AnnulusLogRing.d_ell_pow`: `d (l^k) = k l^(k-1) dz/(z - e)`.
- `AnnulusLogRing.realize`: The ring homomorphism `ρ_a` to functions on `A(ℂ_p), l↦log_a(z - e)`.
- `AnnulusLogRing.realize_injective`: `ρ_a` is injective (L0.21).
- `AnnulusLogRing.realize_d`: `ρ_a` commutes with `d`: the derivative of `ρ_a(F)` is `ρ_a(dF/dz)`.
- `AnnulusLogRing.changeParam`: For `t = u (z - e)(1 + h), |u| = 1, |h| < 1`, the substitution `l↦l + log_a(u) + log(1 + h)` is an isomorphism compatible with `d` and `ρ_a`.
- `AnnulusLogRing.realize_branch`: `ρ_b(F) = ρ_a(F with l replaced by l + (b - a) v_p(z - e))` as functions (L0.23).
- `AnnulusLogRing.restrict`: Restriction to sub-annuli and to the end germ, through the coefficient maps of L0.A1.
- `IsLogLaurentNear`: for `c ∈ ℂ_p` and a function `L, f` is on `0 < |z − c| < 1` a polynomial `Σ_{k≤N} g_k(z) L(z − c)^k` whose coefficients `g_k` are values of members of the punctured-disc carrier `O_{ℂ_p}(A(c; 0, 1))` of L0.A1; with `L = log_a` this is the image of `O(A(c; 0, 1))[l]` under `ρ_a`.
- `IsLogLaurentAtInfty`: the same shape on `|z| > 1` in the parameter `z^{-1}`, with coefficients in `O_{ℂ_p}(A(0; 0, 1))` evaluated at `z^{-1}` and `L(z^{-1})` in place of `L(z − c)`.

*Construction.* Define the polynomial ring and extend `d` by the Leibniz rule with `dl = dz/(z - e)`. `ρ_a` is a ring homomorphism by construction; `d ρ_a = ρ_a d` by L0.19. Independence of the parameter: `log_a(t) = log_a(z - e) + log_a(u) + log(1 + h)` by L0.15, and `log(1 + h)` lies in `O(A)` by L0.10.

*In `Suggested.lean`:* `IsLogLaurentNear`, `IsLogLaurentAtInfty`.

*Needs:* L0.11, L0.15, L0.19, L0.10, L0.A1, L0.A2, L0.17.

**Checks.**

- `d l = dz/(z - e)`, and `ρ_a(l)(e + p) = a` when `r < 1/p < s`.
- On polynomials of degree 0 in `l, ρ_a` is the inclusion of `O_K(A)` as functions.
- `ρ_a(l) = log_a(z - e)` is not `ρ_a` of any element of `O_K(A)`: `dz/(z - e)` has residue 1 (L0.12).
- `ρ_b(l)-ρ_a(l)=(b-a)v_p(z-e)`. It is locally constant, and for `a≠b` it is nonconstant on `A(0;p^(-2),1)`, which contains circles of two different valuations.
- `IsLogLaurentNear` constrains `f` only on `0 < |z − c| < 1`. Changing `f` at `c` preserves it, so the expansion carries no information about the value at the puncture.

- `IsLogLaurentNear` holds for constants and `(z − c)⁻¹` (Laurent degree `−1`), even though the latter has no analytic extension across `c`.
- For a branch `L`, `z ↦ L(z − c)` satisfies `IsLogLaurentNear`; the indicator of `|z − c| < 1/p` does not, since it vanishes on an outer annulus but not on the whole punctured disc.
- `IsLogLaurentAtInfty` holds for every constant and for `z ↦ z` and `z ↦ z⁻¹`: in the parameter `t = z⁻¹` these are respectively a constant, `t⁻¹` and `t`.
- For a branch `L`, `z ↦ L(z⁻¹)` satisfies `IsLogLaurentAtInfty`; its value at `z = p⁻¹` is `L(p) = a`, fixing the parameter orientation.
- The indicator of `|z| > p` fails `IsLogLaurentAtInfty` for a branch `L`: it is zero on `1 < |z| < p` but one at `p⁻²`. An expansion on just an outer end in the parameter would force it to vanish everywhere on `|z| > 1`.

### L0.21 The logarithm is transcendental over functions on an annulus

**Lemma.** Let `A = A(e; r, s)` with `0 ≤ r < s` and a in `ℂ_p`. If `f_0`, ..., `f_n` in `O_K(A)` satisfy `sum_k f_k(z) log_a(z - e)^k = 0` for all `z` in `A(ℂ_p)`, then all `f_k = 0`. Equivalently the realisation `ρ_a` of L0.20 is injective. (F §2.1, p. 7.)

Standing hypotheses of this target: `0 ≤ r < s`, so that A contains circles of more than one radius; `K` complete subfield of `ℂ_p`.

*Proof sketch.* `n = 0`: a Laurent series vanishing as a function on `A(ℂ_p)` is zero, by the identity principle L0.A2 (e); equivalently, by L0.A2 (c) the Gauss norm `|f|_ρ` is attained on the circle `|z − e| = ρ` for `ρ ∈ |ℂ_p^×|`. Induction: take a relation of minimal degree `n ≥ 1` with `f_n ≠ 0` and apply the derivation `θ = (z - e) d/dz`: `θ(f l^k) = θ(f) l^k + k f l^(k-1)`. The combination `f_n * θ(relation) - θ(f_n) *` relation has degree `< n`, so all its coefficients vanish; its coefficient of `l^(n-1)` gives `f_n θ(f_(n-1)) - θ(f_n) f_(n-1) + n f_n^2 = 0`. Choose an open sub-annulus `A'` on which a single term dominates `f_n` (a radius interval between consecutive breaks of the Newton polygon of `f_n`, which are finite in every closed subinterval; `exists_subinterval_single_dominant`, L0.A1); there `f_n = c (z-e)^j (1 + h)` with `|h| < 1` is a unit of `O(A')` (`isUnit_laurentOn_iff`, L0.A1). Then `g = f_(n-1)/f_n` lies in `O(A')` and `θ(g) = -n, i.e`. `dg = -n dz/(z - e)` on `A'`, whose residue `-n` is nonzero in characteristic zero: this contradicts L0.12.

*In `Suggested.lean`:* `logBranch_laurent_transcendental`, with finitely many Laurent coefficient families and a pointwise vanishing hypothesis.

**Checks.**

- A relation of degree zero is the Laurent identity principle.
- A relation `f₀ + f₁ log_a(T) = 0` forces both coefficients to vanish, including when `f₁` has zeros.
- The relation with constant leading coefficient 1 would give a Laurent primitive of `dT/T`, contradicting its nonzero residue.

*Needs:* L0.12, L0.20, L0.19, L0.A1, L0.A2.

### L0.22 Logarithmic primitives on an annulus

**Theorem.** Let `A` be an open annulus (or end germ) over a complete subfield `K` of `ℂ_p`. The derivation `d` : `O_K(A)[l]→O_K(A)[l] dz` of L0.20 is surjective with kernel `K`. For `f = sum a_n (z - e)^n` the primitive of `f dz` is `res_A(f dz) l + sum_{n≠-1} a_n (z - e)^(n+1)/(n+1)` (the log-branch term appears exactly when the residue is nonzero); in general a primitive of `f l^k dz` is computed by integration by parts: writing `f dz = c dz/(z - e) + dg` (L0.12), one has integral of `f l^k dz = c l^(k+1)/(k+1) + g l^k - k` (integral of `g l^(k-1) dz/(z - e)`). Realised with a branch `a`, the definite integral between `P` and `Q` in `A` is Balakrishnan-Bradshaw-Kedlaya's formula `a_(-1) log_a((Q - e)/(P - e)) + sum_{n≠-1} a_n ((Q-e)^(n+1) - (P-e)^(n+1))/(n+1)`. (BT §5, p. 18; BBK §2, Def. 1, p. 3.)

Standing hypotheses of this target: `K` complete subfield of `ℂ_p`; A an open annulus or end germ; a a branch for the realisation.

*Proof sketch.* Surjectivity by induction on `k` using L0.12 and integration by parts; the residue of `g l^(k-1) dz/(z - e)` is handled at the previous step. Kernel: if `F = sum_{k≤n} f_k l^k` has `dF = 0` then the `l^n`-coefficient gives `df_n = 0`, so `f_n` is constant; the `l^(n-1)-`coefficient gives `df_(n-1) + n f_n dz/(z - e) = 0`, whose residue `n f_n` must vanish, so `f_n = 0` when `n ≥ 1`; finally `df_0 = 0` gives `f_0` in `K`. The realised formula follows from `ρ_a(l) = log_a(z - e)` and L0.19.

*In `Suggested.lean`:* `exists_logLaurent_primitive`, `logLaurent_derivative_eq_zero_iff`. The signatures use polynomials in the logarithm whose coefficients are Laurent families; differentiation is written coefficientwise.

**Checks.**

- `dℓ = dT/T` supplies the missing primitive of the residue-one differential.
- `d(ℓ²/2) = ℓ dT/T` holds also over `ℚ₂`, since the coefficient field has characteristic zero.
- A scalar constant has zero derivative; a nonconstant Laurent monomial or a nonconstant polynomial in `ℓ` does not.

*Needs:* L0.12, L0.20, L0.21, L0.11.

### L0.23 How a change of branch changes logarithmic primitives

**Lemma.** For `F=sum f_k l^k` in `O_K(A)[l], ρ_b(F)(z)=sum f_k(z)(log_a(z-e)+(b-a)v_p(z-e))^k`. Choose for `f dt` the coefficient primitive with constant coefficient0 and logarithmic coefficient `res_A(f dt)`, using the same additive normalization in both branches. Its branch difference is `res_A(f dt)(b-a)v_p(z-e)`, constant on each circle. It is nonconstant when `res_A(f dt)(b-a)≠0` and the annulus contains two different radii in `p^Q`. A zero-residue differential has branch-independent primitives under this common normalization; arbitrary primitives can also differ by constants. (BBK §2, p. 3; F §2.1, p. 8.)

Standing hypotheses of this target: `a, b` in `ℂ_p`.

*Proof sketch.* Substitute L0.16, `log_b(z - e) = log_a(z - e) + (b - a) v_p(z - e)`, into the realisation map of L0.20. For primitives use the explicit form of L0.22: only the `l`-coefficient `res_A(f dz)` involves the branch.

*Needs:* L0.16, L0.20, L0.22.

### L0.24 A logarithm bound on a geometric sequence

**Lemma.** For `c≠0` and every natural `m, |L(c p^m)|≤max(|L(c)|,|a|)`. (F arXiv math/0304085v2, §2.1, p. 7; Definition2.9 and Remark2.10, pp. 9–10; Proposition2.11 and Notation2.12, p. 10; Lemma2.14, p. 11.)

Standing hypotheses of this target: (C2), (C3); `c∈ℂ_p` is nonzero.

*Proof sketch.* The homomorphism law and `L(p)=a` give `L(c p^m)=L(c)+m a`, including `m=0`. The pinned ultrametric natural-cast bound gives `|m|≤1`. Apply the ultrametric triangle inequality and multiplicativity of the norm.

*Needs:* L0.15, `IsUltrametricDist.norm_natCast_le_one`, `PadicComplex.isNonarchimedean`.

**Checks.**

- At `p=2` and branch parameter `a=1, |L(2^m)|≤1` for natural `m`.

### L0.25 Logarithm of a geometric quotient

**Lemma.** For `c≠0` and every `n, L(c q_n/(1+q_n))=L(c)+(n+1)a−L(1+q_n)`. (F arXiv math/0304085v2, §2.1, p. 7; Definition2.9 and Remark2.10, pp. 9–10; Proposition2.11 and Notation2.12, p. 10; Lemma2.14, p. 11.)

Standing hypotheses of this target: (C2), (C3); `c∈ℂ_p` is nonzero.

*Proof sketch.* Since `|p|<1, |q_n|<1`; hence `q_n` and `1+q_n` are nonzero. The logarithm homomorphism gives the product and inverse laws, and `L(q_n)=(n+1)`a. Combine them in the displayed order.

*Needs:* L0.15, `Padic.norm_p_lt_one`, `PadicComplex.norm_extends'`.

### Examples

- `primitive(1) = X` and `primitive(Σ_n (−1)^n X^n) =` `PowerSeries.log` `= log(1 + X)` over any `ℚ`-algebra; over `ZMod p` no series has derivative `X^(p−1)` (L0.2).
- Over `ℚ_p` the series `Σ_k p^k X^(p^k − 1)` lies in the Tate algebra, but its `primitive Σ_k X^(p^k)` does not converge at `X = 1` (L0.6).
- For `p = 3` and every branch `a, log_a(4) = 3 + 2·3² + 3³ + 2·3⁵ + 2·3⁶ + 3⁸ + 2·3¹⁰ + 3¹¹` modulo 3¹², since 4 is a principal unit (L0.15); `log_b(p²) − log_a(p²) = 2(b − a)` (L0.16).
- On the annulus `A(0; r, s)` the form `dz/z` has residue 1 and is not exact; its primitive in the logarithmic ring is the symbol `l`, realized as `log_a(z)` (L0.11, L0.20, L0.22).
- The indicator of `D⁻(0, 1/p)` on `D⁻(0, 1)` is locally analytic with derivative 0 but not in the ring of functions analytic on the whole disc (L0.7, L0.9).
- Over `ℚ_p, z − p` is a unit on `A(0; 1/p, 1)` with inverse `Σ_{k≥0} p^k z^{−k−1}`, but not on `A(0; p^{-2}, 1)`, where its two coefficients tie at `ρ = 1/p` and `z = p` is a zero. The family `Σ_{n≥0} p^{n²} z^{−n}` lies in the carrier of the punctured plane but is no formal Laurent series (L0.A1, L0.A2).

### Dependencies

Mathlib (power series, analytic functions, `PadicComplex`); Tau Ceti `NormedSpace.logOneAdd`; TauCetiRoadmap RestrictedPowerSeries §§1.1, 2.4, 3.2, 7.1–7.2 and NewtonPolygons §§0.3, 0.5 (one-sided Gauss norms, open-disc and entire series and supporting values, which L0.A1–L0.A2 extend to Laurent carriers of annuli); LocallyAnalyticDistributions Layer 1 (the Amice target `R⁺`).

## Layer L1: Frobenius continuation and Coleman functions

Construct the shuffle word algebra, its local solutions and its Frobenius realization from a good-reduction datum. The punctured-line instances supply explicit cohomology bases and arithmetic `q`-power lifts. The general-curve existence, scalar extension, meromorphic pole removal and Taylor-gluing inputs must be supplied with the hypotheses stated below; the genus-zero calculation does not prove those general statements.

Coefficient convention for the `ℂ_p`-valued Coleman targets: put `A = A_K⁺(Y)`, `B = A ⊗_K ℂ_p`, `Ω_B = Ω_K⁺(Y) ⊗_K ℂ_p` and `U_B = U(A; ω) ⊗_K ℂ_p`. All these tensor products are algebraic. In those targets, `A⁺`, `Ω⁺`, `U` and `ρ` after coefficient extension mean `B`, `Ω_B`, `U_B` and its `ℂ_p`-linear realization. The local analytic rings still have full `ℂ_p` coefficients. The full dagger algebra `A_Cp,full⁺ = colim_r O(W_(r,ℂ_p))` is a different coefficient ring; it enters only the comparison in L1.17. Generic dagger constructions remain those of AdicSpacesPartIV F1; algebraic coefficient extension and the meromorphic descent needed here are L1.17a.

### L1.1 A curve with good reduction and an etale divisor

**Definition.** Fix finite `K/ℚ_p⊆ℂ_p`, with integers `O_K`, uniformizer `π` and residue field `F_q`. A good-reduction pair is a smooth proper geometrically connected relative curve `X/O_K` together with nonempty finite étale `D⊆X`. Set `Y=X∖D`, an affine `O_K`-scheme. Distinct geometric points of `D` have distinct reductions; over `O_Cp` they correspond to `D_k(F̄_p)`. This gives Furusho's good-reduction hypothesis and Besser's tight triple. Scope requires descent to finite `K`; unipotence is imposed on the connections, rather than on `X`. (F Assumption 2.1, p. 7; BBK §2, Def. 3, p. 3; BT §5, p. 17-18.)

Standing hypotheses of this target: `K` finite over `ℚ_p`, contained in `ℂ_p`; `k = F_q`. `X→Spec O_K` smooth, proper, relative dimension 1, geometrically connected fibres. `D` a nonempty closed subscheme of `X`, finite etale over `O_K`; `Y = X - D`.

- `GoodReductionPair`: The data `(X, D)` over `O_K` with the smoothness, properness, relative dimension, geometric connectedness and finite etaleness hypotheses as fields.
- `GoodReductionPair.affineComplement`: `Y = X - D`, with IsAffine `Y`.
- `GoodReductionPair.residueClasses`: The set `X_k(F_p-bar)` of residue classes, with the ends `D_k(F_p-bar)` marked.
- `GoodReductionPair.frobenius`: The `q`-power Frobenius `F` on `X_k(F_p-bar)`: a bijection with finite orbits, preserving `D_k`.
- `GoodReductionPair.baseChange`: Base change along a finite extension `K→K'` inside `ℂ_p` gives a good-reduction pair over `O_K'`.
- `GoodReductionPair.puncturedLine`: `(P^1, {0, ∞} u μ_N)` over `ℤ_p[μ_N]` for `p` not dividing `N` (L1.25).
- `GoodReductionPair.D_reduction_injective`: Reduction `D(O_Cp)→D_k(F_p-bar)` is a bijection.

*Construction.* Package the data with Mathlib's morphism properties Mathlib `AlgebraicGeometry.Smooth`, Mathlib `AlgebraicGeometry.IsProper`, Mathlib `AlgebraicGeometry.IsFinite` and Mathlib `AlgebraicGeometry.Etale` on schemes (Mathlib `AlgebraicGeometry.Scheme`). `Y` is affine: `D` meets every fibre in a nonempty divisor, and a proper curve minus a nonempty finite set of closed points in each fibre is affine; record Mathlib `AlgebraicGeometry.IsAffine` as a derived property. The set of residue classes `X_k(F_p-bar)` carries the `q`-power Frobenius `F`; `F` is a bijection and every orbit is finite because every point is defined over a finite field.

*Needs:* `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.Etale`, `AlgebraicGeometry.IsAffine`.

**Checks.**

- `(P^1_{ℤ_p}, {0, 1, ∞})` is a good-reduction pair for prime `p`, with residue classes `P^1(F_p-bar)` and ends `0, 1, ∞`.
- `(P^1_{ℤ_p}, V(z(z - p)))` is not a good-reduction pair: `D` is not etale over `ℤ_p`.
- `(P^1, {0, ∞} u μ_p)` over `ℤ_p[μ_p]` is not a good-reduction pair: all `p`-th roots of unity reduce to 1.
- `(P^1_{ℤ_p}, {∞})` is a good-reduction pair with `Y = A^1`, one end and no residue class of `D` other than `∞`.

### L1.2 Wide open neighbourhoods and the dagger algebra

**Definition.** For a good-reduction pair, `X_an` is the generic fibre of its formal completion, with specialization sp. Write `]x[=sp⁻¹(x)` and `]Y_k[=sp⁻¹(Y_k)`. Choose an integral parameter `t_e` at each section `e∈D`. For `0<r<1` in `|ℂ_p^×|`, set `W_r=X_an∖`⋃`_e{|t_e|≤r}` inside the end discs. These connected wide opens are cofinal strict neighborhoods of `]Y_k[`, independently of parameters up to cofinality. Define `A⁺(Y)=colim_(r→1)O(W_r)` and `Ω⁺(Y)=colim_r Ω¹(W_r)`; identify `A⁺` with the Monsky–Washnitzer weak completion of `O(Y)` tensored with `K`. AdicSpacesPartIV §§F1.2, F1.5 and F1.9 supply the dagger algebra, the weak completion and the differentials; AdicSpacesPartIII §§R2.3–R2.4 supply fibres and tubes. (BT §5, p. 18; BBK §2, Def. 4, p. 4; F §2.1, p. 7.)

Standing hypotheses of this target: `(X, D)` a good-reduction pair; `r` ranges over `|ℂ_p^x|` intersected with `(0, 1)`.

- `wideOpen`: `wideOpen (X, D) r` : the basic wide open `W_r`, an admissible open of `X_an`.
- `daggerAlgebra`: `A+(Y) = colim_r O(W_r)`, the dagger algebra (carrier from AdicSpacesPartIV §F1.2, *dagger-algebra*).
- `daggerDifferentials`: `Ω+(Y) = colim_r Ω^1(W_r)`, a projective `A+(Y)-`module of rank one with the derivation `d`.
- `mem_tube_iff`: `x` lies in `]Y_k[` iff `sp(x)` is in `Y_k`.
- `wideOpen_anti`: `r≤r'` implies `W_r'` is contained in `W_r`; the `W_r` are cofinal among strict neighbourhoods.
- `wideOpen_param_indep`: Changing the local parameters `t_e` changes the system `(W_r)` by a cofinal one and does not change `A+(Y)`.
- `daggerAlgebra_eq_weakCompletion`: `A+(Y)` is the Monsky-Washnitzer weak completion of `O(Y)` tensored with `K` (Balakrishnan-Bradshaw-Kedlaya Definition 7 for hyperelliptic curves).
- `daggerAlgebra_restrict`: Restriction maps `A+(Y)→O(]x[)` for `x` in `Y_k` and to the end germs at points of `D` (L1.3).
- `daggerAlgebra_identity`: An element of `A+(Y)` or `Ω+(Y)` whose restriction to one residue disc of `]Y_k[` vanishes is zero (identity principle on the connected smooth, hence normal, `W_r`; imported from AdicSpacesPartIV §F1.8, *dagger-identity-principle*, which transports TauCetiRoadmap AdicSpacesPartII §R1.9).

*Construction.* Residue discs and tubes: generic fibre and specialisation of AdicSpacesPartIII §§R2.3–R2.4, residue discs of §R2.9. Strict neighbourhoods: the sets `W_r` are complements of closed discs inside the residue discs of the points of `D`; cofinality under change of the `t_e` follows because two parameters differ on `]e[` by `t' = u t (1 + h)` with `|u| = 1, |h| < 1` (L1.3). Dagger algebra, weak completion and `Ω+`: imported from AdicSpacesPartIV §F1.5 (*weak-completion*, *weak-completion-generic-fibre*) and §F1.9 (*dagger-differentials*). Overconvergent sections are colimits over strict neighbourhoods (§F1.7, *strict-neighbourhood*, *overconvergent-sections-formula*). The comparison with the particular system `W_r` is `daggerAlgebra_eq_weakCompletion`. Comparison with Balakrishnan-Bradshaw-Kedlaya's wide opens `{|f| < λ}`: take `f` with poles exactly along `D`.

*Needs:* L1.1, AdicSpacesPartIV §§F1.2, F1.5, F1.7–F1.9, AdicSpacesPartIII §§R2.3, R2.4, R2.9, L0.6, L0.5.

**Checks.**

- For `(P^1, {0, 1, ∞})` with the standard parameters, `wideOpen r = {z : r < |z| < 1/r, |z - 1| > r}`.
- For `(P^1, {∞}), wideOpen r = D^-(0, 1/r)` and the dagger algebra is the ring of power series restricted at some `ρ > 1`.
- The tube ]`A^1_k`[ `= D(0, 1)` is not a wide open: its ring of functions, the Tate algebra, has non-exact differentials (L0.6), while every differential on the dagger algebra of `A^1` is exact (L0.5).

### L1.3 Residue discs are open discs and ends are annuli

**Lemma.** An integral parameter at a lift of `x` identifies `]x[` with `D⁻(0,1)`; at `e∈D` it identifies `]e[∩W_r` with `A(0;r,1)`. Changes of parameter have `t′=v+`ut`+Σ_(j≥2)a_jt^j, |v|<1, |u|=1, |a_j|≤1`. If both vanish at the same section, `v=0` and `t′=ut(1+h), |h|<1`. Construct differential-compatible restrictions `res_x`:`A⁺→O(D⁻(0,1))` and `res_e`:`A⁺→R_e`. Parameter changes preserve these rings, residues and logarithmic end rings. (BBK §2, Def. 3, p. 3; BT §5, p. 18; MP §5.2, item (1), p. 6; BH §1.3.3, Def. 2, p. 6.)

Standing hypotheses of this target: `(X, D)` a good-reduction pair; `x` a point of `X_k(F_p-bar)`.

*Proof sketch.* The formal completion of `X` along `x` is the formal disc in `t` (smoothness); its generic fibre is `D^-(0, 1)` (AdicSpacesPartIII §R2.9: *residue-disc* for a rational point, after the finite unramified extension of `K` whose residue field contains `κ(x)`, over which `residueDisc_unramified_split` splits the tube into discs). At `e` in `D` the same parameter identifies `]e[` with `D^-(0, 1)` and `W_r` intersected with `]e[` with `A(0; r, 1)`. Two integral etale parameters give inverse formal-disc coordinates. Their composition has constant term `v` in the maximal ideal and unit linear coefficient `u`. For parameters vanishing at the same section, `v=0`, so `t'/t=u(1+h)`. Translation between different lifts is handled by whole-disc recentering, not by division by `t`. Invariance of `O(D^-), R_e` and residues under such automorphisms: L0.7 (composition), the pullback of L0.A1 and the coordinate-change API of L0.11 and L0.20.

*Needs:* L1.1, L1.2, AdicSpacesPartIII §R2.9, L0.7, L0.A1, L0.11, L0.20.

### L1.4 Locally analytic functions with logarithmic ends

**Definition.** For branch `a`, define `A_loc^a(Y)=∏_(x∈X_k(F̄_p))A_log^a(x)`, with `O(]x[)` at ordinary points and `R_e[l_e]` at ends, realizing `l_e` as `log_a(t_e)`. Set `Ω_loc^a=∏_x A_log^a(x)dt_x` and differentiate componentwise. Restrictions embed `A⁺` diagonally; `ker d=∏_x ℂ_p`. The branch-change isomorphism `ι_(a,b)` is the identity on ordinary components and changes end logarithm realizations from `log_a` to `log_b`. Prove independence of local parameters. (BT §5, p. 18; BH §1.3.3, Def. 3, p. 6; F Lem. 2.2, p. 8.)

Standing hypotheses of this target: `(X, D)` a good-reduction pair; a in `ℂ_p`.

- `LocAn`: `LocAn (X, D) a` : the `ℂ_p`-algebra `A_loc^a(Y)`, product of the local rings.
- `LocAn.d`: The componentwise derivation `A_loc^a→Ω_loc^a`.
- `LocAn.ker_d`: `ker d =` LC, the functions constant on each residue class and each end.
- `LocAn.d_surjective`: `d` is surjective componentwise (L0 primitives).
- `LocAn.ofDagger`: The injective `K`-algebra map `A+(Y)→A_loc^a(Y)` by restriction.
- `LocAn.eval`: Evaluation at points of `]Y_k[(ℂ_p)`.
- `LocAn.iotaBranch`: `iota_(a,b)` : `A_loc^a→A_loc^b`, identity on residue discs of `Y_k, l_e` realised with `log_b` instead of `log_a`.
- `LocAn.paramIndep`: Changing local parameters induces the identity of `A_loc^a` (Furusho Lemma 2.2).

*Construction.* Components: L0.7 at residue discs, L0.20 at ends. Kernel of `d`: on a disc, L0.8 (uniqueness part); on an end, L0.22 (kernel `K`). Surjectivity of `d` componentwise: L0.8 and L0.22. Independence of parameters: API `changeParam` of L0.20 (Furusho Lemma 2.2).

*Needs:* L1.1, L1.2, L1.3, L0.7, L0.20, L0.8, L0.22, L0.15.

**Checks.**

- `ker(d on LocAn)` equals the locally constant functions.
- For `(P^1, {0, 1, ∞})`, the family (`log_a z` on each residue disc, `l_0` at the end `0, l_inf` with sign at `∞, log_a z` on the end at 1 as an element of `R_1`) lies in `LocAn` with `d = dz/z`.
- For `(P^1, {∞})`: `LocAn` is the product of `O(]x[)` over `x` in `F_p`-bar and `R_inf[l_inf]`.
- `iota_(a,b)` is the identity on the image of `A+(Y)` and on every component at a residue disc of `Y_k`.

### L1.5 Frobenius lifts on a wide open

**Definition.** For residue field `F_q`, a Frobenius lift is a `K`-algebra endomorphism `φ`:`A⁺→A⁺` preserving the integral weak completion `S` and reducing to `q`-power Frobenius; on `S` use `AlgHom.IsArithFrobAt` at `πS`. Extend by `φ*`(`g` dh)`=φ(g)dφ(h)`. On ordinary residue discs use componentwise composition; at removed points use pullback on sufficiently outer annuli and pass to end germs. There `φ*t_(F(e))=ut_e^q(1+h), |h|<1`, so `φ*l_(F(e))=ql_e+log_a(u)+log(1+h)`; `u` is a unit constant, making its logarithm branch independent. These maps induce pullback on `A_loc`. PadicDifferentialEquationsAndRigidCohomology RD.0 supplies existence and homotopy of lifts. (BH §1.3.2, p. 6; BT §5, p. 18; F §2.1, pp. 7–8; BBK §3.3, Algorithm 10, step 1, p. 7.)

Standing hypotheses of this target: `(X, D)` a good-reduction pair; `q = #k`. `φ` is `K`-linear (the `q`-power Frobenius of `Y_k` is `k`-linear).

- `FrobeniusLift`: `A K`-algebra endomorphism `φ` of `A+(Y)` preserving the integral weak completion `S` with `AlgHom.IsArithFrobAt` `φ (π S)`.
- `FrobeniusLift.isArithFrobAt`: The defining condition is Mathlib's `AlgHom.IsArithFrobAt` at the ideal `π S`.
- `FrobeniusLift.mapsTo`: for `x ∈ Y_k(F_p-bar)`, `φ` is defined on all of `]x[` and maps it into `]F(x)[`. At `e ∈ D_k(F_p-bar)`, for every target outer annulus `A(0; r, 1)` at `F(e)` there is a source outer annulus `A(0; r', 1)` at `e` on which `φ` is defined and maps into that target; this defines a morphism of end germs.
- `FrobeniusLift.pullback`: The induced ring endomorphism `φ^*` of `A_loc^a`, commuting with `d`.
- `FrobeniusLift.pullback_ell`: in `R_e[l_e]`, `φ^* l_(F(e)) = q l_e + c_e + log(1 + h_e)` with `c_e = log_a(u_e)` a branch-independent constant and `log(1 + h_e)` in `R_e`; the representative `h_e` satisfies `|h_e| < 1` on a sufficiently outer annulus.
- `FrobeniusLift.pow`: For `m≥1, φ^m` preserves the integral weak completion and satisfies `φ^m(x)-x^(q^m)` in `π S`. It is an iterated-exponent datum; when `m>1` it is not `AlgHom.IsArithFrobAt` at the original ideal with the original base-ring cardinality.
- `FrobeniusLift.exists`: Every good-reduction pair admits a Frobenius lift (imported from PadicDifferentialEquationsAndRigidCohomology RD.0).
- `FrobeniusLift.close`: Two lifts `φ, φ'` satisfy `|φ'(g) - φ(g)|≤|π| |g|` on the integral algebra (the input of L1.21).

*Construction.* Existence and homotopy of lifts come from PadicDifferentialEquationsAndRigidCohomology RD.0 (Frobenius lifts on weak completions), on the dagger carrier of AdicSpacesPartIV §F1.5. Its *mw-morphism-lifting* gives existence only: over the complete discrete valuation ring `O_K` of mixed characteristic, every homomorphism of smooth `k`-algebras lifts to their flat weakly complete lifts, in particular the `q`-power Frobenius of `O(Y_k)`. Homotopies between lifts are RD.0's. On the ordinary tube, integral functions are bounded and the reduction congruence implies `φ(]x[) ⊆ ]F(x)[` for `x ∈ Y_k`. At an end, first represent the dagger map on a strict neighbourhood and restrict its coordinate functions to an outer annulus. The integral Laurent expansion of `φ^* t_(F(e))` reduces to `t_e^q` times a power-series unit. Lift the constant coefficient of that unit to a constant `u_e` of norm 1. Its remaining positive terms have norm less than 1 for `|t_e| < 1`; the error divisible by `π` may have negative powers, whose overconvergence permits a larger inner radius on which their quotient by `u_e t_e^q` also has norm less than 1. Thus `φ^* t_(F(e)) = u_e t_e^q(1 + h_e)` on some outer annulus. In particular `|φ^* t_(F(e))| = |t_e|^q`, and enlarging the source inner radius puts its image in any prescribed target outer annulus. This cofinality defines pullback on `R_(F(e)) → R_e`. L0.15–L0.16 give the logarithmic formula, with branch-independent `log_a(u_e)`. The chain rule on discs and on these annular representatives makes pullback commute with `d`. A map on a whole removed disc requires a separate geometric extension preserving that disc.

*Needs:* L1.1, L1.2, L1.4, L0.15, L0.16, `AlgHom.IsArithFrobAt`, PadicDifferentialEquationsAndRigidCohomology RD.0, AdicSpacesPartIV §F1.5.

**Checks.**

- On `(P^1, {0, 1, ∞})` over `ℤ_p, z↦z^p` defines a Frobenius lift.
- On the same pair, `φ(z) = z^p + p/(z − 1)` preserves the integral weak completion: modulo `p` the images of `z` and `z − 1` are units, and their inverses lift by overconvergent geometric series. But `z = 1 + p² ∈ ]1[` has `|φ(z)| = |p⁻¹| = p > 1`, so its image is in `]∞[`. For `t = z − 1`, domination of the error `p/t` by `t^p` requires `|t|^(p+1) > |p|`, which also controls the intermediate binomial terms. This gives the end-germ map at 1 without whole-disc preservation.
- For `ζ a p`-power root of unity, `z↦ζ^(-1) z^p` is another Frobenius lift of the same curve over `ℤ_p[ζ]` (it reduces to `z^p`), not commuting with `z↦z^p`.
- `z↦p z` and `z↦z^p + 1` are not Frobenius lifts of `P^1` minus `{0, 1, ∞}`: their reductions are not the `p`-power map.
- The fixed points of `(z↦z^p)^m` on the residue discs of `U = P^1` minus `{0, 1, ∞}` are the roots of unity of order dividing `p^m - 1` other than 1.

### L1.6 Teichmueller points of residue discs

**Lemma.** Let `φ` be a Frobenius lift on a good-reduction pair `(X, D)` over `O_K` with residue field `F_q`, and `x` in `Y_k(F_(q^m))`. Then `φ^m` maps `]x[` into itself and has a unique fixed point `b_x` in `]x[`, the Teichmueller point of `]x[` (for `φ`); `φ(b_x) = b_(F(x))`. For `P^1` minus `{0, 1, ∞}` and `φ(z) = z^p` the Teichmueller point of `]x[` is the Teichmueller lift of `x`, a root of unity of order prime to p. (BBK §3.3, Def. 14, p. 8; BH §1.2, p. 3; MP Rem. 8.3 (2), p. 12.)

Standing hypotheses of this target: `x` has coordinates in `F_(q^m)`.

*Proof sketch.* `φ^m` reduces to the `q^m`-power Frobenius, which fixes `x`, so `φ^m` maps `]x[` into itself (L1.5). In a parameter `t` at `x` (L1.3), `φ^m` is `y |→ G(y)` with `G(y) = y^(q^m) + π H(y)` and `H` with integral coefficients; hence `|G(y) - G(y')| ≤ max(ρ^(q^m - 1), |π|) |y - y'|` on `D(0, ρ)` for `ρ < 1`, and `G` maps `D(0, ρ)` into `D(0, max(ρ^(q^m), |π|))`. Choose `ρ` with `|π| ≤ ρ < 1`; `G` is a contraction of the complete closed disc `D(0, ρ)` into itself, so it has a unique fixed point there; any fixed point in `]x[` lies in `D(0, |π|^(1/q^m))` by the second estimate, so it is unique in `]x[`. `φ(b_x)` is fixed by `φ^m` and lies in `]F(x)[`, hence is `b_(F(x))`.

*Needs:* L1.5, L1.3.

### L1.7 Frobenius-structured unipotent datum

**Definition.** A Frobenius datum is (`φ,ω_1`,…,`ω_r,M,g`), with `φ*ω_i=Σ_j M_ijω_j+dg_i, M∈M_r(K), g∈(A⁺)^r`. Require H0:`ker(d:A⁺→Ω⁺)=K`; H1:`η=`dh`+Σ_i c_iω_i` with `c` unique and `h` unique modulo `K`; Hi:restriction of functions and differentials to every ordinary disc is injective; Hw:for `n,m≥1, (M^(⊗n))^m` has no eigenvalue 1, equivalently no nonempty eigenvalue product is a root of unity. L1.9 supplies general existence; L1.29 gives the punctured-line datum. (BH Proof of Thm. 2, p. 8; BT §5, p. 18.)

Standing hypotheses of this target: `(X,D)` good-reduction over `O_K`; `φ K`-linear. For the `ℂ_p`-valued realization use the algebraic tensor convention above. Flatness transports `(H0)` and `(H1)` to `B`; injective restriction `(Hi)` for `B` and `Ω_B` is supplied by L1.17a. These assertions do not identify `B` with the full `ℂ_p` dagger algebra.

- `FrobeniusDatum`: The tuple `(φ, ω, M, g)` with the hypotheses `(H0), (H1)`, (Hi), `(Hw)` as hypotheses of the constructions that use them.
- `FrobeniusDatum.coords`: The `K`-linear map `Ω+→K^r, η↦c` with `η - sum c_i ω_i` exact (by H1).
- `FrobeniusDatum.frobenius_eq`: `φ^* ω = M ω + d g`.
- `FrobeniusDatum.coords_frobenius`: coords `(φ^* η) = M^T` coords `η` (the Frobenius on `H^1_dR+`).
- `FrobeniusDatum.changeBasis`: For `P` in `GL_r(K), (φ, P ω, P M P^(-1), P g)` is again a datum.
- `FrobeniusDatum.pow`: For `m≥1, (φ^m,ω,M^m,g_m)` is the algebraic datum for the `q^m`-power map. This changes the exponent parameter; it does not assert `IsArithFrobAt` at the original `q` for `m>1`.
- `FrobeniusDatum.noRootOfUnity`: `(Hw)` holds iff no product of `n≥1` eigenvalues of `M` in an algebraic closure is a root of unity.

*Construction.* Record the data and the four hypotheses; no construction is involved. Basis change: replacing `ω` by `P ω` (`P` in `GL_r(K)`) replaces `M` by `P M P^(-1)` and `g` by `P g`; `(H1)` and `(Hw)` are preserved.

*In `Suggested.lean`:* `FrobeniusDatum`, `FrobeniusDatum.H0`, `FrobeniusDatum.H1`, `FrobeniusDatum.Hw`, `FrobeniusDatum.coords_frobenius` (the matrix identity on representatives of de Rham coordinates).

*Needs:* L1.2, L1.5, `Module.End.HasEigenvalue`, Derivation, `Module.Free`.

**Checks.**

- For `(P^1, {0, 1, ∞}), ω = (dz/z, dz/(z - 1)), φ(z) = z^p`: `M = p` times the identity and `g = (0, log u)` with `u = (z^p - 1)/(z - 1)^p`.
- The tuple with `φ =` identity on `A+(G_m)` (not a Frobenius lift) and `M = 1` violates `(Hw)`; for it the constant in the primitive of `dz/z` cannot be fixed.
- For `(P^1, {∞})` the datum has `r = 0`: `H^1_dR+ = 0` and every differential is exact.
- Replacing `(dz/z, dz/(z - 1))` by `(dz/z, dz/(z(z - 1)))` gives `M' = P (p I) P^(-1) = p I` again.

### L1.8 Products of Weil numbers of positive weight are not roots of unity

**Lemma.** Let `q = p^f` with `f ≥ 1`, let `n ≥ 1`, and let `λ_1`, ..., `λ_n` be algebraic numbers with `|λ_i| = q^(w_i/2)` under a complex embedding and `w_i ≥ 1`. Then for every `m ≥ 1, (λ_1 ... λ_n)^m ≠ 1`. Consequently if `M` is a matrix whose eigenvalues are Weil `q`-numbers of weights 1 and 2, then `(M^(tensor n))^m` has no eigenvalue 1 for `n, m≥1, i.e`. hypothesis `(Hw)` of L1.7 holds. (BH §1.3.2, Thm. 1, p. 6; BBK §3.3, Algorithm 11, step 2, p. 8.)

*Proof sketch.* `|(λ_1 ... λ_n)^m| = q^(m (w_1 + ... + w_n)/2) > 1` under any complex embedding. The eigenvalues of `M^(tensor n)` are the products of `n` eigenvalues of `M` (Kronecker product), and those of its `m`-th power are their `m`-th powers; apply the first step.

*In `Suggested.lean`:* `weil_weight_product_ne_one`.

*Needs:* `Module.End.HasEigenvalue`, `LinearMap.charpoly`.

**Checks.**

- For `q = 2` and the weight-two eigenvalue `λ = 2`, every positive power has absolute value greater than 1.
- The empty product is 1, so `n ≥ 1` is necessary. For a rank-zero datum, `(Hw)` holds because there are no eigenvalue families of positive length, rather than by applying the product assertion to an empty family.
- If `q = 1` or a weight is allowed to be zero, the one-element family `λ = 1` can satisfy the corresponding absolute-value condition and is a root of unity; the strict bounds on `q` and the weights exclude it.

### L1.9 Every good-reduction pair carries a Frobenius datum

**Theorem.** Let `(X, D)` be a good-reduction pair over `O_K` (`K` finite over `ℚ_p`, residue field `F_q`). Then `(X, D)` carries a Frobenius-structured datum (L1.7): a Frobenius lift `φ` exists; `H^1_dR+(Y) = Ω+(Y)/dA+(Y)`, which is the Monsky-Washnitzer (rigid) cohomology `H^1_rig(Y_k/K)`, is finite dimensional, of dimension 2g `+ #D(K-bar) - 1` with a basis of algebraic differentials on `Y_K`, and its Frobenius does not depend on the lift; `ker d = K` on `A+(Y)`; the identity principle (Hi) holds on the connected wide opens; and the eigenvalues of the `K`-linear Frobenius are Weil `q`-numbers of weights 1 (from `H^1` of `X_k`) and 2 (from the residues along `D`), so `(Hw)` holds by L1.8. (BH §1.3.2, Def. 1 and the following sentence, p. 6; BH §1.3.2, Thm. 1, p. 6; BT §5, pp. 17-18.)

The algebraic comparison is the restriction-induced `K`-linear equivalence `goodReduction_algebraicDeRhamEquiv` from `H¹_dR(Y_K/K)` to `Ω⁺/dA⁺`. Construct it for constant coefficients by the following argument. On a puncture disc with parameter `t`, use the log complex `O→O·dt/t`. For a Laurent one-form `Σ_n a_n t^n dt/t`, its negative part has `primitive Σ_(n<0) (a_n/n)t^n`. Division by `n` preserves convergence on every strictly smaller annulus by L0.1 and L0.12. Projection to nonnegative powers and this homotopy identify the log-disc, punctured-disc and fringe-annulus complexes; the surviving local classes are `K` in degree zero and `K·dt/t` in degree one. These are homotopies of complexes, not multiplicative constant-term maps. Algebraically the same finite principal-part calculation removes higher poles. Proper GAGA on `X_K` (AdicSpacesPartIII §R3.7, *proper-gaga*) compares the coherent log complexes term by term. Cover `X_K^an` by a strict neighbourhood and the disjoint puncture discs; quasi-Stein acyclicity (AdicSpacesPartIII §R3.4, *quasi-stein-theorems-a-b*) and the Čech double complex give the comparison on the whole curve. Pass to the cofinal neighbourhood limit and the PadicDifferentialEquationsAndRigidCohomology RD.4 Monsky–Washnitzer comparison. Split `D` over a finite extension when necessary; finite scalar extension and faithful descent preserve the comparison.

First construct `goodReduction_differentialsEquivDualizing`: for the smooth proper curve `X_K`, a canonical `O_(X_K)-`linear isomorphism `Ω¹_(X_K/K) ≃ ω_(X_K/K)`, compatible with finite extension of `K` and with tensoring by `O(D)`. Here `ω` is the dualizing sheaf already supplied by JacobianChallenge, not a second construction of that sheaf. Use AlgebraicCurves Layer 9’s closed-point residues and trace-valued global residue theorem over the perfect field `K`, with its Kähler/Weil differential comparison. The imported trace `Σ_x Tr_(κ(x)/K) res_x` on differential principal parts annihilates global meromorphic differentials, so its Čech pairing identifies `Hom(F, Ω¹)` with `H¹(F)^∨` for coherent `F`. The representing property of `ω` then gives the isomorphism, and uniqueness with this trace normalization gives finite-base-change compatibility. Prove that `goodReduction_differentialsEquivDualizing` carries this imported trace pairing to the dualizing trace; the algebraic residues themselves are supplied by AlgebraicCurves. This specializes smooth duality in Stacks Lemma 53.4.1(6), with base change in Lemma 53.4.4(2), [§53.4, tag 0E31](https://stacks.math.columbia.edu/tag/0E31). It does not require a rational point; the subsequent use of the existing divisor-cohomology API may pass to a finite extension that supplies one.

For `r=dim_K Γ(D_K,O)=#D(K-bar)`, the log-complex spectral sequence gives `0→H⁰(X_K,Ω¹(log D))→H¹_dR(Y_K)→H¹(X_K,O)→0`: global functions are constants, and `H¹(Ω¹(log D))=0` by Serre duality and `H⁰(O(−D))=0`. Riemann–Roch gives `dim H⁰(Ω¹(log D))=g+r−1`, hence `goodReduction_deRham_finrank`: `dim H¹=`2g`+r−1`. Since `Y_K` is affine, classes have global algebraic differential representatives. This does not make those representatives logarithmic when `g>0`. Import curve duality from JacobianChallenge Layer `B` and apply the differential/canonical-sheaf comparison below; Weil-differential duality alone does not supply that comparison. Reuse Tau Ceti's `SchemeWeilDivisor.eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus` and `cohomologyOneDualEquivCohomologyZero`, after a finite extension supplying a rational point.

The comparison commutes with finite scalar extension, with restriction and pullback of pairs, and with the local residue maps (`goodReduction_algebraicDeRhamEquiv_baseChange`, `goodReduction_algebraicDeRhamEquiv_restrict`, `goodReduction_algebraicDeRhamEquiv_residue`). BC works over an algebraically closed complete field; apply its local argument over a finite splitting extension using the finite base change of AdicSpacesPartIV §F1.11 (*dagger-de-rham-finite-field-extension*). Its non-Liouville and overconvergence conditions hold for the trivial connection (BC Theorem 2.4 and Corollary 2.6, §§2–3, pp. 8–14 and 17–18; the constant-coefficient curve argument uses its Theorem 3.1 with exponent zero and the Čech proof of Corollary 3.7).

- `goodReduction_differentialsEquivDualizing`: `Ω¹_(X_K/K) ≃ ω_(X_K/K)`, trace normalized, with finite-base-change and divisor-twist compatibility.
- `goodReduction_algebraicDeRhamEquiv`: the restriction-induced `K`-linear equivalence `H¹_dR(Y_K/K) ≃ Ω⁺/dA⁺`.
- `goodReduction_deRham_finrank`: `dim H¹ =` 2g `+ r − 1` with `r = dim_K Γ(D_K, O) = #D(K̄)`.
- `goodReduction_frobeniusDatum`: the Frobenius-structured datum of L1.7 on `(X, D)`.

*Needs:* L1.1, L1.2, L1.5, L1.7, L1.8, L0.1, L0.12; PadicDifferentialEquationsAndRigidCohomology RD.0, RD.4, RD.5, RD.6; AdicSpacesPartIV §F1.12 (logarithmic de Rham complex) and §F1.11 (finite base change of dagger de Rham cohomology); AdicSpacesPartIII §§R2.4, R3.4, R3.7; TauCetiRoadmap JacobianChallenge Layer `B`; TauCetiRoadmap AlgebraicCurves Layer 9 (Kähler/Weil differential comparison, closed-point residues and trace-valued global residue theorem over the perfect field `K`).

**Checks.**

- On `ℙ¹` the comparison identifies `Ω¹` with `O(−2)`; it cannot identify either sheaf with `O`.
- On a genus-one curve a nonzero invariant differential maps to a generator of `ω`, and that generator remains nonzero after a finite coefficient extension.
- Smoothness is necessary: at a node xy`=0` the differential `x` dy`=−y` dx is a nonzero torsion element of `Ω¹`, whereas the nodal dualizing sheaf is invertible. No isomorphism between those two sheaves is asserted there.
- `𝔸¹ = ℙ¹ ∖ {∞}`: `g = 0, r = 1`, dimension 0.
- `𝔾_m = ℙ¹ ∖ {0, ∞}`: `g = 0, r = 2`, dimension 1, spanned by the class of `dt/t`.
- A genus-one curve minus one rational point: dimension 2, although the global logarithmic forms have dimension `g + r − 1 = 1`, so a basis of logarithmic forms does not `span H¹` when `g > 0`.
- For a nonsplit finite étale `D` the count `r` is its degree, not its number of `K`-rational points: over `K = ℚ₃`, the divisor `x² = 2` on `ℙ¹` is finite étale of degree 2, has no `K`-rational points and gives dimension 1. At `p = 2` the equation `x² = 3` has discriminant 12 and does not give a finite étale divisor over `ℤ₂`, so it is excluded.

### L1.10 Solving Frobenius equations along finite orbits

**Lemma.** Let `S` be a set with a bijection `F` : `S→S` all of whose orbits are finite, `V` a finite-dimensional vector space over a field `L`, and `T` in `End_L(V)` such that `T^m - 1` is invertible for `m≥1`. Then for `e` : `S→V` there is a unique `c` : `S→V` with `c(F(s)) = T(c(s)) + e(s)` for all `s` in `S`. On the orbit of `s` of length `m` it is `c(s) = (1 - T^m)^(-1) sum_{j=0}^{m-1} T^(m-1-j) e(F^j(s))`. Semilinear form (Besser's Lemma 1): if `σ` is an automorphism of `L` of finite order `r` and `M` is a matrix with `1 - σ^(r-1)(M)` ... `σ(M) M` invertible, then `x↦σ(x) - M x` is bijective on `L^n`. (BH Proof of Thm. 2, Lem. 1, p. 8; BBK §3.3, Algorithm 11, step 2, p. 8.)

Standing hypotheses of this target: `F` bijective with finite orbits (for `S = X_k(F_p-bar)` every point is defined over a finite field). No eigenvalue of `T` in an algebraic closure is a root of unity.

*Proof sketch.* Decompose `S` into `F`-orbits (Mathlib `Function.IsPeriodicPt`, Mathlib `Function.minimalPeriod`). On an orbit of length `m`, iterating the equation gives `c(s) = c(F^m s) = T^m c(s) + sum_{j<m} T^(m-1-j) e(F^j s)`; since `1 - T^m` is invertible this determines `c(s)`. Define `c` on the orbit by this formula at one point and propagate by the equation; the value obtained after going round the orbit is consistent by construction. Semilinear form: in `σ(x) =` Mx `+ b`, iteration yields `x =` Px `+ b_r` with `P = σ^(r−1)(M)⋯σ(M)M`. Injectivity follows from invertibility of `I − P`. For surjectivity view `L^n` over the fixed field `L^σ`: Artin's theorem makes `[L : L^σ]` finite (at most `r`), so the injective `L^σ`-linear map `σ − M` is bijective. In Besser's application `L` is a finite unramified extension of `ℚ_p`; the statement is made for the fields named in its hypotheses, not for every `L`.

*In `Suggested.lean`:* `existsUnique_frobenius_orbit_solution`.

*Needs:* `Function.IsPeriodicPt`, `Function.minimalPeriod`, `Module.End.HasEigenvalue`, PadicDifferentialEquationsAndRigidCohomology RD.0.

### L1.11 Dwork's principle of continuation along Frobenius

**Theorem.** Let `(φ, ω, M, g)` be a Frobenius-structured datum on `(X, D)`, a a branch, `N≥1` and `T` in `M_N(K)` such that `T^m - 1` is invertible for all `m≥1`. (a) Uniqueness: if `G` in `(A_loc^a)^N` satisfies `dG = 0` and `φ^* G - T G` is a constant vector `C` in `ℂ_p^N`, then `G` is constant, `G = (1 - T)^(-1) C`. (b) Existence: for `G_0` in `(A_loc^a)^N` and `R` in `(A_loc^a)^N` with `d(φ^* G_0 - T G_0 - R) = 0` there is a unique locally constant `c` in `LC^N` with `φ^*(G_0 + c) - T (G_0 + c) = R`. (c) Polynomial form (Coleman): if `G` in `A_loc^a` has `dG = 0` and `P(φ^*) G` is constant for a polynomial `P` in `K[t]` with no root of unity among its roots, then `G` is constant. (BBK §3.3, p. 7; BT §5, p. 18; BH Proof of Thm. 2, pp. 8-9.)

*Proof sketch.* Locally constant functions are functions on the residue classes `S = X_k(F_p-bar)`, and `φ^*` acts on them by `c |→ c o F` (L1.5, L1.4). (b) Write `φ^* G_0 - T G_0 - R =`: `-e` with `e` in `LC^N`; the equation for `c` becomes `c(F(s)) - T c(s) = e(s)`, solved uniquely by L1.10 (`F` is bijective with finite orbits by L1.1). (a) Apply the uniqueness in L1.10 to the constant `e = C`: the constant `(1 - T)^(-1) C` is a solution, hence the only one. (c) Use the companion matrix of `P` on the vector `(G, φ^* G, ..., (φ^*)^(deg P - 1) G)`.

*Needs:* L1.7, L1.10, L1.5, L1.4, L1.1.

### L1.12 The unipotent word algebra

**Construction.** For a commutative `K`-algebra `A`, derivation `d`:`A→Ω` and `ω_1`,…,`ω_r∈Ω`, define `U` as the free A-module on words, with basis `L_w, L_∅=1` and shuffle multiplication `L_uL_v=Σ_(w∈u⧢v)L_w`. Its derivation is `D(fL_(iw))=L_(iw)⊗df+fL_w⊗ω_i` and `D(f)=df`: the first letter is the outermost integral. The word-length filtration gives unipotent connections `U_≤n` with trivial graded piece of `rank r^n`. Apply this to `A⁺, Ω⁺` and the datum's `H¹`-basis. (BH §1.5, equation (1.4), pp. 9-10; BT Rem. 5.6, p. 17; BT §2, p. 3.)

Standing hypotheses of this target: A commutative `K`-algebra with a derivation `d` : `A→Ω`; `K` of characteristic zero.

- `WordAlgebra`: WordAlgebra `A ω` : the free A-module on words in `Fin r` with the shuffle product.
- `WordAlgebra.L`: The basis vector `L_w` of a word `w`.
- `WordAlgebra.L_mul_L`: `L_u * L_v =` sum over the shuffles `w` of `u` and `v` of `L_w`.
- `WordAlgebra.D`: The derivation `D` : `U→U (x)_A Ω`.
- `WordAlgebra.D_L_cons`: `D (L (e_i :: w)) = L w (x) ω_i` and `D (L []) = 0`.
- `WordAlgebra.D_mul`: `D` is a derivation: `D(x y) = x D y + y D x`.
- `WordAlgebra.depth`: The filtration `U_(≤ n)` by word length, with free graded pieces of `rank r^n` and trivial connection.
- `WordAlgebra.map`: Base change along `A→A'` compatible with `d`, and linear change of the forms `ω' = P ω` (`P` in `GL_r(K)`), which acts on `L_w` through `P^(tensor n)`.
- `WordAlgebra.isUnipotent`: `U_(≤ n)` with `D` is isomorphic to Besser's unipotent connection `M_B` for a strictly triangular `B`.

*Construction.* Define the underlying module as finitely supported functions from words to A (Mathlib `Finsupp` over Mathlib `FreeMonoid` on `Fin r`). Define the shuffle of two words recursively, `(a u)` sh `(b v) = a` (`u` sh `(b v)`) `+ b` (`(a u)` sh `v`), and extend A-bilinearly; associativity and commutativity are the standard shuffle identities. Define `D` on basis vectors by `D(L_(e_i w')) = L_w' (x) ω_i` and extend by the Leibniz rule; check that `D` is a derivation for the shuffle product by induction on word lengths (the shuffle recursion matches the removal of the first letter). Filtration and graded pieces are immediate from the formula for `D` (it lowers length by one on the `ω`-part).


*Needs:* `FreeMonoid`, Finsupp, Derivation, `Module.Free`.

**Checks.**

- `L [e_1] * L [e_2] = L [e_1, e_2] + L [e_2, e_1]` and `L [e_1] * L [e_1] = 2 L [e_1, e_1]`.
- `D (L [e_i]) = 1 (x) ω_i`.
- For `r = 0` the word algebra is A with `D = d`.
- With concatenation instead of shuffle, `D` would send `L [e_1] * L [e_1] = L [e_1, e_1]` to `ω_1 L [e_1]` instead of `2 ω_1 L [e_1]`: the shuffle product is forced by the Leibniz rule.

### L1.13 Every form with word-algebra coefficients has a primitive

**Theorem.** Let `(φ, ω, M, g)` be a Frobenius-structured datum and `U = U(A+(Y); ω)`. (a) `D` : `U→U (x) Ω+` is surjective, and every element of `U_(≤ n) (x) Ω+` has a primitive in `U_(≤ n+1)`. The operator `D` preserves the word filtration and lowers word length on pure word generators. (b) `ker D = K L_empty`. (c) The primitive is computed recursively: for `f` in `A+(Y)` and `η` in `Ω+` write `f η =` dh `+ sum c_i ω_i (H1)`; then `f L_w η = D(h L_w + sum c_i L_(e_i w)) - h D L_w`, and `h D L_w` has shorter words. This is the exactness of the Coleman de Rham complex at one-forms in the direct setting. (BT Thm. 4.15, p. 14; BT §5, p. 18.)

*Proof sketch.* (a) Induction on the length of `w` using the recursion (c), which uses only `(H1)`. (b) If `D(sum f_w L_w) = 0` with maximal word length `n`, the coefficient of `L_v (|v| = n)` is `d f_v = 0`, so `f_v` is constant by `(H0)`. The coefficient of `L_v` for `|v| = n - 1` is `d f_v + sum_i f_(e_i v) ω_i = 0`, so `sum_i f_(e_i v) [ω_i] = 0` in `H^1_dR+` and `f_(e_i v) = 0` by `(H1)`; descend in `n`.


*Needs:* L1.7, L1.12.

**Checks.**

- On `𝔾_m` with `ω = dz/z`, `D(L_e) = ω`, giving a depth-one primitive of a nonexact depth-zero form.
- On the same curve `D(zL_e) = L_e dz + dz` has a nonzero depth-one coefficient. Thus the image of the entire depth-one piece is not contained in depth zero.
- In rank zero on `𝔸¹`, `U = A⁺` and `z² dz` has the depth-zero primitive `z³/3`. The kernel is the constants; `z` is not in it since `D(z) = dz ≠ 0`.

### L1.14 Local horizontal sections on residue discs and ends

**Construction.** For a datum and ordinary `b∈]x[`, construct the unique `A⁺-`algebra map `λ_(x,b)`:`U→O(]x[)` commuting with derivatives and satisfying `λ(L_w)(b)=0` for `w≠∅`. Under the end normalization assumptions below, construct `λ_e`:`U→R_e[l_e]` with `CT λ_e(L_w)=0`. Here `CT` selects the `t⁰l⁰` coefficient. Every derivative-compatible realization has `λ(L_w)=Σ_(w=uv)λ_base(L_u)c_v` for a unique shuffle-compatible family `c_∅=1`; at an ordinary base `c_v=λ(L_v)(b)`. Constants occur on innermost letters. Use `CT`-normalized `λ_e` at a tangent. (BH §1.5.4, p. 18; BH §1.5.4, p. 19; BH §1.5.1, p. 11.)

Standing hypotheses of this target: A datum over `ℂ_p`; `b∈]x[` in (i), `e∈D_k` in (ii). For (ii) and tangential (iii), each `ω_i` has at most a simple pole and convergent regular part. Word germs lie in `ℂ_p{t}[l]`, where `CT` is multiplicative. Normalize the word generators there; negative Laurent powers in `A⁺` do not have this property. Higher-pole normalization requires its separate development.

- `localExpansion`: `localExpansion x b` : `U →ₐ O(]x[)`, the tiny iterated integrals based at `b`.
- `localExpansionEnd`: For an end where all `ω_i` have at most simple poles with regular parts: `U→R_e[l_e]`, with word images in `ℂ_p{t_e}[l_e]` and their `CT` equal to0 for nonempty words.
- `localExpansion_D`: `d (localExpansion x b y) = localExpansion x b (D y)`.
- `localExpansion_apply_base`: `localExpansion x b (L w) b = 0` for `w` nonempty.
- `constantTerm`: `CT` : `R_e[l_e]→ℂ_p` is the constant Laurent coefficient of the `l`-free part. It is linear, and is multiplicative on `ℂ_p{t_e}[l_e]`, but not on general Laurent-log germs.
- `localExpansion_classify`: Every `D`-compatible `A+-`algebra map `U→A_log(x)` is `localExpansion x b` twisted by a shuffle character `c` (deconcatenation formula).
- `localExpansion_changeBase`: Chen's formula: for `b'` in `]x[, localExpansion x b' (L w) =` sum over `w = u v` of `localExpansion x b (L u) * (localExpansion x b' (L v))`(b).

*Construction.* (i) Define `λ(L_(e_i w))` as the primitive of `ω_i λ(L_w)` on the disc with value 0 at `b` (L0.8); multiplicativity and uniqueness by induction on length, both sides of the shuffle identity having the same derivative and value 0 at `b`. For an end with `ω_i=(a_i/t+h_i(t))dt, h_i` regular, induction integrates a nonnegative-power polynomial in `l`: integration of `t^m l^j` for `m≥0` remains regular-log, and the residue term integrates `l^j dt/t` to `l^(j+1)/(j+1)`. Set its `l`-free constant coefficient to0. `CT` on the resulting word subalgebra `ℂ_p{t}[l]` is evaluation `t=l=0`, so the derivative-and-normalization proof of shuffle multiplicativity applies. Extend `A+-`linearly into `R_e[l]`; do not apply multiplicativity of `CT` to arbitrary Laurent coefficients. (iii) Given `λ`, set `c_v := λ(L_v)(b)`; the difference between `λ(L_w)` and `sum_(w = u v) λ_(x,b)(L_u) c_v` has derivative expressed through shorter words, which vanishes by induction, and value `c_w - c_w = 0` at `b`; the shuffle relations for `c` follow from multiplicativity of `λ` evaluated at `b`. At an end use the regular-log word subalgebra for `CT` and the same induction, so the constants satisfy shuffle relations there. The ordinary-disc classification and base-change formula do not need the simple-pole hypothesis.

*In `Suggested.lean`:* `constantTerm`.

*Needs:* L1.7, L1.12, L1.3, L1.4, L0.8, L0.22.

**Checks.**

- For `(P^1, {0, 1, ∞})` at the end 0: `localExpansionEnd 0 (L [e_0]) = l_0` and `localExpansionEnd 0 (L [e_1]) = sum_{n≥1} -z^n/n`.
- `localExpansion x b (L []) = 1` and `localExpansion x b` restricted to `A+` is restriction to `]x[`.
- `localExpansion x b (L [e_0]) = log(z/b)` on `]x[` does not extend to an element of `O(W_r)`: `dz/z` is not exact in `Ω+`.
- If the germ lies in `ℂ_p[[t]]` (no `l`, no negative powers) then `CT` is its value at `t = 0` (Besser-Furusho constant term).
- `CT(t^-1)=CT(t)=0` while `CT(t^-1*t)=1`. Thus `CT` on `R_e[l]` is not an algebra homomorphism, and tangential word normalization must use the nonnegative-power regular-log subalgebra.

### L1.15 Frobenius on the word algebra

**Construction.** Let `(φ, ω, M, g)` be a datum and fix a base point fixed by `φ`: either a Teichmueller point `b` in `]x_0[` with `x_0` in `Y_k(F_q)` and `φ(b) = b` (L1.6), or an end `e_0` fixed by `F` with `φ^* t = t^q (1 + h)` (tangential normalisation). There is a unique `K`-algebra endomorphism `φ^#` of `U = U(A+(Y); ω)` extending `φ^*` on `A+(Y)` with `D o φ^# = (φ^# (x) φ^*) o D` and `λ(φ^# L_w)` normalised at the base point (value 0 at `b`, resp. constant term 0 at `e_0`) for `w` nonempty. It satisfies `φ^# L_(e_i) = sum_j M_ij L_(e_j) + g_i - g_i(b)` (resp. minus the constant term of `g_i`), and in general `φ^# L_w = sum_{|v| = |w|} (M^(tensor n))_(w,v) L_v` modulo `U_(≤ n-1), n = |w|`; moreover `λ o φ^# = φ^* o λ` for the local expansion at the base point. (BH §1.5.2, p. 13; BH Proof of Thm. 2, p. 8.)

Standing hypotheses of this target: A datum and `φ`-fixed base: a Teichmüller point over `F_q`, or an `F`-fixed end with `φ*t=t^q(1+h)`. Tangential bases require L1.14's simple-pole regular-log words and preservation of `CT` by `φ*`. The example `φ*t=t^q` has this property; an arbitrary dagger lift need not.

- `frobeniusWord`: `frobeniusWord` : `U →ₐ[K] U`, the endomorphism `φ^#`.
- `frobeniusWord_dagger`: `φ^#` restricted to `A+(Y)` is `φ^*`.
- `frobeniusWord_D`: `D (φ^# y) = (φ^# (x) φ^*) (D y)`.
- `frobeniusWord_L_single`: `φ^# L [e_i] = sum_j M_ij L [e_j] + g_i -` (normalising constant).
- `frobeniusWord_top`: `φ^# L_w = (M^(tensor |w|)) L_w` modulo shorter words.
- `frobeniusWord_localExpansion`: `localExpansion` at the base point composed with `φ^#` equals `φ^*` composed with `localExpansion`.

*Construction.* Recursion on length: `φ^#(L_(e_i w)) :=` the `D`-primitive (L1.13) of `φ^*(ω_i) φ^#(L_w) = (sum_j M_ij ω_j + d g_i) φ^#(L_w)`, normalised at the base point. The top-degree formula follows by induction from `φ^* ω = M ω + dg`. Multiplicativity: both sides of `φ^#(L_u L_v) = φ^#(L_u) φ^#(L_v)` have the same `D`-image by induction and the same normalisation; conclude by `ker D = K` (L1.13 (b)). `λ o φ^# = φ^* o λ`: both are `D`-compatible maps `U → O(]x_0[)` (`φ` maps `]x_0[` into itself) with the same normalisation at the fixed base point, so they agree by the uniqueness in L1.14.

*Needs:* L1.5, L1.6, L1.7, L1.12, L1.13, L1.14.

**Checks.**

- For `(P^1, {0, 1, ∞}), φ(z) = z^p`, tangential base point at 0: `φ^# L [e_0] = p L [e_0]`.
- `φ^# (L []) = L [] = 1`.
- For the same datum, `φ^# L [e_1] = p L [e_1] + log((z^p - 1)/(z - 1)^p)`, with `log u` of constant term 0 at the end 0 (`u(0) = 1` for odd `p`; `u(0) = -1` and `log(-1) = 0` for `p = 2`).
- `φ^# L[e_0,e_1]` differs from `p^2 L[e_0,e_1]` by `pH`, where `dH=g_1 dz/z` and `ρ(H)=p(Li_2(z)-p^-2 Li_2(z^p))`. Hence `ρ(pH)=p^2 Li_2^(p)(z)`; the correction cannot be discarded.

### L1.16 Realisation of the word algebra by Frobenius continuation

**Theorem.** Let `(φ, ω, M, g)` be a Frobenius-structured datum on `(X, D)`, a in `ℂ_p` a branch and `a φ`-fixed base point as in L1.15. There is a unique `K`-algebra homomorphism `ρ = ρ^a` : `U(A+(Y); ω)→A_loc^a(Y)` such that (i) `ρ` restricted to `A+(Y)` is the diagonal embedding; (ii) `d o ρ = ρ o D` componentwise; (iii) `φ^* o ρ = ρ o φ^#`; (iv) `ρ(L_w)` is normalised at the base point (value 0 at `b`, resp. constant term 0 at `e_0`) for `w` nonempty. On each residue class `x, ρ` restricted to `A_log^a(x)` is a local expansion twisted by constants (L1.14 (iii)). (BH Thm. 2 and its proof, pp. 7-9; BT Thm. 5.7, p. 18; BF §2, proof of Prop., p. 2.)

Standing hypotheses of this target: A datum satisfying `(H0), (H1), (Hw)`; a in `ℂ_p`; `a φ`-fixed base point. A tangential base point must satisfy the regular-log and pullback-normalization hypotheses of L1.15; ordinary Teichmueller bases do not need those end hypotheses.

*Proof sketch.* Induction on depth `n`. Suppose `ρ` is defined on `U_(≤ n-1)` with (i)`-`(iv). For the `r^n` words `w` of length `n` choose, on every residue class, a local `primitive G_w` of `ρ(D L_w)` (L0.8 on discs, L0.22 on ends). By (ii) and (iii) in lower depth and L1.15, the vector `E := φ^* G - M^(tensor n) G - ρ(φ^# L - top part)` (indexed by words of length `n`) has `dE = 0`. The inhomogeneous finite-orbit equation for the constants has a unique solution by L1.10, with `T=M^(tensor n)` and `(Hw)`. There is no remaining freely chosen constant vector. On the fixed base class the normalized local family satisfies the same Frobenius equation, so homogeneous uniqueness forces the constructed family to agree with it and hence to satisfy (iv). Multiplicativity: `ρ(L_u L_v)` and `ρ(L_u) ρ(L_v)` have the same `d`, satisfy the same Frobenius equation and the same normalisation, so their difference is a vector of locally constant functions killed by the uniqueness part of L1.11. At the first depth where two realizations differ, their difference is a locally constant family satisfying the homogeneous Frobenius equation. The finite-orbit equation has only the zero solution; normalization is consistent with this uniqueness, rather than a second arbitrary choice.

*Needs:* L1.7, L1.11, L1.13, L1.14, L1.15, L1.4, L0.8, L0.22, L1.10.

### L1.17 Coleman functions

**Definition.** Let `(X, D)` be a good-reduction pair with a Frobenius-structured datum `(φ, ω, M, g)`, a in `ℂ_p` a branch and `ρ = ρ^a` the realisation of L1.16. The ring of Coleman functions is `A_Col^a(Y) := ρ(U_B)` in `A_loc^a(Y)`, filtered by depth `A_Col,≤n := ρ(U_(≤ n))`, and the module of Coleman forms is `Ω_Col := A_Col Ω+(Y)` in `Ω_loc^a`. It contains `A+(Y)`, is closed under products and `d` (`d A_Col,≤n` in `A_Col,≤n Ω+`), every Coleman form has a Coleman primitive (L1.19), and it depends neither on the basis `ω` (API `changeBasis` of L1.7), nor on the base point (change of base point by Chen's formula), nor on the Frobenius lift (L1.22). With `K`-valued coefficients, branch and base data it is Coleman's ring `M(U)` of Besser's Theorem 5.7. With the algebraic `ℂ_p` coefficient convention it maps injectively to Furusho's full `A^a_Col`, as the `B`-subalgebra generated by the same normalized word functions; it is not asserted to equal the full ring. (F §2.1, p. 8; BT §5, p. 18; BH §1.5.3, p. 17.)

Standing hypotheses of this target: A datum on `(X, D)`; a in `ℂ_p`; for independence of the lift, the hypotheses of L1.22.

- `ColemanFunctions`: ColemanFunctions datum `a` : `Subalgebra ℂ_p (LocAn (X, D) a)`, the image of the realisation.
- `ColemanFunctions.dagger_le`: `B` is contained in ColemanFunctions.
- `ColemanFunctions.d_mem`: For `F` Coleman, `dF` lies in ColemanFunctions . `Ω+(Y)`.
- `ColemanFunctions.depth`: The filtration by depth, with depth 0 equal to `B`.
- `ColemanFunctions.ker_d`: `F` Coleman with `dF = 0` implies `F` constant (L1.18).
- `ColemanFunctions.frobenius_mem`: `φ^*` preserves ColemanFunctions.
- `ColemanFunctions.pullback`: Pullback along morphisms of wide opens (L1.43).
- `ColemanFunctions.branch`: `iota_(a,b)` maps ColemanFunctions for a onto those for `b` (L1.23).
- `ColemanFunctions.indep_basis`: The subalgebra does not depend on the `H^1` basis `ω` nor on the `φ`-fixed base point.
- `ColemanFunctions.eval`: Values at points of `]Y_k[(ℂ_p)`.

*Construction.* Define `A_Col^a :=` the image of the algebraically extended realization `ρ : U_B → A_loc^a`, a `ℂ_p`-subalgebra. The comparison into Furusho's full ring sends the normalized words to their iterated Coleman primitives and coefficients through `B → A_Cp,full⁺`; their local realizations agree by Frobenius continuation. The map is the inclusion of these functions in the common local carrier. `d ρ = ρ D` gives `d(A_Col)` in `A_Col Ω+`. Independence of basis: `U` for `P ω` is `U` for `ω` with `L_w` transformed by `P^(tensor n)`; `ρ` is transported by uniqueness in L1.16. Independence of the base point: realisations normalised at two base points differ by the deconcatenation formula of L1.14 (iii), whose constants are values of lower-depth Coleman functions; the image is the same.

*Needs:* L1.16, L1.4, L1.7, L1.12, L1.14.

**Checks.**

- For `(P^1, {0, 1, ∞})`: `log_a z` and `log_a(1 - z)` are Coleman functions of depth 1 (realisations of `L [e_0]` and `L [e_1]`).
- The depth-zero part is `B`; on `𝔸¹` the whole word algebra and Coleman ring equal `B`, because `r = 0`.
- For `p≥3`, the element of `LocAn` equal to `log_a z + 1` on the residue disc of 2 and to `log_a z` elsewhere has `d = dz/z` but is not a Coleman function.
- A Coleman function with `dF = 0` is a constant.

### L1.17a Algebraic coefficient extension and meromorphic primitives

**Theorem.** For a good-reduction pair over finite `K/ℚ_p`, let `A = A_K⁺(Y)`, `Ω = Ω_K⁺(Y)` and assume `(H0)`, `(H1)` and `(Hi)` over `K`. For any field extension `L/K`, set `B_L = A ⊗_K L`, `Ω_L = Ω ⊗_K L` and extend `d` algebraically. Then `B_L` is a domain, `ker(d : B_L → Ω_L) = L` and the classes of the supplied forms `ω_i` are an `L`-basis of `Ω_L/dB_L`. Extend `d` to `Frac(B_L)`. If `h ∈ Frac(B_L)` and `dh ∈ Ω_L`, then `h ∈ B_L`. In particular, a relation `dh = Σ_i c_i ω_i` with `c_i ∈ L` forces all `c_i = 0` and `h ∈ L`. For `L = ℂ_p`, the maps of `B_L` and `Ω_L` to every ordinary-disc germ and every end germ are injective. These are the coefficient and meromorphic exactness inputs for the uniqueness argument of L1.18 (BT Corollaries 4.13–4.14, p. 14; BH §1.5.3, Proposition 7, p. 17). Pole removal over `K` uses the strict-neighbourhood sections of AdicSpacesPartIV §F1.7, *overconvergent-sections-formula*; no assertion about arbitrary complete dagger base change is needed.

- `colemanCoefficients_exact`: the algebraic extension preserves `(H0)` and `(H1)`.
- `colemanCoefficients_meromorphicPrimitive`: `h ∈ Frac(B_L)` and `dh ∈ Ω_L` imply `h ∈ B_L`, with the constant and cohomology-independence consequences above.
- `colemanCoefficients_restrict_injective`: injectivity of the `ℂ_p` coefficient restrictions, for functions and forms.
- `geometricSeries_not_finite_coefficient_sum`: for a field extension `L/K` and `α` transcendental over `K`, the formal series `(1 − αz)⁻¹` is not a finite sum `Σ_i c_i f_i(z)` with `c_i ∈ L` and `f_i ∈ K[[z]]`.

*Proof sketch.* Flatness of `L/K` preserves the kernel and cokernel of the `K`-linear differential, giving the first two cohomology assertions. First prove pole removal over `K`: a pole of order `m ≥ 1` gives a pole of order `m + 1` in its derivative. Thus a meromorphic function with dagger differential is analytic on a common strict neighbourhood and belongs to `A`. In particular, `E = Frac(A)` has constant field `K`. Choose a nonconstant local coordinate with meromorphic differential `dt ≠ 0` and write `d = dt·δ` on `E`. In characteristic zero the constant-field assertion makes `E/K` regular, so `R = E ⊗_K L` is a domain.

Every nonzero `δ`-stable ideal of `R` contains 1: take an element with the least number of `K`-linearly independent `L` coefficients, divide by its first nonzero `E` coefficient, and differentiate. Minimality forces the derivative to vanish, so all normalized `E` coefficients lie in `K` and the element is a nonzero scalar in `L`. Now for `h ∈ Frac(B_L)` with `dh ∈ Ω_L`, the nonzero denominator ideal `{b ∈ R : bh ∈ R}` is `δ`-stable, since `δh ∈ R`. Hence `h ∈ R`. Expand it with `K`-linearly independent coefficients from `L`; membership of `dh` in `Ω_L` forces each `E` coefficient to have differential in `Ω`. Pole removal over `K` puts each coefficient in `A`, giving `h ∈ B_L`. Flatness then proves the stated independence of the `ω_i` for meromorphic primitives. For `L = ℂ_p`, restriction of `R` to a local meromorphic germ is a nonzero differential ring map, so its kernel is zero by the same ideal argument. Since `Ω` is projective of rank one, trivializing it over `E` also gives injectivity for forms. The argument applies to ordinary and annular germs. Finally, coefficients of any finite sum `Σ_i c_i f_i` lie in the finite-dimensional `K`-span of the `c_i`, whereas the powers of a transcendental `α` are `K`-linearly independent.

*In `Suggested.lean`:* `geometricSeries_not_finite_coefficient_sum`.

*Needs:* L1.2, L1.3, L1.7; AdicSpacesPartIV §F1.7; Mathlib `TensorProduct`, localization and flatness over fields.

**Checks.**

- For `Y = 𝔸¹` and `α ∈ ℂ_p` transcendental over `K` with `0 < |α| < 1`, `f(z) = (1 − αz)⁻¹ = Σ_(m≥0) α^m z^m` lies in the full `ℂ_p` dagger algebra and in `Frac(B)`, but not in `B`. Its coefficients span an infinite-dimensional `K`-space. Also `df = α(1 − αz)⁻² dz` is not in `B dz`, so it does not satisfy the meromorphic-primitive hypothesis.
- On `𝔸¹`, `H¹ = 0` and `U_B = B`. Every `h ∈ Frac(B)` with `dh ∈ B dz` belongs to `B`; a primitive of a form in `B dz` stays in the algebraic coefficient carrier modulo `ℂ_p`.
- On `𝔾_m`, `dz/z` remains nonexact after every algebraic coefficient extension, even among meromorphic primitives: `dh = c dz/z` for `h ∈ Frac(B_L)` implies `c = 0` and `h ∈ L`.
- For a finite extension `L/K`, the algebraic tensor agrees with finite dagger base change, as in AdicSpacesPartIV §F1.11. The transcendental example distinguishes the two carriers for `L = ℂ_p`.

### L1.18 Coleman's uniqueness principle

**Theorem.** Let a datum on `(X, D)` be given and `F` in `A_Col^a(Y)`. If `F` vanishes on a nonempty open subset of one residue disc `]x[` (`x` in `Y_k(F_p-bar)`), or its germ vanishes at one end, then `F = 0`. Consequently `ρ` is injective, `ker(d on A_Col) = ℂ_p`, and a locally constant Coleman function is constant. (F Prop. 2.4 (Uniqueness Principle), p. 8; BH §1.5.3, Prop. 7, p. 17; BT Corollary 4.13, p. 14.)

Standing hypotheses of this target: A datum satisfying `(H0), (H1)`, (Hi); coefficients extended to `ℂ_p`.

*Proof sketch.* Write `F = ρ(y), y = sum_w f_w L_w`. By L1.14 (iii), on `]x[` one has `ρ(L_w) =` sum over `w = u v` of `λ_(x,b)(L_u) c_v` with constants `c_v` and `c_empty = 1`; hence `F` restricted to `]x[` is `sum_u g_u λ_(x,b)(L_u)` with `g_u := sum_v c_v f_(u v)`, elements of `B = A_K⁺(Y) ⊗_K ℂ_p`. `F` vanishes on all of `]x[` by the identity principle on discs (API `eq_zero_of_eqOn` of L0.7). Local independence is proved by a minimal relation, not by comparing coefficients in the relation being proved independent. Work over the fraction field of the algebraic coefficient ring `B`, whose domain and restriction properties are L1.17a. Among nonzero finite formal relations whose local realization vanishes, choose minimal maximal word length and then minimal number of nonzero coefficients at that length; divide by one top coefficient to make it 1. Differentiation removes that coefficient. If the resulting formal differential is nonzero, expand it in a basis of the one-dimensional meromorphic differential module: a nonzero component gives a vanishing relation with fewer top coefficients (or lower length), contradicting minimality. Therefore its formal `D`-image is 0. In `Ω_B ⊗_B Frac(B)`, L1.17a gives the required meromorphic independence: `df ∈ Ω_B` implies `f ∈ B`, and flatness preserves independence of the classes `[ω_i]`. Its constant-field assertion gives only `ℂ_p` constants. Analyticity in the full `ℂ_p` dagger algebra alone does not imply membership in `B`. The kernel-of`-D` argument of L1.13 therefore applies over the fraction field and forces the formal relation to be a constant. A nonzero constant cannot realize to 0, which establishes local independence. The system `g_u = sum_v c_v f_(u v)` is unitriangular (`c_empty = 1`, and `g_u - f_u` involves only words longer than `u`), so descending in length all `f_w = 0` and `F = 0`. At an end use `λ_e` and the identity principle for Laurent germs (L0.A2 (e)). Consequences: if `dF = 0` then `F` is constant on the residue class of `x`, and `F` minus that constant vanishes there.

*Needs:* L1.7, L1.14, L1.16, L1.17, L1.17a, L0.7, L0.A2, L1.13.

**Checks.**

- On `𝔸¹` the rank-zero Coleman ring is `B`: a finite algebraic coefficient expression vanishing on one ordinary disc is zero by L1.17a.
- On `𝔾_m`, `log_a(1) = 0` but `d log_a z = dz/z ≠ 0`. Vanishing at a single point cannot replace vanishing on a nonempty open subset.
- At the end 0 of `𝔾_m`, the germ of `log_a z` is the nonzero symbol `l`, although its constant term is zero. The end hypothesis requires the whole germ to vanish.

### L1.19 The Coleman integral

**Construction.** For `F∈A_Col,≤n` and `η∈Ω⁺`, define `∫Fη=ρ(D⁻¹(ρ⁻¹(F)η))` in `A_Col,≤n+1/ℂ_p`, using injectivity of `ρ` and surjectivity of `D` with constant kernel. A `primitive G` gives `∫_x^yFη=G(y)−G(x)`; a based primitive satisfies `G(x)=0`. Tangential endpoints require convergent nonnegative-power logarithmic expansions. Prove `d∫=`id, `∫dG=G` mod `ℂ_p, φ*∫=∫φ*` mod `ℂ_p`, linearity, endpoint concatenation, tiny-disc agreement, change of variables and `∫_x^ydg=g(y)−g(x)` for `g∈A⁺`. For `F=1` this is BBK Theorem 5's integration map. (BBK §2, Thm. 5 (Coleman), p. 4; BBK §2, Thm. 5 (d), p. 4; F Notation 2.6, p. 9; BT §5, p. 18.)

Standing hypotheses of this target: A datum on `(X, D)`; a in `ℂ_p`.

- `colemanIntegral`: `colemanIntegral` : ColemanForms`→`ColemanFunctions `/ ℂ_p`.
- `d_colemanIntegral`: `d (colemanIntegral η) = η`.
- `colemanIntegral_d`: `colemanIntegral (d G) = G` mod `ℂ_p` for `G` a Coleman function.
- `colemanIntegral_frobenius`: `colemanIntegral (φ^* η) = φ^* (colemanIntegral η)` mod `ℂ_p`.
- `definiteIntegral`: `int_x^y η` for `x,y` in the ordinary tube. A tangential endpoint is permitted when a primitive has a convergent nonnegative-power logarithmic expansion there; evaluate by its `CT` with the chosen tangent/parameter. General higher-pole evaluation is not supplied.
- `definiteIntegral_add`: `int_x^y + int_y^z = int_x^z`.
- `definiteIntegral_tiny`: For `x, y` in one residue disc, `int_x^y` is the integral of the local power series (L0.8).
- `basedPrimitive`: `basedPrimitive x η` : the Coleman function with `d = η` and value 0 at `x`.
- `definiteIntegral_d`: `int_x^y dg = g(y) - g(x)`.
- `definiteIntegral_pullback`: `int_(f x)^(f y) η = int_x^y f^* η` for morphisms `f` (L1.43).

*Construction.* Definition via `U`: `ρ^(-1)(F) η` is in `U (x) Ω+`; `D^(-1)` exists modulo `ℂ_p` after coefficient extension by L1.13. (a), (b), (d): from `d ρ = ρ D` and linearity; (c) from `φ^# D`-compatibility (L1.15) and `ρ φ^# = φ^* ρ`. (e), `(h)`: immediate from the definition of definite integrals. (f): on a residue disc the Coleman primitive and the disc primitive (L0.8) have the same derivative, so they differ by a constant, which cancels in `int_x^y`. `(g)`: L1.43.

*Needs:* L1.13, L1.16, L1.17, L1.18, L1.15, L0.8, L0.22.

**Checks.**

- On `(P^1, {0, 1, ∞})`: `int_x^y dz/z = log_a(y) - log_a(x)`; for `x, y` roots of unity of order prime to `p` it is 0.
- `int_x^y d g = g(y) - g(x)` for `g` in `A+(Y)`, and `int_x^x η = 0`.
- For `p` odd, `int_2^(2+p) dz/z = logOneAdd (p/2)`, the disc integral.
- For `p≥5` the locally analytic `primitive log_a z +` (indicator of the residue disc of 2) of `dz/z` gives `log_a 2 - log_a 3 + 1` between 3 and 2, whereas `int_3^2 dz/z = log_a(2/3)`: an arbitrary locally analytic primitive does not compute the Coleman integral.

### L1.20 Coleman integration is characterised by Frobenius equivariance

**Theorem.** For a Frobenius datum satisfying `(H0)`, `(H1)`, `(Hi)` and `(Hw)`, extended algebraically as in L1.17a, there is a unique `ℂ_p`-linear integration map int : `Ω_K⁺(Y) ⊗_K ℂ_p → A_loc^a(Y)/ℂ_p` with `d` int the inclusion, int `d` the canonical map on `B = A_K⁺(Y) ⊗_K ℂ_p`, and Frobenius equivariance. Its image is the depth-one Coleman primitives. At depth `n`, integration is the unique `ℂ_p`-linear inverse to `d` into `A_Col,≤n+1/ℂ_p` for Coleman forms of depth`≤n`. The original `K`-linear`/K`-quotient formulation in Besser concerns `K`-valued local functions and a branch valued in `K`; it must not be applied to all `ℂ_p`-valued Coleman functions. Independence of `φ` is subject to L1.22. (BH Thm. 2, p. 7; BT §5, p. 18; BH §1.2, pp. 2-3.)

Standing hypotheses of this target: A datum satisfying `(H0)`, `(H1)`, `(Hi)` and `(Hw)`; `a ∈ ℂ_p`.

*Proof sketch.* Existence: L1.19. Uniqueness: two such maps differ by `δ` : `Ω+ →` LC`/ℂ_p` with `δ(dg) = 0` and `φ^* δ = δ φ^*`; so `δ` factors through `H^1_dR+` with `δ(ω)` a vector of locally constant functions modulo constants satisfying `φ^* δ(ω) = M δ(ω)` modulo constants. By L1.11 (a) (`T = M`, hypothesis `(Hw)`) `δ(ω)` is constant, `i.e`. zero in LC`/ℂ_p`. Higher depth inside the Coleman algebra: surjectivity of `D` and injectivity of `ρ` give existence, and `ker d=ℂ_p` gives uniqueness modulo `ℂ_p`. Frobenius equivariance follows from `D`-compatibility. There is no need to infer uniqueness in a larger locally analytic carrier from this statement.

*Needs:* L1.7, L1.11, L1.19, L1.18, L1.17a.

**Checks.**

- On `𝔸¹`, integration sends `z^m dz` to `z^(m+1)/(m+1)` modulo `ℂ_p` for every `m ≥ 0`; finite `ℂ_p`-linear combinations remain in `B`.
- On `𝔾_m` with `φ(z) = z^q`, integration of `dz/z` is `log_a z` modulo `ℂ_p`, and both Frobenius pullback formulas multiply this class by `q`.
- If one quotients the `ℂ_p`-valued target only by `K`, constants in `ℂ_p ∖ K` give nonzero classes killed by `d`. Thus the higher-depth inverse statement requires the quotient by all `ℂ_p` constants.

### L1.21 Finite-word Taylor transport along maps with equal reduction

**Lemma.** For a good-reduction pair and a Frobenius datum, fix a finite word depth `n`. For two integral dagger maps `u,v` from a good-reduction pair into this pair with the same reduction, construct the Taylor transport between the two pullbacks of its finite-word connection. In a local integral étale coordinate `t` its value on a word expression `y` is

```text
T_(u,v)(y) = Σ_(j≥0) (v*t − u*t)^j u*(∂^j y) / j!.
```

Its coefficients converge in the source dagger algebra on a common strict neighbourhood. The transports are independent of coordinates, restrict compatibly to smaller neighbourhoods and satisfy `T_(u,u)=1` and the three-map cocycle identity. Their local realizations are composition with `v` expressed in the `u`-pulled-back word family: `ρ(y)(v(z))=ρ(T_(u,v)(y))(z)`. In particular two equal`-q` Frobenius lifts satisfy the required comparison, without a global trivialization of `Ω⁺`. This is the finite-unipotent Taylor argument underlying BH's proof of Theorem 2, p. 9; the bounds and finite-chart reduction below are deductions, rather than an estimate attributed to that lecture. The generic coordinate criterion and coordinate-independent stratification are imported from PadicDifferentialEquationsAndRigidCohomology RD.3.17–RD.3.18.

Standing hypotheses of this target: both pairs descend to finite extensions of `ℚ_p` in a common coefficient field; `u` and `v` extend to the integral smooth models near the ordinary locus, have equal reduction and induce the indicated dagger pullbacks. At end components use logarithmic parameter substitutions when the image is an end; an ordinary image uses its whole-disc analytic component as in L1.42. The maps need not be endomorphisms. No global basis of `Ω⁺` and no previously supplied uniform connection estimate are assumed.

*Proof sketch.* At depth `n` the words of length at most `n span` a finite free `A⁺-`module `W_n`, even when `Ω⁺` is not free. The connection is ∇`L_(iw)=ω_i L_w`; its length filtration has trivial graded connections. It is integrable since the base is a smooth curve. Work on a finite integral étale-coordinate cover of the ordinary locus and on the end annuli, splitting `D` by finite extension if needed. Choose all finitely many coefficient functions and forms at one fringe stage, using closed affinoid fringes between the wide opens for the Banach norms and a finite affinoid chart cover. The scalar analytic Taylor identity on each chart has, for every fixed `R₀<1`, a bound `C R₀^(−j)` for its divided derivatives after restricting to a sufficiently small common strict neighbourhood. Indeed its pullback to the diagonal tube is analytic on the unit difference-disc; the strong fibration and standard-neighbourhood contracts RD.3.12 and RD.3.5 put the closed difference-disc of any radius `R₀<1` in one common fringe stage. A slightly larger difference radius gives the stated coefficient bound by its Gauss norm. At an end first take the inner radius greater than `R₀` and use the Laurent coefficient bounds. These are scalar bounds derived from the imported carriers, not an assertion that arbitrary connections converge.

Solve the triangular word system in that difference variable. A Taylor coefficient of a word of length at most `n` involves at most `n` integrations. Each integration divides an index between 1 and `j+n`; L0.1 bounds the product of these denominators polynomially in `j`. Products and convolutions do not introduce a factor counting summands, by the ultrametric inequality. Thus, in each of the finitely many charts, the divided connection derivatives on `W_n` have bounds `C_n(j+1)^c_n R₀^(−j)`, after enlarging `C_n` to account for the finitely many small indices. Choose `|π|<δ<R₀<1`. Equal reduction bounds the coordinate increments by `|π|` on the ordinary tube; after shrinking the common fringe stage their norms are at most `δ`. The Taylor terms are then bounded by `C_n(j+1)^c_n(δ/R₀)^j` and tend to zero. For ramified `K` this uses `|π|`, not `|p|`. At ends the same calculation uses Laurent-log primitives from L0.22 on a common inner annulus; finitely many word integrations still give polynomial denominator loss.

RD.3.17 now applies to this particular finite unipotent connection. RD.3.18 supplies coordinate independence and the cocycle from its integrability and the proved analytic convergence. Restriction compatibility and coherent descent (AdicSpacesPartIV §F1.6, *dagger-tate-acyclicity*, and §F1.7, *dagger-coherent-module*) glue the matrices over the finite chart cover. Faithful finite scalar descent removes the splitting extension. On ordinary components the resulting identity is whole-disc recentering; on ends it is the Laurent-log Taylor identity, or ordinary-disc restriction for an ordinary image. Continuity of restriction permits termwise evaluation. Consequently the glued dagger coefficients express `v`-pullback in the `u`-pulled-back word family. Taking `u` to be the chosen Frobenius shows that the other lift preserves the Coleman image.

- `wordConnection_uniformTaylor`: the polynomial-times-geometric bound at every fixed depth and every difference radius `R₀<1`, on a sufficiently small common fringe stage.
- `wordTaylor_coordinate_independent`: the chart matrices define one transport, including the case of a nonfree differential module.
- `wordTaylor_cocycle`: the identity and three-map composition laws, with restriction and finite-base-change compatibility.
- `wordTaylor_realization`: the ordinary and end component identities stated above.

*Needs:* L1.1–L1.5, L1.12, L1.15, L1.16, L0.1, L0.7, L0.22; AdicSpacesPartIV §F1.3 (*fringe-topology*, *fringe-module-descent*), §F1.6 (*dagger-tate-acyclicity*), §F1.7 (*dagger-coherent-module*), §F1.9 (*dagger-smooth-space*) and §F1.11 (*dagger-de-rham-finite-field-extension*); PadicDifferentialEquationsAndRigidCohomology RD.3.5, RD.3.12, RD.3.17–RD.3.18. Only the finite-word convergence is constructed here; the general stratification equivalence is imported.

**Checks.**

- At depth zero the transport is the scalar analytic Taylor identity; with no letters `(r=0), W_n=A⁺` and no iterated-integral term is introduced.
- For the length-one word with differential `dt/t` the transport correction is `log(1+(v*t−u*t)/(u*t))` on an annulus where the quotient has norm less than one. This fixes the direction and sign of the transport.
- For ramification index `e>1`, an increment `π` may have norm larger than `|p|`. The choice `R₀>|π|` still works; the false replacement `R₀>|p|` alone need not.
- A positive-genus affine curve with nontrivial `Ω⁺` uses several étale charts, while `W_n` remains free. No global expression `ω_i=h_i dt` is used in the gluing statement.
- The rank-one equation `dY=Y dt` is outside the finite-unipotent hypothesis: at `p=2` its Taylor exponential has radius `1/2`. It is a counterexample to applying the radius-one assertion to every integrable connection.

### L1.22 Independence of the Frobenius lift

**Theorem.** Let `(φ, ω, M, g)` and `(φ', ω, M', g')` be data on `(X, D)` that differ in the Frobenius lift (same `q`). Then (a) `M' = M`: the Frobenius on `H^1_dR+` depends only on the `q`-power Frobenius of `Y_k`; (b) `A_Col^(a, φ) = A_Col^(a, φ')` as subalgebras of `A_loc^a`, and the Coleman integrals coincide modulo constants; with a common base point fixed by both lifts (for `P^1` minus `{0, ∞}` and `μ_N`: the tangential base point at 0) the realisations coincide, `ρ_φ = ρ_φ'`; (c) replacing `φ` by `φ^m` does not change `A_Col` or int. Part (a) uses the lift-independent rigid comparison of PadicDifferentialEquationsAndRigidCohomology RD.4; part (b) uses the finite-chart Taylor transport of L1.21. Both apply to general good-reduction pairs. (BH Thm. 2, p. 7; BT §5, p. 18; BT Proof of Corollary 3.2, p. 8.)

Standing hypotheses of this target: a good-reduction pair and lifts with the same `q`; apply the finite-word convergence and gluing of L1.21 at each depth. Equality of normalized realizations requires a common fixed ordinary base or a tangential base satisfying regular-`log/CT`-pullback hypotheses. Equality of images and integrals does not.

*Proof sketch.* (a) The rigid comparison gives lift independence. In an étale chart, for `η = f dt`: `φ'^* η - φ^* η = d(sum_{k ≥ 1} ((φ'^* t - φ^* t)^k/k!) φ^*(partial^(k-1) f))`, the series converging in `A+` by the estimate of L1.21; so the local classes agree; the global cohomological equality is the imported rigid statement, and `M' = M`. Choose an ordinary point `b` fixed by a power of `φ'` using L1.6. Taking a power does not change its Coleman image by (c), which follows independently from realization uniqueness. Restrict `ρ_φ` to the disc of `b`; L1.14 classifies it as the `b`-normalized local solution twisted by a constant shuffle character. Rebase the entire realization by the inverse unitriangular constant shuffle twist. Its image is unchanged and its restriction at `b` is now normalized. The cross-map Taylor identity shows `φ'-`pullback preserves this unchanged image. Compare `φ'*ρ_rebased(L_w)` with `ρ_rebased(φ'#L_w)`, where `φ'#` is normalized at `b`. By induction their differential defect is zero; the Coleman uniqueness principle makes it a global constant. Evaluate at `b`: `φ'(b)=b` and the two word families have the same normalization, so the defect is0. Realization uniqueness identifies the rebased family with `ρ_φ'`. Thus images and integration modulo constants agree. If both lifts already have the same compatible fixed base and normalization, no rebase is needed and the realizations themselves agree. (c) `φ^m`-equivariance follows from `φ`-equivariance, and uniqueness for `φ^m` gives equality.

*Needs:* L1.16, L1.17, L1.18, L1.21, L1.7, PadicDifferentialEquationsAndRigidCohomology RD.4, L1.6, L1.14.

### L1.23 Branch independence principle

**Lemma.** For `a, b` in `ℂ_p`: the isomorphism `iota_(a,b)` : `A_loc^a→A_loc^b` of L1.4 maps `A_Col^a` onto `A_Col^b` and `iota_(a,b) o int_(a) = int_(b) o τ_(a,b)` modulo constants; in the direct construction `ρ^b = iota_(a,b) o ρ^a`. Consequently the values of Coleman functions at points of the tube `]Y_k[` do not depend on the branch (a branch-independent region); only the end components, realised with `log_a(t_e)`, do. (F Prop. 2.3 (Branch Independency Principle), p. 8; F Proof of Thm. 3.10, p. 17.)

Standing hypotheses of this target: A datum; `a, b` in `ℂ_p`.

*Proof sketch.* Use an ordinary Teichmueller base. The formal word equations and their ordinary normalization have no branch parameter, and the end pullback constants for a `K`-linear `q`-Frobenius with unit leading coefficient are branch independent. Transport `iota_(a,b)` substitutes the formal logarithmic symbols and is the identity on ordinary-disc components. Hence the transported realization satisfies the same equations and ordinary normalization. For a compatible tangential base, the regular-log word normalization and `CT`-pullback hypotheses give the same argument; no multiplicativity of general Laurent `CT` is used. Hence `iota_(a,b) o ρ^a` satisfies (i)`-`(iv) for `b` and equals `ρ^b` by uniqueness; the statement on integrals follows. On residue discs of `Y_k, iota_(a,b)` is the identity, so values there are branch independent; on ends the difference is given by L0.23.

*Needs:* L1.4, L1.16, L1.17, L1.5, L0.23.

### L1.24 Cohomological and analytic Frobenius pullback agree

**Lemma.** Let a datum on `(X, D)` be given. (a) For `g` in `A+(Y)` and `x` in `X_k(F_p-bar)`: `res_x(φ^* g) = φ^*(res_(F(x)) g), i.e`. pulling back functions on the wide open and pulling back their restrictions to residue discs agree. (b) For `η` in `Ω+(Y)` and `x, y` in one residue disc: `int_(φ(x))^(φ(y)) η = int_x^y φ^* η` (tiny integrals). (c) The class of `φ^* η` in `H^1_dR+`, which is the cohomological pullback, is `M^T` applied to the class of `η`, and depends only on the Frobenius of `Y_k` (L1.22 (a)). Together these are the comparison between cohomological and local analytic pullback of the roadmap. (BBK §3.3, Rem. 13, p. 8; BH §1.3.2, Prop. 1, p. 5.)

*Proof sketch.* (a) Restriction to residue discs is compatible with composition with `φ`, which maps `]x[` into `]F(x)[` (L1.5). (b) Both sides are values of disc primitives; the chain rule and L0.8 give the equality. (c) By definition of `M` and the `H^1` coordinates (API of L1.7).

*Needs:* L1.5, L1.3, L1.7, L0.8, L1.22.

### L1.25 The projective line minus zero, `∞` and roots of unity

**Definition.** Let `N≥1` with `p` not dividing `N, O = ℤ_p[μ_N]` (unramified over `ℤ_p`) and `K_N = ℚ_p(μ_N)` inside `ℂ_p`. The punctured line is `U_N := P^1_O` minus `({0, ∞} u μ_N)`; `(P^1_O, D_N = {0, ∞} u μ_N)` is a good-reduction pair (L1.1) because the `N`-th roots of unity have distinct reductions. `U_1 = P^1` minus `{0, 1, ∞}`. Residue classes: `P^1(F_p-bar) = {0, ∞} u F_p`-`bar^x`, with ends at `0, ∞` and at the `ζ` in `μ_N`; local parameters `t_0 = z, t_inf = 1/z, t_ζ = z - ζ`; wide opens `W_r =` {`r < |z| < 1/r, |z - ζ| > r` for all `ζ` in `μ_N`}; dagger algebra `A+(U_N) =` weak completion of `O[z, z^(-1), (z^N - 1)^(-1)]` tensored with `K_N` (AdicSpacesPartIV §F1.5, *weak-completion-generic-fibre*). (F §2.2, before Def. 2.9, p. 9; BH §1.2, pp. 2-3.)

- `puncturedLine`: `puncturedLine p N` : the good-reduction pair `(P^1_O, {0, ∞} u μ_N)` for `p` not dividing `N`.
- `puncturedLine.wideOpen_eq`: The wide open `W_r =` {`r < |z| < 1/r, |z - ζ| > r` for `ζ` in `μ_N`}.
- `puncturedLine.residueClasses`: Residue classes `P^1(F_p-bar)`, ends `{0, ∞} u` reduction of `μ_N`.
- `puncturedLine.teichmuller`: For the `K_N`-linear arithmetic lift `φ(z)=z^q` with `q=#k_N=p^f`, the Teichmueller points are the roots of unity of order prime to `p` outside `μ_N`. The auxiliary analytic `p`-power map has the same periodic points but is not the `K_N`-linear arithmetic `q`-Frobenius when `f>1`.
- `puncturedLine.inclusion`: For `N | N', U_N'` is contained in `U_N` (more points removed).
- `puncturedLine.powerMap`: `z↦z^N` maps `U_N` onto `U_1` (finite etale of degree `N` on the generic fibre).
- `puncturedLine.rotation`: `z↦ζ z` (`ζ` in `μ_N`) is an automorphism of `U_N`; `z↦1/z` and `z↦1 - z` are automorphisms of `U_1`.
- `puncturedLine.pPowerRotation`: For `ζ a p`-power root of unity, `z↦ζ z` maps `W_r` into itself for `r > |ζ - 1|` and reduces to the identity.

*Construction.* Etaleness of `D_N`: `z^N - 1` is separable modulo `p` since `p` does not divide `N`. The wide opens and dagger algebra are the instance of L1.2 with these parameters.

*Needs:* L1.1, L1.2, AdicSpacesPartIV §F1.5, `rootsOfUnity`, `IsPrimitiveRoot`.

**Checks.**

- `puncturedLine p 1` is `P^1` minus `{0, 1, ∞}` for p.
- For `N = 1` the `φ`-fixed points in the residue discs of `U_1` are the `p - 2` roots of unity of order dividing `p - 1` other than 1.
- For `N = p` the pair is not of good reduction (L1.1 test `goodReductionPair_μ_p`).
- The fibre of `z↦z^N` over 1 is `μ_N`, the removed points of `U_N` other than 0 and `∞`.

### L1.26 Mittag-Leffler decomposition on the punctured line

**Lemma.** Every `f` in `A+(U_N)` has a unique decomposition `f = f_inf(z) + f_0(1/z) + sum_{ζ in μ_N} f_ζ(1/(z - ζ))` with `f_inf` in `K_N[[T]]` and `f_0, f_ζ` in `T K_N[[T]]`, all restricted at some common `ρ > 1` (`PowerSeries.IsRestricted`); conversely every such sum lies in `A+(U_N)`. The expansion on each residue disc and on each end is obtained by expanding the pieces, and (Hi) holds: an element vanishing on one residue disc of the tube, or as a germ at one end, is zero. (BBK §3, Def. 7, p. 5; F §2.1, p. 7.)

Standing hypotheses of this target: (C4).

*Proof sketch.* Partial fractions give the decomposition on `O[z, z^(-1), (z^N - 1)^(-1)]`; on each closed rational subdomain of `W_r` between the boundary circles, the Gauss norms of the pieces on those circles bound the projections. `O(W_r)` is the Fréchet limit of these affinoid algebras, and `A⁺` is a dagger algebra with fringe Banach stages (AdicSpacesPartIV §§F1.2–F1.3, *dagger-norm-and-continuity*, *fringe-presentation*). So the decomposition extends to the weak completion and is unique. Expansions: on `]x[` each piece is analytic on a disc containing `]x[` (L0.7); on the end at `ζ` the pieces other than `f_ζ` are analytic near `ζ` and `f_ζ(1/(z - ζ))` is a Laurent tail (L0.11 carrier). (Hi): if `f` vanishes on a residue disc, its expansion around a point of the disc vanishes; the pieces are then determined by their singular parts at the removed discs, which vanish by uniqueness of the decomposition (each singular part is the principal part of the Laurent expansion on the corresponding end).

*Needs:* L1.25, AdicSpacesPartIV §§F1.2–F1.3, L0.7, L0.A1, L0.11, `PowerSeries.IsRestricted`.

### L1.27 The de Rham cohomology of the punctured line

**Theorem.** For `U_N`: `(H0) ker(d : A+(U_N)→Ω+(U_N)) = K_N`; `(H1)` every `η = f dz` in `Ω+(U_N) = A+(U_N) dz` can be written uniquely as `η =` dh `+ c_0 dz/z + sum_{ζ in μ_N} c_ζ dz/(z - ζ)`, with `h` in `A+(U_N)` unique up to `K_N, c_0 = res_0(η)` (residue at the end 0 in the coordinate `z`) and `c_ζ = res_ζ(η)` (coordinate `z - ζ`). Thus `H^1_dR+(U_N)` has basis `dz/z, dz/(z - ζ)`: dimension `N + 1 =` 2g `+ #D - 1` with `g = 0` and `#D = N + 2`. (BT §5, p. 18; BBK §3.1, p. 6.)

Standing hypotheses of this target: (C4).

*Proof sketch.* Decompose `f` by L1.26. `f_inf(z) dz` has an overconvergent primitive (L0.5 (c)). `f_0(1/z) dz = sum_{n ≥ 1} b_n z^(-n) dz`: the term `n = 1` is `b_1 dz/z`; for `n ≥ 2, z^(-n) dz = d(z^(1-n)/(1-n))` and the coefficients `b_n/(n - 1)` are overconvergent in `1/z` by L0.1 as in L0.5 (b). The same at each `ζ` with `z - ζ`. Uniqueness of the c's: residues at the ends vanish on exact forms (L0.12) and `res_0(dz/z) = 1, res_ζ(dz/(z - ζ')) = δ`; `(H0)`: if dh `= 0` each Mittag-Leffler piece is constant, so the polar pieces vanish (characteristic zero).

*Needs:* L1.25, L1.26, L0.5, L0.1, L0.11, L0.12.

### L1.28 Arithmetic Frobenius `z↦z^q` on the punctured line

**Lemma.** Put `K_N=ℚ_p(μ_N), q=#k_N=p^f`. The `K_N`-linear map `φ(z)=z^q` is an arithmetic Frobenius lift on `U_N`. Since `ζ^q=ζ` for `ζ` in `μ_N, φ*(dz/z)=q dz/z` and `φ*(dz/(z-ζ))=q dz/(z-ζ)+d log u_ζ`, with `u_ζ=(z^q-ζ)/(z-ζ)^q`. The numerator difference is divisible by `p` in `O_N[z]`; `log u_ζ` belongs to `A+(U_N)`, converging on `|z-ζ|>p^(-1/q)`, with `||u_ζ-1||≤|p|/|z-ζ|^q` for `|z|≤1` and `≤|p|/|z|` for `|z|>1`. At `0, log u_ζ=0`. Separately, the auxiliary analytic `p`-power map on `ℂ_p`-valued functions has the formula `p dz/(z-η_0)+d log((z^p-ζ)/(z-η_0)^p), η_0^p=ζ`. It permutes end labels and can be iterated `f` times to recover the `q`-map; for `f>1` it is not `AlgHom.IsArithFrobAt` over `O_N`. (BH §1.2, pp. 2-3; BBK §3.3, Algorithm 10, step 1, p. 7.)

Standing hypotheses of this target: `p` does not divide `N`; `q` is the cardinality of the residue field of `K_N`, so `q=p^f` and `ζ^q=ζ` for all `ζ` in `μ_N`.

*Proof sketch.* Every intermediate binomial coefficient of `(z-ζ)^q` is divisible by `p`, and `ζ^q=ζ`. The difference `z^q-ζ-(z-ζ)^q` is therefore in `p O_N[z]`. The same calculation for `z^(qN)-1` permits inversion in the dagger algebra by a geometric series. Factor `z^q-ζ` as `product_(ξ in μ_q)(z-ξ ζ)`. All `ξ` have `p`-power order, so lie in the residue disc of1; take logarithmic derivatives to obtain the displayed correction. The binomial coefficient estimate gives the two uniform bounds stated, and the logarithm series converges on a strict neighbourhood. The standard integral coordinate `z` is the one-chart specialization of the Taylor bounds proved in L1.21. At `z=0` the unit `u_ζ` is `(-1)^(1-q)`, a root of unity with logarithm0. For `N=1, q=p` and this is the historical `p`-power formula. The auxiliary `p`-map calculation is identical with `η_0^p=ζ`; its `f`-fold iterate is `z^q`.

*Needs:* L1.25, L1.26, L1.27, L1.5, L0.10, L0.13.

### L1.29 The Frobenius datum of the punctured line

**Theorem.** For `q=#k_N=p^f, (A+(U_N),ω=(dz/z,(dz/(z-ζ))_ζ),φ(z)=z^q,M=qI,g=(0,(log u_ζ)_ζ))` is the `K_N`-linear arithmetic Frobenius datum. H0,H1,Hi hold by the punctured-line de Rham and Mittag-Leffler targets, also after the stated coefficient extension. Hw holds because `M^(tensor n)=q^n I` and `||q^(nm)||_p=q^(-nm)<1`. The fixed ends0,`∞` have `φ*t=t^q`; the periodic Teichmueller points are the tame roots outside `μ_N`. Thus the realization, Coleman image, uniqueness and the coordinate-qualified lift independence/pullback apply. The auxiliary analytic `p`-map instead has matrix `p(1 direct_sum P), P`:`ζ→ζ^(1/p)`; its `f`-th iterate gives the `q`-datum, but the `p`-map is not arithmetic Frobenius over `K_N` when `f>1`. (BH §1.2, p. 3; F §2.2, p. 9.)

Standing hypotheses of this target: (C4).

*Proof sketch.* Assemble L1.25 de Rham, Mittag-Leffler and `q`-Frobenius statements. The logarithmic basis has at most simple poles at every end, and at0 the `q`-map preserves regular-`log CT` normalization. Hw: the complex norm of `q^(nm)` is `q^(nm)>1`, while its p-adic norm is `q^(-nm)<1`. Both exclude1; neither argument identifies the two norms. The standard integral coordinate `z` specializes L1.21 to the listed genus-zero maps. For the auxiliary `p`-map the permutation has order dividing `f` because `ζ^q=ζ`. Iterating its correction terms yields `M^f=qI` and the same `q`-Frobenius realization.

*Needs:* L1.7, L1.25, L1.26, L1.27, L1.28.

### L1.30 Coleman functions on the punctured line

**Definition.** For `p∤N` and branch `a`, define `A_Col^a(U_N)=ρ^a(U(U_N))⊆A_loc^a(U_N)`, using letters `e_0` for `dz/z` and `e_ζ` for `dz/(z−ζ), ζ∈μ_N`, and the datum L1.29. Normalize at the tangent at 0 by `CT_0ρ(L_w)=0` for `w≠∅`. Then `L_(e_0)=log_a z, L_(e_1)=log_a(1−z)`, and `−L_(e_0^(k−1)e_1)=Li_k`. `N=1` gives Furusho's Coleman ring on `P¹∖{0,1,∞}`, with the stated simple-pole and coordinate hypotheses satisfied. (F Def. 2.9, p. 9; BH §1.5.4, p. 19; BF §1, p. 1.)

- `PuncturedLine.colemanFunctions`: `PuncturedLine.colemanFunctions p N a` : the subalgebra `A_Col^a(U_N)` of `LocAn`.
- `PuncturedLine.iteratedIntegral`: `iteratedIntegral w := ρ^a(L_w)`, the regularised iterated integral from the tangential base point at 0.
- `PuncturedLine.d_iteratedIntegral`: `d L_(e_0 w) = L_w dz/z` and `d L_(e_ζ w) = L_w dz/(z - ζ)`.
- `PuncturedLine.constantTerm_iteratedIntegral`: `CT_0(L_w) = 0` for `w` nonempty.
- `PuncturedLine.iteratedIntegral_shuffle`: `L_u L_v =` sum over the shuffles `w` of `u` and `v` of `L_w`.
- `PuncturedLine.frobenius_iteratedIntegral`: For the arithmetic `q`-lift: `φ*L_(e_0)=q L_(e_0), φ*L_(e_1)=q L_(e_1)+log u_1` and `φ*L_w=q^|w|L_w` plus lower depth. The auxiliary `p`-map has `p^|w|L_(σ w)` plus lower depth; its `f`-fold iterate is the `q`-action.
- `PuncturedLine.iteratedIntegral_series`: For `w = e_0^(k-1) e_1, L_w = -sum_{n≥1} z^n/n^k` on `D^-(0, 1)`: the coefficients of the complex polylogarithm `Li_k^C` (L0.F).
- `PuncturedLine.pullback_S3`: `z↦1/z` and `z↦1 - z` act on `A_Col^a(U_1)` (L1.43).
- `PuncturedLine.pullback_power`: `z↦z^m` (`p` not dividing `m`) pulls `A_Col^a(U_1)` into `A_Col^a(U_m)`; `z↦ζ z` (`ζ a p`-power root of unity) preserves `A_Col^a(U_N)`.
- `PuncturedLine.branch`: `iota_(a,b)` maps `A_Col^a(U_N)` onto `A_Col^b(U_N)`; values on the tube are branch independent.

*Construction.* Instantiate L1.16 and L1.17 with L1.29 and the tangential base point at 0 (`φ`-fixed, `φ^* t_0 = t_0^q`). Identify `L_(e_0)` and `L_(e_1)`: `log_a z` and `log_a(1 - z)` are Coleman (depth-one realisations), have the right differentials and constant term 0 at 0, so they equal `ρ(L_(e_0)), ρ(L_(e_1))` by uniqueness. Series at 0: for `w` whose last letter is not `e_0`, the local expansion at 0 lies in `ℂ_p[[z]]` with value 0 at 0 (L1.14); for `w = e_0^(k-1) e_1` it is `-sum z^n/n^k`.

*Needs:* L1.29, L1.16, L1.17, L1.12, L1.14, L1.18, L1.22, L1.23, L0.F.

**Checks.**

- For `N = 1`: `iteratedIntegral [e_0] = log_a z` and `iteratedIntegral [e_1] = log_a(1 - z)`; at `z = ζ` in `μ_(p-1), ζ≠1, iteratedIntegral [e_0] (ζ) = 0`.
- With `H` the `D`-primitive of `log(u) dz/z` of constant term 0 at `0, ρ(H) = p (Li_2(z) - p^(-2) Li_2(z^p))`.
- On `A+(U_N)` the realisation is the inclusion; for `N = 1` the construction is the thrice-punctured line.
- On `D^-(0, 1), -iteratedIntegral (e_0^(k-1) e_1) = sum z^n/n^k`, whose coefficients are those of the complex `Li_k` (L0.F).
- For `p≥3, log_a z +` (indicator of the residue disc of 2) has differential `dz/z` and is not in `A_Col^a(U_1)`.

### L1.31 The primitive from the tangential base point at zero

**Construction.** For `F` in `A_Col^a(U_N)` and `η` in `Ω+(U_N)`, the based `primitive int_0^z F η` is the unique Coleman function `G` with `dG = F η` and `CT_0(G) = 0` (constant term of its expansion at the end 0). If the expansion of `G` at the end 0 lies in `ℂ_p[[z]]` (no logarithm and no negative powers), `CT_0(G) = G(0)`, so the normalisation is the value 0 at 0. For `x, y` in the tube, `int_x^y F η = G(y) - G(x)`. This is the operator by which Layer L2 defines `Li_k(z) = int_0^z Li_(k-1)(t) dt/t` with `Li_1(z) = int_0^z dt/(1 - t)`. (`F` Notation 2.6, p. 9; BH §1.5.4, p. 19.)

Standing hypotheses of this target: `p` does not divide `N`; a in `ℂ_p`.

- `PuncturedLine.basedPrimitive`: `basedPrimitive (F η)` : the Coleman function `G` with `dG = F η` and `CT_0(G) = 0`.
- `PuncturedLine.d_basedPrimitive`: `d (basedPrimitive (F η)) = F η`.
- `PuncturedLine.constantTerm_basedPrimitive`: `CT_0 (basedPrimitive (F η)) = 0`.
- `PuncturedLine.basedPrimitive_eq_zero_at_zero`: If the expansion of `basedPrimitive (F η)` at 0 lies in `ℂ_p[[z]]` then its value at 0 is 0.
- `PuncturedLine.basedPrimitive_unique`: A Coleman function `G` with `dG = F η` and `CT_0(G) = 0` equals `basedPrimitive (F η)`.
- `PuncturedLine.basedPrimitive_frobenius`: `φ^* (basedPrimitive (F η)) = basedPrimitive (φ^*(F η))`.
- `PuncturedLine.basedPrimitive_branch`: `iota_(a,b) (basedPrimitive_a (F η)) = basedPrimitive_b (iota_(a,b)(F) η)`.

*Construction.* Existence and uniqueness: L1.19 gives `G` modulo constants; `CT_0` fixes the constant, `CT_0` being linear with `CT_0(1) = 1`. Value at 0: for germs in `ℂ_p[[z]]` the constant term is the value at `z = 0` (API constantTerm_analytic of L1.14). Frobenius compatibility: `CT_0` is invariant for the arithmetic lift `φ^* z=z^q` and `φ^* l_0=q l_0, q=#k_N`. The explicitly labelled auxiliary `p`-map has the analogous identity with p.

*Needs:* L1.30, L1.19, L1.14.

**Checks.**

- `basedPrimitive (dz/(1 - z)) = -log_a(1 - z)`.
- `basedPrimitive (dz/z) = log_a z`, normalised by `CT_0 = 0` although it has no value at 0.
- `basedPrimitive 0 = 0`.
- No Coleman `primitive G` of `dz/z` has `G(0) = 0`: `G = log_a z + c` has no value at 0, so the value normalisation cannot replace the constant term.

### L1.32 Expansions on the removed residue discs

**Lemma.** Let `U_alg` be the subalgebra of `U(U_N)` with coefficients in the regular functions `K_N[z, z^(-1), (z^N - 1)^(-1)]` (functions of algebraic origin). For `y` in `U_alg` and `s` in `{0, ∞} u μ_N`, the actual realized end germ `ρ(y)_s` extends to the whole punctured residue disc: it lies in `O(D^-(s, 1) minus {s})[l_s]` with only finitely many negative powers of `t_s`; hence `ρ(y)` extends to a locally analytic function on `]s[` minus `{s}` and can be evaluated there. In particular `Li_k` restricted to `]1[` lies in `O(]1[)[log_a(z - 1)]` and can be evaluated at the `p`-power roots of unity different from 1, and `L_w` is analytic at 0 with value 0 when the last letter of `w` is not `e_0`. (F Prop. 2.11, p. 10; RJW Rem. 6.6, p. 39.)

*Proof sketch.* On `]s[` the forms `dz/z` and `dz/(z - ζ)` and the coefficients have singularities only at `s`, since the other points of `D_N` lie in other residue discs. The simple-pole word system has a normalized regular-log solution on the whole punctured residue disc. Its restriction is `λ_s`. The actual realization `ρ` on that end need not equal this independently `CT`-normalized family: L1.14 expresses it as the unique constant shuffle twist of `λ_s`. That twist has the same whole-disc convergence. Multiplying by the algebraic coefficients introduces only finitely many negative Laurent powers, so `ρ(y)` extends as stated. For words ending with a letter other than `e_0` the innermost integral is of a form regular at 0, so no logarithm at 0 arises.

*Needs:* L1.30, L1.14, L0.22, L0.20.

### L1.33 Tube of the four-punctured line

**Construction.** For `v` in `ℂ_p` define `specialUnitTube(v)={z: |z|=|z−1|=|z−v|=1}`. For `|v|=|1−v|=1` this is the tube of `P¹_k` minus {`0,1,∞,v`-bar}; the definition is the existing Set of `ℂ_p`-points, not a new analytic-space carrier. (F v2, §2.1, pp. 7–9, Assumption2.1 and Proposition2.5.)

Standing hypotheses of this target: `p` is prime; the set is defined for `v` in `ℂ_p`. The geometric assertion additionally assumes `v` lies in finite `K/ℚ_p` and `|v|=|1−v|=1`.

- `TauCeti.ColemanIntegration.mem_specialUnitTube`: `z` belongs exactly when `|z|=1, |z−1|=1` and `|z−v|=1`.
- `TauCeti.ColemanIntegration.specialUnitTube_subset`: `specialUnitTube(v)` is contained in the existing `puncturedTube(p,1)`.
- `TauCeti.ColemanIntegration.specialUnitTube_one`: `specialUnitTube(1)=puncturedTube(p,1)` as subsets of `ℂ_p`; this set equality does not assert a four-point good-reduction model.
- `TauCeti.ColemanIntegration.specialUnitTube_isOpen`: `specialUnitTube(v)` is open in the ultrametric topology on `ℂ_p`.

*Construction.* Define the indicated intersection of three norm level sets in the existing field `ℂ_p`. For the geometric interpretation use the three affine puncture sections and the specialization criterion: reduction differs from `c` exactly when `|z−c|=1` for integral `z,c`. Infinity is excluded by `|z|=1`.

*Needs:* `PadicComplex`, L1.3.

**Checks.**

- For `p=5,v=2`, the point3 belongs to `specialUnitTube(2)`.
- `v` never belongs to `specialUnitTube(v)`.
- `specialUnitTube(1)=puncturedTube(p,1)`.
- For `p=2,v=2, |v|` is not1, so the geometric separated-section hypothesis fails even though `specialUnitTube(2)` remains a defined set.

### L1.34 Separated four-point good-reduction model

**Lemma.** The pair `(P¹_(O_K), D_v)` with `D_v` the disjoint union of the sections `0,1,v,∞` is a good-reduction pair. Its affine complement is `Spec O_K[z,1/(z(z−1)(z−v))]`; its differentials are free on `dz`. Its wide opens are `W_r(v)={r<|z|<r⁻¹, |z−1|>r, |z−v|>r}, 0<r<1`. Its tube is `specialUnitTube(v)`. (F v2, §2.1, pp. 7–9, Assumption2.1 and Proposition2.5.)

Standing hypotheses of this target: (C5).

*Proof sketch.* The differences `v,1−v` and1 are units, so the three affine sections and the section at `∞` are pairwise disjoint over `O_K`. Each section is a copy of `Spec O_K`; their union is finite etale. Apply L1.1 construction to the smooth proper relative projective line, whose geometric fibres are connected. Compute the complement by localizing the affine `z`-chart at `z(z−1)(z−v)`. Localize the polynomial differential module: `dz` is a basis. Use parameters `z,z−1,z−v,1/z` in the existing wide-open construction to obtain `W_r` and the tube. This specializes existing geometry; it does not construct a generic projective-line library.

*Needs:* L1.1, L1.2, L1.33.

### L1.35 Principal parts at four separated punctures

**Lemma.** Write `A_v=A†(P¹ minus {0,1,v,∞})`. Every `f` in `A_v` has a unique decomposition `f=f_infinity(z)+f_0(1/z)+f_1(1/(z−1))+f_v(1/(z−v))`, where `f_infinity` is a power series and each finite-puncture series has zero constant coefficient; all four are restricted at some common radius `ρ>1`. Conversely each such expression lies in `A_v`. Restriction of `A_v` and `A_v dz` to any nonempty residue disc is injective. (F v2, §2.1, pp. 7–9, Assumption2.1 and Proposition2.5.)

Standing hypotheses of this target: (C5).

*Proof sketch.* Apply partial fractions to `K[z,1/(z(z−1)(z−v))]`. Assign the constant polynomial part only to `f_infinity`; otherwise uniqueness would fail. On a closed rational subdomain between the boundary circles, the Gauss estimates for the four expansions bound the projections to each principal part. Pairwise unit distances keep the discs disjoint. Pass these bounded projections to the completed algebra; passage through slightly smaller overconvergence radii gives the dagger union. Recover each negative Laurent tail from its own boundary circle, so all projections are unique. For the converse evaluate all four restricted series on a sufficiently small wide open `W_r` with `r⁻¹<ρ`. Apply the connected-domain identity principle of AdicSpacesPartIV §F1.8 (*dagger-identity-principle*, transporting TauCetiRoadmap AdicSpacesPartII §R1.9); `W_r` is the connected projective line with four disjoint closed discs removed. The same applies to differential coefficients because `dz` is a basis.

*Needs:* L1.34, L0.7, L0.11, `PowerSeries.IsRestricted`, AdicSpacesPartIV §§F1.2, F1.8.

### L1.36 Residue coordinates on the four-punctured line

**Theorem.** For `A_v, ker(d)=K` and every differential `η` in `A_v dz` has a unique residue vector `(c_0,c_1,c_v)` in `K³` with `η=`dh`+c_0 dz/z+c_1 dz/(z−1)+c_v dz/(z−v), h` in `A_v` unique modulo `K`. The three displayed logarithmic forms give a basis of `H¹` of the dagger de Rham complex; the residue at `∞` is `−c_0−c_1−c_v`. (F v2, §2.1, pp. 7–9, Assumption2.1 and Proposition2.5.)

Standing hypotheses of this target: (C5).

*Proof sketch.* Use L1.35 on the coefficient of `η`. Integrate the polynomial-side series and the negative Laurent terms with exponents different from`−1` termwise. Division by a nonzero integer preserves overconvergence after shrinking `ρ>1`: the existing ultrametric integer bound is polynomial in the index, while the radius margin supplies exponential decay. Apply L0.5 to each piece. The three remaining simple-pole coefficients are the corresponding residues. Exact forms have zero residue, so they determine the unique vector. If dh`=0`, characteristic-zero coefficient differentiation forces the polynomial part constant and all principal parts zero. Expand the three logarithmic forms in `t=1/z` to read residue`−1` at `∞` for each; exact forms contribute zero.

*Needs:* L1.35, L0.5, L0.1, L0.12, AdicSpacesPartIV §F1.9.

### L1.37 Small error in the `q`-power Frobenius polynomial

**Lemma.** For each `c` in `{0,1,v}, E_c(Z)=Z^q−c−(Z−c)^q` has every coefficient in the maximal ideal of `O_K` and degree less than `q`. Thus there is a real `δ<1` bounding the norms of all coefficients of the three `E_c`. On `W_s(v), |E_c(z)/(z−c)^q|≤δ/s^q` whenever0`<s<1`. For `c=0` the error is zero. (F v2, §2.1, pp. 7–9, Assumption2.1 and Proposition2.5.)

Standing hypotheses of this target: (C5).

*Proof sketch.* Reduce the polynomial modulo the maximal ideal. `FiniteField.pow_card` gives `c`-`bar^q=c`-bar, and `sub_pow_char_pow` gives (`Z−c`-bar)`^q=Z^q−c`-`bar^q`. The reduction is zero. The leading coefficients cancel, leaving degree at most `q−1`. Choose `δ` as the maximum of the finitely many coefficient norms and0; it is strictly less than1. For `|z|≤1`, the ultrametric bound gives `|E_c(z)|≤δ` and `|z−c|>s`. For `|z|>1, |z−c|=|z|` and the degree bound gives quotient norm`≤δ/|z|≤δ`.

*Needs:* L1.34, `FiniteField.pow_card`, `sub_pow_char_pow`, `PadicComplex.isNonarchimedean`.

### L1.38 Overconvergent Frobenius logarithmic corrections

**Lemma.** The `K`-linear `q`-power map `φ(z)=z^q` induces an endomorphism of `A_v`. For `c` in `{0,1,v}, u_c=(z^q−c)/(z−c)^q` is an overconvergent unit with a canonical convergent `log(u_c)` in `A_v`; `log(u_0)=0`. One has `φ*(dz/(z−c))=q dz/(z−c)+d log(u_c)`. This asserts convergence near the tube, not on all of the punctured residue disc. (F v2, §2.1, pp. 7–9, Assumption2.1 and Proposition2.5.)

Standing hypotheses of this target: (C5).

*Proof sketch.* Choose `s<1` sufficiently close to1 that `δ<s^q`. Then L1.37 gives `|u_c−1|<1` uniformly on `W_s`, so the geometric inverse and the inherited logarithm series converge after a strict radius margin. Their sums belong to `A_v`. For each target `W_r` choose `s` with `s^q>r` and `δ<s^q`. If `|z|≤1`, ultrametric strict domination gives `|z^q−c|=|z−c|^q`; if `|z|>1`, both norms equal `|z|^q`. The inequalities for0 and `∞` also hold. Hence `φ(W_s)` is contained in `W_r`, producing the dagger endomorphism. Differentiate `u_c` algebraically and use `d log u_c=du_c/u_c` on the convergence domain. The result is `q z^(q−1) dz/(z^q−c)−q dz/(z−c)`. For `c=0, u_0=1`.

*Needs:* L1.37, L0.10, L0.13, AdicSpacesPartIV §F1.2.

### L1.39 Frobenius datum for an arbitrary separated fourth point

**Theorem.** For the four-punctured line over finite `K`, the forms `dz/z,dz/(z−1),dz/(z−v)`, the `K`-linear lift `z↦z^q`, matrix `q I_3` and `corrections(0,log u_1,log u_v)` form the existing FrobeniusDatum, `satisfying(H0),(H1)`,(Hi),`(Hw)`. Therefore the inherited word-algebra construction and Coleman uniqueness apply to this concrete line. No general-curve de Rham comparison is required for this instance. (F v2, §2.1, pp. 7–9, Assumption2.1 and Proposition2.5.)

Standing hypotheses of this target: (C5).

*Proof sketch.* Supply H0 and H1 from L1.36 and Hi from L1.35. Supply the differential Frobenius equation from L1.38. All eigenvalues are `q`. Every nonempty product of them raised to a positive power is `q^(nm)`, which is not1 in characteristic zero. This is Hw; no Weil-weight theorem is used. Insert this datum into L1.12, realization and uniqueness constructions. The finite-extension and residue-cardinality hypotheses remain in force; this does not build a model for arbitrary transcendental `v` in `ℂ_p`.

*Needs:* L1.7, L1.36, L1.35, L1.38, L1.16, L1.18.

### L1.40 Integral argument maps on the four-punctured line

**Lemma.** The four nonconstant maps `z, v/z, v(z−1)/(z(v−1)), (1−z)/(1−v)` extend to `O_K`-automorphisms of `P¹` whose restriction sends `Y_v=P¹` minus `{0,1,v,∞}` into `U_1=P¹` minus `{0,1,∞}`. The constant map `v` also maps `Y_v` into `U_1`. Preimages of the ordered target `punctures(0,1,∞)` are `respectively(0,1,∞), (∞,v,0), (1,v,0), (1,v,∞)`. Each nonconstant map sends `specialUnitTube(v)` into `puncturedTube(p,1)`. (F v2, §2.1, pp. 7–9, Assumption2.1 and Proposition2.5.)

Standing hypotheses of this target: (C5).

*Proof sketch.* Represent the four maps by matrices `[[1,0],[0,1]], [[0,v],[1,0]], [[v,−v],[v−1,0]], [[−1,1],[0,1−v]]`. Their determinants1,`−v,v(v−1),v−1` are units, so the rational maps extend over `O_K` with invertible reduction. Solve their numerator, numerator-minus-denominator and denominator equations to obtain the preimage table, including `∞`. Their inverse images of the removed target sections are subsets of `D_v`. For the constant `v` both `v` and1`−v` are units, so it defines an integral section of `U_1`. On the tube, direct norm division proves the target and its complement have norm1. An additional removed source point may map to an ordinary target point: the identity sendsv tov. The scheme-morphism hypotheses of Furusho Proposition2.5 suffice. The analytic comparison is now supplied by L1.42 and L1.44, rather than an ends-to-ends assumption.

*Needs:* L1.34, L1.33, L1.25, `norm_div`.

### L1.41 Whole-disc composition in a fractional local coordinate

**Lemma.** Let `F(c+s)=Σ a_m s^m` be one power series converging on `|s|<1` in `ℂ_p`. For `|u|≤1` and `|b|≤1, F(c+u t/(1+b t))` is one power series on `|t|<1`. Its constant coefficient is `a_0` and, for `n≥1`, its coefficient is `Σ_(1≤m≤n) a_m u^m (−b)^(n−m) binom(n−1,m−1)`. For each `0<r<R<1` choose `C_R` with `|a_m|R^m≤C_R`; the composed coefficients `c_n` satisfy `|c_n|r^n≤C_R(r/R)^n`. In particular the ordinary target-disc function pulls back on the whole source disc, including its centre. (F arXiv math/0304085v2, §2.1, p. 7: the ordinary components are A(]x[); Proposition2.5, pp. 8–9.)

Standing hypotheses of this target: `p` is any prime; `c,u,b∈ℂ_p`; `|u|≤1` and `|b|≤1`. `F` has one expansion on the whole target disc, not merely local analyticity.

*Proof sketch.* Expand `u t/(1+b t)=Σ_(n≥1) u(−b)^(n−1)t^n`, using the existing geometric series. The denominator has norm1 for `|t|<1`. For `m≥1` the `m`-th power has coefficient `u^m(−b)^(n−m)binom(n−1,m−1)` for `n≥m`. Obtain this by the finite binomial expansion of `(1+b t)^(−m)`; the substitution has zero constant coefficient. The native ultrametric bound on natural-number casts bounds every binomial coefficient by1. Since `R<1` and `m≤n`, each coefficient term has norm at most `C_R R^(−n)`, giving the displayed all-radius bound. The `m=0` term is handled separately. For a fixed `|t|<r<R<1` the double sum is absolutely summable after taking real norms: the binomial majorants and `(|t|/R)^m` form convergent geometric tails. Exchange the sums and recover the actual composite. This estimate, rather than local analytic composition alone, supplies radius1.

*Needs:* L0.7, `FormalMultilinearSeries.ofScalars`, `HasFPowerSeriesOnBall`, `HasFPowerSeriesAt.comp`, `hasFPowerSeriesOnBall_inv_one_add`, `IsUltrametricDist.norm_natCast_le_one`.

### L1.42 Pullback at an additional source end

**Lemma.** For genus-zero good-reduction pairs `(P¹,D′)` and `(P¹,D)` over `O_K`, let `f` be an integral fractional-linear automorphism with `f^−1(D)⊆D′`. At a source end `e′` whose reduction maps into the ordinary target locus `Y_k`, an ordinary target component `H∈O(]f(e′)[)` pulls back to `H`∘`f∈O(]e′[)`, and hence to its Laurent end germ in `A_loc^a(Y′)`. At ends mapping to target ends use the existing logarithmic parameter substitution. These component maps define the usual `f#` on `A_loc` and commute with differentiation. Together with the inherited Taylor/Frobenius argument they permit L1.43 for these maps, even when an additional source end maps to an ordinary target point. (F arXiv math/0304085v2, Proposition2.5, pp. 8–9 (no ends-to-ends hypothesis), with the component rings on, p. 7.)

Standing hypotheses of this target: `K/ℚ_p` finite; disjoint reduction for both divisors and Frobenius data on both pairs. The `O_K` matrix of `f` has unit determinant and `f⁻¹(D)⊆D′`; extend coefficients and branch to `ℂ_p`. This genus-zero free-differential case requires L1.21's cross-map bounds. Local germ composition supplies only the component check; general gluing is separate.

*Proof sketch.* In residue-disc coordinates an integral fractional-linear automorphism has form `f(e′+t)=c+u t/(1+b t)`, with `|u|=1, |b|≤1`, when the image is ordinary. Use L1.41 to obtain one whole-disc pullback and restrict it to the source end. There is no target logarithmic symbol in this case. At an end mapping to a target end its parameter is `u t/(1+b t)`. The branch identity gives `log_a(u t/(1+b t))=log_a t+log_a u−log(1+b t)`; the last term is analytic on `|t|<1`. Use the existing annulus logarithmic parameter-change map. On every source component, the chain rule identifies `d(f#H)` with `f#(dH)`. Restriction to the end agrees with the dagger-algebra pullback, so the component map does not introduce a new choice of integration constant. For the inherited proof of Coleman functoriality, choose common powers of the Frobenius lifts. The two nearby maps `f`∘`φ′` and `φ`∘`f` have the same reduction. At a regular-image end apply Taylor expansion to the same ordinary target-disc series; at target-end images apply the existing logarithmic Taylor calculation. Thus the Frobenius equation used in L1.43 holds in all components of `A_loc`, not only on the tube. Dwork induction on word depth gives the same Coleman pullback.

*Needs:* L1.41, L1.4, L1.14, L1.21, L1.11, L0.20, L0.15, L0.10, L1.15, L1.16.

### L1.43 Pullback of Coleman functions

**Theorem.** Let `f*`:`A⁺(Y)→A⁺(Y′)` reduce to a morphism `Y′_k→Y_k` and map ends to ends; the Frobenius `q`-powers must have a common power. Prove `f*` preserves Coleman functions, commutes with `d` and satisfies `∫f*η=f*∫η` modulo constants. The finite-chart cross-map transport and nonfree differential gluing are supplied by L1.21. Include inversion and reflection on `U_1`, tame rotations on `U_N, p`-power rotations reducing to identity, inclusions `U_N→U_1`, and `z↦z^m`:`U_m→U_1` for `p∤m`. In the free genus-zero case also include integral fractional-linear maps with `f⁻¹(D)⊆D′`, allowing additional source ends to map to ordinary points; use L1.42 for their local comparison. (F Prop. 2.5 (Functorial Property), p. 8; BBK §2, Thm. 5 (c), p. 4; BT Def. 4.7, p. 13.)

Standing hypotheses of this target: Data on both pairs, `f` as stated, and L1.21's integral coordinates/uniform same-reduction cross-map bounds on source and target strict neighborhoods. Punctured-line maps meet these hypotheses. The extra genus-zero case uses L1.42's integral matrix/divisor conditions, without an ends-to-ends assumption.

*Proof sketch.* For the additional integral genus-zero case, use L1.42 to define the ordinary-image source-end component and to check the Taylor identity there. All components therefore enter the same induction below. By induction on depth, `G := f^* ρ(L_w)` satisfies `dG = f^*(ω_i) f^* ρ(L_w')` in `Ω_Col(Y')` by the induction hypothesis, so `G` minus a Coleman primitive of `dG` is locally constant on `Y'`. After replacing `φ, φ'` by powers with the same `q`, the maps `f o φ'` and `φ o f` are two lifts of the same morphism `Y'_k → Y_k`; the Taylor expansion of L1.21 (along the two maps `f o φ'` and `φ o f`, which reduce to the same map) shows `φ'^* G - f^* ρ(φ^# L_w)` is a Coleman function on `Y'` of lower depth. The target pure word has derivative of lower word length; subsequent derivatives can preserve that lower length through coefficient differentiation. This justifies the lower-depth claim without asserting that differentiation of every coefficient-word expression lowers depth. Let `F` be a Coleman primitive on the source of `dG`, obtained by the induction hypothesis and word integrability. Its Frobenius defect minus the lower-depth term `Q` is a Coleman function of zero differential and hence a global constant vector `c`. The locally constant vector `G-F` satisfies `φ'* (G-F)=M^(tensor n)(G-F)+c`. The finite-orbit linear-algebra argument gives the same unique constant vector on every residue class and end, because `I-M^(tensor n)` and every finite-orbit `I-M^(tensor nm)` are invertible. Thus `G-F` is global constant and `G` is Coleman. The argument does not assume a common base point for the two Frobenius lifts. Compatibility with int: both sides are primitives in `A_Col(Y')` of `f^* η`.

*Needs:* L1.17, L1.19, L1.21, L1.11, L1.22, L1.16, L1.42, L1.10, L1.13, L1.18.

### L1.44 Local coordinates of the four argument maps

**Lemma.** Fix `|v|=|1−v|=1` and write `f_0(z)=z, f_1(z)=v/z, f_2(z)=v(z−1)/(z(v−1)), f_3(z)=(1−z)/(1−v)`. At the source points `(0,1,v,∞)`, with parameters `(z,z−1,z−v,1/z)`, the target values are respectively `(0,1,v,∞), (∞,v,1,0), (∞,0,1,v/(v−1)), (1/(1−v),0,1,∞)`. For each entry use target parameter `w` at0, `w−1` at1, `1/w` at`∞`, and `w−c` at a regular value `c`. Every resulting coordinate is `u t/(1+b t)`. The rows `(u;b)` are `(1,1,1,1;0,0,0,0), (1/v,−v,−1/v,v;0,1,1/v,0), ((1−v)/v,v/(v−1),1/(v(v−1)),−v/(v−1);−1,1,1/v,0), (−1/(1−v),1/(v−1),1/(v−1),v−1;0,0,0,−1)`. All `|u|=1` and `|b|≤1`; every regular target value is a special unit. Thus the parameter map preserves `|t|` and gives an automorphism of the open unit disc. (F arXiv math/0304085v2, §2.1, pp. 7–9 and Proposition2.11, p. 10.)

Standing hypotheses of this target: `p` is any prime, including2; `v∈ℂ_p` is a special unit; `0<|t|<1` for formulas using `t^−1`. These local algebra/norm identities do not require `v` algebraic. The scheme/Frobenius use still takes `v` in a finite extension.

*Proof sketch.* Insert `z=t,1+t,v+t,t^−1` in the four rational maps from L1.40. Subtract the target value at regular images or1, and invert at`∞`. Direct field manipulation gives all sixteen displayed `(u,b)` pairs. Since `v,1−v` and1 have norm1, each `u` has norm1 and each `b` has norm at most1. For `|t|<1` the denominator1`+b t` has norm1. The inverse parameter substitution is `t=s/(u−b s)`, which converges on `|s|<1` and has the same norm. For the four extra-end cases the target centres are `v,v,v/(v−1),1/(1−v)`; their complements have norm1. The constant argument `v` is ordinary on every source disc. At an end image, the identity for `log_a(u t/(1+b t))` supplies the exact source logarithm and an analytic correction. At a regular image, L1.41 supplies one analytic pullback.

*Needs:* L1.40, L1.41, L0.15, L0.10, `norm_div`.

### Examples

- `(ℙ¹, {0, 1, ∞})` with `ω = (dz/z, dz/(z − 1))` and `φ(z) = z^p`: `M = pI` and `g = (0, log u)` with `u = (z^p − 1)/(z − 1)^p`, a principal unit on the wide open (L1.7, L1.29).
- `𝔸¹` has `H¹ = 0` and every differential is exact; `𝔾_m` has `H¹` spanned by `dz/z` with Frobenius eigenvalue `q` (L1.9).
- In the word algebra, `L[e₁]·L[e₂] = L[e₁e₂] + L[e₂e₁]`, and for `r = 1, ω₁ = dz/z` the realized `L[e₁ⁿ]` is `(log z)ⁿ/n!` (L1.12, L1.16).
- The Coleman integral of `dz/z` from 1 to `z` is `log_a(z)`, and of `dz/(1 − z)` from 0 to `z` is `−log_a(1 − z) = Li_1(z)` (L1.19, L1.31).
- The identity map of `A⁺(𝔾_m)` with `M = 1` is not a Frobenius lift and violates `(Hw)`; for it the constant of integration of `dz/z` cannot be fixed (L1.7).

### Dependencies

Layer L0; AdicSpacesPartIV F1; AdicSpacesPartIII R2, R3; TauCetiRoadmap AdicSpacesPartII §R1.9; PadicDifferentialEquationsAndRigidCohomology RD.0, RD.3.5, RD.3.12, RD.3.17–RD.3.18, RD.4–RD.6; TauCetiRoadmap JacobianChallenge Layer `B`; Tau Ceti `TauCeti.teichmuller`.

## Layer L2: Coleman polylogarithms and functional equations

Normalize the iterated integrals tangentially at zero, continue them onto the removed residue discs, and prove their distribution, inversion, branch-change and dilogarithm identities. The scalar five-term proof uses a four-punctured line, all its local components, and a geometric boundary sequence. Its algebraic projective and Bloch comparison is a distinct target.

### L2.Fa Complex polylogarithms on the closed unit disc

**Restriction and comparison.** PolylogarithmFunctions §§1.1–1.7 and §3.1 supply the principal complex family and its closed-disc analytic API. For `k ≥ 1` and `|z| ≤ 1`, the adapter equation is `complexPolylog k z = polylog k z`; the value at `k = 1, z = 1` is totalised, and values outside this disc carry no analytic contract. Its scalar-series realization is `Σ_(m≥1) z^m/m^k` for `k ≥ 2`, and `−Log(1 − z)` at weight one. The coefficient comparison with `q_k` of L0.F and the ordered weight-one root-of-unity boundary series are targets here. The remaining names below transport the supplied closed-disc series, continuity, exponential-zeta and distribution statements; inversion on the unit circle is the Bernoulli Fourier comparison used in the arithmetic formulas (RJW §6.2, Remark 6.6 and Theorem 6.7(i), pp. 38–39; PolylogarithmFunctions §§1.3, 1.7, 3.1).

- `complexPolylog`: the closed-disc adapter `Li_k^ℂ(z) = polylog k z` for `k ≥ 1, |z| ≤ 1` (total function, junk value at `z = 1` for `k = 1`).
- `complexPolylog_hasSum`: for `k ≥ 2` and `|z| ≤ 1`, or `k = 1` and `|z| < 1`, the series `Σ z^m/m^k` sums to `Li_k^ℂ(z)`.
- `complexPolylog_continuousOn`: for `k ≥ 2`, continuity on the closed unit disc.
- `complexPolylog_one`: `Li_1^ℂ(z) = −Log(1 − z)` on the closed disc minus 1.
- `complexPolylog_rootOfUnity_one`: for `ζ^N = 1, ζ ≠ 1`, the partial sums `Σ_(m=1)^M ζ^m/m` tend to `−Log(1 − ζ)` as `M → ∞`. This is ordered convergence (`Tendsto` of partial sums), not `HasSum` or `tsum`, which require unconditional convergence in `ℂ`.
- `complexPolylog_eq_expZeta`: for `k ≥ 2` and `a ∈ ℝ, Li_k^ℂ(e^(2πia)) =` `HurwitzZeta.expZeta` `a k`.
- `complexPolylog_distribution`: the distribution relation for `k ≥ 2`.
- `complexPolylog_inversion_rootOfUnity`: for `0 < x < 1` and `k ≥ 1, Li_k^ℂ(e^(2πix)) + (−1)^k Li_k^ℂ(e^(−2πix)) = −(2πi)^k B_k(x)/k!`, from Mathlib's `HurwitzZeta.cosZeta_two_mul_nat` and `HurwitzZeta.sinZeta_two_mul_nat_add_one` for `k ≥ 2` and from the Fourier series of `x − 1/2` for `k = 1`.
- `complexPolylog_coeff`: the Taylor coefficients at 0 are the images of those of `q_k`.

*In `Suggested.lean`:* `complexPolylog`, `complexPolylog_continuousOn`, `complexPolylog_eq_expZeta`, `complexPolylog_inversion_rootOfUnity`, `complexPolylog_hasSum`, `complexPolylog_rootOfUnity_one`, `complexPolylog_distribution`.

*Needs:* PolylogarithmFunctions §§1.1–1.7 and §3.1; L0.F; Mathlib `HurwitzZeta.expZeta`, `HurwitzZeta.hasSum_expZeta_of_one_lt_re`, `HurwitzZeta.cosZeta_two_mul_nat`, `HurwitzZeta.sinZeta_two_mul_nat_add_one`, `Complex.log`, `Complex.hasSum_taylorSeries_neg_log`.

**Checks.**

- `Li_2^ℂ(1) = π²/6` and `Li_2^ℂ(−1) = −π²/12`.
- `Li_1^ℂ(−1) = −`Log 2: the boundary series `Σ (−1)^m/m` converges to `−log 2`, while `Σ |(−1)^m/m|` diverges. Mathlib's unordered `tsum` of this series is therefore 0 and cannot define the weight-one boundary value; the explicit principal-logarithm definition gives the required value.
- `Li_k^ℂ(0) = 0` for every `k ≥ 1`.
- Inversion at `k = 1, x = 1/3` gives `Li_1^ℂ(e^(2πi/3)) − Li_1^ℂ(e^(−2πi/3)) = πi/3`, using `B_1(x) = x − 1/2`.
- Inversion at `k = 1, x = 1/4`: `Li_1^ℂ(i) − Li_1^ℂ(−i) = 2πi(1/2 − 1/4) = πi/2`, whereas p-adically `Li_1(ζ) − Li_1(ζ⁻¹) = 0` at roots of unity (L2.9).
- For `k = 2` the distribution relation with `m = 2` at `z = 1` gives `Li_2^ℂ(1) = 2(Li_2^ℂ(1) + Li_2^ℂ(−1)), i.e`. `π²/6 = 2(π²/6 − π²/12)`.

### L2.Fb The pre-Bloch and Bloch groups of a field, and the projective five-term relation

**Construction.** For any field `K` let `Symbols K` be the free abelian group on `K ∖ {0, 1}`, with the total notation `symbol` equal to 0 at 0 and 1. For `x, y ≠ 0, 1` with `x ≠ y`, `fiveTermRelation` is `[x] − [y] + [y/x] − [(1 − x⁻¹)/(1 − y⁻¹)] + [(1 − x)/(1 − y)]`. `fiveTermSubgroup` is generated by these expressions; `PreBlochGroup` is the integral quotient and `preBlochSymbol` its generator map. No inversion or complement relation is imposed separately. `UnitTensor` is `Additive(K^×) ⊗_ℤ Additive(K^×)`; `symmetricTensorRelations` spans `u ⊗ v + v ⊗ u`, and its quotient is `AntisymmetricSquare`, with pure classes `tensorClass`. This carrier keeps the diagonal 2-torsion: it differs from the alternating exterior square and from the further quotient used by de Jeu. `boundaryRaw` sends `[x]` to `x ⊗ (1 − x)`; it kills the generating relations, so it descends to `boundary` on the pre-Bloch group, and `BlochGroup` is its kernel (DJ §3, p. 7, for the integral carriers and the boundary; Prop. 2.10, pp. 6–7, and its proof, pp. 14–15, for the p-adic relations and the branch formula).

On `ℂ_p`, `dilogEvaluation a` sends `[x]` to Coleman's dilogarithm `D^a(x)` of L2.18, using the scalar five-term relation L2.69 to descend. The additive `branchPair a` on the antisymmetric square is `(u ⊗ v) ↦ (v_p(u) log_a(v) − v_p(v) log_a(u))/2`; it is independent of `a`, and `D^b(z) − D^a(z) = (b − a)·branchPair a(δz)`. Hence the evaluation on the Bloch group of `ℂ_p`, or on the Bloch group of any field `K` transported along `K → ℂ_p`, does not depend on the branch.

The projective-coordinate adapters consume PolylogarithmFunctions §5.8 over every field `K`. With `e = OnePoint.equivProjectivization K`, their comparison equation on distinct tuples is `crossRatio K (e a) (e b) (e c) (e d) = 1 − crossRatioSphere a b c d`. The determinant comparison, Möbius invariance and `normalize_five` are transported through `e`, using its equivariance for the `GL₂(K)` action. The linear-equivalence form uses the matrix of the map in the standard basis. On coincident tuples the determinant formula retains its total values; invariance there follows from cancellation of the nonzero determinant factor, without extending the `1 − r` equation to zero denominators. Field-map compatibility, the cyclic-to-scalar calculation and group descent are targets here.

For these adapters, `Point K = Projectivization K (Fin 2 → K)`, with `finitePoint x = [x : 1]`, `infinity = [1 : 0]` and `detPair(v, w) = v₀w₁ − v₁w₀`. `crossRatio(a, b, c, d) = Δ(a, b)Δ(c, d)/(Δ(a, d)Δ(c, b))` on representatives; nonzero rescaling cancels, and total division gives 0 at zero denominators, outside the analytic locus. For finite points it is `(a − b)(c − d)/((a − d)(c − b))`, and with `∞` in the first, second, third or fourth place it is `(c − d)/(c − b), (c − d)/(a − d), (a − b)/(a − d)` or `(a − b)/(c − b)`. For an injective four-tuple both denominators are nonzero and `r ≠ 0, 1`; swapping `b` and `c` gives `1 − r`, swapping `b` and `d` gives `r⁻¹`, exchanging the two ordered pairs preserves `r`, and `r` is invariant under `Projectivization.map` of an invertible linear map. Three distinct points are sent to `∞, 0, 1` by a projective map unique among induced projective maps. `coordinateMap f` applies a field homomorphism `f` : `K → E` in each coordinate and `fieldMap f` is the induced injective map of projective lines, with `r(fa, fb, fc, fd) = f(r(a, b, c, d))`. `normalizedFive x y = (∞, 0, 1, x, y)` is injective exactly when `x, y ≠ 0, 1` and `x ≠ y`, and every injective five-tuple is projectively equivalent to one of this form; its cyclic cross-ratios are `1 − x, (x − y)/(y(x − 1)), (x − 1)/(x − y), (x − y)/x` and `1/(1 − y)`. For any additive group A and `f` : `K → A` with `f(1 − z) = f(z⁻¹) = −f(z)` on `z ≠ 0, 1`, the cyclic sum of `f` over these cross-ratios is the negative of the scalar five-term expression; with `q = (1 − x⁻¹)/(1 − y⁻¹)` and `r = (1 − x)/(1 − y)`, the second ratio is `1 − q⁻¹` and the third `r/(r − 1)`, and `q, r ≠ 0, 1` are checked before the two-term laws are applied. A scalar five-term identity therefore transfers to every distinct projective five-tuple; no cyclic symbol relation in the integral pre-Bloch group is asserted. Applied to Coleman's `D` through `K → ℂ_p` it gives the projective five-term relation (FPZ §6, Definition 6.2 and Proposition 6.3, pp. 19–20; Theorems 6.4–6.5, pp. 20–21; Propositions 6.7 and 6.9, pp. 21–22, specialized to fields; our cross-ratio is one minus FPZ's). The cyclic-to-scalar calculation is the explicit deduction above, not a theorem of FPZ or of `W` §4.

- `symbol_admissible`, `symbol_zero`, `symbol_one`; `fiveTermRelation_arguments` (admissibility of the three ratios).
- `preBlochSymbol_zero`, `preBlochSymbol_one`, `preBlochSymbol_fiveTerm`.
- `preBlochGroup_lift`: a map `K → A` to an additive group, zero at 0 and 1 and killing every five-term expression, induces a unique additive map.
- `preBlochMap` with `preBlochMap_symbol`, `preBlochMap_id`, `preBlochMap_comp`.
- `tensorClass_mul_left`, `tensorClass_mul_right`, `tensorClass_swap`, `tensorClass_diagonal_two_torsion`, `antisymmetricSquare_hom_ext`; `antisymmetricMap` with `antisymmetricMap_tensorClass`, `antisymmetricMap_id`, `antisymmetricMap_comp`.
- `boundaryRaw_fiveTerm`, `boundary_symbol`, `boundary_natural`, `mem_blochGroup_iff`, `boundary_complement` (`[x] + [1 − x]` lies in the Bloch group); `blochMap` with `blochMap_val`, `blochMap_id`, `blochMap_comp`.
- `dilogEvaluation_symbol`, `branchPair_tensorClass`, `branchPair_branch_independent`, `dilogEvaluation_branch_change`, `dilogEvaluation_bloch_branch_independent`, `dilogEvaluation_field_bloch_branch_independent`.
- `finitePoint_injective`, `finitePoint_ne_infinity`, `exists_finitePoint_iff`; `detPair_swap`, `detPair_smul`, `detPair_eq_zero_iff`.
- `crossRatio_mk`, `crossRatio_finite`, `crossRatio_infinity_first`, `crossRatio_infinity_second`, `crossRatio_infinity_third`, `crossRatio_infinity_fourth`, `crossRatio_admissible`, `crossRatio_complement`, `crossRatio_inverse`, `crossRatio_pair_swap`, `crossRatio_linearEquiv`, `exists_normalizer`, `normalizer_unique`: coordinate and bracket forms of PolylogarithmFunctions §5.8, with the displayed `1 − r` equation on distinct tuples. Uniqueness follows because a projective map fixing `∞, 0, 1` is the identity.
- `coordinateMap_injective`, `fieldMap_finite`, `fieldMap_infinity`, `fieldMap_injective`, `fieldMap_id`, `fieldMap_comp`, `crossRatio_fieldMap`.
- `normalizedFive_injective_iff`, `normalize_five`, `normalizedFive_crossRatios`, `normalized_cyclic_sum`, `cyclic_relation_of_scalar`, `dilogD_cyclic`, `dilogD_cyclic_field`, `dilogEvaluation_cyclic_field`.

*In `Suggested.lean`:* `ProjectiveAlgebra.Point`, `ProjectiveAlgebra.finitePoint`, `ProjectiveAlgebra.infinity`, `ProjectiveAlgebra.detPair`, `ProjectiveAlgebra.crossRatio`, `ProjectiveAlgebra.normalizedFive`, `ProjectiveAlgebra.crossRatio_finite`, `ProjectiveAlgebra.cyclic_relation_of_scalar`, `ProjectiveAlgebra.crossRatio_admissible`, `ProjectiveAlgebra.crossRatio_linearEquiv`, `ProjectiveAlgebra.normalize_five`.

*Needs:* PolylogarithmFunctions §5.8; L0.15, L0.16, L2.18, L2.69; Mathlib `OnePoint.equivProjectivization`, `OnePoint.equivProjectivization_smul`, `FreeAbelianGroup.of`, `FreeAbelianGroup.lift`, `QuotientAddGroup.mk'`, `QuotientAddGroup.lift`, `TensorProduct`, `Submodule.span`, `Submodule.mkQ`, `Projectivization.mk`, `Projectivization.rep`, `Projectivization.mk_rep`, `Projectivization.mk_eq_mk_iff'`, `Projectivization.map`, `Projectivization.map_mk`.

**Checks.**

- Symbols: `[0] = [1] = 0`, while `[2] ≠ 0` and `[2] + [1/2] ≠ 0` over `ℚ` (no inversion relation is imposed before the quotient).
- Pre-Bloch group: the signed five-term expression at `(x, y) = (4, 2)` is zero, removed points are zero, and `[2]` is sent to `[2]` along `ℚ → ℂ`.
- Antisymmetric square: `1 ⊗ u = u ⊗ 1 = 0` and `2((−1) ⊗ (−1)) = 0`, but `(−1) ⊗ (−1) ≠ 0` over `ℚ`, detected by the sign pairing modulo 2; an exterior square would make it zero.
- Boundary: the `(4, 2)` expression maps to zero, `δ[2] = 2 ⊗ (−1)` and `δ[0] = 0`; `[2] + [−1]` and 0 lie in the Bloch group.
- Evaluation sends 0 and the `(4, 2)` expression to 0 and agrees for all branches on `[x] + [1 − x]`; on `ℂ_3, branchPair` sends `3 ⊗ 4` to `log_a(4)/2`.
- `finitePoint 0` `= [0 : 1], finitePoint 1 ≠ finitePoint 0`, and `finitePoint x = finitePoint y` iff `x = y`; `infinity` `= [1 : 0] = [7 : 0]` over `ℚ`.
- `Δ((1, 0), (0, 1)) = 1` with reverse `−1`; `Δ((2, 4), (3, 6)) = 0`; `Δ((2, 0), (0, 3)) = 6`.
- Over `ℚ`: `r(∞, 0, 1, 3) = −2` and `r(0, 1, 2, 3) = −1/3`, and the rescaled representatives `(2, 0), (0, 3), (5, 5), (21, 7)` still give `−2`; with `∞` in second, third or fourth place among `(0, 1, 3)` the values are `2/3, 1/3` and `−1/2`; the collision `a = d` gives the excluded total value 0.
- Under the adapter equation, the supplier's `r(∞, 0, 1, 3) = 3` gives the bracket `−2`; its coordinate-swap test over `𝔽₃` has `r = 2`, hence bracket `1 − 2 = 2` before and after the swap. At the coincident tuple `(0, 0, 0, 2)` both total determinant quotients are 0, so the bracket is not `1 − r = 1`; distinctness is essential for this comparison.
- `normalizedFive 2 3` is injective with cyclic cross-ratios `(−1, −1/3, −1, −1/2, −1/2)`, and `normalizedFive 2 2` is not injective.

### L2.1 The polylogarithm power series on the open unit disc of `ℂ_p`

**Definition.** For `k∈ℤ` use the rational series `polylogSeries k=Σ_(n≥1)X^n/n^k` in `ℂ_p`. Its radius is exactly 1, with no convergence at `|z|=1`. On `D⁻(0,1), Li_k^ser(0)=0, (Li_k^ser)′(0)=1` and `z(Li_k^ser)′=Li_(k−1)^ser`. `Li_0^ser=z/(1−z), Li_1^ser=−log_a(1−z)` for a; for `k≤0` use `(z d/dz)^(−k)(z/(1−z))`. Values lie in every complete coefficient subfield containing `z`, and commute with continuous automorphisms of `ℂ_p`. (F §2.2, (2.1), Lem. 2.7 and Lem. 2.8, p. 9; BDJ §1, p. 869 (Ann. Sci. ENS 36 (2003));, p. 3 of v2; BHYY §1, (1.1), p. 1.)

Standing hypotheses of this target: `k ∈ Z`; `p` prime; `ℂ_p` with `|p| = 1/`p. The analytic function is defined on the open disc `|z| < 1` only; no continuation is part of this definition.

- `polylogSer`: `polylogSer p k` : `ℂ_[p] → ℂ_[p], z ↦ Σ'_{n≥1} z^n/n^k`; this is `Li_k^ser(z)` for `|z| < 1` (and the junk value 0 of the unconditional sum elsewhere).
- `polylogSer_hasFPowerSeriesOnBall`: `polylogSer p k` has the power series `Σ_{n≥1} n^{−k}X^n` at 0 on the ball of radius 1.
- `radius_polylogSeries`: The radius of convergence over `ℂ_[p]` of `Σ_{n≥1} z^n/n^k` is exactly 1, for `k ∈ Z`.
- `polylogSer_zero`: `polylogSer p k 0 = 0`.
- `polylogSer_zero_index`: For `|z| < 1, polylogSer p 0 z = z/(1 − z)`.
- `polylogSer_hasDerivAt`: For `|z| < 1`: `HasDerivAt` `(polylogSer p (k+1)) (polylogSer p k z / z) z` when `z ≠ 0`, and `HasDerivAt` `(polylogSer p (k+1)) 1 0`.
- `polylogSer_one_eq_neg_logOneAdd`: For `|z| < 1, polylogSer p 1 z = −``NormedSpace.logOneAdd` `ℂ_[p] ℂ_[p] (−z)` (Tau Ceti's series logarithm).
- `polylogSer_eq_eval_polylogSeries`: The coefficients of `polylogSer` are the images in `ℂ_[p]` of the rational coefficients of L0.F’s rational series `q_k`.
- `polylogSer_mem_of_mem`: If `K ⊂ ℂ_[p]` is a closed subfield, `z ∈ K` and `|z| < 1`, then `polylogSer p k z ∈ K`.
- `polylogSer_map`: For a continuous ring automorphism `σ` of `ℂ_[p]` and `|z| < 1, σ(polylogSer p k z) = polylogSer p k (σ z)`.

*Construction.* Radius: for `k ≥ 0, |1/n^k|_p = p^{k·v_p(n)} ≤ n^k`, and for `k < 0, |n^{−k}|_p ≤ 1`, so `Σ |z|^n |n^{−k}|_p` converges for `|z| < 1` and the radius is at least 1 (Mathlib `FormalMultilinearSeries.radius`). At `|z| = 1` the terms have `|z^n/n^k|_p ≥ 1` for all `n` prime to `p`, so they do not tend to 0 and the radius is exactly 1. A power series with positive radius `r` is the power series expansion of its sum on the ball of radius `r` (Mathlib `HasFPowerSeriesOnBall`), so `Li_k^ser` is analytic on `D⁻(0,1)`. Termwise differentiation does not change the radius: `z·(d/dz)Σ z^n/n^k = Σ z^n/n^{k−1}`. `Li_0^ser = Σ_{n≥1} z^n = z/(1−z)` on `D⁻(0,1)`; `Li_1^ser = Σ z^n/n = −log(1−z)` by the definition of the logarithm series, and `log_a` restricted to `1 + m_{ℂ_p}` is that series (L0.15). The coefficients lie in `Q ⊂ K` and a closed subfield is closed under convergent sums; a continuous automorphism `σ` fixes `Q` and commutes with limits.

*In `Suggested.lean`:* `polylogSer`, `polylogSer_hasFPowerSeriesOnBall`, `radius_polylogSeries`, `polylogSer_hasDerivAt`, `polylogSer_zero_index`, `polylogSer_one_eq_neg_logOneAdd`, `polylogSer_map`, `polylogSer_mem_of_mem`.

*Needs:* L0.F, L0.15, `PadicComplex`, `FormalMultilinearSeries.radius`, `HasFPowerSeriesOnBall`, `PowerSeries`, `NormedSpace.logOneAdd`, `NormedSpace.logOneAdd_eq_tsum`.

**Checks.**

- `polylogSer p 0 (p : ℂ_[p]) = p/(1 − p)`.
- For `p ≥ 5`: `‖polylogSer p 2 (p : ℂ_[p]) − p‖ = p^{−2}`.
- `polylogSer p k 0 = 0` for `k ∈ Z`.
- For `k ≥ 0` the family `n ↦ (1 + p)^n / n^k` is not summable in `ℂ_[p]`: the series gives no value on the residue disc of 1.
- For `|z| < 1`: `polylogSer p 1 z = −``NormedSpace.logOneAdd` `ℂ_[p] ℂ_[p] (−z)`.

### L2.2 In which residue disc a root of unity lies

**Lemma.** Let `ζ ∈ ℂ_p` be a root of unity of exact order `N ≥ 2`. If `N = p^r` with `r ≥ 1`, then `|ζ − 1| = p^{−1/(p^{r−1}(p−1))} < 1`: `ζ` lies in the residue disc of 1, with `|ζ − 1| > p^{−1/(p−1)}` if and only if `r ≥ 2` and `|ζ − 1| = p^{−1/(p−1)}` for `r = 1`. If `N` is not a power of `p`, then `|ζ| = |ζ − 1| = 1`: `ζ` and `1 − ζ` are units, `ζ` lies in a residue disc of `U = P¹ ∖ {0,1,∞}`, and `v(1 − ζ) = 0`. For `c ∈` (`Z/`NZ)`^×` the same holds for `ζ^c`, with `|1 − ζ^c| = |1 − ζ|`. When `p ∤ N` and `K ⊂ ℂ_p` is a finite extension of `ℚ_p` containing `ζ, ζ` is the Teichmüller representative of its reduction (the roots of unity of order prime to `p` in `K` are the image of the Teichmüller lift of the residue field of `K`). (BHYY §3.1, p. 14; RJW Proof of Lem. 6.4, p. 38; BF Proof of Corollary 2.2, p. 2.)

Standing hypotheses of this target: `N ≥ 2` the exact order of `ζ`; `p` prime.

*Proof sketch.* `Φ_N(1) = Π_{c∈(Z/N)^×}(1 − ζ^c)` (Mathlib `Polynomial.cyclotomic` and Mathlib `IsPrimitiveRoot`); `Φ_{p^r}(1) = p` (Mathlib `Polynomial.eval_one_cyclotomic_prime_pow`), and for `N` not a prime power `Φ_N(1) = 1` (Mathlib `Polynomial.eval_one_cyclotomic_not_prime_pow`), while `Φ_{ℓ^s}(1) = ℓ` for a prime `ℓ ≠ p`, a p-adic unit. All factors have the same absolute value: `1 − ζ^c = (1 − ζ)(1 + ζ + ⋯ + ζ^{c−1})` gives `|1 − ζ^c| ≤ |1 − ζ|`, and exchanging `ζ` and `ζ^c` (`ζ = (ζ^c)^{c'}` with `cc' ≡ 1`) gives the reverse inequality. Hence `|1 − ζ|^{φ(N)} = |Φ_N(1)|_p`, which is `p^{−1}` for `N = p^r` and 1 otherwise; `φ(p^r) = p^{r−1}(p − 1)`. `|ζ| = 1` since `ζ^N = 1` (Mathlib `PadicComplex`, the absolute value is multiplicative). Teichmüller: for `K` finite over `ℚ_p` with residue field of size `q`, the roots of unity of order prime to `p` in `K` are the `(q−1)-`st roots of unity, which are the image of the Teichmüller lift (Tau Ceti `TauCeti.teichmuller`, Tau Ceti `TauCeti.range_teichmuller`).

*In `Suggested.lean`:* `rootOfUnity_norm_one_sub`, expressing the distance through its `φ(N)`-th power for exact order `N ≥ 2`.

*Needs:* `PadicComplex`, `IsPrimitiveRoot`, `IsPrimitiveRoot.prod_one_sub_pow_eq_order`, `Polynomial.cyclotomic`, `Polynomial.eval_one_cyclotomic_prime_pow`, `Polynomial.eval_one_cyclotomic_not_prime_pow`, `TauCeti.teichmuller`, `TauCeti.range_teichmuller`.

**Checks.**

- At `p = 2`, the primitive second root `−1` has `|1 − (−1)|₂ = 1/2`.
- At `p = 3`, the same root has distance 1 from 1, since its order is prime to 3.
- A primitive ninth root in `ℂ₃` has distance `3^(−1/6)` from 1; a primitive third root has distance `3^(−1/2)`.

### L2.3 Existence and uniqueness of Coleman's polylogarithms

**Theorem.** On `U=P¹∖{0,1,∞}`, for branch a and `k≥1` construct the unique Coleman sequence `Li_1^a`,…,`Li_k^a` with `Li_1^a=−log_a(1−z), dLi_j^a=Li_(j−1)^a dz/z` for `j≥2`, and end germ at 0 equal to `Li_j^ser`, without logarithmic terms. Thus it extends over `D⁻(0,1)` with value 0. All Coleman primitives of `Li_(j−1)^a dz/z` differ from `Li_j^a` by `a ℂ_p` constant; this normalization removes it. Prove independence of the auxiliary Frobenius lift. (BDJ §1, p. 869 (Ann. Sci. ENS 36 (2003));, p. 3 of v2; BDJ §2, p. 875 (published); F Rem. 2.10(2), p. 10; BT Corollary 4.14 and Thm. 4.15, p. 14; W §0, Thm. A', p. 345.)

Standing hypotheses of this target: `a∈ℂ_p, p` prime, `k≥1`; L1 integration on `(P¹,{0,1,∞})` over `ℤ_p` with `dz/z, dz/(1−z)`. In (iii), the base 0 is outside `U`, but `Li_(j−1)dz/z` is regular there since `Li_(j−1)(0)=0`; this agrees with L2.6's tangential normalization.

*Proof sketch.* `j = 1`: `1 − z` is a rigid-analytic unit on the wide open neighbourhoods of `U`, so `log_a(1 − z)` is a Coleman function with `d log_a(1 − z) = d(1 − z)/(1 − z)` (L1.31: the Coleman integral of `df/f` for a rigid unit `f` is `log_a f`). On `D⁻(0,1), 1 − z ∈ 1 + m_{ℂ_p}`, so `−log_a(1 − z) = Li_1^ser(z)` for every a (L0.15). Inductive step `j ≥ 2`: `ω := Li^a_{j−1}·dz/z` lies in `A^a_Col(U)·Ω†(U)`; Coleman integration gives `F ∈ A^a_Col(U)` with `dF = ω`, unique up to an additive constant (L1.31). On the residue annulus of 0 the restriction of `Li^a_{j−1}` is `Li_{j−1}^ser` (induction), so `ω = Σ_{n≥1} z^{n−1}/n^{j−1} dz = d(Li_j^ser)` there; hence `F − Li_j^ser ∈ A(annulus)[log_a z]` has zero differential and is a constant `c` (the kernel of `d` on log-Laurent series on an annulus is `ℂ_p`: L0.22). Put `Li^a_j := F − c`. Uniqueness: two solutions differ by a Coleman function with zero differential, which is a global constant (L1.18); it vanishes on the residue annulus of 0, hence everywhere. Independence of the Frobenius lift: `A^a_Col(U)` and its integration do not depend on the lift (L1.22), and (i)`-`(iii) do not mention it.


*Needs:* L2.1, L0.15, L1.30, L1.31, L1.19, L1.18, L1.22, L0.21, L0.22.

**Checks.**

- On `|z| < 1`, every branch gives `Li_k(z) = Σ_(m≥1) z^m/m^k` and `Li_k(0) = 0`.
- At `p = 5`, adding a constant on the residue disc of 2 preserves the local differential equation but violates the Frobenius characterization, as in L2.12.
- The prime `p = 2` is included; the Frobenius difference is analytic for `|z − 1| > 1/2`.

### L2.4 The polylogarithms on the punctured residue discs of 1 and `∞`

**Lemma.** For `k≥1` define `λ_k=Li_k^a+log(z)^(k−1)log_a(1−z)/(k−1)!` near 1. It extends branch independently to `D⁻(1,1)`, with `λ_1=0, dλ_k=λ_(k−1)dz/z+log(z)^(k−1)dz/((k−1)!(z−1))` for `k≥2`, and `λ_2(z)=λ_2(1)−Li_2^ser(1−z)`. At `∞ Li_k^a` is polynomial in `log_a(1/z)` with coefficients analytic on `D⁻(0,1)` in `1/z`. These end expansions, the whole ordinary residue-disc series and `Li_k^ser` near 0 give unique locally analytic continuation to `ℂ_p∖{1}`, satisfying `dLi_k^a=Li_(k−1)^a dz/z`. (F Prop. 2.11, p. 10; F Proof of Thm. 2.13, p. 10; BDJ Proof of Prop. 2.6, p. 877 (published); BBdJR §4, class of functions (1)-(2), p. 19.)

Standing hypotheses of this target: `a ∈ ℂ_p, k ≥ 1`. `log_a(1 − z) = log_a(z − 1)` since `log_a(−1) = 0` for branch. `A(D)` is the ring of analytic functions on the open disc `D` (convergent power series), `A(annulus)` the ring of convergent Laurent series on the annulus.

*Proof sketch.* For `k≥2`, differentiate the definition using the differential recursion: `d λ_k=λ_(k-1) dz/z+log(z)^(k-1) dz/((k-1)!(z-1))`. For `k=1` the separately computed `λ_1` is0; the recurrence is not applied to an undefined `λ_0`. Induction on `k`: `λ_1 = −log_a(1 − z) + log_a(1 − z) = 0`. If `λ_{k−1} ∈ A(D⁻(1,1))`, the right-hand side is an analytic 1-form on `D⁻(1,1)` (`0 ∉ D⁻(1,1)` and `log(z)/(z − 1) = Σ_{n≥1}(−1)^{n−1}(z − 1)^{n−1}/n`); it has an analytic `primitive μ` on `D⁻(1,1)` (L0.8), and `λ_k − μ ∈ A(annulus)[log_a(z − 1)]` has zero differential, hence is constant (L0.22). So `λ_k ∈ A(D⁻(1,1))`. Branch independence: the transport `ι_{a,b}` of ColemanIntegration L1 (replace `log_a` of local parameters at `0, 1, ∞` by `log_b`) maps `Li^a_k` to `Li^b_k`, since both satisfy the characterisation of the existence theorem; `λ_k` has no logarithmic term, so `ι_{a,b}(λ_k) = λ_k, i.e`. `λ_k` computed with a equals `λ_k` computed with `b`. `k = 2`: `dλ_2 = log(z)dz/(z − 1) = Σ_{n≥1}(−1)^{n−1}(z − 1)^{n−1}/n dz = −d(Li_2^ser(1 − z))` termwise, so `λ_2(z) = λ_2(1) − Li_2^ser(1 − z)`. (b) Induction on `k` with `u = 1/z, dz/z = −du/u`. For `k = 1, −log_a(1 − z) = log_a u − log(1 − u)` (as `1 − z = −z(1 − u)`), which lies in `A(D⁻(0,1)_u)[log_a u]`. If `Li^a_{k−1} = Σ_j f_j(u)log_a(u)^j` with `f_j ∈ A(D⁻(0,1))`, then `−f_j(u)log_a(u)^j du/u` has a primitive in `A(D⁻(0,1))[log_a u]`: write `f_j = f_j(0) + u g_j(u)`; `f_j(0)log_a(u)^j du/u` integrates to `f_j(0)log_a(u)^{j+1}/(j+1)`, and `g_j(u)log_a(u)^j du` integrates by parts, with `G_j := ∫_0^u g_j` analytic on the disc and `G_j/u` analytic (L0.8). `Li^a_k` minus this primitive has zero differential on the annulus, hence is constant (L0.22). (c) The expansions in (a) and (b) converge on the whole punctured discs; on the residue discs of `U` the Coleman function is analytic on the whole disc (L1), and on `D⁻(0,1)` it is `Li_k^ser` (existence theorem). The differential relation holds on each piece by construction.

*Needs:* L2.3, L2.1, L0.15, L1.30, L0.8, L0.21, L0.22, L1.32.

### L2.5 Coleman's p-adic polylogarithm `Li_k^a`

**Definition.** Define `Li_0^a=z/(1−z)`. For `k≥1` use the normalized Coleman function on `ℂ_p∖{0,1}`, with its end continuation (L2.4), and `Li_k^ser` near 0, giving `Li_k^a(0)=0`. For `k≥2` set `Li_k^a(1)=λ_k(1)=ζ_p(k)`, the branch-independent limit through finitely ramified extensions. Write `Li_k=Li_k^0` for the Iwasawa branch. Define `Li_k^(p),a(z)=Li_k^a(z)−p^(−k)Li_k^a(z^p)` when `z^p≠1`, or for `z≠1` if `k≥2`; L2.15 gives branch independence where `|z−1|>p^(−1/(p−1))`. (BDJ §1, p. 869 (Ann. Sci. ENS 36 (2003));, p. 3 of v2; BDJ §2, p. 876 (published);, p. 10 of v2; RJW Rem. 6.6, p. 39; F Def. 2.9 and Rem. 2.10(3), pp. 9-10; BF Prop. 2.1, p. 2.)

Standing hypotheses of this target: `p` prime; `a∈ℂ_p`; `k≥0`. At `1, Li_0` has a pole and `Li_1` a logarithmic singularity, so values exist only for `k≥2`. Continuation is that of L2.3–L2.4.

- `padicPolylog`: `padicPolylog p a k` : `ℂ_[p] → ℂ_[p]`; `Li^a_k` on `ℂ_[p] ∖ {1}`, with `Li^a_k(1) = ζ_p(k)` for `k ≥ 2` and junk value 0 at 1 for `k ≤ 1`.
- `padicPolylog_zero_index`: `padicPolylog p` a `0 z = z/(1 − z)` for `z ≠ 1`.
- `padicPolylog_one_index`: `padicPolylog p` a `1 z = −log_a(1 − z)` for `z ≠ 1`.
- `padicPolylog_apply_zero`: `padicPolylog p a k 0 = 0`.
- `padicPolylog_eq_polylogSer`: For `|z| < 1, padicPolylog p a k z = polylogSer p k z`.
- `padicPolylog_analyticAt`: For `z ≠ 1` (and `k ≥ 0`), `padicPolylog p a k` is analytic at `z` (locally analytic on `ℂ_[p] ∖ {1}`).
- `padicPolylog_isColeman`: On `U(ℂ_[p]) = ℂ_[p] ∖ {0,1}, padicPolylog p a k` is the Coleman function `Li^a_k` of the existence theorem (stated against ColemanIntegration L1's ring of Coleman functions).
- `padicPolylog_one`: For `k ≥ 2, padicPolylog p a k 1 = padicZeta p k := λ_k(1)`, independent of a.
- `padicModPolylog`: `padicModPolylog p a k z := padicPolylog p a k z − p^{−k}·padicPolylog p a k (z^p)`.
- `padicPolylog_hasDerivAt`: `z·(Li^a_k)`'`(z) = Li^a_{k−1}(z)` for `k≥1, z≠0,1` (L2.7).
- `padicPolylog_distribution`: `Σ_{ζ^m=1} Li^a_k(ζz) = m^{1−k}Li^a_k(z^m)` for `m≥1, k≥0, z^m≠1` (L2.8).
- `padicPolylog_inversion`: `Li^a_k(z) + (−1)^k Li^a_k(1/z) = −log_a(z)^k/k!` for `k≥0, z≠0,1` (L2.9).
- `padicPolylog_sub_padicPolylog`: The branch-dependence formula of L2.10 for `k≥1, z≠0,1`.
- `padicPolylog_map`: `σ(Li^a_k(z)) = Li^{σ(a)}_k(σ z)` for continuous automorphisms `σ` of `ℂ_[p], k≥0, z≠1` (L2.17).
- `padicModPolylog_eq_frobeniusSeries`: `Li^{(p),a}_k(z) = g_k(1/(1 − z))` for `k≥0, |z − 1| > p^{−1/(p−1)}` (L2.15).

*Construction.* The existence theorem gives the Coleman function on `U` with the normalisation at 0; the continuation lemma extends it to all of `ℂ_p ∖ {1}`; on `D⁻(0,1)` it is `Li_k^ser` by (iii) of the existence theorem. The value at 1 for `k ≥ 2` is the constant term `λ_k(1)` of the analytic function `λ_k` of the continuation lemma. `Li^{(p),a}_k` is a combination of two values of `Li^a_k`.


*Needs:* L2.3, L2.4, L2.1, L0.15.

**Checks.**

- For `p` odd and every `a`: `padicPolylog p` a `2 (−1) = 0`.
- For `p` odd and every `a`: `padicPolylog p` a `2 2 = 0`.
- For `p` odd and every `a`: `padicPolylog p` a `2 (1/2) = −log(2)^2/2`, with log the branch-free logarithm of the unit 2.
- `padicPolylog p` a `2 (1/p) = −polylogSer p 2 p − a^2/2`; so a definition of `Li_2` that ignores the branch fails on the residue disc of `∞`.
- `padicPolylog p a k 0 = 0` for all `k`, and `padicPolylog p` a `0 z = z/(1 − z)`.
- For `|z| < 1`: `padicPolylog p` a `1 z = −``NormedSpace.logOneAdd` `ℂ_[p] ℂ_[p] (−z)`.

### L2.6 The base-point normalisation at zero is the tangential one

**Comparison.** If the end germ of `F` has `F=Σ_i f_i(z)log_a(z)^i` with `f_i` analytic on `D⁻(0,1)`, set `Reg_(λ∂z)F=Σ_i f_i(0)log_a(λ)^i` for `λ≠0`. `Li_k^a` is the unique Coleman primitive hierarchy with `Li_1=−log_a(1−z)` and `Reg_(∂z)Li_k=0`; its germs have no log terms, so every tangent gives `Li_k(0)=0`. For `log_a z` the regularized value is `log_a λ` and there is no ordinary value at 0. In Furusho's KZ solution `G_0≈z^A`, the `A^(k−1)B` coefficient is `−Li_k`. Rebasing at `x` gives `G_0(z)G_0(x)⁻¹`: depth 1 subtracts `Li_1(x)`, while depth 2 is `Li_2(z)−Li_2(x)−Li_1(x)(log_a z−log_a x)`. Use the full Chen rebasing for higher depths. (F Thm. 3.3, p. 15; F Examples 3.25, p. 21; F Notation 2.6, p. 9; BDJ §2, p. 875 (published).)

Standing hypotheses of this target: `a ∈ ℂ_p`; `k ≥ 1`; `λ ∈ ℂ_p^×`. The regularisation uses the local parameter `z` at 0; changing the parameter to `z·h(z)` with `h(0) = λ^{−1}` is the same as changing the tangent vector.

*Proof sketch.* `(1)` By the existence theorem `Li^a_k` has no log term at 0 and value 0 there, so `Reg_{∂z}(Li^a_k) = 0`; conversely a Coleman function `F` with the same differential equation is `Li^a_k + c` (existence theorem, uniqueness part), and `Reg_{∂z}(F) = c`. `(2)` With no logarithmic terms, `Reg_{λ∂z}` only reads `f_0(0) = Li^a_k(0) = 0`. `(3) log_a z = 0 + 1·log_a z`, so `Reg_{λ∂z}(log_a z) = log_a λ`. `(4)` Furusho's Theorem 3.3 characterises `G^a_0` by `G^a_0(u)·u^{−A} ∈ 1 +` (terms vanishing at `u = 0`), and his Examples 3.25 exhibit `−Li^a_2` and `−Li^a_3` as the coefficients of AB and `A²B`; the uniqueness is L1.18. Expanding `G_0(z)G_0(x)^(-1)` at AB gives the displayed lower-weight correction; differentiating it yields `(Li_1(z)-Li_1(x)) dz/z` and its value at `x` is0.

*Needs:* L2.3, L2.4, L2.5, L1.30, L1.18, L0.15.

### L2.7 The differential recursion `z·(d/dz)Li_k = Li_{k−1}`

**Lemma.** For `a ∈ ℂ_p, k ≥ 1` and `z ∈ ℂ_p ∖ {1}`, the function `Li^a_k` : `ℂ_p ∖ {1} → ℂ_p` is differentiable at `z` (in the sense of `HasDerivAt` over `ℂ_p`), with derivative `Li^a_{k−1}(z)/z` if `z ≠ 0` and 1 if `z = 0`; in particular `z·(Li^a_k)`'`(z) = Li^a_{k−1}(z)` everywhere on `ℂ_p ∖ {1}`, and `(Li^a_1)`'`(z) = 1/(1 − z)`. (BBdJR §4, properties (1)-(3), p. 19; F Lem. 2.8, p. 9; BF Proof of Thm. 1.1, p. 4.)

*Proof sketch.* On `D⁻(0,1)`: termwise differentiation of `Li_k^ser` (L2.1). On the residue discs of `U`: the Coleman function is a convergent power series there and `d Li^a_k = Li^a_{k−1}dz/z` (existence theorem). On the punctured discs of 1 and `∞`: `Li^a_k` is a polynomial in `log_a` with analytic coefficients (L2.4), and `log_a` is differentiable with derivative `1/z` (L0.15); the relation `d Li^a_k = Li^a_{k−1}dz/z` holds there by the same lemma.

*Needs:* L2.5, L2.4, L2.3, L2.1, L0.15, `HasDerivAt`, L0.19.

### L2.8 The distribution relation

**Theorem.** For branch parameter `a ∈ ℂ_p`, every `k ≥ 0`, every `m ≥ 1` and every `z ∈ ℂ_p` with `z^m ≠ 1`: `Σ_{ζ∈μ_m} Li^a_k(ζz) = m^{1−k}·Li^a_k(z^m)`, where `μ_m ⊂ ℂ_p` is the group of `m`-th roots of unity (all `ζz ≠ 1` because `z^m ≠ 1`). Equivalently `Li^a_k(z^m) = m^{k−1}Σ_{ζ^m=1}Li^a_k(ζz)`. For `p ∤ m` the same identity holds for the modified polylogarithm `Li^{(p),a}_k` wherever `z^{pm} ≠ 1`. (The extension to `z^m = 1` for `k ≥ 2`, with `Li_k(1) = ζ_p(k)`, is part of L2.11.) (BDJ §2, (2.4), p. 876 (published);, p. 10 of v2; BBdJR §4, (4.11), p. 20; BF §3, p. 6.)

Standing hypotheses of this target: `a ∈ ℂ_p`; `k ≥ 0`; `m ≥ 1`; `z ∈ ℂ_p` with `z^m ≠ 1` (`z = 0` allowed). The same branch a on both sides; `log_a(ζ) = 0` for roots of unity, so no branch term appears.

*Proof sketch.* `k = 0`: `Σ_{ζ∈μ_m} ζz/(1 − ζz) = m·z^m/(1 − z^m)`, an identity of rational functions (both sides equal `Σ_{n: m|n} m z^n` on `|z| < 1`, since `Σ_{ζ∈μ_m} ζ^n = m·[m | n]`; Mathlib `IsPrimitiveRoot`). `k = 1`: `Π_{ζ∈μ_m}(1 − ζz) = 1 − z^m` and `log_a` is a homomorphism (L0.15), so `Σ_ζ −log_a(1 − ζz) = −log_a(1 − z^m)`. On `D⁻(0,1)` for all `k`: the power series identity `Σ_ζ Σ_n (ζz)^n/n^k = m Σ_j z^{mj}/`(mj)`^k = m^{1−k}Li_k^ser(z^m)`. Reduction of `m`: if the relation holds for `m_1` and `m_2` then it holds for `m_1m_2` (write `μ_{m_1m_2}` as a union of cosets `ημ_{m_2}`, apply the relation for `m_2` at `ηz`, then for `m_1` at `z^{m_2}`, using that `η ↦ η^{m_2}` maps `μ_{m_1m_2}` onto `μ_{m_1}` with fibres of size `m_2`); so it suffices to treat `m` prime to `p` and `m =` p. `m` prime to `p`: `G_k(z) := Σ_ζ Li^a_k(ζz) − m^{1−k}Li^a_k(z^m)` is a Coleman function on `P¹ ∖ ({0, ∞} ∪ μ_m)`, a curve with good reduction because `μ_m` has distinct reductions, obtained by pullback of `Li^a_k` along `z ↦ ζz` and `z ↦ z^m` (L1.43). `m = p`: the maps `z ↦ ζz (ζ ∈ μ_p ⊂ D⁻(1,1))` are rigid automorphisms of the wide open neighbourhoods `U_λ` of `U` for `λ > |ζ − 1|`, and `z ↦ z^p` is the Frobenius lift, so `G_k` is a Coleman function on `U_λ` (L1.43, change of variables). `dG_k = G_{k−1}dz/z`, because `d(z^m)/z^m = m·dz/z` and `m·m^{1−k} = m^{1−(k−1)}` (L2.7); `G_0 = 0` by the first step, and `G_k = 0` on `D⁻(0,1)`. By induction and the uniqueness principle (L1.18) `G_k ≡ 0` on the wide open. Extension to the punctured discs of 1 and `∞` (L2.4). On `D⁻(1,1) ∖ μ_m` write `m = p^r m'` with `p ∤ m'`: the terms with `ζ ∉ μ_{p^r}` are analytic on `D⁻(1,1)`; for `ξ ∈ μ_{p^r}, Li^a_k(ξz) = λ_k(ξz) − log(z)^{k−1}log_a(1 − ξz)/(k−1)!`, and since `Π_{ξ∈μ_{p^r}}(1 − ξz) = 1 − z^{p^r}` and `1 − z^m = (1 − z^{p^r})·Π_{η∈μ_{m'}∖{1}}(1 − ηz^{p^r})` with the last product a unit analytic on `D⁻(1,1)`, the logarithmic terms of `G_k` cancel, so `G_k` is analytic on `D⁻(1,1)` off `μ_m` and extends analytically across it; it vanishes on the outer annulus, hence on the disc (uniqueness of power series expansions: Mathlib `HasFPowerSeriesAt.eq_zero_of_eventually` with Mathlib `HasFPowerSeriesOnBall.changeOrigin`). On `{|z| > 1}, G_k` is a polynomial in `log_a(1/z)` with coefficients analytic in `1/z` on the whole disc; it vanishes on the outer annulus, so all coefficients vanish. For a general tame-root residue disc `D(α,1), α` in `μ_(m')`, first rotate `z=α u`: the relevant `p`-power roots and the same logarithmic cancellation are transported from the disc of1. Ordinary discs are covered by the Coleman identity, and these rotated end discs together with0 and `∞` exhaust the omitted components. Logarithmic-polynomial vanishing at `∞` uses L0.21, not an analytic identity principle for a formal log variable. The modified version for `p ∤ m`: `ζ ↦ ζ^p` permutes `μ_m`, so `Σ_ζ Li^a_k(ζ^pz^p) = m^{1−k}Li^a_k(z^{pm})`; subtract `p^{−k}` times this from the relation at `z`.


*Needs:* L2.5, L2.7, L2.4, L2.3, L2.1, L0.15, L1.30, L1.17, L1.43, L1.18, `IsPrimitiveRoot`, `HasFPowerSeriesAt.eq_zero_of_eventually`, `HasFPowerSeriesOnBall.changeOrigin`, L0.21.

### L2.9 The inversion relation

**Theorem.** For branch parameter `a ∈ ℂ_p`, every `k ≥ 0` and every `z ∈ ℂ_p ∖ {0, 1}`: `Li^a_k(z) + (−1)^k·Li^a_k(1/z) = −log_a(z)^k/k!`. Consequences: (i) for `|z| > 1, Li^a_k(z) = (−1)^{k+1}Li_k^ser(1/z) − log_a(z)^k/k!`, the explicit form of `Li^a_k` on the residue disc of `∞`; (ii) for `k≥1` and every root of unity `ζ ≠ 1, Li^a_k(ζ^{−1}) = (−1)^{k+1}Li^a_k(ζ) (log_a ζ = 0)`; (iii) `Li^{(p),a}_k(1/z) = (−1)^{k+1}Li^{(p),a}_k(z)` whenever `z^p ≠ 1`. The right side has no Bernoulli-polynomial term, unlike the complex inversion formula of L2.Fa, because there is no `2πi` in `ℂ_p`. (BDJ §1, (1.2), p. 869 (published);, p. 3 of v2; BBdJR §4, p. 20; W §4, (*) before Lem. 4.2, p. 362.)

*Proof sketch.* `F_k(z) := Li^a_k(z) + (−1)^k Li^a_k(1/z) + log_a(z)^k/k!` is a Coleman function on `U`: `z ↦ 1/z` is an automorphism of `(P¹, {0,1,∞})` over `ℤ_p` commuting with the Frobenius lift `z ↦ z^p`, so pullback preserves Coleman functions (L1.43). `F_0 = z/(1 − z) + 1/(z − 1) + 1 = 0`, and `dF_k = F_{k−1}dz/z` because `d(1/z)/(1/z) = −dz/z` (L2.7); by induction `F_k` has zero differential, so it is a constant `C_k` (L1.18). `C_k = 0` for `k ≥ 1`: `F_k` satisfies the distribution relation `Σ_{ζ∈μ_m}F_k(ζz) = m^{1−k}F_k(z^m)` (L2.8 for both Li-terms; for the logarithm, `Σ_ζ log_a(ζz)^k = m·log_a(z)^k = m^{1−k}log_a(z^m)^k`); for the constant this reads `m·C_k = m^{1−k}C_k` with `m = 2`, so `C_k = 0`. Extension to the punctured discs: on `D⁻(0,1) ∖ {0}` and on `{|z| > 1}, F_k` is a polynomial in `log_a z` with coefficients analytic on the whole punctured disc and extending across its centre (L2.4); it vanishes on the outer annulus, hence identically; on `D⁻(1,1) ∖ {1}` both `z` and `1/z` lie in `D⁻(1,1)`, the logarithmic terms cancel (`log_a(1 − 1/z) = log_a(1 − z) − log(z)` because `1 − 1/z = (z − 1)/z` and `log_a(−1) = 0`, and `log(1/z) = −log z`), leaving `λ_k(z) + (−1)^kλ_k(1/z) − log(z)^k/(k−1)! + log(z)^k/k!`, analytic on `D⁻(1,1)`; it vanishes on the outer annulus, hence on the disc. (i) is the case `z ↦ 1/z` with `|1/z| < 1`, using `Li^a_k = Li_k^ser` on `D⁻(0,1)`; (ii) uses `log_a ζ = 0`; (iii) subtract `p^{−k}` times the relation at `z^p`, using `log_a(z^p)^k = p^k log_a(z)^k`.


*Needs:* L2.8, L2.5, L2.7, L2.4, L2.1, L0.15, L1.30, L1.18, L1.43, L0.21.

### L2.10 Dependence of the polylogarithms on the branch of the logarithm

**Theorem.** Let `a, b ∈ ℂ_p, β := a − b = log_a(p) − log_b(p)`, and `v = v_p (v(p) = 1)`, so that `log_a(z) − log_b(z) = v(z)·β` for `z ∈ ℂ_p^×`. For `k ≥ 1` and `z ∈ ℂ_p ∖ {1}`: `Li^a_k(z) − Li^b_k(z) = −(β/k!)·v(1 − z)·Σ_{j=0}^{k−1} log_a(z)^{k−1−j}·log_b(z)^j`. Consequently: (i) `Li^a_k = Li^b_k` on `{|z − 1| = 1, |z| ≤ 1}, i.e`. on the residue disc of 0 and on every residue disc of `U`; (ii) on `D⁻(1,1) ∖ {1}, Li^a_k(z) − Li^b_k(z) = −β·v(1 − z)·log(z)^{k−1}/(k−1)!`, so `λ_k` and `ζ_p(k) (k ≥ 2)` do not depend on the branch; (iii) on `{|z| > 1}, Li^a_k(z) − Li^b_k(z) = −(log_a(z)^k − log_b(z)^k)/k!`; (iv) for `k ≥ 2, Li^a_k(ζ)` is independent of a at every root of unity `ζ ≠ 1`, while `Li^a_1(ζ) − Li^b_1(ζ) = −β/(p^{r−1}(p−1))` for `ζ` of exact order `p^r (r ≥ 1)` and 0 for `ζ` of order not a power of `p`; (v) the modified `Li^{(p),a}_k` is independent of a on `{|z − 1| > p^{−1/(p−1)}}`. (BDJ §2, (2.5) and Prop. 2.6, p. 876 (published);, p. 10 of v2; BDJ Proof of Prop. 2.6, p. 876 (published); GSWZ §3.1, before (174), p. 37; F Prop. 2.3, p. 8.)

Standing hypotheses of this target: `a, b ∈ ℂ_p` arbitrary; `k ≥ 1`; `z ≠ 1` (for `k ≥ 2` also `z = 1`, where both sides vanish).

*Proof sketch.* `log_a(z) − log_b(z) = v(z)β`: both are homomorphisms agreeing on units and differing by `β` on `p` (L0.15). On `D⁻(0,1)` both functions equal `Li_k^ser`; on each residue disc of `U` the Coleman functions with branches a and `b` coincide, since the transport `ι_{a,b}` of ColemanIntegration L1 changes only `log_a` of the local parameters at `0, 1, ∞` and maps `Li^a_k` to `Li^b_k` (both satisfy the characterisation of L2.3). There `v(1 − z) = 0`, which gives (i). On `D⁻(1,1) ∖ {1}`: `Li^c_k = λ_k − log(z)^{k−1}log_c(1 − z)/(k−1)!` with `λ_k` independent of `c` (L2.4); subtract and use `log_a(1 − z) − log_b(1 − z) = v(1 − z)β`; since `log_a z = log_b z = log z` there, the sum in the formula is `k·log(z)^{k−1}`, which gives (ii). On `{|z| > 1}`: `Li^c_k(z) = (−1)^{k+1}Li_k^ser(1/z) − log_c(z)^k/k!` (L2.9); subtract, factor `log_a^k − log_b^k = (log_a − log_b)Σ_j log_a^{k−1−j}log_b^j` and use `v(z) = v(1 − z)` for `|z| > 1`. (iv): `log_a ζ = 0` for roots of unity, which kills the sum for `k ≥ 2`; for `k = 1` the formula is `−β·v(1 − ζ)`, and `v(1 − ζ) = 1/(p^{r−1}(p−1))` for `ζ` of order `p^r` and 0 otherwise (L2.2). (v): from (ii) and (iii) at `z` and `z^p`, using `v(1 − z^p) = p·v(1 − z)` when `p^{−1/(p−1)} < |z − 1| < 1` and `log(z^p) = p·log z`.


*Needs:* L2.9, L2.4, L2.5, L2.3, L2.2, L0.15, L1.30, L0.16, L1.23.

### L2.11 The limit at `z = 1` and the p-adic `ζ` values

**Lemma.** (a) For `k ≥ 2`, every branch a and every subfield `L ⊂ ℂ_p` of finite ramification index over `ℚ_p` (`L` need not be complete or of finite degree), `Li^a_k(z) → λ_k(1)` as `z → 1` with `z ∈ L ∖ {1}`; the limit `ζ_p(k) := λ_k(1)` is independent of a and `L`, and `Li^a_k(1) := ζ_p(k)` makes `Li^a_k` continuous on every such `L`. For `k = 1` there is no such limit: `Li^a_1(1 − p^n) = −`na and `Li^a_1(1 − p^n(1 + p)) = −`na `− log(1 + p)`, so for `a = 0` the two sequences have the different limits 0 and `−log(1 + p) ≠ 0`. (b) `ζ_p(k) = 0` for even `k ≥ 2`. (c) For `k ≥ 2` the distribution relation holds for all `z ∈ ℂ_p`: `Σ_{ζ∈μ_m}Li^a_k(ζz) = m^{1−k}Li^a_k(z^m)`; in particular `Σ_{ζ∈μ_m}Li^a_k(ζ) = m^{1−k}ζ_p(k), Σ_{ζ∈μ_m, ζ≠1}Li^a_k(ζ) = (m^{1−k} − 1)ζ_p(k)`, and for `p` odd `ζ_p(k) = Li_k(−1)/(2^{1−k} − 1)`. (d) `λ_2(z) = −Li_2^ser(1 − z)` on `D⁻(1,1)`. (`F` Notation 2.12 and Thm. 2.13, p. 10; `F` Lem. 2.14, p. 11; `F` Thm. 2.18 and Examples 2.19(a), pp. `11-12`; BDJ §2, p. 876 (published);, p. 10 of v2; BBdJR Proof of Prop. 4.17 (case `N = 2`), p. 23.)

Standing hypotheses of this target: `k ≥ 2` in (a)`-`(d); `L ⊂ ℂ_p` with `e(L/ℚ_p) < ∞`; `p` prime (for the formula with `Li_k(−1), p` odd so that `−1` is not in the residue disc of 1).

*Proof sketch.* (a) On `D⁻(1,1) ∖ {1}, Li^a_k(z) − λ_k(z) = −log(z)^{k−1}log_a(1 − z)/(k−1)!` (L2.4). For `z ∈ L` near `1, |log z| = |z − 1|`, and writing `1 − z = u·π_L^n` with `u ∈ O_L^×, log_a(1 − z) = n·log_a(π_L) + log(u)` where `|log(u)|` is bounded on `O_L^×` because `L` is finitely ramified (a power `u^{s p^c}` with `p ∤ s, p^c > e_L`, is `≡ 1` mod `p`). Hence `|log(z)^{k−1}log_a(1 − z)| ≤ C_L·|z − 1|·(1 + |n|) → 0 (k − 1 ≥ 1)`, and `λ_k` is continuous at 1. Independence of `a`: L2.10. `k = 1`: `−log_a(p^n) = −`na and `log_a(−1) = 0`; `log(1 + p) ≠ 0` because `1 + p` is not a root of unity (for `p = 2` use `1 + 4`). (b) Let `z → 1` in `ℚ_p` in the inversion relation `Li^a_k(z) + (−1)^k Li^a_k(1/z) = −log_a(z)^k/k!` (L2.9): both Li-terms tend to `ζ_p(k)` and the right side to 0, so `(1 + (−1)^k)ζ_p(k) = 0`. (c) Given `z_0` with `z_0^m = 1`, approach `z_0` by `z ∈ ℚ_p(z_0)` with `z^m ≠ 1` and apply L2.8; every term is continuous at `z_0` along `ℚ_p(z_0)` (terms with `ζz_0 ≠ 1` are locally analytic there, the others by (a)). Put `z_0 = 1`; for `p` odd take `m = 2` and use that `−1` is not in the residue disc of 1. (d) `λ_2(z) = λ_2(1) − Li_2^ser(1 − z)` (continuation lemma) and `λ_2(1) = ζ_p(2) = 0` by (b).


*Needs:* L2.4, L2.5, L2.8, L2.9, L2.10, L0.15.

### L2.12 Local antiderivatives do not determine `Li_k`: the ambiguity and a non-example

**Comparison.** For `k≥2`, consider primitives `F` of `Li_(k−1)^a dz/z` with `F(0)=0`, whole-disc analytic expansions at 0 and ordinary unit discs, and polynomial logarithmic expansions at 1 and `∞` whose coefficients are analytic on the punctured discs. Exactly these functions are `Li_k^a+c(z̄)`, for arbitrary functions `c` on `P¹(F̄_p)∖{0}`; the ambiguity is infinite dimensional. The Coleman condition removes it; so does `Σ_(ζ∈μ_p)F(ζz)=p^(1−k)F(z^p)`. For `p=5,k=2`, adding 1 on the residue disc of 2 gives a normalized local primitive with `G(2)+G(−2)−G(4)/2=1`, violating distribution. The ODE and normalization alone therefore do not determine global values. (BDJ §2, p. 875 (published);, p. 8 of v2; BF §3, p. 6; F §3.1, before Thm. 3.3, p. 15.)

Standing hypotheses of this target: `k ≥ 2` (weight one is fixed separately by the normalization `Li^a_1 = −log_a(1 − z)`); `a ∈ ℂ_p`.

*Proof sketch.* (a) `F − Li^a_k` has zero derivative. On a disc a convergent power series with zero derivative is constant (characteristic 0); on a punctured disc an element of `A(D)[log]` with zero differential is constant (L0.22); `F(0) = 0 = Li^a_k(0)` gives `c(0̄) = 0`. Conversely every such `c` gives a local antiderivative. (b) Coleman: if `F` is a Coleman function then `F − Li^a_k` is a Coleman function with zero differential, hence a global constant (L1.18), equal to its value 0 at 0. (b) Distribution: for `F = Li^a_k + c`, all `ζz (ζ ∈ μ_p)` reduce to `z̄`, so the defect of the relation for `m = p` is `p·c(z̄) − p^{1−k}c(z̄^p)` (L2.8 for `Li^a_k`). If it vanishes, `c(x^p) = p^k c(x)` for all `x ∈ P¹(F̄_p) ∖ {0}`; every `x` has `x^{p^f} = x` for some `f ≥ 1` (`x = 1` and `∞` are fixed), so `c(x) = p^{kf}c(x)` and `c(x) = 0`. (c) `Li^a_2` satisfies the relation at `z = 2` (distribution relation); `G` differs from `Li^a_2` only at the first term.

*Needs:* L2.8, L2.5, L2.3, L1.18, L0.21, L0.22.

### L2.13 The modified polylogarithm as an integral rigid function off the residue disc of 1

**Construction.** For `k∈ℤ` put `ℓ_k=Σ_(n≥1,p∤n)t^n/n^k` and `f_(k,m)=(1−t^(p^m))⁻¹Σ_(0<b<p^m,p∤b)b^(−k)t^b`. In `𝒜=ℤ_p[t,(1−t)⁻¹]^∧`, prove `f_(k,m)∈𝒜, f_(k,m)≡ℓ_k` mod `p^mZ_p[[t]]` and `f_(k,m+1)≡f_(k,m)` mod `p^m𝒜`. Their limit has the given expansion. On `X_0={|z|≤1,|z−1|=1}, |ℓ_k|≤1` and `|ℓ_k−f_(k,m)|≤p^(−m)`; integral points have integral values. Mod `p, ℓ_k=li_k(t)/(1−t^p), li_k=Σ_(b=1)^(p−1)t^b/b^k`. The congruence `f_(k,m)(1/t)≡(−1)^(k+1)f_(k,m)(t)` extends `ℓ_k` to `P¹∖D⁻(1,1)`, bounded by 1 with value 0 at `∞`. Prove `tℓ_k′=ℓ_(k−1), ℓ_0=t/(1−t)−t^p/(1−t^p)`, and tame distribution `Σ_(ζ∈μ_m)ℓ_k(ζt)=m^(1−k)ℓ_k(t^m)` on the common domain. Its `s=t/(1−t)` expansion is restricted over `ℤ_p`. (GSWZ Lem. 2.1 and its proof, p. 19; BHYY Lem. 3.3, proof, pp. `14-15`; BF Prop. 2.1 and proof, p. 2; GSWZ §2.1, p. 18.)

Standing hypotheses of this target: `k ∈ Z` (all integers; `k ≥ 0` is what L2 uses); `p` prime. No Coleman theory is used in this target; the identification with `Li^{(p),a}_k` is L2.15.

- `modPolylogApprox`: `modPolylogApprox p k m z := (1 − z^{p^m})^{−1}·Σ_{0<b<p^m, p∤b} b^{−k}z^b`, a rational function of `z`.
- `modPolylogLimit`: `modPolylogLimit p k` : `ℂ_[p] → ℂ_[p]`; on `X_0` the p-adic limit of `modPolylogApprox p k m z`, extended to `{|z| > 1}` by `(−1)^{k+1}·modPolylogLimit p k (1/z)`.
- `norm_modPolylogLimit_sub_approx_le`: For `|z| ≤ 1` with `|z − 1| = 1`: `‖modPolylogLimit p k z − modPolylogApprox p k m z‖ ≤ p^{−m}`.
- `norm_modPolylogLimit_le_one`: For `|z − 1| ≥ 1`: `‖modPolylogLimit p k z‖ ≤ 1`.
- `modPolylogLimit_eq_tsum`: For `|z| < 1`: `modPolylogLimit p k z = Σ'_{n≥1, p∤n} z^n/n^k`.
- `modPolylogLimit_inv`: For `|z − 1| ≥ 1, z ≠ 0`: `modPolylogLimit p k (1/z) = (−1)^{k+1}·modPolylogLimit p k z`.
- `modPolylogLimit_hasDerivAt`: For `|z − 1| ≥ 1, z ≠ 0`: `HasDerivAt` `(modPolylogLimit p (k+1)) (modPolylogLimit p k z / z) z`.
- `modPolylogLimit_zero_index`: `modPolylogLimit p 0 z = z/(1 − z) − z^p/(1 − z^p)` for `|z − 1| ≥ 1`.
- `modPolylogLimit_reduction`: For `z ∈ 𝓞_ℂ_[p]` with `|z − 1| = 1`: `‖modPolylogLimit p k z − (1 − z^p)^{−1}Σ_{b=1}^{p−1} z^b/b^k‖ ≤ p^{−1}`.
- `modPolylogLimit_distribution`: For `p ∤ m`: `Σ_{ζ∈μ_m} modPolylogLimit p k (ζz) = m^{1−k}·modPolylogLimit p k (z^m)` where all arguments satisfy `|· − 1| ≥ 1`.
- `modPolylogElement`: The element `ℓ_k` of the p-adic completion of `ℤ_p[t, (1 − t)^{−1}]` (`AdicCompletion` of `Localization.Away` `(1 − X)`); its expansion at 0 is `Σ_{p∤n} t^n/n^k`.

*Construction.* For `m≥1` and `p` not dividing `a, (a+p^m j)^(-k)` is congruent to `a^(-k)` modulo `p^m`. Split the positive `p`-unit integers uniquely as `a+p^m j, 0<a<p^m, p` not dividing `a, j≥0`. Summing the geometric series proves `ell_k=f_(k,m)` modulo `p^m` in `ℤ_p[[t]]`. This uses the correct period `p^m` and one representative per class; GSWZ `equation(54)` as printed repeats every class `p` times. `1 − t^{p^N}` is a unit of `𝒜` (its reduction mod `p` is `(1 − t)^{p^N}`, a unit of `F_p[t, (1 − t)^{−1}]`, and `𝒜` is p-adically complete: Mathlib `AdicCompletion`, Mathlib `Localization.Away`), so `f_{k,N} ∈ 𝒜`; the congruences make `(f_{k,N})` Cauchy in `𝒜`, and the expansion map `𝒜 → ℤ_p[[t]]` is injective and continuous, so `ℓ_k ∈ 𝒜`. The expansion map is `p`-saturated: reduce modulo `p^m` and use injectivity of `(Z/p^m)[t,(1-t)^(-1)]` into `(Z/p^m)[[t]]`, since `1-t` is a unit there and coefficient comparison of polynomials is injective. Hence congruence of the rational approximants in formal expansions is a congruence in the completion, making the sequence Cauchy there. (i) Elements of `𝒜` are p-adic limits of polynomials in `t` and `(1 − t)^{−1}` with `ℤ_p` coefficients, which converge uniformly on `X_0` where `|t| ≤ 1` and `|(1 − t)^{−1}| ≤ 1`; values at `W(F̄_p)-` or `O_K`-points stay in that ring. (ii) is the case `N = 1` of the first step. (iii) `f_{k,m}(1/t) = −(1 − t^{p^m})^{−1}Σ_b b^{−k}t^{p^m − b}` and `(p^m − b)^{−k} ≡ (−b)^{−k}` mod `p^m`, so `f_{k,m}(1/t) ≡ (−1)^{k+1}f_{k,m}(t)`; each `f_{k,m}` vanishes at `∞` (degree of numerator `< p^m`); pass to the limit on `{|z| = |z − 1| = 1}` and glue with `ℓ_k` on `X_0`. (iv) and (v) hold coefficientwise in `ℤ_p[[t]]` (for (v), `Σ_{ζ∈μ_m}ζ^n = m·[m | n]` and `p ∤` mj ⟺ `p ∤ j` when `p ∤ m`) and transfer to `𝒜` by injectivity of the expansion. Restrictedness in `s` is an assertion about the particular globally glued `ℓ_k`, not about every element of the completed localization. By (iii) `ℓ_k` is rigid analytic and integral on the whole closed affinoid `ℙ¹` minus `D⁻(1, 1)`. Its coordinate `v = 1/(1 − t) = 1 + s` identifies this affinoid with the closed unit disc, whose integral analytic functions are `ℤ_p⟨v⟩`: the affinoid algebra of that disc is `ℚ_p⟨v⟩`, and its Gauss norm is the supremum over points of `ℂ_p` by the maximum principle of TauCetiRoadmap RestrictedPowerSeries §2.4. Translating `v = 1 + s` preserves the integral Tate algebra, so `ℓ_k` has restricted `ℤ_p` coefficients in `s`. The general element `t = s/(1 + s)` has coefficients `±1` and shows that the assertion fails for a general element of the completion.

*Needs:* L2.1, `AdicCompletion`, `Localization.Away`, `PadicInt`, `PowerSeries`, `PowerSeries.IsRestricted`, TauCetiRoadmap RestrictedPowerSeries §§2.1 and 2.4.

**Checks.**

- `modPolylogLimit p 0 z = z/(1 − z) − z^p/(1 − z^p)` for `z` with `|z − 1| ≥ 1`.
- For `p` odd and every even `k ≥ 2`: `modPolylogLimit p k (−1) = 0` (from the symmetry at `z = −1 = 1/(−1)`).
- `modPolylogLimit p k 0 = 0`, and `modPolylogLimit p k z → 0` as `|z| → ∞`.
- For `p` odd, `modPolylogLimit p 1 (−1) = −(1 − 1/p)·log(2) ≠ −log(2) = Li_1(−1)`: `ℓ_k` is not the restriction of `Li_k` to `X_0`.
- The expansion of `ℓ_k` in `s = t/(1 − t)` is a power series with coefficients in `ℤ_[p]` that is restricted (`PowerSeries.IsRestricted` 1) — the Mathlib notion of a Tate-algebra element.

### L2.14 Overconvergence of the modified polylogarithm: the series `g_k(v)`

**Lemma.** Put `v := 1/(1 − z)`; it identifies `P¹ ∖ D⁻(1,1)` with the closed disc `|v| ≤ 1` (`z = 0 ↦ v = 1, z = ∞ ↦ v = 0`, the residue disc of `1 ↦ |v| > 1`). Define `g_0(v) := v − 1 − (v − 1)^p/(v^p − (v − 1)^p)` and, for `k ≥ 1, g_k(v) := ∫_1^v g_{k−1}(w)·`dw`/(w(w − 1))`. Then for `k ≥ 0`: `g_k` is a power series in `v` with coefficients in `ℚ_p` converging on the open disc `D⁻(0, p^{1/(p−1)})` (radius at least `p^{1/(p−1)}`; for `k = 0` exactly, the poles being `v = (1 − ζ)^{−1}, ζ ∈ μ_p ∖ {1}`); `g_k(0) = g_k(1) = 0`; `g_k(1 − v) = (−1)^{k+1}g_k(v)`; `g_1(v) = p^{−1}·log(±(v^p − (v − 1)^p))` with the sign making the argument a principal unit; and `ℓ_k(z) = g_k(1/(1 − z))` for all `z ∈ P¹ ∖ D⁻(1,1)`, where `ℓ_k` is L2.13. (BBdJR §4, property (4), p. 20; GSWZ §2.1, p. 18; BHYY §1, p. 2.)

Standing hypotheses of this target: `k ≥ 0`; `p` prime; `D⁻(0, p^{1/(p−1)}) = {v ∈ ℂ_p : |v| < p^{1/(p−1)}}`.

*Proof sketch.* `g_0` is a rational function whose poles are the zeros of `v^p − (v − 1)^p, i.e`. `v = (1 − ζ)^{−1}` for `ζ ∈ μ_p ∖ {1}`, all of absolute value `p^{1/(p−1)}` (L2.2); so `g_0` is analytic on `D⁻(0, p^{1/(p−1)})`, and `g_0(0) = g_0(1) = 0` by evaluation. Induction: if `g_{k−1}` is analytic on the open disc and vanishes at 0 and 1, then `g_{k−1}(w)/(w(w − 1))` is analytic on the same open disc (dividing a convergent power series by `w − c` at a zero `c` of it inside the disc preserves convergence on the disc), so its primitive vanishing at 1 is analytic on the same disc (L0.8); this is `g_k`. On the closed disc `|v| ≤ 1`: `ℓ_k(1 − 1/v)` is analytic there (L2.13 (i), (iii)); `t = 1 − 1/v` gives `dt/t = dv/(v(v − 1))`, so `t·dℓ_k/dt = ℓ_{k−1}` becomes the recursion defining `g_k`, and `ℓ_k` vanishes at `t = 0 (v = 1)`. A power series on the closed unit disc with zero derivative is constant, so `ℓ_k(1 − 1/v) = g_k(v)` by induction (base `k = 0` by the explicit formula). `g_k(0) = ℓ_k(∞) = 0` by (iii) of L2.13 (this is not implied by the differential equation when `k` is even); symmetry: `z ↦ 1/z` is `v ↦ 1 − v`, and `ℓ_k(1/z) = (−1)^{k+1}ℓ_k(z)`. `g_1`: `ℓ_1 = −log(1 − z) + p^{−1}log(1 − z^p) = p^{−1}log((1 − z^p)/(1 − z)^p)`, and `(1 − z^p)/(1 − z)^p = v^p − (v − 1)^p ≡ 1` mod `p` for `p` odd (for `p = 2` it is 2v `− 1 = −`(`1 −` 2v)).

*Needs:* L2.13, L2.2, L0.8, `HasFPowerSeriesOnBall`, `FormalMultilinearSeries.radius`.

### L2.15 Coleman's Frobenius relation for the polylogarithms

**Theorem.** For `k≥0`, every branch a and `|z−1|>p^(−1/(p−1))`, prove `Li_k^a(z)−p^(−k)Li_k^a(z^p)=g_k(1/(1−z))` with `g_k` from L2.14. This branch-independent rigid function on `P¹∖D(1,p^(−1/(p−1)))` vanishes at `∞`. On `P¹∖D⁻(1,1)` it equals integral `ℓ_k` and reduces to `li_k(z)/(1−z^p)`. The domain includes `primitive p^r` roots for `r≥2`. Derive the identity from Coleman equivariance for `z↦z^p` and `φ*(dz/z)=p dz/z`. (BBdJR §4, property (4), p. 20; BF Prop. 2.1, p. 2; BDJ §2, rules (1)-(3), p. 875 (published); BHYY §1, p. 2.)

Standing hypotheses of this target: `a ∈ ℂ_p`; `k ≥ 0`; `|z − 1| > p^{−1/(p−1)}` (so `z^p ≠ 1` and `z ≠ 1`). The bound is sharp: `g_0` has poles at `v = (1 − ζ)^{−1}, ζ ∈ μ_p ∖ {1}`.

*Proof sketch.* Put `F_k(z) := Li^a_k(z) − p^{−k}Li^a_k(z^p)` and `G_k(z) := g_k(1/(1 − z))` on `W := {|z − 1| > p^{−1/(p−1)}} ∖ {∞}`. On `D⁻(0,1), F_k = Σ_{p∤n}z^n/n^k = ℓ_k = G_k` (L2.1, L2.13, L2.14). `z·dF_k/dz = F_{k−1}` (L2.7 and the chain rule: `z·d/dz[p^{−k}Li^a_k(z^p)] = p^{−k}·p·Li^a_{k−1}(z^p)`) and `z·dG_k/dz = G_{k−1}` (the recursion for `g_k` with `dz/z = dv/(v(v − 1))`); `F_0 = G_0` (explicit). Proceed by induction on `k`: the previous-depth identity `F_(k-1)=G_(k-1)` is what makes the differential of `F_k-G_k` vanish. Differential recursion alone is not the zero-derivative conclusion. `F_k − G_k` is locally constant on `W`: on each residue disc of `U` and on `D⁻(0,1)` it is a power series with zero derivative; on the annulus `p^{−1/(p−1)} < |z − 1| < 1` and on `{|z| > 1}` it is an element of `A(annulus)[log_a]` with zero differential (L2.4; `z^p` lies in the residue disc of 1 when `z` does), hence constant (L0.22). So `F_k − G_k = c(z̄)` depends only on the residue class, with `c(0̄) = 0`. Coleman's theory removes the ambiguity: `F_k` is a Coleman function on a wide open neighbourhood of `U`, being a combination of `Li^a_k` and its pullback by the Frobenius lift (L1.30; the choice of lift is immaterial by L1.22), and `G_k` is rigid analytic on the wide open `W`, hence a Coleman function; their difference has zero differential and is a global constant (L1.18), equal to `c(0̄) = 0`. Each residue class of `W` meets the wide open, so `c ≡ 0` on `W`. Branch independence follows because `G_k` does not involve a; the remaining assertions are the properties of `g_k` and `ℓ_k`.


*Needs:* L2.13, L2.14, L2.5, L2.4, L2.7, L2.1, L1.30, L1.18, L1.22, L0.21, L0.22, L1.15.

### L2.16 An elementary characterisation of the polylogarithms

**Comparison.** Let `𝒞^a` consist of functions on `ℂ_p∖{1}` represented by one series on every `D⁻(x,1), |x−1|=1`, and by polynomials in `log_a(z−1)` or `log_a(1/z)` with convergent Laurent coefficients on the punctured disc at 1 or `∞`. In this class the `Li_k^a` are the unique sequence satisfying `Li_0=z/(1−z), Li_k(0)=0, dLi_(k+1)=Li_k dz/z`, and `Li_k(z)−p^(−k)Li_k(z^p)=g_k(1/(1−z))` for a series `g_k` convergent at `|v|<p^(1/(p−1))`. This analytic characterization can define `Li_k`; prove agreement with the Coleman construction using existence, continuation and L2.15. (BBdJR §4, p. 19; BBdJR §4, pp. 19-20; BBdJR §4, class (1), p. 19.)

Standing hypotheses of this target: `a ∈ ℂ_p`; `k ≥ 0`; the class `𝒞^a` depends on the branch only through `log_a` on the punctured discs of 1 and `∞`.

*Proof sketch.* Existence: `Li^a_k` lies in `𝒞^a` by L2.4 and satisfies (i)`-`(iv) by L2.5, L2.7 and L2.15. Uniqueness by induction on `k`: if `(f_k)` also satisfies (i)`-`(iv) and `f_{k−1} = Li^a_{k−1}`, then `c := f_k − Li^a_k` has zero derivative and lies in `𝒞^a`, so it is constant on each residue disc, on the punctured disc of 1 and on `{|z| > 1}` (L0.22), with `c = 0` near 0 by (ii). By (iv) for `f_k` and for `Li^a_k`, the function `z ↦ c(z) − p^{−k}c(z^p)` is, in the coordinate `v = 1/(1 − z)`, the difference of two power series converging on the open disc `|v| < p^{1/(p−1)}`, hence a power series `h` on that disc; it is constant `(= 0)` on the subdisc `|v − 1| < 1` corresponding to `z ∈ D⁻(0,1)`, so all derivatives of `h` at `v = 1` vanish and `h ≡ 0` on the disc (uniqueness of expansions after re-centring: Mathlib `HasFPowerSeriesOnBall.changeOrigin`, Mathlib `HasFPowerSeriesAt.eq_zero_of_eventually`). Hence `c(x) = p^{−k}c(x^p)` for every residue class `x ≠ 1̄` and also on the part of the residue disc of 1 where `|z − 1| > p^{−1/(p−1)}`; since `x^{p^f} = x` for some `f ≥ 1, c(x) = p^{−kf}c(x)`, so `c = 0 (k ≥ 1)`.


*Needs:* L2.15, L2.4, L2.5, L2.7, L2.12, L0.21, L0.22, `HasFPowerSeriesOnBall.changeOrigin`, `HasFPowerSeriesAt.eq_zero_of_eventually`, L0.7.

**Checks.**

- For `k = 0` the characterized function is `z/(1 − z)` off 1, with value 0 at 1.
- At `k = 1` the characterized function is `−log_a(1 − z)` off 1; no limit at 1 is required.
- For `k ≥ 2`, limits along every finitely ramified intermediate field determine the value at 1, without asserting a limit through all of `ℂ_p`. Finite ramification means `|Fˣ| ⊆ p^((1/e)ℤ)` for some positive integer `e`.

### L2.17 Compatibility with automorphisms and embeddings of the coefficients

**Theorem.** For continuous automorphism `σ` of `ℂ_p, σ(Li_k^a(z))=Li_k^(σa)(σz), σ(ζ_p(k))=ζ_p(k)` for `k≥2`, and the analogous identity holds for `Li_k^(p)`,a. Such `σ` fixes `ℚ_p` and preserves the norm. If `a∈ℚ_p`, values on finite Galois `L/ℚ_p` commute with `Gal(L/ℚ_p)`. Consequently, for coefficient embeddings `ι′=σ`∘`ι` of a number field, `Li_k(ι′z)=σ(Li_k(ιz))`. At nontrivial roots of unity and `k≥2` the result holds for branch by branch independence. (BDJ Rem. 2.3, pp. 875-876 (published);, p. 9 of v2; BDJ Rem. 2.3, p. 876 (published); BBK §2, Thm. 5 (Coleman), (c), p. 4; F Proof of Thm. 2.25, p. 13.)

Standing hypotheses of this target: `σ` a continuous ring automorphism of `ℂ_p`; `a ∈ ℂ_p`; `k ≥ 0`; `z ≠ 1`.

*Proof sketch.* Transport of structure: for a function `F` on (a subset of) `ℂ_p` put `(σ·F)(z) := σ(F(σ^{−1}z))`. Then `σ·(log_a) = log_{σ(a)}`: both are homomorphisms `ℂ_p^× → ℂ_p`, they agree on `1 + m_{ℂ_p}` because `σ` is continuous and fixes the rational coefficients of the logarithm series, and `σ(log_a p) = σ(a)` with `σ(p) = p` (L0.17). `σ·` maps the class `𝒞^a` of L2.16 onto `𝒞^{σ(a)}`: `σ` is an isometric field automorphism, so it maps residue discs to residue discs and a power series in `z − x` converging on `D⁻(x,1)` to the power series in `z − σ(x)` with coefficients transformed by `σ`, converging on `D⁻(σ(x),1)`; likewise Laurent series on the punctured discs of 1 and `∞`, while `log_a(z − 1)` and `log_a(1/z)` become `log_{σ(a)}(z − 1)` and `log_{σ(a)}(1/z)` by the first step. The operation commutes with `z·d/dz`, and a power series `g(v)` converging for `|v| < p^{1/(p−1)}` goes to the series `σ(g)` with the same radius. `σ·Li^a_k` satisfies (i)`-`(iv) of L2.16 for the branch `σ(a)`: `σ·Li_0 = Li_0` because `z/(1 − z)` has rational coefficients, `σ·Li^a_k(0) = 0, d(σ·Li^a_{k+1}) = (σ·Li^a_k)dz/z`, and `σ·Li^a_k − p^{−k}(σ·Li^a_k)(z^p) = σ(g_k)(1/(1 − z))` because `σ(z^p) = σ(z)^p`. By the uniqueness in that characterisation `σ·Li^a_k = Li^{σ(a)}_k` on `ℂ_p ∖ {1}`. `ζ_p(k) = λ_k(1)` is independent of the branch (L2.10), so `σ(ζ_p(k)) = λ_k^{σ(a)}(1) = ζ_p(k)`; the statement for `Li^{(p)}` follows since `σ(z^p) = σ(z)^p`.


*Needs:* L2.4, L2.5, L2.10, L2.1, L0.15, L2.16, L0.17.

### L2.18 The p-adic dilogarithm `D` and its two-term, branch and Frobenius identities

**Lemma.** Define `D^a(z)=Li_2^a(z)+log_a z·log_a(1−z)/2` for `z≠0,1`. Prove `Li_2^a(z)+Li_2^a(1−z)=−log_a z·log_a(1−z), D^a(1−z)=D^a(1/z)=−D^a(z)`, and `dD^a=`(`log_a z dlog(1−z)−log_a(1−z)`dlog `z`)`/2`. Branch change is `D^a−D^b=(a−b)(v(z)log_b(1−z)−v(1−z)log_b z)/2`. Thus `D` is branch independent on special units and nontrivial roots, where `D(ζ)=Li_2(ζ)`. On `|z−1|>p^(−1/(p−1)), D^a(z)−p⁻²D^a(z^p)=Li_2^(p),a(z)−log_a z·Li_1^(p),a(z)/2`, branch-free rigid analytic on U's residue discs; for tame `ζ` this equals `ℓ_2(ζ)`. Prove `σD^a(z)=D^(σa)(σz)` for continuous `σ`. (GSWZ §3.1, (174), p. 37; BDJ §1, p. 870 (published);, p. 3 of v2; W §4, Example 3, p. 363.)

Standing hypotheses of this target: `a, b ∈ ℂ_p`; `z ∉ {0, 1}`; `v = v_p`.

*Proof sketch.* (a) `F(z) := Li^a_2(z) + Li^a_2(1 − z) + log_a(z)log_a(1 − z)` is a Coleman function on `U` (pullback of `Li^a_2` by the automorphism `z ↦ 1 − z` of `(P¹, {0,1,∞})`; Coleman functions are functorial for morphisms of wide opens and independent of the Frobenius lift: L1.43, L1.22). `dF = −log_a(1 − z)dz/z + log_a(z)dz/(1 − z) + log_a(1 − z)dz/z − log_a(z)dz/(1 − z) = 0`, so `F` is constant (L1.18). As `z → 0` in `ℚ_p`: `Li^a_2(z) → 0, log_a(z)log(1 − z) → 0` (L2.11, estimate (a)), and `Li^a_2(1 − z) → ζ_p(2) = 0` (L2.11 (b)); so `F ≡ 0`; the identity extends to the punctured discs of `0, 1, ∞` as in the inversion relation. (b) From (a): `D(1 − z) = Li_2(1 − z) +` ½`log(1 − z)log z = −Li_2(z) −` ½`log z·log(1 − z) = −D(z)`. From the inversion relation with `k = 2` (L2.9) and `log_a(1 − 1/z) = log_a(1 − z) − log_a(z)`: `D(1/z) = −Li_2(z) −` ½`log_a(z)² −` ½`log_a(z)(log_a(1 − z) − log_a(z)) = −D(z)`. (c) Direct computation with `d Li^a_2 = −log_a(1 − z)dz/z` (L2.7). (d) L2.10 with `k = 2` gives `Li^a_2 − Li^b_2 = −`½`β·v(1 − z)(log_a z + log_b z)`; add ½`(log_a z·log_a(1 − z) − log_b z·log_b(1 − z))` using `log_a = log_b + v(·)β` and simplify. (e) Subtract `p^{−2}` times the definition at `z^p`, use `log_a(z^p) = p·log_a(z)` and `Li^{(p),a}_1(z) = −log_a(1 − z) + p^{−1}log_a(1 − z^p)`; then L2.15 for `k = 1, 2`. For `ζ` of order prime to `p, log ζ = 0`. (f) L2.17 and `σ(log_a w) = log_{σ(a)}(σ w)`.


*Needs:* L2.9, L2.10, L2.11, L2.17, L2.15, L2.5, L2.7, L1.30, L1.18, L1.22, L0.15, L1.43.

### L2.19 The two rational substitutions in Abel's identity

**Lemma.** For `x,u` in `ℂ_p` with `|x|<1` and `|u|<1`, put `v=u(1-x)/`(1-xu), `w=x(1-u)/`(1-xu). Then `|1-x|=|1-u|=|1`-xu`|=1, 1-v=(1-u)/`(1-xu), `1-w=(1-x)/`(1-xu), `|v|=|u|` and `|w|=|x|`. Thus every displayed denominator is nonzero, and `v,w` are in the open unit disc. If `x,u` are nonzero, then `x,u`,xu,`v,w` are all different from 0 and 1. Zero `x` or `u` is permitted in the norm and rational identities. (DJ arXiv:2007.11014v1, p. 6 Prop. 2.10;, p. 14 paragraph before its proof.)

*Proof sketch.* Multiplicativity gives `|`xu`|<1`. In an ultrametric field, `|t|<1` implies `|1-t|=1`: the upper bound is the strong triangle inequality; a strict lower value would contradict `|1|=|(1-t)+t|=1`. Clear the nonzero denominator 1-xu to prove the two complement identities by ring arithmetic. Take norms to obtain `|v|=|u|` and `|w|=|x|`. When `x,u` are nonzero, multiplication and division by the units `1-x,1-u,1`-xu preserve nonvanishing. A point of norm below 1 cannot equal 1.

*Needs:* L2.1.

### L2.20 Coefficient bounds for the Abel substitutions

**Lemma.** For fixed `u` in `ℂ_p` with `|u|<1`, there exist coefficients `c_n,d_n` such that `Li_2^ser(u(1-x)/(1-ux))=sum_n c_n x^n` and `Li_2^ser(x(1-u)/(1-ux))=sum_n d_n x^n` for `|x|<1`. The sums converge absolutely in norm. One has `|c_n|≤C_u := sum_{m≥1} m^2 |u|^m < ∞, d_0=0`, and `|d_n|≤n^2` for all `n`. In particular both functions admit a single scalar power series on the entire open unit disc, not just separate local series. (DJ arXiv:2007.11014v1, p. 6 Prop. 2.10;, p. 14 paragraph before its proof.)

*Proof sketch.* For `m≥1` expand (1-`uX`)`^(-m)=sum_{k≥0} binom(m+k-1,k)u^k X^k`. This is the `m`-fold Cauchy product of the geometric series, proved by the finite binomial convolution; its coefficients are integral, hence have p-adic norm at most 1. Set `b_(m,n)=sum_{j=0}^{min(m,n)} (-1)^j binom(m,j) binom(m+n-j-1,n-j) u^(n-j)`. This is the coefficient of `X^n` in `(1-X)^m`(1-`uX`)`^(-m)`, and `|b_(m,n)|≤1` by the ultrametric triangle inequality. Define `c_n=sum_{m≥1} u^m b_(m,n)/m^2`. Since `|1/m|_p≤m`, the norm of each summand is at most `m^2 |u|^m`; this real series is summable, so each `c_n` exists and `|c_n|≤C_u`. For `|x|≤r<1` the double family is bounded by `m^2 |u|^m r^n`, whose real sum is finite. Interchanging its two sums therefore identifies `sum_n c_n x^n` with `Li_2^ser(v)`. No complete Tate-algebra instance is assumed. Set `d_0=0` and, for `n≥1, d_n=sum_{m=1}^n (1-u)^m binom(n-1,m-1)u^(n-m)/m^2`. Each term has norm `≤m^2 |u|^(n-m)≤n^2`, so `|d_n|≤n^2` by the ultrametric inequality. The double series at `|x|≤r<1` is norm-summable, bounded after grouping by `n` by `n^3 r^n`; regrouping gives `Li_2^ser(w)`. For every real `0≤r<1`, the bounds `C_u r^n` and `n^2 r^n` are norm-summable. Apply `FormalMultilinearSeries.ofScalars_norm` and `le_radius_of_bound` for every `r<1` to obtain radius at least 1, then construct `HasFPowerSeriesOnBall` from the sums.

*Needs:* L2.19, L2.1, `FormalMultilinearSeries.ofScalars_norm`, `FormalMultilinearSeries.le_radius_of_bound`, `summable_norm_pow_mul_geometric_of_norm_lt_one`, `HasFPowerSeriesOnBall`.

**Checks.**

- For `u=0` the `v`-composite is zero and the `w`-composite is `Li_2^ser(x)`.

### L2.21 One-disc analyticity of the Abel difference

**Lemma.** For fixed `|u|<1` define `v(x)=u(1-x)/`(1-xu), `w(x)=x(1-u)/`(1-xu), `A(x)=-Li_1^ser(x), B=-Li_1^ser(u), C(x)=-Li_1^ser(xu), P=A-C, Q=B-C`. The function `F(x)=Li_2^ser(x)+Li_2^ser(u)-Li_2^ser(xu)-Li_2^ser(v(x))-Li_2^ser(w(x))-P(x)Q(x)` has a `FormalMultilinearSeries` `S` with `HasFPowerSeriesOnBall` `F S 0 1`. All functions here are understood only on `|x|<1`; their total-function values outside that disc are irrelevant. (DJ arXiv:2007.11014v1, p. 6 Prop. 2.10;, p. 14 paragraph before its proof.)

*Proof sketch.* Use L2.20 for the two rational compositions. The ordinary series for `Li_2(x), Li_2(xu)`, A and `C` have coefficients bounded by `n^2` or `n`; `Li_2(u)` and `B` are constants. Expand `P Q` by the Cauchy product of its norm-absolutely convergent series. Its nth coefficient is bounded by `max(|B| n,n^2)`, since the nonconstant coefficients of `A,C,Q` are bounded by `n` and the finite sum obeys the ultrametric bound. Finite sums and this product yield one coefficient sequence for `F` with growth at most a constant times `(n+1)^2`. For every `r<1` exponential decay makes the associated norm series summable; construct its scalar formal multilinear series and `HasFPowerSeriesOnBall` at radius 1. This is stronger than `AnalyticOnNhd` on the unit disc. No implication from pointwise local analyticity to a global expansion, and no unproved radius-preserving generic composition rule, is used.

*Needs:* L2.20, L2.1, L0.7, `HasFPowerSeriesOnBall`, `FormalMultilinearSeries.le_radius_of_bound`.

### L2.22 Abel's dilogarithm identity on the open unit bidisc

**Lemma.** For `|x|<1` and `|u|<1` in `ℂ_p`, including zero values, set `v=u(1-x)/`(1-xu), `w=x(1-u)/`(1-xu). Then `Li_2^ser(x)+Li_2^ser(u)-Li_2^ser(xu)-Li_2^ser(v)-Li_2^ser(w)=(Li_1^ser(x)-Li_1^ser(xu))(Li_1^ser(u)-Li_1^ser(xu))`. Equivalently the right side is `P Q` with `P=log(1-x)-log(1-xu), Q=log(1-u)-log(1-xu)`, using the ordinary principal-unit series. (DJ arXiv:2007.11014v1, p. 6 Prop. 2.10;, p. 14 paragraph before its proof.)

*Proof sketch.* If `u=0`, each side is zero by the ordinary series normalization. Otherwise keep `u` fixed, and take the whole-disc series for `F` from L2.21. Choose the existing logarithm branch with `a=0` solely to justify multiplicativity on principal units. The series `A,B,C` equal its values at `1-x,1-u,1`-xu. The complement identities give `log(1-v)=Q` and `log(1-w)=P`. This uses only the L0 branch, not the continued dilogarithm or five-term theorem. For `x≠0`, the power-series derivative `Li_2'(z)=-log(1-z)/z`, the chain rule and the rational identities yield `P'=-1/(1-x)+u/`(1-xu), `Q'=u/`(1-xu), `v'/v=P', w'/w=1/x+u/`(1-xu). Therefore `F'=-P/x+Q P'+P(1/x+u/(1-xu))-`P'Q`-P Q'=0`. The single-disc derivative series is continuous at 0; nonzero points in the open disc accumulate at 0, so its derivative also vanishes there. Equivalently multiply the derivative-series identity by `X` and cancel `X`. The coefficient argument in L0.8 then gives `(n+1)F_(n+1)=0`, hence every positive coefficient vanishes in characteristic zero. `F(0)=0` by `v(0)=u,w(0)=0,P(0)=0`, so `F=0` throughout the disc. This applies a one-variable ordinary-series uniqueness argument, not constancy of a locally analytic function or a polynomial in two branch logarithms.

*Needs:* L2.21, L2.19, L2.1, L0.15, L0.8, `HasFPowerSeriesOnBall.fderiv`, `HasFPowerSeriesAt.eq_formalMultilinearSeries`.

**Checks.**

- At `x=0` and any `|u|<1` both sides of the ordinary identity equal zero.
- The wrong-sign residual has XU coefficient 2, which is nonzero in `C_2` as well as every `ℂ_p`.

### L2.23 Cancellation of the two branch logarithms

**Lemma.** For nonzero `|x|,|u|<1` and any branch `log_a` on `ℂ_p`, write `v=u(1-x)/`(1-xu), `w=x(1-u)/`(1-xu), `L=log_a x, M=log_a u, A=log_a(1-x), B=log_a(1-u), C=log_a(1-xu), P=A-C, Q=B-C`. Then `log_a(xu)=L+M, log_a v=M+P, log_a(1-v)=Q, log_a w=L+Q, log_a(1-w)=P`, and [LA`+`MB`-(L+M)C-(M+P)Q-(L+Q)P`]`/2=-P Q`. (DJ arXiv:2007.11014v1, p. 6 Prop. 2.10;, p. 14 paragraph before its proof.)

Standing hypotheses of this target: `p` prime; `x,u` nonzero with norms below 1; `log_a` is the existing normalized branch; 2 is invertible in `ℂ_p`, also when `p=2`.

*Proof sketch.* The rational-pair lemma supplies all nonzero arguments. Apply the branch homomorphism law and `log_a(s/t)=log_a s`-`log_a t` on nonzero elements to the displayed fractions and their complements. Substitute `A=P+C` and `B=Q+C` into the bracket. The terms containing `L` and `M` cancel; the remaining expression is `-2 P Q`. Divide by 2 in the characteristic-zero field. This is a polynomial cancellation before differentiating: it places no analytic or boundedness assumption on `L` and `M`, and does not need their algebraic independence.

*Needs:* L2.19, L0.15.

### L2.24 The five-term dilogarithm relation on nested discs

**Lemma.** For branch `a`, any prime `p` and `x,y` in `ℂ_p` with `0<|y|<|x|<1, D^a(x)-D^a(y)+D^a(y/x)-D^a((1-x^(-1))/(1-y^(-1)))+D^a((1-x)/(1-y))=0`. Here `D^a` is the existing L2 dilogarithm; all five arguments are different from 0 and 1. (DJ arXiv:2007.11014v1, p. 6 Prop. 2.10;, p. 14 paragraph before its proof.)

*Proof sketch.* Set `u=y/x`. Then `x,u` are nonzero with norms below `1, y=`xu, and the fourth and fifth arguments become `v=u(1-x)/`(1-xu) and `1-w`, where `w=x(1-u)/`(1-xu). Clear denominators using the rational-pair lemma. Reflection `D^a(1-w)=-D^a(w)` turns the signed sum into `D^a(x)+D^a(u)-D^a(xu)-D^a(v)-D^a(w)`. All five arguments now lie in the punctured unit disc. Replace each `Li_2^a` by its ordinary series via the existing power-series normalization. Their contribution is `+P Q` by L2.22. The logarithmic correction is `-P Q` by L2.23. They cancel for every branch. This closes the nested-disc subcase only. The global parent still needs field-correct permutation/Mobius transport, exhaustive five-point normalization, and a separately checked four-distinct-reductions argument; none is inferred from this lemma.

*Needs:* L2.22, L2.23, L2.19, L2.18, L2.5.

**Checks.**

- At `p=2, (x,y)=(2,8)` satisfies the relation for branch.
- At `p=5, (x,y)=(5,25)` satisfies the relation for branch.

### L2.25 Polylogarithm values at roots of unity of order prime to `p`

**Theorem.** Let `ζ ∈ ℂ_p` be a root of unity of order `N ≥ 2` with `p ∤ N`, let `f` be the order of `p` in (`Z/`NZ)`^×` (so `ζ^{p^f} = ζ` and `ℚ_p(ζ)` is unramified of degree `f`), and `k ≥ 1`. For branch `a`: (a) `Li^a_k(ζ) − p^{−k}Li^a_k(ζ^p) = ℓ_k(ζ)` (the Frobenius relation at a point with `φ(ζ) = ζ^p`), hence `Li^a_k(ζ) = (1 − p^{−kf})^{−1}·Σ_{i=0}^{f−1} p^{−ik}ℓ_k(ζ^{p^i}) = p^k(p^{kf} − 1)^{−1}Σ_{i=0}^{f−1}p^{(f−1−i)k}ℓ_k(ζ^{p^i})`; in particular `Li^a_k(ζ)` does not depend on a and lies in `ℚ_p(ζ)`; (b) `Li_k(ζ) ∈ p^k·ℤ_p[ζ]` (for `k = 1`: `Li_1(ζ) = −log(1 − ζ) ∈ pZ_p[ζ]`); (c) `p^{−k}Li_k(ζ) ≡ −li_k(σ(ζ))/(1 − ζ)` mod `p`, where `σ(ζ) := ζ^{p^{f−1}}` is the root of unity with `σ(ζ)^p = ζ` and `li_k(x) := Σ_{b=1}^{p−1}x^b/b^k` (Besser's finite polylogarithm); equivalently `p^{−k}Li_k(ζ^p) ≡ −li_k(ζ)/(1 − ζ)^p` mod `p`; (d) `Li_k(ζ^{−1}) = (−1)^{k+1}Li_k(ζ)`. (BF Corollary 2.2, p. 2; BF Proof of Corollary 2.2, pp. `2-3`; GSWZ Proof of Lem. 3.1, `(175)`, p. 37; GSWZ Prop. 3.2, `(178)`, p. 38.)

*Proof sketch.* `ζ` and all `ζ^{p^i}` are special units (L2.2), so `|ζ^{p^i} − 1| = 1 > p^{−1/(p−1)}` and L2.15 gives `Li^a_k(ζ^{p^i}) − p^{−k}Li^a_k(ζ^{p^{i+1}}) = ℓ_k(ζ^{p^i})` for every `i`. Telescoping `f` times and using `ζ^{p^f} = ζ`: `(1 − p^{−kf})Li^a_k(ζ) = Σ_{i<f} p^{−ik}ℓ_k(ζ^{p^i})`. The right side involves only `ℓ_k`, which does not depend on a. (b) `ℓ_k(ζ^{p^i}) ∈ ℤ_p[ζ]` by L2.13 (i) (`ζ^{p^i} ∈ ℤ_p[ζ]` with `|ζ^{p^i} − 1| = 1`), and `p^k(p^{kf} − 1)^{−1} ∈ p^k ℤ_p^×`. (c) Modulo `p` only the term `i = f − 1` survives in `p^{−k}Li_k(ζ) = (p^{kf} − 1)^{−1}Σ_i p^{(f−1−i)k}ℓ_k(ζ^{p^i})`, and `p^{kf} − 1 ≡ −1`; by L2.13 (ii), `ℓ_k(σ(ζ)) ≡ li_k(σ(ζ))/(1 − σ(ζ)^p) = li_k(σ(ζ))/(1 − ζ)`. The second form: apply the first to `ζ^p`, with `σ(ζ^p) = ζ` and `1 − ζ^p ≡ (1 − ζ)^p` mod p. (d) L2.9 (ii). Values in `ℚ_p(ζ)`: `ℓ_k` has an expansion with `ℤ_p`-coefficients in `t` and `(1 − t)^{−1}`.


*Needs:* L2.15, L2.13, L2.2, L2.9, L2.5, `TauCeti.teichmuller`.

### L2.26 Values at points of finite extensions of `ℚ_p`

**Lemma.** Let `K ⊂ ℂ_p` be a finite extension of `ℚ_p` and `a ∈ K`. Then `Li^a_k(K ∖ {1}) ⊂ K` for `k ≥ 0, Li^{(p),a}_k` maps `{z ∈ K : z^p ≠ 1}` into `K`, and `ζ_p(k) ∈ ℚ_p` for `k ≥ 2`. For `a ∈ ℚ_p` (in particular the Iwasawa branch) and `K` Galois over `ℚ_p, τ(Li^a_k(z)) = Li^a_k(τ z)` for `z ∈ K ∖ {1}` and `τ ∈ Gal(K/ℚ_p)`. (BDJ §1, p. 870 (published);, p. 3 of v2; F Thm. 2.25, p. 13.)

*Proof sketch.* `log_a(K^×) ⊂ K`: `K^× = π_K^Z × μ_{q−1} × U^1_K, log_a(π_K) = (a + log(π_K^{e_K}/p))/e_K ∈ K` for a uniformiser `π_K`, roots of unity have logarithm 0, and the series logarithm maps `U^1_K` into `K` (L0.15). `z ∈ D⁻(0,1) ∩ K`: `Li_k^ser` has rational coefficients. `z ∈ K` with `|z| > 1`: L2.9 (i) and the previous step. `z ∈ O_K` with `z̄ ∉ {0, 1}`: the Teichmüller representative `ω` of `z̄` lies in `K` and is a root of unity of order prime to `p` (Tau Ceti `TauCeti.teichmuller`); `Li_j(ω) ∈ ℚ_p(ω) ⊂ K` for `j ≤ k` (L2.25 (a)); the expansion of `Li_k` on `D⁻(ω,1)` is determined by the recursion `(d/du)Li_j(ω + u) = Li_{j−1}(ω + u)/(ω + u)` (L2.7) with initial values `Li_j(ω) ∈ K` and `Li_0(ω + u) ∈ K[[u]]`, so its coefficients lie in `K` and `Li_k(z) ∈ K`. `z ∈ K ∩ D⁻(1,1), z ≠ 1`: `Li^a_k(z) = λ_k(z) − log(z)^{k−1}log_a(1 − z)/(k−1)!`; the Taylor coefficients of `λ_k` at 1 come from the recursion `dλ_k = λ_{k−1}dz/z + log(z)^{k−1}dz/((k−1)!(z − 1))` with rational data and constant term `ζ_p(k)` (L2.4). `ζ_p(k) ∈ ℚ_p`: for `p` odd, `ζ_p(k) = Li_k(−1)/(2^{1−k} − 1)` (L2.11 (c)) with `Li_k(−1) ∈ ℚ_p` (tame root, `f = 1`); for `p = 2, (3^{1−k} − 1)ζ_2(k) = Li_k(ω) + Li_k(ω²)` for `ω` a primitive cube root of unity, and by the explicit formula of L2.25 (a) (`ℓ_k` has `Z_2`-coefficients) the two values are exchanged by `Gal(Q_2(ω)/Q_2)`, so their sum lies in `Q_2`. Galois: L2.17, with `τ` extended to a continuous automorphism of `ℂ_p`.

*Needs:* L2.25, L2.9, L2.11, L2.17, L2.4, L2.7, L2.1, L0.15, `TauCeti.teichmuller`, L0.17.

### L2.27 Polylogarithm values at roots of unity of `p`-power order

**Theorem.** For `primitive ζ` of order `p^r, r≥1, Li_1^a(ζ)=−log_a(1−ζ)`, branch difference is `−(a−b)/(p^(r−1)(p−1))`, and the primitive-root sum is `−a`. Nontrivial character sums cancel this difference. For `k≥2, Li_k^a(ζ)=λ_k(ζ)∈ℚ_p(ζ)`, independently of a. If `r≥2` and `k≥0, Li_k^a(ζ)−p^(−k)Li_k^a(ζ^p)=g_k(1/(1−ζ))`. For `k≥2, Σ_(c=1)^(p−1)Li_k(ζ_p^c)=(p^(1−k)−1)ζ_p(k)`, and `Σ_(η∈μ_(p^r))Li_k(η)=p^(r(1−k))ζ_p(k)`. For `k≥1, Li_k(ζ⁻¹)=(−1)^(k+1)Li_k(ζ)`. Prove Galois equivariance for `k≥2`, and for `k=1` when `a∈ℚ_p`. (RJW Thm. 6.7, p. 39; BDJ Proof of Prop. 2.6, p. 876 (published); BBdJR §4, property (4), p. 20.)

*Proof sketch.* `|ζ − 1| = p^{−1/(p^{r−1}(p−1))}` (L2.2), so `ζ ∈ D⁻(1,1) ∖ {1}, v(1 − ζ) = 1/(p^{r−1}(p−1))`, and `Π_{c}(1 − ζ^c) = Φ_{p^r}(1) =` p. (a) `Li^a_1 = −log_a(1 − z)`; the branch difference is `−v(1 − ζ)(a − b)` (L2.10); the sum is `−log_a(Π_c(1 − ζ^c)) = −log_a(p)`; for `θ` nontrivial the branch difference `Σ_cθ^{−1}(c)·v(1 − ζ^c)(a − b)` vanishes since `v(1 − ζ^c) = v(1 − ζ)` for all `c` and `Σ_cθ^{−1}(c) = 0`. (b) On `D⁻(1,1), Li^a_k = λ_k − log(z)^{k−1}log_a(1 − z)/(k−1)!` and `log ζ = 0` (a root of unity), so for `k ≥ 2` the second term vanishes at `ζ`; `λ_k` is branch-free. (c) For `r ≥ 2, |ζ − 1| > p^{−1/(p−1)}` and L2.15 applies; `ζ^p` has order `p^{r−1}`. For the sums use L2.11 (c) with `m = p^r` and `m =` p. (d) L2.9 (ii). (e) L2.17 with `σ_c ∈ Gal(ℚ_p(ζ)/ℚ_p) ≅ (Z/p^r)^×` extended continuously to `ℂ_p`; values in `ℚ_p(ζ)` by L2.26.


*Needs:* L2.2, L2.4, L2.10, L2.15, L2.14, L2.11, L2.9, L2.17, L2.26, `Polynomial.eval_one_cyclotomic_prime_pow`, L0.15.

### L2.28 The expansion of `Li_k((1+T)ε)` at a root of unity and its logarithmic growth

**Lemma.** For a root `ε` of order `N≥2` that is not `a p`-power, `P_(k,ε)(T)=Li_k^a(ε(1+T))` belongs to `ℚ_p(ε)[[T]]∩R⁺` independently of a. Its constant is `Li_k(ε), P_(0,ε)=ε(1+T)/(1−ε(1+T))=A_ε−1, A_ε∈ℤ_p[ε][[T]]`, and `∂P_k=P_(k−1)`. For `n≥1, v_p(c_n)≥−k`⌊`log_p n`⌋`−C, C=C_(k,ε)=max(0,−min_(1≤j≤k)v_p Li_j(ε))` for `k≥1`, and `C_(0,ε)=0`; `C=0` for tame `ε`. Hence `|c_n|≤p^C n^k`. For nontrivial `primitive θ, G(θ⁻¹)⁻¹Σ_c θ⁻¹(c)P_(k,ε^c)` has the same logarithmic growth, `∂^k` equal to RJW's `F_θ`, and constant `G⁻¹Σ_c θ⁻¹(c)Li_k(ε^c)`. For `N=p^r` and `k≥1`, the expression `λ_k(ε(1+T))−log(1+T)^(k−1)log_a(1−ε(1+T))/(k−1)!` has a singularity at `T=ε⁻¹−1` inside `|T|<1`. The distinct singularities in its character sum do not cancel; neither expression lies in `R⁺`. At `k=0` use the rational function `ε(1+T)/(1−ε(1+T))`, with a simple pole at `T=ε⁻¹−1`; its distinct poles also survive the character sum, so these expressions lie outside `R⁺` as well. (RJW Lem. 6.4 and its proof, pp. `37-38`; RJW Rem. 3.39, p. 24; RJW Lem. 5.12, p. 33; BF Lem. 2.4, p. 3.)

Standing hypotheses of this target: `ε` of order `N≥2`; `a∈ℂ_p`; `k≥0`; `R⁺=`{`Σc_nT^n`: `|c_n|r^n→0` for `r<1`} (RJW Remark 3.39); growth order `h` means `|c_n|=O(n^h)`. In (b), `θ` primitive of conductor `N` makes the Gauss sum nonzero. The all-branch (a) uses `|ε−1|=1` on the whole disc.

*Proof sketch.* (a) By L2.2, `ε` is a special unit, so `D⁻(ε,1) = {(1 + T)ε : |T| < 1}` is a residue disc of `U` on which `Li^a_k` is a convergent power series in `z − ε` on the whole disc (L2.5, L2.4 (c)), independent of a (L2.10 (i)); composing with the affine map `T ↦ (1 + T)ε` gives `P_{k,ε} ∈ ℚ_p(ε)[[T]]` (values in `ℚ_p(ε)`: L2.26). `P_{0,ε}`: `Li_0(z) = z/(1 − z) = 1/(1 − z) − 1`; since `1 − ε` is a unit, `A_ε(T) = (1 − ε)^{−1}Σ_n(εT/(1 − ε))^n ∈ ℤ_p[ε][[T]]`. `∂ = (1 + T)d/dT` corresponds to `z·d/dz` under `z = (1 + T)ε`, so `∂P_{k,ε} = P_{k−1,ε}` (L2.7). Growth: `n·c_n(P_k) = Σ_{l=0}^{n−1}(−1)^{n−1−l}c_l(P_{k−1})` (from `P_k' = P_{k−1}/(1 + T)`); with `B_k(n) := min_{0≤l≤n}v_p(c_l(P_k))` this gives `B_k(n) ≥ min(v_p(Li_k(ε)), B_{k−1}(n) − ⌊log_p n⌋), B_0(n) ≥ 0`, and induction gives the bound. For `p ∤ N, Li_j(ε) ∈ p^jZ_p[ε]` (L2.25), so `C_{k,ε} = 0`. A bound `|c_n| ≤ C·n^k` implies `|c_n|r^n → 0` for `r < 1`. (b) Linear combination; `Σ_cθ^{−1}(c) = 0` kills the constant `−1` in `P_{0,ε^c}`; `G(θ^{−1}, ε) ≠ 0` for `primitive θ` (and the formula is used only then). For `k = 1, Li_1((1 + T)ε^c) = −log((1 + T)ε^c − 1)` since `log_a(−1) = 0`, which is RJW's summand. (c) For `k=0` the rational function has the stated simple pole with nonzero residue, and distinct poles in a character sum cannot cancel. For `k≥1`, use L2.4 (a) with `z = (1 + T)ε ∈ D⁻(1,1)` and `log((1 + T)ε) = log(1 + T)`. At `T_0 := ε^{−1} − 1 (|T_0| = |1 − ε| < 1), log(1 + T)` has a simple zero (`log(1 + T_0) = log ε^{−1} = 0`, derivative `(1 + T_0)^{−1} ≠ 0`), and `log_a(1 − (1 + T)ε) = log_a(−ε(T − T_0)) = log_a(T − T_0)`; so near `T_0` the function is an analytic function plus `−(T − T_0)^{k−1}u(T)log_a(T − T_0)/(k−1)!` with `u` analytic and `u(T_0) ≠ 0`, which is not a convergent power series in `T − T_0` (transcendence of the logarithm over analytic functions on a punctured disc: L0.22). For the twisted sum, near `T_c := ε^{−c} − 1` every summand except the `c`-th is analytic (the points `T_c` are distinct), and the `c`-th contributes `θ^{−1}(c) ≠ 0` times such a singular term, so `F̃_{θ,k}` is not analytic at `T_c` and not in `R^+`.

*Needs:* L2.2, L2.5, L2.4, L2.10, L2.7, L2.25, L2.26, L0.21, L0.22, `PowerSeries`, `PowerSeries.IsRestricted`, `gaussSum`, `DirichletCharacter`.

**Checks.**

- At `k=0` and tame `ε`, `C_(0,ε)=0`, and the rational geometric transform has integral coefficients, including constant `ε/(1−ε)`.
- For a primitive `p`-power root `ε`, the weight-zero function has a simple pole at `T=ε⁻¹−1` inside the unit disc; it is outside `R⁺` without any use of `λ_0`.
- At `k=1` the singular term is `−log_a(1−ε(1+T))`, while at `k=2` it is multiplied by `log(1+T)`; the zero of that factor at the centre does not make the logarithmic singularity analytic (L0.22).

### L2.29 Norm and trace compatibilities: sums over conjugate roots of unity

**Lemma.** For `primitive ε` of order `N≥2, k≥1` (`a∈ℚ_p` if `k=1`), prove `σLi_k(ε)=Li_k(ε^(c_σ))` and trace equal to the Galois-orbit sum. For tame `N`, Frobenius `c=p` generates the group; `Tr Li_1^a(ε)=−log_a Norm(1−ε)`. For `k≥2` the sum over all primitive roots is `ζ_p(k)Σ_(d|N)μ(N/d)d^(1−k)=ζ_p(k)N^(1−k)∏_(ℓ|N)(1−ℓ^(k−1))`. For `k=1` it is `−log_a Φ_N(1)`, giving `−a` for `N=p^r, −log ℓ` for `N=ℓ^s` with `ℓ≠p`, and 0 otherwise. If `M|N` have the same prime divisors and `c_0 ∈ (ℤ/Mℤ)^×`, the sum over `c ∈ (ℤ/Nℤ)^×` with `c ≡ c_0` mod `M` is `(N/M)^(1−k)Li_k^a(ε^(c_0N/M))`. Include adjacent `p`-power levels. (BDJ §2, p. 876 (published);, p. 10 of v2; BBdJR Proof of Prop. 4.17, p. 22.)

Standing hypotheses of this target: `ε` primitive of order `N ≥ 2`; `k ≥ 1`; `a ∈ ℚ_p` when `k = 1` in (a); in (b) for `k ≥ 2` the value `Li_k(1) = ζ_p(k)`; in (c), `M|N` have the same prime divisors and `c_0 ∈ (ℤ/Mℤ)^×`.

*Proof sketch.* (a) L2.17 and L2.26; for `k = 1, Σ_σ log_a(σ(1 − ε)) = log_a(Π_σσ(1 − ε)) = log_a N(1 − ε)`; for `p ∤ N, ℚ_p(ε)/ℚ_p` is unramified with Galois group generated by Frobenius, `ε ↦ ε^p` (L2.2). (b) For `k ≥ 2, Σ_{ζ∈μ_d}Li_k(ζ) = d^{1−k}ζ_p(k)` (L2.11 (c)); the primitive `N`-th roots are obtained from the `μ_d, d | N`, by Möbius inversion. For `k = 1, Π_c(1 − ε^c) = Φ_N(1)` (Mathlib `Polynomial.eval_one_cyclotomic_prime_pow`, Mathlib `Polynomial.eval_one_cyclotomic_not_prime_pow`). (c) If every prime of `N` divides `M`, then `c ≡ c_0` (mod `M`) with `c_0` a unit mod `M` forces `c` to be a unit mod `N`, so the fibre is {`c_0 +` Mj : `0 ≤ j < N/M`} and `ε^{c_0 + Mj} = ε^{c_0}·η^j` with `η := ε^M` a `primitive (N/M)-`th root of unity; L2.8 with `m = N/M` at `z = ε^{c_0}` gives the sum (`z^m = ε^{c_0N/M} ≠ 1` because `M ≥ 2, M` being divisible by every prime of `N ≥ 2`).

*Needs:* L2.17, L2.26, L2.11, L2.8, L2.2, `Polynomial.eval_one_cyclotomic_prime_pow`, `Polynomial.eval_one_cyclotomic_not_prime_pow`, `IsPrimitiveRoot`, L0.15.

**Checks.**

- For `N = 8, M = 4, c_0 = 1`, the fibre consists of `1, 5`, so `Li_k^a(ε) + Li_k^a(−ε) = 2^(1−k)Li_k^a(ε²)`.
- At `p = 3, N = 8, M = 4, k = 1, a = 0, c_0 = 2`, the unit fibre is empty, but the expression without the unit hypothesis would be `Li_1(−1) = −log_3(2) ≠ 0`. Indeed `log_3(4) ≡ 3` modulo 9 and `log_3(4) = 2log_3(2)`.
- For `M = N` and a unit `c_0`, the fibre is a singleton and the factor is 1. At adjacent levels `N = p^(r+1), M = p^r, r ≥ 1`, a unit fibre has exactly `p` elements and its sum is `p^(1−k)Li_k^a(ε^(pc_0))`.

### L2.30 The complex polylogarithm at roots of unity, compared with the p-adic one

**Comparison.** For `k≥2`, the principal complex value `Li_k^C(e^(2πix))=Σ_(n≥1)e^(2πinx)/n^k=``HurwitzZeta.expZeta``(x,k)`. At `x=j/N` it equals `ZMod.LFunction` of `n↦e^(2πijn/N)`, or `N^(−k)Σ_(b mod N)e^(2πijb/N)ζ(k,b/N)`. At weight 1 and `ε≠1` use `−Log(1−ε)`. Prove distribution and, for `0<x<1,k≥1`, inversion `Li_k^C(e^(2πix))+(−1)^kLi_k^C(e^(−2πix))=−(2πi)^k B_k(x)/k!`, versus zero for p-adic root inversion. Shared rational coefficients do not identify the values: `Li_2^C(−1)=−π²/12` versus `Li_2(−1)=0` for odd `p`, and `Li_2^C(1/2)=π²/12−log(2)²/2` versus `Li_2(1/2)=−log_p(2)²/2`. Comparisons use chosen embeddings of algebraic character values and Gauss sums. (RJW Rem. 6.6 and Thm. 6.7(i), p. 39; BBdJR Proof of Prop. 4.17, p. 22; BDJ Rem. 1.5, p. 870 (published).)

Standing hypotheses of this target: `k ≥ 2` in (a) except for the last sentence; `x` real; `N ≥ 1`.

*Proof sketch.* (a) The complex polylogarithm `Li_k^ℂ` of L2.Fa is continuous on the closed unit disc for `k ≥ 2` and equals `Σ z^n/n^k` there (absolute convergence on `|z| = 1`); Mathlib's `hasSum_expZeta_of_one_lt_re` identifies the sum with `expZeta(x, k)`, and `ZMod.LFunction_stdAddChar_eq_expZeta` with the definition of `ZMod.LFunction` gives the Hurwitz form. At `k = 1` and a nontrivial root `ζ` the boundary series `Σ ζ^n/n` converges by Dirichlet's test (bounded partial sums of the geometric progression), and Abel's boundary theorem identifies its limit with the radial limit of `−Log(1 − rζ)`, hence `−Log(1 − ζ)`; the open-disc Taylor identity alone does not give boundary convergence, which is why L2.Fa states it. (b) For `0 < x < 1` the complex inversion relation at `e^(2πix)` is the API `complexPolylog_inversion_rootOfUnity` of L2.Fa, which comes from the Bernoulli Fourier series (`B_k(x)` for `k ≥ 2` through Mathlib's `HurwitzZeta.cosZeta_two_mul_nat` and `HurwitzZeta.sinZeta_two_mul_nat_add_one`, and `Σ sin(2πnx)/n = π(1/2 − x)` for `k = 1`); the p-adic statement is L2.9(ii). (c) Complex values: `Li_2^ℂ(−1) = −π²/12` and `Li_2^ℂ(1/2) = π²/12 − log(2)²/2` (Euler); p-adic values: L2.25 `(Li_2(−1) = 0)` and L2.18 with L2.9 `(Li_2(2) = 0, Li_2(1/2) = −log(2)²/2)`.

*Needs:* L2.Fa, L2.9, L2.25, L2.18, `HurwitzZeta.expZeta`, `HurwitzZeta.hasSum_expZeta_of_one_lt_re`, `ZMod.LFunction`, `ZMod.LFunction_stdAddChar_eq_expZeta`, `HurwitzZeta.cosZeta_two_mul_nat`, `HurwitzZeta.sinZeta_two_mul_nat_add_one`, `Complex.hasSum_taylorSeries_neg_log`.

### L2.31 Scalar five-term dilogarithm expression

**Definition.** For the fixed branch a define `R_a(x,y)=D^a(x)−D^a(y)+D^a(y/x)−D^a((1−x⁻¹)/(1−y⁻¹))+D^a((1−x)/(1−y))`. The mathematical domain is the admissible pairs; this is a scalar expression in `ℂ_p`, not a new pre-Bloch group or projective cross-ratio. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7).

- `fiveTermDefect_eq`: `R(x,y)` is the displayed five-term expression with fourth coefficient `−1` and fifth coefficient `+1`.
- `fiveTermDefect_swap`: `R(y,x)=−R(x,y)`.
- `fiveTermDefect_one_sub`: `R(1−x,1−y)=−R(x,y)`.
- `fiveTermDefect_inv`: `R(x⁻¹,y⁻¹)=−R(x,y)`.
- `fiveTermDefect_dilate`: `R(x⁻¹,y/x)=−R(x,y)`.
- `fiveTermDefect_move_origin`: `R(x/(x−1),(y−x)/(1−x))=−R(x,y)`.
- `fiveTermDefect_fractional`: `R(x/(x−1),y/(y−1))=−R(x,y)`.
- `fiveTermDefect_mixed_norm`: `R(x,y)=0` when `0<|x|<1<|y|`.
- `fiveTermDefect_separated_discs`: `R(x,y)=0` when `0<|x|<1` and `0<|1−y|<1`.
- `fiveTermDefect_close_pair`: `R(x,y)=0` when `0<|x|=|y|<1` and `0<|x−y|<|x|`.
- `fiveTermDefect_small_first`: When `0<|x|<1, R(x,y)` is zero or equals, up to sign, `R(u,v)` with admissible `u,v` and `|v|=|1−v|=1`.
- `fiveTermDefect_reduce_special_unit`: Every admissible pair has the same zero-or-signed-special-unit reduction.
- `fiveTermDefect_vanishes_of_special_units`: Vanishing for admissible pair with special-unit second coordinate implies vanishing for admissible pair.

*Construction.* Form the five values of the existing `D` and take their signed sum. No vanishing property is part of this definition. Unfolding gives the evaluation API. The lemmas L2.33–L2.43 prove its covariance and reduction API from the two-term identities and the nested-disc result; no API item is assumed by the definition.


*Needs:* L2.18.

**Checks.**

- At `p=5, R_a(5,25)=0`, by the exact inherited nested-disc theorem.
- At `p=2, R_a(2,8)=0`; no odd-prime assumption is present.
- At `p=5, R_a(5,30)=0`: `|5|=|30|=1/5` but `|5−30|=1/25`.
- At `p=5, R_a(5,6)=0`: 5 is close to0 and6 is close to1.

### L2.32 Admissibility of the five dilogarithm arguments

**Lemma.** For an admissible pair `x,y`, all three additional arguments `A=y/x, B=(1−x)/(1−y), C=(1−x⁻¹)/(1−y⁻¹)=`AB are different from0 and1. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7).

*Proof sketch.* All numerator and denominator factors `x,y,1−x,1−y` are nonzero. Clear denominators to identify `C=`AB. `A=1` or `B=1` would give `y=x`. For `C=1`, multiply by `x(1−y)` to obtain `y(1−x)=x(1−y)`, again `y=x`. These elementary field manipulations apply in `ℂ_p` without constructing any general cross-ratio object.

*Needs:* Field arithmetic.

### L2.33 Exchange of the two scalar inputs

**Lemma.** For admissible `x,y, R_a(y,x)=−R_a(x,y)`. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7).

*Proof sketch.* Write `A=y/x, B=(1−x)/(1−y), C=`AB. Exchanging `x` and `y` exchanges the first two values and replaces `A,B,C` by their inverses. Use `D(z⁻¹)=−D(z)` on each of `A,B,C`, whose domains are certified by L2.32. Collect the five signed terms. The transformed pair remains admissible.

*Needs:* L2.31, L2.32, L2.18.

### L2.34 Simultaneous complementation of the inputs

**Lemma.** For admissible `x,y, R_a(1−x,1−y)=−R_a(x,y)`. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7).

*Proof sketch.* For `A,B,C` as above, the transformed third, fourth and fifth arguments are `B⁻¹,C⁻¹,A⁻¹`, respectively, by clearing the nonzero denominators. Apply reflection to the first two terms and inversion to the other three. This gives `−D(x)+D(y)−D(B)+D(C)−D(A)=−R_a(x,y)`. The new points are nonzero, nonone and distinct.

*Needs:* L2.31, L2.32, L2.18.

### L2.35 Simultaneous inversion of the inputs

**Lemma.** For admissible `x,y, R_a(x⁻¹,y⁻¹)=−R_a(x,y)`. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7).

*Proof sketch.* The transformed third, fourth and fifth arguments are `A⁻¹,B,C`. Apply inversion to the first three `D`-values. The result is `−D(x)+D(y)−D(A)−D(B)+D(C)`, which is `−R_a(x,y)`. Nonzero, nonone and distinctness follow by cancellation of units.

*Needs:* L2.31, L2.32, L2.18.

### L2.36 Dilation by the first input

**Lemma.** For admissible `x,y, R_a(x⁻¹,y/x)=−R_a(x,y)`. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7).

*Proof sketch.* The new pair `u=x⁻¹,v=y/x` is admissible: `v≠1` uses `x≠y` and `u≠v` uses `y≠1`. Its third argument is `y`. In terms of `B=(1−x)/(1−y), C=(1−x⁻¹)/(1−y⁻¹)`, its fourth argument equals `C/(C−1)`, and its fifth equals `B/(B−1)`. For example `C−1=(y−x)/(x(1−y))`; clear denominators to check both identities. Three successive uses of inversion, reflection and inversion give `D(z/(z−1))=−D(z)` for `z≠0,1`. Thus the transformed sum is `−D(x)−D(y/x)+D(y)+D(C)−D(B)=−R_a(x,y)`.

*Needs:* L2.31, L2.32, L2.18.

### L2.37 Moving the first input to the origin

**Lemma.** For admissible `x,y, R_a(x/(x−1),(y−x)/(1−x))=−R_a(x,y)`. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7).

*Proof sketch.* Apply complement, then dilation by the first input, then complement. Each transformation preserves admissibility and changes the sign. Compute `1−1/(1−x)=x/(x−1)` and `1−(1−y)/(1−x)=(y−x)/(1−x)`. Three sign changes give the claimed minus sign.

*Needs:* L2.34, L2.36.

### L2.38 Fractional transformation of both inputs

**Lemma.** For admissible `x,y, R_a(x/(x−1),y/(y−1))=−R_a(x,y)`. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7).

*Proof sketch.* Apply inversion, complement and inversion to the pair. Every intermediate point is nonzero and nonone, and distinctness is preserved. For `z≠0,1, (1−z⁻¹)⁻¹=z/(z−1)`. The three sign changes give the result.

*Needs:* L2.35, L2.34.

### L2.39 Five-term relation across small and large norms

**Lemma.** If `0<|x|<1<|y|`, then `R_a(x,y)=0`. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7); `x≠0, |x|<1` and1`<|y|`; the other admissibility conditions follow.

*Proof sketch.* The norm inequalities imply admissibility. Exchange `x,y` and dilate: `(u,v)=(1/y,x/y)`. The two covariance signs cancel, so `R_a(u,v)=R_a(x,y)`. By `norm_div` and `norm_inv, 0<|v|=|x|/|y|<1/|y|=|u|<1`. Apply L2.24 at `u,v` and unfold L2.31.

*Needs:* L2.33, L2.36, L2.24, `PadicComplex.isNonarchimedean`, `norm_div`, `norm_inv`.

### L2.40 Five-term relation on two separated residue discs

**Lemma.** If `0<|x|<1` and0`<|1−y|<1`, then `R_a(x,y)=0`. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7); `x≠0, |x|<1, y≠1` and `|1−y|<1`.

*Proof sketch.* Ultrametricity gives `|1−x|=|y|=1`, so `x,y` are admissible and distinct. Use L2.38. Its transformed pair is `u=x/(x−1),v=y/(y−1)`, with `|u|=|x|<1` and `|v|=1/|1−y|>1`. Apply L2.39 and reverse the sign.

*Needs:* L2.38, L2.39, `PadicComplex.isNonarchimedean`, `norm_div`, `norm_inv`.

### L2.41 Five-term relation for an equal-norm collision

**Lemma.** If0`<|x|=|y|<1` and0`<|x−y|<|x|`, then `R_a(x,y)=0`. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7); `x≠0, |x|<1, |y|=|x|, x≠y` and `|x−y|<|x|`.

*Proof sketch.* Ultrametricity gives `|1−x|=1`. The move-origin transformation has `u=x/(x−1),v=(y−x)/(1−x)`, with `|u|=|x|` and `|v|=|x−y|`. Both are nonzero and0`<|v|<|u|<1`. Apply L2.24 and L2.37. Equal outer norms alone are insufficient: the equal-spread case is handled separately by reduction to a special unit.

*Needs:* L2.37, L2.24, `PadicComplex.isNonarchimedean`, `norm_div`, `norm_inv`.

### L2.42 Norm reduction when the first input is small

**Lemma.** For an admissible pair with `|x|<1`, either `R_a(x,y)=0`, or there exist admissible `u,v` with `|v|=|1−v|=1` such that `R_a(x,y)=R_a(u,v)` or `R_a(x,y)=−R_a(u,v)`. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7); `|x|<1`.

*Proof sketch.* If `|y|>1`, use L2.39. If `|y|=1`, ultrametricity gives `|1−y|≤1`; equality already makes `y` special and `take(u,v)=(x,y)`, while strict inequality gives L2.40. If `|y|<1` and `|y|<|x|`, use L2.24. If `|x|<|y|`, exchange `x,y` and use that theorem together with L2.33. The remaining case is `|x|=|y|=r<1`. Ultrametricity gives `|x−y|≤r`. Strict inequality is L2.41. If equality holds, put `u=1/x` and `v=y/x`. Then `|v|=1` and `|1−v|=|x−y|/|x|=1`. The pair is admissible by the denominator checks in L2.36, and `R_a(x,y)=−R_a(u,v)`. These cases exhaust the total order on real norms. The strict collision and equal-spread cases are kept separate; replacing one by the other would leave a hole.

*Needs:* L2.39, L2.40, L2.41, L2.33, L2.36, L2.24, `PadicComplex.isNonarchimedean`, `norm_div`, `norm_inv`.

### L2.43 Exhaustive scalar reduction to special units

**Theorem.** For admissible pair `x,y`, either `R_a(x,y)=0`, or there exist admissible `u,v` with `|v|=|1−v|=1` such that `R_a(x,y)=R_a(u,v)` or `R_a(x,y)=−R_a(u,v)`. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7).

*Proof sketch.* If `|x|<1`, apply L2.42. If `|x|>1`, invert both inputs. The first transformed input is small; apply L2.42 there and transport its zero or signed equality back with L2.35. If `|x|=1`, ultrametricity gives `|1−x|≤1`. In the equality case exchange the inputs: `take(u,v)=(y,x)`, so `v` is special and L2.33 supplies the sign. If `|x|=1` and `|1−x|<1`, complement both inputs. The first input is small and both points remain admissible. Apply L2.42 and transport back with L2.34. Composing signs only exchanges equality and negative equality, so the stated disjunction is preserved. No projective compactification, choice of a finite extension or unjustified analytic constancy enters this scalar reduction.

*Needs:* L2.42, L2.35, L2.34, L2.33, `PadicComplex.isNonarchimedean`, `norm_div`, `norm_inv`.

### L2.44 Special-unit sufficiency for the scalar five-term theorem

**Theorem.** For a fixed branch `a`, assume the special-unit subcase: `R_a(u,v)=0` for admissible `u,v` with `|v|=|1−v|=1`. Then `R_a(x,y)=0` for admissible `x,y`. (DJ arXiv:2007.11014v1, p. 6 discussion before Proposition2.10 and, p. 14 discussion immediately before its proof.)

Standing hypotheses of this target: (C6), (C7); For admissible `u,v` with `|v|=|1−v|=1`, the special-unit scalar identity `R_a(u,v)=0` is supplied as an explicit hypothesis.

*Proof sketch.* Apply L2.43. Its first alternative is the conclusion. In its second alternative, apply the special-unit hypothesis to the furnished admissible pair. Either transported sign gives zero. This is a conditional reduction implication. The end-comparison construction, geometric boundary normalization and algebraic-density passage supply its special-unit hypothesis in L2.69. No carrier or field asserting the desired global conclusion is introduced.

*Needs:* L2.43.

### L2.45 Logarithmic coordinates of the five argument maps

**Lemma.** For admissible `x,v` in `ℂ_p`, write `X=log_a x, U=log_a(1−x), V=log_a v, W=log_a(1−v), H=log_a(x−v)`, and `α=`dx`/x, β=`dx`/(x−1), γ=`dx`/(x−v)`. For the ordered arguments `x,v,v/x,v(x−1)/(x(v−1)),(1−x)/(1−v)`, the `pairs(log f,log(1−f))` are `(X,U),(V,W),(V−X,H−X),(V+U−X−W,H−X−W),(U−W,H−W)`. Their differential pairs `are(α,β),(0,0),(−α,γ−α),(β−α,γ−α),(β,γ)`. (F v2, §2.1, pp. 7–9, Assumption2.1 and Proposition2.5.)

*Proof sketch.* Apply the existing admissibility lemma to rule out zero and one at all five arguments. Factor1`−v/x=(x−v)/x, 1−v(x−1)/(x(v−1))=(x−v)/(x(1−v))`, and1`−(1−x)/(1−v)=(x−v)/(1−v)`. Use the existing logarithm-branch homomorphism, including `log(−1)=0`, to obtain the five logarithm pairs. Differentiate the nonvanishing factors, keeping `v` fixed, to obtain the five differential pairs. No scalar five-term identity is used.

*Needs:* L2.32, L0.15, L0.19, `HasDerivAt`.

### L2.46 Vanishing differential of the scalar five-term defect

**Lemma.** For branch a and every admissible pair `x,v` in `ℂ_p`, `HasDerivAt` `(x↦R_a(x,v)) 0` holds at `x`, where `R_a` is the existing scalar `fiveTermDefect`. This is a differential statement on the admissible open locus; global vanishing is not asserted. (F v2, §2.1, pp. 7–9, Assumption2.1 and Proposition2.5.)

*Proof sketch.* For each argument use `dD_a(f)=`one-`half(log_a(f)dlog_a(1−f)−log_a(1−f)dlog_a(f))` from L2.18 and the chain rule. Insert the logarithm and differential pairs from L2.45 with signs`+,-,+,-,+`. Twice the result is `X β−U α+(V−X)(γ−α)+(H−X)α−(V+U−X−W)(γ−α)+(H−X−W)(β−α)+(U−W)γ−(H−W)β`. Collect the coefficients of `α,β,γ`; each is identically zero by commutative ring algebra. This works for `p=2` because the coefficient field has characteristic zero, so2 is invertible. Keep the subsequent Coleman membership, global constancy and boundary normalization separate. A function with derivative zero on a totally disconnected locus need not be globally constant.

*Needs:* L2.31, L2.45, L2.18, `HasDerivAt`.

### L2.47 Local analyticity of the actual polylogarithm

**Lemma.** For natural `k` and `z≠1`, the function `Li_k^a` is analytic at `z` over `ℂ_p`. (F §2.2, Definition2.9 and Proposition2.11, v2, pp. 9–10.)

Standing hypotheses of this target: (C8), (C9).

*Proof sketch.* For `k≥1`, use the existing Coleman function on the ordinary residue discs, the power-series expression near zero and the existing expansions on the punctured discs of 1 and `∞`. At a nonsingular point these expansions are locally analytic. For `k=0` the defining rational function `z/(1−z)` is analytic away from its nonzero denominator. Neither case asserts continuity at `z=1`.

*Needs:* L2.5, L2.4, L2.1.

### L2.48 Weight one and the fixed logarithm branch

**Lemma.** For `z≠1`, the actual weight-one polylogarithm satisfies `Li_1^a(z)=−L(1−z)`. (F §2.2, Definition2.9 and Proposition2.11, v2, pp. 9–10.)

Standing hypotheses of this target: (C8), (C9).

*Proof sketch.* Apply the weight-one clause of the existing polylogarithm construction and its continuation. It is the fixed branch `L` throughout, including on the punctured discs. No separate logarithm is constructed.

*Needs:* L2.5.

### L2.49 Continuity of the Coleman dilogarithm

**Lemma.** For `z≠0,1`, the existing Coleman dilogarithm `D^a` is continuous at `z` as an `ℂ_p`-valued function. (F §2.2, Definition2.9 and Proposition2.11, v2, pp. 9–10.)

Standing hypotheses of this target: (C8), (C9).

*Proof sketch.* By L2.47, `Li_1^a` and `Li_2^a` are continuous away from 1, using `AnalyticAt.continuousAt`. On a neighborhood of any nonzero `w`, L2.48 gives `L(w)=−Li_1^a(1−w)`. This proves continuity of the actual branch `L` there. Apply it at `z` and at `1−z`. Use the defining scalar expression `D^a(z)=Li_2^a(z)+L(z)L(1−z)/2` and continuity of sums and products in `ℂ_p`. Division by the fixed nonzero scalar 2 is valid also for `p=2`.

*Needs:* L2.47, L2.48, L2.18, `AnalyticAt.continuousAt`.

**Checks.**

- For `p=2` and every branch, `D^a` is continuous at 2.

### L2.50 Continuity of the five-term expression

**Lemma.** The actual scalar function `(x,y)↦R_a(x,y)` is continuous on the admissible open set `A⊂ℂ_p²`. (F §2.2, Definition2.9 and Proposition2.11, v2, pp. 9–10.)

Standing hypotheses of this target: (C8), (C9).

*Proof sketch.* The projections and the three rational argument maps in `R_a` are continuous at every admissible pair. Their denominators `x, 1−y`, and `1−y⁻¹` are nonzero; the last condition follows from `y≠0,1`. Use L2.32 lemma to check that each argument differs from 0 and 1. Compose L2.49 with each of the five maps. Take the exact signed sum from L2.31. This uses no global five-term theorem or zero-derivative constancy principle.

*Needs:* L2.31, L2.32, L2.49.

**Checks.**

- For `p=2` and every branch, `(x,y)↦R_a(x,y)` is continuous at `(2,8)`.

### L2.51 The special-unit admissible locus is open

**Lemma.** The set `S={(x,y)∈A: |y|=|1−y|=1}` is open in `ℂ_p²`. (F §2.2, Definition2.9 and Proposition2.11, v2, pp. 9–10.)

Standing hypotheses of this target: (C8), (C9).

*Proof sketch.* The five nonvanishing and inequality conditions defining A are open: the coordinate functions and their difference are continuous and `ℂ_p` is Hausdorff. In the existing ultrametric space `ℂ_p`, a sphere of nonzero radius is open. Pull back the radius-one sphere at zero along the second projection and along `(x,y)↦1−y`. Intersect these two open sets with A. This is openness of this particular Coleman locus, not a new analytic-space or special-unit carrier.

*Needs:* `PadicComplex.isUltrametricDist`, `IsUltrametricDist.isOpen_sphere`, `isOpen_ne_fun`.

**Checks.**

- At `p=3, (3,2)` belongs to `S` and `|3|≠1`; restricting the first coordinate to special units would fail this test.
- At `p=5, (2,2)` does not belong to `S`.
- At `p=3, (0,2)` does not belong to `S`.

### L2.52 Algebraic pairs are dense in the special-unit locus

**Lemma.** Let `e`:`PadicAlgCl``(p)²→ℂ_p²` be the pair of canonical completion embeddings. Then `S⊆closure(S∩range(e))`. Thus admissible algebraic pairs with special-unit second coordinate approximate every pair in `S` while retaining those conditions. (F §2.2, Definition2.9 and Proposition2.11, v2, pp. 9–10.)

Standing hypotheses of this target: (C8), (C9).

*Proof sketch.* At the pin, `ℂ_p` is the completion of the existing algebraic closure `PadicAlgCl``(p)`. `UniformSpace.Completion`.`denseRange_coe₂` supplies density of the pair embedding into the product. Apply `Dense.open_subset_closure_inter` to that dense range and the open set `S` from L2.51. The approximating algebraic coordinates may generate different finite extensions as the approximation improves. No one fixed finite extension is asserted dense in `ℂ_p`; in particular `ℚ_p`-rational pairs are not substituted for algebraic-closure pairs.

*Needs:* L2.51, `PadicComplex`, `UniformSpace.Completion`.`denseRange_coe₂`, `Dense.open_subset_closure_inter`.

### L2.53 Reduction to algebraic special-unit inputs

**Theorem.** Fix a branch. Assume `R_a(e(u),e(v))=0` for `u,v` in the existing `PadicAlgCl``(p)` whose image pair is in `S`. Then `R_a(x,y)=0` for admissible `x,y∈ℂ_p`. This is a conditional density-and-norm reduction. Its hypothesis is supplied by five-term-algebraic-special-unit-constancy and the geometric boundary normalization. (F §2.2, Definition2.9 and Proposition2.11, v2, pp. 9–10.)

Standing hypotheses of this target: (C8), (C9).

*Proof sketch.* Restrict L2.50 to `S`. The hypothesis gives equality with the constant-zero function on `S∩range(e)`. Use `Set.EqOn.of_subset_closure` with L2.52 to extend equality to every point of `S`. This is extension of a continuous identity, not a conclusion from a vanishing local derivative. Apply L2.44 theorem to obtain vanishing at every admissible pair. The existing signed covariance and norm reduction supply this last step. The reduction itself is conditional. Its algebraic hypothesis is supplied by L2.68 and L2.60 in the final scalar proof. Any two input elements of `PadicAlgCl``(p)` lie in a common finite extension, but that field can vary. Branch parameters remain arbitrary in `ℂ_p`.

*Needs:* L2.50, L2.52, L2.44, `Set.EqOn.of_subset_closure`.

### L2.54 The normalized polylogarithm at zero

**Lemma.** For natural `k, Li_k^a(0)=0`. (F arXiv math/0304085v2, §2.1, p. 7; Definition2.9 and Remark2.10, pp. 9–10; Proposition2.11 and Notation2.12, p. 10; Lemma2.14, p. 11.)

Standing hypotheses of this target: (C2), (C3).

*Proof sketch.* The normalization of the existing polylogarithm agrees with its power series on `|z|<1`; every positive-degree term vanishes at zero. For `k=0` use `z/(1−z)`.

*Needs:* L2.5, L2.1.

### L2.55 Dilogarithm limit under a bounded-log hypothesis

**Lemma.** Let `u_n→0` in `ℂ_p`, with `u_n≠0` eventually, and suppose there is a real `M` with `|L(u_n)|≤M` eventually. Then `D^a(u_n)→0`. (F arXiv math/0304085v2, §2.1, p. 7; Definition2.9 and Remark2.10, pp. 9–10; Proposition2.11 and Notation2.12, p. 10; Lemma2.14, p. 11.)

Standing hypotheses of this target: (C2), (C3); `u` is a sequence; convergence, eventual nonvanishing and the eventual real norm bound on `L(u_n)` are explicit hypotheses.

*Proof sketch.* By L2.47 and L2.54, `Li_2^a(u_n)→0`. The local expansion of the actual branch at 1 gives `L(1−u_n)→L(1)=0`. Eventually `|u_n|<1`, so `1−u_n` is nonzero. The pinned bounded-times-zero theorem gives `L(u_n)L(1−u_n)→0`. Multiply by the fixed scalar `1/2` and add the polylogarithm limit. For `p=2` the scalar still exists; its norm is not asserted to be one.

*Needs:* L2.47, L2.54, L0.19, L2.18, `AnalyticAt.continuousAt`, `Filter.isBoundedUnder_le_mul_tendsto_zero`.

### L2.56 Dilogarithm along a scaled geometric sequence

**Lemma.** For `c≠0` in `ℂ_p, D^a(c q_n)→0` as `n→∞`. (F arXiv math/0304085v2, §2.1, p. 7; Definition2.9 and Remark2.10, pp. 9–10; Proposition2.11 and Notation2.12, p. 10; Lemma2.14, p. 11.)

Standing hypotheses of this target: (C2), (C3); `c∈ℂ_p` is nonzero; `c` and a need not be algebraic.

*Proof sketch.* The native geometric convergence theorem gives `p^(n+1)→0`, since the norm extends `|p|=p^−1`. Multiplication by `c` preserves the limit. Each `c q_n` is nonzero. Apply L0.24 with `m=n+1`. Apply L2.55.

*Needs:* L0.24, L2.55, `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`, `Padic.norm_p_lt_one`, `PadicComplex.norm_extends'`.

### L2.57 Dilogarithm along a geometric quotient

**Lemma.** For `c≠0` in `ℂ_p, D^a(c q_n/(1+q_n))→0` as `n→∞`. (F arXiv math/0304085v2, §2.1, p. 7; Definition2.9 and Remark2.10, pp. 9–10; Proposition2.11 and Notation2.12, p. 10; Lemma2.14, p. 11.)

Standing hypotheses of this target: (C2), (C3); `c∈ℂ_p` is nonzero; no finite-extension hypothesis.

*Proof sketch.* Native geometric convergence and continuity of division at denominator 1 give `c q_n/(1+q_n)→0`. The terms are nonzero. Use L0.25. The term `(n+1)a` is bounded by `|a|` by the native natural-cast norm bound; `L(c)` is constant; `L(1+q_n)→L(1)=0` by the local logarithm expansion. A convergent sequence has an eventual bound (take a unit-radius neighborhood of zero). Thus the logarithms of the quotient terms have a common eventual bound. Apply L2.55.

*Needs:* L0.25, L0.19, L2.55, `IsUltrametricDist.norm_natCast_le_one`, `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`, `Filter.Tendsto.div`, `Padic.norm_p_lt_one`, `PadicComplex.norm_extends'`.

**Checks.**

- At `p=2, D^a(2^(n+1)/(1+2^(n+1)))` tends to zero for branch a.

### L2.58 Admissibility near the boundary point one

**Lemma.** For `v≠0,1`, the pairs `(1+q_n,v)` are admissible for all sufficiently large `n`. (F arXiv math/0304085v2, §2.1, p. 7; Definition2.9 and Remark2.10, pp. 9–10; Proposition2.11 and Notation2.12, p. 10; Lemma2.14, p. 11.)

Standing hypotheses of this target: (C2), (C3); `v∈ℂ_p` differs from 0 and 1.

*Proof sketch.* `q_n` is nonzero and `|q_n|<1`, so `1+q_n` differs from 0 and 1 for every `n`. Since `q_n→0`, eventually `|q_n|<|v−1|`, which is positive. Then `1+q_n≠v`. The two fixed exclusions `v≠0,1` finish the claim. If `v` is a special unit, `|v−1|=1`, so the displayed inequality holds for every `n`. The next identity and limit do not require `v` to be special.

*Needs:* `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`, `Padic.norm_p_lt_one`, `PadicComplex.norm_extends'`.

**Checks.**

- At `p=3` the pair `(1+3^(n+1),2)` is admissible for `n`.

### L2.59 The five-term expression on the boundary sequence

**Lemma.** For `v≠0,1` and every `n, R_a(1+q_n,v)=−D^a(−q_n)−D^a(v)+D^a(v/(1+q_n))−D^a((v/(v−1))q_n/(1+q_n))+D^a(q_n/(v−1))`. (F arXiv math/0304085v2, §2.1, p. 7; Definition2.9 and Remark2.10, pp. 9–10; Proposition2.11 and Notation2.12, p. 10; Lemma2.14, p. 11.)

Standing hypotheses of this target: (C2), (C3); `v∈ℂ_p` differs from 0 and 1.

*Proof sketch.* The complement identity for `D` gives `D(1+q_n)=−D(−q_n)`; its input `−q_n` is neither 0 nor 1 because `q_n≠0` and `|q_n|<1`. The rational arguments simplify to `v/(1+q_n), (v/(v−1))q_n/(1+q_n)`, and `q_n/(v−1)`, respectively. Check `v≠0, v−1≠0` and `1+q_n≠0` before simplifying the original inverses. Substitute these exact values into the existing scalar five-term expression, retaining the minus sign on the fourth term. This identity concerns total expressions and does not use global five-term vanishing.

*Needs:* L2.31, L2.18, `Padic.norm_p_lt_one`, `PadicComplex.norm_extends'`.

**Checks.**

- At `p=3` and `n=0`: `R_a(4,2)=−D^a(−3)−D^a(2)+D^a(1/2)−D^a(3/2)+D^a(3)`.

### L2.60 Vanishing limit of the five-term expression

**Theorem.** For `v∈ℂ_p` with `v≠0,1, R_a(1+q_n,v)→0`. (F arXiv math/0304085v2, §2.1, p. 7; Definition2.9 and Remark2.10, pp. 9–10; Proposition2.11 and Notation2.12, p. 10; Lemma2.14, p. 11.)

Standing hypotheses of this target: (C2), (C3); `v∈ℂ_p` differs from 0 and 1; both `v` and a can be transcendental.

*Proof sketch.* Use L2.59. By L2.56 with `c=−1` and `c=1/(v−1)`, the first and fifth terms tend to zero. The fourth term tends to zero by L2.57 with `c=v/(v−1)`, which is nonzero. The third argument `v/(1+q_n)` tends to `v`. The L2.49 applies at the ordinary point `v≠0,1`, so the third term tends to `D(v)` and cancels the second term `−D(v)`. Add the five limits. The sequence is eventually admissible by L2.58. This uses neither the global five-term theorem nor any constancy inference from a zero derivative.

*Needs:* L2.59, L2.58, L2.56, L2.57, L2.49, `Filter.Tendsto.div`, `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`, `Padic.norm_p_lt_one`, `PadicComplex.norm_extends'`.

**Checks.**

- For `v≠0,1` and any `δ∈ℂ_p, R_a(1+q_n,v)+δ` tends to `δ`. A nonzero added constant survives the boundary test even though it does not change a derivative.

### L2.61 Determination of a constant by the boundary limit

**Lemma.** For `v≠0,1` and `C∈ℂ_p`, if `R_a(1+q_n,v)=C` for all sufficiently large `n`, then `C=0`. (F arXiv math/0304085v2, §2.1, p. 7; Definition2.9 and Remark2.10, pp. 9–10; Proposition2.11 and Notation2.12, p. 10; Lemma2.14, p. 11.)

Standing hypotheses of this target: (C2), (C3); `v≠0,1` and an actual eventual equality `R_a(1+q_n,v)=C` are supplied.

*Proof sketch.* The boundary-limit theorem gives convergence to zero. The eventual equality gives convergence to `C`. Apply uniqueness of limits in the Hausdorff field `ℂ_p`. The hypothesis is eventual equality of values on this sequence; zero derivative alone does not supply it.

*Needs:* L2.60, `tendsto_nhds_unique_of_eventuallyEq`.

### L2.62 Reduction to algebraic constancy on a punctured line

**Theorem.** Fix a branch and let `e`:`PadicAlgCl``(p)→ℂ_p` be the canonical completion embedding. Suppose that for `v` in `PadicAlgCl``(p)` with `|e(v)|=|1−e(v)|=1` there exists `C_v` such that `R_a(e(u),e(v))=C_v` for `u` in `PadicAlgCl``(p)` with `e(u)≠0,1,e(v)`. Then `R_a(x,y)=0` for admissible `x,y∈ℂ_p`. (F arXiv math/0304085v2, §2.1, p. 7; Definition2.9 and Remark2.10, pp. 9–10; Proposition2.11 and Notation2.12, p. 10; Lemma2.14, p. 11.)

Standing hypotheses of this target: (C2), (C3); The stated constancy on all admissible algebraic first coordinates is an explicit hypothesis; constancy only on the special-unit tube is insufficient.

*Proof sketch.* For a fixed algebraic special unit `v`, the elements `u_n=1+p^(n+1)` lie in `ℚ_p` and hence in the existing `PadicAlgCl`. Their images equal `1+q_n` by the native algebra-map operations. By L2.58 the constancy hypothesis applies eventually to `u_n`. The theorem L2.61 forces `C_v=0`. Therefore every admissible algebraic special-unit pair has vanishing defect. Apply L2.53 to extend to all admissible `ℂ_p` pairs. Its continuity, algebraic-density and signed scalar reduction remain the supplied route. The explicit constancy hypothesis is now supplied by L2.68, using actual Coleman membership, global Coleman constancy and whole-disc end determination. This conditional reduction remains useful independently of that construction and retains no dependency on its own consuming global theorem.

*Needs:* L2.58, L2.61, L2.53, `PadicComplex.coe_eq`, `PadicComplex.coe_natCast`.

### L2.63 A logarithmic Laurent end determines its punctured disc

**Lemma.** Let `L` be the actual logarithm branch. Suppose `f` and `g` each have a finite polynomial expansion in `L(z−c)`, with Laurent coefficients in the punctured-disc carrier `O_{ℂ_p}(A(c; 0, 1))` of L0.A1, as in `IsLogLaurentNear` (L0.20). If for some `0≤r<1` one has `f(z)=g(z)` whenever `r<|z−c|<1`, then `f(z)=g(z)` for `0<|z−c|<1`. A germ equality means such equality on an outer annulus; it is not merely agreement on a finite collection of points. (F arXiv math/0304085v2, §2.1, p. 7 (Laurent germ ring and logarithm transcendence); Proposition2.11 and proof of Theorem2.13, p. 10 (whole-disc logarithmic coefficients).)

Standing hypotheses of this target: `p` is any prime; `a,c∈ℂ_p`; `L=log_a`; `0≤r<1`. Both functions have the existing whole-punctured-disc logarithmic Laurent expansions, with a finite logarithmic degree and all-radius convergence.

*Proof sketch.* Subtract the two finite expansions and pad the shorter polynomial by zero coefficients. The resulting polynomial in `L(z−c)` vanishes on the nonempty open annulus `r<|z−c|<1`. Apply L0.21 on that annulus: every Laurent coefficient function vanishes there. The radii are nonnegative and genuinely distinct, so no empty-annulus injectivity assertion is used. Apply the identity principle L0.A2 (e) on the outer annulus to each coefficient family. Restriction to that annulus is the identity on coefficients (L0.A1), so the family is zero. All coefficients therefore vanish on the whole punctured disc, by their existing convergent series. Recover `f=g` there. Zero derivative of an arbitrary locally analytic function is not used.

*In `Suggested.lean`:* `IsLogLaurentNear.eqOn_punctured`.

*Needs:* L0.21, L0.20, L2.16, L0.A1, L0.A2.

**Checks.**

- The indicator of `|z|<|p|` has no IsLogLaurentNear expansion at0, although it is locally constant and vanishes on its outer end.

### L2.64 A logarithmic Laurent end determines the disc at `∞`

**Lemma.** Let `f,g` satisfy `IsLogLaurentAtInfty` (L0.20) for the same branch. If for some `0≤r<1` they agree whenever `r<|1/z|<1`, then they agree for `|z|>1`. This compares the functions on the entire punctured residue disc of`∞`. (F arXiv math/0304085v2, Proposition2.11, p. 10, the parameter1/t at∞.)

Standing hypotheses of this target: `p` is any prime; `a∈ℂ_p`; `L=log_a`; `0≤r<1`; both expansions converge at every parameter radius0`<ρ<1`.

*Proof sketch.* Pull both functions back along `z=t^−1`. The definitions become IsLogLaurentNear at0, with the identical Laurent coefficient sequences and logarithm `L(t)`. Apply L2.63 at0 and then set `t=z^−1`; for `|z|>1, 0<|t|<1`.

*Needs:* L2.63, L2.16, `norm_inv`.

### L2.65 Whole-disc expansions of the scalar defect

**Lemma.** For any special unit `v∈ℂ_p` and branch `L`, the function `z↦R_a(z,v)` has an IsLogLaurentNear expansion at each of0,`1,v` and an IsLogLaurentAtInfty expansion at`∞`. The logarithmic degree is finite; each Laurent coefficient converges on the whole punctured parameter disc. These statements concern the actual `dilogD` and `fiveTermDefect` defined here, not an abstract replacement. (F arXiv math/0304085v2, §2.1, pp. 7–9 and Proposition2.11, p. 10.)

Standing hypotheses of this target: `p` is any prime; `a∈ℂ_p`; `L=log_a`; `|v|=|1−v|=1`. No algebraicity restriction is needed for these local expansions.

*Proof sketch.* `Li_2` has the supplied whole-disc expansions at0,`1,∞` and one analytic series on each ordinary residue disc. The existing logarithm branch has analytic expansions away from0 and a single logarithm at0 or`∞`. Thus `D=Li_2+`½`L(w)L(1−w)` has a finite logarithmic polynomial expansion on each target punctured disc and is analytic on every ordinary target disc. For an ordinary target image use the exact local-chart table and L1.41 on its one analytic series. The pullback is one analytic series on the entire source disc. For a target end, its parameter is `u t/(1+b t)` with `|u|=1` and `|b|≤1`. Replace its logarithm by `L(t)+L(u)−log(1+b t)`. Its analytic coefficients compose by L1.41. Any finite negative powers come from the rational log factors; after factoring `t^−j` their remaining coefficients are analytic on the whole disc. Here the supplied `Li_2` coefficients themselves are analytic on the whole disc. The constant term `D(v)` and all four pulled-back functions lie in this one source logarithmic Laurent class on each source disc. Take their signed sum. Disjoint reduction ensures that no other source puncture lies inside the disc.

*Needs:* L1.44, L1.41, L2.4, L2.5, L2.18, L2.31, L0.19, L0.15, L0.10.

### L2.66 Coleman membership of the scalar defect

**Lemma.** Let `v` lie in a finite extension `K/ℚ_p` and satisfy `|v|=|1−v|=1`. In the existing Coleman algebra for the four-punctured pair `Y_v`, the element `H_v=f_0^*D−D(v)+f_1^*D−f_2^*D+f_3^*D` has, on every ordinary source disc, the actual values `R_a(z,v)`, and at every source end the germ of the function `R_a(·,v)`. It is a Coleman function of depth at most2. The equality at regular-image additional ends uses the ordinary-series restriction of L1.42. (F arXiv math/0304085v2, Proposition2.5, pp. 8–9 and Definition2.9, pp. 9–10.)

Standing hypotheses of this target: `K` is finite over `ℚ_p`; `v∈K` is a special unit; `a∈ℂ_p` is arbitrary. Use the four-puncture datum of L1.39 and the functions of L2.5 and L0.15.

*Proof sketch.* On the target three-punctured line, `Li_2` and both logarithms are Coleman; their product and linear combination `D` are Coleman by the existing subalgebra structure. Instantiate L1.43 for each of the four integral maps of L1.40, using L1.42 for its extra source end. The free coordinate `dz` and the supplied four-puncture Frobenius datum discharge the genus-zero hypotheses. Take the indicated linear combination in the source Coleman subalgebra; the scalar `D(v)` is its constant element. Products of depth-one logarithms and `Li_2` have depth at most2. The `LocAn` pullback is literal composition on ordinary discs and literal restriction of the same analytic or logarithmic series at source ends. Therefore its componentwise realization is the actual defect, including the extra-end germs. This comparison is part of membership, not an independent arbitrary normalization assumption.

*Needs:* L1.42, L1.43, L1.17, L1.39, L1.40, L2.3, L2.18, L2.31, L2.65.

### L2.67 One Coleman constant for the scalar defect

**Lemma.** For the Coleman element `H_v` of five-term-defect-coleman there exists one `C_v∈ℂ_p` with `H_v=C_v` in `A_Col^a(Y_v)`, hence in every component of `A_loc`. Thus the actual scalar defect is `C_v` on every ordinary residue disc and its germ at each of0,`1,v,∞` is the constant `C_v`. The same constant is used in all components. (F arXiv math/0304085v2, Proposition2.4, p. 8; corroborated by Besser arXiv math/0011269v1, Corollary4.14, p. 14.)

Standing hypotheses of this target: `K/ℚ_p` finite; `v∈K` special unit; arbitrary branch `a∈ℂ_p`. `H_v` is the actual pullback realization supplied by five-term-defect-coleman.

*Proof sketch.* Its ordinary and end components are the actual scalar expression. Apply L2.46 on every admissible point. On each end annulus the derivative of the germ is the derivative of that same expression, so `dH_v=0` in `Ω_loc`. Differentiation of the Coleman realization agrees with differentiation in `LocAn`. The uniqueness/injectivity of the realization therefore gives `dH_v=0` as a Coleman form. Apply the existing Coleman `ker(d)=ℂ_p` theorem. Equality `H_v=C_v` in the Coleman algebra implies equality in every component of `LocAn`. No inference from local constancy of arbitrary functions is made.

*Needs:* L2.66, L2.46, L1.18, L1.17, L1.16.

### L2.68 Constancy of the actual defect for an algebraic special unit

**Theorem.** Let `v` be in `PadicAlgCl``(p)`, embedded into `ℂ_p`, and `|v|=|1−v|=1`. For branch there exists `C_v∈ℂ_p` such that `R_a(x,v)=C_v` for `x∈ℂ_p` minus `{0,1,v}`. This includes all points in the four punctured residue discs, not only the special-unit tube. (F arXiv math/0304085v2, §2.1, pp. 7–9 and Proposition2.11, p. 10.)

Standing hypotheses of this target: `p` is any prime, including2; `v` is algebraic over `ℚ_p`; `a∈ℂ_p` is arbitrary. The actual `dilogD` and `fiveTermDefect` are used throughout.

*Proof sketch.* Place `v` in a finite `extensionK ofQ_p` and instantiate L2.67 there, extending coefficients `toC_p`. The equality on ordinary residue discs and at all four end germs uses `oneC_v`. At0,`1,v` compare the actual defect with the constant function using L2.65 and L2.63. The germ equality gives an outer annulus on which the expansions agree, and hence equality on the entire punctured disc. At`∞` use L2.64. Every admissible point `ofP¹(ℂ_p)` lies either in an ordinary residue disc or in one of these four punctured discs, since the removed sections have distinct reduction. This supplies the exact hypothesis of L2.62. It does not require the first coordinate to be algebraic or to lie `inK`.

*Needs:* L2.67, L2.65, L2.63, L2.64, L1.34, L2.26.

### L2.69 The scalar five-term dilogarithm identity

**Theorem.** For primep, every brancha`∈ℂ_p` and every `x,y∈ℂ_p` with `x,y≠0,1` and `x≠y`, the actual `fiveTermDefect R_a(x,y)` is zero. This is the scalar part of L2.70. L2.Fb supplies pre-Bloch evaluation and Bloch branch descent; the projective reformulation is separate. (DJ `arXiv2007`.11014v1, Proposition2.10, p. 6 and its normalization on, p. 14.)

Standing hypotheses of this target: `p` is any prime, including2; `a∈ℂ_p`; `x,y≠0,1`; `x≠y`.

*Proof sketch.* For each algebraic special unitv use L2.68 to obtain one constant for all admissible first coordinates. In particular restrict it to algebraic first coordinates. Apply L2.62: its geometric boundary limit forces the constant to0; the open-locus algebraic density and continuity extend this to `everyC_p` special-unit pair; the signed scalar norm reduction gives every admissible pair. This dependency chain uses no field-general projective five-point identity; the projective and Bloch forms are L2.Fb and L2.70.


*Needs:* L2.68, L2.62.

**Checks.**

- For any branch `onC_3` the scalar `defectR_a(4,2)` is0.
- For a special `unitζ∈C_2 withζ²+ζ+1=0`, the scalar `defectR_a(2,ζ)` is0 for branch.

### L2.70 The five-term relation for the p-adic dilogarithm

**Theorem.** For `x,y∈ℂ_p∖{0,1}, x≠y`, the scalar relation is `D^a(x)−D^a(y)+D^a(y/x)−D^a((1−x⁻¹)/(1−y⁻¹))+D^a((1−x)/(1−y))=0`. The further projective target is `Σ_(i mod 5)D^a([s_i,s_(i+1),s_(i+2),s_(i+3)])=0` for five distinct `P¹` points, with `[a,b,c,d]=(a−b)(c−d)/((a−d)(c−b))` and all `∞` cases. Over every `K⊆ℂ_p` this must induce pre-Bloch group`→ℂ_p`, branch independent on the Bloch kernel. L2.69 supplies the scalar identity and L2.Fb the Bloch boundary and branch descent. Normalize the first three points to `∞,0,1` using L2.Fb. Its cyclic-ratio calculation identifies the sum with the negative scalar defect, so L2.69 proves it; field transport and pre-Bloch evaluation use L2.Fb. (GSWZ §3.1, after (174), p. 38; W Prop. 4.4 and proof (case n = 1), pp. 364-365; W Lem. 4.3, p. 362; DJ arXiv:2007.11014v1, p. 6 Prop. 2.10;, p. 14 paragraph before its proof.)

Standing hypotheses of this target: `a ∈ ℂ_p`; `x, y ∉ {0, 1}, x ≠ y`; `p` prime.


*Needs:* L2.18, L2.11, L2.4, L2.9, L1.17, L1.43, L1.18, L2.24, L2.Fb, L2.44, L1.39, L1.40, L2.46, L2.53, L2.62, L2.69.

**Checks.**

- At `(x, y) = (4, 2)` the five terms have arguments `4, 2, 1/2, 3/2, 3` in the stated order and signs.
- At `p = 2`, the admissible pair `(2, 8)` is included without an odd-prime hypothesis.
- At `p = 5`, the pair `(5, 30)` is included although `|5| = |30| = 1/5` and `|5 − 30| = 1/25`.

### L2.71 Twisted sums `Σ_c θ^{−1}(c)Li_k(ε^c)` for primitive characters

**Lemma.** For nontrivial `θ` mod `N, primitive ε` and `k≥1`, set `S_k^a=Σ_cθ⁻¹(c)Li_k^a(ε^c), G=Σ_cθ⁻¹(c)ε^c`. Prove branch independence, `S(ε^b)=θ(b)S(ε)` for units `b`, and the primitive-character Gauss identity `G(ε^b)=θ(b)G(ε)` for all residues `b`. Thus `S/G` is root independent. Parity gives `S=−θ(−1)(−1)^kS`, vanishing unless `θ(−1)=(−1)^(k+1)`. If `θ` is primitive and `N≠p` or `k≥2, Σ_cθ⁻¹(c)Li_k^(p),a(ε^c)=(1−θ(p)p^(−k))S`, taking `θ(p)=0` for `p|N`. Continuous automorphisms transform both sums compatibly with `θ, ε` and `a`, and transform the quotient accordingly. (RJW Thm. 6.7(ii), p. 39; BHYY Thm. 1.1, p. 2; RJW Proof of Thm. 6.1(ii), p. 39.)

Standing hypotheses of this target: `θ` nontrivial modulo `N ≥ 2` (primitive where stated); `ε` primitive `N`-th root of unity; `k ≥ 1`; for (d) with `N = p, k ≥ 2` (`Li_1(1)` is undefined).

*Proof sketch.* (a) For `k ≥ 2` each `Li^a_k(ε^c)` is branch-free (L2.10 (iv)); for `k = 1` the branch difference is `−(a − b)Σ_cθ^{−1}(c)v(1 − ε^c)`, and `v(1 − ε^c)` is independent of `c` (L2.2) while `Σ_cθ^{−1}(c) = 0`. (b) Reindex `c ↦ b^{−1}c`. For the Gauss sum with `primitive θ` and non-unit `b`, Mathlib `gaussSum_mulShift_of_isPrimitive` (applied to `χ = θ^{−1}` and the additive character determined by `ε`). (c) Reindex `c ↦ −c` and use `Li_k(ζ^{−1}) = (−1)^{k+1}Li_k(ζ)` (L2.9 (ii)). (d) `Li^{(p)}_k(ε^c) = Li_k(ε^c) − p^{−k}Li_k(ε^{pc})`. If `p ∤ N, c ↦` pc permutes `(Z/N)^×` and `Σ_cθ^{−1}(c)Li_k(ε^{pc}) = θ(p)S_k`. If `p | N` and `N ≠ p, ε^p` is a `primitive (N/p)-`th root and `Σ_cθ^{−1}(c)Li_k(ε^{pc}) = Σ_{d∈(Z/(N/p))^×}Li_k(ε^{pd})·Σ_{c≡d}θ^{−1}(c)`; each inner sum runs over a coset of `ker((Z/N)^× → (Z/(N/p))^×)`, on which `θ` is nontrivial because `θ` is primitive of conductor `N`, so it vanishes. If `N = p` and `k ≥ 2, ε^{pc} = 1` and `Σ_cθ^{−1}(c)ζ_p(k) = 0` (L2.11). (e) L2.17 and the definition of the Gauss sum.


*Needs:* L2.10, L2.9, L2.11, L2.17, L2.2, L2.5, `DirichletCharacter`, `DirichletCharacter.IsPrimitive`, `gaussSum`, `gaussSum_mulShift_of_isPrimitive`, `ZMod.unitsMap_surjective`, `DirichletCharacter.factorsThrough_iff_ker_unitsMap`, `sum_hom_units_eq_zero`.

**Checks.**

- For `N = 4, θ = χ_(−4), k = 1`, parity gives `Li_1(i) − Li_1(−i) = 0`, since `θ(−1) = −1`.
- For a primitive character of conductor 9, reduction from `(ℤ/9ℤ)^×` to `(ℤ/3ℤ)^×` has fibres of size 3. Its restriction to the kernel is nontrivial, so every weighted fibre sum is zero; the `p = 3` Euler factor is 1.
- For `N = p, k = 1`, the modified sum would require `Li_1(1)`. The Euler-factor identity is excluded in this case, although branch independence of the unmodified sum still follows from the zero sum of the nontrivial character.

### Examples

- `Li_1(z) = −log_a(1 − z)`, and `Li_k(z) = Σ_(m≥1) z^m/m^k` on `|z| < 1` (L2.1, L2.5).
- Distribution with `m = 2`: `Li_k(z²) = 2^(k−1)(Li_k(z) + Li_k(−z))` for `z ≠ ±1` (L2.8).
- At a root of unity `ζ ≠ 1, Li_k(ζ) + (−1)^k Li_k(ζ⁻¹) = 0 p`-adically, so `Li_2(−1) = 0` in `ℂ_p` for `p` odd, whereas the complex value is `Li_2^ℂ(−1) = −π²/12` (L2.9, L2.25, L2.30).
- `Li_2(1/2) = −log_a(2)²/2` and `Li_2(2) = 0` for `p` odd (L2.18, L2.30).
- The five-term expression at `(x, y) = (4, 2)` is `[4] − [2] + [1/2] − [3/2] + [3]`; its dilogarithm values cancel (L2.69, L2.Fb).

### Dependencies

Layers L0–L1; PolylogarithmFunctions §§1.1–1.7, 3.1 and 5.8; AdicSpacesPartIV F1; TauCetiRoadmap RestrictedPowerSeries §2.1; Mathlib `HurwitzZeta.expZeta`.

## Layer L3: Positive integer L-values and regulators

Use geometric measures away from the disc of one, and pole-cancelled smoothing on that disc. Negative moments yield the character sum with its Euler factor and Teichmüller twist. Keep the scalar formula, the complex comparison, and the motivic regulator interpretation distinct: the final interpretation requires the stated regulator and realization interfaces. The regulator half rests on the foundations L3.Fa.1–L3.Fd.2 stated first.

### L3.F Motivic and regulator foundations: how they are organised

The regulator half of this layer (targets L3.14–L3.16, L3.36 and L3.37) rests on four groups of foundations: scheme and multi-relative specializations of ordinary K-theory with Adams weights, together with the de Jeu symbol complexes and Beilinson's cyclotomic elements (L3.Fa.1–L3.Fa.5); Besser's rigid syntomic regulator, the relative rigid complexes with their integration functional and the integration-down computation of the regulator on symbols (L3.Fb.1–L3.Fb.6); the complex Beilinson regulator pairing, the rank criterion and the cyclotomic determinants (L3.Fc.1–L3.Fc.3); and Artin L-functions with coefficients, complex and p-adic (L3.Fd.1–L3.Fd.2). GeometryOfNumbersAndQuadraticArithmetic §§6.1.1–6.1.3 supplies the generic Quillen foundations and §6.10 the finite-field K-groups. L3.Fa.1 imports them and constructs their scheme specializations, relative and multi-relative groups, products, localization, homotopy invariance, exact-cube comparison and Adams operations, using the exact-category and vector-bundle infrastructure in the supplier contracts. The remaining regulator foundations are owned here and supplied to downstream polylogarithm and regulator roadmaps. Throughout, `K` denotes a complete discretely valued field of characteristic zero with valuation ring `R` and residue field `κ` algebraic over `F_p`, and `q` is the cardinality of the finite model field defining the chosen Frobenius, which need not equal `κ`. The fixed cone carries this Frobenius as an index; the general modified syntomic theory takes the direct limit of L3.Fb.1. A fixed-stage unit formula requires compatibility of the reduction of that unit with that Frobenius (BDJ §1 Notation, p. 874; §4, pp. 890–892).

### L3.Fa.1 Rational `K`-groups with Adams weights

**Construction.** Work with regular noetherian separated schemes `B` of finite Krull dimension having an ample family of line bundles; these include the affine schemes and open cubes used below. Start with the essentially small exact category `P(B)` of finite locally free sheaves, with conflations the sheaf-exact sequences. Import its vector-bundle operations from AlgebraicVectorBundles L0A–L0C and its exact-category structure from GrothendieckEulerForms Layer 0. Import GeometryOfNumbersAndQuadraticArithmetic §§6.1.1–6.1.3 (`quillenQ`, `exactKGroup`, `exactKGroup_zero_iso`, `exactKGroup_map`, `nerveRealization_homotopy`, `quillenTheoremA`, `quillenTheoremB`). Define `higherKGroup m B` by specializing `exactKGroup (P(B)) m` on a small equivalent category; `QuillenQ` is an adapter to `quillenQ (P(B))`. The supplied definition is `π_(m+1)(|N quillenQ(P(B))|, 0)` for `m ≥ 0`, based at the vertex of the zero object of `P(B)`. Transport its abelian group laws, exact-functor maps, invariance under equivalence and the `K₀` comparison with GrothendieckEulerForms Layer 2 to these scheme specializations (Quillen, §2, construction and Theorem 1, published pp. 100–104). For the relative pairs of L3.Fa.2 use the homotopy fibre of the restriction map of pointed `K`-spaces, iterated for multi-relative cubes; construct the resulting long exact sequences. For these schemes (and the pairs and multi-relative pairs of L3.Fa.2), write `K_m(B)_ℚ = K_m(B) ⊗ ℚ` for Quillen's `K`-groups tensored with `ℚ` and `K_m^(j)(B) ⊆ K_m(B)_ℚ` for the common eigenspace of the Adams operations `ψ^k` on which `ψ^k` acts by `k^j` for all `k ≥ 1`, so that `K_m(B)_ℚ = ⊕_j K_m^(j)(B)`. The required theorems for these groups are: contravariant functoriality, compatible with the decomposition; the cup product `K_m^(i) × K_n^(j) → K_(m+n)^(i+j)`; homotopy invariance `K_m^(j)(B) ≅ K_m^(j)(𝔸¹_B)`; for a regular closed subscheme `Z ⊂ B` of pure codimension `c` with trivial normal bundle (the coordinate divisors and the closed point of a discrete valuation ring used here), the localization sequence `⋯ → K_m^(j−c)(Z) → K_m^(j)(B) → K_m^(j)(B∖Z) → K_(m−1)^(j−c)(Z) → ⋯`, with the shift of weight by the codimension; and K-theory with supports for the spectral sequences of L3.Fa.2. A scheme `B` has *no low weight K-theory* if `K_m^(j)(B) = 0` whenever 2j `≤ m` and `m > 0` (the Beilinson–Soulé vanishing), and a ring has it if its spectrum has (BDJ §3, Definition 3.2, p. 881; the localization sequences, p. 880).

Use the supplied nerve realization with basepoint the vertex of the zero object of `P(B)`; the pointed `K`-space is its loop space. For a pointed map `f` : `V → W` use the homotopy fibre of pairs `(v, γ)`, where `γ` is a path from `f(v)` to the basepoint of `W`; use GeneralizedCohomology G2, item 10 (`MappingPathSpace`, `MappingPathFiber`, their based-loop, functoriality and homotopy-equivalence comparisons), and its DGFloer §1.2 fibration long exact sequence. Here construct their specialization and iterated use for restriction maps of Quillen K-spaces. Use the imported homotopies of nerve realizations and Quillen A/B for these specializations (Quillen §1, published pp. 89–99, especially Theorem B, p. 97).

The Adams operations are another construction target, not fields of an assumed K-theory object. Starting from exterior powers of vector bundles, construct the normalized complex of exact cubes: an `n`-cube is a diagram on `{0, 1, 2}^n` exact in each coordinate, its differential is `Σ_(i=1)^n Σ_(j=0)^2 (−1)^(i+j) ∂`ᵢʲ, and degenerate cubes are quotiented out. Construct the rational comparison with higher `K`-groups and the transgression to cubes split in each direction. For the chain operations use the linear-functional Koszul complex imported from DerivedModuleAlgebra §0.K.1, locally for the tautological functional `Sym(E) ⊗ E → Sym(E)`; glue by its functoriality. Its homogeneous part of positive total degree `k` has terms `Symᵖ(E) ⊗ Λ^(k−p)(E), 0 ≤ p ≤ k`, with differential given by multiplication in the symmetric factor and alternating deletion in the exterior factor. Prove exactness, compatibility with pullback and its direct-sum decomposition for `E ⊕ F` (Feliu, Definition 2.15 and Lemma 2.16, p. 15). These homogeneous parts yield the chain operations `Ψ^k`. Prove that the induced `ψ^k` agree on `K₀` with the Newton polynomials in the exterior-power operations, are natural, satisfy `ψ^k ψ^l = ψ^(kl)`, respect products, and give the simultaneous rational eigenspace decomposition used here (Feliu, §1.2–§1.5, pp. 4–8; Proposition 3.17, p. 37; Corollary 4.1, Theorem 4.2 and Corollary 4.3, p. 40; BDJ §3, pp. 879–881 for the weight decomposition and localization convention). For arbitrary supports use `K(B on Z)`, the homotopy fibre of `K(B) → K(B∖Z)`, and its Adams operations. The uncorrected pushforward from `Z` shifts pure weights by `c` only under the trivial-normal-bundle hypothesis above; no such pure-weight statement is imposed on a general regular immersion.

- `QuillenQ`, `higherKGroup`, `higherKGroup.map`: adapters specializing the supplied category, `K`-groups and exact-functor maps to `P(B)`, including composition, identity and invariance under natural isomorphism.
- `higherKGroup.zeroEquiv`: `K₀` identified with the exact Grothendieck group by the class of each object.
- `relativeKSpace`, `higherKGroupWithSupports`: homotopy-fibre constructions, their functorial maps and long exact sequences.
- `exactCubeComplex`, `exactCubeComplex.homologyEquivK`, `adamsOnExactCubes`: the normalized cube complex, its rational comparison and the chain operations whose induced endomorphisms are `ψ^k`.
- `homogeneousKoszul`, `homogeneousKoszul.exact`, `homogeneousKoszul.directSum`: the positive homogeneous pieces of the imported Koszul complex, their exactness, pullback maps and direct-sum decomposition.
- `KTheoryQ.adams`: the decomposition `K_m(B)_ℚ = ⊕_j K_m^(j)(B)`, natural in `B`.
- `KTheoryQ.adams_one_one`: `K_1^(1)(A) ≅ A^× ⊗ ℚ` for a local ring (in particular a discrete valuation ring or a field) `A`, and `K_1^(j)(A) = 0` for `j ≠ 1`.
- `KTheoryQ.adams_cup`: the cup product respects weights.
- `KTheoryQ.localization`: localization with supports; the displayed weight shift under the trivial-normal-bundle hypothesis.
- `NoLowWeightKTheory`: the predicate `K_m^(j)(B) = 0` for 2j `≤ m, m > 0`.
- `noLowWeightKTheory_of_algebraic_over_Fp`: a field `κ` algebraic over `F_p` has no low weight K-theory. Import `finiteFieldKGroups` from GeometryOfNumbersAndQuadraticArithmetic §6.10. Here prove `colim_(F ⊆ κ, [F:F_p] < ∞) K_m(F) ≅ K_m(κ)` for `m ≥ 0`, with maps induced by scalar extension. Use the finite subfields ordered by inclusion and idempotent-matrix models for their projective-module categories: every object, span and finite relation descends to a finite subfield. The resulting filtered-colimit comparison of Q-nerves and their homotopy groups gives the isomorphism (Weibel, *The K-book*, IV §6.4, p. 321). Every element of `K_m(κ)` for `m ≥ 1` therefore comes from a finite torsion K-group, so is torsion; rationalization and all Adams eigenspaces vanish (BDJ Remark 3.5, p. 881).
- `noLowWeightKTheory_numberField`: a number field, and more generally a subfield of `ℚ̄`, has no low weight K-theory (BDJ Remark 3.6, p. 881; Remark 3.21, p. 886, via Borel's theorem).
- `KTheoryQ.dvr_localization_iso`: for a discrete valuation ring `O` of characteristic zero whose residue field is algebraic over `F_p` and `n ≥ 2`, the localization map `K_(2n−1)^(n)(O) → K_(2n−1)^(n)(Frac O)` is an isomorphism (BDJ §1, p. 868; Remark 1.9, p. 871).

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §§6.1.1–6.1.3 (`quillenQ`, `exactKGroup`, `exactKGroup_zero_iso`, `exactKGroup_map`, `nerveRealization_homotopy`, `quillenTheoremA`, `quillenTheoremB`) and §6.10 (`finiteFieldKGroups`); TauCetiRoadmap GrothendieckEulerForms Layers 0–2 (exact structures, admissible maps, conflation-exact functors and exact `K₀`); TauCetiRoadmap AlgebraicVectorBundles L0A–L0C (finite locally free sheaves, tensor, symmetric and exterior powers); TauCetiRoadmap DerivedModuleAlgebra §0.K.1 (the linear-functional Koszul complex, its maps and regular-sequence exactness); TauCetiRoadmap GeneralizedCohomology G2, item 10 (`MappingPathSpace`, `MappingPathFiber`, based-loop, functoriality and homotopy-equivalence comparisons), with the DGFloer §1.2 fibration long exact sequence it imports; Mathlib categories, nerves, topological homotopy groups, tensor products and cochain complexes. The scheme and multi-relative specializations, products, localization, homotopy invariance, exact-cube comparison, Adams operations and filtered-union comparison are targets of this subsection.

**Checks.**

- For the zero exact category, QuillenQ has one object and its realization is contractible, hence all `K`-groups vanish. For finite-dimensional vector spaces over a field, the `K₀` comparison sends a vector space to its dimension in `ℤ` and the split sequence `F → F² → F` gives `2 = 1 + 1`.
- A zero-cube is a vector bundle `E`. The boundary of the split one-cube `F → F² → F` is `−[F] + [F²] − [F]`; the degenerate cube `F → F → 0` is zero in the normalized quotient; the two-coordinate face identities give `d² = 0` for a split square. Taking only two of the three faces would fail the `K₀` relation.
- The homogeneous Koszul complex at `k = 1` is `E → E` by the identity. For a line bundle `L` and `k ≥ 1` its only nonzero terms are `L^⊗k → L^⊗k`, also by the identity. For `E = 0` every positive homogeneous piece vanishes. The `k = 0` piece is `O` in one degree and is not claimed exact.
- For a pointed identity map the homotopy fibre is contractible; for `V → {*}` it is `V`; for `{*} → W` it is the based loop space of `W`. An ordinary set-theoretic fibre would miss the third test.
- `ψ¹` is the identity, and for a rank-two trivial bundle `E` the Newton formula gives `ψ²[E] = [E]² − 2[Λ²E] = 2` in `K₀` of the field. Replacing `ψ²` by squaring would instead give 4.
- For a line bundle `L, ψ^k[L] = [L^⊗k]`; for a unit `u` in `K₁(F), ψ^k[u] = k[u]`, not `[u]`. Thus the rank-one class has weight zero on `Spec F` but the class of a unit has weight one.
- A nontrivial normal bundle prevents a naive weight shift: on `ℙ²` put `h = 1 − [O(−1)] = i_*[O_(ℙ¹)]`. Then `ψ²(h) =` 2h `− h²` with `h² ≠ 0` in `K₀(ℙ²)_ℚ`. So `i_*` does not take weight zero purely to weight one for this hyperplane, whose normal bundle is `O(1)`. The coordinate divisors of the cubes have trivial normal bundles and are within the stated localization contract.
- For a field `F, K_1^(1)(F) = F^× ⊗ ℚ`, so for `F = ℚ` the class of 2 is nonzero and the class of `−1` is zero.
- For a finite field `F_q, K_m(F_q)_ℚ = 0` for every `m ≥ 1`, so `F_q` has no low weight K-theory and every `K_m^(j)(F_q)` with `m ≥ 1` vanishes. Integrally `K_3(F_2) = ℤ/3` is nonzero; rational vanishing is not integral vanishing.
- For `κ = F_(p^r)` the finite-subfield diagram has terminal object `κ`, so its colimit comparison is the identity; it must retain `K₀(κ) = ℤ`.
- For `κ = F_p`-bar, `K₁(κ) = κ^×` is an infinite torsion group with elements of arbitrarily large order prime to `p`. Each element descends to a finite subfield, but no uniform annihilator is asserted; `K₁(κ)_ℚ = 0` nonetheless.
- For a number field `k` with `r₁` real and `r₂` complex places and `n ≥ 2, dim K_(2n−1)(k)_ℚ` is `r₁ + r₂` for `n` odd and `r₂` for `n` even (Borel; BBdJR Theorem 2.2, p. 5); for `k = ℚ` and `n = 2` the group is zero, and for `k = ℚ(μ_N), N > 2`, it has dimension `φ(N)/2` for every `n ≥ 2` (BBdJR Example 4.10, p. 19).
- `K_m^(0)(F) = 0` for `m ≥ 1` and `K_m^(1)(F) = 0` for `m ≥ 2` (BDJ Remark 3.26, p. 888); a weight convention giving the class of a unit weight 0 contradicts the first vanishing.

### L3.Fa.2 Multi-relative K-theory of cubes and the relativity isomorphism

**Construction.** Let `t` be the affine coordinate of `ℙ¹, X = ℙ¹_ℤ ∖ {t = 1}, X_B = X ×_ℤ B` and `X^m_B` its `m`-fold fibre power over `B`, and write □`^m` for the family of divisors `{t_1 = 0, ∞}`; …; `{t_m = 0, ∞}`. For a set `U` of special units of `B` (global units `b` with `1 − b` also a unit), `X_(B,loc)` is `X_B` with the divisors `t = b, b ∈ U`, removed, and `X^m_(B,loc)` its fibre power; one passes to the direct limit over finite `U`. Multi-relative K-theory `K_n^(j)(Y; □^m)` of such a cube is built from the relative exact sequences of the pairs `(Y; Y ∩ {t_i = 0, ∞})`, iterated one coordinate at a time. For `B` regular noetherian there are isomorphisms `K_n^(j)(X^m_B; □^m) ≅ K_(n+m)^(j)(B)` for `n ≥ 0` and `m ≥ 1` (the *relativity isomorphisms*), obtained one coordinate at a time from the fact that the restriction `K(X_B) → K({0, ∞})` is the diagonal; at each step the cokernel of the diagonal is identified with `K(B)` by subtracting the contribution at `t = ∞` from the one at `t = 0`, and this sign convention is fixed once and for all (BDJ §3, (3.1) and the paragraph after it, pp. 879–880). Localizing along the divisors `t_i = u` gives a stratification and a spectral sequence converging to `K^(n)(X^(n−1)_O; □^(n−1))` whose terms are multi-relative `K`-groups of smaller cubes over `O`, its fraction field `F` and its residue field (BDJ (3.7), p. 882).

- `cubeRelK`: `K_n^(j)(Y; □^m)` for an open `Y` of `X^m_B`, functorial for maps of cubes.
- `cubeRelK.relativityIso`: `K_n^(j)(X^m_B; □^m) ≅ K_(n+m)^(j)(B)` with the stated sign convention.
- `cubeRelK.relativityIso_symm_sign`: replacing the choice `t = 0` by `t = ∞` at one coordinate changes the isomorphism by the sign `−1`.
- `cubeRelK.pullback_proj`: pullback along a coordinate projection is compatible with the relativity isomorphisms.
- `cubeRelK.localizationSpectralSequence`: the spectral sequence (3.7) attached to the stratification by the divisors `t_i = u`.
- `cubeRelK.injective_to_generic`: for a discrete valuation ring `O` with fraction field `F`, residue field `κ_O`, `n ≥ 1` and a finite set `U ⊆ O^♭`, assume `NoLowWeightKTheory κ_O`. Then `K_n^(n)(X^(n−1)_(O,U); □^(n−1)) → K_n^(n)(X^(n−1)_(F,U); □^(n−1))` is injective, with exactly the same removed sections on both sides (BDJ Lemma 3.8, p. 882).
- `cubeRelK.furtherLocalization_injective`: for a field `F`, `n ≥ 1` and finite sets `U ⊆ V ⊆ F ∖ {0, 1}`, assume `NoLowWeightKTheory F`. Then restriction `K_n^(n)(X^(n−1)_(F,U); □^(n−1)) → K_n^(n)(X^(n−1)_(F,V); □^(n−1))` is injective (BDJ Lemma 3.13, p. 884). Composing with `cubeRelK.injective_to_generic` for `U ⊆ O^♭` requires both fraction-field and residue-field vanishing; the same injections pass to the direct limits over finite localization sets (BDJ paragraph after Lemma 3.13). For number fields both hypotheses follow from L3.Fa.1. For `n = 2` and `O` of characteristic zero, both injections hold without Beilinson–Soulé assumptions, using the weight-zero and weight-one vanishings of BDJ Remark 3.26, p. 888.
- `cubeRelK.lowWeight_vanishing`: if `F` and the residue field have no low weight K-theory, `K_m^(j)(X^q_(O,loc); □^q) = 0` for 2j `≤ q + m` and `m > q` (BDJ Lemma 3.4, p. 881).

*Needs:* L3.Fa.1.

**Checks.**

- `m = 1`: `K_0^(j)(X_B; □¹) ≅ K_1^(j)(B)`; for `B = Spec F` a field, `K_0^(1)(X_F; □¹) ≅ F^× ⊗ ℚ`.
- The two choices `t = 0` and `t = ∞` at a single coordinate give relativity isomorphisms that differ by exactly `−1` (the cokernel of the diagonal `K → K ⊕ K` is identified with `K` by `(a, b) ↦ a − b` or by `b − a`).
- For `U` empty, `X_(B,loc) = X_B` and the localization spectral sequence degenerates to the relativity isomorphism.
- For `U = V` the further-localization map is the identity. For `O = ℤ_(2)` the residue field has no low weight K-theory and `O^♭` is empty: the same-set generic map still has no removed sections over `ℚ`. Removing the generic section `t = 3` is a separate map, using `NoLowWeightKTheory ℚ` from L3.Fa.1.
- For `n = 2`, the residue-field obstruction is `K_2^(1)(X¹_(κ_O,U); □¹)`. Its unlocalized term is `K_3^(1)(κ_O) = 0` and its localization boundaries lie in `K_1^(0)(κ_O) = 0`. The same weight vanishings over `F` give further-localization injectivity without general low-weight assumptions (BDJ Remark 3.26, p. 888).

### L3.Fa.3 Universal symbols and the symbolic part of K-theory

**Construction.** Let `G = Spec ℤ[S, S⁻¹, (1 − S)⁻¹]`. For `n ≥ 2` there are universal symbols `[S]_n ∈ K_n^(n)(X^(n−1)_(G,loc); □^(n−1))`, localized only along the divisors `t_i = S`, whose boundary in the spectral sequence of L3.Fa.2 is `Σ_(i=1)^(n−1) (−1)^i [S]_(n−1)|_(t_i=S)` (de Jeu, cited in BDJ (3.10), p. 883). For a discrete valuation ring `O` of characteristic zero and `u ∈ O^♭` (`u` and `1 − u` units), `[u]_n` is the pullback of `[S]_n` along `S ↦ u` (BDJ Definition 3.11, p. 883). The weight-one part `(1 + I)^* = K_1^(1)(X¹_(O,loc); □¹)` is the `ℚ`-span of the products `∏_j ((t − u_j)/(t − 1))^(n_j)` with `u_j` in the set `U ⊆ O^♭` of removed sections and `∏_j u_j^(n_j) = 1`, followed by the direct limit over `U` (BDJ (3.12), p. 883, with the localization set fixed as on p. 881). The symbolic part is defined inductively by `Symb_1(O) = O^× ⊗ ℚ` and `Symb_(k+1)(O) = ⟨[u]_(k+1)` : `u ∈ O^♭⟩_ℚ + (1 + I)^* ∪̃ Symb_k(O)`, the second summand being spanned by the `k` cup products along the `k` coordinate projections (BDJ p. 883).

- `universalSymbol`: `[S]_n` over `G` and its boundary formula.
- `deJeuSymbol`: `[u]_n ∈ K_n^(n)(X^(n−1)_(O,loc); □^(n−1))` for `u ∈ O^♭`, natural in `O` for local homomorphisms of discrete valuation rings.
- `deJeuSymbol_boundary`: `d[u]_n = Σ_(i=1)^(n−1) (−1)^i [u]_(n−1)|_(t_i=u)`.
- `symbolicPart`: `Symb_k(O) ⊆ K_k^(k)(X^(k−1)_(O,loc); □^(k−1))` and the complex `Symb•(n)(O)` of BDJ p. 884, whose degree `r + 1` coproducts are indexed by the removed-section tuples `(O^♭)^r`, mapping to the lowest nonvanishing row of (3.7).
- `symbolicPart_alternating`: the symmetric group `S_(n−1)` acts on `Symb•(n)(O)` by permuting coordinates, and only the alternating part is used (BDJ p. 885).

*Needs:* L3.Fa.1, L3.Fa.2.

**Checks.**

- Weight one: for `n = 2` the element `[u]_2` has boundary `(1 − u)⁻¹`, read in `K_1^(1)(O) = O^× ⊗ ℚ` (BDJ p. 881); a definition with boundary `1 − u` has the opposite sign.
- If the residue field of `O` is `F_2` then `O^♭` is empty and the removed-section set is empty. Thus `(1 + I)^* = 0` and `Symb_k(O) = 0` for `k ≥ 2`; in particular `M_k(O) = N_k(O) = 0` (BDJ (3.12), p. 883, and Lemma 3.19, p. 886).
- For `u ∈ O^♭` (and after removing `u` and `u⁻¹`), the product condition is the triviality on □¹: the function `∏_j ((t − u_j)/(t − 1))^(n_j)` is 1 at `t = ∞` and `∏_j u_j^(n_j)` at `t = 0`. So the single factor `(t − u)/(t − 1)` with `u ≠ 1` is not in `(1 + I)^*`, while `((t − u)/(t − 1))·((t − u⁻¹)/(t − 1))` is. The removed-section condition matters too: over `ℤ₂` the set `O^♭` is empty, and the expression with `u = 3` and `u⁻¹ = 1/3` has zeros on the unremoved generic-fibre sections, so is not a unit of `X_O` despite satisfying the product condition.

### L3.Fa.4 The de Jeu complexes and their map to K-theory

**Construction.** For `n ≥ 2` and a discrete valuation ring `O` of characteristic zero with fraction field `F`, let `J_k(O) = (1 + I)^* ∪̃ Symb_(k−1)(O)` for `k ≥ 2`, a subspace of `Symb_k(O)`, and let `J•(n)(O)` be the subcomplex generated by these cup-product spaces and their differentials. Define `M•(n)(O) = (Symb•(n)(O))^alt / (J•(n)(O))^alt` as the actual quotient of complexes (BDJ pp. 884–885). Proposition 3.15 makes the denominator acyclic; taking alternating parts is exact over `ℚ`. Put `M_k(O) = Symb_k(O)^alt / J_k(O)^alt`, generated by `[u]_k` for `u ∈ O^♭`, and write `V = O^× ⊗ ℚ`.

If `O^♭ ≠ ∅`, equivalently the residue field has more than two elements, establish the tensor presentation `M_n → M_(n−1) ⊗ V → M_(n−2) ⊗ Λ²V → ⋯ → M_2 ⊗ Λ^(n−2)V → V ⊗ Λ^(n−1)V` in degrees 1, …, `n`. Its differential is `d([x]_k ⊗ y_1 ∧ ⋯ ∧ y_(n−k)) = [x]_(k−1) ⊗ x ∧ y_1 ∧ ⋯ ∧ y_(n−k)` for `k ≥ 3` and `d([x]_2 ⊗ y_1 ∧ ⋯ ∧ y_(n−2)) = (1 − x) ⊗ x ∧ y_1 ∧ ⋯ ∧ y_(n−2)` (BDJ pp. 885–886). The nonempty-special-unit hypothesis supplies all unit factors: if a unit `v` reduces to 1, choose a special unit `w`; then `wv` is special and `v = (wv)/w`. If the residue field is `F_2`, every codimension-positive index set `(O^♭)^r` is empty and `Symb_n(O) = 0` for `n ≥ 2`. Hence the entire symbolic complex and its quotient `M•(n)(O)` are zero, including degree `n` (BDJ p. 884). The tensor presentation does not apply in this case.

Let `N_k(O)` be spanned by `[u]_k + (−1)^k [u⁻¹]_k`, and let `N•(n)(O)` be the inversion subcomplex of this actual quotient. When `O^♭ ≠ ∅`, its terms are `N_k ⊗ Λ^(n−k)V` with last term `d(N_2 ⊗ Λ^(n−2)V)`. Define `M̃•(n)(O) = M•(n)(O)/N•(n)(O)`. In that case `M̃_k = M_k/N_k` and the last term is `(V ⊗ Λ^(n−1)V)/d(N_2 ⊗ Λ^(n−2)V) ≅ Λ^n V`: Lemma 3.19 identifies `dN_2` with the symmetric tensors, and the last differential becomes `(1 − x) ∧ x ∧ y_1 ∧ ⋯ ∧ y_(n−2)` (BDJ pp. 886–887). If the residue field is `F_2`, both complexes and the inversion subcomplex are zero. Over the characteristic-zero field `F`, special units are `F ∖ {0, 1}`, so the tensor presentation and exterior last term always apply.

For the unreduced comparison assume that `F` and the residue field have no low weight K-theory, or that `F` is a number field. Then there are natural maps `H^r(M•(n)(O)) ← H^r((Symb•(n)(O))^alt) → K_(2n−r)^(n)(O)`, with the quotient arrow an isomorphism (BDJ Proposition 3.15, Remark 3.16 and (3.17), p. 885). For the reduced comparison assume instead Beilinson–Soulé vanishing for every characteristic-zero field and for the residue field of `O`, or that `F` is a number field. Under this stronger general-field hypothesis, `N•(n)(O)` is acyclic, so `H^r(M•(n)(O)) → H^r(M̃•(n)(O))` is an isomorphism and gives the map from reduced cohomology to K-theory (BDJ Proposition 3.20, Remark 3.21 and (3.23), pp. 886–887). Both constructions commute with localization to `F`; the corresponding field comparisons use the same hypotheses with the residue-field clause omitted. The number-field branch of each comparison is unconditional. When the residue field is `F_2`, both complexes are zero and their comparisons are the zero maps; no vanishing hypothesis is needed for these zero-source maps.

- `deJeuComplex`: `M•(n)(O)` and its quotient `M̃•(n)(O)` as cochain complexes of `ℚ`-vector spaces in degrees 1, …, `n`, defined by the symbolic and inversion quotients above, with tensor presentations only when special units exist.
- `deJeuComplex.d_symbol`: the unreduced differential formulas above and their images in the actual reduced quotient; the wedge formula uses `O^♭ ≠ ∅` or a field.
- `deJeuComplex.inversion`: `[x]_k + (−1)^k [1/x]_k = 0` in `M̃_k` for special units `x`.
- `deJeuComplex.toKTheory`: `H^r(M•(n)(O)) → K_(2n−r)^(n)(O)` under the unreduced hypotheses, and `H^r(M̃•(n)(O)) → K_(2n−r)^(n)(O)` under the reduced hypotheses, transported by the cohomology isomorphism. For `F` a number field both maps are unconditional (BDJ Theorem 1.10(1), p. 871; (3.23), p. 887).
- `deJeuComplex.localization_injective`: `M_n(O) → M_n(F)` is injective if `F` and the residue field have no low weight K-theory (BDJ Proposition 3.18, p. 885). For `M̃_n(O) → M̃_n(F)` assume vanishing for every characteristic-zero field and for the residue field, or that `F` is a number field (BDJ Remark 3.22, p. 887). These give injections of the actual complexes: when special units exist, use the tensor and exterior presentations; otherwise the source complex is zero.
- `deJeuComplex.map_of_extension`: for `F'/F` and a discrete valuation ring `O' ⊂ F'` with `O ⊂ O' ∩ F`, maps `M̃•(n)(O) → M̃•(n)(O')` and `M̃•(n)(F) → M̃•(n)(F')`. When `F'` is algebraic over `ℚ`, both maps are injective on symbol terms and the field map is injective on the whole complex. The valuation-ring map is injective on the whole actual complex as well: either `O^♭ = ∅` and the source is zero, or both rings have special units and their last terms are exterior powers (BDJ Remark 3.25, pp. 887–888, with Lemma 3.19 for the last term).
- `deJeuComplex.distribution`: for `m ≥ 1, x ∈ F^×` with `x^m ≠ 1`, if `F` contains the `m`-th roots of unity then `[x^m]_n = m^(n−1) Σ_(α^m=1) [αx]_n` in `M_n(F)` and `M̃_n(F)` (BDJ Proposition 2.11, p. 879).
- `deJeuComplex.H1_iso_cyclotomic`: for `F` a cyclotomic field, and for every number field when `n = 2` or `3`, `H¹(M̃•(n)(F)) → K_(2n−1)^(n)(F)` is an isomorphism (BDJ p. 871, citing de Jeu).

*Needs:* L3.Fa.1, L3.Fa.2, L3.Fa.3; Mathlib `ExteriorAlgebra`, `TensorProduct`, `CochainComplex`.

**Checks.**

- Over `F = ℚ`, `n = 2`: `d[x]_2 = (1 − x) ∧ x`, so `[2]_2` is a reduced cocycle because `−1` is torsion, while `d[3]_2 = 2 ∧ 3 ≠ 0`. In the unreduced complex `d([x]_2 + [1/x]_2) = x ⊗ x`; when `O^♭ ≠ ∅`, the span of these images is the symmetric-tensor subspace (BDJ Lemma 3.19, p. 886).
- For `O = ℤ_(2)`, `F = ℚ` and `n = 2`, there are no special units. The last symbolic term is a direct sum of copies of `V` over the empty removed-section set. Thus `Symb•`, `M•` and `M̃•` are all `0 → 0`, and all their cohomology vanishes. Appending `V ⊗ V` would create a nonzero `H²`: `[3] ⊗ [3]` is detected by `v_3 ⊗ v_3` with value 1. Its exterior image is zero, but neither tensor nor exterior term is part of the actual complex in this case.
- For `O = ℤ_(3)`, the unit 2 is special, so both presentations apply. Under the unramified quadratic extension of `ℚ₂`, the residue field grows from `F_2` to `F_4`; the source valuation-ring complex is zero and its extension map is injective. The target has tensor and exterior last terms as specified above. In the general-field branch, vanishing only for `F` and its residue field supplies the unreduced comparison; the reduced comparison additionally uses vanishing for every characteristic-zero field. For `F = ℚ`, Remark 3.21 supplies it without that universal assumption.
- `n = 3`: `d([x]_3) = [x]_2 ⊗ x`, so `[−1]_3` is a cocycle in `M̃•(3)(ℚ)` (`−1` is torsion in `ℚ^×_ℚ`), while `[3]_3` is not: `[3]_2 ≠ 0` because its own differential `2 ∧ 3` is nonzero, so `[3]_2 ⊗ 3 ≠ 0`.
- Inversion: `[x]_2 + [1/x]_2 = 0` in `M̃_2(F)`, and `[x]_3 − [1/x]_3 = 0` in `M̃_3(F)` (the sign `(−1)^k`); a quotient using the same sign in every weight is wrong in odd weight.
- Distribution with `m = 2, F ⊇ ℚ` and `x² ≠ 0, 1`: `[x²]_n = 2^(n−1)([x]_n + [−x]_n)`; at `x = 2` this gives `[4]_n = 2^(n−1)([2]_n + [−2]_n)`. The input `x = −1` is excluded: `[1]_n` is not a generator of this complex. The extended cyclotomic class at 1 is specified in L3.Fa.5.

### L3.Fa.5 Cyclotomic elements and their spanning property

**Theorem.** Let `N ≥ 2, k = ℚ(μ_N), n ≥ 2`, and `ζ ∈ μ_N` with `ζ ≠ 1`. Since `ζ` is torsion in `k^×_ℚ`, the symbol `[ζ]_n` is a cocycle of `M̃•(n)(k)`, and its image in `K_(2n−1)^(n)(k) = K_(2n−1)(k)_ℚ` under L3.Fa.4 is Beilinson's cyclotomic element, still written `[ζ]_n`. The elements `[ζ]_n, ζ` a primitive `N`-th root of unity, `span K_(2n−1)(ℚ(μ_N))_ℚ` (BDJ Remark 1.13, p. 872). For `N > 2` the dimension is `φ(N)/2`, and for a primitive `N`-th root `ζ` the elements `[ζ^j]_n` with `1 ≤ j < N/2` and `gcd(j, N) = 1` form a basis; for `N = 2` and `n` odd, `[−1]_n` is a nonzero element and a basis of `K_(2n−1)(ℚ)_ℚ` (BBdJR Example 4.10, p. 19; proof of Proposition 4.17, pp. 22–23). The action of `G = Gal(k/ℚ) ≅ (ℤ/N)^×` is `σ_a[ζ]_n = [ζ^a]_n`, and for a primitive `N`-th root `ζ` and the idempotent `π` of a character `χ` with `χ(−1) = (−1)^(n−1)` the element `π(1 ⊗ [ζ]_n)` is a basis of `πK_(2n−1)(k)_E` (BBdJR proof of Proposition 4.17, p. 22).

- `cyclotomicElement`: `[ζ]_n ∈ K_(2n−1)(ℚ(μ_N))_ℚ` for `ζ ∈ μ_N ∖ {1}, n ≥ 2`.
- `cyclotomicElement_galois`: `σ_a[ζ]_n = [ζ^a]_n`.
- `cyclotomicElement_span`: the `[ζ]_n, ζ` primitive, `span K_(2n−1)(ℚ(μ_N))_ℚ`; for `N > 2` and a primitive `N`-th root `ζ`, the `[ζ^j]_n` with `1 ≤ j < N/2` and `gcd(j, N) = 1` form a basis (the printed range `1 < j < N/2` of BBdJR Example 4.10 omits `j = 1` and has one element too few).
- `cyclotomicElement_distribution`: for `m ≥ 1` and `ζ^m ≠ 1, [ζ^m]_n = m^(n−1) Σ_(α^m=1) [αζ]_n` in an extension containing `μ_m` (L3.Fa.4). Define the extended class `[1]_n` in `K_(2n−1)(ℚ)_ℚ, n ≥ 2`, by `[1]_n = 2^(n−1)/(1 − 2^(n−1)) [−1]_n` and transport it by field extension. This is a `K`-class, not an extra symbol generator. Its distribution at `−1` is `[1]_n = 2^(n−1)([−1]_n + [1]_n)`, and its regulator is the endpoint limit in L2.11 (BDJ §1, p. 869; BBdJR proof of Proposition 4.17, pp. 22–23). The denominator is nonzero because `n ≥ 2`.
- `cyclotomicElement_inversion`: `[ζ⁻¹]_n = (−1)^(n−1) [ζ]_n`, so `[ζ]_n` and `[ζ⁻¹]_n` give the same line, consistent with dimension `φ(N)/2`.
- `cyclotomicElement_isotypic_basis`: for a primitive `N`-th root `ζ` and the idempotent `π` of a character `χ` of `(ℤ/N)^×`, `π(1 ⊗ [ζ]_n)` is a basis of the `χ`-part when `χ(−1) = (−1)^(n−1)`, and that part is zero otherwise.

*Needs:* L3.Fa.4 for construction, Galois action, distribution and inversion; L3.Fc.1 and only the complex calculation of L3.Fc.3 for spanning, independence and the isotypic basis theorem. Spanning and independence use no p-adic determinant calculation.

**Checks.**

- `N = 3, n = 2`: `φ(3)/2 = 1`, the two primitive cube roots give `[ω]_2 = −[ω²]_2`, and `K_3(ℚ(μ_3))_ℚ` is one-dimensional, spanned by `[ω]_2`.
- `N = 2, n` even: `χ` trivial has `χ(−1) = 1 ≠ (−1)^(n−1)`, so the trivial isotypic part is zero, matching `K_(2n−1)(ℚ)_ℚ = 0` for `n` even; for `n` odd, `[−1]_n ≠ 0`.
- Non-example: at `N = 4, n = 2`, the nonprimitive root `ζ = −1` gives `[−1]_2 = 0` by inversion, so it cannot span the one-dimensional `χ_(−4)` component.
- `N = 4, n = 2`: `ℚ(i)` has `r₂ = 1`, so `K_3(ℚ(i))_ℚ` is one-dimensional, spanned by `[i]_2`, which lies in the `χ_(−4)-`part `(χ_(−4)(−1) = −1 = (−1)^(2−1))`; the trivial part `π = (1 + c)/2` is zero.

### L3.Fb.1 Modified syntomic cohomology and its normalized identification with rigid cohomology

**Definition.** Let `X = Spec A` be a smooth affine `R`-scheme, embedded as an open subscheme of a projective `R`-scheme `X̄` whose special fibre contains `X_κ` as the locus where the reductions of finitely many functions `h_i` do not vanish, and let `φ` be an `R`-morphism of `X̄` inducing on the special fibre an endomorphism `ϕ` that preserves `X_κ` and is the `κ`-linear base change of the `q`-power Frobenius of a finite-field model. For `λ < 1` let `U_λ` be the rigid space `|h_i| > λ`, and `Ωⁱ(U) = colim_(λ→1) Γ(U_λ, Ωⁱ)`; then `Ω•(U)` computes rigid cohomology `H*_rig(X_κ/K)`, functorially in `(X, X̄)` (BDJ Proposition 4.2, p. 891). For `n ≥ 0` the fixed-Frobenius Gros-style complex is `C_(φ,q)(X,n) = Cone(F^n Ω•(U) → Ω•(U))[−1]`, the map being `1 − φ*/q^n`, with the convention that `Cone(f : A• → B•)[−1]` has `Aⁱ ⊕ B^(i−1)` in degree `i` and differential `d(a, b) = (da, f(a) − db)` (BDJ p. 890, (4.1) p. 891); here `F^nΩ^j = Ω^j` for `j ≥ n` and 0 otherwise. Explicitly `Hⁱ(C_(φ,q)(X,n))` is the space of pairs `(ω, ε)` with `ω ∈ F^nΩⁱ(U), ε ∈ Ω^(i−1)(U), dω = 0` and `dε = (1 − φ*/q^n)ω`, modulo the pairs `(dω', (1 − φ*/q^n)ω' − dε')` (BDJ (4.4), p. 891). When `n ≥ i > dim(X/R)`, every class has `ω = 0`, and the *normalized identification* at this stage is `Hⁱ(C_(φ,q)(X,n)) ≅ H^(i−1)_rig(X_κ/K)/F^n, (0, ε) ↦ (1 − φ*/q^n)⁻¹[ε]`; the inverse exists because `1 − φ*/q^n` is an isomorphism `H^(i−1)_rig/F^n → H^(i−1)_rig/(1 − φ*/q^n)F^n` in this range (BDJ (4.5) and Definition 4.6, p. 892). The same normalization is used in relative situations, with all face maps represented at a common Frobenius stage.

The general complex `RΓ̃_ms(X,n)` is the filtered direct limit over finite-field models and Frobenius iterations, with comparisons between auxiliary rigid realizations. For a positive integer `m`, put `T = φ*/q^n` and `S_m(T) = 1 + T + ⋯ + T^(m−1)`. The transition from `(φ,q)` to `(φ^m,q^m)` is `(ω,ε) ↦ (ω,S_m(T)ε)`. It is a chain map since `1 − T^m = S_m(T)(1 − T)`, and transitions compose by `S_(ab)(T) = S_b(T^a)S_a(T)`. Finite collections of reductions descend to a common finite field, so compatible stages for finitely many units are cofinal. Construct the comparisons for common finite descent refinements and for changes of rigid realization, and prove independence in the limit. Extend by descent on smooth affine covers to smooth schemes, and take the corresponding relative and multi-relative complexes for finite cube diagrams (BDJ p. 891, referring to Besser Definition 8.4, and Appendix A, Definitions A.1–A.4, pp. 911–913). In the range `n ≥ i > dim(X/R)`, prove that the normalized rigid identification commutes with transitions and induces the same identification for the limit (BDJ (4.5) and Definition 4.6, p. 892); in particular `Spec R` admits the fixed-cone calculation.

- `modSyntomicComplex`: the fixed cone `C_(φ,q)(X,n)`, with explicit Frobenius index and cone sign.
- `modSyntomicComplex.iterate`: the transition chain map above for `m ≥ 1`, its composition law and its relative-cube version.
- `modSyntomicComplex.directLimit`: the general `RΓ̃_ms(X,n)` and its independence of finite descent data and rigid realizations, with common-stage maps for finite collections of units.
- `modSyntomicCohomology_explicit`: (4.4) at the indexed fixed stage; general classes are represented by such pairs at some stage, identified after passage to a common stage.
- `modSyntomicCohomology.normalizedIso`: Definition 4.6 for `n ≥ i > dim(X/R)`, at fixed stages and on the limit, compatible with transitions.
- `modSyntomicCohomology.functorial`: fixed-stage functoriality for Frobenius-compatible maps of pairs and general functoriality after common refinement.
- `modSyntomicCohomology.cup`: at a common stage the cup product (4.8), `(ω₁, ε₁) ∪ (ω₂, ε₂) = (ω₁ ∧ ω₂, ε₁ ∧ (γ + (1 − γ)φ*/q^j)ω₂ + (−1)^(deg ω₁)((1 − γ) + γφ*/qⁱ)ω₁ ∧ ε₂)` for every parameter `γ`; all choices induce the same product on cohomology. Prove transition compatibility on cohomology and hence a product on the limit (BDJ (4.8), p. 892).
- `modSyntomicCohomology.baseChange`: finite extensions `R → R'` induce maps after common finite descent refinement, compatible with the relative theory and the normalized rigid identification; on `Spec R` the normalized map is the inclusion `K → K'` (BDJ proof of Theorem 1.12, p. 910; BBdJR Lemma 2.15, pp. 7–8).

*Needs:* AdicSpacesPartIV §F1.2 and §F1.9 (dagger algebras and their de Rham complexes), PadicDifferentialEquationsAndRigidCohomology RD.4–RD.5 (rigid cohomology, its independence of choices and finiteness), Mathlib `CochainComplex`.

**Checks.**

- `Spec R, i = 1, n ≥ 1`, with `φ* =` id on `K`: `H̃¹_ms(Spec R, n) ≅ K` and `(0, ε) ↦ ε/(1 − q^(−n))`; taking `[ε]` itself, without the factor `(1 − q^(−n))⁻¹`, is the wrong normalization and changes every regulator value in L3.Fb.5 by `1 − q^(−n)`.
- Iterating twice in weight `n` sends `(ω,ε)` to `(ω,(1 + T)ε)` and then to `(ω,(1 + T²)(1 + T)ε)`; this equals the fourth-iterate transition. On `Spec R`, division by `1 − q^(−mn)` cancels `S_m(q^(−n))`, preserving `ε/(1 − q^(−n))`.
- The excluded weight: for `n = 0` and `φ* =` id the map `1 − φ*/q⁰` is zero on `H⁰_rig`, so no normalized identification exists; the hypothesis `n ≥ i ≥ 1` is necessary.
- Cone sign: with `d(a, b) = (da, f(a) − db)` the pair `(0, ε)` is a cocycle exactly when `dε = 0`. The complex with `d(a, b) = (da, −f(a) − db)` is isomorphic to it through `(a, b) ↦ (a, −b)`, and under that isomorphism the same formula `(0, ε) ↦ (1 − φ*/q^n)⁻¹[ε]` changes sign; every regulator value inherits the sign, so the convention is part of the definition. Merely changing the sign of `−db` to `+db` while leaving `−f(a)` produces `d²(a, b) = (0, −2f(da))`, which is not a differential in characteristic zero when `f(da) ≠ 0`.

### L3.Fb.2 The syntomic Chern character and its value in weight one

**Construction.** Besser's syntomic regulator is a family of Chern characters `c_(i,j)` : `K_j(X) → H̃^(2i−j)_ms(X, i)` on smooth `R`-schemes into the direct-limit theory of L3.Fb.1, compatible with the natural maps from the finer syntomic theories, and extended in BDJ Appendix A to the relative and multi-relative K-theory of the cubes of L3.Fa.2 and to the corresponding relative syntomic cohomology (BDJ §4, p. 891; Appendix A, Definitions A.1–A.4, pp. 911–913, and Proposition A.22, p. 922). The consumed properties are: the regulator of a cup product is the cup product of the regulators (BDJ p. 892); compatibility with pullback, with the boundary maps of localization sequences and with the relativity isomorphisms of L3.Fa.2 on both sides (BDJ Proposition 7.1, commutative up to a sign depending only on `n`); and the compatible-stage weight-one formula: for `f ∈ A^×` and a stage `(φ,q)` satisfying `ϕ* f̄ = f̄^q` the class of `f` in `K_1(X)` maps to the class of (dlog `f, log(f₀)/q`) in the description (4.4) of `H¹(C_(φ,q)(X,1))`, representing its image in `H̃¹_ms(X,1)`, where `f₀ = f^q/φ*f ≡ 1` modulo the maximal ideal, so that `log(f₀)` is analytic on some `U_λ` (BDJ Lemma 4.7, p. 892). For `n ≥ 2, X = Spec R` and `K_(2n−1)^(n)(R)`, the regulator lands in `H̃¹_ms(Spec R, n) ≅ K` by L3.Fb.1, giving reg : `K_(2n−1)^(n)(R) → K` (BDJ §1, p. 868).

- `syntomicRegulator`: `c_(i,j)` and reg : `K_(2n−1)^(n)(R) → K`.
- `syntomicRegulator_weightOne`: Lemma 4.7 at a stage with `ϕ* f̄ = f̄^q`; every unit has such an iterate, and the resulting direct-limit class is independent of that choice. For `m ≥ 1`, writing `f₀ = f^q/φ*f`, telescoping gives `f^(q^m)/((φ^m)*f) = ∏_(j=0)^(m−1) ((φ^j)*f₀)^(q^(m−1−j))`. All factors reduce to 1, so the logarithm law gives `log(f^(q^m)/((φ^m)*f))/q^m = Σ_(j=0)^(m−1) (φ^j)*log(f₀)/q^(j+1) = S_m(φ*/q)(log(f₀)/q)`, the required transition of the second component.
- `syntomicRegulator_cup`: multiplicativity after moving all factors to a common compatible stage, with the transition compatibility of L3.Fb.1.
- `syntomicRegulator_relative`: the relative direct-limit version on `K_n^(n)(X^(n−1)_(R,loc); □^(n−1))` and its compatibility with the relativity isomorphisms, up to a sign depending only on `n`.
- `syntomicRegulator_baseChange`: compatibility with finite extensions `R → R'` (as in L3.Fb.1).
- `syntomicRegulator_galois`: for an automorphism `σ` of `K` over the fraction field of a subring over which everything is defined, reg ∘ `σ_* = σ` ∘ reg (BBdJR Lemma 2.15 and its proof, pp. 7–8).

*Needs:* L3.Fa.1, L3.Fa.2, L3.Fb.1, L0.10, L0.15.

**Checks.**

- Weight one on `Spec R` with `φ* =` id on `R`: choose an iterate with `f̄^q = f̄`; then for `f ∈ R^×, f₀ = f^(q−1)`, the class `(0, log(f^(q−1))/q)` maps under Definition 4.6 to `(1 − 1/q)⁻¹ (q − 1)/q · log f = log f`. So the weight-one regulator of a unit is its logarithm, independently of the branch (`f` is a unit); a formula without the normalization of L3.Fb.1 would give `(1 − 1/q) log f`.
- For `f = 1` the regulator is 0, and for `f` a root of unity of order prime to `p` the regulator is `log f = 0`.
- For `p = 2, R = W(𝔽₄) = ℤ₂[a]` with `a³ = 1 ≠ a`, take `X = Spec R[t,(t²+t+1)⁻¹]`, compactification `ℙ¹_R`, and `φ(t) = t², q = 2`. The unit `f = t − a` has `f₀ = (t−a)²/(t²−a)` with reduction `((t−ā)/(t−ā²))² ≠ 1`. The differential `(1 − φ*/2)dlog f` has residues `+1` and `−1` at the ends over `ā` and `ā²`; it has no dagger primitive. At the iterate `φ²(t) = t⁴, q = 4`, the reduction is compatible and `log((t−a)⁴/(t⁴−a))/4` supplies the second component.
- Multiplicativity: at a common stage compatible with both reductions, `reg(f ∪ g)` for `f, g ∈ A^×` is the cup product (4.8) of (dlog `f, log(f₀)/q`) and (dlog `g, log(g₀)/q`); on `Spec R` both forms dlog vanish and the cup product of two weight-one classes is zero in `H̃²_ms(Spec R, 2) = 0`, matching `K_2^(2)(R) → H̃²_ms` having zero target.

### L3.Fb.3 Relative rigid complexes of cubes and the integration functional

**Definition.** Let `κ` have characteristic `p, X_n = (ℙ¹_κ ∖ {t = 1})^n, B` an affine `κ`-variety and `Y ⊆ X_n × B` an open affine subset, with □`^n` the locus where some coordinate is 0 or `∞`. For `0 ≤ j ≤ n` and strictly increasing `f` : `[1, j] → [1, n]` let `Y_f` be the subspace of `Y` where `x_i ∈ {0, ∞}` for `i ∉ im f`, of codimension deg `f = n − j`, with its system of rigid neighbourhoods `U^Y_f`. The complex `Ω•(U^Y; □^n)` has `⊕_`(`i +` deg `f = k`) `Ωⁱ(U^Y_f)` in degree `k` and differential `d(ω, f) = (dω, f) − (−1)^(deg ω) Σ_g χ(f, g)(ω|_(U^Y_g), g)`, where `χ(f, g) = (−1)^(f(r)+r)` if `im f = im g` ⊔ `{f(r)}` and 0 otherwise; `F^j Ω•(U^Y; □^n)` keeps the summands with `i ≥ j` (BDJ (5.1) and Definition 5.2, pp. 894–895). It computes multi-relative rigid cohomology (BDJ Lemma 5.4, p. 895). On the full cube, `H^n_dR(U^n; □^n) ≅ K` by a unique isomorphism `Π` that on a closed form `(ω, f)` with deg `f = 0` is the iterated integral of `ω` from 0 to `∞` in each coordinate, and on a form `(η, g)` of degree `m` with `i` of its fixed coordinates set to `∞` is `(−1)^(i + Σ_k (g(k) + k))` times the iterated integral (BDJ Lemma 5.5, p. 896). The relativity isomorphism `K = H⁰_rig(pt) → H¹_rig(X_1; □¹) → ⋯ → H^n_rig(X_n; □^n)`, built from boundary maps choosing at each stage the embedding `t_i = 0`, composes with `Π` to the identity (BDJ (5.6), p. 897, and Proposition 5.7, p. 898).

- `cubeRigidComplex`: `Ω•(U^Y; □^n)` with its filtration `F^j`.
- `cubeRigidComplex.d_sq`: `d² = 0` with the stated signs `χ(f, g)`.
- `cubeRigidComplex.Pi`: the functional `Π` : `H^n_dR(U^n; □^n) → K` and its sign formula.
- `cubeRigidComplex.Pi_relativity`: `Π` ∘ (5.6) `=` id when the embeddings `t_i = 0` are chosen; each switch to `t_i = ∞` changes the sign.
- `cubeRigidComplex.weights`: for `B = Spec κ` and `Y ⊆ X_n` obtained by removing finitely many divisors `t_j = u` with `u ∈ κ^× ∖ {1}`, `0 → H^n_rig(X_n; □^n) → H^n_rig(Y; Y ∩ □^n) → E → 0` is exact with Frobenius trivial on the first term and of strictly positive weights on `E` (BDJ Lemma 5.8, p. 898).

*Needs:* L3.Fb.1, PadicDifferentialEquationsAndRigidCohomology RD.4–RD.6 (rigid cohomology with supports, relative cohomology and weights), L0.12.

**Checks.**

- `n = 1, Y = X_1`: the complex is `O(U) → Ω¹(U) ⊕ K_0 ⊕ K_∞` (BDJ Remark 5.3, p. 895), `H¹` is one-dimensional, and `Π` sends the class of (`ω`, id) to `∫_0^∞ ω`; for `ω = dt/(t − 1)² = d(−1/(t − 1))` the value is `0 − 1 = −1` (the `primitive −1/(t − 1)` is 1 at `t = 0` and 0 at `t = ∞`).
- Non-example: for `n = 1` and `Y = ℙ¹ ∖ {1, ∞}`, restriction from the trivial Frobenius line `H¹_rig(X_1; {0, ∞})` to `H¹_rig(Y; {0}) ≅ H¹_rig(𝔾_m)` is zero: the target has Frobenius `q`. Removing the boundary divisor `∞` is outside the weight-sequence hypotheses.
- The two embeddings `t_n = 0` and `t_n = ∞` give relativity isomorphisms differing by `−1` (BDJ p. 897), so `Π` ∘ (5.6) is `−`id for a single switch: a check that fixes the sign convention used in L3.15.
- For `n = 2` the sign `χ(f, g)` for `f = id_[1,2]` and `g` : `[1] → [2], 1 ↦ 2`, is `(−1)^(f(1)+1) = 1` (removing `f(1) = 1` at `r = 1`), and for `g` : `1 ↦ 1` it is `(−1)^(2+2) = 1`; without the factor `(−1)^(deg ω)` the differential fails `d² = 0` already on functions when `n = 2`, since the two restriction terms of `dF` then add instead of cancelling.

### L3.Fb.4 Coleman integration extends the functional to localized cubes

**Theorem.** Let `Y` be obtained from `X_n` by removing finitely many divisors `t_j = u` with `u ∈ κ^× ∖ {1}`, so that the iterated integrals defining `Π` need not exist. (a) For every Frobenius-stable subspace `M ⊆ H^n_rig(Y; Y ∩ □^n)` containing `H^n_rig(X_n; □^n)` there is a unique Frobenius-invariant `K`-linear functional `Π̃_M` on `M` extending `Π` (BDJ Corollary 5.9, p. 899). (b) A relative form is *Coleman integrable* if each of its components `(ω, f)` can be iterated-integrated from 0 to `∞` with Coleman integrals in place of ordinary ones; these forms are a Frobenius-stable subspace containing the exact forms and the forms extending to `U^n`, and the resulting functional `Π_Col` is Frobenius invariant (BDJ Definition 5.11 and Lemma 5.12, p. 899). (c) Hence `Π_Col(x) = Π̃([x])` for every Coleman-integrable form `x` (BDJ Proposition 5.13, p. 900).

- `cubeRigidComplex.PiTilde`: the unique Frobenius-invariant extension of `Π`.
- `cubeRigidComplex.PiTilde_unique`: uniqueness on every Frobenius-stable `M ⊇ H^n_rig(X_n; □^n)`.
- `IsColemanIntegrable`: the predicate on relative forms.
- `cubeRigidComplex.PiCol_eq_PiTilde`: Proposition 5.13.
- `phiModule_projection_mul`: for `φ`-modules `V_i = K ⊕ E_i` with no `φ`-invariants on `E_i` and on `E_1 ⊗ E_2, a φ`-equivariant pairing restricting to multiplication on `K ⊗ K` satisfies `Π_3⟨x_1, x_2⟩ = Π_1(x_1)Π_2(x_2)` (BDJ Lemma 5.10, p. 899).

*Needs:* L3.Fb.3, L1.19, L1.20, L1.22, L2.5.

**Checks.**

- `n = 1` and `Y = ℙ¹ ∖ {1, u}`: the form `dt/(t − u) − dt/(t − 1)` is Coleman integrable, and `Π_Col` of it is `log((∞ − u)/(∞ − 1)) − log((0 − u)/(0 − 1)) = 0 − log(u) = −log u`, branch independent since `u` is a unit; this is the weight-one shadow of L3.Fb.5.
- Frobenius invariance: replacing a Coleman-integrable form `x` by `φ*x` leaves `Π_Col` unchanged because `0^q = 0` and `∞^q = ∞` (BDJ Lemma 5.12, p. 900); using an endpoint not fixed by Frobenius can break invariance. For `q = 3` and `G(t) = −1/(t − 1)`, the endpoint functional `∫_0^2 dG` gives `−2`, whereas `∫_0^2 φ*dG = G(8) − G(0) = −8/7` for `φ(t) = t³`. Other Frobenius-fixed endpoints are not excluded by this test.
- On `H^n_rig(X_n; □^n)` itself, `Π̃ = Π`, so on forms extending to `U^n` the Coleman and ordinary iterated integrals agree.

### L3.Fb.5 The regulator of special symbols by integration down

**Theorem.** For `n ≥ 2` let `L_n(z) = Σ_(m=0)^(n−1) ((−1)^m/m!) Li_(n−m)(z) log^m(z)`, with Coleman's polylogarithms and a fixed branch (BDJ (1.3), p. 869). (a) The composite of the relative direct-limit syntomic regulator of L3.Fb.2 on `K_n^(n)(X^(n−1)_(R,loc); □^(n−1))`, the normalized identification of L3.Fb.1 and the functional `Π̃` of L3.Fb.4 is a map `ℛ` to `K`. It vanishes on `(1 + I)^* ∪̃ Symb_(n−1)(R)`, hence descends to `M_n(R)`. If `loc` is localization from the unlocalized relative cube and `ε_n ∈ {1, −1}` is the comparison sign, its compatibility with the base regulator is `ℛ ∘ loc = ε_n · (reg ∘ relativityIso)` (BDJ Propositions 7.1 and 7.2, pp. 903–904). The comparison square is

```text
K_n^(n)(X_R^(n−1); □^(n−1))  --loc-->  K_n^(n)(X_(R,loc)^(n−1); □^(n−1))
           | relativityIso                                | ℛ
           v                                              v
     K_(2n−1)^(n)(R)              --reg-->                 K
```

and commutes up to `ε_n`. (b) For `z ∈ R^♭, ℛ([z]_n) = (−1)^n (n − 1)! L_n(z)` (BDJ Proposition 7.10, p. 908). (c) Consequently, for a field `F` of characteristic zero with no low weight K-theory, a discrete valuation ring `O ⊂ F` and an embedding `σ` : `F → K` with `σ(O) ⊆ R`, the composite `H¹(M•(n)(O)) → K_(2n−1)^(n)(O) → K_(2n−1)^(n)(R) → K` is induced by `[x]_n ↦ (−1)^n (n − 1)! L_n(σ(x))` (BDJ Proposition 7.14, p. 909), and on this unreduced `H¹` the functions `L_n, L^mod_n` and `Li_n` induce the same map, because they differ by multiples of `log^k(z)L_(n−k)(z), k ≥ 1`, which factor through the `k`-fold differential (BDJ proof of Theorems 1.6 and 1.10, p. 909). On reduced `H¹`, use `L^mod_n`, which respects inversion, and the cohomology isomorphism under the reduced hypotheses of L3.Fa.4; these are unconditional when `F` is a number field. The sign is `(−1)^n` when the relativity isomorphisms are normalized as in L3.Fa.2 and L3.Fb.3 (BBdJR Remark 4.16, p. 21).

- `integrationDown`: the map `ℛ` on `K_n^(n)(X^(n−1)_(R,loc); □^(n−1))`.
- `integrationDown_cupPart`: `ℛ` vanishes on `(1 + I)^* ∪̃ Symb_(n−1)(R)`.
- `integrationDown_symbol`: `ℛ([z]_n) = (−1)^n (n − 1)! L_n(z)` for `z ∈ R^♭`.
- `regulator_deJeuSymbol`: Proposition 7.14.
- `regulator_H1_eq_Lmod`: on `H¹(M•(n)(O))` under the unreduced hypotheses, `[x]_n ↦ (−1)^n (n − 1)! L^mod_n(σ(x))` gives the same map as `L_n`; transport to reduced `H¹` uses the reduced comparison hypotheses of L3.Fa.4.

*Needs:* L3.Fa.3, L3.Fa.4, L3.Fb.1, L3.Fb.2, L3.Fb.4, L2.5, L2.8, L2.10, L3.14.

**Checks.**

- `n = 2`: `L_2(z) = Li_2(z) − Li_1(z) log z`, and `L^mod_2(z) = Li_2(z) − (1/2) log(z) Li_1(z)`; their difference is `(1/2) log(1 − z) log z`. It factors through the unreduced differential `(1 − z) ⊗ z` by the symmetric pairing `a ⊗ b ↦ (1/2) log(a) log(b)`, so it vanishes on `H¹(M•(2))`. This pairing does not factor through the alternating exterior square: on `ℂ₃, 4 ⊗ 4` maps to `(log 4)²/2 ≠ 0`, while `4 ∧ 4 = 0`. Comparisons on `M̃` therefore use the `H¹`-isomorphism from `M`, rather than a termwise descent of this pairing.
- For `n = 2`, `relativityIso` takes `K_2^(2)(X_R; □¹)` to `K_3^(2)(R)`. Thus `reg ∘ relativityIso` has the same domain as `ℛ ∘ loc`; composing `reg` with the inverse relativity map does not have that domain. The localized relative group itself is not identified with `K_3^(2)(R)` by relativity.
- At a root of unity `ζ` of order prime to `p` (a special unit), `log ζ = 0` and `ℛ([ζ]_n) = (−1)^n (n − 1)! Li_n(ζ)`.
- Distribution: the difference `E_n(z)` of the two sides of (b) is constant on residue discs and satisfies `(1/m)Σ_(ζ^m=1) E_n(ζz) = E_n(z^m)/m^n`; with `m = p` on the residue disc of a special unit this forces the constant to vanish (BDJ proof of Proposition 7.10, p. 908). A putative formula with a nonzero additive constant fails this check.

### L3.Fb.6 The Gros regulator

**Comparison.** For `F` a number field unramified at `p, R = W(κ)` with fraction field `K` and Frob the arithmetic Frobenius of `K`, the Gros regulator is `reg^Gros = (1 − Frob/p^n)` ∘ reg on `K_(2n−1)^(n)(R)`, and for `ζ` a root of unity of order prime to `p, reg^Gros([ζ]_n) = (−1)^n (n − 1)!(Li_n(σζ) − p^(−n) Li_n(σζ^p))`; Galois equivariance gives `Frob(Li_n(ζ)) = Li_n(Frob ζ) = Li_n(ζ^p)` (BDJ Remark 1.13, p. 872).

- `grosRegulator`: `(1 − Frob/p^n)` ∘ reg, defined only when `K/ℚ_p` is unramified.
- `grosRegulator_cyclotomic`: the formula above.

*Needs:* L3.Fb.5, L2.17, L2.15.

**Checks.**

- For `ζ` of order prime to `p` and `n ≥ 2, reg^Gros([ζ]_n)` equals `(−1)^n (n − 1)!` times the value at `σζ` of the modified polylogarithm `Li_n^(p)` of L2.13, whose expansion at 0 is `Σ_(p∤k) z^k/k^n`.
- The Gros regulator is not defined when `K/ℚ_p` is ramified; the formula of L3.15 for `ζ` of `p`-power order uses reg, not `reg^Gros`.
- `1 − Frob/p^n` is a bijection of `K`: it equals `−p^(−n)Frob(1 − p^n Frob⁻¹)`, and the geometric series in `p^n Frob⁻¹` converges because Frob is an isometry. So `reg^Gros` and reg have the same kernel.

### L3.Fc.1 Regulator pairings, discriminant determinants and regulator determinants

**Definition.** Let `n ≥ 2, k/ℚ` be finite Galois with group `G, E` a number field and `π ∈ E[G]` an idempotent; put `M^E_π = π(E ⊗ k)` and `K_(2n−1)(M^E_π) = πK_(2n−1)(k)_E` (BBdJR Definition 3.1, p. 10). Fix `φ_∞` : `k → ℂ` and `φ_p` : `k → ℚ̄_p`, and let `F ⊂ ℚ̄_p` be the closure of `φ_p(k)`. The pairings `(σ, a) ↦ φ_*(σa)` give `E`-bilinear pairings `(·,·)_∞` : `E[G]π × M^E_π → E ⊗ ℂ` and `(·,·)_p` : `E[G]π × M^E_π → E ⊗ F`. With `Φ_∞ = reg_∞` ∘ `(φ_∞)_*` the Beilinson regulator of `K_(2n−1)(k)_ℚ → K_(2n−1)(ℂ)_ℚ → ℝ(n − 1) ⊂ ℂ` and `Φ_p =` reg ∘ `(φ_p)_*` the syntomic regulator of L3.Fb.2 through `K_(2n−1)(k)_ℚ ≅ K_(2n−1)(O_k)_ℚ → K_(2n−1)(O_F)_ℚ → F`, the pairings `(σ, α) ↦ Φ_*(σα)` give `[·,·]_∞` and `[·,·]_p` on `E[G]π × K_(2n−1)(M^E_π)` (BBdJR (3.2), (3.4), pp. 10–11). After fixing ordered `E`-bases, `D(M^E_π)^(1/2)_*` is the determinant of `(·,·)_*` and, when `dim_E E[G]π = dim_E K_(2n−1)(M^E_π), R_(n,*)(M^E_π)` is the determinant of `[·,·]_*` (BBdJR Definitions 3.5–3.6, pp. 10–11). Construct the complex regulator `reg_∞` with these pairings and prove Borel's theorem: the image of the integral group `K_(2n−1)(k)` modulo torsion under (`Φ_∞` ∘ `σ`)`_σ` is a full lattice in `{(a_σ) ∈ ⊕_σ ℝ(n − 1) : a_(σ̄) = overline(a_σ)}`, the invariant space for the simultaneous action on embeddings and values, and the rational regulator is injective with image the `ℚ`-span of that lattice. The image of the rational `K`-group itself is not asserted to be a lattice (BBdJR Theorem 2.2, p. 5).

- `regulatorPairing`: `[·,·]_∞` and `[·,·]_p`.
- `periodPairing`: `(·,·)_∞` and `(·,·)_p`.
- `discriminantDet`, `regulatorDet`: `D^(1/2)_*` and `R_(n,*)`.
- `discriminantDet_ne_zero`: every component of `D^(1/2)_*` is nonzero, so it is a unit in the coefficient algebra; this also gives `dim_E M^E_π = dim_E E[G]π` (BBdJR Lemma 3.3, p. 10).
- `regulatorDet_div_discriminantDet_indep`: `R_(n,*)/D^(1/2)_*` is independent of the basis of `E[G]π` and of `φ_*`, and lies in `E ⊗ ℝ`, respectively `E ⊗ ℚ_p` (BBdJR Lemma 3.7, p. 11).
- `regulatorPairing_componentwise`: an identity in `E ⊗ ℂ` (or `E ⊗ ℚ̄_p`) holds if and only if it holds after every embedding `E → ℂ` (or `E → ℚ̄_p`) (BBdJR Remark 3.19(2), p. 14).

*Needs:* L3.Fa.1 for the `K`-group construction (its number-field vanishing is a consequence here), L3.Fb.2; L3.Fc.2 only for the subsequent criterion for dimension equality, not for constructing the pairings and proving Borel's theorem; Mathlib `Matrix.det`, `MonoidAlgebra`, `TensorProduct`.

**Checks.**

- `k = ℚ, G` trivial, `π = 1, E = ℚ`: `(·,·)_∞` is the `1 × 1` pairing `1 × (1 ⊗ 1) ↦ 1`, so `D^(1/2)_∞ = 1` for the basis `1 ⊗ 1`.
- For `k = ℚ` the regulator target is zero when `n = 2` and a real line when `n = 3`: the unique embedding is real, so `a = overline(a)` forces an imaginary value to vanish. For `n = 3` the image of `K₅(ℚ)/`torsion is a lattice, while the image of `K₅(ℚ)_ℚ` is its dense rational span; the latter is not a lattice. For one pair of complex embeddings, `a_(σ̄) = overline(a_σ)` leaves one real coordinate in either parity.
- Changing the basis of `E[G]π` by a matrix A multiplies both `D^(1/2)_*` and `R_(n,*)` by `det A`, so their quotient is unchanged (BBdJR Lemma 3.7); a definition normalizing only one of them fails this. Nonzero and invertible must be distinguished in the coefficient algebra: `(1, 0) ≠ 0` in `ℂ × ℂ` but is not a unit, so one nonzero component cannot justify dividing by `D^(1/2)_*`.
- `k = ℚ(i), π = (1 + c)/2, n = 2`: `dim_E E[G]π = 1` but `πK_3(ℚ(i))_E = K_3(ℚ)_E = 0`, so `R_(2,*)` is not defined; any definition producing a value here is wrong.

### L3.Fc.2 The rank criterion for an idempotent

**Theorem.** For `k/ℚ` finite Galois with group `G, E` any extension of `ℚ, π` an idempotent of `E[G]` and `n ≥ 2`: `dim_E πK_(2n−1)(k)_E ≤ dim_E E[G]π`, with equality exactly when every element of `G` in the image of the conjugacy class of complex conjugation acts on `E[G]π` by `(−1)^(n−1)` (BBdJR Proposition 3.8, p. 11). Equivalently, with `k'` the fixed field of the kernel of the representation of `G` on `E[G]π` and `π ≠ 0`, equality holds exactly when `k'` is totally real and `n` is odd, or `k'` is CM, `n` is even and the complex conjugation of `k'` acts on `E[G]π` by `−1` (BBdJR Proposition 3.10, p. 12, and Proposition 3.12, p. 12). For `π = 0` both sides are zero.

- `rank_isotypic_le`: the inequality.
- `rank_isotypic_eq_iff_conj`: equality iff complex conjugation acts by `(−1)^(n−1)`.
- `rank_isotypic_eq_iff_kernelField`: the totally real `/` CM form, for `π ≠ 0`.
- `rank_isotypic_additive`: both dimensions add over orthogonal idempotents and are unchanged under conjugation of `π` (BBdJR Remark 3.14(2), p. 12).

*Needs:* L3.Fc.1, L3.Fa.1 (Borel's theorem as consumed there), Mathlib `IsCMField` where available, otherwise the definition of a CM field as a totally imaginary quadratic extension of a totally real field.

**Checks.**

- `k` totally real, `n` even, `π ≠ 0`: complex conjugation is trivial, acts by `1 ≠ (−1)^(n−1) = −1`, so the inequality is strict and `πK_(2n−1)(k)_E = 0` while `E[G]π ≠ 0`.
- `k = ℚ(μ_N), χ` a character of `(ℤ/N)^×, π` its idempotent: equality holds iff `χ(−1) = (−1)^(n−1)`; for `N = 5, χ` of order 4 has `χ(−1) = −1` and works exactly for `n` even.
- `π = 0`: both dimensions are 0, so equality holds for every `n`. The kernel of the zero representation is all of `G`, so `k' = ℚ`, which is totally real and not CM; for `n` even the characterization through `k'` would wrongly deny equality. It is stated for `π ≠ 0` only.

### L3.Fc.3 Zagier's single-valued polylogarithms and the cyclotomic determinants

**Theorem.** Let `L_n = singleValued n` be the real single-valued family supplied by PolylogarithmFunctions §§4.2–4.7. For `n ≥ 2` and every `z ∈ ℂ`, its BBdJR adapter is `zagierPolylog n z = (L_n(z) : ℂ)` for odd `n` and `zagierPolylog n z = i · L_n(z)` for even `n`. Thus `P_n = zagierPolylog n` takes values in the line `ℝ(n − 1)`. For `z ∉ {0, 1}` its comparison equation is `P_n(z) = π_(n−1)(Σ_(j=0)^(n−1) (b_j/j!)(2 log|z|)^j Li_(n−j)(z))`, with principal complex polylogarithms supplied on their full domain, `b_j = bernoulli j`, `b₁ = −1/2`, and `π_(n−1)` the projection onto `ℝ(n − 1)`. Branch independence, real analyticity, sphere continuity, inversion, conjugation and distribution are supplied by §§4.3–4.7 and transported through this conversion: `P_n(z̄) = overline(P_n(z)) = (−1)^(n−1)P_n(z)`, `P_n(z) + (−1)^n P_n(1/z) = 0` for `z ≠ 0`, and `P_n(z^m) = m^(n−1) Σ_(ζ^m=1) P_n(ζz)` for `m ≥ 1, z^m ≠ 1`. At weight one set `P_1(z) = −log|1 − z|` for `z ≠ 1`; its conjugation and distribution laws follow from the logarithm of the norm, and no weight-one inversion law is asserted (BBdJR (4.2)–(4.4), pp. 17–18). For `n ≥ 2` the complex regulator of the cyclotomic element is `Φ_∞([ζ]_n) = (−1)^n (n − 1)! P_n(φ_∞ ζ)` in the raw-symbol convention of L3.Fb.5 (BBdJR Theorem 4.7, p. 19, and Remark 4.16, p. 21). For `k = ℚ(μ_N), N > 2, χ` primitive of conductor `N` with `χ(−1) = (−1)^(n−1)`, its idempotent `π = |G|⁻¹ Σ'_a χ⁻¹(a) ⊗ ψ_a` and the bases `π, π(1 ⊗ ζ), π(1 ⊗ [ζ]_n)`: writing `η = φ_∞(ζ)`, for every embedding `σ` : `E → ℂ` the `σ`-components are `D^(1/2)_(∞,σ) = |G|⁻¹ Σ'_a χ_σ⁻¹(a) η^a = N|G|⁻¹ (Σ'_a χ_σ(a) η^(−a))⁻¹` and `R_(n,∞,σ) = (−1)^n (n − 1)! |G|⁻¹ Σ'_a χ_σ⁻¹(a) Li_n(η^a)`; the p-adic components are `D^(1/2)_(p,τ) = N|G|⁻¹(Σ'_a χ_τ(a) η_p^(−a))⁻¹` and `R_(n,p,τ) = (−1)^n (n − 1)! |G|⁻¹ Σ'_a χ_τ⁻¹(a) L^mod_n(η_p^a)` with `η_p = φ_p(ζ)` (BBdJR proof of Proposition 4.17, p. 22).

- `zagierPolylog`: the displayed parity-dependent conversion of `singleValued` for `n ≥ 2` and the stated logarithmic adapter for `n = 1, z ≠ 1`.
- `zagierPolylog_inv` `(n ≥ 2)`, `zagierPolylog_distribution` `(n ≥ 1, m ≥ 1, z^m ≠ 1)`, `zagierPolylog_conj` `(n ≥ 1)`: the supplied relations through the conversion for `n ≥ 2`, and the logarithm laws at weight one.
- `zagierPolylog_rootOfUnity`: for a root of unity `η ≠ 1` and `χ(−1) = (−1)^(n−1), Σ'_a χ⁻¹(a) P_n(η^a) = Σ'_a χ⁻¹(a) Li_n(η^a)`, using `P_n(η^a) = (Li_n(η^a) + χ⁻¹(−1)Li_n(η^(−a)))/2`.
- `cyclotomicDiscriminantDet`: the displayed complex and p-adic components, given by the Gauss-sum calculation.
- `cyclotomicRegulatorDet`: the displayed complex components from the complex regulator formula; the p-adic components from L3.15 for every primitive conductor `N`, including `N = p^r`. L3.Fb.5 applies directly only to special units. The complex calculation, together with Borel's theorem and L3.13, proves the spanning and independence assertions of L3.Fa.5; the p-adic calculation consumes the general cyclotomic regulator formula of L3.15 (BDJ proof of Theorem 1.12, p. 910).

*Needs:* PolylogarithmFunctions §§4.2–4.7 for the single-valued analytic family and its relations. For the complex regulator and determinant calculation: L3.Fc.1, the construction of L3.Fa.5, L2.Fa, L3.13, Mathlib `bernoulli`, `gaussSum`, `Complex.log`. For the p-adic calculation: the Gauss-sum calculation, L3.14 and L3.15. L3.15 uses only the construction and distribution of L3.Fa.5, not its spanning or basis theorem.

**Checks.**

- `n = 2`: the conversion gives `P_2(2) = i · L_2(2) = −P_2(1/2) = 0`. Substituting the unconditional series value `Σ'_(m≥1) 2^m/m² = 0` for the principal `Li_2(2)` in the Bernoulli expression would give the incorrect value `πi log 2`; the closed-disc adapter has no analytic contract at 2.
- `n = 2, |z| = 1`: `P_2(z)` is `i` times the imaginary part of `Li_2(z)` (the term with `2 log|z|` vanishes), the Bloch–Wigner function on the unit circle; at `z = −1` it vanishes because `Li_2(−1) = −π²/12` is real, consistent with `K_3(ℚ)_ℚ = 0`.
- `n = 1`: `P_1(z) = −log|1 − z|`, so `P_1(2) = 0` while `P_1(1/2) = log 2`. The inversion relation is restricted to `n ≥ 2`; the weight-one definition and its conjugation and distribution laws still apply.
- `n = 2, z = i`: `P_2(i) = i Σ_(r≥0)(−1)^r/`(2r`+1`)² is nonzero, while `P_2(−i) = −P_2(i)`. Thus conjugation negates the value in the imaginary line `ℝ(1)`; the equality `P_2(z̄) = P_2(z)` fails. For `n = 3` the values lie in `ℝ(2) = ℝ` and conjugation preserves them.
- `n = 3, N = 2`: `Φ_∞([−1]_3) = −2P_3(−1) = (3/2)ζ(3)`, so the complex comparison coefficient for the basis `[−1]_3` is `2/3`. Omitting the raw-symbol sign would give `−2/3`; the p-adic regulator must use the same choice.
- `N = 2`, odd `n ≥ 3`: `P_n(−1) = (2^(1−n) − 1)ζ(n) ≠ 0`, and `L(n, 1, ℚ) = ζ(n) = 2^(n−1)(1 − 2^(n−1))⁻¹ P_n(−1)` (BBdJR proof of Proposition 4.17, p. 22).
- The Gauss-sum identity behind the two forms of `D^(1/2)_(∞,σ)`: for `χ` primitive of conductor `N, Σ'_a χ⁻¹(a) η^a · Σ'_b χ(b) η^(−b) = N`; a normalization with `|G|` in place of `N` in the second form fails it.
- For `p = N = 3` and a primitive cube root `ζ₃`, `|ζ₃|₃ = 1` but `|1 − ζ₃|₃ = 3^(−1/2) < 1`. The p-adic component therefore uses L3.15. Taking `r = 4` in its distribution argument expresses `(1 − 4^(n−1))[ζ₃]_n` as `4^(n−1) Σ_(α⁴=1, α≠1) [ζ₃α]_n`, whose terms are special units over a finite extension.

### L3.Fd.1 Artin L-functions with coefficients

**Construction.** Let `k` be a number field, `E` a number field and `ψ` a representation of `Gal(k̄/k)` on a finite-dimensional `E`-vector space `V` factoring through a finite quotient, with character `χ_ψ`. For every embedding `σ` : `E → ℂ, σ(ψ)` is a complex Artin representation with Artin `L`-function `L(s, σ(ψ), k)` and reciprocal Euler factors `Eul_𝔓(s, σ(ψ), k)`, computed on inertia invariants. Under `E ⊗ ℂ ≅ ⊕_σ ℂ` these assemble to the `E ⊗ ℂ`-valued `L(s, ψ ⊗ id, k)` and `Eul_𝔓(s, ψ ⊗ id, k)` (BBdJR §3, p. 13). For a prime `ℓ, Eul_ℓ = ∏_(𝔓|ℓ) Eul_𝔓` (BBdJR §2, p. 5). The complex theory (local factors on inertia invariants, induction, Euler product for `Re s > 1`, meromorphic continuation) is imported; the work here is the coefficient assembly and its independence of choices.

- `artinLWithCoeff`: `L(s, ψ ⊗ id, k) ∈ E ⊗ ℂ` for `Re s > 1`, and its continuation.
- `artinLWithCoeff_component`: the `σ`-component is `L(s, σ(ψ), k)`.
- `artinLWithCoeff_directSum`: `L(s, (ψ₁ ⊕ ψ₂) ⊗ id, k) = L(s, ψ₁ ⊗ id, k) L(s, ψ₂ ⊗ id, k)`.
- `artinLWithCoeff_coeffExt`: for `E ⊂ E'`, the image in `E' ⊗ ℂ` of `L(s, ψ ⊗ id, k)` is `L(s, (E' ⊗_E ψ) ⊗ id, k)`.
- `artinLWithCoeff_induction`: `L(s, Ind_k^ℚ ψ ⊗ id, ℚ) = L(s, ψ ⊗ id, k)`.
- `eulerFactorWithCoeff`: `Eul_𝔓` and `Eul_ℓ` with values in `E ⊗ ℂ`.
- `artinLWithCoeff_dirichlet`: for `k = ℚ` and `ψ` one-dimensional of finite order, the `σ`-component equals Mathlib's `DirichletCharacter.LFunction` of the primitive Dirichlet character attached to `σ` ∘ `χ_ψ`.

*Needs:* TauCetiRoadmap AdelicAlgebraicGroups AA.2.4 (finite-image Artin factors on inertia invariants, their induction formula and the global Euler product), Mathlib `DirichletCharacter.LFunction`, `Algebra.TensorProduct`, Mathlib `FiniteDimensional`.

**Checks.**

- `E = ℚ`: `E ⊗ ℂ = ℂ` and `L(s, ψ ⊗ id, k)` is the ordinary Artin `L`-function of the rational character.
- Degree one over `ℚ`: for `χ = χ_(−4)` and `E = ℚ, L(1, χ ⊗ id, ℚ) = π/4`.
- Direct sums: for `ψ = 1 ⊕ χ_(−4)` over `ℚ, L(s, ψ ⊗ id, ℚ) = ζ(s)L(s, χ_(−4)) = ζ_(ℚ(i))(s)`; a definition that adds instead of multiplying fails this.

### L3.Fd.2 p-adic Artin L-functions of totally real fields

The one-dimensional arithmetic input consists of the following three targets, owned here for every totally real number field. They use the ray-class and reciprocity carriers of GlobalNumberFields and ClassFieldTheory and the generic bounded-measure carrier of PadicMeasuresIwasawaAlgebras; their partial-zeta rationality and arithmetic congruences are additional theorems here.

#### (a) Ray classes and rational partial-zeta values

**Construction.** Let `k` be totally real of degree `d`, `p` prime, `q = p` for odd `p` and `q = 4` for `p = 2`, and `χ` a finite-order one-dimensional p-adic Galois character. Use arithmetic reciprocity to identify `χ` with its finite-order Hecke character, with `χ(𝔭) = χ(Frob_𝔭)` at unramified primes. Let `g` have all real places as infinite part and finite part `lcm(cond χ, qO_k)`. For each ray class `c` modulo `g` define `ζ_c(s) = Σ_[𝔞]=c N(𝔞)^(−s)` on `Re s > 1`, summing over nonzero integral ideals prime to `g`. Construct its meromorphic continuation and prove `ζ_c(m) ∈ ℚ` for every integer `m ≤ 0`. Character Fourier inversion of the finite-order Hecke functions gives the continuation; rationality of the partial-zeta values is the arithmetic theorem required here. Prove `Σ_c χ(c) ζ_c(m) = Eul*_p(m,χ,k)L*(m,χ,k)`, independently of the isomorphism transporting complex algebraic values to p-adic ones (BBdJR §6, (6.1), p. 27, with its reference to Siegel rationality, Neukirch VII, Corollary 9.9).

- `rayClassPartialZeta`: the partial-zeta functions with modulus, class and coprimality conventions above, including their character decomposition and modulus-change Euler factors.
- `rayClassPartialZeta_rational`: the rational values at `m ≤ 0`, compatible with the character decomposition (6.1).

*Needs:* GlobalNumberFields Layers 2 and 9 (ray classes and finite-order Hecke characters), ClassFieldTheory Layers 11–12 (arithmetic reciprocity and ray class fields), AdelicAlgebraicGroups §2.4 (the one-dimensional Artin–Hecke comparison and complex continuation), L3.Fd.1.

**Checks.**

- For `k = ℚ, g = (3)∞`, the two classes have `ζ_1(s) = 3^(−s)ζ(s,1/3)` and `ζ_2(s) = 3^(−s)ζ(s,2/3)`. Their values at 0 are `1/6` and `−1/6`, so rationality does not mean integrality.
- For the same modulus, `ζ_1(−1) = ζ_2(−1) = 1/12`; their sum is `(1 − 3)ζ(−1) = 1/6`, including the removed Euler factor.
- For `k = ℚ, χ = χ_(−4)`, enlarge the finite modulus to include `q`; values on ideals sharing a conductor prime are excluded. Using inverse arithmetic Frobenius instead changes the Hecke character to its inverse for characters of order greater than two.

#### (b) Smoothed congruences and the bounded partial-zeta measure

**Theorem.** Keep (a) and choose integral representatives `𝔞_c` prime to `g`. An admissible smoothing element is `β ∈ O_k`, totally positive, congruent to 1 modulo `g_0`, with `O_k/(β) ≅ ℤ/bℤ` and `b = N(β) > 1`. Such elements exist: degree-one primes splitting completely in the normal closure over `ℚ` of the ray class field give prime principal ideals in the trivial ray class; their ray generators have these properties. In particular `p ∤ b` and `b ≡ 1` modulo `q`. Put `U_q = 1 + qℤ_p`. For `n ≥ 0` define the rational smoothed moments

`M_(c,β)(n) = N(𝔞_c)^(−n) (b^(−n−1) − 1) ζ_c(−n)`.

Prove the arithmetic bounded-congruence theorem: there is `C_(c,β) > 0` such that, for every finite polynomial `P(Y) = Σ_n u_n Y^n` over `ℚ_p`,

`|Σ_n u_n M_(c,β)(n)|_p ≤ C_(c,β) sup_(y∈U_q) |P(y)|_p`.

Thus sufficiently divisible polynomial tests give correspondingly divisible moment combinations. Extend this bounded functional by polynomial density to the unique measure `ν_(c,β) ∈ AbstractMeasure U_q ℚ_p ℚ_p` with `∫ y^n dν_(c,β) = M_(c,β)(n)`. Use PadicMeasuresIwasawaAlgebras’ clopen restriction and bounded dual, extending by zero to `ℤ_p`; coefficient extensions use the same carrier. This is the scalar pushforward under `(x₁,…,x_d) ↦ x₁⋯x_d` of the measure supported on `(1 + qℤ_p)^d` in BBdJR §6, (6.2), p. 27. The congruence bound and existence of that arithmetic functional are targets here, rather than consequences of generic measure existence. For another admissible smoothing with norm `b'`, put `D_b μ = b⁻¹(m_(b⁻¹))_*μ − μ`, where `m_(b⁻¹)(y) = y/b`. Prove `D_(b')ν_(c,β) = D_b ν_(c,β')` by equality of moments (BBdJR (6.2), pp. 27–28).

- `partialZeta_smoothed_congruences`: the bound on all finite polynomial tests with the stated moments.
- `partialZetaMeasure`: the unique bounded measure with these moments, its coefficient-extension law and smoothing cross-multiplication identities.

*Needs:* (a), Chebotarev Layer 10 (infinitely many rational primes splitting completely in a normal closure), ClassFieldTheory Layer 12 (ray class fields), PadicMeasuresIwasawaAlgebras Layer 0 (bounded dual, clopen restriction and pushforward) and Layer 2 (Mahler density and coefficient extension).

**Checks.**

- At `n = 0`, `ν_(c,β)(1) = (b⁻¹ − 1)ζ_c(0)`; replacing the smoothing factor by `b^(−n) − 1` would force every total mass to vanish.
- For `k = ℚ, p = 3, g = (3)∞, 𝔞_1 = (1), β = 7`, the moments are `M(0) = −1/7` and `M(1) = −4/49`, using `ζ_1(0) = 1/6` and `ζ_1(−1) = 1/12`.
- The support is `1 + qℤ_p`: on the negative coset the odd moments have the opposite sign. For `p = 2` it is `1 + 4ℤ₂`; the logarithm kernel on `1 + 2ℤ₂` still contains `−1` and is not the required exponential chart.
- For a polynomial vanishing identically on `U_q`, the bound forces its moment functional to vanish; an arbitrary sequence of rational values without the bound does not define a continuous functional.

#### (c) Analytic interpolation and cancellation of the partial-zeta pole

**Theorem.** From (b) construct on `B = {s ∈ ℂ_p : |s| < q p^(−1/(p−1))}` the numerator `Ψ_(c,β)(s) = ∫_(U_q) y^(−s) dν_(c,β)`, using `y^(−s) = exp(−s log y)`. Its coefficient of `s^n` has norm at most `C_(c,β) q^(−n) p^(n/(p−1))`, so it is analytic on `B`. With `⟨N𝔞_c⟩ = N𝔞_c/ω_p(𝔞_c)`, define the meromorphic partial-zeta function

`ζ_(p,c)(s) = ⟨N𝔞_c⟩^(−s) Ψ_(c,β)(s)/(b^(s−1) − 1)`.

Prove independence of the smoothing and of the representative, analytic continuation across any removable singularity, and at most a simple pole at 1: the denominator has precisely one zero on `B`, at 1, and that zero is simple. At `m ≤ 0`, `ζ_(p,c)(m) = ω_p(𝔞_c)^m ζ_c(m)`. Prove that the functions `ω_p(𝔞_c)⁻¹ζ_(p,c)(s)` all have the same residue at 1. Consequently `L_p(s,χ,k) = Σ_c χ(c)ω_p(𝔞_c)⁻¹ζ_(p,c)(s)` is analytic for nontrivial `χ` by character orthogonality, and has at most a simple pole for `χ = 1`. Derive the Teichmüller-twisted interpolation formula of L3.Fd.2 and uniqueness from the accumulating interpolation integers. This supplies the one-dimensional functions before any Brauer products (BBdJR §6, (6.3)–(6.4) and the coefficient estimates and common-residue argument, p. 28).

- `partialZetaPadic`: the meromorphic function with the stated moment interpolation and independence laws.
- `partialZetaPadic_common_residue`: equality of the residues after the factors `ω_p(𝔞_c)⁻¹`.
- `padicArtinL_one_dim_analytic`: the one-dimensional character sum, its analytic domain, pole cancellation and interpolation, for every prime including 2.

*Needs:* (a)–(b), L0.7, DirichletPadicLFunctions §0.6 (Iwasawa logarithm), PadicFunctionalAnalysis §4.5 (local exponential), PadicMeasuresIwasawaAlgebras Layers 0 and 2 (bounded integration); L3.Fd.1 for the complex value convention.

**Checks.**

- For `p = 2`, the radius of `B` is `4·2⁻¹ = 2 > 1`; using `q = 2` would lose this domain. On `1 + 4ℤ₂`, `|log y| ≤ 1/4` gives exactly the stated exponential estimates.
- For a nontrivial ray-class character, the weighted residues sum to the common residue times `Σ_c χ(c) = 0`. Equality of unweighted partial-zeta residues would omit the Teichmüller factor.
- For `k = ℚ, p = 3, χ = 1, m = −1`, the character sum gives `L_3(−1,1,ℚ) = (1 − 3)ζ(−1) = 1/6`; at `m = 0` the twisted formula uses `ω_3`, rather than the trivial character.
- The function `b^(s−1) − 1` has derivative `log b ≠ 0` at 1 for admissible `b > 1`, so dividing may introduce a simple pole but no higher pole.

#### (d) One-dimensional functions and Brauer assembly

**Construction.** Let `k` be totally real, `p` a prime, `q = p` for `p` odd and `q = 4` for `p = 2, B ⊂ ℂ_p` the open ball of radius `q p^(−1/(p−1))` about 0, and `ω_p` the Teichmüller character `Gal(k̄/k) → Gal(ℚ(μ_q)/ℚ) ≅ (ℤ/q)^× → W_p`, with `W_p` the `(p − 1)-`th roots of unity for `p` odd and `W_2 = {±1}` (BBdJR (2.14), p. 7). For a one-dimensional Artin character `χ` : `Gal(k̄/k) → ℚ̄_p` targets (a)–(c) construct the unique function `L_p(s, χ, k)` on `B`, analytic for `χ ≠ 1` and with at most a simple pole at `s = 1` for `χ = 1`, such that `L_p(m, χ, k) = Eul*_p(m, χ, k) L*(m, χ, k)` for negative integers `m ≡ 1` modulo `φ(q)`, where the starred values are the complex ones transported by any isomorphism `σ` : `ℚ̄_p → ℂ` (BBdJR Theorem 2.9, p. 6, due to Deligne–Ribet, Barsky and Cassou-Noguès). For a general Artin character `χ` with totally real kernel field, choose a finite totally real Galois extension `L/k` through which it factors, for example its kernel field. Apply Brauer induction in the finite group `G = Gal(L/k)`: write `χ = Σ_i a_i Ind_(H_i)^G(χ_i)` with `H_i ⊆ G`, each `χ_i` one-dimensional and each `a_i ∈ ℤ`. Put `k_i = L^(H_i)`; the kernel field `L^(ker χ_i)` of each inflated inducing character is also a subfield of `L`, hence totally real. At every negative interpolation integer `m ≡ 1` modulo `φ(q)`, the functional equation and the nonvanishing of the one-dimensional complex Euler product at `1 − m > 1` give a nonzero complex value; its Euler factors at `p` are nonzero as well. Thus each `L_p(s, χ_i, k_i)` is a nonzero meromorphic function on `B`. Define `L_p(s, χ, k) = ∏_i L_p(s, χ_i, k_i)^(a_i)` in the field of meromorphic functions, so negative powers have nonzero denominators. Artin induction identifies its values at the interpolation points with those of `χ`; the meromorphic identity principle gives independence of the decomposition and of the chosen finite totally real quotient (BBdJR Theorem 2.9 and (2.10)–(2.11), pp. 6–7). With coefficients, for `E` a number field and `ψ` as in L3.Fd.1 such that every `τ(ψ)ω_p^a` is totally real, the functions `L_p(s, τ(ψ)ω_p^a, k)` for `τ` : `E → ℚ̄_p` assemble on `B` to an `E ⊗ ℂ_p`-valued meromorphic function `L_p(s, ψ ⊗ ω_p^a, k)`. At `s ∈ ℤ_p` where it is defined, its value descends to `E ⊗ ℚ_p` (BBdJR §3, p. 13, and Lemma 3.15, p. 13). For a nonabelian character, existence of the value at `s = n ≥ 2` is an explicit hypothesis in every statement using that value, for every prime `p`. One-dimensional values are supplied by the analytic construction above. BBdJR Remark 2.12, p. 7, obtains unconditional odd-prime existence through the Iwasawa main conjecture; that theorem is not consumed here.

- `padicArtinL`: `L_p(s, χ, k)` on `B` for `k` totally real.
- `padicArtinL_interpolation`: `L_p(m, χω_p^l, k) = Eul*_p(m, χ, k) L*(m, χ, k)` for `m ≤ 0, l + m ≡ 1` mod `φ(q)` (BBdJR Remark 2.13, p. 7).
- `padicArtinL_brauer_indep`: for `χ` factoring through a finite totally real Galois extension `L/k`, any two Brauer decompositions of its character in `Gal(L/k)`, with one-dimensional characters of subgroups of that finite group and integer coefficients, give the same meromorphic function on `B`. Prove that each factor is nonzero as a meromorphic function before taking negative powers. The equality is an equality of meromorphic functions, including at zeros or poles through their germs (BBdJR Theorem 2.9 and (2.10)–(2.11), pp. 6–7).
- `padicArtinL_one_dim_eq_kubotaLeopoldt`: for `k = ℚ, p` odd and `χ` an even Dirichlet character, `L_p(s, χ, ℚ)` is the Kubota–Leopoldt function of DirichletPadicLFunctions Layer 3 attached to `χ`, both being characterized by the same interpolation property.
- `padicArtinLWithCoeff`: the `E ⊗ ℂ_p`-valued meromorphic function on `B`; for `s ∈ ℤ_p` where it is defined, its value lies in `E ⊗ ℚ_p` (BBdJR §3 and Lemma 3.15, p. 13). Positive-integer specializations use this descended value.
- `teichmullerCharacter_two`: for `p = 2, ω_2` factors through `(ℤ/4)^×` and takes the values `±1`.

*Needs:* L3.Fd.2(a)–(c) (general-field one-dimensional arithmetic construction), L3.Fd.1, TauCetiRoadmap RepresentationTheory (the induction–restriction roadmap, Layer 6: Brauer's induction theorem), DirichletPadicLFunctions Layer 3 (the comparison over `ℚ`), PadicMeasuresIwasawaAlgebras Layer 3 (generic admissible evaluation), Mathlib `DirichletCharacter`.

**Checks.**

- `k = ℚ, χ = 1, p = 5, m = −1, l = 2` (so `l + m ≡ 1` modulo 4): `L_5(−1, ω_5², ℚ) = Eul_5(−1, 1, ℚ) ζ(−1) = (1 − 5)(−1/12) = 1/3`; a normalization with the Euler factor `1 − p^(−1)` or without the twist `ω_5²` gives a different value.
- `p = 2`: `ω_2` has conductor 4, so `ω_2 = χ_(−4)` as a Dirichlet character, and `ω_2^(1−n)` is trivial for `n` odd and `χ_(−4)` for `n` even; a definition using a character of conductor 2 (trivial) is wrong for even `n`.
- `k = ℚ` and `χ = χ_(−4)`: the base field is totally real but the kernel field `ℚ(i)` is not. The negative interpolation integers `m ≡ 1` modulo `φ(q)` are odd, and `L(m, χ_(−4)) = 0` by parity, so the interpolating function is identically zero (BBdJR p. 6). The nonzero Artin construction therefore requires the kernel field, as well as the base field, to be totally real.
- The identity `1 = 1 + ε − ε` with `ε = χ_(−4)` and all inducing base fields `ℚ` is excluded from Brauer induction in a totally real quotient: `ε` has kernel field `ℚ(i)`. Allowing it would introduce `L_p(s, 1, ℚ) · 0 · 0⁻¹`. At `p = 3, s = −1` the required value is `(1 − 3)ζ(−1) = 1/6`, whereas totalized inversion gives zero.
- For the trivial character of `Gal(L/k)`, adjoining a cancelling pair `Ind_H^G ψ − Ind_H^G ψ` inside the same totally real quotient preserves the product. The kernel field of `ψ` is a subfield of `L`, so its p-adic L-function is nonzero as a meromorphic function and its negative power is defined, even if it has a zero at an individual point.

### L3.1 p-adic L-values at positive integers as negative moments of the measure `μ_θ`

**Lemma.** Let `p` be an odd prime and `θ = χ*η` a nontrivial primitive Dirichlet character of conductor `N = D p^n`, where `η` is primitive of conductor `D > 1` with `p` not dividing `D` and `χ` is primitive of conductor `p^n (n≥0)`. Let `L` be a finite extension of `ℚ_p` inside `ℂ_p` containing `μ_N` and the values of `θ`, and `μ_θ = (μ_η)_χ` in `Λ(ℤ_p) (x) L` the measure of RJW (5.5), with Amice transform `F_θ` (RJW Lemma 5.12). For integer `k≥1, L_p(θ*ω^{1-k}, k) = ∫_(ℤ_p^×) x^{-k}` . `μ_θ`. Here `ω` is the Teichmueller character, `L_p(ψ, s)` is RJW Definition 5.18, and `θ*ω^{1-k} = (χ*ω^{1-k})*η`, its `p`-part `χ*ω^{1-k}` being the finite-order character of `ℤ_p^×` it defines (trivial when `χ = ω^{k-1}`). (RJW Rem. 5.19, (5.7), p. 35; p. 147 published; RJW (6.2), p. 37; BHYY proof of Thm. 5.8, p. 30.)

Standing hypotheses of this target: `p` odd, with RJW Definition 5.15's `ω` and `⟨x⟩=ω⁻¹(x)x`; `D>1` gives nontrivial `η` and bounded `μ_η` by Theorem 5.7 (`D=1`: L3.2). `k≥1`; `1_(ℤ_p×)x^(−k)` is continuous on `ℤ_p`.

*Proof sketch.* RJW Remark 5.19, (5.7): for `ψ = χ' η` with `χ'` a finite-order character of `ℤ_p^×` and every integer `s, L_p(ψ, s) = ∫_(ℤ_p^×) χ' ω^{s-1}(x) x^{-s}` . `μ_η`. This identity comes with the definition of `L_p` (DirichletPadicLFunctions Layer 3). Take `χ' = χ ω^{1-k}` and `s = k`: `χ' ω^{k-1} = χ` on `ℤ_p^×`, so `L_p(θ ω^{1-k}, k) = ∫_(ℤ_p^×) χ(x) x^{-k}` . `μ_η`. By the definition of the twist (RJW (5.1)), int `f` . `(μ_η)_χ =` int `χ f` . `μ_η` for continuous `f`; with `f = 1_{ℤ_p^×} x^{-k}` this gives `∫_(ℤ_p^×) x^{-k}` . `μ_θ` (DirichletPadicLFunctions Layer 2 supplies `μ_θ`).

*Needs:* DirichletPadicLFunctions Layer 2, DirichletPadicLFunctions Layer 3.

### L3.2 p-adic L-values at positive integers for pure `p`-power conductor, through the smoothed measure

**Lemma.** Let `p` be an odd prime, `χ` a nontrivial primitive Dirichlet character of conductor `p^n (n≥1)` with values in a finite extension `L` of `ℚ_p`, and `k≥1` an integer. Let `b > 1` be an integer prime to `p` with `χ(b) b^{1-k}≠1` (such `b` exist: `x→χ(x) x^{1-k}` is a nontrivial continuous character of `ℤ_p^×` and the positive integers prime to `p` are dense in `ℤ_p^×`). Let `μ_b` in `Λ(ℤ_p)` be the measure with Amice transform `F_b(T) = 1/T - b/((1+T)^b - 1)` (RJW Definition 4.5) and `μ_{χ,b} = (μ_b)_χ` its twist by `χ`. Then `L_p(χ*ω^{1-k}, k) = (χ(b) b^{1-k} - 1)^{-1} ∫_(ℤ_p^×) x^{-k}` . `μ_{χ,b}`. (RJW Def. 5.18, p. 35; RJW (3.11), §3.6, p. 22; RJW Defs. 4.5 and 4.10, pp. 27-28.)

Standing hypotheses of this target: `p` odd with RJW's `ω,⟨x⟩`; `cond(χ)=p^n, n≥1, D=1`. RJW Lemma 5.12's `F_χ` is not a bounded-measure transform here. Choose integer `b>1, p∤b, χ(b)b^(1−k)≠1`.

*Proof sketch.* RJW Definition 5.18 with `η = 1, ζ_η = ζ_p`: `L_p(χ ω^{1-k}, k) = ∫_(ℤ_p^×) χ ω^{1-k}(x) <x>^{1-k}` . `ζ_p =` int `ψ` . `ζ_p` with `ψ(x) = χ(x) x^{1-k}`, since `ω(x) <x> = x`. `ζ_p` is a pseudo-measure with `([b] - [1]) ζ_p = x^{-1} Res_{ℤ_p^×}(μ_b)` for every integer `b > 1` prime to `p` (DirichletPadicLFunctions Layer 1: independence of the smoothing parameter; RJW Definition 4.10 uses a topological generator). Evaluate the pseudo-measure at the nontrivial character `ψ` by RJW (3.11) with `g = b` (PadicMeasuresIwasawaAlgebras Layer 3): int `ψ` . `ζ_p = (ψ(b) - 1)^{-1} ∫_(ℤ_p^×) ψ(x) x^{-1}` . `μ_b`. By the definition of the twist, `∫_(ℤ_p^×) χ(x) x^{-k}` . `μ_b = ∫_(ℤ_p^×) x^{-k}` . `μ_{χ,b}` (DirichletPadicLFunctions Layer 2).

*Needs:* DirichletPadicLFunctions Layer 1, DirichletPadicLFunctions Layer 2, DirichletPadicLFunctions Layer 3, PadicMeasuresIwasawaAlgebras Layer 3.

### L3.3 The geometric measure `μ_w` of a point outside the residue disc of 1

**Construction.** Let `K` be a finite extension of `ℚ_p` inside `ℂ_p` and `w` in `K` with `|w|≤1` and `|w - 1| = 1` (`w` lies in the closed unit disc but not in the residue disc `D^-(1,1)` of 1). The geometric measure `μ_w` in `Λ(ℤ_p) (x) O_K` is the unique bounded measure on `ℤ_p` with Amice transform `A_{μ_w}(T) = w(1+T)/(1 - w(1+T)) = Li_0(w(1+T)) = w/(1-w) + sum_{m≥1} w^m (1-w)^{-m-1} T^m`, where `Li_0(z) = z/(1-z)`. Its values on residue classes are `μ_w(a + p^m ℤ_p) = w^a/(1 - w^{p^m})` for `0 < a≤p^m`, and `μ_w = sum_{n≥1} w^n δ_n` when `|w| < 1`. (BF proof of Prop. 2.1, p. 2; RJW (3.6), §3.5.3, p. 20; RJW Thm. 3.25, p. 18.)

Standing hypotheses of this target: `K` is a finite extension of `ℚ_p` (so that the bounded Mahler-Amice theory of RJW Theorem 3.25 applies over `O_K`). `|w|≤1` and `|w - 1| = 1`; for `w` in the residue disc of 1 the series below is unbounded and no measure exists.

- `geometricMeasure`: For `w` in `K` with `|w|≤1` and `|w - 1| = 1`, the bounded measure `μ_w` in `D(ℤ_p, K)`.
- `amiceTransform_geometricMeasure`: `A_{μ_w}(T) = w(1+T) (1 - w(1+T))^{-1}` in `K[[T]]`.
- `geometricMeasure_residueClass`: `μ_w(1_{a + p^m ℤ_p}) = w^a/(1 - w^{p^m})` for `0 < a≤p^m`.
- `geometricMeasure_moment`: int `x^j` . `μ_w = Li_{-j}(w) := (z d/dz)^j (z/(1-z))` at `z = w`, for `j≥0` (RJW Corollary 3.30).
- `geometricMeasure_eq_tsum_dirac`: For `|w| < 1, μ_w = sum_{n≥1} w^n δ_n` (convergent in the weak topology).
- `geometricMeasure_norm_le_one`: `μ_w` takes `C(ℤ_p, O_K)` into `O_K`.
- `geometricMeasure_psi`: `ψ(μ_w) = μ_{w^p}`, hence `Res_{pZ_p} μ_w = φ(μ_{w^p})` and `Res_{ℤ_p^×} μ_w = μ_w - φ(μ_{w^p})`; this is the distribution relation `sum_{ξ in μ_p} Li_0(ξ z) = p Li_0(z^p)` for the rational function `Li_0`.
- `geometricMeasure_rotate`: For `ξ` in `μ_{p^∞}, ξ^x μ_w = μ_{ξ w}` (RJW §3.5.2).
- `geometricMeasure_galois`: For a continuous automorphism `σ` of `ℂ_p` over `ℚ_p, σ o μ_w = μ_{σ(w)}`.

*Construction.* `|1 - w| = 1` and `|w| ≤ 1` give `|w^m (1-w)^{-m-1}| ≤ 1`, so `A(T) := w(1+T)/(1 - w(1+T))` lies in `O_K[[T]]`. By the bounded Mahler-Amice bijection `M(ℤ_p, O_K) = O_K[[T]]` (RJW Theorem 3.25; PadicMeasuresIwasawaAlgebras Layer 2) there is a unique measure with this transform; uniqueness is Mathlib `AbstractMeasure.injective_amiceTransform`. Residue classes: by RJW (3.6), `μ(a + p^m ℤ_p) = p^{-m} sum_{ξ in μ_{p^m}} ξ^{-a} A_μ(ξ - 1)`, and `p^{-m} sum_ξ ξ^{-a} w ξ/(1 - w ξ) = w^a/(1 - w^{p^m})` for `0 < a ≤ p^m` (an identity of rational functions of `w`, checked by expanding in `w` for `|w| < 1`). For `|w| < 1` the Amice transform of `sum_{n≥1} w^n δ_n` is `sum_n w^n (1+T)^n = Li_0(w(1+T))`.

*In `Suggested.lean`:* `geometricTransform`, `existsUnique_geometricMeasure` (the transform and its integral norm bound characterize the measure).

*Needs:* PadicMeasuresIwasawaAlgebras Layer 2, `AbstractMeasure`, `AbstractMeasure.amiceTransform`, `AbstractMeasure.injective_amiceTransform`.

**Checks.**

- `μ_w(ℤ_p) = w/(1-w)`; for `p` odd and `w = -1` this is `-1/2`.
- For `p = 3` and `w = -1`: `μ_{-1}(1 + 3Z_3) = -1/2, μ_{-1}(2 + 3Z_3) = 1/2, μ_{-1}(3Z_3) = -1/2`.
- `w = 0` gives `μ_0 = 0`.
- For `|w| < 1, μ_w = sum_{n≥1} w^n δ_n`, and `∫_(ℤ_p^×) x^{-k}` . `μ_w = sum_{n≥1, p not | n} w^n n^{-k}`.
- For `w = ζ_p` a `primitive p`-th root of unity the coefficients `w^m (1-w)^{-m-1}` have absolute value `p^{(m+1)/(p-1)}`, unbounded, so the formula defines no measure: the pure `p`-power conductor case needs the smoothed measure.

### L3.4 `μ_θ` as a Gauss-sum combination of geometric measures

**Lemma.** Let `θ = χ*η` be primitive of conductor `N = D p^n` with `D > 1` and `p` not dividing `D, L` as in L3.1, `ε_N` in `L` a primitive `N`-th root of unity and `G(θ^{-1}) = sum_{c in (Z/NZ)^x} θ^{-1}(c) ε_N^c`. For `c` in (`Z/`NZ)`^x, |ε_N^c| = |ε_N^c - 1| = 1`, and `μ_θ = G(θ^{-1})^{-1} sum_c θ^{-1}(c) μ_{ε_N^c}`; equivalently `F_θ(T) = G(θ^{-1})^{-1} sum_c θ^{-1}(c) Li_0((1+T) ε_N^c)`. (RJW Lem. 5.12, p. 33;, p. 145 published; RJW proof of Lem. 6.5, p. 38.)

Standing hypotheses of this target: `D > 1`: every `ε_N^c` reduces to a nontrivial root of unity of order `D`, so it lies outside the residue disc of 1. The Gauss sum and `F_θ` are formed with the same root `ε_N`.

*Proof sketch.* Since `gcd(c, N) = 1, ε_N^c` has order `N` with prime-to`-p` part `D > 1`; its reduction has order `D ≠ 1` in the residue field, so `|ε_N^c - 1| = 1`. `Li_0(z) = z/(1-z) = -1 - 1/(z - 1)`, so `-1/((1+T) ε^c - 1) = Li_0((1+T) ε^c) + 1`. RJW Lemma 5.12 (DirichletPadicLFunctions Layer 2): `F_θ(T) = -G(θ^{-1})^{-1} sum_c θ^{-1}(c)/((1+T) ε_N^c - 1) = G(θ^{-1})^{-1} sum_c θ^{-1}(c)(Li_0((1+T) ε_N^c) + 1)`; the constants cancel because `sum_c θ^{-1}(c) = 0` (Mathlib `MulChar.sum_eq_zero_of_ne_one`). Compare Amice transforms with L3.3; the measures agree by Mathlib `AbstractMeasure.injective_amiceTransform`. `G(θ^{-1}) ≠ 0` by DirichletPadicLFunctions Layer 0.

*Needs:* DirichletPadicLFunctions Layer 0, DirichletPadicLFunctions Layer 2, L3.3, `MulChar.sum_eq_zero_of_ne_one`, `AbstractMeasure.injective_amiceTransform`.

### L3.5 Taylor expansions of Coleman's polylogarithms on a residue disc as Amice transforms

**Construction.** For `|w|≤1, |w−1|=1` in finite `K/ℚ_p` and `k≥0`, the Taylor series `F̃_w^(k)(T)` of `Li_k(w(1+T))` belongs to `R⁺` and evaluates correctly throughout `|T|<1`. `F̃_w^(0)=A_(μ_w)`, and `∂F̃_w^(k)=F̃_w^(k−1)`. Under the LocallyAnalyticDistributions Layer 1 Amice correspondence its distribution `μ̃_w^(k)` satisfies `x·μ̃_w^(k)=μ̃_w^(k−1)` and `x^k·μ̃_w^(k)=μ_w`. Root-of-unity instances have the additional coefficient growth of L2.28; all such `w` are needed for geometric measures. (RJW Thm. 3.43, p. 25; RJW Lem. 3.29, p. 19, and Rem. 3.45, p. 25; RJW §6.2, p. 37; BF §1, p. 1.)

Standing hypotheses of this target: `|w|≤1, |w−1|=1, k≥0`. The image of `|t|<1` under `w(1+t)` is `D⁻(w,1)` if `|w|=1, D⁻(w,|w|)`⊊`D⁻(0,1)` if `0<|w|<1`, and `{0}` if `w=0`. The identity holds on this image. Branch independence follows outside the discs of `1,∞` (BDJ Proposition 2.6, proof).

- `polylogPrimitive`: `Ftilde^{(k)}_w` in `K[[T]]`, the Taylor series of `Li_k(w(1+T))` at `T = 0`.
- `polylogPrimitive_mem_openDisc`: `Ftilde^{(k)}_w` is restricted at every radius `c < 1` (`PowerSeries.IsRestricted`), `i.e`. lies in `R^+`.
- `polylogPrimitive_eval`: `Ftilde^{(k)}_w(t) = Li_k(w(1+t))` for `|t| < 1`; in particular `Ftilde^{(k)}_w(0) = Li_k(w)` and `Ftilde^{(k)}_w(ξ - 1) = Li_k(ξ w)` for `ξ` in `μ_{p^∞}`.
- `polylogPrimitive_zero`: `Ftilde^{(0)}_w = A_{μ_w}`.
- `polylogPrimitive_derivation`: `(1+T) d/dT Ftilde^{(k)}_w = Ftilde^{(k-1)}_w` for `k≥1`.
- `polylogDistribution`: `mutilde^{(k)}_w` in `D^la(ℤ_p, K)` with Amice transform `Ftilde^{(k)}_w`.
- `polylogDistribution_mul_x_pow`: `x^k` . `mutilde^{(k)}_w = μ_w`.
- `polylogPrimitive_of_norm_lt_one`: For `|w| < 1, Ftilde^{(k)}_w = sum_{n≥1} w^n (1+T)^n n^{-k}`.

*Construction.* L2.4: the restriction of `Li_k` to a residue disc not meeting `0, 1, ∞` is a single power series convergent on the whole disc; for `|w| < 1, Li_k(z) = sum z^n/n^k` (L2.5). This gives (a). `Li_0(z) = z/(1-z)` and L3.3 give (b). `z d/dz Li_k = Li_{k-1}` (L2.7) with `z = w(1+T)`, so `z d/dz = (1+T) d/dT`; this gives (c). RJW Lemma 3.29 extended to distributions (RJW Remark 3.45; LocallyAnalyticDistributions Layer 1): `A_{x λ} = (1+T) d/dT A_λ`. By (c) and injectivity of the Amice transform on `D^la` (RJW Theorem 3.43), `x mutilde^{(k)} = mutilde^{(k-1)}`; `mutilde^{(0)}_w` is `μ_w` viewed as a distribution (RJW Remark 3.44).


*Needs:* L2.5, L2.4, L3.3, LocallyAnalyticDistributions Layer 1, `PowerSeries.derivative`, `PowerSeries.IsRestricted`, L2.7, L2.28, L0.17, L2.26.

**Checks.**

- `w = 0`: `Ftilde^{(k)}_0 = 0` for `k≥0`.
- `Ftilde^{(1)}_w(T) = -log(1 - w) + sum_{m≥1} (w/(1-w))^m T^m/m`, with `log(1 - w)` branch independent because `1 - w` is a unit.
- `(1+T) d/dT Ftilde^{(1)}_w = w(1+T)/(1 - w(1+T)) = A_{μ_w}`.
- For `|w| < 1, Ftilde^{(k)}_w = sum_{n≥1} w^n (1+T)^n/n^k`.
- For `w = ζ_p` (in the residue disc of 1) the Taylor series of `Li_1(w(1+T))` at 0 has radius `|ζ_p - 1| = p^{-1/(p-1)} < 1`, so it is not in `R^+`.

### L3.6 Negative moments on `ℤ_p^×` through a locally analytic primitive

**Lemma.** Let `K` be a finite extension of `ℚ_p, μ` in `Λ(ℤ_p) (x) K` a bounded measure, `k≥0`, and Ftilde in `R^+` subset `K[[T]]` with `((1+T) d/dT)^k` Ftilde `= A_μ`. Let `λ` in `D^la(ℤ_p, K)` be the distribution with `A_λ =` Ftilde. Then `x^k λ = μ`, and `∫_(ℤ_p^×) x^{-k}` . `μ = λ(1_{ℤ_p^×}) =` (`(1 - φ o ψ)` Ftilde)`(0) = Ftilde(0) - p^{-1} sum_{ξ in μ_p} Ftilde(ξ - 1)`, where `Ftilde(ξ - 1)` is the value of the convergent series at the point `ξ - 1` of the open unit disc. The value does not depend on the choice of Ftilde. (RJW Lem. 6.5, p. 38; RJW (6.5), p. 38; RJW (3.8) and (3.9), p. 21.)

*Proof sketch.* `A_{x^k λ} = ((1+T) d/dT)^k A_λ = A_μ` (RJW Lemma 3.29 and Remark 3.45, LocallyAnalyticDistributions Layer 1), so `x^k λ = μ` by injectivity of the Amice transform on `D^la` (RJW Theorem 3.43), with `μ` viewed as a distribution (RJW Remark 3.44). `g(x) := 1_{ℤ_p^×}(x) x^{-k}` is locally analytic on `ℤ_p` (analytic on each `a + pZ_p` with `p` not dividing a), so int `g` . `μ =` int `g` . `(x^k λ) =` int `x^k g` . `λ = λ(1_{ℤ_p^×})`; no division by `x` on distributions is needed. `λ(1_{ℤ_p^×}) = A_{Res_{ℤ_p^×} λ}(0) = ((1 - φ o ψ) A_λ)(0)` by RJW (3.8) and (3.9) for distributions (Remark 3.45), with (`φ o ψ` Ftilde)`(T) = p^{-1} sum_{ξ in μ_p} Ftilde((1+T) ξ - 1)`. Independence: another primitive differs by `sum_{j<k} c_j log(1+T)^j`, and `(1 - φ o ψ)(log(1+T)^j)(0) = log(1)^j - p^{-1} sum_ξ log(ξ)^j = 0`.

The scalar identity `negMoment_eq_of_primitive` has the following general form: `K` is any complete nontrivially normed ultrametric field of characteristic zero with a continuous `ℤ_p`-algebra structure, `μ` is a `K`-valued `AbstractMeasure` on `ℤ_p`, `k : ℕ`, `F` is in RestrictedPowerSeries §7.1's open unit-disc series algebra and `∂^[k] F = μ.amiceTransform`. Assume that the set of `p`-th roots of unity in `K` has cardinality p. The displayed average is then evaluated in `K` using RestrictedPowerSeries §2.1's evaluation. For a finite extension lacking those roots, extend scalars to a finite splitting extension and descend the equality; its left side already lies in the original field.

Here `dop F = (1 + T)F′` is the light specialization of the formal derivative used in this identity. Its API consists of `dop_add`, `dop_smul`, `dop_C`, `dop_X` and `dop_iterate`, with the iterate of order zero equal to the identity. Define the continuous test function `unitsZPow k` for each integer `k` by `x ↦ x^(−k)` on units of `ℤ_p` and zero on nonunits, mapped into `K`. Its API consists of `unitsZPow_of_isUnit`, `unitsZPow_of_not_isUnit`, `unitsZPow_zero`, `unitsZPow_one` and `unitsZPow_mul`: on units, the product of the tests of weights `k` and `l` is the test of weight `k + l`. Continuity follows from the clopen unit locus and continuity of inversion there. These formulas use the continuous `ℤ_p`-algebra structure, and the negative exponent is only evaluated at a unit. (RJW Lemma 3.29 and Remark 3.45 for ∂, and Lemma 6.5 and (6.5), p. 38, for the unit test.)

**Checks.**

- `dop 1 = 0` and `dop T = 1 + T`; using only `d/dT` would return 1 in the second case.
- `dop (T²) = 2T + 2T²`; the coefficient of `T²` detects the multiplication by `1 + T`.
- The zeroth iterate of `dop` fixes every series, including 1, whereas every positive iterate kills a constant series.
- `unitsZPow k 0 = 0` and `unitsZPow k 1 = 1` for every integer `k`, including zero. The zero-weight test is the unit indicator, not the constant function 1.
- `unitsZPow k p = 0`, because `p` is a nonunit; evaluating `x^(−k)` on all of `ℤ_p` would give the wrong support.
- At the unit `−1`, `unitsZPow 1 (−1) = −1` and `unitsZPow 2 (−1) = 1`, also for `p = 2`; the tests distinguish the parity of the weight.

*In `Suggested.lean`:* for any measure with the stated Amice transform, `negMoment_eq_of_primitive`, `dop`, `unitsZPow`; the statement uses RestrictedPowerSeries §7.1's `TauCetiRoadmap.RestrictedPowerSeries.OnOpenDisc 1` and §2.1's `TauCetiRoadmap.RestrictedPowerSeries.eval₂ (RingHom.id K)`.

*Needs:* LocallyAnalyticDistributions Layer 1, PadicMeasuresIwasawaAlgebras Layer 2.

### L3.7 Negative moments of the geometric measure are modified polylogarithms

**Theorem.** Let `K` be a finite extension of `ℚ_p` and `w` in `K` with `|w|≤1` and `|w - 1| = 1`. For integer `k≥1, ∫_(ℤ_p^×) x^{-k}` . `μ_w = Li_k(w) - p^{-k} Li_k(w^p)`, where `Li_k` is Coleman's polylogarithm (for any branch; the right side is branch independent). For `|w| < 1` both sides equal `sum_{n≥1, p not | n} w^n n^{-k}`. (BF proof of Prop. 2.1, p. 2; BHYY Thm. 5.5, p. 27; RJW proof of Thm. 6.1(ii), case (2), pp. 38-39.)

*Proof sketch.* L3.5 gives `Ftilde^{(k)}_w` in `R^+` with `((1+T) d/dT)^k Ftilde^{(k)}_w = A_{μ_w}` and `Ftilde^{(k)}_w(t) = Li_k(w(1+t))` for `|t| < 1`. L3.6 gives `∫_(ℤ_p^×) x^{-k}` . `μ_w = Ftilde^{(k)}_w(0) - p^{-1} sum_{ξ in μ_p} Ftilde^{(k)}_w(ξ - 1) = Li_k(w) - p^{-1} sum_{ξ in μ_p} Li_k(ξ w)`. `w^p ≠ 1`, because the reduction of `w^p` is the `p`-th power of a residue class different from 1 (or `w^p = 0`); L2.8 at `z = w` gives `p^{-1} sum_{ξ in μ_p} Li_k(ξ w) = p^{-k} Li_k(w^p)`. Branch independence: `Li_k` depends on the branch only on the residue discs of 1 and `∞` (Besser-de Jeu, proof of Proposition 2.6), which contain neither `w` nor `w^p`.


*Needs:* L3.5, L3.6, L3.3, L2.8, L2.5.

### L3.8 Negative moments of the geometric measure as limits of finite sums

**Lemma.** For `w` as in L3.3 and every integer `k`: `∫_(ℤ_p^×) x^{-k}` . `μ_w = lim_{r→∞} (1 - w^{p^r})^{-1} sum_{0 < a < p^r, p not | a} a^{-k} w^a` in `K`, and the `r`-th term differs from the limit by an element of absolute value at most `p^{-r}`. Consequently the negative moments of `μ_w` are the values at `w` of BHYY's rigid analytic function `Li_k^{(p)}` on `{|t|≤1, |1 - t| = 1}` (BHYY Lemma 3.3 and Proposition 3.4 with F = Q). (BF proof of Prop. 2.1, p. 2; BHYY proof of Lem. 3.3, pp. 14-15.)

*Proof sketch.* On `a + p^r ℤ_p` with `p` not dividing `a, (a + p^r y)^{-k} = a^{-k}` (mod `p^r`); so `1_{ℤ_p^×}(x) x^{-k}` is congruent modulo `p^r` to the locally constant function equal to `a^{-k}` on `a + p^r ℤ_p` (`p` not `|` a) and 0 on `pZ_p`. `μ_w` takes `C(ℤ_p, O_K)` to `O_K` (L3.3), so the integral differs by at most `p^{-r}` from `sum_{p not | a} a^{-k} μ_w(a + p^r ℤ_p)`, and `μ_w(a + p^r ℤ_p) = w^a/(1 - w^{p^r})` (PadicMeasuresIwasawaAlgebras Layer 2 for integration of continuous functions against bounded measures). BHYY Lemma 3.3 `(g = 1)`: the same expressions `f_r(t) = (1 - t^{p^r})^{-1} sum_{0<a<p^r, p not | a} a^{-k} t^a` converge in the p-adic completion of `O_K[t, (1 - t)^{-1}]` to `Li_k^{(p)}(t)`; evaluation at `t = w` is continuous.

*Needs:* L3.3, PadicMeasuresIwasawaAlgebras Layer 2.

### L3.9 Sums of a primitive character along the fibres of reduction vanish

**Lemma.** Let `θ` be a primitive Dirichlet character modulo `N` with values in an integral domain, `M` a proper divisor of `N`, and `f` any function on (`Z/`MZ)`^x`. Then `sum_{c in (Z/NZ)^x} θ(c) f(c mod M) = 0`. In particular, if `p | N` and `ε_N` is a primitive `N`-th root of unity, then `sum_{c in (Z/NZ)^x} θ^{-1}(c) g(ε_N^{pc}) = 0` for function `g` on `μ_{N/p}`. (RJW proof of Thm. 6.1(ii), case (1), p. 38; RJW Rem. 5.3(ii), p. 30.)

*Proof sketch.* The reduction map (`Z/`NZ)`^x →` (`Z/`MZ)`^x` is surjective (Mathlib `ZMod.unitsMap_surjective`); its fibres are the cosets `u H` of `H =` ker(Mathlib `ZMod.unitsMap`). `θ` does not factor through `M` because its conductor is `N > M` (Mathlib `DirichletCharacter.IsPrimitive`), so by Mathlib `DirichletCharacter.factorsThrough_iff_ker_unitsMap` its restriction to `H` is a nontrivial homomorphism, and `sum_{h in H} θ(u h) = θ(u) sum_{h in H} θ(h) = 0` (Mathlib `sum_hom_units_eq_zero`). For the corollary, `ε_N^{pc}` depends only on `c` mod `N/p`, and `θ^{-1}` is primitive of conductor `N`.

*Needs:* `DirichletCharacter.IsPrimitive`, `DirichletCharacter.factorsThrough_iff_ker_unitsMap`, `ZMod.unitsMap`, `ZMod.unitsMap_surjective`, `sum_hom_units_eq_zero`.

### L3.10 The Euler factor from the `p`-th power map on roots of unity

**Lemma.** Let `θ` be a nontrivial primitive Dirichlet character of conductor `N` with values in a field of characteristic `0, ε_N` a primitive `N`-th root of unity, `k` an integer and `f` a function on the roots of unity. Then `sum_{c in (Z/NZ)^x} θ^{-1}(c) f(ε_N^{pc}) = θ(p) sum_{c} θ^{-1}(c) f(ε_N^c)`, with `θ(p) = 0` when `p | N`; hence `sum_c θ^{-1}(c) (f(ε_N^c) - p^{-k} f(ε_N^{pc})) = (1 - θ(p) p^{-k}) sum_c θ^{-1}(c) f(ε_N^c)`. (RJW proof of Thm. 6.1(ii), case (2), p. 39;, p. 153 published.)

Standing hypotheses of this target: `θ` primitive of conductor `N`; `f` arbitrary (in the application `f = Li_k`, and `ε_N^{pc}≠1` whenever the tame part `D > 1`).

*Proof sketch.* If `p` does not divide `N, c →` pc is a bijection of (`Z/`NZ)`^x` and `θ^{-1}(p^{-1} c') = θ(p) θ^{-1}(c')`. If `p | N`, the left side vanishes by L3.9 and `θ(p) = 0`.

*Needs:* L3.9, `DirichletCharacter.IsPrimitive`.

### L3.11 Independence of the choice of primitive root of unity

**Lemma.** Let `θ` be a nontrivial primitive character of conductor `N` with values in a field `F` of characteristic 0 containing `μ_N, f` any function from `μ_N` to `F, ε` a primitive `N`-th root of unity and `ε' = ε^a` with a in (`Z/`NZ)`^x`. Write `G_ε(θ^{-1}) = sum_c θ^{-1}(c) ε^c`. Then `G_ε(θ^{-1})≠0` and `G_{ε'}(θ^{-1})^{-1} sum_c θ^{-1}(c) f(ε'^c) = G_ε(θ^{-1})^{-1} sum_c θ^{-1}(c) f(ε^c)`. (RJW Rem. 5.3, p. 30.)

*Proof sketch.* Substituting `c → a^{-1} c` multiplies both the numerator and the Gauss sum by `θ(a)` (Mathlib `gaussSum_mulShift_eq`). `G_ε(θ^{-1}) ≠ 0` because `G(θ) G(θ^{-1}) = θ(-1) N` (DirichletPadicLFunctions Layer 0).

*Needs:* DirichletPadicLFunctions Layer `0, gaussSum, gaussSum_mulShift_eq`, `AddChar.zmodChar`.

### L3.12 The complex polylogarithm on the unit circle and the exponential `ζ` function

**Lemma.** For integer `k≥2` and every real `a`: `Li_k(e^{2 π i a}) = sum_{n≥1} e^{2 π i a n} n^{-k} = expZeta(a, k)`, where `Li_k` is the principal-branch complex polylogarithm of L0.F and L2.Fa and `expZeta` is `HurwitzZeta.expZeta`. (RJW Rem. 6.6, p. 39; BBdJR §4, (4.1), p. 17.)

Standing hypotheses of this target: `k≥2` (for `k = 1` the series converges only conditionally; that case is RJW Theorem 6.1(i), supplied by DirichletPadicLFunctions Layer 3).

*Proof sketch.* For `k ≥ 2` the series `Σ z^n/n^k` converges uniformly on the closed unit disc (comparison with `Σ n^(−k)`); the complex polylogarithm of L2.Fa is continuous on the closed disc and equals the series there, so the radial limit gives the first equality. The series at `z = e^{2 π i a}` is the Dirichlet series of `expZeta(a, s)` at `s = k` with `Re s > 1` (Mathlib `HurwitzZeta.hasSum_expZeta_of_one_lt_re`).

*Needs:* L2.Fa, `HurwitzZeta.expZeta`, `HurwitzZeta.hasSum_expZeta_of_one_lt_re`.

### L3.13 The complex formula `L(θ, k)` through polylogarithms at roots of unity

**Theorem.** Let `θ` be a nontrivial primitive complex Dirichlet character of conductor `N≥2` and `G(θ^{-1}) = sum_{c in (Z/NZ)^x} θ^{-1}(c) e^{2 π i c/N}` (`gaussSum` with `ZMod.stdAddChar`). For `s` in `C, L(θ, s) = G(θ^{-1})^{-1} sum_{c in (Z/NZ)^x} θ^{-1}(c) expZeta(c/N, s)`, with `L(θ, s) =` `DirichletCharacter.LFunction`. Hence for integer `k≥1, L(θ, k) = G(θ^{-1})^{-1} sum_c θ^{-1}(c) Li_k(e^{2 π i c/N})` with the principal-branch complex polylogarithm (RJW Theorem 6.7(i)). (RJW Thm. 6.7(i), p. 39; RJW proof of Thm. 6.1(i), p. 36; BBdJR proof of Prop. 4.17, p. 22.)

*Proof sketch.* Put `Φ := N^{-1} G(θ) θ^{-1}`. By Mathlib `DirichletCharacter.IsPrimitive.fourierTransform_eq_inv_mul_gaussSum` applied to `θ^{-1}, F(θ^{-1})(j) = θ(-j) G(θ^{-1})`; with Mathlib `ZMod.dft_dft` and Mathlib `ZMod.dft_comp_neg` this gives `F Φ = θ`, using `G(θ) G(θ^{-1}) = θ(-1) N` (DirichletPadicLFunctions Layer 0; it also follows from Mathlib `ZMod.dft_dft`). Mathlib `ZMod.LFunction_dft` `(Φ(0) = 0)`: `L(θ, s) = N^{-1} G(θ) sum_j θ^{-1}(j) expZeta(-j/N, s)` for all `s`; substituting `j → -j` and `θ^{-1}(-1) = θ(-1)` gives `θ(-1) G(θ) N^{-1} = G(θ^{-1})^{-1}` times `sum_c θ^{-1}(c) expZeta(c/N, s)`. For `k ≥ 2` apply L3.12. For `k = 1` the value is RJW Theorem 6.1(i), `L(θ, 1) = −G(θ⁻¹)⁻¹ Σ_c θ⁻¹(c) log(1 − e^(2πic/N))` (DirichletPadicLFunctions Layer 3), and `Li_1(z) = −log(1 − z)` on the closed disc minus 1 (L2.Fa).

*In `Suggested.lean`:* the case `k ≥ 2` (`k = 1` is RJW Theorem 6.1(i), through DirichletPadicLFunctions Layer 3), `LFunction_nat_eq_gaussSum_inv_mul_sum_complexPolylog`.

*Needs:* `DirichletCharacter.LFunction`, `DirichletCharacter.LFunction_eq_LSeries`, `ZMod.LFunction_dft`, `DirichletCharacter.IsPrimitive.fourierTransform_eq_inv_mul_gaussSum`, `ZMod.dft_dft`, `ZMod.dft_comp_neg`, `gaussSum`, `ZMod.stdAddChar`, `ZMod.toAddCircle`, `HurwitzZeta.expZeta`, L3.12, DirichletPadicLFunctions Layer 0, DirichletPadicLFunctions Layer 3, 2.Fa.

### L3.14 The modified p-adic polylogarithm of the syntomic regulator

**Definition.** For `n≥2` and a branch `log = log_λ`, the modified p-adic polylogarithm `L^mod_n` : `ℂ_p` minus `{0, 1}→ℂ_p` is `L^mod_n(z) := sum_{j=0}^{n-1} (B_j/j!) Li_{n-j}(z) log(z)^j`, with `B_j` the Bernoulli numbers (`t/(e^t - 1) = sum B_j t^j/j!, B_1 = -1/2`; bernoulli) and `Li_m` Coleman's polylogarithms for the same branch. It satisfies `L^mod_n(z) + (-1)^n L^mod_n(1/z) = 0, L^mod_n(z^m) = m^{n-1} sum_{ζ^m = 1} L^mod_n(ζ z)` for `z^m≠0, 1`, and `L^mod_n(ζ) = Li_n(ζ)` for root of unity `ζ≠1`. (BDJ-preprint Rem. 1.5, pp. 3-4; BBdJR §4, (4.12), p. 20; BDJ-preprint §1, (1.2), p. 3.)

- `padicRegulatorPolylog`: `L^mod_n(z) = sum_{j<n} (B_j/j!) Li_{n-j}(z) log(z)^j`.
- `padicRegulatorPolylog_inv`: `L^mod_n(z) + (-1)^n L^mod_n(1/z) = 0` for `z≠0, 1`.
- `padicRegulatorPolylog_distribution`: `L^mod_n(z^m) = m^{n-1} sum_{ζ^m = 1} L^mod_n(ζ z)` for `z^m≠0, 1`.
- `padicRegulatorPolylog_rootOfUnity`: `L^mod_n(ζ) = Li_n(ζ)` for `ζ` a root of unity, `ζ≠1`.
- `padicRegulatorPolylog_two`: `L^mod_2(z) = Li_2(z) - (1/2) log(z) Li_1(z)`.
- `padicRegulatorPolylog_galois`: For a branch with `λ` in `ℚ_p` and `σ` a continuous automorphism of `ℂ_p` over `ℚ_p, L^mod_n(σ z) = σ(L^mod_n(z))` (Besser-de Jeu Remark 2.3).
- `padicRegulatorPolylog_specialUnit_branch`: On special units `(|z| = |1 - z| = 1) L^mod_n(z)` does not depend on the branch.

*Construction.* Definition from Besser-de Jeu (Remark 1.5) and BBdJR (4.12), taking `c_j = B_j/j!` in that parametrization. Inversion: `Li_m(z) + (-1)^m Li_m(1/z) = -log(z)^m/m!` (Coleman; Besser-de Jeu (1.2), supplied by L2.9) and `sum_{j=0}^{n-1} B_j/(j!(n-j)!) = 0` for `n ≥ 2` give the functional equation (Besser-de Jeu, before Remark 1.5). Distribution: from L2.8 for each `Li_m` and `log(ζ z) = log z` for `ζ` a root of unity. At roots of unity `log(ζ) = 0` and `B_0 = 1`.


*Needs:* L2.5, L2.8, L0.18, bernoulli, L2.9.

**Checks.**

- `L^mod_2(z) = Li_2(z) - (1/2) log(z) Li_1(z)`.
- `L^mod_n(ζ) = Li_n(ζ)` for `ζ` in `μ_infinity` minus `{1}`; for `p` odd, `L^mod_n(-1) = (2^{1-n} - 1) Li_n(1)`.
- `L^mod_n(z) + (-1)^n L^mod_n(1/z) = 0`; for `n = 2` and `z = 2` this relates `L^mod_2(2)` and `L^mod_2(1/2)`.
- For the Iwasawa branch and `z = p + p^2, L^mod_2(z) - Li_2(z) = (1/2) log(1 + p) log(1 - p - p^2)≠0`: `L^mod_n` is not `Li_n` away from roots of unity.
- Zagier's complex single-valued `P_n` (L3.Fc) uses coefficients `2^j B_j/j!` and `log|z|`; at roots of unity both reduce to `Li_n` up to taking real or imaginary parts.

### L3.15 The syntomic regulator of cyclotomic elements

**Theorem.** Let `F` be a number field, `O` the localisation of `O_F` at a prime above `p, K` a complete discretely valued subfield of `ℂ_p` with ring of integers `R` and residue field algebraic over `F_p, σ` : `F→K` an embedding with `σ(O)` in `R`, and `n≥2`. Let `reg_σ` be the composite `H^1(Mtilde_n(F))→K_{2n-1}^{(n)}(F) = K_{2n-1}^{(n)}(O)→K_{2n-1}^{(n)}(R)→H^1_syn(Spec R, n) = K` of de Jeu's map (BBdJR Theorem 4.7), `σ_*` and Besser's syntomic regulator (BBdJR Lemma 2.15). For root of unity `ζ≠1` in `F`: `reg_σ([ζ]_n) = (-1)^n (n-1)! L^mod_n(σ(ζ)) = (-1)^n (n-1)! Li_n(σ(ζ))`, with the raw-symbol sign fixed by the relativity isomorphisms of L3.Fa.2 and L3.Fb.3 (BBdJR Remark 4.16, p. 21). For `F` unramified at `p`, Gros's regulator `reg^Gros = (1 - Frob/p^n)` reg sends `[ζ]_n` (`ζ` of order prime to `p`) to `(-1)^n (n-1)! (Li_n(ζ) - p^{-n} Li_n(ζ^p))`. (BDJ-preprint Thm. 1.12, p. 6; BDJ-preprint Rem. 1.13, p. 6; BBdJR Rem. 4.15, p. 21.)

Standing hypotheses of this target: `n≥2`; `ζ` a root of unity different from 1. The target `H^1_syn(Spec R, n)` is identified with `K` by the normalisation of Besser-de Jeu (Definition 4.6 and the following discussion).

*Proof sketch.* If the order of `ζ` is not a power of `p`, then `ζ` and `1 − ζ` are units at every prime above `p` (the reduction of `ζ` is that of its prime-to`-p` part, which is not 1), so `ζ` is a special unit and `[ζ]_n` comes from `H¹(M̃•(n)(O))`; Besser–de Jeu Theorem 1.10(2), that is L3.Fb.5(c), gives `reg_σ([x]_n) = (−1)^n (n − 1)! L^mod_n(σx)` for `x ∈ O^♭`. If `ζ` has order `p^s` with `s ≥ 1`, choose `r > 1` with `r ≡ 1` modulo `p^s`, so that `ζ^r = ζ`. The distribution relation of L3.Fa.4 (BDJ Proposition 2.11, p. 879) gives `[ζ]_n = r^(n−1) Σ_(α^r=1) [ζα]_n` in `M̃_n(F(μ_r))`; for `α ≠ 1` the root `ζα` has order divisible by a prime other than `p`, hence is a special unit. The regulator commutes with the finite extension `K ⊂ K(μ_r)` (L3.Fb.1), `L^mod_n` satisfies the same distribution relation (L3.14), and `r^(n−1) ≠ 1`, so `reg_σ([ζ]_n)` can be solved for (BDJ proof of Theorem 1.12, p. 910). At roots of unity `L^mod_n = Li_n` (L3.14). Gros's normalisation: `Frob(Li_n(ζ)) = Li_n(ζ^p)` by Galois equivariance (L2.17). Besser–de Jeu Theorem 1.10(2) is proved in their §§3–7; its steps are the targets L3.Fa.1–L3.Fa.4 (multi-relative K-theory, localization and de Jeu symbols), L3.Fb.1–L3.Fb.2 (the syntomic regulator through rigid syntomic cohomology) and L3.Fb.3–L3.Fb.5 (integration down by Coleman integration and the regulator of special symbols).

*Needs:* L3.14, L3.Fa.4, only the construction and distribution of L3.Fa.5 (no spanning or basis theorem), L3.Fb.1, L3.Fb.2, L3.Fb.5, L3.Fb.6, L2.8, L2.17, L2.25.

**Checks.**

- For `p = 3` and `ζ` a primitive cube root, `|1 − ζ|₃ = 3^(−1/2) < 1`, so the special-unit formula alone does not compute its regulator. With `r = 4`, distribution gives `(1 − 4^(n−1)) reg_σ([ζ]_n) = 4^(n−1) Σ_(α⁴=1, α≠1) reg_σ([ζα]_n)` after finite base change; all three terms on the right are special-unit classes and `1 − 4^(n−1) ≠ 0`.
- For `p = 3` and `ζ = −1`, both `ζ` and `1 − ζ = 2` are units. L3.Fb.5 applies directly, giving `reg_σ([−1]_n) = (−1)^n (n − 1)! Li_n(−1)`.
- For `p = 3` and `ζ` of order 6, its reduction is `−1`, so it is a special unit although its order is divisible by `p`. Only pure `p`-power order needs the distribution argument. A primitive cube root lies in a ramified extension of `ℚ₃`, so the Gros formula under the unramified hypothesis does not apply to it.

### L3.16 The p-adic Beilinson conjecture for Artin motives over `Q`, as a proposition

**Definition.** For finite Galois `k/Q` with group `G`, number field `E`, idempotent `π∈E[G], n≥2` and `dim_E E[G]π=dim_E πK_(2n−1)(k)_E`, choose embeddings `φ_∞,φ_p` and ordered `E`-bases. Put `M=π(E⊗k)`. `D_*^(1/2)` is the determinant of `(σ,a)↦φ_*(σa)` on `E[G]π×M`; `R_(n,*)` is the determinant of `(σ,α)↦reg_*(φ_*(σα))` on `E[G]π×πK_(2n−1)(k)_E`, using Beilinson and syntomic regulators. Define `PBC` to require `L(n,χ_π⊗id,Q)D_∞^(1/2)=eR_(n,∞)` and `L_p(n,χ_π⊗ω_p^(1−n),Q)D_p^(1/2)=e_p Eul_p(n,χ_π⊗id,Q)R_(n,p)`, for `e,e_p∈E^×`, with `e=e_p` and both the p-adic `L`-value and `R_(n,p)` units in the stated coefficient algebras. This defines a proposition; it does not assert it. (BBdJR Conjecture 3.18, p. 14; BBdJR Def. 3.6, p. 11; BBdJR Prop. 3.12, p. 12.)

Standing hypotheses of this target: `n≥2`; `dim_E E[G]π=dim_E πK_(2n−1)(k)_E`. For `π≠0`, BBdJR Proposition 3.12 characterizes this by a totally real kernel field and odd `n`, or a CM kernel field, even `n` and complex conjugation `−1`. `χ_π` is the `Gal(Qbar/Q)` character on `E[G]π`; `L_p(s,χ_π⊗ω_p^(1−n),Q)` is BBdJR §2's Artin function via totally real Brauer induction; `Eul_p` is the Euler factor at p. For every prime `p`, if the character is nonabelian assume explicitly that the value at `s = n` exists; carry this hypothesis through `padicBeilinsonConjecture` and all its comparison statements. For one-dimensional characters L3.Fd.2 supplies existence at `n ≥ 2`.

- `padicBeilinsonConjecture`: `PBC(k, E, π, n, p)` : Prop, the conjunction of parts `(1)-(4)`.
- `padicBeilinsonConjecture_basis_indep`: The truth of each part does not depend on the chosen bases (BBdJR Remark 3.19(1)).
- `padicBeilinsonConjecture_coeff_ext`: `PBC` for `π` in `E[G]` is equivalent to `PBC` for `π` in `E'[G], E'` an extension of `E` (Remark 3.21(2)).
- `padicBeilinsonConjecture_orthogonal_sum`: If `π = sum π_i` with orthogonal idempotents, `PBC` for all `π_i` implies `PBC` for `π` (Remark 3.21(1)).
- `padicBeilinsonConjecture_dimension_iff`: For `π≠0`, the dimension hypothesis holds iff the kernel field of `E[G]π` is totally real with `n` odd, or CM with `n` even and complex conjugation acting by `-1` (Proposition 3.12).
- `padicBeilinsonConjecture_quotient_group`: `PBC` for `π` in `E[G/N]` is equivalent to `PBC` for its canonical lift to `E[G]` (Remark 3.23(1)).

*Construction.* The ingredients: `K_(2n−1)(k)_E` and Beilinson's regulator (L3.Fc.1), the syntomic regulator `K_(2n−1)(O_F) → F` (L3.Fb.2, BBdJR Lemma 2.15), complex Artin L-functions with coefficients (L3.Fd.1) and p-adic Artin L-functions (L3.Fd.2; for abelian characters DirichletPadicLFunctions Layer 3). The quotients `R_{n,*}/D^{1/2,*}` are independent of the bases of `E[G]π` and of `φ_*` (BBdJR Lemma 3.7), so each part is independent of the choices (Remark 3.19(1)).

*Needs:* L3.Fa.1, L3.Fa.5, L3.Fb.2, L3.Fc.1, L3.Fc.2, L3.Fd.1, L3.Fd.2, DirichletPadicLFunctions Layer 3.

**Checks.**

- `k = Q(μ_N), χ` primitive with `χ(-1) = (-1)^{n-1}, π` its idempotent: both dimensions are 1, with bases `π, π(1 (x) ζ_N)` and `π(1 (x) [ζ_N]_n)`.
- `k = Q, π = 1, n` odd`≥3`: part `(2)` relates `L_p(n, ω^{1-n})` to `(1 - p^{-n})` and the syntomic regulator of `[-1]_n` (BBdJR, `N = 2` case of the proof of Proposition 4.17).
- `k = Q(i), π = (1 + c)/2, n = 2`: `dim E[G]π = 1` but `π K_3(Q(i))_E = K_3(Q)_E = 0`, so the proposition is not formed.
- `k` totally real, `n` even and `π≠0`: `π K_{2n-1}(k)_E = 0` (Borel), while `E[G]π≠0`, so no instance exists.

### L3.17 Unit denominator for a rotated smoothing series

**Lemma.** Write `Q_b(Z)=sum_(0≤i<b) Z^i` and `R_b(Z)=sum_(0≤i<b-1)(b-1-i)Z^i` as finite-polynomial notation, and `W=w(1+T)`. Then `|Q_b(w)|=1`, and every coefficient of `Q_b(W)` and `R_b(W)` has norm at most one. Hence `Q_b(W)` is a unit in `O_K[[T]]`. The norm assertions hold more generally in an ultrametric normed field when `|b|=1` and `|w-1|<1`; `Q_b` and `R_b` are explanatory finite sums, not new generic polynomial carriers. (RJW §4, Prop. 4.4 and Def. 4.5, v2, pp. 26–27; §3.5.2, p. 20.)

Standing hypotheses of this target: (C10).

*Proof sketch.* From `|w-1|<1` derive `|w|=1`. Induct using `w^(i+1)-1=w(w^i-1)+(w-1)` to obtain `|w^i-1|<1` for every `i>0`; the `i=0` difference is zero. The finite ultrametric triangle inequality gives `|Q_b(w)-b|<1`. The integer `b` is a p-adic unit since `p` does not divide `b`, so `|b|=1` and `|Q_b(w)|=1`. Expand `W^i=w^i sum_(n≤i) binomial(i,n)T^n` by the binomial theorem. Integer/binomial coefficients have norm at most one; `|w^i|=1`. Finite ultrametric sums give the asserted coefficient bounds for `Q` and `R`. The empty `R` sum at `b=1` is zero. The constant coefficient of `Q_b(W)` is `Q_b(w)`. It belongs to `O_K` with inverse in `O_K` because it has norm one. Apply the existing power-series unit criterion. This checks the only denominator inverted below; neither `W-1` nor `W^b-1` is asserted to be a power-series unit at `w=1`.

*Needs:* `IsUltrametricDist`, `PowerSeries.isUnit_iff_constantCoeff`, `geom_sum_mul`, DirichletPadicLFunctions Layer 1.

### L3.18 The pole-cancelled rotated smoothing transform

**Construction.** With the finite sums `Q_b` and `R_b` of rotated-smoothing-denominator, define `G_(b,w)(T)=R_b(w(1+T))*Q_b(w(1+T))^(-1)` in `K[[T]]`. The inverse is the existing formal power-series inverse of a unit. Every coefficient lies in `O_K`, so `G` is in `R^+` and, for `|t|<1, G(t)=R_b(w(1+t))/Q_b(w(1+t))`. At `w=1` it is exactly the coefficient image of the integral DirichletPadicLFunctions §1.1 (integral smoothing series) `F_b`; for `z=w(1+t) ≠1` it equals `1/(z-1)-b/(z^b-1)`. At `z=1` the value is `(b-1)/2`. All substitutions defining `G` are finite polynomial evaluations. No infinite formal substitution at nonzero constant coefficient is used. (RJW Prop. 4.4 and Def. 4.5, v2, pp. 26–27; (7.5)–(7.8), p. 42; published (7-7)–(7-8), printed, p. 157.)

Standing hypotheses of this target: (C10).

- `rotatedSmoothedTransform`: `G_(b,w)=R_b(w(1+T))*Q_b(w(1+T))^(-1)`, using only finite polynomial evaluation.
- `rotatedSmoothedTransform_mul_denominator`: If `Q_b(w)≠0, Q_b(w(1+T))*G_(b,w)=R_b(w(1+T))`.
- `rotatedSmoothedTransform_unique`: For `Q_b(w)≠0`, a series satisfying the cleared `Q` equation equals `G_(b,w)`.
- `constantCoeff_rotatedSmoothedTransform`: `constantCoeff G_(b,w)=R_b(w)/Q_b(w)`, including `w=1`.
- `rotatedSmoothedTransform_coeff_bound`: For `|b|=1` and `|w-1|<1` every coefficient of `G` has norm at most one.
- `rotatedSmoothedTransform_mem_openDisc`: Under the same norm hypotheses, `G` is restricted at every `0≤ρ<1`.
- `rotatedSmoothedTransform_eval`: For `|t|<1` and the same norm hypotheses, `evalSeries G t=R_b(w(1+t))/Q_b(w(1+t))`.
- `rotatedSmoothedTransform_one`: For `hb : IsUnit (b : K)`, `G_(b,1) = TauCetiRoadmap.DirichletPadicLFunctions.smoothedSeries K b hb`; this is the existing owner's series.
- `rotatedSmoothedTransform_parameter_one`: `G_(1,w)=0` for `w`.
- `rotatedSmoothedTransform_map`: For a field homomorphism `f`:`K→K'` and `Q_b(w)≠0`, coefficient mapping sends `G_(b,w)` to the same finite quotient at `f(w)`.
- `rotatedSmoothedTransform_eq_rational`: For `b≥1` and `w` in a field `K` with `w≠1` and `w^b≠1`, the explicit `G_(b,w)` equals `(w(1+T)-1)^(-1)-b*(w^b(1+T)^b-1)^(-1)` in `K[[T]]`. These hypotheses ensure both separate denominators have nonzero constant coefficient. They hold for `w` a nontrivial `p`-power root of unity and `b` prime to p. This identity is not extended to `w=1`.

*Construction.* Define `G` by the displayed finite sums. The denominator lemma gives an invertible constant coefficient. Existing `PowerSeries.mul_inv_cancel` gives `Q_b(W)G=R_b(W)`; multiplying by its inverse proves uniqueness. Applying `constantCoeff` gives `R_b(w)/Q_b(w)`. Let `h_n` be the coefficients of `Q_b(W)^(-1)`. The pinned `PowerSeries.coeff_inv` recurrence gives `h_0=Q_b(w)^(-1)` and, for `n>0, h_n=-h_0 sum_(i+j=n,j<n)q_i h_j`. Since `|h_0|=1` and all `|q_i|≤1`, strong induction and the finite ultrametric inequality give `|h_n|≤1`. The finite `R` polynomial and `PowerSeries.coeff_mul` give `|coeff_n G|≤1`. For each real `0≤ρ<1, |coeff_n G|ρ^n≤ρ^n` tends to zero; use `PowerSeries.isRestricted_iff` to obtain `R^+`. For `|t|<1`, the series converges in the complete ultrametric field. Multiplication by the finite polynomial `Q` is justified by finite summation and gives `Q_b(w(1+t))G(t)=R_b(w(1+t))`. The denominator lemma at `w(1+t)`, still in the disc of 1, permits division. This proves evaluation on the whole disc, not merely a germ. The finite identities `(Z-1)Q_b(Z)=Z^b-1` and `(Z-1)R_b(Z)=Q_b(Z)-b` follow by telescoping; the first is baseline `geom_sum_mul`, the second follows by subtracting adjacent coefficients. At `Z=1+T`, compare `Q_b(1+T)` with the exact supplier `smoothingDenominator` and `T R_b(1+T)=Q_b(1+T)-b`. Use `TauCetiRoadmap.DirichletPadicLFunctions.smoothedSeries_spec` and `TauCetiRoadmap.DirichletPadicLFunctions.smoothedSeries_unique` to identify `G_(b,1)` with `TauCetiRoadmap.DirichletPadicLFunctions.smoothedSeries K b hb`, carrying `hb : IsUnit (b : K)`. No generic smoothing definition is introduced here. If `z≠1, Q_b(z)≠0` on the disc implies `z^b-1≠0`, and the finite identities give the displayed scalar rational expression after clearing denominators. At `z=1, sum_(i<b-1)(b-1-i)=b(b-1)/2` and `Q_b(1)=b` give `(b-1)/2`. This is a removable value, not evaluation of the two separate reciprocal terms. A field homomorphism carries the finite sums to their coefficient images and preserves the unique inverse when `Q_b(w)≠0`, so the construction commutes with coefficient maps. `b=1` gives zero. For the inverse-negative-control, baseline `PowerSeries.inv_eq_zero` makes both old separate inverses zero at `w=1`, whereas `G_(2,1)` has constant `1/2`.

*In `Suggested.lean`:* `rotatedSmoothedTransform`, `constantCoeff_rotatedSmoothedTransform_one`, `rotatedSmoothedTransform_mul_denominator`, `rotatedSmoothedTransform_unique`, `rotatedSmoothedTransform_coeff_bound`, `rotatedSmoothedTransform_mem_openDisc`, `rotatedSmoothedTransform_eval`, `rotatedSmoothedTransform_eq_rational`.

*Needs:* L3.17, DirichletPadicLFunctions Layer 1, `PowerSeries.mul_inv_cancel`, `PowerSeries.constantCoeff_inv`, `PowerSeries.coeff_inv`, `PowerSeries.coeff_mul`, `PowerSeries.isRestricted_iff`, `PowerSeries.inv_eq_zero`, `geom_sum_mul`.

**Checks.**

- At `p=3,b=2,w=1` the constant coefficient is `1/2`.
- At `p=3,b=2,w=1` the coefficient of `T` is `-1/4`.
- At `p=2,b=3,w=1` the constant coefficient is 1; the dyadic prime is allowed.
- At `p=3,b=2,w=4` the constant coefficient is `1/5`; `|4-1|_3<1`.
- `G_(1,4)=0` over `Q_3`.
- Over `Q_3, G_(2,1)` differs from `(W-1)^(-1)-2(W^2-1)^(-1)` formed inside `Q_3[[T]]` at `W=1+T`: the latter is zero.
- At `p=3,b=3,w=1, coeff_1 G=-2/3` has norm `3>1`. The prime-to`-p` condition is necessary for the integral coefficient bound.
- At `p=3,b=2,w=4`, the regularized transform agrees with the separate reciprocal formula, whose constant denominators are 3 and 15.

### L3.19 Integral coefficients of the rotated transform

**Lemma.** If `|b|=1` and `|w-1|<1` in a complete ultrametric normed field `K`, every coefficient of `G_(b,w)` has norm at most one. (RJW Prop. 4.4, v2, p. 27 and §3.5.2, p. 20.)

Standing hypotheses of this target: (C11).

*Proof sketch.* Let `h_n` be the coefficients of `Q_b(W)^(-1)`. The pinned `PowerSeries.coeff_inv` recurrence gives `h_0=Q_b(w)^(-1)` and, for `n>0, h_n=-h_0 sum_(i+j=n,j<n)q_i h_j`. Since `|h_0|=1` and all `|q_i|≤1`, strong induction and the finite ultrametric inequality give `|h_n|≤1`. The finite `R` polynomial and `PowerSeries.coeff_mul` give `|coeff_n G|≤1`.

*Needs:* L3.17, L3.18, `PowerSeries.coeff_inv`, `PowerSeries.coeff_mul`.

### L3.20 Convergence of the rotated transform on the open unit disc

**Lemma.** Under the same norm hypotheses, `G_(b,w)` is restricted at every real radius `0≤ρ<1`, hence lies in `R^+`. (RJW §3.5.2, v2, p. 20; Prop. 4.4, p. 27.)

Standing hypotheses of this target: (C11).

*Proof sketch.* Apply the coefficient bound. The sequence `|coeff_n G|ρ^n` is squeezed between zero and `ρ^n`, which tends to zero. Use `PowerSeries.isRestricted_iff`. Completeness and the ultrametric series criterion give convergence at each `|t|<1`. This is a single series on the entire open unit disc.

*Needs:* L3.19, `PowerSeries.isRestricted_iff`, `IsUltrametricDist`.

### L3.21 Evaluation of the rotated transform including its removable point

**Lemma.** Under the same norm hypotheses, for `|t|<1, G_(b,w)(t)=R_b(w(1+t))/Q_b(w(1+t))`. In characteristic zero, when `w(1+t)=1` this value is `(b-1)/2`; the two separate reciprocal terms must not be evaluated there. (RJW (7.7)–(7.8), v2, p. 42; published printed, p. 157.)

Standing hypotheses of this target: (C11).

*Proof sketch.* L3.20 justifies evaluation of the single series. Multiply by the finite polynomial `Q_b(w(1 + T))`; finite distribution of convergent sums gives `Q_b(w(1 + t))·G(t) = R_b(w(1 + t))` directly from the defining product with the formal inverse. The point `w(1 + t)` lies in the disc of 1. L3.17 gives norm one for `Q_b(w(1 + t))`, so divide to obtain the quotient. At the removable point the finite numerator sum is `b(b − 1)/2` and the denominator is `b`, giving `(b − 1)/2` in characteristic zero.

*Needs:* L3.20, L3.17, L3.18, `PowerSeries.mul_inv_cancel`.

### L3.22 Comparison with the separate reciprocal formula away from the centre

**Lemma.** For `b≥1` and `w` in a field `K` with `w≠1` and `w^b≠1`, the explicit `G_(b,w)` equals `(w(1+T)-1)^(-1)-b*(w^b(1+T)^b-1)^(-1)` in `K[[T]]`. These hypotheses ensure both separate denominators have nonzero constant coefficient. They hold for `w` a nontrivial `p`-power root of unity and `b` prime to p. This identity is not extended to `w=1`. (RJW §3.5.2, p. 20; Lem. 4.3, p. 27.)

*Proof sketch.* The finite geometric identity gives `(w-1)Q_b(w)=w^b-1`, so `Q_b(w)≠0`. Put `W=w(1+T)`. Both `W-1` and `W^b-1` are units since their constant terms are nonzero. Using `(W-1)Q_b(W)=W^b-1` and `(W-1)R_b(W)=Q_b(W)-b`, multiply both sides of the asserted formula by `(W-1)(W^b-1)`. The resulting finite polynomial identity holds by telescoping. Cancel the unit product using the pinned formal inverse cancellation theorem.

*Needs:* L3.18, `geom_sum_mul`, `PowerSeries.mul_inv_cancel`.

### L3.23 Amice transform of the rotated smoothing measure

**Lemma.** Let `μ_b` be the actual DirichletPadicLFunctions §1.2 (arithmetic smoothing measure), extended to `O_K` by the bounded coefficient-extension interface of PadicMeasuresIwasawaAlgebras Layer 2. For `|w-1|<1`, multiplication by the continuous character `x→w^x` gives a bounded measure `w^x μ_b` with Amice transform `G_(b,w)` of rotated-smoothed-transform. In particular `w=1` recovers the existing `F_b`, and the derivative of the smoothed-polylog expansion must use `G_(b,w)`, also at its centre. (RJW §3.5.2, v2, p. 20; Def. 4.5, p. 27; (7.7)–(7.8), p. 42.)

Standing hypotheses of this target: (C10).

*Proof sketch.* Use the smoothed measure of DirichletPadicLFunctions Layer 1 and its Amice transform; bounded `O_K` coefficient extension and continuous rotation come from PadicMeasuresIwasawaAlgebras Layer 2. The pinned `ℤ_p`-valued Amice equivalence alone does not construct arbitrary `O_K` coefficients. The bounded rotation formula of PadicMeasuresIwasawaAlgebras Layer 2 identifies the analytic transform on `|T| < 1` with the analytic function obtained by evaluating `F_b` at `w(1 + T) − 1`. Here `|w(1 + T) − 1| < 1`, so bounded coefficients ensure convergence. This means analytic evaluation, never unconditional power-series substitution at a nonzero constant. Use the finite polynomial quotient and whole-disc evaluation of L3.21 to identify this analytic function with `G_(b,w)`, including points with `w(1 + T) = 1`. Uniqueness of the single power series on the disc identifies the two Amice transforms. Coefficient extension commutes with the coefficient map of power series; the finite polynomial formulas commute with the coefficient homomorphism. In L3.25, the differential recursion gives the `k`-fold derivative `Φ_b^(0)(w(1+T))`; its pole-cancelled expression is `G_(b,w)`. Then L3.27 uses the existing distribution-primitive theorem without an incorrect zero transform at `w=1`.

*Needs:* L3.18, L3.21, DirichletPadicLFunctions Layer 1, PadicMeasuresIwasawaAlgebras Layer 2, `HasFPowerSeriesAt.eq_formalMultilinearSeries`.

### L3.24 The twisted smoothed measure as a combination of rotated smoothed measures

**Lemma.** Let `χ` be primitive of conductor `p^n (n≥1), ε = ε_{p^n}` a `primitive p^n`-th root of unity in `L, G(χ^{-1}) = sum_c χ^{-1}(c) ε^c`, and `b > 1` an integer prime to p. For `c` in `(Z/p^nZ)^x` the measure `(ε^c)^x μ_b` (multiplication by the continuous function `x→ε^{cx}`, defined because `|ε^c - 1| < 1`) has Amice transform `F_b((1+T) ε^c - 1)`, and `μ_{χ,b} = (μ_b)_χ = G(χ^{-1})^{-1} sum_{c in (Z/p^nZ)^x} χ^{-1}(c) (ε^c)^x μ_b`. (RJW Lem. 5.4, p. 30; RJW §3.5.2, p. 20.)

*Proof sketch.* RJW Lemma 5.4 applied to `μ = μ_b` (DirichletPadicLFunctions Layer 2): `A_{μ_{χ,b}}(T) = G(χ^{-1})^{-1} sum_c χ^{-1}(c) F_b((1+T) ε^c - 1)`. RJW §3.5.2: for `|z - 1| < 1, A_{z^x μ}(T) = A_μ((1+T) z - 1)` (PadicMeasuresIwasawaAlgebras Layer 2). Compare Amice transforms (Mathlib `AbstractMeasure.injective_amiceTransform`). Use `G_(b,ε^c)` for each rotated Amice transform; L3.23 provides the measure comparison. For the nontrivial `primitive p`-power roots used here, `ε^c ≠ 1` and `(ε^c)^b ≠ 1`; L3.22 identifies `G` with the separate reciprocal expression, preserving that specialization while also defining the centre correctly.

*Needs:* DirichletPadicLFunctions Layer 0, DirichletPadicLFunctions Layer 1, DirichletPadicLFunctions Layer 2, PadicMeasuresIwasawaAlgebras Layer 2, `AbstractMeasure.injective_amiceTransform`, L3.23, L3.22.

### L3.25 The smoothed polylogarithm on the residue disc of 1

**Construction.** For `b>1` prime to `p`, set `Φ_b^(k)(z)=−Li_k(z)+b^(1−k)Li_k(z^b)+(b−1)log(z)^k/k!` on `D⁻(1,1)∖{1}`. It extends branch independently across 1. `Φ_b^(0)=F_b(z−1)`, equal to `1/(z−1)−b/(z^b−1)` off 1 and `(b−1)/2` at 1; `z(Φ_b^(k))′=Φ_b^(k−1)`. For `w∈D⁻(1,1)` in finite `K/ℚ_p, Φ_b^(k)(w(1+T))∈R⁺` and `∂^k` equals the rotated-smoothed Amice transform `G_(b,w)`. Composition denotes convergent evaluation. At the centre, `Φ_b^(1)(1)=−log_p b`, and `Φ_b^(k)(1)=−(1−b^(1−k))Li_k(1)` for `k≥2`. (RJW §7, (7.5), p. 42; BDJ-preprint §2, p. 10; BDJ-preprint Prop. 2.6, p. 10.)

Standing hypotheses of this target: `b > 1` an integer prime to `p` (for `b = 1` the combination is 0). `Li_k` with any branch `log_λ`; the combination is branch independent.

- `smoothedPolylog`: `Φ^{(k)}_b`, a rigid analytic function on `D^-(1,1)`.
- `smoothedPolylog_analyticOnNhd`: `Φ^{(k)}_b` is analytic on `D^-(1,1)`, with the values at `z = 1` given by `smoothedPolylog_one` (removable singularity).
- `smoothedPolylog_eq`: `Φ^{(k)}_b(z) = -Li_k(z) + b^{1-k} Li_k(z^b) + (b-1) log(z)^k/k!` for `z` in `D^-(1,1), z≠1`.
- `smoothedPolylog_zero`: For `z≠1` in the disc of `1, Φ_b^(0)(z)=1/(z-1)-b/(z^b-1)`; at `z=1` its pole-cancelled value is `(b-1)/2`.
- `smoothedPolylog_deriv`: For `k≥1, z d/dz Φ_b^(k)=Φ_b^(k-1)`.
- `smoothedPolylog_one`: `Φ^{(1)}_b(1) = -log_p(b)`; `Φ^{(k)}_b(1) = -(1 - b^{1-k}) Li_k(1)` for `k≥2`.
- `smoothedPolylog_rootOfUnity`: For `k≥1` and `ζ` in `μ_(p^∞), ζ≠1`: `Φ_b^(k)(ζ)=-Li_k(ζ)+b^(1-k)Li_k(ζ^b)`, since `log(ζ)=0`. At `k=0` retain the additional constant `b-1`.
- `smoothedPolylog_expansion`: `Ftilde_(b,w)^(k)(T)=Φ_b^(k)(w(1+T))` lies in `R^+` and its `k`-fold `(1+T)d/dT` image is `G_(b,w)`, identified with `A_(w^x μ_b)` by rotated-smoothed-amice, including `w=1`.
- `smoothedPolylog_branch_independent`: `Φ^{(k)}_b` computed with any two branches `log_λ, log_λ'` is the same function.

*Construction.* L2.4: on `D^-(1,1)` minus `{1}, Li_k(z) = -(log z)^{k-1} log_λ(1 - z)/(k-1)! + h_k(z)` with `h_k` analytic on `D^-(1,1) (k ≥ 1)`. Since `log(z^b) = b log z` on `D^-(1,1), b^{1-k} (log z^b)^{k-1} = (log z)^{k-1}`, so `Φ^{(k)}_b(z) = ((log z)^{k-1}/(k-1)!) log_λ((1 - z)/(1 - z^b)) - h_k(z) + b^{1-k} h_k(z^b) + (b - 1)(log z)^k/k!`. `(1 - z^b)/(1 - z) = 1 + z +` ... `+ z^{b-1}` is analytic on `D^-(1,1)`, equals `b` at `z = 1` and has no zero there (a zero would be `a b`-th root of unity `≠ 1` in `D^-(1,1)`, impossible as `p` does not divide `b`); so the negative logarithm of it occurring in step 2 is `-log_p(b) - log((1 + ... + z^{b-1})/b)`, analytic and branch independent (L0.16). Hence `Φ^{(k)}_b` is analytic on `D^-(1,1)`; for `k = 0` the poles of the two rational terms cancel directly. (a) is algebra with `Li_0(z)=z/(1-z)` off `z=1`, followed by the finite pole-cancelled quotient `R_b(z)/Q_b(z)` at the centre; separate scalar reciprocals are not evaluated at `z=1`. (b): `z d/dz Li_k(z) = Li_{k-1}(z), z d/dz Li_k(z^b) = b Li_{k-1}(z^b), z d/dz (log z)^k/k! = (log z)^{k-1}/(k-1)!`. (c): `w(1 + T)` runs through `D⁻(1, 1)` for `|T| < 1`. Under `z = w(1 + T), (1 + T)d/dT = z d/dz`. The `k`-fold derivative is therefore the single power series for the regularized `Φ_b^(0)`, namely `G_(b,w)` by L3.21 and power-series uniqueness; L3.23 identifies this with `A_(w^x μ_b)`, using the bounded coefficient extension and rotation of PadicMeasuresIwasawaAlgebras Layer 2. (d): as `z → 1, (log z)^{k-1} log_λ((1-z)/(1-z^b)) → 0` for `k ≥ 2` and `(log z)^k → 0`, so `Φ^{(k)}_b(1) = -(1 - b^{1-k}) h_k(1)` and `h_k(1) = Li_k(1)`; for `k = 1, Φ^{(1)}_b(1) = log(1/b) = -log_p(b)`. Branch independence: `Li_{k,λ}(z) - Li_{k,λ'}(z) = -v(1 - z)(λ - λ')(log z)^{k-1}/(k-1)!` on `D^-(1,1)` (Besser-de Jeu Proposition 2.6) and `v(1 - z^b) = v(1 - z)`.

*Needs:* L2.5, L2.4, L0.18, LocallyAnalyticDistributions Layer 1, PadicMeasuresIwasawaAlgebras Layer 2, L2.11, L0.16, DirichletPadicLFunctions Layer 1, L3.21, L3.23.

**Checks.**

- `Φ^{(1)}_b(1+T) = log(T(1+T)^{b-1}/((1+T)^b - 1))`, with value `-log_p(b)` at `T = 0` (RJW (7.8)).
- `Φ^{(0)}_b(1+T) = F_b(T)` in `ℤ_p[[T]]`, and `Φ^{(0)}_b(1) = (b - 1)/2`.
- For `b = 1` the defining combination is identically 0 for `k`.
- For `k≥1` neither `-Li_k(z)` nor `b^{1-k} Li_k(z^b)` alone is analytic on `D^-(1,1)`: each contains `-+(log z)^{k-1} log_λ(1 - z)/(k-1)!`.
- `Φ^{(k)}_b` computed with `log_λ` and with the Iwasawa branch coincide.

### L3.26 The distribution relation for the smoothed polylogarithm on the residue disc of 1

**Lemma.** For `b > 1` prime to `p` and `k≥0`: `sum_{ξ in μ_p} Φ^{(k)}_b(ξ w) = p^{1-k} Φ^{(k)}_b(w^p)` for `w` in `D^-(1,1)`, including `w` in `μ_p`. (BDJ-preprint §2, (2.4), p. 10; RJW proof of Lem. 7.5, p. 42.)

*Proof sketch.* For `w` with `w^p ≠ 1`: apply L2.8 (`sum_{ξ in μ_p} Li_k(ξ z) = p^{1-k} Li_k(z^p)` for `z^p ≠ 1`) at `z = w` and at `z = w^b` (`w^{bp} ≠ 1` as `p` does not divide `b`), and use `sum_{ξ in μ_p} log(ξ w)^k/k! = p log(w)^k/k! = p^{1-k} log(w^p)^k/k!`, since `log ξ = 0`. Both sides are rigid analytic on `D^-(1,1)` (L3.25; `w → w^p` maps `D^-(1,1)` into itself) and agree off the finite set `μ_p`, so they agree everywhere by the identity theorem for power series on a disc.

*Needs:* L3.25, L2.8, L0.18.

### L3.27 Negative moments of the rotated smoothed measure

**Lemma.** Let `b > 1` be an integer prime to `p, w` in `D^-(1,1)` lying in a finite extension `K` of `ℚ_p`, and `k≥1`. Then `∫_(ℤ_p^×) x^{-k}` . `(w^x μ_b) = Φ^{(k)}_b(w) - p^{-k} Φ^{(k)}_b(w^p)`. In particular, at `w = 1, ∫_(ℤ_p^×) x^{-k}` . `μ_b = (1 - p^{-k}) Φ^{(k)}_b(1)`. (RJW Lem. 7.5, p. 42.)

*Proof sketch.* L3.25 gives Ftilde`=Φ_b^(k)(w(1+T))` in `R^+`. Its `k`-fold derivative is the pole-cancelled `G_(b,w)`, including `w=1`. L3.23 identifies this with `A_(w^x μ_b)`, retaining the exact bounded coefficient-extension/rotation supplier obligation. L3.6: `∫_(ℤ_p^×) x^{-k}` . `(w^x μ_b) = Φ^{(k)}_b(w) - p^{-1} sum_{ξ in μ_p} Φ^{(k)}_b(ξ w)`. L3.26: `p^{-1} sum_ξ Φ^{(k)}_b(ξ w) = p^{-k} Φ^{(k)}_b(w^p)`.

*Needs:* L3.25, L3.6, L3.26, DirichletPadicLFunctions Layer 1, L3.23.

### L3.28 Coleman's formula for the p-adic L-values `L_p(θ ω^{1-k}, k)`

**Theorem.** For odd `p`, nontrivial `primitive θ` of conductor `N≥2, primitive ε_N` and character values in finite `L/ℚ_p` containing `μ_N`, prove for `k≥1`: `L_p(θω^(1−k),k)=(1−θ(p)p^(−k))G(θ⁻¹)⁻¹Σ_c θ⁻¹(c)Li_k(ε_N^c)`, with Iwasawa `Li_k` and RJW Definition 5.18 normalization. `θ(p)=0` if `p|N`. For `N` not `a p`-power the right side is `G⁻¹Σ_cθ⁻¹(c)Li_k^(p)(ε_N^c)=G⁻¹Σ_cθ⁻¹(c)∫_(ℤ_p^×)x^(−k)dμ_(ε_N^c)`. Retain the `ω^(1−k)` twist suppressed in RJW's printed theorem; include pure `p`-power conductors by smoothing. (RJW Thm. 6.7(ii), p. 39; p. 154 published; BHYY Thm. 1.1, p. 2; BBdJR proof of Prop. 4.17, p. 22.)

Standing hypotheses of this target: `p` odd (RJW's `L_p` is defined for odd `p`). `θ` nontrivial primitive of conductor `N = D p^n`, any `D≥1` prime to `p` and `n≥0`. `k≥1` an integer. `Li_k` for the Iwasawa branch; the right side is the same for branch (L3.35).

*Proof sketch.* Case `D > 1`. L3.1 gives `L_p(θ ω^{1-k}, k) = ∫_(ℤ_p^×) x^{-k}` . `μ_θ`, and L3.4 rewrites it as `G(θ^{-1})^{-1} sum_c θ^{-1}(c) ∫_(ℤ_p^×) x^{-k}` . `μ_{ε_N^c}`. L3.7 `(|ε_N^c| = |ε_N^c - 1| = 1)` gives `∫_(ℤ_p^×) x^{-k}` . `μ_{ε^c} = Li_k(ε^c) - p^{-k} Li_k(ε^{pc})`; L3.10 turns the sum into `(1 - θ(p) p^{-k}) sum_c θ^{-1}(c) Li_k(ε^c)`. Case `D = 1, N = p^n, θ = χ`. Choose `b > 1` prime to `p` with `χ(b) b^{1-k} ≠ 1`. L3.2 and L3.24 give `L_p(χ ω^{1-k}, k) = (χ(b) b^{1-k} - 1)^{-1} G(χ^{-1})^{-1} sum_c χ^{-1}(c) ∫_(ℤ_p^×) x^{-k}` . `((ε^c)^x μ_b)`. L3.27: the inner integral is `Φ^{(k)}_b(ε^c) - p^{-k} Φ^{(k)}_b(ε^{pc})`. The second terms sum to 0 against `χ^{-1}` (L3.9: `ε^{pc}` depends only on `c` mod `p^{n-1}`, and equals 1 when `n = 1`). `ε^c ≠ 1, ε^{bc} ≠ 1` and `log ε^c = 0`, so `Φ^{(k)}_b(ε^c) = -Li_k(ε^c) + b^{1-k} Li_k(ε^{bc})` (L3.25); reindexing `c → b^{-1} c` gives `sum_c χ^{-1}(c) Li_k(ε^{bc}) = χ(b) sum_c χ^{-1}(c) Li_k(ε^c)`. The total is `-(1 - χ(b) b^{1-k}) sum_c χ^{-1}(c) Li_k(ε^c)`; dividing by `χ(b) b^{1-k} - 1` gives `G(χ^{-1})^{-1} sum_c χ^{-1}(c) Li_k(ε^c)`, the claim since `χ(p) = 0`. The right side does not depend on `ε_N` (L3.11).


*Needs:* L3.1, L3.2, L3.4, L3.24, L3.7, L3.27, L3.10, L3.9, L3.11, L3.25, L2.5, L0.18, `PadicComplex`, L2.25, L2.27, L2.26, L2.18.

**Checks.**

- For `p = 5, θ = χ_(−3), k = 2`, the formula gives the nonzero twisted value `L_5(θω⁻¹, 2)`; the untwisted `L_5(θ, 2)` vanishes by parity.
- A primitive character of conductor 9 at `p = 3` has `θ(p) = 0`; the Euler factor is 1, and smoothing supplies the formula.
- At `k = 1`, the twist is `ω⁰ = 1`, and the formula recovers Leopoldt's logarithmic expression.

### L3.29 Coleman's formula for the trivial character

**Theorem.** For `p` odd and every integer `k≥2`: `L_p(ω^{1-k}, k) = ∫_(ℤ_p^×) x^{1-k}` . `ζ_p = (1 - p^{-k}) Li_k(1)`, where `Li_k(1)` is the limit of Coleman's `Li_k(z)` as `z→1` inside any finitely ramified extension of `ℚ_p` (L2.11). (BBdJR proof of Prop. 4.17, p. 23; BDJ-preprint §2, p. 10.)

*Proof sketch.* RJW Definition 5.18 and `ω(x) <x> = x`: `L_p(ω^{1-k}, k) = ∫_(ℤ_p^×) x^{1-k}` . `ζ_p = (b^{1-k} - 1)^{-1} ∫_(ℤ_p^×) x^{-k}` . `μ_b` for any integer `b > 1` prime to `p`, since `b^{1-k} ≠ 1` (DirichletPadicLFunctions Layer 1, RJW (3.11) via PadicMeasuresIwasawaAlgebras Layer 3). L3.27 at `w = 1`: `∫_(ℤ_p^×) x^{-k}` . `μ_b = (1 - p^{-k}) Φ^{(k)}_b(1)`. L3.25 (d): `Φ^{(k)}_b(1) = -(1 - b^{1-k}) Li_k(1)`; combine.

*Needs:* L3.27, L3.25, DirichletPadicLFunctions Layer 1, DirichletPadicLFunctions Layer 3, PadicMeasuresIwasawaAlgebras Layer 3, L2.4, L2.11.

**Checks.**

- For even `k ≥ 2`, both the interpolating Bernoulli values and `Li_k(1)` vanish by parity.
- At `k = 3`, distribution gives `Li_3(−1) = −3Li_3(1)/4`, compatible with L3.36's coefficient `2/3` in the raw-symbol convention.
- At `p = 2`, L3.36(b) uses the conductor-4 character `ω_2` of order 2 in the twist, including its sign on odd units; the order `p − 1 = 1` would lose this character.

### L3.30 Coleman's formula for `L_p(θ, k)` itself, in the normalisation of RJW

**Theorem.** Let `p` be odd, `θ = χ*η` a Dirichlet character as in RJW Definition 5.18, `k≥1`, and `ψ` the primitive character attached to `θ ω^{k-1}`, of conductor `N_ψ`. If `ψ` is nontrivial, `L_p(θ, k) = (1 - ψ(p) p^{-k}) G(ψ^{-1})^{-1} sum_{c in (Z/N_ψ Z)^x} ψ^{-1}(c) Li_k(ε_{N_ψ}^c)`. If `ψ` is trivial `(θ = ω^{1-k})` and `k≥2, L_p(θ, k) = (1 - p^{-k}) Li_k(1)`. In particular the character normalization in RJW Theorem6.`7(ii)` agrees with the corrected normalization when `ψ=θ`, equivalently `(p-1)` divides `k-1`. Outside this congruence the characters differ; numerical values may nevertheless coincide, for example when both vanish, so no iff about equality of values is claimed. (RJW Rem. 5.19 and Thm. 5.20, p. 35; BBdJR §1, p. 3.)

Standing hypotheses of this target: `p` odd; `k≥1`; for trivial `ψ, k≥2` (at `k = 1` the trivial component has the pole of RJW Theorem 7.1).

*Proof sketch.* `L_p(θ, s)` depends only on the restriction of `θ` to `ℤ_p^× x` (`Z/`DZ)`^x`, so `L_p(θ, k) = L_p(ψ ω^{1-k}, k)` (DirichletPadicLFunctions Layer 3). For nontrivial `ψ` apply L3.28 to `ψ`; for trivial `ψ` apply L3.29. `ω^{k-1} = 1` if and only if `(p - 1) | (k - 1)`, since `ω` has order `p - 1`.

*Needs:* L3.28, L3.29, DirichletPadicLFunctions Layer 3.

### L3.31 `k = 1` recovers Leopoldt's formula and the complex value at `s = 1`

**Comparison.** At `k = 1`, L3.28 is RJW Theorem 6.1(ii): `L_p(θ, 1) = -(1 - θ(p) p^{-1}) G(θ^{-1})^{-1} sum_c θ^{-1}(c) log_p(1 - ε_N^c)`, because `ω^0 = 1` and `Li_1(z) = -log_p(1 - z)` for the Iwasawa branch; and at `k = 1` L3.13 is RJW Theorem 6.1(i). The proof of L3.28 covers both conductor cases of RJW §6.2: tame part `D > 1` (including `n = 0`) through the geometric measures and the distribution relation, and pure `p`-power conductor `D = 1` through the smoothed measure. (RJW Thm. 6.1, p. 36; RJW Rem. 6.6, p. 39.)

Standing hypotheses of this target: `θ` nontrivial primitive of conductor `N`; `p` odd.

*Proof sketch.* Specialise L3.28 to `k = 1` and use `Li_1(z) = -log_p(1 - z)` (L2.5, L0.18). Compare with the statement of RJW Theorem 6.1, whose owner is DirichletPadicLFunctions Layer 3.

*In `Suggested.lean`:* `LFunction_one_eq_gaussSum_inv_mul_sum_complexPolylog` for the complex weight-one comparison.

*Needs:* L3.28, L3.13, L2.5, L0.18, DirichletPadicLFunctions Layer 3.

**Checks.**

- At `k = 1` the Teichmüller exponent is zero, so no character twist remains.
- For the primitive character `χ_(−4)` of conductor 4, the complex formula gives `L(χ_(−4), 1) = π/4` from the values at `i` and `−i`.
- The trivial character of conductor 1 is excluded at weight one, where its complex L-function has a pole.

### L3.32 Comparison with the locally analytic distribution argument of RJW §6.2

**Comparison.** At `k=1` and tame part `D>1`, RJW's `F̃_θ=−G⁻¹Σ_cθ⁻¹(c)log((1+T)ε_N^c−1)` is `G⁻¹Σ_cθ⁻¹(c)F̃_(ε_N^c)^(1)`, since `log_p(−1)=0`. Identify his Lemmas 6.4–6.5 and (6.5) with the primitive, `x·μ̃=μ` and unit-moment targets; the root-log identity is weight-one distribution. For `D=1, F_θ` is not an Amice transform: use the smoothed `μ_a` and §7's `F̃_a=Φ_a^(1)(1+T)`. For all `k≥1` replace `Li_1` by `Li_k`, using `∂=z d/dz, Li_0=z/(1−z), Σ_cθ⁻¹(c)=0` and `Σ_(ξ∈μ_p)Li_k(ξz)=p^(1−k)Li_k(z^p)` to obtain the primitive and Euler factor. (RJW proof of Lem. 6.4, p. 37; RJW proof of Lem. 6.4, p. 38;, p. 152 published; RJW §7, (7.5), p. 42.)

Standing hypotheses of this target: `k≥1`; `θ` nontrivial primitive.

*Proof sketch.* Expand `log((1+T) ε - 1) = log_p(ε - 1) + log(1 + ε T/(ε - 1))` (RJW proof of Lemma 6.4) and compare with `Ftilde^{(1)}_{ε}(T) = -log(1 - ε) - log(1 - ε T/(1 - ε))`; `log_p(-1) = 0`. Signs: `F_θ = -G^{-1} sum θ^{-1}(c)/((1+T) ε^c - 1) = G^{-1} sum θ^{-1}(c) Li_0((1+T) ε^c)` (L3.4) and `Ftilde_θ = G^{-1} sum θ^{-1}(c) Li_1((1+T) ε^c)`, consistent with `-log(z - 1) = Li_1(z) + log_p(-1)`. For `D = 1` the rational function `F_θ` has simple poles at `T = ε^{-c} - 1`, of absolute value `|ε - 1| < 1`, with nonzero residues, so its expansion at 0 has radius `|ε - 1|` and it is not in `R^+` (RJW Theorem 3.43); RJW's step `Ftilde_θ = (Ftilde_η)_χ` needs `Ftilde_η` in `R^+`, which fails for `η = 1 (Ftilde_1 = -log T)`. RJW §7 (7.5): `Ftilde_a(T) = log(T (1+T)^{a-1}/((1+T)^a - 1)) = Φ^{(1)}_a(1+T)` (L3.25).

*Needs:* L3.5, L3.6, L3.7, L3.27, L3.25, L3.4, L3.28, DirichletPadicLFunctions Layer 3, LocallyAnalyticDistributions Layer 1.

### L3.33 Comparison with the bounded-measure argument of Bannai-Hagihara-Yamada-Yamamoto

**Comparison.** For `N` not `a p`-power, identify BHYY's negative moments with `∫_(ℤ_p^×)x^(−k)dμ_w=Li_k^(p)(w)` on `|w|≤1, |w−1|=1` in finite extensions. For `k≤0` use moments and `t d/dt` of `t/(1−t)−t^p/(1−t^p)`; for `k>0` use uniform convergence `x^(−k+(p−1)p^r)→x^(−k)` on `ℤ_p^×`. The distribution route instead gives `Li_k(w)−p^(−k)Li_k(w^p)` from Coleman disc analyticity. Comparing the two proves the Frobenius relation on this domain. (BHYY proof of Prop. 5.6, p. 28; BHYY §1, p. 2.)

Standing hypotheses of this target: `w` in a finite extension of `ℚ_p, |w|≤1, |w - 1| = 1`; `k` any integer for BHYY's side, `k≥1` for the distribution side.

*Proof sketch.* Both sides equal `∫_(ℤ_p^×) x^{-k}` . `μ_w`: L3.8 (BHYY's limit) and L3.7. BHYY's route needs neither Coleman integration nor locally analytic distributions, but reaches Coleman's `Li_k` only through the Frobenius relation (L2.15); the distribution route needs the distribution relation (L2.8). Each gives a public proof of L3.28 for `N` not a power of p.

*Needs:* L3.7, L3.8, L3.28, L2.5, L2.8, L2.15.

### L3.34 Coleman's polylogarithms versus arbitrary locally analytic solutions

**Comparison.** Perturbing `Li_k` by `δ1_U, δ≠0`, on a disc containing one `ε_N^(c_0)` and no other `N`-th root preserves the local ODE and lower weights but changes the formula by `(1−θ(p)p^(−k))δθ⁻¹(c_0)/G≠0`. Coleman uniqueness or distribution excludes the perturbation. For tame/mixed roots, choose `U` a proper clopen subdisc of the whole residue disc: its indicator cannot be one power series on that whole disc by the identity principle, so its multiplicative pullback has no open-unit-disc Amice transform. Pure `p`-power roots have their original singularity inside that parameter disc and require smoothing. (BF Section3, remark after Proposition3.1, preprint p6; BDJ-preprint §2, p. 9.)

Standing hypotheses of this target: `p` odd, `θ` nontrivial primitive, `k≥1`.

*Proof sketch.* A locally analytic function with zero derivative is locally constant; conversely `Li_k + δ 1_U` is locally analytic with the same derivative. The `sum sum_c θ^{-1}(c) Λ_k(ε^c)` changes by `δ θ^{-1}(c_0)`, and the Euler factor `1 - θ(p) p^{-k}` is unchanged. Uniqueness within the Coleman category: L1.18. The Amice-transform counterexample requires the tame/mixed condition `|ε-1|=1` and a proper subdisc `U`; a perturbation constant on the whole residue disc would itself have a constant power-series transform there.

*Needs:* L3.28, L3.5, L1.18, L2.4, L2.8.

### L3.35 Independence of the root of unity, the branch and the Frobenius lift

**Comparison.** The formula is independent of the primitive root, branch and Frobenius lift. Root independence follows from the compatible `θ(b)` factors in Gauss and polylogarithm sums. For `k≥2` root values are branch independent; for `k=1` their branch difference `−v(1−ζ)(λ−λ′)` is constant on primitive `N`-th roots and the nontrivial character sum cancels it. Coleman uniqueness gives lift independence. The construction with any branch and lift yields the same `L`-value normalization. (BDJ-preprint Prop. 2.6, p. 10; BDJ-preprint §2, p. 9.)

Standing hypotheses of this target: `θ` nontrivial primitive, `k≥1`.

*Proof sketch.* (a) by the cited lemma; (b) by Besser-de Jeu Proposition 2.6 (supplied through L0.16 and L2.10); (c) by L1.22 and the normalized existence theorem; uniqueness for a fixed datum alone does not compare different lifts. The proof steps of L3.28 use only the differential equations, the analyticity on residue discs and the distribution relation, which hold for every branch and every admissible lift.

*Needs:* L3.28, L3.11, L1.18, L0.18, L2.10, L2.17, L0.16, L1.22.

### L3.36 Parts `(1)`–`(3)` of the p-adic Beilinson conjecture for Dirichlet motives

**Theorem.** (BBdJR Proposition 4.17.) Let `N ≥ 2, k = ℚ(μ_N), G = (ℤ/Nℤ)^×, E` a number field containing a root of unity of order the exponent of `G, χ` an irreducible character of `G` with idempotent `π`, and `n ≥ 2` with `χ(−1) = (−1)^(n−1)`. Then `dim_E E[G]π = dim_E πK_(2n−1)(k)_E = 1`, and parts `(1), (2)` and `(3)` of `PBC(k, E, π, n, p)` hold with `e(n, M^E_π) = e_p(n, M^E_π) ∈ ℚ^×`.
For nontrivial `χ`, reduce first to its primitive character of conductor `f` and the field `ℚ(μ_f)`, using the fixed-field and idempotent transport of BBdJR Remark 3.23(1), p. 15. The explicit bases `π, π(1 ⊗ ζ_f)` and `π(1 ⊗ [ζ_f]_n)` and the Gauss-sum determinant calculation of L3.Fc.3 are used in this conductor field; their compatible images give bases after transport. For trivial `χ` use `ℚ` and the bases `1, 1 ⊗ 1` and `1 ⊗ [−1]_n`, with `n` odd. The algebraic vector `π(1 ⊗ ζ_N)` need not be nonzero for an imprimitive character.
(a) For `p` odd this follows from L3.28, L3.13 and the regulator computations, in the normalization of L3.Fd.2.
(b) For `p = 2` the same statement holds with the dyadic normalization: `ω_2` is the character of conductor 4 with values `±1` (L3.Fd.2), the p-adic `L`-function lives on the ball of radius `4·2^(−1) = 2`, and the required input for the primitive character of conductor `f` is Coleman's formula `L_2(χω_2^(1−n), n) = (1 − χ(2)2^(−n)) G(χ⁻¹)⁻¹ Σ_(c∈(ℤ/fℤ)^×) χ⁻¹(c) Li_n(ε_f^c)` at `p = 2`, together with the trivial-character case `L_2(ω_2^(1−n), n) = (1 − 2^(−n)) Li_n(1)` for `n` odd. BBdJR quote this formula from Coleman for all primes (proof of Proposition 4.17, p. 22, and p. 23 for `N = 2`). The measure-theoretic proof of L3.28 is written for odd `p`; at `p = 2` its steps must be redone with principal units `1 + 4ℤ_2`, the conductor`-4` Teichmüller character and the smoothing of L3.2 with `b` odd, and the trivial-character case uses the limit `Li_n(1)` of L2.11 (BBdJR Prop. 4.17, p. 22; BBdJR Rem. 4.19, p. 23).

Standing hypotheses of this target: `N ≥ 2`; `χ(−1) = (−1)^(n−1)`; `E` contains the values of `χ`; `p` odd in (a) and `p = 2` in (b). The unit assertions are part `(4)` of L3.16 and remain separate conjectural conditions; BBdJR Remark 4.19, p. 23, reports numerical verifications of them.

*Needs:* L3.28, L3.29, L3.13, L3.15, L3.16, L3.Fa.5, L3.Fc.1, L3.Fc.3, L3.Fd.1, L3.Fd.2, DirichletPadicLFunctions Layer 0.

**Checks.**

- `N = 3, n = 2`: `χ` the nontrivial character mod 3 has `χ(−1) = −1 = (−1)^(2−1)`, so the `χ`-part of `K_3(ℚ(μ_3))_E` is one-dimensional and the proposition applies.
- `N = 3, n = 3`: `χ(−1) = −1 ≠ (−1)^(3−1) = 1`, so `πK_5(ℚ(μ_3))_E = 0` and the proposition does not apply to `χ`; the trivial character applies instead (`n` odd).
- `N = 4, χ` trivial, `n = 3`: `π = (1 + c)/2` satisfies `π(1 ⊗ i) = 0` although `dim πK_5(ℚ(i))_E = 1`. Reduce to `ℚ` and use `1 ⊗ 1` and `1 ⊗ [−1]_3`; using `i` as an algebraic basis would make the discriminant determinant zero. This does not invalidate the cyclotomic `K`-class basis: distribution gives `[−1]_3 = 8[i]_3`.
- `N = 2`: `χ` trivial, `π = 1, n` odd; then `e(n) = e_p(n)` is computed from `ζ(n) = 2^(n−1)(1 − 2^(n−1))⁻¹ P_n(−1)` and its p-adic analogue.

### L3.37 Coleman's formula as a formula for syntomic regulators

**Comparison.** Let `θ` be a nontrivial primitive Dirichlet character of conductor `N≥2, n≥2, F = Q(μ_N)` and `σ` : `F→ℂ_p` with `σ(ζ_N) = ε_N`. Then `L_p(θ ω^{1-n}, n) = (-1)^n ((n-1)!)^{-1} (1 - θ(p) p^{-n}) G(θ^{-1})^{-1} sum_{c in (Z/NZ)^x} θ^{-1}(c) reg_σ([ζ_N^c]_n)`, and, when `p` does not divide `N, L_p(θ ω^{1-n}, n) = (-1)^n ((n-1)!)^{-1} G(θ^{-1})^{-1} sum_c θ^{-1}(c) reg^Gros_σ([ζ_N^c]_n)`. (RJW Rem. 6.8, p. 39; BDJ-preprint Rem. 1.13, p. 6.)

Standing hypotheses of this target: `p` odd; `n≥2`; the sign is the one of L3.15.

*Proof sketch.* Substitute `reg_σ([ζ_N^c]_n) = (-1)^n (n-1)! Li_n(ε_N^c)` (L3.15) into L3.28. For `p` not dividing `N, reg^Gros_σ([ζ^c]_n) = (-1)^n (n-1)! (Li_n(ε^c) - p^{-n} Li_n(ε^{pc}))`, and L3.10 removes the Euler factor.

*Needs:* L3.28, L3.15, L3.10, L3.Fb.5, L3.Fb.6.

### Examples

- `p = 5, θ = χ_(−3)` (conductor 3, odd), `k = 2`: `θω^(−1)` is even, so `L_5(θω^(−1), 2)` is the twisted value of Coleman's formula, while the untwisted `L_5(θ, 2)` vanishes by parity (L3.28, L3.30). The twisted value is a unit: for `ζ³ = 1, ζ ≠ 1`, the measure `(μ_ζ − μ_(ζ²))/(ζ − ζ²)` has masses `2/3, −1/3, −1/3, 2/3` on the cosets `1 + 5ℤ₅`, …, `4 + 5ℤ₅` by L3.3. Multiplying these by `a^(−2)` modulo 5 gives `2/3 − 4/3 − 4/3 + 2/3 = −4/3 ≡ 2` mod 5.
- `k = 1` recovers Leopoldt's formula `L_p(θ, 1) = −(1 − θ(p)/p) G(θ⁻¹)⁻¹ Σ_c θ⁻¹(c) log_p(1 − ε_N^c)` (L3.31).
- Trivial character: `L_p(ω^(1−k), k) = (1 − p^(−k)) Li_k(1)` for `k ≥ 2` (L3.29).
- For `p = 3` the geometric measure `μ_(−1)` has total mass `−1/2` and values `−1/2, 1/2, −1/2` on `1 + 3ℤ_3, 2 + 3ℤ_3, 3ℤ_3` (L3.3).
- `L^mod_2(z) = Li_2(z) − (1/2) log(z) Li_1(z)`, and `L^mod_n(ζ) = Li_n(ζ)` at roots of unity `ζ ≠ 1` (L3.14).
- `N = 4, n = 2`: the cyclotomic element `[i]_2` spans `K_3(ℚ(i))_ℚ` and lies in the `χ_(−4)-`part (L3.Fa.5).

### Dependencies

Layers L0–L2; PolylogarithmFunctions §§4.2–4.7; DirichletPadicLFunctions Layers 0–3; PadicMeasuresIwasawaAlgebras Layers 2–3; LocallyAnalyticDistributions Layer 1; AdicSpacesPartIV F1; PadicDifferentialEquationsAndRigidCohomology RD.4–RD.6; GeometryOfNumbersAndQuadraticArithmetic §§6.1.1–6.1.3 and §6.10; TauCetiRoadmap GrothendieckEulerForms Layers 0–2; AlgebraicVectorBundles L0A–L0C; DerivedModuleAlgebra §0.K.1; TauCetiRoadmap AdelicAlgebraicGroups §2.4; TauCetiRoadmap RepresentationTheory (induction and restriction, Layer 6); Mathlib `DirichletCharacter.LFunction`, `gaussSum`, `AbstractMeasure.amiceTransform`.

## Downstream consumers

- **AnabelianGeometryAndNonabelianChabauty**: L1.12–L1.23 and L2.3–L2.18 supply the word algebra, Coleman functions, uniqueness and punctured-line polylogarithms. Its §5.0 must import these targets and retain only the tensor-path comparison through `colemanFunctions_*`, `colemanPrimitive_*` and `colemanDilogarithm_*`.
- **EffectiveDiophantineMethods**: Coleman integrals on curves (Layer L1) for Chabauty–Coleman bounds.
- **Polylogarithms**, **BorelRegulators**, **PadicHodgeRegulators** and **EllipticRegulators**: Coleman's polylogarithms (Layer L2), the modified polylogarithm and the syntomic regulator of cyclotomic elements, and the regulator foundations L3.Fa.1–L3.Fd.2.
- **PadicHodgeTheory**: the unit, zero-count, evaluation and logarithmic-primitive APIs of L0.A1–L0.A2 on PadicDifferentialEquationsAndRigidCohomology’s Laurent and Robba carriers. The carriers, Gauss norms, Robba topology and bounded coefficient rings come from that earlier supplier; this roadmap supplies their Coleman analytic applications.
- **GrossZagierAndArithmeticHeights** and **HabiroNahmSeries**: p-adic polylogarithm values at algebraic points and roots of unity (Layer L2).

## References

Locators give theorem, section and page in the edition listed; published page numbers are marked as such.

- **Weibel:** Charles Weibel, [The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), author copy dated 29 August 2013; IV §6.4, p. 321.
- **Quillen:** Daniel Quillen, [Higher algebraic K-theory I](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf), Lecture Notes in Mathematics 341 (1973), 85–147; locators use the published pagination.
- **Feliu:** Elisenda Feliu, [A chain morphism for Adams operations on rational algebraic K-theory](https://arxiv.org/abs/0808.3882v2), arXiv:0808.3882v2.
- **RJW:** Joaquin Rodrigues Jacinto, Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2), arXiv:2309.15692v2.
- **F:** Hidekazu Furusho, [p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation](https://arxiv.org/abs/math/0304085v2), arXiv:math/0304085v2 (published Invent. Math. 155 (2004)).
- **BT:** Amnon Besser, [Coleman integration using the Tannakian formalism](https://arxiv.org/abs/math/0011269v1), arXiv:math/0011269v1 (published Math. Ann. 322 (2002)).
- **BBK:** Jennifer S. Balakrishnan, Robert W. Bradshaw, Kiran S. Kedlaya, [Explicit Coleman integration for hyperelliptic curves](https://arxiv.org/abs/1004.4936v2), arXiv:1004.4936v2 (ANTS IX, LNCS 6197, 2010).
- **BF:** Amnon Besser, [Finite and p-adic polylogarithms](https://arxiv.org/abs/math/0006051v1), arXiv:math/0006051v1 (published Compositio Math. 130 (2002)).
- **BH:** Amnon Besser, [Heidelberg lectures on Coleman integration](https://www.math.bgu.ac.il/~bessera/Heidelberg-lecture.pdf), author copy dated 7 November 2010, from the author's page.
- **MP:** William McCallum, Bjorn Poonen, [The method of Chabauty and Coleman](https://math.mit.edu/~poonen/papers/chabauty.pdf), author preprint from Poonen's page (published in Panoramas et Syntheses 36, SMF 2012).
- **BDJ:** Amnon Besser, Rob de Jeu, [The syntomic regulator for the K-theory of fields](https://www.numdam.org/item/10.1016/j.ansens.2003.01.003.pdf), Ann. Sci. École Norm. Sup. (4) 36 (2003), 867-924 (version of record).
- **BBdJR:** Amnon Besser, Paul Buckingham, Rob de Jeu, Xavier-François Roblot, [On the p-adic Beilinson conjecture for number fields](https://arxiv.org/abs/0707.3682v2), arXiv:0707.3682v2 (published in Pure Appl. Math. Q. 5 (2009)).
- **BHYY:** Kenichi Bannai, Kei Hagihara, Kazuki Yamada, Shuji Yamamoto, [p-adic polylogarithms and p-adic Hecke L-functions for totally real fields](https://arxiv.org/abs/2003.08157v2), arXiv:2003.08157v2 (25 May 2022).
- **GSWZ:** Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier, [The Habiro ring of a number field](https://arxiv.org/abs/2412.04241v2), arXiv:2412.04241v2.
- **W:** Zdzisław Wojtkowiak, [A note on functional equations of the p-adic polylogarithms](http://www.numdam.org/item/BSMF_1991__119_3_343_0/), Bull. Soc. Math. France 119 (1991), no. 3, 343-370 (version of record).
- **RJW-published:** Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions (version of record)](https://msp.org/ent/2025/4-1/p03.xhtml), Essential Number Theory 4 (2025), no. 1, 101-216.
- **BDJ-preprint:** Amnon Besser and Rob de Jeu, [The syntomic regulator for K-theory of fields](https://arxiv.org/abs/math/0110334v2), arXiv:math/0110334v2.
- **DJ:** Rob de Jeu, [Describing all multivariable functional equations of dilogarithms](https://arxiv.org/abs/2007.11014v1), arXiv:2007.11014v1, 21 July 2020.
- **FPZ:** Xander Faber, Keith Pardue, David Zelinsky, [Cross-Ratios of Scheme-Valued Points](https://arxiv.org/abs/2012.03073v1), arXiv:2012.03073v1, 5 December 2020.
- **Lazard 1962:** Michel Lazard, [Les zéros des fonctions analytiques d'une variable sur un corps valué complet](http://www.numdam.org/item/PMIHES_1962__14__47_0/), Publ. Math. IHÉS 14 (1962), 47–75 (version of record).
- **Kedlaya pde:** Kiran S. Kedlaya, [p-adic Differential Equations](https://kskedlaya.org/papers/p-adic_differential_equations.pdf), Cambridge Studies in Advanced Mathematics 125, Cambridge University Press, 2010; author copy from the author's page; locators use the printed pagination.
- **BC:** Francesco Baldassarri, joint work with Bruno Chiarellotto, [Algebraic versus rigid cohomology with logarithmic coefficients: the 1-dimensional example](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/0773-02.pdf), RIMS Kôkyûroku 773 (1991), pp.7–21.

- **Stacks:** The Stacks Project, [§53.4: Duality, tag 0E31](https://stacks.math.columbia.edu/tag/0E31), Lemmas 53.4.1(6) and 53.4.4(2).
