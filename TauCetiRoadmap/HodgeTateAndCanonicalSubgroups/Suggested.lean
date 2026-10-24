import Mathlib
import TauCeti.Algebra.AlgebraicGroup.Tangent.Cotangent

/-!
# Hodge–Tate theory and canonical subgroups: headline signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`.

The finite flat conclusion of Fargues's uniform Hodge–Tate cokernel bound (§0.5) is
stated below. For the coordinate Hopf algebra A of H, group-like elements are
characters of H, hence points of its Cartier dual. Their classes in the augmentation
cotangent space are the character differentials. Their span is the image of the
linearized Hodge–Tate map of H's dual. Finite projective Hopf algebras over the
valuation ring express finite locally free groups without a discrete-valuation
hypothesis. The norm inequality is equivalent to v(a) ≥ 1/(p − 1) when v(p) = 1.

The p-divisible Hodge–Tate complex and exact sequences (§§0.5, 2.4–2.6) need
p-divisible groups, their Tate modules and character maps, absent from the pins.
Harder–Narasimhan existence (§0.19), canonical-subgroup existence and integral
estimates (§§3.6–3.10), and the period inclusions (§4.6) need the degree and Hasse
invariants, truncated Barsotti–Tate groups and their subgroup filtrations. The relative
comparison and open-tower period map (§§1.1–1.5, 2.10–2.13) additionally need
abelian schemes, Shimura towers, diamonds and period sheaves. The modified lattices
and AIP torsor comparison (§§5.4–5.12) need the geometric canonical subgroups and
formal moduli spaces. None of these objects is supplied by the pinned cotangent
or Grassmannian APIs.

The logarithmic boundary-extension and perfectoid-basis theorems (§§6.19–6.32),
primitive and Riemann–Hilbert comparisons (§§7.3, 7.20, 7.26–7.28), and finite-level
canonical flag and cyclotomic Levi comparison (§§7.30–8.1) need log adic spaces,
Kummer sites, local systems and structural period sheaves. These are roadmap
targets rather than pinned library objects, so their signatures are omitted.
-/

namespace TauCetiRoadmap.HodgeTateAndCanonicalSubgroups

namespace HodgeTate

/-- The image of the linearized character differential, using the native augmentation
cotangent space and its map sending a group-like g to the class of g − 1. -/
noncomputable def characterDifferentialSpan (R A : Type*) [CommRing R] [CommRing A]
    [Bialgebra R A] : Submodule R (TauCeti.Bialgebra.CotangentSpace R A) :=
  Submodule.span R (Set.range fun g : GroupLike R A =>
    TauCeti.Bialgebra.cotangentMap R A (g : A))

variable {C : Type*} [NormedField C] [IsUltrametricDist C]
  [CompleteSpace C] [IsAlgClosed C] [CharZero C]

local notation "𝒪" => Valuation.valuationSubring (NormedField.valuation (K := C))

/-- Fargues's uniform cokernel bound (§0.5) for finite locally free commutative
p-power groups over O_C, for every prime p and arbitrary height n. -/
theorem farguesHodgeTateCokernel_finite (p : ℕ) (hp : p.Prime)
    (hnormp : ‖(p : C)‖ < 1)
    (A : Type*) [CommRing A] [HopfAlgebra 𝒪 A] [Coalgebra.IsCocomm 𝒪 A]
    [Module.Finite 𝒪 A] [Module.Projective 𝒪 A] (n : ℕ)
    (horder : Module.finrank 𝒪 A = p ^ n)
    (a : 𝒪) (ha : ‖(a : C)‖ ^ (p - 1) ≤ ‖(p : C)‖)
    (x : TauCeti.Bialgebra.CotangentSpace 𝒪 A) :
    a • x ∈ characterDifferentialSpan 𝒪 A := by
  sorry

end HodgeTate

end TauCetiRoadmap.HodgeTateAndCanonicalSubgroups
