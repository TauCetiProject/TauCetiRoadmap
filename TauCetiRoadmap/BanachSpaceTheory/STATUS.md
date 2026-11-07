<!--tauceti-status:v1 {"roadmap":"BanachSpaceTheory","to_sha":"69cd1ab4dcfbb6676e344f3f193e63473eab5a3d","ts":"2026-10-25T14:11:34Z"}-->
# Status: BanachSpaceTheory

This file documents the status of the BanachSpaceTheory roadmap up until `69cd1ab` (2026-10-25T14:11:34Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** B1 is essentially done. Pietsch domination and factorization, the first of the five depth milestones, are proved. B2, B3, B4, B6 and B7 are all partial: the hard compactness theorems of B2, the tensor completions of B4, Grothendieck's inequality, local reflexivity and Dvoretzky's theorem are all still missing. B5 has not begun.

### Named results

- **The Pietsch domination theorem** — an operator has `p`-summing norm at most `C` exactly when some regular Borel probability measure `ν` on the weak-star compact dual ball gives `‖Tx‖ ≤ C (∫ |f(x)|ᵖ dν)^(1/p)` ([`summingENorm_le_ofReal_iff_exists_isProbabilityMeasure`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/AbsolutelySumming/Pietsch.html#ContinuousLinearMap.summingENorm_le_ofReal_iff_exists_isProbabilityMeasure)). It also comes as a [factorization](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/AbsolutelySumming/Factorization.html#ContinuousLinearMap.summingENorm_le_ofReal_iff_exists_eq_comp_codRestrict_topologicalClosure) through the closure of the image of `E` in `Lᵖ(ν)`.
- **The closed-range theorem** — a bounded operator between Banach spaces has closed range exactly when its adjoint does ([`isClosed_range_precomp_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Dual/Adjoint.html#ContinuousLinearMap.isClosed_range_precomp_iff)). The `c₀₀ ⊂ ℓ²` example shows that the domain must be complete.
- **The Bishop–Phelps theorem** — norm-attaining functionals are dense in the dual of a Banach space ([`dense_setOf_exists_norm_apply_eq_norm`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Dual/BishopPhelps.html#TauCeti.dense_setOf_exists_norm_apply_eq_norm)). The support-point and support-functional forms for closed convex sets are proved too.
- **The Milman–Pettis theorem** — every uniformly convex Banach space is reflexive ([`surjective_inclusionInDoubleDual_of_uniformConvexSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Uniform.html#TauCeti.surjective_inclusionInDoubleDual_of_uniformConvexSpace)). Together with [Clarkson's inequality](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Function/Lp/UniformConvex.html#MeasureTheory.Lp.norm_add_rpow_add_norm_sub_rpow_le), it gives reflexivity of `Lᵖ` for `2 ≤ p < ∞`.
- **James's basis criterion** — a Banach space with a Schauder basis is reflexive exactly when the basis is shrinking and boundedly complete ([`surjective_inclusionInDoubleDual_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Bases/Reflexive.html#SchauderBasis.surjective_inclusionInDoubleDual_iff)). The bases of `c₀` and `ℓ¹` show that the two conditions are independent.

### Notable definitions and infrastructure

- **The Banach ideal of absolutely p-summing operators** ([`AbsolutelySumming`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/AbsolutelySumming/Basic.html#TauCeti.AbsolutelySumming)). It is complete and contractively included in `Π_q` for `p ≤ q`, with the ideal inequalities and the rank-one norm. This is the carrier on which Pietsch's theorem is stated and to which Grothendieck's `π₂` and `π₁` bounds will apply.
- **The approximation property and its bounded and metric variants** ([`HasApproximationProperty`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/ApproximationProperty/Basic.html#TauCeti.HasApproximationProperty)). MAP ⇒ BAP ⇒ AP is proved, the properties transport along equivalences and projections, and `c₀` and `ℓᵖ` have the MAP. Grothendieck's equivalence and the tensor comparisons will start from here.
- **Projective and injective tensor norms** ([`ProjectiveTensor`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/TensorProduct/ProjectiveSeminorm.html#TauCeti.ProjectiveTensor), [`InjectiveTensor`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/TensorProduct/InjectiveSeminorm.html#TauCeti.InjectiveTensor)). These are the classical `π` and `ε` on the algebraic tensor product: definite cross norms with `ε ≤ π`, where `π` is the largest seminorm bounded on pure tensors. Completions and functoriality are the next layer.

### Roadmap coverage

**B1** is essentially done. **B2** is partial. Reflexivity, Bishop–Phelps, Milman–Pettis and the weakly compact operator theory (including Gantmacher) are done, as is [Šmulian's half](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/WeakSpace/SeqCompact.html#TauCeti.isSeqCompact_toWeakSpace_of_isCompact) of Eberlein–Šmulian. Still missing are the Eberlein direction, James's theorem, Krein–Šmulian, and uniform convexity of `Lᵖ` for `1 < p < 2`. **B3** is partial. Done: the general basis theory, James's criterion, unconditional multipliers, the bases of `c₀` and `ℓᵖ`, `c₀* = ℓ¹`, `(ℓ¹)* = ℓ∞`, Schur's theorem and the non-reflexivity of `c₀` and `ℓ¹`. Missing: `(ℓᵖ)* = ℓᑫ`, the reflexivity of `ℓᵖ` and the Haar basis. **B4** is partial. The approximation-property layer is there except the MAP for `Lᵖ[0,1]`, and so are the algebraic tensor norms. Completed tensors, Grothendieck's equivalence, nuclear operators and integral forms are not. **B6** is partial: `Πₚ` and Pietsch are done, Grothendieck's inequality is not begun. **B7** is partial: it has the Banach–Mazur distance, finite representability and sphere nets, and nothing of local reflexivity, John's ellipsoid or Dvoretzky. **B5** is untouched.

## The frontier

- **Eberlein's half of Eberlein–Šmulian** — weakly sequentially compact sets are weakly compact, in both the absolute and the relative form. The separable metrizability lemmas from the Šmulian direction are already in place.
- **James's theorem and Krein–Šmulian** — the remaining depth results of B2. James's theorem needs the separable reduction and finite norming sets that the README specifies.
- **`(ℓᵖ)* = ℓᑫ` and the reflexivity of `ℓᵖ`** — the last classical sequence-space facts of B3. Clarkson currently covers only `2 ≤ p` on `Lᵖ`, so the range `1 < p < 2` needs either the duality argument or the other uniform-convexity estimate.
- **Completed projective and injective tensor products** — completions, induced maps, and the universal property of `⊗π`. Nuclear operators and Grothendieck's AP equivalence depend on them.
- **Grothendieck's inequality** — the finite Gaussian model and the truncation argument with `κ_ℝ = 8`. Its operator corollaries also need B5's `L∞ ≃ C(K_μ)`, which has not begun.
