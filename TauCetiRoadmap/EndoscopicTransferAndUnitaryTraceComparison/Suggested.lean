import Mathlib

/-!
# Endoscopic transfer and unitary trace comparison: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

No headline theorem of this roadmap is statable against the pinned libraries. The required
objects are not obtainable by a few definitions on the existing carriers:

* Layers 1–2 require continuous nonabelian and abelianized reductive Galois cohomology,
  stable conjugacy invariants, endoscopic data and normalized stable orbital integrals.
  Reductive affine group schemes exist in Tau Ceti, but these arithmetic and harmonic
  constructions do not. Thus the stable-class classification, Kottwitz duality and
  Fourier compatibility of transfer have no signatures here.
* Layers 3–4 require Hitchin stacks, their Picard actions, perverse ℓ-adic cohomology and
  endoscopic transfer factors. These are needed to state Ngô's support theorem,
  geometric stabilization, the fundamental lemmas and existence of smooth transfer.
* Layers 5–6 and 10–11 require local and automorphic admissible representations,
  normalized intertwining operators, stable and twisted trace distributions, Weil–Deligne
  parameters and unitary packets. These carriers are needed for the stable–twisted
  identity, trace-defined local Langlands comparison and conditional packet formulas.
* Layers 7–9 require tensor G-isocrystals, PEL moduli, Igusa varieties and equivariant
  compactly supported ℓ-adic cohomology. Mathlib's `WittVector.Isocrystal` and its rank-one
  classification do not supply these objects. The Igusa torsor comparison, stabilized
  Igusa trace and compact-unitary realization therefore have no signatures here.
* Layer 12 requires the Lubin–Tate and Drinfeld towers, marked modification spaces and
  their equivariant cohomology complexes. Tau Ceti's Fargues–Fontaine orbit topology
  supplies neither the relative structure sheaf nor the untilt divisor. The tower
  comparison, actual supercuspidal cohomology and basic Hecke identities need these
  additional objects.
* Layers 13–15 require the same automorphic and Igusa carriers to state pure unitary
  transfer, packet oldform dimensions, signed rational spectral factorization and their
  coherent exports. Numerical finite sums alone cannot state those comparisons.

The headline statements are deferred here until these objects exist; all remain targets
of their specified README layers.
-/

namespace TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

end TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison
