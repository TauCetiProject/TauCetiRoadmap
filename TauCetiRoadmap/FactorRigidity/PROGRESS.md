# Progress log: FactorRigidity

An append-only record of what landed on the FactorRigidity roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"10302fd58c96c028fd7afd8f2f31148758bbd6b4","prs":[28953,31280],"roadmap":"FactorRigidity","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
## FactorRigidity: 2026-11-07 to 2026-11-09 (`10302fd` to `7ca783d`)

Property (T) has its first footing in the library. A subgroup Λ of a discrete group now has [relative property (T)](https://taucetiproject.org/docs/TauCeti/GroupTheory/PropertyT.html#Subgroup.RelativePropertyT) when every unitary representation with [almost invariant vectors](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Continuous/AlmostInvariant.html#ContRepresentation.HasAlmostInvariantVectors) has a nonzero Λ-invariant vector, and the [Kazhdan pair characterization](https://taucetiproject.org/docs/TauCeti/GroupTheory/PropertyT/KazhdanPair.html#Subgroup.relativePropertyT_iff_exists_isKazhdanPair) is proved: this holds exactly when a single finite set F and a δ > 0 suffice. The converse direction builds one bad representation from many by taking their [Hilbert direct sum](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Continuous/Unitary/HilbertSum.html#ContRepresentation.hilbertSum), whose invariant vectors are computed coordinatewise; because of that sum the equivalence is stated for representations in a universe large enough to hold both the group and the summands.

The remaining work covers the roadmap's sanity checks and basic permanence. The trivial subgroup and every finite subgroup have relative property (T), so [finite groups have property (T)](https://taucetiproject.org/docs/TauCeti/GroupTheory/PropertyT.html#Subgroup.relativePropertyT_top_of_finite), by an averaging argument that also gives (Γ, 1) as an explicit Kazhdan pair. The property passes to smaller subgroups and to images under homomorphisms. The quantitative and positive-definite forms of the characterization, finite-index transfer, and the action of SL₂(ℤ) on ℤ² are not yet here, so the pair (ℤ²⋊SL₂(ℤ), ℤ²) remains out of reach.
