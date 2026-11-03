import Mathlib

/-!
# Hermitian K-theory of Poincaré categories: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file states the roadmap’s headline theorems against the pinned APIs;
none of them is statable at the pins, so it declares nothing.

The spectrum-level headline results are not statable because Mathlib `6b7abb3`
and Tau Ceti `a91d3aa` do not supply the stable perfect-derived enhancement,
invertible coefficients with involution, Poincaré categories, or GW and L spectra.
These missing carriers prevent statements of the Tate-collapse and shifted
classical comparisons (Layer 0), Bott–Genauer and Karoubi periodicity (Layer 1),
relative Lagrangian surgery (Layer 3), quadratic surgery and Ranicki's short-complex
comparison (Layer 4), connective ring-spectrum surgery and the comparison with
π₀ (Layer 5), symmetric surgery (Layer 6), the genuine-to-symmetric and field
L-group comparisons and multiplicative L-to-Tate refinement (Layer 7), and the
classical GW fibre sequences, splitting and comparison ranges (Layer 8).
The odd-formation comparison (§4.5a), Segal–Lin and ko Tate calculations
(§5.1a), Laurent splitting and normal/comparison-fibre theorems (§7.3),
and derived form-parameter extension (§7.7) also lack these spectrum or
Poincaré-category carriers at the pins.
Layer 2's symmetry and quadraticity bounds share the missing Poincaré and spectrum
carriers. The enhanced Postnikov statement needs the stable perfect-derived
enhancement. Ordinary chain-complex and resolution infrastructure is specified in
the README.

The finite-dimensional quadratic Arf algebra over `𝔽₂` used in §7.9 is
GeometricTopology's (its declared gap `gap:finite-quadratic-arf`), so it is not
stated here. What §7.9 owns, the identification of the degree-zero quadratic Witt
quotient of `(D^p(𝔽₂),Q^q)` with the classical quadratic Witt group and the
computation `W^q(𝔽₂) ≃ ℤ/2`, needs the Poincaré-category carrier, which the pins
lack. Tau Ceti's `WittRing` requires invertibility of two, so it cannot express the
characteristic-two Witt quotient either.
-/

namespace TauCetiRoadmap.HermitianKTheoryOfPoincareCategories

end TauCetiRoadmap.HermitianKTheoryOfPoincareCategories
