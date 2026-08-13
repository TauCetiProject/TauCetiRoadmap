<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"11ef09d4d6e560655ed762ace27ef2858e9117cd","ts":"2026-08-03T18:31:13Z"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `11ef09d` (2026-08-03T18:31:13Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane C, the classical maximum-principle and potential theory, is the only lane with genuine theorems: the weak maximum principle is done in any finite dimension for the full operator `-Δ - b·∇ + c` with `c ≥ 0`, and Harnack plus the strong maximum principle are done in the plane. Lane D has its algebra but no existence theorem, because Lane A's weak-derivative Sobolev spaces do not yet exist; Lanes B, E and F are untouched.

### Named results

- **The weak maximum principle for second-order elliptic operators** — a `C²` function on a compact set satisfying `c u ≤ Δu + b·∇u`, with `c ≥ 0` and `b` bounded on the interior, is bounded by any nonnegative bound it respects on the frontier ([`le_of_mul_le_laplacian_add_fderiv_le_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Laplacian/LowerOrderMaximumPrinciple.html#TauCeti.le_of_mul_le_laplacian_add_fderiv_le_frontier)). Comparison principles and Dirichlet uniqueness follow at each of the three levels of generality.
- **Harnack's inequality in the plane** — a nonnegative harmonic function on a disk of radius `R` about `c` obeys the sharp two-sided comparison `(R-‖w-c‖)/(R+‖w-c‖) · f c ≤ f w ≤ (R+‖w-c‖)/(R-‖w-c‖) · f c` ([`harnack_inequality_center`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Harnack/Planar.html#TauCeti.harnack_inequality_center)), with the version on a smaller concentric disk beside it.
- **The strong maximum principle in the plane** — a harmonic function on a preconnected planar set attaining an interior maximum is constant on the whole set ([`eqOn_const_of_harmonicOnNhd_of_isMaxOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Harnack/StrongPrinciple.html#TauCeti.eqOn_const_of_harmonicOnNhd_of_isMaxOn)), with the minimum, local-extremum and comparison forms.
- **Necessity of the sign condition** — a negative constant zeroth-order coefficient admits zero frontier data with a positive interior solution, so `c ≥ 0` cannot be dropped ([`exists_neg_constant_laplacian_eq_mul_eq_zero_on_frontier_pos`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Laplacian/SignCondition.html#TauCeti.exists_neg_constant_laplacian_eq_mul_eq_zero_on_frontier_pos)), discharging one of the roadmap's acceptance criteria.
- **The pointwise Gårding inequality** — under uniform ellipticity `λ` and a drift bound `β`, with `c ≥ 0`, the energy density is at least `(λ/2)‖∇u‖² - (β²/2λ)|u|²` ([`garding_energyIntegrand_self_of_bounds`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/EnergyForm/Basic.html#TauCeti.PDE.garding_energyIntegrand_self_of_bounds)). It is pointwise: the integrated `H¹` statement needs a Sobolev space.

### Notable definitions and infrastructure

- [`energyIntegrand`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/EnergyForm/Basic.html#TauCeti.PDE.energyIntegrand) bundles the weak-form integrand of `L u = -∂ⱼ(aⁱʲ ∂ᵢu) + bⁱ ∂ᵢu + cu` as a continuous bilinear form on value-gradient jets, coefficients kept as separate, explicit data. Symmetry, linearity in the coefficient triple, the operator-norm bound `Λ + β + γ` and `L²`-integrated forms for constant and variable coefficients are in place.
- [`planarNewtonianKernel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/FundamentalSolution/Planar.html#TauCeti.planarNewtonianKernel) is the logarithmic kernel on `ℂ`, harmonic off its pole, with its gradient computed and outward flux `-1` through every circle about the pole. That flux is the normalisation a Green's function and a representation formula will consume.
- [`IsCoercive.solutionOfFunctional`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/LaxMilgram.html#TauCeti.IsCoercive.solutionOfFunctional) names the Lax-Milgram solution for a continuous linear functional and characterises it by the variational equation, turning Mathlib's equivalence into the existence-and-uniqueness interface Lane D will call.

### Roadmap coverage

Lane C is the furthest along: weak maximum and minimum principles, comparison and uniqueness for `Δ`, `Δ + b·∇` and `-Δ - b·∇ + c` in any finite dimension; Harnack and the strong principle in the plane only, since they run through Mathlib's complex harmonic theory; the fundamental solution only a planar kernel with classical properties, with no `-ΔG = δ`, Green's function, Poisson kernel or Perron method. Lane D has the energy form, its estimates and the Lax-Milgram interface, but no weak solution, Fredholm alternative or spectrum of `-Δ`. Lane A has only fragments: ball normalisation and dilation scaling of `Lᵖ` norms and derivatives. Nothing surveyed here defines `W^{k,p}(Ω)`, Poincaré, trace, extension, Rellich-Kondrachov or Hölder spaces. Lanes B, E and F are untouched, as are the stretch goals.

## The frontier

- **`W^{k,p}(Ω)` via weak derivatives.** The blocking prerequisite for everything downstream: the weak derivative, the norm, completeness, then `W^{k,p}_0` as the `C_c^∞`-closure. Until it exists the energy forms must be stated on square-integrable value-gradient jets, which carry nothing relating the two components.
- **Existence for the Dirichlet problem.** What separates the pointwise Gårding bound from the first end-to-end PDE theorem is an integrated version on `H¹_0(Ω)` plus Poincaré, which together give coercivity; the Lax-Milgram wrapper then applies verbatim.
- **The mean-value property on `ℝⁿ`.** Harnack and the strong maximum principle are planar because their proofs go through complex analysis. The `n`-dimensional mean-value characterisation is what would lift both, and would also give the `n ≥ 3` Newtonian kernel.
- **`-ΔG = δ` and the Green's function.** The flux computation is the classical ingredient; what remains is the distributional statement, then the Green's function and Poisson kernel on the ball, and Perron's method with barriers for boundary attainment.
- **Lane B from scratch.** Hardy-Littlewood maximal function, Marcinkiewicz and Riesz-Thorin interpolation, Calderón-Zygmund decomposition. Nothing started, and Lane E cannot begin without it.
