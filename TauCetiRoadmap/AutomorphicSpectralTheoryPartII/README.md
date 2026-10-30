# Roadmap: automorphic spectral theory and trace distributions, part II

**Summary.** Build the Schwartz multiplier method for a connected reductive group over a number field: finite-order entire interpolation produces symbols with controlled growth on real-form spectral lattices; real harmonic analysis turns them into continuous Schwartz multipliers; polynomial cuspidal counting and spherical Hecke separation give a multiplier normalized at any prescribed spectral character. Its automorphic range lies in the cuspidal-support components where that character occurs. Weighted quotient spaces, cuspidal-support projections, regular wave packets and Schwartz kernel expansions provide the analytic interfaces. The principal endpoints are BPLZZ Theorem 2.13 and Theorems 3.6–3.7 and 3.19, together with the weighted and spectral results of BPCZ §§2.5 and 2.9–2.10.

## Scope and ownership

AutomorphicSpectralTheory §§0.11–0.15, 1.6–1.10, Layers 2–4 and §§6.1–6.4 supplies generic locally convex analysis, normalized cuspidal data, pseudo-Eisenstein series, intertwiners, spectral decomposition, compact Paley–Wiener multipliers and compact-test kernels. That roadmap stops before the moderate-symbol Schwartz multiplier theorem and the weighted quotient Schwartz spectral extensions built here. Its generic definitions and compact theorems are imported rather than restated as targets. The discrete-data variant in §5.7 retains its additional polynomial-counting hypothesis. AutomorphicSpectralTheory §§5.1–5.9 owns Franke’s admissible-weight spaces on [G]. Sections 2.6 and 2.14 here use BPCZ’s arbitrary comparable measurable weights on [G]_P: at P=G, after matching central quotient, measure and level, the individual smooth weighted-L² stages agree with Franke’s S_p when w=p², and §2.14 forms the specified intersections and unions of those stages.

AutomorphicFormsOnReductiveGroups §§0.1–0.5 owns smooth adelic functions, the adelic test Schwartz algebra, uniform moderate growth and smoothing; §§2.1–2.4 and 2.7 owns real representations, induction, infinitesimal characters, globalizations and the continuous nondegenerate integrated Schwartz action; §§3.4–3.5 owns restricted tensor factorization; §§4.1–4.2 owns constant terms and cuspidal realizations. Here the real/adelic comparisons are topology and multiplier compatibility statements, and the growth spaces add specified quotient weights. The generic Kostant centralizer and principal-series inputs belong to its real representation layer; §1.4 retains only their rational-difference spectral comparison. Generic SF closed-subspace and globalization theory is not rebuilt here. SpectralManifolds SM3 owns the Fréchet open mapping theorem and closed-subspace quotient topology; §§2.5 and 2.18 apply them to the specified SLF stages.

AdelicAlgebraicGroups §§2.1–2.3, 3.1 and 3.4–3.6 owns heights, quotient measures, split-centre conventions, Iwasawa and reduction theory; §§4.6–4.7 owns compact central quotients and character theory. SmoothRepresentationsOfLocalGroups SR.1–SR.4 owns finite-place Hecke algebras, normalized induction, Jacquet modules and Satake theory. AutomorphicLFunctionsAndLocalFactors, preparatory **GLₙ isobaric sums** (anchor isobaric-construction), and AL.3 **Strong multiplicity one for isobaric sums**, owns the GLₙ construction and uniqueness inputs. The quotient-weight applications and spectral interpolation are owned here.

ReductiveGroups Layer 7 and LieGroups Layer 7 own the group root datum and real descent. The finite involution coset and its shifted spectral lattices in §0.4 specialize those structures. NoncommutativeGeometry N1 owns completed projective tensor products. OperatorTheory/SelfAdjointSpectralTheory Parts A–E owns generic spectral calculus; OperatorTheory/OperatorIdeals OI-B32–OI-B41, OI-B84 and Part C owns Hilbert–Schmidt and trace-class tools. BanachSpaceTheory B4 owns the nuclear Banach-operator carrier and its isometric Hilbert trace-class comparison. PDE Lane A owns local Sobolev analysis. The quotient nuclear inclusions and spectral realizations here differ by their automorphic weight and support estimates.

GlobalHolomorphicFunctions, **Preparatory primary factors and locally uniform products**, owns the elementary factors, locally uniform product construction and exact zero divisor. Here §0.2 adds the fixed-genus finite-rank global growth bound, including rank zero and an origin factor. The native formulas in Suggested.lean spell the supplied product for this acceptance test. ZerosOfLFunctions, standing **finite order** convention and Layer 5.1–5.6, owns order bounds and genus-one Hadamard theory; the predicate in §0.2 is only the existential integral global-bound specialization needed for interpolation. ModularCurvesPartII §1.4a, **Lattice sigma function**, owns the rank-two period-lattice sigma specialization. No Hadamard factorization or elliptic sigma theory is developed here.

Mathlib supplies Euclidean Schwartz functions, entire holomorphy, exponential and polynomial evaluation, unordered sums/products, almost-everywhere Lp classes and algebraic centroids. Their generic definitions are not targets here. CongruenceSpectralGap Layers 0–5 (from the congruence quotient and positive spectrum to the parameter bound and congruence gap) owns the congruence Laplacian gap, including its continuous threshold and curvature normalization. GanGrossPrasadUnitaryGroups §§6.3–6.4 owns relative period applications and trace comparison. Its §6.4 application needs a separate theorem that base-change-compatible multipliers preserve smooth transfer (BPLZZ §4.2, Proposition 4.8, pp.34–35; bplzz line 1685). That theorem is outside this Part II’s scope and belongs with the relative comparison; §4.3 here supplies only the scalar multiplier action it needs.

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

Consume §§0.11–0.15 for nuclear Fréchet/LF adapters, integration, summation, kernel and vector-family analysis; §§1.5–1.10 and 3.1–3.4 for normalized cuspidal data and compact pseudo-Eisenstein inner products and constant terms; Layers 2–4 for intertwiners, the automorphic Hilbert decomposition and residual data; §§6.1–6.4 for compact Paley–Wiener multipliers and kernels. In particular §0.12 supplies quasi-complete-target integration, and §0.15 supplies weak-to-strong holomorphy for locally bounded families by taking scalar source ℂ and denominator 1. Their central quotient, dual measures and finite-type stages must be transported to the conventions above. Compact Paley–Wiener alone is not the rapid-symbol multiplier input.

What AutomorphicSpectralTheory must provide (gap:nash-schwartz-analysis): Supply the Nash Schwartz product and embedding comparison on real algebraic groups used in §§1.1 and 2.15.

The section contract is §0.14.

What AutomorphicSpectralTheory must provide (gap:tensor-holomorphy): Supply holomorphy of the completed projective tensor of two locally bounded holomorphic families in complete nuclear Fréchet spaces.

The section contract is §0.15.

What AutomorphicSpectralTheory must provide (gap:slf-isotypic-sums): Supply the countable K_f-isotypical direct-sum description of an SLF representation for a fixed compact open K_f in G(𝔸_f), with Fréchet summands and the induced direct-sum topology on closed invariant subspaces.

The section contract is §0.11.

What AutomorphicSpectralTheory must provide (gap:frechet-bilinear-continuity): Supply joint continuity of separately continuous bilinear maps from a product of two complex Fréchet spaces to a Hausdorff locally convex space.

The section contract is §0.11.

What AutomorphicSpectralTheory must provide (gap:rapid-semisimple-centre): Supply the semisimple rapid-symbol multiplier from compact smooth finite-K-type stages to Schwartz stages of a semisimple real reductive group, for W-invariant rapidly decreasing symbols.

The section contract is §§6.1–6.3.

What AutomorphicSpectralTheory must provide (gap:split-centre-fourier-laplace): Supply the Fourier–Laplace multiplier of a rapidly decreasing symbol on a split real torus, continuous on each fixed finite-type, fixed-support Schwartz stage.

The section contract is §§6.1–6.3.

What AutomorphicSpectralTheory must provide (gap:cuspidal-data-central-comparison): Compare Weyl-and-twist normalized cuspidal data, with twists and inducing parameters in the relative space (a_M^G)*, and pseudo-Eisenstein spans with the full split-central-character convention and intermediate compact smooth quotient data, preserving quotient measures.

The section contract is §§1.6–1.10, 4.1–4.4.

What AutomorphicSpectralTheory must provide (gap:hereditary-intertwining-bounds): Supply the normalized-intertwiner comparison and hereditary polynomial parameter and derivative estimates (HP), including (UT) and (WR) for every Levi, unconditionally for finite products of restrictions of scalars of GL_n.

The section contract is §§2.3–2.5, 3.1–3.4.

What AutomorphicSpectralTheory must provide (gap:refined-langlands-discrete-data): Supply the decomposition of the fixed-level central-character L² space by Langlands discrete data (M,σ) with σ discrete, with its normalized-twist and Weyl equivalence, central disintegration and residual summands explicit.

The section contract is §§4.11–4.14.

What AutomorphicSpectralTheory must provide (gap:discrete-spectrum-casimir-counting): Supply the fixed-level finite-K-type polynomial bound for the number, with multiplicity, of discrete-spectrum Casimir eigenvalues of absolute value at most R.

The section contract is §§4.7–4.9.

What AutomorphicSpectralTheory must provide (gap:compact-eisenstein-comparison): Identify the supplied compact cuspidal pseudo-Eisenstein inner-product and Weyl/intertwining constant-term formulas and their measures with the BPCZ and Lapid parameter conventions used in §3.6.

The section contract is §§1.5–1.8, 3.1–3.4.

What AutomorphicSpectralTheory must provide (gap:arthur-factorization-comparison): For each normal compact open K₀⊂K_f and each m≥1, supply Z∈U(g∞), a smooth compactly supported g₁ and a compactly supported g₂ of class C^m, both invariant under K∞-conjugation and bi-K₀-invariant, with f=f*g₁+(f*Z)*g₂ for every bi-K₀-invariant Schwartz function f, the choice depending only on K₀ and m.

The section contract is §6.3.

What AutomorphicSpectralTheory must provide (gap:compact-kernel-central-comparison): Identify the compact-test parabolic kernels `K_f,P` and their support components `K_f,P,χ` with the quotient measures and pairing convention of §3.8, and prove `K⁰_f,P,χ(x,y) = ∫ K_f,P,χ(x,ay) δ_P(a)^(−1/2) da`, the integral over `a ∈ A_P∞`, for compactly supported smooth f.

The section contract is §6.4.

What AutomorphicSpectralTheory must provide (gap:compact-kernel-spectral-comparison): Supply the compact-test spectral expansion of the support component `K⁰_f,χ` by discrete-inducing Eisenstein series used in §3.10, with its sum over χ, standard P and K-types, coefficient `|𝒫(M_P)|^(−1)`, conjugated second Eisenstein factor and dual Haar measure on the imaginary relative space `i(a_P^G)*`.

The section contract is §6.4.

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

What AutomorphicFormsOnReductiveGroups must provide (gap:cuspidal-polynomial-counting): Supply the fixed-level finite-K-type polynomial cuspidal elliptic eigenvalue-count bound with multiplicity on derived semisimple quotients, including arbitrary-level reduction through finitely many conjugate levels and the Casimir-sign comparison.

The section contract is §4.2.

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

Consume the preparatory **GLₙ isobaric sums** (anchor isobaric-construction) for normalized isobaric construction, and AL.3 **Strong multiplicity one for isobaric sums** for uniqueness, including arbitrary unramified norm twists and multiplicities of cuspidal constituents. Equality at almost all unramified places identifies the inducing multiset in §5.6, not an arbitrary irreducible constituent of an induction.

### From TauCetiRoadmap.SpectralManifolds

Consume SM3, **Smooth projective modules, functions and spectral measure**, for the open mapping theorem between complete metrizable locally convex complex spaces and the topology and completeness of quotients by closed linear subspaces. Applied to a continuous linear map of Fréchet spaces with closed image, it identifies the quotient by its kernel topologically with that image. Sections 2.5 and 2.18 use this theorem on fixed-level Fréchet stages.

## How to read the build

Layer 0 constructs analytic zero sets and spectral symbol algebras independently of the automorphic quotient. Layer 1 realizes these symbols as real Schwartz multipliers and compares their adelic stages. Layer 2 develops weighted quotient analysis and the constant-term maps. Layer 3 extends support projections, regular wave packets and kernels to these spaces. Layer 4 combines polynomial counting with interpolation to leave finitely many cuspidal-support blocks. Layer 5 separates the remaining unwanted blocks using finitely supported spherical operators and normalizes at the target character. Every subsection lists the inputs to both its statement and the indicated proof route; alternative proofs can use fewer route inputs. Suggested.lean states the three analytic headlines on native carriers; its module docstring names the automorphic headlines and their missing carriers.

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

A proof route is as follows. Define the extended seminorm family before restricting to its finite domains. Use polynomial absorption to compare real and integral exponents and prove algebra closure.

*Needs:* §0.4; Mathlib `Differentiable`.

**Checks.**

- On ℂ, exp(z) is moderate on vertical strips although it has exponential growth on the real axis.

- On ℂ, exp(−z²) is not moderate on vertical strips.

- For Θ={−1} with Y=ℤ and μ(z)=exp(z), the ratio eⁿ/(1+n)^d tends to ∞ as n→+∞ for every d, so μ is not in MΘ, although exp(z) is moderate for Θ={1} on a line; a separate bound at each integer, without a uniform exponent, would wrongly admit it.

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

Take the real-group factor of AutomorphicFormsOnReductiveGroups §0.3. Its elements are smooth functions for which Df is bounded for every algebraic differential operator D on G(ℝ). The seminorm topology is nuclear Fréchet and equals the topology defined by ‖Df‖₂ for all algebraic D, using distributional derivatives for the converse. The comparison is with Nash Schwartz functions, not merely Harish-Chandra C²(G). There is a continuous inclusion `S(G)⊂⋂_{p>0}C^p(G)`, with equality precisely when the algebraic centre of G is compact at the real points. For an additive real vector group the resulting polynomial derivative conditions agree with Mathlib SchwartzMap. (BPLZZ §2.3, definition and Remarks 2.11–2.12, pp.11–12; bplzz line 522).

A proof route is as follows. Compare algebraic differential operators to polynomially weighted invariant derivatives in finitely many algebraic charts. Use local Sobolev estimates and polynomial volume growth in algebraic height for the L²/bounded comparison; identify the required Nash chart and partition input in nash-schwartz-analysis. Use the standard comparison with Harish-Chandra seminorms, keeping the noncompact central directions.

*Needs:* AutomorphicFormsOnReductiveGroups §§0.1–0.5; Mathlib `SchwartzMap`; AutomorphicSpectralTheory §§0.11–0.15; nash-schwartz-analysis; PDE Lane A.

**Checks.**

- On a split real torus, decay in the logarithm of the torus coordinate alone does not give Nash Schwartz decay.

- For a compact real reductive group this space is C∞ with its usual topology.

### 1.2 Schwartz integration on moderate representations

For a smooth moderate-growth Fréchet representation V of G(ℝ), use the continuous nondegenerate integrated Schwartz action supplied by AutomorphicFormsOnReductiveGroups §2.7. Under the Schwartz-algebra comparison of §1.1, prove that it agrees with π(f)v=∫_G f(g)π(g)v dg in the conventions here, including the left/right differentiation identities with L(X)f(g)=d/dt f(exp(−tX)g). Transport its continuity, convolution law π(f₁*f₂)=π(f₁)π(f₂) and agreement with compactly supported integration along that comparison. For irreducible admissible π use the supplied Casselman–Wallach globalization. Prove that equality of the transforms on all such π detects an element of S(G). (BPLZZ §2.3, before Theorem 2.13, p.12; §2.4, proof of Proposition 2.24, pp.17–19; bplzz line 532).

A proof route is as follows. Compare the supplied Schwartz algebra with §1.1, identify the actions on compactly supported functions, and use density and their supplied continuity to extend that equality. Compare the differentiated actions by integration by parts with the specified left regular sign; the convolution law is transported from the supplier. For detection use the faithful regular representation and the real Plancherel decomposition requested in real-plancherel-decomposition: an element of S(G) whose transforms all vanish has zero L² norm.

*Needs:* §1.1; AutomorphicFormsOnReductiveGroups §0.3 (Schwartz algebra and compact-test density), §§2.1–2.4, 2.7 (integrated action and globalization); real-plancherel-decomposition.

**Checks.**

- On the additive line with π_t(x)=exp(itx), π_t(L(X)f)=itπ_t(f): at t=1 and t=2 the factors are i and 2i. The opposite derivative sign gives −i and −2i.

- For π_t(x)=exp(itx), the imported action and the compared action both have scalar ∫f(x)exp(itx)dx. With Lebesgue measure, at t=0 and f(x)=exp(−πx²), both scalars are 1; on the group with one element and mass-one measure, both actions send (f,v) to f(1)v.

### 1.3 Delorme multipliers for reductive real groups

For μ∈N(h*ℂ)^W and compactly supported smooth bi-K-finite f on a real reductive algebraic group, there is a unique bi-K-finite Schwartz function μ⋆f with π(μ⋆f)=μ(χπ)π(f) for every irreducible admissible π. For every fixed finite left/right K-type set and compact-support stage, the map is continuous to the corresponding finite-K-type Schwartz space. The output need not be compactly supported. The W-invariance hypothesis is mandatory. (BPLZZ Appendix A, Proposition A.1 and Lemma A.2, pp.43–45; §2.4, p.17; bplzz line 2099).

A proof route is as follows. Use Delorme’s semisimple rapid-symbol theorem as the exact requested AutomorphicSpectralTheory §§6.1–6.3 strengthening rapid-semisimple-centre, and the split-torus multiplier split-centre-fourier-laplace; compact Paley–Wiener alone is not declared to supply it. Write the identity component as (Z⁰×G_der⁰)/(Z⁰∩G_der⁰), use fixed K-type/support completed tensor products, and descend finite-kernel invariants. Split-centre Fourier–Laplace theory and the Nash Schwartz product comparison nash-schwartz-analysis identify the rapid-symbol tensor factors (Lemma A.2); extend separately continuous bilinear maps between the fixed Fréchet stages jointly, then use AutomorphicSpectralTheory §§0.11–0.15 tensor universality. Extend to finitely many components by K/K⁰.

*Needs:* §0.6; §1.2; AutomorphicSpectralTheory §§6.1–6.4; AutomorphicSpectralTheory §§0.11–0.15; rapid-semisimple-centre; split-centre-fourier-laplace; nash-schwartz-analysis; NoncommutativeGeometry N1.

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

Layer 0; AutomorphicFormsOnReductiveGroups §§0.3, 2.1–2.4, 2.7; AutomorphicSpectralTheory §§0.11–0.15 and 6.1–6.3; NoncommutativeGeometry N1; the Plancherel, tempered-strip, tensor-character, rapid-centre, split-centre and Nash product contracts.

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

Define an adelic SLF representation to be a smooth finite-adelic representation V=⋃_J Vᴶ whose fixed-level spaces are SF Fréchet representations of G∞, with compatible actions, closed level inclusions and the indicated locally convex inductive-limit topology. Compare this with the K_f-isotypical direct-sum model for a fixed compact open K_f⊂G(𝔸_f) supplied by AutomorphicSpectralTheory §0.11 and the SF smooth topology of AutomorphicFormsOnReductiveGroups §2.7. Apply the closed-subspace and open mapping results of SpectralManifolds SM3 at the Fréchet stages to obtain the SLF closed invariant subspace and quotient-to-closed-image results. The imported integrated Schwartz action agrees with compact integration; for a continuous moderate-growth Fréchet representation before taking smooth vectors, its smooth vectors equal S(G(𝔸))·V. Closed image alone does not imply injectivity. (BPCZ §§2.5.3–2.5.4, (2.5.3.2), Lemma 2.5.4.1, pp.209–211; bpcz line 1170).

The defining construction has the following API.

- The inclusion of V^J is a closed topological embedding with its specified SF topology.

- A closed invariant subspace inherits the SLF structure and its induced topology.

- Schwartz integration agrees with the compact action and respects all level transitions.

*Needs:* §1.9; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; AutomorphicSpectralTheory §§0.11–0.15; SpectralManifolds SM3; slf-isotypic-sums; frechet-bilinear-continuity.

**Checks.**

- With trivial finite-adelic factor, SLF reduces to the given SF Fréchet representation.

- For the trivial one-dimensional representation, every fixed-level space is ℂ and every transition is the identity; the SLF conditions hold.

- The zero map from a nonzero SLF representation has closed image but is not an embedding; the quotient-to-image statement handles it correctly.

- For z↦2z on ℂ, the open unit disc maps onto the disc of radius 2 and the kernel is zero. For the zero map ℂ→ℂ, the kernel is ℂ and ℂ/ℂ and its image are both the zero space; identifying the original domain with that image would be false.

- Closed image implies an embedding only after adding injectivity, or after quotienting the kernel.

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

*Needs:* §2.6; §2.4; §1.9; AdelicAlgebraicGroups §§3.1, 3.4–3.6; local-sobolev-evaluation; nash-schwartz-analysis.

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

For each finite level J the spaces S([G]_P)^J and C([G]_P)^J are nuclear Fréchet. For two quotient data and product finite level J₁×J₂, multiplication of pure tensors induces topological isomorphisms `S(X₁)^J₁⊗̂πS(X₂)^J₂≅S(X₁×X₂)^{J₁×J₂}`, and the analogous C isomorphism. Use compatible product heights and product quotient-volume functions. Continuous sesquilinear or bilinear forms extend by the corresponding completed projective universal property. Passing to all levels must be checked through the strict stage system. (BPCZ §2.5.12, (2.5.12.10)–(2.5.12.11), p.215; bpcz line 1402).

A proof route is as follows. Apply the nuclear smooth inclusions to the projective-limit seminorm systems. Prove density of product smooth functions and identify all product derivative seminorms; use the existing AutomorphicSpectralTheory §§0.11–0.15 completed tensor theory.

*Needs:* §2.10; §2.11; §2.8; AutomorphicSpectralTheory §§0.11–0.15; nash-schwartz-analysis; NoncommutativeGeometry N1.

**Checks.**

- The result is a completed topological tensor product, including for more than one real place.

### 2.16 Constant terms and pseudo-Eisenstein extensions

For P⊂Q extend the AutomorphicFormsOnReductiveGroups §§4.1–4.2 constant term CT_P^Q and construct the intermediate pseudo-Eisenstein map EP_P^Q by summation over P(F)∖Q(F). At Q=G compare it on the common domain with the Paley–Wiener pseudo-Eisenstein series of AutomorphicSpectralTheory §1.6. With compatible normalized quotient measures prove continuity on the following spaces: EP:S₀([G]_P)→S₀([G]_Q), CT:T₀([G]_Q)→T₀([G]_P), EP:S([G]_P)→S([G]_Q), and CT:T_N([G]_Q)→T_N([G]_P). They are adjoint under the integral pairing. There is c>0 such that for every N≥0, `φ↦sup_x δ_P^Q(x)^{cN}n_P(x)^N|CT_P^Qφ(x)|` is a continuous seminorm on S₀([G]_Q). This weighted estimate does not assert unweighted rapid decay of CTφ along all split-central directions. (BPCZ §2.5.13 and Lemma 2.5.13.1, pp.215–216; bpcz line 1415).

A proof route is as follows. Use compactness of the adelic unipotent quotient for CT and finite-overlap estimates for EP; derive the weighted estimate on Siegel domains. Extend by the measure pairing and integrate by parts for derivatives, agreeing with the supplied operators on compact vectors.

*Needs:* §2.10; §2.12; §2.13; AutomorphicFormsOnReductiveGroups §§4.1–4.2; AutomorphicSpectralTheory §§1.5–1.10; cuspidal-data-central-comparison.

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

Layer 1’s Schwartz-action comparison; AdelicAlgebraicGroups §§2.1–2.3, 3.1, 3.4–3.6; PDE Lane A; OperatorTheory/OperatorIdeals; BanachSpaceTheory B4; AutomorphicSpectralTheory §§0.11–0.15, 1.6–1.10; SpectralManifolds SM3; NoncommutativeGeometry N1.

## Layer 3: Cuspidal support, wave packets and Schwartz kernels

### 3.1 Relative characters of Schwartz functions

Let π be a discrete automorphic representation of a Levi, `A_{P,π}(G)` its smooth induced space, B a continuous sesquilinear form on that space, and Ω a compact subset of `a_P^{G,*}`. For f∈S(G(𝔸)) and a K-orthonormal basis 𝔅, `Σ_{v∈𝔅}I_P(λ,f)v⊗overline(v)` converges absolutely in `A_{P,π}⊗̂π overline(A_{P,π})`, uniformly on Re λ∈Ω. The resulting tensor and J_B(λ,f)=Σ_v B(I_P(λ,f)v,v) are basis independent. For each fixed finite support/level stage there is a continuous seminorm p with |J_B(λ,f)|≤p(f) throughout that strip. The functional also extends to C_c^r at sufficiently large r, with derivative degree bounded by r. The basis is a union of finite-dimensional K-type orthonormal bases. (BPCZ §2.8.4, Proposition 2.8.4.1 and Remark 2.8.4.2, pp.227–229; bpcz line 1980).

A proof route is as follows. Use compact-picture induction and polynomial bounds for K-type dimensions and seminorms in terms of the compact Casimir, as requested in k-type-growth; use AutomorphicSpectralTheory Layer 4 for the discrete inducing representation. Move arbitrarily high powers of the compact Casimir to f and sum their inverse powers over K-types; all seminorm estimates are uniform in the imaginary parameter on the indicated real strip. Apply the completed tensor universal property to B; finite-dimensional invariance on each type proves basis independence.

*Needs:* §1.9; AutomorphicSpectralTheory §§0.11–0.15; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; AutomorphicSpectralTheory Layer 4; k-type-growth; tensor-holomorphy; NoncommutativeGeometry N1.

**Checks.**

- The second tensor factor is the conjugate space, as required for a sesquilinear B.

- A compact real-part range still allows an unbounded imaginary parameter.

- With B the Petersson form, J_B(λ,f)=tr I_P(λ,f); f=0 gives 0. On a one-dimensional K-type with operator a·id, a unit vector gives a and replacing it by twice that vector gives 4a. A unitary change of orthonormal basis preserves the sum; an arbitrary basis does not.

### 3.2 Arthur’s finite differentiability factorization

Use the supplied Arthur factorization at fixed normal compact open K₀⊂K_f: for each m≥1 take Z∈U(𝔤∞), g₁∈C_c∞ and g₂∈C_cᵐ, invariant under K∞ conjugation with g_i bi-K₀-invariant, and f=f*g₁+(f*Z)*g₂ for every bi-K₀ Schwartz f. The choice depends on K₀,m, not f; Z is not assumed central. For m sufficiently large prove the factorized relative-character identity J_B(λ,f)=Σ_v B(I_P(λ,f)v,I_P(−conj λ,g₁*)v)+Σ_v B(I_P(λ,f*Z)v,I_P(−conj λ,g₂*)v), with absolutely convergent sums. Both sums use the same orthonormal K-basis as §3.1. The general factorization belongs to AutomorphicSpectralTheory §6.3; its extension to this relative-character formula is the target here. (BPCZ §2.8.4, Proposition 2.8.4.3, p.229; bpcz line 2043).

*Needs:* §3.1; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; AutomorphicSpectralTheory §§6.1–6.4; arthur-factorization-comparison.

**Checks.**

- The second slot uses −λ̄ and conjugate inversion: `I_P(λ,g)*=I_P(−conj λ,g*)`. At λ=it this parameter is again it; at λ=1 it is −1. In the additive model I(λ,x)=exp(λx), for g=1_[0,1] one obtains I(1,g)*=e−1 and I(−1,g*)=e−1, whereas I(1,g*)=1−e⁻¹. Smooth compact approximations give the same separating test.

- On a one-dimensional K-type let B(u,v)=u·conj(v), A=2 and T=i. Then B(AT·1,1)=2i=B(A·1,T*·1), with T*=−i; using T instead in the second slot gives −2i.

### 3.3 Cuspidal support in weighted function spaces

Import X(G), the Weyl-associate normalized cuspidal data, from AutomorphicSpectralTheory §1.9, and its orthogonal decomposition from AutomorphicSpectralTheory §1.10. If a weight factors through A_P∞, define `L²_{w,X}` as the orthogonal sum of the blocks indexed by X⊂X(G); these projections agree for different such weights on intersections. Define S_X=S∩L²_X. For an arbitrary quotient weight and `F∈{L²_w,C,T_N,T,S_{w,N},S_w}`, define F_X as the annihilator of `S_{Xᶜ}` under the integral pairing. The notation therefore records cuspidal support, not necessarily Hilbert orthogonality for that weight. CT and EP preserve this support with the finite-to-one map X(M_P)→X(G). (BPCZ §§2.9.1–2.9.3, (2.9.2.1)–(2.9.2.2), Lemma 2.9.3.1, pp.229–232; bpcz line 2063).

The defining construction has the following API.

- F_X is precisely the annihilator of `S_{Xᶜ}` in the indicated integral pairing.

- On intersections of A_P-weighted L² spaces, the original projections agree.

- CT and EP respect the inverse image or image of a support subset under the normalized datum map.

A proof route is as follows. Compare the normalized cuspidal-datum convention to AutomorphicSpectralTheory §1.9 rather than introducing another quotient of pairs. Use the dense pseudo-Eisenstein span to compare A_P-weight projections; define arbitrary-weight support by annihilation. Use CT/EP adjunction and compact A_P cutoffs to prove support compatibility.

*Needs:* AutomorphicSpectralTheory §§1.5–1.10, in particular §1.10 (orthogonal cuspidal-data decomposition); §2.16; §2.14; §2.11; cuspidal-data-central-comparison.

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

A proof route is as follows. Use the compact-data pseudo-Eisenstein inner-product formula, with the normalization comparison requested in compact-eisenstein-comparison, and regularity to cancel all nonidentity stabilizer terms. Compare the two Hilbert norms, extend by density, and take adjoints to obtain the L² constant-term bound within this node. Combine the large-positive-s constant-term estimate with weighted Hölder interpolation to reach Re s>0; derivatives and weak holomorphy plus local boundedness give locally convex holomorphy by AutomorphicSpectralTheory §0.15, specialized to scalar source ℂ.

*Needs:* §3.5; §3.4; §2.16; AutomorphicSpectralTheory §§0.11–0.15; AutomorphicSpectralTheory §§3.1–3.4; compact-eisenstein-comparison.

**Checks.**

- The normalization exponent is s−1/2, not s or s+1/2.

- For the GL₂ Borel and δ_P=4, the multiplier at s=1 is 2, while the normalization at s=0 is 1/2; the latter boundary value is not a claim of Harish-Chandra decay.

### 3.7 Lapid expansion of Harish-Chandra Schwartz functions

Let G be a connected reductive group over F satisfying Lapid’s hereditary property (HP): G and every Levi satisfy (UT) and (WR), as in Lapid §3.6, lapid line 801. Let χ be a regular datum represented by (M_P,π). Write Π=I_P^Gπ. There is N>0 such that for every φ∈C([G]) and λ∈ia_P*, the series `φ_{Πλ}=Σ_{v∈𝔅}⟨φ,E(v,λ)⟩ E(v,λ)` is defined, basis independent, and converges absolutely in T_N([G]). The map `λ↦φ_{Πλ}` is Schwartz with values in T_N, using all parameter derivatives, and if φ∈C_χ then `φ=∫_{ia_P*}φ_{Πλ}dλ`. The exponent N is uniform in λ and φ. The hereditary-intertwining-bounds contract supplies (HP) unconditionally for finite products of `Res_{K_i/F}GL_{n_i}`. (BPCZ §2.9.8, Theorem 2.9.8.1, pp.238–239; Lapid Theorem 4.5, p.22, Proposition 5.1, pp.22–24, Corollary 5.7, pp.25–26; lapid line 924, line 933 and line 1069; bpcz line 2394).

A proof route is as follows. Import the exact polynomial derivative bounds for normalized intertwiners and Eisenstein series under (HP) in hereditary-intertwining-bounds; finite products and restriction of scalars preserve the needed GL_n contracts. Factor φ by a compact smooth convolution and use the relative-character basis estimates with Lapid’s Eisenstein majorization for uniform convergence and parameter derivatives. Apply Lapid Theorem 4.5 on inversion of cuspidal wave packets; regularity places the whole χ-block in its induced-from-cuspidal image.

*Needs:* §3.1; §3.5; §3.4; §2.11; AutomorphicSpectralTheory §§2.1–2.5; AutomorphicSpectralTheory §§3.1–3.4; AutomorphicSpectralTheory §§0.11–0.15; hereditary-intertwining-bounds.

**Checks.**

- The theorem applies to every (HP) group and regular χ. For a compact torus quotient with mass-one Haar measure the Weyl stabilizer is {1} and the constant-term operator is the identity; Fourier orthogonality gives a single mode coefficient 1 and every distinct mode coefficient 0. For GL_n products (HP) is supplied without an added conjecture.

- The zero Schwartz vector gives every coefficient 0 and integral 0. For φ outside the χ-block the integral reconstructs its χ-component, so the equality with φ requires φ∈C_χ. The full noncuspidal Schwartz Paley–Wiener statement is not used.

### 3.8 Schwartz convolution kernels and cuspidal parts

For f∈S(G(𝔸)) define `K_{f,P}`, `K_{f,P,χ}` as the smooth integral kernels of R_P(f) and its χ support component on the AdelicAlgebraicGroups quotient L² spaces. Define K⁰ on the A_P∞-quotient using its `δ_P^{1/2}` normalization. They satisfy `K⁰_{f,P,χ}(x,y)=∫_{A_P∞}K_{f,P,χ}(x,ay)δ_P(a)^{−1/2}da`. This construction extends the compactly supported kernels of AutomorphicSpectralTheory §§6.3–6.4 and fixes its pairing convention by `(R_P(f)φ)(x)=∫K_{f,P}(x,y)φ(y)dy`. Smooth representatives are used; kernel columns come from regularizing δ_y with the appropriate adjoint. Derivatives in either variable agree with the corresponding left/right derivatives of f. (BPCZ §2.10.1, pp.239–240; bpcz line 2420).

The defining construction has the following API.

- Integrating the kernel against a compact smooth vector recovers R_P(f) exactly.

- Applying the χ projection to the first variable gives `K_{f,P,χ}` and agrees with the original compact kernel when f is compact.

- The normalized A_P∞ integral gives K⁰ with factor `δ_P^{−1/2}`.

A proof route is as follows. Use smooth regularization of point distributions, then apply the continuous support projection. Apply the quotient disintegration measure to descend along A_P∞, starting from the compact-test identity requested in compact-kernel-central-comparison; use the weighted estimates for absolute convergence.

*Needs:* §3.4; §2.12; §2.7; AutomorphicSpectralTheory §§6.1–6.4; compact-kernel-central-comparison.

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

A proof route is as follows. Start with the parent compact-kernel spectral identity requested in compact-kernel-spectral-comparison, retaining its discrete inducing representation space and parabolic multiplicity factors. Use Arthur factorization at fixed normal finite level, then positivity on the diagonal and Cauchy–Schwarz to bound the grouped K-type terms by the kernel majorant. Use the uniform boundedness principle and density to pass to Schwartz f and commute group derivatives with the uniformly controlled expansion.

*Needs:* §3.9; §3.2; AutomorphicSpectralTheory Layer 4; AutomorphicSpectralTheory §§6.1–6.4; arthur-factorization-comparison; compact-kernel-spectral-comparison.

**Checks.**

- Absolute convergence of the ungrouped individual basis terms is not claimed by this estimate.

- The derivative estimate uses x,y∈G(𝔸)¹, whereas the displayed kernel identity holds after central disintegration for general x,y.

- On the mass-one circle put D=(2π)⁻¹d/dx, X=1, Y=iD−1 and f=e₋₁. Since De₁=ie₁ and De₋₁=−ie₋₁, Y e₋₁=0 whereas Y e₁=−2e₁. The differentiated kernel and R(Y)f are both zero, so the estimate reads 0≤p(0)=0. Conjugating Y e₁ instead would give absolute value 2 and the false inequality 2≤0.

- For the same projector with Y=D, differentiating conj(e₁(y)) gives −i e₋₁(y), and R(D)f=−i f. Both differentiated kernel coefficients are −i; this test fixes the sign even though absolute values alone give 1 in either convention.

### Examples

On the compact circle the kernel of right convolution by e₋ₙ is eₙ(x)conj(eₙ(y)); the two indices n=0 and n=1 give kernels 1 and exp(2πi(x−y)). Support projections onto disjoint singleton blocks have product zero and their union projection is their sum. For a GL₂ Borel datum χ₁⊠χ₂ the relative Weyl stabilizer has order 2 when χ₁=χ₂ and order 1 when the characters differ.

### Dependencies

Layer 2; AutomorphicSpectralTheory Layers 1–4 and §§6.3–6.4; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7, 3.4–3.5; hereditary-intertwining-bounds for §3.7; NoncommutativeGeometry N1.

## Layer 4: Counting and archimedean annihilation

### 4.1 Level and T-characters

Fix a number field F, connected reductive G/F, its maximal F-split central torus Z and unitary automorphic central character ω. Fix a finite set S of finite primes containing all ramified group and level places, `K=K_S×∏_{v∉S}K_v`, and a set T⊃S that may be infinite. H_G^T is the restricted tensor product of the spherical algebras at v∉T, with unit `1_{K_v}` and vol(K_v)=1. A T-character χ is a character of Z(g∞)⊗H_G^T, equivalently an infinitesimal-character W-orbit χ∞ and a family of unramified characters away from T. L²_ω[χ] denotes the closed χ-eigenpart in the fixed-level Hilbert space; its cuspidal subspace is intersected with L²_cusp. Twists and inducing parameters lie in the relative spaces (a_M^G)* of the Conventions. The normalizations of Z, A_M∞ and unitary unramified twists are compared with AutomorphicSpectralTheory §1.9–AutomorphicSpectralTheory Layer 4. (BPLZZ §3.1, Definitions 3.1–3.3, pp.21–22; §3.2, pp.23–24; bplzz line 1080).

The defining construction has the following API.

- Evaluation on z⊗h is χ∞(z)χ^T(h).

- For T⊂T′ restriction forgets characters at T′\T and agrees with the inclusion `H_G^{T′}⊂H_G^T`.

- The fixed-level χ-part is closed and stable under G∞ and under the bi-K Schwartz algebra `S(G(𝔸))_K=S(G∞)⊗S(G(𝔸_f))_K`, because Z(g∞) commutes with G∞ and each spherical factor at v∉T is commutative. A general Schwartz test function acts on the full automorphic representation and can change the finite level; no G(𝔸)-invariance of the K-fixed χ-part is asserted (BPLZZ §3.1, p.22; bplzz line 1100).

A proof route is as follows. Use the existing central-character quotient and spherical Hecke algebras; form the algebraic restricted tensor with finite-support Hecke operators. Use the simultaneous central/Hecke eigencondition and compare the normalized cuspidal-datum quotient through central-character-affine-lattice.

*Needs:* AdelicAlgebraicGroups §§2.1–2.3; AutomorphicSpectralTheory Layer 4; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.2; satake-exponential-family; cuspidal-data-central-comparison.

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

### 4.6 Finite-rank cuspidal Casimir values

At fixed finite level and a finite set of archimedean K_M-types, the set Λ_M of derived Casimir values of cuspidal representations of M modulo i(a_M^G)* twists is countable and has finite rank as a subset of ℂ. More precisely the needed derived semisimple cuspidal counting function, counted with multiplicity below positive elliptic spectral parameter R, is bounded by C(1+R)^d. To pass from M to M_der, one must use a finite union of conjugate finite levels; the original level intersection alone is not sufficient. Normalize the Casimir sign so that its K-type-adjusted elliptic eigenvalue is nonnegative. (BPLZZ §3.3, Lemma 3.12 and proof, p.26; bplzz line 1263).

A proof route is as follows. Use the exact Donnelly polynomial upper bound cuspidal-polynomial-counting from AutomorphicFormsOnReductiveGroups §§4.1–4.2; finite multiplicity alone is not a counting theorem. Choose finite representatives of M(𝔸)/(M(F)Z_M(𝔸)M_der(𝔸)K_MM∞). Translate a nonzero fixed-level cusp vector by a suitable representative before restricting to M_der. Intersect the finitely many conjugate derived levels, apply the counting theorem at that common smaller level, and deduce convergence of a sufficiently high reciprocal power sum.

*Needs:* §0.1; §4.5; AutomorphicFormsOnReductiveGroups §§4.1–4.2; AdelicAlgebraicGroups §§3.1, 3.4–3.6; cuspidal-polynomial-counting.

**Checks.**

- A repeated eigenvalue contributes multiplicity to the counting estimate, but only once to the interpolation zero set.

### 4.7 Finiteness of typical cuspidal data

For each Levi M, fixed ω, fixed finite level and finite K_M-type set, only finitely many χ∞-typical cuspidal representations occur modulo the normalized i(a_M^G)* twists. After fixing ω and normalizing the i(a_M^G)* twists, the allowed central differentials lie in a discrete affine lattice coset in the remaining central directions of c_M,ℂ*/(a_M^G)ℂ*, possibly of rank zero; the first typicality condition restricts them to finitely many values; the remaining finite-component central characters are finite at the fixed level. Donnelly’s bound restricts derived parameters, and fixed infinitesimal/central-character admissibility gives the final finite representation set. (BPLZZ §3.3, Lemma 3.13, p.26, with the central-character step in the proof of Lemma 3.14, pp.26–27; bplzz line 1270).

A proof route is as follows. Use the character lattice of the fixed-level compact norm-one central quotient. Compare extension of the fixed ω and normalization of twists as requested in central-character-affine-lattice: the resulting allowed differentials form an affine coset with complex-linearly independent lattice generators, rather than a full-rank lattice in all of c_M*/(a_M^G)*. Apply both typicality conditions, then derived counting at the conjugate levels and Harish-Chandra fixed-character finiteness.

*Needs:* §4.6; §4.5; AdelicAlgebraicGroups §§2.1–2.3; AutomorphicFormsOnReductiveGroups §§4.1–4.2; central-character-affine-lattice.

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

For the fixed (G,Z,ω,K,χ∞) there exists μ∞∈(M♯θ)^W with μ∞(χ∞)≠0 such that, for every fixed-K Schwartz f, R(μ∞⋆f) has image in a finite orthogonal sum of AutomorphicSpectralTheory §1.9 cuspidal-data components. The list is independent of f. Choose the finite detecting K∞-types supplied by μ∞⁰, propagate them to the finitely many Levi K_M-types and finite levels, retain only typical data, and annihilate all remaining data by the product of μ∞^M. (BPLZZ §3.3, (3.3) and Proposition 3.15, p.27; bplzz line 1325).

A proof route is as follows. Use compact-picture Frobenius reciprocity to get finite Levi type sets from the detecting G-types, and choose compatible finite levels including the unramified factors. Apply the annihilator to every complex induced family and use density of pseudo-Eisenstein series in its cuspidal block. Finite typicality leaves a finite block list after multiplying the finitely many standard-Levi factors.

*Needs:* §4.8; §4.7; §1.8; AutomorphicSpectralTheory §§1.5–1.10; AutomorphicSpectralTheory Layer 4.

**Checks.**

- The surviving blocks may contain continuous spectral parameters; they are not a finite set of irreducible representations.

### Examples

For a compact central torus the derived Casimir is always zero. Typicality at the trivial differential retains 0 and rejects differential 1; derived counting alone retains both and is insufficient. At a finite unramified GL₁ place the spherical algebra is ℂ[T,T⁻¹]; evaluating T at parameters 2 and 3 separates them by T−2, whose values are 0 and 1. This is valid for residue cardinalities 2 and 3 with the chosen Satake normalization.

### Dependencies

Layers 0–3; AdelicAlgebraicGroups §§2.1–2.3, 4.6–4.7; AutomorphicFormsOnReductiveGroups §4.2; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.2; the polynomial-counting and central-lattice contracts.

## Layer 5: Mixed separation and global isolation

### 5.1 Occurrence in a cuspidal datum

A T-character χ occurs in a normalized cuspidal datum (M,σ) if there is one complex parameter s∈(a_M^G)ℂ* for which the induced infinitesimal character equals χ∞ and, for every finite v outside T, the spherical constituent of the normalized induction I_P^G(σ_s,v) has character χ_v. The same parameter must work at all these places. This property descends to the AutomorphicSpectralTheory §1.9 Weyl-and-twist equivalence class. Denote the resulting set by D(G,ω)_χ. Occurrence is stronger than the almost-everywhere finite-place condition in CAP. (BPLZZ §3.4, Definition 3.16, p.28; bplzz line 1352).

The defining construction has the following API.

- Replacing σ by a normalized unramified twist translates the existential parameter and preserves occurrence.

- Associate parabolic induction transports occurrence across the AutomorphicSpectralTheory §1.9 equivalence relation.

- Occurrence in a proper Levi datum implies that χ is (G,T)-CAP; the converse is not asserted.

A proof route is as follows. Use normalized induction, its infinitesimal character and the Satake character at each unramified place. A Weyl conjugacy or normalized unramified twist changes s and the representative without changing existence.

*Needs:* §4.1; AutomorphicSpectralTheory §§1.5–1.10; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.2; cuspidal-data-central-comparison.

**Checks.**

- For a cuspidal σ and M=G, the T-character induced by σ occurs in its own datum.

- When M=G and the infinitesimal characters differ, agreement at all retained finite places does not give occurrence.

- If T contains every finite place, occurrence still requires the infinitesimal-character equation, whereas the finite-place CAP condition becomes vacuous whenever a proper cuspidal datum exists.

- The infinitesimal and all retained finite-place equations must hold simultaneously.

- For G=M=G_m over ℚ, ω=1, σ=1 and T containing every finite place, the only parameter is s=0 because (a_G^G)*=0, so the character with infinitesimal character 1 does not occur; the absolute space would allow s=1 and make it occur, contradicting the full-group nonoccurrence Check above.

### 5.2 Mixed archimedean and Hecke annihilators

If χ does not occur in (M,σ), construct a T-multiplier `μ_{M,σ}` nonzero at χ whose operator annihilates the whole AutomorphicSpectralTheory §1.9 cuspidal component L²_(M,σ). Only finitely many places outside T are used, even if T is infinite. For proper M choose representatives α_σ,α_χ and a splitting ℓ:h*→(a_M^G)*. For each w∈W the only candidate parameter compatible with α_σ+s=wα_χ is s_w=ℓ(wα_χ)−ℓ(α_σ). Nonoccurrence supplies an invariant archimedean polynomial or a spherical Hecke element at a retained finite place distinguishing the target from that candidate. Its values along the induced family are exponential polynomials in s. A finite linear combination avoiding the finitely many target-zero hyperplanes, followed by a Weyl product, vanishes on the entire family and is nonzero at χ. Multiply by a moderate damping and a sharp seed to obtain an element of (M♯θ)^W⊗H_G^T. (BPLZZ §3.4, Proposition 3.17 and (3.4), pp.28–29; Remark 2.9(3), p.11; bplzz line 1361).

The defining construction has the following API.

- `μ_{M,σ}(χ)≠0`.

- Evaluation at every induced T-character of σ_s vanishes for all complex s.

- For every fixed-K Schwartz f, `R(μ_{M,σ}⋆f)` is zero on L²_(M,σ).

A proof route is as follows. If the fixed-level component is zero there is nothing to annihilate; use a sharp seed nonzero at χ. For M=G an archimedean invariant polynomial separates unequal infinitesimal characters; otherwise choose a Hecke element separating the finite-place characters and multiply it by a sharp seed. A bare Hecke element need not lie in the sharp tensor algebra. For proper M form the finite exponential-polynomial differences by subtracting their evaluations at s=ℓ(w′α)−ℓ(α_σ). Choose one linear combination nonzero at every target Weyl translate, then multiply over w′. Along α=α_σ+s its identity factor vanishes. Choose a W-invariant entire damping nonzero at χ∞ that changes the exponential coefficients to moderate strip growth, and multiply by the sharp seed. Use the scalar action on induced representations and density of pseudo-Eisenstein series to annihilate the closed component.

*Needs:* §5.1; §4.3; §0.8; §0.5; §1.7; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.2; AutomorphicSpectralTheory §§1.5–1.10; satake-exponential-family.

**Checks.**

- For M=G and equal infinitesimal characters but different finite-place characters, use μ∞⁰⊗(h−χ_σ(h)1), choosing χ(h)≠χ_σ(h); μ∞⁰(χ∞)≠0 is essential.

- For M=G with unequal infinitesimal characters, a separating invariant polynomial times μ∞⁰ works even with no retained finite places.

- If χ occurs in the family, an element vanishing identically on that family must evaluate to 0 at χ, so this construction cannot preserve the target.

- Annihilation holds for every complex s, not just unitary parameters.

- The multiplier remains in the nonunital sharp algebra.

### 5.3 Isolation of occurring cuspidal components

For every T-character χ and the fixed (G,Z,ω,S,K), there is a T-multiplier μ with μ(χ)=1 such that for every f∈S(G(𝔸))^K the image of R(μ⋆f) on L²(G(F)\G(𝔸)/K,ω) lies in the Hilbert orthogonal sum of the AutomorphicSpectralTheory §1.9 cuspidal components indexed by D(G,ω)_χ. The constructed range is contained in a finite sum of these components. The identity μ(χ)=1 preserves the action of f on any admissible representation with this T-character, including one absent from the automorphic spectrum. This theorem asserts a range constraint and scalar normalization; it does not assert that μ acts as the identity on each entire surviving component. (BPLZZ §3.4, Theorem 3.19, pp.29–30; bplzz line 1428).

A proof route is as follows. Start with μ∞ from Layer 4 and its finite list of surviving equivalence classes. Multiply by the mixed annihilator for each class where χ does not occur. All factors are nonzero at χ. Divide by the resulting scalar at χ; use the AutomorphicSpectralTheory Layer 4 orthogonal decomposition and commuting scalar actions to prove the range inclusion.

*Needs:* §4.9; §5.2; §5.1; §4.3; AutomorphicSpectralTheory Layer 4.

**Checks.**

- Check that no finite-place factor outside a finite set is introduced.

- No orthogonal-projection or idempotence conclusion is inferred.

- On a surviving full-group cuspidal representation with character χ, μ(χ)=1 gives π(μ⋆f)=π(f); on a killed block the operator is 0.

### 5.4 Isolation of non-CAP cuspidal spectrum

If χ is not (G,T)-CAP, choose the normalized multiplier of global isolation so that for every fixed-K Schwartz f its operator on the entire central-character L² space has image in L²_cusp[χ]. In particular μ⋆f is ω-quasi-cuspidal and μ(χ)=1. Without the non-CAP hypothesis the same normalized multiplier has this range property after restricting its domain to L²_cusp. Here L²_cusp[χ] is the maximal closed cuspidal subspace on whose smooth vectors Z(g)⊗H_G^T acts by χ; neither assertion requires χ to be automorphic. (BPLZZ §3.1, Theorems 3.6–3.7, p.23; their proofs in §3.4, p.30; bplzz line 1120).

A proof route is as follows. A proper cuspidal datum with occurrence would imply CAP, so only M=G can survive in the non-CAP case. Intersect the occurring component sum with L²_cusp. Orthogonality of the AutomorphicSpectralTheory §1.9 decomposition identifies that intersection with L²_cusp[χ]. For arbitrary χ restrict the operator to the invariant cuspidal subspace before taking the intersection.

*Needs:* §5.3; §4.2; §4.4; AutomorphicFormsOnReductiveGroups §§4.1–4.2; AutomorphicSpectralTheory Layer 4.

**Checks.**

- In the unrestricted-character assertion only the cuspidal domain is controlled.

- Quasi-cuspidality is asserted on the whole L² space only in the non-CAP case.

### 5.5 Preservation of a non-CAP admissible representation

Let π be an irreducible admissible representation of G(𝔸) with unitary automorphic central character. Suppose π is not nearly equivalent to a constituent of induction from any proper cuspidal datum. At a finite level K choose finite S containing every ramified place of G, K and π and take T=S. The normalized isolation multiplier satisfies π(μ⋆f)=π(f) for every fixed-K Schwartz f, and its global L² operator has image in the π-nearly isotypic cuspidal subspace. The sharper χπ^T-eigenspace range may be used as an intermediate inclusion. If the nearly isotypic cuspidal subspace is zero, the global L² action is zero while the action on π is still preserved. (BPLZZ §1.1, Theorem 1.1 and Remark 1.2(4), p.2; §3.1, Theorem 3.6, p.23; bplzz line 53).

A proof route is as follows. Associate the unramified Hecke and infinitesimal T-character to π. Non-CAP for π gives the hypothesis of §5.4. Equality of all Hecke characters outside finite S implies local isomorphism there by the spherical classification. The multiplier evaluates to 1 at χπ, so the scalar action preserves π(f).

*Needs:* §5.4; AutomorphicFormsOnReductiveGroups §§3.4–3.5.

**Checks.**

- Near equivalence does not determine the infinitesimal character for a general reductive group.

- No automorphic occurrence of π is assumed.

### 5.6 Isolation of one GLₙ cuspidal-support component

For `G=Res_{F′/F}GL_n` and an irreducible admissible π occurring as a constituent of normalized induction of a cuspidal representation σ of a Levi M, with unitary automorphic central character, there is a normalized multiplier preserving π(f) and mapping the entire central-character L² space into the single AutomorphicSpectralTheory §1.9 cuspidal-support component attached to (M,σ), for every fixed-K Schwartz f. The correct uniqueness input is the isobaric strong multiplicity-one theorem: the almost-everywhere unramified characters determine the multiset of cuspidal constituents, with their unramified norm twists. It identifies the cuspidal datum, not every irreducible constituent of its induced representation. (BPLZZ §1.1, Theorem 1.3, pp.2–3; §3.4, Theorem 3.19, pp.29–30; bplzz line 88).

A proof route is as follows. Use isobaric strong multiplicity one from AutomorphicLFunctionsAndLocalFactors AL.3, including normalization and twists, to show that the occurrence set contains only the inducing cuspidal-support equivalence class. Apply global isolation with χ=χπ^S and normalize at π.

*Needs:* §5.3; AutomorphicSpectralTheory §§1.5–1.10; AutomorphicLFunctionsAndLocalFactors AL.3, Strong multiplicity one for isobaric sums; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7.

**Checks.**

- Do not replace isobaric strong multiplicity one by the cuspidal-only Piatetski-Shapiro 1979 theorem.

- The target is a coarse cuspidal-support component and may include continuous and residual spectrum.

- Two unramified characters with values 2 and 3 give Satake polynomial (1−2T)(1−3T)=1−5T+6T² under the preparatory isobaric construction. The uniqueness input retains the unordered multiset {2,3}; repeating the first character instead gives 1−4T+4T², so multiplicities cannot be discarded.

### 5.7 Isolation of refined discrete-data components

Replace AutomorphicSpectralTheory §1.9 cuspidal data by AutomorphicSpectralTheory Layer 4 Langlands data (M,σ) with σ in the discrete automorphic spectrum of M, using its normalized unramified-twist and Weyl equivalence. Assuming the polynomial fixed-level, fixed-K-type discrete-spectrum Casimir counting input discrete-spectrum-casimir-counting, there is a T-multiplier with value 1 at χ whose L² range lies in the sum of the refined Langlands components where χ occurs, defined by the same simultaneous character equations. This can be strictly smaller than the coarse cuspidal-support range. The extra polynomial counting theorem is a required input, not a consequence of mere discreteness or of a general trace-class ideal theorem. (BPLZZ §3.4, Remark 3.20, pp.30–31; bplzz line 1459).

A proof route is as follows. Use the AutomorphicSpectralTheory Layer 4 discrete-data Langlands decomposition requested in refined-langlands-discrete-data. Repeat the Casimir interpolation and typical-data finiteness using the discrete-spectrum polynomial bound rather than the cuspidal bound. Repeat mixed separation and scalar normalization with these refined components.

*Needs:* §5.3; §5.1; AutomorphicSpectralTheory Layer 4; refined-langlands-discrete-data; discrete-spectrum-casimir-counting.

**Checks.**

- For PGL₂ choose the T-character of the Borel family induced from the trivial torus character at λ=it. The permitted refined range includes that continuous Borel component and excludes the residual constant representation. In the coordinate ρ=1/2 the invariant polynomial q(λ)=λ²−1/4 has values −t²−1/4 for λ=it and 0 for the residual character λ=ρ, so they differ even at t=0. No T-character keeps the residual representation while killing the Borel component: its character already occurs in that datum at λ=ρ. Both components have the same coarse cuspidal support.

- When refined and coarse data coincide, their permitted range sums agree; the refinement does not create extra components.

### Examples

For a full-group unwanted datum with the same infinitesimal character, choose a spherical h whose values at the datum and target are 2 and 3. A sharp seed normalized to 1 at the target times h−2 has values 0 and 1. If an archimedean selector has value 2 and this mixed selector has value 3 at the target, their product has value 6 and division by 6 gives value 1. The nonzero value is established before division. The multiplier may still take other values within a surviving continuous block.

### Dependencies

Layer 4 and the earlier symbol and Schwartz-action layers; AutomorphicSpectralTheory §§1.6–1.10 and Layer 4; SmoothRepresentationsOfLocalGroups SR.4; AutomorphicLFunctionsAndLocalFactors AL.3 only for §5.6; refined-langlands-discrete-data and discrete-spectrum-casimir-counting only for §5.7.
## Downstream consumers

Relative period comparisons use the general spectral isolation and relative-character convergence together with an independently supplied transfer-preservation theorem. Automorphic applications can use the non-CAP endpoint without an auxiliary supercuspidal local factor; a prescribed representation need not already occur in the automorphic spectrum.

## Worked examples

For the compact real torus U(1), θ={−1} and Y=ℤ. The constant symbol is moderate but fails sharpness. The damped sinc symbol exp(z²)sin(πz)/(πz), with value 1 at 0, is sharp and retains the trivial character. At z=1 it has value 0 and at z=0 it has value 1; treating the sharp algebra as unital loses this finite-support condition. In contrast a split torus has θ={1}, Y={0}, so sharpness adds no lattice restriction.

For G=GL₂ and an inducing pair of distinct Hecke characters, the relative Weyl stabilizer is trivial and the regular weighted constant-term theorem applies. With repeated characters it has order 2, and that theorem's regularity hypothesis fails. The residual constant representation and continuous Eisenstein spectrum can share a coarse torus cuspidal-support component; §5.7 uses discrete Langlands data to refine it. Thus neither the coarse isolation theorem nor its value-one normalization is an orthogonal-projector statement.

## References

All statements are in the author's own words. Page numbers for BPLZZ and Lapid refer to the specified preprints; BPCZ uses published journal pagination. The source identifiers bplzz, bpcz and lapid label line-numbered extractions of the linked PDFs, whose SHA-256 digests are, respectively, f2834146d4fee02b38c4849ee9a7ef76a3dbc1131e7eef799e6f95b0f0d0ac13, a07a6143d3e71f1eca31b6ba9b774bec325a7de07c7417b7796486a77df13794 and ae1ab291ef50ca55c6d89334bb604c0795ce2f326ed017ad2573ec4538618390. The section, theorem and page locators also identify each claim independently of those extractions.

- **BPLZZ** (`bplzz`): Raphaël Beuzart-Plessis, Yifeng Liu, Wei Zhang and Xinwen Zhu, [Isolation of cuspidal spectrum, with application to the Gan–Gross–Prasad conjecture](https://arxiv.org/abs/1912.07169v3), arXiv:1912.07169v3 (2021 version). §§2.1–2.4, pp.9–21; §§3.1–3.4, pp.21–31; §4.2, pp.33–35; Appendix A, pp.43–45. The cited theorem numbering is the preprint's.
- **BPCZ** (`bpcz`): Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, [The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case](https://doi.org/10.1007/s10240-021-00129-1), Publications mathématiques de l’IHÉS 135 (2022), 183–336. §§2.4–2.5, pp.202–221; §§2.8.4–2.10.2, pp.227–243.
- **Lapid** (`lapid`): Erez M. Lapid, [On the Harish-Chandra Schwartz space of G(F)∖G(𝔸)](https://www.esi.ac.at/preprints/esi2403.pdf), ESI preprint 2403 (2013). §2; §3.6, pp.19–20; Theorem 4.5, p.22; Proposition 5.1, pp.22–24; Corollaries 5.7–5.8, pp.25–26; §6, pp.26–28.
- **Bernstein** (`bernstein`): Joseph N. Bernstein, [On the support of Plancherel measure](https://doi.org/10.1016/0393-0440(88)90024-1), Journal of Geometry and Physics 5(4) (1988), 663–710. §§3.4–3.5, pp.685–689; the specific quotient uses are also located at BPCZ §2.5.5 and §2.5.12, bpcz line 1270 and line 1402.

The semisimple multiplier, split-centre Fourier–Laplace, Kostant, minimal-type, Donnelly and Müller inputs are consumed through the exact supplier contracts and their inspected uses in BPLZZ §§2.4, 3.3–3.4 and Appendix A, and BPCZ §§2.8.4 and 2.10.2. These uses do not supply a more general theorem than those contracts state.
