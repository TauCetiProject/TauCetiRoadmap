module

public import Mathlib

/-!
# Topological mirror symmetry for Hitchin systems: target signatures

The roadmap is README.md; this file is not the roadmap. This file records the
roadmap's headline theorems against the pinned APIs. None is statable at these
pins: the geometric carriers listed below are missing. Abstract mixed Hodge
structures, schemes, line bundles, matrices and finite character sums do not
supply those carriers. No numerical or arbitrary-predicate substitute is stated.

The following headline theorems are not statable at the pins:

* Equivariant Katz comparison: lacks geometric compact-support cohomology, its mixed-Hodge realization, and the equivariant scissor/stringy realization carriers.
* Finite-denominator Tate roots: lacks the étale fundamental-group/lisse Tate-sheaf carrier on finite-type scheme models and its finite étale pullback.
* Katz comparison with fractional twists: lacks geometric compact-support cohomology, its mixed-Hodge realization, and the equivariant scissor/stringy realization carriers.
* Stringy counts determine E-polynomials: lacks geometric compact-support cohomology, its mixed-Hodge realization, and the equivariant scissor/stringy realization carriers.
* Principal splittings and constant Brauer classes: lacks represented relative Picard/Picτ and geometric Brauer sheaf cohomology and the principal splitting-torsor carrier.
* Unitary and arithmetic principal splittings: lacks the relative splitting stack, its analytic principal torsor, and flat unitary gerbe splittings in families.
* Evaluation of arithmetic gerbes on abelian varieties over local fields: lacks Brauer groups and gerbes on schemes (the pinned Brauer group is that of a field), the principal splitting torsor, and local Tate duality for abelian varieties.
* Twisted counts as local integrals: lacks abstract dual Hitchin systems, relative gerbes, quotient-stack orbifold measures and compact-support inertia-fibre cohomology.
* Equal volumes of dual regular fibres: lacks abstract dual Hitchin systems, relative gerbes, quotient-stack orbifold measures and compact-support inertia-fibre cohomology.
* Fibrewise gerbe-character integrals: lacks abstract dual Hitchin systems, relative gerbes, quotient-stack orbifold measures and compact-support inertia-fibre cohomology.
* Fibrewise arithmetic mirror symmetry: lacks abstract dual Hitchin systems, relative gerbes, quotient-stack orbifold measures and compact-support inertia-fibre cohomology.
* Complex mirror symmetry for abstract systems: lacks abstract dual Hitchin systems, relative gerbes, quotient-stack orbifold measures and compact-support inertia-fibre cohomology.
* Smoothness of stable fixed-determinant moduli: lacks stable fixed-determinant Higgs moduli and their Hitchin/spectral Picard-Prym torsor carriers.
* Properness of the stable Hitchin morphism: lacks stable fixed-determinant Higgs moduli and their Hitchin/spectral Picard-Prym torsor carriers.
* Determinant change and Γ-twists: lacks stable fixed-determinant Higgs moduli and their Hitchin/spectral Picard-Prym torsor carriers.
* Stable spectral fibres as norm preimages: lacks stable fixed-determinant Higgs moduli and their Hitchin/spectral Picard-Prym torsor carriers.
* Duality of SLn and PGLn Pryms: lacks stable fixed-determinant Higgs moduli and their Hitchin/spectral Picard-Prym torsor carriers.
* Regular locus and abstract-system certificates: lacks stable fixed-determinant Higgs moduli and their Hitchin/spectral Picard-Prym torsor carriers.
* Spectral torsor products, powers and periods: lacks stable fixed-determinant Higgs moduli and their Hitchin/spectral Picard-Prym torsor carriers.
* GLn coprime-degree point counts: lacks the geometric stable D-Higgs moduli carrier and its finite-field point functor.
* SLn coprime-degree point counts: lacks stable fixed-determinant Higgs moduli and geometric point-count/Hodge cohomology carriers.
* Betti and Hodge numbers in coprime degree: lacks stable fixed-determinant Higgs moduli and geometric point-count/Hodge cohomology carriers.
* Duality of the gerbe splitting torsors: lacks powered Hausel–Thaddeus gerbes, spectral Prym torsors and their relative principal splitting carriers.
* Local Brauer splitting of the powered gerbes: lacks powered Hausel–Thaddeus gerbes, spectral Prym torsors and their relative principal splitting carriers.
* The SLn/PGLn dual pair: lacks powered Hausel–Thaddeus gerbes, spectral Prym torsors and their relative principal splitting carriers.
* Genus-one canonical gerbe sectors (README §4.8): lacks the stable fixed-determinant Higgs moduli point, the descended Hausel–Thaddeus gerbe on BΓ with its commutator pairing, and the sector transgression and stringy invariants.
* SLn/PGLn topological mirror symmetry: lacks stable SL/PGL Higgs moduli, geometric Hodge cohomology and gerbe-twisted stringy invariants.
* Canonical-twist Hodge numbers: lacks stable SL/PGL Higgs moduli, geometric Hodge cohomology and gerbe-twisted stringy invariants.
* The justified fibrewise virtual comparison: lacks Hitchin-fibre and inertia-fibre étale cohomology as continuous Galois complexes, with gerbe coefficients and age twists.
* The stronger ungraded fibrewise Galois isomorphism of README §5.4: lacks the actual Hitchin-fibre and inertia-sector compact cohomology representations, their gerbe local systems, centralizer invariants and Frobenius descent with fractional age Tate twists; the target takes direct sums over all ordinary degrees without cohomological shifts.
* Determinant variation of inertia-sector traces: lacks determinant-twisted stable Higgs moduli, their inertia-sector cohomology and the geometric Weil-pairing normalization.
* Character-isotypic mirror symmetry: lacks determinant-twisted stable Higgs moduli, their inertia-sector cohomology and the geometric Weil-pairing normalization.

The actual ungraded fibrewise Galois-isomorphism target also requires a geometric
comparison, or recovery of nonalternating multiplicities followed by arithmetic
semisimplicity. It asserts no derived or degreewise comparison. The canonical
stringy grading belongs to the separate Hodge-number theorem in README §5.2.
Equality of alternating traces does not supply these assertions.
-/

namespace TauCetiRoadmap.TopologicalMirrorSymmetryForHitchinSystems

end TauCetiRoadmap.TopologicalMirrorSymmetryForHitchinSystems
