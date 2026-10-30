# Roadmap: relativistic quantum field theory, free fields and perturbative renormalization

This chapter builds the mathematical bridges from Lorentzian field equations and Fock-space models to local quantum fields, correlation distributions, perturbative graph amplitudes, renormalization and formal scattering. It is a mathematical roadmap, not a claim that interacting four-dimensional QED exists as a positive-metric Wightman theory. It does not model a formal path integral as an infinite-dimensional Lebesgue measure. Physical postulates (choice of vacuum, spectrum condition, locality, field content, gauge fixing, renormalization scheme) are explicit model data; theorems state their hypotheses.

Suggested files:

```text
TauCetiRoadmap/RelativisticQuantumFieldTheory/
  README.md
  Suggested.lean
  FreeEuclideanReflectionTargets.lean
```

The definitive acceptance scope is below. `Suggested.lean` is a small prototype only.

## Conventions and dependency boundary

Fix Minkowski space as `M = EuclideanSpace ℝ (Fin 4)`, with its Euclidean norm for test-function/Fourier topology and a separate Minkowski bilinear form, with coordinates `(x⁰,x¹,x²,x³)` and metric `η = diag(+1,−1,−1,−1)` for this chapter. Then `□ = ∂₀² − Σᵢ∂ᵢ²` and the massive Klein–Gordon equation is `(□ + m²)φ = 0`; record the conversion to the `(−,+,+,+)` convention wherever used. RQFT0 owns the canonical time-first continuous linear reindexing `ι_M:EuclideanSpace ℝ (Fin 4)≃L[ℝ]((Fin 1⊕Fin 3)→ℝ)`, sending x to `(x⁰;(x¹,x²,x³))`; prove its +--- form identity. At the actual NQS time-last interface consume M0’s signed equivalence Q_N and define `P=Q_N⁻¹∘ι_M`; its coordinates are `(x³,−x²,x¹,x⁰)` and its time-last quadratic form satisfies `Q(Px)=η(x)`. M0 is the sole owner of the signed map and Hermitian comparison; RQFT6 consumes ι_M for its group/jet transport. LVF's separate native Spin(3,1) form uses the opposite sign, so prove the indicated form identity at each interface. Fourier transforms use Mathlib's pinned Euclidean convention `𝓕f(ξ)=∫exp(−2πi⟨x,ξ⟩)f(x)dx`. For the Euclidean angular-frequency kernel `exp(−i⟨x,p⟩)`, put `p=2πξ`. For the Minkowski-phase kernels used in the scalar and photon maps, write `η♭p=(p⁰,−p¹,−p²,−p³)` and prove `Kf(p)=∫exp(iη(p,x))f(x)dx=𝓕f(−η♭p/(2π))`. Thus positive physical energy corresponds to negative Mathlib time frequency. Prove the linear change-of-variable/dual-distribution identities, transporting mass shells, forward cones and spectral support through `p↦−η♭p/(2π)`; include its Jacobian and the derivative, delta and propagator normalization factors. The Klein–Gordon symbol becomes `m²−4π²η(ξ,ξ)`, since the quadratic form is unchanged by the sign reflection. Apply this conversion wherever a Minkowski-phase transform, positive-energy support or wavefront covector orientation is compared with Mathlib/P8 conventions, including RQFT1–4 and RQFT6–8. Pin the localized transform used for P8 wavefront calculations to `∫exp(−i⟨x,ξ⟩)f(x)dx`; its positive rescaling to Mathlib's `2π` convention does not change a conic wavefront set. The mode `exp(−iη(p,x))` then has covector `ξ=−η♭p`, so positive physical energy has negative time covector. Transport this sign through the spectrum/tube, microlocal graph-cone and mass-shell-pole interfaces as well as through the free-field Fourier maps. Never identify the formulas by name alone.

Consume [OperatorAlgebraDynamics D8](../OperatorAlgebraDynamics/README.md#d8-car-weyl-algebras-and-free-equilibrium-states) for CAR/Weyl algebras, regular representations, bosonic and fermionic Fock carriers, invariant-domain fields, and quasi-free states. Consume D8's Fock carrier with QF4's generic Fock and second-quantization API at RQFT2/RQFT3/RQFT10; RQFT2 names this interface directly for its Fock construction. RQFT0–4 and RQFT10 do not depend on terminal QF6b; any QF model API is consumed only at the milestone naming it. D8, not QF, owns the CCR/CAR/Weyl algebra and regular representations. Consume [UnboundedOperators](https://github.com/TauCetiProject/TauCetiRoadmap/blob/bd1bbc0a33b022a053df88d9efd662f963f8dcde/TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md) UO-A01–A08 for exact spectral-integral domains/calculus (with SAST Part A for Stone and SA-B05 for the bounded Borel/PVM interface), UO-B01–B05 for normal/strongly commuting operators, UO-E01/E03/E05 for graph-core, joint analytic-vector and worked-core comparisons, and UO-F01–F04 for completed tensor operators, maximal sums and graph cores, plus UO-D06–D07 for closed forms, Friedrichs extensions, Hardy bounds and singular endpoint domains. Consume NoncompactQuantumSymmetry M2/M4 at RQFT2–3 for the named induced representations and Lorentz conventions, and M4 at RQFT11 for the named helicity models; M6 is only its literal/corrected-source register. RQFT0 consumes QF6a for the stated position-space comparison; RQFT9 consumes QF6b for its nonrelativistic Coulomb comparison and shared all-b Kummer M/Tricomi U analytic interface.  Those representations alone imply no local field, vacuum, particle creation law, spin-statistics result or scattering theory.

Consume [PDO P8](https://github.com/TauCetiProject/TauCetiRoadmap/blob/063cf517a1dcc4d929e0602c6e6f585953aceab8/TauCetiRoadmap/PseudodifferentialOperators/README.md#p8-wave-front-sets-and-microlocal-regularity) for generic distribution wavefront sets, pullback/product criteria and microlocal regularity; this chapter owns their calculation for the KG/Dirac propagators, graph distributions and diagonals. Consume the exact Fourier, Schwartz, tempered-distribution and PDE contracts already present in Mathlib/Tau Ceti. The [PDE roadmap](../PDE/README.md) supplies its Fourier/distribution foundation and named weak, elliptic and parabolic lanes when their hypotheses apply; its current lanes do not supply the Lorentzian KG/Dirac/Maxwell causal Green operators required here. This roadmap owns those hyperbolic PDE targets and their covariance/constraint bridges. The probability-family roadmap [StandardDistributions](../StandardDistributions/README.md) is unrelated to Schwartz distributions. Consume [LocalVariationalFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/b0d470800c2ec37131f440e41f246b17a3e8bdab/TauCetiRoadmap/LocalVariationalFieldTheory/README.md) for finite-order Euler–Lagrange, Noether and finite-dimensional Lorentz-spinor algebraic modules. Consume [SmoothBundlesConnections B3–B4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1c45ab4061b483b832b5d54f597dc69afd3f97a5/TauCetiRoadmap/SmoothBundlesConnections/README.md#b3-connections-and-covariant-differentiation) for the generic connection/curvature operators, [HopfRinow L1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1c99f962c0293ea860da45c79356d70d8bd53414/TauCetiRoadmap/HopfRinow/README.md#layer-1-the-geodesic-equation-the-flow-and-the-exponential-map) for fixed-signature Levi-Civita coordinates, and [SpinRepresentations Layers 1/4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a1bdd8986df636b649f101a1afde10f32535bd85/TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md) for the complex Clifford matrix algebra. It owns the Borcherds `Ω(V)`/Kähler-differential current complex, Euler–Lagrange ideal and solution-homomorphism/D-module analogy, and stress-energy/Belinfante targets. This chapter owns the covariant quantum-field realization and distributional equations of motion, not generic jet or Clifford algebra foundations.

The finite-jet covariance boundary is [LieGroups Layers2–3](../RepresentationTheory/LieGroups/README.md) for native LieGroup/LeftInvariantDerivation, closed subgroups, automatic smoothness and connected faithfulness; [NQS M0.RealLorentzExport (M0 item2)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f6afdcaea14fd4be5cdff6df091710bbc70aaa02/TauCetiRoadmap/NoncompactQuantumSymmetry/README.md#m0-smooth-vectors-compact-types-and-semisimple-representation-bridges) for its Cartan lane and the concrete real-Lorentz supplier contract: boundaryless real SL(2,ℂ)/SO₀(3,1) Lie groups, connectedness, the actual LeftInvariantDerivation LieEquiv and real IsKilling instances, and the signed Hermitian-action and two-sheeted-quotient comparisons; [LieHighestWeight Layer5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/797f5b74355c8cee4c8a2dfa1bb34bcb5c90ce69/TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md#layer-5-complete-reducibility-weyls-theorem) through [QF5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d390951f9065581b0bedb92a044bc121cc35815a/TauCetiRoadmap/QuantumFoundations/README.md#milestone-qf5--rays-wigner-symmetry-and-projective-representations) for finite-dimensional Whitehead H¹; and RQFT6 for the affine Lie-group/finite-jet and graph-stage adapters. The dependency edges are LieGroups2–3→NQS M0 item2→RQFT0/RQFT6, LieHighestWeight5→QF5→RQFT6→RQFT9, and RQFT5/P8→RQFT6. There is no RQFT input into QF5 and no M4 classification input into the M0 provider.

The scalar regularization boundary is [GH2's local Laurent phase](https://github.com/TauCetiProject/TauCetiRoadmap/blob/30a7252b70e6e7169abc023ea8856ceabb43206a/TauCetiRoadmap/GlobalHolomorphicFunctions/README.md#L651-L673)→[CK K3.MeromorphicGermField](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md#L332-L374)→RQFT6.RadialExtension/RQFT6.TaylorAdapter for one-variable finite-pole coefficient germs at each chosen parameter point. Use GH2's local construction and coefficient extraction before its global Runge/Mittag–Leffler patching step: that local phase uses native Cauchy/analytic inputs and has no GH0, GH5, CK or QFT prerequisite. CK supplies the separate holomorphic-stalk/fraction-field, finite-principal-part and regular-evaluation comparison; it does not replace GH2's full isolated-singularity scope. CK K3.HolomorphicStalk supplies the separate several-variable external Taylor-germ example. RQFT6 owns all LF/test-seminorm and, when required, fixed-cone normal-topology estimates passing from scalar pairings to distribution-valued residues and finite parts. RQFT6.RegulatorContinuation precedes and supplies both ForestConvergence and TaylorAdapter; ForestConvergence supplies the latter's regulator-removal comparison. TaylorAdapter's holomorphic realized families supply the later DiagonalStabilizer regularity/evaluation application, while the raw/reduction core has its earlier independent owners. RQFT6 owns the graph-sector continuation, completed Bogoliubov theorem and forest-subtracted tensor estimates. Neither local analytic supplier has a QFT dependency.

The open-graph boundary is RQFT5.OpenGraphSpecies→RQFT6.SwitchedRealization→RQFT6.ConnectedSubstitution. CK K5a supplies the complete smooth-section/test and compact-distribution dual carriers and K5a.DistributionLocalStructure; RQFT6.RadialExtension owns their sphere/annular adapters. The native UEA HopfAlgebra module supplies the ungraded translation Hopf instance; RQFT5 owns its polynomial-transpose adapter and the separate graded field-jet Hopf construction, while the graded incidence, tested compact realization and graph-flag comparisons remain the specified RQFT adapters.

For finite Clifford foundations, use Mathlib's `CliffordAlgebra` quotient, grading and `SpinGroup`, and [SpinRepresentations Layer 7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a1bdd8986df636b649f101a1afde10f32535bd85/TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md#layer-7-real-clifford-algebras-bott-periodicity-and-spinp-q) for the real `Cliff(p,q)` classification, Bott period and real Spin groups. Use the pinned Tau Ceti `Spin(3,1) ≃ SL(2,ℂ)`/Hermitian-vector model described in NoncompactQuantumSymmetry and verify LVF's exact finite Lorentz-module contract before use. The source's `Pin(3,1)` versus `Pin(1,3)` and gamma-square conventions must be converted explicitly; do not identify distinct real Pin groups by rescaling generators over `ℝ`. Do not redeclare Clifford algebras or treat matrix `γ` notation as a separate algebra. Consume [InductionRestriction's normalized factor-set and central-extension API](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7f4bfabdd1853a87f68a450756ba95deb068d2a9/TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md) where its field/group hypotheses match. RQFT2 owns the additional abstract isoclinism and topological Lorentz/Pin extension constructions; they are not supplied by that factor-set contract alone. For Schwartz/Fourier foundations use `Mathlib/Analysis/Distribution/SchwartzSpace/*`, `TemperedDistribution`, and `SchwartzSpace/Fourier`; Mathlib's transform uses `2π`, unlike the handwritten `exp(−i⟨x,p⟩)` formulas.

For Borcherds' matrix anti-automorphism exercise, consume native `Matrix.GeneralLinearGroup.innerAut_surjective` and `ker_innerAut` for the generic field-linear innerness and scalar ambiguity, then prove the source-specific finite-dimensional statement over `𝕂=ℝ` or `ℂ`, explicitly assuming `𝕂`-linearity: an involutive anti-automorphism of `M_n(𝕂)` has the form `A↦S⁻¹AᵀS` for invertible S, and `B(v,w)=vᵀSw` is nondegenerate with that anti-automorphism as adjoint. Derive from `τ²=id` that `Sᵀ=±S`; if the alternating case occurs, invertibility forces even `n` (over these characteristic-zero fields). State separately any source restrictions on n or pairing symmetry. This lemma is a concrete matrix-algebra prerequisite for the spinor pairing; it does not replace SpinRepresentations' Clifford classification or InductionRestriction's group-extension API.

The early shared Fock prerequisite is QF4's precise domain/normalization interface on the D8 carriers. RQFT2, RQFT3 and RQFT10 consume it; RQFT0–4 and RQFT10 have no dependency on terminal QF6b. RQFT9 separately consumes QF6b.SharedKummer and QF6b.T for the shared Kummer M/Tricomi U analytic interface and generic terminating identity, and owns its relativistic radial parameter, endpoint and spectrum adapters. QF6b consumes the terminal photon, spin-statistics and implementability exports at RQFT3/4/10, then supplies its late shared Kummer interface to RQFT9. The early QF4 and late QF6b interfaces are distinct; there is no edge RQFT9→early QF4. Generic Fock carriers/basic fields remain owned by D8. The representative `Suggested.lean` imports the native regularized hypergeometric module and transparently aliases its Γ(b)-normalized M expression. Its U alias takes the shared family as explicit function data, and both ODE comparison lemmas take the exact quantified supplier equations as hypotheses, with M’s nonpole-b and U’s slit-plane domains unchanged. These are conditional consumer specializations, not a construction or characterization of principal Tricomi U: an arbitrary ODE solution is not thereby identified with the shared normalized function. Supplying QF6b’s actual constructor and ODE proofs specializes the aliases by reduction to those same shared functions. The complete Laplace, continuation, branch, all-b, Wronskian, asymptotic and terminating contracts remain mandatory QF6b.SharedKummer/QF6b.T inputs to RQFT9; these conditional signatures neither replace those targets nor define a second generic special-function library.

## Milestone RQFT0 — conventions, test functions and exact solution carriers

Use the native integer module `Fin 3 → ℤ` for the mass, length and time exponents `(a,b,c)`. Setting the units c=ℏ=1 quotients by the speed and action vectors `(0,1,−1)` and `(1,2,−1)`; prove the quotient is ℤ via `M^a L^b T^c ↦ a−b−c`, sending mass to +1 and length/time to −1. Prove that the speed, action and mass vectors form a ℤ-basis (determinant1). For m,c,ℏ>0 this gives the unique dimensionally specified monomial of length in these three constants, `ℏ/(mc)`, up to a dimensionless multiplier. The source calls it a “Compton radius.” Convert `E_p²=c²|p|²+m²c⁴`. Define the dimensionful free Hamiltonian `H_ℏ=−ℏ²Δ/(2m)` on its self-adjoint domain and write its evolution as `iℏ∂_tψ=H_ℏψ`; prove the unitary dilation comparison with QF6a’s fixed `H₀=−Δ/(2m)` with ℏ=1. Consume QF6a’s coordinate-change unitary on `L²(ℝ³)` with `T=λ⁻¹I`, namely `D_λf(x)=λ^(3/2)f(λx)`, λ>0, and prove the specialization `D_ℏ H_ℏ D_ℏ⁻¹=H₀` as closed operators, hence `exp(−itH_ℏ/ℏ)=D_ℏ⁻¹ exp(−i(t/ℏ)H₀)D_ℏ`. Keep UNSW p8’s incomplete wave equation literal; this Hamiltonian equation is the corrected target.

Extend the unit lattice to `Fin 3 → ℚ`; quotient by the ℚ-span of the same speed/action vectors and prove the resulting ℚ-linear equivalence with ℚ via `a−b−c`. Prove compatibility with the integer quotient under coordinate casting and `ℤ→ℚ`. RQFT6 alone owns the field/monomial engineering grading, using this rational quotient: half-integer physical exponents are allowed.

Interoperability guidance uses [Physlib Units](https://github.com/leanprover-community/physlib/tree/6325a4e203641ba7bc4c3a4ba46a93ad734a1c54/Physlib/Units) and its existing rational-exponent `Dimension B`. In its ordered LTMCT coordinates `(ℓ,t,m,q,θ)`, our rational tuple `(a,b,c)` corresponds to `(b,c,a,0,0)`; charge and temperature have zero exponent in this comparison. This guidance is not an acceptance item requiring an unpinned Physlib import. Its [mass-weight proposal](https://github.com/leanprover-community/physlib/pull/1415) and [Yukawa API map](https://github.com/leanprover-community/physlib/pull/1419) guide compatibility: nonnegative doubled field weights map by `w↦w/2`; they do not encode negative coupling degrees or supply a direct-sum grading. Build RQFT6’s rational grading now and adopt compatible upstream APIs when available.

Use the finite Hilbert direct sums `PiLp 2 (fun _ : Fin n => M)` for configuration-space Schwartz/Fourier carriers. Use Mathlib's native `TestFunction Ω F ⊤` and its LF topology for compactly supported smooth tests, and `SchwartzMap` for Schwartz tests. Prove the continuous linear inclusion of compactly supported smooth tests into Schwartz space on each open Euclidean domain. Follow the API shape of [Mathlib PR37350](https://github.com/leanprover-community/mathlib4/pull/37350): the fixed-compact-support `ContDiffMapSupportedIn.toSchwartzMapCLM` and LF `TestFunction.toSchwartzMapCLM`. Construct these at the pinned library when absent; each Schwartz seminorm is bounded on a compact support stage by a support-radius power times the corresponding derivative seminorm. Prove pointwise agreement, injectivity and compatibility with the support-stage inclusions; when the native API arrives, consume it. Fix real test space `𝒟(M)` and Schwartz space `𝒮(M)` with values in the chosen scalar/spinor/vector bundle; define distributions as continuous linear functionals on tests and tempered distributions as continuous linear functionals on `𝒮`. Fix the distribution/test pairing to be linear in u and in the scalar test, not a
Hilbert inner product. Mathlib native Distribution tests real scalar TestFunction against
a real-continuous-linear map with values in the chosen real/complex output F. When F is complex, construct the canonical complex-linear extension to complex
scalar tests, `u_ℂ(f+ig)=u(f)+i u(g)`, and prove its topological inverse by
restriction. For a purely real F retain the real pairing; complexify F explicitly
before changing its scalar field. For bundle
valued tests use the bilinear dual-bundle contraction with the density, and apply this
real/complex comparison in local frames. Hermitian L² pairings, when used, are instead
conjugate-linear in the first argument and linear in the second and are explicitly
compared by complex conjugation. Preserve this distinction in Fourier duality. Define distributional derivatives by duality with the sign `⟨∂_μu,f⟩=−⟨u,∂_μf⟩`, multiplication by smooth coefficients, support, pullback and pushforward only under their exact support/properness/submersion hypotheses. Bridge Mathlib's `SchwartzMap`, `TemperedDistribution` and Fourier transform without weakening their topology or changing its normalization. Consume CK K5a.DistributionLocalStructure's positive-dimensional
`exp(1/‖x‖²)` distribution nonextension theorem and specialize it to the
p64 margin-corrected `e^{1/x²}` on `ℝ\{0}`. The common compact finite-order
bound contradicts the positive unit-ball-bump integral. Preserve the
originally written `e^{−x²}` and the margin correction distinctly. Every
locally integrable function on its full domain defines a distribution;
`e^{x²}` is smooth on ℝ and non-tempered, a separate growth example.
The analytic hyperfunction alternative and its full configuration/quotient
adapter are supplied at RQFT6.HyperfunctionAlternative.

For the course's one-dimensional local-primitive remark, consume
[CK K5a.DistributionLocalStructure](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality).
Its native finite-order C^k extension, two cutoff maps, H_m pairing/Fubini
identity and derivative theorem give the continuous primitive on every
smaller relatively compact interval. This is the source/coordinate adapter;
K5a owns those generic distribution theorems, the finite point-jet structure
and the literal series failure in D′. Preserve p64's literal Σδ^(n)/n!:
a compact smooth test equal near0 to1/(1+2x) gives terms2^n. The analytic-
functional exclusion and the sign-normalized factorial-square comparison
are supplied by HF5 only at RQFT6.HyperfunctionAlternative.

For the Fourier convention used in the handwritten pages, prove the transform on `𝒮(ℝⁿ)` maps to `𝒮`, the derivative and multiplication identities, convolution/product identities, inversion `F²f(x)=(2π)^n f(−x)`, and Plancherel with its exact `(2π)^n` factor. One source line gives `(2π)^n` while its later Schur-lemma argument appears to conclude `(2π)^(n/2)`; preserve this internal discrepancy, then derive the correct normalization directly from the declared transform. The p.19 conjugated identity `∫φ̂ ψ̄=∫φ overline(ψ̂)` is false for the declared kernel: the right side pairs φ̂(−y) with ψ̄(y). Prove instead the bilinear Fourier-symmetry identity and the sesquilinear identity with the inverse transform, alongside Plancherel. Extend it to tempered distributions by duality. For `D_j=−i∂_j`, prove `[D_j,x_k]=−iδ_{jk}` and the remaining Heisenberg relations. Prove the global Schwartz Hadamard lemma: if φ(0)=0 then `φ=Σx_jφ_j` with every φ_j∈𝒮, using a near-zero cutoff and a separate rapidly decaying division construction away from zero. Merely smooth local φ_j do not allow a Schwartz functional to act on them. Use this to prove the source's Schur-type statement: a continuous linear endomorphism of `𝒮(ℝⁿ)` commuting with all `x_j,D_j` is scalar, including the nowhere-zero Schwartz test and pointwise evaluation argument. Convert every result to Mathlib's `2π`-normalized Fourier transform.

For the source's functional-measure discussion, prove that an infinite-dimensional separable real Banach space admits no nonzero locally finite translation-invariant Borel measure. Use a finite-measure neighborhood of0, separability to show every smaller ball has positive measure, and infinitely many disjoint equal-radius ball translates within that neighborhood, supplied by Riesz separation. This rules out the stated Lebesgue-type carrier, not all random fields or probability measures. Consume [StochasticCalculus S1.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/422808d9f0e35719d8d0dc25b4d2967297026fa1/TauCetiRoadmap/StochasticCalculus/README.md#s1-gaussian-processes-and-constructed-brownian-motion) for Wiener laws on continuous path spaces; its native Gaussian/projective-law prerequisites alone do not give the continuous path law. A Gaussian scalar Z times any fixed smooth function ψ gives a smooth random field `X(x)=Zψ(x)` in every finite base dimension, so the source's blanket higher-dimensional impossibility is not a theorem. This finite-rank example supplies no interacting Lorentzian path-integral construction. Prove the source's elementary radial integrability comparison separately: in ℝⁿ, n≥1 and s∈ℝ, `|x|^(−s)` is locally integrable at0 exactly when s<n and integrable outside the unit ball exactly when s>n, including logarithmic divergence at equality; derive the n=1 source examples from the pinned improper-power integral lemmas.

Implement finite-dimensional Gaussian integration and generating functions as ordinary finite-dimensional integrals/sums. Define the formal functional integral only as coefficientwise perturbation/diagram notation. The course's `Dφ`, `√π^∞/√det A`, vacuum constants and normalized ratio are not measures in infinite dimensions. Use native `PowerSeries`/`MvPowerSeries` over the declared ℚ-algebra of coefficients. Define the formal logarithm on the normalized unit-constant series Z/Z₀, with Z₀ a specified invertible constant, by the coefficientwise log(1+t) formula; its t-adic convergence is formal. Any additive log Z₀ requires a separately chosen real/complex branch and is not supplied by a formal logarithm of an arbitrary unit.

For the free quadratic operator, state its nontrivial KG solution kernel and do not write `A⁻¹` as an actual inverse on the whole field space. A selected Green distribution is a right or two-sided inverse only between the specified source/solution spaces, with a boundary condition or quotient fixing its ambiguity. The source's normalized `Z(J)/Z(0)` cancels a formal vacuum factor; it does not define that factor. Keep UV divergence (singular extension at coincident points) distinct from IR divergence (large-distance/zero-momentum behavior). A positive mass removes the Euclidean zero-momentum singularity, but does not make a Lorentzian propagator rapidly decreasing in spacetime.

**RQFT0.OrdinaryDistributionBoundary.** Consume [ComplexKahlerGeometry K5a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md#L628-L653) for the generic density-valued test/distribution, chart/frame, restriction/gluing and finite-order carriers, and PDO P1.0 for the density-transpose differential-operator core. Use native `Distribution Ω F ⊤=TestFunction Ω ℝ ⊤ →L_c[ℝ] F` with compact-convergence topology; for complex-valued distributions use K5a's unique continuous complex-linear extension from real tests, `u_ℂ(f+ig)=u(f)+iu(g)`, and prove its agreement with the native complex-test tempered convention. Keep the compact-convergence ordinary-distribution topology distinct from the pointwise topology of TemperedDistribution. RQFT owns its model-specific Fourier/sign, mass-shell, equation and diagonal adapters on these existing carriers; the generic dual definition is a comparison to that supplier, not a parallel library.

**RQFT0.TestProductsAndFourierPhase — finite test products and the mass-shell convention.** For every finite n, prove that the complex span of products `∏_(j<n)f_j(x_j)`, `f_j∈𝒮(ℝ⁴)`, is dense in `𝒮((ℝ⁴)^n)` in its full Schwartz topology, and prove the compact-support version on every product of open regions Ω_j: for a compactly supported test on that product choose χ_j∈C_c∞(Ω_j) equal to1 on the projection of its support, and approximate it by finite tensor tests with all supports in the fixed compact product ∏supp χ_j. Convergence there is in every derivative seminorm, hence in its LF stage. Do not assert support-preserving tensor factorization for an arbitrary nonrectangular compact set. Include n=0, whose test carrier is ℂ. Use product cutoffs to reduce finitely many Schwartz seminorms to a compact rectangle, expand a smooth periodic extension there in its Fourier series, prove rapid decay of its coefficients by integration by parts, and multiply the finite Fourier sums by product cutoffs. Diagonalize over seminorms and growing rectangles. Prove continuity of test products, complex conjugation, variable permutations and the linear changes used in successive-difference coordinates. This is the finite-test-product comparison used below; it neither presupposes a pointwise product of arbitrary distributions nor substitutes L² density for Schwartz density.

Use `EuclideanSpace ℝ (Fin 4)` for the native Schwartz Fourier transform, keeping the Lorentz form as separate data. For a legacy `Fin 4→ℝ` test carrier construct the continuous-linear-equivalence pullbacks on Schwartz functions and their distribution duals; equivalence of finite-dimensional norms does not supply an inner-product instance for its sup norm. With native `𝓕_-f(ξ)=∫exp(−2πi⟨x,ξ⟩_Eucl)f(x)dx`, prove the exact restriction identity `Kf(p)=𝓕_-f(−ηp/(2π))` for `Kf(p)=∫exp(iη(p,x))f(x)dx`, `η=diag(1,−1,−1,−1)`. Transport the mass-shell and forward-cone supports through this index-lowering/reflection map. The formula `p=2πξ` belongs to the Euclidean negative-phase kernel; it is not the Minkowski positive-phase identification. Prove the corresponding derivative, measure/Jacobian and distribution-duality conversions before using either convention in RQFT3/RQFT4.

**RQFT0.RealLineBoundary — elementary real-line boundary values.**
This phase uses only the preceding test-space and Fourier interfaces.
Define PV(1/x) by the symmetric |x|>ε cutoff in the real test pairing.
The wavefront-set and product assertions are the later RQFT6 phase.

For ε>0 use the ordinary smooth functions `b_(±,ε)(x)=1/(x±iε)` and
construct their limits on the actual LF test carrier, then on Schwartz tests:

```
B_±=lim_(ε↓0)b_(±,ε) ∈ S′(ℝ),
B_+=PV(1/x)−iπδ,       B_−=PV(1/x)+iπδ.
```

Start with smooth real tests and prove the complex-linear extension identifies with native complex test spaces, including `𝓢(ℝ,ℂ)`; the complexified test still has no assigned value off the real axis. Prove the limits by
`1/(x±iε)=x/(x²+ε²)∓iε/(x²+ε²)`, odd cancellation for the first term
and the Poisson approximate identity for the second. Supply the seminorm
bounds giving continuity and convergence in the native compact-convergence LF-test dual topology, as supplied by K5a, and in the native pointwise Schwartz dual topology. Prove the required uniform-on-compact-test-set estimates rather than identifying these topologies with a strong dual topology by notation. A contour mnemonic
with ψ(z) requires a separately specified analytic test class or a proved
almost-analytic/boundary-limit construction; it does not define the
functional on arbitrary compact smooth real tests by itself.

Fix the angular negative-kernel transform `F_p u(p)=∫e^(−ipx)u(x)dx`,
with inverse factor1/(2π). Prove, as tempered distributions,

```
F_p B_−=2πi·1_(p<0),       F_p B_+=−2πi·1_(p>0),
f_−=B_−/(2πi),             f_+=−B_+/(2πi),
f_−+f_+=δ,                F_p f_−=1_(p<0), F_p f_+=1_(p>0).
```

The value at p=0 does not change these locally integrable distributions.
One real-test proof uses
`b_(−,ε)=i∫₀∞e^(−εt)e^(−itx)dt` and
`b_(+,ε)=−i∫₀∞e^(−εt)e^(itx)dt` in the Schwartz pairing, then passes
to the limit with the required Fubini and polynomial bounds. State convergence
in the native pointwise-convergence tempered dual topology. Under the
shared Mathlib Fourier supplier p=2πξ, the indicator formulas have the
same constants and signs with p replaced by ξ, whereas ∂ transforms as
2πiξ rather than ip. Prove this conversion through RQFT0's single
normalization adapter to the native Schwartz/tempered Fourier supplier.


## Milestone RQFT1 — Lorentzian equations and causal Green operators

Own reusable equation/solution data over Minkowski space and explicit candidate Green operators; do not claim the missing PDE theory is supplied merely by an elliptic or positive-Riemannian result.

* Klein–Gordon: for `m ≥ 0`, construct advanced and retarded Green operators `E_A,E_R : 𝒟(M) → C∞(M)` satisfying `P E_{A/R}f=f`, `E_{A/R}P f=f`, continuity into the stated smooth topology, and `supp(E_A f)⊆J⁻(supp f)`, `supp(E_R f)⊆J⁺(supp f)`. Prove uniqueness in these support classes and causal propagator `E=E_R−E_A`, with `P E=0` and the exact kernel/range quotient identifying spacelike-compact solutions with `𝒟(M)/P𝒟(M)`. Give the Fourier/mass-shell formulas under precise boundary-value prescriptions and prove equality to the PDE construction where established. The outputs are generally not compactly supported, so the target is smooth functions with the stated causal support, not `𝒟(M)`.
* Prove the flat hyperbolic Cauchy theory used by the KG construction. In source angular spatial momentum k, put `ω(k)=sqrt(|k|²+m²)` and construct the smooth zero-past solution by the spatial Fourier/Duhamel formula `û_R(t,k)=∫_{−∞}^t sin((t−s)ω(k))/ω(k) f̂(s,k)ds`, with the quotient continued as t−s at ω=0; the zero-future solution is `û_A(t,k)=−∫_t^∞ sin((t−s)ω(k))/ω(k) f̂(s,k)ds`. Prove the multiplier derivative estimates and differentiation/inversion on every compact time interval, the forced equation and zero Cauchy data. Establish the local energy identity with `e=(|∂_t u|²+|∇u|²+m²|u|²)/2`; integrate it on backward/forward truncated cones and use the nonnegative outward flux to prove finite propagation at speed one. Prove uniqueness for zero Cauchy data, including m=0 without assuming energy controls the constant mode; the initial value fixes that mode. Prove LF-to-C∞ continuity on each fixed compact-support stage by finite-time derivative estimates. Use the support and uniqueness results for both inverse identities and duality `E_R^*=E_A`. Construct the exact quotient/range theorem with a time cutoff on spacelike-compact solutions: the cutoff derivative is supported in a compact time slab intersected with J(K), hence gives a compactly supported source. These are RQFT1 targets and use RQFT0 Fourier/test functions and elementary energy/Stokes estimates, rather than an elliptic Green-function theorem. [Bär–Ginoux–Pfäffle, Chapters2–3](https://arxiv.org/abs/0806.1036) provides the Cauchy/Green proof reference; translate its plus/minus support labels into this chapter’s `E_R` (future-supported) and `E_A` (past-supported) before using its formulas; the flat Fourier construction and its native normalization comparison remain explicit targets here.
* Dirac: for a fixed gamma representation obeying `{γ^μ,γ^ν}=2η^{μν}I`, show `(iγ·∂−m)(iγ·∂+m)=−(□+m²)I`. Derive advanced/retarded Dirac propagators from KG Green operators with left and right inverse identities and causal support. Distinguish classical commuting spinor fields, Grassmann/graded fields and Hilbert-space CAR quantization.
* Maxwell: define the field strength `F=dA`, Maxwell operator and gauge transformation `A↦A+dχ`; state the gauge-fixed normally hyperbolic operator, the constraint on sources (`∂_μJ^μ=0`), residual gauge transformations, and the quotient or constrained solution carrier. Construct causal Green operators only after stating the Lorenz/Coulomb gauge and source/constraint hypotheses. Coulomb gauge additionally requires solving the spatial Poisson equation with boundary/decay conditions and proving the transverse-longitudinal decomposition; cite the PDE owner if a matching theorem exists, otherwise keep the exact target here. Consume LVF3’s fixed-external-current Maxwell variation and its source-free specialization, including its correction of UNSW p31’s omitted coupling; the causal solution construction remains here. For smooth conserved classical J_cl, prove `(∂_t²−Δ)A=j_T` in Coulomb gauge, where `j_T=j−∇Δ⁻¹ div j`; assume the chosen Poisson solution is unique under its decay/boundary conditions and prove its time-derivative compatibility from continuity of J_cl. For nonzero spatial momentum the projector is `P_T(k)=I−kkᵀ/|k|²`. On a spatial torus impose mean-zero charge for Gauss solvability and treat the harmonic zero modes separately. UNSW p30 writes full j in the spatial equation but transverse j in its Fourier equation; compare them through this projector rather than equating them.

**RQFT1.KleinGordonNonrelativisticLimit — the UNSW p32 scalar comparison.**
For m,ℏ,c>0 use QF6a's same Lebesgue L²(ℝ³;ℂ) carrier and its momentum
operator P=−iℏ∇. Construct the positive self-adjoint Fourier multiplier
`H_KG,c=(m²c⁴+c²|P|²)^(1/2)` with its maximal square-moment domain,
and `H_NR=|P|²/(2m)`. Use angular momentum p=2πℏξ in the native spatial
Fourier convention. Prove `φ_c(t)=exp(−itH_KG,c/ℏ)f` solves
`(ℏ²∂_t²−ℏ²c²Δ+m²c⁴)φ_c=0` distributionally for every f∈L².
Its Cauchy data satisfy φ_c(0)=f; the L² derivative
`∂_tφ_c(0)=−iH_KG,c f/ℏ` is asserted only for f in dom(H_KG,c).
For Schwartz data prove the classical equation and compare it with RQFT1's
Cauchy solution. This selects the positive-frequency branch of KG data.

After removing the rest phase put
`U_c(t)=exp(−it(H_KG,c−mc²I)/ℏ)` and `U_NR(t)=exp(−itH_NR/ℏ)`.
For every κ≥0 and f supported spectrally in |P|≤κ, prove
`‖(U_c(t)−U_NR(t))f‖≤|t|κ⁴‖f‖/(8ℏm³c²)`.
First prove the scalar bound
`0≤r²/(2m)−(sqrt(m²c⁴+c²r²)−mc²)≤r⁴/(8m³c²)` for r≥0,
then use the spectral multiplier and phase-difference estimates. For every
f∈L² and T≥0 deduce `sup_(|t|≤T)‖(U_c(t)−U_NR(t))f‖→0` as c→∞
by momentum truncation and the unitary norm bounds. Match U_NR to QF6a's
Schrödinger evolution with ℏ restored; do not identify arbitrary two-branch
KG Cauchy data with this first-order evolution. The suggested scalar bounds
appear in [CourseExamplesSuggested.lean](CourseExamplesSuggested.lean).

**Current and Coulomb convention bridge (LVF3 → RQFT1/RQFT4/RQFT9).** LVF3 fixes the classical convention `L_J=−F_{μν}F^{μν}/4−J_cl^μ A_μ`, hence `∂_μF^{μν}=J_cl^ν` for a smooth external source. Transfer the index/sign convention, not the classical source itself, to RQFT4: for its operator-valued current `𝒥^ν` in the Wightman field family write `∂_μF^{μν}=𝒥^ν` and set `j^{(4)}_μ:=−η_{μν}𝒥^ν`. Then `∂^νF_{μν}=j^{(4)}_μ` in the same `(+---)` metric. No c-number external source is identified with this operator current. In RQFT1's classical Euclidean three-vector equation, bold `j` means `(J_cl^i)_{i=1}^3` and bold `A` means `(A^i)_{i=1}^3`; `j_T` is the Euclidean transverse projection of those components. For comparison define the classical lower-current notation `j_cl,μ:=−J_cl,μ`; then `j_cl,i=J_cl^i` and RQFT9's charge is `ρ:=J_cl^0=J_cl,0=−j_cl,0`, with `A_0=A^0`. Distinguish the electric components: `E_phys^i=F_{0i}=−∂_tA^i−∂_iA^0`, while RQFT4's lower components are `E_i^{(4)}:=−F_{0i}=−E_phys^i`. Thus the operator equation is `Σ_i∂_i E_i^{(4)}=j^{(4)}_0`; in the classical comparison it reads `Σ_i∂_i E_i^{(4)}=j_cl,0=−ρ`, equivalently `div E_phys=ρ`. RQFT9's `E=−∇Φ` is this physical three-vector in the static case. In the static case, or in time-dependent Coulomb gauge `div A=0`, Gauss' equation yields `−ΔA_0=ρ`, consistent with `U=eA^0`. Prove these index, current-type and gauge reductions from the fixed convention. RQFT4's charged-potential consequence uses the operator current dictionary; the classical current and the two source-free/weak-locality obstruction targets remain separate. Preserve any literal source omission or sign discrepancy.

For the source's UNSW p.33 oscillator check, with `[q,p]=i`, the literal denominator `m√(2ω)` gives `[a,a⁺]=1/m`. Prove the normalized operators with denominator `√(2mω)` have unit commutator and `H=ω(a⁺a+1/2)`, and carry that normalization into the finite-volume field modes. Keep the literal source denominator and its inconsistent claim separate.

The scalar Feynman two-point distribution, retarded/advanced distributions and positive/negative frequency mass-shell distributions are distinct objects. Define each by the precise `i0` boundary value, Fourier normalization and mass convention. Prove which solve the inhomogeneous equation, which solve the homogeneous equation, and their covariance/support/wavefront properties. In the massless case explicitly construct the light-cone boundary value; do not define it by an invalid limit of coalescing poles. Use the forward kernel `Kf(p)=∫exp(iη(p,x))f(x)dx` and inverse kernel `(2π)^(-d)exp(−iη(p,x))dp` for the angular physical four-momentum in this paragraph. The time-ordered scalar vacuum two-point function has symbol `i/(q(p)−m²+i0)` in this convention. Prove its distributional equation and transport its constants by `ξ=−η♭p/(2π)`. The Feynman quadratic symbol is unchanged by this sign/metric reflection, while the supports of the positive/negative-frequency distributions `W_±` must be transported separately; their energy labels cannot be carried through `p=2πξ`. The latter substitution applies only to the Euclidean negative-phase kernel specified in the conventions. For massless spacetime dimension d≥3 construct the position-space boundary value `C_d(−q(x)+i0)^(-(d−2)/2)`, with C_d computed from that Fourier prescription, and prove its homogeneous extension across zero. In d=2 construct the logarithmic fundamental solution with its additive scale ambiguity and the stated infrared prescription. Treat the d=1 ODE separately. Source p.76 takes the upper-half-plane boundary value `(q+i0)^(-1/2)`. Derive its metric/sign and branch conversion separately; it is not the displayed `(−q+i0)` prescription without that comparison. The source p.76 half-power has degree −1 and gives the correct position-space power only in d=3; its application to general d and its d=2 exception are inconsistent. Preserve that source claim, but do not replace the position variable by momentum while retaining the half-power. Away from zero, dq is surjective and P8 supplies the pullback; the extension and its constants are additional targets. Prove the source's Huygens statement for advanced/retarded massless solutions only in exact even spacetime dimensions `d≥4`, under the standard flat-space hypotheses. Classify Lorentz-invariant tempered fundamental solutions in the stated causal, spectral and boundary-value classes, determine the homogeneous ambiguity in each class, and derive the source's `Δ_++Δ_-=Feyn_1+Feyn_2` relation only after fixing normalization constants. The Borcherds list of “six interesting solutions” is treated as a source assertion to classify/correct one-by-one, not accepted as six unnamed objects.

**RQFT1.MassivePrescriptions — the six distributions and their exact relations.**
In this paragraph take m>0 in four-dimensional Minkowski space. Use complex
ordinary/tempered distributions and the preceding physical Fourier transform K.
Set `h(p)=q(p)−m²`, `ω(k)=sqrt(|k|²+m²)`, and define shell distributions
by `D_±(f)=∫_(ℝ³) f(±ω(k),k)d³k/(2ω(k))`. There is no (2π) factor
in this definition. Prove continuity on Schwartz tests, shell support and
invariance under the connected proper-orthochronous Lorentz group, with the
coarea comparison `D_±=1_(±p⁰>0)δ(h)`. Since m>0, dh is nonzero on
both shells. Construct `Q=PV(1/h)` by the symmetric |h|>ε cutoff in the
Schwartz pairing, and prove its tempered continuity and hQ=1.

Normalize the four fundamental solutions by `P G=δ`, for `P=□+m²`.
Since K sends P to multiplication by −h, prove the following table in
momentum distributions:

| Kernel | K-transform | Regularization defining the boundary value |
| --- | --- | --- |
| G_R | `−Q+iπ(D_+−D_−)` | `−lim_(ε↓0)((p⁰+iε)²−ω²)⁻¹` |
| G_A | `−Q−iπ(D_+−D_−)` | `−lim_(ε↓0)((p⁰−iε)²−ω²)⁻¹` |
| G_F | `−Q+iπ(D_++D_−)` | `−lim_(ε↓0)(h+iε)⁻¹` |
| G_aF | `−Q−iπ(D_++D_−)` | `−lim_(ε↓0)(h−iε)⁻¹` |

Derive the limits from RQFT0.RealLineBoundary by shell coordinates and
Schwartz estimates, and prove the causal R/A kernels agree with the earlier
Cauchy construction by their support and uniqueness. The regularization
of G_R puts both energy poles below the real axis for the inverse kernel
exp(−iη(p,x)); G_A puts both above. Show which side is used before any
contour argument. Transport every entry through RQFT0's native Fourier adapter.

Put `W_±=K⁻¹(2πD_±)`; these are the two homogeneous solutions, with
`P W_±=0`. Prove, as distribution identities,

```
G_R+G_A=G_F+G_aF,
G_F−G_A=iW_+,       G_F−G_R=iW_−,
E=G_R−G_A=i(W_+−W_−).
```

The time-ordered scalar vacuum function is `D_F=−iG_F`, whose symbol is
`i/(h+i0)` and whose source is `P D_F=−iδ`. The anti-time-ordered
function is `D_aF=iG_aF`, with symbol `−i/(h−i0)` and source `+iδ`.
Prove their vacuum-moment comparisons on the common free-field core; with
this E convention the commutator is `−iE`. The four δ-normalized G kernels
and the two W kernels thus give the source's six named objects with their
inhomogeneous versus homogeneous equations distinguished.

Prove the full massive invariant classification: in momentum space every
complex Lorentz-invariant tempered U with hU=0 is uniquely `aD_++bD_−`.
First use the smooth defining function h to remove normal derivatives,
then prove invariant distributions on each transitive shell are scalar
multiples of its invariant measure. Consequently the invariant fundamental
solutions have Fourier transforms `−Q+aD_++bD_−` and form a complex affine
plane. Its real position-space members satisfy `b=conj(a)`. Prove D_+,D_−
linearly independent; among the four G kernels the only linear relation,
up to scalar multiple, is the first displayed relation, and their linear
span has dimension3. There are further relations in the full six-object
list. This does not restrict the unconstrained infinite-dimensional
homogeneous kernel in FundamentalSolutionAffineCarrier.

On source pp72–73 the labels Δ_± refer to the causal pair, rather than W_±.
Compare its unordered pair with {G_R,G_A} and Feyn_1,Feyn_2 with {G_F,G_aF}
after the common source normalization; do not infer a time orientation from
a faint sign label alone. The sum identity is independent of these
within-pair source labels. The massless cone vertex and lower-dimensional
exceptions retain their separate RQFT1/RQFT7 hypotheses; this massive affine
classification supplies no classification across that singular vertex.
[MassivePrescriptionTargets.lean](MassivePrescriptionTargets.lean) records
native Schwartz/tempered target forms for the shell and boundary pairings.

**RQFT1.FundamentalSolutionAffineCarrier.** For each declared linear distribution carrier 𝓔 stable under the fixed constant-coefficient operator P, with its distinguished delta source in that carrier, define Fund(P;𝓔)={E∈𝓔:PE=δ}. Given one E₀ in it, prove the exact affine equivalence `ker(P:𝓔→𝓔)≃Fund(P;𝓔)`, u↦E₀+u, with inverse E↦E−E₀. State the empty case when no fundamental solution exists. Apply separately to ordinary and tempered distributions and transport through the declared Fourier convention. Lorentz-invariant causal, spectral and selected boundary-value families are additional constrained subclasses; their named classification does not replace this general homogeneous-solution freedom. This concerns distributional fundamental solutions, not an inverse of P on all fields or an unrestricted Green-operator uniqueness statement.

## Milestone RQFT2 — Lorentz spinors and classical-to-quantum field bridges

Consume D8's Fock carrier with QF4's generic Fock and second-quantization API, LVF's finite Lorentz-module/gamma covariance carrier, and NoncompactQuantumSymmetry's group representation; prove the missing bridge for fields. Specify the connected cover `Spin₀(1,3)≅SL(2,ℂ)`, the full Lorentz group extension and action on scalar, vector, Dirac, Weyl and dual spinor bundles. Verify the chosen `η` signature and gamma anticommutator convention against LVF's `Q=−g` conversion.

For p89's scalar factorization claim, work over ℂ with constant scalar first-order factors `(a·∂+α)(b·∂+β)` and compare every coefficient. The symmetric principal matrix is `(abᵀ+baᵀ)/2`, of rank at most two, so no nondegenerate scalar quadratic operator in dimension d≥3 has such a factorization, even at zero mass. In d=2 a nondegenerate principal matrix forces a,b independent; for nonzero mass the absence of a first-order term gives `βa+αb=0`, hence α=β=0, contradicting the nonzero constant term. In massless 1+1 dimensions `(∂_t−∂_x)(∂_t+∂_x)=∂_t²−∂_x²`; the exception is in d=2, not four-dimensional massless spacetime. For d=1 the complex scalar quadratic polynomial factors; a real-factor statement needs its discriminant condition. The source's fixed ansatz `(a·∂−m)(b·∂+m)` gives the stronger rank-one obstruction when m≠0. Symmetrize its displayed coefficient equation in i,j; commutation of scalar derivatives, not diagonality of g alone, is the reason. Preserve the literal `∂_i∂^iφ=m²φ` in the source's (−,+,+,+) convention: negating that metric gives this chapter's `(□+m²)φ=0`. RQFT1's physical iγ factorization has matrix coefficients and is a separate construction.

For the Clifford source presentation on pp.89–90 consume Mathlib's
`CliffordAlgebra.lift`, `evenOdd`, graded-algebra instance, `equivExterior`
and `prodEquiv`, together with SpinRepresentations' standing conventions.
Compare `v²=Q(v)` and `vw+wv=polar(Q)(v,w)` with the physical gamma relation,
including its factor2. In the tensor-algebra presentation prove the ideal
generated by `v²−Q(v)1` is parity graded, so the grading descends. Its
generators are even; the full two-sided ideal need not be contained in the
even part. In the one-generator example Q(v)=1 it contains the nonzero odd
element `v(v²−1)=v³−v`. Preserve the p.90 even-ideal inclusion as a source
error. Derive the source module, ordered-monomial dimension and graded-tensor
comparisons from those native Clifford suppliers with their actual hypotheses;
RQFT owns this source/metric adapter.


Define isoclinism by compatible isomorphisms of G/Z(G) and [G,G] intertwining
the commutator map; prove its equivalence relation and compute Q₈/D₈ explicitly.
Consume [SpinRepresentations Layer7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a1bdd8986df636b649f101a1afde10f32535bd85/TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md#layer-7-real-clifford-algebras-bott-periodicity-and-spinp-q)'s
full normalized real Clifford cover `N=±1`, with `v²=Q(v)` and `N(v)=−Q(v)`.
Keep Borcherds p.97's norm-one group and native `pinGroup` separate from
p.110's full cover. For `Q=realCliffordForm 3 1` a normalized timelike vector
has Q=−1 and lift square −1; the opposite form gives square +1.
In the complexified Clifford algebra define the phase cochain
`a_ε(g)=i^(ε(g))`, where ε is determinant parity or the descended norm-sign
character with values in ℤ/2. Its central product defect is
`a_ε(g)a_ε(h)/a_ε(gh)=(−1)^(ε(g)ε(h))`; it is not a multiplicative U(1)
character. Construct the twisted multiplication, normalized cocycle, topology
and map to the same Lorentz group, and prove its kernel remains `{±1}`.
The determinant twist changes reflection squares from Q(v) to −Q(v) and
identifies the opposite-signature full cover after complexification. The norm-sign
twist makes every reflection lift square −1. Compute P/T squares and their
commutator in all three models; central rescaling preserves commutators.
Prove the centers, quotient and derived-subgroup comparisons needed for their
isoclinism; central rescaling alone is not a real group isomorphism. Prove the
finite spinor action, its continuity, and the norm-sign-twisted action commuting
with the selected antilinear real structure on `S⊕S*`. The last p.111 sentence
is incomplete source data, not a stated classification theorem.


**RQFT2.BorcherdsCliffordSource — full pp91–118 comparison.**
Consume SpinRepresentations Layers0/1/2/4/7 and the actual native
`CliffordAlgebra.reverse`, `involute`, their commuting relation, center/even-center
and even/odd matrix equivalences. Preserve the source's zero-rank exceptions,
finite signed-monomial group normal forms and both central-character sectors.
For p92 G is the group generated by the signed vectors, not just that displayed
set; odd volume elements give separate singleton conjugacy classes. The existing
finite-monomial owner preserves p94's superscript-placement ambiguity
separately from the exact count `2^n+2`. Keep p94's informal
noncanonicity comment separate from the chosen-polarization spin construction
and its actual projective O-action; it is not a prohibition on canonical regular
modules. For p96 use k* rather than the literal R*, and retain the cramped
norm proof separately. With t=reverse, put u=x^t alpha(x). Transposing the
source normalizer equation gives u y=y alpha(u); the twisted scalar-kernel
lemma then makes alpha(u)=bar(x)x scalar, and conjugation gives x bar(x).
Consume OrthogonalSpinGroups1A–1E for its generic norm/kernel/reflection APIs;
its reverse spinor norm theta_r has theta_r(reflection_v)=[Q(v)], whereas the
source star norm has theta_s(reflection_v)=[-Q(v)]. Prove
`theta_s(g)=[-1]^(det-parity(g)) theta_r(g)`. Thus on positive real Q the
source norm-sign equals determinant, on negative real Q it is trivial, and
on indefinite Q the two signs are independent. The placement on p98 of the
“exactly determinant” phrase relative to the definiteness labels is ambiguous;
retain that placement as literal evidence separately from these three exact
sign statements. An odd coset of norm-one Pin
exists only when that group actually has an odd element; positive-definite
real native Pin equals Spin. Keep the norm-one versus full N=±1 cover
separate throughout.

**RQFT2.QuaternionPauliModel — the p101 explicit splitting.**
For q=a+bI+cJ+dK in the native real quaternion algebra use
`ρ(q)=[[a+ib,c+id],[−c+id,a−ib]]`.
Prove this is a unital real-algebra map, with the source's exact I,J,K
matrices and multiplication signs. Extend it complex-linearly to
`ℂ⊗[ℝ]ℍ[ℝ]≃ₐ[ℂ]M₂(ℂ)`, sending z⊗q to zρ(q); prove the four
images span M₂(ℂ) and give the inverse matrix-coefficient formulas.
Compare the source's reversed tensor order by the tensor flip, keeping
track of which factor carries the complex scalar action. Consume the existing
`TauCeti.Quaternion.complexTensorAlgEquivMatrix` for the abstract splitting;
prove that its comparison with this explicit splitting is conjugation by a
complex invertible matrix, using the native matrix inner-automorphism API
or `TauCeti.exists_unit_conj_of_algEquiv`. An arbitrarily chosen splitting
need not have the displayed generator values. Keep the separate existing
`tensorSelfAlgEquivMatrix` and its conjugation/opposite action for ℍ⊗ℍ.
Suggested exact realization and comparison statements are in
[CourseExamplesSuggested.lean](CourseExamplesSuggested.lean).

For p102's plane reduction, let E have anisotropic orthogonal basis e1,e2,
Delta=Q(e1)Q(e2) and volume z=e1e2. The generators fz for f in F commute with
e1,e2 and square to(-Delta)Q(f). Prove the resulting ORDINARY algebra
isomorphism `Cl(E⊥F)≃Cl(E)⊗Cl((-Delta)Q_F)` by the universal property,
generator recovery (z is invertible), and dimension/inverse comparison.
It is distinct from the always-valid graded tensor product with unscaled Q_F.
The single z generates only the plane's even subalgebra, not all Cl(E).
Preserve the source hats and F-plus-negative-determinant notation as literal
ambiguities. For the even-algebra recurrence use e1ei with i≥2, omitting the
source's odd e1; distinct such generators anticommute and their squares are
-Q(e1)Q(ei). Derive every legible real table entry, matrix size, two-step and
8-step recurrence from Layer7, without assigning coordinates to faint cells.
Source index p-q maps to the roadmap's k=q-p by k=-(p-q) modulo8. With that
k the base types at0,…,7 are respectively R,C,H,H⊕H,H,C,R,R⊕R;
fix all matrix sizes by dimension and the native base entries. Majorana means
a real structure on the chosen complex module, not merely a module over a
real algebra. Include the full/even and zero-rank distinctions before converting
the source's one-negative-direction dimension conditions.

In the literal chiral Pauli basis of pp106–108 compute all gamma relations,
`gamma5=i gamma0 gamma1 gamma2 gamma3=diag(-I2,I2)`, and the rank5
nonfaithful extension with its chosen fifth square. Compare this source basis
with RQFT2's physical basis by an actual Clifford intertwiner. Distinguish
numeric spinors from the doubled formal generators: on numeric spinors the
maps C=(-i gamma2)K and T=(-gamma1 gamma3)K are antilinear, while the source
formal doubled carrier declares C linear and T antilinear. Prove the adapter
and all printed component relations, deriving any additional components as
target calculations rather than claiming unseen source glyphs. For commuting
numeric components, `Cmat† gamma0 Cmat=-gamma0` gives a negative mass
bilinear; the Grassmann reordering sign restores the fermionic invariant.
Prove the bilinear action on the selected graded carrier instead of assuming
p109's invariance under an unspecified star. In p111 S* is the specified
labelled copy with its pairing identification. For a real N-similitude A,
N=±1, `diag(A,N A)` preserves the off-diagonal bilinear form and commutes or
anticommutes with antilinear copy-swap according to N. Multiplying N=-1
lifts by i makes them commute with that real structure but changes the complex
bilinear multiplier by i². Record both statements; no unproved simultaneous
pairing invariance or genuine O-action follows after discarding the central lift.

For pp113–114 consume native
`Matrix.GeneralLinearGroup.innerAut_surjective` and `ker_innerAut` for the
K-linear inner-automorphism step in the already specified anti-involution
exercise. Use exact matrix units `Ekl Eij=delta_(l,i) E_kj`; p114's first
literal formula has an index/diagonal-idempotent ambiguity. The correct form
identity is `tau(a)^T S=S a`, hence `tau(a)=S^(-T) a^T S^T`.
After the involution condition gives `S^T=±S`, this becomes
`tau(a)=S^-1 a^T S`; retain p113's
mismatched barred variables and p114's overwritten middle lines separately.
Do not extend innerness to semilinear ring automorphisms of the scalar field.

For p109 consume [LieGroups Layer5](../RepresentationTheory/LieGroups/README.md#layer-5-simply-connected-covers-and-the-enveloping-algebra)'s connected finite-dimensional real Lie-group universal covering homomorphism with discrete central kernel. Keep that topological category distinct from [InductionRestriction Layer7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7f4bfabdd1853a87f68a450756ba95deb068d2a9/TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md#layer-7-projective-representations-factor-sets-and-the-schur-multiplier)'s abstract perfect-group universal central extension. Prove the cover/lift comparison only in its stated category; neither connectedness nor the source's not-perfect/not-connected remark classifies all central extensions.

For p99 consume **OrthogonalSpinGroups1G–1H** on the existing general-field carriers. In odd finite characteristic the joint determinant/spinor map is onto in every rank≥2 and its kernel Ω is [O,O]; rank0/1 are separate. Consume the full fixed rank/Witt/field-size table, including nonperfect Ω₃(3), nonperfect split Ω₄⁺(3), the always nonsimple split projective rank4 product, nonsplit Ω₄⁻(3)≃A₆, and the all-odd-field rank≥5 perfect/simple-central-quotient theorem. Distinguish Ω/Z(Ω) from the literal “quotient is the centre,” and preserve the source's “usually” wording as source data. The primary q>3 comparison does not itself prove the q=3 targets. Over ℚ consume the sign/prime direct-sum square-class theorem and the exact joint-image table: binary norm groups and their Hilbert-symbol membership tests, the rank≥3 definite positive-spinor image and indefinite full-spinor image, and each determinant's odd reflection coset. In particular negative-definite reverse norm has its sign tied to determinant; apply the already pinned star/reverse dictionary for the source N. This gives an infinite elementary2-rank abelian quotient in every rational rank≥3, without claiming a full rational abelianization or rational-kernel perfectness. OrthogonalSpinGroups owns these reusable results, consuming native range/binary/quaternion/isotropic suppliers, GlobalQuadraticForms' local–global targets and the required finite orthogonal root/normal-subgroup proof. RQFT2 owns only this source/norm-convention adapter.

Consume SpinRepresentations Layers1/4’s complex Clifford matrix-algebra classification for the nondegenerate four-dimensional form. Use native `CliffordAlgebra.equivBaseChange` to compare the complexification of the real Lorentz form with that complex algebra, explicitly converting LVF’s `Q=−g` and this chapter’s gamma-square convention. Prove UNSW p16’s minimal gamma-matrix size: a nonzero finite-dimensional unital complex module for the full Clifford algebra has dimension divisible by4, by decomposing it with the matrix units of `M₄(ℂ)`; the displayed four-dimensional Dirac model attains the minimum. A two-component Weyl module is a module for the even algebra, not a smaller representation of all four gamma generators.

In the fixed `(+---)` convention, check both UNSW p17 gamma-matrix realizations against the Clifford relation, the Pauli multiplication formula, `γ⁰(γ^μ)†γ⁰=γ^μ`, and the trace identities `Tr γ^μ=0`, `Tr(γ^μγ^ν)=4η^{μν}`. Use the displayed standard representation to define `α^i=γ⁰γ^i`; in the alternate representation compute `γ⁰γ^i` in the alternate realization (similar to, but not equal to, the displayed standard α). For unit spatial n prove `(Σ·n)²=(α·n)²=I`, derive the source rotation lift `U_R=exp(iφΣ·n/2)` and `U_R(2π)=−I`, and the boost lift `U_B=exp(−θα·n/2)` with `α^i=γ⁰γ^i`. Derive the Lorentz matrices induced by `U⁻¹γU` with active/passive and upper/lower index conventions fixed. Compare them with the displayed p18–19 matrices: the transcribed p19 time-space block has opposite off-diagonal signs and determinant `cosh(2θ)>1` for θ≠0. It cannot be a Lorentz matrix; index raising/lowering or active/passive conventions do not repair its determinant. Keep the literal block separate from the derived Lorentz matrix. Retain the p18 plane-label and p17 velocity-limit uncertainties as source data.

Build covariant first-order Dirac solutions and the Dirac adjoint with the invariant indefinite pairing `ψ̄=ψ†γ⁰`; do not conflate this finite-dimensional invariant pairing with a positive Hilbert inner product. Define chiral projectors after choosing the dimension/signature-dependent `γ⁵` normalization; prove anticommutation, idempotence and covariance under the stated connected subgroup. State Majorana reality as an antilinear equivariant structure with its exact signature condition; do not transfer the course's real-form classification to all signatures. Implement P, C and T as convention-pinned linear/antilinear maps, prove their action on the Dirac equation and bilinears, and separately record which group relations hold up to central phase.

From the covariant classical solution spaces define the one-particle positive-frequency Hilbert space using the declared invariant inner product and mass-shell measure; prove positivity, completeness, Lorentz covariance and the map to the selected positive-energy Poincaré representation. State separately the finite-volume mode normalization used by the UNSW notes and its continuum delta-normalized limit. Derive scalar and spinor mode expansions, charge and Hamiltonian on the finite-particle domain. A divergent vacuum-energy constant is handled by a stated normal-ordering/renormalization convention, not set to zero as an equality of unregularized infinite sums.

## Milestone RQFT3 — free fields as operator-valued tempered distributions

For each scalar/spinor/vector model construct a common invariant dense domain `D`: the algebraic span of finite creation-operator products on the vacuum with one-particle arguments in the complex span W of all `U₁(g)Kf`, `f∈𝒮(M)` and g in the selected spacetime group (and the analogous particle/antiparticle maps in the other models). For genuinely covariant scalar/field-strength test maps prove this equals the span of their test-created vectors; for a fixed-frame gauge potential use the displayed orbit span rather than assume its original test image invariant. Prove W dense and invariant under the specified spacetime action, and prove creation and annihilation with these arguments preserve D. Compactly supported smooth momentum functions supply density tests, but their finite-particle span alone is not preserved by creation of general Kf. Use D in the selected Fock space `H`. Initially define `E` and the field for compactly supported tests `f∈𝒟(M)`. Before indexing fields by `𝒮(M)`, prove the continuous extension in Schwartz seminorms and the tempered-distribution bounds. A field is an operator-valued distribution `φ(f):D→H` whose matrix coefficients are continuous tempered distributions in `f∈𝒮(M)`; state which estimates give closability and which larger domain is used for products. No pointwise operator `φ(x)` is presumed to exist. Prove covariance on D, the distributional field equation, vacuum cyclicity where claimed, and two-point/commutator functions with the exact normalizations.

**Box/continuum one-particle comparison.** For a finite-dimensional complex Hilbert fiber V, let `h=2π/L` and `C_(h,k)=k+[−h/2,h/2)^3`, `k∈hℤ³`. Define `A_h:L²(ℝ³;V)→ℓ²(hℤ³;V)` by `A_h f(k)=h^(−3/2)∫_(C_(h,k))f(p)dp`, and `E_h:ℓ²(hℤ³;V)→L²(ℝ³;V)` by the cellwise constant value `h^(−3/2)a(k)`. Prove they are continuous linear maps, `E_h` is isometric, `A_h=E_h*`, `A_hE_h=id`, `‖A_h‖≤1`, and `E_hA_h f→f` strongly for every L² class. On Schwartz packets prove agreement in the limit with `h^(3/2)f(k)` and the Riemann-sum inner-product comparison. Define the finite-mode cutoff projections on each full box one-particle space and prove their strong convergence to identity at fixed h before taking h→0. The maps compare one-particle carriers; their field-theory applications are convergence of vacuum and finite-particle polynomial matrix elements, derived from the packet Gram limits and the Wick/Fock domain API.

* Scalar field: take the one-particle space `h_m=L²(H_m^+,dμ_m)`, `H_m^+={p:p²=m²,p⁰>0}`, and fix `dμ_m=d³p/((2π)^3 2√(|p|²+m²))` (with the massless origin handled separately). Define the positive-frequency map `Kf(p)=∫_{M}e^{ip·x}f(x)d⁴x` with the declared Fourier convention and `φ(f)=a(K\bar f)+a†(Kf)`, with a conjugate-linear and a† complex-linear in their one-particle arguments. For real f this is `√2 Φ_D8(Kf)`, where QF4 proves the D8 normalization adapter `Φ_D8(h)=(a(h)+a†(h))/√2` on the finite-particle core. Prove every vector of this core is analytic for `φ(f)` and use Nelson's theorem to identify the closure of `φ(f)`, initially defined on the finite-particle core, with `√2Φ_D8(Kf)`. Only after this closure equality infer `exp(iφ(f))=W_D8(√2Kf)` and its vacuum characteristic function `exp(−‖Kf‖²/2)`, consistent with `⟨Ω,W_D8(h)Ω⟩=exp(−‖h‖²/4)`. Show this rescaling before comparing normalizations. Prove f↦φ(f) complex-linear and `φ(f)*|D=φ(\bar f)` by the adjoint pairing on D. Prove this is independent of representative modulo the KG equation, continuous in the Schwartz test, and yields the chosen two-point distribution. Define the bilinear test pairing `E(f,g)=∫f(x)(Eg)(x)d⁴x`, with `E=E_R−E_A`, and establish `[φ(f),φ(g)] = −i E(f,g) I` on D. Derive the sign from the mass-shell sine kernel and check the equal-time field/momentum bracket; the alternative advanced-minus-retarded convention changes it to +i. Compute the vacuum two-point function with positive-energy spectrum support. Show microcausality from support of the causal propagator.
* Dirac field: use CAR on the positive/negative energy spinor mass-shell space, spinor solutions of `(γ·p−m)u(p,s)=0`, and the analogous `v` solutions. Fix their normalization and completeness/spin-sum identities, define particle/antiparticle creation modes on the common finite-particle domain, and prove the anticommutator distribution and causal support. The classical commuting-spinor equations in the lecture notes do not themselves supply a fermionic quantum field; prove graded locality separately.
* Photon/Maxwell field: over each nonzero future null k define the complex polarization quotient `P_k={ε∈ℂ⁴:k·ε=0}/ℂk`, with Hermitian form `−bar(ε)·ε′`. Prove it is well-defined, positive and dimension2, with the helicity ±1 decomposition (NQS M4 labels ε=+1, ℓ=±2) and invariant mass-shell L² completion; do not assume a global continuous polarization frame. This is the physical one-photon supplier for the scattering examples. Specify separately whether the field realization uses this physical transverse-photon Hilbert space, a gauge-fixed indefinite-metric state space, or a local observable algebra. State Gauss law, constraints, test-function quotient and observable subalgebra; do not treat all four-potential components as independent positive-metric physical oscillators.
* For UNSW pp50–51, construct the source-free Hermitian transverse potential in a fixed inertial frame with `A⁰=0` and `div A=0`, on a periodic box of side L with a finite negation-symmetric set of nonzero modes. Choose orthonormal transverse polarization vectors at these finitely many momenta, take `ω_k=|k|`, and derive the `1/√(2ω_k L³)` normalization with unit mode CCR. Derive the electric/magnetic expansions and `H=Σ_{k,α}ω_k(a†_{k,α}a_{k,α}+1/2)` on the finite-particle core; subtracting the finite vacuum scalar `Σω_k/2` gives the number-operator Hamiltonian. Pair spatial components by the Euclidean dot product and periodize spacetime tests in their spatial variables before pairing with the box field. For complex Schwartz vector tests f,g define `Kf(k)=∫e^{i(|k|t−k·x)}f(t,x)dtd³x`. Prove convergence of the vacuum sesquilinear two-point functions `⟨Ω,A(f)*A(g)Ω⟩` to `∫overline(Kf(k))·P_T(k)Kg(k) d³k/((2π)³2|k|)`, with `P_T(k)=I−kkᵀ/|k|²`. Remove the momentum cutoff first at fixed L, then take L→∞, proving convergence in the Schwartz-test topology through uniform seminorm bounds. The finite polarization sum equals P_T, so the limit is independent of those choices. Convert invariant-measure wavefunctions F to Lebesgue wavefunctions `f=F/√((2π)³2|k|)` and prove this rescaling is unitary. For smooth compactly supported transverse f with support away from zero, define point-sampled box coefficients `f_L(k)=(2π/L)^(3/2)f(k)` and prove convergence of their norms and inner products by Riemann sums. Use the full photon box one-particle space `ℓ²(hℤ³∖{0};k⊥)` with its finite-mode cutoff projections. Exhaust those projections at fixed h before h→0. Build the full L² comparison using the preceding cell-average map: at k≠0 take transverse coefficients `P_T(k)A_h f(k)` and set the zero-mode coefficient to zero. Prove this map is well-defined on L² equivalence classes and contractive. Reconstruct an ambient Lebesgue L² vector function by giving its k-cell the constant value `h^(−3/2)P_T(k)A_h f(k)` (zero on the zero-mode cell), and prove strong convergence to every transverse f as h→0. Use density of the smooth transverse core, convergence of ordinary cell averages, and bounded convergence for the cellwise projectors; control the omitted zero-mode cell by absolute continuity of the L² integral. On the smooth core prove the averaged and sampled coefficients differ by a norm tending to zero. Polarization frames give coordinates in each finite box fiber and preserve these norms. For a Schwartz spacetime test g, the field creates the chosen off-zero function `v_g(k)=P_T(k)Kg(k)/sqrt((2π)^3 2|k|)`. Its box coefficients are `h^(3/2)v_g(k)`, k≠0. Prove their ℓ² distance from `P_T(k)A_h v_g(k)` tends to zero: near zero use `Σ_(0<|k|<δ)h³/|k|≤Cδ²` and the corresponding continuum L² bound; away from zero use derivative and rapid-decay estimates. Then the reconstructed box one-particle field vector converges to the continuum vector. Sampling applies to these specified mass-shell representatives and the smooth packet core; arbitrary L² classes use cell averages. Deduce the vacuum and finite-particle polynomial matrix-element limits by Wick expansion and these Gram limits. In the fixed frame, `u∈k⊥⊂ℂ³ ↦ [(0,u)]∈P_k` is a unitary isomorphism; this Coulomb-gauge potential is frame-dependent and is not asserted local or Lorentz covariant. Second-quantize the Lorentz action on the physical polarization bundle from NQS M4's helicity ±1 representations, using QF4's Fock functor. Prove the potential's gauge-compensation intertwining law and deduce quantum field-strength covariance. Compute the field-strength commutator: differentiation cancels the nonlocal transverse-projector term and yields causal support and microcausality. RQFT1 supplies the classical gauge/solution comparison, not this quantum covariance theorem. At k=0 prove local integrability of the displayed `1/|k|` weight in three spatial dimensions; omit the box zero mode and prove it does not change this limit. Consume QF's generic Fock/domain API. The source omits an explicit volume convention, so compare its C-coefficients to normalized box modes rather than assigning unit CCR at arbitrary volume.
* Prove Wick's theorem on the algebraic finite-particle domain with the chosen time-ordering and sign convention. Boson contractions use pairings; fermion contractions use graded permutations and a minus sign for every closed fermion loop. Establish the finite-dimensional Gaussian/Wick identity and recover the zero-dimensional `φ⁴` graph coefficients as a combinatorial check. For `n` disjoint isomorphic connected graphs `G`, prove `Aut(G^{⊔n})≅Aut(G)^n⋊S_n`, hence the corresponding exponential coefficient `1/(n!|Aut(G)|^n)` when vertices/labels and weights use that convention. The source's shortcut `Aut(nG)=n!Aut(G)` omits the independent automorphisms of each copy; preserve it literally as a source error and prove the wreath-product correction.

**RQFT3.PhysicalPhotonAndSmearing — complete one-particle and common-domain interface.** Put `V=EuclideanSpace ℂ (Fin 3)` and, for k≠0, `r=|k|`, `n=k/r`, `P_T(k)=I−n nᵀ`; at zero choose P_T(0)=0. Use the Borel measure `dμ(k)=d³k/((2π)³2|k|)` off zero, assigning the origin mass0. Prove local finiteness at zero and σ-finiteness. Define the physical one-photon Hilbert space as the range of the contractive orthogonal projection `F↦[k↦P_T(k)F(k)]` on native `MeasureTheory.Lp V 2 μ`. Prove measurability, representative independence, self-adjointness/idempotence of this projection, closedness/completeness of its range, and the equivalent a.e. condition `k·F(k)=0`. Multiplication by `1/sqrt((2π)³2|k|)` gives the unitary to the transverse subspace of Lebesgue L², with inverse multiplying by that square root; values at zero are null-set data. Prove density by applying P_T to smooth compactly supported approximants away from zero, first removing a small ball and large-momentum tails.

For p=(r,k), identify this fibre with `p^⊥_ℂ/ℂp` by `u↦[(0,u)]`. Prove the quotient form `−η(conj ε,ε′)` is well-defined; subtract `(ε⁰/r)p` to obtain the unique temporal-zero representative. Its spatial part lies in k^⊥ and its norm is the Euclidean norm, proving positivity and complex dimension2. Define `C_n u=n×u` complex-linearly; `i C_n` is self-adjoint and squares to identity on k^⊥, so `(P_T±iC_n)/2` are measurable orthogonal rank-one projections. Prove their direct-sum decomposition and compute the two little-group rotation characters in the actual NQS M4 `δ(w,θ)` coordinates; identify the resulting unordered pair with its future-orbit labels `(ε,ℓ)=(+1,±2)`, including the coordinate/orientation and signed helicity dictionary. No global continuous polarization frame is assumed.

For a proper orthochronous Lorentz transformation Λ and q=Λ(r,k), define the transverse fibre map
`T(Λ,k)u=(Λ(0,u))_space−((Λ(0,u))⁰/q⁰)q_space`.
Prove it is unitary from k^⊥ to q_space^⊥, is measurable jointly, and obeys the cocycle law; changing the representative by a multiple of p changes no quotient class. Define `(U(a,Λ)F)(q_space)=exp(iη(q,a))T(Λ,(Λ⁻¹q)_space)F((Λ⁻¹q)_space)`. Prove the group law, onto unitarity by mass-shell measure invariance, and strong continuity, first on the dense smooth off-zero core with compact Lorentz-parameter control and then by unitarity. Transport NQS M4's actual signature, cover and positive-energy translation character through the displayed RQFT coordinate map; Schrödinger time evolution is the negative active time translation. Prove the specified bundle intertwiners with the two NQS induced helicity models; the one-particle representation theorem alone supplies no quantum local field.

For scalar mass m≥0 and for the transverse potential, prove the mass-shell restriction maps K are continuous from the declared Schwartz tests into their one-particle Hilbert spaces. A bound `|Kf(ω(k),k)|≤C_N p_N(f)(1+|k|)^(−N)` and `‖P_T‖≤1`, together with `∫_(|k|<1)|k|⁻¹d³k<∞`, gives an explicit finite-seminorm L² bound; derivatives and spinor/field-strength polynomial factors use higher seminorms. Prove density of the complex span of the test-created vectors by extending arbitrary smooth compact momentum packets off the mass shell inside a small frequency neighborhood. For field strength use its antisymmetric test components; division by ω only occurs on the off-zero packet core. The Fourier conversion is RQFT0.TestProductsAndFourierPhase, not an assumed identity of Euclidean and Minkowski phases.

On D8's full Fock carrier let W be the complex span of all U₁(g)Kf over the selected spacetime group and relevant test-created vectors, and take `D=span{a†(h₁)⋯a†(h_n)Ω:h_j∈W,n≥0}`, including the vacuum. For covariant scalar/field-strength maps compare this orbit span to their original test image. For the fixed-frame potential this choice supplies group invariance without a false assumption that its untransformed test image is invariant. Use QF4's actual creation/annihilation, normalization and sector-domain API to prove density, invariance under the selected spacetime action and every chosen smeared field and its adjoint. For a vector with particle number at most N prove the real smeared-field bound `‖φ(f)^nψ‖≤(2‖Kf‖)^n sqrt((N+n)!/N!)‖ψ‖` in the scalar/potential normalization `φ(f)=a(Kf)+a†(Kf)`. Its series divided by n! converges for every real radius. Nelson's theorem therefore identifies its closure with `sqrt(2)Φ_D8(Kf)`; conclude `exp(iφ(f))=W_D8(sqrt(2)Kf)` and vacuum value `exp(−‖Kf‖²/2)`. For complex tests use `a(K(conj f))+a†(Kf)` and prove linearity and the adjoint pairing on D; density of the adjoint test domain gives closability. Products act on the specified invariant D, not on an unstated maximal product domain. Derive the matrix-coefficient Schwartz bounds and all vacuum n-point distributions from Wick pairings. Construct their joint tempered extensions by the explicit mass-shell product integrals with polynomial-growth bounds and use finite-test-product density for uniqueness; no invalid multiplication of distributions at coincident points is used.

Construct the quantum Maxwell field strength from the differentiated potential smearings and prove the Bianchi/source-free equations, Lorentz covariance and the cancellation of gauge-compensation terms. Compute its commutator as the appropriate tensor of derivatives of RQFT1's causal propagator, with signs fixed from the potential and Fourier convention; hence prove causal support/locality. The fixed-frame Coulomb potential remains nonlocal and frame-dependent. State separately the positive-metric field-strength model, any indefinite-metric potential model and its subsidiary condition, and the gauge-invariant observable net. Verify the required vacuum cyclicity and spectrum/domain properties for each model for which the Wightman axioms are claimed. The Dooley positive-particle representation `⊕_(n≥1)Sym^n(h_ph)` is a reducing subrepresentation of Γ(U), but not a domain/carrier for creation or annihilation, which connect it with the vacuum. These facts construct the specified photon/free-field model without asserting that every quantum field is a Fock model.

## Milestone RQFT4 — Wightman and Haag–Kastler models; theorem hypotheses

Define a Wightman model as explicit data: positive Hilbert space, unique normalized vacuum, strongly continuous unitary Poincaré representation with joint spectrum in the closed forward cone, a common invariant dense domain, operator-valued tempered distributions, covariant transformation law, local commutation/graded commutation, and cyclicity. List any field-adjoint, finite-component, and domain assumptions used by each theorem. Verify the scalar Klein–Gordon model against these axioms under its stated mass, spectrum and domain hypotheses. The fixed-frame Coulomb-gauge potential in RQFT3 is not local or Lorentz covariant and is not an example satisfying the Wightman axioms. A covariant Maxwell field-strength/observable Wightman model remains a separate target: construct it on the gauge quotient, prove its constraints, covariance, locality and positive-metric domain before claiming the axioms. The classical Dirac model is not a quantum Wightman field. No interacting model is declared to exist unless all axioms are built and verified.

Define a Haag–Kastler net on bounded open regions with isotony, locality, Poincaré covariance, spectrum/vacuum conditions and the declared additivity/duality assumptions. Construct the free scalar/Dirac observable nets and prove only established Wightman-to-net implications; do not assert equivalence without the needed reconstruction, field-generation and charge assumptions. Give the exact field-to-net and net-to-field/reconstruction routes as named theorems with their hypotheses.

**RQFT4.GenericReconstruction — moments, bounded nets and point fields.** Keep the following distinct constructive theorems; none asserts that every Haag–Kastler net is generated by point fields or that an observable vacuum representation contains all charged sectors. Use the existing native test/distribution, VNA predual/affiliation, D8 free-field and UO closure/analytic-vector carriers.

**Moment reconstruction.** Fix a set of finite-component Lorentz multiplets, an adjoint involution and specified parities. For every finite component word supply a joint tempered distribution W_word, with W_empty=1, translation/cover covariance, future-cone support in the declared successive-difference Fourier convention, Hermiticity under reversed adjoint/conjugated tests, graded locality, and positivity `W(F*F)≥0` for every finite Borchers test polynomial F. Here the Borchers algebra is the algebraic direct sum over finite words of Schwartz configuration tests; multiplication is test tensor product/concatenation and star reverses the word, applies the component adjoint, and conjugates tests. For vacuum uniqueness require the precise spacetime Cesàro input: for all finite Borchers polynomials F,G, `(2T)^(-4)∫_[-T,T]^4 W(F* α_a(G)) da→conj(W(F))W(G)`. Prove with the joint translation PVM that these box averages converge strongly to its projection at0; the input therefore makes the translation-invariant subspace exactly ℂΩ. Construct the null left ideal N={F:W(F*F)=0}, the quotient inner product `⟨[F],[G]⟩=W(F*G)` in the second-linear convention, and its Hilbert completion. Prove the left-ideal property by positivity/Cauchy–Schwarz to F and A*AF, giving W(F* A* A F)=0; realize each smeared field by left multiplication on the common polynomial quotient. Prove the adjoint pairing and closability, invariance of this domain, and joint tempered vacuum coefficients. Construct the Poincaré representation by its action on tests, prove isometry, strong continuity, vacuum invariance and the PVM spectral condition. Prove cyclicity, the selected uniqueness/clustering conclusion, and uniqueness up to a vacuum-preserving unitary intertwining this polynomial field domain. This constructs the model from distributions, rather than postulating an already reconstructed model. Do not deduce self-adjointness of arbitrary real smearings or bounded-net locality solely from this construction. Consume PDO P3's ordinary kernel theorem for local test products; wherever separate field estimates are used to obtain joint tempered W_word, prove the global weighted Schwartz estimate by the cutoff/Fourier method, not merely density of finite test products.

**Field-to-bounded-net theorem.** Start with the actual closable smearings on their declared dense invariant domain. For each O define the bounded generating data from the polar partial isometries and spectral projections of the moduli of their specified closures, for compact tests supported in O. Define M_phi(O) to be their generated von Neumann algebra. Require a usable strong-locality criterion: either the RQFT4.StrongLocalNet mixed-word factorial estimates for the real symmetric generating family, or affiliation of these closures with a fixed local net M(O). Prove the corresponding bounded generators commute for spacelike regions (for a graded charged family use twisted locality and take the even/gauge-fixed observable net). Prove isotony and covariance by graph transport of the closures, and the selected vacuum cyclicity by bounded spectral truncation with the needed graph-core comparison explicitly proved. In the fixed-net branch prove M_phi(O)⊂M(O). Recover equality only after proving a concrete field-generation condition: every contraction A∈M(O) can be approximated strongly and strongly on adjoints, on each finite list of Hilbert vectors, by uniformly contractive elements of the star algebra generated by those bounded local field data. Prove that this condition gives equality by strong closure/Kaplansky; it is an additional approximation theorem for the selected model, not a consequence of weak field locality. State first the PCT/field identities on the polynomial domain; transport them to other closed realizations only after an actual graph-core equality.

**Net-to-point-field theorem — microscopic phase-space port.** On four-dimensional Minkowski space let O↦M(O) be an isotonic local von Neumann net, with a strongly continuous positive-energy representation of the connected Poincaré cover, invariant normalized vacuum unique up to scalar, and dense span of M(O)Ω for bounded O. Put H=P0≥0, L=1+H, R=L^(-1), Σ=B(HilbertSpace)_* using VNA's normal-functional/trace-class pairing, and `E_∞=⋂_(n≥0)R^n Σ R^n` with seminorms `||σ||_n=||L^n σ L^n||`. These are norms on the represented predual functionals, not formal multiplication of undefined unbounded operators. Define the damped embeddings by `(R^n σ R^n)(A)=σ(R^n A R^n)` and prove injectivity/compatibility; give E_∞ its projective locally convex topology. For a continuous linear ψ:E_∞→Σ define the extended nonnegative local seminorm on its actual domain by
`||ψ||_(r,n)=sup_{τ∈E_∞, ||τ||_n≤1, A∈M(O_r), ||A||≤1}|ψ(τ)(A)|`,
where O_r is the radius-r double cone at0; the value may be∞ for a small n. Make the weighted completion explicit: let `C_n:Σ→Σ`, `C_nσ=R^nσR^n`, and let `Σ_n=range C_n` with `||C_nσ||_n=||σ||_Σ`, using injectivity of C_n. Prove Σ_n is Banach and E_∞ is dense in Σ_n, with its norm-n unit ball dense in the Σ_n unit ball. With `P_m=1_[0,m](H)`, use `τ_m=P_mτP_m=C_n(P_mσP_m)` for τ=C_nσ: bounded spectral support puts τ_m in every weighted range, `||τ_m||_n≤||τ||_n`, and `||τ_m−τ||_n→0` by trace-norm convergence of spectral compressions. Prove this convergence using finite-rank trace-class approximation and strong convergence P_m→1, without a separability assumption.

Call n admissible for ψ when `||ψ(τ)||_Σ≤C||τ||_n` for all τ∈E_∞ and some finite C. The increasing projective seminorms imply that every continuous ψ has such an n and all larger n are admissible. For admissible n construct its unique bounded extension `barψ_n:Σ_n→Σ`; prove agreement on E_∞ and compatibility under the inclusions Σ_(n+1)→Σ_n. Only then prove the equivalent all-predual formula
`||ψ||_(r,n)=sup_{σ∈Σ, ||σ||_Σ≤1, A∈M(O_r), ||A||≤1}|barψ_n(C_nσ)(A)|`.
Do not evaluate the original ψ at C_nσ for arbitrary σ: finite n damping need not put it in E_∞. The core formula is defined for every n, and equals the bounded-extension formula whenever n is admissible. Apply the same completion lemma to scalar φ∈E_∞′ before interpreting R^nφR^n as a bounded operator via the VNA predual pairing.

Require: for every γ≥0 there exist finite-rank continuous ψ and n with `r^(-γ)||Ξ−ψ||_(r,n)→0` as r↓0, Ξ the inclusion. Prove equivalently that n may be required admissible for Ξ−ψ: if a core estimate holds at n, increase n to dominate a continuity index of ψ. The local seminorm only decreases when n increases, so the limit is preserved; Ξ extends by the canonical inclusion Σ_n→Σ. For finite-rank ψ prove each admissible extension has the same finite-dimensional range and rank, and its transpose restricts to the original map on E_∞. Thus the minimum ranks N_γ, canonical Φ_γ spaces and the full phase-space field reconstruction retain their original scope. This is the rigorously typed microscopic phase-space condition, with integer n cofinal among positive energy weights, not the weaker fixed-region compactness/nuclearity slogan.

Let N_γ be the least such rank, and define Φ_γ as the image of the transpose of a least-rank ψ in E_∞'. Prove that this image is independent of the minimizer by identifying its annihilator as `{σ:r^(-γ)||σ|M(O_r)||→0}`; prove dim Φ_γ=N_γ, monotonicity in γ, and star invariance. For each φ∈Φ_γ construct bounded A_r∈M(O_r) with `||R^n(φ−A_r)R^n||→0` for some n, interpreting φ as its energy-bounded sesquilinear form on `D_∞=⋂dom L^n`. Define its translated form by U(x)φU(x)* and its smearing by integrating against f. Prove that these smearings represent actual vectors on D_∞, preserve D_∞, satisfy for every k an estimate `||L^k φ(f)ξ||≤C_k p_k(f)||L^(q_k)ξ||` with an explicit finite Schwartz seminorm p_k, and obey the adjoint-test pairing. Prove closability, graded/ordinary relative locality as applicable, and affiliation of the specified closures with M(O) for compact f in O. Do not infer domain invariance for every bounded local operator.

The proof must include the energy-block and smooth-commutant steps: decompose with `E_j=1_[j,j+1)(H)`, bound the damped-form blocks by polynomial powers of j,k, and gain arbitrary decay in |j−k| by time integration by parts and the separated-spectrum Sylvester inverse. Choose the energy loss and number of derivatives to make both Schur sums finite. This proves the graph estimates and convergence of smeared A_r approximants on each required energy graph. For affiliation regularize a commutant operator by small translation convolutions inside the localization buffer; these preserve D_∞ by bounded iterated-H-commutator estimates, commute with the local approximants, and tend strongly to the original operator. Closedness then gives maximal-domain commutation. These are owned proof obligations implementing the point-field reconstruction, not an assumption that a field reconstruction already exists.

Define the full energy-bounded point-form class `Φ_FH={φ∈E_∞':∃n, R^nφR^n∈⋂_(r>0) closure_WOT{R^n A R^n:A∈M(O_r)}}`. Here closure_WOT is closure in the weak-operator topology on the carrier B(HilbertSpace), generated by the scalar vector pairings T↦⟨u,Tv⟩ for all Hilbert vectors u,v. The approximating local sets or nets need not be uniformly norm bounded. Do not replace this by Banach weak closure or ultraweak/predual weak-star closure, and do not invoke bounded-set equivalence for these arbitrary sets. In the affiliation argument use only fixed vector-pair identities on D_∞, rewritten for the damped bounded operator with the necessary L^n on the smooth test vectors, so that these identities pass through this specified WOT closure. Prove `⋃_γ Φ_γ=Φ_FH`, not just inclusion of the extracted finite spaces. For the reverse inclusion first construct smearings/affiliation by the same weak-form and smooth-commutant argument; use a shrinking unit-integral smooth test f_r, polar decomposition `closure φ(f_r)=V_r D_r`, and bounded local approximants `A_(r,epsilon)=epsilon^(-1)V_r sin(epsilon D_r)`. Prove their energy-damped error estimate and choose epsilon as a sufficiently high power of r to obtain `||A_r−φ||_(damped)=O(r)` and `||A_r||=O(r^(-k))` for some finite k. A phase-space approximant at γ≥k then gives `ψ* A_r→φ` in an energy-damped norm, inside the closed finite-dimensional Φ_γ. State the actual energy losses/commutator estimates used rather than treating weak local closure as norm convergence. This is the full point-field-content comparison of Bostelmann3.5–3.6.

Prove that the Lorentz transformations fixing0 preserve the origin-local Φ_γ(0)=Φ_γ, using `||L^n U(0,A)R^m||<∞` on compact Lorentz-cover parameter sets and the linear distortion of small double cones at0. Prove the same for specified microscopic internal symmetries satisfying those energy/localization bounds. Obtain the finite-dimensional continuous Lorentz action at0. Do not apply this origin-preservation assertion to a nonzero translation: O_r+a is not contained in O_(cr) for fixed c as r↓0. Define instead the translated point-form spaces `Φ_γ(x)=AdU(x) Φ_γ(0)` and forms `φ_i(x)=U(x)φ_i(0)U(x)*` before smearing. Prove their full Poincaré covariance `AdU(a,A)Φ_γ(x)=Φ_γ(a+Λ(A)x)`. Using exactly the adopted inverse row-component convention, prove on the common energy-smooth form domain
`U(a,A)φ_i(x)U(a,A)*=Σ_j D(A⁻¹)_i^j φ_j(a+Λ(A)x)`.
Here D is the same finite matrix representation used in RQFT4.WightmanDomainAndSpinStatistics; for a linear coefficient map φ(v)=Σ_i v_iφ_i, the induced coefficient action is `D(A⁻¹)^T`, the contragredient representation. Check the composition order, rather than using an unqualified D(A)_ij formula. After smearing prove
`U(a,A)φ_i(f)U(a,A)*=Σ_j D(A⁻¹)_i^j φ_j(f_(a,Λ(A)))`,
with `f_(a,Λ)(y)=f(Λ⁻¹(y−a))`, on the declared invariant D_∞. Transport the closed graphs of these displayed D_∞ restrictions; do not silently identify the closure of a linear combination with the sum of its maximal closed summands. Thus only the Lorentz/origin-stabilizing action has a finite-dimensional fiber at0, while the full Poincaré action is on the spacetime-labelled translated family. Prove tempered joint vacuum distributions with all required product bounds and the PDO P3/global Schwartz adapter. On `H_γ=closure(span{φ1(f1)…φm(fm)Ω:φj∈Φ_γ})`, prove that the reconstructed finite multiplet satisfies the Wightman axioms; prove independence of the nonempty open smearing region by the stated Reeh–Schlieder theorem. On the union of the Φ_γ use the analogous cyclic H_F. Construct the point-field subnet by the preceding bounded-closure data and prove its inclusion in M. Recover the entire original Hilbert space/net only when their separate cyclicity and bounded field-generation approximation conditions are proved. Bostelmann, Definitions2.1/4.1, Theorems3.3/3.6/4.3 and(43), supplies this conditional point-field route; his(44) is presented as a proposed further argument and is not invoked as a proved equivalence. Preserve nets with nonpointlike components and theories failing the microscopic condition as outside this theorem's sufficient hypotheses.

**Charged-field reconstruction port.** The preceding observable-net vacuum construction does not recover a charged Dirac field from its even observable net. Retain a separate four-dimensional DHR/DR theorem with its actual additional data: a faithful vacuum observable net with Haag duality for double cones and Property B (each nonzero projection in M(O1) is the range projection of an isometry in M(O2) when closure O1⊂O2), and the full selected category of transportable double-cone-localized finite-statistics endomorphisms of its quasilocal algebra. Arrows are observable intertwiners; composition is the tensor product of objects, with `S⊗T=S ρ(T)=ρ′(T)S` for S:ρ→ρ′ and T:σ→σ′. Require simple unit, subobjects, finite direct sums, standard conjugates `R:1→barρρ` and `Rbar:1→ρbarρ` satisfying `(Rbar*⊗1ρ)(1ρ⊗R)=1ρ`, `(R*⊗1barρ)(1barρ⊗Rbar)=1barρ`, and `R*R=Rbar*Rbar=d(ρ)1`, and the symmetric unitary statistics from spacelike transport. These category closure, conjugate and statistics conditions are additional hypotheses of the DR construction theorem. To apply it to a selected observable net, construct and verify this structure on its full selected finite-statistics category from that model's actual sufficient assumptions; for finite direct sums supply the localized orthogonal isometries and prove their intertwiner and localization laws. Do not infer this structure from faithfulness, Haag duality and the displayed Property B alone. The trivial net on ℂ has its identity-sector/gauge-trivial model as a separate case; its category of actual unital endomorphisms does not contain id⊕id. Prove completeness for the category actually supplied, rather than treating an arbitrary sector list as complete.

Construct the compact graded gauge pair(G,z), z central with z²=1, and a faithful complex-linear star-preserving unitary tensor fiber functor E to finite-dimensional Hilbert spaces. Its symmetry compares with the Bose/Fermi graded flip; equivalently E preserves the bosonized symmetry `ε_b(ρ,σ)=(-1)^(pρ pσ)ε(ρ,σ)` on homogeneous sectors, extended blockwise over finite direct sums. Mixed even/odd direct sums have the central grading operator rather than a single scalar parity. Do not impose an ordinary-flip functor on fermionic statistics. The DR embedding/duality proof is an explicit RQFT4 prerequisite here, not an existing native theorem or a consequence of a character table. Construct the algebraic field coend from symbols(A,ρ,ξ), linear in A and ξ, with arrow relation `(AT,ρ,ξ)=(A,σ,E(T)ξ)` for T:ρ→σ (using the consistently typed coefficient-side convention). Its product uses Aρ(B) and E's tensor constraint; define star by the chosen conjugate/evaluation maps. Equivalently, for each nonzero unital sector construct charged multiplets ψ_ρ,i with `ψ_ρ,i A=ρ(A)ψ_ρ,i`, `ψ_ρ,i*ψ_ρ,j=δ_ij`, `Σ_iψ_ρ,iψ_ρ,i*=1`, and all tensor/intertwiner/conjugate relations; treat a formal zero object as a zero summand rather than imposing a zero sum equal to1; in standard conjugate bases `E(R_ρ)=Σ_i e_bar,i⊗e_i`, the evaluation relation reads `ψ_ρ,i*=R_ρ* ψ_barρ,i`. Prove consistency and positivity by the sector-sum representation, complete in its operator norm, and construct the local field algebras from localized multiplets. Prove normal graded spacelike commutation, the faithful compact G action on multiplets, a faithful locally normal observable embedding ι on the field Hilbert space and local fixed points `F(O)^G=ι_O(M(O))`, with the G-invariant subspace unitarily equal to the original vacuum Hilbert space and its compressed local action equal to M(O), and completeness/uniqueness for precisely the selected finite-statistics category. No claim about long-range Gauss-law charges or infinite-statistics sectors follows.

Poincaré covariance/positive energy of the field system are additional explicit inputs to this port, not inferred from the observable vacuum representation alone: use the induced action α_g on localized objects/arrows, adjoint/parity-compatible continuous unitary tensor identifications `C_g(ρ):E(ρ)→E(α_gρ)` satisfying `C_(gh)(ρ)=C_g(α_hρ)C_h(ρ)`, and the resulting coend action `(A,ρ,ξ)↦(α_g A,α_gρ,C_g(ρ)ξ)`. Require continuity of its vacuum-state matrix coefficients, the same explicit spacetime Cesàro clustering condition on finite field words for unique vacuum, and closed-future-cone support under RQFT0's physical-momentum/reflected-native-Fourier dictionary of the translation coefficients `a↦ω_F(X* α_a(X))` on a dense field star algebra, where ω_F=ω0∘∫_G γ_g dg. Construct the strongly continuous positive-energy vacuum representation from this state and prove the local/gauge comparisons. To obtain charged point fields, impose the microscopic energy-damped finite-rank condition on this field net with its even/odd decomposition and prove the graded version of the preceding form/energy/local approximation argument; graded locality uses the central z and its Klein twist, not ordinary commutation of odd fields. This extends the port beyond free examples without asserting that every DHR field system automatically has point fields or the microscopic bound. [Conti–Doplicher–Roberts, §§2–3](https://arxiv.org/html/math/0001139) supplies the sector/complete-normal-field-system comparison; own the specified DR embedding, coend completion and graded phase-space bridges with their hypotheses, rather than substituting the observable point-field theorem for them.

The original free scalar, CAR Dirac, Maxwell field-strength and gauge-invariant observable-net verifications all remain required. No part of this conditional generic reconstruction theorem identifies the nonlocal fixed-frame Coulomb potential as a local covariant Wightman field.

Under the fixed dimension, positive-metric, spectrum, covariance, locality and field/domain assumptions, prove the spin-statistics theorem: for a field transforming in an irreducible finite-dimensional Lorentz representation of type `(j,k)`, including the adjoint fields in the field family, the wrong spacelike commutation/anticommutation choice forces the field to vanish. More precisely, for spacelike separated test supports write `φ_a(f)φ_b(g)*−ε φ_b(g)*φ_a(f)=0` on the common invariant domain, with `ε=+1` for commutation and `ε=−1` for anticommutation. Prove the Lorentz-cover central element acts on type `(j,k)` by `(-1)^(2(j+k))`; if `ε` differs from this sign, every component `φ_a(f)` vanishes on the common domain. Thus integer `j+k` requires commutation and half-integer `j+k` anticommutation for a nonzero field. Route the proof through the same forward-tube analyticity and Jost-point lemmas used for PCT, with the adjoint and positivity hypotheses stated at each use. From the vacuum matrix-element identity first obtain vanishing on the vacuum; use relative locality of the field family, cyclicity of the vacuum for the polynomial field algebra, and Reeh–Schlieder (with its spectrum, locality and domain hypotheses) to extend vanishing to the common field domain. Include Reeh–Schlieder as an explicit RQFT4 prerequisite/target, with the spectrum, locality, cyclicity and domain hypotheses stated above: the vacuum equation alone does not prove operator vanishing. Retain the source's classical commuting Dirac model separately as a formal classical field.

**Local Gauss-law charge obstruction.** Prove the following theorem and its charged-potential consequence in the four-dimensional Wightman setting. Keep the full field-family, domain, locality and charge-limit hypotheses explicit.

Work in four-dimensional Minkowski space on a positive Hilbert space H. Let D be a common invariant dense domain containing the vacuum Ω for a local field family closed under adjoints, including electric fields E_i and current j_μ as operator-valued distributions. Require ordinary relative locality of E_i with every generating field and its adjoint (E_i is even in a graded family). All products and distributional derivatives below act on D. Fix s∈{−1,+1} and assume the distributional Gauss equation `j_0=s Σ_i ∂_i E_i` on D.

Let D_loc be the span of BΩ where B ranges over the unital *-algebra of compactly supported smooth field smearings and their finite products. Require D_loc dense in H. Prove the usual Wightman bridge: compact cutoff approximation in Schwartz topology, together with continuity of the vacuum distributions of all orders, approximates each Schwartz polynomial vacuum vector by such local vectors. Vacuum cyclicity for the Schwartz field family therefore gives this density. Do not identify D_loc with the entire Schwartz polynomial domain without that additional equality.

Fix real α∈C_c^∞(ℝ) with ∫α=1 and real χ∈C_c^∞(ℝ³) equal to one on the unit ball and zero outside the radius-two ball. Put χ_R(x)=χ(x/R) for R>0 and `Q_R=j_0(α⊗χ_R)`. Let Q be a closed linear operator, in particular a self-adjoint total charge is allowed, with Ω and D_loc contained in its domain and QΩ=0. For every local polynomial B require the weak vacuum commutator limit as R→∞:

`⟨v,[Q_R,B]Ω⟩ → ⟨v,QBΩ⟩` for all v∈D.

This follows from the full weak commutator limit with Q and w=Ω whenever that stronger formulation is available. It does not require QD⊂D or a core assumption on D.

Prove by distributional integration by parts `Q_R=−s Σ_i E_i(α⊗∂_iχ_R)` on D. If supp α⊂[−T,T] and the union of the supports entering B lies in {|t|≤T_B, |x|≤ρ_B}, every R>ρ_B+T+T_B makes the shell spacelike separated from B. Relative locality, including adjoints, gives `[Q_R,B]=0` on D. The limit and density of D imply QBΩ=0. Hence Q vanishes on dense D_loc; closedness of its graph implies H×{0} lies in that graph, so dom Q=H and Q=0. Thus nonzero charge is incompatible with these hypotheses. This is the local Gauss-law charge mechanism; see [Strocchi2023, §2 before (2.2)](https://arxiv.org/html/2301.06543).

Also prove the charged-field version without a total-charge operator: if a local smeared field ψ(f) has `⟨v,[Q_R,ψ(f)]w⟩ → q⟨v,ψ(f)w⟩` for all v,w∈D, with nonzero scalar q, then the same shell argument gives ψ(f)=0 on D. This extends the scope of the charge obstruction and does not replace the total-charge theorem.

Retain the charged-potential consequence as a named target. In a positive-metric local Wightman family closed under adjoints and containing a Hermitian even vector potential A_μ, j_μ and the charged fields, assume F_{μν}=∂_μA_ν−∂_νA_μ and the sourced Maxwell equation `∂^νF_{μν}=j_μ`. Here `j_μ` is the operator current `j^{(4)}_μ` of the Current and Coulomb convention bridge, not a classical external source. In the fixed (+---) convention set `E_i:=E_i^{(4)}=−F_{0i}`; its time component is the stated Gauss equation with s=+1. Prove the sign from index raising. Derivatives preserve the relative locality needed for E_i. Supply the same charge-limit/domain hypotheses and local cyclicity bridge; the charge theorem gives the contradiction to Q≠0. Locality of A with itself alone does not supply locality with the charged fields.

The conclusions apply to the specified cyclic vacuum representation and local field family. They do not exclude charged sectors outside the cyclic vacuum representation of the observable algebra, fields not local relative to E_i (including dressed/Coulomb-gauge charged fields), or indefinite-metric gauges where the sourced Maxwell equation is not an operator identity on the whole auxiliary domain.

**RQFT4.PotentialObstructions — covariance, vacuum weak locality and Maxwell.**
Keep the following statements separate from the local charge theorem.
Use four-dimensional Minkowski space with the fixed (+---) convention,
an auxiliary space K and its possibly indefinite Hermitian metric pairing
[ξ,ζ]=⟨ηξ,ζ⟩, and a common invariant dense field domain D⊆dom(η).
Take Ω∈D with [Ω,Ω]=1. The fields A_μ,F_μν take D to D and are
Hermitian for this metric: [A_μ(f)v,w]=[v,A_μ(conj f)w] for v,w∈D,
and likewise for F. This is a metric-adjoint identity, rather than an
assumption about the auxiliary Hilbert adjoint. No boundedness of η is
imposed by this setup. Use ordinary compactly supported smooth tests here; construct the
matrix-coefficient distribution and differentiation interface without
assuming temperedness. Require F_μν=−F_νμ and the operator distribution
equations

```text
F_μν=∂_μA_ν−∂_νA_μ,   ∂^μF_μν=0,
∂_λF_μν+∂_μF_νλ+∂_νF_λμ=0.
```

The last equation follows from the curl relation; prove that implication.
The spacetime representation preserves the metric pairing and D, fixes Ω,
and makes F an antisymmetric Lorentz tensor. A Lorentz law for A, a
spectral assumption, locality and positivity are specified separately below;
none is inferred from F covariance or from a classical gauge calculation.
Use the native Lorentz/translation conventions of RQFT1–RQFT3, and prove
the weak differentiation, adjoint and covariance transport lemmas on D.

**1967 covariant-potential two-point theorem.** Following
[Strocchi1967 §II, pp1431–1433](https://doi.org/10.1103/PhysRev.162.1429),
assume A also transforms as a four-vector under the same Poincaré
representation. Write ξ=x−y for this roadmap's two-point coordinate.
Require its and F's vacuum two-point distributions to be boundary values
on {ξ−iv:v²>0,v⁰>0}. Compare this explicitly with the source's forward-tube
formulation: set ζ=−ξ=y−x and D_src(ζ)=D(−ζ), giving the upper tube
{ζ+iv:v²>0,v⁰>0}. Prove the reflected distribution/boundary-value adapter;
the two derivatives in ∂_μ∂_ν introduce no net reflection sign. In the
roadmap coordinate prove the two-point form

```text
D_μν(x−y)=[Ω,A_μ(x)A_ν(y)Ω]
         =g_μν C+∂_μ∂_ν D₂(x−y),
[Ω,F_μν(x)F_ρσ(y)Ω]=0,
```

with C constant and the scalar distribution D₂ supplied by the proof.
No positivity, local commutativity or separate spectral condition is an
input to this version; the tube analyticity is an explicit input. Do not
infer an operator identity F=0 from this vanishing two-point distribution
in an indefinite metric. Keep the paper's subsequent local/positive-domain
corollaries distinct from this statement.

**1970 covariant-potential obstruction.** Use
[Strocchi1970 §II–III, pp2334–2336](https://doi.org/10.1103/PhysRevD.2.2334),
conditions (0)–(4), including the potential-distribution condition (1′):
the preceding Maxwell/curl, field-strength covariance and vacuum data,
translation covariance of A, and the following precise spectrum condition:
for every v,w∈D, a↦[v,U(a)w] is tempered and its Fourier transform with
angular phase exp(−ip·a) is supported in the closed forward cone.
This is a distributional translation-spectrum hypothesis, not a Hilbert
spectral PVM asserted for an arbitrary metric-preserving representation.
Prove its comparison with the usual joint-PVM positive-energy condition
when the translation action is Hilbert-unitary, including the Fourier
normalization adapter. Prove the coefficient-to-forward-tube boundary
lemmas needed here, with lower tube for ξ=x−y and the preceding reflection
to the source's upper-tube variable; tempered translation coefficients
do not assume that the fields A,F are tempered. In addition require A to transform as a Lorentz four-vector,
condition(5). Prove the reflected-tube two-point form and F–F two-point
vanishing by the preceding covariant-potential argument. Positivity and
weak local commutativity are not hypotheses of this vacuum-correlation
result. The source's §III calls the conclusion a trivial theory and prints
A_μ=∂_μφ, hence F=0. Retain that literal statement separately from an
operator identity on arbitrary auxiliary K: the hypotheses above do not
require the vacuum to be cyclic there or exclude auxiliary metric-null
sectors. RQFT4.NullSector below gives the precise counterexample to that
unqualified operator interpretation. With nonnegative metric on D₀ use
the physical quotient argument below to obtain the trivial observable
vacuum representation, where F=0. A need not descend to that observable
quotient. Under the additional explicit hypotheses A(f)D₀⊆D₀ and
A(f)N₀⊆N₀ for its metric-null subspace N₀, construct the induced
potential, prove its distributional curl vanishes, and apply the
Poincaré lemma there. This does not give a primitive for the original
auxiliary potential. A gauge-compensation law instead of a four-vector
law remains a different potential model.

**1970 vacuum weak-locality theorem.** Retain conditions (0)–(4), but
do not require Lorentz covariance of A. Condition(7) is exactly

```text
[Ω,(A_μ(f)A_ν(g)−A_ν(g)A_μ(f))Ω]=0
```

when the supports of f,g are spacelike separated. It is a vacuum matrix
coefficient condition, rather than an operator commutation equation.
Prove the §V theorem (pp2338–2339): the mixed distribution
[Ω,A_μ(x)F_ρσ(y)Ω] vanishes, and derive the F–F two-point vanishing
of equation(20). Do not conclude F=0 as an operator from this theorem.

For its separate positivity corollary let D₀ be the span of all polynomial
words in smeared F's applied to Ω, including Ω, and require the metric
nonnegative on D₀. Prove that all positive-degree F Wightman functions
vanish. Identify the resulting trivial observable vacuum representation
by quotienting its null vectors and completing; positivity on D₀ does not
assert positivity on all auxiliary K. Prove these domain/quotient steps
without treating a zero-metric-norm auxiliary vector as the zero vector.
The field-strength, potential-covariance, vacuum-weak-locality and local
charge results have different hypotheses and conclusions; none discharges
another by the word “gauge.”

**RQFT4.NullSector — vacuum vanishing versus auxiliary operators.**
Construct an explicit noncyclic auxiliary example satisfying the preceding
covariant-potential and spectrum assumptions but with FΩ≠0. Over the
nonzero forward light cone, with invariant measure, take the complex
quotient bundle W_p=ℂ⁴/ℂp with its Euclidean quotient norm. Realize its
section space E as the range of the orthogonal projection Q_p=I−pp*/|p|²_E
on native L²(C₊,ℂ⁴,d³p/(2|p|)); prove its equality with the a.e. condition
Q_pψ(p)=ψ(p), closedness and completeness. Construct the quotient
identification and the induced Lorentz action
ρ(Λ)ψ(p)=Q_pΛψ(Λ⁻¹p), proving the group law by the quotient identity.
This reuses the native L² carrier rather than requiring a new generic
bundle integral. Prove the Lorentz action induced by the four-vector
action; show each fixed Lorentz map and its inverse are bounded and the
action is strongly continuous. This is a three-dimensional quotient
bundle, distinct from the physical transverse quotient p^⊥/ℂp in RQFT3.

Take K=ℂΩ⊕E⊕E^†, where E^† is the continuous antidual (conjugate-linear
functionals on E), with the complex-linear Riesz identification. Use
[(c,x,α),(d,y,β)]=conj(c)d+β(x)+conj(α(y)). Thus the last two
summands are isotropic and paired nondegenerately; the bounded metric
operator fixes Ω and swaps the two copies. Let translations have phase
exp(ip·a) on both copies, and use
the quotient Lorentz action on E and its contragredient on E^†. Prove
metric invariance and the forward translation-spectrum condition.

Use f̂(p)=∫exp(ip·x)f(x)dx with the Lorentz pairing, and represent
w_μ(f)(p)=f̂(p)Q_pe_μ in E. Fix the lower-index/covector adapter so
p^μw_μ(p)=[p]=0. Prove the restriction-to-cone
Schwartz estimate and its compact-test version. Define the complex-linear
field by A_μ(f)(c,x,α)=(α(w_μ(conj f)),c w_μ(f),0). Take D=K. Prove that
each smearing is bounded of rank at most2, is metric-Hermitian, and
transforms with the declared four-vector law. Differentiation and
[p]=0 give the strong source-free Maxwell equations for F=dA on K.
Prove A(f)A(g)Ω=0, hence every positive-degree F vacuum function
vanishes. Nevertheless choose a test nonzero on a cone patch where
p₀e₁−p₁e₀ is nonzero modulo ℂp to obtain F₀₁(f)Ω≠0; fix the
raising/lowering dictionary in that calculation. At p=(1,0,0,1) the
creation vector is i[e₁]f̂(p)≠0. Choose a real even nonnegative compact
bump sufficiently near the spacetime origin so f̂(p)>0, then use continuity
on a positive-measure cone patch. Identify the noncyclic isotropic sector and its trivial
physical vacuum quotient. This counterexample proves why a vacuum
vanishing theorem alone is not an auxiliary operator-triviality theorem.

Prove PCT only after stating the Wightman field content, analyticity/tube domain, growth and locality hypotheses. The route must include complexified Lorentz covariance, spectral condition implying forward-tube analyticity, edge-of-the-wedge/Jost-point extension, analytic continuation of vacuum distributions, reconstruction of antiunitary PCT action, and involution/group-phase conventions. Cite exact primary theorems and prove the Lean-facing lemmas needed; a theorem name alone is not a deliverable.

**RQFT4.PCT — a convention-pinned antiunitary theorem.** Represent the antiunitary by native `HilbertSpace ≃ₗᵢ⋆[ℂ] HilbertSpace`, not a second unbundled carrier. Use the positive-metric, unique-vacuum, spectral, common-domain, finite-multiplet covariance, joint temperedness and adjoint hypotheses of RQFT4.WightmanDomainAndSpinStatistics, together with its actual tube/Jost/edge-of-the-wedge prerequisites. Restrict first to the cyclic polynomial vacuum domain D_pol and the closures of its field restrictions. For any other declared field realization prove D_pol is a graph core and prove domain transport before asserting the same closed-operator identity. PCT does not grant invariance of an arbitrary larger original domain.

Fix two-spinor tensor coordinates: an irreducible symmetrized component type(k,l) has k undotted and l dotted indices, k,l nonnegative INTEGERS, corresponding to Lorentz highest weights(j_left,j_right)=(k/2,l/2). Fix the component adjoint identification by conjugation and dotted/undotted interchange, type(k,l)*=type(l,k), including any displayed finite multiplicity matrices. Put f_parity=(k+l) mod2 and η_(k,l)=(-1)^l i^(f_parity). The choice of the common +i sign is part of this theorem's convention; the consistent common -i version is separate. Reducible multiplets are treated blockwise with this fixed adjoint identification. Do not assert a basis-free universal spinor phase without these data.

Require graded relative locality with the spin-statistics grading already proved, or its exact weaker vacuum form: at every Jost configuration (or a real open neighborhood of one) complete reversal of a word changes its vacuum distribution by `(-1)^(F(F-1)/2)`, where F is the number of odd entries. Odd-F vacuum distributions vanish by the central 2pi rotation and vacuum invariance. Include adjoint words. State Jost points by the spacelike-convex-combination condition on successive differences, and use the distributional boundary-value version when needed. Prove that covariance extends to the chosen complex Lorentz cover, including its total-inversion lift and component factor; combine inversion with this weak local commutativity to obtain, for each word, the analytic continuation/boundary identity with phase `i^F(-1)^(Σ l_j)` and reversed reflected fields. Prove uniqueness on the extended tube and take the common distribution boundary only after reversal puts both sides in that domain; one cannot directly take opposite-tube boundary limits from inversion alone.

For scalar tests write `f^sharp(x)=conj(f(-x))`. On a polynomial word define the ANTIlinear map
`Θ(φ_r1(f1)…φ_rn(fn)Ω)=(∏_j η_rj) φ_r1* (f1^sharp)…φ_rn* (fn^sharp)Ω`,
using the fixed component-adjoint matrices, keeping the operator order and conjugating scalar coefficients. Prove from the2n-point boundary identity that `⟨Θv,Θw⟩=conj⟨v,w⟩`; thus the definition respects every null relation. Prove its image dense using the involutive adjoint labels and the explicit square calculation, and extend uniquely to an antiunitary on the Hilbert completion fixing Ω. Prove on D_pol
`Θ φ_(k,l)(f) Θ^-1 = η_(k,l) φ_(k,l)* (f^sharp)`
and transport to closures on their exact graph domains. Here φ_r*(g) is the adjoint COMPONENT smeared linearly in g, with `φ_r*(g)|D_pol=φ_r(conj g)*|D_pol`; do not confuse it with applying an adjoint to the same complex test. Prove vacuum invariance and `Θ U(a,A) Θ^-1=U(-a,A)` for the connected Poincaré cover, with the same metric/Fourier/sign dictionary as RQFT0. The antiunitary conjugation reverses i, so the translation-energy/momentum generators stay fixed while the corresponding infinitesimal Lorentz generators change sign; state exact domain transport. Derive the opposite-time in/out comparison only after the separate scattering limits exist.

In this selected spinor convention prove `Θ² φ_r(f) Θ^-2=(-1)^(f_parity)φ_r(f)`. The phase calculation uses η_r* η_(r*)=(-1)^(k+l); Θ fixes Ω, so cyclicity gives `Θ²=Γ=U(0,-I)`, the field parity operator. On the even cyclic observable part its square is1. A global phase multiplying an antiunitary does not change its square. If a different adjoint/Klein convention is selected, derive its square and any internal gauge factor explicitly rather than carrying over this formula by name. Uniqueness holds for the fixed field transformation and vacuum, not among all compositions with internal symmetries.

For a specified compact internal symmetry acting on the field family, preserving the vacuum, Lorentz blocks and fixed adjoint identification, prove the compatibility of Θ with that action from its action on generators. In the convention where the gauge unitaries commute with Θ, each self-adjoint one-parameter charge generator obeys `Θ Q Θ^-1=-Q` on the transported domain; conjugate charge sectors are therefore exchanged. No charged sector is manufactured inside the cyclic observable vacuum space. Allow explicit internal-automorphism data if a different field identification requires it.

For the converse, if an antiunitary with these vacuum/field/covariance data exists, derive the reflected-adjoint vacuum identities, analytically continue them to Jost points and combine with complex Lorentz inversion to obtain the stated weak local commutativity. Thus the theorem identifies the precise Wightman/Jost criterion, not a PCT assertion for arbitrary Haag–Kastler nets. For the bounded field-generated net prove `Θ M_phi(O) Θ^-1=M_phi(-O)` by graph/polar/spectral transport; compare with an external net only under its proved field-generation equality. [Greenberg, actual HTML v1 §5, equations17–28](https://arxiv.org/html/hep-ph/0309309) supplies the chosen spinor phase and square comparison; [Borchers–Yngvason, §2.1](https://arxiv.org/html/math-ph/0012020) supplies the distinction between point-field and algebraic PCT assumptions. Its selected involutive convention(2.3) is not identified with the Greenberg full-fermion convention used here; any comparison must exhibit the required internal/Klein change or restrict to the appropriate even observable realization. The full analytic and reconstruction proofs above remain actual owned theorem targets, not axioms, opaque predicate fields, or consequences of the word PCT. Retain RQFT4.PotentialObstructions and RQFT7.OSGrowth with their distinct covariance, locality, metric and growth hypotheses.

**RQFT4.WightmanDomainAndSpinStatistics — axioms, analytic prerequisites and noncircular conclusion.** Use a complete positive complex Hilbert space, a normalized vacuum Ω, and a strongly continuous unitary representation of `ℝ⁴⋊SL(2,ℂ)` whose joint translation PVM is supported in the closed future cone, with Ω invariant and unique up to scalar. Allow a set of finite-component field multiplets with a specified adjoint involution and specified parities p_r∈ℤ/2, not parity defined by the conclusion. For each component use RQFT0/RQFT3's `CommonDomain` and `OperatorValuedTemperedField` forms: one dense complex-linear D contains Ω, is invariant under the group and all field smearings/adjoint smearings, and the fields are complex-linear in tests. Require the adjoint pairing `⟨v,φ_r(f)w⟩=⟨φ_(r*)_(conj f)v,w⟩` with its finite-component adjoint identification. Fix covariance by `U(a,A)φ_α(f)U(a,A)*=Σ_βD(A⁻¹)_α^β φ_β(f_(a,Λ(A)))`, with `f_(a,Λ)(x)=f(Λ⁻¹(x−a))` and the chosen finite matrix representation D; verify the group and adjoint identities rather than treating point fields as operators.

Require the vacuum span of finite field products to be dense and all vacuum n-point functions to extend to joint tempered distributions on the finite configuration space, agreeing with products on elementary tests. Require ordinary/graded relative locality of the whole family on D: for spacelike separated compact test supports, `φ_r(f)φ_s(g)−(−1)^(p_r p_s)φ_s(g)φ_r(f)=0`, including adjoint components with the same parity. This does not insert the spin-statistics conclusion into locality. The dense adjoint domains imply closability of individual smearings. Prove restriction to the polynomial vacuum domain, transport under unitary model intertwiners and covariance of all vacuum distributions. Verify the scalar Klein–Gordon, quantum CAR Dirac and physical Maxwell field-strength models individually under their stated masses/carriers; a classical commuting Dirac solution and the fixed-frame Coulomb potential are not such verifications.

Own the following precise analytic prerequisites before the spin-statistics/PCT conclusions. In successive differences `ξ_j=x_j−x_(j+1)`, use the Fourier convention whose inverse kernel is `exp(−iΣη(p_j,ξ_j))`. Derive support in `(closed V_+)^(n−1)` from the joint spectrum and covariance, and explicitly compare it with native Fourier through RQFT0's reflection/scaling map. Prove the Fourier–Laplace theorem for these tempered cone-supported distributions: holomorphic continuation to `ξ−iy`, `y_j∈V_+`, weak/strong differentiation, uniqueness and boundary convergence in 𝒮′. On every compact set K of such imaginary directions and for0<t≤1 prove bounds `|∂^αF(x−ity)|≤C_(K,α)t^(−N_α)(1+‖x‖)^(N_α)` sufficient for that boundary convergence. Do not infer analyticity from temperedness without the spectral support.

For the specified finite Lorentz types construct the polynomial complexified action from `SL(2,ℂ)×SL(2,ℂ)`, with real form `A↦(A,conj A)` acting on the Hermitian matrix by `X↦AXA†`. Prove the holomorphic covariance/gluing theorem on the union of its translates of the tube, with the actual cover/central action and single-valuedness or sheet identifications justified. Define real Jost configurations by `η(Σ_jλ_jξ_j,Σ_jλ_jξ_j)<0` for every choice λ_j≥0 not all zero and prove they lie in that extended tube. Prove the needed distributional edge-of-the-wedge statement: holomorphic functions in opposite local open tube wedges, with the stated polynomial boundary bounds and equal boundary distributions on an open real edge, have a common holomorphic extension near that edge. Prove its uniqueness and finite-component covariance form. These cone/tube/Jost lemmas are RQFT4 constructions, not unexplained consequences of the name PCT.

Prove Reeh–Schlieder for this field family: for every nonempty open region O, the span of polynomial vacuum vectors with all compact smearing supports in O is dense. First construct the H-valued vacuum product distributions from the positive norm identity with the joint2n-point functions, RQFT0's finite-test-product density and the resulting full Schwartz-seminorm bound. Establish their spectral support and vector-valued Fourier–Laplace continuation. Orthogonality to the local span makes the appropriate scalar boundary distributions zero on an open configuration set; analytic uniqueness forces them zero globally, and global vacuum cyclicity kills the orthogonal vector. State this as a density theorem and a separating/vanishing consequence for relatively local closable smearings, not an identity between the local polynomial domain and all D.

For a multiplet of type `(j,k)`, with2j,2k nonnegative integers, take the given finite representation `Sym^(2j)(ℂ²)⊗Sym^(2k)(conj ℂ²)` and its adjoint family; prove the Lorentz-cover center acts by `s=(−1)^(2j+2k)`. If its self/adjoint spacelike sign is ε∈{+1,−1}, derive through the two-point extended-tube/Jost argument the reflection norm identity, in the declared test/adjoint convention. For real compact tests it has the form `‖φ_a(f)*Ω‖²=εs‖φ_a(Rf)Ω‖²`, `Rf(x)=f(−x)`. Positivity when ε≠s forces both vacuum vectors zero. For a compact f choose a nonempty spacelike separated O; relative locality makes φ_a(f) vanish on its polynomial vacuum span. Its density and closability make the closed operator's kernel all H, hence the original smearing vanishes on D. Extend to Schwartz f by compact cutoffs converging in Schwartz topology and weak field continuity. Thus a nonzero field requires ε=s, with integer j+k commuting and half-integer j+k anticommuting. The vacuum equation alone is not the operator theorem. Keep the full field-family, adjoint, positivity, spectrum, dimension and domain premises in the exported statement. [Fewster, §3.1, Eqs.16–22](https://arxiv.org/html/1603.01036#S3.SS1) records the Burgoyne route and its decisive hypotheses; it does not replace verification of the selected primary theorem's complete conventions.

Use these same analytic prerequisites for the PCT construction, and state any further hypotheses of its reconstruction/involution theorem explicitly. Keep RQFT4.PotentialObstructions, the local Gauss-law charge theorem and RQFT7.OSGrowth as their distinct targets with the hypotheses specified there. Neither the present positive-metric field-strength model nor this spin-statistics statement proves those separate results.
**RQFT4.StrongLocalNet — a sufficient field-to-net comparison.** Weak commutation on an invariant domain alone is not strong commutation of self-adjoint closures. For Hermitian bosonic smeared fields use a common dense invariant domain and, for each spacelike-separated real test pair f,g, require the mixed-word analytic estimate ∥φ(f)^(n₁)φ(g)^(n₂)ψ∥≤C_ψ R_ψ^(n₁+n₂)(n₁+n₂)! for every ψ in that domain and n₁,n₂≥0. With commutation there consume UO-E03's explicit joint analytic-vector integration theorem to obtain essentially self-adjoint fields and commuting spectral projections of their closures. Define A(O) as the von Neumann algebra generated by exp(it closure(φ(f))) for real compactly supported f in O and t∈ℝ; prove isotony, covariance, locality and the selected vacuum-cyclicity statement from the field hypotheses. For the free Fock examples verify the criterion by the creation/annihilation bounds: the mixed word of length n is bounded by C^n√((N+n)!/N!) on a vector of particle degree≤N, which has a positive factorial analytic radius. For CAR fields use the bounded graded generators and their even observable subalgebra; do not infer locality of odd charged fields. A generic Wightman reconstruction from positive moment distributions and any converse net-to-point-field construction retain their full original scope and require their own explicit regularity hypotheses. This sufficient bounded-net comparison does not purport to reconstruct point fields from every Haag–Kastler net or prove that arbitrary Wightman fields satisfy the extra mixed-word estimate.

## Milestone RQFT5 — graph combinatorics, amplitudes and formal perturbation theory

**Notation for RQFT5–6.** Use A_fld for the graded field-jet Hopf algebra (locally printed A), and A_sp for the arbitrary U-species in the general Free formula (there printed A); these are distinct objects. W_fld is its fixed-density module representative (locally W), and W_c its switched tensor module. The kernel normal-form carrier is 𝒥_Γ of TypedJetImage, not W_fld. W_π is the interblock distribution remainder at partition π. The bounded interaction carrier W (written W_B in its declared weight-bounded case), the full engineering-weight≤4 carrier W_eng, the uniform all-orders family W_* and the connected functional W_C retain their explicitly declared later local meanings.

Arbitrary graded scalar coefficient algebras are A_coeff; A_ct below is the specified complete counterterm coefficient algebra, an instance of A_coeff. A_ℂ means their complexification, not a prescription action. In TaylorAdapter **and** DiagonalStabilizer.RegularComparison the locally printed K is K_reg, the regulator meromorphic field, its printed O₀ is O_reg, and its printed B is B_reg=K_reg⊗ℂ A_ℂ. The printed B in ConnectedSubstitution is instead B_sm=C∞(M,ℂ). The Core kernel printed K is K_tan. BalancedJetModule's printed K is
K_slots=Σ_s k_s for its declared physical field-slot list; coefficient/profile
derivatives still use its full diagonal U-action. TaylorAdapter's locally
printed K_tot parameters are
K_TA, its specified graph-level tangential totals held independent of P_Γ.
Their relation to a vertex-slot sum is the actual flow/derivative transport of
that clause; they are not identified by notation. Both differ from K_reg and K_tan. Write 𝒜_C for the prescription action locally printed A_C, distinct from A_ℂ and the free endomorphism 𝔄_C. These are aliases of the actual clause data, not additional coefficient rings or quotient carriers.

Define finite labelled half-edge graphs with vertex types, external legs, edge decorations, connected components, contractions/subgraphs, quotient graphs, graph isomorphisms and automorphism groups. State the conventions for tadpoles, multiple edges, external labels, graph symmetry factors and whether loops are allowed. On the half-edge presentation compute valence from incidence, with loops contributing twice. Derive the internal-edge list by choosing the smaller half-edge in each two-element involution orbit, and the external-vertex list from its fixed points. Prove the incidence-count identity, recovery of loops/parallel edges and invariance up to edge order and orientation. Conversely construct the half-edge graph from finite internal/external lists; require any separately declared valence function to agree with the derived incidence count. A freely chosen degree function is decoration, not the actual graph valence. These are presentation adapters on the same graph scope, not a second graph theory. Define formal graph amplitudes coefficientwise on products of spacetime; RQFT5 owns the symbolic graph map and combinatorics, while RQFT6 owns distribution-valued realization and extension; for each internal edge assign the selected propagator and each vertex the specified local polynomial/differential coupling. Prove graph-isomorphism invariance, spacetime translation covariance, disjoint-union multiplicativity as the external tensor product on independent variable factors, edge-addition recursion where product exists, and compatibility under relabeling/diagonal maps. Distinguish this external tensor product (always defined for distributional factors) from same-variable multiplication (only defined under the wavefront criterion).

**RQFT5.MarkedMetricRealization — the p56 automorphism comparison.** For each finite typed halfedge graph, choose strictly positive lengths on its internal edges and on its external-leg stubs. Form the compact interval realization: adjoin one terminal port point for each external flag, take the disjoint union of the vertex/port points and the intervals [0,ℓ_e], and identify their endpoints with the declared incidences. An orientation chosen to write each interval is auxiliary; prove reversal of that choice gives the canonical isometry. Equip each connected component with its path metric and put distance ∞ between components, on the native extended-metric carrier. Keep the original vertex subset distinguished setwise, every terminal port distinguished as a port, and the specified vertex/edge/port labels and end-germ decorations. Respect the graph's actual label convention: a label declared fixed is fixed, while unlabeled vertices/edges may permute. In particular, retain degree-two vertices and both distinct end germs of a loop; they are not erased by passage to an unmarked topological graph.

Prove the group equivalence between length-preserving typed incidence automorphisms and isometries of this realization preserving all these markings and decorations. An isometry permutes the marked vertices/ports and the open-edge components of their complement; its restriction to an edge preserves arc length and is one of the two interval orientations. Conversely, each incidence automorphism induces the corresponding marked isometry. Include loops, parallel edges, isolated vertices, disconnected graphs and the empty graph. With all lengths1 this recovers exactly the graph automorphism group used in symmetry factors; general lengths recover its length-preserving subgroup. An unmarked unit circle has rotations, so its full isometry group is not the two-element automorphism group of a one-vertex loop. Forgetting a marked degree-two vertex can likewise create additional isometries or identify different subdivisions; prove the comparison for the retained marking, not after this forgetting. For Borcherds p56's incomplete “taxi/small-bug metric” and added-short-edge aside, this marked realization is the precise comparison, without inferring an unwritten metric construction from the sketch. Consume the preceding halfedge graph and native quotient/extended-metric/isometry vocabulary; this is its metric comparison, not a replacement by simple graphs or a second graph carrier for RQFT6. Use the finite incidence group for the labelled orbit–stabilizer proof and RQFT3's component wreath-product formula.

**RQFT5.GroupLikeExample — the p5 worked corollary.** For every group G, with no finiteness assumption, use the existing coalgebra on `MonoidAlgebra ℂ G` and native `IsGroupLikeElem`; prove for each x the equivalence `IsGroupLikeElem ℂ x ↔ ∃!g:G, x=MonoidAlgebra.single g 1`. Consume `MonoidAlgebra.instCoalgebra`, `counit_single`, `comul_single` and its native coefficient equivalence, not a second coalgebra. In a finite-support expansion x=Σ_g a_g[g], comparison of tensor coefficients gives a_g a_h=0 for g≠h and a_g²=a_g; counit1 gives Σ_g a_g=1, so over ℂ exactly one coefficient is1. Prove the converse and uniqueness, and identify multiplication of these basis elements with G by the native `single_mul_single` formula. This owns the source's finite-group exercise as a corollary of the arbitrary-group statement. Keep the separate warning that arbitrary UEA elements are not group-like: the Sweedler/antipode expansions in the prescription action use their full actual coproduct.

**RQFT5.GraphCutFlags — labelled edge-cut and quotient flags.** For the finite halfedge graphs just defined, construct restriction to an edge subset and simultaneous contraction of its connected components, retaining all unchosen edges, original incidences, external ports and labels. Prove the nested flag bijection for E₁⊆E₂ and its relabeling/permutation compatibility, including extra edges becoming self-loops. This purely graph-level supplier precedes the typed coevaluation/jet transports; TypedHopf later proves admissibility and typed coassociativity. These edge-cut flags do not replace the intrinsic partition-stratum extension induction in RQFT6.

**RQFT5.FieldJets — the symmetric/graded field-jet Hopf carrier.**

Build the source's polynomial field algebra over the scalar field ℂ as the symmetric algebra on all formal field-jet generators, with the stated complex conjugation involution. Use LVF1's symmetric jet indices: `u_(a,I)`, I∈ℕ⁴, and total derivations `D_i u_(a,I)=u_(a,I+e_i)`. The constant-coefficient enveloping algebra acts by these commuting derivations; it is not a new coefficient ring whose derivatives are central scalars. Make every jet generator primitive, with counit0 and antipode minus, and prove `ΔD_i=(D_i⊗1+1⊗D_i)Δ`. Prove the iterated coproduct gives the exact multinomial allocations among all incident ports, and compare the graded version through the already fixed Koszul symmetry. Use it to split each interaction monomial among incident half-edges/vertices and derive the exact vertex-label combinatorics rather than treating the source's unfinished page-16 picture as a definition. Include derivative-labelled propagators `D₁D₂Δ_{φ₁,φ₂}` and the source `φ⁴`, `φ²∂φ`, and `D₁(φ²)D₂(φ²)` examples, pinning uncertain diagram incidences separately.

**RQFT5.CompactDistributionAlgebra — compact distribution densities.**

Implement the finite-set-indexed compact-support distribution algebra on source pp.80–85. Put `V(I)=𝓔′(M^I)`, using distribution densities dual to smooth scalar functions, the compact-convergence continuous-dual topology and the fixed Euclidean density for comparison with scalar distributions. Consume CK K5a.SmoothSectionMontel to identify this topology with the strong dual topology on these C∞ spaces. A map `f:I→J` induces `F_f:M^J→M^I`, `(F_f(x))_i=x_(f(i))`, and the source map `f*:V(J)→V(I)` is **pushforward** `(F_f)_*`, defined by `⟨(F_f)_*u,φ⟩=⟨u,φ∘F_f⟩`. Compact support makes it defined for every f. Prove identity/composition, preservation of compact support, and the contravariant finite-set functor law. For injective f it integrates the omitted variables; for surjective f it pushes onto the repeated-coordinate diagonal. Prove the compatible `U(𝔤)^I` derivative action using the coproduct: diagonal pushforward sends a source derivative to the sum of derivatives in the corresponding target slots. Prove associative/commutative external tensor products on disjoint index sets and their naturality. Ordinary distribution pullback is a separate P8 operation; its wavefront criterion does not constrain this compact-support pushforward functor.

For the source's finite-set coalgebra construction use the fixed translation
enveloping algebra U with its counital cocommutative Hopf structure. The
unordered all-map tensor coproducts require a counit for empty fibres and
cocommutativity for independence of fibre ordering; their algebra-map and
balanced-module laws use the bialgebra compatibility. Prove identity/composition
and permutation naturality from precisely these laws. The p.81 assertion for
“any coalgebra” must retain these hypotheses for the stated unordered functor.

**RQFT5.GeneralFree — the all-map balanced adjunction.**

Define the category of distribution algebras by these all-map functor,
U-action and unital external-product laws; morphisms preserve all three.
The forgetful category retains the `U^I` modules, bijective relabelings and
unital external products, and forgets maps that are not bijections.
Prove the following free construction for every object A of that forgetful
category, with its U-modules, relabelings and unital graded-commutative
external products. The tensor family `A(J)=W^{⊗J}` of an even U-module W
is a special case. Define its free distribution algebra using every map
`f:I→J`, not just surjections:
`Free(A)(I)=⊕_(J,f:I→J) U^I⊗_(U^J,f_U*) A(J)`, modulo bijective
relabeling of J. Here the right `U^J` action on `U^I` is through the
coproduct/counit algebra map f_U*. Specify the balancing and relabeling relations;
`g:H→I` sends `[f,D⊗a]` to `[f∘g,g_U*(D)⊗a]`, and external products send two
classes to the disjoint-union map and tensor product of their representatives.
Prove these operations are well-defined, satisfy the distribution-algebra laws,
and give the left adjoint: a compatible map A→V extends uniquely by
`[f,D⊗a]↦D f*(a)`.

**RQFT5.OpenGraphSpecies — graded incidence action and Wick map.**

Define Fey₀(J) as the graded linear species of the actual finite half-edge
graphs on the vertex set J. Internal halfedges are paired as edges, including
parallel edges and self-loops; remaining halfedges are open field ports.
Keep their field type, jet multi-index, original vertex incidence and
ordered/labelled external tensor profile. Quotient by multilinearity,
the declared field/derivative relations, vertex relabeling and precisely
RQFT5's Koszul symmetry. Equivalently multiply the unpaired ports at each
vertex into its residual graded-symmetric field polynomial; prove that
comparison without using any field factor twice. Distinguish this from
closing or evaluating the open ports. Graph parity and tensor transport
are the existing field/Grassmann parity; loop number adds no second sign.
External products are disjoint union, with unit only at J=∅.

A translation generator D_(v,μ) acts by the **sum of its allocations to
every incident halfedge at v**, internal and open, and to any smooth vertex
coefficient. A self-loop has two such incidences. On the residual-polynomial
presentation it acts by total D on that polynomial as well as by the endpoint
derivatives on internal edges. Define higher U operators by the iterated
primitive coproduct and prove the multinomial allocation, module,
Koszul/relabeling and disjoint-product laws. These operators are not free
independent U-labels attached to a vertex. The field-jet coderivation
`Δ_A D=(D⊗id+id⊗D)Δ_A` proves compatibility of the two presentations.

Use the actual native `TauCeti.Algebra.Lie.UniversalEnveloping.Abelian`,
`Bialgebra` and `HopfAlgebra` modules: the last constructs
`TauCeti.UniversalEnvelopingAlgebra.instHopfAlgebra` using both convolution
inverse identities, and identifies that Hopf structure's antipode with the UEA antipode. This native instance is ungraded. RQFT5 owns the abelian translation adapter: use `antipode_ι`, `antipode_mul_antidistrib`, the abelian `instCommRing` and `mvPolynomialEquiv` to prove p(D)↦p(−D), then transport it to finite vertex tensors. The ℤ/2-graded field-jet Hopf algebra with odd jets is the separate RQFT5 construction above, not an instance supplied by that ungraded module. A bare
antipode anti-automorphism alone would not supply the Hopf identities.

Apply the already stated **general** Free adjunction to this Fey₀, in the
graded Koszul category. Put Fey=Free(Fey₀), retaining all finite-set maps
and integrated slots. The tensor family W^⊗J, for the space W of field-jet
polynomial densities, is a separate object. Its edgeless-corolla inclusion
puts every field factor in an open residual slot and is an external-product,
U- and bijective-relabeling morphism. Thus it induces the actual morphism
`Free(W^⊗)→Fey`. Define the switched species Fey₀ᶜ by adding one compact
smooth coefficient at every vertex and including its derivative in this
same total action. Tensor families of these nonunital compact density
spaces still have their external-product unit at the empty index set.
RQFT6 owns their compact distribution realization and tested open tensors.

Define Wick_J:W^⊗J→Fey₀(J) as the coefficientwise **linear** map obtained
by expanding monomials into their labelled linear jet slots and summing
all partial pairings. Each pair becomes an internal edge with the actual
endpoint field/jet labels and propagator type; every unpaired slot remains
open. Prove descent from labelled slots using the exact factorials and
Koszul permutations, independence of temporary orders, U-equivariance and
bijective-relabeling equivariance. The empty pairing is the corolla term.
Include the existing vacuum projection and finite exterior coefficient
realizations, using every Wick/closed-fermion-loop sign exactly once.

Wick is generally not an external-product morphism: two linear field
vertices have a cross-edge term absent from the disjoint product of their
one-vertex Wick sums. Record Borcherds p.83 item3's literal homomorphism
claim separately. Its interpretation as the earlier full Wick sum fails
by this witness; the distinct corolla inclusion is a valid morphism.
One may define Wick on balanced free representatives explicitly by
`[f,D⊗a]↦[f,D⊗Wick(a)]`; prove the U/bijective balancing and all-map linear
naturality. This is a linear transformation of the underlying diagram
modules, with no external-product preservation claim or algebra-adjunction
argument. Its connected exponential and renormalization identities are
RQFT6 cut-flag theorems. A graph realization extends as a distribution-
algebra morphism only after product, **bijection** and exact U laws and an
actual all-map target have been supplied. Unswitched noncompact amplitudes
do not acquire that target merely from this algebraic Free construction.

**RQFT5.FiniteOddPolarization — complete finite-stage jet separation.**

For each fixed finite field/fibre/ordered-slot/jet-order stage over ℝ orℂ, form its actual graded coefficient-tensor/jet space with precisely the declared Koszul and symmetric-jet relations. First fix a finite exterior coefficient stage Λ_M. For the finitely many odd input slots choose fresh independent exterior generators outside Λ_M; use independent commuting polarization parameters for even slots and independent tagged copies for every ordered input. Evaluate a slot jet by the derivative of its own smooth profile. Extracting the product of the fresh generators and the required commuting parameters recovers the multilinear coefficient with its fixed Koszul sign. For symmetric repeated slots prove the polarization/factorial comparison in characteristic0; an actual repeated odd generator vanishes by the declared exterior relation, not because a testing stage was too small.

Use polynomial-times-compact-bump profiles equal to the chosen Taylor polynomials near an arbitrary point to realize every finite profile jet. Prove that this testing family separates the finite formal tensor space before any numerical physical identification or integration. Prove the canonical extension Λ_M→Λ_N into a larger coefficient/test stage is injective, the recovered coefficient is unchanged, and all jet operations, permutations, tensor products and finite coevaluation commute with this extension. Thus the separation theorem is stable as fresh odd stages and finite jet orders increase. It supplies TypedJetImage and the later tested SwitchedRealization; neither consumes a separation proof from the other. Auxiliary compact output-kernel tests are independent of these physical profile polarizations.

**RQFT5.BalancedJetModule — total derivatives at fixed field degree.** At homogeneous physical field degree m≥1 use the ordered linear field-slot momentum symbols k_s for **all** physical field factors at that vertex, both internal incidences and open residual slots. A self-loop supplies two incident factors. Auxiliary output tests are not among these slots and contribute neither to m nor to their derivative degree. The linear change K=Σ_s k_s and κ_s=k_s−K/m, Σ_sκ_s=0 identifies their polynomial algebra with the tensor product of polynomials in total K and relative κ. Prove the comparison on the symmetric multi-index jet carrier, with all field fibres and graded permutation quotients. In characteristic0 the finite permutation relations commute with K and the relative split, so total D acts by K and the balanced coefficient factor is its degree-zero K part. Prove compatibility with finite jet filtrations, inclusions, field permutations and linear spacetime covariance. For an actual physical coefficient/profile differential module B_phys, form its tensor product with this free translation factor using the primitive coproduct; the explicit twist is `p⊗b↦Σ(p_(1)·b)⊗p_(2)` from the first-factor U-action to the diagonal one, with inverse `b⊗p↦Σp_(2)⊗(S(p_(1))·b)`. Tensor the balanced factor throughout and prove these are inverse U-module maps, including every derivative of b. The displayed switched tensor order and inverse use the cocommutativity of the abelian translation Hopf algebra U, as well as its antipode identities; no such inverse formula is asserted for a general noncocommutative Hopf algebra. Work first at compatible filtered stages; a fixed finite jet cutoff is not asserted D-stable by itself. Field degree0 is separate: use constant vacuum kernels with the smooth multiplier/module laws, not a false free-module assertion for the unit. This is a field-jet/total-derivative presentation, not a quotient by integrated Div or an equation of motion. For the controlled-extension consumer, prove compatibility with actual Wick contraction/proper-block restrictions and the declared class/tadpole constraints before prolonging balanced input extensions by D; numerical/EOM/Ward quotients require their separately checked stable relations.

**RQFT5.WickCompact — switched Wick map and compact density carrier.** Put W_c=C_c∞(M,ℂ)⊗W and define
`Wick_J^c:W_c^⊗J→Fey₀^c(J)` on pure tensors by applying Wick_J to the w_v and attaching the single coefficient b_v to vertex v in every resulting graph, then extend multilinearly. Each b_v appears once, including in vacuum terms; there is no new b per contracted edge or open slot. The total D action differentiates b_v and all incident field slots. Prove U-equivariance by the complete Leibniz expansion, plus Koszul and bijective-relabeling laws, using the unswitched Wick theorem. Define its linear balanced extension explicitly by `[f,D⊗a]↦[f,D⊗Wick^c(a)]`; prove independence under U-balancing and bijections and compatibility with every finite-set map. This is a linear diagram map, generally not an external-product morphism, so no distribution-algebra adjunction is asserted for Wick^c. The switched corolla inclusion remains the distinct external-product morphism.

With the fixed Euclidean density dx, let W_fld denote the field-jet polynomial density representatives and A_fld the field-jet Hopf algebra. The map a↦a dx is a canonical module/total-derivative equivalence, written W≅A in the source formulas; it is not multiplication of two density factors. Tensoring gives Ξ_c:W_c=C_c∞⊗W_fld≃C_c∞⊗A_fld=A_c. Prove Ξ_c commutes with jets, scalar/exterior coefficients and every vertex tensor power. ConnectedSubstitution applies Wick^c through Ξ_c⁻¹, retaining the single physical density and b_v at each vertex.

For p84's map I={4,5,6}→J={1,2,3}, f(4)=f(5)=1,f(6)=2, retain the
unhit slot3. Its coordinate pushforward integrates x3 and puts the first
original variable on x4=x5; it does not merely relabel/delete a vertex.
For each translation derivative derive
D1→D4+D5, D2→D6, D3→0 and1→1. This is the empty-fiber counit law and
explains why the free formula must include non-surjections. In the tensor
family case the unhit slots give the coinvariants below; for a general graph
family retain its actual balanced quotient, without assuming it factors as
the same tensor-family symmetric algebra.

**RQFT5.TensorCoinvariantNormalForm.** For the tensor species `A_sp(J)=W^{⊗J}`
only, derive the surjection-plus-injection normal form. Splitting J into im(f) and
unhit slots factors its tensor power; the unhit slots use the counit and yield the
linear coinvariants `W_𝔤=W/span{Xw:X∈𝔤,w∈W}`. This is a vector-space quotient,
not the field algebra modulo an ideal of derivatives. Prove
`Free(W^⊗)(∅)≅Sym(W_𝔤)` in the even case, and the normal form over partitions π
of I with hit factor `U^I⊗_(U^π)W^⊗π` and extra integrated factor Sym(W_𝔤).
For a ℤ/2-graded W with an even U-action, use Koszul relabeling and external products;
the extra factor and empty algebra are `Sym_gr(W_𝔤)`, canonically
`Sym((W_𝔤)_even)⊗Λ((W_𝔤)_odd)` over the declared characteristic0 field.
Prove supercommutation, the parity-preserving coinvariant comparison and all unit/
empty-index cases. For an arbitrary species A_sp retain its actual balanced quotient:
`Free(A_sp)(∅)=⊕_[J] (𝕜⊗_(U^J)A_sp(J))_(S_J)`, with counit right action on 𝕜
and the declared Koszul symmetry. No unhit-slot tensor factorization or Sym(W_𝔤)
is asserted for general A_sp, in particular Fey₀; its closed-graph coinvariants are
those of its own species. The general all-map Free adjunction remains unchanged. For its fermionic realization use the graded target
`V_Λ(I)=𝓔′(M^I)⊗Λ`, where Λ is a specified exterior coefficient algebra,
first at each finite-generator stage and then in the filtered algebraic colimit.
External products include coefficient multiplication and Koszul signs; prove
the stage/colimit and derivative-action compatibility. A purely even scalar
distribution target only realizes the even sector. Spinor-valued amplitudes
also carry the prescribed external spinor tensor factors. Include the unit/vacuum sector and arbitrary numbers
of integrated slots. This is a derived universal-property formula; p.82's
obscured middle tensor factor remains unreadable source data. In particular
p.86's `I→I∪{1}` operation is included and kills total derivatives in the
integrated slot. Build Fey=Free(Fey₀) and its coefficientwise graph operations in the graded Koszul category, with the induced corolla morphism Free(W^⊗)→Fey and the declared finite exterior-coefficient realizations. RQFT5 exports that algebra, graph map and combinatorial identities to RQFT6. RQFT6 alone constructs the distribution-valued realization, products, extensions and renormalization action. For integration in pp.86–88, RQFT6 proves the proper-support/cutoff or Fourier-restriction hypotheses; compact support of the abstract graph model does not establish that analytic realization.


For a polynomial scalar interaction such as `L_int=−λφ⁴/4!`, RQFT5 owns symbolic
Z(J), connected W(J)=log Z(J), and Γ on the completed Fey graph carrier, with a
specified formal free quadratic pairing/propagator and its inverse-contraction rule.
For positive spacetime dimension these are symbolic graph sums, not an inverse of
the Klein–Gordon operator on all smooth fields. A numerical/distributional realization
consumes RQFT6.GaussianLegendreRealization, built from SwitchedRealization and its chosen RQFT1 Green kernel on the stated
source/solution or boundary/quotient domain, plus the product/extension and IR
hypotheses actually used there. RQFT5 owns the combinatorial connected/Legendre/1PI
identities; RQFT6 owns their realized coefficient identities. For0D or a declared
finite nondegenerate quadratic model, the actual formal Hessian must be invertible
on its stated finite carrier before inverse substitution. Derive coefficient extraction and tree/loop expansions, and work the exact course's 0D Gaussian and quartic examples. The finite-dimensional formula `∫ℝⁿ exp(−⟨x,Ax⟩) dx = π^(n/2)/√det A` requires real symmetric positive-definite A, or a complex symmetric A with positive-definite real part and a continuously fixed square-root branch. The source instead says “positive definite imaginary part” beside a negative-real exponent; record this as a source-side condition mismatch (that condition belongs to an oscillatory `exp(i⟨x,Ax⟩)` convention), not as a valid convergence hypothesis. For the source's oscillatory Gaussian, with real symmetric invertible A and a fixed Fresnel regulator/branch, prove the normalized identity `I(J)/I(0)=exp(−i⟨A⁻¹J,J⟩/4)`; fix its meaning by `I_ε(J)=∫exp(−ε|x|²+i xᵀAx+i Jᵀx)dx`, ε>0.
For real J prove pointwise convergence as ε↓0 from the closed formula, and convergence
in tempered distributions in J by a uniform polynomial bound (the real part of the
regulated source exponent is nonpositive, and the determinant prefactor is bounded).
This Abel/Fresnel boundary value is the chosen oscillatory-integral definition;
no alternate unspecified limit topology is left open. Compute the unnormalized factor with that same regulator: for real symmetric invertible A, `I(0)=π^(n/2)exp(iπ signature(A)/4)/sqrt(|det A|)`, equivalently the specified limit of `π^(n/2)/sqrt(det(εI−iA))`. The p.52 factor `π^(n/2)/sqrt(det A)` drops the Fresnel phase. For the source’s `exp(−iJΔJ/4)`, prove the coefficient `(−i/4)^k(JΔJ)^k/k!` and derive the symmetric 2k-point kernel from the `(2k)!/(2^k k!)` pairing count, rather than dropping factors. The p.54 labels G₁ for the two-point kernel and G₂ for the four-point kernel conflict with its earlier G_N N-point notation; preserve the labels as source data and use the polarized kernels K_(2k) defined below, with odd kernels zero; W denotes the connected logarithm. In infinite-dimensional notation, `Z` is only a formal coefficient system fixed by a free propagator and interaction; its normalization and vacuum factor are formal choices.

Consume **LVF3.Borcherds52Quadratic** for the classical source comparison: the source writes `S=(φ,Aφ)` with `A=−(□+m²)/2`, so its functional Hessian is `H=2A`, and adding `(J,φ)` gives stationary equation `2Aφ+J=0`. Preserve p52's identification of Aφ as an Euler equation only as a stationary-zero-set equivalence, not equality with the Euler coefficient or Hessian. In the finite real symmetric invertible model retain the same regulator `I_ε(J)=∫exp(−ε|x|²+i xᵀAx+iJᵀx)dx`, ε>0: the exact shifted operators are `A_ε=A+iεI` and `H_ε=H+2iεI=2A_ε`. For real J prove the normalized identity `I_ε(J)/I_ε(0)=exp(−i(J,A_ε⁻¹J)/4)=exp(−i(J,H_ε⁻¹J)/2)` at each positive ε. Only after the stated Abel/Fresnel limit may the displayed inverse operators be replaced by A⁻¹ and H⁻¹. The complex pairing is bilinear, not Hermitian; realification, convergence and square-root branch assumptions remain those of the Gaussian theorem. Preserve RQFT6.GaussianLegendreRealization's kernel dictionary: on its declared inverse/domain comparison `Δ=A⁻¹=−2E` when E inverts `P=□+m²`, whereas `H⁻¹=Δ/2=−E`. Use the specified symmetric part in the commuting quadratic source pairing; do not rename Δ as the inverse Hessian. Without an actual inverse on the selected source/tangent domain, retain only that realized formal graph-coefficient statement, with its stated Green-kernel domain and no inverse on every smooth field.

For the zero-dimensional quartic integral `Z(j,λ)=∫ℝexp(−φ²/2−λφ⁴/4!+jφ)dφ`, prove convergence on its actual parameter domain and derive the formal expansion coefficientwise. Prove the source's branch-order and essential-singularity assertion on the fourfold analytic continuation specified below; it is a statement about that continuation, while the original integral has a finite boundary value at λ=0. Likewise, the transcribed expansion `e^{jφ}=Σ(jφ)^{2k}/(2k)!` omits odd powers and is false as a formal identity, although the even Gaussian measure makes odd integrals vanish after integration. Show the resulting perturbation series is formal/asymptotic and does not have a convergence theorem merely because every coefficient is defined. Define `W=log Z` and prove that it selects connected graphs; derive the effective-action Legendre relation and the course's one-loop `φ⁴` correction. With `Γ=W−jφ` and `W=log Z`, compute `W=j²/2−λj⁴/24−λj²/4−λ/8+(1/2)log(2π)+O(λ²)` and `Γ=−φ²/2−λφ⁴/24−λφ²/4−λ/8+(1/2)log(2π)+O(λ²)`. A normalized vacuum subtraction changes the constant, so pin that choice. The literal p.58 `−λφ²/2−1/8` has a factor-two error in the quadratic term and omits λ in the perturbative constant; its derivative/classical-field lines support the corrected coefficients. Also preserve p.58’s intermediate `Γ=W+jφ` as a sign error under the fixed `φ=∂_jW` and `Γ=W−jφ` convention. Preserve those literal errors separately. Explain vacuum bubbles and the source-coupled `log(Z(j,λ)/Z(0,λ))` graph selection.

**RQFT5.GaussianAdapters — finite Gaussian and formal Legendre adapters for physical pp51–59.**
For the n-dimensional Gaussian example, n≥1, use volume on
`EuclideanSpace ℝ (Fin n)` and transport it to product Lebesgue measure using
`PiLp.volume_preserving_toLp`. Consume `integral_gaussian_complex`,
`GaussianFourier.integral_cexp_neg_mul_sq_norm_add` (the isotropic b‖v‖² case),
`MeasureTheory.integral_fun_norm_addHaar μ`, `EuclideanSpace.volume_ball`, and
`MeasureTheory.Measure.toSphere` / `MeasureTheory.Measure.toSphere_apply_univ`.
The radial integral lemma takes μ explicitly and needs a nontrivial finite-dimensional
real normed space E, BorelSpace E and μ.IsAddHaarMeasure (with the stated normed
codomain hypotheses); here use Euclidean E and μ=volume. Prove polar sphere mass
n times unit-ball volume, hence2π^(n/2)/Γ(n/2), while ambient n-dimensional
Lebesgue measure of that sphere is zero. At n=0 the vector space is a singleton
of volume1: the empty Gaussian integral is1, det(empty)=1, the normalized root is1,
and the unit sphere is empty with measure0. Do not use a Gamma(0) polar-area formula.
This n=0 Gaussian edge case is distinct from the0D spacetime quartic integral,
which still integrates one field variable.

For complex symmetric `A=B+iC`, with B real positive definite and C real symmetric, whiten B by a real invertible L, `LᵀBL=I`, then orthogonally diagonalize `LᵀCL`. The resulting real congruence S gives `SᵀAS=diag(1+i c_k)`. Prove the change-of-variables Jacobian |det S| and absolute integrability from
positive B. Then consume the already native diagonal theorem
`GaussianFourier.integral_cexp_neg_sum_mul_add`, with its exact hypothesis
`∀k,0<Re b_k`, using b_k=1+i c_k and the transported linear-source coefficients.
Its proof already owns the finite-product/Fubini reduction; do not assign that
native diagonal integral as new work. The real congruence and Euclidean/product
volume transports remain RQFT5 adapters. This proves `I(A)²det A=π^n` and nonvanishing. Prove continuous dependence and holomorphy of I on the positive-real-part domain by locally uniform Gaussian domination. Its continuous determinant square root is `s(A)=π^(n/2)/I(A)`, positive on real positive A; connectedness of this convex domain makes that normalized root unique. The source's choice of diagonal coordinates is valid by **real congruence** with this Jacobian; simultaneous real orthogonal diagonalization is not required. The source errors are its Im-versus-Re convergence hypothesis and its missing branch, not the diagonal-coordinate method. Keep the earlier Fresnel regulator theorem separate.

**RQFT5.QuarticContinuation — the integral and its fourfold continuation.**
For `Z(j,λ)=∫ℝ exp(−φ²/2−λφ⁴/24+jφ)dφ`, prove absolute convergence for every j∈ℂ exactly on Re λ≥0, joint continuity there, joint holomorphy for Re λ>0 and entire dependence on j at each such λ, including λ=0. The integral itself is defined on the closed half-plane, with `Z(j,0)=sqrt(2π)exp(j²/2)`. For each compact K⊂ℂ and N≥0, prove `|Z(j,λ)−Σ_(n<N)a_n(j)λ^n|≤C_(N,K)|λ|^N` for j∈K, Re λ≥0 and λ sufficiently small, where the coefficient functions are entire. Use the integral exponential remainder bound for Re(λφ⁴)≥0 and Gaussian domination of `|φ|^(4N)exp(−φ²/2+R|φ|)`. At j=0 put `b_n=(4n−1)!!/(24^n n!)`, b_0=1, for the normalized absolute coefficients. Then `a_n(0)=(−1)^n sqrt(2π)b_n` and `b_(n+1)/b_n=(4n+1)(4n+3)/(24(n+1))→∞`, so the formal perturbation series has radius zero.

Own the analytic-continuation theorem on the punctured fourfold cover `ζ↦λ=ζ⁴`. Define

```
F(ζ,j)=ζ⁻¹∫_ℝ exp(−t⁴/24−t²/(2ζ²)+jt/ζ)dt,  ζ≠0.
```
Prove it holomorphic in ζ≠0 and entire in j, using compact-parameter bounds `exp(−t⁴/24+C t²+C|t|)` for all required derivatives. For ζ>0 the real substitution t=ζφ gives `F(ζ,j)=Z(j,ζ⁴)`; deduce agreement on the positive-real component of the original holomorphic domain and hence analytic continuation along every path in ℂ*. Interpret this formula as the rotated contour `φ∈ζ⁻¹ℝ`, with the orientation/Jacobian ζ⁻¹; complex rescaling does change the contour. Continuation around λ=0 lifts to ζ↦iζ. The substitution t↦−t proves `F(−ζ,j)=−F(ζ,j)`, whereas four turns return ζ itself. Since the starting germ is nonzero, this yields monodromy of exactly order four. For fixed j, its positive-real limit at ζ=0 is `sqrt(2π)exp(j²/2)≠0`. If F were meromorphic there, this finite limit would rule out a pole, hence force a removable singularity; oddness in ζ would then force its value to be zero, a contradiction. Thus ζ=0 is essential on this fourfold cover. RQFT5 owns this concrete integral/holomorphy/monodromy and nonmeromorphic-at0
proof. This concrete nonmeromorphy proof consumes native
`meromorphicOrderAt_ne_top_iff`, `tendsto_cobounded_of_meromorphicOrderAt_neg`,
`tendsto_nhds_of_meromorphicOrderAt_nonneg` and `MeromorphicAt.analyticAt` from
Mathlib.Analysis.Meromorphic.Order. Use the latter only after redefining the value
at0 to the continuous puncture limit. The nonzero positive-ray limit excludes the
identically-zero punctured germ; a pole would diverge on that ray, while nonnegative
meromorphic order gives a removable extension. Its oddness forces value0, contradicting
the nonzero limit. This argument needs no generic Laurent construction.
The single generic punctured-germ, Laurent-coefficient and isolated-singularity
construction remains owned by [GH2's local Laurent phase](https://github.com/TauCetiProject/TauCetiRoadmap/blob/30a7252b70e6e7169abc023ea8856ceabb43206a/TauCetiRoadmap/GlobalHolomorphicFunctions/README.md#L651-L673),
including its full essential-singularity scope. The separate finite-pole
stalk/fraction-field and regular-evaluation comparison is supplied by
[CK K3.MeromorphicGermField](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md#L332-L374). Neither scalar supplier is a prerequisite
of the preceding native-order/oddness proof and neither is re-owned here.
Radius-zero asymptotics alone are not the essential-singularity proof.

Normalize the Gaussian scalar and work coefficientwise in ℝ[[λ,j]] with
Z_hat=Σ_(n,k≥0)(−λ)^n j^(2k)(4n+2k−1)!!/(24^n n!(2k)!), using(−1)!!=1.
Its total constant is1. Define `W_hat=(PowerSeries.log ℝ).subst (Z_hat−1)` in `MvPowerSeries (Fin 2) ℝ`. Consume `PowerSeries.HasSubst.of_constantCoeff_zero` to prove this substitution admissible from its total constant coefficient zero, and consume `MvPowerSeries.pderiv`. Own the coefficientwise multivariable substitution/pderiv chain rule here: after every fixed total-degree truncation all sums are finite, so polynomial substitution and differentiation prove the identities before passage to the complete series.
When viewing it as a series in j over ℝ[[λ]], do not silently use j-adic
substitution of Z_hat−1, whose j-constant may be nonzero; use the full
(λ,j)-adic definition. Evenness gives φ=W_hat,j with φ(0,λ)=0 and
W_hat,jj(0,λ)=1+O(λ), a unit. Consume native `PowerSeries.substInvOfIsUnit`, `subst_substInvOfIsUnit_right`, `subst_substInvOfIsUnit_left` and `eq_substInvOfIsUnit_of_subst_eq_X` over `ℝ[[λ]]`, with zero j-constant and unit linear coefficient as their hypotheses. Apply them to φ(j,λ) to construct j(φ,λ); RQFT5 owns the coefficient regrouping and compatibility with two-variable maximal-ideal substitution, then defines `Γ_hat(φ,λ)=W_hat(j(φ,λ),λ)−j(φ,λ)φ`. Prove the chain rule,
Γ_hat,φ=−j, inverse Hessian identity, and the exact source-leg pointing identity `∂_j(j^E)=E j^(E−1)`, with the E=0 derivative zero, without dividing by j at0. A nonzero basepoint in a
more general interaction must be explicitly shifted before inverse substitution.

Prove the all-order1PI identity on RQFT5's actual half-edge graph carrier:
Γ_hat=−φ²/2+Σ_[G] (−λ)^V(G) φ^E(G)/|Aut G|,
where G is connected, has at least one quartic vertex and E unlabelled
external legs, and remains connected after deleting any internal edge.
Allow loops/multiple edges; a single vertex with no internal edges is1PI.
External spokes are not internal edges for this condition. Automorphisms are permutations of the half-edges, including external half-edges, preserving vertex type, vertex incidence and internal half-edge pairing; they may permute the unlabelled external legs. Prove coefficientwise finiteness and the connected-graph
bridge-tree decomposition with exact pointed/automorphism weights that
identifies this sum with the formal Legendre transform. Graphs with bridges
are generated by that tree substitution, not counted as1PI terms. This displayed Γ_hat uses Gaussian-only normalization and includes E=0 vacuum graphs. For source-dependent normalization `log(Z(j,λ)/Z(0,λ))`, subtract Γ_hat(0,λ), removing exactly those E=0 terms and leaving every E>0 coefficient unchanged. At V=1
verify weights−λφ⁴/24,−λφ²/4,−λ/8; the middle graph has one loop,
whereas the vacuum two-tadpole graph has two loops. Adding the separately
chosen log(sqrt(2π)) recovers the earlier unnormalized convention.

For the p54 free-source normalization fix a symmetric propagator kernel Δ_sym. If a selected Δ is not symmetric, as may occur for a retarded Green kernel, set `Δ_sym(x,y)=(Δ(x,y)+Δ(y,x))/2`; the commuting quadratic source pairing depends only on this symmetric part. Define K_N by polarization of the degree-N homogeneous coefficient of `exp(−i JΔ_sym J/4)`, as an external-tensor distribution tested on N independent source slots. Prove the distributional external-tensor continuity and polarization identities coefficientwise; no infinite-dimensional LF Fréchet-derivative API is assumed. Thus `Z(J)=Σ_N K_N(J,…,J)/N!`. Prove `K_(2k)=(−i/2)^k Σ_pairings ΠΔ_sym` and K_odd=0. This K notation replaces the earlier source's conflicting G₁/G₂ indexing and does not denote the connected logarithm W. With the explicit factorial-normalized convention
`Z(J)=Σ_N i^N G_N(J,…,J)/N!`, one has `G_N=i^(−N)K_N`; at N=2k this is
`(i/2)^k Σ_pairings ΠΔ_sym`. P.54 instead displays no1/N! in that generating sum.
Under that literal ordinary-coefficient convention the conversion would be
`G_N=i^(−N)K_N/N!`; do not silently apply the factorial-normalized formula to it.
The same page writes `(−i)^k(JΔJ)^k/k!` without4^(−k), then starts with
`1+JΔJ` without−i/4. Preserve these omissions and its unweighted pairing sums as
literal source discrepancies relative to the displayed exponential, separately from
its conflicting G₁/G₂ labels and the corrected convention above.

Define time-ordered products recursively with causal factorization on causally ordered supports, permutation symmetry with graded signs, unitarity/reality if chosen, Poincaré covariance, field equation and scaling/renormalization conditions. State the exact support-domain where products are defined. Derive the Dyson series `S(g)=T exp(i∫gL_int)` coefficientwise, and its relation to formal Green functions. Gauge theories need BRST/BV or an explicitly fixed gauge-fixing and ghost complex, Slavnov–Taylor/Ward identities and anomaly assumptions; ordinary scalar graph recursion does not prove gauge invariance.

For UNSW pp36–38 fix a spatial torus of side length L>0, m>0, a finite momentum set `K⊂(2π/L)ℤ³` stable under negation, with cutoff exhaustion by `K_Λ={k:|k|≤Λ}`, and real smooth periodic external U(t,x). Use RQFT2–3’s complex scalar particle/antiparticle modes restricted to K, with `ω_k=sqrt(|k|²+m²)` and coefficients `1/sqrt(2ω_k L³)`. Define both the source’s unordered `V_K(t)=∫φ_K†Uφ_K dx` and its normal-ordered version on the finite-particle domain. Compute their finite scalar difference, vacuum expectation and diagonal one-particle correction before comparing with the source. Prove `V_K(t)−⟨Ω,V_K(t)Ω⟩I=:V_K(t):` on the common domain; the scalar is `Û(t,0)Σ_(k∈K)(2ω_kL³)⁻¹` for `Û(t,q)=∫_[0,L]³ exp(−iq·x)U(t,x)dx`. Compute the one-particle and vacuum-to-pair matrix elements with a declared spatial Fourier transform; compare the p36 and p37 opposite time-phase/momentum-transfer formulas through Hermitian conjugation rather than treating them as the same ordered matrix element.

Prove charge conservation for this quadratic interaction. Its one-particle-to-three-particle matrix element has two outgoing particles and one antiparticle: the incoming particle contracts with either identical outgoing particle, leaving a pair created by `a†b†`. Derive the sum of both spectator Kronecker-delta terms and the occupation-number normalization when momenta coincide. Define the connected contribution directly by Wick contractions in which every external mode attaches to an interaction vertex; prove there is no such four-leg contribution at first order for this quadratic interaction. The literal p37 charge glyphs remain uncertain independently of this derived charge content. These are cutoff-operator matrix elements; they are not translation-invariant amputated S-matrix elements. For UNSW p38 derive the second-order Dyson coefficient at finite cutoff with smooth switching, including both one-particle and two-particle/one-antiparticle intermediate sectors and their occupation factors. Compare its one-particle term with the source’s repeated intermediate-energy normalization. Derive any stationary energy denominator and its boundary prescription from the ordered time integrals; the displayed unprescribed denominator is not an ordinary convergent integral theorem.

Own the external-potential first Born comparison. Fix a real switching function χ∈C_c∞(ℝ) with χ(0)=1 and put `χ_T(t)=χ(t/T)`. Define `A_T=−i∫χ_T(t)⟨f|V_{K,I}(t)|i⟩dt` for the unordered and vacuum-subtracted cutoff operators separately. For static U derive the energy-conserving delta as the T→∞ tempered-distribution limit in energy transfer. Derive the rate kernel `|hat(χ_T)(E)|²/∫|χ_T|²dt → 2πδ(E)` in the source angular-frequency convention. In the static spectator pair term energy conservation requires `ω_k+ω_q=0`, impossible for m>0. Compute an explicit nonzero finite-switching pair matrix element when the spatial and temporal Fourier factors at that pair momentum/energy are nonzero. For `U(t,x)=cos(Ωt)U₀(x)`, Ω>2m, derive the positive-frequency branch `δ(ω_k+ω_q−Ω)` and its coefficient; determine its nonzero support from U₀’s Fourier transform.

Remove the momentum cutoff first at fixed L and smooth switching for the vacuum-subtracted matrix elements on finite-particle smooth-mode wave packets. For static real Schwartz U on ℝ³ and its periodizations, prove the L→∞ mode-sum comparison against Schwartz incoming/outgoing packets at fixed switching, then the T→∞ distributional amplitude limit. For Schwartz one-particle wavefunctions f use the point-sampled box coefficients `f_L(k)=(2π/L)^(3/2)f(k)` with the declared cutoff; for RQFT3’s invariant-measure wavefunction F first use `f(p)=F(p)/sqrt((2π)^3 2ω_p)`. Prove the Riemann-sum inner-product and matrix-element comparisons on these Schwartz packets. For the full Lebesgue L² carrier consume RQFT3’s box/continuum one-particle lemma for `A_h`, `E_h`, their adjoint/isometry identities and strong limit, including agreement with sampling on Schwartz packets. At fixed h the mode-cutoff projections act on the box coefficient space; exhaust them before the volume limit. The matrix-element and later time limits retain their stated smooth-packet hypotheses. These are iterated cutoff, volume and time limits; prove estimates for that order without asserting a uniform joint limit.

State the rate theorem separately for the vacuum-subtracted/normal-ordered interaction, using final-momentum tests in `C_c∞(ℝ³)` and a box-normalized initial momentum `p_L→p≠0`, not a fixed normalizable packet. For each final-momentum test, first take the cutoff limit, then L→∞ at fixed T of `L³ Σ_(p′)|A_T(p′,p_L)|²/∫|χ_T|²dt`, and finally T→∞ weakly in final momentum. Derive the density-normalized rate
`dℛ=2πδ(ω_p′−ω_p)|Û(p′−p)|²/(4ω_pω_p′) d³p′/(2π)^3`
with `Û(q)=∫_ℝ³ exp(−iq·x)U(x)dx`, and cross-section `dσ=dℛ/v_p`, `v_p=|p|/ω_p`. Prove that a fixed normalizable packet’s bounded first-order transition probability divided by `∫|χ_T|²` tends to zero under the packet amplitude estimates; it is a different statement from this density-normalized rate.

At a fixed time the continuum expression is only claimed as a quadratic form on the stated tests: normal ordering alone does not give a Hilbert-space vector `V(t)Ω`. Prove the unordered scalar diverges under K_Λ when the spatial mean of U(t,·) is nonzero, and its time-switched contribution diverges when `∫χ_T(t)Û(t,0)dt≠0`; when that coefficient vanishes the scalar contribution is zero. Subtract it before each convergence claim above. No convergence of the full Dyson series is asserted.

**RQFT5.GeneralChannelRateNormalization — translation-invariant channels.** Consume RQFT3's normalized scalar, Dirac and physical transverse-photon Fock modes and its box/continuum maps. Let n_i,n_f≥1 be the incoming/outgoing particle counts, with specified species, spin/polarization labels, masses and future on-shell momenta. On a regular compact momentum-test region take a smooth reduced connected coefficient M in the declared external-leg convention. This first theorem is a normalization lemma for such a supplied coefficient, not an existence or convergence theorem for interacting scattering. On the spatial torus of volume V=L³, with normalized external modes exp(ipx)/sqrt(2E V), and a real nonzero χ∈C_c∞(ℝ), define F_T(ω)=∫χ(t/T)exp(iωt)dt. For distinct ordered external modes prove the switched coefficient is
`−i V^(1−(n_i+n_f)/2) δ_(Σp_i,Σq_f) F_T(ΣE_f−ΣE_i) M / sqrt(Π_i2E_i Π_f2E_f)`
in this convention, and derive its occupation-number version with the actual bosonic/fermionic normalized Fock states. Define the overall switch by the center-time/translation variable of the connected coefficient. It is not the assertion that independently switching every Dyson vertex produces exactly this factor at finite T. Own the comparison from the actual tested graph/Dyson coefficients, with their relative-variable cutoffs and limits, before using this normalization on those coefficients; the distribution-valued graph realizations consume RQFT6 at that later stage.

Square the finite spatial Kronecker delta using δ_K²=δ_K and sum final modes before passing to continuum. For incoming momentum sequences on the lattice tending to fixed on-shell momenta, prove the cutoff/box-to-continuum limit at fixed T on the selected compact final-momentum tests, with M_L→M and the required uniform tested estimates; exhaust any mode regulator first. Then prove `|F_T(ω)|²/(T||χ||²_L²)→2πδ(ω)` and its pullback to the energy shell, and only then take T→∞. State the regularity condition explicitly: after imposing spatial momentum conservation, the total energy-transfer map must be a submersion near the tested zero set. For n_f=1, fixed incoming momenta leave no continuous final variable for that energy pullback; retain the result as a distribution in incoming variables when the joint energy map is regular. Identically resonant/coherent or other degenerate channels instead retain their finite-T coefficient and an owned spectral/degenerate-channel time-law comparison; do not assign them δ(0), a finite generic rate or an automatic incoming-variable pullback. Do not infer a golden rule by taking the long-time limit in a fixed discrete box. After the spatial constraint and final-mode sums, derive the per-initial-state rate factor V^(1−n_i). The density-normalized general n_i-channel rate is the limit of V^(n_i−1) times that rate, with continuum differential kernel
`|M|² (2π)^4 δ⁴(Σp_i−Σq_f) Π_f[d³q_f/((2π)^3 2E_f)] / (Π_i2E_i)`.
For identical final species compare unordered normalized occupation states with the full permutation orbit of the momentum-plus-spin/polarization labels. For a permutation-invariant final observable and an ordered phase-space integral summing that full label orbit, divide once by `S_f=Π_species n_species!`, proving the equivalence including repeated-mode normalization. For a fixed spin pattern, detector-labelled selection or partial label orbit derive the actual orbit/stabilizer factor instead: a single fixed ↑/↓ ordering integrated over both momenta already counts each such two-fermion state once and is not divided again by2. Never combine an unordered-state sum with an extra factorial divisor. Keep fixed initial spins, their declared ensemble average, and final-spin sums distinct; general initial occupation factors belong to the actual Fock-state theorem, not a guessed symmetry denominator.

Construct the future mass-shell measures and prove the needed Lorentz invariance and coarea formulas on regular strata; exclude zero massless momenta from that initial compact test region. Prove the comparison for tests avoiding critical thresholds, soft/collinear loci and internal singularities of M. At those loci retain the full channel scope by owning the specific distribution-product, extension and tested-integrability/removal theorems in RQFT6/RQFT9 before extending the rate statement. A product of arbitrary Feynman boundary values with its conjugate is not defined by the amplitude rules. Do not treat a square of a continuum momentum delta as a distribution.

For two incoming particles with positive invariant flux, put `v_M=sqrt((p₁·p₂)²−m₁²m₂²)/(E₁E₂)` and prove that dividing the V-normalized per-pair rate by v_M gives
`dσ=|M|² dΦ_(n_f)/(S_f·4sqrt((p₁·p₂)²−m₁²m₂²))`,
where `dΦ_(n_f)=(2π)^4δ⁴(p₁+p₂−Σq_f)Π_f[d³q_f/((2π)^3 2E_f)]`. Here and in the decay formula S_f is the full-orbit, permutation-invariant convention just specified; replace it by the derived orbit factor for spin-resolved/labelled selections. For one massive incoming particle prove the rest-frame decay rate `dΓ=|M|²dΦ_(n_f)/(S_f·2m)` and the laboratory 2E denominator/time-dilation comparison. Keep the general n_i density theorem; there is no universal two-body flux for all incoming states. Compare the scalar and electron static-potential rates above and in RQFT9: spatial translation invariance is broken there, and their one-in/one-out per-box rate scales as V⁻¹, so their V normalization is not this general n_i prescription. Derive heavy-target/recoil limits only with the target's actual external-state normalization and kinematics.

Own an explicit vertex-switch adapter as well. For a connected r-vertex term, r≥1, independently switching each vertex by χ(t/T) has leading center-time profile χ(t/T)^r, not χ(t/T). On the stated tested regular regions and controlled relative variables, prove the difference from that leading profile is o(sqrt(T)) in the energy-L² norm needed for the squared-coefficient limit, with the actual relative-time/tail estimates before removing their cutoffs. Its own long-time duration is T||χ^r||². For interference of r- and s-vertex terms, derive the overlap `∫χ(u)^r overline(χ(u)^s)du`; normalizing all contributions by T||χ||² retains that overlap divided by ||χ||². Do not identify different vertexwise profiles/durations or mixed-order interference with a single overall center switch without this proved conversion. The overall-center-switch theorem above and the vertexwise-switch theorem have their explicitly different profiles.

These are finite-order/formal coefficient and phase-space statements. Their interpretation as physical transition probabilities, detector rates, cross sections or widths consumes the precise asymptotic/LSZ hypotheses of RQFT8 or the separately specified inclusive/dressed charged-sector comparison. The massive-scalar LSZ theorem supplies no charged massless-photon QED scattering theorem. RQFT9 specializes the normalization to its electron-electron, annihilation, scalar/electron Compton and real-emission channels, retaining each Ward identity, singular region and infrared qualification.

## Milestone RQFT6 — distribution products, extension and renormalization

For a closed embedded submanifold M⊂N, prove restriction of scalar test
functions `C_c∞(N)→C_c∞(M)` is continuous and construct its transpose
`𝒟′(M)→𝒟′(N)` using distribution densities, comparing the fixed-density
scalar conventions. Consume P8's proper-support pushforward and prove the
inclusion specialization. Borcherds p6 reverses the test-function restriction
arrow while giving the correct direction for its dual distribution map.


Own the generic engineering-dimension and superficial-degree API used in the later source examples. Use rational engineering degrees from RQFT0’s rational unit quotient; state the additive grading/scaling laws for fields, derivatives, monomials and couplings, including negative coupling degrees. Pin the dimensionful normalization by `x⁰=ct`, `∂₀=c⁻¹∂_t` and the spacetime measure `dt d³x`: take the scalar kinetic density `(∂_tφ)²/(2c²)−|∇φ|²/2`, the Maxwell density `−F_μνF^{μν}/4` with `F=dA` and no SI charge-unit factor, and the Dirac density `ψ̄(iℏcγ·∂−mc²)ψ`. Their action has dimension `(1,2,−1)`; prove the scalar/vector physical exponent `(1/2,1/2,−1)` maps to degree1 and the Dirac exponent `(0,−3/2,0)` maps to degree3/2; the derivative has degree1. The integer physical-unit sublattice does not contain these field exponents. In four dimensions normalized scalar and covariantly gauge-fixed vector kinetic terms give dimension1, and the first-order Dirac term gives dimension3/2; a vertex of total derivative count d_v and field dimension sum Δ_fields has coupling dimension `[g_v]=4−d_v−Δ_fields`. For a connected graph, define its nominal superficial degree from loop number L, internal propagator leading UV degrees `−r_e`, and total vertex derivative counts d_v as `ω=4L−Σ_e r_e+Σ_v d_v`. Prove its incidence identities and subgraph compatibility. When every second-order scalar/vector/ghost edge has UV order−2 and field dimension1, regardless of Grassmann parity, and every Dirac edge has UV order−1 and dimension3/2, derive `ω=4−E_B−(3/2)E_F−Σ_v[g_v]`, counting each vertex occurrence. A second-order kinetic operator alone does not imply that vector-propagator order; include gauge and numerator hypotheses explicitly. Use [Tong, §3](https://www.damtp.cam.ac.uk/user/tong/qft/qfthtml/S3.html) for the engineering-dimension convention.

This degree is a leading UV count, not a pointwise estimate for Lorentzian i0 distributions on their mass shells. Prove the corresponding Euclidean ultraviolet bounds for rational propagators with the stated polynomial numerator bounds, and a comparison with position-space scaling degree under the proved Fourier/extension hypotheses. For a graph momentum routing fix a finite labelled rational presentation with A_e≥1 denominator factors at each original physical edge e: `D_(e,a)=|ℓ_e(k,p)|²+m_(e,a)²`, m_(e,a)>0 and positive integer s_(e,a). The integrand is `P(k,p)∏_e∏_(a=1)^A_e D_(e,a)^(−s_(e,a))`, where P is a polynomial valued in the finite-dimensional normed tensor space of uncontracted indices and includes every edge numerator N_e and vertex tensor. Each factor at edge e uses that edge’s same routed momentum ℓ_e. A_e counts labelled factors, not powers s_(e,a), and A_e=1 is the single-factor case. For each nonempty cycle-support subgraph γ (every edge varies along its cycle space), define `deg_γP` as the polynomial degree along `H₁(γ;ℝ)⊗ℝ⁴`, with external and complementary loop coordinates as parameters. Prove independence of cycle basis and routing. Factor the numerator into vertex tensors V_v and propagator numerators N_e, followed by the specified contractions, with derivative degrees d_v and numerator degrees n_e. Prove `deg_γP≤Σ_(v∈γ)d_v+Σ_(e∈γ)n_e`; the Dirac numerator contributes n_e=1 and cannot be omitted. For the fixed edge presentation use `r_e=2Σ_a s_(e,a)−n_e`. There is still one physical graph edge e with its original two incidences; denominator factors are not extra edges or cuts. Finite sums are handled on a fixed tensor/common-denominator presentation with proved routed numerator bounds, retaining any cancellation needed for its asserted order. For A_e=1 write s_e=s_(e,1), recovering `r_e=2s_e−n_e`. Define `ω_γ=4b₁(γ)−2Σ_(e∈γ)Σ_(a=1)^A_e s_(e,a)+deg_γP` and prove its upper bound by the corresponding nominal subgraph count. A cancellation can lower the actual degree, so a nominal upper bound does not prove divergence. Bridges carry fixed momenta along this cycle space and must not be counted as varying denominators. Prove the massive Euclidean convergence criterion: absolute convergence if every such γ, including the full loop-support core and disconnected cycle supports, has ω_γ<0. Use sector decomposition or equivalent simultaneous large-momentum estimates, handling arbitrary large-loop subspaces by their edge support; the positive masses control the infrared region.

For massless internal edges define an auxiliary infrared-regulated Euclidean integrand by replacing each zero-mass labelled factor by `D_(e,a,μ)=|ℓ_e|²+μ²`, μ>0, retaining its exponent s_(e,a), all original positive-mass factors, every edge numerator and the same labelled factor presentation. The integrand is the corresponding `P∏_(e,a)D_(e,a,μ)^(−s_(e,a))`, with unchanged positive-mass factors understood. The ultraviolet degree uses `−2Σ_(e∈γ)Σ_a s_(e,a)` in exactly the preceding formula. RegulatorContinuation and ForestConvergence use this identical fixed-μ family and multiply each labelled denominator factor by `(D_(e,a,μ)/κ²)^(−z)`; factors remain labels within the original edge, not extra cuts. Prove the same ultraviolet-degree criterion for every fixed μ>0; the degrees and the sufficient criterion are independent of μ, while estimates may depend on μ. This introduces no physical photon/graviton mass, gauge-preserving regulator, or μ→0 theorem. Physical massless infrared limits and symmetry-compatible renormalization have their separate hypotheses. Keep ultraviolet convergence, local extension ambiguities and infrared convergence separate. Derive bounds before claiming convergence; symmetries/cancellations and nonzero divergence coefficients need separate proofs. RQFT9 and RQFT11 consume this generic API rather than redefining it.

Consume P8's generic Hörmander pullback/product theorem, including its conormal cancellation criterion. Prove QFT-specific wavefront bounds for each propagator and each graph kernel, including orientation of covectors, the positive-energy cone, light-cone singularities and diagonals. In particular derive or give a counterexample to the source's candidate graph cone: for graph vertices `x₁,…,x_m`, impose `Σ_{i:x_i≽x} t_i ≽ 0` for every spacetime point `x`, with the exact causal order and covector cone fixed by signature. Show whether this candidate contains `WF(F(Γ))` and is stable under edge addition, disconnected-component product and contraction. For a product, verify at every point that no nonzero covectors in the participating wavefront sets sum to zero. For pullback along f, use the sufficient condition `WF(u)∩N_f=∅`; it is not a necessary condition for every individually defined restriction. For spacetime fiber integration use P8's pushforward on distributions whose support is proper over the retained variables, with its exact wavefront bound; no additional noncharacteristic condition is needed for that distributional pushforward. For the source's alternative Fourier-space construction, restriction of the Fourier transform to zero internal momentum is a distinct pullback: prove the appropriate wavefront condition there and the inverse-transform/normalization comparison. Do not infer that a noncompact propagator can be integrated merely from its local wavefront set. Define compactly supported switching functions, prove integration for each switched graph, and state the convergence/topology assumptions for every cutoff-removal or adiabatic-limit theorem. Replace “nowhere tangent” by the criterion for the particular operation.

For the source pp.68–69 directional description, first multiply an arbitrary
distribution by a compact smooth cutoff nonzero at the chosen point. Only
this compact localization is Fourier transformed in the generic definition;
a general non-tempered distribution has no global Fourier transform.
Consume P8's cutoff-independent localized decay definition. The source's
uncertain rapid-decay negation remains literal evidence; the singular
cone consists of directions without the required rapid decay. Its
restriction condition excludes conormal covectors. On p68’s interpretation of p as a hyperplane, p69’s phrase “p tangent to M” describes this conormal condition; preserve that wording as ambiguous, rather than declaring a tangent/conormal source error.

For finitely many inputs u₁,…,u_N define
`K_i(x)=WF(u_i)_x∪{0}`. Require at every x that
`ξ_i∈K_i(x)` and `Σ_iξ_i=0` imply all ξ_i=0. Consume P8's tensor and
all-slot diagonal pullback to construct the product, with its sum-cone wavefront bound and exact local continuity hypotheses. Derive independence of parenthesization here: the joint criterion makes every intermediate product admissible, and the tensor/pullback composition identities identify each bracketing with the all-slot diagonal pullback. A sufficient condition is that locally all the
nonzero participating covectors lie in one strict linear halfspace:
there is a common tangent vector v with ξ(v)>0 for every such ξ. For
uniform cone/seminorm estimates on compact sets use a common closed cone
and a strictly positive lower bound ξ(v)≥c‖ξ‖, c>0, or prove the required
compact-local separated-cone estimates directly. The direct finite
no-zero-sum condition remains available when no common halfspace exists.

“Contains no full line” by itself, without the needed convex/separation
hypotheses, does not imply this condition. The three rays generated by
`(2,0)`, `(-1,√3)`, `(-1,-√3)` contain no opposite pair but have a zero
sum; boundary values pulled back by the corresponding linear functionals
realize these wavefront directions at their common origin. Pairwise tests
alone do not certify their triple product. State exactly the convexity,
closedness and strict separation used if comparing a “proper cone” with a
halfspace; do not treat the source margin equivalence as an unrestricted
cone theorem. A convex pointed cone C already implies the finite no-zero-sum property: if Σξ_i=0 with each ξ_i∈C, then `−ξ_1=Σ_(i>1)ξ_i∈C`, hence ξ_1=0, and similarly for each input. Closedness and a uniform separation bound are used for the halfspace equivalence and compact-local seminorm estimates, not for this elementary implication.

This criterion constructs each finite admissible product. For an infinite ordered
family require convergence of its actual partial products in a declared
distribution/controlled-wavefront topology, with the support, cone and
seminorm bounds needed for subsequent operations or regrouping. Empty
wavefront sets give no such convergence: constant factors2 have partial
products2^N. As one explicit sufficient smooth case, prove that
`Σ_i‖f_i−1‖_(k,K)<∞` for each compact K and every k implies convergence of the ordered partial products in C∞ locally, using the submultiplicative equivalent seminorm `‖f‖_(k,K)=Σ_(|α|≤k) sup_K|∂^αf|/α!` and its Leibniz estimate; no generic infinite
singular product is asserted from wavefront exclusion alone. Preserve the
full finite graph products and their causal, insertion, scaling,
partition-stage and extension targets below.

**RQFT6.SourceProductAdapters — filter cones, component conservation and the periodic example.**

Preserve p.88's literal “wave front set is nowhere tangent” as source wording,
not the criterion. The P8 pullback hypothesis for the inclusion i:Y↪X is
`WF(u)∩N*Y=∅`, with nonzero conormal covectors; RQFT6 owns the concrete graph/
Fourier-restriction verification already specified below. Tangent and conormal
conditions are not interchangeable, and the source gives no proof on that page.

For the p74 filter-cone candidate above, use the future negative-dual convention of the Feynman-wavefront paragraph below: a future causal vector v corresponds to the covector `−η♭v`. Prove the elementary edge and negated-edge tests away from coincident endpoints. If x_i is in the future null cone of distinct x_j, choose a nonzero κ in that future negative-dual cone and define the full edge tuple t by `t_i=κ`, `t_j=−κ`, with every other slot zero. Causal transitivity implies that a future filter containing j also contains i, so its sum on t is either0 or κ; hence t lies in the candidate cone. The filter based at x_i contains i and excludes j. On the full negated tuple `−t`, that filter has sum `−κ`, outside the future negative-dual cone, so `−t` is excluded. Match the tuple t with the actual Feynman-edge covectors computed below, keeping its negation as a separate cone test. Convexity proves addition closure at fixed positions. Determine the actual candidate's validity by the still-required closed-conic base dependence, localized graph wavefront, collision and contraction/extension estimates; these elementary tuple tests are not that theorem.

For p77, prove componentwise translation invariance puts wavefront covectors in the annihilator of each component's diagonal translation, with zero allowed in individual components; it gives containment rather than equality. A bridge kernel is pulled back by the difference map and has covectors `(κ,−κ)`. A nonzero κ has a nonzero sum on each of the two components and cannot cancel their annihilator covectors. This argument also applies at coincident bridge endpoints, where the difference-kernel fibre may be full but the paired `(κ,−κ)` relation still holds. Prove the product by P8 under these hypotheses; switched kernels retain their transported support and derivative estimates.

This clause owns the unswitched Fourier-integration adapter consumed by ConnectedSubstitution. Require a retained slot component by component. For a connected component with actual Fourier amplitude `δ(Σp_i+Σq_j)a(p,q)` and smooth reduced a, the inclusion q=0 has normal covectors with zero external entries. The conservation conormal repeats one covector in every slot; its intersection is zero when at least one external slot remains. Prove the pullback is `δ(Σp_i)a(p,0)`, with RQFT0's factors, retaining **one conservation delta per connected component**. A nonempty vacuum component needs a declared translation-volume reduction and normalization before this comparison. Handle the edgeless algebra unit separately. For singular reduced amplitudes prove the full wavefront criterion rather than invoking this smooth case. Prove agreement with the proper-support switched pushforward under the actual comparison hypotheses. Massive Euclidean smoothness uses the renormalized graph estimates.

For the positive Fourier-restriction statement at p87, if u is tempered and its angular Fourier transform is represented by a continuous function near zero, prove for each Schwartz test χ that `⟨u,χ(·/R)⟩→χ(0) û(0)` as R→∞. Localize near zero in Fourier space: continuity gives the approximate-identity limit there, and rapid decay controls the tempered-distribution remainder away from zero. Derive the Mathlib 2π conversion through RQFT0. This distributional cutoff limit does not imply ordinary integrability of u.

For p87's periodic example fix n≥1 and angular period 2π. Use the explicit smooth-test carrier of smooth 2π-periodic functions on ℝ^n with Fréchet seminorms `sup_[0,2π]^n|∂^αf|`, and its continuous complex-linear dual. Prove completeness and its identification with smooth functions and density-valued distributions on the flat product torus; K5a supplies the generic smooth-section/dual definitions, while this periodic chart/density comparison is owned here. Consume the **root-level** native `fourier`, `fourierBasis`, `orthonormal_fourier` and `span_fourier_closure_eq_top` for one circle, with `AddCircle.haarAddCircle`. Construct the finite-product orthonormal complete Fourier basis and the rapid-decay smooth/polynomial-growth distribution coefficient comparisons, including their topologies and density pairing; these are targets beyond the native one-circle L² basis.

Let h be probability Haar and v the angular Lebesgue volume, `v=(2π)^n h`. For `e_k(x)=exp(i k·x)`, prove `−Δe_k=|k|²e_k` and `∫|f|²dv=(2π)^n Σ_k|f̂_h(k)|²`. For m>0 construct the unique continuous inverse of `−Δ+m²` on the periodic distribution dual by the multiplier `(|k|²+m²)⁻¹`, proving both inverse identities. Its Haar-convolution kernel K_h has those Fourier coefficients and satisfies `(−Δ+m²)K_h=δ_0` under the h pairing. For the volume pairing the representing kernel is `K_v=(2π)^(−n)K_h`; prove this density conversion and the corresponding convolution identity. This kernel is a distribution with compact support because the torus is compact, and is not smooth since applying a differential operator to a smooth kernel cannot produce δ_0. For n=1, prove the continuous representative `K_h(x)=(π/m)cosh(m(π−|x|))/sinh(mπ)` on [−π,π]; this basic kernel needs no singular distribution extension. For n≥2 the diagonal point evaluation is not supplied by the Fourier distribution construction; in n=2 its basic singularity is logarithmic. Determine each actual graph product or self-loop by its dimension, derivative labels, product criterion and extension bounds. Compactness alone proves neither an admissible singular product nor an ultraviolet divergence for every instance. The zero mode is invertible because m>0.

**RQFT6.RadialExtension — the annular normalizer and homogeneous kernel.**

For ambient n=m+1≥1 consume the native analytic sphere structure
`EuclideanSpace.instChartedSpaceSphere`/`instIsManifoldSphere` in
`Mathlib.Geometry.Manifold.Instances.Sphere`, with model ℝ^m and its
`contMDiff_coe_sphere` inclusion. This includes S⁰; ambient n=0 is treated
separately below. Use **CK K5a**'s complete Fréchet smooth-section carrier
for the trivial complex line on this real sphere, and its compact-support
continuous dual, with compact-convergence topology. Consume K5a.SmoothSectionMontel for equality with its strong topology. The round positive
area density identifies scalar-function tests with density tests; on S⁰
it is counting density. The sphere is compact, so all smooth tests have
compact support. RQFT6 owns the bounded adapter: compare these chart/
connection seminorms with all derivative seminorms on a fixed closed
annulus of the smooth radial extension to ℝⁿ\{0}. Prove the continuous
restriction/extension identities and the resulting sphere distribution
pairing. P8 supplies operations on distributions, not this test carrier.
Consume **CK K5a.DistributionLocalStructure** for the point-supported
finite delta-jet theorem used in the uniqueness and resonance argument.

For n≥1 use the Euclidean norm, sphere area density dΩ (counting density on
S⁰), and complex distributions; real-valued distributions are the conjugation
fixed part. Positive dilations use `λ^a=exp(a log λ)`, a∈ℂ. A degree-a
homogeneous distribution obeys `u(φ(λ·))=λ^(−n−a)u(φ)`; equivalently its Euler
operator satisfies `(E−a)u=0`, with E=Σx_i∂_i acting distributionally.
Write s_λ(x)=λx and pin scalar-distribution pullback by
`(s_λ^*u)(φ)=λ^(−n)u(φ(·/λ))`.
Prove that equivalence on the punctured and full spaces.

**Point scaling-degree convention.** In the compact-convergence topology on the continuous dual of the LF compact-test space, define
`sd₀(u)=inf{ω∈ℝ : λ^ω s_λ^*u→0 as λ→0+}`, in the extended reals; put sd₀(0)=−∞ and use +∞ for an empty exponent set. The dilation pullback is the one just pinned. Prove that replacing convergence to0 by boundedness for sufficiently small positive λ gives the same **infimum**: boundedness at ω gives convergence at every ω′>ω, while convergence gives boundedness. Prove first that λ↦s_λ^*u is continuous on every closed positive interval [λ₁,λ₀]: the pullback on smooth tests has common compact support and joint derivative-seminorm continuity there, uniformly on compact test sets. This makes each fixed interval image compact/bounded; combine it with the small-λ convergence estimates. These conditions need not agree at ω itself; for δ the endpoint family is constant nonzero. On punctured spaces use the same fixed-support/test topology after restriction; tangentially uniform normal scaling is defined at the generic transverse theorem below.

For **every a∈ℂ** first define, on punctured compact tests only,

```
R_a^×φ(x)=∫₀∞t^(a+n−1)φ(tx)dt,      x≠0,
A_a^×φ(ω)=R_a^×φ(ω).
```

The integrand has compact annular support on each punctured support stage.
Prove smoothness, LF continuity into the sphere Fréchet carrier and parameter-
local uniform seminorm bounds for all complex a, including −n−k. No pole or
full-space extension is involved. Complex powers use the positive real log.

After pairing with each compact test, consume [GH2's local Laurent phase](https://github.com/TauCetiProject/TauCetiRoadmap/blob/30a7252b70e6e7169abc023ea8856ceabb43206a/TauCetiRoadmap/GlobalHolomorphicFunctions/README.md#L651-L673) and [CK K3.MeromorphicGermField](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md#L332-L374) at the chosen parameter point for scalar finite-pole Laurent coefficients, residues and finite parts. All common compact-support/parameter-circle finite-order bounds, LF/test-seminorm continuity and any required fixed-cone normal-topology passage to distribution-valued residues/finite parts remain RQFT6 targets. Construct the distribution-valued meromorphic family t_+^ν from the locally
integrable positive half-line power for Reν>−1. Use
`t_+^ν=(ν+1)^(-1)∂_t t_+^(ν+1)` off its poles, prove independence of the
number of recursions, holomorphy and its homogeneous scaling there, and
`Res_(ν=−1−k)t_+^ν=(-1)^kδ^(k)/k!`. Multiplication by powers of t and
parameter-local uniform finite-order bounds are part of this family API.
For `a∉{−n,−n−1,…}` and full-space compact tests define

```
R_aφ(x)=⟨t_+^(a+n−1), t↦φ(tx)⟩,       x≠0,
A_aφ(ω)=R_aφ(ω),                        ω∈S^(n−1).
```

Prove smoothness off0, degree−n−a, and LF-to-C∞ continuity on every compact
subset of the punctured space, hence to the Fréchet smooth sphere-test space.
On each fixed input compact and compact parameter set avoiding poles, prove
the common finite derivative-order/seminorm bound. The map t↦φ(tx) is a
compact real-line test for x≠0; on a compact x set away0 the support is common.
On punctured tests this full-space meromorphic map restricts to R_a^×
where defined, and that restricted family is holomorphic for every a.
Do not assume the angular data of u is a function.

Choose once a radial ψ∈C_c∞(ℝⁿ\{0}), supported in a fixed annulus strictly
inside the unit ball, with `∫₀∞ψ(rω)dr/r=1`. Construct it by normalizing a
nonzero nonnegative radial bump by this positive integral. For a smooth
homogeneous h of degree−n−a, ψh is a compact punctured test and direct radial
integration proves `R_a^×(ψh)=h` for every a. Off the poles R_a agrees
with this punctured map. Thus, off the poles on full compact tests,

```
P_aφ=ψR_aφ,       R_aP_aφ=R_aφ,       P_a²=P_a.
```

P_a lands continuously in tests supported in the fixed annulus. The expression
R_a h for an arbitrary noncompact homogeneous h is not its original test-space
domain; the cutoff is essential to the identity just stated.

For every a∈ℂ own the exact punctured angular/kernel theorem. The map
A_a^× is a continuous split surjection to the K5a sphere-test carrier,
with right inverse
`J_af(x)=ψ(x)|x|^(−n−a)f(x/|x|)`. Its kernel is exactly
`(E+n+a)𝒟(ℝⁿ\{0})`. For the nontrivial inclusion use the compact radial
primitive, in polar coordinates,

```
K_aφ(r,ω)=r^(−n−a)∫₀^r s^(a+n−1)φ(sω)ds
```

when A_a^×φ=0. It vanishes below and above a fixed annulus on each punctured
support stage and satisfies `(E+n+a)K_aφ=φ`; prove its angular smoothness and
support/seminorm bounds. The reverse inclusion is integration by parts.
For a degree-a homogeneous u this gives the unique continuous angular
distribution h_u with
`u(φ)=h_u(A_a^×φ)` for every punctured test, namely `h_u(f)=u(J_af)`.
Conversely every sphere distribution defines such a homogeneous u. In
particular `ker R_a^×⊆ker u` for a fixed u; equality with ker u is not asserted.
The intersection of those kernels over all angular distributions is ker R_a^×.
The punctured retraction P_a^×=J_a A_a^× is therefore defined for every a;
the full-test P_a uses the meromorphic map and avoids its poles.

For full tests put `U(φ)=u(P_aφ)=h_u(A_aφ)`. Prove continuity, agreement with
u on punctured tests, and the exact scaling formulas

```
φ_λ(x)=λ^aφ(λx),   R_aφ_λ=λ^(−n)R_aφ,
U(φ_λ)=λ^(−n)U(φ), U(φ(λ·))=λ^(−n−a)U(φ).
```

Thus U is a homogeneous extension. Uniqueness and independence of ψ follow
from K5a.DistributionLocalStructure at0: ∂^αδ has degree−n−|α|, so no
nonzero point-supported difference has degree a off the stated exceptional
set. Establish all density and LF/angular comparisons used in this argument.
Use dr/r for the p21 radial normalizer; retain the recorded dr variant
as a superseded transcript reading. The p22 factor λ⁻¹ is correct only for
n=1, whereas the displayed construction has λ⁻ⁿ. Its quantifier is over
nonzero x/directions, not x∈C_c∞, and its identity on a homogeneous function
uses ψ as above.

At a=−n−k fix angular h and continue the family in a. Compute the local
residue by the angular moments:

```
Res U_a(φ)=Σ_(|α|=k) h(ω^α) ∂^αφ(0)/α!,
R_(h,k)=Σ_(|α|=k) (-1)^k h(ω^α) ∂^αδ/α!.
```

Apply the same scalar Laurent supplier to U_a(φ) at each test φ. Prove the common finite-order bounds on each compact support and compact parameter circle and continuity of the resulting residue/finite-part functionals; RQFT6 owns this weak-to-distribution passage and the computed angular moments. The Laurent finite part at a fixed length-scale satisfies
`(E+n+k)FP U=R_(h,k)`, hence `(E+n+k)^2 FP U=0` and
`s_λ^*(FP U)=λ^(−n−k)(FP U+logλ·R_(h,k))` for scalar-distribution pullback.
Prove exact homogeneous extension exists iff these order-k moments vanish.
For bounded point ambiguity consume K5a.DistributionLocalStructure's finite point-supported jet theorem, not the later generic partial-diagonal extension theorem. In dimension n≥1 it gives u=Σ_α c_α∂^αδ₀ with finitely many terms. Consume that supplier's linear independence and dilation law `s_λ^*(∂^αδ₀)=λ^(−n−|α|)∂^αδ₀`. Derive here, with the preceding sd₀ convention, that a nonzero such sum has scaling degree n+max{|α|:c_α≠0}. The implication from a scaling bound uses separating test functions for its highest-order coefficients, so no cancellation is presumed. Consequently sd₀(u)≤n+k iff only |α|≤k occur (and a bound below n forces u=0). Its Euler eigenvalues are −n−|α|. Exact degree a or a generalized Euler equation `(E−a)^N u=0` selects only the resonant order |α|=−n−a, when that is a nonnegative integer. This is the radial point application; generic partial-diagonal coefficient distributions and extension existence keep their later single RQFT6 owner. Without a scaling bound, do not impose a uniform derivative-order cutoff on arbitrary extensions.

In dimension1 the angular values for 1/x are opposite, so its residue at−1
is zero and `PV(1/x)+cδ` are homogeneous extensions. For 1/|x| both are+1;
`T=∂_x(sign(x)log|x|)` obeys `(E+1)T=2δ` and
`s_λ^*T=λ⁻¹(T+2logλ·δ)`. Positive dilation moves all real c in T+cδ, while
for complex c it preserves Im c; no transitivity on the whole complex affine
line is inferred. Retain the p22 non-uniqueness example and its incorrect
non-homogeneity wording separately from these results. For n=0 there is no
sphere/radial construction: the punctured space is empty, and the one-point
space has only degree0 nonzero distributions. Handle that case directly.

**RQFT6.RealLineBoundary — real tests, Euler families and exact boundary products.**

Consume RQFT0.RealLineBoundary for B_± and their elementary Fourier/limit formulas. Consume the preceding RadialExtension degree convention, its construction of `T=∂(sign(x)log|x|)` and its logarithmic dilation anomaly, and [CK K5a.DistributionLocalStructure](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality)'s finite point-supported delta-jet theorem. Using the radial Euler identity, prove that the extensions of 1/|x| satisfying `(E+1)²u=0` are exactly `T+cδ`; the nonzero radial anomaly rules out a homogeneous extension. For 1/x prove `PV(1/x)=∂log|x|` and classify homogeneous degree−1 extensions, equivalently extensions of scaling degree at most1, as `PV(1/x)+cδ`. Reflection fixes δ and negates PV, so PV is the unique odd member of this bounded family. For unrestricted extensions, `PV(1/x)+cδ′` is odd for every c, so oddness alone gives no uniqueness. Use `s_λ(x)=λx` and `s_λ^*` for scalar-distribution pullback, reserving δ for point distributions; consume the radial real/complex orbit calculation rather than duplicating it. Keep the source's test-action shorthand and unspecified higher point jets distinct from these exact bounded classifications.

For the same-side products below, also prove the **mandatory** boundedness and convergence in P8’s normal controlled-wavefront topology; compare its compact-local strong-distribution seminorms with the native LF-test dual topology by the actual estimates.
For n≥1 define and prove the joint same-side limits

```
B_(±,n)=lim_(ε↓0)(x±iε)^(−n)
       = (−1)^(n−1)/(n−1)! · ∂^(n−1)B_±,
B_(±,r) B_(±,s)=B_(±,r+s),        r,s≥1.
```

Define `Pf(1/x^n)=(−1)^(n−1)∂^(n−1)PV(1/x)/(n−1)!` and prove
`B_(±,n)=Pf(1/x^n)∓iπ(−1)^(n−1)δ^(n−1)/(n−1)!`.
Their exact angular Fourier formula is
`F_p B_(±,n)=(−1)^(n−1)(ip)^(n−1)F_p B_±/(n−1)!`.

Include independent positive regularization parameters tending to0 and
identify this limit with P8's admissible product. For each n, prove the regularized powers `(x±iε)^(-n)` are bounded and converge in `D′_(Γ±)` with `Γ−={(0,p):p<0}` and `Γ+={(0,p):p>0}`, using P8's compact-local strong dual and cone-separated Fourier seminorms. Derive the independent-parameter joint limit by P8's hypocontinuity on these bounded families; pointwise S′ convergence alone is insufficient. Prove
`WF(B_(−,n))={(0,p):p<0}` and `WF(B_(+,n))={(0,p):p>0}` in this
negative-phase convention. Derivatives give the exact finite-part/delta
normalizations and Fourier multipliers; normalized powers satisfy
`f_−^n=(2πi)^(−n)B_(−,n)` and
`f_+^n=(−1)^n(2πi)^(−n)B_(+,n)`.
The opposite-side pair fails P8's sufficient criterion; it has no product
from that theorem. Indeed its equal-ε product `1/(x²+ε²)` diverges like
`(π/ε)δ` on real tests, while subtraction of that term gives
`Pf(1/x²)=−∂PV(1/x)`. Prove this limit and distinguish a separately chosen
finite local subtraction from an admissible canonical product. The source
labels a mixed `f₁×f₂` but displays a same-C₁ square; keep that inconsistency
and its faint contour orientations/residue factors rather than replacing
an uncertain glyph by an opposite-side product identity.

Consume P8's conormal theorem for a submanifold delta and its actual
normal-set pullback criterion. These one-dimensional adapters do not
replace the following full spacetime Feynman, advanced/retarded and graph
wavefront calculations.

Consume P8’s submanifold-delta conormal theorem and check this chapter’s
restriction-to-diagonal criterion directly. For the six scalar distributions
of RQFT1.MassivePrescriptions, with m>0 in four spacetime dimensions, compute
the following wavefront sets in the localized negative-phase Fourier
convention. Write `q(x)=η(x,x)` and `η♭x=(x⁰,−x⃗)`. At x≠0 all listed
covectors have the form `−λ η♭x`, with q(x)=0, subject to these conditions:

| Distribution | Condition at a nonzero null point x |
| --- | --- |
| Feynman G_F | λ>0 |
| Anti-Feynman G_aF | λ<0 |
| Retarded G_R | x⁰>0 and λ≠0 |
| Advanced G_A | x⁰<0 and λ≠0 |
| Positive-frequency W_+ | λx⁰>0 |
| Negative-frequency W_− | λx⁰<0 |

Prove equality in each row, including the absence of wavefront directions
at every other nonzero base point. At the origin each of the four
fundamental solutions G has the full punctured cotangent fibre: `PG=δ`
and `WF(Pu)⊆WF(u)` force every nonzero covector there, including
noncharacteristic ones. The origin fibre of W_+ is exactly
`{−η♭v : v≠0 is future null}`, and that of W_− is its negative.
The spectral support and homogeneous field equation give upper bounds;
prove sharpness from the mass-shell oscillatory integrals and their
localized nonrapid decay. Preserve the source pp.70–73 qualitative
“half expected size” claim through these precise calculations. Derivative
Dirac/vector kernels satisfy the resulting containment, with equality
proved only for the declared components.

For the source pp.73–74 two-edge loop, the Feynman and anti-Feynman
self-products are canonical away from coincidence and require extension
at coincidence. The advanced/retarded self-products fail Hörmander’s
sufficient criterion on their respective nonzero null branches, where
opposite covectors occur. This failure alone does not prove that every
separately prescribed product is impossible. The same-sign frequency
products W_+² and W_−² satisfy that criterion everywhere, including the
origin; the mixed product W_+W_− fails it on the null cone. These conclusions
concern ordinary distribution products; any claim of temperedness also
requires estimates at infinity.

For the source candidate graph cone fix `v≽0` to mean future causal
tangent vectors and interpret a future covector as `−η♭v`; every displayed
covector inequality uses this negative dual cone. Derive or refute the
candidate under exactly this convention.

**RQFT6.ControlledExtension — transverse scaling and controlled-wavefront extension.**

Consume CK K5a.DistributionLocalStructure for the generic locally finite normal-jet expression and its density/chart transport. This milestone owns its scaling-degree cutoff and controlled-wavefront consequences. The point case is the preceding sd₀ convention. Define the transverse scaling degree σ at a partial diagonal Δ of codimension q in normal coordinates `(y,z)`, `Δ={z=0}`, by scaling `(y,z)↦(y,λz)`. Require distribution estimates locally uniform on compact tangential sets, for every exponent greater than σ; estimates separately on each normal fiber do not suffice. For finite σ prove existence of an extension with the same transverse scaling degree. It is unique when σ<q. When σ≥q, prove locally that any two such extensions differ by `Σ_(|α|≤floor(σ−q)) u_α(y)⊗∂_z^αδ(z)`, with `u_α` distributions on Δ. State the transformation law between normal-coordinate charts and glue the extension/ambiguity descriptions.

For microlocal extension, work on a product normal chart `U=U_y×U_z` with `λU_z⊆U_z` for `0<λ≤1`. Write `T°U=T*U∖0`, and choose a closed conic `Γ⊆T°(U∖Δ)` containing the wavefronts of the rescaled input family. Require scaling stability: `(y,z;η,ζ)∈Γ` implies `(y,z/λ;η,λζ)∈Γ` whenever its base point remains in U. Require `{λ^s t(y,λz):0<λ≤1}` to be bounded in `D′_Γ(U∖Δ)` for every s>σ, using P8's normal locally convex topology from its final pushforward/continuity paragraph: compact-local strong distribution seminorms and cone-separated localized Fourier seminorms. Here `t_λ=t(y,λz)` is the scalar-distribution pullback: `⟨t_λ,φ⟩=λ^(−q)⟨t,(y,z)↦φ(y,z/λ)⟩`, for compactly supported tests in the chart; the factor `λ^(−q)` uses the normal codimension q. P8's same paragraph supplies the proper-support pushforward wavefront bound and continuity; prove the normal-dilation family estimates here. Choose a smooth radial normal cutoff χ equal to1 for `|z|≤ε` and0 for `|z|≥2ε`, with the closed `2ε` normal ball inside U_z and strictly decreasing transition in between. The projection to U_y is proper on `supp χ`. Define `ψ=−(z·∂_z)χ`; its support lies in the normal annulus away from Δ and is proper over U_y. Define
`Ξ_ψ={(y,0;η,ζ)≠0 : ∃z, (y,z)∈supp ψ and (y,z;η,0)∈Γ}`.
All closures below are taken in `T°U`, retaining base points on Δ and excluding only the zero covector. Prove the wavefront-controlled extension theorem of [Dang, Theorems3.4–3.5](https://arxiv.org/html/1412.2808v1#S3.SS3), with output `WF(t̄)⊆WF(t)∪N*Δ∪Ξ_ψ`. Prove the needed closed-cone bounds for the cutoff construction; preserve exceptional-degree logarithmic estimates rather than claiming a bounded endpoint scaling seminorm. Under `closure(Γ)∩T°_ΔU⊆N*Δ`, choose cutoffs sufficiently near Δ locally uniformly on each compact tangential set to derive the sharper bound `WF(t̄)⊆WF(t)∪N*Δ`. This conormal-landing case is not a hypothesis on every graph amplitude.

Classify ambiguities inside the controlled wavefront class as well as inside the scaling-degree class. Set `Λ=closure(Γ∪N*Δ∪Ξ_ψ)` and `B_Λ={(y,η)∈T*Δ∖0 : (y,0;η,0)∈Λ}`. For the scaling-stable cone and radial annular cutoff above, also define `Ξ_tan(ψ)={(y,η)∈T*Δ∖0:∃z, (y,z)∈supp ψ and (y,z;η,0)∈Γ}`. Prove `B_Λ=Ξ_tan(ψ)` and
`Λ∩T°_ΔU=N*Δ∪{(y,0;η,ζ) : (y,η)∈B_Λ, ζ arbitrary}`.
Prove this equality by carrying every nonconormal limit from `closure Γ` to the fixed annulus by outward normal scaling, with the normal covector rescaled to zero; properness of the annulus and closedness of Γ make the nonzero tangential slice closed. The closure of Ξ_ψ adds only conormal directions. For two radial cutoffs of radii ε≤ε′ prove `Ξ_tan(ψ_ε)⊆Ξ_tan(ψ_ε′)`; the controlled cone can depend on this choice. Pin linear block-centre and relative coordinates at each partition stratum: finer within-block collision equations are homogeneous under the relative dilation. Restrict to product neighborhoods avoiding cross-block collisions. On the noncompact stratum use a locally finite such atlas and compact-local cutoff radii, transform each cotangent cone by the actual chart map, and construct a common closed conic majorant. On the stratum include the full normal lift of the closed union of the transported tangential slices and the conormal bundle. Prove the resulting global controlled class contains each local extension and is preserved under the partition-of-unity gluing; do not silently identify different local cutoff cones. For two extensions with the stated scaling bound and wavefront contained in Λ, prove that their difference has the finite transverse-jet form above with `WF(u_α)⊆B_Λ`. Conversely, prove that coefficients with these wavefront and derivative-order bounds give exactly the admissible changes within this controlled class. Recover coefficients using the proper-support projection of `z^β` times the difference, with a cutoff equal to1 near Δ: it equals `(-1)^|β| β! u_β`. Use P8's pushforward bound for necessity. For sufficiency prove the tensor bound
`WF(u_α⊗∂_z^αδ)⊆{(y,0;η,ζ)≠0 : (y,η)∈WF(u_α) or (η=0 and y∈supp u_α)}`,
then the normal-saturation identity for Λ. Finite sums use the union of these cones. For a separately prescribed cone without that saturation property, state the coefficient pushforward necessity and tensor-lift sufficiency separately and prove the additional compatibility needed for an equivalence. A distribution supported on Δ has wavefront contained in `N*Δ` iff all its transverse-derivative coefficients are smooth, under K5a.DistributionLocalStructure's locally finite structure theorem. Use constant coefficients only after the appropriate translation-invariant total-diagonal reduction; partial diagonals retain other relative coordinates. The scaling/structure proof route is [Brunetti–Fredenhagen, §§5–6](https://arxiv.org/abs/math-ph/9903028); the controlled coefficient statement must include the preceding cone argument, in addition to [Dang, §8](https://arxiv.org/html/1412.2808v1#S8).

**RQFT6.ControlledKernelStages — intrinsic partition-stage induction.**

For a finite vertex set V, index collisions by partitions π. Set `Δ_π={x : x_i=x_j whenever i,j lie in the same block}` and `Δ_π°=Δ_π∖⋃_(ρ strictly coarser than π)Δ_ρ`; distinct blocks have distinct positions there. Set `c(π)=4Σ_(B∈π)(|B|−1)` and `U_k=M^V∖⋃_(c(π)>k)Δ_π`. Start on U_0, the distinct-point configuration space, and extend in increasing codimension. Equal-codimension strata are disjoint closed submanifolds of their stage. Stage0 takes the product of the non-self-loop propagator kernels, their derivative/numerator operators and the prescribed local vertex factors only after proving the no-zero-sum wavefront criterion for every participating product on U_0. Own this proof for the scalar Feynman class and the stated Dirac/vector kernels obtained by differential or smooth tensor operations. Advanced/retarded self-products that fail the criterion are not stage0 products; their renormalized prescriptions require a separately defined extension or causal construction and its estimates. A self-loop is evaluated by the local prescription below, not by a pullback to a zero separation.

Consume RQFT6.ControlledExtension. State **ControlledStageOperations** as
input data for a parametric induction theorem, before selecting any completed
𝓛/𝓕 prescription. Specify graded block-input tensor spaces, scaling-stable
wavefront cones, numerical transverse budgets and the actual exterior-product,
restriction, contraction/insertion and fixed local tadpole operations.
Require the following local operation hypotheses on each compact cluster chart:

- For every finite product include zero covectors in individual factors and
  exclude a zero sum unless all factors are zero; for every pullback verify
  its noncharacteristic condition and for every pushforward its proper-support
  condition. Give the resulting wavefront-cone containment.
- Fixed restriction/pullback and proper-support pushforward maps are continuous
  in P8's normal topology. Tensor/products are hypocontinuous there, with
  uniform seminorm bounds for every bounded input family in each declared
  controlled distribution space with its stated scaling budget; joint
  continuity of arbitrary distribution products is not assumed.
- Restriction to overlapping normal charts and normal dilation have compatible
  cone transports and locally uniform seminorm estimates. For each finite
  nested collision flag require one-step operation estimates simultaneously
  in its scale parameters 0<λ_j≤1 for every bounded family in the declared
  input spaces and all its simultaneous normal rescalings, with the prescribed
  scaling-budget weights, uniform output seminorm bounds, the stated additive
  scaling budgets and allowed logarithmic losses. Constants may depend on
  the other bounded factor families, as in hypocontinuity.
- Every permitted local jet insertion and tadpole substitution has its explicit
  degree-shift/transverse-scaling bound, controlled wavefront bound and bounded-
  family estimate on those charts. Require graded permutation/spectator,
  restriction, nested/disjoint substitution and fixed normalization coherence.
- Require closure of the declared cones and budgets under each extension and
  subsequent operation. For the fixed compact-local cutoff radii, include
  ControlledExtension's full output cone, its transported coefficient cones
  B_Λ and normal jet lifts, and the common closed majorant used for gluing.
  The extension outputs, restrictions, admissible switches and partition-of-unity sums
  must lie in the next declared spaces with the proved bounded-family and
  scaling estimates. Quantify these hypotheses over all bounded families in
  the input spaces, including simultaneous normal rescalings; do not define
  them by the unknown completed stage family. Cone enlargement must retain
  every no-zero-sum/noncharacteristic condition used at the next operation.

Prove the stage induction from these local hypotheses and ControlledExtension:
starting with the admissible U_0 data, finite iteration along partitions
produces stage distributions, including all earlier counterterms, with the
assigned power-counting transverse bounds and scaling-stable controlled cones
at the next collision strata. Compose the one-step bounds along each nested
flag, reserving positive exponent slack to absorb the logarithmic losses;
all bounds are locally uniform on compact cluster configurations. This theorem
does not take the completed stage bounds or the prescription being constructed
as an input. Values of graphs strictly smaller in the outer order, including
proper blocks and proper quotients, and their already proved bounds are
permitted input data in the outer well-founded graph induction.
ControlledKernelStages also owns the generic operation-verification theorem:
compute the cones and numerical budgets from its stage0 kernels, vertex
operators, derivative/tensor/pullback maps and ControlledExtension's inherited
tangential coefficient cones. Consume P8's operation theorems to verify the
local hypotheses, including extension-output closure, for each system so
computed before applying the partition induction. Verify each condition from
P8's operation theorems and the actual cone/budget data, or record the specific
failing no-zero-sum, noncharacteristic, proper-support or closure condition as
an obstruction. Call the system admissible precisely when all are verified. This includes
the generic u_α(y) coefficient extensions at coarser partitions, with their actual
B_Λ cones, rather than only translation-invariant graph-local coefficients.
For arbitrary supplied coefficient cones, state precisely the required
no-zero-sum and transport hypotheses and prove the conditional theorem under
them. In particular the normal-saturated lifts of B_Λ, with arbitrary normal
covectors ζ, must satisfy the full no-zero-sum criterion with all subsequent
factors; tangential coefficient control alone does not imply it. When a
condition fails, record the obstruction instead of asserting a canonical
product. The stage0 scalar Feynman and stated differential/tensor systems remain
owned here; TotalDegreeInsertion owns the additional intrinsic 𝓛/𝓕 verification. At each block with fresh freedom use an intrinsic translation-invariant extension in the controlled class proved above; preserve the full prepared input from all proper blocks. An alternative Taylor-cutoff map requires its own controlled wavefront proof. Prove these maps, switching and gluing preserve the estimates, with the prescribed logarithmic losses. For each new Δ_ρ°, the input includes the counterterms already fixed on finer strata; prove its scaling and wavefront estimates before applying extension. In the generic distribution theorem, extend tangential coefficient distributions at coarser partitions with the inherited bounds. For a supplied intrinsic graph-local operation system satisfying the hypotheses, propagate its more restrictive block tensors and insertion maps. Its actual construction and verification for 𝓛/𝓕 are owned later by TotalDegreeInsertion; arbitrary generic tangential coefficient extensions do not supply it. Prove compatibility on overlaps, preservation of already prescribed restrictions and commutation of fixed compatible operations on disjoint same-stage strata. This independence concerns the fixed prescription; the later graph-local verification must also establish its declared product rules and the generic controlled ambiguity bounds.

**RQFT6.CommonOpenTensorData — open tensors and nominal degrees.**

The analytic realization in this block is conditional on a supplied admissible
ControlledStageOperations system and consumes ControlledKernelStages. Its formal
open tensors and nominal spaces are constructed from the preceding RQFT5 data,
without a completed prescription as input. A prescription is a universal multilinear family in the local vertex tensors,
not only its value after specializing numerical couplings. For every ordered
field-port list c and homogeneous derivative degree d, use the finite-dimensional
graded input space V_(c,d) of its field tensors and derivative polynomials.
Inhomogeneous vertices are finite sums of these homogeneous inputs; define the
family by multilinearity. Retain all port lists and derivative degrees in the
full carrier. Work with the uncontracted port tensors until the indicated
vertex contraction; their graph isomorphisms and tensor permutations use
RQFT5's Koszul braiding. A closed fermion loop contributes its Wick sign once
in the graph amplitude and the compatible insertion map, not again here.

An open root slot is the actual identity tensor
coev_V=Σ_a e_a⊗e^a∈V⊗V*, independent of basis. It retains every incident
arm port and every unused external spectator port. Closing it at t evaluates
that slot at the single original vertex tensor t. A spectator space S passes
through as id_S: an open kernel K becomes K⊗id_S. Impose linearity and
this spectator naturality before assigning coefficients: for every homogeneous
map f on such external ports, the two coordinate expressions obtained by
applying id⊗f to the vertex input or precomposing the external functional by
id⊗f agree, with the RQFT5 braiding. Polynomial external-derivative maps carry
their stated homogeneous degree shift. These are relations of the actual
open wiring carrier; independently decorating a padded shape does not create
another parameter. Both 𝓛 and 𝓕 and their free coefficient families obey them.

For any supplied system satisfying those hypotheses, this block owns the
conditional componentwise realization of these identities. Extend the independent
uncontracted kernel components in that system's controlled class, and then
evaluate the vertex tensors; constant external tensor maps commute with this
linear componentwise construction. Use independent formal derivative generators
and define their images by the full Leibniz differential operators, proving the
formal linear/derivative relations and their scaling/WF bounds. Extra field
equations or Ward identities with contact terms require their declared compatible
affine constraints; do not identify them with arbitrary zero relations.
The later owners TotalDegreeInsertion and TypedHopf prove that their
renormalized residue insertions, proper-block stages and tadpole maps
are natural on this same carrier. Thus a single positive-loop arm with additional
pure ports is already its own spectator extension and imposes no new
no-articulation coefficient relation.

Use the type-level nominal count
`ω_γ^nom=4b₁(γ)−Σ_e r_e+Σ_v d_v` and `N_γ^nom=floor(ω_γ^nom)`.
Decompose each homogeneous derivative input further into its actual halfedge/
external-test allocations. For an extracted edge subgraph γ, let
`e_(γ,c)=d_∂(γ,c)` be the total degree on its boundary halfedges: the
original external ports and the incident halfedges of every uncut edge,
including an uncut edge whose two ends both belong to γ. Retain that
allocation in the port type c. Its internally allocated derivative count
is `Σ_(v∈γ)d_v−e_(γ,c)`. An inhomogeneous input is the finite sum of these
components. Define the **total local-symbol degree** by

```
b=deg_(P_γ)β,       q_(γ,c,β)=b+e_(γ,c),
J_(γ,c)^nom=T_c⊗Pol_(≤N_γ^nom−e_(γ,c))(P_γ).
```

The jet space is0 if the normal-polynomial upper bound is negative.
The normal configuration space is `N_γ=M^{V(γ)}/diag M`; prove its dual
is `P_γ={p:V(γ)→M*:Σ_vp_v=0}`, with the fixed Fourier/density comparison.
A root choice is a relative-coordinate chart. The polynomial β records
normal derivatives of the total-diagonal delta; individual-port derivatives
remain in the specified port tensor. A one-vertex graph has P_γ=0 and b=0,
while its total symbol degree q=e_(γ,c) may be positive. For a port-factored
kernel component prove the nominal transverse bound
`codim Δ_γ+ω_γ^nom−e_(γ,c)` and the corresponding bounded normal-jet
ambiguity. Its complete local symbol still has the total bound q≤ω_γ^nom.
Keep the generic partial-diagonal coefficient-distribution theorem separate.

For a contraction `a:V(Γ)→V(Γ/γ)`, quotient momenta are block sums
`(a_*p)_B=Σ_(v∈B)p_v`. Prove surjectivity and polynomial pullback.
Pin incident flow orientation: each halfedge flow is outward from its
incident vertex; opposite ends of an internal edge have opposite flows.
Include the external field and test/switching slots in the vertex sum and
remove the single overall conservation delta. RQFT0 fixes the factors i
relating these momentum symbols to derivatives. A cut jet is evaluated on
the sum of these flows at each original cut vertex, then acts by its full
Leibniz operator before contraction and before quotient-loop integration.
This is a different map from block summation on quotient momenta.

**RQFT6.TotalDegreeInsertion — complete residue degree and typed budgets.**

Consume CommonOpenTensorData for the open tensors, boundary allocations and
nominal counts, ControlledKernelStages for its conditional partition induction,
ControlledExtension for each intrinsic relative-coordinate extension, and P8
for the normal-topology operation theorems. Own the homogeneous insertion theorem on the actual open carrier. A cut
symbol j has total degree q_j=b_j+e_(γ,c). Removing the cut vertices and
inserting that residue gives exactly

```
ω_(Γ/γ[j])^nom=ω_Γ^nom−ω_γ^nom+q_j.
```

The proof counts loops/remaining propagators and replaces all removed
vertex derivative degrees by the complete residue degree q_j. Prove the
sum formula for multicuts. For nested flags expand every substituted
residue polynomial in external normal/test flows and complementary loop
flows. The dual coefficient transport is the actual Cauchy–Leibniz sum
`[x^β](j(x,ℓ)a(x,ℓ))=Σ_(κ≤β)j_κ(ℓ)[x^(β−κ)]a(x,ℓ)`.
Moving k derivative factors to an outer boundary raises that output port
degree by k and lowers the matched normal extraction index by k; negative
indices give zero. Thus total output q is preserved. Prove this for the
complete incidence-dependent sum, including derivatives on external test
slots; pure-port flows retain their relations and are not new independent
normal momenta. Multinomial coassociativity and the RQFT5 Koszul braiding
identify the two flag orders. This proves both the typed coassociativity
matching and the exact budget identity
`(ω_γ−q_j)+(ω_(Γ/γ[j])−q_Γ)=ω_Γ−q_Γ`.

Spectator padding preserves V(γ), N_γ and P_γ and acts by K⊗id_S. A
homogeneous boundary-port derivative map of degree k changes ω and q by k
and leaves b and ω−q unchanged. Prove the formal naturality identities with
this grading before assigning coefficients. For two ports at one vertex,
opposite variations of their momenta leave the vertex sum fixed; the
intrinsic normal symbol is constant along that change. The universal
coefficient space consists of natural multilinear maps from the homogeneous
vertex inputs to these J_(γ,c)^nom, with signed graph-automorphism
constraints. Actual numerator cancellations or symmetry restrictions are
additional stable affine constraints, with their actual stabilizers.

Tadpole data are the declared local contraction maps on all these open ports,
including the one-vertex compositions and residual arities generated by later
contractions. Prove their naturality, homogeneous bounds, graded composition and
compatibility; arbitrary inconsistent assignments to unrelated one-vertex shapes
need not admit a prescription. Zero normal-order data and compatible nonzero
normalizations are included. Separating self-loops uses these maps before
choosing fresh jets on the remaining non-self-loop graph. No new collision
stratum or unresolved propagator value at zero is introduced.

As a required coherent tadpole construction, use the finite field/jet polynomial
vertex algebra with RQFT5's graded contractions. An even constant pair-contraction
operator K_τ has finite exp(K_τ) on each fixed polynomial vertex. Constant even
contractions commute, so exp(K_τ)exp(K_σ)=exp(K_(τ+σ)); include the exact
labelled-halfedge/Aut factors and derivative bounds. This realizes compatible
zero and nonzero local tadpole normalizations without evaluating a propagator
at zero. Tadpole operations are a morphism of the actual typed rooted contraction
operad: generators are labelled pair caps, identity ports, tensor/braiding
maps and coevaluation, with original halfedge incidence, external test
slots and the specified derivative labels. Relations are units, compatible
substitution of nested rooted contractions, independence of disjoint
contractions and their full Leibniz/Koszul transport. All residual arities
and newly formed root self-loops are included. Prove additionally that
cutting a substituted operation is the sum of the matched nested/disjoint
cut substitutions, with the same residual operation. This cut-regrouping
identity is the Hopf-compatibility needed by the grouped defect ideal.
For the required exp(K_τ) model, constant even pair contractions commute;
labelled cap partitions and the finite exponential expansion prove both
the operad and cut-regrouping laws with the exact symmetry factors.
Any additional prescribed local operations must satisfy these explicit
typed substitution and cut-regrouping hypotheses; unrelated assignments
do not supply a prescription or a class-preserving Hopf quotient.

Separate the generic u_α(y) extension theorem from two intrinsic graph-local prescription classes, `𝓕⊆𝓛`, with the same decorated graph, field/jet, scaling, controlled-wavefront, causal-away-from-collision and insertion axioms. Separate prescribed one-vertex self-loop/tadpole tensors first; classify the remaining non-self-loop multigraph, retaining parallel edges. In the factorizing class 𝓕, the only fresh connected block choices with at least two vertices occur at connected bridgeless graphs without an articulation vertex. At a connected graph with an articulation vertex use the exact rooted block product, and at bridges use the exact product of the prescribed bridge kernels and the components obtained by removing the bridges. In the larger class 𝓛, permit a fresh bounded constant total-diagonal jet at every connected bridgeless non-self-loop core, including those with articulation vertices. For every such γ, prepare its off-total-diagonal input from all already fixed proper 𝓛 block values at the partition stages, choose one intrinsic controlled extension `E_γ(R_proper)` of that input, and write `R_𝓛(γ,c)=E_(γ,c)(R_proper)+Σ_(|α|≤N_γ^nom−e_(γ,c))c_(γ,c,α)∂_z^αδ(z)` on each homogeneous allocated port component c. The proved port-factored transverse bound is codim(Δ_γ)+ω_γ^nom−e_(γ,c); an empty normal range gives no jet. The complete local symbol still has total degree q=|α|+e_(γ,c)≤ω_γ^nom. If proper articulation-union jets are nonzero, E_γ need not be a pure articulation product; every such proper restriction must be retained. Choose E_γ to agree with the exact product when the proper data satisfy 𝓕 and that product is the prepared input. In that compatible case, including the simple two-bubble union, the formula is product plus a fresh total jet. Graphs with bridges still have exact bridge-component products in 𝓛, and disconnected graphs still have exact component products. Both classes first evaluate self-loops by their compatible local tadpole maps, so no fresh parameter is attached to a self-loop-decorated graph independently of that evaluation. These maps can be fixed or included among the compatible common bounded local parameters. A self-loop has no new collision stratum.

For every partition π, put `γ_B=Γ[B]` with all induced parallel edges and inherited field/derivative labels and external halfedges. In independent block-centre and relative coordinates take the graded exterior product of the already prescribed intrinsic `R(γ_B)` in the chosen class; singleton blocks supply their prescribed vertex/tadpole tensors. Apply the declared interblock remainder/insertion map only under its proved wavefront criterion. With several nonsingleton blocks no fresh joint counterterm is allowed: changes are exactly the expansion of the products of the changed individual block prescriptions. A connected collision means exactly one nonsingleton B with Γ[B] connected. A disconnected Γ[B] is the exterior product of its connected components, constant in their additional relative-centre variables. Use the product/bridge rule of the chosen class for each connected γ_B; the extra articulation jet in 𝓛 is intrinsic to that one block, not an independent multiblock coefficient. Products, contractions and isomorphism transports use RQFT5's graded halfedge/jet carrier and Koszul braiding. Prove independence of block order through that canonical signed identification. The Wick minus sign of each closed fermion loop is already included once in the graph amplitude and its compatible insertion rule; do not multiply it again for transport or automorphism averaging. Count each vertex tensor and interaction coupling once. Check the disconnected sunset pair (scaling degree12 at codimension12) and bridge-joined sunset pair (degree14 at codimension12): both classes fix their values by products and allow no fresh coarse jet there.

For the 𝓛/𝓕 graph-local systems, verify ControlledKernelStages'
ControlledStageOperations hypotheses using the following actual interblock
and insertion data. The interblock remainder is generally a distribution:
distinct block centres can be lightlike separated. Define it from the remaining propagators, external insertions and smooth switching factors on a product neighborhood avoiding cross-block coincidences; do not infer smoothness from distinctness. If Θ_π denotes the lifted exterior product of intrinsic block extensions and W_π this remainder, require and prove `WF(Θ_π)∩(−WF(W_π))=∅` before defining `W_π Θ_π`; for more than two factors use the full no-zero-sum criterion with zero covectors allowed in individual factors. Prove the scalar Feynman case by translation invariance of each intrinsic block (its covectors sum to zero within that block), the causal orientation of every interblock Feynman covector, and an extremal-time block in the resulting acyclic graph of distinct centres: a nonempty family of interblock covectors cannot have zero total covector at every block. For this Feynman remainder and its smooth/differential tensor operations, the same block-sum argument gives `WF(W_π)∩N*Δ_π=∅`; prove the restriction and normal-dilation continuity consequences, rather than a pointwise smoothness claim, to obtain the uniform normal scaling estimates. Choose neighborhoods and cones compact-locally so the argument survives the normal dilations and all required forest insertions. Derivatives and smooth tensor operations inherit the wavefront bound; every other declared propagator/insertion class needs its own admissibility proof or defined renormalized operation. Consume P8's fixed pullback/proper-support pushforward continuity and
product/tensor hypocontinuity in its normal topologies; verify the actual maps'
noncharacteristic, proper-support and cone conditions, and show that the
actual rescaled families are bounded in the declared controlled spaces. Derive the simultaneous nested-scale bounds, restriction
and normal-dilation compatibility and each insertion's scaling/wavefront
bound required by ControlledStageOperations, including all earlier local jet
terms. These lemmas verify the earlier parametric interface for the declared
graph-local systems; they do not import its completed stage family as data.

Construct the reference prescriptions and insertion adapters together in an
outer well-founded induction on decorated graphs, before embedding a block in
an ambient graph. Order nonidentity proper-block and contraction calls by the
lexicographic pair (number of internal edges, number of vertices), counting
self-loops as internal edges. Identity corollas are the specified maps, not
recursive calls. At Γ use only the already
constructed proper values R(γ_B), proper quotients R(Γ/γ) and their proved bounds
to verify ControlledStageOperations, including closure under the extension
outputs and earlier jets. Then apply ControlledKernelStages' finite partition
induction on V(Γ). At that step apply CommonOpenTensorData's conditional
componentwise realization to the verified 𝓛/𝓕 system. Prove the required
insertion bounds and perform the covariance and signed automorphism corrections
within that same outer step, before R(Γ) is used as proper input elsewhere.
No unfinished value or scaling/wavefront estimate at Γ is an input to its proof. Fix the vertex/tadpole data and the admissible distinct-point kernel first. After every proper block choice is fixed, prepare the intrinsic input off the total diagonal from all its proper partition-stage restrictions. In 𝓕 a bridgeless block without articulation receives a translation-invariant controlled relative-coordinate extension, while articulation/bridge/disconnected values are the declared products. In 𝓛 every connected bridgeless non-self-loop core, including an articulation block, receives a translation-invariant controlled extension of its full prepared input and a fresh bounded total-diagonal jet; bridge/disconnected values remain products. Do not replace that prepared input by a pure articulation product when lower 𝓛 union jets have changed. On proper data in 𝓕 select the compatible product as the articulation reference, so 𝓕 embeds in 𝓛. Then transport these intrinsic choices to each partition stage of each ambient graph, using the established simultaneous nested-sector estimates and interblock operation bounds. Prove extension existence in each class, compatibility of overlapping charts, preservation of all earlier strata and graph/field identities, and exhaustion of its changes by exactly its compatible free constant tensor families. In 𝓕 these families live on the bridgeless blocks without articulation; in 𝓛 they live on every connected bridgeless non-self-loop core after the prescribed tadpole operations. At the other blocks all changes are determined by the product/insertion recursion. Use independent generating decorations modulo the prescribed field/derivative relations; those relations are also required of the coefficient families.

Each reference choice, cutoff and allowed local change depends only on the decorated graph and its intrinsic relative coordinates. Transport by the actual RQFT5 graded graph-isomorphism action, impose finite automorphism equivariance with its Koszul signs, and prove representative independence. The allowed coefficient space C_γ is the finite-dimensional space of natural multilinear maps from the homogeneous input vertex tensor spaces to the nominally bounded total-diagonal delta-jet space, subject to the common spectator/field/derivative identities and signed automorphism constraints. Extend to inhomogeneous inputs componentwise; do not choose a tensor-value-dependent degree or unconstrained unrelated coordinates for padded root shapes. Its coefficients are constant after total-diagonal translation reduction; they may depend on masses, scale and scheme. Switching functions remain prescribed external factors. Construct insertion into the already renormalized `R(Γ/γ)` on this same signed tensor carrier and prove its scaling/wavefront compatibility. Extra edges of a non-saturated subgraph become self-loops and use the local tadpole operation, never a bare delta times an unresolved edge kernel. The generic partial-diagonal u_α(y) theorem remains separate: its tangential distributions are not all intrinsic graph-local changes.

For a standalone translation-invariant block use its total centre y and relative z. Translation invariance makes every wavefront covector have tangential component η=0, so its scaling-stable input cone has `Ξ_tan(ψ)=∅` and conormal landing at the total diagonal. Apply the actual radial-cutoff controlled extension theorem with cutoff depending only on z; it supplies an intrinsic translation-invariant extension with `WF(R)⊆WF(R_off)∪N*Δ`. Finite constant jets stay in this class. This does not force conormal landing or constant coefficients at generic partial diagonals, where other relative variables remain tangential. A Taylor-cutoff extension may be used instead only after its controlled wavefront and scaling bounds are separately proved.

Own the finite-jet connected Lorentz covariance adapter, consuming QF5's finite-dimensional Whitehead H¹ theorem and LieHighestWeight Layer5's native `TauCeti.exists_isCompl_of_isKilling` route, not reproving Whitehead here. Consume NoncompactQuantumSymmetry M0 item2's real `SL(2,ℂ)` and ordinary `SO₀(3,1)` LieGroup/connectedness/Killing interfaces, and LieGroups Layers2–3's closed-subgroup, automatic-smoothness, differentiation and connected-faithfulness interfaces. RQFT6 owns the remaining affine-target adapter: on the underlying finite-dimensional real C_γ identify `C_γ⋊GL_ℝ(C_γ)` with the closed subgroup `[[A,v],[0,1]]` of `GL_ℝ(C_γ⊕ℝ)`, realized after a real basis choice by native `Matrix.GeneralLinearGroup`; prove basis independence. Prove its closedness relative to GL, smooth group operations and `LeftInvariantDerivation` identification with the affine matrix Lie algebra; its representation on C_γ is the actual delta-jet/field-tensor action.

RQFT6 owns the bounded group/jet carrier transport into the native spacetime M. Consume RQFT0’s named time-first continuous linear reindexing `ι_M:EuclideanSpace ℝ (Fin 4)≃L[ℝ]((Fin 1⊕Fin 3)→ℝ)` and its +--- form identity. Transport the M0 ordinary group's action through ι_M and the covered action through its already-owned Hermitian cover. RQFT0's time-last P is the inverse of M0's single signed map, composed with this reindexing. The delta-jet action on C_γ and its differentiated real module must be proved to use exactly this transported group, with the cotangent/derivative action and η musical identifications. Consume M0's transported IsKilling instance on LeftInvariantDerivation itself; a matrix IsKilling instance alone does not supply the QF5 hypothesis.

Before computing a covariance defect, prove covariance of the selected stage0 kernels, vertex/self-loop/tadpole data and every proper intrinsic block and contraction map. For an intrinsic extension R_γ define `b_γ(g)=g·R_γ−R_γ`; its unchanged off-diagonal restriction makes it a permitted finite total-diagonal jet. Prove continuity in C_γ, the actual finite-dimensional real Lorentz module action ρ, and `b_γ(gh)=b_γ(g)+ρ(g)b_γ(h)`. The map `(b_γ,ρ)` is a continuous affine-group homomorphism, hence smooth by LieGroups2. Differentiate, apply QF5 H¹, and subtract `ρ(g)v_γ−v_γ`. The residual affine homomorphism and `(0,ρ)` have identical differential, so LieGroups3's connected-faithfulness theorem makes them equal. Thus R_γ−v_γ is covariant, with no π₁ assumption on an already given continuous group cocycle. Constant finite jets preserve the intrinsic controlled cone and scaling order. All graph transports and finite Aut(γ) averages use RQFT5's signed Koszul action; its commuting action on C_γ lets the averaged correction preserve graph equivariance. The closed-fermion-loop weight is carried once by the graph/insertion convention, not appended to each averaging summand.

For normalization constraints start with a nonempty invariant affine set A of extensions and a Lorentz-stable finite-dimensional real submodule `D⊆C_γ` parallel to A, with `g·R∈A` whenever R∈A. Prove `b_γ(g)∈D` and apply H¹ to D. Stability means a submodule, not the fixed-vector space `C_γ^G`; arbitrary vectors of D need not be invariant. Graph automorphisms and any additional symmetry averages must also preserve A and D. Inconsistent or nonstable constraints retain their obstruction. Parameter-regular corrections need a uniform construction and estimates, not only pointwise coboundaries. The tensor defect equations are illustrated by [Hollands–Wald, Lemma4.1, equations70–75](https://arxiv.org/html/gr-qc/0111108#S4.SS2); that theorem does not supply the graph-stage or insertion bounds, or vanishing of a Ward/gauge/dilation obstruction.

For a finite component group, first prove the actual chosen kernel/prescription class is invariant, including stage0 kernels, tadpoles and every proper block, with its exact linear or semilinear field/test transport and i0 phases. Average the G₀-covariant extension over component representatives in the underlying real affine space. Prove the residual correction lies in `D^{G₀}`, representative independence, full covariance and preservation of all proper restrictions and bounds. Antilinear actions are real-linear, so finite real averaging works when this invariance hypothesis holds. If T or another component exchanges Feynman with anti-Feynman, or advanced with retarded data, construct the enlarged covariant kernel system, its exact semilinear transport and its admissible stage0 or separately defined causal-extension operations before averaging. Retain those cases and their estimates; do not claim a single noninvariant kernel class is covariant. For QED parity fix signature +--- and the linear spinor lift `P=γ⁰`, `P²=1`, with spatial inversion and the induced vector/adjoint-spinor actions; prove preservation of the actual Feynman kernels, tadpoles and proper blocks before using its two-element average.

Relate geometric collision induction to the complete graph/forest class without identifying the two combinatorics. For the direct geometric adapter take connected saturated (vertex-induced, including every parallel edge between its vertices) subgraphs γ with `|V(γ)|≥2`, after the local self-loop prescription has been separated. Let π_γ have V(γ) as its only nonsingleton block. Prove `Δ_π∩Δ_ρ=Δ_(π∨ρ)`; joins encode intersections only. A forest retains its labeled inclusion/contraction order and its disjoint-component data. For vertex-nested/disjoint saturated forests carry the labeled family `{π_γ:γ∈F}` with its inclusion order and contraction data, not only its total join. Use multi-block joins only for vertex-disjoint siblings; a join over all δ⊆γ including γ equals π_γ and does not encode the nesting. Prove that proper vertex nesting increases collision codimension, that inner counterterms are applied before the containing extension in the contracted configuration, and that disjoint operations commute under the fixed compatible prescription. Overlapping/shared-vertex subgraphs and repeated vertex sets retain their separate graph labels and multiplicities; their joined diagonal does not supply a missing operation or erase the forest order. For the separate labelled momentum Taylor-expansion convention, compatible subgraphs are edge-nested or edge-disjoint, with graph labels, external structures and contractions retained; its edge-disjoint siblings may share vertices. This convention is not the cut convention for the universal H coproduct below; the class quotients use that same coproduct. In that coproduct ordinary connected edge components sharing a vertex merge; its iterated-cut/antipode forests therefore do not include two such arms as separate simultaneous cut components. Relate the Taylor expansion to it only through the proved typed regrouping and factorization relations. For the direct saturated geometric forest convention, require vertex-nesting or vertex-disjointness. Own the regrouping between these explicitly different conventions, including shared-vertex and equal-vertex-set cases through the full recursion, rather than treating their diagonal join as a forest. [Bergbauer–Brunetti–Kreimer, §§2,4,6](https://arxiv.org/html/0908.0633) gives the saturated/nested-set mechanism for massless Euclidean scalar graphs without self-loops with at most logarithmic divergences in its main construction. Its §6.4 discusses nonlogarithmic amplitudes and regulators. Prove the massive, higher-degree, tensor and Lorentzian adapters here, including the loss of homogeneous massive propagators; do not treat that discussion as a proof of these wider adapters.

Keep self-loops, arbitrary parallel edges, non-saturated divergent subgraphs and the declared momentum-space 1PI class in the Hopf/forest targets. A one-vertex self-loop has no new collision stratum. Specify its renormalized local vertex/tadpole tensor, derivative and scaling bounds as part of the prescription, and prove compatibility with graph isomorphisms, insertion and contraction. Wick-ordered vertices give the zero-tadpole normalization as a particular prescription; construct the finite local changes to other allowed normalizations. Never evaluate a singular propagator at zero or multiply `δ_Δ` by a remaining propagator singular on the same Δ without a separately defined renormalized operation. In particular use the three-parallel-edge sunset to prove that the two-edge 1PI bubble counterterm cannot be interpreted as the undefined product `δ(x₁−x₂)Δ_F(x₁−x₂)`; the direct position-space extension acts on the full saturated three-edge kernel.

Own the separate momentum-forest comparison for every declared graph class,
fixing regularized integrands, all field/jet structures, integer subtraction
orders, restricted points, infrared/switching conditions and Fourier conventions.
For every articulation union U of r≥2 arms occurring anywhere inside a forest,
remove the overall conservation delta and work on its reduced vertex-momentum
space before Taylor evaluation. Choose independent arm loop routings and retain
every nested inner Taylor operator before integration. Let b_i be the actual integer Taylor orders used
on its arms and b_U the actual union order, with T_b=0 for b<0 and
 a_i=max(b_i,−1). At a compatible joint Taylor point prove that the prepared
remainder R_i vanishes through a_i in its own external variables. Independent
variables and Leibniz give product vanishing through Σa_i+r−1. Thus the
unconditional sufficient criterion is

```
b_U ≤ Σ_i max(b_i,−1)+r−1.
```

If an external root factor has separately proved vanishing order at least v_ext
at that exact joint point, the stronger sufficient bound is
b_U≤v_ext+Σa_i+r−1. Its nominal polynomial degree d_ext alone does not
imply v_ext=d_ext at a nonzero subtraction point: q^d at q₀≠0 has
vanishing order0. Homogeneity at zero gives v_ext=d_ext. Keep all compatible
nonzero subtraction points and routings; no zero-point assumption is implicit.
For the standard nominal normal-Taylor scheme put
`b_i=floor(ω_i^nom−e_i)` and `b_U=floor(ω_U^nom−e_U)`, with no Taylor
operator when this integer is negative. On a homogeneous root-allocation component with
the full shared-root degree d_v retained in each of r arms, prove both

```
ω_U^nom=Σ_iω_i^nom−(r−1)d_v,
Σ_i e_i=e_U+(r−1)d_v.
```

Every root derivative internal to one arm is boundary to the other r−1
arms, and each external-root derivative is boundary to all r arms. Thus `ω_U^nom−e_U=Σ_i(ω_i^nom−e_i)`, and
`b_U≤Σ_i b_i+r−1≤Σ_i max(b_i,−1)+r−1`. For the required integer
Euclidean degrees this sharpens to `b_U=Σ_i b_i`. In either case the
unconditional displayed product-vanishing bound applies. In the allocated-root convention a common external root factor
is removed from both nominal and boundary counts, giving the same identity.
Prove these componentwise identities with all nested residue allocations.
For oversubtracted or cancellation-improved schemes use the actual chosen
b's in the displayed criterion; a root polynomial degree gives additional
vanishing only when proved at the actual subtraction point.

Prove it on every tensor component at every inner/outer forest occurrence,
including derivatives on root external ports, before loop integration. Fixed
contractions and graded signs preserve the vanishing. Oversubtraction is not
automatic: R₁=x,R₂=y already survives an order2 joint Taylor operator. A
non-Taylor/tensor-projected scheme or incompatible restricted points needs its
own exact annihilation calculation. Positive-mass Euclidean zero momentum is a
common smooth point; massless/Lorentzian schemes retain their infrared and
analyticity hypotheses. Bridges remain geometric products outside the 1PI
subtraction class.

For compatible schemes prove the full 1PI forest sum, including non-saturated, overlapping, shared-vertex and repeated-vertex-set subgraphs and local tadpole insertions, recombines into a 𝓕 prescription up to a counterterm character preserving its product constraints. For every other admissible momentum scheme construct its coefficients recursively in the explicitly defined larger class 𝓛: an incompatible articulation projection can contribute `−T_U(R₁R₂)`, a scheme-determined bounded local jet at that connected bridgeless block. If γ is any connected spanning 1PI subgraph on B, then the induced Γ[B] is bridgeless because each old edge lies on a cycle and each added edge joins vertices already connected in γ. It may retain an articulation vertex: adding a parallel edge inside one arm of two vertex-joined bubbles does so. Thus its contribution is absorbed by the same allowed 𝓛 coefficient space at Γ[B], through the defined contracted-graph/tadpole insertion and the proved degree bound, whether or not Γ[B] has an articulation. Prove the intrinsic regrouping and degree/decoration compatibility. For the 𝓕 comparison prove separately that the compatible jet identities and complete forest regrouping force its articulation coefficients to be the product-determined ones; do not infer this from a false induced-2-connectedness assertion.

**RQFT6.DiagonalAnnihilator — the constant-operator quotient.**

For M=ℝ⁴ and r≥1 let δ_Δ be integration over the full diagonal in M^r
with the fixed density. In `Sym(⊕_(i=1)^r M)` write
`D_(i,a)=∂_(x_i^a)` and `S_a=Σ_iD_(i,a)`. Prove
`Ann(δ_Δ)=⟨S_0,S_1,S_2,S_3⟩`. A barycentric tangent/relative linear
change proves this: tangent derivatives integrate to zero on compact tests,
whereas distinct normal delta derivatives have independent Fourier
polynomials. Include r=1; the empty graph has its separate normalized
identity. Tensor with the actual open coefficient spaces and impose the
declared formal relations. Numerical tensor evaluation supplies no extra
universal operator relation. The canonical normal representative uses
`D_i↦D_i−r⁻¹Σ_jD_j`. This lemma owns the diagonal-annihilator calculation;
it requires neither a raw action nor a comparison theorem.

**RQFT6.TypedJetImage — kernel-level local jets and complete auxiliary testing.**

Work first over k=ℝ orℂ at a fixed finite field/port/fibre list, finite exterior coefficient stage and finite total differential order N. Consume RQFT5.FiniteOddPolarization, including its injective extension to larger fresh-generator stages. Keep the original incidence and every individual physical halfedge, field, coefficient and source/profile jet. Let T_c be the declared formal polarized coefficient/port-tensor space at physical boundary allocation c, of order e_c; impose its already declared graded tensor relations, not numerical coupling evaluation or equations of motion unless separately specified.

At **every original graph vertex and every vertex of every contracted residue graph**, test the output kernel on an independent auxiliary Φ∈𝒟(M^V). These are universal smooth compact output tests, even when the graph has no physical switching or external profile. They are independent of the physical field/test/source/switching profiles and remain available at residue vertices and one-vertex corollas. Their derivatives are distributional dual testing; they are not extra graph fields, port allocations or contributions to e_c. Use arbitrary full-configuration Φ throughout. Products of one independent compact test per vertex can also separate the finite local jet family, by the finite interpolation argument below; no unowned general kernel theorem is needed for that assertion. Integration to the empty configuration or a local-functional Div quotient is a separate later operation, not this definition.

For r=|V|≥1 choose a fixed linear diagonal/normal splitting x↔(y,z), with y on Δ and z normal, and use the actual transported density for δ_Δ. A root splitting y=x_root,z_i=x_i−x_root has Jacobian1 and δ_Δ=dy⊗δ₀(z) with physical diagonal Haar dy. Compare it with the barycentric splitting and the fixed normal polynomial space P_Γ by RQFT0’s actual linear coordinate/density map. For Y=r^(−1/2)Σ_vx_v and q in the orthogonal complement, dx=dY dvol_Q whereas physical diagonal dy=r^(−d/2)dY (d=4 here); hence the scalar bare diagonal delta is r^(−d/2)δ_Q(q) relative to that ambient product density. Retain this same factor and the dual normal derivative matrix when changing frames. In such a fixed splitting define the canonical local kernel by

```
K_(β,t)(u;Φ)=(-1)^|β| ∫_M C_t(j u(y)) (∂_z^β Φ)(y,0) dy.
𝒥_Γ^(≤N)=⊕_(c,b≥0,b+e_c≤N) T_c⊗Pol^b(P_Γ).
```

The index β here labels D_z^β=∂_z^β. On the complexified RQFT0 angular-frequency Fourier side, `𝓕(D_z^βδ)=(ip_z)^β`; a physical p_z^β monomial therefore uses `i^(−|β|)D_z^βδ`. Include the actual linear normal-coordinate and density maps, and use RQFT0’s p=2πξ conversion for native frequency ξ. These scalar conventions do not change q, and are part of coefficient extraction rather than new slot identifications.

Here u denotes independently polarized **physical** profiles, C_t is the formal coefficient/port contraction evaluated on their declared jets, and β is the normal delta-derivative index. The intrinsic carrier is the resulting distribution-valued multilinear kernel, with its formal slots unevaluated; the displayed coordinates are its normal form. There is no quotient by integrated physical total divergences. In particular r=1 has P_Γ=0 but retains all formal coefficient/field jets; r=0 is the separate normalized empty unit. Arbitrary physical specialization is a later map and may have an extra kernel.

Define the complete ordered slot presentation
`𝒫_Γ=⊕_c T_c⊗Sym(⊕_(v∈VΓ) M)`, using every declared physical coefficient/port-jet allocation c, its original vertex incidence and its formal tensor/Koszul relations. Its order≤N part has e_c plus operator degree≤N. Realize `t⊗P` by `C_t(j u(x))·P(D)δ_Δ`, with P applied to the bare diagonal delta **before** multiplication by that smooth off-diagonal coefficient. Each physical jet is evaluated at its own original vertex. General differential words first enter this ordered presentation by the full Leibniz/transpose identities; normal forms lie in the distinct carrier 𝒥_Γ. The auxiliary Φ remains arbitrary. In particular neither 𝒫 nor 𝒥 is an integrated local-functional quotient.

Own the complete presentation-to-normal-form theorem from 𝒫_Γ to 𝒥_Γ. For any smooth off-diagonal physical multiplier F and finite normal multi-index β prove, by differentiation against smooth Φ,

```
F(y,z) ∂_z^βδ(z)
 = Σ_(α≤β) (-1)^|α| binom(β,α)
       (∂_z^αF)(y,0) ∂_z^(β−α)δ(z).
```

Expand each derivative of F into its actual individual-slot allocations and retain all Koszul transport. Thus normalization changes coefficient jets as well as normal order, preserving q=b+e_c. Do not identify an individual D_s with the total vertex momentum or define T_(c+κ)→T_c. The elementary DiagonalAnnihilator theorem concerns constant operators on the **bare** δ_Δ. A tangential derivative of a normalized coefficient kernel is `D_y(a_β(y)∂_z^βδ)=(D_ya_β)(y)∂_z^βδ`, generally nonzero. The full derivative-module Leibniz/transpose identities retain this term and the derivative of Φ. The raw Ann(δ_Δ) relation must never be applied to the complete a_β(y)δ as though a_β were constant.

Use commuting symmetric partial-jet indices, the stated formal tensor/Koszul relations, bare-delta annihilator/conservation and these complete product/transpose rules as the presentation relations. Prove they normalize every element of 𝒫_Γ to the displayed form and are its exact universal kernel. To prove uniqueness, prescribe the finite normal jets of Φ at z=0 independently, using z^β/β! times a cutoff equal1 near0 and an arbitrary compact smooth ψ(y). The compact-test fundamental lemma recovers each smooth coefficient at every y. Polynomial-times-bump interpolation prescribes the physical profile jets at that y, and FiniteOddPolarization then separates every formal coefficient tensor. This proves the canonical comparison with Pol(P_Γ)⊗the full formal port/jet spaces, rather than defining an unspecified image quotient. A zero finite Taylor matrix is a zero universal kernel because ψ is still arbitrary. Evaluating a recovered smooth coefficient at y is a formal jet/coefficient evaluation; **no δ_y is inserted as an input test**, and no singular distribution product occurs.

Construct the finite matrix from these actual differentiation/chain/product rules on smooth jets, keeping auxiliary normal/tangent test indices separate from physical q. Translation covariance allows the common smooth-jet calculation at0 only after translating all universal profiles and Φ; a fixed noninvariant physical profile is not itself translation invariant. Prove that changing the chosen root/normal splitting has the corresponding triangular coefficient-jet/density transition map, and that these maps compose, preserve q and recover the same intrinsic kernel. This also owns graph relabeling/root independence; it is not a choice of a lift from an integrated quotient.

At a finite base-field stage the graded dual and coevaluation of 𝒥 are canonical. Only afterward extend scalars by the chosen graded commutative coefficient algebra, using flatness over k. Nominal restriction is the actual direct sum b+e_c≤ω_Γ^nom, so it is CommonOpenTensorData’s declared J^nom without counting auxiliary testing twice. Every full-cut corolla is the actual normal-form distribution with its independent output test; it requires no presentation lift. Keep the larger all-degree carrier, every port type and all graphs before the separately proved nominal/class/Ward/fixed-tad and physical specialization constraints.

**RQFT6.KernelCutTransport — kernel-level flags and dual transport.**

For every cut and every nested flag retain arbitrary auxiliary output tests on each original and residue configuration. Form the finite transport on smooth test jets by the actual diagonal pullback, residue-slot substitution, full primitive derivative coproduct and the preceding normal-form multiplication formula. Include every original field/test/coefficient slot, uncut internal endpoint numerator and its derivative. The quotient variable at a contracted block has derivative equal to the sum over its original vertices under diagonal pullback; dually the Fourier block map is `(a_*p)_B=Σ_(v∈B)p_v`. Neither identity identifies each individual physical slot derivative with that sum. Prove the normal-form transition matrices, including both input-residue q and output q, agree on both sides of every nested flag; actual smooth diagonal substitutions compose, and the normal-form theorem is faithful. This proves transport on the intrinsic kernel carrier before its coideal/completion consequences. Define an iterated local insertion as the transpose of these finite smooth-jet maps followed by the single appropriate combined-diagonal pushforward; do not multiply arbitrary singular distributions. Actual insertion into a singular uncut graph kernel is the separate analytic consumer below.

Use the canonical graded dual/coeval of the **whole kernel normal form** for scalar coefficient extraction. Field/tensor and physical coefficient jets are recovered once, then inserted by the proved typed map. All negative normal-index extractions vanish and all boundary allocations are summed with their actual chain-rule coefficients. The separate input-residue degree includes both internal and external allocations, while only the actual physical external allocation contributes to output e_c. Prove output-q preservation using these actual matrices. TypedHopf consumes this transport for its two nominal coideal weight cases, completed coaction and antipode proofs; ClassQuotients consumes it for the class-ideal proofs. These later consumers own those consequences. Integrated Div and local-functional descent occur only in ConnectedSubstitution; they are not relations in this kernel-level character algebra.

**RQFT6.TypedHopf — the universal natural typed extraction–contraction algebra.** Compare [Connes–Kreimer §2, Eq6 and Theorem1](https://arxiv.org/html/hep-th/9912092) and [van Suijlekom §§2,4](https://arxiv.org/html/0807.0999) for the scalar/external-structure and typed coaction routes; the typed field/jet construction is owned here; the momentum-regulator continuation, forest-convergence and Taylor-scheme analytic adapters have their later separate owners. Fix the following Connes–Kreimer convention, independently of a chosen Taylor forest expansion. A cut is an internal-edge subset E′⊆E(Γ); take its ordinary graph connected components, with all incident vertices. Admissibility is purely graph-theoretic: every nonempty component is connected bridgeless/1PI with positive loop number. No field/residue whitelist removes a cut; convergence or a zero allowed local space enters through J_γ=0 and its empty coordinate sum only. Components sharing a vertex are one component, not two members of a cut. Thus the full edge set of a vertex-joined pair is its connected union once; do not add a separate product of its two arms for that same edge set. Distinct edge subsets, graph embeddings, external halfedges and residue choices retain their multiplicities. Non-saturated cuts and equal-vertex-set cuts remain. Local self-loop graphs are included as positive-loop graphs with the separately declared tadpole data; a residue corolla has loop degree0 and is an identity slot, not another free generator.

Use RQFT5's actual graded field/halfedge and derivative decorations. For each graph γ and ordered external field-port type c, use the already defined reduced vertex-momentum space P_γ, the finite-dimensional graded field-tensor port space T_c, and `J_(γ,c)=J_(γ,c)^nom=T_c⊗Pol_(≤N_γ^nom−e_(γ,c))(P_γ)`, with the homogeneous type-level count and formal decoration relations. The external-port type records its homogeneous boundary derivative allocation and indexes the tensor factor; its total local-symbol degree is q=deg_Pβ+e_(γ,c). It does not replace the vertex-relative normal space. Individual-port derivative slots and the original port-to-vertex incidence remain part of insertion. This definition is independent of actual numerator cancellations. TypedJetImage identifies the nominal pieces with actual kernel normal forms in 𝒥_Γ. External structures are elements of its whole graded dual, equivalently compatible functionals on 𝒫_γ modulo the proved kernel of its realization. Evaluation against its finite-dimensional coevaluation extracts scalar coefficients; auxiliary output testing is not part of c or e_c. Retain all mass, kinetic, derivative and tensor structures, including distinct two-point local residues. Represent two-point residues as typed local corollas; comparing an edge-residue convention requires its explicit contraction adapter. Do not identify all two-point residues or replace tensor entries by a scalar graph name.

The sign grading is RQFT5’s field/Grassmann parity, not loop number; parity-even counterterm coordinates commute at every loop degree. For homogeneous inputs the scalar coordinate has parity `|x_(γ,λ)(t_v)|=|λ|+Σ_v|t_v|` modulo2, since the open kernel and coevaluation are even. Propagator pairings and the once-included closed-loop Wick weight add no second sign grading. Construct the graded commutative scalar-coordinate algebra H generated by coordinates `x_(γ,λ)`, linear in the external functional λ and multilinear in every input vertex tensor, for each positive-loop connected 1PI graph and every allowed local output coordinate. Define H on the common open-kernel multilinear/spectator-natural carrier: quotient the free graded commutative scalar coordinates by those actual wiring/naturality and formal linear field/derivative/isomorphism relations after proving extraction–contraction compatibility. If an external map lies outside a cut it stays on the quotient; inside a cut it transports to that component’s external functional; at a boundary use the graded coevaluation identity `(f⊗id)coev=(id⊗f*)coev`. Thus the naturality relations are a coideal and their zero-degree tensor identities survive the counit; the antipode preserves them by connected induction. All open-root and spectator coordinates are already defined by these relations, rather than being independent generators. At a zero-loop residue basis vector j_β define `x_(res_β,λ)=λ(j_β)·1`; no independent residue parameter is added. The empty cut and full cut therefore give exactly `1⊗x_(Γ,λ)` and `x_(Γ,λ)⊗1`, respectively, after the residue coevaluation identity; there is no additional residue-unit generator or duplicate full-cut term. For a homogeneous basis j_β of the cut component's whole kernel normal-form carrier 𝒥 and its dual (restricted to the nominal subspace after the degree theorem below), the coproduct is

```
Δ x_(Γ,λ)
 = Σ_(admissible edge cuts E′, residue indices β_i)
       (Π_i x_(γ_i,β_i)) ⊗ x_(Γ/E′[j_(β_i)],λ).
```

Consume RQFT5.GraphCutFlags for the underlying simultaneous edge contraction, retention of unchosen edges and ports, nested edge-subset flag bijection and the rule that extra parallel edges become self-loops. Own the typed admissibility theorem before using this coproduct: contracting connected edge components to their typed residues retains every derivative slot and local vertex; a residual edge of a connected bridgeless graph lies on a cycle or becomes a self-loop, so the quotient is again bridgeless or the degree0 residue. Prove loop-number additivity. Lift GraphCutFlags’ graph-level flag bijection to the actual external-port and residue-slot data, including a contracted block inside a later connected component. The local insertion maps compose associatively: derivatives obey the full multinomial Leibniz coproduct, vertex tensors are used once, and tensor permutations carry exactly the Koszul signs. This identifies the residue-index sums on both flags and proves typed coassociativity and the coaction below, including nested, overlap, shared-vertex and repeated-vertex-set situations. Overlapping sets are alternative cuts, not simultaneous overlapping components.

Verify closure for the nominal jet spaces and every formal field/derivative relation, rather than deleting a residue type. Consume the homogeneous insertion identity with `deg(j_β)=q_β=deg_Pβ+e_(γ,c)`, including the complete residue field/port dimensions. The inequality q_β≤ω_γ^nom gives the nominal landing bound, and the actual Cauchy–Leibniz boundary transport preserves the total output degree. Prove its multi-component and nested versions. Actual scaling improvements and extra symmetry/normalization constraints have their separately proved stable coefficient equations; their vanishing is not a new cut rule. Consume CommonOpenTensorData and ControlledKernelStages and prove their scaling/controlled-WF insertion estimates apply to all these nominally allowed jets.

For finite computations use the sub-Hopf algebra generated by all generators of loop degree≤n, retaining all of their residue types and nominal jet coordinates; its products may have higher loop degree. More economically, start with finitely many fully decorated graphs and include their finite closure under cuts, contractions and allowed finite-dimensional nominal residue bases; prove the generated algebra is Hopf and suffices for those coefficient computations. The vector-space cutoff killing all elements of loop degree>n is not generally a coideal. Nor is an arbitrary global jet/arity cutoff automatically Hopf: a primitive y gives Δ(y²)=y²⊗1+2y⊗y+1⊗y². A proposed jet quotient must supply an actual ideal stable under Δ, counit, antipode and typed insertion, with its exact residue bounds; prove these conditions before using it. The graphwise finite nominal J spaces and their proved bounded contraction transports already give the required finite jet sums without that false universal truncation assertion. Pass to the full compatible field/derivative filtration without dropping arities.

A concrete compatible jet quotient is the graphwise total-degree nominal
one. Begin with the free homogeneous decorated scalar symbols carrying
all b≥0 normal jets and every allowed port type c: these are coordinates dual to homogeneous bases of 𝒥_γ, whose comparison with 𝒫_γ already imposes the exact kernel-level presentation relations. Do not quotient these normal-form basis symbols by presentation relations a second time. Impose the later coefficient-natural, nominal/class and physical constraints only at their proved stages. No integrated Div relation is imposed here. Put q=b+e_(γ,c) on each output
coordinate. The all-degree typed edge-cut/coevaluation construction uses
these total degrees on extracted residues and transports the final output
functional by the complete Leibniz coefficient map just proved.

For loop degree L and auxiliary weight `w=Σ_vd_v+q`, retain algebraic finite
graph support in each (L,w) piece and complete in w; complete in L as well
when formal perturbative series are used. On a proper multicut with positive-
loop quotient the total tensor weight is exactly
`w_total=w+2Σ_i q_i`: each inserted total residue degree occurs once as
an extracted output and once as a quotient input. A bounded target weight
therefore bounds all normal degrees and port allocations in that cut.
Each fixed graph has finitely many edge cuts and finite-dimensional
homogeneous symbol spaces at every bounded degree. Full/identity cuts match
symbol degrees by dual evaluation; nested identity slots add no free index.
Prove the resulting coefficientwise finiteness, continuous multiplication,
completed coproduct and coaction, flag coassociativity and continuous
connected loop-order antipode. Retain the residue slot degree on the
coaction carrier, so its full-cut sum has the same increasing weight.

Let I_nom be the closed ideal generated by output coordinates with
`q>ω_Γ^nom`. In a cut term, either some `q_i>ω_(γ_i)^nom` puts a left
factor in I_nom, or the insertion identity gives
`ω_quot^nom=ω_Γ^nom−Σ_iω_(γ_i)^nom+Σ_iq_i≤ω_Γ^nom<q`,
so the degree-preserving transported right coordinate lies in I_nom.
For a full/identity cut use the matched total degree. This proves the
coideal property on every homogeneous coefficient. The counit vanishes
on I_nom, and continuous connected recursion proves antipode stability.
The quotient's polynomial finite-symbol part is exactly the finite
J_(γ,c)^nom algebra and its finite-sum coaction.

After obtaining these finite graphwise nominal sums, impose the common
formal wiring/naturality relations by the proved extraction–contraction
compatibility. Boundary derivative naturality shifts ω and q together, so
it preserves nominal excess q−ω and budget ω−q. The auxiliary weight may
shift; this step uses finite coefficients rather than a continuity claim
for the degree-shifting relation on the auxiliary completion. Each other
formal identity must satisfy the same homogeneous typed compatibility;
Ward/contact equations retain their separately specified affine constraints.

The counit is0 on positive-loop generators and1 on the empty graph; extend the disjoint-union product multiplicatively. Positive loop grading makes the bialgebra connected. Thus the reduced coproduct has strictly smaller positive loop degrees, and

```
S(x)=−x−Σ S(x′)x″
```

is a finite recursive formula in each degree. Prove both antipode identities by induction. In the coupling-stripped scalar unit-root specialization below, the two-arm coproduct has no separate ab⊗1 term, since the full edge cut is its connected union once. H retains independent articulation coordinates until the exact class-preserving quotient is proved.

Let 𝒢 be the linear graded carrier of all actual typed graphs with the already defined coevaluation/open external/root ports and local residue symbols, including bridged/disconnected graphs and degree0 identity slots, modulo the common formal naturality relations. Define its left H-coaction by the same edge-cut sum, with the right term the actual contracted graph. The typed flags and naturality prove `(Δ⊗id)ρ=(id⊗ρ)ρ` and the counit law. Put `Z_χ=(χ⊗id)ρ`; then `Z_ψ Z_χ=Z_(χ⋆ψ)` for `χ⋆ψ=m_A(χ⊗ψ)Δ`. Evaluation gives the left action `χ·R=R∘Z_χ`, so `(χ⋆ψ)·R=χ·(ψ·R)` and the inverse is χ∘S. This universal natural action has not yet been asserted to preserve 𝓛: its already prescribed self-loop insertions require the tadpole quotient below. The analytic class action, comparison/transitivity and fixed-data stabilizer are proved only after those exact ideals are constructed.

**RQFT6.InsertionDerivativeDescent.Kernel — derivative-natural kernel insertion.**

This generic unintegrated/kernel construction consumes no RegulatorContinuation, ForestConvergence or TaylorAdapter theorem. Consume the earlier RQFT5.BalancedJetModule and KernelCutTransport. For a **given** raw analytic kernel family, derivative-naturality is an explicit hypothesis at every contracted vertex: the total incidence action of RQFT5, including physical coefficient/profile jets, obeys `F(D_(v,μ)·Γ)=∂_(x_v^μ)F(Γ)` as distributions against all smooth output tests. Prove that this hypothesis and its corresponding residue/proper-block insertion identities imply the derivative-natural insertion/descent conclusion, using the full primitive coproduct and formal transpose.

Separately own the **construction** for universal prescriptions in the declared controlled class. Construct extensions on the balanced inputs, then prolong by total D through the stated module comparison. Prove independence of the actual field/graph presentation, proper-block compatibility, and retention of the controlled scaling/WF and class/tadpole bounds. This construction supplies derivative-natural universal prescriptions before the typed quotient comparison; it is not an inference from an arbitrary raw family's coefficients. Numerical/EOM/Ward constraints retain their actual compatibility hypotheses. Raw families without derivative-naturality keep CourseRawComparison's larger-map action and are not silently discarded. The later TaylorAdapter must prove this hypothesis for its actual port-factored momentum realization; it supplies no premise of Core.

**RQFT6.InsertionDerivativeDescent.Fourier — conservation and conditional internal integration.**

In momentum space prove the exact Fourier conservation/derivative adapter before normal Taylor extraction and insertion. For a constant formal bare-delta coefficient kernel, conservation is Σ_vp_v=0 in RQFT0's angular-frequency convention and D has multiplier ip. After evaluating physical profiles their frequencies are independent: a mode exp(iΣ_s⟨k_s,x_(v(s))⟩) shifts that delta to `(2π)^dδ(Σ_vp_v−Σ_sk_s)` and hence its support to Σ_vp_v=Σ_sk_s. Total derivative and convolution must retain all these frequencies and the chosen outward-flow signs. Do not impose bare conservation on a fixed nontranslation-invariant physical profile or turn an uncut internal numerator into an external normal momentum. For an actual momentum-integral realization, require absolute integrability of every required differentiated integrand after the declared compact/Schwartz test pairings, with locally uniform parameter majorants jointly integrable in loop variables and every retained physical-profile frequency that is integrated. Require all loop-cutoff boundary terms to vanish. Specified finite Schwartz-seminorm bounds may supply this domination only after proving the resulting packet-weighted frequency integrals finite. For a proper-support position-space realization use P8’s transpose on compact tests and its actual properness hypothesis instead. Prove under these precise hypotheses that the derivative-module/IBP relations descend through the corresponding internal operation. The Kernel target supplies the generic Core reduction. TaylorAdapter later verifies these conditional internal-integration hypotheses for its actual momentum realization, consuming RegulatorContinuation’s convergence/continuation estimates. RegulatorContinuation alone is not claimed to prove the internal IBP/boundary or Taylor-scheme derivative-naturality conclusion, and this Fourier target does not construct or presume continuation. Pointwise scalar conservation alone supplies no such descent.

**RQFT6.ClassQuotients — rooted defects, tadpoles and factorization.**

Consume CommonOpenTensorData, TotalDegreeInsertion, KernelCutTransport
and TypedHopf for the common coevaluation-root carrier, the actual 𝓛/𝓕
operation classes and tadpole cut-regrouping laws, and their algebraic transports. For analytic class preservation consume ControlledKernelStages and InsertionDerivativeDescent.Kernel. A rooted join m_t of
r arms includes zero-loop pure-port arms, identity corollas, every residual
port arity and every allowed homogeneous derivative allocation. Its independent
block-relative variables are identified by the block-cut-tree linear map.
Take the exterior tensor product there and close the root at one t. Distribute
the root differential polynomial once by its full multinomial coproduct,
including terms on external root ports; the allocated arm derivative degree
sums to at most the root degree. The operation is not disjoint union in H,
not multiplication on unresolved shared variables, and not evaluation of t
separately in each arm. Naturality supplies all pure-port padding and partial
root slots. Retain nullary identity/local slots as well: degree0 slots are
fixed identities, while positive-loop one-vertex tadpole slots are parameters
under the variable-data action and become fixed only in the I_1v quotient.
Do not include their fixed-value defects in I_tad when the data are variable. Prove composition/associativity and the finite nominal jet inclusion
on this actual wiring carrier, using the Leibniz rule and RQFT5 braiding.

Write j_χ(C) for the extracted local jet, and define

```
D_t(χ)=Z_χ m_t−m_t(⊗_i Z_χ),
d_t,C(χ)= the coefficient of the identity-corolla output in
          D_t(χ)(C₁,…,C_r).
```

Here C is the rooted union of its positive-loop pieces C_i with pure-port
padding in the other arms. Explicitly d_t,C is j_χ(C) minus the single-root
jet insertion of the j_χ(C_i), with identity jets in the pure-port slots.
For zero or one positive-loop arm it is identically0 in the natural coordinate
algebra. In particular it is not a relation equating unrelated generators of
padded and unpadded no-articulation graphs.

Prove the elementary-defect factorization by expanding the actual cuts. For a
cut F in a joined graph, let B run through its components missing the root,
and let C_i be its component at the root in arm i, or the pure-port identity
if there is none. The union of the nonempty C_i is the one root component C.
Matching the left cut with the right arm cuts gives

```
D_t(χ)(Γ₁,…,Γ_r)
 = Σ_F (Π_(B missing root) j_χ(B))
       · insertion_(Γ/F)[d_t,C(χ)].
```

The residue indices, local tensor contractions and Koszul permutations are
part of each term; the dot denotes those typed coefficient insertions, not a
matrix-character product. Cuts not meeting the root cancel. A single root arm
cancels by spectator naturality. Conversely every d_t,C occurs as the top
corolla coefficient of this identity on its actual C_i and pure-port padding:
a proper cut of a bridgeless C leaves a positive-loop quotient, whereas its
full cut gives the identity corolla. This proves that the elementary corolla
defects generate exactly the coefficients of all universal rooted defects.

Let I_tad be generated by the elementary corolla defects for the following
rooted operations, at every original or contracted root and with every
allowed port/derivative allocation. Take all the one-vertex positive-loop
self-loop arms at that root and **one whole remaining rooted graph arm** S.
The latter may have arbitrarily many articulation blocks and is not split
into their separate arms. It may also be a pure-port identity. Include the
multi-self-loop composition operations, residual arities and common formal
field/derivative relations. If contraction creates additional self-loops at
the root, separate those arms and keep their complete remaining graph as
one arm again. Prove compatibility of this regrouping with the open tensor
wiring and with local tadpole composition. No fixed-value defect is imposed
on variable tadpole data.

In the scalar unit-root specialization the defining relation is
`x_(tS)=x_t x_S`; for the whole remainder S=ab it is `x_tab=x_t x_ab`.
Multiple tadpole arms factor through their coherent local operations,
while the whole residual x_S retains the larger class's articulation
freedom. After this grouped self-loop separation, let I_art be generated
by rooted articulation joins with at least two positive-loop non-self-loop
arms. Identity/pure-port arms remain permitted contexts. Self-loop arms
are already governed by I_tad and are not counted as these two arms. The two algebras are

```
H_𝓛=H/I_tad,       H_𝓕=H/(I_tad+I_art).
```

The elementary factorization above applies to each selected operation.
Prove Hopf stability using the exact identities

```
D_t(χ⋆ψ)=Z_ψD_t(χ)+D_t(ψ)(⊗Z_χ),
D_t(1)=0,
D_t(χ⁻¹)=−Z_(χ⁻¹)D_t(χ)(⊗Z_(χ⁻¹)).
```

When an extracted tadpole arm becomes an identity corolla, the second
summand has at most the **one whole remaining graph arm**, so its defect
vanishes by spectator naturality. It does not expose separate free
articulation arms. A cut may create new root self-loops; the stated
regrouping keeps the operation in the same generating family. Use the
elementary corolla converse to prove ΔI⊆I⊗H+H⊗I, εI=0 and SI⊆I for
I_tad and I_tad+I_art, without assuming closure in advance. The quotient H_𝓛 retains the residual articulation coordinate x_ab independently of x_ax_b, including its tadpole-decorated contexts.

Prove the rooted identities consumed by Core's comparison induction for
this same operation family. At a finite loop bound L take two realized
prescriptions and provisional typed multiplicative comparison coefficients
matching χ·R₁ with R₂ on all decorated graphs of loop order at most L in the
finite cut-closure of the joined graph under consideration, with the common
normalization/spectator/derivative relations; their construction is not an
input from Core. The two 𝓛 identities imply the tadpole-versus-whole-remainder
factorization, and the top corolla defect vanishes when the lower-loop
elementary defects vanish. The 𝓕 identities give the analogous I_art relation.
These are conditional rooted lemmas for provisional data; Core later
constructs the actual comparison coefficients and applies them. Algebraic
triangular elimination removes precisely the fresh
self-loop-decorated coordinates and, only in 𝓕, the remaining articulation
coordinates. Prove confluence by the block-cut tree, the grouped tadpole
composition equations and open wiring associativity, including every
contracted ambient root. It must leave arbitrary allowed no-self-loop
articulation jets in 𝓛. Fixed tadpole data additionally use the unchanged
I_1v quotient; zero and compatible nonzero data are both retained.

For fixed tadpole data additionally impose I_1v, the coordinates of every
positive-loop one-vertex graph. It is a Hopf ideal: each term of its edge-cut
coproduct has a positive-loop one-vertex coordinate in at least one factor;
its corolla terms give the same conclusion. Sum it with the relevant ideal
above. Characters of these further quotients are comparison transformations
fixing the chosen tadpole data, so their one-vertex coordinates are0; they are
not characters whose coordinates equal the prescribed tadpole values.
For provisional comparison coefficients matching two prescriptions with
the same tadpole data, the rooted one-vertex identity has only proper
one-vertex terms and the top identity-corolla jet. If the proper coefficients
vanish, its injectivity forces the remaining one-vertex coordinate to0.
For a given character χ such that χ·R has R's fixed tadpole data,
ClassQuotients proves by induction on one-vertex loop order, using this lemma,
that every positive-loop one-vertex coordinate of χ vanishes. Conversely,
vanishing of those coordinates makes Z_χ the identity on every one-vertex graph
by that induction. This identifies the fixed-data stabilizer with the stated
Hopf quotient, including nonzero fixed data, without a construction from Core.
Core subsequently applies the conditional lemma to its constructed comparisons.

Only Char(H_𝓛,A), or its fixed-tad quotient, is asserted to act on 𝓛, and
only Char(H_𝓕,A), or its fixed-tad quotient, on 𝓕. The raw Char(H,A) action
on the universal natural graph carrier can violate the already separated
self-loop identity and is not an action on 𝓛. Prove preservation of the exact
stage/prepared-input, local jet, scaling, WF, causal-away-from-collision,
bridge/disconnected and tadpole axioms by the stated quotient action and
the intrinsic analytic insertion theorem. Variable local tadpole data are
transported with their prescribed operations; preservation means the causal
factorization axiom with those transported data, not unchanged numerical
amplitudes on every distinct-point graph. The inverse character supplies
the reverse comparison. The following rooted lemmas supply the class
identities for RQFT6.DiagonalStabilizer.Core, which alone owns reduction, lifting,
the effective kernel and unique universal comparison; specialized evaluation
retains its actual additional stabilizers.

For Core's comparison induction, prove the following conditional rooted
lemma on the provisional finite-loop comparison data just specified. For
each grouped tadpole operation, and each articulation operation in 𝓕, the
difference of the two realized prescriptions' rooted identities is the
displayed elementary factorization. Assume the lower-loop elementary
defects vanish. Evaluate its remaining
top coefficient only at the identity-corolla output, where the map from the
open relative delta-jet tensor to its distribution is injective modulo the
formal relations. Do not evaluate a residual-loop amplitude, or close the
ports with a possibly zero/symmetric tadpole tensor to claim injectivity.
Pure-port arms retain every component before numerical coupling evaluation.
Core then applies these rooted lemmas in its own induction to prove that
its comparison character annihilates I_tad between 𝓛 prescriptions and
also I_art between 𝓕 prescriptions.
Specialized numerical couplings retain their evaluation kernels.

Verify exhaustion and absence of hidden no-articulation constraints by
triangular rooted reduction: each selected grouped-tadpole or non-self-loop multi-arm articulation relation has its joined
graph coordinate with coefficient1; its other entries are lower-loop arm
coordinates and the root tensor occurs once. Tadpole relations remove fresh
self-loop-decorated coordinates; articulation relations remove the remaining
joined coordinates. The block-cut tree, tensor associativity, coassociativity
of derivative allocation and compatible local tadpole compositions make the
rooted rewrites independent of bracketing/root choice. Hence the free natural
no-self-loop bridgeless families in 𝓛, and the free natural no-articulation
ones in 𝓕, acquire no further equations beyond the declared common relations.
This argument includes every contracted ambient root, not only primitive arms.

For the two-arm scalar check use explicitly coupling-stripped one-dimensional
unit-root symbols a,b,g. Only in this specialization is
Δg=g⊗1+1⊗g+a⊗b+b⊗a, Sg=−g+2ab and g−ab primitive. In the actual typed
formula the quotient arm is b[v:=j_a], and the top relation is
j_g(t,…)=contract_t(j_a^open⊗j_b^open); writing j_a(t)j_b(t) would use
t twice. In a compatible Taylor scheme a primitive-arm counterterm product
formula also requires its joined polynomial jet to have degree at most the
actual union order b_U, so T_(b_U) fixes it. Homogeneous compatible allocated
nominal orders give this inclusion; arbitrary oversubtracted or
cancellation-improved orders do not. The full typed forest regrouping remains
a theorem for all non-saturated/overlap/shared-vertex and tadpole occurrences;
the coupling-stripped toy does not identify the vertex-sharing Taylor expansion
with a quotient antipode.

**RQFT6.CompletedBogoliubov — Birkhoff decomposition and the forest comparison.**

Prove the algebraic Birkhoff/Bogoliubov theorem for the free homogeneous
all-degree symbol algebra, its explicitly (L,w)-completed version, H and
the proved class quotients H_𝓛,H_𝓕. The abstract theorem also applies to a
fixed-tad quotient when its input character actually annihilates that ideal.
Specify a graded commutative scalar regularization algebra A and an even
idempotent linear R satisfying

```
R(a)R(b)=R(R(a)b+aR(b)−ab).
```

Its image and kernel are subalgebras; use normalized unitizations for the
character ranges. A required example is the pole projection on K((ε)),
with image ε⁻¹K[ε⁻¹] and kernel K[[ε]]. For φ set C(1)=φ₊(1)=1 and,
on the augmentation ideal,

```
P_φ(x)=φ(x)+Σ C(x′)φ(x″),
C(x)=−R(P_φ(x)),       φ₊(x)=(Id−R)(P_φ(x)).
```

Prove the reduced-coproduct loop recursion, multiplicativity from the
Rota–Baxter identity, uniqueness under these image/kernel conditions and
`φ₊=C⋆φ`, `φ=C⁻¹⋆φ₊`.

For the completed prequotient theorem use the exact all-degree source and
completed coproduct constructed above. Its target is a coefficientwise
formal (u,v)-series algebra with coefficients in B[t,t⁻¹], where B is the
chosen graded commutative scalar coefficient algebra; in the regulator
specialization B=K⊗_ℂ(A⊗_ℝℂ) for real A, with the explicit complex-input
comparison just specified there. Each bidegree
coefficient is a finite Laurent polynomial in t and has finite graph
support on the source. Omit v when loop completion is absent. Require φ
and R continuous for these filtrations; the budget projection used below
preserves u,v. Prove every fixed target coefficient of convolution and
recursion is a finite sum using `w_total=w+2Σq_i` and strictly smaller
positive loop degrees in reduced cuts. Establish both antipode/convolution
identities, multiplicativity and uniqueness coefficientwise, then pass to
the completion by these continuity bounds. This is a theorem before I_nom
or degree-shifting naturality, in addition to the polynomial H theorem.
If an input character kills a compatible closed homogeneous Hopf ideal,
prove by the same continuous induction that C and φ₊ kill it. Apply that
statement only to ideals satisfying its actual input and continuity
hypotheses. The Taylor bare rule below does not kill I_nom.

**RQFT6.RegulatorContinuation — the upstream massive coefficient family.**

For every finite graph in the declared polynomial tensor-numerator class, fix its oriented routing, original field/test-port incidence, positive Euclidean masses, including RQFT6's preceding fixed-μ factor replacements,
and κ>0. Use that preceding labelled-factor family `N_e∏_(a=1)^A_e D_(e,a)^(−s_(e,a))(D_(e,a)/κ²)^(−z)`, where `D_(e,a)=|ℓ_e(k,p)|²+m_(e,a)²`, A_e≥1 and s_(e,a)>0 are the fixed factor labels and integer powers, with the positive real logarithm on the real domain and its chosen holomorphic continuation for external p near the common subtraction point. Factor the stated homogeneous boundary operations before normal coefficient extraction. Prove absolute convergence and holomorphy for Re z sufficiently large, uniformly with every fixed external derivative near that point. A_e=1 gives the single-factor convention. Prove sector continuation and differentiated bounds with these finite factor labels retained under every cut. ForestConvergence and TaylorAdapter subsequently consume this identical family and own their respective convergence/removal and Taylor comparisons; no theorem from either is an input here. A common-denominator representation must keep the UV cancellations used in n_e; partial fraction terms are not assigned a better individual order without proof. The chosen factor presentation and its analytic regulator are part of the prescription data: cancelling a denominator factor or changing the presentation need not leave the z-dependent family unchanged, so compare such schemes by the actual relative adapter rather than an identity at nonzero z. Gauge parameters range in the stated positive-mass Euclidean domain; singular gauge limits are separate. Keep the same edge regulators under each typed cut: residue loop factors remain in the quotient numerator/vertex input and are not dropped by contraction.

Resolve each finite graph's ultraviolet sectors, Taylor-subtract their smooth coefficients and integrate the monomial Mellin factors. Prove meromorphic continuation of every actual scalar/tensor coefficient to all of ℂ, with locally finite finite-order poles: for every R>0 construct it on the connected half-plane H_R={Re z>−R} by sufficiently many sector Taylor subtractions, locally uniformly on compact subsets of H_R, and integrate the finitely many monomial Mellin factors explicitly. Every H_R and every overlap H_R∩H_S contains the same large-Re-z convergence half-plane. Prove equality there from the actual integrals, then apply the meromorphic identity theorem on that connected overlap and glue the exhaustion ⋃_R H_R=ℂ. This upstream construction chooses no ε_Γ; ForestConvergence later chooses its pole-free subtracted half-plane. Positive masses control the remaining boundaries. Prove routing independence and compatibility with the full typed contraction/Leibniz/test differentiation, external normal coefficient extraction and finite forest regrouping wherever those integrals converge; uniqueness then extends these identities meromorphically. The target is the actual regulated graph coefficient family and its estimates, not a consequence of a scalar germ field. It precedes both ForestConvergence and TaylorAdapter and consumes neither. Massless removal and Lorentzian boundary values retain their separately stated hypotheses.

**RQFT6.ForestConvergence — the full massive tensor remainder.**

For each finite graph in the declared polynomial tensor-numerator class,
including its scalar/Dirac/vector and higher-spin/derivative instances,
fix positive Euclidean masses, the polynomial tensor numerators, oriented
routing and vertex-port incidence above. Use exactly RegulatorContinuation’s
edge family `N_e∏_(a=1)^A_e D_(e,a)^(−s_(e,a))(D_(e,a)/κ²)^(−z)`,
with the same factor labels, numerator and positive masses (or the same
fixed μ>0 factor replacements), and the standard zero-point **normal** Taylor
orders `b_δ=floor(ω_δ^nom−e_δ)` on every homogeneous allocation component.
Retain the complete labelled nested/disjoint Taylor forest sum and the
full Leibniz insertion at each inner residue, including non-saturated,
overlapping alternative forests, shared vertices, repeated vertex sets,
residual self-loops and the grouped one-vertex compositions. Pin those
operations in this common-zero positive-mass scheme to the prepared
port-factored zero-point Taylor projection with normal order
floor(ω_t^nom−e_t), consuming TotalDegreeInsertion's homogeneous
tadpole bounds and typed rooted substitution/cut-regrouping identities. On P_t=0 the only normal monomial is degree0:
when its budget is nonnegative C_t is minus the prepared coefficient and
φ₊(t)=0; a negative budget contributes no subtraction for that component.
Derivatives remain on their specified boundary/tensor slots. Retain these
local cap maps under nested residual tadpoles; no propagator value at0 is
introduced. Compatible nonzero fixed-tad schemes require their declared
relative adapters. The
convergence assertion concerns this complete subtracted tensor integrand;
individual expanded forest terms need not be absolutely integrable.

Prove a Zimmermann/sector remainder theorem for this sum. Resolve all
simultaneous large-loop regions by cycle-support edge subsets and their
nested sector flags. In every region identify the forest cancellations
with an iterated integral Taylor remainder, keeping inner Taylor
operators before the containing remainder. Prove the tensor norm and
all required external-derivative bounds by these integral remainders,
the total-degree insertion identities and the polynomial numerator
bounds. A cycle support with an unregulated negative degree is already
integrable; a subtracted support has the strict remainder margin given
by its actual Taylor order. Prove these assertions also for disconnected
cycle supports and arbitrary large-loop subspaces, using their edge
supports; bridges have fixed momenta along those loop spaces.

In the required integer Euclidean case the uniform unregulated margin
is at least1. Put `A_Γ=Σ_(e internal to Γ)A_e`; for a nonempty cycle
support δ put `A_δ=Σ_(e∈δ)A_e`. These count regulated denominator factors,
not physical edges, denominator powers or cut components. For A_Γ>0 choose
`0<ε_Γ<1/(2A_Γ)`, for example `ε_Γ=1/(4A_Γ)`. The regulator changes
that support’s degree by `−2Re(z)A_δ`. Prove absolute domination of the
full subtracted integrand, locally uniform for z on compact subsets of
`Re z>−ε_Γ` and external momenta on a sufficiently small complex
neighborhood of the common subtraction point. For the displayed example
choice the degree margin is at least1/2 throughout this half-plane,
since A_δ≤A_Γ; positive Re z improves power decay. On each compact
parameter subset control polynomial-in-z differentiation factors and
logarithmic z derivatives by the same sector majorants with a positive
remaining margin. For a separately allowed noninteger nominal class use
its finite list of strictly positive remainder margins δ_δ and choose
`0<ε_Γ<min_δ δ_δ/(2A_δ)` over nonempty cycle supports. No graph-uniform
or sharp maximal strip is asserted. A graph with no cycle support has no
ultraviolet loop integral in this assertion; treat its prescribed tensor
operations separately. The edgeless identity is its prescribed case.
All cut and residue comparisons retain this same factor presentation.

Positive masses supply the infrared bounds, including Taylor zero; an
auxiliary fixed mass μ>0 supplies only the already stated regulated
massless theorem. Prove holomorphy and differentiation under the
subtracted integral by the uniform majorants, its z→0 limit, and
commutation with the complete finite coefficient/typed forest
regroupings. On a common sufficiently large-Re-z region every expanded
term converges absolutely; prove equality there with the finite typed
meromorphic forest expression from RegulatorContinuation by Fubini and
normal coefficient extraction. That expression is meromorphic on the
connected half-plane and the complete subtracted integral is holomorphic
there. Apply the meromorphic identity theorem on that domain to obtain
agreement, cancellation of its apparent poles and equality of all normal
Taylor coefficients, in particular the holomorphic germ at0.
This supplies the analytic regulator-removal theorem consumed by the
Taylor adapter. General nonzero compatible subtraction points, massless
limits and Lorentzian boundary values retain their own stated hypotheses
and adapters. Actual conic/scaling distribution bounds and the
position/momentum comparison remain required; Euclidean integrability
alone does not supply them.

**RQFT6.MassiveEuclideanRegularity — full real external momenta.**

For every finite graph in RegulatorContinuation and ForestConvergence's full
polynomial tensor-numerator class, construct the renormalized reduced
Euclidean momentum coefficient on its whole real external-momentum space.
Retain every labelled positive-mass denominator factor, oriented routing,
scalar/Dirac/vector/higher-spin tensor and derivative vertex, boundary-port
allocation, residual self-loop and complete nested/disjoint forest operation.
Use the same common-zero normal Taylor prescription and compatible fixed or
variable local tadpole data. The coefficient is a function with values in
the graph's finite tensor/coefficient stage; construct its comparison with
the universal open-port and tested realizations. This theorem concerns each
finite graph and perturbative coefficient, with its declared finite data.

First extend the sector remainder estimates to every compact set P of real
external momenta, with all external derivatives and locally uniform regulator
parameters. Construct a complex neighborhood of P on which the complete
subtracted integral is holomorphic in those momenta and in z near zero,
and agrees with the meromorphic forest expression. The subtraction point
stays zero: moving the external argument is not a new subtraction scheme.
For real loop momenta write each routed vector as
`ell_e(k,q+ib)=L_e k+A_e q+i A_e b`. Choose the imaginary neighborhood so
`|A_e b|^2<m_(e,a)^2/2` for every factor. Then prove
the bound below for the holomorphic quadratic polynomial
`D_(e,a)=sum_j ell_(e,j)^2+m_(e,a)^2`, extending its real Euclidean value:
`Re D_(e,a)(k,q+ib)>= (|L_e k+A_e q|^2+m_(e,a)^2)/2`.
Use the compact convex hull of P and zero for all external Taylor paths.
Retain the full forest remainders: inner Taylor arguments may contain
unbounded outer loop variables and are governed by the simultaneous sector
flags, rather than by a compact-external argument applied separately to
an inner graph. The bounded real shifts change the sector constants and
the low-loop region, not the strict ultraviolet remainder margins.
Prove these statements using ForestConvergence's tensor/Leibniz estimates
for all simultaneous loop subspaces. Do not integrate the expanded forest
terms individually when only their full remainder is integrable.

Apply differentiation under the complete subtracted integral and the
meromorphic identity theorem on each such neighborhood. Prove agreement
on overlaps from the identical real integral and fixed subtraction data.
Thus obtain a globally defined real-analytic, hence smooth, reduced
coefficient `a_Gamma` on the entire real momentum carrier. This is an
additional parameter-uniform theorem beyond the neighborhood-of-zero
statement in ForestConvergence. Graphs with no loop, one-vertex graphs
and the empty algebra unit use their prescribed finite tensor operations.

Prove polynomial growth bounds for every fixed external derivative:
`||partial^alpha a_Gamma(p)|| <= C_alpha (1+||p||)^N_alpha`, with finite
graph-dependent constants and exponents. Establish the corresponding
bounds locally uniformly in z near zero before regulator removal. Split
loop sectors at a scale bounded by a graph-dependent multiple of
`1+||p||`; use the positive mass lower bounds in the remaining bounded
regions and the complete ultraviolet remainder estimates in the tails.
Track the finite numerator/Taylor degrees and sector logarithms, bounding
each fixed logarithmic power by a further polynomial. These are actual
estimates, not an inference from smoothness. They give temperedness and
Schwartz-tested regulator convergence for the reduced coefficients.

Retain one conservation delta for each nonempty connected component C,
on the momenta of its configuration-space vertex slots:
`hat F_Gamma(p)=product_C delta(sum_(v in C) p_v) a_Gamma(p_rel)`.
Choose independent linear relative-momentum coordinates once and prove
their restriction/Jacobian and RQFT0 Fourier-normalization comparisons.
Multiply the smooth polynomially bounded coefficient by these deltas on
the actual tensor-valued tempered-distribution carrier. Prove this is the
Fourier transform of the constructed translation-invariant renormalized
configuration kernel: establish the regulated Fourier identity in its
common convergence region, use the preceding Schwartz bounds for the
subtracted removal, and compare with the controlled extension through
the actual tested realization. Consume SourceProductAdapters' component
conservation/Fourier-restriction core and SwitchedRealization's compact
test comparisons for these steps. Its massive-graph smoothness corollary
is an output of this theorem, separate from that earlier core.

Prove compatibility with all finite graph relabelings, tensor contractions,
external derivatives and disjoint products in the declared class. For
other compatible translation-invariant graph-local prescriptions, use
DiagonalStabilizer.Core and the actual finite local-jet insertion formula:
each scheme change is a finite sum of polynomial momentum factors times
already constructed lower graph coefficients, with the full tensor and
substitution laws. Prove by graph induction that these coefficients have
the same global smoothness and polynomial-growth property. Generic
controlled extensions with arbitrary tangential distribution coefficients
are outside this graph-local scheme comparison unless the needed
regularity is separately proved.

For partial integration retain a vertex slot in every nonempty component
and apply SourceProductAdapters' actual conservation-delta pullback
criterion. Complete integration of a vacuum component still needs its
translation-volume reduction and normalization; the formula supplies no
value for delta(0). An unrenormalized ultraviolet-divergent graph has no
unqualified ordinary loop integral supplied by this theorem. Massless
removal, singular gauge limits and Lorentzian boundary values retain their
separate hypotheses. This is the full finite massive Euclidean diagram
regularity/comparison target for Borcherds p88, beyond the free-propagator
calculation and beyond a merely conditional smooth-function-times-delta
observation.

**RQFT6.TaylorAdapter — all-degree coefficients and actual insertions.**

Use the free all-degree homogeneous symbol algebra and its proved auxiliary
completion before I_nom and formal degree-shifting naturality. Retain every
normal Taylor multi-index β. For port type c put
`b=|β|`, `q=b+e_(Γ,c)` and the integer budget `n=ω_Γ^nom−q`.
The required Euclidean edge/numerator degrees are integers. A fixed
auxiliary infrared mass μ>0 supplies the declared regulated massless
instance; its μ→0 limit and gauge-preserving regulator comparison remain
separate targets. Retain every specified polynomial vertex/numerator tensor. Fourier
transform the translation-invariant kernel, remove its overall conservation
delta and factor the specified boundary-port derivatives as their input
operations before extracting normal coefficients on P_Γ. Their action
uses the original vertex incidence, including physical external profiles. Keep an arbitrary independent auxiliary Φ on every original/residue configuration as in TypedJetImage, even for an unswitched or closed graph. Auxiliary output tests add no field or boundary degree. Consume RQFT6.InsertionDerivativeDescent.Kernel for the derivative-natural kernel insertion implication and RQFT6.InsertionDerivativeDescent.Fourier for its separate conditional Fourier-conservation/internal-integration implication. This adapter owns verification of both sets of hypotheses for the actual regulated port-factored Taylor scheme below.

Consume RQFT6.RegulatorContinuation for this exact edge-regulated coefficient family, its large-Re-z integrals, connected-domain finite-pole continuation and typed/external-derivative comparisons. This adapter owns the subsequent graded budget character and insertion identities; it does not construct a second analytic continuation.

First verify the conditional internal integration on the common large-Re-z domain for each finite graph and every finite derivative/forest component. Use positive Euclidean masses (or the stated fixed μ>0 auxiliary infrared regulator), actual routing and all retained physical-profile frequencies. Work against compact smooth output tests, or Schwartz momentum packets after the stated Fourier transform, and insert smooth loop cutoffs χ_R. Prove a common majorant integrable jointly in loop momenta and every retained physical-profile frequency being integrated after the test/packet pairing, locally uniformly in the stated parameters, for the required differentiated integrands and that every boundary term containing ∂χ_R tends to0; polynomial factors and the fixed finite differentiations are absorbed by taking Re z sufficiently large. When using finite Schwartz-seminorm bounds, prove the resulting packet-weighted frequency integrals finite; a pointwise profile-frequency bound does not suffice for Fubini. For proper-support position-space insertion prove the analogous transpose identity on compact tests. Keep the cutoff derivatives of physical switching/profile factors in the full incidence Leibniz sum. These estimates justify dominated convergence, Fubini and integration by parts and verify Fourier's actual support/boundary hypotheses, rather than deriving descent from pointwise conservation. For the finite rational-edge presentation use the same labelled factors and regulators fixed by RegulatorContinuation.

Next prove Kernel's derivative-naturality for the prepared and renormalized Taylor scheme. At the common zero subtraction point, the normal Taylor projection obeys `T_(b+1)(p_μ a)=p_μ T_b(a)` for a linear normal coordinate p_μ, including negative orders with T_b=0 for b<0. For each tangential/total-momentum parameter K_tot,μ held independent of the normal variables P_Γ, also prove `T_b(K_tot,μ a)=K_tot,μ T_b(a)` for every b, with the same negative-order convention. Normal Taylor extraction acts coefficientwise in these tangential parameters. Together these identities include the one-vertex case P_Γ=0, where physical coefficient/profile jets remain and only normal polynomial degree is0. They do not identify an individual physical slot momentum with the total sum. Factor each specified boundary operation before extracting normal coefficients; its homogeneous degree shifts ω and q together, so the matched Taylor budget is the one in this identity. Expand a total vertex derivative into its complete incidence/physical-profile sum and every proper-block term, using KernelCutTransport, the primitive coproduct and the exact typed forest flags. Prove by graph/forest induction that subtraction and insertion obey `F_z(D_(v,μ)·Γ)=∂_(x_v^μ)F_z(Γ)` with arbitrary auxiliary Φ on original and residue configurations. This is a target for the full port-factored scheme, not a claim that an arbitrary unrelated Taylor projection is derivative-natural.

The two sides of each tested identity are actual meromorphic coefficient families supplied by RegulatorContinuation and the finite forest construction. Establish equality on their common convergent half-plane as just proved, then use the connected-domain meromorphic identity theorem to extend it. ForestConvergence separately supplies the holomorphic renormalized germ and regulator-removal identification. Pass to that germ/evaluation only there. Removing μ, changing to a noncompatible subtraction scheme, Lorentzian boundary values or nonproper unswitched integration retains its separate infrared/boundary/compatibility proof; none follows from the massive initial estimates. Core consumes neither this verification nor these analytic owners.

Consume [CK K3.MeromorphicGermField](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md#k3-analytic-germs-and-subvarieties)
for the scalar field K of finite-pole meromorphic germs at z=0, its
punctured native `MeromorphicAt` comparison, finite Laurent principal
part and regular-subring evaluation. For the allowed real graded
coefficient algebra A put A_ℂ=A⊗_ℝℂ and B=K⊗_ℂ A_ℂ at each finite
Grassmann/field stage, with the graded tensor product and its actual
relations. For a specified complex coefficient algebra use it in place
of A_ℂ, recording the canonical complexification-to-input comparison.
The regular coefficient subring is O₀⊗_ℂ A_ℂ, embedded in B by flatness
over ℂ, with evaluation ev₀⊗id. RQFT6 owns the graph coefficient continuation and its estimates;
the scalar germ field is supplied by K3.

Let a_(Γ,c,β)(z) be the actual bare scalar coefficient on these normal/port
types. Define
`φ(x_(Γ,c,β))=a_(Γ,c,β)(z)u^w v^L t^n`,
where `w=Σ_vd_v+q` and L is loop degree. Omit v when appropriate, and
retain finite graph support in each bidegree. Coefficients lie in
B[t,t⁻¹] formal (u,v)-series (K when A_ℂ=ℂ). Prove multiplicativity on disjoint unions,
continuity from `w_total=w+2Σq_i`, and the actual cut/coaction coefficient
identities. Define R coefficientwise by retaining t^n for n≥0.
It is continuous, even, idempotent and Rota–Baxter, since nonnegative
and strictly negative powers separately form subalgebras.

Apply the completed **prequotient** Bogoliubov theorem. Total-degree
insertion and dual boundary-coefficient transport make every term for
this coordinate have budget n. Thus C is zero when q>ω_Γ^nom, although
φ generally is not. By loop induction only the bounded extracted total
degrees q_i≤ω_(γ_i)^nom survive in any fixed graph's preparation; all
recursive cut/jet descendants are finite. Each such coefficient is a
polynomial in u,v with finite Laurent t support. Discard u,v at1 only
on this finite calculation and strip t^n coefficientwise. Budget
additivity proves the resulting multiplicativity.

Now prove formal wiring/field/port-derivative naturality on these finite
coefficients; a boundary derivative shifts ω and q together. Prove the
regulated open rule's grouped tadpole and compatible rooted coefficient-
convolution identities with complete Leibniz/test-slot allocation.
Their budget homogeneity, the actual cut/defect formulas and the
projection R prove that C descends to H_𝓛 and, for the compatible
factorizing scheme, H_𝓕 after finite evaluation. No all-degree naturality
continuity or bare I_nom descent is assumed. The renormalized rule φ₊
retains every q>ω_Γ^nom coordinate and generally does not descend through
I_nom; these coefficients carry the full Taylor-subtracted amplitude.

The fixed-tad ideals have a different use. For a massive one-vertex
tadpole the nonzero bare germ is proportional to
`m^(2−2z)κ^(2z)Γ(z−1)/Γ(1+z)`. When its budget is nonnegative,
C is minus its prepared value and φ₊ is0, so C does not kill I_1v.
This applies with its actual derivative/tensor allocations; the cap for every component, including a negative budget, is precisely the rule owned by ForestConvergence.
Fixed-tad quotients concern relative transformations between realized
prescriptions with equal evaluated tadpole data. Bare-to-renormalized
C need not descend. Scalar comparison requires a regularity-and-evaluation
theorem in addition to the germ-valued recursion; that theorem is stated
with the effective comparison below, after the raw/reduction owners.

For a diagnostic take a four-dimensional equal-mass scalar bubble whose
two vertex derivatives lie on an external port. Its scalar kernel is
the underived bubble, ω=2 and e=2. The coefficient b=2 has q=4 and
n=−2 and receives no counterterm, just as its underived naturality
partner. With raw Lebesgue loop measure its p² coefficient equals
`−π²/(6m²)`; with d⁴k/(2π)^4 it equals `−1/(96π²m²)`.
Derive it either by the regulated Feynman-parameter formula or by the
absolutely integrable differentiated kernel, rotational averaging and
`−m²∫d⁴k/(k²+m²)^4`. Counting b alone would wrongly subtract this
finite coefficient. Also validate nested insertions with boundary-
derivative transfers and the total-degree nominal-ideal test.

The nonlocal rule is `R_reg∘Z_C` on the full open graph carrier 𝒢.
In each cut, insert the labelled tensor jet j_β into the quotient
integrand using its original vertex flows **before** quotient-loop
integration. Prove the position/momentum insertion comparison, all
external test slots, residual tadpoles, once-used field tensors and
Koszul signs. Expand the actual typed cut recursion and prove equality
with the complete labelled momentum forest sum through the owned
non-saturated/overlap/shared-vertex/equal-vertex-set regrouping theorem.
Consume RQFT6.ForestConvergence for the locally uniform subtracted
integrand, holomorphic regulator removal and coefficient agreement;
prove the required Fourier/intrinsic prescription comparison separately.
The common-zero positive-mass scheme uses exactly the preceding normal
budgets and root identities. Compatible nonzero points use shifted
variables and the actual routing/vanishing-order identities; every other
admissible scheme retains the 𝓛 full-prepared-input construction and
scheme-determined articulation jets. Massless/Lorentzian cases retain
their infrared, wavefront and analyticity adapters.

Retain the separate Taylor-germ Rota–Baxter lemma on holomorphic germs
in a fixed finite-dimensional complex external-variable space E:
`R(f t^n)=T_n(f)t^n`, with T_n=0 for n<0. Consume K3.HolomorphicStalk's
several-variable O_(E,0), or its finite coefficient-stage tensor extension;
this is not the one-variable meromorphic regulator field. Consume the
actual convergent power-series/normal Taylor comparison and
prove the projection identity by the exact product-of-remainders bound,
including negative budgets. This is a separate example from the scalar-
coefficient budget target above. The Connes–Kreimer pole example and the
full typed regulator/insertion/convergence adapters have their respective
stated hypotheses. Compare [Connes–Kreimer §3](https://arxiv.org/html/hep-th/9912092)
for the pole recursion; that renormalizable scalar example supplies no
full field/jet, all-degree or analytic insertion proof.

For a fixed chosen class and finite perturbative/jet bounds, place independent normalization conditions only on its free constant coefficient families (including tadpole data when these are variable). The fixed multiblock, disconnected and bridge values, and 𝓕's articulation values, are consequences of the product recursion; additional conditions on them must be proved to follow from the free conditions. Strip the overall momentum delta and use values/jets of the reduced amplitude only where it is smooth. Prove solvability by expressing the normalization map in graph order as block triangular, affine in each new free coefficient block with already fixed proper-graph terms, and with an invertible diagonal map on its allowed constant tensor space. For complete consistent target data this recursive map is invertible and gives a unique prescription, so equal complete conditions imply equality. Incomplete conditions retain their actual kernels and compatibility equations. Cross-graph Ward constraints require a separately proved compatible joint affine system, not arbitrary independent per-graph values. Conditions on a product block that contradict its fixed factorized value have no solution in 𝓕. For different realizable conditions use the action preserving their chosen class, or the full 𝓛 action between realized prescriptions and its inverse; the restricted factorization-preserving class alone cannot bridge inconsistent/nonfactorizing data. Prove support, temperedness and cutoff/infrared limits for each comparison independently of local wavefront control. Validate the sunset, non-saturated bubble, tadpole and compatible/incompatible articulation examples. Consume **RQFT6.RadialExtension** for the complete homogeneous-extension, annular-normalizer, angular-kernel, exceptional-degree and source-precision statements.

Formalize the course prescription F(Γ) as a distribution-valued map on RQFT5's graded decorated graph carrier: unit/point and tadpole data, signed graph-isomorphism equivariance, disjoint-union and partition-stratum exterior products, edge insertion under the actual wavefront criterion, causal factorization away from collisions, field/derivative compatibility and the defined renormalized local insertions. References and changes are intrinsic and embedding-independent. Use exactly the two previously defined classes 𝓕⊆𝓛, their proper-block stage inputs and their distinct free coefficient families; products at bridges, disconnected graphs and multiblock strata remain fixed in both. Add symmetry covariance only under the proved equivariant-existence and stable-affine-constraint hypotheses. Prove existence and classify ambiguities by the compatible bounded constant tensor families, with the remaining values fixed by the relevant recursion. Keep the arbitrary generic u_α(y) controlled-distribution theorem distinct from both graph-local classes.

Consume exactly the natural typed edge-set coaction and the proved class-preserving algebras H_𝓛,H_𝓕, with their fixed-tad quotients when appropriate; no second coproduct comes from the vertex-sharing Taylor convention. Prove the RQFT6 Birkhoff/Bogoliubov and complete forest comparison theorem above with its actual commutative Rota–Baxter target and typed subtraction adapter. Distinguish this framework from the course’s toy “group-like for every element” simplification.

**RQFT6.CourseRawComparison — the raw course group and action.**

Retain all finite decorated graphs and all spanning edge-subgraphs γ,
with isolated vertices as identity pieces; this raw carrier has no 1PI
edge-cut restriction. Consume the abelian UEA/polynomial equivalence,
primitive coproduct and Hopf antipode for
`U^V=Sym(⊕_(v∈V)translations)`. Raw families C are graph-natural,
multilinear in decoration inputs and multiplicative under disjoint union.
On each finite field/jet stage their typed operator coefficients lie in
`U^V⊗Multilin(T_in,T_out)`, with the actual residue/open-port profile;
scalar coordinates after dual testing lie in U^V. Use the common natural
coevaluation/typed insertion carrier, not a matrix-valued character algebra.
The edgeless decorated corolla is its normalized identity map, including
its actual field/test differentiation rules; it is not the scalar functional
constantly1 on arbitrary input tensors. The scalar unit corolla has value1.
Borcherds p.4 literally normalizes C(∅)=1; the stronger edgeless/decorated
normalization is the consequence required by the p.8 and p.10 action/
derivative identities; see the source-specific completion ledger below
for the literal normalization and its qualified mathematical target.

On the larger space of linear graph-isomorphism-natural distribution-valued
maps F define the finite Sweedler sum

```
A_C(F)(Γ)=Σ_(spanning γ⊆Γ) Σ_(ΔC(γ))
 C(γ)_(1) · i_γ* F(S(C(γ)_(2)) · (Γ/γ)).
```

Here Δ and S act on the U factor; open coefficient maps compose through
the actual coevaluation/insertion, retaining each field tensor once. Prove
this typed transport is natural before taking separating scalar coordinates.
The map i_γ is the closed diagonal embedding with the fixed-density
pushforward. Specify the antipode action on incident field/derivative
labels using original incidence and all external test slots. Prove its
Leibniz comparison with differentiation of the distributional expression;
it is a polynomial label operation. A derivative at a contracted block
lifts to the sum of derivatives at its original vertices.

Define C₁★C₂ by the nested expression from A_(C₁)A_(C₂): the γ-term
multiplies C₁(γ)_(1) by the lifted quotient operator
`C₂(S(C₁(γ)_(2))·(Γ/γ))`, with the full indicated coproduct/incidence.
The spanning-subgraph flags, contraction maps, coproduct/antipode and
Leibniz identities prove `A_(C₁★C₂)=A_(C₁)∘A_(C₂)`. Prove closure
and associativity from these flags, with this pinned product order.
The identity family vanishes on connected positive-edge graphs. Edge-count
induction gives both inverses; each fixed graph has only finitely many
terms in the triangular comparison. This edge filtration is distinct
from the typed 1PI algebra's positive-loop filtration.

Prove faithfulness on this larger map carrier using one-point/corolla
point-delta tests and separating linear functionals on fully open labels.
These are non-equivariant test maps on the larger carrier: no equation
F(D·label)=D F(label) is imposed. Choose a scalar label functional λ with
λ(1⊗τ)≠0 on the separated input component; its values on derivative
labels can be independently chosen on the finite test stage. Even the
derivative-counit choice paired with a fixed point delta is generally
non-equivariant. The raw composition identity and this faithfulness
statement live on that larger carrier; derivative-equivariant prescriptions
enter only in the subsequent cancellation and stabilizer statements.
Only full cuts can reach that test graph from a connected positive-edge
Γ. For the derivative-counit label test the antipode sum reduces to
C(Γ) applied to a point delta in M^V. General label tests retain the
entire Sweedler sum: they need not annihilate label derivatives. If the
first nonzero operator component has highest degree d, the degree-d
point-delta derivative comes from C_d⊗1; terms with positive second-factor
degree have smaller first-factor degree. Separate the open label tensor
at this top term and descend in d. Independence of point-delta derivatives
then detects the whole polynomial family, including labels invisible to
a derivative-counit test. Prove this finite-degree argument before any
numerical/symmetric coupling specialization. It proves faithfulness on
the larger carrier, rather than on a fixed prescription space.

For prescriptions, local derivative compatibility is
`(C(D·Γ)−D C(Γ))δ_Δ=0`, including all multi-index/label relations;
consume DiagonalAnnihilator for its operator quotient. At an undecorated
isolated point D·pt=0 and C(pt)=1, so exact raw U-linearity cannot be
imposed. Free source ports retain their symbols until the prescribed
evaluation. Keep the p.10 literal distinct from this precise local rule.
Prove the insertion cancellation
`S_B(δ_Bu)=δ_B∂_(y_B)u`: the antipode label term subtracts this same
remaining derivative by F's derivative-equivariance. Prove all polynomial
orders with the Hopf Leibniz/antipode laws and controlled insertion maps.
Thus tangent representatives cancel in a complete raw action term.

For a chosen universal natural class 𝒞=𝓛 or𝓕, with compatible fixed or
variable tadpoles, define the raw comparison subgroup as its set stabilizer
under this already proved raw action. Compute its equations for derivative,
**total** nominal degree, bridge, intrinsic partition and tadpole conditions,
and, for 𝓕, articulation conditions. These equations need not hold for
an unconstrained raw family. This clause owns the raw group/action,
faithfulness, cancellation and stabilizer definition. DiagonalStabilizer
owns the subsequent reduction, lifting, kernel and effective comparison.
Keep the p.9/p.10 opposite-sign chain, p.5 group-like mnemonic and uncertain
derivative example in the literal source evidence. Their interpretation
uses the actual controlled comparison and the stated product order.

**RQFT6.DiagonalStabilizer.Core — reduction and effective comparison.** The name DiagonalStabilizer in the raw-reduction statements denotes this core. It consumes no regulator, Taylor or forest-convergence theorem.

Consume DiagonalAnnihilator, TypedJetImage, TypedHopf, ClassQuotients,
TotalDegreeInsertion, ControlledKernelStages, ControlledExtension,
InsertionDerivativeDescent.Kernel and CourseRawComparison. Apply the raw annihilator comparison on the declared formal coefficient/jet presentation, using its full derivative-module/Sweedler cancellation; bare Ann(δ) alone does not annihilate a variable-coefficient kernel. The larger raw family keeps its own action before these descent hypotheses. For each universal
natural 𝓛/𝓕 class and its compatible fixed-tad version construct the
raw-to-relative-jet reduction homomorphism from its class-preserving raw
comparison subgroup to the stated relative-jet character group. Prove
contraction, root wiring and class-preserving convolution respect the
diagonal annihilator. The full-cut/partition-stage insertion comparison
intertwines the raw spanning-subgraph action with the typed edge-cut
coaction; these carriers retain their different cuts.

This clause alone owns reduction, surjectivity, lifting, kernel and the
unique effective comparison. Construct lifts by finite graph/loop induction:
choose canonical barycentric normal representatives of the top delta-jet,
then correct the already determined proper-graph terms. Prove graph/spectator
naturality, all boundary-port allocations, total-symbol-degree bounds and
class conditions, including grouped tadpoles and 𝓕 articulation identities.
The earlier rooted defect/triangular reduction lemmas supply these identities;
TotalDegreeInsertion supplies existence of the required 𝓛/𝓕 prescriptions
by its outer graph induction, applying ControlledKernelStages and
ControlledExtension at each step. This establishes surjectivity onto the actual compatible
relative character group, not onto unconstrained coefficient assignments.

Its kernel K acts trivially on every prescription in the universal class.
Conversely graph/loop induction removes proper comparison terms and leaves
the fully open identity-corolla delta-jet map. DiagonalAnnihilator and
TypedJetImage’s faithful kernel normal forms identify its exact kernel before numerical coupling evaluation. Independent compact auxiliary tests remain at every original and residue vertex, including corollas; no integrated Div quotient is used in this comparison. Hence K is independent of the universal prescription
and normal. The effective group is the class-preserving raw group/K,
identified with the relative-jet group. On each nonempty realized universal
class it acts freely and transitively. The character comparing two such
prescriptions is unique; raw lifts differ by K. At the top correction
choose `C(Γ)δ_Δ=F₂(Γ)−F₁(Γ)` in the pinned additive raw convention.
Fixed-tad groups compare equal data only; bare-to-renormalized counterterms
with changed tadpoles are not claimed to lie in them.

For numerical vertex tensors, selected interactions, Ward constraints or
improved actual scaling, retain the actual specialization/evaluation map.
The stabilizer consists exactly of the equations
`R(Z_χΓ)−R(Γ)=0` for every decorated Γ, expanded using the typed coaction.
At each loop order separate known proper-cut terms from the top corolla
jet and impose the kernel of that specialized open-jet evaluation map.
Include every residue/root context. These are recursive linear/affine jet
equations, finite dimensional for a fixed decorated graph and its finite
cut-closure, with lower comparison coordinates fixed. A loop order and
external type alone need not bound graph number: kinetic two-valent
insertions preserve both. Necessity and sufficiency follow by induction
on this full compatible family. An additional specialized stabilizer need
not equal K, be independent of R or be normal in the full comparison group.

Preserve the literal p.11 derivative list and compressed subgroup/simple-
transitivity wording. Its valid diagonal calculation uses tangent sums S_a;
individual normal derivatives are not annihilators. Under the universal
hypotheses it is the effective quotient that acts simply transitively.
No uncertain punctuation proves a statement about numerical coupling
evaluations. This source qualification and the specialized equations
retain the full source comparison scope.

**RQFT6.DiagonalStabilizer.RegularComparison — holomorphic relative evaluation.** Consume DiagonalStabilizer.Core for the effective comparison, and RegulatorContinuation, ForestConvergence and TaylorAdapter for the analytic family below. This owner alone adds holomorphic relative regularity and evaluation; SwitchedRealization and ConnectedSubstitution consume only Core.

For the Taylor realization, distinguish pole-valued bare-to-renormalized C_i from scalar relative comparisons. Suppose the two prescriptions R_i(z)=C_i(z)·R_bare(z) extend holomorphically at z=0 on every fixed open graph/test stage, obey the same universal natural class conditions, and have the declared tadpole data at evaluation. Strip the auxiliary u,v,t gradings only after their previously proved finite graphwise calculation. Over K the pinned left-action relative character is χ(z)=C₂(z)⋆C₁(z)⁻¹. Prove regularity of χ by graph/loop induction, not by evaluating C_i individually: after removing the already regular proper-cut terms, the top local jet equals a difference of holomorphic distribution families. On its finite-dimensional allowed jet space choose finitely many compact tests separating the normal delta derivatives and open tensors; their constant invertible pairing matrix recovers every coefficient holomorphically. For numerical quotients use the actual open-jet evaluation kernel and choose a regular representative only under the separately proved lifting hypotheses, rather than infer regularity of invisible coordinates.

Thus, on the universal coefficient carrier, χ takes values in the regular subring O₀⊗ℂ A_ℂ⊂K⊗ℂ A_ℂ. Apply ev₀⊗id coefficientwise; it is a ring map and commutes with each finite cut sum, so χ₀ is a genuine scalar relative character comparing R₁(0),R₂(0). The effective comparison theorem of DiagonalStabilizer.Core now applies. Equal tadpole data at z=0 imply χ₀ kills the fixed-tad relations; equality as holomorphic families gives the corresponding germ-valued assertion. Unequal bare/renormalized tadpoles give no such descent. General meromorphic C₂⋆C₁⁻¹ without the holomorphic-prescription hypotheses has no value-at-zero comparison asserted.


**RQFT6.SwitchedRealization — compact all-map targets and tested open tensors.**

Consume RQFT5's graded open-graph species, FiniteOddPolarization, WickCompact, total incidence U-action and algebraic all-map Free construction. For its switched species Fey₀ᶜ every
vertex has an actual coefficient b_v∈C_c∞(M,ℂ). Its U-action differentiates
both b_v and every incident internal/open field-jet slot by Leibniz.
External products use independent variable factors, with the scalar unit
only at the empty vertex set. A nonempty switched corolla has its actual
compact coefficient; no constant1 coefficient in C_c∞(M) is assumed.

Consume RQFT5.FiniteOddPolarization for finite-stage separation and stability under fresh-generator enlargement. Retain the full universal open tensor/jet carrier and test every output distribution on arbitrary independent compact Φ on its configuration space; these auxiliary tests are separate from the profiles below. To realize a fixed exterior coefficient stage Λ_M, choose a larger test stage Λ_N with N≥M and the canonical injective Λ_M→Λ_N. Choose smooth test/background profiles h_a:M→Λ_N of the field's parity. Evaluation of a formal jet is
`ev_h(u_(a,α))(x)=∂^αh_a(x)`; prove that ev_h is graded multiplicative and
intertwines total D with ordinary differentiation. Use independent tagged
polarization copies for ordered open slots, with the existing Koszul
identifications. The tags are test slots, not new physical particle types.
At each finite open-field/jet stage take enough independent odd generators
**outside the coefficient stage Λ_M**; extracting their exterior coefficient
retains every Λ_M coefficient. A fixed small exterior stage is not a faithful
test for all odd degrees. Ordinary commuting profiles alone cannot separate
odd tensors. Make the
polarization envelope explicit: use a fixed countable set of auxiliary
copy tags on generators u_(a,α,r). Tags may repeat; vertex relabelings fix
them and external products retain them. Distinct tags are chosen when
separating a finite ordered tensor. Internal pairings use the physical
field/jet tensors, with no new orthogonality between tags, and remaining
open tags retain their own profiles h_(a,r). Prove this tagged extension
from multilinearity and its finite tag-relabeling/diagonal comparisons.
The original physical field algebra is its diagonal identification; this
construction adds test copies, not extra physical particle species.
For fixed N the profile index is the product of all smooth parity-correct
h_(a,r):M→Λ_N; this fixed index makes the tested target's external product
literally componentwise even when two factors use the same tag.

For a realized open graph rule F obeying the stated field/test naturality,
form F_h by this actual port evaluation, keeping every internal contraction
and its once-used closed-fermion-loop sign. Define

```
F_c^h(Γ)=(⊗_(v∈VΓ)b_v) F_h(Γ) ∈ 𝓔′(M^(VΓ))⊗Λ_N.
```

Prove this equality by the existing smooth-multiplier distribution operation,
including input tensor profiles and every differentiated test slot. Its
support lies in ∏_v supp b_v; derivatives and diagonal insertions retain
compactness. On fixed graph/field/jet and compact-support stages prove the
continuity estimates from the compact finite-order distribution bound and
Leibniz estimates on b_v and h. Prove external-product, bijective-relabeling
and **exact** total-U equivariance. The derivative of b_v is part of the
input action. These are the actual hypotheses for the free extension.

At a fixed coefficient stage Λ_M use N≥M and its canonical embedding
Λ_M→Λ_N. For each such (N,h), V_N(I)=𝓔′(M^I)⊗Λ_N is RQFT5's compact
distribution algebra. Prove compatibility under increasing coefficient/test
stages and use RQFT5's filtered algebraic-colimit convention. Every finite-set map acts by coordinate pushforward and every
external product includes coefficient multiplication/Koszul transport.
The finite-dimensional coefficient stage uses the finite product topology;
𝓔′ uses RQFT5's distribution-density convention and compact-convergence dual topology. Consume CK K5a.SmoothSectionMontel for its equality with the strong dual topology (uniform convergence on bounded subsets of C∞); compare scalar distributions using the fixed Euclidean density. Keep this scalar/density comparison explicit.
Prove continuity of all-map pushforward by its C∞ pullback transpose and
fixed-stage external-product estimates. The full tested target is the
product of these distribution algebras over all allowed N,h, with operations
componentwise and the product locally convex topology. Continuity into it
means continuity of every tested component; no uniform bound over h is
asserted. Take the final source topology over finite graph/field/jet and
compact-support stages for this realization comparison, separately from
Free's algebraic universal property.

Apply RQFT5.FiniteOddPolarization to separate finite universal open coefficient tensors before complete integration, modulo exactly the declared relations. For its distribution-valued realization application use independent tagged profiles
`h_j(x)=z_j exp(i⟨t_j,x⟩)` on a neighborhood of the compact coefficient
support, with a smooth cutoff equal1 there. Extract the product of the z_j,
use independent exterior generators for odd slots, and multiply out the known
nonvanishing exponential. The resulting finite polynomial in the independent
real frequencies t_j has the original distribution coefficients; its vanishing
for every t_j forces those coefficients to vanish. Prove the polarization/
Koszul multiplicities and cutoff independence, or the equivalent finite-jet
interpolation proof. Take N sufficiently large for every finite odd degree.
This separates a fixed graph's open distribution coefficients; it does not
assert faithfulness of a numerical graph realization, or injectivity after
passing to integrated divergence coinvariants. At h=0 only terms containing
remaining **open** field generators vanish. Already contracted internal
Wick terms and vacuum diagrams survive.

The proved morphism F_c^h extends uniquely by the actual free formula
`[f,D⊗Γ]↦D (F_f)_*F_c^h(Γ)`. Thus non-surjective maps, including complete
integration, are defined on every element of this switched target. For
unswitched translation-invariant F∈𝒟′ no such all-map realization is
asserted. Consume SourceProductAdapters for the separate per-component
Fourier restriction/proper-support/adiabatic comparisons. Compact testing
and subsequent restriction-removal are different theorems.

For the raw free endomorphism require C to be derivative-compatible modulo
DiagonalAnnihilator, graph/relabeling-natural and spectator-natural for the
declared smooth coefficient/open-test inputs. In the balancing relations
prove the two Sweedler terms from a tangent representative cancel: an outer
block-tangent operator after diagonal pushforward equals the block derivative
on the input, while the antipode contributes its negative on that input.
Prove this for every polynomial order and slot before claiming exact
U-equivariance. Also prove the external-product and relabeling laws.
Only then extend the graph map to an endomorphism 𝔄_C of Free(Fey₀ᶜ).
Other raw families retain CourseRawComparison's larger-map action.
The distributional outer U leg acts **after** diagonal pushforward.
The other leg's antipode acts on the original labels before contraction.
Retain each field tensor once through the typed coevaluation.

Prove the intertwining of this endomorphism with each tested realization,
including b/h derivatives inside the labels. With the pinned prescription
left action, `F̃_c^h∘𝔄_C=A_C(F_c^h)` and
`𝔄_(C★D)=𝔄_D∘𝔄_C`. In Free(·)(∅), empty-fibre balancing evaluates the
outer leg by ε, so `(ε⊗S)Δ=S` yields C^loc. Compact realization compares
this algebraic identity with actual integration by parts. With retained
slots use the full coproduct. This is the precise free-carrier theorem
consumed by ConnectedSubstitution; it does not extend the nonmultiplicative
Wick sum by a distribution-algebra adjunction.

**RQFT6.GaussianLegendreRealization — selected Green kernels and symbolic coefficients.**
Consume the symbolic RQFT5 Z/W/Γ and connected/1PI identities on completed Fey,
and SwitchedRealization's actual graded all-map morphism F_c^h. Fix the RQFT1 Green
kernel and its operator normalization: if E inverts P=□+m², the source quadratic
operator A=−P/2 uses Δ=−2E. Use its symmetric part for the commuting quadratic
source pairing, with the domain comparison proved. Fix the source/solution or
boundary/quotient domain and covariance, the interaction
and compact profile data, and the product/controlled-extension prescription used by F_c^h.
For each finite perturbative coefficient prove compatibility of F_c^h with the declared
contractions, external tensors, integration and normalization before transporting the
symbolic identities to distribution-valued coefficients. Removing compact switching or
regulators requires the specified proper-support/Fourier-restriction and IR limit
hypotheses; it is not a consequence of the combinatorial Legendre theorem. A numerical
inverse-Hessian/functional Legendre statement additionally needs an actual inverse on
its selected tangent/source domain, or the specified kernel quotient and boundary
condition, plus the requisite composition continuity. Without that input the exported
result remains the realized formal graph-coefficient identity; it is not an inverse of
KG on the whole field space or an infinite-dimensional path-integral construction.
This consumer has no role as a prerequisite of DiagonalStabilizer.Core.

**RQFT6.ConnectedSubstitution — exact local interaction and source transform.**

Consume RQFT5's scalar-base graded field-jet Hopf algebra A and LVF1's
symmetric jet indices. Each linear jet generator is primitive. Write
`D_μu_(a,I)=u_(a,I+e_μ)` for the positive total derivative on field jets,
and use `D_μ=+∂_(x^μ)` on distributions. These two actions are related by
formal transpose, not by assigning the same sign to the two pairings.
For CourseRawComparison's typed coefficient
`C_γ∈U^V⊗Multilin(T_in,T_out)` define
`C_γ^loc=(S_(U^V)⊗id)C_γ`; the identity retains the coefficient/port map
once. The native enveloping antipode sends each
D_(v,μ) to −D_(v,μ). Prove this transpose dictionary, including input
labels, densities and the raw coproduct/antipode allocation. A degree-one
normal delta derivative acquires a minus sign on the residual field jets.
The source p16's product of two derivatives has even total order and does
not settle this odd-order sign.

Consume **RQFT6.SwitchedRealization** for the actual compact all-map
morphism F_c^h and its full separating open-tensor test family. Work first
in Free(Fey₀ᶜ)(∅): the outward operator acts after diagonal pushforward,
and empty-fibre balancing applies ε to that leg. Thus `(ε⊗S)Δ=S`
gives the local transpose. With retained slots keep both coproduct legs.
Apply the tested distribution-algebra morphism only after the algebraic
identity, then prove its compact integration comparison. The Wick map is
the explicit Wick^c of RQFT5.WickCompact, transported from W_c to A_c by Ξ_c⁻¹; its nonmultiplicativity
prevents a distribution-algebra adjunction argument for that map.

The source p15–16 and p78–79 sketches are provisional. Page80 corrects the
missing U-action, p82 uses the free distribution algebra/coproduct, p83
adds the antipode, and p87 explicitly acknowledges the noncompact integration
problem. Keep the obscured p82 factor and p85 summation uncertain. The
p83 homomorphism claim is interpreted by the precise RQFT5 corolla/Wick
distinction. The p86 elementary-source and p87 exponential statements
require the full graded flag and compact realization theorems below.
Consume the actual counital cocommutative **Hopf** translation algebra;
its native HopfAlgebra module supplies both convolution inverse identities.
The source's “any coalgebra” statement has the separate RQFT5 qualification.

Use even local interaction weights with the declared Grassmann signs.
Unintegrated density representatives lie in A_B=B⊗A for B=C∞(M,ℂ).
Their switched subspace A_c=C_c∞(M)⊗A is a D-stable nonunital algebra;
its tensor-indexed family has the empty-index unit. Total D differentiates
coefficients and jets. The field coproduct acts on A, while each coefficient
b stays once in the residual vertex factor. Integrating switched weights
uses SwitchedRealization; the unital ring B alone supplies no compactness.

Fix a finite or coefficientwise locally finite interaction family with even
formal marker ζ_V of positive order in L. It counts original interaction
vertices and is not multiplied once again at a contracted effective vertex.
Each source insertion has positive order in independent source markers η,
even when its field degree is0; alternatively give it positive ζ_V order.
Odd physical sources use the declared Grassmann coefficients so the whole
weight is even, with an additional positive counting marker if required.
Use the corresponding multigraded formal series and the even marker ζ_E
for counterterm-contracted edges. At each fixed original vertex/source/
edge coefficient the input monomials, jet orders and connected graph
incidences are finite; each fixed C_γ is a polynomial. Prove this raw
finiteness directly. It does not consume nominal/Taylor budgets, and a
loop bound alone does not imply it. The later H_𝓛/H_𝓕 lift specialization
consumes the already defined **total** degree q=deg_Pβ+d_∂(γ,c) and its
proved insertion/nominal/Taylor bounds without redefining the raw sum.

Fix the free quadratic model and its propagator in F. Keep field-degree0,
1 and2 terms among the interactions; generated quadratic terms are vertices,
not a silent change of the free propagator. Keep vacuum coefficients in the
unnormalized generating series. Its unit-constant vacuum factor can then be
divided out to obtain normalized Green functions; prove that comparison.

For unswitched translation-invariant amplitudes consume
**RQFT6.SourceProductAdapters**, the single owner of the per-connected-
component conservation-delta/retained-slot Fourier restriction and vacuum
obstruction, including its positive cutoff-limit theorem under its stated
Fourier continuity hypothesis. Use its actual proper-support/wavefront/
adiabatic conditions. A vacuum-series quotient alone supplies neither an
undefined δ(0) value nor an unswitched all-map distribution-algebra morphism.

If the physical weight is exp(i∫ℒ_int/ℏ), take `L=(i/ℏ)ℒ_int` and convert
the answer by `ℒ'_int=(ℏ/i)S_C((i/ℏ)ℒ_int)`, with the already fixed propagator
factors. All coupling factors occur once in the vertex weights; C is evaluated
on coupling-stripped graph decorations.

Let `π₁:A→A_[1]` be the projection to the linear field-jet summand;
A_[1] is distinct from every source insertion/marker. At a
vertex v with d incident halfedges in γ, count a self-loop twice, order those
halfedges temporarily and define the actual splitting

```
Split_d(bP) = b · (π₁^⊗d ⊗ id) Δ_A^(d+1)(P)
           = Σ (p_(v,h₁)⊗…⊗p_(v,h_d)) ⊗ r_v .
```

Here b is in r_v, each p_(v,h) is a linear jet, and r_v∈A_B. For d=0 this
is the identity residual factor. Reordering ports uses exactly the graded
symmetry; prove independence after contraction. For a finite connected **bare**
halfedge multigraph γ, including self-loops and the one-vertex no-edge graph,
let W_C(γ;L) be the finite sum obtained by applying Split_(deg v) to a copy
of L at every vertex, evaluating `C_γ^loc` multilinearly on all the incident
linear jet labels, acting by the resulting U^V operator on `⊗_v r_v`, and
then multiplying the residual factors in A_B. In each summand C_γ means
C on γ with that actual field/jet assignment, rather than an assignment-
independent graph coefficient. For a simple tensor operator
`⊗_v P_v(D)` the last operation is precisely `∏_v P_v(D)r_v`, with the
fixed Koszul order. This equation specifies the operation for every summand;
it is not an instruction to assign unspecified diagram weights.

Define on representatives and then prove descent to local functionals
modulo `Σ_μD_μ(A_B)` coefficientwise:

```
S_C(L) = Σ_[γ bare connected] ζ_E^(|Eγ|) / |Aut γ| · W_C(γ;L).
```

Here Aut γ is the automorphism group of the **bare halfedge multigraph**:
it preserves incidence and any structurally distinguished labels, including
parallel-edge permutations and self-loop flips. It is taken before field,
coupling or source assignments, since W_C sums **all** splits of the full
weight at every vertex. Work in characteristic0 and prove port-order
independence and the graded orbit-stabilizer theorem. Equivalently sum over
decorated assignment orbits, restrict W_C to that assignment and divide by
its decorated stabilizer. Prove this equivalence; the all-splits numerator
cannot also use field-preserving denominators. Labelled vertices/halfedges
with their exact factorials provide the third equivalent formula. The
cut/substitution bijection retains every residual halfedge's original
endpoint. Each coupling/tensor and contracted edge is counted once.

For `L=λφ⁴/4!`, Split_d contributes `λφ^(4−d)/(4−d)!` after its d linear
ports, for d≤4. Thus the one-vertex one-self-loop coefficient is λ/4 times
the scalar contraction and φ²; the double-self-loop vacuum coefficient is
λ/8 times its coherent double contraction. The two-vertex two-parallel-edge
coefficient is λ²/16 times the corresponding local operator acting on
`φ²⊗φ²`; do not infer an unrecorded incidence for the source p16 sketch
from this separate explicit example. Prove these weights by the same formula.

Include the mixed-even-field acceptance case `L=gφ²ψ²/4` with one
self-loop. Bare |Aut|=2 gives
`(g/4)(c_(φφ)ψ²+c_(ψψ)φ²+4c_(φψ)φψ)`.
Derive it independently from labelled field-slot pairings. Combining all
ordered color splits with decorated denominators doubles the mixed term.
The two-color and odd-field tensor identities retain their full graded
orbit proof; a single-field quartic checker cannot establish them.

Own the action-Ward/descent theorem before treating S_C as a map on local
functionals. Expand `Split_d(DP)` by coderivation: total D acts on every
port and the residual factor. Raw field/derivative compatibility becomes
the corresponding negative operator relation for C^loc, modulo the diagonal
annihilator. The port terms cancel the residual derivatives, leaving a total
divergence. A tangent polynomial `Σ_vD_(v,μ)` becomes D_μ of the multiplied
residual factors. Prove this for every polynomial order and switching
coefficient, with the raw insertion cancellation already owned above. The
quotient by divergences is a vector space of local functionals, not an algebra
ideal; form the products first and prove representative independence afterward.
Raw lifts differing by DiagonalStabilizer.Core's kernel give the same S_C on this
quotient. Prove that assertion by graph induction, not by discarding tangent
operators before they act.

Define the coefficientwise graph-valued exponential using the positive
interaction/source grading above, the explicit balanced Wick^c map of RQFT5.WickCompact through Ξ_c⁻¹ on A_c, and the all-map integration into Free(Fey₀ᶜ)(∅). Its tested realizations
are the generating functionals Z_F^h(L+J), with ordinary outer Wick edges
unmarked by ζ_E. The marker ζ_E records only counterterm-substitution edges.
The h=0 member is vacuum closure of the remaining open generators; internal
contractions and vacuum diagrams remain. Use all tested members/polarization
for the universal open identity and extract physical Green coefficients by
arbitrary compact source-tensor tests. Keep the 1/Aut convention just proved.

Define `C_ζ(γ)=ζ_E^(|Eγ|)C(γ)`, multiplicatively on components, with the
edgeless identity unchanged. Edge additivity along a spanning cut proves
`(C★D)_ζ=C_ζ★D_ζ` and `(C⁻¹)_ζ=(C_ζ)⁻¹`. The mandatory bridge is

```
Z_(A_(C_ζ)F)^h(L+J) = Z_F^h(S_C(L+J)).
```

Prove it first as the universal graded diagram identity in the balanced
free carrier by the full nested spanning-cut/substitution flag bijection,
then apply each compact tested morphism. Do not deduce the universal identity
from equality in one numerical realization. It includes every component
meeting source vertices. After proving polynomiality in ζ_E at each fixed
original interaction/source coefficient, specialization ζ_E=1 gives the
unmarked physical bridge. Prove that polynomiality from the finite original
field slots and monomials; each contraction consumes its slots once, even
in iterated substitutions. Without that proof retain the formal marker.

Put `G_F^h(L;J)=Z_F^h(L+J)/Z_F^h(L)` and
`J_C(L,J)=S_C(L+J)−S_C(L)`. Their constant vacuum coefficient is a unit.
Prove
`G_(A_(C_ζ)F)^h(L;J)=G_F^h(S_C(L);J_C(L,J))`.
Use derivative-compatible modulo-annihilator, spectator- and bijection-
natural raw families and the full all-spanning carrier. No typed1PI cut
rule replaces it. Other raw families have only their larger-map action.

For the class-preserving raw lifts of H_𝓛 or H_𝓕, use the proved bridge
conditions and raw-to-typed reduction. If every external insertion is a
linear elementary field source, any connected positive-edge cut meeting that
source has a bridge. Its relative counterterm is zero; the edgeless term is
the identity. Prove `S_C(L+J)=S_C(L)+J` **in the divergence quotient** in this subcase and hence

```
Green(A_(C_ζ)F,L)=Green(F,S_C L).
```

Composite sources need the full transformed-source equation, including its
contact and nonlinear-source terms. Retain both statements. Fixed/variable
tadpole, larger/factorizing, non-saturated, articulation and all open-port
classes use their actual class-preserving lifts and previously proved
insertion/partition-stage theorems. The universal all-connected formula does
not create a second 1PI coproduct or remove the larger class's free articulation
coordinates.

Prove composition by the groupoid of nested spanning cuts and substitutions,
with exact automorphism stabilizers, antipode transposes and the iterated
primitive coproduct. For the existing left-action convention
`A_(C★D)=A_C∘A_D`, prove, on the completed local-functional carrier,

```
S_1=id,  S_(C★D)=S_D∘S_C,  (S_C)^(-1)=S_(C^(-1)).
```

The edge marker controls formal inverses even for one-vertex tadpoles.
These equalities are universal identities; agreement of one numerical
prescription's Green functions is not by itself a faithfulness proof.
Consequently `(F,L)↦(A_(C_ζ)F,S_(C^(-1))L)` is a left action and preserves the
full Green output. With sources its exact third component is
`J↦S_(C^(-1))(L+J)−S_(C^(-1))(L)` alongside the transformed L. Prove
this source action preserves the normalized generating output and prove
its identity, inverse, composition and switched
integral invariance. Every cutoff-removal or adiabatic comparison retains its
separate analytic assumptions; no convergence of a full perturbation series
is asserted by the formal graph identity.

**RQFT6.HyperfunctionAlternative — full graph spaces and translation quotients.**

Consume Hyperfunctions HF3–HF5 after the distribution and controlled-extension
foundation. For every finite graph vertex set V, its actual configuration
space E=M^V, every open O⊆E and distribution u on O, construct some
b∈B(E) restricting to ι(u), with the complete supported-hyperfunction ambiguity.
Include arbitrary open inclusions and the empty/one-point vertex cases.
This is the course p2 unrestricted alternative; the scaling, wavefront,
causal, local/covariant and graph-prescription distribution theorems above
retain their full separate targets.

For translation-invariant data also prove the quotient-preserving adapter.
For r=|V|>0 identify E/diag M with the orthogonal complement Q of the diagonal
in the fixed Euclidean configuration space. Let p:E→Q be orthogonal projection,
`Y=r^(−1/2)Σ_v x_v` and q=p(x). The map x↦(Y,q) is an isometry, so
`dx=dY dvol_Q`. Fix physical diagonal translation Haar da from M: x_v↦x_v+a.
Its Weil quotient measure is `dμ_Q=r^(4/2)dvol_Q=r²dvol_Q`, since Y=√r a
on the diagonal. In general base dimension n the factor is r^(n/2).
For any chosen root, coordinates a=x_root, z_v=x_v−x_root have determinant1;
prove `dμ_Q=∏_(v≠root)dz_v` under that quotient identification, while
`dvol_Q=r^(−n/2)∏dz_v`. Define a diagonal delta-density by
`⟨i_*da,φ⟩=∫_Mφ(a,…,a)da` and transport it with these same factors.
Prove the exact Jacobian/dual-test comparison rather than identifying the
physical Haar quotient with inherited orthogonal volume.

Show a translation-invariant distribution on p⁻¹U, U⊆Q open, is uniquely
p*u_Q, using a compact centre test of integral1 and the actual density
transpose. Extend u_Q to b_Q∈B(Q) by HF5. HF3's analytic-submersion pullback
then gives p*b_Q∈B(E), restricting to ι(p*u_Q). In a product splitting this
pullback is `1⊠b_Q`; prove independence of the splitting and the root,
restriction/support identities and the distribution-embedding diagram.
The scalar pullback and its density version use their respective Jacobians.
The r=0 configuration/quotient is a point and is handled directly. A
hyperfunction extension may have non-distributional supported ambiguities;
its existence alone supplies no controlled distribution product or canonical
extension choice.

For the p64 analytic-functional comparison consume HF5's convergent
factorial-square point functional. RQFT0 consumes K5a’s single-owner theorem on failure of the literal
1/n! series’ distributional partial sums. HF5 separately owns failure of
ordinary analytic-germ convergence and the distinct signed factorial-square
comparison.

### RQFT6 invariant theory spaces, renormalization group and Ward identities

Consume **RQFT6.ConnectedSubstitution** for the actual interaction/source map, its contravariant composition law, and the invariant paired inverse action on prescriptions and Lagrangians. Prove that action with the specified counterterm group, field-algebra action and graph contraction. Use characters of H_𝓕 on 𝓕 or H_𝓛 on 𝓛, and their fixed-tad quotients for fixed data, after the full natural typed defect-ideal and insertion proofs above; prove preservation of that exact class and use inverse characters for the reverse comparison between realized prescriptions. For a specified continuous spacetime/internal symmetry G acting on the field algebra, diagonals and test spaces, prove existence of G-equivariant prescriptions and transitivity of renormalizations commuting with G under exact averaging/cohomological hypotheses; for a compact internal G use Haar averaging, and for noncompact spacetime symmetry own the equivariant extension obstruction and its vanishing conditions. The finite-jet connected Lorentz case is supplied by the defect/Whitehead adapter above under its Lorentz-stable-submodule and invariant-affine-set hypotheses; it does not remove obstructions for other groups or incompatible constraints. Borcherds p.119 Q1–2 and pp.120–121 ask for these results; they are theorem targets with hypotheses, not assumed properties of every group.

**RQFT6.InvariantInteractionCarrier — the finite source parameter spaces.**
For its prescription-class/interaction application consume ClassQuotients and ConnectedSubstitution as in the preceding action theorem. The finite vector-space construction below is algebraic; stability retains its separately stated hypotheses.
Fix the ground field k=ℝ or ℂ, finitely many field components and jet
orders, and a specified coefficient algebra A₀ finite-dimensional over k.
For anti-linear complex symmetries use the underlying real carrier and
state the real dimension. At a fixed perturbative component, identify its
actual coefficient space; a finite rank over a regulator field is a separate
dimension statement from finite dimension over ℂ.

Construct the graded-commutative polynomial jet carrier over A₀, with its
even polynomial and odd exterior generators. Either impose an explicit total
polynomial degree bound, or assign each of its finitely many field/derivative
generators a rational weight w_a≥δ>0 and impose weight≤B with B≥0. In the
latter case specify the coefficient grading as well. With coefficients of
weight0, every monomial has total field degree≤floor(B/δ). More generally,
for a finite homogeneous basis of A₀ let β_min be its least coefficient
weight and put B₀=B−β_min. If B₀<0 the carrier is zero; otherwise every
monomial has total field degree≤floor(B₀/δ). Prove finiteness by this
monomial basis; for m even and n odd generators the dimension is at most
`dim_k(A₀)(floor(B₀/δ)+1)^m 2^n`. This includes negative engineering
weights of couplings in their finite perturbative coefficient stage. The
total-degree bound gives its own finite carrier. Derivative-order truncation alone supplies neither bound. In the
free even zero-weight example x, every x^j has weight0; arbitrary smooth base
coefficients also fail the finite coefficient hypothesis. Preserve these
examples as the exact limits of the finiteness theorem. Coupling and
regulator coefficients belong to their declared coefficient stage, rather
than being silently counted as positive-weight field generators.

Let W be the selected bounded density carrier; in the weight-bounded case
write W_B=W for its specified bound B and coefficient/jet stage. Let Div
be the declared total-divergence subspace in the full local-density space. Use the actual image
`W/(W∩Div)` in the local-functional quotient. Use k₀=ℝ on the underlying real space if G contains anti-linear complex symmetries, and k₀=k otherwise. For a specified G preserving the declared coefficient/jet and degree/weight filtrations, prove stability of W and Div over k₀, construct the fixed subspace and state its k₀-dimension. A finite complex carrier of complex dimension d has underlying real dimension2d before taking invariants. The preceding arbitrary positive weights and bound B prove **finiteness only**, not counterterm stability. Prove any claimed stability for its actual character class and coefficient-stage quotient. The sufficient finite-stage engineering theorem is FiniteEngineeringClosure below; arbitrary W_B and total-degree cutoffs remain construction-only unless their own stability is verified. Retain the full unbounded interaction carrier when no such theorem applies.

At the raw density level, retain two limits of stability. Give φ weight1
and use the finite coefficient stage k[g]/(g³) with wt(g)=0. Two gφ⁶
vertices joined by two parallel scalar edges have eight external φ ports,
L=1 and ω=0; a permitted nonzero q=0 local counterterm coordinate yields
g²φ⁸. Thus inputs in W_6 need not land in W_6. Separately, for a φ⁴
bubble use the finite even coefficient stage k[a]/(a²), wt(a)=2.
A residual coefficient a with q=ω=0 is permitted by
the nominal bound alone but gives aφ⁴ of weight6, outside W_eng; the
extra coefficient budget in FiniteEngineeringClosure excludes it. These
are algebraic allowed-character witnesses, not assertions that a physical
graph has a nonzero divergence coefficient or that a class survives every
later Div/symmetry quotient.

**RQFT6.InvariantCountertermGroup — the actual commuting characters.**
Fix k_H=k, the Hopf scalar field ℝ or ℂ of the chosen typed construction.
Specify one H_ad: H_𝓛, H_𝓕, or its already proved fixed-tad quotient,
with the exact nominal, field/derivative and normalization relations used
by the prescription class. Specify a complete graded-commutative unital
coefficient algebra A_ct over k_H, its formal filtration, and the continuous
even characters `Char(H_ad,A_ct)` with their prescribed unit/normalization.
Additional coefficient equations enter this group only after their Hopf-
ideal/convolution/inverse stability is proved. The defining data do not
mention preservation of an interaction family V_*.

For the given action of G on fields, jets, diagonals, coefficients and test
spaces, construct the induced parity-preserving action g_H on decorated
graphs and H_ad and the action g_ct on A_ct. Prove compatibility with
products, cuts, coproduct, counit, antipode, completions and each defining
ideal. A fixed-tad quotient uses G-invariant fixed tadpole data and its
proved stable ideal. For a complex model both actions may be semilinear
through the same specified homomorphism σ:G→{id,conjugation}; for a real
model σ=id. Keep the original Hopf scalar field. Underlying real parameter
spaces below do not replace a complex comultiplication by a real one.

Define the character action and subgroup by

```
(g·C)(h)=g_ct(C(g_H⁻¹h)),
Γ_*^G={C∈Char(H_ad,A_ct): ∀g∈G, g·C=C}.
```

Matching semilinearity makes g·C a k_H-linear character. Prove
`g·(C★D)=(g·C)★(g·D)`, preservation of the unit character, and
`g·(C∘S_H)=(g·C)∘S_H`; hence Γ_*^G is closed under convolution and
inverse. Prove the induced action on the declared full admissible
G-equivariant prescription class. The star subscript records the chosen
model/H_ad/coefficient data; Γ_*^G is not defined as the subgroup preserving
V_*. Its uniform interaction-family preservation is the following theorem.

**RQFT6.FiniteEngineeringClosure — a sufficient stable finite stage.**

Use four-dimensional engineering field/derivative weights, finite field and internal tensor species, and the actual rational edge/numerator bounds with `r_e=4−2Δ_e` (second-order scalar/covariant-vector/ghost fields Δ_e=1, Dirac Δ_e=3/2). For each bare homogeneous vertex let `Δ_v=d_v+Σ_(ports at v)Δ_field`. Its physical coefficient a_v belongs to the declared finite homogeneous coefficient stage, with weight wt(a_v). Define W_eng as the span of **all** allowed monomials of total engineering weight≤4 in that stage, including vacuum, linear and quadratic terms. This is a finite carrier by InvariantInteractionCarrier, even when the finite coefficient stage has negative weights. When W_B uses the same field/jet generators, these engineering field/derivative weights and the same coefficient grading at the same stage, W_eng⊆W_B for B≥4. For other positive weight assignments no containment is asserted: w(φ)=10 and B=4 exclude φ although its engineering weight is1. Stability of those engineering ambient W_B for B>4 still requires its own proof. Require G to preserve the actual grading and compatible constraints.

Strip and retain each product of input coefficients `∏_v a_v` exactly once in ConnectedSubstitution. A homogeneous residual counterterm coefficient `c_(γ,c,β)` is the coefficient left **after** that product is removed. Restrict the character class to the explicit budget
`wt(c_(γ,c,β))+q_(γ,c,β)≤ω_γ^nom`,
in addition to its nominal/class/normalization relations. The extra coefficient weight cannot be inferred from q≤ω alone. Zero coefficients satisfy the condition vacuously. Coefficient-stage truncation is by an actual homogeneous coefficient ideal compatible with these operations, and perturbative truncation uses the retained positive vertex/coupling/loop filtration. Prove its stability under the coefficient maps, the connected substitution, convolution and inverse before descending; an arbitrary finite subspace or quotient is not asserted stable.

For a connected γ the incidence count gives
`ω_γ^nom=4−Δ_ext−Σ_(v∈γ)(4−Δ_v)`,
where Δ_ext is the sum of the un-differentiated external field dimensions and q counts **all** output derivatives. For input monomials in W_eng, `wt(a_v)+Δ_v≤4`, so the complete output weight satisfies
`wt(c)+Σ_v wt(a_v)+q+Δ_ext≤4+Σ_v(wt(a_v)+Δ_v−4)≤4`.
This proves the connected interaction term, with its full derivative transpose, lands in W_eng. ConnectedSubstitution’s source-slot operations retain their independently specified larger source carrier; they are not asserted to lie in W_eng unless the same complete weight estimate is separately verified for that source class. A normalized interaction coefficient g_v with `[g_v]=4−Δ_v` is the equality case, not a required identification of every actual coefficient weight. In particular negative engineering coupling weights are permitted at a finite stage. Prove the estimate for every multilinear component and under the actual Cauchy–Leibniz insertion. The typed budget identity adds the residual budgets under nested cuts; therefore this coefficient-budget character class is closed under convolution and, by connected induction, inverse. Use its stable coefficient quotient and ConnectedSubstitution’s positive-order completion to pass to the chosen finite perturbative stage. Only after G/Div/class compatibility is proved take the invariant local-functional image. Raw source families and counterterms outside this budget retain their larger/unbounded carriers.

This is not an all-orders finite operator-family theorem: negative coefficient weights can expose new field monomials as the perturbative stage increases. UniformFiniteParameters must supply one common W_* and its independent all-orders closure, rather than infer it from these finite stages.

**RQFT6.UniformFiniteParameters — one finite operator family at every order.**
InvariantInteractionCarrier’s dimension estimate is a finite-stage theorem. For each claimed
all-orders finite-parameter family, construct one finite-dimensional,
Z₂-graded G-stable space W_* of local density representatives over k₀,
independent of the perturbative cutoff, and its actual invariant image
`V_*=(W_*/(W_*∩Div))^G`. Here k₀=ℝ for anti-linear complex symmetries
and k₀=k otherwise; G preserves parity. Give V_* a homogeneous basis and
superdimension d₀|d₁ over k₀. In the anti-linear complex case W_* is the
underlying real carrier of the declared complex density space.

For this G-fixed-parameter comparison choose a complete coefficient ring
𝓡 over k₀ and specify the compatible completed scalar extension
`A_ct≃k_H⊗̂_(k₀)𝓡`, with G acting through σ on k_H and trivially on 𝓡.
Prove the finite-dimensional invariant base-change comparison identifying
the diagonal invariants of the local-functional carrier after this scalar
extension with `V_*⊗̂_(k₀)𝓡`. If coefficients have a more general G-action,
retain the full diagonal-invariant tensor carrier and construct its
corresponding equivariant parameter functor; the fixed-parameter V_* functor
is used only after its comparison is proved.

Prove that the full independently defined character group Γ_*^G and its
inverses preserve the completion of V_* at **every**
perturbative order, compatibly with truncation. Require the actual nonlinear
descent condition `S_C(L+D)−S_C(L)∈Div` for D∈Div in the declared domain,
and its source-slot counterpart; preservation of Div only as a set does not
supply descent of a nonlinear map. Derive these conditions from
ConnectedSubstitution's derivative-compatible and local-functional comparison,
not from equality in a single tested realization.

With the homogeneous basis O_1,…,O_(d₀+d₁) of V_* and coordinates t_i
of the same parity, prove coefficientwise in the retained formal markers that

```
S_C(Σ_i t_i O_i) = Σ_i f_i^C(t) O_i  modulo Div,
f^(C★D)=f^D∘f^C,  f^1=t,  f^(C⁻¹)=(f^C)⁻¹.
```

The coefficients f_i^C belong to the declared complete coefficient/parameter
ring; they are generally nonlinear formal series. Establish their existence
from uniform operator-family closure, rather than calling an arbitrary
finite-dimensional truncation stable. For the sufficient four-dimensional
power-counting case use the engineering grading proved at the start of RQFT6:
second-order scalar, covariantly gauge-fixed vector and ghost fields have
degree1, including odd ghosts, Dirac fields have degree3/2, and each derivative
has degree1. Specify finite field species and finite dimension-zero internal
tensor coefficients. All couplings are separate formal coordinates with
`[g_v]=4−d_v−Σ_(ports at v)Δ_field≥0`. Require actual nominal edge UV
orders −2 for every second-order edge and −1 for every Dirac edge. In the rational Euclidean model use `r_e=2Σ_a s_(e,a)−n_e` on each physical edge, with its fixed common-denominator tensor numerator and positive factors from RegulatorContinuation. In particular a massive covariant R_ξ vector with ξ>0 has
`[(k²+ξm²)δ_(μν)−(1−ξ)k_μk_ν]/[(k²+m²)(k²+ξm²)]`,
so n_e=2 and Σ_a s_(e,a)=2 give r_e=2 (the unregulated ξ=1 expression also reduces to the single-factor form). This is not a single P/D^s with one mass. Partial fractions can destroy the visible UV cancellation; do not assert order−2 for each separated summand. Landau ξ→0, massless removal and Lorentzian boundary values retain their separate limits. Use the routed-subgraph numerator bound
`deg_γP≤Σ_(v∈γ)d_v+Σ_(e∈γ)n_e` from the engineering API. Include the
covariant gauge fixing and all numerator hypotheses; a second-order kinetic
operator or an arbitrary positive assignment of weights is insufficient.

Derive for each connected subgraph γ the incidence identity
`ω_γ^nom=4−E_B−(3/2)E_F−Σ_(v∈γ)[g_v]`.
Here E_B counts its external second-order scalar/vector/ghost ports and E_F
its external Dirac ports, independently of Grassmann parity. Combine the
proved total jet budget q≤ω_γ^nom with the antipode/local transpose:
q counts all derivatives landing on the output fields, including raised
boundary allocations, so the output density has engineering degree
`q+E_B+(3/2)E_F≤4−Σ_v[g_v]≤4`.
For negative ω_γ^nom the allowed jet space is zero. The residue coupling
therefore has degree `4−Δ_output≥Σ_(v∈γ)[g_v]≥0`, so contraction preserves
the nonnegative-coupling condition. Prove this estimate under nested typed
insertion and the full Cauchy–Leibniz transport. Take W_* from
the finite span of **all** allowed density monomials of degree≤4, then
prove G-stability, descent modulo Div, the symmetry/Ward relations and
closure under every character in the specified Γ_*^G. Enumerate its actual
invariant quotient, retaining vacuum, linear and quadratic interactions.
Gauge/BRST constraints require their stable coefficient equations and
anomaly-obstruction hypotheses; none is inferred from power counting.
A massive Proca propagator with leading UV order0 must use its actual order
in the generic API; this sufficient finite-family theorem does not apply to
it. Prove a separate uniform closure when available, and retain the full
unbounded interaction/source carrier otherwise.
For a model outside that case prove its own uniform closure or keep its full
infinite operator family. In particular, with wt(g)=−1 and wt(x)=1,
`A_N=k[g]/(g^(N+1))` admits the bounded-weight terms g^j x^j for 0≤j≤N:
every stage is finite, while new field monomials occur at arbitrarily high
orders. Thus finiteness at each stage gives no all-orders finite family.

Retain ConnectedSubstitution’s positive vertex/coupling and source markers,
together with its edge filtration, until the specialization theorems apply.
Construct the formal parameter functor
`𝒫_(V_*)(A)=(V_*⊗̂_(k₀)F¹A)_even`
on complete separated filtered graded-commutative 𝓡-algebras A of
G-fixed parameters, with topologically nilpotent F¹A and continuous
filtration-preserving base-change maps. For anti-linear G this is a real
formal parameter functor; any complexification must carry its specified
real structure and the comparison with the original semilinear field data.
Its superdimension is d₀|d₁: the coordinate algebra is
`𝓡[[t_1,…,t_(d₀)]]⊗Λ(θ_1,…,θ_(d₁))`, with even t and odd θ and the
declared completion. Purely even parameters see only V_*’s even part.
Construct the coordinate-ring maps from f_i^C and prove naturality,
compatibility with all finite truncations and passage to the inverse limit.

The physical vertex convention `L=(i/ℏ)ℒ_int` does not have positive
ℏ-adic order. Its topological nilpotence comes from the positive
vertex/coupling markers; use the declared Laurent-ℏ coefficient algebra
when required and prove coefficientwise finiteness in those markers.
For the separate coefficient ring `𝓡=k₀[[ℏ]]`, when the coefficient scheme
really takes values there (or after a proved loop reweighting), the operator
supermodule `V_*[[ℏ]]` has rank d₀|d₁ over 𝓡; its Nth coefficient
truncation has k₀-dimension `(d₀+d₁)(N+1)`. For d₀+d₁>0 this completed
module is infinite-dimensional over k₀. This module statement gives no
ℏ-adic nilpotence for the unweighted physical L. Prove the actual comparison
between the chosen ℏ convention and the full graph-marker completion before
forgetting any marker or changing coefficient rings.

The full switched/source action remains on ConnectedSubstitution's enlarged
carrier. Arbitrary switching functions, their derivatives and transformed
composite sources are external data, not extra elements of a finite-dimensional
k-coefficient space. Prove a restriction or coefficient-profile comparison for
the selected finite operator family; do not infer stability of a fixed compact
profile from a constant-coupling power-counting theorem. Every cutoff-removal
or adiabatic comparison retains its separate analytic hypotheses.

Restrict the paired action to 𝒫_(V_*) only after the uniform closure proof.
Prove transitivity on the **declared full admissible G-equivariant prescription
class** using characters in Γ_*^G; transitivity under a larger commuting
character group does not imply transitivity under this smaller class. State
and prove the exact averaging/cohomological or obstruction hypotheses for
this restricted transitivity. Its compatible finite-stage comparisons then
give one all-orders formal theory space and prescription-independent formal
parametrizations, with the source transform retained. For counterterms outside
Γ_*^G use the full unbounded carrier and its existing action groupoid.

**RQFT6.SymmetryStabilizers — exact and local-functional symmetries.**
In the declared field/jet automorphism group, prove compatibility with total
derivatives and density transport and hence stability of Div, before taking
its local-functional quotient action. Construct both
`G_L={g:g·L=L}` and `G_[L]={g:g·[L]=[L]}`. Prove the action on the
local-functional quotient, the subgroup laws and the map G_L→G_[L]. Use
G_[L] for symmetries of the local-functional class and retain G_L for exact
density invariance. This specifies the two interpretations of p119 Q1.

Specify a locally finite linear scaling derivation/endomorphism E on the
polynomial carrier, with rational generalized spectrum; semisimplicity is
not required. Require E to preserve Div and the stated finite filtration
stages and to commute with G. Consume the native generalized-eigenspace API
and construct its filtered/quotient and symmetry adapters. Define
`V_0^gen=Module.End.genEigenspace E 0 ⊤` and
`V_(≥0)^gen=⨆_(μ∈ℚ,μ≥0) Module.End.genEigenspace E (μ:k_H) ⊤`.
Prove the corresponding algebraic direct-sum description under local
finiteness and the rational-spectrum hypothesis, and compare it with
ker E and the sum of ordinary nonnegative eigenspaces. For the locally
nilpotent derivation E=y∂_x on k_H[x,y], compute E(x)=y and E²(x)=0:
x is generalized-zero but not an ordinary zero eigenvector. Prove
preservation of these generalized spaces under the commuting G-action;
rational eigenvalues are fixed by the conjugation in the complex case.
Apply finite-dimensionality only to the declared bounded E/G-stable
coefficient/jet/degree stages. The p120 annotation about generalized
eigenvectors and `≥0` remains literal source uncertainty: no unstated E
is selected and its zero/nonnegative alternatives remain distinct.

 Construct the action groupoid of admissible pairs (R,[L]) with R a
G-equivariant prescription and [L] in its invariant bounded carrier, or in
UniformFiniteParameters’s compatible all-orders formal parameter functor when
its uniform closure hypotheses hold. A
commuting admissible character C gives the paired morphism
`(R,[L])↦(C·R,S_C⁻¹[L])`. Prove the composition, inverse and actual
stabilizer formulas from ConnectedSubstitution, including the source-slot
transform. In the selected counterterm group the pair stabilizer is
`{C:C·R=R and S_C[L]=[L]}`. For the effective relative-character group
on a nonempty universal class satisfying DiagonalStabilizer.Core’s exact
freeness hypotheses, C·R=R already forces C=1; hence the pair stabilizer
and its subgroup Γ_*^G stabilizer are trivial. For raw lifts first pass to
Core’s kernel/effective quotient. After numerical or selected-interaction
specialization, use the actual class-preserving evaluation action: its
prescription stabilizer, and thus the displayed pair stabilizer, may be
nontrivial. Distinguish all these counterterm stabilizers from the
field-automorphism subgroups G_L and G_[L]. The formal
parameter reparametrizations need not be linear automorphisms of V_*. Its Green-function comparison identifies the parametrizations
for prescriptions connected by this specified class; prove the required
transitivity with the same stable-affine, averaging or cohomological
hypotheses. Construct the quotient set and this action groupoid with their
stabilizers. Finite parameter dimension alone gives no moduli-manifold
structure. Keep the source's canonical-theory-space wording tied to these
actual comparison maps.

The final crossed-out p121 fragment is only partly legible: “The main method used to cut down orbits of renormalisations on Lagrangians to finite dimensional size is to use …”; its remainder is illegible/crossed out. Retain it as literal source uncertainty, not a recovered theorem or a missing hypothesis silently supplied by the reader. The precise finite-stage, uniform-closure and action-groupoid targets above retain the mathematical comparison problem independently of that fragment.

For the exact raw-operator, universal-natural and specialized stabilizer statements consume RQFT6.DiagonalStabilizer, with its different evaluation maps and class-preserving groups. Treat the source's restriction to one-particle-irreducible subgraphs and factorization at a one-valent articulation vertex as separate graph/scheme conditions; prove preservation by the selected factorization-preserving character class, and call it a subgroup only after the preceding closure proof. General momentum schemes retain their scheme-determined articulation coefficients and use the larger comparison action above. Model cutoffs as part of the prescription data, prove transitivity/invariance only for the exact admissible cutoff class, and prove cutoff transport preserves the same hypotheses and use ConnectedSubstitution’s paired inverse action, including its source-slot transform, to prove invariance of the Green-function series. Define the renormalization scale family `R_μ`, its composition law, beta function and anomalous dimensions where a differentiable scale action exists. Prove logarithmic scale dependence from extension ambiguities/scaling anomaly under the exact scaling hypotheses. Ward identities survive renormalization only under symmetry-compatible counterterms; state anomaly as the obstruction class and do not assert it vanishes for arbitrary gauge theories.

## Milestone RQFT7 — Euclidean continuation and analytic bridges

Define Euclidean Green functions separately from Lorentzian boundary values. For `−Δ+m²` on `ℝⁿ`, `m>0`, prove the unique tempered fundamental solution has Mathlib-normalized Fourier transform `(4π²‖ξ‖²+m²)⁻¹`; in the source angular-momentum variable `p=2πξ` this is `(‖p‖²+m²)⁻¹` and compute the one-dimensional contour integral `∫ℝ e^(−ixp)/(p²+m²) dp = π e^(−m|x|)/m` for `m>0`. For `m=0`, classify the kernel ambiguity supported at zero in momentum space and the infrared behavior. For the massive Euclidean kernel consume PDE Lane F26's heat-kernel construction and prove `G_m(x)=∫_(t>0)(4πt)^(−n/2)exp(−m²t−|x|²/(4t))dt` for x≠0 and its distributional/Fourier agreement. For every multiindex α, ε>0 and 0<c<m, prove `|∂^αG_m(x)|≤C_(α,ε,c,m,n)exp(−c|x|)` when |x|≥ε. This is exterior rapid decay; it does not assert G_m∈𝒮 globally. In n=1 its derivative jumps at0, and in higher dimensions it is singular there. Smoothness of the momentum multiplier alone is not a decay theorem. Classify the massless ambiguity explicitly as `T=P(∂)δ_0` with P harmonic in the momentum-dual variable, equivalently an added harmonic polynomial in position. In n=1 only affine harmonic polynomials occur; in n≥2 there are harmonic examples of every degree. Under a fixed homogeneity/scaling-degree condition retain only the permitted degrees. Local integrability of |p|^(−2) at0 in n>2 is not a general theorem of IR finiteness for graph integrals. For the massless operator `−Δ`, give the exact radial fundamental solution `|x|^(2−n)/((n−2)|S^(n−1)|)` for `n≥3`, the even `n=1` solution `−|x|/2`, and `−log|x|/(2π)` in dimension two with its harmonic ambiguity; prove the scale ambiguity in dimension two. For a free massive scalar, prove reflection positivity, Euclidean invariance and growth bounds for the Schwinger functions; prove reconstruction of the positive-metric Wightman model using the corrected OS II §IV.1 Theorem `E′→R′`. Use the exact linear-growth input and output estimates of RQFT7.OSGrowth below on the paper's zero-diagonal Schwartz test space. Define that space as the closed complex submodule of `𝒮((ℝ⁴)^n,ℂ)` on which every full Fréchet derivative of every order, including order zero, vanishes at every coincidence `x_i=x_j` with `i≠j`. Use the inherited Schwartz topology, not the LF topology of tests supported away from diagonals; for n=0,1 the coincidence locus is empty and the carrier is the full Schwartz space. Prove the kernel-intersection/membership description, closedness, continuous inclusion, restriction of full Schwartz functionals, and the continuous map into this subspace from compactly supported off-diagonal tests. Prove that compactly supported off-diagonal tests are dense in this subspace: combine a cutoff at infinity with cutoffs near the finite union of diagonals and all-order flatness Taylor estimates in every Schwartz seminorm. Prove that restriction of full Schwartz functionals is surjective by complex Hahn–Banach, with kernel the tempered distributions supported on the coincidence locus; it is not injective for n≥2, as point evaluation at a coincidence shows. These latter tests are sufficient for flatness, not its definition. Prove the exact E0′ estimate for the free Schwinger functions through RQFT7.FreeGrowth, including its single parameter s=6 and factorial-controlled constants. State Euclidean covariance, permutation symmetry and clustering on the zero-diagonal carrier. For reflection positivity use finite sequences of scalar tests f_n whose supports lie in `0<x₁⁰<⋯<x_n⁰`, with `f_0∈ℂ`. Define time reflection `θ(t,x)=(−t,x)` and the antilinear reversed reflection `(Θf_n)(x₁,…,x_n)=conj(f_n(θx_n,…,θx₁))`. Prove `Θf_n⊗f_m` belongs to the required zero-diagonal carrier, and require `Σ_(n,m)S_(n+m)(Θf_n⊗f_m)` to be real and nonnegative. Prove the comparison with the positive-time formulation used by the selected OS theorem under permutation symmetry. Prove analytic continuation/reconstruction, uniqueness up to vacuum-preserving unitary equivalence, and the R0′ output bounds in RQFT7.OSGrowth; mere separate temperedness for each n is not the linear-growth condition. Use E′ as a sufficient condition, without claiming it necessary. Conversely, state the conditions under which Wightman functions continue to Euclidean Schwinger distributions. Treat the massive Euclidean torus case separately: compact support there follows from compactness of the underlying torus, while invertibility of the massive operator removes the constant zero mode; do not transfer either fact to noncompact Minkowski space. A smooth Euclidean momentum-space kernel multiplied by a conservation delta on a hyperplane is a distribution, not an ordinary smooth function on the full space. For the full finite massive Euclidean Feynman-diagram statement on Borcherds p88, consume RQFT6.MassiveEuclideanRegularity with its polynomial tensor-numerator/positive-mass graph class, full real external-momentum regularity, polynomial growth, graph-local scheme comparison and regulated configuration/Fourier identity. Retain one conservation delta per connected component and the separate vacuum-volume normalization when all its slots are integrated. The free-propagator calculations alone do not supply this graph theorem.

**RQFT7.OSGrowth — the precise OS II linear-growth contract.**
Use [OS II, §II (2.1), p284 and §IV.1 (4.1), (4.3), p287](https://doi.org/10.1007/BF01608978).
On the Euclidean coordinate space ℝ^(4n), with its ℓ² norm, define

```text
N_(n,p)(f)=sup_{x, |α|≤p} (1+|x|²)^(p/2) |D^α f(x)|,   p≥1.
```

Here α runs over coordinate multiindices of total order at most p, including
zero; D^α is the ordinary unnormalized partial derivative. Implement the
coordinate carrier with native `EuclideanSpace ℝ (Fin n × Fin 4)` and its
Schwartz space. Construct this continuous seminorm and its restriction to
the closed zero-diagonal subspace above; compare it with the native
`SchwartzMap.seminorm` family at each fixed n,p. The source's subscript
`n·s` is a product: the derivative cutoff is n*s and the weight exponent
is n*s/2. It is not a fixed-order seminorm indexed by a pair (n,s).

E0′ means S₀=1, S_n in the continuous complex dual of that zero-diagonal
space for n≥1, and the existence of one integer s≥1 and positive constants
A,B, independent of n, with positive σ_n satisfying

```text
σ_n≤A(n!)^B,   |S_n(f)|≤σ_n N_(n,n*s)(f)   (n≥1).
```

Both inequalities hold for every n≥1 and every test in that carrier.
Prove the chosen reconstruction theorem from E0′ and the Euclidean covariance,
reflection positivity, permutation symmetry and cluster axioms specified
above. Its output is a unique Wightman theory, with its temperedness,
relativistic covariance, positivity, local commutativity, clustering and
spectrum axioms, and additionally R0′: there are one integer w≥1, constants
C,D>0 and positive ω_n with

```text
ω_n≤C D^(n²),   |W_n(f)|≤ω_n N_(n,n*w)(f)   (n≥1)
```

for all full Schwartz tests. Do not replace this output growth by factorial
growth or assert the E0′ input necessary. Any change to an equivalent
seminorm must track its n-dependent comparison constants through these
growth classes; equivalence at each fixed n alone does not suffice.

**RQFT7.MasslessLimit — the zero-mass limit and its constant subtraction.**
For the Euclidean kernels G_m fixed above, take m↓0 through positive values.
Prove the following comparisons uniformly on every von Neumann-bounded set
of Schwartz tests. These estimates imply convergence in the native
pointwise topology on `TemperedDistribution`; do not identify that topology
with uniform convergence on bounded tests without a comparison.

1. In dimension n≥3, prove G_m→G_0 without subtraction. In Fourier variables
   dominate the multipliers by `(4π²|ξ|²)⁻¹`, locally integrable at0 in
   exactly this range, times a common rapidly decreasing Schwartz envelope.
   Transport the resulting uniform test estimate through native Fourier.
2. In dimension one use `G_m(x)=exp(−m|x|)/(2m)` and prove
   `G_m−1/(2m)→−|x|/2` and `mG_m→1/2` as tempered distributions.
   The bound `|(exp(−m|x|)−1)/(2m)|≤|x|/2` supplies the common envelope.
   The subtracted term is a constant function, hence a multiple of δ_0
   in momentum space. This limit is the even fundamental solution with
   value0 at the origin; it does not prohibit other affine harmonic additions.
3. In dimension two fix R>0 and a vector e with |e|=1, and put
   `c_(m,R)=G_m(Re)`. Prove
   `G_m−c_(m,R)→−log(|x|/R)/(2π)` and
   `c_(m,R)=log(1/m)/(2π)+O(1)` as m↓0, for each fixed R.
   The limit is a locally integrable function; its assigned value at0 is
   irrelevant to its distribution. Derive the difference directly from
   the heat representation:
   `G_m(r)−G_m(R)=(4π)⁻¹∫_(t>0)exp(−m²t)`
   `·(exp(−r²/(4t))−exp(−R²/(4t)))dt/t`, for r,R>0.
   Prove its absolute bound `|G_m(r)−G_m(R)|≤|log(r/R)|/(2π)`
   and evaluate its m=0 integral. Split the heat integral at fixed scales
   and at m⁻² to prove the stated logarithmic divergence of c_(m,R).
   Compare this logarithmic coefficient with the modified-Bessel expansion
   [DLMF10.31.2](https://dlmf.nist.gov/10.31.E2); the heat-integral proof
   above requires no new Bessel-function development.
   Rotation invariance together with vanishing on the radius-R circle
   selects this radial massless representative. A value at one point alone
   does not eliminate the full harmonic-polynomial ambiguity.

In dimensions one and two prove that the unrenormalized G_m has no tempered
limit: for every real Schwartz test f with ∫f>0 its pairing tends to +∞.
On the closed mean-zero test subspace the divergent constants vanish, so
prove the unrenormalized restricted functionals converge there, with the
same bounded-test estimates. In dimension two changing R to R′ adds the
constant `log(R′/R)/(2π)` to the selected limit. Keep this Euclidean
infrared comparison separate from Lorentzian pole prescriptions and from
massless graph-integral convergence. The companion
[MasslessLimitTargets.lean](MasslessLimitTargets.lean) pins representative
bounded-test limits and the one-dimensional divergence on native carriers.

**RQFT7.TorusGreen — the compact Euclidean exception and its zero mode.**
For n≥1 and L>0 let T_Lⁿ=(ℝ/Lℤ)ⁿ, with its flat metric and physical
volume V=Lⁿ. Compare this carrier with native `UnitAddTorus (Fin n)` by
rescaling coordinates; its normalized Haar measure μ has dvol=V dμ.
Use native `UnitAddTorus.mFourier` and its Fourier basis to define
`e_k(x)=exp(2πi k·x/L)` and
`λ_k=(2π/L)²Σ_i k_i²`, k∈ℤⁿ. Prove the derivative, orthogonality and
normalization dictionary. On smooth functions set
`f̂(k)=V⁻¹∫ f(x)e_(-k)(x)dvol(x)`; for distributions use
`T̂(k)=V⁻¹T(e_(-k))`. Thus the Dirac mass has coefficient V⁻¹.

For m>0 construct the unique periodic distribution G_(m,L) solving
`(−Δ+m²)G_(m,L)=δ₀`, with

`Ĝ_(m,L)(k)=1/(V(λ_k+m²))`,
`∫ G_(m,L)dvol=1/m²`.

Prove the distributional Fourier-series convergence and smoothness off0;
pointwise absolute convergence of that Fourier series is not a hypothesis.
Compare it with the heat integral and massive Euclidean periodization,

`G_(m,L)(x)=∫₀∞ e^(−m²t) K_t^T(x)dt`,
`G_(m,L)(x)=Σ_(z∈ℤⁿ) G_m^ℝⁿ(x+Lz)` for x∉Lℤⁿ.

Prove the periodized heat formula and convergence with every derivative on
compact sets avoiding the lattice, using the earlier exterior exponential
bounds for the massive kernel. Construct the convolution inverse on smooth
functions and distributions, and compare its self-adjoint L² realization and
maximal Fourier domain. Positivity of the heat kernel gives full support
T_Lⁿ, which is compact. All projections from finite products of this torus
are proper, so defined distributions admit their partial pushforwards;
coincident products still require RQFT6's separate extension/renormalization
conditions. This is the precise compactness use in source p87.

For the zero-mass limit subtract the constant function 1/(Vm²). Prove
`G_(m,L)−1/(Vm²)→G_(0,L)` in the strong distribution topology, where
G_(0,L) has mean0, coefficient0 at k=0, and coefficient1/(Vλ_k) at k≠0.
It is the unique mean-zero solution of
`−ΔG_(0,L)=δ₀−1/V`. Testing against1 proves that no periodic distribution
solves `−ΔG=δ₀`. For any smooth source f, the Poisson equation is solvable
exactly when ∫f=0; solutions then differ by constants.

Pin the quantitative estimate: for k≠0 and m≥0,

`|Ĝ_(m,L)(k)−1/(Vλ_k)|≤m²/(Vλ_k²)`.

Use smooth-test Fourier decay to prove an O(m²) pairing bound in one fixed
C^r seminorm, hence uniformly on bounded sets of C∞ tests. On the mean-zero
L² subspace, with λ₁=(2π/L)², prove the exact operator-norm difference
between the massive inverse and the zero-mass inverse is
`m²/(λ₁(λ₁+m²))`. On all of L² first remove the constant projection
`m⁻²P₀`. The unrenormalized kernels have no distributional limit, by their
pairing1/m² with the constant test. These finite-volume assertions hold in
every positive dimension; the noncompact infrared thresholds remain those
of RQFT7.MasslessLimit.

For the circle, with d the distance to0 and 0≤d≤L/2, prove the closed forms

`G_(m,L)(d)=cosh(m(L/2−d))/(2m sinh(mL/2))`,
`G_(0,L)(d)=L/12−d/2+d²/(2L)`.

Verify their periodic distribution equations and normalizations, including
the derivative jump at0. For fixed m>0 prove the large-L local limit is
`e^(−m|x|)/(2m)`. For the mean-zero massless kernel first subtract L/12;
its large-L local limit is `−|x|/2`. Specify these local tested limits and
the order of limits rather than identifying the finite- and infinite-volume
normalizations. [`TorusGreenTargets.lean`](TorusGreenTargets.lean) pins the
native characters, mode coefficients and representative limits.

**RQFT7.OSConstruction — the reconstruction maps and their domains.**
For the scalar bosonic E′→R′ theorem selected above, build the following
intermediate constructions on that same zero-diagonal test carrier. Keep
the exact OS II growth hypothesis as input; this proof route does not
replace it by separate temperedness, FreeGrowth or an assumed Wightman
model. The Lorentzian moment-reconstruction theorem in RQFT4 is an
independently constructed consumer interface, not a source of the
Euclidean analytic continuation required here.

1. Let B₊ be the algebraic direct sum of the strictly ordered positive-time
   Schwartz tests above, including degree0. Use the reflected Schwinger
   pairing to construct its positive-semidefinite sesquilinear form,
   radical N, pre-Hilbert quotient and Hilbert completion H_OS, with vacuum
   the degree0 unit. Prove Cauchy–Schwarz, the radical description and
   density of the image of compact ordered tests. This is a quotient by
   the radical of this particular form; no left-ideal property for N in
   the full Euclidean Borchers algebra is assumed. In particular fields
   are not defined by arbitrary left multiplication on this quotient.

2. Construct the right time shifts T_s, s≥0, on the tests and prove that
   they preserve N and descend to symmetric contraction operators.
   Derive contractivity from reflection positivity, Euclidean translation
   invariance, the iterated Cauchy–Schwarz/log-convex estimate and the
   polynomial large-shift bound from each continuous test functional.
   Prove strong continuity and construct the nonnegative self-adjoint
   generator H, with `T_s=exp(−sH)`, including its maximal spectral domain.
   Spatial translations and rotations give strongly continuous unitaries;
   prove their commutation with T_s and construct the joint translation
   spectral measure. Positivity of H alone is not the forward-cone
   spectral condition.

3. For each compact ordered test, define the local action of Euclidean
   rotations mixing time and one spatial coordinate for the angles that
   preserve its support inequalities. Prove the common-support local
   composition, reflection-adjoint, differentiation and quotient-domain
   equations. These local operators are not asserted bounded or globally
   defined for every real angle. Construct their symmetric infinitesimal
   generators on a common dense domain. Own the unbounded-generator
   integration argument here. For the skew-symmetric versions
   A₁,…,A₁₀ of a real basis of the Poincaré Lie algebra, construct a
   common dense invariant domain D in every ordered mixed-word domain.
   For every v∈D prove constants C_v,R_v>0 such that, for every r≥0
   and every ordered index word i₁,…,i_r,
   `‖A_(i₁)⋯A_(i_r)v‖≤C_v R_v^r r!`. Derive these estimates from
   the local Euclidean action; individual analyticity for each generator
   is not substituted for mixed-word control. Establish the Poincaré
   Lie relations on D by continuation of the local Euclidean equations.
   Use UO-E03 for the individual essential self-adjointness of iA_j
   and for the commuting translation family only. Own the noncommuting
   local exponential/BCH proof from these mixed-word estimates, including
   common convergence radii, invariance and the product identities.
   Then continue products along paths and prove homotopy independence
   on NQS M4's simply connected Poincaré cover.
   Obtain a strongly continuous unitary representation and pin its
   translation, rotation and boost comparisons through RQFT0's time-first
   and NQS's time-last coordinate map. Derive the forward-cone support
   from nonnegative time translation and the resulting Lorentz covariance.
   No integration theorem for bounded finite-dimensional Lie-algebra maps
   is applied directly to these unbounded generators.

4. Construct the analytic ordered correlations from the positive-time
   semigroup, including their joint spacetime variables and local complex
   Lorentz extensions. Prove the uniform tube/test-seminorm bounds needed
   for distributional boundary values by the selected OS II linear-growth
   input, retaining its n-dependence. Produce the jointly tempered
   Wightman distributions with spectral support, reversed-adjoint reality,
   positivity and bosonic locality, and prove that their ordered Euclidean
   continuation recovers the original zero-diagonal S_n. Prove the
   continuation and boundary-value uniqueness on the actual connected
   tube domains. Do not infer joint temperedness from separate smearings
   or use Euclidean coincidence values as Lorentzian boundary data.

5. Apply RQFT4's moment reconstruction to these proved distributions.
   Construct the vacuum-preserving isometry on the dense ordered
   Euclidean-state vectors, its extension H_OS→H_W and its inverse;
   prove it intertwines the time semigroup, Poincaré representation and
   the common polynomial field realization wherever those domain maps
   are defined. Own the ordered-state/domain estimates used in this
   comparison, rather than treating the test spaces as identical.
   Transport Euclidean clustering to the Wightman clustering/translation
   average used for vacuum uniqueness in RQFT4. Prove uniqueness by the
   reconstructed vacuum moments and this dense-state comparison.
   This determines a Wightman model up to its stated unitary equivalence;
   it does not determine an arbitrary full-Schwartz extension of the
   original zero-diagonal distributions, whose contact-term kernel was
   identified above.

**RQFT7.FreeReflection — the massive scalar covariance and its positive-time norm.**
For m>0 work in the time-first presentation ℝ×ℝ³, transported from the
chapter's Euclidean spacetime by RQFT0's coordinate equivalence. Put
`ω(p)=sqrt(|p|²+m²)` and `dμ_m(p)=d³p/((2π)³2ω(p))`, the same
mass-shell chart measure as RQFT3. Use the angular spatial transform
`f̃(t,p)=∫exp(−ip·x)f(t,x)d³x`; compare it with native Fourier by
p=2πξ. Let 𝒮₊ be the complex submodule of spacetime Schwartz functions
vanishing for t≤0. Smoothness forces all derivatives to vanish at t=0.
Compactly supported tests in the open positive half-space form a dense
subspace of 𝒮₊ in its inherited Schwartz topology; prove this by cutoff
and flatness estimates, without changing that topology to an LF topology.

1. Partially invert the time frequency in the preceding massive propagator:
   as a tempered distribution its spatial transform is
   `G̃_m(t,p)=exp(−ω(p)|t|)/(2ω(p))`. Prove this identity with the exact
   inverse factor1/(2π), including t=0 distributionally. For f,g∈𝒮₊ set
   `K_E f(p)=∫_(t>0)exp(−ω(p)t)f̃(t,p)dt` and prove the reflected
   covariance identity

   `Q_m(f,g)=⟨G_m(θx−y),conj(f(x))g(y)⟩
            =∫conj(K_E f(p))K_E g(p)dμ_m(p)`.

   Here θ(t,x)=(−t,x), the displayed distribution pairing uses the full
   two-slot Schwartz test, and the inner product is linear in its second
   argument. Prove all integral interchanges by absolute-integrability
   estimates. In particular time Cauchy–Schwarz and angular spatial
   Plancherel give
   `‖K_E f‖²_(L²(μ_m))≤∫|f̃(t,p)|²dtd³p/((2π)³4ω(p)²)
      ≤‖f‖²_(L²(dtd³x))/(4m²)`.
   Thus K_E is complex linear and continuous, Q_m is positive semidefinite,
   and its null space is exactly ker K_E. Its Hilbert quotient completion
   is identified isometrically with the closure of ran K_E.

2. Prove that this range is dense in RQFT3's full scalar one-particle
   space, even using tests supported in any fixed nonempty bounded open
   time interval I⊂(0,∞). Choose a nonzero nonnegative a∈C_c∞(I).
   Its Laplace factor `c_a(p)=∫a(t)exp(−ω(p)t)dt` is smooth and strictly
   positive. For each smooth compact momentum packet h, the function
   h/c_a is smooth and compactly supported; use its inverse spatial
   Fourier transform b to obtain K_E(a⊗b)=h. Spatial cutoffs of b
   converge in Schwartz topology and give compact spacetime tests in I.
   Combine this with density of compact momentum packets in L²(μ_m).
   For s≥0 define the right time translation `T_s f(t,x)=f(t−s,x)`;
   then `K_E(T_s f)=exp(−sω)K_E f`. Prove the descended strongly
   continuous contraction semigroup, with positive self-adjoint generator
   the maximal multiplication operator by ω, with domain
   `{h:∫ω(p)²|h(p)|²dμ_m(p)<∞}`. Advancing the argument
   f(t+s,x) is not this right translation.

3. Define the free full-Schwartz Schwinger distributions by S₀=1,
   S_(2r+1)=0 and S_(2r) equal to the sum over pairings of products of
   the two-slot covariance G_m. Each pairing is a tensor product on
   disjoint pairs of variables; no undefined pointwise distribution
   product is used. Prove temperedness and the Wick moment identities.
   On the symmetric polynomial algebra on 𝒮₊ use Wick ordering with
   respect to this Euclidean covariance, including all contractions
   within each monomial. For Wick monomials of degrees n and r prove
   their reflected Gram pairing is zero for n≠r, while for n=r it is
   `Σ_(σ∈S_n)∏_j Q_m(f_j,g_(σj))`.
   Consequently the Wick monomial maps to
   `sqrt(n!) P_sym(K_E f₁⊗⋯⊗K_E f_n)`, including the vacuum for n=0,
   in D8's existing symmetric Fock space with QF4's normalized creation
   operators. Prove positivity for arbitrary ordinary polynomials by the
   invertible triangular Wick-ordering change of basis, and identify
   their null quotient and Hilbert completion with that same Fock space.
   There is no extra1/n! in the permutation-sum Gram formula.

4. Compare this polynomial construction with the ordered zero-diagonal
   test sequences specified above. Arbitrary products of positive-time
   tests need not be flat on internal coincidence diagonals. For genuine
   ordered products choose their time supports in disjoint successive
   compact intervals inside (0,∞); they then lie in the required carrier.
   Apply the fixed-interval density theorem separately in every slot to
   show that these admissible Wick vectors span dense symmetric sectors.
   Extend the reflected pairing to general ordered tests by RQFT0's
   localized tensor-test approximation and the proved Schwinger
   distribution bounds. Prove that this restricted completion has the
   same vacuum and Fock unitary, rather than identifying the two test
   carriers by definition. Time translations correspond to
   `Γ(exp(−sω))=exp(−s dΓ(ω))`, with QF4's maximal
   second-quantized domain and vacuum energy0. Compare the analytically continued
   ordered correlations, with their time-order/reversal convention made
   explicit, with the massive scalar Wightman field of RQFT3. Its real
   field normalization is a+a†=sqrt(2)Φ_D8; using Φ_D8 alone would halve
   the covariance. Use QF4's existing finite-particle domain and closure
   comparisons. This direct free-model construction and its per-n
   temperedness estimates do not discharge the separate general OS II
   factorial-growth and reconstruction targets above.

**RQFT7.FreeGrowth — a uniform free Schwinger estimate.** In Euclidean
spacetime dimension4 with m>0, retain the full-Schwartz Gaussian Schwinger
functions and normalization of FreeReflection. Give their growth in particle
number explicitly, before comparing with the general OS II hypothesis.
From the heat-kernel representation above prove that G_m has a nonnegative
locally integrable representative, with arbitrary value at0, and
`∫_(ℝ⁴)G_m(x)dx=‖G_m‖_L¹=m^(−2)`. Use Tonelli and the heat kernel's
unit integral; neither smoothness at0 nor a global Schwartz bound is needed.
Put `w(x)=(1+|x|²)^(−3)` and compute
`I₄=∫_(ℝ⁴)w(x)dx=π²/2` by polar coordinates.

For a full n-slot Schwartz test f, using the Euclidean product norm, set

```text
q_n(f)=sup_x (Π_(j=1)^n (1+|x_j|²)^3) |f(x)|,
p_n(f)=sup_x (1+Σ_(j=1)^n |x_j|²)^(3n) |f(x)|.
```

For n=0 both are the absolute value of the scalar test. Construct these
continuous seminorms on the existing Schwartz carrier and prove
`q_n≤p_n`; compare them explicitly with its native seminorms. In particular
p_n uses weight order6n and derivative order0, through
`(1+|x|²)^(3n)≤(1+|x|)^(6n)`, and hence has an order bound linear in n.
For each perfect matching P of the2r slots prove absolute integrability
and the individual contraction estimate

```text
|∫ f(x) Π_({i,j}∈P)G_m(x_i−x_j) dx|
  ≤ (I₄/m²)^r q_(2r)(f).
```

Indeed each pair integral of `G_m(x−y)w(x)w(y)` is at most `I₄/m²`,
since `0<w≤1`. Use the disjoint slot pairs, Tonelli/Fubini and the
coordinate-permutation measure comparison. Tensoring locally integrable
pair kernels in disjoint variables constructs this distribution on the
full test space, including coincidences; no product of distributions in
the same pair variables is introduced. Sum over all matchings, proving
that their number is `(2r)!/(2^r r!)` (one for r=0), and obtain

```text
|S_(2r)(f)| ≤ ((2r)!/(2^r r!)) (I₄/m²)^r q_(2r)(f),
|S_n(f)| ≤ (π/(sqrt(2)m))^n sqrt(n!) p_n(f)  for every n≥0.
```

The latter includes S₀=1 and vanishing odd moments. Prove the factorial
comparison `((2r)!/(2^r r!))²≤(2r)!` using
`binomial(2r,r)≤4^r`. Carry the same bounds to the zero-diagonal closed
subspace by continuous restriction, and make them uniform for m≥m₀>0.
Complete the exact E0′ comparison: the derivative-zero term gives
`p_n(f)≤N_(n,6n)(f)` with constant1. Set `C_m=π/(sqrt(2)m)` and
`σ_n=C_m^n sqrt(n!)` for n≥1. Prove
`σ_n≤exp(C_m)(n!)^(3/2)` from `C_m^n/n!≤exp(C_m)`.
Thus the single parameter is s=6, with source-factorial constants
A=exp(C_m), B=3/2, and restriction gives precisely the E0′ input of
RQFT7.OSGrowth. For m≥m₀>0 use C_(m₀) throughout. This comparison and
FreeReflection's remaining Euclidean axioms supply the free-model input
to the general reconstruction theorem; it is not a necessity condition
on arbitrary Schwinger families.

Prove analytic continuation of Feynman propagators and time-ordered products with specified contour/deformation and boundary value. Keep formal Wick rotation distinct from a theorem; Lorentzian massless cone singularities and Euclidean elliptic estimates use different hypotheses.

## Milestone RQFT8 — scattering, LSZ and asymptotic completeness boundaries

**RQFT8.MassiveScattering — a definite Haag–Ruelle and wave-packet LSZ interface.** Work first with one stable neutral scalar species of mass m>0 in a positive-metric vacuum local net on four-dimensional Minkowski space: isotony, bounded local C*-algebras, spacelike commutativity, irreducible global action, strongly continuous positive-energy Poincaré covariance and a unique invariant unit vacuum. Let E be the translation PVM and H₁=E(H_m⁺)H, with the scalar massive representation of multiplicity one. Impose a spectral gap isolating both the vacuum and this mass shell: for some M>m the joint spectrum is contained in {0}∪H_m⁺∪{p∈V̄₊:p²≥M²}. This is an explicit sufficient massive theorem, not a necessity claim or a consequence of the Wightman axioms alone. Prove density of the local one-particle vectors E(H_m⁺)AΩ; equivalently this density may be retained as an explicit hypothesis if the chosen local-net axioms do not already supply Reeh–Schlieder.

For a bounded local A first smear spacetime translations against a Schwartz χ whose compact Fourier support meets the spectrum only on a compact patch of H_m⁺ and which has the prescribed shell value there. Construct the resulting norm-smooth almost-local B and its energy-momentum transfer estimate. For a smooth compactly supported momentum packet h set ω_p=√(|p|²+m²), f_t(x)=∫h(p)e^(−iω_pt+ip·x)d³p/(2π)³ and B_t(h)=∫f_t(x)α_(t,x)(B)d³x as a strong operator integral with its norm bound. Derive B_t(h)Ω=h(P)BΩ, independent of t, and B_t(h)*Ω=0 from the transfer support; the packet convention here uses Lebesgue Fourier measure, with the invariant-measure one-particle normalization supplied by RQFT3. Define its closed velocity support as {p/ω_p:p∈supp h}. For products with pairwise disjoint velocity supports prove rapid norm decay of the commutators, including adjoints and time derivatives, by spacelike separation of the dominant cones and nonstationary-phase decay of their tails. Together with the polynomial operator bounds and ∂_t B_t(h)Ω=0, commuting each derivative to the vacuum gives an integrable Cook bound for the derivative of the product. Prove strong limits as t→±∞, independence of A,χ and packets once their one-particle vectors agree, and the permutation-sum inner-product formula. Prove that these disjoint-velocity simple tensors span a dense subspace of SymⁿH₁: the coincidence-velocity set is null for the massive non-atomic shell measure; use finite partitions and L² approximation. Thus obtain isometric vacuum-preserving, covariant maps W_in,W_out:F_s(H₁)→H and their closed scattering ranges. These estimates are owned here; do not substitute an assumed strong limit for their proof. The isolated-shell special case of [Dybalski, §1, Lemmas2.1–2.2 and Theorem1.1](https://arxiv.org/html/hep-th/0412226) guides the almost-local/Cook construction; its more general embedded-mass regularity assumptions are not silently asserted here.

Define S=W_out*W_in on F_s(H₁). Prove it is a contraction and is unitary exactly when ran W_in=ran W_out, using the equality case in the orthogonal-projection norm bound and surjectivity of S. Asymptotic completeness means both ranges are all H; it is a strictly stronger assertion than this equality and remains a separate model-specific target or explicit hypothesis. Neither the mass gap nor locality alone is a proof of completeness. Keep the in/out field algebra and its CCR on their finite-particle domains distinct from the formal interacting Dyson series.

For the scalar-field comparison use the same fixed local net and translation Hamiltonian H≥0 as in the preceding Haag–Ruelle construction. Write M(O)=A(O)″ if the supplied local algebras are only C*-algebras; prove their von Neumann closures retain isotony, covariance and spacelike locality. Choose the Hermitian interpolating Wightman field φ in its energy-bounded realization on `D_∞=⋂_(n≥0)dom((1+H)^n)`, agreeing with the original field action on its declared common core, and retain `∥φ(g)(1+H)^(−r)∥≤C p(g)` for a fixed Schwartz seminorm p and integer r. State the full graph bounds used for products: for every k≥0 there are ℓ_k≥0, C_k and a Schwartz seminorm p_k such that `∥(1+H)^kφ(g)ψ∥≤C_k p_k(g)∥(1+H)^(ℓ_k)ψ∥` for every g∈𝒮 and ψ∈D_∞, with the same adjoint-test comparison. Thus each smearing preserves D_∞ and is continuous between its stated energy graph norms. Require for every real g∈C_c∞(O) that φ(g)|D_∞ is essentially self-adjoint and its closure is affiliated with this fixed M(O), meaning all its spectral projections belong to M(O). Consume [VNA V10](https://github.com/TauCetiProject/TauCetiRoadmap/blob/290e14ed238433b886724aa3c4f6e329598c0120/TauCetiRoadmap/VonNeumannAlgebras/README.md#L763-L769) for this affiliation, spectral-truncation and maximal-domain comparison. For complex g use φ(Re g)+iφ(Im g) on D_∞. Affiliation and net locality imply that a bounded operator in M(O₂), with O₂ spacelike to O, preserves the maximal domain of each real closure and commutes with it there. Use this closed-operator relative locality; do not require every bounded local operator to preserve a polynomial field domain or infer fixed-net affiliation from the field's own Wightman locality alone.

Use the bounded creators obtained by Schwartz spacetime convolutions `B=∫χ(a)α_a(A)da` of bounded local A from the preceding construction, with its stated isolated-shell Fourier filter. These are vectorwise strong integrals, not an assumed operator-norm Bochner integral. Prove `∥ad_H^j(B)∥≤∥A∥∥∂₀^jχ∥₁` for all j, including the actual commutator phases, and the same bounds for B*. Derive on D_∞ the energy graph estimate `∥(1+H)^k Bψ∥≤∥A∥Σ_(j=0)^k binom(k,j)∥∂₀^jχ∥₁∥(1+H)^(k−j)ψ∥`, so B and B* preserve D_∞. Fix real ρ∈C_c∞(ℝ⁴), equal1 on the unit ball and supported in the radius-two ball, and set ρ_R(a)=ρ(a/R), R≥1, with its explicit scaled derivative bounds. Use `B_R=∫ρ_R(a)χ(a)α_a(A)da`; B_R lies in M(O_R) for a bounded region containing the translated localization regions. Prove its local smoothness and rapid approximation to B in every bounded iterated-H-commutator norm by the Schwartz tails and cutoff derivative estimates. Hence these truncations preserve D_∞ and their spacelike commutation with the affiliated field holds on D_∞. Prove the analogous polynomial-time graph bounds for the packet creators B_t and their derivatives. The earlier local one-particle density and the shell filters give dense one-particle images for this chosen creator class; prove this by compact shell-patch cutoffs rather than assuming every bounded local A has domain invariance. Use these common-net, mixed-commutator and energy estimates in the telescoping/Cook comparison of field-current products with the selected bounded-net Haag–Ruelle maps.

Require the same one-particle overlap `E(H_m⁺)φ(g)Ω=√Z Kg`, with fixed Z>0 and RQFT3's mass-shell map K, and subtract the vacuum expectation. For this LSZ current use f(t,x)=∫h_packet(p)e^(−iω_pt+ip·x)d³p/((2π)³2ω_p), so the current creates the invariant-measure packet h_packet; relative to the preceding Haag–Ruelle smearing this is the explicit packet replacement h=h_packet/(2ω). Let h∈C_c∞(ℝ) have integral1, let 0<ν<1, h_(±T)(t)=T^(−ν)h((t∓T)/T^ν), and use smooth compact momentum packets. Define the averaged creation approximant, entirely by spacetime tests,

`L_(±T)(f)=i Z^(−1/2) φ(h_(±T)' f+2h_(±T)∂_t f)`.

This equals −iZ^(−1/2)∫h_(±T)(t)∫f↔∂_tφ by distributional integration by parts; it does not assume a field operator at sharp time. Prove its product-vacuum limits agree with the bounded almost-local Haag–Ruelle construction, using isolation of the shell, the stated energy bounds and rapid Fourier suppression of off-shell transfer from the widening time window. In particular do not replace this by an unproved strong limit of the unaveraged LSZ operators. Set θ_T(t)=∫_(−∞)^t(h_(−T)(s)−h_(+T)(s))ds. It is compactly supported, tends to1 on compact time intervals and obeys the exact current identity

`L_(+T)(f)−L_(−T)(f)=−iZ^(−1/2)φ((□+m²)(θ_T f))`.

For a reduction theorem assume specified tempered chronological distributions G_n extending the vacuum products on strict time-order regions, with the model's distributional chronological differentiation identities. Retain all equal-time commutator/contact distributions in those identities. State their independent external-shell regularity hypothesis as follows: every extra contact/extension term has zero complete external on-shell residue against the compact momentum packets in the θ_T limit; prove this for the particular model or prescription, rather than treating every local extension as interchangeable. An equivalent momentum formulation must exhibit the isolated simple external poles with residue Z and a remainder whose complete amputated packet limit vanishes. Prove that the connected packet matrix element is

`i^(r+s) Z^(−(r+s)/2) lim_(T→∞) ⟨∏_(j=1)^(r+s)(□_(x_j)+m²) G_(r+s)^conn, ∏_(out j) θ_T(x_j⁰) overline(f_j(x_j)) ∏_(in k) θ_T(x_k⁰) f_k(x_k)⟩`,

with r outgoing and s incoming packets. Fix the orientation of the chronological pairing by the displayed finite-current identity and verify the overall i factors against the free two-point normalization; add the disconnected contraction terms for the full matrix element. Derive the limit by repeated integration by parts, chronological differentiation and the contact-term hypothesis, and extend from disjoint-velocity packet products by the proven isometries. No pointwise restriction of a singular distribution to sharp on-shell momenta is presumed. [Collins, §§VIII–XII and XIV](https://arxiv.org/html/1904.10923) supplies a comparison of averaged and weak unaveraged limits; this roadmap's stated net, energy and contact hypotheses are part of the theorem, not an assertion that a Lagrangian alone provides them. Formal coefficientwise reduction and its counterterm matching remain separate perturbative targets. For QED retain RQFT8's separate infrared/dressed-state boundary; none of this massive neutral theorem supplies a charged-particle LSZ pole.

Do not claim that the formal perturbative S-matrix converges, is unitary as an actual operator or defines a nonperturbative interacting four-dimensional theory. For QED, massless photons and infrared divergences invalidate massive-particle LSZ without an infrared prescription/dressed-state framework; state this explicitly and allocate any such construction to a separate precise target, not to the scalar theorem.

## Milestone RQFT9 — electromagnetic examples and perturbative QED

Consume QF6b’s shared all-b native regularized Kummer M and Tricomi U interface, including the slit-plane/logarithmic branches, ODEs, Wronskians, integer-b logarithmic limits, connection and uniform asymptotic estimates, for the radial special-function comparison; RQFT9 owns its relativistic parameter/domain adapter. This is a QF6b→RQFT9 interface, separate from the early QF6a→RQFT0 comparison.

Use LVF's Maxwell/Dirac Lagrangian and Noether identities, then build the quantum model-specific bridge:

For the radial models consume UO-D06's closed-form/Friedrichs representation,
UO-D07's Hardy and singular endpoint/Green-boundary API, and PDE's local
weak-derivative theory. RQFT9 owns the Coulomb specialization: derive the regular
singular first-order systems and their Frobenius power/logarithmic bases,
compute the actual graph-continuous origin traces, classify limit-point and
limit-circle regimes, and select the distinguished Dirac extension by its
finite `r⁻¹/²` norm in the subcritical range. Prove equivalence to killing the
singular radial coefficient and to the appropriate cutoff/domain construction;
treat the critical charge with its separate logarithmic domain. Use
[Cassano–Pizzichillo, Theorems1.1–1.3 and Propositions1.7–1.8](https://arxiv.org/html/1710.08200)
for these domain comparisons, translating their charge/sign and κ conventions.
The Dirac operator is not semibounded and does not use the scalar Friedrichs theorem.

Consume native `Complex.regularizedHGFun` from
`Mathlib.Analysis.SpecialFunctions.RegularizedHypergeometric`:
`regularizedHGFunCoeff_add_one` requires every denominator parameter differ
from −k at the kth step; `analyticOnNhd_regularizedHGFun_of_card_le` requires
numerator cardinality at most denominator cardinality. Use
`regularizedHGFunCoeff_eq_zero_left` when a numerator parameter equals −m
and m<k, and `regularizedHGFunCoeff_eq_zero_iff` for the complete numerator
and shifted-denominator zero cases. `radius_regularizedHGFunSeries_eq_top_of_finite`
gives infinite radius for a nonpositive-integer numerator. Consume QF6b.T’s
generic finite-polynomial identity and exact degree for `a=−n_r`, with denominator
b outside the nonpositive integers; RQFT9 proves only the actual relativistic
parameter and degree adapter. Coefficient vanishing alone is not that identity.
Consume QF6b’s Γ(b)-normalization of the native one-numerator/one-denominator specialization
`M(a,b,z)=₁F₁(a;b;z)` for b outside the nonpositive integers, its Kummer
ODE `zM″+(b−z)M′−aM=0` and shared second-solution/connection interface.
RQFT9 owns its relativistic parameter, origin-domain and decay adapters,
specializing the shared power/logarithmic origin and large-real asymptotics
with their Γ coefficients and exceptional terminating parameters. Its b is generally
noninteger, so consume the complete all-b connection interface and prove
regular-singular uniqueness and the estimates in each relativistic parameter family. Derive the
radial change of variable and all parameters from each KG/Dirac equation.
Prove that the selected origin condition and exponential decay pick the
terminating a=−n_r family in the stated subcritical bound-state range;
prove completeness of this quantization and first-order Dirac reconstruction,
rather than assuming square integrability of a squared-equation solution.


* Charged Klein–Gordon: covariant derivative `D_μ=∂_μ+ieA_μ`, gauge transform `A↦A−dα` or its explicitly converted sign convention, `φ↦e^{ieα}φ`; prove covariance of `Dφ`, current conservation on solutions and the scalar-QED one-photon and seagull two-photon vertices. UNSW p61 uses `∂−ieA`, opposite to pp24–25; convert its one-photon and seagull vertices to the pinned `D=∂+ieA` convention. Translate the equivalent `A↦A+dα`, `φ↦e^(−ieα)φ` convention explicitly; UNSW p24’s `e^(iα)` conflicts with its `∂+ieA`, while p25 gives the corrected charge and sign. Derive the real scalar current with its factor i before expanding the action; p41’s displayed derivative bilinear omits that factor.

**RQFT9.UNSW41CanonicalComparison — a matched regulated comparison.** Consume LVF3.UNSW41ScalarLegendre's real canonical covector and its exact unregulated identity `H_int=−L_int|_free velocities+e²A₀²φ̄φ`; consume its later UNSW41GaugeComparison only after LVF5. The minimally coupled scalar interaction has time derivatives, so the derivative-free sufficient theorem does not apply. At finite cutoff compare a matched regulated action, field/CCR kernel and its actual Legendre Hamiltonian, not two independently restricted continuum formulas.
On a spatial three-torus of side L, choose a finite Fourier-mode space V stable under conjugation and an orthogonal projection P commuting with spatial derivatives. For a real smooth external A₀ let M be multiplication by A₀, Q=1−P and B=PMP|_V. Restrict the local scalar action to `φ,v∈V`. Its time term is `||v+ieMφ||²=||v+ieBφ||²+e²||QMφ||²`. Prove the realified Legendre transform is the restriction of the continuum canonical Hamiltonian minus `e²||QMφ||²`; explicitly track the positive defect `D=PM²P−(PMP)²=PMQMP`. The spatial energy is the actual restricted `Σ_i||∂_iφ+ieA_iφ||²+m²||φ||²`, with its own projected multiplication kernels. Conversely restricting the continuum Hamiltonian corresponds to the action with the compressed time-seagull B², not PM²P. Prove this distinction before quantization. Include the constant-mode control `A₀=a cos(2πx₁/L)`, `φ=c/√Vol`: B=0 but `||QMφ||²=a²|c|²/2`, so naive restriction of the continuum Hamiltonian misses this nonzero term.
Use the existing QF/D8 canonical/Fock operators on the finite-mode realified carrier and their common Schwartz/finite-particle core as applicable, with the selected RQFT3 mass and zero-mode convention. The canonical mode algebra itself has no positive-frequency premise; do not impose an oscillator vacuum on a massless zero mode without its separate carrier. Pin the equal-time field CCR with the projection kernel `δ_P(x,y)=Σ_j e_j(x)overline(e_j(y))`, so `[φ(x),π(y)]=[φ̄(x),π̄(y)]=iδ_P(x,y)` and the cross commutators vanish. For the chosen restricted action use the Hamiltonian with the displayed −e²D correction, and fix the same ordering/vacuum-scalar subtraction on its action and Hamiltonian sides. Derive the finite-cutoff order-e and order-e² external-background/tree coefficients from both descriptions, retaining the actual δ_P derivative/time-order contacts and the PM²P versus B² seagull terms. Prove equality of those matching regulated coefficients. Do not replace δ_P by a Dirac delta or the regulated rules by the unregulated local vertices at fixed cutoff.
For dynamical photons use RQFT1/RQFT3's constrained Maxwell carrier. An ordinary spatial Fourier cutoff need not preserve local gauge multiplication or first-class Gauss closure. If it is used, derive its actual projected constraints and their defects. For scalar gauge multipliers `B_α=PM_αP`, track `[B_α,B_β]=PM_βQM_αP−PM_αQM_βP`; for projected `δφ=ieP(αφ)` and `δA_μ=−∂_μα` the unprojected covariant derivative has defect `δ(D_μφ)−ieαD_μφ=−ieD_μQ(αφ)`. Include any further photon/parameter-projection defects explicitly. Retain the A₀ primary sector, Gauss/Coulomb and boundary terms; on a torus enforce mean-zero total charge and separate harmonic modes. Either construct a specified regulator with exact compatible constraints or, for this Fourier regulator, prove coefficientwise removal of these computed constraint/Ward defects on the chosen physical tests; do not assert exact finite-cutoff local gauge invariance. Loop/counterterm Ward compatibility remains RQFT6/RQFT9's separate theorem with its stated hypotheses.
At fixed L and on a fixed compact time window, prove the cutoff-removal limits at orders e and e² as distributional coefficient identities against the stated smooth spacetime tests and external wave packets. Supply Fourier-tail/weighted-seminorm estimates for the projected multiplication, defect and δ_P contact kernels, as well as the Wick/core pairings actually used; strong P→1 alone is insufficient and the defect need not tend to0 in operator norm. For real compactly supported smooth backgrounds/tests, then take the box-to-continuum comparison through RQFT3's periodization/packet maps, with the corresponding tested bounds; extend to Schwartz tests only after proving their uniform seminorm bounds. Recover the unregulated local covariant one-photon and seagull rules from these coefficientwise limits, including derivative/time-order contact terms and all factors, in the same charge/Fourier/gauge convention. These are formal perturbative coefficient comparisons; no nonperturbative interacting charged representation or pointwise equal-time current operator after cutoff removal is inferred. There is no full Dyson-series, vacuum-energy or long-time/LSZ limit without the separately stated RQFT3/5/8 hypotheses. Preserve both covariant vertices and the full constrained quantum comparison; neither follows from the derivative-free Hamiltonian theorem.
* Dirac: minimal coupling, Hamiltonian form, current `ψ̄γ^μψ`, gauge covariance and exact gamma identities. For `H₀=α·p+βm`, derive `H=eΦ+α·(p−eA)+βm` and `H_int=eΦ−eα·A`; UNSW p43’s additional α·p inside H_int double-counts the free momentum when added to H₀. In particular prove `[γ^μ,γ^νγ^λ]=2(η^{μν}γ^λ−η^{μλ}γ^ν)`; the UNSW p.17 printed alternative fails at μ=0,ν=λ=1. Compute the square of `σ·(p−eA)` with commutators `[p_i−eA_i,p_j−eA_j]` to obtain the magnetic spin term and derive the stated weak constant-B energy shift under the specified nonrelativistic/weak-field assumptions. Do not suppress factors of `c`, charge, metric signature or Fourier normalization.

**RQFT9.QuantitativePauliComparison — external fields and controlled remainders.** Consume RQFT3's two-spinor L² carrier, QF6a's Schrödinger comparison and UO1–UO5's actual domains, spectral calculus and evolution. Own the following external-field adapters here. Take m>0 and the standard gamma block representation; convert other realizations by RQFT2's fixed intertwiner. In natural units put V=eΦ, T=σ·Π and Π=−i∇−eA. For the stationary operator argument take real bounded V and an actual self-adjoint T with its stated core/closure; construct that T and the block Dirac operator for the smooth growth class below. Singular Coulomb backgrounds retain the separate distinguished-domain/reconstruction adapter in the Coulomb targets. A stationary solution E=m+ε satisfies `(ε−V)f=Tg`, `(2m+ε−V)g=Tf`. If `||ε−V||∞≤δm`, 0≤δ<2, put r=(2m+ε−V)^−1 and prove `g=rTf` and `(ε−V)f=T r T f` on `{f∈D(T):rTf∈D(T)}`. On D(T) compare the actual Schur form `q_r(f)=⟨Tf,rTf⟩` with `||Tf||²/(2m)` and prove the error bound `δ||Tf||²/(2(2−δ)m)`. If additionally `||Tf||≤ηm||f||`, prove `||g||≤η||f||/(2−δ)`. Retain the reconstruction/domain condition and the noncommuting T r T order. At V=A=0 compute the positive-energy ratio `|p|/(sqrt(m²+|p|²)+m)` and its high-momentum limit1, with normalized box modes or L² wave packets as appropriate. This qualifies the source's uncertain energy clause and shows why small potential alone is insufficient.

Give a controlled time-dependent comparison, with units restored. For a fixed finite interval[0,T₀], take real smooth Φ(t,x),A(t,x), with Φ and its mixed derivatives bounded, A and its time derivatives at most linear in x, and every mixed derivative of A of positive spatial order bounded, uniformly on the interval. These backgrounds are independent of c; let c≥c₀>0. Put `Π_c=−iℏ∇−(e/c)A`, `Q_c=σ·Π_c`, `V=eΦ`, `H_D,c=cα·Π_c+βmc²+V` and `H_P,c=Q_c²/(2m)+V`. On the actual L²/Schwartz carriers prove essential self-adjointness, existence of the unitary nonautonomous propagators, their common Schwartz-domain comparison, and the weighted Schwartz-seminorm estimates for Pauli evolution uniform for c≥c₀. These external-field and time-dependent domain/propagation comparisons are theorem targets here, not an unnamed existing autonomous-evolution theorem.

For a Pauli solution F_c with fixed Schwartz initial datum define `D_t=iℏ∂_t−V` and the well-prepared lower component `G_c=Q_cF_c/(2mc)−D_t(Q_cF_c)/(4m²c³)`. Derive its preparation from the Pauli equation, retaining all derivatives and commutators of the varying backgrounds. The approximate Dirac field is `Ψ_app,c=e^(−imc²t/ℏ)(F_c,G_c)`. Prove the exact residual components, after that phase is removed,
`r_f=Q_cD_t(Q_cF_c)/(4m²c²)`, `r_g=−D_t²(Q_cF_c)/(4m²c³)`.
With exact Dirac initial data Ψ_app,c(0), prove the Duhamel error bounded by `ℏ^−1∫₀ᵗ(||r_f||+||r_g||)ds`; use the stated propagation bounds to obtain O(c^−2) uniformly on[0,T₀], and `||G_c||=O(c^−1)`. Include the O(c^−2) adjustment for normalized prepared data. This is a finite-time, specified-data theorem; it does not identify arbitrary negative-energy initial data with the particle branch or justify an infinite-time/LSZ limit.

For time-independent V=0, also construct the exact positive-energy embedding using `R=(m²+T²)^(1/2)` and `Jf=(sqrt((R+m)/(2R))f,T(2R(R+m))^(−1/2)f)`. Prove `H_D J=J R` with its actual domains and, on `1_[0,κ²](T²)`, the natural-unit evolution error `|t|κ⁴/(8m³)` relative to `T²/(2m)` after subtracting rest energy. This spectral-window theorem supplements the general external-field comparison.

On a common core compute `Q_c²=Π_c²−(eℏ/c)σ·B`. For constant B in symmetric gauge `A=B×x/2`, prove the full Pauli Hamiltonian is
`p²/(2m)+V−(e/(2mc))B·(L+ℏσ)+(e²/(8mc²))|B×x|²`.
On the moment/form domain `|x|F∈L²`, bound the discarded quadratic form by `e²|B|²|||x|F||²/(8mc²)`; for eB≠0, translated packets show there is no uniform L² operator bound; at eB=0 the remainder is zero. Keep the source27 orbital contribution, with g_L=1, separate from the full spin contribution g_s=2 and the scalar potential. For a first-order spectral shift use an actual isolated finite-multiplicity bound-state cluster and prove the weighted form/resolvent perturbation hypotheses before diagonalizing its compressed linear Zeeman term. Work the QF6b Coulomb bound clusters with their angular/spin multiplicities; handle free constant-B Landau branches through their magnetic operator spectrum rather than an invented isolated zero-field eigenstate. Preserve all source unit/sign and clipped/crossed-out qualifications.

* Coulomb bound-state exercises (UNSW physical pp. 1–6): derive the static-field KG equation with `A⁰=Φ`, `Aᵢ=0`, then for `eΦ=−Zα/r` separate radial modes with `p²=p_r²+l(l+1)/r²`. Compute the effective Coulomb coefficients `E_e,l_e,Z_e`, write the unreduced mode as `R_l(r)Y_lm` and the reduced half-line amplitude as `u_l=rR_l∈L²((0,∞),dr)`. Derive `ν_l=sqrt((l+1/2)²−a²)`, `a=Zα`, and the origin exponents `R_l∼r^(−1/2±ν_l)`. For `a<l+1/2`, define the Friedrichs form domain by closing the form initially on C_c∞(0,∞),
`q_ε(u)=∫(|u′|²+(l(l+1)−a²)|u|²/r²−2aε|u|²/r+(m²−ε²)|u|²)dr`,
in a positively shifted form norm. Prove semiboundedness, closability and
independence of its domain from the shift and real spectral parameter ε,
using Hardy and the Coulomb form bound. Among local radial eigen-equation
solutions, prove that this domain selects the Frobenius branch
`u_l∼r^(1/2+ν_l)`; square-integrability alone need not select it. The selected R_l can be unbounded. Treat the coalescing logarithmic case `a=l+1/2` and the supercritical inverse-square regime separately, specifying any additional extension/short-distance data before claiming a spectrum. Impose exponential decay at infinity for `|ε|<m`, prove the confluent-hypergeometric quantization, and determine the discrete `ε(m,Z,α,l,n_r)` spectrum and its real/allowed parameter region for `ns` states, including the source's `Z=69` question: with its α≈1/137.04, the l=0 coupling exceeds 1/2, so the subcritical real-exponent formula cannot be continued as a Friedrichs-semibounded point-Coulomb result. Prove the small-`Zα` expansion gives the Rydberg formula and its first correction. When consuming QF6b’s attractive nonrelativistic Coulomb model, distinguish its signed coefficient from the source’s positive fine-structure constant: write the relative potential coefficient as `α_QF=−Zα` and consume its arbitrary-μ relative Coulomb operator with μ=m for the one-body external-field comparison. Separately, for the two-body model prove μ→m as the nuclear mass tends to infinity; this limit is not required to define the one-body comparison. Prove the mass/unit identification before consuming the Rydberg formula. Do not simply assume the assignment's effective noninteger angular-momentum formula: derive its radial ODE, boundary conditions and chosen branch.
* For the same Coulomb problem, derive the squared Dirac equation from the first-order minimally coupled equation using `[p_μ−eA_μ,p_ν−eA_ν]` and verify the Pauli term/sign against the fixed metric and gamma convention. Specialize to static `E=−∇Φ`, decompose the Dirac bispinor into two Pauli spinors, and verify the source's `ie σ·E` term. For `ns_{1/2}` use `u(r)=[f(r)+i(σ·n)g(r)]u₀`; derive the coupled radial system, prove the proportional ansatz `g=λf` reduces it precisely when `Zαλ²−2λ+Zα=0`, compute `λ_−=a/(1+sqrt(1−a²))` and `λ_+=(1+sqrt(1−a²))/a`. Their effective angular momenta are respectively `γ−1` and γ, `γ=sqrt(1−a²)`. Derive the first-order central Dirac radial system with reduced components P,Q and coordinate amplitudes P/r,Q/r. Use its distinguished self-adjoint domain and reconstruction identities to select the source's ns channel and derive its energy spectrum. For `κ=±1`, the selected reduced components behave as r^γ, while the physical amplitudes behave as r^(γ−1); do not demand bounded amplitudes. Prove the limit-point regime `a≤sqrt(3)/2`, state the distinguished extension for `sqrt(3)/2<a<1`, and separate critical/supercritical domain data. Give the corresponding general nonzero κ radial API and coupling thresholds. Compare with the KG spectrum and prove the Rydberg limit and first relativistic correction. The λ+ ratio diverging as a→0 does not reject a normalized state: rescaling f leaves a finite P-like `σ·n` component. It is an opposite-parity candidate, outside the requested ns branch. Prove its exact κ=+1 reconstruction, allowed radial quantum numbers and spectrum, or identify its failure of the first-order/domain condition. Solving the squared equation alone is insufficient; prove reconstruction of every accepted eigenspinor and isolate extraneous squared-equation solutions.
* Fix the external Coulomb convention with signed electron charge e, nuclear charge −Ze, Z>0: `A⁰=−Ze/(4πr)` and potential energy `U=eA⁰=−Ze²/(4πr)`. Use one electron vertex e with A⁰, or equivalently the already coupled potential U in the normal-ordered density interaction, with no additional e. Derive its Fourier sign and scattering normalization. UNSW p.57 writes `−Ze²/(4πr)` inside A⁰ and still multiplies by e, while p.62 changes the Fourier sign; retain these power/sign conflicts and derive a consistent Ze² amplitude.
* For the static heavy Coulomb target in UNSW p62, first prove the Dirac counterpart of RQFT5's scalar first-Born rate theorem. Fix m>0, incoming spatial momentum p≠0 and spin labels, normalize positive-energy spinors by `u_s(p)†u_t(p)=2ε_p δ_st`, and derive the one-electron external-potential coefficient from RQFT3's Dirac modes. Use the continuous canonical-boost massive spin basis fixed by the external-leg target. For a real Schwartz potential energy U in the normal-ordered interaction `∫:ψ†Uψ:` (finite-cutoff vacuum subtraction before removing the cutoff), prove the density-normalized switched rate `2πδ(ε′−ε)|Û(p′−p) ū_{s′}(p′)γ⁰u_s(p)|²/(4ε′ε) d³p′/(2π)³` with the same box/packet normalization and order: remove mode cutoff, L→∞ at fixed switching time, then long-time limit. Keep fixed-spin rates separate from summing final spins and averaging the two initial spins. Coulomb is not Schwartz and its torus periodization is not this theorem's input. Use Heaviside–Lorentz charge normalization `e²=4πα`, and the real even Schwartz approximants defined by `Û_{κ,R}(q)=−Ze² exp(−|q|²/R²)/(|q|²+κ²)`, κ,R>0. After the rate limit for each approximant, take R→∞ and then κ→0 against final-momentum tests supported away from the forward point p′=p; prove the limiting Fourier Coulomb kernel and independence from these regularizations in that test class. Do not claim a finite total rate including forward scattering. For this angular differential rate, prove `ε′=ε`, `d³p′=|p′|²d|p′|dΩ′` and `|p′|d|p′|=ε′dε′`; integrate the energy delta and divide by incoming speed `|p|/ε`. With `M=Û(q)ūγ⁰u`, derive `dW=|p′||M|²dΩ′/(16π²ε)` and `dσ=|M|²dΩ′/(16π²)`. Compare the source's `|p′|/ε` under elastic kinematics and distinguish its first displayed rate, which omits that speed, from its later cross section. Carry the fixed Coulomb potential-energy convention into M and preserve the p57/p62 sign conflict.
* Coulomb gauge: solve Gauss' law `−Δ A₀=ρ` with boundary/decay assumptions, split transverse photon modes, derive the instantaneous Coulomb kernel and transverse photon exchange. Pin the instantaneous Fourier denominator as `|k⃗|²` and the covariant exchange denominator as `k_μk^μ` with its boundary prescription; the source p53 distinguishes these two squares. Prove equivalence with covariant-gauge amplitudes only after the Ward identity and constraint terms are included.

For Borcherds p119 use the free charged Dirac CAR field and its U(1)-invariant vacuum, with psi of weight+1 and its Dirac adjoint of weight-1. Prove same-charge two-point contractions vanish by U(1) covariance, while the two mixed orientations give their actual matrix-valued distributions and fermionic time-order signs. Fix the spinor/adjoint bases before identifying the16 scalar entries of a4x4 propagator. This is not a vanishing theorem for products of two propagator matrices, nor for a neutral Majorana field. Retain tiny diagram-incidence uncertainties separately.

**RQFT9.CoulombExchange — the UNSW pp52–55 cancellation.**
Take `k=(ω,k⃗)`, `r=|k⃗|>0`, `d=ω²−r²`, and two complex currents
`J_a=(ρ_a,j⃗_a)` satisfying `k⃗·j⃗_a=ωρ_a`. Spatial and spacetime
contractions here are bilinear; conjugations from external states are
already part of the declared current. With `P_T=I−k⃗k⃗ᵀ/r²`, prove
polarization completeness and the exact rational identity, for d≠0,

```
(j⃗₁·P_T j⃗₂)/d + ρ₁ρ₂/r² = −η(J₁,J₂)/d.
```

Derive the two old-fashioned exchange time orderings, their relative sign
and their common `1/(2r)` mode factor. Their scalar sum is
`((ω−r)⁻¹−(ω+r)⁻¹)/(2r)=d⁻¹` away from the poles. Prove its Feynman
boundary-value version with opposite pole sides:

```
((ω−r+i0)⁻¹−(ω+r−i0)⁻¹)/(2r) = (d+i0)⁻¹.
```

This is an equality of distributional limits, not an equality for one
common finite ε in every denominator. On the open momentum domain r>0,
prove the conserved-current identity also with `d⁻¹` replaced by
`(d+i0)⁻¹`, for smooth current multipliers satisfying those conservation
identities, using `d(d+i0)⁻¹=1`. Derive the vertex, charge, overall i,
Fourier-measure and conservation-delta factors from the fixed canonical
rules before exporting the full amplitude. Use RQFT5's rate normalization
only after that comparison. Extending a comparison through k⃗=0 requires
the specified distributional extension and infrared estimates; the
pointwise formula alone gives no such limit.

The instantaneous term participates in the cancellation with the
longitudinal part removed by P_T. Preserve pp54–55's cramped fraction,
unreconciled intermediate signs and zero annotation as source data;
do not set the isolated Coulomb contribution to zero. Compare
[Dine's Coulomb-gauge notes, pp1–2](https://scipp-legacy.pbsci.ucsc.edu/~dine/ph218/218_coulomb_gauge.pdf)
for the projector and conserved-current reduction, translating the
metric and propagator factors. Suggested rational statements are in
[CourseExamplesSuggested.lean](CourseExamplesSuggested.lean); the
boundary-value and canonical-amplitude comparisons remain theorem targets.

* State the exact QED graph rules: internal scalar/Dirac/photon propagators, vertex factors from action normalization, momentum conservation delta, loop momentum measure, symmetry factors, spinor-index contractions, orientation of fermion arrows, sign of permutations and `−1` for each closed fermion loop. Work the vacuum-polarization trace `tr(G(p+k)γ_μG(p)γ_ν)` and scalar-scattering examples. Use the explicit electron-electron, annihilation, real-emission kinematics and Dirac static-Coulomb targets; include both exchange time orderings and the instantaneous Coulomb term. General channel rates consume RQFT5.GeneralChannelRateNormalization, with the actual spin, flux, identical-state and singular-region hypotheses for each listed process. Scalar external-target rates consume the separate RQFT5 static theorem; the Dirac static-target rate has its own theorem above. Keep source diagram glyph uncertainties separate from accepted formulas.
* For m≥0 derive the Dirac Feynman distribution from the fixed scalar Feynman boundary value by Clifford factorization, pinning the numerator, overall i and Fourier measure. For m>0 prove `(γ·p−m+iεI)⁻¹=(γ·p+m−iεI)/(p²−m²+ε²+2imε)` and its distributional Feynman limit as ε↓0. For m=0 the literal matrix inverse is singular at real `p²=−ε²` for every ε>0 and supplies no Feynman prescription; define the massless propagator instead by `γ·p` times RQFT1's genuine scalar Feynman boundary value, with the fixed overall i. Do not use a negative-mass sign to infer the same limiting prescription. For m>0 derive all four external electron/positron leg rules with `u,v,ū,v̄`, physical momentum reversal and charge-arrow direction from RQFT3. In the standard gamma realization fix `C=iγ²γ⁰`, choose the two rest Pauli spinors `(1,0),(0,1)`, use the canonical rotation-free boosts to define positive-energy u-spinors, and define the v-basis by `v_s(p)=C bar(u_s(p))ᵀ`, where bar is the Dirac adjoint. Derive its spin relabelling and phases and the signed-energy comparison; do not identify spin labels from momentum reversal alone. Preserve p57(d)'s literal negative-energy `ū(−p′)` as source data to compare, and verify the external-field vertex in the same convention.
* For electron Compton scattering on UNSW p58, take `p+k₁=p′+k₂` with positive-mass positive-energy on-shell electrons and nonzero future real on-shell photons. Derive both ordered Dirac propagator strings with internal momenta `p+k₁` and `p−k₂`, and the vertex/polarization factors. Prove the denominator signs `2p·k₁>0`, `−2p·k₂<0`; these physical denominators are nonsingular. Prove contraction with k₁ vanishes for arbitrary second polarization in ℂ⁴ using momentum conservation and the external Dirac equations, and the analogous second Ward identity for arbitrary first polarization, before descending to the physical photon quotient. This is a formal tree amplitude; its relation to physical scattering uses RQFT8's separate hypotheses. Preserve clipped diagram-label uncertainties.
* Work the p59 direct-minus-exchange electron-electron amplitude, both Bhabha exchange/annihilation channels, and the two electron-positron-to-two-photon orderings. Derive the spinor strings, momentum deltas and signs from the fixed external Fock ordering and fermion permutation rule; identical-fermion antisymmetry in Møller scattering is distinct from crossing conventions in Bhabha scattering. Derive the one-loop electron self-energy integrand with both consistent loop-momentum routings, explicitly orienting the photon loop momentum; preserve p59's first `d⁴p` loop measure, although p labels an external momentum there, as source data. In four-dimensional Feynman-gauge QED with electron mass m>0 and massless photon, construct the position-space self-energy kernel `γ^μ S_F(x)γ^ν D_{μν,F}(x)` away from x=0 using RQFT6's wavefront-product criterion. Prove scaling degree at most5; its local extension ambiguity has derivative order at most1. Also construct the one-loop vertex three-point kernel with two electron propagators and one photon propagator on the complement of the total diagonal. Prove the products on partial diagonals are already well-defined, joint scaling degree at most8 in the eight relative coordinates, and hence derivative-order-zero ambiguity at the total diagonal. For each kernel choose a compactly supported χ equal to1 near its total diagonal and prove `(1−χ)t` acts continuously on Schwartz tests by polynomial boundary-value estimates, including along the light cone at infinity. For the vertex use the common-iε family of all three propagator factors and prove a uniform tested Schwartz-seminorm bound and convergence; a single-variable quadratic-form pullback is insufficient at collinear null configurations. Choose local extensions that do not increase scaling degree. Their compactly supported local parts have finite order and are tempered; combine these with the exterior estimate to obtain globally tempered extensions before taking Fourier transforms. The derivative-order bounds and cutoff independence are asserted within this scaling-degree-preserving class. Consume RQFT6's finite-jet connected-Lorentz/Whitehead adapter and its proved finite-component averaging for parity P=γ⁰, P²=1. RQFT9 owns the concrete modules: `C_Σ=End_ℂ(S)⊗_ℝ(ℝ⊕M)` for delta jets of order≤1 at the self-energy diagonal, and `C_Λ=End_ℂ(S)⊗_ℝM` for order0 upper-vector-indexed vertex jets (use the explicit η musical isomorphism for the lower-index convention), both with their actual underlying-real Lorentz, parity and graded field-tensor actions. Apply η’s musical isomorphism to the normal derivative index in C_Σ as well as to the vector/covector index in C_Λ. Derive the Fourier factors in these identifications. Prove kernel, tadpole and proper-block covariance and identify the allowed stable submodules and affine constraints; do not duplicate RQFT6's group-cocycle removal proof. Prove that the Fourier-transformed self-energy restricts on `{p:p²<m²}` to a real-analytic matrix-valued function and admits the stated Lorentz-covariant coefficient decomposition there; only then evaluate its coefficient functions at a spacelike subtraction point. In the Lorentz-covariant parity-preserving family the self-energy ambiguity has the mass/scalar and Dirac first-derivative terms, and the vertex ambiguity is `cγ^μ` at the total diagonal. Fix an off-shell subtraction scale ν>0: writing `Σ_R(p)=A_R(p²)slash(p)+m B_R(p²)`, normalize `A_R(−ν²)=B_R(−ν²)=0`. On the underlying-real modules, derive the scalar Lorentz invariants of End_ℂ(S) as `span_ℝ{I,iI,γ⁵,iγ⁵}`; parity leaves ℂ·I. The covariant first-derivative parity-even terms are ℂ·slash(p). Thus before spacelike normalization the self-energy correction space is `ℂ·mI⊕ℂ·slash(p)`, of real dimension4, and the vertex correction space is `ℂ·γ^μ`, of real dimension2. No Hermiticity/reality condition has been imposed here. The two constraints A_R(−ν²)=B_R(−ν²)=0 are two complex equations, equivalently four real equations, and their diagonal correction map is invertible. In the normalized Lorentz/parity-covariant affine family the self-energy parallel subspace is `D_Σ=0`; before the cross-graph Ward equation the vertex parallel subspace is `D_Λ=ℂ·γ^μ`. RQFT9 must identify the actual joint parallel kernel after imposing the Ward coefficient relation, rather than count these as one or two real directions. A separately desired Hermiticity reduction requires its own invariant-affine constraint and proof. Prove these spacelike scalar-value constraints define the indicated nonempty Lorentz-stable and parity-stable affine set and identify its exact parallel subspace. The fixed invariant p²=−ν² is essential; prove solvability of its two self-energy equations rather than imposing values on an arbitrary noncovariant matrix function. Prove existence of compatible vertex-extension choices and the relation between its c and the self-energy wavefunction counterterm (Z₁=Z₂) so that, after stripping the charge factor and writing the inverse electron operator as `slash(p)−m−Σ_R(p)` and vertex as `γ^μ+Λ_R^μ`, `k_μΛ_R^μ(p+k,p)=Σ_R(p)−Σ_R(p+k)`. RQFT9 owns this cross-graph compatible-existence theorem. Derive the pre-extension Ward identity with its contact terms, prove its extension defect is a local jet with the required bound, and identify and solve the joint Lorentz/parity-stable affine constraints relating the vertex coefficient to the self-energy wavefunction coefficient, together with the spacelike conditions. This is additional to RQFT6's per-free-graph normalization bijection and covariance H¹ theorem; it asserts neither an identity for arbitrary independent counterterms nor generic gauge-anomaly vanishing. Here m is a subtraction-scheme mass parameter. Prove the finite one-loop boundary value of `A_R(m²)+B_R(m²)` and the formal mass-shell shift `δm=m(A_R(m²)+B_R(m²))`, so `M=m+δm+O(e⁴)` in the perturbative mass-shell equation, before comparing with external on-shell conventions. Do not assert a nonperturbative isolated charged-particle pole or charged-particle LSZ theorem; RQFT8 retains that infrared distinction. Do not impose an infrared-divergent on-shell derivative subtraction in this massless-photon model. Keep the unintegrated source loop expression distinct from the renormalized Fourier distribution; no unnamed regulator defines the latter. Do not apply RQFT6's negative-degree convergence criterion to the degree-one self-energy graph or treat its auxiliary infrared mass as an ultraviolet regulator. Prove that a free positive-mass on-shell electron cannot emit a nonzero real photon while remaining on shell; an external-background emission problem requires its background data. Do not fill clipped loop diagrams with invented labels.
* For the scalar Compton process on UNSW p61, compute the formal tree-level amputated amplitude from both ordered scalar-exchange graphs and the contact/seagull graph. Consume the charged-KG bullet’s converted one-photon rule `−ie(p+p′)^μ`, seagull rule `2ie²η^{μν}`, RQFT1’s scalar propagator `i/(p²−m²+i0)` and RQFT3’s photon polarization quotient. Let charge-arrow momentum p be incoming and p′ outgoing; take photon k₁ incoming with ε₁ and photon k₂ outgoing with conjugate polarization bar(ε₂), with `p+k₁=p′+k₂`. Derive the antiparticle rule by reversing the charge arrow with the same momentum convention. For the algebraic Ward identities allow arbitrary ε₂∈ℂ⁴ before passing to the physical quotient. The factor2 belongs to the seagull; neither exchange channel has a factor1/2. Under momentum conservation, `p²=p′²=m²` and `k₁²=0`, prove contraction of the sum with k₁ vanishes for arbitrary second polarization at nonsingular exchange denominators, and prove the second Ward identity with the corresponding on-shell hypothesis on k₂. This is a formal tree amplitude; consume RQFT8 for any LSZ comparison. Preserve the source’s incomplete diagram details rather than inventing them.
* Apply RQFT6’s engineering count to four-dimensional minimal scalar/Dirac QED with dimensionless e: derive `ω=4−E_A−E_scalar−(3/2)E_ψ`. Use its auxiliary μ>0 Euclidean criterion for UV bounds on massless photon edges. Ward identities and regulator compatibility require their separate proofs.
**RQFT9.BoundStateRadiativeLevelMatrix — the UNSW Lamb-shift example.** Consume the actual distinguished point-Coulomb Dirac operator `D_a=α·p+βm−a/r`, m>0, 0<a<1, and its first-order/domain reconstruction above; consume QF6b for the nonrelativistic comparison and RQFT3/6/9 for the free CAR/photon and renormalized-kernel interfaces. Keep a=Zα fixed as an external-background parameter while expanding in a separate formal radiative coupling g, identifying g with the physical charge only in the convention comparison. Let `h_e=1_(0,∞)(D_a)H` and `h_p=conj(1_(−∞,0)(D_a)H)` and construct the Furry electron–positron CAR carrier and its vacuum, with reference excitation energies |D_a|; this external-background splitting is not a theorem of interacting vacuum existence. Work the finite degenerate Dirac-Coulomb 2S_(1/2)/2P_(1/2) cluster, including all magnetic multiplicities, and later its stated nonrelativistic/unit conversion.

Define a regulated operator comparison before removing regulators. Fix real even f∈C_c∞(ℝ) with f=1 on[−1,1] and supp(f)⊂[−2,2], and real radial ζ∈C_c∞(ℝ³) with ζ=1 on the unit ball. Choose Λ>max{|E|:E in the selected bound cluster}, so those energies lie in the unit plateau. Apply the separate fermion ultraviolet and spatial regulator `S_(Λ,R)=ζ(x/R)f(|D_a|/Λ)`, R>0, to the Furry field before forming currents. This is additional to the photon momentum cutoff: a photon band does not control arbitrary relative electron–positron loop momentum. Prove the actual localized Coulomb spectral trace/Hilbert–Schmidt estimates for S_(Λ,R) and the resulting pair-current kernels, for the distinguished domain in the stated coupling range. Choose nested finite-rank subspaces in h_e and h_p with vectors in the actual Coulomb operator domain, including the selected bound cluster on the electron side and exhausting declared graph cores. Use the compressed positive excitation operators on those subspaces, with the exact selected level projector preserved. For photons use transverse one-particle modes with λ≤|k|≤2Λ, 0<2λ<Λ, energy |k|, and the real radial smooth coupling cutoff `χ_(λ,Λ)(k)=f(|k|/Λ)(1−f(|k|/λ))` from the fixed plateau f above. It vanishes below λ and above2Λ and is1 on[2λ,Λ]. Derive the corresponding scale-dependent derivative bounds and pointwise cutoff-removal limits; this explicitly normalized family, rather than an arbitrary supported function or the zero coupling, is the regulator used below. Compress this spectrally and spatially regulated field to the finite fermion subspaces, and define the charge-free density `ρ_N=ψ_N†ψ_N` and spatial current `j_N=ψ_N†αψ_N` in the declared ordering prescription, with transverse coefficient `V=−∫j_N(x)·A_(λ,Λ)(x)dx` in the pinned Coulomb-gauge/sign convention. Insert the radiative coupling only through `H(g)=H₀+gV+g²W`, with g=e in the signed-charge comparison; the instantaneous term in W uses the charge-free density kernel once, with Fourier kernel `χ_(λ,Λ)(k)²/|k|²`. Match the counterterm and fixed-background bookkeeping to that same convention. Construct these operators on the finite-fermion times photon-Fock carrier, and prove their field-operator bounds, self-adjoint realization and common domains at each fixed regulator. Derive the charge-one constrained Hamiltonian from the matched canonical theory, rather than choosing its order-g² contact terms independently.

Write that Hamiltonian through this order as `H(g)=H₀+gV+g²W`; W contains the matched instantaneous/contact terms and local mass, charge and field-strength counterterms in the same spacelike subtraction convention as the free RQFT9 kernels, with their regulator-dependent coefficients fixed before the indicated limits. Impose the actual adjoint/reality conditions giving W=W† and a self-adjoint fixed-regulator Hamiltonian. Prove existence of a scheme compatible with these conditions, the spacelike normalization and the stated Ward identities; the earlier complex Lorentz/parity affine classification deliberately imposed no Hermiticity and does not automatically supply this real Hamiltonian scheme. Keep vacuum scalar subtraction and current normal-ordering prescriptions explicit. Compute the regulated Furry pair/current contractions and compare their renormalized closed-fermion-loop/vacuum-polarization contribution with the free-background subtraction; retain the static polarization difference. Moving to Furry normal ordering must not silently discard that difference or count the same loop twice. Prove the equivalence of this effective-Hamiltonian expansion and the corresponding external-Coulomb Green-function/diagram expansion through the chosen order, including negative-energy/positron intermediate sectors and the instantaneous contribution. A free translation-invariant self-energy kernel is a subtraction/comparison supplier, not the bound Coulomb propagator.

Let P project onto the one-electron selected Coulomb cluster tensored with the photon and positron vacuum, let Q=1−P, and denote its unperturbed energy by E₀. With ε>0 use the actual reduced resolvent `Q(E₀−QH₀Q+iε)⁻¹Q`. Derive the Feshbach convention `H_eff(z)=PHP+PHQ(z−QHQ)⁻¹QHP` and its level equation, and the order-g² matrix
`B_(N,λ,Λ,ε)=PVQ(E₀−QH₀Q+iε)⁻¹QVP+PWP−b_vac P`,
At the same N,R,λ,Λ and ε define `P₀=|Ω⟩⟨Ω|`, `Q₀=1−P₀` in the charge-zero reference sector, with vacuum energy0, and define `b_vac=⟨Ω,VQ₀(−Q₀H₀Q₀+iε)⁻¹Q₀VΩ⟩+⟨Ω,WΩ⟩`. Derive exact cancellation of the spectator-disconnected terms with this same +iε vacuum coefficient before taking N, R or ultraviolet limits. Do not first replace it by a real ε=0 scalar: an O(ε) mismatch can multiply a divergent volume/loop factor. Prove its vacuum-gap ε↓0 limit is real at the fixed regulators where that gap applies. Prove PVP=0 for the specified transverse linear coupling and derive every intermediate-state, spin and pair multiplicity rather than treating this as a scalar expectation formula. Keep the regulated vacuum-polarization/contact contribution in W or in the explicitly derived diagram expansion according to the proved matching, exactly once.

At fixed R,λ,Λ,ε prove the finite-rank electron/positron exhaustion only for the connected, vacuum-subtracted, subtracted finite level coefficient on the finitely many fermion sectors used at order g². Keep the fermion spectral/spatial regulator in place through that limit; no global uncut current or full-Fock Hamiltonian is inferred. Include the matched pair-loop/background-charge and other local counterterms in the combined coefficient before any exhaustion that needs them. Then prove the ε↓0 boundary-value limit with its exact limiting-absorption/threshold hypotheses. Remove λ↓0 at fixed R,Λ with actual infrared bounds for this bound-state observable; next remove R→∞ at fixed Λ using bound-state localization and connected-kernel bounds. Finally remove the common fermion/photon ultraviolet scale Λ→∞ in the combined renormalized matrix after all stated local subtractions and cutoff-dependent Ward-restoration comparison. Do not require separate unregulated contact/counterterm expectations of singular Coulomb spinors when only their combined tested matrix has a limit. These are specified iterated coefficient limits; prove their matrix-norm/tested convergence, regulator independence in the declared class and comparison to the local RQFT6/RQFT9 extension scheme. If a real reduced resolvent is used instead at any stage, first prove a genuine gap of QH₀Q at E₀. An isolated eigenvalue of D_a alone does not give that gap: lower atomic levels plus a photon generally put an excited E₀ in a continuum even with a positive infrared cutoff below the transition energy.

From the limiting finite-order level matrix derive its real level shifts, the allowed-channel imaginary part and the sign of each width in this Feshbach/boundary convention. Diagonalize within the degenerate cluster using the actual rotational/parity symmetries and derive the 2S_(1/2)–2P_(1/2) separation at the specified perturbative order. Prove the relevant selection rules and order of each width; neither every excited level having a width at the same order nor a real eigenvalue perturbation is presumed. If an assertion is made about a resonance of the regulated/limiting operator rather than a formal level coefficient, construct the corresponding continuation/resonance carrier and prove its comparison with this matrix. This is a finite-order radiative bound-state target, without assuming nonperturbative interacting QED or a charged-particle LSZ pole.

Preserve the source's clipped/uncertain annotation, its approximate energy claim and its bibliography as qualified source context. The scale `ℏ/(2mc²)` has the dimension of time; derive the relation of any time/energy estimate to the actual calculation rather than calling that time dimension inconsistent or accepting the “sum over all histories” slogan as a convergent formula. No approximate numerical Lamb shift is certified by the source annotation alone.

Gauge fixing, ghosts, BRST/BV, regularization, Ward/Slavnov–Taylor identities, anomaly cancellation and renormalizability each require proofs under an explicit regulator and gauge group/matter content. The dated Standard Model, QCD `SU(3)`, beta-decay, neutrino and detector notes remain literal model context and do not certify modern particle data or a completed interacting model. Their explicit p31 statistical question and p32–33 label/conservation comparisons are mathematical targets in the following two clauses; retaining them as history alone does not discharge those questions.

**RQFT9.JetStatistics — a quantitative answer to Borcherds p31.** Fix the native unit sphere S={u∈EuclideanSpace ℝ (Fin 3):‖u‖=1}, k,N≥1, and deterministic weights w_i≥0 with Σ_(i:Fin N)w_i=1. Write σ=(volume:Measure (EuclideanSpace ℝ (Fin 3))).toSphere and μ=(σ univ)⁻¹•σ, using the finite positive mass from Mathlib's `Measure.toSphere_apply_univ`, `Measure.toSphere_ne_zero` and its finite-measure instance. Prove μ is a probability measure invariant under orthogonal transformations and prove its squared-chordal cap law μ{u:‖u−v‖²≤s}=s/4 for v∈S and 0≤s≤4. Derive this three-dimensional latitude/cap integral from the native polar-coordinate supplier `MeasureTheory.Measure.measurePreserving_homeomorphUnitSphereProd`; the normalization is part of this clause, not an assumed unspecified “uniform” law. The null event law is the actual finite product μ^N (`Measure.pi`); consume `ProbabilityTheory.iIndepFun_pi` for its coordinate independence. Use the real-valued probability `Measure.real` in the estimates below.

Define `f_v(u)=min_(j:Fin k)‖u−v_j‖²`, `J_(k,w)(u)=min_(v∈S^k)Σ_i w_i f_v(u_i)`, and `q_k=min_(v∈S^k)∫f_v dμ`. Build the minima using compactness and the native extreme-value theorem. Prove continuity in the directions and simplex weights and hence measurability, permutation invariance under simultaneous permutation of directions and weights, orthogonal invariance, the bounds0≤J≤4, and monotonicity in k by repeating a center. Prove `|f_v(u)−f_(v′)(u)|≤4 max_j‖v_j−v′_j‖` and the corresponding empirical/integral bounds. The cap law and a union bound give μ{f_v≤s}≤min(1,ks/4); integrating the tail on [0,4/k] gives `q_k≥2/k` for every k≥1. This is a lower bound, not a claim of an evaluated optimal quantizer for every k.

For any δ>0 and finite δ-net V⊂S of cardinal M, prove the explicit null bound, for t>0 and s_w=Σ_i w_i²>0,

`μ^N{|J_(k,w)−q_k|≥t+8δ} ≤ 2 M^k exp(−t²/(8s_w))`.

Use the finite family V^k, each centered variable f_v(u_i)−∫f_v with range width4, and the already-native bounded-variable Hoeffding lemma `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`, weighted by `ProbabilityTheory.HasSubgaussianMGF.const_mul`; sum with `ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun`, apply both tails, and take the finite union. Also define the score’s pushforward law under an arbitrary Borel probability on S^N; the displayed estimate belongs to the specified independent null, not every correlated event law. No new general concentration theorem is assigned here. The two δ-net approximations cost at most8δ. Construct a finite net with M≤m³ for `m=max(1,⌈2√3/δ⌉)`, by dividing [−1,1]³ into m³ closed cubes and choosing one sphere point from each nonempty intersection. Thus all constants in the bound have an explicit finite construction. Equal weights give s_w=1/N. The weighted statement requires weights fixed independently of the sampled directions; data-dependent weights require their own joint-law/conditional argument and do not inherit this null bound by substitution.

For the declared k-cluster alternative, if every event direction is within chordal distance ε of one of k centers, prove deterministically J_(k,w)≤ε². For `ε²≤τ<2/k`, choose `0<δ<(2/k−τ)/8`; the test “clustered if J_(k,w)≤τ” has null false-positive probability at most

`2 M^k exp(−(2/k−τ−8δ)²/(8s_w))`,

and accepts every event obeying that cluster condition. The estimate can exceed1 and is then read with the trivial cap1. This specifies a mathematical directional-clustering experiment for arbitrary k,N and the stated weights. It does not identify exactly k physical jets, derive a QCD event law, or claim an infrared-safe detector algorithm or measured significance. Any physical use must state its event selection, energy/detector weights and law comparison separately; the source's two-/three-jet interpretations remain historical context. The explicit statistic/null/alternative and their quantitative distinction discharge the source's mathematical question without declaring an interacting theory constructed.

**RQFT9.SourceDecayLabels — literal source and consistency models.** Preserve all Borcherds p32–33 atmospheric/solar chains, detector examples, quoted energies and dated claims as source data. For the displayed positive branch `π⁺→μ⁺+ν_μ`, `μ⁺→e⁺+barν_μ+ν_e`, the accumulated neutrino-label multiset is `{ν_μ,barν_μ,ν_e}`, one of each. Prove this finite-multiset substitution/count identity; it differs from the following literal count sentence listing `{barν_μ,ν_μ,barν_e}`. A sequential arrow can describe only the currently decaying particle, so it need not repeat the earlier emitted ν_μ; do not treat that abbreviation as evidence that this particle disappears. Retain the reader's cramped-glyph uncertainty for the count sentence. This branch computation is not a prediction that an atmospheric flux or a detector sees three equal species: charge-conjugate branches, production/survival weights, oscillation, cross sections and detector response would require separate specified data and primary factual checking.

For p33 retain the literal `³He+⁴He→⁷Be+p`. The verified Luna glyph report confirms p with high confidence and agreement of source and transcript; it is not a γ reading. On the declared nuclear-label table A(³He)=3, A(⁴He)=4, A(⁷Be)=7, A(p)=1 and electric charges2,2,4,1, respectively, compute the incoming totals(7,4) and outgoing totals(8,5), so the row violates both mass-number and charge balance. The editorial comparison `³He+⁴He→⁷Be+γ`, with A(γ)=charge(γ)=0, balances these two quantities; label it a mathematical correction, not a replacement transcript or a proof of the physical reaction/rate. Check the same two additive-label balances for every other displayed solar branch, including the charged leptons and the chlorine/argon detector row, with nuclear mass number0 for leptons and photons. Preserve the source's uncertainty and all listed numerical values; no modern mass/energy/rate or historical abundance assertion is accepted merely by this finite bookkeeping.

**RQFT9.SourceWorkedModels — explicit consumers for pp26/34.** For p26 consume RQFT0's +--- four-vector convention. Given an incoming on-shell projectile p=(E,q) with mass m₁≥0, E≥m₁ and E²−‖q‖²=m₁², and a stationary target(m₂,0) with m₂>0, prove the invariant squared center-of-momentum energy `s=η(p+(m₂,0),p+(m₂,0))=m₁²+m₂²+2m₂E`. For equal-mass opposite beams(E,q),(E,−q), prove s=4E². Derive the fixed-target high-energy limit `sqrt(s)/sqrt(E)→sqrt(2m₂)`, in contrast to sqrt(s)=2E for those opposite beams. This is the declared kinematic comparison, not a Rutherford cross-section or luminosity calculation.

For p34's flavour-change idea consume QF's finite-dimensional sharp Born measurement and selfadjoint unitary evolution, rather than building another generic quantum model. For r≥1, a unitary matrix U, real energy labels E_j, initial standard flavour vector e_α and standard flavour projections P_β, take H=U diag(E_j)U* in ℏ=1 units and prove

`P_(α→β)(t)=‖P_β exp(−itH)e_α‖²=|Σ_j U_(βj)exp(−iE_j t)conj(U_(αj))|²`.

Prove normalization Σ_βP=1, nonnegativity and the initial Kronecker probabilities. For r=2 and `U=[[cosθ,sinθ],[−sinθ,cosθ]]`, prove the off-diagonal probability `sin²(2θ)sin²((E₂−E₁)t/2)`; with ℏ>0 retained, replace t by t/ℏ and prove that unit conversion. The parameters/mixing basis and sharp effects are input data; this conditional finite-state example does not determine neutrino masses, fluxes, matter effects or detector response.

For p34's eight-generator count consume LieGroups Layer2's matrix-group/Lie-algebra identification. Prove the real Lie algebra of SU(3) is the trace-zero skew-Hermitian3×3 matrices, with real basis `i diag(1,−1,0)`, `i diag(0,1,−1)` and, for each a<b, `E_ab−E_ba`, `i(E_ab+E_ba)`. Verify skew-Hermiticity, tracezero, real linear independence and spanning, hence real dimension8. Read the source's group expression `U(1)×SU(2)×SU(3)` separately from its Lie algebra `u(1)⊕su(2)⊕su(3)`; the eight Lie-algebra components of an su(3)-valued gauge field do not alone certify a quantum particle/physical-polarization count. These are named worked-target consumers, not mathematical acceptance based solely on a derivation in private audit evidence.

## Milestone RQFT10 — Shale implementability and inequivalent free representations

Consume D8's CCR/Weyl algebra and regular bosonic Fock representation, and D8's carrier with QF4's Fock and second-quantization API, but prove the field-theoretic Bogoliubov bridge: for a bounded real symplectic isomorphism `S` on the underlying real Hilbert space of a complex one-particle space `(h,J)`, write its complex-linear and antilinear parts relative to J and prove that the antilinear part `β` is Hilbert–Schmidt iff the induced Weyl automorphism is unitarily implementable in the bosonic Fock representation. Pin the strong/implementer topology and uniqueness up to phase. The proof route constructs implementers for finite-rank cutoffs, uses the Hilbert–Schmidt condition for convergence of squeezed vacua and second quantized maps, and proves necessity from the finite-particle/vacuum norm criterion. State the fermionic CAR criterion separately with its own covariance and implementer conventions; do not infer it from the bosonic proof. Deduce inequivalence of infinite-volume or time-dependent free-field representations only for transformations failing the criterion. Finite-dimensional Stone–von Neumann equivalence does not extend to infinitely many modes without this condition.

**RQFT10.BosonicShale — restricted symplectic maps and the full implementability proof.** On an arbitrary complete complex Hilbert space h, including zero, finite-dimensional and nonseparable h, use D8's existing symplectic Weyl automorphism `α_S(W(f))=W(Sf)` and its regular symmetric Fock representation π₀ with QF4's vacuum-cyclicity, irreducibility and domain comparison. Let Jf=if and let S be a bounded real-linear continuous-linear equivalence preserving `σ(f,g)=Im⟨f,g⟩`. Put `P=(S−JSJ)/2` and `β=(S+JSJ)/2`, prove their complex-linearity/antilinearity and uniqueness, and derive composition/adjoint/inverse formulas from symplecticity. Use D8's antilinear-adjoint convention; do not give a real-linear map a complex-linear adjoint by notation alone. Interpret antilinear Hilbert–Schmidt class via its complex-linear map from the conjugate Hilbert space, equivalently `Σ_i‖βe_i‖²<∞` on a Hilbert basis. Consume [OperatorIdeals Parts B–C](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md#part-b--symmetric-operator-ideals-and-schatten-norms) for basis independence, completeness, ideal inequalities, compactness and the column identification; use the existing bounded-map and conjugate-linear carriers. The [Mathlib Hilbert–Schmidt41477](https://github.com/leanprover-community/mathlib4/pull/41477) and [Schatten44525](https://github.com/leanprover-community/mathlib4/pull/44525) APIs guide compatibility; the finite-dimensional Frobenius instance alone is not the infinite-dimensional criterion.

Prove the equivalence of `β∈HS`, `[S,J]∈HS` on the underlying real Hilbert space, and existence of an onto complex-linear unitary U on Γ_s(h) satisfying `Uπ₀(W(f))U*=π₀(W(Sf))` for every f. Prove uniqueness up to scalar phase from Fock irreducibility. This compares this representation with its α_S precomposition; it is not a classification of all CCR representations. The set of such S is a subgroup, with complex/antilinear composition formulas and the HS ideal estimates. Pin a usable topology: operator-norm convergence of P together with HS-norm convergence of β on this restricted group, and strong operator convergence of implementers with their phase convention. Do not replace strong by operator-norm continuity of Weyl generators.

Prove the two-particle comparison on V2/QF4’s existing completed tensor sector: `T↦[w↦(⟨w,·⟩⊗I)T]` is an isometry from h⊗̂h to the HS antilinear maps, with basis expansion `T=Σ_i e_i⊗K e_i`; its symmetric sector corresponds exactly to symmetric antilinear K. Derive the product Hilbert basis from V2’s dense elementary tensors and product inner-product formula by finite tensor approximation, rather than attributing a separately named product-basis API to V2. Derive this adapter’s convergence, basis independence and onto statement from that basis and OI’s column model; the factor sqrt(2) for a(w) on the two-particle sector belongs to QF4’s normalized creation/annihilation comparison. This tensor/antilinear adapter is proved here, not falsely attributed as already present in the column-only supplier.

Construct the proof rather than assume that arbitrary compressed symplectic maps are symplectic. First prove P is invertible and `K=βP⁻¹` is a symmetric antilinear contraction with `‖K‖<1`; derive `P=(1−K²)^(−1/2)V` with V complex-unitary. Treat h=0 separately. Show K is HS iff β is. Prove the compact symmetric-antilinear diagonalization needed here: on the positive finite-dimensional eigenspaces of K² normalize K to a conjugation, choose a real fixed orthonormal basis, and obtain `Ke_j=κ_j e_j`,0≤κ_j<1, on its countable nonzero support; keep its possibly nonseparable kernel. Consume the native compact self-adjoint spectral theorem, not an assumed separable whole-space eigenbasis. The new antilinear/conjugation adapter is proved here on that native theorem.

For finitely many κ_j form the normalized squeezed vector by its occupation coefficients. In one mode the2n coefficient is `c₀(−κ)^n sqrt((2n)!)/(2^n n!)` and `c₀=(1−κ²)^(1/4)`; odd coefficients vanish. Prove its unit norm by the binomial generating series. Use QF4's normalized occupation basis on the existing carrier to form finite-mode vectors in the full Fock space; no new Fock carrier or unproved infinite tensor identification is needed. Their overlaps and norm differences give convergence precisely when `Σ_jκ_j²<∞`, using a common bound κ_j≤ρ<1 and `−log(1−κ_j²)` comparable with κ_j². Define the positive vacuum normalization by this convergent product (equivalently the determinant of1−K² on its nonzero spectrum); construct only the determinant/product API used here, consuming any existing trace/determinant interface when present. This includes the zero-support product1. Prove the finite-mode Gaussian characteristic identities, their limits and the weak transformed-annihilation recurrence. The genuine cutoffs are `S_N=(1+K_N)(1−K_N²)^(−1/2)V`, with K_N the spectral finite-mode truncations, not `P_NSP_N`.

From the normalized limiting squeezed vector Ψ construct U on the dense span of `π₀(W(f))Ω` by `Uπ₀(W(f))Ω=π₀(W(Sf))Ψ`. The proved characteristic identity and Weyl law make this isometric and well-defined; S is onto and irreducibility makes the image cyclic, proving onto unitarity. Prove the finite-mode implementers converge strongly on this dense set and then on all Γ_s(h). Necessity must not assume the implementing vacuum has finite expected particle number: the weak recurrence against finite-particle vectors determines its sector coefficients. Its vacuum coefficient c₀ cannot vanish, since the recurrence would kill each sector successively. The two-particle identity identifies K with the Hilbert–Schmidt contraction kernel of Ψ₂, with `‖K‖_HS²=2‖Ψ₂‖²/|c₀|²`; hence β is HS. This is the required necessity/domain argument. [Bruneau–Dereziński, §3.1, Theorem3.2](https://arxiv.org/html/math-ph/0511069#S3.SS1) pins the bounded symplectic/Fock setting and the normalized implementer; distinguish its one-parameter-group theorem3.4 and its additional continuity premise.

Choose the unique implementer with positive vacuum overlap; prove strong continuity in the stated restricted topology and the continuous scalar cocycle for products. Do not assert that this phase choice is a genuine group homomorphism. Deduce the QF6b source comparison for `S_t=cosh(t)I+sinh(t)C` on a separable infinite-dimensional h with conjugation C: the relative β is `sinh(t−s)C`, whose basis-column energy is infinite for t≠s, so the precomposed regular irreducible representations are pairwise inequivalent. Regularity and irreducibility are preserved under the bounded symplectic automorphisms. Finite-dimensional/zero h instead always satisfies the HS condition. Retain the separate CAR implementability theorem with its real-orthogonal, covariance, parity and implementer conventions; its proof and singular complex-linear part cannot be inferred from the bosonic P-invertible argument.

### RQFT10.CAR — orthogonal implementability on the shared fermionic Fock carrier

Consume [OperatorAlgebraDynamics D8](https://github.com/TauCetiProject/TauCetiRoadmap/blob/b8740e6e38849694bef2d6b67a259199ac6ad604/TauCetiRoadmap/OperatorAlgebraDynamics/README.md#d8-car-weyl-algebras-and-free-equilibrium-states) for the universal CAR algebra, its completion comparison, antisymmetric Hilbert Fock space and bounded generators. Consume QF4's occupation basis, vacuum cyclicity, irreducibility and second quantization on that same carrier, and OperatorIdeals OI-B32–B40/OI-C01–C14 for basis-independent Hilbert–Schmidt energy, the ideal estimates and compactness. RQFT10 owns the implementation theorem and the following realification, parity and topological comparisons; it does not construct another CAR algebra or consume terminal QF6b.

Let h be any complete complex Hilbert space, including h=0 and nonseparable h, with inner product conjugate-linear in the first slot. On `F_a(h)=⊕_(n≥0) ∧^n h` include the vacuum sector ℂ, write Ω for its unit vector, Π for particle-number parity, and use D8's antilinear annihilators a(f), with `{a(f),a(g)*}=⟨f,g⟩1`. Their domains are the whole Fock space. Define `c(f)=a(f)+a(f)*`, so `{c(f),c(g)}=2 Re⟨f,g⟩1`. Set Jf=if on the realification. Given a bounded surjective real-linear isometry S of h_ℝ, define the bounded complex-linear part `U=(S−JSJ)/2` and antilinear part `V=(S+JSJ)/2`. Reuse D8's antilinear adjoint, its four orthogonality identities and its automorphism `γ_S(a(f))=a(Uf)+a(Vf)*`; equivalently `γ_S(c(f))=c(Sf)`.

Prove the fermionic Shale–Stinespring theorem in these conventions: there exists a unitary W on F_a(h) such that

`W a(f) W*=a(Uf)+a(Vf)*` for every f∈h

if and only if V is Hilbert–Schmidt, equivalently `[S,J]` is Hilbert–Schmidt as a real-linear operator. For an antilinear V define its squared Hilbert–Schmidt norm by the unconditional sum `Σ_i ‖Ve_i‖²` over any complex Hilbert basis; prove basis independence by applying the linear ideal to VC for a conjugation C, and prove independence of C. No countable basis for h is assumed. Choosing C merely for comparison, set v=VC; the doubled linear matrix `[[U,v],[CvC,CUC]]` and the formula `a(Uf)+a*(vCf)` identify the convention with [Bru–Metraud, Theorem2.8](https://arxiv.org/html/2305.11697v2). This primary statement uses a separable one-particle space. The extension to arbitrary h below is an additional theorem here, rather than an attribution of that broader hypothesis to the paper. The CAR covariance is real orthogonal, not the bosonic symplectic covariance.

Every implementer is unique up to a scalar of modulus one. If V is Hilbert–Schmidt, prove U is Fredholm, `dim_C ker U=dim_C ker U*<∞`, and its ordinary complex Fredholm index is zero. Put `κ(S)=dim_C ker U mod2`. Prove every implementer is homogeneous with

`Π W Π=(−1)^κ(S) W`.

Thus an even implementer exists exactly when κ(S)=0; an odd implementer exchanges the two Fock parity sectors, although γ_S always preserves the CAR grading. Include finite particle–hole transformations with singular U: do not impose invertibility of U or infer the fermionic parity from a bosonic squeezed-vacuum formula. In the real-polarization comparison `J₁=SJS⁻¹`, compute `(J+J₁)S=2JU`; hence `dim_R ker(J+J₁)=2 dim_C ker U`. This gives the precise parity dictionary with [Loizides–Meinrenken–Song, Theorem2.2](https://arxiv.org/html/1706.07493v1). The relevant obstruction is this mod2 parity, not a nonzero complex Fredholm index of U. For h=0 the Fock space is ℂ, κ=0 and all implementers are scalar phases; in finite dimension every V is Hilbert–Schmidt.

For the proof first work on a separable invariant carrier. Prove the finite-dimensional CAR vacuum and particle–hole formulas, then the normalized paired-mode vacuum construction when V is Hilbert–Schmidt, separating ker U and ker U* from the invertible complement. Use Hilbert–Schmidt summability for convergence of the paired vacuum and creation-word action. Prove necessity by the finite-CAR restrictions and the pure quasi-free vacuum normality/determinant criterion, deriving that criterion here on the D8 representation. A general Fock vector need not have finite expected particle number, so an assumed finite expectation of N is not a necessity proof. Identify the chosen vacuum by its transformed annihilator equations, and use QF4's creation-word density and irreducibility for the resulting unitary and phase uniqueness. The cited primary statements are guides to this proof, not already-implemented Lean theorems.

Retain arbitrary h by an explicit separable reducing-subspace argument. In the sufficient direction, Hilbert–Schmidt V and V* have separable ranges. Close a countable dense set in those ranges under U,U*,V,V* and complex scalar multiplication to obtain a separable closed complex subspace K reducing all four operators. On K⊥, V=0 and U is unitary. Prove the Fock factorization with `c(k)=c_K(k)⊗1` and `c(l)=Π_K⊗c_(K⊥)(l)`. If W_K has parity κ, the ordinary tensor-product implementer is

`W_K ⊗ (Π_(K⊥)^κ Γ(U|_(K⊥)))`.

Check both displayed Majorana actions: the two factors (−1)^κ in the spectator action cancel. Omitting this parity correction would implement the wrong transformation on K⊥ when κ=1. In the necessary direction, if V has infinite Hilbert–Schmidt energy choose a countable orthonormal family with divergent column-energy sum, then close it under U,U*,V,V* to obtain a separable reducing K witnessing the divergence. A global implementer would make the transformed vacuum restricted to CAR(K) a normal pure state in the standard Fock(K) representation, using the Fock factorization and the fact that S preserves K. A pure normal state of B(F_a(K)) is a vector state; this contradicts the separable vacuum criterion. Spell out the normal extension by summing the spectator-basis vector coefficients (the partial trace of this vector state) and the purity of the restricted transformed vacuum before using that implication; this bounded comparison is proved here, not an extra general partial-trace supplier assumption. No global separability assumption is added.

Pin topology as well as existence. Give `O_res(h,J)={S∈O(h_ℝ):V_S is Hilbert–Schmidt}` the topology generated by strong operator convergence of S and the metric `‖V_S−V_T‖₂`; equivalently use the real Hilbert–Schmidt commutator difference together with strong convergence. Prove it is a topological group and that `S↦[W_S]` is continuous into PU(F_a(h)) with the quotient of the strong operator topology on its unitary group. Define the actual central extension as the pairs `(S,W)` satisfying the displayed implementation identity, with multiplication `(S,W)(T,Z)=(ST,WZ)` and kernel `(1,z·1)`, z∈𝕋; use the subspace topology from O_res×U(F_a(h)). Prove local continuous phase choices and that its projection is locally a principal 𝕋-bundle. Near the identity use `‖V‖₂<1`, so both `U*U=1−V*V` and `UU*=1−VV*` make U invertible with a locally uniform inverse bound; the paired vacuum has nonzero vacuum overlap, and choose that overlap positive. Hilbert–Schmidt convergence of its pair coefficient, strong continuity of the unitary part and creation-word density give strong continuity of this local implementer. Translate this chart to any S. Compare the topology with [Tener, Definition2.12/Theorem2.13](https://arxiv.org/html/1608.02095v1), keeping that paper's linear-creator and polarized charged-Fock conventions distinct from D8's antilinear annihilators and the present real-orthogonal Fock representation. Prove the present comparison on this carrier; a doubled charged Fock representation is not silently identified with it. No global phase section, honest representation of all O_res, or operator-norm continuity of implementers follows from this projective statement. In particular, individual Hilbert–Schmidt off-diagonal parts without Hilbert–Schmidt continuity do not suffice for the asserted continuous-family conclusion.

## Milestone RQFT11 — the source’s spin2 and power-counting example

The p8 spin labels mean massive SU(2) spin for m>0 and absolute helicity in the massless examples; the photon has helicities ±1. Consume NQS M4’s little-group representations and RQFT6’s generic power counting. Build the free spin2 example and the formal Einstein–Hilbert interaction below to distinguish a free higher-spin field from a specified interaction. The spin label alone supplies no theorem of nonrenormalizability. The source’s statement about observed spin-zero fields remains dated empirical context.

Use `g_μν=η_μν+κh_μν`, η=(+---), with h symmetric, and the normalization `S_EH=(2/κ²)∫sqrt(−det g)R dx`; the physical coupling satisfies `κ²=32πG`. Fix `Γ^λ_μν=(1/2)g^{λρ}(∂_μg_ρν+∂_νg_ρμ−∂_ρg_μν)` and `R_μν=∂_νΓ^λ_μλ−∂_λΓ^λ_μν+Γ^σ_μλΓ^λ_νσ−Γ^σ_μνΓ^λ_λσ`, with `R=g^{μν}R_μν`. Consume [SmoothBundlesConnections B3–B4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1c45ab4061b483b832b5d54f597dc69afd3f97a5/TauCetiRoadmap/SmoothBundlesConnections/README.md#b3-connections-and-covariant-differentiation) for generic connection/curvature identities and `CovariantDerivative.curvatureOperator`. Prove the coordinate comparison and the sign of this Ricci convention against that operator. Consume [HopfRinow L1’s nondegenerate-metric Levi-Civita supplier](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1c99f962c0293ea860da45c79356d70d8bd53414/TauCetiRoadmap/HopfRinow/README.md#layer-1-the-geodesic-equation-the-flow-and-the-exponential-map), including its fixed-signature family and coordinate-Christoffel theorem, and LVF6’s Lorentzian density/index adapter. RQFT11 owns the comparison of that smooth coordinate curvature with the formal jet expansion below. The positive-definite distance/minimizing-geodesic parts of HopfRinow are not used here. Use de Donder gauge `F_μ=∂^νh_μν−(1/2)∂_μh`, `h=η^{μν}h_μν`, and gauge-fixing density `F_μF^μ` (Feynman gauge parameter1). These are the action/curvature conventions of [Donoghue, §2](https://arxiv.org/abs/gr-qc/9405057); derive the quadratic density and propagator rather than importing a formula with a different sign.

Construct the formal carrier explicitly. Start with LVF1’s commutative polynomial jet algebra A on the symmetric h components. Form the metric coefficients in native `PowerSeries A` in formal κ, with total derivatives acting coefficientwise; extend the coefficient carrier by Grassmann ghost/antighost jets with LVF’s graded signs for the ghost action. Construct the inverse metric and the unique square-root series with constant term1 for `−det g`, prove their coefficient recursions and finite jet-order bounds. The raw density has a κ⁻¹ total-divergence term, so first form it in native Laurent series; prove that after quotienting densities by total divergences the Einstein–Hilbert action has a power-series representative starting at κ⁰. State compact-support boundary hypotheses when integrating coefficient identities. This formal construction, including the Ricci density, is owned here. For smooth compactly supported h and real κ in a neighborhood where η+κh remains nondegenerate, prove evaluation on h-jets sends each formal coefficient to the corresponding κ-Taylor coefficient of the smooth inverse metric, square-root density and Ricci scalar. Prove evaluation commutes with total derivatives and that the density identity modulo divergences agrees with coefficientwise integration under compact-support hypotheses. These are formal-to-smooth comparison theorems; smooth metric notation alone does not supply them.

Derive the linearized equation and pure-gauge subspace on tempered solutions whose positive-frequency mass-shell data are smooth packets with compact support away from zero. Define the canonical bundle of solutions modulo residual gauge over the future null cone, its two helicity eigenline subbundles, and its positive inner product; covariant transverse-traceless tensors before the residual-gauge quotient are not a two-dimensional fiber. Pin its fiber form on de Donder plane waves as `B(ε,ε′)=bar(ε)^{μν}ε′_{μν}−(1/2)bar(tr_η ε)tr_η ε′`. Prove pure gauge `k_μξ_ν+k_νξ_μ` lies in its radical on the constrained solution space. Prove the descended form is positive and the quotient has dimension2; frame-dependent transverse-traceless tensors are representatives, with B their spatial sum-of-squares form. Normalize the two TT polarization representatives to B-norm1 and compare with the canonically normalized quadratic action. Construct its completion as L² sections of those helicity lines, with measure `d³p/((2π)^3 2|p|)` and zero momentum treated separately. Prove the gauge independence and frame independence of that inner product and identify the resulting unitary representation with NQS M4’s future-orbit helicity ±2 models (ε=+1, ℓ=±4). Do not assume a global continuous polarization frame. Use RQFT3’s invariant-domain/Fock construction for this physical free carrier; the gauge-fixed auxiliary fields and ghosts are separate graded carriers.

For an infinitesimal coordinate shift κξ fix `δ_ξh_μν=∂_μξ_ν+∂_νξ_μ+κ(ξ^ρ∂_ρh_μν+h_ρν∂_μξ^ρ+h_μρ∂_νξ^ρ)`, with ξ lowered by η, and derive it from the Lie derivative of g. Define the Faddeev–Popov operator `Mξ=δ_ξF` and ghost density `bar(c)^μ(Mc)_μ`; its κ⁰ part is `bar(c)^μ□c_μ`. Prove the formal variation and graded coefficient identities. Prove the gauge-fixed graviton and ghost propagators have homogeneous UV order−2 and every Einstein–Hilbert/ghost interaction vertex has total derivative count2. Count all graviton and ghost internal edges and vertices; with `L=I−V+1`, RQFT6’s nominal degree is `ω=2L+2`. Prove `[κ]=−1` from the canonically normalized quadratic field and action. Construct the auxiliary μ>0 regulated Euclidean graviton/ghost integrands with RQFT6’s tensor-numerator convention; verify the edge and vertex degree hypotheses and derive their nominal subgraph bounds from its generic lemma. The nominal `2L+2` count gives the counterterm derivative-order bound; its positivity neither proves a nonzero divergence nor meets a negative-degree convergence hypothesis. No ultraviolet convergence theorem for graviton loops or μ→0 limit is asserted by this count, and it is not a pointwise bound on the Lorentzian light cone. Record the power-counting counterterm derivative orders without asserting a classification of diffeomorphism-invariant counterterms or a nonzero coefficient for a particular on-shell divergence. Define power-counting renormalizability separately from all-order closure under renormalization, and compare the quadratic free model, which has no interaction vertices, with this nonlinear formal action. [Donoghue, §4](https://arxiv.org/html/2211.09902#S4) supplies the derivative-expansion reference.

## Source-specific completion ledger

This ledger routes every mathematical strand in the two course packets. Each row is an acceptance target, not an accepted result; source locations refer to physical PDF pages and page-specific transcript Markdown in the grounding packet.

| Source strand | Target here / dependency | Completion evidence required |
|---|---|---|
| Borcherds pp. 1–17, 65–87, 120–121: prescription axioms, counterterm maps, fixing group, Lagrangian transform, compact-support pushforward functor and noncompact integration problem | RQFT5 formal graph algebra and GroupLikeExample for p5; RQFT6.ConnectedSubstitution, DiagonalStabilizer.Core, UniformFiniteParameters, InvariantInteractionCarrier and SymmetryStabilizers with the admissible-pair action groupoid; GH2 local Laurent phase with CK K3.MeromorphicGermField finite-pole/regular-evaluation comparison for RadialExtension and TaylorAdapter; RegulatorContinuation owns the separate graph-sector analytic family; PDO P8 generic criteria | Full graph map and precise axioms; prove the p5 basis/group-like worked corollary on the native group algebra; proof of each action/group law, support/extension theorem and source exercise, with unsupported source claims identified. |
| Borcherds pp. 17–24: Fourier/contour/homogeneous fundamental solutions | RQFT0–1,6–7 | Normalization conversion, explicit massless/massive distributions, equations/support/WF, extension uniqueness/ambiguity. |
| Borcherds pp. 25–34: scattering experiments, infinities, particle/interaction history, neutrino chains/detectors, Standard Model masses/charges/gauge groups and references | RQFT9.JetStatistics, SourceDecayLabels and SourceWorkedModels; remaining historical model context | Preserve the Rutherford fixed-target/collider contrast, beta and pion exchange sketches, flavour-versus-colour `SU(3)`, solar/atmospheric chains, detectors, particle table and listed history books (`Rise of the Standard Model`, `Concepts of Particle Physics`). Prove the p26 kinematics and conditional p34 Born-evolution/SU(3)-dimension examples, the p31 declared statistical-model bounds and p32 finite branch counts; retain the cramped count-sentence uncertainty and explicitly record the verified literal p33 mass-number/charge error with its separately labelled editorial comparison. Check factual/date-dependent claims separately; a source-context label is not a proof or a substitute for the named mathematical targets. |
| Borcherds p35: real fields versus complex fields with conjugation | [LVF1 real-field correspondence](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7d1dfbeacf875638ded99fbc6beedf6f1ac3cf03/TauCetiRoadmap/LocalVariationalFieldTheory/README.md#lvf1-jet-local-differential-algebra) | Canonical fixed-real-subspace/scalar-extension equivalences, naturality and category laws, finite dimension and field-jet evaluation compatibility. |
| Borcherds pp. 35–49: Lagrangian, Euler–Lagrange, Noether, Maxwell, gauge identities, forms | LVF consumed; RQFT1–2,9 bridges | Check formula/sign/metric conventions; prove equation and current identities on solutions and the gauge-fixed PDE model. |
| Borcherds pp. 50–60: formal path integral, Gaussian, `Z/W/Γ`, Wick and Feynman graph combinatorics | RQFT0,3,5 including RQFT5.MarkedMetricRealization | Prove finite-dimensional Gaussian identities, formal coefficient identities, connected/Legendre expansions and all `Aut` factors. Prove the p56 marked length-realization/isometry comparison retaining loops, degree-two vertices and decorations; the unmarked metric-circle group is not the finite graph group. Explicitly state no infinite-dimensional measure. |
| Borcherds pp. 61–64: derivatives and homogeneous extension of distributions | RQFT0,6; Mathlib distribution API | Define by duality, compute delta/Euler examples and prove exact extendability obstruction. |
| Borcherds pp. 67–78: product criterion, Feynman/advanced/retarded/massless wavefronts and graph estimates | P8 consumed; RQFT1,6 | Verify conormal cancellation for each concrete product and pullback; classify causal/mass-shell solutions; do not turn sketches into a generic theorem. |
| Borcherds pp. 79–89: distribution/diagram functors, enveloping algebra derivatives, renormalization action, Euclidean/Lorentz integration | RQFT5–7 | Define functorial maps and coproduct/derivative compatibility; prove fiber integration and causal factorization under proper support; isolate scribbled/unclear data. |
| Borcherds p101: the printed quaternion/Pauli matrix splitting | RQFT2.QuaternionPauliModel; native TauCeti quaternion splitting and matrix innerness APIs | Exact I/J/K images, tensor-order comparison, matrix-coefficient inverse and inner comparison with the chosen abstract splitting. |
| Borcherds pp. 90–106: Clifford algebra, graded tensor sign, centre/irreducibles, reflection/Pin/Spin, spinor norm, real-signature table, Dirac/Weyl/Majorana and gamma5 | SpinRepresentations Layers1/4/7 and native Clifford/base-change API; OrthogonalSpinGroups1A–1H including the p99 finite/rational joint-image supplier; LVF finite Spin(3,1) module; RQFT2 signature/gamma/chirality/reality and star/reverse consumer | Verify every signature and dimension formula; keep source tables separate from the native convention and prove the Lorentz specialization. |
| Borcherds pp. 107–111: explicit Dirac gamma matrices, P/C/T and central extension/isoclinism | RQFT2 isoclinism/phase-twisted Lorentz extensions; NQS M2/M4; IR Layer7.AbstractUCE for arbitrary perfect groups and its separate factor-set API; LieGroups Layer5 for connected Lie-group covers | Check matrices against Clifford relation; define linear versus antilinear operations, prove equation/bilinear transformations and exact central group relations. |
| Borcherds pp. 112–119: isoclinism/matrix-form exercises, gamma conjugation, chiral/Dirac currents and QED vertex | RQFT2 isoclinism/matrix-form targets consuming native Matrix.GeneralLinearGroup.innerAut_surjective/ker_innerAut and TauCeti.exists_unit_conj_of_algEquiv; IR factor-set API; LVF Noether; RQFT9 p119 charged-CAR and current/vertex adapter | Prove the given finite matrix/extension assertions under their hypotheses; preserve source uncertainty and prove current/gauge identities. |
| UNSW pp. 1–7, 9–14: action/first variation; static Coulomb Klein–Gordon radial equation, effective noninteger angular momentum, spectrum/critical charge and nonrelativistic correction; squared Dirac/Pauli term, `ns₁/₂` Coulomb radial ansatz/spectrum/correction; KG plane waves, Hamiltonian/charge and scalar quantization | LVF consumed; RQFT1,3,9 | Check the boundary-at-infinity hypothesis, derive reduced radial domains, selected boundary conditions and first-order reconstruction, compare KG/Dirac spectra, then prove continuum/box normalization, mode completeness, commutator, charges and domain. |
| UNSW p8: spin labels, natural units, Compton length and the higher-spin/nonrenormalizability remark | RQFT0 conventions and RQFT11 spin2 and RQFT6 power-counting targets; NQS M4 and QF6a consumed | Prove the unit/representation adapters and model-specific degree calculation; separate superficial bounds from actual divergences, preserve the incomplete source equation and dated empirical remarks. |
| UNSW pp. 15–27: Dirac/gamma/Lorentz/current/gauge/Pauli magnetic limit | RQFT1–3,9; LVF consumed | Matrix identities, covariance, spectral dispersion, gauge and weak-field derivation with exact units. |
| UNSW pp. 28–35: Maxwell/Coulomb modes, constraints, p32 KG nonrelativistic comparison and secondary quantization | RQFT1.KleinGordonNonrelativisticLimit; RQFT1,3,9 | Positive-frequency KG Cauchy domain, quantitative momentum-cutoff bound and compact-time strong Schrödinger limit; Gauss constraint, gauge quotient/transverse splitting, canonical brackets and vacuum convention. |
| UNSW pp. 36–40: perturbation matrix elements and second-order propagator | RQFT5,8 | Derive Dyson/energy-denominator expressions with intermediate-state normalization and convergence status, including the finite-cutoff quadratic external-potential one-to-three spectator calculation and its connected/on-shell distinctions. |
| UNSW pp. 41–49: scalar QED/Dirac propagator/vertices | RQFT1,2,9 | Prove KG square factorization, spinor numerator identity and scalar seagull/vertex factors. |
| UNSW pp. 50–62: photon/fermion scattering, Feynman rules, loops, golden rule/Coulomb | RQFT3,5,8–9 | Full source-specific contractions, signs, delta factors, symmetry factors, gauge constraint cancellation and IR qualification. |

The transcript packets and per-page visual ledger are private grounding evidence at `sources/course-notes/analysis/evidence/` and `sources/course-notes/transcripts/`. Their page count establishes recorded reading only. Source coverage requires each assertion, example and exercise to have an exact implemented supplier or an explicit reviewed roadmap target, with hypotheses and prerequisite owners checked. Suggested signatures validate target types; implementation is a separate claim requiring Lean proofs.

## Required mathematical prerequisites and references

The proof route must include: Fourier transform on Schwartz space and tempered distributions; Reeh–Schlieder under the spectrum, locality, vacuum-cyclicity and common-domain assumptions used in RQFT4; distribution pullback/product/pushforward/extension; finite-order hyperbolic Cauchy theory and causal Green operators; induced Poincaré representation conventions; Fock CCR/CAR and common invariant domains; Lorentz spinor covariance; analytic continuation and tube theorems; Wick combinatorics; graph Hopf algebras and forest formula; local extension/scaling-degree theorem; NQS M0 item2’s real Lorentz LieGroup/LeftInvariantDerivation/connectedness/IsKilling provider, LieGroups2–3’s closed-subgroup/automatic-smoothness/Lie-functor route, LieHighestWeight5’s native complete reducibility and QF5’s finite-dimensional Whitehead H¹, and RQFT6’s affine finite-jet adapter; Haag–Ruelle/LSZ with mass-gap and isolated-shell assumptions; OS reconstruction; UO-D06 closed-form representation and Friedrichs extension; UO-D07 singular endpoint domains and boundary functionals; native regularized confluent-hypergeometric series with QF6b’s shared Kummer ODE/connection interface and RQFT9’s relativistic asymptotic and Coulomb-domain adapters; and gauge/BRST cohomology where Ward identities are claimed. Record the exact theorem/hypothesis pair at each API boundary. A title, citation or imported name is not evidence of a proved prerequisite.

For the scalar smearing, Fock domains and causal-commutator convention, use Fewster–Rejzner, [“Algebraic Quantum Field Theory — an introduction”](https://arxiv.org/abs/1904.04051), §4.3 and Appendix C; their causal operator is advanced-minus-retarded, opposite to RQFT1.

Primary/reference routes to pin during implementation include: Streater–Wightman, *PCT, Spin and Statistics, and All That* (axioms, analyticity, spin-statistics/PCT); Haag, *Local Quantum Physics* (nets and scattering); Reed–Simon II (free relativistic fields and spectral methods); Hörmander, *Analysis of Linear Partial Differential Operators I* (distribution pullback and wavefront product); Brunetti–Fredenhagen, [“Microlocal Analysis and Interacting Quantum Field Theories”](https://doi.org/10.1007/s002200050004) (scaling degree and extension); Epstein–Glaser, [“The Role of Locality in Perturbation Theory”](https://www.numdam.org/item/AIHPA_1973__19_3_211_0/) (causal renormalization); Connes–Kreimer (graph Hopf algebra); Osterwalder–Schrader, [“Axioms for Euclidean Green's Functions II”](https://doi.org/10.1007/BF01608978), §IV.1, Theorem E′→R′ (growth-controlled Euclidean reconstruction); Haag–Ruelle/LSZ original scattering papers; and Bogoliubov–Shirkov or Weinberg, *The Quantum Theory of Fields*, for perturbative conventions. Use the 1975 sufficient reconstruction theorem with its single-parameter growth condition, including the exact n-dependence of the seminorm order. Keep the stronger equivalence revisited in §III separate; the 1973 statement alone is not the chosen reconstruction contract. These references are mathematical prerequisites to verify, not blanket declarations that every theorem has been formalized.
