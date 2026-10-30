import Mathlib

/-!
# Chromatic homotopy theory: target signatures

The roadmap is README.md. This file is not the roadmap. It states the roadmap’s
headline theorems against the pinned APIs whenever their actual carriers exist.

The following headline theorems are not statable at the pins:

- Homotopy-unital magma T(n)/K(n) acyclicity (§3.3): missing derived spectra, homotopy-category units and multiplications, Morava theories and telescopes.
- All-spectra finite localization, compactly generated kernel and smashing (§4.1–§4.3): missing derived spectra and homological localization functors.
- General homological fracture (§4.4): missing spectral reflectors, their units and homotopy pullbacks.
- Bousfield–Kuhn existence and finite-source uniqueness (§5.1–§5.2): missing pointed derived spaces, mapping spectra, telescopes and spectral localization.
- Suspension–loop detection (§5.3): missing the derived spectral suspension–loop adjunction and T(n)-localization.
- Generalized Serre filtration with monodromy and convergence (§6.1): missing spectrum-valued fiber local systems and their filtered homotopy colimits.
- Fiberwise generalized homology equivalence (§6.2): missing spectra and their smash with suspension spectra; the pinned Eilenberg–Steenrod homology pretheory has no excision axiom and no weak-equivalence invariance, and neither library has homotopy fibres of maps of spaces.
- Finite nullification and its periodic comparison, connective periodic vanishing, including arbitrary-endpoint maps with the relative height-zero condition, and suspension–loop preservation (§6.3–§6.4): missing unstable periodic groups, derived space fibers, finite nullification and the finite-local spectral tower.
- Marked Morava E realization and coherent stabilizer actions at every finite height (§7.1–§7.2): missing E∞ ring spectra, marked spectral realizations and coherent actions.
- Uniform geometric-height locality for every homotopy-unital action (§8.1), including coherent modules of an E₁ refinement: missing oriented ring spectra, spectral actions and Johnson–Wilson localization.
- T(n)/K(n) comparison on chromatically local spectra (§8.2): missing spectral chromatic reflectors and their natural transformations.
- Height-one telescope equality (§8.3): missing the two spectral local categories and height-one spectral detectors. Higher-height separation belongs to ChromaticHomotopyTheory, Part II, as specified in Scope and ownership.
- Chromatic support and inversion comparison for BP truncations (§8.4): missing BP-module spectra, their truncations and spectral localization.
- Localized transfer criterion and telescopic Tate vanishing (§9.1–§9.3): missing coherent finite-group spectra, normalized norms and Tate cofibers.
- Raw finite-local Tate blueshift (§9.4): missing coherent finite-group spectra, raw Tate cofibers and finite-local reflectors.
- Nonzero raw KU Tate spectrum and its Euler-inversion calculation (§9.5): missing the KU spectrum, its derived completion and the spectral Tate construction.
- Higher semiadditivity of T(n)-local spectra, the weak-ring finite-Postnikov criterion and the sharp connectivity bound m=n+1 (§9.6): missing spectra and their presentable stable ∞-categories of local objects, ∞-categorical Kan extensions along maps of spaces with their Hopkins–Lurie norms, Morava K-theories and finite type-(n+1) spectra.
- Hahn Dₚ upward acyclicity, relative Dₚ-E power operations and the E∞-ring height threshold (§10.1–§10.3): missing spectra, cyclic extended powers, absolute and relative Dₚ-algebras, E∞ ring spectra, the Tate-valued Frobenius, H∞ orientations of Morava E-theory and telescopic height detectors.
- Dₚ Tate height converse and the local homotopy-E-algebra intermediate comparison (§10.4): missing homotopy spectral algebras, trivial coherent actions, Morava E-modules and Tate-localization comparisons.
- Positive-height real Bott inversion for every ko-algebra (§11.1): missing ko-algebra spectra, relative spectral tensor and Bott inversion.
- Elliptic spectral affineness (§12.1): missing spectral ringed stacks and quasicoherent spectral module categories.
- Chromatic comparisons for tmf, Tmf and TMF (§12.2): missing the three modular-form spectra and their spectral localization units.
- Faithful full-level spectral Galois extensions for every N≥1, including the small-level stack cases, and supersingular comparisons (§12.3–§12.4): missing spectral level stacks, E∞ spectral algebras, relative tensor, Morava E-theory and coherent fixed points.
- Hopkins–Mahowald completed Thom equivalences (§13.1–§13.2): missing p-complete spectra, spectral units, E₂ Thom rings and nilpotent space completion.
- James-filtered mod-p and integral Thom colimits and chromatic acyclicity at every prime (§13.3–§13.4): missing completed E₁ Thom spectra, homotopy colimits and Morava homology.
- James splitting acyclicity application (§13.5): missing reduced suspension spectra and the stable James splitting.

The pinned algebraic formal-group and ordinary category-localization APIs do not
provide these spectral carriers. Formal-group point identities and arbitrary
Prop-valued replacements would not state any of the headline theorems. The finite
stable, nilpotence, coefficient, Bott, James and elliptic-sheaf constructions
consumed by the roadmap retain their named supplier ownership in README.md.
-/

namespace TauCetiRoadmap.ChromaticHomotopyTheory

end TauCetiRoadmap.ChromaticHomotopyTheory
