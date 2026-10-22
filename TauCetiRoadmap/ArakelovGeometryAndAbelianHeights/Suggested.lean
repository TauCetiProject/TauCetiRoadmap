import Mathlib

/-!
# Arakelov geometry and heights of abelian varieties: headline targets

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; proving the statements in this file would finish neither a layer nor the roadmap.

No headline theorem can be stated against the pinned Mathlib and Tau Ceti interfaces:

* Layer 1's arithmetic divisor–hermitian Picard comparison, arithmetic cycle pairing and ample
  Northcott theorem require arithmetic hermitian bundles, Green functions and metrized
  line-bundle heights. Ordinary invertible sheaves and relative tuple heights exist, but do not
  supply these objects.
* Layers 2–3's integral Hodge-line duality, base-change correction and geometric stable height
  require the invariant-differential determinant, Néron models and the Faltings integration
  metric. Tau Ceti has abelian varieties and isogenies, but lacks these arithmetic objects and
  the semi-abelian families used in the extension theorem of §2.0.
* Layer 4's isogeny formula, half-log-degree bounds, dual-different identity and squared
  Hodge-line isometry require the metrized Néron Hodge lattice and its determinant different.
  The component-height comparisons also require dual abelian varieties and integral
  eigendifferential quotients with their pairing metrics.
* Layer 5's logarithmic-metric Northcott theorem, boundary growth, exact modular-height identity
  and theta-height comparisons require metrized arithmetic lines, semi-abelian families,
  integral Siegel compactifications and good translated theta bases. None is supplied by the
  pinned interfaces; the modular discriminant alone does not define these heights.
* Layer 6's Zarhin height identity, polarized moduli finiteness and Bost's uniform lower bound
  require the stable Faltings height, duality and polarized moduli. The bounded torsion-field
  extensions additionally require abelian-variety torsion and semistable reduction.

These constructions are the mathematical targets of the numbered README sections. They cannot
be replaced by a few definitions on the available carriers, so there are no compiled theorem
statements here.
-/

namespace TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

end TauCetiRoadmap.ArakelovGeometryAndAbelianHeights
