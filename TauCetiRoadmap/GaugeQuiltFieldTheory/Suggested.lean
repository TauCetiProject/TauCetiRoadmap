import Mathlib

/-!
# Connected symplectic gauge field theory and quilted sewing: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib,
the headline theorems of the roadmap that are statable there: the twisted `SU(r)` relation model
of GQ1 and its quotient by simultaneous conjugation, with the genus-one point theorem, the
simple connectivity of every positive-genus quotient and the centrality of every stabilizer
(so that the effective `PSU(r)` action used in GQ2a is free).

Not statable at the pins:

* the connected field theory of GQ4–GQ5 (the functor from the decorated connected (2+1)-bordism
  category to `A∞(4)/S`): the pins have no category of three-bordisms decorated by bundles, no
  `A∞` categories (Tau Ceti has `A∞` algebras and modules only), no Fukaya categories and no
  quilted Floer theory;
* the smooth symplectic structure, the dimension `(2g−2)(r²−1)` and `c₁ = 2r[ω]` of GQ1: the pins
  have no smooth or symplectic structure on such a quotient;
* the elementary Lagrangian correspondences of GQ2, the relative-spin identity
  `w₂(TL_g) = p*b_g + q*b_(g+1)` of GQ2b and the Cerf invariance of GQ3: the pins have no
  Lagrangian submanifolds, no Stiefel–Whitney classes and no Cerf theory.
-/

namespace TauCetiRoadmap.GaugeQuiltFieldTheory

open scoped commutatorElement

/-- The twisted relation set of GQ1: tuples `(A₁, B₁, …, A_g, B_g)` in `SU(r)` whose ordered
product of commutators `[A₁,B₁]⋯[A_g,B_g]` is the scalar matrix `ζ • 1`. With
`ζ = exp(2πi d/r)` this is the relation level `R_g` of the fixed-determinant moduli
(Wehrheim–Woodward, *Floer field theory for coprime rank and degree*, §3). -/
def relationSet (r : ℕ) (ζ : ℂ) (g : ℕ) :
    Set (Fin g → Matrix.specialUnitaryGroup (Fin r) ℂ × Matrix.specialUnitaryGroup (Fin r) ℂ) :=
  {x | ((List.ofFn fun j => ⁅(x j).1, (x j).2⁆).prod : Matrix (Fin r) (Fin r) ℂ) = ζ • 1}

/-- The representation model `R_g / SU(r)` of the fixed-determinant moduli `M(P,δ)`: the
relation set modulo simultaneous conjugation, with the quotient topology. -/
abbrev relationModuli (r : ℕ) (ζ : ℂ) (g : ℕ) : Type :=
  Quotient ((MulAction.orbitRel (ConjAct (Matrix.specialUnitaryGroup (Fin r) ℂ))
    (Fin g → Matrix.specialUnitaryGroup (Fin r) ℂ × Matrix.specialUnitaryGroup (Fin r) ℂ)).comap
    (Subtype.val : relationSet r ζ g → _))

/-- Genus one: for a primitive `r`-th root of unity `ζ`, the twisted relation `[A,B] = ζ • 1`
has a solution in `SU(r)`, unique up to simultaneous conjugation, so the torus moduli is a point
(GQ1; Wehrheim–Woodward, *Floer field theory for coprime rank and degree*, §3). -/
theorem relationModuli_genus_one (r : ℕ) (hr : 1 ≤ r) (ζ : ℂ) (hζ : IsPrimitiveRoot ζ r) :
    Nonempty (relationModuli r ζ 1) ∧ Subsingleton (relationModuli r ζ 1) := by
  sorry

/-- Every element of `SU(r)` commuting with all entries of a solution of the twisted relation is
central. Equivalently the stabilizers of the conjugation action are the center `μ_r`, so the
effective `PSU(r)` action on `R_g` is free (GQ1, GQ2a). For `g = 0` and `r ≥ 2` the relation set
is empty. -/
theorem relationSet_stabilizer_central (r : ℕ) (hr : 1 ≤ r) (ζ : ℂ) (hζ : IsPrimitiveRoot ζ r)
    (g : ℕ) (x : Fin g → Matrix.specialUnitaryGroup (Fin r) ℂ ×
      Matrix.specialUnitaryGroup (Fin r) ℂ) (hx : x ∈ relationSet r ζ g)
    (u : Matrix.specialUnitaryGroup (Fin r) ℂ)
    (hu : ∀ j, Commute u (x j).1 ∧ Commute u (x j).2) :
    u ∈ Subgroup.center (Matrix.specialUnitaryGroup (Fin r) ℂ) := by
  sorry

/-- For every positive genus and a primitive `r`-th root of unity `ζ`, the representation model
of the fixed-determinant coprime moduli is simply connected (GQ1; Wehrheim–Woodward, *Floer field
theory for coprime rank and degree*, §3). -/
theorem relationModuli_simplyConnected (r : ℕ) (hr : 1 ≤ r) (ζ : ℂ)
    (hζ : IsPrimitiveRoot ζ r) (g : ℕ) (hg : 1 ≤ g) :
    SimplyConnectedSpace (relationModuli r ζ g) := by
  sorry

end TauCetiRoadmap.GaugeQuiltFieldTheory
