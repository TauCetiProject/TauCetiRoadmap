# Progress log: HamiltonianFloerOperations

An append-only record of what landed on the HamiltonianFloerOperations roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"cb38e65bc62b9602c6d3c434a445536d15b67e5c","prs":[19069],"roadmap":"HamiltonianFloerOperations","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1"}-->
## HamiltonianFloerOperations: 2026-10-20 to 2026-10-21 (`cb38e65` to `273ea28`)

The first piece of this roadmap is the coefficient group for capped Hamiltonian Floer theory: the [period group](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PeriodGroup.html#TauCeti.Floer.PeriodGroup) Γ, the quotient of the spherical classes by the joint kernel of symplectic area and first Chern number (TauCeti#19069). Quotienting by both kernels rather than by area alone keeps apart classes that have equal energy but different degree, and the file proves exactly that: a class is [determined by its area and Chern number](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PeriodGroup.html#TauCeti.Floer.PeriodGroup.ext_iff), so Γ is torsion-free. It also identifies the special cases the roadmap's classical branch uses. For a spherically monotone pair Γ is [cyclic](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PeriodGroup.html#TauCeti.Floer.PeriodGroup.isAddCyclic_of_area_eq_mul_chern). When the Chern number vanishes, [area embeds Γ into ℝ](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PeriodGroup.html#TauCeti.Floer.PeriodGroup.area_injective_of_chern_eq_zero). And Γ is [trivial](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PeriodGroup.html#TauCeti.Floer.PeriodGroup.subsingleton_iff) exactly when both periods vanish, as they do on aspherical targets. Induced maps of period groups are functorial and always injective.

All of this is stated for an arbitrary additive group with two homomorphisms to ℝ and ℤ. It is not yet attached to the Hurewicz image of an actual symplectic manifold, and caps, the Novikov ring and every analytic layer of the roadmap remain to be built.
