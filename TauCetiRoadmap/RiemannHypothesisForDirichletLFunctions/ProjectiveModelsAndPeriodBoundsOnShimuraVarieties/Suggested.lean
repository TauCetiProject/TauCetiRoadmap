import Mathlib

/-!
# Projective models and period bounds on Shimura varieties: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about semi-abelian schemes, that is smooth commutative group schemes
whose fibres are extensions of abelian varieties by tori (ShimuraCompactifications §6.1), and about
their Hodge bundles `E = e^*Ω¹` and Hodge lines `ω = det E`; two of them are statements about the
integral models of PEL-type Shimura varieties and their toroidal compactifications
(ShimuraCompactifications Layer 7, PELModuli Layers M0–M2). Neither Mathlib nor Tau Ceti has these
carriers at the pins: there is no torus over a base scheme, no semi-abelian scheme, no Lie algebra
sheaf or Hodge bundle of a group scheme over a general base, no integral PEL datum with its
similitude group scheme, and no PEL moduli scheme or toroidal compactification. Tau Ceti has group
schemes over a base, abelian varieties over a field (`TauCeti.AlgebraicGeometry.AbelianVariety`),
invertible sheaves and vector bundles on schemes with their degrees on curves over a field, the
absolute ampleness of a line-bundle class (`TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple`)
and normalisations; these are ambient carriers, and none of the headline objects is built from
them.

* Seminegativity over curves (6.2a): for a smooth projective connected curve `C` over an
  algebraically closed field of characteristic zero and a semi-abelian scheme `G → C` whose generic
  fibre is an abelian variety, every locally free subsheaf of `Lie(G/C)` has degree `≤ 0`, and the
  Hodge metric of a polarisation of a semi-abelian degeneration over a smooth complex variety with a
  normal crossings divisor has Gram matrix entries `O(1 + Σ_j|log|x_j||)` near the divisor and is
  bounded below there by a positive multiple of the identity. It lacks the semi-abelian scheme, its Lie algebra sheaf and Hodge bundle, the Hodge
  metric of a polarisation on the analytic family, and the frames of the extended Hodge bundle.
* Ampleness of twisted Hodge lines (7.17a): on the projective toroidal models in the good-prime
  singleton setting, in particular on the smooth integral toroidal model at a good prime for a
  smooth projective cone system `Σ` with polarisation function `pol`, and on their generic fibres,
  `ω^{⊗a} ⊗ O(−Σ_ρ d·pol(ρ)D_ρ)` is ample relative to the base for every sufficiently divisible `d`
  and all `a ≥ a₀(d)`. It lacks the PEL moduli space with its integral toroidal and minimal
  compactifications and normalised blow-up models, cone systems with polarisation functions and
  their boundary divisors, the Hodge line of the universal semi-abelian family, and ampleness
  relative to a base.
* Global normal projective models (7.31a): for an integral PEL datum of type A or C satisfying Lan's
  condition, its similitude group scheme `G` over `ℤ`, an open compact `K ⊆ G(Ẑ)` neat away from
  every prime and a number field `F` containing the reflex field, the generic fibre `Sh_F` has a
  smooth projective toroidal compactification and a normal model projective and flat over `O_F`
  carrying a semi-abelian scheme that extends the universal abelian scheme with its endomorphisms
  (and, for a self-dual lattice, the rigidified symmetric cubical line bundle of the principal
  polarisation), and normalisations of its components in finite extensions are models of the same
  kind. It lacks integral PEL data and their similitude group schemes over `ℤ`, neat open compact
  subgroups of `G(Ẑ)`, the PEL moduli space with its universal abelian scheme and its toroidal
  compactifications, semi-abelian schemes, and cubical structures on line bundles.

The other targets are not headlines, and none is statable at the pins either. The logarithmic
periods 6.7a, the conjugate data 6.9a and their hypotheses on the global model 7.12a lack the same
semi-abelian carriers as 6.2a, and 7.12a also the cubical line bundle of 7.31a. Kempf's descent 9.1
is a statement about an integral projective scheme over a field of characteristic zero with an
action of a finite group, its affine quotient and a linearised line bundle whose inertia groups act
trivially on the fibres: Tau Ceti has the affine invariant quotient by a finite group and the
descent of quasi-coherent sheaves, but no linearisation of a line bundle, no inertia group of a
point of a scheme with a group action, and no quotient of a projective scheme by a finite group,
and the affine case alone would be a different, weaker statement.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.ProjectiveModelsAndPeriodBoundsOnShimuraVarieties

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.ProjectiveModelsAndPeriodBoundsOnShimuraVarieties
