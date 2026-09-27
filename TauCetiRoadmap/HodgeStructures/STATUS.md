<!--tauceti-status:v1 {"roadmap":"HodgeStructures","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: HodgeStructures

This file documents the status of the HodgeStructures roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All four milestones — the L0 Hodge decomposition, L1 semisimplicity, L2 strictness and the L3 Hodge-number partition — are proved, and the core definitions have the shape the README specifies. Partial: the L2 companions (coarse conjugation relation on Deligne's bigrading; no abelian structure on the mixed category) and the worked instances (Tate complete, the effective weight-one instance not built). No layer is untouched.

### Named results

- **The Hodge decomposition** — the components H^{p,n−p} = F^p ∩ conj F^{n−p} of a bounded n-opposed filtration form an internal direct sum, and conversely (Deligne's equivalence, `decompositionEquiv`) ([`TauCeti.Hodge.HodgeStructureOn.isInternal_piece`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Decomposition.html#TauCeti.Hodge.HodgeStructureOn.isInternal_piece)).
- **Semisimplicity of polarizable rational Hodge structures** — every rational Hodge substructure of a polarizable pure Hodge structure has a complement over ℚ and after complexification, orthogonal for some polarizing form; proved via the Weil operator and the positive-definite Hodge form ([`TauCeti.Hodge.exists_isCompl_of_isPolarizable`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Orthogonal.html#TauCeti.Hodge.exists_isCompl_of_isPolarizable)).
- **Deligne's theorem on the bigrading** — the pieces I^{p,q}, defined by Deligne's closed formula in F, conj F and W, form an internal direct sum of the complex space, recovering W_k as ⨆_{p+q≤k} I^{p,q} and F^p as ⨆_{p'≥p} I^{p',q'} ([`TauCeti.Hodge.MixedHodgeStructure.isInternal_deligneSplittingFamily`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Mixed/Decomposition.html#TauCeti.Hodge.MixedHodgeStructure.isInternal_deligneSplittingFamily)).
- **Strictness of morphisms of mixed Hodge structures** — a morphism is strict for the Hodge filtration, range f ⊓ F'^p = f(F^p), and likewise for the rational and the complexified weight filtrations ([`TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Mixed/Strictness.html#TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F)).
- **The Hodge numbers partition the dimension** — ∑ h^{p,n−p} = dim_ℂ V_ℂ, equal to the lattice rank, with Hodge symmetry h^{p,q} = h^{q,p} ([`TauCeti.Hodge.HodgeStructureOn.finsum_hodgeNumber_eq_finrank`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Dimension.html#TauCeti.Hodge.HodgeStructureOn.finsum_hodgeNumber_eq_finrank)).

### Notable definitions and infrastructure

- [`TauCeti.Hodge.HodgeStructureOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Structure.html#TauCeti.Hodge.HodgeStructureOn) — the one pure-Hodge object, parametric in a bundled `Conjugation`, the integral `HodgeStructure` being an abbreviation; it lets each graded piece of a mixed Hodge structure literally carry a pure structure, and sub-structures, quotients, duals and tensor products be built once.
- [`TauCeti.Hodge.MixedHodgeStructure.deligneSplitting`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Mixed/DeligneSplitting.html#TauCeti.Hodge.MixedHodgeStructure.deligneSplitting) — the bigrading as data rather than an existential, so strictness is proved through it and functoriality (a morphism carries I^{p,q} into I^{p,q}) is a lemma about a fixed object.
- [`TauCeti.BilinForm.isometryGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/BilinearForm/Isometry.html#TauCeti.BilinForm.isometryGroup) — Aut(M,B) of a bilinear form as a subgroup, with base change as a group homomorphism and unit determinant over ℤ; where the successor's monodromy lands, at general bilinear-form level rather than under the README's `IsLatticeIsometry` name.

### Roadmap coverage

- *Core definitions*: done on all five points, including the abstract conjugation-equivariance target for complexified rational maps; the composed tower witness `IsBaseChange ℂ (ι_{ℚℂ} ∘ₗ ι_ℚ)` is not visible among the landed declarations.
- *Worked instances*: Tate ℤ(m) done at every layer (pure, polarized, Hodge type, period-domain point, mixed); pure-as-mixed done (`ofPure`); effective weight one partial — the almost complex structure J and the eigenspace comparison are derived from a Hodge structure, but no instance is built from a lattice with J and Riemann form.
- *L0*: milestone done in both directions; companions done for morphisms, conjugation symmetry, dual, tensor product and Tate twist, plus sub-Hodge structures, quotients and strictness of pure morphisms; internal Hom untouched.
- *L1*: milestone done; Weil operator and Hodge form as the README asks, packaged as an inner-product core; no bundled category of pure Hodge structures, so the categorical reading of semisimplicity is not stated.
- *L2*: milestone done; bigrading defined with internal direct sum, recovery of both filtrations and functoriality; conjugation relation partial (modulo W_{p+q−2} rather than ⨆_{r<p,s<q} I^{r,s}); morphisms bundled into a preadditive ℚ-linear category with realization functors, abelian structure untouched.
- *L3*: milestone done, with `HodgeType`, `PeriodDomain.Point` predicating the fixed form, and the symmetry group packaged as a subgroup.

## The frontier

- **The fine conjugation relation on Deligne's bigrading** — prove conj I^{p,q} ≡ I^{q,p} modulo ⨆_{r<p,s<q} I^{r,s}; the landed statement is modulo the whole weight step W_{p+q−2}, and the bigrading API it needs (independence, recovery of W) is in place.
- **The abelian category of mixed Hodge structures** — kernels and cokernels of morphisms as mixed Hodge structures, from strictness; the preadditive ℚ-linear category and both strictness theorems exist.
- **The effective weight-one instance** — a polarized effective weight-1 structure from (Λ ≅ ℤ^{2g}, J, E), the abelian-variety case; the real form so far enters only as the fixed points of the conjugation inside `realAlmostComplexStructure`, and a first-class V_ℝ with its structure map is the prerequisite.
- **Internal Hom of pure Hodge structures** — the last L0 companion; dual and tensor product exist, so Hom(V,W) = V^∨ ⊗ W is within reach.
- **The composed base-change witness** — `IsBaseChange ℂ (ι_{ℚℂ} ∘ₗ ι_ℚ)` from the two legs, so the tower is consumed as a property instead of transported along `rationalToComplexLinearEquiv`.
