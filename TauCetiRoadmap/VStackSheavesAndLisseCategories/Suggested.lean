import Mathlib

/-!
# Artin v-stacks, solid and lisse coefficients: headline targets

The definitive roadmap is `README.md`. These suggested statements are not an exhaustive
checklist; proving them completes neither a layer nor the roadmap.

VS2.1's abelian category of solid groups, solidification reflection and derived reflection
onto complexes with solid cohomology are stated on Mathlib's `CondensedAb`,
`CondensedMod.IsSolid` and `DerivedCategory`. `SolidAb` is the native full subcategory.

The geometric headline results require carriers absent from the pins: VS0's smooth atlas
descent and partial-support vanishing need small v-stacks and their étale categories;
VS1's ULA/kernel-adjoint criterion, Jacobian criterion, Braden theorem and Drinfeld descent
need diamonds, relative Fargues–Fontaine curves and their coefficient operations. VS2's
solid sheaf homology and VS3's lisse comparisons need the enhanced geometric solid and lisse
categories. VS4's Newton-stratum equivalences and compact generation, and VS5's torsion and
lisse Bernstein–Zelevinsky duality, Verdier exchange, Künneth formulas, perfect-invariant ULA
criteria and scalar-change comparisons additionally need `Bun_G`, its strata and charts.
Tau Ceti's Huber pairs and smooth discrete representations alone do not supply these objects.
These results are not stated here.

VS2's closed solid tensor and analytic coefficient theorems require condensed derived
internal Hom, closed solid tensor and analytic measure structures absent from the pins;
an ordinary derived category alone does not supply them. The condensed cohomology computations
and finite-power Breen–Deligne resolution are inputs to solidification, specified in the README.
-/

noncomputable section

open CategoryTheory

universe u v

namespace TauCeti.Blueprint.VStack

/-- Integer-solid condensed abelian groups, on the pinned solidity predicate (VS2.1). -/
abbrev SolidAb :=
  ObjectProperty.FullSubcategory (fun A : CondensedAb.{u} => A.IsSolid)

namespace SolidAb

/-- Solid condensed abelian groups form an abelian category (CS Theorem 5.8(i)). -/
theorem abelian : Nonempty (Abelian SolidAb.{u}) := sorry

/-- Solidification is left adjoint to the native solid inclusion (CS Theorem 5.8(i)). -/
theorem inclusion_isRightAdjoint :
    (ObjectProperty.ι (fun A : CondensedAb.{u} => A.IsSolid)).IsRightAdjoint :=
  sorry

/-- Unbounded derived solidification reflects onto complexes with solid cohomology
(VS2.1, solidification; CS Theorem 6.2). -/
theorem derived_inclusion_isRightAdjoint [HasDerivedCategory.{v} CondensedAb.{u}] :
    (ObjectProperty.ι (fun K : DerivedCategory CondensedAb.{u} =>
      ∀ n : ℤ, ((DerivedCategory.homologyFunctor CondensedAb.{u} n).obj K).IsSolid)).IsRightAdjoint :=
  sorry

end SolidAb

end TauCeti.Blueprint.VStack
