<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"8339b5a9999c7fe7c83ad0ac2b89c5a2754fd8c8","ts":"2026-09-28T06:14:44Z"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `8339b5a` (2026-09-28T06:14:44Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane D, linear elliptic existence by the energy method, is complete from the weak formulation through to the Dirichlet spectrum, and Lane C's maximum principles and Harnack inequality now hold in every dimension, not only the plane. Lane A has its embeddings and a truncation calculus but no trace, extension or general density theorem; Lane B stops at the maximal function; Lane E has only first estimates, Lane F nothing.

### Named results

- **Existence and uniqueness for the Dirichlet problem** — for a divergence-form `L` whose energy form is bounded and coercive on `H¹₀(Ω)`, exactly one `u ∈ H¹₀(Ω)` satisfies `a(u, v) = ∫_Ω f v` for every test `v` ([`existsUnique_isWeakSolutionDirichlet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/DirichletProblem.html#TauCeti.PDE.existsUnique_isWeakSolutionDirichlet)). Coercivity comes from Gårding with Poincaré inside a ball or slab, or from a mass floor `β² < 4λδ` on any domain.
- **The Dirichlet eigenfunction basis** — on a bounded domain with symmetric energy form, `L²(Ω)` has an orthonormal basis of Dirichlet eigenfunctions, at positive eigenvalues ([`exists_hilbertBasis_forall_isDirichletEigenvalue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Spectrum.html#TauCeti.PDE.exists_hilbertBasis_forall_isDirichletEigenvalue)); the first is the minimum of the Rayleigh quotient and the optimal Poincaré constant.
- **The strong maximum principle and Harnack's inequality** — a harmonic or subharmonic function on a preconnected open set with an interior maximum is constant ([`eqOn_const_of_harmonicOnNhd_of_isMaxOn_of_isOpen`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Laplacian/StrongMaximumPrinciple.html#TauCeti.eqOn_const_of_harmonicOnNhd_of_isMaxOn_of_isOpen)), and a nonnegative harmonic function has comparable values on a compact subset ([`harnack_inequality`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Harnack/Basic.html#IsCompact.harnack_inequality)). Both rest on the `n`-dimensional mean-value property.
- **Rellich-Kondrachov** — for bounded `Ω` the value map `W^{1,p}_0(Ω) → Lᵖ(Ω)` is compact ([`isCompactOperator_valueL`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/RellichKondrachov.html#TauCeti.W1p0.isCompactOperator_valueL)), as is restriction `W^{1,p}(Ω) → Lᵖ(V)` for `V` relatively compact in `Ω` ([`isCompactOperator_valueL_restrictL`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/W1p/LocalCompactness.html#TauCeti.W1p.isCompactOperator_valueL_restrictL)). The global statement needs boundary regularity.
- **Morrey's embedding** — for `p` above the dimension, a whole-space `W^{1,p}` function has a unique continuous representative, Hölder of exponent `1 - n/p`, and this is a continuous linear injection into the Hölder Banach space ([`morreyEmbedding`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/W1p/HolderEmbedding.html#TauCeti.W1p.morreyEmbedding)). On a domain only the inequality holds.

### Notable definitions and infrastructure

- [`Wkp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/Basic.html#TauCeti.Wkp) is `W^{k,p}(Ω)` built from weak derivatives as an iterated closed graph space, complete at every order, with `W^{k,p}_0(Ω)` the closure of the test functions; restriction to a smaller open set is now a contraction on it, which makes local statements expressible.
- [`posPartAbove`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/W1p/ChainRule.html#TauCeti.W1p.posPartAbove) truncates a Sobolev function above a level, with weak gradient `1_{u>k}∇u` and preservation of the zero-boundary condition; the weak maximum principles and De Giorgi estimates run through it.
- [`HolderSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Holder/Normed.html#TauCeti.HolderSpace) and its first- and second-order counterparts are the `C^{k,α}` Banach spaces, the target of Morrey's embedding, where Schauder theory will be stated.

### Roadmap coverage

Lane A has weak derivatives, `W^{k,p}(Ω)` with completeness, `W^{k,p}_0`, the Gagliardo-Nirenberg-Sobolev and Morrey embeddings, Poincaré and Poincaré-Wirtinger on convex bounded domains, zero-extension, the truncation calculus and the Hölder spaces; missing are Meyers-Serrin density on a general domain, trace, extension, the borderline `p = n` case, and agreement with the Bessel-potential scale. Lane B has the Hardy-Littlewood maximal inequality ([`eLpNorm_maximalFunction_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Integral/MaximalFunction.html#TauCeti.eLpNorm_maximalFunction_le)) and Marcinkiewicz interpolation between two finite exponents, and none of Riesz-Thorin, Calderón-Zygmund or BMO. Lane C has the mean-value property, the maximum principles and Harnack in all dimensions, and the Newtonian kernel, but its potential theory stays planar: a disk Green's function with the Poisson kernel as its normal derivative, and no `-ΔG = δ`, no Perron method, no Hopf lemma. Lane D is done; Lane E has only Caccioppoli and a De Giorgi iteration lemma; Lane F and the stretch goals are untouched.

## The frontier

- **De Giorgi-Nash-Moser.** Caccioppoli for truncations and the iteration lemma are in place, so local boundedness of weak subsolutions is the next step, with Hölder continuity and the weak Harnack inequality behind it. The weak maximum principle still carries a drift-smallness hypothesis `βP < λ` the iteration will need removed.
- **Interior `H²` regularity.** Difference quotients and their uniform bounds are proved; what remains is turning them into second weak derivatives of Lane D's solutions.
- **Meyers-Serrin, trace and extension.** Density is known on `ℝⁿ` and locally inside `Ω`; on a general domain it needs no boundary regularity. A trace with kernel `W^{1,p}_0` and an extension into `W^{1,p}(ℝⁿ)` need Lipschitz `∂Ω`, and would carry Rellich, and the spectral package, to the full space.
- **`-ΔG = δ` and the Green's function in `n` dimensions.** The Newtonian kernel, its sphere flux and the planar Green's function are done; the distributional identity would make the potential-theoretic Dirichlet solution, and Perron's method, available in every dimension.
- **Calderón-Zygmund.** The decomposition, singular integral operators and BMO have not begun, and are the prerequisite for Lane E's `W^{2,p}` and Schauder estimates. Riesz-Thorin is absent too.
