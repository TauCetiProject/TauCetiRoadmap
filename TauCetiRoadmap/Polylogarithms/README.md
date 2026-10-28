# Roadmap: polylogarithms, explicit regulators and Zagier statements

**Summary.** Turn the real single-valued polylogarithms of PolylogarithmFunctions into regulators. Descend the Bloch–Wigner function to the rational pre-Bloch group and compare it with Borel's regulator and with hyperbolic volume; construct the explicit trilogarithmic complex and its configuration comparison, and express `ζ_F(3)` for every number field by a trilogarithmic determinant of explicit cycles. The inductively defined higher Bloch groups carry the general Zagier statements, separated into rational existence, every-family rationality and a regulator comparison; the explicit weight-four cycles are defined here, and their theorem is proved in Polylogarithms, Part II. The analytic side supplies Kummer reduction using uniform dilogarithm Fourier bounds, logarithmic current regulators and their comparison with the universal Beilinson regulator. General motivic comparison, positive-characteristic strong reciprocity, higher-weight reciprocity and Leopoldt remain conjectures; extending an every-family assertion across a change of presentation requires the separate cycle-lifting assertion stated below.

## Scope and ownership

This roadmap owns the regulator theory of the classical polylogarithms: descent of their real single-valued combinations to Bloch groups, the explicit trilogarithmic presentation and configuration maps, the rational-curve construction of higher Bloch groups, the associated polylogarithmic complexes and the Zagier determinant with its three assertions. It also owns the concrete logarithmic forms, currents, Chow polylogarithms, regulator formulas and low-weight reciprocity homotopies used here. Its last layer tests those formulas against supplied completed-unit and local-logarithm interfaces. The layers are numbered 2 to 6; the analytic layer that precedes them is the roadmap PolylogarithmFunctions.

The following boundaries are part of the specification.

- **PolylogarithmFunctions** owns the classical polylogarithms `Liₙ` as analytic functions, with their principal branches, monodromy, distribution and inversion relations; the real single-valued polylogarithms `Lₙ` in Zagier's Bernoulli normalization, with parity, inversion, conjugation, distribution, endpoint values, continuity on `ℙ¹(ℂ)`, real analyticity off `{0,1,∞}` and the general-weight differential; its §7.2 owns the uniform closed-disc and unit-circle Fourier truncation bounds; and the Bloch–Wigner function `D=L₂` with its differential, Laplacian, positivity on the upper half-plane and the five-term relation. They are consumed through the contract below; nothing here constructs them again.
- **K3BlochGroups**, Layers 3–4, owns the pre-Bloch group, its five-term relations, the antisymmetric tensor boundary, its rational exterior comparison, the Bloch kernel and the Suslin comparison. Its §§3.13–3.16 supply the extended projective presentation used for the all-field next-to-Milnor normalization in §4.7. Its §4.21 supplies rational-function rigidity, specialization and the weight-two rational-curve presentation consumed in §4.2. Layer 6 owns exact Bloch-certificate infrastructure. Here `B₂` abbreviates that rational pre-Bloch group; it does not mean its Bloch kernel. Descent of an analytic function and its normalization against a Borel regulator are additional targets here.
- **AlgebraicCurves**, Layer 12B–12C, owns proper regular curve models, the closed-point/place dictionary and the contravariant correspondence between finite function-field embeddings and finite curve covers. Over the algebraically closed characteristic-zero bases of §4.7 these models are smooth connected curves.
- **K2SymbolsBrauer**, Layers 5 and 7–11, owns Milnor symbols, Matsumoto comparison, tame symbols, Milnor norms, reciprocity and compatibility with Quillen residues. **GeneralAlgebraicKTheory** §§3.12 and 5.11 own the plus/Q and connective-spectrum comparisons, and **StableHomotopyKTheory** §§4.14, 6.1–6.2 and 7.19 own the stable-linear-group H-space, K-spectrum and unrestricted rational-spectrum decomposition. Section 2.2 owns the rational homology comparison for their zero component and the all-ring primitive and rank-filtration adapters; §3.7 applies them to configurations. **SchemeKTheoryOperations** §§3.3 and 4.5, §§5.1–5.2 and Layer 6 own localization, coniveau, homotopy invariance and rational Adams operations.
- **ArithmeticKTheory**, §§3.3–3.4, owns rational localization and Borel ranks. **BorelRegulators**, §§2.3, 3.4 and 5.1–5.4, owns the archimedean regulator lattice and its zeta covolume, and through Borel's primitive-period determinant theorem the rationality of `|disc F|^{1/2}π^(-nN)ζ_F(n)` for totally real `F` and even `n`. The conversion from those coordinates to this roadmap's real polylogarithms is supplied explicitly here; a nonzero rational scalar in one coordinate system does not authorize dropping a power of π in another.
- **DifferentialGeometry**, Layers 0–2, 5–6 and 8, owns manifold differential forms, wedge, exterior derivative, orientations, integration, Stokes, compact support and de Rham comparison. **ComplexKahlerGeometry** K5a owns the bundle-test LF topology, **GeometricCurrents** G1 owns real test forms and currents, and **ComplexComparisonPartII** §C5.4 owns complex current calculus, analytic cycle integration and Poincaré–Lelong, including the normal-current support theorem. The additions here are the BFT normalization, singular polylogarithmic representatives and their regulator comparisons. Mathlib owns `AlgebraicGeometry.AlgebraicCycle` and its weighted pushforward. **SchemeAndStackFoundations**, Layer 5, owns rational equivalence, Chow groups, Cartier intersections and the Chow ring; **AlgebraicVectorBundles** owns the underlying algebraic vector-bundle operations. Chow parameter loci here classify moving cycles with specified face conditions; they are not a second Chow ring.
- **ComplexComparisonPartII**, §C−1.1, owns complex analytic spaces and `complexSchemeAnalytification`, including maps and fiber products. **AlgebraicModuliForArithmeticGeometry** §1.6 and Layer 9 supply Chow parameters with universal support and characteristic-zero algebraic resolution. Multiplicity-bearing admissible incidence is the additional target in §5.3. **ComplexComparisonPartII**, §C5.4, owns `AnalyticCycleIntegration`, its LF continuity and `closedCurrentExtension`; §5.2 here supplies the BFT normalized-current and algebraic-resolution adapters. Its coherent analytification and comparison layers are needed only for the Chern comparison. The lattice-specific torus integration and Fourier adapter is constructed in §5.18. **GeometricTopology**, Layer 7, supplies hyperbolic metrics and Riemannian volume; §2.4 constructs the particular ideal-boundary regions and truncations used here from that metric interface. These contracts are needed only by their indicated applications.
- **KTheoryFiniteLocalFields** §3.0a owns the shared simplicial Bloch-cycle and higher Chow complexes and localization. **MotivesAndAlgebraicCycles** §§4.8a and 4.14 owns relative-cycle specialization, arbitrary base pullback, admissible Cartier intersection, equidimensional cycles and transfers. **MotivicEtaleKTheory**, §§1.1–1.4, 2.1–2.4, 3.3–3.4, 4.1–4.2, 5.1–5.4, 6.1–6.3 and 7.1–7.4, owns cubical and mixed-model comparisons, the rational K-theory/Chern comparison, logarithmic Deligne theory and products, the shared support diagrams and abstract supported regulator, and the independently normalized Beilinson character. Section 5.2 here transports those diagrams through the cube orientation change and owns the full normalized-current dictionary, the shifted comparison complex D_AH, its base map β and concrete current-comparison adapters; §5.3 owns logarithmic Green forms. The explicit Wang/Goncharov maps and their comparison with the universal map remain here; neither universal construction uses these formulas or their comparison.
- **IntegralIwasawaTheory**, §2.2 and §§4.1–4.4, owns completed global-to-local units, the rational logarithm map, its all-embeddings matrix and rank/minor criterion, the totally real/CM scalar regulator and the abelian consequence of Baker–Brumer. **ColemanIntegration**, L0.F and L0.15–L0.18, owns formal rational polylogarithm series and the logarithm branches on ℂp, including the Iwasawa branch and agreement with finite-extension logarithms. The present complex analytic realization and its regulator formulas add no second formal power-series object; only this early prefix of ColemanIntegration is used.

The weight-four theorem is not proved here. It is owned downstream by **Polylogarithms, Part II: the weight-four Zagier theorem** (`ZagierConjecturePolylogarithms`), which imports Layers 2–4 of this roadmap. That roadmap owns the combinatorial weight-four Lie coalgebra and its single-symbol subspace, the explicit weight-four complex built from them, motivic correlators, decorated flags, the canonical period `L₄*` and its conversion on cycles, the regulator input `κ:K₇(F)_ℚ→ker δ₄`, the existence and every-family theorems for the explicit weight-four cycles of §4.5, and the presentation map to the inductive complex together with its weight-four cycle obstruction. It comes after this roadmap, and no target in Layers 2–6 depends on it.

## Conventions

Algebraic symbol groups are rational vector spaces unless a statement explicitly says integral. Put `U(F) = ℚ ⊗_ℤ Additive(Fˣ)`, and denote the vector of a unit `x` by `u(x)`. Exterior powers and tensor products of these spaces are over ℚ. Torsion units therefore have zero vector. The symbol `[x]ₙ` includes the endpoint `x = 1` in odd weights; `[0]ₙ = [∞]ₙ = 0`. Over ℚ its nonzero period is ζ(3), so imposing `[1]₃=0` would destroy the zeta-value theorem; retention of the generator does not assert nonvanishing over every infinite field.

A one-variable function field F/k means a finitely generated field extension of transcendence degree one, expressed by `TauCeti.IsFunctionField k F`. Finite-support assertions for residues over all k-places retain this hypothesis; an individual discrete-valuation residue is defined without it.

`Liₙ`, `Lₙ` and `D` are the functions of PolylogarithmFunctions, with its conventions. Complex logarithms use Mathlib's principal logarithm, with argument in `(-π,π]`; on the real cut `x > 1` the principal classical branches take their lower boundary values. Bernoulli numbers have `B₁ = -1/2`. With `πₙ(w) = Re(w)` for odd `n` and `Im(w)` for even `n`,

```text
Lₙ(z) = πₙ( Σ_{k=0}^{n-1} 2^k B_k/k! · Liₙ₋ₖ(z) · log^k|z| ),   n ≥ 2,
D(z)  = L₂(z) = Im Li₂(z) + arg(1-z)·log|z|.
```

These are real-valued and continuous on `ℙ¹(ℂ)`, with `Lₙ(0)=Lₙ(∞)=0`, `Lₙ(1)=ζ(n)` for odd `n` and `Lₙ(1)=0` for even `n`. All differentiation across the cut concerns these real single-valued functions, never a holomorphic extension of a principal branch across its jump. Tate-valued versions require an explicit multiplication by the stated power of `2πi`.

Complexes are cohomological, in degrees `1,…,n`, and their differential raises degree. The shift has `d_{C[-1]} = -d_C`. A residue written without this shift sign commutes with the displayed symbol differentials; its component in a map to `C[-1]` acquires the corresponding degree sign. An alternating sum `Alt_m` is the sum over all `m!` permutations with their signs, with **no** factor `1/m!`. Deleted vertices are numbered starting at zero.

The cubical cycle complex of MotivicEtaleKTheory §1.1 uses `∂_M=Σ_{i=1}^m(-1)^i(∂ᵢ^∞-∂ᵢ^0)`. The Wang identities use `δ=-∂_M`. Use the supplier's `cubicalOrientationChange J_q=(-1)^q` on cycles and both supported and unsupported total complexes: `δ J_q=J_{q-1}∂_M`. Thus a formula `P_c` on the δ-model gives `P_c∘J` on the supplied complex; the mixed model uses `J` in cube degree and leaves simplex degree unchanged. At degree one, `∂_M=∂⁰-∂∞`, while `δ=-∂⁰+∂∞`; `J₁=-1` reconciles them.

Write `r(a,b,c,d)` for the cross-ratio in [G04, §6] normalized by `r(∞,0,1,z)=z`. On an affine chart it is

```text
r(a,b,c,d) = (a-c)(b-d) / ((a-d)(b-c)).
```

Thus `r(a,b,c,∞)=(a-c)/(b-c)`. The common Bloch–Suslin convention `cr(0,∞,1,z)=z` gives `r=1/cr` on the same four ordered vertices. The bracket in Goncharov–Rudenko §1 is `1-1/cr`; both changes negate `D`. This distinction matters when a tuple is used as an oriented ideal tetrahedron. Projected cross-ratios in Layer 3 are fixed independently by their determinant formula.

For a number field `F`, write `N=[F:ℚ]=r₁+2r₂`, `dₙ=r₁+r₂` for odd `n` and `dₙ=r₂` for even `n`, and `eₙ=n(N-dₙ)`. Choose every real embedding and one embedding from each complex pair in odd weight; choose only the latter in even weight. Rows are embeddings and columns are symbol families. Set

```text
Zₙ(F;y₁,…,y_d) = π^eₙ / √|disc F| · det(Lₙ(σᵢ(yⱼ))).
```

An empty determinant is one. A rational proportionality for every family allows scalar zero; the existence theorem requires a nonzero scalar. The existence statement is written `Zₙ=q ζ_F(n)`, so that its scalar is the inverse of the scalar in `ζ_F(n)=q' Zₙ`.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use `Complex.log`, `Complex.arg`, Complex.hasStrictFDerivAt_log_real, intervalIntegral, Bochner integration, `HasSum`, `HasFDerivAt`, `fderiv` and `DifferentiableAt`. `bernoulli` fixes the coefficient convention `B₁=-1/2` of the single-valued functions. Logarithmic sine integrability and `integral_log_sin_zero_pi` supply the normalization of Lobachevsky's integral. For §2.5 use PolylogarithmFunctions §7.2’s uniform absolute Fourier tail estimate, rather than a geometric-series bound at the unit circle.

Use `Finsupp`, `Submodule.span`, `TensorProduct`, `Additive`, `ExteriorAlgebra.exteriorPower`, `exteriorPower.ιMulti`, `Matrix.det`, `CochainComplex`, homology, shifts and mapping cones. Quotient descent is proved before assigning a differential on a quotient. NumberField.dedekindZeta, `NumberField.discr`, `NumberField.discr_ne_zero`, `NumberField.InfinitePlace.embedding`, nrRealPlaces, nrComplexPlaces and the signature identity supply the arithmetic carriers, not their special-value theorem. `NumberField.discr_rat` fixes the rational-field determinant check.

Tau Ceti's `TauCeti.Analysis.Complex.ContinuousLog.Basic` supplies `HasContinuousLogOn`, its nonvanishing consequence and its multiplicative, inverse, quotient and slit-plane APIs. Its path and gluing results supply the local branch choices used when the single-valued combinations are differentiated at points of the classical cut (§§4.3 and 6.2). In `TauCeti/FieldTheory/FunctionField/Basic.lean`, `TauCeti.IsFunctionField k F` requires a transcendental x with F finite-dimensional over k(x); `TauCeti.IsFunctionField.essFiniteType` and `TauCeti.IsFunctionField.trdeg_eq_one` give finite generation and transcendence degree one, and `TauCeti.IsFunctionField.finiteDimensional_adjoin` permits any transcendental parameter. The function-field place API supplies `TauCeti.Place.residueUnit`, its product, inverse and power rules, and `TauCeti.Place.finite_setOf_ord_ne_zero` in `TauCeti/FieldTheory/FunctionField/Place/Zeros.lean`, with an explicit `TauCeti.IsFunctionField k F` hypothesis. Reduction is used only after proving valuation zero. The principal-divisor/product-formula API supplies finite support and degree zero of principal divisors. It never supplies reduction of a nonunit by totalizing a field homomorphism.

Tau Ceti additionally supplies principal-unit logarithms in `TauCeti.NumberTheory.LocalField.Logarithm`: TauCeti.hasSum_log_of_mem_unitFiltration_one and `TauCeti.continuous_log_unitFiltration` apply over every finite extension of ℚp, including p=2. Its `TauCeti.valuation_log_sub_log` and `TauCeti.log_unitFiltration_injective` apply on depth i satisfying `absoluteRamificationIndex K p < (p-1)*i`. These results concern `NormedSpace.log` on finite local fields; the ℂp branch and its agreement with them are supplied by the Coleman prefix above. Section 6.1 adds the transpose convention for the supplied global embedding matrix.

### From PolylogarithmFunctions

The following are consumed with the hypotheses stated there. `polylog n z` is the principal classical `Liₙ`, equal to its series on the open unit disc and taking the lower boundary value on the cut, with `Liₙ(1)=ζ(n)` for `n≥2`. `singleValued n z` is `Lₙ`, with PolylogarithmFunctions.singleValued_inv (`Lₙ(z)+(-1)^nLₙ(1/z)=0` for `z≠0`), conjugation `Lₙ(z̄)=(-1)^(n-1)Lₙ(z)`, distribution with the factor `m^(n-1)`, continuity on `ℙ¹(ℂ)` with the endpoint values of the conventions, real analyticity on `ℂ\{0,1}`, and the general differential of §4.5: real differentiability at every `z≠0,1`, the principal cut included, with the derivative obtained branchwise from the Bernoulli sum. `blochWigner z` is `D`, with §5.2’s identity `L₂=D`, its sixfold symmetry and §5.4’s differential

```text
dD(z)[v] = -log|z|·Im(v/(1-z)) - log|1-z|·Im(v/z),     z ≠ 0,1,
```

including differentiability on the cut. Section 4.8 supplies the exact weight-three differential and zero derivative at one; §5.4 also supplies the Steinberg one-form identity. Use positivity on the upper half-plane, and PolylogarithmFunctions.blochWigner_fiveTerm for distinct `x,y∈ℂ\{0,1}`:

```text
D(x)-D(y)+D(y/x)-D((1-x⁻¹)/(1-y⁻¹))+D((1-x)/(1-y)) = 0.
```

Suggested.lean restates `polylog`, `singleValued` and `blochWigner` by the formulas of the conventions so that its statements typecheck at the pins; an implementation uses PolylogarithmFunctions' declarations, which agree with these formulas for natural-number indices `n≥2`, including the endpoint branches `z=0,1` stated separately by the supplier.

The native definitions required by the acceptance file have the following API; their analytic theory is the PolylogarithmFunctions contract above.

- `polylog` uses natural indices, the rational formula at zero weight, the principal logarithm at weight one and the displayed integral at higher weights. Its comparison with the supplier is asserted in weights n≥2 used here.
- `singleValued` takes the parity projection of the finite Bernoulli combination, with the coefficients and endpoint branches fixed above.
- `blochWigner` is the displayed real combination of the weight-two integral and principal argument, with its zero endpoint values.

**Checks.**

- At zero every positive-weight integral vanishes; at one the weight-two value is π²/6 and the single-valued weight-two value is zero. An unordered boundary sum at weight one is not used as a definition.
- At z=−1 the classical weight-two value is −π²/12, its Bloch–Wigner value is zero and the single-valued weight-three value is −3ζ(3)/4; these distinguish parity projection from taking the real part in every weight.
- At z=i the Bloch–Wigner value is positive, and at z=−i it is its negative. The weight-three value at one is ζ(3), so killing that endpoint contradicts the supplied normalization.

### From the symbol and regulator roadmaps

AlgebraicCurves Layer 12B–12C supplies normalization of the projective line in a one-variable function field, its proper regular curve model and closed-point/place correspondence, and the extension of finite field embeddings to finite curve covers. Section 4.7 uses this contract over algebraically closed characteristic-zero fields, where regular curves are smooth and the constant field is the base field.

ArithmeticKTheory §§3.3–3.4 supplies rational localization and Borel ranks (`borel_rank_order` and `borel_rank_centralSimple`).

BorelRegulators §2.3 supplies the real regulator isomorphism and rational injectivity; §§5.3–5.4 supply the integral image lattice, positive covolume and determinant on every rational K-basis in the declared Tate-divided coordinates. Section 5.1 supplies the totally-real even-weight primitive-period theorem; §3.4 supplies its norm-one Tamagawa normalization from EndoscopicTransferAndUnitaryTraceComparison §6.2. These are direct supplier contracts, alongside K3BlochGroups Layers 3–4 and §4.21 for the symbol carriers and presentation comparison below.

StableHomotopyKTheory §3.37 supplies the finite-type Cartan–Serre comparison and rational Eilenberg–Mac Lane cohomology for finite-dimensional rational coefficient spaces. Sections 6.1–6.2 supply the connective K-spectrum and its zero-space comparison; §7.19 supplies rationalization and the generalized Eilenberg–Mac Lane decomposition for arbitrary rational homotopy groups. GeneralAlgebraicKTheory §5.11 identifies this spectrum with Q-theory, compatibly with §3.12’s plus comparison and block sum. Section 2.2 owns the additional homological passage from these supplied spectra to the zero component, including arbitrary-dimensional coefficients; it does not assume an unrestricted H-space theorem from §3.37.

K3BlochGroups Layer 3 supplies `preBloch`, the five-term class, the §3.5 boundary P(F) → antisymSquare ℤ (Additive Fˣ) sending `[x]` to `x∧(1-x)`, and its composite to the exterior square. The differential here is its **negative**, `(1-x)∧x`. Layer 4 supplies the rational Suslin comparison with indecomposable K₃. K3BlochGroups §4.21 supplies `k3ind_rationalFunctionField`, `bloch_rationalFunctionField`, preBloch_rationalSpecialization and rationalCurve_relations_eq; §4.2 uses them for the weight-two rational-curve presentation. These do not identify the arbitrary-curve presentation. K2SymbolsBrauer §5.4 supplies `MilnorK`; §7.2 supplies Matsumoto; §§8.2–8.3 fix the product-normalized Milnor-to-Quillen map `Φ`; §§9.5 and 9.11–9.16 supply the tame symbol and higher parameter-last residue. In degree two its tame convention is `∂{π,u}=ū⁻¹`. Section 10.5 supplies the Bass–Tate sequence, §§10.9 and 10.24 supply Milnor norms with `N∘res=[L:K]`, and §§10.29–10.30 supply reciprocity over proper curves. For the actual right-module Quillen boundary `D`, §11.3 gives `DₙΦₙ=(-1)^(n-1)Φₙ₋₁rₙ`; §11.5 compares uniformizer specializations. Thus the degree-three residue square used in §4.2 has positive sign, while the degree-two square includes inversion. These statements impose no characteristic or residue-completeness restriction.

ArithmeticKTheory §§3.3–3.4 supplies the dimension `dₙ` of `K_{2n-1}(F)⊗ℚ` for `n≥2`. BorelRegulators §2.3 supplies injectivity after tensoring with ℝ; §§5.3–5.4 supply the image lattice and covolume relation in its declared Tate-divided coordinates. In Tate-divided coordinates on a rational basis the determinant relation has the shape

```text
det(r_Bo) ∈ ℚˣ · √|disc F| · π^(dₙ-Nn) ζ_F(n).
```

The conversion required here is `Lₙ-period = λₙ π^(n-1) r_Bo`, with `λₙ ∈ ℚˣ`, after compatible K-theory and homology normalizations. Multiplying each of `dₙ` rows gives the exponent `-eₙ` for the determinant of the `Lₙ` periods. An assertion that `λₙ` is rational is made only **after** this period conversion. Exact factorial and Hurewicz constants are the calibration target in §2.3, not an unnamed dependency on the whole regulator comparison layer. For totally real `F` and even `n`, `dₙ=0` and Borel's primitive-period determinant theorem (BorelRegulators §5.1; Borel 1977, Remark 6.3) gives `|disc F|^{1/2}π^(-nN)ζ_F(n)∈ℚˣ`; §4.7 uses this for empty determinants.

### Geometric and motivic interfaces

MotivicEtaleKTheory §§1.1–1.4 supplies integral cubical and mixed models and their restriction-fiber comparisons on KTheoryFiniteLocalFields §3.0a’s shared higher Chow complexes. Sections 2.1–2.4 supply the rational higher Chern/K-theory comparison; §§3.3–3.4 and 4.1–4.2 supply compactification-independent logarithmic Deligne theory and its products. Sections 5.1–5.4 supply support fibers, semipurity and the auxiliary support resolution; §§6.1–6.3 supply the restriction-natural regulator, its supported map and coherent naturality; §§7.1–7.4 supply the independent Beilinson character, comparison and unit/product normalization. The explicit-current applications here use smooth projective varieties over subfields of ℂ and their open restriction diagrams; this does not enlarge their current-pushforward scope to arbitrary quasi-projective varieties.

DifferentialGeometry supplies its smooth form carrier, `d`, wedge, pullback, integration and Stokes with the determinant orientation. Mathlib's `Distribution` supplies continuous duals of Euclidean test functions, `Distribution.delta` and Distribution.lineDerivCLM. GeometricCurrents G1 supplies `TestForm` and `Current`, using ComplexKahlerGeometry K5a’s bundle-test LF topology; §5.1 fixes the complementary-degree and differential conventions used here. AlgebraicModuliForArithmeticGeometry §1.6 supplies the projective Chow coefficient scheme over an algebraically closed characteristic-zero field, its multiplicity-bearing point cycles and closed universal support. Its Layer 9, in particular `localIsomorphismResolution` and §9.7, supplies proper characteristic-zero resolution and embedded simple-normal-crossing boundary cleanup. Its closed support alone does not provide a relative incidence cycle with specialization multiplicities; admissibleIncidenceCycle in §5.3 is the additional family-specific construction. ComplexComparisonPartII §C−1.1 supplies `complexSchemeAnalytification`, complexSchemeAnalytification.map and complexSchemeAnalytification.fibreProduct; its smooth case identifies algebraic resolutions with maps of complex manifolds. ComplexComparisonPartII §C5.4 supplies the raw cycle integral `AnalyticCycleIntegration`, additivity in cycle multiplicities, local finite mass and closedness, using its `closedCurrentExtension` under complete-pluripolar and finite-mass hypotheses. Its `CurrentCalculus` and `AnalyticCycleIntegration` include continuity for the test-form LF topology, and lelongPoincareSection includes the normal-current support theorem. Section 5.2 adds conversion to BFT normalized currents and compatibility with proper algebraic resolutions. On `Spec ℂ[ε]/(ε²)`, analytification keeps a nonzero nilpotent stalk; replacing it by the reduction fails this comparison. No resolution of an arbitrary analytic space is assumed.

GeometricTopology Layer 7 supplies the bundled hyperbolic metric and its volume using Tau Ceti's TauCeti.riemannianVolume. Section 2.4 adds an upper-half-space coordinate adapter, the boundary `ℙ¹(ℂ)`, measurable ideal regions and compact truncations with an explicit cusp-tail bound. These are local constructions of this roadmap. Their input is ordinary metric, measure and form calculus, and their output is a geometric integral defined before comparison with the dilogarithm.

KTheoryFiniteLocalFields §3.0a supplies the shared simplicial Bloch-cycle/HigherChow complexes, coefficients and localization maps over arbitrary fields. MotivicEtaleKTheory §§1.1–1.4 supplies cubical normalization, mixed comparisons and their restriction fibers; §§2.1–2.4 supplies the rational Chern character on the actual K-groups, with restriction and localization. Its §§3.3–3.4, 4.1–4.2, 5.1–5.4 and 6.1–6.3 supply the logarithmic Deligne model, products, semipurity, auxiliary diagrams and universal supported regulator. Sections 7.1–7.4 fix the independent Beilinson map and its unit logarithm and cup product; the supported divisor representative is the negative logarithm, while a unit has positive logarithm. Section 5.2 here transports the entire support diagram through J and compares it with the concrete normalized-current model. SchemeKTheoryOperations §4.5 and Layer 6 supply coniveau and Adams inputs. The full current dictionary, shifted comparison complex and explicit regulator comparison remain targets here.

For the weight-three configuration argument, GeneralAlgebraicKTheory §3.12 identifies positive K-groups with the homotopy of `BGL(F)⁺`; the plus map preserves group homology. StableHomotopyKTheory §4.14 supplies its block-sum H-space. Using the connective-spectrum and rationalization contracts above and its own zero-component homology comparison, §2.2 constructs the natural rational Hurewicz isomorphism with primitive homology and the rank filtration from finite `GL_m`. Section 3.8 uses the primitive projection and the inverse isomorphism to recover K-classes from homology lifts; §3.7 uses the forward map. K3BlochGroups Layer 4 supplies the degree-three Suslin comparison; the degree-three configuration normalization is the separate target of §3.6. No equality of the rank and Adams filtrations is assumed.

## How to read the build

The layers are numbered 2 to 6 and start from the analytic functions of PolylogarithmFunctions. Layer 2 turns the dilogarithm into an embedding regulator and a signed volume, and applies the supplied Fourier bounds through Kummer reduction. The primitive adapter of §2.2 precedes its Borel use; §3.5 constructs the geometric presentation before the configuration maps, and §3.6 completes their projected square by duality. Layer 3 constructs the explicit trilogarithmic complex and its configuration comparison and proves the weight-three theorem. Layer 4 develops the inductive presentation, separates the precise Zagier assertions, defines the explicit weight-four cycles and gives the general cycle-obstruction criterion for a change of presentation. Section 4.7 proves the next-to-Milnor residue, normalized truncated reciprocity and characteristic-zero comparison theorems, and keeps the whole-complex homotopy and transfer assertions separate. Layer 5 constructs the normalized dictionary and concrete comparisons with the imported support diagrams in §5.2 before the Green forms of §5.3, and compares them with Wang forms and the cubical regulator in §5.9. Layer 5 builds the singular analytic machinery and explicit curve and higher-cycle regulators. Layer 6 gives diagnostic differential and completed-unit interfaces. Each layer can be used up to the theorem whose listed suppliers are available; conjectural comparison statements are never instances that silently enable subsequent proofs.

## Layer 2: dilogarithmic regulators, volume and Fourier estimates

### 2.1 Descent and embedding regulators

Define blochWignerDesc as the unique ℚ-linear map from the supplier's rational pre-Bloch group to ℝ sending `[z]₂` to `D(z)`. Existence follows from PolylogarithmFunctions.blochWigner_fiveTerm and uniqueness from generation. Restrict it to the Bloch kernel when using the indecomposable K₃ comparison. For a number field, define weightTwoRegulator by applying one selected complex embedding per conjugate pair. Real embeddings contribute zero, and changing one representative to its conjugate negates that row. Prove blochWignerDesc_mk, blochWignerDesc_map, weightTwoRegulator_conjugate and the compatibility with the supplier's rational exterior boundary. (Zagier [Z07], §5, pp.17–20; [G04], §5.1 and §5.5, pp.37–38 and 47–51.) *Needs:* `blochWigner` and PolylogarithmFunctions.blochWigner_fiveTerm, and K3BlochGroups Layers 3–4.

The descent and embedding API requires the following facts.

- On every symbol the descended linear functional has the displayed value; field embeddings commute with descent and extension of scalars.
- Restriction to the Bloch kernel is compatible with its inclusion in the pre-Bloch group.
- The embedding regulator is rationally linear, has zero real rows and changes the sign of exactly the conjugated complex row.

**Checks.**

- Over `ℚ`, the target is `ℝ⁰`, and the regulator is the unique map to the zero space. It is not a one-row map indexed by the real embedding.
- Over `ℚ(i)`, the rational class `[i]₂` is a cycle because `u(i)=0`; the selected identity embedding gives `D(i)>0`, while the conjugate gives its negative.
- Over `F=ℚ(√−3)`, take `w=(1+√−3)/2`. Since `1-w=w⁻¹`, `[w]` is integrally in the strict-exterior Bloch kernel. Its antisymmetric boundary is `-w⊗w`, nonzero of order two: a splitting of `Fˣ` into its sixth-root torsion and a free group gives a map to `ℤ/2` detecting that diagonal. Thus `2[w]` belongs to both kernels, and rationalization removes the distinction. Over ℂ instead, choose `t²=w`; then `w⊗w=4(t⊗t)=0` in the antisymmetric quotient because every diagonal is killed by two. Nonvanishing is not preserved by this field extension.

### 2.2 Group cocycles

On four points of `ℙ¹(ℂ)`, define blochWignerCocycle as `D(r)` when the points are distinct and as zero when two coincide. Equivalently pull it back to four nonzero vectors in `ℂ²`; zero vectors are outside this domain. Prove alternation, invariance under `GL₂(ℂ)`, the alternating deletion identity on every five projective points and measurability. A repeated-point five-tuple has either all zero faces or two equal surviving faces with opposite signs. For a fixed nonzero vector v, evaluation on `(g₀v,…,g₃v)` therefore defines a homogeneous group cocycle, since invertible matrices preserve nonvanishing. Use the homogeneous measurable bar resolution, and prove that the generic-resolution comparison gives the indicated continuous cohomology class; do not infer continuity of the representative at a degenerate configuration. Under stabilization this is the weight-two class. (Goncharov [G04], Theorem 1.1, p.8, Theorem 5.7, pp.45–47, and Theorem 5.11, p.49.) *Needs:* §2.1, the bar complex and the measurable/continuous comparison, whose low-degree generic-configuration construction is a target here.

The cocycle API requires alternation, simultaneous-linear invariance and the alternating deletion identity on five inputs, on projective points, with the zero convention precisely at repeated projective points. Its measurable class maps to the specified continuous class through the generic-resolution comparison.

**Checks.**

- The normalized tuple `(∞,0,1,i)` has value `D(i)>0`. Exchanging the first two vertices changes it to `-D(i)`.
- A repeated projective point is assigned zero; independent rescalings of the four vectors do not change the projective ratio or the value.
- Five generic points give an alternating deletion sum zero. For `(∞,∞,0,1,i)`, the two surviving faces give `D(i)-D(i)=0`; all other faces vanish. Applying a nonreal Möbius transformation preserves the equation, whereas complex conjugation negates each face value.
- The vector tuple `(0,(1,0),(0,1),(1,1),(i,1))` is excluded: extending by zero there would give deletion sum `D(i)+0+0+0+0>0`. This distinguishes the projective cocycle from an unrestricted vector extension.

#### Rational primitive K-theory adapter

For every unital ring `R` and every `j≥1`, construct stableK_hurewiczPrimitive as the natural rational linear isomorphism `K_j(R)⊗ℚ ≃ Prim H_j(GL(R),ℚ)`. Use the zero-component plus/Q comparison, block-sum H-space and homology invariance of the plus map. Prove the additional target rationalKZeroComponentHomology: the Hurewicz map induces a natural Hopf-algebra isomorphism from the free graded-commutative ℚ-algebra on the positive graded space K_*(R)⊗ℚ to H_*(BGL(R)⁺,ℚ), with each K_j in degree j. Its primitive part gives the displayed isomorphism and its inverse. Define rankFiltrationK_j(m) as the inverse image of `im(H_j(GL_m(R),ℚ)→H_j(GL(R),ℚ))` under the forward isomorphism. Prove hurewiczPrimitive_natural, hurewiczPrimitive_stabilize, hurewiczPrimitive_inverse and rankFiltration_mono. (Weibel [WEI4], Chapter IV, §1, pp.11–12.) *Needs:* GeneralAlgebraicKTheory §§3.12–3.14 and 5.11, StableHomotopyKTheory §§4.14, 6.1–6.2 and 7.19, and the homology comparison proved next; no configuration comparison.

A homological route to rationalKZeroComponentHomology has the following intermediate targets, all owned in this subsection. Let E be the positive connective cover of the supplied K-spectrum, so its infinite-loop space is precisely the zero component, with the discrete K₀ factor removed. Prove that the telescope E --2→ E --3→ E --4→ … induces a rational homology isomorphism on zero spaces: on the augmentation filtration I^k/I^(k+1), multiplication by an integer a>0 acts by a^k; in each homological degree the filtration is finite, so these maps are invertible over ℚ without a dimension assumption. Compare the zero-space telescope with the zero space of E⊗ℚ by its homotopy groups. Compute H_*(K(V,j),ℚ) for every rational vector space V and j≥1 as the free graded-commutative Hopf algebra on V in degree j. For this computation use the filtered union of finite-dimensional subspaces of V, the functorial Eilenberg–Mac Lane models, finite-support singular chains and exact filtered colimits; only finite-dimensional stages use the cohomology calculation of StableHomotopyKTheory §3.37. Finally use §7.19’s rational-spectrum decomposition: in any fixed positive homology degree only finitely many positive Eilenberg–Mac Lane degrees contribute. Prove that this composite is the actual Hurewicz map on generators and is natural in ring maps; a choice of bases is not part of the exported isomorphism. (Weibel [WEI4], §1, pp.11–12, for the resulting primitive identification.) *Needs:* the spectrum contracts above, StableHomotopyKTheory §3.37 for the finite-dimensional calculation, DGFloer Layer 1 item 4 for the functorial Eilenberg–Mac Lane models, and AlgebraicTopology Stages 1–5 and 8 for singular chains, Künneth and CW comparison.

Construct stableHomology_primitiveProjection on the connected rational block-sum Hopf algebra as the convolution logarithm of the identity. On degree `j`, its sum stops at `j`, so it requires no completion or finite-dimensional duality. Prove primitiveProjection_id, primitiveProjection_natural and primitiveBorel_pairing_projection: pairing with a positive-degree primitive Borel cohomology class is unchanged, because that class vanishes on products of positive-degree homology classes. (Weibel [WEI4], §1, pp.11–12, rational H-space and symmetric-algebra description.) *Needs:* the preceding primitive identification and the connected rational Hopf algebra from block sum and diagonal.

- The zero-component homology comparison is the free graded-commutative Hopf algebra on positive rational K-groups, naturally for unital ring maps; its generators are their Hurewicz images.
- The primitive identification and its inverse are natural for unital ring maps and agree with stabilization of finite general linear groups.
- The rank filtration increases with matrix rank and is defined through the forward primitive map, so the inverse returns the same K-class on its image.
- The primitive projection fixes primitives, kills positive-degree products and preserves pairing with primitive positive-degree Borel classes.

**Checks.**

- Over the zero ring, positive K-groups and positive primitive homology are zero. Over ℚ, the prime classes in degree one are independent under their valuations, so rational homology is not of finite type; the arbitrary-dimensional zero-component homology argument is essential.
- In degree one over a field, Hurewicz followed by determinant is the identity on `Fˣ⊗ℚ`; over ℚ the class of two is nonzero. The inverse returns that same class.
- For independent degree-one classes `a,b`, the coproduct of their product has cross term `a⊗b-b⊗a`; it is not primitive and its primitive projection is zero. The classes of two and three over ℚ supply the witness.
- The projection fixes a primitive class and its Borel pairing; in degree zero it is zero. An identity on all homology fails the product witness, while a zero projection fails every nonzero primitive witness.
- For V=ℚa⊕ℚb in degree one, homology is exterior: a²=b²=0 and a∧b≠0; multiplication by two sends a to 2a and a∧b to 4a∧b. For V=ℚc in degree two, c²≠0 and its reduced coproduct is 2c⊗c. These distinguish the graded-commutative algebra from an ungraded symmetric or exterior algebra.
- For `V = directSum_(p prime) Q e_p` in degree one, a finite chain uses finitely many e_p; the two-prime product already has coproduct a⊗b−b⊗a. Passing to all primes retains every e_p as a primitive, without identifying the vector space with its double dual.
- The zero component has H₀=ℚ even when K₀(R) is nonzero. For a field K₀=ℤ, using every component instead would give H₀=ℚ[ℤ], which is not a connected Hopf algebra.

### 2.3 Borel normalization and a matrix-unit calibration

Prove weightTwoRegulator_borel by comparing the measurable cocycle with the invariant trace form and then the primitive Hurewicz map. First state the proportionality in the source's **original** real cohomology coordinates. Compose with the declared Tate-coordinate conversion before using the zeta covolume formula. The exact target borelCalibration_two computes the scalar with every factorial, alternation and Hurewicz convention fixed. The elementary calculation is indispensable: for `X=E₁₂,Y=E₂₁,Z=E₂₂`,

```text
Alt₃ Tr(XYZ) = -3,
C₂=(1/2)Alt₃ Tr(XYZ)=-3/2,
Φ₃=-(1/6)Alt₃ Tr(XYZ)=1/2.
```

Here the first expression means simply the unnormalized alternating triple trace; it does not introduce a second commutator normalization. Reversing the first two inputs reverses all three values. Prove the alternating trace calculation directly, then match it with the source's Maurer–Cartan and bar conventions. The calculation alone does **not** compute the complete K-theory scalar. That remaining calibration is an explicit proof obligation; [G04]'s proof of Theorem 5.7, p.45, assigns value one to its displayed half-alternating trace on this triple, whereas unnormalized alternation gives `-3/2`. That displayed numerical assertion cannot fix the scalar in the present convention. (Goncharov [G04], §5.2, pp.38–40, and §§5.4–5.5, Theorem 5.7 and Lemma 5.8, pp.44–49.) *Needs:* §2.2, its rational primitive identification, ArithmeticKTheory §§3.3–3.4 and BorelRegulators §§2.3 and 5.1–5.4.

The two-term sign check is `Φ₃(E₁₂,E₂₁,E₂₂)=1/2` and `Φ₃(E₂₁,E₁₂,E₂₂)=-1/2`. A claimed value `3/2` for the former would already contradict the elementary trace formula. Exact rational nonzero proportionality suffices for special-value existence after the period power is fixed; it does not make an unchecked exact scalar a theorem.

### 2.4 Ideal tetrahedra and Lobachevsky's function

#### Upper-half-space coordinates and the ideal boundary

Define upperHalfHyperbolicModel on `H³={(w,h)∈ℂ×ℝ | h>0}` with metric `(dx²+dy²+dh²)/h²`, orientation `dx∧dy∧dh` and measure `h⁻³ dx dy dh`. Construct its coordinate identification with the imported bundled metric by checking its positive-definite tensor and Riemannian density. Supply the bundle's completeness and curvature fields: the Christoffel coefficients are `Γᵏᵢⱼ=-(δᵏᵢδⱼ₃+δᵏⱼδᵢ₃-δᵢⱼδᵏ₃)/h`, and substitution in the curvature formula gives sectional curvature `-1`. Along every path the variation of `log h` is bounded by its hyperbolic length. A Cauchy sequence therefore has height bounded above and away from zero; on sufficiently short joining paths the same bounds control horizontal displacement. It is Euclidean Cauchy and converges inside `H³`, proving completeness. The ideal boundary is `ℙ¹(ℂ)`: finite points occur at height zero and the remaining point is infinity. For a matrix `(a b; c d)∈SL₂(ℂ)` put `J=|cw+d|²+|c|²h²`; its action sends

```text
(w,h) ↦ (((aw+b)conj(cw+d)+a conj(c)h²)/J, h/J).
```

Prove `J>0`, the composition law, independence under multiplication by `-1`, preservation of the metric and positive orientation, and boundary agreement with the fractional linear action. Complex conjugation preserves the metric and reverses orientation. Geodesic planes are vertical planes and hemispheres with centers at height zero, obtained by transporting a vertical plane under these isometries. Its API fixes the following geometric facts.

- On the positive-height domain the tensor is positive definite, its Riemannian metric is complete and every sectional curvature is minus one.
- The orientation is the displayed coordinate orientation and the associated positive measure has density the inverse cube of height.
- Every determinant-one complex matrix acts by the displayed orientation-preserving isometry; its ideal-boundary map is its fractional linear map.
- Complex conjugation is an isometry that reverses orientation.

This adapter uses the metric and differential-form interfaces of GeometricTopology and DifferentialGeometry; it does not reconstruct their general theories. (Milnor [MIL], Chapter 7, proof of Theorem 7.2.1 and Lemma 7.2.2, printed pp.160–164; the connection, completeness and coordinate action are checked directly in the displayed metric.)

**Checks.**

- Translation `(w,h)↦(w+b,h)` has Jacobian one; the diagonal matrix with positive real entry `a` sends `(w,h)` to `(a²w,a²h)` and preserves `h⁻³ dx dy dh`; conjugation negates the oriented volume form.
- Vertical points of heights one and two have distance `log 2`, and a vertical path approaching height zero has infinite length.
- At height one the horizontal coordinate plane has sectional curvature `-1`, ruling out a flat metric with the right density alone.
- The full model has infinite volume; the region measure, rather than the real-valued total-volume invariant for closed manifolds, is used below.
- The height-zero boundary is excluded from `H³`, and omitting `|c|²h²` in `J` already makes inversion undefined over its vertical axis.

#### Ideal regions and compact truncations

The total definition `idealRegion` assigns the empty region to a real shape. For `Im z≠0` define `idealRegion(z)` using the closed Euclidean triangle `T=conv{0,1,z}`, its circumcenter `c=1/2+i(|z|²-Re z)/(2 Im z)` and radius `R=|c|`:

```text
{(w,h)∈H³ | w∈T and h²+|w-c|²≥R²}.
```

Its three vertical faces and hemispherical fourth face are geodesic planes; their inward half-spaces identify it with the hyperbolic convex hull of `(∞,0,1,z)`. Define an arbitrary distinct noncoplanar quadruple by the unique boundary Möbius transformation normalizing its first three vertices to `(∞,0,1)`. Prove independence of an `SL₂` representative and invariance under orientation-preserving isometries. Define idealTruncation(z,n) by intersection with `K_n={|w|≤n,1/n≤h≤n}`, for positive integers `n`. The region is closed in `H³`; each truncation is compact and measurable, the truncations increase, and their union is the region. Boundary faces have measure zero. The region and truncation API requires the following facts.

- For a nonreal shape the four displayed inward geodesic half-spaces intersect in the normalized ideal region; boundary normalization transports this region independently of the matrix representative.
- Its boundary has product Lebesgue measure zero.
- Every positive-integer truncation is compact and measurable; increasing the index enlarges the truncation and their union is the whole region.

**Checks.**

- For `z=i`, `c=(1+i)/2` and `R²=1/2`: above `w=(1+i)/4`, height one belongs to the region and height `1/10` does not. A region containing the entire vertical column over every interior point would fail this test.
- At a real `z` the circumcenter formula is not used; this is a degenerate ideal simplex.
- A permutation changing the cross-ratio to its inverse changes the assigned orientation; it does not change the positive measure of the transported region.

Prove `idealRegion_finiteVolume`, integrability of `h⁻³` on `idealRegion z` for `Im z≠0`, and ideal-truncation convergence by the following geometric estimate, before using any polylogarithm. Choose pairwise disjoint horoballs at the four vertices. At each vertex transport its horoball to height `H≥H₀` above infinity; the cusp section is then a fixed Euclidean triangle of area `A_i`. Direct integration gives the tail `A_i/(2H²)`. The complement of these four cusp neighborhoods in the region is compact. Its density is bounded, so the total volume is finite, and the omitted cusp volume is bounded by `Σ_i A_i/(2H²)`. Apply monotone convergence to the `K_n` truncations. This also proves independence of any increasing measurable exhaustion of the region and permits integration after its subdivision into orthoschemes. Define `signedIdealVolume z = Real.sign z.im * ∫ p in idealRegion z, p.2^(-3:ℤ)` with product Lebesgue measure on `ℂ×ℝ`; the preceding integrability theorem identifies this integral with the positive region volume when `Im z≠0`. Prove isometry invariance and negation under an odd vertex permutation by the induced cross-ratio permutations and orientation of the half-space intersection. Set the degenerate coplanar value to zero; continuity at that locus is proved after the integral formula below. The volume API requires the following facts.

- `idealRegion_finiteVolume` gives integrability of the inverse-cube density for every nonreal shape.
- Each normalized cusp has tail area divided by twice the square of its cutoff height; summing the four tails bounds the omitted cusp volume.
- Integrals over the specified truncations converge to the region integral, and every increasing measurable exhaustion with that union has the same limit.
- The signed volume changes by the permutation sign under reordering distinct noncoplanar vertices and changes sign under conjugation.

**Checks.**

- In the normalized infinity cusp, a cutoff above the hemispherical face leaves exactly `area(T)/(2H²)`; replacing `h⁻³` by `h⁻²` gives the wrong power.
- Doubling the cutoff quarters this tail.
- A nondegenerate region contains a relatively open ball of positive measure, so its unsigned volume is positive; the same four vertices in the opposite orientation have the negative signed value.
- An exhaustion omitting a fixed open ball fails the union hypothesis and cannot be used to compute the volume.

#### Lobachevsky integration and the volume formula

Define `lobachevsky θ = -∫₀^θ log|2 sin t|dt`, proving local integrability through multiples of π. Prove oddness, π-periodicity, `Λ(π-θ)=-Λ(θ)` and duplication `Λ(2θ)=2Λ(θ)+2Λ(θ+π/2)`. Its Fourier series is `Λ(θ)=1/2∑_{m≥1}sin(2mθ)/m²`, absolutely and uniformly convergent. For `Im z>0`, with triangle angles `α=arg z`, `β=arg(1/(1-z))`, `γ=π-α-β`, prove `blochWigner_lobachevsky`: `D(z)=Λ(α)+Λ(β)+Λ(γ)`. Their positivity and sum π are proved from the upper-half-plane hypothesis. (Milnor [MIL], §7.1, Lemmas 7.1.2–7.1.4, printed pp.157–159, and Theorem 7.2.1, p.160; Zagier [Z07], §3, pp.10–11, for the unit-circle series, and §4, (8), p.13.)

For `z.im≠0`, prove `idealTetrahedron_volume`: `signedIdealVolume z = blochWigner z`, so the oriented ideal tetrahedron with vertices `(∞,0,1,z)` has signed volume `D(z)`. Subdivide its base triangle and corresponding region into oriented right orthoschemes. In a unit-hemisphere piece the height integral is `1/(2(1-x²-y²))`; integrating over the right triangle and substituting its angle gives the Lobachevsky integrals. Interior subdivision faces cancel, yielding `Λ(α)+Λ(β)+Λ(γ)` for `Im z>0`. The finite-volume and exhaustion theorems justify these improper integrals. Conjugation gives the lower-half-plane case. Compare with the analytic formula above and use continuity of `D` for coplanar degeneration. A tuple ordered `(0,∞,1,z)` has signed volume `-D(z)` in this `r` convention, since `r=1/z`. The absolute volume is `|D(z)|`. (Milnor [MIL], Theorem 7.2.1 and Lemma 7.2.2, printed pp.160–164.) *Needs:* the local geometric constructions above and the Lobachevsky integral; analytic positivity of `D` (PolylogarithmFunctions) is independent of this construction.

The integral-function API requires the following facts (Milnor [MIL], §7.1, Lemmas 7.1.2–7.1.4, pp.157–159).

- `lobachevsky` is defined for every real argument by its locally integrable logarithm, is odd and has period π.
- Reflection and duplication satisfy the displayed formulas, with the factor two inside the logarithm.
- Its displayed sine series converges absolutely and uniformly on the whole real line.
- `blochWigner_lobachevsky` holds for every shape in the upper half-plane with the three positive angles summing to π.

**Checks.**

- `Λ(0)=Λ(π/2)=Λ(π)=0`; `Λ(-θ)=-Λ(θ)`. A definition with `log|sin t|` instead of `log|2sin t|` fails π-periodicity.
- At `z=i`, the angles are `π/2,π/4,π/4`, so `D(i)=2Λ(π/4)`. The regular ideal tetrahedron at `z=e^{iπ/3}` has volume `3Λ(π/3)>0`.
- At the same vertices `(0,∞,1,i)`, `r=-i` and signed volume is `-D(i)`; swapping the first two gives `+D(i)`. A real fourth vertex has the empty normalized region and zero signed volume, agreeing with its limiting volume.

### 2.5 Kummer reduction

Prove `blochWigner_kummer`, the Kummer reduction

```text
D(z) = 1/2 Σ_{u∈(z,1/(1-z),1-1/z)} D(u/conj u),  z≠0,1.
```

Each argument has norm one. For the Checks write `S_N(w)=∑_{k=1}^N Im(w^k)/k²`. (Zagier [Z07], §3, (2), pp.10–11.) *Needs:* PolylogarithmFunctions' `blochWigner` with its continuity on the circle and its sixfold symmetry, the circle series and elementary norm algebra.

**Checks.**

- `S₃(i)=1-1/9=8/9`; `S₆(i)=1-1/9+1/25=209/225`. These values fix the starting index and cutoff.
- At `z=i`, the three Kummer arguments are `(-1,i,i)`, so the identity gives `D(i)`, with a positive sign.
- For real `z≠0,1`, all three arguments are one and `D(z)=0`. The endpoints have `D(0)=D(1)=0` by continuity and are outside the displayed divisions.
- At `z=(1+i)/2`, the middle argument is `i`; replacing `(1-conj z)/(1-z)` by its inverse reverses that contribution.

### Examples

For `F=ℚ(i)` the weight-two cycle `[i]₂` has `Z₂=π²D(i)/2=3ζ_F(2)`. This simultaneously checks the selected complex row, discriminant four, exponent two and nonzero rational factor. The same analytic value is the positive volume of `(∞,0,1,i)`.

### Dependencies

PolylogarithmFunctions, K3BlochGroups Layers 3–4 and Layer 6, GeneralAlgebraicKTheory §§3.12–3.14 and 5.11, StableHomotopyKTheory §§3.37, 4.14, 6.1–6.2 and 7.19, DGFloer Layer 1 item 4, AlgebraicTopology Stages 1–5 and 8, primitive group homology, ArithmeticKTheory §§3.3–3.4 and BorelRegulators §§2.3 and 5.1–5.4 are needed for the regulator comparison. Hyperbolic geometry is used only in §2.4. Kummer reduction in §2.5 needs neither K-theory nor a volume theorem.

## Layer 3: the explicit trilogarithmic complex

### 3.1 Relations and the weight-three group

For an infinite field `F`, define trilogGroup F = ℚ[F]/R₃(F). Here `R₃` is generated by `[0]`, inversion `[x]-[x⁻¹]`, the three-term element `[x]+[1-x]+[1-x⁻¹]-[1]` for `x≠0`, and the coordinate 22-term relations below. Use the source's rational endpoint convention, retaining `[1]`. Define trilogGroup.map by field embeddings and prove the quotient universal property trilogGroup.lift. The intended first differential is `δ₃[x]₃=[x]₂⊗u(x)` for `x≠0`, and zero at zero. Its well-definedness includes the full 22-term calculation, rather than being an axiom of an otherwise empty group. (Goncharov [G95], §1.3–1.6, pp.205–211, Theorems 1.3–1.4; [GR], §1.2, (19), p.9 and §5.1, pp.54–56.)

Write `A=ca-a+1`, `B=bc-c+1`. Define the cyclic block, corresponding to `trilogCyclic` in Suggested.lean, by

```text
T(a,b,c) = [A]+[A/(ca)]+[c]+[B/(Ab)]-[A/c]
           +[-Ba/A]-[B/(Abc)]-[1].
R(a,b,c) = T(a,b,c)+T(b,c,a)+T(c,a,b)+[-abc].
```

Require `abc≠0` and all three cyclic versions of `A` nonzero. Arguments equal to one or minus one are allowed. Prove coordinateRelation_cobracket by expanding into the five-term presentation of `B₂`, using multiplicative additivity of `u` and the exterior boundary. Prove the analytic identity `L₃(R(a,b,c))=0`. First do this on the generic geometric locus, then justify the remaining admissible values by specialization and continuity; the latter step is a named target, coordinateRelation_specialize, not an implicit strengthening of a generic calculation. Inversion and the three-term relation similarly descend. (Goncharov [G95], (1.16)–(1.17), pp.208–210; [GR], §5.1, Lemmas 5.1–5.2 and Proposition 5.4, (109)–(114), pp.54–56.) *Needs:* the supplier's rational five-term group, PolylogarithmFunctions' `L₃` with its inversion and continuity, and projective specialization.

The symbol API requires the following facts (with the locators and hypotheses above).

- The quotient symbol at zero is zero; inversion and the normalized three-term expression vanish in the quotient, with the endpoint at one retained.
- For every admissible triple, the displayed coordinate relation has zero cobracket; specialization from the generic locus preserves that identity and its analytic evaluation.
- The first differential sends a nonzero symbol to its weight-two class tensored with its unit vector, and sends zero to zero.
- Field embeddings induce linear maps preserving symbols and the differential; identity embeddings and composites induce the identity and composite maps.
- A function from the field to a rational module descends uniquely exactly when it kills the stated generating relations.

The light predicate `TrilogRelationFunction` tests exactly this presentation against a function to any rational module; it is not a newly constructed quotient. The milestone `singleValued_three_relations` states that `L₃` is such a function, so that it descends to trilogGroup ℂ; with the endpoint value `L₃(1)=ζ(3)` of PolylogarithmFunctions this gives trilogarithmDescent of §3.7.

**Checks.**

- `R(1,1,1)=3[1]+4[-1]` as a **raw** symbol sum; evaluating `L₃` gives `3ζ(3)+4(-3ζ(3)/4)=0`. The raw sum is not zero in the free module.
- At `(2,2,2)`, the raw sum is `3[3]+3[3/4]+3[2]+3[1/2]+3[-2]-3[3/2]-3[1/4]-3[1]+[-8]`. In particular the coefficient of `[1/4]` is negative.
- Modulo inversion, `R(1,1,c)=-[c²]+4[c]+4[-c]`. This reduction is not a raw equality before quotienting.
- At `x=2`, the three-term relation is `[2]+[-1]+[1/2]=[1]`. It is compatible with a nonzero value of `[1]`, and `L₃([1])=ζ(3)>0` proves that this class is nonzero over ℚ.
- The function `b(x)=x` on ℚ fails inversion at `x=2`; it is a negative control for `TrilogRelationFunction`, even though its single cyclic block at `(1,1,1)` happens to be zero.

### 3.2 Low-weight complexes and universal cycle predicates

Assemble polylogComplex F n, for `1≤n≤3`, in degrees `1,…,n`:

```text
n=1: U(F),
n=2: B₂(F) → Λ²U(F),
n=3: B₃(F) → B₂(F)⊗U(F) → Λ³U(F).
d[x]₂=(1-x)∧x;  d([x]₂⊗u(y))=(1-x)∧x∧y.
```

The weight-three square is zero because the image of `[x]₃` is `(1-x)∧x∧x=0`. Prove polylogComplex_map, functoriality and polylogComplex_H1_eq_ker. Weight two is the rationalized pre-Bloch complex with the negative of the supplier's boundary. These are complexes of vector spaces, not assertions of a motivic quasi-isomorphism. (Goncharov [G95], (0.1)–(0.3), p.199; [G04], §6.1, pp.52–53; [GR], §1.1, (5)–(6), pp.4–5.)

For a finite raw sum `c∈ℚ[F]`, define the native-carrier predicate `IsCycle3 c` by requiring `∑aₓ b(x)⊗u(x)=0` for **every** rational module `V` and every `b:F→V` with `b(0)=b(1)=0` satisfying the normalized five-term relation. Prove isCycle3_iff_delta_eq_zero by the quotient universal property: taking `b` to be the universal symbol proves one direction; every other `b` factors through it for the other. This is equivalent to the actual weight-three cycle condition, not a numerical vanishing test. Similarly the weight-four cycle predicate tests this sum against every `TrilogRelationFunction`; it is equivalent to membership in the explicit raw weight-four cycles explicitRawCycleFour of §4.5. The predicates `FiveTermFunction` and `IsCycle3`, and `unitVector`, are definitions needed for the weight-three headlines in Suggested.lean; the weight-four predicate is specified here by the same universal test against `TrilogRelationFunction`. *Needs:* §3.1, rational tensor products and the quotient universal property.

The complex and native predicate API requires the following facts.

- Field embeddings induce chain maps, compatible with identity and composition, and first cohomology is the first differential's kernel.
- `unitVector` sends zero and one to zero and sends products of nonzero arguments to sums of their vectors.
- `FiveTermFunction` requires exactly the two zero endpoint values and every admissible five-term identity, with rational linear combinations of such functions satisfying the same conditions.
- `IsCycle3` is closed under rational linear combinations and is equivalent to the kernel condition in the universal weight-two quotient.
- The universal weight-four test has the analogous kernel equivalence with the explicit raw cycles, without an analytic-vanishing substitute.

**Checks.**

- `IsCycle3(single (3:ℚ) 1)` is false: the boundary test `(u(2)∧u(3))⊗u(3)` is detected by the two- and three-adic valuations. Thus an always-true cycle predicate fails.
- `δ₂[3]=u(2)∧u(3)≠0` over ℚ, while `δ₂[2]=0` since `u(-1)=0`; the displayed differential on `[3]₂⊗u(5)` is `u(2)∧u(3)∧u(5)≠0`.
- `δ₃[1]=0`, and `IsCycle3(single 1 1)` holds, although over ℚ the class `[1]₃` is not zero. Likewise the weight-four predicate holds on the raw sum [1] because `u(1)=0` even though the test functions need not kill `[1]₃`.
- The zero symbol sum satisfies both cycle predicates. A sum is not made a cycle by having real regulator value zero; the predicates quantify over every relation-respecting test function, not just `L₂` or `L₃`.
- The unit vector at zero is zero by its explicit endpoint branch; treating zero as a unit would make that branch ill-typed.
- The unit vector at one is zero because the identity unit is additive zero; sending one to a basis vector would violate multiplicative additivity.
- For ℚ, the prime units `u(2),u(3),u(5)` are linearly independent, detected by their valuations; the three valuation functionals give the identity matrix on these three unit vectors.
- The zero function is a `FiveTermFunction`; the constant nonzero function is not, since it violates both endpoint conditions. A five-term relation with coincident arguments is not required as a raw rational expression.
- For `b:ℚ→ℚ` equal to one at two and zero elsewhere, both endpoint values are zero. At `(x,y)=(2,3)` the five-term arguments are `2,3,3/2,3/4,1/2`, with sum `1-0+0-0+0=1`; hence `FiveTermFunction b` is false. Endpoint conditions alone do not define the predicate.

### 3.3 Exterior residues and their signs

For a discrete valuation `v` on a field `K`, with residue field `k`, define resExterior:ΛⁿU(K)→Λⁿ⁻¹U(k) for `n≥1` by `res(π∧u₁∧…∧uₙ₋₁)=ū₁∧…∧ūₙ₋₁` and by zero on wedges of valuation units. Prove independence of the uniformizer and the alternating universal property. The unit-part homomorphism associated to `π` is `f↦residueUnit(fπ^(-v(f)))`; its value on `π` is the identity, and it is multiplicative on **all** nonzero elements. A rule that simply kills all nonunits is not multiplicative. Integrally in degree two, the exterior residue is `(-1)^(v(f)v(g)) tame(f,g)⁻¹`; rationally the sign disappears. (Goncharov [G04], §2, item 6, pp.17–18, and §6.1, p.52.)

For infinite `K` and infinite `k`, define the raw weight-three residue as zero on `B₃(K)`, as `v(y)[x̄]₂` on `[x]₂⊗y` when `v(x)=0` and zero otherwise, and as resExterior on `Λ³U(K)`. Prove well-definedness on five-term relations, raw commutation with the displayed differentials and naturality with ramification factor `e`. To obtain a cochain map to `Γ(k,2)[-1]`, multiply the component in source degree `i` by `(-1)^i`; the degree-two component is then the stated positive symbol residue. Define weight-two residue similarly. Integral weight-two commutation fails at a pole by the sign `(-1)^v(x)` and therefore requires rationalization or inversion of two. The residue API requires the following facts.

- A uniformizer followed by valuation units has the displayed residue, and a wedge of valuation units has residue zero; replacing the uniformizer leaves the map unchanged.
- On a weight-two symbol tensored with a unit vector the weight-three residue is its specialized symbol multiplied by the valuation of the tensor factor, with zero at a nonunit symbol argument.
- Under a valued field embedding residues commute with the residue-field map after multiplication by the ramification index.
- Adjacent components acquire the displayed alternating degree signs in the shifted cochain map. *Needs:* §3.2, place reduction on valuation units and the tame-symbol contract.

**Checks.**

- At `ord_t` on `ℚ(t)`, `res(t∧2∧3)=2∧3`, `res(2∧3∧5)=0`, and using the uniformizer `2t` gives the same answer.
- `res_t([x]₂⊗t)=[x]₂` for a constant unit `x≠1`, whereas `res_t([t]₂⊗a)=0` for a constant `a`. Using `v(x)` instead of `v(y)` fails this check.
- Raw residue sends `d([x]₂⊗t)` to `(1-x)∧x`, agreeing with the target differential before the shift sign. The alternating sign between adjacent degrees is required after shifting.
- `res(t∧u)=ū`, while `tame(t,u)=ū⁻¹`; `res(t∧t)=0` while `tame(t,t)=-1` integrally. At a pole of odd order the latter torsion discrepancy cannot be ignored integrally.
- `t·(2/t)=2` shows why killing both nonunit factors would fail to recover the nontrivial residue unit two. The uniformizer-unit decomposition instead gives unit parts one and two.

### 3.4 Generic configurations and the Bigrassmannian

Define genericVectorConfig m q as an ordered tuple in `F^q` for which every subset of at most `q` vectors is linearly independent. Take the free rational module of such tuples modulo simultaneous `GL_q(F)` action to obtain `C_m(q)`. Individual vector rescaling is **not** imposed. Deletion is `∂=∑_{i=0}^{m-1} (-1)^i delete_i`; projection is `p=∑ (-1)^i project_i` to the quotient by the selected vector, transported to a standard vector space. Prove basis independence in coinvariants, `∂²=p²=0` and `∂p+p∂=0`. The weight-three Bigrassmannian is the quotient retaining `3≤q<m`, with `BC_m³=⊕_{q=3}^{m-1}C_m(q)` and `D=∂+p`; terms below row three are killed by a quotient, rather than claimed to form a subcomplex. (Goncharov [G94], §3.1–3.2 and §3.10, manuscript pp.15–16 and 24–27; [GR], §7.1, (129)–(134), pp.61–63.)

Prove genericConfig_delete, genericConfig_project, bigrassmannian_d_sq and the row identifications. To map stable group homology, use decorated flags and the sum over dimension vectors of their quotient configurations, with the acyclic generic resolution and a compatibility under stabilization. This is stabilizedConfigurationComparison, whose naturality and independence of auxiliary complements are mathematical targets. Do not substitute the coinvariant generic complex alone for a full resolution. *Needs:* §3.2, bar resolutions and elementary linear algebra over an infinite field.

The generic-configuration API requires the following facts.

- Deleting a vector or projecting along a selected vector preserves the indicated smaller generic configuration; changing a quotient basis gives the same coinvariant class.
- The two squared differentials and their anticommutator vanish with the stated deletion signs, and the row quotient therefore has square-zero total differential.
- The decorated-flag comparison is independent of its auxiliary complements, natural under field embeddings and compatible with stabilization of the general linear group.

**Checks.**

- For `q=1`, genericity says each vector is nonzero. `(1,2)` and `(1,3)` define distinct simultaneous-`GL₁` orbits: independent rescaling would wrongly identify them.
- A tuple containing zero or, in dimension three, a dependent triple is nongeneric. The moment-curve tuple `v(t)=(1,t,t²)` at distinct rational parameters is generic by its Vandermonde minors.
- `BC₃³=0` and `BC₄³=C₄(3)`; the outgoing map from the latter to the truncated degree-three term is zero. Treating the truncation as a subcomplex produces a spurious row-two projection.
- On a tuple with two distinct deleted indices, the two orders of deletion have opposite signs. Deleting one vector and projecting at another likewise contributes two terms with opposite signs; this pins `D=∂+p`.

### 3.5 The three signed configuration maps

For an infinite field define geometricTrilogGroup on ordered six-point configurations in `ℙ²(F)` using [G95], Definition 1.5, pp.211–212: coincident points or four collinear points give zero; all seven-point alternating boundaries give zero; the specified two-line incidence relation below gives the third family of relations. Alternation follows by applying the seven-term relation to a tuple with a repeated point (Lemma 1.7, p.212). Thus it is a consequence rather than an extra normalization choice.

Define the elementary triangle triangleSymbol(z) for `z≠0,1` by vertices `x₁,x₂,x₃` and side points `y_i∈x_ix_{i+1}`, ordered `(x₁,x₂,x₃,y₁,y₂,y₃)`, with source parameter

```text
s(y₃|x₁,x₂,y₁,y₂)
  = det(y₃,x₁,y₂) det(y₃,x₂,y₁)
      / (det(y₃,x₁,y₁) det(y₃,x₂,y₂)) = z.
```

This is the inverse of our projected-ratio convention. A coordinate representative is `(e₂,e₁,e₃,e₁+e₂,e₁+e₃,e₂-z e₃)`. Its four determinants in the displayed order are `z,-z,z,-1`, so the parameter is `z`. The denominators are nonzero for `z≠0`; the side points become collinear at `z=1`. Denote that endpoint configuration by `η`, and extend triangleSymbol(1)=η, triangleSymbol(0)=triangleSymbol(∞)=0. Its symbol endpoint is the retained quotient class `[1]₃`; it is not set to zero by definition. The triangle parameter is the displayed determinant ratio with precisely this source order. (Goncharov [G95], Fig.1.6–1.7 and the definition preceding Definition 1.5, pp.210–211; (1.6), p.203; the extended presentation after Theorem A, pp.293–294.)

Put trianglePrime(z)=-triangleSymbol(z)-2triangleSymbol(1-z)+η. If `m₂` is the intersection of the distinct lines `m₀m₁` and `m₃m₄`, and `m₅` is in generic position to this arrangement, impose

```text
3⟨m₀,…,m₅⟩ = Σ_{i=0}^4 (-1)^i
  trianglePrime(s(m₅|m₀,…,m̂_i,…,m₄)).
```

This is the specific incidence relation of Definition 1.5; it is not asserted for every tuple with just one collinear triple. [G95] restates this relation in §3, p.263, with an additional term `(1/3)η` on the right; Definition 1.5 and the inverse formula of [G95], §5.2, case (c), p.286, agree with each other without it, and the relation here is that of Definition 1.5. Define geometricTrilogComparison M₃ by the inverse of the triangle-symbol map. Construct this inverse explicitly by the reduction of [G95], §5.2, pp.285–287: fix the endpoint `M₃η=[1]₃`, the class of `[x]+[1-x]+[1-x⁻¹]`; evaluate the displayed two-line relation in symbols; reduce a tuple with one collinear triple to such relations; for a generic tuple put `a=(m₀m₁)∩(m₄m₅)`. The seven-term relation for `(m₀,…,m₅,a)` gives `⟨m₀,…,m₅⟩=-Σ_{i=0}^5(-1)^i⟨m₀,…,m̂ᵢ,…,m₅,a⟩`, equivalently `Σ_{i=0}^5(-1)^i⟨a,m₀,…,m̂ᵢ,…,m₅⟩` with `a` placed first, and every tuple on the right has a collinear triple. [G95], §5.2, case (e), p.287, prints the coefficients `(-1)^i` with `a` placed last; with that sign the seven-term relation for this seven-point tuple would force `2M₃⟨m₀,…,m₅⟩=0`, so the sign here follows the relation. Check independence of the auxiliary reduction, then the degenerate and seven-term relations; compare with the coordinate 22-term relation and its inversion and three-term consequences. The endpoint constants in these calculations must be retained. Proposition 5.3 and Lemma 5.4, pp.287–289, establish inverse identities, and Proposition 5.6, pp.289–293, checks relations. Theorem A, diagram (5.20), p.293 identifies the resulting complexes with **identity** maps in the two lower degrees.

The triangle and comparison API requires the following facts.

- The coordinate triangle has the displayed parameter; its one-endpoint is the constant class, and its zero and infinity endpoints vanish.
- The comparison sends each triangle to the matching explicit symbol and its constant endpoint to the symbol at one.
- The explicit comparison and triangle-symbol map are inverse linear isomorphisms, commute with field embeddings and respect the displayed cobracket.
- Every seven-point alternating boundary maps to zero, including the allowed nongeneric incidence configurations.

Together they construct a specified quotient map, not just a choice of a preimage under the cobracket. *Needs:* §3.1's explicit presentation, projective linear algebra and the geometric relations just specified.

For generic vectors in dimension three fix `|ijk|=det(v_i,v_j,v_k)` and define

```text
r(i|jklm)=|ijl|·|ikm|/(|ijm|·|ikl|),
T(1,…,6)=|124|·|235|·|136|/(|125|·|236|·|134|).
```

All determinants in denominators are nonzero by genericity. The projected ratio is inverse to the convention used in [G95, (1.6)]; its order is fixed by this displayed formula, not by the word “cross-ratio.” Define maps from the bottom row by

```text
r₄ = -3 Alt₄(u|123| ∧ u|124| ∧ u|134|),
r₅ = Alt₅([r(1|2345)]₂ ⊗ u|345|),
r₆ = 18 M₃(ℙv₁,…,ℙv₆).
```

Here `M₃` is the geometric-to-symbol isomorphism constructed above in §3.5, with its triangle and endpoint normalization fixed there. Use an infinite field and rational coefficients. Prove `δr₅=r₄∂`, `δr₆=r₅∂`, the seven-term identity `r₆∂=0`, and vanishing of the projected-row contributions, giving configurationChainComparison:BC³→Γ(F,3) with the indicated degree reversal. The entire comparison is eighteen times [G95]'s complex map: its top component is projectivization followed by `M₃`, not an equality inferred from the cobracket. The lower factors are determined as follows.

Write `D_j=det(v₀,…,v̂_j,…,v₃)`. Expansion of [G95], §3.2, p.264 gives `f₀⁽³⁾=Σ_i(-1)^i ⋀_{j≠i}u(D_j)` with the remaining `j` in increasing order. Grouping the 24 terms of our `Alt₄` by the missing determinant gives `Alt₄(u|012|∧u|013|∧u|023|)=-6f₀⁽³⁾`, so `r₄=18f₀⁽³⁾`.

For five vectors let `q_i` be our projected ratio at `v_i`, with the other four indices increasing, and let `D_ij` be the increasing determinant after deleting `i,j`. The ratio in [G95, (1.6), p.203] is `s_i=q_i⁻¹`. The rational five-term relation implies `[s_i]₂=-[q_i]₂`. Formula (3.5), p.266 therefore becomes

```text
f₁⁽³⁾ = (1/3) Σ_i (-1)^i [q_i]₂ ⊗ Σ_{j≠i} u(D_ij).
```

In `r₅`, first fix the pivot `i` and the second index `j`. Each of the six orders of the remaining three indices contributes the same term: its permutation sign cancels the alternating cross-ratio class; determinant signs disappear because `u(-1)=0`. Summing gives `r₅=6Σ_i(-1)^i[q_i]₂⊗Σ_{j≠i}u(D_ij)=18f₁⁽³⁾`. Proposition 3.8, pp.266–267 proves the lower square. Projectivization on p.268 and Theorem A, diagram (5.20), p.293 then prove the upper square **in the quotient**, since the other two components of that diagram are identities. The seven-term relation is a defining geometric relation. The projected top square is established with duality in §3.6 and is not an input to this deletion-square calculation. This route fixes the top scalar without a formula for the full skew-symmetrization of `T`. [G94, (3.3), p.17] uses a different lower normalization.

For the lower projected squares use the alternative expression `r₅=-(3/2)Alt₅([r(0|1234)]₂⊗u|012|)`. To derive it, partition the ten minors into those containing the pivot and those not containing it, and tensor their total logarithmic sum with `Σ_i(-1)^i[q_i]₂=0`. The two alternating expressions count each containing-pivot minor four times and each other minor six times, respectively, giving the factor `-3/2`. After projection from six vectors in dimension four this expression has two common pivots in both its projected ratio and determinant. Their transposition fixes the summand, so alternation kills it. The same argument for `r₄p` has three four-by-four determinants with two common pivots. This proves the lower projected identities without transporting an unknown top normalization. See [G94], Theorem 3.12(a)–(b), pp.22–23, for this symmetry argument.

The raw triple ratio remains useful for explicit coordinate calculations. No identity `r₆=-(1/5)Alt₆[T]₃` or `Alt₆[T]₃=-90M₃` is used: establishing either would require an additional quotient-level calculation. In particular the coefficients in [GR, (142), (144), pp.65–66] cannot be copied into this chain map. *Needs:* §§3.1, 3.4, the geometric presentation above and Plücker identities. The deletion squares use only these inputs; the projected top square is proved after Gale duality in §3.6.

The projected and triple ratios are the displayed determinant formulas, with the rational witnesses below. The configuration API requires the following facts.

- Projected and triple ratios are the displayed determinant quotients on the generic locus, invariant under independent vector rescaling.
- The three configuration maps have the displayed coefficients and are invariant under simultaneous invertible linear coordinate change.
- The top map is exactly eighteen times the geometric comparison, and kills every seven-point alternating boundary.
- The deletion squares commute with the polylogarithmic differential; the lower projection squares vanish by the common-pivot symmetry. The triple-ratio configuration target is realized by the geometric comparison and its coordinate reduction, rather than by the unverified alternating formula.

The top map is projectively invariant; the determinant-valued middle map is not. Naturality in field embeddings and independence of the chosen volume form follow from [G95], Lemma 3.3, Proposition 3.7 and Theorem A.

**Checks.**

- For a generic six-tuple the reduction through `a=(m₀m₁)∩(m₄m₅)` has coefficients `-(-1)^i` when `a` is placed last. A definition using `+(-1)^i` there is incompatible with the seven-term relation for `(m₀,…,m₅,a)`: together they force `2M₃⟨m₀,…,m₅⟩=0` for every generic six-tuple.
- A coincident-point configuration is zero; over ℚ the elementary configuration `T(1)` maps to nonzero `[1]₃`, detected by `L₃(1)=ζ(3)>0`. Over an arbitrary infinite field it maps to its quotient class, without a nonvanishing assertion. Over `𝔽₂(t)`, the admissible relation `R(1,1,1)=7[1]` gives `[1]₃=0` rationally. Applying the zero rule for **four** collinear points to three-collinear configurations would wrongly erase the incidence relation.
- The displayed triangle coordinates give source parameter two at `z=2` and one at `z=1`; our inverse projected parameter would instead give `1/2` in the first case. Ordering vertices and side points alternately is an odd permutation of the specified six-tuple and negates its geometric class.
- On moment-curve parameters `(1,2,3,5,7)`, `r(1|2345)=6/5`; interchanging the last two points gives `5/6`. This pins the projected-ratio order.
- For vectors `(1,8,2),(7,3,11),(1,3,2),(9,4,3)`, the first map is `18 u(5)∧u(67)∧u(197)`. The coefficient `2 Alt₄` in place of `-3 Alt₄` fails this witness.
- On moment-curve parameters `(1,2,3,5,7)`, `δr₅=36u(2)∧u(3)∧u(5)`. Multiplying the first vector by two changes the middle value; it is not an invariant of independently rescaled projective points.
- Rescaling any one vector leaves projected cross-ratio and triple ratio unchanged, since its determinant powers cancel. Repeated vectors violate genericity and may give a zero denominator; totalized division is not the geometric API.
- On six parameters `(1,2,3,5,7,11)`, `T=10/9`. The generic tuple `(e₁,e₂,e₃,(1,1,1),(1,2,3),(1,3,2))` has `T=1`; it must not be excluded or assigned zero merely because the trilogarithm endpoint is one.
- On the nonconic six-vector tuple above, apply `δ₂⊗id:B₂⊗U→Λ²U⊗U` to `r₅∂`. Its `(u(2)∧u(3))⊗u(2)` coefficient is `-60`, so the same iterated boundary coefficient of `18M₃` must be `-60`. The iterated boundary of the unscaled `Alt₆[T]₃` has coefficient `+300`; this coefficient agrees only after multiplication by `-1/5`. This remains a useful necessary test, but it does not identify either top class modulo `ker δ₃`.
- On the elementary triangle of §3.5 with parameter two, the geometric extension gives `r₆=18[2]₃`; parameter one gives `18[1]₃`. These test the actual top normalization before applying any boundary or period.

### 3.6 Gale duality and top cohomology

Define Gale duality on a generic rank-`q` configuration of `m` vectors from the kernel of `F^m→F^q`, of dimension `m-q`, with coordinate functionals giving the dual configuration. Prove independence of the chosen kernel basis, double duality, and deletion–projection compatibility. For a normalized matrix `(I_q,B)`, a dual matrix is `(-Bᵀ,I_{m-q})`. The duality API requires the following facts.

- Replacing the kernel basis does not change the simultaneous-linear orbit of the dual configuration.
- Taking the dual twice returns the original orbit, and duality interchanges deletion with projection with the indicated chain signs.
- The geometric comparison of a dual six-point configuration is the negative of the original comparison. For the last identity use [G95], Theorem 8.1, p.304: expand a configuration and its dual by the incidence relations into the projected trianglePrime terms of (8.2), then cancel the paired terms using the cross-ratio permutation identities (8.1) and (8.3), pp.304–308. It gives `M₃(C*)=-M₃(C)` in the quotient. Lemma 7.5 and Corollary 7.6, pp.302–303, turn projection of seven vectors in dimension four into deletion of its rank-three dual, so the seven-term relation proves `r₆p=0`. The lower projected identities were proved directly in §3.5. With unnormalized alternation, `Alt₆ M₃=720M₃`; no equality to an alternating raw triple symbol is needed. This does not assert a correction of [GR], Proposition 7.2, p.67.

Now prove configurationChainComparison: the three maps of §3.5, with the projected top identity just proved by Gale duality, form the complete Bigrassmannian-to-polylogarithmic chain map. *Needs:* §3.5’s deletion squares and lower projected identities, and geometricTrilogComparison_dual above. This completes the chain comparison before it enters §3.7.

Prove steinbergBoundaryImage: the image of `B₂(F)⊗U(F)→Λ³U(F)` is exactly the span of `(1-x)∧x∧y`. It follows that `H³Γ(F,3)≃K₃^M(F)_ℚ`. Transport the supplier's Milnor norm through this isomorphism to obtain topCohomologyTransfer, natural and satisfying `N∘res=[L:F]`. Prove suslinTopComparison, comparing the stabilized configuration map in degree three with this Milnor quotient, with its scalar fixed by the configuration normalization. The classical top-degree Suslin theorem supplies `gr³_rank K₃≃K₃^M`; it does not establish the lower-degree isomorphisms. (Goncharov [G94], §3.8–3.10, manuscript pp.23–27; [GR], after Theorem 1.3, p.7; K2SymbolsBrauer §§5.4, 8.2, 10.9 and 10.24, and K3BlochGroups Layer 4.)

**Checks.**

- For the rank-two four-vector tuple `(1,0),(0,1),(1,2),(1,3)`, the displayed dual is `(-1,-1),(-2,-3),(1,0),(0,1)`. Double duality recovers the original orbit.
- `M₃(C*)+M₃(C)=0`, while `M₃(T(1))` is not forced to be zero. This detects a mistaken duality-invariance sign.
- A Steinberg triple `(1-x)∧x∧y` is zero in `H³`; the residue of `t∧2∧3` is nonzero over ℚ when evaluated in the free exterior group before imposing Milnor relations.
- On a genuine Milnor triple, transfer satisfies `N res=[L:F]`, whereas applying the unit norm independently to three wedge factors would multiply a triple from the base by `[L:F]³`. The latter recipe is not the transfer. Number fields have rational top Milnor K₃ zero, so they do not supply a nonzero witness for this distinction.

### 3.7 Primitive K-theory and regulator classes

Use the decorated-flag resolution to define configurationHomologyMap_i: `H_{6-i}(GL_m(F),ℚ)→H^iΓ(F,3)` for `i=1,2,3` and `m≥3`. Prove compatibility with stabilization and rankTwo_vanish by an equivariant contracting section on the rank-two subgroup. Restrict along the primitive Hurewicz map to obtain weightThreeKComparison_i: `K_{6-i}(F)_ℚ→H^iΓ(F,3)`, vanishing on rank at most two. The stable maps factor through `K_{6-i}(F)_ℚ/F²_rank`. Their restrictions to `F³_rank` factor through `gr³_rank=F³_rank/F²_rank`; vanishing on rank two alone does not identify that subquotient with all of K-theory. No identification of the rank and Adams filtrations is invoked. The general degree-one isomorphism remains conjectural. In degree two over characteristic-zero fields the canonical Adams-weight comparison of §4.7 is a theorem; identifying this particular calibrated configuration map with that comparison, and identifying the rank and Adams filtrations, remain separate conjectural assertions. (Goncharov [G94], §3.10, (23), Lemma 3.18 and Conjecture 3.19, pp.24–27; [G95], Theorem A, p.293, and §6, pp.295–296; [GR], discussion (8)–(12), pp.6–7.)

The analytic functional relations of §3.1 give trilogarithmDescent:B₃(ℂ)→ℝ. Prove that `L₃∘r₆` is a measurable degree-five cocycle and that its class is the corresponding nonzero real Borel class. The source's Chern-class computation proves its nonzero rational proportionality in original real coordinates; after the Tate-coordinate conversion the scalar has an additional `π²`. For the map chosen in §§3.5–3.6 the source's geometric comparison is multiplied by exactly eighteen in every degree, so its cohomology and K-theory maps and the original real regulator scalar are multiplied by eighteen as well. No raw triple-ratio quotient identity is involved. Name these steps configurationBorelClass and rationalRegulatorCalibration_three. Rationality does not follow just because a real cohomology space is one-dimensional. (Goncharov [G94], §5.4, Theorem 5.11, manuscript pp.45–46; [G95], §9.2, pp.310–311; [G04], §5.5, pp.47–51.) *Needs:* §§3.4–3.6, the universal regulator of the geometric and motivic supplier contract, ArithmeticKTheory §§3.3–3.4 and Borel covolume contracts.

The period witness is `L₃([1])=ζ(3)` over ℚ, while the Tate-divided Borel coordinate has period in `ℚˣπ⁻²ζ(3)`. For a general number field, multiplication by `π²` in each of `r₁+r₂` rows changes exponent `-2r₁-5r₂` to `-3r₂`, exactly the determinant exponent required here. A putative rational scalar without this period conversion fails already over ℚ.

The K-theory comparison API requires the following facts.

- Every allowed finite-rank configuration homology map is natural and agrees with the stable map after stabilization.
- Classes from rank at most two have zero image; restricting to the rank-three filtration therefore induces the displayed associated-graded map.
- The descended trilogarithm sends each symbol to its single-valued value, and its composition with the top configuration map is the normalized nonzero Borel cocycle.
- The calibrated real period map includes the stated π² factor before any rational-image or covolume assertion.

**Checks.**

- In degree one over a field, Hurewicz followed by determinant sends a unit to itself in `Fˣ⊗ℚ`; for example two over ℚ stays nonzero. The construction uses the identity component of K-theory and has no degree-zero rank class.
- For two independent degree-one classes `a,b`, the coproduct of their homology product has cross term `a⊗b-b⊗a`; their product is not primitive. Over `F=ℚ`, take the classes of two and three. Keeping all stable homology instead of the primitive image fails this control.
- A class from `GL₂(F)` maps to zero under each rank-three configuration map; it cannot be retained as an extra rank-three summand. The comparison uses the rank filtration, with no automatic Adams identification.
- A stabilized `GL₃` class has the same image when represented in `GL₄`; choosing an independent scalar at each rank fails this compatibility.
- After the normalization and Borel adapters are proved, a primitive weight-three class over ℚ has a nonzero period proportional to `ζ(3)`. Zero maps satisfy the preceding compatibility tests but fail this nonvanishing control.
- trilogarithmDescent([1]₃)=ζ(3) and trilogarithmDescent([-1]₃)=-(3/4)ζ(3). The endpoint is retained, and the descent cannot be the zero functional.
- Inversion gives equal periods at `x` and `x⁻¹` in weight three; the normalized three-term relation has zero period after subtracting `[1]₃`. An alternating weight-two sign fails this test.

### 3.8 Cycle lifting, special values and the exact proof boundary

Prove the unconditional existence headline `zagier_three_exists`: for every number field there are `d=r₁+r₂` raw rational symbol families `yⱼ` satisfying `IsCycle3`, with `Z₃(F;y)=qζ_F(3)` and `q∈ℚˣ`. Lift a rational K₅ basis through the configuration maps, apply the regulator comparison and use Borel's covolume theorem. Since `d>0`, rescaling one family can make `q=1`. (Goncharov [G95], Theorem 1.1, p.203; [G94], §3 and Theorem 5.11.) The Lean headline uses an equivalence from `Fin(r₁+r₂)` to all infinite places, so no row can be omitted or repeated.

The stronger target cycleLifting_three says that every `z∈kerδ₃` over an infinite field has a stable degree-five rational group-homology lift giving that cycle under the configuration comparison. For a number field, its primitive projection has the same pairing with the primitive Borel class. The source asserts the required passage using the equivariant spectral sequence for **all** projective configurations, not just generic ones. A full proof must compute the higher differentials and the degenerate-row contributions. Those computations are not displayed in [G95, §9.2, pp.310–311] and are a proof obligation of this target. One must also verify stabilization. Apply stableHomology_primitiveProjection of §2.2 to the lift and then the inverse of stableK_hurewiczPrimitive; the projection preserves the primitive Borel pairing. This gap is not an assertion that the published existence theorem is conjectural.

After that target and the exact normalization adapter, prove regulatorImageContainment_three: the ℚ-span of every `L₃` regulator column lies in the ℚ-span of `π²` times the selected Borel regulator image. Taking determinants gives `zagier_three_everyFamily`:

```text
for all y₁,…,y_d ∈ ker δ₃,  Z₃(F;y)=q ζ_F(3) for some q∈ℚ.
```

This consequence needs containment of period images; it does not need or prove an isomorphism from all of `H¹Γ` to K₅. It is conditional on the stated cycle-lifting proof obligation in the build. (Goncharov [G95], §9.2, pp.310–311, together with the Borel covolume formula.) *Needs:* §3.7, the all-configuration spectral sequence and §2.2’s primitive projection and inverse Hurewicz identification.

**Checks.**

- For `F=ℚ`, `[1]₃` is a cycle with `Z₃=ζ(3)` and nonzero determinant. Omitting the real row would give an empty determinant and fail this case.
- For `F=ℚ(i)`, the family `[1]₃` has `Z₃=π³ζ(3)/2=16ζ_F(3)`, since `ζ_F(3)=π³ζ(3)/32`.
- For a zero family or two equal columns, the every-family formula has scalar zero. It cannot be rewritten as `ζ_F(3)=q·Z₃` for every family.
- Rational column change by a matrix `A` multiplies `Z₃` by `det A`; singular `A` is allowed in the every-family statement. Full real rank alone would not imply rationality of those coordinates.

### Examples

The endpoint `[1]₃` simultaneously detects the correct odd-weight quotient, supplies a nonzero regulator period and fixes the number of archimedean rows. The rational prime wedges in §§3.2 and 3.5 detect differential signs before any real regulator is applied. The generic configuration with triple ratio one explains why admissibility must allow that endpoint.

### Dependencies

PolylogarithmFunctions, Layer 2, the rational pre-Bloch group, Milnor symbols and norms, primitive K-theory, bar homology, Borel regulators and the early universal Chern regulator. General motivic quasi-isomorphy and derived transfers are not used for the existence theorem. The every-family result has the additional all-configuration cycle-lifting obligation stated in §3.8.

## Layer 4: inductive Bloch groups and the meaning of Zagier's statement

### 4.1 Rational-curve relations and specialization

Construct higherBlochGroup F n for all infinite fields simultaneously by induction on the weight. The rational-curve presentation follows [GR]; [G95] instead permits families on arbitrary smooth connected curves, and equality with that broader presentation is not assumed here. Start with `B₁(F)=U(F)`. For `n≥2`, form the raw map on `ℚ[ℙ¹(F)]`, with endpoint symbols zero, given by `δ₂[x]=(1-x)∧x` or `δₙ[x]=[x]ₙ₋₁⊗u(x)` for `n>2`. Let `Aₙ(F)` be its kernel. Define `Rₙ(F)` to be generated by `[0]`, `[∞]` and all `sp₁ α-sp₀ α` for `α∈Aₙ(F(t))`; set `Bₙ(F)=ℚ[ℙ¹(F)]/Rₙ(F)`. Specialization is projective: a pole goes to infinity, not to an arbitrary field-totalized value. The differential on the quotient is defined only after proving that these generators lie in its raw kernel. (Goncharov [G95], Introduction, pp.198–199, and §1, paragraph 9, Lemma 1.16, pp.220–222; [GR], §1.1, pp.4–5.)

Prove relationSpecialization_induction: rational-curve relations remain relations after the valuation specializations needed in the induction. Prove higherDelta_wellDefined, specialization_delta, functoriality for field embeddings and independence of representatives. For a valuation with arbitrary residue extension, include the specialization theorem on that residue field; a proof only for rational points over `F` is insufficient. The required induction includes rational functions with poles and specialization at zero or one. When a presentation uses only rational places, the extension to general discrete valuations is an additional proof obligation rather than a consequence of notation.

The inductive group API requires the following facts.

- The quotient symbols at zero and infinity vanish; at every other symbol the differential has the displayed lower-weight formula.
- Every relation specializes to a relation over the actual residue field, including poles and nonrational places.
- Field embeddings induce symbol-preserving linear maps that respect identity and composition.
- Specialization and the differential commute in the declared residue convention, independently of representatives.

The construction is independent of a chosen analytic embedding; analytic periods enter §4.3. *Needs:* §3.3, the lower-weight quotient and its specialization theorem, rational-function valuations and residue reduction.

**Checks.**

- The rational function `1/t` specializes to infinity at `t=0`, so its raw specialized symbol is zero. It is not evaluated by Lean's total inverse at zero and then treated as a finite value without explanation.
- Weight one is `U(F)` with `[xy]=[x]+[y]`, not the free symbol module. In every higher weight `[0]=[∞]=0`.
- In odd weight `[1]` may be nonzero: over ℚ the weight-three map to `L₃` gives `ζ(3)`. In even weight the inversion relation gives `[1]=0` over ℚ.
- A constant family specializes to the same class at zero and one. A nonconstant family is admitted only after its raw boundary is zero; an arbitrary difference `[f(1)]-[f(0)]` is not a relation by definition.
- At residue characteristic two the uniformizer-unit formulas still make sense; the rational construction has already killed the integral sign discrepancy. No integral descent theorem is inferred from this fact.

### 4.2 Complexes, inversion and low-weight comparison

For every infinite field `F`, every `n≥2` and every `x≠0`, prove higher-symbol inversion: `[x]ₙ+(-1)^n[x⁻¹]ₙ=0`. Weight one instead satisfies `u(x)+u(x⁻¹)=0` (Goncharov [G95], §1, paragraph 9, p.221). Include the endpoint consequence `[1]ₙ=0` for even `n`, and retain `[1]ₙ` for odd `n`. For `n≥2`, define higherPolylogComplex F n in degrees `1,…,n` by

```text
Bₙ → Bₙ₋₁⊗U → Bₙ₋₂⊗Λ²U → … → B₂⊗Λⁿ⁻²U → ΛⁿU.
```

At weight one use `U(F)` alone in degree one; no weight-zero symbol group is introduced. The differential for `n≥2` is `δ` on the symbol factor followed by wedge; its square is zero from the repeated unit and the lower-weight relation calculation. Define specialization maps of these complexes with the same residue/shift signs as §3.3. Prove naturality and commutation with the differential at each degree. These are higherPolylogComplex_d_sq, higherComplex_map and higherComplex_specialize. (Goncharov [G95], (0.1)–(0.3), p.199, §1, paragraph 9, (1.25)–(1.27), pp.220–222, and paragraphs 14–15, pp.237–241; [GR], §1.1, (5)–(6), pp.4–5.)

Use K3BlochGroups §4.21's rationalCurve_relations_eq to identify the explicit rational five-term quotient with the weight-two rational-curve presentation, with the boundary negated as in the conventions. The quotient universal property supplies explicitToInductive_two_isomorphism; the isomorphism is a transport of the supplier's presentation equality, not a second rigidity proof. Neither the full pre-Bloch group nor full Quillen K₃ is invariant under adjoining a variable. State explicitToInductive_three as the natural surjection from the explicit weight-three presentation to the inductive group, checking every defining relation by a rational-curve family. Its injectivity is the comparison conjecture and is not used earlier. State polylogMotivicComparisonConjecture as the proposition that `H^iΓ(F,n)` identifies with the weight-`n` Adams piece `grⁿ_γK_{2n-i}(F)_ℚ`, naturally and compatibly with residues. It is not declared an instance or a theorem in every degree. Section 4.7 proves the next-to-Milnor case i=n−1 in characteristic zero, without asserting the general comparison or identifying a configuration map. The alternative comparison using `grⁿ_rank` also requires the independent rank–Adams comparison conjecture. (Goncharov–Rudenko [GR], §1.2, p.9; Conjecture 1.4 and preceding discussion, pp.6–7.) *Needs:* §4.1, K3BlochGroups Layer 4, SchemeKTheoryOperations §§3.3 and 5.1–5.2, and K2SymbolsBrauer's compatible Milnor/Quillen residue sequences.

The higher-complex API requires the following facts.

- Each differential has the displayed symbol-and-wedge formula and its square is zero in every degree.
- Field maps induce chain maps, and the projective specializations commute with the differential with the declared shift signs.
- Weight two agrees with the explicit five-term complex through the supplier's presentation equality; the weight-three presentation map is surjective and preserves every symbol and its boundary.

**Checks.**

- For `F=ℚ(a,b)`, the class `{t,a,b}` has residue `{a,b}` at `t=0`, which is nonzero: the further `a`-residue is the non-torsion unit `b` up to inversion. Thus full Quillen K₃ is not constant under `F→F(t)`; passing to its indecomposable quotient is essential. A constant Bloch-kernel class specializes to itself at both zero and one. The class `[3]₂` is outside the kernel and is not covered by rigidity.
- The general complex specializes to the displayed three-term weight-three complex in §3.2 only after applying the explicit-to-inductive comparison; no conjectural inverse is inserted.
- At `n=1,x=2`, the higher-weight sign would give `u(2)-u(1/2)=2u(2)`, of two-adic valuation two rather than zero; the weight-one sign gives `1+(-1)=0`.
- At `x=1,n=3`, inversion is the tautology `[1]-[1]=0`; at `n=4` it gives `2[1]=0`, hence `[1]=0` rationally.
- At `x=3,n=2`, `δ₂[3]=2∧3≠0`. A convention with the supplier's unnegated boundary gives `-2∧3` and must be converted.
- In degree one there is no incoming differential, so `H¹=kerδₙ`. In degree `n`, the quotient by Steinberg wedges gives the Milnor group; it is not the full Quillen group without its appropriate comparison.

### 4.3 Analytic evaluation and constancy

Let `n≥2`. For a raw rational family `α(t)=∑qᵢ[fᵢ(t)]`, define `cycleEvaluationₙ(α)(t)=∑qᵢLₙ(fᵢ(t))` away from the finite set of zeros, poles and branch degenerations. If `α∈Aₙ(ℂ(t))`, prove `cycleConstancyₙ`: this function is constant, and its continuous projective limits agree at every specialization. The proof differentiates the explicit single-valued formula, uses the lower-weight relation factorization and then extends through the exceptional points by continuity. Hence `Lₙ` kills `Rₙ(ℂ)` and gives higherBlochPeriod:Bₙ(ℂ)→ℝ. This is stronger than just observing the familiar inversion and distribution equations. One must prove constancy for **every** rational-curve cycle used in the definition. (Goncharov [G95], §1, paragraph 9, Proposition 1.18 and Corollary 1.19, pp.223–224; [GR], §1.1, p.4, inductive definition and the single-valued functional-equation requirement.)

The analytic relation descent and the induction in §4.1 are separate load-bearing targets. Where a source invokes a general functional-equation theorem, its proof must supply precisely this kernel-to-constancy implication, including the endpoints. No result that all algebraic functional relations are generated by the inductive relations is assumed. The evaluation API requires the following facts.

- Evaluation is rationally linear in raw families and its projective continuous limits agree with evaluation of their specialized symbols.
- Every raw rational-curve kernel element has constant evaluation, with no additional genericity restriction on its specializations.
- The induced period is a linear functional on the inductive group, evaluates each symbol by the single-valued function and commutes with field embeddings followed by the chosen complex embedding. *Needs:* PolylogarithmFunctions §4.5’s general single-valued differential, Layer 3, §§4.1–4.2 and the explicit higher differential formula.

**Checks.**

- A constant rational symbol cycle has its expected constant period; a term specializing to a pole contributes `Lₙ(∞)=0`.
- The raw family `[t]₃` is not a kernel element: its boundary `[t]₂⊗u(t)` is generally nonzero. Its nonconstant analytic value is not a counterexample to cycle constancy.
- The five-term cycle at weight two specializes to zero period; its proof agrees with PolylogarithmFunctions.blochWigner_fiveTerm and the supplier's rigidity convention.
- The three-term weight-three relation evaluates to the nonzero constant `ζ(3)` before subtracting `[1]₃`; the normalized relation evaluates to zero. A rule making every relation a homogeneous sum without the endpoint correction fails here.

### 4.4 Three Zagier assertions and their normalization

Define isPolylogCycleₙ(y) by `δₙ y=0`, and define zagierDeterminant as `Zₙ` in the conventions. The raw `periodMatrix` and `normalizedPeriod` in Suggested.lean evaluate raw finite sums; when the cycle condition and relation descent hold, this equals the quotient period determinant. Define three distinct propositions for a number field and integer `n≥2`:

```text
Rational existence: ∃ cycle family y and q∈ℚˣ, Zₙ(F;y)=q ζ_F(n).
Every-family rationality: ∀ cycle families y, ∃ q∈ℚ, Zₙ(F;y)=q ζ_F(n).
Regulator-compatible comparison: a specified K-theory-to-cycle map and/or
  period-image identification with the calibrated Borel rational image.
```

The last proposition must state whether it includes only a map **into** cycles or also containment of **all** cycle periods in the Borel rational image. Those are different clauses. The map plus Borel's real isomorphism gives existence; all-cycle image containment gives every-family rationality. Neither conclusion entails an abstract motivic isomorphism. A real full-rank map alone gives neither rational conclusion without a rational normalization theorem. (Zagier [Z90], §8, pp.415–417; [GR], Theorem 1.2, p.5; Goncharov [G95], Theorem 1.1, p.203.)

Prove zagierAssertion_implications with these explicit clauses and zagierPeriod_calibration: for arbitrary rational K-theory columns whose calibrated period columns equal `λₙπ^(n-1)` times Borel columns with `λₙ∈ℚˣ`, their determinant is in `ℚ·√|disc F|π^(-eₙ)ζ_F(n)`. If the K-theory columns form a rational basis of the Borel regulator domain, the coefficient is nonzero. Prove the empty-determinant formula, basis-change and row-permutation rules, and invariance of rational proportionality under replacing a chosen complex embedding by its conjugate. The named predicates express statements of conjectures at general weights, not automatic truth values. *Needs:* §4.3 and BorelRegulators §§2.3 and 5.1–5.4 with its exact coordinate conversion.

The raw matrix definition used by the acceptance test is defined for a natural weight, any field and any row and column index type. Its normalized determinant additionally requires a number field and a finite square index type with decidable equality. Their intended arithmetic use has n≥2 and exactly the dₙ selected rows, so dₙ≤N and natural subtraction in the exponent agrees with integer subtraction. Explicitly, `periodMatrix n σ c` has entry `Σ_x c_j(x)Lₙ(σ_i(x))`; `normalizedPeriod n σ c` multiplies its determinant by the factor in the conventions. Only this prescribed row choice enters a Zagier assertion.

- `periodMatrix` is rationally linear in each finite symbol column and its entries commute with transport of the row and column indices.
- `normalizedPeriod` is alternating and multilinear in the columns, changes by the determinant of a rational column transformation and has the displayed empty-matrix value.
- A quotient cycle gives the same determinant for every raw representative once relation descent is proved; the rational-existence and every-family assertions have exactly the distinct scalar conditions displayed above.

**Checks.**

- Odd `n` uses `d=r₁+r₂` and exponent `nr₂`; even `n` uses `d=r₂` and exponent `n(r₁+r₂)`. Substituting `N=r₁+2r₂` proves both from `n(N-d)`.
- Over ℚ at weight three, the one-column raw family `2[1]₃` has period matrix entry `2ζ(3)` and `Z₃=2ζ(3)`. It is a cycle, so scaling changes the rational factor rather than the assertion.
- Over `ℚ(i)` at weight two, `Z₂([i])=3ζ_F(2)`; at weight three, `Z₃([1])=16ζ_F(3)`. The discriminant factor is `1/2` in both, and the π powers differ.
- For `F=ℚ,n=3`, the zero K-class and zero symbol column satisfy calibration `0=λ₃π²·0` and give determinant zero. More generally a positive-size square matrix with a zero column has determinant and `normalizedPeriod` zero. Such columns are not a basis. Every-family rationality permits `q=0`; rational existence requires nonzero determinant because `ζ_F(n)>0`.
- If `d>0`, a nonzero rational factor can be normalized by scaling one column. If `d=0`, no column exists to scale and the value is fixed by the empty determinant.
- Changing a complex representative negates its even-weight row but leaves the odd-weight row unchanged. Reordering columns changes the determinant by the permutation sign; rational proportionality survives.

### 4.5 Explicit weight-four cycles

For an infinite field `F`, let explicitRawCycleFour F ⊆ ℚ[F] be the kernel of the ℚ-linear map `[x]↦[x]₃⊗u(x)` into `B₃^exp(F)⊗U(F)`, where `B₃^exp`=trilogGroup F is the explicit group of §3.1 and `[0]↦0`. Prove isCycle4_iff_mem_explicitRawCycleFour: membership is the universal weight-four cycle predicate specified in §3.2, by the quotient universal property exactly as for isCycle3_iff_delta_eq_zero. Prove explicitRawCycleFour_inductive: applying the surjection explicitToInductive_three of §4.2 to the first tensor factor turns the defining map into the raw weight-four map of §4.1, so explicitRawCycleFour F ⊆ A₄(F). Every explicit raw cycle therefore has a class in the kernel of the first differential of higherPolylogComplex F 4, with the same `L₄` periods under higherBlochPeriod. The reverse inclusion is not asserted; for an inductive cycle the obstruction of §4.6 measures whether it comes from an explicit one. Families of explicit raw cycles enter the determinant `Z₄` of §4.4, which has `d₄=r₂` rows. (Goncharov–Rudenko [GR], §1.2, pp.9–12, for the explicit and inductive presentations, and Theorem 1.2, p.5, for the weight-four statement.) *Needs:* §§3.1–3.2, 4.1–4.2 and 4.4.

The weight-four theorem for these cycles is owned downstream by Polylogarithms, Part II, Layer 6: for every number field there are `r₂` explicit raw cycles with `Z₄=qζ_F(4)` and `q∈ℚˣ`, and every family of explicit raw cycles has `Z₄∈ℚ·ζ_F(4)` (Goncharov–Rudenko [GR], Theorem 1.2, p.5, and §9.3, p.94). Its proof uses the combinatorial weight-four Lie coalgebra, the explicit complex `B₄^comb→B₃^exp⊗U→B₂^exp⊗Λ²U→Λ⁴U`, the canonical period `L₄*=(5L₄+(1/3)L₂log²|z|)/16` with its agreement with `(5/16)L₄` on explicit raw cycles, and the regulator input `κ:K₇(F)_ℚ→ker δ₄`. That roadmap constructs all of them from §§3.1–3.2 and 4.1–4.4.

The explicit-cycle API requires the following facts.

- The raw kernel is a rational subspace, and its membership is exactly the universal test against all relation-respecting trilogarithm functions.
- Applying the lower presentation map to its boundary gives zero in the inductive presentation, so its class is an inductive cycle.
- Analytic descent identifies its raw and quotient periods under every selected embedding; no reverse cycle-lifting assertion is included here.

**Checks.**

- Over ℚ, `[1]` is an explicit raw weight-four cycle: its image is `[1]₃⊗u(1)=0` although `[1]₃≠0` (§3.7). Over every infinite field it is still a cycle since `u(1)=0`, independently of whether `[1]₃` vanishes. A test that also required the symbol class itself to vanish would reject it.
- `[2]` is not an explicit raw weight-four cycle over ℚ. Pair `[2]₃⊗u(2)` with trilogarithmDescent⊗ord₂, a well-defined functional on `B₃^exp(ℚ)⊗U(ℚ)` by §3.7. The value is `L₃(2)·1=7ζ(3)/8≠0`, the same as `L₃(1/2)` by inversion. A predicate that only tested the cobracket of the image in `Λ³U`, which is `(1-2)∧2∧2=0`, would accept it.
- The zero sum is an explicit raw cycle, and a raw sum is not made a cycle by having zero `L₄` period. A sum `a[x]+b[x⁻¹]` with `a=b` has image `a[x]₃⊗(u(x)+u(x⁻¹))=0`, by inversion in `B₃^exp`, so it is a cycle for every `x≠0`.
- Over ℚ and over every totally real field, `r₂=0`: the weight-four determinant has no rows and §4.7 applies, so explicit cycles first matter for fields with a complex place, such as `ℚ(i)`.

### 4.6 Changing presentations and the cycle obstruction

Consider a commutative square of rational vector spaces `q∘a=b∘p`, with `a:C→E`, `b:D→J`, `p:C→D` surjective and `q:E→J`. In the applications `p` maps an explicit presentation onto an inductive one and `a,b` are first differentials. Define `T=ker q`, `H=a(ker p)⊆T`, and

```text
cycleObstruction ω:ker b → T/H,  ω(y)=[a(x)] for any p(x)=y.
```

Prove independence of the lift, linearity and cycleObstruction_zero_iff: `ω(y)=0` exactly when there is a lift with `a(x)=0`. Thus `kerω` is the image of `ker a→ker b`, whose kernel is `ker p∩ker a`. These are elementary kernel/range/quotient statements. The elementary lifting criterion applies for any two maps `p,a` and chosen preimage `p(x)=y`, with no square or cycle hypothesis and without constructing a new quotient carrier, and injectivity of the target comparison gives its sufficient case: if `q` is injective then `T=0`, and every `b`-cycle is the image of an `a`-cycle. The obstruction API requires the following facts.

- The image of the kernel of the surjective presentation map under the first differential is a subspace of the kernel of the target comparison.
- The obstruction of a cycle is the class of the differential of any lift and is independent of that lift.
- Its zero locus is exactly the image of the explicit cycles, and the kernel of the map on cycles is the intersection of the two stated kernels.
- An injective target comparison makes every cycle obstruction zero and therefore supplies a cycle lift. *Needs:* Mathlib's linear kernels, ranges and quotient modules.

In weight three take `C=B₃^exp`, `D=B₃^ind`, `E=B₂^exp⊗U`, `J=B₂^ind⊗U`, `a=δ₃^exp`, `b=δ₃^ind`, p=explicitToInductive_three and `q` the identification of explicit with inductive `B₂` from §4.2, tensored with the identity. The square commutes on generators, both composites sending `[x]` to `[x]₂⊗u(x)`. Since `q` is an isomorphism, weightThree_inductiveCycleLift follows: every cycle of the inductive weight-three complex is the image of an explicit cycle with the same `L₃` periods. Hence `zagier_three_exists` and the every-family statement of §3.8 hold verbatim for inductive families, with the same hypotheses. In weight four the corresponding square has `C=B₄^comb` and `q=p₃⊗id`. Its presentation map, the relation check for it and the transfer of the weight-four theorem to inductive cycles are owned by Polylogarithms, Part II, which applies the general statements here. There `q` is injective only if the explicit-to-inductive weight-three map is, which is the comparison conjecture of §4.2. (Goncharov–Rudenko [GR], §1.2, pp.9–12, and Theorem 1.2, p.5.) *Needs:* §4.2's explicitToInductive_three and the identification of explicit with inductive `B₂`.

**Checks.**

- An explicit cycle has obstruction zero. Replacing a lift `x` by `x+k`, `k∈ker p`, changes `a(x)` by an element of `H`, so the class is unchanged.
- For `C=D=E=ℚ`, `J=0`, `p=a=id`, `b=q=0`, every element of `D` is a cycle but only zero lifts to a cycle; `ω(1)≠0`. A surjective presentation map therefore does not prove cycle surjectivity, and the target-injectivity hypothesis cannot be dropped: here `q=0` on `E=ℚ`.
- In weight three the inductive cycle `[1]₃` lifts to the explicit cycle `[1]₃`, with period `ζ(3)` in both presentations. In weight four `q=p₃⊗id`, and an argument using the injective-target lifting criterion there would assume the weight-three comparison conjecture of §4.2; the weight-three case needs only the proved weight-two identification.
- A nonzero obstruction does not itself disprove a scalar period identity: an excess cycle might still have a period in the correct rational image. Containment of periods is therefore a weaker sufficient condition than lifting.

### 4.7 Empty determinants, finite residues and the homotopy conjecture

For totally real `F` and even `n≥2`, `dₙ=r₂=0`. The determinant is empty and `Zₙ=π^(nN)/√|disc F|`. Borel's primitive-period determinant theorem, supplied by BorelRegulators §5.1 (Borel 1977, Remark 6.3, p.632), states `|disc F|^{1/2}π^(-nN)ζ_F(n)∈ℚˣ`. Prove `zagierExistence_totallyRealEven`: the rational-existence assertion of §4.4 holds with the empty family. No family can be rescaled when the matrix is empty, so this case is handled directly rather than by dividing by the number of columns. Over ℚ, `Z₂=π²=6ζ(2)` and `Z₄=π⁴=90ζ(4)`. (Goncharov–Rudenko [GR], Theorem 1.2, p.5, states the weight-four case.) *Needs:* §4.4 and the BorelRegulators contract above.

Define the finite-polynomial-place residue map on the inductive complexes of §4.2 in weight four

```text
Γ(F(t),4)/Γ(F,4) → ⊕_{p monic irreducible in F[t]} Γ(F[t]/(p),3)[-1].
```

Use projective specialization in each symbol factor, uniformizer-first exterior residue and the degree sign of §3.3. Prove finite support, vanishing on constants, naturality and the chain identity. Infinity is **not** in the index set. State polylogHomotopyConjecture_four as the proposition that this map is a quasi-isomorphism under the stated infinite-field hypotheses and rational coefficients. The argument must handle nonrational residue fields, not only linear `p`. This conjecture is the homotopy input mentioned in §4.7; full derived transfers still need the extra independence and tower coherences there. (Goncharov [G95], §1, paragraphs 14–15, pp.237–241; [GR], §1.1, pp.4–5, inductive complexes.)

**Checks.**

- Over ℚ the weight-four determinant is empty and `Z₄=π⁴=90ζ(4)`, a nonzero rational multiple. Assigning the empty determinant the value zero, rather than one, would make this case fail the existence assertion.
- At odd weight the determinant is never empty: `d₃=r₁+r₂≥1`, and over ℚ the single row is `L₃(1)=ζ(3)`. The empty-family argument applies only to even weights over totally real fields.
- For `F=ℚ(√2)` at `n=2`, `Z₂=π⁴/√8`, and `ζ_F(2)=ζ(2)L(2,χ₈)=π⁴/(48√2)`, so `Z₂=24ζ_F(2)`. Omitting the discriminant factor `√8` gives an irrational multiple.
- At `p=t-a`, a constant symbol tensor a uniformizer has the expected specialized symbol residue; a constant complex has every finite residue zero.
- A pole of a rational function specializes projectively to infinity, contributing the zero endpoint symbol. It is not reduced as a valuation unit.
- At `p=t²+1` over ℚ, the residue field is `ℚ(i)` and the target uses that field's symbols. A direct sum only over `a∈ℚ` misses this summand.
- Adding infinity to the finite-place map changes the target and introduces a reciprocity relation; it is not the same conjecture. A residue theorem for the projective line cannot silently replace this affine finite-place homotopy statement.

#### Next-to-Milnor theorems

Use B₂^R(F) for the rational extended pre-Bloch presentation supplied by K3BlochGroups §§3.13–3.16. Prove rudenkoPresentationAdapter: the identity on nondegenerate symbols identifies it with Rudenko’s five-periodic presentation, with the degenerate symbols zero and indeterminate terms omitted as relations prescribe, never evaluated as field fractions. For infinite F this is the rational B₂(F) already used here. This adapter matters for small fields: the admissible-pair presentation P(𝔽₃)⊗ℚ is ℚ, while B₂^R(𝔽₃)=0. (Rudenko [RSR], §1.2, relations (1)–(2), pp.2–4; K3BlochGroups §§3.6–3.7 and 3.13–3.16.) Its API requires identity and composition under field embeddings, compatibility with the exterior differential, and the identity-on-symbols comparison over infinite fields.

For every field F and n≥2 define nextToMilnorComplex, denoted T(F,n), in degrees n−1,n. Its last term is ΛⁿU(F). At n=2 its first term is B₂^R(F); at n≥3 it is

```text
(B₂^R(F) ⊗ Λ^(n−2)U(F)) / span{ [x]₂ ⊗ u(x)∧w : x≠0,1, w∈Λ^(n−3)U(F) }.
```

The differential is induced by `[x]₂⊗w ↦ (1-x)∧x∧w`. Prove its well-definedness, functoriality and, over infinite fields, its identification with the canonical truncation τ≥n−1Γ(F,n). In a canonical truncation the first retained term is `C^(n-1)/im(d^(n-2))`; keeping all of Cⁿ⁻¹ would give the wrong object. In particular the incoming-boundary relation above is required even when only two terms remain. (Rudenko [RSR], §1.2, p.5 and §1.4, pp.7–8; Bolbachan [BNM], §1, p.3.) *Needs:* the presentation adapter, §4.2’s complexes, K3BlochGroups’ shared carriers and §3.3’s rational exterior residues.

For a discrete valuation v and n≥3, define the raw symbol residue by `[x]₂⊗w ↦ [x_bar]₂⊗resExterior(w)` when v(x)=0 and by zero otherwise; the top exterior component is resExterior. Reduction of x therefore uses only a valuation unit, including when the residue field is finite. Prove that these formulas preserve the normalization and incoming-boundary relations.

The truncation API requires the following facts.

- The symbol boundary kills every incoming-boundary relation, since u(x) occurs twice in its exterior image.
- Field embeddings induce chain maps, preserving the quotient relations and the exterior differential.
- For infinite fields the identity on symbols identifies T(F,n) with the canonical truncation; Hⁿ⁻¹ and Hⁿ agree with those of Γ(F,n).
- For n≥3 residues are well-defined on this quotient. On a finitely generated one-variable function field F/k, only finitely many k-places contribute on each input, and residues vanish on constants. Rudenko’s two reindexed components commute with the displayed differential. In the original grading multiply source degree i by (−1)^i to obtain, at each place v, a cochain map into T(κ(v),n−1)[−1], consistently with §3.3.

For every field k and n≥3 prove nextToMilnorResidueExact: the following sequence, indexed by all closed points of the affine line, is exact, including surjectivity of the last arrow:

```text
0 → H^(n−1)T(k,n) → H^(n−1)T(k(t),n)
  → ⊕_{p monic irreducible} H^(n−2)T(k[t]/(p),n−1) → 0.
```

Infinity is excluded; residue fields of every finite degree are included. Prove this by the polynomial-degree and support filtrations and the co-residue maps on the two-term quotient, without assuming the whole-complex homotopy conjecture. For perfect k also construct nextToMilnorNorm for finite extensions, with identity, composition, N∘res=[L:k], and the residue/projection identities of a Rost cycle module, using the supplied Milnor action. These norms act on next-to-Milnor cohomology; they do not specify transfers on every degree of Γ. (Rudenko [RSR], Theorem 1.2 and Corollary 1.3, p.5, §§3–7, pp.13–36.) *Needs:* T, its residues, polynomial factorization and K2SymbolsBrauer’s Milnor symbols and norms; no full-complex residue quasi-isomorphism.

For a smooth proper connected complex curve X and n≥3 prove nextToMilnorReciprocity_complex: the total signed residue T(ℂ(X),n)→T(ℂ,n−1)[−1] is null-homotopic. Both its Hⁿ⁻¹ component and its Milnor Hⁿ component must vanish; over rational vector spaces these give a homotopy. This is the canonically truncated theorem of Rudenko [RSR], Corollary 1.4, p.6. Its proof uses the residue theorem and the next-to-Milnor cycle-module norm compatibilities just constructed. *Needs:* nextToMilnorResidueExact, nextToMilnorNorm, proper curve geometry and the Milnor reciprocity contract.

For every algebraically closed characteristic-zero field k and m≥2 prove degreeNormalizedNextToMilnorReciprocity: there is a system of homotopies indexed by all finitely generated extensions F/k of transcendence degree one, equivalently F=k(X) for smooth proper connected k-curves X,

```text
h_F : Λ^(m+1)U(F) → (B₂(k)⊗Λ^(m−2)U(k))/im d^{m−2},
d h_F + h_F d = Res : T(F,m+1) → T(k,m)[−1],     TauCeti.IsFunctionField k F.
```

Here d on the target includes the shift sign, and the incoming image is zero when m=2. The total residue is the finite sum over the closed points of X. The system vanishes on f₁∧f₂∧c₃∧…∧cₘ₊₁ with each cᵢ∈kˣ, obeys `h_F ∘ exteriorPower_(m+1)(j) = [F:K] h_K` for every finite k-embedding j:K→F between fields in this category, and is uniquely determined on this category by this law and the rational-curve normalization below. Retain `TauCeti.IsFunctionField k K` and `TauCeti.IsFunctionField k F` in the degree law and every norm and tower construction. For any transcendental t∈F, the resulting map k(t)→F is finite and corresponds to a finite curve cover. Construct norms on spaces of lifted homotopies for these finite extensions, prove independence of a field generator, compatibility with towers and the two-dimensional residue-cancellation relation, and transport the rational-curve lift along k(t)→F. These are intermediate obligations of this target; they are not assumed whole-complex transfers. (Bolbachan [BNM], §6, Definition 6.2 and Theorem 6.3, pp.35–36, §§6.2–6.6, pp.37–42.) *Needs:* T, its residues, `TauCeti.IsFunctionField` and its parameter and finite-support APIs, AlgebraicCurves Layer 12B–12C’s curve/function-field correspondence, the preceding norm and reciprocity construction, K2SymbolsBrauer’s Milnor norm/reciprocity identities and AlgebraicModuliForArithmeticGeometry Layer 9’s characteristic-zero resolution for the surface residue argument.

Fix the sign adapter explicitly. If Γ_B is [BNM]’s complex, S_n:Γ_B(F,n)→Γ(F,n) is −1 on every symbol-bearing term and +1 on ΛⁿU; it is a chain isomorphism since [BNM] uses x∧(1−x). Set S₁=id on U(F), and write R_B for [BNM]’s signed residue. Our extension of §3.3’s signs is `R_n = (-1)^n S_(n-1) R_B S_n^(-1)`; on the last two terms these are exactly the component signs (−1)^i above. Transport the homotopy as h_F=(−1)^m H_F from [BNM]. Its rational-curve value is therefore

```text
h_{k(t)}(t∧(1−t)∧(1−a/t)∧c₄∧…∧c_{m+1})
  = (−1)^(m+1) [a]₂⊗u(c₄)∧…∧u(c_{m+1}),     a≠0,1, cᵢ∈kˣ.
```

The equality is in the first retained quotient. No lift to the unquotiented B₂⊗Λᵐ⁻²U is asserted. (Bolbachan [BNM], Proposition 6.1, pp.34–35 and Theorem 6.3(2), p.36.) The system API includes both homotopy equations, constant-factor vanishing, this normalization and the finite-embedding degree law with its identity and tower cases.

For every characteristic-zero field K and m≥2 prove nextToMilnorMotivicComparison: `H^{m−1,m}(Spec K,ℚ) ≃ H^{m−1}Γ(K,m)`. Via the supplied rational Chern character this is the weight-m Adams part of Kₘ₊₁(K)⊗ℚ. At m=2 use K3BlochGroups Layer 4’s Suslin comparison and the supplied weight-two Chern identification; for m≥3 prove the comparison by the canonically truncated higher-Chow model and its acyclic quotient, using the lifted reciprocity system and descent by finite extensions. (Bolbachan [BNM], Theorems 1.2–1.3, pp.3–4 and §7, pp.42–48.) The comparison API includes naturality for field embeddings and its inverse, with the following separate target nextToMilnorComparison_residue: for m≥3 and a discrete valuation with characteristic-zero field and residue field, after transport through S_m it commutes with the signed Quillen/motivic and polylogarithmic residue maps. The weight-two terminal case uses the supplied symbol comparison. Prove that compatibility from the localized higher-Chow construction and the supplied Chern localization square; canonical isomorphy alone does not assert it. [BNM] §3.2, p.10, uses the same cubical differential ∂_M as the supplier and the rational projector (1/q!)Alt_q, so neither J nor an unnormalized Alt_q can be silently inserted. *Needs:* T and its lifted reciprocity system, MotivicEtaleKTheory §§1.1–1.4 and 2.1–2.4 for the higher-Chow and rational Chern carriers and localization, and the shared cycle pullback and transfer interfaces. This comparison does not identify §3.7’s configuration map or the rank and Adams filtrations.

**Checks.**

- Over 𝔽₂, U=0 and B₂^R=0. Over 𝔽₃, the supplier’s admissible-pair group has a free generator [−1], but the five-periodic pair (2,2) adds 2[2]+[1]+[0]+[1]=2[2]=0, so B₂^R(𝔽₃)=0 rationally. Substituting the unmodified admissible-pair group into the all-field theorem would give the wrong target.
- At n=2, T has B₂^R→Λ²U with no incoming quotient. At n=3 over ℚ, [3]₂⊗u(3) is zero in its first term because it is an incoming boundary; its exterior differential is u(2)∧u(3)∧u(3)=0. In contrast [3]₂⊗u(5) has differential u(2)∧u(3)∧u(5), detected as 1 by the 2,3,5 valuation determinant, so it survives that quotient. Before quotienting, the tensor of the 2,3 valuation boundary pairing with ord₃ takes [3]₂⊗u(3) to 1; stupid truncation would therefore retain a nonzero vector that canonical truncation kills.
- For constant units a,b and n=3, res_t([a]₂⊗t)=[a]₂ in degree two, whereas res_t(t∧a∧b)=−a∧b in degree three. Thus d(target[−1]) res([a]₂⊗t)=−(1−a)∧a=res d([a]₂⊗t). At n=4 the same two signs are −1,+1.
- At the irreducible place p=t²+1 over ℚ, the next-to-Milnor residue lies over ℚ(i); its kernel class [i]₂ has period D(i)>0. The exact sequence gives a preimage with that finite residue and all other finite residues zero. Including infinity instead would impose a further total-residue constraint.
- In the degree-two extension ℚ(i)⊂ℚ(i,√2), the norm of the restricted class [i]₂ in H¹T(−,2) is 2[i]₂, with period 2D(i), while identity extension returns [i]₂. This tests the degree factor of the cohomological norm.
- At m=2 the normalized input t∧(1−t)∧(1−a/t) gives −[a]₂. Its negative is (1−t)∧t∧(t−a), giving [a]₂ as in §5.14. For a=i the latter period is D(i)>0.
- At m=3, a=3 and c₄=5, the normalized h-value is [3]₂⊗u(5). Its target shifted differential is −u(2)∧u(3)∧u(5); the only nonzero exterior residue is at t=3 and equals u(3)∧u(−2)∧u(5), the same negative wedge. Both evaluate to −1 under the valuation determinant on the rational constant subspace.
- The embedding k(t)→k(s), t=s², has degree two in characteristic zero: the two homotopy values on a restricted input are h and 2h, and division by two recovers h. The identity has coefficient one; a tower of degrees two and three has coefficient six in either order of composition.
- Over ℂ(t), the raw exterior residues of t∧2∧3 are u(2)∧u(3) at zero, its negative at infinity and zero elsewhere, so their total is zero. In source degree three the shifted residues are their negatives and still sum to zero; an input consisting entirely of constant units has every residue zero.
- Let F be the union over N≥1 of ℂ(t)(√(t−1),…,√(t−N)). The Nth field has degree 2^N over ℂ(t), while F still has transcendence degree one. Each independent sign choice at t=0 gives a discrete place with v(t)=1; writing aⱼ²=−j, the order of √(t−j)−aⱼ is one for the positive branch and zero for the negative branch. Thus infinitely many distinct places have raw residue res(t∧2∧3)=u(2)∧u(3)≠0: the 2,3 valuation determinant on the rational constant subspace is one. This field fails `TauCeti.IsFunctionField`, so it is excluded from the total-residue system; transcendence degree alone would admit this infinite support.
- For m=2 the motivic comparison has source K₃ⁱⁿᵈ⊗ℚ and target ker δ₂. For m=3 it has the weight-three part of K₄⊗ℚ and H²Γ(K,3); for m=4 it has the weight-four part of K₅⊗ℚ and H³Γ(K,4). The degree count 2m−(m−1)=m+1 is 3,4,5 respectively, rather than a statement about every Adams weight of these K-groups.
- The first retained quotient in τ≥2Γ(K,3) kills d[3]₃=[3]₂⊗u(3); the motif-side canonical truncation also kills incoming boundaries. Any comparison sending that boundary to a nonzero cohomology class would fail. The zero class and every class restricted from K to K(t) have zero finite residues on both sides of the localized comparison.

#### Conditional transfer beyond top cohomology

The transfer on `H³` in §3.6 is unconditional. A chain transfer on the whole polylogarithmic complex is a different target, conditionalComplexTransfer. State it only after assuming a suitable weight-four homotopy/residue comparison, together with independence of a primitive element, compatibility under towers and the localization compatibilities needed to produce an actual morphism in the derived category. The quasi-isomorphism of one residue map alone does not specify those coherences. The intended transfer is covariant for finite field extensions, equals multiplication by the extension degree after restriction and agrees with the Milnor norm in top degree. (Goncharov [G95], §1, paragraphs 14–15, pp.237–241; the homotopy conjecture is stated above.) *Needs:* the conditional statement of §4.7 and the additional coherence targets; this is not a source of unconditional maps used earlier.

Under those same homotopy and coherence hypotheses the transfer API requires the following facts.

- The identity extension induces the identity derived morphism.
- Transfer along a tower equals the composite of its two transfers.
- Restriction followed by transfer is multiplication by the extension degree.
- In top cohomology the transfer is the supplied Milnor norm under the stated identification.

**Checks.**

- For the identity extension the transfer is the identity in every degree, not the zero map; the degree-one restriction law detects the latter.
- On a degree-`d` extension, a class restricted from the base returns as `d` times that class. In top degree three the recipe that norms each of three unit factors independently would return `d³` times the base symbol, and fails this control whenever that symbol is nonzero and `d>1`.
- For a tower `K⊂L⊂E` of finite extensions, the two-step transfer equals the direct transfer. A collection of individually chosen residue quasi-isomorphism inverses without compatible homotopies does not supply this equality; the theorem retains its tower-coherence hypothesis.

### Examples

Weights three and four already exhibit all distinctions: odd-weight real rows and the nonzero class `[1]₃` over ℚ; even-weight complex rows and an empty determinant over totally real fields; explicit versus inductive kernels; and existence versus every-family rationality. In weight three the obstruction vanishes because the weight-two presentations agree; the one-dimensional obstruction square shows why a surjection on symbols alone resolves none of these distinctions.

### Dependencies

PolylogarithmFunctions, Layers 2–3, rational-function specializations, ArithmeticKTheory §§3.3–3.4 for ranks, BorelRegulators §§2.3 and 5.1–5.4 for the regulator and determinant theorem, the low-weight symbol suppliers, MotivicEtaleKTheory §§1.1–1.4 and 2.1–2.4 for the next-to-Milnor higher-Chow comparison, and AlgebraicModuliForArithmeticGeometry Layer 9 for the lifted-homotopy surface argument. The weight-four theorem for the explicit cycles of §4.5, and its transfer to inductive cycles, are proved downstream in Polylogarithms, Part II; nothing in this layer depends on them. The whole-complex finite-place homotopy statement is a conjecture, while the next-to-Milnor residue and comparison theorems have their stated field and degree hypotheses; it is not a prerequisite of the weight-three existence results.

## Layer 5: logarithmic currents and explicit regulators

### 5.1 Test forms and currents

On a finite-dimensional Hausdorff second countable oriented smooth real `m`-manifold, use GeometricCurrents G1’s `TestForm k M` and `Current k M`, with ComplexKahlerGeometry K5a’s bundle-test LF topology. A degree-`q` current means its dimension-`m-q` current for `0≤q≤m`, and zero outside that integer range. Its differential is `(-1)^(q+1)∂`, where the supplied dimension-current boundary has `∂T(φ)=T(dφ)`. The raw current of a locally integrable form pairs as `[α]_raw(φ)=∫α∧φ`.

For complex manifolds use ComplexComparisonPartII §C5.4’s `CurrentCalculus`: its complex coefficients, type decomposition, chart/distribution comparisons, exterior differentials, proper-on-support pushforward, smooth multiplication and permitted pullbacks. Pullback of arbitrary currents is used only for submersions and open embeddings. These conventions prepare the BFT normalization of §5.2. (Demailly [DEM], Chapter I §2.A–C, pp.13–18.) *Needs:* GeometricCurrents G1, ComplexKahlerGeometry K5a and ComplexComparisonPartII §C5.4.

The degree-convention adapter has the following API.

- Degree q pairs with compact test forms of degree m−q inside the integer range 0≤q≤m and is zero outside it.
- Its transported differential squares to zero and sends the current of a smooth form to the current of its exterior derivative.
- Open restriction, smooth multiplication and submersion pullback agree with the corresponding supplied current operations whenever their domains satisfy the stated hypotheses.

**Checks.**

- For `q>m` or `q<0` the current space is zero, rather than the dual of degree-zero functions obtained by truncated natural subtraction. On the empty manifold every test-form space is zero; in a real chart, degree-zero forms give exactly scalar smooth test functions with their LF topology, not merely the same underlying functions.
- Fixed bumps translated to disjoint balls escaping every compact subset of ℝ converge to zero in the compact-open smooth topology but **not** in the LF test topology. This detects the wrong dual space.
- A compactly supported form on an open chart extends by zero smoothly. A function remaining nonzero at the boundary of the open interval does not satisfy the required support condition and has no such smooth extension.
- The top-degree Dirac current at `x` evaluates a scalar test function at `x`, agreeing with `Distribution.delta`; its coordinate derivative evaluates the test derivative with a minus sign, agreeing with Distribution.lineDerivCLM.
- Locally integrable forms equal almost everywhere give the same current. At degree zero the formula `d[α]=[dα]` follows from the sign `(-1)^(q+1)` and Stokes.
- A smoothing of `δ₀` at scale `ε` has square mass growing like `ε⁻ᵐ`; no canonical current product `δ₀·δ₀` is introduced. Smooth multiplication and submersion pullback do not authorize this product.

### 5.2 Analytic cycles, resolutions and Poincaré–Lelong

For a pure codimension-`c` closed analytic cycle `Y` in a complex `d`-manifold, use ComplexComparisonPartII §C5.4’s `AnalyticCycleIntegration` as its LF-continuous raw current. Its supplied compact-support mass bound is the continuity input. Define the BFT cycle-current normalization by multiplying that raw current by `(2πi)^{-(d-c)}`, as in the dictionary below. Prove analyticCycleCurrent_resolution for a proper algebraic resolution that is generically an isomorphism on every reduced component, pushing forward with the cycle's original multiplicities. Change of variables on the regular locus and measure zero of the exceptional analytic subset give equality of these currents. These are topological and normalization adapters to the supplied cycle integral, not a new construction of integration or positive-current extension. (Demailly [DEM], Chapter I §2.A–B, pp.13–18, and Chapter III §2.A–B, Theorems 2.3 and 2.7, pp.139–140.)

Prove currentResolution_deRham and currentResolution_dolbeault: smooth forms and currents are quasi-isomorphic sheaf complexes for `d`, and in each fixed holomorphic degree for `bar∂`. The local constructions are smoothing with compactly supported homotopies and the distributional Dolbeault homotopy; fine sheaves globalize them. Degree-zero kernels are locally constant or holomorphic as appropriate, not zero. (Demailly [DEM], Chapter I §2.D, Theorem 2.24, pp.19–20, and §3.E, Lemma 3.29, pp.28–29.)

Use ComplexComparisonPartII §C5.4’s lelongPoincareSection, specialized to a meromorphic function `f` vanishing identically on no component, with trivial line bundle and constant metric:

```text
ddᶜ[log|f|] = [div f]_raw,
ddᶜ = (i/π)∂bar∂ = (1/(πi))bar∂∂.
```

The supplier includes local integrability and the normal-current support theorem for extension across the singular divisor locus. On a curve its formula gives `d[darg f]=2π[div f]_raw`. The dictionary below transports this supplied identity to the normalized regulator model. (Demailly [DEM], Chapter III §2.C, Theorem 2.10 and Corollary 2.11, p.141, and Theorem 2.15, pp.143–144.) *Needs:* §5.1 and ComplexComparisonPartII §C5.4.

The normalized dictionary and support models require the following API.

- Smooth-to-current conversion preserves type, conjugation and proper-on-support pushforward after transporting its signs and Tate factors.
- The normalized cycle current retains every component coefficient, and proper birational resolution pushes it to that same cycle current.
- The concrete current adapter intertwines the imported nested-support maps and the raw connecting map of the restriction triangle; it does not replace that map by its negative localization-boundary adapter.
- Cube-orientation transport preserves the imported auxiliary diagram; the additional shifted simple complex squares to zero, and its cycle inclusion and base-model comparison are chain maps, the latter a quasi-isomorphism by the supplied auxiliary support comparison.

**Checks.**

- The supplied analytic cycle current for a point on a complex curve gives ordinary Dirac mass. The divisor of `z^r` has current `rδ₀`, so multiplicity cannot be discarded.
- The supplied LF-continuous cycle current is additive in multiplicities and evaluates to twice the reduced integral on a double line. Its compact-support bound is the supplied local mass times the zeroth test-form seminorm.
- A proper resolution of a reduced nodal curve pushes its integration current to that of the curve, with the two local branches counted. A generically finite map of degree two instead gives twice the target current; the degree-one resolution hypothesis cannot be omitted.
- In codimension zero the raw cycle current of `X` is integration over `X`; in the normalized convention of §5.2 it is `(2πi)⁻ᵈ[X]_raw`, the current of the constant form one.
- On ℂ, `ddᶜlog|z|=δ₀` and `ddᶜ(-log|z|)+δ₀=0`. Interchanging `∂bar∂` with `bar∂∂` without the sign reverses this divisor.
- On a star-shaped chart every closed current of positive degree is locally exact; degree zero retains constants. This tests the cohomological shift in the resolution.
- A holomorphic nowhere-vanishing unit has divisor zero and `ddᶜlog|f|=0`. The identically zero meromorphic function is excluded because its logarithm is not locally integrable.

#### Normalized current dictionary

Use the Burgos–Feliu–Takeda real current convention in complex dimension `d`:

```text
[α]_BFT(ω) = (2πi)^(-d) ∫_X ω∧α,
δ_Y(ω) = (2πi)^(-(d-c)) ∫_{Y_reg} ω   for codim Y=c.
```

Thus `δ_Y=(2πi)^(-(d-c))[Y]_raw`. For an ordinary `q`-form, the dictionary from §5.1 includes the Koszul factor `(-1)^q` because its raw convention pairs as `α∧ω`, whereas this convention pairs as `ω∧α` on the even-dimensional real manifold. Transport the current differential and real structure through this dictionary; do not change only the scalar while retaining an incompatible duality sign. The normalized Deligne complex `D^k(X,p)` has ordinary form degree `k-1` and twist `p-1` for `k<2p`, and ordinary degree `2p` and twist `p` at the top. The top operator is `-2∂bar∂=2bar∂∂`. The smooth-to-current map is a quasi-isomorphism. (Burgos–Feliu–Takeda [BFT], §2, (2.1)–(2.2), pp.3–4.)

Prove bftCurrentDictionary, its type/conjugation/pushforward compatibility, the cycle-current formula and the degree-one identity `d_D[-log|f|]_BFT=-δ_{div f}`. The dictionary is a map between specified models, not an identification that permits dropping a Tate twist in a scalar-valued numerical formula. *Needs:* §§5.1–5.2 and the universal Dolbeault Deligne model.

**Checks.**

- On a complex curve a point has normalized current `δ_x=δ_x^raw`; in codimension zero `δ_X=(2πi)^(-d)[X]_raw=[1]_BFT`.
- In complex dimension one the ordinary scalar function `-log|z|` has current factor `(2πi)⁻¹`; applying the top differential gives `-δ₀`, consistent with Poincaré–Lelong.
- An ordinary one-form has the extra minus sign when its order in the test pairing is reversed, while a two-form has no such sign. This is a separate issue from multiplying by `(2πi)⁻ᵈ`.
- A Deligne degree `2p-1` Green representative has ordinary degree `2p-2`; its differential jumps to ordinary degree `2p`, not `2p-1`. A single uniform “degree minus one” rule fails at the top.

#### Supported Deligne models

For a smooth separated complex variety X, closed support Z and open complement U, use the logarithmic restriction fiber of MotivicEtaleKTheory §5.1. For quasi-projective X, also use its §6.2 supported regulator with its forget-support, nested-support and connecting-map compatibilities; its §§1.3–1.4 and 2.3 compare the supported cycle models and K-theory localization in that scope. The additional target here is the concrete current adapter: compare the supplied logarithmic Deligne fiber with the normalized-current restriction fiber via the dictionary above, respecting its raw connecting map. In pair coordinates the supplied fiber has `d(ω,g)=(d_Dω,res ω-d_Dg)`; its raw connecting class is `(0,g)`. In particular `(0,log|t|)` represents the negative divisor class, whereas `(0,-log|t|)` represents the positive one. This adapter precedes every Green or Wang comparison. (Burgos–Feliu–Takeda [BFT], §4, Proposition 4.3 and Theorem 4.7, pp.5–8.)

For smooth quasi-projective X and p≥0, identify the entire auxiliary diagram with MotivicEtaleKTheory §§5.3–5.4 after J in cube degree: the model with terms `D_A^{r,-m}` is its Aₚ, and the supported model with terms `D_{A,Z}^{r,-m}` is its support-colimit total Aₚ,S, and `H^{p,q}` is its Hₚ[−2p] in degree q, all transported to the δ convention. Supports range over the supplied face-admissible closed subsets; the notation Z here denotes that directed support family, not a new fixed-support carrier. The column truncation is good τ≤2p, so degree 2p contains cycles. The supplied arrows give `g₁:D_{A,Z}→H^p`, `ρ:D_{A,Z}→D_A` and the constant-cube inclusion. Record the transport equalities `d_δ J=J d_M`, `g₁,δ J=J g₁,M` and `ρ_δ J=J ρ_M`, including the cycle-class and base inclusions. Thus their total differential is `d_D+(-1)^rδ` in bidegree `(r,-m)`, of total degree r−m; no second auxiliary resolution or abstract regulator is constructed here.

Define the additional shifted comparison complex by

```text
D_AH^q = D_{A,Z}^{q+1} ⊕ H^{p,q} ⊕ D_A^q,
d(a₁,a₂,a₃)=(-da₁, da₂+g₁a₁, da₃-ρa₁).
```

Prove square zero, the cycle map `Z↦(0,cl Z,0)` and the quasi-isomorphism `β:α↦(0,0,α)` from the good-truncated smooth Deligne base model. The supplied quasi-isomorphism g₁ makes the quotient by the base summand acyclic, and the supplied constant-cube comparison then gives β. These are the concrete comparison constructions used in §§5.9–5.10. (Burgos–Feliu–Takeda [BFT], §4, (4.8), pp.7–8.)

The adapter API requires the following facts.

- The normalized-current restriction fiber compares with the supplied logarithmic fiber under forgetting and enlarging support and its raw connecting map.
- J intertwines all differentials and arrows of the supplied support-colimit diagram, including cycle classes, g₁, ρ and the base inclusion.
- The shifted comparison complex has the displayed differential; its cycle inclusion and β have the displayed components and β is a quasi-isomorphism.

*Needs:* MotivicEtaleKTheory §§1.1–1.4, 3.4, 4.1–4.2, 5.1–5.4 and 6.1–6.3, Mathlib mapping cones and the normalized dictionary above. Neither Green forms nor Wang forms enter these adapters.

**Checks.**

- Empty support gives the contractible fiber of identity; full support gives the original complex. The adapter has the same zero and identity specializations.
- For `{0}⊂{0,1}⊂𝔸¹`, the supported class has coordinates `1↦(1,0)`, and successive enlargements equal the direct one.
- In cube degrees 0,1,2, J has values 1,−1,1; in degree one `δJ₁=(-∂_M)(-1)=∂_M=J₀∂_M`. Applying J only on cycles would leave the support arrows incompatible.
- At `(r,m)=(2p,1)` the total degree is 2p−1 with cube coefficient +1; at `(2p−1,1)` the coefficient is −1. Good truncation requires d_Dα=0 in top degree, rather than discarding a nonzero d_Dα.
- For an element `(a₁,a₂,a₃)`, the last two components of d² are `d g₁a₁-g₁da₁=0` and `-dρa₁+ρda₁=0`; the first is zero by d²=0.
- At p=1 on 𝔸¹, raw connecting applied to log|t| has divisor coefficient −1, and the Green representative −log|t| has coefficient +1. The adapter retains both signs.

### 5.3 Admissible parameter loci and logarithmic Green forms

For a smooth projective variety `X/k` of dimension `d` over an algebraically closed characteristic-zero field, fix codimension `0≤c≤d`, fiber dimension `r=d-c`, degree `e≥0`, a simplex arrangement and a distinguished hyperplane. Define admissibleChowLocus A in the supplier's Chow coefficient scheme by requiring each component of each geometric fiber cycle to meet every simplex face properly and no component to lie in the distinguished hyperplane. Dimension bounds on the projective universal support show that the excluded subsets are closed. Face and vertex maps are supplied only on the open loci where the stated proper-intersection and projection-dimension conditions hold. The analytic applications take `k=ℂ`. (Goncharov [G04], §3.1, pp.26–27.)

#### Relative Chow families with multiplicities

For a Noetherian `k`-scheme `S`, define the degree-`e` effective Chow-family subfunctor as the relative cycles in `X×S/S` of pure fiber dimension `r` and degree `e`, using MotivesAndAlgebraicCycles §4.8a’s relative-cycle carriers, specialization multiplicities, arbitrary base pullback and admissible Cartier intersection. Section 4.14 supplies equidimensional cycles and transfers. The underlying raw cycle is Mathlib’s `AlgebraicGeometry.AlgebraicCycle`; coefficients remain integral in characteristic zero. Use the supplied identity, composition, proper/flat map, base-change and multiplicity laws. On a flat family, specialization is the fundamental fiber cycle, with local lengths and residue degrees; reduced support alone is insufficient. ([SV], Definition 3.1.3 and Proposition 3.1.5, pp.16–19; Theorem 3.3.1, pp.23–27.)

This subsection adds the Chow-form/h-sheaf identification, its tautological cycle on the Chow coefficient scheme and the admissible face and vertex adapters. For h-descent use [SV], Theorem 4.2.2, p.58, with proof to p.61: the integral relative-cycle presheaf is an h-sheaf after inverting the exponential characteristic, which is one here. Neither flatness of the tautological support nor an ordinary fine-moduli interpretation on every base is assumed. *Needs:* MotivesAndAlgebraicCycles §§4.8a and 4.14 and AlgebraicModuliForArithmeticGeometry §1.6.

The parameter and Green-form API also requires the following facts.

- The admissible coefficient locus is open, includes the zero cycle and has face and vertex maps precisely on the displayed proper-intersection and dimension-preserving loci.
- Relative degree, effectiveness and specialization multiplicities are preserved by the supplied allowable base pullbacks; the Chow-form adapter respects those pullbacks.
- Logarithmic Green representatives have the specified supported class; changing a representative by its supported Deligne boundary preserves that class.
- Permitted transverse pullbacks preserve their classes and logarithmic form conditions, and their current realization has the critical-degree cycle correction stated above.

**Checks.**

- In `Spec k[t,x]/(x²-t)` over `𝔸¹_t`, every fiber has length two and the fiber at zero is `2[0]`; replacing its ideal by the radical loses one copy.
- Pulling back by `t=s²` gives `[s]+[-s]`; then `s=0` gives the same `2[0]` as direct specialization.
- The finite point cycle `[s]+[-s]` has coefficient one at each of `1,-1` when `s=1` over ℚ, and coefficient two at zero when `s=0`. This finite symbol sum is defined over every field; in characteristic two it is `2[s]` for every `s`. That diagnostic does not extend the geometric h-descent theorem beyond characteristic zero.
- Base change to a nonreduced parameter scheme is allowed, but need not distinguish maps whose underlying relative cycles coincide; a fine moduli interpretation on every base is not asserted.
- The degree-zero family is zero and remains zero under every pullback.

Define tautologicalChowCycle by the following construction. The Chow-form transform sends a relative cycle to its incidence divisor on the product of dual projective spaces, using flat pullback along the point–hyperplane incidence and proper pushforward. It is injective ([SV], Lemma 4.4.12, p.79). Theorem 4.4.11 and Corollary 4.4.13, pp.79–81, identify degree-`e` effective cycles supported on `X` with the h-sheaf associated with its projective Chow coefficient scheme. Match this identification with the supplier's scheme by its actual Chow coefficients. If that comparison uses a seminormal representative, descend its cycle along the resulting h-cover: the two pullbacks agree by their identical Chow forms, so h-descent gives the cycle on the original coefficient scheme. Because the cycle presheaf is already an h-sheaf in characteristic zero, the identity map of that coefficient scheme determines an actual relative cycle, not merely an h-local support. Its fiber at a geometric point is the cycle represented by that point. Restrict it to `A` to obtain admissibleIncidenceCycle. For `f:S→A` define `I_f` by relative-cycle pullback. This constructs the universal family with multiplicities without claiming a universal flat closed subscheme or ordinary representability of the cycle functor on arbitrary bases.

The incidence API requires the following facts.

- The Chow form of the tautological relative cycle is the universal coefficient form, and its geometric fiber is the cycle represented by that point with all multiplicities.
- Pullback along every allowed base map commutes with incidence construction, and addition of relative cycles adds their incidence cycles.
- Incidence support is proper over the parameter scheme and remains proper after base change.

Support lies in `X×S` and is closed, hence proper over `S`, and stays proper after every allowed base change. For `r≥1`, use the supplied admissible Cartier intersection with a fixed hyperplane `H`, and construct its Chow-form adapter by evaluating one dual-hyperplane argument of the Chow form at `H` and identifying the resulting form on `H`. On the open locus where every geometric fiber meets `H` properly this form is nonzero, has the expected degree and represents the Cartier intersection cycle with its local lengths. Equality is checked on geometric points by the point–hyperplane incidence construction, then on families by the injective Chow-form transform and h-descent. Iterating in the fixed face order gives admissibleIncidenceCycle_face and compatibility of successive faces. Evaluation of coefficient polynomials commutes with base change; proper intersection at **every** intermediate face guarantees that each resulting Chow form is defined. For `r=0`, proper hyperplane intersection is empty and gives zero; every negative expected dimension likewise gives zero. This avoids asserting arbitrary Gysin pullback or flatness of an intersection support. For a vertex projection, exclude cycles through its center and restrict to the dimension-preserving locus. Restrict all dual arguments of the Chow form to hyperplanes pulled back from the target; the resulting form is that of the proper pushforward of the graph closure, with generic degrees. This defines the vertex adapter and its allowed base change.

**Checks.**

- The fibers of `[H]` and `2[H]` have identical support and different coefficients.
- The Chow-form transform sends their coefficients to a divisor and twice that divisor; its injectivity rules out reducing support in the construction.
- A cycle contained in a face is excluded, while a properly intersecting double component contributes twice its face cycle.
- A point cycle through a projection center is outside the vertex-map domain; a generically finite degree-`d` projection contributes degree `d`, rather than the reduced image.
- Empty cycles give empty proper support.
- The colliding-point calculation above tests the fiber and base-change identities on a nonflat reduced support.

*Needs:* the projective Chow coefficient interface of AlgebraicModuliForArithmeticGeometry §1.6; the native algebraic-cycle carrier and weighted pushforward; the cycle-intersection interfaces of SchemeAndStackFoundations Layer 5, especially `proper-pushforward`, flat pullback and the Cartier-divisor action; MotivesAndAlgebraicCycles §4.8a’s relative-cycle operations; and the Chow-form/h-descent comparison above. Analytification and resolution are used only after this algebraic construction, in §5.11. This construction concerns Chow families and their precise allowed bases.

For a codimension-`p` cycle `Z` with p≥1, define a logarithmic Green form as the Green object represented by a pair `(ω,g)` in the supported Deligne complex whose relative class is `cl(Z)`, with `g` smooth off `|Z|` and logarithmic after a suitable resolution. A local basic logarithmic representative has shape `∑λⱼαⱼ+β`, with logarithmic functions `λⱼ`, smooth `β` and appropriate `(p-1,p-1)` coefficient forms `αⱼ` whose restrictions to the resolved boundary divisors `Dⱼ` are separately `∂`-closed and `bar∂`-closed. Requiring only an off-support equation would lose the cycle class and is insufficient. Prove logGreenForm_pullback for admissible transverse cycle pullbacks, the change-of-representative API and greenForm_toCurrent. (Burgos [BUR], Chapter II, Definition 4.2 and Lemma 4.5, pp.79–81.)

Prove logarithmicCurrent_integrable: a logarithmic form along a codimension-p support of ordinary degree `r<2p` is locally integrable. For ordinary `r<2p-1`, prove `d[g]=[dg]` (and the type components); these are first-order current identities. A Green representative specifically has ordinary degree 2p−2 and Deligne degree 2p−1. Its critical Deligne differential is the second-order operator `d_D=2bar∂∂`, and satisfies `d_D[g]_BFT+δ_Z=[ω]_BFT`. The ordinary first derivative still commutes with current realization at r=2p−2; it is not this critical Deligne differential. Establish the local estimates after normal-crossing resolution and use them to prove the Green-form/Green-current class comparison is an isomorphism. It does not make arbitrary current pullback possible. (Burgos [BUR], Chapter II, Proposition 3.1 and Corollary 3.8, pp.73–78; Theorem 4.3, pp.79–83.) *Needs:* §§5.1–5.2 and the supported Deligne model in §5.2.

**Checks.**

- The zero effective cycle at `e=0` is admissible; a component contained in a simplex face or in the distinguished hyperplane is not. A parameter space containing all cycles without these exclusions fails the boundary construction.
- A family in which intersection dimension jumps leaves the good locus. A face map is not asserted on that whole family merely because its generic member is admissible.
- The cycles `[H]` and `2[H]` have the same support but different Chow parameters and incidence multiplicities. Reusing only the supplier's closed support fails the fiber theorem.
- In a good family of two points that collide, the special cycle has multiplicity two at the collision point. Reduced set-theoretic base change would give multiplicity one and fails admissibleIncidenceCycle_baseChange.
- The degree-zero parameter has zero incidence cycle and empty support, and its admissible face pullbacks stay zero. Assigning the full empty-support ambient fiber would fail this case.
- For `p=1`, `g=-log|z|` has ordinary degree zero and Deligne degree one. Its ordinary derivative is `-Re(dz/z)` and `d[g]=[-Re(dz/z)]`, with no Dirac term. Its second-order raw curvature is `ddᶜg=-δ₀`; the normalized critical Deligne identity is `d_D[g]_BFT=-δ₀`. The supported class records this residue.
- On ℂ², `α=(z₁+bar z₁)i dz₂∧dbar z₂` satisfies `∂bar∂α=0` but is neither separately closed. On a boundary component carrying these coordinates it fails the coefficient restriction; a constant coefficient form passes.
- A smooth Green representative is a special case. A form with a genuine nonintegrable `|z|⁻²` coefficient is not admitted solely by calling it logarithmic.
- At ordinary degree r=2p−2, both integrability and first-order current compatibility apply. Its Deligne degree is instead k=2p−1, where the critical second-order differential has the cycle correction. For p=2 these degrees are 2 and 3, and the output ordinary degree is 4; identifying k with r fails this test.
- Pullback along a map whose image lies in the singular support is not supplied. An admissible pullback of a smooth representative agrees with ordinary smooth-form pullback.

### 5.4 The logarithmic r forms and variety residues

For nonzero rational functions `f₁,…,f_m`, `m≥1`, define the `ℝ(m-1)`-valued ordinary `(m-1)`-form on their common regular unit locus by

```text
rₘ₋₁(f₁,…,f_m) = Alt_m Σ_{j≥0, 2j+1≤m}
 log|f₁| dlog|f₂|∧…∧dlog|f₂ⱼ₊₁|
       ∧d(i arg f₂ⱼ₊₂)∧…∧d(i arg f_m)
 / ((2j+1)!(m-2j-1)!).
```

Prove alternation and multiplicative additivity, so it is defined on the exterior power of the rational units. On the common regular unit locus prove `d rₘ₋₁ = Re(dlog f₁∧…∧dlog f_m)` for odd m and `d rₘ₋₁ = i Im(dlog f₁∧…∧dlog f_m)` for even m, taking real and imaginary parts coefficientwise. These are ordinary form identities on that locus, before extension as currents. For an irreducible codimension-`c` subvariety `Y⊂X`, the integral of this form over `Y_reg` against a complementary compact test form converges, defining a current of degree `m-1+2c` on `X`. Resolve the combined divisors and use cancellation of the alternating expression; individual logarithmic terms need not have an integrable absolute majorant before cancellation. (Goncharov [G04], §2.4–2.5, (13)–(18), Theorem 2.4 and Lemma 2.5, pp.14–16.)

For a normal variety, define varietyExteriorResidue as the finite sum of codimension-one valuation residues, using the residue-field norm/pushforward when required by the chosen target. For a nonnormal subvariety, normalize first and push the prime-divisor contributions forward with their residue degrees. Prove finite support and the uniformizer formula. The target rCurrent_deligneDictionary converts the current differential **degree by degree** through §5.2’s normalized dictionary before the raw simplex chain map is defined. Its Wang-form specialization is proved in §5.7 after defining those forms. The ordinary-`d` residue formula printed for general `r` in [G04] does not by itself settle the low-weight sign in the normalized complex. The conversion includes the top `2bar∂∂` operator. The weight-two instance is fixed by Poincaré–Lelong below; no unchecked universal ordinary-`d` identity is used to define the chain regulator. The logarithmic-form API requires the following facts.

- Permuting function entries multiplies the form by the permutation sign, and multiplying an entry adds its two corresponding forms.
- Proper degree-one resolution with the original cycle coefficients gives the same pushed current.
- Only finitely many prime-divisor residues are nonzero, with residue degrees retained under normalization.
- Every differential component transports through the normalized Deligne dictionary, including its top operator and Tate factor. *Needs:* §§3.3, 5.1–5.3 and algebraic resolution.

**Checks.**

- `r₀(f)=log|f|`, `r₁(f,g)=iη(f,g)`, and `r₂` is `Alt₃( (1/6)log|f|dlog|g|∧dlog|h| -(1/2)log|f|darg g∧darg h )`. The minus sign in the second term comes from `i²`.
- Repeated entries give zero. Multiplying one entry by a constant of norm one changes no logarithm jet; a constant of norm different from one may contribute nonzero terms.
- If `Y` has codimension one and `m=1`, the resulting current has ordinary degree two, not zero. Forgetting the codimension shift gives the wrong test-form degree.
- At `ord_z` and a constant `c`, the exterior residue of `z∧c` is `c`, while `dη(z,c)=-2πlog|c|(δ₀-δ_∞)` on `ℙ¹`. The raw current sign and normalized Deligne sign must be reconciled, rather than copied from an unshifted formula.
- A formal product `log|z|·dz/z∧dbar z/bar z` is not locally integrable near zero. The actual alternating `r` combination is integrated only after its cancellations have been justified.

### 5.5 Raw Deligne and simplex regulators

For a regular projective complex variety define goncharovDeligneComplex(X,n) in degrees `1,…,2n`, `n≥1`, by the square of current types `D^{p,q}`, `0≤p,q<n`, with ordinary degree `p+q` placed in cochain degree `p+q+1`, real twist `ℝ(n-1)`, and a final group of closed `(n,n)` currents with twist `ℝ(n)` in degree `2n`. The square differential is the appropriate type projection of `d`; the last differential is `2bar∂∂`. Prove square zero, conjugation compatibility and a quasi-isomorphism to the truncation of the universal real Deligne complex. The proof eliminates the overlapping Dolbeault rows using the explicit cone comparison, not just equality of cohomology dimensions. (Goncharov [G04], §2.2–2.3, Proposition 2.1 and Lemma 2.2, pp.10–13.)

For a projective simplex `L=(L₀,…,L_m)` with distinguished hyperplane `H`, choose affine defining functions whose ratios specify `r_{m-1}(L;H)`. Prove independence of the common choices, alternation of simplex vertices, and the behavior under changing `H`. The top integrated Chow function can be independent of `H` even though lower forms are not. For an admissible codimension-`n` cycle `Y⊂X×Δ^i`, resolve its closure, restrict the simplex `r_{i-1}` and push forward to `X`; define

```text
P^(2n-i)(Y) = (2πi)^(n-i) π_X* rᵢ₋₁(Y),       i>0,
P^(2n)(Y) = (2πi)^n [Y]_raw.
```

The shared simplicial higher Chow carrier and faces are supplied by KTheoryFiniteLocalFields §3.0a; this is the new analytic map. Prove independence of resolution, compatibility with faces, and goncharovRegulator_chainMap only after completing rCurrent_deligneDictionary. The ordinary current degree for `i>0` is `2n-i-1`, exactly matching the raw Deligne cochain degree. The full degree/sign comparison remains a named proof obligation of this model, even though the normalized Wang construction below gives a proven route to the cohomological regulator comparison. (Goncharov [G04], Definition 2.11 and Theorem 2.12, pp.22–24; Theorem–Construction 2.3, pp.13–14.)

For `X/ℝ`, prove the image is fixed by the de Rham involution combining conjugation on points and coefficients. For X over a number field F, define the underlying ℚ-scheme construction by the composite structural morphism X→Spec F→Spec ℚ, with the same total scheme X. Its real base change is X_ℝ=X×_ℚℝ, and the regulator target is `D(X_R/R,n) = D(X_R x_R C,n)^(F_infinity)`, with the same de Rham involution on points and coefficients. This structural-map operation is not the Weil-restriction functor. Prove its decomposition after complex base change as the disjoint union of `X x_(F,sigma) C` over all embeddings σ:F→ℂ, including conjugation’s permutation of these components. (Goncharov [G04], §1, equation (5), p.3.) The raw-regulator API requires the following facts.

- The displayed current-type complex squares to zero and compares by a specified quasi-isomorphism with the truncated universal Deligne model.
- The simplex form is alternating in its ordered vertices and has the declared dependence on the distinguished hyperplane.
- The regulator is independent of the proper resolution and commutes with the ordered face differential.
- For a real variety the chain map lands in the de Rham-invariant model; over F it lands in D(X×_ℚℝ/ℝ,n) for the composite structural morphism just defined, naturally in F-morphisms. *Needs:* §§5.1–5.4, the universal Deligne complex and higher Chow complexes.

**Checks.**

- At weight one the raw Deligne complex has degree-one real functions and degree-two closed `(1,1)` currents. Its last differential sends `log|f|` to `2πi[div f]_raw`.
- At `i=0` the regulator is a cycle current, not an undefined `r_{-1}`; at `i=1` a point with coordinate ratio `z/λ` gives the logarithm `log|z/λ|` with the stated period factor.
- A transposition of two simplex vertices reverses the form. A common nonzero scalar in their defining functions cancels from the ratios, but moving the distinguished hyperplane can change lower forms.
- The raw model shifts ordinary current degree by one below the top and changes twist at the top. Assigning ordinary degree `2n-i` at every degree fails the `i=1` logarithm test.
- A complex-conjugate cycle pair has invariant total regulator in the real model; a single embedding does not give the all-embeddings target.
- For X=Spec ℚ(i), X×_ℚℂ has two points interchanged by conjugation, and X×_ℚℝ=Spec ℂ as an ℝ-scheme. Weil restriction of Spec F along F/ℚ would instead give Spec ℚ, with one complex point.
- For X=Spec ℚ(√2), X×_ℚℝ is the disjoint union of two copies of Spec ℝ; for F=ℚ it is X×_ℚℝ itself. Thus the structural construction keeps both real embeddings and reduces to ordinary base change in degree one.

### 5.7 Wang forms and boundary currents

For degree-one real Deligne elements `u₁,…,u_m` in a Dolbeault algebra define wangForm T_m by

```text
S_m^i = (-2)^m Alt_m(u₁ ∂u₂∧…∧∂u_i∧bar∂uᵢ₊₁∧…∧bar∂u_m),
T_m = 1/(2m!) Σ_{i=1}^m (-1)^i S_m^i,       T₀=1.
```

Prove alternation, multilinearity, the right-nested alternating Deligne-product expression, and

```text
d_D T_m(u₁,…,u_m)
  = Σ_{j=1}^m (-1)^(j-1) d_Duⱼ • Tₘ₋₁(u₁,…,ûⱼ,…,u_m).
```

The Deligne product is associative up to the supplied homotopy; the right-nested expression is part of the convention. For `u_j=-log|f_j|`, prove `T_m=(-1)^m r_{m-1}` after placing the result in the declared Deligne model. Define cubical `W_m` using the `m` coordinate ratios and simplicial `G_m` using the simplex ratios. Prove their logarithmic integrability and the normalized current boundary identities:

```text
d_D[W_m] = Σ_{i=1}^m Σ_{j=0}^1 (-1)^(i+j) (δⱼⁱ)*[Wₘ₋₁],
d_D[G_m] = Σ_{i=0}^m (-1)^i (∂ⁱ)*[Gₘ₋₁].
```

Here `j=0` is the zero face, `j=1` the infinity face, and pushforward is along the face embedding. Equivalently the residue formula is `d_D[T_m]=-[T_{m-1}]Res` with its exact exterior-residue convention. Restriction to a degeneracy where a ratio is one gives zero. (Burgos–Feliu–Takeda [BFT], §5, (5.1)–(5.2), Proposition 5.3, pp.8–9, Proposition 5.16 and Theorems 5.23 and 5.26, pp.14–15.) *Needs:* §§5.2–5.5, Dolbeault products, proper-support pushforward and normal-crossing estimates.

The Wang-form API requires the following facts.

- Its ordinary alternating multilinearity and its right-nested Deligne-product expression agree with the displayed coefficients for every m≥1, with the separate unit at m=0.
- Substituting negative logarithms gives the displayed signed r-form in the declared model.
- The cubical and simplicial forms are logarithmically integrable, satisfy their respective current boundary identities and vanish on the stated degeneracies.

**Checks.**

- `T₀=1`, `T₁(u)=u`, and `T₂(u,v)=u(∂v-bar∂v)-v(∂u-bar∂u)`. In particular `T₁(-log|f|)=-r₀(f)` while `T₂=r₁`.
- A zero input logarithm jet gives zero; a coordinate ratio identically one therefore kills `W_m` or `G_m`. An arbitrary nonzero constant does not have zero logarithm jet unless its norm is one.
- In one cube coordinate the boundary is `-δ₀+δ_∞`, agreeing with `d_D[-log|t|]=-δ_{div t}`. Reversing zero and infinity without changing signs fails this check.
- A repeated logarithmic input makes the alternating form zero. The differential formula for `m=2` is `d_Du•v-d_Dv•u`, fixing the deletion signs.
- The cube boundary has `m` pairs of faces, whereas the simplex has `m+1` faces. Its signs are not obtained by identifying their first and last faces.

### 5.8 The cubical regulator

For a smooth projective complex `X`, an admissible codimension-`p` cycle `Z⊂X×□^m` and `□=ℙ¹\{1}`, resolve the closure and define cubicalRegulator `P_c(Z)` by restricting `W_m`, taking its current and properly pushing to `X` in the normalized dictionary. It has Deligne degree `2p-m`. Prove independence of resolution, compatibility with `δ=-∂_M`, so cubicalRegulator_chainMap on the supplied normalized complex is the formula `P_c∘J` after `cubicalOrientationChange` on all source models, and vanishing on degenerate cubes. The source is the infinity-normalized cubical complex of MotivicEtaleKTheory §1.1, the same face normalization used by BFT: every infinity face vanishes. Use its isomorphism to the quotient by coordinate degeneracies, with J on both models, for cubicalRegulator_normalizationComparison. Its integral cubical–simplicial and supported quasi-isomorphisms are supplied by §§1.3–1.4. The BFT normalization uses [BFT], §1, p.2 and §3, p.4. (Burgos–Feliu–Takeda [BFT], §6.2, (6.3) and Lemma 6.4, pp.16–17, the cubical regulator and its chain property.)

The cubical-regulator API requires the following facts.

- The supplied infinity-normalized source is isomorphic to its degeneracy quotient, and the explicit formula respects that isomorphism and the orientation change.
- The pushed current is independent of the chosen proper resolution and respects every admissible face with the displayed sign.
- Degenerate cubes have zero image, so the formula induces a chain map on the normalized quotient.
- In cube degree m and codimension p its Deligne degree is exactly 2p−m. *Needs:* §§5.2, 5.7, MotivicEtaleKTheory §§1.1–1.4 and algebraic resolution. Only proper-on-support maps are used in the current pushforward; resolving a closure is what supplies properness.

**Checks.**

- At `m=0`, `P_c(Z)=δ_Z`. At `X=Specℂ,p=1,m=1`, the δ-model has `P_c(a)=-log|a|`; on the supplied complex `(P_c∘J₁)(a)=log|a|`. The supplied one-chain boundary is `∂⁰-∂∞`, the negative of the Wang boundary; omitting `J₁` reverses the odd-degree regulator.
- A degenerate cube pulled back from fewer coordinates has regulator zero. A cycle contained in a forbidden face is not admissible and cannot be fed to the definition to obtain a boundary value.
- On the infinity-normalized complex the δ-model zero-face signs are `(-1)^i`, while the supplied ∂_M-model signs are `(-1)^(i-1)`; at i=1 these are −1 and +1. J identifies them and intertwines the normalization/degeneracy-quotient isomorphism; at degree zero that map and J₀ are identities.
- A codimension-`p` cycle with cube degree `m` produces degree `2p-m`, which may be below the top current degree; assigning it degree `2p` would fail the point-unit example.

### 5.9 Support complexes and the universal regulator comparison

The supported cone and its simple comparison complex are those of §5.2. The formulas below are in the δ-model; the comparison with the supplied complex applies `J` to both support total complexes and uses `P_c∘J` on cycles.

Define integrationComparison φ(α)=π_X*[α•W_m] for `α` in bidegree `(r,-m)`; its Deligne degree is `r-m`. Before fiber integration the ordinary form degree is generally `r+m-1`, with the `m=0,r=2p` top case handled separately. Prove that it lands in smooth forms on the base when the input does, is a chain map and is a quasi-inverse on cohomology to the base inclusion. Prove the logarithmic Green/Wang product identity, at the critical degree,

```text
d_D[g•W_m] = [ω•W_m] - δ_Z•W_m - [δg•Wₘ₋₁].
```

Below the critical degree the corresponding identity is `[d_Dg•W_m]+(-1)^(r-1)[δg•W_{m-1}]`. Local integrability of this product is proved using the logarithmic normal-crossing estimates; it is not an arbitrary product of currents. Construct the chain map

```text
ψ((ω,g),Z,α) = P_c(Z) - π_X*[g•W_m] + φ(α).
```

It restricts to `P_c` on cycles and to `φ` along `β`. This gives the chain-level comparison with the universal support construction. Composing the rational Chern character supplied by MotivicEtaleKTheory §§2.1–2.4 proves cubicalRegulator_beilinson, equality with the universal real Beilinson regulator. (Burgos–Feliu–Takeda [BFT], §6.2–6.3, Theorem 6.11, pp.15–19.) *Needs:* §§5.3, 5.7–5.8 and the early universal MotivicEtaleKTheory §§6.1–6.3 map and §7.2 identification.

The comparison API requires the following facts.

- Integration against the Wang form is a chain map on the specified logarithmic total complex and induces the inverse of its base-model inclusion on cohomology.
- The Green/Wang product is locally integrable and its differential is the displayed critical or subcritical expression, according to the Deligne degree.
- The comparison on the simple support complex is a chain map whose cycle and base restrictions are the stated explicit regulator and integration comparison.
- Composing with the independently specified rational Chern character gives the universal real Beilinson regulator.

**Checks.**

- Empty support gives an acyclic fiber of the identity restriction; full support gives the original complex because the open complement is empty. For a closed-support inclusion the two successive forgetful maps equal the direct one. These detect a cone with the wrong restriction arrow or shift.
- At cube degree zero, `W₀=1` and `φ` is the base current map. In the support simple complex `d²=0` uses `g₁d=dg₁` and `ρd=dρ`; the opposite signs in its last two components are essential.
- A cycle cocycle is `(0,cl Z,0)` and maps to `P_c(Z)`. A smooth base element enters as `(0,0,α)` and maps to `φ(α)`.
- For a principal divisor, the logarithmic Green term cancels the cycle current with the sign prescribed by `d_D[-log|f|]=-δ_div f`. Reversing the minus in `ψ` would prevent this cancellation.
- With `m=0`, the critical Green identity becomes `d_D[g]=[ω]-δ_Z`; there is no `W_{-1}` contribution. This is the ordinary Green-current equation.
- The formula in subcritical degree has sign `(-1)^(r-1)`, not a sign depending only on cube dimension. Test `r=1` and `r=2` to distinguish them.

### 5.10 Mixed cube–simplex forms

Define mixedWangForm `M_{n,m}` by applying `T_{n+m}` to the `n` cube logarithms **first** and the `m` simplex logarithms second, with `M_{0,0}=1`. Prove the two boundary identities with cube signs `(-1)^(i+j)` and simplex signs `(-1)^(n+i)`. A ratio one kills the mixed form, so it descends through cube normalization. Resolve an admissible cycle on `X×□^n×Δ^m`, restrict `M_{n,m}` and push forward to obtain mixedRegulator, of Deligne degree `2p-n-m`. Its δ-model source total differential is `δ+(-1)^n∂`; on the supplied mixed complex compose with `J_n` on cycles and both Deligne total complexes. The resulting source differential is `∂_M+(-1)^n∂`. The degree on the right of [BFT, (6.15)] must be read with both `n` and `m`; omitting one gives a false specialization to an axis. (Burgos–Feliu–Takeda [BFT], §6.4, Proposition 6.12, (6.13)–(6.17), Lemmas 6.16–6.17 and Theorem 6.18, pp.19–21.)

The axis restrictions in the δ-model are `P_c` and the normalized simplicial regulator `P_s`; on the supplied models they are `P_c∘J` and `P_s`. Apply MotivicEtaleKTheory §§1.3–1.4’s mixed quasi-isomorphisms to prove simplicialCubicalRegulator_agree on higher Chow homology; together with §5.9 this proves simplicialRegulator_beilinson. The simplex hyperplanes used in [G04] and [BFT] differ by `z₀↦-z₀`. The extra factor `-1` has zero logarithmic jet, so it does not alter the normalized forms. Identifying the raw [G04] chain map with this normalized chain map still requires the full degree/sign dictionary of §§5.2, 5.4–5.5; equality on higher Chow homology in the **normalized** model does not erase that separate obligation. *Needs:* §§5.7–5.9 and MotivicEtaleKTheory §§1.3–1.4’s mixed comparison.

The mixed API requires the following facts.

- The two axes are the indicated Wang forms, with value one at the common origin; their boundary signs give the specified square-zero total differential.
- Admissible proper resolution gives a well-defined mixed current regulator of degree 2p−n−m, with orientation change only in cube degree.
- The two axis regulators agree on higher Chow homology through the mixed comparison quasi-isomorphisms and hence share the specified universal regulator comparison.

**Checks.**

- `M_{0,m}=G_m`, `M_{n,0}=W_n` and `M_{0,0}=1`. The regulator degrees on these axes are `2p-m` and `2p-n` respectively.
- At `n=1`, the simplex face signs are the negative of their `n=0` signs; this is exactly the total-complex factor `(-1)^n`.
- At `(n,m)=(1,1)`, the cube-then-simplex boundary cancellation tests anticommutation of the two differential directions. Interchanging the logarithm blocks without the permutation sign changes the form.
- The simplex coordinate change `z₀↦-z₀` leaves `-log|-f|=-log|f|` and the derivatives unchanged. A scale of norm different from one is not justified by this argument.

### 5.11 Chow polylogarithm forms on parameter spaces

On the admissible Chow locus of §5.3 define chowPolylogForm ω_p^q, for `q≥1` and `0≤p≤q-1`, by

```text
ω_p^q = (2πi)^(-p) (π₂)_* [r_{p+q-1}(L;H)]_raw.
```

Here `r_{p+q-1}` has `p+q` function entries and ordinary degree `p+q-1`. The projection integrates over complex `p`-dimensional fibers with their complex orientation, so the output has ordinary degree `q-p-1` and values in `ℝ(q-1)`. The displayed factor uses raw currents; conversion to normalized currents is performed by §5.2. The residue factor `2πi` of [G04, Corollary 2.9, (26), p.21] is absorbed because `(2πi)^(-p)·2πi=(2πi)^(-(p-1))`. This fixes the normalization of the face identity at adjacent fiber dimensions. For `p=0` the coefficient is one, giving the ordinary logarithm at `q=1`. The real scalar coordinate of the top form is `i^(1-q)ω_{q-1}^q`; at `q=2` it is `-∫r₂/(2π)=P₂`, with §5.14's convention. The construction follows the arity in the first sentence of the proof of [G04, Theorem–Construction 3.1, p.27]; its subsequent displayed Radon formula has inconsistent indices and is not used to fix degrees or period factors. The weight-zero chain is empty. Construct currents on smooth parameter families first, as specified below. On the sublocus of **smooth cycles in generic position to the arrangement**, the resulting forms are real analytic; smoothness of the parameter scheme alone is insufficient. Prove `dω₀^q=π_qΩ`, `dω_p^q=Alt(face*ω_{p-1}^q)` and the alternating vertex relation. Here pullback notation for a singular parameter space means the construction on its base-changed family, with an ordinary current pullback used only under the transversality conditions below. The exact face signs come from §5.5. For `p=q-1`, its real coordinate is the scalar Chow polylogarithm, invariant under the indicated torus action and independent of the auxiliary hyperplane; the lower forms generally are not. (Goncharov [G04], Theorem–Construction 3.1 and Theorems 3.3–3.4, pp.26–28.)

Define resolvedIncidenceRegulator(f) for every smooth finite-type complex parameter scheme `S` and algebraic map `f:S→A`. Pull back the **relative cycle** of §5.3 to `I_f=Σm_a[Γ_a]`. Resolve each component properly and birationally, with the pullbacks of all coordinate and auxiliary-hyperplane divisors in simple-normal-crossing position. On the complement of these divisors pull back the meromorphic functions, then form the ordinary logarithmic `r` form of §5.4. Its locally integrable extension on the resolution defines a current. Push it to `S` by the proper incidence projection and sum with the original coefficients `m_a`, using the normalized-current dictionary of §5.2. This defines a family current without pulling an arbitrary ambient current onto a singular incidence variety. The smooth morphism pullback used before restriction in [G04, §3.1, p.27] and the cycle restriction are replaced here by this explicit resolution construction.

Prove independence of resolutions using a common proper resolution, the degree-one projection formula of §5.2, and dominated limits of the logarithmic forms in SNC coordinates from §5.4. Preserve the coefficients before resolving; a birational resolution has generic degree one and cannot divide or discard them. Compact support in `S` has compact inverse image on the incidence support, so the pushforward is defined even when `S` itself is noncompact. The chain identity follows from the current residue theorem of §5.4: each coordinate residue is the multiplicity-bearing face cycle constructed in §5.3, with the sign of §5.5. The alternating vertex relation follows by applying the alternating logarithmic-symbol identity before integration and then proper pushforward.

The resolved-family API requires the following facts.

- Changing the componentwise proper birational resolutions leaves the pushed current unchanged, and cycle coefficients enter additively.
- The incidence projection is proper on support, so its current pushforward is defined against compact test forms.
- Proper admissible face intersection commutes with the regulator with its declared residue sign.
- Smooth submersion base change, and the stated transverse smooth base changes, commute with the family current.

Algebraic base change of `I_f` uses MotivesAndAlgebraicCycles §4.8a for every Noetherian base map; the §5.3 adapter identifies it with the Chow-form family. For the resulting **currents**, ordinary pullback and the base-change identity are asserted for smooth submersions, and for smooth maps transverse to the chosen resolved incidence and divisor strata, with proper base-change on support. For another map, including a curve entirely contained in a discriminant locus, construct the current on that new smooth base from its own pulled-back cycle; do not assert that a distribution pullback exists. Thus singular Chow loci are handled by their smooth test families, and no manifold structure or unrestricted current pullback is assigned to them. Real analyticity on smooth, arrangement-transverse cycle families is obtained by proper fiber integration in local analytic trivializations of the family and its boundary strata, together with the logarithmic estimates; a family of singular fibers remains a current-valued construction. (Goncharov [G04], Theorem 2.4 and its proof, pp.15–17, and Theorem–Construction 3.1, pp.26–27; §§5.2–5.4 above.)

**Checks.**

- A doubled smooth component contributes twice the family current.
- Resolving a node with two branches retains both branch contributions and agrees on a common resolution.
- For a two-point collision the scalar family value specializes to twice the point value whenever that value is regular there; pulling back a reduced incidence support would give the wrong answer.
- Smooth submersion base change commutes with the construction, while a map into a singular stratum requires a newly constructed family current.
- For a point family (`p=0`) the degree is `q-1`; for `p=q-1` it is zero.
- At `q=1,p=0`, `r₀` has one entry and gives `log|f|`.
- At `q=2,p=1`, `r₂` has three entries and the real coordinate is `P₂=-∫r₂/(2π)`.
- Using `r_{p+q}` has an extra entry and an extra degree; omitting the factor `(2πi)^(-p)` inserts an unwanted `2πi` in the face identity.

The Chow-form API requires the following facts.

- The form is the declared incidence integral and has ordinary degree q−p−1 and twist q−1.
- Proper admissible faces and vertices satisfy the displayed differential and alternating identities on the stated test families.
- At p=q−1 its scalar coordinate is invariant under the indicated torus action and independent of the allowed auxiliary hyperplane change.

These are identities on the specified families and, on the smooth-cycle locus, identities of forms. Incidence projection properness and the good-locus support condition are part of each statement. *Needs:* §§5.2–5.5 and the exact relative Chow-family construction of §5.3.

**Checks.**

- `p=q-1` has degree zero; `p=0` has degree `q-1`. Reversing these indices gives the wrong scalar case.
- On a degree-one point cycle the incidence formula recovers the corresponding `r` form. A general degree-`e` cycle contributes the full incidence sum, not merely one chosen point.
- The scalar top function is unchanged by the auxiliary hyperplane change allowed by Theorem 3.4. A lower form may change; its differential still satisfies the face identity.
- A cycle failing proper face intersection is outside the good locus. Neither real analyticity nor the current face-pullback formula is asserted at such a parameter.

### 5.12 Green cycle classes and Arakelov cones

For a smooth projective complex variety and an integer p≥1 define greenChowClass using pairs `(Z,g)` with `Z` a codimension-`p` cycle and `g` a `(p-1,p-1)` Green current satisfying `ddᶜg+[Z]_raw=ω` smooth. Quotient by current boundaries and the principal pairs `(div_Y f,-push_Y log|f|)` from codimension-`p-1` subvarieties. Prove additivity, forgetful map to the ordinary Chow group, well-defined curvature and the comparison from logarithmic Green representatives. This is the complex-variety Green presentation, not the arithmetic Chow group of a regular model over `Specℤ`. The top two Gersten terms suffice to identify its terminal regulator graph in cohomological degree 2p with the higher-Chow-index-zero Arakelov presentation; they do not imply a quasi-isomorphism of full Gersten and higher Chow complexes. (Burgos [BUR], Chapter II, Theorem 4.3, pp.79–83; Goncharov [G04], Proposition 2.14, pp.24–25.)

For n≥1 define arakelovMotivicComplex(X,n)=Cone(P)[-1] for the explicit chain regulator. Its degree-j terms are `C^j⊕D^{j-1}`. Use Green pair coordinates, obtained from the supplied restriction-fiber convention by negating the second coordinate, with `d(c,g)=(dc,-P(c)-d_Dg)`. Quotient the top Deligne group by smooth closed forms to obtain D′ and the regulator P′, then define higherArakelovChow(X,n,i)=H²ⁿ⁻ⁱ(Cone(P′)[−1]) for i≥0. At higher-Chow index i=0, hence cohomological degree 2n, this identifies with the Green presentation above (p=n). A cycle in C²ⁿ pairs with a Green representative in D²ⁿ⁻¹, of ordinary degree 2n−2; the cone shift does not move this pair to H⁰. Over ℝ take the de Rham-invariant subcomplex. Over a number field F, use §5.5’s underlying ℚ-scheme construction X→Spec F→Spec ℚ and form Cone(C(X,n)→D(X×_ℚℝ/ℝ,n))[−1], with the same top quotient D′ for higherArakelovChow. Independence of a change from the higher Chow model to a polylogarithmic motivic model requires a separate compatible regulator quasi-isomorphism and is not assumed. (Goncharov [G04], §1, (3)–(5), pp.3–4, and §2.8, Proposition 2.14, pp.24–25.)

The Green and Arakelov API requires the following facts.

- Every declared principal pair has zero class and zero curvature; curvature and the forgetful Chow class descend to the quotient.
- The motivic complex is the shifted cone with the displayed Green pair differential, and H²ⁿ of the modified cone, namely higherArakelovChow(X,n,0), has the Green presentation.
- The two top Gersten terms identify the terminal regulator graph in degree 2n without asserting a comparison of the full complexes.
- Conjugation invariants give real descent; number-field descent uses the composite structural morphism and D(X×_ℚℝ/ℝ,n) of §5.5, retaining every embedding component.

The chain-map dictionary obligation of §5.5 applies to the raw cone; alternatively define the cone using the normalized regulator with its proven comparison. The choice must be declared before comparing cones. *Needs:* §§5.3, 5.5–5.10, current boundaries, ordinary Chow groups and MotivicEtaleKTheory §§1.1–1.4, 2.1–2.4, 6.1–6.3 and 7.1–7.4.

**Checks.**

- On `ℙ¹`, the pair `(div f,-log|f|)` has zero curvature and is zero in the Green quotient. A principal pair with the positive logarithm would double rather than cancel its divisor current.
- For X=Spec ℚ(i), the complex target has two conjugate components before taking invariants; for X=Spec ℚ(√2) it has two real components. The cone uses respectively these two-component targets, rather than the one component of a Weil restriction of Spec F.
- At `Specℂ`, codimension-one cycles vanish and every real constant Green term is removed by `-log|a|` for a positive real unit `a`; hence this complex-variety codimension-one Green group, higherArakelovChow(Specℂ,1,0)=H² of the modified cone, is zero.
- A point on `ℙ¹` with a Green representative has curvature of integral one. Its class is not killed by the principal relation, since its underlying divisor degree is nonzero.
- The modified top Deligne quotient kills smooth closed top forms before forming the higher Arakelov Chow cone. Using the unmodified cone gives a different group and does not prove the asserted higher-Chow-index-zero presentation.
- At n=1, a divisor has C-degree 2 and its Green function D-degree 1, so their pair lies in fiber degree 2; at n=2 the degrees are 4,3 and 4. An unshifted cone would put these pairs in degrees 1 and 3. If H⁰ notation is desired, the entire fiber must additionally be shifted by [2n].
- In Green pair coordinates, `d(W,0)=(div f,-P(W))` for the graph of f; with the normalized positive unit regulator this is `(div f,-log|f|)`. The second component of d² is `-Pdc+d_DP c=0`, fixing the coordinate sign.

### 5.13 Curve complexes, tame symbols and unramified regulators

Let `X/k` be a smooth proper geometrically integral curve in characteristic zero, with function field `F`. Define the weight-`n` curve complex, for `n=2,3`, as the unramified homotopy fibre of the sum of closed-point residues,

```text
Γ(X,n) = Cone(Γ(F,n) → ⊕x∈X⁽¹⁾ Γ(k(x),n−1)[−1])[−1].
```

The displayed residue map is a degree-zero map into a shifted complex, using the shift differential of §3.3. In degree one its cohomology is the kernel of the cohomological residue, not a claim that each individual symbol is unramified. In higher degrees use the full localization sequence, retaining the adjacent residue-cohomology boundary term. Export curvePolylogComplex_restrict, curvePolylogComplex_unramified and a localization sequence. Finite curve pullback multiplies local residues by the ramification index. Pushforward requires the compatible transfer of §4.7 and its homotopies; a mere sum of field norms does not define it on the whole complex. (Goncharov [G04], §6.1, (75), p.52; Goncharov [D96], §2, pp.5–7.) *Needs:* §§3.2–3.3, 4.1–4.2, finite-place valuations and the supplied function-field/closed-point correspondence.

On a complex curve and away from the divisors of nonzero rational functions `f,g`, define

```text
η(f,g) = log|f| darg g − log|g| darg f.
```

Its pointwise jet on values `f,g` and derivatives `df,dg` is `log|f| Im(dg/g)-log|g| Im(df/f)` on the unit locus. Prove antisymmetry and multiplicative bilinearity, `r₁(f∧g)=iη(f,g)`, closedness on the punctured curve, and the current equation

```text
d[η(f,g)] = 2π Σx log|tameₓ(f,g)| δx.
```

Here the tame symbol is fixed by `tameₓ(π,u)=u(x)⁻¹`; explicitly it is `(-1)^(v(f)v(g))·u_f^v(g)/u_g^v(f)` with `u_f=fπ^(-v(f))`. The sign disappears after the real logarithm, but it cannot be deleted from the integral tame-symbol theorem. The rational exterior residue in §3.3 is the inverse convention on units and also omits this sign; its comparison is made after rationalization. Use PolylogarithmFunctions §5.4’s Steinberg one-form identity `η(f,1-f)=dD(f)` on the complement, and prove its locally integrable current extension here. These give curveEtaRegulator from unramified weight-two classes to real de Rham cohomology, with the appropriate real-conjugation eigenspace for curves defined over ℝ. (Goncharov [G04], §6.1, p.52, and §6.3, (85), p.57; Zagier [Z07], §2, pp.6–8.)

State the Chern comparison separately: the symbol regulator above represents the unramified Beilinson regulator only after composing the specified rational Chern character and Deligne/de Rham comparison. Fix the convention by `ch₂,₂=-c₂,₂` and the cup product representing `iη`; under the corresponding product-symbol convention the minus sign in `c₂,₂` gives the positive displayed η regulator. Export curveEtaRegulator_beilinson, with the sign included, rather than calling every exterior symbol an integral `K₂` element. (Nekovář [NEK], §7.3, (7.3.2), and §7.4, (7.4.1), pp.23–24, for the curve differential; Schneider [SCH], §4, p.28, for the rational Chern-character sign and multiplicativity.) *Needs:* PolylogarithmFunctions §5.4’s Bloch–Wigner differential and PolylogarithmFunctions.blochWigner_fiveTerm, §§5.1–5.2, 5.9 and the early MotivicEtaleKTheory §§7.1–7.4 Chern-character and unit/product conventions.

The curve-complex and one-form API requires the following facts.

- Restriction from the unramified homotopy fiber has the full localization sequence and the declared first-cohomology kernel interpretation.
- Finite curve pullback commutes with local residues after multiplication by ramification index; a coherent whole-complex transfer is required for pushforward.
- The eta form is alternating and multiplicatively bilinear on nonzero rational functions, and is closed off their divisors on the complex curve.
- Its current differential has the stated signed tame-logarithm residues; the Steinberg identity extends as a locally integrable current.
- Unramified classes induce the stated de Rham regulator, and its Beilinson comparison uses the declared rational Chern character and sign.

**Checks.**

- `η(2,e^{it})=log 2·dt`. A constant first function does not make η zero. The jet values `(f,g,df,dg)=(2,i,0,-1)` give `log 2`, pinning the sign at `t=π/2`.
- On a punctured disk, `η(z,c)=-log|c| darg z`; its current differential is `-2π log|c|δ₀`. Since `tame₀(z,c)=c⁻¹`, the displayed current formula has this sign.
- `η(f,1-f)` is dD(f), by PolylogarithmFunctions §5.4’s Bloch–Wigner differential. Reversing the two factors gives `-dD(f)` and would reverse the Steinberg identity.
- On `ℙ¹`, take `f=t`, `g=t-a`, `a≠0`. The unsigned exterior residues at `0,a,∞` are `-a,a⁻¹,1`, with product `-1`. The signed integral tame product is `1`, because the infinity symbol contributes `-1`. The rational chain identity must not be misrepresented as the unsigned integral Weil reciprocity theorem.
- The fibre of a zero residue map is `Γ(F,n)⊕(⊕Γ(k(x),n-1)[-1])[-1]` with the cone grading. Replacing the homotopy fibre by the literal kernel loses this second summand and its localization sequence.
- A symbol whose tame logarithm is nonzero at a point does not define a closed current. A finite sum may be closed because its residues cancel, even if its summands are ramified.

### 5.14 Chow dilogarithms and the two reciprocity triangles

For a smooth projective connected complex curve define the real Chow dilogarithm on three nonzero rational functions by

```text
P₂(f₁∧f₂∧f₃) = −(1/(2π)) ∫X r₂(f₁∧f₂∧f₃).
```

Use the real `r₂` of §5.4, without an additional imaginary scalar. The integral exists by the logarithmic estimates, with a common resolution of all divisors. Prove alternation, multiplicative trilinearity, vanishing when one factor is a nonzero complex constant, and invariance under isomorphism of curves. The Steinberg evaluation is

```text
P₂((1-f)∧f∧g) = Σx vₓ(g) D(f(x)).
```

Endpoint values are taken with the continuous extension of `D`. The formula follows from the current identity for the one-form

```text
ρ₂({f}₂⊗g) = D(f)darg g − (1/3)α(1-f,f) log|g|,
α(a,b) = log|a| dlog|b| − log|b| dlog|a|,
d[ρ₂({f}₂⊗g)] = 2π Σx vₓ(g)D(f(x))δx + [r₂((1-f)∧f∧g)].
```

This normalization makes the real Chow function agree with the Bloch–Wigner evaluation of the reciprocity homotopy below. An alternative imaginary-valued `r₂` convention requires transporting both prefactors together. (Goncharov [G04], §6.3, Lemma 6.9, (83)–(85), p.57; Goncharov [G00], Proposition 4.1, (28), pp.17–20.) The Chow-dilogarithm API requires the following facts.

- Permuting the three entries changes the value by the permutation sign, and multiplication in any entry adds the two values.
- A nonzero constant entry makes the integrated value zero on the proper curve.
- The stated Steinberg triple evaluates to the sum of the specialized Bloch–Wigner values with divisor multiplicities.
- An isomorphism of smooth proper complex curves preserves the integral after pullback. *Needs:* PolylogarithmFunctions.blochWigner_fiveTerm, §§3.2–3.3 and 5.2–5.4.

For a smooth proper connected curve X over an algebraically closed field k, put F=k(X) and formulate **strong reciprocity** as a homotopy

```text
h : Λ³ F×ℚ → B₂(k)ℚ,
δ₂ ∘ h = Res,       h ∘ δ₃ = Res,
h(k× ∧ Λ² F×)=0.
```

The two Res maps have different source and target degrees; each is the sum of the closed-point residues with the conventions of §3.3. The target `B₂(k)` is the pre-Bloch group with its nonzero cobracket, not `ker δ₂`. The second triangle expresses compatibility on `B₂(F)⊗F×ℚ`. Prove strongReciprocity_impliesSuslin: the first triangle places every total exterior residue in `im δ₂`, so its class in Milnor `K₂(k)ℚ=coker δ₂` vanishes. Define StrongReciprocityHomotopy by the two algebraic triangles and constant-factor vanishing. For the normalized functorial system in characteristic zero and the maps constructed in §§5.15–5.16 over ℂ, prove strongReciprocity_analytic: `D∘h=P₂`. For the functorial system use [BOL], Corollary 1.11 with the sign adapter below. For the explicit rational and cubic maps, derive equal parameter differentials from their line and rational-curve constructions, then fix the integration constant by an admissible degeneration. This is a theorem about those constructed, family-compatible maps; the algebraic triangles alone do not assert analytic equality for an arbitrary homotopy. The algebraic descent used in that explicit-formula route is ellipticFiveTermDescent below for cubics and the explicit five-term proof of §5.15 for `ℙ¹`. The arbitrary-curve presentation in [G04] is not identified with this explicit group by rational-function rigidity alone. For every algebraically closed characteristic-zero field k, prove strongReciprocity_charZero: there is a unique system of such maps h_F for all finitely generated one-variable function fields F/k, functorial in finite k-embeddings j:K→F in the degree-normalized sense `h_F∘Λ³j=[F:K]h_K`. Uniqueness concerns the entire functorial system, not a single map satisfying the triangles. Use the m=2 system of §4.7: its canonical truncation has B₂(k) as target, and the vanishing degree-one residue extends its homotopy to the full weight-three complex. The norm, field-generator and tower obligations are those of §4.7; [BOL] additionally gives uniqueness from functoriality of the system in this weight. This is Bolbachan [BOL], Theorem 1.8, pp.5–6, and §§2–4, pp.8–23; Remark 1.3(ii), pp.3–4, makes its target the explicit rational five-term quotient. Existence for general curves over algebraically closed positive-characteristic fields remains conjectural. The construction targets here are `ℙ¹` in the explicit rational presentation, elliptic plane cubics with ellipticFiveTermDescent, and curves over `ℚ̄` after tensoring with ℚ. The last case uses the number-field presentation comparison of [G04], Proposition 6.1, p.53, followed by a filtered union over number fields. (Goncharov [G04], Conjecture 6.2, Lemma 6.4 and Theorem 6.5, pp.53–54.)

Transport the signs before using this route. In [BOL], Definition 1.2 and Proposition 1.4, the last symbol differential is `x∧(1-x)∧g`, the symbol residue is `-v(g)[x̄]₂`, and the exterior residue sends `π∧u∧v` to `ū∧v̄`. Here the last symbol differential and raw symbol residue are both their negatives. Definition 1.6 writes the bottom triangle with `-δ₂,BOL`; since `δ₂,BOL=-δ₂` here, its H_F satisfies both of our raw triangles with `h_F=H_F`. In shifted-complex coordinates the degree-three residue here additionally has the minus sign of §3.3. Corollary 1.11 writes its real Chow coordinate as `P_BOL=-D∘H_F`; transport that coordinate as `P₂=-P_BOL`, giving the displayed real integral normalization `D∘h_F=P₂`. Check this conversion on `(1-t)∧t∧(t-a)`, whose symbol value is `[a]₂` and whose real integral is D(a). Functoriality is an input to the analytic conclusion (Remark 1.12), not a consequence of one algebraic triangle. ([BOL], Definition 1.6, p.5, Corollary 1.11 and Remarks 1.10–1.12, p.6.)

*Needs:* §§3.2–3.3 for the explicit complexes and residues, §4.7’s m=2 normalized functorial system and the smooth proper curve/function-field correspondence. The analytic comparison uses §§5.2–5.4 and the stated real normalization.

The homotopy API requires the following facts.

- Its source is the rational third exterior power of function-field units and its target is the rational pre-Bloch group of the constant field.
- The two residue triangles hold on their respective source degrees, and constant wedge factors have zero image.
- The first triangle gives zero total residue in the Milnor cokernel; analytic equality is asserted for the specified normalized family-compatible constructions, rather than for every map satisfying only one triangle.
- In characteristic zero the system is unique with the displayed degree-normalized field-embedding law; over ℂ its analytic comparison uses the transported Chow sign. This does not assert uniqueness from the two triangles on one field.

**Checks.**

- On `ℙ¹`, the Steinberg triple `(1-t)∧t∧(t-a)` has Chow value `D(a)` for `a≠0,1`. The contribution at infinity is zero. The opposite integral prefactor would give `-D(a)`.
- `P₂(c∧f∧g)=0` on a proper curve, although its pointwise `r₂` integrand need not vanish. The vanishing is an integrated identity, not a rule discarding constants from all local forms.
- For `a=3`, `Res(t∧(t-1)∧(t-a))=a∧(1-a)=3∧(-2)`, nonzero in the rationalized exterior square of `ℚ×`. Thus a homotopy valued in the Bloch kernel could not satisfy the first triangle.
- On an empty divisor the Steinberg evaluation is the empty sum zero. On a nonproper curve Stokes adds a boundary term; properness is essential to the stated integral formula.
- The zero linear map satisfies neither reciprocity triangle in the preceding `a=3` example.
- At a=i, the rational-curve Steinberg triple gives `h=[i]₂`, `D(h)=D(i)>0`, while the [BOL] Chow coordinate is −D(i). An untransported use of its corollary reverses our real integral.
- For the embedding `k(t)→k(s)`, t=s² in characteristic zero, the degree-normalized law is `h_{k(s)}(j_*a)=2h_{k(t)}(a)`; the identity embedding has coefficient one. For k=ℂ and the Steinberg triple with a=i, the values are `[i]₂` and `2[i]₂`, with real periods D(i) and 2D(i). These test the degree factor without asserting an unsupported whole-complex transfer.

- Replacing `h` by another map with the first triangle alone does not establish analytic equality. The second triangle, constants and the normalization in the rigidity argument are required.

### 5.15 Rational curves, families and algebraic-number fields

Construct rationalCurveReciprocity on `ℙ¹` by factoring divisors into points and summing their multiplicities against five-term cross-ratio symbols. In the cross-ratio convention `r(∞,0,1,z)=z` of the conventions, an affine triple contributes `r(a,b,c,∞)=(a-c)/(b-c)`; the fourth auxiliary point is chosen away from the finite support. Prove independence of that point by the five-term relation and the zero degree of principal divisors, and prove the two triangles of §5.14. Coincident points use the declared degenerate symbols, not undefined fractions. In the integral pre-Bloch model the source carries a small torsion ambiguity; state the exact integral result modulo the six-torsion convention of the source before deducing the rational statement. The rational-curve reciprocity API requires the following facts.

- Every auxiliary point outside the finite divisor support gives the same rational pre-Bloch class.
- The constructed map satisfies both residue triangles, including the Steinberg tensor triangle.
- Projective linear changes of coordinate transport the map equivariantly. (Goncharov [G04], §6.3, Theorem 6.5 and Propositions 6.6 and 6.8, pp.54–57.) *Needs:* PolylogarithmFunctions.blochWigner_fiveTerm, §§3.3, 5.13–5.14 and rational functions/divisors on `ℙ¹`.

For an algebraic family of smooth proper curves, with three rational functions and the open parameter locus where their divisors have controlled proper incidence, prove that the real Chow dilogarithm is locally a finite rational combination `Σᵢ qᵢ D(φᵢ)` of rational functions on that locus. The statement concerns a local expression on the good locus; no global single-valued rational lift or chosen expression invariant under every degeneration is promised. The differential is the pullback of dD from PolylogarithmFunctions §5.4’s Bloch–Wigner differential. Export chowDilog_family, its restriction and change-of-expression lemmas, and a fibrewise specialization theorem when the same support hypotheses persist. (Goncharov [G04], Theorem 6.10, pp.57–58.)

Over `ℚ̄`, construct algebraicCurveReciprocity by a finite cover and descent from the explicitly handled case, dividing by the finite degree after rationalization. Prove independence of the cover and compatibility with the two residue triangles. The analytic identification is checked at all number-field embeddings and uses the injectivity of the full rational Borel regulator in the applicable degree. Injectivity of one chosen complex component is not an input. Export base extension and isomorphism functoriality; finite-cover transfer requires the coherent norm interface, not a symbol-by-symbol replacement of every argument by its field norm. (Goncharov [G04], Theorem 6.12 and its proof, pp.59–60.) *Needs:* rational reciprocity, finite cover geometry, §§2.1–2.3, K3BlochGroups Layer 4’s indecomposable-K₃/Bloch comparison, BorelRegulators §2.3’s injectivity of the full all-embeddings regulator, and K2SymbolsBrauer §§10.9, 10.24 and 10.29–10.30’s Milnor-K₃ norms and reciprocity, and §10.12’s Milnor base-change identity `res N = sum_(g in G) g_*` for a finite Galois cover with group G, followed by rational division by its nonzero degree. Whole-polylogarithmic-complex transfers are not inputs; §5.14’s characteristic-zero functorial system gives another route.

**Checks.**

- `r(0,1,a,∞)=a/(a-1)` in the affine convention just fixed. By the sixfold Bloch–Wigner symmetries, this has `D` value `-D(a)`; interchanging the first two entries reverses it. This detects confusing the two reciprocal source cross-ratios.
- Replacing the auxiliary point by another allowed point changes the cross-ratio sum by five-term relations. A choice in the divisor support is excluded before forming any quotient.
- A family constant in the parameter has constant Chow dilogarithm and zero parameter differential. A varying fibre integral cannot be replaced by the value on one arbitrarily selected fibre.
- A degeneration in which two divisor points collide can leave the good locus. The family expression is asserted only on the stated open set; it is not a claim of holomorphic extension of the real-valued Chow function.
- Pulling a reciprocity construction up a degree-`d` cover and pushing down multiplies by `d`. Rational division by `d` recovers the original map; the integral claim cannot use that step for free.
- An imaginary quadratic field has one complex regulator component, whereas fields with several complex places require all components for the stated injectivity. Discarding rows can destroy the independence argument.

### 5.16 Elliptic plane cubics and line arrangements

Let `E⊂ℙ²_k` be a smooth plane cubic over an algebraically closed field `k` of arbitrary characteristic, with a chosen flex as origin. For four ordered lines `L₀,…,L₃` in general position, let `Dᵢ=E·Lᵢ`, with intersection multiplicities, and `lᵢⱼ=Lᵢ∩Lⱼ`. Assume the intersections used to evaluate the line cross-ratios avoid all their forbidden points. Define the elliptic reciprocity value by

```text
h_E((l₁/l₀)∧(l₂/l₀)∧(l₃/l₀))
  = − Σᵢ₌₀³ (−1)^i [r(lᵢ₀,…,omit lᵢᵢ,…,lᵢ₃,Dᵢ)]₂.
```

Before descending this expression, prove ellipticFiveTermDescent in the explicit rational five-term quotient. For the displayed smooth plane cubic, form the free ℚ-module on triples of nonzero rational functions modulo multiplicative expansion, alternation and constant factors. Expand every rational function as a product of chord quotients with divisor `(x)+(y)-(x+y)-(0)`. The target says that the displayed line-symbol map kills each chord-associativity relation and the relations between those expansions, and that its second reciprocity triangle holds on every `[f]₂⊗g`, `f≠0,1`, by explicit five-term identities. The explicit descent API requires the following facts.

- Every chord quotient has the declared line-symbol value, with constant quotients giving zero.
- The associativity relations between chord expansions vanish in the explicit five-term quotient.
- Every Steinberg tensor satisfies the second reciprocity triangle in that quotient.
- Specialization within the admissible arrangement locus preserves the value, and permitted tangent limits retain their intersection multiplicities. This is the presentation adapter required by ellipticReciprocity_relations; its proof must take place in the explicit quotient, not in [G04]'s arbitrary-curve quotient. In characteristic zero, use the functorial explicit-quotient system of §5.14 as a second proof route: identify the prescribed line-symbol values with that system, using [BOL], Remark 1.10 and the proof of Theorem 1.8, before deducing descent and analytic comparison. Uniqueness of a functorial system does not by itself identify an arbitrary line formula. The line-value identification and the positive-characteristic five-term descent remain explicit obligations; [BOL] assumes characteristic zero. [G04], Proposition 6.17, p.63, identifies the chord relations but kills them in the broader quotient using curve rigidity; Proposition 6.1 and the remark on p.53 give the precise boundary of that source's presentation comparison. Thus that rigidity argument alone does not discharge this target. *Needs:* the explicit five-term group, divisor/chord relations and the line formula, independently of the supplier’s rational-function rigidity.

**Checks.**

- At `y=0`, the chord divisor is zero; the chord function is constant and the symbol sum vanishes in the explicit quotient.
- The two parenthesizations of `(x+y)+z=x+(y+z)` give the same rational function modulo constants. The difference of their expanded line sums must be a five-term relation, even when its exterior boundary is zero; that boundary alone cannot prove descent.
- A doubled intersection point contributes twice its symbol under specialization. Over ℂ, applying `D` to every expanded relation gives zero, a necessary check that does not replace its explicit five-term proof.

Here `lᵢ` on the left is a homogeneous equation of `Lᵢ`; each right-hand cross-ratio is on the projective line `Lᵢ` and is evaluated additively on its degree-three intersection divisor. Its three fixed points retain their displayed order. Prove independence of rescaling the line equations and compatibility with the rational-function presentation, then the first and second reciprocity triangles. The construction descends to all rational functions on `E` using chord divisors `(x)+(y)-(x+y)-(0)` and their associativity relations; giving the line formula alone is not that descent proof. (Goncharov [G04], Theorem 6.14 and Proposition 6.17, pp.62–63.) The elliptic reciprocity API requires the following facts.

- On every admissible four-line arrangement the value is the displayed alternating divisor-symbol sum.
- Rescaling the line equations leaves it unchanged; chord expansions extend it to all rational functions modulo constants.
- All relations between chord expansions vanish in the explicit five-term quotient, including the separately stated associativity relations.
- The resulting map satisfies both reciprocity triangles with intersection multiplicities.

For an arbitrary smooth plane curve the corresponding analytic integral is

```text
∫X r₂((l₁/l₀)∧(l₂/l₀)∧(l₃/l₀))
  = 2π Σᵢ₌₀³ (−1)^i D(r(lᵢ₀,…,omit lᵢᵢ,…,lᵢ₃,Dᵢ)).
```

Thus the negative sign of `h_E` agrees with `P₂=-∫r₂/(2π)`. The integral theorem and all analytic comparisons here take `k=ℂ`; the algebraic construction, including ellipticFiveTermDescent, has no characteristic restriction. When one normalizes two affine line functions to have sum one, the prescribed values at the opposite intersection are part of that normalization; the assertion does not hold for arbitrary equations of the same lines. (Goncharov [G04], Proposition 6.18, p.64, and Lemma 6.15, pp.62–63.) *Needs:* §§5.14–5.15, divisor intersection with multiplicity, elliptic addition and its chord divisor law, and plane-curve normalization geometry.

**Checks.**

- Rescaling any line equation multiplies a quotient on the left by a constant; the homotopy kills constant wedge factors. The right-hand projective points are unchanged, so its value must be unchanged too.
- Interchanging `L₁,L₂` negates the left wedge and the alternating right sum. Omitting the external minus sign contradicts the Steinberg normalization of §5.14.
- Over `k=F̄₂`, the cubic `Y²Z+YZ²=X³` is smooth; over `k=F̄₃`, `Y²Z=X³-XZ²` is smooth. Their gradients have no common zero on the respective cubics. Both retain the flex origin and degree-three line intersections with multiplicities; a short Weierstrass model requiring invertibility of six would wrongly exclude them.
- A tangent line has a divisor with a repeated point and retains that intersection multiplicity whenever the evaluation hypotheses hold. Treating `Dᵢ` as a set would change the value.
- Three concurrent lines can make two fixed cross-ratio points coincide. Such an arrangement is outside the formula's general-position domain and is not repaired by a formal division by zero.
- The chord function for `(x,y)` has divisor `(x)+(y)-(x+y)-(0)`. At `y=0` this divisor is zero, so its function is constant and the corresponding wedge contribution vanishes.
- Equations `l₀=x`, `l₁=y`, `l₂=z` do not satisfy `l₁/l₀+l₂/l₀=1` on a general plane curve. That simplification is used only after the separate normalization lemma's hypotheses are supplied.

### 5.17 Weight-three curve regulators and higher reciprocity

The one-current `ρ₂` of §5.14 descends through the five-term presentation in its `B₂(F)` argument. The proof uses both `ΣD(fᵢ)=0` and `Σ(1-fᵢ)∧fᵢ=0`; the second identity kills the logarithmic `α` correction. Pair it with `ρ₃=r₂` and the weight-three zero-form `L₃` to obtain the curve regulator chain map, with the residue currents and cochain signs declared in §§3.3 and 5.13. In particular,

```text
ρ₂({f}₂⊗f) = −d L₃(f).
```

Prove the formula directly from the Bernoulli differential, retaining the logarithmic correction even for a constant second argument. Export curveRho2_fiveTerm, curveRho2_residue, curveRho2_diagonal, curveWeightThreeRegulator and their real-conjugation rules. In Goncharov's general regulator notation the weight-three degree-two component is `-ρ₂`; changing that sign without changing the complex differential breaks the comparison. (Goncharov [G00], Proposition 4.1, (28), pp.17–20; Goncharov [D96], §3.6–3.7, pp.21–23.) *Needs:* PolylogarithmFunctions' `L₃` with PolylogarithmFunctions §4.5’s general single-valued differential, §§3.2–3.3, 5.13–5.14 and the declared current model.

For a smooth proper curve over a number field, construct the rational Chern map from `K₄` of its function field to `H²Γ(F,3)` by projecting to Adams weight three and using §4.7’s nextToMilnorMotivicComparison, with nextToMilnorComparison_residue for Quillen residues and a separate comparison with the Borel regulator. Restrict to the unramified fibre to obtain the corresponding curve regulator comparison. The weight-three Adams piece is isomorphic to that cohomology; no isomorphism from all of `K₄` is asserted. The precise Adams-weight projection, source convention and Deligne normalization are part of the comparison theorem. (Goncharov [D96], Theorem 2.1, pp.6–7, and §3.7, pp.22–23.) Export curveWeightThreeChern, curveWeightThreeChern_residue and curveWeightThreeChern_regulator. The higher Chern-character machinery is consumed from MotivicEtaleKTheory §§2.1–2.4 and 7.2–7.4; this layer owns the explicit polylogarithmic representative and its compatibility proof.

For `n≥4`, formulate the **generalized reciprocity conjecture** as a chain homotopy to zero of the total residue map from `Γ(k(X),n)` to `Γ(k,n-1)[-1]` for a smooth proper curve over an algebraically closed field, with finite-support residues and the chosen transfer maps. The weight-two statement reduces to signed Weil reciprocity. In weight three, §5.14 gives the functorial system for every curve over an algebraically closed characteristic-zero field, and §§5.15–5.16 give the separate explicit rational/elliptic formulas with their stated descent obligations, including positive characteristic. For every n≥4, §4.7 supplies a null-homotopy after canonical truncation to the last two terms over ℂ, and its degree-normalized functorial refinement over every algebraically closed characteristic-zero field. These theorems do not extend the homotopy to the discarded lower degrees or establish the full positive-characteristic functorial interface. Export a property HasPolylogReciprocityHomotopy, functorial consequences conditional on it, and no unconditional instance. Compatibility under curve correspondences requires coherent choices of the homotopies. (Goncharov [G04], §6.2, Conjecture 6.3, p.54.) *Needs:* the higher complexes of §4.2 and the explicit transfer obligation of §4.7.

**Checks.**

- With `g=f`, substituting the differential in §6.2 gives exactly `-dL₃(f)`. Removing the coefficient `1/3` leaves a nonzero radial discrepancy at `f=1/2`.
- With `g=c` constant of norm different from one, `ρ₂=-α(1-f,f)log|c|/3` can be nonzero. A rule declaring all constant-second-argument representatives zero is false before passing to a suitable cohomology class.
- A five-term sum has zero `D` part, and its exterior image gives the zero `α` part. Checking only the first sum does not establish descent of the full one-form.
- A ramified `K₄(F)` class belongs to the function-field comparison but not automatically to the unramified curve group. The localization residue square is what supplies the restriction.
- In weight two, `t` and `t-a` on `ℙ¹` pass the signed tame-product test of §5.13. In weight three, the `a=3` residue from §5.14 demands a nonzero homotopy value. The higher conjecture cannot be replaced by the zero homotopy.
- Over an arbitrary field, the algebraically closed residue-field simplification is unavailable; norms from closed points must appear. That more general formulation requires the transfer data before it is a theorem statement.

### 5.18 Generalized elliptic trilogarithms and their Fourier pairing

Construct ellipticTorusFourierAdapter for the oriented full lattice used below: identify its quotient with a two-dimensional real torus by an oriented period basis, transport probability Haar integration, prove the displayed character is lattice-periodic, and prove `∫χγ dμ=0` for `γ≠0` and `1` for `γ=0`. Transport the derivative and area-form identities through this coordinate map. The construction uses Mathlib’s additive circle, product Haar integration and finite exponential sums, together with DifferentialGeometry’s integration API; it adds the explicit complex-lattice normalization rather than a second abstract Fourier theory. Prove basis-change compatibility and the Fourier coefficient identity for logarithms by applying Poincaré–Lelong to these smooth character test functions. Common regularization of products is the separate target below. The torus adapter API requires the following facts.

- Every character is periodic under lattice translations and its probability-Haar integral is zero at nonzero frequency and one at frequency zero.
- Its holomorphic derivative has the displayed conjugate-frequency coefficient, and the transported area form has the stated orientation and covolume.
- Oriented lattice basis changes preserve the integration and character identities. (Goncharov [D96], §3.5, pp.20–22, for the lattice-character application; orthogonality is the product of the elementary integrals of nontrivial integer characters.)

**Checks.**

- For the square lattice the constant character integrates to one against probability Haar measure; unnormalized area would give A instead on a lattice of area A.
- The basis frequency one gives the integral `∫₀¹ exp(2πiy)dy=0`; treating all characters as constants would give one.
- Replacing a positive basis `(u,v)` by `(u,u+v)` preserves its area and the integral, whereas exchanging the basis vectors reverses the signed area form.

Write a complex elliptic curve as `ℂ/Λ`, with an ordered lattice basis `u,v`, positive area `A=Im(conj(u)v)`, and characters (the native definition `ellipticCharacter` uses `Λ : Submodule ℤ ℂ`, `[DiscreteTopology Λ]`, `[IsZLattice ℝ Λ]` and `A=ZLattice.covolume Λ`)

```text
χγ(z)=exp(2πi Im(z conj(γ))/A),             γ∈Λ.
```

Define the generalized elliptic trilogarithm kernel, with zero frequencies excluded in every denominator, by

```text
K₃(x,y,z) = Σ γ₁+γ₂+γ₃=0, γᵢ≠0
  χγ₁(x) χγ₂(y) χγ₃(z)
  (conj(γ₃)−conj(γ₂))/(|γ₁|² |γ₂|² |γ₃|²).
```

In Suggested.lean, `ellipticTrilogSummand` is the displayed coefficient indexed by `{g : Fin 3 → Λ // (∑ i, g i)=0 ∧ ∀ i, g i≠0}`; `ellipticTrilogKernel_summable` asserts summability of its norm for every `x y z : ℂ`. Define the kernel by its sum and extend it trilinearly to finite divisors. Prove absolute convergence, descent modulo the lattice, simultaneous translation invariance, antisymmetry in the last two entries and change of lattice basis. For convergence, dyadically sort the largest frequency scale `R` and the smallest `s≤R`. The summand is `O(R⁻³s⁻²)`, while the number of pairs in those annuli is `O(R²s²)`; the contribution for fixed `s` is `O(1/R)`. Summing the `O(log R)` possible `s` and then dyadic `R` converges. The finite small-frequency part is handled separately using the lattice's positive minimum norm. Export `ellipticTrilogKernel_summable`, ellipticTrilogKernel_periodic, ellipticTrilogKernel_translate, ellipticTrilogKernel_swap and ellipticTrilogKernel_scale. The normalization is explicit; the kernel is not identified with an unspecified rational multiple of a source's differently normalized series. (Goncharov [D96], Introduction, (1), pp.0–1, and §3.5, pp.20–21.) *Needs:* a discrete full lattice, its covolume and characters, ordinary summable series, and the lattice-specific torus adapter of this subsection.

For rational functions on a smooth proper complex curve and a holomorphic or antiholomorphic one-form `ω`, prove

```text
∫X ρ₂({f}₂⊗g)∧ω = −(4/3) ∫X log|g| α(1-f,f)∧ω.
```

Logarithmic singularities require the current Stokes argument; closedness of an arbitrary smooth de Rham form alone is not the stated hypothesis. On the elliptic curve, for a finite symbol sum satisfying `Σⱼ(1-fⱼ)∧fⱼ∧gⱼ=0`, put `Dⱼ=div gⱼ`, `Fⱼ=div fⱼ`, `Hⱼ=div(1-fⱼ)`. The Fourier normalization targets are

```text
Σⱼ ∫ log|gⱼ| α(1-fⱼ,fⱼ)∧dbar z = i A³/(4π²) Σⱼ K₃(Dⱼ,Fⱼ,Hⱼ),
Σⱼ ∫ ρ₂({fⱼ}₂⊗gⱼ)∧dbar z = −i A³/(3π²) Σⱼ K₃(Dⱼ,Fⱼ,Hⱼ).
```

The integral is the ordinary complex-valued integral, with `dz∧dbar z=-2iA μ` for probability Haar area `μ`. The Fourier coefficient of `log|f|` at a nonzero frequency `γ` is `-A·div(f)(χ₋γ)/(2π|γ|²)`, and `∂χγ=(π conj(γ)/A)χγ dz`. The displayed constants follow by multiplying these three coefficients and the derivative and area factors. Constant Fourier modes cancel in the cycle sum; they cannot be discarded for arbitrary independent functions. Prove the Fourier formulas first for finite Fourier polynomials, then justify the logarithmic limit by one common regularization compatible with products and the divisor cycle relation. A domination argument at shared divisor points and a comparison with the published normalization are explicit targets; citing a series identity with an unspecified rational constant does not discharge them. (Goncharov [D96], Theorems 3.3–3.4, pp.20–22.)

The Fourier-pairing API requires the following facts.

- Pairing the curve representative with a holomorphic or antiholomorphic one-form gives the stated factor minus four thirds.
- Every nonzero logarithm Fourier coefficient is the displayed divisor-character sum divided by the squared frequency norm.
- Finite Fourier polynomials satisfy the pairing with the exact displayed area and period constants.
- A common compatible regularization extends this equality to the stated logarithmic cycle sums, with a real/conjugate decomposition. This is an explicit regulator formula. A weight-three Beilinson special-value statement for elliptic curves is kept conjectural, with its cycle-rank and period-normalization hypotheses, and is not inferred from the kernel formula. *Needs:* §§5.13–5.17, compact torus Fourier integration and regularization, the cycle condition and the stated analytic limit obligations.

**Checks.**

- For the square lattice, `χ₁(0)=1`, `χ₁(i/4)=i` and `χᵢ(1/4)=-i`. Each has norm one; a character with the opposite symplectic sign interchanges the latter two values. Translating either quarter point by a lattice period preserves its value.
- At `(x,y,z)=(0,0,0)` and square-lattice triad `(1,i,-1-i)`, `ellipticTrilogSummand=(-1+2i)/2`, of norm `√5/2`. Swapping the last two frequencies negates it, while scaling lattice and points by two divides it by `32`; the full sum at these equal points is zero by paired cancellation, not because each summand vanishes.
- On any input `K₃(x,y,y)=0` by swapping the second and third frequencies. A kernel with numerator `conj(γ₃)+conj(γ₂)` fails that test.
- Simultaneously translating all three points multiplies every summand by `χγ₁+γ₂+γ₃(a)=1`. Translating only one point generally changes the value.
- Under lattice and point scaling by `λ≠0`, the kernel scales by `conj(λ)/|λ|⁶`; for `λ=2` the factor is `1/32`. The area changes by `|λ|²`, as required by the pairing formulas.
- The zero lattice frequency is excluded from all three indices. Keeping it would create a division by zero; using totalized inverses would silently change the function and the Fourier argument.
- For one finite Fourier triad `γ₁+γ₂+γ₃=0`, multiplication of the coefficients gives `iA³/(4π²)` times the kernel coefficient for the `log g·α` integral. The additional factor `-4/3` gives `-iA³/(3π²)` for `ρ₂`. The scalar is tested before any analytic limiting argument.
- Adding arbitrary constants to individual logarithms changes some intermediate pairings. The summed relation in `Λ³F×ℚ`, including constant factors, is what cancels their means; a condition only on the divisors is insufficient.
- A lattice of area zero is not a lattice basis and is outside the construction. With an honest lattice the finitely many frequencies below a fixed radius have a positive minimum norm, supplying the convergence estimate's initial scale.

### Examples

For `f=t`, `g=t-a` on `ℙ¹`, compute the three tame symbols before taking logarithms. This single calculation checks the rational residue convention, the signed integral Weil product and the current equation. Substituting `(1-t)∧t∧(t-a)` then gives `P₂=D(a)` and fixes the real prefactor of the Chow dilogarithm independently of any elliptic formula.

On a plane cubic, a four-line arrangement produces twelve divisor-point contributions before any endpoint simplifications justified by the actual arrangement. The alternating line formula and the integrated `r₂` formula give the same real number with the opposite external signs prescribed above; no cancellation count is assumed in the API.

For an elliptic Fourier calculation, first use a finite collection of nonzero triads. Its pairing identity is ordinary finite algebra, fixes the area and `i` factors and is unaffected by convergence questions. Extending that calculation to logarithms is the separate common-regularization target. The latter cannot be replaced by numerical agreement of a few truncated lattice sums.

### Dependencies

This layer uses PolylogarithmFunctions, Layers 2–4, DifferentialGeometry's form/integration interfaces, the lattice-specific Fourier adapter of §5.18, AlgebraicModuliForArithmeticGeometry §1.6 and Layer 9 for Chow parameters and resolutions, ComplexComparisonPartII §C−1.1 for analytification, MotivesAndAlgebraicCycles §§4.8a and 4.14 for relative cycles, algebraic curve and elliptic-curve geometry, and the early cycle/Chern/Deligne interfaces of MotivicEtaleKTheory §§1.1–1.4, 2.1–2.4, 6.1–6.3 and 7.1–7.4. Its analytic inputs include GeometricCurrents G1, ComplexKahlerGeometry K5a and ComplexComparisonPartII §C5.4; its additional targets are the BFT normalized-current dictionary, logarithmic polylogarithmic forms and explicit regulator comparisons. The multiplicity-bearing admissible incidence construction in §5.3 supplies the additional family input for the parameter-space forms of §5.11. Its chain comparison requires the raw/normalized dictionary and the universal Chern-character convention; its elliptic endpoint additionally requires the regularization and normalization obligations just stated.

## Layer 6: regulator diagnostics

This layer gives tests that distinguish regulator formulas from statements about unrelated embeddings or numerical approximations. Its p-adic portion displays the transpose of IntegralIwasawaTheory’s completed-unit logarithm matrix and tests its rank criterion.

### 6.1 Completed units and the p-adic regulator matrix

Let `F` be a number field, `p` a rational prime and `r=r₁+r₂-1`. Use IntegralIwasawaTheory §2.2’s rationalized completed localization and §4.1’s `leopoldtLogMap` on `O_Fˣ⊗ℚp`, with all `N=[F:ℚ]` embeddings into ℂp. Its kernel dimension is the Leopoldt defect; injectivity is equivalent to the completed global-unit image having rank `r`. The full pro-`p` completion can have finite `p`-primary torsion. An injective map from discrete units to a local field does not settle this assertion. (Sharifi [SHA], Proposition 1.5.6, Theorem 1.5.7 and Definition 1.5.9, pp.31–32.)

Display the transpose of the supplier’s `N×r` logarithm matrix, so units index rows and embeddings index columns: entry `(i,σ)` is `logₚ(σ(εᵢ))`, with `logₚ(p)=0`. Use `Matrix.transpose` to transport the supplied basis and permutation laws and `leopoldt_iff_logMatrix_fullRank`: rank `r` is equivalent to a nonzero `r×r` minor. Columns are embeddings, not primes above `p`. Import §4.1’s scalar-regulator criterion in its totally real/CM range and §4.4’s abelianLeopoldt. For totally real `F`, `r=N-1` and each displayed row sums to zero, so deleting any column gives maximal minors differing by alternating signs. For other signatures retain the full matrix criterion. At `p=2` the supplied logarithm uses a sufficiently deep principal-unit subgroup. These examples apply supplied statements. (Sharifi [SHA], Definition 1.5.10 and Remark 1.5.11, p.32.) *Needs:* IntegralIwasawaTheory §§2.2, 4.1–4.4 and ColemanIntegration L0.17–L0.18 for the local logarithm comparison.

**Checks.**

- For `ℚ` and an imaginary quadratic field, `r=0`: the matrix has no rows, has rank zero, and its empty maximal minor is `1`. Leopoldt is automatic, rather than failing because a zero-row determinant was set to zero.
- If one prime above `p` has local degree `N`, there are still `N` embedding columns. Replacing them by one column can force an incorrect rank bound.
- Changing a free-unit basis multiplies every full minor by the determinant of a unimodular basis matrix, namely `±1`; the nonvanishing criterion is unchanged. A torsion generator is excluded from that basis.
- In a totally real quadratic field the row is `(a,-a)`. Deleting the first or second column gives `-a` or `a`, pinning the alternating minor convention.
- For `F=ℚ(√2)` at `p=7`, choose the root `√2≡10 mod 49`. Then `ε=1+√2≡11 mod 49` and `ε⁶≡15 mod 49`, so `v₇(log ε⁶)=1`. Hence `log ε≠0`, giving a rank-one minor. The valuation follows from the logarithm's tail bound on `1+7ℤ₇`, not from a decimal approximation.
- At `p=2`, the unit `-1` is nontrivial 2-primary torsion in the pro-2 completion but its logarithm is zero. It disappears after tensoring with `ℚ₂`. Treating the full completion as torsion-free would fail this test.
- `logₚ(p)=0` although `p` is not a root of unity. The finite-order kernel statement used to certify a nonzero unit logarithm is restricted to local units and is not asserted on all nonzero local-field elements.

### 6.2 The exact differential of the single-valued trilogarithm

Use PolylogarithmFunctions §4.8’s exact weight-three differential: for `z∈ℂ\{0,1}` and a real tangent vector `v∈ℂ`,

```text
dL₃(z)[v] = −D(z) Im(v/z)
 + (log|z|/3)·(log|1-z| Re(v/z) − log|z| Re(v/(z-1))).
```

PolylogarithmFunctions §4.8 supplies this formula and `hasFDerivAt_singleValued_three_one`, its zero real derivative at one. Its §4.5 supplies the general differential, §5.2 identifies `L₂=D`, and §5.4 supplies the Bloch–Wigner one-form and Steinberg identity. The two displayed versions agree because `-v/(z-1)=v/(1-z)`, including on the classical cut. Prove compatibility with the regulator representatives constructed in §5.17, in particular the equality with `-ρ₂({z}₂⊗z)` and its locally integrable current extension on a curve. The logarithmic correction remains part of that representative. (Goncharov [G00], Proposition 4.1, (28), pp.17–20, and the generating function with `β₂=1/3`, p.3; Zagier [Z90], §7, (33)–(36) and Proposition 3, pp.413–415.) *Needs:* PolylogarithmFunctions §§4.5, 4.8, 5.2, 5.4 and §5.17’s curve regulator construction.

Use the formula to test regulator representatives, with exact identities before numerical approximations. At a real argument the angular term vanishes, but the logarithmic term usually does not. On the unit circle the logarithmic correction vanishes, but angular and radial tangent vectors still give different results. The local target is compatibility of the supplied differential with the curve regulator and its real-conjugation rule; the following values test that compatibility.

**Checks.**

- At `z=1/2`, the derivative is `(4/3)log²2·Re(v)`. It is nonzero for `v=1`, while a formula containing only the `D(z)` term would give zero. This tests the radial term in the regulator representative.
- At `z=2`, the derivative is `-(1/3)log²2·Re(v)`; real points beyond the cut are included. At `z=-1`, both terms vanish and the derivative is zero.
- For `|z|=1`, `v=z` gives zero radial derivative and `v=iz` gives `-D(z)` angular derivative. At `z=i`, the latter is negative because `D(i)>0`.
- Conjugating `z` and `v` leaves the real derivative of the odd-weight real-valued function unchanged. Inversion obeys the derivative of `L₃(z)=L₃(1/z)`, including the tangent factor `-v/z²`.
- As `z→1`, the explicit differential tends to zero; terms of order `|z-1|log²|z-1|` vanish. This is consistent with `L₃(1)=ζ(3)` and distinguishes the weight-three endpoint from the weight-two logarithmic singularity.

### Examples

The points `1/2,2,-1,i` give four distinct tests of one differential formula: a positive real radial derivative, a negative real radial derivative, a stationary real point and a nonzero angular derivative. They detect both omission of the logarithmic term and a change of sign in the `D` term.

For `ℚ(√2)` at `7`, the single nonzero row and the exact congruence modulo `49` certify the Leopoldt rank without constructing a new p-adic polylogarithm. The supplier logarithm and its tail bound are the only local analytic inputs. The zero-rank examples `ℚ` and imaginary quadratic fields exercise the empty-minor convention used also by the even-weight determinant in Layer 4.

### Dependencies

This layer uses PolylogarithmFunctions and Layers 2–3 and 5 for exact regulator formulas, IntegralIwasawaTheory §§2.2 and 4.1–4.4 for the completed-unit logarithm map, matrix criterion and abelian case, and the independent early local-logarithm prefix of ColemanIntegration. It requires no Chabauty theorem. The logarithm domains and exact valuation bounds are those of the named suppliers.

## Downstream consumers

Polylogarithms, Part II: the weight-four Zagier theorem (`ZagierConjecturePolylogarithms`) imports the explicit trilogarithmic presentation, the configuration complexes, the projected and triple ratios and Gale duality (§§3.1–3.6), the inductive complexes, the Zagier determinant and its three assertions, the explicit weight-four cycles and the obstruction criterion (§§4.1–4.6), and the current and Deligne models of Layer 5. It constructs the weight-four complex, the canonical period and the regulator input, and proves the weight-four theorem with its transfer to inductive cycles. The weight-two and weight-three regulators and explicit rational cycles of §§2.1–3.8 go to the special-value roadmaps built on them, among them EllipticRegulators and HabiroNahmSeries. Consumers needing every-cycle regulator-image containment must use the comparison and lifting hypotheses of §§3.8 and 4.6; existence alone does not supply those hypotheses. Higher weights receive explicitly conjectural interfaces.

Arakelov-comparison and higher-regulator consumers use the explicit higher Chow chain regulator, its cubical–simplicial homotopy and its universal Chern comparison, with the dictionary in §5.2 fixed. They do not import a freely renormalized current map. Elliptic special-value consumers receive the explicit current and Fourier pairing of §5.18, with its analytic-limit obligation kept separate from the conjectural elliptic Beilinson statement.

## References

The references specify the editions used by the locators. Page locators for preprints refer to the page numbers printed in that version; publication page ranges identify the work and do not replace that pagination.

- **[Z90]** Don Zagier, *Polylogarithms, Dedekind zeta functions and the algebraic K-theory of fields*, in *Arithmetic Algebraic Geometry*, Progress in Mathematics 89 (1991), pp.391–430; author manuscript dated 1990. [Author's public scan](https://people.mpim-bonn.mpg.de/zagier/files/scanned/PolylogsDedekindZetaAndKTheory/fulltext.pdf).
- **[Z07]** Don Zagier, *The dilogarithm function*, in *Frontiers in Number Theory, Physics, and Geometry II* (2007), pp.3–65. [Author's public text](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf).
- **[G94]** Alexander B. Goncharov, *Polylogarithms and motivic Galois groups*, in *Motives*, Proceedings of Symposia in Pure Mathematics 55, Part 2 (1994), pp.43–96. [Author's manuscript](https://sasha-goncharov.github.io/SeattleMotives.pdf). Locators use the manuscript's printed pages.
- **[G95]** Alexander B. Goncharov, *Geometry of configurations, polylogarithms, and motivic cohomology*, *Advances in Mathematics* 114 (1995), pp.197–318. [Author's public scan](https://sasha-goncharov.github.io/Advances1995.pdf).
- **[MIL]** John W. Milnor, *Computation of volume*, Chapter 7 of William P. Thurston, *The Geometry and Topology of Three-Manifolds*, 1980 notes, electronic edition 1.1 (2002), printed pp.157–170. [Public chapter](https://library.slmath.org/books/gt3m/PDF/7.pdf). Lemmas 7.1.2–7.1.4 and Theorem 7.2.1 use the same Lobachevsky normalization as §2.4.
- **[SV]** Andrei Suslin and Vladimir Voevodsky, *Relative cycles and Chow sheaves*, [author's public manuscript](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s2.pdf), printed pp.1–86. Locators use this manuscript: Definition 3.1.3, Theorem 3.3.1, Theorem 4.2.2, Theorem 4.4.11 and Corollary 4.4.13 supply the relative Chow-family construction in §5.3.
- **[G00]** Alexander B. Goncharov, *Explicit regulator maps on polylogarithmic motivic complexes*, [arXiv:math/0003086v1](https://arxiv.org/abs/math/0003086v1) (2000), printed pp.0–28. This version fixes the regulator differential formulas used here.
- **[G04]** Alexander B. Goncharov, *Polylogarithms, regulators, and Arakelov motivic complexes*, [arXiv:math/0207036v3](https://arxiv.org/abs/math/0207036v3) (2004), 70 pp. The published article is *Journal of the AMS* 18 (2005), pp.1–60; every locator here uses the preprint's pagination.
- **[GR]** Alexander B. Goncharov and Daniil Rudenko, *Motivic correlators, cluster varieties, and Zagier's conjecture on ζF(4)*, [arXiv:1803.08585v5](https://arxiv.org/abs/1803.08585v5) (2026), 111 pp. Version 5 is the source for the weight-four complex and comparisons.
- **[BFT]** José Ignacio Burgos Gil, Elisenda Feliu and Yuichiro Takeda, *On Goncharov's regulator and higher arithmetic Chow groups*, [arXiv:0909.5296v1](https://arxiv.org/abs/0909.5296v1) (2009), 22 pp. Locators use this version, including its normalized-current conventions.
- **[BOL]** Vasily Bolbachan, *Chow dilogarithm and strong Suslin reciprocity law*, [arXiv:2108.11862v4](https://arxiv.org/abs/2108.11862v4) (21 February 2023), 26 pp. Theorem 1.8, Corollary 1.11 and Remarks 1.3(ii), 1.10–1.12 use this version’s pagination and the sign adapter in §5.14.
- **[BNM]** Vasily Bolbachan, *On Goncharov’s conjecture in next to Milnor degree*, [arXiv:2404.06271v2](https://arxiv.org/abs/2404.06271v2) (2025), 48 printed pages plus front matter. Theorems 1.2–1.3, pp.3–4, Definition 6.2 and Theorem 6.3, pp.35–36, use v2 pagination.
- **[RSR]** Daniil Rudenko, *The Strong Suslin Reciprocity Law*, [arXiv:1511.00520v3](https://arxiv.org/abs/1511.00520v3) (2020), 36 pp.; published in *Compositio Mathematica* 157 (2021), pp.649–676. Locators here use v3, particularly Theorem 1.2 and Corollary 1.3, p.5, and Corollary 1.4, p.6.
- **[D96]** Alexander B. Goncharov, *Deninger's conjecture on L-functions of elliptic curves at s=3*, [arXiv:alg-geom/9512016v2](https://arxiv.org/abs/alg-geom/9512016v2) (1996), printed pp.0–36. The generalized elliptic series and regulator pairing are compared with the explicit normalization of §5.18.
- **[DEM]** Jean-Pierre Demailly, *Complex Analytic and Differential Geometry*, [author's public manuscript](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf). Chapters I and III provide test forms, currents, analytic cycle integration and the Poincaré–Lelong formula with explicit conventions.
- **[BUR]** José Ignacio Burgos Gil, *Arithmetic Chow rings and Deligne–Beilinson cohomology*, [author's public thesis](https://www.icmat.es/miembros/burgos/files/tesis.pdf). Chapter II supplies support classes, logarithmic forms and Green representatives.
- **[NEK]** Jan Nekovář, *Beilinson's conjectures*, [public seminar reference](https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf), especially §§7.3–7.5 for the symbol/Chern normalization.
- **[SCH]** Peter Schneider, *Introduction to the Beilinson conjectures*, [institutional seminar copy](https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroI.pdf), §4, p.28, for the rational Chern-character sign and multiplicativity.
- **[SHA]** Romyar Sharifi, *Iwasawa theory*, 189-page author notes, [author PDF](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §1.5, Proposition 1.5.6, Theorem 1.5.7 and Definitions 1.5.9–1.5.10, pp.31–32. The completed-unit and local-logarithm constructions are supplied by the named Iwasawa roadmaps; §6.1 uses the transposed all-embeddings matrix of IntegralIwasawaTheory §4.1.
- **[WEI]** Charles Weibel, *The K-book*, Chapter V, [author PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), §6, pp.39–43, for homotopy invariance, Dedekind localization and specialization behind the K3BlochGroups §4.21 import used in §4.2.
- **[WEI4]** Charles Weibel, [The K-book, Chapter IV: Definitions of higher K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), §1, pp.11–12. Chapter-local pagination.

- **[BOR77]** Armand Borel, *Cohomologie de SLₙ et valeurs de fonctions zêta aux points entiers*, Annali della Scuola Normale Superiore di Pisa, Classe di Scienze, series 4, 4 (1977), pp.613–636. [Numdam archive](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0/), Remark 6.3, p.632.
