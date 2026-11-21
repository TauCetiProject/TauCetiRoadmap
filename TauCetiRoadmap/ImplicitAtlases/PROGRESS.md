# Progress log: ImplicitAtlases

An append-only record of what landed on the ImplicitAtlases roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"3b09acaa9f980cd6ffb9b9ffd826828f1256a1e9","prs":["forgejo:https://git.taucetiproject.org/taucetiproject/tauceti@1#294"],"roadmap":"ImplicitAtlases","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
## ImplicitAtlases: 2026-11-18 to 2026-11-19 (`3b09aca` to `b235000`)

The finite-index bookkeeping that Layer 0 sets up for the atlas engine landed in this window. For a finite set I of indices, the obstruction space E_I = ⊕_(α∈I) E_α of an implicit atlas is now the [external product](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Pi/External.html#Representation.externalPi) of the representations E_α, a representation of Γ_I = ∏_(α∈I) Γ_α. It comes with the equivariant maps the atlas axioms use: coordinate projections, restriction to a smaller index set and its section by extension by zero, relabelling along a bijection of index types, and [the splitting over a disjoint union](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Pi/External.html#Representation.externalPiUnion) E_(I⊔J) ≅ E_I × E_J, which is equivariant for Γ_I × Γ_J ≅ Γ_(I⊔J). Underneath are group, additive and linear versions of [gluing a family on s and a family on t](https://taucetiproject.org/docs/TauCeti/Algebra/Group/Pi/Finset.html#MulEquiv.piFinsetUnion) into one on s ∪ t, with [associativity of gluing](https://taucetiproject.org/docs/TauCeti/Data/Finset/Pi.html#Equiv.restrict₂_piFinsetUnion_assoc) proved on underlying functions (https://git.taucetiproject.org/taucetiproject/tauceti/pulls/294).

The orientation side of this bookkeeping is still missing. The roadmap's check that swapping E_(α,β) ≅ E_(β,α) acts by −1 on orientation lines needs the local-homology orientation lines of §0.2, and nothing for them landed. Nothing landed for boundary atlases, subatlases, deformation spaces or the virtual complex either.
