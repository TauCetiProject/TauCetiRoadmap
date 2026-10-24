# Roadmap: analytic number theory, Part II

**Summary.** Lerch and Barnes functions, quadratic double Dirichlet and binary-cubic zeta functions, the Bost–Connes phase transition and compact scalar spectral determinants.

## Scope and ownership

This part owns Layers 4–6 and consumes [AnalyticNumberTheoryPartI, Layers 0–3](../AnalyticNumberTheoryPartI/README.md#how-to-read-the-build). Measured operator foundations come from [VonNeumannAlgebras V0–V4, V8 and V10–V11](#from-vonneumannalgebras). The selected special-function, prehomogeneous-series and operator constructions are local targets; generic carriers and supplier theory are imported. A spectral determinant, a Beurling zeta function, the quadratic reciprocity matrix and the binary-cubic Fourier matrix have separate definitions and normalizations.

### Prerequisites and boundaries

ProfiniteArithmetic Layer 0 uses `Additive TauCeti.zHat`: consume `TauCeti.zHat.toZMod`, `ringEquivPiPadicInt` and its two continuity theorems, `isUnit_iff_component`, `unitsEquivPiPadicInt`, `unitsLift`, `unitsLift_unique` and `continuous_unitsLift` in `TauCeti.Topology.Algebra.Group.Profinite.ZHat.{ZMod,Decomposition,Units}`. RestrictedProducts owns the restricted-product carrier and topology; GlobalNumberFields owns the number-field finite adeles. AdelicAlgebraicGroups owns additive local Haar normalization. The Bost–Connes scaling measure is a particular normalized measure on these carriers.

The representation of a positive functional by a finite inner-regular measure is `LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq`, in `TauCeti.Analysis.CStarAlgebra.CharacterSpaceMeasure`. It assumes a unital commutative complex `C⋆-algebra` and positivity on `star a * a`; normalization of the functional gives total mass one. The work here adds uniqueness, the Bost–Connes restriction and expectation argument, and the corresponding weak topology. The positive-definite-kernel `translation` construction already exists as `TauCeti.IsPositiveDefiniteSub.gnsSpace`, `gnsVector` and `gnsRepresentation` in `TauCeti.Analysis.PositiveDefinite.Function.GNS`; use it for the additive-group specialization. The algebraic positive-functional construction below adds bounded left multiplication for the Bost–Connes generators and its universal `C⋆-norm`. The general matrix and Hilbert-space spectral theories of OperatorTheory are prerequisites. Full and reduced crossed products, the reduced conditional expectation, the amenable full/reduced comparison and the KMS theory of a `C⋆-dynamical` system are OperatorAlgebraDynamics `D1`, `D2` and `D7`; normal representations, nonsingular crossed products, modular theory and ratio-set classification come from VonNeumannAlgebras V0–V4, V8 and V10–V11, with the exact contracts below. The universal `C⋆-completion` of the Bost–Connes core, its semigroup `dilation` corner and the Bost–Connes instances of these theorems are constructed here.

Layer 5 owns the binary-cubic arithmetic needed by its analytic series: the determinant-inverse twist of row substitution, locally free cubic algebra correspondence, discriminant and trace-dual conditions, finite weighted coefficients and the uniform degree-at-most-three field count. Generic substitution on homogeneous polynomials is already `MvPolynomial.linearSubst` and `linearSubstRep` in `TauCeti.RingTheory.MvPolynomial.LinearSubst`; transpose its column convention for row variables, then add the determinant twist. It also owns the quadratic large sieve and its fourth-moment consequence.

## Conventions

All number fields have characteristic zero. A finite Galois representation is finite-dimensional over `ℂ` and uses **arithmetic** Frobenius. At a ramified prime its local polynomial acts on inertia invariants. Positive real powers mean `exp(s log x)` with the real logarithm and require `x>0`. A complex parameter power uses a specified logarithm branch or a specified covering-space lift. Pole values of totalized Lean functions never stand for meromorphic germs.

Barnes G is fixed by its canonical product, not by recurrence and `G(1)=1` alone. Its Gamma recurrence is pointwise only away from Gamma poles; at zero, Mathlib's totalized Gamma gives `Γ(0)G(0)=0`, whereas `G(1)=1`.

Bost–Connes coefficient fields are `ℚ-algebras` when rational averaging is used, and positivity, `C⋆-norms`, states and KMS conditions use `ℂ`. A state-space homeomorphism uses weak evaluation topology. For a nonsingular action the ratio-set derivative is the pushforward Radon–Nikodym derivative at the target point, witnessed on `A ∩ gA`.

A compact surface below is connected, oriented, torsion-free, without boundary, and hyperbolic of curvature `−1`. Its scalar Laplacian is nonnegative, with one zero mode. Its area is `4π(g−1)` for genus `g≥2`; positive eigenvalues carry multiplicity. Every determinant convention distinguishes the unprimed shifted determinant from the determinant with the zero mode removed.

Use AnalyticNumberTheoryPartI’s Conventions for its real/complex power, character/conductor, Gamma and meromorphic-germ conventions. Arithmetic cutoffs remain inclusive unless stated otherwise.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Mathlib `Cubic.discr` in `Mathlib.Algebra.CubicDiscriminant` is the coefficient invariant `b²c²−4ac³−4b³d−27a²d²+18abcd` on `Cubic A`, for every ring `A`, including tuples with zero leading coefficient. Use this carrier and invariant for binary forms. Tau Ceti `Cubic.toPoly_discr` in `TauCeti.RingTheory.Polynomial.Resultant.Discriminant` identifies it with `Polynomial.discr` over a commutative ring when the leading coefficient is nonzero; that hypothesis is essential because dehomogenization can lower degree. The new target in §5.4 is covariance for the determinant-twisted binary action, not another discriminant definition.

Mathlib `HurwitzZeta.hasSum_hurwitzZeta_of_one_lt_re`, `hasSum_expZeta_of_one_lt_re`, `differentiableAt_hurwitzZeta`, `differentiableAt_hurwitzZeta_sub_one_div` and `hurwitzZeta_residue_one` supply the circle-parameter series, continuation and residue. `DirichletCharacter.LFunction_eq_LSeries`, `LFunction_changeLevel` and `IsPrimitive.completedLFunction_one_sub` supply the finite-character series, deleted factors and primitive functional equation. `Complex.integral_cpow_mul_exp_neg_mul_Ioi` supplies Gamma–Laplace for a positive real scale; §4.5c adds a complex scale with positive real part.

Mathlib `HeckeCoset`, `HeckeCosetModule` and `IsHeckeTriple.of_diagonal` supply the coset carriers. Tau Ceti `HeckeCoset.degree_eq_relIndex`, `HeckeCosetModule.single`, `single_mul_single` and `mul_single_single`, in `TauCeti.NumberTheory.HeckeRing.Basic` and `.Multiplication`, supply relative-index degree, basis vectors and their multiplication; `.Associativity` supplies `HeckeCosetModule.instRingHeckeRing`. The Bost–Connes targets specialize these APIs to the rational affine pair. The profinite, universal-cover, positive-functional and linear-substitution suppliers are specified in Prerequisites and boundaries.

### From AnalyticNumberTheoryPartI

Consume [AnalyticNumberTheoryPartI, Exact supplier contracts](../AnalyticNumberTheoryPartI/README.md#exact-supplier-contracts) for arithmetic Dirichlet series, Hecke and Dedekind functions, GlobalNumberFields, class fields and contours. Its Layer 0 supplies quantitative prime estimates, §0.23a the normalized slit-plane Gamma logarithm and Stieltjes remainder with its derivatives, §2.5 Dedekind continuation, §2.15 bounded-degree residue estimates, §3.1 divisor subpower bounds, §3.23 the second moment under its `BBRFiniteInput` hypothesis, and §3.24 the unconditional fourth moment. These are specified analytic interfaces with their stated uniformity, not arbitrary function-valued data.

### From AutomorphicLFunctionsAndLocalFactors

Consume [AutomorphicLFunctionsAndLocalFactors AL.0–AL.1](../AutomorphicLFunctionsAndLocalFactors/README.md#layer-al0-local-and-adelic-fourier-analysis), with the measure and continuation contracts in AnalyticNumberTheoryPartI, Exact supplier contracts. The additional unbounded-coordinate estimate needed for cubic convergence is [§5.3a][R130]. Consume [Hecke continuation and functional equation](../AutomorphicLFunctionsAndLocalFactors/README.md#hecke-l-functional-equation) and [The global standard L-function](../AutomorphicLFunctionsAndLocalFactors/README.md#global-godement-jacquet) at `n=1` for the arbitrary-test-function Hecke families and their residues. Finite-order and algebraic normalizations use ArithmeticGaloisRepresentations §2.7’s [Hecke zeta-integral comparison](../ArithmeticGaloisRepresentations/README.md#hecke-zeta-integral-comparison), supplied there from LFunctions.

Consume the same AL.0 vector-space comparison for the Fourier transform and Poisson formula on `F⁴`, including completed archimedean tensors and continuity on finite-place levels. Change the coordinate pairing to the binary-cubic alternating pairing by its explicit invertible matrix and the self-dual measure comparison below. Singular-orbit distributions and unbounded positive-coordinate estimates belong to Layer 5; compact-uniform Poisson alone does not supply them.

### Scalar geometric input

The scalar compact-surface application uses the [§6.12a](#s6-12a) in Layer 6. AS.4's automorphic Hilbert sums and AS.6's compactly supported smooth trace tests are not used as exports of a scalar geometric spectrum or a Gaussian trace theorem. The Gaussian is handled directly by its radial kernel and absolutely convergent orbital integrals.

### Compact scalar specialization of ComplexKahlerGeometry

<a id="compact-scalar-realization"></a>

**Closed-manifold scalar comparison (`compactScalarRealization`).** For a smooth closed connected Riemannian manifold of positive dimension, specialize [ComplexKahlerGeometry K5a][R129] to the trivial complex line bundle with its standard Hermitian metric and principal coefficient 1. Identify its geometric section `L²` with complex `L²` of the Riemannian measure, its `H¹` energy form with `∫|grad f|²`, and its `H²` operator with `A=−div grad`, the negative of DifferentialGeometry Layer 12's `laplaceBeltrami`. These identifications carry the supplied closed-form/Friedrichs realization, self-adjointness, compact resolvent and complete smooth eigenbasis to the scalar operator. Its finite multiplicities, finite spectral cutoffs and eigenvalues tending to infinity are consequences of that supplied realization. Prove here that the scalar kernel consists precisely of constants, using Green's identity, connectedness and full support. Apply this comparison before §6.12b.

K5a supplies coordinate-independent bundle Sobolev spaces, Rellich compactness, global elliptic estimates, the `H²` maximal/adjoint domain and smooth regularity on compact boundaryless real Riemannian manifolds. Use its geometric `L²` pairing and Riemannian measure; its atlas Sobolev norm is equivalent to the geometric `L²` norm at order zero and is not asserted to be isometric to it. The local work identifies the trivial-bundle form, measure, domain and differential sign with these supplied objects. The hyperbolic-chart comparison, explicit heat kernel and Weyl constant remain Layer 6 targets.

**Checks.** On the unit circle, the eigenvalues are `n²`, with multiplicity two for `n>0` and one for zero. A disjoint union has one zero mode per component, so the one-dimensional kernel conclusion requires connectedness. On a manifold with boundary, unrestricted `H²` is not the Friedrichs domain; the closed-manifold hypothesis is essential. The hyperbolic-chart test `A(x²)=−2y²` distinguishes the supplied nonnegative operator from div grad.

See [Helffer][R126], §7.6, p.56 (Friedrichs realization, `H²` domain and compact resolvent), and §7.3, p.52 (compact-resolvent spectrum). *Needs:* ComplexKahlerGeometry K5a, real/complex bundle analysis and the scalar negative-div-grad specialization; DifferentialGeometry Layer 12 for the scalar metric, measure and Green identity.

### Further input from AutomorphicSpectralTheory

Consume [AutomorphicSpectralTheory, §§1.2–1.5][R34]: general connected reductive groups over number fields, convergent chamber, Weyl intertwiners and constant terms with compatible measures. Its classical level-one specialization is not the general-number-field Fourier bound used here. The [§5.21g](#s5-21g) supplies that extra calculation, from the imported general Eisenstein construction, AL.0 Fourier and the supplied rank-one Hecke families. It fixes `t(g)=|t₁/t₂|_A^(1/2)`, so the constant term is `t(g)^z+t(g)^(2−z)Z_F(z−1)/Z_F(z)`. No extension of AS is presumed.

### From UniversalCovers

UniversalCovers is a completed Tau Ceti roadmap; the following covering-space APIs are supplied by the pinned library. Consume [UniversalCovers stage 0 port the foundations into tauceti][R36]: the based universal cover `TauCeti.UniversalCover x₀` (endpoint and path-homotopy class, in `TauCeti.AlgebraicTopology.UniversalCover.Basic`), its covering projection `TauCeti.UniversalCover.isCoveringMap` (locally path-connected, semilocally simply connected base), path and homotopy lifting, and the deck identification `TauCeti.UniversalCover.deckFundamentalGroupEquiv` with `(π₁(X,x₀))ᵐᵒᵖ`, applied to the path-connected punctured complex-product domains M# and N#. The library's fundamental-group action prepends the inverse loop; the Lerch monodromy formulas below are stated in that convention. Layer 4 owns the analytic chart pullback and Lerch continuation, not a second universal-cover construction.

Consume [UniversalCovers stage 2 lifting criterion and galois correspondence][R37]: the subgroup quotient `TauCeti.UniversalCover.SubgroupQuotient` with its covering map `TauCeti.UniversalCover.isCoveringMap_subgroupQuotientProj`, the regularity criterion `IsCoveringMap.isRegular_iff_normal_range`, and the deck identification `TauCeti.UniversalCover.deckSubgroupQuotientProjEquivOfNormal`. For the normal subgroup `π₁(N#)″` these give the regular quotient cover with deck group `π₁(N#)/π₁(N#)″` and based descent. The separate analytic invariance theorem is proved in Layer 4.

### From AdelicAlgebraicGroups

Consume AdelicAlgebraicGroups AA.2 (§2.2) for GL₂ quotient Haar measures, parabolic modulus and inversion between quotient sides, and AA.3 (§3.4) for the Siegel covering. The Wright Lemmas 3.1–3.2 integration majorant, with height `t=|t₁/t₂|_A^(1/2)` and weight `t^(−2)`, is the local target §5.3b, including its determinant-one specialization. Finite-adèle carriers come from GlobalNumberFields Layer 4 and restricted-product topology from RestrictedProducts.

Consume AdelicAlgebraicGroups AA.0 for normalized additive Haar on ℚ_p with `mass(ℤ_p)=1` and restricted-product compatibility. Layer 6 multiplies this by `((1−p^(−β))/(1−p^(−1)))|x|_p^(β−1)`, forms the probability product on integral adeles and extends by rational dilation (§§6.2–6.2a).


### From OperatorAlgebraDynamics

OperatorAlgebraDynamics is a Tau Ceti roadmap; D1, D2 and D7 supply its generic crossed-product and equilibrium theory. Consume [OperatorAlgebraDynamics D1][R38]: the full crossed product of a `C⋆-dynamical` system, the integrated form of a covariant pair and the universal property for nondegenerate covariant representations. Consume [D2][R39]: the regular covariant representation and reduced crossed product; for discrete G the dense finite-sum algebra and the faithful conditional expectation `E(Σa_g u_g)=a_e`; and the theorem that an amenable group gives `A⋊G≅A⋊_rG` for every action. Consume [D7][R40]: entire analytic elements, `β-KMS` states defined by bounded continuous functions on the closed strip, the equivalent analytic identity `ω(aτ_(iβ)(b))=ω(ba)` and its sufficiency on a norm-dense invariant algebra of entire elements, closedness of the KMS set under weak-* limits, ground states, and the theorem that weak-* limits of `β-KMS` states as `β→∞` are ground states on a unital algebra. Here `G=Q_+×` is discrete abelian. Layer 6 verifies the hypotheses of these theorems for the Bost–Connes system; it does not reconstruct these `C⋆` crossed products, the reduced expectation, the amenable norm comparison or the dense-core KMS criterion.

### Local amenability input

<a id="bc-positive-rationals-amenable"></a>

**Positive rational amenability (`bcPositiveRationals_amenable`).** For every finite `S⊂Q_+×` and `ε>0`, construct a finite nonempty `F⊂Q_+×` with `|qF△F|/|F|<ε` for every `q∈S`. Unique prime factorization identifies this group with the finite-support integer exponent vectors on the primes. Choose finitely many prime coordinates containing every numerator and denominator in S and use exponent boxes `[-N,N]^k`. For a translation with exponents `a_j`, the relative symmetric difference is at most `2Σ_j|a_j|/(2N+1)`. Choosing N for the maximum over S proves the simultaneous finite-test statement. Enumerating primes and increasing the boxes gives a Følner net for the whole group.

The normalized indicators give Reiter `ℓ¹` densities; their integration functionals have a weak-* cluster point which is a positive normalized invariant mean. Identify this input with OperatorAlgebraDynamics D2's amenability/Reiter interface before §6.33f; D2 owns the full/reduced norm comparison.

**Checks.** For `S={2}`, powers `2^a`, `−N≤a≤N`, give symmetric difference ratio `2/(2N+1)`. The test set `{2/3,5/7}` requires all four prime coordinates, including negative exponents. For `S={1}` a singleton suffices; every constructed box is nonempty, including the box with no prime coordinates.

See [Juschenko][R128], Theorem 4.2.3 and proof, pp.32–34, for the Følner/Reiter/invariant-mean comparison. *Needs:* unique prime factorization of positive rationals; weak-* compactness of the dual unit ball; OperatorAlgebraDynamics D2's Reiter interface.

### From VonNeumannAlgebras

<a id="local-measured-operator-foundations"></a>

Consume [VonNeumannAlgebras][R131] on its native carriers: Mathlib's `VonNeumannAlgebra H` for concrete algebras on complete complex Hilbert spaces, `WStarAlgebra` for abstract algebras, and the supplied `VonNeumannAlgebra.CrossedProduct` for analytic crossed products. Corners act on the complete range of their projection, with that projection as identity. The BC applications in §§6.5 and 6.41–6.42 use these algebras, expectations, weights, cores and type predicates.

<a id="normal-gns-comparison"></a>

Consume V0's completed `PositiveLinearMap.GNS` and `gnsStarAlgHom` comparison, cyclic-vector recovery and unitary uniqueness; V1's bicommutant, closure and Kaplansky density results; and V4's predual, normality, faithful-normal GNS and corner comparisons. Consume V10.ModularTheory and V10.KMS for the state Tomita convention `σ_t=Δ^(it)(·)Δ^(−it)` and its strip characterization. V11 supplies faithful normal semifinite weights, their GNS left ideals, modular groups and CentralizerCornerRestriction. The local expectation-state/GNS comparison is §6.41, on these carriers. See [Hiai][R127], §§1.1–1.4, §2 Theorems 2.2 and 2.14, §3.1 Proposition 3.8, and §7.1 for the corresponding conventions and comparisons.

<a id="nonsingular-crossed-product"></a>

Consume V8's countable nonsingular actions on standard sigma-finite spaces, Radon–Nikodym implementations, regular crossed product, Fourier coefficients, faithful normal expectation and essentially-free center theorem. For `α_g(f)(x)=f(g⁻¹x)`, its regular generators on `ℓ²(G,L²(X,μ))` are `π(f)ξ(h,x)=f(hx)ξ(h,x)` and `u_gξ(h,x)=ξ(g⁻¹h,x)`. The local coordinate unitary in §6.41 compares this representation with multiplication by f and diagonal nonsingular translations. The derivative is `ρ_g=d(g_*μ)/dμ` at the target point, with returns in `A∩gA`. See [Hiai][R127], Lemma 10.1, Definition 10.2, Example 10.3 and Theorems 10.12–10.13.

<a id="measured-ratio-classification"></a>

Consume V11's measured orbit-relation cocycle, ratio-set/modular-spectrum comparison, continuous core, associated flow and recovery of factor type from that flow. In the separable-predual factor regime, the full ratio set `[0,∞)` gives type `III₁`, equivalently a one-point flow. Use V11's modular-invariant corner restriction and the supplied corner/type comparisons; §6.41 proves the integral projection has full central support also in the core before identifying the central dual flows. Standardness and sigma-finiteness, together with countability of the group, give a separable regular Hilbert space in this application and hence separable predual. See [Neshveyev][R117], §1, pp.1–2, and [Hiai][R127], Theorem 10.15 and Remark 10.18, pp.98–101.

V10.AffineHecke supplies the `β=1` finite-adele Haar corner and its Hecke moment/GNS comparison. The beta-family adapter in §6.41 identifies that instance using its slope-to-matrix map and coset-inversion convention; the full-ratio arithmetic witnesses and the type `III₁` proof for every `0<β≤1` remain targets here.

### From FuchsianOrbifolds

Consume [FuchsianOrbifolds Layers 0–2 and 4](../FuchsianOrbifolds/README.md#layer-2-hyperbolic-polygons-and-cofinite-groups): the effective projective action, quotient Riemann-surface charts, finite-sided fundamental polygon and orbifold area formula. For any torsion-free cocompact discrete subgroup `Γ` of `PSL₂(ℝ)`, these give the closed connected oriented quotient and area `4π(g−1)`. The descended curvature `−1` metric and scalar sign/measure comparisons are §6.12a; §6.12c supplies the primitive-conjugacy/length and cyclic-centralizer dictionary. No arithmeticity hypothesis is imposed.

## How to read the build

Named prerequisite links give the order within each layer; every prerequisite is in this part, AnalyticNumberTheoryPartI, or a named supplier. A source and locator apply to the numbered topic and its subsidiary ingredients unless a nearer citation is supplied. Constants are uniform only in the stated parameters. A source's external proof input remains a target requiring proof, never an assumption that the result is formalized.

### Prerequisite abbreviations

Each abbreviation expands to the exact prerequisite list below; these are shared lists, not additional mathematical targets.

- **B1:** [§6.18][R486]; [§6.16][R479]; [§6.8][R465]; `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; `HeckeCosetModule.single_mul_single`; `AddCircle`; `PNat`; `HeckeCosetModule.single`; [§6.14][R466]; `lp`; [GlobalNumberFields 4][R22]; [§6.21][R511]; [§6.18a][R480]; [§6.18b][R481]; [§6.21a][R487]; [§6.21b][R488]; [§6.21c][R489]; [§6.21d][R490]; [§6.21e][R491]; [§6.21f][R492]; [§6.21g][R493]; [§6.21h][R494]; [§6.21i][R495]; [§6.21j][R496]; [§6.21k][R497]; [§6.21l][R498]; [§6.21m][R499]; [§6.28a][R513]; [§6.33a][R501]; [§6.24a][R504]; [§6.24b][R505]; [§6.24c][R506]; [§6.24d][R507]; [§6.24e][R508]; [§6.33b][R521]; [§6.33c][R522]; [§6.33d][R523]; [§6.33e][R524].
- **B2:** [§5.11][R365]; [§5.4][R348]; AutomorphicLFunctionsAndLocalFactors AL.0; AdelicAlgebraicGroups AA.2; AutomorphicSpectralTheory AS.2; [§5.10a][R350]; [§5.21a][R367]; [§5.21b][R368]; [§5.21c][R369]; [§5.21d][R370]; [§5.21e][R371]; [§5.21f][R372]; [§5.21h][R373]; [§5.21i][R374]; [§5.21j][R375]; [§5.21k][R376]; [§5.21l][R377]; [§5.21m][R378]; [§5.21n][R379]; [§5.21o][R380]; [§5.21p][R381]; [§5.21q][R382]; [§5.21r][R383].
- **B3:** [§6.16][R479]; [§6.8][R465]; `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; [§6.18a][R480]; [§6.18b][R481].
- **B4:** [§6.11](#s6-11); [§6.12c][R454]; [§6.4][R453]; [§6.12b][R445]; [§4.3](#s4-3); [§6.13](#s6-13); [§6.17c][R473]; [§6.17g][R477]; [§6.17h][R478].
- **B5:** [§4.1][R316]; [UniversalCovers stage 0 port the foundations into tauceti][R36]; `TauCeti.UniversalCover`; `TauCeti.UniversalCover.basepointLift`; `TauCeti.UniversalCover.inv_smul_mk`; [§4.4a][R317]; [§4.5a](#s4-5a); [§4.5b][R321]; [§4.5e](#s4-5e); [§4.5f](#s4-5f).
- **B6:** [AnalyticNumberTheoryPartI §2.5][R190]; [§5.10b][R346]; [§5.13a][R351]; [§5.13b][R352]; [§5.13c][R353]; [§5.13d][R354]; [§5.13e][R355]; [§5.13f][R356].
- **B7:** `B1`; [§6.24][R515]; [§6.33g][R525]; [§6.33h][R526]; [§6.33i][R527].
- **B8:** `B3`; [§6.14][R466]; `lp`; [§6.18][R486]; [§6.24a][R504]; [§6.24b][R505]; [§6.24c][R506]; [§6.24d][R507]; [§6.24e][R508].
- **B9:** [§5.4][R348]; AutomorphicLFunctionsAndLocalFactors AL.0; AdelicAlgebraicGroups AA.2.
- **B10:** [§6.28][R518]; [§6.43](#s6-43); [§6.35](#s6-35); `IsCyclotomicExtension`; [§6.36](#s6-36); [§6.37](#s6-37); [GlobalNumberFields 10][R20]; `MulAut`; [§6.46a][R575]; [§6.47a](#s6-47a).
- **B11:** [§6.4][R453]; [§6.12b][R445]; `mellin`; `Complex.Gamma`; [§6.12f](#s6-12f); [§6.12g](#s6-12g); [§6.12h](#s6-12h); [§6.12i](#s6-12i); [§6.12j](#s6-12j).
- **B12:** [§6.34][R555]; [§6.2][R440]; [§6.39][R570]; [§6.10][R528]; [§6.44][R573]; [§6.48a](#s6-48a); [§6.48b](#s6-48b); [§6.48c](#s6-48c); [§6.48d](#s6-48d).
- **B13:** [§6.30][R520]; [§6.22][R512]; [§6.34a][R530]; [§6.34c][R532]; [§6.34d][R533].

<a id="layer-4"></a>

## Layer 4: Lerch continuation, complex Hurwitz zeta and Barnes G

General-k moment normalization is conjectural. Only positivity/convergence of its arithmetic and Barnes constants and the `k=1,2,3` checks are proved (§§4.13–4.14); the second-moment comparison uses AnalyticNumberTheoryPartI §3.23 under `BBRFiniteInput`, and the fourth-moment comparison uses its unconditional §3.24.

Start with absolutely convergent Lerch and complex-Hurwitz series, then specify analytic continuation on actual covering spaces with explicit loops and logarithm conventions. The two Lerch functional equations and the boundary limits use the same continuation. The Barnes product gives the normalization needed for moments and spectral determinants.

<a id="s4-1"></a>

### 4.1 Lerch transcendent

For `|z|<1`, `Re c>0` and `s∈C`, `Φ(z,s,c)=Σ_{n≥0}z^n exp(−s Log(n+c))`, using the principal logarithm. This series defines a jointly holomorphic function on that domain. At `z=1` the separate Hurwitz series requires `Re s>1`. The defining series is `lerchSeries`.

On `|z|<1`, `Re c>0` use `exp(−sLog(n+c))`; the half-plane excludes zero/cuts. Keep `n=0` even at `z=0 (z⁰=1)`. The compact-series lemma proves absolute convergence and joint holomorphy for arbitrary `s`. Reindex for the c shift and periodic/polylog prefactor. For `Im a>0` compare the a-series directly. Outside this domain the totalized sum specifies no continuation.

- `lerch_transcendent.series`: `Φ` is the displayed absolutely convergent series on `|z|<1`, `Re c>0`.
- `lerch_transcendent.zero`: `Φ(0,s,c)=exp(−s Log c)`.
- `lerch_transcendent.shift`: `Φ(z,s,c)=c^−s+zΦ(z,s,c+1)`.
- `lerch_transcendent.exp_change`: For `Im a>0`, `LerchZeta(s,a,c)=Φ(exp(2πia),s,c)`.
- `lerch_transcendent.polylog`: The periodic/polylog series is `zΦ(z,s,1)`, not `Φ(z,s,1)`.
- `lerch_transcendent.holomorphic`: The `map(s,z,c)↦Φ(z,s,c)` is jointly holomorphic on `|z|<1`, `Re c>0`, `s∈C`.
- `lerch_transcendent.deriv_s`: On the initial domain, `∂_sΦ(z,s,c)=−Σ_{n≥0}z^n Log(n+c)exp(−sLog(n+c))`; the differentiated series is absolutely and locally uniformly convergent.

**Checks.**

- `Φ(0,2,1)=1`.
- `Φ(z,0,c)=1/(1−z)` on `|z|<1`, independently of `c`.
- `Φ(z,−1,c)=c/(1−z)+z/(1−z)²`.
- For `z=1/2` and `s=0`, `Φ=2` while `zΦ=1`; omitting z fails the polylog comparison.

See [94][R94], Introduction (1.1); §3.3 pp.24–25; Theorem5.1 proof p.36.

*Needs:* `Complex.cpow_def_of_ne_zero`.

<a id="s4-2"></a>

### 4.2 Complex-parameter Hurwitz series

For `Re c>0` and `Re s>1`, `ζ_H(s,c)=Σ_{n≥0}exp(−sLog(n+c))`, with the principal logarithm. It is the `z=1` series, not an unqualified value of the general Lerch continuation on its omitted `z=1` stratum. The defining series is `complexHurwitzSeries`.

On `Re c>0`, `Re s>1` the compact-uniform p-series majorant proves convergence. Reindex for the c shift; real `0<c≤1` gives circle Hurwitz, with its endpoint representative.

- `complex_hurwitz_series.series`: The displayed series converges absolutely on `Re s>1`, `Re c>0`.
- `complex_hurwitz_series.shift`: `ζ_H(s,c+1)=ζ_H(s,c)−c^−s`.
- `complex_hurwitz_series.real_circle`: For real `0<c≤1` it agrees with the circle Hurwitz series using the positive representative convention.
- `complex_hurwitz_series.c_one`: `ζ_H(s,1)=riemannZeta(s)` on `Re s>1`.

**Checks.**

- `ζ_H(2,1)=π²/6`.
- `ζ_H(s,1/2)=(2^s−1)ζ(s)` on `Re s>1`, by the odd-integer partition.
- `c=0` is outside the domain and no `0^−s` term is assigned a junk value.
- `ζ_H(2,1+i)−ζ_H(2,2+i)=−i/2`; this tests the actual complex c parameter and inclusion of the `n=0` term.

See [95][R95], §1 (1.3), p.2, gives the real specialization; the complex-c absolutely convergent series and Taylor-subtracted integral are constructed here, with origin subtraction before continuation.

*Needs:* `Complex.cpow_def_of_ne_zero`.

<a id="s4-3"></a>

### 4.3 Barnes G-function

The Barnes G-function is the entire function `G : ℂ → ℂ` given by the Weierstrass product `G(z + 1) = (2π)^{z/2} exp(−z(z + 1)/2 − γ z²/2) Π_{k≥1} (1 + z/k)^k exp(−z + z²/(2k))`, with `γ` Euler’s constant. It satisfies `G(z + 1) = Γ(z) G(z)` when z is not a nonpositive integer, and `G(1) = 1`; the recurrence is an identity of meromorphic functions before pointwise totalization. Its zeros are at `z = −n (n ≥ 0)` with multiplicity `n + 1`, and as `z → ∞` in `|ph z| ≤ π − δ`, `Ln G(z + 1)` has the asymptotic expansion `z²/4 + z Ln Γ(z + 1) − (z(z + 1)/2 + 1/12) ln z − ln A + Σ_{k≥1} B_{2k+2}/(2k(2k+1)(2k+2) z^{2k})`, with A Glaisher’s constant.

Use the analytic logarithms of `Γ(z+1)` and `G(z+1)` on the slit plane `|arg z|<π`, normalized to be real for `z>0`; this is not pointwise principal `Log` of their values. The pointwise Gamma recurrence and the formula involving `ψ(z)` exclude `z = −n` for n `∈ ℕ`, because Mathlib assigns Gamma the value zero at its poles.

The product factors are `1+O(|z|³/k²)` on compacts, giving an entire G with the stated zeros. Compare logarithmic derivatives of `G(z+1)/G(z)` and `Γ` through the `1/Γ` product; normalization fixes the ratio. At Gamma poles use germs, not totalized products. DLMF5.17.4 fixes `LnG(z+1)=zlog(2π)/2−z(z+1)/2+zLnΓ(z+1)−∫₀^zLnΓ(t+1)dt`. The [§4.3a](#s4-3a) proves the full sector bound separately. `barnesG_asymptotic` states the normalized expansion, the sharp bound for the integral `barnesRemainder`, and the differentiated sector estimate.

- `barnesG`: The entire function G defined by the Weierstrass product.
- **Gamma recurrence.** For `z ∈ ℂ` satisfying z `≠ −n` for every n `∈ ℕ`, `G(z + 1) = Γ(z) G(z)`, with Mathlib’s Complex.Gamma.
- **Normalization.** `G(1) = 1`.
- **Positive integral values.** `G(n) = Π_{k=1}^{n−2} k!` for `n ≥ 2`.
- **Entireness.** G is entire.
- **Zero locus.** `G(z) = 0` iff `z = −n` for some `n ≥ 0`.
- **Zero multiplicities.** The zero at `−n` has order `n + 1` for every `n ∈ ℕ`.
- **Logarithmic derivative.** For z not a nonpositive integer, `G′(z + 1)/G(z + 1) = ln(2π)/2 + 1/2 − z + z ψ(z)`, where `ψ = Γ′/Γ`. At `z = 0` the removable extension has value `G′(1)/G(1) = ln(2π)/2 − 1/2`; substituting the totalized `ψ(0)` into the first formula is invalid.
- `barnesG_asymptotic`: For every integer `N≥1` and `0<δ<π`, truncate the displayed sum at `k=N−1`. The remainder `R_N` is analytic on `|arg z|<π` and is `O_(N,δ)(|z|^(−2N))` uniformly as `|z|→∞` in `|arg z|≤π−δ`, for the normalized analytic logarithms. Its derivative is `O_(N,δ)(|z|^(−2N−1))` on each such closed sector.
- **Sharp remainder bound.** `|R_N(z)|≤|B_(2N+2)| sec(arg(z)/2)^(2N+1) / [2N(2N+1)(2N+2)|z|^(2N)]` for `N≥1`, `z≠0`, `|arg z|<π`.
- **Logarithmic derivative at one.** `G′(1)/G(1) = ln(2π)/2 − 1/2`, obtained by differentiating the product at `z = 0`.
- **Positive real values.** For real `x>0`, `G(x)` has zero imaginary part and positive real part; the product factors and exponential prefactor are positive on `z=x−1>−1`.

**Checks.**

- `G(1) = G(2) = G(3) = 1`, `G(4) = 2`, `G(5) = 12`.
- `G(0) = 0`, a simple zero; `G(−1) = 0` with order 2.
- `G(z + 1)/G(z) = Γ(z)` agrees with Mathlib’s Complex.Gamma away from the poles of `Γ`.
- `G(z)(1 + sin²(πz))` satisfies the same recursion and the same value at 1 but has zeros off the nonpositive integers, so the recursion and `G(1) = 1` alone do not define `G`.
- `G(1) = 1` but Complex.Gamma(0) `G(0) = 0`. The unqualified pointwise recurrence at `z = 0` fails.
- `G′(1)/G(1) = ln(2π)/2 − 1/2`; the formula involving totalized `ψ(0)` would incorrectly give `ln(2π)/2 + 1/2`.
- For real `r>0` and the empty `N=1` correction sum, `−1/(720r²)<R_1(r)<0`. The coefficient `1/240` belongs to the expansion after expanding the z `Ln Γ(z+1)` term as well.
- For `N=1,t=1/2`, `B₄−B₄(1/2)=−1/30−7/240=−1/16`, consistent with the negative remainder. The sector constant blows up as `δ↓0`; no bound uniform through the negative real cut is asserted. Multiplication by `exp(2πiz)` preserves the recurrence and `G(1)`, but violates the normalized asymptotic.

See [96][R96], §5.17, equations (5.17.1)–(5.17.5); [97][R97], canonical product p.2, (20) and Proposition3.1, pp.7–8, Lemma5.1 and proof, pp.10–11 (right-half-plane asymptotic).

*Needs:* `Complex.Gamma`; `Complex.exp`; [§4.3b](#s4-3b); [§4.3a](#s4-3a).

<a id="s4-3a"></a>

**§4.3a Barnes full-sector remainder.** Use `N≥1` and the normalized analytic logarithms in §4.3. With `B_m(x)` the Bernoulli polynomial and `B_m=B_m(0)`, the remainder after `k=1,…,N−1` is

`R_N(z)=1/[(2N+1)(2N+2)] ∫_0^∞ [B_(2N+2)−B_(2N+2)({t})]/(t+z)^(2N+1)` dt,  `|arg z|<π`.

First obtain the right-half-plane identity from the product/integral normalization, or the equivalent finite Taylor remainder in Adamchik. Integration by parts in the Euler–Maclaurin remainder for the Hurwitz derivative gives the periodic-Bernoulli integral. The signs here correct a misprint in Nemes `v2 (1.8)`: from `(2.4)` and `R_N=B_(2N+2)/[2N(2N+1)(2N+2)z^(2N)]+R_(N+1)`, the constant Bernoulli term enters positively and the periodic term negatively. For `N=1` the integral must be negative on positive reals, in agreement with `(1.6)`; the printed minus sign with a sum would give the opposite sign. The numerator is bounded; on every compact subset of the slit plane the denominator has an integrable uniform bound at infinity and stays away from zero at finite `t`. Thus the integral is holomorphic throughout that plane, and the identity theorem extends the normalized half-plane identity there. This supplies the continuation step, not an informal rotation across a singular ray.

For the sharp bound, the Bernoulli Fourier series gives `(−1)^N[B_(2N+2)−B_(2N+2)({t})]≥0`: its terms are a positive constant times `(1−cos(2πkt))/k^(2N+2)`. Also `|t+z|≥(t+|z|)cos(arg(z)/2)`. Therefore `|R_N(z)|≤|R_N(|z|)|sec(arg(z)/2)^(2N+1)`. The positive-real finite Taylor remainder, also directly bounded by the dilogarithm integral `(1.6)`, has the first omitted term's sign and absolute value strictly smaller than `|B_(2N+2)|/[2N(2N+1)(2N+2)|z|^(2N)]`. On `|arg z|≤π−δ` this yields the explicit bound with sec replaced by `1/sin(δ/2)`. Cauchy's estimate on a circle of radius `c_δ|z|` inside the wider sector `|arg w|≤π−δ/2` gives the stated derivative remainder, with a constant depending only on `N,δ`. This is exactly the sector uniformity used by the determinant identity.

See [98][R98], (1.1), pp.1–2; Theorem1.1 (1.8), p.2 and its derivation in §2, pp.5–6; Theorem1.2 (1.9)–(1.10), p.3 and the full-sector proof in §3, pp.7–9. The canonical product and integration constant remain those of §4.3; no renormalization of G is made.

<a id="s4-3b"></a>

**§4.3b Gamma strip and balanced-quotient estimates.** For real `a≤b` there is `C≥1` such that, for `a≤σ≤b` and `|t|≥1`,
`C⁻¹|t|^(σ−1/2)e^(−π|t|/2) ≤ |Γ(σ+it)| ≤ C|t|^(σ−1/2)e^(−π|t|/2)`.
For finite families of nonzero real slopes `a_i,a′_j` and real shifts `b_i,b′_j` satisfying `Σ|a_i|=Σ|a′_j|`, the modulus of
`∏Γ(a_i s+b_i)/∏Γ(a′_j s+b′_j)` is bounded above and below by positive constants times `|t|^κ(σ)` on every fixed real strip and `|t|≥1`, where `κ(σ)=Σ(a_iσ+b_i−1/2)−Σ(a′_jσ+b′_j−1/2)`. Constants may depend on the strip and every slope and shift; angular indices in §5.3e are fixed shifts, with no uniformity in those indices asserted.

Consume AnalyticNumberTheoryPartI §0.23a's normalized slit logarithm and Stieltjes integral. Its sector bound gives `R(z)=O(1/|z|)` on vertical strips at large height. Taking real parts of `(z−1/2)Log z−z+log(2π)/2+R(z)` gives `(σ−1/2)log|t|−π|t|/2+log(2π)/2+O(1/|t|)`, uniformly in σ. Gamma recurrence shifts any fixed strip to the right, with each recurrence factor comparable to `|t|`; compactness and Gamma nonvanishing handle the remaining `|t|≥1` interval. Apply the two-sided estimate to each affine argument. The balance of absolute slopes cancels all exponential factors, including for negative slopes.

**Checks.** At `σ=1/2`, `|Γ(1/2+it)|²=π/cosh(πt)`, fixing the exponential rate. The balanced quotient `Γ(s+1)/Γ(s)=s` has growth `|t|`, not a constant. Without balance, `Γ(2s)/Γ(s)` at `σ=1` has an extra `e^(−π|t|/2)` and cannot have a two-sided polynomial estimate. The restriction `|t|≥1` excludes the Gamma poles on the real axis.

See [AnalyticNumberTheoryPartI §0.23a](../AnalyticNumberTheoryPartI/README.md#s0-23a), Stieltjes identity and sector bound; the modulus and quotient deductions are given above. *Needs:* that target; principal complex logarithm; Gamma recurrence, reflection and nonvanishing from Mathlib.

<a id="s4-4"></a>

### 4.4 Lerch differential equation

`(z∂_z+c)∂_cΦ(z,s,c)=−sΦ(z,s,c)` on the initial domain and each matched continued branch. The right-hand side has a minus sign.

Apply the lowering relation with s+1 to the raising relation. Both derivative identities retain the same branch.

See [94][R94], Theorem2.3 p.13 (2.5), §4 Theorem4.1 and proof p.33.

*Needs:* [§4.1][R316]; [§4.4a][R317]; [§4.4b](#s4-4b); [§4.4c](#s4-4c).

<a id="s4-4a"></a>

**§4.4a Lerch compact convergence.** On every compact subset of `|z|<1`, `Re c>0`, `s∈C`, the `Φ` series and each fixed derivative in z,s,c converge uniformly and absolutely.

For a compact subset choose0<r₀<r<1 with `|z|≤r₀`, `Re c≥δ>0`, and |s|,|c| bounded. The principal argument of n+c stays `within(−π/2,π/2)`. Thus `|exp(−sLog(n+c))|≤C(n+1)^B` uniformly, after treating finitely many small `n`. Each fixed mixed derivative contributes finitely many factors polynomial in `n`, shifted powers of n+c and powers of `Log(n+c)`. Differentiating `z^n` directly treats `z=0` correctly: its d-th derivative is 0 for `n<d` and a falling factorial times `z^(n−d)` otherwise. Absorb every fixed polynomial/logarithmic factor and the finite index shift into C `r^n` using `r₀<r`; use a summable geometric majorant for absolute, uniform convergence and joint termwise differentiation.

See [95][R95], §2 p.4 (2.1) and §5 pp.20–22 termwise derivative proof.

<a id="s4-4b"></a>

**§4.4b Lerch lowering relation.** On the initial convergence domain, `z∂_zΦ(z,s,c)+cΦ(z,s,c)=Φ(z,s−1,c)`. For an already constructed continuation it transports along matching lifted paths by uniqueness.

Differentiate termwise using compact uniform convergence. Combine n+c in the numerator, then continue the identity with its `s−1` path.

See [94][R94], Theorem2.3 p.13 (2.3), §4 Theorem4.1 and proof p.33.

<a id="s4-4c"></a>

**§4.4c Lerch raising relation.** On the initial convergence domain, `∂_cΦ(z,s,c)=−sΦ(z,s+1,c)`, For an already constructed continuation the identity transports along the matching s+1 path by uniqueness.

Differentiate `exp(−sLog(n+c))` termwise under compact convergence. Use the same branch for n+c in the s and s+1 terms.

See [94][R94], Theorem2.3 p.13 (2.4), §4 Theorem4.1 and proof p.33.

<a id="s4-5"></a>

### 4.5 Lerch continuation on a covering

The initial `Φ` germ continues to a single-valued holomorphic function on the universal cover of `N#=C_s×(C_z\{0,1})×(C_c\Z≤0)`, based `at(s,z,c)=(1/2,−1,1/2)`. Fix its base germ by the principal integral and continuation from `|z|<1`. The separate solvable-descent lemma states the quotient-cover invariance. `lerchContinuation_solvable` states the continuation and §4.17's invariance on Tau Ceti's universal cover of `lerchDomain`, using `lerchBasepoint` and the principal germ `lerchIntegral`.

On the actual N# subtype use UniversalCover's endpoint/path-class carrier, checking path/local path connectedness and semilocal simple connectedness; pull back complex charts. Holomorphy is local representation by analytic `C³` functions; normalize at the constant path `over(1/2,−1,1/2)`. Tau Ceti represents a positive geometric loopγ by actionγ⁻¹; concatenate loop before path. The local-cell/gluing target below supplies clockwise detours/residues in a, finite c shifts, and s lowering on overlaps. Lowering is essential at positive integral `c`, where1−c is excluded from the four-term equation. Identity uniqueness and endpoint-fixed homotopy glue on the simply connected cover. Continue residue and finite-term germs globally with cocycle `M_(τ₁τ₂)=M_τ₁+M_τ₂+M_τ₂(M_τ₁)`. Fill positive c strata by actual holomorphic extensions, beyond zero monodromy.

The basepoint `z=−1` lies outside the open series disc; its germ is fixed by the principal integral with `Re` s,Re `c>0`. The cover omits `z=0,1`; the initial principal series still extends at `z=0`, but other sheets may not. Holomorphy at positive integer c uses the lowering operator; zero monodromy without a removable-singularity proof would be insufficient.

See [94][R94], Theorems2.1–2.2 p.12; complete selected §3.2–§3.5 pp.21–32, and LerchII §§3–4/§8.

*Needs:* `B5`; [§4.4b](#s4-4b); [§4.5d](#s4-5d).

<a id="s4-5a"></a>

**§4.5a Lerch shift identity.** On the initial convergence domain, `Φ(z,s,c)=c^−s+zΦ(z,s,c+1)`. For an already constructed analytic continuation it transports along matching lifted paths, including the shifted c path, by uniqueness.

Separate `n=0` and reindex `n≥1` in the absolutely convergent series. Continue both sides along the same lifted c shift, keeping its branch data.

See [95][R95], §4 p.17, (4.30)–(4.32), specialized to N=0.

<a id="s4-5b"></a>

**§4.5b Lerch integral representation.** There exists a jointly holomorphic principal-sheet extension `F(s,z,c)` on `Re s>0`, `Re c>0`, `z∈ℂ∖[1,∞)`, agreeing with the defining `Φ` series for `|z|<1`, such that `F(s,z,c)=Γ(s)^−1∫_0^∞t^(s−1)exp(−ct)/(1−zexp(−t))dt`. The integral is absolutely convergent; its formula is not asserted for the totalized series outside `|z|<1`.

For `|z|<1`, expand the denominator; the geometric bound and `Re c>0` dominate the integral `at∞` and `Re s>0` dominates its origin. Apply the complex gamma integral and sum-integral interchange to identify the initial series. On a compact subset outside the real `cut[1,∞)`, the denominator has a positive lower bound on any fixed finite t interval, and is uniformly close to1 for large `t`. At `t=0` it is bounded away from0 because `z≠1`. These bounds permit joint differentiation with integrable power/logarithmic majorants. Define F by the absolutely convergent integral on this domain; joint holomorphy and agreement in the disc fix the principal sheet. The complex-parameter Gamma–Laplace adapter below proves the integral identity and the domination needed for differentiation; it is not inferred from the real-parameter integral alone.

See [95][R95], §2 p.5, (2.2)–(2.4), integral cut-domain paragraph; §4 (4.18)–(4.23).

<a id="s4-5c"></a>

**§4.5c Complex Gamma–Laplace adapter.** For `Re s>0` and `Re c>0`,
`∫₀∞ t^(s−1)e^(−ct)dt=Γ(s)exp(−s Log c)`, with real-positive t and the principal logarithm of `c`. On each compact set `Re s≥σ>0`, `Re c≥η>0`, `|s|,|c|≤M`, the integral and each fixed finite parameter derivative have a common integrable majorant: C `t^(σ−1)(1+|log t|^k)` near zero and C `t^(M+k)e^(−ηt)` at infinity. These bounds also apply in a slightly larger compact neighborhood before differentiating.

For real `c>0` this is `Complex.integral_cpow_mul_exp_neg_mul_Ioi` at the pin, after converting `(1/c)^s` to `exp(−s Log c)`. Fix s and differentiate the integral in c under the stated majorant. Both sides are holomorphic on the connected right half-plane and agree on the positive real axis, which has an interior accumulation point; the identity theorem gives complex `c`. The same derivative bounds in the product parameter space give joint holomorphy using the native dominated parameter-integral theorem, not an interchange with an undominated derivative.

Prove the displayed identity, a compact integrable majorant including all specified derivative orders, and joint holomorphy of the Lerch integral by combining this bound with the preceding cut-domain denominator estimate. These use existing integral and complex-power carriers.

**Checks.**

- At `s=1,c=1+i`, the integral is `1/(1+i)=(1−i)/2`; replacing c by `Re c` would incorrectly give 1.
- At `s=2,c=2` the integral is `1/4`, so the scale is `c^(−s)`, not `c^s`.
- `Re c=0` is excluded: at `s=1,c=0` there is no integrable tail. `Re s=0` is excluded even at `c=1` because the origin behaves as `1/t`.

The integral formula is [95][R95], (2.2)–(2.4), p.5. The complex-parameter proof above supplies the local adapter. The analytic inputs are `Complex.integral_cpow_mul_exp_neg_mul_Ioi`, `MeasureTheory.hasFDerivAt_integral_of_dominated_loc_of_lip` and `MeasureTheory.hasDerivAt_integral_of_dominated_loc_of_deriv_le` in `Mathlib.Analysis.Calculus.ParametricIntegral`.

<a id="s4-5d"></a>

**§4.5d Lerch contour cells and path continuation.** In the a-coordinate `z=e^(2πia)`, let L be the positive t-axis with finitely many clockwise semicircular detours of radii `ε<min(u/2,1/2)` about positive points `u`. On a simply connected cell avoiding the images `a=n+t/(2πi)`, `t∈L,n∈Z`, fix the logarithms of t and of each finite shift c+j. Then
`Γ(s)^−1∫_L t^(s−1)e^(−ct)/(1−e^(2πia−t))dt`
is holomorphic for `Re s>0`, `Re c>0`. On any compact parameter set the finite contour part has denominator bounded below by a positive constant, and the unchanged tail is bounded by C `t^A e^(−ηt)`, including all fixed parameter derivatives. The origin has C `t^(σ−1)(1+|log t|^k)` domination. Thus the integral gives actual local analytic germs on these cells.

The straight-contour cell omits downward rays from the integers. A sufficiently small detour moves any point on such a ray, except its integer endpoint, into a detoured cell. A compact a-path avoiding Z crosses finitely many such charts after subdivision; crossing a pole changes the branch by the clockwise residue
`−(2πi)^s(a−n)^(s−1)e^(−2πic(a−n))/Γ(s)`.
The derivative of `1−e^(2πia−t)` at its zero is +1, fixing this sign. Each residue itself continues along every path avoiding `a=n` by its lifted logarithm. Separating N initial terms gives
`Φ(z,s,c)=Σ_(j<N)z^j(c+j)^(−s)+z^N Φ(z,s,c+N)`.
For any compact c-path avoiding `Z≤0`, choose one N making `Re(c+N)>0` throughout. The finite terms have their path-lifted logarithms, so the formula continues the germ along the path. Finally choose an integer m so that `Re(s+m)>0` on a prescribed compact s-path, and apply `(z∂_z+c)^m` to the already constructed germ at s+m. The lowering identity proves agreement on overlaps without division by `s`. This includes every positive integral `c`.

These constructions prove `lerch_contour_cell_holomorphic`, `lerch_cell_residue_difference`, `lerch_shifted_cells_cover` and `lerch_lowered_cells_cover`. To obtain `lerch_continuation_homotopy_invariant`, subdivide an endpoint-fixed path homotopy into a finite grid of cell neighborhoods; uniqueness on each overlapping neighborhood identifies the two local transports around every grid square. Compactness supplies the finite subdivision. Consequently the resulting germ depends only on the based path class and defines the actual holomorphic function on the imported universal cover. Pull back the exponential cover to handle z-paths. The finite residue/shift formulas then give all sheet differences; there is no assertion that a multiply connected cut-cell overlap is globally one branch.

**Checks.**

- At `s=1,c=1` the initial function is `−Log(1−z)/z`. A positive loop about `z=1` adds `−2πi/z`, agreeing with the clockwise residue, not its negative.
- A positive `c=0` loop changes the initial `c^(−s)` term by `e^(−2πis)−1`. At `s=1/2` this multiplier is `−2`; at `s=0` it is 0.
- The lowering construction is valid at `c=1` and `s=0`, giving `1/(1−z)`. The four-term relation would require excluded `c=0` and cannot provide this removable extension by itself.

Source: [95][R95], Lemma4.4 and Theorem4.5, (4.18)–(4.34), pp.12–18; Theorem5.1 (5.6)–(5.11), pp.21–22; §8 pp.26–27. The compact majorants and the grid argument above specify the analytic adapters on the native path-class cover.

<a id="s4-5e"></a>

**§4.5e Monodromy around c=−n.** On the principal Lerch-zeta germ `ζ(s,a,c)=Φ(exp(2πia),s,c)`, a positive loop around `c=−n (n≥0)` changes the branch by `(e^(−2πis)−1)e^(2πina)(c+n)^−s`, with the same logarithm lift. Loops about positive integer c have zero monodromy.

Separate the n-th term by the shift formula; the remaining shifted tail is holomorphic around `c=−n`. Continue `(c+n)^−s` once counterclockwise and subtract the original value.

See [95][R95], Theorem4.5 (4.15) p.14, complete finite-shift proof (4.28)–(4.34) pp.17–18.

<a id="s4-5f"></a>

**§4.5f Monodromy around a=n.** For the lifted principal Lerch-zeta branch, a positive loop around `a=n∈Z` changes it by `−(2πi)^s Γ(s)^−1(a−n)^(s−1)e^(−2πic(a−n))`, with `(2πi)^s` defined by `log(2π)+iπ/2` and the continued logarithm of `a−n`. On the fundamental strip0<Re `a<1`, the logarithm of `a−n` is cut along the negative imaginary axis with argument `in(−π/2,3π/2)`. Equivalently, for `n≥1 replace(a−n)^(s−1)` by `exp(πi(s−1))(n−a)^(s−1)`, whose base has positive real part; for `n≤0` use the principal logarithm of `a−n`.

Move the integral contour across the simple pole `t=2πi(a−n)`, retaining the clockwise residue sign. Continue the resulting residue term back to the principal polycylinder.

See [95][R95], Theorem4.5 (4.11) pp.13–14, negative-imaginary cut convention; complete contour/residue proof (4.18)–(4.27) pp.14–17.

<a id="s4-6"></a>

### 4.6 Nonpositive Lerch special values

For `m≥0`, `Φ(z,−m,c)=(z∂_z+c)^m(1/(1−z))`, a rational function of z,c with poles only at `z=1`. It extends in c across all integers and has zero monodromy. For `m=1` it equals `c/(1−z)+z/(1−z)²` on the initial domain.

Use the lowering relation repeatedly from `s=0` on `|z|<1`. Inductively differentiate the rational function, then continue it as a single-valued function; no limit `z→1` is asserted.

At `m=0` the value is `1/(1−z)`; at `m=1` it is `c/(1−z)+z/(1−z)²`. The rational function is polynomial in c and extends through all integer `c`. No radial limit at `z=1` is asserted. Do not use published Theorem6.1(2) at `m=0`: the `c→0 Φ` limit retains the `n=0` term1, while the periodic continuation equals `q₀(z)−1`. See the normalization convention.

See [94][R94], §5 Theorem5.1 and complete recurrence proof p.36, (5.2)–(5.5).

*Needs:* [§4.1][R316]; [§4.4a][R317]; [§4.4b](#s4-4b); [§4.6a](#s4-6a).

<a id="s4-6a"></a>

**§4.6a Lerch at order zero.** For `|z|<1`, `Re c>0`, the identity is `Φ(z,0,c)=1/(1−z)`.

Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

See [94][R94], Theorem5.1, (5.3) and m=0 proof p.36.

<a id="s4-7"></a>

### 4.7 Comparison with the circle-valued Hurwitz function

For real `0<c≤1` and `Re s>1`, the complex Hurwitz series `Σ_{n≥0}(n+c)^−s` agrees with Mathlib’s circle-valued Hurwitz function at c `mod 1`. At `c=1` the parameter is zero and the series is `ζ(s)`. This is a comparison of series with an existing function.

For `0<c≤1`, use the HasSum statement and cpow/exponential conversion for the positive bases n+c. At `c=1` the circle parameter is 0; its `n=0` zero-base term is junk-valued0 in `Re s>1`, so the endpoint still represents the positive-integer Hurwitz series.

The `c=1` series is `ζ(s)`, `notζ(s)+an` extra zero-base contribution. Circle parameters c and c+1 agree as circle elements, but their ordinary unperiodized Hurwitz series differ by `c^−s`; the comparison is restricted to `0<c≤1`.

See [99][R99], §1 p.2 Hurwitz specialization; exact Hurwitz series/residue declarations.

*Needs:* `HurwitzZeta.hurwitzZeta`; `HurwitzZeta.hasSum_hurwitzZeta_of_one_lt_re`; `HurwitzZeta.differentiableAt_hurwitzZeta`; `HurwitzZeta.hurwitzZeta_residue_one`; `HurwitzZeta.differentiableAt_hurwitzZeta_sub_one_div`; `Complex.cpow_def_of_ne_zero`; [§4.2](#s4-2).

<a id="s4-8"></a>

### 4.8 Periodic zeta and Lerch normalization

For real a, `z=exp(2πia)` and `Re s>1`, `expZeta(a,s)=zΣ_{n≥0}z^n exp(−sLog(n+1))`, in the absolutely convergent boundary series. The totalized defining `Φ` sum agrees here after its boundary summability proof; at `a∈Z` this is the Riemann degeneration. It gives no equality of arbitrary sheets or unqualified limit for `Re s≤1`.

Shift the `n≥1` periodic sum to `n≥0` and factor out `z`. Use the `expZeta` series theorem and its existing continuation.

At `a=0` the boundary series is `ζ(s)`. At `a=1/2,s=2`, `expZeta(a,s)=−π²/12` while `Φ(−1,2,1)=+π²/12`; the z prefactor changes the sign.

See [99][R99], §1 p.2 defining periodic series; LerchIII §6 Theorem6.1 pp.41–42.

*Needs:* [§4.1][R316]; `HurwitzZeta.expZeta`; `HurwitzZeta.hasSum_expZeta_of_one_lt_re`; `Complex.cpow_def_of_ne_zero`.

<a id="s4-9"></a>

### 4.9 Even Lerch functional relation

On the extended polycylinder `s∈C,0<Re a<1,0<Re c<1`, put `L_+=ζ(s,a,c)+e^(−2πia)ζ(s,1−a,1−c)` and `Λ_+=π^(−s/2)Γ(s/2)L_+`. Then `Λ_+(s,a,c)=e^(−2πiac)Λ_+(1−s,1−c,a)`, as matched holomorphic continuations. At a gamma pole, `Λ` denotes the removable holomorphic extension of the product, not its pointwise totalized Gamma value.

Use the real `0<a,c<1` Fourier–Mellin proof below, then its split integral to continue completed combinations in `s`, filling Gamma poles removably. Joint holomorphy on the fundamental polycylinder lets the one-variable identity theorem continue first a at real `c`, then `c`. Combine even/odd relations with Gamma reflection/duplication for the three-term transformation on `Re s<1`; glue to the `Re s>0` principal integral. At nonpositive integral s use the finite positive-integral1−s value and meromorphic uniqueness, never a totalized Gamma product.

`lerch_completed_functional_equations` states both parity equations on this full polycylinder, with the removable completed values at Gamma poles. These strip identities precede the global cover and therefore create no cycle in its construction. The odd equation retains the i multiplier; both symmetrizations use `exp(−2πia)`.

See [95][R95], Theorem2.1 (2.7)–(2.10) p.5; complete §3 pp.8–10, Lemma3.1 and Theorem2.1 proof.

*Needs:* [§4.1][R316]; [§4.4a][R317]; [§4.5b][R321]; [§4.5c][R327]; [§4.9a](#s4-9a).

<a id="s4-9a"></a>

**§4.9a Real Lerch Fourier–Mellin relation.** Fix real `0<a,c<1` and Schwartz f on `R`, with Fourier convention `f̂(y)=∫f(x)e^(−2πixy)dx`. Set
`A_(a,c)f(x)=Σ_(n∈Z)e^(2πina)f((n+c)x)`,
`A_k=A_(a,c)+(−1)^k e^(−2πia)A_(1−a,1−c)`, `k=0,1`,
and `F_k(f;s,a,c)=e^(πiac)∫₀∞A_k f(x)x^(s−1)dx` initially for `Re s>1`. Splitting positive and negative n gives
`F_k=e^(πiac) M_k(f)(s)[ζ(s,a,c)+(−1)^k e^(−2πia)ζ(s,1−a,1−c)]`,
where `M_k(f)(s)=∫₀∞(f(x)+(−1)^k f(−x))x^(s−1)dx`. Schwartz bounds justify these changes of order on `Re s>1`; the phases have modulus1. Twisted Poisson gives
`A_(a,c)f(x)=x^(−1)Σ_(n∈Z)e^(2πic(n−a))f̂((n−a)/x)`, `x>0`.
Split the Mellin integral at1 and substitute `x=1/y` in the lower half. All resulting `y≥1` sums decay faster than every power because `c,1−c,a,1−a` are strictly positive; the same bounds with `log` powers hold on compact s sets. Denote the resulting upper-tail expression by `Φ_k`. Then
`F_k(f;s,a,c)=Φ_k(f;s,a,c)+(−1)^k e^(−πia)Φ_k(f̂;1−s,1−c,a)`.
This is entire in `s`. Take `f₀(x)=e^(−πx²)` and `f₁(x)=xe^(−πx²)`, whose Fourier eigenvalues are1 and `−i`. Their Mellin factors are respectively `π^(−s/2)Γ(s/2)` and `π^(−(s+1)/2)Γ((s+1)/2)`. Reindexing the two tails gives the even multiplier `e^(−2πiac)` and the odd multiplier i `e^(−2πiac)`. The `Γ-products` at their poles are defined by the entire tail expressions, rather than by multiplication of totalized values. Iterated one-variable analytic uniqueness extends the relation to `0<Re` a,Re `c<1` wherever these principal analytic germs are defined.

The interfaces are `lerch_twisted_poisson`, `lerch_mellin_tail_entire`, `lerch_completed_even_relation` and `lerch_completed_odd_relation`. Poisson and Fourier on Schwartz functions are imported; only the shifted sums, their uniform tail estimates and phase bookkeeping are local.

**Checks.**

- At `a=c=1/2` the even multiplier is `−i` and the odd multiplier is 1. The even symmetrized initial series is 0, whereas the odd one is twice the alternating half-integer series.
- For `k=1` the Fourier eigenvalue is `−i`; its combination with `(−1)^k` gives +i. Using an unsigned Gaussian in both parity cases gives the wrong relation.
- At `a=c=1/2`, `f₀` yields cancellation in `A₀`, while `f₁` yields addition in `A₁`. The inequalities0<a,c<1 are essential: an integral endpoint introduces a zero lattice term whose Mellin tail has a pole.

Primary source: [99][R99], Lemma3.3 (3.20)–(3.25), pp.12–13; Lemma3.4 (3.28)–(3.35), pp.14–15; proof of Theorem2.1 (3.36)–(3.37), pp.15–16. The relevant result is Theorem2.1, not Theorem5.1.

<a id="s4-10"></a>

### 4.10 Odd Lerch functional relation

On the same polycylinder, `L_−=ζ(s,a,c)−e^(−2πia)ζ(s,1−a,1−c)` and `Λ_−=π^(−(s+1)/2)Γ((s+1)/2)L_−` satisfy `Λ_−(s,a,c)=i e^(−2πiac)Λ_−(1−s,1−c,a)`, with matched continuations; at gamma poles `Λ` denotes the removable holomorphic extension rather than a pointwise totalized Gamma product.

Apply the §4.9 Fourier–Mellin and continuation route to the odd combination. Keep its i eigenvalue; the same successive a,c identity theorems, overlap gluing and removable completed Gamma-pole values apply.

See [95][R95], Theorem2.1 (2.7)–(2.10) p.5; complete §3 pp.8–10, Lemma3.1 and Theorem2.1 proof.

*Needs:* [§4.1][R316]; [§4.4a][R317]; [§4.5b][R321]; [§4.5c][R327]; [§4.9a](#s4-9a).

<a id="s4-11"></a>

### 4.11 Lerch boundary degeneration

For `Re c>0` and `Re s>1`, the principal radial limit `Φ(r,s,c)` as r↑1 equals the convergent Hurwitz series. This limit is not an analytic continuation theorem across the entire `z=1` stratum for all `s`; for `s=0`, `Φ(r,0,c)=1/(1−r)` diverges.

For `Re c>0`, `Re s>1`, bounded principal arguments and `|n+c|≥n+Re c` give a summable `C(n+1)^−Re s` majorant. `Since0≤r^n≤1` and `r^n→1`, counting-measure dominated convergence gives Hurwitz. At `s=0,1/(1−r)→∞` excludes unrestricted degeneration.

The limit holds for complex c with positive real part, including `c=1+i`. At `s=0` it diverges for every allowed `c`, so the `Re s>1` hypothesis is material.

See [99][R99], Theorem 2.3, p.8, and §1, pp.1–3; the complex-c radial limit here is proved separately by discrete dominated convergence.

*Needs:* [§4.1][R316]; [§4.2](#s4-2); [§4.6a](#s4-6a).

<a id="s4-12"></a>

### 4.12 Complex Hurwitz continuation

There exist canonical joint continuations `H(s,c),R(s,c)` on `s∈C`, `Re c>0`, with H jointly holomorphic off `s=1`, R jointly holomorphic everywhere on this domain, `R(1,c)=1`, and `R(s,c)=(s−1)H(s,c)` for `s≠1`. H agrees with the defining Hurwitz series on `Re s>1` and has a simple pole at1 of residue1. `complexHurwitzContinuation_exists` states these joint continuations together with the Bernoulli values in §4.16. The shift holds off the pole. Neither a totalized divergent series nor the pointwise `product(s−1)H` at1 is claimed to be the removable extension `R`.

Prove a separate `z=1` Gamma integral by termwise integration and parameter-uniform domination on `Re s>1`, `Re c>0`; the principal-sheet lemma excludes `z=1`. Subtract the `t=0` Taylor terms, dominate locally uniformly and cancel reciprocal-Gamma zeros. Convergence-half-plane uniqueness fixes the continuation and residue.

`R(1,c)=1` for every `Re c>0`; directly `evaluating(1−1)` times a totalized `H(1,c)` would give0 and is not the claim. For real `0<c≤1`, H matches the existing circle function away from1.

See [95][R95], §9 p.28 for the singular-stratum distinction; the [§4.12a][R329] below supplies the separate continuation.

*Needs:* [§4.2](#s4-2); [§4.1][R316]; [§4.4a][R317]; [§4.12a][R329]; [§4.5c][R327].

<a id="s4-12a"></a>

**§4.12a Uniform complex Hurwitz continuation by subtraction.** Put
`F_c(t)=te^(−ct)/(1−e^(−t))`, with its removable value `F_c(0)=1`, and
`b_k(c)=(−1)^k B_k(c)/k!`. For every compact `K⊂{Re c>0}` and integer `M≥0` there is `C_K,M` such that
`|F_c(t)−Σₖ₌₀ᴹ b_k(c)t^k|≤C_K,M t^(M+1)` for `c∈K`, `0≤t≤1`. The same assertion holds after each fixed number of c derivatives. Indeed `F_c` is holomorphic in `|t|<2π`, jointly with `c`; Cauchy on `|t|=2`, uniformly on a compact neighborhood of `K`, bounds its Taylor tail. Identify its coefficients by multiplying by `e^t−1` and using the Taylor expansion of t `e^((1−c)t)`. The resulting coefficient recursion is the native `Polynomial.bernoulli_generating_function`; this identifies the analytic Taylor coefficients, rather than treating a formal power series identity as a convergence theorem. Bernoulli reflection gives the displayed `b_k`.

For `M≥0` and `Re s>−M` define the following meromorphic expression, filling its removable points:

`H_M(s,c)=Γ(s)^−1 [∫₀¹ t^(s−2)(F_c(t)−Σₖ₌₀ᴹ b_k(c)t^k)dt`
`+∫₁∞ t^(s−1)e^(−ct)/(1−e^(−t))dt`
`+Σₖ₌₀ᴹ b_k(c)/(s+k−1)]`.

The first integrand is bounded by C `t^(Re s+M−1)`, with powers of `|log t|` for s derivatives. The second is bounded by C `t^A e^(−ηt)` on every compact s,c set with `Re c≥η>0`; its parameter derivatives have the same kind of bound. Dominated differentiation therefore proves joint holomorphy of both integrals. For `Re s>1`, absolute sum–integral interchange and the complex Gamma–Laplace identity give the original Hurwitz series. The geometric expansion at `z=1` is used only on this stricter half-plane; the slit Lerch formula is not evaluated at its excluded point `z=1`.

The only candidate poles of the bracket are `s=1−k`. For `k≥1` the entire reciprocal Gamma has a simple zero there. More explicitly its recurrence yields, near `s=−m`,
`Γ(s)^−1=s(s+1)…(s+m)/Γ(s+m+1)`, so its derivative at `−m` is `(−1)^m m!`. For `M≥m+1` only the term `k=m+1` survives in `H_M(−m,c)`, giving
`(−1)^m m! b_(m+1)(c)=−B_(m+1)(c)/(m+1)`.
At `s=1` the `k=0` term has residue `b₀(c)/Γ(1)=1`. Thus `H_M` is holomorphic except for this simple pole, and `(s−1)H_M` has value 1 there. On overlaps the `H_M` agree first for `Re s>1` and then by analytic uniqueness. Gluing gives canonical H and R on `C×{Re c>0}`, with all bounds locally uniform in `c`. The series shift and real-circle comparison extend by the same uniqueness argument off the pole.

The required interfaces are `hurwitz_taylor_compact_remainder`, `hurwitz_subtracted_integrals_joint_holomorphic`, `hurwitz_subtractions_agree`, `complexHurwitzContinuation_exists`, `complexHurwitzContinuation_residue_one`, and `complexHurwitzContinuation_neg_nat`. The last three produce the actual functions of §4.12 and the values of §4.16; no continuation function is an unconstrained input.

**Checks.**

- `b₀=1`, `b₁=1/2−c` and `b₂=(c²−c+1/6)/2`. For `c=1` the first three are `1,−1/2,1/12`. The sign in `b₁` detects use of `e^(ct)` in the wrong numerator.
- `H(0,1)=−1/2`, `H(0,1/2)=0` and `H(0,1+i)=−1/2−i`. These are continued values; `Σₙ1` is not their defining convergent series.
- At `m=1,c=1`, the value is `−1/12`. At the pole `s=1` the regularized R has value 1, although a pointwise totalized product `(1−1)H(1,c)` is zero.
- At the edge `Re s=−M` the displayed remainder bound gives `t^(−1)`, so the integral is asserted only for the strict half-plane. Increasing M supplies neighborhoods of every negative integer.

This is a separate proof of the complex-c specialization discussed in [95][R95], §9 p.28; it does not use the order-zero assertion in Lerch III. Native inputs are `Complex.differentiable_one_div_Gamma`, `Complex.one_div_Gamma_eq_self_mul_one_div_Gamma_add_one`, `Complex.Gamma_one`, `Polynomial.bernoulli_generating_function`, `Polynomial.bernoulli_one`, and dominated parameter integration, read at the pin.

<a id="s4-13"></a>

### 4.13 Arithmetic and Barnes factors in the zeta moment conjecture

For real `k>0` set `c_k(0)=1` and `c_k(j+1)=(k+j)c_k(j)/(j+1)`. Define `a(k)=∏_p [(1−1/p)^(k²) Σ_{j≥0} c_k(j)² p^(−j)]`, an unordered convergent product over primes, and `g(k)=Re(G(k+1)²/G(2k+1))`, using the canonically normalized Barnes G from this roadmap. All local sums converge, `a(k)>0`, the Barnes quotient is positive real, and `g(k)>0`. These constants define the conjectural normalization; no general-k zeta asymptotic is proved.

Define `c_k` by finite products; for `k>0` compare `Γ(k+j)/(Γ(k)j!)` without poles. Its `O_k((j+1)^(k−1))` bound `(enlarged for k<1)` gives local convergence. `Multiplying1+k²/p+O_k(p⁻²) by(1−1/p)^(k²)` cancels first order: `positive1+O_k(p⁻²)` factors yield a positive unordered product, with uniform coefficient/product adapters required. Barnes' product is positive on positive reals; its integer recurrence gives `g(1),g(2),g(3)`. At `k=2`, `Σ(j+1)²p⁻ʲ=(1+p⁻¹)/(1−p⁻¹)³` gives `a(2)=∏(1−p⁻²)=1/ζ(2)`.

- `momentConstants.coeff_zero`: `c_k(0)=1`.
- `momentConstants.coeff_succ`: `c_k(j+1)=(k+j)c_k(j)/(j+1)`, for `k>0`.
- `momentConstants.coeff_gamma`: `c_k(j)=Γ(k+j)/(Γ(k)j!)`, with positive real arguments.
- `momentConstants.localFactor_hasSum`: The displayed local series has its specified sum for every prime p and `k>0`.
- `momentConstants.arithmetic_hasProd`: The displayed unordered prime product has product `a(k)>0`.
- `momentConstants.barnes_real_positive`: `G(k+1)²/G(2k+1)` is a positive real complex number and has real part `g(k)`.
- `momentConstants.integer_matrixFactor`: For positive integer `k`, `g(k)=∏_{j=0}^{k−1}j!/(j+k)!`.

**Checks.**

- `a(1)=1` and `g(1)=1`, matching the second-moment leading constant.
- `a(2)=1/ζ(2)=6/π²` and `g(2)=1/12`, so `a(2)g(2)=1/(2π²)`. A missing factorial or reciprocal reverses this test.
- `g(3)=1/8640=42/9!`, using `G(4)=2` and `G(7)=34560`.
- At `k=2` and `p=2` the local arithmetic factor is `3/4`; at `k=1` every local factor is 1.

The arithmetic factor and Barnes factor are separate; no factorial is absorbed into `a(k)`. The general-k asymptotic is a named conjecture. The unitary Haar-matrix model remains a higher-tier probability target, importing these constants.

See [100][R100], Equations (4)–(6), (15)–(19), pp.59–61; Barnes formula (80)–(87), pp.73–74.

*Needs:* [§4.3](#s4-3); `Nat.factorial`; `Complex.Gamma`; `riemannZeta`; `HasProd`.

<a id="s4-14"></a>

### 4.14 Moment model as a conditional comparison

For each fixed `k>0`, the statement `∫_0^T|ζ(1/2+it)|^(2k)dt∼a(k)g(k)T(log T)^(k²)` is a conjectural model with the arithmetic Euler factor `a(k)` and random-matrix factor `g(k)` defined by this roadmap’s zeta-moment-constants target. No asymptotic for general k is asserted unconditionally. The quantitative `k=1` comparison consumes AnalyticNumberTheoryPartI §3.23 under its `BBRFiniteInput` hypothesis and carries that hypothesis explicitly. The `k=2` comparison uses its unconditional §3.24. Positivity and evaluation of `a(k),g(k)` are unconditional.

Use the local arithmetic/Barnes factors in Keating–Snaith's normalization. Compare `k=1` under `BBRFiniteInput` and `k=2` unconditionally with the supplied moments; other k remain hypotheses. A later Haar-unitary model can consume these constants, but is not a prerequisite.

The quantitative proof and the normalization comparisons are required separately. Checks: `a(1)g(1)=1` independently of `BBRFiniteInput`; under that input the second moment has leading term `T log T`; unconditionally `a(2)g(2)=1/(2π²)` matches the fourth moment.

See [100][R100], Equations (4), (5), (15), (19), pp.59–61.

*Needs:* [AnalyticNumberTheoryPartI §3.23][R305]; [AnalyticNumberTheoryPartI §3.24][R306]; [§4.13](#s4-13).

<a id="s4-15"></a>

### 4.15 Dirichlet character Hurwitz specialization

For a character `χ` modulo `q≥1` and `Re s>1`, `L(s,χ)=q^−sΣ_{a=1}^q χ(a)ζ_H(s,a/q)`, using the actual principal/imprimitive character values. Continue with the Dirichlet and circle-Hurwitz functions and keep the principal pole.

Use the existing ZMod.LFunction finite continued circle-Hurwitz sum and its Dirichlet specialization. For `q≥1` choose `a=1,…,q`: a/q mod1 represents the residue, with `a=q` giving0 and positive endpoint `c=1`. Compare series on `Re s>1`; elsewhere retain the continued finite sum.

For `q=1` and its unique principal character, this reduces to `ζ(s)`, with its pole at1. Principal and imprimitive characters retain their zero values on nonunits; no primitivity is silently imposed.

See [99][R99], §1 (1.1), (1.3)–(1.4), pp.1–2; finite residue-class reindexing gives the Dirichlet comparison, with the existing ZMod.LFunction definition.

*Needs:* [§4.7](#s4-7); `ZMod.LFunction`; `DirichletCharacter.LFunction`; `Complex.cpow_def_of_ne_zero`.

<a id="s4-16"></a>

### 4.16 Hurwitz Bernoulli values

For `m≥0` and `Re c>0`, the canonical continuation has `ζ_H(−m,c)=−B_{m+1}(c)/(m+1)`, with Bernoulli polynomials normalized by `te^(ct)/(e^t−1)=ΣB_j(c)t^j/j!`. In particular `ζ_H(0,c)=1/2−c`. The polynomial is the Polynomial.bernoulli(m+1) evaluated at complex c after coefficient extension; `B₁(c)=c−1/2`, so at `c=1` the order-zero value is `−1/2`.

Use the Taylor-subtracted integral and the reciprocal-gamma zero `at−m`. Identify its coefficient by the stated Bernoulli generating series; pin the `B₁` sign.

At `m=0,c=1` the value is `−1/2`; at `m=0,c=1/2` it is 0; at `m=0,c=1+i` it is `−1/2−i`. The positive-half-plane series definition at `s=0` is divergent and totalizes to 0; use the continued `H`, not that totalized sum.

See [NIST DLMF §25.11(v), (25.11.13)–(25.11.14)](https://dlmf.nist.gov/25.11#E14) for the complex-parameter identity; [94][R94], §6 p.40 discusses its arithmetic setting. The [§4.12a][R329] supplies the proof with this B₁ sign.

*Needs:* [§4.12](#s4-12); `Polynomial.bernoulli`; `Polynomial.bernoulli_one`; `Polynomial.bernoulli_eval_one`.

<a id="s4-17"></a>

### 4.17 Lerch solvable-cover descent

The holomorphic Lerch continuation on the universal cover of `N#=C_s×(C_z\{0,1})×(C_c\Z≤0)` is invariant under `π₁(N#)″`. It therefore descends to the regular cover associated to that second commutator subgroup; its deck group `π₁(N#)/π₁(N#)″` is solvable of derived length at most2. No descent to the maximal abelian z cover is asserted.

Use §4.5's normalized analytic cover and inverse-loop convention. For `H₀=ker(Z₀↦1,Z₁,Y_n↦0)`, generators are `Z₀-conjugates` of `Z₁,Y_n` and `G/H₀≅Z`. Compute their diagonal/mixed actions: `Z₁` acts on `f₀` by `e^(2πis)`, not1. The z-loop shifts, c-monodromy and cocycle show vanishing `on[H₀,H₀]`; mixed z/c actions annihilate each other. Since `G′⊂H₀`, `G″⊂[H₀,H₀]`, giving the characteristic normal subgroup and UniversalCovers2's regular quotient. Filling positive c strata kills their zero-monodromy loops and preserves descent.

At a generic s the `Z₀-shift` of the `Z₁` residue is nontrivial; vanishing of principal `Z₀` monodromy alone does not imply an abelian z cover.

See [94][R94], §3.4 Theorem3.5 and complete proof pp.28–31; §3.5 Theorem3.6 pp.31–32.

*Needs:* `B5`; [§4.5](#s4-5); [UniversalCovers stage 2 lifting criterion and galois correspondence][R37]; `TauCeti.UniversalCover.SubgroupQuotient`; `TauCeti.UniversalCover.subgroupQuotientMap`; [§4.17a](#s4-17a).

<a id="s4-17a"></a>

**§4.17a Lerch z-loop monodromy and shifts.** On `D={s∈C,z∈ℂ∖[0,∞),0<Re c<1}`, choose `Log z` with `0<Im Log z<2π` and `a=Log z/(2πi)`. Put `f_p=e^(2πipc)z^−c(a−p)^(s−1)` for `p≤0`, and `f_p=e^(πi(s−1))e^(2πipc)z^−c(p−a)^(s−1)` for `p≥1`, using principal logarithms of the positive-real-part bases. For the source upper-connector based loops `Z₀,Z₁` about 0,1, the principal germ has `M_Z₀Φ=0` and `M_Z₁Φ=−(2πi)^s f₀/Γ(s)`. The residue functions analytically continue to the universal cover, and continuation along `Z₀^k` sends `f_p` to `f_(p−k)`; positive continuation along `Z₁^k` multiplies `f₀` by `e^(2πiks)` and fixes `f_p` for `p≠0`; c loops fix every `f_p`. This corrects the published `(3.28)`, as recorded in the normalization convention. The vanishing `Z₀` identity for `Φ` concerns its principal germ, not invariance on every sheet.

Lift `Z₀` by the exponential cover to a path from `a=1/2` to3/2 in the upper half-plane; the initial Fourier series is periodic there, so `Φ` has zero `Z₀` monodromy. `Z₁` lifts to the `a=0` based loop, giving the existing a-monodromy residue. The continued `Log z` increases by `2πik` along `Z₀^k`. Its factor `z^−c` contributes `e^(−2πikc)`; combined with `e^(2πipc)` this is the phase in `f_(p−k)`. Track the cut of `a−p` using the stated positive-real-part bases, including a sign change of `p−k`. The principal-germ identities then have unique analytic continuations on the universal cover. The `Z₁` lift winds positively once around `a=0`, while its logarithm lift has no increment around `z=0`. Thus `a^(s−1)` gains `e^(2πis)` for `p=0`. For `p≠0`, the corresponding `a−p` factor has zero winding. Repetition gives `e^(2πiks)`. These principal-germ relations extend analytically on the connected universal cover. The descent argument must use this corrected diagonal action, not published `(3.28)`.

See [94][R94], §3.2 Lemma3.1 pp.21–24; §3.3 Theorem3.4 pp.25–28, (3.24)–(3.35); [101][R101], Definition3.3 (3.23), (3.24), Theorem3.4 (3.25)–(3.30), arXiv v1 printed pp.26–27.

### Examples

At `s=0` and `|z|<1` the Lerch series is `1/(1−z)`. At `c=1` the complex Hurwitz series is `ζ(s)` in `Re s>1`, giving `π²/6` at `s=2`. Real circle parameters c and c+1 agree, but their unperiodized Hurwitz series differ by `c^(−s)`; the comparison is restricted to `0<c≤1`. Barnes G has `G(1)=G(2)=G(3)=1`, `G(4)=2`, `G(5)=12` and `G(0)=0`. Multiplying a solution of its recurrence by `exp(2πiz)` preserves the recurrence and `G(1)`, demonstrating why the canonical product is essential.

### Dependencies

Mathlib Hurwitz zeta, Gamma, Bernoulli polynomials and complex powers; UniversalCovers Layers 0 and 2 for the actual based and regular covering spaces; AnalyticNumberTheoryPartI §0.23a for uniform Gamma estimates and §§3.23–3.24 for classical moment normalizations. The circle-Hurwitz continuation and residue are consumed from Mathlib under the boundary contract; only the complex-series comparison is a target here.

<a id="layer-5"></a>

## Layer 5: Double Dirichlet series and binary-cubic zeta functions

Target API names below are relative to `TauCeti.SeveralVariableZeta`. Keep two analytic constructions separate. The selected 16-component quadratic double Dirichlet series has affine reflections, conductor-aware local factors and a three-hyperplane polar divisor. The binary-cubic theory has signature and ideal-class components, local Fourier transforms and a different global matrix equation. Pole clearing, residues and convexity refer to these canonical continuations.

<a id="s5-1"></a>

### 5.1 The four real characters modulo eight

Fix the row order `ψ1,ψ−1,ψ2,ψ−2` and unit residues 1,3,5,7. Their value table is `((1,1,1,1),(1,−1,1,−1),(1,−1,−1,1),(1,1,−1,−1))`; each is zero on even integers. They are genuine Dirichlet characters, with conductors 1,4,8,8 and parities 0,1,0,1. The two positive-sign descriptions and one conductor row printed on p.358 are corrected in the character table above.

Verify multiplicativity on the four-element unit group modulo eight. Extend by zero away from units. Check primitive conductor and parity by restriction to levels 1,4,8.

- `Characters8.value`: Evaluate the above row at n mod8, with zero on even `n`.
- `Characters8.mul`: `ψ(nm)=ψ(n)ψ(m)`.
- `Characters8.unit_table`: All four rows have exactly the displayed values at 1,3,5,7. Conductor and parity compatibility are separate lemma contracts in [§5.16](#s5-16) and [§5.30d](#s5-30d).

**Checks.**

- Every row takes value 1 at 1.
- `ψ2(3)=−1` and `ψ−2(7)=−1`.
- For rows i,j, `Ση ψi(η)ψj(η)=4` if `i=j` and 0 otherwise.
- Every row vanishes at 2; even inputs are nonunits, not an extra positive character value.

See [102][R102], §2.1, (7)–(11), p.358.

*Needs:* `DirichletCharacter`.

<a id="s5-2"></a>

### 5.2 Swap of double-series variables

Define `α(s,w)=(w,s)`. Its fixed locus is `s=w`; it is a complex affine involution.

Exchange the two coordinates twice and solve equality with the original pair. Its linear formula also supplies continuity and analyticity.

- `FunctionalSystem.swap_apply`: `swap(s,w)=(w,s)`.
- `FunctionalSystem.swap_involution`: swap∘swap=id.
- `FunctionalSystem.swap_fixed`: swap `z=z` iff `z.1=z.2`.

**Checks.**

- `swap(0,0)=(0,0)`.
- `swap(2,3)=(3,2)`.
- `swap(s,s)=(s,s)`.

See [102][R102], Lemma 2 and (31)–(35), pp.361–363.

<a id="s5-3"></a>

### 5.3 Quadratic reflection of double-series variables

Define `β(s,w)=(1−s,s+w−1/2)`. Its fixed locus is `s=1/2`; it is a complex affine involution.

Substitute the affine formula into itself, which recovers both coordinates. Equality with the original pair forces `s=1/2` and imposes no additional condition on `w`.

- `FunctionalSystem.reflect_apply`: `reflect(s,w)=(1−s,s+w−1/2)`.
- `FunctionalSystem.reflect_involution`: reflect∘reflect=id.
- `FunctionalSystem.reflect_fixed`: reflect `z=z` iff `z.1=1/2`.

**Checks.**

- `reflect(0,0)=(1,−1/2)`.
- `reflect(2,3)=(−1,9/2)`.
- `reflect(1/2,w)=(1/2,w)`.

See [102][R102], Lemma 2 and (31)–(35), pp.361–363.

<a id="s5-3a"></a>

**§5.3a Unbounded-coordinate Schwartz lattice estimate.** Let F have degree `n`, fix a finite-adelic Schwartz function `Φ_f` on `F_Af^m`, and let `λ_i>0` dilate the i-th archimedean F-coordinate with norm `λ_i`. For each `α>1` there is a continuous archimedean Schwartz seminorm `N`, depending only on `F`, `Φ_f`, m and `α`, such that
`Σ_{x∈F^m,x₁≠0}|Φ_f(x_f)Φ_∞((λ_i x_i)_i)| ≤ N(Φ_∞)∏_i max(1,λ_i⁻¹) max(1,λ₁)^(−α/n)`.
Dropping the last factor gives the unrestricted estimate. These are Wright, [103][R103], Lemmas1.1–1.2, pp.510–511; the coordinate notation here uses his positive archimedean norm section, rather than multiplying each real embedding by `λ_i` itself.

At the fixed finite-place support level, enclose all possible rational coordinates in one fractional ideal lattice. Choose an integral basis and enlarge to the product lattice obtained by allowing its integer coefficients independently. A nonzero first coordinate has a nonzero coefficient in at least one of n positions; sum these n cases. A product Schwartz seminorm bounds the summand by `∏(1+|c_jℓ_j|^α)⁻¹`, including the nonzero coefficient. Compare each positive-integer sum to its integral: it is at most `α/(α−1) min(c⁻¹,c⁻α)`; the sum including zero is at most `3α/(α−1) max(1,c⁻¹)`. Multiplication gives the displayed estimate. A compact set of linear coordinate changes is absorbed by the continuous Schwartz action and finitely many seminorms. Extend from pure finite-place tensors on a fixed level by linearity; the archimedean function itself can be an arbitrary Schwartz function. This estimate uses AutomorphicLFunctionsAndLocalFactors AL.0’s Schwartz carrier and Poisson theorem.

API: `.nonzero_coordinate_bound`, `.unrestricted_bound`, `.compact_linear_changes`, `.continuous_seminorm`. Checks: in dimension 1 over Q the Gaussian sum with zero removed tends rapidly to 0 as `λ→∞`; the unrestricted sum tends to `Φ(0)`, so it cannot have the extra decay; as `λ→0` the Gaussian sum grows like `λ⁻¹`, excluding a uniform constant. *Needs:* AL.0 Schwartz carriers; finite-dimensional lattice coordinates; ordinary real integral comparison.

<a id="s5-3b"></a>

**§5.3b Wright GL₂ measure and reduction adapter.** Consume AdelicAlgebraicGroups §2.2's parabolic modulus, AdelicAlgebraicGroups §2.2's **Inversion between left and right quotient conventions**, and AdelicAlgebraicGroups §3.4's **Siegel sets cover `G(F)\G(A)**`. Inversion, quotient measure and reduction are existing targets. Specialize them to Wright's lower Borel, with `K=∏O(2)`, `U(2)`, `GL₂(O_v)`, each compact factor of mass 1; additive A/F and norm-one idele-class quotients of mass 1. Put `a_λ=diag(λ,λ⁻¹)` using the norm section, so `t(a_λ)=λ`. On the right Borel measure `dλ/λ` precedes the norm-one Borel variables; moving `a_λ` to the left introduces `λ⁻²`. Retain the separate positive central parameter and its `dμ/μ` measure. Consequently, for a right-rational-invariant integrand bounded on the compact factor by `F₀(λ)`,
`∫_{G(A)¹/G(F)}|F(g)|dg ≤ C_F ∫₁^∞ F₀(λ) λ⁻² dλ/λ`,
with a harmless fixed threshold change absorbed into the compact factor. The corresponding full-group estimate also integrates `dμ/μ`. This local specialization is Wright §3, pp.514–515, Lemmas3.1–3.2.

To derive the inequality from AA, invert its covering Siegel set, choose a measurable fundamental domain inside that covering by first occurrence in a countable cover, integrate its nonnegative majorant over the larger set, and use AA's Iwasawa integration. A finite collection of compact arithmetic representatives is absorbed into one compact set and `C_F`. The positive root modulus is `λ²`, giving `λ⁻²` after moving the positive coordinate; no equality of the fundamental domain with a Siegel set is asserted. Measure scalars are fixed before the residue computation, not fitted afterwards. Checks: `a_λ` acts on the lower unipotent coordinate with modulus `λ⁻²` under conjugation; the quotient inversion replaces g by `g⁻¹` in both theta and determinant; the constant majorant is integrable on the norm-one cusp since `∫₁^∞λ⁻³dλ=1/2`. *Needs:* the three named AdelicAlgebraicGroups §§2.2, `3.4` exports; [§5.3a][R130].

<a id="s5-3c"></a>

**§5.3c Local orbital distributions and their continuation boundary.** Distinguish the additive discriminant integral in §5.8 from the orbital integral `Z_α(ω,Φ)=∫_G ω(det g)Φ(gx_α)dg`. The orbital Jacobian converts the latter into a scalar times `∫_α |P(x)|^(u/2−1)Φ(x)dx` for `ω=|·|^u`. Thus the orbital strip `Re u>1/3` is the additive strip `Re s>−5/6`. No factor-of-two change is implicit.

Over `R`, let `D=P(∂)` with the dual-pairing coordinates and `b(v)=2⁴3⁶(v−1/6)v²(v+1/6)`. The polynomial identity `D(P^v)=b(v)P^(v−1)`, first away from `P=0`, gives integration-by-parts recurrences for the distributions. Dividing by the corresponding `Γ` factors removes the possible poles and continues them as continuous Schwartz functionals. Shintani, [On Dirichlet series whose coefficients are class-numbers of integral binary cubic forms][R104], Proposition1.3 pp.139–140 and Proposition2.7 pp.160–161, supplies these steps. His Lemma1.3 pp.140–141 kills a distribution supported on `P=0` by `P^N` for N larger than its order: multiply by a cutoff at `|P|≤ε` and let `ε→0`. Apply the recurrence to the difference of the two Fourier expressions; this proves equality on all Schwartz functions from equality away from `P=0` (Theorem1.1 proof pp.143–144). This prevents an unaccounted singular-supported correction.

The complex version uses D and its conjugate and the angular character `m∈Z`: the recurrences shift (u,m) to `(u−1,m∓1)`. Divide by `Γ((u+|m|±1/3)/2)Γ((u+|m|)/2)²`. Datskovsky–Wright, [105][R105], Proposition3.2 pp.40–41, gives the resulting entire Schwartz distributions; the preceding differential identity supplies their recurrence. The same finite-order support argument uses `|P|²` and the two recurrences. Positivity and the abscissa-of-convergence lemma extend the original integrals down to `Re u>1/3` (Corollaries3.1–3.2, pp.41,45).

**Nonarchimedean local distribution theorem.** At a finite place, for every Schwartz–Bruhat function and every quasicharacter, ramified ones included and in every residue characteristic including 2 and 3, the orbital zeta distributions continue meromorphically as rational functions of `q^(−u)` and satisfy the local Fourier functional equation with an involutive matrix (Datskovsky–Wright Theorem3.2, p.47). Its proof applies Igusa's theorem on p-adic complex powers (Igusa, *Some results on p-adic complex powers*, American Journal of Mathematics `106 (1984)`, 1013–1032, Theorem1), which is the proof source for this target. The five unramified standard-function factors below are special cases and do not imply it. API targets are `.meromorphic_distribution`, `.fourier_equation`, `.rational_in_q_pow`, `.involutive_matrix`; checks require support on `P=0` to cause no extra term, equality first in `1/3<Re u<5/3`, and both `p=2` and `p=3` without a tameness hypothesis. *Needs:* AL.0 Fourier; [§5.10b][R346]; for the nonarchimedean case, Igusa `1984`, Theorem1.

<a id="s5-3d"></a>

**§5.3d Real binary-cubic Fourier matrix.** In DW's orbital basis ordered split/real-complex, with u the orbital exponent and `γ(v)=Γ(v−1/6)Γ(v)²Γ(v+1/6)`, the matrix is
`C_R(u)=π^(−2u)3^(3u−3)γ(u/2)/2` · `[[sin(πu),3sin(πu/2)],[sin(πu/2),sin(πu)]]`.
The proof source is Shintani Proposition2.9, pp.164–165, not merely DW Theorem4.1 p.48. Shintani's additive-distribution basis has the off-diagonal3 in the opposite position; the orbit Jacobian and stabilizer factors must be applied before comparing its transpose with this orbital basis.

The proof separates three finite steps. First normalize the orbital distributions by the recurrence `Γ` factors. Shintani Theorem1.1 pp.143–146 makes the residual Fourier coefficients periodic entire functions with bounded exponential type: use the coarea form `dx=dP∧ω` and a compactly supported function on `|P|=1`, multiply by the radial cutoff of Lemma1.4, and compare its Mellin lower bound `exp(−√|t|)` with the Schwartz-distribution bound. A Fourier-series coefficient estimate then leaves only modes0,±1; parity removes the inappropriate modes in the off-diagonal entries. Next determine their special value at u corresponding to additive `exponent−1/6` using the triple-root distribution (Lemma2.4 and Proposition2.6, pp.157–160), and the adjacent-orbit relation using the double-root distribution (Lemma2.3 and Proposition2.5, pp.155–157). Finally apply Fourier inversion to get `M(s)M(1−s)` and its determinant relation; its two possible signs are distinguished by those special values. This finite calculation gives Shintani's matrix `(2.23)`. Substitute `u=2s`, change the measure/orbit basis as above, and obtain `C_R(u)`. The rank-one singular evaluations use only the `beta` integrals for `|x(x−1)|` and `x²+1`, and the already imported Gamma identities; no generic prehomogeneous-space theorem is left implicit.

API: `.real_fourier_matrix`, `.basis_comparison`, `.double_fourier`, `.sine_normalization`. Checks: the split-to-complex coefficient is three times the reverse coefficient; at `u=1` the diagonal entries vanish and the off-diagonal entries do not; the normalized matrix at u and `2−u` composes to identity. *Needs:* [§5.3c](#s5-3c), archimedean part; AL.0 Fourier; [§5.10b][R346].

<a id="s5-3e"></a>

**§5.3e Complex binary-cubic Fourier factor.** With `|z|_C=z` z̄, `r(u)=π^(−2u)3^(3u)γ(u/2)`, and angular character `m∈Z`, the unique complex open orbit has `C_C(u,m)=r(u+|m|)/r(2−u+|m|)`. DW Theorem4.2 and proof, pp.49–51, proves this by Gaussian test functions, rather than referring to the real calculation.

Use the self-dual Gaussian `Φ₀=exp(−2π(|x₁|_C+|x₂|_C/3+|x₃|_C/3+|x₄|_C))`. Multiply by `P^|m|` or its conjugate as dictated by the sign of `m`. Fourier exchanges the two and their orbital zeta integrals are `Z(u+|m|,0,Φ₀)`. Applying D to the Gaussian multiplies by `(2π)⁴P̄`, so the differential recurrence makes `f(u)=Z(u,0,Φ₀)/r(u)` entire and 2-periodic. Stirling and the positive Gaussian integral bound leave only the Fourier modes0,±1, hence `f=a+b cos(πu)+c sin(πu)`. Evaluate the scalar Fourier equation on a compactly supported nondegenerate test at each parameter to show that its normalized coefficient is entire; this step does not divide globally by `Z(Φ₀)`. The reflection formula expresses it by `f(u)/f(2−u)`. Entireness forces matching roots; positivity of the Gaussian integral for real `u>1/3` excludes the remaining real-root alternative. Thus `f(u)=f(2−u)`; cancellation gives the ratio above. This also proves the angular-character shift, not only `m=0`.

API: `.complex_fourier_factor`, `.angular_shift`, `.gaussian_recurrence`, `.reflection_cancellation`. Checks: m and `−m` give the same factor; at `u=1` the ratio is 1; when `m=0`, `C_C(u)` is minus the determinant of the displayed real matrix. *Needs:* the complex part of [§5.3c](#s5-3c); AL.0 Gaussian Fourier; [§4.3b](#s4-3b).

<a id="s5-4"></a>

### 5.4 Binary-cubic action, discriminant and local orbit data

For a commutative ring A, write `f(u,v)=au³+bu²v+cuv²+dv³`. On invertible `2×2` matrices use the left action `(g·f)(u,v)=det(g)⁻¹ f((u,v)g)` with row variables. Thus `g·(h·f)=(gh)·f`. Write `P(f)` for the supplied `Cubic.discr` of its coefficient tuple.
The polynomial identity is `P(g·f)=det(g)² P(f)` over every A; no inversion of 2 or 3 is needed. The carrier may use Mathlib homogeneous polynomials; it is not a new polynomial theory. The target is the full `GL₂` action over commutative rings.

API: `cubicAction.one`, `.mul`, `.discriminant_covariance`. Prove covariance first on the universal polynomial ring and transport by evaluation. The algebra table in the next target identifies its trace discriminant with `P`, so the determinant square is checked against the algebraic discriminant rather than chosen by convention.

**Checks.**

- The two-term form `u³−v³` has `P=−27`; diag(2,1) takes it to `4u³−v³/2`, with `P=−108=2²(−27)`.
- The unipotent matrix [[1,1],[0,1]] takes it to `−3u²v−3uv²−v³`, with the same `P=−27`.
- The two-term form `uv(u−v)` has `P=1`. The zero form has `P=0` and is excluded from the étale orbit set.
- For `u³−v³`, P is 1 in `𝔽₂` and 0 in `𝔽₃`; the polynomial construction works in both characteristics, while separability fails in characteristic 3.
- A scalar matrix `λI` takes f to `λf`, giving `λ⁴P=(det(λI))²P`.

See [Wood, Parametrizing quartic algebras over an arbitrary base][R106], §2, Theorem 2.1 and (1), pp.1073–1074; [105][R105], §1 pp.29–34 (representation, discriminant, separable orbit types). *Needs:* Mathlib multivariate polynomials, `GeneralLinearGroup`, trace and finite projective modules.

<a id="s5-5"></a>

### 5.5 Cubic algebras and projective forms

**Cubic parameterization on nonprincipal modules.** For `O=O_F`, use locally free rank-three commutative unital O-algebras `C`, not only globally free algebras. Put `V=(C/O·1)^∨`. The analytic coefficient adapter includes every rank-two projective V and a section f of `Sym³V⊗(∧²V)^∨`. Isomorphisms of these pairs correspond to algebra isomorphisms, including stabilizers; discriminants are compared as sections of the determinant-line square before taking their ideal norms. Over a Dedekind domain these sections give the discriminant ideals even when there is no global discriminant element.

Construct the free/local multiplication below, then glue it on every rank-two projective module. The equivalence includes algebra isomorphisms and their stabilizers, not merely a bijection of rational field orbits. Wood, [Parametrizing quartic algebras over an arbitrary base][R106], §2 Theorem2.1 and explicit construction, pp.1073–1074, gives the required general-base cubic construction. On a local trivialization, choose `1,ω,θ` and shift `ω,θ` uniquely so that `ωθ` is scalar. Associativity determines the table. In Wood's sign convention it is
`ωθ=−ad`, `ω²=−ac+bω−aθ`, `θ²=−bd+dω−cθ`.
The simultaneously negated basis `(−ω,−θ)` gives the equivalent table with `−b,+a,−d,+c`; keep this basis change explicit when comparing source conventions. The construction uses no division by 2 or 3. To check gluing, compute the normalized basis change for a general invertible `2×2` matrix on C/O, with the scalar shifts obtained from the cross-product coefficients; the resulting form transforms in `Sym³V⊗(∧²V)^∨`. These changes compose because normalization is unique. Thus the local free algebras and their algebra maps glue, and the reverse index-form construction glues to its inverse. A global basis or a choice of principal ideal class is never used. The quotient C/O is locally free: at every residue field the nonzero vector1 extends to a basis, and a suitable minor remains invertible on a neighbourhood.

Over a characteristic-zero local field, `P≠0` corresponds under this equivalence to an étale cubic algebra. Its possible types are `F³`, `F×E` for quadratic E/F, and a cubic field (cyclic or non-Galois). Their automorphism orders are respectively 6, 2, 3, 1; retain the individual extension, not just its degree or discriminant valuation. Over `ℝ` only `ℝ³` and `ℝ×ℂ` occur, and over `ℂ` only `ℂ³` occurs.

For the adelic comparison, a rank-two O-lattice `Λ` in `F²` corresponds to its completed lattices `g_v O_v²`; changing the F-basis and the `O_v-bases` gives the double coset `GL₂(F)\GL₂(A_f)/∏GL₂(O_v)`. Recover `Λ` as `F²∩∏g_v O_v²`. Localizing this intersection recovers each given local lattice, by clearing the finitely many denominators and the Chinese remainder theorem; this proves the two constructions inverse. The determinant ideal identifies its Steinitz class. A finite sum over these classes, with each actual lattice's binary forms, is therefore the integral adelic orbit sum. A form and its stabilizer descend by the preceding gluing, so weights are `exactly1/|Aut_O C|`. The trace condition for the dual is imposed locally as `Tr(C)⊆3O`; the Fourier dual includes the different from the separate measure comparison and is not identified with the original lattice at places over 3.

API: `.projective_form_equiv_cubic_algebra`, `cubicOrbit.etaleEquiv`, `.local_type`, `.stabilizer_equiv_aut`, `.discriminant_ideal`, `.adelic_lattice_equiv`, `.trace_dual_comparison`.

**Checks.**

- `V=O²` recovers the displayed free multiplication table; `uv(u−v)` gives `O³` with automorphism order 6.
- `V=O⊕I` with I nonprincipal gives `C/O≅O⊕I⁻¹` and cannot be replaced by `O²`.
- The zero form gives the square-zero algebra `O⊕V^∨`, including in characteristics 2 and 3.
- At a place over 3, the trace-divisible lattice is a proper condition, rather than an automatic consequence of `rank 3`.

*Needs:* the preceding binary-cubic action and discriminant; AdelicAlgebraicGroups §3.4 finite class-number decomposition; existing finite projective modules and local module gluing. The same equivalence supplies the arithmetic coefficients and local orbit selectors in the following targets.

<a id="s5-6"></a>

### 5.6 Discriminant fibres and weighted cubic coefficients

For a number field `F`, let CubicOrders(F) be isomorphism classes of locally free rank-three commutative unital `O_F-algebras C` whose generic fibre is étale. Use the trace-pairing discriminant ideal `d(C)⊂O_F` and its positive absolute norm `D(C)`, with the archimedean signature `α`. The coefficient `cubicCoeff(F,α,n)` is the finite sum of 1/|Aut `C|` over `D(C)=n` and signature `α`; set it to 0 at `n=0`. The dual coefficient restricts the same sum by `Tr(C)⊆3O_F`. Neither maximality nor irreducibility is built in. These coefficients define the series below, without assuming that C is globally free.

Use `Algebra.trace` and Mathlib's basis trace discriminant. For a locally free order, the determinants of its local trace matrices glue to `d(C)`, since basis changes multiply them by a unit square. Compare with the determinant-line discriminant of the projective cubic form. Tau Ceti `relDiscr` applies to Dedekind-domain extensions and is used only for field maximal orders and the tower formula; a nonmaximal or reducible cubic order does not satisfy that domain hypothesis. The local order-discriminant ideal and its finite coefficient fibre are targets here. In the normalized free basis the traces of `1,ω,θ` are `3,b,−c`, so the trace-divisible condition is exactly `b,c∈3O_F`. Localization makes this independent of basis. The alternating binary-cubic pairing identifies the corresponding dual lattice; the separate Fourier-measure adapter retains the different and every place over 3.

API: `cubicCoeff.finite_fibre`, `.nonneg`, `.zero`, `.signature_partition`, `.orbit_sum`, `cubicTraceDual.local_iff`, `.isomorphism_invariant`. For finiteness with `D(C)≤B`, first classify the generic étale algebra as `F³`, `F×E` or a cubic field. Consume `NumberField.finite_of_discr_bdd` and the tower-discriminant identity for its field factors; embeddings over F add only finitely many choices. Every order lies in its maximal order with `D(C)=D(A)·Norm(index(C))²`. A bounded index has finitely many ideal possibilities and finite residue modules, hence finitely many sublattices. This proves finiteness for each `B`, not just for maximal orders. `Aut C` injects into the finite permutation group on the three geometric embeddings, so its order is positive and at most 6. The orbit equivalence supplies the inverse stabilizer weight exactly.

**Checks.**

- `O_F³` has `D=1` and weight `1/6`.
- The zero form gives a square-zero rank-three algebra with zero discriminant, outside CubicOrders(F), even though the algebra correspondence includes it.
- For `uv(u−v)`, `b=1,c=−1`, so its split algebra fails the trace-divisible condition at places over 3.
- For `u³−v³`, `b=c=0` and the trace condition holds.
- A nonprincipal projective component is retained by the same fibre and signature tests.

See [107][R107], §3.2 pp.11–13, definition before Proposition 3.7 and Lemma 3.9; [Wood][R106], §2 pp.1073–1074 for trace/discriminant comparison. *Needs:* the preceding cubic equivalence; `NumberField.finite_of_discr_bdd`; existing finite ideal norm fibres; finite-index lattice theory and the discriminant tower formula. No quantitative cubic count is inferred from qualitative Hermite finiteness.

<a id="s5-7"></a>

### 5.7 Uniform small-degree field-discriminant count

Fix `d≥1` and `ε>0`. There is `C(d,ε)>0`, chosen before F and `n`, such that for every degree-d number field F and integer `n≥1`, the number of F-isomorphism classes of extensions E/F with `[E:F]≤3` and `Norm(d(E/F))=n` is at most
`C(d,ε) n^(1/2+ε) |disc F|^(1/2+ε) h₂(F)`.
Here `h₂(F)=|Cl(F)[2]|`, including its identity. Counting subfields in a fixed algebraic closure gives the same bound up to a factor at most 3, absorbed in `C`. Summing `n≤X` gives the corresponding `O(d,ε)(X^(3/2+ε)|disc F|^(1/2+ε)h₂(F))` cumulative bound. The base field itself contributes at `n=1`.

The local theorem `relativeClassTorsion.bound` states: for an arbitrary number-field extension `[E:F]=r≥1` and integer `ℓ≥1`, `|ker(Nm:Cl(E)→Cl(F))[ℓ]| ≪_[E:ℚ],ε Norm(d(E/F))^(1/2+ε)|disc F|^((r−1)/2+ε)` (LOWW Lemma `2.5`, p.8). Its proof uses the class-group norm cokernel bound `≤r`, the class number formula and the fixed-degree subpower residue lower and upper bounds of AnalyticNumberTheoryPartI §2.31e (`dedekind_residue_subpower_lower` for the lower bound), together with `relativeRegulatorRatio.lower`, the uniform lower bound `R_E/R_F≳_[E:ℚ]1` for the relative unit covolume (rank-zero regulators use the convention `R=1`). The latter is the Friedman–Skoruppa regulator-ratio theorem cited in that proof, not an assertion that relative torsion is bounded independently of discriminants. These two bounds are local targets used by this count. For `E=F` the norm kernel is trivial and the regulator ratio is 1; both bounds retain this case. The norm cokernel, rather than the norm kernel, is bounded by `r`. Use `κ_E/κ_F≪_[E:ℚ],a D_E^a D_F^a`, substitute `D_E=Norm(d(E/F))D_F^r`, and choose `a>0` with `(r+1)a≤ε` before applying the regulator-ratio lower bound.

For the field count, quadratic class field theory leaves `h₂(F)` choices after local ramification data are fixed. Divisor and local-unit choices at fixed degree contribute `n^ε`, including primes over 2 and 3. An `S₃` extension has a quadratic resolvent of discriminant dividing `n`; its cyclic cubic closure over that resolvent is controlled by the displayed relative 3-torsion bound. Handle cyclic cubics by the absolute class-group bound and the same local data. Split `ε` among these finite divisor estimates. API: `smallDegreeFields.finite`, `.pointwise_bound`, `.summatory_bound`; the weighted ring-series bound below also uses the orders generating series, since this theorem counts fields only.

**Checks.**

- `n=0` is excluded; at `n=1` the identity extension is present.
- Cyclic and non-Galois cubic fields both occur and have different closure degrees.
- The reducible algebra `F³` is not counted as a field; it is included separately in cubic coefficients.
- The constant may depend on d and `ε` but not on `F`, its signature or `n`; qualitative Hermite finiteness would not establish this uniform bound.
- For `E=F` the norm kernel has one element and `R_E/R_F=1`; `ℓ=1` gives trivial torsion for every extension.

See [107][R107], Lemma 2.5 and proof p.8, Lemma 3.5 and proof p.11, Proposition 3.4 pp.10–11; its conventions use the norm of the relative discriminant. *Needs:* ClassFieldTheory global reciprocity and local conductor groups; AnalyticNumberTheoryPartI §§2.5, 2.31e for the class-number formula and both fixed-degree subpower residue bounds; relative norm exact sequence and the stated regulator-ratio bound.

<a id="s5-8"></a>

### 5.8 Binary-cubic local zeta integrals

For a local field `F`, take `V(F)=Sym³(F²)` and its twisted `GL2` action and discriminant P from the [§5.4][R348]. For a Schwartz–Bruhat test function `Φ` and fixed additive Haar measure dx, define the local integral over `P(x)≠0` by `∫Φ(x)|P(x)|F^s` dx on its proven integrability half-plane. For a nonarchimedean place with residue cardinal q and `dx(O_F^4)=1`, the shell density dk(U) is the measure of `{x∈U:ord P(x)=k}`; for `Φ=1_U` with `U⊆O_F⁴` the resulting shell series is `Σk≥0 dk(U)q^(−ks)`. For general `Φ` use `Φ-weighted` shell integrals, not unweighted masses. Zero-discriminant mass is recorded separately.

Import the invariant/action and local field normalization rather than redefining them. Restrict away from `P=0` before forming complex powers. Decompose an integral test function into disjoint measurable valuation shells and apply dominated summation.

- `LocalIntegral.integral`: The displayed Haar integral on the nondegenerate locus.
- `LocalIntegral.shellDensity`: Haar measure of the kth discriminant-valuation shell.
- `LocalIntegral.shell_sum`: For supported integral `Φ` with an absolutely integrable shell expansion, its integral equals the weighted shell sum.

**Checks.**

- The integral of `Φ=0` is 0.
- When `Φ` is supported where `|P|=1`, the integral is `∫Φ` dx, independently of `s`.
- For every prime p with `dx(Z_p⁴)=1`, at `s=0` the integral for `1_(Z_p⁴)` is 1: the zero set of the nonzero discriminant polynomial has Haar mass zero.
- For `U={x∈Z_p⁴:P(x)∈Z_p×}`, the integral for `1_U` is `(1−p⁻¹)(1−p⁻²)` for every complex s. The squarefree degree-three divisors on `P¹(F_p)` number `binom(p+1,3)+(p+1)(p²−p)/2+(p³−p)/3`; multiplying by `p−1` counts nonzero-discriminant coefficient tuples. Division by `p⁴` gives the stated density, including at p=2 and p=3.
- At `s=1`, replacing `1_(Z_p⁴)` by `1_(pZ_p⁴)` multiplies the integral by `p⁻⁸`: Haar measure contributes `p⁻⁴` and the degree-four discriminant contributes `p⁻⁴`.

Mirror these three cubic evaluations with `LocalIntegral` when its carrier is introduced.

See [107][R107], §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14; [105][R105], §3, definition (3.1) and Proposition 3.1, pp.37–38.

*Needs:* `B9`.

<a id="s5-9"></a>

### 5.9 Signature-refined cubic Shintani zeta functions

For a number field F and each archimedean cubic signature `α`, let `ξF,α(s)=ΣR |Aut R|^(−1)|Disc R|^(−s)`, over isomorphism classes of locally free rank-three `O_F-algebras` with nonzero discriminant and signature `α`. Reducible rings and nonmaximal orders are retained. Define the dual series by the same weights on rings satisfying 3|tr(t) for every `t`. The preceding arithmetic targets supply the actual isomorphism classes, discriminants, trace, automorphism groups and finite weighted fibres.

Regroup all cubic-order classes by discriminant norm with inverse stabilizer weights, retaining signatures and the trace-divisible dual. Use absolute convergence only on `Re s>1`; continue separately.

- `CubicShintani.coefficient`: The coefficient at m is the sum of reciprocal automorphism orders for signature `α` and discriminant norm `m`.
- `CubicShintani.series`: The weighted series `ξF,α` on `Res>1`.
- `CubicShintani.dual`: The trace-divisible subseries.
- `CubicShintani.dual_le`: For real `σ>1`, `0≤ξhatF,α(σ)≤ξF,α(σ)`.

**Checks.**

- The contribution of `O_F³` is weighted by1/6, not1.
- `O_F[ε]/ε³` has zero discriminant and contributes no term.
- A ring violating 3|tr(t) is omitted by the dual selector, while its ordinary coefficient is unchanged.

See [107][R107], §3.2 definition before Proposition 3.7 and dual definition in (3), p.12.

*Needs:* [§5.6](#s5-6); [§5.4][R348]; [AnalyticNumberTheoryPartI §2.5][R190]; `LSeries`.

<a id="s5-10"></a>

### 5.10 Local density and coefficient conventions agree

For a nonarchimedean characteristic-zero local field with residue size `q`, additive dx normalized by `dx(O⁴)=1` and dg normalized by `dg(GL2(O))=1`, an open orbit `α` with representative `xα`, `Δ=P(xα)` and stabilizer order `oα` satisfies `∫α Φ(x)|P(x)|^(s−1)dx = (1−q^(−1))(1−q^(−2)) |Δ|^s/oα` · `∫GL2(F) |det g|^(2s)Φ(g·xα)dg`, whenever either integral is absolutely convergent. The stabilizer orders are 6,2,3,1 for split, quadratic, cyclic cubic, and non-Galois cubic types. Local additive mass is not itself a global arithmetic count.

Match the discriminant first; `dx(O_F⁴)=1` fixes shell masses. Preserve orbit-dependent local constants and small-residue-characteristic source leaves.

For a compact-open integral local condition `U`, the normalized binary-cubic Haar integral uses shell masses dk(U); its arithmetic coefficient condition is the local cubic-algebra orbit selector with the same discriminant valuation and inverse stabilizer convention. LD.3 specialization is invoked only for its proved residue-characteristic range; factors at2 and3 are kept separately.

See [105][R105], Proposition 2.2 and (2.4), pp.36–38.

*Needs:* `B9`; [§5.10a][R350]; [§5.10b][R346].

<a id="s5-10a"></a>

**§5.10a Self-dual versus integral-normalized measures.** For the alternating binary-cubic pairing `[x,y]=x1y4−x2y3/3+x3y2/3−x4y1`, self-dual `dx=|3|^(−1)∏dxj`. If each coordinate self-dual measure gives O mass `q^(−e/2)`, then `dx(O⁴)=|3|^(−1)q^(−2e)`. With `dg(GL2(O))=1`, `bF=|3|^(−1)q^(−2e)(1−q^(−1))(1−q^(−2))`. Dividing by `dx(O⁴)` yields the integral-normalized constant; at residue characteristic 3 the `|3|` factor cannot be discarded before this conversion.

Compute the determinant of the alternating pairing relative to the coordinate self-dual measure. The two `1/3` entries contribute the factor `|3|^(-1)`. Multiply four coordinate lattice masses and then the normalized `GL2` integral factor, retaining the different exponent.

See [105][R105], (2.1)–(2.4), pp.37–38.

<a id="s5-10b"></a>

**§5.10b Binary cubic orbital Jacobian.** For an open orbit `α` and representative `xα`, the map `g↦g·xα` has covering degree `oα`. Its measure change satisfies `dx/|P(x)|=bF` dg along each sheet, with `bF` as in the local measure normalization. Consequently `∫αΦ dx=bF|P(xα)|/oα ∫G|det g|²Φ(g·xα)dg`.

Differentiate the orbit map in four `GL2` matrix coordinates and use its discriminant Jacobian. Account for the finite stabilizer covering, then evaluate the remaining Haar scalar on the Iwasawa normalization.

See [105][R105], (2.4), p.38.

<a id="s5-11"></a>

### 5.11 The selected adelic binary-cubic zeta integral

With the preceding binary-cubic representation and AA.2 quotient Haar measure, define `Z(Φ,s)=∫GL2(A_F)/GL2(F) |det g|^(2s) Σx∈V(F),Disc x≠0 Φ(g·x)` dg. Use the twisted action `(g·f)(u,v)=det(g)^(−1)f((u,v)g)`, so `Disc(g·f)=det(g)²` Disc `f`. Fix local measures and the dual pairing before invoking Poisson. Its decomposition into signature-weighted `ξF,α` times local zeta factors is a separate comparison with its exact arithmetic adapter request. The theta sum is invariant under `g↦gh` for `h∈GL2(F)`, by rational reindexing and the product formula. Transport AA.2 left-quotient measure by inversion; a left-quotient formulation instead uses `Φ(g⁻¹·x)` and `|det g|^(−2s)`.

Discriminant covariance and the product formula `|det h|_A=1` give right `GL₂(F)-invariance`. Invert AA.2's left-quotient measure. The local source leaves prove convergence and unfolding with exact factors.

- `CubicAdelic.integral`: Integrate the supplied descended theta function against the supplied right-quotient measure with determinant exponent `2s`. The local cubic correspondence, AL.0 and AA.2 adapters must certify the canonical `GL2` adelic quotient adapter.
- `CubicAdelic.linear`: `Z(aΦ+bΨ,s)=aZ(Φ,s)+bZ(Ψ,s)` when the summands are integrable.
- `CubicAdelic.theta_right_invariant`: A supplied equivalence reindexing the rational nonsingular theta summands proves invariance under rational right `translation`. The canonical adapter separately uses the product formula for the determinant norm.
- `CubicAdelic.inversion_kernel`: For positive determinant norm d with `d(g⁻¹)=d(g)⁻¹`, the inverted kernel is `d(g)^(−2s)·theta(g⁻¹)`. Transporting the quotient measure by inversion changes the right-quotient convention to the left-quotient convention.

**Checks.**

- `Z(0,s)=0`.
- With a unit quotient carrier, Dirac measure, determinant norm 2 and theta value 3, the actual integral is `3·2^(2s)`. The source adapter separately certifies `Disc(gx)=det(g)^2` Disc(x).
- Degenerate binary cubics are excluded from the theta sum and return only as separately analyzed singular terms after Poisson.
- Right rational `translation` leaves the theta integrand unchanged; inversion transports it to the left quotient with inverse action and determinant exponent `−2s`.

Its decomposition into signature-weighted `ξF,α` times local zeta factors is a separate comparison target.

See [107][R107], §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14; [103][R103], §2, p.511; §3, pp.515–516; definition before Theorem 4.1, p.516.

*Needs:* `B9`.

<a id="s5-12"></a>

### 5.12 Ordinary cubic continuation data

For an ordinary cubic series `ξ` initially defined on `Res>1`, continuation data consists of a meromorphic function agreeing with `ξ` there and an entire function C such that `C(s)=(s−1)(s−5/6)ξcontinued(s)` off the two poles. `C(1)` and `C(5/6)` determine the residues as `6C(1)` and `−6C(5/6)`. Existence and the order-one growth bound remain the separate original global theorems; the data constructor does not prove them.

Construct actual meromorphic functions with analytic pole clearance and agreement on/off the specified poles. Divide the removed-pole values by the other linear factor for residues; the rational benchmark checks signs.

- `CubicContinuation.clear_spec`: The actual entire clear function agrees with the pole-cleared continued series away from 1 and `5/6`.
- `CubicContinuation.residue_one`: `(s−1)ξcontinued(s)` tends to `6C(1)` at 1.
- `CubicContinuation.residue_five_sixths`: `(s−5/6)ξcontinued(s)` tends to `−6C(5/6)` at `5/6`.

**Checks.**

- For `ξ=R/(s−1)+T/(s−5/6)`, its benchmark clearance at 1 is R/6.
- The benchmark clearance at `5/6` is `−T/6`.
- Off both poles the benchmark clearance equals `(s−1)(s−5/6)` times the rational series.

See [105][R105], Theorem 6.2(i)–(ii), p.71; analytic output interface refined here.

*Needs:* `MeromorphicOn`; `AnalyticOnNhd`.

<a id="s5-13"></a>

### 5.13 Orders in a fixed étale cubic algebra

For an étale cubic F-algebra A, let an(A) count `O_F-orders` in `O_A` of relative index norm `n`. Then `Σn≥1 an(A)n^(−2s)=ζF(4s)ζF(6s−1)ζA(2s)/ζA(4s)` in a right half-plane. The exponent2s encodes discriminant multiplication by index².

Use the local order enumeration supplied by Datskovsky–Wright Theorem6.1. Multiply local factors in their common convergence domain. Retain the index-squared exponent; converting to an index Dirichlet variable requires substituting s/2.

See [107][R107], §3.2 Lemma 3.9, p.13; explicitly cites DW86 Theorem 6.1; [105][R105], Theorem 6.1 and proof, p.68; relation (6.4), p.69.

*Needs:* `B9`; `B6`; [§5.10a][R350].

<a id="s5-13a"></a>

**§5.13a Split local factor.** For DW standard `Φ1` and `u=ω(π)`, the split auxiliary integral `Iα(ω,Φ1)=(1+u)^2/(1−u)`. Its four disjoint valuation regions have masses `1/(1−u),u²/(1−u),u/(1−u),u/(1−u)`.

Divide the support of the auxiliary orbital integral into the four valuation regions of DW. Sum the two linear contributions and the constant and quadratic contributions against the geometric tail. Their numerator is `(1+u)^2`.

See [105][R105], Theorem 3.1 proof, pp.43–44.

<a id="s5-13b"></a>

**§5.13b Unramified quadratic local factor.** The standard quadratic auxiliary integral is `(1+u²)/(1−u)`: its two regions have t unit or valuation one, with integral basis coordinates for the unramified quadratic extension.

Use an integral basis of the unramified quadratic extension to separate the unit and valuation-one support pieces. Their norm valuations contribute 1 and `u^2`, with a common geometric tail 1/(1-u).

See [105][R105], Theorem 3.1 proof, p.44.

<a id="s5-13c"></a>

**§5.13c Ramified quadratic local factor.** The ramified quadratic auxiliary integral is `(1+u)/(1−u)`. In an integral basis `1,θ` with `θ a` uniformizer, the field norm valuation gives the two disjoint support regions used in the integral. This formulation does not require residue characteristic odd.

Choose the uniformizer integral basis and distinguish the two support regions by its norm valuation. Their contributions are 1 and u over the common tail. The discriminant Jacobian stays outside this calculation, so residue characteristic two is retained.

<a id="s5-13d"></a>

**§5.13d Unramified cubic local factor.** The unramified cubic auxiliary integral is `(1+u²+u⁴)/(1−u³)=(1−u+u²)/(1−u)`, from three valuation regions t of orders 0,1,2. The numerator records all three regions rather than an unjustified geometric shell law.

The integral basis splits support according to three successive uniformizer valuations. Sum the contributions `1,u^2,u^4` against the step-three tail. Multiply the two rational expressions by their denominators to prove the simplification.

See [105][R105], Theorem 3.1 proof, p.45.

<a id="s5-13e"></a>

**§5.13e Ramified cubic local factor.** For a ramified cubic extension with integral generator `θ a` uniformizer, the three support regions give `(1+u+u²)/(1−u³)=1/(1−u)`. `Norm(θ)` is a uniformizer in the base field, so this valuation computation retains wild discriminant factors in the separate orbital Jacobian.

Use the cubic uniformizer integral basis; its field norm has valuation one. The three support pieces contribute `1,u,u^2` against the step-three tail, which simplifies to 1/(1-u). Keep the wild discriminant in the preceding Jacobian.

<a id="s5-13f"></a>

**§5.13f Five local orbital Euler factors.** For `Φ0=1_(O⁴)`, an unramified quasicharacter `ω` and a DW standard representative, put `u=ω(π)`. Then `Zα(ω,Φ0)=ηα(u)/[(1−qu³)(1−u²)]`, with `η=(1+u)²,1+u²,1+u,1−u+u²,1` for types split, unramified quadratic, ramified quadratic, unramified cubic, ramified cubic respectively. A ramified `ω` gives zero. Characteristic zero permits residue characteristics 2 and 3; their discriminant and self-dual-measure factors remain in the preceding normalization.

Use the shell-removal differential identity and its integral evaluation from Propositions 3.1–3.2, pp.39–41: `Z(Φ0)=(1−u)/[(1−qu³)(1−u²)] I(Φ1)`. Insert the five auxiliary factors, one declaration per orbit type. Compact determinant-character integration gives zero for ramified `ω`.

See [105][R105], Theorem 3.1, p.42; Euler-product comparison Theorem 6.1, p.68.

<a id="s5-14"></a>

### 5.14 The selected quadratic double Dirichlet series

For odd `d>0` put `χd(n)=(d/n)` on odd `n`, retaining square factors of `d`. Let `L2(s,χdψ)=Σn` positive odd `χd(n)ψ(n)n^(−s)`, `ζ2(s)=(1−2^(−s))ζ(s)`, and `Z(s,w;ψ,ψ′)=ζ2(2s+2w−1)Σd` positive odd `L2(s,χdψ)ψ′(d)d^(−w)`. These are series on their stated convergence regions; their analytic continuations are separate functions. `quadraticDoubleSeries` is the defining series on native Dirichlet characters modulo eight. Row indices are `(ψ,ψ′)`, with `ψ′` varying fastest.

Build odd coefficient sequences with zero at0 and use the LSeries convention. Use the outer odd-d series only after absolute convergence is proved. Keep the factor at2 deleted in both `L2` and `ζ2`; continuation agrees on the convergence tube.

- `DoubleSeries.oddZeta`: `ζ2(s)=(1−2^(−s))ζ(s)`.
- `DoubleSeries.oddL`: The LSeries of the odd Jacobi-symbol coefficients `χdψ`.
- `DoubleSeries.series`: The displayed double series.
- `DoubleSeries.continued`: The meromorphic continuation selected by Lemma2; agree with series for `Res,Rew>1`.

**Checks.**

- For `Res>1`, `ζ2(s)=Σn` positive odd `n^(−s)`.
- `χ9(3)=0` although the squarefree-part character `χ1(3)=1`; square factors must not be erased.
- The `d=1` coefficient is `L2(s,ψ)`; the `ζ2` correction remains outside the d sum.

See [102][R102], Introduction, equation (1), p.356; §3 equation (29), p.362.

*Needs:* [§5.1][R357]; `jacobiSym`; `LSeries`; `riemannZeta`.

<a id="s5-15"></a>

### 5.15 Quadratic reciprocity matrix

Define the `16×16` matrix A indexed by `(ψ,ψ′),(ρ,ρ′)` by `A=1/16 Ση,ν∈{1,3,5,7} ψ(ν)ψ′(η)ρ(η)ρ′(ν)(−1)^(((η−1)/2)((ν−1)/2))`. This is the odd Jacobi reciprocity transform. The affine transformations and the Gamma reflection matrix are separate constructions.

Use the odd Jacobi reciprocity sign to interchange n and d in the absolutely convergent double sum. Insert finite character projections for the two residues modulo 8 to obtain the displayed matrix.

- `FunctionalSystem.A_entry`: A has the displayed finite 16-term entry sum.
- `FunctionalSystem.A_involution`: `A*A=I16`.
- `FunctionalSystem.A_symmetric`: `A.transpose=A`.

**Checks.**

- `A²=I16`.
- `A[(0,0),(0,0)]=1/2`.
- `A[(0,0),(1,1)]=−1/2`.

Let `α(s,w)=(w,s)`, `β(s,w)=(1−s,s+w−1/2)`. Set `Hψ,η=ψ(η)`, H `Hᵀ=4I`. The reciprocity matrix has entry `A(ψ,ψ′;ρ,ρ′)=1/16 Ση,ν∈{1,3,5,7} ψ(ν)ψ′(η)ρ(η)ρ′(ν)(−1)^(((η−1)/2)((ν−1)/2))`. For fixed `ψ` put `qψ,η=8` for `ψ2,ψ−2`; `q=1` for `ψ1,η≡1mod4` or `ψ−1,η≡3mod4`, and `q=4` otherwise. Let `κψ=0,1,0,1`; let `eψ,η=0` if `q≠1` and otherwise be +1 for `η=1,7` and `−1` for `η=3,5`. Define `rψ,η(s)=(q/π)^(1/2−s) Γ((1−s+κ)/2)/Γ((s+κ)/2) × (1−e·2^(−s))/(1−e·2^(s−1))`. Then `B(s)` is block diagonal with `ψ-block H diag(rψ,η(s))` Hᵀ/4. Quotients here are meromorphic germs, with removable singularities filled when proved, rather than values obtained by dividing by zero.

See [102][R102], §3 (31)–(35), pp.362–363; corrected conductor convention the normalization convention.

*Needs:* [§5.1][R357]; `jacobiSym.quadratic_reciprocity`; [§5.15a](#s5-15a).

<a id="s5-15a"></a>

**§5.15a Mod-eight character matrix orthogonality.** For `H_i,a=ψi(2a+1)`, `i,a∈{0,1,2,3}`, H `Hᵀ=HᵀH=4I`. Thus Hᵀ/4 gives the exact inverse between twist coordinates and residue coordinates.

Write the four character rows on the four odd residues. Distinct rows have dot product zero and each squared norm is four. The same calculation on columns proves the inverse matrix formula.

See [102][R102], Proof of Lemma 2, character projections in (31)–(35), pp.362–363.

<a id="s5-16"></a>

### 5.16 Primitive quadratic twist data

For `i=0,1,2,3` corresponding to `ψ1,ψ−1,ψ2,ψ−2` and `η=1,3,5,7`, define `q=8` for `i≥2`, `q=1` for `(i=0,η≡1mod4)` or `(i=1,η≡3mod4)`, and `q=4` otherwise. Define `κ=0,1,0,1`. The removed Euler value e is zero unless `q=1`; then `e=+1` for `η=1,7` and `e=−1` for `η=3,5`. These are the conductor factor, parity and value at 2 of the primitive quadratic character.

Compute the signed fundamental discriminant for the four twists and each odd residue class. Its power of two gives `q`, its sign gives parity, and its value at 2 gives the displayed deleted factor. Record the conductor-one cases separately.

- `FunctionalSystem.q`: The factor multiplying odd squarefree d in the primitive conductor.
- `FunctionalSystem.parity`: `κi=0,1,0,1`.
- `FunctionalSystem.twoValue`: Value at 2, zero when `q≠1`.

**Checks.**

- `q(0,η=1)=1`; `q(0,η=3)=4`.
- `q(2,η)=q(3,η)=8` and their parities are respectively 0 and 1.
- `e(0,η=1)=1`; `e(1,η=3)=−1`; `e(2,η)=0`.

See [102][R102], §2.1, (7)–(13), pp.358–359; (32)–(33), p.363.

*Needs:* [§5.1][R357]; `DirichletCharacter`.

<a id="s5-17"></a>

### 5.17 Imprimitive odd quadratic twist

For a positive odd integer d and twist i, define the Dirichlet character of modulus `8d` with natural-integer coefficient `χi,d(n)=(d/n)ψi(n)` for odd n and zero for even `n`. This character retains all deleted square-factor Euler factors. Its primitive conductor is identified by quadratic-primitive-adapter, not assumed to be `8d`.

Use Jacobi periodicity and multiplicativity on units modulo `8d`, extend by zero off units, and check its coefficient equals the prescribed odd symbol.

- `quadraticTwist.value`: Evaluation at a natural integer is the displayed odd Jacobi coefficient.
- `quadraticTwist.series_agrees`: Its Mathlib LFunction agrees with the odd Jacobi LSeries on `Re s>1`.
- `quadraticTwist.real_values`: Every value is `−1,0` or 1.

**Checks.**

- For `d=1,i=ψ1`, every odd coefficient equals 1.
- For `d=9,i=ψ1`, the value at 3 is zero.
- For `d=1,i=ψ2`, the value at 3 is `−1`.

See [102][R102], §2.1, definitions before (7) and formulas (7)–(13), pp.358–359.

*Needs:* [§5.1][R357]; `DirichletCharacter`; `jacobiSym`.

<a id="s5-18"></a>

### 5.18 Iterated continuation tubes

Define `B0={(x,y):y>1,x+y>3/2}`. Recursively `B(k+1)=Bk∪ak(Bk)`, where `ak(x,y)=(y,x)` for even k and `ak(x,y)=(1−x,x+y−1/2)` for odd `k`. Thus B0,..,B5 are the real bases R1,..,R6; their complex tubes allow arbitrary imaginary coordinates.

Use the two affine involutions to transport the preceding open base and take its union with that base.

- `Tubes.base_zero`: Membership in `B0` is `y>1` and `x+y>3/2`.
- `Tubes.base_step`: Bk+1 is the stated union with the alternating affine image.
- `Tubes.base_mono`: Bk is contained in Bk+1; every Bk is open.

**Checks.**

- (2,2) is in `B0`.
- `(−2,−2)` is in `B4` but not `B3`.
- (0,0) is not in `B5`.
- The finite dihedral orbit of the ball `x²+y²<5` does not cover (10,10): the generators fix (1/2,1/2) and preserve `Q(x,y)=(x−1/2)²+(x−1/2)(y−1/2)+(y−1/2)²`. Since `Q≤2(x²+y²)+3`, `Q<13` on the ball, whereas `Q(10,10)=1083/4`. Exterior `R6` charts are essential for arbitrary rectangles.

See [102][R102], Lemma 2 proof, pp.363–364.

*Needs:* [§5.2](#s5-2); [§5.3](#s5-3).

<a id="s5-19"></a>

### 5.19 The binary-cubic archimedean functional-equation matrix

At a real place use row/column signatures `F_v³` and `F_v×C`, with `c11=c22=(1/2)sin(2πs)`, `c12=(3/2)sin(πs)`, `c21=(1/2)sin(πs)`. At a complex place the single coefficient is `sin²(πs)sin(πs−π/6)sin(πs+π/6)`. Define `cαβ(s)` as the product over archimedean places. The degree is `n=r1+2r2`, not the number of places.

Apply the real/complex Fourier targets at `u=2s`, separate Gamma factors by reflection/duplication, convert Haar factors by the fixed Jacobian and tensor over archimedean places. This derives LOWW's sine matrix in the chosen signature order.

- `ArchMatrix.realEntry`: The specified real two-by-two sine matrix.
- `ArchMatrix.complexEntry`: The specified complex-place sine product.
- `ArchMatrix.entry`: Product of the archimedean entries for signatures `α,β`.

**Checks.**

- Each real entry vanishes at `s=1`.
- The complex entry vanishes to order2 at `s=1`.
- Every global entry vanishes to order at least r1+2r2 at `s=1`.
- At `s=1/2` the real off-diagonal entries are `3/2` and `1/2` in the stated order, and the complex entry is `3/4`.
- At `s=1/4` each real diagonal entry is `1/2`.
- For a field with one real and one complex place, the split-to-nonsplit product at `s=1/2` is `9/8`.

Mirror these nonzero evaluations with `ArchMatrix` when its carrier is introduced.

See [107][R107], §3.2 equation (3.1) and preceding complex/diagonal cases, p.12.

*Needs:* `Complex.cpow`; [§5.9](#s5-9); [§5.3d](#s5-3d); [§5.3e](#s5-3e).

<a id="s5-20"></a>

### 5.20 From arithmetic cubic orbits to analytic coefficients

The local projective cubic correspondence and stabilizer identifications transport the inverse-automorphism-weighted cubic-ring count to binary-cubic orbit coefficients, preserving discriminant, signature and the trace-divisible dual lattice. Over general `O_F`, nonprincipal locally free modules are included by the full adelic orbit interface.

Glue local multiplication on every projective/adelic lattice component. Match determinant-line discriminants before norms, trace divisibility locally and stabilizers with algebra automorphisms. Sum all components, without a free-module assumption.

See [107][R107], §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

*Needs:* [§5.9](#s5-9); [§5.4][R348]; [§5.5](#s5-5).

<a id="s5-21"></a>

### 5.21 The two cubic poles and their residues

For each signature `α`, there is an entire function `CF,α` agreeing off the poles with `(s−1)(s−5/6)ξF,α(s)`; it is entire of order at most 1. The two residues are specified in separate declarations. An entire cleared function retains nonzero pole limits instead of assigning totalized product values at those points.

Separate the two singular-orbit contributions in the global zeta argument. Match their normalizations with AF and BF in Proposition3.7. Remove both possible simple poles and retain the order-one growth input from Wright.

Let `ρF=Res_s=1 ζF(s)`, `rα` the number of split real cubic factors, `n=r1+2r2`. Set `AF=ζF(2)ρF/2^(r1+r2+1)`, `BF=3^(r1+r2/2)ζF(1/3)ρF/[6·2^(r1+r2)D^(1/2)]·[Γ(1/3)^3/(2π)]^n`. `ξF,α` has at most simple poles1 and5/6, with residues `AF(1+3^(−rα−r2))` and BF `3^(−rα/2)`. Its product with `(s−1)(s−5/6)` is entire of order1.

See [105][R105], Theorem 6.2(ii), p.71; LOWW Proposition 3.7(5), p.13.

*Needs:* `B6`; `B2`; [§5.12](#s5-12); [§5.21s](#s5-21s); [§5.21t](#s5-21t); [§5.21u](#s5-21u); [§5.21v](#s5-21v).

<a id="s5-21a"></a>

**§5.21a Adelic binary cubic convergence.** For `Res>1`, the right-quotient binary-cubic integral converges absolutely and locally uniformly in s and is a tempered distribution in `Φ`. Wright uses exponent `|det|^u` with `Reu>2`; here `u=2s`.

Use the compact-times-Siegel-set majorant of Lemma `3.1`, p.515. Cover nonsingular rational forms by `x1≠0` or `x2≠0`; apply the Schwartz lattice-sum bound of Lemma `1.1`. Integrate its explicit torus majorant for exponent `σ>2` with decay parameter `α>2nσ`.

See [103][R103], Theorem 4.1 and proof, pp.516–517.

<a id="s5-21b"></a>

**§5.21b Adelic orbital unfolding.** For `Res>1` and a Schwartz–Bruhat `Φ`, `Z(Φ,s)=Σ[x]∈GL2(F)\V(F)^ns |Stab(x)|^(−1)∫GL2(A_F)|det g|^(2s)Φ(g·x)dg`. All rearrangements are justified by absolute convergence. Integral lattice restrictions require all class-group components, as the S-integral comparison shows.

Partition nonsingular rational forms by rational `GL2` orbits. Absolute convergence permits exchanging the orbit sum and quotient integral. Lift each orbit integral to GL2(A) and divide by its finite stabilizer; the lattice comparison must sum all ideal-class components.

See [103][R103], Theorem 4.1 and Proposition 4.1, pp.516–518.

<a id="s5-21c"></a>

**§5.21c All class-group components in unfolding.** The S-integral adelic zeta decomposes over the full double quotient `G(A_S)\G(A)/G(F)`, not just the identity lattice. Each component uses its associated rank-two lattice, binary-cubic lattice and arithmetic stabilizer. This is the analytic interface needed for the local correspondence on nonprincipal locally free modules.

Choose double-quotient representatives and transport the rational-orbit sum into each lattice. Unfold each component with its own stabilizer and use the [§5.5](#s5-5) to identify all locally free cubic algebras. The local multiplication law and its projective gluing both belong to the preceding arithmetic target.

See [103][R103], Proposition 4.2, p.519; DW (6.8), p.73.

<a id="s5-21d"></a>

**§5.21d Entire truncated cubic integral.** Restrict the right-quotient integral to `|det g|≥1`. The resulting `Z+(Φ,u)`, with exponent `u`, is entire and a tempered distribution in `Φ`. On every compact u set its derivatives are dominated by the Siegel-set Schwartz majorant; `u=2s` is the arithmetic convention.

On the truncated determinant range choose a common Schwartz-decay exponent for the compact parameter set. The convergence proof majorant absorbs `log` powers from u derivatives. Parameter integration gives entireness; its seminorm bound gives continuity in `Φ`.

See [103][R103], Proposition 6.1 and proof, p.523.

<a id="s5-21e"></a>

**§5.21e Poisson decomposition of the global integral.** On `Reu>2`, additive Poisson on `F^4` gives `Z(Φ,u)=Z+(Φ,u)+Z+(Fourier Φ,2−u)+I(Φ,u)`, where I is the integral over `|det|≤1` of the Fourier-transformed singular theta sum minus the original singular theta sum, including the determinant Jacobian `|det|^(−2)`. The singular locus has exactly zero, triple-root and double-root rational orbits.

Apply Poisson to the full lattice sum, subtract the singular terms, and split at `|det|=1`. Invert g in the small-determinant integral and use the paired contragredient action. All sums and integrals are absolutely convergent on the initial right domain.

See [103][R103], Proposition 6.2, p.523.

<a id="s5-21f"></a>

**§5.21f Rank-one smoothing extracts the quotient integral.** For rapidly vertically decreasing entire `ψ` with `ψ(2)≠0`, smooth the rank-one `GL2` Eisenstein series by `integral_Rez=x0 ψ(z)E(z,g)/(w−z) dz/(2πi)`. For quotient-integrable F dominated by C `t(g)^c` with `c<2`, `(w−2)` integral `F(g)ℰ(ψ,w,g)dg` tends as w decreases to 2 to `ρ0ψ(2)` integral `F(g)dg`. Here E has constant term `t^z+t^(2−z)φ_F(z)`, `φ_F(z)=Z_F(z−1)/Z_F(z)`, and `ρ0=Res Z_F(1)/Z_F(2)`.

Apply the local Wright Fourier adapter below. Shift the smoothing contour across `z=2`; the residue is the constant `ρ0ψ(2)/(w−2)`. Lemmas6.4–6.5 put the smoothed function in the weighted space with seminorm `sup_(c,λ≥1) λ^(Re w−2)|ℰ(ψ,w,ca_λ)|`. Uniformly `for2<w≤M` the same seminorm `of(w−2)ℰ` is bounded, and the pointwise limit `isρ0ψ(2)`. The quotient majorant `λ^(−2)dλ/λ` makes every weight `λ^c` with `c<2` integrable. This proves dominated convergence with its actual quotient measure, not just pointwise residue convergence.

See [103][R103], Lemmas 6.1, 6.3, 6.5–6.6, pp.524–527.

<a id="s5-21g"></a>

**§5.21g Normalized rank-one Fourier bound.** Fix a number field F and Wright's right quotient, lower Borel, norm section and measures from the measure adapter. For `g=ka(t₁,t₂)n(x)`, put `t(g)=|t₁/t₂|_A^(1/2)`, and let `Z_F` denote the completed Dedekind zeta in Wright's normalization. The imported spherical Eisenstein series has constant term
`t(g)^z+t(g)^(2−z) Z_F(z−1)/Z_F(z)`
and residue `ρ0=Res_(v=1)Z_F(v)/Z_F(2)` at `z=2`. Its nonconstant part `E′` is holomorphic for `Re z>1` and, for every real `M>1` and every integer `ℓ≥2`, there is `C_(F,ℓ,M)` with
`|E′(z,g)|≤C_(F,ℓ,M) t(g)^(2−Re z−2ℓ)(1+|z|)^ℓ/(Re z−1)` for `1<Re z≤M`.
The constant depends on the strip: there is no field-uniform constant, no bound on the boundary `Re z=1`, and no constant uniform over the whole half-plane `Re z>1` in this statement. The smoothing argument below uses only contours and parameters in a fixed strip.

Unfold the unipotent constant term in the convergence chamber using the imported Weyl formula. The local spherical integrals give the ratio `Z_F(z−1)/Z_F(z)`, and the nonzero Fourier frequencies give `K(z,u)`. With the trace character, different `𝔇` and self-dual measures,
`K(z,u)=D_F^(−1/2) σ(z−1,id(u)𝔇) K_∞(z,u_∞)/ζ_F(z)`,
where `σ(v,𝔞)=Σ_(𝔟|𝔞)(N𝔟)^(−v)` for an integral ideal and 0 otherwise. At a real place,
`K_R(z,u)=2π^(z/2) Γ(z/2)^(−1)|u|^((z−1)/2) K_((z−1)/2)(2π|u|)`;
at a complex place,
`K_C(z,u)=2(2π)^z Γ(z)^(−1)|u|^(z−1) K_(z−1)(4π|u|)`.
Here `u≠0` and K is AL.0's canonical kernel `K_ν(c)=(1/2)∫₀∞ exp(−c(v+v⁻¹)/2)v^ν dv/v` for `c>0`. The real coefficient is `∫_ℝ (1+x²)^(−z/2)exp(−2πiux) dx`; the complex coefficient is `2∫_ℝ² (1+x²+y²)^(−z)exp(−4πi Re(u(x+iy))) dx dy`. The measures are respectively dx and `2 dx dy`. The complex `|u|` in the Bessel expression is ordinary magnitude; the local adelic norm is its square. Set `K_∞=∏_(v real)K_R(z,u_v) ∏_(v complex)K_C(z,u_v)`; this product includes a factor `2^(r₁+r₂)` and is the archimedean factor in `wrightE.nonconstant_fourier`. Evaluate these integrals first in the chamber by Gamma–Laplace and Fourier, then continue in `Re z>1`. The real normalization also follows from [DLMF 10.32.11](https://dlmf.nist.gov/10.32#E11), with half-order value [10.39.2](https://dlmf.nist.gov/10.39#E2). Repeated integration by parts in the archimedean Fourier integrals bounds `K_∞` by `|u|_∞^(−ℓ)(1+|z|)^ℓ`. For each fixed strip `1<Re z≤M`, the finite Euler factors give `|1/ζ_F(z)|≤ζ_F(Re z)≤1+C_F/(Re z−1)≤C_(F,M)/(Re z−1)`. The last constant depends on `M`; it is not a valid field-only bound on the full half-plane. Regroup the rational frequency sum by integral ideals, using the different and `|v|_A=|v|_∞/N(id(v))`. The remaining sum is `ζ_F(Re z−1+ℓ)ζ_F(ℓ)≤ζ_F(ℓ)²`. This proves the precise t exponent and the bound on each such vertical strip, which is the stated form. A constant uniform as `Re z→∞` cannot be obtained this way, since `ζ_F(σ)≪1/(σ−1)` fails for large `σ`; no consumer needs it. Compare Wright Lemma6.2 and the proof of Lemma6.3, pp.525–526; the constant term, residue and Bessel normalizations are Lemma6.1, pp.523–525.

API: `wrightE.constant_term`, `.nonconstant_fourier`, `.residue_two`, `.fourier_decay`, `.smoothed_weight_bound`. Checks: for the same torus input `t₁=2,t₂=1/2`, `sqrt(|t₁/t₂|)=2`, its square is 4, and squaring the raw ratio gives 16; mirror this with the adelic `t(g)` adapter. At `t=2,z=2` the first constant-term monomial is4, not2; writing `r=|t₁/t₂|` gives `r^(z/2)`, since `r=t²`. Over Q the Bessel argument is `2π|u|`; a complex place has `4π|u|`. The real boundary integral is `∫_ℝ (1+x²)⁻¹exp(−2πix) dx=πexp(−2π)`: at `z=2,u=1`, `2πK_(1/2)(2π)=πexp(−2π)`, using AL.0's half-order value. This nonzero Fourier coefficient is finite despite the constant-term pole at `z=2`. For `ℓ=2` and `Re z>1` the ideal sum converges; `ℓ=1` is excluded. The pole at `z=2` is in the constant term, while `E′` stays holomorphic. *Needs:* AutomorphicSpectralTheory §§1.2–1.5; AL.0 local Fourier and AL.2 rank-one Hecke theory; [§5.3b](#s5-3b); [§5.3a][R130]; [§4.5c][R327].

<a id="s5-21h"></a>

**§5.21h Zero-orbit contribution.** On the determinant-one quotient the smoothed singular zero contribution is `I0(Φ;ψ,w)=ψ(2)Φ(0)/(w−2)` for the principal character. For a nontrivial unitary character of determinant-one ideles it vanishes.

The zero theta term is constant on the quotient. Integrate the smoothed Eisenstein constant term using its residue normalization. A nontrivial unitary determinant character integrates to zero by character orthogonality.

See [103][R103], Proposition 6.3, p.528.

<a id="s5-21i"></a>

**§5.21i Compact averaging and Fourier.** For normalized Haar on the maximal compact `U_A` put `MωΦ(x)=integral_U ω(det k)Φ(k·x)dk`. This is again Schwartz–Bruhat, satisfies `Mω²=Mω`, transforms under k by `ω(det k)^(−1)`, and `Fourier(MωΦ)=M_(ω~ inverse)(Fourier Φ)`. Here `ω~` is the unitary component of `ω`, not complex conjugation of an arbitrary power.

Compactness permits the parameter integral in each Schwartz seminorm. Change k to kh in normalized Haar for equivariance and idempotence. The determinant Jacobian is 1 on `U_A`; the contragredient action and Fourier change of variables give the last identity.

See [103][R103], Lemma 5.1, p.521.

<a id="s5-21j"></a>

**§5.21j Singular restrictions and Hecke comparisons.** Construct the Schwartz–Bruhat restrictions `T1Φ(t)=Φ(0,0,0,t)` and `T2Φ(t)=integral_A Φ(0,0,t,u)du`. Apply the supplied rank-one Hecke families to `T1(MωΦ)` and `T2(MωΦ)`, with twists `ω~` inverse and `ω~`, to define `Σ1(ω,Φ,z)` and `Σ2(ω,Φ,z)`. The cubic residue distributions use `Σ1` at `z=2/3` and `Σ2` at `z=−1`. Prove the two partial-transform identities of Wright Proposition 5.2 for the binary-cubic alternating pairing.

Partial evaluation and partial integration preserve the Schwartz class. The continuation and residues of the one-dimensional families are consumed from AutomorphicLFunctionsAndLocalFactors AL.2's `n=1` Godement–Jacquet contract, with the Hecke normalizations in Exact supplier contracts. Fourier inversion on the alternating pairing supplies the local comparison identities.

**Checks.**

- For `Φ(x)=φ1(x1)φ2(x2)φ3(x3)φ4(x4)`, `T1Φ(t)=φ1(0)φ2(0)φ3(0)φ4(t)`; restriction retains the third coordinate's value at zero.
- On the same tensor, `T2Φ(t)=φ1(0)φ2(0)φ3(t) integral_A φ4(u)du`; the fourth coordinate contributes its integral rather than its value at zero.
- If `φ1(0)=0`, both restrictions vanish. If only `integral_A φ4=0`, `T2Φ` vanishes while `T1Φ` need not vanish.

See [103][R103], Propositions 5.1–5.3 and Lemma 5.2, pp.520–522. *Needs:* AutomorphicLFunctionsAndLocalFactors AL.0 and AL.2 at `n=1`; [§5.21i](#s5-21i).

<a id="s5-21k"></a>

**§5.21k Unfold the triple-root orbit.** The nonzero triple-root locus is parametrized by cosets in GL2(F)/B(F) together with a nonzero scalar `α` on the line represented by `(0,0,0,α)`. The Borel preserves that line but is not the stabilizer of each fixed nonzero vector. Summing over `α` makes the expression independent of the coset representatives. On the determinant-one quotient its smoothed integral unfolds to the rank-one Hecke expression in `Σ1(ω,Φ,(z+1)/3)` and `Σ1(ω,Φ,(3−z)/3)`, with the factor `1/3` from the cubic torus map. Compact averaging and rational reindexing preserve the chosen measures.

Parametrize triple-root lines by GL2(F)/B(F) and sum all nonzero rational scalars on each line. Borel rescaling permutes this scalar sum; it does not fix each vector. Unfold the rational orbit, telescope the `F×` sum against the idele quotient and substitute the cubic torus variable. The two Eisenstein constant terms give the two displayed Hecke parameters.

See [103][R103], Proposition 6.4 and proof, pp.528–530.

<a id="s5-21l"></a>

**§5.21l Triple-root contour residues.** Modulo a function holomorphic for `Rew>1`, the principal-character triple-root smoothed term is `ρ0ψ(2)Σ1(Φ)/[3(w−2)] + φ_F(3)ψ(3) integral(MΦ)(0,0,0,t)dt/(w−3)`. The `Σ1` symbol denotes the supplied Hecke family evaluated at `2/3`. Vertical contour bounds are those of the rank-one Hecke and smoothing inputs.

Move each Hecke-parameter contour into the strip where its only crossed poles are known. Collect the `z=2` Eisenstein residue and `z=3` Hecke-family residue; retain the cubic Jacobian `1/3`.

<a id="s5-21m"></a>

**§5.21m Unfold the double-root orbit.** The double-root orbit is represented by `(0,0,α,0)`. After unfolding and a Schwartz lattice majorant, the nonconstant Eisenstein contribution is holomorphic for `Rew>1`. The remaining two contours have Hecke parameters `−1−z` and `z−3`, exactly as in the last display of p.531.

Unfold the Borel orbit and its two determinant-one idele variables. Use Lemma `6.3` with decay exponent `N>1` and the Schwartz bound with `A>N[F:Q]` to dominate the nonconstant contribution. Telescope the rational `α` sum and substitute the remaining additive coordinate.

See [103][R103], Proposition 6.5 and proof, pp.530–532.

<a id="s5-21n"></a>

**§5.21n Double-root contour residues.** Modulo a function holomorphic for `Rew>1`, the principal double-root term is `ρ0ψ(2)Σ2(Φ)/(w−2) − φ_F(3)ψ(3)integral(MΦ)(0,0,0,t)dt/(w−3) + φ_F(4)ψ(4)integral(MΦ)(0,0,t,u)dtdu/(w−4)`. Here `Σ2` is evaluated at `−1`; these three residues use the same normalized measures as the triple-root term.

Shift the two unfolded Hecke contours and collect the poles at the displayed parameters. The first residue uses Sigma2(-1); the remaining residues are the one- and two-variable restriction integrals. Preserve the signs from opposite contour shifts and the common compact average.

See [103][R103], Proposition 6.5 conclusion, p.532.

<a id="s5-21o"></a>

**§5.21o Cancel the extra smoothing poles.** Fourier inversion makes the `z=3` and `z=4` residues cancel in the Fourier-minus-original singular difference. Its determinant-one quotient integral is `[Fourier Φ(0)−Φ(0)]/ρ0 + [Σ1(Fourier Φ)−Σ1(Φ)]/3 + Σ2(Fourier Φ)−Σ2(Φ)`, for the principal character.

Combine the three singular-orbit residue expressions and use the partial Fourier-inversion identities. Apply the smoothing residue limit; the cancelled `w=3,4` terms cannot enter the global radial integral.

See [103][R103], Propositions 6.6–6.7, p.532.

<a id="s5-21p"></a>

**§5.21p Integrate the singular radial powers.** For the principal exponent `u`, `I(Φ,u)=−1/2{[Fourier Φ(0)/(2−u)+Φ(0)/u]/ρ0 + [Σ1(Fourier Φ)/(5/3−u)+Σ1(Φ)/(u−1/3)]/3 + Σ2(Fourier Φ)/(2−u)+Σ2(Φ)/u}`, as meromorphic germs. The factor `1/2` comes from determinant scaling, and Fourier `dilation` has the fourth-power Jacobian.

Apply the two `dilation` homogeneities of Lemma `5.3` to the three summands. Integrate the resulting real powers on (0,1); use analytic continuation for the rational expression.

See [103][R103], Lemma 5.3, p.522; Proposition 6.8, p.532.

<a id="s5-21q"></a>

**§5.21q Adelic cubic continuation and equation.** The principal adelic `Z(Φ,u)` continues with only simple possible poles at `u=0,1/3,5/3,2` and obeys `Z(Φ,u)=Z(Fourier Φ,2−u)`. Its residue at 2 is `[Fourier Φ(0)/ρ0+Σ2(Fourier Φ)]/2` and its residue at `5/3` is `Σ1(Fourier Φ)/6`. These are adelic residues in variable `u`; conversion to `s=u/2` divides residues by 2.

The two truncated terms are entire; the rational singular expression lists the poles. Exchange `Φ` and Fourier `Φ` and replace u by `2−u`; Fourier inversion removes the sign by the rational scalar `−1`. Read the two rational-term coefficients, including the variable-change Jacobian.

See [103][R103], Theorem 6.1, pp.532–533.

<a id="s5-21r"></a>

**§5.21r Fourier transform of the integral lattice.** For self-dual binary-cubic pairing at `v`, `Fourier(1_(O_v^4))(x)=|3|_v^(−1)q_v^(−2e_v)·1_(O_v^4)(δ_v(x1,x2/3,x3/3,x4))`, where `δ_v` generates the local different in the source convention. This identifies the trace-divisible dual selector and retains the factor at v|3.

Compute the annihilator of the coordinate integral lattice under the alternating pairing and different-normalized additive character. Fourier of its indicator is its self-dual mass times the annihilator indicator. The annihilator conditions are `δ_v x1, δ_v x2/3, δ_v x3/3, δ_v x4∈O_v`; thus the middle coordinates of its support are multiples of `3δ_v^(−1)` and give the trace-divisible dual.

**Checks.** Over `ℚ₃` with `δ=1`, the support is `ℤ₃×3ℤ₃×3ℤ₃×ℤ₃`; `(0,1/3,0,0)` is outside it and its Fourier integral is zero. At the origin the transform is `|3|_v^(−1)q_v^(−2e_v)`, the lattice mass. At places prime to 3 with trivial different, the support is `O_v⁴`.

See [105][R105], §2 pairing and Fourier definition, pp.37–38, and §6 global test-function comparison, p.69; the support here is the annihilator for that pairing.

<a id="s5-21s"></a>

**§5.21s Cubic meromorphic continuation.** Each ordinary `ξF,α` extends meromorphically to C with at most simple poles at 1 and `5/6`. Its continuation agrees with the order-weighted series on `Res>1`.

Unfold the adelic continuation into all ideal-class components, apply the five local factors and finite dual-lattice Fourier comparison, and compare archimedean orbital integrals. Cancel the extraneous adelic factors, leaving the two arithmetic simple poles.

See [105][R105], Theorem 6.2(i), pp.71–72; LOWW Proposition 3.7(2), p.12.

<a id="s5-21t"></a>

**§5.21t Order-one bound for cubic clearance.** For each signature `α` and `ε>0` there is `Cε>0` such that the entire cleared cubic function satisfies `|CF,α(s)|≤exp(Cε(1+|s|)^(1+ε))` for all `s∈C`. This is order at most one, independent of the algebraic pole-clearance construction.

The cited theorem states order one for the exponent-u series; replacing u by `2s` preserves that order. A quantitative proof requires the vertical estimates for the truncated adelic distribution and archimedean factors; this quantitative input is Datskovsky–Wright Theorem `6.2(ii)`, p.71, proved in Wright’s `1982` Harvard thesis, *Dirichlet series associated with the space of binary cubic forms with coefficients in a number field*, Theorem `3.1`, and is not a consequence of merely removing two poles.

<a id="s5-21u"></a>

**§5.21u Cubic residue at one.** With `AF=ζF(2)ρF/2^(r1+r2+1)`, residue at 1 is `AF(1+3^(−rα−r2))`. Here `ρF` is the residue of `ζF` at 1 and `rα` counts split real cubic factors.

Compare the ordinary-series normalization with the adelic residue at `u=2`, including the factor one-half under `u=2s` and all local lattice masses. Insert the number-field zeta residue and sum the real signature weights, giving AF times the displayed factor.

See [107][R107], Proposition 3.7(2), p.12; DW Theorem 6.2(i), p.71.

<a id="s5-21v"></a>

**§5.21v Cubic secondary residue.** With `BF=3^(r1+r2/2)ζF(1/3)ρF/[6·2^(r1+r2)D^(1/2)]·[Γ(1/3)^3/(2π)]^n`, residue at `5/6` is `BF·3^(−rα/2)`. All discriminants are absolute norms.

Compare the adelic Sigma1 residue at `u=5/3` with the arithmetic parameter `s=5/6`. Evaluate the archimedean orbital integrals and finite discriminant factors in the fixed self-dual normalization; their product is BF and the remaining signature weight is `3^(-r_alpha/2)`.

See [107][R107], Definition before Proposition 3.7 and Proposition 3.7(2), p.12.

<a id="s5-22"></a>

### 5.22 Continued odd quadratic L-function

For positive odd `d`, put `L2continued(i,d,s)=DirichletCharacter.LFunction(χi,d,s)`. It agrees with the odd series on `Re s>1`, is meromorphic on `C`, and is entire when `χi,d` is nonprincipal. All mean estimates outside `Re s>1` use this continued function.

Apply the imported LFunction construction to the actual coefficient character; prove the series agreement by coefficient equality.

- `DoubleSeries.oddLContinuation_agrees`: Agreement with `oddL` in `Re s>1`.
- `DoubleSeries.oddLContinuation_meromorphic`: Meromorphic continuation on `C`.
- `DoubleSeries.oddLContinuation_entire`: Nonprincipal `χ` gives an entire L-function.

**Checks.**

- For `i=ψ1,d=1` and `s≠1`, the continuation equals `ζ2(s)`.
- For `i=ψ1,d=9` and `s≠1`, it equals `(1−3^(−s))ζ2(s)`.
- For `i=ψ1,d=1` its value at `−1` is `1/12`, whereas the naive totalized LSeries there is zero.

See [102][R102], §2.1, (7)–(16), pp.358–359.

*Needs:* [§5.17](#s5-17); `DirichletCharacter.LFunction`; `DirichletCharacter.LFunction_eq_LSeries`.

<a id="s5-23"></a>

### 5.23 Local quadratic reflection ratio

Define the meromorphic ratio `r_i,η(s)=(q/π)^(1/2−s)Γ((1−s+κ)/2)/Γ((s+κ)/2)·(1−e2^(−s))/(1−e2^(s−1))`. On `Res<1` the numerator Gamma function and the Euler denominator have no poles or zeros, and reciprocal Gamma fills its denominator poles with zero. This determines an analytic function on that half-plane; the raw totalized quotient is used only where its factors are defined.

Use the primitive completed functional equation with its exact conductor and parity. On `Re s<1` the numerator Gamma arguments have positive real part and the Euler denominator cannot vanish. Use entire reciprocal Gamma to fill the other singular values.

- `FunctionalSystem.localRatio_formula`: `r_i,η(s)=(q/π)^(1/2−s)Γ((1−s+κ)/2)/Γ((s+κ)/2)·(1−e2^(−s))/(1−e2^(s−1))` off Gamma poles and Euler zeros.
- `FunctionalSystem.localRatio_analytic`: `r_i,η` is holomorphic on `Res<1` after reciprocal-Gamma filling.
- `FunctionalSystem.localRatio_twist_two`: For `i=2`, `r=(π/8)^(s−1/2)Γ((1−s)/2)/Γ(s/2)`, independent of `η`.

**Checks.**

- For `i=0` or 2, `r_i,η(0)=0`.
- For every `η`, `r_(ψ2,η)(1/2)=1`.
- For every `η`, `r_(ψ−2,η)(0)=√8/π`; the conductor is 8 and `Γ(1/2)=√π`. Mirror these evaluations in Lean with the `FunctionalSystem.localRatio` construction.

See [102][R102], (32)–(34), pp.362–363.

*Needs:* [§5.16](#s5-16); `Complex.Gamma`; `Complex.cpow`.

<a id="s5-24"></a>

### 5.24 The cubic global matrix functional equation

Write `n=[F:Q]`, `D=|Disc F|`. Then `ξF,α(1−s)=[3^(6s−2)π^(−4s)Γ(s)²Γ(s−1/6)Γ(s+1/6)]^n D^(4s−2) Σβ cαβ(s) ξhatF,β(s)`. This is LOWW Proposition `3.7(3)`, obtained from the original adelic equation and the stated local Fourier comparisons; the nonarchimedean local distribution theorem is Datskovsky–Wright Theorem `3.2`, p.47, proved from Igusa `1984`, Theorem 1.

Apply PVS Poisson with singular terms and the local Fourier identities. Collect archimedean, Gamma and discriminant factors; identify the trace-divisible dual coefficients, preserving the distinct dual series.

This is the global theorem of LOWW Proposition3.7(3); its nonarchimedean input is the local distribution theorem of Datskovsky–Wright Theorem3.2.

See [107][R107], §3.2 Proposition 3.7(3), pp.12–13.

*Needs:* `B2`; [§5.19](#s5-19); `Complex.Gamma`; [§5.20](#s5-20); [§5.24a](#s5-24a).

<a id="s5-24a"></a>

**§5.24a Archimedean Fourier comparison.** After exponent `u=2s`, the real orbital Fourier matrix is the common factor `3^(6s−3)π^(−4s)Γ(s)^2Γ(s−1/6)Γ(s+1/6)` times the real sine matrix; its real off-diagonal split-to-nonsplit entry carries the factor 3. The complex scalar is the squared gamma normalization times the four-sine factor. Transport these self-dual local equations to the integral-normalized arithmetic series before collecting the global D and 3 factors.

The [§5.3d](#s5-3d) supplies Theorem4.1 in the stated sign basis. The [§5.3e](#s5-3e) uses the Gaussian polynomial-differential recurrence, a period-two entire quotient and its finite Fourier support; Theorem4.2 fixes the scalar. The nonarchimedean distribution equation is the separate local theorem of Datskovsky–Wright Theorem3.2, p.47. Use reflection and multiplication formulas to express the arithmetic-normalized sine factors.

See [105][R105], DW Theorems 4.1–4.2, pp.48–51; LOWW (3.1) and Proposition 3.7(3), pp.12–13.

<a id="s5-25"></a>

### 5.25 Pole-cleared quadratic L-function

Define `H_i,d(s)=(s−1)L2continued(i,d,s)` away from 1 and fill its value at 1 by the residue. If `χi,d` is principal that value is `product_p|8d(1−p^(−1))`; otherwise it is zero. The resulting `H_i,d` is entire. This is the function in the pole-aware strip moment.

Use the nonprincipal entire continuation; for the principal character, its Euler-deleted `ζ` function has the stated residue. Fill the removable singularity by that residue.

- `DoubleSeries.poleClearL_off_one`: Off 1, `H_i,d(s)=(s−1)L2continued(i,d,s)`.
- `DoubleSeries.poleClearL_entire`: `H_i,d` is entire on `C`.
- `DoubleSeries.poleClearL_one`: Its value at 1 is the displayed principal residue, or zero for a nonprincipal character.

**Checks.**

- `H_ψ1,1(1)=1/2`.
- `H_ψ1,9(1)=1/3`.
- `H_ψ2,1(1)=0`.

See [102][R102], §2.1, (13)–(16), pp.358–359; principal ζ2 term in (29), p.361.

*Needs:* [§5.22](#s5-22); `DirichletCharacter.LFunction_changeLevel`.

<a id="s5-26"></a>

### 5.26 Quadratic reflection matrix

Define `B(s)` blockwise: `B(s)[(i,j),(i,k)]=1/4 Ση ψj(η)r_i,η(s)ψk(η)`; blocks with different i vanish. The matrix is a meromorphic matrix, with removable values filled. The local ratios use the displayed primitive conductor table, not conductor 8 in every twist.

Apply the Hadamard character transform, multiply in residue coordinates by the local reflection ratios, and apply the inverse transform. Separate twist blocks and fill removable singularities before evaluating matrix entries.

- `FunctionalSystem.B_off_denominators`: The same-i block is H `diag(r_i,η)Hᵀ/4` off all raw denominators.
- `FunctionalSystem.B_cross_block`: `B(s)[(i,j),(k,l)]=0` when `i≠k`.
- `FunctionalSystem.B_analytic_left`: Every entry of B is holomorphic on `Res<1`, including filled values.

**Checks.**

- The `ψ2` block is `(π/8)^(s−1/2)Γ((1−s)/2)/Γ(s/2)` times `I4`.
- The `ψ1` block at `s=0` is zero.
- `B(0)[(1,0),(1,0)]=4/(3π)`, so the odd block does not vanish.

See [102][R102], (32)–(35) and following paragraph, pp.362–363.

*Needs:* [§5.23](#s5-23); [§5.1][R357]; [§5.15a](#s5-15a).

<a id="s5-27"></a>

### 5.27 The degree-dependent zero at the origin

For `n≥2`, `ξF,α(0)=0`. More precisely the functional equation gives vanishing order at least `n−1` at0, since each dual series has at most a simple pole at1.

Multiply the order-n archimedean zero by the possible order-one dual pole. The global prefactor is a local unit at1. Replace s `by1−s`; for `n=1` no forced zero is claimed.

See [107][R107], §3.2 Lemma 3.8 and proof, p.13.

*Needs:* `B6`; `B2`; [§5.19](#s5-19); [§5.20](#s5-20); `Complex.Gamma`; [§5.24][R395]; [§5.21][R396]; [§5.9](#s5-9); [§5.12](#s5-12); [§5.27a](#s5-27a); [§5.21s](#s5-21s); [§5.27b](#s5-27b); [§5.27c](#s5-27c); [§5.27d](#s5-27d).

<a id="s5-27a"></a>

**§5.27a Absolute convergence of cubic Shintani series.** Every `ξF,α(s)` and dual series converges absolutely on `Res>1`.

Start with the absolute adelic convergence theorem for `Re s>1`, rather than the coarser uniform coefficient estimate which only proves convergence for `Re s>3/2`. Apply the absolutely convergent orbit unfolding and the all-ideal-class lattice comparison. Choose nonnegative local test functions whose archimedean orbit support isolates the required signature and whose local orbital factors are nonzero. The resulting positive orbital sum is the Shintani series times finite local factors. The dual trace-divisible lattice restricts this nonnegative sum, so it has the same convergence half-plane. This is the convergence argument of DW §6 and the LOWW statement.

See [107][R107], §3.2 Proposition 3.7(1), p.12; [105][R105], §6, Theorem 6.2 and preceding orbital/Euler-product comparison, pp.68–71.

<a id="s5-27b"></a>

**§5.27b Archimedean coefficients vanish to degree order.** Every `cαβ(s)` vanishes to order at least `n=r1+2r2` at `s=1`; each real factor has order≥1 and each complex factor has order2.

Expand `sin(πs)` and `sin(2πs)` at1. At a complex place only the squared sine vanishes; the shifted sine factors are nonzero. Add orders under the finite product.

See [107][R107], §3.2 equation (3.1), p.12, and proof of Lemma 3.8, p.13.

<a id="s5-27c"></a>

**§5.27c The global prefactor is a unit at one.** The gamma/discriminant prefactor in the cubic functional equation is holomorphic and nonzero at `s=1`, since its gamma arguments are1,5/6 and7/6.

Check all three gamma arguments are positive at1. Use gamma holomorphy and nonvanishing there. Use positive-base exponential powers for the discriminant `and3/π` factors.

See [107][R107], §3.2 Proposition 3.7(3), p.12, and proof of Lemma 3.8, p.13.

<a id="s5-27d"></a>

**§5.27d Simple poles of the dual cubic Shintani series.** For each number field F and archimedean signature `α`, the dual `ξhatF,α` has a meromorphic continuation with no poles except possible simple poles at 1 and `5/6`. In particular `(s−1)ξhatF,α(s)` is holomorphic near 1.

Here Use the trace-divisible dual series of cubic-shintani-series, with the LOWW normalizations.

Use the original DW Theorem `6.2` decomposition with the trace-divisible finite test function identified by local-finite-fourier-dual. The same truncated-entire and singular-residue argument bounds pole orders by one; coefficient positivity alone does not imply this.

See [107][R107], §3.2, Proposition 3.7(4), p.13.

<a id="s5-28"></a>

### 5.28 Pole-aware cubic convexity bound

For `−1/2≤σ≤3/2`, `|t|≥1` and `ε>0`, `ξF,α(σ+it)≪ε,n h2(F)D^(7/2−2σ+ε)(1+|t|)^(2n(3/2−σ)+ε)`. Apply Phragmén–Lindelöf to the pole-cleared function. The displayed inequality without pole exclusion is false at `s=1` and5/6; the bound is asserted only on this pole-free range.

Use the positive-half-plane estimate at `σ=3/2+ε` and the reflected left estimate. Clear `(s−1)(s−5/6)` before interpolation and divide only where bounded away from both poles. Apply Mathlib `PhragmenLindelof.vertical_strip` after the usual holomorphic power and exponential weights normalize the two boundary bounds. The order-one bound of §5.21t supplies its growth hypothesis: choose any `0<c<π/(b−a)` on the enlarged strip, so `exp(C(1+|t|)^(1+ε))` is dominated by `exp(B exp(c|t|))`. Retain the same `h2` factor on both edges.

See [107][R107], §3.2 Lemma 3.11 and proof, p.14; restricted to |t|≥1 to avoid poles.

*Needs:* [§5.13](#s5-13); [§5.9](#s5-9); [§5.7](#s5-7); [§5.24][R395]; [§4.3b](#s4-3b); `PhragmenLindelof.vertical_strip`; [§5.21t](#s5-21t); [§5.21][R396]; [§5.28a](#s5-28a); [§5.28b](#s5-28b).

<a id="s5-28a"></a>

**§5.28a The weighted cubic-coefficient bound.** For every `ε>0` and real `σ>3/2`, `ξF,α(σ)≪[F:Q],σ,ε D^(1/2+ε)h2(F)`. Prove the separate split/quadratic-factor and cubic-field contributions using LOWW Lemma3.5 and the orders formula; the field-count input is the [§5.7](#s5-7) of this layer.

Decompose cubic étale algebras into split, quadratic-factor and cubic-field types. Use the appropriate discriminant/count bound for each. Sum the order-index factor with `σ>3/2` and retain h2(F).

See [107][R107], §3.2 Lemma 3.10 and proof, pp.13–14.

<a id="s5-28b"></a>

**§5.28b Reflected vertical bound from the matrix equation.** For `σ<−1/2` and `|t|≥1`, the functional equation gives `ξF,α(σ+it)≪ε,n,σ h2(F)D^(5/2−4σ+ε)(1+|t|)^(n(2−4σ)+ε)`, using the right-half-plane dual bound. Constants depend on the fixed real strip.

Bound the dual by the ordinary positive-coefficient series `at1−σ>3/2`. Apply §4.3b to the four Gamma factors and the elementary sine exponential bound. Per real place their exponents cancel as `e^(−2π|t|)e^(2π|t|)`; per complex place the squared Gamma product cancels the four-sine growth. The remaining power is `|t|^(n(2−4σ))`. Multiply the functional-equation factor `D^(2−4σ)` by the right-half-plane bound `h2(F)D^(1/2+ε)`. The combined exponent is `5/2−4σ+ε`; retain the stated height power.

See [107][R107], §3.2 proof of Lemma 3.11, left-boundary estimate, p.14; combine Proposition 3.7(3) with Lemma 3.10.

<a id="s5-29"></a>

### 5.29 Quadratic large sieve and primitive real-character moment

For every `ε>0` there is `C_ε>0` such that for positive integers M,N and arbitrary complex coefficients `a₁,…,a_N`,
`Σ_{m≤M, m odd squarefree} |Σ_{n≤N, n odd squarefree} a_n (n/m)|² ≤ C_ε (MN)^ε (M+N) Σ_{n≤N, n odd squarefree}|a_n|²`.
The symbol is the Jacobi symbol, extended by zero when numerator and denominator are not coprime; `m=1` and `n=1` are included. The associated primitive-real-character form, for `Q,N≥1`, is
`Σ_{χ primitive real, cond χ≤Q} |Σ_{n≤N} μ²(n)a_nχ(n)|² ≤ C_ε (QN)^ε(Q+N)Σ_{n≤N}μ²(n)|a_n|²`.
For unrestricted coefficients replace the inner polynomial by `Σa_nχ(n)` and the final squarefree diagonal by `Σ_{1≤n₁,n₂≤N, n₁n₂ a square}|a_n₁a_n₂|` (Corollary `2`); the same `(QN)^ε(Q+N)` factor applies. The constant is uniform in the coefficients and the two cutoffs. This is a family estimate, not an individual cancellation assertion. The carrier is Mathlib's existing Dirichlet characters, with realness `χ²=1` and primitivity stated explicitly.

The proof target is Heath-Brown's reciprocity/duality recursion: dyadically localize, use quadratic reciprocity to interchange the two squarefree variables, apply Poisson to the smoothed character sum, and iterate the resulting norm bound until its exponents reach M+N (Theorem 1, §§2–9). For Corollary 1, partition odd discriminants by residue modulo 4 or 8 and separate the 2-adic twists; the four primitive real characters at conductors 1,4,8 are the finite parity data. For non-squarefree coefficients use Corollary 2's square-pair convolution, not this squarefree inequality without a correction. The fourth moment below is an additional theorem obtained by the smoothed `L²` functional equation, not by extending an individual Dirichlet series into the critical strip.

**Checks.**

- With `a₁=1` and all other coefficients zero, the left side is exactly the number of odd squarefree `m≤M`.
- With `M=1,N=3,a₁=1,a₃=−1` it is 0, whereas `a₁=a₃=1` gives 4; arbitrary complex signs must be retained before squaring.
- For `m=n=3` the symbol is 0; replacing it by a unit would change the sum.
- The principal conductor-one character is present in the finite polynomial bound, but excluded from the pole-sensitive fourth moment at `s=1`.
- For `σ=1/2` the fourth-moment bound has size `Q(1+|t|)`, up to `ε` powers; `σ=1` gives Q+1. No asymptotic fourth-moment formula at the critical line is asserted.

See [Heath-Brown, A mean value estimate for real character sums][R108], Theorem 1 and Corollary 1 p.237, Corollary 2 and Theorem 2 p.238, proof of Theorem 1 §§2–9 pp.239–267, fourth-moment proof §10 pp.267–269. API: `quadraticLargeSieve.odd_squarefree`, `.primitive_real`, `.square_pair_correction`; `quadraticFourthMoment`. The headline Lean statements are `quadratic_large_sieve` and `quadratic_fourth_moment`; the latter allows any finite subset of this primitive real family. *Needs:* Mathlib `jacobiSym`, quadratic reciprocity and finite Dirichlet characters; Fourier/Poisson from AutomorphicLFunctionsAndLocalFactors AL.0; the primitive functional equation and the imported Gamma bounds.

<a id="s5-30"></a>

### 5.30 Meromorphic continuation and the three polar hyperplanes

For each twist pair i,j there is a unique entire function Eij on `C²` whose value on `Res>1`, `Rew>1` is `P(s,w)Zij(s,w)`, where `P=(s−1)(w−1)(s+w−3/2)`. The meromorphic continuation is represented off `P=0` by Eij/P. Values of a totalized quotient on `P=0` are not used. Functional equations are germ identities; polynomial vertical growth is a separate lemma. `quadraticDoubleSeries_continuation` states the entire clearance, both matrix equations and polynomial growth for all sixteen twist pairs, using `quadraticReciprocity` and the entire numerator and denominator factors `quadraticReflectionFactors`; `quadraticReflection` is the reflection block after multiplication by its common denominator.

Remove the three candidate hyperplanes by multiplication. Fill the tube hole using the preceding extension. Recover the polynomial bound and use uniqueness to transport both equations.

For each pair of twists there is a continuation agreeing with the series in the initial tube such that `(s−1)(w−1)(s+w−3/2)Z(s,w)` is entire on `C²`. In every bounded real strip it has polynomial growth in (1+|Ims|)(1+|Imw|). The two matrix functional equations hold as meromorphic identities; no scalar Euler product or multiple-zeta-value identification is asserted.

See [102][R102], §3 Lemma 2, equation (27), p.361; proof pp.361–364.

*Needs:* `AnalyticOnNhd`; `jacobiSym`; [§5.14](#s5-14); `zeta_eq_tsum_one_div_nat_cpow`; `LSeries`; [§5.16](#s5-16); `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`; `DirichletCharacter.LFunction_changeLevel`; [§5.1][R357]; [§5.22](#s5-22); [§5.17](#s5-17); `DirichletCharacter`; [§5.29](#s5-29); [§5.25](#s5-25); [§5.15](#s5-15); [§5.2](#s5-2); [§5.26](#s5-26); [§5.3](#s5-3); [§5.18](#s5-18); [§5.23](#s5-23); [§4.3b](#s4-3b); [§5.30a](#s5-30a); [§5.30b](#s5-30b); [§5.30c](#s5-30c); [§5.30d](#s5-30d); [§5.30e](#s5-30e); [§5.30f](#s5-30f); [§5.30g](#s5-30g); [§5.30h](#s5-30h); [§5.30i](#s5-30i); [§5.30j](#s5-30j); [§5.30k](#s5-30k); [§5.30l](#s5-30l); [§5.30m](#s5-30m); [§5.30n](#s5-30n); [§5.30o](#s5-30o); [§5.30p](#s5-30p); [§5.30q](#s5-30q); [§5.30r](#s5-30r); [§5.30s](#s5-30s); [§5.30v](#s5-30v); [§5.30w](#s5-30w); [§5.30x](#s5-30x); [§5.30y](#s5-30y); [§5.30z](#s5-30z); [§5.30aa](#s5-30aa); [§5.30ab](#s5-30ab).

<a id="s5-30a"></a>

**§5.30a Normal convergence in the first tube.** On each compact `K⊂{Res>1,Rew>1}`, the odd (n,d) summands have a summable majorant `n^(−σ0)d^(−ν0)` with `σ0,ν0>1`. Consequently their double sum is normally convergent on `K`.

Take the minima of the two real parts on the compact set; both exceed one. Bound every character by one and dominate the double sum by the product of two convergent positive Dirichlet series. The bound is independent of the point in the compact set.

See [102][R102], Definition (1), p.356; Lemma 2 proof, p.361.

<a id="s5-30b"></a>

**§5.30b Absolute convergence in the initial double tube.** For `Res>1` and `Rew>1` the odd n,d double sum is absolutely convergent, locally uniformly on compact sub-tubes; hence it may be summed in either order.

Bound both characters by1. Dominate by `ζ(Res)ζ(Rew)`; the correcting `ζ2` factor has `Re(2s+2w−1)>1`. Use compact positive margins for locally uniform domination.

See [102][R102], §3 proof of Lemma 2, initial expansion (28), pp.361–362.

<a id="s5-30c"></a>

**§5.30c Unique odd squarefree factorization.** Every positive odd d is uniquely `d0k²` with `d0` positive odd squarefree and k positive odd. The Jacobi symbol `χd` equals `χd0` away from prime divisors of k and vanishes at those prime divisors.

Split each prime exponent into its parity and an even part. Unique factorization gives the squarefree component and square component, retaining oddness. The Jacobi factors for even exponents are one away from their prime and zero at it.

See [102][R102], §2.1, before (7), p.358; (29), p.361.

<a id="s5-30d"></a>

**§5.30d Quadratic conductor and root number.** For each odd squarefree `d0` and twist i identify `χd0ψi` with its primitive real character of conductor `q_i,η d0`, parity `κ_i` and root number +1. Removed prime-2 and square-factor Euler factors agree with `L2`. Here `η=d0` mod8, q and `κ` are exactly the table defining the reflection block; principal cases use meromorphic germs.

Identify the signed fundamental-discriminant character with the primitive character. Prove the conductor, parity and positive Gauss-sum root number, then apply the completed functional equation and change-level formula. These arithmetic/Gauss-sum adapters are steps of this target.

See [102][R102], §2.1, (7)–(13), pp.358–359.

<a id="s5-30e"></a>

**§5.30e Nonzero squarefree-series denominator.** For `Re(s+2w)>1` the Euler product of `L2(s+2w,χd0ψi)` is nonzero. On any closed sub-half-plane `Re(s+2w)≥1+δ`, its reciprocal is bounded by `ζ(1+δ)`, uniformly in `d0` and the twist.

Use the absolutely convergent Euler product on the strict right half-plane. Each reciprocal local factor has modulus at most `1+p^(-sigma)`, whose product is at most zeta(sigma). This proves nonvanishing and the compact sub-half-plane uniform bound.

See [102][R102], Lemma 2 proof, (29), p.361.

<a id="s5-30f"></a>

**§5.30f Separating square factors of the discriminant index.** Each odd d has a unique `d=d0 d1²` with `d0` squarefree. In the initial tube, `Z=ζ2(2s+2w−1)ζ2(2w)Σd0` odd squarefree `L2(s,χd0ψ)ψ′(d0)/(d0^w L2(s+2w,χd0ψ))`.

Factor d uniquely prime by prime. Removing primes dividing `d1` from the inner L-series gives the finite missing Euler factors. Sum each geometric square-factor series absolutely to obtain the quotient in `(29)`.

See [102][R102], §3 equation (29), pp.361–362.

<a id="s5-30g"></a>

**§5.30g Quadratic fourth moment.** Consume the [§5.29](#s5-29) just stated.  For fixed `σ∈[1/2,1]` and `ε>0`, `Σχ` nonprincipal primitive real,condχ≤Q `|L(σ+it,χ)|⁴ ≤ Cσ,ε {Q+(Q(1+|t|))^(2−2σ)}(Q(1+|t|))^ε`, for `Q≥1` and `t∈R`. The conductor-one principal character is treated separately.

Use the quadratic large sieve on the smoothed Dirichlet polynomial for `L²`. Bound the reflected contour using the primitive functional equation; bootstrap the dyadic fourth moment and treat `σ=1/2` by `σ=1/2−ε`.

See [109][R109], Theorem 2, p.238; §10, pp.267–269.

<a id="s5-30h"></a>

**§5.30h Primitive quadratic first moment.** On `σ=1/2`, Hölder and the `O(X)` count of primitive real characters of conductor≤8X give `Σd0≤X,d0` odd squarefree,χd0ψi nonprincipal `|L(1/2+it,χd0ψi)| ≤ Cε X^(1+ε)(1+|t|)^(1/4+ε)`.

Apply Holder with fourth power to the primitive family. The character count contributes `X^(3/4)`, and the fourth-moment bound contributes `X^(1/4+epsilon)(1+|t|)^(1/4+epsilon)`, after rescaling epsilon. Remove principal terms before applying the supplied moment.

See [102][R102], §2.1, (14)–(16), pp.358–359.

<a id="s5-30i"></a>

**§5.30i Imprimitive square-factor bound.** For `d=d0k²` odd, the deleted Euler factors give `|L2(s,χdψi)| ≤ |L2(s,χd0ψi)|∏p|k(1+p^(−Res))`. On a fixed real strip with `Res≥1/2` this product is `Oε(k^ε)`, uniformly in Ims. Summing `k≤√(X/d0)` transports the primitive first moment to all odd `d`; the `d0=1` principal term uses `ζ2(s)`, off `s=1`.

Use the change-level identity to write the omitted prime factors. Bound them by the product of `1+p^(-sigma)`, absorb that product in `k^epsilon` on the fixed strip, and sum the primitive estimate over square factors. Treat the sole principal primitive term by the meromorphic odd zeta function.

See [102][R102], §2.1, (13)–(16), pp.358–359.

<a id="s5-30j"></a>

**§5.30j The first-moment input for the wider convergence tube.** For every `ε>0` and twist i there is `Cε>0` such that, for all `X≥1` and `t∈R`, `Σ1≤d≤X,d` odd `|L2(1/2+it,χdψi)| ≤ Cε X^(1+ε)(1+|t|)^(1/4+ε)`. The principal primitive character is separated before applying the quadratic fourth-moment theorem. A pole-aware strip extension is a separate lemma. Here `L2` is `oddLContinuation`, not the totalized naive LSeries.

Match `(16)` with the odd squarefree discriminants and the four twists. Keep its `ε-loss` and vertical-parameter dependence. Feed partial summation with the selected bound into the `d0` series.

See [102][R102], §2.1 equation (16), p.359; application to (29), p.362.

<a id="s5-30k"></a>

**§5.30k Pole-aware strip first moment.** Fix a compact real interval I and `ε>0`. There exist `C,N>0` such that for `σ∈I`, `X≥1` and `t∈R`, `Σd≤X,d` odd `|(σ+it−1)L2(σ+it,χdψi)| ≤ C X^(max(1,3/2−σ)+ε)(1+|t|)^N`. At `s=1` the term denotes the analytic extension of `(s−1)L2(s)`, not totalized multiplication. Constants depend on I and `ε`, not X,t or i. The summands are the absolute values of the entire functions `H_i,d=DoubleSeries.poleClearL`.

On compact right strips use the fourth moment, Hölder and square-factor decomposition, separating the principal `ζ2` contribution. Reflect strips left of `1/2`; the conductor factor `d^(1/2−σ)` gives the exponent `3/2−σ`. Track the gamma and pole-clearing factors as polynomial height bounds. Uniform strip constants must be proved by the same smoothed-sum argument, not inferred from pointwise O constants.

See [102][R102], §2.1 (16), p.359; Lemma 2 proof around (29), p.361.

<a id="s5-30l"></a>

**§5.30l Locally uniform convergence in R1.** The pole-cleared squarefree expression is holomorphic on `R1={Rew>1,Res+Rew>3/2}`; its only possible polar line there is `s=1`, from the trivial inner twist.

Use the first-moment bound for `Res≥1/2`. Apply the quadratic functional equation and its conductor growth for `Res<1/2`. Sum on compact strict sub-tubes and separate the trivial-character pole.

See [102][R102], §3 proof following (29), p.362.

<a id="s5-30m"></a>

**§5.30m The swap functional equation.** The 16-vector continuation satisfies `Z(s,w)=A Z(w,s)` wherever defined meromorphically.

Interchange the absolutely convergent odd sums. Expand the quadratic-reciprocity sign using the finite character table. Use identity continuation from the nonempty overlap.

See [102][R102], §3 equations (31)–(32), pp.362–363.

<a id="s5-30n"></a>

**§5.30n The reflection functional equation.** The 16-vector continuation satisfies `Z(s,w)=B(s)Z(1−s,s+w−1/2)` as an equality of meromorphic germs.

Separate odd squarefree `d0` and residue classes. Use the primitive real-character functional equation and the deleted factor at2. Observe that s+2w is invariant and that `2w` and `2s+2w−1` are exchanged.

See [102][R102], §3 equations (10) and (33)–(35), pp.358,362–363.

<a id="s5-30o"></a>

**§5.30o The zero block that removes a false pole.** `B(s)` is holomorphic on `Res<1` and its principal-twist block vanishes at `s=0`. This cancels the reflected principal `w=1` pole where its image would otherwise introduce an extra pole; it does not assert that every block vanishes at zero.

Use the gamma quotient with parity and the Euler factor ratio. Cancel apparent denominators at their removable zeros. At `s=0` in the first block, the reciprocal gamma zero cancels the candidate transported pole.

See [102][R102], §3 proof after (35), p.363.

<a id="s5-30p"></a>

**§5.30p Functional branches agree on overlaps.** On each connected nonempty open overlap of the `R1,αR1,βR2,αR3` branches, the meromorphic germs agree after clearing the encountered pole factors. For swap, compare on `Re s,Re w>1`. For reflection, compare the normally convergent squarefree expansions on `0<Re s<1` and `Re w` sufficiently large, using §5.30d's primitive functional equation and the deleted Euler factors. The comparison is locally uniform on compact subsets of this strip with a sufficiently large w threshold.

The identity theorem extends these identities to each connected overlap after pole clearance. The swap overlap `R1∩αR1` is convex. The reflection overlap `R2∩βR2=R1` is convex and contains that squarefree comparison region. The last overlap `R3∩αR3=R2` is connected because `R1` and `αR1` are convex with nonempty intersection; it is not convex.

**Checks.** Requiring `Re s>1` and `Re(1−s)>1` gives the empty set, so it supplies no reflection comparison. The point `(1/2,3)` lies in the squarefree comparison region. The points `(2,0),(0,2)` belong to `R3∩αR3`, but their midpoint `(1,1)` does not.

See [102][R102], Lemma 2 proof, pp.362–363.

<a id="s5-30q"></a>

**§5.30q Cancellation of spurious reflected poles.** During the `R2→R3` gluing, the only candidate new pole beyond `s=1,w=1,s+w=3/2` is the reflected principal-twist pole through `s=0`. The principal block `B1(0)=0` cancels it. Track pole orders as germs; multiplying totalized zero values is insufficient.

Separate the principal residue term in the reflected branch. Its scalar pole has order at most one and the entire principal reflection block vanishes at zero. Multiply as analytic germs, using the order inequality to remove the candidate pole.

See [102][R102], Lemma 2 proof, paragraph following (35), p.363.

<a id="s5-30r"></a>

**§5.30r Gluing the four continued tubes.** `R2=α(R1)∪R1`; `R3=β(R2)∪R2`; `R4=α(R3)∪R3`. The functional equations agree on their nonempty open overlaps and the gluing leaves possible poles only at `s=1,w=1,s+w=3/2`.

Check the explicit inequalities defining each tube, as on pp.363–364. Use holomorphic uniqueness on the overlaps after multiplying by the three linear pole factors. Use `B1(0)=0` to remove the candidate `s=0` hyperplane.

See [102][R102], §3 proof of Lemma 2, tube R1 and its images (36), pp.363–364.

<a id="s5-30s"></a>

**§5.30s Bochner tube extension.** For every finite `m≥1`, nonempty connected open `Ω⊆R^m` and holomorphic f on `TΩ=Ω+iR^m`, there is a unique holomorphic F on `Tconv(Ω)` restricting to `f`. The imaginary directions are unrestricted. The `m=0` case is a single point and requires no continuation. The following two local targets give a proof using ordinary parameter integrals, one-variable maximum principles and finite-dimensional convexity; no general envelope-of-holomorphy theorem is assumed.

<a id="s5-30t"></a>

**§5.30t Entire approximation on a connected tube.** Translate a chosen point of `Ω` to 0. Choose a smooth cutoff h with `h=1` on the unit ball and `h=0` outside the ball of radius2. For `r,τ>0` set
`E_(τ,r)(z)=(τ/π)^(m/2)∫_(R^m) exp(τΣ_j(z_j−iη_j)²)f(iη)h(η/r)dη`.
Its compactly supported integral is entire. For `ξ∈Ω` define `J_ξ(z)=(τ/π)^(m/2)∫ exp(τΣ_j(z_j−ξ_j−iη_j)²)f(ξ+iη)h(η/r)dη`. At `z=x+iy`, `J_x` is the ordinary Gaussian convolution and tends locally uniformly to `f(x+iy)` when `r>|y|+1` and `τ→∞`. Compare `J_0=E_(τ,r)` and `J_x` by moving `ξ` from0 to x along a polygonal path in `Ω`. Differentiate along each segment, use the Cauchy–Riemann equations and integrate by parts in `η`. The difference contains only derivatives of `h(η/r)`, supported where `r≤|η|≤2r`. On a compact family of such paths, let D bound `|x−ξ|` and let `|y|≤R`. Choose `r>R+D+1`, so
`Re Σ_j(x_j−ξ_j+i(y_j−η_j))²≤D²−(r−R)²<−1`.
The remainder is at most C `τ^(m/2)e^(−τ)`, with C depending on the fixed compact family and `r`. A finite connected union of balls supplies uniformly bounded polygonal paths for each compact subset of `Ω`. A compact exhaustion, followed by diagonal choices `r_j,τ_j`, therefore gives entire `E_j→f` locally uniformly on `TΩ`. The order of choices is compact set, path bound, `r`, then `τ`; `r>2R` alone is insufficient unless the real path diameter has also been included in `R`.

The interfaces are `tube_entire_approximants` (actual `E_j` and local uniform convergence), `tube_gaussian_path_remainder` (the displayed bound) and `tube_approximants_holomorphic` (dominated differentiation on compact z sets). Existing smooth cutoffs, Gaussian integration and complex differentiability are the carriers.

<a id="s5-30u"></a>

**§5.30u Analytic discs joining two real points.** For `x₀,x₁∈Ω`, `0<t<1` and `y∈R^m`, construct a smooth closed boundary curve `u:∂D→Ω` spending fractions approximately t and `1−t` near `x₀` and `x₁`, joined along a fixed smooth path in `Ω`. Make the joining arcs sufficiently short that the average differs from `tx₀+(1−t)x₁` by less than half the path's positive distance from `Ω`'s complement. Its Schwarz integral
`A(w)=(2π)^−1∫₀^(2π) [(e^(iθ)+w)/(e^(iθ)−w)]u(e^(iθ))dθ`
has real boundary u and center equal to its average. Smoothness of u gives a continuous boundary value, including the harmonic conjugate, by its rapidly decreasing Fourier coefficients. Correct the small real error by a `translation` and translate the imaginary center to `y`. The boundary remains in `TΩ`. Thus `tube_two_point_disc` gives an analytic disc centered at `tx₀+(1−t)x₁+iy`, with compact boundary in `TΩ`; `tube_disc_translation_radius` gives one positive radius for which all small translations have boundary in a common compact subset.

Apply the maximum principle to `(E_j−E_k)` composed with these translated discs. Local uniform convergence on their common boundary makes `E_j` uniformly Cauchy on a neighborhood of every center. Their limit extends f to the open set of two-point convex combinations. Iterate this construction: any convex combination of at most m+1 points is obtainable after finitely many two-point operations. Finite-dimensional Carathéodory, or the elementary affine-dependence elimination proof, supplies this bound. Thus the iteration reaches `conv(Ω)`. Local uniform limits preserve holomorphy; connectedness and analytic uniqueness make the result unique. Generic tube notation and these two adapters belong here for the double-series use; the tube-extension theorem is a target of this layer.

**Checks.**

- For `m=1` an open connected `Ω` is an interval, hence already convex; extension restricts to the original function.
- For `Ω={x∈R²:4<|x|²<5}`, `conv(Ω)` is the open radius-√5 disk. The construction fills0 even though0∉Ω.
- Connectedness is necessary: distinct constants on two disjoint real intervals cannot extend to one holomorphic function on the tube of their convex hull.
- The two-point disc has real center `tx₀+(1−t)x₁`, not its endpoint or an uncorrected `O(ε)` approximation. The Gaussian exponent uses `Σz_j²`, not `Σ|z_j|²`; the latter would not be holomorphic.

Primary source: [J. Hounie, A proof of Bochner's tube theorem][R110], author preprint, Lemmas1.1–1.2 and Theorem1.1, pp.2–6, especially §2.1 and §2.2 (2.1)–(2.3). The finite-dimensional and compact-parameter estimates above specify the prerequisite contracts rather than importing the theorem through DGH's external reference. The application is the m=2 specialization of this general result.

<a id="s5-30v"></a>

**§5.30v Bound survives tube extension.** Under the Bochner hypotheses, if `M≥0` and `|f(z)|≤M` for all `z∈TΩ`, then its extension F satisfies `|F(z)|≤M` throughout `Tconv(Ω)`.

For every `|a|>M`, extend `1/(f−a)` to the convex tube. The holomorphic identity `(F−a)G=1` follows from uniqueness. Thus F avoids every value outside the closed radius-M disk.

See [111][R111], Propositions 4.6–4.7, pp.37–38; bounded-shell application pp.43–44.

<a id="s5-30w"></a>

**§5.30w Affine dihedral action.** The two maps `α,β` satisfy `α²=β²=id` and `(αβ)^6=id`. At (2,3), the six iterates of `αβ` are distinct, so its order is exactly six. These transformations act on the real-part tube bases as well as on `C²`.

Compute alpha `beta` as an affine map and iterate it six times symbolically. Both generators square to the identity; the six images of (2,3) are distinct and certify exact order six.

See [102][R102], Lemma 2 proof, pp.362–364.

<a id="s5-30x"></a>

**§5.30x Real shell convex hull.** After `R4=R3∪αR3`, set `R5=R4∪βR4` and `R6=R5∪αR5`. The complement of the real-part base of `R6` is the closed twelve-gon `Ω` with successive vertices `(1,1),(1/2,1),(0,3/2),(0,1),(−1/2,1),(0,1/2),(0,0),(1/2,0),(1,−1/2),(1,0),(3/2,0),(1,1/2)`. It lies in `x²+y²≤3`, so the connected annulus `4<x²+y²<5` lies in the glued base and its convex hull contains `Ω`. The earlier `R4` alone does not have bounded complement.

Write each transported tube as explicit linear inequalities, using both remaining functional-equation transports `R4→R5→R6`. Check the complement by its twelve successive boundary segments. Bound every vertex by `x²+y²≤3`; convexity of the disk gives the polygon bound. The open annulus is connected and its convex hull is the disk of radius sqrt(5); use the bounded normalization on its entire imaginary tube.

See [102][R102], Lemma 2 proof and Fig.1, pp.363–364.

<a id="s5-30y"></a>

**§5.30y Gamma reflection block growth.** On each closed strip `a≤Res≤b<1`, the filled `r_i,η(s)` and hence entries of `B(s)` are bounded by `C(1+|Ims|)^N`. Stirling for the Gamma quotient gives a power of height; the Euler denominator has modulus at least `1−2^(b−1)>0` when `e≠0`. On a bounded height interval use holomorphy and compactness.

Separate the four conductor factors, whose moduli depend only on `Res`. Apply the vertical-strip Stirling ratio estimate away from bounded height; reciprocal Gamma fills the bounded-height removable points. Use the stated uniform lower bound for the restored Euler denominator.

See [102][R102], Lemma 2 proof, (32)–(35), pp.362–364.

<a id="s5-30z"></a>

**§5.30z Bounded normalization on the shell tube.** On the annular shell `4<Res²+Rew²<5` used in the last continuation step, the cleared branch `F=PZ` has a bound `C(1+|Ims|)^N(1+|Imw|)^N` from the `R1` estimate and transported reflection estimates. Choose an integer `M≥N`. Then `F/[(3+s)^M(3+w)^M]` is holomorphic and bounded on the shell tube, and its denominator has no zero on the full tube `Res²+Rew²<5`. Bochner bounded extension of this normalized function fills the hole; multiplying the denominator restores `F`.

Cover the closed real annulus `4≤Res²+Rew²≤5` by finitely many transported convergence regions, using germ agreement on overlaps. It lies inside their union because the excluded polygon has squared radius at most `9/4`. Compactness supplies uniform constants for its open subannulus. Retain polynomial height estimates in both variables under the finitely many affine transformations. Since `|Res|,|Rew|<√5<3`, `|3+s|` and `|3+w|` are bounded below and dominate 1+|Ims| and 1+|Imw| up to a fixed positive scalar.

See [102][R102], Final part of Lemma 2 proof, pp.363–364.

<a id="s5-30aa"></a>

**§5.30aa Filling the remaining real twelve-gon.** Let `Ω⊆R²` be connected and open and let f be holomorphic on `TΩ={z:Re z∈Ω}`. It has a unique holomorphic extension to `Tconv(Ω)` (Bochner). If `|f|≤M` on `TΩ`, the extension has the same bound. Apply this to the pole-cleared branch on the annular real shell around the omitted twelve-gon.

Extend f by Bochner. For each complex a with `|a|>M`, also extend `1/(f−a)`. The identity `(f−a)/(f−a)=1` extends by uniqueness, so the extended f never takes such an a. Apply the shell hull to each cleared component; only the local shell bound enters.

See [111][R111], §4.3, Proposition 4.6, pp.37–38; application pp.43–44.

<a id="s5-30ab"></a>

**§5.30ab Polynomial growth of cleared double series.** For each compact real rectangle `I×J` there exist `C,N>0` with `|Eij(s,w)|≤C(1+|Ims|)^N(1+|Imw|)^N` whenever `Res∈I,Rew∈J`. Here Eij is the entire cleared continuation.

Use §5.30z–aa for the filled ball `x²+y²<5`. Its union with the unbounded open base of `R6` is all `R²`, since the omitted polygon lies in `x²+y²≤3`. Cover the requested compact rectangle by finitely many open charts from this union: the filled-ball bound applies inside, while the transported convergence bounds apply outside. Take the largest exponents and constants over that finite cover; each affine transport bounds the transformed imaginary heights by a constant times 1+|Ims|+|Imw|. A finite orbit of the bounded ball alone is insufficient.

See [102][R102], Lemma 2 proof, pp.363–364.

### Examples

The four real characters modulo 8 are separated by their values at 3, 5 and 7. Squaring a nonprimitive quadratic twist does not erase its deleted Euler factors. For the affine transformations use the two explicit variable formulas before composing them; a mistaken linear action changes the polar hyperplanes. For the cubic theory verify the rational totally real and complex signatures separately, keep the automorphism weights, and use a nonprincipal ideal-class component to test the global coefficient convention.

### Dependencies

AutomorphicLFunctionsAndLocalFactors Layer 0 for Fourier and Poisson estimates; AdelicAlgebraicGroups Layer 2 for `GL₂` quotient measures and inversion; the local cubic arithmetic targets and quadratic large sieve/fourth moment for coefficient estimates; AutomorphicSpectralTheory §§1.2–1.5 for general reductive Eisenstein theory; the local Wright adapter supplies the `GL₂` height, residue and fixed-strip Fourier normalization. AnalyticNumberTheoryPartI Layers 0–2 supply prime estimates, the rational Hecke dictionary and quantitative refinements; ZerosOfLFunctions supplies generic Gamma and zero estimates.

<a id="layer-6"></a>

## Layer 6: The Bost–Connes system and compact spectral determinants

Target API names for the Bost–Connes system are relative to `TauCeti.BostConnes`; spectral target names retain the `TauCeti.SpectralZeta` prefix. Construct the rational ax+b Hecke algebra, its complex completion and the specified time evolution before defining completed states. Derive the scaling-measure correspondence, critical uniqueness, high-β probability parametrization and cyclotomic ground-state values with their topologies. In a separate branch, build scalar spectral zeta, shifted determinants and the Selberg comparison from the compact heat trace.

<a id="s6-1"></a>

### 6.1 The positive rational ax+b subgroup

`axbRat` is the subgroup of `GL₂(Q)` consisting of matrices `[1 b;0 a]`, with a,b rational and `a>0`. Its product is [1,b′+ba′;0,aa′], its inverse `[1,−b/a;0,1/a]`. Integral translations, the diagonal map and the two named matrix families are separate constructions.

Multiply/invert the displayed matrices to check closure and diagonal multiplicativity. Conjugating `translation n` `by[1 b;0 a]` gives `translation` n/a, proving both inclusion and the required conjugation formula.

- `axbRat`: `P⁺_ℚ : Subgroup (GL (Fin 2) ℚ)`, the matrices `[1 b; 0 a]` with `a > 0`.
- `axbInt`: `P⁺_ℤ : Subgroup (GL (Fin 2) ℚ)`, the matrices `[1 n; 0 1]` with n `∈ ℤ`.
- `mem_axbRat_iff`: g `∈ axbRat` ↔ g `1 0 = 0 ∧ g 0 0 = 1 ∧ 0 < g 1 1`.
- `axbInt_le_axbRat`: `axbInt ≤ axbRat`.
- `diagEntry`: The (2,2) entry as a homomorphism `axbRat →* ℚˣ` with positive values `(diagEntry_pos)`, `diagEntry (dilation a) = a` and `diagEntry (translation b) = 1`.
- `translation`: `translation b = [1 b; 0 1] ∈ axbRat`, a homomorphism from `Multiplicative ℚ`.
- `dilation`: `dilation a = [1 0; 0 a] ∈ axbRat` for `a > 0`.
- `conj_translation`: g · `translation n` · `g⁻¹ = translation (n / diagEntry g)`.

**Checks.**

- `translation (1/2) ∈ axbRat` and `translation (1/2) ∉ axbInt`.
- The matrix `[1 0; 0 −1]` is invertible but not in `axbRat`: the positivity of a is part of the definition.
- `axbInt` is not a normal subgroup of `axbRat` (conjugate `translation 1` by `dilation 2`).
- `diagEntry ([1 1; 0 2] · [1 1/3; 0 3]) = 6`.

`P⁺_ℤ` is not normal in `P⁺_ℚ`: conjugating `[1 1; 0 1]` by `[1 0; 0 2]` gives `[1 1/2; 0 1] ∉ P⁺_ℤ`.

See [112][R112], Ch. 3, §4.2, (3.61)–(3.65), p. 460; [113][R113], §4, notations (α), (β), p. 431 (PDF p. 21).

*Needs:* `Matrix.GeneralLinearGroup`; `Matrix.GeneralLinearGroup.mkOfDetNeZero`; `Subgroup.Normal`.

<a id="s6-2"></a>

### 6.2 The finite-adele scaling measure

For `β>0`, the canonical scaling measure `μβ` on the existing finite-adele carrier has local density `(1−p^(−β))/(1−p^(−1))·|x|p^(β−1)` relative to normalized additive Haar, interpreted away from `x=0`. Its restriction to `Ẑ` is the product of the local probabilities; extend it to ⋃n (1/n)Ẑ by rational scaling. This unit-invariant measure is distinct from the space of all normalized scaling measures.

Sum p-adic valuation shells to normalize the local measure. Construct the product probability on `Ẑ` and extend consistently to rational dilates in finite adeles. Verify the rational scaling law and uniqueness among the specified unit-invariant measures.

- `ScalingMeasure.local`: Given p prime, the Borel measurable Padic p carrier and normalized additive Haar `μ`, form `μ.withDensity` with density `((1−p^(−β))/(1−p^(−1)))·‖x‖^(β−1)` away from 0, assigned zero at 0. The Haar normalization and canonical finite-adele component adapter are the AA.0/ProfiniteArithmetic inputs.
- `ScalingMeasure.adelic`: The restricted-product measure with `μβ(Ẑ)=1`.
- `ScalingMeasure.scale`: `μβ(q^(−1)E)=q^β μβ(E)`.

**Checks.**

- `Atβ=1` the local measures and restricted product are additive Haar.
- `μβ,p({ordp x=k})=(1−p^(−β))p^(−kβ)` for `k≥0`.
- `μβ,p(Zp×)=1−p^(−β)`.

See [114][R114], Local product density and Proposition, p.2; normalized scaling equation (1β), p.1.

*Needs:* [GlobalNumberFields 4][R22]; `IsDedekindDomain.FiniteAdeleRing`; `MeasureTheory.Measure.infinitePi`; [§6.2a](#s6-2a).

<a id="s6-2a"></a>

**§6.2a Normalize the local scaling density.** For `β>0` and every integer `k`, `μβ,p({ordp x=k})=(1−p^(−β))p^(−kβ)`. Summing `k≥0` gives `μβ,p(Zp)=1`; the singleton 0 has mass 0. Multiplication by `p^j` scales measurable masses by `p^(−jβ)`.

Integrate the radial density on each additive-Haar shell. Its Haar mass is `(1-p^(-1))p^(-k)`, so the normalization constant yields `(1-p^(-beta))p^(-k beta)`. Sum the nonnegative shells and apply a change of variables for `dilation` by `p^j`.

See [114][R114], Neshveyev 2000 product-density formula, p.2.

<a id="s6-3"></a>

### 6.3 Eisenstein recurrence polynomials

Define `P0=0`, `P1=X` and `Pk+1=(X²−1/4)P′k/k` for `k≥1` in Q[X]. For `k≥1`, Pk is monic of degree `k`. The derivative recurrence comes from the normalized cotangent identity; Pk(0) is the prescribed value at a degenerate lattice.

Define recursively in Q[X]. The leading derivative coefficient k cancels division by `k`, preserving monicity while increasing the degree by one.

- `ArithmeticEisenstein.polynomial_recurrence`: For `k≥1`, `P(k+1)=(X²−1/4)P′k/k`.
- `ArithmeticEisenstein.polynomial_monic`: For `k≥1`, Pk.Monic.
- `ArithmeticEisenstein.polynomial_degree`: For `k≥1`, `Pk.natDegree=k`.

**Checks.**

- `P2=X²−1/4`.
- `P3=X³−X/4`.
- `P4=X⁴−X²/3+1/48`.

See [112][R112], Ch.3, Lemma 3.27, (3.94)–(3.97), pp.464–465.

*Needs:* `Polynomial`.

<a id="s6-4"></a>

### 6.4 Positive-spectrum zeta and heat series

For a connected compact hyperbolic surface `X=Γ\H` with `Γ` torsion-free and cocompact, genus `g≥2`, use `Δ=−y²(∂x²+∂y²)`. Import the discrete spectrum0=λ0<λ1≤… with multiplicities. Define `ζΔ(s)=Σj≥1 λj^(−s)` on `Res>1` and `H(t)=Σj≥0 exp(−tλj)` for `t>0`. The analytic continuation of `ζΔ` is distinguished from the totalized infinite sum.

Import the compact quotient and positive scalar Laplacian. Index the nonzero spectrum with multiplicities and omit the zero eigenvalue in `ζΔ`. Use Weyl growth to justify the series on their stated domains.

- `TauCeti.SpectralZeta.SpectralData.series`: The positive-spectrum complex-power series.
- `TauCeti.SpectralZeta.SpectralData.heat`: Heat series including the single zero eigenvalue.
- `TauCeti.SpectralZeta.SpectralData.continued`: The meromorphic continuation agreeing with the positive series for `Res>1`.

**Checks.**

- For a finite spectrum consisting of `λ>0`, the series is `λ^(−s)`.
- The zero eigenvalue contributes1 to the heat series and contributes no term to `ζΔ`.
- Replacing each positive `λ` by `cλ` for `c>0` multiplies the convergent zeta series by `c^(−s)`.
- Positivity alone does not imply convergence: the infinite constant spectrum `λj=1` gives the divergent series `Σ1` for every `s`. Its totalized infinite sum is 0, not an analytic spectral continuation.

See [115][R115], §1, (1.1)–(1.5), p.603.

*Needs:* FuchsianOrbifolds Layers 0–2, 4; [§6.12b][R445]; `Complex.cpow`; [§6.4a](#s6-4a).

<a id="s6-4a"></a>

**§6.4a Spectral continuation output.** The heat-asymptotic contract yields actual positive and shifted meromorphic functions, regular at `z=0`, agreeing with their convergent series on `Rez>1`. It also yields an analytic function `F=(z−1)ζ+(z)` near 1. These are the fields of SpectralContinuation; existence follows from the Mellin subtraction chain, not from an arbitrary function-valued placeholder.

Assemble the normally convergent right-half-plane series, the subtracted Mellin germs and regularity at zero into actual continuation functions. Their overlapping germs agree by the identity theorem. The pole-cleared germ near one is the data used in the genus-one prefactor.

See [116][R116], §4, pp.13–15; Sarnak §1, p.603.

<a id="s6-5"></a>

### 6.5 Bost–Connes ratio-witness convention

For the canonical `β-scaling` measure on `A_f`, `β>0`, compare positive-rational `dilation` witnesses with VonNeumannAlgebras V11's measured-relation cocycle. Since `q_*μβ(E)=μβ(q⁻¹E)=q^βμβ(E)`, its pushforward density at the target is `q^β`. Thus a witness for `λ≥0` is a positive-measure subset of `A∩qA` on which `|q^β−λ|<ε`, for each positive-measure measurable A and `ε>0`. This is a BC specialization, not another ratio-set carrier.

- `ratioWitness_iff`: The displayed BC witnesses are equivalent to membership in VonNeumannAlgebras V11's ratio set for this action.
- `pushforwardDensity`: The target density of `dilation q` is `q^β`; the inverse `dilation` has density `q^(−β)`.

**Checks.**

- For the identity action on a one-point probability space, 1 lies in the ratio set.
- For that same action, 2 does not lie in the ratio set.
- For that same action, 0 does not lie in the ratio set.
- For `q=2`, `β=1`, `μβ(2Ẑ)=1/2`, while the pushforward density of `dilation` by 2 is 2 and that of its inverse is `1/2`. Cylinder mass and target density have opposite exponents.

See [117][R117], §1 ratio-set definition, p.2.

*Needs:* [§6.2][R440]; VonNeumannAlgebras V8 and V11; `MeasureTheory.Measure.rnDeriv`.

<a id="s6-6"></a>

### 6.6 Finite spectral determinant benchmark

For a finite index set and eigenvalues `λj` define `Dfin(u)=∏j(λj+u)`. This is the finite-dimensional version of zeta regularization; it includes zero modes. It is a separate constructor from the infinite genus-one determinant and does not substitute for tests of that family.

Multiply the finitely many affine factors, including any zero-mode factor `u`. Polynomial analyticity and the finite product zero criterion give the API and tests; the empty product equals one.

- `TauCeti.SpectralZeta.ShiftedDet.finite_empty`: The empty determinant is 1.
- `TauCeti.SpectralZeta.ShiftedDet.finite_zero_iff`: `Dfin(u)=0` iff `λj+u=0` for some `j`.
- `TauCeti.SpectralZeta.ShiftedDet.finite_entire`: The finite determinant is entire in `u`.

**Checks.**

- For the empty finite spectrum the shifted determinant is 1.
- For one finite eigenvalue `λ` it is `λ+u`.
- For one eigenvalue `1/4`, its pullback `u=s(s−1)` is `(s−1/2)²`, giving a double zero.

See [116][R116], §4 (4.2)–(4.6), pp.13–15, for heat regularization and zero-mode removal; canonical product derived in this roadmap.

*Needs:* `Polynomial`.

<a id="s6-7"></a>

### 6.7 Integral translation subgroup

`axbInt` is the subgroup of `GL₂(Q)` consisting of `[1 n;0 1]`, `n∈Z`, and axbInt≤axbRat.

Multiply the upper triangular matrices and compute inverses. The `translation` coordinate remains an integer, and diagonal 1 gives positivity and inclusion in `axbRat`.

- `mem_axbInt_iff`: Membership means lower-left=0, both diagonal entries=1 and upper-right integral.
- `axbInt_le_axbRat`: The subgroup inclusion into positive rational ax+b matrices.

**Checks.**

- Translation 2 is integral.
- Translation `1/2` is rational but not integral.
- Conjugation of `translation 1` by `dilation 2` leaves the integral subgroup.

See [112][R112], Ch.3 §4.2, pp.460–462.

*Needs:* [§6.1](#s6-1).

<a id="s6-8"></a>

### 6.8 Translations and positive dilations

translation:Multiplicative `Q→axbRat` sends b to `[1 b;0 1]`; dilation(a), for `a>0`, is `[1 0;0 a]`. These are the normal-form coordinate maps, with diagonal values 1 and a respectively.

Insert the two matrices into the subgroup membership criterion. Matrix multiplication proves `translation` additivity and `dilation` multiplicativity; evaluate the diagonal entry directly.

- `translation`: Additive rational translations written as a multiplicative homomorphism.
- `dilation`: The positive rational diagonal matrix.
- `diagEntry_translation`: Every `translation` has diagonal value 1.
- `diagEntry_dilation`: The diagonal value of dilation(a) is a.

**Checks.**

- Translation 0 is the identity.
- Dilation 1 is the identity.
- Translations `1/2` and `1/3` compose to `translation 5/6`.

See [112][R112], Ch.3 §4.2, pp.460–462.

*Needs:* [§6.1](#s6-1).

<a id="s6-9"></a>

### 6.9 Ergodicity of positive rationals on finite adeles

For `0<β≤1` the `Q+×` action `on(A_Q,f,μβ)` is ergodic: every invariant `L²` function on the compact integral slice is constant, and rational dilates cover the finite adeles.

For the trivial character compute the projection constant. For every nontrivial dense character use the zero projection limit. Pass by `L²` density and the rational-dilate exhaustion.

See [114][R114], Proposition and complete proof, pp.2–3.

*Needs:* [§6.2][R440]; [AnalyticNumberTheoryPartI, Prerequisites and boundaries][R136]; `lp`; [§6.9a](#s6-9a); [§6.9b](#s6-9b); [§6.9c](#s6-9c); [§6.9d](#s6-9d); [§6.9e](#s6-9e).

<a id="s6-9a"></a>

**§6.9a Finite-prime orbit projection.** For a finite prime set A, NA is its generated multiplicative monoid and `WA={x∈Ẑ:xp∈Zp×` for `p∈A}`. On WA the projection to NA-invariant functions is `PAf(x)=ζA(β)^(−1)Σn∈NA n^(−β)f(nx)`, extended along NA-orbits, where `ζA(β)=∏p∈A(1−p^(−β))^(−1)`.

Decompose `Ẑ` into disjoint `nWA` for `n∈NA` up to the measure-zero zero-coordinate set. Use `μβ(nE)=n^(−β)μβ(E)`. Check conditional expectation, invariant range and idempotence in `L²`.

See [114][R114], Proposition proof, projection formula (2) and verification, p.2.

<a id="s6-9b"></a>

**§6.9b Local characters form a dense family.** Functions depending on finitely many p-adic coordinates and valuation shells, with characters of local unit quotients, span a dense subspace of `L²(Ẑ,μβ)`.

Approximate by finite-coordinate cylinder functions. Decompose each coordinate into its countable valuation shells. Use finite character orthogonality on the compact local unit quotients.

See [114][R114], Proposition proof, local characters and valuation translates, pp.2–3.

<a id="s6-9c"></a>

**§6.9c Reciprocal primes in progressions.** Fix `N≥1` and a coprime to `N`. The fixed-progression prime asymptotic `π(X;N,a)∼Li(X)/φ(N)` implies `Σp≤X,p≡a(modN)1/p=(1/φ(N))log log` X+`o(log log X)`. In particular `Σp≡a(modN)p^(−β)` diverges for `0<β≤1`.

Apply partial summation to `π(t;N,a): π(X)/X+integral` from 2 to X of `π(t)/t²` dt. Use the asymptotic with a fixed relative error on large t and squeeze the integral against `(1/φ(N))` integral dt/`(t log t)`. For `β≤1`, `p^(−β)≥1/p`.

See [114][R114], Proposition proof, p.3 (Dirichlet input); partial summation is the local refinement.

<a id="s6-9d"></a>

**§6.9d Nontrivial characters are annihilated in the critical interval.** For `0<β≤1` and a nontrivial local unit characterχ, the increasing-prime projections `P_Aχ` tend to 0: their product coefficients contain factors `(1−p^(−β))/(1−χ(p)p^(−β))`, and divergence of the prime reciprocal sum in a suitable character sector forces the product to 0.

Compute the geometric prime-power factors in the finite-prime average. Choose a congruence sector where `Reχ(p)<0`. Use the fixed-progression prime theorem to obtain divergence of `Σp p^(−β)`, not merely infinitude of primes.

See [114][R114], Proposition proof, nontrivial character product and progression argument, p.3.

<a id="s6-9e"></a>

**§6.9e Decreasing orthogonal projections.** Let Hn be a decreasing sequence of closed subspaces of a Hilbert space and `H=intersection` Hn. Their orthogonal projections Pn satisfy `‖Pn v−P v‖→0` for every `v`. In the finite-prime exhaustion, Hn consists of functions invariant under multiplication by all primes in its first n entries.

For `m≥n`, orthogonality gives `‖Pn v−Pm v‖²=‖Pn v‖²−‖Pm v‖²`. The decreasing norm squares make Pn v Cauchy. Its limit lies in every Hn and has the defining projection orthogonality to `H`.

See [114][R114], Projection exhaustion in the Proposition proof, p.2.

<a id="s6-10"></a>

### 6.10 All normalized scaling measures

For `β>0`, a `β-scaling` measure is a positive Radon measure `μ` on `A_f` with `μ(Ẑ)=1` and `μ(qE)=q^(−β)μ(E)` for every positive rational q and Borel set `E`. These two conditions force `μ({0})=0`. No unit invariance is assumed; the canonical product measure is one element.

Use Radon regularity and normalized rational scaling. Since `μ({0})≤μ(Ẑ)=1` and dilation2 fixes0, `β>0` forces `μ({0})=2⁻ᵝμ({0})=0`.

- `IsScalingMeasure.normalized`: The integral-adeles mass equals 1.
- `IsScalingMeasure.scale`: Every positive rational `dilation` scales mass by `q^(−β)`.
- `IsScalingMeasure.zero_atom`: The singleton 0 has zero mass.
- `IsScalingMeasure.convex`: Convex mixtures at fixed `β` stay in the space.

**Checks.**

- The zero measure is not normalized.
- The atom at 0 is normalized but violates scaling for `q=2` and `β>0`. At `β=0` it satisfies the scaling law and has `μ({0})=1`, so positivity of `β` is essential for `zero_atom`.
- The product-density measure satisfies the normalized scaling predicate.

See [114][R114], Neshveyev 2000 (1β), p.1.

*Needs:* [§6.2][R440].

<a id="s6-11"></a>

### 6.11 The scalar Selberg primitive-geodesic product

For the same compact torsion-free quotient, let `PΓ` be primitive hyperbolic conjugacy classes, with the orientation/conjugacy convention of Zagier(2). For each p let `ℓp=log N(p)>0`. Define `ZΓ(s)=∏p∈PΓ ∏k≥0 (1−exp(−(s+k)ℓp))` for `Res>1`; its entire continuation is separate. Primitive conjugacy classes, their inverses and geometric unoriented geodesics are not interchanged without the multiplicity comparison.

Import primitive hyperbolic classes and their length normalization. Use a geodesic-count growth bound to prove absolute local product convergence. Define the continuation only after the trace-formula comparison.

- `TauCeti.SpectralZeta.Selberg.product`: The displayed double Euler product in `Res>1`.
- `TauCeti.SpectralZeta.Selberg.continued`: The entire continuation with the same product on `Res>1`.
- `TauCeti.SpectralZeta.Selberg.log_derivative`: `Z′/Z=Σp Σm≥1 ℓp exp(−msℓp)/(1−exp(−mℓp))` in `Res>1`.

**Checks.**

- One primitive class of lengthℓ contributes `∏k≥0(1−e^(−(s+k)ℓ))`; its powers are counted by m in the logarithmic derivative.
- Disjoint primitive class lists multiply their products in the convergence domain.
- Replacing the source class list by two copies squares the product; it changes the theorem unless its multiplicities are corrected.

See [118][R118], §1, (1)–(2), pp.1–2.

*Needs:* [§6.4][R453]; [§6.12c][R454]; FuchsianOrbifolds Layers 0–2, 4.

<a id="s6-12"></a>

### 6.12 Spectral zeta is regular at zero

The positive spectral zeta continues meromorphically, and is analytic at0 because `Γ(s)^(−1)` has a simple zero there, canceling the possible simple Mellin pole. Its derivative at0 is well defined.

Continue successively using finite heat subtractions. Use `Γ(s+1)=sΓ(s)` and `Γ(1)=1` at0. Differentiate the resulting holomorphic expression, never the divergent original series.

See [115][R115], §1, (1.1)–(1.5), p.603.

*Needs:* `B11`; [§6.4a](#s6-4a).

<a id="s6-12a"></a>

**§6.12a Explicit scalar hyperbolic heat kernel.** Fix one connected compact torsion-free surface `X=Γ\H`, curvature `−1`, hyperbolic measure `dμ=dx dy/y²`, area `A=4π(g−1)`, and a compact fundamental polygon D of diameter `d`. The positive scalar expression is `A_X=−div grad=−y²(∂x²+∂y²)`, the negative of DifferentialGeometry Layer 12's `laplaceBeltrami`. Prove this sign and measure comparison in hyperbolic charts; complexify its real Green identity componentwise. The energy is `∫|grad f|²` and vanishes precisely on constants by connectedness and full support. As a local sign check, `A_X(x²)=−2y²`, whereas `laplaceBeltrami(x²)=2y²`.

For `t>0` and `ρ=d(z,w)`, construct

`p_t(ρ)=√2 exp(−t/4)/(4πt)^(3/2)` · `∫_ρ^∞ u exp(−u²/(4t))/√(cosh u−cosh ρ)` du.

Its symmetry, positivity, mass one, heat equation and approximate-identity property precede any spectral assertion. To justify differentiation at `ρ=0`, use `v=√(cosh u−cosh ρ)` to remove the lower-endpoint square-root singularity. On compact positive t intervals all t and spatial derivatives are bounded by `C(1+ρ)^M exp(−ρ²/(C't))`; the derivative order and t interval determine C,M,C'. The scalar bound `p_t(ρ)≤Ct^−1 exp(−ρ²/(8t))` for `0<t≤1` gives the initial limit: split a bounded continuous test function into its uniformly continuous near-diagonal part and its Gaussian tail. There is no smooth kernel value at `t=0`; the limit is an operator limit.

The orbit packing estimate `#{γ:d(z,γw)≤R}≤C_D exp R` holds uniformly for `z,w∈D`: disjoint translates of a small ball sit in a ball of radius `R+O_D(1)`, whose hyperbolic area is `O(exp R)`. Periodize `P_t(z,w)=Σγ p_t(d(z,γw))`. This estimate and the derivative majorants give absolute locally uniform convergence, including every derivative, for `t>0` and `z,w∈D`. Unfolding gives mass one and the initial limit. The energy identity gives uniqueness, hence `P_(t+u)=P_t P_u`, symmetry and contraction on `L²`. Extend the initial limit from continuous functions to `L²` by density and contraction. These are local adapters for the explicit kernel, not extra assumptions on AS.4/AS.6.

The construction APIs are `scalarHeatKernel`, `scalarHeatKernel_periodization`, `scalarHeatKernel_semigroup`, `scalarHeatKernel_mass_one` and `scalarHeatKernel_strong_initial_limit`, with precisely these domains and hyperbolic measure.

**Checks.** The constant function is fixed for every `t>0`. Reversing the sign to div grad would give increasing rather than decaying positive-eigenvalue multipliers. The `t=0` kernel is not a continuous function on `X×X`. Replacing `dμ` by a probability measure divides the integral measure by A and requires multiplying the kernel by A; it must not change the spectrum.

See [119][R119], §3.1 Lemma3.5 and proof, p.22; §3.3 explicit transform and Lemmas3.11–3.12 with the periodization proof, pp.26–28. The local derivative and initial-limit estimates above specify the adapters left implicit in that exposition. The singular time t=0 is used only as an operator limit.

<a id="s6-12b"></a>

**§6.12b The compact discrete-spectrum input.** Apply the [compactScalarRealization][R120] comparison with ComplexKahlerGeometry K5a on `L²(X,dμ)`. Its smooth complete eigenbasis and finite cutoffs give eigenvalues `0=λ0<λ1≤λ2≤⋯→∞`, with multiplicity. Green's identity and connectedness identify the zero eigenspace with constants. The `H²` operator is the negative of DifferentialGeometry's div-grad operator in the hyperbolic charts; matching `dμ` fixes its `L²` inner product.

The local comparison target `scalarHeatKernel_spectral_multiplier` asserts `P_t φj=exp(−tλj)φj` for the preceding explicit periodization and this scalar realization. Both sides solve the heat equation with initial value `φj`, so the energy uniqueness argument proves equality. `L²` contraction and density extend the equality to all `L²` data. Consequently its spectral domain agrees with the `H²` domain of `compactScalarRealization`. This identifies the explicit geometric kernel with the supplied K5a operator under the scalar comparison. The Weyl constant is determined below by the hyperbolic trace.

**Checks.** Connectedness gives one zero mode; on a disjoint union there is one per component. A positive eigenmode has multiplier `exp(−tλ)<1`. Reversing the differential sign gives growth and fails the heat equation. Eigenvalue multiplicity is the eigenspace dimension, not the count of distinct spectral values.

ComplexKahlerGeometry K5a supplies the general manifold realization, regularity and Friedrichs comparison; `compactScalarRealization` identifies its scalar form, measure, domain and sign. The explicit-kernel comparison follows the uniqueness argument in [119][R119], Lemma3.5 and the proof of Theorem3.2, pp.22–23; the kernel construction is §3.3, pp.26–28.

<a id="s6-12c"></a>

**§6.12c Gaussian scalar trace and primitive multiplicities.** For `t>0` use `h_t(r)=exp(−t(r²+1/4))` and Fourier convention `g_t(v)=(2π)^−1∫h_t(r)exp(−irv)dr`. Thus `g_t(v)=exp(−t/4−v²/(4t))/√(4πt)`. With `PΓ` the primitive hyperbolic conjugacy classes (inverse classes separate),

`H(t)=Σj exp(−tλj)=A/(4π)∫_ℝ r tanh(πr)exp(−t(r²+1/4))dr + Σp∈PΓ Σm≥1 ℓp g_t(mℓp)/(2 sinh(mℓp/2))`.

This direct Gaussian proof does not require a compact-support approximation. First Parseval and Tonelli applied to `P_(t/2)` give `Σj exp(−tλj)=∫_(X×X)|P_(t/2)(z,w)|²dμ(z)dμ(w)=∫_X P_t(z,z)dμ(z)`; finiteness follows from the continuous kernel on compact `X×X`, before invoking Weyl. Unfold its absolutely convergent periodization by conjugacy classes. The centralizer of a primitive p is the infinite cyclic group generated by p. In its cylinder coordinates `z=(u+i)exp v`, `dμ=du` dv and `0≤v<ℓp`. For the mth power, `cosh d(z,p^m z)=1+2sinh²(mℓp/2)(1+u²)`. The inverse Abel transform gives the orbital integral `ℓp g_t(mℓp)/(2sinh(mℓp/2))`. Grouping `m>0` with both primitive orientations gives the displayed sum. Equivalently a full cyclic cylinder sums both signs and has twice this coefficient; the factor one-half in regrouping restores it. The identity term is the radial inversion value `p_t(0)=(4π)^−1∫r tanh(πr)h_t(r)dr`. All interchanges are justified by the orbit Gaussian majorant, uniformly for t in a compact subset of `(0,∞)`.

A positive systole `ℓ0` exists by compactness and proper discontinuity. Choose a conjugate representative of each axis intersecting `D`; its displacement of a fixed base point is `≤ℓ+2d`. Orbit packing therefore gives `#{p:ℓp≤L}≤C exp L`. This also proves the geometric-series bounds used by the Selberg product, with both orientations counted. The constants depend on `X`, not on t in the stated compact interval.

**Checks.** Fourier inversion at `v=0` gives the prefactor `1/√(4πt)`. At `t=1` and `v=2` the Gaussian ratio `g_t(v)/g_t(0)` is `exp(−1)`, not `exp(−2)`. Merging inverse classes without doubling the orbital coefficient halves the hyperbolic contribution. The zero eigenvalue contributes exactly 1. Cusp and elliptic contributions are absent because `Γ` is cocompact and torsion-free.

See [121][R121], Fourier convention (69), p.13; inverse Abel transforms (70), (100)–(108), pp.13,17–18; cylinder Proposition6 (145)–(149), p.21; centralizer Lemma6 and (165)–(170), p.23; Theorem4 (182) with its unfolding proof, p.25. The direct positive-kernel argument above supplies the spectral-trace interchange instead of assuming Proposition9's external uniform-convergence theorem. **Source normalization correction:** in this 2008 author PDF, (192), p.26, and the Gaussian exponent propagated to (193), p.27, have denominator 2β; convention (69) and h(r)=exp(−βr²) give 4β. The formula here uses 4t, also obtained in Le Masson §3.3.1, pp.26–27.

<a id="s6-12d"></a>

**§6.12d Full scalar heat expansion with remainder.** For this fixed X and every integer `N≥0` there are real coefficients a0,…,aN and `C_(X,N)<∞` such that `|H(t)−Σ_(k=0)^N` ak `t^(k−1)|≤C_(X,N)t^N` for `0<t≤1`. In particular `a0=A/(4π)`, `a1=−A/(12π)`, `a2=A/(60π)`. These are integrated trace coefficients; no uniformity over degenerating surfaces is claimed or needed.

Write the identity contribution exactly as

`A/(4π) exp(−t/4) [1/t − 4∫_0^∞ r exp(−tr²)/(exp(2πr)+1)dr]`.

The moments `M_j=∫_0^∞ r^(2j+1)/(exp(2πr)+1)dr` are finite. Taylor's formula for `exp(−tr²)`, with absolute remainder `≤(tr²)^(J+1)/(J+1)!` for `tr²≥0`, gives a uniform remainder `≤t^(J+1)M_(J+1)/(J+1)!`. Combine this with the finite Taylor expansion of `exp(−t/4)`, expanding its `1/t` term one order further. The coefficients are thereby constructive finite combinations of the moments. Geometric expansion of `(exp(2πr)+1)^−1`, or its positive Mellin integral, gives `M0=1/48` and `M1=7/1920`, hence the three constants above. For the hyperbolic contribution, use `ℓ≥ℓ0` and the exponential primitive-count bound: split `exp(−(mℓ)²/(4t))` into equal factors, use one for `exp(−ℓ0²/(8t))`, and sum the other at `t≤1` against the exponential orbit growth. The remaining factor `t^−1/2 exp(−ℓ0²/(8t))` is `O_(X,N)(t^N)` for every `N`. Thus all heat remainders needed for Mellin continuation are proved by this trace identity, without a generic heat-parametrix supplier.

The API is `scalarHeatTrace_expansion`, its coefficient identities and `scalarHeatTrace_positive_zero_value`: the positive spectral zeta at zero is `a1−1=−(g+2)/3`. **Checks.** For genus 2 this value is `−4/3`; omitting the zero-mode subtraction gives the wrong `−1/3`. The leading trace term is `(g−1)/t`. Curvature−1 makes the constant coefficient negative, `−(g−1)/3`. Hyperbolic terms are flat at `t=0` and cannot change any power coefficient.

Source route: the primary Gaussian trace proof just cited and the elementary finite Taylor remainder. Marklof §11 Proposition10, pp.26–27, uses the same heat identity for its leading term; the all-orders remainder and explicit zero subtraction above are the local refinement.

<a id="s6-12e"></a>

**§6.12e Scalar Weyl counting from heat.** `N_X(R)=#{j:λj≤R}` satisfies `N_X(R)~A R/(4π)`, hence `N_X(R)≤C_X R` for `R≥1`. The elementary bound `N_X(R)≤exp(1)H(1/R)` already supplies the summability estimates below; sharp asymptotics are not a hidden prerequisite of the heat proof.

For the sharp statement, set `ν_R=R^−1Σj δ_(λj/R)` and push the finite measure `exp(−x)ν_R` under `y=exp(−x)` to [0,1]. Its kth moment is `R^−1H((k+1)/R)→A/(4π(k+1))`, including `k=0`, by the leading heat term. Polynomial approximation on [0,1] therefore gives weak convergence to `A/(4π)` times Lebesgue measure. The bounded function `y^−1·1_[exp(−1),1]` has discontinuities only at endpoints, which have zero limiting mass; continuous upper/lower approximations yield `ν_R([0,1])→A/(4π)`. This is the needed Laplace Tauberian step, with no appeal to an unprovided sharp Weyl theorem.

See [121][R121], Proposition10 (189)–(194), pp.26–27; [119][R119], §4.5 Theorems4.9–4.10, pp.33–34. The moment argument specifies the local Tauberian adapter rather than importing the latter's unstated proof.

<a id="s6-12f"></a>

**§6.12f Weyl bounds imply spectral summability.** For a nonnegative spectrum with one zero mode, finite multiplicities and counting function `N(R)≤CR` for `R≥1`, `Σλj>0 λj^(−σ)` converges for `σ>1`, locally uniformly in complex `σ` on `Res>1`. Also `Σexp(−tλj)` converges locally uniformly for `t>0` and `Σλj>0 λj^(−2)<∞`.

Use dyadic blocks `2^k≤λ<2^(k+1)`, each of size `O(2^k)`. For complex parameters take the real-part infimum on the compact domain. Exponential decay dominates the same dyadic counts for heat sums.

See [116][R116], §4 small-time/discrete-spectrum assumptions, pp.13–15; Sarnak §1 (1.2)–(1.3), p.603.

<a id="s6-12g"></a>

**§6.12g Heat Mellin identity.** For `Res>1`, `ζΔ(s)=Γ(s)^(−1)∫0∞(H(t)−1)t^(s−1)dt`.

Use positive-spectrum Weyl bounds to dominate the small-t integral. Use the positive spectral gap for exponential decay as `t→∞`. Apply dominated interchange and the scalar gamma integral term by term.

<a id="s6-12h"></a>

**§6.12h Exponential heat decay after zero subtraction.** If `λ1>0` and the Weyl bound holds, then for `t≥1`, `|H(t)−1|≤C exp(−λ1 t/2)`, with `C=Σj≥1 exp(−λj/2)<∞`. Consequently the Mellin integral from 1 to infinity is entire in its parameter.

Monotonicity gives `lambda_j>=lambda_1` for all positive modes. Split `exp(-t lambda_j)` into `exp(-t lambda_j/2)` times itself and bound one factor by `exp(-t lambda_1/2)`. Weyl summability bounds the remaining sum at `t>=1`; every Mellin derivative is integrable against this exponential tail.

See [116][R116], §4 continuation argument, pp.13–15; Sarnak §1, p.603.

<a id="s6-12i"></a>

**§6.12i Subtracting small-time heat coefficients.** Write `H(t)=Σj≥0 exp(−tλj)`, including its simple zero mode. The positive spectral Mellin integral uses `H(t)−1`. If `H(t)=Σk=0.N` ak `t^(k−1)+O(t^N)`, then subtract `Σk=0.N` ak `t^(k−1)−1`. Its integral on (0,1) is `Σk=0.N ak/(s+k−1)−1/s`. The remainder integral is holomorphic for `Re s>−N` under locally uniform remainder bounds; thus the coefficient at `s=0` is `a1−1`, not `a1`.

Use the [§6.12d](#s6-12d), with constants depending on this fixed surface and the subtraction order. Split the Mellin integral of `H(t)−1` at 1; subtract the zero mode along with the finite heat expansion. Integrate the polynomial to `Σ ak/(s+k−1)−1/s` and dominate the remainder locally for `Re s>−N`.

<a id="s6-12j"></a>

**§6.12j Holomorphic remainder after heat subtraction.** If `H(t)=Σk=0.N` ak `t^(k−1)+RN(t)`, with `|RN(t)|≤CN t^N` on (0,1], then `integral_0^1 t^(z−1)RN(t)dt` is holomorphic for `Rez>−N`, locally uniformly in `z`. For the positive heat trace `H−1` the rational terms are `Σk=0.N ak/(z+k−1)−1/z`.

On a compact parameter set use the lower real-part bound `−N+δ` and integrable majorant `t^(δ−1)`. Parameter derivatives introduce powers of `log t`, still integrable; the rational terms are separate germ identities.

See [116][R116], §4 (4.5)–(4.6), pp.14–15; positive-spectrum correction from Sarnak (1.3), p.603.

<a id="s6-13"></a>

### 6.13 Entire shifted determinant

The canonical shifted determinant D is entire in `u`, agrees with the zeta determinant for `Reu>0`, has `D(u)/u→det′Δ` at 0, and includes all eigenvalues with their multiplicities. Its function, rather than a branch of its logarithm, is continued.

Summability of `λ_j⁻²` gives a compact-normal genus-one product; its exponential prefactor never vanishes. Integrate the shifted-zeta derivative on `Re u>0` and fix the constant at0.

- `TauCeti.SpectralZeta.ShiftedDet.entire`: The whole shifted family is entire.
- `TauCeti.SpectralZeta.ShiftedDet.agrees`: On `Reu>0` it is the exponentiated derivative of the jointly continued `ζu`.
- `TauCeti.SpectralZeta.ShiftedDet.zero_mode`: `D(u)/u` tends to det′Δ at `u=0`, retaining the simple zero mode.

**Checks.**

- The actual infinite-family determinant vanishes at `u=0`, retaining the zero eigenvalue.
- At `u=1`, the actual genus-one family equals `exp(−ζ1′(0))`.
- If eigenvalue `λ1=1/4`, the actual infinite determinant at `−1/4` vanishes; its quadratic pullback multiplicity is governed by the exact zero-divisor lemma.

See [116][R116], §4 (4.2)–(4.6), pp.13–15, for heat regularization and zero-mode removal; canonical product derived in this roadmap.

*Needs:* `B11`; [§6.13a](#s6-13a); [§6.13b](#s6-13b).

<a id="s6-13a"></a>

**§6.13a Two-parameter shifted spectral zeta.** On `Reu>0`, `Rez>1` define `ζu(z)=Σj≥0 exp(−z Log(λj+u))` with the principal logarithm. Compact-uniform Weyl bounds give joint holomorphy. Heat subtraction with `exp(−ut)` continues it meromorphically in `z`, jointly holomorphic in `u`, and regular at `z=0`. It satisfies `∂u ζu(z)=−z ζu(z+1)` where both sides are initially convergent, hence as germs.

Bound lambda+u away from the principal logarithm cut on compact subsets of `Re u>0`. Weyl estimates dominate the series and derivatives for `Re z>1`. Multiply the full heat expansion by `exp(-ut)`, subtract finitely many terms, and continue the resulting Mellin germs jointly.

See [116][R116], §4 Laplace–Mellin continuation, pp.13–15; Theorem 6.1 determinant argument, p.20.

<a id="s6-13b"></a>

**§6.13b Genus-one determinant product.** Let `ζ+` be the positive spectral continuation and `F(z)` its analytic pole clearance `(z−1)ζ+(z)` near 1. The shifted determinant extends as `D(u)=u exp(−ζ+′(0)+F′(1)u)∏j≥1(1+u/λj)exp(−u/λj)`. The product is normally convergent on all compact u sets since `Σλj^(−2)<∞`. On `Reu>0` it equals `exp(−∂z ζu(0))`.

Differentiate `log(D(u)/u)` twice; heat/Mellin differentiation gives `−Σj≥1(λj+u)^(−2)`. The genus-one product has the same second derivative, so the quotient is `exp(a+bu)`. At `u=0` the constant is det′Δ; the linear coefficient is the finite part of `ζ+` at 1, namely `F′(1)`.

<a id="s6-14"></a>

### 6.14 Positive diagonal homomorphism

`diagEntry:axbRat→Q×` takes the lower-right entry, is multiplicative and has positive rational values. It is invariant under left and right integral translations.

The lower-left zero entry removes the cross term in the lower-right product. Positivity gives a nonzero rational unit; integral translations have diagonal 1, so both coset actions preserve this unit.

- `diagEntry_pos`: The rational value is positive.
- `diagEntry_coset_invariant`: The value descends to an ax+b double coset.
- `diagEntry_translation`: Every `translation` has diagonal value one.

**Checks.**

- The identity has diagonal value 1.
- Dilation 2 has value 2.
- Values 2 and 3 multiply to 6.

See [112][R112], Ch.3 §4.2, pp.460–462.

*Needs:* [§6.1](#s6-1); [§6.7](#s6-7).

<a id="s6-15"></a>

### 6.15 The regularized scalar Laplace determinant

If the meromorphic continuation `ζΔ` is analytic at0, define `det′Δ=exp(−ζ′Δ(0))`. For real `v>0` use all eigenvalues includingλ0 in `ζΔ+v(z)=Σj≥0(λj+v)^(−z)`, continued to `z=0`, and `det(Δ+v)=exp(−∂z ζΔ+v(0))`. A prime removes zero modes. No ordinary divergent eigenvalue product is assigned a value.

Prove regularity at0 via the heat Mellin argument. Take the complex derivative of that continuation and exponentiate its negative. For the shifted determinant, use `v>0` to keep all eigenvalues positive.

- `TauCeti.SpectralZeta.RegularizedDet.ofZeta`: For the analytic continuation f at0, `exp(−f′(0))`.
- `TauCeti.SpectralZeta.RegularizedDet.shifted`: The determinant from the shifted spectral continuation.
- `TauCeti.SpectralZeta.RegularizedDet.scale`: `det′(cΔ)=c^(ζΔ(0))det′Δ` for `c>0`.

**Checks.**

- A finite one-eigenvalue spectrum gives determinantλ.
- An empty positive spectrum gives1.
- A finite two-eigenvalue spectrum gives `λ1λ2`, including multiplicities.

See [115][R115], §1, (1.1)–(1.5), p.603.

*Needs:* [§6.4][R453]; `mellin`; `Complex.Gamma`; [§6.12](#s6-12).

<a id="s6-16"></a>

### 6.16 (P⁺_ℚ, P⁺_ℤ) is a Hecke pair

IsHeckeTriple `(axbRat as a submonoid)` `axbInt axbInt`: every g `∈ P⁺_ℚ` commensurates `P⁺_ℤ`. Explicitly, for `a(g) =` n/m in lowest terms, `P⁺_ℤ ∩ g P⁺_ℤ g⁻¹` is the `translation` group by `mℤ`, of index m in `P⁺_ℤ` and index n in g `P⁺_ℤ g⁻¹`. Equivalently (Bost–Connes' condition), the orbits of `P⁺_ℤ` on `P⁺_ℚ/P⁺_ℤ` are finite.

For coprime m,n, conjugation gives(m/n)Z, whose intersection with Z is `mZ`. The indices are m,n, hence commensurability and `IsHeckeTriple.of_diagonal` for `P⁺_Z≤P⁺_Q`.

For `g = dilation 2` the two indices are 1 and 2; for `g = dilation (1/2)` they are 2 and 1.

See [112][R112], Ch. 3, §4.2, (3.62), p. 460.

*Needs:* [§6.1](#s6-1); `IsHeckeTriple`; `IsHeckeTriple.of_diagonal`; `Subgroup.Commensurable`; `Subgroup.relIndex`; [§6.7](#s6-7); [§6.8][R465]; [§6.14][R466]; [§6.16a](#s6-16a).

<a id="s6-16a"></a>

**§6.16a Conjugation of translations.** For `g∈axbRat` and `b∈Q`, g translation(b) `g⁻¹=translation(b/diagEntry(g))`.

Use the explicit inverse matrix and multiply all three factors. The upper-right entry is b/a and the diagonal is 1.

See [112][R112], Ch.3 §4.2, pp.460–462.

<a id="s6-17"></a>

### 6.17 The compact Selberg determinant comparison

For the selected scalar compact surface, `det(Δ+s(s−1))=ZΓ(s)I_g(s) exp(2(g−1)[2ζ′(−1)−log√(2π)])` for real `s>1`, extended by the proved analytic continuation. Thus `det′Δ=Z′Γ(1)(2π)^(g−1)exp(4(g−1)ζ′(−1))`. The sign is the corrected `v2` sign; source v1(1.3) has the opposite Euler-characteristic sign.

Combine the hyperbolic and identity Laplace–Mellin derivatives. Determine the additive logarithmic constant from the prescribed large-s expansion. At `s=1` remove the simple zero eigenvalue and use `Γ(1)=G(2)=1`.

See [116][R116], §6 Theorem 6.1 (6.1), pp.20–24, scalar m=0 and trivial representation; §8.3 (8.8), p.28.

*Needs:* `B4`; [§6.15](#s6-15); [§6.12](#s6-12); `Complex.Gamma`; `mellin`; [§6.17a](#s6-17a); [§6.17b](#s6-17b); [§6.17d](#s6-17d); [§6.17e](#s6-17e); [§6.17f](#s6-17f).

<a id="s6-17a"></a>

**§6.17a Compact geodesic-series majorant.** The primitive length spectrum has positive systole `ℓ0`, finite counts below any height and `Nprim(T)≤Cexp(T)`. These imply compact-normal convergence of `Σp,m≥1 exp(−msℓp)/(m(1−exp(−mℓp)))` on `Res>1`, including its s derivatives. Each primitive conjugacy class uses exactly the orientation convention of the Gaussian trace supplier.

Use the positive systole to bound the geometric denominator away from zero. Sum in unit length intervals using the exponential count; on a compact right half-plane the surplus real exponent absorbs the polynomial factors produced by derivatives.

See [116][R116], §5 Lemma 5.1 proof, (5.9)–(5.11), pp.16–17; scalar representation.

<a id="s6-17b"></a>

**§6.17b Logarithmic derivative of the primitive product.** For `Res>1`, expand `log(1−e^(−(s+k)ℓp))` and sum k geometrically. This gives `Z′/Z=Σp,m≥1 ℓp e^(−msℓp)/(1−e^(−mℓp))`, locally uniformly.

Use the geodesic-count bound with a strict real-part margin. Justify derivative and summation interchanges. Sum the k-series and preserve the primitive/power weights.

See [118][R118], §1, (1)–(2), pp.1–2.

<a id="s6-17c"></a>

**§6.17c The compact scalar heat trace input.** For `t>0`, `H(t)=area(X)/(4π)∫R r tanh(πr)e^(−t(r²+1/4))dr +Σp,m≥1 ℓp/[2sinh(mℓp/2)]` · `e^(−t/4−(mℓp)²/(4t))/√(4πt)`. Class multiplicities agree with the primitive list fixed above. There are no cusp, elliptic or continuous-spectrum terms in this selected compact torsion-free case.

Use the [§6.12c][R454], including the positive-kernel trace identity and both primitive orientations. This supplies the Fourier constants and convergent noncompact Gaussian directly; compact-support approximation is unnecessary.

See [116][R116], §5 equations (5.1)–(5.3), p.16, scalar trivial twist m=0; remove the 1/4 operator shift; no elliptic terms.

<a id="s6-17d"></a>

**§6.17d Elementary half-order Laplace integral.** For `a>0`, `Re w>0` and `Re(w²)>0`, the convergent integral `∫₀∞ t^(−3/2) exp(−w²t−a²/(4t))` dt equals `(2√π/a) exp(−aw)`. This integral-defined function has a holomorphic continuation to `Re w>0` given by the same exponential expression; the original integral is not asserted to converge throughout that half-plane. The elementary half-order evaluation avoids a general Bessel-function package.

For positive real w reduce by `t=a²/(4v²)` to a Gaussian integral and differentiate the usual Gaussian parameter identity. Use a common integrable majorant on compact subsets of `Re(w²)>0`, `Rew>0`. The resulting exponential expression extends to the right w half-plane.

See [116][R116], §5 (5.10), Lemma 5.3 and Proposition 5.4, pp.17–18.

<a id="s6-17e"></a>

**§6.17e Normal convergence of the hyperbolic transform.** For the scalar compact trace, choose `Rew>0` and `Re(w²)>C` with `w=s−1/2` and C large enough for the geodesic count. The heat transform is jointly holomorphic in z,s on this region, locally uniform for every compact z set; sum, integral and z derivative may be interchanged. Continuation, not the integral itself, is then used outside this region.

Use the exponential length bound and the systole to dominate each term uniformly for compact parameter sets. Integrable decay at 0 comes from `exp(−ℓ²/(4t))`; at infinity it comes from `Re(w²)>C`. `Log` powers from z derivatives retain the same exponential majorant.

See [116][R116], §5 Lemmas 5.1–5.3, pp.16–18, with the explicit safe region.

<a id="s6-17f"></a>

**§6.17f Hyperbolic transform is the Selberg logarithm.** For real `s>1`, the Laplace–Mellin transform of the hyperbolic heat contribution in the shifted determinant has derivative at Mellin exponent0 equal `to−log ZΓ(s)`. This is the scalar specialization of JSS Proposition5.4; the integral proof uses the explicit Laplace identity and the compact-uniform geodesic majorant.

Use `e^(−t(s−1/2)²)` after factoring `e^(−t/4)` from the heat trace. Evaluate the scalar Gaussian Laplace–Mellin integral term by term. Use the absolute geodesic sum and the primitive product expansion.

See [116][R116], §5 Lemmas 5.1–5.3 and Proposition 5.4, pp.17–18; determinant proof §6.

<a id="s6-17g"></a>

**§6.17g Identity contribution and Barnes normalization.** Let `C=area(X)/(4π)=g−1`. The scalar identity factor is `I_g(s)=exp(2C[s log(2π)+s(1−s)+logΓ(s)−2logG(s+1)])`, where G is the classical Barnes G-function normalized by `G(1)=1`, `G(s+1)=Γ(s)G(s)` and the source asymptotic expansion. The full normalization/asymptotic input is required; recurrence alone is insufficient.

Differentiate the identity Laplace–Mellin term in s and evaluate the contour integral as the digamma combination in JSS(6.5). Use the normalized Barnes logarithmic derivative (source(2.8)). Recover the integration constant from the large-real-s asymptotics, as in the final paragraph of the proof. Check the scalar derivative `−2C(2s−1)ψ(s)` using `(2.8)`. This agrees with the identity heat transform and `(8.4)`. Do not specialize the incompatible Gamma coefficient in `(6.2)`; source issue the normalization convention records that discrepancy.

See [116][R116], §6 proof of Theorem 6.1, (6.5)–(6.7) and asymptotic constant, pp.21–24; (2.8)–(2.9), p.9; scalar (8.4), p.27.

<a id="s6-17h"></a>

**§6.17h Branch-independent identity factor.** For integer `g≥2`, the scalar identity factor has the single-valued meromorphic form `I_g(s)=(2π)^(2(g−1)s) exp(2(g−1)s(1−s)) Γ(s)^(2(g−1))/G(s+1)^(4(g−1))`. It equals the stated exponential logarithmic formula on a simply connected right-half-plane. Its integer exponents remove logarithm branch ambiguity.

Exponentiate the logarithmic formula on a simply connected right-half-plane. The integer genus-dependent exponents turn the Gamma and Barnes factors into a single-valued meromorphic function. Equality on the original domain identifies its continuation.

See [116][R116], Scalar formula (8.4), p.27, checked against §6 (6.5)–(6.7), pp.21–23; the conflicting literal specialization of (6.2), p.20, is recorded in the normalization convention.

<a id="s6-18"></a>

### 6.18 The Bost–Connes Hecke algebra

For a field K of characteristic zero, the Bost–Connes Hecke algebra is `BCHecke K = 𝕋 P⁺_ℚ P⁺_ℤ K`, Tau Ceti's Hecke ring of the Hecke pair of ax-plus-b-hecke-triple with coefficients in `K`: finitely supported K-valued functions on double cosets, with Shimura's convolution product. Its product is the Bost–Connes convolution `(f₁ ∗ f₂)(g) = Σ_{g₁ ∈ Γ/Γ₀} f₁(g₁) f₂(g₁⁻¹g)` `(BC (1))`, because Tau Ceti's multiplicity counts pairs of left-coset representatives. `K = ℚ` gives the rational Hecke algebra `H_ℚ(Γ, Γ₀)` of `ℚ-valued` functions, and `K = ℂ` gives BC's `H`. The named elements are `x_n = [X_n]` with `X_n` the class of `dilation n`, `x′_n = [X_n⁻¹]` the class of `dilation (1/n)`, and `e(γ) =` `[class of translation γ]` for `γ ∈ ℚ/ℤ`. For `K = ℂ` the involution is `f*(X) =` conj `f(X⁻¹)`, which sends `x_n` to `x′_n` and `e(γ)` to `e(−γ)`.

Assume K a field of characteristic zero (for the involution, `K = ℂ`).

Use HeckeCosetModule.instRingHeckeRing and coefficientwise K-scaling. With `D₁=⊔σᵢgΓ₀,D₂=⊔τⱼhΓ₀`, each contributing i has exactly one j with `dΓ₀=σᵢgτⱼhΓ₀`, identifying BC convolution with Tau Ceti multiplicity. Translation classes depend only `onγ modZ` by double-cosets-and-degrees. Inversion exchanges(g,h;d) `with(h⁻¹,g⁻¹;d⁻¹)`, with BC(2)'s degree exchange; coefficient conjugation gives the conjugate-linear anti-automorphism.

- `BCHecke`: `BCHecke K :=` HeckeRing axbRat.toSubmonoid `axbInt K`, with Ring and Algebra K instances.
- `BCHecke.x`: x `n =` single `[X_n]` for `n : ℕ+`, `X_n` the double coset of `dilation n`.
- `BCHecke.x'`: `x' n =` single `[X_n⁻¹]`, the double coset of `dilation (1/n)`.
- `BCHecke.e`: `e : ℚ/ℤ → BCHecke K` `(AddCircle (1 : ℚ) as ℚ/ℤ)`, e `γ =` single `[class of translation γ]`.
- `BCHecke.e_zero`: e `0 = 1`.
- `BCHecke.e_add`: e `(γ + δ) = e γ * e δ`.
- `BCHecke.mul_eq_convolution`: `(f₁ * f₂)` evaluated at the class of d is `Σ` over left cosets `g₁Γ₀` of `f₁(g₁) f₂(g₁⁻¹d)`: Tau Ceti's product is Bost–Connes' convolution `(1)`.
- `BCHecke.star`: For `K = ℂ: a` StarRing structure with `(star f) X =` conj `(f X⁻¹)`, `star (x n) = x' n`, `star (e γ) = e (−γ)`.
- `BCHecke.map`: A field homomorphism `φ:K→L` induces a ring homomorphism on coefficients, compatible with `x`, `x′` and `e`. If an algebra structure on L induced by `φ` is supplied it is a K-algebra homomorphism. The rational inclusion is injective.

**Checks.**

- e `(1/2) * e (1/2) = 1` in `BCHecke ℚ`.
- `x' 2 * x 2 = 2` in `BCHecke ℚ`: the two left cosets of `X₂⁻¹` both multiply into the identity coset.
- x `2 * x' 2 = 1 + e (1/2)` in `BCHecke ℚ`, so x 2 is not invertible.
- e `(1/2) * x 2 ≠ x 2 * e (1/2)`: the algebra is not commutative, unlike the `GL₂` Hecke rings.
- x `1 = 1` and `x' 1 = 1`.

`BCHecke K` is not commutative: `e(1/2)·x₂ = x₂` while `x₂·e(1/2) ≠ x₂` `(rational-presentation, relation (e′))`. So Tau Ceti's commutativity criterion (HeckeCosetModule.commSemiringOfAntiInvolution) must not apply to this pair.

See [112][R112], Ch. 3, §4.2, (3.61)–(3.65), p. 460; [113][R113], §4, proof of Proposition 18, formulas (1)–(2), p. 431 (PDF p. 21); [113][R113], §4, notations (α), (β), p. 431 (PDF p. 21).

*Needs:* `B3`; `HeckeRing`; `HeckeCosetModule`; `HeckeCosetModule.instRingHeckeRing`; `HeckeCosetModule.single`; `HeckeCosetModule.mul_single_single`; `AddCircle`.

<a id="s6-18a"></a>

**§6.18a Double-coset coordinate bijection.** For positive coprime n,m, `b↦class([1,b/m;0,n/m])` factors through Q/Z. The resulting map from triples `(n,m,γ)`, `gcd(n,m)=1`, to axbInt\axbRat/axbInt is bijective. Equality of two representatives with fixed n,m is exactly equality of `γ` in Q/Z.

Reduce the positive rational diagonal uniquely to n/m in lowest terms. Left and right integral translations change b by `Z+(n/m)Z=(1/m)Z`. Multiplication by m identifies the remaining coordinate with Q/Z and proves injectivity and surjectivity.

See [112][R112], Ch.3 §4.2, pp.460–462.

<a id="s6-18b"></a>

**§6.18b Double cosets of the ax+b pair and their degrees.** The left-coset degree of an ax+b double coset X is `den(cosetEntry X)`, where `cosetEntry` is its positive rational diagonal value.

Left multiplication by `[1 k; 0 1]` sends `[1 b; 0 a]` to `[1, b + ka; 0, a]` and right multiplication by `[1 j; 0 1]` sends it to `[1, b + j; 0, a]`; so the double coset is b `mod ℤ + aℤ = (1/m)ℤ`, with a unchanged. `HeckeCoset.degree_eq_relIndex`: the degree is the index of `P⁺_ℤ ∩ g P⁺_ℤ g⁻¹` in `P⁺_ℤ`, which is m by ax-plus-b-hecke-triple; the inverse double coset has (2,2) entry `1/a =` m/n, so its degree is `n`.

See [112][R112], Ch. 3, §4.2, (3.71)–(3.72), p. 461.

<a id="s6-19"></a>

### 6.19 The compact Selberg functional equation

With `D_g(s)=I_g(s)exp(2(g−1)[2ζ′(−1)−log√(2π)])`, the continued scalar Selberg function satisfies `ZΓ(s)D_g(s)=ZΓ(1−s)D_g(1−s)` as a meromorphic identity. This formulation fixes all Barnes branches by continuation from real `s>1` and avoids an unnormalized path integral.

The shifted operator `Δ+s(s−1)` is unchanged by `s↦1−s`. Use the determinant comparison on its domain and continue. Multiply by the explicit identity factors to obtain a branch-consistent equation.

See [116][R116], Theorem 6.1 (6.1), p.20; scalar (8.4), p.27; (8.8), p.28. Use the scalar identity factor confirmed by the heat derivative, as specified in the normalization convention.

*Needs:* `B4`; [§6.17](#s6-17).

<a id="s6-20"></a>

### 6.20 Selberg zeros and scalar spectral parameters

On `0<Res<1`, zeros of the continued scalar `ZΓ` are exactly the solutions `s(1−s)=λ>0`. An eigenvalue of multiplicity m contributes order m at each root when `λ≠1/4`, and order `2m` at `s=1/2` when `λ=1/4`. For `λ>1/4` the two roots have real part `1/2`; for `0<λ<1/4` both are real in (0,1). Separately, the simple zero mode gives order 1 at `s=1` and order `2g−1` at `s=0` after the identity-factor pole. Other trivial zeros are not called spectral.

Use the shifted determinant zeros with eigenvalue multiplicity. Separate the explicit identity-factor zeros/poles. Solve the quadratic relation and retain small positive eigenvalues.

The spectral zeros occur at both solutions of `s(1−s)=λj`, with multiplicities determined by the determinant comparison and the identity factor. For `λj≥1/4` they lie on `Res=1/2`; for `0<λj<1/4` they are real in(0,1). The zero mode gives `s=0,1`. Identity-factor trivial zeros are separated before calling zeros spectral; no Riemann RH consequence follows.

See [118][R118], §1, (1)–(2), pp.1–2.

*Needs:* `B4`; [§6.17](#s6-17); [§6.20a](#s6-20a); [§6.20b](#s6-20b); [§6.20c](#s6-20c).

<a id="s6-20a"></a>

**§6.20a Exact shifted determinant zero divisor.** `D(u)` vanishes exactly at `u=−λj`, with order equal to the eigenvalue multiplicity. Around each such `u0`, `D(u)=(u−u0)^m h(u)`, with h holomorphic and nonzero at `u0`. The finite factors for that eigenvalue are separated from the normally convergent nonvanishing residual product.

Separate the finitely many factors for the selected eigenvalue. The other canonical factors converge normally and are nonzero locally, as is the exponential prefactor. Their product is the analytic unit multiplying the required finite power.

See [116][R116], §4 (4.2)–(4.6), pp.13–15, for heat regularization and zero-mode removal; canonical product derived in this roadmap.

<a id="s6-20b"></a>

**§6.20b Spectral quadratic pullback multiplicity.** For `q(s)=s(s−1)`, if D has order m at `u0=−λ` and `q(s0)=u0`, then D∘q has order m when `s0≠1/2` and order `2m` when `s0=1/2` `(necessarily λ=1/4)`. This uses `q(s)−q(s0)=(s−s0)(s+s0−1)`; at `s0=1/2` it is `(s−1/2)²`.

Factor `q(s)-q(s0)=(s-s0)(s+s0-1)`. The second factor is a unit unless `s0=1/2`; at that point both factors coincide. Substitute into the local determinant factorization to obtain orders m and `2m`.

See [118][R118], Zagier §1 spectral relation, p.2; polynomial pullback refinement.

<a id="s6-20c"></a>

**§6.20c Identity factor at spectral points.** `I_g` is holomorphic and nonzero on `Res>0`. At `s=0` it has a pole of order `2g−2`, because `Γ` has a simple pole there and `G(1)=1`; at `s=1` it is finite and nonzero. Thus spectral points in `0<Res<1` are unaffected, while `ZΓ` has order `2g−1` at 0 and order 1 at 1.

Apply the Gamma and normalized Barnes zero/pole divisors in the open right half-plane. At zero Gamma has pole one while `G(s+1)` is a unit, giving pole order 2g-2. Combine with the simple determinant zero at `q(0)=q(1)=0`.

See [116][R116], §2.5 Barnes zeros, p.9; §8.1, pp.26–27; scalar identity factor.

<a id="s6-21"></a>

### 6.21 The presentation of the rational Bost–Connes algebra

Let K be a characteristic-zero field and B a unital K-algebra. Any families `X_n,X′_n,Eγ` in B satisfying the eight displayed rational relations induce a unique K-algebra homomorphism `BCHecke K→B` taking `x_n,x′_n,eγ` to these families. Thus the Hecke algebra has the stated algebraic presentation; the lift is determined on the coprime normal-form basis.

Throughout §§6.21–6.21n, K is a characteristic-zero field and x,x′,e are the rational, unnormalized Hecke generators.

Define the lift on the normal-form basis by `X_n Eγ X′_m`. The same finite rewriting proves product compatibility in `B`; check 1 and scalars. Every Hecke element is a finite basis sum, so its generator values determine the homomorphism.

`(f′)` with `γ = 0` gives `x_n x′_n = Σ_{nδ=0} e(δ)`, so `π_n = x_n x′_n / n` is an idempotent. The printed formula `(7)` of Bost–Connes, with upper right entry `γ` instead of `γ/m`, would make `e(1/2)·x′₂` and `x′₂` the same basis element, although they differ (the normal-form convention in §6.18).

See [113][R113], §4, Proposition 18, p. 431 (PDF p. 21); [113][R113], §4, proof of Proposition 18, formula (7), p. 433 (PDF p. 23); corrected as the normal-form convention in §6.18; [112][R112], Ch. 3, §4, Proposition 3.23, p. 457.

*Needs:* `B3`; [§6.18][R486]; `HeckeCosetModule.single_mul_single`; `HeckeCosetModule.mul_single_single`; `AddCircle`; `PNat`; `HeckeCosetModule.single`; [§6.21a][R487]; [§6.21b][R488]; [§6.21c][R489]; [§6.21d][R490]; [§6.21e][R491]; [§6.21f][R492]; [§6.21g][R493]; [§6.21h][R494]; [§6.21i][R495]; [§6.21j][R496]; [§6.21k][R497]; [§6.21l][R498]; [§6.21m][R499]; [§6.21n](#s6-21n).

<a id="s6-21a"></a>

**§6.21a Left inverse of a dilation.** For `n≥1`, x′n `xn=n·1`.

Count the n left-coset representatives of Xn inverse; each product with Xn is in the identity class. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to `K`.

See [113][R113], §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="s6-21b"></a>

**§6.21b Coprime dilation commutation.** For coprime `n,m≥1`, xn `x′m=x′m` xn.

Use the finite coset decomposition and the residue bijection modulo coprime n,m. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to `K`.

<a id="s6-21c"></a>

**§6.21c Dilation multiplication.** For `n,m≥1`, `x(nm)=xn` xm.

The positive integral `dilation` cosets have the single representative needed for this product. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to `K`.

<a id="s6-21d"></a>

**§6.21d For n,m≥1, x′(nm)=x′n x′m..** For `n,m≥1`, `x′(nm)=x′n` x′m.

Compute the inverse `dilation` coset representatives and count each output once. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to `K`.

<a id="s6-21e"></a>

**§6.21e Cancellation of common dilation factors.** For `q=gcd(m,n)`, `μ_m* μ_n=μ_(n/q) μ_(m/q)*`. The rational version includes the scalar `q: x′_m x_n=q x_(n/q) x′_(m/q)`.

Factor n and m by `q=gcd(n,m)`, cancel the common isometry using the left-inverse relation and commute the remaining coprime factors. Rescaling back to x and x-prime contributes the scalar `q`.

See [113][R113], BC95 Proposition 18 proof, p.433.

<a id="s6-21f"></a>

**§6.21f For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements..** For `n≥1` and `γ∈ℚ/ℤ`, xn `e(γ)x′n=Σnδ=γ e(δ)`; the fiber has n elements.

Enumerate the n residue representatives of the inverse `dilation` and match the translations to the n-element fiber. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to `K`.

<a id="s6-21g"></a>

**§6.21g Finite translation fibres.** For `n≥1` and `γ∈Q/Z`, `{δ:nδ=γ}` has exactly n elements. For `γ` represented by `a∈Q`, its elements are (a+j)/n modulo `Z`, `0≤j<n`.

Choose a rational lift of gamma. The n displayed preimages are distinct modulo `Z`, since their differences are (j-k)/n. Every preimage differs from the chosen lift divided by n by an element of the n-torsion subgroup.

See [112][R112], Proposition 3.23, relation (3.51), p.457; finite coset calculation pp.431–433 of BC95.

<a id="s6-21h"></a>

**§6.21h Reduction to coprime normal forms.** For `q=gcd(n,m)`, `x_n eγ x′_m=Σqδ=γ x_(n/q)eδ x′_(m/q)`. After the finite sum every remaining `dilation` pair is coprime.

Factor out the common `dilation q`. Apply its preimage-sum relation to `e(gamma)`, then multiply by the remaining two `dilation` factors. The preimage cardinality gives a finite sum and the new `dilation` pair is coprime.

<a id="s6-21i"></a>

**§6.21i For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ)..** For `n≥1` and `γ∈ℚ/ℤ`, `e(γ)xn=xn e(nγ)`.

The corresponding triangular matrices multiply to the same representative. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to `K`.

<a id="s6-21j"></a>

**§6.21j For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ)..** For `γ,δ∈ℚ/ℤ`, `e(γ+δ)=e(γ)e(δ)`.

Multiply the single `translation` representatives, independent of their integer lifts. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to `K`.

<a id="s6-21k"></a>

**§6.21k Normal-form multiplication and common-divisor reduction.** The K-linear span of the coprime normal forms `x_n eγ x′_m` is a subalgebra of `BCHecke K`; over C it is `star` closed. Product reduction uses the gcd cancellation and finite preimage reduction in separate lemmas.

Use the separately listed generator relations; do not reprove them inside the normal-form closure lemma. Use the displayed gcd cancellation and character-transport formulas of p.433. Reduce a noncoprime outer pair with `μq eγ μq*=q^(−1)Σqδ=γ eδ`.

See [113][R113], §4, Proposition 18 and complete proof, pp.431–433.

<a id="s6-21l"></a>

**§6.21l Normal-form support.** For positive coprime n,m and `γ` represented by `a∈Q`, `x_n eγ x′_m` is the single Hecke basis vector at [1,a/m;0,n/m], with coefficient 1. Over C the corresponding `μ-normal` form is multiplied by `(nm)^(−1/2)`.

Apply the Hecke single-product multiplicities to the two dilations and `translation`. Coprimality leaves exactly the stated double coset with coefficient one; its complex normalization is the product of the two inverse square roots.

See [113][R113], BC95 Proposition 18 proof, (7), p.433, corrected γ/m.

<a id="s6-21m"></a>

**§6.21m The corrected double-coset basis is independent.** The family `(n,m,γ)↦x_n eγ x′_m` indexed by positive coprime n,m and `γ∈Q/Z` is linearly independent over `K`. Together with the support bijection it is a K-basis of `BCHecke K`.

Compute `eγ` x′m using the paper convolution, obtaining upper entryγ/m. Left multiply by xn and use uniqueness of the reduced positive rational n/m. Use independence of the Tau Hecke finitely supported basis; retain the normalization convention.

<a id="s6-21n"></a>

**§6.21n Zero translation.** `e(0)=1`.

The zero `translation` is the identity double coset. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to `K`.

<a id="s6-22"></a>

### 6.22 The Bost–Connes time evolution

For `z ∈ ℂ` let `σ_z : BCHecke ℂ → BCHecke ℂ` be `σ_z(f)(X) = a(X)^{iz} f(X)`, where `a(X) ∈ ℚ_{>0}` is the (2,2) entry of the double coset (double-cosets-and-degrees) and `a^{iz} = exp(iz log a)`. Each `σ_z` is a `ℂ-algebra` automorphism, `σ_0 = id` and `σ_{z+w} = σ_z σ_w`; for real `t`, `σ_t` is a *-automorphism. On generators `σ_z(x_n) = n^{iz}x_n`, `σ_z(x′_n) = n^{−iz}x′_n` and `σ_z(e(γ)) = e(γ)`. For real t this is Bost–Connes' `σ_t(f)(γ) = (L(γ)/R(γ))^{−it} f(γ)`, because `L(X)/R(X) = a(X)⁻¹`.

Since a is multiplicative and trivial on `P⁺_Z`, `m(g,h;d)≠0` implies `a(d)=a(g)a(h)`. Thus `σ_z` respects products, inverse `σ_−z` and addition in `z`. For real `t`, `a(X⁻¹)=a(X)⁻¹` and `|a^it|=1` give the star identity. Finally `L/R=den(a)/num(a)=a⁻¹`, so `(L/R)^−it=a^it`.

- `timeEvolution`: `timeEvolution (z : ℂ) : BCHecke ℂ ≃ₐ[ℂ] BCHecke ℂ`, with `(timeEvolution z f) X = (a X : ℂ)^(I * z) * f X`.
- `timeEvolution_zero`: `timeEvolution 0 = AlgEquiv.refl`.
- `timeEvolution_add`: `timeEvolution (z + w) = (timeEvolution z).trans (timeEvolution w)`.
- `timeEvolution_x`: `timeEvolution z (x n) = (n : ℂ)^(I * z) • x n`.
- `timeEvolution_x'`: `timeEvolution z (x' n) = (n : ℂ)^(−(I * z)) • x' n`.
- `timeEvolution_e`: `timeEvolution z (e γ) = e γ`.
- `timeEvolution_star`: For real `t`, `timeEvolution t (star f) = star (timeEvolution t f)`.
- `timeEvolution_eq_LR`: For real `t`, `(timeEvolution t f) X = ((L X : ℂ) / R X)^(−(I * t)) * f X` with `L`, R the degrees of X and `X⁻¹` (Bost–Connes `(3.71)`).

**Checks.**

- `timeEvolution t (x 2) = 2^(I t) • x 2`.
- `timeEvolution z (x 2 * x' 2) = x 2 * x' 2`, as it must be since `x 2 * x' 2 = 1 + e (1/2)` has `a = 1`.
- f `↦ (X ↦ L(X)^(it) f(X))` is not multiplicative: it fixes `x 2 * x' 2 = 1 + e(1/2)` (all `L = 1`) but multiplies `x' 2` by `2^(it)` and fixes x 2.
- `timeEvolution (−I/2) ((n : ℂ)^(−1/2) • x n) = x n`: `σ_{−i/2}` takes BC's `μ_n` to `x_n` (rational-forms-comparison).

Every element of `BCHecke ℂ` is entire for `σ`: `z ↦ σ_z(f)` is a finite sum of exponentials.

See [112][R112], Ch. 3, §4.1, Lemma 3.24, (3.60), p. 459; [112][R112], Ch. 3, §4.2, (3.71)–(3.72), p. 461.

*Needs:* `B3`; [§6.18][R486]; `Complex.cpow`.

### 6.23 Operator constructions for the Bost–Connes completion

The following constructions supply the analytic infrastructure used by the Bost–Connes branch. All algebras in this subsection are complex `star` algebras; completed algebras carry a `C⋆-norm`. Use Mathlib's Hilbert completions, bounded operators and completed `C⋆-GNS` representation where applicable. The extra step for an algebraic positive functional is boundedness of its generators before invoking those completed interfaces.

For the rational-presentation core after complexification, prove `positive_core_gns_bounded`: every normalized positive linear functional gives a pre-Hilbert quotient with inner product `⟨[a],[b]⟩=φ(a* b)`, and left multiplication by every `μ_n` and `e(γ)` is bounded by one. The `μ_n` are isometries and `e(γ)` are unitaries; these algebraic relations prove the needed inequalities on the quotient. The Hilbert completion gives a `star` representation. For `f=Σc_j μ_(n_j)e(γ_j)μ_(m_j)*`, its operator norm is at most `Σ|c_j|`. Define `bcUniversalCompletion` using the supremum over these representations, quotienting its null ideal before completion. The faithful regular representation proves that the core's null ideal is zero. Show that normalized positive functionals extend uniquely to states and that every core `star` representation extends uniquely to the completion.

The intended interface is:

- `positiveCoreGNS.coeff_bound`: the displayed finite coefficient sum bounds every represented operator, independently of the representation.
- `bcUniversalCompletion.lift`: core representations extend by continuity and are unique on the dense core.
- `bcUniversalCompletion.state_extend`: normalized algebraic positive functionals extend uniquely, preserving their core values.

**Checks.**

- For a scalar multiple c·1 the universal norm is `|c|`, and every normalized state takes the value `c`.
- For `μ₂`, the identities `μ₂*μ₂=1` and `μ₂μ₂*=α₂(1)` give norm one without equating the range projection with 1.
- For `e(1/2)`, the image is a self-adjoint unitary of square one. The bound applies to `1−e(1/2)` with coefficient bound two; positivity alone without generator bounds would not establish continuity for an arbitrary algebraic `star` algebra.

For the semigroup action on `A=C(Ẑ)`, define `α_n(f)(x)=f(x/n)` on nẐ and zero elsewhere. Construct the minimal automorphic `dilation B=C₀(A_f)`, with `β_q(f)(x)=f(q⁻¹x)`, and embed A by extension by zero. Use Laca’s injective-endomorphism `dilation` theorem, with its stated general contract for an abelian cancellative Ore semigroup `S`, its group `S⁻¹S` and a unital `C⋆-algebra A`; endomorphisms need not preserve 1. Minimality means B is the norm closure of the union of `β_s⁻¹(A)`. Form the full and reduced crossed products `B⋊S⁻¹S` with OperatorAlgebraDynamics D1–D2. Prove `semigroup_full_corner`: A⋊S is isomorphic to `p(B⋊S⁻¹S)p` for `p=i(1)`, and this corner is full. Since `Q_+×` is amenable, `D2` identifies the full and reduced crossed products; this is a separate input from `dilation`. Identify the resulting corner norm with the faithful Hecke regular norm.

The intended interface is:

- `minimalDilation.intertwine`: `β_s∘i=i∘α_s`, with the stated dense union and a unique intertwining isomorphism between minimal dilations.
- `semigroupCorner.generator`: `μ_n` corresponds to `U_n p`, with initial projection p and range projection `β_n(p)`.
- `semigroupCorner.norm_eq_regular`: the universal BC norm equals the faithful Hecke regular norm, by D2's amenable full=reduced theorem transported through the corner.

**Checks.**

- For `n=2`, `α₂(1)=1_(2Ẑ)` and is not `1_Ẑ`; its Haar mass is `1/2`.
- For the trivial semigroup, `dilation` and corner give A itself. For `A=ℂ` with the identity action of a group, its crossed product gives that group's `C⋆-algebra` rather than `ℂ`.
- In the finite-adele model, `β_(1/2)(1_Ẑ)=1_((1/2)Ẑ)`, so the dilated support grows. Reversing `β` or using `β_n(A)` instead of `β_n⁻¹(A)` fails minimality.

Take the faithful conditional expectation `E(Σ_q f_qU_q)=f_1` of the reduced crossed product from OperatorAlgebraDynamics `D2`; it compresses to a unital expectation from the corner to `C(Ẑ)`. Prove `scalingMeasureState`: integrating the compressed expectation against a probability measure on `Ẑ` yields a completed state. For a `β-scaling` extension to `A_f`, prove the KMS identities on the finite spectral core and then on the completion. Conversely a KMS state restricts to a probability measure and satisfies the scaling law; its off-diagonal coefficients vanish by dynamics unless their spectral ratio is one. The diagonal measure is unique. Use the commutative positive-functional measure representation at the boundary; prove its uniqueness and the weak evaluation comparison here.

The intended interface is:

- `cornerExpectation.coeff`: the compressed expectation extracts precisely the identity coefficient on the corner, respecting `star` and positivity.
- `cornerExpectation.one`: the corner unit p maps to 1 on `Ẑ`.
- `scalingMeasureState.restrict`: diagonal restriction recovers the original probability measure, and equality of all core coefficients determines the state.

**Checks.**

- For a nonidentity `q`, `E(fU_q)=0`, while `E(f)=f` for the identity coefficient.
- `E((fU_q)*(fU_q))=β_(q⁻¹)(|f|²)` is nonnegative; dropping the conjugation gives the wrong coefficient when f is nonconstant.
- A normalized scaling measure gives `φ(μ_nμ_n*)=n^(−β)`, whereas `φ(μ_n*μ_n)=1`. Interchanging initial and range projections breaks KMS.

OperatorAlgebraDynamics `D7` proves that the bounded-strip KMS condition may be checked on a norm-dense invariant algebra of entire elements. Apply it to the BC core as `kms_finite_spectral_core_iff`: the normal-form monomials are entire eigenvectors spanning a dense invariant `star` subalgebra, so a completed state is `KMS_β` precisely when `φ(ab)=φ(bσ_(iβ)(a))` on the core. Separately identify weak convergence of states with convergence on a norm-dense bounded set, and show that probability barycentres yield continuous evaluation maps.

**Checks.**

- An eigenvector with `σ_t(a)=r^(it)a` has `σ_(iβ)(a)=r^(−β)a`, with positive `r`; the opposite sign gives the wrong projection masses.
- For trivial dynamics on `M₂(ℂ)`, KMS states are exactly traces. The state `a↦a₁₁` is a ground state but is not KMS: with `a=E₁₂` and `b=E₂₁` its two products have values one and zero.
- `Norm` convergence of finite spectral approximants gives convergence of every state value. Weak convergence of measures need not give norm convergence of their corresponding functionals; distinct point masses remain at distance two.

See Laca, [122][R122], Theorem 2.1.1 and Lemma 2.1.3, pp.5–7, Theorem 2.2.1, pp.7–8, and Proposition 3.2.1, p.9; Bost–Connes, [113][R113], Proposition 18 and its amenability remark, pp.431–433; Connes–Marcolli, [112][R112], Chapter 3, Definitions 3.4–3.6, pp.445–447, and (3.19), p.450. These locate the constructions and finite-core criterion. The generator-bound proof is [§6.33a][R501]; [§6.33f][R502] and [§6.30a][R503] apply OperatorAlgebraDynamics D2 and D7 to the BC system. They are not inferred from Laca’s corner theorem.

*Needs:* OperatorAlgebraDynamics `D1`, `D2` and `D7`; `bcPositiveRationals_amenable`; Hilbert completions and bounded operators; positive `star` functionals; ProfiniteArithmetic and GlobalNumberFields' carriers; the rational core relations below. The universal completion and corner results are used after those core relations, and the state-measure reconstruction after the scaling measure has been constructed.

<a id="s6-24"></a>

### 6.24 The reduced Bost–Connes C*-algebra

Let `πleft` be convolution on `l²(P_Q⁺/P_Z⁺)`, using the paper’s right-coset convention and the Tau Hecke product comparison. Define `C_Q` as the operator-norm closure of `πleft(BCHecke C)` in bounded operators, a unital `star` subalgebra. This is distinct from an individual `πu` on `l²(N+)`, which is not the left regular carrier.

Finite double-coset degrees bound convolution. Verify the faithful `star` representation and take its star-subalgebra closure. `C⋆-completeness` and universal/reduced comparison remain separate leaves.

- `Completed.leftRegular`: Convolution on the `l²` right-coset carrier.
- `Completed.algebra`: The operator-norm closure of the left regular image.
- `Completed.embed`: The faithful dense star-algebra map from `BCHecke C` into `C_Q`.

**Checks.**

- The embedded unit is the identity operator.
- The embedded `μn` satisfies `μn*μn=1`.
- The embedded `μ2μ2*=(1+e(1/2))/2` is a proper projection, not1.

See [113][R113], §4, Proposition 18 and complete proof, pp.431–433.

*Needs:* `B8`; `StarSubalgebra.topologicalClosure`; [§6.24f](#s6-24f).

<a id="s6-24a"></a>

**§6.24a Inverse double-coset degree.** The degree of `X⁻¹` is `num(cosetEntry X)`, a positive integer. Thus `L(X)/R(X)=cosetEntry(X)⁻¹`. The numerator is its absolute natural numerator, since the diagonal value is positive.

Invert the reduced diagonal n/m, which exchanges n and `m`. Apply the degree formula to the inverse class, then divide the two positive integer degrees.

See [112][R112], Ch.3 §4.2, pp.460–462.

<a id="s6-24b"></a>

**§6.24b Finite convolution row and column counts.** On `Q=axbRat/axbInt` use `K_X(gH,hH)=1_X(g⁻¹h)`. Every row has `L(X)` nonzero entries and every column `R(X)=L(X⁻¹)`. These counts are constant on quotient representatives.

Fix one quotient variable and identify the nonzero kernel entries with the appropriate left-coset decomposition of `X`. Interchanging variables replaces X by its inverse. Translation invariance proves independence of quotient representatives.

See [113][R113], Proposition 3 and proof, p.414; finite support and Schur estimate refined explicitly here.

<a id="s6-24c"></a>

**§6.24c Schur estimate for one double coset.** For finitely supported `ξ` on `Q`, `‖K_X ξ‖₂²≤L(X)R(X)‖ξ‖₂²`. Consequently `K_X` extends uniquely to `l²(Q)` with operator `norm≤sqrt(L(X)R(X))`.

Bound each row square by L times the sum of its entry squares using Cauchy–Schwarz. Sum the rows; every input entry occurs R times. Extend on the dense finite-support subspace with this exact bound.

<a id="s6-24d"></a>

**§6.24d Bounded faithful left convolution.** For finite-support `f`, its left convolution on `l²(Q)` satisfies `‖λ(f)‖≤ΣX∈supp f |f(X)|sqrt(L(X)R(X))`. This gives the bounded algebra homomorphism `λ`; no C*-closure is used to obtain the estimate.

Write f as the finite sum of its single-coset basis coefficients. Use the triangle inequality and the preceding operator bound. Kernel convolution on finite-support vectors proves multiplicativity; extend by density.

<a id="s6-24e"></a>

**§6.24e Coefficient recovery and faithfulness.** For `δ_H` the unit vector at the identity coset, `(λ(f)δ_H)(gH)=f(class(g⁻¹))`. Thus `λ(f)=0` implies `f=0`. Faithfulness precedes the completion.

Evaluate the operator on the identity-coset unit vector. Only the identity input coordinate survives, recovering the coefficient at the inverse class. Vanishing of the operator therefore annihilates every coefficient.

<a id="s6-24f"></a>

**§6.24f Convolution preserves the adjoint.** For f in the complex Hecke algebra, `λ(f*)=λ(f)*`, since `K_(f*)(gH,hH)=conj K_f(hH,gH)`. Both sides are bounded, so equality on finite-support vectors suffices.

Reverse the two quotient variables in the finite-support kernel and conjugate the coefficients. Inner products on finite-support vectors prove the adjoint equality; boundedness extends it to the Hilbert space.

<a id="s6-25"></a>

### 6.25 Coefficient state on the Hecke core

Define `φbase(f)=f(identity double coset)`. Positivity follows from the faithful left-regular vector state at the identity coset; `φbase(1)=1`. It is the core KMS state at `β=1`. It has `φbase(eγ)=1` when `γ=0` and 0 otherwise.

Apply the identity-coset vector functional to the faithful convolution representation. Its value is the identity coefficient, and its value on a square is a squared norm. Compare modular degrees on basis products to obtain beta=1 KMS.

- `baseState_apply`: Evaluation at the identity double coset.
- `baseState_positive`: `φbase(f*f)≥0`, with `f*` denoting `star`.
- `baseState_e`: `φbase(eγ)=if γ=0` then 1 else 0.

**Checks.**

- `φbase(1)=1`.
- `φbase(e(1/2))=0`.
- `φbase(x2 x2*)=1` in rational normalization.

See [113][R113], Proposition 3, p.414; modular dynamics and state, pp.415–416.

*Needs:* `B8`; [§6.24f](#s6-24f).

<a id="s6-26"></a>

### 6.26 First trigonometric Eisenstein function

For `a∈Q/Z` and any positive N annihilating a, `e1,a=Σ1≤j<N(j/N−1/2)e(ja)` in the rational group algebra. The sum is independent of `N`. `firstEisenstein` uses this finite sum at the additive order of a in `AddMonoidAlgebra ℚ (AddCircle (1 : ℚ))`. Under a torsion character with `ρ(a)≠0` it evaluates to `cot(πρ(a))/(2i)`; at `ρ(a)=0` it is zero. Higher functions and their polynomial recurrence are separate constructions.

The finite rational Fourier sum at an annihilating level is unchanged under level multiples, hence common multiples. Evaluate torsion characters, including the trivial character's zero value.

- `ArithmeticEisenstein.first`: The first finite rational Fourier sum.
- `ArithmeticEisenstein.finite_sum`: For every positive N annihilating a, first a is the displayed sum.
- `ArithmeticEisenstein.neg`: first `(−a)=−first a`.

**Checks.**

- first `0=0`.
- first `(1/2)=0`.
- first `(1/3)=−e(1/3)/6+e(2/3)/6`.

For `a∈Q/Z` and `N>0` with `Na=0`, define `e1,a=Σ1≤k<N(k/N−1/2)e(ka)` in the rational group algebra. The expression is independent of `N`. On an invertible one-dimensional Q-lattice it `is(1/(2i))cot(πρ(a))` away `fromρ(a)=0`, and it is 0 on that degenerate locus. Define `P1(u)=u`, `Pk+1=(u²−1/4)P′k(u)/k` and `ek,a=Pk(e1,a)`. This includes the degenerate normalization Pk(0).

See [112][R112], Ch.3, §4.4, Lemmas3.27–3.28, (3.91)–(3.101), pp.464–465.

*Needs:* [§6.18][R486]; `Complex.exp`; `Polynomial`; [§6.26a](#s6-26a).

<a id="s6-26a"></a>

**§6.26a Finite cotangent Fourier identity.** For `N>0` and `ζ^N=1`, `Σ1≤j<N(j/N−1/2)ζ^j` equals `(ζ+1)/(2(ζ−1))` when `ζ≠1` and equals 0 when `ζ=1`. The nontrivial value is `cot(πt)/(2i)` for `ζ=exp(2πit)`. Passing to a multiple of N gives the same value for every N-torsion character; finite Fourier injectivity proves level independence in Q[Q/Z].

Differentiate the finite geometric sum and evaluate at a nontrivial Nth root. At `ζ=1` sum the rational coefficients directly; their sum is zero. Evaluate both levels at all characters of their common finite cyclic group and use finite Fourier injectivity.

See [112][R112], Ch.3, Lemma 3.28 and its finite Abel-summation proof, pp.464–465.

<a id="s6-27"></a>

### 6.27 The two rational forms of the Bost–Connes algebra

Inside `BCHecke ℂ` there are two `ℚ-forms`. `(i) H_ℚ`, the `ℚ-valued` functions (the image of `BCHecke ℚ`), spanned by the double cosets `[X] = x_n e(γ) x′_m`. (ii) Bost–Connes' rational algebra `A_ℚ`, the `ℚ-span` of the monomials `t_{n,m,γ} = μ_n e(γ) μ*_m = (nm)^{−1/2}[X]`; this is Connes–Marcolli's `A_{1,ℚ}`. They are different subsets `(μ₂ = 2^{−1/2}x₂ ∉ H_ℚ)`, and the complexified time evolution at `z = −i/2`, `σ_{−i/2}(f)(X) = a(X)^{1/2} f(X)`, is a `ℂ-algebra` automorphism of `BCHecke ℂ` carrying `A_ℚ` onto `H_ℚ`, with `μ_n ↦ x_n` and `μ*_n ↦ x′_n/n`. It is not a *-map. Statements about 'the rational subalgebra' are to one of the two forms.

For `t_(n,m,γ)=(nm)^−1/2[X]` with `a(X)=n/m`, `σ_−i/2` gives `m⁻¹[X]`, rational; every basis element occurs. Multiplicativity follows from a on structure constants.

Connes–Marcolli's Proposition `3.25 ('H_Q(Γ, Γ0)` is isomorphic to the Q-algebra generated by the `e(r)` and µn') holds through `σ_{−i/2}`, not through the inclusion `μ_n = n^{−1/2}e_{X_n}` of Proposition `18`. Ground-state values agree on the two forms: `φ_{∞,ρ}(t_{n,m,γ})` and `φ_{∞,ρ}([X])` both vanish unless `n = m = 1`, where both equal `ρ(ζ_γ)`.

See [112][R112], Ch. 3, §4.2, Proposition 3.25, p. 461; [113][R113], §4, after the proof of Proposition 18, p. 433 (PDF p. 23); [113][R113], §4, notations (α), (β), p. 431 (PDF p. 21).

*Needs:* [§6.21][R511]; [§6.22][R512].

<a id="s6-28"></a>

### 6.28 The representation on ℓ²(ℕ≥1) and its Hamiltonian

Let `ℓ² = ℓ²(ℕ≥1)` `(Mathlib's lp (fun _ : ℕ+ ↦ ℂ) 2)` with orthonormal basis `(ε_k)`. For u `∈ Aut(ℚ/ℤ)` ≅ `Ẑ^×` define `π_u : BCHecke ℂ → B(ℓ²)` by `π_u(x_n)ε_k = n^{1/2}ε_{nk}`, `π_u(x′_n)ε_k = n^{1/2}ε_{k/n}` if n | k and 0 otherwise, `π_u(e(γ))ε_k = exp(2πi k·u(γ))ε_k`. Then `π_u` is a unital *-representation by bounded operators, with `π_u(μ_n)ε_k = ε_{nk}` for BC's `μ_n = n^{−1/2}x_n`. The Hamiltonian H is the self-adjoint operator `Hε_k = log(k)ε_k`, and `π_u(σ_t f) = e^{itH}π_u(f)e^{−itH}` for real `t`.

Assume u `∈ Aut(ℚ/ℤ)`; H is unbounded, with domain the k with `Σ log(k)²|c_k|² < ∞`.

The `μ_n` shifts are isometries with the stated adjoints; `e(γ)` acts diagonally unitarily. For relation(f′), both sides on `ε_k` equal `n[n|k]exp(2πi(k/n)u(γ))ε_k` by the n-th-root sum. Thus(a′)–(f′) give `π_u`. Conjugating the shift by `e^itH` contributes `(nk)^itk^−it=n^it`; `e(γ)` commutes with `H`. This implements the specified `σ_t`.

- `regularRep`: `regularRep (u : AddAut (ℚ/ℤ)) : BCHecke ℂ →ₐ[ℂ] (ℓ²(ℕ+) →L[ℂ] ℓ²(ℕ+))`.
- `regularRep_x`: `regularRep u (x n)` `(single k 1) = (n : ℂ)^(1/2 : ℂ)` • single `(n * k) 1`.
- `regularRep_e`: `regularRep u (e γ)` `(single k 1) = exp (2π I k u(γ))` • single k 1.
- `regularRep_star`: `regularRep u (star f) = (regularRep u f)`† (adjoint).
- `hamiltonianExp`: `hamiltonianExp β hβ = e^{−βH}`, the bounded diagonal operator `ε_k ↦ k^{−β} ε_k` for `β > 0`; H itself is the unbounded self-adjoint diagonal operator `ε_k ↦ log(k) ε_k`.
- `regularRep_timeEvolution`: `π_u(σ_t f) = e^{itH} π_u(f) e^{−itH}`, stated through matrix coefficients: `⟨ε_j`, `π_u(σ_t f) ε_k⟩ = (j/k)^{it} ⟨ε_j`, `π_u(f) ε_k⟩`.

**Checks.**

- `regularRep u (x 2 * x' 2)` `(single k 1) =` (if 2 ∣ k then 2 else `0`) • single k 1.
- `regularRep u 1 = 1`.
- The operator `2^(−1/2)` • `regularRep u (x 2)` is an isometry, BC's `π(μ₂)`.
- `regularRep u (x' 2)` `(single 1 1) = 0: x′₂` is not injective in the representation, so it has no inverse.

`π_u(x₂ x′₂)ε_k = 2ε_k` for even k and 0 for odd `k`, which is `π_u(1 + e(1/2))`. Changing u to `−u` gives the complex-conjugate representation on `e(γ)`.

See [112][R112], Ch. 3, §4.6, (3.140)–(3.141), p. 475.

*Needs:* `B3`; [§6.21][R511]; [§6.22][R512]; `lp`; `HilbertBasis`; `Real.log`; `PNat`; [§6.18][R486]; `HeckeCosetModule.single_mul_single`; [§6.21a][R487]; [§6.21f][R492]; [§6.28a][R513]; [§6.28b](#s6-28b).

<a id="s6-28a"></a>

**§6.28a Rational and isometric generator conventions.** Over C put `μ_n=n^(−1/2)x_n`. Then `μ_n*=n^(−1/2)x′_n`, `μ_n*μ_n=1`, `μ_n μ_n*=(1/n)Σnδ=0 eδ`, and `μ_n eγ μ_n*=(1/n)Σnδ=γ eδ`. All positive scalar square roots use the real branch.

Replace x by sqrt(n) times mu in the left-inverse and preimage-sum identities. Positivity of n fixes the square-root branch and conjugation leaves that scalar unchanged.

See [113][R113], BC95 Proposition 18, p.431.

<a id="s6-28b"></a>

**§6.28b Isometries and phase unitaries on l²(N+).** `S_n ε_k=ε_nk` is a linear isometry; `S_n* ε_k` is `ε_(k/n)` if n divides `k`, and 0 otherwise. `D_(u,γ)ε_k=ζ_(kuγ)ε_k` is unitary. Their relations realize `μ_n` and `eγ`, giving the bounded regular representation.

Compute inner products on finitely supported basis vectors. Multiplication by n is injective, so the shift preserves the squared norm; the diagonal multipliers have modulus one. Extend these maps by continuity and calculate their adjoints on the basis.

See [112][R112], Chapter 3, §4.6, (3.140)–(3.141), p.475.

<a id="s6-29"></a>

### 6.29 KMS_β states on the Bost–Connes algebra

For `β>0`, `IsKMS(β,φ)` on the dense complex Hecke algebra means: `φ` is complex linear, `φ(1)=1`, `φ(f* f)` is a nonnegative real number for every `f`, and `φ(f σ_(iβ)(g))=φ(gf)` for all f,g. This is the algebraic boundary identity. Its equivalence with the bounded strip definition on the C*-completion requires the bounded-state extension and analytic-core lemmas below. Ground states satisfy the upper-half-plane boundedness condition; `KMS∞` states are weak limits of KMS states as inverse temperature tends to infinity. These notions are distinct.

Assume `β > 0`.

Taking `f=1` in the boundary identity kills every `a≠1` term since `a⁻ᵝ≠1`; remaining coefficients are time-fixed. Completion uses the BC generator bounds and universal/regular norm comparison in §6.33g–i; the analytic-core strip criterion then applies.

- `IsKMS`: `IsKMS(β,φ)` includes `β>0`, normalization, complex-order positivity and the displayed boundary identity on the dense Hecke algebra.
- `IsKMS.timeEvolution_invariant`: IsKMS `β φ → φ (timeEvolution t f) = φ f` for real `t`.
- `IsKMS.convex`: `KMS_β` states form a convex set.
- `IsKMS.comp_symmetry`: IsKMS `β φ →` IsKMS `β (φ ∘ symmetry u)`.

**Checks.**

- IsKMS `β (gibbsState β hβ u)` for `β > 1` (gibbs-states-are-kms).
- The state f `↦ f(identity coset)` satisfies IsKMS `β` exactly when `β = 1`.
- The Gibbs state fails the identity with `σ_{−iβ}` in place of `σ_{iβ}`: at `f = x′₂`, `g = x₂` the two sides are `2^{1+β}` and `2^{1−β}`.
- Every `KMS_β` state has `φ(x 2 * x' 2) = 2^(1−β)`, hence `φ(e (1/2)) = 2^(1−β) − 1`.

The state `φ₁(f) = f(identity coset)`, Bost–Connes' vector state at the base point (Connes–Marcolli `(3.70)`), is `KMS_β` only for `β = 1`: at `f = x′₂`, `g = x₂` the identity reads `2^{1−β} = 1`.

See [112][R112], Ch. 3, §2.2, Definition 3.6, p. 446.

*Needs:* [§6.22][R512]; [§6.18][R486]; `Complex.cpow`.

<a id="s6-30"></a>

### 6.30 Completed KMS states and the bounded strip condition

For `β>0`, a completed state is a bounded complex-linear functional `φ` on `C_Q` with `φ(1)=1` and `φ(a*a) a` nonnegative real. It is `KMSβ` when, for all a,b, there is a bounded continuous F `on0≤Imz≤β`, holomorphic on the interior, with `F(t)=φ(aσt(b))` and `F(t+iβ)=φ(σt(b)a)`. Dynamics is a point-norm-continuous group of `star` automorphisms.

Extend real dynamics isometrically to the norm closure and prove point-norm continuity by dense finite supports. Use the bounded strip definition with both boundary conditions. Relate it to the algebraic identity only after the analytic-core extension lemma.

- `CompletedKMS.state`: Bounded linear functional, normalization and complex-order positivity.
- `CompletedKMS.isKMS`: The bounded closed-strip predicate just specified.
- `CompletedKMS.restrict`: Restriction to the dense Hecke algebra satisfies `IsKMS(β,φ)`.

**Checks.**

- Using `σ−iβ` reverses the required boundary identity and fails for x′2,x2 in a Gibbs state.
- The completed base-vector state restricts to a KMS state `atβ=1`.
- Every `KMSβ` state has `φ(μnμn*)=n^(−β)`.

See [112][R112], Chapter 3, Definitions 3.4–3.6, pp.445–447.

*Needs:* [§6.24][R515]; [§6.22][R512].

<a id="s6-30a"></a>

**§6.30a Entire spectral core to bounded-strip KMS.** [OperatorAlgebraDynamics D7][R40] proves, for a point-norm-continuous dynamics `σ` on a unital `C⋆-algebra` and `β>0`, that a state satisfies the bounded closed-strip `KMS_β` condition of §6.30 if and only if the analytic identity holds on a norm-dense `σ-invariant star` subalgebra of entire elements, with the strip bound `|F_(a,b)(z)|≤‖a‖‖b‖`. For the BC system take D to be the image of the finite-support Hecke core: it is dense by §6.24, `σ-invariant`, and spanned by entire eigenvectors, since `σ_t(μ_n e(γ) μ_m*)=(n/m)^(it) μ_n e(γ) μ_m*`. Hence a completed state is `KMS_β` exactly when `φ(ab)=φ(bσ_(iβ)(a))` for `a,b∈D`; this is `kms_finite_spectral_core_iff` for the BC core. The `β=0` case is the trace condition and is not used.

**Checks.** For `σ_t(a)=r^(it)a` the imaginary-time factor is `r^−β`. Taking `r=2,β=1` gives `1/2`. For trivial dynamics on `M₂(ℂ)`, `a=E12,b=E21` have products E11,E22, so evaluation at the (1,1) entry fails KMS. Invariance of D matters: the span of `μ_2` alone is not a `star` subalgebra, and density of a non-invariant set of entire elements does not suffice.

See the strip/core convention in [112][R112], Ch.3 Definitions3.4–3.6, pp.445–447.

<a id="s6-31"></a>

### 6.31 Higher trigonometric Eisenstein functions

For `k≥0` and `a∈Q/Z` define `ek,a=Pk(e1,a)` in the rational group algebra. The value at a character killing a is Pk(0), including `e2,0=−1/4`. For `k≥1`, on the nondegenerate locus this agrees with the k-fold normalized cotangent series; `k=1` uses the symmetric principal-value convention. The `k=0` polynomial `P0=0` is an algebraic convention, not a convergent weight-zero cotangent sum.

Apply the rational polynomial Pk to the first function. Evaluate in characters and use the cotangent recurrence on the nondegenerate locus. The degenerate character has first value zero, hence higher value Pk(0), rather than zero in every weight.

- `ArithmeticEisenstein.higher_eval`: higher k `a=eval₂ (algebraMap Q _)` `(first a)` `(polynomial k)`.
- `ArithmeticEisenstein.higher_one`: higher `1 a=first a`.
- `ArithmeticEisenstein.higher_zero_argument`: higher k `0=algebraMap Q _` `((polynomial k).eval 0)`.

**Checks.**

- first `0=0` and higher `2 0=−1/4`.
- higher `2 (1/2)=−1/4` and higher `3 (1/2)=0`.
- higher `2 (1/3)=(e(1/3)+e(2/3)−11·1)/36`.

See [112][R112], Ch.3, Lemma 3.27, (3.91)–(3.101), pp.464–465.

*Needs:* [§6.26](#s6-26); [§6.3](#s6-3).

<a id="s6-32"></a>

### 6.32 BC diagonal heat operator

For `β>0` define `e^(−βH)` on `l²(N+)` by multiplying the kth coordinate by `k^(−β)`. It is a bounded positive self-adjoint operator of norm 1. Its semigroup law is addition of positive `β`. The sum of diagonal coefficients in the specified positive-integer basis is studied in §6.39.

For `k>=1` the real multipliers `k^(-beta)` lie in (0,1], with equality at `k=1`. The diagonal operator bound follows from the `l2` norm formula; coordinatewise real positivity and multiplication prove positivity, adjointness and the semigroup law.

- `hamiltonianExp_apply`: `hamiltonianExp β εk=k^(−β)εk`.
- `hamiltonianExp_norm`: Its operator norm is 1.
- `hamiltonianExp_add`: `hamiltonianExp(β+γ)=hamiltonianExp β∘hamiltonianExp γ`.

**Checks.**

- The first coordinate vector is fixed.
- At `β=1`, `ε2` is multiplied by `1/2`.
- Its quadratic form is real nonnegative on every vector.

See [113][R113], §4, (9)–(10), p.434; Hamiltonian description p.435.

*Needs:* [§6.28][R518]; `lp`.

<a id="s6-33"></a>

### 6.33 Completed coefficient state

The core coefficient state extends uniquely and positively to `C_Q`. The completed state has norm 1, restricts to `φbase`, and is KMS exactly at `β=1` for positive `β`.

The identity vector functional is bounded on the operator completion and extends the core coefficient state. The dense-core KMS equivalence gives beta=1. A `dilation` range projection has value `1/n` and forces `n^(-beta)=1/n`, excluding every other positive `beta`.

- `CompletedKMS.base_restrict`: Restriction along embed is `baseState`.
- `CompletedKMS.base_norm`: The norm of the continuous state is 1.
- `CompletedKMS.base_kms_iff`: For `β>0`, the base state is `KMSβ` iff `β=1`.

**Checks.**

- `base(1)=1`.
- `base(embed e(1/2))=0`.
- `base(μ2 μ2*)=1/2`.

See [113][R113], Proposition 3, p.414; modular dynamics pp.415–416.

*Needs:* `B7`; [§6.25](#s6-25); [§6.30][R520].

<a id="s6-33a"></a>

**§6.33a Algebraic GNS generator estimates.** For every positive normalized algebraic functional `φ`, the GNS quotient seminorm obeys `‖μ_n[a]‖φ=‖[a]‖φ`, `‖eγ[a]‖φ=‖[a]‖φ` and `‖μ_n*[a]‖φ≤‖[a]‖φ`. The last inequality follows from `1−μ_n μ_n*` being a self-adjoint projection, hence a square.

Apply the algebraic relations inside `φ(a*μ_n*μ_n a)` and `φ(a*eγ*eγ a)`. Use `φ(a*(1−μ_n μ_n*)a)≥0` because the middle projection equals its own square. Bound every finite generator word, so left multiplication descends to bounded operators on the Hilbert completion.

See [113][R113], BC95 Proposition 18 C*-presentation, pp.431–433; CM Proposition 3.5, pp.445–446.

<a id="s6-33b"></a>

**§6.33b Universal C*-norm of the BC core.** The supremum of `‖π(f)‖` over unital `star` representations of the complex BC core is finite: if `f=Σc_(n,m,γ)μ_n eγ μ_m*`, it is at most `Σ|c_(n,m,γ)|`. It is a norm, because `λ` is faithful. Its completion has the universal property for these representations.

Express each element in the independent normalized monomial basis. Every bounded `star` representation sends these monomials to contractions, giving the coefficient `l1` bound. The faithful left-regular representation separates zero; the standard completion then has the stated representation property. The general completion theorem is the bounded-generator universal completion proved in this layer.

See [113][R113], BC95 Proposition 18 and amenability remark, pp.431–433.

<a id="s6-33c"></a>

**§6.33c Division endomorphisms on the existing profinite ring.** On `C(Ẑ)`, `α_n(f)(x)=f(x/n)` for `x∈nẐ` and 0 elsewhere. This is an injective `star` endomorphism, `α_nα_m=α_nm`, and `α_n(1)=1_(nẐ)`. Import `Ẑ`, its p-adic product and unit subgroup from ProfiniteArithmetic; do not reconstruct these objects.

Use that n times the integral adeles is compact open. Extension by zero of the pullback is continuous; direct evaluation proves `star`, product and composition identities. Surjectivity onto the corner and injectivity follow by evaluating on n times each integral adele.

See [122][R122], Laca §3.1, pp.8–9.

<a id="s6-33d"></a>

**§6.33d Minimal finite-adele dilation.** Extension by zero `i:C(Ẑ)→C0(A_f)` is injective. The action `β_q f(x)=f(q⁻¹x)` extends `α_n`, and ⋃n `β_(1/n)(i(C(Ẑ)))` is dense in `C0(A_f)`. Hence this is the minimal automorphic `dilation`.

Use the compact-open exhaustion of finite adeles by `n^(-1)` times the integral adeles. Functions supported on each such compact open set come from the corresponding translated integral function algebra. Compactly supported functions are dense in `C0`, proving minimality.

See [122][R122], Laca Theorem 2.1.1, pp.5–6; Proposition 3.2.1, p.9.

<a id="s6-33e"></a>

**§6.33e BC algebra as a full crossed-product corner.** Let `B=C0(A_f)⋊Q_+×`, for `β_q f(x)=f(q⁻¹x)`, and `p=1_Ẑ`. The universal BC completion is `star` isomorphic to `pBp`, sending `μ_n` to `U_n p` and `eγ` to its additive-character function on `Ẑ`. The projection p is full: the closed span of BpB is `B`.

Check the BC relations on `U_n p` and characters; use the algebraic lift. Dilate each covariant isometric representation to a unitary rational representation, as Lemma `2.1.3`, pp.6–7; compression establishes the universal norm equality. The translates (1/n)Ẑ exhaust `A_f`, so the ideal generated by p contains a dense set of compactly supported functions and their rational translates.

See [122][R122], Laca Theorem 2.2.1 and proof, pp.7–8; Proposition 3.2.1, p.9.

<a id="s6-33f"></a>

**§6.33f Full and reduced BC crossed products.** For the action `β_q f(x)=f(q⁻¹x)` of the discrete abelian group `Q_+×` on `C₀(A_f)`, the canonical quotient from the full to the reduced crossed product is an isomorphism. `Q_+×` is amenable by [bcPositiveRationals_amenable][R41], and [OperatorAlgebraDynamics D2][R39] proves `A⋊G≅A⋊_rG` for amenable G and every action. The API `bcCrossedProduct.full_eq_reduced` is this specialization; the generic norm comparison belongs to OperatorAlgebraDynamics `D2`.

**Checks.** For `B=ℂ` with the trivial action both sides are the group `C⋆-algebra` of `Q_+×`, which is commutative, and the regular representation is faithful on it. For the free group on two generators the full and reduced group `C⋆-algebras` differ, so the amenability hypothesis of `D2` cannot be dropped. `Q_+×` is free abelian on the primes and not finitely generated, so `bcPositiveRationals_amenable` must handle arbitrary finite rational test sets, with their prime coordinates chosen for each test set.

Laca, [122][R122], Proposition `3.2.1` and Corollary `3.2.2`, pp.9–10, uses this equality for the BC `dilation`; Bost–Connes, Proposition `18`, pp.431–433, records the amenability input.

<a id="s6-33g"></a>

**§6.33g Universal and reduced BC norms agree.** `Q_+×` is abelian, hence amenable; its full and reduced crossed-product norms on `C0(A_f)` agree. The full-corner identification and the regular Hecke representation therefore give `‖f‖univ=‖λ(f)‖` for every f in the BC core.

Apply [§6.33f][R502] for the discrete abelian group `Q_+×`. Transport its norm equality through the full-corner maps and identify the reduced representation with the faithful Hecke representation.

See [122][R122], BC95 Proposition 18 amenability remark, p.433; Laca Proposition 3.2.1 and Corollary 3.2.2, pp.9–10.

<a id="s6-33h"></a>

**§6.33h Dense isometric core embedding.** The map ι:BCHecke `C→C_Q` is an injective `star` algebra homomorphism with dense range and `‖ι(f)‖=‖λ(f)‖`. `C_Q` has the inherited unital C*-algebra structure of its closed `star` subalgebra of bounded operators.

Embed the faithful core into the operator-norm closure. Multiplication, involution and norm are inherited from bounded operators, while density is the closure property and injectivity is coefficient recovery.

See [112][R112], Ch.3 §4.2, pp.460–462.

<a id="s6-33i"></a>

**§6.33i Positive Hecke states extend boundedly.** Every normalized positive complex-linear `φ` on the BC core has `|φ(f)|≤‖λ(f)‖`, and therefore a unique norm-one positive continuous extension to `C_Q`. Its restriction is `φ`; extensions agree by core density.

Use the cyclic unit vector in the bounded algebraic GNS representation to get `|φ(f)|≤‖f‖univ`. Replace the universal norm by the regular norm and extend continuously. Approximate a completed square by core squares to preserve positivity.

See [113][R113], §4, Proposition 18 and complete proof, pp.431–433.

<a id="s6-34"></a>

### 6.34 KMS states and scaling measures

For `β>0` the maps `μ↦φμ` and `φ↦μφ` are inverse affine bijections between all normalized `β-scaling` Radon measures on `A_f` and completed `KMSβ` states. Restriction to `Ẑ` identifies the measure topology with weak convergence of its probability measures; under this topology the bijection is a homeomorphism.

Expectation fixes rational terms and diagonal restriction fixes the measure. Check both composites on `C(Ẑ)`, then scaling/density. Cylinder characters and finite rational terms determine the respective weak topologies.

Restriction to `C(Ẑ)` identifies completed `KMSβ` states with normalized measures on the finite adeles satisfying rational scaling. Off-diagonal `dilation` components vanish by invariance, and the KMS relation gives `μ(nẐ)=n^(−β)`.

See [114][R114], Introduction, normalized scaling condition (1β) and KMS correspondence attributed to Laca, p.1.

*Needs:* `B13`; `B7`; [§6.10][R528]; [§6.29](#s6-29); [§6.34b](#s6-34b); [§6.34e](#s6-34e); [§6.34f](#s6-34f); [§6.34g](#s6-34g); [§6.34h](#s6-34h).

<a id="s6-34a"></a>

**§6.34a Entire Hecke orbit maps.** For each f in the finite-support Hecke core, `z↦ι(σ_z f)` is an entire `C_Q-valued` map, supported on the same finite set of double cosets. For real t it is implemented in `λ` by the diagonal unitary with weights `a(g)^(−it)`.

On the support it is a finite sum of exponentials `z↦exp(iz log a(X))` times fixed vectors. For the specified kernel use `U_t(gH)=a(g)^(−it)`; conjugation multiplies `K_f` by `a(g⁻¹h)^(it)`.

See [112][R112], Ch.3 §4.2, pp.460–462.

<a id="s6-34b"></a>

**§6.34b Uniform correlation bound on the closed strip.** Let `φ` be a completed state satisfying the core KMS identity at `β>0`. For core a,b, `F(z)=φ(ι(a σ_z b))` is entire and bounded on `0≤Imz≤β` by `‖ι(a)‖‖ι(b)‖`. This is the strip bound of OperatorAlgebraDynamics `D7` for the BC core; finite spectral support makes F a finite exponential sum, bounded on each closed strip.

See [112][R112], Ch.3, Definition 3.6, p.446; (3.19), p.450.

<a id="s6-34c"></a>

**§6.34c Extending real dynamics to the C*-completion.** The real `σt` are isometric `star` automorphisms in the left representation and extend to a point-norm-continuous automorphism group on `C_Q`. The complex `σz` is retained only on the entire dense Hecke algebra.

Implement real `σt` by diagonal unitaries from the `dilation` character. Extend the norm-preserving map and inverse to the closure. Approximate by finite Hecke sums to prove point-norm continuity.

See [113][R113], §4, Proposition 18 and complete proof, pp.431–433.

<a id="s6-34d"></a>

**§6.34d Point-norm continuous completed dynamics.** For every `a∈C_Q`, `t↦σ_t(a)` is continuous. Approximate a in norm by a core element, whose orbit is a finite exponential sum, and use the isometry of every `σ_t` to bound both approximation errors.

For each core element the orbit is a finite sum of scalar exponentials. Approximate an arbitrary completed element in norm by a core element and bound the two approximation terms using the isometric dynamics.

<a id="s6-34e"></a>

**§6.34e The analytic core and the strip KMS condition.** For `β>0 a` completed state is `KMSβ` exactly when its restriction to the dense Hecke core satisfies IsKMS `β`. In the core-to-strip direction, approximate both completed arguments by core arguments; the uniform strip estimate makes their correlation functions Cauchy uniformly on the closed strip.

Restrict a bounded strip correlation and use uniqueness against the entire core orbit to evaluate the upper boundary. For the converse take norm approximations `a_j,b_j` in the core. The bound on differences gives uniform convergence on the full closed strip. Locally uniform limits remain holomorphic, and the limits have the required two boundary values.

See [112][R112], Chapter 3, Definition 3.6, p.446, and entire-core identity (3.19), p.450; the general dense-entire-core theorem is OperatorAlgebraDynamics D7, applied through [§6.30a][R503].

<a id="s6-34f"></a>

**§6.34f Diagonal expectation in the full corner.** The reduced crossed product has the positive contractive expectation `E(Σq fq Uq)=f1`. Its compression to `pBp` maps to `C(Ẑ)`, preserves 1 and is faithful. The dynamics multiplies the q-term by `q^(it)`.

Import the identity-coefficient expectation of the reduced crossed product from OperatorAlgebraDynamics `D2`. Compress by the compact-open integral projection. Positivity, contractivity and faithfulness survive compression, and the compressed unit maps to the constant one function.

See [122][R122], Laca §3.2, p.9; Neshveyev 2000 scaling correspondence, p.1.

<a id="s6-34g"></a>

**§6.34g Scaling measure produces a KMS state.** For `β>0` and a normalized `β-scaling μ`, the functional `φμ(a)=∫Ẑ E(a) dμ` is a completed `KMSβ` state. The rational covariance and `μ(qE)=q^(−β)μ(E)` prove the core KMS identity. It is positive and normalized by the expectation.

Integrate the corner expectation against the normalized measure. Check the core KMS identity on two finite crossed-product monomials using the rational scaling law and covariance. Linearity and the dense-core strip equivalence give the completed state.

See [114][R114], Neshveyev 2000 scaling correspondence (1β), p.1.

<a id="s6-34h"></a>

**§6.34h KMS restriction reconstructs a scaling measure.** For `β>0`, restrict `φ` to `C(Ẑ)` and use the existing positive-functional measure representation. The KMS `dilation` identity implies `ν(nE)=n^(−β)ν(E)`. This extends uniquely to a Radon `μ` on `A_f` with `μ(Ẑ)=1` and `μ(qE)=q^(−β)μ(E)`. Nonidentity rational terms have zero expectation in `φ`: use dynamics invariance when `q≠1`.

Represent the diagonal restriction by the imported positive-functional measure theorem. The KMS identity for dilations gives scaling on integral compact opens, and exhaustion extends it uniquely to finite adeles. Dynamics invariance kills all terms with rational index different from 1; diagonal uniqueness proves reconstruction.

See [114][R114], Neshveyev 2000 scaling correspondence, p.1.

<a id="s6-35"></a>

### 6.35 The symmetry group Ẑ^× = Aut(ℚ/ℤ)

For v `∈ Aut(ℚ/ℤ)` `(≅ Ẑ^×)` there is a unique K-algebra automorphism `θ_v` of `BCHecke K` with `θ_v(x_n) = x_n`, `θ_v(x′_n) = x′_n` and `θ_v(e(γ)) = e(v(γ))`; on the basis, `θ_v[class of [1 γ/m; 0 n/m]]` `=` [class of `[1 v(γ)/m; 0 n/m]`]. It commutes with the time evolution, `θ_vθ_w = θ_{vw}`, and for `K = ℂ` it is a *-automorphism with `π_u` ∘ `θ_v = π_{uv}`, so `φ_{β,u}` ∘ `θ_v = φ_{β,uv}`.

Assume v `∈ Aut(ℚ/ℤ)`.

Additivity of v and its permutation `of{δ:nδ=γ}` preserve(a′)–(f′), giving `inverseθ_(v⁻¹)`. It fixes `a(X)`, commutes `withσ_z` and preserves `star` by `v(−γ)=−v(γ)`. `Onε_k`, `π_uθ_v(eγ)=exp(2πik·u(vγ))`.

- `symmetry`: symmetry `(v : AddAut (ℚ/ℤ)) : BCHecke K` ≃ₐ[K] `BCHecke K` (AddAut is the additive twin of MulAut).
- `symmetry_e`: symmetry v `(e γ) = e (v γ)`.
- `symmetry_x`: symmetry v `(x n) = x n` and symmetry v `(x' n) = x' n`.
- `symmetry_mul`: symmetry `(v * w) =` (symmetry w).trans `(symmetry v)`.
- `symmetry_timeEvolution`: symmetry v `(timeEvolution z f) = timeEvolution z` `(symmetry v f)`.

**Checks.**

- symmetry `(−1) (e γ) = e (−γ)`.
- symmetry `1 = AlgEquiv.refl`.
- `gibbsState β hβ u` ∘ symmetry `v = gibbsState β hβ (u * v)`.
- Doubling on `ℚ/ℤ` is not bijective, and e `γ ↦ e (2γ)`, x n `↦ x n` is not an algebra map: it would send x `2 * x' 2 = 1 + e (1/2)` both to itself and to `1 + e 1 = 2`.

Only `v = ±1` comes from conjugating the pair (by `[1 0; 0 ±1]`); a general v `∈ Ẑ^×` is not rational, so `θ_v` is defined through the presentation, not by transport of structure.

See [112][R112], Ch. 3, §4.3, (3.75), p. 461.

The Gibbs-state comparison is built after §6.43; the algebraic symmetry and representation comparison use the presentation and §6.28.

*Needs:* [§6.21][R511]; [§6.22][R512]; [§6.28][R518]; [§6.43](#s6-43); `AddCircle`; `MulAut`.

<a id="s6-36"></a>

### 6.36 KMS∞ states and upper-half-plane ground states

For the BC system, `KMS∞` means a state in the weak closure of `KMSβ` states along `β→∞`: every finite set of observables, tolerance `ε>0` and threshold B is met by some `β>B` and `KMSβ` state. Ground means each correlation has a bounded holomorphic extension to the upper half-plane. These are separate predicates; the general trivial-dynamics matrix test distinguishes them.

Use D7's distinct weak finite-observable KMS-limit and upper-half-plane ground-state notions on the completed unital system. Its `β→∞` weak-* limit theorem gives the implication, not an equality of definitions.

- `KMSInfinity.isLimit`: The finite-observable weak-limit criterion as `β` tends to infinity.
- `KMSInfinity.isGround`: The bounded holomorphic upper-half-plane correlation condition.
- `KMSInfinity.limit_isGround`: Every `KMS∞` state is a ground state under the completed dynamics.

**Checks.**

- The `β→∞` limit of `φβ,u` is the `ε1` vector state.
- The extremal limit has value−1 on `e(1/2)`.
- For trivial dynamics on M2(C), the vector state `a↦a00` satisfies the same upper-half-plane ground-state predicate but fails the finite-temperature-limit predicate: a01a10 and a10a01 have state values 1 and 0. This tests the generic predicates with which the completed BC predicates are compatible.

Define `KMS∞` states as weak limits of `KMSβ` states as `β→∞`. Equivalently in this separable unital system, for every finite set of observables, `ε>0` and cutoff B there is a `KMSβ` state with `β>B` approximating those values within `ε`. Ground states instead require `φ(aσz(b))` to extend bounded holomorphically to `Imz>0`, continuously on the boundary. `KMS∞` states are ground states; the converse is not built into either definition.

See [112][R112], Chapter 3, Definition 3.7 and following ground-state remark, p.447.

*Needs:* `B13`; `B8`; [§6.24][R515]; [§6.33h][R526]; [§6.36a](#s6-36a); [§6.36b](#s6-36b).

<a id="s6-36a"></a>

**§6.36a BC KMS-infinity limits are ground states.** Apply D7's limit theorem to the completed BC system: §6.24 and §6.33h give a unital C*-algebra and point-norm continuous dynamics, and §6.30 identifies the completed KMS predicate. Therefore the finite-observable limit in §6.36 satisfies its upper-half-plane ground-state condition. The local target is this compatibility and specialization.

See [112][R112], Ch.3, Definition 3.7, p.447.

<a id="s6-36b"></a>

**§6.36b Ground and KMS-infinity differ for trivial dynamics.** For `M₂(C)` with `σ_t=id`, every state is a ground state, while every `KMSβ` state is tracial and every `KMS∞` state is tracial. The vector state `a↦a₀₀` is ground and is not `KMS∞`: on matrix units it gives `φ(E₀₁E₁₀)=1` and `φ(E₁₀E₀₁)=0`.

With trivial dynamics every correlation function is constant and bounded on the upper half-plane. The KMS boundary condition reduces to the trace identity and traces form a weakly closed set. Evaluate the two matrix-unit products in the vector state to exclude that identity.

See [112][R112], Ch.3, Definition 3.7 discussion, p.447.

<a id="s6-37"></a>

### 6.37 The trigonometric arithmetic algebra equals the BC rational form

The rational subalgebra generated by e1,a for all a is Q[Q/Z]. The finite Fourier formula gives containment in the group algebra, and the root-recovery lemma gives the opposite containment. This is a statement about the diagonal rational group algebra; adjoining isometries and complexification are separate results. `firstEisenstein_generate` states its generation equality on the native group-algebra carrier.

Use the finite Fourier sum for the first inclusion. Use root recovery and the spanning basis `e(a)` for the reverse inclusion.

The e1,a generate Q[Q/Z]. Together with `μn,μn*` they generate the arithmetic algebra A1,Q; complexification gives the dense complex algebra. This is BC’s normalized rational form and is compared to the Q-valued Hecke form only through `σ−i/2`, which is not a `star` map.

See [112][R112], Chapter 3, Theorem 3.30 and proof, pp.467–470.

*Needs:* [§6.26](#s6-26); [§6.3](#s6-3); `ArithmeticFunction.moebius`; `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq`; [§6.31](#s6-31); `Polynomial`; `MvPolynomial.mul_esymm_eq_sum`; `Complex.exp`; [§6.18][R486]; [§6.21][R511]; [§6.26a](#s6-26a); [§6.37a](#s6-37a); [§6.37b](#s6-37b); [§6.37c](#s6-37c); [§6.37d](#s6-37d); [§6.37e](#s6-37e); [§6.37f](#s6-37f); [§6.37g](#s6-37g); [§6.37h](#s6-37h); [§6.37i](#s6-37i); [§6.37j](#s6-37j); [§6.37k](#s6-37k); [§6.37l](#s6-37l).

<a id="s6-37a"></a>

**§6.37a Möbius divisibility identities.** For `fn(j)=Σd|j μ(d)(j/d)^n`, the projection sum `Σd|N fn(d)πd` evaluates on a Q-lattice to `m^n`, where m is the order of its N-torsion kernel. Keep `n=1` and `n=1−k`, including negative exponents.

Write divisibility projections as indicator functions of divisors of `m`. Use finite Möbius inversion. Retain rational negative powers when deriving the k-division relation.

See [112][R112], Chapter 3, equations (3.103)–(3.107), p.466.

<a id="s6-37b"></a>

**§6.37b The Eisenstein division formula.** For `k≥1`, `ΣNa=0 ek,a=γk Σd|N[(2^k−2)f1(d)+N^k f1−k(d)]πd`, with `γk=(2πi)^(−k)Σy∈Z\{0} y^(−k)` in the source normalization `(symmetric principal value for k=1; absolute convergence for k>1)`. For odd k the vanishing is interpreted consistently. Both the arithmetic coefficients and the degenerate-value convention are fixed by the preceding identities.

Count the m-fold fibres of the N-torsion map. Evaluate the nondegenerate trigonometric sum plus the degenerate correction. Replace powers of m by the Möbius projection sums.

See [112][R112], Chapter 3, Lemma 3.29, (3.108)–(3.109), p.467.

<a id="s6-37c"></a>

**§6.37c Recovering prime-power divisibility projections.** All projections `πp^b` belong to the Q-algebra generated by e1,a. For odd `p`, solve the `k=2` division relation inductively in `b`. For `p=2` the leading `π2^b` coefficient vanishes, so use the relation at `N=2^(b+1)` to recover `π2^b`; e.g. `π2=3+2Σ4a=0` e2,a.

Compute the leading `coefficient−p^(b−1)(2−3p+p²)`. For `p=2` retain the nonzero next projection coefficient at the doubled torsion level. Use coprime products to recover all `πN`.

See [112][R112], Chapter 3, proof of Theorem 3.30, prime-power and doubled dyadic level step, pp.467–468.

<a id="s6-37d"></a>

**§6.37d Rational power sums in a prime corner.** Fix a prime p and an integer `b≥1`, and put `N=p^b`, so `N≥2`. These hypotheses remain in force throughout §§6.37d–6.37i. Set `e=1−πp`, and `zj=e` e1,j/N for `1≤j<N` in the unital corner eQ[Q/Z]. The division formula gives `Σj Pk(zj)=(N^k−1)γk e` for every `k≥1`, where Pk is evaluated with corner unit `e`. Since Pk is monic of degree `k`, triangular induction gives `Σj zj^k∈Qe`. Zero roots and repeated roots are retained; there are `N−1` indices.

Multiply the division identity by e and subtract the `j=0` term Pk(0)e. Solve successively for each ordinary power sum using the monic polynomial Pk and previously known lower powers.

**Checks.** At `p=2,b=1`, there is one index and its cotangent root is zero. At `p=3,b=1`, there are two indices with opposite roots. At `b=0`, the empty product is `Q1=1` and does not vanish at any element of a nonzero corner; only the separate identity `e(0)=1` applies.

See [112][R112], Ch.3, proof of Theorem 3.30, (3.110)–(3.113), p.468.

<a id="s6-37e"></a>

**§6.37e Newton identities in the reduced corner.** For the `N−1` commuting elements zj in the preceding corner, all elementary symmetric functions `σh(z1,…,zN−1)` belong to Qe. Hence `QN(X)=∏j=1.N−1(X−zj)` is a monic degree-N−1 polynomial with rational scalar coefficients in that corner and `QN(z1)=0`.

Use `hσh=Σk=1.h(−1)^(k−1)σh−k` sk over `Q`. Division by each positive h is permitted, so induction gives rational coefficients. The product polynomial vanishes at `z1` by its first factor; its degree is `N−1` regardless of zero-root multiplicity.

See [112][R112], Ch.3, proof of Theorem 3.30, (3.113)–(3.115), pp.468–469.

<a id="s6-37f"></a>

**§6.37f Roots of the reduced polynomial.** At an invertible Q-lattice, QN has multiset of roots `cot(πj/N)/(2i)`, `1≤j<N`. A unit character permutes this multiset. These roots are purely imaginary, so `1/2` is never a root. For even N the root at `j=N/2` is zero and must be retained.

Evaluate the corner polynomial in an invertible lattice and list all N-1 nontrivial torsion characters. A unit permutes this list. Each cotangent is real, so its division by `2i` is purely imaginary and differs from `1/2`; the even-level zero remains a root.

See [112][R112], Chapter 3, proof of Theorem 3.30, (3.113)–(3.115), p.468.

<a id="s6-37g"></a>

**§6.37g Polynomial recovery of the Cayley transform.** Since `QN(1/2)≠0`, `gcd(QN,2X−1)=1` in Q[X]. Bézout yields `U,V∈Q[X]` with `U(2X−1)+VQN=1`. In the reduced corner, `2z1−e` is invertible with inverse `U(z1)`, and `(2z1+e)U(z1)=e e(1/N)`. Thus this root-of-unity component lies in the Eisenstein algebra.

Evaluate the Bézout identity at `z1`; `QN(z1)=0`. Use the finite cotangent Fourier identity to identify `(2z1+e)/(2z1−e)` with e times the root of unity.

See [112][R112], Chapter 3, proof of Theorem 3.30, (3.113)–(3.117), pp.468–469.

<a id="s6-37h"></a>

**§6.37h Eisenstein algebra is stable under semigroup endomorphisms.** For `αn(f)=μn f μn*`, `αn(ek,a)=πn` ek,a/n, independently of the chosen n-preimage a/n. The projections `πn` belong to the algebra generated by first functions, so `αn` preserves that algebra.

Apply `dilation` covariance to every term of the finite first-function Fourier expression. It produces the range projection times the selected preimage expression; different preimages agree after multiplying by that projection. Polynomial evaluation gives all higher functions.

See [112][R112], Chapter 3, (3.117), p.469, and the following induction, pp.469–470; projections in Lemmas 3.27–3.28, pp.464–465.

<a id="s6-37i"></a>

**§6.37i Reassembly of the prime-power components.** For `N=p^b` with `b≥1`, the `(1−πp)e(1/N)` component is supplied by the Cayley lemma. The other component is `πp e(1/N)=αp(e(p/N))`; the induction hypothesis at `p^(b−1)` and semigroup preservation put it in the Eisenstein algebra. At `b=1` its lower-level input is `e(0)=1`. Adding the complementary components recovers `e(1/N)`.

Split `e(1/N)` by the complementary prime projection. The Cayley lemma recovers the complementary corner; semigroup covariance expresses the prime-projection part through the lower-level torsion element. Induct on b with `e(0)=1` as the base. The separate level `N=1` is this identity and does not invoke `QN(z1)=0`.

See [112][R112], Ch.3, last part of Theorem 3.30 proof, pp.469–470.

<a id="s6-37j"></a>

**§6.37j Recovering roots of unity from Eisenstein functions.** Every `e(a)`, `a∈Q/Z`, belongs to the Q-algebra generated by first trigonometric Eisenstein functions. Prime-power denominators follow from reduced-corner Newton identities, the Bézout Cayley inverse and the explicit lower-level induction. General denominators follow by writing a as a sum of its prime-primary components and using `e(a+b)=e(a)e(b)`.

Apply the prime-level induction separately to each prime power in the denominator. Decompose the torsion point into prime-primary summands and multiply the recovered roots.

See [112][R112], Chapter 3, proof of Theorem 3.30, (3.110)–(3.117), pp.468–469.

<a id="s6-37k"></a>

**§6.37k Arithmetic generation after adjoining isometries.** The Q-algebra generated by all first functions and `μn,μn*` equals the normalized arithmetic form A1,Q spanned by `μn e(a) μm*`. The comparison to Q-valued Hecke functions is through `σ−i/2` and is not a star-algebra identification.

Recover every torsion generator from the first functions by the prime-level induction. The eight relations reduce every word with isometries and adjoints to the normalized arithmetic monomial span. The imaginary-time comparison records which rational form this is.

See [112][R112], Ch.3, Theorem 3.30, pp.467–470; rational-form convention pp.460–462.

<a id="s6-37l"></a>

**§6.37l Complexification of the arithmetic form.** The scalar-extension map `C⊗Q A1,Q→H_C` is an algebra isomorphism sending `1⊗μn e(a) μm*` to the normalized complex normal form. Its image is dense in the completed BC algebra. Rational Hecke and arithmetic forms remain distinct subalgebras until the specified imaginary-time comparison.

Use linear independence and spanning of normalized complex normal forms to prove bijectivity of scalar extension. Use density of the Hecke core in its operator-norm completion.

See [112][R112], Ch.3, Theorem 3.30 and surrounding discussion, pp.460–470.

<a id="s6-38"></a>

### 6.38 Ground state at an invertible lattice

For each unit character `u`, the representation `πu` has a continuous extension to `C_Q`. Its vector functional at `ε1` is a normalized positive state `φ∞,u`. It is the weak limit of Gibbsβ,u as `β→∞` and hence a KMS-infinity state. Evaluation on `μn eγ μm*` is zero unless `n=m=1`, when it is `exp(2πi uγ)`.

Extend the bounded core representation to the completion. Its `epsilon_1` vector functional is positive and normalized. Dominate the Gibbs tail by the zeta tail to prove pointwise convergence as `beta` grows, then evaluate the normalized monomial on `epsilon_1`.

- `KMSInfinity.vectorState_one`: `φ∞,u(1)=1`.
- `KMSInfinity.vectorState_basis`: The normalized basis has the stated zero/character values.
- `KMSInfinity.vectorState_isLimit`: `φ∞,u` is KMS-infinity.

**Checks.**

- The vector state sends 1 to 1.
- It sends `e(1/2)` to `−1`.
- It sends `μ2` to 0.

See [113][R113], §4, extremal states and zero-temperature limit, pp.434–436; CM Theorem 3.32, pp.474–476; [112][R112], Ch.3, Theorem 3.32, pp.474–476.

The completed zero-temperature comparison is built after the core Gibbs construction §6.43 and its completed state §6.44.

*Needs:* `B7`; [§6.28][R518]; [§6.43](#s6-43); [§6.44][R573].

<a id="s6-39"></a>

### 6.39 The partition function is the Riemann zeta function

For `β>1`, the diagonal sum of `e^(−βH)` in the positive-integer basis is `Σ k^(−β)=ζ(β)`. The positive scalar series diverges for `β≤1`. The state-classification theorem, rather than this scalar identity alone, establishes the phase transition at `β=1`.

Assume `β ∈ ℝ`; use the diagonal sum in the specified basis `(ε_k)`.

`e^{−βH}ε_k = k^{−β}ε_k`, so the diagonal sum is `Σ k^{−β}`. For `β > 1` this is `riemannZeta β (zeta_eq_tsum_one_div_nat_cpow)`; for `β ≤ 1` the series diverges by comparison with the harmonic series.

The value at `β = 2` is `π²/6 (riemannZeta_two)`.

See [112][R112], Ch. 3, §4.6, (3.142), p. 476; [112][R112], Ch. 3, §4.6, (3.140)–(3.141), p. 475.

*Needs:* [§6.28][R518]; `riemannZeta`; `zeta_eq_tsum_one_div_nat_cpow`; [§6.32](#s6-32).

<a id="s6-40"></a>

### 6.40 Critical-regime KMS uniqueness

For `0<β≤1` every normalized `β-scaling` measure equals the canonical `μβ`, and therefore there is exactly one completed `KMSβ` state. `critical_scaling_measure_unique` states existence and uniqueness of the normalized Radon scaling measure on `IsDedekindDomain.FiniteAdeleRing ℤ ℚ`, with pushforward law `q_*μ=q^β μ`. The proof uses the explicit canonical extremality and compact-unit average rigidity, rather than assuming a general Choquet decomposition.

Unit averaging identifies an arbitrary scaling measure's barycentre with the canonical measure. Ergodicity/RN makes the latter extreme; extreme-average rigidity forces the continuous unit orbit constant. Transfer uniqueness through the affine KMS/scaling correspondence. Fourier values are a separate consequence, without a Choquet premise.

For `0<β≤1` the completed Bost–Connes system has a unique `KMSβ` state. On `e(a/b)`, with `gcd(a,b)=1`, its value is `b^(−β)∏p|b(1−p^(β−1))/(1−p^(−1))`.

See [114][R114], Corollary and proof, p.3 (p.4 contains references).

*Needs:* [§6.9](#s6-9); [§6.10][R528]; [§6.2][R440]; [§6.34][R555]; [§6.40a](#s6-40a); [§6.40b](#s6-40b); [§6.40c](#s6-40c).

<a id="s6-40a"></a>

**§6.40a Ergodic scaling measure is extreme.** For `0<β≤1`, if `μβ=tμ1+(1−t)μ2` for normalized `β-scaling` measures and `0<t<1`, then `μ1=μ2=μβ`. The Radon–Nikodym density `dμ1/dμβ` is bounded by `1/t` and `Q+×-invariant`, hence constant by ergodicity; normalization makes the constant one.

Domination by the convex combination bounds the Radon-Nikodym density. Equal scaling laws make the density invariant under every rational `dilation`. Ergodicity makes it constant; normalization fixes the constant and then both summands.

See [114][R114], Corollary proof, p.3; direct measure form of extremality.

<a id="s6-40b"></a>

**§6.40b Unit average of a scaling measure.** For any normalized `β-scaling` measure `μ`, its average over `W=Ẑ×` with normalized Haar measure is again normalized and `β-scaling`, is W-invariant, and equals the canonical product-density `μβ`. Equality follows from finite valuation/unit cylinders, then a countable rational-dilate exhaustion of `A_f`.

On every compact rational dilate, integrate the finite measures over compact `W`; Fubini gives normalization and scaling. W invariance makes unit residues Haar and scaling fixes each valuation-shell mass. Cylinder uniqueness yields the product measure.

See [114][R114], Unique W-invariant measure, p.1; Corollary argument, p.3.

<a id="s6-40c"></a>

**§6.40c Extreme unit average is constant.** Let `μ` be a normalized scaling measure whose compact-unit average is the extreme `μβ`. Then `u_*μ=μβ` for every `u∈W`. For any finite-measure cylinder test, a nonconstant continuous value in u would split Haar into two positive pieces and give a nontrivial convex decomposition of `μβ`. Cylinder tests separate measures; setting `u=1` proves `μ=μβ`.

Evaluate the unit translates on compact-cylinder test functions. If one value varies continuously, two positive-Haar pieces yield distinct normalized averaged scaling measures whose convex combination is the canonical extreme. This contradiction makes all test integrals constant; separating tests and the identity unit recover the original measure.

See [114][R114], Corollary conclusion and averaging argument, p.3.

<a id="s6-41"></a>

### 6.41 The measured operator algebra and factor classification

Use VonNeumannAlgebras V0–V4, V8 and V10–V11 on the supplied carriers and conventions specified above. This subsection owns the BC comparison with that carrier. For `G=Q_+×` on `(A_f,μβ)`, with `0<β≤1`, check countability, standardness, `σ-finiteness`, nonsingularity, essential freeness, ergodicity and the full nonnegative ratio set before applying those theorems. The Radon–Nikodym convention remains `ρ_g=d(g_*μ)/dμ` at the target. V8's regular representation has `π(f)ξ(h,x)=f(hx)ξ(h,x)`, `u_gξ(h,x)=ξ(g⁻¹h,x)`. Its unitary change of coordinates `Wξ(h,x)=√ρ_h(x)ξ(h,h⁻¹x)` gives the multiplication operators below `M_f` and `U_gξ(h,x)=√ρ_g(x)ξ(g⁻¹h,g⁻¹x)`; the cocycle identity proves covariance. Thus no second group-measure-algebra structure or flow/type predicate is introduced.

The BC normal-GNS comparison takes `p=1_Ẑ` in `M=L∞(A_f,μβ)⋊G`. The faithful normal expectation E from V8 gives the faithful normal semifinite weight `Φ(x)=∫E(x)dμβ` on `M`. Since `μβ(Ẑ)=1`, its restriction `ψ` to `pMp` is a faithful normal state. The `C⋆` full-corner map has ultraweakly dense image in `pMp` by the regular realization and Kaplansky density. V4's faithful normal GNS comparison therefore identifies the completed BC state algebra with `pMp`. This is a statement about the GNS von Neumann algebra, separately from the `C⋆` corner isomorphism. The finite adeles are second countable locally compact, hence standard Borel; their countable compact rational-dilate exhaustion and the scaling law prove `σ-finiteness`. The projection is nonzero and fixed by the diagonal modular dynamics. With the Tomita convention `σ_t^ψ=Δ^(it)(·)Δ^(−it)`, the pushforward density gives `σ_t^Φ(U_q)=ρ_q^(−it)U_q=q^(−iβt)U_q` on `M`. Restriction to the modular-invariant corner gives `σ_t^ψ` equal to the BC evolution at time−βt. The KMS strip uses positive imaginary BC time, consistently with `ψ(ab)=ψ(b σ_(−i)^ψ(a))`. V11's continuous core of this corner is p core(M) `p`; its center and dual action identify with those of core(M). Indeed, conjugates of p by the rational unitaries include the indicators of `(n!)⁻¹Ẑ`, whose increasing exhaustion has supremum1, also inside the continuous core. This gives p full central support there, rather than inferring core fullness solely from fullness in `M`. Hence its flow of weights is the same and its type is `III₁` when V11's ratio-set criterion gives `III₁` for `M`. V11 supplies the general modular core and classification for this finite-adele/corner application. The countable group and separable `L²(A_f,μβ)` make the regular Hilbert space separable; V4 then gives a separable predual, as required by V11's flow classification.

At `β=1`, §6.2's local density is 1, so `μ₁` is precisely the additive Haar measure normalized by `μ₁(Ẑ)=1`. Identify the V8 action and corner with V10.AffineHecke's `N=L∞(A_f,μ₁)⋊Q_+×`, `p=1_Ẑ`, expectation E and state `ψ=∫_Ẑ E(·)dμ₁`. Use its slope-to-matrix map `M(α,b)=[[1,b/α],[0,1/α]]`, and its coset inversion and translation-sign transport, when matching the Hecke generators in §§6.17–6.18. On the common corner the normalized isometry is `S_n=pU_np=U_np`, and the phase generator is the character `pχ_γ` with the same additive pairing. The cross moments are `ψ(S_m(pχ_γ)S_n*)=δ_(m,n)δ_(γ,0)/n`. These identify the beta-family GNS comparison with V10.AffineHecke's supplied unitary; the additional full-ratio computation for all `0<β≤1` is §§6.42a–6.42h.

The intended interface is:

- `bcGroupMeasure.center_comparison`: use V8’s center theorem for the essentially free positive rational action; the coordinate unitary above matches its convention.
- `bcGroupMeasure.ratioSet_comparison`: identify §6.5’s target-derivative ratio witnesses with V11’s relation cocycle; then apply its ratio-set/flow criterion.
- `bcGroupMeasure.integral_corner_flow`: the nonzero integral-adele projection is modular invariant and its core corner has the same central dual flow.
- `bcGroupMeasure.expectation_gns`: the normalized expectation state has the von Neumann compression `pMp` as its GNS algebra by the preceding faithful-normal-state argument.

**Checks.**

- A transitive free action of a finite group on itself with counting measure gives a full finite matrix factor, with ratio set `{1}`; it must not be classified as type `III₁`.
- The trivial group acting on a two-point probability space gives a two-dimensional commutative center and fails ergodicity and the factor conclusion.
- For the positive rational action on `A_f`, `qx=x` with `q≠1` forces `x=0` since `q−1` is an invertible adele. The scaling measure assigns `{0}` mass zero, so this witness verifies essential freeness.
- A zero projection yields the zero corner and is excluded. A nonzero corner of a finite matrix factor remains finite, so fullness or nonzero compression alone cannot prove type `III₁`.
- At `β=1`, `ψ(S₂S₂*)=μ₁(2Ẑ)=1/2` and `ψ(S₂*S₂)=1`, agreeing with V10.AffineHecke's canonical Haar state.
- For `q=2,β=1` the BC imaginary-time eigenvalue `is2⁻¹=1/2`. Its Tomita modular value at time+i has eigenvalue2, so using+βt for the Tomita group reverses the KMS identity.

See Neshveyev, [Ergodicity of the action of the positive rationals on the group of finite adeles][R123], corollary proof, p.3; and [Von Neumann algebras of the Bost–Connes type][R124], §1, pp.1–2 and Theorem 2.1, p.3. These sources prove the arithmetic application. The general classification and flow-of-weights contracts come from [VonNeumannAlgebras V11][R125], with the convention adapter above.

*Needs:* VonNeumannAlgebras V0–V4, V8, V10.ModularTheory, V10.KMS, V10.AffineHecke and V11; [§6.5](#s6-5); the BC expectation/compression construction; the arithmetic ergodicity and full-ratio-set proofs.

<a id="s6-42"></a>

### 6.42 The critical KMS factors have type III₁

For `0<β≤1`, the GNS von Neumann algebra of the unique completed Bost–Connes `KMSβ` state is a type III1 factor. The proof passes through the full positive ratio set, the ergodic group-measure factor and its nonzero compression by 1Ẑ.

Use ergodicity for factoriality. Lift the positive ratio set through the compact quotient, as required by Neshveyev Theorem2.1. Use the nonsingular crossed-product/type classification and preserve type under a full corner.

For `0<β≤1` the GNS von Neumann algebra of the unique completed `KMSβ` state is a factor of type `III₁`. In particular this proves the requiredβ=1 type statement. Lift the valuation quotient ratio computation through the compact unit action and the full-corner crossed-product description.

See [117][R117], §1 and §2, Lemma 2.3 and Theorem 2.1, pp.2–5.

*Needs:* `B1`; [§6.34][R555]; [§6.9](#s6-9); [§6.10][R528]; [AnalyticNumberTheoryPartI, Prerequisites and boundaries][R136]; [§6.5](#s6-5); [§6.2][R440]; [§6.9c](#s6-9c); [§6.42a](#s6-42a); [§6.42b](#s6-42b); [§6.42c](#s6-42c); [§6.42d](#s6-42d); [§6.42e](#s6-42e); [§6.42f](#s6-42f); [§6.42g](#s6-42g); [§6.42h](#s6-42h); [§6.42i](#s6-42i).

<a id="s6-42a"></a>

**§6.42a Prime pairs with prescribed ratio and divergent weights.** For `0<β≤1`, `λ>1` and `ε>0` there are disjoint prime pairs(pn,qn) with `|(qn/pn)^β−λ|<ε` and `Σn qn^(−β)=∞`.

Choose multiplicative `intervals(λ^(2m)x0,(1+δ)λ^(2m)x0]` and their alternating partners, adjustingλ `toλ^(1/β)`. Use the prime number theorem to inject the smaller prime list into the partner list. The interval cardinalities divided by the upper endpoint give a divergent harmonic-m sum; `β≤1` retains divergence.

<a id="s6-42b"></a>

**§6.42b Valuation-tail cylinder ratios.** For distinct primes p,q, the valuation swap `(vp,vq)=(0,1)→(1,0)` has target/source cylinder mass ratio `(q/p)^β`. Under the pushforward-at-target convention, the derivative of this forward map `x↦(p/q)x` is `(p/q)^β`; the inverse map has derivative `(q/p)^β`. Both values enter the ratio-set subgroup. The factors `(1−p^(−β))(1−q^(−β))` cancel.

Multiply the two local probabilities. Cancel the `two(1−p^(−β))` normalizers in the ratio. Use `q^(−β)(1−p^(−β))(1−q^(−β))` and the prime-pair divergence.

See [117][R117], Theorem 2.1 proof, pp.4–5; §1 convention, p.2.

<a id="s6-42c"></a>

**§6.42c Prime pairs with controlled unit residues.** For `N≥1`, `λ>1` and `ε>0`, fixed-progression PNT supplies disjoint prime pairs `p_n,q_n≡1(modN)` with `q_n/p_n→λ` and `Σp_n^(−1)=∞`. Select primes in two disjoint proportional intervals inside successive geometric blocks, matching their counts with a fixed positive density. For `0<β≤1` the pair-swap source masses also have divergent sum.

Apply PNT in the residue class `1 mod N` to paired intervals `[X,(1+δ)X]` and `[λX,λ(1+δ)X]`. Choose `δ` small enough for the desired ratio tolerance; matching counts are bounded below by cX/logX. Separate successive blocks geometrically; each block contributes `≥c/logX` to `Σ1/p`, so the block sum diverges. A diagonal tolerance choice preserves this divergence.

See [117][R117], Lemma 2.3 and complete proof, p.4; Theorem 2.1 application p.5, with the stated fixed-progression refinement.

<a id="s6-42d"></a>

**§6.42d Independent tail swaps give essential ratios.** On a product of countable probability spaces, suppose mutually disjoint finite coordinate blocks have bijective swaps with cylinder mass ratios approaching `λ>0` uniformly and a divergent sum of source cylinder masses. Then `λ` belongs to the ratio set of the finite-tail equivalence relation. The pushforward derivative of the inverse swap at its target equals the forward cylinder mass ratio.

Independent blocks and the divergent sum give arbitrarily distant successful swaps of positive total mass. Approximate any positive-measure set by a finite cylinder in relative measure, then select a tail block for which source and image both meet that set with positive mass. Apply the inverse swap so its target derivative has the stated mass ratio.

See [117][R117], §1 asymptotic ratio definition and inclusion, p.2.

<a id="s6-42e"></a>

**§6.42e Ratio witnesses lift through unit cylinders.** For any finite cylinder of integral adeles, choose its congruence level N and all its specified valuation primes. Tail pairs p,q≡1(modN), beyond those primes, act trivially on the cylinder unit residues. Their swaps therefore retain the independent-tail essential-ratio witnesses on the full adele space, rather than only on its quotient by `W`.

Approximate a positive-measure set by a finite valuation-and-residue cylinder. Select tail prime pairs outside those coordinates and congruent to one at its finite level. Their rational swaps preserve specified unit residues, so independent-tail witnesses lift with positive measure.

See [117][R117], Theorem 2.1 proof, pp.4–5; specialized congruence-cylinder lifting.

<a id="s6-42f"></a>

**§6.42f All positive numbers belong to the ratio set.** For `0<β≤1` the nonsingular `Q+×` action on `(A_f,μβ)` has RatioSet=[0,∞). Its pushforward density is `ρq(x)=q^β`. Prime pairs with fixed unit congruences give every `λ>1` after the `β` power; inverses give `λ∈(0,1)`, and closure gives 0.

Approximate any finite positive-measure set by a finite valuation and unit cylinder. Use congruence-controlled disjoint pairs and the independent-tail inclusion; the inverse swap fixes the derivative convention. Close the resulting multiplicative subgroup and use a rational-dilate exhaustion for arbitrary positive-measure sets.

<a id="s6-42g"></a>

**§6.42g The BC group-measure algebra is a factor.** For `0<β≤1` the canonical `μβ` action is essentially free: `qx=x` with `q≠1` forces `x=0`, a null point. Its space is standard and sigma-finite by the countable rational-dilate exhaustion. Apply VonNeumannAlgebras V8 to this action and §6.9's ergodicity to obtain factoriality of `L∞(A_f,μβ)⋊Q+×`.

For a nonidentity rational `q`, invert q-1 in the finite adeles to show its only fixed point is zero; scaling gives that point measure zero. Apply VonNeumannAlgebras V8's group-measure-space center theorem, then use the canonical ergodicity result.

**Checks.** A finite free transitive action gives a matrix factor. The trivial action on two points is not ergodic and gives a nontrivial center. In the BC action the only fixed point of `q≠1` is zero, and that point has measure zero.

See [114][R114], Corollary proof, p.3.

<a id="s6-42h"></a>

**§6.42h The BC group-measure factor has type III1.** For `0<β≤1` apply VonNeumannAlgebras V11 to the action verified in §6.42g and the arithmetic full ratio set in §6.42f. Its group-measure factor has type III1, equivalently trivial flow of weights. This specializes the supplied ratio-set/flow classification theorem, with separable predual verified in §6.41.

Apply VonNeumannAlgebras V11's ratio-set/associated-flow comparison and `III₁` criterion, after the V8 factoriality check, to this established essentially free ergodic action and its full nonnegative ratio set. The theorem identifies the Connes type from that measured ratio invariant; no arithmetic witness replaces this classification input.

**Checks.** An invariant probability measure has ratio set `{1}` and fails this criterion. The full BC ratio set contains 2 as well as 1, so it cannot have that finite-measure-preserving type. The positive ratio group must be all of `R_+×`; a discrete subgroup generated by a single `0<λ<1` gives type `III_λ`, not `III₁`.

See [117][R117], §1 flow-of-weights/type criterion, p.2; Theorem 2.1, p.3.

<a id="s6-42i"></a>

**§6.42i A nonzero full corner preserves factor type.** The GNS algebra of the diagonal-expectation KMS state is `p(L∞(A_f,μβ)⋊Q+×)p`, where `p=1Ẑ` and `p≠0`. A nonzero corner of a type III1 factor is again type III1. The C*-full corner identification and the von Neumann compression identification are separate requirements.

Use the expectation-measure construction to identify the completed state GNS algebra with the integral projection compression of the group-measure factor. Normalization makes that projection nonzero. Use [§6.41](#s6-41) with the supplied V4 faithful-normal GNS comparison and V11 core/corner comparison.

**Checks.** The zero projection is excluded. A rank-one corner of `M₂(ℂ)` is finite, so nonzero compression alone does not prove `III₁`. For the BC integral projection, its rational conjugates exhaust the identity, proving full central support in the continuous core as required for the flow comparison.

See [114][R114], Corollary proof, p.3; Neshveyev 2009 §1, p.2.

<a id="s6-43"></a>

### 6.43 The Gibbs states `φ_{β,u}`

For real `β > 1` and u `∈ Aut(ℚ/ℤ)`, `φ_{β,u}(f) = ζ(β)⁻¹ Σ_{k≥1} k^{−β}⟨ε_k`, `π_u(f)ε_k⟩` is a state on `BCHecke ℂ`: linear, `φ_{β,u}(1) = 1` and `φ_{β,u}(f*f) ≥ 0`. On the basis, `φ_{β,u}(x_n e(γ) x′_m) = 0` unless `n = m`, and `φ_{β,u}(e(γ)) = ζ(β)⁻¹ Σ_k k^{−β} exp(2πi k u(γ)) = Li_β(exp(2πi u(γ)))/ζ(β)`, with `Li_β(z) = Σ_{k≥1} z^k/k^β`.

Assume `β > 1`; u `∈ Aut(ℚ/ℤ)`.

Diagonal coefficients `are≤‖π_u(f)‖` and `Σk⁻ᵝ=ζ(β)<∞`, giving absolute convergence. For f*f each term `is‖π_u(f)ε_k‖²≥0`. The monomial shifts k to nk/m, so its diagonal vanishes unless `n=m`.

- `gibbsState`: `gibbsState (β : ℝ) (hβ : 1 < β) (u : AddAut (ℚ/ℤ)) : BCHecke ℂ →ₗ[ℂ] ℂ`.
- `gibbsState_one`: `gibbsState β hβ u 1 = 1`.
- `gibbsState_star_mul_self_nonneg`: `0 ≤ gibbsState β hβ u (star f * f) (a nonnegative real)`.
- `gibbsState_e`: `gibbsState β hβ u (e γ) = (Σ' k : ℕ+, exp (2π I k u(γ)) / k^β) / riemannZeta β`.
- `gibbsState_basis_of_ne`: `gibbsState β hβ u (x n * e γ * x' m) = 0` for n `≠ m`.

**Checks.**

- `gibbsState β hβ u (e (1/2)) = 2^(1−β) − 1` for every u `(u fixes 1/2)`.
- `gibbsState β hβ u (x 2 * x' 2) = 2^(1−β)`.
- `gibbsState β hβ u (e 0) = 1`.
- `gibbsState β hβ u (x 2) = 0` while `gibbsState β hβ u (x 2 * x' 2) = 2^(1−β) ≠ 0`, so the state is not multiplicative.

`φ_{β,u}(e(1/2)) = ζ(β)⁻¹ Σ (−1)^k k^{−β} = 2^{1−β} − 1`, which tends to `−1 = exp(2πi·1/2)` as `β → ∞`.

See [112][R112], Ch. 3, §4.6, (3.135) and (3.139), p. 475.

*Needs:* `B1`; [§6.28][R518]; [§6.39][R570]; `riemannZeta`; [§6.33g][R525]; [§6.43a](#s6-43a).

<a id="s6-43a"></a>

**§6.43a Absolute Gibbs diagonal summability.** For `β>1` and bounded `a∈C_Q`, `|⟨ε_k,π_u(a)ε_k⟩|≤‖a‖` and `Σk k^(−β)<∞`. Thus the diagonal Gibbs sum converges absolutely, defines a functional of norm≤1 after division by `ζ(β)`, and is positive on squares.

Bound every diagonal coefficient by the operator norm and dominate the sum by zeta(beta). Each coefficient on a `star` square is a squared vector norm; normalization on 1 and positivity give the norm-one state.

See [112][R112], Chapter 3, Theorem 3.32 and §4.6, (3.139)–(3.141), pp.474–475.

<a id="s6-44"></a>

### 6.44 Completed Gibbs state

For `β>1`, define `φβ,u(a)=ζ(β)⁻¹Σk≥1 k^(−β)⟨ε_k,π_u(a)ε_k⟩`. This continuous normalized positive functional on `C_Q` restricts to the algebraic Gibbs state.

Use absolute convergence to define a linear functional on the completed algebra. The preceding uniform norm bound gives continuity; compute its value on 1 and on `star` squares. Agreement on the core follows by inserting the regular representation formula.

- `CompletedKMS.gibbs_restrict`: Restriction gives `gibbsState`.
- `CompletedKMS.gibbs_norm`: The norm is 1.
- `CompletedKMS.gibbs_isKMS`: The completed Gibbs state is `KMSβ`.

**Checks.**

- The completed Gibbs state evaluates 1 to 1.
- Its value at embedded `e(1/2)` is `2^(1−β)−1`.
- Its value at `μ₂μ₂*` is `2^(−β)`.

See [112][R112], Chapter 3, §4.6, (3.139)–(3.141), p.475.

*Needs:* `B1`; [§6.28][R518]; [§6.39][R570]; [§6.24][R515]; [§6.30][R520]; [§6.33g][R525]; [§6.43a](#s6-43a).

<a id="s6-45"></a>

### 6.45 The Gibbs states are KMS_β states

For `β > 1` and u `∈ Aut(ℚ/ℤ)`, `φ_{β,u}` is a `KMS_β` state.

Assume `β > 1`.

Each normal-form monomial sends a basis vector to at most one basis vector. Hamiltonian implementation and positive-integer reindexing give the KMS identity with `n⁻ᵝ`. `Norm` domination by `Σk⁻ᵝ` permits linear extension; never cycle the unbounded `e^βH`.

The check on `f = x′₂`, `g = x₂: φ(x′₂ σ_{iβ}(x₂)) = 2^{−β}φ(x′₂x₂) = 2^{1−β}` and `φ(x₂x′₂) = φ(1 + e(1/2)) = 2^{1−β}`.

See [112][R112], Ch. 3, §4.6, (3.135) and (3.139), p. 475; [112][R112], Ch. 3, §2.2, Definition 3.6, p. 446.

*Needs:* `B13`; `B7`; [§6.43](#s6-43); [§6.29](#s6-29); [§6.28][R518]; `HilbertBasis`; [§6.44][R573]; [§6.28b](#s6-28b); [§6.45a](#s6-45a); [§6.34b](#s6-34b); [§6.34e](#s6-34e).

<a id="s6-45a"></a>

**§6.45a Gibbs strip correlations.** For `β>1` and core a,b, the Gibbs correlation `Σk ζ(β)⁻¹k^(−β)⟨ε_k,π_u(a σ_z b)ε_k⟩` converges locally uniformly on C and uniformly on each closed real strip of bounded imaginary height. On the KMS strip `0≤Imz≤β` it has the required two boundary values; finite normal-form reindexing supplies the upper boundary.

Finite support of a,b bounds all complex-time coefficients on each bounded imaginary strip. Dominate the diagonal sum by C `k^(−β)`. Check the boundary identity on normal forms by the divisibility formula and change k to nk; the factor `n^(−β)` is exactly the imaginary-time scalar. Extend bilinearly to the core and then by the core strip equivalence.

See [112][R112], Chapter 3, Definition 3.6, p.446; §4.6, (3.139)–(3.141), p.475.

<a id="s6-46"></a>

### 6.46 Gibbs barycentre of a probability measure

For `β>1` and a Borel probability `ν` on `W=zHat×`, define `φν(a)=integral_W φβ,u(a)dν(u)`. The character parameter W≃AddAut(Q/Z) is continuous on every torsion evaluation. The resulting map is a positive norm-one continuous functional and a `KMSβ` state. It is affine in `ν`; bijectivity and weak topological continuity are separate results.

Integrate completed Gibbs evaluations using their uniform norm-one bound. Positivity/normalization pass under integration; dominated convergence passes the completed strip identity.

- `completedBarycentre_apply`: Evaluation is the stated Bochner integral.
- `completedBarycentre_norm`: The functional has norm 1.
- `completedBarycentre_isKMS`: Every probability barycentre is `KMSβ`.

**Checks.**

- A Dirac mass at u recovers the completed Gibbs state `u`.
- For every `ν`, `φν(μ2 μ2*)=2^(−β)`.
- A convex combination of probabilities gives the same convex combination of functionals.

See [112][R112], Ch.3, Theorem 3.32 and proof, pp.474–476.

*Needs:* [§6.44][R573]; `MulAut`; `AddCircle`; [§6.46a][R575].

<a id="s6-46a"></a>

**§6.46a Profinite units act on rational torsion.** The imported `Ẑ×` maps to AddAut(Q/Z) by its compatible residues `u_N` acting on each N-torsion subgroup. This is bijective and continuous in the topology of finite restrictions; every torsion element belongs to one of these finite subgroups.

Restrict an additive automorphism to every cyclic N-torsion subgroup and identify it with an invertible residue modulo `N`. These residues are compatible under divisibility, yielding a profinite unit. Conversely compatible residues act consistently on the union of all torsion subgroups; finite evaluations prove continuity.

See [112][R112], Ch.3, §4.1, pp.457–459; Theorem 3.32, p.474.

<a id="s6-47"></a>

### 6.47 Cyclotomic values and Galois action on extremal KMS∞ states

For u `∈ Aut(ℚ/ℤ)` the extremal `KMS∞` vector state `φ_{∞,u}(f) = ⟨ε₁`, `π_u(f)ε₁⟩` is the limit of `φ_{β,u}` as `β → ∞`. On the rational form `H_ℚ` (the `ℚ-valued` functions), `φ_{∞,u}([X]) = exp(2πi u(γ))` if X is the class of `translation γ` and 0 otherwise; so `φ_{∞,u}(H_ℚ)` lies in the cyclotomic field `ℚ(μ_∞) ⊂ ℂ`. For every field automorphism `τ` of `ℂ`, `τ` ∘ `φ_{∞,u} = φ_{∞,χ(τ)u}` on `H_ℚ`, where `χ(τ) ∈ Aut(ℚ/ℤ)` is the automorphism with `τ(exp(2πiγ)) = exp(2πi χ(τ)(γ))`; that is, `τ` ∘ `φ_{∞,u} = φ_{∞,u}` ∘ `θ_{χ(τ)}`. This states the extremal `KMS∞` result and does not classify all upper-half-plane ground states.

Assume u `∈ Aut(ℚ/ℤ)`; `τ a` ring automorphism of `ℂ`.

`Onε₁` the monomial vanishes unless `m=1`, then is orthogonal unless `n=1`; translations give `exp(2πiuγ)`. `Asβ→∞`, `ζ(β)→1` and the tail `O(2⁻ᵝ)` give the same limit. A field automorphism permutes roots of unity, defining the additive bijection `χ(τ)` on Q/Z; hence `τ(exp(2πiuγ))=exp(2πiχ(τ)(uγ))`, as required by symmetry. Prove limits on completed states before rational restriction; no continuity of arbitrary complex automorphisms is assumed.

On BC's form `A_ℚ` the same values arise (rational-forms-comparison), so the statement does not depend on the choice of rational form.

See [112][R112], Ch. 3, §4.6, Theorem 3.32, (3.136)–(3.137), p. 475.

*Needs:* `B10`; [§6.27](#s6-27); `AddCircle`.

<a id="s6-47a"></a>

**§6.47a Compatible finite cyclotomic restrictions.** For every field automorphism `τ` of C fixing `Q`, the exponents `v_N∈(Z/NZ)×` defined by `τ(ζ_N)=ζ_N^(v_N)` are compatible under divisibility. Conversely compatible exponents define an automorphism of Qcycl. The imported finite cyclotomic Galois identifications supply each `v_N`; the transition verification supplies their inverse-limit element `v∈Ẑ×`.

Import each finite cyclotomic Galois identification. Restriction to smaller cyclotomic fields equates the exponents modulo their levels. The compatible family acts on the union Qcycl and yields the profinite unit; no global Artin theorem is needed.

See [112][R112], Ch.3, Theorem 3.32(4), pp.474–476.

<a id="s6-48"></a>

### 6.48 High-β extremal states and unique barycentres

For `β>1` every completed `KMSβ` state has a unique barycentre `ν` on `W`, characterized by `φ(a)=∫W φβ,u(a)dν(u)` for each `a∈C_Q`. Thus the high-beta KMS set is a Bauer simplex with extreme boundary homeomorphic to `W`. This specialized uniqueness follows from the measure bijection; it does not require an unproved general Choquet decomposition.

Use the KMS–scaling-measure affine correspondence. Identify Dirac masses with the explicit Gibbs formula. Use the probability-measure extreme-point theorem and transport unit multiplication.

`Forβ>1` the KMS simplex is affinely identified with probability measures `onẐ×`; its extreme points are the Dirac-unit Gibbs states. The unit symmetries act freely transitively on those extreme points. The full-measure unit-orbit decomposition holds for every scaling measure: `μ{x_p∈pZ_p}=p^(−β)`, whose sum over primes converges. Borel–Cantelli leaves only finitely many nonunit coordinates almost everywhere; a zero p-coordinate has measure zero by repeated p-scaling. Clearing the finite valuations places the point in exactly one positive rational translate of the unit group.

See [112][R112], Chapter 3, Theorem 3.32, pp.474–475; Proposition 3.8, pp.447–448 supplies the general Choquet statement.

*Needs:* `B12`; [§6.46](#s6-46).

<a id="s6-48a"></a>

**§6.48a Unit-orbit decomposition above the critical inverse temperature.** `Forβ>1`, the disjoint sets `nẐ×` cover a `μβ-full` subset ofẐ, and `μβ(Ẑ×)=∏p(1−p^(−β))=ζ(β)^(−1)`. Every scaling measure is reconstructed from a probability measure `onẐ×` by the weighted orbit sums.

For every normalized scaling measure, the mass of the p-divisibility cylinder is `p^(−β)`. Their sum is finite when `β>1`, so Borel–Cantelli leaves finitely many nonunit coordinates almost surely. A coordinate identically zero has zero mass by arbitrary repeated p-divisibility. Clear the remaining finite valuations by one positive rational, uniquely, to reach `W`. On the integral slice only positive integers occur; sum their scaling masses to get `μ(W)=1/ζ(β)`, and recover the measure from its normalized unit restriction.

See [114][R114], Introduction, unit-orbit decomposition after (1β), pp.1–2.

<a id="s6-48b"></a>

**§6.48b High-beta unit-mass reconstruction.** For `β>1` any normalized scaling `μ` is carried by the disjoint sets `qW`, `q∈Q_+×`, `W=Ẑ×`, and `μ(W)=1/ζ(β)`. Its normalized unit restriction `ν=ζ(β) μ|W` is a probability measure. Conversely `μν=ζ(β)⁻¹Σq∈Q_+× q^(−β)(q_*ν)` is the unique scaling measure with that unit restriction.

For the normalization on `Ẑ`, only `q∈N+` contributes, giving `ζ(β)`. On compact rational dilates the sum is finite as a measure after the same convergent bound. Recover each `qW` component by scaling; the complement is null by the high-beta orbit theorem.

See [114][R114], Neshveyev 2000, pp.1–2.

<a id="s6-48c"></a>

**§6.48c Probability measures parameterize high-beta KMS states.** For `β>1`, `ν↦∫W φβ,u dν(u)` is an affine homeomorphism from Radon probability measures on the existing compact group `W=Ẑ×` to completed `KMSβ` states. The inverse is the normalized unit restriction of the corresponding scaling measure.

The unit restriction and rational-orbit decomposition give inverse affine bijections. For each core element the Gibbs formula is continuous in u by the uniformly summable `ζ(β)` tail; norm density and state norm one extend this to every completed element. Integration gives weak continuity of the forward map. Radon probabilities on compact W form a compact space, and weak evaluation of states is Hausdorff, so the inverse is continuous. This avoids assuming restriction to the closed, nonopen unit locus preserves weak convergence.

See [112][R112], Ch.3, Theorem 3.32, pp.474–476; Neshveyev 2000, pp.1–2.

<a id="s6-48d"></a>

**§6.48d High-beta extreme states.** For `β>1` the extreme KMS states are precisely `φβ,u`, `u∈W`; equality of two such states forces equality of their unit parameters. Dirac probability measures are exactly the extremes of ProbabilityMeasure W under the preceding affine homeomorphism.

Transport extreme points through the affine probability-measure correspondence. Probability measures on a compact Hausdorff space are extreme exactly when Dirac; injectivity of the correspondence separates unit parameters.

See [112][R112], Chapter 3, Theorem 3.32(2), pp.474–475.

<a id="s6-49"></a>

### 6.49 Arithmetic values and symmetry intertwining

For an extremal `KMS∞` vector state, `e(a)` evaluates to the corresponding root of unity and every reduced normal-form monomial `with(n,m)≠(1,1)` evaluates to 0. Its rational arithmetic values generate Qcycl. The induced cyclotomic character intertwines field automorphisms with unit symmetries on those values.

Evaluate the normal form on `ε1`, retaining the coprime-index restriction. Use the rational generation theorem and the cyclotomic root image. Invoke the supplied cyclotomic/class-field character and verify the equality on the basis.

See [112][R112], Chapter 3, Theorem 3.32 (3)–(4), (3.136)–(3.137), p.475.

*Needs:* `B10`; `B7`; [§6.38](#s6-38); [§6.47](#s6-47); [§6.49a](#s6-49a).

<a id="s6-49a"></a>

**§6.49a The Gibbs limit and its uniform tail bound.** For `β→∞` the Gibbs states converge weakly to the `ε1` vector state, uniformly on each fixed norm-bounded observable set: the difference is at `most2||a||(ζ(β)−1)/ζ(β)`, which tends to 0. This supplies completed `KMS∞` states.

Separate `k=1` from the Gibbs diagonal sum. Bound every matrix coefficient by||a||. Use `ζ(β)−1→0` and the normalization difference.

See [112][R112], Chapter 3, (3.140)–(3.142), pp.475–476; weak Gibbs limit is the stated elementary consequence.

<a id="s6-50"></a>

### 6.50 The Bost–Connes phase transition

For `0<β≤1` there is exactly one completed `KMSβ` state; for `β>1` its extreme boundary is W and its states are uniquely the barycentres of the Gibbs extremes. The first regime follows from low-temperature-uniqueness, the second from high-beta-affine-homeomorphism; symmetry is a separate torsor theorem.

Assume `β > 0`; states and KMS condition as in kms-states.

Restrict to `C(Ẑ)` and use the affine KMS/scaling correspondence. For `0<β≤1` apply finite-prime projections, character annihilation and ergodicity; `forβ>1` apply unit-orbit decomposition and barycentres. Transport to states with symmetry intertwining.

The `β ≤ 1` formula at `e(1/2)` gives `2^{−β}(1 − 2^{β−1})/(1/2) = 2^{1−β} − 1`, the same value as the Gibbs formula, which is consistent at the boundary.

See [112][R112], Ch. 3, §4.6, Theorem 3.32, pp. 474–475; [112][R112], Ch. 3, §4.6, Theorem 3.32, p. 475.

*Needs:* `B12`; [§6.40](#s6-40); [§6.48](#s6-48); [§6.35](#s6-35); [§6.50a](#s6-50a).

<a id="s6-50a"></a>

**§6.50a Symmetry on the high-beta extreme boundary.** For `β>1`, pullback by `θ_v` maps `φβ,u` to `φβ,uv`, with composition conventions fixed by the action on Q/Z. Therefore W acts freely and transitively on the high-beta extreme boundary.

Apply the symmetry to each torsion generator in the Gibbs formula. The resulting character is the product of the two unit parameters. The injective identification of extremes with units then gives freeness and transitivity.

See [112][R112], Chapter 3, Theorem 3.32(3), pp.474–475.

### Examples

On `ℓ²(ℕ≥1)`, `Hε_n=(log n)ε_n`, so `exp(−βH)` has positive-integer-basis diagonal sum `ζ(β)` exactly for `β>1`; the `n=1` eigenvalue contributes 1. The relation `x₂x′₂=1+e(1/2)` detects why doubling on `ℚ/ℤ` is not an automorphism. The high-β parameter space is the probability measures on profinite units with weak topology; the limit ground states are vector states at the first basis vector. For a finite positive spectrum, scaling `λ` by c multiplies the zeta function by `c^(−s)` and its determinant by c to the number of eigenvalues. The compact scalar Laplacian has one zero mode, so the unprimed shifted determinant has a simple zero at shift zero.

### Dependencies

Mathlib Hecke and `C⋆-algebra`, Hilbert-space and measure tools where available; the exact positive-functional representation in the boundary section; ProfiniteArithmetic Layer 0, RestrictedProducts, GlobalNumberFields Layer 4 and AdelicAlgebraicGroups Layer 0. The BC universal completion, dilation-corner comparison and expectation-state comparison are local proof targets; crossed products, the amenable norm comparison, the reduced expectation and the dense-core KMS criterion come from OperatorAlgebraDynamics `D1`, `D2` and `D7`. The local target `bcPositiveRationals_amenable` supplies amenability. VonNeumannAlgebras V0–V4, V8 and V10–V11 supply the measured operator foundations, modular theory and ratio-set/flow classification; its V10.AffineHecke Haar model is the `β=1` instance of §6.41. FuchsianOrbifolds Layers 0–2, 4 supply the compact quotient and area formula; DifferentialGeometry Layer `12` supplies the metric measure and Green identity, with the opposite Laplacian sign. ComplexKahlerGeometry K5a supplies the closed-manifold realization and spectrum; `compactScalarRealization` compares its trivial complex line bundle with scalar `L²`, the energy form and negative div grad. The local explicit-kernel comparison, Gaussian orbital trace, full heat expansion and Weyl adapters above provide the additional hyperbolic analysis. AS.4/AS.6 are not asserted to export these refinements. Layer 4 Barnes G normalizes the identity determinant factor.

## Downstream consumers

The ArithmeticStatistics parts consume Layer 5’s cubic parametrization, finite weighted coefficients, uniform field-count bounds, quadratic large sieve, fourth moments and analytic continuations. Spectral and noncommutative arithmetic applications consume Layer 6’s completed Bost–Connes system, phase transition and compact scalar determinant comparison. These are downstream uses and provide no prerequisites.

## References

- **94.** [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch Zeta function III. Polylogarithms and special values][R94].
- **95.** [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function II. Analytic continuation][R95].
- **96.** [F. W. J. Olver, A. B. Olde Daalhuis, D. W. Lozier et al. (eds.); Chapter 5 by R. A. Askey and R. Roy — NIST Digital Library of Mathematical Functions, §5.17 Barnes’ G-function (double gamma function)][R96].
- **97.** [Victor S. Adamchik — Contributions to the Theory of the Barnes Function][R97].
- **98.** [Gergő Nemes — Error bounds and exponential improvement for the asymptotic expansion of the Barnes G-function][R98].
- **99.** [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function I. Zeta integrals][R99].
- **100.** [J. P. Keating and N. C. Snaith — Random Matrix Theory and ζ(1/2+it)][R100].
- **101.** [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function III. Polylogarithms and special values][R101].
- **102.** [Valentin Blomer — Subconvexity for a double Dirichlet series][R102].
- **103.** [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory][R103].
- **105.** [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory][R105].
- **107.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions][R107].
- **109.** [D. R. Heath-Brown — A mean value estimate for real character sums][R109].
- **111.** [Adrian Diaconu, Dorian Goldfeld and Jeffrey Hoffstein — Multiple Dirichlet series and moments of zeta and L-functions][R111].
- **112.** [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives][R112].
- **113.** [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory][R113].
- **114.** [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem][R114].
- **115.** [Peter Sarnak — Determinants of Laplacians, heights and finiteness][R115].
- **116.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function][R116].
- **117.** [Sergey Neshveyev — Von Neumann algebras arising from Bost–Connes type systems][R117].
- **118.** [Don Zagier — New points of view on the Selberg zeta function][R118].
- **119.** [Étienne Le Masson — Quantum chaos on hyperbolic surfaces][R119].
- **121.** [Jens Marklof — Selberg's trace formula: an introduction][R121].
- **122.** [Marcelo Laca — From endomorphisms to automorphisms and back: dilations and full corners][R122].

[R20]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic
[R22]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles
[R34]: ../AutomorphicSpectralTheory/README.md#15-finite-weyl-constant-term-formula
[R36]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/UniversalCovers#stage-0-port-the-foundations-into-tauceti
[R37]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence
[R38]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/OperatorAlgebraDynamics#d1-covariant-representations-and-full-crossed-products
[R39]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/OperatorAlgebraDynamics#d2-regular-representations-reduced-products-and-amenability
[R40]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/OperatorAlgebraDynamics#d7-analytic-dynamics-kms-states-and-modular-theory
[R41]: #bc-positive-rationals-amenable
[R94]: https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf
[R95]: https://arxiv.org/pdf/1005.4967v2
[R96]: https://dlmf.nist.gov/5.17
[R97]: https://arxiv.org/pdf/math/0308086v1
[R98]: https://arxiv.org/pdf/1406.2535v2
[R99]: https://arxiv.org/pdf/1005.4712v2
[R100]: https://web.williams.edu/Mathematics/sjmiller/public_html/RH/KeatingSnaith_RandomMatrixThAndZeta%28s%2Bit%29.pdf
[R101]: https://arxiv.org/pdf/1506.06161v1
[R102]: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf
[R103]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf
[R104]: https://www.jstage.jst.go.jp/article/jmath1948/24/1/24_1_132/_pdf
[R105]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf
[R106]: https://msp.org/ant/2011/5-8/ant-v5-n8-p05-p.pdf
[R107]: https://arxiv.org/pdf/2110.07712
[R108]: https://matwbn.icm.edu.pl/ksiazki/aa/aa72/aa7234.pdf
[R109]: https://ora.ox.ac.uk/objects/uuid:b188b365-d8d1-4267-8548-49f01e6cb6a7/files/m6af40476f1b860392271a2d8ecae593b
[R110]: https://www.dm.ufscar.br/cursos/pos/preprintsDM/preprints2009/JH7.pdf
[R111]: https://www.math.columbia.edu/~goldfeld/GoldfeldDiaconuHoffstein.pdf
[R112]: https://www.its.caltech.edu/~matilde/coll-55.pdf
[R113]: https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf
[R114]: https://arxiv.org/pdf/math/0002141v1
[R115]: https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf
[R116]: https://arxiv.org/pdf/2512.16681v2
[R117]: https://arxiv.org/pdf/0907.1456v1
[R118]: https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf
[R119]: https://perso.u-cergy.fr/~elemasson/qchyp.pdf
[R120]: #compact-scalar-realization
[R121]: https://people.maths.bris.ac.uk/~majm/bib/selberg.pdf
[R122]: https://arxiv.org/pdf/math/9911135
[R123]: https://arxiv.org/pdf/math/0002141
[R124]: https://arxiv.org/pdf/0907.1456
[R125]: ../VonNeumannAlgebras/README.md#v11-weights-connes-invariants-and-continuous-cores
[R126]: https://www.imo.universite-paris-saclay.fr/~helffer/deamain2008.pdf
[R127]: https://arxiv.org/pdf/2004.02383v1
[R128]: https://web.ma.utexas.edu/users/juschenko/files/Juschenko-Book-4.pdf
[R129]: ../ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality
[R130]: #s5-3a
[R131]: ../VonNeumannAlgebras/README.md
[R136]: ../AnalyticNumberTheoryPartI/README.md#prerequisites-and-boundaries
[R190]: ../AnalyticNumberTheoryPartI/README.md#s2-5
[R305]: ../AnalyticNumberTheoryPartI/README.md#s3-23
[R306]: ../AnalyticNumberTheoryPartI/README.md#s3-24
[R316]: #s4-1
[R317]: #s4-4a
[R321]: #s4-5b
[R327]: #s4-5c
[R329]: #s4-12a
[R346]: #s5-10b
[R348]: #s5-4
[R350]: #s5-10a
[R351]: #s5-13a
[R352]: #s5-13b
[R353]: #s5-13c
[R354]: #s5-13d
[R355]: #s5-13e
[R356]: #s5-13f
[R357]: #s5-1
[R365]: #s5-11
[R367]: #s5-21a
[R368]: #s5-21b
[R369]: #s5-21c
[R370]: #s5-21d
[R371]: #s5-21e
[R372]: #s5-21f
[R373]: #s5-21h
[R374]: #s5-21i
[R375]: #s5-21j
[R376]: #s5-21k
[R377]: #s5-21l
[R378]: #s5-21m
[R379]: #s5-21n
[R380]: #s5-21o
[R381]: #s5-21p
[R382]: #s5-21q
[R383]: #s5-21r
[R395]: #s5-24
[R396]: #s5-21
[R438]: #s5-27
[R440]: #s6-2
[R445]: #s6-12b
[R453]: #s6-4
[R454]: #s6-12c
[R465]: #s6-8
[R466]: #s6-14
[R473]: #s6-17c
[R477]: #s6-17g
[R478]: #s6-17h
[R479]: #s6-16
[R480]: #s6-18a
[R481]: #s6-18b
[R486]: #s6-18
[R487]: #s6-21a
[R488]: #s6-21b
[R489]: #s6-21c
[R490]: #s6-21d
[R491]: #s6-21e
[R492]: #s6-21f
[R493]: #s6-21g
[R494]: #s6-21h
[R495]: #s6-21i
[R496]: #s6-21j
[R497]: #s6-21k
[R498]: #s6-21l
[R499]: #s6-21m
[R501]: #s6-33a
[R502]: #s6-33f
[R503]: #s6-30a
[R504]: #s6-24a
[R505]: #s6-24b
[R506]: #s6-24c
[R507]: #s6-24d
[R508]: #s6-24e
[R511]: #s6-21
[R512]: #s6-22
[R513]: #s6-28a
[R515]: #s6-24
[R518]: #s6-28
[R520]: #s6-30
[R521]: #s6-33b
[R522]: #s6-33c
[R523]: #s6-33d
[R524]: #s6-33e
[R525]: #s6-33g
[R526]: #s6-33h
[R527]: #s6-33i
[R528]: #s6-10
[R530]: #s6-34a
[R532]: #s6-34c
[R533]: #s6-34d
[R555]: #s6-34
[R570]: #s6-39
[R573]: #s6-44
[R575]: #s6-46a
