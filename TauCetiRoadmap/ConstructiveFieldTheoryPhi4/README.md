# Roadmap: constructive scalar field theory on the lattice — φ⁴, Ising and their scaling limits

**Summary.** This roadmap builds the lattice, probabilistic side of Euclidean scalar field theory in every dimension d ≥ 1, entirely with honest probability measures on finite-dimensional spaces and with families of finite-dimensional laws. It starts from single-site measures on ℝ (the φ⁴ measures `exp(−λφ⁴ + bφ²) dφ`, the Gaussian measures and the Ising measure `½(δ₋₁ + δ₁)`), defines the finite-volume Gibbs measures of ferromagnetic pair interactions, and introduces the Griffiths–Simon class of single-site measures through Ising block spins, with the Lee–Yang theorem for ferromagnetic Ising systems as the tool that controls the tails of every Ising-block approximation of a member of the class. It proves the correlation inequalities of the subject in finite volume: Griffiths' first and second inequalities, the FKG inequality, the random current representation and switching lemma of the Ising model, the Lebowitz, Gaussian (Newman) and Simon–Lieb inequalities for the Griffiths–Simon class, and the Messager–Miracle-Solé reflection inequality. On top of these it constructs the free-boundary infinite-volume state and its two-point function, susceptibility and critical point, proves reflection positivity, Gaussian domination and the infrared bound for periodic nearest-neighbour systems with long-range order of the Ising model in d ≥ 3 as an application, and develops random fields indexed by test functions, Schwinger functions, Gaussian random fields and Wick's law. It closes by defining the random fields reachable as scaling limits of lattice systems (Aizenman–Duminil-Copin, Definition 1.1), proving their basic structure and that the massive (and in d ≥ 3 the massless) Gaussian free field is reachable from Gaussian lattice fields. The marginal triviality theorem of Aizenman and Duminil-Copin and its Griffiths–Simon extension are downstream goals owned by ConstructiveFieldTheoryPhi4PartII.

The end theorems are the Lee–Yang theorem (`leeYang`) and the tail control and finite-volume transfer of the Griffiths–Simon class (`isingBlock_tailControl`, `tendsto_gibbs_of_isingBlock`) with the membership of every φ⁴ measure (`phi4Measure_mem_griffithsSimonClass`); the correlation inequalities of Layer 3 (`griffiths_first`, `griffiths_second`, `fkg_gibbs`, `switching_lemma`, `gaussian_inequality`, `simon_lieb`, `messager_miracleSole`, `newman_bound`); the free-boundary infinite-volume state (`exists_infiniteVolume_limit`); reflection positivity, the chessboard estimate, Gaussian domination, the infrared bound and Ising long-range order in d ≥ 3 (`reflectionPositive`, `chessboard`, `gaussian_domination`, `infrared_bound`, `ising_longRangeOrder`); Gaussian processes with a prescribed covariance and Wick's law (`exists_unique_gaussianProcess`, `isGaussianProcess_iff_wick`); the existence and symmetries of the reachable random field of a convergent scheme (`exists_reachableField`); and the reachability of the Gaussian free field (`gff_reachable`).

Suggested home: `TauCeti/Probability/LatticeFieldTheory/`, divided into `SingleSite/`, `Gibbs/`, `GriffithsSimon/`, `Correlation/`, `RandomCurrent/`, `InfiniteVolume/`, `ReflectionPositivity/`, `RandomField/` and `Reachable/`. [`Suggested.lean`](Suggested.lean) states the headline theorems against the pinned libraries; it is not the roadmap.

## Scope and ownership

This roadmap owns, at the generality stated in its layers: single-site measures, the Griffiths–Simon class and its finite-volume transfer, the Lee–Yang theorem for ferromagnetic Ising pair interactions with complex fields of positive real part, and the Lee–Yang property of Ising-block measures (Layers 0 and 2); finite-volume Gibbs measures of pair interactions on finite sets, including Gaussian lattice fields (Layer 1); the finite-volume correlation inequalities and the random current representation with its switching lemma (Layer 3); the free-boundary infinite-volume state on ℤ^d (Layer 4); reflection positivity, Gaussian domination and the infrared bound on the discrete torus (Layer 5); random fields indexed by compactly supported continuous test functions, Schwinger functions, Gaussian processes with a prescribed covariance kernel and Wick's law (Layer 6); reachable random fields and the reachability of the Gaussian free field (Layer 7). ConstructiveFieldTheoryPhi4PartII owns the marginal-triviality goals below. The continuum analytic kernels used in Layer 7 are imported as specified below. The construction of a Gaussian process with an arbitrary positive semidefinite covariance kernel on an arbitrary index set (6.3) is general probability rather than field theory; it is owned here because every Gaussian random field of this roadmap is built from it, and StochasticCalculus §1.1 supplies only the extension theorem it rests on.

Material consumed from elsewhere, by section:

- **Kolmogorov extension.** The existence and uniqueness of a probability measure on an arbitrary product of standard Borel spaces with prescribed consistent finite-dimensional marginals is StochasticCalculus §1.1. The countable case is Tau Ceti's `TauCeti.Measure.exists_isProjectiveLimit_of_countable`; ℤ^d is countable, so Layer 4 needs only that, while Layer 6 (index set the uncountable space of test functions) needs StochasticCalculus §1.1.
- **Gaussian moments.** The Wick–Isserlis formula for the even moments of centred multivariate Gaussian vectors with positive semidefinite covariance, as sums over pairings, is StandardDistributions §5.3 (the pinned Tau Ceti has only its fourth-moment case, `TauCeti.Probability.integral_mul_mul_mul_multivariateGaussian`). The integrability of coordinate monomials and the vanishing of odd centred products, for every covariance matrix, are Tau Ceti's `TauCeti.Probability.integrable_prod_pow_sub_multivariateGaussian` and `TauCeti.Probability.integral_prod_sub_multivariateGaussian_eq_zero_of_odd`. Moment determinacy under an exponential moment is Tau Ceti's `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`.
- **Pairings.** The pairings of a finite set of even cardinality, over which the Gaussian inequality of 3.5 and Wick's law of 6.4 sum, are Tau Ceti's perfect matchings `TauCeti.PerfectMatching` (fixed-point-free involutions), with their count `(2n − 1)!!` (`TauCeti.card_perfectMatching`).
- **Hadamard factorisation.** The product formula for an entire function of order at most one that does not vanish at 0 is ZerosOfLFunctions §5.5; 2.1 applies it to the Laplace transforms of Ising-block measures.
- **FKG on finite lattices.** The FKG and Holley inequalities for log-supermodular weights on a finite distributive lattice are Mathlib's `fkg` and `holley`; 3.3 extends them to Gibbs measures on ℝ^V.

Left to other roadmaps:

- The geometry of random currents beyond the switching lemma (current intersection probabilities, the tree diagram and improved tree diagram bounds, the mixing property of random currents), the transfer-matrix spectral representation of the two-point function, the identification below the critical point of the free-boundary, periodic and boundary-condition infinite-volume limits (Aizenman–Duminil-Copin, Proposition 5.2, stated there without proof), the infinite-volume and sliding-scale infrared bounds, the lower bound on the two-point function at criticality, the uniform local integrability of rescaled two-point functions, and the marginal-triviality theorems (downstream goals 8.1 and 8.2), including their statements and proofs, belong to ConstructiveFieldTheoryPhi4PartII, which consumes this roadmap.
- Osterwalder–Schrader reconstruction, Euclidean free Schwinger distributions as tempered functionals and Wightman fields belong to RelativisticQuantumFieldTheory. Its §7.1 supplies the analytic continuum Green kernels of `−Δ + m²`, their Fourier agreement, exterior decay and massless radial formula, and its §7.3 the massless limit in dimension at least three. This roadmap owns the C_c-indexed probability law, its block normalization and its lattice reachability (7.4), and the covariance form `C_m` on C_c(ℝ^d) for every d ≥ 1 and every m ≥ 0 allowed in 7.4, which differs from the massive reflected covariance of RelativisticQuantumFieldTheory §7.6 (m > 0, four-dimensional Schwartz tests) in its carrier and in its range of (d, m).
- The two-dimensional stochastic quantisation equation and its Gibbs measure are a PDE topic (PDE, Scope and ownership: the stochastic programme assigned to PDE, Part II). Quantum spin systems and KMS states are OperatorAlgebraDynamics D9.
- Lee–Yang theory beyond the theorem of 2.1 and its consequence for Ising-block measures (the Lee–Yang property of general single-site measures and of multicomponent spins, and the location of zeros in infinite volume), the GHS inequality, the Peierls argument, the DLR formalism of specifications and uniqueness of Gibbs measures are not part of this roadmap; the free-boundary state of Layer 4 is constructed by monotone limits and needs none of them.

## Conventions

**Lattice and boxes.** d ≥ 1 is the dimension. The Lean statements take d ∈ ℕ: at d = 0, where ℤ⁰ and every torus T_L are a single point, each of them holds trivially or vacuously, except the chessboard estimate of 5.2, which uses that `|T_L| = (2L)^d` is even and carries the hypothesis d ≥ 1. Points of ℤ^d are functions `Fin d → ℤ`, embedded in ℝ^d = `EuclideanSpace ℝ (Fin d)` coordinatewise, the lattice point x at scale L going to x/L (`latticePoint`). For x ∈ ℤ^d, `‖x‖₁ = Σ_j |x_j|`, `‖x‖∞ = max_j |x_j|` (Mathlib's norm on `Fin d → ℤ`) and |x| is the Euclidean norm. For R ∈ ℕ the box is `V_R = [−R, R]^d ∩ ℤ^d` (`box`), with `(2R + 1)^d` points; the block of side L is `Λ_L = V_L` (Aizenman–Duminil-Copin (1.8) and (1.15)). Q denotes the closed cube `[−1, 1]^d ⊂ ℝ^d` and `1_Q` its indicator. The hyperoctahedral group W_d of signed permutation matrices acts on ℤ^d and on ℝ^d; it preserves every V_R.

**Couplings and the Hamiltonian.** A coupling on a finite set V is a real function J on the unordered pairs of points of V (Mathlib's `Sym2 V`), equivalently a symmetric function V × V → ℝ, written `J_{xy} = J({x, y})`; it is ferromagnetic if J ≥ 0. Its values on the diagonal pairs {x, x} play no role. The Hamiltonian of a configuration φ ∈ ℝ^V (`hamiltonian`) is minus the sum over unordered pairs {x, y} of distinct sites, `H_{V,J}(φ) = −Σ_{{x,y}} J_{xy} φ_x φ_y`, as in Aizenman–Duminil-Copin (1.12) and (1.16); equivalently, it is minus one half of the sum over ordered pairs, `H_{V,J}(φ) = −½ Σ_{x≠y} J_{xy} φ_x φ_y`. The inverse temperature is absorbed into J. The restriction of a coupling on V to a subset Λ is its composition with `Sym2.map` of the inclusion. Witness: for V = {x, y}, `J_{xy} = J` and the Ising measure, both forms give `H(1, 1) = −J`, `Z = cosh J` and `⟨σ_x σ_y⟩ = tanh J` (for `J = (log 3)/2`: `Z = 2/√3` and `⟨σ_x σ_y⟩ = 1/2`); omitting the factor ½ from the ordered sum doubles the coupling and gives `tanh 2J` (4/5 at `J = (log 3)/2`), and halving the unordered sum gives `tanh(J/2)` (`2 − √3`). The nearest-neighbour coupling of strength J ≥ 0 on a subset of ℤ^d is `J_{xy} = J · 1[‖x − y‖₁ = 1]`, J times `nnCoupling`, and `|J| = Σ_y J_{0y} = 2dJ`. The row norm of a coupling is `‖J‖ = max_x Σ_{y≠x} |J_{xy}|`.

**Single-site measures.** Single-site measures are Borel probability measures ρ on ℝ. The φ⁴ measure (`phi4Measure`) is `ρ_{λ,b}(dφ) = z⁻¹ exp(−λφ⁴ + bφ²) dφ` for λ > 0 and b ∈ ℝ, the sign of b as in Aizenman–Duminil-Copin (1.12); Simon's Twelve Tales (Section 3, p. 25) writes `exp(−aφ⁴ − bφ²)` with the opposite sign. For b < 0, `γ_b = ρ_{0,b}` is the centred Gaussian of variance `1/(2|b|)`. Witness: `γ_{−1/2}` is the standard normal law `ProbabilityTheory.gaussianReal 0 1`; under the opposite sign convention it would be b = +½. The Ising measure is `ρ_I = ½(δ₋₁ + δ₁)` (`isingMeasure`).

**Expectations and multi-indices.** `⟨·⟩_{V,J,ρ}` is the expectation under the finite-volume Gibbs measure of Layer 1. A multi-index on V is a function A : V → ℕ, `φ_A = Π_x φ_x^{A(x)}` and `|A| = Σ_x A(x)`; for Ising spins and a set A ⊆ V, `σ_A = Π_{x∈A} σ_x`. Truncated quantities such as `⟨F ; G⟩ = ⟨FG⟩ − ⟨F⟩⟨G⟩` are written with a semicolon.

**Torus and Fourier conventions.** For L ≥ 1 the torus is `T_L = (ℤ/2Lℤ)^d`, the type `Fin d → ZMod (2 * L)`, with `|T_L| = (2L)^d`. Its periodic nearest-neighbour coupling of strength J (`torusCoupling`) counts one bond per vertex and direction: the Hamiltonian is `−J Σ_{x∈T_L} Σ_{j=1}^d φ_x φ_{x+e_j}`. For L ≥ 2 this is the nearest-neighbour coupling of the torus graph; for L = 1, where `x + e_j = x − e_j`, each pair of neighbours carries the coupling 2J. The dual torus is `Λ*_L = (π/L)ℤ^d ∩ (−π, π]^d`, lattice Fourier modes are `e^{ip·x}` (no factor 2π), `E(p) = 2 Σ_j (1 − cos p_j)` is the symbol of the lattice Laplacian `−Δ`, and `Ŝ_L(p) = Σ_{x∈T_L} e^{ip·x} ⟨φ_0 φ_x⟩` (Aizenman–Duminil-Copin (5.7)–(5.8)). Since `e^{ip·x}` with x ∈ ℤ^d depends on p only modulo 2π, a dual point is written `p = (π/L)k` with k ∈ (ℤ/2Lℤ)^d, the representative `k_j ∈ {0, …, 2L − 1}` giving p ∈ [0, 2π)^d instead of (−π, π]^d; `torusSymbol` is E at this point and `structureFactor` is Ŝ_L, written with cosines because the two-point function is even in x. The infrared bound of Layer 5 reads `E(p) Ŝ_L(p) ≤ 1/J` for p ≠ 0 and J > 0. Witness: for the Gaussian lattice field on the torus with single-site measure γ_b, |b| > dJ, one computes `Ŝ_L(p) = 1/(2(|b| − dJ) + J E(p))`, so the constant 1/J is attained in the limit |b| ↓ dJ; this agrees with Peled–Spinka (52), p. 35, while the constant printed in Aizenman–Duminil-Copin (5.9), `1/(2|J|β)` with `|J| = 2dJ`, is smaller by the factor 4d and is violated by this Gaussian field and by the Ising example of 5.4.

**Test functions and the continuum Fourier transform.** Aizenman–Duminil-Copin's `C_0(ℝ^d)` is the space of compactly supported continuous functions; here it is Mathlib's `CompactlySupportedContinuousMap` on `EuclideanSpace ℝ (Fin d)` with values in ℝ, written C_c(ℝ^d) (not Mathlib's space of functions vanishing at infinity). The continuum Fourier transform is Mathlib's `𝓕` with kernel `e^{−2πi⟨x,ξ⟩}` (`Real.fourier_eq`); the symbol of `−Δ + m²` is then `4π²|ξ|² + m²`. The Gaussian free field covariance is `C_m(f, g) = ∫ conj(𝓕f(ξ)) 𝓕g(ξ) / (4π²|ξ|² + m²) dξ` (`gffCovariance`, taken as the real part of the integral, which is real for real f and g because `conj(𝓕f(ξ)) = 𝓕f(−ξ)`). Witness: for d = 1 this is `∫∫ f(x) e^{−m|x−y|}/(2m) g(y) dx dy`, because the Fourier transform of `e^{−m|x|}/(2m)` is `1/(m² + 4π²ξ²)`.

**Total functions.** The rescaled lattice field divides by the square root of a finite block second moment Σ ≥ 0 (a variance when ρ is even); with Lean's conventions `√0 = 0` and `0⁻¹ = 0` the field is identically zero when Σ = 0, which, for a stable Gibbs law with integrable coordinate squares and a nonempty block, happens exactly for ρ = δ₀. An infinite second moment is excluded from this real normalization, rather than assigned the junk value of a real integral. Monotone limits of nonnegative correlation functions are taken in `[0, ∞]`.

## Exact supplier contracts

### From Mathlib

The pin is 1b1ccf4b088b32fa3f23f2de1127433254a81e1e. The following declarations are consumed, each read at the pin.

- `MeasureTheory.Measure.IsNegInvariant` (Mathlib/MeasureTheory/Group/Measure.lean:310): invariance of a measure under negation, `μ.neg = μ`; it is the evenness of single-site measures and of Gibbs measures throughout.
- `ProbabilityTheory.integrableExpSet` (Mathlib/Probability/Moments/IntegrableExpMul.lean:112): the set of t for which `exp(tX)` is integrable; admissibility of ρ is `integrableExpSet (fun φ ↦ φ²) ρ = Set.univ`.
- `MeasureTheory.Integrable` and `MeasureTheory.Integrable.mono'` (Mathlib/MeasureTheory/Function/L1Space/Integrable.lean:58 and 104): integrability is a.e. strong measurability together with a finite integral of the norm, and an a.e. strongly measurable function dominated almost everywhere by an integrable one is integrable. Domination does not supply measurability; used in the integrability API of 0.1.
- `MeasureTheory.Measure.pi` (Mathlib/MeasureTheory/Constructions/Pi.lean:211), `MeasureTheory.Measure.withDensity` (Mathlib/MeasureTheory/Measure/WithDensity.lean:39) and `MeasureTheory.Measure.map` (Mathlib/MeasureTheory/Measure/Map.lean:96): the product `ρ^{⊗V}`, the unnormalised single-site weight `ρ̃ = e^{dJφ²}ρ` of 5.3, and laws of block spins and rescaled fields. `MeasureTheory.Measure.infinitePi` (Mathlib/Probability/ProductMeasure.lean:354) is the J = 0 infinite-volume state.
- `MeasureTheory.Measure.tilted` (Mathlib/MeasureTheory/Measure/Tilted.lean:42), with `MeasureTheory.isProbabilityMeasure_tilted` (line 125), `MeasureTheory.tilted_of_not_integrable` (line 46), `MeasureTheory.integral_tilted` (line 229) and `MeasureTheory.tilted_tilted` (line 250): `μ.tilted f` is `μ.withDensity (e^{f}/∫ e^{f} dμ)`, a probability measure when `e^{f}` is μ-integrable and μ ≠ 0, and the zero measure when `e^{f}` is not μ-integrable; tilting a tilt by g is the tilt by f + g when `e^{f}` is μ-integrable. The φ⁴ measure of 0.2 is the tilt of Lebesgue measure by `−λφ⁴ + bφ²`, the Gibbs measure of Layer 1 is the tilt of `ρ^{⊗V}` by `−H`, and the tilted single-site measures of 0.1 and 1.1 are tilts of ρ; no separate normalised-density construction is made.
- `MeasureTheory.IsProjectiveMeasureFamily`, `MeasureTheory.IsProjectiveLimit` and `MeasureTheory.IsProjectiveLimit.unique` (Mathlib/MeasureTheory/Constructions/Projective.lean:45, 115 and 150): the language of the Kolmogorov extension in Layers 4 and 6. Mathlib has no Kolmogorov extension theorem for a general projective family (its Brownian motion file, Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean:24–26, says so); it proves a projective limit to exist only for product families (`MeasureTheory.Measure.isProjectiveLimit_infinitePi`, Mathlib/Probability/ProductMeasure.lean:362), for Ionescu-Tulcea trajectories (`ProbabilityTheory.Kernel.isProjectiveLimit_trajFun`, Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean:484) and for the finite-dimensional laws of a process already constructed (`ProbabilityTheory.isProjectiveLimit_map`, Mathlib/Probability/Process/FiniteDimensionalLaws.lean:53). The Gaussian families of 6.3 and the random-field families of 6.1 are in general of none of these kinds.
- `ProbabilityTheory.map_eq_iff_forall_finset_map_restrict_eq` (Mathlib/Probability/Process/FiniteDimensionalLaws.lean:61): equality of laws of processes is equality of all finite-dimensional laws; this is equality up to finite-dimensional distributions in Layer 6.
- `ProbabilityTheory.IsGaussianProcess` (Mathlib/Probability/Distributions/Gaussian/IsGaussianProcess/Def.lean:30): a structure whose single field says that every restriction to a finite index set has a Gaussian law (`ProbabilityTheory.HasGaussianLaw`, Mathlib/Probability/Distributions/Gaussian/HasGaussianLaw/Def.lean:33); `ProbabilityTheory.IsGaussian` (Mathlib/Probability/Distributions/Gaussian/Basic.lean:45) says that every continuous linear functional has a real Gaussian law `ProbabilityTheory.gaussianReal`. A generalised Gaussian process of Layer 6 is `ProbabilityTheory.IsGaussianProcess` for a random field; Mathlib's definition does not require centring.
- `ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.measurePreserving_restrict₂_multivariateGaussian` and `ProbabilityTheory.charFun_multivariateGaussian` (Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166, 241 and 233, respectively): finite-dimensional Gaussian laws and their restriction marginals, for the projective family of 6.3; `ProbabilityTheory.BrownianReal.projectiveFamily` (Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean:81) is the pattern for the kernel min(s, t).
- `MeasureTheory.Measure.ext_of_charFun` (Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean:257), `MeasureTheory.ProbabilityMeasure.tendsto_iff_tendsto_charFun` (Lévy's continuity theorem, Mathlib/MeasureTheory/Measure/LevyConvergence.lean:214) and `tendstoInDistribution_iff_tendstoInDistribution_inner` (Cramér–Wold, Mathlib/Probability/CramerWold.lean:39): weak convergence and identification of finite-dimensional laws in Layers 1, 4, 6 and 7.
- `MeasureTheory.ProbabilityMeasure` with its topology of weak convergence, `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` (Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:367) and `isCompact_closure_of_isTightMeasureSet` (Prokhorov, Mathlib/MeasureTheory/Measure/Prokhorov.lean:530).
- `fkg` and `holley` (Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370 and 352): the FKG and Holley inequalities for a nonnegative log-supermodular weight μ and nonnegative monotone functions on a finite distributive lattice, used for the discretisation route of 3.3 (a bounded function is made nonnegative by adding a constant, which changes both sides of the FKG inequality by the same amount). They say nothing about measures on ℝ^V.
- `CompactlySupportedContinuousMap` (Mathlib/Topology/ContinuousMap/CompactlySupported.lean:41): the index space of random fields.
- `Sym2`, `Sym2.lift` and `Sym2.map` (Mathlib/Data/Sym/Sym2.lean): unordered pairs, the carrier of couplings and of currents (the off-diagonal pairs); `ZMod` with `ZMod.val`: the torus `Fin d → ZMod (2 * L)` of Layer 5.
- `BoundedContinuousFunction` and `ProbabilityTheory.gaussianReal`: weak convergence is stated by integrals of bounded continuous functions (4.2, 7.4); `gaussianReal 0 v` is the Gaussian single-site measure of variance v (1.5, 7.4).
- `Real.fourier_eq` (Mathlib/Analysis/Fourier/FourierTransform.lean:434): the continuum Fourier transform and its normalisation; `ZMod.dft` (Mathlib/Analysis/Fourier/ZMod.lean:87): the discrete Fourier transform on `ZMod N`, used coordinatewise on the torus.
- `ae_eq_zero_of_integral_contDiff_smul_eq_zero` (Mathlib/Analysis/Distribution/AEEqOfIntegralContDiff.lean:186): a locally integrable function whose integrals against all smooth compactly supported functions vanish is zero almost everywhere; it gives uniqueness of Schwinger functions in 6.2.
- `integral_gaussian` (Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean:210) and `Real.Gamma` (Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:402): normalisations and moments of the single-site measures.
- `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (Mathlib/Analysis/Calculus/ParametricIntegral.lean:569): differentiation under the integral sign, for the coupling derivatives of 1.3.
- `Complex.norm_le_of_forall_mem_frontier_norm_le` (Mathlib/Analysis/Complex/AbsMax.lean:404): the maximum modulus principle for a function complex differentiable on a bounded set and continuous on its closure; it is the step of Hurwitz's argument in 2.1.
- `MeasureTheory.isTightMeasureSet_of_isCompact_closure` (Mathlib/MeasureTheory/Measure/Prokhorov.lean:636): a set of probability measures with compact closure on a complete separable metric space is tight; applied in 2.2 to the range of a weakly convergent sequence.
- `Real.young_inequality` (Mathlib/Analysis/MeanInequalities.lean:547): `ab ≤ |a|^p/p + |b|^q/q` for conjugate exponents p, q; used for the growth bound in 2.2.
- `ProbabilityTheory.mgf_id_gaussianReal` (Mathlib/Probability/Distributions/Gaussian/Real.lean:503): the moment generating function `t ↦ exp(μt + vt²/2)` of `gaussianReal μ v`; it writes `e^{cφ²}` as a Gaussian average of `e^{√(2c) g φ}` in 2.2.
- `Stirling.stirlingSeq`, `Stirling.stirlingSeq_one`, `Stirling.stirlingSeq'_antitone`, `Stirling.tendsto_stirlingSeq_sqrt_pi` and `Stirling.le_factorial_stirling` (Mathlib/Analysis/SpecialFunctions/Stirling.lean:56, 64, 154, 211 and 248): the sequence `n!/(√(2n)(n/e)ⁿ)` equals e/√2 at n = 1 and decreases for n ≥ 1 to √π, so `√(2πn)(n/e)ⁿ ≤ n! ≤ e√n (n/e)ⁿ` for n ≥ 1 (at n = 1: `0.922 ≤ 1 ≤ 1`); used for the binomial bounds and the local limit of 2.3.
- `MeasureTheory.Measure.conv` (Mathlib/MeasureTheory/Group/Convolution.lean:35, generated with `MeasureTheory.Measure.mconv`), `MeasureTheory.Measure.rnDeriv_le_one_of_le` (Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean:418) and `MeasureTheory.continuous_of_dominated` (Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:474): the convolution `μ ∗ ν` is the image of `μ ⊗ ν` under addition; a measure below a σ-finite measure ν has Radon–Nikodym derivative at most 1 ν-almost everywhere; an integral of functions continuous in a parameter and dominated by one integrable bound is continuous in the parameter. Used in the route of 5.3.

### From Tau Ceti

The pin is 2fd255d997f47c0b5d834ee416c7015d55444ce5.

- `TauCeti.Measure.exists_isProjectiveLimit_of_countable` (TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165): a projective family of probability measures on the finite subproducts of a countable family of standard Borel spaces has a projective limit, which is a probability measure. Used for the infinite-volume law on `ℝ^{ℤ^d}` in 4.2.
- `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` (TauCeti/Probability/Moments/Determinacy.lean:246): two finite measures on ℝ, each with `∫ e^{a|x|} < ∞` for some a > 0, and with equal polynomial moments, are equal. Used in 4.2 and 6.4.
- `TauCeti.Probability.integrable_prod_pow_sub_multivariateGaussian` (TauCeti/Probability/Distributions/Gaussian/MixedMoments.lean:135) and `TauCeti.Probability.integral_prod_sub_multivariateGaussian_eq_zero_of_odd` (TauCeti/Probability/Distributions/Gaussian/OddMoments.lean:102): under `ProbabilityTheory.multivariateGaussian m S`, for any square matrix S, every product of powers of shifted coordinates `Π_i (x_i − c_i)^{n_i}` is integrable, and every product of an odd number of centred coordinates `x_{j(k)} − m_{j(k)}`, repetitions allowed, has integral 0. Used in 6.4.
- `TauCeti.Probability.centralMoment_id_two_mul_gaussianReal` (TauCeti/Probability/Distributions/Gaussian/Moments.lean:147): the even central moments `(2n − 1)!! vⁿ` of `gaussianReal m v`, used in Checks of Layers 0, 3 and 6.
- `TauCeti.PerfectMatching` and `TauCeti.card_perfectMatching` (TauCeti/Combinatorics/Enumerative/PerfectMatching.lean:129 and 619): the perfect matchings of a finite type, the permutations that are involutions without fixed points, and their number `(2m − 1)!!` on a type of cardinality 2m. A matching π pairs i with π(i), and a product over the pairs is the product over the i with i < π(i). They index the sums over pairings in 3.5 and 6.4.

### From TauCetiRoadmap.StochasticCalculus

§1.1: for an arbitrary index type I, standard Borel spaces X_i and a family of probability measures P_F on `Π_{i∈F} X_i`, F ⊆ I finite, satisfying `MeasureTheory.IsProjectiveMeasureFamily`, there is a probability measure on `Π_i X_i` with the product σ-algebra that is a projective limit of the family, and it is unique (by `MeasureTheory.IsProjectiveLimit.unique`). Used with I = C_c(ℝ^d) and X_i = ℝ in 6.1 and 6.3. Nothing else of that roadmap is assumed.

### From TauCetiRoadmap.StandardDistributions

§5.3 (mixed moments): for a centred random vector Z with law `ProbabilityTheory.multivariateGaussian 0 S`, S positive semidefinite, and indices `i_1, …, i_{2n}`, repetitions allowed, `E[Z_{i_1} ⋯ Z_{i_{2n}}] = Σ_π Π_{j=1}^n S_{i_{π(2j−1)} i_{π(2j)}}` with π over the pairings of {1, …, 2n}. Used in 6.4. Nothing else of that roadmap is assumed.

### From TauCetiRoadmap.ZerosOfLFunctions

§5.5 (`hadamard_of_orderLE_one`): an entire function f of order at most 1 in the sense of that roadmap's predicate `OrderLE` (for every A′ > 1, `f(s) = O(exp ‖s‖^{A′})`), with f(0) ≠ 0, is `exp(a + bs)` times the unconditionally convergent product of `(1 − s/ρ) e^{s/ρ}` over its zeros ρ, repeated according to multiplicity. Used in 2.1 for the Laplace transform of an Ising-block measure, which is bounded by `e^{|h| Σ_n q_n}` and equals 1 at 0. Nothing else of that roadmap is assumed.

### From TauCetiRoadmap.RelativisticQuantumFieldTheory

§7.1 and §7.3: for m > 0 and d ≥ 1, the positive radial locally integrable Green kernel of `−Δ + m²`, given away from zero by its heat integral, has Mathlib-normalized Fourier multiplier `(4π²|ξ|² + m²)⁻¹` and exponential exterior decay with any rate 0 < c < m. For m = 0 and d ≥ 3, §7.1 gives the radial fundamental solution `|x|^{2−d}/((d − 2)|S^{d−1}|) = Γ(d/2 − 1)/(4π^{d/2}|x|^{d−2})` of `−Δ` for x ≠ 0, with the harmonic-polynomial ambiguity classified, and §7.3 (item 1) proves `G_m → G_0` without subtraction, the multipliers being dominated by `(4π²|ξ|²)⁻¹`; together they identify the Fourier transform of this decaying kernel with `(4π²|ξ|²)⁻¹`, and no harmonic-polynomial addition is included. Layer 7 consumes these analytic facts, while its test-function Gaussian probability law, block second-moment normalization and lattice scaling limit are owned here.

## How to read the build

Layer 0 fixes the single-site measures and the admissibility condition that makes every finite-volume measure exist. Layer 1 builds the finite-volume Gibbs measures, their symmetries, their dependence on the couplings and on the single-site measure, and the Gaussian lattice fields. Layer 2 realises lattice systems with Ising-block single-site measures as images of Ising systems and defines the Griffiths–Simon class as their limits; through the Lee–Yang theorem it controls the tails of every Ising-block sequence converging to a member, which transfers finite-volume statements to the class, and it proves that φ⁴ measures belong to it. Layer 3 proves the finite-volume correlation inequalities: Griffiths and FKG for general single-site measures, the random current representation of the Ising model and, through it and Layer 2, the Lebowitz, Gaussian and Simon–Lieb inequalities for the Griffiths–Simon class, the Messager–Miracle-Solé reflection inequality and uniform moment bounds. Layer 4 takes monotone infinite-volume limits and defines the two-point function, the susceptibility and the critical point. Layer 5 is independent of Layers 2–4: it treats periodic systems on the torus, proves reflection positivity, Gaussian domination and the infrared bound, and derives long-range order of the Ising model in d ≥ 3. Layer 6 is independent of Layers 0–5: it develops random fields indexed by test functions, Schwinger functions, Gaussian random fields and Wick's law. Layer 7 combines Layers 1 and 6 into reachable random fields and proves the reachability of the Gaussian free field. The downstream marginal-triviality goals specify what ConstructiveFieldTheoryPhi4PartII proves from this foundation.

## Layer 0: Single-site measures

### 0.1 Admissible and even single-site measures

Define a single-site measure ρ (a Borel probability measure on ℝ) to be admissible (`IsAdmissible`) if `exp(cφ²)` is ρ-integrable for every real c. A single-site measure is even if it is invariant under φ ↦ −φ; this is Mathlib's `MeasureTheory.Measure.IsNegInvariant` (the class whose field says `μ.neg = μ`), and no new notion is introduced. Admissibility is the condition under which every finite-volume Gibbs measure of Layer 1 exists for every coupling; it is strictly stronger than the integrability of `exp(cφ²)` for a single c > 0 (which the Gaussian laws have), and strictly weaker than the growth condition `∫ exp(|φ|^α) dρ < ∞` for some α > 2 of Aizenman–Duminil-Copin (2.2), p. 9: the law with density proportional to `exp(−φ² log(1 + φ²))` is admissible but fails (2.2) for every α > 2.

The API consists of the following facts.

- Agreement with the library: ρ is admissible iff `ProbabilityTheory.integrableExpSet (fun φ ↦ φ²) ρ` is all of ℝ.
- An admissible ρ integrates `exp(cφ² + hφ)` for all real c and h, hence every polynomial; and every ρ-a.e. measurable F : ℝ → ℝ with `|F(φ)| ≤ C e^{cφ²}` for ρ-almost every φ, for some C ≥ 0 and real c, is ρ-integrable (domination alone does not give measurability, which Mathlib's `MeasureTheory.Integrable` requires).
- Admissibility is preserved by the images under φ ↦ sφ (s ∈ ℝ), by finite convex combinations, and by tilting: for an admissible probability measure ρ and real a, h, the tilt `ρ.tilted (φ ↦ aφ² + hφ)`, which is `exp(aφ² + hφ) ρ / ∫ exp(aφ² + hφ) dρ`, is an admissible probability measure.
- For admissible ρ, every finite set V and every real c, `∫ exp(c Σ_{x∈V} φ_x²) d ρ^{⊗V} = (∫ exp(cφ²) dρ)^{|V|}` is finite.
- A probability measure with bounded support is admissible; so is one with a density bounded by `C exp(−ψ(φ))` where `ψ(φ)/φ² → ∞` as |φ| → ∞.
- If ∫ exp(|φ|^α) dρ < ∞ for some α > 2 then ρ is admissible, because `cφ² ≤ |φ|^α + C_{c,α}`.
- An even measure with a finite n-th absolute moment has vanishing n-th moment for n odd, and ρ is even iff its characteristic function is real.

*Needs:* Mathlib `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.map`, `MeasureTheory.Measure.IsNegInvariant`, `ProbabilityTheory.integrableExpSet`, `MeasureTheory.Integrable.mono'`, `MeasureTheory.Measure.tilted`.

**Checks.**

- The Dirac measure δ_a is admissible, with `∫ e^{cφ²} dδ_a = e^{ca²}`, and it is even exactly for a = 0.
- The standard normal law is not admissible: `∫ e^{φ²/2} dN(0,1) = ∞`. Weakening "every c" to "some c > 0" would admit it, and then for two sites with `J_{xy} = J ≥ 1` the partition function `∫∫ e^{Jφ_xφ_y} dN(0,1)⊗N(0,1)` is infinite (the quadratic form `½(φ_x² + φ_y²) − Jφ_xφ_y` is not positive definite), so no Gibbs measure exists.
- The Cauchy law is not admissible (it has no second moment).
- `(2δ₋₁ + δ₁)/3` is admissible but not even: its mean is −1/3.
- Measurability is needed in the domination statement: for ρ the uniform law on [0, 1] (admissible, bounded support), `F = 1_{[0,1/2]}` satisfies `|F| ≤ 1` (C = 1, c = 0) and has integral ½, while the indicator of a Vitali subset of [0, 1] satisfies the same bound but is not ρ-a.e. measurable (it agrees with no Borel function outside a Lebesgue-null set), so it is not ρ-integrable.

### 0.2 The φ⁴, Gaussian and Ising single-site measures

Define, for λ > 0 and b ∈ ℝ, the φ⁴ measure `ρ_{λ,b}` (`phi4Measure`) with density `z_{λ,b}⁻¹ exp(−λφ⁴ + bφ²)` with respect to Lebesgue measure, where `z_{λ,b} = ∫ exp(−λφ⁴ + bφ²) dφ ∈ (0, ∞)` (Aizenman–Duminil-Copin (1.12), p. 4); it is Mathlib's tilt of Lebesgue measure by `φ ↦ −λφ⁴ + bφ²`, which for λ < 0, and for λ = 0 with b ≥ 0, is the zero measure (the density is not integrable). Define, for b < 0, the Gaussian single-site measure `γ_b = ρ_{0,b}` with density proportional to `exp(bφ²)`. Define the Ising measure `ρ_I = ½(δ₋₁ + δ₁)` (`isingMeasure`; Aizenman–Duminil-Copin (1.16)–(1.17), p. 5). For b < 0, `γ_b` is Mathlib's `ProbabilityTheory.gaussianReal 0 (1/(2|b|))`, and no separate definition is made.

The API consists of the following facts.

- Each `ρ_{λ,b}` is an even admissible probability measure with a continuous positive density; ρ_I is even and admissible; `γ_b` is even, equals `ProbabilityTheory.gaussianReal 0 (1/(2|b|))`, and is not admissible.
- Scaling: for s > 0 the image of `ρ_{λ,b}` under φ ↦ sφ is `ρ_{λ s⁻⁴, b s⁻²}`.
- Moments at b = 0: `∫ φ^{2k} dρ_{λ,0} = λ^{−k/2} Γ((2k+1)/4)/Γ(1/4)`, by the substitution u = λφ⁴ and `Real.Gamma`.
- The Ising measure is the hard limit of φ⁴ measures: since `−λφ⁴ + 2λφ² = −λ(φ² − 1)² + λ`, `ρ_{λ,2λ}` is proportional to `exp(−λ(φ² − 1)²) dφ` and converges weakly to ρ_I as λ → ∞, with `sup_{λ≥1} ∫ e^{cφ²} dρ_{λ,2λ} < ∞` for every c (Aizenman–Duminil-Copin (1.20), p. 6).

*Needs:* 0.1; Mathlib `MeasureTheory.Measure.tilted`, `ProbabilityTheory.gaussianReal`, `integral_gaussian`, `Real.Gamma`, `MeasureTheory.ProbabilityMeasure`.

**Checks.**

- `γ_{−1/2}` is the standard normal law; the opposite sign convention for b would assign it to b = +½.
- `∫ φ² dρ_{λ,0} = Γ(3/4)/(Γ(1/4)√λ) ≈ 0.338/√λ` and `∫ φ⁴ dρ_{λ,0} = Γ(5/4)/(λΓ(1/4)) = 1/(4λ)`; the second value is recomputed independently by the integration-by-parts identity of 3.7.
- `ρ_{1,2}`, proportional to `exp(−(φ² − 1)²)`, has its density maxima at φ = ±1 and a local minimum at 0: a φ⁴ measure need not be unimodal, and the double-well case b > 0 is part of the family.
- ρ_I has no density with respect to Lebesgue measure, so any statement proved through densities (such as the identity of 3.7) does not apply to it directly.

### Examples

The measures `ρ_{λ,b}`, `γ_b`, ρ_I, the Dirac measures and the uniform measure on {−1, 0, 1} are the running examples; the last is the Ising-block measure of 2.1 obtained by Griffiths' trick.

### Dependencies

Mathlib `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.map`, `MeasureTheory.Measure.tilted`, `MeasureTheory.Measure.IsNegInvariant`, `ProbabilityTheory.integrableExpSet`, `MeasureTheory.Integrable.mono'`, `ProbabilityTheory.gaussianReal`, `integral_gaussian`, `Real.Gamma`, `MeasureTheory.ProbabilityMeasure`. No other roadmap.

## Layer 1: Finite-volume lattice measures

### 1.1 Couplings, partition function and the Gibbs measure

Define, for a finite set V, a coupling J on V and a single-site measure ρ, the Hamiltonian `hamiltonian` of the Conventions, the partition function `Z_{V,J}(ρ) = ∫ exp(−H_{V,J}(φ)) dρ^{⊗V}(φ) ∈ (0, ∞]` (`partitionFunction`), call the triple stable if it is finite, and define the Gibbs measure `μ_{V,J,ρ} = Z_{V,J}(ρ)⁻¹ exp(−H_{V,J}) · ρ^{⊗V}` on ℝ^V (`gibbsMeasure`; Aizenman–Duminil-Copin (1.11)–(1.12), pp. 3–4; Sokal, Section 2.2, (2.17), p. 326) as Mathlib's tilt `(ρ^{⊗V}).tilted (−H_{V,J})`. For a stable triple with ρ a probability measure the normaliser of the tilt is the real number `Z_{V,J}(ρ)`; the Gibbs measure of an unstable triple is the zero measure (`MeasureTheory.tilted_of_not_integrable`).

The API consists of the following facts.

- Z is positive, and μ is a probability measure whenever the triple is stable.
- If ρ is admissible, every coupling is stable: `−H_{V,J}(φ) ≤ ½‖J‖ Σ_x φ_x²`, so `Z ≤ (∫ e^{‖J‖φ²/2} dρ)^{|V|}`.
- For J = 0, μ is `ρ^{⊗V}`; for V a single point, μ is ρ; for V empty, μ is the Dirac measure at the empty configuration and Z = 1.
- Decoupling: if V = V₁ ⊔ V₂ and J vanishes between V₁ and V₂, then μ is the product of the Gibbs measures on V₁ and V₂ under `ℝ^V ≅ ℝ^{V₁} × ℝ^{V₂}`, and Z is the product of the partition functions.
- Relabelling: for a bijection e : W → V, the image of `μ_{V,J,ρ}` under φ ↦ φ ∘ e is the Gibbs measure on W of the coupling `J ∘ Sym2.map e`.
- Tilting the single-site measure by `e^{aφ²}` is the same as adding a diagonal term: for an admissible probability measure ρ and real a, the Gibbs measure with single-site measure `ρ.tilted (φ ↦ aφ²)` is `(ρ^{⊗V}).tilted (−H_{V,J} + aΣ_xφ_x²)`, which is `μ_{V,J,ρ}.tilted (aΣ_xφ_x²)` (`MeasureTheory.tilted_tilted`).

*Needs:* 0.1; Mathlib `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.tilted`, `MeasureTheory.isProbabilityMeasure_tilted`, `MeasureTheory.tilted_tilted`.

**Checks.**

- Two sites, Ising: `Z = cosh J` and `⟨σ_x σ_y⟩ = tanh J`; omitting the factor ½ from the ordered-pair sum (equivalently, doubling the unordered-pair sum) would give `cosh 2J` and `tanh 2J`.
- Three sites, all pairs coupled with J, Ising: `Z = (e^{3J} + 3e^{−J})/4` and `⟨σ_1σ_2⟩ = (e^{3J} − e^{−J})/(e^{3J} + 3e^{−J})`, which is negative for J < 0 (frustration); the definition does not require J ≥ 0.
- Two sites with single-site measure N(0,1) and `J_{xy} = 1` give Z = ∞: the triple is unstable, so stability cannot be dropped from the probability statement.

### 1.2 Integrability, symmetries and the spin flip

Prove that for admissible ρ, a finite set V and any coupling J, every polynomial in the φ_x and every function `exp(Σ_x h_x φ_x + c Σ_x φ_x²)` (h ∈ ℝ^V, c ∈ ℝ) is integrable for `μ_{V,J,ρ}`. Prove that every bijection g of V with `J_{gx,gy} = J_{xy}` preserves μ under φ ↦ φ ∘ g, and that for even ρ the measure μ is invariant under φ ↦ −φ, so that `⟨φ_A⟩ = 0` whenever |A| is odd. Both invariances follow by changing variables in the integral that defines the finite-volume state (Aizenman–Duminil-Copin (1.11)–(1.12), pp. 3–4, for φ⁴ fields and (1.17), p. 5, for Ising spins); Sokal, Section 2.2, property (b), p. 327, states the same invariances for the infinite-volume state of 4.2.

*Needs:* 0.1; 1.1.

**Checks.**

- On the Ising chain {0, 1, 2} with `J_{01} = J_{12} = J`, the reflection 0 ↔ 2 is an automorphism and `⟨σ_0σ_1⟩ = ⟨σ_1σ_2⟩ = tanh J`, `⟨σ_0σ_2⟩ = tanh² J`.
- If `J_{01} ≠ J_{12}` the reflection is not an automorphism and `⟨σ_0σ_1⟩ = tanh J_{01} ≠ tanh J_{12} = ⟨σ_1σ_2⟩`.
- For the non-even measure `(δ₀ + δ₁)/2` on one site, `⟨φ⟩ = ½ ≠ 0`: the spin-flip statement needs evenness.

### 1.3 Dependence on the couplings

Prove that for admissible ρ, a finite set V and a measurable F with `|F(φ)| ≤ C(1 + Σ_x φ_x²)^k`, the map `J ↦ ⟨F⟩_{V,J,ρ}` on couplings (functions on the finite set `Sym2 V`) is continuously differentiable, with `∂⟨F⟩/∂J_{xy} = ⟨F φ_x φ_y⟩ − ⟨F⟩⟨φ_x φ_y⟩` for x ≠ y, the derivative in the coordinate `J({x, y})`, which is the symmetric direction changing `J_{xy}` and `J_{yx}` together when couplings are written as symmetric matrices (Peled–Spinka, the paragraph after Theorem 2.3, p. 13, where the identity is written for two-spin correlations of the spin O(n) model).

*Needs:* 1.1; 1.2; Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

**Checks.**

- Two sites, Ising: `d/dJ tanh J = 1 − tanh² J = ⟨(σ_xσ_y)²⟩ − ⟨σ_xσ_y⟩²`.
- At J = 0 and even ρ, `∂⟨φ_xφ_y⟩/∂J_{xy} = (∫ φ² dρ)²`, which is 1 for ρ_I.
- The derivative in a diagonal coordinate `J({x, x})` is zero, since the diagonal does not enter the Hamiltonian; a convention including the diagonal would give `½⟨F ; φ_x²⟩`.

### 1.4 Continuity in the single-site measure

Prove that if single-site measures ρ_k converge weakly to ρ and `sup_k ∫ e^{cφ²} dρ_k < ∞` for every c, then ρ is admissible and, for every finite V, every coupling J and every continuous F with `|F(φ)| ≤ C(1 + Σ_x φ_x²)^m`, `Z_{V,J}(ρ_k) → Z_{V,J}(ρ)` and `⟨F⟩_{V,J,ρ_k} → ⟨F⟩_{V,J,ρ}`; in particular `μ_{V,J,ρ_k}` converges weakly to `μ_{V,J,ρ}`. This is the continuity step once uniform quadratic exponential moments of the approximants are known; for every Ising-block sequence converging to a measure that satisfies a growth condition, those moments are the tail control of 2.2, which with this theorem gives the Griffiths–Simon finite-volume transfer (Aizenman–Duminil-Copin, the first paragraph of Section 7, p. 44, and the paragraph after Proposition 7.2, p. 45). A proof route: weak convergence of the finite products `ρ_k^{⊗V}` through characteristic functions and Lévy's continuity theorem, and uniform integrability of `F e^{−H}` from the uniform bound on `∫ exp(c Σ_x φ_x²) dρ_k^{⊗V}`.

*Needs:* 0.1; 1.1; 1.2; Mathlib `MeasureTheory.ProbabilityMeasure.tendsto_iff_tendsto_charFun`, `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`.

**Checks.**

- The uniform bound cannot be dropped: `ρ_k = (1 − e^{−k})δ₀ + ½e^{−k}(δ_k + δ_{−k})` converges weakly to δ₀, but for two sites with `J_{xy} = 1`, `Z(ρ_k) ≥ ¼e^{−2k} e^{k²} → ∞` while `Z(δ₀) = 1`.
- `ρ_{λ,2λ} → ρ_I` (0.2) satisfies the uniform bound, so for two sites `⟨φ_xφ_y⟩_{ρ_{λ,2λ}} → tanh J` as λ → ∞.
- For J = 0 the statement reduces to the weak convergence of products, `ρ_k^{⊗V} → ρ^{⊗V}`.

### 1.5 Gaussian lattice fields

Prove that for b < 0 and a coupling J on a finite set V, the triple (V, J, γ_b) is stable exactly when the matrix `2|b| I − J⁰` is positive definite, J⁰ being the symmetric matrix with `J⁰_{xy} = J({x, y})` for x ≠ y and zero diagonal, and that then `μ_{V,J,γ_b}` is the centred Gaussian law with covariance `(2|b| I − J⁰)⁻¹`, that is `ProbabilityTheory.multivariateGaussian 0 (2|b| I − J⁰)⁻¹` transported to ℝ^V. For the nearest-neighbour coupling of strength 1 on V_R and `b = −(d + μ²/2)` with μ ≥ 0, the triple is stable for every R and the covariance is `G^{(R)}_μ = (μ² − Δ_R)⁻¹`, where `−Δ_R = 2d I − A_R` is the Dirichlet Laplacian of V_R and A_R its adjacency matrix: free boundary conditions of the lattice field are Dirichlet boundary conditions of the Laplacian (Sokal, Section 2.2, footnote 2, p. 326; Simon, Twelve Tales, Section 3, pp. 23–24, for the free lattice field as a nearest-neighbour ferromagnet with Gaussian single-site measure, written there formally on ℤ² and with another normalisation of the mass term). Prove that `G^{(R)}_μ(x, y)` is non-decreasing in R and converges, for μ > 0 in every dimension and for μ = 0 when d ≥ 3, to `G_μ(x − y) = (2π)^{−d} ∫_{[−π,π]^d} e^{ip·(x−y)} / (E(p) + μ²) dp` (Fröhlich, the paragraph after (33), p. 13, for the limit kernel as the two-point function of the free lattice field, expressed through the finite-difference Laplacian; the convergence of the Dirichlet box kernels and the range of (d, μ) are this roadmap's). A proof route: the Neumann series `Σ_k A_R^k/(2d + μ²)^{k+1}`, whose terms increase with R entrywise to those of the same series for the adjacency matrix A of ℤ^d, whose Fourier symbol is `2d − E(p)`; for μ > 0 that series sums to `G_μ`, and at μ = 0 it is the increasing limit of `G_μ(x − y)` as μ ↓ 0, finite exactly when d ≥ 3, where `1/E(p)` is integrable near p = 0.

*Needs:* 0.2; 1.1; Mathlib `ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.charFun_multivariateGaussian`.

**Checks.**

- One site, J = 0: `μ = N(0, 1/(2|b|)) = γ_b`.
- Two sites with `J_{xy} = J` of either sign: stable iff `|J| < 2|b|` (the determinant of `2|b| I − J⁰` is `4b² − J²`, negative for `J = −3|b|` although `J < 2|b|`), and then `⟨φ_xφ_y⟩ = J/(4b² − J²)`, `⟨φ_x²⟩ = 2|b|/(4b² − J²)`.
- d = 1: `G_μ(0) = (2π)⁻¹ ∫ dp/(2 − 2cos p + μ²) = 1/(μ√(4 + μ²))`, which diverges as μ → 0; for d = 2 the massless Dirichlet Green function at the origin diverges as R → ∞ as well, so the massless limit is restricted to d ≥ 3.

### Examples

The two-site and three-site Ising systems, the open Ising chain (where `⟨σ_0σ_x⟩ = tanh^{|x|} J` on any interval containing 0 and x), and the Gaussian lattice fields of 1.5 are the worked examples of this layer.

### Dependencies

Layer 0; Mathlib `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.tilted`, `MeasureTheory.isProbabilityMeasure_tilted`, `MeasureTheory.tilted_tilted`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `MeasureTheory.ProbabilityMeasure.tendsto_iff_tendsto_charFun`, `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`, `ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.charFun_multivariateGaussian`.

## Layer 2: The Griffiths–Simon class

### 2.1 Ising-block measures and the block-spin representation

Define, for N ∈ ℕ, a ferromagnetic coupling K on Fin N and weights q ∈ [0, ∞)^N, the Ising-block measure `ρ_{N,K,q}` (`isingBlockMeasure`) as the law of `Σ_n q_n σ_n` under the Gibbs measure `μ_{Fin N, K, ρ_I}`, and call a measure an Ising-block measure (`IsIsingBlock`) when it is `ρ_{N,K,q}` for some N, some K ≥ 0 and some q ≥ 0 (Aizenman–Duminil-Copin, Definition 2.1(1) and (2.1), p. 8, and Figure 1, p. 9). Aizenman–Duminil-Copin allow coefficients of any sign; the weights here are nonnegative, which is what their transfer arguments use (Section 7.1, p. 45, where `Q_iQ_j⟨σ_{x,i}σ_{y,j}⟩/⟨τ_xτ_y⟩` is a probability) and without which the class contains measures violating the Lebowitz inequality (Checks below and 3.5).

Prove the Lee–Yang theorem (`leeYang`): for a finite set V, a ferromagnetic coupling J on V and complex fields h ∈ ℂ^V with Re h_x > 0 for every x ∈ V, the complex Ising partition function `Z^I_{V,J}(h) = ∫ exp(−H_{V,J}(σ) + Σ_x h_x σ_x) dρ_I^{⊗V}(σ)` is not zero (Lebowitz–Ruelle–Speer, Section 1, the sentence of (1.2), where it is stated for a uniform field). A proof route: put `z_x = e^{−2h_x}` and `a_{xy} = e^{−2J_{xy}} ∈ (0, 1]`; then `Z^I_{V,J}(h)` is a nonzero multiple of the polynomial `P(z) = Σ_{A⊆V} Π_{x∈A} z_x Π_{x∈A, y∉A} a_{xy}`, which is affine in each variable, and Re h_x > 0 means |z_x| < 1. For one pair, `1 + a z₁ + a z₂ + z₁z₂` has no zero with |z₁|, |z₂| < 1, because `|1 + a z₁|² − |a + z₁|² = (1 − a²)(1 − |z₁|²) ≥ 0`. For |V| ≥ 2, P arises from the product over all unordered pairs of distinct sites of these pair polynomials, written in separate copies of the site variables, by contracting the copies of each site, and an Asano contraction preserves the absence of zeros in the open unit polydisc (Lebowitz–Ruelle–Speer, Lemma 2.4, with both excluded sets equal to `{|z| ≥ 1}`, whose product set `{−uv}` is again `{|z| ≥ 1}`); for |V| = 1, P = 1 + z_x.

The API consists of the following facts.

- `ρ_{N,K,q}` is even, has finite support contained in `[−Σ_n q_n, Σ_n q_n]`, and is admissible.
- For N = 0 or q = 0 it is δ₀; for N = 1, q = (1) it is ρ_I; for N = 1, q = (s) it is `½(δ_{−s} + δ_s)`.
- Products of blocks: the law of the sum of two independent Ising-block variables is an Ising-block measure (concatenate the blocks with no coupling between them).
- Block-spin representation: for a finite set V, a ferromagnetic coupling J on V and `ρ = ρ_{N,K,q}`, the Gibbs measure `μ_{V,J,ρ}` is the image of the Ising Gibbs measure `μ_{V×Fin N, J̃, ρ_I}` under `σ ↦ (Σ_n q_n σ_{x,n})_x`, where `J̃_{(x,n),(y,m)} = K_{nm}` for x = y and `J_{xy} q_n q_m` for x ≠ y; J̃ is ferromagnetic (Aizenman–Duminil-Copin, (2.3)–(2.4) and Figure 1, p. 9, and Section 7.1, p. 45).
- Lee–Yang property: the Laplace transform `E(h) = ∫ e^{hφ} dρ_{N,K,q}(φ)` is an entire function of h ∈ ℂ with `|E(h)| ≤ e^{|h| Σ_n q_n}`, and E(h) ≠ 0 whenever Re h ≠ 0 (`isingBlock_laplace_ne_zero`; Aizenman–Duminil-Copin, the paragraph after Definition 2.1, p. 9). Consequently there are numbers a_j > 0, finitely or countably many and repeated according to multiplicity, with `Σ_j a_j⁻² = ½ ∫ φ² dρ_{N,K,q}` and `E(h) = Π_j (1 + h²/a_j²)` for every h ∈ ℂ, the product converging unconditionally (`isingBlock_laplace_hasProd`, which writes `x_j = a_j⁻²` and pads a finite list of zeros by `x_j = 0`). In particular `E(h) ≤ exp(½h² ∫ φ² dρ_{N,K,q})` for real h, and the fourth cumulant `∫ φ⁴ dρ_{N,K,q} − 3(∫ φ² dρ_{N,K,q})²` equals `−12 Σ_j a_j⁻⁴ ≤ 0` (an instance of Newman's Lee–Yang inequalities, which Sokal, Section 2.2, property (i) and (2.26), p. 328, states for the infinite-volume φ⁴ state). A proof route: `E(h) = Z^I_{Fin N,K}(hq)/Z^I_{Fin N,K}(0)`, so the Lee–Yang theorem gives E(h) ≠ 0 for Re h > 0 when every q_n > 0, and E(−h) = E(h) covers Re h < 0. If some q_n vanish, the transforms for the weights q + ε, all positive, converge to E locally uniformly on ℂ as ε ↓ 0; a zero h₀ of E with Re h₀ > 0 is isolated because E(0) = 1, and the maximum modulus principle (`Complex.norm_le_of_forall_mem_frontier_norm_le`) applied to the reciprocals of the approximating transforms on a small closed disc around h₀ inside the right half-plane, on whose boundary E does not vanish, gives a contradiction (Hurwitz's argument). The product formula is ZerosOfLFunctions §5.5 applied to E, which has order at most 1 and E(0) = 1: E(0) = 1 makes the constant factor 1, evenness of E makes the linear term of the exponent vanish and pairs the factors at ±ia_j into `1 + h²/a_j²`, and the mass identity and the fourth cumulant compare the coefficients of h² and h⁴ in E and in log E.

*Needs:* 0.1; 0.2; 1.1; Mathlib `MeasureTheory.Measure.map`; for the evenness of the block measures and for the Lee–Yang property, 1.2; for the Lee–Yang property only, also Mathlib `Complex.norm_le_of_forall_mem_frontier_norm_le` and ZerosOfLFunctions §5.5.

**Checks.**

- Griffiths' trick: N = 2, q = (½, ½), `K_{12} = (ln 2)/2` gives the uniform measure on {−1, 0, 1}, since the unnormalised weights of t = (σ₁ + σ₂)/2 are `¼e^{K}` at t = ±1 and `½e^{−K}` at t = 0 (Simon, Twelve Tales, Section 3, p. 25).
- With mixed signs q = (1, −1) and a ferromagnetic coupling K ≥ 0 on the pair, the law of σ₁ − σ₂ is `(1 − ε)δ₀ + ½ε(δ₂ + δ₋₂)` with `ε = 1/(1 + e^{2K}) ∈ (0, ½]`; for K > (ln 2)/2, 0 < ε < 1/3 and `∫φ⁴ = 16ε > 48ε² = 3(∫φ²)²` (at K = (ln 3)/2, ε = ¼ and 4 > 3), violating the single-site Lebowitz inequality of 3.5. This is why the weights are nonnegative.
- A mixed-sign representation alone does not exclude a measure: at K = 0 the same construction gives ε = ½, the law `½δ₀ + ¼(δ₂ + δ₋₂)`, which is also the nonnegative-weight block q = (1, 1), K = 0, and so lies in the class of 2.2; for 0 ≤ K ≤ (ln 2)/2 one has ε ≥ 1/3, and the Lebowitz test excludes nothing.
- For V = {x, y}, `J_{xy} = J`, N = 1, q = (s): the block-spin representation gives `⟨φ_xφ_y⟩ = s² tanh(Js²)`, which is also the direct computation with single-site measure `½(δ_{−s} + δ_s)`.
- Lee–Yang on small systems: one site has `Z^I(h) = cosh h`, whose zeros `iπ(k + ½)`, k ∈ ℤ, are purely imaginary, and `cosh(iπ/2) = 0` shows that Re h_x > 0 cannot be weakened to Re h_x ≥ 0. Two sites with equal fields h have `Z^I = ½(e^J cosh 2h + e^{−J})`; for J ≥ 0 a zero needs `cosh 2h = −e^{−2J} ∈ [−1, 0)`, which forces Re h = 0, while the antiferromagnetic `J = −(ln 2)/2` has the zeros `h = ±½ ln(2 + √3) + iπ/2 ≈ ±0.658 + 1.571i`, so ferromagnetism cannot be dropped.
- The Ising measure has `E(h) = cosh h = Π_{k≥0} (1 + h²/((k + ½)π)²)`, and `Σ_{k≥0} ((k + ½)π)⁻² = ½ = ½ ∫ φ² dρ_I`; its fourth cumulant `1 − 3 = −2` equals `−12 Σ_{k≥0} ((k + ½)π)⁻⁴ = −12 · (1/6)`.
- The uniform measure on {−1, 0, 1} has `E(h) = (1 + 2 cosh h)/3`, which vanishes exactly where cosh h = −½, at `h = i(±2π/3 + 2πk)`, k ∈ ℤ, all purely imaginary; these zeros give `Σ_j a_j⁻² = (2π)⁻² Σ_{n∈ℤ} (n + 1/3)⁻² = (2π)⁻² π²/sin²(π/3) = 1/3`, half of `∫ φ² = 2/3`.
- The Lee–Yang property needs nonnegative weights: q = (1, −1) with K = (ln 3)/2 gives the law `¾δ₀ + ⅛(δ₂ + δ₋₂)`, with `E(h) = (3 + cosh 2h)/4`, which vanishes where cosh 2h = −3, at `h = ±½ ln(3 + 2√2) + iπ/2 ≈ ±0.881 + 1.571i`; its fourth cumulant is `4 − 3 = 1 > 0`.

### 2.2 The Griffiths–Simon class

Define the Griffiths–Simon class (`griffithsSimonClass`, a set of Mathlib's `MeasureTheory.ProbabilityMeasure ℝ` with its topology of weak convergence) to consist of the single-site measures ρ that are limits of sequences of nonnegative-weight Ising-block measures of 2.1 and satisfy `∫ exp(|φ|^α) dρ < ∞` for some α > 2. The growth condition is on ρ, not on the approximating sequence (Aizenman–Duminil-Copin, Definition 2.1(2) and (2.2), pp. 8–9, with the nonnegative-weight convention of 2.1). The topology of weak convergence on the probability measures on ℝ is metrizable (by the Lévy–Prokhorov metric), so limits of sequences are all the limit points.

The API consists of the following facts.

- Every Ising-block measure belongs to the class (constant sequence); in particular ρ_I, δ₀ and the uniform measure on {−1, 0, 1} do.
- Every member is even, by weak closure of negation invariance, and admissible, since for each c the function `cφ² − |φ|^α` is bounded above when α > 2.
- The class is closed under φ ↦ sφ for s ∈ ℝ (use nonnegative weights multiplied by |s| and any smaller exponent between 2 and α), and under weak limits ρ_j → ρ with `sup_j ∫ exp(|φ|^α) dρ_j < ∞` for one α > 2 (weak diagonal approximation and lower semicontinuity).
- Tail control (`isingBlock_tailControl`): if Ising-block measures η_k converge weakly to a probability measure ρ with `∫ exp(|φ|^α) dρ < ∞` for some α > 2, then `sup_k ∫ e^{cφ²} dη_k < ∞` for every real c. A proof route, writing `E_k(h) = Π_j (1 + h² x_{k,j})` with `x_{k,j} = a_{k,j}⁻²` and `σ_k² = ∫ φ² dη_k = 2 Σ_j x_{k,j}` by the Lee–Yang property of 2.1: (a) σ_k² is bounded, because `∫ φ⁴ dη_k ≤ 3σ_k⁴` (2.1) and the Paley–Zygmund inequality (the Cauchy–Schwarz inequality for `φ² · 1[φ² ≥ σ_k²/2]`, whose integral is at least σ_k²/2) give `η_k(φ² ≥ σ_k²/2) ≥ 1/12`, which the tightness of a convergent sequence (`MeasureTheory.isTightMeasureSet_of_isCompact_closure`) forbids along σ_k → ∞; put `S = sup_k σ_k²`. (b) `E_k(h) ≤ e^{h²S/2}` for real h, so `e^{hφ}` is uniformly integrable along the sequence and `E_k(h) → ∫ e^{hφ} dρ`. (c) Young's inequality (`Real.young_inequality`) gives `|hφ| ≤ |φ|^α + |h|^{α′}` with `α′ = α/(α − 1) < 2`, hence `∫ e^{hφ} dρ ≤ C e^{|h|^{α′}}` with `C = ∫ exp(|φ|^α) dρ ≥ 1`. (d) Since `log(1 + u)/u` decreases on (0, 1], the sum `s_k(θ)` of those `x_{k,j}` that are at most θ satisfies `s_k(θ) log 2 ≤ θ log E_k(θ^{−1/2})`, so (b) and (c) give `limsup_k s_k(θ) ≤ (θ log C + θ^{1−α′/2})/log 2`, which tends to 0 as θ ↓ 0. (e) At most S/(2θ) of the `x_{k,j}` exceed θ and each is at most S/2, so `E_k(h) ≤ (1 + h²S/2)^{S/(2θ)} e^{h² s_k(θ)}` for real h. (f) For c > 0 and a standard normal g, `∫ e^{cφ²} dη_k = E[E_k(√(2c) g)]` by Tonelli's theorem and `ProbabilityTheory.mgf_id_gaussianReal`; choosing θ with `limsup_k s_k(θ) < 1/(8c)` bounds this, for all large k, by `E[(1 + cSg²)^{S/(2θ)} e^{g²/4}] < ∞`, and each of the finitely many remaining η_k has bounded support. For c ≤ 0 the integrals are at most 1.
- Finite-volume transfer (`tendsto_gibbs_of_isingBlock`): for every ρ in the class, every sequence of Ising-block measures η_k converging weakly to ρ, every finite set V, every coupling J on V and every continuous F : ℝ^V → ℝ with `|F(φ)| ≤ C(1 + Σ_x φ_x²)^m`, `Z_{V,J}(η_k) → Z_{V,J}(ρ)`, `⟨F⟩_{V,J,η_k} → ⟨F⟩_{V,J,ρ}` and `μ_{V,J,η_k} → μ_{V,J,ρ}` weakly. The tail control supplies the uniform quadratic exponential moments that 1.4 assumes, and 1.4 gives the conclusion. This is the passage from Ising blocks to the class that Aizenman–Duminil-Copin assert by continuity (the first paragraph of Section 7, p. 44, and the paragraph after Proposition 7.2, p. 45).

*Needs:* 0.1; 2.1 (the Ising-block measures); for the tail control, 2.1 (the Lee–Yang property) and Mathlib `MeasureTheory.isTightMeasureSet_of_isCompact_closure`, `Real.young_inequality`, `ProbabilityTheory.mgf_id_gaussianReal`; for the finite-volume transfer, 1.1, 1.2, 1.4 and the tail control.

**Checks.**

- The standard normal law is a weak limit of Ising-block measures (independent spins, K = 0, `q_n = N^{−1/2}`, by the central limit theorem) but is not in the class: `∫ exp(|φ|^α) dN(0,1) = ∞` for α > 2. The growth condition is what excludes it, and the tail control fails without it: along these blocks `∫ e^{φ²/2} dη_N → ∞` by Fatou's lemma, since `∫ e^{φ²/2} dN(0,1) = ∞`. In step (d), every `x_{N,j}`, which is `((m + ½)π)⁻²/N` for some m ≥ 0 and occurs N times, lies below `4/(π²N)`, so `s_N(θ) = ½` once `N ≥ 4/(π²θ)`: the Gaussian factor `e^{h²/2}` of the limit is this mass of the `x_{N,j}` accumulating at 0.
- The block structure is used, not only the moment bounds it implies: the mixtures `(1 − 1/k)ρ_I + (1/k)N(0,1)` converge weakly to ρ_I, a member, and satisfy `∫ φ^{2n} = 1 − 1/k + (2n − 1)!!/k ≤ (2n − 1)!!(∫ φ²)ⁿ` with `∫ φ² = 1`, but on two sites with `J_{xy} ≥ 1` their partition functions are infinite, so neither the tail control nor the transfer holds for them; their Laplace transforms `(1 − 1/k) cosh h + (1/k) e^{h²/2}` have order 2, outside the factorisation of 2.1.
- `(1 − ε)δ₀ + ½ε(δ₁ + δ₋₁)` with 0 < ε < 1/3 is even and admissible but is not in the class, because it violates the single-site Lebowitz inequality `∫φ⁴ ≤ 3(∫φ²)²`, which every member satisfies by 3.5: both moments equal ε, and `ε > 3ε²` exactly when 0 < ε < 1/3 (at ε = ¼, ¼ > 3/16). The endpoints are not excluded by this test: at ε = 0 the measure is δ₀, a member, and both sides are 0; at ε = 1/3 both sides equal 1/3, and the test decides nothing.
- Every φ⁴ measure is in the class (2.3), while the Gaussian measures γ_b are not.
- Independent blocks `X_N = Σ_{i=1}^N σ_i/(√N log N)`, N ≥ 3 (K = 0, all q_n = 1/(√N log N)), with laws η_N, have variance `(log N)⁻² → 0` and converge to δ₀. Their exponential α-moments are not controlled by those of the limit: for every α > 2 they are at least `2^{1−N} exp(N^{α/2}/(log N)^α) → ∞`, while δ₀ has 1, so the growth condition cannot be asked of the approximants. Their quadratic exponential moments, which 1.4 uses, are controlled: `∫ e^{hφ} dη_N = cosh(h/(√N log N))^N ≤ e^{h²/(2 log²N)}`, hence `∫ e^{cφ²} dη_N ≤ (1 − 2c/log²N)^{−1/2}` once `log²N > 2c` (about 1.022 at c = 1, N = 1000), which tends to `1 = ∫ e^{cφ²} dδ₀`; on two sites with `J_{xy} = J ≥ 0`, `1 ≤ Z(η_N) ≤ (1 − J/log²N)^{−1}`, so `Z(η_N) → 1 = Z(δ₀)`. The zeros of this transform are `±i(k + ½)π√N log N`, each of multiplicity N, and `N Σ_{k≥0} ((k + ½)π√N log N)⁻² = 1/(2 log²N) = ½σ_N²`, as 2.1 requires.
- Transfer along every sequence: the blocks `½(δ_{−s_k} + δ_{s_k})` (N = 1, q = (s_k)) with s_k → s ≥ 0 converge to `½(δ_{−s} + δ_s)`; on one site the second moment s_k² tends to s², and on two sites `⟨φ_xφ_y⟩ = s_k² tanh(J s_k²)` tends to `s² tanh(Js²)`, the values for the limit; at s = 0 both tend to 0, the values for δ₀, and the zeroth moment is 1 throughout. For the Curie–Weiss sequence of 2.3, the uniform quartic tails proved there give the bound of the tail control directly.

### 2.3 φ⁴ measures as limits of Ising blocks

Prove that for λ > 0 and b ∈ ℝ the φ⁴ measure `ρ_{λ,b}` belongs to the Griffiths–Simon class (`phi4Measure_mem_griffithsSimonClass`). Explicitly, with `c = (12λ)^{−1/4}` and `g_N = 1 + 2bc²N^{−1/2}`, let ρ_N be the law of `cN^{−3/4} Σ_{n≤N} σ_n` under the Ising Gibbs measure on Fin N with coupling `K_{nm} = g_N/N` for n ≠ m (the Curie–Weiss model); for N large enough that g_N > 0, ρ_N is an Ising-block measure, ρ_N converges weakly to `ρ_{λ,b}`, and `sup_N ∫ exp(|φ|^α) dρ_N < ∞` for every α ∈ (2, 4) (Griffiths–Simon 1973; Aizenman–Duminil-Copin, (2.3)–(2.4) and the paragraph around them, p. 9; Simon, Twelve Tales, Section 3, p. 25). A proof route: the law of `S = Σ_n σ_n` is proportional to `C(N, (N+S)/2) 2^{−N} exp(g_N S²/(2N))`; Stirling's formula (`Stirling.tendsto_stirlingSeq_sqrt_pi`, and for the bounds below the two-sided estimate `√(2πn)(n/e)ⁿ ≤ n! ≤ e√n (n/e)ⁿ`, n ≥ 1, from `Stirling.le_factorial_stirling`, `Stirling.stirlingSeq'_antitone` and `Stirling.stirlingSeq_one`) and the expansion of the Cramér rate function of a fair ±1 coin, `I(m) = ½(1 + m)log(1 + m) + ½(1 − m)log(1 − m) = Σ_{k≥1} m^{2k}/(2k(2k − 1))`, give, at `m = S/N = φN^{−1/4}/c`, the exponent `bφ² − λφ⁴ + o(1)` locally uniformly in φ (local limit theorem), and the inequality `I(m) ≥ m²/2 + m⁴/12` with the bound `C(N, k)2^{−N} ≤ C N^{−1/2} e^{−N I(m)}` for |m| ≤ ½ gives the uniform quartic tail `ρ_N(|φ| ≥ t) ≤ C e^{|b|t² − λt⁴}`, while |m| > ½ contributes `O(e^{−N/192 + O(√N)})`.

*Needs:* 0.2; 2.1; 2.2; Mathlib `Stirling.tendsto_stirlingSeq_sqrt_pi`, `Stirling.le_factorial_stirling`, `Stirling.stirlingSeq'_antitone`, `Stirling.stirlingSeq_one`.

**Checks.**

- The Taylor coefficients of I are positive: the coefficient of m² is ½ and that of m⁴ is 1/12, which match the quartic coefficient `λ = 1/(12c⁴)` and give the one-sided bound used for the tails.
- The CLT scaling `N^{−1/2}` with a fixed coupling `g < 1` gives the Gaussian limit `N(0, 1/(1 − g))`, which is not in the class; both the scaling `N^{−3/4}` and `g_N → 1` are needed.
- For b > 0 the coupling `g_N > 1` is supercritical for the Curie–Weiss model and the limit is the double well `ρ_{λ,b}`; for b < 0, `g_N < 1` and the condition `g_N > 0` holds for `N > 4b²c⁴`.

### Examples

ρ_I, δ₀ (the case ε = 0 below), the uniform measure on {−1, 0, 1}, `½(δ_{−s} + δ_s)`, the law `½δ₀ + ¼(δ₂ + δ₋₂)` (the mixed-sign block of 2.1 at K = 0, equal to a nonnegative-weight block) and every φ⁴ measure are in the Griffiths–Simon class; γ_b, `(1 − ε)δ₀ + ½ε(δ₁ + δ₋₁)` with 0 < ε < 1/3, and the law of σ₁ − σ₂ under a pair coupling K > (ln 2)/2 (the mixed-sign block q = (1, −1) of 2.1) are not.

### Dependencies

Layers 0 and 1; ZerosOfLFunctions §5.5; Mathlib `MeasureTheory.Measure.map`, `Complex.norm_le_of_forall_mem_frontier_norm_le`, `MeasureTheory.isTightMeasureSet_of_isCompact_closure`, `Real.young_inequality`, `ProbabilityTheory.mgf_id_gaussianReal`, `Stirling.tendsto_stirlingSeq_sqrt_pi`, `Stirling.le_factorial_stirling`, `Stirling.stirlingSeq'_antitone`, `Stirling.stirlingSeq_one`. Griffiths–Simon 1973 is cited by locator.

## Layer 3: Correlation inequalities in finite volume

### 3.1 Griffiths' first and second inequalities

Prove that for a finite set V, a ferromagnetic coupling J and an even admissible ρ, every multi-index A satisfies `⟨φ_A⟩_{V,J,ρ} ≥ 0` (Griffiths I, `griffiths_first`) and every pair of multi-indices satisfies `⟨φ_A φ_B⟩ ≥ ⟨φ_A⟩⟨φ_B⟩` (Griffiths II, `griffiths_second`) (Peled–Spinka, Theorem 2.1, p. 11, for Ising spins, and Theorem 2.3, p. 13, for products of two spins in the spin O(n) model with n ∈ {1, 2}; Sokal (2.19)–(2.20), p. 327, for the infinite-volume φ⁴ state; Simon, Twelve Tales, Section 3, p. 24; Glimm–Jaffe, Chapter 4; Friedli–Velenik, Section 3.6). A proof route: for Griffiths I, expand `e^{−H}` as a power series with nonnegative coefficients in the monomials `φ_xφ_y` and use that every moment of an even measure is nonnegative; for Griffiths II, Ginibre's duplication: with an independent copy φ′, put `s = φ + φ′` and `t = φ − φ′`; then `H(φ) + H(φ′)` is `−¼Σ_{x≠y} J_{xy}(s_xs_y + t_xt_y)`, `φ_A − φ′_A` and `φ_B − φ′_B` are polynomials in (s, t) with nonnegative coefficients, and Ginibre's lemma gives the nonnegativity of every monomial.

The API consists of the following facts.

- Ginibre's lemma: for an even admissible ρ and m, n ∈ ℕ, `∫∫ (x + y)^m (x − y)^n dρ(x) dρ(y) ≥ 0`. (For n odd the integrand is odd under x ↔ y; for m + n odd it is odd under (x, y) ↦ (−x, −y); otherwise it is nonnegative.) Its multivariate form for products over sites follows by factorisation (Peled–Spinka, Lemma 2.4, p. 13, for products over pairs of sites in the spin O(n) model with n ∈ {1, 2}).
- The two inequalities hold for every multi-index, including repeated sites.

*Needs:* 0.1; 1.1; 1.2.

**Checks.**

- Two sites, Ising: `⟨σ_xσ_y⟩ = tanh J ≥ 0` and `⟨σ_xσ_y ; σ_xσ_y⟩ = 1 − tanh² J ≥ 0`.
- Evenness is needed: for `ρ = (2δ₋₁ + δ₁)/3` and J = 0, `⟨φ_x⟩ = −1/3 < 0`.
- Ferromagnetism is needed: two Ising sites with J < 0 give `⟨σ_xσ_y⟩ = tanh J < 0`.

### 3.2 Monotonicity in the couplings and the volume

Prove that for an even admissible ρ and multi-indices A: if J ≤ J′ are ferromagnetic couplings on V then `⟨φ_A⟩_{V,J,ρ} ≤ ⟨φ_A⟩_{V,J′,ρ}`; and if V ⊆ V′ are finite, J′ is a ferromagnetic coupling on V′ restricting to J on V, and A is supported in V, then `⟨φ_A⟩_{V,J,ρ} ≤ ⟨φ_A⟩_{V′,J′,ρ}` (Peled–Spinka, the paragraph after Theorem 2.3, p. 13, for the two-spin correlations of the spin O(n) model with n ∈ {1, 2} as functions of each coupling; Sokal, Section 2.2, the sentence before property (a), p. 327, for the monotonicity in the volume of the correlation functions of the nearest-neighbour φ⁴ model; the statement for every even admissible ρ and every multi-index follows by the route below). A proof route: the derivative formula of 1.3 and Griffiths II along the segment from J to J′; for the volume, the system on V′ with the couplings between V and V′ ∖ V switched off decouples (1.1).

*Needs:* 1.1; 1.3; 3.1.

**Checks.**

- On the Ising chain 0 − 1 − 2, `⟨σ_0σ_2⟩ = tanh J_{01} tanh J_{12}` is non-decreasing in both couplings.
- For V = {0, 2} with no coupling, `⟨σ_0σ_2⟩ = 0 ≤ tanh² J`, the value on V′ = {0, 1, 2}.
- Without evenness monotonicity in the volume fails for odd moments: for `ρ = (2δ₋₁ + δ₁)/3`, adding a ferromagnetically coupled site makes `⟨φ_0⟩` more negative.

### 3.3 The FKG inequality

Prove that for a finite set V, a ferromagnetic coupling J, an admissible ρ (not necessarily even) and bounded measurable F, G : ℝ^V → ℝ non-decreasing in each coordinate, `⟨FG⟩_{V,J,ρ} ≥ ⟨F⟩⟨G⟩` (`fkg_gibbs`); the same holds for measurable non-decreasing F, G bounded by a polynomial, in particular `⟨φ_x φ_y⟩ ≥ ⟨φ_x⟩⟨φ_y⟩` for all x, y ∈ V (Sokal (2.25), p. 327, for the infinite-volume φ⁴ state; Glimm–Jaffe, Chapter 4; Friedli–Velenik, Section 3.6). A proof route: `e^{−H}` is log-supermodular on ℝ^V because `∂²(−H)/∂φ_x∂φ_y = J_{xy} ≥ 0`; restrict ρ to finite sets of values (finite chains), apply Mathlib's `fkg` on the finite distributive lattice of configurations (after adding constants to make F and G nonnegative), and pass to the limit; alternatively, induct on |V| with Chebyshev's inequality on ℝ and Holley's inequality (Mathlib's `holley` in the discretised form).

*Needs:* 0.1; 1.1; 1.2; Mathlib `fkg` (or `holley` for the alternative route).

**Checks.**

- For the lattice gas `ρ = (δ₀ + δ₁)/2` on two sites, `⟨n_xn_y⟩ − ⟨n_x⟩⟨n_y⟩ = (e^J − 1)/(3 + e^J)²`, nonnegative iff J ≥ 0.
- For F non-decreasing and G non-increasing the inequality reverses: two Ising sites, F = σ_x, G = −σ_y give `−tanh J ≤ 0`.
- For J = 0 the inequality is Harris's inequality for product measures; on one site with F = G = φ it is `Var(φ) ≥ 0`.

### 3.4 Random currents and the switching lemma

Define, for a finite set V and a ferromagnetic coupling J, a current as a function n from the unordered pairs of distinct sites (`Edge`) to ℕ, its sources `∂n = {x : Σ_y n_{xy} is odd}` (`sources`), its weight `w_J(n) = Π_{{x,y}} J_{xy}^{n_{xy}}/n_{xy}!` (`currentWeight`), and, for B ⊆ V, the event `𝓕_B` of currents n admitting a current m ≤ n with ∂m = B (Aizenman–Duminil-Copin, Definitions 3.1–3.2 and (3.1)–(3.2), pp. 10–11). Prove the random current representation (`randomCurrent_representation`): for every A ⊆ V, `Z_{V,J}(ρ_I) ⟨σ_A⟩_{V,J,ρ_I} = ∫ σ_A e^{−H_{V,J}} dρ_I^{⊗V} = Σ_{∂n=A} w_J(n)`, the series converging absolutely, in particular `Z = Σ_{∂n=∅} w_J(n)` ((3.3)–(3.5), p. 10). Prove the switching lemma (`switching_lemma`): for A, B ⊆ V and every F from currents to `[0, ∞]`, `Σ_{∂n₁=A, ∂n₂=B} F(n₁ + n₂) w(n₁) w(n₂) = Σ_{∂n₁=A∆B, ∂n₂=∅} F(n₁ + n₂) w(n₁) w(n₂) 1[n₁ + n₂ ∈ 𝓕_B]` (Lemma 3.3 and (3.6), p. 11), and, when `Z_{A∆B} > 0`, its probability corollary `⟨σ_A⟩⟨σ_B⟩ = ⟨σ_{A∆B}⟩ · P^{A∆B,∅}[n₁ + n₂ ∈ 𝓕_B]` in finite volume, where `Z_D = Σ_{∂n=D} w_J(n)` and the law `P^D(n) = 1[∂n=D] w_J(n)/Z_D` is defined as a probability measure only for `Z_D > 0`; `P^{A∆B,∅}` is the product `P^{A∆B} ⊗ P^∅`. The empty-source normalizer is at least 1 from the zero current ((3.7)–(3.9), p. 11). The unnormalised switching identity holds without positivity of any source normalizer.

The API consists of the following facts.

- The current weights are summable: `Σ_n w_J(n) = Π_{{x,y}} e^{J_{xy}}`.
- Griffiths I for Ising spins and arbitrary sets A is immediate from the representation.
- `Z_D > 0` iff D has even cardinality in each connected component of the graph with edges `J_{xy} > 0`: necessity follows by source parity in each component, and sufficiency by pairing its sources along positive-edge paths.
- Currents with ∂n = A exist only if |A| is even; a current with sources A connects each source to another source by a path of edges with n > 0.

*Needs:* 0.2; 1.1.

**Checks.**

- Two sites: currents are n ∈ ℕ on the single pair, `Σ_{n even} Jⁿ/n! = cosh J = Z` and `Σ_{n odd} Jⁿ/n! = sinh J`, so `⟨σ_xσ_y⟩ = tanh J`.
- Switching lemma on two sites with A = B = {x, y} and F ≡ 1: the left side is `sinh² J`; the right side sums over pairs of even currents with n₁ + n₂ ≥ 1 (so that a unit subcurrent from x to y exists), which is `cosh² J − 1 = sinh² J`.
- Two sites with J = 0 and D = {x, y}: `Z_D = sinh 0 = 0`, so no source-conditioned probability law exists, while switching with A = D, B = ∅ remains `0 = 0`. At J = 1, `Z_D = sinh 1 > 0` and the normalised total mass is 1. A singleton source has normalizer 0 for every J; even total parity also fails for two singleton sources in different positive-coupling components.
- Omitting the factorials in the weight gives `Σ_n Jⁿ = 1/(1 − J)`, which diverges for J ≥ 1 and does not reproduce cosh J.

### 3.5 Lebowitz, Gaussian and Simon–Lieb inequalities

Prove, for a finite set V and a ferromagnetic coupling J, with Ising spins: (i) for n ≥ 1 and distinct `x₁, …, x_{2n} ∈ V`, `⟨σ_{x₁} ⋯ σ_{x_{2n}}⟩ ≤ Σ_{j=2}^{2n} ⟨σ_{x₁}σ_{x_j}⟩ ⟨Π_{i≠1,j} σ_{x_i}⟩`; (ii) for arbitrary `x₁, …, x_{2n} ∈ V`, repetitions allowed, the Gaussian inequality `⟨σ_{x₁} ⋯ σ_{x_{2n}}⟩ ≤ Σ_π Π_{j=1}^n ⟨σ_{x_{π(2j−1)}} σ_{x_{π(2j)}}⟩` over pairings π (the perfect matchings `TauCeti.PerfectMatching` of the 2n positions), whose case n = 2 is the Lebowitz inequality `U₄(x, y, z, t) ≤ 0` for the Ursell function (1.21); (iii) the Simon–Lieb inequality: for 0 ∈ Λ ⊆ V and y ∈ V ∖ Λ, `⟨σ_0σ_y⟩_V ≤ Σ_{u∈Λ, v∈V∖Λ} ⟨σ_0σ_u⟩_Λ J_{uv} ⟨σ_vσ_y⟩_V`, where `⟨·⟩_Λ` is the Gibbs measure on Λ of the restriction of J (Aizenman–Duminil-Copin (3.11), p. 12, for the Lebowitz inequality in infinite volume, and Lemma 5.7 with footnote 5, p. 30; Sokal (2.23)–(2.24), p. 327, for the infinite-volume φ⁴ state; Fröhlich, the paragraph after (12), p. 5, for the Lebowitz inequality of the nearest-neighbour φ⁴ model; Aizenman 1982; Fernández–Fröhlich–Sokal, Part I). Prove the same three inequalities, with φ in place of σ, for every single-site measure ρ in the Griffiths–Simon class (Aizenman–Duminil-Copin, Section 7.1, the site-splitting paragraph, p. 45); the Gaussian inequality (ii) is `gaussian_inequality` and the Simon–Lieb inequality (iii) is `simon_lieb`, both for the class. Prove the corollaries: for ρ in the class and t ∈ [0, ∞)^V, `⟨(Σ_x t_xφ_x)^{2n}⟩ ≤ (2n − 1)!! ⟨(Σ_x t_xφ_x)²⟩ⁿ`, and the single-site inequality `∫ φ^{2n} dρ ≤ (2n − 1)!! (∫ φ² dρ)ⁿ`.

A proof route: use the unnormalised switching identity throughout (or use source-conditioned laws only after verifying their positive normalizers, with zero-normalizer cases treated by the unnormalised identity). For (i), apply the switching lemma with A′ = {x₁, x_j}, B′ the remaining sources and the indicator of `𝓕_{A′}`, and use that in a current with sources `{x₁, …, x_{2n}}` the source x₁ is joined by a path to some other source x_j; (ii) follows from (i) by induction on n with Griffiths I, reducing repeated sites by σ_x² = 1; (iii) follows from the switching lemma by conditioning a current with sources {0, y} on the cluster of 0 in its restriction to the pairs inside Λ, which a path to y must leave through some pair {u, v} with u ∈ Λ and v ∉ Λ (Aizenman–Duminil-Copin, footnote 5). For the Griffiths–Simon class, an Ising-block single-site measure with nonnegative weights q reduces each inequality to the Ising inequality on V × Fin N through 2.1, by expanding `φ_x = Σ_n q_n σ_{x,n}` with nonnegative coefficients; the inequalities pass to the full weak-limit class by the finite-volume moment-transfer theorem of 2.2.

*Needs:* 1.1; 3.1; 3.4; Tau Ceti `TauCeti.PerfectMatching` (the pairings of (ii)); for the Griffiths–Simon class and the corollaries, also 1.4, 2.1 (the block-spin representation) and 2.2 (the finite-volume transfer).

**Checks.**

- Single-site checks of `∫φ⁴ ≤ 3(∫φ²)²`: ρ_I gives 1 ≤ 3; `ρ_{λ,0}` gives `1/(4λ) ≤ 3Γ(3/4)²/(Γ(1/4)²λ) ≈ 0.3427/λ`; the Gaussian law gives equality (by `TauCeti.Probability.centralMoment_id_two_mul_gaussianReal`), the boundary case of the Gaussian inequality.
- The class hypothesis cannot be weakened to evenness and admissibility: `(1 − ε)δ₀ + ½ε(δ₁ + δ₋₁)` with ε = ¼ gives `∫φ⁴ = ¼ > 3/16 = 3(∫φ²)²`.
- Simon–Lieb on the Ising chain 0 − 1 − 2 with Λ = {0}: `⟨σ_0σ_2⟩ = tanh² J ≤ J tanh J = ⟨σ_0σ_0⟩_{{0}} J_{01} ⟨σ_1σ_2⟩`, true since tanh J ≤ J.
- At n = 0 the pairing and Gaussian moment inequalities both give `1 = 1`; the recursion (i), which selects x₁, is stated only for n ≥ 1.
- With repeated sites, two Ising sites and (x, x, y, y): `⟨σ_x²σ_y²⟩ = 1 ≤ 1 + 2tanh² J`.

### 3.6 Reflection monotonicity

Prove the Messager–Miracle-Solé inequality (`messager_miracleSole`): let V be finite, ρ even and admissible, J a ferromagnetic coupling on V, and R an involution of V with fixed set V₀ and V ∖ V₀ = V₊ ⊔ V₋, R(V₊) = V₋, such that `J_{Rx,Ry} = J_{xy}` for all x, y and `J_{xy} ≥ J_{x,Ry}` for distinct x, y ∈ V₊. Then for multi-indices A and B supported in V₊ ∪ V₀, `⟨φ_A φ_B⟩ ≥ ⟨φ_A φ_{R(B)}⟩`, where R(B) = B ∘ R (Aizenman–Duminil-Copin (5.2), p. 23, for single-site measures with their growth condition (2.2); Sokal (2.29)–(2.30), p. 328, and the Remark that follows them, p. 329, for the infinite-volume φ⁴ state). A proof route: for x ∈ V₊ put `s_x = φ_x + φ_{Rx}` and `t_x = φ_x − φ_{Rx}`; the pair law of (s_x, t_x) under ρ ⊗ ρ, tilted by the crossing term `J_{x,Rx}φ_xφ_{Rx} = ¼J_{x,Rx}(s_x² − t_x²)`, is invariant under s ↦ −s and under t ↦ −t separately (by evenness of ρ and the symmetry of the product); minus the Hamiltonian with the crossing terms taken out, `−H_{V,J} − Σ_{x∈V₊} J_{x,Rx}φ_xφ_{Rx}`, is a quadratic form in (s, t, φ|V₀) with coefficients `½(J_{xy} + J_{x,Ry})` on `s_x s_y` and `½(J_{xy} − J_{x,Ry})` on `t_x t_y` for unordered pairs {x, y} of distinct sites of V₊, `J_{xz}` on `s_x φ_z` for x ∈ V₊ and z ∈ V₀, and `J_{zz′}` on `φ_z φ_{z′}` for unordered pairs {z, z′} of distinct sites of V₀, all nonnegative, and with no mixed `s_x t_y` term; and `φ_A(φ_B − φ_{R(B)})` is a polynomial in (s, t, φ|V₀) with nonnegative coefficients, so expanding the exponential gives a sum of nonnegative moments.

Prove that the hypotheses hold for the nearest-neighbour coupling on every finite R-invariant V ⊂ ℤ^d when R is a reflection of ℤ^d in a coordinate hyperplane `x_i = a` with a ∈ ½ℤ, or in a diagonal hyperplane `x_i ± x_j = a` with a ∈ ℤ (Aizenman–Duminil-Copin, the list of reflections after (5.2), p. 23, for the coordinate hyperplanes and the hyperplanes `x_i − x_j = a`; the hyperplanes `x_i + x_j = a` are their images under the lattice symmetry `x_j ↦ −x_j`, which preserves the nearest-neighbour coupling).

*Needs:* for the reflection inequality, 0.1; 1.1; 1.2; 3.1 (the expansion technique); the verification of its hypotheses for nearest-neighbour couplings needs only the Conventions.

**Checks.**

- Open Ising chain {0, 1, 2, 3} with nearest-neighbour coupling J and R(x) = 3 − x: with A = {0}, `⟨σ_0σ_1⟩ = tanh J ≥ tanh² J = ⟨σ_0σ_2⟩` and `⟨σ_0σ_0⟩ = 1 ≥ tanh³ J = ⟨σ_0σ_3⟩`.
- The inequality `J_{xy} ≥ J_{x,Ry}` is needed: on {0, 1, 2, 3} with R(x) = 3 − x and only `J_{02} = J_{13} = K > 0`, `⟨σ_0σ_1⟩ = 0 < tanh K = ⟨σ_0σ_2⟩`.
- For a site reflection (V = {−1, 0, 1}, R(x) = −x, V₀ = {0}), A = B = {1}: `1 = ⟨σ_1²⟩ ≥ ⟨σ_1σ_{−1}⟩ = tanh² J`.
- Evenness is needed for general multi-indices: on V = {−1, 0, 1} with R(x) = −x, J = 0 and the non-even `ρ = (2δ₋₁ + δ₁)/3` (mean −1/3, second moment 1), the indicator A of {1} and the indicator B of {0, 1}, for which R(B) is the indicator of {−1, 0}, give `⟨φ_1²φ_0⟩ = 1 · (−1/3) = −1/3 < −1/27 = (−1/3)³ = ⟨φ_1φ_{−1}φ_0⟩`, while ρ_I gives 0 on both sides. In general the flip φ ↦ −φ leaves `H_{V,J}` unchanged and carries `μ_{V,J,ρ}` to `μ_{V,J,ρ⁻}`, where ρ⁻ is the image of ρ, so for odd |A| + |B| the inequality for ρ is the reverse inequality for ρ⁻ and can hold for both only as an equality; here ρ⁻ = (δ₋₁ + 2δ₁)/3 satisfies it strictly, `1/3 > 1/27`.

### 3.7 Uniform moment bounds

Prove the integration-by-parts identity for φ⁴ measures: for λ > 0, b ∈ ℝ, a finite set V, any coupling J and x ∈ V, `4λ⟨φ_x⁴⟩ = 1 + 2b⟨φ_x²⟩ + Σ_{y≠x} J_{xy}⟨φ_xφ_y⟩` under `μ_{V,J,ρ_{λ,b}}`, and more generally `⟨∂_xF⟩ = ⟨F · (4λφ_x³ − 2bφ_x − Σ_{y≠x}J_{xy}φ_y)⟩` for every continuously differentiable F : ℝ^V → ℝ with `|F(φ)| + |∂_xF(φ)| ≤ C(1 + Σ_y φ_y²)^k` for some C and k; the diagonal entry `J_{xx}` enters neither side (Sokal, Section 3.1, (3.4)–(3.5), p. 342, for the nearest-neighbour φ⁴ model in finite volume). Prove the uniform bound `max_{x∈V} ⟨φ_x²⟩ ≤ M(λ, b, K) = [(2b₊ + K) + √((2b₊ + K)² + 16λ)]/(8λ)` for every K ≥ ‖J‖, that is, every K bounding the row sums `Σ_{y≠x} |J_{xy}|` (`phi4_secondMoment_le`), independent of V, from the identity, Jensen's inequality `⟨φ_x⁴⟩ ≥ ⟨φ_x²⟩²` and the Cauchy–Schwarz inequality, evaluated at a site where `⟨φ_x²⟩` is maximal. Prove Newman's exponential bound (`newman_bound`): for ρ in the Griffiths–Simon class, a ferromagnetic J and complex coefficients z ∈ ℂ^V, `|⟨exp(Σ_x z_xφ_x)⟩| ≤ exp(½⟨(Σ_x |Re z_x| φ_x)²⟩) = exp(½ Σ_{x,y} |Re z_x| |Re z_y| ⟨φ_xφ_y⟩)`, hence `⟨e^{a|φ_x|}⟩ ≤ 2e^{a²⟨φ_x²⟩/2}` for real a (Sokal, Section 2.2, property (j), (2.27), p. 328, for the infinite-volume φ⁴ state). A proof route: since `|e^w| = e^{Re w}`, the left side is at most `⟨exp(Σ_x Re z_x φ_x)⟩`; expanding the exponential, whose series converges absolutely under μ by 1.2, every moment `⟨φ_A⟩` is nonnegative by Griffiths I (3.1), so replacing each Re z_x by t_x = |Re z_x| does not decrease it; the odd moments of `Σ_x t_xφ_x` vanish (1.2), and summing the Gaussian inequality of 3.5 for t ∈ [0, ∞)^V against `1/(2n)!`, with `(2n − 1)!!/(2n)! = 1/(2ⁿn!)`, gives `exp(½⟨(Σ_x t_xφ_x)²⟩)`.

*Needs:* 0.2; 1.1; 1.2; for Newman's bound only, 2.2, 3.1 and 3.5.

**Checks.**

- One site, J = 0, b = 0: the identity gives `⟨φ⁴⟩ = 1/(4λ)`, matching the Gamma-function value of 0.2.
- The diagonal is excluded from the general identity: one site, λ = 1, b = 0, `J_{xx} = 1` and F = φ give `⟨∂F⟩ = 1` and, since the sum over y ≠ x is empty, right side `4⟨φ⁴⟩ = 1`; a sum over all y would give `4⟨φ⁴⟩ − ⟨φ²⟩ = 1 − Γ(3/4)/Γ(1/4) ≈ 0.662`.
- The growth bound on `∂_xF` is needed: one site, λ = 1, b = 0, J = 0 and `F(φ) = φ + sin(exp(φ⁴))`, which is smooth and bounded by 1 + |φ|. The right side is `4⟨φ⁴⟩ + 4⟨φ³ sin(exp(φ⁴))⟩ = 1 + 0` (odd integrand), but `|F′|` times the density has infinite integral (substituting `t = exp(φ⁴)` turns the oscillating part into `∫_1^∞ |cos t|/t dt = ∞`), so `⟨∂F⟩` is not a Lebesgue expectation.
- The bound gives `M(λ, 0, 0) = 1/(2√λ)`, above the exact `Γ(3/4)/(Γ(1/4)√λ) ≈ 0.338/√λ`.
- For ρ_I, Newman's bound reads `cosh a ≤ e^{a²/2}`, true. For the non-member `(1 − ε)δ₀ + ½ε(δ₁ + δ₋₁)` with ε = ¼ it fails for every small a > 0, because the coefficients of a⁴ are ε/24 on the left and ε²/8 on the right and ε/24 > ε²/8 for 0 < ε < 1/3; numerically, at a = 2 the left side is 1.691 and the right side `e^{1/2}` is 1.649.
- The absolute values on the right cannot be dropped: two Ising sites with J = 1 and z = (1, −1) give `⟨e^{σ_x − σ_y}⟩ = (e + e⁻¹ cosh 2)/(e + e⁻¹) ≈ 1.329`, while the signed form `exp(½⟨(σ_x − σ_y)²⟩) = e^{1 − tanh 1} ≈ 1.269` is smaller; the stated right side is `e^{1 + tanh 1} ≈ 5.822`. Only the real parts enter: for ρ_I on one site and z = iy the bound reads `|cos y| ≤ 1`, whereas a right side built from |z_x| would give the weaker `e^{y²/2}` (≈ 7.389 at y = 2, where `|cos 2| ≈ 0.416`).

### Examples

The two-site and chain Ising computations are the running examples; the Ising chain realises equality cases (`⟨σ_0σ_2⟩ = ⟨σ_0σ_1⟩⟨σ_1σ_2⟩` in Griffiths II), and the single-site Lebowitz test separates the Griffiths–Simon class from the even admissible measures.

### Dependencies

Layers 0–2; Mathlib `fkg`, `holley`, `Sym2`; Tau Ceti `TauCeti.PerfectMatching` (3.5), and `TauCeti.Probability.centralMoment_id_two_mul_gaussianReal` in a Check.

## Layer 4: The free-boundary infinite-volume state

Throughout, J is a translation-invariant finite-range ferromagnetic coupling on ℤ^d: a function J ≥ 0 on `Sym2 (Fin d → ℤ)` with `J({x + a, y + a}) = J({x, y})` for all a and `J({x, y}) = 0` when `‖x − y‖∞ > r` for some r, so that `J_{xy} = J(y − x)` with J(z) = J(−z) ≥ 0 finitely supported; it is restricted to finite subsets as needed, and ρ is even and admissible. The Gibbs measure of the restriction of J to the box V_R, transported to `ℝ^{ℤ^d}` (product σ-algebra and product topology) by extending configurations by zero outside V_R, is `boxGibbs`; it carries every box correlation, and a correlation involving a site outside V_R is zero for it.

### 4.1 Monotone limits of correlation functions

Define, for a multi-index A on ℤ^d with finite support, the free-boundary correlation `⟨φ_A⟩_{J,ρ} = lim_{R→∞} ⟨φ_A⟩_{V_R,J,ρ} ∈ [0, ∞]`, the limit of a sequence that is non-decreasing (by 3.2) once V_R contains the support of A (Sokal, Section 2.2, the sentence before properties (a)–(c), p. 327, for the nearest-neighbour φ⁴ model; Peled–Spinka, the paragraph after Theorem 2.3, p. 13, for the spin O(n) model with n ∈ {1, 2}; Aizenman–Duminil-Copin, the sentence after (1.17), p. 5, for Ising spins).

The API consists of the following facts.

- Exhaustion independence: for every increasing sequence of finite sets W_n with union ℤ^d, `⟨φ_A⟩_{W_n,J,ρ} → ⟨φ_A⟩_{J,ρ}`, because each W_n lies in some V_R and each V_R in some W_n (3.2).
- Symmetries: `⟨φ_{A(·−a)}⟩_{J,ρ} = ⟨φ_A⟩_{J,ρ}` for a ∈ ℤ^d; invariance under every g ∈ W_d with J ∘ g = J; vanishing for |A| odd.
- Griffiths I and II and, for ρ in the Griffiths–Simon class, the Lebowitz, Gaussian and Simon–Lieb inequalities hold for the limits (with the Simon–Lieb right side taken in the finite region Λ).
- Monotonicity in J: for ferromagnetic J ≤ J′ (both translation invariant and finite range), `⟨φ_A⟩_{J,ρ} ≤ ⟨φ_A⟩_{J′,ρ}`.
- Finiteness: if `sup_R max_{x∈V_R} ⟨φ_x^{2k}⟩_{V_R,J,ρ} < ∞` for every k, all limits are finite (Hölder).

*Needs:* 1.2; 3.1; 3.2; for the Lebowitz, Gaussian and Simon–Lieb inequalities of the limits, 3.5.

**Checks.**

- d = 1, nearest-neighbour Ising: `⟨σ_0σ_x⟩_{V_R} = tanh^{|x|} J` for every R ≥ |x| (open chain), so `⟨σ_0σ_x⟩_{J,ρ_I} = tanh^{|x|} J`.
- The exhaustion W_n = {−n, …, 2n} of ℤ gives the same limits as the boxes.
- For ρ = δ₀ correlations of positive total degree vanish and the zeroth correlation is 1 (in particular A = 2δ_x gives 0 and A = 0 gives 1), and for J = 0 they are products of single-site moments.

### 4.2 The infinite-volume law

Prove that if (J, ρ) satisfies the uniform exponential moment condition `sup_R sup_{x∈V_R} ⟨e^{a|φ_x|}⟩_{V_R,J,ρ} < ∞` for some a > 0, then for every finite F ⊂ ℤ^d the laws of `(φ_x)_{x∈F}` under `μ_{V_R,J,ρ}` converge weakly as R → ∞; that there is a unique probability measure `μ_{J,ρ}` on `ℝ^{ℤ^d}` with the product σ-algebra having these limits as finite-dimensional marginals; that its moments are the correlations of 4.1; that it is invariant under translations, under the elements of W_d preserving J and under φ ↦ −φ; and that it does not depend on the exhaustion (Sokal, Section 2.2, properties (a)–(b) and (2.18), p. 327, for the nearest-neighbour φ⁴ model; Duminil-Copin, Corollary 1.9, p. 14, for the Ising model). Since `ℝ^{ℤ^d}` is a countable product of Polish spaces, convergence of all finite-dimensional marginals is equivalent to weak convergence of the box measures `boxGibbs` in the product topology (the marginals are tight, and a product of compact sets is compact), which is how `exists_infiniteVolume_limit` states the existence of the limit, together with the convergence of the moments and the invariance under translations and under φ ↦ −φ. Prove that the uniform exponential moment condition holds for every such coupling when ρ has bounded support (in particular for ρ_I and every Ising-block measure) and, for every a, when ρ is a φ⁴ measure (`phi4_uniform_expMoment`, through Newman's bound of 3.7 for the class, 2.3, and the uniform bound of 3.7 with K the row norm of J), and that it holds for ρ in the Griffiths–Simon class whenever `sup_R sup_x ⟨φ_x²⟩_{V_R} < ∞` (3.7). A proof route: tightness from the uniform second moments (Prokhorov); every subsequential limit has the limiting moments by uniform integrability; one-dimensional projections with nonnegative and arbitrary coefficients have exponential moments by Hölder, so they are determined by their moments (`TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`), and the marginal law by Cramér–Wold; the projective family on ℤ^d is assembled by `TauCeti.Measure.exists_isProjectiveLimit_of_countable`.

The API consists of the following facts.

- The finite-dimensional marginals of `μ_{J,ρ}` are the weak limits of the finite-volume marginals, and `∫ φ_A dμ_{J,ρ} = ⟨φ_A⟩_{J,ρ}` for every multi-index A.
- `μ_{J,ρ}` is invariant under the translations of ℤ^d, under the elements of W_d preserving J and under φ ↦ −φ.
- Griffiths I and II and the FKG inequality hold for `μ_{J,ρ}` (for continuous, polynomially bounded, coordinatewise non-decreasing functions of finitely many coordinates), and for ρ in the Griffiths–Simon class also the Lebowitz and Gaussian inequalities and Newman's exponential bound.

*Needs:* 4.1; Mathlib `isCompact_closure_of_isTightMeasureSet`, `MeasureTheory.Measure.ext_of_charFun`, `tendstoInDistribution_iff_tendstoInDistribution_inner`, `MeasureTheory.IsProjectiveMeasureFamily`; Tau Ceti `TauCeti.Measure.exists_isProjectiveLimit_of_countable`, `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`; for the sufficient conditions for φ⁴ measures and for the Griffiths–Simon class and for Newman's bound of the limit, 3.7, and for φ⁴ measures also 2.3; for the FKG inequality of the limit, 3.3 (finite-volume FKG and uniform-integrability passage for continuous polynomially bounded cylinder functions).

**Checks.**

- d = 1, nearest-neighbour Ising: `μ_{J,ρ_I}` is the law of the stationary two-state Markov chain on {±1}^ℤ with `P(σ_{x+1} = σ_x) = (1 + tanh J)/2`.
- For J = 0, `μ_{0,ρ}` is `MeasureTheory.Measure.infinitePi` of ρ. The inherited FKG inequality with F = G = φ on one Ising coordinate is `1 ≥ 0`; with F = φ_x, G = φ_y at independent distinct coordinates it is `0 ≥ 0`.
- The exponential moment condition is what identifies limits: without it a sequence of laws with converging moments may have two different limit points with the same moments (the log-normal law and its Stieltjes perturbations have equal moments), so moment convergence alone does not give weak convergence.

### 4.3 Two-point function, susceptibility and critical point

Define the two-point function `S_{ρ,J}(x) = ⟨φ_0φ_x⟩_{J,ρ} ∈ [0, ∞]` (`twoPoint`, written as the supremum over R of the box correlations under `boxGibbs`, which is their monotone limit by 4.1), the susceptibility `χ(ρ, J) = Σ_{x∈ℤ^d} S_{ρ,J}(x) ∈ [0, ∞]` (`susceptibility`), and the critical point `β_c(ρ, J) = sup{β ≥ 0 : χ(ρ, βJ) < ∞} ∈ [0, ∞]` (`criticalPoint`); the sub-critical regime is χ(ρ, βJ) < ∞ (Aizenman–Duminil-Copin (5.1), p. 23; Sokal (2.33), p. 329, and Proposition 2.1, p. 333).

Prove the high-temperature bound for the nearest-neighbour Ising model (`criticalPoint_ising_ge`, which states both inequalities): for 0 ≤ β with 2dβ < 1, `χ(ρ_I, βJ^{nn}) ≤ 1/(1 − 2dβ)`, where `J^{nn}` is the nearest-neighbour coupling of strength 1 (`nnCoupling`), so that `β_c(ρ_I, J^{nn}) ≥ 1/(2d)`. A proof route: the Simon–Lieb inequality of 3.5 with Λ = {v} (in the finite-volume form of Aizenman–Duminil-Copin, Lemma 5.7 with footnote 5, p. 30), applied in the box V_R to `χ_v = Σ_{y∈V_R} ⟨σ_vσ_y⟩_{V_R}`, gives `χ_v ≤ 1 + β Σ_{w∼v} χ_w ≤ 1 + 2dβ max_w χ_w`, hence `max_v χ_v ≤ 1/(1 − 2dβ)`, and Fatou's lemma passes the bound to the monotone limits.

The API consists of the following facts.

- S ≥ 0, S(−x) = S(x) and `S(x) ≤ S(0) = ⟨φ_0²⟩_{J,ρ}` (Cauchy–Schwarz in V_R and translation invariance when S(0) is finite, trivially otherwise); and, when S(0) < ∞, every S(x) is finite and S is positive definite: `Σ_{x,y} c_xc_y S(x − y) ≥ 0` for finitely supported real c, the sum being `lim_R ⟨(Σ_x c_xφ_x)²⟩_{V_R}` by translation invariance (4.1).
- S and χ are non-decreasing in β (4.1), so `{β ≥ 0 : χ(ρ, βJ) < ∞}` is an interval containing 0, and `χ(ρ, 0) = ∫φ² dρ`.
- For ρ in the Griffiths–Simon class and Λ ∋ 0 finite, the Simon–Lieb inequality gives `S(y) ≤ Σ_{u∈Λ, v∉Λ} ⟨φ_0φ_u⟩_Λ J_{uv} S(y − v)` for y ∉ Λ.
- The truncated susceptibility `χ_L = Σ_{x∈Λ_L} S(x)` (Aizenman–Duminil-Copin (5.23)) is finite whenever the moments are.

*Needs:* 4.1; for the Simon–Lieb bound and the high-temperature bound, 3.5.

**Checks.**

- d = 1, nearest-neighbour Ising with t = tanh J: `χ = (1 + t)/(1 − t) < ∞` for all J, so `β_c = ∞`.
- For ρ = δ₀, S ≡ 0, χ = 0 and β_c = ∞; for J = 0, χ = ∫φ²dρ.
- Positive definiteness is not implied by the other properties: for c = δ₀ − δ₁ + δ₂ on ℤ, the d = 1 Ising two-point function `t^{|x|}` gives `3 − 4t + 2t² = 2(1 − t)² + 1 > 0`, while the function equal to 1 at 0, to 4/5 at ±1 and to 0 elsewhere, which is nonnegative, even and bounded by its value at 0, gives `3 − 16/5 = −1/5`.
- The high-temperature bound at d = 1, β = ¼: `χ(ρ_I, ¼J^{nn}) = e^{1/2} ≈ 1.649 ≤ 2 = 1/(1 − 2dβ)`; at d = 1 the true critical point is ∞ ≥ ½. For a coupling of strength J > 0 the bound reads `β_c(ρ_I, J·J^{nn}) ≥ 1/(2dJ)`, and for J = 0, β_c = ∞.
- d = 0 (one site, no pair): `χ(ρ_I, βJ^{nn}) = ⟨σ_0²⟩ = 1 = 1/(1 − 2dβ)` for every β, so the bound is attained, and `β_c = ∞ = (2d)⁻¹` in [0, ∞].
- The susceptibility estimate is not asserted outside 2dβ < 1: at d = 1, β = 1, `χ(ρ_I, J^{nn}) = e² ≈ 7.389` while `1/(1 − 2dβ) = −1`, and at β = ½ the denominator vanishes; the bound `β_c ≥ 1/(2d)` still holds there.

### 4.4 Axis monotonicity of the two-point function

Prove, for the nearest-neighbour coupling of strength J ≥ 0 on ℤ^d and even admissible ρ, the infinite-volume reflection inequality `⟨φ_Aφ_B⟩_{J,ρ} ≥ ⟨φ_Aφ_{R(B)}⟩_{J,ρ}` for every coordinate or diagonal reflection R of 3.6 and multi-indices A, B on the closed side of its hyperplane, and its consequences (Aizenman–Duminil-Copin, Proposition 5.1 and (5.3)–(5.4), pp. 23–24, for single-site measures with their growth condition (2.2)): S(n e_i) is non-increasing in n ≥ 0 for each axis; `S(‖x‖∞ e_i) ≥ S(x) ≥ S(‖x‖₁ e_i)` for every axis i (by the symmetry of W_d the axis does not matter; the source writes `(‖x‖∞, 0⊥)`); and S(x) ≥ S(y) whenever `‖y‖∞ ≥ d‖x‖∞` (`twoPoint_reflection_monotone` states these three consequences). A proof route: exhaust ℤ^d by finite R-invariant sets (W ∪ R(W) for boxes W), apply 3.6 in finite volume and use exhaustion independence (4.1); the axis statements follow by composing reflections.

*Needs:* 3.6; 4.1; 4.3.

**Checks.**

- d = 1, Ising: S(n) = tanh^n J is non-increasing in n.
- d = 2, Ising, to leading order in t = tanh J: `S((1,0)) ≈ t`, `S((1,1)) ≈ 2t²` and `S((2,0)) ≈ t²`, consistent with `S((1,0)) ≥ S((1,1)) ≥ S((2,0))` for small t.
- J = 0: S is `⟨φ²⟩` at 0 and 0 elsewhere, trivially monotone; a next-nearest-neighbour coupling stronger across the hyperplane than within it violates the finite-volume hypothesis (3.6, Checks), so the restriction to nearest-neighbour couplings is used.

### Examples

The one-dimensional Ising chain is the complete worked example of this layer: correlations `tanh^{|x|} J`, the Markov-chain law, susceptibility `(1 + t)/(1 − t)` and `β_c = ∞`.

### Dependencies

Layers 1 and 3, and Layer 2 (through 3.5 and 3.7, and 2.3 for the φ⁴ case of 4.2); Mathlib `isCompact_closure_of_isTightMeasureSet`, `MeasureTheory.Measure.ext_of_charFun`, `tendstoInDistribution_iff_tendstoInDistribution_inner`, `MeasureTheory.IsProjectiveMeasureFamily`, `MeasureTheory.Measure.infinitePi`; Tau Ceti `TauCeti.Measure.exists_isProjectiveLimit_of_countable`, `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`.

## Layer 5: Reflection positivity and the infrared bound on the torus

Throughout, ρ is admissible, J ≥ 0, L ≥ 1, and `μ^{per}_{L,J,ρ}` is the Gibbs measure of 1.1 on the torus T_L with the periodic nearest-neighbour coupling of the Conventions; the bound `E(p) Ŝ_L(p) ≤ 1/J` of 5.4 and the statements of 5.5 assume J > 0.

### 5.1 Periodic measures on the discrete torus

Define the periodic coupling `J^{per}_{xy} = J · #{(j, ±) : y = x ± e_j}` on T_L (`torusCoupling`, counting the j with y = x + e_j and the j with x = y + e_j), the periodic measure `μ^{per}_{L,J,ρ} = μ_{T_L, J^{per}, ρ}`, the symbol E at the dual points (`torusSymbol`), and the Fourier transform of its two-point function `Ŝ_L(p) = Σ_{x∈T_L} e^{ip·x}⟨φ_0φ_x⟩^{per}` for p ∈ Λ*_L (`structureFactor`) (Aizenman–Duminil-Copin (5.5)–(5.8), p. 24; Peled–Spinka, Section 2.7.1, p. 27).

The API consists of the following facts.

- `μ^{per}` is invariant under the translations of T_L and under W_d, and under φ ↦ −φ for even ρ.
- `Ŝ_L(p) = |T_L|⁻¹ ⟨|Σ_x φ_x e^{−ip·x}|²⟩^{per} ≥ 0`, it is real and even in p, and `Ŝ_L(0) = |T_L|⁻¹⟨(Σ_x φ_x)²⟩^{per}`.
- The Hamiltonian is diagonalised by the discrete Fourier transform (`ZMod.dft` coordinatewise): `Σ_x Σ_j (φ_x − φ_{x+e_j})² = |T_L|⁻¹ Σ_p E(p) |φ̂(p)|²`.

*Needs:* 1.1; 1.2; Mathlib `ZMod.dft`.

**Checks.**

- L = 1, d = 1: T_1 = {0, 1} with coupling 2J, so `⟨σ_0σ_1⟩ = tanh 2J` for Ising spins, `Ŝ_1(0) = 1 + tanh 2J` and `Ŝ_1(π) = 1 − tanh 2J`.
- L = 2, d = 1: the 4-cycle with Ising spins has `⟨σ_0σ_1⟩ = (t + t³)/(1 + t⁴)` with t = tanh J, which differs from the open-chain value t.
- `E(p)` vanishes only at p = 0 on Λ*_L, and `E((π, …, π)) = 4d`.

### 5.2 Reflection positivity and the chessboard estimate

Prove reflection positivity of `μ^{per}` through vertex hyperplanes and through edge hyperplanes (`reflectionPositive`): for the reflection R of T_L in a hyperplane orthogonal to a coordinate axis, passing through vertices (respectively bisecting edges), and every bounded measurable complex function f of the spins on one closed half (respectively open half), `⟨f · conj(f ∘ R)⟩^{per} ≥ 0`. In coordinates, for an axis j, a base point a ∈ ℤ/2Lℤ and ε ∈ {0, 1}, R replaces `x_j` by `2a + ε − x_j` and the half is `{x : ε ≤ (x_j − a) mod 2L ≤ L}`: ε = 0 is the vertex reflection fixing the layers `x_j = a` and `x_j = a + L`, ε = 1 the edge reflection exchanging a with a + 1 and a + L with a + L + 1 (Peled–Spinka, Propositions 2.14 and 2.15, pp. 28–29; their proofs use only the domain Markov property and, for edges, the positive-definite representation `e^{Jab} = e^{J(a²+b²)/2} ∫ e^{iτ(a−b)} dν_J(τ)` with ν_J a Gaussian measure, which needs J ≥ 0). Prove the chessboard estimate (`chessboard`): for d ≥ 1 and bounded measurable real functions `(f_v)_{v∈T_L}`, `|⟨Π_v f_v(φ_v)⟩|^{|T_L|} ≤ Π_w ⟨Π_v f_w(φ_v)⟩` (Proposition 2.16, p. 30), and its corollary for the comparison of a configuration event with constant ones (Corollary 2.17, p. 32; Friedli–Velenik, Chapter 10).

*Needs:* 0.1; 1.1; 5.1.

**Checks.**

- L = 1, d = 1, edge reflection 0 ↔ 1: the form `(f, f) = ⟨f(σ_0)f(σ_1)⟩` has matrix proportional to `[[e^{2J}, e^{−2J}], [e^{−2J}, e^{2J}]]`, positive semidefinite iff J ≥ 0; the antiferromagnet fails.
- With all f_v ≡ 1 the chessboard estimate is an equality.
- With all f_v ≡ −1 both sides equal 1, because `|T_L| = (2L)^d` is even for d ≥ 1. On the one-point torus (d = 0) the Gibbs measure is ρ and the estimate would read `|−1|¹ = 1 ≤ −1`, so the hypothesis d ≥ 1 is used.
- For J = 0, `μ^{per}` is a product measure: an edge reflection gives `|E f|² ≥ 0`, while a vertex reflection gives `E[|E(f | spins on the fixed vertices)|²] ≥ 0`. For d = 1, L = 2, R(x) = −x, Ising spins and f = φ₀, the latter form is 1, whereas `|E f|² = 0` (Peled–Spinka, Proposition 2.14, p. 28).

### 5.3 Gaussian domination

Prove Gaussian domination (`gaussian_domination`): for every `h ∈ ℝ^{T_L}`, `Z(h) ≤ Z(0)`, where `Z(h) = ∫ exp(−(J/2) Σ_x Σ_j (φ_x + h_x − φ_{x+e_j} − h_{x+e_j})²) Π_x ρ̃(dφ_x)` and `ρ̃(dφ) = e^{dJφ²} ρ(dφ)` is a finite measure because ρ is admissible; equivalently `⟨exp(J(φ, Δh))⟩^{per} ≤ exp(−(J/2)(h, Δh))` with `(Δh)_x = Σ_j (h_{x+e_j} + h_{x−e_j} − 2h_x)` (Peled–Spinka (43)–(48), Section 2.7.2, pp. 32–33, and Simon, Twelve Tales (5.19)–(5.21), Section 5, pp. 36–37, for the spin O(n) model, whose spins are uniformly distributed on a sphere; Fröhlich–Simon–Spencer 1976). The identity `−(J/2)Σ_xΣ_j(φ_x − φ_{x+e_j})² = JΣ_xΣ_jφ_xφ_{x+e_j} − dJΣ_xφ_x²` identifies Z(0) with the periodic partition function. A proof route, for d ≥ 1 (for d = 0 the sums over j are empty and Z is constant): fix a bounded open interval U ∋ 0 with Lebesgue measure η₀ on it, and give the pairs `(φ_x, τ_x)_{x∈T_L}` the law with density proportional to `W(φ + τ)`, where `W(s) = exp(−(J/2) Σ_x Σ_j (s_x − s_{x+e_j})²)`, with respect to `Π_x ρ̃(dφ_x) η₀(dτ_x)`; this is Peled–Spinka's auxiliary system, with spin space ℝ × ℝ and interaction `e^{−(J/2)(a + a′ − b − b′)²}` (the proof of (46), p. 33). The marginal of τ has density `Z(τ)/∫ Z dη₀^{⊗T_L}`, and Z is continuous by dominated convergence (`MeasureTheory.continuous_of_dominated`, with W ≤ 1 and ρ̃ finite). Since W depends only on s = φ + τ, the identity above shows that s has the law `μ^{per}_{L,J,κ}`, where κ is the probability measure proportional to `e^{−dJs²} (ρ̃ ∗ η₀)(ds)` (`MeasureTheory.Measure.conv`); κ is admissible, because for |τ| ≤ M on U the integral `∫ e^{cs²} dκ` is at most a constant times `∫ e^{(2|c − dJ| + dJ)φ²} dρ(φ)`. For `t ∈ U^{T_L}` and ε > 0, the event `E_{t,ε} = {|τ_v − t_v| < ε for all v}` has probability `⟨Π_v f_{t_v}(s_v)⟩^{per}_{L,J,κ}`, where f_a is the density with respect to `ρ̃ ∗ η₀` of the image of `ρ̃ ⊗ 1[|τ − a| < ε] η₀` under (φ, τ) ↦ φ + τ, which has a measurable version with values in [0, 1] (`MeasureTheory.Measure.rnDeriv_le_one_of_le`). The chessboard estimate of 5.2 for κ gives `P(E_{t,ε})^{|T_L|} ≤ Π_w P(E_{c_w,ε})`, with c_w the constant configuration of value t_w, and W is invariant under adding a constant, so Z(c_w) = Z(0). Dividing by `(2ε)^{|T_L|²}` and letting ε ↓ 0 gives `Z(t)^{|T_L|} ≤ Z(0)^{|T_L|}` by the continuity of Z, and every `t ∈ ℝ^{T_L}` lies in `U^{T_L}` for some U. Peled–Spinka apply the chessboard estimate to the pair system itself; the passage to the single real spin s, to which 5.2 applies as stated, is this roadmap's.

*Needs:* 0.1; 1.1; 5.1; for the route, 5.2 and Mathlib `MeasureTheory.Measure.conv`, `MeasureTheory.Measure.rnDeriv_le_one_of_le`, `MeasureTheory.continuous_of_dominated`.

**Checks.**

- L = 1, d = 1, Ising: with u = h₀ − h₁, `Z(h) ∝ 2e^{−Ju²} + e^{−J(2+u)²} + e^{−J(2−u)²}`, whose second derivative at u = 0 is `−4J + e^{−4J}(32J² − 4J) ≤ 0` (the maximum of `e^{−4J}(8J − 1)` is `2e^{−3/2} ≈ 0.45 < 1`), consistent with a maximum at h = 0.
- As a separate Gaussian-gradient example with Lebesgue measure, pin φ₀ = 0 and integrate over the other coordinates of the connected torus, removing the constant zero mode. Translation by `h − h₀` preserves this pinned space and gives `Z(h) = Z(0) < ∞` for J > 0. For the two-vertex torus with J = 1 this is `Z(u) = ∫ exp(−(x − u)²) dx = √π`; without pinning the common-translation integral is infinite. This example is outside the probability a-priori setting of the theorem (Peled–Spinka, the closing paragraph of Section 2.7.2, p. 33).
- For h constant, Z(h) = Z(0) exactly. For J = 0, `ρ̃ = ρ` and `Z(h) = 1 = Z(0)` for every h, so the inequality is an equality.

### 5.4 The infrared bound and the sum rule

Prove, for J > 0, the infrared bound `E(p) Ŝ_L(p) ≤ 1/J` for every p ∈ Λ*_L ∖ {0} (`infrared_bound`), and, for J ≥ 0, its quadratic-form version `J⟨(φ, −Δh)²⟩^{per} ≤ (h, −Δh)` for all real h on T_L, where `(h, −Δh) = Σ_x Σ_j (h_x − h_{x+e_j})²` (Aizenman–Duminil-Copin (5.8)–(5.9), p. 24, for single-site measures with their growth condition (2.2), with the constant corrected as in the Conventions; Peled–Spinka (49)–(52), Section 2.7.3, pp. 34–35, and Simon, Twelve Tales (5.17) and (5.22), Section 5, pp. 36–37, for the spin O(n) model; Fröhlich–Simon–Spencer 1976, Theorem 1). The first-order term vanishes by translation invariance, since Σ_x(Δh)_x = 0, so evenness of ρ is not needed. Prove the sum rule `⟨φ_0²⟩^{per} = |T_L|⁻¹ Σ_{p∈Λ*_L} Ŝ_L(p)` (Aizenman–Duminil-Copin (5.10), p. 24), and for d ≥ 3 the Riemann-sum limit `|T_L|⁻¹ Σ_{p∈Λ*_L∖{0}} 1/E(p) → I_d = (2π)^{−d} ∫_{[−π,π]^d} dp/E(p) < ∞` (`infraredConstant`; I_d is the massless lattice Green function `G_0(0)` of 1.5).

*Needs:* 5.1; for the infrared bound and its quadratic-form version, 5.3.

**Checks.**

- L = 1, d = 1, Ising: `E(π) = 4` and `Ŝ_1(π) = 1 − tanh 2J`, so the bound reads `4J(1 − tanh 2J) ≤ 1`; the left side has maximum ≈ 0.557, attained near 2J ≈ 0.64. The constant `1/(4J)` printed in Aizenman–Duminil-Copin (5.9) would require `4(1 − tanh 2J) ≤ 1/(4J)`, false at J = 0.375 (left 1.46, right 0.67).
- The Gaussian torus field with |b| > dJ has `E(p)Ŝ_L(p) = E(p)/(2(|b| − dJ) + JE(p)) < 1/J`, approaching 1/J as |b| ↓ dJ: the constant is sharp.
- Sum rule at L = 1, d = 1, Ising: `½(Ŝ(0) + Ŝ(π)) = ½((1 + t) + (1 − t)) = 1 = ⟨σ_0²⟩` with t = tanh 2J. The excluded mode p = 0 has E(0) = 0 and carries the long-range order.
- J = 0: the quadratic-form version reads `0 ≤ (h, −Δh)`, the positive semidefiniteness of `−Δ`, and the bound `E(p) Ŝ_L(p) ≤ 1/J` is not asserted. At L = 1, d = 1 and h = (1, −1), `(Δh)_0 = 2h_1 − 2h_0 = −4`, so `(h, −Δh) = 8 = 2(h_0 − h_1)²`; for J > 0 and Ising spins the same h gives `(φ, −Δh) = 4(σ_0 − σ_1)` and the quadratic form reads `32J(1 − tanh 2J) ≤ 8`, the first Check again.

### 5.5 Long-range order for the Ising model in d ≥ 3

Prove that for d ≥ 3, ρ = ρ_I and J > 0, `liminf_{L→∞} ⟨(|T_L|⁻¹ Σ_{x∈T_L} σ_x)²⟩^{per}_{L,J,ρ_I} ≥ 1 − I_d/J`, which is positive for J > I_d (`ising_longRangeOrder`, which states the liminf as: for every ε > 0 the inequality with `1 − I_d/J − ε` holds for all large L); more generally, for admissible ρ and J > 0, `liminf_L (|T_L|⁻¹ Ŝ_L(0) − ⟨φ_0²⟩^{per}_L) ≥ −I_d/J` (Peled–Spinka, Theorem 2.13, p. 26, and (53), p. 36, and Simon, Twelve Tales (5.15)–(5.18), Section 5, p. 36, for the spin O(n) model, whose case n = 1 is the Ising statement; Fröhlich–Simon–Spencer 1976).

*Needs:* 5.4.

**Checks.**

- d = 3: `I_3 = W/2 ≈ 0.2527`, with Watson's integral `W = π^{−3} ∫_{[0,π]³} dp/(3 − Σ_j cos p_j) ≈ 0.5055`; equivalently `I_3 = G(0)/6` with `G(0) ≈ 1.516` the expected number of returns of simple random walk. Peled–Spinka's form `(1/(2J)) ∫_{[0,1]^d} dt/Σ_j(1 − cos πt_j)` gives the same constant.
- d = 1, 2: `∫ dp/E(p)` diverges near p = 0, so the statement gives nothing, as it must for d = 1, where the Ising chain has no long-range order.
- For J ≤ I_d the lower bound is nonpositive and vacuous.

### Examples

The two-site torus (L = 1, d = 1) is the fully computed example of every statement of this layer; the Gaussian torus field shows the sharpness of the infrared constant.

### Dependencies

Layers 0 and 1; Mathlib `ZMod.dft`, `MeasureTheory.Measure.conv`, `MeasureTheory.Measure.rnDeriv_le_one_of_le`, `MeasureTheory.continuous_of_dominated`. Independent of Layers 2–4.

## Layer 6: Random fields, Schwinger functions and Gaussian fields

### 6.1 Random fields indexed by test functions

Define a random field on ℝ^d over a probability space (Ω, P) (`IsRandomField`) as a family `T = (T_f)_{f∈C_c(ℝ^d)}` of real random variables (measurable functions on Ω) such that for all f, g ∈ C_c(ℝ^d) and a, b ∈ ℝ, `T_{af+bg} = aT_f + bT_g` almost surely; its law is the image of P under ω ↦ (f ↦ T_f(ω)) on `ℝ^{C_c(ℝ^d)}` with the product σ-algebra, and two random fields, possibly on different probability spaces, are equal up to finite-dimensional distributions if their laws agree (Aizenman–Duminil-Copin (1.4), p. 2, and footnote 2, p. 4; Glimm–Jaffe, Chapter 6; Simon 1974, Chapter I).

The API consists of the following facts.

- Equality up to finite-dimensional distributions holds iff all finite-dimensional laws agree (`ProbabilityTheory.map_eq_iff_forall_finset_map_restrict_eq`), and it is an equivalence relation.
- Realisation: a family of probability measures ν_F on ℝ^F, F ⊆ C_c(ℝ^d) finite, that is projective and linear (each ν_F is carried by the subspace `{v : v_h = av_f + bv_g}` whenever f, g, h = af + bg ∈ F) is the family of finite-dimensional laws of a random field, unique up to finite-dimensional distributions; the canonical field is the coordinate family on `ℝ^{C_c(ℝ^d)}` under the projective limit given by StochasticCalculus §1.1.
- Transport: for a linear map ℓ of C_c(ℝ^d), `(T_{ℓf})_f` is a random field; in particular for g ∈ W_d, for translations and for dilations of ℝ^d, `f ↦ T_{f∘g}` is a random field. Negatives, scalar multiples and sums of independent random fields are random fields.

*Needs:* Mathlib `CompactlySupportedContinuousMap`, `ProbabilityTheory.map_eq_iff_forall_finset_map_restrict_eq`; for the realisation, StochasticCalculus §1.1 and Mathlib `MeasureTheory.IsProjectiveMeasureFamily`, `MeasureTheory.IsProjectiveLimit.unique`.

**Checks.**

- The zero field T ≡ 0, and the deterministic field `T_f = ∫ f h dx` for locally integrable h, whose finite-dimensional laws are Dirac measures.
- White noise with `E[T_fT_g] = ∫ fg dx` is a random field (6.3).
- `T_f = |∫ f dx|` is not a random field: `T_{−f} = T_f ≠ −T_f` whenever ∫f ≠ 0.

### 6.2 Moment functionals and Schwinger functions

Define, for a random field T with `E|T_f|ⁿ < ∞` for all f and n, the moment functionals `M_n(f_1, …, f_n) = E[T_{f_1} ⋯ T_{f_n}]`, and call a locally integrable function `S_n : (ℝ^d)^n → ℝ` an n-point Schwinger function of T if `M_n(f_1, …, f_n) = ∫ S_n(x_1, …, x_n) Π_i f_i(x_i) dx` for all f_i ∈ C_c(ℝ^d) (Aizenman–Duminil-Copin (1.5)–(1.6), p. 2). Define the decay condition (1.10) for a two-point Schwinger function: for every ε > 0 there is r with `|S_2(x, y)| ≤ ε` for almost every (x, y) with |x − y| ≥ r (Aizenman–Duminil-Copin (1.10), p. 3).

The API consists of the following facts.

- M_n is symmetric and multilinear, and depends only on the law of T.
- Uniqueness: two n-point Schwinger functions of T agree almost everywhere, because linear combinations of products `f_1 ⊗ ⋯ ⊗ f_n` approximate every smooth compactly supported function on `(ℝ^d)^n` and `ae_eq_zero_of_integral_contDiff_smul_eq_zero` applies.
- Schwinger functions are symmetric almost everywhere under permutations of their arguments; if S_2 exists, `∫∫ f(x) S_2(x, y) f(y) dx dy = E[T_f²] ≥ 0`.
- Changing S_2 on a null set preserves (1.10), and (1.10) is equivalent to the existence of a representative with `sup_{|x−y|≥r} |S_2(x, y)| → 0` as r → ∞ (given (1.10) for ε = 1/k with radii r_k, redefine S_2 as 0 on the union of the exceptional null sets).

*Needs:* 6.1; Mathlib `ae_eq_zero_of_integral_contDiff_smul_eq_zero`.

**Checks.**

- The deterministic field `T_f = ∫ fh` has `S_n(x) = Π_i h(x_i)`; for `h(x) = e^{−|x|²}` the two-point function `e^{−|x|²−|y|²} ≤ e^{−|x−y|²/2}` satisfies (1.10), while for h ≡ 1 it is identically 1 and fails it. Decay of S_2 alone does not force centring.
- The uniformity in (1.10) is used: `S(x, y) = 1` for `|x − y| ≤ 1 + |x|` and 0 otherwise is bounded and tends to 0 as |y| → ∞ for each fixed x, but for every r the set `{|x − y| ≥ r, S = 1}` has positive measure (it contains the pairs with |x| ≥ r and |x − y| ∈ [r, 1 + |x|]), so S fails (1.10) with ε = ½.
- White noise has no two-point Schwinger function: such an S_2 would vanish almost everywhere off the diagonal (test with f, g of disjoint supports), hence almost everywhere, contradicting `E[T_f²] = ∫f² > 0`.
- The Gaussian free field of 7.4 has `S_2(x, y) = G_m(x − y)/C_m(1_Q, 1_Q)` with G_m the continuum Green function; in d = 1, `G_m(x) = e^{−m|x|}/(2m)`, which satisfies (1.10).

### 6.3 Gaussian processes with a prescribed covariance

Prove that for any type I and any symmetric positive semidefinite kernel K : I → I → ℝ (`Σ_{i,j} c_ic_j K(i, j) ≥ 0` for finitely supported c) there is a centred process X on a probability space with `ProbabilityTheory.IsGaussianProcess` and `E[X_iX_j] = K(i, j)`, unique in law (`exists_unique_gaussianProcess`, stated for the coordinate process on ℝ^I with the product σ-algebra); that if I is a real vector space and K is bilinear then X is almost surely linear; and, specialising to I = C_c(ℝ^d), that for every positive semidefinite symmetric bilinear form C on C_c(ℝ^d) there is a centred Gaussian random field with covariance C, unique up to finite-dimensional distributions. A generalised Gaussian process is a random field satisfying `ProbabilityTheory.IsGaussianProcess` (Aizenman–Duminil-Copin, the paragraph of (1.7), p. 2; Glimm–Jaffe, Chapter 6; Simon 1974, Chapter I). A proof route: the restrictions `ProbabilityTheory.multivariateGaussian 0 (K|_F)` form a projective family by `ProbabilityTheory.measurePreserving_restrict₂_multivariateGaussian` (as in `ProbabilityTheory.BrownianReal.projectiveFamily`); StochasticCalculus §1.1 gives the process; linearity because `X_{af+bg} − aX_f − bX_g` is a centred Gaussian variable of variance 0.

The API consists of the following facts.

- Two centred generalised Gaussian processes with the same covariance are equal up to finite-dimensional distributions.
- The image of a centred Gaussian random field under a linear map of test functions is a centred Gaussian random field, with the transported covariance.
- A centred Gaussian random field has all moments, and `E[T_f] = 0`.

*Needs:* 6.1; StochasticCalculus §1.1; Mathlib `ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.measurePreserving_restrict₂_multivariateGaussian`, `ProbabilityTheory.IsGaussianProcess`, `MeasureTheory.Measure.ext_of_charFun`.

**Checks.**

- I = Fin 2, `K = [[1, r], [r, 1]]` with |r| ≤ 1: the bivariate normal law with correlation r.
- `K = [[1, 2], [2, 1]]` has eigenvalue −1 and no such process exists: `X₁ − X₂` would have variance 1 − 4 + 1 = −2.
- On I = [0, ∞) with K(s, t) = min(s, t) the finite-dimensional laws are Mathlib's `ProbabilityTheory.BrownianReal.projectiveFamily`; on C_c(ℝ^d) the form `∫ fg dx` gives white noise.

### 6.4 Wick's law

Prove that a random field T with all moments and `E[T_f] = 0` for all f is a generalised Gaussian process iff its moment functionals satisfy Wick's law (`isGaussianProcess_iff_wick`, with the pairings indexed by `TauCeti.PerfectMatching`): `M_{2n+1} = 0` and `M_{2n}(f_1, …, f_{2n}) = Σ_π Π_{j=1}^n M_2(f_{π(2j−1)}, f_{π(2j)})` for all n, the sum over pairings (Aizenman–Duminil-Copin (1.7), p. 2). Prove that if moreover T has a two-point Schwinger function S_2, then T has 2n-point Schwinger functions `S_{2n} = G_n[S_2]`, with `G_n[S_2](x_1, …, x_{2n}) = Σ_π Π_j S_2(x_{π(2j−1)}, x_{π(2j)})` (locally integrable because each product separates the variables), and vanishing odd Schwinger functions. A proof route: the forward direction applies, to the centred multivariate Gaussian law of `(T_{f_1}, …, T_{f_k})`, the vanishing of odd centred products (`TauCeti.Probability.integral_prod_sub_multivariateGaussian_eq_zero_of_odd`) and the Wick–Isserlis pairing formula (StandardDistributions §5.3); for the converse, every finite linear combination Y of the T_f has the moments of `N(0, E[Y²])`, hence `E[cosh(aY)] = e^{a²E[Y²]/2} < ∞`, so its law is the Gaussian one by `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`, and the joint law is Gaussian by `ProbabilityTheory.IsGaussian` (one-dimensional projections) and `MeasureTheory.Measure.ext_of_charFun`.

*Needs:* 6.2; 6.3; StandardDistributions §5.3; Tau Ceti `TauCeti.Probability.integrable_prod_pow_sub_multivariateGaussian`, `TauCeti.Probability.integral_prod_sub_multivariateGaussian_eq_zero_of_odd`, `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`, `TauCeti.PerfectMatching`; Mathlib `ProbabilityTheory.IsGaussian`, `MeasureTheory.Measure.ext_of_charFun`.

**Checks.**

- n = 2, f_i = f: Wick's law gives `M_4(f, f, f, f) = 3M_2(f, f)²`, the Gaussian fourth moment `3v²` (`TauCeti.Probability.centralMoment_id_two_mul_gaussianReal`).
- The centred non-Gaussian field `T_f = ε∫fh` with ε a fair random sign has `M_4 = (∫fh)⁴ ≠ 3(∫fh)⁴` for ∫fh ≠ 0, and Wick's law fails.
- Centring is needed: the Gaussian field `T_f = ∫fh + W_f` (W white noise, h ≠ 0) is a generalised Gaussian process, but `M_1(f) = ∫fh ≠ 0` violates Wick's law as stated.

### Examples

White noise, the deterministic fields, the random-sign field and the Gaussian free field of 7.4 are the running examples.

### Dependencies

StochasticCalculus §1.1; StandardDistributions §5.3; Mathlib `CompactlySupportedContinuousMap`, `ProbabilityTheory.map_eq_iff_forall_finset_map_restrict_eq`, `MeasureTheory.IsProjectiveMeasureFamily`, `MeasureTheory.IsProjectiveLimit.unique`, `ae_eq_zero_of_integral_contDiff_smul_eq_zero`, `ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.measurePreserving_restrict₂_multivariateGaussian`, `ProbabilityTheory.IsGaussianProcess`, `ProbabilityTheory.IsGaussian`, `MeasureTheory.Measure.ext_of_charFun`; Tau Ceti `TauCeti.Probability.integrable_prod_pow_sub_multivariateGaussian`, `TauCeti.Probability.integral_prod_sub_multivariateGaussian_eq_zero_of_odd`, `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`, `TauCeti.PerfectMatching` (6.4). Independent of Layers 0–5.

## Layer 7: Reachable random fields

### 7.1 The rescaled lattice field

Define, for L ≥ 1, a function f : ℝ^d → ℝ, a box V = V_R ⊂ ℤ^d, Σ ≥ 0 and φ ∈ ℝ^V, the rescaled lattice field `T_{f,L,Σ}(φ) = Σ^{−1/2} Σ_{x∈V} f(x/L) φ_x` (`rescaledField`, evaluated on configurations of `ℝ^{ℤ^d}` of which only the coordinates in V_R enter), and, for a stable triple with every coordinate square integrable under its Gibbs law, the finite block second moment `Σ^{(R)}_L(ρ, J) = ⟨(Σ_{x∈Λ_L} φ_x)²⟩_{V_R,J,ρ} < ∞` for R ≥ L (`blockSecondMoment`, a variance for even ρ) (Aizenman–Duminil-Copin (1.14)–(1.15), p. 4). Only boxes occur in the reachability schemes of 7.2, and every box is W_d-invariant.

The API consists of the following facts.

- T is linear in f and in φ, and depends on f only through its values on `L⁻¹V`.
- For g ∈ W_d and a g-invariant V, `T_{f∘g,L,Σ}(φ) = T_{f,L,Σ}(φ ∘ g⁻¹)`; equivalently `T_{f,L,Σ}(φ ∘ g) = T_{f∘g⁻¹,L,Σ}(φ)`.
- Second-moment identity, assuming stability and integrable coordinate squares (it is a covariance identity for even ρ): `⟨T_{f,L,Σ} T_{g,L,Σ}⟩_{V,J,ρ} = Σ⁻¹ Σ_{x,y∈V} f(x/L) g(y/L) ⟨φ_xφ_y⟩`.
- Under the same moment hypothesis, for R ≥ L and `Σ = Σ^{(R)}_L > 0`, the field of the indicator of Q has second moment 1: `⟨T_{1_Q,L,Σ}²⟩_{V_R} = 1`.
- For even admissible ρ and ferromagnetic J, `Σ^{(R)}_L` is non-decreasing in R (3.2) and is zero only for ρ = δ₀.

*Needs:* 1.1; 1.2; for the monotonicity of the block second moment in R, 3.2.

**Checks.**

- J = 0, ρ = ρ_I, f ∈ C_c(ℝ^d): `Σ^{(R)}_L = (2L + 1)^d` and `⟨T_{f,L}²⟩_{V_R} = Σ_{x∈V_R} f(x/L)²/(2L + 1)^d`. As L → ∞ with R = R(L) ≥ L chosen so that `V_{R(L)}` eventually contains every x ∈ ℤ^d with x/L ∈ supp f (for instance R(L)/L → ∞), this tends to `2^{−d} ∫ f²`, the white-noise normalisation; the volume-first limit of 7.2 gives the same value.
- The volume condition is needed: d = 1, R = L and the tent `f(u) = max(0, 1 − |u − 3|)` sample only x/L ∈ [−1, 1], where f vanishes, so the second moment is 0 for every L, whereas `½∫f² = 1/3`. With R = 4L the sampled sum is `(2L² + 1)/(3L)` and the normalised second moment `(2L² + 1)/(3L(2L + 1)) → 1/3`.
- d = 1, L = R = 1, nearest-neighbour Ising with t = tanh J: `Σ^{(1)}_1 = 3 + 4t + 2t²` (open chain of three sites).
- ρ = δ₀: Σ = 0 and T ≡ 0 by the junk convention of the Conventions.
- The direction of the W_d action: d = 2, L = 1, Σ = 1, `V = V_1` (nine points, among them 0, ±e₁, ±e₂), g the rotation `(x₁, x₂) ↦ (−x₂, x₁)` (of order 4, so g ≠ g⁻¹) and `f = 1_{e₁}` on V. Then `T_{f∘g}(φ) = φ_{g⁻¹e₁} = φ_{−e₂}`, which agrees with `T_f(φ ∘ g⁻¹) = φ_{−e₂}`; the identity with g on both sides would give `T_f(φ ∘ g) = φ_{ge₁} = φ_{e₂}`, which differs for `φ = 1_{e₂}`. The two identities cannot be separated when g² = id; the quarter-turn and the selected f and φ separate them. For the half-turn g = −I, `f = 1_{e₁}` and `φ = 1_{−e₁}`, both candidate right sides and the left side are 1.

### 7.2 Reachability

Define, for d ≥ 1 and a set 𝒞 of single-site measures, a reachability scheme as sequences ρ_n ∈ 𝒞, J_n ≥ 0, L_n ≥ 1 with L_n → ∞, and `R_{n,k} ≥ L_n` with `R_{n,k} → ∞` as k → ∞ for each n, such that each triple `(V_{R_{n,k}}, J_n · nearest-neighbour, ρ_n)` is stable and every coordinate square is integrable under its Gibbs law (`ReachabilityScheme`, which records stability as the box Gibbs measure being a probability measure); write `μ_{n,k}` for its Gibbs measure, `0 ≤ Σ_{n,k} = Σ^{(R_{n,k})}_{L_n}(ρ_n, J_n) < ∞` and `T^{n,k}_f = T_{f,L_n,Σ_{n,k}}` on `V_{R_{n,k}}`. The class 𝒞 is a set of measures on ℝ (a set of `MeasureTheory.Measure ℝ` in `ReachabilityScheme`); the Griffiths–Simon class of 2.2, a set of `MeasureTheory.ProbabilityMeasure ℝ`, enters as its image under the coercion of probability measures to measures, and this image is what "𝒞 the Griffiths–Simon class" means in 8.2. The scheme converges (`ReachabilityScheme.Converges`) if for every finite F ⊆ C_c(ℝ^d) the law of `(T^{n,k}_f)_{f∈F}` under `μ_{n,k}` (`ReachabilityScheme.fieldLaw`) converges weakly as k → ∞ to a law ν^n_F, and ν^n_F converges weakly as n → ∞ to a law ν_F (`ReachabilityScheme.HasLimitLaw`, weak convergence being convergence of the integrals of bounded continuous functions). A random field is 𝒞-reachable if its finite-dimensional laws are the ν_F of a convergent scheme (Aizenman–Duminil-Copin, Definition 1.1 and footnote 2, p. 4). The free boundary conditions on V_R and the order of the limits (volume first, then scale) are those of the source; the volumes `R_{n,k}` may be chosen along subsequences.

The API consists of the following facts.

- Reachability is monotone in 𝒞.
- For admissible members of 𝒞 both stability and coordinate-square integrability are automatic (1.1–1.2); for the Gaussian measures γ_b both follow from the positive-definiteness condition of 1.5, which for `b ≤ −d·J_n` holds on every box.

*Needs:* 1.1; 6.1; 7.1; Mathlib `MeasureTheory.ProbabilityMeasure`; for the automatic stability and integrability, 1.2 (admissible moments) and 1.5 (Gaussian measures).

**Checks.**

- ρ_n = ρ_I, J_n = 0: by the central limit theorem and the Riemann sums of 7.1, white noise with covariance `2^{−d} ∫ fg` is {ρ_I}-reachable.
- 𝒞 = {δ₀}: the only reachable field is the zero field.
- At J = 0 with N block sites, Ising has Σ = N, a centred Gaussian of variance v has Σ = Nv, and δ₀ has Σ = 0 and gives the zero field. The standard Cauchy law also has Z = 1, but its N-spin sum is Cauchy of scale N with infinite second moment, so it fails the scheme hypothesis.
- d = 1, ρ_n = ρ_I and `tanh J_n = e^{−c/L_n}`: the rescaled chain converges to the random telegraph process X with `E[X_uX_v] = e^{−c|u−v|}`, and `T_f = κ^{−1/2} ∫ f(u)X_u du` with `κ = ∫∫_{Q²} e^{−c|u−v|}` is {ρ_I}-reachable, bounded and hence not Gaussian.

### 7.3 Structure of reachable fields

Prove that every convergent reachability scheme has a reachable random field, unique up to finite-dimensional distributions (Aizenman–Duminil-Copin, the paragraph after Definition 1.1 and footnote 2, p. 4; `exists_reachableField`, which states all the assertions of this subsection for the coordinate process on `ℝ^{C_c(ℝ^d)}`): the limit laws ν_F are projective, since restriction is continuous and commutes with weak limits, and linear, since `T^{n,k}_{af+bg} = aT^{n,k}_f + bT^{n,k}_g` exactly and the subspaces are closed (6.1). Prove that if 𝒞 consists of even measures then every 𝒞-reachable field Φ has the same law as −Φ, and every odd moment that exists vanishes; that every 𝒞-reachable field is invariant under W_d, `(T_{f∘g}(Φ))_f` having the same law as Φ for g ∈ W_d (the linear isometries of ℝ^d that map ℤ^d into itself, whose matrices are the orthogonal integer matrices, that is, the signed permutation matrices); and that `E[T_f(Φ)²] ≤ liminf_n liminf_k ⟨(T^{n,k}_f)²⟩_{μ_{n,k}}` (stated in this form by this roadmap: every box Gibbs measure of a scheme is W_d-invariant, and flip-invariant when 𝒞 consists of even measures (1.2), these invariances pass to the field laws (T is linear in φ and satisfies the W_d identity of 7.1) and to their weak limits, and `ν ↦ ∫ v² dν` is lower semicontinuous under weak convergence, applied once as k → ∞ and once as n → ∞; compare Sokal, Lemma 2.2, p. 337, where rescaled φ⁴ lattice measures obeying a bound by a fixed Schwartz-space norm, uniform along the sequence, have a limit along a subsequence on the space of tempered distributions).

*Needs:* 1.2; 6.1; 7.1; 7.2; Mathlib `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`.

**Checks.**

- d = 1: W_1 = {±1} and the invariance says `T_{f(−·)}(Φ)` has the law of `T_f(Φ)`; for the telegraph field of 7.2 this is reversibility of the stationary chain.
- Evenness is needed: for 𝒞 = {(δ₀ + δ₁)/2} and J_n = 0, `Σ_L ≈ |Λ_L|²/4`, so `E[T_{f,L}] → 2^{−d} ∫ f` and `Var T_{f,L} → 0`; the reachable field is the deterministic field `T_f = 2^{−d} ∫ f`, whose law is not that of −Φ.
- The variance bound can be strict: for 𝒞 the even admissible measures, with J_n = 0 and `ρ_n = (1 − p_n)ρ_I + ½p_n(δ_{a_n} + δ_{−a_n})`, where `p_n = |Λ_{L_n}|^{−2}` and `a_n² = 1/p_n` (bounded support, so admissible and even), the lattice variances of T_f tend to `2^{−d}∫f²` while the reachable field is Gaussian with variance `2^{−d−1}∫f²`, because with probability tending to one no site of the block carries the value ±a_n.

### 7.4 The Gaussian free field as a reachable field

Define, for m ≥ 0, the covariance `C_m(f, g) = ∫ conj(𝓕f(ξ)) 𝓕g(ξ)/(4π²|ξ|² + m²) dξ` on C_c(ℝ^d) (`gffCovariance`, the real part of the integral, which is real), finite and positive semidefinite for m > 0 in every dimension and for m = 0 when d ≥ 3, and also evaluate this same Fourier integral at the block indicator `1_Q ∈ L¹ ∩ L²`. Define the Gaussian free field of mass m as the centred Gaussian random field with covariance `C_m(f, g)/C_m(1_Q, 1_Q)` (6.3). The covariance has the following API.

- C_m is symmetric, positive semidefinite and finite on C_c(ℝ^d) in the stated range of (d, m), and is non-increasing in m in quadratic-form order: `C_{m₂}(f, f) ≤ C_{m₁}(f, f)` for m₂ ≥ m₁ in the permitted range.
- Using the analytic Green-kernel facts of RelativisticQuantumFieldTheory §7.1 and §7.3, prove for m > 0 that `C_m(f, g) = ∫∫ f(x) G_m(x − y) g(y) dx dy` with `G_m` the inverse Fourier transform of `1/(4π²|ξ|² + m²)`, a positive, radial, locally integrable function decaying exponentially; for m = 0 and d ≥ 3, `G_0(x) = Γ(d/2 − 1)/(4π^{d/2}|x|^{d−2})` for x ≠ 0. Values at the single point 0 do not affect the integral.
- `0 < C_m(1_Q, 1_Q) < ∞`, and C_m is invariant under the Euclidean motions of ℝ^d acting on test functions.

Prove that for d ≥ 1 and m > 0, and for d ≥ 3 and m = 0, the Gaussian free field of mass m is reachable from the Gaussian class {γ_b : b < 0}, with `J_n = 1`, `b_n = −(d + m²/(2L_n²))`, and arbitrary L_n → ∞ and `R_{n,k} ≥ L_n` with `R_{n,k} → ∞` as k → ∞ (`gff_reachable`, which states the convergence of the finite-dimensional laws directly: for every finite family (f_i) in C_c(ℝ^d), the laws of `(T^{n,k}_{f_i})_i` converge weakly as k → ∞ to laws ν_n, and ν_n converges weakly to `ProbabilityTheory.multivariateGaussian 0 (C_m(f_i, f_j)/C_m(1_Q, 1_Q))_{i,j}`; the statement in this form, with the block normalisation of 7.1, is this roadmap's; Fröhlich, the paragraph after (33), p. 13, for the two-point function of the free lattice field, expressed through the finite-difference Laplacian; Sokal, Section 2.3 and Lemma 2.2, pp. 334–337, for the rescaling of lattice measures to a continuum field, stated there for φ⁴ lattice measures and with a limit along a subsequence; Simon, Twelve Tales, Section 3, pp. 23–24, for the free lattice field as a nearest-neighbour ferromagnet with Gaussian single-site measure, written there formally on ℤ² and with another normalisation of the mass term; Glimm–Jaffe, Chapter 6). A proof route: the laws of `(T^{n,k}_f)_f` are centred Gaussian (1.5); as R → ∞ their covariances converge to `Σ_L⁻¹ Σ_{x,y} f(x/L)g(y/L) G_{m/L}(x − y)`, with `G_μ` of 1.5 and `Σ_L = Σ_{x,y∈Λ_L} G_{m/L}(x − y)` the limit of the non-decreasing block variances; after the substitution p = q/L, `L^{−(d+2)} Σ_{x,y} f(x/L) g(y/L) G_{m/L}(x − y) = (2π)^{−d} ∫_{[−πL,πL]^d} conj(F_L(q)) H_L(q) / (L²E(q/L) + m²) dq`, with `F_L(q) = L^{−d}Σ_x f(x/L)e^{−iq·x/L}` and H_L likewise for g, converging to `C_m(f, g)` by dominated convergence (`L²E(q/L) ≥ (4/π²)|q|²` on the domain, Parseval for F_L and H_L); the same holds for `1_Q`, whose transforms are products of Dirichlet kernels; convergence of covariances gives convergence of the Gaussian laws.

*Needs:* 6.3; Mathlib `Real.fourier_eq`; for the kernel representation, RelativisticQuantumFieldTheory §7.1 (analytic continuum Green kernels, Fourier agreement and decay) and, for m = 0, §7.3 (the massless limit in d ≥ 3); for the reachability, 1.5, 7.2, 7.3 and Mathlib `ProbabilityTheory.charFun_multivariateGaussian`, `MeasureTheory.ProbabilityMeasure.tendsto_iff_tendsto_charFun`.

**Checks.**

- The imported Fourier normalization gives multiplier 1 at m = 1, ξ = 0, and `G_1(1) = e⁻¹/2` in d = 1. Here `C_m(f, g) = ∫∫ f(x) e^{−m|x−y|}/(2m) g(y) dx dy` and `C_m(1_Q, 1_Q) = 2/m² − (1 − e^{−2m})/m³`, which is `1 + e⁻²` at m = 1 and tends to infinity like 2/m as m → 0: no massless field in d = 1. Quadratic-form monotonicity gives `C_2(f, f) ≤ C_1(f, f)`; for g = −f the inequality on cross terms reverses, so it is not an order on every pair (f, g).
- The lattice normalisation is exact before the limit: `⟨(T^{n,k}_{1_Q})²⟩ = 1` for every n and k (7.1).
- In d = 4 the Green function `G_m(x)` behaves like `1/(4π²|x|²)` near 0, locally integrable on ℝ⁴, so the field has a two-point Schwinger function satisfying (1.10) (exponential decay for m > 0, `|x|^{−2}` decay for m = 0); it is a non-vacuous instance of the field hypotheses of downstream goal 8.1, reached from Gaussian rather than φ⁴ single-site measures.

### Examples

White noise (from independent spins), the random telegraph field (from the one-dimensional Ising chain near zero temperature) and the Gaussian free field (from Gaussian lattice fields) are the worked examples of reachable fields; the first has no two-point Schwinger function, the second is non-Gaussian in d = 1, and the third is Gaussian in every dimension.

### Dependencies

Layers 1, 3 (through 3.2) and 6; RelativisticQuantumFieldTheory §7.1 and §7.3; Mathlib `MeasureTheory.ProbabilityMeasure`, `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`, `MeasureTheory.ProbabilityMeasure.tendsto_iff_tendsto_charFun`, `Real.fourier_eq`, `ProbabilityTheory.charFun_multivariateGaussian`.

## Downstream consumers

- **ConstructiveFieldTheoryPhi4PartII** owns the two marginal-triviality goals 8.1 and 8.2 below. It consumes the random current representation and switching lemma (3.4), the Lebowitz, Gaussian and Simon–Lieb inequalities for the full Griffiths–Simon class (3.5), the uniform moment bounds (3.7), the free-boundary state, two-point function, susceptibility and critical point (Layer 4), the axis monotonicity (4.4), the torus infrared bound and reflection positivity (Layer 5), Wick's law (6.4) and reachable fields (Layer 7), and owns the additional current intersection estimates, tree diagram and improved tree diagram bounds, spectral representation, identification of boundary conditions below the critical point, infinite-volume and sliding-scale infrared bounds and uniform local integrability of rescaled two-point functions needed for those proofs.
- **ConstructiveFieldTheoryPhi4PartII** also owns the application of reachable-field Schwinger functions to Osterwalder–Schrader reconstruction, consuming the covariance comparison of 7.4 and the reconstruction theorem of RelativisticQuantumFieldTheory.
- **Ising-type statistical mechanics** (phase transitions by the Peierls argument, Lee–Yang theory beyond the theorem of 2.1, sharpness of the phase transition) builds on Layers 1, 3, 4 and 5.

This roadmap ends with Layer 7. The two statements below, numbered 8.1 and 8.2, are the goals of ConstructiveFieldTheoryPhi4PartII, stated with their sources so that the hypotheses Layers 0, 2, 4, 6 and 7 must serve are visible; they are not targets of this roadmap.

### 8.1 Gaussianity of reachable φ⁴ and Ising fields in d ≥ 4

ConstructiveFieldTheoryPhi4PartII proves: for d ≥ 4, let 𝒞 consist of the φ⁴ measures `ρ_{λ,b}` (λ > 0, b ∈ ℝ) and the Ising measure ρ_I, and let `J^{nn}` be the nearest-neighbour coupling of strength 1 on ℤ^d. Every random field reachable from 𝒞 by a convergent scheme of 7.2 with `J_n ≤ β_c(ρ_n, J^{nn})` for every n, where β_c is the critical point of 4.3 (defined because every member of 𝒞 is even and admissible, 0.2), and that has a two-point Schwinger function S_2 satisfying the decay condition (1.10), is a generalised Gaussian process (Aizenman–Duminil-Copin, Theorem 1.2, p. 5, with (1.10), p. 3, for d = 4; for d ≥ 5, Aizenman–Duminil-Copin, the sentence of (1.10), p. 3, citing Aizenman 1982 and Fröhlich 1982, whose main statement is Fröhlich (13), p. 5). The four-dimensional estimates behind the statement (Aizenman–Duminil-Copin, Proposition 1.4, p. 7, and Proposition 7.2, p. 45) are proved for β ≤ β_c and for scales L at most the correlation length ξ(β) of (1.19), p. 6; the results for d ≥ 5 concern scaling limits taken at β ≤ β_c (Aizenman–Duminil-Copin, the sentence of (1.10), p. 3), in Fröhlich's version under vanishing long-range order (Fröhlich, the sentence after (7), p. 4, and the sentence of (13), p. 5). Schemes with couplings above the critical point are not part of the statement; scales L_n beyond the correlation length are, and their treatment is part of the proof that ConstructiveFieldTheoryPhi4PartII owns. By 7.3 such a field is symmetric, so it is centred, and by 6.4 its Schwinger functions are `G_n[S_2]`.

**Checks.**

- The dimension hypothesis cannot be dropped: in d = 1 the random telegraph field of 7.2 is reached from {ρ_I} with couplings below `β_c(ρ_I, J^{nn}) = ∞` (4.3: `χ = (1 + t)/(1 − t) < ∞` for every J), has `S_2(u, v) = e^{−c|u−v|}/κ` satisfying (1.10), and is bounded, hence not Gaussian.
- The Schwinger-function hypothesis excludes white noise (reachable with J_n = 0 ≤ β_c, 7.2), which has no two-point Schwinger function (6.2); white noise is Gaussian, so it is not a counterexample, but it shows that "S_2 is a function" is a genuine restriction.
- The coupling inequality is not strict: the critical schemes `J_n = β_c(ρ_n, J^{nn})` are included, as the source stresses for the critical Ising model (Aizenman–Duminil-Copin, the sentence after (1.20), p. 6), and for the Ising model the correlation length at the critical point is infinite (the sentence after (1.19), p. 6), so every scale L_n lies within it; a strict inequality would leave them out. A scheme with some J_n above `β_c(ρ_n, J^{nn})` is outside the statement, and nothing is asserted about its limits.
- The Gaussian free field in d = 4 (7.4) has single-site measures `γ_{b_n}` outside 𝒞, and is Gaussian, consistent with the statement. 4.3 does not apply to γ_b, which is not admissible, but the scheme satisfies the Gaussian form of the coupling hypothesis: the Gaussian lattice field of 1.5 with single-site measure `γ_{b_n}`, `|b_n| = d + m²/(2L_n²)`, and coupling `βJ^{nn}` has the box covariances `(2|b_n| I − βA_R)⁻¹` and infinite-volume susceptibility `1/(2(|b_n| − dβ))`, finite exactly for `β < |b_n|/d = 1 + m²/(2dL_n²)`; at `β = J_n = 1` it is `L_n²/m²`, the symbol `1/(E(p) + μ²)` of `G_μ` at p = 0 with μ = m/L_n. So `J_n = 1` lies below the Gaussian critical coupling for m > 0 and at it for m = 0.

### 8.2 The Griffiths–Simon extension

ConstructiveFieldTheoryPhi4PartII proves: for d ≥ 4 and 𝒞 the Griffiths–Simon class of 2.2, read as a set of measures as in 7.2, every random field reachable from 𝒞 by a convergent scheme of 7.2 with `J_n ≤ β_c(ρ_n, J^{nn})` for every n (4.3, with `J^{nn}` as in 8.1; every member of the class is even and admissible, 2.2), and that has a two-point Schwinger function satisfying (1.10), is a generalised Gaussian process (Aizenman–Duminil-Copin, the first paragraph of Section 7, p. 44, Theorem 7.1 and Proposition 7.2, p. 45, for d = 4; Aizenman 1982 for d ≥ 5). Theorem 7.1 and Proposition 7.2 are proved for β ≤ β_c(ρ) and L ≤ ξ(ρ, β), as their statements on p. 45 say; as in 8.1, schemes with couplings above the critical point are not part of the statement, and the treatment of scales beyond the correlation length is part of the proof. The class of 2.2 uses the limit-growth condition of Aizenman–Duminil-Copin's Definition 2.1 with nonnegative block weights.

**Checks.**

- 8.2 implies 8.1: ρ_I and every φ⁴ measure lie in the Griffiths–Simon class (2.2, 2.3), and a convergent scheme with single-site measures in the smaller class and `J_n ≤ β_c(ρ_n, J^{nn})` is such a scheme for the larger class, because the coupling condition involves only ρ_n and J_n (reachability is monotone in 𝒞, 7.2).
- The telegraph counterexample of 8.1 applies here as well, since ρ_I is in the class and `β_c(ρ_I, J^{nn}) = ∞` in d = 1.
- δ₀ is in the class (2.2) with `β_c(δ₀, J^{nn}) = ∞` (4.3), so every scheme from {δ₀} satisfies the coupling hypothesis; its only reachable field is the zero field (7.2), whose S_2 ≡ 0 satisfies (1.10) and whose finite-dimensional laws are Dirac measures at 0, Gaussian of variance 0 in Mathlib's sense, consistent with the statement.
- The Gaussian measures γ_b are not in the class, so the reachability of the Gaussian free field (7.4) is not an instance of 8.2.

## References

- [aizenman-duminilcopin-2021] M. Aizenman and H. Duminil-Copin, *Marginal triviality of the scaling limits of critical 4D Ising and φ⁴₄ models*, Ann. of Math. 194 (2021), read as arXiv:1912.07973v4, whose page numbers are cited: Definition 1.1, Theorem 1.2, Proposition 1.4, (1.4)–(1.21), Definition 2.1 with (2.1)–(2.4) and Figure 1, Definitions 3.1–3.2, (3.1)–(3.9), Lemma 3.3, (3.11), Section 5 ((5.1)–(5.10), Proposition 5.1, Lemma 5.7 and footnote 5, (5.23)), Section 7 (Section 7.1, Theorem 7.1, Proposition 7.2).
- [sokal-1982] A. D. Sokal, *An alternate constructive approach to the φ⁴₃ quantum field theory, and a possible destructive approach to φ⁴₄*, Ann. Inst. H. Poincaré A 37 (1982), 317–398, cited by its printed page numbers: Section 2.2 ((2.17) and footnote 2, properties (a)–(l) with (2.18)–(2.30), (2.33)), Proposition 2.1, Section 2.3 and Lemma 2.2, Section 3.1 ((3.4)–(3.5)).
- [peled-spinka-2017] R. Peled and Y. Spinka, *Lectures on the spin and loop O(n) models*, arXiv:1708.00058v3, whose page numbers are cited: Theorems 2.1, 2.3, 2.13, Lemma 2.4, Section 2.7 (Propositions 2.14–2.16, (43)–(53)).
- [simon-2020-twelve-tales] B. Simon, *Twelve tales in mathematical physics*, arXiv:2011.12335v2, whose page numbers are cited: Section 3 (pp. 23–25), Section 5 ((5.14)–(5.22)).
- [frohlich-1982] J. Fröhlich, *On the triviality of λφ⁴_d theories and the approach to the critical point in d ≥ 4 dimensions*, Nucl. Phys. B 200 (1982), read as IHES preprint P/81/41, whose page and equation numbers are cited: (7), (12) and (13) on pp. 4–5, and the free lattice field after (33) on p. 13.
- [duminilcopin-2017-lectures] H. Duminil-Copin, *Lectures on the Ising and Potts models on the hypercubic lattice*, arXiv:1707.00520v1: Corollary 1.9 (p. 14).
- [lebowitz-ruelle-speer-2012] J. L. Lebowitz, D. Ruelle and E. R. Speer, *Location of the Lee–Yang zeros and absence of phase transitions in some Ising spin systems*, J. Math. Phys. 53 (2012), read as arXiv:1204.0558v2: Section 1 (the Lee–Yang theorem for ferromagnetic pair interactions), Lemma 2.4 (Asano–Ruelle contraction).
- [griffiths-simon-1973] R. B. Griffiths and B. Simon, *The (φ⁴)₂ field theory as a classical Ising model*, Comm. Math. Phys. 33 (1973), 145–164 (cited by locator).
- [aizenman-1982] M. Aizenman, *Geometric analysis of φ⁴ fields and Ising models, Parts I and II*, Comm. Math. Phys. 86 (1982), 1–48 (cited by locator).
- [frohlich-simon-spencer-1976] J. Fröhlich, B. Simon and T. Spencer, *Infrared bounds, phase transitions and continuous symmetry breaking*, Comm. Math. Phys. 50 (1976), 79–95, Theorem 1 (cited by locator).
- [glimm-jaffe-1987] J. Glimm and A. Jaffe, *Quantum Physics: A Functional Integral Point of View*, 2nd ed., 1987, Chapters 4 and 6 (cited by locator).
- [fernandez-frohlich-sokal-1992] R. Fernández, J. Fröhlich and A. D. Sokal, *Random Walks, Critical Phenomena, and Triviality in Quantum Field Theory*, 1992, Part I (cited by locator).
- [friedli-velenik-2017] S. Friedli and Y. Velenik, *Statistical Mechanics of Lattice Systems: A Concrete Mathematical Introduction*, 2017, Section 3.6 and Chapter 10 (cited by locator).
- [simon-1974] B. Simon, *The P(φ)₂ Euclidean (Quantum) Field Theory*, 1974, Chapter I (cited by locator).
