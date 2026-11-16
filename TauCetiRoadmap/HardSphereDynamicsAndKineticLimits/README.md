# Roadmap: hard-sphere dynamics and kinetic limits

**Summary.** Build the microscopic model of classical kinetic theory: finitely many hard spheres of diameter ε in a flat position space (Euclidean space ℝᵈ or a flat torus ℝᵈ/L), their elastic scattering law, their trajectories, and the almost-everywhere defined hard-sphere flow. The core theorem is Alexander's theorem for finitely many particles: outside a Lebesgue-null set every configuration has a global trajectory with only binary, non-grazing collisions, finitely many in bounded time, and the resulting maps form a measure-preserving group. On this flow the roadmap builds the transport of densities and the weak Liouville equation with specular reflection, marginals and correlation functions, the canonical and grand canonical equilibrium ensembles with their invariance, and the hard-sphere Boltzmann collision operator. It states Lanford's theorem on the Boltzmann–Grad limit as a proposition, whose proof for `d ≥ 2` is not part of this roadmap, and proves here its law-of-large-numbers consequence: convergence of the first two correlation functions forces the rescaled empirical measure, tested against bounded continuous functions, to converge in probability to the Boltzmann solution. Everything rests on Mathlib's Lebesgue change of variables, lattice quotients and Gaussian integrals, on Tau Ceti's Gaussian densities, successive minima of lattices, strongly continuous groups and empirical measures, and on the flows defined almost everywhere of ClassicalErgodicTheory §3.5.

## Scope and ownership

This roadmap owns: flat position spaces as quotients of Euclidean space carrying a local isometry and a local measure isomorphism; the flat torus ℝᵈ/L with its Euclidean quotient norm and Haar measure; the specular scattering map and the pre/post-collisional change of variables; the hard-core phase spaces, contacts, contact normals and boundary pieces; the two-body problem (relative motion outside a ball) with its collision map and Jacobian; hard-sphere trajectories, their uniqueness and symmetries; Alexander's theorem for finitely many particles; the hard-sphere flow, its Koopman group and the grand canonical phase space; transported densities, the weak Liouville equation with specular reflection and marginals; Maxwellians, canonical and grand canonical measures, their invariance, correlation functions and initial chaos; the rescaled empirical measure, the hard-sphere Boltzmann collision operator, mild solutions of the Boltzmann equation, the statement of Lanford's theorem and its law of large numbers.

Already in the library and consumed, not restated: Lebesgue change of variables for injective differentiable maps, Haar measure on quotients by a lattice and fundamental domains, quotient norms, polar coordinates and the surface measure `MeasureTheory.Measure.toSphere`, Gaussian integrals, `ProbabilityTheory.poissonMeasure`, composition operators on `Lp` (Mathlib); the multivariate Gaussian density, the successive minima of a lattice, strongly continuous one-parameter groups and the empirical measure of a finite family, the empty family included (Tau Ceti). The multivariate Gaussian density is the material of StandardDistributions, Layer 5, and the strongly continuous group is the material of OneParameterSemigroups; both are cited here through their pinned Tau Ceti declarations.

Left to other roadmaps. The proof of Lanford's theorem (the BBGKY and Boltzmann hierarchies, their Cauchy problems and term-by-term convergence) belongs to a roadmap on the BBGKY hierarchy (Downstream consumers), whose end theorem is the proposition `HardSphere.LanfordStatement d` of §10.4 for every `d ≥ 2`; the proposition is defined for every `d` and is false for `d = 0` (Checks of §10.4). The Cauchy problem for the Boltzmann equation, the H theorem and the converse characterisation of collision invariants belong to a roadmap on the Boltzmann equation, which consumes §10.2–10.3. Fluctuations and large deviations of the empirical measure, long-time derivations, infinite hard-sphere systems, short-range potentials, uniform bounds on the number of collisions, and ergodicity of hard-sphere systems belong to the roadmaps listed under Downstream consumers. Point processes on unlabelled point measures (densities against a Poisson process, Janossy measures, Papangelou intensities) are not used: the grand canonical measure here lives on labelled configurations, where the flow acts, and every statement about it is made there. RandomMatrices §8.1 defines the `k`-point correlation function of the eigenvalue counts of a random matrix by their factorial moments on pairwise disjoint sets; for `h` a product of indicators of pairwise disjoint sets the identity of §9.5 is that factorial-moment identity for the particle counts at time `t`, with `μ^n F_n(t)` as the `n`-point correlation function relative to `(μ_X ⊗ vol)^{⊗n}`. §9.5 keeps its own definition, since `F_n(t)` is a function on labelled phase space transported by the flow and carries the `μ^{−n}` rescaling of the Boltzmann–Grad limit, and RandomMatrices §8.1 is stated for eigenvalue counts, so it is not consumed. Complex tori as complex Lie groups are owned by ComplexTori; the real flat torus here carries a metric and a measure, not a complex structure. MathematicalBilliards §10.5 gives `ℂ/Λ` its translation-surface atlas and directional flows, while §1.3 here gives `E ⧸ L`, in every dimension `d`, its Euclidean quotient norm and its Haar measure of total mass `ZLattice.covolume L` (for `d = 2` this mass is the flat area of MathematicalBilliards §10.3, `4` for `2ℤ + 2iℤ`); neither roadmap restates the other's structure. Smooth Hamiltonian flows and Liouville's theorem for smooth vector fields are not used: free transport is a shear, and the measure preservation of the hard-sphere flow is proved directly from the two-body Jacobian.

Flows defined off a null set in general (a measurable flow on a conull carrier extended by the identity, countable disjoint unions of such flows with the sum measure, the transport of densities, point realisation) are ClassicalErgodicTheory §3.5. This roadmap constructs the conull carrier `G`, the trajectory action on it and its measure preservation (Layers 5–7), which are what §3.5 takes as input, and consumes §3.5 items 1, 3 and 4 in §7.2, §7.5, §8.1 and §9.4. Ergodic properties of the flow are not part of this roadmap. The strong continuity of the Koopman group (§7.4) is a target here and not a citation: ClassicalErgodicTheory §0.2 assumes a finite invariant measure and MathematicalBilliards §12.3 a probability space, while `λ_N|𝒟̄` has total mass `q_N · ∞`, infinite already for `N = d = 1` on the unit circle; ProbabilisticAndMetricNumberTheory §4.9a (`scalarLpKoopman_strong`, on complex `Lp`) allows an infinite, locally finite measure but assumes a jointly continuous action, which the hard-sphere flow on `E` is not for any `d ≥ 1` and `N ≥ 2`: for d = 2 and ε = 1 (in other dimensions along `e_1`), with the other particles at rest far away, the head-on state of the Conventions (`x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`) has `v_1 = 0` at time 1, while the nearby states with `x_1 = (2 + η, 0)`, η > 0, collide at time `1 + η` and still have `v_1 = (−1, 0)` at time 1. For `N = 1` the flow is free transport, a continuous action, and §7.4 is the real-scalar counterpart of that statement.

Uniqueness of weak solutions of the Liouville equation with specular reflection is not part of this roadmap: the transported density is characterised by its Lagrangian identity (§8.1), which is what every consumer uses.

## Conventions

- **Dimension and spaces.** `d ≥ 1` in the computations of this README (the sphere `S^{d−1}`, the constants `ω_{d−1}`); the definitions of `Suggested.lean` and its theorems other than `HardSphere.boltzmannGrad_scaling` (which assumes `d ≥ 1`) and `HardSphere.LanfordStatement.tendsto_empirical` (which assumes `d ≥ 2`) carry no hypothesis on `d`: for `d = 0` the space `E` and every flat position space are points, no two particles of positive diameter fit, and those theorems hold trivially. For `d ≥ 2` the proposition of §10.4 is BGSS2023 Theorem 1, the grand canonical form on the torus of Lanford's theorem, restricted to continuous data (§10.4); it is false for `d = 0` (Checks of §10.4). `E = EuclideanSpace ℝ (Fin d)` with its inner product `⟨·,·⟩`, norm `|·|` and Lebesgue measure `vol`. A position space is a type `X` with an instance of the class of §1.1; its cover is `π : E → X`, its injectivity radius `ρ ∈ (0, ∞]` (an element of `ℝ≥0∞`), and its measure `μ_X = volume`. The one-particle phase space is `X × E` with measure `μ_X ⊗ vol`; the `N`-particle phase space is `Fin N → X × E` with the product measure `λ_N = volume`. Write a configuration as `Z = (X, V)` with positions `x_i` and velocities `v_i`.
- **Diameter.** ε is the diameter: particles `i ≠ j` are in contact when `‖x_i − x_j‖ = ε`. Every dynamical statement assumes `0 < ε < ρ`, written `ENNReal.ofReal ε < ρ` since ρ may be infinite, except these, which hold for every real ε: uniqueness of trajectories (§5.2), their time translation and time reversal (§5.3), the invariance of the good set under trajectories and under the reversal (§5.5), the group law of the flow, its bijectivity and the regularity of its paths (§7.1), and its reversibility (§7.3). For ε ≤ 0 and for ε ≥ ρ the contact scattering is the identity (§3.3) and every trajectory is a free motion without contacts. Witness: on `E` with ε = 1, positions `0` and `(1, 0)` are in contact.
- **Hard-core sets.** `𝒟̄^ε_N = {Z : ‖x_i − x_j‖ ≥ ε for all i ≠ j}` (closed) and `𝒟^ε_N` with strict inequalities (open). The flow lives on `𝒟̄^ε_N`.
- **Contact normal.** For a contact pair, `ν_ij = ℓ(x_i − x_j)/ε`, where `ℓ` is the short lift of §1.1; it points from particle `j` to particle `i`, and `ν_ji = −ν_ij`. Witness: `x_i = (1, 0)`, `x_j = 0`, ε = 1 gives `ν_ij = (1, 0)`.
- **Scattering.** `σ_ν(v, w) = (v − ⟨v − w, ν⟩ν, w + ⟨v − w, ν⟩ν)` for a unit vector ν. A contact pair is incoming when `⟨v_i − v_j, ν_ij⟩ < 0`, outgoing when `> 0`, grazing when `= 0`. Witness: at `x_i = (1, 0)`, `x_j = 0`, the velocities `v_i = (−1, 0)`, `v_j = 0` are incoming and are sent to `v_i' = 0`, `v_j' = (−1, 0)`.
- **Right-continuous velocities.** A trajectory's velocity is right-continuous: the state at a collision time carries the outgoing velocities. The left-continuous convention of DengHaniMa2024 is obtained by applying the contact scattering (§5.4). Witness: two particles on `E`, d = 2, ε = 1, starting at `x_1 = (2, 0)`, `x_2 = 0` with `v_1 = (−1, 0)`, `v_2 = 0`, collide at time 1; the state at time 1 has `v_1 = 0`, `v_2 = (−1, 0)`, and at time 3 the positions are `(1, 0)` and `(−2, 0)`.
- **Time reversal.** `ℛ(X, V) = (X, −σ_M V)`, where `σ_M` applies the scattering to every pair of the contact matching `M` of `X` (§3.3). It agrees with `(X, V) ↦ (X, −V)` off the contact set.
- **Junk values.** The flow `T_t` is the trajectory map on the good set `G` and the identity off `G`; it is therefore defined everywhere and is an exact group action.
- **Transport sign.** A density is transported as `W(t) = W⁰ ∘ T_{−t}`. Witness: for one particle on `E`, `W(t)(x, v) = W⁰(x − t v, v)`, so `W(1)((1, 0), (1, 0)) = W⁰(0, (1, 0))`.
- **Maxwellians.** `M_{β,u}(v) = (β/2π)^{d/2} exp(−β|v − u|²/2)` with inverse temperature `β > 0` and mean velocity `u`. Witness: d = 1, β = 1, u = 0 gives `M(0) = 1/√(2π) ≈ 0.39894`.
- **Sphere measure.** σ_S is the sphere measure `MeasureTheory.Measure.toSphere` of Lebesgue measure on the unit sphere `S^{d−1}`, of total mass `d·ω_d` with `ω_d = vol(B(0,1))`. Witness: d = 3 gives total mass 4π; d = 2 gives 2π.
- **Grand canonical normalisation.** The weight of `N` particles is `μ^N/N!` with normalising constant `Z`; correlation functions are rescaled by `μ^{−n}` as in BGSS2023 (1.1.10). The fugacity μ is a nonnegative real (`ℝ≥0`) and the one-particle density `f⁰ : X × E → ℝ≥0∞`. In the Boltzmann–Grad scaling `μ_ε = ε^{−(d−1)}`, written `Real.toNNReal (ε⁻¹ ^ (d − 1))`. Witness: d = 3, ε = 0.1 gives `μ_ε = 100`. The exponent `d − 1` is a natural number, so for `d = 0` the Lean expression is `ε⁻¹ ^ 0 = 1`, not `ε^{−(0−1)} = ε` (0.1 against 1 at ε = 0.1); the scaling is used only for `d ≥ 1` (`HardSphere.boltzmannGrad_scaling`) and `d ≥ 2` (§10.4–10.5), where the two expressions agree (1 for `d = 1`, 100 for `d = 3` at ε = 0.1).
- **Extended reals.** Densities of measures, partition functions and correlation functions are `ℝ≥0∞`-valued (lower integrals), so that no integrability side condition is hidden; real-valued statements take `toReal` under explicit finiteness hypotheses. With the conventions of `ℝ≥0∞`, an infinite partition function gives the zero measure and zero correlation functions (`x/∞ = 0` for finite `x`, `∞/∞ = 0`).

## Exact supplier contracts

### From Mathlib

The declarations below are cited as they stand at the pinned Mathlib.

- `EuclideanSpace` (`Mathlib/Analysis/InnerProductSpace/PiL2.lean`) and `EuclideanSpace.volume_ball` (`Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean`): the volume of `B(x, r)` is `r^d · π^{d/2}/Γ(d/2 + 1)`.
- `QuotientAddGroup.instNormedAddCommGroup` and `QuotientAddGroup.norm_mk` (`Mathlib/Analysis/Normed/Group/Quotient.lean`): for a closed subgroup `S`, `E ⧸ S` is a normed group with `‖mk x‖ = infDist x S`. Closedness is a hypothesis of the instance.
- `QuotientAddGroup.borelSpace` (`Mathlib/MeasureTheory/Constructions/Polish/Basic.lean`) and `AddSubgroup.isClosed_of_discreteTopology`: the quotient of a Polish group by a closed subgroup carries the Borel σ-algebra as quotient σ-algebra, and a discrete subgroup of a Hausdorff group is closed.
- `IsZLattice`, `ZLattice.isAddFundamentalDomain`, `ZSpan.fundamentalDomain`, `ZLattice.covolume` and `ZLattice.covolume_eq_measure_fundamentalDomain` (`Mathlib/Algebra/Module/ZLattice/Basic.lean`, `Covolume.lean`): a discrete full-rank `ℤ`-submodule `L` has a bounded measurable fundamental domain from any `ℤ`-basis, for the action of `L` by translation, and the real-valued covolume is the measure of any fundamental domain.
- `MeasureTheory.IsAddFundamentalDomain`, `MeasureTheory.AddQuotientMeasureEqMeasurePreimage`, `MeasureTheory.IsFundamentalDomain.quotientMeasureEqMeasurePreimage_quotientMeasure` (used in its additive form, by `to_additive`) and `MeasureTheory.IsAddFundamentalDomain.addProjection_respects_measure` (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean`): the typeclass says that a measure on the quotient is the image of the upstairs measure restricted to every fundamental domain; for a countable group acting by measurable measure-preserving maps, the image of the upstairs measure restricted to one fundamental domain satisfies it, and a measure satisfying it is then the same image for every other fundamental domain. The typeclass does not by itself provide a `MeasureSpace` instance on the quotient; §1.3 chooses one.
- `measurePreserving_quotientAddGroup_mk_of_AddQuotientMeasureEqMeasurePreimage` and `MeasureTheory.QuotientMeasureEqMeasurePreimage.haarMeasure_quotient` (the latter in its additive form) (`Mathlib/MeasureTheory/Measure/Haar/Quotient.lean`): under the typeclass, the quotient map is measure preserving from the upstairs measure restricted to a fundamental domain; and for a countable normal subgroup of a Polish locally compact group whose quotient is Hausdorff and second countable, a finite quotient measure satisfying the typeclass relative to a Haar measure that is also right invariant is itself a Haar measure. Both are stated for fundamental domains of the opposite subgroup acting by right translation, which on a commutative group is the same action.
- `UnitAddTorus` (`Mathlib/Topology/Instances/AddCircle/Real.lean`) and `UnitAddTorus.measurePreserving_equivPiIoc` (`Mathlib/Analysis/Fourier/AddCircleMulti.lean`): the torus `Fin d → UnitAddCircle` with its product Haar probability measure. Its norm is the supremum of the circle norms, not the Euclidean quotient norm; only its group and measure are compared with the flat torus.
- `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul` and `MeasureTheory.lintegral_abs_det_fderiv_eq_addHaar_image` (`Mathlib/MeasureTheory/Function/Jacobian.lean`): for a measurable `s`, a map injective on `s` with derivative `f' x` within `s` at each point satisfies `vol(f '' s) = ∫_s |det f' x|`.
- `Submodule.reflection` and `Submodule.det_reflection` (`Mathlib/Analysis/InnerProductSpace/Projection/Reflection.lean`, `FiniteDimensional.lean`): reflection in a complete subspace `K` is a linear isometry of determinant `(−1)^{dim Kᗮ}`.
- `MeasureTheory.Measure.map_linearMap_addHaar_eq_smul_addHaar` (`Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`): a linear map of nonzero determinant pushes an additive Haar measure forward to `|det|^{−1}` times itself, so a linear map of determinant `±1` preserves it.
- `Matrix.det_fromBlocks_zero₁₂` (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`): a block lower-triangular determinant is the product of the diagonal block determinants.
- `MeasureTheory.Measure.addHaar_sphere` and `MeasureTheory.Measure.addHaar_submodule` (`Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`): spheres and proper subspaces are null for an additive Haar measure in a nontrivial finite-dimensional space.
- `MeasureTheory.Measure.toSphere` and `MeasureTheory.Measure.toSphere_apply_univ` (`Mathlib/MeasureTheory/Constructions/HaarToSphere.lean`): the sphere measure `μ.toSphere(A) = d · μ((0,1)·A)`, of total mass `d · μ(B(0,1))`.
- `GaussianFourier.integral_rexp_neg_mul_sq_norm` (`Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean`): `∫ exp(−b|v|²) dv = (π/b)^{d/2}` for `b > 0`.
- `ProbabilityTheory.gaussianPDFReal`, `ProbabilityTheory.multivariateGaussian` (`Mathlib/Probability/Distributions/Gaussian/Real.lean`, `Multivariate.lean`) and `ProbabilityTheory.poissonMeasure` (`Mathlib/Probability/Distributions/Poisson/Basic.lean`): the Gaussian density on ℝ, the multivariate Gaussian law (a Dirac mass when the covariance is not positive semidefinite), and the Poisson law `Σ_n e^{−r} r^n/n! δ_n` on `ℕ`.
- `MeasureTheory.MeasurePreserving`, `MeasureTheory.measurePreserving_piCongrLeft` (`Mathlib/MeasureTheory/Constructions/Pi.lean`): relabelling coordinates preserves a product measure.
- `MeasureTheory.Lp.compMeasurePreserving` and `MeasureTheory.Lp.norm_compMeasurePreserving` (`Mathlib/MeasureTheory/Function/LpSpace/Basic.lean`): composition with a measure-preserving map is an isometry of `Lp`.
- `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le` (`Mathlib/MeasureTheory/Function/ContinuousMapDense.lean`): for `p ≠ ∞` on a locally compact normal space with a regular measure, continuous compactly supported functions approximate `Lp` functions.
- `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`): the fundamental theorem of calculus on `[a, b]`, `a ≤ b`, for a function continuous on the closed interval, differentiable at every point of the open interval, with interval-integrable derivative; the endpoints need no derivative.
- `ProbabilityTheory.meas_ge_le_variance_div_sq` (`Mathlib/Probability/Moments/Variance.lean`): Chebyshev's inequality on a finite measure space, centred at the mean: for `X` in `L²` and `c > 0`, the measure of `{|X − μ[X]| ≥ c}` is at most `Var(X)/c²`.
- `MeasureTheory.tendsto_integral_of_dominated_convergence` (`Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`) and `Filter.tendsto_iff_seq_tendsto` (`Mathlib/Order/Filter/AtTopBot/CountablyGenerated.lean`): dominated convergence for a sequence of almost-everywhere strongly measurable functions bounded almost everywhere by one integrable function and converging almost everywhere; and, along a countably generated filter such as `𝓝[>] 0` on ℝ, a limit holds exactly when it holds along every sequence tending to the filter.
- `Nat.descFactorial`, `Nat.descFactorial_eq_div` and `Nat.descFactorial_eq_zero_iff_lt` (`Mathlib/Data/Nat/Factorial/Basic.lean`): the falling factorial `n(n − 1)⋯(n − k + 1)`, equal to `n!/(n − k)!` when `k ≤ n` and zero exactly when `n < k`.
- `Sigma.instMeasurableSpace` (`Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean`) and `MeasureTheory.Measure.sum`: the measurable space and measures on the grand canonical phase space.
- `Flow` (`Mathlib/Dynamics/Flow.lean`): a jointly continuous action of a topological monoid; the hard-sphere flow is not continuous and is not an instance, while free transport is.
- `secondCountable_of_proper` (`Mathlib/Topology/MetricSpace/ProperSpace.lean`), `standardBorel_of_polish`, `StandardBorelSpace.prod` and `StandardBorelSpace.pi_countable` (`Mathlib/MeasureTheory/Constructions/Polish/Basic.lean`): a proper metric space is complete and second countable, hence Polish; a Polish space with its Borel σ-algebra is standard Borel, and finite products of standard Borel spaces are standard Borel. So the phase space `Fin N → X × E` is standard Borel, as ClassicalErgodicTheory §3.5 requires.
- `ZLattice.module_free`, `Module.Basis.ofZLatticeBasis`, `Module.Basis.ofZLatticeBasis_span`, `ZSpan.floor`, `ZSpan.fract`, `ZSpan.fract_mem_fundamentalDomain` and `ZSpan.fundamentalDomain_isBounded` (`Mathlib/Algebra/Module/ZLattice/Basic.lean`): a lattice is a free `ℤ`-module, a `ℤ`-basis of it is an `ℝ`-basis of `E` spanning the lattice over `ℤ`, every vector differs from its fractional part `fract` by a lattice vector `floor`, the fractional part lies in the fundamental domain, and the fundamental domain of a basis is bounded. With `QuotientAddGroup.continuous_mk` they make `FlatTorus L` compact (§1.3).
- `QuotientAddGroup.measurableSpace` (`Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean`): the quotient σ-algebra, the image of the σ-algebra upstairs; by `QuotientAddGroup.borelSpace` it is the Borel σ-algebra of the quotient topology.
- `EuclideanSpace.basisFun` (`Mathlib/Analysis/InnerProductSpace/PiL2.lean`): the standard orthonormal basis of `E`; its `ℤ`-span is the lattice `ℤ^d` of the unit torus, a discrete lattice of full rank by the instances of `Mathlib/Algebra/Module/ZLattice/Basic.lean` for the span of a basis.
- `BoundedContinuousFunction` (`Mathlib/Topology/ContinuousMap/Bounded/Basic.lean`), `MeasureTheory.Measure.withDensity`, `essSup` and `Fin.append`: the test functions of §10.4–10.5, the densities of §9.3, the essential supremum of §9.6 and §10.4, and the concatenation of configurations in §9.5.

### From Tau Ceti

The declarations below are cited as they stand at the pinned Tau Ceti.

- `TauCeti.Probability.multivariateGaussianPDFReal` and `TauCeti.Probability.multivariateGaussian_eq_withDensity` (`TauCeti/Probability/Distributions/Gaussian/Density.lean`): the density `(2π)^{−d/2} (det S)^{−1/2} exp(−⟨x − m, S⁻¹(x − m)⟩/2)`, which is the density of `multivariateGaussian m S` for positive definite `S`.
- `TauCeti.Semigroups.StronglyContinuousGroup` (`TauCeti/Analysis/Semigroups/Group/Basic.lean`): a family `U : ℝ → X →L[ℝ] X` with `U 0 = id`, `U (s + t) = U s ∘ U t` for all real `s, t`, and strong continuity at `0`.
- `TauCeti.Probability.empiricalFiniteMeasure`, `TauCeti.Probability.card_smul_empiricalFiniteMeasure` and `TauCeti.Probability.empiricalMeasureOfFintype` (`TauCeti/Probability/Process/EmpiricalMeasure.lean`): the finite measure `|κ|⁻¹ Σ_i δ_{x_i}` of a family `x : κ → α` over any finite type `κ`, which is the zero measure when `κ` is empty; `|κ|` times it is `Σ_i δ_{x_i}` for every finite `κ`, the empty one included; and, for nonempty `κ`, the probability measure `empiricalMeasureOfFintype x` with the same underlying measure.
- `TauCeti.flowOfLipschitz` (`TauCeti/Dynamics/Flow/OfLipschitz.lean`): the global flow of a globally Lipschitz vector field on a Banach space.
- `ZLattice.successiveMin`, `ZLattice.successiveMin_zero_le_iff` and `ZLattice.successiveMin_pos` (`TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean`): for a `ℤ`-submodule `L` of a finite-dimensional real normed space and a convex body `K`, the `i`-th successive minimum, the least `t ≥ 0` such that `t K` contains `i + 1` linearly independent vectors of `L`; when `L` is discrete of full rank and `0` is interior to `K`, it is positive, and for `i = 0` (which needs positive dimension) it is at most `t ≥ 0` exactly when `t K` contains a nonzero vector of `L`. The radius of a flat torus (§1.3) is half the first minimum for the closed unit ball.

### From TauCetiRoadmap.ClassicalErgodicTheory — §3.5

Consumed on a standard Borel space with a σ-finite measure `μ`; a conull flow there is a measurable set `X₀` with `μ(X₀ᶜ) = 0` carrying a jointly measurable `AddAction ℝ X₀` whose time-`t` maps preserve `μ` restricted to `X₀`. The phase spaces here are standard Borel (Mathlib above) and `λ_N`, `λ_N|𝒟̄` and `(1/N!) λ_N|𝒟̄_N` are σ-finite.

- §3.5 item 1 (conull flows): the extension of each time-`t` map by the identity off `X₀` is a jointly measurable family of `μ`-preserving maps satisfying the group law everywhere. Consumed in §7.2.
- §3.5 item 3 (disjoint unions): for countably many conull flows on `(X_N, μ_N)`, the componentwise flow on `Σ N, X_N` with the sum measure is a conull flow, and a measure on the union is invariant exactly when each of its component restrictions is. Consumed in §7.5 and §9.4.
- §3.5 item 4 (transport of densities): for a conull flow with identity extension `Φ` and a measurable `W ≥ 0`, `(Φ t)_* (μ.withDensity W) = μ.withDensity (W ∘ Φ (−t))`. Consumed in §8.1.

## How to read the build

Layer 1 fixes the position space: an abstract flat position space, its two instances (Euclidean space and the flat torus), and the local geometry of shells and packings. Layer 2 is the algebra of one elastic collision. Layer 3 sets up phase space, contacts, contact scattering, time reversal and free transport. Layer 4 solves the two-body problem and proves that its flow preserves Lebesgue measure through the Jacobian of the collision map; this is the analytic core. Layer 5 defines trajectories and proves uniqueness and the symmetries. Layer 6 proves Alexander's theorem from the near-triple estimate and an iteration in short time steps. Layer 7 packages the flow, its measure preservation, its Koopman group and the grand canonical phase space. Layer 8 transports densities and derives the weak Liouville equation and the marginals. Layer 9 builds the equilibrium and grand canonical ensembles and their correlation functions. Layer 10 defines the empirical measure, the Boltzmann collision operator and mild solutions, states Lanford's theorem as a proposition and proves its law of large numbers.

The Lean names that appear in backticks below and are not Mathlib or Tau Ceti declarations are the declarations of `Suggested.lean`. Definitions: the class `FlatPositionSpace` with its fields and the short lift `FlatPositionSpace.shortLift` (§1.1); `FlatTorus` with its quotient norm, compactness, quotient σ-algebra, measure and Borel instances, and `UnitFlatTorus` (§1.3); `HardSphere.scatter` (§2.1); `HardSphere.hardCoreSet` (§3.1); `HardSphere.contactScatter` and `HardSphere.reversal` (§3.3); `HardSphere.freeFlow` (§3.4); `HardSphere.IsTrajectory` (§5.1); `HardSphere.goodSet` (§5.5); `HardSphere.flow` (§7.1); `HardSphere.partitionFunction`, `HardSphere.grandCanonicalDensity` and `HardSphere.grandCanonical` (§9.3); `HardSphere.correlation` (§9.5); `HardSphere.empirical` (§10.1); `HardSphere.collisionOperator` (§10.2); `HardSphere.IsMildBoltzmannSolution` (§10.3); `HardSphere.LanfordStatement` (§10.4). Theorems: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Every other result of this README is a target stated in prose. The structure of §1.1 on `FlatTorus L` is a target of §1.3 and is not declared there: its lift, injectivity and local-measure axioms at the injectivity radius are theorems, and an instance with an unproved field is excluded from `Suggested.lean`. So `HardSphere.LanfordStatement` and `HardSphere.LanfordStatement.tendsto_empirical` take a structure `[FlatPositionSpace d (UnitFlatTorus d)]` as an instance argument, and the proposition is asserted for every such structure, all of which give the same proposition (§10.4).

## Layer 1: Flat position spaces

### 1.1 Flat position spaces

Define the class `FlatPositionSpace d X` for a normed additive commutative group `X` that is a proper metric space with Borel measurable structure and a measure `volume`. Its data are an additive homomorphism `π : E →+ X` (the cover, `FlatPositionSpace.cover`) and a radius `ρ ∈ (0, ∞]` (the injectivity radius, `FlatPositionSpace.radius`, an element of `ℝ≥0∞`); its axioms are: `0 < ρ` (`FlatPositionSpace.radius_pos`); `π` is surjective (`FlatPositionSpace.surjective_cover`); `‖π a‖ ≤ |a|` for every `a` (`FlatPositionSpace.norm_cover_le`); every `ξ ∈ X` with `‖ξ‖ < ρ` has a lift `a` with `π a = ξ` and `|a| = ‖ξ‖` (`FlatPositionSpace.exists_lift`); `π` is injective on the open ball `B(0, ρ)` (`FlatPositionSpace.injOn_cover`); `volume` is invariant under translations (`FlatPositionSpace.isAddLeftInvariant_volume`); and `volume(π(A)) = vol(A)` for every measurable `A ⊆ B(0, ρ)` (`FlatPositionSpace.volume_image_cover`). This is the common carrier of the two settings of the sources: ℝᵈ (GST2013 line 833) and the torus (BGSS2023 line 119). Instances fix ρ as the largest radius for which the axioms hold. Define the short lift `FlatPositionSpace.shortLift ξ` as the lift of ξ in the open ball `B(0, ρ)` when there is one, and `0` otherwise.

API:

- The short lift: for `‖ξ‖ < ρ` there is a unique `ℓ(ξ) ∈ B(0, ρ)` with `π(ℓ(ξ)) = ξ`, and `FlatPositionSpace.shortLift ξ` is it; it satisfies `|ℓ(ξ)| = ‖ξ‖`, `ℓ(−ξ) = −ℓ(ξ)`, `ℓ(π a) = a` for `|a| < ρ`, and `ℓ` is continuous on the ball of radius ρ. When `‖ξ‖ ≥ ρ` no lift lies in `B(0, ρ)`, since `‖π a‖ ≤ |a|`, and the short lift is `0`.
- Local isometry: `π` is 1-Lipschitz, and `‖π a − π b‖ = |a − b|` whenever `|a − b| < ρ`; for `r ≤ ρ` the image `π(B(a, r))` is the ball `B(π a, r)`.
- Balls and spheres: for `r ≤ ρ`, `volume(B(x, r)) = vol(B(0, r))`; for `0 < r < ρ` the sphere `{y : ‖y − x‖ = r}` is null.
- Measure: `volume` is an additive Haar measure, σ-finite, finite on bounded sets, and regular.
- Free transport by velocity: `x ↦ x + π(t v)` is a measure-preserving homeomorphism of `X` for every `t ∈ ℝ` and `v ∈ E`, and `(t, x) ↦ x + π(t v)` is continuous.

**Checks.**

- On `E` itself with `π = id` and ρ = ∞ every axiom holds, and the short lift is the identity.
- On the unit flat torus of §1.3 in dimension 2, the class of `(1/2, 1/2)` has norm `√2/2 ≈ 0.7071`, and ρ = 1/2; the short lift of the class of `(0.9, 0)` is `(−0.1, 0)`.
- Mathlib's `UnitAddTorus (Fin 2)` with its supremum norm is not an instance for the coordinate cover, for any radius ρ > 0: for `0 < s < min(ρ, 1/2)` the class of `(s, s)` has supremum norm `s < ρ`, while every lift `(s + m, s + n)` with `m, n ∈ ℤ` has Euclidean norm at least `s√2 > s`, since `|s + m| ≥ s` for every integer `m` (0.1 against `0.1414` at `s = 0.1`; for ρ = 0.05, 0.01 against `0.01414` at `s = 0.01`), so the lift axiom fails.
- The degenerate radius is excluded: with ρ = 0 the lift axiom would be vacuous and every contact normal undefined; the class requires `0 < ρ`.

(GST2013 line 833; BGSS2023 line 119.) *Needs:* Mathlib `EuclideanSpace`, `MeasureTheory.Measure.IsAddHaarMeasure`, `MeasureTheory.Measure.addHaar_sphere`, `EuclideanSpace.volume_ball`.

### 1.2 Euclidean space as a position space

Give `E` the instance with `π = id` and ρ = ∞. Prove that for this instance the short lift `ℓ` of §1.1 is the identity on all of `E`, so that the contact normal `ℓ(x_i − x_j)/ε` of the Conventions is `(x_i − x_j)/ε` for every ε > 0, and free transport `x + π(t v)` is `x + t v`.

**Checks.**

- The contact normal of `x_i = (1, 0)`, `x_j = 0` at ε = 1 is `(1, 0)`.
- The ball volume in d = 3 at radius 1 is `4π/3 ≈ 4.18879`, from `EuclideanSpace.volume_ball`.
- Free transport of `x = 0` with `v = (1, 0)` for time 2 gives `(2, 0)`.
- The radius is infinite: in d = 2 at ε = 100 the positions `(100, 0)` and `0` are in contact with normal `ℓ(100, 0)/100 = (1, 0)`, and the ball axiom of §1.1 gives the ball of radius 100 the measure `10⁴π ≈ 31415.93`. The structure with the same cover and the finite radius ρ = 2 also satisfies every axiom of §1.1, and agrees with the three Checks above, but under the standing hypothesis `ε < ρ` it admits no diameter ε ≥ 2, it specifies `ℓ` only on the ball of radius 2 (not at `(100, 0)`), and its ball axiom covers only radii at most 2.

(GST2013 lines 833–841.) *Needs:* §1.1, Mathlib `EuclideanSpace.volume_ball`.

### 1.3 Flat tori

For `L : Submodule ℤ E` with `[DiscreteTopology L]` and `[IsZLattice ℝ L]`, define `FlatTorus L` as the quotient group `E ⧸ L.toAddSubgroup` of `E` by the additive subgroup underlying `L` (the submodule quotient `E ⧸ L` has the same carrier by definition, `Submodule.quotientRel` being `QuotientAddGroup.leftRel L.toAddSubgroup`, and the `QuotientAddGroup` declarations below are stated for the subgroup form), with the quotient norm `QuotientAddGroup.instNormedAddCommGroup` (`L` is closed because it is discrete, `AddSubgroup.isClosed_of_discreteTopology`), the Borel σ-algebra of the quotient topology (`QuotientAddGroup.borelSpace`), and the `MeasureSpace` instance whose `volume` is the image under the quotient map of Lebesgue measure restricted to the fundamental domain `ZSpan.fundamentalDomain` of a chosen `ℤ`-basis of `L` (the basis `Module.Free.chooseBasis` of the free `ℤ`-module `L`, `ZLattice.module_free`, read as an `ℝ`-basis of `E` by `Module.Basis.ofZLatticeBasis`; `ZLattice.isAddFundamentalDomain`). These are definitions with bodies. Prove that `FlatTorus L` is compact, hence proper: every class `x + L` contains the fractional part `ZSpan.fract b x`, which lies in the bounded fundamental domain of the basis `b`, so the quotient map carries the compact closure of that domain onto `FlatTorus L` (`ZSpan.fract_mem_fundamentalDomain`, `ZSpan.fundamentalDomain_isBounded`, `QuotientAddGroup.continuous_mk`). Prove that this set is also a fundamental domain for the opposite subgroup `AddSubgroup.op L.toAddSubgroup` acting by right translation, the action in Mathlib's quotient-measure theorems (`E` is commutative, so the two actions are the same maps). The rest is Mathlib's and is cited, not proved here: `volume` satisfies `MeasureTheory.AddQuotientMeasureEqMeasurePreimage vol volume` (`MeasureTheory.IsFundamentalDomain.quotientMeasureEqMeasurePreimage_quotientMeasure`, additive form), so it is the image of `vol` restricted to every fundamental domain of `L`, whichever basis was chosen (`MeasureTheory.IsAddFundamentalDomain.addProjection_respects_measure`); the quotient map is measure preserving from `vol` restricted to any fundamental domain (`measurePreserving_quotientAddGroup_mk_of_AddQuotientMeasureEqMeasurePreimage`); and `volume` is a finite additive Haar measure (`MeasureTheory.QuotientMeasureEqMeasurePreimage.haarMeasure_quotient`, additive form, whose hypotheses hold: `E` is Polish and locally compact, the quotient is a metric space and second countable, `L` is countable and normal, `vol` is Haar and right invariant, and the total mass is the measure of a bounded fundamental domain). Prove that this total mass is `ZLattice.covolume L` (`ZLattice.covolume_eq_measure_fundamentalDomain`). Give `FlatTorus L` the instance of §1.1 with `π` the quotient map and ρ equal to half the minimal norm of a nonzero lattice vector, an element of `(0, ∞]` that is `∞` exactly when `d = 0` (then `L = 0` and no nonzero lattice vector exists). For `d ≥ 1` it is half the first successive minimum of `L` for the closed unit ball `B̄` of `E` read as a convex body, `ρ = ZLattice.successiveMin L B̄ ⟨0, _⟩ / 2`: by `ZLattice.successiveMin_zero_le_iff` that minimum is at most `t ≥ 0` exactly when `t B̄` contains a nonzero vector of `L`, so it is the least norm of a nonzero lattice vector, and it is positive by `ZLattice.successiveMin_pos` (`L` is discrete and `0` is interior to `B̄`). The lift axiom and injectivity on `B(0, ρ)` follow from `QuotientAddGroup.norm_mk` (`‖π a‖` is the distance from `a` to `L`, attained since `L` is discrete), translation invariance of `volume` is the Haar property, and the local measure axiom follows from unfolding a fundamental domain `𝓕`: for measurable `A ⊆ B(0, ρ)` the translates `A + k`, `k ∈ L`, are disjoint, so `volume(π(A)) = vol(π⁻¹(π(A)) ∩ 𝓕) = Σ_k vol(A ∩ (𝓕 − k)) = vol(A)`. Write `𝕋^d = UnitFlatTorus d` for the unit flat torus, `L = ℤᵈ` the `ℤ`-span of the standard basis `EuclideanSpace.basisFun`.

API:

- The chosen fundamental domain is a fundamental domain for the opposite subgroup, and `volume` is the image of `vol` restricted to every fundamental domain of `L`. Non-example: for `ℤ^d` with `d ≥ 2` the ball `B(0, 1/2)` is not a fundamental domain, although `π` is injective on it: its translates cover only a set of density `ω_d/2^d < 1` (`π/4` in `d = 2`), so the image of `vol` restricted to it has total mass `ω_d/2^d`, not 1; the cube `[0, 1)^d` is one (and in `d = 1` the interval `(−1/2, 1/2)` is one up to the null set `1/2 + ℤ`).
- `FlatTorus L` is a compact connected metric group; the quotient map is a covering map and a local isometry on balls of radius ρ.
- For a measurable `L`-periodic `g ≥ 0` on `E`, `∫_X g dμ_X` equals the integral of `g` over a fundamental domain.
- The unit torus has `ρ = 1/2` and total mass 1, and the coordinate map identifies `𝕋^d` with `UnitAddTorus (Fin d)` as additive groups by a measure-preserving equivalence; the norms differ.
- Scaling: for `c > 0`, `FlatTorus (c L)` is isometric to `FlatTorus L` with distances multiplied by `c` and measure multiplied by `c^d`.

**Checks.**

- The unit torus in dimension 2: the class of `(1/2, 1/2)` has norm `√2/2`, the class of `e_1` is zero, and ρ = 1/2.
- The lattice `2ℤ × ℤ` in dimension 2 has covolume 2 and ρ = 1/2 (the shortest nonzero vector is `e_2`).
- The supremum norm of `UnitAddTorus (Fin 2)` gives `1/2` at `(1/2, 1/2)`, not `√2/2`: identifying the two tori as metric spaces is wrong.
- A measure normalised to total mass 1 on `FlatTorus (2ℤ × ℤ)` violates the local axiom of §1.1: a ball of radius 1/4 has Lebesgue volume `π/16` but would get `π/32`.

(BGSS2023 lines 119–142.) *Needs:* §1.1, Mathlib `AddSubgroup.isClosed_of_discreteTopology`, `QuotientAddGroup.measurableSpace`, `QuotientAddGroup.borelSpace`, `QuotientAddGroup.continuous_mk`, `ZLattice.module_free`, `Module.Basis.ofZLatticeBasis`, `Module.Basis.ofZLatticeBasis_span`, `ZSpan.fract`, `ZSpan.fract_mem_fundamentalDomain`, `ZSpan.fundamentalDomain_isBounded`, `EuclideanSpace.basisFun`, `QuotientAddGroup.instNormedAddCommGroup`, `QuotientAddGroup.norm_mk`, `IsZLattice`, `ZSpan.fundamentalDomain`, `ZLattice.isAddFundamentalDomain`, `ZLattice.covolume`, `ZLattice.covolume_eq_measure_fundamentalDomain`, `MeasureTheory.AddQuotientMeasureEqMeasurePreimage`, `MeasureTheory.IsFundamentalDomain.quotientMeasureEqMeasurePreimage_quotientMeasure`, `MeasureTheory.IsAddFundamentalDomain.addProjection_respects_measure`, `measurePreserving_quotientAddGroup_mk_of_AddQuotientMeasureEqMeasurePreimage`, `MeasureTheory.QuotientMeasureEqMeasurePreimage.haarMeasure_quotient`, `UnitAddTorus.measurePreserving_equivPiIoc`; Tau Ceti `ZLattice.successiveMin`, `ZLattice.successiveMin_zero_le_iff`, `ZLattice.successiveMin_pos`.

### 1.4 Shells and packings

Prove, for a flat position space with `0 ≤ r₁ ≤ r₂ < ρ` and `x ∈ X`: the shell `{y : r₁ ≤ ‖y − x‖ ≤ r₂}` has measure `ω_d (r₂^d − r₁^d)`, which is at most `d ω_d r₂^{d−1} (r₂ − r₁)`. Prove the packing bound: if `0 < ε ≤ 2ρ` and `x_1, …, x_N ∈ X` satisfy `‖x_i − x_j‖ ≥ ε` for `i ≠ j`, then `N ω_d (ε/2)^d ≤ μ_X(X)`. In particular, on a flat torus no `N` points have pairwise distances at least ε when `N > covolume(L)/(ω_d (ε/2)^d)` (GST2013 line 873; BGSS2023 line 165).

**Checks.**

- Unit torus, d = 2, ε = 0.4: `ω_2 (0.2)² = 0.04π ≈ 0.12566`, so at most 7 points with pairwise distances at least 0.4 fit, and no 8 points do.
- On `E` the shell `1 ≤ |y| ≤ 1.1` in d = 2 has area `π(1.21 − 1) ≈ 0.65973`.
- The hypothesis `r₂ < ρ` is needed: on the unit torus in d = 1 (ρ = 1/2, `ω_1 = 2`) the shell `0.4 ≤ ‖y‖ ≤ 0.6` is the set `0.4 ≤ ‖y‖ ≤ 0.5`, of measure 0.2, while the formula would give `2(0.6 − 0.4) = 0.4`.

*Needs:* §1.1, §1.3, Mathlib `EuclideanSpace.volume_ball`.

### Examples

The unit torus `𝕋^d` (ρ = 1/2, total mass 1) is the setting of BGSS2023 and of Layer 10; Euclidean space (ρ = ∞) is the setting of GST2013 and DengHaniMa2024; a rectangular torus `FlatTorus (aℤ × bℤ)` is the box of side lengths `a`, `b` with periodic boundary conditions.

### Dependencies

Mathlib; Tau Ceti `ZLattice.successiveMin`, `ZLattice.successiveMin_zero_le_iff` and `ZLattice.successiveMin_pos` (§1.3).

## Layer 2: Elastic scattering

### 2.1 The scattering map

Define `HardSphere.scatter ν : E × E →ₗ[ℝ] E × E` for `ν ∈ E` by `σ_ν(v, w) = (v − ⟨v − w, ν⟩ν, w + ⟨v − w, ν⟩ν)`; for a unit vector ν it is the elastic collision of two equal masses with line of centres ν (GST2013 lines 843–847 and 1222–1227; BGSS2023 lines 125–131; DengHaniMa2024 lines 157–163).

API, for a unit vector ν (polynomial identities in `⟨v − w, ν⟩` and `|ν| = 1`):

- `σ_ν` is an involution, and `σ_{−ν} = σ_ν`.
- Conservation: `σ_ν` preserves `v + w` and `|v|² + |w|²`.
- `⟨v' − w', ν⟩ = −⟨v − w, ν⟩` for `(v', w') = σ_ν(v, w)`, so `σ_ν` exchanges incoming and outgoing pairs and fixes grazing pairs and pairs with `v = w`.
- Reflection: `σ_ν` is the orthogonal reflection of `E × E` (with the Euclidean product norm) in the hyperplane orthogonal to `(ν, −ν)`, hence has determinant −1 and preserves Lebesgue measure, by `MeasureTheory.Measure.map_linearMap_addHaar_eq_smul_addHaar`.
- Components: the tangential parts `v − ⟨v, ν⟩ν` and `w − ⟨w, ν⟩ν` are unchanged, and the normal components are exchanged: `⟨v', ν⟩ = ⟨w, ν⟩`, `⟨w', ν⟩ = ⟨v, ν⟩`.
- Galilean invariance: `σ_ν(v + c, w + c) = σ_ν(v, w) + (c, c)` for every `c ∈ E`; rotation equivariance: `σ_{Aν}(Av, Aw) = (A × A)(σ_ν(v, w))` for every linear isometry `A` of `E`.
- Swap: `σ_ν(w, v)` is the swap of `σ_ν(v, w)`.
- Agreement with `Submodule.reflection` on `WithLp 2 (E × E)` for the subspace orthogonal to `(ν, −ν)`, and `LinearMap.det σ_ν = −1` by `Submodule.det_reflection`.

**Checks.**

- d = 2, ν = (1, 0), `v = (0, 0.9)`, `w = (0.9, 0)`: `⟨v − w, ν⟩ = −0.9` (incoming), and `σ_ν(v, w) = ((0.9, 0.9), (0, 0))`; energy `0.81 + 0.81 = 1.62 + 0`.
- Head-on: ν = (1, 0), `v = (1, 0)`, `w = (−1, 0)` gives `v' = (−1, 0)`, `w' = (1, 0)`: equal masses exchange normal velocities.
- `v = w` is fixed, and so is any grazing pair, e.g. `v = (0, 1)`, `w = 0`, ν = (1, 0).
- Non-example: reflecting each velocity separately, `v ↦ v − 2⟨v, ν⟩ν`, sends `(v, w) = ((1, 0), 0)` to `((−1, 0), 0)` and changes the total momentum from `(1, 0)` to `(−1, 0)`.

*Needs:* Mathlib `Submodule.reflection`, `Submodule.det_reflection`, `MeasureTheory.Measure.map_linearMap_addHaar_eq_smul_addHaar`, `MeasureTheory.MeasurePreserving`.

### 2.2 Pre- and post-collisional variables

Prove that the map `Θ(v, w, ω) = (σ_ω(v, w), −ω)` is a measure-preserving involution of `E × E × S^{d−1}` (with `vol ⊗ vol ⊗ σ_S`) which preserves the hard-sphere kernel `((w − v)·ω)_+`, and that the swap `(v, w, ω) ↦ (w, v, −ω)` has the same two properties (the involution: GST2013 lines 394–400; the unit Jacobians of the two changes of variables: GST2013 lines 432–437; the hard-sphere kernel `b(w, ω) = (ω·w)_+`: GST2013 lines 674 and 1264–1268). Prove the total cross-section formula `∫_{S^{d−1}} ⟨k, ω⟩_+ dσ_S(ω) = ω_{d−1} |k|` for `d ≥ 1`, with `ω_{d−1}` the volume of the unit ball of `ℝ^{d−1}` (so `ω_0 = 1`). The value is an elementary computation of this roadmap, stated in none of the sources: write `k = |k| e` with `e` a unit vector; the polar decomposition behind `MeasureTheory.Measure.toSphere` gives `∫_{B(0,1)} g dvol = (1/(d + 1)) ∫_{S^{d−1}} g dσ_S` for `g` positively homogeneous of degree 1, and Fubini over `e^⊥ × ℝ` gives `∫_{B(0,1)} ⟨e, x⟩_+ dvol = ½ ∫_{B^{d−1}} (1 − |y|²) dy = ½ ω_{d−1} (1 − (d − 1)/(d + 1)) = ω_{d−1}/(d + 1)`; equivalently, the orthogonal projection onto `e^⊥` carries the measure `⟨e, ω⟩_+ σ_S` on the hemisphere `⟨e, ω⟩ > 0` to Lebesgue measure on the unit ball of `e^⊥`.

**Checks.**

- d = 3: `∫ ⟨k, ω⟩_+ dσ_S = π|k|`; d = 2: `2|k|`.
- d = 1: `S⁰ = {±1}` and σ_S is the counting measure (total mass `1 · ω_1 = 2`), so `∫ ⟨k, ω⟩_+ dσ_S = |k| = ω_0 |k|`; the computation gives `∫_{B(0,1)} ⟨e, x⟩_+ = ½ = ω_0/(1 + 1)` there.
- With the probability-normalised sphere measure the d = 3 value would be `|k|/4`; the convention that σ_S is the sphere measure `MeasureTheory.Measure.toSphere` of Lebesgue measure, of total mass `d·ω_d`, excludes it.
- At the witness of §2.1, `(w − v)·ω` changes from `0.9` to `(w' − v')·(−ω) = 0.9` under Θ, as required.

*Needs:* §2.1, Mathlib `MeasureTheory.Measure.toSphere`, `MeasureTheory.Measure.toSphere_apply_univ`.

### Examples

The head-on collision exchanges velocities; the oblique collision at ν = (0.8, 0.6) of relative velocity `(−1, 0)` produces relative velocity `(0.28, 0.96)` (§4.2).

### Dependencies

Mathlib only.

## Layer 3: Phase space, contacts and free transport

### 3.1 Hard-core phase spaces

Define `HardSphere.hardCoreSet ε N` as the closed set `𝒟̄^ε_N` of configurations `Z ∈ (Fin N → X × E)` with `‖x_i − x_j‖ ≥ ε` for all `i ≠ j`, and `𝒟^ε_N` the open set with strict inequalities (the closed set: DengHaniMa2024 (1.1), lines 150–153; the open set: GST2013 lines 839–841, BGSS2023 lines 137–142). The definition uses only the norm of `X`, and is made for every real ε and every normed additive commutative group `X`.

API:

- `𝒟̄` is closed, `𝒟` is open, both are invariant under relabelling and under translation of all positions by a common vector, and both are products of a position set with all of `E^N`.
- For `N ≤ 1` both are the whole space; for `0 < ε < ρ` the difference `𝒟̄ ∖ 𝒟` is null.
- Restriction: if `Z ∈ 𝒟̄_N` then every subconfiguration lies in `𝒟̄_s`.
- Packing: on a flat torus `FlatTorus L` with `0 < ε ≤ 2ρ`, `𝒟̄^ε_N` is empty for `N > covolume(L)/(ω_d (ε/2)^d)`, by the packing bound of §1.4 (BGSS2023 line 165).
- Relabelling by a permutation preserves `λ_N` (`MeasureTheory.measurePreserving_piCongrLeft`).

**Checks.**

- On `E`, d = 2, ε = 1: positions `0`, `(1, 0)` lie in `𝒟̄_2` but not `𝒟_2`; positions `0`, `(0.5, 0)` lie in neither.
- Unit torus, ε = 0.4: positions `π(0.05, 0)`, `π(0.95, 0)` are at torus distance 0.1, so the configuration is not in `𝒟̄_2`; measuring the distance of the representatives (0.9) would wrongly accept it.
- `N = 1`: `𝒟̄_1` is everything, since there are no pairs.
- The packing statement needs `ε ≤ 2ρ`: on the unit circle (d = 1, ρ = 1/2, `ω_1 = 2`) with ε = 1.5 the threshold is `1/(2 · 0.75) = 2/3`, and `N = 1 > 2/3`, yet `𝒟̄_1` is everything; at ε = 1 = 2ρ the threshold is 1, and `𝒟̄_2` is indeed empty, the largest torus distance being 1/2.

*Needs:* §1.1, §1.4, Mathlib `MeasureTheory.measurePreserving_piCongrLeft`.

### 3.2 Contacts, contact normals and boundary pieces

Define the contact pairs of positions `X` as the pairs `{i, j}` with `‖x_i − x_j‖ = ε`; a contact matching when these pairs are pairwise disjoint; the contact normal `ν_ij = ℓ(x_i − x_j)/ε ∈ S^{d−1}` for `ε < ρ`; and, for `i ≠ j`, the boundary pieces `∂^±(i, j)` of the configurations of `𝒟̄` whose only contact pair is `{i, j}` and with `±⟨v_i − v_j, ν_ij⟩ > 0` (BGSS2023 lines 148–152). Since `ν_ji = −ν_ij`, the number `⟨v_i − v_j, ν_ij⟩` does not change when `i` and `j` are exchanged, so `∂^±(j, i) = ∂^±(i, j)`: a boundary piece is determined by the unordered pair `{i, j}` and the sign.

API:

- `ν_ji = −ν_ij`, `|ν_ij| = 1`, and on `E`, `ν_ij = (x_i − x_j)/ε`.
- `∂^±(j, i) = ∂^±(i, j)`; pieces with different unordered pairs or with opposite signs are disjoint; every piece is disjoint from `𝒟` and null; the configurations of `𝒟̄` whose contact pairs are not a matching form a null set.
- Contacts, contact normals and boundary pieces are equivariant under relabelling and invariant under common translations.

**Checks.**

- Unit torus, ε = 0.3: `x_i = π(0.1, 0)`, `x_j = π(0.8, 0)` are in contact with `ν_ij = (1, 0)`; the difference of representatives `(−0.7, 0)` would give the wrong direction and length.
- On `E`: three positions `0`, `(1, 0)`, `(−1, 0)` with ε = 1 have contact pairs `{1, 2}` and `{1, 3}`, which share particle 1 and are not a matching.
- The configuration with `x_i = (1, 0)`, `x_j = 0`, `v_i = (1, 0)`, `v_j = 0` is in `∂^+(i, j)`; with `v_i = (−1, 0)` it is in `∂^−(i, j)`; with `v_i = (0, 1)` it is grazing and in neither.
- The order of the pair does not matter: on `E` with ε = 1, `x_1 = (1, 0)`, `x_2 = 0`, `v_1 = (1, 0)`, `v_2 = 0`, one has `⟨v_1 − v_2, ν_12⟩ = ⟨(1, 0), (1, 0)⟩ = 1` and `⟨v_2 − v_1, ν_21⟩ = ⟨(−1, 0), (−1, 0)⟩ = 1`, so the state lies in `∂^+(1, 2)` and in `∂^+(2, 1)`, which are one piece, and in neither `∂^−(1, 2)` nor `∂^−(2, 1)`. Indexing the pieces by ordered pairs and declaring all of them pairwise disjoint would be refuted by this state.

*Needs:* §1.1, §1.2, §3.1, Mathlib `MeasureTheory.Measure.addHaar_sphere`.

### 3.3 Contact scattering and time reversal

Define the contact scattering `HardSphere.contactScatter ε Z = σ_M(X, V)`: when the contact pairs of `X` form a matching `M`, it replaces the velocity of each particle `i` by `v_i + Σ_j (σ_{ν_ij}(v_i, v_j)₁ − v_i)`, the sum over the contact partners `j` of `i`, of which the matching allows at most one; so the velocity of a particle `i` with a contact partner `j` becomes the first component of `σ_{ν_ij}(v_i, v_j)` (so that the pair `(v_i, v_j)` becomes `σ_{ν_ij}(v_i, v_j)`, by `ν_ji = −ν_ij` and `σ_{−ν} = σ_ν`), leaves every other particle (its sum is empty) and every position unchanged, and it is the identity when the contacts are not a matching and when there is no contact; define the reversal `HardSphere.reversal ε Z = ℛ(X, V) = (X, −σ_M V)` (GST2013 lines 1219–1227, the pre-image of a post-collisional configuration). For every ε, `σ_M` is an involution of the velocities at fixed positions: when `0 < ε < ρ` the contact normals are unit vectors and each `σ_ν` is an involution, and when ε ≤ 0 or ε ≥ ρ the short lift of a contact difference is 0 (no lift of norm `ε ≥ ρ` lies in `B(0, ρ)`), the normal is 0 and `σ_0` is the identity.

API:

- `σ_M` and `ℛ` are involutions of `𝒟̄`, commute with relabelling, and preserve `λ_N`; `ℛ` agrees with `(X, V) ↦ (X, −V)` outside a null set, since `σ_M` moves velocities only at configurations with a contact pair, which lie in the finite union of the sets `{‖x_i − x_j‖ = ε}`, null by Fubini because spheres of radius `ε < ρ` are null (§1.1).
- `σ_M` exchanges `∂^+(i, j)` and `∂^−(i, j)`; `ℛ` maps `∂^+(i, j)` to itself.

**Checks.**

- On `E`, ε = 1, `x_1 = (1, 0)`, `x_2 = 0`, `V = ((1, 0), 0)` (outgoing): `σ_M V = (0, (1, 0))` and `ℛ(X, V) = (X, (0, (−1, 0)))`, again outgoing.
- With no contact, `ℛ(X, V) = (X, −V)`.
- Non-example: `(X, V) ↦ (X, −V)` sends the outgoing state above to the incoming state `((−1, 0), 0)`, which is not a state of any right-continuous trajectory.

*Needs:* §1.1, §2.1, §3.2.

### 3.4 Free transport

Define the free flow `HardSphere.freeFlow t Z = S_t(X, V) = (X + π(t V), V)` on `(X × E)^N`, componentwise (GST2013 lines 836–837; BGSS2023 lines 122–123).

API:

- `S_0 = id`, `S_{s+t} = S_s ∘ S_t`, `(t, Z) ↦ S_t Z` is continuous, and `S` is a `Flow` on `(X × E)^N`.
- Each `S_t` preserves `λ_N` and commutes with relabelling and with the common translations `A_y(X, V) = (X + y, V)`, `y ∈ X` (every position moved by `y`). The Galilean boost `B_c(X, V) = (X, V + c)`, `c ∈ E`, does not commute with `S_t`; it satisfies `S_t ∘ B_c = A_{π(t c)} ∘ B_c ∘ S_t`, the free case of the boost of trajectories in §5.3.
- On `E^N × E^N`, `S` is `TauCeti.flowOfLipschitz` of the vector field `(X, V) ↦ (V, 0)`.
- `S_t` does not preserve `𝒟̄` in general.

**Checks.**

- Unit torus, d = 2: `S_1(π 0, e_1) = (π 0, e_1)`.
- On `E`: `S_2(0, (1, 0)) = ((2, 0), (1, 0))`.
- Non-example for `𝒟̄`: on `E`, positions `(2, 0)`, `0` with velocities `(−1, 0)`, `0` and ε = 1 leave `𝒟̄_2` at time `t = 1.5`, where the distance is 0.5.
- The boost needs the position correction: one particle on `E` with `d = 1`, `x = v = 0`, `t = c = 1` gives `S_1 B_1(0, 0) = (1, 1)` but `B_1 S_1(0, 0) = (0, 1)`; the corrected right side `A_1 B_1 S_1(0, 0) = (1, 1)` agrees.

*Needs:* §1.1, §1.2, §3.1, Mathlib `Flow`, `MeasureTheory.MeasurePreserving`, Tau Ceti `TauCeti.flowOfLipschitz`.

### 3.5 Collision invariants of configurations

Define the total momentum `P(V) = Σ_i v_i` and the kinetic energy `H(V) = ½ Σ_i |v_i|²` of a configuration `(X, V)`.

API:

- The contact scattering `σ_M` of §3.3 preserves `P` and `H`, being the scattering map on each contact pair, which conserves momentum and energy (GST2013 (2.1.3), lines 396–399); the free flow `S_t` of §3.4 does not change velocities and preserves both.
- The reversal `ℛ` of §3.3 preserves `H` and reverses `P`: `P(−σ_M V) = −P(V)`.
- For every `R ≥ 0` the velocity ball `{|V|² ≤ R²}` is preserved by `σ_M`.

**Checks.**

- At the witness of §2.1 the momentum `(0.9, 0.9)` and energy `0.81` are unchanged.
- The free flow changes positions but not `P` or `H`.
- Non-example: the separate reflection of §2.1 preserves `H` but not `P`.
- Reversal: at the outgoing contact state of §3.3 (ε = 1, `x_1 = (1, 0)`, `x_2 = 0`, `V = ((1, 0), 0)`), `P = (1, 0)` and `H = ½`; the reversed velocities `(0, (−1, 0))` have `P = (−1, 0)` and `H = ½`. The map `(X, V) ↦ (X, σ_M V)` without the sign keeps `P = (1, 0)` there (`σ_M V = (0, (1, 0))`), so the sign in `ℛ` is what reverses the momentum.

*Needs:* §2.1, §3.3, §3.4.

### Examples

For `N = 1` everything reduces to free transport; for `N = 2` on `E` the contact set is the cylinder `{|x_1 − x_2| = ε}`.

### Dependencies

Layers 1–2; Mathlib (relabelling of product measures, null spheres, `Flow`, `MeasureTheory.MeasurePreserving`); Tau Ceti `TauCeti.flowOfLipschitz` (§3.4).

## Layer 4: The two-body problem

Throughout this layer `a ∈ E` is a relative position with `|a| ≥ ε` and `u ∈ E` a relative velocity. The relative motion of two hard spheres is a point particle reflected at the sphere of radius ε; Layer 6 uses it for each pair of particles through the short lift.

### 4.1 Collision time

Define `D(a, u) = ⟨a, u⟩² − |u|²(|a|² − ε²)` and, when `⟨a, u⟩ < 0` and `D ≥ 0`, the collision time `τ(a, u) = (−⟨a, u⟩ − √D)/|u|²`.

API:

- For `|a| ≥ ε`, `⟨a, u⟩ < 0` and `D ≥ 0`, `τ(a, u)` is the least `s ≥ 0` with `|a + s u| = ε`, and at the contact point `q = a + τ u` one has `⟨q, u⟩ = −√D`; so the collision is non-grazing exactly when `D > 0`.
- No contact occurs at any time `s ≥ 0` when `⟨a, u⟩ ≥ 0` and `|a| > ε`, or when `D < 0`.
- `τ` is smooth on the open set `{|a| > ε, ⟨a, u⟩ < 0, D > 0}`.
- Separation: if `⟨a, u⟩ ≥ 0` then `s ↦ |a + s u|` is nondecreasing on `[0, ∞)`, so after an outgoing collision two particles never meet again under free motion (GST2013 lines 846–847 and 1210–1216).

**Checks.**

- ε = 1, `a = (2, 0)`, `u = (−1, 0)`: `D = 1`, `τ = 1`, `q = (1, 0)`, `⟨q, u⟩ = −1`.
- Grazing: `a = (1, 3)`, `u = (0, −1)`: `D = 0`, tangent contact at `q = (1, 0)` at time 3.
- Miss: `a = (2, 3)`, `u = (0, −1)`: `D = −3 < 0`, no contact.
- The larger root `(−⟨a, u⟩ + √D)/|u|²` is the exit time of the straight line from the ball and is not a collision: at `a = (2, 0)`, `u = (−1, 0)` it is 3, where the line would be at `(−1, 0)` after crossing the ball.

*Needs:* Mathlib `EuclideanSpace`.

### 4.2 The two-body map

Define `B_s(a, u)` for `s ≥ 0` on `{|a| ≥ ε}`: if a non-grazing collision occurs at `τ ≤ s`, then `B_s(a, u) = (q + (s − τ) R_q u, R_q u)` with `R_q u = u − 2⟨u, q/ε⟩ q/ε`; otherwise `B_s(a, u) = (a + s u, u)`. This is the relative part of the two-particle dynamics under the right-continuous convention (GST2013 lines 842–847; BGSS2023 lines 133–136).

API:

- `B_s` maps `{|a| ≥ ε}` into itself and preserves `|u|`; `B_0` is the identity off the incoming contact states.
- `B_{s+r} = B_r ∘ B_s` for `s, r ≥ 0` off the incoming contact states.
- Reversal: if `(b, u') = B_s(a, u)` with `|a| > ε` and no contact at time `s`, then `B_s(b, −u') = (a, −u)`.
- With `a` and `u` the relative position and velocity of particles `i, j`, the velocities after the collision are `σ_{q/ε}(v_i, v_j)`, and `v_i + v_j` is unchanged.

**Checks.**

- ε = 1, `a = (2, 0)`, `u = (−1, 0)`, `s = 3`: `B_3 = ((3, 0), (1, 0))`, while free motion would give `(−1, 0)`.
- Oblique: `a = (3, 0.6)`, `u = (−1, 0)`: `D = 0.64`, `τ = 2.2`, `q = (0.8, 0.6)`, `R_q u = (0.28, 0.96)` of norm 1; the naive rule `u ↦ −u` gives `(1, 0)`.
- Non-example: continuing the reflected line from the initial point, `a + s R_q u`, instead of from the contact point gives `(5, 0) ≠ (3, 0)` in the head-on case.

*Needs:* §2.1, §4.1.

### 4.3 The collision map and its Jacobian

On the open set `U = {|a| > ε, ⟨a, u⟩ < 0, D > 0}` define the collision map `C(a, u) = (a + τ(u − R_q u), R_q u)`, with `q = a + τ u` the contact point of §4.1 and `R_q` the reflection of §4.2.

API:

- `B_s = S_s ∘ C` on `U ∩ {τ < s}`, with `S_s(a, u) = (a + s u, u)`.
- `C` is smooth on `U`, and `det DC(a, u) = 1` at every point of `U`.
- For each fixed `s ≥ 0`, the derivative of `(a, u) ↦ B_s(a, u)` with `s` held fixed has determinant 1 on `U ∩ {τ < s}` (statement used in GST2013 line 883; DengHaniMa2024 lines 186–187).

Route for the determinant: with `w = da + τ du` and `(Y, U') = C(a, u)`, the combination `dY + τ dU'` of the two differentials, with τ held at its value at the point, is `R_q w`: since `Y + τ U' = q` and differentiating `|q|² = ε²` gives `dτ = −⟨q, w⟩/⟨q, u⟩`, one has `dY + τ dU' = w + (u − R_q u) dτ = w − 2⟨q, w⟩q/ε²`; the differential of `U'` is `R_q du` plus a term depending only on `w`; in the coordinates `(w, du)` and `(dY + τ dU', dU')`, obtained by shears of determinant 1, the Jacobian is block lower triangular with diagonal blocks `R_q, R_q`, whose determinant is `(det R_q)² = 1` (`Matrix.det_fromBlocks_zero₁₂`). The fixed-time statement follows, `B_s = S_s ∘ C` there and the shear `S_s` having determinant 1.

**Checks.**

- At `a = (2, 0)`, `u = (−1, 0)`, ε = 1: `C(a, u) = (0, (1, 0))` and `S_3 C(a, u) = ((3, 0), (1, 0)) = B_3(a, u)`.
- Explicit derivative: at ε = 1, `a = (2, 0)`, `u = (−1, 0)`, in the coordinate order `(a_1, a_2, u_1, u_2)`, one has `dτ = da_1 + du_1`, `dq = (0, da_2 + du_2)`, and `DC` has rows `(−1, 0, 0, 0)`, `(0, −1, 0, −2)`, `(0, 0, −1, 0)`, `(0, 2, 0, 3)`, of determinant `(−1)(−1)(−1 · 3 + 2 · 2) = 1`; with `s = 3` fixed, `DB_3 = DS_3 · DC` with `DS_3` the shear of determinant 1, so `det DB_3 = 1`.
- The time must be fixed when differentiating: in d = 1 with ε = 1, on `{a > 1, u < 0}` the collision time is `τ = (a − 1)/(−u)`, the fixed-time map is `B_s(a, u) = (2 − a − s u, −u)` where `τ < s`, with determinant 1, but the variable-time map `(a, u) ↦ B_{τ(a, u) + 0.7}(a, u) = (1 − 0.7 u, −u)` has determinant 0.
- Non-example: the reflection of the velocity alone, `(a, u) ↦ (a, R_q u)` with `q` frozen, has determinant −1; the position correction `τ(u − R_q u)` is what restores orientation.

*Needs:* §4.1, §4.2, Mathlib `Matrix.det_fromBlocks_zero₁₂`.

### 4.4 Measure preservation of the two-body map

Prove that for every `s ≥ 0`, `B_s` is measure preserving from `vol ⊗ vol` restricted to `{|a| ≥ ε}` to itself, and is injective off the null set of incoming contact states. Route: split `{|a| > ε}` into `U_s = U ∩ {τ < s}`, the set `V_s` with no contact in `[0, s]`, and a null remainder (grazing data, contact exactly at time `s`); `B_s = S_s ∘ C` on `U_s` and `B_s = S_s` on `V_s` are injective with Jacobian determinant 1, so `vol(B_s(A)) = vol(A)` for measurable `A` inside either piece by `MeasureTheory.lintegral_abs_det_fderiv_eq_addHaar_image`; the images are disjoint (characterised by whether the backward free path meets the sphere within time `s`) and cover the target up to the reversal of the null remainder (statement used in GST2013 line 883; DengHaniMa2024 Proposition 1.2(3), lines 186–187).

**Checks.**

- `d = 1`, ε = 1, `s = 4`: on the rectangle `a ∈ (2, 3)`, `u ∈ (−1, −1/2)`, of area `1/2`, every state collides (`D = u² > 0`) before time 4, since `τ = (a − 1)/(−u) < 2/(1/2) = 4`, and `B_4(a, u) = (1 + (4 − τ)(−u), −u) = (2 − a − 4u, −u)`, an affine map of determinant `(−1)(−1) = 1`; its image, inside `{a > 1}` because `2 − a − 4u > 2 − 3 + 2 = 1`, again has area `1/2`. The totally inelastic rule below sends the whole rectangle to the single state `(1, 0)`, of area 0.
- Grazing data `D = 0` form a null set: for fixed `u ≠ 0` it is the cylinder `{|a − ⟨a, û⟩û| = ε}`.
- Non-example: the totally inelastic rule, which replaces the relative velocity at contact by its tangential part `u − ⟨u, q/ε⟩q/ε`, sends the colliding states of `U_s` (a set of positive measure) into the set of states `(q + r u_t, u_t)` with `|q| = ε` and `u_t ⊥ q`, which has dimension `2d − 1` and is null.

*Needs:* §4.1–4.3, Mathlib `MeasureTheory.lintegral_abs_det_fderiv_eq_addHaar_image`, `MeasureTheory.Measure.addHaar_sphere`, `MeasureTheory.Measure.addHaar_submodule`.

### 4.5 Pair maps in the N-particle phase space

For `i ≠ j`, `R ≥ 0` and `s ≥ 0`, define the pair map `P^{ij}_s` on configurations with `ε ≤ ‖x_i − x_j‖`, `‖x_i − x_j‖ + 2 R s < ρ` and `|v_i|, |v_j| ≤ R`: write `a = ℓ(x_i − x_j)`, `u = v_i − v_j`, `w = v_i + v_j`, apply `B_s` to `(a, u)`, keep `w`, move `x_j` by `π` of the time integral of its velocity, and fix every other coordinate `z_k`, `k ∉ {i, j}`.

API:

- The pair map changes only the pair block `(z_i, z_j)`, so pair maps of disjoint pairs commute, and free transport of the remaining particles is not part of it.
- In the coordinates `(x_j, a, u, w)` the map is the skew product `(x_j, a, u, w) ↦ (x_j + π(h(a, u, w)), B_s(a, u), w)` times the identity on the other coordinates, where `h(a, u, w)` is the time integral of the velocity of particle `j`; hence, by Fubini, the translation invariance of μ_X and §4.4, it is measure preserving from `λ_N` restricted to its domain onto `λ_N` restricted to its image, and injective off a null set (the pair step of GST2013 lines 875–887).

**Checks.**

- On `E` with the head-on witness of the Conventions, `P^{12}_3` sends `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0` to `x_1 = (1, 0)`, `x_2 = (−2, 0)`, `v_1 = 0`, `v_2 = (−1, 0)`.
- On the unit torus, ε = 0.3, the pair `π(0.1, 0)`, `π(0.8, 0)` with relative velocity `(−1, 0)` collides at once through the short lift `a = (0.3, 0)`.
- The linear change `(v_i, v_j) ↦ (u, w)` has determinant `2^d`; it is applied at the source and inverted at the target, so the factors cancel, and the position change `(x_i, x_j) ↦ (x_j, ℓ(x_i − x_j))` is measure preserving on `{‖x_i − x_j‖ < ρ}` by the local axiom of §1.1.
- Other particles are not moved: for `N = 3` on `E`, d = 1, the map `P^{12}_1` with `ε = R = 1` sends positions `0, 2, 20` with velocities `0.1, 0.1, 0.1` to `0.1, 2.1, 20`; the third particle stays at 20.

*Needs:* §1.1, §3.4, §4.4.

### Examples

The two-body problem in relative coordinates is the billiard outside the ball of radius ε; a pair on the torus uses the same map through the short lift as long as its separation stays below ρ.

### Dependencies

Layers 1–3; Mathlib (Euclidean space, block determinants, the Lebesgue change of variables, null spheres and proper subspaces).

## Layer 5: Hard-sphere trajectories

### 5.1 Trajectories

Define `HardSphere.IsTrajectory ε J Z` for a set of times `J ⊆ ℝ` (an interval in every use) and a path `Z = (X, V) : ℝ → (Fin N → X × E)` as the conjunction of seven conditions: (1) for `t ∈ J`, `Z(t) ∈ 𝒟̄^ε_N`; (2) positions satisfy `x_i(t) = x_i(s) + π(∫_s^t v_i)` for `s ≤ t` in `J`; (3) there is a set `𝒯 ⊆ J` meeting every bounded interval in a finite set such that `V` is constant on every subinterval of `J` disjoint from `𝒯`; (4) at every `t ∈ J` the contact pairs of `X(t)` form a matching; (5) at every `t ∈ J` each contact pair `{i, j}` is outgoing for `V(t)`, `⟨v_i − v_j, ν_ij⟩ > 0`; (6) the state is right-continuous within `J`: at each `t ∈ J`, `Z(t') → Z(t)` as `t' → t` through `J ∩ (t, ∞)`, a vacuous condition at a greatest element of `J`; (7) at each `t ∈ J`, `Z(t') → σ_M Z(t) = HardSphere.contactScatter ε (Z t)` as `t' → t` through `J ∩ (−∞, t)`, a vacuous condition at a least element of `J`. Since positions are continuous by (2) and `σ_M` is an involution of the velocities at fixed positions (§3.3), condition (7) says that `V(t) = σ_M V(t−)`, where `V(t−)` is the left limit within `J`. The values of `Z` outside `J` are not constrained (GST2013 lines 836–847; BGSS2023 lines 122–131; DengHaniMa2024 lines 140–172).

API:

- Restriction to subintervals, translation in time, and positions continuous with velocities piecewise constant; the left limit `V(t−)` within `J` exists at every `t ∈ J` other than a least element of `J`.
- Conservation: `P(V(t))` and `H(V(t))` are constant on `J`.
- Free motion between contacts: on an interval free of contact times, `Z(t) = S_{t−s} Z(s)`.

**Checks.**

- `N = 1`: `t ↦ S_t Z_0` is a trajectory on ℝ.
- The head-on witness of the Conventions is a trajectory on ℝ with the single contact time 1, and `𝒯 = {1}`: `V` is `((−1, 0), 0)` on `(−∞, 1)` and `(0, (−1, 0))` on `(1, ∞)`. It takes two values on `ℝ ∖ {1}`, so the velocity is constant on each subinterval free of contact times, not on the complement of the contact times; the latter reading would exclude every trajectory with a collision.
- Non-example: free motion through the contact (`x_1(t) = (2 − t, 0)` for all `t`) leaves `𝒟̄_2` after time 1.
- Non-example: the same path with left-continuous velocities (`V(1) = ((−1, 0), 0)`) violates the outgoing condition at time 1.

*Needs:* §3.1–3.5.

### 5.2 Uniqueness and gluing

Prove `HardSphere.IsTrajectory.eqOn`: for every real ε and every interval `J` (an order-connected set), two trajectories on `J` that agree at one time `t₀ ∈ J` agree on `J`. Route: let `t*` be the supremum of the times `t ≥ t₀` of `J` up to which the two agree. Positions agree at `t*` by continuity (condition (2)); if `t* > t₀` the left limits at `t*` agree, so condition (7) gives `σ_M V(t*) = σ_M V'(t*)` and the velocities agree, `σ_M` being injective at fixed positions (§3.3). If `t*` is not the largest element of `J`, a short interval `(t*, t* + η)` of `J` avoids both sets `𝒯` of condition (3); both velocities are constant there and equal to their values at `t*` by condition (6), so both paths are free motion from the same state, contradicting maximality. Backward, symmetrically, at the infimum `t_*` the states agree by condition (6), and on a short interval `(t_* − η, t_*)` both velocities are constant and equal to the velocity part of `σ_M Z(t_*)` by condition (7), which determines the positions there by condition (2). The outgoing condition (5) is not used. Prove gluing: trajectories on `[a, b]` and `[b, c]` agreeing at `b` form a trajectory on `[a, c]`. Uniqueness at every initial state, for every real ε and every interval, and gluing are proved here from the definition of §5.1 and are stated in none of the sources: DengHaniMa2024 Proposition 1.2, lines 182–183, gives existence and uniqueness only off a closed Lebesgue-null set of initial data, on Euclidean space with `d ≥ 2`, and GST2013 lines 848–854 describe the pathological trajectories (multiple or grazing collisions, infinitely many collisions in finite time) without a uniqueness statement.

**Checks.**

- For `N = 1` uniqueness is uniqueness of free motion.
- The interval hypothesis is needed: for `N = d = 1` on `E` and `J = [0, 1] ∪ [2, 3]`, the path at rest at `0` for all times and the path at rest at `0` on `(−∞, 1]`, moving with velocity 5 on `(1, 2)` and at rest at `5` from time 2 on, are both trajectories on `J` (condition (2) only links times of `J`, through the values on `(1, 2)`, which are otherwise free), agree at `t₀ = 0`, and differ at time 2.
- Two trajectories from the outgoing contact state `x_1 = (1, 0)`, `x_2 = 0`, `v_1 = 0`, `v_2 = (−1, 0)` on `[0, 2]` both give `x_2(2) = (−2, 0)`.
- Gluing at the head-on witness: the trajectory on `[0, 2]` and the trajectory on `[1, 3]` from the time-1 state agree on `[1, 2]` and glue to the trajectory on `[0, 3]` ending at `x_1 = (1, 0)`, `x_2 = (−2, 0)`.
- The proof does not use the outgoing condition, which only excludes grazing contacts: the same argument gives uniqueness for the weaker notion that admits grazing contacts (σ fixes grazing pairs), for instance for the two-body path tangent to the sphere at `q = (1, 0)` in §4.1.

*Needs:* §2.1, §3.3, §5.1.

### 5.3 Symmetries of trajectories

Prove that trajectories are carried to trajectories by: time translation `t ↦ Z(t + c)`; time reversal `t ↦ ℛ(Z(−t))` on `−J`; relabelling by a permutation of `Fin N`; translation of all positions by `π(c)`; and the Galilean boost `(X(t), V(t)) ↦ (X(t) + π(t c), V(t) + c)`. Time translation and time reversal hold for every real ε: conditions (1)–(7) of §5.1 are invariant under translation of time; for `0 < ε < ρ` the reversal uses that `σ_M` is linear in the velocities, is an involution and exchanges incoming and outgoing pairs, so that the contacts of `ℛ(Z(−t))` are outgoing and conditions (6) and (7) of `Z` give conditions (7) and (6) of the reversed path; for ε ≤ 0 and ε ≥ ρ every contact normal is 0 (for ε < 0 no pair is in contact), so condition (5) excludes contacts, `σ_M` is the identity, ℛ is `(X, V) ↦ (X, −V)`, and the reversed path is again a free motion without contacts. The relabelling statement is the indistinguishability of the particles (GST2013 (1.1.1), lines 211–215; BGSS2023 lines 184–187). Time reversal, common translations and boosts are consequences proved here from the definition of §5.1 and the identities of the scattering map and the contact scattering (§2.1: `σ_{−ν} = σ_ν` and Galilean invariance; §3.2: contacts are invariant under common translations; §3.3: `σ_M` is an involution exchanging incoming and outgoing pairs), whose input is the reflection law GST2013 (4.1.1)–(4.1.2), lines 835–847, printed p. 27.

**Checks.**

- Reversing the head-on witness gives positions `(1, 0)`, `(−2, 0)` at time −3 with velocities `0`, `(1, 0)`, which collide at time −1 and return to `(2, 0)`, `0` at time 0 with velocities `(1, 0)`, `0`.
- A boost by `c = (1, 0)` of the head-on witness gives the collision of velocities `0` and `(1, 0)`, still at time 1.
- Non-example: `t ↦ (X(−t), −V(−t))` without `σ_M` has left-continuous velocities and is not a trajectory.

*Needs:* §2.1, §3.2, §3.3, §5.1.

### 5.4 The left-continuous convention

For a trajectory `Z` on `J` write `M(t)` for the contact matching of `X(t)` and define the incoming path `Y(t) = (X(t), σ_{M(t)} V(t))` for `t ∈ J`.

API:

- The contact times of `Z` are finite in every bounded subinterval of `J`: a contact time `t` other than a least element of `J` lies in the set `𝒯` of §5.1, since otherwise `V` is constant near `t`, the contact pair is outgoing for `V(t)`, and the two spheres would overlap just before `t`.
- The velocities of `Y` are left-continuous within `J` and constant on every subinterval of `J` that contains no contact time of `Z`.
- At every `t ∈ J` other than a least element of `J`, `σ_{M(t)} V(t) = V(t−)`, the left limit within `J`; at a least element `t₀` of `J` the incoming state is by definition `Y(t₀) = (X(t₀), σ_{M(t₀)} V(t₀))`, and no left limit of the values of `Z` outside `J` enters. For a trajectory on ℝ the identity `Y(t) = (X(t), V(t−))` therefore holds at every `t`.
- The contact pairs of `X(t)` are incoming for the velocities of `Y(t)`, and at every `t ∈ J` other than a greatest element, the right limit within `J` of the velocities of `Y` is `σ_{M(t)}` applied to the velocities of `Y(t)`.
- Converse: a path on `J` with values in `𝒟̄` on `J`, positions as in §5.1, velocities left-continuous within `J` and constant on every subinterval of `J` disjoint from some set `𝒯 ⊆ J` that is finite in every bounded subinterval of `J`, whose contact pairs at every time form a matching and are incoming for its velocities, and whose velocities have right limit within `J` equal to `σ_{M(t)}` of their value at every `t ∈ J` other than a greatest element, is carried to a trajectory on `J` by the same map, `σ_M` being an involution.
- Comparison: on `X = E` with `d ≥ 2` and `J = [0, ∞)` or `J = [0, T]`, the Euclidean setting of DengHaniMa2024 Definition 1.1 (lines 140–172, on the domain of lines 150–153), `Y` is the hard-sphere dynamics of that definition started from the incoming initial state `Y(0) = (X(0), σ_{M(0)} V(0))`, and a dynamics in the sense of that definition with the properties of the converse comes from a trajectory by the same map.

**Checks.**

- At the head-on witness, the left-continuous state at time 1 is `v_1 = (−1, 0)`, `v_2 = 0`; the velocities of `Y` are `((−1, 0), 0)` on `(−∞, 1]` and `(0, (−1, 0))` on `(1, ∞)`, constant on each subinterval free of the contact time 1 and different on its two sides.
- Off contact times both conventions agree.
- Applying the map twice returns the right-continuous path, since `σ_M` is an involution.
- Only the values on `J` count: for `N = 1`, d = 2, `J = [0, 1]`, the path with `x(t) = 0` for all `t`, `V(t) = 0` for `t ≥ 0` and `V(t) = e_1` for `t < 0` is a trajectory on `J`; at `t = 0` the incoming state has velocity `σ_M V(0) = 0`, while the left limit of the path from outside `J` is `e_1`; at every `t ∈ (0, 1]` the velocity `σ_M V(t)` and the left limit within `J` are both 0.
- The initial datum of DengHaniMa2024 Definition 1.1 is the incoming state: for ε = 1 the outgoing contact state `x_1 = (1, 0)`, `x_2 = 0`, `v_1 = 0`, `v_2 = (−1, 0)` of a trajectory at time 0 corresponds to the datum `v_1 = (−1, 0)`, `v_2 = 0`, which that definition scatters at `0+` back to `0`, `(−1, 0)`; started from the outgoing state itself, that definition would scatter it at `0+` into `(−1, 0)`, `0`, and the spheres would overlap at every small `t > 0`, at distance `1 − t`.

*Needs:* §1.2, §3.3, §5.1.

### 5.5 Good configurations

Define `HardSphere.goodSet ε N` as the set `G` of `Z ∈ 𝒟̄^ε_N` such that some trajectory on ℝ passes through `Z` at time 0.

API:

- For every real ε, `G` is invariant under trajectories (if a trajectory on ℝ passes through a point of `G`, all its values lie in `G`) and under the reversal ℛ, by §5.3.
- `G` is invariant under relabelling, common translations of positions and Galilean boosts (§5.3).
- `G` contains `𝒟̄_N` for `N ≤ 1`.
- Its complement in `𝒟̄` consists of two kinds of data: the contact states with an incoming pair, which the outgoing condition of §5.1 excludes (the domain of GST2013, line 841, is open and has no contact states); and the data whose motion, forward or backward in time, is pathological in the sense of GST2013 lines 851–854, that is, at some time, time 0 included, it reaches a grazing contact or a contact of one particle with two others, or it has infinitely many contact times in a bounded interval.

**Checks.**

- `N = 2` on `E`: `𝒟̄_2 ∖ G` is the union of `{u ≠ 0, D(a, u) = 0}` (the line of relative motion is tangent to the sphere at some time) and of the contact states with `⟨a, u⟩ ≤ 0`. The tangency may lie in the past: at ε = 1, `a = (−2, 1)`, `u = (−1, 0)` has `⟨a, u⟩ = 2 > 0`, so no contact at any positive time, and `D = 4 − (5 − 1) = 0`, a grazing contact at time `−2` at `a − 2u = (0, 1)`; this state is not in `G` although its forward motion is free, so the pathologies of both time directions count.
- At ε = 1, the incoming contact state `x_1 = (1, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0` (the Scattering witness of the Conventions, `⟨v_1 − v_2, ν_12⟩ = −1`) is not in `G`, since no trajectory has an incoming contact; its scattered state, the outgoing contact state `v_1 = 0`, `v_2 = (−1, 0)` of §5.2 at the same positions (`⟨v_1 − v_2, ν_12⟩ = 1`), is in `G`: it is the time-1 state of the head-on witness of the Conventions, whose trajectory is defined on ℝ.
- A configuration with a triple contact (three spheres pairwise touching in d = 2, positions forming an equilateral triangle of side ε) is not in `G`.

*Needs:* §4.1, §5.1–5.3.

### Examples

For `N = 2` the trajectory through a good configuration is explicit: the centre of mass moves freely and the relative motion is `B_t` forward and its reversal backward.

### Dependencies

Layers 1–4.

## Layer 6: Alexander's theorem

### 6.1 The near-triple estimate

Prove: let `0 < ε`, `η > 0` with `ε + η < ρ`, `R > 0`, `K ⊆ X` measurable, and let `I` be the set of `Z ∈ 𝒟̄^ε_N` with all positions in `K`, `|V| ≤ R`, and distinct `i, j, k` with `‖x_i − x_j‖ ≤ ε + η` and `‖x_i − x_k‖ ≤ ε + η`. Then `λ_N(I) ≤ N³ μ_X(K)^{N−2} (ω_d((ε + η)^d − ε^d))² vol(B^{dN}_R)` (GST2013 Lemma 4.1.1, lines 864–874). Route: Fubini over `x_j` and `x_k` in shells around `x_i` (§1.4).

**Checks.**

- `N = 2`: there is no triple of distinct indices, so `I = ∅` and the bound holds trivially.
- The bound is of order `η²`: a single near pair has measure of order `η`, e.g. the shell `1 ≤ |x_1 − x_2| ≤ 1 + η` in d = 2 has area `π(2η + η²)`.
- On the unit torus with `K = X`, the factor `μ_X(K)` is 1.

*Needs:* §1.4, §3.1.

### 6.2 Short time steps

For `R > 0` and `0 < δ` with `ε + 4Rδ < ρ`, call a pair of particles at distance at most `ε + 2Rδ` a near pair (no other pair can come into contact within time δ, since relative speeds are at most `2R`), and let `S_{δ,R}` be the set of `Z ∈ 𝒟̄` with `|V| ≤ R`, no particle within `ε + 2Rδ` of two others, no contact state that is incoming or grazing, and no grazing collision in `[0, δ]` between near pairs. Define the step map `Φ_δ` on `S_{δ,R}` block by block: on the Borel piece of `S_{δ,R}` where the near pairs form a given matching `M` (finitely many pieces), it acts on the block `(z_i, z_j)` of each `{i, j} ∈ M` by the pair map `P^{ij}_δ` of §4.5 (a near pair has `ε ≤ ‖x_i − x_j‖`, `‖x_i − x_j‖ + 2Rδ ≤ ε + 4Rδ < ρ` and speeds at most `R`, so it lies in the domain of `P^{ij}_δ`) and on each particle `k` in no near pair by the one-particle free step `z_k ↦ (x_k + π(δ v_k), v_k)`. The blocks are disjoint, so these maps commute and each coordinate is moved exactly once.

API:

- The near pairs of a configuration of `S_{δ,R}` form a matching; on `[0, δ]` each near pair collides at most once and no other pair comes into contact.
- The step map gives the trajectory on `[0, δ]`: for `Z ∈ S_{δ,R}` there is a trajectory on `[0, δ]` through `Z` at time 0, and its value at time δ is `Φ_δ Z`.
- `Φ_δ` is injective on `S_{δ,R}` and measure preserving from `λ_N` restricted to `S_{δ,R}` onto `λ_N` restricted to `Φ_δ(S_{δ,R})`: on each piece `Φ_δ` is a product of measure-preserving block maps, and the images of distinct pieces are disjoint because `Φ_δ` is the time-δ map of trajectories and two trajectories on `[0, δ]` that agree at time δ agree at time 0 (§5.2).
- The complement of `S_{δ,R}` in `𝒟̄ ∩ {|V| ≤ R}` is `I` of §6.1 with `η = 2Rδ` (admissible there, since `ε + 2Rδ < ρ`) together with a null set: the incoming and grazing contact states lie in `𝒟̄ ∖ 𝒟`, null by §3.1, and the states with a grazing collision in `[0, δ]` between near pairs have grazing relative data, null by §4.4 in the pair coordinates of §4.5 (GST2013 lines 875–887).

**Checks.**

- With `N = 2` and the head-on witness, `Φ_δ` for δ = 3, `R = 1` and ε + 4Rδ < ρ = ∞ reproduces `B_3`.
- The hypothesis `ε + 4Rδ < ρ` is what the pair maps need, and `ε + 2Rδ < ρ` would not do: on the unit torus (ρ = 1/2) with ε = 0.3 and `R = 1`, the step δ = 0.09 has `ε + 2Rδ = 0.48 < ρ`, but a near pair at distance 0.47 would need `P^{ij}_δ` at separations up to `0.47 + 0.18 = 0.65 ≥ ρ`, outside its domain; the step δ = 0.045 has `ε + 4Rδ = 0.48 < ρ`, its near pairs are at distance at most 0.39, and `0.39 + 0.09 = 0.48 < ρ`.
- Velocities stay in `{|V| ≤ R}` across a step, since `H` is conserved.
- Without the three-particle exclusion the step map is not the dynamics: particle 1 can meet particle 2 and then particle 3 within the step.
- Block composition: on `E` with d = 1 (ρ = ∞), ε = R = δ = 1, positions `0, 2, 20, 22` and all velocities `0.1` give `|V| = 0.2 ≤ R`, near pairs `{1, 2}` and `{3, 4}` (distance 2 ≤ ε + 2Rδ = 3, all other distances at least 18) and no collision, so the configuration is in `S_{1,1}` and `Φ_1` gives positions `0.1, 2.1, 20.1, 22.1`, the trajectory at time 1. Composing two `N`-particle maps that each also free-transport the particles outside their pair would move every particle by `0.2`.

*Needs:* §3.1, §4.4, §4.5, §5.1, §5.2, §6.1.

### 6.3 Iteration

Prove, for `t > 0`, `R > 0`, a bounded `K ⊆ X` and every `δ > 0` with `ε + 4Rδ < ρ`: the set `F` of `Z ∈ 𝒟̄` with positions in `K` and `|V| ≤ R` that fail a step before time `t`, that is, for which some `j` with `0 ≤ j < t/δ` has `Φ_δ^i Z ∈ S_{δ,R}` for every `i < j` and `Φ_δ^j Z ∉ S_{δ,R}`, has measure at most `C(N, ε, R, K, t) δ`, with `C` independent of δ. Route: let `F_j ⊆ F` be the set failing first at step `j`, and `A_j` the image under `Φ_δ^j` of the configurations `Z ∈ 𝒟̄` with positions in `K` and `|V| ≤ R` that pass the steps `0, …, j − 1` (`Φ_δ^i Z ∈ S_{δ,R}` for `i < j`), so that `Φ_δ^j(F_j) = A_j ∖ S_{δ,R}`. By the injectivity and measure preservation of §6.2, `λ_N(F_j) = λ_N(A_j ∖ S_{δ,R})`. Velocities stay in `{|V| ≤ R}` and each particle moves at most `Rδ` in a step, so `A_j` lies in the set of configurations of `𝒟̄ ∩ {|V| ≤ R}` with positions in the closed `jRδ`-neighbourhood `K_j` of `K`, and `λ_N(F_j)` is at most the measure of the complement of `S_{δ,R}` in that set; this is an upper bound only, since `A_j` can be much smaller than that set. By §6.2 that complement is `I` of §6.1 for `K_j` and `η = 2Rδ` together with a null set, so with `K_t` the closed `Rt`-neighbourhood of `K` (bounded, and containing every `K_j` since `jδ < t`), `λ_N(F_j) ≤ N³ μ_X(K_t)^{N−2} (ω_d((ε + 2Rδ)^d − ε^d))² vol(B^{dN}_R) ≤ C₁ δ²` for `δ ≤ 1`, with `C₁ = N³ μ_X(K_t)^{N−2} (2R d ω_d (ε + 2R)^{d−1})² vol(B^{dN}_R)`. There are `⌈t/δ⌉ ≤ (t + 1)/δ` steps when `δ ≤ 1`, so `λ_N(F) ≤ (t + 1) C₁ δ`; when `δ > 1`, `λ_N(F) ≤ μ_X(K)^N vol(B^{dN}_R) δ`. Take `C` the larger of the two constants (the iteration of GST2013 lines 875–898, where `t/δ` is an integer, line 876).

**Checks.**

- On the unit torus with `K = X` every neighbourhood `K_j` is `X`, of mass 1, and the constant does not grow with `j`; for `K = {0}` the neighbourhood `K_0 = {0}` has mass 0 while `X` has mass 1, so the neighbourhoods are those of `K`, not all of `X`.
- The step-`j` bound is an inequality, not an equality: on `E` with d = 1, `N = 3`, ε = R = 1, δ = 2, `t = 3` and `K = {0}`, no configuration of `𝒟̄_3` has all positions in `K`, so `F_1 = ∅` and `λ_N(F_1) = 0`, while the configurations of `𝒟̄_3 ∩ {|V| ≤ 1}` with positions near `(−1.1, 0, 1.1)` lie in `K_1 = [−2, 2]` and in `I` (the middle particle is within `ε + 2Rδ = 5` of both others), a set of positive measure.
- On `E` with `K = B(0, r)` the neighbourhoods are `B(0, r + jRδ)`, contributing `(r + jRδ)^{d(N−2)}` as in GST2013 line 896.
- For `N = 2` the set `F` is null but not empty, and the bound is not sharp. Null: there is no triple of distinct indices, so `I = ∅` and only the null remainder of §6.2 fails a step. Not empty: on `E` with d = 2, ε = R = δ = 1, `t = 3` and `K = B(0, 3)`, the state `x_1 = (2, 1)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0` has relative data `a = (2, 1)`, `u = (−1, 0)` with `D = 4 − 4 = 0`, a grazing contact at time 2; it passes step 0 (the near pair grazes only at time 2 > δ) and fails step 1, where the pair, now at relative position `(1, 1)`, grazes at time 1 ≤ δ. The constant does not vanish: the factor `μ_X(K_t)^{N−2}` is 1, so `C ≥ (t + 1) C₁` with `C₁ = 8 (2R d ω_d (ε + 2R)^{d−1})² vol(B^{2d}_R)`, which is `8 (12π)² (π²/2) = 576π⁴ ≈ 56108` at d = 2, ε = R = 1: the inequality `λ_N(F) = 0 ≤ C δ` holds with a positive right side.

*Needs:* §6.1, §6.2.

### 6.4 Alexander's theorem

Prove `HardSphere.volume_hardCoreSet_diff_goodSet`: for `0 < ε < ρ`, `λ_N(𝒟̄^ε_N ∖ G) = 0`. Route: a configuration that passes all steps of size δ on `[0, t]` has a trajectory on `[0, t]`, obtained by gluing the step trajectories (§5.2, §6.2); by §6.3, for fixed `t, R, K` the configurations with positions in `K` and `|V| ≤ R` that have no trajectory on `[0, t]` fail some step for every δ, so their set has measure at most `C δ` for every δ with `ε + 4Rδ < ρ` and is null; take the countable union over `t, R` and an exhaustion of `X` by bounded sets, and apply the reversal ℛ for negative times: by §5.3 a configuration has a trajectory on `[−t, 0]` exactly when its image under ℛ has one on `[0, t]`, and ℛ is an involution of `𝒟̄` preserving `λ_N` (§3.3), so the configurations of `𝒟̄` with no trajectory on `[−t, 0]` form the image under ℛ of a null set, and are null. Also prove that `G` is a Borel set and that `(t, Z) ↦ Z(t)` is Borel measurable on `ℝ × G`: the configurations with a trajectory on `[0, t]` are exactly the union over `m` and `R` of those passing all `m` steps of size `t/m` with velocity bound `R`, a finite intersection of preimages of the Borel sets `S_{t/m,R}` under the Borel step compositions, and on each such set the trajectory map is a finite composition of Borel maps (GST2013 Proposition 4.1.1, lines 862–863, proof lines 875–910; BGSS2023 lines 132–139; DengHaniMa2024 Proposition 1.2, lines 182–188; Alexander1976 Proposition 4.3, pp. 217–232, cited as reference [2] in GST2013 line 855, identified in its bibliography at lines 5439–5440).

**Checks.**

- `N = 1`: `G` is everything.
- `N = 2` on `E`: the exceptional set is the union of §5.5, null because the cylinder `D = 0` and the contact set are null.
- On the unit torus the exhaustion is trivial (`K = X`), and only `t` and `R` vary.

*Needs:* §3.3, §5.2, §5.3, §5.5, §6.2, §6.3.

### Examples

The theorem holds verbatim on Euclidean space, on every flat torus, and in every dimension `d ≥ 1`; in dimension 1 a grazing contact is a pair of touching rods with equal velocities, and the exceptional set consists of the incoming contact states (touching rods approaching each other, such as `x_1 = 1`, `x_2 = 0`, `v_1 = −1`, `v_2 = 0` at ε = 1, the left limit at time 0 of the trajectory through its scattered state `v_1 = 0`, `v_2 = −1`, which has a single binary collision) and of the data whose motion, forward or backward in time, reaches a grazing contact or a contact of one rod with two others, or has infinitely many collisions in a bounded time interval.

### Dependencies

Layers 1 and 3–5.

## Layer 7: The hard-sphere flow

### 7.1 The flow

Define `HardSphere.flow ε t`, on `Fin N → X × E` for every `N`, as the map sending `Z ∈ G` to the value at time `t` of a trajectory on ℝ through `Z` at time 0, chosen by the axiom of choice (it is unique by §5.2), and fixing every `Z ∉ G` (GST2013 line 862; BGSS2023 lines 132–139; DengHaniMa2024 lines 173–178); then `T_0 = id` by definition. Prove `HardSphere.flow_add`: for every real ε, `T_{s+t} = T_s ∘ T_t` for all real `s, t`, on the whole phase space. Route: for `Z ∈ G` with chosen trajectory γ, the translate `γ(t + ·)` is a trajectory on ℝ through `T_t Z = γ(t)` (§5.3), so `T_t Z ∈ G`, and by uniqueness (§5.2) the chosen trajectory through `T_t Z` is that translate, whence `T_s(T_t Z) = γ(t + s) = T_{s+t} Z`; for `Z ∉ G` all three maps fix `Z`. Neither step uses `0 < ε < ρ`.

API:

- For every real ε, each `T_t` is a bijection with inverse `T_{−t}` (by `HardSphere.flow_add` and `T_0 = id`) preserving `G`, `𝒟̄` and their complements: `T_t` maps `G` into `G` by the time translation of §5.3, and fixes every point of `𝒟̄ ∖ G` and of the complement of `𝒟̄`.
- For every real ε and every `Z`, `t ↦ T_t Z` has continuous positions and right-continuous piecewise constant velocities (by §5.1 for `Z ∈ G`; constant otherwise).
- For `0 < ε < ρ`, `(t, Z) ↦ T_t Z` is measurable (`G` is Borel and the trajectory map is measurable on `ℝ × G`, §6.4).
- Free motion between contacts: `T_t Z = S_t Z`, with `S_t` the free flow of §3.4, for every `Z ∈ G` whose trajectory has no contact on the closed interval between 0 and `t` (§5.1); off `G` the flow is the identity, so the membership is needed.

That `T_t` is the identity extension of a conull flow in the sense of ClassicalErgodicTheory §3.5 item 1 needs the measure preservation and is proved in §7.2.

**Checks.**

- `N = 1`: `T_t = S_t`.
- Head-on witness: `T_3` sends `((2, 0), 0; (−1, 0), 0)` to `((1, 0), (−2, 0); 0, (−1, 0))`, and `T_{−3}` sends it back.
- Non-example: defining the flow as `S_t` on `𝒟̄` leaves `𝒟̄` (§3.4) and fails to preserve it.
- The free identification needs `Z ∈ G`: on `E`, d = 2, ε = 1, the state `x_1 = (2, 1)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0` has relative data `a = (2, 1)`, `u = (−1, 0)` with `D = 4 − 4 = 0`, a grazing contact at time 2, so it is not in `G`; there is no contact on `[0, 1]`, yet `T_1 Z = Z` keeps `x_1 = (2, 1)` while `S_1 Z` has `x_1 = (1, 1)`.
- The group law needs no hypothesis on ε. For ε = −1 no pair is ever in contact, every configuration lies in `𝒟̄` and in `G`, and `T_t = S_t`: on `E` with d = 1, `N = 2`, `x_1 = 1`, `x_2 = 0`, `v_1 = −1`, `v_2 = 0`, the rods pass through each other, `T_3 Z` has positions `−2`, `0`, and `T_1(T_2 Z)` gives the same. On the unit circle (d = 1, ρ = 1/2) with ε = 1/2 and `N = 2`, `𝒟̄_2` is the set of antipodal pairs; each is a contact whose short lift is 0 (no lift of norm 1/2 lies in `B(0, 1/2)`), so condition (5) of §5.1 reads `0 < 0` and fails, `G = ∅`, and every `T_t` is the identity, a group.

*Needs:* §3.4, §5.1, §5.2, §5.3, §5.5, §6.4.

### 7.2 Measure preservation

Prove `HardSphere.measurePreserving_flow`: for `0 < ε < ρ`, every `N` and every real `t`, `T_t` is measure preserving for `λ_N` and for `λ_N` restricted to `𝒟̄`. Prove also that the Borel set `G ∪ 𝒟̄ᶜ`, with the trajectory action on `G` and the identity on `𝒟̄ᶜ`, is a conull flow on `(Fin N → X × E, λ_N)` in the sense of ClassicalErgodicTheory §3.5 item 1, and that `G` with the trajectory action is one on `(Fin N → X × E, λ_N|𝒟̄)`; `T_t` is the identity extension of both. Route: on `G ∩ {|V| ≤ R}` the map `T_t` is, on each set where the configurations at the times `jδ` lie in `S_{δ,R}`, a composition of step maps, which preserve measure by §6.2; these sets exhaust `G` up to a null set (§6.4), so the trajectory action preserves `λ_N` restricted to `G`; `G` and `𝒟̄ᶜ` are disjoint invariant Borel sets (`G ⊆ 𝒟̄` by §5.5, `G` is Borel by §6.4, `𝒟̄ᶜ` is open because `𝒟̄` is closed, §3.1, and both are invariant by §7.1), the action is jointly measurable (§7.1), and the complement of `G ∪ 𝒟̄ᶜ` is `𝒟̄ ∖ G`, null by §6.4; item 1 then gives that `T_t` preserves `λ_N`, and the same argument with carrier `G` gives `λ_N|𝒟̄` (GST2013 line 883; DengHaniMa2024 line 186).

**Checks.**

- `N = 2` on `E`: preservation reduces to §4.4 in relative coordinates and translation in the centre of mass.
- The indicator of `𝒟̄` is invariant exactly, since `T_t` preserves `𝒟̄`.
- Non-example: replacing specular scattering by the totally inelastic rule of §4.4 gives a map that sends the positive-measure set of colliding configurations to a null set, so the scattering law, not only free transport, carries the measure preservation.
- The carrier for `λ_N` must contain `𝒟̄ᶜ`: on `E` with d = 2, ε = 1 and `N = 2`, the set `𝒟̄ᶜ = {|x_1 − x_2| < 1}` has infinite measure, so `G` alone is not conull for `λ_N`, although it is conull for `λ_N|𝒟̄`. On the unit torus with d = 2, ε = 0.4 and `N = 8`, `𝒟̄ = G = ∅`, the carrier is the whole phase space with the trivial action, and `T_t` is the identity.

*Needs:* §3.1, §5.5, §6.2, §6.4, §7.1, ClassicalErgodicTheory §3.5 (item 1), Mathlib `MeasureTheory.MeasurePreserving`.

### 7.3 Symmetries and conservation laws

Prove `HardSphere.flow_reversal`: for every real ε, `T_t ∘ ℛ = ℛ ∘ T_{−t}` exactly on the whole phase space. Route: for `Z ∈ G` with trajectory γ, `s ↦ ℛ(γ(−s))` is a trajectory on ℝ through `ℛ Z` (§5.3), so by uniqueness (§5.2) `T_t(ℛ Z) = ℛ(γ(−t)) = ℛ(T_{−t} Z)`; for `Z ∉ G` also `ℛ Z ∉ G`, since `G` is invariant under the involution ℛ (§5.5), and both sides are `ℛ Z`; none of these steps uses `0 < ε < ρ`. Prove, for `0 < ε < ρ`, equivariance under relabelling, commutation with common translations of positions, and conservation of `P` and `H`, all exactly on the whole phase space (off `G` the flow is the identity and `G` is invariant under relabelling and common translations, §5.5, so these identities hold there trivially). Prove Galilean covariance on the good set: for `Z = (X, V) ∈ G`, `c ∈ E` and `t ∈ ℝ`, `T_t(X, V + c) = (X' + π(t c), V' + c)` where `(X', V') = T_t(X, V)`; since `𝒟̄ ∖ G` is null (§6.4), it holds for `λ_N`-almost every `Z ∈ 𝒟̄`. The relabelling equivariance is the indistinguishability of the particles (GST2013 (1.1.1), lines 211–215; BGSS2023 lines 184–187); the reversal, translation and boost identities and the conservation laws are derived here from the symmetries of trajectories (§5.3), their uniqueness (§5.2) and the conservation along trajectories (§5.1), whose input is the reflection law GST2013 (4.1.1)–(4.1.2), lines 835–847, printed p. 27, with its conservation of momentum and energy GST2013 (2.1.3), lines 396–399.

**Checks.**

- At the head-on witness, `ℛ T_3 Z = ((1, 0), (−2, 0); 0, (1, 0))` and `T_{−3}` of the reversed initial state agrees with it.
- A permutation swapping the two particles of the witness conjugates the flow to the flow of the swapped labels.
- Non-example: rotating velocities alone does not commute with the flow: rotating the head-on witness's velocities by a quarter turn gives `v_1 = (0, −1)`, which never meets particle 2, while the rotated time-3 state has `v_2 = (0, −1)` after a collision.
- Galilean covariance needs `Z ∈ G`: boosting the grazing state of §7.1 (`x_1 = (2, 1)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`) by `c = (1, 0)` keeps the relative data, so both states lie outside `G`; `T_1` fixes the boosted state, with positions `(2, 1)`, `0`, whereas the covariance formula would give `(3, 1)`, `(1, 0)`.
- Reversibility needs no hypothesis on ε. For ε = −1 the flow is free transport (§7.1) and ℛ is `(X, V) ↦ (X, −V)`; on `E` with d = 1, `N = 2`, `x_1 = 1`, `x_2 = 0`, `v_1 = −1`, `v_2 = 0` and `t = 2`, `T_2(ℛ Z)` and `ℛ(T_{−2} Z)` are both the state with positions `3`, `0` and velocities `1`, `0`. On the unit circle with ε = 1/2 and `N = 2` (§7.1), `G = ∅`, the flow is the identity and both sides are `ℛ Z`.

*Needs:* §5.1–5.3, §5.5, §6.4, §7.1.

### 7.4 The Koopman group

For `1 ≤ p < ∞` define the Koopman group `U_t f = f ∘ T_{−t}` on `Lp ℝ p (λ_N` restricted to `𝒟̄)` and prove that it is a `TauCeti.Semigroups.StronglyContinuousGroup` of isometries. Route: isometry and the group law from §7.1–7.2 and `MeasureTheory.Lp.compMeasurePreserving`; strong continuity at 0 first for continuous compactly supported `f`, using that `T_t Z → Z` as `t → 0` for every `Z ∈ G` without contact (all but a null set: `G` is conull for `λ_N|𝒟̄` by §7.2, and the contact states `𝒟̄ ∖ 𝒟` are null by §3.1), dominated convergence for `⟨U_t f, f⟩` and `‖U_t f − f‖² = 2‖f‖² − 2⟨U_t f, f⟩` for `p = 2` and comparison of norms on a set of finite measure for other `p`, then density (`MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`). The operator `f ↦ f ∘ T_{−t}` is the solution operator of GST2013 (4.3.5), lines 1138–1140, and the flow operator of DengHaniMa2024 (1.5), lines 175–178; its isometry and strong continuity on `Lp` are proved here and are stated in neither source.

**Checks.**

- `N = 1` on `E`: `U_t f(x, v) = f(x − t v, v)`, the free transport group.
- For `N ≥ 1` the phase measure `λ_N|𝒟̄` is σ-finite of total mass `q_N · ∞` (with `0 · ∞ = 0`), where `q_N = μ_X^{⊗N}({X : ‖x_i − x_j‖ ≥ ε for i ≠ j})` is the measure of the admissible positions (the normaliser `Z^{can}` of §9.2); for `N = 0` it is the unit mass at the empty configuration. It can be infinite even on a torus, because velocities range over `E`: for `N = d = 1` on the unit circle there is no exclusion, `q_1 = 1`, `𝒟̄_1 = X × E` has measure `1 · ∞ = ∞`, and the constant 1 is in no `Lp`, `p < ∞`. The energy cutoff `f = 1_{H ≤ R²/2}` is: for `N = d = 1`, `R = 1`, its `p`-th power integrates to `μ_X(X) · vol([−1, 1]) = 2`, and `U_t f = f` exactly since `H ∘ T_{−t} = H`.
- Empty and null position sectors give phase mass 0, not ∞: on the unit torus with d = 2, ε = 0.4 and `N = 8` the hard-core set is empty (§3.1, by the packing bound of §1.4), `q_8 = 0`, the phase measure is 0, `Lp` is the zero space and `U` is the trivial group on it; on the unit circle with ε = 1/3 and `N = 3` the admissible positions are the equally spaced triples, a nonempty set of dimension 1, so again `q_3 = 0` and the phase measure is 0. The mass is infinite exactly when `N ≥ 1` and `q_N > 0`.
- Non-example: `p = ∞` is excluded. On `X = E`, for `N = 1`, the indicator `f` of `{x_1 ∈ B(0, 1)} × {|v_1 − e_1| < 1/2}` satisfies `‖U_t f − f‖_∞ = 1` for all small `t ≠ 0`, since free transport moves the position cutoff. The position cutoff must be one that transport moves: on the unit circle the ball `B(0, 1)` is all of `X` (every norm there is at most 1/2), so the same indicator depends on the velocity only, is invariant, and gives `‖U_t f − f‖_∞ = 0`.

*Needs:* §3.1, §7.1, §7.2, Mathlib `MeasureTheory.Lp.compMeasurePreserving`, `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`, Tau Ceti `TauCeti.Semigroups.StronglyContinuousGroup`.

### 7.5 The grand canonical phase space

Define the grand canonical phase space `𝒟^ε = Σ_{N ≥ 0} (Fin N → X × E)` with the componentwise flow `T_t(N, Z) = (N, T_t Z)` and the measure `Λ = Σ_N (1/N!) λ_N` restricted to `𝒟̄_N` on the `N`-th component (BGSS2023 lines 158–166; DengHaniMa2024 lines 199–204). The spaces `X_N = Fin N → X × E` with `μ_N = (1/N!) λ_N|𝒟̄_N`, carriers `G_N` and the trajectory actions form a countable family of conull flows (§7.2), and `Λ` is their sum measure; the componentwise flow is the identity extension of their disjoint union, so it preserves `Λ` by ClassicalErgodicTheory §3.5 item 3.

API:

- The componentwise flow is a group action (componentwise §7.1), preserves the particle number and fixes the empty configuration.
- For `0 < ε < ρ` it preserves `Λ`, by the conull-flow argument above.

**Checks.**

- The empty configuration has `Λ`-mass 1 (the `N = 0` term).
- On the unit torus with ε = 0.4 in d = 2, the components with `N ≥ 8` are `Λ`-null.
- The `N = 1` component carries `μ_X ⊗ vol` with weight 1.
- The `N = 2` component carries the weight `1/2!`: on the unit circle (d = 1, ρ = 1/2) with ε = 0.2, the configurations of `𝒟̄_2` with both speeds at most 1 have `λ_2`-measure `(1 − 0.4) · 2² = 2.4` (`x_1` free, `x_2` outside the arc of length `2ε = 0.4` around it, velocities in `[−1, 1]²`) and `Λ`-measure `1.2`; the sum measure `Σ_N λ_N|𝒟̄_N` without `1/N!`, which agrees with `Λ` on the components `N ≤ 1`, gives `2.4`.

*Needs:* §7.1, §7.2, Mathlib `Sigma.instMeasurableSpace`, `MeasureTheory.Measure.sum`, ClassicalErgodicTheory §3.5 (item 3).

### Examples

The flow preserves the σ-finite measure `λ_N|𝒟̄`. For `N ≥ 1` its total mass is `q_N · ∞`, with `q_N` the measure of the admissible positions (§7.4): it is 0 when `q_N = 0`, as on the unit torus with d = 2, ε = 0.4 and `N = 8`, and ∞ when `q_N > 0`, as for every `N ≥ 1` on `E` and for `N = 1` on every position space, since velocities range over `E`; for `N = 0` it is 1. On the unit torus its restriction to each energy sublevel `{H ≤ r}`, `r ≥ 0`, has mass `q_N · vol(B^{dN}(0, √(2r))) ≤ vol(B^{dN}(0, √(2r)))`, finite, and is invariant; on `E`, for `N ≥ 1` and `r > 0`, these restrictions are infinite, while for `r = 0` the sublevel `{V = 0}` is null and the restriction is 0. Every function of `P` and `H` is invariant.

### Dependencies

Layers 3 and 5–6; Mathlib (`MeasureTheory.MeasurePreserving`, composition operators on `Lp`, density of compactly supported continuous functions, measures on sigma types); Tau Ceti `TauCeti.Semigroups.StronglyContinuousGroup` (§7.4); ClassicalErgodicTheory §3.5 (items 1 and 3).

## Layer 8: Densities, the Liouville equation and marginals

### 8.1 Transported densities

For a measurable `W⁰ : (Fin N → X × E) → ℝ` vanishing off `𝒟̄`, define `W(t) = W⁰ ∘ T_{−t}`: the density whose evolution BGSS2023 (1.1.3)–(1.1.4), lines 145–157, describes by the Liouville equation with specular reflection, written with the solution operator of GST2013 (4.3.5), lines 1138–1140, and the density of the law at time `t` of DengHaniMa2024 (1.9)–(1.10), lines 224–234.

API, for `0 < ε < ρ`:

- `W(0) = W⁰` and `W(s + t) = W(s) ∘ T_{−t}` for all real `s, t`.
- `W(t)` vanishes off `𝒟̄`, and is symmetric when `W⁰` is.
- Duality: `∫ W(t) φ dλ = ∫ W⁰ (φ ∘ T_t) dλ` for measurable `φ` with either side integrable or both functions nonnegative; on Euclidean space and for indicators of measurable sets this is DengHaniMa2024 (1.9)–(1.10).
- `‖W(t)‖_p = ‖W⁰‖_p` for `1 ≤ p ≤ ∞`, and for `W⁰ ∈ Lp`, `1 ≤ p < ∞`, `W(t) = U_t W⁰` in `Lp` of `λ_N` restricted to `𝒟̄`, with `U_t` the Koopman group of §7.4.

The properties other than that case of the duality are proved here and are stated in none of the three sources. Route for the duality: for `W⁰ ≥ 0` it is the instance of ClassicalErgodicTheory §3.5 item 4 for the conull flow of §7.2 on `(Fin N → X × E, λ_N)`, `(T_t)_* (λ_N.withDensity W⁰) = λ_N.withDensity (W⁰ ∘ T_{−t})`, integrated against `φ`; the integrable signed case follows by splitting `W⁰` and `φ` into positive and negative parts.

**Checks.**

- The indicator of `𝒟̄` is transported to itself exactly.
- `N = 1` on `E`: `W(1)((1, 0), (1, 0)) = W⁰(0, (1, 0))`.
- A density that is a function of `H` and `P` times the indicator of `𝒟̄` is constant in time.
- Non-example: `W⁰ ∘ T_t` (the wrong sign) moves mass in the direction `−v` for `N = 1`.

*Needs:* §7.1–7.4, ClassicalErgodicTheory §3.5 (item 4).

### 8.2 The weak Liouville equation with specular reflection

Call `φ : ℝ × (Fin N → X × E) → ℝ` an admissible test function when it is bounded and jointly measurable, vanishes for `|t| ≥ T` for some `T`, has at every point `(t, Z)` a material derivative `Lφ(t, Z) = d/dr φ(t + r, S_r Z)|_{r=0}` (the derivative at `r = 0` of `r ↦ φ(t + r, S_r Z)`, with `S_r = HardSphere.freeFlow r`) that is bounded and jointly measurable in `(t, Z)`, and satisfies the specular condition `φ(t, σ_M Z) = φ(t, Z)` for all `t` and `Z`, with `σ_M = HardSphere.contactScatter ε` (a condition only where the contacts of `X` form a nonempty matching `M`, since `σ_M` is the identity elsewhere). Prove `HardSphere.weak_liouville`: for `0 < ε < ρ`, `W⁰ ∈ L¹(λ_N)` vanishing off `𝒟̄` and admissible `φ`, with `W(t) = W⁰ ∘ T_{−t}`, `∫_0^∞ ∫ W(t) Lφ(t) dλ dt + ∫ W⁰ φ(0) dλ = 0` (GST2013 (4.2.1) and (4.3.1), lines 911–918 and 941–958; BGSS2023 (1.1.3)–(1.1.4), lines 145–157). Route: for `Z ∈ G`, `t ↦ φ(t, T_t Z)` is continuous (the specular condition matches the values before and after each collision) and differentiable off the finitely many collision times in each bounded interval with derivative `Lφ(t, T_t Z)` (the one-sided derivatives at a collision time differ in general), so `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le` on each closed piece `[t_k, t_{k+1}]` between consecutive collision times (continuity on the closed piece, the derivative on its interior, interval integrability of the bounded measurable `Lφ`) gives `∫_0^∞ Lφ(t, T_t Z) dt = −φ(0, Z)`; by §8.1 and Fubini the first term of the theorem is `∫ W⁰(Z) ∫_0^∞ Lφ(t, T_t Z) dt dλ`, and the pointwise identity holds at `λ_N`-almost every point where `W⁰ ≠ 0`, since `W⁰` vanishes off `𝒟̄` and `𝒟̄ ∖ G` is null (§6.4); off `G` the flow is the identity and the pointwise identity fails in general (last Check).

API of the test-function class:

- On `E`, a `C¹` function with compact support has `Lφ = ∂_t φ + Σ_i ⟨v_i, ∇_{x_i} φ⟩`.
- The class is closed under linear combinations and relabelling, and under multiplication by `a(t, P(V), H(V))` for every bounded measurable `a : ℝ × E × ℝ → ℝ` that is differentiable in `t` at every point with bounded measurable derivative `∂_t a`: free transport changes neither `P` nor `H`, so `L(a φ) = a Lφ + (∂_t a) φ`, and σ_M preserves `P` and `H`, so the specular condition survives. Boundedness of the multiplier is needed: `χ(t)` is admissible for `C¹` compactly supported χ, but `χ(t) H(V)` is unbounded.

**Checks.**

- `φ(t, Z) = χ(t) ψ(H(V))` is admissible for every `C¹` compactly supported χ and bounded measurable ψ, and the identity reduces to `∫_0^∞ χ' = −χ(0)` times `∫ W⁰ ψ(H)`.
- On `E` with `N = 1` the identity is the weak form of free transport `∂_t W + ⟨v, ∇_x W⟩ = 0`.
- The derivative at a collision time need not exist, which is why the fundamental theorem of calculus is applied with the derivative only on the open pieces: for the head-on witness and `φ(t, Z) = χ(t) θ(H(V)) ψ(⟨x_1 − x_2, e_1⟩)` with ψ bounded and smooth with bounded derivative and equal to the identity on `[−10, 10]`, and θ smooth with compact support and equal to 1 near `1/2`, the energy of the witness, the function is admissible (it is bounded; `Lφ = θ(H)(χ'(t) ψ(⟨x_1 − x_2, e_1⟩) + χ(t) ψ'(⟨x_1 − x_2, e_1⟩) ⟨v_1 − v_2, e_1⟩)` is bounded because `|v_1 − v_2|` is bounded where `θ(H) ≠ 0`; σ_M moves no position and preserves `H`), and `t ↦ φ(t, T_t Z)` is `χ(t)(2 − t)` for `0 ≤ t < 1` and `χ(t) t` for `1 ≤ t ≤ 10`: continuous at `t = 1`, with left derivative `χ'(1) − χ(1)` and right derivative `χ'(1) + χ(1)`. The energy cutoff is needed: without θ, at `χ(1) = 1`, `χ'(1) = 0`, `x_1 − x_2 = e_1`, `v_1 = M e_1`, `v_2 = 0` one gets `Lφ(1, Z) = M`, unbounded in `M`.
- Non-example: `φ = χ(t) θ(H(V)) ⟨v_1, e_1⟩`, with χ and θ smooth with compact support, is bounded with bounded material derivative `χ'(t) θ(H) ⟨v_1, e_1⟩` but violates the specular condition, and the identity fails for it. For `Z ∈ G` whose trajectory has exactly one collision on `[0, ∞)`, at a time `τ(Z) > 0`, the computation of the route gives `∫_0^∞ Lφ(t, T_t Z) dt + φ(0, Z) = χ(τ(Z)) θ(H)(⟨v_1, e_1⟩ − ⟨v_1', e_1⟩)` with `v_1'` the velocity of particle 1 after the collision, so the left side is the integral of this jump against `W⁰`, with a collision time that varies with `Z` (the data colliding at one fixed time form a null set, which carries no mass of an `L¹` density). Explicitly, on `E` with d = 1, `N = 2`, ε = 1, let `W⁰` be the uniform probability density on the box `x_2 ∈ (0, 0.01)`, `x_1 − x_2 ∈ (1.99, 2.01)`, `v_1 ∈ (−1.02, −0.98)`, `v_2 ∈ (−0.02, 0.02)`, and take χ = 1 on `[0.9, 1.1]` and θ = 1 on `[0.47, 0.53]`. Each trajectory has one collision, which exchanges `v_1` and `v_2`, at `τ = (x_1 − x_2 − 1)/(v_2 − v_1) ∈ (0.9519, 1.0521)`, and `H ∈ (0.4802, 0.5204)`, so the left side is `∫ W⁰ (v_1 − v_2) = −1 ≠ 0`.
- The pointwise identity of the route holds on `G` only: the grazing state of §7.1 (ε = 1, `x_1 = (2, 1)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`, of energy `1/2`) lies in `𝒟̄ ∖ G` and is fixed by the flow, and for the test function `χ(t) θ(H(V)) ψ(⟨x_1 − x_2, e_1⟩)` of the third Check with χ nonnegative and equal to 1 on `[0, 3]` one has `Lφ(t, Z) = 2χ'(t) − χ(t)`, so `∫_0^∞ Lφ(t, T_t Z) dt = −2χ(0) − ∫_0^∞ χ ≤ −5`, while `−φ(0, Z) = −2`. The theorem is unaffected because `𝒟̄ ∖ G` is null (§6.4) and carries no mass of an `L¹` density.

*Needs:* §1.2, §3.3–3.5, §6.4, §7.1, §8.1, Mathlib `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le`.

### 8.3 Marginals

For a symmetric `W_N ≥ 0` vanishing off `𝒟̄_N` and `s ≤ N`, define the marginal `W^{(s)}_N(Z_s) = ∫ W_N(Z_s, z_{s+1}, …, z_N) dz_{s+1} ⋯ dz_N` (GST2013 (4.2.2), lines 929–932).

API:

- `W^{(s)}_N` is symmetric, vanishes off `𝒟̄_s`, and commutes with relabelling the first `s` particles.
- `W^{(N)}_N = W_N`, `W^{(0)}_N = ∫ W_N`, and `W^{(s)}_N = ∫ W^{(s+1)}_N dz_{s+1}` for `s < N` (GST2013 (4.2.3), lines 934–937; at `s = N` there is no level `N + 1`).
- Specular inheritance: `W^{(s)}_N` inherits the specular condition `W(X, V) = W(X, σ_M V)`, with `σ_M` the contact scattering of §3.3: if `W_N` satisfies it at every configuration of `𝒟̄_N` whose contacts form a nonempty matching `M`, then `W^{(s)}_N` satisfies it at every such configuration of `𝒟̄_s` (GST2013 line 938). Route: for fixed `Z_s`, the added positions `x_{s+1}, …, x_N` at which some added particle is in contact with another particle form a null set (spheres of radius `ε < ρ` are null, §1.1, and Fubini); off it the contacts of the full configuration are those of `Z_s`, so its contact scattering moves only the first `s` velocities and the condition on `W_N` passes under the integral, and where the full configuration leaves `𝒟̄_N` both integrands vanish.

**Checks.**

- On the unit torus with `N = 2`, `0 < ε < 1/2` and `g(x, v) = g̃(v)` independent of position, `W_2 = g ⊗ g · 1_{𝒟̄_2}` has first marginal `g(z_1)(1 − ω_d ε^d) ∫ g̃`.
- `N = s`: the marginal is `W_N`.
- Non-example: dropping the indicator gives the first marginal `g(z_1) ∫ g̃` in the same situation, too large by the factor `1/(1 − ω_d ε^d)`; and the second marginal of the hard-core density vanishes at `x_1 = x_2`, while the product does not.
- The specular inheritance needs the specular condition on `W_N`; symmetry, positivity and support do not give it. On `E` with d = 2, ε = 1 and `s = N = 2`, the density `W = e^{−|v_1|² − |v_2|²} 1_{|v_1| ≤ 1} 1_{|v_2| ≤ 1} 1_{𝒟̄_2}` is symmetric, nonnegative and vanishes off `𝒟̄_2`, and its marginal of order 2 is `W` itself; at a contact with `ν_12 = e_1` and velocities `(0, 0.9)`, `(0.9, 0)` it equals `e^{−1.62} ≈ 0.19790`, while at the scattered velocities `(0.9, 0.9)`, `0` it is 0, since `|(0.9, 0.9)| ≈ 1.2728 > 1`. The Gaussian density `e^{−|v_1|² − |v_2|²} 1_{𝒟̄_2}` satisfies the condition and takes the value `e^{−1.62}` at both states.

*Needs:* §1.1, §3.1–3.3.

### 8.4 Symmetric expectations

Prove: for `s ≤ N`, a symmetric measurable `W_N ≥ 0` on `(Fin N → X × E)` and measurable `h ≥ 0` on `(Fin s → X × E)`, `∫ W_N Σ_{i} h(z_{i_1}, …, z_{i_s}) dλ = N!/(N − s)! ∫ W^{(s)}_N h dλ_s`, the sum over injective `i : Fin s → Fin N`, whose number is the falling factorial `Nat.descFactorial N s = N!/(N − s)!`. No normalisation of `W_N` is assumed, since its consumer §9.5 applies it to `W_N(t)`, of total mass `N!` times the probability of `N` particles; and `W^{(s)}_N` is the integral formula of §8.3, which is defined for every measurable `W_N ≥ 0`, the support condition of §8.3 not being used here. This is the fixed-`N` form of the distinct-label identity, the first equality of BGSS2023 (1.1.9), lines 241–266, printed p. 3, with the indicator `δ_{N ≥ n}` at line 249. Route: extend each injective `i` to a permutation of `Fin N` sending `1, …, s` to `i_1, …, i_s`; relabelling preserves `λ_N` (§3.1) and `W_N`, so each of the `Nat.descFactorial N s` terms equals `∫ W_N h(z_1, …, z_s) dλ = ∫ W^{(s)}_N h dλ_s` by Fubini and the definition of the marginal. The hypothesis `s ≤ N` is needed for the marginal `W^{(s)}_N` to exist; the count `Nat.descFactorial N s` is also correct for `s > N`, where it is 0.

**Checks.**

- `s = 1`, `h = 1`: both sides are `N ∫ W_N`, which is `N` for a probability density.
- `s = N`: both sides are `N! ∫ W_N h` for symmetric `h`.
- `s = 2`, `N = 3`, `h = 1`: both sides are `6 ∫ W_3 = 3 · 2 ∫ W_3`; a sum over all maps `Fin 2 → Fin 3`, injective or not, would give `9 ∫ W_3`.
- Normalisation is not used: for the one-particle density of §9.3 at ε = 0, μ = 2, `∫ f⁰ = 1`, of total mass `2e^{−2} ≈ 0.27067`, with `N = s = 1` and `h = 1`, both sides are `0.27067`; on the unit torus with d = 2, ε = 0.4 and `N = 8`, the density vanishes and both sides are 0. A statement for probability densities only would cover neither.
- The count at `s > N`: for `N = 1`, `s = 2` there is no injective map `Fin 2 → Fin 1` and `Nat.descFactorial 1 2 = 0`, whereas `1!/(1 − 2)!` computed with truncated natural subtraction is `1!/0! = 1`.

*Needs:* §3.1, §8.3, Mathlib `Nat.descFactorial`, `MeasureTheory.measurePreserving_piCongrLeft`.

### Examples

For the canonical measure of §9.2 every marginal is constant in time; for a product initial density the marginals at time 0 are products away from the exclusion.

### Dependencies

Layers 1, 3, 6 and 7; Mathlib (the fundamental theorem of calculus, `Nat.descFactorial`, relabelling of product measures); ClassicalErgodicTheory §3.5 (item 4).

## Layer 9: Equilibria and grand canonical ensembles

### 9.1 Maxwellians

Define `M_{β,u}(v) = (β/2π)^{d/2} exp(−β|v − u|²/2)` for `β > 0`, `u ∈ E` (GST2013 (2.2.5), lines 489–492).

API:

- `M_{β,u}` is a probability density on `E`.
- `M_{β,u}` equals `TauCeti.Probability.multivariateGaussianPDFReal u (β⁻¹ • 1)` at every point, so `vol.withDensity M_{β,u} = multivariateGaussian u (β⁻¹ • 1)` by `TauCeti.Probability.multivariateGaussian_eq_withDensity`, the covariance `β⁻¹ • 1` being positive definite.
- Collision invariance: `M(v') M(w') = M(v) M(w)` for `(v', w') = σ_ω(v, w)` and every unit vector ω, since `σ_ω` preserves `v + w` and `|v|² + |w|²` (§2.1).

**Checks.**

- d = 1, β = 1, u = 0: `M(0) = 1/√(2π) ≈ 0.39894`, equal to `ProbabilityTheory.gaussianPDFReal 0 1 0`.
- `∫ exp(−β|v|²/2) dv = (2π/β)^{d/2}`, from `GaussianFourier.integral_rexp_neg_mul_sq_norm` with `b = β/2`; for d = 3, β = 1 this is `(2π)^{3/2} ≈ 15.7496`.
- Non-example: `exp(−β|v|²)` without the factor 1/2 has variance `1/(2β)` per coordinate, not `1/β`.

*Needs:* §2.1, Mathlib `GaussianFourier.integral_rexp_neg_mul_sq_norm`, `ProbabilityTheory.gaussianPDFReal`, `ProbabilityTheory.multivariateGaussian`, Tau Ceti `TauCeti.Probability.multivariateGaussianPDFReal`, `TauCeti.Probability.multivariateGaussian_eq_withDensity`.

### 9.2 Invariant measures and canonical ensembles

Prove: for every measurable `Φ : ℝ × E → ℝ≥0∞`, the measure with density `Φ(H(V), P(V)) 1_{𝒟̄}(X)` with respect to `λ_N` is invariant under `T_t`, by the measure preservation of §7.2, the invariance of `𝒟̄` (§7.1) and the exact conservation of `H` and `P` under the flow (§7.3). On a position space of finite measure, define the canonical measure `P^{can}_{N,β,u}` with density `Π_i M_{β,u}(v_i) 1_{𝒟̄}(X)/Z^{can}`, where `Z^{can} = μ_X^{⊗N}({X : ‖x_i − x_j‖ ≥ ε for i ≠ j})` is the measure of admissible positions, defined when `Z^{can} > 0`.

API:

- `P^{can}_{N,β,u}` is a probability measure.
- `P^{can}_{N,β,u}` is invariant under `T_t`, being the case `Φ(H, P) = (β/2π)^{dN/2} exp(−β(2H − 2⟨u, P⟩ + N|u|²)/2)/Z^{can}` of the first statement.

The fixed-particle-number (canonical) formalism is that of BGSS2023 lines 158–160, printed p. 2; the invariant densities and the Maxwellian canonical ensemble are derived here from §7.1–7.3 and §9.1.

**Checks.**

- `N = 1` on the unit torus: `Z^{can} = 1` and the canonical measure is `μ_X ⊗ M_{β,u}`.
- Unit torus, d = 2, ε = 0.4, `N = 8`: `Z^{can} = 0` by §1.4, and the canonical measure is not defined.
- On `E` with `N ≥ 1` the invariant measure `Π_i M(v_i) 1_{𝒟̄}` has mass `q_N · 1 = ∞`, the admissible positions having infinite measure, so only the unnormalised statement holds there; for `N = 0` it is the unit mass at the empty configuration, a probability measure.

*Needs:* §3.5, §7.1, §7.2, §7.3, §9.1.

### 9.3 Grand canonical measures

For every real ε, every `μ ≥ 0` and every `f⁰ : X × E → ℝ≥0∞`, on every normed additive commutative group `X` with a measure (the three definitions below use only the norm and the measure of `X`), define the partition function `HardSphere.partitionFunction ε μ f⁰ = Z = Σ_{N ≥ 0} (μ^N/N!) ∫_{𝒟̄_N} Π_i f⁰(z_i) dZ`, whose `N = 0` term is 1 (`Fin 0 → X × E` is a point of `λ_0`-mass 1), the density `HardSphere.grandCanonicalDensity ε μ f⁰ N = W⁰_N = μ^N Π_i f⁰(z_i) 1_{𝒟̄_N}/Z`, and `HardSphere.grandCanonical ε μ f⁰`, the measure on `𝒟^ε` whose `N`-th component is the image under the inclusion of that component of `λ_N` with density `W⁰_N/N!`, that is `(μ^N/(N! Z)) Π_i f⁰(z_i) 1_{𝒟̄_N}` (BGSS2023 (1.1.5)–(1.1.6), lines 167–181; DengHaniMa2024 Definition 1.3, lines 199–223).

API:

- For `0 ≤ ε`, `μ > 0` and a measurable `f⁰` with `∫ f⁰ < ∞`: `1 + μ∫f⁰ ≤ Z ≤ exp(μ∫f⁰)`, and the measure is an exchangeable probability measure.
- On a flat torus `Z` is a finite sum for `0 < ε < ρ` (§1.4).
- Poisson case: for `ε = 0`, `μ > 0` and a measurable `f⁰` with `∫ f⁰ < ∞`, the law of the particle number is `ProbabilityTheory.poissonMeasure (μ∫f⁰)`. When moreover `∫ f⁰ > 0`, every event `{N = n}` has positive probability and, conditionally on it, the `n` particles are i.i.d. with law `f⁰/∫f⁰`, a probability density; this conditional statement is not made when `∫ f⁰ = 0`, where `f⁰/∫f⁰` would be `0/0`.
- Vacuum: when `∫ f⁰ = 0` the measure is the vacuum law for every `ε ≥ 0` and every `μ ≥ 0`: `Z = 1` and `N = 0` almost surely; the same holds for `μ = 0` and every `f⁰`.
- The probability of `N` particles in a measurable `A ⊆ 𝒟̄_N` is `(1/N!) ∫_A W⁰_N` with `W⁰_N = μ^N Π f⁰ 1_{𝒟̄_N}/Z`; the particle number has finite moments of all orders.
- Monotonicity: `Z` is nonincreasing in ε.

**Checks.**

- `ε = 0`, `∫ f⁰ = 1`, μ = 2: `Z = e²` and `P(N = 1) = 2e^{−2} ≈ 0.27067`.
- `Z ≥ 1 + μ∫f⁰` because the terms `N ≤ 1` feel no exclusion; on `E` with ε > 0 the inequality `Z ≤ exp(μ∫f⁰)` shows that no confinement is needed.
- Non-example: weights `μ^N` without `1/N!` make `Z` diverge for `ε = 0` and `μ∫f⁰ ≥ 1`.
- Zero density: `f⁰ = 0` gives `Z = 1` and `P(N = 0) = 1` for every ε ≥ 0, consistent with `poissonMeasure 0 = δ_0` at ε = 0; the normalised density `f⁰/∫f⁰` is `0/0` there (the zero function under the division convention of `ℝ≥0∞` and `ℝ`, of mass 0, not 1).
- Zero diameter is not a finite sum: on the unit torus with ε = 0, μ = 1 and `∫ f⁰ = 1`, every term `1/N!` is positive and `Z = e`; the finite-sum statement needs `ε > 0`.

*Needs:* §1.4, §3.1, §7.5, Mathlib `ProbabilityTheory.poissonMeasure`.

### 9.4 Invariance of the grand canonical measure

Prove `HardSphere.grandCanonical_flow_invariant`: on every flat position space, for `0 < ε < ρ`, `μ ≥ 0`, `c ≥ 0`, `β > 0`, `u ∈ E`, every time `t` and `f⁰(x, v) = c exp(−β|v − u|²/2)`, which is `c (2π/β)^{d/2} M_{β,u}(v)`, the grand canonical measure is invariant under the componentwise flow `(N, Z) ↦ (N, T_t Z)`; for `μ = 0` or `c = 0` it is the vacuum law, and when `μ_X(X) = ∞` and `μ c > 0` the partition function is infinite (its `N = 1` term is `μ c (2π/β)^{d/2} μ_X(X)`) and the measure is zero. For general `f⁰` the measure is transported by §8.1 componentwise (BGSS2023 lines 267–268). The equilibrium `f⁰ = M` and its invariant measure are named in BGSS2023 lines 479–483 and the product identity `M(z₁')M(z₂') = M(z₁)M(z₂)` at BGSS2023 line 3539; the invariance is derived here from §9.2 applied in each component, whose density `(μ^N/(N! Z)) c^N (2π/β)^{dN/2} Π_i M_{β,u}(v_i) 1_{𝒟̄_N}` is a function of `H` and `P` times `1_{𝒟̄_N}` for every value of `Z ∈ [1, ∞]`, a measure on the disjoint union being invariant exactly when each of its component restrictions is (ClassicalErgodicTheory §3.5 item 3). The route does not use the finiteness of `μ_X(X)`.

**Checks.**

- On the unit torus with `f⁰ = M_{1,0}` the invariance is the special case `Φ(H, P) = e^{−H}` of §9.2 in each component.
- Mean velocity `u ≠ 0` is allowed: `Π_i M_{β,u}(v_i) = (β/2π)^{dN/2} exp(−β(2H − 2⟨u, P⟩ + N|u|²)/2)` is a function of `H` and `P`.
- Infinite position measure: on `X = E` with d = 1, μ = c = β = 1 and `u = 0`, the `N = 1` term of the partition function is `∫_E ∫_E exp(−v²/2) dv dx = √(2π) · ∞ = ∞`, so `Z = ∞`, every component density is a finite number divided by `∞`, that is 0, and the measure is the zero measure, which every measurable map preserves. A statement asserting a probability measure here would be false; the invariance holds and does not need `μ_X(X) < ∞`.
- Non-example: the radial non-Gaussian profile `g(v) = 1_{|v| ≤ 1}` is not invariant: in d = 2 at ν = (1, 0), `v = (0, 0.9)`, `w = (0.9, 0)` gives `g(v)g(w) = 1` and `σ_ν(v, w) = ((0.9, 0.9), 0)` gives `g(0.9, 0.9) g(0) = 0` since `|(0.9, 0.9)| ≈ 1.2728`.
- Non-example: a position-dependent profile is moved by free transport. On the unit circle (d = 1) take `f⁰(x, v) = r(x) M_{1,0}(v)` with `r(x) = 1 + 0.5 cos(2πx)`: the `N = 1` component of the measure has density `(μ/Z) r(x) M(v)` at time 0 and, after the flow for time `t`, `(μ/Z) r(x − t v) M(v)`; at `t = 1/4`, `x = 0`, `v = 1` the position factor changes from `r(0) = 1.5` to `r(−1/4) = 1`, and by continuity the two densities differ on a set of positive measure. Nonconstancy as a function is not enough: `r = 1 + 1_{x = 0}` is nonconstant but equal to 1 almost everywhere, so it defines the invariant Maxwellian measure.

*Needs:* §7.5, §8.1, §9.1–9.3, ClassicalErgodicTheory §3.5 (item 3).

### 9.5 Correlation functions

For the grand canonical measure and its transport, define `HardSphere.correlation ε μ f⁰ n t` by `F_n(t)(Z_n) = μ^{−n} Σ_{p ≥ 0} (1/p!) ∫ W_{n+p}(t)(Z_n, z_{n+1}, …, z_{n+p}) dz_{n+1} ⋯ dz_{n+p}` with `W_N(t) = W⁰_N ∘ T_{−t}` and `(Z_n, z_{n+1}, …, z_{n+p})` the concatenation `Fin.append` (BGSS2023 (1.1.10), lines 267–277; DengHaniMa2024 (1.11), lines 235–244); it is defined for every ε, μ ≥ 0 and `f⁰`, with `μ^{−n} = ∞` when `μ = 0 < n`, where every `W_{n+p}` vanishes and `F_n = 0`. Prove `HardSphere.lintegral_sum_distinct_eq_correlation`: for `0 < ε < ρ`, every `μ ≥ 0`, every measurable `f⁰`, every `n`, every time `t` and every measurable `h : (X × E)^n → ℝ≥0∞`, the expectation under `HardSphere.grandCanonical ε μ f⁰` of `Σ h(z_{i_1}(t), …, z_{i_n}(t))`, the sum over injective `i : Fin n → Fin N` (the embeddings `Fin n ↪ Fin N`) with `z(t) = T_t Z`, equals `μ^n ∫ F_n(t) h` (BGSS2023 (1.1.9) and (1.1.11), lines 241–266 and 279–288); the real-valued version holds for bounded measurable `h`.

API, for `0 < ε < ρ`, every `μ ≥ 0` and every measurable `f⁰`:

- `F_n(t)` is symmetric and vanishes off `𝒟̄_n`.
- `∫ F_n(t) = μ^{−n} E[Nat.descFactorial N n] < ∞`, with `μ^{−n} E[Nat.descFactorial N n]` the rescaled expected number of ordered `n`-tuples of distinct particles; `Nat.descFactorial N n` is `N!/(N − n)!` when `N ≥ n` and 0 when `N < n` (the indicator `δ_{N ≥ n}` of BGSS2023 line 249).
- Inversion: the formula `W_n(t) = μ^n Σ_p ((−μ)^p/p!) ∫ F_{n+p}(t)` holds almost everywhere with absolutely convergent series on a position space of finite measure when `f⁰(x, v) ≤ C₀ exp(−β₀|v|²/2)` with constants `C₀ ≥ 0` and `β₀ > 0` (BGSS2023 lines 229–237).

Route for the symmetry and the support: the `p`-th term of the series is `μ^{−n}/p!` times the marginal of order `n` of `W_{n+p}(t)`, which is symmetric, nonnegative and vanishes off `𝒟̄_{n+p}` (§8.1, `W⁰_{n+p}` being symmetric by §9.3), so each term is symmetric and vanishes off `𝒟̄_n` by §8.3. Route for the convergence: the Gaussian bound and the conservation of `H` give the pointwise bound `W_N(t)(Z_N) ≤ μ^N C₀^N exp(−β₀|V_N|²/2)/Z`; integrating out `m` of `n + m` particles multiplies it by the volume factor `K = μ_X(X) (2π/β₀)^{d/2}` once per particle, `∫ W_{n+m}(t)(Z_n, z_{n+1}, …, z_{n+m}) dz_{n+1} ⋯ dz_{n+m} ≤ μ^{n+m} C₀^{n+m} exp(−β₀|V_n|²/2) K^m/Z` (the velocity space is not of finite measure, so the factor `(2π/β₀)^{d/2}` cannot be dropped); inserting this in the definition of `F_{n+p}(t)` bounds the series `μ^n Σ_p (μ^p/p!) ∫ F_{n+p}(t)` by `(μ C₀)^n exp(−β₀|V_n|²/2) Σ_{p,q} (μ C₀ K)^{p+q}/(p! q! Z) = (μ C₀)^n exp(−β₀|V_n|²/2) exp(2 μ C₀ K)/Z`, finite thanks to the factorial denominators.

**Checks.**

- `n = 1`, `h = 1`: `E[N] = μ ∫ F_1(t)`, constant in `t`.
- `ε = 0`, `μ > 0`, `∫ f⁰ = 1`: `Z = e^μ` and `F_n(0) = (f⁰)^{⊗n} Σ_p μ^p e^{−μ}/p! = (f⁰)^{⊗n}` exactly (Poisson process); for `μ = 0` and `n ≥ 1`, `F_n(0) = 0`.
- Factorial moments: for a measurable `B ⊆ X × E` and `h = 1_B ⊗ 1_B`, the sum over injective `i : Fin 2 → Fin N` is `N(B)(N(B) − 1)`, with `N(B)` the number of particles in `B` at time `t`, so `E[N(B)(N(B) − 1)] = μ² ∫_{B²} F_2(t)`. At ε = 0, `t = 0`, μ = 2, `∫ f⁰ = 1` and `∫_B f⁰ = 1/2`, `N(B)` is Poisson of parameter `λ = μ ∫_B f⁰ = 1` and both sides are `λ² = 1`; a sum over all pairs `(i, j)`, distinct or not, would give `E[N(B)²] = λ + λ² = 2`.
- For the invariant measure of §9.4 every `F_n(t)` is independent of `t`.
- Vacuum: for `f⁰ = 0` the grand canonical measure is the vacuum law (§9.3), `N = 0` almost surely and `F_1 = 0`, in agreement with `μ^{−1} E[Nat.descFactorial N 1] = 0`; the quotient `N!/(N − 1)!` computed with truncated natural subtraction is `0!/0! = 1` at `N = 0` and would give `μ^{−1}`. For `μ > 0` and `f⁰` of positive finite mass (so `1 < Z < ∞`, §9.3) the truncated quotient overstates `E[N]` by the vacuum probability `1/Z ∈ (0, 1)`; for `μ > 0` and `f⁰` of infinite mass, `Z = ∞`, the measure is zero and both counts give 0 (the instance on `E` with `f⁰(x, v) = 0.1 · 1_{[0,1]}(v)` in the Checks of §9.6).
- `Nat.descFactorial 1 2 = 0` (a one-particle state has no ordered pair of distinct particles and contributes nothing to `∫ F_2`), whereas `1!/(1 − 2)!` with truncated subtraction is 1; `Nat.descFactorial 3 2 = 6`.
- The volume factor in the integrated bound: on the unit circle (d = 1) with ε = 0.1, μ = C₀ = β₀ = 1, `f⁰(x, v) = exp(−v²/2)`, `n = m = 1`, `t = 0` and `v_1 = 0`, the integrated density is `∫ W_2(0)(z_1, z_2) dz_2 = (1 − 0.2)√(2π)/Z ≈ 2.0053/Z`; it exceeds the value `1/Z` of `μ² C₀² exp(−β₀|v_1|²/2)/Z` without the volume factor and lies below the bound `K/Z = √(2π)/Z ≈ 2.5066/Z`.

*Needs:* §7.3, §7.5, §8.1, §8.3, §8.4, §9.3, Mathlib `Nat.descFactorial`, `GaussianFourier.integral_rexp_neg_mul_sq_norm`.

### 9.6 Initial chaos and the Boltzmann–Grad scaling

Prove: for `0 < ε < ρ`, `μ > 0` and a measurable `f⁰` with `∫ f⁰ < ∞` (so that `1 ≤ Z ≤ exp(μ∫f⁰) < ∞` and the grand canonical measure is a probability measure, §9.3), `F_n(0)(Z_n) = (f⁰)^{⊗n}(Z_n) 1_{𝒟̄_n}(Z_n) p_ε(X_n)`, where `p_ε(X_n)` is the probability under the grand canonical measure that no particle lies at distance less than ε from any of `x_1, …, x_n`; hence `0 ≤ (f⁰)^{⊗n} 1_{𝒟̄_n} − F_n(0) ≤ n μ ω_d ε^d ‖ρ⁰‖_∞ (f⁰)^{⊗n} 1_{𝒟̄_n}` with `ρ⁰(x) = ∫ f⁰(x, v) dv`. Prove `HardSphere.boltzmannGrad_scaling`: for `d ≥ 1`, `0 < ε < ρ`, a measurable `f⁰` with `∫ f⁰ = 1` and the scaling `μ_ε = ε^{−(d−1)}`, the mean particle number `E[N]` under `HardSphere.grandCanonical ε μ_ε f⁰` satisfies `1 − ω_d ε ‖ρ⁰‖_∞ ≤ ε^{d−1} E[N] ≤ 1`, with `ω_d = vol(B(0, 1))`, `‖ρ⁰‖_∞` the essential supremum of `ρ⁰` for `μ_X`, and both sides in `ℝ≥0∞` (the left side is truncated at 0). The limit `ε^{d−1} E[N] → 1` is the normalisation BGSS2023 (1.1.8), lines 211–217, and `ε^{d−1} E[N] = 1 + O(ε)` is DengHaniMa2024 (1.12), lines 246–252; the two-sided bound with the constant `ω_d ‖ρ⁰‖_∞` is proved here and is stated in neither source. Route: `ε^{d−1} E[N] = ∫ F_1(0)` by §9.5 with `n = 1`, `h = 1`; `F_1(0) ≤ f⁰` gives the upper bound, and `p_ε(x) ≥ 1 − μ_ε vol(B(x, ε)) ‖ρ⁰‖_∞ = 1 − ω_d ε ‖ρ⁰‖_∞` (a union bound, §1.1 for the ball volume, `ε < ρ`) the lower one. Consequently, for `d ≥ 1` and such `f⁰` with ρ⁰ bounded, in the scaling `μ_ε = ε^{−(d−1)}`, where the bound is `n ω_d ε ‖ρ⁰‖_∞ (f⁰)^{⊗n} 1_{𝒟̄_n}`, `F^ε_n(0) → (f⁰)^{⊗n}` as ε → 0 at every configuration with distinct positions, and in `L¹`.

**Checks.**

- `n = 1`: `F_1(0) = f⁰ · P(B(x_1, ε) empty) ≤ f⁰`.
- Both hypotheses `μ > 0` and `∫ f⁰ < ∞` are needed. `μ = 0`: on the unit circle (d = 1, ρ = 1/2) with ε = 0.1 and `f⁰ = M_{1,0}`, the measure is the vacuum law, `p_ε = 1`, and `F_1(0) = 0` (§9.5), while `f⁰ p_ε = M(0) ≈ 0.39894` at `v = 0`; the bound would read `0.39894 ≤ 0`. Infinite mass: on `E` with d = 1, ε = μ = 1 and `f⁰(x, v) = 0.1 · 1_{[0,1]}(v)`, the `N = 1` term of `Z` is `0.1 · ∞`, so `Z = ∞`, the grand canonical measure is zero and `F_1(0) = 0`; the identity holds trivially with `p_ε = 0`, but with `‖ρ⁰‖_∞ = 0.1` and `ω_1 = 2` the bound would read `0.1 ≤ 1 · 1 · 2 · 1 · 0.1 · 0.1 = 0.02` at `v = 0.5`.
- On the unit torus with `f⁰ = M_{1,0}`, `‖ρ⁰‖_∞ = 1`; in d = 3 with ε = 0.01 the scaling gives `ε² E[N] ∈ [1 − 0.0419, 1]`.
- For the Maxwellian datum `f⁰ = M_{1,0}` on the unit torus, at coinciding positions `x_1 = x_2` the indicator vanishes and `F_2(0) = 0 < M(v_1) M(v_2) = f⁰ ⊗ f⁰(z_1, z_2)` for every ε > 0: convergence holds only off the diagonal. The strict inequality needs a datum that is positive there: for a datum whose velocity density has compact support, at velocities outside that support both `F_2(0)` and `f⁰ ⊗ f⁰` vanish.

*Needs:* §1.1, §3.1, §9.3, §9.5, Mathlib `EuclideanSpace.volume_ball`.

### Examples

On the unit torus, the Maxwellian grand canonical measure is the hard-sphere gas at equilibrium; its correlation functions are time independent and converge to products of Maxwellians in the Boltzmann–Grad limit by §9.6.

### Dependencies

Layers 1–3 and 7–8; Mathlib (Gaussian integrals and laws, `Nat.descFactorial`, `ProbabilityTheory.poissonMeasure`); Tau Ceti `TauCeti.Probability.multivariateGaussianPDFReal` and `TauCeti.Probability.multivariateGaussian_eq_withDensity` (§9.1); ClassicalErgodicTheory §3.5 (item 3).

## Layer 10: The Boltzmann–Grad limit

### 10.1 The empirical measure

Define `HardSphere.empirical ε μ t h` on `𝒟^ε` by `π_t(h)(N, Z) = μ^{−1} Σ_{i < N} h((T_t Z)_i)` for `h : X × E → ℝ` (it is used for bounded measurable `h`), and the measure `π_t = μ^{−1} Σ_i δ_{(T_t Z)_i}` (BGSS2023 (1.2.4)–(1.2.5), lines 324–334), with `μ^{−1}` read as in `HardSphere.empirical` (`0⁻¹ = 0`).

API:

- For every `N ≥ 0`, `π_t = μ^{−1} N · TauCeti.Probability.empiricalFiniteMeasure (T_t Z)`, by `TauCeti.Probability.card_smul_empiricalFiniteMeasure` with `|Fin N| = N`.
- For `0 < ε < ρ`, every `μ ≥ 0`, every measurable `f⁰` and every bounded measurable `h`, under `HardSphere.grandCanonical ε μ f⁰`: `E[π_t(h)] = ∫ F_1(t) h` (BGSS2023 (1.2.6), lines 335–340), the case `n = 1` of §9.5.
- Under the same hypotheses, `E[π_t(h)²] = μ^{−1} ∫ F_1(t) h² + ∫ F_2(t) h ⊗ h` (BGSS2023 lines 352–369), from the cases `n = 1` and `n = 2` of §9.5, `π_t(h)²` being `μ^{−2}` times the sum of `h(z_i)²` over `i` and of `h(z_i) h(z_j)` over `i ≠ j`.

**Checks.**

- For every `N ≥ 0`, `π_t = μ^{−1} N · TauCeti.Probability.empiricalFiniteMeasure (T_t Z)`: at `N = 0` both sides are the zero measure (the empty sum, and `0` times the zero measure); for μ = 1 and `N = 2` particles at distinct points `a`, `b` at time `t`, the right side is `2 · (δ_a + δ_b)/2 = δ_a + δ_b`, while the empirical measure without the factor `N` would have mass 1 instead of 2. For `N ≥ 1` it is `(N/μ) · TauCeti.Probability.empiricalMeasureOfFintype` of the particles at time `t`.
- `h = 1`: `π_t(1) = N/μ` and `E[π_t(1)] = E[N]/μ`.
- The empty configuration gives the zero measure, which `empiricalMeasureOfFintype` (a probability measure) cannot represent; this is why `π_t` is written with the finite measure `empiricalFiniteMeasure`, which is zero for the empty family.

*Needs:* §7.5, §9.5, Tau Ceti `TauCeti.Probability.empiricalFiniteMeasure`, `TauCeti.Probability.card_smul_empiricalFiniteMeasure`, `TauCeti.Probability.empiricalMeasureOfFintype`.

### 10.2 The Boltzmann collision operator

Define `HardSphere.collisionOperator g v` for a velocity profile `g : E → ℝ` by `Q(g, g)(v) = ∫_E ∫_{S^{d−1}} ⟨w − v, ω⟩_+ (g(v') g(w') − g(v) g(w)) dσ_S(ω) dw` with `(v', w') = σ_ω(v, w)` (iterated Bochner integrals, the inner one for the sphere measure `MeasureTheory.Measure.toSphere`); for `g : X × E → ℝ` write `Q(g, g)(x, v)` for `HardSphere.collisionOperator (g(x, ·)) v`, the operator acting at each position separately, so that `Q(g, g)(x, v) = ∫_E ∫_{S^{d−1}} ⟨w − v, ω⟩_+ (g(x, v') g(x, w') − g(x, v) g(x, w)) dσ_S(ω) dw` (BGSS2023 (1.2.1)–(1.2.3), lines 292–312; GST2013 (2.1.2), lines 385–393; DengHaniMa2024 (1.13)–(1.14), lines 258–282).

API, for measurable `g` with `|g(x, v)| ≤ C exp(−β|v|²/2)` for constants `C ≥ 0` and `β > 0`:

- The integral converges absolutely and `|Q(g, g)(x, v)| ≤ C' (1 + |v|) exp(−β|v|²/2)` with `C'` depending on `C`, β and `d`. Route: by conservation of energy `|g(x, v') g(x, w')| ≤ C² exp(−β(|v|² + |w|²)/2)`, and `∫ (|v| + |w|) exp(−β|w|²/2) dw` is finite for β > 0.
- Gain and loss: `Q` splits into a gain term and the loss term `g(x, v) ω_{d−1} ∫ |w − v| g(x, w) dw`, by the total cross-section formula of §2.2.
- Weak form: `∫ Q(g, g) ψ dv = ¼ ∫∫∫ ⟨w − v, ω⟩_+ (g'g'_* − g g_*)(ψ + ψ_* − ψ' − ψ'_*)` for measurable `ψ` of polynomial growth (GST2013 (2.2.1), lines 432–437), by the two changes of variables of §2.2.
- Collision invariants: `∫ Q(g, g) ψ dv = 0` for `ψ ∈ span{1, v_1, …, v_d, |v|²}`.
- `Q(M, M) = 0` for every Maxwellian `M = M_{β',u}` (§9.1).

**Checks.**

- `Q(M_{β,u}, M_{β,u}) = 0`, by §9.1.
- The loss term at `g = M_{1,0}` in d = 3 and `v = 0` is `M(0) · π · ∫ |w| M(w) dw = M(0) π √(8/π)`.
- The kernels `⟨w − v, ω⟩_+` of BGSS2023 and `⟨v − w, ω⟩_+` of DengHaniMa2024 give the same operator by `ω ↦ −ω`, since `σ_{−ω} = σ_ω`.
- The hypothesis β > 0 is needed: in d = 2 the profile `g(v) = 1_{|v| ≥ 1}` satisfies the bound with `C = 1`, β = 0, and at `v = 0`, for `w = r e_1` and ω = (1, 1)/√2 the outgoing velocities `v' = (r/2)(1, 1)` and `w' = (r/2)(1, −1)` both have speed `r/√2`; for `r > √2` the gain integrand equals the kernel `r/√2`, and since the same holds on an open cone of `(w, ω)` the gain integral is infinite.

*Needs:* §2.1, §2.2, §9.1, Mathlib `MeasureTheory.Measure.toSphere`, `GaussianFourier.integral_rexp_neg_mul_sq_norm`.

### 10.3 Mild solutions of the Boltzmann equation

Define `HardSphere.IsMildBoltzmannSolution f⁰ T f`, for `T ≥ 0`, `f⁰ : X × E → ℝ` and `f : ℝ → X × E → ℝ`: `f` is jointly measurable (`(t, x, v) ↦ f(t, x, v)` is measurable); there are `C, β > 0` with `|f(t, x, v)| ≤ C exp(−β|v|²/2)` for `t ∈ [0, T]`, and for every `t ∈ [0, T]` and almost every `(x, v)`, `f(t, x + π(t v), v) = f⁰(x, v) + ∫_0^t Q(f(s), f(s))(x + π(s v), v) ds` (BGSS2023 (1.2.1), lines 292–304; GST2013 (2.1.1), lines 380–384).

API:

- Initial value: a mild solution satisfies `f(0, x, v) = f⁰(x, v)` for almost every `(x, v)` (the case `t = 0`, where `π(0 · v) = 0` and the integral vanishes); in particular `f⁰` inherits the Gaussian bound almost everywhere.
- Restriction: a mild solution on `[0, T]` is a mild solution on `[0, S]` for every `0 ≤ S ≤ T`, with the same constants `C`, β.
- Characteristics: since `x ↦ x + π(t v)` preserves `μ_X` (§1.1), the identity is equivalent to `f(t, y, v) = f⁰(y − π(t v), v) + ∫_0^t Q(f(s), f(s))(y − π((t − s) v), v) ds` for almost every `(y, v)`.

**Checks.**

- `f(t) = M_{β,u}` for all `t` (independent of `x`) is a mild solution on every `[0, T]`.
- With `Q` replaced by 0 the definition is the free transport `f(t, x, v) = f⁰(x − π(t v), v)`. In dimension 1 this is the definition itself: `σ_ω(v, w) = (w, v)` for `ω = ±1`, so `Q ≡ 0`, and a mild solution is at each `t` almost everywhere equal to the free transport of `f⁰`.
- Non-example for the transport direction, on the unit circle (d = 1) with `f⁰(x, v) = (1 + 0.5 cos(2πx)) M_{1,0}(v)`: the wrongly signed `f(t, x, v) = f⁰(x + π(t v), v)` gives along the characteristic `f(1/4, π(0 + 1/4), 1) = f⁰(π(1/2), 1) = 0.5 M(1)` at `x = 0`, `v = 1`, `t = 1/4`, while the definition requires `f⁰(0, 1) = 1.5 M(1)`; by continuity the two sides differ on a neighbourhood of `(0, 1)`, a set of positive measure. (A spatially constant datum such as `M` does not discriminate: both signs give `M`.)

*Needs:* §1.1, §10.2.

### 10.4 Lanford's theorem as a proposition

Define `HardSphere.LanfordStatement d : Prop`, for every `d`, on the unit torus `𝕋^d = UnitFlatTorus d` with its quotient norm, its compactness and the measure of §1.3, for a structure `[FlatPositionSpace d (UnitFlatTorus d)]` of §1.1 given as an instance argument (the cover and radius of that structure define the flow, the correlation functions and mild solutions below; §1.3 provides one, and by the Checks every structure gives the same proposition); for `d ≥ 2` it is BGSS2023 Theorem 1 restricted to continuous data: for all `C₀ ≥ 1` and `β₀ > 0` there is `T₀ > 0` such that for every continuous probability density `f⁰ : 𝕋^d × E → ℝ` (nonnegative, of integral 1) with `f⁰(x, v) ≤ C₀ exp(−β₀|v|²/2)` and `|f⁰(x, v) − f⁰(y, v)| ≤ C₀ ‖x − y‖ exp(−β₀|v|²/2)`, there is a mild solution `f` on `[0, T₀]` with datum `f⁰` such that, with `μ_ε = ε^{−(d−1)}` and `F^ε_n(t) = HardSphere.correlation ε μ_ε f⁰ n t` (`f⁰` read as an `ℝ≥0∞`-valued density), for every `t ∈ [0, T₀]`: for every `n ≥ 1` and every bounded continuous `g` on `(𝕋^d × E)^n`, `∫ F^ε_n(t) g → ∫ f(t)^{⊗n} g` as ε → 0⁺; for every `n ≥ 1` and every sequence `ε_k → 0⁺`, `F^{ε_k}_n(t) → f(t)^{⊗n}` almost everywhere; and for every compact `K ⊆ 𝕋^d × E`, the essential supremum over `K` of `|F^ε_1(t) − f(t)|` tends to 0 (BGSS2023 Theorem 1, lines 316–321, for the datum (1.1.5)–(1.1.6), lines 167–181, and the scaling of lines 211–217). Of the probability density `f⁰`, BGSS2023 Theorem 1 assumes only (1.1.5), lines 167–168, a bound on `|f⁰| + |∇_x f⁰|`, and not continuity; the proposition adds continuity, which GST2013 Theorem 4 assumes (line 668) and which the function spaces of GST2013 Theorem 8 require (Definition 5.1.1, lines 1314–1316, spaces of continuous functions), and replaces (1.1.5) by the two bounds above, which (1.1.5) implies (the mean value inequality along a shortest segment) and which give (1.1.5) almost everywhere with `2C₀` in place of `C₀` (Rademacher's theorem). BGSS2023 Theorem 1 prints the second conclusion, and the third as uniform convergence on compact sets, of which the essential supremum is the form independent of representatives; that source states the theorem for the grand canonical gas on the torus, attributes it to Lanford1975, which treats the canonical setting, and refers to other works for its proof (lines 313–315 and 322), recovering by its own route only the convergence of `F^ε_1(t)` in the sense of measures (BGSS2023 Proposition 5.4.1, lines 2874–2895). GST2013 Theorems 4 and 8, with Remark 3.1.1 and Definition 6.2.1 (lines 668–696, 2041–2055 and 2069–2080), are the counterpart on `ℝᵈ` (lines 668 and 833) for a fixed number `N` of particles with `N ε^{d−1} = 1` (line 672), and print convergence of averages against compactly supported continuous functions of the velocities, locally uniformly in the positions off the diagonals; Lanford1975 is likewise the fixed-`N` statement (BGSS2023 lines 313–315). The first conclusion, for every `n`, is printed in none of these statements: it follows from the second (API below), the step that BGSS2023 lines 370–371 take without comment. Its proof for `d ≥ 2` is not part of this roadmap (Scope and ownership); this roadmap proves its consequences.

API:

- For `d ≥ 1`, at `t = 0` every conclusion holds for every mild solution with datum `f⁰`, by §9.6 (`f(0) = f⁰` almost everywhere, §10.3, and `ρ⁰ ≤ C₀ (2π/β₀)^{d/2}`); for `d = 0` it fails (Checks).
- The first conclusion follows from the second. Let `f⁰` be a probability density on `𝕋^d × E` with `f⁰(x, v) ≤ C₀ exp(−β₀|v|²/2)`, `f` a mild solution on `[0, T₀]` with datum `f⁰` (§10.3), `t ∈ [0, T₀]` and `n ≥ 1`, and suppose that `F^{ε_k}_n(t) → f(t)^{⊗n}` almost everywhere along every sequence `ε_k → 0⁺`. Then `∫ F^ε_n(t) g → ∫ f(t)^{⊗n} g` as ε → 0⁺ for every bounded measurable `g` on `(𝕋^d × E)^n`. Route: by §9.5, `F^ε_n(t) ≥ 0` and `∫ F^ε_n(t) = μ_ε^{−n} E[Nat.descFactorial N n]`, which does not depend on `t`; at `t = 0` it tends to `(∫ f⁰)^n = 1` by the `L¹` convergence of §9.6, whose hypothesis holds since `ρ⁰(x) ≤ C₀ (2π/β₀)^{d/2}` (`GaussianFourier.integral_rexp_neg_mul_sq_norm` with `b = β₀/2`). Integrating the identity of §10.3 over `𝕋^d × E`, with the invariance of `μ_X` under `x ↦ x + π(t v)` (§1.1), Fubini's theorem under the bound of §10.2 and the case `ψ = 1` of §10.2, gives `∫ f(t) = ∫ f⁰ = 1`, so `∫ f(t)^{⊗n} = 1`. Scheffé's lemma follows: since `F^{ε_k}_n(t) ≥ 0`, the functions `(f(t)^{⊗n} − F^{ε_k}_n(t))^+` are dominated by `|f(t)^{⊗n}|` and tend to 0 almost everywhere, so their integrals tend to 0 (`MeasureTheory.tendsto_integral_of_dominated_convergence`), and `∫ |F^{ε_k}_n(t) − f(t)^{⊗n}| = ∫ F^{ε_k}_n(t) − 1 + 2 ∫ (f(t)^{⊗n} − F^{ε_k}_n(t))^+ → 0`. So `∫ F^{ε_k}_n(t) g → ∫ f(t)^{⊗n} g` along every sequence, hence as ε → 0⁺, the filter `𝓝[>] 0` being countably generated (`Filter.tendsto_iff_seq_tendsto`). The sign of `f(t)` is not used.

**Checks.**

- The quantifier order gives `T₀` depending only on `d`, `C₀`, `β₀`, as in BGSS2023 line 319.
- The proposition is false for `d = 0`, so the hypothesis `d ≥ 2` of §10.5 and of the roadmap on the BBGKY hierarchy that proves it (Scope and ownership) is needed. There `E`, `𝕋⁰` and the phase space `𝕋⁰ × E` are points of mass 1, `μ_ε = Real.toNNReal (ε⁻¹ ^ 0) = 1` (Conventions), and no two particles of positive diameter fit, so `𝒟̄_N = ∅` for `N ≥ 2`. For `f⁰ = 1`, admissible with `C₀ = 1` and every β₀ > 0, the partition function is `1 + 1 = 2` and `F^ε_1(t) = 1/2` for every ε > 0 and every `t`, while the unit sphere of `E` is empty, so `Q = 0` and every mild solution has `f(t) = 1`; with `g = 1` the first conclusion would need `1/2 → 1`, already at `t = 0`.
- For a Maxwellian datum `f⁰ = M_{β₀,0}` (admissible when `C₀ ≥ (β₀/2π)^{d/2}`) the solution is `f(t) = f⁰`, the correlation functions are independent of `t` by §9.4–9.5, and every conclusion holds by §9.6; the proposition is consistent at equilibrium.
- The almost-everywhere conclusion is stated along sequences: along the filter ε → 0⁺ it would depend on the choice of representatives of uncountably many functions.
- The proposition is the same for every structure of §1.1 on `𝕋^d`. Such a structure is the cover `π ∘ B` for an orthogonal `B` with a radius `ρ' ≤ 1/2`: its cover is 1-Lipschitz, so it lifts through the covering map `π` to a continuous additive, hence linear, map `B : E → E`, of operator norm at most 1 because `‖π b‖ = |b|` for `|b| ≤ 1/2`; the local-measure axiom on a small ball gives `|det B| = 1`, so every singular value of `B` is 1; and `B⁻¹(e_1/2)` and `B⁻¹(−e_1/2)`, of norm 1/2, have the same image, so injectivity fails for `ρ' > 1/2`. Conversely each such pair satisfies every axiom of §1.1. For `π ∘ B` the contact normals are `B⁻¹ν` and `σ_{B⁻¹ν}(v, w) = B⁻¹σ_ν(Bv, Bw)`, so the flow, the correlation functions and the mild solutions are those of `π` conjugated by `(X, V) ↦ (X, BV)` (the collision operator commutes with this map, the sphere measure and the kernel being rotation invariant); the proposition for `π ∘ B` and the datum `f⁰` is the proposition for `π` and the datum `f⁰(x, B⁻¹v)`, which satisfies the same two bounds since they depend on `|v|` only; and a smaller radius only shrinks the range `ε < ρ'`, which the limit ε → 0⁺ does not see. Witness in d = 2 with the quarter turn `B(a_1, a_2) = (−a_2, a_1)`: `π(B(0.3, 0)) = π(0, 0.3)` has norm `0.3 = |(0.3, 0)|` and its lift for `π ∘ B` is `(0.3, 0)`; free transport for `π ∘ B` from `π(0)` with `v = (1, 0)` for time 0.3 reaches `π(0, 0.3)`, the point reached for `π` with `Bv = (0, 1)`; and at radius 0.6 the points `(0, 0.5)` and `(0, −0.5)` have the images `π(−0.5, 0) = π(0.5, 0)`.

*Needs:* §1.1, §1.3, §9.5, §9.6, §10.2, §10.3, Mathlib `GaussianFourier.integral_rexp_neg_mul_sq_norm`, `MeasureTheory.tendsto_integral_of_dominated_convergence`, `Filter.tendsto_iff_seq_tendsto`.

### 10.5 The law of large numbers

Prove `HardSphere.tendsto_empirical_of_correlation`: on a flat position space, let `f⁰ : X × E → ℝ≥0∞` be measurable with `∫ f⁰ < ∞`, `t ∈ ℝ`, `ε ↦ μ_ε ∈ ℝ≥0` with `μ_ε → ∞` as ε → 0⁺, and `f : X × E → ℝ` integrable; write `P_ε = HardSphere.grandCanonical ε μ_ε f⁰` (§9.3), `F^ε_n(t) = HardSphere.correlation ε μ_ε f⁰ n t` (§9.5) and `π^ε_t` for the empirical measure of §10.1 with `μ = μ_ε`. If for `n = 1` and `n = 2` and every bounded continuous `g` on `(X × E)^n`, `∫ F^ε_n(t) g → ∫ f^{⊗n} g` as ε → 0⁺ (with `F^ε_n(t)` read through `toReal` and `f^{⊗n}(Z) = Π_i f(z_i)`), then for every bounded continuous `h` and every δ > 0, `P_ε(|π^ε_t(h) − ∫ f h| ≥ δ) → 0` (BGSS2023 Corollary 1.2.1, lines 344–349, proof lines 352–371; the hypotheses here are the convergence of the two integrals, which that proof draws at lines 370–371 from the almost-everywhere clause of Theorem 1, the step given by the API of §10.4). Route: for ε small, `0 < ε < ρ` and `μ_ε > 0`, so `P_ε` is a probability measure (§9.3), `π_t(h)` is square integrable (`|π_t(h)| ≤ ‖h‖_∞ N/μ_ε` and `N` has finite moments, §9.3), and the identities of §10.1 give `E[π_t(h)] = ∫ F_1 h → ∫ f h` and `E[(π_t(h) − ∫ f h)²] = μ^{−1}∫F_1 h² + ∫F_2 h⊗h − 2(∫f h)(∫F_1 h) + (∫ f h)² → 0`. Chebyshev's inequality is centred at the mean `E[π_t(h)]`, not at `∫ f h`: since `Var(π_t(h)) ≤ E[(π_t(h) − ∫ f h)²]` and, for ε small, `|E[π_t(h)] − ∫ f h| < δ/2`, the event `{|π_t(h) − ∫ f h| ≥ δ}` lies in `{|π_t(h) − E[π_t(h)]| ≥ δ/2}`, whose probability is at most `4 Var(π_t(h))/δ²` by `ProbabilityTheory.meas_ge_le_variance_div_sq` at `c = δ/2`. Prove the corollary `HardSphere.LanfordStatement.tendsto_empirical`: let `d ≥ 2`, take a structure `[FlatPositionSpace d (UnitFlatTorus d)]` of §1.1 as an instance argument as in §10.4, and assume `HardSphere.LanfordStatement d` for that structure; then for all `C₀ ≥ 1` and `β₀ > 0` there is `T₀ > 0` such that for every continuous probability density `f⁰` on `𝕋^d × E` satisfying the two bounds of §10.4 with these constants there is a mild solution `f` on `[0, T₀]` with datum `f⁰` (§10.3) such that, with `μ_ε = ε^{−(d−1)}` and `P_ε`, `π^ε_t` as above, for every `t ∈ [0, T₀]`, every bounded continuous `h` on `𝕋^d × E` and every δ > 0, `P_ε(|π^ε_t(h) − ∫ f(t) h| ≥ δ) → 0` as ε → 0⁺. Route: take the `T₀` and the `f` of §10.4; for `d ≥ 2`, `μ_ε → ∞`; at each `t ∈ [0, T₀]` the weak clause of §10.4 with `n = 1` and `n = 2` gives the two hypotheses of the first theorem for `f(t)`, which is measurable (a section of the jointly measurable `f`) and integrable, being bounded by `C exp(−β|v|²/2)`, whose integral over `E` is `(2π/β)^{d/2}` (`GaussianFourier.integral_rexp_neg_mul_sq_norm` with `b = β/2`), on a space of mass `μ_X(𝕋^d) = 1` in position (§1.3).

**Checks.**

- At the Maxwellian equilibrium on the unit torus in dimension `d ≥ 2`, where `μ_ε = ε^{−(d−1)} → ∞`, the hypotheses hold with `f = M` by §9.4 and §9.6, and the conclusion is a law of large numbers for a stationary gas. It is also the corollary for `f⁰ = M_{1,0}`, β₀ = 1 and `C₀ = 1 ≥ (2π)^{−d/2}` (`1/(2π) ≈ 0.15915` for d = 2): the mild solution provided by §10.4 is then `M` almost everywhere at each `t ∈ [0, T₀]`, since `F^ε_1(t) = F^ε_1(0)` (§9.4–9.5) converges weakly to `M` by §9.6 and an integrable function is determined almost everywhere by its integrals against bounded continuous functions.
- Non-example in dimension 1: there `μ_ε = ε⁰ = 1` does not tend to ∞. On the unit circle with `f⁰ = M_{1,0}`, each term `(1/N!) μ_X^{⊗N}(𝒟̄^ε_N)` of the partition function increases to `1/N!` as ε → 0 and is dominated by it, so `Z_ε → e` and `P_ε(N = 1) = 1/Z_ε → e^{−1}`; for `h = 1` one has `π^ε_t(1) = N` and `∫ f h = 1`, so with δ = 1/2, `P_ε(|π^ε_t(1) − 1| ≥ 1/2) = P_ε(N ≠ 1) → 1 − e^{−1} ≈ 0.63212`, not 0, although the correlation functions converge by §9.6.
- `ε = 0` at `t = 0` (Poisson process with intensity `μ f⁰`; the flow is not used, `T_0` being the identity by §7.1): `F_1(0) = f⁰` and `F_2(0) = f⁰ ⊗ f⁰` for every `μ > 0` and every finite mass of `f⁰` (the definition of §9.5 with `Z = exp(μ ∫ f⁰)`, §9.3; for infinite mass `Z = ∞` and both vanish), so the identities of §10.1 give `Var(π_0(h)) = μ^{−1} ∫ f⁰ h²` exactly, which tends to 0 as `μ → ∞`. For μ = 2, `∫ f⁰ = 1` and `h = 1`, `π_0(1) = N/2` with `N` Poisson of parameter 2, of variance `2/4 = 1/2 = μ^{−1} ∫ f⁰`.
- Non-example: convergence of `F_1` alone does not suffice. If `F^ε_1(t) → f` but `F^ε_2(t) → 2 f ⊗ f`, the second moment `E[(π_t(h) − m)²]` about `m = ∫ f h` tends to `0 + 2m² − 2m² + m² = m²`, and so does the variance since `E[π_t(h)] → m`; the limit is positive whenever `m ≠ 0`.

*Needs:* §1.1, §1.3, §9.3, §9.5, §10.1, §10.3, §10.4, Mathlib `ProbabilityTheory.meas_ge_le_variance_div_sq`, `GaussianFourier.integral_rexp_neg_mul_sq_norm`.

### Examples

In dimension `d ≥ 2` the stationary Maxwellian gas on the unit torus satisfies the law of large numbers with no further hypothesis (§9.4–9.6 and §10.5); in dimension 1 the Boltzmann–Grad scaling keeps `μ_ε = 1`, the particle number converges in law to `ProbabilityTheory.poissonMeasure 1`, and the law of large numbers fails (Checks of §10.5). Out of equilibrium, for `d ≥ 2`, the law of large numbers holds under `HardSphere.LanfordStatement d` on the interval `[0, T₀]` that the proposition provides for the constants `C₀`, β₀ of the datum, with the mild solution it provides as the limit (§10.5).

### Dependencies

Layers 1–2, 7 and 9; Mathlib (the sphere measure, Gaussian integrals, dominated convergence, limits along sequences for countably generated filters, Chebyshev's inequality); Tau Ceti `TauCeti.Probability.empiricalFiniteMeasure`, `TauCeti.Probability.card_smul_empiricalFiniteMeasure` and `TauCeti.Probability.empiricalMeasureOfFintype` (§10.1).

## Downstream consumers

- A roadmap on the BBGKY hierarchy and Lanford's theorem (GST2013 Chapters 5–7 and Part IV; BGSS2023 §2) would prove `HardSphere.LanfordStatement d` for every `d ≥ 2` (it is false for `d = 0`, Checks of §10.4), for the structure of §1.3 on `𝕋^d` (hence for every structure, by the Checks of §10.4), from the flow (Layer 7), the marginals and correlation functions (§8.3, §9.5), the collision operator (§10.2) and initial chaos (§9.6).
- A roadmap on fluctuations and large deviations of the hard-sphere gas (BGSS2023 Theorems 2–3) builds the fluctuation field from the empirical measure (§10.1) and the grand canonical measure (§9.3).
- A roadmap on long-time derivations (DengHaniMa2024 Theorem 1, line 291) reuses the dynamics on Euclidean space (Layers 5–7) and the left-continuous convention (§5.4).
- A roadmap on the Boltzmann equation (Cauchy problem, H theorem, characterisation of collision invariants; GST2013 §2.2–2.3) consumes §2.2, §9.1 and §10.2–10.3.
- Roadmaps on infinite hard-sphere systems (Alexander1976), on short-range potentials (GST2013 Part III) and on uniform bounds for the number of collisions reuse the two-body problem (Layer 4) and Alexander's theorem (Layer 6).
- A roadmap on dispersing billiards and the ergodicity of hard-sphere systems consumes the two-body problem as the billiard outside a ball (Layer 4) and the flat torus (§1.3).

## Worked examples

**Head-on collision on `E`, d = 2, ε = 1.** Start at `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. In relative coordinates `a = (2, 0)`, `u = (−1, 0)`, `D = 1`, `τ = 1`, `q = (1, 0)`. The state at time 1 is `x_1 = (1, 0)`, `x_2 = 0`, `v_1 = 0`, `v_2 = (−1, 0)`; at time 3 it is `x_1 = (1, 0)`, `x_2 = (−2, 0)`, and `B_3(a, u) = ((3, 0), (1, 0))` is the relative state. The reversal of the time-3 state runs back to the reversal of the initial state.

**Contact through the torus.** On the unit torus with ε = 0.3, particles at `π(0.1, 0)` and `π(0.8, 0)` are in contact across the boundary, with contact normal `(1, 0)`; with relative velocity `(−1, 0)` they collide at once and leave with relative velocity `(1, 0)`.

## References

- GST2013: I. Gallagher, L. Saint-Raymond, B. Texier, *From Newton to Boltzmann: hard spheres and short-range potentials*, Zurich Lectures in Advanced Mathematics, EMS 2013; arXiv:1208.5753v2. Chapter 2 (Boltzmann equation, lines 375–560), Chapter 4 (N-particle flow, Proposition 4.1.1, Lemma 4.1.1, Liouville equation, marginals, lines 826–1240), Theorem 4 (line 668), Theorem 8 (line 2069).
- BGSS2023: T. Bodineau, I. Gallagher, L. Saint-Raymond, S. Simonella, *Statistical dynamics of a hard sphere gas: fluctuating Boltzmann equation and large deviations*, Ann. of Math. 198 (2023); arXiv:2008.10403v2. §1.1 (lines 118–288), §1.2 (lines 291–371).
- DengHaniMa2024: Y. Deng, Z. Hani, X. Ma, *Long time derivation of the Boltzmann equation from hard sphere dynamics*; arXiv:2408.07818v3. §1.1 (lines 134–300).
- Alexander1976: R. K. Alexander, *Time evolution for infinitely many hard spheres*, Comm. Math. Phys. 49 (1976), 217–232, Proposition 4.3 (the finite-system statement, as cited in GST2013 line 855).
- AlexanderThesis1975: R. K. Alexander, *The infinite hard sphere system*, PhD thesis, Berkeley 1975, Chapter 1 (background for the finite system).
- Lanford1975: O. E. Lanford III, *Time evolution of large classical systems*, Lecture Notes in Phys. 38, Springer 1975, the convergence theorem (cited as BGSS2023 reference [47], line 316, and GST2013 reference [34], line 667).
- CIP1994: C. Cercignani, R. Illner, M. Pulvirenti, *The Mathematical Theory of Dilute Gases*, Springer 1994, Chapters 2 and 4 (background).
- Spohn1991: H. Spohn, *Large Scale Dynamics of Interacting Particles*, Springer 1991, Part I (background).
- Uchiyama1988: K. Uchiyama, *Derivation of the Boltzmann equation from particle dynamics*, Hiroshima Math. J. 18 (1988), 245–297 (background exposition of Lanford's theorem).
