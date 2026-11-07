# Roadmap: automorphic spectral theory and trace distributions, part II

**Summary.** Build the Schwartz multiplier method for a connected reductive group over a number field: finite-order entire interpolation produces symbols with controlled growth on real-form spectral lattices; real harmonic analysis turns them into continuous Schwartz multipliers; polynomial cuspidal counting and spherical Hecke separation give a multiplier normalized at any prescribed spectral character. Its automorphic range lies in the cuspidal-support components where that character occurs. Weighted quotient spaces, cuspidal-support projections, regular wave packets and Schwartz kernel expansions provide the analytic interfaces. The principal endpoints are BPLZZ Theorem 2.13 and Theorems 3.6–3.7 and 3.19, together with the weighted and spectral results of BPCZ §§2.5 and 2.9–2.10.

## Scope and ownership

AutomorphicSpectralTheory supplies nuclear Fréchet and LF test spaces, vector integration, the function-space kernel theorem, vector-valued Schwartz spaces and meromorphic operator families (§§0.11–0.15), restricted tensor factorization (§0.50), the finite Weyl constant-term formula, Paley–Wiener pseudo-Eisenstein series, their inner products and the orthogonal cuspidal-data decomposition of L²([G]¹) (§§1.5–1.10), intertwining operators with the GLₙ normalized intertwining estimates and their local–global factorization (§§2.1–2.5), truncation (§§3.1–3.4), the spectral decomposition of L²([G]¹) by discrete data with its residual and finite-multiplicity statements (§§4.1–4.5), the finite-place Luo–Rudnick–Sarnak bound (§7.1a), and the real Paley–Wiener theorems, compact-support multipliers and compact-test kernels `K_f`, `K_{P,f}` (§§6.1–6.4). That roadmap works with compactly supported tests on G(𝔸)¹ and stops before the moderate-symbol Schwartz multiplier theorem and the weighted quotient Schwartz spectral extensions built here. Its generic definitions and compact theorems are imported rather than restated as targets. This Part II owns the further extensions of that theory which it uses: the Nash Schwartz product comparison (§1.1), Delorme's rapid-symbol multipliers with their split-torus and joint-continuity inputs (§1.2a), the K_f-isotypic description of SLF representations (§2.5), holomorphy of completed tensor families (§2.15), the transport of cuspidal data to [G] and to a fixed split central character (§2.15a), Arthur's finite differentiability factorization (§3.2), Lapid's hereditary property for products of general linear groups (§3.6a), the support components and spectral expansion of convolution kernels, starting from compactly supported tests (§§3.8 and 3.10), Müller's polynomial bound for the discrete spectrum (§4.5a) and the Langlands discrete-data refinement of the cuspidal-support decomposition (§5.7). AutomorphicSpectralTheory §§5.1–5.9 owns Franke’s admissible-weight spaces on [G]. Sections 2.6 and 2.14 here use BPCZ’s arbitrary comparable measurable weights on [G]_P: at P=G, after matching central quotient, measure and level, the individual smooth weighted-L² stages agree with Franke’s S_p when w=p², and §2.14 forms the specified intersections and unions of those stages.

AutomorphicFormsOnReductiveGroups §§0.1–0.5 owns smooth adelic functions, the adelic test Schwartz algebra, uniform moderate growth and smoothing; §§2.1–2.4 and 2.7 owns real representations, induction, infinitesimal characters, globalizations and the continuous nondegenerate integrated Schwartz action; §§3.4–3.5 owns restricted tensor factorization; §§4.1–4.2 owns constant terms and cuspidal realizations. Here the real/adelic comparisons are topology and multiplier compatibility statements, and the growth spaces add specified quotient weights. The generic Kostant centralizer and principal-series inputs belong to its real representation layer; §1.4 retains only their rational-difference spectral comparison. Generic SF closed-subspace and globalization theory is not rebuilt here. SpectralManifolds SM3 owns the Fréchet open mapping theorem and closed-subspace quotient topology; §§2.5 and 2.18 apply them to the specified SLF stages.

AdelicAlgebraicGroups §§2.1–2.3, 3.1 and 3.4–3.6 owns heights, quotient measures, split-centre conventions, Iwasawa and reduction theory; §§4.6–4.7 owns compact central quotients and character theory. SmoothRepresentationsOfLocalGroups SR.1–SR.4 owns finite-place Hecke algebras, normalized induction, Jacquet modules and Satake theory. AutomorphicLFunctionsAndLocalFactors AL.R.4, **GLₙ isobaric sums**, and AL.3.7.2, **Strong multiplicity one for isobaric sums**, owns the GLₙ construction and uniqueness inputs. The quotient-weight applications and spectral interpolation are owned here.

ReductiveGroups Layer 7 and LieGroups Layer 7 own the group root datum and real descent. The finite involution coset and its shifted spectral lattices in §0.4 specialize those structures. NoncommutativeGeometry N1 owns completed projective tensor products. OperatorTheory/SelfAdjointSpectralTheory Parts A–E owns generic spectral calculus; OperatorTheory/OperatorIdeals OI-B32–OI-B41, OI-B84 and Part C owns Hilbert–Schmidt and trace-class tools. BanachSpaceTheory B4 owns the nuclear Banach-operator carrier and its isometric Hilbert trace-class comparison. PDE Lane A owns local Sobolev analysis, and PseudodifferentialOperators Layer 6 owns elliptic parametrices. The quotient nuclear inclusions and spectral realizations here differ by their automorphic weight and support estimates.

GlobalHolomorphicFunctions, **Preparatory primary factors and locally uniform products**, owns the elementary factors, locally uniform product construction and exact zero divisor. Here §0.2 adds the fixed-genus finite-rank global growth bound, including rank zero and an origin factor. The native formulas in Suggested.lean spell the supplied product for this acceptance test. ZerosOfLFunctions, standing **finite order** convention and Layer 5.1–5.6, owns order bounds and genus-one Hadamard theory; the predicate in §0.2 is only the existential integral global-bound specialization needed for interpolation. ModularCurvesPartII §1.4a, **Lattice sigma function**, owns the rank-two period-lattice sigma specialization. No Hadamard factorization or elliptic sigma theory is developed here.

Mathlib supplies Euclidean Schwartz functions, entire holomorphy, exponential and polynomial evaluation, unordered sums/products, almost-everywhere Lp classes and algebraic centroids. Their generic definitions are not targets here. CongruenceSpectralGap Layers 0–5 (from the congruence quotient and positive spectrum to the parameter bound and congruence gap) owns the congruence Laplacian gap, including its continuous threshold and curvature normalization; no target here uses that gap. Its Luo–Rudnick–Sarnak bound (§5.1) is the O(m)-spherical case over ℚ of the archimedean parameter bound that §3.6a proves for every number field and archimedean type. GanGrossPrasadUnitaryGroups §§6.3–6.4 owns relative period applications and trace comparison, and its §6.3a owns the theorem that base-change-compatible multipliers preserve matching and smooth transfer (BPLZZ §4.2, Proposition 4.8, pp.34–35; bplzz line 1685); §4.3 here supplies the scalar multiplier action that theorem uses. Harmonic analysis on reductive groups over nonarchimedean local fields (Plancherel inversion, tempered matrix-coefficient bounds, smoothing traces, Harish-Chandra descent, Schwartz germs and Fourier-averaging extensions) is outside this roadmap. Harish-Chandra's real Plancherel decomposition, used in §§1.2 and 1.6, is the AutomorphicFormsOnReductiveGroups contract real-plancherel-decomposition below, the same request with the same owner as in GanGrossPrasadUnitaryGroups.

## Conventions

Let F be a number field and G a connected reductive F-group. For isolation let Z be its maximal F-split central torus and ω a unitary automorphic character of Z(𝔸). All function and representation coefficients are ℂ. Finite-dimensional parameter spaces use their usual real or complex topology, with equivalent Euclidean norms; a basis identifies Uℂ with ℂⁿ without restricting dimension or lattice rank. All function spaces live in a fixed universe containing F, its adeles and their quotients; finite sets of types and countable stage exhaustions remain in that universe.

Fix a minimal parabolic, standard Levi subgroups, an admissible maximal compact and compatible Haar/quotient measures. At every retained unramified finite place vol(K_v)=1. S is finite and contains all ramified group and level places; T⊃S may be infinite, but every Hecke tensor has finite support. At places in S the full supplied local theory is used, with no exclusion of dyadic, triadic or ramified places. Induction is normalized by δ_P¹ᐟ². Infinitesimal characters are Weyl orbits in the complexified abstract Cartan dual. Use the supplied Weyl-and-unramified-twist equivalence of cuspidal data, with the fixed ω comparison below.

For a standard Levi M, a_M=Hom(X*_F(M),ℝ), its dual a_M* and A_M∞ are the absolute spaces of AdelicAlgebraicGroups §§2.1 and 3.1, used unchanged in Layers 2–3. In Layers 4–5, where ω is fixed, unitary twists, complex inducing parameters, central quotients and splittings use the relative space a_M^G, the kernel of the projection a_M→a_G of AdelicAlgebraicGroups §3.1. Through the split-centre splitting a_M=a_G⊕a_M^G its dual (a_M^G)* is the subspace of a_M* vanishing on H_M(Z(𝔸))=a_G; it is the dual of Z(𝔸)M(𝔸)¹∖M(𝔸), which BPLZZ calls a_M (BPLZZ §3.2, p.23; bplzz line 1149). For M=G it is zero. Witness: for G=M=G_m over ℚ with ω=1 and σ=1, the absolute space would admit s=1, moving the infinitesimal character from 0 to 1 and the central character away from ω, whereas the relative space admits only s=0. For the GL₂ upper Borel the relative parameters are (s,−s), which leave the central character unchanged, while (s,s) multiplies it by |z|^(2s).

Write [G]_P=M_P(F)N_P(𝔸)∖G(𝔸), [G]=[G]_G, n_P≥1 for its proper quotient height and σ_P=1+log n_P. Constants in ≪ are positive and independent of the displayed variables; ≍ means two-sided comparison. Right derivatives R(X) come from right translation. Put L(X)f(g)=(d/dt)₀f(exp(−tX)g), so π(L(X)f)=dπ(X)π(f). On the additive line with π_t(x)=exp(itx), both sides equal it times the Fourier integral. Put t_λf(α)=f(α−λ): t₁(z)=z−1, whereas the tensor weight +1 changes a character α to α+1. These witnesses fix the two different signs (BPLZZ §§2.3–2.4, bplzz line 522 and line 744).

Use the linear-first pairing ⟨φ,ψ⟩=∫φ·conj(ψ). Mathlib's inner product is conjugate-first, so exchange its slots. For scalars 1 and i these pairings are −i and i respectively. The adjoint test is f*(g)=conj(f(g⁻¹)) on the unimodular group. On ℝ/ℤ with mass-one Haar measure, right convolution by e₋ₙ, where eₙ(x)=exp(2πinx), projects onto eₙ, and convolution by eₙ projects onto e₋ₙ. Central disintegration uses δ_P⁻¹ᐟ²: for the GL₂ upper Borel and diag(a,1) with |a|=4, δ_P=4, normalized induction contributes 2 and disintegration contributes 1/2 (BPCZ §§2.5.5 and 2.10.1, bpcz line 1252 and line 2420).

Adelic smoothness includes a common compact open finite level. Test Schwartz functions have compact finite-place support and Nash decay at infinity. S([G]_P) and C([G]_P) are quotient function spaces, with algebraic-height and Harish-Chandra logarithmic decay respectively. A quotient-volume Ξ_P is different from a local spherical Ξ. All completed tensors are Hausdorff projective tensors at the indicated levels. Weighted L² uses the measure w dx: raising w strengthens integrability. Polynomially weighted measures use the reciprocal weight in total variation. Neither point evaluation on an arbitrary Lp representative nor norm continuity of a moving Dirac measure is assumed.

## Exact supplier contracts

### From Mathlib

Use `SchwartzMap` in Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75, whose fields require real smoothness and bounds on every weighted iterated derivative between real normed vector spaces; it does not define a reductive-group Schwartz space. Use `Differentiable` in Mathlib/Analysis/Calculus/FDeriv/Defs.lean:170, `Complex.exp` in Mathlib/Analysis/Complex/Exponential.lean, `MvPolynomial.eval` in Mathlib/Algebra/MvPolynomial/Eval.lean and `Polynomial.eval` in Mathlib/Algebra/Polynomial/Eval/Defs.lean. Use `Summable` and `Multipliable` in Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:114 for unordered families. Countability of the zero set and exclusion of its origin are specified separately.

Use `MeasureTheory.Lp` in Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89 as an almost-everywhere quotient with finite norm; a smooth pointwise representative requires the theorem in §2.6. Use `CentroidHom` in Mathlib/Algebra/Ring/CentroidHom.lean:56 for an additive map satisfying both multiplication identities; continuity and complex linearity are additional requirements of §1.7. Native finite-dimensional complex coordinate spaces, `LinearIndependent`, `Finset`, `deriv` and the unconditional product are the carriers in Suggested.lean.

### From Tau Ceti

No Tau Ceti module is imported by Suggested.lean. The library pin is 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a, with Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2. The roadmap contracts below are mathematical supply, not declarations claimed at those pins.

### From TauCetiRoadmap.AutomorphicSpectralTheory

Consume §0.11 for nuclear Fréchet and strict LF test spaces and bounded sets in strict LF limits, §0.12 for quasi-complete vector integration and summation, §0.13 for the nuclear function-space kernel theorem, §0.14 for vector-valued Schwartz spaces, and §0.15 for meromorphic operator families, whose weak-to-strong criterion under one common denominator, barrelled source, quasi-complete target and locally bounded regularized maps is used here with denominator 1 for holomorphic families. Consume §0.50 for restricted tensor factorization. Consume §1.5 for the finite Weyl constant-term formula, §§1.6–1.8 for Paley–Wiener pseudo-Eisenstein series, their square-integrability and the Langlands inner-product formula, and §§1.9–1.10 for cuspidal data, the Weyl-associate classes χ of pairs (P,σ) with σ occurring in L²_cusp([M_P]¹), and the orthogonal decomposition L²([G]¹)=⊕̂_χL²_χ. Consume §§2.1–2.5 for local and global intertwining operators, the Harish-Chandra μ-function, the GLₙ normalized intertwining estimates of §2.3a, continuation and functional equations, and the local–global factorization with M(w,λ)*=M(w⁻¹,−conj(wλ)). Consume §§3.1–3.4 for Arthur truncation and §§3.5–3.6 for the Maass–Selberg relations. Consume §§4.1–4.5 for the symmetric associate parameter fields, the unitary Eisenstein spectral map onto L²([G]¹), the residual spectrum and finite multiplicity in the discrete spectrum, and §7.1a for the finite-place Luo–Rudnick–Sarnak bound for unitary cuspidal representations of GL_m. Consume §§6.1–6.3 for the real invariant and operator Paley–Wiener theorems and Arthur's multipliers of compactly supported W-invariant distributions, and §6.4 for the compact-test kernels with `K_f(x,y)=Σ_{γ∈G(F)}f(x⁻¹γy)` and the parabolic kernels `K_{P,f}`.

These statements use G(𝔸)¹, equivalently the trivial A_G(ℝ)⁰-character, and compactly supported tests. Section 2.15a transports the cuspidal-data statements to [G] and to a fixed unitary character of the split centre, preserving quotient measures; §§3.8 and 3.10 extend the kernels to support components and to Schwartz tests. Compact Paley–Wiener multipliers alone are not the rapid-symbol multiplier input, which is §1.2a.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

Consume §§0.1–0.5 for the fixed-support/level Schwartz algebra, convolution, compact-test density, uniform growth and smoothing; §§2.1–2.4 and 2.7 for compact types, normalized real induction, infinitesimal characters and SF/SAF globalizations. In particular §2.7 supplies the continuous nondegenerate integrated Schwartz action on every smooth moderate-growth Fréchet representation, with its convolution law and compact-test restriction; §1.2 here compares its derivative conventions. Consume §§3.4–3.5 for restricted tensors and spherical lines; §§4.1–4.2 for constant terms and cusp spaces. The multiplier acts on these same carriers.

What AutomorphicFormsOnReductiveGroups must provide (gap:real-plancherel-decomposition): Supply Harish-Chandra's Plancherel decomposition of the Nash Schwartz algebra of a real reductive group with the chosen Haar measure, retaining finitely many real components.

The section contract is §§2.4, 2.7.

What AutomorphicFormsOnReductiveGroups must provide (gap:tempered-characters-in-torus-strips): Supply containment of every tempered infinitesimal character in the union, over realized maximal real tori, of the shifted spectral lattice strips of §0.4 with purely imaginary split part.

The section contract is §§2.2–2.4.

What AutomorphicFormsOnReductiveGroups must provide (gap:kostant-centralizer): Supply Kostant’s finite-free enveloping-algebra centralizer theorem with its tensor-character annihilator for finite-dimensional algebraic representations.

The section contract is §2.2.

What AutomorphicFormsOnReductiveGroups must provide (gap:generic-tensor-semisimplicity): Supply generic semisimplicity of minimal principal series tensored with a finite-dimensional algebraic representation, away from reducibility and character-collision hyperplanes.

The section contract is §2.3.

What AutomorphicFormsOnReductiveGroups must provide (gap:minimal-type-detection): Supply finite minimal-K-type detection for bounded discrete inducing parameters, uniformly under split twists and including limits of discrete series.

The section contract is §2.4.

What AutomorphicFormsOnReductiveGroups must provide (gap:k-type-growth): Supply polynomial compact-Casimir bounds for K-type dimensions and smooth seminorms in finite-length admissible moderate-growth Fréchet representations at each fixed finite level.

The section contract is §2.1.

### From TauCetiRoadmap.AdelicAlgebraicGroups

Consume §§2.1–2.3 for rational characters, split-centre quotients, homogeneous measures and integration in stages; §§3.1, 3.4–3.6 for relative roots, Iwasawa coordinates, group heights and Siegel covers; §§4.6–4.7 for compact abelian quotients and Fourier characters. All quotient maps retain their domains and compatible measures.

What AdelicAlgebraicGroups must provide (gap:quotient-height-comparison): Supply proper heights on intermediate adelic parabolic quotients and their polynomial comparison with fixed Siegel-chart group heights.

The section contract is §3.5.

What AdelicAlgebraicGroups must provide (gap:cusp-fiber-bounds): Supply, for standard P⊂Q, the polynomial bound c ε^(−r) for fibers of P(F)N_Q(𝔸)∖G(𝔸)→[G]_Q restricted to its Siegel cusp region of threshold ε, uniformly for 0 < ε ≤ 1.

The section contract is §3.6.

What AdelicAlgebraicGroups must provide (gap:deep-cusp-uniqueness): Supply, for standard P⊂Q, deep-cusp uniqueness for P(F)N_Q(𝔸)∖G(𝔸)→[G]_Q: for every positive Siegel cusp threshold ε there is C > 0 such that points in the ε-region and C-region with the same image coincide.

The section contract is §3.6.

What AdelicAlgebraicGroups must provide (gap:quotient-neighborhood-volumes): Supply comparison of quotient identity-neighborhood volumes on [G]_P with exp(−2⟨ρ₀,H₀(x)⟩) on fixed Siegel charts, uniformly at each fixed finite level.

The section contract is §3.6.

What AdelicAlgebraicGroups must provide (gap:central-character-affine-lattice): Identify the fixed-level norm-one central quotient as a compact abelian Lie quotient and compare its character differentials, the fixed split-central character and normalized unramified twists in i(a_M^G)* (trivial on the split centre Z(𝔸)) with a discrete affine lattice in the remaining central parameter space having complex-linearly independent generators and finitely many component characters at each differential.

The section contract is §§2.1–2.3, 4.6–4.7.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume SR.1.1–SR.1.3 for Hecke algebras and integrated actions, SR.2.2 for normalized induction/Jacquet modules and SR.4.1–SR.4.2 for Satake and spherical characters, for every supplied nonarchimedean local field and every specified hyperspecial subgroup.

What SmoothRepresentationsOfLocalGroups must provide (gap:satake-exponential-family): Supply normalized spherical Hecke characters under parabolic induction and restriction to an unramified Levi, with each fixed Hecke value a finite exponential polynomial in the common complex twist parameter.

The section contract is SR.4.1–SR.4.2.

### From TauCetiRoadmap.ReductiveGroups

Consume Layer 7, structure theory, for root data, character lattices and central/derived isogenies.

What ReductiveGroups must provide (gap:real-point-root-data): Supply the based Cartan root datum, torus character lattices and finite central/derived product covering after taking real points, with finite components explicit.

The section contract is Layer 7.

### From TauCetiRoadmap.LieGroups

Consume RepresentationTheory/LieGroups Layer 7, complexification and real forms, and Layer 6 for maximal compact tori and their character geometry.

What LieGroups must provide (gap:real-descent-cartan): Supply real descent on the abstract Cartan root datum, Weyl change of Cartan identification and the split/compact eigenspaces of each maximal real torus, compatibly with infinitesimal characters.

The section contract is Layer 7.

### From TauCetiRoadmap.PDE

Consume Lane A, Sobolev spaces, local embedding and distributional regularity; the application with quotient volume and arbitrary comparable weights is §2.7 here.

What PDE must provide (gap:local-sobolev-evaluation): Supply the compact-chart derivative-to-point-evaluation estimate and distributional smoothness from all local Sobolev derivatives used for weighted quotient evaluation in §2.7.

The section contract is Lane A, Sobolev embedding and local regularity.

### From TauCetiRoadmap.PseudodifferentialOperators

Consume Layer 6, §6.1 (P6), for ellipticity of differential operators and their two-sided parametrices modulo smoothing operators, and Layer 5, §5.1 (P5), for Sobolev mapping orders. Section 3.2 applies them, on a compact neighbourhood of the identity, to a power of a left-invariant elliptic operator on G∞; a parametrix of order −N has a Schwartz kernel of class Cᵐ once N>m+dim G∞.

### From TauCetiRoadmap.OperatorTheory and NoncommutativeGeometry

Consume OperatorTheory/SelfAdjointSpectralTheory Parts A–E for spectral measures and unbounded self-adjoint calculus, OperatorTheory/OperatorIdeals OI-B32–OI-B41 and OI-B84 for Hilbert–Schmidt ideals and Part C for their column realization, and the Hilbert–Schmidt composition supplement below. Consume NoncommutativeGeometry N1 for the completed projective tensor, its dense algebraic image, functoriality and complete-target universal property. These generic inputs are used by the automorphic nuclear inclusions and tensor comparisons.

### From TauCetiRoadmap.VonNeumannAlgebras

Consume V4.Core for the Hilbert–Schmidt product pairing and complex trace, with OperatorTheory/OperatorIdeals OI-B29–OI-B41 for the ideal carriers.

What VonNeumannAlgebras must provide (gap:hilbert-schmidt-nuclear-composition): Supply the trace-class and Banach-nuclear factorization of a composite of two Hilbert–Schmidt maps between complete complex Hilbert spaces, with nuclear norm bounded by the product of the two Hilbert–Schmidt norms and compatibility with the locally convex nuclear-map convention. Use BanachSpaceTheory B4's nuclear/trace-class identification for the norm comparison.

The section contract is V4.Core, Hilbert–Schmidt pairings and trace-class comparison.

### From TauCetiRoadmap.BanachSpaceTheory

Consume B4, **Approximation and Banach tensor products**, for the quotient-norm nuclear Banach-operator carrier, its absolutely summable rank-one expansions and its isometric identification with the trace-class gauge on complete Hilbert pairs. The Hilbert–Schmidt composite in the preceding contract uses this identification; §2.8 applies the resulting nuclear map separately at each Banach seminorm completion.

### From TauCetiRoadmap.GlobalHolomorphicFunctions and ZerosOfLFunctions

Consume GlobalHolomorphicFunctions, **Preparatory primary factors and locally uniform products**, for the primary-factor formula, compact-dependent locally uniform convergence and exact multiplicities. Apply it to the nonzero-point subtype with constant genus p and multiplicity one; rank summability supplies its compact majorants. Consume ZerosOfLFunctions, standing **finite order** convention and Layer 5.1–5.6, only for comparison with its order-bound predicate; its order-one factorization is outside the inputs to the interpolation proof.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Consume AL.R.4, **GLₙ isobaric sums**, for normalized isobaric construction, and AL.3.7.2, **Strong multiplicity one for isobaric sums**, for uniqueness, including arbitrary unramified norm twists and multiplicities of cuspidal constituents. Equality at almost all unramified places identifies the inducing multiset in §5.6, not an arbitrary irreducible constituent of an induction.

### From TauCetiRoadmap.SpectralManifolds

Consume SM3, **Smooth projective modules, functions and spectral measure**, for the open mapping theorem between complete metrizable locally convex complex spaces and the topology and completeness of quotients by closed linear subspaces. Applied to a continuous linear map of Fréchet spaces with closed image, it identifies the quotient by its kernel topologically with that image. Sections 2.5 and 2.18 use this theorem on fixed-level Fréchet stages.

## How to read the build

Layer 0 constructs analytic zero sets and spectral symbol algebras independently of the automorphic quotient. Layer 1 realizes these symbols as real Schwartz multipliers and compares their adelic stages. Layer 2 develops weighted quotient analysis and the constant-term maps. Layer 3 extends support projections, regular wave packets and kernels to these spaces. Layer 4 combines polynomial counting with interpolation to leave finitely many cuspidal-support blocks. Layer 5 separates the remaining unwanted blocks using finitely supported spherical operators and normalizes at the target character. Sections 1.2a, 2.15a, 3.6a and 4.5a extend AutomorphicSpectralTheory beyond compactly supported tests on G(𝔸)¹ and precede the sections that use them. Every subsection lists the inputs to both its statement and the indicated proof route; alternative proofs can use fewer route inputs. Suggested.lean states the three analytic headlines on native carriers; its module docstring names the automorphic headlines and their missing carriers.

## Layer 0: Entire interpolation and real-form symbol algebras

### 0.1 Finite-rank subsets of the complex line

Define `HasRankBound` for Λ⊂ℂ and p∈ℕ to mean that Λ is countable and the unordered sum `Σ_{λ∈Λ,λ≠0} ‖λ‖⁻⁽ᵖ⁺¹⁾` converges. Finite rank means existence of such p, and its rank is the least p. The origin is recorded separately, so neither 0⁻¹ nor an enumeration multiplicity enters the definition. (BPLZZ §2.1, Definition 2.1 and Lemma 2.2, p.9, which require p>0; the case p=0 is admitted here and its growth bound is treated in §0.2; bplzz line 401).

The defining construction has the following API.

- Λ′⊂Λ and a rank bound for Λ imply the same rank bound for Λ′.

- If p≤q and Λ has a rank bound p, then it has a rank bound q; treat the finitely many points of norm below 1 separately.

- For locally finite Λ, finite rank is equivalent to a polynomial upper bound on the number of points in disks; the exponents need not agree at the endpoint.

A proof route is as follows. Use an unordered sum over the nonzero-point subtype, so enumerating a set does not introduce multiplicities. Summability implies only finitely many nonzero points in each bounded disk; isolate the possible point 0.

*Needs:* Mathlib `Summable`.

**Checks.**

- The empty set has least rank 0.

- The image of ℤ in ℂ has least rank 1, since the harmonic sum diverges and the inverse-square sum converges.

- The set {1/(n+1):n∈ℕ} has no finite rank.

- No sequence converging to 0 through nonzero points has finite rank.

### 0.2 Finite-order Weierstrass products

Use the supplied primary-factor formula, written `elementaryFactor` in the acceptance signature, `E_p(w)=(1−w)exp(Σ_{j=1}^p wʲ/j)`, and specialize its product as `canonicalProduct`, `Ψ_{Λ,p}(z)=zᵟ∏_{λ∈Λ∖{0}}E_p(z/λ)`, where δ=1 exactly when 0∈Λ. Define `partialCanonicalProduct` by restricting that product to a finite subset of the nonzero-point subtype. If `HasRankBound` holds at p, use the supplied normal convergence, entire holomorphy and exact simple-zero divisor and prove the finite-rank global bound `‖Ψ_{Λ,p}(z)‖≤exp(C(1+‖z‖)ᵖ⁺¹)` for some C>0. The resulting finite-rank statement is `finite_rank_weierstrass_product`. Define `HasFiniteEntireOrder` by the existence of C>0 and an integer d≥0 bounding a function by exp(C(1+‖z‖)ᵈ); for an entire function this is equivalent to finite usual order. The elementary denominators j range over 1,…,p and every product denominator λ is nonzero. (BPLZZ §2.1, Lemma 2.2, p.9; bplzz line 404).

The supplied product and its finite-rank specialization have the following API.

- E_p has value 1 at 0 and has exactly one simple zero, at 1.

- The unordered product is independent of enumeration and treats a possible origin once.

- The product’s derivative is nonzero at every prescribed zero, and the finite-order bound holds with exponent p+1.

For the supplied elementary factor, retain its value 1 at 0, its zero criterion w=1, and the derivative formula `E_p′(w)=−wᵖexp(Σ_{j=1}^p wʲ/j)`, including p=0. For the finite partial product, retain the following API.

- At the empty finite index its value is zᵟ, with δ determined by membership of 0 in Λ.
- Inserting a nonzero point w outside the finite index multiplies its value by E_p(z/w).
- Reordering a finite index leaves the product unchanged; the directed finite-subset limit is the supplied unordered product.

For the finite-order bound predicate, retain the following API.

- Pointwise sums and products of two functions satisfying finite-order bounds satisfy another such bound, with a larger positive constant and the maximum of the two integral exponents.
- Composition with a polynomial ℂ→ℂ preserves a finite-order bound; the exponent can be multiplied by the polynomial degree, treating constant polynomials separately.
- For an entire function, a finite-order bound outside a compact disk extends to a global bound by enlarging its positive constant; norm equivalence gives the same finiteness predicate.

A proof route is to apply the supplied primary-product theorem and derive the global estimate |E_p(w)|≤exp(C_p|w|ᵖ⁺¹), then sum the rank majorant. The origin factor is absorbed in exp(C(1+|z|)ᵖ⁺¹). At p=0 use |1−w|≤exp(|w|).

*Needs:* §0.1; Mathlib `Differentiable`; Mathlib `Complex.exp`; GlobalHolomorphicFunctions, Preparatory primary factors and locally uniform products. The order-predicate comparison also uses ZerosOfLFunctions, standing finite-order convention.

**Checks.**

- For Λ={0,a}, a≠0, the product is z E_p(z/a); multiplicities are one, not enumeration dependent.

- For Λ=∅ the product is 1, including at z=0; taking a factor z unconditionally would give a false zero.

- For Λ={0,1} and p=0, the empty partial nonzero-point product is z and the partial product indexed by {1} is z(1−z); at z=2 these are 2 and −2.

- The constant function 1 has finite entire order with C=1,d=0, including at z=0 where the bound is exp(1).

- The function exp(z²) has a finite-order bound with C=1,d=2, since its magnitude is at most exp(|z|²).

- In contrast exp(exp(z)) has magnitude exp(exp(x)) on the positive real axis and has no finite-order bound.

- At p=0,1,2 and w=2, the elementary factors are −1, −exp(2), −exp(4); at w=0 all three are 1, and at w=1 all three are 0 with nonzero derivatives −1, −exp(1), −exp(3/2).

- For Λ={0,1,2}, p=0 and z=3, the two possible orders of the nonzero finite factors give 3·(−2)·(−1/2)=3; the empty nonzero index instead gives 3 and inserting just 1 gives −6. Equality of the final value with the empty value here does not identify the intermediate products.

- For Λ={0} the product is z and its derivative at 0 is 1.

- For Λ={0,a}, a≠0, and p=0 the product is z(1−z/a), with derivatives 1 at 0 and −1 at a; listing a twice would incorrectly make its zero double.

### 0.3 Interpolation with vertical strip decay

For U a finite-dimensional real space, Ψ entire on ℂ of finite order and q:Uℂ→ℂ polynomial, prove that there is an entire ν with zero set exactly q⁻¹(Ψ⁻¹(0)) and rapid decay on each vertical strip: for every M>0 and r∈ℕ there is C≥0 with (1+‖z‖)ʳ|ν(z)|≤C whenever ‖Re z‖≤M. In coordinates this growth predicate is `HasRapidVerticalDecay`, and the theorem is `polynomial_zero_fiber_interpolation`; the polynomial is an arbitrary multivariate polynomial. It also applies to q⁻¹(Λ) for every finite-rank Λ. Define `affineSpectralLattice` by the formula a+Σ_iℤb_i for any finite family b_i in Uℂ. When the family is complex-linearly independent this is a discrete affine lattice with unique integer coordinates. Under that independence hypothesis, for every finite A⊂Uℂ prove `affine_lattice_interpolation`: an entire rapidly vertically decreasing ν vanishes on this affine lattice outside A and is nonzero throughout A. A may contain points outside the lattice. This includes rank zero; there is no interpolation claim for arbitrary real lattices of Uℂ. (BPLZZ §2.1, Proposition 2.4, Corollaries 2.5–2.6 and Remark 2.7, pp.9–10; bplzz line 416).

The defining construction has the following API.

- An invertible real change of coordinates gives the same vertical-decay condition.

- The affine lattice is the range of integer linear combinations translated by its base point; independence makes the integer coordinates unique.

- The polynomial interpolation specifies both directions of the zero-set equality; lattice interpolation specifies no zeros away from the lattice.

A proof route is as follows. Choose complex coordinates and an odd integer q₀ so large that exp(Σ z_j^(2q₀)) dominates the finite-order polynomial pullback on every fixed vertical strip. For lattice interpolation choose coordinate functionals integral on the independent generators, omit their finitely many exceptional values, then remove any remaining unwanted lattice points by finitely many affine factors nonzero throughout A. Translate the variable for the affine case.

*Needs:* §0.2; Mathlib `MvPolynomial.eval`; the finite-dimensional coordinate and linear-independence APIs.

**Checks.**

- The imaginary-axis Gaussian exp(z²) decays rapidly; exp(−z²) does not.

- For L=ℤ and A={0}, the factor sin(πz)/(πz) has the desired zeros; damping supplies the required strip decay.

- In dimension zero there is one point: if Ψ(q)=0 choose ν=0; otherwise choose ν=1.

- For Ψ=0 choose ν=0; for constant q=c with Ψ(c)≠0 a zero-free damped exponential has empty zero set.

- For a rank-zero affine lattice {a} in positive dimension and A=∅, a nonconstant affine factor vanishing at a times damping works; if A={a}, a nonvanishing damped exponential works. In dimension zero there is no such affine factor: the only point is a, and the choices are ν=0 for A=∅ and ν=1 for A={a}, giving values 0 and 1 respectively.

- For a=1/2 and b₁=1 in ℂ, the integer coordinates −1,0,1 give lattice points −1/2,1/2,3/2. Thus the lattice is an affine translate, not the unshifted integers; the point 0 is outside it.

- The repeated generators (1,1) in ℂ have the nontrivial complex relation 1−1=0; the independence hypothesis fails and integer coordinates are not unique. A real lattice of rank two in ℂ is not admitted by this hypothesis.

### 0.4 Real-form involutions and shifted lattices

Import a based root datum (X*,Φ,X_*,Φ∨), its finite Weyl group W and real Cartan dual h*=X*⊗ℝ. For a real form choose its action ϑ₀ on the datum and put θ={wϑ₀:w∈W,(wϑ₀)²=1}; this finite W-conjugation-stable set is the real-form set. For ϑ∈θ let h*ϑ and h*−ϑ be its ±1 eigenspaces and `Yϑ=pr_{−ϑ}(ρ+X*)`, a discrete affine lattice in h*−ϑ. For each maximal real torus the split/compact decomposition gives an involution in θ; θG is the subset realized by such tori. Abstract Cartan identifications are taken modulo W. (BPLZZ §2.2, notation before Definition 2.8, p.10; §2.3, pp.11–12; Lemma 2.19, p.13; bplzz line 448).

The defining construction has the following API.

- θ is finite because it lies in the single finite coset Wϑ₀.

- Changing a simple-root basis does not change Yϑ.

- The split and compact parts of a maximal real torus identify with the ± eigenspaces of an element of θG⊂θ.

A proof route is as follows. Use root-datum real descent and the torus split/compact decomposition; different Cartan identifications are Weyl conjugate. Since changing positive roots changes ρ by a root-lattice element, Yϑ is independent of that choice. Distinguish the finite coset θ from the possibly infinite set of all root-datum involutions.

*Needs:* ReductiveGroups Layer 7 (real-point-root-data); LieGroups Layer 7 (real-descent-cartan); AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; real-point-root-data; real-descent-cartan.

**Checks.**

- For split G_m, W is trivial, θ={1}, and Y₁={0}.

- For the anisotropic real torus U(1), θ={−1}, the plus eigenspace is zero and `Y_{−1}=X*`.

- The rootless rank-two lattice has infinitely many involutions in GL₂(ℤ); taking all of them is not an allowed finite θ.

- No equality between θG and θ is required.

### 0.5 Moderate spectral symbols

For a finite W-stable involution set Θ, define `p_{ϑ,M,r}(μ)=sup_{α∈h*ϑ,ℂ,‖Re α‖≤M; ϖ∈Yϑ}|μ(α+ϖ)|(1+‖α+ϖ‖)^r`, allowing value ∞. MΘ consists of entire μ for which every ϑ∈Θ and M>0 admit some real r with p finite. Equivalently use a polynomial upper bound of some nonnegative integral degree on each strip. M denotes `M_{ {1} }`. The invariant subalgebra is MΘ^W. Exponents may depend on ϑ and M; the bound is uniform over all lattice translates. (BPLZZ §2.1, Definition 2.3, p.9; §2.2, Definition 2.8(1), p.10; §2.4, seminorms, p.13; bplzz line 463).

The defining construction has the following API.

- MΘ is an algebra with unit, and `p_{M,r+s}(μν)≤p_{M,r}(μ)p_{M,s}(ν)`.

- If Θ′⊂Θ, restriction of conditions gives MΘ⊂MΘ′.

- Every polynomial belongs to MΘ; its growth degree supplies one exponent uniformly in lattice translates.

- Pullback along Cartan maps: let ι:h₁*→h₂* be a real-linear map with complexification ι_ℂ. For `μ∈M_{ {1} }(h₂*_ℂ)`, `μ∘ι_ℂ` lies in `M_{ {1} }(h₁*_ℂ)`, with the strip width multiplied by the operator norm of ι; if ι sends every W₁-orbit into a W₂-orbit, Weyl invariance is preserved. This covers restriction to a subspace and composition with a linear splitting of it (BPLZZ §4.3, proof of Lemma 4.12, p.37; bplzz line 1829).

A proof route is as follows. Define the extended seminorm family before restricting to its finite domains. Use polynomial absorption to compare real and integral exponents and prove algebra closure.

*Needs:* §0.4; Mathlib `Differentiable`.

**Checks.**

- On ℂ, exp(z) is moderate on vertical strips although it has exponential growth on the real axis.

- On ℂ, exp(−z²) is not moderate on vertical strips.

- For Θ={−1} with Y=ℤ and μ(z)=exp(z), the ratio eⁿ/(1+n)^d tends to ∞ as n→+∞ for every d, so μ is not in MΘ, although exp(z) is moderate for Θ={1} on a line; a separate bound at each integer, without a uniform exponent, would wrongly admit it.

- Let W₂ be the coordinate swap on ℂ². Along the diagonal map ι(z)=(z,z) the swap-invariant symbol z₁z₂ pulls back to z², with value 4 at z=2, while the nonzero anti-invariant z₁−z₂ pulls back to 0, so pullback along an injective map does not detect every symbol. Along ι(z)=(z,0) with W₁={±1}, the orbit {z,−z} is not sent into one swap orbit, and the swap-invariant z₁+z₂ pulls back to z, whose values at 1 and −1 are 1 and −1: without the orbit condition Weyl invariance is lost.

- For Θ={−1} with Y=ℤ and μ(z)=z², the exponent r=−2 gives `sup_n n²/(1+|n|)²=1`, finite, whereas r=−1 gives an infinite supremum; the definition asks for some exponent, not a prescribed one.

### 0.6 Rapid spectral symbols

NΘ consists of entire μ such that `p_{ϑ,M,r}(μ)<∞` for every ϑ∈Θ, M>0 and real r; integral r≥0 suffice. When 1∈Θ the topology uses the countable family M,r∈ℕ with M≥1 and is Fréchet, and NΘ is an ideal in MΘ in the sense that multiplying a rapid symbol by a moderate symbol remains rapid. N denotes `N_{ {1} }`. Invariant symbols form the closed W-fixed subspace. (BPLZZ §2.2, Definition 2.8(2) and Remark 2.9, pp.10–11; §2.4, pp.13,17–21; bplzz line 471).

The defining construction has the following API.

- NΘ⊂MΘ by choosing exponent 0.

- For μ∈NΘ and ν∈MΘ, μν∈NΘ with the corresponding shifted-exponent estimate.

- When 1∈Θ the countable strip-seminorm topology is Hausdorff and complete, and W acts continuously; no such claim is made for arbitrary Θ without a holomorphic compact-open control.

A proof route is as follows. Uniform convergence on bounded strips gives entire limits; polynomially weighted bounds pass to the limit. Use the moderate exponent at each strip to absorb it into the universally quantified rapid exponent.

*Needs:* §0.5; AutomorphicSpectralTheory §§0.11–0.15.

**Checks.**

- For Θ={1} on a line, exp(z²) lies in NΘ.

- The constant 1 is moderate but is not rapid on a positive-dimensional vertical strip.

- In dimension zero, NΘ=MΘ=ℂ; all seminorms reduce to the absolute value at the single point.

- For Θ={−1} on a compact-torus line, sin(πz) has value 0 at every integer, so every displayed lattice seminorm is 0, but at z=i it has value i sinh(π)≠0. Those seminorms alone are not Hausdorff; adjoining 1 to Θ supplies the missing compact-open control.

- The quantifier over all exponents cannot be interchanged with existence of one exponent.

### 0.7 Sharp spectral symbols

M♯θ is the subalgebra of `M_{θ∪{1}}` consisting of μ such that, for each ϑ∈θ, the function α↦μ(α+ϖ) is identically zero on h*ϑ,ℂ for all but finitely many ϖ∈Yϑ. This is support of restrictions, not support of the entire function as a function on h*ℂ. M♯θ is an M-module. Its W-fixed algebra can be nonunital; 1 fails the condition whenever an infinite Yϑ occurs. (BPLZZ §2.2, Definition 2.8(3), Remark 2.9(2)–(3), pp.10–11; Remark 2.17, p.13; bplzz line 478).

The defining construction has the following API.

- For each ϑ, the set of ϖ for which the restricted entire function is nonzero is finite.

- M·M♯θ⊂M♯θ; this is the module property used after mixed separation.

- W transports supports and preserves M♯θ, so finite Weyl products stay sharp.

A proof route is as follows. Finite supports are preserved by sums, products and Weyl action. For multiplication by M, only finitely many shifted subspaces survive, so bounded real shifts reduce the estimate to a strip for the factor in M.

*Needs:* §0.5.

**Checks.**

- For a split torus with θ={1}, Y₁={0}, so sharpness imposes no additional support condition on M.

- For U(1), the constant 1 is not sharp because `Y_{−1}=ℤ` is infinite.

- After vertical damping, sin(πz)/(πz) is sharp for θ={−1} and is nonzero at 0 while vanishing at every other integer.

- Do not introduce a unit or silently coerce a Hecke element to a sharp multiplier.

### 0.8 Sharp symbols nonzero on prescribed orbits

For every a∈h*ℂ there exists μ∈(M♯θ)^W with μ(a)≠0, provided θ is finite and W-stable. One can normalize μ(a)=1. More generally a finite set of points can be kept nonzero. No assertion is made for an infinite involution set. (BPLZZ §2.2, Lemma 2.10, p.11; bplzz line 495).

A proof route is as follows. For each ϑ interpolate on its shifted lattice while avoiding the projections of the finite W-orbits of the specified points. Take the product over the finite sets θ and W, then normalize; nonvanishing is required at every Weyl translate before taking the product.

*Needs:* §0.3; §0.7.

**Checks.**

- The resulting symbol is in the nonunital sharp algebra even in the compact-torus case.

### 0.9 Polynomial and rational difference operators

Let R=ℂ[h*ℂ]⋊(X*⋊W) act by finite sums of polynomial coefficients times affine pullbacks; fix t_λ f(α)=f(α−λ). Let T be its localization to rational coefficients and S the subalgebra obtained by inverting affine reflection linear equations ℓ_s. Write S_pol for those elements preserving all polynomials. Evaluation and composition retain the pullback order. Only finite sums occur. (BPLZZ §2.4, notation before Lemma 2.20, p.14; Lemma 2.23, p.17; bplzz line 645).

The defining construction has the following API.

- (t_λf)(α)=f(α−λ).

- For polynomial q, t_λ(qf)=(t_λq)(t_λf).

- For an affine reflection s with equation ℓ_s, (1−s)/ℓ_s preserves polynomials and lies in S_pol.

A proof route is as follows. Construct the crossed-product action with the chosen inverse-action convention. Keep localization identities separate from the action on entire functions; apparent poles are removed only for polynomial-preserving operators.

*Needs:* §0.4.

**Checks.**

- For f(z)=z, t₁f=z−1.

- For s(z)=−z and ℓ_s=z, (f(z)−f(−z))/z sends z to 2 and 1 to 0.

- The operator f↦f/z does not preserve polynomials, since it sends 1 to 1/z.

- For translations, `t_λt_η=t_{λ+η}`; multiplication by a polynomial does not commute with a translation.

### 0.10 Holomorphic extension and strip estimates

Every S∈S_pol extends uniquely to a continuous operator on entire functions with their compact-open topology. There are M_S>0 and a real exponent shift r_S≥0 such that, for every M>0 and r∈ℝ there is `C_{S,M,r}>0` with `p_{1,M,r}(Sμ)≤C_{S,M,r}p_{1,M+M_S,r+r_S}(μ)` for every entire μ. For a real-form coset θ the same quantifier order gives `max_{ϑ∈θ}p_{ϑ,M,r}(Sμ)≤C_{S,M,r}max_{ϑ∈θ}p_{ϑ,M+M_S,r+r_S}(μ)`, enlarging the constant if necessary. A rational-coefficient difference operator preserving polynomials has poles only along affine reflection hyperplanes and belongs to S. If μ vanishes on H_s, μ/ℓ_s is entire and satisfies the corresponding widened-strip estimate without an extra polynomial exponent. (BPLZZ §2.4, Lemmas 2.20–2.21, pp.14–16; Lemma 2.23, p.17; bplzz line 656).

A proof route is as follows. Use Taylor polynomials for compact-open density and integral division in a transverse direction for a vanishing numerator. Bound the whole unit disk in that direction, not only a fixed endpoint. When a reflection commutes with ϑ use the companion involution sϑ in the same real-form coset; the general finite W-stable set alone does not justify this step. For the localization criterion compare values of polynomials at affine translates at a generic pole and use interpolation to exclude a nonreflection pole.

*Needs:* §0.9; §0.5.

**Checks.**

- The rank-one divided difference is entire at 0 and its value there is 2f′(0).

- The estimates use extended seminorms; an arbitrary entire function need not have a finite right-hand side.

### Examples

For Λ=ℤ, p=1 and q(z)=z², the pullback zero set is {z:z²∈ℤ}; an entire canonical product followed by vertical damping realizes it exactly. On the rank-one compact-torus lattice, exp(z²)sin(πz)/(πz), with the removable value 1 at 0, is nonzero at 0 and zero at every other integer. Its imaginary-axis magnitude is exp(−t²)sinh(π|t|)/(π|t|), which decays faster than every power. The divided difference of z²+z under z↦−z is 2.

### Dependencies

Mathlib holomorphy and unordered products; ReductiveGroups Layer 7; LieGroups Layer 7; AutomorphicFormsOnReductiveGroups §2.2; AutomorphicSpectralTheory §§0.11–0.15.

## Layer 1: Real and adelic Schwartz multipliers

### 1.1 Real Schwartz and Sobolev descriptions

Take the real-group factor of AutomorphicFormsOnReductiveGroups §0.3. Its elements are smooth functions for which Df is bounded for every algebraic differential operator D on G(ℝ). The seminorm topology is nuclear Fréchet and equals the topology defined by ‖Df‖₂ for all algebraic D, using distributional derivatives for the converse. The comparison is with Nash Schwartz functions, not merely Harish-Chandra C²(G). There is a continuous inclusion `S(G)⊂⋂_{p>0}C^p(G)`, with equality precisely when the algebraic centre of G is compact at the real points. For an additive real vector group the resulting polynomial derivative conditions agree with Mathlib SchwartzMap. (BPLZZ §2.3, definition and Remarks 2.11–2.12, pp.11–12; bplzz line 522). Prove the product comparison: for real algebraic groups G₁ and G₂, multiplication of pure tensors induces a topological isomorphism S(G₁)⊗̂πS(G₂)≅S(G₁×G₂). For a split real torus H⁰, the identity component of the real points of a split torus, with real Cartan dual h* and Haar measure dh transported from Lebesgue measure on h by log, prove that the Fourier–Laplace transform `f↦(λ↦∫_{H⁰}f(h)exp(−λ(log h))dh)` is a topological isomorphism from S(H⁰) onto N(h*_ℂ) of §0.6, with Θ={1}. (BPLZZ Appendix A, proof of Lemma A.2, p.44, citing [AG10, Corollary 2.6.3] for products and the classical Paley–Wiener theorem for Schwartz functions on split tori; bplzz line 2163 and line 2167.)

A proof route is as follows. Compare algebraic differential operators to polynomially weighted invariant derivatives in finitely many algebraic charts. Use local Sobolev estimates and polynomial volume growth in algebraic height for the L²/bounded comparison. Use the standard comparison with Harish-Chandra seminorms, keeping the noncompact central directions. For products, compare the product seminorms on finitely many algebraic product charts and use density of pure tensors with nuclearity of the stages. For the torus, integrate by parts in log coordinates for the forward estimate and shift contours in the inverse transform for the reverse one.

*Needs:* §0.6; AutomorphicFormsOnReductiveGroups §§0.1–0.5; Mathlib `SchwartzMap`; AutomorphicSpectralTheory §§0.11–0.15; PDE Lane A; NoncommutativeGeometry N1.

**Checks.**

- On a split real torus, decay in the logarithm of the torus coordinate alone does not give Nash Schwartz decay.

- For a compact real reductive group this space is C∞ with its usual topology.

- On `H⁰=ℝ_{>0}`, in the coordinate x=log t with dx, f(t)=exp(−(log t)²) is Schwartz and its transform is √π·exp(λ²/4), entire and rapidly decreasing on vertical strips. By contrast f(t)=2t/(1+t²)=1/cosh(log t) decays only like t⁻¹ and t, and its transform π/cos(πλ/2) has poles at λ=±1, so it is not in N.

- For G₁=G₂=ℝ the product comparison is S(ℝ)⊗̂πS(ℝ)=S(ℝ²); exp(−π(x²+xy+y²)) lies in the completion but, having a kernel of infinite rank, is not a finite sum of pure tensors.

### 1.2 Schwartz integration on moderate representations

For a smooth moderate-growth Fréchet representation V of G(ℝ), use the continuous nondegenerate integrated Schwartz action supplied by AutomorphicFormsOnReductiveGroups §2.7. Under the Schwartz-algebra comparison of §1.1, prove that it agrees with π(f)v=∫_G f(g)π(g)v dg in the conventions here, including the left/right differentiation identities with L(X)f(g)=d/dt f(exp(−tX)g). Transport its continuity, convolution law π(f₁*f₂)=π(f₁)π(f₂) and agreement with compactly supported integration along that comparison. For irreducible admissible π use the supplied Casselman–Wallach globalization. Prove that equality of the transforms on all such π detects an element of S(G). (BPLZZ §2.3, before Theorem 2.13, p.12; §2.4, proof of Proposition 2.24, pp.17–19; bplzz line 532).

A proof route is as follows. Compare the supplied Schwartz algebra with §1.1, identify the actions on compactly supported functions, and use density and their supplied continuity to extend that equality. Compare the differentiated actions by integration by parts with the specified left regular sign; the convolution law is transported from the supplier. For detection use the faithful regular representation and the real Plancherel decomposition requested in real-plancherel-decomposition: an element of S(G) whose transforms all vanish has zero L² norm.

*Needs:* §1.1; AutomorphicFormsOnReductiveGroups §0.3 (Schwartz algebra and compact-test density), §§2.1–2.4, 2.7 (integrated action and globalization); real-plancherel-decomposition.

**Checks.**

- On the additive line with π_t(x)=exp(itx), π_t(L(X)f)=itπ_t(f): at t=1 and t=2 the factors are i and 2i. The opposite derivative sign gives −i and −2i.

- For π_t(x)=exp(itx), the imported action and the compared action both have scalar ∫f(x)exp(itx)dx. With Lebesgue measure, at t=0 and f(x)=exp(−πx²), both scalars are 1; on the group with one element and mass-one measure, both actions send (f,v) to f(1)v.

### 1.2a Rapid-symbol multipliers on semisimple groups and split tori

Let G_s be a connected linear semisimple real Lie group with maximal compact subgroup K_s, abstract Cartan dual h*_s and Weyl group W_s. For a compact bi-K_s-invariant Ω⊂G_s and a finite set T of K_s-types, write C_Ω^∞(G_s)_T for the Fréchet space of smooth functions supported in Ω whose left and right K_s-types lie in T, and S(G_s)_T for the corresponding closed subspace of S(G_s). For `μ∈N(h*_{s,ℂ})^{W_s}`, prove that there is a unique linear map μ⋆:C_Ω^∞(G_s)_T→S(G_s)_T with π(μ⋆f)=μ(χ_π)π(f) for every irreducible admissible π (Delorme's theorem, [Del86, Théorème 1.7], as used in BPLZZ Appendix A, pp.43–44; bplzz line 2099 and line 2169). For a connected abelian real reductive group Z⁰, with z* the real span of the weight lattice of its complexification, and μ∈N(z*_ℂ), prove the analogous statement with smooth characters ξ in place of irreducible admissible representations: ξ(μ⋆f)=μ(χ_ξ)ξ(f) ([Sak, Theorem 2.1.2], as used in BPLZZ Appendix A, pp.44–45; bplzz line 2173). Both maps are continuous, by injectivity of the operator-valued Fourier transform and the closed graph theorem (bplzz line 2179). Prove also that a separately continuous bilinear map from the product of two complex Fréchet spaces to a Hausdorff locally convex space is jointly continuous, and therefore extends uniquely to the completed projective tensor product when the target is complete ([Trè67, Theorem 34.1], as used in BPLZZ Appendix A, p.45; bplzz line 2198). The output need not be compactly supported, and W_s-invariance of μ is required for μ(χ_π) to be defined.

A proof route is as follows. In the semisimple case, describe the operator-valued transform of f at fixed support and K-types by Arthur's operator Paley–Wiener theorem; multiplication by μ preserves its differential matrix-coefficient relations and turns exponential type into rapid decay on every vertical strip, and Fourier inversion on the tempered dual with contour shifts in the induced parameters bounds every Schwartz seminorm of the inverse transform. For Z⁰ use Fourier series in the compact directions and the Paley–Wiener isomorphism of §1.1 in the split directions. For joint continuity, apply Banach–Steinhaus to the maps in one variable indexed by a null sequence in the other, then use metrizability. Uniqueness uses detection of Schwartz functions by their transforms (§1.2).

*Needs:* §0.6; §1.1; §1.2; AutomorphicSpectralTheory §6.2 (operator Paley–Wiener theorem); AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; real-plancherel-decomposition; Mathlib `WithSeminorms.banach_steinhaus`.

**Checks.**

- On `Z⁰=ℝ_{>0}`, in the coordinate x=log t, μ(λ)=exp(λ²) is rapidly decreasing on vertical strips, since |exp((σ+iτ)²)|=exp(σ²−τ²). Its multiplier is convolution in x by `k(x)=(4π)^{−1/2}exp(−x²/4)`, whose transform ∫k(x)exp(−λx)dx equals exp(λ²) for either sign convention because μ is even; `k(0)=(4π)^{−1/2}`. For nonzero compactly supported f the output is not compactly supported: otherwise its transform exp(λ²)f̂(λ) would be of exponential type, forcing |f̂(σ)|≤C·exp(R|σ|−σ²) for real σ, and a nonzero entire function of exponential type cannot decay that fast along a line.

- For SL₂(ℝ), W={±1} acts on h*_ℂ=ℂ by λ↦−λ, and the principal series at λ and −λ share their infinitesimal character. The rapidly decreasing μ(λ)=λexp(λ²) takes the values e and −e at λ=1 and λ=−1, so μ(χ_π) is undefined; this is why the symbol must be Weyl invariant.

- On ℓ² with the weak topology in both variables the inner product is separately continuous, yet the unit vectors e_n tend weakly to 0 while ⟨e_n,e_n⟩=1. Joint continuity fails, so the Fréchet hypothesis cannot be dropped.

### 1.3 Delorme multipliers for reductive real groups

For μ∈N(h*ℂ)^W and compactly supported smooth bi-K-finite f on a real reductive algebraic group, there is a unique bi-K-finite Schwartz function μ⋆f with π(μ⋆f)=μ(χπ)π(f) for every irreducible admissible π. For every fixed finite left/right K-type set and compact-support stage, the map is continuous to the corresponding finite-K-type Schwartz space. The output need not be compactly supported. The W-invariance hypothesis is mandatory. (BPLZZ Appendix A, Proposition A.1 and Lemma A.2, pp.43–45; §2.4, p.17; bplzz line 2099).

A proof route is as follows. Use the semisimple and split-torus multipliers of §1.2a; compact Paley–Wiener multipliers alone do not supply them. Write the identity component as (Z⁰×G_der⁰)/(Z⁰∩G_der⁰), use fixed K-type/support completed tensor products, and descend finite-kernel invariants. The split-torus Paley–Wiener isomorphism and the Nash Schwartz product comparison of §1.1 identify N(h*_ℂ)^W with the completed tensor product N(z*_ℂ)⊗̂πN(h*_der,ℂ)^W (Lemma A.2). Extend the separately continuous bilinear symbol action jointly by §1.2a, then use the completed tensor universal property. Extend to finitely many components by K/K⁰.

*Needs:* §0.6; §1.1; §1.2; §1.2a; AutomorphicSpectralTheory §§0.11–0.15; NoncommutativeGeometry N1.

**Checks.**

- For a split torus this reduces to the Fourier–Laplace multiplier theorem, including real central directions.

- The finite kernel uses G_der⁰; replacing it by all of G_der can enlarge it incorrectly.

### 1.4 Kostant centralizers and translated characters

Specialize the supplied finite-free Kostant centralizer `R_τ=(U(𝔤)⊗End τ)^{δ𝔤}`, for a finite-dimensional algebraic representation τ, to the spectral difference algebra. For any chosen Z(𝔤)-basis v_i construct polynomial-preserving rational differences S_i with δ(z)=Σ_iS_i(z)v_i, prove their widened-strip estimates, and transport the supplied annihilator `∏_{λ∈Λ(τ)}(δ(z)−t₋λz)=0`. Here Λ(τ) is the finite weight set and t_λf(α)=f(α−λ), so the roots are z(α+λ). The finite-free theorem and tensor-character annihilator themselves are the AutomorphicFormsOnReductiveGroups §2.2 supplier contract. (BPLZZ §2.4, Lemma 2.22 and its proof, p.16; Kostant’s Theorems 4.8–4.9 only as cited in BPLZZ, bplzz line 741 and line 760; the translated-character argument is at bplzz line 744).

*Needs:* §0.10; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; kostant-centralizer.

**Checks.**

- For τ of weight λ on a torus, the central character shifts by +λ; this checks the translation sign.

### 1.5 Generic semisimplicity after tensoring

For a minimal parabolic P=MAN, irreducible finite-dimensional ξ of M and finite-dimensional algebraic τ, compare the supplied generic decomposition of I_P(ξ,λ)⊗τ with §1.4’s translated spectral characters. On the complement of the locally finite reducibility and character-collision hyperplanes it is a finite semisimple sum with precisely the weight-prescribed infinitesimal characters, counted with the appropriate multiplicities. The generic semisimplicity input belongs to AutomorphicFormsOnReductiveGroups §§2.3–2.4; here prove compatibility with the holomorphic multiplier identities, including continuation of those identities across exceptional parameters, without continuing semisimplicity there. (BPLZZ §2.4, Lemma 2.25 and proof, p.20; bplzz line 971).

*Needs:* §1.4; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; generic-tensor-semisimplicity.

**Checks.**

- At a reducibility point only the holomorphic identity continues; the semisimplicity conclusion does not.

### 1.6 L² estimates for rapid-symbol multipliers

For `μ∈N_{θ∪{1}}^W` the compact-support multiplier extends uniquely to a continuous multiplier on S(G). For each algebraic differential operator D there is M_D>0 such that for every r∈ℝ a continuous seminorm `ν_{D,r}` on S(G) satisfies `‖D(μ⋆f)‖₂≤ν_{D,r}(f) max_{ϑ∈θ∪{1}}p_{ϑ,M_D,r}(μ)`. The transform identity holds on every irreducible admissible representation, not only the tempered dual. (BPLZZ §2.4, Proposition 2.24, pp.17–19; bplzz line 803).

A proof route is as follows. On compact bi-K-finite functions use Plancherel, the inclusion of tempered characters in the shifted imaginary strips (tempered-characters-in-torus-strips), and centralizer difference-operator bounds to estimate multiplication by algebraic coefficients. Generic principal-series identities and the subquotient theorem transfer the transform formula to all admissible representations. Density in the L² derivative topology extends the action, and the convolution and continuity identities pass to the limit.

*Needs:* §1.3; §1.4; §1.5; §1.1; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; real-plancherel-decomposition; tempered-characters-in-torus-strips; kostant-centralizer; generic-tensor-semisimplicity.

**Checks.**

- Use only containment of the tempered character set in the lattice union; equality is false for compact groups.

### 1.7 Schwartz multipliers of moderate symbols

For every `μ∈M_{θ∪{1}}(h*ℂ)^W` there is a unique continuous complex-linear Tμ:S(G)→S(G) such that π(Tμf)=μ(χπ)π(f) for all irreducible admissible π. It is a centroid multiplier: Tμ(f₁*f₂)=Tμ(f₁)*f₂=f₁*Tμ(f₂). The map μ↦Tμ is multiplicative and linear, preserves every finite left/right K-type subspace, and agrees with the AutomorphicSpectralTheory §§6.3–6.4 compact multiplier on the common domain. Its kernel consists of symbols vanishing at actual infinitesimal characters of irreducible admissible representations; no classification of all continuous multipliers is asserted. (BPLZZ §2.3, Theorem 2.13, p.12; §2.4, completion of proof and Remark 2.26, pp.20–21; Remark 2.16, pp.12–13; bplzz line 548).

A proof route is as follows. Choose a W/θ-invariant homogeneous polynomial positive on every limiting imaginary-real subspace; damp by exp(−P(z/n)) to get rapid symbols. Prove convergence in weaker weighted strip seminorms, then use the rapid L² estimates for every D to obtain a Cauchy sequence in S(G). Pass the representation identities to the limit; faithfulness gives uniqueness and both centroid identities. Record the continuous complex-linear refinement of the existing CentroidHom rather than a replacement multiplier carrier.

*Needs:* §1.6; §0.5; Mathlib `CentroidHom`.

**Checks.**

- The multiplier of μ=1 is the identity, even when 1 is not sharp.

- For compact SU(2), 0 is in the lattice union but is not an actual admissible infinitesimal character.

### 1.8 Finite K-type detection for sharp symbols

For μ∈(M♯θ)^W there is a finite set 𝔗 of irreducible K-types such that every irreducible admissible π with μ(χπ)≠0 contains a type in 𝔗. Moreover μ⋆ preserves bi-K-finiteness and defines the corresponding multiplier on the algebraic K-finite Schwartz algebra. This does not say μ selects finitely many irreducible representations or finitely many split inducing parameters. (BPLZZ §2.3, Lemma 2.18, p.13; Remarks 2.17 and 2.26, pp.13,21; bplzz line 590).

A proof route is as follows. Use sharp support to bound the discrete parameters of the inducing Levi; keep unrestricted split twists. Include nondegenerate limits of discrete series and the minimal-K-type preservation statement minimal-type-detection, then take the union over finitely many Levi/tori and remaining parameters.

*Needs:* §0.8; §1.7; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; minimal-type-detection.

**Checks.**

- The limits of discrete series for SL₂(ℝ) must be detected; an argument using only regular discrete series is insufficient.

### 1.9 Adelic LF and finite-place compatibility

Compare the supplied adelic Schwartz topology of AutomorphicFormsOnReductiveGroups §0.3 with the real multiplier construction. At fixed compact finite support C and compact open J, identify its stage with finitely many copies of S(G∞), indexed by the J-double cosets contained in C. Bi-J-invariance forces a function to vanish on every double coset not contained in C. Extend the real multiplier on this finite direct sum and then through the countable support/level LF system; prove compatibility with convolution and finite-place spherical action. For finite S the local product uses completed archimedean projective tensors and finite-place compactly supported locally constant functions. Extension away from S uses the normalized hyperspecial units of volume one, and different extensions agree under their canonical comparison maps. The carrier and its LF topology are supplied; the target here is the comparison and multiplier action. (BPLZZ §3.1, Definition 3.1, pp.21–22; §4.2, pp.33–35; BPCZ §2.5.2, p.209; bplzz line 1063; bpcz line 1151).

The defining construction has the following API.

- Each fixed support/level stage comparison intertwines the real multiplier.

- Convolution by a spherical Hecke element h at a finite place outside S maps the stage of support C and level J to the stage of support C·supp(h) and the same level, and commutes with the real action; the stage itself changes with supp(h) (AutomorphicFormsOnReductiveGroups §0.3, convolution of support stages).

- Cofinal support/level choices give the same LF comparison.

*Needs:* AutomorphicFormsOnReductiveGroups §§0.1–0.5; §1.1; §1.7; AutomorphicSpectralTheory §§0.11–0.15; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.2; satake-exponential-family; NoncommutativeGeometry N1.

**Checks.**

- At a finite place this space is C_c∞(G(F_v)); a function with noncompact support in a Harish-Chandra Schwartz algebra of G(F_v) is outside it.

- A completed archimedean tensor product cannot be silently replaced by finite sums of pure tensors.

- A compact support C that is the disjoint union JxJ ⊔ JyJ gives two real Schwartz copies, determined independently by f(·,x) and f(·,y).

- For C={1} and J≠{1}, the stage is zero, although J meets C: any nonzero value at 1 would force the same value outside C.

- For C=∅ the stage is zero; the finite direct sum has no summands.

- A finite-place test supported on one double coset is compactly supported; an infinite-support rapidly decreasing p-adic function is outside this test algebra.

- A nonseparable smooth Schwartz function on ℝ² lies in the completed tensor product; finite sums of pure tensors are only dense.

### Examples

For a split one-dimensional torus the transform is Fourier–Laplace and exp(z) is an admissible moderate symbol. The unit symbol acts as the identity. For compact SU(2), actual Harish-Chandra parameters are nonzero shifted dominant weights; the lattice point 0 is not an admissible character, so lattice containment cannot be replaced by equality. A sharp compact-torus symbol retaining only the integer 0 detects just the trivial compact type, while split induction still permits a continuum of parameters.

### Dependencies

Layer 0; AutomorphicFormsOnReductiveGroups §§0.3, 2.1–2.4, 2.7; AutomorphicSpectralTheory §§0.11–0.15 and 6.2; NoncommutativeGeometry N1; Mathlib `WithSeminorms.banach_steinhaus`; the Plancherel, tempered-strip, Kostant, tensor-semisimplicity and minimal-type contracts.

## Layer 2: Weighted spaces on automorphic quotients

### 2.1 Weights on automorphic quotients

For a standard parabolic P put [G]_P=M_P(F)N_P(𝔸)\G(𝔸), with the AdelicAlgebraicGroups quotient measure. A weight is a positive measurable `w:[G]_P→ℝ_{>0}` such that for every compact U⊂G(𝔸) there is C_U≥1 with `C_U^{-1}w(x)≤w(xu)≤C_Uw(x)` for all x and u∈U. Write w≍w′ for two-sided global constant comparison. Every weight satisfies w(xg)≤Cw(x)‖g‖^N for some C,N and all x,g. Import the proper quotient height `n_P(x)=inf_{p∈M_P(F)N_P(𝔸)}‖px‖≥1` and put σ_P=1+log n_P. (BPCZ §2.4.2–2.4.3, Lemma 2.4.3.1, pp.203–205; bpcz line 923).

The defining construction has the following API.

- For every compact U the comparison constant is uniform in both x and u∈U.

- Products, inverses and real powers of weights are weights; equivalence is preserved.

- Equivalent weights give the same L² carrier with equivalent Hilbert norms and the same smooth-vector topology.

A proof route is as follows. Follow Lemma 2.4.3.1: apply compact generation only to the connected positive real split torus A₀∞, obtaining exponential control in its logarithmic coordinates. Reduce general translations by Iwasawa decomposition, compact representatives for the unipotent quotient and the Siegel covering, then compare these coordinates with the adelic height. No compact generation of G(𝔸) is assumed. Use the quotient-height comparison requested from AdelicAlgebraicGroups §3.5 in quotient-height-comparison; no new group-height carrier is defined here.

*Needs:* AdelicAlgebraicGroups §§3.1, 3.4–3.6; quotient-height-comparison.

**Checks.**

- The constant 1 is a weight, with C_U=1.

- n_P^a and σ_P^b are weights for every real a,b.

- On `ℝ_{>0}` under multiplication, w(t)=exp(t) fails compact-translate comparability already at the translation t↦2t.

- Measurability is required; differentiability of the weight is not.

### 2.2 Franke weights and chamber order

Write λ≺_Pη when η−λ is a nonnegative real linear combination of the simple roots in M_P, and call λ P-dominant when its pairing with each corresponding simple coroot is nonnegative. For each λ∈a*₀ construct a weight `d_{P,λ}` on [G]_P, determined up to ≍, that is comparable with exp⟨λ,H₀(x)⟩ on every standard P-Siegel domain. It obeys `d_{P,tλ}≍d_{P,λ}^t`, `d_{P,λ+η}≍d_{P,λ}d_{P,η}`, and `d_{P,λ}≪d_{P,η}` if λ≺_Pη in the chamber order. For a height from a faithful closed embedding ι, let Λ^P_ι be the finite set of maximal A₀-weights, for ≺_P, of the symmetrized representation g↦diag(ι(g),transpose(ι(g)⁻¹)); then `n_P≍max_{λ∈Λ^P_ι}d_{P,λ}`. If λ is P-dominant, `d_{P,λ}(x)≍sup_{γ∈P(F)}exp⟨λ,H₀(γx)⟩`. For Q⊂P and P-dominant λ one has `d_{Q,λ}≪d_{P,λ}` on their common intermediate quotient. (BPCZ §2.2.9, p.199, and §2.4.3, (2.4.3.13), Lemma 2.4.3.2 and Corollary 2.4.3.3, pp.204–206; bpcz line 741, line 963 and line 974).

The defining construction has the following API.

- The class of `d_{P,λ+η}` is the product of the two classes.

- For P-dominant λ the supremum over P(F) gives an equivalent weight.

- For Q⊂P and P-dominant λ the pullbacks obey `d_{Q,λ}≪d_{P,λ}`.

A proof route is as follows. Glue the exponential weights across finitely overlapping Siegel charts using quotient-height-comparison and the finite-overlap control in cusp-fiber-bounds; take positive comparison-class representatives. The dominance inequalities follow on each chamber and hence globally; derive the supremum formula and the nested-parabolic comparison from the same cover.

*Needs:* §2.1; AdelicAlgebraicGroups §§3.1, 3.4–3.6; quotient-height-comparison; cusp-fiber-bounds.

**Checks.**

- `d_{P,0}≍1`.

- `d_{P,−λ}≍d_{P,λ}^{−1}`.

- For G=G_m and P=G, a rational character λ gives the corresponding power of the idele norm, with no root-cone correction.

- Statements are invariant under changing representatives within ≍; equality of chosen functions is not promised.

- For G_m with ι(t)=t the symmetrized weights are {1,−1}, and their maximum at |t|=2 or 1/2 is 2, agreeing with max(|t|,|t|⁻¹). For GL₂ in the positive chamber |t₁|≥|t₂|, the maximal weights for P=G are ε₁ and −ε₂; at diag(4,2) the maximum is max(4,1/2)=4, agreeing with the symmetrized embedding height.

### 2.3 Parabolic depth functions

For proper standard P⊊Q define `d_P^Q=min_{α∈Σ_P^Q}d_{P,α}` and `d_Q^P=min_{α∈Σ_P^Q}d_{Q,α}`, where Σ_P^Q is the finite nonempty root set in n_P/n_Q. On P(F)N_Q(𝔸)\G(𝔸), d_P^Q≪d_Q^P. Write ω_P^Q(C)={d_P^Q>C}. For P⊂Q write `δ_P^Q(x)=exp⟨2ρ_P^Q,H_P(x)⟩` on [G]_P, where 2ρ_P^Q is the sum, with multiplicities, of the roots of A_P on Lie(M_Q∩N_P); on P(𝔸)∩M_Q(𝔸) it is the modulus character of that parabolic of M_Q, δ_P^G=δ_P and δ_P^P=1. It is a weight and is distinct from the depth d_P^Q, which is defined only for P⊊Q (BPCZ §2.2.8, p.199; bpcz line 697). These are neighborhoods of infinity in the relevant parabolic directions. Their finite-fiber and deep-cusp comparison properties are imported from AdelicAlgebraicGroups §§3.4–3.6. If H⊂G is reductive and P∩H⊊Q∩H are parabolics with the intersected unipotent radicals, restriction satisfies `d_P^Q(h)≪d_{P∩H}^{Q∩H}(h)`; for restriction of scalars along a finite field extension with diagonal H this is an equivalence. Treat P=Q by the identity case of subsequent theorems, not by an empty minimum. (BPCZ §2.4.4, (2.4.4.19), Lemmas 2.4.4.1–2.4.4.2, pp.206–208; bpcz line 1000).

The defining construction has the following API.

- For P⊊Q, the finite minimum is positive and is a weight.

- The pullback of d_P^Q is bounded by a constant times the pullback of d_Q^P.

- For P∩H⊊Q∩H the specified compatible reductive subgroup map satisfies the depth inequality, with equivalence in the diagonal restriction-of-scalars case. When the intersections coincide, no finite root minimum is defined.

A proof route is as follows. Compare the finite root minima with the simple-root minimum on Siegel charts. Use the AdelicAlgebraicGroups §3.6 contracts cusp-fiber-bounds and deep-cusp-uniqueness for intermediate quotient maps. Restrict root characters under H to prove the subgroup inequality.

*Needs:* §2.2; AdelicAlgebraicGroups §§3.1, 3.4–3.6; cusp-fiber-bounds; deep-cusp-uniqueness.

**Checks.**

- For the upper Borel B⊂GL₂, the minimum has one root: on diag(a,1) in the positive chamber it is comparable to |a|.

- There is no d_P^P from the finite-minimum construction; CT_P^P and the approximation theorem use their identity case.

- For the GL₂ upper Borel B and diag(a,1) with |a|=4, δ_B^G=4 (the Conventions' witness) and δ_B^B=1. The depth d_B^G is also comparable with |a| there, so GL₂ alone does not separate depth from modulus. For the upper Borel B⊂GL₃ and diag(t²,t,1) with t≥1 in the positive chamber, the three positive roots take the values t, t and t², so d_B^G≍t is their minimum while δ_B^G=t⁴ is their product; at t=2 these are 2 and 16, and the ratio t³ is unbounded, so reading the depth in place of the modulus character changes the weight class. At P=Q the modulus is 1 and no depth exists at all.

- For `Res_{K/F}GL₂` and diagonal GL₂, the compatible relative-root depth agrees up to constants. At degree 2 and a positive scalar idele of norm 2, the norm character has value 4, while its relative-root coordinate uses exponent 1/2 and has value 2, agreeing with the diagonal root depth; confusing these two characters would give 4 instead of 2.

- No universal arbitrary-subgroup inequality is asserted without compatibility of the parabolics and radicals.

### 2.4 The quotient Harish-Chandra volume function

Choose a compact identity neighborhood U⊂G(𝔸) and define `Ξ_P(x)=vol_{[G]_P}(xU)^{−1/2}`. Different U give equivalent positive weights. One has `Ξ_P≍d_{P,ρ₀}`, Ξ_P≪n_P^N for some N, and `∫_[G]_P Ξ_P(x)²σ_P(x)^{−d₀}dx<∞` for some d₀≥0. This is the quotient volume function; it is different from the local spherical Harish-Chandra Ξ of a real or p-adic group. (BPCZ §2.4.5, (2.4.5.23)–(2.4.5.25), p.208; bpcz line 1117; Lapid §2, (9), lapid line 416 and line 253).

The defining construction has the following API.

- Changing U changes Ξ_P by uniform positive factors.

- `Ξ_P≍d_{P,ρ₀}` with the chosen quotient measure.

- A sufficiently negative logarithmic power makes Ξ_P² integrable.

A proof route is as follows. Compare orbit-neighborhood volumes on Siegel charts and use finite multiplicity of the cover. Integrate the remaining chamber polynomial against a sufficiently negative power of 1+log n_P.

*Needs:* §2.2; AdelicAlgebraicGroups §§3.1, 3.4–3.6; quotient-neighborhood-volumes; cusp-fiber-bounds.

**Checks.**

- On a compact quotient, Ξ_P is bounded above and below by positive constants.

- Scaling the quotient measure by c>0 scales Ξ_P by `c^{−1/2}`.

- On the modular cusp, Ξ_G grows like `y^{1/2}`; replacing it by the constant 1 loses the cusp volume factor.

- The exponent d₀ is existential and need not be sharp.

### 2.5 Smooth LF representations

Define an adelic SLF representation to be a smooth finite-adelic representation V=⋃_J Vᴶ whose fixed-level spaces are SF Fréchet representations of G∞, with compatible actions, closed level inclusions and the indicated locally convex inductive-limit topology. Prove that for a fixed compact open K_f⊂G(𝔸_f), V is the locally convex direct sum of its K_f-isotypic subspaces V_ρ, each a closed Fréchet subspace of some V^J, and that a closed invariant subspace W carries the induced decomposition, so that its own LF topology is the one induced from V (BPCZ Lemma 2.5.4.1 and its proof, with (2.5.4.3), pp.210–211; bpcz line 1222 and line 1229). Compare the fixed-level stages with the SF smooth topology of AutomorphicFormsOnReductiveGroups §2.7. Apply the closed-subspace and open mapping results of SpectralManifolds SM3 at the Fréchet stages to obtain the SLF closed invariant subspace and quotient-to-closed-image results. The imported integrated Schwartz action agrees with compact integration; for a continuous moderate-growth Fréchet representation before taking smooth vectors, its smooth vectors equal S(G(𝔸))·V. Closed image alone does not imply injectivity. (BPCZ §§2.5.3–2.5.4, (2.5.3.2), Lemma 2.5.4.1, pp.209–211; bpcz line 1170).

The defining construction has the following API.

- The inclusion of V^J is a closed topological embedding with its specified SF topology.

- A closed invariant subspace inherits the SLF structure and its induced topology.

- Schwartz integration agrees with the compact action and respects all level transitions.

- For fixed K_f, V is the topological direct sum of its K_f-isotypic Fréchet subspaces, and a closed invariant subspace inherits that decomposition.

*Needs:* §1.2a (joint continuity); §1.9; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; AutomorphicSpectralTheory §0.11; SpectralManifolds SM3.

**Checks.**

- With trivial finite-adelic factor, SLF reduces to the given SF Fréchet representation.

- For the trivial one-dimensional representation, every fixed-level space is ℂ and every transition is the identity; the SLF conditions hold.

- The zero map from a nonzero SLF representation has closed image but is not an embedding; the quotient-to-image statement handles it correctly.

- For z↦2z on ℂ, the open unit disc maps onto the disc of radius 2 and the kernel is zero. For the zero map ℂ→ℂ, the kernel is ℂ and ℂ/ℂ and its image are both the zero space; identifying the original domain with that image would be false.

- Closed image implies an embedding only after adding injectivity, or after quotienting the kernel.

- For G=GL₁, a finite-order character ε of 𝔸_f^× and V=ℂ⊕ℂ_ε with trivial archimedean action, if ε is nontrivial on K_f the isotypic summands are the two lines, of types 1 and ε|K_f; if ε is trivial on K_f, both lines lie in the single trivial-type summand of dimension two. The decomposition is by K_f-types, not into irreducible G(𝔸)-summands.

### 2.6 Smooth vectors in weighted L²

For a weight w let L²_w([G]_P)=Lp(ℂ,2,w dx), using the almost-everywhere quotient. Right translation is a continuous moderate representation; its smooth vectors at level J consist exactly of the smooth right-J-invariant functions with R(X)φ∈L²_w for every X∈U(g∞), topologized by those derivative norms. Put `L²_{N,w}=L²_{n_P^Nw}` and `L²_{σ,d,w}=L²_{σ_P^dw}`. Pointwise representatives are the unique smooth representatives, not arbitrary representatives of Lp classes. Integration pairs L²_w with `L²_{w^{-1}}` sesquilinearly. (BPCZ §2.5.5, pp.211–212; bpcz line 1252).

The defining construction has the following API.

- Smooth vectors at J are exactly the right-J smooth functions with all derivative norms finite.

- w≤Cw′ gives continuous inclusion `L²_{w′}→L²_w` and its smooth-vector version.

- The integral pairing extends continuously between the reciprocal-weight Hilbert spaces.

A proof route is as follows. Use the polynomial translation estimate for w to bound the translation operators and differentiate the orbit map distributionally. Apply local elliptic/Sobolev regularity to recover a smooth representative from all weighted derivative norms.

*Needs:* §2.1; §2.5; Mathlib `MeasureTheory.Lp`; local-sobolev-evaluation; AutomorphicSpectralTheory §§5.1–5.9 (Franke-weight comparison at P=G).

**Checks.**

- w=1 gives the AA quotient L² and its usual smooth vectors.

- On ℝ with n(x)=1+|x|, `(1+|x|)^{−1}` belongs to unweighted L² but not `L²_{n²}`; the inclusion direction cannot be reversed.

- Changing a measurable representative on a null set does not change its Hilbert vector; point evaluation uses the smooth representative only.

- Increasing N strengthens integrability because n_P≥1.

- At P=G, with the same central quotient, measure and finite level as the parent, and an admissible Franke weight p, w=p² gives `‖R(X)φ‖²_{L²_w}=∫|p R(X)φ|²dx`, so (L²_w)^∞ is the parent’s S_p([G]) at every common finite level. For p=2 the norm is 2‖R(X)φ‖₂; using w=p would instead give √2‖R(X)φ‖₂. For p=1 the norms are exactly unweighted.

### 2.7 Weighted Sobolev evaluation and smoothing

At each finite level J and for every weight w there is a continuous seminorm q on `L²_w([G]_P)^{∞,J}` such that `|φ(x)|≤q(φ)Ξ_P(x)w(x)^{−1/2}` for all x. Every continuous functional T on smooth L²_w and every f∈S(G(𝔸)) is regularized to a smooth vector in `L²_{w^{-1}}`, characterized by T(R(f)ψ)=⟨ψ,φ⟩_P with the adjoint/inversion convention fixed by this equality. The map is continuous on fixed Schwartz stages. (BPCZ §2.5.5, (2.5.5.4)–(2.5.5.5), p.212; Bernstein §3.4, key lemma, pp.686–688; bpcz line 1270).

A proof route is as follows. Apply the local Sobolev inequality to xU and use compact-translate comparability of w; the inverse square-root volume is exactly Ξ_P. Bound T by finitely many weighted derivative norms, move derivatives onto f and use Riesz duality and Schwartz decay.

*Needs:* §1.1; §2.6; §2.4; §1.9; AdelicAlgebraicGroups §§3.1, 3.4–3.6; local-sobolev-evaluation.

**Checks.**

- The level and weight may change q; no uniform q over all weights is asserted.

### 2.8 Nuclear weighted inclusions

There exists d₀≥0 depending only on the quotient geometry such that for every compact open J, every weight w and every continuous seminorm q on `L²_w([G]_P)^{∞,J}`, there is a continuous seminorm p on `L²_{σ,d₀,w}([G]_P)^{∞,J}` for which the inclusion induces a nuclear map from the Hausdorff Banach p-completion to the Hausdorff Banach q-completion. In particular, q of the included vector is bounded by a constant times p of that vector. An unconditionally summable family in the source therefore becomes absolutely summable in every continuous target seminorm. This is nuclearity at each target seminorm, with the source seminorm allowed to depend on it. (BPCZ §2.5.5, Proposition 2.5.5.1, p.212, and its weighted Hilbert–Schmidt argument; Bernstein §3.4–3.5, pp.688–689; bpcz line 1282 and line 1284).

A proof route is as follows. For the specified target seminorm, use the `Ξ²σ^{-d}` integrability and sufficiently many extra derivatives to obtain a Hilbert–Schmidt inclusion between suitable Hilbert completions. Factor the resulting seminorm inclusion through two Hilbert–Schmidt inclusions, using OperatorTheory/OperatorIdeals for their composition; apply AutomorphicSpectralTheory §§0.11–0.15 nuclear-map and summable-family consequences at the Banach completions. The derivative order can increase with q, while d₀ is fixed. BPCZ calls the smooth inclusion nuclear; the precise completion statement here avoids interpreting that phrase as a single Banach factorization into the entire smooth target.

*Needs:* §2.7; §2.4; AutomorphicSpectralTheory §§0.11–0.15; OperatorTheory/OperatorIdeals OI-B32–OI-B41 and Part C; BanachSpaceTheory B4; hilbert-schmidt-nuclear-composition.

**Checks.**

- The existence of d₀ is uniform in w and J, while the particular seminorm factorizations may depend on them.

- On a mass-one compact circle with constant height and weight, let eₙ(x)=exp(2πinx) and D=(2π)⁻¹d/dx. Let pₘ(φ) be the maximum of ‖Dʲφ‖₂ for 0≤j≤m. The vector eₙ/nᵐ, n≥1, has pₘ=1 and pₘ₊₁=n; n=1,2 gives 1 and 2, and the sequence is unbounded. Thus the identity on C∞ cannot be controlled in all target seminorms by one fixed finite-order source seminorm. Its separate Banach completion maps are nuclear after a derivative gain: the inclusion from Hᵐ⁺² to Hᵐ has singular values (1+n²)⁻¹, whose sum over n∈ℤ converges.

- On that circle the zeroth-order Hilbert inclusion at constant weight is the identity on L², with singular values 1,1,1,… and infinite trace norm; smoothness and the derivative gain are essential.

### 2.9 Zeroth-order rapid spaces

S₀([G]_P) consists of measurable functions with sup_x n_P(x)^N|φ(x)|<∞ for every N≥0; use actual functions for these suprema. S₀⁰ is its subspace of continuous functions with the same Fréchet seminorms. The continuous subspace is an F-representation. The full measurable S₀ is an auxiliary locally convex space; its translation action is not asserted strongly continuous. Compact smooth functions embed into both. (BPCZ §2.5.6, p.212; bpcz line 1289).

The defining construction has the following API.

- Membership is boundedness in every zeroth-order height seminorm.

- S₀⁰ is the closed continuous-function subspace with the induced Fréchet topology.

- Smooth vectors with derivative seminorms agree with the quotient Schwartz space of the next target.

A proof route is as follows. Construct the weighted uniform seminorm topology and show completeness; use uniform continuity on compact sets and tail decay for continuity of translation on S₀⁰.

*Needs:* §2.1.

**Checks.**

- The indicator of a compact measurable set belongs to S₀, even if it is discontinuous and hence not in S₀⁰.

- On a compact quotient these are bounded measurable and continuous functions respectively; the derivative requirements have not yet been imposed.

- On a noncompact cusp, a function comparable to `n_P^{−2}` along an unbounded sequence is not in S₀.

- The smooth vectors of S₀⁰ supply the next node, while measurable S₀ supplies the constant-term majorant.

### 2.10 Schwartz functions on automorphic quotients

S([G]_P) is the smooth adelic space of functions with `q_{N,X}(φ)=sup_x n_P(x)^N|R(X)φ(x)|<∞` for every N≥0 and X∈U(g∞). At fixed J it is nuclear Fréchet; over J it is strict LF. It identifies topologically with (S₀⁰)^∞ and with `⋂_{N>0}L²_{n_P^N}^{∞}`, using the projective smooth topology. It is dense in every smooth L²_w space. This quotient space is distinct from the test-function convolution algebra S(G(𝔸)); the latter acts on it by right convolution. (BPCZ §2.5.7, pp.212–213; §2.5.12, p.215; bpcz line 1298).

The defining construction has the following API.

- The topological intersection of smooth weighted L² spaces is S([G]_P).

- The test-function algebra acts continuously and preserves S at controlled levels.

- S is dense in every smooth weighted L² space.

A proof route is as follows. Use the quotient Ξ polynomial bound and integrability to compare supremum and all weighted L² derivative seminorms. Use smooth cutoffs and regularization for density; import strict-LF smooth-vector results from AutomorphicSpectralTheory §§0.11–0.15.

*Needs:* §2.9; §2.7; §2.8.

**Checks.**

- On a compact quotient S is the usual smooth adelic space, with its level LF topology.

- Every compactly supported smooth function belongs to S.

- On the modular cusp a nonzero function with polynomial tail `y^{−a}` fails S, even if a is large enough for L².

- The quantifiers are all derivatives and all decay exponents, rather than one exponent chosen after each derivative.

### 2.11 Harish-Chandra Schwartz functions on quotients

C([G]_P) consists of smooth functions with `sup_x Ξ_P(x)^{-1}σ_P(x)^d|R(X)φ(x)|<∞` for every d≥0 and X. At each J it is nuclear Fréchet and equals `⋂_{d>0}L²_{σ_P^d}^{∞,J}` topologically; its level union is strict LF. The inclusion S([G]_P)→C([G]_P) is continuous with dense image. This is the global quotient Harish-Chandra space, with logarithmic decay relative to Ξ_P. (BPCZ §2.5.8, p.213; §2.5.12, p.215; Lapid §2; bpcz line 1314).

The defining construction has the following API.

- C is the projective intersection of smooth logarithmically weighted L² spaces.

- Each fixed-level space is nuclear Fréchet and the inclusions are closed.

- The S→C map is continuous and dense, with the precise height-to-logarithm loss.

A proof route is as follows. Apply the Sobolev inequality and `Ξ²σ^{-d₀}` integrability in both directions to compare the weighted derivative topologies. Use cutoffs with derivatives controlled in logarithmic radial coordinates for density and completeness.

*Needs:* §2.4; §2.8; §2.10.

**Checks.**

- On a compact quotient C=S=C∞ at each level.

- A tail `Ξ_Pσ_P^{−a}` for a fixed a fails C whenever σ_P is unbounded.

- A smooth cutoff times `Ξ_P exp(−σ_P^{1/2})` in a modular cusp lies in C but has no arbitrary algebraic-height decay; use a smooth equivalent Ξ representative for this test.

- The Ξ factor is in the denominator of the defining seminorm.

### 2.12 Polynomially weighted measures

T₀,w([G]_P) is the Banach space of complex Radon measures μ with `∫w^{-1}d|μ|<∞`. `T₀=⋃_{N≥0}T₀,n_P^N` has its locally convex inductive-limit topology, which need not be strict; it identifies with the continuous sesquilinear dual of S₀⁰ using the conjugation convention of the integral pairing. Measures are not assumed absolutely continuous. Translation is bounded locally uniformly in the group variable, but is not in general strongly continuous in weighted total variation. Define convolution on measures by integration against test functions, and take norm-smooth orbit vectors only where that regularity holds. Its uniform-growth estimates are proved in §2.13 and its relative-decay estimate in §2.14. (BPCZ §2.5.9, pp.213–214; bpcz line 1327).

The defining construction has the following API.

- δ_y lies in every T₀,w and has norm `w(y)^{-1}`.

- The continuous dual of S₀⁰ is T₀ with the indicated pairing and nonstrict inductive-limit structure.

- For a test Schwartz function f, R(f)μ is the distribution φ↦⟨μ,R(f*)φ⟩ on compact smooth functions, and for compactly supported f its support lies in supp μ·(supp f)⁻¹.

A proof route is as follows. Use weighted total variation for the Banach stages and the Riesz representation theorem on the weighted continuous rapid space. Move the Schwartz kernel against the measure, compare translation of weights, and choose one polynomial height loss controlling all w-decay exponents.

*Needs:* §2.9; §2.1; §1.9; AutomorphicSpectralTheory §0.12 (quasi-complete-target integration).

**Checks.**

- For μ=cδ_y the weighted total-variation norm equals |c|/w(y).

- A Dirac measure on a positive-dimensional quotient is allowed, despite having no L² density. At weight 1 distinct point masses have total-variation distance 2, so a moving Dirac orbit is not norm-continuous.

- On a compact quotient T₀ is precisely the finite complex Radon measures, not all distributions of positive order.

- The reciprocal weight in the norm is essential for duality.

### 2.13 Weighted uniform derivative growth

For a weight w, T_w([G]_P) consists of smooth functions with `sup_x w(x)^{-1}|R(X)φ(x)|<∞` for every X, at fixed J with its Fréchet topology and then its strict level LF topology. In exponent notation write `T_N = T_{n_P^N}`. Define `T([G]_P)=⋃_N T_{n_P^N}` here, agreeing for P=G with the smooth uniform-growth space of AutomorphicFormsOnReductiveGroups §0.4: a single exponent N controls all derivatives, with constants depending on X. Give the comparison `T=⋃_N(L²_{n_P^{-N}})^∞=⋃_N(T₀,n_P^N)^∞` with its specified nonstrict union topology. These unions do not assert equality at the same N in every comparison. (BPCZ §2.5.10, p.214; §2.5.11, p.215; bpcz line 1347).

The defining construction has the following API.

- R(X) acts continuously on T_w with the derivative seminorms.

- w≪w′ gives continuous inclusion T_w→T_w′.

- The intermediate-quotient uniform-growth space has the stated weighted smooth-L² and smoothed-measure descriptions, with an allowed common height loss.

A proof route is as follows. Compare weighted suprema and weighted derivative L² norms, allowing the fixed polynomial loss from Ξ and volume. For the measure comparison differentiate the weakly regularized kernels and identify norm-smooth vectors with smooth densities having the required weighted L¹ derivatives, with one common height loss. Do not apply an F-representation theorem to the full total-variation measure space. Apply Dixmier–Malliavin on the genuine smooth function stages; at P=G identify this construction and its topology with AutomorphicFormsOnReductiveGroups §0.4.

*Needs:* AutomorphicFormsOnReductiveGroups §§0.1–0.5; §2.12; §2.6; §2.7.

**Checks.**

- For the constant weight w=1, T_w consists of smooth functions with every derivative bounded; constants belong to it. This weight stage is T_0 in the exponent notation T_N.

- On the modular cusp y→∞, with height comparable to y, exp(i y²) has derivatives of degree 2k under the invariant derivative (y d/dy)^k and fails T; choosing a new exponent for every derivative would wrongly admit it.

- On a noncompact quotient the constant 1 cannot be approximated in the unweighted supremum seminorm of T_0 by compactly supported smooth functions.

- On a modular cusp with n_G comparable to y, a smooth function equal to y high in the cusp lies in the exponent stage T_1, since every (y d/dy)^k y=y, but not in the constant-weight stage T_0. At y=2,4 its unweighted values are 2,4, while division by y gives 1,1. This distinguishes the weight subscript from the exponent subscript.

- S is dense in T as a union; it need not be dense in a fixed T_w.

- The measure-side smooth-vector comparison must survive the failure of strong continuity on all Radon measures.

### 2.14 Schwartz decay relative to a weight

For a weight w and N≥0 let `S_{w,N}` be the smooth functions satisfying `sup_x n_P(x)^{−N}w(x)^r|R(X)φ(x)|<∞` for every r≥0 and X. Define `S_w=⋃_N S_{w,N}` with its nonstrict locally convex union topology. The order of quantifiers is ∃N∀r∀X. Equivalently `S_w=⋃_N⋂_{r≥0}(L²_{n_P^{-N}w^r})^∞`, allowing an adjustment of N between the two descriptions. At each fixed N,J the displayed seminorms give the Fréchet topology. (BPCZ §2.5.11 and Lemma 2.5.11.1, pp.214–215; bpcz line 1370).

The defining construction has the following API.

- The weighted smooth-L² description holds with one height loss independent of r.

- A bounded comparison w≪w′ gives S_w′⊂S_w with the corresponding seminorm estimates.

- For μ∈T₀ with w bounded above on supp μ, R(f)μ∈S_w for every test Schwartz f (BPCZ Lemma 2.5.11.1, p.215; bpcz line 1395).

A proof route is as follows. Compare suprema and L² norms using Ξ and its polynomial-height bound; the shift in N is independent of r. Check directed level/height inclusions. For the measure statement, first take f compactly supported: R(f)μ lies in T by §2.13 and is supported in supp μ·(supp f)⁻¹, where w is bounded above because a weight is comparable under compact translation (§2.1), so every power w^r is absorbed and R(f)μ∈S_w. Then prove that S_w is stable under right convolution by S(G(𝔸)) and apply Dixmier–Malliavin, S(G(𝔸))=S(G(𝔸))*C_c∞(G(𝔸)).

*Needs:* §2.13; §2.12; §2.6; §2.1; AutomorphicFormsOnReductiveGroups §0.3 (convolution of support stages), §2.7 (Dixmier–Malliavin).

**Checks.**

- For w=1, S_w is the AF uniform moderate-growth space T.

- For w=n_P, the underlying function space S_w is S([G]_P), since all positive height powers must decay.

- If w=n_P and n_P is unbounded, 1 is not in S_w, although it is in the constant-weight stage T_0.

- A family needing N to grow with r is not in S_w.

### 2.15 Nuclearity and product decompositions

For each finite level J the spaces S([G]_P)^J and C([G]_P)^J are nuclear Fréchet. For two quotient data and product finite level J₁×J₂, multiplication of pure tensors induces topological isomorphisms `S(X₁)^J₁⊗̂πS(X₂)^J₂≅S(X₁×X₂)^{J₁×J₂}`, and the analogous C isomorphism. Use compatible product heights and product quotient-volume functions. Continuous sesquilinear or bilinear forms extend by the corresponding completed projective universal property. Passing to all levels must be checked through the strict stage system. (BPCZ §2.5.12, (2.5.12.10)–(2.5.12.11), p.215; bpcz line 1402). Prove also that for complete nuclear Fréchet spaces E and F, an open subset U of a finite-dimensional complex vector space and holomorphic maps e:U→E and f:U→F, the map λ↦e(λ)⊗f(λ) is holomorphic from U to E⊗̂πF (BPCZ Appendix A.0.3, criterion (A.0.3.1), and A.0.7, pp.328 and 330; bpcz line 6514 and line 6617).

A proof route is as follows. Apply the nuclear smooth inclusions to the projective-limit seminorm systems. Prove density of product smooth functions and identify all product derivative seminorms; use the existing AutomorphicSpectralTheory §§0.11–0.15 completed tensor theory. For tensor holomorphy, the canonical bilinear map is continuous, so the family is continuous; its pairings with the elementary functionals ℓ⊗m are the holomorphic products ℓ(e(λ))m(f(λ)), and these functionals form a total set because nuclearity identifies the projective and injective completions; then apply (A.0.3.1).

*Needs:* §1.1 (Nash Schwartz products); §2.10; §2.11; §2.8; AutomorphicSpectralTheory §§0.11–0.15; NoncommutativeGeometry N1.

**Checks.**

- The result is a completed topological tensor product, including for more than one real place.

- For E=F=ℂ, e(λ)=λ and f(λ)=λ², the tensor family is λ³. Replacing f by λ↦conj(λ) gives |λ|², which is continuous but not holomorphic, so holomorphy of both factors is required.

- In S(ℝ)⊗̂πS(ℝ)=S(ℝ²), e(λ)=f(λ)=exp(−πx²+λx) give the family exp(−π(x²+y²)+λ(x+y)), holomorphic in λ with values in S(ℝ²); at λ=0 its value at the origin is 1.

### 2.15a Cuspidal data on the full quotient and at a fixed central character

Transport AutomorphicSpectralTheory §§1.6–1.10 from G(𝔸)¹ to the two quotients used here, with the quotient measures of AdelicAlgebraicGroups §§2.1–2.3. Write G(𝔸)=A_G∞×G(𝔸)¹, so that [G]=A_G∞×[G]¹ as measure spaces. For the full quotient, the cuspidal data X(G), Weyl classes of pairs (M_P,π) with π a cuspidal automorphic representation of M_P(𝔸) whose central character is trivial on A_P∞, are exactly the data χ of AutomorphicSpectralTheory §1.9. Prove that L²_χ([G]):=L²(A_G∞)⊗̂L²_χ([G]¹) is the closed G(𝔸)-invariant span of the pseudo-Eisenstein series with Paley–Wiener sections on all of (a_P)_ℂ*, and that L²([G]) is the orthogonal Hilbert sum of these blocks (BPCZ §§2.9.1–2.9.2, (2.9.2.1), pp.229–230; bpcz line 2063).

For the maximal F-split central torus Z and a unitary automorphic character ω of Z(𝔸), let C(M,ω) be the set of cuspidal automorphic representations of M(𝔸) whose central character restricts to ω on Z(𝔸), with σ∼σ′ when σ′≅σ⊗ξ_s for some s∈i(a_M^G)*. Let D(G,ω) be the set of pairs (M,σ) with M a standard Levi and σ∈C(M,ω), with (M,σ)≈(M′,σ′) when a Weyl element carries M to M′ and σ to a representation ∼σ′. Define L²_(M,σ)([G],ω) as the closed span of the pseudo-Eisenstein series of Paley–Wiener sections on (a_M^G)_ℂ* valued in the σ-isotypic induced space. Prove that restriction to G(𝔸)¹ identifies L²([G],ω) unitarily with the subspace of L²([G]¹) on which Z(𝔸)∩G(𝔸)¹ acts by ω, and carries L²_(M,σ)([G],ω) onto the AutomorphicSpectralTheory §1.9 block of the datum represented by `(P_M,σ|_{M(𝔸)¹})`. Hence L²([G],ω) is the orthogonal Hilbert sum of the L²_(M,σ)([G],ω) over D(G,ω)/≈, and L²_(M,σ)=L²_(M′,σ′) exactly when (M,σ)≈(M′,σ′) (BPLZZ §3.2, Definition 3.9 and (3.1), pp.23–24; bplzz line 1158 and line 1170).

The defining construction has the following API.

- On [G] each block is L²(A_G∞) completed-tensor the corresponding block of L²([G]¹), and the blocks are orthogonal with dense sum.

- Restriction to G(𝔸)¹ is unitary from L²([G],ω) onto the ω-isotypic part of L²([G]¹) for the compatible quotient measures, and it commutes with right translation by G(𝔸)¹.

- The classes in D(G,ω)/≈ correspond bijectively to the AutomorphicSpectralTheory §1.9 data whose central character on Z(𝔸)∩G(𝔸)¹ is the restriction of ω, and the blocks correspond under restriction.

A proof route is as follows. Use the product decomposition of Haar measure and Fubini on [G]=A_G∞×[G]¹. For ω, decompose L²([G]¹) under the compact abelian group Z(F)∖(Z(𝔸)∩G(𝔸)¹) by its characters; each AutomorphicSpectralTheory block is stable under this central action and isotypic for it, since the central character of an irreducible cuspidal σ is a single character. Restrict the BPLZZ pseudo-Eisenstein series to G(𝔸)¹ and compare them with those of AutomorphicSpectralTheory §1.6. A twist by s∈i(a_M^G)* is trivial on M(𝔸)¹, and the fixed ω excludes the remaining twists in i(a_G)*.

*Needs:* AutomorphicSpectralTheory §§1.6–1.10; AdelicAlgebraicGroups §§2.1–2.3 (split centre and quotient measures); AdelicAlgebraicGroups §§4.6–4.7 (compact abelian quotients and their characters).

**Checks.**

- For G=G_m over ℚ, `A_G∞=ℝ_{>0}` and [G]¹=ℚ^×∖𝔸¹ is compact, so L²([G]) is `L²(ℝ_{>0})` completed-tensor the Hilbert sum of the lines spanned by the characters of ℚ^×∖𝔸¹, one block for each character. With Z=G and a fixed ω, L²([G],ω) is the single line of ω, and (a_G^G)*=0 leaves no twist.

- For G=GL₂ over ℚ and M=G, the representations σ and `σ⊗|det|^{it}`, t real and nonzero, restrict to the same representation of GL₂(𝔸)¹ and give one AutomorphicSpectralTheory datum. With Z the scalars their central characters differ by `|z|^{2it}`, which at the archimedean scalar z=e equals exp(2it), so −1 at t=π/2; at most one of them lies in C(G,ω). The fixed-ω classes retain the A_G∞-character that the G(𝔸)¹ data forget.

- For the GL₂ Borel and unitary Hecke characters χ₁≠χ₂, the pairs χ₁⊠χ₂ and χ₂⊠χ₁ are Weyl conjugate and give one block in both conventions; distinct non-conjugate pairs give orthogonal blocks.

### 2.16 Constant terms and pseudo-Eisenstein extensions

For P⊂Q extend the AutomorphicFormsOnReductiveGroups §§4.1–4.2 constant term CT_P^Q and construct the intermediate pseudo-Eisenstein map EP_P^Q by summation over P(F)∖Q(F). At Q=G compare it on the common domain with the Paley–Wiener pseudo-Eisenstein series of AutomorphicSpectralTheory §1.6. With compatible normalized quotient measures prove continuity on the following spaces: EP:S₀([G]_P)→S₀([G]_Q), CT:T₀([G]_Q)→T₀([G]_P), EP:S([G]_P)→S([G]_Q), and CT:T_N([G]_Q)→T_N([G]_P). They are adjoint under the integral pairing. There is c>0 such that for every N≥0, `φ↦sup_x δ_P^Q(x)^{cN}n_P(x)^N|CT_P^Qφ(x)|` is a continuous seminorm on S₀([G]_Q). This weighted estimate does not assert unweighted rapid decay of CTφ along all split-central directions. (BPCZ §2.5.13 and Lemma 2.5.13.1, pp.215–216; bpcz line 1415).

A proof route is as follows. Use compactness of the adelic unipotent quotient for CT and finite-overlap estimates for EP; derive the weighted estimate on Siegel domains. Extend by the measure pairing and integrate by parts for derivatives, agreeing with the supplied operators on compact vectors.

*Needs:* §2.10; §2.12; §2.13; AutomorphicFormsOnReductiveGroups §§4.1–4.2; AutomorphicSpectralTheory §§1.5–1.10; §2.15a (cuspidal data on [G] and at fixed ω).

**Checks.**

- For P=Q both operators are the identity; δ_P^P=1.

- For compactly supported φ on [G]_P, the inverse image of supp φ under the proper unipotent-quotient map is compact; its intersection with each discrete P(F)∖Q(F) fiber is finite, so only finitely many summands contribute at a fixed x. For P=Q there is one term φ(x); φ=0 gives zero terms. (BPCZ Lemma 2.4.4.1(5) and §2.5.13, bpcz line 1053 and line 1423.)

- For P=Q on a compact quotient of mass 1, φ=ψ=1 gives ⟨CTφ,ψ⟩=1=⟨φ,EPψ⟩. Scaling only the measure on the CT side by 2 gives 2 versus 1; scaling both compatible measures by 2 gives 2=2. Thus quotient-measure normalization is part of adjunction, even for identity maps.

### 2.17 Approximation by constant terms

For proper P⊊Q, every N>0,r≥0 and X∈U(g∞), there is a continuous seminorm q on T_N([G]_Q) at each fixed level such that `|R(X)(φ−CT_P^Qφ)(x)|≤n_P(x)^N d_P^Q(x)^{−r}q(φ)` for all x in the common intermediate quotient. If φ∈L²_w([G]_Q)^∞, there is N>0 such that for every r≥0 the integral over A_Q∞ of `|φ(ax)−CT_P^Qφ(ax)|² w(a)δ_Q(a)^{−1}da` is `≪_r n_P(x)^N d_P^Q(x)^{−r}`. In the integral bound the single N is chosen before all r; the notation w(a) uses the restricted A_Q weight in this assertion. (BPCZ §2.5.14, Proposition 2.5.14.1, pp.216–218; bpcz line 1460).

A proof route is as follows. Expand a zero-constant-term function on the compact adelic unipotent quotient and integrate by parts repeatedly to gain arbitrary parabolic depth decay. Use weighted Sobolev control and reduction-theory fiber bounds, choosing the height exponent once before the repeated depth estimates.

*Needs:* §2.16; §2.3; §2.6.

**Checks.**

- At a cusp with zero constant term, arbitrary depth decay follows; the theorem does not compare unrelated parabolics.

### 2.18 Weighted constant-term decomposition

For P⊂Q and a weight w on [G]_Q there are weights w_P^−,w_P^+ on [G]_P, comparable with w in the deep P-cusp, for which `CT_P^Q:L²_w→L²_{w_P^−}` and `EP_P^Q:L²_{w_P^+}→L²_w` are continuous, including their smooth-vector maps. For weights w,w′ with comparable restrictions w|A_Q∞≍w′|A_Q∞, if w′≪w the map `φ↦((CT_P^Qφ)_{P⊊Q},φ)` is a closed embedding of smooth L²_w into the product of the proper-parabolic weighted smooth spaces and smooth L²_w′. Under the dual comparison w≪w′, the corresponding sum of EP maps and the identity inclusion is an open surjection onto smooth L²_w. State the choices of weights and comparison constants explicitly at each finite level. (BPCZ §2.5.15, Proposition 2.5.15.1 and Corollary 2.5.15.2, pp.218–221; bpcz line 1536).

A proof route is as follows. Construct upper and lower weights by separating the deep-cusp and complementary regions using the approximation estimate. Use a partition across parabolic cusp regions to control the graph norm, then apply Fréchet duality/open mapping to the adjoint sum.

*Needs:* §2.17; §2.1; §2.5; AutomorphicSpectralTheory §§0.11–0.15; SpectralManifolds SM3.

**Checks.**

- Include the identity component; the collection of constant terms alone loses cusp forms.

### Examples

On the GL₂ modular cusp let n_G≍y and Ξ_G≍y¹ᐟ². A tail y⁻ᵃ fails arbitrary algebraic-height decay, while a smooth tail y¹ᐟ²exp(−√(1+log y)) has rapid logarithmic decay after dividing by Ξ_G. For the constant weight and two distinct points x,y, the measures δ_x and δ_y have total-variation distance 2: weighted smoothing must use weak convolution before a norm-smooth subspace is available.

### Dependencies

Layer 1’s Schwartz-action comparison; AdelicAlgebraicGroups §§2.1–2.3, 3.1, 3.4–3.6, 4.6–4.7; PDE Lane A; OperatorTheory/OperatorIdeals; BanachSpaceTheory B4; AutomorphicSpectralTheory §§0.11–0.15, 1.6–1.10; SpectralManifolds SM3; NoncommutativeGeometry N1.

## Layer 3: Cuspidal support, wave packets and Schwartz kernels

### 3.1 Relative characters of Schwartz functions

Let π be a discrete automorphic representation of a Levi, `A_{P,π}(G)` its smooth induced space, B a continuous sesquilinear form on that space, and Ω a compact subset of `a_P^{G,*}`. For f∈S(G(𝔸)) and a K-orthonormal basis 𝔅, `Σ_{v∈𝔅}I_P(λ,f)v⊗overline(v)` converges absolutely in `A_{P,π}⊗̂π overline(A_{P,π})`, uniformly on Re λ∈Ω. The resulting tensor and J_B(λ,f)=Σ_v B(I_P(λ,f)v,v) are basis independent. For each fixed finite support/level stage there is a continuous seminorm p with |J_B(λ,f)|≤p(f) throughout that strip. The functional also extends to C_c^r at sufficiently large r, with derivative degree bounded by r. The basis is a union of finite-dimensional K-type orthonormal bases. (BPCZ §2.8.4, Proposition 2.8.4.1 and Remark 2.8.4.2, pp.227–229; bpcz line 1980).

A proof route is as follows. Use compact-picture induction and polynomial bounds for K-type dimensions and seminorms in terms of the compact Casimir, as requested in k-type-growth; use AutomorphicSpectralTheory Layer 4 for the discrete inducing representation. Move arbitrarily high powers of the compact Casimir to f and sum their inverse powers over K-types; all seminorm estimates are uniform in the imaginary parameter on the indicated real strip. Apply the completed tensor universal property to B; finite-dimensional invariance on each type proves basis independence.

*Needs:* §1.9; AutomorphicSpectralTheory §§0.11–0.15; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; AutomorphicSpectralTheory Layer 4; k-type-growth; §2.15 (tensor holomorphy); NoncommutativeGeometry N1.

**Checks.**

- The second tensor factor is the conjugate space, as required for a sesquilinear B.

- A compact real-part range still allows an unbounded imaginary parameter.

- With B the Petersson form, J_B(λ,f)=tr I_P(λ,f); f=0 gives 0. On a one-dimensional K-type with operator a·id, a unit vector gives a and replacing it by twice that vector gives 4a. A unitary change of orthonormal basis preserves the sum; an arbitrary basis does not.

### 3.2 Arthur’s finite differentiability factorization

Prove Arthur's finite differentiability factorization at a fixed normal compact open K₀⊂K_f: for each m≥1 there are Z∈U(𝔤∞), g₁∈C_c∞(G(𝔸)) and g₂∈C_cᵐ(G(𝔸)), invariant under K∞-conjugation, with g₁ and g₂ bi-K₀-invariant, such that f=f*g₁+(f*Z)*g₂ for every bi-K₀-invariant f∈S(G(𝔸)) ([Art78] Lemma 4.1 and Corollary 4.2, as cited in BPCZ Proposition 2.8.4.3, p.229; bpcz line 2043 and line 2059). The choice depends on K₀,m, not f; Z is not assumed central. For m sufficiently large prove the factorized relative-character identity J_B(λ,f)=Σ_v B(I_P(λ,f)v,I_P(−conj λ,g₁*)v)+Σ_v B(I_P(λ,f*Z)v,I_P(−conj λ,g₂*)v), with absolutely convergent sums. Both sums use the same orthonormal K-basis as §3.1. (BPCZ §2.8.4, Proposition 2.8.4.3, p.229; bpcz line 2043).

A proof route is as follows. Take a K∞-conjugation-invariant left-invariant elliptic operator Δ on G∞, such as 1 minus the sum of squares of an orthonormal basis of 𝔤∞ for a K∞-invariant inner product, and k with 2k>m+dim G∞. A parametrix of Δ^k near the identity, multiplied by a K∞-conjugation-invariant bump equal to 1 near the identity, gives δ=Δ^k g₂′+g₁′ as distributions, with g₂′ compactly supported of class Cᵐ and g₁′ smooth and compactly supported. Average over K∞-conjugation, tensor with the normalized idempotent of K₀ at the finite places, and convolve f on the right; then Z=Δ^k. The relative-character identity follows from a finite-dimensional computation on each K∞-type, since the operators I_P(λ,g_i) preserve the K∞-type subspaces.

*Needs:* §3.1; AutomorphicFormsOnReductiveGroups §§0.1–0.5 (test functions and convolution), §§2.1–2.4, 2.7; PseudodifferentialOperators Layer 6, §6.1 (elliptic parametrices), and Layer 5, §5.1.

**Checks.**

- The second slot uses −λ̄ and conjugate inversion: `I_P(λ,g)*=I_P(−conj λ,g*)`. At λ=it this parameter is again it; at λ=1 it is −1. In the additive model I(λ,x)=exp(λx), for g=1_[0,1] one obtains I(1,g)*=e−1 and I(−1,g*)=e−1, whereas I(1,g*)=1−e⁻¹. Smooth compact approximations give the same separating test.

- On the additive group ℝ with Δ=1−d²/dx², k=1 and m=0, the fundamental solution E(x)=exp(−|x|)/2 satisfies ΔE=δ and is continuous but not C¹; for a bump φ equal to 1 near 0, Δ(φE)=δ−h with h smooth and compactly supported, so δ=Δ(φE)+h and f=f*h+(f*Δ)*(φE). A smooth g₂ is impossible here: Δg₂+g₁ would then be smooth and could not equal δ.

- On a one-dimensional K-type let B(u,v)=u·conj(v), A=2 and T=i. Then B(AT·1,1)=2i=B(A·1,T*·1), with T*=−i; using T instead in the second slot gives −2i.

### 3.3 Cuspidal support in weighted function spaces

Import X(G), the Weyl-associate normalized cuspidal data, from AutomorphicSpectralTheory §1.9, and its orthogonal decomposition from AutomorphicSpectralTheory §1.10, both transported to [G] by §2.15a. If a weight factors through A_P∞, define `L²_{w,X}` as the orthogonal sum of the blocks indexed by X⊂X(G); these projections agree for different such weights on intersections. Define S_X=S∩L²_X. For an arbitrary quotient weight and `F∈{L²_w,C,T_N,T,S_{w,N},S_w}`, define F_X as the annihilator of `S_{Xᶜ}` under the integral pairing. The notation therefore records cuspidal support, not necessarily Hilbert orthogonality for that weight. CT and EP preserve this support with the finite-to-one map X(M_P)→X(G). (BPCZ §§2.9.1–2.9.3, (2.9.2.1)–(2.9.2.2), Lemma 2.9.3.1, pp.229–232; bpcz line 2063).

The defining construction has the following API.

- F_X is precisely the annihilator of `S_{Xᶜ}` in the indicated integral pairing.

- On intersections of A_P-weighted L² spaces, the original projections agree.

- CT and EP respect the inverse image or image of a support subset under the normalized datum map.

A proof route is as follows. Compare the normalized cuspidal-datum convention to AutomorphicSpectralTheory §1.9 rather than introducing another quotient of pairs. Use the dense pseudo-Eisenstein span to compare A_P-weight projections; define arbitrary-weight support by annihilation. Use CT/EP adjunction and compact A_P cutoffs to prove support compatibility.

*Needs:* AutomorphicSpectralTheory §§1.5–1.10, in particular §1.10 (orthogonal cuspidal-data decomposition); §2.16; §2.14; §2.11; §2.15a (cuspidal data on [G] and at fixed ω).

**Checks.**

- F_∅={0}; in particular the annihilator of all S is zero.

- `F_{X(G)}=F`.

- For nonzero orthogonal Hilbert blocks χ₁≠χ₂ and weight 1, a vector in χ₁+χ₂ has nonzero projection onto {χ₁} unless its χ₁ component vanishes; the rule is not a zero or identity projection.

- A general weight need not make distinct support subspaces orthogonal.

### 3.4 Continuous cuspidal-support projections

For every weight w and support subset X, the projection on S extends continuously to `(L²_w)^∞→(L²_{w,X})^∞`; the family of singleton components is unconditionally summable to φ in that smooth space. On S the sum is absolutely summable. The maps also extend continuously to C,T,S_w and obey ⟨φ_X,ψ⟩=⟨φ,ψ_X⟩ for T×S. There is a common height loss N₀>0 such that singleton components of φ∈T_w are absolutely summable in `T_{w n_P^{N₀}}`, and those of φ∈`S_{w,N}` in `S_{w,N+N₀}`; on C absolute summability holds in C. S_X is dense in C_X and smooth `L²_{−N,X}`. Under product quotient tensor identifications the X₁×X₂ projection is the completed tensor product of the two projections, giving S_X and C_X product isomorphisms. (BPCZ §2.9.4, Theorem 2.9.4.1, pp.232–235; (2.9.5.9)–(2.9.6.10), p.235; bpcz line 2157).

A proof route is as follows. Induct on parabolic semisimple rank, starting with A_P-factor weights where the Hilbert decomposition applies. Use the weighted graph embedding for lower/upper comparable weights, then the EP open surjection to descend the compatible projections for general weights. Use nuclear inclusions to convert unconditional sums to absolute sums and track the one common height loss. Density and product compatibility follow by applying the continuous projections to dense Schwartz vectors and pure tensors.

*Needs:* §3.3; §2.18; §2.8; §2.15; AutomorphicSpectralTheory Layer 4.

**Checks.**

- Projection laws `P_XP_Y=P_{X∩Y}` and P_all=id hold on every common domain.

- Do not strengthen unconditional convergence in an arbitrary weighted L² stage to absolute convergence there without a stronger weight.

### 3.5 Regular cuspidal data

A normalized cuspidal datum represented by (M_P,π) is regular if its stabilizer in W(P)=Norm_G(M_P)/M_P is trivial: wπ≅π implies w=1. This is independent of the chosen Weyl-associate representative. For GL_n and π=⊠_iπ_i on `∏_iGL_{n_i}`, regularity means the factors of the same rank are pairwise nonisomorphic; different ranks cannot be permuted. This is not the distinct-parameter condition on a single infinitesimal character and is different from the GGP-specific starred regularity condition. (BPCZ §2.9.7, pp.235,237–238; bpcz line 2292).

The defining construction has the following API.

- Regularity is triviality of the Weyl stabilizer of the normalized datum.

- Weyl-associate representatives give the same predicate.

- For GL_n the condition is pairwise nonisomorphism of the equal-size cuspidal factors.

A proof route is as follows. Transport the stabilizer by Weyl conjugation. For GL_n the relative Weyl group permutes equal-size blocks, giving the explicit criterion.

*Needs:* AutomorphicSpectralTheory §§1.5–1.10.

**Checks.**

- Every cuspidal datum with M=G is regular.

- On GL₂, a Borel datum χ⊠χ is not regular, since the transposition fixes it.

- On GL₂, χ₁⊠χ₂ with χ₁≄χ₂ is regular, even when their infinitesimal characters agree.

- A Levi equal to G has trivial relative Weyl group and is regular.

### 3.6 Regular-support constant terms and holomorphy

If χ is regular, the constant term extends boundedly from L²_χ([G]) to L²_χ([G]_P), and the adjoint pseudo-Eisenstein map is bounded in the reverse direction. For φ∈S_χ([G]) and Re s>0, the Levi function `m↦δ_P(m)^{s−1/2}φ_P(m)` belongs to `C_{χ_M}([M_P])`, where χ_M is the finite inverse image support in X(M_P). The family `S_χ→C_{χ_M}` is holomorphic in s on Re s>0 in the locally convex sense. At the boundary Re s=0 no such C-valued assertion is made. (BPCZ §2.9.7, Proposition 2.9.7.1 and Corollary 2.9.7.2, pp.235–238; bpcz line 2296).

A proof route is as follows. Use the pseudo-Eisenstein inner-product formula of AutomorphicSpectralTheory §1.8 and the constant-term formula of its §1.5, transported to [G] by §2.15a; identifying their parameters and quotient measures with those of BPCZ §2.9.7 and Lapid §2 is part of this target. Use regularity to cancel all nonidentity stabilizer terms. Compare the two Hilbert norms, extend by density, and take adjoints to obtain the L² constant-term bound within this node. Combine the large-positive-s constant-term estimate with weighted Hölder interpolation to reach Re s>0; derivatives and weak holomorphy plus local boundedness give locally convex holomorphy by AutomorphicSpectralTheory §0.15, specialized to scalar source ℂ.

*Needs:* §3.5; §3.4; §2.16; §2.15a; AutomorphicSpectralTheory §§0.11–0.15; AutomorphicSpectralTheory §§1.5–1.8; AutomorphicSpectralTheory §§3.1–3.4.

**Checks.**

- The normalization exponent is s−1/2, not s or s+1/2.

- For the GL₂ Borel and δ_P=4, the multiplier at s=1 is 2, while the normalization at s=0 is 1/2; the latter boundary value is not a claim of Harish-Chandra decay.

### 3.6a Lapid's hereditary property for products of general linear groups

Use Lapid's analytic conditions. A connected reductive group G satisfies uniform temperedness (UT) if there are k,l>0 such that for every maximal parabolic P=MU of G with Σ_P={α} and every level K_M of M there is c>0 with `n_α(π,z)≪(1+Λ_{π∞}+|z|)^k` for all π∈Π_disc(M(𝔸)) with K_M-fixed vectors, in the region `|Re z|<c(1+Λ_{π∞}+|Im z|)^{−l}`. Here n_α is the global normalizing factor of the intertwining operator and `Λ_{π∞}` the size of the Casimir eigenvalue of π∞ (Lapid Definition 3.2, p.14; lapid line 558). It satisfies the weak Ramanujan property (WR) with constant c>0 if, for every maximal parabolic P=MU with fundamental weight ϖ, every π∈Π_disc(M(𝔸)), place v, level K and K∞-type τ, the normalized local intertwining operator `N_{P̄|P}(π_v,sϖ)` on the (τ,K)-part is holomorphic in |Re s|<c (Lapid Definition 3.7, p.17; lapid line 709). It satisfies (HP) if G and all its Levi subgroups satisfy (UT) and (WR) (Lapid §3.6, p.19; lapid line 801).

Let `G=∏_i Res_{K_i/F}GL_{n_i}` for finitely many finite extensions K_i/F. Prove that G satisfies (UT), and (WR) with constant min_i 2/(n_i²+1), hence (HP) (Lapid Proposition 3.4, pp.15–17, and Theorem 3.8, p.17, which cites [MS04, Proposition 4.2]; lapid line 599 and line 724). For every G satisfying (HP), prove Lapid's polynomial bounds, uniform in π∈Π_disc(M(𝔸)): for each Levi M there is l>0, for each invariant differential operator D on a_M* there is k>0 and for each level K there is c>0, such that the D-derivatives in λ of the normalizing factors `n_{P′|P}(π,λ)` and of the intertwining operators `M_{P′|P}(w,λ)` on (τ,K)-parts are `≪(1+‖λ‖+Λ_{π∞}+‖τ‖)^k` on `R_{π,c,l}={λ:‖Re λ‖<c(1+Λ_{π∞}+‖Im λ‖)^{−l}}`. In a fixed strip, the derivatives of the local normalized operators are `≪(1+‖τ‖)^k` at infinite places and bounded in terms of K at finite places (Lapid Lemma 3.3, Lemma 3.11 and Corollary 3.13, pp.14–19; lapid line 571, line 771 and line 804).

A proof route is as follows. For (UT), write n_β(π,−s) for cuspidal π=π₁⊗π₂ on `GL_{n₁}×GL_{n₂}` as the ratio L(1−s,π̃₁×π₂)/L(1+s,π₁×π̃₂) of completed Rankin–Selberg L-functions (lapid line 673). Bound the numerator by the polynomial growth of completed Rankin–Selberg L-functions near Re s=1, uniformly in the analytic conductor (lapid line 628). Bound the archimedean gamma ratio by Stirling's formula and the archimedean Luo–Rudnick–Sarnak bound 1−Re α_j>1/(n₁²+1)+1/(n₂²+1) ([MS04, Proposition 3.3]; lapid line 619). Bound the reciprocal of the denominator by Brumley's lower bound at the edge of the critical strip (Lapid Proposition 3.5 and Appendix A; lapid line 647 and line 1178). For residual π use the Mœglin–Waldspurger description by Speh residues and multiply the resulting factors (lapid line 694). For (WR), the Luo–Rudnick–Sarnak bounds at every place confine the exponents of the local components, and normalized local intertwining operators of representations induced with exponents in that range are holomorphic in the strip ([MS04, Proposition 4.2]; lapid line 724). Restriction of scalars from K_i to F and finite products preserve both conditions, with the minimum of the constants. The conductor-uniform growth bound, the archimedean parameter bound and Brumley's lower bound are proved as part of this target.

*Needs:* AutomorphicSpectralTheory §§2.1–2.3a (local intertwining operators and the GLₙ normalized intertwining estimates); AutomorphicSpectralTheory §2.5; AutomorphicSpectralTheory §3.6a (Rankin–Selberg strip estimates); AutomorphicSpectralTheory §4.14a (number-field GLₙ residual blocks); AutomorphicSpectralTheory §7.1a (finite-place Luo–Rudnick–Sarnak bound); AutomorphicLFunctionsAndLocalFactors AL.3.6.1–AL.3.6.2 (continuation, pole criterion and global functional equation of Rankin–Selberg L-functions); AutomorphicLFunctionsAndLocalFactors AL.R.2 (archimedean GLₙ parameters).

**Checks.**

- For G=GL₁ every proper Levi condition is vacuous: there is no maximal parabolic, so (UT) and (WR) hold trivially and the WR constant 2/(1²+1)=1 is not used.

- For G=GL₂, its Borel and π=χ⊗χ with χ a unitary Hecke character, write L_F for the completed Dedekind zeta function; then n_β(π,−s)=L_F(1−s)/L_F(1+s). The poles at s=0 cancel and the value at s=0 is −1, while on Re s=0 the absolute value is 1. Near Re s=0 the reciprocal 1/L_F(1+s) is controlled only through a zero-free region of ζ_F near Re s=1, the GL₁ case of Brumley's lower bound; upper bounds for L-functions alone give no bound for n_β.

- The WR constant for GL₃ is 2/(3²+1)=1/5 and for GL₂ it is 2/5; a product `GL₂×Res_{K/F}GL₃` has constant min(2/5,1/5)=1/5, not the larger value.

### 3.7 Lapid expansion of Harish-Chandra Schwartz functions

Let G be a connected reductive group over F satisfying Lapid’s hereditary property (HP): G and every Levi satisfy (UT) and (WR), as in Lapid §3.6, lapid line 801. Let χ be a regular datum represented by (M_P,π). Write Π=I_P^Gπ. There is N>0 such that for every φ∈C([G]) and λ∈ia_P*, the series `φ_{Πλ}=Σ_{v∈𝔅}⟨φ,E(v,λ)⟩ E(v,λ)` is defined, basis independent, and converges absolutely in T_N([G]). The map `λ↦φ_{Πλ}` is Schwartz with values in T_N, using all parameter derivatives, and if φ∈C_χ then `φ=∫_{ia_P*}φ_{Πλ}dλ`. The exponent N is uniform in λ and φ. Section 3.6a proves (HP) for every finite product of `Res_{K_i/F}GL_{n_i}`, so for these groups the theorem is unconditional. (BPCZ §2.9.8, Theorem 2.9.8.1, pp.238–239; Lapid Theorem 4.5, p.22, Proposition 5.1, pp.22–24, Corollary 5.7, pp.25–26; lapid line 924, line 933 and line 1069; bpcz line 2394).

A proof route is as follows. Use the polynomial derivative bounds for normalizing factors and intertwining operators under (HP) of §3.6a. Factor φ by a compact smooth convolution and use the relative-character basis estimates with Lapid’s Eisenstein majorization for uniform convergence and parameter derivatives. Apply Lapid Theorem 4.5 on inversion of cuspidal wave packets; regularity places the whole χ-block in its induced-from-cuspidal image.

*Needs:* §3.1; §3.5; §3.4; §3.6a; §2.11; AutomorphicSpectralTheory §§2.1–2.5; AutomorphicSpectralTheory §§3.1–3.4; AutomorphicSpectralTheory §§0.11–0.15.

**Checks.**

- The theorem applies to every (HP) group and regular χ. For a compact torus quotient with mass-one Haar measure the Weyl stabilizer is {1} and the constant-term operator is the identity; Fourier orthogonality gives a single mode coefficient 1 and every distinct mode coefficient 0. For GL_n products (HP) is §3.6a, with no added conjecture.

- The zero Schwartz vector gives every coefficient 0 and integral 0. For φ outside the χ-block the integral reconstructs its χ-component, so the equality with φ requires φ∈C_χ. The full noncuspidal Schwartz Paley–Wiener statement is not used.

### 3.8 Schwartz convolution kernels and cuspidal parts

For f∈S(G(𝔸)) define `K_{f,P}`, `K_{f,P,χ}` as the smooth integral kernels of R_P(f) and its χ support component on the AdelicAlgebraicGroups quotient L² spaces. Define K⁰ on the A_P∞-quotient using its `δ_P^{1/2}` normalization. They satisfy `K⁰_{f,P,χ}(x,y)=∫_{A_P∞}K_{f,P,χ}(x,ay)δ_P(a)^{−1/2}da`. For compactly supported smooth f first prove these statements directly: the kernel of R_P(f) on L²([G]_P) is `K_{f,P}(x,y)=Σ_{γ∈M_P(F)}∫_{N_P(𝔸)}f(x⁻¹γny)dn`, the parabolic kernel of AutomorphicSpectralTheory §6.4 extended from G(𝔸)¹ to G(𝔸); its χ support component is obtained by applying the projection of §3.4 in the first variable; and the K⁰ identity follows by disintegrating the quotient measure along A_P∞. This fixes the pairing convention `(R_P(f)φ)(x)=∫K_{f,P}(x,y)φ(y)dy`. Smooth representatives are used; kernel columns come from regularizing δ_y with the appropriate adjoint. Derivatives in either variable agree with the corresponding left/right derivatives of f. (BPCZ §2.10.1, pp.239–240; bpcz line 2420).

The defining construction has the following API.

- Integrating the kernel against a compact smooth vector recovers R_P(f) exactly.

- Applying the χ projection to the first variable gives `K_{f,P,χ}` and agrees with the original compact kernel when f is compact.

- The normalized A_P∞ integral gives K⁰ with factor `δ_P^{−1/2}`.

A proof route is as follows. Use smooth regularization of point distributions, then apply the continuous support projection. Apply the quotient disintegration measure to descend along A_P∞, starting from the compact-test identity; use the weighted estimates for absolute convergence and density of compactly supported tests to pass to Schwartz f.

*Needs:* §3.4; §2.12; §2.7; §2.15a; AutomorphicSpectralTheory §6.4 (compact-test kernels); AdelicAlgebraicGroups §§2.1–2.3 (quotient measures and integration in stages).

**Checks.**

- For f=0 every kernel and every support component is zero.

- For the group with one element and mass-one measure, the kernel is f(1) and convolution is scalar multiplication.

- On ℝ/ℤ with mass-one Haar measure set e_n(x)=exp(2πinx). For R(f)φ(x)=∫f(g)φ(x+g)dg and `f=e_{−n}`, the kernel is e_n(x)overline(e_n(y)), the orthogonal rank-one projector onto e_n. Taking f=e_n instead projects onto `e_{−n}`; this detects the convolution sign and normalization.

- The A_P factor is `δ_P^{−1/2}`; kernel and measure normalizations must be tested together.

### 3.9 Uniform bounds for cuspidal kernel parts

There exists N₀>0 such that for every weight w on [G]_P and continuous seminorm q on `T_{w n_P^{N₀}}` there is a continuous Schwartz seminorm p satisfying `Σ_χq(K_{f,P,χ}(·,y))≤p(f)w(y)^{−1}`. In particular `Σ_χ|K_{f,P,χ}(x,y)|≤p(f)n_P(x)^{N₀}w(x)/w(y)`. The same pointwise bound holds for `Σ_χ|K⁰_{f,P,χ}(x,y)|` when x,y∈`[G]_P¹=H_P^{-1}(0)`. The exponent N₀ is chosen before the weight and seminorm. (BPCZ §2.10.1, Lemma 2.10.1.1, pp.239–240; bpcz line 2431).

A proof route is as follows. First bound `R(f):T₀,w→T_{w n^{N′₀}}` uniformly in w at the level of the height loss. Use absolute support summability after a second fixed loss and apply the uniform boundedness principle to the family of support components. Apply the resulting bound to δ_y, whose weighted variation norm is `w(y)^{-1}`; integrate the normalized central direction for K⁰.

*Needs:* §3.8; §3.4; §2.7.

**Checks.**

- The K⁰ estimate is stated on H_P=0; simply using the same inequality for arbitrary central translates would alter the weight factors.

### 3.10 Spectral expansion of Schwartz kernels

There exist a continuous seminorm p on S(G(𝔸)) and N≥0 such that for every X,Y∈U(g∞), f∈S and x,y∈G(𝔸)¹, the sum over χ and standard P, with coefficient `|𝒫(M_P)|^{−1}`, of `∫_{ia_P^{G,*}}Σ_τ |Σ_{v∈𝔅_{P,χ,τ}} R_x(X)E(x,I_P(λ,f)v,λ) R_y(Y)(overline(E(y,v,λ)))|dλ` is at most p(L(X)R(Y)f)n_G(x)^Nn_G(y)^N. Here 𝒫(M_P) is the finite set of parabolics with Levi M_P and 𝔅 is a K-basis in the discrete inducing space with support χ. The derivative acts on the conjugate Eisenstein function, with Y extended complex-linearly; it is not the conjugate of the Y-derivative. For arbitrary x,y∈G(𝔸), `K⁰_{f,χ}(x,y)` is the sum of the same undifferentiated Eisenstein terms with those coefficients and spectral measures. The absolute value is outside the finite sum within each K-type, before summing types and integrating. (BPCZ §2.10.2, Lemma 2.10.2.1, pp.240–243; bpcz line 2481 and line 2496).

A proof route is as follows. First prove the identity for compactly supported smooth f: apply the unitary Eisenstein spectral map and its completeness (AutomorphicSpectralTheory §§4.2–4.3), transported to [G] by §2.15a, to the kernels of §3.8, retaining the discrete inducing representation spaces and the parabolic multiplicity factors (Arthur's kernel expansion, [Art78] §4, as cited before BPCZ Lemma 2.10.2.1, p.240; bpcz line 2480). Use Arthur factorization at fixed normal finite level, then positivity on the diagonal and Cauchy–Schwarz to bound the grouped K-type terms by the kernel majorant. Use the uniform boundedness principle and density to pass to Schwartz f and commute group derivatives with the uniformly controlled expansion.

*Needs:* §3.9; §3.8; §3.2; §2.15a; AutomorphicSpectralTheory §§4.1–4.3; AutomorphicSpectralTheory §6.4.

**Checks.**

- Absolute convergence of the ungrouped individual basis terms is not claimed by this estimate.

- The derivative estimate uses x,y∈G(𝔸)¹, whereas the displayed kernel identity holds after central disintegration for general x,y.

- On the mass-one circle put D=(2π)⁻¹d/dx, X=1, Y=iD−1 and f=e₋₁. Since De₁=ie₁ and De₋₁=−ie₋₁, Y e₋₁=0 whereas Y e₁=−2e₁. The differentiated kernel and R(Y)f are both zero, so the estimate reads 0≤p(0)=0. Conjugating Y e₁ instead would give absolute value 2 and the false inequality 2≤0.

- For the same projector with Y=D, differentiating conj(e₁(y)) gives −i e₋₁(y), and R(D)f=−i f. Both differentiated kernel coefficients are −i; this test fixes the sign even though absolute values alone give 1 in either convention.

### Examples

On the compact circle the kernel of right convolution by e₋ₙ is eₙ(x)conj(eₙ(y)); the two indices n=0 and n=1 give kernels 1 and exp(2πi(x−y)). Support projections onto disjoint singleton blocks have product zero and their union projection is their sum. For a GL₂ Borel datum χ₁⊠χ₂ the relative Weyl stabilizer has order 2 when χ₁=χ₂ and order 1 when the characters differ.

### Dependencies

Layer 2; AutomorphicSpectralTheory Layers 1–4, §§4.14a, 6.4 and 7.1a; AutomorphicFormsOnReductiveGroups §§0.1–0.5, 2.1–2.4, 2.7, 3.4–3.5; AutomorphicLFunctionsAndLocalFactors AL.R.2 and AL.3.6.1–AL.3.6.2 for §3.6a; PseudodifferentialOperators Layers 5–6 for §3.2; AdelicAlgebraicGroups §§2.1–2.3; NoncommutativeGeometry N1.

## Layer 4: Counting and archimedean annihilation

### 4.1 Level and T-characters

Fix a number field F, connected reductive G/F, its maximal F-split central torus Z and unitary automorphic central character ω. Fix a finite set S of finite primes containing all ramified group and level places, `K=K_S×∏_{v∉S}K_v`, and a set T⊃S that may be infinite. H_G^T is the restricted tensor product of the spherical algebras at v∉T, with unit `1_{K_v}` and vol(K_v)=1. A T-character χ is a character of Z(g∞)⊗H_G^T, equivalently an infinitesimal-character W-orbit χ∞ and a family of unramified characters away from T. L²_ω[χ] denotes the closed χ-eigenpart in the fixed-level Hilbert space; its cuspidal subspace is intersected with L²_cusp. Twists and inducing parameters lie in the relative spaces (a_M^G)* of the Conventions. The normalizations of Z, A_M∞ and unitary unramified twists are those of §2.15a, which compares them with AutomorphicSpectralTheory §§1.9–1.10. (BPLZZ §3.1, Definitions 3.1–3.3, pp.21–22; §3.2, pp.23–24; bplzz line 1080).

The defining construction has the following API.

- Evaluation on z⊗h is χ∞(z)χ^T(h).

- For T⊂T′ restriction forgets characters at T′\T and agrees with the inclusion `H_G^{T′}⊂H_G^T`.

- The fixed-level χ-part is closed and stable under G∞ and under the bi-K Schwartz algebra `S(G(𝔸))_K=S(G∞)⊗S(G(𝔸_f))_K`, because Z(g∞) commutes with G∞ and each spherical factor at v∉T is commutative. A general Schwartz test function acts on the full automorphic representation and can change the finite level; no G(𝔸)-invariance of the K-fixed χ-part is asserted (BPLZZ §3.1, p.22; bplzz line 1100).

A proof route is as follows. Use the existing central-character quotient and spherical Hecke algebras; form the algebraic restricted tensor with finite-support Hecke operators. Use the simultaneous central/Hecke eigencondition and compare the normalized cuspidal-datum quotient through central-character-affine-lattice.

*Needs:* AdelicAlgebraicGroups §§2.1–2.3; AutomorphicSpectralTheory Layer 4; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.2; satake-exponential-family; §2.15a (cuspidal data on [G] and at fixed ω).

**Checks.**

- If T contains all finite places, H_G^T=ℂ and the character records only χ∞.

- For GL₁, the v-character is evaluation of a Laurent polynomial at the unramified Hecke parameter.

- Every spherical unit evaluates to 1; multiplying finitely many such units does not change χ.

- T itself may be infinite; each Hecke operator has finite support.

- Finite-group model of the level restriction: in the standard representation of S₃ with K=⟨(12)⟩, the K-fixed vector (1,1,−2) is sent by the point mass at (23) to (1,−2,1), which is not K-fixed, whereas the bi-K average e_K*δ_(23)*e_K sends it to (−1/2,−1/2,1), which is K-fixed. Stability of the K-fixed space holds for bi-K tests only.

### 4.2 CAP characters relative to T

For a fixed inner form G′ of G, a T-character χ is (G′,T)-CAP if there is a proper parabolic P′⊊G′ with Levi M′, and a cuspidal automorphic representation σ of M′(𝔸) such that at almost all v∉T the unramified representation determined by χ_v is a constituent of the normalized induction of σ_v, under the unramified inner-form identification. This is an almost-everywhere finite-place condition, independent of χ∞. Non-CAP is its negation. The inner form is a parameter, not an additional existential quantifier. For the non-CAP isolation theorem specialize G′=G and rule out proper cuspidal data of G itself. (BPLZZ §3.1, Definition 3.4, p.22; bplzz line 1091).

The defining construction has the following API.

- Changing finitely many finite-place characters does not change CAP.

- If χ occurs in a proper cuspidal datum of G, it is (G,T)-CAP.

- Characters with the same away-T almost-everywhere data have the same CAP status regardless of χ∞.

A proof route is as follows. Fix the inner form parameter, then form the existential predicate over its parabolics and cuspidal representations. Show independence of changing finitely many local identifications or ramified places; do not add an archimedean matching hypothesis.

*Needs:* §4.1; AutomorphicSpectralTheory §§1.5–1.10; AutomorphicFormsOnReductiveGroups §§3.4–3.5.

**Checks.**

- For a torus, fix its inner form (which is itself); there is no proper parabolic, so no character is CAP.

- For GL₂, a character coming from induction of two Hecke characters is CAP via the Borel.

- When T contains every finite place and G has a proper parabolic supporting a cuspidal datum, the almost-everywhere condition is vacuous; non-CAP cannot be assumed automatically.

- Exact occurrence in a proper datum implies CAP, but CAP need not imply exact occurrence at every retained place.

### 4.2a Near equivalence and the π-nearly isotypic cuspidal subspace

Fix (G,Z,ω,K) as in §4.1 and write L²_cusp=L²_cusp([G],ω) for the closed cuspidal subspace of L²_ω([G]) (AutomorphicFormsOnReductiveGroups §§4.1–4.2). It is the Hilbert direct sum of irreducible closed G(𝔸)-invariant subspaces, each isomorphism class occurring with finite multiplicity (AutomorphicSpectralTheory §4.5, cuspidal part). An irreducible subrepresentation π̃⊂L²_cusp has local components π̃_v, through the restricted tensor factorization of its smooth K∞-finite finite-level vectors (AutomorphicSpectralTheory §0.50; AutomorphicFormsOnReductiveGroups §§3.4–3.5), unramified at almost all finite v. Let π=⊗′_vπ_v be an irreducible admissible representation of G(𝔸), not assumed automorphic. Then π̃ is nearly equivalent to π if there is a finite set S′ of places containing the archimedean ones with π̃_v≅π_v as smooth G(F_v)-representations for all v∉S′. The π-nearly isotypic cuspidal subspace L²_cusp([G],ω)_π is the closure of the sum of all irreducible closed subrepresentations π̃⊂L²_cusp nearly equivalent to π, and its level-K part L²_cusp([G]/K,ω)_π is its subspace of R(K)-fixed vectors, the Hilbert direct sum of the π̃^K over the summands nearly equivalent to π in any decomposition as above. The sum runs over subspaces, so multiplicities are kept, and only the isomorphism classes of the finite-place components outside a finite set enter. (BPLZZ §1.1, Theorem 1.1 and Remark 1.2(4), p.2; §3.1, Theorem 3.6, p.23).

The defining construction has the following API.

- Near equivalence is an equivalence relation on isomorphism classes of irreducible admissible representations of G(𝔸); changing finitely many local components, including all archimedean ones, does not change the class.

- Spherical criterion: π̃ is nearly equivalent to π iff for some finite S′⊇S both π̃_v and π_v are K_v-spherical for all v∉S′ with the same character of the spherical Hecke algebra, by the spherical classification. Hence, for a finite T⊇S containing the places where π is ramified, the T-character χ_π^T of §4.1 attached to π determines the near-equivalence class of π through its away-from-T part, and the (G′,T)-CAP property of §4.2 depends only on that class.

- L²_cusp([G],ω)_π is closed and G(𝔸)-invariant; its level-K part is closed and stable under `S(G(𝔸))_K`; both depend only on the near-equivalence class of π. The subspace is the orthogonal Hilbert sum of the isotypic cuspidal components L²_(G,σ)([G],ω) of §2.15a over the isomorphism classes σ nearly equivalent to π; distinct near-equivalence classes give orthogonal subspaces, and their Hilbert sum is L²_cusp.

- For T as above, the cuspidal χ_π^T-eigenpart L²_ω[χ_π^T]∩L²_cusp of §4.1 at level K is contained in L²_cusp([G]/K,ω)_π. The containment is proper in general, since the eigenpart also fixes the infinitesimal character.

A proof route is as follows. Take local components from the restricted tensor factorization and define near equivalence on isomorphism classes; transitivity uses the union of two finite sets. For the spherical criterion use the Satake classification: an irreducible unramified representation is determined by its spherical Hecke character. Form the closed span of the chosen summands and use the Hilbert-sum decomposition with finite multiplicities to identify its R(K)-fixed vectors with the Hilbert sum of the π̃^K; orthogonality of the isotypic components of distinct isomorphism classes gives the orthogonal decomposition of L²_cusp by near-equivalence classes. For the inclusion of the eigenpart apply the spherical criterion to each summand meeting it.

*Needs:* §4.1; §4.2; §2.15a; AutomorphicSpectralTheory §§0.50, 1.9, 4.5; AutomorphicFormsOnReductiveGroups §§3.4–3.5, 4.1–4.2; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.2.

**Checks.**

- For G=GL₁=Z, L²_ω([G]) is the line of ω, so the subspace is that line if π_v=ω_v for almost all v and zero otherwise. Among Hecke characters only ω itself is nearly equivalent to ω, since a Hecke character trivial at almost all places is trivial (weak approximation), so for automorphic π the condition reads π=ω; the non-automorphic character π=ω⊗χ, with χ a nontrivial character of the multiplicative group of the completion at one finite place v₀ and trivial elsewhere, so that π_v=ω_v for v≠v₀, is nearly equivalent to ω and gives the line although π≠ω.

- Replacing π∞ by a representation with another infinitesimal character leaves L²_cusp([G]/K,ω)_π unchanged, while the cuspidal χ_π^T-eigenpart of §4.1 is replaced by one orthogonal to it inside L²_cusp.

- The subspace may be zero although π^K≠0: no automorphic occurrence of π is assumed.

- A summand π̃ occurring with multiplicity m contributes m orthogonal copies of π̃^K, and a near-equivalence class may contain non-isomorphic π̃ differing at finitely many places; the subspace is then not isotypic.

### 4.3 Mixed archimedean and spherical multipliers

A T-multiplier is an element of (M♯θ)^W⊗_ℂH_G^T, acting on fixed-K test functions by the real multiplier in the archimedean factor and spherical convolution in the retained finite factors. Its action is continuous stagewise, remains bi-K-invariant, and obeys R(μ⋆f)=μ(χ)R(f) on an irreducible χ-isotypic representation. Evaluation μ(χ) is well defined on the tensor product. This algebra need not have a unit because the sharp factor may not have one; the Hecke unit alone is not an allowed T-multiplier. (BPLZZ §3.1, Definition 3.5 and discussion, pp.22–23; bplzz line 1116).

The defining construction has the following API.

- For a pure tensor μ∞⊗h, μ(χ)=μ∞(χ∞)h(χ^T).

- (μν)⋆f=μ⋆(ν⋆f), with associativity and bilinearity; no unit axiom is added.

- For any irreducible admissible adelic representation with the indicated characters and fixed vectors, its operator on μ⋆f is μ(χ) times its operator on f.

A proof route is as follows. Use commutation of real multipliers and finite spherical convolution to descend the action from pure tensors. Use each local spectral identity and finite sums to prove the scalar action and evaluation rule.

*Needs:* §4.1; §1.7; §1.9; §0.7; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.2.

**Checks.**

- The zero multiplier kills every test function.

- For a compact real torus, 1⊗h does not generally define a T-multiplier, whereas μ∞⁰⊗h with a sharp μ∞⁰ does.

- If μ∞(χ∞)=2 and h(χ^T)=3, then (μ∞⊗h)(χ)=6.

- All finite-place support changes remain finite, even for infinite T.

### 4.4 Quasi-cuspidal Schwartz test functions

For the fixed (G,Z,ω,K), a bi-K Schwartz test function f is quasi-cuspidal if R(f) maps the entire Hilbert space L²_ω([G]/K) into its closed cuspidal subspace. This is a property of the integrated operator on that quotient and central character. It does not require every local constant term of f to vanish, nor does it quantify over all central characters. (BPLZZ §3.1, Definition 3.2, p.22; bplzz line 1072).

The defining construction has the following API.

- f is quasi-cuspidal iff (1−P_cusp)R(f)=0.

- The quasi-cuspidal functions form a complex vector subspace of the fixed-level Schwartz algebra.

- If f is quasi-cuspidal then f*g is quasi-cuspidal for a compatible test function g; for g*f use invariance of the cuspidal subspace.

A proof route is as follows. Use the range inclusion in the existing closed cuspidal Hilbert subspace. Express equivalently that the orthogonal projection onto the cuspidal complement composed with R(f) is zero.

*Needs:* §4.1; AutomorphicFormsOnReductiveGroups §§4.1–4.2.

**Checks.**

- The zero test function is quasi-cuspidal.

- If G/Z is anisotropic over F, all the automorphic L² spectrum is cuspidal, so every fixed-level Schwartz function is quasi-cuspidal.

- For GL₂ at trivial central character, a compact positive function with nonzero integral acts nontrivially on the constant residual vector and is not quasi-cuspidal.

- The zero operator is quasi-cuspidal even when it is produced by a test function with nonzero local constant terms.

### 4.5 Typical cuspidal data at an infinitesimal character

For each standard Levi M import the splitting of its Cartan dual into a central quotient c_M*/(a_M^G)* and the derived Cartan quotient b_M*. Let γ_M^+,γ_M^− be the corresponding quotient maps, and let λ_M be the derived Casimir polynomial. A normalized cusp representation σ of M is χ∞-typical if γ_M^+(χσ∞) belongs to the finite image γ_M^+(χ∞) and λ_M(γ_M^−(χσ∞)) belongs to the finite set λ_M(γ_M^−(χ∞)). Images of W-orbits are finite sets; choices of representatives do not change membership. Work modulo unitary unramified twists in i(a_M^G)*, the twists trivial on Z(𝔸). Fix a finite set of archimedean K_M-types and a compact open finite level when asserting finiteness. (BPLZZ §3.3, Remark 3.10 and Definition 3.11, p.25; bplzz line 1231).

The defining construction has the following API.

- Unitary twists in i(a_M^G)* leave the two projected conditions unchanged.

- The target central and Casimir conditions are finite-set membership conditions on the whole W-orbit.

- If the induced infinitesimal character of σ_s equals χ∞ for some s, then σ is χ∞-typical.

A proof route is as follows. Compare the central cotangent quotient to AA norm-one central ideles and AS normalized twists, retaining the directions of c_M/a_M^G, including those of a_G that the fixed ω pins over a general number field. Apply the central and derived polynomials to every representative in the finite W-orbit.

*Needs:* §4.1; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; AutomorphicSpectralTheory §§1.5–1.10; AdelicAlgebraicGroups §§2.1–2.3; central-character-affine-lattice.

**Checks.**

- For a compact central torus the derived Casimir is always 0, but different character differentials still fail the central typicality condition.

- A datum inducing exactly χ∞ is typical.

- When c_M=a_M^G, the central quotient is zero and the central condition becomes automatic; the derived condition remains.

- Both conditions are necessary; the derived Casimir alone cannot control a torus.

- For G=M=G_m over ℚ and ω=1, (a_G^G)* is zero while c_G* is one-dimensional, so the central quotient is all of c_G*; the fixed ω pins the differential at 0, and the differential 1 is not typical at χ∞=0. Quotienting by the absolute a_G* instead would make the central quotient zero and accept 1.

### 4.5a Polynomial counting of discrete-spectrum Casimir eigenvalues

Let H be a connected reductive group over a number field E, Z_H its maximal E-split central torus, ω_H a unitary automorphic character of Z_H(𝔸_E), K_f a compact open subgroup of `H(𝔸_{E,f})` and 𝔗 a finite set of `K_{H,∞}`-types. Let Ω be the Casimir operator of a fixed nondegenerate invariant form on the Lie algebra of H∞, acting on the R(K_f)-fixed, 𝔗-isotypic part of the discrete spectrum L²_disc([H],ω_H). Prove that there are C,d>0 such that, for every R≥0, the number of eigenvalues of Ω on this space of absolute value at most R, counted with multiplicity, is at most C(1+R)^d. In particular the same bound holds for the cuspidal spectrum. The level, types and central character are fixed, and C and d may depend on them. (Müller's theorem, [Mül89, Theorem 0.1], which BPLZZ Remark 3.20, p.30, uses in place of Donnelly's cuspidal bound [Don82, Theorem 9.1] of Lemma 3.12; bplzz line 1460 and line 1267.) This is a counting theorem: finite multiplicity of each eigenvalue (AutomorphicSpectralTheory §4.5) does not imply it.

A proof route is as follows. Choose test functions at the fixed level and types whose operators are nonnegative on the discrete spectrum and dominate the spectral indicator of |Ω|≤R, built from Arthur's multipliers. Bound the trace of their discrete part by the integral of the kernel diagonal against Arthur truncation, using positivity and self-adjointness of truncation, rapid decay of truncated forms and the Maass–Selberg relations for the Eisenstein contributions, on the spectral decomposition transported to the fixed central character; then choose the truncation parameter as a power of 1+R.

*Needs:* §2.15a; AutomorphicSpectralTheory §§3.1–3.6 (truncation and Maass–Selberg relations); AutomorphicSpectralTheory §§4.1–4.5 (spectral decomposition and discrete spectrum); AutomorphicSpectralTheory §§6.3–6.4 (Arthur multipliers and compact-test kernels); AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7 (compact types and infinitesimal characters).

**Checks.**

- For PGL₂ over ℚ at level PGL₂(Ẑ) and the trivial K∞-type, the discrete spectrum consists of the constant function and the Maass cusp forms for SL₂(ℤ). Weyl's law for SL₂(ℤ)∖ℍ, of volume π/3, gives about R/12 Laplace eigenvalues up to R, so the exponent d=1 is attainable while d=0 fails.

- If H is anisotropic modulo its centre and H∞ is compact modulo its centre, as for the units of a definite quaternion algebra over ℚ modulo the centre, a fixed level and finite type set leave a finite-dimensional space, and the count is bounded for all R, so d=0 works. The exponent depends on the group.

- The continuous spectrum is excluded: for PGL₂ over ℚ the Eisenstein series fill the Laplace spectrum [1/4,∞), so a count over all of L² would be infinite for every R>1/4.

### 4.6 Finite-rank cuspidal Casimir values

At fixed finite level and a finite set of archimedean K_M-types, the set Λ_M of derived Casimir values of cuspidal representations of M modulo i(a_M^G)* twists is countable and has finite rank as a subset of ℂ. More precisely the needed derived semisimple cuspidal counting function, counted with multiplicity below positive elliptic spectral parameter R, is bounded by C(1+R)^d. To pass from M to M_der, one must use a finite union of conjugate finite levels; the original level intersection alone is not sufficient. Normalize the Casimir sign so that its K-type-adjusted elliptic eigenvalue is nonnegative. (BPLZZ §3.3, Lemma 3.12 and proof, p.26; bplzz line 1263).

A proof route is as follows. Apply the counting bound of §4.5a to the cuspidal spectrum of M_der with trivial central character at the common conjugate level; Donnelly's cuspidal bound used in BPLZZ Lemma 3.12 (p.26; bplzz line 1267) is that case, and finite multiplicity alone is not a counting theorem. Choose finite representatives of M(𝔸)/(M(F)Z_M(𝔸)M_der(𝔸)K_MM∞). Translate a nonzero fixed-level cusp vector by a suitable representative before restricting to M_der. Intersect the finitely many conjugate derived levels, apply the counting theorem at that common smaller level, and deduce convergence of a sufficiently high reciprocal power sum.

*Needs:* §0.1; §4.5; §4.5a; AutomorphicFormsOnReductiveGroups §§4.1–4.2; AdelicAlgebraicGroups §§3.1, 3.4–3.6.

**Checks.**

- A repeated eigenvalue contributes multiplicity to the counting estimate, but only once to the interpolation zero set.

### 4.7 Finiteness of typical cuspidal data

For each Levi M, fixed ω, fixed finite level and finite K_M-type set, only finitely many χ∞-typical cuspidal representations occur modulo the normalized i(a_M^G)* twists. After fixing ω and normalizing the i(a_M^G)* twists, the allowed central differentials lie in a discrete affine lattice coset in the remaining central directions of c_M,ℂ*/(a_M^G)ℂ*, possibly of rank zero; the first typicality condition restricts them to finitely many values; the remaining finite-component central characters are finite at the fixed level. The counting bound of §4.5a restricts derived parameters, and fixed infinitesimal/central-character admissibility gives the final finite representation set. (BPLZZ §3.3, Lemma 3.13, p.26, with the central-character step in the proof of Lemma 3.14, pp.26–27; bplzz line 1270).

A proof route is as follows. Use the character lattice of the fixed-level compact norm-one central quotient. Compare extension of the fixed ω and normalization of twists as requested in central-character-affine-lattice: the resulting allowed differentials form an affine coset with complex-linearly independent lattice generators, rather than a full-rank lattice in all of c_M*/(a_M^G)*. Apply both typicality conditions, then derived counting at the conjugate levels and Harish-Chandra fixed-character finiteness.

*Needs:* §4.6; §4.5; §4.5a; AdelicAlgebraicGroups §§2.1–2.3; AutomorphicFormsOnReductiveGroups §§4.1–4.2; central-character-affine-lattice.

**Checks.**

- For a torus with trivial derived group the proof must still use the central condition.

### 4.8 Archimedean annihilators of unwanted families

For each standard Levi M there is μ∞^M∈(M♯θ)^W with μ∞^M(χ∞)≠0 that vanishes on every induced character `χ^G_{σ_s∞}` for every complex s∈(a_M^G)ℂ* whenever σ has the fixed permitted types and level and is not χ∞-typical. Construct it using finite-rank interpolation in the derived Casimir and interpolation on the allowed affine central lattice coset in c_M,ℂ*/(a_M^G)ℂ*. Multiply by a sharp symbol μ∞⁰ nonzero at every target Weyl translate; the additional moderate factors alone need not be sharp. (BPLZZ §3.3, Lemma 3.14, pp.26–27; bplzz line 1277).

The defining construction has the following API.

- The constructed μ∞^M evaluates nontrivially at χ∞.

- For each non-typical σ, `μ∞^M(χ^G_{σ_s∞})=0` for all complex inducing parameters s.

- The result lies in the sharp W-invariant algebra, using the M-module law and its sharp seed.

A proof route is as follows. Remove from Λ_M the finite target Casimir set, interpolate a function with exactly those unwanted zeros, and pull back along λ_Mγ_M^−. For the central quotient translate the allowed affine lattice coset to a lattice with complex-linearly independent generators and apply §0.3, killing its points outside the finite target image. Take their product over W and multiply μ∞⁰; the quotient maps kill the full complex inducing direction (a_M^G)ℂ*.

*Needs:* §4.6; §4.7; §0.3; §0.8; central-character-affine-lattice.

**Checks.**

- When the unwanted set is empty the interpolation factors can be 1, but the construction retains the sharp seed.

- For a single bad Casimir c distinct from all target values, a damped factor q(z)−c kills exactly the required Casimir fiber before Weyl symmetrization.

- For a Levi with trivial derived group but nontrivial compact central character lattice, the central factor still kills an incorrect character; a Casimir-only construction would fail.

- The value at χ∞ stays nonzero; every complex twist of a non-typical datum is killed.

### 4.9 Finite surviving cuspidal components

For the fixed (G,Z,ω,K,χ∞) there exists μ∞∈(M♯θ)^W with μ∞(χ∞)≠0 such that, for every fixed-K Schwartz f, R(μ∞⋆f) has image in a finite orthogonal sum of the cuspidal-data components of §2.15a. The list is independent of f. Choose the finite detecting K∞-types supplied by μ∞⁰, propagate them to the finitely many Levi K_M-types and finite levels, retain only typical data, and annihilate all remaining data by the product of μ∞^M. (BPLZZ §3.3, (3.3) and Proposition 3.15, p.27; bplzz line 1325).

A proof route is as follows. Use compact-picture Frobenius reciprocity to get finite Levi type sets from the detecting G-types, and choose compatible finite levels including the unramified factors. Apply the annihilator to every complex induced family and use density of pseudo-Eisenstein series in its cuspidal block. Finite typicality leaves a finite block list after multiplying the finitely many standard-Levi factors.

*Needs:* §4.8; §4.7; §1.8; §2.15a; AutomorphicSpectralTheory §§1.5–1.10; AutomorphicSpectralTheory Layer 4.

**Checks.**

- The surviving blocks may contain continuous spectral parameters; they are not a finite set of irreducible representations.

### Examples

For a compact central torus the derived Casimir is always zero. Typicality at the trivial differential retains 0 and rejects differential 1; derived counting alone retains both and is insufficient. At a finite unramified GL₁ place the spherical algebra is ℂ[T,T⁻¹]; evaluating T at parameters 2 and 3 separates them by T−2, whose values are 0 and 1. This is valid for residue cardinalities 2 and 3 with the chosen Satake normalization.

### Dependencies

Layers 0–3; AdelicAlgebraicGroups §§2.1–2.3, 4.6–4.7; AutomorphicSpectralTheory §§0.50, 1.9, 3.1–3.6, 4.1–4.5 and 6.3–6.4; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7, 3.4–3.5, 4.1–4.2; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.2; the central-lattice contract.

## Layer 5: Mixed separation and global isolation

### 5.1 Occurrence in a cuspidal datum

A T-character χ occurs in a normalized cuspidal datum (M,σ) if there is one complex parameter s∈(a_M^G)ℂ* for which the induced infinitesimal character equals χ∞ and, for every finite v outside T, the spherical constituent of the normalized induction I_P^G(σ_s,v) has character χ_v. The same parameter must work at all these places. This property descends to the Weyl-and-twist equivalence classes of §2.15a. Denote the resulting set by D(G,ω)_χ. Occurrence is stronger than the almost-everywhere finite-place condition in CAP. (BPLZZ §3.4, Definition 3.16, p.28; bplzz line 1352).

The defining construction has the following API.

- Replacing σ by a normalized unramified twist translates the existential parameter and preserves occurrence.

- Associate parabolic induction transports occurrence across the equivalence relation of §2.15a.

- Occurrence in a proper Levi datum implies that χ is (G,T)-CAP; the converse is not asserted.

A proof route is as follows. Use normalized induction, its infinitesimal character and the Satake character at each unramified place. A Weyl conjugacy or normalized unramified twist changes s and the representative without changing existence.

*Needs:* §4.1; AutomorphicSpectralTheory §§1.5–1.10; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.2; §2.15a (cuspidal data on [G] and at fixed ω).

**Checks.**

- For a cuspidal σ and M=G, the T-character induced by σ occurs in its own datum.

- When M=G and the infinitesimal characters differ, agreement at all retained finite places does not give occurrence.

- If T contains every finite place, occurrence still requires the infinitesimal-character equation, whereas the finite-place CAP condition becomes vacuous whenever a proper cuspidal datum exists.

- The infinitesimal and all retained finite-place equations must hold simultaneously.

- For G=M=G_m over ℚ, ω=1, σ=1 and T containing every finite place, the only parameter is s=0 because (a_G^G)*=0, so the character with infinitesimal character 1 does not occur; the absolute space would allow s=1 and make it occur, contradicting the full-group nonoccurrence Check above.

### 5.2 Mixed archimedean and Hecke annihilators

If χ does not occur in (M,σ), construct a T-multiplier `μ_{M,σ}` nonzero at χ whose operator annihilates the whole cuspidal component L²_(M,σ)([G],ω) of §2.15a. Only finitely many places outside T are used, even if T is infinite. For proper M choose representatives α_σ,α_χ and a splitting ℓ:h*→(a_M^G)*. For each w∈W the only candidate parameter compatible with α_σ+s=wα_χ is s_w=ℓ(wα_χ)−ℓ(α_σ). Nonoccurrence supplies an invariant archimedean polynomial or a spherical Hecke element at a retained finite place distinguishing the target from that candidate. Its values along the induced family are exponential polynomials in s. A finite linear combination avoiding the finitely many target-zero hyperplanes, followed by a Weyl product, vanishes on the entire family and is nonzero at χ. Multiply by a moderate damping and a sharp seed to obtain an element of (M♯θ)^W⊗H_G^T. (BPLZZ §3.4, Proposition 3.17 and (3.4), pp.28–29; Remark 2.9(3), p.11; bplzz line 1361).

The defining construction has the following API.

- `μ_{M,σ}(χ)≠0`.

- Evaluation at every induced T-character of σ_s vanishes for all complex s.

- For every fixed-K Schwartz f, `R(μ_{M,σ}⋆f)` is zero on L²_(M,σ).

A proof route is as follows. If the fixed-level component is zero there is nothing to annihilate; use a sharp seed nonzero at χ. For M=G an archimedean invariant polynomial separates unequal infinitesimal characters; otherwise choose a Hecke element separating the finite-place characters and multiply it by a sharp seed. A bare Hecke element need not lie in the sharp tensor algebra. For proper M form the finite exponential-polynomial differences by subtracting their evaluations at s=ℓ(w′α)−ℓ(α_σ). Choose one linear combination nonzero at every target Weyl translate, then multiply over w′. Along α=α_σ+s its identity factor vanishes. Choose a W-invariant entire damping nonzero at χ∞ that changes the exponential coefficients to moderate strip growth, and multiply by the sharp seed. Use the scalar action on induced representations and density of pseudo-Eisenstein series to annihilate the closed component.

*Needs:* §5.1; §4.3; §0.8; §0.5; §1.7; §2.15a; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.2; AutomorphicSpectralTheory §§1.5–1.10; satake-exponential-family.

**Checks.**

- For M=G and equal infinitesimal characters but different finite-place characters, use μ∞⁰⊗(h−χ_σ(h)1), choosing χ(h)≠χ_σ(h); μ∞⁰(χ∞)≠0 is essential.

- For M=G with unequal infinitesimal characters, a separating invariant polynomial times μ∞⁰ works even with no retained finite places.

- If χ occurs in the family, an element vanishing identically on that family must evaluate to 0 at χ, so this construction cannot preserve the target.

- Annihilation holds for every complex s, not just unitary parameters.

- The multiplier remains in the nonunital sharp algebra.

### 5.3 Isolation of occurring cuspidal components

For every T-character χ and the fixed (G,Z,ω,S,K), there is a T-multiplier μ with μ(χ)=1 such that for every f∈S(G(𝔸))^K the image of R(μ⋆f) on L²(G(F)\G(𝔸)/K,ω) lies in the Hilbert orthogonal sum of the cuspidal components of §2.15a indexed by D(G,ω)_χ. The constructed range is contained in a finite sum of these components. The identity μ(χ)=1 preserves the action of f on any admissible representation with this T-character, including one absent from the automorphic spectrum. This theorem asserts a range constraint and scalar normalization; it does not assert that μ acts as the identity on each entire surviving component. (BPLZZ §3.4, Theorem 3.19, pp.29–30; bplzz line 1428).

A proof route is as follows. Start with μ∞ from Layer 4 and its finite list of surviving equivalence classes. Multiply by the mixed annihilator for each class where χ does not occur. All factors are nonzero at χ. Divide by the resulting scalar at χ; use the AutomorphicSpectralTheory Layer 4 orthogonal decomposition and commuting scalar actions to prove the range inclusion.

*Needs:* §4.9; §5.2; §5.1; §4.3; §2.15a; AutomorphicSpectralTheory Layer 4.

**Checks.**

- Check that no finite-place factor outside a finite set is introduced.

- No orthogonal-projection or idempotence conclusion is inferred.

- On a surviving full-group cuspidal representation with character χ, μ(χ)=1 gives π(μ⋆f)=π(f); on a killed block the operator is 0.

### 5.4 Isolation of non-CAP cuspidal spectrum

If χ is not (G,T)-CAP, choose the normalized multiplier of global isolation so that for every fixed-K Schwartz f its operator on the entire central-character L² space has image in L²_cusp[χ]. In particular μ⋆f is ω-quasi-cuspidal and μ(χ)=1. Without the non-CAP hypothesis the same normalized multiplier has this range property after restricting its domain to L²_cusp. Here L²_cusp[χ] is the maximal closed cuspidal subspace on whose smooth vectors Z(g)⊗H_G^T acts by χ; neither assertion requires χ to be automorphic. (BPLZZ §3.1, Theorems 3.6–3.7, p.23; their proofs in §3.4, p.30; bplzz line 1120).

A proof route is as follows. A proper cuspidal datum with occurrence would imply CAP, so only M=G can survive in the non-CAP case. Intersect the occurring component sum with L²_cusp. Orthogonality of the decomposition of §2.15a identifies that intersection with L²_cusp[χ]. For arbitrary χ restrict the operator to the invariant cuspidal subspace before taking the intersection.

*Needs:* §5.3; §4.2; §4.4; §2.15a; AutomorphicFormsOnReductiveGroups §§4.1–4.2; AutomorphicSpectralTheory Layer 4.

**Checks.**

- In the unrestricted-character assertion only the cuspidal domain is controlled.

- Quasi-cuspidality is asserted on the whole L² space only in the non-CAP case.

### 5.5 Preservation of a non-CAP admissible representation

Let π be an irreducible admissible representation of G(𝔸) with unitary automorphic central character. Suppose π is not nearly equivalent, in the sense of §4.2a, to a constituent of induction from any proper cuspidal datum. At a finite level K choose finite S containing every ramified place of G, K and π and take T=S. The normalized isolation multiplier satisfies π(μ⋆f)=π(f) for every fixed-K Schwartz f, and its global L² operator has image in the π-nearly isotypic cuspidal subspace L²_cusp([G]/K,ω)_π of §4.2a. The sharper χπ^T-eigenspace range may be used as an intermediate inclusion. If the nearly isotypic cuspidal subspace is zero, the global L² action is zero while the action on π is still preserved. (BPLZZ §1.1, Theorem 1.1 and Remark 1.2(4), p.2; §3.1, Theorem 3.6, p.23; bplzz line 53).

A proof route is as follows. Associate the unramified Hecke and infinitesimal T-character to π. Non-CAP for π gives the hypothesis of §5.4. Equality of all Hecke characters outside finite S implies local isomorphism there by the spherical criterion of §4.2a, so the cuspidal χπ^T-eigenpart lies in the nearly isotypic subspace. The multiplier evaluates to 1 at χπ, so the scalar action preserves π(f).

*Needs:* §5.4; §4.2a; AutomorphicFormsOnReductiveGroups §§3.4–3.5.

**Checks.**

- Near equivalence does not determine the infinitesimal character for a general reductive group.

- No automorphic occurrence of π is assumed.

### 5.6 Isolation of one GLₙ cuspidal-support component

For `G=Res_{F′/F}GL_n` and an irreducible admissible π occurring as a constituent of normalized induction of a cuspidal representation σ of a Levi M, with unitary automorphic central character, there is a normalized multiplier preserving π(f) and mapping the entire central-character L² space into the single cuspidal-support component of §2.15a attached to (M,σ), for every fixed-K Schwartz f. The correct uniqueness input is the isobaric strong multiplicity-one theorem: the almost-everywhere unramified characters determine the multiset of cuspidal constituents, with their unramified norm twists. It identifies the cuspidal datum, not every irreducible constituent of its induced representation. (BPLZZ §1.1, Theorem 1.3, pp.2–3; §3.4, Theorem 3.19, pp.29–30; bplzz line 88).

A proof route is as follows. Use isobaric strong multiplicity one from AutomorphicLFunctionsAndLocalFactors AL.3.7.2, including normalization and twists, to show that the occurrence set contains only the inducing cuspidal-support equivalence class. Apply global isolation with χ=χπ^S and normalize at π.

*Needs:* §5.3; §2.15a; AutomorphicSpectralTheory §§1.5–1.10; AutomorphicLFunctionsAndLocalFactors AL.R.4, GLₙ isobaric sums, and AL.3.7.2, Strong multiplicity one for isobaric sums; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7.

**Checks.**

- Do not replace isobaric strong multiplicity one by the cuspidal-only Piatetski-Shapiro 1979 theorem.

- The target is a coarse cuspidal-support component and may include continuous and residual spectrum.

- Two unramified characters with values 2 and 3 give Satake polynomial (1−2T)(1−3T)=1−5T+6T² under the preparatory isobaric construction. The uniqueness input retains the unordered multiset {2,3}; repeating the first character instead gives 1−4T+4T², so multiplicities cannot be discarded.

### 5.7 Isolation of refined discrete-data components

Replace the cuspidal data of §2.15a by Langlands discrete data: let D′(G,ω) be the set of pairs (M,σ) with M a standard Levi and σ a discrete automorphic representation of M(𝔸) whose central character restricts to ω on Z(𝔸), with the same Weyl and i(a_M^G)*-twist equivalence ≈. Define the Langlands component L²_(M,σ)([G],ω)′ as the image, under the unitary Eisenstein spectral map of AutomorphicSpectralTheory §4.2 transported to the fixed central character as in §2.15a, of the symmetric families valued in the σ-isotypic parts of the discrete inducing spaces. Prove that L²([G],ω) is the orthogonal Hilbert sum of these components over D′(G,ω)/≈, refining the cuspidal-support decomposition of §2.15a, with residual summands included (BPLZZ Remark 3.20, pp.30–31, citing [Lan76] and Arthur's Theorem 7.2; bplzz line 1464). Then there is a T-multiplier with value 1 at χ whose L² range lies in the sum of the refined components where χ occurs, defined by the same simultaneous character equations as §5.1. This can be strictly smaller than the coarse cuspidal-support range. The proof uses the discrete-spectrum counting bound of §4.5a in place of the cuspidal one; mere discreteness, finite multiplicity or a general trace-class ideal theorem does not supply it. (BPLZZ §3.4, Remark 3.20, pp.30–31; bplzz line 1459.)

A proof route is as follows. Obtain the refined decomposition by splitting the discrete inducing spaces of AutomorphicSpectralTheory §§4.1–4.2 into σ-isotypic parts, using AutomorphicSpectralTheory §4.3 (completeness) and AutomorphicSpectralTheory §4.4 (residual spectrum). Repeat the Casimir interpolation and typical-data finiteness of Layer 4 with the discrete-spectrum polynomial bound of §4.5a in place of the cuspidal bound. Repeat mixed separation and scalar normalization with these refined components.

*Needs:* §5.3; §5.1; §4.5a; §2.15a; AutomorphicSpectralTheory §§4.1–4.4.

**Checks.**

- For PGL₂ choose the T-character of the Borel family induced from the trivial torus character at λ=it. The permitted refined range includes that continuous Borel component and excludes the residual constant representation. In the coordinate ρ=1/2 the invariant polynomial q(λ)=λ²−1/4 has values −t²−1/4 for λ=it and 0 for the residual character λ=ρ, so they differ even at t=0. No T-character keeps the residual representation while killing the Borel component: its character already occurs in that datum at λ=ρ. Both components have the same coarse cuspidal support.

- When refined and coarse data coincide, their permitted range sums agree; the refinement does not create extra components.

### Examples

For a full-group unwanted datum with the same infinitesimal character, choose a spherical h whose values at the datum and target are 2 and 3. A sharp seed normalized to 1 at the target times h−2 has values 0 and 1. If an archimedean selector has value 2 and this mixed selector has value 3 at the target, their product has value 6 and division by 6 gives value 1. The nonzero value is established before division. The multiplier may still take other values within a surviving continuous block.

### Dependencies

Layer 4 and the earlier symbol and Schwartz-action layers; AutomorphicSpectralTheory §§1.6–1.10 and Layer 4; SmoothRepresentationsOfLocalGroups SR.4; AutomorphicLFunctionsAndLocalFactors AL.R.4 and AL.3.7.2 only for §5.6.

## Downstream consumers

Relative period comparisons, such as GanGrossPrasadUnitaryGroups §§6.2a–6.4, use the T-multipliers of §4.3, the isolation theorems of §§5.3 and 5.6, relative-character convergence (§3.1), cuspidal-support projections (§§3.3–3.4) and the Schwartz kernels with their spectral expansion (§§3.8–3.10). The theorem that base-change-compatible multipliers preserve matching and smooth transfer (BPLZZ §4.2, Proposition 4.8) is GanGrossPrasadUnitaryGroups §6.3a, which uses the scalar multiplier action of §4.3 and the symbol pullback of §0.5. Automorphic applications can use the non-CAP endpoint without an auxiliary supercuspidal local factor; a prescribed representation need not already occur in the automorphic spectrum.

## Worked examples

For the compact real torus U(1), θ={−1} and Y=ℤ. The constant symbol is moderate but fails sharpness. The damped sinc symbol exp(z²)sin(πz)/(πz), with value 1 at 0, is sharp and retains the trivial character. At z=1 it has value 0 and at z=0 it has value 1; treating the sharp algebra as unital loses this finite-support condition. In contrast a split torus has θ={1}, Y={0}, so sharpness adds no lattice restriction.

For G=GL₂ and an inducing pair of distinct Hecke characters, the relative Weyl stabilizer is trivial and the regular weighted constant-term theorem applies. With repeated characters it has order 2, and that theorem's regularity hypothesis fails. The residual constant representation and continuous Eisenstein spectrum can share a coarse torus cuspidal-support component; §5.7 uses discrete Langlands data to refine it. Thus neither the coarse isolation theorem nor its value-one normalization is an orthogonal-projector statement.

## References

All statements are in the author's own words. Page numbers for BPLZZ and Lapid refer to the specified preprints; BPCZ uses published journal pagination. The source identifiers bplzz, bpcz and lapid label line-numbered extractions of the linked PDFs, whose SHA-256 digests are, respectively, f2834146d4fee02b38c4849ee9a7ef76a3dbc1131e7eef799e6f95b0f0d0ac13, a07a6143d3e71f1eca31b6ba9b774bec325a7de07c7417b7796486a77df13794 and ae1ab291ef50ca55c6d89334bb604c0795ce2f326ed017ad2573ec4538618390. The section, theorem and page locators also identify each claim independently of those extractions.

- **BPLZZ** (`bplzz`): Raphaël Beuzart-Plessis, Yifeng Liu, Wei Zhang and Xinwen Zhu, [Isolation of cuspidal spectrum, with application to the Gan–Gross–Prasad conjecture](https://arxiv.org/abs/1912.07169v3), arXiv:1912.07169v3 (2021 version). §§2.1–2.4, pp.9–21; §§3.1–3.4, pp.21–31; §4.2, pp.33–35; Appendix A, pp.43–45. The cited theorem numbering is the preprint's.
- **BPCZ** (`bpcz`): Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, [The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case](https://doi.org/10.1007/s10240-021-00129-1), Publications mathématiques de l’IHÉS 135 (2022), 183–336. §§2.4–2.5, pp.202–221; §§2.8.4–2.10.2, pp.227–243.
- **Lapid** (`lapid`): Erez M. Lapid, [On the Harish-Chandra Schwartz space of G(F)∖G(𝔸)](https://www.esi.ac.at/preprints/esi2403.pdf), ESI preprint 2403 (2013). §2; §3.6, pp.19–20; Theorem 4.5, p.22; Proposition 5.1, pp.22–24; Corollaries 5.7–5.8, pp.25–26; §6, pp.26–28.
- **Bernstein** (`bernstein`): Joseph N. Bernstein, [On the support of Plancherel measure](https://doi.org/10.1016/0393-0440(88)90024-1), Journal of Geometry and Physics 5(4) (1988), 663–710. §§3.4–3.5, pp.685–689; the specific quotient uses are also located at BPCZ §2.5.5 and §2.5.12, bpcz line 1270 and line 1402.

The theorems of Delorme [Del86, Théorème 1.7], Sakellaridis [Sak, Theorem 2.1.2], Aizenbud–Gourevitch [AG10, Corollary 2.6.3], Trèves [Trè67, Theorem 34.1], Donnelly [Don82, Theorem 9.1] and Müller [Mül89, Theorem 0.1] are located at their uses in BPLZZ Appendix A and §§3.3–3.4 (bplzz line 2099 to line 2198, line 1267 and line 1460), with bibliographic entries at bplzz line 2204, line 2235, line 2237, line 2294, line 2305 and line 2307. Arthur's [Art78] Lemma 4.1, Corollary 4.2 and §4 are located at their uses in BPCZ §§2.8.4 and 2.10.2 (bpcz line 2059 and line 2480), and the Müller–Speh bounds [MS04, Propositions 3.3 and 4.2] and Brumley's lower bound at their uses in Lapid §§3.4–3.5 and Appendix A (lapid line 619, line 647, line 724 and line 1178). They are targets here (§§1.1, 1.2a, 3.2, 3.6a and 4.5a) at the generality of those uses. The Kostant and minimal-type inputs are consumed through the supplier contracts and their uses in BPLZZ §2.4; these uses do not supply a more general theorem than those contracts state.
